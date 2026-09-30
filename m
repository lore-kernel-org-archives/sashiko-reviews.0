Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F331432E65
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 06:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751303; cv=fail; b=DDNUdW+9nwqNukooQzcVY7e1dUmkj3LylxqgDxk57mAQsHL8/i2TcXb5JvIo+GGBE9R1rEDCTQlQY5WcJ7/bWQmoSdLwn5Rssc67WHfgfh0KW1pLjS6tTI3Koi/1eMmjql6MfeRAPUNsHDmWguJBOlArD6tyWvgBOBQoD2JKYwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751303; c=relaxed/simple;
	bh=kVjil3wU86oBa35c2s5G/P1r2qxtfiRL61f5KNHLF3M=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bcqeaaFg7xLburDV8G1W+P9wcqvEs4DNejjg/pZPv0VQuYEeT51n/0UV+nM5Ib0WxgvqKaMqNcYwXOa2QtQGDq3sl+bKDTnYcDt63DTLjCNMD4JC1ItizMAgFNeccZ4vB71i33fin/n0+O4bQqfA2Ppd/OfQf097MtwHRcRJNOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGgCqpA/; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGgCqpA/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790751294; x=1822287294;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=kVjil3wU86oBa35c2s5G/P1r2qxtfiRL61f5KNHLF3M=;
  b=iGgCqpA/vU+tQhfSwJBpGvMO3kCHvmPdTZ9ZlZyXoOV1a9vrZLpZSEAV
   FsWAU5asH9m9t3SD5VUrDCIZxqY2Q7qLb9gQLu3bYqCvR2v51MaSnhhgP
   CLNyh25DgOPDe3APwmXQqCFORo15FQzdBaGrCDNdDe9xu9uAYQOiA8aLH
   zkXhrt9UKCzS/tUXdhCPJbqnr9ftUfAIc3j+Og8p01CYAKpRrZUd6figz
   3AOZlivDgS4eoVo+LNfKtrKJKGS3Fa+oW6hChX/crZP/Mg28VDk4cmgch
   zRa1uDE6rRpFJ9uYhqxZZB9NZ+wIiG8H82JsTFNTYqNgUEjckBNiRZgNo
   g==;
X-CSE-ConnectionGUID: nckw+aX0TT67dUM9Qo1K9w==
X-CSE-MsgGUID: b37GqD0pRQmGWlKszmUMzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90246337"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90246337"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 23:54:39 -0700
X-CSE-ConnectionGUID: UnQuzdQDTcuqzXSz5pxUJQ==
X-CSE-MsgGUID: w8sGXh9tTEmUOGkiai78tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="278949635"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 23:54:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 29 Sep 2026 23:54:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 23:54:37 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 23:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7hcAXrxTvJGR8dvlgs3F1hhDJX3RJFG1YuoRVWCmQ+vHehbNN8o6jYEdk4rLjmHokYp+OBi7aQreuSF3TrzQoCi9LxpmKtpbLWsBIo2uyPF3Nvq3kH+esM/UIkqZdD8D6XWIMy5myDnXzgq0wOb0nPl9DOcC64iWUlndRxPXzx7KSkyFJQTS6IrL8rrpKR1kgb4syA1GAyhrp7rSpVw047YT85+Xf25ptj9fyGlPcFBECJrGz9au0aOrsTsM5HECYYMm/kJZshw88n3WITwjguT8PONhvpx/QXSXnWcCE5aGjt1qL0TBcivCAO3ZMNnpckOF2XSUX76M3azrG7vvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxop2U/cAsogyjaoh5DHFboj3cLxyEPQ1F1wCRgD7Ww=;
 b=s9+PUzwPsoZ/Emt3q1Pf1pDHgug7OQpsEucBVCzXWHa5rC4VE0Mh31XTcsNXeLKZ3G+xJ+Rgawfzl5hTLy0EPuO0lMzroV13UsbPMuF+kX7KF0Ql9303hACHjnjcMIqjN7hS9JYg+mgX9wTM6A4a6lVZrnXARv/8Y2fibPTcs6VFG9clifussk+T0rU/TIXsT6nXE1IDITL/bEh12pnOh9j4SMvCJ4byCznAknqHsNIbX3k7Kvjv9UHO6o00o6Iif2IZ7ZCh2HYDBJQ6q94j41NCoYcb1j9MzBAj+eyD1HpiObwNXGb7gQRSf6fYDa8dSfbgxe/h7QYyLTQmpt8S0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by BY1PR11MB8053.namprd11.prod.outlook.com (2603:10b6:a03:525::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 06:54:35 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 06:54:34 +0000
Date: Tue, 29 Sep 2026 23:54:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
CC: <sashiko-reviews@lists.linux.dev>, <media-ci@linuxtv.org>,
	<dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 01/13] dma-buf: introduce initial file I/O
 infrastructure
