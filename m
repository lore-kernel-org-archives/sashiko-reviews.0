Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525202F7EF4
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 03:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790305892; cv=fail; b=K4HNPwMftlkJxBVw4JdI96fuHZQzqyiAQCW2t9CC0X4r1kzdEZzvWhRtafNccTawS6M/swKMnUi49QqX/tHbNDMNKJXHDf5n89hkXuaQxlkSN+rKGA/aaPETDc4hHK/kHALPDgRJ85cZmDA+EKrHI/bjr1Y9lsMslo21AQ9RpsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790305892; c=relaxed/simple;
	bh=o+Ve1yTP/8fspjvQyMHKKTSECLzsQwOTCZ8lwi7DXzY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tNhiVN/YZQvsN0nEHnJ8RWMC9F7QbDuPhdqatpTwILEhz9S133QteeB8pIuNEwkUhswTJh03eX2LQm03nSzzkca20I6890aI2TNeSWEmilskCK+rZAdzGf59FwJgAOXbXQBSsXHLUTjGMhRyW9awk6rhjzl2JqMeJ3W9SYqCaNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTqr/JY4; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTqr/JY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790305890; x=1821841890;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=o+Ve1yTP/8fspjvQyMHKKTSECLzsQwOTCZ8lwi7DXzY=;
  b=UTqr/JY4mkstx4vQek8Uvu5h1IzASYUbH4Wg4J+lpsV87T1Ls0XqPWKX
   lhm7L/LA1J63wWtYTzQCPXQmdH/KGjY8Iz58PfSc8KxJd3Xgkz52BDA8g
   jBQjocMuZ98XR1ScG7qF3l5Iv0nCUS0AUo0/24RyoVQwRVL9yzt1dLgZ/
   ZB9baE1zGwJPYJMPLBjMPsvVxQ2teOhywJ06f1LKVnZtCgZKsH1BduDPP
   NOKbnwhwcgiUsPkqp4wvTuC2PEcCFL7VjHvfHt6KG8ZexMXjXlU6rcHB5
   kbth/sS4gN9OL5u46Q0l1IcnPTxaUM+u/r3S6HfizEZHgepew8N7ieU+c
   w==;
X-CSE-ConnectionGUID: MmakIJDlTt+gtQDvyfxTiw==
X-CSE-MsgGUID: d9I3kMwDQR2UBDx15ttAGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101617037"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="101617037"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 20:11:29 -0700
X-CSE-ConnectionGUID: Lxs6ot6dRsG19Hv/7dWk6g==
X-CSE-MsgGUID: dYXGw/JFT+2YvwzyKuXS2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="277606252"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 20:11:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 20:11:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 20:11:28 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 20:11:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMEUhyVGTMeW2VyNfj5A5GrhkW4w4nYBUgiGKQzqesPMadZCll0kqyuNAWJjHCJXFJ1NCvCFbbQS8RiGjgtFTv8coEfFV46hOOo9S2NmJK5ZVmlg+wJvPxgEGg1PvaLDMHLZ7ynkdjRO/GCRT118Syu+vzqTDpg5GzVGFBx9l2Cpgpm3I0HDilj+N7NgOEY9kJtqdFcW4srzAFZOqOR1y/C2ybUQuZPl7Euqwa7kmRJXT9ROmOzWAVQeW6UVOp3q3d9wcB+yI8uXL6Q3x3eJ/WJ6xRm4w2fgCOihqmyahk0Lu3ItR6BybjO8nAAfO4VyBocz0U2PDFrSBDCuxvDgCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNzJ1G22o8JjjWaa/ZchG8AH29TmG+2FbJqfIfMPZI8=;
 b=SiyDAivF0hKEuiknHW9bNlmLVmCJsDsoPzYN2m959UnL7fcuJ89Gq2Ytr0iSugXXKrXxG9RMD6CKt+CY7dCn4fVK/vXzQAPOnBNZv+1dukNbktDMBS/OkvBb067fD9CTOb+lS3N8KNwafqVjqqSIKGoGdO002IR3n6RoSPDEzckThOMX0tGdJ8NrrjnvlsJtvdlGPIrAFvwm1qb050UCDgppju6wRn7jv11hBS4Pa1t/0Yo8wAHy5iNnsHOMmUYTHucXfqw4+S73kTGeTDNQ4xLF/+eAjBslFyuBqDARWI4pQwU976tq+5dKDeipyiAJ3MmRoriSOZzb6NKc8JNI3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SA3PR11MB169024.namprd11.prod.outlook.com (2603:10b6:806:588::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 03:11:20 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 03:11:20 +0000
Date: Thu, 24 Sep 2026 20:11:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 17/24] drm/xe: Add device flag to enable PT mirroring
 across tiles
