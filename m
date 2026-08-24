Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBB837C118
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 18:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787596193; cv=fail; b=lPQLlOrxZfy8SafgigpE+RZGTy4NzkhJ3vykZK3K7NNE8/nUFJzvcS+kfeoa1l6DAJXSSFIYS5BIjTgeh2CntbdR64w8b49++qf6qyVKM7yVoQuHCMkYf8wjD0wP+F/v8bzJXq9fRBoPld9aFKv6uLLkIdDEYwpIXOtBqXqbXYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787596193; c=relaxed/simple;
	bh=0i5FeNkLhDkwwx4FdfxAM4SsibhaZQ2EzsO1qkh7r2g=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S3zSBkaywtVIFbj6mfuCk6oW/da0e8OGWUqEy7KrhuwjTXKcZl+g4NTd25vhta3xj+8ZTl1/4c6CrXhxoM3TQ3Jk9GmOp6O/OJffWMgddMNwr44yw9yvP2vGpaCLJJKiyqGhZ0UUEkpyrKmtXTfIxJoziTPZ7/8WaB/s0iCG5vM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmfEPwGl; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmfEPwGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787596191; x=1819132191;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0i5FeNkLhDkwwx4FdfxAM4SsibhaZQ2EzsO1qkh7r2g=;
  b=NmfEPwGlA3JBPs7mufQRMQauoY6mi8FGBTT4ZuxddM73QkYlc2dB+sBh
   ySsn28LZNjgx8Hww/9huHlMbvY6PPWTXLT3NRsWiqPJNwiEKH1JLhnfel
   9jZYzJS+OH4ydc3ljoh4exU5co8fuAEDBQbLprZdIC2hLBI6iEncmIDYB
   FFadbgzOCG0yVwLMevZqW1k0jSupsVoVflsAJPcrt9/8uTrFMuKjXhDe6
   Yv8XSLMcIiYC7hXJ9X4jzLXzAjaervE4dvFJRJlmMmg3awWWv3u9cFWNx
   F5yo09gL9JhmtZxyk6QnmaxMGxxh1NnnEVDpC4I3BUYQTcKHMp7xoNZJe
   g==;
