Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5654B0CA3
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 17:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790013057; cv=fail; b=ZA4MWicHQtQh66CQstTpaWbUQ5qr14JRfZ0SXOQzpQM11sMgmJz+G4nrRp9SF7+7Vq9jB2qqq2XkwnmzWrdEcl5Xo0Kk9TmrUE+SoluhrNuB1256OMTd8q6d/72rTVpep9ivJqLAqvU7qeXeWjMfBlGw6qkAb88L18D7hHwYPa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790013057; c=relaxed/simple;
	bh=Gqbd3dUMrb+NGe/AgOH+2x++DA/7oVvKjaJUkrNyns4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nDLTHXAL5pD8WGSysc225Q21cnQ8i2qorPGflkn4ZKTfoyr6MrXn85FMhOFXi06kwqD6p6b7Ey/ZgfPH+2z8v1xEaFydTHd7KNWjXZ0H6yqyvKzaPJck2SsOuyyyyqfLx0hmGNITADugw2Q9Xd7MIDTPxchdppV1Vs8Dj1ZvLKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAAyE2JZ; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAAyE2JZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790013051; x=1821549051;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Gqbd3dUMrb+NGe/AgOH+2x++DA/7oVvKjaJUkrNyns4=;
  b=OAAyE2JZYYkzS2f+51j9h3S2dLOJDuu4SJqL80IhWmXTokOLasquF8Y5
   firHFso/3Aq7zWfTE3m8zPhwj0EoiGWYCudt4x8HW7RvvvRUR5M7g3Jp2
   LNBu4v6xR2KzXVzOL2bk60VyRKXWGhT1NUK0hUXjvoiEO6s0Kkaha1zz2
   TyQdLYB8+lo56T5mxJeLsk6ktjIqua/ig+SngK8EI4ZWizdxzCUB8iALo
   9F4od6ThFzHDys7AeUo3L2mG/ofpSZS/8PdTJ+qwLiE83Ht/VpAQ24zP9
   vZN4CNAffoubQCDC0vYVLNh8ELD9BXBiLAMKmUZQGtcIZ5HzzkvC1IyMk
   w==;
X-CSE-ConnectionGUID: LWuz/NKORvWepziLggRS2A==
X-CSE-MsgGUID: Z54Q8Q0rRLWJtnEgOA+5nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89478380"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="89478380"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 10:50:50 -0700
X-CSE-ConnectionGUID: ONgbIu+uSre8CIkaxzoxSQ==
X-CSE-MsgGUID: LdcIJvvNTt2ClMTy2o8bCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="300714431"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 10:50:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 10:50:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 10:50:49 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.69)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 10:50:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6rAlNYIZNy9ICAsH8um2d68TuntojMlOEILl5VpgoJnwUP26PB+27DwrFcIk3VGUCQbqX+JDGE2hlBi5/K9QUZsQ/GTtDxjG1b5XfF+RGFY50SH+oiquKWhLgAkiv7XZVZAuugl5nyY9jZvFG17nShKV84IbN8MqYYrSQeVIpETlyOuQQOK6PFETK/w3yln0zSZz+NAfxMyQg5TQYlS5WEJrqgyZ3Er05EndRLFW7tHG51YC0E3toQTwTxgJldt5HZ1gnlzyhdDDmlZ6lFJ47KL30oSSCl58Fc9dRs3l12aMtAS02x9rfntk6kgWRdwqlXhD4tKoVr3o1T4NixdWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHxIge5bBDdkJPx9OgX0yh7pji5ZMq4kOzqfP6TAZIk=;
 b=PUtDBYD4Y8fcy/F/TYhZwknyM2nHhfDctzYyQ85SnkgZ6eLcVSJyqij7rYaYlbYIwxVj8zOtl1+YDyihbfEOeeGGxkyf9+1DVmCWnerV7XHpras0tUR7kRuETNezcYcFWS1rKsjXGBbAPx/6JRzGzeN/IJxXWO1X8oxF0p8xIrRUfkHrgMd65cXNfh8f1iTCSiDL9G32eduf2Pt1dDKHNfJ0XIgEY91l66nh7d21HsekSJC7cRRePjznA25XgAVoNCnvqPZrPLxZ41jT/7shZ1dCOE4u1l/RUiXIXNHbBZlYLP6ULdU0OuetZsp0TEJnTHP458cGMsd3uAZiNC0cyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 17:50:45 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 17:50:44 +0000
