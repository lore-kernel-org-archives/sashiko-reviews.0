Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE3D40B11F
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 23:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390264; cv=fail; b=XALCMDQejzOql2ec75rtUgl+4YZSLNB/rMcoH7OaJavWbFzXu/PUIqi1ayOVxaBeF/RdF1YMeB2tvvJw4vIiZqR1KFtX5NHPMKWDlr7eSOMrpJKBXh1XoTVL43YquPLP5INhfQKetFDM0r/fTBtcUTBSiEVidS51XRbzw2epEfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390264; c=relaxed/simple;
	bh=vhk5EMZxPoJWgx359j+teEY5sVUC4F+c/D1vpXmUUT0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nqLYcJhdH1RQBANRDsmla9LC6mSWs8mGQ2w6rQusd2FOQQ/vbeARDA0wX/1zXj9h2N31u7p9zjK0exVxwuhCGKr69DIJM2hhUotofcxHUR1h8Hjo2Fov8vC1B5TQ0eIgBLOjugJjiWWc22kP2mGB7L6VxqXmLQOGDVxEftEh04Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PEdY3NC6; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEdY3NC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788390261; x=1819926261;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vhk5EMZxPoJWgx359j+teEY5sVUC4F+c/D1vpXmUUT0=;
  b=PEdY3NC6jTXLKLGhTA0L6nUfRg2tu6Dfah1Uu0j9Hjpgn99NEfSqYn1l
   D/tc537vkGQIUdqogg7eLRextCGx1oaUQtc0gx/WhG3YWHiRdaB/q49tb
   SRXHyEEDDN/VfjvHS+Z35zl4rA8zwhIuxQAPLHMwZRAw2iJjgqA7Z8wca
   FvKx9jxuyQI+l/fRWADvWaMNYe4+9G7mRI5IH6NmM4hCeJBFm6dZM+9gU
   ydKL2nYcE0Ir0ze/VzBI308q56OWfUbw0pm7JCjXNXJaA2AmMPlt0F1XY
   Rogwdvs5g8PBiQLEag4pH7jpbNqcJ0eQtqqTmH6m+0GrUPnYyZ1u/gFOL
   w==;
X-CSE-ConnectionGUID: LobVw2NVQGGInSAiWdAing==
X-CSE-MsgGUID: K4+9o6rjRqWvvvgTChhR4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="89073529"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="89073529"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 16:04:20 -0700
X-CSE-ConnectionGUID: TE1XpzvBR1uONjPYmyenmQ==
X-CSE-MsgGUID: qUIbn2DpSli8rVhLuQwjjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="274830700"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 16:04:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 16:04:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 16:04:19 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 16:04:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8h0jcxKiVhdGGcQ+ZgXlOOOMUFJvzO5J+uXGVZs2qPRNAE2xiEiX+828zsXA6HXGSy3vkCAxVqb/Nc8viKYAMCSsb7OKhcVFrs3HUJlkR+9RgBpysQg8YrfU0aQspUr/X8LSLfz6zWPuGlQvkXdDCuHHqWX1zr3fZtiZievcsW1fAeGpteU28BS3XN2XhUTopb1kYTLP0z50Wbq5z5E/xi7OKpaIg2x0aAdJhfO0djoIhelE34Ytyk/qP45bn46MKNovnxoJnfyvwQvZXmTrNdt2HtrO/7GQMUDbPyUcXQQHdhGVj0vD92E6q1VvnEQ4oHhwH3898P0SLfXtACrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxBK1E/eec73mkG6/rnK1pe5ap6fdS6+RtuvRR9/BGc=;
 b=KPBDetcodCZrqjKcwk3xSPzB7i+gXN3oj0iAKQKNSCPw5Gwlsa7EIAP2QlxHVDvZ5hv+PsDzwJwjmGYfQVLbuuFz8av6h4H9hBixgzHsYH32GGdONAQMrpUHhSq6HZOd2Ax2NEEeG2c509BVYhwQDdWCuAF8gzH6fJDqeNM7Y7dEqi6kluc4gimqfWI3/gk5kkboTLx21bFyAUCyC81F8hVi/dHN8wjioJR/E73z/lR9AKqZcJrQYhlwJhLRXCsrJ6ZR77mXeRkZyAGtdSWc+7rW9u/gQygEkVtZxTC+HUunwkA7PVBEhMyDIp0VTkNXPR/UYDLtJvWW/MzpTgW1bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5913.namprd11.prod.outlook.com (2603:10b6:510:137::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 23:04:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 23:04:12 +0000
Date: Wed, 2 Sep 2026 16:04:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V20 09/15] drm/xe/vram: Add VRAM page offline fault
 handler
