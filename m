Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201A8522F1A
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 21:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765389; cv=fail; b=u+yijaBl0poDvzvEYzj919XJF4JoYzKEM1lD9u/22KTy591ZSyfRKMPJKXPho/lYHglFNuBENKnnXADDVgUllXExl3lyWipmLDxAXcYAxnd6kAN22pLwywQerzqcjePsQ84AldaIbVE4sWbnnlTwu0VfRxIZTgY//dYQL5ASkoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765389; c=relaxed/simple;
	bh=to9ATfgxMbZ+7ofCRPsvUyVTe/trllCUFwge/zaVAHQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BaFLUFkMTOvyOC1WlvX/tTbjaihCuMTtuyTfDXxKfqecW9uRWf5Ein2sIiaiY0Zp5rWRuQFNQWc7eCmhRi469sdRQnt9VPnuemhBRUkEV74iA0f84t48K9RoIH5KKtOTHCjDeV67lT1w+dU/V5UOVL3ijw3iRYIyuipw9ZR+KIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCXof53+; arc=fail smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCXof53+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789765388; x=1821301388;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=to9ATfgxMbZ+7ofCRPsvUyVTe/trllCUFwge/zaVAHQ=;
  b=DCXof53+Fnak/JHWUJ5JlP9l6hJdDGevkCAJI53Z9qypsWXuKBFv9v6H
   mgFGgMUyHDlhpBaXfchUcfCTLAxDlqWG8V2E5KHbiSZc8ddPdPJcYhj5I
   Bu+QEFOBhFht6NVX9RwdzLX3ytn2Z1M3ti0gI+Xse7wi1uqOuKOwAAW0R
   3dBvjrLVAi1HoQQi0ov3I+Hm7uUqmBP7K/OJb6C8vBpsJ3UZ62jWNxEti
   5fei5ZNU8btSVT9wXSjcMrk99GthzsMnDt8yqxzR7tkDKbx87HRCiBBGk
   9Xxouv6X3nU1AtFRabmCjphKLTbIE+dEV8f4xdzSndsHlXhomHuXB7HuW
   A==;
X-CSE-ConnectionGUID: Oua2uDsoQ+eC7DUxso2hjw==
X-CSE-MsgGUID: OM+kooLaT4aRxfayHxIO0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="798240"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="798240"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 14:03:04 -0700
X-CSE-ConnectionGUID: Qc7AvOOCSRmyoxtU+4NkXw==
X-CSE-MsgGUID: RebTrPMfSlCURa6hiJ9pKg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 14:03:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 14:03:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 14:03:00 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 14:02:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzALGyUGZ0VaSqzZjOTBxhn2O5Etz/EsDKxMgmoZ5deLGkGwWKPZQTVUjzAfYOF88s1g6kpF+JGIzRhWfxo8Q90WRre9fdgX7Bl+mX4ry1Pm47Z4ZU/8aEFlrbZnHJOXhjrbXLSgyWTKhgq0T8pQ0Dl3xMreR4gDXouvSeMcg4JVu7OCf5lb16+nA0G5bdJqU1UiSGHC2DBMBc3l+CLmR6LI4lB1jglJ/8fOgNdLebLte5UGKgXmN91s/gQmft3VznaNCHpMfwl2+RmdhF9fseLGZ5r0OOsmyQ3pEhHaNrlsGYx6/5Rsy5ZMbAFVuG2hBMADt8orj69UUz1ReIrUWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92J72XXM5zETouQeKMdmrtoOwpZ+itucsHGJDcPMIVM=;
 b=jt/L8RRU2hTHEI1678BKBJZyJ4SdtHms2vU4VpmuAYBsc/I5fdC1aORuxUO5FYjw5tK8muY3SygIy1KPR8Sr0E4vHiMTErLnUubqoxmmV72JV5wnzu+M64yzt5ZQbtOjOKFjH5NQqQ1G2foAgvACF8vZyV+pIOV5X9eFBPNxrBw5ReLpHyFn9tOEchpcc79NxT2ME2pfjciFYLCf3rCm6fK5SF1d20AXmwn42wm4dbhT3RLY69RRe+IxXwmDJB1VAnX8Gjg8dUxqhdBShLOg5afXgQKoBnjvUJiddKKnScQJ2B6adxGrcaUPGw9CncUZBKt2m+/06dktCGBwrSvl4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by BL3PR11MB6387.namprd11.prod.outlook.com (2603:10b6:208:3b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 21:02:40 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 21:02:38 +0000
Date: Fri, 18 Sep 2026 14:02:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 3/4] drm/xe: Bump prefetch BO LRU via GPUSVM devmem callback
Message-ID: <aq2m7LRrjAXw9pyC@gsse-cloud1.jf.intel.com>
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
 <20260916112828.2528881-9-himal.prasad.ghimiray@intel.com>
 <20260916113633.087841F00893@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916113633.087841F00893@smtp.kernel.org>
