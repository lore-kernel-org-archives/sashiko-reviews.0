Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432C11A9F85
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 00:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788482470; cv=fail; b=dzPF1jwqE0OP3k7E2a5Ui7YUR+NH2vUZIot+yMO3m4HXQdDX0FMnWi6I2KmRQEvNRh1Wey3mgBUw30kjEPzKrezA9Bhm37dj8lsW6D2PBTxx0IqE5aC0nRmLRJyNLAWyct1uMnwr056UNg26eMuI++5G+cN3cqnEEUPNj7w2wuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788482470; c=relaxed/simple;
	bh=zmy0f/6GzZnZhX/Jh/zXvBvXj/dlAp1zwZ3W+kN0XUc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HLAwbs7V4SvrqYkGJbzEQcI88Ioq5Vv60F4Im8p+1S1h+gnjf/aNkL2PfdLiZJsmi3We8Dqw4iCjfqQrRQQyIMYlMVk4pSg1zlw78bYTUvz0+rQr8jjEx2OTmbXYvD28VTzYnLwGmy1th04L6iopxsZ9RDdO++KNFSZIjgDbkvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxnMLy0y; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxnMLy0y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788482468; x=1820018468;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zmy0f/6GzZnZhX/Jh/zXvBvXj/dlAp1zwZ3W+kN0XUc=;
  b=JxnMLy0y3z0f6dVRD+9e7Pyojvy2TwWZDt2c+DdLxfCy//PNrgVj+Bt9
   0iaGkiyAN3fJJr3LKisRMPKB4LewRuqhipRbYjqB2kGR/wL3ASDtxAnTd
   PhHuX389sDx8ZdMIG7qADU8KdfCmNagyE3gsnQM3gKhbglJlsGuA10K6m
   NHsrB36Jgnne8i8tMbE4dujHyt1aCeBSuxvaZbLU9GiwDy8dyiPRJupgk
   bFBWAnUpPogOHViCsfDBTw6ZzaQsjaMWNU/mqoJyPqSzZg1dP3Apf9a//
   F7Kgu1cZ7gonIyLP8DWE6pyvuaUe0wkLWOSkraVEp/0HXfC5cWiVVee8a
   w==;
X-CSE-ConnectionGUID: obf35bITR6yy1BaTRNhd3A==
X-CSE-MsgGUID: D3LUjddrTC6HhJ0DAhEjVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100340216"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="100340216"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 17:41:07 -0700
X-CSE-ConnectionGUID: HVbc/iUKRzGviD5XGzcnpA==
X-CSE-MsgGUID: sDe72bySQZ2hMs3BD5fh/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="308104958"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 17:41:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 17:41:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 17:41:06 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.44)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 17:41:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7eHhMij7refM1F+Sddee/F4dIP3u2rkaz+4V2rPbTzU7mcMyxCYFOfmdiBxDpkPc66RTRw413IepVjQGMrF2aklMibC7hTZnsrlxx1Jq5PQo3Q8pWevNePqEgs1+Bv6kJC9chQf9YXns9GkGHqTQ4GPSb9Z9auRd4lOIACKmgfgbUh1HAEwx5ikhvO0BY5dRYre7NHdiVP/cDILe7aR0HcH3B/Ti32xCN2XbYa7IQzhMeY+lNDLBdLDbjvZOTVysK55KoPqC+19zKpR9bwuYbADH0VQxZSzQMxsTaTlVBFj6EokGVQgXNIzYlBec2uKI6UA52hh+Ix/+QtBD5RB1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FegQQKzk99tDfUOCkw9oiajHJTgIGAZWPiEkwaeV38Q=;
 b=S8iBiIH8Ewh8n4zZ2VgKI6DH0Kxb6oIez3LeSwVOikJH0uQtKRvYPuzhxpZztspWFDEblgoHSzMdr/Ktvb29diU2pXUHdqW79w4obIBqbqbiBJo5iJsqJPBxaZ1SMVeL2QZHOwsAweH/aFb/Yq38kHF6am93v4kAd9ylfkjDIlqm34ZMUw6Ezb+S93LXPUijZQuzwwWkHL0XrcjTWHlH9hTIjIsVqm5T25k1al35Z6p8DnHXn64u37lTkee7P+U7BS2HokgcJtAK1zLp5ecG6wUvfaCkNMxjfKd0Q5HEPitnPZrchB7ea540PZSvGgmglvehbq4XgxJ5teKhM5H3sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB9523.namprd11.prod.outlook.com (2603:10b6:510:3b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 00:41:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 00:41:05 +0000
Date: Thu, 3 Sep 2026 17:41:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 06/25] drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
Message-ID: <apoTnkuBJBRZp2t6@gsse-cloud1.jf.intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-7-matthew.brost@intel.com>
 <20260904001827.6B0BD1F00A3E@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904001827.6B0BD1F00A3E@smtp.kernel.org>
