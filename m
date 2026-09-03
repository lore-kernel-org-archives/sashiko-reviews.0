Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A679383C89
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 04:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788409353; cv=fail; b=bT6WU89GxquJg5uFGozjBznyHBHssEfCVMJUxFKiR66alFb7Ry3jUxkqYneeZras40Hj6A7mKENRkg2jEjHGW3QMhT29tju6ercS/lS/Yy/iMc+NM1RuSCMB9O9Kh/5LsosC6OV2jFFTUAarABjS/DkC/WbA3tKjELOPeWXteVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788409353; c=relaxed/simple;
	bh=y7tEzx2ihwoqUkw2hofUiG4mTwn/7eKBxGH+NyptbLI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m63i7uPLSE3EB2SmLeUoF14Yz2Lo1g08UjQj/iNhfgulcRGLixuHNyzEBAQwGOrcliOI6VWIgHgpRUuu+eelIXKo8gU73AWGgxkspz2hExHxxprW+v7wgLfobowAIpwE4GoZM2O/jWTBbqCXtaqpIigwKsV7UMir9gNcXJT/wTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JulTjxrw; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JulTjxrw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788409350; x=1819945350;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=y7tEzx2ihwoqUkw2hofUiG4mTwn/7eKBxGH+NyptbLI=;
  b=JulTjxrwGwviykD1s55u0acoVdNy9mr+awNG2adh99tLYrx0FwTyzSRE
   +BnLwFtIHiyB6hewDPES4cfGDcfhWVQ+RcOEqr7zyIZhY/g8OLLRGwiob
   NRlSBOXep6Wp2X0Qn8uIJkNB9K68fVNdowXYicdOpW56OgrnVLYuPIDQk
   9yePNiEOqEQz6BNUVvR03W6+NcaYaR7sGlPm0c/B1h6cF0EXSa+boXw4a
   HTtpmp3LQenBCXRQZzWCM9Ircdb4dJ3Mesok3FTPkWUi+/mlAxuGEAcXi
   Vy8x/6jGjBkE1vPzby2bJc4RFh0Q2bp6W7qs2/MYKrFQh0LZC6MgPhxeL
   w==;
X-CSE-ConnectionGUID: xg801HaGRoyaDCw0zV2OYg==
X-CSE-MsgGUID: naTxyyzMQFWdgVVKut3L9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100039328"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100039328"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 21:22:28 -0700
X-CSE-ConnectionGUID: qBjUqKGnR5Cg3cozvJ5p6w==
X-CSE-MsgGUID: bzOcOZChQnmeGGY1Dm482g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="269058687"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 21:22:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 21:22:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 21:22:27 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 21:22:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pT3aMb2+tErM1cbYupqS1MZkqr7Y0/sdi54HxgHtlsnyYLMBxzhgRIcRYWe909hK/CtPvNrBaAf5GAn2W5o82PuJ72eH/PjkBLYeaMfnGdseeZaKaqcWGvGGLo4kU3ZTjT3hmzsZH0N8lYCFyPDI6ep8rkNn5hfsaf6wrcQMi8/HgAb0YSwKTwoKHA2WWelAufg+GJdQpeHqdUrAgmFPGiBvYmpFqB3Yp3AFxqV0JpYssKS52g5b2l1vq2y14+jUm9Tddz4FmggqdRRpEGc8vkXIkPdSWT9nBpJQhbB/SYk2ZFbCsc2z5PSQjDh+5ReY+GH4dTyUkyaWPnTL/+EhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXaFcDFbYVwZf7H4UMBMyYtg/9OtPw5veAvHllS6UF4=;
 b=X0hhrcIY5elgAsZMvjpNTH8jvMLXlzkvMpLYWZ38FHWTuRBtovRXwXiG9UO9O9p1h0cpSaspLIlCc3OvEbxgBkbgFCKhZIt1cyUPxzhtpMtnm/2GpKH/X18U7jZwoKMnUy/YIbwnQ+Z19KucLOG+76irQP/ujEjtzebwgA1bkXCfFXF2kS3L91+74jqbLfJqh2PtLCrohvwCW2p90RedZwaf0QbCnrOU3knQwNO4EFebg9bMC1nkVCJEAUlv+7virCwkyFUpvC4n72VDNRiicyPy+qOM386NcXQGVaU+rFUpwleMtcYwVHx7VVzgUocduA9fmB0DcS6gIqa//scjKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB8942.namprd11.prod.outlook.com (2603:10b6:208:56b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 04:22:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 04:22:18 +0000
