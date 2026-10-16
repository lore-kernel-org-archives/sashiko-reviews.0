Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C1836403B
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176078; cv=fail; b=bXjNeHN5fPkRp0h9FRGAKzn55xiGRDa/2FYgrDMAZvYiKSFcEkAxz0Bqt/Qq24hBo1QcPMWMjX9S2lK1yAYG/L1uqJz4HLFTJoYGKjhNp0HO1cbqGP3trDTKXmPaNI58723nd1noJmj1LlxESBfG6HqP4QOLMNX3ZQvfV+8s5rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176078; c=relaxed/simple;
	bh=FCqas+P5jme/Somc/wYwjZXOvYZFLTjJW1QQrWNr3rs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a5dc4baJ5+SbevDwSLO63Bxwh14k4pU9IejHmkfdKRNZHIvx+OAcpPyhY16orETtL5LUEdvxy4K8JVbAYsM30e2/QrDOeyIFjcplTVGUL9NdVms/0VHwezpt/QW7qhJspa+/DpFvd2Ya6gHvonG4qtpHmffZz3+iF0IvSQ7Xha8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqSTZwAN; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqSTZwAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792176075; x=1823712075;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FCqas+P5jme/Somc/wYwjZXOvYZFLTjJW1QQrWNr3rs=;
  b=mqSTZwANASZdI+VMpq+mcqC+vWIh6NDiqrC8qVQuToIRkWZimVtGeK1Z
   WueBB6qkLnh96QIaLen3IqsMn3MNbNY9oFMauKaLNe+3AZ6azgRKML8l/
   MpWPRvOIe80dEbzk1H7irmvOCUkZZdPGU9o26P2/c0i40HXQ6miTnuCDz
   twnanA5G0HzI3aqoXLhuH7G0PMncHCdV1v3p+ezULBIHWlwwHDvfFVF8Y
   xSqSg1I6AeL34cApSf8RlcWNhm8hUlsDO5EMaf3WThyFBcM9+75j1wAbz
   x2t2IgAAspxTwSzG9MrfmTDS6PUpR1RQvfrkLcjo/EHqfyTE1gr46vQXZ
   Q==;
X-CSE-ConnectionGUID: ambpXnycRI63xPpkhcyX3w==
X-CSE-MsgGUID: Jiglhz2lQvq7pRzSDD6Qpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="970368"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="970368"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 11:41:13 -0700
X-CSE-ConnectionGUID: dpgnWufLRaWsNKJQsbjbXQ==
X-CSE-MsgGUID: ijm5ka9cQyG5l8z0jD1tOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2260636"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 11:41:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:41:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 11:41:13 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:41:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbrROhhgIV+6BUTdnbavfrY8IBbVkol+TYaNVOuwpwBWxt6hLbjkqZvnRyoVX9Bwy0fAKLd+X1GpLh0ltW2K6+iHWJE1iAB9h/J4/7rVyUI+h4vZaZgK5VcDIH3qkfCZl55VvVxMez3eSBe8FM4DLq9pejoWHOBdDeFcAPE0CCnMpaJnYorRZsr1lk184ijaqat+O4T8SYgXxf9HOs3UplF+rpKLRJHPHnf8cxoBNNUTHMF5HyCULuKBM6jKhAvfkg4He2U31HhKro52lz74G4ScKwXQB0jh4ExlIgsgNWf2etWEWZ1V05rIPKpKG4N8fEwCggBL74mEz3JoaTws3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRx6DT0cX2dn+TfwpcE6bI6w6mzXCnTPDBbaZgnSpEI=;
 b=sPrdtYXZDm8MM+kz+guZKdm3YgYlIBXHp7SMe3BddFmCT2YKeKOwMryp0avFEIFHTmlGmjbz4XUX8yTBkCdBHMH1NuoGDhfKNallrn4NllzrCWiCrHNMz+RXSymKNfNexINrDP9/X8FRJ42zGdzIyBREnrhvgZTSf6HTyYCSkdsXcEMa/5XQXQf2pBLdqhUEFUW9b02cfIW4iqks0sbo1rfhddgC2ThwcU0H+/wQyr1t+8eaE0ldz7fm3Se3KD3R66Gcx4keOD7lPlKDwWbvVpcuZ/+x/znhH6/5b/2qmxyQhTNLSniJrJKtY3DUVcefLk1i2ymbgaEnxDmno/v71w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by LV0PR11MB9790.namprd11.prod.outlook.com (2603:10b6:408:385::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 18:41:11 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 18:41:10 +0000
Date: Fri, 16 Oct 2026 11:41:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 3/4] drm/xe: Split the bo shrinker into purgeable and
 non-purgeable shrinkers