X-ClientProxiedBy: MW3PR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:303:2a::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB9523:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da4d5c5-5812-4a5c-bb89-08df0a1d33e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: MvrvOBMbc455F98JXqaOkAgl9QyzjtWgp0iIwyMqQZISXCV/Pid4P/d5UguFm+K7FTce3N6IZLY6vVaYBA/3nF2pT1cGb4vI1SmROIqGSjmDsHBJRXb/TvTKf/tZPUl8jIEbLluHyry4voin2mqaOrjXzKami6oxVCUghNKinlTTOazg2xzqDJLST/yqE+cFF1tqQGGk+GJLn5+NWlBmRA0guUCJTcN4z7nxPxc1eJWApySqM8q4RrTNauaJTexMi8pHk9hVZyICsQ11N3btDutNglCT08ZKY0mVvZcSFtEIVNcWbVob7cXBAxhu1Ymb33JziLEbu6Gfj6Nm4jNIoG2n+MkljARePR+FbMEytgN7ddHscKtbV8ucS9zaP8QfM7OERDlX92sZxh2CLfdzD2XRleesQTGvNfEs6CU5wRT99DHc4xygeYHu8e5su457whsPaQRwxZTC1qqDHSu4M55+MQTASr5KoDdGj7IhYEPXKMKxcErw34VJ/P6rIsb77sP6ZvdY7zs3xsSHp6k6orf8YkwcgVkJocL5FG1lHU1EQbU+tcSmwpQ8nSQ+u2q0rJJYeIo39Zjf/OT9LAJAND09yxBuUyp2Nu+thayMEio=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GU3cjXpV1+di8yCe4EiWqyXFSrxuRhdRjsa9xLLIeU5Dl0swum/n4RoRSz?=
 =?iso-8859-1?Q?s7ZBGrf6Ci3xp0Aug+umvs7qcnSqWMGtGbZXPitP1ciCEdJxSZI9S0DGzR?=
 =?iso-8859-1?Q?YNeqdsY4ZkTh8sPNsuwFIXsWrMGy86GL2++2oAc34WRcdZ8dSbcqHlQYsO?=
 =?iso-8859-1?Q?plOSRI7j10vLJJ7fCvEOTNf39A3F7htvCPYM8Zu73zvFUd5VeWSD2y4vjQ?=
 =?iso-8859-1?Q?D8vK16Om+HA3ph6U2jqCMGLL283GgCef40hCKkDY6cqBKEETUlt5j9nmkU?=
 =?iso-8859-1?Q?M0nR+vxcIuWx9kPLoAQ8mghmPfP0ubfPszNOW8GOx3HRV2/J6zYEeBTN96?=
 =?iso-8859-1?Q?7KY2oJBA+it7ta5YlCrmhPXhSsguwG17PIVZzmSD2elZrqPhQl1YZ4Ntq2?=
 =?iso-8859-1?Q?hwRjhxQzkJWJQKQu5tgOm9wKG1RppKQD1I8Sy681b3XtOQ0BFyr8XAWCFd?=
 =?iso-8859-1?Q?tH+xfSArqwbQ8oCvKCbgHepirmEqsAhuk/gYJi6/bga4gns3C2pKRiy6iL?=
 =?iso-8859-1?Q?82HISENdsmjsbMhQsuYtZWRdz0CDW6lfLiB1zgK8HlmN1b73vE2KnrQY4X?=
 =?iso-8859-1?Q?3sHgUK2xGZlW0F9c7Z+agaA2P2EaMWImOlLAcYGoMs0PIV4PBmEofPB8Z8?=
 =?iso-8859-1?Q?eg8Ss1S0H08CZDPLj1Zi5ojFu00mLpVimt0HWcO45utZ5DPuYYJCT19aw2?=
 =?iso-8859-1?Q?GVFtMltVprMkrJUFluusk93q0ha/jDzdvIFUm8ojbWoHTiXkRqaDILxivx?=
 =?iso-8859-1?Q?7zwinZonIk1mbrgRMS3yPFcDaAhDCOugB5oyTNWFXZS0YucNdUgVqY9UJT?=
 =?iso-8859-1?Q?mBoNKtZrttt61HFBAdieLxC8vyLfudYn7LSTwcpVE2AX1u+S8Bdm2S8/ae?=
 =?iso-8859-1?Q?bMjez/g09Xz2xMUBrdTFlZuqcPA3LKIZhFu8A7smiurElKWQM/w7AG9yqa?=
 =?iso-8859-1?Q?vXXqo93YEIT7X6UXhWIgtXVB5QMc5Sus5B9LDND7YfN4Gzw/9GD7MZV7ix?=
 =?iso-8859-1?Q?Y4JQVeld/zaex8/IIVcqYpPpbNV0Y8+rgohPxR2Ym89EPCoRmimDdZKav4?=
 =?iso-8859-1?Q?/BG3hBlWWJ+blfj800tibuBrNuEAeukQLwB4e1B2ATcNgh6kJCL1xQZyQ0?=
 =?iso-8859-1?Q?OwWHi802pw1GCLhk4R21nqOCkGi0nS+6eD+/wBpERLV/VmdefU6ALPZMkl?=
 =?iso-8859-1?Q?CE4ybNjyFjd1vHKetjru2BtXdTLE5Saz3IdehuGB0l6fKmaBMO7jnna9L5?=
 =?iso-8859-1?Q?IffPwOvdoCFw6jxyvvNiVCgqBY2hcHU7hRCHSprXF+WnZeinmsnhcypNC2?=
 =?iso-8859-1?Q?jwtLcxt96Xu46DqOagZJIVC6zlkYYpVYfjZRfZV8VJSc6NoF/Z5BaKKZHl?=
 =?iso-8859-1?Q?RWJyZExA+iTlrjrEoIK6bi+5scy/Fk4LVG1+dgAfABhQgVrCjL49RQmaEk?=
 =?iso-8859-1?Q?ECK4z2t0X3eJou6lNC2DhV5RAG1/qutJdEC8Np4YU6WV9l8i0VyaKp+v0t?=
 =?iso-8859-1?Q?iPt3krrYfJqv28sLEht7G7006PZzarLINwF+U4VGGdSNDxsy8q7kWwEcmV?=
 =?iso-8859-1?Q?xm0psl11DUZQS96CQANbjQ9kKKJhJ0Yk5LbArbMo02ajtJfZSUInkRV3gP?=
 =?iso-8859-1?Q?mP7GzEx8QH0Yt/UMJUPGjauuy18/29aiygG2QdN0qFn8U3To3VWcWGJ/i4?=
 =?iso-8859-1?Q?NBzB7wZsdzRZD1xGI8JcNx0/+o/B7ZjCpJm5IQsAyjPV/yjM91TknaG+zc?=
 =?iso-8859-1?Q?Ie6ICDBaKFrk0zXMYqxWWsVqORAZGOKxdRbZKyiunYqHMEtJU2lfBMSfO2?=
 =?iso-8859-1?Q?l0USsWb7r+9EAP5SsxFPv0xfa3pQefU=3D?=