Message-ID: <apiraQytMqBPagvH@gsse-cloud1.jf.intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-26-tejas.upadhyay@intel.com>
 <20260902162540.841011F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902162540.841011F000E9@smtp.kernel.org>
X-ClientProxiedBy: MW4P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: e90a11ef-f59a-47b3-ff34-08df09468085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|10067099003|6133799003|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: R2iAPjcKhm2wS63FwEY2aMdQjWHxishYTfchhbkA4jIFkoao+s4BeCHGX+ihUcpdmN/CD2k+wQjv2rnJCu0zwMbtGbESMEcSPHEgiEXHuUtUE+QWr4lGv1jA9Qf4XV4Jm8V02gCoT8kVaId1baHYJCH0JnVy/rln7f43ElZ9EGRFu0N94DJzdweFbODAm5rwP/3Q3SvCpc6YOgMXOx6vz0+82fJqCM3qiYlvTpXoLtugrTNr/SDn2DIwUgkwqsx8htz+ahxJVBWAF0KdYi3ycEqb1kUZrFO0jfJixkFAIqsxmOpVhdanQZ1aa17mqJggtWULSHrGT7DaXgJNUJObGORr6gP+eQQ1RJeencql7tAkjugwQ8Pt0UiNHzcJS5zmx+n8vflBK8pW6wbQFu74+jcHuxGY17StZ92M0utsNoODOV9BltdorcT3P4QOmnoUcTVaGo+1CQMyJyjebMI2G1nFKqyidj8xoIh+P/IMKlZZ2uI/YL6qj6VhJLG2FYiBSlv34WzBItq9ndKrlqGVhwBfHC/nQ+At94uFZyv4epDZ61zCWK3hjn8vYP49n5ScItJirGg58gZkc83Tn+YQb2IKT3pVegSVg174bPPXIwc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(6133799003)(4143699003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fGcGOJNP57M0Td9dmtnYLlGdm9lYQ2oydyk+vHiw4ml9ga0gwojW6diXlr?=
 =?iso-8859-1?Q?qu9yJHHJn7kSc1doLZZJiPugjgtuJeP0hgR/xw7VUaJvTLmO/d19UFViL/?=
 =?iso-8859-1?Q?3IuJaL56xBV4Qw5uLiO2rFrkS0j9sP+GELPfTInaxz3Gt0XoABst8al7qg?=
 =?iso-8859-1?Q?fwdZBzWU7rYhqRDdLSxIuAahD1bgw+kID0RyW5aJUjd9N0Ng9Erg43i+vL?=
 =?iso-8859-1?Q?5T46G6FxNEWLJfjcinXuh3avycArEsOG5y1O2S+ojMOcrae2DdXQpriMfS?=
 =?iso-8859-1?Q?v0PAVUX3rI1mFVj3B8/fGDtdZbrUuidJYtiZA6ZvR3AnrOX3YtaSB2osKZ?=
 =?iso-8859-1?Q?kqBuv7azVT29mZoAFxUcMRXbr4aWsY6wvB1J6+pI5LvGiM3E0uiRpiRr9+?=
 =?iso-8859-1?Q?MlYv58HJ7+LC5S5ldVtpErmxjUOsAX1V8XKtdPsIwdGfZNf5MJxYM+xBrX?=
 =?iso-8859-1?Q?fGIutAQHHPgdI8ItaT1emMJQu7zSIOLoJCkKKuIQeWgjbQwEtzMta/nfqA?=
 =?iso-8859-1?Q?Hn4E5jQDkT0u0CRrH5vIwKrmWf+uSPZmVejoRcClb0iIJK3joVcBApDDWs?=
 =?iso-8859-1?Q?hu4jiNgSPeLMkbRAZ2eajAyq473oiOPxVYEEstgGzrcxSrM8K+Ic9gZziu?=
 =?iso-8859-1?Q?3awUxpou0Y3pQninMEMxMSXOlcOYsmCWyXRPWp2FoQjWRWwgs8sGH9QeDR?=
 =?iso-8859-1?Q?YaowB+cAKyd8S1c56jsLVOledNrfDazZ+iXE4EcKLpD5kTQAfYkdPjy4t6?=
 =?iso-8859-1?Q?PP1MTnsgCXFI2BCNTJ9n3tmkmDiPc/oAPbM0Z465vSnkjMEIO6HyATN0Nl?=
 =?iso-8859-1?Q?SdhMe/039QymfjI1ZGy+BLr27m9rcWUlkuSBIHdhFcz65Zr+tkwPmSoJ4L?=
 =?iso-8859-1?Q?EPVpvbEaxkKtYQ/Zjm7lyCL7fq2qJvr4Hg3ItS91oMN1i0wSl+8aQyrUbL?=
 =?iso-8859-1?Q?8yerQxCKjda92xxjrFvdte5TMjZnuV0hlpNPErdVLC0pBuj+40H8UgzRXi?=
 =?iso-8859-1?Q?boFHgmRuwwPqJC4QpLrd8QPblDGppSa7hLnC14epWSQc2LowAxmoaTUB7t?=
 =?iso-8859-1?Q?MT19UAeiS+vDTC3/l0ZfOYHUFu+zDDoNX+30toEMIlBGVmMZGN53ies4Gh?=
 =?iso-8859-1?Q?/Ew68vtXqOq9lq4BlbbaROFf116Prc6G6b+oJDAGwfQuTQFag/D+k7PKOe?=
 =?iso-8859-1?Q?ZTMna7l0H7jtfB5guVhyIEHXopf1MA0cYSV9wd7QadGYpgoxxwd9kgkJhk?=
 =?iso-8859-1?Q?BOekKrBsktAzedkaqMXO6hW8F1EXYuyPPoQHBUmDvHJR5GqX7ZlKDT+hWD?=
 =?iso-8859-1?Q?pIQiL+utBHG59D1yMrmKLpz7S1N25PFHXzAst3k/024vZfFwkaekc2kUi+?=
 =?iso-8859-1?Q?e0JFmLJFDodmsms/WammzUcMSqlU5yb5UPozO1dsIHLHaL9qMG9hjI4Fzu?=
 =?iso-8859-1?Q?+esGr1QYlvuxod6na6suVL3d+59sZ+qRxP3aXXh4pUu76WrDOiguY9PjIT?=
 =?iso-8859-1?Q?WV7p8wGs+N3BvzVrGiCiTm3AzXBSN4QRu+fW26nH4SWmapZbU+iF1AYz3C?=
 =?iso-8859-1?Q?syzetuTt/PwsXPMlA5pZhPM8vx9D0wgig8WGngaLOBIMNZtYM/wHb8YeTn?=
 =?iso-8859-1?Q?VFzfZkVaV78Bm1Fsp+59VgFy+jxN799bsAwrRuN3baUItnslQURbxokCV1?=
 =?iso-8859-1?Q?7KC8fGFAMM89K4aHN/lWfUnEqWXQxP0IsG+3Z4OYFquFixwSJ4gMsnPSV2?=
 =?iso-8859-1?Q?C1P8qHODr3W+82bWdve5YE7LXLLzilHaonyCxx7zk/rnKmg3Q8RQqHqMsi?=
 =?iso-8859-1?Q?6rYETskBxbWN6EiID88AIYPrQD6iX4Q=3D?=
X-Exchange-RoutingPolicyChecked: pu6RN0aE7FAeTPlRy5LCY72CDnIxIDTERPcUiHg+u/p9CUbAjhHKrfvOpGbnGS4IxICARje+hMH395gLUsTTs6M2YCX4J/5SvWTACiX5qxz6Dza+XOwsNnDg7Js+tXO7BNUMQyN+ourpazx63b8P8YU/QSVB7RovAkQqN/WVZA1TJV/t6OjE3ckQJn6ljtkINZ42QNk/Any6W0tqLQ+D/PqB1Invghdg9yn5enpeOT3pJAezNkx4NOoMOWVLzicsxUN+xPLo783EQR8koTc8mubKPK+aDNRhL1l112VpytZRd6kMbUZN9TfFhNxLmqwOfo6qdRDuy7EEv9JRTtIxWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e90a11ef-f59a-47b3-ff34-08df09468085
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 23:04:12.0017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tdQDRLNaFzysVBzxEbScM6jizY8xbNhPon4K/iyr1d3OAA92ZO3/k4gEK+OXGxqdCWulZmRveIo331WR9ugvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5913
X-OriginatorOrg: intel.com

On Wed, Sep 02, 2026 at 04:25:40PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Lockless read of `res->bo` in `xe_ttm_vram_block_owner_get` leads to a Use-After-Free when racing with a TTM ghost object transfer.
> - [High] Race condition when offlining a free VRAM page allows the faulty page to be allocated and never purged.
> - [High] Forcefully unpinning BOs in `xe_ttm_vram_purge_page` violates pin counting semantics and creates TOCTOU vulnerabilities.
> - [High] `xe_ttm_vram_addr_to_region` ignores the `kernel_vram` region, causing hardware faults in critical kernel memory to be silently ignored.
> - [Medium] A race condition between two-phase page reservation and synchronous BO eviction falsely marks successfully offlined pages as failed.
> --
> 
> commit 23a2bf9a5461265765230ffd0e7a9d24c27ca918
> Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Subject: drm/xe/vram: Add VRAM page offline fault handler
> 
> This commit introduces a hardware VRAM page offline fault handler for the xe
> driver. It adds functionality to purge the buffer object containing the faulty
> address, ban the associated VM or exec queue, and reserve the hardware page in
> the buddy allocator to prevent future use.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index d97739a84a2d1..0ab92bc3c6998 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> [ ... ]
> > @@ -580,3 +618,295 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
> [ ... ]
> > +static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
> > +{
> [ ... ]
> > +	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
> > +	ttm_bo_unmap_virtual(&bo->ttm);   /* nuke CPU mmap + VRAM IO mappings */
> > +	if (xe_bo_is_pinned(bo))
> > +		xe_bo_unpin(bo);
> 
> [Severity: High]
> Does this forcefully break the pin counting contract by unpinning a BO on
> behalf of an unknown owner?
> 
> In xe_ttm_vram_purge_page(), this unconditionally unpins the BO if it is
> pinned, stealing a pin reference belonging to another subsystem (such as the
> display controller). When the true owner later unpins the BO, could this
> trigger an underflow crash?
> 
> > +	ret = xe_ttm_bo_purge(&bo->ttm, &ctx);
> > +	xe_bo_unlock(bo);
> > +
> > +out:
> [ ... ]
> > +static struct xe_bo *xe_ttm_vram_block_owner_get(struct gpu_buddy_block *block)
> > +{
> > +	struct ttm_resource *res = block->private;
> > +	struct ttm_buffer_object *tbo;
> > +	struct xe_bo *bo;
> > +
> > +	if (!res)
> > +		return NULL;
> > +
> > +	/*
> > +	 * res->bo is updated under bdev->lru_lock by ttm_resource_set_bo().
> > +	 * Racing with a ghost transfer here is benign: we either see the old
> > +	 * owner (whose purge is a no-op and the retry path recovers) or the
> > +	 * ghost (rejected below).
> > +	 *
> > +	 * A ghost is a bare ttm_transfer_obj, not an xe_bo, so ttm_to_xe_bo()
> > +	 * on one would be out of bounds. xe_bo_is_xe_bo() rejects it since
> > +	 * only our own BOs carry xe_ttm_bo_destroy().
> > +	 */
> > +	tbo = READ_ONCE(res->bo);
> > +	if (!tbo || !xe_bo_is_xe_bo(tbo))
> > +		return NULL;
> > +
> > +	bo = ttm_to_xe_bo(tbo);
> 
> [Severity: High]
> Is it safe to read res->bo locklessly and pass it to xe_bo_is_xe_bo()?
> 
> In xe_ttm_vram_block_owner_get(), tbo is read locklessly. A concurrent
> accelerated move or pipelined gutting can transfer the resource to a TTM
> ghost object under bdev->lru_lock. This drops the last reference to the
> original BO, freeing it via kfree(). 
> 
> If the thread is preempted and resumes after the original BO is freed,
> passing the stale tbo pointer to xe_bo_is_xe_bo(tbo) will dereference
> tbo->destroy on freed memory, causing a use-after-free regression.
> 

This one is correct and this memory unsafe here.

Luckily, this fix is easy...

This one will need to be fixed, snippet below:

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 6a954018012a..ff937ab3837a 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -733,7 +733,8 @@ static bool xe_ttm_vram_page_already_processed(struct xe_ttm_vram_mgr *mgr,
  * blocks will hit xe_ttm_vram_mgr_del() on their own and the pending
  * reservation is retried from there.
  */
-static struct xe_bo *xe_ttm_vram_block_owner_get(struct gpu_buddy_block *block)
+static struct xe_bo *xe_ttm_vram_block_owner_get(struct xe_device *xe,
+                                                struct gpu_buddy_block *block)
 {
        struct ttm_resource *res = block->private;
        struct ttm_buffer_object *tbo;
@@ -742,6 +743,8 @@ static struct xe_bo *xe_ttm_vram_block_owner_get(struct gpu_buddy_block *block)
        if (!res)
                return NULL;

+       guard(spinlock)(&xe->ttm.lru_lock);
+
        /*
         * res->bo is updated under bdev->lru_lock by ttm_resource_set_bo().
         * Racing with a ghost transfer here is benign: we either see the old
@@ -788,7 +791,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
                nentry->addr = addr;

                if (block) {
-                       pbo = xe_ttm_vram_block_owner_get(block);
+                       pbo = xe_ttm_vram_block_owner_get(xe, block);

                        /*
                         * Critical kernel BO? Best-effort check without resv lock;


> > +
> > +	/* The BO may already be in teardown with a zero refcount */
> > +	return xe_bo_get_unless_zero(bo) ? bo : NULL;
> > +}
> > +
> > +static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
> > +					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
> > +{
> [ ... ]
> > +		if (block) {
> > +			pbo = xe_ttm_vram_block_owner_get(block);
> > +
> > +			/*
> > +			 * Critical kernel BO? Best-effort check without resv lock;
> > +			 * worst case a concurrent pin causes reset path unnecessarily.
> > +			 */
> > +			if (pbo && ((pbo->ttm.type == ttm_bo_type_kernel &&
> > +				     !(pbo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) ||
> > +				    (xe_bo_is_user(pbo) && xe_bo_is_pinned(pbo)))) {
> 
> [Severity: High]
> Does this lockless pin check create a time-of-check to time-of-use race condition?
> 
> In xe_ttm_vram_reserve_page_at_addr(), xe_bo_is_pinned(pbo) is checked
> without holding the appropriate locks. A user BO could be pinned right after
> this check (e.g., for display scanout), and then forcefully unpinned and
> purged. 
> 
> The display hardware could then continue scanning out the old physical
> address, potentially leaking data of whatever new BO is allocated there.
>

We should probably file a Jira for this, as I agree this possible with
the right race + NIC trying to pin the BO, but unsure how to handle one
properly.
 
> > +				kfree(nentry);
> > +				pbo_to_put = pbo;
> > +				drm_err(&xe->drm,
> > +					"%s: addr: 0x%llx is critical kernel bo, requesting SBR\n",
> > +					__func__, addr);
> > +				break;
> > +			}
> > +		}
> > +		/* Queue both free and occupied (to-be-purged) pages */
> > +		++vram_mgr->n_queued_pages;
> > +		list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
> > +	}
> > +
> > +	/* Deferred put outside lock to avoid recursive deadlock */
> 
> [Severity: High]
> Can a concurrent allocation claim a faulty free page when the lock is dropped?
> 
> In xe_ttm_vram_reserve_page_at_addr(), when a hardware fault occurs at a free
> address, gpu_buddy_allocated_addr_to_block() returns NULL, meaning pbo is
> NULL. The page is queued and vram_mgr->lock is dropped to prevent deadlocks.
> 
> During this lockless window, a concurrent TTM allocation can claim this
> exact free buddy block. When the fault handler later re-acquires the lock
> and attempts xe_ttm_vram_buddy_alloc(), it will fail, returning 0 without
> purging (since pbo was NULL). This leaves the newly allocated BO using a
> faulty hardware page, which will cause persistent hardware errors.
> 

This also looks right. So I think:

@@ -804,10 +807,17 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
                                        __func__, addr);
                                break;
                        }
+
+                       /* Queue both free and occupied (to-be-purged) pages */
+                       ++vram_mgr->n_queued_pages;
+                       list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
+               } else {
+                       /* Immediately offline */
+                       return xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
+                                                      size, size, &nentry->blocks,
+                                                      GPU_BUDDY_RANGE_ALLOCATION,
+                                                      NULL, &nentry->used_visible_size);
                }
-               /* Queue both free and occupied (to-be-purged) pages */
-               ++vram_mgr->n_queued_pages;
-               list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
        }