Date: Wed, 2 Sep 2026 21:22:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V20 09/15] drm/xe/vram: Add VRAM page offline fault
 handler
Message-ID: <apj199Z8fF8NU3t/@gsse-cloud1.jf.intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-26-tejas.upadhyay@intel.com>
 <20260902162540.841011F000E9@smtp.kernel.org>
 <apiraQytMqBPagvH@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apiraQytMqBPagvH@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:303:8f::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB8942:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf40491-27ee-44ea-7d4c-08df0972f0a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|10067099003|4143699003|11063799006|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: PjgxvB4VMgO3rSKtV0pcMJH+53LugyFI23Flw8FbJqmLRiO7CcXHxrXJ6lJ0+QZk+keYB0OtvW+r5+Hx2eKVNP4MxhgFn1FX2ugbtiAqBYlkdAwFBjiXkAupDdy0xPUshYPoVmxX6kdOXKJPXEE5XTFhHvZn0AeuprQD+WMJEPdV+LhXbAIUQX4Z8q6ot9qjD8D4SKXnBSymXPvJr2sbo53mVSFx1q5/2ftL3o7yZ7WOKyP/WvWzwQhXUdKha0QzV/Qqa2KYIxxndFvLFpM6RUng2F54ExDC6rxA194Otg8rao+6ND6gOXhXpv6IKjCLcnE0kjnxLkhWigaURaZY9PtGOXranF1Cz4o4uKKsLL9fB32a7demael+D0DFJP5q1arMBCQeZa7k8tNO8mTTRF2alfmzfhQfffVTW1RuNZ1YCzi8VDRW1hL1ueEmyYbJavfDD0GnLKbcHM1Nrf6mrGgTXkxVgF5tdfpCTv87DTFFg0/ceBVa5+61JnTcVsBLCzRNSAxwWISPRJrw4yraDvyBweCYbgHvJ9uP2fuQ11SG7ImXIRXtaFb6efzNKdidYjj2lh3720ZcqYLUJwePOGqPa2W861SgVYiDns/H0MY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cX2O9fDhAjf1eNvQO8YJ4bEbnzsJRc+Y1wnvNUIFK6ExaHVGLYlq6yjCPC?=
 =?iso-8859-1?Q?kcU0wgonXBpNlULL6UA7MM4WGTR90goTh08ZYwP0UgZ1oqba9GFJJbh5LX?=
 =?iso-8859-1?Q?N6PUkysason7W6a157oBjRIvG5GE2qJgzrK+F4v50Xz6ASTOQMJUWtCfP5?=
 =?iso-8859-1?Q?JENg7kMFoqVms5MjbzNlU5W6ilzNiplUMOP6Wkk9Bx3rXRHS/3cjni0r4K?=
 =?iso-8859-1?Q?77WIpU3fDIqMrXubQPqa1Mvkt1YIG5XefMOG+zeAKudmyL8Hpx5Vhd87FV?=
 =?iso-8859-1?Q?0BSOMtjrUOHgb+T75IwLoJBSjaFewwnvJiNLxoKhOq9J4Rsea4LnqJNJiL?=
 =?iso-8859-1?Q?a/BRkcpeGkioPeA/zO8y1EPg/tXxiip/sbQkkuHHtL1A+6p+4AwVdtkQ5B?=
 =?iso-8859-1?Q?BN3EYPwD3R2W9fXZBEOPB4AXTv4/D787ku4QU8Q27BcsRqnZYAo5gu8pjE?=
 =?iso-8859-1?Q?0QiTQF37QMEob7QeGo13gFjlQjI+KNg21cZDocXpSvL1g7u6H9mJw0fRiL?=
 =?iso-8859-1?Q?ckdwWqtgZMJ3KDHO7JnVTSUa515RKSaj4+XFxMK+1QwfpyQG6qFq4mj50Z?=
 =?iso-8859-1?Q?8VcJVgNocz1p5Z7udDgWixSgTHmGb5Hv0Yo6qsO4f9BhAYxGBU3dy61kaP?=
 =?iso-8859-1?Q?Oh5hkie78NZvMp18Z65NNFQiL4TWKtiMUZZkDgPXdad5Q47vZxer1nX2KD?=
 =?iso-8859-1?Q?/k+zK3D/ONuwvY25W0r7EmkRd2HR9qno6Q/DkEC9UKo3S2zlqlR50rjavE?=
 =?iso-8859-1?Q?gDYSKn3eheSAyHwCNfR9Rf7baI028Yu9UGbvf44HXsOKCp4tTk55N6zm9K?=
 =?iso-8859-1?Q?M69uuySuq/3A/tZvUArVJWA39o1g9KSDyHmC0SbzxbT5OVZ8ldxDNbCB/q?=
 =?iso-8859-1?Q?yVpwQIJBxqER4SpOBilF6c0xe+pLk4uFBR/oMrgff8J3doLjaEfJH8x4Xn?=
 =?iso-8859-1?Q?v1lKprOR4TsR91HXMfrI7b1mwQQlUTNhqr6QAmWxbhTP5DbTYWkMy2iaXl?=
 =?iso-8859-1?Q?yBIQvnyUM4goUCKtlN8DaMHF2g5l3ncr0oFYKeMs6tdr43yEN5y80AK0eu?=
 =?iso-8859-1?Q?am3vSieviYUVK1o5S3fxwQCXvd69iOjbmLriEtzSJoDYOhJDCgTk7lxFNZ?=
 =?iso-8859-1?Q?Fqat3j4vbXqMe/vdYsf4AnpRmTn93KXSiabVbBxbeMmnV7jABCcHZF2f9k?=
 =?iso-8859-1?Q?qNqwwXN520yx6vSjdQ3xgQBV3FhiAwyWfDX1AwCCzVf++3WrmozlZ+LLVm?=
 =?iso-8859-1?Q?wUn29bzMp5QaN4qMqZskZFcgJiQs9bB/BZhl/Vp0avXlOCI8uMF/fxpmRC?=
 =?iso-8859-1?Q?wvA1hplu/NNuiE5bhZ6NuaCAtRpGPI/KPVIPoDQYRWnkpkkCe4cl14tHcT?=
 =?iso-8859-1?Q?H11bpfZKlME+TDF3nnCLwENHsU0GQmt5/bMt2k5rDYZv/kwAxYC/Y2ZWlv?=
 =?iso-8859-1?Q?EJOhJbSR8wOy6Fydvf7YboNwBr5E+814JOIeGwcOvEEwTu4Uiz+2AfRW0g?=
 =?iso-8859-1?Q?uqXm1LgG/WU7W+OuksYp0oUF/lShTKkCiqF1gvZbSBinkGRj18AR6QV9aV?=
 =?iso-8859-1?Q?+Uy8d0WRT+zpdDRGerWgPJFVUKCYVWIWrNKmMfj4dZMYso8U39n6t1z6D/?=
 =?iso-8859-1?Q?oSa+BxQOzRMkHANbD4Ott6dBcLHCOKgQUj5XPQKj3FZg/CJF22XZ1zgveG?=
 =?iso-8859-1?Q?4V3qO4jTvQ2dxxbYi6FFU8eIhB+b+Mx1Z35J8pbiTEPGfV2tmjXl8Zy0Ma?=
 =?iso-8859-1?Q?XWjATJLcozSDEN7XWEhfwc2j12UbbOK0xQ71Y8rGsfa3xVuWH4F+SPkEiZ?=
 =?iso-8859-1?Q?lnBg5wAKpobgJ0eoO4Ekd72IKhC4iNE=3D?=