X-Exchange-RoutingPolicyChecked: GN43xyasU3nVW0FFY0jfM3TM/E12MpxVz3A7cLewsG6prYOBA0EeHVD1H8Gz5lo1gGj9aMxWyTN1EkKSGMJsyBveSroJwZ4KTry+hZBx9IBIbvZcuZqKBtuUF9hq83ctQdZ0z/Q9dcDh+7pPiQ9Ssl05qoj8deiTA4SlzivrVCKqPNHKESMX3lJEbCXi/ptkp5S/8hjHdgAn0uXyZL7diR/pnlLDjJOYUOm6j8WL6JlletNOcyP2ZvOSl5LZzaoUwTOnKTynfe/6ILmpOhRCdI7rMG1KdCWZygaMsLzM0OYyKaZ1zjF4eok55gvqdILaEZPYIUvbQrOqzI4CojL4Rw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da4d5c5-5812-4a5c-bb89-08df0a1d33e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 00:41:05.3077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPyWjHFcMKM4xWyohrJv01bcCyVSkWpGqSLLGfd7AYU3enxjpEgHIw4S7ZQGf3t/s9Sed1cfPzGIILj4qgVa3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9523
X-OriginatorOrg: intel.com

On Fri, Sep 04, 2026 at 12:18:26AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The XE_BO_FLAG_PUT_VM_ASYNC mechanism causes VM reference leaks if xe_bo_put_async() is called when the BO's refcount is greater than 1.
> - [High] Dropping the VM reference synchronously in xe_bo_put_commit causes a Use-After-Free of the shared dma_resv object if TTM defers destruction.
> --
> 
> commit 73ce65401a8053bf565b7b064086594d1dafb49a
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
> 
> This commit introduces XE_BO_FLAG_PUT_VM_ASYNC, which indicates that an
> async BO put must also drop an additional reference to the BO's VM. This
> ensures the shared dma-resv object does not disappear before the BO when
> a kernel BO is put asynchronously.
> 
> Link: https://patch.msgid.link/20260228013501.106680-7-matthew.brost@intel.com
> 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index dde309821237b..5cde5dff2d481 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -3989,8 +3989,14 @@ void xe_bo_put_commit(struct llist_head *deferred)
> >  	if (!freed)
> >  		return;
> >  
> > -	llist_for_each_entry_safe(bo, next, freed, freed)
> > +	llist_for_each_entry_safe(bo, next, freed, freed) {
> > +		struct xe_vm *vm = bo->vm;
> > +		bool async = bo->flags & XE_BO_FLAG_PUT_VM_ASYNC;
> > +
> >  		drm_gem_object_free(&bo->ttm.base.refcount);
> > +		if (async)
> > +			xe_vm_put(vm);
> 
> [Severity: High]
> Does this code leak the VM reference if xe_bo_put_async() is called when the
> BO's refcount is greater than 1?
> 
> If xe_bo_put_async() is called while concurrent paths (like show_meminfo or
> xe_bo_evict_all) hold a temporary reference, the BO won't be added to the
> async_list.
> 
> Later, when the temporary reference is dropped via a synchronous xe_bo_put(),
> the BO is destroyed by xe_ttm_bo_destroy(), which only drops bo->vm if
> xe_bo_is_user(bo) is true (which is false for kernel PT BOs). Thus, the VM
> reference could be permanently leaked.
> 
> [Severity: High]
> Can dropping the VM reference synchronously here cause a use-after-free of
> the shared dma_resv object if TTM defers destruction?
> 
> In xe_bo_put_commit(), drm_gem_object_free() drops the GEM reference. If TTM
> concurrently holds an extra reference to the BO (e.g., via
> ttm_bo_get_unless_zero() during an LRU walk), the BO will not be immediately
> destroyed.
> 
> However, xe_bo_put_commit() continues and calls xe_vm_put(vm). If this drops
> the last reference to the VM, the VM and its embedded resv are freed.
> Because the BO is still alive and bo->ttm.base.resv points to the freed
> vm->resv, TTM might later attempt to use the freed reservation object.
> 

I don't think this reasoning is 100% correct, but the reinit of the ref
count is indeed dangerous. I'll rework this part.

Matt

> > +	}
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260903235842.3401722-1-matthew.brost@intel.com?part=6
