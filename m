Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C554EEB9
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 18:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706719; cv=fail; b=d8FEImVFXm1FB67622T12gwRNKx730vOTTNDM/Nh4tofm9hNRnZvFJwR4RRrVJ+5p31Tg6msL1RmfFLEDuu0Rx8mg7PBFZFpeqHpMP5JJy7tlQdVFaWJLXa4HgjpMPwWHXXowrf0Si8Yp7i7btyU4zbsOlDMZ2SStsMFWiRJtow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706719; c=relaxed/simple;
	bh=WSURI8MSWVODbj1Y8gDKk+zRH3P6YUwI08PfYHt/PPM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CZdfnNRPVeG6BEoLdT1hzqL+8K8eQgoZE+JgbZur8An8GUQ08O81SVzVkGFdspHDlJ7kqsNzpgNJ/disJWJelQAf0/Mm3bj0zm4I9Wq1noMpG/FGxkCerAO/ZkcbZPICSWVmamwgSzP/gR4XQIkRibBCbYy3kP+eYbvb6Ej2xuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZgu2P8U; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZgu2P8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790706718; x=1822242718;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WSURI8MSWVODbj1Y8gDKk+zRH3P6YUwI08PfYHt/PPM=;
  b=fZgu2P8UReN3hfn/j890WRG/9BCg+63StL6/8hh7NvkOQzXwpRjuqTU8
   8aR6OJOhr/LPMDXzfdWO1D5kdEEnktuuFAvAAd63D4p8aayo26hDIui4E
   nqEIshhoud3Dm/0m6yPHHe86OaYSXVbfh13UCfVthdIKMb0fIhvxQPP42
   9Ioa4VuMrcGj0BrNRtWrTea95liMcmo2DoXG1K0noPMoZLaFEsBTgUzIY
   ErSTrGP97vxYcO1TitqjNNn4VuG5Mw52q2iH+iXTJXfq6E2+qahwujK1k
   QFyt/nM+t937YC76rNosesiDJPaiURQlhcOcGdaJUVYaW1UdiYev/cvKE
   g==;