X-ClientProxiedBy: SJ0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::34) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|BL3PR11MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a41198-f344-47ca-ed2b-08df15c82bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|4143699003|10067099003|6133799003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: myGWLd7VDh+LOU9Gxf1HtbUYdnzOgmvTX4DksP26/z5qFPf30Lz0UTrbK7GltZQSmHd3ITOaWwjE7FziIovoRFe+hPM11Kn63iA5sbZvLboJxVt5ulHtf1zCkrd+BEsH1AksSIzdpkoB4P9lKlm9bnPtqEVclBVUzasNBfXr3f+0rMjeYE+zOlRZahryyb90rxB+aoeptSEtwJi0I1JwdLg6u6X99hYmsD30u+DLP1SLeRZmB0Z3Je9yosAm09jcAWPgHdhulVnBI7p3xB441cFctpFUFpO8OauQkT3spPs0r/nLFQgaDlw9xwqjsjFnM5AgJKPzdT2CcIgsxgVsSMbRZT86rWhQ50LLjO8CFKr6/Fzqw53NAfUj9M30hYRrZ68gMOM6I0L4PxnDTJMkUhmYbwsYtyt6ek8n1ZLRi71RwsjUdhl3+wy2jB6GlfNzethOciXUqqiUHobSbYXhQw2jszmXG7GA5Jt+kwJ7xqPriAFjTVrIxYstvDl0XvXcs26P5lQwfkknPxUL+CvUJrqKaB+qNhOUy9sRO7+mvAcZRauaIRciK9E4GnLvUPAUSzqdKmspkMHXdDyN3WcuNQ6b+m3yJYR2rdoYDsreO+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(6133799003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?j5coCMLQY9ANwiuAHAqnMo8mgvVHrnMOq7h5iBz3xPvE1M5GbN8CjV43Q5?=
 =?iso-8859-1?Q?/sA4E5mSxrEJDfwPCUZJQ7YqZD3qijBUEjUGVdJ5ajSXXnaDKWRIQX+dzX?=
 =?iso-8859-1?Q?+D5gY76GDMz+LOy2wX5w0fnTmqshkVL5hsEYZq//IJGzpaotoSeaBQFJah?=
 =?iso-8859-1?Q?OCIHTB0PCCHBHtqYHPyFJiGYqxc9/kig4Mz780b/NhtB8eiFOfNAVUmIlI?=
 =?iso-8859-1?Q?5kyigk27teVgKsPQF6cB8QKCp1ZxgUs/mlNaXZr0SVf5uZWCrJUdT91HIA?=
 =?iso-8859-1?Q?7xEh3eHxda5qEtdSXMmKabHmKnq9vUm/jyRlIQx45IDyHPplL9WPPCfiYH?=
 =?iso-8859-1?Q?HORr8AgdkJ87rambXIhmXheTqdtZIC7K/QIMYA6Y5qoH1zOVOH3K2tMoLI?=
 =?iso-8859-1?Q?eBBLMAuam75EOdrkHdGNjV9o+VwHHk9JjiQqUEW9omwR6Z/TuyOAHGpTN0?=
 =?iso-8859-1?Q?fJIT32GC73TZLcGLBUIjtziAoHv9HY/fhnE6Mn3sIca9BIpG35Itm2QU1K?=
 =?iso-8859-1?Q?LtZeBLMvhCLAItYJ0/hAbnCv7rGKQCp4zyiklXD0pPl7X24z5Kb1Svfd8h?=
 =?iso-8859-1?Q?rFP3RgskSmGOE59jeVgaUA4eoZBbZJ1bduznN65gofxJ6MSxYqQNqKVvqY?=
 =?iso-8859-1?Q?jAylilqRUEYkkmFwj5CdUeb7RpcCfKasx50SKz00jSpr47uHKTqIm381Ih?=
 =?iso-8859-1?Q?oNfyC0GbStBJcJlUQKTf5y3WS28mL7LY/H4qehdRSnCyOwDViVPOQdVsny?=
 =?iso-8859-1?Q?qSV/uCzR50GCKVtgYqNwcBPLacOlys4bYp+mrAkz0jIXuJqfJLDkDa4bWS?=
 =?iso-8859-1?Q?/wheNAY78tJtwXy4EHCxUIdwSfSWu53K/gqhJYdk2BD0RDCmECAI+z3RWK?=
 =?iso-8859-1?Q?pF5D4qfl90vh1QdqBjQLqU3ZFWFSRNLN0L0DUyiaMpiLeMLvlFmzFu0BNK?=
 =?iso-8859-1?Q?4y3BJsxfihERKOlCMxhqETgPu+tmNLCPmTFfOMB+Iov/ZblQwqE2npMpxV?=
 =?iso-8859-1?Q?VIq1M5gsUnWyzFZjNYsm2jfFUjOn2OLLOvgNTRBxDUWE3jjpzQxxIDw7Fa?=
 =?iso-8859-1?Q?3hQdvZ1Ej+2NympGffppECtzBPgsh62bHOaAttLuGjisin0jnng9gs6q03?=
 =?iso-8859-1?Q?tiN/yX2kx3uwiU814851ADokGz6ESRYzzzsQ070X4e2wYEQvVCvKdAvo0b?=
 =?iso-8859-1?Q?BxzAOhgL6XgtA4DWI6Uqh/gPlCG3cMbT5TFevAwy5jDAMaDqeZw5ZjuYOX?=
 =?iso-8859-1?Q?d4pKBObPL74J3Vepx+9QdnWNUzfhEPhVZxz7YbsUSntZKzTP62c5Y8plRs?=
 =?iso-8859-1?Q?14i36ymqdq5mULI0V/ozi0P85dYZc9yHnL2I5GCE8jAjWNyGbSrNwr6sZq?=
 =?iso-8859-1?Q?J2yUREjqQGhhQxTPJN10O/TW3p1zVnCwQXr2RyN2neA15cuEV1ye1aNla2?=
 =?iso-8859-1?Q?K1tH8irb19OXTDBhXCZr1szU4i91D3A4mIWUGm6xpwSx3/V0UA/Z0itLn+?=
 =?iso-8859-1?Q?rtI6kCENZ+ghxE+gDj75d2yxZ3Y5PAmzn26cjvPW/0uinuAqAUGcm8SIhQ?=
 =?iso-8859-1?Q?McGnRRgVYll7VvuAr/oR7zHmaTYqvWLA7P9osUoVW3Dor4v97/vpqjL0Lk?=
 =?iso-8859-1?Q?9iURnboscbXq+A30TBJVcQEJcSwqOfQy76BHuZI1squQrM3kP8N/xdznvE?=
 =?iso-8859-1?Q?6sY8FNxmAR2HSCgJvlIaPkjANhn9EmvIpk66ubgfVcmFmfSUaUzBGEyuME?=
 =?iso-8859-1?Q?GyYNBCOUOEbEkHVaoOe+xdztYAznh7jXOPX5l5VbZ1z9ThgVgRbwhQb3aJ?=
 =?iso-8859-1?Q?29YZgzM86A=3D=3D?=
X-Exchange-RoutingPolicyChecked: LRZ+nsfiLoWsXUHP/z5UsxJbiNQbdRmraNy27lYUuzalGs7ApFyvaMW3Y8G00+fqe179eEuszhTRb1IWf41ByXpOFQ1jVzu8d5aJcbDmN/gbhonzctMZv9tpW3pqwABDyaPy5wbqHSL1gY5DB1lR0GHlixIOVGQ6daN9UUgH8g9Eq0SMK/0WjP5g+zdfTogNmTNGscL7tRLlKPzmN/7M8rYAAA847pEkE3FFtL41n7OcO5k0nnF/WvHqXEsE1UwRJV/KFrfzIdcRQ6KjQKVJwPP1auEp0YyrcqTXby/F5ZJQH8XosUV6d/iLdVlm9pFEsNC6r0168O5vT+PyD0jdjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a41198-f344-47ca-ed2b-08df15c82bc8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 21:02:38.3742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZjpvlRFCXD3Nl0kLL3hDkbcHuBCNzT0Eu6DGRm9iumv5dBjYAI4irvyUyAJp5Se2FCRv2I9tehsKRVMwFiK8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6387
X-OriginatorOrg: intel.com

On Wed, Sep 16, 2026 at 11:36:32AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/xe: type confusion in xe_svm_devmem_lru_bump() due to unverified cast
> --
> 
> commit 09484da3688fb659e04396330f11c6ca63c00b90
> Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> drm/xe: Bump prefetch BO LRU via GPUSVM devmem callback
> 
> This commit adds xe_svm_devmem_lru_bump() and sets it as the
> drm_gpusvm_ctx.devmem_fn callback in the prefetch worker to move backing
> BOs to the LRU tail during get_pages.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 6c3033fc4db73..7de6ed818d45e 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> 
> [ ... ]
> 
> > @@ -1612,6 +1613,25 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
> >  	return err;
> >  }
> >  
> > +/**
> > + * xe_svm_devmem_lru_bump() - Move a range's backing BO to the TTM LRU tail
> > + * @devmem_allocation: The device-memory allocation backing the range's pages
> > + *
> > + * Intended as a &drm_gpusvm_ctx.devmem_fn. Runs under the GPUSVM notifier lock;
> > + * the dma-resv trylock avoids inverting against eviction/shrinker, which take
> > + * dma-resv before the notifier lock. A contended BO is simply skipped.
> > + */
> > +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
> > +{
> > +	struct xe_bo *bo = to_xe_bo(devmem_allocation);

Based on Sashiko feedback - we probably want a check here...

if (devmem_allocation->ops != &dpagemap_devmem_ops)
	return;

This would future-proof us if we ever start using SVM with device memory
sharing on non-Xe devices while still sharing the same
device_private_page_owner. At that point, we would likely need to
rethink the LRU bumping, perhaps via a dpagemap_devmem_ops vfunc, but we
would not immediately explode.

Matt

> > +
> > +	if (!dma_resv_trylock(bo->ttm.base.resv))
> 
> [Severity: High]
> Does this cast safely handle generic device memory allocations?
> 
> If userspace maps device memory from another DRM driver into the SVM address
> space, hmm_range_fault() can return those foreign device pages. The drm_gpusvm
> core will then loop over them in drm_gpusvm_walk_devmem() and invoke this
> callback with the foreign driver's devmem_allocation.
> 
> Since the generic struct drm_pagemap_devmem * is cast to a driver-specific
> struct xe_bo * without verifying that the allocation actually belongs to the
> xe driver, can this lead to a type confusion and invalid pointer dereference
> on bo->ttm.base.resv?
> 
> Unprivileged users mapping memory from multiple devices in the same process
> could trigger a GPU fault or prefetch, making this a potential denial of
> service vector.
> 
> > +		return;
> > +
> > +	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > +	dma_resv_unlock(bo->ttm.base.resv);
> > +}
> > +
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260916112828.2528881-6-himal.prasad.ghimiray@intel.com?part=3
