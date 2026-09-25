Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749F11DDC38
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 07:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790320640; cv=fail; b=AMstrEk3GyuZCjqBdN1szBzPUprRceRgYM6aQwkJOA8s5mZWrPyUQmuKQQURnrKq9vwnzZWHrzNE0UJ6JF7iHOCq80TLc/DlGID5vcChIciwtwY9SkKa47IJ1qgqkNQ6mLzwCnPMG7zcIwtRuhCPryXsX2n1IhNqvLcQxtNROUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790320640; c=relaxed/simple;
	bh=SP0XNolMUnFXg2ZknT9BxFI5wzWfJAnIGulEUW67vFk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SD7NsJJD/7HdgsnYm3Gh13CuVg1/XzqQs0Ha9bYfUQWDDf+JJUKzaEAoZpNaOh6UyIkWNgZHL8nfIVICnjDHKHGUCimnagSJq+vDfolHeiJWCBZO8lBuPPHNKTGS0hvO6SeFMObOCISMV2CW4J9ZsHWoUSi7o7vaCPP9o8fi84k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wl0z6elc; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wl0z6elc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790320639; x=1821856639;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SP0XNolMUnFXg2ZknT9BxFI5wzWfJAnIGulEUW67vFk=;
  b=Wl0z6elcVcmSyVtt1T+1gOXJmO817T/FWYEgd9DtJuVAZuKIdvNaGV3m
   m5s1VzkYryRu/vXZF15vVhfnWtIxQyr1rdvSAB6lsR0y5dBSHrRwWTP8j
   +1fqJaivglSakk3t/LIzsWAxQUaKQzPzj2XA/mnAJyadEYLNqOs1kbA7X
   Xx/nvrym5Arblw9PuvitXN1jKknLzdxLY85EF9ilhAI6C9sc2qeby9VP/
   3YjNqDKsIoccvQoR1E8aOQN1mkDizBri7kKLypB5+/Ucc6T+w21JfG/lj
   MeaIf5BCfBkOKnskgCw+hXi1vQ+xJCeUcuFVHF+lCsxDknDoRx/vL60Y9
   w==;
X-CSE-ConnectionGUID: Bw6NsMp8RV+cenCOv6Cepg==
X-CSE-MsgGUID: MYCoN6gPTtGvIddP0mbJCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93822572"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="93822572"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 00:17:18 -0700
X-CSE-ConnectionGUID: Wns0MiZ+RsCOn0QlsJ6ycQ==
X-CSE-MsgGUID: efgATj1wTYCl4PyQZEUo7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="303768807"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 00:17:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 00:17:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 00:17:17 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 00:17:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIncnKaFyUcwgpYn3kyXz4twZFwjPutbZgmGCLeU1ndKR3Uv+rZTmB50pJSkawK5Tlj19u0U+nkwhKEMGrUYQhISvv9H9OFX4v06mp+RWoOM/LmgOn7IUP3LbGcMoxIsfY7iqrguM26W8sal1Ng3w9FGTwBN+Eqk+FO1DksbnW/7hnX7Z3LW6Ds3A7dnes4rN4+Fd8MoDmIPpsie/WLsNA1+xFc3SZ2cHrMENVZnZbfuhzu+/tX+d7ZHH1aMcoyJWirJl6Q3UZLYyfuBGWJT/Q1Ff8tkXXDkM8dy6M1HE9UlyOjFGQttnUfirczPMz7rqlyK3RLver/rjwxc+LWtsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dJKbvbBCsHGf5SSMCaEQHDmW3oFQJHTe0Wqinb+M+4=;
 b=kBMcuAV1Lds7G7a33vXRmHRhEOvk9BQNdhD/ZVS/e6JgeAK5LZiUWyAK5CMk6tfYxLVqHHWooalO1NQM9ZVoHSB4ep61wAlqjzd9mtzdfTCo0WTx5hAGtTiDpo42313QYi3gvZEVBI5c1hKwERl3F69oWi6+pRCyfG5k0OZc90Ech1UVPOsyPc8zMzfoOY8JBEYlWheXLTGVQUGY7Mxu5tVmvzbcpEyTNDZHZPDswV28VRY/BE4l2OdtqLnpbNzFThQMRVOQA+k4CFRoi0P3o32YHpMJwWot6EJE/YOc33AxtWPf/FGetlcMtlmpCZOZfbv/eEctvTXLZ9RXt6SC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by MW4PR11MB6888.namprd11.prod.outlook.com (2603:10b6:303:22d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Fri, 25 Sep
 2026 07:17:14 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 07:17:14 +0000
Date: Fri, 25 Sep 2026 00:17:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 19/24] drm/xe: Add ULLS migration job support to
 migration layer
