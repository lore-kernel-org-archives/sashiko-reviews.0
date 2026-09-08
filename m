Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45D1491590
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 19:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895877; cv=fail; b=VepQjW28UPECLSa/DSpb49+ZRGWclA9nwuB4g5Bv31Tnv/0RJFT4ebVKckuHKht9VP98f6SZT127mNKN9vpYkYbzotV7sxWtMgwhV6BUV5C8yWERHzCfCbrqdHJHdgiIWoDUJmBzVsr0J3wKunpzy/iVkO0zB2YfsA6Upb10EsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895877; c=relaxed/simple;
	bh=eryyGHuTxNaEVPEwnatnFcIbuVNII7DjI+FAhM2Mfyc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XQuqEfkJSsP77B2eHdFuoNBSNFT1oTL4orN5rLsfPIa29SWzd3BzyGlKyv1yKWALPVEOCn2WOSN0nvtJTeE/tZrY/NVwWw5NsMUGo5y3yCGd8751kOJ3sgnFrmR2w7PszUnBzG7PKBtYCTo6M/g2BMNg6eOITlS/ERWlD7iYqGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFFd6pcj; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFFd6pcj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788895876; x=1820431876;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=eryyGHuTxNaEVPEwnatnFcIbuVNII7DjI+FAhM2Mfyc=;
  b=TFFd6pcjXX9x3krtIENnfKWJcAENUL6hm0vGAcBntVkcI0+MjZpYeq5S
   G0yJWeOOGwFzkA8ErI39widJmF3qEFtAoQw4ugJsRTeiE8P4EeNhphjn3
   GsJwqaH17cykuE3pdBNmlao0Cs5V3zvj0IoRY7pIYoFRwakhet6AnOtRf
   gIEmJP9FtH5WNeHMIhNMg7IsZjS5n9UNy+ZxNbnov16LV5KofBEvgz2N6
   Qp0OjUeZYH819r4FJcgndBtDUMJuqRFJZKQYob3h7T59hZhcPNN1LyrJ/
   ufLo63H2AsGDq8Je8VWDEn8KRSuZE7rsUPkNjsWbi/L31I9I5wJ1PqJfH
   A==;
X-CSE-ConnectionGUID: K/2tEIfkQheDrD2MmzRCQA==
X-CSE-MsgGUID: yJkXjXDsS6SVRQQ6y1Ap8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106827230"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="106827230"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 12:31:15 -0700
X-CSE-ConnectionGUID: vgW852VpTtSyuifp6U4Gsw==
X-CSE-MsgGUID: ackIv4+6TBuXHXgeswCrKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="294604197"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 12:31:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 12:31:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 12:31:14 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 12:31:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aB4abT93veH7PuQpy+K2tWKKQ50mCoM5ruIpogso8ntSw0PwebgpGgvnpFR9CGWuZCDIK2/XDsInH+m3WcEFhX/L67scVMJe8r3Ik1qyXjiadgh8lp3Rafv3e1pLCSWGvSA51/zO8BU0sUGpWKWzL457KlEe0UrTY9J6wNC5v569rb1dhmmxZm/bHJ+UfPAOVQ2EDq+iiD+rVxb4IiMAzV/TU73U+oAScLd5gTkv11vi/SkBRz4VJmN6vhPtmMq+466Ahl5srwLXEksg6KxbUdVv8dsyxLW0I2QiQxsGYW/QE26bKDXydiBV4iFB6kRAopmsRQu6K7SdqF3SLc1Wsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWtOeBt1n03pMbZ3gb9uALHXNVIkKkmwmMmiMQplknw=;
 b=IIXOs9M1f4rQaZMr90Y7aP2qjRqcyY+wtQ+TfKwJPQMWOU25vz97FVY1hF4X0xE/mqV1WLwG+xOoNsM5jYwA6BDUZCbUpdql5BnvqjapYchisqeuGP/oAoPFu4Ku/jGYvXHf+sQj3KILJtVYdhZjyMgAAtL/Mm2xaeSEb71bmINR0JhuaG0LUIICgsf4OK7cgaxnFC2JXYXHMijYhmSGQLaWxTfNHJUD4BHul1cIoioMiRaDWPqbWWqD/0YIk8qOfCjLpDb0X+mmWiV2Mp3aVL0Q1F+3Oyn7OJlcgp+7Ipg6rxLhYm5AG+341trBXLh3urC6jzd2xkFPW1TeFfI3Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS6PR11MB180335.namprd11.prod.outlook.com (2603:10b6:8:521::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 19:31:13 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%3]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 19:31:13 +0000