Message-ID: <atJvxCnNISBr2VLK@gsse-cloud1.jf.intel.com>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
 <20261016133523.3622-4-thomas.hellstrom@linux.intel.com>
 <sashiko-outbox-174414@kernel.org>
 <4d1338d127bb9b77c8bc9a114c7c8740d2ec2780.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d1338d127bb9b77c8bc9a114c7c8740d2ec2780.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:303:8c::6) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|LV0PR11MB9790:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d93ef25-710b-46ea-6f68-08df2bb50c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003|10063799003|13003099007;
X-Microsoft-Antispam-Message-Info: 5LwSbhutCtLitAeZsLnBMlgVoEEfkCyGnkXK8nZ7ksKwHqd4k0WrzIrvm90WlOirvbyAnr9pBfNG/I9kzezwvqPI0f2Uui9MrbP51QPEbW2aCcQOrdWeIV6dcFTFa+NVPtUtM5427aQPuJw27khGPg847PSW9ec8B6GKcuYzS88sATU58PtYboVm2/Bts9rpdqpvk25F5UxKecQ9+LFepUzDDFxw/1t36MAv8Ah6Mz4K95SIt8Qq02y6Rt5IHOjajyFzTvY5G4mRiexXnBmGoiTcDw0DBxCx58E/pOB4OPpbXuLKcK679mgftxC4GxCYBhEUI0fqChMg3NbnW0VjjzG/KcjZFNelF5ppYa9XlBY4wPOFLSMo0HkM+6wF9awehYSnlENUxJDar9UXYTifkUK+oPUBgnXaXsoCrqzSKoL4M3eTBV3sb5u3vOloB1LaJoN0Z8WGxSjGlDqmAFc/7MFAdjVysn+2tmwtyWswl5koO1bsBCxXtgs75WoB+dORaXHf1qUAYp1toSa5eeuKgYLNsbdMG6CWwArNYnxOCSXsNlCTno6yy7qRoVJczYGGQWUEok0I4UraP2KUS/c1sMDPmP7BdrRujHSY2wKGNb/rF64vXQcRbZjebNmq/9zk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(10063799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5mWVysI970I9IwYhVnK2jDNS0RKXCCtb3cLj506BVj8UiIH58CsBv9BbVB?=
 =?iso-8859-1?Q?dsdU442bvaQwxnn6oQbvbg6z8drRNLJnoYHv/E+r+k6t/9T1hMQjCZNxuJ?=
 =?iso-8859-1?Q?/lsDAU8X8bpRZfzPKl6FbyoiikVRn76eDnux95R6PdwG+PJK4cbuysmo0x?=
 =?iso-8859-1?Q?yu3ONVcgItYoRdUAZDhZ/jscyYGmlnAth2f3JrOY3odpQICIeAcCJZajWO?=
 =?iso-8859-1?Q?fK/5ml/pdN8F99VkmV/zSDhn0hzSUaLcNIQXKOH8lDJXUvp5vn/KCFyY9a?=
 =?iso-8859-1?Q?8hkPkdy4ZTm+Ig1pAxf55VflPXwKv7fnYvnYnlbMopDBaMILHjR4r1XgQk?=
 =?iso-8859-1?Q?rSy9zS8o1fgdstyD6tfrquHSmN1xoPc0FqXAKEt1kgtrXA4upcZUgzviSI?=
 =?iso-8859-1?Q?c3m2tM5dtaspNqDGFBBX4dO/NZVNhyPLur1DK9uE/ZL1MyAwDUMr8guv5a?=
 =?iso-8859-1?Q?mGW5BWmJqs1PGQRoYEHgq1VnSuH8T8/B7tbS6+CTZvjRTi0dyxD8yHlx9i?=
 =?iso-8859-1?Q?OOPDVFy2qikX3CIoSgf8+/jkmc0SuJT0jMTIA/nhn/mZl0CDfwuRWHsj5V?=
 =?iso-8859-1?Q?/lziw/n1duCQEsxvlGT84saO0EKdzNr0F4VM1oVFvRZ90oRDnqFhOSjbVu?=
 =?iso-8859-1?Q?JcqAEMcONFEAs1Cw3rThH2SBMOtoIJHyAiI+j8Shslk9C9HdWh0Oqp6G5q?=
 =?iso-8859-1?Q?4NJeuXABlQB1CzYTh6Sv2nrSvRybZ0112eUMPJd/syssWUb0Pbkj5yXLA3?=
 =?iso-8859-1?Q?JlqNN+yQkVUj+pCAXXoeWchNLHOZF3Fu5WqBk1ASTVXjcj3C0IahmelT3N?=
 =?iso-8859-1?Q?v9baTq0Fhh3GP2SyMSgaKZUdI86bOIMocpQ5SyQLakRb/XZzRgrmoN1W1r?=
 =?iso-8859-1?Q?p79qqi3oOFlT7AdZ1qBugvoS++JtGNRadlGy3F3GD+MexbLEU2za0AZ8hD?=
 =?iso-8859-1?Q?q6mO5SS9BBOggqZ0Zlom/qATxAn/xjIGSKhnpfMXrLsHReY99EZRM6LRm+?=
 =?iso-8859-1?Q?NNF+QRP67JGgT3WfDbJoN49r5c3UegOGMNCYRBw8VBaKd122hGxrqdIBzW?=
 =?iso-8859-1?Q?0eNsi6oFWmfcVJIPvw3XZAtDlhM0By6SCe+YHoKkha8ZSyn2/fRY40mBpn?=
 =?iso-8859-1?Q?fJ51D58ifW1DzAVDYRWbN7e8Gh+1F2+Df9hKWWjoxcaiq631QcWtlnTFDE?=
 =?iso-8859-1?Q?vxcHdrb1piO3ESJEgu3KaAknNF/Aafca/VjTDNRrmjqTqn1dLCsVK75DIa?=
 =?iso-8859-1?Q?3Evr+01WOu2FM9w8eV7Rja7thbD76PIiEjDxrYSN5D50undm/AUFjHykBF?=
 =?iso-8859-1?Q?wZ1+SS0FnsV96n75gFNRcIjmKN9gSFfKH3AkOAudmPxG2t6lDkePKcPGVT?=
 =?iso-8859-1?Q?KAxcbJLR4VATQktU/j33qfioVIO7N80nBYPBp2c9inR1dFlcq6TVotF3SI?=
 =?iso-8859-1?Q?+2UtCgXrxoBWazKnZ11ecKJA5D0ZXaELFWjmAijG7hYX9VxAYAckhNQ8BP?=
 =?iso-8859-1?Q?XdQQPSzIbSkyHKEHpuDDQWdoyHvGc4D5gEtOMyyJlF+Tg77EDqU2e2iBL4?=
 =?iso-8859-1?Q?cp2Ft4gR1PxSaF0M+Mcet1IuAzIIbGo5T6DPTtRdoQYkXrMsnWX1MNqM5F?=
 =?iso-8859-1?Q?KQjzw1ZxyiMbTTM/M9x0naFjwWJ/W558kPtKXHAOLwTtv084QZm1Mb2txJ?=
 =?iso-8859-1?Q?cyGE/eByFs67pZQJUAWjuMIsOnPU8odwpSY3fxDLw11WW+hc82Q0EAZmzP?=
 =?iso-8859-1?Q?CNdHJiEklgw8xGSxLBvTvTz2W+DRDs70nK5urxtAazP+VP5OZixpDp76ZO?=
 =?iso-8859-1?Q?0Qb3qp0Orw=3D=3D?=
X-Exchange-RoutingPolicyChecked: axxZ9Ru9KoW/Lx0LcBU3geB17vpsfWXBubxj3HRAYusQyRGAyghLuGmcVWxd+q7dpCXd2j9voVkNxEsGV7AbEAsZPifJyKmSne2wfve862//GZieowmnf2Bf+o5jBlioEFc6fjeaNvsVCccu09nNO5RmD2zs8ztgWFXFVWD0x5q1Or8otS7LIJ2NSwA7SqrLKbyMAT87E7i8LFzpGT1qtJs8hv7hDjuH64ew5DJMr+Y4Jet6FBcku2jGVpMW3WMATQqykY1GRxkW3dF7svArFn93htjJaRdRXj4nAyoJRkXpnIHwvKjMAQhUTMNASBKZzoFFz8Ir3o4lUile/nhy8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d93ef25-710b-46ea-6f68-08df2bb50c34
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 18:41:10.5275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOM7RdQK1xANe0kRNhdIRC8Zq/te7Dlhf28bDLRjHNpzWVb+4iqdrodc7/2nLEq2w7Ys/u+NbtAGZeGyR5tLLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9790
X-OriginatorOrg: intel.com

On Fri, Oct 16, 2026 at 04:09:44PM +0200, Thomas Hellström wrote:
> On Fri, 2026-10-16 at 13:53 +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issue(s) to consider:
> > - [High] drm/xe: Use-After-Free of shrinker during DRM device
> > teardown
> > - [High] drm/xe: O(N^2) CPU lockup in purgeable shrinker due to
> > uncounted LRU skips
> > --
> > 
> > commit 1e9348c2fe4768de2cf24e4dd9b6188400c84043
> > Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > 
> > drm/xe: Split the bo shrinker into purgeable and non-purgeable
> > shrinkers
> > 
> > This commit splits the single xe_shrinker into two independent
> > shrinker
> > instances: one for purgeable objects and another for non-purgeable
> > (shrinkable) objects. This allows the shrinker core to apply
> > different
> > reclaim pressures based on the varying costs of reclaiming these
> > object
> > types.
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > > b/drivers/gpu/drm/xe/xe_shrinker.c
> > > index 378022c37a57c..8e3fe675e0f34 100644
> > > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > 
> > [ ... ]
> > 
> > > @@ -216,63 +238,52 @@ static bool xe_shrinker_runtime_pm_get(struct
> > > xe_shrinker *shrinker, bool force,
> > 
> > [ ... ]
> > 
> > > -static unsigned long xe_shrinker_scan(struct shrinker *shrink,
> > > struct shrink_control *sc)
> > > +static unsigned long xe_shrinker_scan_purgeable(struct shrinker
> > > *shrink,
> > > +						struct
> > > shrink_control *sc)
> > >  {
> > >  	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
> > >  	struct ttm_operation_ctx ctx = {
> > >  		.interruptible = false,
> > >  		.no_wait_gpu = ttm_bo_shrink_avoid_wait(),
> > >  	};
> > > -	unsigned long nr_to_scan, nr_scanned = 0, freed = 0;
> > > +	unsigned long nr_to_scan = sc->nr_to_scan, nr_scanned = 0,
> > > freed = 0;
> > >  	struct xe_bo_shrink_flags shrink_flags = {
> > >  		.purge = true,
> > > -		/* Don't request writeback without __GFP_IO. */
> > > -		.writeback = !ctx.no_wait_gpu && (sc->gfp_mask &
> > > __GFP_IO),
> > >  	};
> > > -	bool runtime_pm;
> > > -	bool purgeable;
> > > -	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
> > > -
> > > -	nr_to_scan = sc->nr_to_scan;
> > > -
> > > -	read_lock(&shrinker->lock);
> > > -	purgeable = !!shrinker->purgeable_pages;
> > > -	read_unlock(&shrinker->lock);
> > >  
> > > -	/* Might need runtime PM. Try to wake early if it looks
> > > like it. */
> > > -	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false,
> > > nr_to_scan, can_backup);
> > > -
> > > -	if (purgeable && nr_scanned < nr_to_scan)
> > > -		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> > > -				 nr_to_scan, &nr_scanned, &freed);
> > > +	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan,
> > > &nr_scanned, &freed);
> > >  
> > >  	sc->nr_scanned = nr_scanned;
> > 
> > [Severity: High]
> > Can this cause an O(N^2) CPU lockup in the purgeable shrinker?
> > 
> > When the memory reclaim core (do_shrink_slab) calls this purgeable
> > scan
> > routine under memory pressure, xe_shrinker_walk() iterates the LRU
> > list.
> > 
> > However, non-purgeable BOs return -EBUSY and are skipped without
> > advancing
> > the scanned counter:
> > 
> > drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink() {
> >     ...
> >     if (!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) ||
> >         (flags.purge && !xe_tt->purgeable))
> >         return -EBUSY;
> >     ...
> > }
> > 
> > drivers/gpu/drm/xe/xe_shrinker.c:__xe_shrinker_walk() {
> >     ...
> >             lret = xe_bo_shrink(ctx, ttm_bo, flags, scanned);
> >             /* Like the TTM LRU walk, skip bos we can't shrink now.
> > */
> >             if (lret == -EBUSY)
> >                 continue;
> >     ...
> > }
> > 
> > Since the LRU cursor is initialized locally on each call and non-
> > purgeable
> > BOs do not increment nr_scanned, every batch rescans all leading
> > non-purgeable BOs without significantly advancing sc->nr_scanned.
> > 
> > Will this force the shrinker core to repeatedly call this function,
> > processing the same leading non-purgeable BOs over and over again?
> 
> This can't happen in practice since purgeable bos are always ordered
> before non-purgeable bos on the list.
> 