Date: Mon, 21 Sep 2026 10:50:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 10/24] drm/xe: Update GuC submission backend to run PT
 jobs
Message-ID: <arFuab7mgkAwv9qy@gsse-cloud1.jf.intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-11-matthew.brost@intel.com>
 <20260904213927.4860F1F00A3D@smtp.kernel.org>
 <26d2fb30-3188-4736-8755-1d6b52e6baf4@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <26d2fb30-3188-4736-8755-1d6b52e6baf4@intel.com>
X-ClientProxiedBy: BY1P220CA0041.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::13) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS0PR11MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: ed808651-4bfa-4954-34b1-08df1808dc47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 93YmRQr1z5hEoNPdXyTUZFkIIZl0e7w85mJCp4hlKvAGgaEf1wNZEDfdQiVlTCnbu4Z7rKEDliJiS48qhp4mDZP0ApNMukVH5IwWiHSjYN51d8/lIXY32eYJWi7dwAWBoXoTveMST/9VgmLg1nMANBl0lV89Su0Gyr0Em/HQYnlbR3bO1MAextrLJ78HV4k5v+EuxmnVTMuqr8YF1okvuxKD//C78wAg1oSoBPJIrluTTHqoY4QFb/v8ixRUPmVZqdwIDyLeNJj7mPShh9Kek56h2vRhQDfjX5xcMSuGiv5RFjqBY1J79lAgNlsNMb8wRWb7BQqRLVQMtZLYIOkU2/MIyL8IEWPEJ9u6c8V2xp/E2M3diNvzBvdtplDMd466aQs5QB/hUE/0joPOJ95Po3rrWq4ipZi0Idt57ICDkaK+Q+Nje4hzNg/qlTxptD/oRYJkzzVHx26/A56+wcnQfo3cps3xgfe1qy8/QhAyyNNHWaxN2TwcaKh3R7DzOn5b9AQ3Iu05SOGMGVuxjl3Usyym8oNP3Miba92UKY2DmTe/fDhM9HGOyeyuyhR4+25jhYGHe6ayZGbkPazl4I70eM0Erw7DR6nXHLEyWNnfMCN3ZJxl39Dp3GfdSKRQfwK2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jrSh3DYbBDzSE8bEZ1dr4tXgi3zqpyHfSyb6heW1lByc4TOtqSiY9nwQYyH9?=
 =?us-ascii?Q?ILaB0ogUsOoSXyCov2+ooktACqWlvSjSuXwM0+D05p7lgYLhm5W13ryq5qep?=
 =?us-ascii?Q?K8W6X56B/zSB7z3Gxqldzqmzs7cdl2iERTxJWdecz9LIAMwq4aYpL/BhNyRo?=
 =?us-ascii?Q?Llzpj6VwfEEioGQsNeFkSj3qbvPS/8YAFUoCE+6RT1ghzit5nUJP3q2wLTh0?=
 =?us-ascii?Q?IQHSJHtv9T/K8quOqXkrK/bI0RsfaSYFlmXAoP3MAqc6z3qWFrLj4SaJ4exI?=
 =?us-ascii?Q?RG56NFHQMJhIyvC6P40W0o2GJzbmvGKHSWAmkIFpc8kioFYZbA9GmfDJZ+4E?=
 =?us-ascii?Q?B7RQIwdwoioagJ9Q+3UvljjXC6vFZKS7CwHOw0t9vAiXca7YkbAgxumF9yzF?=
 =?us-ascii?Q?+dyBZTRVOl7ga+yEHUflJ/ajLdEm+bekmmGshI6pDC07ovZkgDp9Vmp4+GRE?=
 =?us-ascii?Q?LPrGxiBN1YdVrkMTirQ9QW3tdHIMJiE+tgoq/SWmeqnnePyTYy2wzd/JEDxd?=
 =?us-ascii?Q?eQDkWZCbroYPX1bP5veUbwJy+o3SZottot8aMboqflmU14rKsnJY/M1DUdB4?=
 =?us-ascii?Q?vjPaABITlX2q2gRU6J4ZOjf7JLGjC7GxqevrOYlKADtdhdP7idTTZiBWS0Qt?=
 =?us-ascii?Q?v1W8ul6/BSgd+kB134yScjtELlV4CEdAMBHTWr0qSBPhyFXVuOobV58+Newb?=
 =?us-ascii?Q?svV7xPh7zfH1P06TjXdovOj3NSyWZE6cH4QVTy9nb4UCLQ1PZMgYdcfS9MrE?=
 =?us-ascii?Q?r/BkWLc+nUyYl16qgZBvKyVq94D+qHQ6a23E6dzRIB3g1ToRiRxY6H5tDacm?=
 =?us-ascii?Q?Za+FHFePnFvkGtCJV5uI2B8h9tCdIAt00QVdEIif6lJQq5MofSnp5TK9sVO1?=
 =?us-ascii?Q?IPvdRFd4pzdCbLiJ5J8iy3S3Ohz52M/ksLoha3NrP+19ue4EuSRZsm8PcZcm?=
 =?us-ascii?Q?3BmCZsNuWjpUTPpbX1x1ECLPIRCgEtJTcr547vgsBUL9lg0N3rUUkGvJag7j?=
 =?us-ascii?Q?YC5RUQ0UzW7EerYyxUwX2SVtnzHNd4CnZQOmE5bwf9/PWuAHZYPpWvCtdtKC?=
 =?us-ascii?Q?YlP/b+hEPo3NDknxEMrZdRVqgFXx7euArXt8TmM6LIYuXqOIWlUoGJH0KEyX?=
 =?us-ascii?Q?XKarYliC7YTw93pzGM3XFByxDJyOV58+2REP/qA1mVaSweG+G65iErK0DoCf?=
 =?us-ascii?Q?bxTYKLO/SRybkTMS4K50rj3fzN3EMvNG8Wzf6PIHnmgRDQScb9qQtpXe5egD?=
 =?us-ascii?Q?IShKLWb0dKx1/Hp2xqtBxvM1OJRDBQvKawToyNY9hClvYIw/9UP+nDrDUccS?=
 =?us-ascii?Q?/R8602ZO32WMXmzahyta61WsYqBDWhUZObYrAEbn8XHdRcN5EqilheugHpkN?=
 =?us-ascii?Q?9X+GsT7ibdYxGvMu0HuVtnXZoaPPr+ofiqwYRlaBbMEiOZYAdJDKAIPqOyvj?=
 =?us-ascii?Q?nGj2q6hGARq6xZ3Ze1MMSTO3PgW/5DCZduyuIOdgfmqW+0OD05l34xurHlPf?=
 =?us-ascii?Q?6G/g/lI++wKIcDeG7g9/3C+zV2ywfMZx7ju/fgKzVARFJAndnFrA4Vw17GcB?=
 =?us-ascii?Q?gOlx+jy6RNcW8YzaFOy9Pyu3fy6/kIlOIhcpnHYT+BBPPDBG0bMEY58YRxMy?=
 =?us-ascii?Q?3cc1yUL6xBE+nzRlyKvPv5t+Z4xGPjxWUMoAETcM70A9S54H74TO9Xxidk0h?=
 =?us-ascii?Q?dIwj7owUh2O9aLBmeJunXnXDKbs/oFCJq8QncZ7zky+kTmGNg8WMjAi42dVN?=
 =?us-ascii?Q?G2ZBcsjZ9A=3D=3D?=