X-CSE-ConnectionGUID: UbbJYCDIRaazSGOFW64XmQ==
X-CSE-MsgGUID: qj1KTR97TOCf+34RLO8sVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91532009"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91532009"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 11:31:57 -0700
X-CSE-ConnectionGUID: sBanVGr0TienjDfMPFcISQ==
X-CSE-MsgGUID: JQRneJPMRLqes6RO1zlAjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="301707249"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 11:31:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:31:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 11:31:56 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWfI+66va5yofnnQneF2RA7UP6bSk7ZZaHP8VgpcPLyWptY2fKminSnrWJAegyouw5Lbs8n2vtP+rC3PHJ0nGQK1uv49Qbt3F0AomkhO/O/lYRVXfnl1dTMX1JDxkgqafpcT0MEmAbwWtM6BZn2axiQRtM6At9ukVG88EPFPcwHf9kRBxHuqplXA9bzh6mx+5dZh4ajJ2oSXcfarVGxC3Xz+cdja1Xplb6QOOPrYK/m9vpoNVJOFxUrbhuX+YoYzaS9C+XOrmjNi7TmwA1BCiozZha1m7nJQ2ZcluwPSN1uPf4TLOLiHRFNxE9SNEA1SrGaL1w8nRysVznZfPUCVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPvuMLsf3hS8uDCQyc9weavyJeTj1GpuWdkLHQP4vQY=;
 b=FqMyLlJq/DuIyjpo+wLSJKgy2QNmwxomIx4XelSPqzDD6kBlXFnga7QYNRB07iilMLJVHbSrCIMOO9oNGJEP47BDVmTHMdxKMI+kQRREwsqFzfImB30LdfCnDhHLJaj/vmPZsl5ixOLApy+pF3oxWfaBizm9PmtpQuLyQENmZldukK9DN6gthIZjS7SqCBaGDJ3BGVtliyDAQKD03wzOuiz4h73Rr9Y9rhoOI9Y+VZNWjco41qXEB3Wh1nPbXnKlOQUbhNmHSerWUiIQmkbIOKJtFWfm2KVE6IXopukETR6e4Hq2ARvqB+n/cIf/o6MQUHk0dY/xt0CKHCNRBdHiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by LV4PR11MB9489.namprd11.prod.outlook.com (2603:10b6:408:2e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 18:31:53 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 18:31:53 +0000
Date: Tue, 29 Sep 2026 11:31:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Do not clear SVM device memory allocations
 up front
Message-ID: <arwEF/IOqsXumoXH@gsse-cloud1.jf.intel.com>
References: <20260929181024.2743854-1-matthew.brost@intel.com>
 <20260929181024.2743854-4-matthew.brost@intel.com>
 <20260929182718.CA0AA1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929182718.CA0AA1F000FF@smtp.kernel.org>
X-ClientProxiedBy: SJ0PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::28) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|LV4PR11MB9489:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c459f5-55ba-410c-2664-08df1e57ef59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|4143699003|18002099003|22082099003|6133799003|56012099006|3023799007|10067099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: c/BYYXdqji0Z7dVD/V7YMpzrhjzMRvxxIKN5vN8Ni0ZCQyppq0PfT1xlaOc4Zx2WufL/EXEkFKPi6NnrL1gCij6O8s/t35XzjSHcywdkj073Z+gZ4mjDZ3CCxcFD2zJG2HdS8NQHwKBkA8MtMHDi9QCGMlbKUrQBOsJczS9Z7D2y/0DJaGqltKZQvP3/6zkuNfgKhEbGrLs0ndfldN55cNgpzQxgrawOP+f40ngRVheHNRedm5tGrOsXBSvAp2Vl8BjjSTADSlLd5kpBp5rL5fHHogdGrbWTmoXBseNENAa4vpEaMStu6mIhYIDBP9yV7xK62ksr4+oCWihX0lGAfC5tIJe0Viq0LJIaQMnR1s+b9SWff3lXD4rP00I7WtirOQqBEGmFY6f+1H5gz+vxNvOhc3xZmP8myDYYCqzu9gb3n1OWgps80nmCPwa3N/d67FiwqgCDYmYOvhpDG/G4K3N7b+nKcB7YO/Vl5CXUkLydnvF8+wWMOQfEh116xJ8hfO+efWuyUJDiDJCJ1cJWSRXe3Jh48H3K9hHG1dce0gOBOz0BEhdEdhGQy2bN9gKff9HBHCey5YvMgMhK4aKtGVEB6z5L1ZH1RokWKIOXmoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(18002099003)(22082099003)(6133799003)(56012099006)(3023799007)(10067099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?z94vBd+RTs5hroKHtxHmCjIi5w+TJaOdkGZdvCP5ft3EUz3KtSPbV8Mmzb?=
 =?iso-8859-1?Q?xWZ/uxZyoWfw/rUVfM/Hz41oHeJJzHdN4emZFMjpmRXKSoYl8EMv4AWbXQ?=
 =?iso-8859-1?Q?4xvFhEfDArtu5lvDf2sRNdx5B3EsYsTk7hbYOUsGzb2Gquk7hSmQ+eQU79?=
 =?iso-8859-1?Q?E8a5eL8FmMW9zTIJqY4iZOMMKU4YHKojjT18RAsoH+J1tQvN9hxqm8ccXu?=
 =?iso-8859-1?Q?PVWO8PBjFs2Asi6fxisHInqAoOyhLDkC0bPx5D9n/BWf3QHcIp4RJbf/rW?=
 =?iso-8859-1?Q?nSF/K2PVlWLdw6SUkyCUwni1FgxbmOcH3cod0tt7rKZ7jMi17LIMXLJPrR?=
 =?iso-8859-1?Q?dfPpt5L0X56i/2oyF/GKi+W0JF/WwOD6V/Z8wn/GZDI78PgHxK2Vp7fm6u?=
 =?iso-8859-1?Q?ZEEObiZWauT4NHBTO4emXd4IsEVBby7Uom9X++F7AMbGJmkRG5jxWsmusF?=
 =?iso-8859-1?Q?PXh8p0jrG85U/6qDOAByK35RqiNLlUB0ry9j5IBpVfqz7jFxZgMbg7Qsri?=
 =?iso-8859-1?Q?IvkVUoDxockfmf/KRNA6MpaS8Gxz6dbPA6u9PvBrAYFRM3NQETVMd6Xj2m?=
 =?iso-8859-1?Q?Nh3QSmtKsGAPrj8RRkVXTJRfEj3peL40R6glRwM6lJC/PHue+tXT7akRlj?=
 =?iso-8859-1?Q?4xF26Y0cPzSBGtQmr84iPzOlFYXOSLFACNTMq91/Va/zhzibEdFP+YMt/Z?=
 =?iso-8859-1?Q?TOKYGCG8qJm4Ri3eY7ISLwLZrKhbbNeDys4vV7Y+QLcXB9sZiSrdFmBdfH?=
 =?iso-8859-1?Q?5lMoD/vMq0ccZ7EQ922Xe0fl5BRjnGegC0q+q4/yUBLCU3hSAbdmA2fgYc?=
 =?iso-8859-1?Q?TA/qDfzWeuz7d17QjY7SSQcI4EHs+s7ReHFjtAiqtN7E1x6mWFpuGQ4hMJ?=
 =?iso-8859-1?Q?1z69IVV0FilS/fFxKRb2NXhRTH3w+iMVFRvj5eI7atEjLL1cNgCOBps+Nj?=
 =?iso-8859-1?Q?G6oNmO3jTuGxbZy8YsLjRSQIYyzy/HBKW//rjrODTmFdhshl9YzqDw/Ghh?=
 =?iso-8859-1?Q?spyoTzMR3xXrWiz0h1BjT3M/fTW1jXu0Vts1uA00GXEy9+/yATfC4JPkVW?=
 =?iso-8859-1?Q?Pw07GanQ5qoX21g1WqhzZnIjqgo1D8+gjpFDsZXVSIsw1fNvnuulIPdXQZ?=
 =?iso-8859-1?Q?l2lLF0flLQUKLF6j/76Nvlev2Mr2KLI2TXsqS3Mpkfgeyk74e14Se6S9lq?=
 =?iso-8859-1?Q?opwXdsTHXV1d+gm0W6jMQlv5OhNw+rL9g7ksB9w2sHW7GTXmdR0Telm2uM?=
 =?iso-8859-1?Q?qoxOft+PZrObTAqQR3LPu/DJ/c1Q9YtiCPajQ8/ZHN0SvIopxd/Y5A7Bjb?=
 =?iso-8859-1?Q?ziCew96tRD/+rsB+IxxGME6Vs3X5xwgb8Y6Sj/4IEjxiZ/XuMxcv/EADon?=
 =?iso-8859-1?Q?1bNjTbzQ8uXRNFbuoR1R171RB3mEoP//ehS1I4Uw9+0j6zB05WK67apmE1?=
 =?iso-8859-1?Q?6jtBItjEk+aLC8vxanT2Kz4wdPfixoS7P3ej31YpdE5xVAGpBMb1JKJXka?=
 =?iso-8859-1?Q?/pLarjvK+nbK1qLDi0rlW4dUsXM2tEzYOiX4mARUEOfY9MVz4VHyBoPNk9?=
 =?iso-8859-1?Q?3tmLf6Zkrzww6vhJLpBFwBY4+wz2R+/4IVD+ZcoDnW8TwGEOcbzk3RJc+D?=
 =?iso-8859-1?Q?2K3+m+FSnNNcNHXOjd9UwkbmRylsV0bNkHgfJ+ta39KrSfewz8DvXXlwSe?=
 =?iso-8859-1?Q?k0dLv9j0sL7y+dsmOtQ8PCAhqhYhvi3XoyPkyVRRjsiwHkDTELSgtmUes1?=
 =?iso-8859-1?Q?NHov09gJ53WmLXJpJcKWcv3yModzGi/wET/VdSADDQiGy3nrQL1M7VBqxO?=
 =?iso-8859-1?Q?7fBIfknong=3D=3D?=
X-Exchange-RoutingPolicyChecked: wwPmDKYNY6xO0xbzJpZf7oj0f8d/ucQHUvy8Op6esejxmPOtTBiTDhRGI7GMVsnvFi2ED968sq/4bQ5x/MJEQmnxDeCrt1dRnBKf60UegnlKf9eHu9HE4fhEH+LUKit7MbfuXJGghoUjEhG0SGdXXzHG+7mFveigIcGV0RRho/o1Ha+Kj+2fw/RY87o/4kPwFSaUUB+6HXWKyYqwNitN8Q70f5BKbrRTfOMXEit6o6la3AteYumrs1ZcpVg+g4MspRXPjihBR3mRFkMigFygcuj7t3TaVBWwwHAEBVZQ9e1psTZf6xBmvjM3WOJphprgnFzPzc/Y8iCvlL2o4m+aIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c459f5-55ba-410c-2664-08df1e57ef59
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 18:31:53.7430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsF/QG92WNEpZ+v+W2ge21FBiKTqgDD7kEd3BouKbD9TzOqsuIh+UkTmt87W4cuU6jYlc6Mz4xXZuu227uenew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9489
X-OriginatorOrg: intel.com

On Tue, Sep 29, 2026 at 06:27:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] xe/svm: oversized chunk lengths in migration cause kernel panic
> --
> 
> commit ed6428a65926a64520b6fe556921289286c9c71f
> Author: Matthew Brost <matthew.brost@intel.com>
> 
>     drm/xe: Do not clear SVM device memory allocations up front
> 
> The patch updates SVM device memory allocations to skip initial clearing
> by using XE_BO_FLAG_SKIP_CLEAR. Instead, only sparse areas without CPU
> source data are cleared explicitly during migration using the new
> xe_svm_clear_vram() function.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index f39e647512ad9..1b4d1222fbb7e 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> [ ... ]
> > @@ -586,6 +586,124 @@ static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
> [ ... ]
> > +static int xe_svm_clear_vram(struct page **pages, unsigned long npages,
> > +			     struct dma_fence **fence,
> > +			     struct dma_fence **deps)
> > +{
> [ ... ]
> > +		/* Not contiguous with the pending clear, or chunk is full */
> > +		if (count && (addr != vram_addr + count * PAGE_SIZE ||
> > +			      count + nr > XE_MIGRATE_CHUNK_SIZE / PAGE_SIZE)) {
> > +			err = xe_svm_clear_vram_chunk(vr, vram_addr, count,
> > +						      fence, deps);
> > +			if (err)
> > +				return err;
> > +			count = 0;
> > +		}
> > +
> > +		if (!count)
> > +			vram_addr = addr;
> > +		count += nr;
> > +		i += nr;
> 
> [Severity: High]
> Does this logic allow oversized chunks to bypass the chunk size limit?
> 
> If a single device folio exceeds the 8MB limit (e.g., THP or 1GB huge pages)
> and is the first page processed in a chunk (where count == 0), the check
> is skipped.
> 
> This would cause the oversized nr to be added to count directly, which later
> gets passed to xe_svm_clear_vram_chunk() and xe_migrate_clear_vram().
> 
> Could this trigger a kernel panic via an xe_assert() or cause hardware
> corruption by emitting oversized memory copy commands that exceed max
> parameters?
> 
> [ ... ]
> > @@ -617,7 +746,6 @@ static int xe_svm_copy(struct page **pages,
> >  		u64 __vram_addr;
> >  		bool match = false, chunk, last;
> >  
> > -#define XE_MIGRATE_CHUNK_SIZE	SZ_8M
> >  		chunk = (i - pos) == (XE_MIGRATE_CHUNK_SIZE / PAGE_SIZE);
> >  		last = (i + 1) == npages;
> 
> [Severity: High]
> Can i - pos entirely overshoot the exact equality check here and later
> in the function?
> 
> Further down in xe_svm_copy(), the chunk flag is updated for large orders:
> 
> 			if (pagemap_addr[i].order) {
> 				i += NR_PAGES(pagemap_addr[i].order) - 1;
> 				chunk = (i - pos) == (XE_MIGRATE_CHUNK_SIZE / PAGE_SIZE);
> 				last = (i + 1) == npages;
> 			}
> 
> If a large system folio's NR_PAGES (such as a 1GB huge page) is added to i,
> could i - pos jump completely over the exact XE_MIGRATE_CHUNK_SIZE boundary,
> causing chunk to evaluate to false?
> 
> This would bypass the chunk splitting, resulting in an oversized transfer length
> passed to xe_migrate_to_vram() or xe_migrate_from_vram(), which could lead to
> hardware command corruption and a GPU hang.
> 

Both non-issues as the max folio size supported is 2M, at least on x86.

Maybe in a follow up we should assert the give folio size <
XE_MIGRATE_CHUNK_SIZE to future proof this a bit.

Matt

> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260929181024.2743854-1-matthew.brost@intel.com?part=3
