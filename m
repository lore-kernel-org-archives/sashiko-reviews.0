Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9B53CEB90
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 07:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790320249; cv=fail; b=HFtmlJyswEEak4/wC5Tqvjr+LFI6V2nMj2rSdxNOajPyMGM758F6NxpS09mU0h19XCW/xcSrjelEHQMyAbDz4vmiQSFBj5+peWCBbcQBdvpg7uqJcP2NG4kDdhdT1WPwDSP6nFhBNmDYJLIbVkWrojsjrDkALp79dNH00Liedoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790320249; c=relaxed/simple;
	bh=R5R6OU8+mxvrS9uHb/30cqRQBeJNXmbb9W/XGaBM7AE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lydZb23JeC8QyPzKxDKD5n8w0WS41BOtqTLHkp/LTJipMzHqoAqthjP9w9NHh/ydrsWqBe+CffZ4HoZn7WMSxBUIDLm713YzEqBe3YoLG4Dag22l2PUOHJUKICx3kZ+trxHzIL599ykPlhXnYvt0Tz6CTKeyY1maAdWnCZxcpDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndYwWcNN; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndYwWcNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790320248; x=1821856248;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=R5R6OU8+mxvrS9uHb/30cqRQBeJNXmbb9W/XGaBM7AE=;
  b=ndYwWcNNbvX3rQWE8foE3KdtAqVszovXIvUlAR/4yYb+RxxHt4VzViUa
   ZIM6ruCH41G80lWARSR2smx2tCcdI+BJXTVlWX6MRPcG72u6Eg2ev/H+3
   Uv+q4b7YvcmMx6/0eyrrkVvLpVJvviXDXUs5vlETbXDaYxN7N8wK0JnGQ
   mANifhN+VYGGxrnyAmjm4x0wFdJYWmCEjcP4gZNWfb0CBWCplHEMynRR7
   L2SDFi25cyzuYOpjcEo0QawLr22OapF1OhwlIVYDWyyoB7piJNl60HoeH
   Z0imqlh9hTlcfzZlKsnRPjrAtOOO/o9YYscqAN00865xUnZl8C0QijmkI
   w==;
X-CSE-ConnectionGUID: m6SbyUx6SXGU9v8aWk9XQQ==
X-CSE-MsgGUID: CPU31UqGTjiX2xH1CB1ciw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90062126"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90062126"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 00:10:47 -0700
X-CSE-ConnectionGUID: 8w+/eTBqSoeVn3ty3ChvhQ==
X-CSE-MsgGUID: QdwTmZQxSdCo6Z4+oeAbSw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 00:10:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 00:10:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 00:10:46 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 00:10:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRSJsoouqrCx/9x06B8yBhqGrZXNjNNAAhyrYOx+/Uvx4Qy7Sac9sIaRQouXKHEO+Ug9HwJHAoBPq23RqHrmVAL8vncv52qzkUcyfyLVAQSr31lLSwz4EYefh5S/JemBCtObJv2zZ19xXvDYt0jBK/IOx5sSNb0wXcpjdsQo9+rADm4U5e6ZXLxgZmd4PXSc2sd3SmvXqAZOmGnq38n3mCjOqeJ7KpAx6uT7s/apSrPptmErkeoN5yF6dVUcw31Sc/dz8ss+lPxUCQKZ5XzmtmlAiXL39sBa+ULX+CrTCNw02bWWc8INonf+XVS+pf93laEzbeR5IQoHERx09lmKPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThzaMR1p3WLT0tM1XPzGFlqcJ6Da3WLA3VI3DdZ7BHk=;
 b=ScCjC/NhXWFHioKRlx1SYvi+LBhKy7V5kZQKfzflTzx8Ose/JZCWJbwsl3EVE0WNkqOn8sl/lAzxqlGAqJPqn2r4s0SN7Pp8Ld9elqE9MMhsgayxTP6JUfYrC1CyTC9K/AIpvEQNRDANpoNyFdOO//qs+Cit4aoJIR16s3VFa4sSi/axZpwrOxFUliS3Z0pEncgdYjw385jGXuWz627QVLRtzmq4sHIH9Uns8OTPGOqyWEdPyilu35W5IqlxnnLdB15baNf7Y0QMOSbLCSDaXFpKHT5lyRxYhQoxqSp1XjjsJxUGjAd1HTCLeQK3SbDnfUkaX2ZDoCxEYuvrXnKXZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SN7PR11MB7065.namprd11.prod.outlook.com (2603:10b6:806:298::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 07:08:17 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 07:08:17 +0000