Date: Tue, 8 Sep 2026 12:31:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Keep walking on SVM eviction failure
Message-ID: <aqBif1V2aY92MxRG@gsse-cloud1.jf.intel.com>
References: <20260908184346.92332-1-matthew.brost@intel.com>
 <20260908185523.6EC501F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908185523.6EC501F00AC4@smtp.kernel.org>
X-ClientProxiedBy: MW4PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:303:8e::16) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS6PR11MB180335:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f9fcfb4-ab63-440a-49a9-08df0ddfbe3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4uzoIDcG7flQLzPJS5Qv5+EY+/qSMYokjEpgbdhHvweKx1Izs8/H0l1nleocCLz4cPfvIQUMTcOXQ7XgrumNsFyUB3yco4p6GZnXglbEm37Pv9sByhjsLdcVzWG5vyKUjKL3xjd8ffsrYzoI5sFc/5mjlFxCVuxrhdzte7aO5HA5H4ViCeY8sQiJ58IcnRzVjYMkYxfC3aksxQ8Dqg7h+2wtlznRAIhCbEUqoWKeBofRuh79qhdvu3yai16mb1wKcImlLAvTmDQP1bg6x08JloQk9/iJZk+it2/AUpvG/XGfofntwXTZ3S/LioCxJCQmtovxgq4XwhY8FRpXyUCxBxPKf+lDc11uHyLLaOXS6bxLkOxnFUAygFkEOUpJd2YLlehkUfqienNMkfLqCp0iA600im14XfbToelvWlieVi0WmOvZNikpj1Mbz93ZwqzWhVk3hJcJrzOX0zSzbsRQQwChYr7hcoKqq0XvtQPhmbDSHGhdlrJtPK9mbgYyjpIJ40CpP45mpOjfFlPmDpgKS89TntJNG9uETWgEH/IeGAEPR0J8AlbpeiSmLQhljSI2+/v1bLTYKzcyzUlh1VXkttEVrPPDhogdTRTMj0PvKdE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FITzr5URtFAYCWm/t0fEiDKEUcPRtC75hPwxcKtKcJ0ESLNMgJ9F77bJmz?=
 =?iso-8859-1?Q?qOL/cgmm7dcVbyNLlVXkw2eEVahtjTrGMAd1VPeEvvkNIVDi6+11SiFbzF?=
 =?iso-8859-1?Q?4P4WzSPVmzRrA0uT2mZIRA9GBst3Bm0D/ECBbB2H1mkB86oeKY2J/4pGYV?=
 =?iso-8859-1?Q?PIQnNFdOCh1X6ALcdsQ4YKiP1kORyWV+jNhNBhDgUFUqNJr/FU/KNLgOqe?=
 =?iso-8859-1?Q?vYput/v9raVAJqi6pBjMAWujGIVcEVh0XSqD2mIpW3nDiAZLk9/9ZxJwYy?=
 =?iso-8859-1?Q?/gqs0HVHwfnNJSh47C8iveyOOmSOxTvtrlpTep4l2eRPyrDKgnLn8MG9VQ?=
 =?iso-8859-1?Q?2mLU322OAPT4GnZY+nvsUbjF3BBKUChRfGdwAK1iearOP5bE4838vbotZ6?=
 =?iso-8859-1?Q?fG+QfeaX6vTE3FdQ89++/t4lSkrolFYIXTuoJAhkhLBsbolt85RYed85Si?=
 =?iso-8859-1?Q?I+6/mXbywXTDrjAV0fK6gHu9SXAmbViy2O0MpTbFdl1IPGHtSzrNOVBRT3?=
 =?iso-8859-1?Q?5DM2mhgN/xXbmvQxddUqMShzrgVceSpyDcSImW7ciVQae4pbXyy/olWrdy?=
 =?iso-8859-1?Q?XfDmoUxlLiY3whp6GFBWUcCYRZJRPdxHEK4jIhLP2kc0tEqtN/AmeF6U01?=
 =?iso-8859-1?Q?8Tm+E4eAi3F+R/Z7OPPwt4obgz9/F7dym6+0i3s27biyvBjtv4S5aGO62i?=
 =?iso-8859-1?Q?vJFNJK1488A/jDp+borvlmtZzJp50EaKYiW0eZT7RcPmHi8w39HP1FcD9L?=
 =?iso-8859-1?Q?WDOuL8GZ/aFLjo9MC3nRj5UhqDwnVHzLJtx46gR01/s/7hqvRwLMOnTFcF?=
 =?iso-8859-1?Q?VPE1NSclQsY4giKrpqnrZgursaxcn6vD0RTwAFmBaX36niKMYmfL07AbAz?=
 =?iso-8859-1?Q?LKAATSnc5+Fru3JK7eBoTmpbCUzKzW2KaNulReZRpr9/7hxJi2voBzI+Ld?=
 =?iso-8859-1?Q?eWzFwbk+kTh0rQZ9OV1JniBj0mxtljUdnZM9AgUbIdEQf+EPgdIJ5odrGo?=
 =?iso-8859-1?Q?g9KMJnrPETG3UO5Bn5yacsA156h6gQh9M/kbnYA13YQXXIAyFaa8qnwg94?=
 =?iso-8859-1?Q?VUuQAGSM6kBXZnsRFZj596+LVtiBTuCo1AaoBWmGzGAVpSYhIb4B8OFbOM?=
 =?iso-8859-1?Q?I7DJfuxLR5zypYEKPvzSX6MthgF29H0BD2XRYjPw/6ADz1Yg5Xxm5mfCtx?=
 =?iso-8859-1?Q?0l0cU5ruPOUOEvhSvM2+buB6Hc/OuaHjIxsHEXVyHUpcA2vsxWtvVzrKdr?=
 =?iso-8859-1?Q?QkUNH9GUgd7QBHM9rH4pWJbN0OJTJZS1zzFsaPoWecG6pjK+jDzcSE/hEC?=
 =?iso-8859-1?Q?53WyeaBKluKiPPA3y9UY3PpzMhDl+z5PQLmFu5xtcKhtF3EweRYU//98a/?=
 =?iso-8859-1?Q?fnnzWaAucvAKAblTtiwCUF5fAX/dx0oBt05RPenLkRi+OGXfjPNctPupkg?=
 =?iso-8859-1?Q?oHDTOtaDtOJCbAAugMpC9P7UhkAc8w5K11gqdAbgh4oY78nhn6P6hfffNO?=
 =?iso-8859-1?Q?SnB9Ax7kayWxcY027NVwg5WHDytEZmLlKwxAk3Rv4Uy5ikrTDVBMs+u9Tz?=
 =?iso-8859-1?Q?uKF/uQ4hTt7RCjDqj84UAIqQX5WZljR9ThAzatQEiIY6hbXkEa9XiDgQfc?=
 =?iso-8859-1?Q?A09+cBwGq8NUb0yp6BwFOmSIbO5ibOht2ZuictCAfF4G03ncD5RSetz2yV?=
 =?iso-8859-1?Q?HsDeyblvnyemutEG2FPC1VBV5P3AoPy9mmAXyn8gwznonVsRGBTHtXSO5c?=
 =?iso-8859-1?Q?DmvS9xm0blw5f0+++3W2WAh6Yy1Ouq+aE7ybkHwrpEZYDoOvWfAPpny+7/?=
 =?iso-8859-1?Q?FoNDwwY3oSxxJpR5zDOGiJtWaEOxZX8=3D?=