X-CSE-ConnectionGUID: E0hjCBd7QJq3E2Me61q8+g==
X-CSE-MsgGUID: NqV8Cwt+SX2sjRdhTC1r0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="113594130"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="113594130"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:29:50 -0700
X-CSE-ConnectionGUID: 5EjAKM8CRMGIeeNYoyrgvA==
X-CSE-MsgGUID: 7ZJ6DMJlQy6L4FH7KnoyrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="267110950"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:29:49 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:29:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 11:29:49 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:29:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHXZhFXhuxsEfmlU1g/oHpVWNiMyZB0IxEetoZzSJYNSr+NMSn81gx06rX4lGuyLtPkKxftz4zg6/gblreETo8aoA0tbjQKnBfRd0uNb9yAp6+6C9tNR7qsNREcNCo3xXX9Yi+EeFyMhf1huTHntr5vsuPqY48lOB3bXhdYZ/pDbzTuUPeuSqomppRN0l6p0CFUjSvMgC+DnwGyyUvs396L2BoOAAg+2b8JSFsRT93bP6DWoTU42X+97un05xUBX52kp88zqRI5Moh9y08X98mTzmtwLkz3jw7rDaGKfs1nHaVrPTjWx0sEM8p+/lS288zG2zt97IdehM3WzOCBCpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkjhQZji0XBPSSvycbp98Fu3IwxVQAa3jmBJ/eguuJ0=;
 b=tcRzVHg5+sFy2GHP1FHi3efm4WKgpAXbrikMjCR0cGjFXydUr4LW6Eu1JLatRMs5tncCKSc0/AHFnncCKdNdbFqXIltIF8ET7zkPzf0pY1nyyNT8W5JM/PYPu+JbemWO3MZVuJ7iX7TKOyHzZ63G8B5jQK6e8+QQ0WYYcRzf5G7gsCnmBlvovJ8jyloEQIFHv6mD3fJeRsUwnwDZqIOoZLk++vKQmZSBMUxXCwm7zUYH8It8pWsIj/90K97+OYhBVf7R70GXiPcnWa4/rANNiojRzCfASPF+Gea5ns20yQ+FX33od71L0UBmGYeVyiTyeS0cyhKrNFEqWFjqgIuZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by IA1PR11MB8175.namprd11.prod.outlook.com (2603:10b6:208:44f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 18:29:44 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 18:29:44 +0000
Date: Mon, 24 Aug 2026 14:29:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
CC: <sashiko-reviews@lists.linux.dev>, Raag Jadav <raag.jadav@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v10 08/10] drm/xe: Introduce temporary device wedging
Message-ID: <aoyNk9wmOpdyUXgY@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-9-raag.jadav@intel.com>
 <20260821113758.006681F000E9@smtp.kernel.org>
 <45efbcf8-b598-463e-b415-dfee2a3afe66@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <45efbcf8-b598-463e-b415-dfee2a3afe66@intel.com>
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|IA1PR11MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2ac1fd-ea74-4ab9-8d85-08df020dab50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: UrWmnRsjqNrmZyAn1CxeXXfxrACWM96HrHTh3/dcMf3KwSQGDxPeQmDsksn+CoLqEfw+5AP9e7qcaZys1ZpTQBixQqLnaL2+SFtg5RwxYPkFSINN4YwuvgC3Zqj5hq5NrfCJWrJLbtkMVTNOwDLQhEVeeQ3OuNndKbhtBpxLBO4RPZYEdwUaIzQr+IW/IGgQQVgJNl8CKl22pk5z1FpSioPRnOrZ91ATc3B8tnahMUDx7n2DOLpzhCT/T6BF8esl+0J9gfmHryS6PljZQVx9AbEk5hzyHkMio4fmZvnuXe0OiPUApKS8LP7u6GpWagaajmzX4SWy02B4TVY1urSOLLY2LWKltdIawbeBJGonJvkIyokfJmB2owHBKk3lacy1FPm90KTtZMBU/B6AQG6JlMN0VRqGT5KbnL7cBJ9NgrI47SEvEcRbXLarqdbFtsgBMrpz4Vr4O0MmiebFykKBbbvQRwHhVy1eJXBxUOUl/PK+abBp5VNZuf8OD7tVtqnXWFH/K7iw1Pe5AcX+cotucQ0ljEeCsWBOoo1tldJ38knUbI3lmrw2iddxILfv/XL5tUSbn5dH2zsZ2bUuQVuLe1gwHFB0IqvhdH5pi199Um7owtBDBy9vfbdz2EBoMh/59wOxuUZOgc8pBgLOV0AZOF9MYpjYKKNZeY2KnmwCAug=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7752.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uFqZoUJM6bLpHlYJbwRdWqcva6MdesGzcQqNRygkh50lZBzbuyFsNQU73zpV?=
 =?us-ascii?Q?xn4FlAnxuGzXu2BsRZ/AjqnLSm84cMlSvf69qu5ozSvxPOc0/SwFyC0xZXeh?=
 =?us-ascii?Q?TWeC7eVLl2Y0Ujp25ISSyvadjiS0FMc3sjDmXK3YDdNy9dnFIglSLVBHZkNl?=
 =?us-ascii?Q?q9jq9/K/TXu3t0YawGVbgi/D1BK5LZvDCrtMfQwx+pvtwDy+6Dwu2TTdR27X?=
 =?us-ascii?Q?yNibMu/Z5wr3Lql2LvDAvORtKy/rW6MaLRoNX7WvJXHTUpp/dD+0vIIBoZ4W?=
 =?us-ascii?Q?thBdQ+rfUmX7vrFFfoMcrujM5jiCsAWPTLTdSnKEPFbRavvDUCFKavagMuVw?=
 =?us-ascii?Q?LF5V4iZ0lqXqEdZa54r8xppCilce5RvYpyhglHsmyRv3UtcZ1BAqaod9YFf7?=
 =?us-ascii?Q?WxrRznesT+pUcv7cawY49WMvvhkxldFW5yemHdomhkNAlIcaveoPSY0QfZ/p?=
 =?us-ascii?Q?vR+JvGb7KoGWr4m9hUokj0owEGod1TQxfB2a0rkdlWdD1zt5S1XF19sb6i35?=
 =?us-ascii?Q?pHZHmMgxN8EvPKdVY7J8F4plhICS87xYdgXXS2mYj9+1dPfJn3U63uF5fkyC?=
 =?us-ascii?Q?qPvicOP7QoD8wNfi9v4tudyX1Dj0B6togV1nEXzCdzZjQq7bLNI74akzUwdR?=
 =?us-ascii?Q?+M0fssW1TeZ708Vx4ODUr/t1F9WW9i9UJl5wAD7qHViyKbIEuGA7L60ZjIQc?=
 =?us-ascii?Q?KPiNkda2bPb0crGh4PDMxDNXHFxouFYTGWBrJPCgWNfsDmFpAk2aoBWBmr6Z?=
 =?us-ascii?Q?bhL04P297t/p+wtB+es9ODWdq9O4W9wBwMzhGL7aR5irimyceX/h6S8tkYVX?=
 =?us-ascii?Q?0zu23th8K1JEvg/JrRV3gLqzoUVlNyBLf3L6jDBXIkd04j6Mw+MGHcasx2/0?=
 =?us-ascii?Q?wmBN9uy4+B6lcEeXWx4e6+FI3iwNxYe8uC6pZJIzhhXgSNV8lwlO18cPNb5G?=
 =?us-ascii?Q?lmD/esXCci7X/3M0oPygA52xrTnbLLvQ5ewimH6kheMKXJD2umSJhyoU+7m3?=
 =?us-ascii?Q?z6tYQB6QiEbtr6uhTVlm6V+vJeuT/6gaTSpD1M2Ajq3CSMgC/AxWwzL5/KWk?=
 =?us-ascii?Q?Ax4NQgVdpgj1LqPNW7t0RhvntMcFFJ7ogtPtn50xrcI98PdEAlngYKBQ/W+Q?=
 =?us-ascii?Q?yKuNf4J96Tp6TdmiGegDKEhV28lYJtdaH5nOyE5g1jsioehm05/SpS6PTRJk?=
 =?us-ascii?Q?b3I7VBEtdZZQJqYzNtp0y+9QmOwFFd5OncFcaYXRtz2+SQqAXDkrXt2xo43L?=
 =?us-ascii?Q?9Dbr877gBQ2x8/aulwRIvAb7xCQ6Q4NGqA9EFAy7wadEQB71u/PUU1cj5kIC?=
 =?us-ascii?Q?oZiZneh9j6vf8maaDYg+B2KvRHJA0HlkjXfAnAYicXVr+T/hOCoNrIn65jZn?=
 =?us-ascii?Q?pogd0Sezp+dajiY3vTKMxYEYo0egqT4PkO64blGPO+5wv0GQfXSYFJi2BNvd?=
 =?us-ascii?Q?sVFnk0F3lXHeTuW+WVFYY5bsiZSQ8jZQGhWWsZUEJh/euO40iueloQ9mPWY7?=
 =?us-ascii?Q?ljrCjjt3mpand/bny4A5H4djeEFbIvtz2JJlePLJy2ecFnu9Za4ux/J4QZTU?=
 =?us-ascii?Q?oTK+NDBufTrmsWiqi/DnOKQAe+q4VEjHhWpbBeDuxYsx23yXjn8p7+Csy0Se?=
 =?us-ascii?Q?kHoWvDW13p04Za22CPO5axfQe9XzP9vGpYSkn3aHJYrHZ00Esh6rQQr2+uZf?=
 =?us-ascii?Q?tgUqSBNQVgWY1ygTc0UJIP3RDKXHL5flFb640FlBwgEulkIUE3FOXhDrgjgv?=
 =?us-ascii?Q?nyEjwojtrQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: hhnZSzrHogqCBSQoN34Ye7zahWTNeRvlS1JVeg6LV1bWUxv4tdxzFts/xLvoajm7B1gAfYJHzkjBbfTACoLpItz/1SjpiyvKX9sueKLT4MMw/iW7YBcQcEOurs0auEYoW+C6d44dx/qHB7dERbYwL+nGilyzpuk2Nx9v3LqgDhr3CJvgpm6l5jKUlE1Tnlls+LsUdl+CxkYjVj1Exe0QM2Kl/CXWON2XvG+lnE9Nap5Gfb0UDSoOYaLQ+uenqgT3OVbBCgqr3FvG1UXbc4Kf/57ZtKWQk8XdLLKLPsEVGZgQ5vcE/fHmnRetT/MM04Cuj7/qZVe6BYr9kZEwrtibuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2ac1fd-ea74-4ab9-8d85-08df020dab50
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 18:29:44.3714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUvd+orPJbqrZJ22cBaZwGUtAsc3CTg7cCGqOQ80zscoHGWhIu1naEuAVTwvEB79zuO1Zs5M7hbXIqiJfFvOGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8175
X-OriginatorOrg: intel.com