Message-ID: <arYf+PYr569yMhu+@gsse-cloud1.jf.intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-20-matthew.brost@intel.com>
 <20260925063412.61D2D1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925063412.61D2D1F000FF@smtp.kernel.org>
X-ClientProxiedBy: SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::24) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|MW4PR11MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 4082d1d1-67bf-4dd3-d052-08df1ad50620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WW94R035ZmdQzD3Y4/CsAAPtwSUrNMr2kx0PegbVN6EbayGR43UzC3Wg9hKiztXzA4ZY7Bn9xef2c5w6NwC1ZHaFu/+HzLD/HChQrnBp3NaSkOtFmfutgzrcLQAuCJ+uXGloHyXbERPT2SH6Z6qBp/nKIXZNXa5UkLcMvAFv+B0a91537LKakRAWMGB5KfJLbKfMAeQwPJszuh2fq6ovRlO4a3iwERB3BWzouGNOD5V1o0i+aQMvVm2+iZ998TUK/D+FG41LE3951+AHlVI4TyT3oi7QD9wVukVo3sUMpZYEk0Atha5aYS6CNLuwnW2apMuR95dJFfmm+m4sOkza9gPTP+m2pNhc/yXNvN1mTCvcGZ8JeiPMk9TXo9mHVozsyDOmFNhJLfuHRwUn94yOf5nu7RgXaLZxv0XFKUZF6XcRXmx0cR73U8+ax3sTmJ3mXEXuyAN+ACJBvtU+KS+35Qb7LLBDiNuiew4rbotZ7iaVYEsBUT5XwY7VuvoTCAgWox5w52Fsk2kwqdfHj5iUafhJulZPGWXH7ax4MhfCcbFPlEtW1IzUjF8Db0wpNBwZ6dBU7iL5N3XEA3CRz/mtTg4q23wYGvJootDtEzJlIno=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PmETnkf4Wae3b7pwAU01jz1UyQ17V7e4oTUWFbNiLEvCZgPtG4sNM84Xp3?=
 =?iso-8859-1?Q?G3vIn0gj/OKQ3+fy1gna2guOeHEDyKBGltkc6IMuyijUqhvnO5R53Qsdrt?=
 =?iso-8859-1?Q?nB8hpDyPJDTvMoKwjSq1TV0c3w4yfI+ykNraWIzvgb0t35kyxGYxzvYnwK?=
 =?iso-8859-1?Q?vLOQOiPf5svY/NMHF0dK1YxzsGplviOilgUo8Uhe9o5z2kp+6UTuvAdk0u?=
 =?iso-8859-1?Q?HeF2+gU5Xp2ZdYkulefN7CqF3wYxyLojzraigGA8JYiv/n9B4d4xYV3Itz?=
 =?iso-8859-1?Q?wTg+fmc+ZXu5kIofLdbyfWrXQK6EOha38PYTXLPLMyLIRuVzpFN8KFxNYo?=
 =?iso-8859-1?Q?GoDt4q8sT+Z+b8q4CMUlmt/M+eVlzrCZz8o/EeIQkWXcfLJn36Fx8OjEF5?=
 =?iso-8859-1?Q?leeKJ6laiKtv5D2w5XQhQ0PBfmeugm3bv94hYdF74ApX20xRWjjrxKxgAC?=
 =?iso-8859-1?Q?LFScjWXImNcA18+FNdStPRImYpnr1USlzT8gJw5NdZC4ZuJ7juBTHngf6L?=
 =?iso-8859-1?Q?tga1wFsudxN7pQSH47LM+VgOQc0ZcNU/C+3gXCGoPXQqgfGYowXpdfVewu?=
 =?iso-8859-1?Q?uD3TaY4R+J75f0iZmv7Rj8gpEzyr4zXygbwk+SpSGSrEamVQpPbeeMXmGv?=
 =?iso-8859-1?Q?afEPo6BoJLqyc0sjbm+DknXp4o2H962f1PBMe3z8qolp50SF28LC9yAmFR?=
 =?iso-8859-1?Q?vNrbzI0vBPOKiEU6ruIMtShXv1tmmI4PdzNADsDfifvgMjI4xUS4yCBiOO?=
 =?iso-8859-1?Q?hkCn9ciGHDLKw2+OL7y1cLjJjX5dyBgYFSvaiwl22QaPlZ7a269E8hzU+D?=
 =?iso-8859-1?Q?h8GTJKugVOAwGtf8ayrKIXFBSIo5z67AWQPW2MZgJUofRMqcA+sm5/0zOJ?=
 =?iso-8859-1?Q?Fs4FsIbYPppQq6nRngeQ3PvBqFDLU0s1TCtE6UsNBKSq90VG9ElPx41Emg?=
 =?iso-8859-1?Q?sk5+QhIrlfuleHhCTFvqJrR07noMuJxKw51rFJ4ZHfANLbCC+UOakoV8rX?=
 =?iso-8859-1?Q?sn/ak5k0jgjqFoHQNq08ND2SSDUStLyGyvOk0S7XQowU1iJoje9kOToHtn?=
 =?iso-8859-1?Q?+prE8WTqIk60DdwtxJ2Tw+ckaH/roh8J/gPz2X0vFL6CJjz74tkWVfyPPn?=
 =?iso-8859-1?Q?RxjfFDcu1ecdLhKxB/OOS22EEzbXUnuT7OxLj9hQVp/MZRhkEYVgnCP6oi?=
 =?iso-8859-1?Q?LA58I+ei2DOHO/1J3in832HhF9qsZRDERDUrLcBBJwYvyHdp0Fj0rFJZLY?=
 =?iso-8859-1?Q?AcF+KZstjGwx+z7j8QBc5otwHRlnxg+qkNPXf4yAGmJvwBvYTcQefRQHpU?=
 =?iso-8859-1?Q?2hEerUyTwvX3fqrsj2iar9/bjHtgRq/1wzV0uPQrpNBjhiX+rW501diaDO?=
 =?iso-8859-1?Q?eRwzHEJg0hFsqu3xUzxlYjIl2Kt8aNKFnGIT7JYXs56JVbKUW005jbliuJ?=
 =?iso-8859-1?Q?X3pUOrti2vvnsH+U0XqJXYvVn6SbdyL647hCKaYonp8dWHRckCmbZzfMzx?=
 =?iso-8859-1?Q?cTE7hIso2dHgHQ0anlgmqS7NARLo1eiGIvz895+D1cXLZJ5OKJVI98LnWu?=
 =?iso-8859-1?Q?CvleJ94WU7EgNjkg8tPd6wQGafNUPzveLGKW6aPgVGIJAtw4J6KBTGe6UL?=
 =?iso-8859-1?Q?/V95lR3REujH78ahbvpv9adkR7QihsSSQ+p2MOgNFziFImwGrZAPNO23+y?=
 =?iso-8859-1?Q?+l5oKx1mQcAKDnrFo996/JJroUSpzujmTe4dB8FBGa4BBCHVWwuGnBzCDU?=
 =?iso-8859-1?Q?Fz8NNjdlyykxdWtfMxhlk2F1+StpxlYeDJ9SLTSHBDv5Siq7ESlE8BS514?=
 =?iso-8859-1?Q?IHkXPcVH+XLEfFHzOtmoj7p1/0kLAYU=3D?=