Message-ID: <arXmVtIOiBcP6ePh@gsse-cloud1.jf.intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-18-matthew.brost@intel.com>
 <20260904214039.938631F00A3D@smtp.kernel.org>
 <0cf55a0a-4bfb-46c5-8718-410ecc860e96@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0cf55a0a-4bfb-46c5-8718-410ecc860e96@intel.com>
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SA3PR11MB169024:EE_
X-MS-Office365-Filtering-Correlation-Id: 275ff7ed-9098-4a75-e6cd-08df1ab2abfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|18002099003|56012099006|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: H+9DnL2fhqbqCXEQD5PmlgPKFXgYNmpDBPRU5OLIpwwZ5o+842MdtNFKSDngNuaOepzPRnBa+fjJ/UvaAOtN4lfoEa039zkAdvz8rFTR/eA4i2rWFt5YfFKAzlF3uch0EhOs141pKloku7YLZdUGO4OhZA4NtCDKfLZzqjfglOC5CHqilqFZyFD+44fdOS3MDROfw/L2K0BfdGRPPV2L+leFpOciAnfSUpiuPUfjCGqXMPu435t22Z8Fcb6sfidrW+mBsZUj2BrBNsXnPrjW7x73YDVP69jDjNYnSpeLN/HtOIYOjyS4gEVlRgKSyp+GRt0gBoAPjv0BBxi6fAxjWehXesDobLmZS7rFX6fjoF/Aim0L9F9wVl9btXvEjjNU+7w8gXQjjnXpfYj+4nSzd0QbxXANKf3GJ5dS78nyEXn2vqMyF3AAKIFuqO6DUdr5YuMP0pH5hVS9G0LoZzmvdPL3ks7i+k04xNui9IPEQsLt2wKLQJo6+F6gDEnfuMnJPuKqWXoY8Rtwg7UxiJBa2XGkfNfGOwgB/hLMwpqwAQYs0ZAJ4GuaHrq7548q4N3OUdWk59Od3XaKmgDQ+wjoRSoiLqYsvDsrIOZ3ipUxHBs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(18002099003)(56012099006)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PkLOHn7ljW9c3pWSrsmjRwOCsYSEx4dj3BDdYvSBbQ9W1aRBxNo5EoZJ9Bhg?=
 =?us-ascii?Q?VtYHM/kkrpqCgdt2vZqI0EfpO2H90E93gJCf5doIQmm8PDnu7Cm5tbBWQ5M8?=
 =?us-ascii?Q?j5dAaihTdiIq9d9jDZVrvevCNCeepnKHPrUNPg7g3njdY8R39uWobzmTm91x?=
 =?us-ascii?Q?J8VKjnZatxD4933rO0s9qeY0HJmWZe+y8TSTAkZ8/yvdS05vy0U+0MgZKxS0?=
 =?us-ascii?Q?WFzyoYF9NdDbO2jXJWRGuMBY1LpaRNbPrK78HPaFiTlL0mVBGUsmmKw98bhF?=
 =?us-ascii?Q?cECvMfxRJSMTwrtVCy/AYDy8wMOZfNLoF7nsxGXtXhpErmcTGbcvMcUNl47z?=
 =?us-ascii?Q?U6VYjt7P/GrV354x4kfinG4m7HaXnnTQGhmjqVDG/Yex5NWykfQawh3ac4q2?=
 =?us-ascii?Q?lehkTznOxTCPEzYVDmI6D3rNPz0IoZE6uEZFfp2K8RVY2n8ZH1kOcN/iXVlY?=
 =?us-ascii?Q?pZ4rSagwoRrKULiKWo0lUC95Jkhzsq+uaxev9RkV9NAIjBemLGYtLVI43nWR?=
 =?us-ascii?Q?sZPijZMEfJPvOvPBvZPdYA7G1UDNlN65/boJxbEA4OEC+QIjxiZVIeUeTLDx?=
 =?us-ascii?Q?NgEMfggAOlaeufViWFYOfR8SrKPk/YYm61jUxsojojlInTLd7UHkmUw7iKJV?=
 =?us-ascii?Q?8qkFpbpo592u+h8znpypSnRMNGY1hVl3ALGmT6W6jZtyeu7Af1nk4MLcEfj8?=
 =?us-ascii?Q?qeWzkVdssy3bk0o4ff4La4iy8pM0vHqCgaxDTNX/LnkQ0XkyT7ZUtnvh+aRq?=
 =?us-ascii?Q?mbGqcN8eR7EfQ3S0tosM/B/sfWDYaD3pQeiRkl4V7TDd/dhlaC+LygFj8v2c?=
 =?us-ascii?Q?blxksqwOw0qXeqthTh4bKDDAGZbYtRDOWVn8X1mmhzNte26HksdRmJMo6Cut?=
 =?us-ascii?Q?CfA7e5cK1pFJeARYQTU02AOAi6ctTbfFjzWsaMj4IMjxi41ZTeQuqKTTZiR2?=
 =?us-ascii?Q?n0fEEaGXsVaFoXm+TwGOxfpT/EjbD0X7MrEeyIF/TUpUTjCDxKcaTFeDpgZt?=
 =?us-ascii?Q?dxd9Vm4Wkr4bi5ZAeVao3NhCac+P3GBhgrscLU2AKGfgYkreVSpqCIm01iRB?=
 =?us-ascii?Q?eAYpTB/oaqSClLrZxEkGpq847hbbivqZPuj6EdP7Ekii1Ronzk2rhSuTXtx+?=
 =?us-ascii?Q?3YmvkqYZKKRBVQeXK6E4NK9niaYl5QYriEmShXYVhYgWu5pvTIDMzjB9zh9M?=
 =?us-ascii?Q?6OBbzCmLhVggD5GGZ0x1zRT6X0xfYaYDCdS6C2tEwVOSVK5QPzd9BRXEXa4E?=
 =?us-ascii?Q?RjXYnH3S8eeT/9Zpii1jJfVXzMRJdPLbtCYFB3rJy2DZ51YWUdArOv6ZV1xW?=
 =?us-ascii?Q?oYrRc7CymEiOXsu0Q7TKLkVBPGqof8wNRtZgJT5XQtF/cA24oKlZfW/ixZpT?=
 =?us-ascii?Q?3ygzOOhLbsZ6nDolJ9St+iT4xLIZx3VXxLgTs9HdLnuiqNYDXFHAuJGEgsxK?=
 =?us-ascii?Q?gMu+p6QDXxrX+z0XT1uS0DCXTSHzrAhZwB6f7WcFAesF7Mbc+A4ony9tKKFS?=
 =?us-ascii?Q?s1DZ1vKObO0brM/imB/J6NaZeLyruzLtFFKC0p1X3gR5KdIpydQUzZtHw6mn?=
 =?us-ascii?Q?d0hfqKj4roEANyuTy5bTSQmv22BCuOC+CIESWrbgsUHDDQvl8Jl+9TwNosDk?=
 =?us-ascii?Q?020FagjNp50Tw/BFA5x/rC+fHZZEcMGdiBWYigf5SWqmcjohR55QmTWQ8+j/?=
 =?us-ascii?Q?syGsk9SUy5gJe+wHR2uhHCwNLexJ+z+U4kAa0GVx1iod+gDHg94xq8zMbd4H?=
 =?us-ascii?Q?HyUodd5fHw=3D=3D?=