Is this true, though? If a BO is marked as purged on a hot VM and shares
the VM's bulk-move structure, it would remain hot in the list. Also,
within an individual bulk-move list, I don't think a purgable object is
guaranteed to be at the front of the LRU.

So, at a minimum, BOs marked as purged should be moved to a lower
priority band, as this patch does [1], and reclaim should only walk the
purged-priority band [2].

We can do this in an immediate follow-up after this series merges.

Matt

[1] https://patchwork.freedesktop.org/patch/743454/?series=170454&rev=5
[2] https://patchwork.freedesktop.org/patch/743454/?series=170454&rev=5

> /Thomas
> 
> 
> 
> > 
> > > -	if (nr_scanned >= nr_to_scan || !can_backup)
> > > -		goto out;
> > >  
> > > -	/* If we didn't wake before, try to do it now if needed.
> > > */
> > > -	if (!runtime_pm)
> > > -		runtime_pm = xe_shrinker_runtime_pm_get(shrinker,
> > > true, 0, can_backup);
> > > +	return nr_scanned ? freed : SHRINK_STOP;
> > > +}
> > 
> > [ ... ]
> > 
> > > @@ -294,6 +305,7 @@ static void xe_shrinker_fini(struct drm_device
> > > *drm, void *arg)
> > >  	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
> > >  	xe_assert(shrinker->xe, !shrinker->populated_tts);
> > >  	shrinker_free(shrinker->shrink);
> > > +	shrinker_free(shrinker->purge_shrink);
> > >  	flush_work(&shrinker->pm_worker);
> > >  	kfree(shrinker);
> > >  }
> > 
> > [Severity: High]
> > Does this kfree(shrinker) leave xe->mem.shrinker as a dangling
> > pointer?
> > 
> > Because drmm actions execute in LIFO order upon device release,
> > xe_shrinker_fini() is called before xe_device_destroy(). 
> > 
> > Later, xe_device_destroy() runs and calls xe_bo_dev_fini() which
> > flushes
> > the async_free workqueue. Pending BOs in the workqueue will have
> > their
> > final references dropped, leading to xe_ttm_tt_account_subtract():
> > 
> > drivers/gpu/drm/xe/xe_bo.c:xe_ttm_tt_account_subtract() {
> >     ...
> >     if (xe_tt->purgeable)
> >         xe_shrinker_mod_pages(xe->mem.shrinker, 0, -(long)tt-
> > >num_pages, -1);
> >     else
> >         xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages,
> > 0, -1);
> >     ...
> > }
> > 
> > Can this lead to a use-after-free and memory corruption when driver
> > unloads?