X-Exchange-RoutingPolicyChecked: f42Lm6oT3pGR7T2/bhpoS55Kzfue3LXi7WfXktP0uEbM+sGMXF9IXSQ98Mx+HGFwtyPsVUs5SGkgPuWhx2xgkD2/QHYf16/mu4g91VgXHDfiGWKyKDNHHJmgMjY9WGmwF/NXZApTk6J8i3Sj9JBZ4FPH8NiMudi7feUkPpxl5UhhvSXwAGXRrqCXepbwgAxclS2GTxb7AHupG8yr41u7V1WdszlEYB8JV3JlVzUwjQ/QKsF1/uYerXlhErvHjAQsMdK6/hnKSbUdRtdRITSvXPjSY6Pvab6nzK9dI3lwYBOSLsArFuxOIYKdloRiottilaKcufZVdDtbwIguv5YkTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed808651-4bfa-4954-34b1-08df1808dc47
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 17:50:44.6820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bem4mKjNtVkxmUr0TNzukjM77A/SJO8zuMFdPUy0D0q81HnNen0IwAH2WZR5FWJWHE78mb6Gaikk4qdDPEB5bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6445
X-OriginatorOrg: intel.com

On Mon, Sep 21, 2026 at 05:25:16PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 05-09-2026 03:09, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > - [Critical] PT jobs swallow dependency and cancellation errors, silently reporting false success and potentially leaving page tables in an inconsistent state.
> > - [High] Memory leak of xe_pt_job_ops and a dma_fence reference when a PT job is canceled or destroyed without being executed.
> > --
> > 
> > commit c6e167292efa7934a75cd29809e1057eae0d18c2
> > Author: Matthew Brost <matthew.brost@intel.com>
> > 
> > drm/xe: Update GuC submission backend to run PT jobs
> > 
> > PT jobs bypass GPU execution for the final step of a bind job, using the
> > CPU to program the required page tables. Teach the GuC submission backend
> > how to execute these jobs.
> > 
> > Link: https://patch.msgid.link/20260228013501.106680-11-matthew.brost@intel.com
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 8b8673f4e037c..b7ec96650405a 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > [ ... ]
> > > @@ -1262,14 +1278,25 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> > >   				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
> > >   		}
> > > -		if (!exec_queue_registered(q))
> > > -			register_exec_queue(q, GUC_CONTEXT_NORMAL);
> > > -		if (!job->restore_replay)
> > > -			q->ring_ops->emit_job(job);
> > > -		submit_exec_queue(q, job);
> > > +		if (is_pt_job(job)) {
> > > +			xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
> > > +			run_pt_job(job);
> > > +		} else {
> > > +			if (!exec_queue_registered(q))
> > > +				register_exec_queue(q, GUC_CONTEXT_NORMAL);
> > > +			if (!job->restore_replay)
> > > +				q->ring_ops->emit_job(job);
> > > +			submit_exec_queue(q, job);
> > > +		}
> > >   		job->restore_replay = false;
> > >   	}
> > > +	if (is_pt_job(job)) {
> > > +		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
> > > +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> > > +		return NULL;
> > > +	}
> > 
> > [Severity: High]
> > Does this code leak the xe_pt_job_ops array and dma_fence objects when a PT
> > job is canceled before execution?
> > 
> > Because the cleanup operations (xe_pt_job_ops_put() and the extra
> > dma_fence_put()) are tied to job execution here in guc_exec_queue_run_job(),
> > they appear to be missed if the job is destroyed before running.
> > 
> > Looking at xe_sched_job_destroy() in drivers/gpu/drm/xe/xe_sched_job.c:
> > 
> > void xe_sched_job_destroy(struct kref *ref)
> > {
> > 	...
> > 	xe_sched_job_free_fences(job);
> > 	dma_fence_put(job->fence);
> > 	drm_sched_job_cleanup(&job->drm);
> > 	job_free(job);
> > 	...
> > }
> > 
> > If a PT job is armed, it takes a reference to pt_job_ops and an extra
> > reference to job->fence. If the queue is killed and the job aborted before it
> > executes, xe_sched_job_destroy() misses the xe_pt_job_ops_put() call and
> > only drops one dma_fence_put() reference.
> > 
> > Can an unprivileged user repeatedly submit PT jobs via bind ioctls and
> > immediately destroy the queue before execution to trigger this?
> 
> Seems really a valid comment. better to handle xe_pt_job_ops_put and
> dma_fence_put in guc_exec_queue_free_job ?
> 

