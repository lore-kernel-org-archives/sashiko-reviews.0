Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB9344780F
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 20:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790367079; cv=fail; b=aWgNT/KQiUmOfWHIUJX+O1piFp+eI7k/v0DeB0eWLztlk/qgWdc6MtYUv9ITia0oFxqoUeAKpS2XbJdbzAbJ3/zAXT4i8NnfTSTvoUnv4GVnkE27M/w4rBVjLN4eBqNv61MhR/cbql0qpq9Zz2lg1VnyikyJOsemc6GHiUcj3vU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790367079; c=relaxed/simple;
	bh=X5Rc3bfI0EUNrD0icJUVGtouMvkjHzj0ZMuZ3eXRrUY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c8Cv8y742PLZeNrMT1uqEgcgP6NwINMFn4Buth/+jkvnape5osZaPAgoz2fs5vycq7stKXt3gV+pizgDqlt/ysi2fr1zDsxel0Msm6xEpA7sCW606HkZhOYC9G6djiRBudCtDIla5/eT541C/fmo9e4vDGXwpG8eIaRZtsPq0E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2/1RIru; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2/1RIru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790367068; x=1821903068;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=X5Rc3bfI0EUNrD0icJUVGtouMvkjHzj0ZMuZ3eXRrUY=;
  b=g2/1RIruWcOsmbP/MYyq7pD2bBMJTOHS6ApQSBeJronFyBvKc7lbsHh1
   oB2a438HoPt6tPbE+SC8/oWgA9p2egSvlAUfWQsajb+V6chB/DLIhWvBe
   G6k+u0iF/vbriCQugTDMDL+KOUJNgOp924rmn3PohAMMN7CYhxOA/MXiP
   qr0oBLOcSJ9D2zjmUJi7sDLq9wVAxVgFMFSLOMyKrrW8YtLrIERErebOE
   pn3fiGeZ16upH1yiRssa11T2bBfzaE72HlX9l4GAhl+IdDAC1yPKh8U+T
   59rHbJ1h4N5alP6UpllEwvlpF6Qj6GMvGyKFKyMBX3n7CjnsmPdfVT8q1
   A==;
X-CSE-ConnectionGUID: k8Jm1gGkTcaZ835TSRKE1w==
X-CSE-MsgGUID: JgFTYSJ3TjasXhEXtiHRFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90025140"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90025140"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 13:11:04 -0700
X-CSE-ConnectionGUID: aA+RukRHRC6+H2csYcY5IQ==
X-CSE-MsgGUID: DtXqRQStT7yV5/sadd6vDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="274577958"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 13:11:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 13:11:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 13:11:03 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 13:11:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goeeBhNVH8VTA0agl2C9JPt/ABNzkiCsIdBpAaUNwRsj1QqBrsmiKaClXbT0n0ZO5g2zAV1PY1mRkXU84CEMltKMvG2HtXTW9lKLXmh5HHoXn+A4kFc0HgL08fHtkrFlUmwqexrfZsHH/Y1qFJxJ+lnHKXdKycv9V5Lfts/OuYW8iMI3ul9uxV9TInPv8QPyRozoiSej7ZgQsqQxUZ2yYmUPWdYC3TDBbeu6VM30WtEB0qdfjLwpAohBXrAjkitYxY6ZzSmxVF6OfHfs4J0ig8Hf5sz3lcug6YkU9Wdos6fu+9NXeRXiC3kPk0w7LJQ8Av8LNt+YRnKX3kncR7wEZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S075ajV/TE3VyuiHCCAGjXhNZo/De8X+jcQZ9NKNO4w=;
 b=Y6UNhBf44+1FVl64bvEFKn7SLQ0GlHf1qCwsqtzVbESNKOnrFxs6zxHVCQoB9ChwJuCV2aVMbHL1hv5PcMehsVejDefz107uTM8PApezFYjuh1TZQ/THeGVdntTX1JjNpG5hvJBmW32XzEkX25YpFcfeT839LV6ICKLjSDQAAb9AEafSCuYmYpIi08Hxf8eEnvXYYw2SbxKdo3K7hhDBnVSdGF6v7sl5sQXYhEjgcgapORE1RK3oUXriCn3rDbBdi4cu4PUsp+SlmYiQiKdDXLeGaxClcMYF3KMk8K9TKYPcI7EIQ7PssF1uMfGf6hiTaWIzklGlkjPg8N/PbHMoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by PH7PR11MB7076.namprd11.prod.outlook.com (2603:10b6:510:20f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Fri, 25 Sep
 2026 20:10:59 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 20:10:59 +0000
Date: Fri, 25 Sep 2026 13:10:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 19/24] drm/xe: Add ULLS migration job support to
 migration layer