X-Exchange-RoutingPolicyChecked: Tn6/uKINgWhVVUhXDzGgxEwbCcnKyd4KRxK6YndnwgZJL/6/+HLcAon6TBEIpzkbyYuEXF7zoC6C8F+or+I9Uqj6VlOyRV0mfo5LosG0k2/FHxde2NNfgdOJ29YMPUd19e8x4FGv5wNHHciRZy/+6oyDeumz1uDx/ocpLqmtlvhKZF4adS54dk1ULyCHhh4mjZK5nBPUsTqZBkT+W+KOH7SzJPGuiKLcNWTstt+KkRqmuqPQa1EMG6kNp7ztyrmo+KaFTKcX4W0EvAUWc4p9/cbk4UigEtos6vjTneoO7uyXTbsavSxZPBH2KPlviJnShPLVJSYd3HUzltdPERVr2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf40491-27ee-44ea-7d4c-08df0972f0a9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 04:22:18.0415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWse6aAHndR852ZUjMXz0RxD9IOnuN9Qb10hBto9KNBTWtjSgpSajowiZtAUJr1/xJ/jbZEdUl3FRNZEKuBSfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8942
X-OriginatorOrg: intel.com

On Wed, Sep 02, 2026 at 04:04:09PM -0700, Matthew Brost wrote:

