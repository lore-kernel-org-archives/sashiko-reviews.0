Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955BB49BD86
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 21:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766913; cv=fail; b=ReLOtu6fI4asowDImSwZvPmAMeyRaaQ30ixAWDkG4FG6j5jbZJGdLnBHnVNbhN55UHza2BB2+DMDSttdyknDXPf3IyvBBXrmYp/V5JNPuEGIkhWjjBgtt9UHziiZ2zvk1zd6zqB+tHXDqnMp5lyAbwThhGyS8ddS1GlFDkXXv94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766913; c=relaxed/simple;
	bh=4OsI6RzKpMr5p9v71Fr7Ic+7jhKbHD2lOMKVRGI8pR8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cgCaSK/3S0zisX/0K8CRB46BXOM+Zdr+hD2+MG9l1Npj3REJQZIzuMKpS0dS5jm4l2Ko9yqpYEw0SmDeTMGAyXTY4JZsH65nImodGZk1amsYlhlm4Fz7qvlcX6v0Br5jvomg2J/8UM8eEjXUBTGHClep0VLetNspEFMsoi9T6W0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0II4Dmt; arc=fail smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0II4Dmt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789766911; x=1821302911;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4OsI6RzKpMr5p9v71Fr7Ic+7jhKbHD2lOMKVRGI8pR8=;
  b=U0II4Dmt0Hg+M95FZcZ4qTRH0d5f/dAEsQ2NUUdDsp4FUvb+1he/iwZO
   QsEtgzbeovfkkJCP2Mt12twDIv3ICaQIJPPz/gNKOHaMV7JKOeRWyK2Z9
   xDyQzEzY8HIYV0xQsytqbEQu2Zz/Fg1Nf0X9CNs9o3kUhKqBaNFmJMM47
   GFocSXzqhSt4z9L2wufFuOp1bdzYyQ1YDOhDKZGdY+F8tDti+ASV2R1RO
   aVYboEF7v4biSCWB/pa4qPRcxLdlqBH8MHQjJp2Qbi5Qt/WC8CWPprFjt
   FsYVtzX/ld0YhzeFneQsI2FZhSKXktoD8E7p6nZt8bDoRhacak3WN2xh3
   A==;
X-CSE-ConnectionGUID: 5h9cagHYQNuJND4vKB4o9g==
X-CSE-MsgGUID: gJXd7Yb1RdGIxD/tUZULrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="810751"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="810751"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 14:28:31 -0700
X-CSE-ConnectionGUID: 3SDzTM8QREmMiXTBwYz0cQ==
X-CSE-MsgGUID: TFEZRECBT7SHyg8OUzuBuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="3058413"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 14:28:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 14:28:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 14:28:30 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 14:28:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoVuFlkZNzRpFSgtLY+1XKqT7kCirEh6uF05sW/xjF5YhTPR0M0y0BI8p2kw/muair6XmF+3srtt/7LZYVxNoHj979jKPCwhtLPnhPmzuZ4BxU86HqouvvZ4jKiiOFVJ5hJXwbONLvHMCQyiJnEYH589IgmE7bXGo3857nJcHYMNodVhR9SSX9r7iAC3xYaFnHIfpvARTcsWPifx8DM2uJha0NnQzvLuayTHqi98QJBCndUOucioZwFXSHC0wGaS4iTimgpHzSxUOYQSw6hdxst88PibX3oUG2J3uscvjxUd7x1pyktW9+eBK41Iab1/JorgbEqYhRI1TVVByQ+0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKrLp9RCjv5XhKy67aTHNylLkF6A0qeMXCLgr/xPVsc=;
 b=LSW1r68IgGlRCVcR/CeAzX4ZLFLwsy/huW11KnUuJXhEoilwFQ+Wo6DX9sdrrB+ui4DRcCIJ+I90/asKLEnZ3HxVAyQgIkzrnIE2GPjbJx3m1FPMzELqbCkg0E/Hh20SxqxKv3Vrywy2i/1ER6kOKQG4RmrZI259ys/1sg9H1OUm9cQ9IsnxQIPyjWyV79s6vSDWV7Vp9STnQAEbUi+zfzQe5VQRzABSlRz8dG78zLIJKJ1H0Z7QZZO4+8Wycswmw2trWQQv0b2tv37GJ5GJm0cZ8tmJ3ml66sjM0vkGp19vVGlPtGgU6rQd8gPSc6QK4LImsL5WwTN+cqNxJxMkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA4PR11MB8892.namprd11.prod.outlook.com (2603:10b6:208:55c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 21:28:23 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 21:28:21 +0000
Date: Fri, 18 Sep 2026 14:28:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 4/4] drm/xe: Bump prefetch BO LRU for already-valid ranges
Message-ID: <aq2s87pHUQarNmFa@gsse-cloud1.jf.intel.com>
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
 <20260916112828.2528881-10-himal.prasad.ghimiray@intel.com>
 <20260916113301.6B98D1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916113301.6B98D1F000FF@smtp.kernel.org>
