Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813C0427F98
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 06:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319338; cv=fail; b=JBP2Uozf+vAUyN9iGV3gzbtsr9aboXbStHpcfRlh2+trUZVPd1CEC5/hPq8SXXRfsUmhhwv1vpQr7wwDmd0149520iEu0lwzhf4IbQXOgoS8yKZ7xXv2JHzdLlqM9ae1A7l/QntpGo6/qiSfCeFxUxuTZ/tu4tkyGXe51YyNr9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319338; c=relaxed/simple;
	bh=kGBBHUwCbIOtOA4O8lZmGdl/ZU30rW/SdYwkD8QVfgk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GxznY2gv65NnBA7Urd9BFTeJfH/PZbcI5jePQQTy+2kljxCTIiP+U/CBR7SsDxld/SJLrjqGM6MtMeze6+qTqTVuekbhLY9qj3WPbqGgH7JDeGlxnQcoRQpED24wFDzrbyRbpXUzuLxcYzOaBhjJH5NMvnDfzrZaZkk+RtbdH5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZTCC3g7e; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZTCC3g7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790319336; x=1821855336;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kGBBHUwCbIOtOA4O8lZmGdl/ZU30rW/SdYwkD8QVfgk=;
  b=ZTCC3g7eHzl8SsBWGxUJ7QqtEIbDyE7mtoDQ3vNZS/jRSvWqT2gKYMVW
   UNifQzufwW0ukSLr1ZDPtAHT8FGJxeSQ2owI0QruByXaLKQe1Fr1voQgj
   kTyPxPdk8cka9Rh7D4idiBtTAyvbBw516iYdrL8+BDEYv4IYRty0Fb59e
   lwClR7VJVvcTyN3MYV1LAgVtWhzB1i6nb+CaSoHotn9yJeYpsqi+NvWH6
   8iBjHe6YdcQlTVEHh9EfporGbpmh1O1rucfMO9pX4I6nJRLSZh1Lye0xF
   tXwqnvnSCNjiVFOTf4T66Z17vtflypyfb5Y2y0Fx4kxYyz3ftHAeBIPwG
   A==;
X-CSE-ConnectionGUID: dlERFGu/R5WYz422LJLlYw==
X-CSE-MsgGUID: M8StZgXOTzGzQSakNVxWPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91205907"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="91205907"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 23:55:35 -0700
X-CSE-ConnectionGUID: zni4QfPbS2CLrTC9eFg21A==
X-CSE-MsgGUID: ULr3p4UbSf6XslS2ZkfNfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="274354374"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 23:55:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 23:55:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 23:55:34 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 23:55:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBEvpaQeayttq/0aUf8N68+r3mGHfJgjfZNZk9Ds42d2HAMd5bxZqV+4YqxPIM2J9u0/87cSQLBWOQPY75u//tz/YmunkglToOv5GnNdVS4wOBCUEO4d2R08ASLTtKyfzK0NPXqIR3crxcmOWxjQ9a/XN08qCdjhjDQR0zmP6A2P8aKDvgqj1hk3FP91rKIgo8u6gxp0RxugTplI0hdN1noGJjpk+M0VE9APRtSD3O8kzwnG/2h8QCHdC6q5gVc0INJqC1fYqxB4kGN/6xPF5Aw99MY9Dfn9XlYenIsbkIzNjaQkCOa4AtCtiEsPgv/IqbYCIBVIH52DbZjKv6Eykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEFDpsMQcMdGc38ZpMrjxB3rDanYI6NneZGx16G9jfM=;
 b=KKSK6grAvIozP2fQV3gi3XJgiGXAKyAonDBBN4qNT32SMZ1/iTKk48Dd5vsuaYEdei1cUJcrGyQuGh9Q4shtZ6x6CPFE4YK/B7biLswnqnPgZ8is/XnIC4kwfCrGy/BYqyb43AnNBWZptfja6VtflbdQAzjzff9QCmAv4Txy+t93/b7rFwAmxl1fexiwa/uVUOdUG9imytWzsiF8YibhCW+G7dzWvY7dXoZUonnNkdFNeTKoJMtRlIFMU1Bgb6/Dt1egw0btmjvQVIOhncRiVCz+jYEyZls4rlxcO3J+zb6Ti5FWDC0n0/u7AdPFry3No9cAV//alffDdJxzFrIQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 06:54:31 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 06:54:30 +0000