Message-ID: <aryyKMFpgK9JYQr0@gsse-cloud1.jf.intel.com>
References: <cover.1789997898.git.asml.silence@gmail.com>
 <5490ee42c4452fd4198b245ead20fcf7438c066e.1789997898.git.asml.silence@gmail.com>
 <20260921135344.035B81F000FF@smtp.kernel.org>
 <17884261-52ab-484e-a39a-01e67f7a1d2e@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <17884261-52ab-484e-a39a-01e67f7a1d2e@gmail.com>
X-ClientProxiedBy: SJ2P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::7) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|BY1PR11MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: c990f216-6655-4f64-45c7-08df1ebfafde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: tIuk0+tsikxP/iqtSulD/GEuBRaMt6MdtGMbd0KEtkgBHIEt0oNTZWT/ELcygcRRbJ48d6K6TZ7wvTRaTAgpEHQfloxwBQ8trhEbtXbQ+kN8uZMNWJdLwDz69V+r3Pp6HjltWKWeDTJkk53Nk3TRzBi2mVCepr9Ou9jhEOSNlxXdrZGZ4HqAhHspk47kl29tKAre6KRAiAyccVVXy3AScH+d+tANkv+UzKTFc6XpI3Nm2zpRewuwWsYPqZzph/7/rXoA3xcB/aSMXF9ebNpJkpMomUz585Af4mhyC4+n1HhToU/HIH0AIlRkrjcWglnBzyexG9XRCJLo8I+xwdTAB5HzXSnUTyHhbUfn44m626dpDLZ8D9/OI63bZki8OUhOs6wEnKWHn5FOMki2Z+U+igaMLbJwpQwjsgpvTk9J/R8x8TdXboVIqWvsFZPn6PzxgspmCNadg0AYDYtHWSpZZM9248dxqP+wgsgEMozykjcJ0FD4DnBHd0jLr+F7toYoLQzamjzhGT1S5co8SlfYVrOkBou/fVoQ2CCTtbnZPtf8Xj4gFtWwh7ufo0Y1gOt7GKjwnntuANue/gdoDfhgffv9uRnNq33kwZA8YVCIeEFmDdqbvkl4Obqqw7VYFkvTFEmeymMXZiFz0xkXwIeyBTtakDv/hx5cTdV+Vt2VDms=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o3ylus2cfN2E9ylnzVjLGYbZOXAEoy/pPDYibP76duSlwM3wjvCjyIPsLfSz?=
 =?us-ascii?Q?pxP55+9HD09oR1cd8/4w7jgFa0F2P20l0KTzxgozxm+UhcsPIXmsfS3CAFJ6?=
 =?us-ascii?Q?Vq3077BmsyUhbrMaiVtrFFxyyV+aQjl8gxquHnC5ugtSf6pYBOVV0C6Qw5FV?=
 =?us-ascii?Q?S1R20PDGUnuEI2O7ETtVjI4hOo/EyIvPEc2B4Lr6MCYJ5krMyvXbDkZCfc1C?=
 =?us-ascii?Q?MLxIunYGwUoBd5DoMSctN5sv7sR0yWmKfIyemBiYWckNiL2CZVT+ekEmJcUz?=
 =?us-ascii?Q?ll0guhN2y2FIQXKim04GSwEajYedzLV/HuhbRfFzzKGdrprXMTybMbfRIIQv?=
 =?us-ascii?Q?j5IumcioB7FD35oeAp+3bsoRdy6ih1UIOQVsGFXqVHoX8Q7yzDoScuqDDTzM?=
 =?us-ascii?Q?z7fJ7+opXfMeQJziBfAbbAl6k0vX57jEPSCVyLcBT9F9ST+vEMCJ7+UxYB31?=
 =?us-ascii?Q?LKzqn5tVfSrAdI4ct9JnceBL4BoVj7Y1pDQ3lo0ZoshVFUi2hTfCtoBVuH7R?=
 =?us-ascii?Q?F8qd4I8Zhd7/lIFEwkFAguGmoBgbYbWfR1ZqDmOfRbjhLLNv5fglOD6FDLxz?=
 =?us-ascii?Q?MgJKUUjDVhNfiPBJ3rToZCSdLKubgRuifHzonKS947ZRqXDet/XO7D1iGlw/?=
 =?us-ascii?Q?uSbFovimTYijeDROxpvNBqzYom7NRXkqnHQrgeT6zpiq6mfHS335eZZSsc1H?=
 =?us-ascii?Q?p4KVgjrLtLRgW0R9mk1eVSflSSq3qHof0jDuzDZjnnjh/BsVlmjcrtdrTg4p?=
 =?us-ascii?Q?PszXNUVW/6i+SZnSqSidCTx/0+clKYxmVCHSJ+TtOQ6Hx/a/O91izqi32DlU?=
 =?us-ascii?Q?WIkA33CbSjYR1I1BVtMpoBRuX0iWg26BuNYIOPf7Z9J9+MA3OYpSopWSM+c0?=
 =?us-ascii?Q?GPGc0rSK45PNwqVbIuMqJ3mBit46N0K23M+/+fNaPW8m0RMHa4joU2y9uZx4?=
 =?us-ascii?Q?rJ1Sj8dRWsaGKmXrhh1GIGzg4R1lN6VJMratI+CzAFQzoabwq6amcQQDiR3N?=
 =?us-ascii?Q?XTDbdJs8PHz9uUCeZf7Br9aqZiqvavGRufSBUVl4l49eog6500oNu8Dv73HE?=
 =?us-ascii?Q?wBGBhwCJoM/F3cVc8F59rOt/MoLP1af9MLZ2ZdOmROjEqNiiEoSdpuOOz4lj?=
 =?us-ascii?Q?0nntbgeKiPXFVtySLw0o3O1hKWUMG5yrLggCtwVPgGRu7Xz78Zuw3WcxbpMr?=
 =?us-ascii?Q?la6S6enXrgMzxNc6niHaSp+om1xHsoHyokfqwXRsnp/zJVjOHj4lxZqdQ/Xw?=
 =?us-ascii?Q?deHawWO3dQPMjq6/0PRXVMTTgGuGCcJVtUgYAyPMLnqDuLSURyA8G0iK3p+b?=
 =?us-ascii?Q?rITvE4pcAfxFoWbPANh01klm90WqhnSHMz/zsL4zLbFz6JuVaIXN+CmglBnq?=
 =?us-ascii?Q?aQTEVWRDx3vwZxfGfGRbxK7OW8mD/ea05YXgUUGYd7TF47YTtEV+l+PhGKm3?=
 =?us-ascii?Q?4H+lwUkyU9I5HOO5Aga3jOij/Sfr5UCPLYh1PHRulEVuPepR0lby6JirOsTJ?=
 =?us-ascii?Q?h6B9HuO/FVq/yI+EUyBj7l7xpYT5D/3ehqpyv3fsRLeUZEhb0kresEjII31B?=
 =?us-ascii?Q?smit28woxOxKznjT+x7E/iIWpbbd657jPB0n/vL3qgkmC7BeyV2atkO2smdS?=
 =?us-ascii?Q?Z8wPtrdhmyMDc/0UMJLc3FB+h0wO7EDUMRRyhuBRW7luPx3jjj+mBwH6QKwE?=
 =?us-ascii?Q?UbrMhxQirSCOEySmZHIwTVTd1uXW6q9idq6Xl0WIWPOBWUGm0NEKcfm/f0dS?=
 =?us-ascii?Q?zCZN0cvYIBWZYdhrjPY6SGto25fpAdw=3D?=