X-Exchange-RoutingPolicyChecked: t90DhSCAqkPiXOol66G6RS+hnI5KTuxXpbAT3Dv7NoRMR6ctwXMF3ZBRIreXglAd9aAspdjlNGpy2ZBLtTnJcoh9gDh69d9GN9Rt+xc3IyljOgJ35HHCmtBCBXiJQaXnRokp9wYfQ8WAXGo2JtL72hXzGzXj/QzX/TSFTxPuysQjdMJmhYuMOK7GvmB32c24II1xz+rpvHFK4v4d6WmANcFgLZjXeu0vfoHfLqS4+PiDlPN7j0mnrvrW948/9Y8OQ+dxXmDB0a8I0FwDfSMjnSc4+AbgDWJckFJ5odGK4EJUL1CuANz8pAPyuZMvWW7C/PHyCx7U90S7VAlf6tf2HQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 275ff7ed-9098-4a75-e6cd-08df1ab2abfb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 03:11:20.4433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tb0Mr7xogUNyFdAqHIqX/ZfiSk7iXJdhmr1W6GOF5vFYe6LvGxegLSMbuQe8xmUx5L1F1bJ5WmeIsgsztX5ohA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB169024
X-OriginatorOrg: intel.com

On Mon, Sep 21, 2026 at 10:33:42PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 05-09-2026 03:10, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Unnecessary allocation of page table roots and scratch structures for secondary tiles when PT mirroring is disabled.
> 
> Looks valid.
> 