Date: Thu, 24 Sep 2026 23:54:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 13/24] drm/xe: Enable CPU binds for jobs
Message-ID: <arYapDIMe2PAW4qF@gsse-cloud1.jf.intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-14-matthew.brost@intel.com>
 <20260925060326.27F9A1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925060326.27F9A1F000FF@smtp.kernel.org>
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a566e0a-83c2-41fc-3f1f-08df1ad1d918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 7VEWFCtZ0htU8SQdFYxVpRhex7N8SXMtfqm9yAeVhU43gz3f7WnQ/JcctuBL+KmusDZHtrsd1MHJxKwqbqeGDlbauB4UJUH8qKEqUUnqxpSIs5rXjH1tSKwKX+LQOz34wDkAlrYeuk+CVMnI6cX4lYGRbb/B/RtBG/0F2CnE3jMRGLQGsLAA80d33o/ELIRuCAQj0YQFYzjWIdRvLM4NCtucAnoIrpsxLibgtAqNZGuep20vOPlw95h4qrTYzifMvsMPUqDPj0IMsbdhcY6gaHdMlPm9bU1I5dYVcxVTjIugXJYO0D5pHSdejtrtk2/mTYJWHmEZpn7mTzNmEdkxDPZSIdAXU+AXTaMFjx0gFDeTMZ4R91XwuWOJOHjRthNoeIVtGWG7Buooxr9/9pt5AZxJ0uHx9mAZWST5fEX13YuqFjnfRBaLTXMhruLKiDG7lCkbkuZbaHhAjgCLeLLtIAahIvDX08r48ALEXKEFCeNJ3SmvXVoGZ62+oqGsn8CSRFXwz7Rfy8JDfGPrBXqBcDTgaeJ5+Id/n3lHFfXf3grry39pd8T724rLU+dOQsBjltiFCZUfzuDgGd12nPCmIPX6L8YRbDfSOsX9eYsEhj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?97iLyEwSREL6fl2U+dX94ddxzuVTSJDJOcdkoTRYpfmqAeqpT0MfQDYZOT?=
 =?iso-8859-1?Q?9yJ3qudPIu3zYErAiYTxnM0bPNtGK2ciwmPuWH8ZQHDrI2UBUZ/tnlDOqM?=
 =?iso-8859-1?Q?Np+pWy7p4zl4YhJWx1z0Pfe8mpwZ35aLtiAxcy13y4y9I3sb3XJEY0qvos?=
 =?iso-8859-1?Q?xodFaaRwqm4bidbL83qYMYwD0eSYnsnb7p3KfdfSAYBNqUxPTbl7msihOn?=
 =?iso-8859-1?Q?3nYJMXB5pBf3FZ+kcE/9cU382VIJynjx5FqilwdkeXvAxGhinZra8HSgK5?=
 =?iso-8859-1?Q?VZ48xOepnVlUFA0E81AqiCRxH9whfOxt8IbqJEt7yV+o/DkEoUZ9NGtvSY?=
 =?iso-8859-1?Q?wlbB9eok/Y0zYDM89eEGRSbdAjUjxFi8r+sv4ffRiDsJzdKHETYwMXrfVm?=
 =?iso-8859-1?Q?nWiXRrsbznXpzWDvYxsD7Y13z9np0X9OHN2TGb8+Ju6HjAkE0aB/dMziUT?=
 =?iso-8859-1?Q?dWZjxKTe1sFwOcLpd4xfxKZ9f/SIp3dtRTu8cXASpdbKU6wIvSxFaL7iUJ?=
 =?iso-8859-1?Q?q9SKSXpPASpt5zRJaqx9JVe1cGEpNsHsY9TVOLrwCYIMnDX4Zqv7Jqx2Dn?=
 =?iso-8859-1?Q?ER5p+WJouFutXbOALfEJfa2cTwB08J5KzhiGsZIbo+sq86CQiRFd+DIRPj?=
 =?iso-8859-1?Q?tG6mhe1qJ4otBr2NG4kTw0YGx/c4sZSBdTUOBuFt+4wHKAxOpYVxevytZd?=
 =?iso-8859-1?Q?MI2yPd2RpiT5fkB8yX/RZaIULioedtEt3rAim77UvI0qIS43tN5gfDGdwQ?=
 =?iso-8859-1?Q?f86ovWnFaCWFv6RtlCD4M4gFn7CpAH68w0lkPxu9GG6AsTMUteEKlbmikB?=
 =?iso-8859-1?Q?CedPUJBubex9SMaC04/yg/OoMW/vQDJB5Zpu7/i6HqyDQwi0GPtRxRlHh0?=
 =?iso-8859-1?Q?u6PvwzJvVbNZ6dR4pAQGQXgbaoon8x2mDiIHDNYgxFj6Jlfr+fKMyVXvty?=
 =?iso-8859-1?Q?ixNTCvV6OhrDDmKhwiqf8h5UywfZCcWk3CfRYgoQs+tbCaOAyPJbp0voW0?=
 =?iso-8859-1?Q?U2S6zpAlzZ8dl95X0eKEAziPZOBLGR2w/Qg4WegurPAk3Hc/+AeuO0VtO8?=
 =?iso-8859-1?Q?EVRHeiNKK8/ECsYA5wNqbjjP0ejLJ+/gRxSERKiqItQqnmPUNToqiuOpKq?=
 =?iso-8859-1?Q?xSDdzmhCJGbJUjJBkjArQX3RW/UwN4SHMQa0yZe/45R+l6/dAIf5P+RotD?=
 =?iso-8859-1?Q?xk+YfOP2nrfFvi55R41lfjsKoL/JsdTJUqhjNqUFyIuhv1FA80FpX3JqRk?=
 =?iso-8859-1?Q?tDQtCmYfsgRsn2bboXzgncxiOWZPNrRjMhZpXLNSaIcV3eg0AcpCmsPzzU?=
 =?iso-8859-1?Q?1kF8/uVh0KESQSuXsBRiRi8cvlgU4zweBfd4qZswqpIiTaaFNrewO/y2Y+?=
 =?iso-8859-1?Q?SsLSOYdCmMlhgNYvZSsdPj6aldKRt8vqQ4wxpTyw9mI1g6sGcbPZX6aLYq?=
 =?iso-8859-1?Q?ewaWQy6R2NXXUh8lCwjE+1PCsxvDGta0FiCb/OfRrp/cHsvFkbGgspVxXv?=
 =?iso-8859-1?Q?9ykRrqgKVErsp7G6Szsrulm0HYhHQW8IcmoGio7inZw86C0FM7mcJNh3fP?=
 =?iso-8859-1?Q?/pTusaLXENAMnt3vfpFrbuwdXHrdwupEbXHqNrUJ4XTIWEc/3Oc0UHO/Tc?=
 =?iso-8859-1?Q?+PMfUBV8rlbkA4iWJkUF1FJGgp2IeIQDbCMIJ9TEcvV0b/7sI7SszwYE50?=
 =?iso-8859-1?Q?knUZToCIL9Y5d8eMgq+VtyBZ/8ybDD20wChly1dU5sl5QyO1/YUcsVHU77?=
 =?iso-8859-1?Q?Ur3lnYJJ1FDQ0j/IJR+p8tgrAZzeigSrpFb//MpZuYi/tDchs2QBFnlWhJ?=
 =?iso-8859-1?Q?pdqk4eWsYg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 2enYk5sTS0fN5hIOyZTzRQ/Ic5GA+6kbZeTJYBof7rXXs8SrrmJ5oBzuXCJeGRbnjDIMsqcow2J6Vr9opV3CBGKChFq7LaK07Xq6p5FM/LrRuDw4a7qP/QvLRTTpGp25ItlJL4YM6ngon9lHauM2hLTX3XQa0k6VTBBiaU1wVu80HS/QdlueHelu8Bpy7GV3QZYVI1e42tQGV0DatSb6kKGyN4m2aXgPpQqK0Eu7gjWIquo2r3l+wMY5UqPdSgDi3z3MW5CWDZh53WAUVBf+FA6uoZW1qyqb4s9ozmJU/6Gz9cK8H+sJBsTMgP/0niK31jpeEzOYY5DJm2XvBpkZew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a566e0a-83c2-41fc-3f1f-08df1ad1d918
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 06:54:30.3975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCn7YryLtVyPOJKnwsuWeJvwoxXb/6B+RJ7n+PA/Hc600ZL9DYMHgOmU/QUkWaB3pLy9kj/y955JRrangjAyYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
X-OriginatorOrg: intel.com

