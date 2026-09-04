Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC1C131E49
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 01:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788486111; cv=fail; b=Ssb0jqUGblJOy5GRcN553HYT+egT0ZN1WZERwdAqxlKyjepfA9DFoRg+9eNHuik4qHXmQUmwHzsvTz5NVSjDgQBtCKoghI+JPUxdbX0X2PFT4aR+Iq6hFzzMSBLS3650NT8k3tIlm3zi5azspW8U2hY2bBIIeeewqn4lPKslJpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788486111; c=relaxed/simple;
	bh=txJQx2XiWNYa81BDBJCSJ0dJjiCn+Gz8ipMzeoBE1s0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nGdxbNqE7pQI2TFvbEXr9c2y1fitGLjePPq20aMAiuAXE1k1gcCVTKyOZk8KOxDCkC0RvozHIWkWXlH3LxCm1c8800DBIbzVzmcxwT5hk2x6LUQ4fxLZpJjFrB0gVHKJ/1I8hVOtkXlYSqzDhVHKaE+AiGtpXnex+2iekYTWJJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHKW1feG; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHKW1feG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788486109; x=1820022109;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=txJQx2XiWNYa81BDBJCSJ0dJjiCn+Gz8ipMzeoBE1s0=;
  b=LHKW1feGH6yPaJP1tSpJ3uSwi3qj3s9XDAkIqUhLEX4yZzQP9MkxIYAh
   32T+gNEgoKj6qPVPIOYOKC2Qs8Ls969KUkEy2n2L/wNF9Ypw7+Z+hzi5R
   kc0+fhwnMVcn4k6lWzCYLxKZtXsXRdv3FVIBTW4ZRBWiDA+B3yJqsTYEl
   dOdl+75ZkkQTitS/wdNET0EpbU5na+4ESIeyNt3mTADZK3pQdX0UwPOO2
   8V33sB42EVV8S4Ezu9v74io0OkGa0nXNWjb6my1UtPr1gjjKNoudOj/Hn
   Ug0LzzedFn17FWpFCCkLrJEgKF2/JTEfGCcIFrg4uwiApojB+lE5fPvT3
   Q==;
X-CSE-ConnectionGUID: +FsVSOIDR/qftz8AR6SqJA==
X-CSE-MsgGUID: CyeJ6CCTRDmd49LOi8KJpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89018334"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="89018334"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 18:41:48 -0700
X-CSE-ConnectionGUID: kTpvfmIORHO34gZsjR3gug==
X-CSE-MsgGUID: 3IUvJuCiSgGx7ais3VM74A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="263703718"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 18:41:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 18:41:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 18:41:48 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 18:41:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tk4sAwXwf4UZfeqI2WbCh+N7EJQlJuEPP3imuYnEktr/hTOA/YeMESgUJ05ilFmRIC2iHJfVyeA/lzTaQgYZHUhttonXqjkzw5fytEGF2Wkl5u2/iFoOQ4AVKc6YMdaUTGrzVaTbn9AP1Sz1A1vyEKukNGUKw0W1i71O77IHEjS1qdSDWlfzsi5rbsZ90hKJ4CW3hFjo4j6lRKj33yZQkLI9J1cHdUqX/z00hUTUsI4YHLBOiqwV4u1iYHwScZpDHTyliUp8U7136D/GVSXFjKRwRuMsj7laIX7+Mt6gFWyLt2MZN/whIaHwV5cbmzgpHwbEqM/X2JOQgzKNUP7TZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPJIXBHcCcZm/1X7YiU1UBcew2ST423BzLXEEClcyqQ=;
 b=E1nBBPqlxSvce4AyQOqRTWFghrAsqJD8ZNqhk/e+Cct73DLGQ7zW7I74/G0YUE1XbeRUjx4CJ0gYlfbEeMiCHBJ+XVPSi2h33GUOMGCiJLFIIMPJuZKaA6ZjEfLuNdUpG+pZKri4lDoEmCUjR4e7q23s4Hk6HBg1/SJLSlJQAm6M2MF50U9NTD8mQ2daWUJtKKh+T0Riys+jUUwszg+Zz24T/Az/n/DV1o1i2rBl+BHu26rUr/iVrzzYQ7Sbv8piAb+TUhCo5q8rxpMo6DyOav+VKgXW3qUmc8ai54/5+KLDGfnNR2GvgtAsM+CiWIji10mlqe3SexsUVOlgZazP4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB8942.namprd11.prod.outlook.com (2603:10b6:208:56b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 01:41:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 01:41:45 +0000
Date: Thu, 3 Sep 2026 18:41:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 22/25] drm/xe: Add ULLS migration job support to GuC
 submission
