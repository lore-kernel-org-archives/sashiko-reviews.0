Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DF5412C0D
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 07:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319781; cv=fail; b=awH7GdsmTkiYQd1UlNafpi/RsbTipWMGt/VY2SIbWjWhvJ/eEv3RAN5t03oS4SAdYjdvMjip62XaNZTHEeJpooJYXC8jOd8rLz8SwHjaSO9QesJPoYWA/wod9ik0yYp6XrCt9kTDzC+OorLuzdZje3V1CwRbrKZv25w2zYy82hA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319781; c=relaxed/simple;
	bh=gCfCYofOJ74Mlh5H0F/VSDVTkAtTzUiqkXwwb1ctc8Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ksy50xAjHTbI+eIRrCOs+r+5nWq9v09bAFhg2JD8ZUojxTKr+ULvRrj28wCys4aeNnCGovysmnGaf4ZRUV1QVa2TejjBKb7i2N26TXpp4L1TLjC5nhq4ay/hkysGgpBgivEWO1V2MMJW93MJzc+FhNLKj1id7KzVUWsKlr2HsJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqmxBxAB; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqmxBxAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790319779; x=1821855779;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gCfCYofOJ74Mlh5H0F/VSDVTkAtTzUiqkXwwb1ctc8Q=;
  b=fqmxBxABzzaTQtDleIFwFFvH8benxY0y4HwmNeYYYJigDcGPuQpmvatk
   5OA7xJs8LQo+hnwHqRo5Lnf06Gz3efbzPXoOst6A1d/qrL4HpEj4rQYOY
   8Uz4urqKiarY18YHbVc38zQEzJjXpRGMGbeoRJ73VPtojTtM50I3GMpjx
   tmnlbO+tZXc0EcX+rUpM1XSySAOrcNsycpRvFIC7riMJoAzPPTnfUJ9R1
   Qu1Ls1mGI9eUTmYIxLvxJ1OWX7WXFDATGP0NjQN6FD5ngq1Aea3s3Bmgy
   4ims5nvQsVCxFAfP5eNkysKFqYXSo6RgNvl4vPAjm6042eCsSqih6tNju
   w==;
X-CSE-ConnectionGUID: NxhXN7jPTbmvD0ywEo/cGg==
X-CSE-MsgGUID: 8vFXtiC4Qa2s79N+p+bVVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91207188"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="91207188"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 00:02:58 -0700
X-CSE-ConnectionGUID: 2+6SD7BDR9y4d9qQdWeQpA==
X-CSE-MsgGUID: t0+YcbvuSkKPRFPrEJhyiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="278964477"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 00:02:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 00:02:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 00:02:58 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 00:02:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BY57TmsfBeX4/+E3d7NCiqBi2J7fSEgQrZQWCCfQwZBmz926GYF+GmRDJZsQebZJAqtfE4khD9jLXP0jcUaO7AlNPw2X6uP445CofCAp90/Mb+CDgxGG4dcZamOjOCjZL1/UeLAcWWYtpteS3p+/AYA0A/Es4vRjYAryiVOjaJJ4zSzCQ3njsfwJHqLEKXUpr86R6TfDsQ+h5YSLKYo0ChXnpSecTlE4eqdtZpbILzFOu4tA8UvVTYQPOA7HRuTNZ4UpmVDS+nFi4+CxuX213YMyX0w8HACMnMAS8cEmbFs+zw1ttuVsE/6oK0ncYm2zZqfetVNDCNc1bSTFMcjaHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3s0++0/BBXrIVi2m4q9WhqcF09hTXJqBZyMWBwUWU28=;
 b=HJI94fM/9147LXmCWylIVnpSSGYOqAQCQLodPLRv52FcjTEPMPJtFj6TMucogI+ZLFFbvZ4etWOQhTLY/zPmcE/3PDbs5J5ocilUhrs6pVWk6jVRPf9qG9VPG5TQS+Zf6wuq+D/bOZSX+CdMfBFRihTZskLhLw2OFZxuud+Sxxs9isC5wIVPIVBc6gTMmlulo22szu452wXesnIyGb2PadzEUn7aEFuBcfLOTNUYuPW/yjXvY433ETiZCVErYCaYWulAgLWp96tWLgV2EzwYar/DNwwTC8rNdoLrWZ5dxV1xT97+7Medeo0FO+DMaYbjtM/FCrCbU/A8bkEqILqvFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SN7PR11MB7065.namprd11.prod.outlook.com (2603:10b6:806:298::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 07:02:49 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 07:02:49 +0000
Date: Fri, 25 Sep 2026 00:02:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 20/24] drm/xe: Add ULLS migration job support to ring
 ops