I'd didn't really want to over engineer this one and this wastes 4k of memory.

Matt

> > --
> > 
> > commit 34b539e899a7643dc15dedad6a3cd229e0c0f4d5
> > Author: Matthew Brost <matthew.brost@intel.com>
> > 
> > drm/xe: Add device flag to enable PT mirroring across tiles
> > 
> > This commit introduces a device flag to toggle page-table mirroring across
> > tiles for memory bandwidth considerations. It updates the VM creation,
> > rebind, and page table update paths to check this flag and fall back to the
> > primary tile's root page table when mirroring is disabled.
> > 
> > Link: https://patch.msgid.link/20260228013501.106680-18-matthew.brost@intel.com
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > 
> > [ ... ]
> > 
> > > @@ -1738,7 +1748,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
> > >   		for_each_tile(tile, xe, id) {
> > >   			if (flags & XE_VM_FLAG_MIGRATION &&
> > > -			    tile->id != XE_VM_FLAG_TILE_ID(flags))
> > > +			    tile->id != XE_VM_FLAG_TILE_ID(flags) &&
> > > +			    (vm->xe->info.has_pt_mirror || id))
> > >   				continue;
> > >   			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
> > 
> > [Severity: Medium]
> > Does this code unnecessarily allocate page table roots and scratch structures
> > for secondary tiles when PT mirroring is disabled?
> > 
> > For standard user VMs, XE_VM_FLAG_MIGRATION is unset, meaning this if
> > condition evaluates to false and we proceed to allocate pt_root[id] for all
> > tiles.
> > 
> > However, when vm->xe->info.has_pt_mirror is false, xe_vm_pt_root()
> > unconditionally returns pt_root[0]. This means the allocated pt_root[id]
> > (and associated scratch page tables up to vm_max_level) for id > 0 will never
> > be used, permanently wasting VRAM for the lifetime of every VM.
> > 
> > Should there be an explicit check to skip secondary tile allocations when
> > has_pt_mirror is false, regardless of whether it is a migration VM?
> > 
> 