I can move this but the comment is invalid. Once arm is called, run_job
is always called - i.e., even if a queue is closed we still get a
run_job(). This is existing bookkeeping that certainly works.

Matt

> > 
> > [Severity: Critical]
> > Does returning NULL unconditionally here swallow dependency and cancellation
> > errors?
> 
> How about we return -ECANCELLED for banned jobs here  in
> guc_exec_queue_run_job?
> 
> 
> > 
> > If a queue is banned, guc_exec_queue_run_job() skips run_pt_job() but still
> > returns NULL here, which the DRM scheduler treats as a synchronous success.
> > 
> > Additionally, PT jobs are initialized with a stub fence:
> > 
> > struct xe_sched_job *xe_sched_job_create(...)
> > {
> > 	...
> > 	if (!batch_addr) {
> > 		job->fence = dma_fence_get_stub();
> > 		job->is_pt_job = true;
> > 	}
> > 	...
> > }
> > 
> > Since a stub fence is permanently signaled with error = 0,
> > xe_sched_job_set_error() fails to set any error state, and
> > xe_sched_job_is_error() evaluates to false.
> > 
> > Can this result in page table updates silently failing while reporting success
> > to userspace? For unbind operations, this could leave memory mapped in the
> > GPU after it is freed, potentially allowing read or write access to reallocated
> > memory from another queue in the same VM.
> > 
> > >   run_job_out:
> > >   	return job->fence;
> > 
> 