Message-ID: <arYclzwCN6GuC1jp@gsse-cloud1.jf.intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-21-matthew.brost@intel.com>
 <20260925063845.5830C1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925063845.5830C1F000FF@smtp.kernel.org>
X-ClientProxiedBy: SJ2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a03:505::23) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SN7PR11MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe09dcd-cb1d-4d8a-42a9-08df1ad3027d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|3023799007|6133799003|10067099003|11063799006|5023799004|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mAn3cHk0KRD794752iQl9kkHljRbznT9TeZ7/gH2QXwQ/Cp2ZQoYU+8ay88Sc9/XyKTLIntbbxxqp6oGW9I1YU5+w22cwem9/zVZ1h8/rwWML9DgQVl4IGVejxCPR5bjLsSlFr/LtlQ5wC7uEtwdACRnzuJ0tW8a/X8fpT1VyvPpSz/wYwsuX+o6//qCk2sb8lJ9HFV9nTWAaGNgl8WJPkW/yRR3evTUBwFNbrquo0MJtPLcQ3078Em7MahMKEWqeTzEkdH9FQe5cu4jupc1SynnFF92UVgpEMbHreoDhpzVnKf1pHyIIeT4KVtRaO3lGz4IWm2P4WGCAKP86bxmCZXtFMwst1DADeONLCxdBxXPpaRB2HomRrrArCja/10kH+34YbdE8xMu8CZTYZoknNr6FgDe3W9iYAFvttZ9Eq0ovYhWatso8qkM9HsyuBdiE22uEQG6vCpjrM+3bZ7EDvs85LPZU5Id2f+ZzroE5KXp3c6EedMzxP1t9nLlRAKN5siDfZGCM37QrmI+EFEgqdXBx2QJj6HiewuCOXxpbHgAoq4KpCskqe27B+TcrRAvVYuowGXPHRVUsuMTR2XufKWwKDKtPVRf/dKGQ7JBmxM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(3023799007)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JMJrga3TBDok1dIdW2QPKDVbKorsiphDuwNZTF/AwqKqpnKe3PN9dOZ0lr?=
 =?iso-8859-1?Q?HVW1CurkdzKUVGvKg8BhxoUvSxie6GTThqIsJXByJZuGc2YzsQE7JRUksv?=
 =?iso-8859-1?Q?UzNRCaqS3CkPCf/BMSoRJEh94j8qGHYixPajKwdr9DDylNAUdxJmei04/n?=
 =?iso-8859-1?Q?tZ3ulNvFnhlfugBh7/o2MEZx08kAexafl9r+JAniJ/wXje3Cn1gspz5gBN?=
 =?iso-8859-1?Q?Yv8QAOh0CXxL9ZGvjuWST/hupdaFjMrV0xbiCKsRwPuvJ57u9kONipRguK?=
 =?iso-8859-1?Q?n8RITmRIoQeahSoK9SIa+dfKdFtrxM7dmGuMmi8mysNcOHVtMh93b4E6n1?=
 =?iso-8859-1?Q?YLcECKpBHxyxoaIBPtnNzYWHYdQKjcP6RAnbsk1Ho1GGsMqw7kjFVe0vPV?=
 =?iso-8859-1?Q?5HNlJ3bjZoVElA3G6X6ap8f7nPgrxnAgU4NowCPIzxOPR/saLGxAbav/9Q?=
 =?iso-8859-1?Q?XfLV1+bU3+hHJssys2t4SG0ZtxUOOJv1HorPmpYc+HNiwwAN9Ewybho42M?=
 =?iso-8859-1?Q?G4oTtW/2a3yU7T0SUMnovLdqjCz5Zccd4Ku8MtIrQY56IQXHSX8WZr5/bL?=
 =?iso-8859-1?Q?FOaqmdJBj23TJnMQ3WBZNkLFrt4wb1XV6wBN/2TKUhKgO5eW76Rm8hdWl/?=
 =?iso-8859-1?Q?mUj0wfVmM+HvjECD4pFES51uX2m7fUpDEr33p6kS2oRk6B+CLxGu8OEjdR?=
 =?iso-8859-1?Q?CUVXoFIREWxD4xuZ/JgZlHia0tyoI7TGEB115xtj1E9lpEQFZotY0dYNNW?=
 =?iso-8859-1?Q?9JPf+RvxOrRncYUTqysN4LsK7TUI8fZURBjfzO0cCBgJXZRhl3GkE+pSWQ?=
 =?iso-8859-1?Q?Ph1fWWWTtTazmkIyWshB0FQ2CVkRxMa1SEmgDLzKGlzmRmb56xYTbfqpUq?=
 =?iso-8859-1?Q?9JuZi31bpy+0Ei7qtd/BAs7cK+hIA30gYuiM/QZocuL9l0lTygBoQ1wps2?=
 =?iso-8859-1?Q?QZ7T2S5JxYKM2vE+CqlOZve6nGihDFbewTPOV5YeLIL1tgYwrcBlODLZPS?=
 =?iso-8859-1?Q?oe5FxGvCWYhlNQSZJNgiGn6NkTld2r07dwBhPyWsTIx3QCsjN7pqFCW8B1?=
 =?iso-8859-1?Q?77CCZzAWpWc81hPQub17tirsHozNWZ2utJ6Pe3/ACLk7oAvnhVqwVveCUH?=
 =?iso-8859-1?Q?kMhhfGAyh8v/eNiDIeOx8cyvL6qr98sFkpGbb5Twey8OIw28DA1fgB87zt?=
 =?iso-8859-1?Q?FsF9/+GsUENouzytGrohhiLoOn7Gk2A8pe1Pw8ppkMt1Tzbr7q8iynwFwy?=
 =?iso-8859-1?Q?rquRoJOY5uzNX1sb/R5rMG+9CfQ7bO42r2BrMex48WT+2yNyMoW9aww2I5?=
 =?iso-8859-1?Q?dN5ylUlp/oezBxgwvvaAMpJM7NRZVU26BUx36poBEWwViJNbWjPdp0J1PN?=
 =?iso-8859-1?Q?SDVZe+63ytaQYuwcLUH86zxH1jzRQU0ydLtmQiMAjzg/Xhluo9XAC18dVJ?=
 =?iso-8859-1?Q?MHzXUEmLLE7X1lithzkuxHlnJj3wLRMhVG/ElzTL2F4afXQz2J/kXrj4Vm?=
 =?iso-8859-1?Q?xYajnQEpcaypFwmie9zZS9axNwMpi2Liahp0A+YMSQ6k3QXGWgPB6FphKL?=
 =?iso-8859-1?Q?9yJHKAN9XyUU+oeWxn6s1O1Yv0GIa89/OY2pbOw1B7FnlaXg2H5TWCYL3d?=
 =?iso-8859-1?Q?ULGzHq+4cEApY8hi5SFzjvwiMiUc2D2TZSBAdn918xh6xR5FEydEYgMwYc?=
 =?iso-8859-1?Q?vXjW23VLGKo1r11/qHPAtMKngc5Fk9wBkleHDy8UpxsKTtErqQ/G0/k7AN?=
 =?iso-8859-1?Q?c51RDZPwx8Fuga79lDVDPTpQQ1hmPWAyj2CS3VVY2vqcB/AgXHPCZuKmqq?=
 =?iso-8859-1?Q?Qg9N7D9p6A=3D=3D?=
