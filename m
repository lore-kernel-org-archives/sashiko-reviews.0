Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABB8369D74
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 01:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788484736; cv=fail; b=N/Z74VpdW/oQbXc3U5ZIsh708Pl5V/TPxSW29eyDzvb+6LI6T1Qd99/DNbPQN4EweJTQWnNgtnL6raIjb0baAxJCeT5mEO2VO0rraQ6K3g7hXM5HhkhBOtAaJ54nu40jwMTNnTLSajjy/RLW2bzBrz+7v360cyUwrpzQ8oVjvmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788484736; c=relaxed/simple;
	bh=7LPk38IFFJtWUEuvzRpLE22bwZbq9MvDCyXtu2r+WTw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VjzgeEfj81bh8pnV9rfN61gWdhhDwDz+T6751/1KjLHU8bT8uEblhn1oRgFkx2mZ4KtsUhJ3aUs/7LK2jkCcRXieyqUj95halBGtJ8xY1d3ABOTrZQ8X9DGMvmjbNw6ufg13XGdJ94IBfUxwwVwLC+qotPDDzX9sMUt4Z1ZulZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzAKjD8l; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzAKjD8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788484733; x=1820020733;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7LPk38IFFJtWUEuvzRpLE22bwZbq9MvDCyXtu2r+WTw=;
  b=jzAKjD8lHrlTQCUR7ImwwQ/ug5QvCqW+vYmndurUQa3VKmKy2QH9pxj9
   1VBl7bn6IuXI9pyvNLQgYsLwzSTA5ZTOiM4LkbIo8nP4DOPHcJ5AiBbnI
   dItFjlMWNHTXMYBLQpQbYHrIczBSBBqx+XfbZPbblf+3Yx+QUOLsH27u8
   dm2PlQYdI4Oi4OlYwpnC3UYknLklWoOLIoWEuQIeBSbw28oC4v0zJaHs0
   vMz14EssYVYK5O4rpQv3CibgkOCjTmDmjovFbTavGAylFrXpu3SwkxnaY
   gd7BCMazgi9qTD8as5ZotY/+t2AoFLuttl+8cQQvZ2ZTXHsqJpR2z2GYS
   w==;
X-CSE-ConnectionGUID: SdEkNt85RbGHmlsv3ZWmoQ==
X-CSE-MsgGUID: ukp9owfORqG5dBsf3O+e6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89004085"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="89004085"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 18:18:52 -0700
X-CSE-ConnectionGUID: 02NR41tfRU2Z+szqAzj+eQ==
X-CSE-MsgGUID: peA1zkGvQ7qW2GzpkZVCpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273674615"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 18:18:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 18:18:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 18:18:52 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 18:18:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtQpogIfF8xsZE5nNUR66HNGjSLaSlcnmNJThMwZWJE95xbU3FjcWnWqs/tZYrxzhoGTBWdDJejOKcpjsuVoNcfRIWOP1gF0gOonAgH6G0/as2wF3ZcnRB53jE+CyIat/IEkag8wvzjab4geHP6feEFGq6zGV0bkfLA8woAKNU/3UwHR/3QjQB4wPQ3tfa5Qu614bWqLe16IwgBd+S8zfE+tFYpUufRLx8vfgjLATi10M93PCxLBERXnGwj4AoWIwwzvUYdBGIqGmD+aoI9CSkS2vgzjNoGNxO8L41qoJMHHWP5LuY9f2jYbKtWjIxDiTwqqquOnZ0G9XiF8jS4Izw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiS7zLXx6dqYp4UYBXa1P0dQw8kM2beMTLOakNkp4JY=;
 b=tIm2VYnBrtmUujRQW6xZ/K5FH5gc6qxO6Eq0e+gIGd4FzSJm/SnJg1C09BLQAgMFKek1l+PlqCFf7l5KeE5UA50hpOBaPSHKyiG3umUUKL+C17AObGGUi7hincfnGnL/iv0V7zmGY9UkNZO5Tku0mwetYInv6sb7hdCU5Jco1gkgvowje6CR41h18ag2QIp3/tQ3RvbO0XLAVfk4aVRXVWijHQLQc6zWdyppm3KyQBFkB/hSsWAwWkLbCKb9LZ5lus4E+oIM07Imy4dhGLsq2rpjTS1ikSbcKG0aSLhB7wB6kyT/FIk/TX0Vql7Ds/nUu/s2YFWmi3Jlo519kna2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6241.namprd11.prod.outlook.com (2603:10b6:208:3e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 01:18:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 01:18:48 +0000
Date: Thu, 3 Sep 2026 18:18:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 16/25] drm/xe: Add CPU bind layer
Message-ID: <apocdrrhQzWr/1v4@gsse-cloud1.jf.intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-17-matthew.brost@intel.com>
 <20260904003150.1ABBA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904003150.1ABBA1F000E9@smtp.kernel.org>