One mistake in a suggestion. Inline below.

> On Wed, Sep 02, 2026 at 04:25:40PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> > - [High] Lockless read of `res->bo` in `xe_ttm_vram_block_owner_get` leads to a Use-After-Free when racing with a TTM ghost object transfer.
> > - [High] Race condition when offlining a free VRAM page allows the faulty page to be allocated and never purged.
> > - [High] Forcefully unpinning BOs in `xe_ttm_vram_purge_page` violates pin counting semantics and creates TOCTOU vulnerabilities.
> > - [High] `xe_ttm_vram_addr_to_region` ignores the `kernel_vram` region, causing hardware faults in critical kernel memory to be silently ignored.
> > - [Medium] A race condition between two-phase page reservation and synchronous BO eviction falsely marks successfully offlined pages as failed.
> > --
> > 
> > commit 23a2bf9a5461265765230ffd0e7a9d24c27ca918
> > Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Subject: drm/xe/vram: Add VRAM page offline fault handler
> > 
> > This commit introduces a hardware VRAM page offline fault handler for the xe
> > driver. It adds functionality to purge the buffer object containing the faulty
> > address, ban the associated VM or exec queue, and reserve the hardware page in
> > the buddy allocator to prevent future use.
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > index d97739a84a2d1..0ab92bc3c6998 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > [ ... ]
> > > @@ -580,3 +618,295 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
> > [ ... ]
> > > +static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
> > > +{
> > [ ... ]
> > > +	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
> > > +	ttm_bo_unmap_virtual(&bo->ttm);   /* nuke CPU mmap + VRAM IO mappings */
> > > +	if (xe_bo_is_pinned(bo))
> > > +		xe_bo_unpin(bo);
> > 
> > [Severity: High]
> > Does this forcefully break the pin counting contract by unpinning a BO on
> > behalf of an unknown owner?
> > 
> > In xe_ttm_vram_purge_page(), this unconditionally unpins the BO if it is
> > pinned, stealing a pin reference belonging to another subsystem (such as the
> > display controller). When the true owner later unpins the BO, could this
> > trigger an underflow crash?
> > 
> > > +	ret = xe_ttm_bo_purge(&bo->ttm, &ctx);
> > > +	xe_bo_unlock(bo);
> > > +
> > > +out:
> > [ ... ]
> > > +static struct xe_bo *xe_ttm_vram_block_owner_get(struct gpu_buddy_block *block)
> > > +{
> > > +	struct ttm_resource *res = block->private;
> > > +	struct ttm_buffer_object *tbo;
> > > +	struct xe_bo *bo;
> > > +
> > > +	if (!res)
> > > +		return NULL;
> > > +
> > > +	/*
> > > +	 * res->bo is updated under bdev->lru_lock by ttm_resource_set_bo().
> > > +	 * Racing with a ghost transfer here is benign: we either see the old
> > > +	 * owner (whose purge is a no-op and the retry path recovers) or the
> > > +	 * ghost (rejected below).
> > > +	 *
> > > +	 * A ghost is a bare ttm_transfer_obj, not an xe_bo, so ttm_to_xe_bo()
> > > +	 * on one would be out of bounds. xe_bo_is_xe_bo() rejects it since
> > > +	 * only our own BOs carry xe_ttm_bo_destroy().
> > > +	 */
> > > +	tbo = READ_ONCE(res->bo);
> > > +	if (!tbo || !xe_bo_is_xe_bo(tbo))
> > > +		return NULL;
> > > +
> > > +	bo = ttm_to_xe_bo(tbo);
> > 
> > [Severity: High]
> > Is it safe to read res->bo locklessly and pass it to xe_bo_is_xe_bo()?
> > 
> > In xe_ttm_vram_block_owner_get(), tbo is read locklessly. A concurrent
> > accelerated move or pipelined gutting can transfer the resource to a TTM
> > ghost object under bdev->lru_lock. This drops the last reference to the
> > original BO, freeing it via kfree(). 
> > 
> > If the thread is preempted and resumes after the original BO is freed,
> > passing the stale tbo pointer to xe_bo_is_xe_bo(tbo) will dereference
> > tbo->destroy on freed memory, causing a use-after-free regression.
> > 
> 
> This one is correct and this memory unsafe here.
> 
> Luckily, this fix is easy...
> 
> This one will need to be fixed, snippet below:
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 6a954018012a..ff937ab3837a 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -733,7 +733,8 @@ static bool xe_ttm_vram_page_already_processed(struct xe_ttm_vram_mgr *mgr,
>   * blocks will hit xe_ttm_vram_mgr_del() on their own and the pending
>   * reservation is retried from there.
>   */
> -static struct xe_bo *xe_ttm_vram_block_owner_get(struct gpu_buddy_block *block)
> +static struct xe_bo *xe_ttm_vram_block_owner_get(struct xe_device *xe,
> +                                                struct gpu_buddy_block *block)
>  {
>         struct ttm_resource *res = block->private;
>         struct ttm_buffer_object *tbo;
> @@ -742,6 +743,8 @@ static struct xe_bo *xe_ttm_vram_block_owner_get(struct gpu_buddy_block *block)
>         if (!res)
>                 return NULL;
> 
> +       guard(spinlock)(&xe->ttm.lru_lock);
> +
>         /*
>          * res->bo is updated under bdev->lru_lock by ttm_resource_set_bo().
>          * Racing with a ghost transfer here is benign: we either see the old
> @@ -788,7 +791,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
>                 nentry->addr = addr;
> 
>                 if (block) {
> -                       pbo = xe_ttm_vram_block_owner_get(block);
> +                       pbo = xe_ttm_vram_block_owner_get(xe, block);
> 
>                         /*
>                          * Critical kernel BO? Best-effort check without resv lock;
> 
> 
> > > +
> > > +	/* The BO may already be in teardown with a zero refcount */
> > > +	return xe_bo_get_unless_zero(bo) ? bo : NULL;
> > > +}
> > > +
> > > +static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
> > > +					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
> > > +{
> > [ ... ]
> > > +		if (block) {
> > > +			pbo = xe_ttm_vram_block_owner_get(block);
> > > +
> > > +			/*
> > > +			 * Critical kernel BO? Best-effort check without resv lock;
> > > +			 * worst case a concurrent pin causes reset path unnecessarily.
> > > +			 */
> > > +			if (pbo && ((pbo->ttm.type == ttm_bo_type_kernel &&
> > > +				     !(pbo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) ||
> > > +				    (xe_bo_is_user(pbo) && xe_bo_is_pinned(pbo)))) {
> > 
> > [Severity: High]
> > Does this lockless pin check create a time-of-check to time-of-use race condition?
> > 
> > In xe_ttm_vram_reserve_page_at_addr(), xe_bo_is_pinned(pbo) is checked
> > without holding the appropriate locks. A user BO could be pinned right after
> > this check (e.g., for display scanout), and then forcefully unpinned and
> > purged. 
> > 
> > The display hardware could then continue scanning out the old physical
> > address, potentially leaking data of whatever new BO is allocated there.
> >
> 
> We should probably file a Jira for this, as I agree this possible with
> the right race + NIC trying to pin the BO, but unsure how to handle one
> properly.
>  
> > > +				kfree(nentry);
> > > +				pbo_to_put = pbo;
> > > +				drm_err(&xe->drm,
> > > +					"%s: addr: 0x%llx is critical kernel bo, requesting SBR\n",
> > > +					__func__, addr);
> > > +				break;
> > > +			}
> > > +		}
> > > +		/* Queue both free and occupied (to-be-purged) pages */
> > > +		++vram_mgr->n_queued_pages;
> > > +		list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
> > > +	}
> > > +
> > > +	/* Deferred put outside lock to avoid recursive deadlock */
> > 
> > [Severity: High]
> > Can a concurrent allocation claim a faulty free page when the lock is dropped?
> > 
> > In xe_ttm_vram_reserve_page_at_addr(), when a hardware fault occurs at a free
> > address, gpu_buddy_allocated_addr_to_block() returns NULL, meaning pbo is
> > NULL. The page is queued and vram_mgr->lock is dropped to prevent deadlocks.
> > 
> > During this lockless window, a concurrent TTM allocation can claim this
> > exact free buddy block. When the fault handler later re-acquires the lock
> > and attempts xe_ttm_vram_buddy_alloc(), it will fail, returning 0 without
> > purging (since pbo was NULL). This leaves the newly allocated BO using a
> > faulty hardware page, which will cause persistent hardware errors.
> > 
> 
> This also looks right. So I think:
> 
> @@ -804,10 +807,17 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
>                                         __func__, addr);
>                                 break;
>                         }
> +
> +                       /* Queue both free and occupied (to-be-purged) pages */
> +                       ++vram_mgr->n_queued_pages;
> +                       list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
> +               } else {
> +                       /* Immediately offline */
> +                       return xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
> +                                                      size, size, &nentry->blocks,
> +                                                      GPU_BUDDY_RANGE_ALLOCATION,
> +                                                      NULL, &nentry->used_visible_size);

I missed adjusting n_offlined_pages and adding nentry to offlined_pages here.

So I think check the return of xe_ttm_vram_buddy_alloc, then adjust
n_offlined_pages + add nentry to offlined_pages.

Matt

>                 }
> -               /* Queue both free and occupied (to-be-purged) pages */
> -               ++vram_mgr->n_queued_pages;
> -               list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
>         }
> 
> 
> > > +	if (pbo_to_put) {
> > > +		xe_bo_put(pbo_to_put);
> > > +		/* Hint System controller driver for reset with -EIO  */
> > > +		return -EIO;
> > > +	}
> > > +
> > > +	if (pbo) {
> > > +		/*
> > > +		 * Purge BO containing address - reference held from above.
> > > +		 * This does not necessarily free the blocks synchronously: if
> > > +		 * the BO is not idle, ttm_bo_pipeline_gutting() hands the
> > > +		 * resource to a ghost object and it is released only once the
> > > +		 * move fences signal. The reservation below then fails and is
> > > +		 * retried from xe_ttm_vram_mgr_del().
> > > +		 */
> > > +		ret = xe_ttm_vram_purge_page(xe, pbo);
> > > +		xe_bo_put(pbo);
> > > +		if (ret)
> > > +			drm_warn(&xe->drm, "Purge failed at addr:0x%llx, ret:%d\n", addr, ret);
> > > +	}
> > > +
> > > +	scoped_guard(mutex, &vram_mgr->lock) {
> > > +		ret = xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
> > > +					      size, size, &nentry->blocks,
> > > +					      GPU_BUDDY_RANGE_ALLOCATION,
> > > +					      NULL, &nentry->used_visible_size);
> > > +		if (ret) {
> > > +			nentry->status = XE_PAGE_RESERVE_FAIL;
> > > +			drm_dbg(&xe->drm,
> > > +				"Page at addr:0x%llx still busy (%d), deferring reservation\n",
> > > +				addr, ret);
> > > +			return 0;
> > > +		}
> > 
> > [Severity: Medium]
> > Does this unconditionally attempt buddy allocation without checking if the
> > retry path already succeeded?
> > 
> > In xe_ttm_vram_reserve_page_at_addr(), if xe_ttm_vram_purge_page() frees the
> > BO's VRAM resource synchronously, it invokes xe_ttm_vram_mgr_del() which
> > triggers xe_ttm_vram_retry_queued_pages(). The retry logic will successfully
> > allocate the buddy block.
> > 
> > When the original thread re-acquires the lock here and blindly calls
> > xe_ttm_vram_buddy_alloc(), it will fail with -ENOSPC because the block is
> > already reserved. The page's status is then falsely marked as
> > XE_PAGE_RESERVE_FAIL, leading to misleading internal state.
> > 
> > > +
> > > +		list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
> > [ ... ]
> > > +static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe, u64 addr)
> > > +{
> > > +	struct xe_tile *tile;
> > > +	u8 id;
> > > +
> > > +	for_each_tile(tile, xe, id) {
> > > +		struct xe_vram_region *vr = tile->mem.vram;
> > > +
> > > +		if (!vr)
> > > +			continue;
> > 
> > [Severity: High]
> > Does this skip checking the kernel-dedicated VRAM region?
> > 
> > In xe_ttm_vram_addr_to_region(), the address lookup loop only checks
> > tile->mem.vram and neglects tile->mem.kernel_vram. If a hardware fault occurs
> > within kernel_vram, the address mapping fails and returns
> > ERR_PTR(-EOPNOTSUPP). This causes faults in kernel memory to be silently
> > ignored instead of triggering a system reset.
> > 
> 
> tile->mem.kernel_vram = tile->mem.vram in the current code but for
> completeness, this likely right too. I'd check the kernel_vram if
> tile->mem.kernel_vram != tile->mem.vram.
> 
> Matt
> 
> > > +
> > > +		if (addr >= vr->dpa_base && addr < (vr->dpa_base + vr->usable_size))
> > > +			return vr;
> > [ ... ]
> > 
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260902145343.465686-17-tejas.upadhyay@intel.com?part=9