X-Exchange-RoutingPolicyChecked: N4aqt11mMZ6RENkt5tubx7XWJDFXvW4yCBfUhuFlVh6x41MPUeszR/SCAPaQc5CISZ2pX9eEBvZZ0sLSkT4XP/RO0BNnjVGHSygdWiuDc+hxkDRoa+d1y0wpPnPtdTvkfnsdQRkeebZ7rOAAiaf5v+8oP2a2R3eiw+RzpEQx5rITFivvjAqRT+UhblXXruYJG9HrddovVkXsVRuZlc8wIbCaLVTj7X+Olb+EjfnFbzx9zvA7qZyYKE8y9KYC9p195M07CqhQ6Yy8r+5gqXAmdXCmu6GT79eaiPmEa4kj7nbBGW/bDY9f6DMOVXl7NVUYrRxOgXa9xMEMPHmXHLdbTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c990f216-6655-4f64-45c7-08df1ebfafde
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 06:54:34.9550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vT233ozQwcI9OIzc/qiL1CuPudSBS+/0KqeU0KlXlcDsBmtoJbdX+8/+zMBv/9BFIig0CuFEbg+PUI5zsGYt4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8053
X-OriginatorOrg: intel.com

On Tue, Sep 22, 2026 at 10:08:38AM +0100, Pavel Begunkov wrote:
> On 9/21/26 14:53, sashiko-bot@kernel.org wrote:
> ...>>   }
> > [ ... ]
> > > +int dma_buf_io_init_map(struct dma_buf_io_ctx *ctx, struct dma_buf_io_map *map,
> > > +			struct sg_table *sgt)
> > > +{
> > > +	unsigned seg_shift = ~0U;
> > > +	struct scatterlist *sg;
> > > +	unsigned long tmp;
> > > +	int ret;
> > > +
> > > +	for_each_sgtable_dma_sg(sgt, sg, tmp)
> > > +		seg_shift = min(seg_shift, __ffs(sg_dma_len(sg)));
> > > +
> > > +	ret = percpu_ref_init(&map->refs, dma_buf_io_map_refs_release, 0,
> > > +			      GFP_KERNEL);
> > 
> > [Severity: High]
> > Does this GFP_KERNEL allocation violate DMA-buf locking rules?
> > 
> > dma_buf_io_create_map() calls ctx->dev_ops->map(ctx) while holding the
> > dmabuf->resv ww_mutex. If the driver then calls dma_buf_io_init_map() under
> > this lock, the GFP_KERNEL allocation could deadlock if memory reclaim
> > attempts to acquire dma_resv locks.
> 
> Most of these look trivial, going to fix them. This one, however,
> doesn't sound true AFAIU, I haven't heard about any blank ban on
> GFP_KERNEL allocation under resv lock.
> 

I can confirm this definitely not correct - see dma_resv_lockdep it
acquires dma_resv then fs_reclaim_acquire(GFP_KERNEL). Shrinker enter
direct reclaim and try to take dma-resv locks, but not block on the
lock.

Matt

> -- 
> Pavel Begunkov
> 