X-ClientProxiedBy: MW4PR04CA0253.namprd04.prod.outlook.com
 (2603:10b6:303:88::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f25b2f2-b4fa-4854-6cb0-08df0a2278e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: L71B1I4aYBhYYLQn/ptr6w8J/hxw5mBMKLFMnqDz8r3P2sKNw7NzjysGXrE8jmiQsAb+exkdU6ocTfNOcUHuH7h3zSMwdTDYeAAdG4f+a+rj5Yv/QoIjr8c+dG0S3WEnErH/tp1MXiOl8O3/bGMnQHo53pSuKtWTd1tGPG6NRD5exKy9Assd4MEAqX2kNCi/vgxB6iXjKAp5uaJMud57KW8E0mdf3CwwCQ4hHCcMGRj8wnB7qsrxxclaVvtaQY7yigkOGuvQtwWepZkMjkUwHABk7HuVVeRe0rmCCFrf/MMvog1LBvaOC0eKJ/WgmFKxpX2UeJ4g/Fmpsv78fop2y9lLj22P5EiDmcZpLWTqSIOxntuHTkFt6fM7fidgOvJNDD4nikF86RjtC9lnvWcbin99qY7sUfZjJHD6djY0RP0cZ7MDWyNgyfyT86vPMEGMsANcV/klUBP1udF+ZeKw8LpD4jXIik2ECC4UOWAyrDV4Ghi90wuxmrrF+YvXDh6oeeXiNpeXISgkwq/7IvR5pVYFTOWEdwwWfGY16ff4urJArQ5HxztrYRhr6zLGA8Y8+u7qWalXKyTRvhVXYqb48FQeFIlYgaHRQGxZG47Usv8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HGo/swhh32ubIsSmXaetAYtUJ5hQu5rEQCN6j0h+btxuvIC+7haRxNBIsi?=
 =?iso-8859-1?Q?YETIamWfvWbnK6BsUDSJ2IqUuNUBQ8CJrdoGE+2Rtu/eLD0wr2eo2GE5IG?=
 =?iso-8859-1?Q?ODq6wW29f50AQQpm7IwvwDkgWeL7zkgF9/lAznqSyxRKPWow4JhM709mGu?=
 =?iso-8859-1?Q?fEzfhB6An1jhd3j5nB7wEQsnPTeRqHQtI0j5kZbO4e0YoOdhpWbUzc8YqH?=
 =?iso-8859-1?Q?PY+BwOkZZLJVS67Tw5KF8nCa0feIHhrrPrB7bL2llxiNkZSsSt3Y0u1oif?=
 =?iso-8859-1?Q?EORnvtDL0tD5wQzR3lVlmb0+v2RfCst3vN2seY3JpBxLR5qFZxJYicZuEu?=
 =?iso-8859-1?Q?AVenoPXv8HTy4r3tauaobe9wp1PCt3QTs0FJVU1+4r7i6zOkKkPAoqVkM9?=
 =?iso-8859-1?Q?FSLtyuc83rI0X9qrbPMgPFh24MrGMddjGBx1wZrdvM0RrW3ERuHNEmOwlf?=
 =?iso-8859-1?Q?Jkyap1DpmJynCHlYBEHdXRZ/pWWs5wQ61M5difYST7G9kIXzMs/5eRgOb/?=
 =?iso-8859-1?Q?HZ/v29vH5LH3GVzAU6CBjbzGToK6HLdL6gyPQc83kJNbcXTzzfSYSF0uYh?=
 =?iso-8859-1?Q?plhip2tJVpEXDmBx0q6vwgmyD74p+YDni8XOSxfB48nBg6SKYTqqgVoApX?=
 =?iso-8859-1?Q?D5YZ+To2FrWrGSCbLcUb4ymt+UhnFCDDjwxV2B3hGxsoTBSVImJKseTafC?=
 =?iso-8859-1?Q?vDwJWP0kqpFNrE8FHsemUgaPlIZmea2uIKcz6WBLAozsLSjLZusR5yIvH9?=
 =?iso-8859-1?Q?M6TXGyXiZZ5K/YHzYM4htg8nzZ2oh1pjM5VOQoDrLtFk+p5f61HaTHwPnS?=
 =?iso-8859-1?Q?OQGkijRKPYCHm4IUtO6HIfs5g7zG94r8BhiLYISV3a3/buFYfhF/Utgp0q?=
 =?iso-8859-1?Q?7G8Pvk25cy5ed9aUTkbDcM1VBu4dzzovjcj4Kpxt100/5LtmWBPkk5wity?=
 =?iso-8859-1?Q?nhxiZkSpsdpMEaRL4kXGPjZDxNMXFILsL5YbTYbFBkqL901UlSsQxtG2qh?=
 =?iso-8859-1?Q?G+m9gD5wg5XwQI9EhfyStuKX43OjxN3i2xKwPCwz3UJqWwcSjTSLn08T8P?=
 =?iso-8859-1?Q?TsVoBEGxNN7uNL4R7eSq12JN5SKCzlUtLD414x6s1QDQ0kdA54UksKqy6V?=
 =?iso-8859-1?Q?U2t9KoBhJHO/k8hZVeu8ZVYyNY9OzDbV3F5BhaPJ33r95yGKbY5ElGo6Xp?=
 =?iso-8859-1?Q?dOKd3Ng/EzxvOfSV0LDP/ALEvNEzZciw9tOgUAskVKiCl4sKNeJD4T4hjr?=
 =?iso-8859-1?Q?TxmZ/6xdn3Lgc3h5J3B9uGuVcZcHym5RWwOL3oKaKxKU65/1S/JSBDaHrZ?=
 =?iso-8859-1?Q?H8iB5bj3tvMUPrq/sBGQH9lqbbPMQN41LtcgTr/lHEFYlqAlL/AVP6FyY6?=
 =?iso-8859-1?Q?C2Im1tA/Oz4QIcgx8h6ftWt55sFwUUi6ewVd3BmDT5Ooov8Gj0X0I44I5r?=
 =?iso-8859-1?Q?O07ZfgJZmzgJqHmTUhcBMCARZIIzmOVV3fqpL8mjA1eGRLhYoIyIJQqZAG?=
 =?iso-8859-1?Q?Fzq6NiY96kSmsMhEYksbc9jyp2QdIRoiEsMxqt+v4N1Ic1jI5weQPABnzy?=
 =?iso-8859-1?Q?9Re5ymi27cjRys395vAnpFtpIdVxVyACkd5l0xFAxHXg2xjuuK8VkulVcc?=
 =?iso-8859-1?Q?1J4qz9FPgJvjTkVb3fOPXZcpGANDwGDzJinBPWkwcaIGnIWZUDpdAjTMoo?=
 =?iso-8859-1?Q?ODVrJtXQ0rfRRdrx0PiBqmrw+4d7B/RaZJpex6k1i7kGhyV7JVtGUhlvbZ?=
 =?iso-8859-1?Q?0SmxSfH04bQPHdsJh1xxBX4fFEzn/9VMZ3ps3XjsikhJXD6FUavdxPlR/i?=
 =?iso-8859-1?Q?hvBqZ7U3uU1wmvvldW3tnNXjqfEDXHk=3D?=
X-Exchange-RoutingPolicyChecked: j06Nyk0xxWelP+0xm7OyvRm3cqfQyZwbSqlgGMK5umn2ZVwO+FJPng+fYzWrJd+ImK2ezdF5A9IdWSt86yVLPZctQ5dUeinSyc8okqgLoAwqRaIILFLMa8Qfj9WfD/nc5yt2/PtMnj+m80dgey96ji892EhN1/ILgQKdQhNMjqkxlweFGJB0Mo13qOuwA15ejApHU1qcfEWVb5liQfy8MoyRT1fWH6AJB256kVaEPy0MwgHz22J2Kt+ICfEoabZKXuvooUSUlCSKFB/zuN4+SV+PgWgmZlw8FQSpIqnfuRSmieWUSj/wLkmT4X8i2HgBoqWH4hx9gQJcgOgyVfkGMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f25b2f2-b4fa-4854-6cb0-08df0a2278e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 01:18:48.4769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ADz8RAHYlvrOZkJqhWpah+vzNJXRVjUxq4AERSeJSajVqN2j73XlFSG8FS/xpe58tsT9wqLKZ1kdeS/fuP3Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6241
X-OriginatorOrg: intel.com

On Fri, Sep 04, 2026 at 12:31:49AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [Critical] TLB invalidation on mirrored (shared) tiles uses uninitialized `start` and `last` addresses, failing to invalidate the correctly updated address range.
> - [Critical] Shallow copying of the page reclaim list (PRL) for mirrored tiles leads to a Use-After-Free and double-free of the PRL entries during TLB invalidation.
> - [Critical] The arguments `tile_mask` and `usage` are swapped when calling `unbind_op_commit()` in the `DRM_GPUVA_OP_UNMAP` case, leading to un-cleared VMAs and corrupted dma-resv state.
> - [High] Missing NULL check for the result of `drmm_kzalloc()` in `xe_cpu_bind_init()`.
> - [High] `op_prepare` mistakenly uses `XE_VMA_OPS_FLAG_WAIT_VM_KERNEL` instead of `XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP` for REMAP operations, breaking dma-resv wait semantics.
> --

All of these are correct. Will fix.

Matt

> 
> commit 87e03e5ddd64ecb931de7c6186e72459d6401535
> Author: Matthew Brost <matthew.brost@intel.com>
> Subject: drm/xe: Add CPU bind layer
> 
> This commit introduces a dedicated CPU bind layer for the xe driver, moving
> CPU bind handling out of the migrate layer since it's decoupled from
> hardware. It also updates the page table layer to generate a single bind job
> when pages are mirrored across tiles.
> 
> Link: https://patch.msgid.link/20260228013501.106680-17-matthew.brost@intel.com
> 
> > diff --git a/drivers/gpu/drm/xe/xe_cpu_bind.c b/drivers/gpu/drm/xe/xe_cpu_bind.c
> > new file mode 100644
> > index 0000000000000..ed79e229151b4
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_cpu_bind.c
> > @@ -0,0 +1,295 @@
> [ ... ]
> > +int xe_cpu_bind_init(struct xe_device *xe)
> > +{
> > +	struct xe_cpu_bind *cpu_bind =
> > +		drmm_kzalloc(&xe->drm, sizeof(*cpu_bind), GFP_KERNEL);
> > +	struct xe_exec_queue *q;
> > +
> > +	q = xe_exec_queue_create_bind(xe, xe_device_get_root_tile(xe), NULL,
> > +				      EXEC_QUEUE_FLAG_KERNEL |
> > +				      EXEC_QUEUE_FLAG_MIGRATE, 0);
> > +	if (IS_ERR(q))
> > +		return PTR_ERR(q);
> > +
> > +	cpu_bind->xe = xe;
> 
> [Severity: High]
> Does this code dereference cpu_bind without checking if drmm_kzalloc()
> succeeded? If the allocation fails under memory pressure and returns NULL,
> this assignment will cause a NULL pointer dereference kernel panic during
> device probe.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 7c7cd7a0365b7..821edeaecaed9 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> [ ... ]
> > @@ -2395,7 +2388,7 @@ static int op_prepare(struct xe_vm *vm,
> >  
> >  		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma,
> >  				      op->map.invalidate_on_bind);
> > -		pt_update_ops->wait_vm_kernel = true;
> > +		vops->flags |= XE_VMA_OPS_FLAG_WAIT_VM_KERNEL;
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> >  	{
> > @@ -2409,12 +2402,12 @@ static int op_prepare(struct xe_vm *vm,
> >  		if (!err && op->remap.prev && !op->remap.skip_prev) {
> >  			err = bind_op_prepare(vm, tile, pt_update_ops,
> >  					      op->remap.prev, false);
> > -			pt_update_ops->wait_vm_bookkeep = true;
> > +			vops->flags |= XE_VMA_OPS_FLAG_WAIT_VM_KERNEL;
> >  		}
> >  		if (!err && op->remap.next && !op->remap.skip_next) {
> >  			err = bind_op_prepare(vm, tile, pt_update_ops,
> >  					      op->remap.next, false);
> > -			pt_update_ops->wait_vm_bookkeep = true;
> > +			vops->flags |= XE_VMA_OPS_FLAG_WAIT_VM_KERNEL;
> >  		}
> >  		break;
> >  	}
> 
> [Severity: High]
> Are the flag updates in the DRM_GPUVA_OP_REMAP branch intentionally setting
> XE_VMA_OPS_FLAG_WAIT_VM_KERNEL instead of XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP?
> 
> The original code correctly set wait_vm_bookkeep to true for remap
> operations, but the updated version uses the KERNEL flag. This flips the
> expected synchronization dependency semantics, which could cause REMAP
> operations to incorrectly wait on KERNEL fences instead of BOOKKEEP fences,
> violating the synchronization contract.
> 
> [ ... ]
> > @@ -2604,21 +2624,19 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
> >  
> >  static void range_present_and_invalidated_tile(struct xe_vm *vm,
> >  					       struct xe_svm_range *range,
> > -					       u8 tile_id)
> > +					       u8 tile_mask)
> >  {
> >  	/* All WRITE_ONCE pair with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
> >  
> >  	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
> >  
> > -	WRITE_ONCE(range->tile_present, range->tile_present | BIT(tile_id));
> > -	WRITE_ONCE(range->tile_invalidated, range->tile_invalidated & ~BIT(tile_id));
> > +	WRITE_ONCE(range->tile_present, range->tile_present | tile_mask);
> > +	WRITE_ONCE(range->tile_invalidated, range->tile_invalidated & ~tile_mask);
> >  }
> >  
> > -static void op_commit(struct xe_vm *vm,
> > -		      struct xe_tile *tile,
> > -		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> > -		      struct xe_vma_op *op, struct dma_fence *fence,
> > -		      struct dma_fence *fence2)
> > +static void op_commit(struct xe_vm *vm, struct xe_vma_op *op,
> > +		      struct dma_fence **fences, int fence_count,
> > +		      enum dma_resv_usage usage, u8 tile_mask)
> >  {
> >  	xe_vm_assert_held(vm);
> >  
> [ ... ]
> > @@ -2657,8 +2672,8 @@ static void op_commit(struct xe_vm *vm,
> >  		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
> >  
> >  		if (!xe_vma_is_cpu_addr_mirror(vma))
> > -			unbind_op_commit(vm, tile, pt_update_ops, vma, fence,
> > -					 fence2);
> > +			unbind_op_commit(vm, vma, fences, fence_count,
> > +					 tile_mask, usage);
> >  		break;
> >  	}
> 
> [Severity: Critical]
> Is it possible the tile_mask and usage arguments are swapped here?
> 
> Looking at the signature for unbind_op_commit(), it expects usage before
> tile_mask:
> 
> unbind_op_commit(struct xe_vm *vm, struct xe_vma *vma,
>                  struct dma_fence **fences, int fence_count,
>                  enum dma_resv_usage usage, u8 tile_mask)
> 
> Because the arguments are passed in reverse order, the dma_resv usage enum
> is treated as the tile mask. This would mean vma->tile_present &= ~tile_mask
> evaluates with the enum value (e.g. DMA_RESV_USAGE_KERNEL = 0), leaving
> the VMA marked fully present, and un-cleared memory could be incorrectly
> freed. Simultaneously, the tile mask is passed into the dma_resv tracking
> slots as a bogus usage value.
> 
> [ ... ]
> > @@ -2737,82 +2739,83 @@ static struct xe_dep_scheduler *to_dep_scheduler(struct xe_exec_queue *q,
> >  struct dma_fence *
> > -xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> > +xe_pt_update_ops_run(struct xe_device *xe, struct xe_vma_ops *vops)
> >  {
> [ ... ]
> > -	if (pt_update_ops->needs_invalidation) {
> > -		struct xe_dep_scheduler *dep_scheduler =
> > -			to_dep_scheduler(q, tile, tile->primary_gt, &type);
> > -
> > -		ijob = xe_tlb_inval_job_create(q, &tile->primary_gt->tlb_inval,
> > -					       dep_scheduler, vm,
> > -					       pt_update_ops->start,
> > -					       pt_update_ops->last,
> > -					       type);
> > -		if (IS_ERR(ijob)) {
> > -			err = PTR_ERR(ijob);
> > -			goto kill_vm_tile1;
> > -		}
> > -		update.ijob = ijob;
> > -		/*
> > -		 * Only add page reclaim for the primary GT. Media GT does not have
> > -		 * any PPC to flush, so enabling the PPC flush bit for media is
> > -		 * effectively a NOP and provides no performance benefit nor
> > -		 * interfere with primary GT.
> > -		 */
> > -		if (xe_page_reclaim_list_valid(&pt_update_ops->prl)) {
> > -			xe_tlb_inval_job_add_page_reclaim(ijob, &pt_update_ops->prl);
> > -			/* Release ref from alloc, job will now handle it */
> > -			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > -		}
> > -
> > -		if (tile->media_gt) {
> > -			dep_scheduler = to_dep_scheduler(q, tile,
> > -							 tile->media_gt, &type);
> > -
> > -			mjob = xe_tlb_inval_job_create(q,
> > -						       &tile->media_gt->tlb_inval,
> > -						       dep_scheduler, vm,
> > -						       pt_update_ops->start,
> > -						       pt_update_ops->last,
> > -						       type);
> > -			if (IS_ERR(mjob)) {
> > -				err = PTR_ERR(mjob);
> > +	if (needs_invalidation) {
> > +		for_each_tlb_inval(q, i) {
> > +			struct xe_dep_scheduler *dep_scheduler =
> > +				q->tlb_inval[i].dep_scheduler;
> > +			struct xe_tile *tile =
> > +				&xe->tiles[i / XE_MAX_GT_PER_TILE];
> > +			struct xe_vm_pgtable_update_ops *pt_update_ops =
> > +				&vops->pt_update_ops[tile->id];
> > +			struct xe_page_reclaim_list *prl = &pt_update_ops->prl;
> > +			struct xe_tlb_inval_job *ijob;
> > +			struct xe_gt *gt = i % XE_MAX_GT_PER_TILE ?
> > +				tile->media_gt : tile->primary_gt;
> > +
> > +			ijob = xe_tlb_inval_job_create(q, &gt->tlb_inval,
> > +						       dep_scheduler,
> > +						       vm, pt_update_ops->start,
> > +						       pt_update_ops->last, i);
> > +			if (IS_ERR(ijob)) {
> > +				err = PTR_ERR(ijob);
> >  				goto free_ijob;
> >  			}
> > -			update.mjob = mjob;
> > +
> > +			update.ijobs[i] = ijob;
> > +
> > +			/*
> > +			 * Only add page reclaim for the primary GT. Media GT
> > +			 * does not have any PPC to flush, so enabling the PPC
> > +			 * flush bit for media is effectively a NOP and provides
> > +			 * no performance benefit nor interfere with primary GT.
> > +			 */
> > +			if (xe_page_reclaim_list_valid(prl)) {
> > +				xe_tlb_inval_job_add_page_reclaim(ijob, prl);
> > +				/* Release ref from alloc, job will now handle it */
> > +				xe_page_reclaim_list_invalidate(prl);
> > +			}
> >  		}
> >  	}
> 
> [Severity: Critical]
> Does this code inadvertently create TLB invalidation jobs with uninitialized
> bounds for secondary mirrored tiles?
> 
> When a tile shares a page table (mirroring disabled), the initialization of
> pt_update_ops->start and pt_update_ops->last is skipped during the prepare
> phase. Consequently, they remain 0. Here, xe_tlb_inval_job_create() relies
> on these bounds, meaning the secondary tile's GTs could execute an invalid
> TLB flush for the [0, 0] range, leaving stale TLB entries for the actual
> modified range.
> 
> [Severity: Critical]
> Can this loop trigger a use-after-free and double-free on the page reclaim
> list (PRL)?
> 
> For secondary mirrored tiles, the PRL is set up as a shallow copy of the
> primary tile's PRL without taking an additional page reference.
> When the loop iterates over the primary tile, it adds the PRL and calls
> xe_page_reclaim_list_invalidate(), which drops the page reference.
> 
> When the loop then reaches the secondary tile, its shallow-copied
> prl.entries pointer is still non-NULL but points to freed memory. The code
> will pass this dangling pointer to the secondary job and call
> xe_page_reclaim_list_invalidate() a second time, triggering a double-free.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260903235842.3401722-1-matthew.brost@intel.com?part=16
