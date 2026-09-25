Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68751922FD
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 05:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315932; cv=fail; b=SXn6qheOmGn1atUDEI8T96D/VmBbzFAV20J3J9jURL05xyXKeGGvKdmo9W6ksV4CpSdpf6t/oc5RceASl6XZ3yYpdq5NKcXDZ1D0/et79Tfj2TdFxYI0RnnPxr8UQupXlN1U/aF1DLciUjH8jzuLBfPE+z5+PsnI0OBSaolvT7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315932; c=relaxed/simple;
	bh=XjtlxPbJcUQ8BVP3CPQVvn20lbIHQT07RxFKumPy1Dc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=quYs47V7a2Iu8pP1CwbiRCmVU42YydV1S8iNC5AMEWZH/Ug75oE9B5SgTP1hb167M+0ltPfoKDck1v4ockKUbzqhqgYE3dBEiTZGW2BMGoN4lJaZbrTu/KyQLQYjjpmKcZxwFWqqVekYRRpo9pEHPryxMiq2GM9AnCNlDD9CIc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miQVaA7y; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miQVaA7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790315930; x=1821851930;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XjtlxPbJcUQ8BVP3CPQVvn20lbIHQT07RxFKumPy1Dc=;
  b=miQVaA7y/BGwLCj10Sj3X3UJRhbDmIGyiSNY+xMwY9lADkztEl+g1+A0
   jZOJrG0YQ8CBay7dD2jxkmbPSPtoNBEeI9tB47V1Osp5yEw5Lf6KVk4a5
   ctU0D9lbuaaS6ev+UVmnVZwg8wtoB7WbuvqVPgr6Ljt4vsNBdVFd8JhSl
   BkxAb9hzkU39gjFXPXq5rPyH+gFRhe+Lq0YT3l5hQxP89jAckELdegEdS
   avVW+7Ya9gVaQ17PGEUKTMbWRl4YYA6fr9mVL/5n458uVJGD29WX0uFzT
   2jAtWyiuJJEwB6fwVm9hjOiRvARLBz8WA8wLqRtWcy5xAmVJNCZero9uk
   w==;
X-CSE-ConnectionGUID: 7xSZKZK/RBqZytBV5OleOA==
X-CSE-MsgGUID: 2QdbW0rKTrO65mBHDE6c3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94915946"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="94915946"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 22:58:49 -0700
X-CSE-ConnectionGUID: sJ3VTeg4S2WoEvhWGFDS6g==
X-CSE-MsgGUID: 20NFgrB+RnmJ8NT3Hm4UWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="300512825"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 22:58:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 22:58:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 22:58:48 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 22:58:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f05a6p0F9kktJpz8UaDpUQ+vHtxGU3jG44+VpM/9O75PggBYAK1vS2mdE5bGqKFyU4jRpl9WQgKVXaUFU3Y0nfB+VwitUyORSbAPUKeFTc2AWGoMtIPDXfpLKVTAS6yN5+pEwPKVaWoteuTSP5w8cM9YA3bgU/2sRIhWkPUvoskTqdQ+PSShA9F+0C++nhwpc4TzRdHRA+C0Bs7oUV9WmcyInvSNmzpZ35BWv8RxrVwY780ZnGzpyOVJv9oAGuZj9yY16OrQ1oe/oxw21YA8ha9h8k5jPnZDTdoEpRij2keliopa1Tz+zBQH5l96t9d116TWEsldgDl3LsSHr2h7UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvMW85Ht0/KQuuWQw1W4D6SDp6SFVuuWLE98xNpNrRo=;
 b=Sck0BRaaUTINn/Vz3YqPg6csNqrfyCq9G0UEtWL+Xr5AbePRI6EMBGINEki6w8scL4rVQujq9aOB81Jj4428qyeUTl1wQuULyY+6YEjM8p2ZgmglAu6XvnFKr9+5YC/KZk2oVceRgWGjoCg/ZMG4Lxe//0ECX2nkwr+0bFRMTxWKRe8P+86T5V5ZHb9FDvN+amjIJ4MdNXgxvB4fimWopxP1C/FZAJ3SplVifYoy2KoBY0l8aVnb9ZowGcdFFmjXSgrRZfejTR+3rS+lhmzmf/ikguJVWsYsXMS347ssC7jchzG2cPDsq1f2e3MIsfd/usDJpX4yAPrDOpJFp+fVvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 05:58:46 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 05:58:46 +0000