X-ClientProxiedBy: SJ0PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::11) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA4PR11MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ccd688b-a839-496a-5e10-08df15cbc383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|18002099003|22082099003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: OoiXaiY3G7di5MHuShW2P3ZT4Td1Mr26lctIZfiK0H25rl8AqglwcwYzYBoJH5nGoGaL4dcs9O6cqYt+yRT5bULoJLCcAYkF3ywAVf86sIObDQjxu7c81jY5oF+ilKwq3MuVGLy+D1aw3fRtZknWNEuditT2ySOU4eQw1not6Ok4NJCi/wkMFzPL4lMQ0l8pmtceBaonEu7kVeERVSnsraf80iTPSMCm9q/GtquxGV/vWthvzlWq4AUbRVu2/hgiI63kM3it90Qr7pBrdnHAzbEDbJ/+7VK96J4f0lABBwMs4rX3bG+F2aNXgNvxQlLfhLIn4U+GOMVLFOM0NCuhtR/yC56dJILX1TsgYBsN8PHe8viyupBmiPnfaD0VuGFqPYA8sJNcLTX6s+BuxwxN2kaGlPviyDkjwpD3ZlT//zaWNNTWbbETem7fFB+vq97n8DPizt2gDu9oZhUJguXAHVGwW6r8F01xDj4/QirO90wyBsPk7fn2Vz0eTeGf9nElkwoWwdUeJQChkIrghrCQh4Icerq4aXjhIglbQyIc1R+liL2gHIteiS0w2y54bCTXGeKSVpfkFIvkn3VWzd8s1mOFkfPiHFN3oHdTb8ryGxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aiS3iAGeht9O194fmH3+fDUOyTS5RKOX+jncjGcsU3Xa5DvDZRc9RRMWQ9?=
 =?iso-8859-1?Q?mT8GBU5/PMdMpdSbA9n8xFsaqy5oIGnL1eitU0g8zYJliqVGXCFkMdOwuK?=
 =?iso-8859-1?Q?Gtoqrcw9U5JGRb5Aav+XPhhdAS8XKDHjAjsGgyAUA+2dB4YGdo47WxmbyY?=
 =?iso-8859-1?Q?TFd7RHAU2lhQXfOD65sl1rZNguBzqPRJ64WZZkqwITk5WN4Qfw8U39cKXh?=
 =?iso-8859-1?Q?wJRF23oZDm0E15IxHjg0yKv9QXkU54n2lbgCym1S7maPUHUNVQIdpjCabj?=
 =?iso-8859-1?Q?SJYB1tKmQ15GQeyVsopa0/ob67K0qC4vUukCTpX4jS7+tPNit9/JufAxu6?=
 =?iso-8859-1?Q?XNDkGld464sSEz72pgXvSPhUDMYnampqJ6YdPT18hnhrzYK3cS+8ZCFfxq?=
 =?iso-8859-1?Q?dJuLNzTY83f6SZYinhJCYTH0a9uat4WIQps8ET3uhNI4XdpkxuRjXIqY15?=
 =?iso-8859-1?Q?1iXLA9miIVo98qT6JBVXniwT+zTGhH2v7MoPlBKuI+kjRZ9XKgND+PSvee?=
 =?iso-8859-1?Q?0ZtBDb+sfTur/K3kXHUyRE2ffHDSeT7oeHVwY4o7P2ucdcnl1H33YY/nLA?=
 =?iso-8859-1?Q?NNIXUEhy9r6X8qpr0J25xAo6I6rb8h3xu4krqRDx28VUyy8hJDHl3DTr6h?=
 =?iso-8859-1?Q?1nmFPG4G3iMZQ6rkyabPWyyP+tYmph6CpzxwhnRFhaM1AuPnOP6M73sFrY?=
 =?iso-8859-1?Q?E/kXJoD0yTQjjH861McL5NyT0SLDaEvVYD3EaR/ynDvuLIOqZcitrrFOnO?=
 =?iso-8859-1?Q?FtQ0/d82Z85Ca5XtTtwh/0D/j8YHr13w1ayYT/BmptEbj3tNgw2r9Tn9p7?=
 =?iso-8859-1?Q?pX2ESBbvH17/amPcAzBYmYSHuN4vdj/GyU5cU55DggTrw/2rCvVpuylJlb?=
 =?iso-8859-1?Q?QI8+R6AD5oFBB0jHs4fMivnLsnjESyKQHI669aVKm1aRiUl3E6vtRgWQ0D?=
 =?iso-8859-1?Q?DWWjQpDvP4dJohGP1cfcjPeTY+esnIAP947zHc3Y3eUMB9M76tVl3CnV+0?=
 =?iso-8859-1?Q?MK36z/BgBBUOYhhJ7igGXDQBR5Ss3RIm+4PJDKdubdd3u3P6OwRuNM3znG?=
 =?iso-8859-1?Q?9kIAQJDMYtZxyVz0x/99JzN1gZA+Pk1ypJhcuwW4yN8p+50GA8iLF9ErLQ?=
 =?iso-8859-1?Q?uoPrI7RJ+ku7AQ0ZkgcjhC4vpZ/CznDtiD+MJ79/lRus0EvSmFZ5WEg613?=
 =?iso-8859-1?Q?lrStlbjbpi2ACQawU+zuZGAPWm5Vb6EoRqScNqEnpbAhpLmqFXyy/9L/2C?=
 =?iso-8859-1?Q?dptWZtZHX/YUIS/wB0aeFDH2pHfToqX89C94tAIskCiqBQ56Uv0HzJktqp?=
 =?iso-8859-1?Q?4qAvlT0RZWLRzi0QofbMccVMs2aVtYgT2k8ReKPohDQwsi9Sn+vz++pyQf?=
 =?iso-8859-1?Q?gtIDmstc6AfYvZbe0e3VSh2SQQVY0boHiu3vlmmaNBoVL0AroSKFw676VQ?=
 =?iso-8859-1?Q?aIUkb1+z4A7zLCak1zFICCaN7aWyUpm/KOzMYbMAKsbI39Lf1BFSRTYtby?=
 =?iso-8859-1?Q?lCxtomVD1g7iMNqhid/4UHXWJGKxzs8JPfMcvEFJgdWzfTG5Rib8GpUDsQ?=
 =?iso-8859-1?Q?cEOhqyn4rZ/J0rLk9QD5p/fgMmMnuxCk0xtQjNy1oH4CLMtNHcaZb6G4A5?=
 =?iso-8859-1?Q?ukJ+z8/D8wk/dDT8LmZKGB722A8/ctd4WvmbLf/W4poipGIycjH7Jb2BxW?=
 =?iso-8859-1?Q?VOWkjB0GjmmsVgwKc5IoEFN2YjgYVbMqjTJucndy3nNpNig2STlkKhSDd+?=
 =?iso-8859-1?Q?Ql9n1K1IXEhmwRwd0o8lBnDMYwKDF9FUfxVrTOVZst+rkwirZlPELeA5wX?=
 =?iso-8859-1?Q?PJM7aXfpQA=3D=3D?=