On Mon, Aug 24, 2026 at 04:30:25PM +0200, Laguna, Lukasz wrote:
> 
> On 8/21/2026 13:37, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > - [Critical] Sleeping in atomic context due to `mutex_lock()` in `xe_device_declare_wedged()`.
> 
> Already discussed, can be addressed in a follow-up series.

Why can't this be addressed in this series? I believe this is worse then the
below case. But I really dislike that we are going further with the mutex
inside an atomic context only with a promise of fixing this later without
seeing the code...

> 
> > - [High] Unprotected state modification and double-increment of `wedged.ref` in `prepare_device_for_reset()`.
> 
> Valid. It should be enough to just take the lock and check xe->wedged.perm
> before taking the reference.
> 
> > - [High] Temporary wedged state from PCI error recovery leaks PM reference and triggers teardown assert if recovery aborts.
> 
> It seems to be a false report. Reference is taken just before
> RESULT_RECOVERED.
> 
> Lukasz
> 
> > --
> > 
> > --- Patch [8]: [PATCH v10 08/10] drm/xe: Introduce temporary device wedging ---
> > commit 102094142d418b8de53397ac8e1fbe1c7ca46ae9
> > Author: Raag Jadav <raag.jadav@intel.com>
> > 
> > drm/xe: Introduce temporary device wedging
> > 
> > This commit converts the boolean wedged flag to a reference count to allow
> > temporary wedged states. It also introduces a perm flag for permanent
> > wedging and a mutex to protect the wedged state transitions.
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > [ ... ]
> > > @@ -1476,36 +1526,40 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > >   		return;
> > >   	}
> > > -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> > > -		xe->needs_flr_on_fini = true;
> > > -		xe_pm_runtime_get_noresume(xe);
> > > +	mutex_lock(&xe->wedged.lock);
> > [Severity: Critical]
> > Can this cause a sleeping in atomic context panic?
> > 
> > xe_device_declare_wedged() can be called from hard IRQ contexts, for
> > example:
> > 
> > xe_mert_irq_handler()
> >    mert_handle_cat_error()
> >      xe_device_declare_wedged()
> > 
> > Since mutex_lock() can sleep, taking it here from an interrupt handler
> > would lead to a scheduling while atomic regression.
> > 
> > [ ... ]
> > > diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> > > --- a/drivers/gpu/drm/xe/xe_pci_error.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> > > @@ -25,8 +25,10 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
> > >   	 * xe_device_wedged_fini() releases runtime pm if wedged flag is set, so acquire a runtime
> > >   	 * pm reference to avoid underflow.
> > >   	 */
> > > -	if (!atomic_xchg(&xe->wedged.flag, 1))
> > > -		xe_pm_runtime_get_noresume(xe);
> > > +	xe_device_wedged_get(xe);
> > > +
> > > +	/* TODO: We shouldn't be doing such ugly hacks, reuse FLR helpers and drop this. */
> > > +	xe->wedged.perm = true;
> > [Severity: High]
> > Could this leak a reference and cause an assertion failure during device
> > teardown if the device is already wedged?
> > 
> > Unlike the old atomic_xchg code which checked if the device was already
> > wedged, xe_device_wedged_get() increments the reference count unconditionally.
> > If the device is already wedged from a previous event, the reference count
> > will be incremented twice.
> > 
> > During teardown, xe_device_wedged_fini() only drops a single reference
> > when wedged.perm is true:
> > 
> > drivers/gpu/drm/xe/xe_device.c:xe_device_wedged_fini() {
> >      if (xe->wedged.perm)
> >          xe_device_wedged_put(xe);
> > 
> >      xe_assert(xe, !xe_device_wedged(xe));
> > }
> > 
> > Will the second reference be left behind and trip the xe_assert() check?
> > Also, should the state modification here be protected by xe->wedged.lock?
> > 
> > [ ... ]
> > > @@ -126,7 +128,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
> > >   	xe = pdev_to_xe_device(pdev);
> > >   	/* Wedge the device to prevent I/O operations till the resume callback */
> > > -	atomic_set(&xe->wedged.flag, 1);
> > > +	xe_device_wedged_get(xe);
> > [Severity: High]
> > If the PCI error recovery aborts or fails here, and the device is subsequently
> > unbound, will this leak the runtime PM reference?
> > 
> > This code acquires a temporary wedged reference but does not set
> > xe->wedged.perm to true. If the expected xe_pci_error_resume() is never
> > called due to a recovery failure, xe_device_wedged_fini() will see
> > xe->wedged.perm as false and skip dropping the reference, which would
> > ultimately trigger the xe_assert(xe, !xe_device_wedged(xe)) on teardown.
> > 