Date: Fri, 25 Sep 2026 00:08:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 21/24] drm/xe: Add ULLS migration job support to GuC
 submission
Message-ID: <arYd3ihnEYklAbpR@gsse-cloud1.jf.intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-22-matthew.brost@intel.com>
 <20260925064857.7FE391F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925064857.7FE391F000FF@smtp.kernel.org>
X-ClientProxiedBy: SJ0PR03CA0186.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::11) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SN7PR11MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 7362a6b4-9c4d-4847-4297-08df1ad3c5d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|3023799007|6133799003|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ozqdFA1ayTwUyK/zlHzyxbwVtA4TMDhrtBmQq+L4huMvCAdYqyylkiiQcQvip3hl06HfRM+9s/94yo9SnqUj3YAfZrRmtwazlQ8QoZGYLjnFKNDbectMCRl5yzxI/9UeIiZPJeXMM50qlA7q1fgscSVcZ2IRl4AFNMnbenXBkSnfgLdDkdv+kc5I+RG2SRGR0L664mhhN4+m1dnM/hE0Pqp4ydvzLAb1Vp2Iuv4QPlTdiCsidmHLFnk37L5H1V8VNWR5pIB4V+uxplOBGpv8grfbs7XNyfLw3QlVl5qAyoV5Q5mUzrzISzSqD52zwUVQDqK/UXgeDn3M2JFxIAr+gysexcnUEvr4a2QxcDrZ4q03UI1XlvgCmeJznvq4vI835ffUqjDGbBJbjN1Ihtjy1gpjL71ih1xug6VEgLfYgx4nusz/Kc+8ApyrkypYx6MxMUAoGywr4dZfDwuPNcNd1kN4evT6SSOlSv4PAzkCMYhtjzMFuIFJR1Fyi/wlAuSwLgtYQ3PNijuMMom9VqHoiUmKzA/aNLpEou0t3V33lhi7bxzroRGIz7ue15TfhE1uhGDzx7D4tzOiLFOyl2sE9+y9e5kgYAkybu+/NiJqJds=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pydW3k/RhriviCKQ1F5LFRx9MoJXMlb2mh31a9ER8S80TRTFAtacFbRHvq?=
 =?iso-8859-1?Q?f0HfUnW2dt5hx17VFFHU32eB8GskonHK1HTFAZWzjDAmEb4d8sXNqF0zkj?=
 =?iso-8859-1?Q?AERYyO2bqx+Ds8oj3qJggt6lcVw+fTGCFvsEonEyI/NeMgiBr2RHG+HYOK?=
 =?iso-8859-1?Q?wi0eHWaWA6K3iDf5y1F5XNE7PEwMSbEZSPyWEgZBeVDqucEH7QfIs7mBsY?=
 =?iso-8859-1?Q?WAvdE8H3kRWzABUCuslUcNWI+zjYU/D7MMxPxN5Iaofi2UUkXEur50+7UO?=
 =?iso-8859-1?Q?fxgjtoieC703wSChcjYQXoZ9jwvOd9X/wB4k3QK1U4cYlqEHjYdFPVsWNq?=
 =?iso-8859-1?Q?S2jo8FPvh/9Mh8mu5vYww1CxmiPse/rSgeWCs8jLzpNZoAaretYL9yvedk?=
 =?iso-8859-1?Q?QuImZn/wL/RLr1qWDLNCC0NPm8xP/Qpz7R+E50kSWsVWC+M9O0SDQjEpcq?=
 =?iso-8859-1?Q?2pkxci0iMowYZgT4GhStrktRS+Wv+xVENTStAmYqLBJZCSOHU6BQbyEDcU?=
 =?iso-8859-1?Q?R5gbuFqyPtdVzKR/XS5pfhu+zEv8OA4//L/UbmhyhrYhHUO3i7Su7yVB4d?=
 =?iso-8859-1?Q?d52WG61Q8XE296J/mkJQW/4aNZTxZ3XJIgwCEeMcO5KW8EHi85Myio9+NA?=
 =?iso-8859-1?Q?0XbHd7U9ax5RgwmtAVYRNOsnTlYeBdFopMtt3RXyZ7TpBbDNEYrob9gDii?=
 =?iso-8859-1?Q?RgsWnsBvYQmhgk3lby6OvltPncNtE2L+vLRUriY6v+wDjk6UbWbczYK+Bz?=
 =?iso-8859-1?Q?fX6DX7aQAPwW6EHgZcuNuv+4HYLDU1Hnlrmt/4fv1UqmHoGzG0JoxGNd+D?=
 =?iso-8859-1?Q?jr5cRQ+R7gbzAv/Yzq2VhZxOPQKgfO+mS0a4LaRrtV3bkjro/1p7yqV6pG?=
 =?iso-8859-1?Q?dN7VaR3LUYvBvF97wbW8Yp2j+gEK6cRtIOIPUW2TGLo69MEfiLIfuLLcGV?=
 =?iso-8859-1?Q?JZ1/IKXWArHIl4QyDJP6wYbphLPkWhI0FVe3rU1xRwiIDsT/1Zp316PxIx?=
 =?iso-8859-1?Q?hFis51dYsX7KI0GC0JNRCMoUI+M5IojvWkwnf6cUZmX10lEfAIBZ4FQaMa?=
 =?iso-8859-1?Q?H6/UTI5mwM9/QoL4u7nTFtuFaNc5SWXiIb5fY3Jqqk2Ew1kglhAnIcDxDT?=
 =?iso-8859-1?Q?+A6iaj3+Zl+QPzK5dxsR60GSx81IjByvyGCPzK88XCihaaSjF8ukiowlwX?=
 =?iso-8859-1?Q?2D9m+556U2qUNJ4HA93Nppc8nf6Q/j0igHycXuKuoEZyzJ14XcvTeMwPu9?=
 =?iso-8859-1?Q?8/bgiKvrpuYNHi/+jzOVx0zYM+N1OVFzc6aMenc2xv43Rb0GEuioo8Tfx3?=
 =?iso-8859-1?Q?EyS4H7FlJK/dJ06CeILP/HjnXw2mh5pYayVyZvBy8HhSf/wUit4/MV2j/Z?=
 =?iso-8859-1?Q?Z1PVvwRsJyOhqP3y27+2UvTHc706SySOFsMXZtt4HOhx0TiJWgLeMdF0vR?=
 =?iso-8859-1?Q?bLpOewkBocidRZtJjlKuzhu0Hyy5nKVi9J7MQ1GAw+4G0f/VoPBwKT1imW?=
 =?iso-8859-1?Q?7PeAZRDr7CCDcVf5Uuokh6v+ulyX7kHh2+8xKfD6yh7K0fdLRlpHogHOs8?=
 =?iso-8859-1?Q?Ir32DyLb7ziKEmDAMywL7Zz5EP6U5fXiAaPFg2870X/ho9U0QbnLCV229W?=
 =?iso-8859-1?Q?a7TubFxwyHNLxS4891/zw8TaEpHpgbwJHpMP4I7XQ9b3xv6G5KL+6TX9Dk?=
 =?iso-8859-1?Q?xdShF/lhyv8qbrHJ+HEF9jTxM6pRUe2aWJoNhDvt0yqL3xm8xP0MEeoxaj?=
 =?iso-8859-1?Q?nNmu0WQ4a31qbn+zRWdAQEKAZmC0dUNvqrHCnXgh3U8VbqluxgFwCReYwv?=
 =?iso-8859-1?Q?Lm+Wngk4gZAguyEhxmlUP8uuB4XSKKE=3D?=