X-Exchange-RoutingPolicyChecked: jBYLoXGyAcjLToETEBDYXgjf26iub5eRhJXP7BVw94TqPfxWemokyAV7aDvmoiXFsrPdt3ASF+xD/uoN2GlnOAmKmRRITJFPln6e0gDXm0BbVs/5BzDX0hbJD3oQ90m74Z5Ypor3emXWk1dZjQ5pf2a/7YfS3CZ4o4xuerNsghKaphDXWCmIrX59nMh5n2ZTzC7yiSOxHTIA9dIKwVTfJj0M3/a55p5rrbWLxaJNubSdCsZ6r14HHLV7Pgz3mbCAqZfREB0Fd0wCENylUq/UZOlYpA8uGAb9bPh+FnWTeAW9833iM4ndI4XnN5kzwi37JD0DG1P4WmxQhn+oiyo0/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4082d1d1-67bf-4dd3-d052-08df1ad50620
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 07:17:14.4578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDyiJn2TYVaGNuCXo7w+krfVsehIWINh40mvPWEbKAhP7zQOJmKkWERvNsZ9fum7J1GjoHCCgxHUJ+ynw8zfUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6888
X-OriginatorOrg: intel.com

On Fri, Sep 25, 2026 at 06:34:11AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/xe: Missing ULLS_EXIT in teardown leaves hardware parked on freed memory
> --
> 
> commit 81f7dc64bc0d604133ac8c3a1f3ec0fd0a9dd8a1
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Add ULLS migration job support to migration layer
> 
> Add function to enter ULLS mode for migration job and delayed worker to
> exit (power saving). ULLS mode expected to entered upon page fault or
> SVM prefetch. ULLS mode exit delay is currently set to 5ms.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 471ae5741836e..d7d13a25cdb91 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> [ ... ]
> > @@ -95,9 +105,30 @@ struct xe_migrate {
> >   */
> >  #define MAX_PTE_PER_SDI 0x1FEU
> >  
> > +static bool xe_migrate_ulls_enabled(struct xe_migrate *m)
> > +{
> > +	lockdep_assert_held(&m->job_mutex);
> > +	return m->ulls.enabled;
> > +}
> > +
> > +static void xe_migrate_ulls_toggle_enable(struct xe_migrate *m, bool enabled)
> > +{
> > +	lockdep_assert_held(&m->job_mutex);
> > +	m->ulls.enabled = enabled;
> > +}
> > +
> >  static void xe_migrate_fini(void *arg)
> >  {
> >  	struct xe_migrate *m = arg;
> > +	struct xe_device *xe = tile_to_xe(m->tile);
> > +
> > +	disable_delayed_work_sync(&m->ulls.exit_work);
> > +	scoped_guard(mutex, &m->job_mutex) {
> > +		if (xe_migrate_ulls_enabled(m)) {
> > +			xe_pm_runtime_put(xe);
> > +			xe_migrate_ulls_toggle_enable(m, false);
> 
> [Severity: High]
> Does this missing ULLS_EXIT in the teardown sequence leave the hardware
> parked on freed memory?
> 
> During driver unbind or probe failure in xe_migrate_fini(), if ULLS mode is
> currently active (for example, within 5ms of a recent migration job), the
> reserved hardware engine is actively spinning in a MI_SEMAPHORE_WAIT loop.
> 
> This teardown path cancels exit_work and clears the ULLS enabled flag, but
> fails to push the ULLS_EXIT job or explicitly kill the queue. It then
> proceeds to call xe_exec_queue_put() and free the page tables. Because
> xe_exec_queue_kill() is never called, GuC is never instructed to preempt
> and deregister the context.
> 
> Can this regression leave the hardware engine actively executing from the
> ring buffer memory while the host frees it, potentially leading to IOMMU CAT
> faults, GPU hangs, or host memory corruption?
> 

Hmm, we probably should kill the queue or submit a exit job. Let me fix
this.

Matt

> > +		}
> > +	}
> >  
> >  	xe_vm_lock(m->q->vm, false);
> >  	xe_bo_unpin(m->pt_bo);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260925045320.1325860-1-matthew.brost@intel.com?part=19