On Fri, Sep 25, 2026 at 06:03:25AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] drm/xe: memory leak of pt_job_ops and dma_fence when PT jobs are canceled
> - [High] drm/xe: GPU hang and memory leak due to missing CPU bind support in Execlist backend
> --
> 
> commit 6471c15e2149c2517458e891e7dceef8c5573f97
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Enable CPU binds for jobs
> 
> This commit updates the migration layer to formulate page table jobs that
> issue CPU binds in the submission backend. All code related to GPU-based
> binding is removed to lower latency and avoid PTE migration limits.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> [ ... ]
> > @@ -1937,162 +1866,18 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
> >  {
> >  	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> >  	struct xe_tile *tile = m->tile;
> >  	struct xe_sched_job *job;
> >  	struct dma_fence *fence;
> >  	bool is_migrate = is_migrate_queue(m, pt_update_ops->q);
> > +	int err;
> >  
> > -	job = xe_bb_create_migration_job(pt_update_ops->q, bb,
> > -					 xe_migrate_batch_base(m, usm),
> > -					 update_idx);
> > +	job = xe_sched_job_create(pt_update_ops->q, NULL);
> 
> [Severity: High]
> Does the Execlist backend properly handle these new PT jobs?
> 

Execlist backend is dead. Non-issue.

> Since xe_sched_job_create() is now called with a NULL batch address, these
> jobs rely on backend interception. However, looking at execlist_run_job() in
> the Execlist backend:
> 
> drivers/gpu/drm/xe/xe_execlist.c:execlist_run_job() {
>     ...
>     q->ring_ops->emit_job(job);
>     xe_execlist_make_active(exl);
> 
>     return job->fence;
> }
> 
> If GuC submission is disabled, it appears the backend receives this job and
> directly emits it to the ring without an is_pt_job() check. Could this result
> in pushing an uninitialized batch address to the hardware, causing a GPU hang
> and leaking the pt_job_ops structures?
> 
> >  	if (IS_ERR(job)) {
> >  		err = PTR_ERR(job);
> > -		goto err_sa;
> > +		goto err_out;
> >  	}
> >  
> > -	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
> > +	xe_tile_assert(tile, job->is_pt_job);
> >  
> >  	if (ops->pre_commit) {
> >  		pt_update->job = job;
> > @@ -2103,6 +1888,12 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
> >  	if (is_migrate)
> >  		mutex_lock(&m->job_mutex);
> >  
> > +	job->pt_update[0].vm = pt_update->vops->vm;
> > +	job->pt_update[0].tile = tile;
> > +	job->pt_update[0].ops = ops;
> > +	job->pt_update[0].pt_job_ops =
> > +		xe_pt_job_ops_get(pt_update_ops->pt_job_ops);
> > +
> 
> [Severity: High]
> Is there a memory leak if this PT job gets canceled before execution?
> 

Again non-issue - _arm() always equals run_job() call. Non-issue.

Matt

> We acquire a reference to pt_job_ops here, and xe_sched_job_arm() takes an
> extra dma_fence reference. If the job is canceled (for example, from an
> execution queue kill or GPU reset), the DRM scheduler calls the free_job
> callback which ultimately calls xe_sched_job_destroy():
> 
> drivers/gpu/drm/xe/xe_sched_job.c:xe_sched_job_destroy() {
>     ...
>     xe_sched_job_free_fences(job);
>     dma_fence_put(job->fence);
>     drm_sched_job_cleanup(&job->drm);
>     job_free(job);
> }
> 
> Since xe_sched_job_destroy() doesn't check job->is_pt_job, it seems we never
> drop the pt_job_ops or the extra dma_fence reference. This would permanently
> leak the deferred actions and their associated page table BO references. Does
> the job destruction path need updating to clean up canceled PT jobs?
> 
> >  	xe_sched_job_arm(job);
> >  	fence = dma_fence_get(&job->drm.s_fence->finished);
> >  	xe_sched_job_push(job);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260925045320.1325860-1-matthew.brost@intel.com?part=13