X-Exchange-RoutingPolicyChecked: l/o/03SGELW/+8gINQB9v8fC/RNp3DlAqxkNE3UGS2i3NhlF5eK5I/eyrm3flGSgoM6QpeLDkQLn9dZqrwIDiFfHHtN+2lfReciuk7tdyzEfPbuIR095r/GTG2ZXbyqCvk4Wag4SIz5SrJJXHus8/xx8MWDF+oN1ozWotP0BlbCg3yOmbrfgA18IzWaKQIcSchRi+tNO2j889UfotTAEqILJ7EWUrzLNqj4S9iC8m00zkI30QJKMyDHXqWACFrp2rrJPlTbK0Nmab6BMd+c/M+WAjv1uBJOytmfffS8huvI2qGwfYdLpAgSoIz2WhtQC9lR0D7Ot8udmwVamLGNEXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ccd688b-a839-496a-5e10-08df15cbc383
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 21:28:21.4071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RH85iNwNxASmMa2G4lcEz+BA1CwrHjGSI3H/4iXuS0Pitvl9boxs0otNLGxf1ypCY4RyAxbIkI2RirtuVroLjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8892
X-OriginatorOrg: intel.com

On Wed, Sep 16, 2026 at 11:33:01AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/xe: memory leak of svm_range on prefetch_lru_bump failure
> --
> 
> commit 09ec19c469b99c340c07a04780a85f997af72901
> Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> drm/xe: Bump prefetch BO LRU for already-valid ranges
> 
> This commit introduces xe_svm_range_prefetch_lru_bump to re-fault CPU pages
> without touching DMA mappings and move backing BOs to the LRU tail for
> already-valid prefetch ranges.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index fe9ccaa129122..948060a702470 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> 
> [ ... ]
> 
> > @@ -2583,6 +2583,15 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >  						  dpagemap, &valid_pages)) {
> >  				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
> >  				xe_assert(vm->xe, valid_pages);
> > +
> > +				if (dpagemap) {
> > +					err = xe_svm_range_prefetch_lru_bump(vm, vma,
> > +									     svm_range,

How about we just make xe_svm_range_prefetch_lru_bump non-failable? All
prefetching is fundamentally an eager optimization: we hope it succeeds,
but if it races, oh well, a fault will fix it. I think the LRU bump fits
that mindset as well.

Matt

> > +									     dpagemap);
> > +					if (err)
> > +						goto unwind_prefetch_ops;
> 
> [Severity: Medium]
> Does this code leak the svm_range?
> 
> During a VM_BIND ioctl with prefetch, xe_svm_range_find_or_insert() returns
> an svm_range with an incremented reference count. If 
> xe_svm_range_prefetch_lru_bump() fails here, we jump to unwind_prefetch_ops.
> 
> Because this error path is taken before the svm_range is tracked in the
> op->prefetch_range.range xarray, the cleanup routine
> xe_svm_prefetch_gpuva_ops_fini() will not know about it and will not free it.
> 
> Should this error path call xe_svm_range_put(svm_range) before jumping to
> unwind_prefetch_ops to avoid leaking the reference?
> 
> > +				}
> > +
> >  				need_put = true;
> >  				goto check_next_range;
> >  			}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260916112828.2528881-6-himal.prasad.ghimiray@intel.com?part=4
