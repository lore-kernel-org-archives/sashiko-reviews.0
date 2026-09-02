Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEA63EA979
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 23:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390738; cv=fail; b=D0JuMgeca4+/gGcLh/Jxk/Wn64Po4GqUTOcGVjxDjcXHBbR0IixMRcB+b6dPATQ1yceRCiNKn9ue+oy3um/kSm3NBGjXugV1W+mnc+KNFV1cZxpUgxflrEqSbGiElWfwODI59FWlA9D/dG9s5WpmHT1v/lHYFhOo1yDipOh+bds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390738; c=relaxed/simple;
	bh=Efr0rfESaAAh6znpScEcSS6KkoA/uPjP/Ihywihuoww=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hC9AvKYXMOBm2rpkkZrvEUN9vl0xF9ijklJW6L0CUTvwCY9pgwF8g1WuRzjBwXJW0bZkYG9GpzRx4hTxER66XE854+7jTqqzjjkZr9izvBJNf7nys+b55fL7NMDZh6paBlB589uifMY2sIAZuCLnWKK7MIozMFiJcQKNjSMKdYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwiMVFUr; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwiMVFUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788390736; x=1819926736;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Efr0rfESaAAh6znpScEcSS6KkoA/uPjP/Ihywihuoww=;
  b=OwiMVFUrxEmY4nFcDIkA3Po2kBD6SCui86h8ds3lbeCFzwFReSths0eb
   LI98i9/EfRAauwl2DPXW5PK9DbRDSiUdXJuIr7WIu8bcZpHvQTvg4Xzs+
   TIm05izVwsqrZ/z1gg9GUURjm9ZeXLhk/3nfumWCvCwG1yscBZJPvSS4B
   IbvvpAxh0hJ3uJJA/DLZjYwSanqMlW2Iarch0fuCsJjAhrC5AnmByHgfP
   vJ9MQojJXFT3k+Gj0dYlJdma/wPOa54KNXRXarnkgxxHP+FR3c1Mi/6jU
   N+fy2KbJ4IkPiszOV8V7rl+cYQPbTYUkxaIEKkdsyYoTA6crUP7mm2rm1
   A==;
X-CSE-ConnectionGUID: LSaglaUHSTa2EXP1A+TqPQ==
X-CSE-MsgGUID: porWKz3SSuqhxXfuENMInw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100216008"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100216008"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 16:12:16 -0700
X-CSE-ConnectionGUID: TpALWd3sQ8CyN3K2R41flQ==
X-CSE-MsgGUID: 0qnJpa6iTruKQiZ4OcJFjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="268999617"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 16:12:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 16:12:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 16:12:15 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 16:12:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3dguL3gBKp1nnA6r3rLY/1G8j+CsiI4G2rkLqcKTcS/wexwFUCficIkJfcvvnO96LYq96OwZnS5sUJblUkeAdSQ0Mbpac/xq4JszYeHJtMFOvKq3w5Gj12Zq40ypheRiAq+ydaX4ruwr3gn6izHTY9SUEmpoJrCjSeyjSqQg3NABv8pw3tMW0YU3jp3fAMGC4ODy+T71t7gy/V/wJ/c5GJaY65OSNGORjAMP2zGfH6Psk2A1SUrO4unWQXANeJbK+zZfBGNMcZa6zQZJZDlQe4OVJRpfJTZVSW93WQ/rI05oooVCt/Hs9WrMWh0OyTPHOpOw9VyB03pCdF3/wHY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Dov0aNS+pj4XpTkKuYZHzXcgmgONPBmstUzLzN48lA=;
 b=ri2Sv4EqrS/Rc96dceT90c9cLBInGXrotGPblpC429CSTTf0L55vGBjROaZElNz5+PxXc3qutElITgKbDB7uffACyR8OzditnWKYCX9zEh4lVmRyxUBbRnEqs2DHw32ys99O9pL6uzIjfXjbXSZH7YLUB0otoApQ57KK27MoGa/fw0JaaOHn4MNGI0eupC55UTp+pVnApjBqOc86Vheb0ESpAYZ9aGFbF3Sp5Tr70CrRRZF4seuaUKo3dKcQDT57OFYsUXZWQORt3F1LtCyHw9VaeEO+MMf8CAdDBNsyh15oZGx0HzdJLrmqyY4oeYiBMV3e62NJRjjM8Sskligwjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6406.namprd11.prod.outlook.com (2603:10b6:8:8b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 23:12:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 23:12:12 +0000
Date: Wed, 2 Sep 2026 16:12:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V20 14/15] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Message-ID: <apitSREACzTrjbv1@gsse-cloud1.jf.intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-31-tejas.upadhyay@intel.com>
 <20260902171059.CF28F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902171059.CF28F1F000E9@smtp.kernel.org>