X-Exchange-RoutingPolicyChecked: clVbLMZ7F+BM7OWGMEFhmvWHutPBwZg3o1LFzvpet+zEHrx/IO5e2iNs9BqJIdr6EhJgYkgjmVHOBePAkj4M+SX1+ETI6yTXyGdjf4shuO5ruuX+cnR3IDLcnXXKvXt/u0o+354MAiiN4A+j5fugBmTtstkkB1RwEf9zYA0Zi6dWeokyKhRLaiSl/+vDF3A+NhNReCQZcSdtDLGJzBrztwxnB1aKzwaQpn9jel7322Cqoof6kpeSqD1Apz0b3OZh+nUqEZMosKIahdwzKheJmG5yDuplmw33rykNijfxx56wdI1DnPP+wL2GtB9lIB/9D2gOmm1/BZDfC7jN7rTs0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7362a6b4-9c4d-4847-4297-08df1ad3c5d6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 07:08:17.0302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tme8eWXBEoThkjVB4iJ3u53+Hsl1JSIsm0tHE7rTmrwmzLYI8XLFpacEmH/268kReDA/9lSTPWK3YXPb+xl7fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7065
X-OriginatorOrg: intel.com

On Fri, Sep 25, 2026 at 06:48:57AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/xe: TOCTOU race in ULLS migration job prefetching leads to stale command execution
> --
> 
> commit 231db353d11582f236795322ee38df1ad9cad0d1
> Author: Matthew Brost <matthew.brost@intel.com>
> drm/xe: Add ULLS migration job support to GuC submission
> 
> This commit adds Ultra Low Latency Submission (ULLS) migration job support to
> the GuC submission backend. It introduces optimizations for chained ULLS jobs
> by having the GPU publish its own ring tail and suppressing the CPU's RING_TAIL
> MMIO updates.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index a2784763e72ba..cd9bb9f9e28c8 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1190,9 +1190,10 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
> >  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> >  
> >  	if (!job->restore_replay || job->last_replay) {
> > +		/* A ULLS job past the first publishes its own ring tail */
> >  		if (xe_exec_queue_is_parallel(q))
> >  			wq_item_append(q);
> > -		else
> > +		else if (!xe_sched_job_ulls_is_chained(job))
> >  			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
> 
> [Severity: High]

Not observed in testing - semaphore wait acts as prefetch barrier.
Before semaphore release all CPU writes are GPU visable.

Matt 

> Does skipping the RING_TAIL MMIO write here expose a race condition where the
> GPU could execute stale ring buffer memory?
> 
> For ULLS chained jobs, the GPU advances the tail via MI_LRI prior to executing
> MI_SEMAPHORE_WAIT, which happens in emit_ulls_postamble():
> 
> drivers/gpu/drm/xe/xe_ring_ops.c:emit_ulls_postamble()
> 	i = emit_ulls_ring_tail(gt, lrc, dw, i, head);
> 	dw[i++] = MI_SEMAPHORE_WAIT | ...
> 
> Because the CPU intentionally skips the xe_lrc_set_ring_tail() MMIO write for
> these chained jobs, the hardware mechanism that normally invalidates the GPU's
> instruction cache is bypassed. 
> 
> Could the Command Streamer fetch unit see the advanced RING_TAIL and prefetch
> memory for the next job before the CPU has actually written it to the ring
> buffer? If the CPU hasn't populated the commands yet, when the CPU finally
> writes the next job and signals the semaphore, it appears the GPU might wake up
> and execute the stale prefetched instructions from its internal cache rather
> than the newly written migration commands.
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260925045320.1325860-1-matthew.brost@intel.com?part=21