Message-ID: <arbVUbw/+1W1i4In@gsse-cloud1.jf.intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-20-matthew.brost@intel.com>
 <20260925063412.61D2D1F000FF@smtp.kernel.org>
 <arYf+PYr569yMhu+@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arYf+PYr569yMhu+@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:303:dc::10) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|PH7PR11MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be3bf09-70e5-411a-16e8-08df1b411d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|10067099003|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gf5xY3NXX7AZ/YP+k0Oc2Gg7OsPVWI7u7Rmz0Cb84dPF7/FXV1j4szSS+CNwYX9GqMdOCxcPiP6jPFONiASn8pvIpauF4VruZFfKgouvhK3BkOF4+/PNO5qHqJBFIW4Wf9UQJAjAPsVu9xxzyiUFEZrN6PI4IeOxgMpzsrGFfUja/jTC496b5fcnyU8RwWB06qn/kwgjbsVrBJ8MYFvgNwCu579NOZO+dl0mvceJZc10/7vd+k4cspwaWFQ3/tWm6Oo5p8kCRLpDK9jblMgkoeCn9tHc+wSwsbKiz8LuM7LdeIuLO+jyx2a/XHrEIIW7F7U4Sb1lB/9w2tlE0gw5FMJGNOsX6aLhxfU61pFrNRxhYXMg212x88dNGsSvrxk5hDvbU3vjBnO7jgPTItxp51PqOI52uUdQ6iv1XX9Pemp0UH/UUF7nl76SSYyXmL40zGPoI4nvGszaaR3clIhDGq+JlZQ4SbalQf/Mw4EZungA/kNvZq94//QlN6ImS2ndDFghWS0DculsKdCYABIgMcetaA9v82r30rCdFZzr04u7PL+65W8IIOZWPhDivUGp9lgUIJ2l5gkU1xYquipkUTnGG7QppFcBcoA6+jq9sCo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xuZRVXY5PWu9inD97ODjBGyKJaXOfPWD4SLSsZUEiCWpoGh3cCjQYbIRHj?=
 =?iso-8859-1?Q?6mLg4nySp0pGYh65hg5v4Ov9gP/fYaR7T6OKDYNogzCcYyReuQZ0pEQbvj?=
 =?iso-8859-1?Q?ZyzUPWgSQnbVrkzrD7+P5ngbGvxLYSM1iWitBLGprw0+KpCLU/VDzzVaTe?=
 =?iso-8859-1?Q?tTol+3fShhfyP3sGD8xfdlULV8M5CedbWKmAM0Dw7eLmdBc3765oi613K7?=
 =?iso-8859-1?Q?12moWHjc36ThQUmEaTHVhvO0AwK+fI1JvESpmUsJneyhFsO0Xd3QPDoQex?=
 =?iso-8859-1?Q?eLk78Oy/0Z1Md4PqVb4MbH9T0h67W4LT06uJ1OPdfCRRQAk78lSXC+/RYI?=
 =?iso-8859-1?Q?7sxn5b+seDC9Ru0J7UCuRXpgi9iQk283PkdKs9FFcuy9V5SFRiKIq8jbTH?=
 =?iso-8859-1?Q?Yfd5UOEUi2AdoMrP2TM6Eu4aCZe0Q6kFqlaBoUoLBB67j5KEYIefr3OWJZ?=
 =?iso-8859-1?Q?bA3goiI5v6vLeDD23J8siOGT2UCx6lvqLMTmgXdj4KvOnroUy20Oveh/UB?=
 =?iso-8859-1?Q?YApu9kK2lYg6gnLrAT8tFqz7kHKiJK4F1NpjGa0AVGRu0gFqvjHZdRJDxV?=
 =?iso-8859-1?Q?h3jp7M+ApHH+zlPin53R2/PpnEBy+olMwggubfq0drpMzrRTp7fJOjeGoz?=
 =?iso-8859-1?Q?EaQ2Fk2irmK8BmxLZc7ipr4aRZrkMtFoAg+6H/39LqXwxFHchY0mjScAF9?=
 =?iso-8859-1?Q?dxnu5Xg10rT23YAnynEbwanCUSi8Y3flQu2hjJo6TjvEPM0kRIzYfMQtU8?=
 =?iso-8859-1?Q?maiK7wiDFApW30Rsa86hewG+02YhUkxYEpZs6xzyNFXvpb9skAqVuzmMp6?=
 =?iso-8859-1?Q?f1NnQjgbwwg1SXhCYm8RInQ4veIPoMvVNMfmMZeuIKO6PYUOmYHlWkeBeM?=
 =?iso-8859-1?Q?CS9tA0ZGJIL6uWuEC0dH2WJXrzSCAiXUIuKajCFwx/K89twtp63MI8VdLv?=
 =?iso-8859-1?Q?mIzsUr0VrnPav4IfJ/FIouav3S1BEDRh8xo/Fs3T+R8WgaCXee2H0MO1vt?=
 =?iso-8859-1?Q?vAsx++iXaU2jpePhLZ0ao2uXPUXUXfaYDDudKMgtJWk/scHLzHjZdYCO7F?=
 =?iso-8859-1?Q?DBkmXv7Y+dAGOnsJyXeJ1xZIHxh5nUl//v5bflnyOWy/Lp6KijSVM77w/A?=
 =?iso-8859-1?Q?K0oBbE/UzRO0GeVga/Q50IZXTIAwye9yuqBMXHfPaTqDmSoSA41U4KS4XG?=
 =?iso-8859-1?Q?8OW0RZpEBT61CdLyGUxBYntMc3HbkLu9itvCIvjBMwQBAO+cOjm+QO9xSS?=
 =?iso-8859-1?Q?PRQZ7q0ySXTGTqkoktv0J6iSFzqu7cM8rBiLa6MCEtYSYnGa8aYYoP5Huh?=
 =?iso-8859-1?Q?PHVNgCvUwKNAfZp1ziyvylnXoIXxxiyPJtsxFftEIs1mfSY2yo9rY3kJHr?=
 =?iso-8859-1?Q?GgRcOWzW+bRkRAouVuYITYLkcZI7n0F8Rb2VHSTiIcPtUKw7CMeXU8DD02?=
 =?iso-8859-1?Q?InqEPGXEAKQejqx2bdwm1BtTIQMn84b9UNSSL4oXzRy44rWE3T1B6rny8+?=
 =?iso-8859-1?Q?xGNDGH6kiSrUukvC9+JnNivkcZB4NSJ90UDF9+j84FDQMzlhFPBkdOUKNa?=
 =?iso-8859-1?Q?OzqsVqMhzp5fuNDjMgj03IwUlgOtiDGLaw2fyPEfUercY0WfYOiU/rXJVg?=
 =?iso-8859-1?Q?mxUn9Jy+7n/xxUUvHFA/ZckqIRLXcgTHcq56gMAsl3W7KcM2wwsXTtdu4d?=
 =?iso-8859-1?Q?VfsEdomrs+vz/tSiuVSbRd4BU/ltjDcjNxT2OX1nOGvSTOHqpKiQJ4urpI?=
 =?iso-8859-1?Q?8eHcxUKu8soVLYWvs9mONeGDKFjI3fqZM/tliVZoJhXUQLkhLgTBq92V7t?=
 =?iso-8859-1?Q?PP8d+fQygA0A/jkiL+y7WbLw5mR9ZYI=3D?=