Message-ID: <apoh1jwRR1jd5395@gsse-cloud1.jf.intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-23-matthew.brost@intel.com>
 <20260904003837.BD1D71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904003837.BD1D71F000E9@smtp.kernel.org>
X-ClientProxiedBy: MW4PR04CA0374.namprd04.prod.outlook.com
 (2603:10b6:303:81::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB8942:EE_
X-MS-Office365-Filtering-Correlation-Id: 5faf5440-d7ad-4570-2232-08df0a25ad73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|18002099003|56012099006|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info: okAbZ/cFlvLQ/81wTznex02wqNEdRF+2ATx6qu6z8LxxXNfg2xA9BjfuNAFvGfvEJ6A05zXGr2kzNuGavj1wvxOkOhX5SQrG4zmYwLqbIRD+bHtLKOIrcUL8z0mCKYGAiFKD5B+BlTIIGM3KNEyYxtzskdcG9jqlW5QCnZZye4i3Fo7IGETKeE0LMn8C/7TfpxbiNIlZZghs+05s02mBNkYTCHoJAVfedvxxA8PZPGIo1/U14V1azkkGjK49oKhdk//BSgeG6ALGwKq8peCS3b9wKb9zHGqKM9YMbaT45FSj3a/pa7FAdwBBR3R2ztNg2OX39cVlc9wJXBSi1pTpX2UmLBF1cFMvxhJIyQd9fuh99ngXmkn1SGwxYs6qjh4o7N8V7nYi6Dvl46UGvafHsjJYqKSpcQQ6nihaNWqyv1J6uiSO63NOJrSBBy2PAOp+/r4WJ0shNANIGdVs6Tipi1/RYs7l/VH97bkFiSe77z6BYstX0MpM/kW0WFjQ7qOCdNYlijKs3UWFaMnPQn09QdaZGQS4mJE9lY1eAiVQMLLsjZAXBUzvAqO1yTMLow3nrNw3wAnQY5j1qevnCPOhl40WC9BOz42ji3QOZUrRd34=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(18002099003)(56012099006)(11063799006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wIMVpI54sB991O3l3hdoKysMH8oCzAKkJG5VYHqqbEJYUzTHF8BIN/hKW3?=
 =?iso-8859-1?Q?5o8aLo4DBhruvxJgWW6+QZ7a7UT4UcKu593EbE1iBKGf2Wcl/48j5GhK+v?=
 =?iso-8859-1?Q?wI6bC7rEwzfFAUJKsPWPK0QP3vSVgqeKct4TL2aPJiWiH+7+tUXBPFB0ic?=
 =?iso-8859-1?Q?JA0FDaMRLqr2y6xBQ4gKnTIC/mKL48He3bf9dPO0LDe2tX5rTywdop7nqb?=
 =?iso-8859-1?Q?fGINwRZ21DtUNm2sVp5WFjOzom1K4nafo78dUmXE2FAs9tBNlOufGG9Ck8?=
 =?iso-8859-1?Q?zJT1yvXZYF9FrMjPkK30d7314juMKVvbvIS4ri6wNsBjKJgDOs9ghedVl7?=
 =?iso-8859-1?Q?tAXpGwVgXOnEsztOc91VZrMWFCJ+XswxXbkvqhwZRio6tlpyB11TM/72zh?=
 =?iso-8859-1?Q?UtC/gudsG0yYDpgcYSOicsep18GQT51z5/jWkIQrOlmmA6MpyT/hPvFCU5?=
 =?iso-8859-1?Q?eZ3My6djJ5DyqM83eO1QQ/o7Dyyo1BfiguUnAlv7eeTcrMcst9KlPzlq56?=
 =?iso-8859-1?Q?sOdP7p7B1dkRhegpoW057BuT+o7qxjc9U05m/TgMt8GQS26mOmMLTVGuzw?=
 =?iso-8859-1?Q?aRgUtjM1T4SUTINTgGXnpPxjPFNrXu8Llb48NInMbidqpZuh6UO07wnMB1?=
 =?iso-8859-1?Q?0CVk5ZS/Hukr3yqjCHEgmrF2SpEZMSnVz5Y2MSrQO51Kn7xJYrkxh4TNFO?=
 =?iso-8859-1?Q?drc+W5i9zoJFiPH6oGjF2LKFsMxJr8R0+YnQLDmAJ31wiRPXfiqkqJSvaU?=
 =?iso-8859-1?Q?kv0lH545zKJVpxlT0l9Zq98xfj0vJkOH71xgsmsSCA0cPGlwfb7QaZTz1r?=
 =?iso-8859-1?Q?UjjH8PhCpHQw72ETpw8fLkJluR2mR/pbSahb3PY3Q+4NaoRam7kvE8u3fQ?=
 =?iso-8859-1?Q?NzzflChcVQJmRKUtzNpZP8VWsekXhc0q7zPoGPA5mEOHOTcM/oZjUjCoVj?=
 =?iso-8859-1?Q?1p8/OJ6YM8HQPdh3s4tbilo+WM8V7qDVF9w27a/uPvjEeGEDNjO0irIt56?=
 =?iso-8859-1?Q?W85TihFrFZmYTGQrDkAOYpAV91rI3iR/n8eCsv8IvnuBs9/GxXVdMFbIhK?=
 =?iso-8859-1?Q?m6EH/Tqh6/rjME5vHoG0s4i/TqioKIlPcEGnLhhAEyLUGug7CJYgi+cQmZ?=
 =?iso-8859-1?Q?6uf/x+NDbg2VmaIbERuyX1abR950sahCZ2TwjGXRtP8Qj6gN3LhNlIGYpu?=
 =?iso-8859-1?Q?ov1Z/FRWZlgXbaICO0ONIaySPKdW9yMCO0A8eWjNjDpxz65y7Id9Z2oaar?=
 =?iso-8859-1?Q?Jp7f6fUXKQn+VM1LnKq8pU3x+qistN8TnG5cE0HFbA4MCS9+giobJFHlJ5?=
 =?iso-8859-1?Q?zc1WmXHnT1AQKXrBTR5XHqr+X2JhMN2qkFrPUGDZa9ez/Bq3lK3TY7H7kL?=
 =?iso-8859-1?Q?kFxeQhGRktDK6+HPOUUxgBgu2BNj5kjL66UiaJFZahAQluOZW7855FHk0Z?=
 =?iso-8859-1?Q?12k5+IB5tmVp+YDuobBl60TLssaM7syufnZ9NVsSEZ1L7p+pdXFvAQBROm?=
 =?iso-8859-1?Q?UXQwlCY+BZ2Vmkfu64q7pghbO408GxF97Ft4axO7kRCxyxSLiy4y7k/5YL?=
 =?iso-8859-1?Q?wmymgoTfrOya5CDeV/OvkXHQVFGspqivPbIZiTqkR5FKFOpQrV1Pm2ASnX?=
 =?iso-8859-1?Q?kQxAoiww8KtPRDOgrYwhCXp5/LR9HfRfc34p62lDKW//VbyuqrCOixMwXW?=
 =?iso-8859-1?Q?PMkBbnxdOrF5szJ74dX89lf5F6/C5HHe69lOO12fG8CYKN9TyRtTlPakvt?=
 =?iso-8859-1?Q?+ABIdWxEorFjMpS3cS4rXMJg+HFZncGwrrlx4Sz31EqTbqyLlfkHQNBS9k?=
 =?iso-8859-1?Q?A0aLFvEyRyRavsp3uyp26d+XvInFizg=3D?=
X-Exchange-RoutingPolicyChecked: gZnR8CIQZudPsBlBxmKxp9bO5izi8balNKTiArH1Nwx7M07S2GGbg/Nhq2D9SerNORRDDXOLikxzt2cibbFXRxoWJF+uz/pDr5CeMDKpH8Bx4Q46BUcak3/B2QMpH6L9VO4vC6kHUtjtxfaY96F/jtmvqIqTQnJR8qo0Dk4gvCxqtMRKKVBiwxxB+1dSNe8kVwzSOs9gBZ/hFeUY/qCj9MiGHg64vOpcrH3xWAsnqypAR4C1/WL70BR6DLRUQdFirAx00TRRyzDJ2OdWYolNgnoc2EDubQyUyKUGgM4JMge+EG35rQ+RasvUoFQ644j79kIZ0cJopx7ojnkw5pGXSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5faf5440-d7ad-4570-2232-08df0a25ad73
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 01:41:45.1392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxT8AAV6iNHRNz4geu1OkpYwibFBbRksglFdUkROGC2xlLbneCV5B4ZKvpwPQzEdLnqbTJ3gayxIZ55MhEybEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8942
X-OriginatorOrg: intel.com

On Fri, Sep 04, 2026 at 12:38:37AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] Direct MMIO write to the physical engine's RING_TAIL for GuC-scheduled ULLS jobs causes hardware state corruption if the context is preempted or evicted.
> --
> 
> commit f60d4c34d363517fe528679e6ff3d059b7861099
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Add ULLS migration job support to GuC submission
> 
> This commit adds ULLS migration job support to the GuC submission backend.
> It modifies the migration queue job limits and introduces direct hardware
> engine tail writes for subsequent ULLS jobs.
> 
> Link: https://patch.msgid.link/20260228013501.106680-24-matthew.brost@intel.com
> 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index dcb4b8a4f3b78..1578d80b01b82 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1207,6 +1207,11 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
> >  	if (exec_queue_suspended(q))
> >  		return;
> >  
> > +	if (job->is_ulls && !job->is_ulls_first) {
> > +		xe_hw_engine_write_ring_tail(q->hwe, lrc->ring.tail);
> 
> [Severity: Critical]
> Can this direct MMIO write to the engine's RING_TAIL cause hardware state
> corruption if the ULLS context is preempted or evicted?
> 

The GuC context can't ever be evicted or preempted as the migrate queue
completely owns the engine state which is way this is safe.

It is questionable if we should wait on the first ULLS job signaling so
we know the queue is on the hardware but I've yet to see any failures in
my testing. This is something to watch out for though - if we get a
random kernel queue hang, we should adjust to wait until first ULLS job
signals.

It we ever use multiple queues on the paging engine, we will also have
to use fences + ordering to ensure either all ULLS jobs are complete or
all non-ULLS jobs are complete before before jobs reach run_job().

Matt

> The driver bypasses the GuC submission interface (H2G) for ULLS jobs and
> directly writes to the engine's MMIO RING_TAIL register. If the ULLS
> migration context is not actively resident on the hardware engine at the exact
> moment of the write, the write will advance the ring tail of whichever context
> is currently resident on that engine (e.g., VM bind contexts sharing the same
> USM engine).
> 
> Since the GuC scheduler fundamentally owns engine context switching, it can
> preempt or evict the ULLS context for internal tasks or schedule other queues
> that explicitly share the USM engine. If the CPU submits a ULLS job while the
> ULLS context is swapped out, would the direct MMIO tail write hit the
> currently running context instead?
> 
> > +		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
> > +	}
> > +
> >  	if (!exec_queue_enabled(q)) {
> >  		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
> >  		action[len++] = q->guc->id;
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260903235842.3401722-1-matthew.brost@intel.com?part=22