> > +	if (pbo_to_put) {
> > +		xe_bo_put(pbo_to_put);
> > +		/* Hint System controller driver for reset with -EIO  */
> > +		return -EIO;
> > +	}
> > +
> > +	if (pbo) {
> > +		/*
> > +		 * Purge BO containing address - reference held from above.
> > +		 * This does not necessarily free the blocks synchronously: if
> > +		 * the BO is not idle, ttm_bo_pipeline_gutting() hands the
> > +		 * resource to a ghost object and it is released only once the
> > +		 * move fences signal. The reservation below then fails and is
> > +		 * retried from xe_ttm_vram_mgr_del().
> > +		 */
> > +		ret = xe_ttm_vram_purge_page(xe, pbo);
> > +		xe_bo_put(pbo);
> > +		if (ret)
> > +			drm_warn(&xe->drm, "Purge failed at addr:0x%llx, ret:%d\n", addr, ret);
> > +	}
> > +
> > +	scoped_guard(mutex, &vram_mgr->lock) {
> > +		ret = xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
> > +					      size, size, &nentry->blocks,
> > +					      GPU_BUDDY_RANGE_ALLOCATION,
> > +					      NULL, &nentry->used_visible_size);
> > +		if (ret) {
> > +			nentry->status = XE_PAGE_RESERVE_FAIL;
> > +			drm_dbg(&xe->drm,
> > +				"Page at addr:0x%llx still busy (%d), deferring reservation\n",
> > +				addr, ret);
> > +			return 0;
> > +		}
> 
> [Severity: Medium]
> Does this unconditionally attempt buddy allocation without checking if the
> retry path already succeeded?
> 
> In xe_ttm_vram_reserve_page_at_addr(), if xe_ttm_vram_purge_page() frees the
> BO's VRAM resource synchronously, it invokes xe_ttm_vram_mgr_del() which
> triggers xe_ttm_vram_retry_queued_pages(). The retry logic will successfully
> allocate the buddy block.
> 
> When the original thread re-acquires the lock here and blindly calls
> xe_ttm_vram_buddy_alloc(), it will fail with -ENOSPC because the block is
> already reserved. The page's status is then falsely marked as
> XE_PAGE_RESERVE_FAIL, leading to misleading internal state.
> 
> > +
> > +		list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
> [ ... ]
> > +static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe, u64 addr)
> > +{
> > +	struct xe_tile *tile;
> > +	u8 id;
> > +
> > +	for_each_tile(tile, xe, id) {
> > +		struct xe_vram_region *vr = tile->mem.vram;
> > +
> > +		if (!vr)
> > +			continue;
> 
> [Severity: High]
> Does this skip checking the kernel-dedicated VRAM region?
> 
> In xe_ttm_vram_addr_to_region(), the address lookup loop only checks
> tile->mem.vram and neglects tile->mem.kernel_vram. If a hardware fault occurs
> within kernel_vram, the address mapping fails and returns
> ERR_PTR(-EOPNOTSUPP). This causes faults in kernel memory to be silently
> ignored instead of triggering a system reset.
> 

tile->mem.kernel_vram = tile->mem.vram in the current code but for
completeness, this likely right too. I'd check the kernel_vram if
tile->mem.kernel_vram != tile->mem.vram.

Matt

> > +
> > +		if (addr >= vr->dpa_base && addr < (vr->dpa_base + vr->usable_size))
> > +			return vr;
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260902145343.465686-17-tejas.upadhyay@intel.com?part=9