X-Exchange-RoutingPolicyChecked: NFaYnfhXEGXVkHI8Or9iH2rZT1xEfPkY2WVyVo9+LfaE/IiuojN2CpdyYRU5NdV+mq+ZwhQKhc/NRNZ/mbKwjWxL3bmkS7uerde5ryo40W/9W4cXzlQCFCkzmUfyT2nrEBFn9O1FjaL9xgAPCfH7x9Zoego7Zwd68TOdZqN8qpPog8BYXqFNeBFNZg7gdc4ixMzvb/kiP4KbmQX8X9A8lfykCbtkjc+FkBk3FrT7mp70xtP/m6Denu+MK/aqbwRLiJ6B0Hf5PiU3Ybp7LYK60AwOzlGoJwR3CUuzrdO96U+BltS3F/W9pXw4+p9P7UtID0bETsqXA91aEkDmzWxlNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9fcfb4-ab63-440a-49a9-08df0ddfbe3e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 19:31:13.2226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKIC419dB1/oos/SKaOV/DfDPjwaDezmloS3KZGv3dGAx+6O9FriKoG74OdyJ/klEmKzbY4MJGoKcPmQT8G0yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB180335
X-OriginatorOrg: intel.com

On Tue, Sep 08, 2026 at 06:55:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unconditionally masking `xe_svm_bo_evict()` errors as `-ENOSPC` hides fatal errors and triggers TTM error log spam.
> --
> 
> commit 8fcbc00a7aa0e3b2119f7df96129747882247423
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Keep walking on SVM eviction failure
> 
> This commit adjusts the error handling in xe_bo_move() for SVM eviction
> failures. It overwrites the return code from xe_svm_bo_evict() with -ENOSPC
> to force TTM to continue walking the LRU list for eviction candidates.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1043,6 +1043,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >  		} else {
> >  			drm_dbg(&xe->drm, "Evict system allocator BO failed=%pe\n",
> >  				ERR_PTR(ret));
> > +			/*
> > +			 * The semantic we want upon SVM eviction failure is
> > +			 * keep walking for eviction, which is -ENOSPC.
> > +			 */
> > +			ret = -ENOSPC;
> 
> [Severity: Medium]
> Does unconditionally overwriting the error with -ENOSPC hide fatal errors like
> -ENOMEM?
> 
> When system memory is exhausted, xe_svm_bo_evict() can return -ENOMEM. By
> masking this as -ENOSPC, it seems we might break proper error propagation to
> higher layers, preventing expected OOM handling.
> 

Yea.. Perhaps -ENOMEM should actually be returned to the upper layers as
this indicates we are out of system memory and attemping more evictions
is unlikely to help.

Second opinion from the Xe team on this one?

> Furthermore, could this trigger a TTM error log spam loop? When returned to
> TTM, -ENOSPC causes ttm_bo_evict() to log an unconditional
> pr_err("Buffer eviction failed\n"). Since -ENOSPC is converted to -EBUSY in
> ttm_bo_evict_cb(), it signals the LRU walker (ttm_lru_walk_for_evict()) to
> skip the BO and continue walking. 
> 
> During genuine resource exhaustion, this might cause a fruitless iteration over
> the entire LRU list, logging a pr_err() for every single buffer object. Even
> benign SVM races might spam the kernel log with errors.
>

The spam is probably seperate issue in TTM. -ENOSPC likely shouldn't
emit a pr_err as it continues walking.

Matt

> >  		}
> >  
> >  		goto out;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908184346.92332-1-matthew.brost@intel.com?part=1