X-Exchange-RoutingPolicyChecked: n1NFMnms2/upsWELxbs72NpgoiPuwHR0gka7ynpQvlH+6tS3Z2WhfnLOJCEcJSawfJVj4NCvZv/2NjqvlK9ywXsdoSs7aLH3y7+k+hc+me5V8/72HAG4t0ioUQA/tYs/VyA4Jofqgo/I5V4ShFKnbXcwFeb83Q9Wyg9vPe5pjIbRNwADBGFoaEBvLKb92UgaaTwUHBDL+mfX9vlQmZEPsr41AZ8xPUQJgbFFMwCNdhAIUQ+0OeL7GnO5RXtx8k9ZC24lD+9xdkSxCyO9DI7H0yyGPAjx+7+pMdGU6O+HDnAjiQWy6AftNjmM50JxCojbhFmDLIB1LxgwG1Am26DxnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe09dcd-cb1d-4d8a-42a9-08df1ad3027d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 07:02:49.3325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QplXMNhuGIexbzajuIt5OqZudPZddubUcRA1l2fgmaG/wXA5aKQCYYY/7yGpTD0h3jf0K2sRxR6gMgmw0yZ/9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7065
X-OriginatorOrg: intel.com

On Fri, Sep 25, 2026 at 06:38:44AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/xe: GPU hang from CS prefetching uninitialized ULLS jobs
> --
> 
> commit ca5d0374fab1065ae65164d64f6d5510acadd964
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Add ULLS migration job support to ring ops
> 
> Add preamble and postamble for ULLS migrations jobs. Preamble clears
> current semaphore for reuse. Postamble waits on next semaphore which is
> set upon next job submission, then advances the ring tail over that job
> with an LRI to RING_TAIL, so submitting it costs the CPU nothing beyond
> signalling the semaphore.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index 46ab1f0f35648..9f462bfecb831 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> [ ... ]
> > +/* Publish the next job's tail, then park the engine on its semaphore */
> > +static int emit_ulls_postamble(struct xe_gt *gt, struct xe_lrc *lrc, u32 *dw,
> > +			       int i, u32 seqno, u32 head)
> > +{
> > +	i = emit_ulls_ring_tail(gt, lrc, dw, i, head);
> > +
> > +	dw[i++] = MI_SEMAPHORE_WAIT |
> > +		MI_SEMW_GGTT |
> > +		MI_SEMW_POLL |
> > +		MI_SEMW_COMPARE(SAD_EQ_SDD);
> > +	dw[i++] = LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL;
> 
> [Severity: High]

All semmly non-issues during testing. I believe the semaphore wait acts
as prefetch flush.

Matt 

> Does updating the ring tail to the next job's boundary before blocking on
> the semaphore open a window where the Command Streamer (CS) prefetcher can
> fetch uninitialized memory into its instruction cache?
> 
> When the CPU later writes the next job and signals the semaphore, the
> absence of an MMIO tail update means the CS cache might not be invalidated.
> Could this cause the CS to execute stale data and hang the GPU?
> 
> [ ... ]
> > +/* Pad out to the fixed ULLS job size */
> > +static int emit_ulls_pad(struct xe_gt *gt, u32 *dw, int i)
> > +{
> > +	xe_gt_assert(gt, i <= ULLS_JOB_SIZE_DW);
> > +
> > +	while (i < ULLS_JOB_SIZE_DW)
> > +		dw[i++] = MI_NOOP;
> > +
> > +	return i;
> > +}
> 
> [Severity: High]
> If a ULLS job reaches the maximum size of ULLS_JOB_SIZE_DW (which is 48),
> this loop will provide 0 NOOPs of padding.
> 
> Will this fail to buffer the prefetcher from the next job's uninitialized
> memory, exacerbating the prefetching issue mentioned above?
> 
> [ ... ]
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > index 52ff96bc41004..ea4af321dd7c4 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> [ ... ]
> > +/*
> > + * ULLS migration jobs advance the ring tail from within the ring itself, so a
> > + * job has to know where its successor will end before that successor has been
> > + * emitted. Every ULLS job is therefore padded to a fixed size, letting the
> > + * next tail be derived arithmetically.
> > + *
> > + * Sized for the largest such job, emitted by emit_migration_job_gen12():
> > + * preamble (4), copy timestamp (8, its size on an SRIOV VF), start seqno
> > + * store (4), arbitration off (1), batch buffer starts (2 * 3), pre-parser
> > + * bracketed flush invalidate (6), seqno flush (4), user interrupt (3) and
> > + * postamble (7 + 5).
> > + */
> > +#define ULLS_JOB_SIZE_DW 48
> > +#define ULLS_JOB_SIZE_BYTES (ULLS_JOB_SIZE_DW * 4)
> 
> [Severity: High]
> Since this maximum size is exactly equal to the maximal job length, it
> guarantees no NOOP padding is appended for the largest jobs. 
> 
> Should this maximum size account for additional NOOPs to safely pad the
> CS prefetch window?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260925045320.1325860-1-matthew.brost@intel.com?part=20