Date: Thu, 24 Sep 2026 22:58:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 10/24] drm/xe: Update GuC submission backend to run PT
 jobs
Message-ID: <arYNk+t/VF3pzKTP@gsse-cloud1.jf.intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-11-matthew.brost@intel.com>
 <20260925053914.AB5431F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925053914.AB5431F000FF@smtp.kernel.org>
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|PH0PR11MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: 740c266a-741e-48b0-67dd-08df1aca0faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|5023799004|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: J2QfrJp0vlVLFMXQqMOG8CiqGCcVhLOEnzBqP9RS2fbVVyE2/66hWLZKQ3XnWSZW4JTEaNVtSe9tcGdetRauOXtA9P9IUEye/67qecAYkAGzeH0EMCoeQLsymNdTMQV9fqIkPaXh4CIFhx6EOd2yb9Mff8sFsSoRdIK/8rgxibKDCxwC1SGA6IFRRLmntTuZtaAm8Ybe/kT4Zx2FSZhACbUroEoQxAGiWOHcimIrFybGuUI2HCiJYiBy2N1huR7jVfJFZ0p4r75ks7GoVbIOk29AyukVNF6Vv5vSN0xRo8nAdoE+VnWdezuwJNXXGeLB8vHQf4svZpwugiUsLAVBTiYukJm5j05fpiz1BuWTw05AI4vFxpMBULFCxsU78r6LKeFXo/9yXTpM0CAuCr4FJySxITXlTwMKBRA9Nsos9R7jVS30iCly7+yBnSvLILmfT6+n6Ze16qG2CUPYAtM3/QTH/vOPEQ0zWvseZrjY2ukOPWRUfkNDHIQWO99cYop2wkWFtFN5mzBnBXYFaGQ2XPFw4IiYIA/SEaNAQedJkGIZ7MJWhSBiFtfUtYn1E01ErrNYMtnCh32dKFsR6yl8QXiQfONl8qPfMwS+C/9Fifs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZLrw+NiCpiaY3AgO0CXla1lMNOFRxB0gqTMsFsBxp02WThaDlS0Ix4OO2t?=
 =?iso-8859-1?Q?wXxZmjo1mG4VaoQxCaoyqf7nzsQEQSJ0sYWvrz66jPmKk7vdykSyoGD+ok?=
 =?iso-8859-1?Q?4ogTneuIXdaV7b05okis/aR/hKkzJlZyNVOdI2Vwz2i0Mrsb+lI6FLH6YR?=
 =?iso-8859-1?Q?o6sBhNNF6IpERIajnOZwLTovzICvVpFpBDzjPWGFbI0BF9OKORkfaWKC3M?=
 =?iso-8859-1?Q?wgJ7YhCcQeCeyGS8KfONyqUEL2RxEeVyrAhvy9tEjHpgwBoTwDXifnaRsK?=
 =?iso-8859-1?Q?uC/qoY+nxSFrLcJw6pbdSG7iv3aAkIuKBIPc6FB3T8CgFiaxpn1UB7UOSN?=
 =?iso-8859-1?Q?UQUmcXqW80LjqLCwb6pWRyq1hbMw4ZDK+xDtsBwBeE4icxdCrhUZzJhpTx?=
 =?iso-8859-1?Q?SWUmNjWfJ+EWIJkNrj3OHgkLdNAsqCGdvq6B4psuwgMb4s1n82jbae9J05?=
 =?iso-8859-1?Q?LRZFZnvoheD1OzuKdlX1yIhEYhZ8MK2ms7G2ClHfP88o9IhL+lsRxWFdhu?=
 =?iso-8859-1?Q?KgXT5isT2jDw0WZHT5WdMAYFDEBLd5pGNQgL0kI5BvDSBnORPDYLbV/oji?=
 =?iso-8859-1?Q?RUnmqyZkGGz51bYR82/IBph8r3jenpUK5NbfetdmsbrKQoYGguHlqf0fhf?=
 =?iso-8859-1?Q?yD5d9QdUJ6//h2i/dp5eqN20/5NjZXwrWSXgInul614aQ4cRj6wMa2wCRb?=
 =?iso-8859-1?Q?A8qTolQ4nbwKmLl+xvqGF/vgYqwauJS8QE9L7Ml9MQLLgmPhnV7lNZvhNW?=
 =?iso-8859-1?Q?z8M8GTlv+SrYCJft9TNq2EBej8rK7H2Wz6zOSfDfcqSClY1kUaazkEFrtg?=
 =?iso-8859-1?Q?jxXqmsCdXuGAwMSkPIbKsNkIjum3BtjhrrHQW6XxWvJUV2dapcAs4rOp/Z?=
 =?iso-8859-1?Q?iqzV3Kkz7/ABv0ajmMTHD2HB9piLXs3k+zwXbMnVZ69t+dFqFfHoxbHK2q?=
 =?iso-8859-1?Q?oh0PEKRegrV8Mbp+X7mzy2DCWXNu81Y/tx/R44mgFWE54bHx5FIINjLsWV?=
 =?iso-8859-1?Q?cR7Fifusx4JPtREv5x68wBS7zK+bC4S8sF5oh2gBkg1xvBxqP2ssApMLIv?=
 =?iso-8859-1?Q?BH4d6NXThFnKH1y0tob9fb8iaYgVf4feKnG9WKicj0rPnYhxqOCwiHE9ez?=
 =?iso-8859-1?Q?JXBuBQtBZlwJVxD3MQkCGRem/zLMuRh44ZWw3oSJSmbnB5J23Ur3sm0DA9?=
 =?iso-8859-1?Q?GqlrkvUX14stZzPxlonLkCBm+VXRRv3zbGzLvYSvOAF/cC3REqH54abgD1?=
 =?iso-8859-1?Q?cOwkqTTCNWrlHeDcC4j3f1NEEYRJpZVjoSo6mhv1oXk4KORkySdYHAjXnq?=
 =?iso-8859-1?Q?fkqXkbx2RSw7RW8ppUd1KrvEdjmRpNHJj7uWRI9c4WwJMwKtvOazg86qLG?=
 =?iso-8859-1?Q?9q/Br/KSUo3uboSE5AXX4TQqfJTVqbt8t30Z+UhxakPtQrE4m2nm9fMaqT?=
 =?iso-8859-1?Q?p+xC9Np8IMAUACZU2g/1B/1rRlyAcFMyHt4j6ws4uMUBeFngkO3X8ZTmoJ?=
 =?iso-8859-1?Q?IV440DxHQlmxWa0PhiHgflbhHYvskdkp9dhtOSd5/pOqDdCFJMIWuQeNni?=
 =?iso-8859-1?Q?ow8ioHC9MUHJW82eJ2wl00RAJb4Y5OL3BTbmRxH/tTvabC9w1M07BYkKJf?=
 =?iso-8859-1?Q?uA6cFTuPoSdY5SAgNstOy0Bmy9PFY8tsCI85iu3QaRXAhYRqo0aepbKyCZ?=
 =?iso-8859-1?Q?8uNQS9Mm5Kmesp9oonGJ8nzoG9WF1JN2jqZiPLF9XGJ3APV9y9jwe3fW/9?=
 =?iso-8859-1?Q?xRjmWk3ENpgaUFkHHLf4jXUoj84t74KAyPHLh5FtZGTEUmXcRVYmLjr4Rk?=
 =?iso-8859-1?Q?FKL7OLGRLA=3D=3D?=