X-ClientProxiedBy: MW4PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:303:b9::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b930717-9a35-47c7-c062-08df09479ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|22082099003|11063799006|56012099006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: XJf4d2e2FZjmE86qhAbCEz4Y1wcau5tmPoppSJPLv+YK+zMVArLMcfmF721gavfEMLKRD9uUMwe1RH+vy0H6SLzCq3qi0nKuuc4d3C5TOLaW+6KeUak/sWi6WIh4Z1PHJ5HgG4IHbU21kEKQPHMKR6w4SBJ6IiVQzVK8q555xgaGxa/HPVt1admfz3ErMEnyt6kKgBoZ98WiXGP+1qCiJD8vhLAMTvIBJppH37KhbDTZhk8kBMP0c+/yrOFf01D4lFvQtjVr+hiNUA68/yhOzLUdmfqOxvAYNnSovD9a/Bfxpllx89pYDh6d/I1+ajZ38w7vrzM5bbEC08+/5Vgzb4wiMj4NWSM+0qPZzK6mVCnBjyOBEcRx+NfCsNSvOWb4+RvQ2T175H9bNspDz5f3ZLyCknJhylTW9pfGKSD+CsMWnt7a15cAPiuuOE2eYLcHABCyoV9ln86LUZChvL1tqDkGlWpsma0dZzFE5Btdm8oYwsLg8IFrn3arC0S92n9WaoVbuWrql0DlPYgHe1anXufk3AQI8xrqsKn4eCh5h8smMlRMiht8owDf/9fONgJgpOD0skk347Jn2IPpSMwZrM4s0ALjGoM0GVHVbfVeQe4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(22082099003)(11063799006)(56012099006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?c5Sda8k5HT3lDVap2/d8METJGAByDzmBMtdpGadsHcfSetnj0lVK/o2YRo?=
 =?iso-8859-1?Q?CC6SqvAbcn1wEBk+qToIfwOTq1WAwaPxBXHuF5Ef35fXybc7SHYmVfMeQI?=
 =?iso-8859-1?Q?zVadQoFBSKNHseWIJi0LpeTG6Yxa8xDi4NH8hxPpxt6amehLyV7FID3oDJ?=
 =?iso-8859-1?Q?q+F1i9L84FxNGfqEGJ69C1FzWQQNEvk9APsH8bYadBHZDZNPrLTtGG2v0h?=
 =?iso-8859-1?Q?56iydZYJ31xUb/lHwBVM/z56LstceS8QWkb9E3VfqhNVyMnC9PY/RlGYmM?=
 =?iso-8859-1?Q?2foc1u4xkJKI7Jt8KzLXN2hKw/Xi1m/UGw0OhAduh9R4L5gB2Uxk6kJcgA?=
 =?iso-8859-1?Q?JV6kz45eg0ow2DmnmMyRFXF5Ig46dczM4daWOS3CW6jXLCwCyydBkXyorN?=
 =?iso-8859-1?Q?TIg9KFkLjtSb9AY1rf4LN5RUtup4oROuaHNR5zn+ro+JN8NJK1D/YwWNGi?=
 =?iso-8859-1?Q?42x3FIc+GRKtkIOs4ioqdSwzXrtvzU3uTO+/gWcROFuew9YLecsWMKD7NI?=
 =?iso-8859-1?Q?DlcgN5KKilfQB//b2njy2FV9PE0NGLK00AXu55LNBA0V6DpgXeKO8CGmNa?=
 =?iso-8859-1?Q?p/2sM34j6T1vXW+gsjcvdNUtRJred8mdTp5GCHBS7ouGmkYvGmfYvoQtP4?=
 =?iso-8859-1?Q?T9lSr/Oaikv8q/OMDn+mpyWf7ccMNcoyqnhn8T3VQzgRy27fuAW5nn+oAv?=
 =?iso-8859-1?Q?uM8atjZJNbIf3NvSJQI6cNHsOXxyDRcWrRnds9ZKW7U8xf+bLV/oqU3bk0?=
 =?iso-8859-1?Q?d1lJpzj1bO7L5wUAiDzjjLHLIFo5JDY+/3XktKYSAh5BH1Smk7SLA5CfrH?=
 =?iso-8859-1?Q?FItJT6MTs4YvVerW1ozKUTw3+Gv/RwhQPR2yuSn6lpCHDjeHJDJfWlFO78?=
 =?iso-8859-1?Q?RrJ2CVk7Sjw9bG0WvW17wJmapvoRy8In5h87s9XSarGoxusag9+6u3Hbtc?=
 =?iso-8859-1?Q?rqbY5nIGaZFXcHZP38VFfxBsXUY3qCsvtk1F7ywMXSOmzoqNINwAUkrnZB?=
 =?iso-8859-1?Q?GCvdORjjH/+jYU4MR1fJBa/tvWYx+qOtpfvTVkPHpa7zo05qkGgpxzwqT/?=
 =?iso-8859-1?Q?+S9a3CFxZT/aV7wwUEQ6wXkrmyO0LZlGZLPjNSeuqLBgL8yQCBY29KrG83?=
 =?iso-8859-1?Q?qhhzECJ++kg+Qvdilfm7Dk4tX8A8XvTISxe2TqFLxsLNVXJEbmd4zHM1+K?=
 =?iso-8859-1?Q?ACpXKdxSXoklCC/3YWLIqSjY6QFOrsHHYpFcx21cLO/bGa+ZMA8ZNh3qzX?=
 =?iso-8859-1?Q?algVgkIPMj6eupKIgXzJi2DPyKx1jo9wb94HzYNn4YhvhdcfI+Gqrrh8cP?=
 =?iso-8859-1?Q?Ef0kU+OykMk69/2xM88K2m++fjzA+voHOuGj4J8aGn7YJ/seP7ozQAa2mO?=
 =?iso-8859-1?Q?VNZXnHSGJUC7RoQPbEXsZFr6t034JImI4CkLvQzWNH4PBhh0r3uG6aveGM?=
 =?iso-8859-1?Q?fE85FIJBfOQEIjukRrqxTLSwitdZ7CLo6Dez3epSLqbFeCJi8JFtK2K93/?=
 =?iso-8859-1?Q?5boB6nfZ9i03wrl7Ps+MbuvJtdeGticNrHtlVzjHAzIzG/6q9t67Hps3x7?=
 =?iso-8859-1?Q?kIHysz6TQjz2j/pKggqmsUpD8dd+QpfKQHw1jjanqgbYe8kvAqfI4F0CWQ?=
 =?iso-8859-1?Q?+nD5oQju+pCmyTwzrvRrqxD1E25ewwV9ayNGqZ64vUwngwL5sPfKZHqVbo?=
 =?iso-8859-1?Q?Lb0FGagb20ajdc/YgfsK3Srwwpezy66tPXuQJrJyKrD8fyYLM7lYFco54O?=
 =?iso-8859-1?Q?7hMVxCEJx3j70qi7qFd6flgI5BDq53G63ldSL56m77Kad6B4qVEgQWX5Cg?=
 =?iso-8859-1?Q?2lIttlTjllVTgAE/ar1J2WffUqTsIK4=3D?=
X-Exchange-RoutingPolicyChecked: jX5ENSciVVsAPjB6IrlJ4oSmnlZAdnmdgHIkzPKuePOrr3f9buxm5zusTh+kCoWjH+Q/OlFIvn5lUYptkneU6LQOjUE5zOgyDVTewazjrPe3ML8PFzBetnkfHisYDfkg1dDQj0z3YZ1+zLRsh+Kj6zRUln+bV7WEHu3a5Dc1oZ6DlVfzlFrO3u0uX8hDLLrLKRDZ8Bxxk36c2cHw+sQVRGhkkvj3eGqafUWu68tVtiKkIfVEolFPJ7yu0rw1NC00Vt8Q+69CfjONt29wcPL4MXF3dkTfcyN1mNfIunnQ3neFSh7MDjpYzqv7/3qc+63+IASzARMOQj2gF2Z9LwNHSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b930717-9a35-47c7-c062-08df09479ecf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 23:12:12.3653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ip1RXM2+f7AEXxWqI1smN37+x79rh3Q6Kx1I/xgjTiwUv8ZvsyTqLqZ4JBS6FPdJ5Mx7lmaQjYmyrYLDyEoGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6406
X-OriginatorOrg: intel.com

On Wed, Sep 02, 2026 at 05:10:59PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Incomplete and inconsistent queue tagging for `PAGE_OFFLINE` ban reason due to mutually exclusive list iteration in `xe_ttm_vram_purge_page()`.
> - [Medium] Missing read memory barrier (`smp_rmb`) in `guc_exec_queue_reset_status()` allows speculative loads to mask the `PAGE_OFFLINE` ban reason.
> - [Medium] Multi-queue primary status check in `guc_exec_queue_reset_status()` unconditionally masks the `PAGE_OFFLINE` reason for secondary queues.
> --
> 
> commit 461fac78c1238596fc6141993bb5f0e31fd92773
> Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Subject: drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
> 
> This commit extends the queue ban property UAPI to return a bitmask of ban
> reasons rather than a boolean. It introduces GPU_HANG and PAGE_OFFLINE 
> reasons, tracking these via a new ban_reason atomic variable in xe_exec_queue.
> 
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> [ ... ]
> > @@ -2580,13 +2590,29 @@ static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q)
> >  	}
> >  }
> >  
> > -static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> > +static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
> >  {
> > -	if (xe_exec_queue_is_multi_queue_secondary(q) &&
> > -	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
> > -		return true;
> > +	/* TODO: In case of multiqueue, if a secondary queue is banned due to
> > +	 * page offlining, checking only the primary queue's GuC reset status
> > +	 * may mask the true reason or race with it.
> > +	 */
> > +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > +		u64 status = guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q));
> >  
> > -	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
> > +		if (status)
> > +			return status;
> > +	}
> 
> [Severity: Medium]
> When querying a secondary queue that was individually purged and killed
> due to page offlining, won't this check unconditionally return the primary
> queue's default status (GPU_HANG)? Because the primary queue wasn't explicitly
> tagged by the purge, the secondary queue's PAGE_OFFLINE reason gets masked.
> 
> > +
> > +	if (exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q)) {
> > +		u64 reason = atomic_read_acquire(&q->ban_reason);
> > +
> > +		/* If no specific reason was recorded, default to GPU hang */
> > +		if (!reason)
> > +			reason = DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> 
> [Severity: Medium]
> Is a read memory barrier (smp_rmb) missing here?
> 
> In xe_ttm_vram_purge_page() located in drivers/gpu/drm/xe/xe_ttm_vram_mgr.c,
> ban_reason is updated and then smp_wmb() is called before killing the VM
> or queue. Concurrently, guc_exec_queue_reset_status() reads the state with
> a relaxed load in exec_queue_killed_or_banned_or_wedged() and conditionally
> reads ban_reason with an acquire load. 
> 
> Without an smp_rmb() between the state load and the ban_reason load, the CPU
> could speculatively load the old ban_reason (0) before observing the killed
> state, resulting in userspace receiving a false GPU_HANG.
> 
> > +		return reason;
> > +	}
> > +
> > +	return 0;
> >  }
> 
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> [ ... ]
> > @@ -637,7 +639,30 @@ static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
> >  	xe_bo_unlock(bo);
> >  	/*  Ban VM if BO is PPGTT */
> >  	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> > +		struct xe_exec_queue *eq;
> > +		int id;
> >  
> >  		down_write(&vm->lock);
> > +		if (xe->info.has_ctx_tlb_inval) {
> > +			/*
> > +			 * Must be the write lock: send_tlb_inval_ctx_ppgtt()
> > +			 * mutates this list (list_move_tail() onto an on-stack
> > +			 * head) while holding only the read lock, relying on
> > +			 * tlb_inval->seqno_lock to keep itself the sole
> > +			 * mutator. Traversing it under down_read() would let
> > +			 * this walk follow entries onto that stack list.
> > +			 */
> > +			down_write(&vm->exec_queues.lock);
> > +			for (id = 0; id < ARRAY_SIZE(vm->exec_queues.list); id++)
> > +				list_for_each_entry(eq, &vm->exec_queues.list[id],
> > +						    vm_exec_queue_link)
> > +					atomic_or(q_flag, &eq->ban_reason);
> > +			up_write(&vm->exec_queues.lock);
> > +		} else {
> > +			list_for_each_entry(eq, &vm->preempt.exec_queues, lr.link)
> > +				atomic_or(q_flag, &eq->ban_reason);
> > +		}
> 
> [Severity: High]
> Does this mutually exclusive check cause PAGE_OFFLINE to be missed for certain
> queues?
> 
> The lists vm->exec_queues.list and vm->preempt.exec_queues contain disjoint sets
> of queues. VM_BIND queues are explicitly excluded from vm->exec_queues.list, and
> standard short-running queues are not in vm->preempt.exec_queues.
> 
> By iterating only one list based on the unrelated has_ctx_tlb_inval hardware
> feature, the driver selectively tags only a subset of queues, leaving the
> remaining offlined queues to falsely report a GPU_HANG.
> 

This is right - we should probably just use exec_queues.list. I have
various code floating around which use exec_queues.list regardless if
info.has_ctx_tlb_inval is enabled. We should probably extract that into
a standalone patch and then fixup this code. Another thing we mostly
likely want to do is kill all exec queues too.

Both can be done in a follow up. Can we get a Jira filed for this?

Matt

> > +		smp_wmb(); /* Force all queue bits to be visible before killing the VM */
> >  		xe_vm_kill(vm, true);
> >  		up_write(&vm->lock);
> >  	}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260902145343.465686-17-tejas.upadhyay@intel.com?part=14