X-Exchange-RoutingPolicyChecked: TFXLlGCM5fctqQpEVp5izj2+OZAbkhAp8Kx8st0w8pyusxlEHWLW3pSKJFTKoSYNo/0A2+qkkaqdnvxNdpy7jzfgNp47kd5qlcZHYr0DdOZHeNl7ZSfRMRISCYE40PMwEpQkE2QZnBBzHgsGTsDTmm1p62aPWwPxL4yW4lHrqmDYakRl20PxuVMdDrvTx5XZQJQcqxpRL8iSCylFw62yQT4zQ3NE2NCEpWPxa8qFcz7Q8QJR+0qCq0o8qEVpUJ0rxGQD6xzFXohzB9ReNNWkLx67FIGow8zAqq2MnUXIjLh4QQyGq1yVkbR5NietVx72+EM6T9fq1UFn9GeTFHPrxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be3bf09-70e5-411a-16e8-08df1b411d4f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 20:10:59.0376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhOgzlB61qerITxZi0DK0rZQWRHVNS+Ezz9eUwWHTHgmcYQI5odG3SBITL4NELqXW3AWSQ78uYUdK3dtjWEvlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7076
X-OriginatorOrg: intel.com

On Fri, Sep 25, 2026 at 12:17:12AM -0700, Matthew Brost wrote:
> On Fri, Sep 25, 2026 at 06:34:11AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] drm/xe: Missing ULLS_EXIT in teardown leaves hardware parked on freed memory
> > --
> > 
> > commit 81f7dc64bc0d604133ac8c3a1f3ec0fd0a9dd8a1
> > Author: Matthew Brost <matthew.brost@intel.com>
> > 
> > drm/xe: Add ULLS migration job support to migration layer
> > 
> > Add function to enter ULLS mode for migration job and delayed worker to
> > exit (power saving). ULLS mode expected to entered upon page fault or
> > SVM prefetch. ULLS mode exit delay is currently set to 5ms.
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 471ae5741836e..d7d13a25cdb91 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > [ ... ]
> > > @@ -95,9 +105,30 @@ struct xe_migrate {
> > >   */
> > >  #define MAX_PTE_PER_SDI 0x1FEU
> > >  
> > > +static bool xe_migrate_ulls_enabled(struct xe_migrate *m)
> > > +{
> > > +	lockdep_assert_held(&m->job_mutex);
> > > +	return m->ulls.enabled;
> > > +}
> > > +
> > > +static void xe_migrate_ulls_toggle_enable(struct xe_migrate *m, bool enabled)
> > > +{
> > > +	lockdep_assert_held(&m->job_mutex);
> > > +	m->ulls.enabled = enabled;
> > > +}
> > > +
> > >  static void xe_migrate_fini(void *arg)
> > >  {
> > >  	struct xe_migrate *m = arg;
> > > +	struct xe_device *xe = tile_to_xe(m->tile);
> > > +
> > > +	disable_delayed_work_sync(&m->ulls.exit_work);
> > > +	scoped_guard(mutex, &m->job_mutex) {
> > > +		if (xe_migrate_ulls_enabled(m)) {
> > > +			xe_pm_runtime_put(xe);
> > > +			xe_migrate_ulls_toggle_enable(m, false);
> > 
> > [Severity: High]
> > Does this missing ULLS_EXIT in the teardown sequence leave the hardware
> > parked on freed memory?
> > 
> > During driver unbind or probe failure in xe_migrate_fini(), if ULLS mode is
> > currently active (for example, within 5ms of a recent migration job), the
> > reserved hardware engine is actively spinning in a MI_SEMAPHORE_WAIT loop.
> > 
> > This teardown path cancels exit_work and clears the ULLS enabled flag, but
> > fails to push the ULLS_EXIT job or explicitly kill the queue. It then
> > proceeds to call xe_exec_queue_put() and free the page tables. Because
> > xe_exec_queue_kill() is never called, GuC is never instructed to preempt
> > and deregister the context.
> > 
> > Can this regression leave the hardware engine actively executing from the
> > ring buffer memory while the host frees it, potentially leading to IOMMU CAT
> > faults, GPU hangs, or host memory corruption?
> > 
> 
> Hmm, we probably should kill the queue or submit a exit job. Let me fix
> this.

On 2nd thought this is actually fine. We put the exec below which
triggers cleanup of the queue. If GuC firmware is running we disable
scheduling and teardown the queue, if the GuC firmware is taken offline
we skip that step, so this this actually all fine. We just need to
cleanup extra runtime PM which this code does.

Matt 

> 
> Matt
> 
> > > +		}
> > > +	}
> > >  
> > >  	xe_vm_lock(m->q->vm, false);
> > >  	xe_bo_unpin(m->pt_bo);
> > 
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260925045320.1325860-1-matthew.brost@intel.com?part=19