X-Exchange-RoutingPolicyChecked: e9NiT5k9JzQ3hyr7LpNxsJZnkCJmDrz8ALe5PCn/PY4ed/q3dV8KK3oUVtosaM2iH6VKDaB/fdyfljuRljROtugFIVco7FEOnODZrFRahg/V08Hlrhg5Vt6tYc8nXR4cbCwQN8wRoO37Og+V/7ap2ao0Ed2DYBI+XPK66btzXb2v6LtlLpe572dTwXgY7KQh/QlEFuNmBnEKJQaW1ikM3cevd3/JlNmC+rfSeaJC5VIPFIYt6fniQkLWuC1mV48RxwTrTbiVGloRDdhqGFkDgzo4P48WWJdLyvTpfokhekiZPQ2UnWP+WQl7BR/AR2rGd3VAZbacHYlNhvXaQBvHLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 740c266a-741e-48b0-67dd-08df1aca0faa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 05:58:45.9634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0foKu5HqwcwVsZgt2c+oz3gyY/ZaWvG17MBURkkY3ViaBEiF4+H9dCyfVWUZ0dM/iKQnwrM7fQPfU7Vq1lpq+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
X-OriginatorOrg: intel.com

On Fri, Sep 25, 2026 at 05:39:14AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] xe: memory leak of pt_job_ops when PT job is aborted before execution
> - [High] xe: PT jobs swallow cancellation error statuses and signal false success
> --
> 
> commit 784a2cd005e51d36d34825eebaf5abff98891eff
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Update GuC submission backend to run PT jobs
> 
> PT jobs bypass GPU execution for the final step of a bind job, using the
> CPU to program the required page tables. Teach the GuC submission backend
> how to execute these jobs.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 4bd1ead57efa4..9faddb7c6407f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> [ ... ]
> > @@ -1238,21 +1240,44 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
> >  static struct dma_fence *
> >  guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> >  {
> >  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> >  	struct xe_exec_queue *q = job->q;
> >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > -	bool killed_or_banned_or_wedged =
> > -		exec_queue_killed_or_banned_or_wedged(q);
> > +	bool killed_or_banned_or_wedged_or_error  =
> > +		exec_queue_killed_or_banned_or_wedged(q) ||
> > +		xe_sched_job_is_error(job);
> 
> [Severity: High]
> Can this condition fail to detect errors for PT jobs?
> 
> PT jobs are initialized with a global stub fence. When the queue is
> killed or banned, xe_sched_job_set_error() attempts to set an error on this
> fence but fails because the stub fence is already permanently signaled. As a
> result, xe_sched_job_is_error() will always be false for PT jobs.
> 

Non-issue - the TDR actually should never run for PT jobs, when split PT
jobs into its own backend (follow up) that will be clear, but sematic of
PT jobs is we always run them but if killed, bannded, or wedged we issue
a clear. This sematic holds.

> >  	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
> >  		     exec_queue_banned(q) || exec_queue_suspended(q));
> >  
> >  	trace_xe_sched_job_run(job);
> >  
> > -	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
> > +	if (is_pt_job(job)) {
> > +		xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
> > +		run_pt_job(job, killed_or_banned_or_wedged_or_error);
> > +		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
> 
> [Severity: High]
> Does this leak the pt_job_ops when a PT job is aborted before execution?
> 

A call _arm() guarantees a call of run_job(), thus xe_pt_job_ops_put is
always called. Non-issue.

> If the DRM scheduler is stopped, the entity killed, or the execution queue
> banned before run_job is invoked, the scheduler calls free_job directly
> without running it. The free_job callback invokes xe_sched_job_destroy(),
> which then calls xe_sched_job_free_fences(). That function explicitly skips
> PT jobs via an early return:
> 
> xe_sched_job_free_fences() {
> 	if (job->is_pt_job)
> 		return;
> 	...
> }
> 
> Since xe_pt_job_ops_put() is only called here in guc_exec_queue_run_job(),
> which is completely bypassed on this cancellation path, does the refcount
> leak?
> 
> > +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> > +
> > +		return NULL;
> 
> [Severity: High]
> Does this swallow cancellation error statuses and signal false success for
> PT jobs?
> 
> Even when killed_or_banned_or_wedged_or_error is true, this path
> unconditionally returns NULL. The DRM scheduler treats a NULL return from
> run_job as an immediate successful completion, signaling the software
> finished fence with 0 instead of an error (like -ECANCELED).
> 
> Userspace waiting on a failed or cancelled bind will observe false success
> and might proceed to access memory that hasn't been properly mapped.
> 

I'd say non-issue as AFIAK user space never latches onto as fence state.

Matt

> > +	} else if (!killed_or_banned_or_wedged_or_error) {
> >  		if (xe_exec_queue_is_multi_queue_secondary(q)) {
> >  			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260925045320.1325860-1-matthew.brost@intel.com?part=10
