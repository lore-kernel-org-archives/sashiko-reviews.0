Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1173344DB1
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 03:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860856; cv=fail; b=FVCcMAEtAr88tW+vSvLcAPs4olcpaC1Z65cYdnVxKzHtiJK1cAfcUU4LzIEFCrlNxtNn+iSloaQmlaplA32+KjYFdQDQGb5mEXNma5nF+blf2cYz0oPwTu4ub9dYz0e5IEyILs/mbbERhyIABo6mhBx6SRCa+MwDF5nnlbxwILE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860856; c=relaxed/simple;
	bh=7FRSZ1MKDH0yoU26mp3DLnTeSCatQHLv+6GagsVSUeA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JD64CBZ7RtBESdyugD7Q7Q7rzjEkT2DJY7vqSOuDLe8ZmLp9QaD7oLhoKQoJYlbrO1Hox3JKS1vnbdb2vzLQDZuf88nkdkWKr0Dl8rWxNnHXF8mgMyQSA5ECSgOug7+quuCLeZX0AjQqnmpQiIojanoHINFlFBhejI2qRiH6WhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfOUY3vw; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfOUY3vw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791860851; x=1823396851;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7FRSZ1MKDH0yoU26mp3DLnTeSCatQHLv+6GagsVSUeA=;
  b=TfOUY3vwAt038dTFhdGd/GcDRxgOAmA2jXFpjLBzR2V+J5Cmm8R1LPF2
   LbAp+GfFgxuO7wvyPno0kdDIZ8FnpXl79XctQsPAEOSFCUqUh92aZUF1t
   zFhZ37t859MIIJTmEzmTgde0t6+GJtYGCFVjhgNGvATtqc0klDfVQjlQi
   KuiyXebdzrcoGVEulfFPyhEvkzZi4I/vJYgtZlmPWDRoSDu3+G4gs0fdC
   Bz9IUT9xFiwEFyeMMCxjZJ5sPqrf8sFAmx8MfnD7AkvfiAtSBHndi8b30
   RhneNkPajiKH6exMvYnomtbsyWa4/nN//ljql9HkYphjCCbzdjPONtet4
   Q==;
X-CSE-ConnectionGUID: G3xpQ5QjSBuDABzIW8YXRQ==
X-CSE-MsgGUID: +SSCQDK8TkKk2Aom0IYmsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="607748"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="607748"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 20:07:30 -0700
X-CSE-ConnectionGUID: MyO2VRNsT/Oe1PZT+AtR3A==
X-CSE-MsgGUID: vKdAHspFTKKpL3f3XpN7nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1368805"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 20:07:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 20:07:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 20:07:27 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 20:07:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFBtr8kBEYEFuZuqUKJmUaLvmMKJn5ILcIbs51YRygtlBQEzaOPDkGFldtlcHhlhLeOQu+eb/BjgMWzeihFUpDXsG100XKfDZqUuPtx+T5TSTtBkvC084tfd3JbaKws5pB2+f3nbNpoIOi3bze1W1wr4HAQnJHK8SvCfQqdZEb2aQjsb0xisLfbBNv8Us/6acorUZyHJMvnS2i0vRZJbxS473Gs96gCpvBKRyh39FcPqe0y86y0q21jEKc9glqqhO28S5AeS3+vCeMzVHVDdW4hEmaiw6df8Q+gOpp3haPFZDFP5gFB64DrZWMC+1D2IAmXUrwrb0bo1J7LQZfgzqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqCC8+cOJ1cyRsgcruT5bmAcjQiB6wVadx/DTDi/C10=;
 b=kpr5YteItJG98x5wfEAPrsgdiVV0HIuoMZ8/BkuMM/0xCQ1xu+zEYHVb4/lRbeglLRvh+zvI5skNCtLLauhF56a+ndL+USOuV/ioW/cqx/Zhf3HhtDiyTnng0jAwcaj1kiEgwc5EBdbExrkwMZp02H99jHAnVQ0glnAXU+sHe/cNz/lwrSQusWgUuwoOT4q/MrbpDVOh/rXH0o+utnO9sM4vzRAkaI/cnO+PgZoq2rDH9WWsIZbtTHJgR1xy+DNbno0+CEzhqWMIFMioka7F16MJPlsoDzodvWhlDjEchnoO+c/Cr+NR9zntOaFQx7wl2T7EcR0UTDeMt9gZgwhilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 03:07:20 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 03:07:20 +0000
Date: Mon, 12 Oct 2026 20:07:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Daniel Charles <daniel.charles@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Synchronously wait for queue kill on FD close
Message-ID: <as2gZomTraTJsZNh@gsse-cloud1.jf.intel.com>
References: <20261013023442.206915-1-daniel.charles@intel.com>
 <20261013023442.206915-4-daniel.charles@intel.com>
 <sashiko-outbox-168881@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-168881@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::16) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SJ2PR11MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 216d3f02-59b6-46bc-52e5-08df28d718a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: Irxi7X6rkMmTTaV0RY1tVN7/qiuUGsXMz3xGmRgp6lDxEIY5PDKKQARX6+FdVkwJuGjbg72r6Br4vJf7Qs4nO/WzQ9Gc8WrZzXbVx9n2bWF/XAVay9wNQxcisCU7CtXzOhqGYpSeeP4dF/EztrzkBOdTnlHDTc5InURNf4ZZGGVZaILYCQwDR05edc4qQpOTfXu3ZYZfrdqvsuDufYpTrQhRLeM9zW0CH8eytzMcr1IgiRvwP8lki+C7yaKpYztdDY5ufmYjs+CsGCJLeBj/f58VVFM27Ft/cfL/8406qRzEJ6/iRGU3zNX5q1258H5jSUMhjopvAGWFMtQUaSiAAoeE/s3EkesOfD4DPRKP1Nhij+MDX/QRl2BzwNjWIFB9Q2O01wbfgQzq5SD9lACLKwWtl8bJQRzAVroBZoM+Gcr8yCxBoLQGLJSz1zKOxZDAEfm7rUAlBjL3sRvwrQYHaSyKnaZjmQpn8kfTOm7Lz34HUoe3gHQbaO+qV0r6fZ5DKpO2hJA7tQRR6OyaAWIW1nWK8vYFA4K8ugBpLpMpRlWbqG4NTYxdq5KrFS0Woxh6VmneGov1HxLjks15sSG1pn1gArghQmcsLyMzY35URIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7ydgSP1Rn3aTabKSTAYahRAONq+VAn9dQoxg/lKtWzv3S8qpJUJMCDJXfa?=
 =?iso-8859-1?Q?Cj3kIXI7jIIEe5z9jv1xpNg8zuHg/4x4MynKFDl3Emc+aePaU6TcCEDE+Z?=
 =?iso-8859-1?Q?thV8WCXH0qaHyPSMIOPwEQ6SOAKOfrjvlM6uadCoCjesYLuSYPtGfeEd/v?=
 =?iso-8859-1?Q?ZITzKRnMnZB8N70LSuqGOG+48C1iv/VNlee7x1vBeQYIMuBCzCvZwDSJzA?=
 =?iso-8859-1?Q?0B9V4KrRSLwKlKR3UBgnhRIu6C0UHd7NOSMb6xPnaVeSMNpTMSCHIYNVCM?=
 =?iso-8859-1?Q?eDuZNLmnDl2mp8gfhjs0i3mbxH+w6pKb70JLcYiCAROkkHMa9Xo7gf6RxH?=
 =?iso-8859-1?Q?g4Po1h0PJr6cMgEoYlwiJ9+oOceQkZAZ+dD5II0UYXPXF2NCvuPJXhJ8Hq?=
 =?iso-8859-1?Q?dQ60QF2pYz4gXETc7k+odWLbYFO4jiZtILv6SIA/yee3zknOToxRD5hPfZ?=
 =?iso-8859-1?Q?AoNZ85fyRxqiITugQkHGvQw45BAnXqGcVb10pnAibGW8qRLBIkKUyd2m9q?=
 =?iso-8859-1?Q?OggxY4vruiIXaf0gl/71qw70RDVJitiE2tsxMjmejK+wNSZ/+Ipipd3Wye?=
 =?iso-8859-1?Q?/mRR8CMsAOOR5DVn9s/OQft92Z5fzbGxrMc1X0vsGu1b9Bn1gnClVpONS6?=
 =?iso-8859-1?Q?znG8mQWD6roXMoTiqYit6hI4EC8F8b45IHpBAmbz7/Y/tP+GoKIVY3AwYb?=
 =?iso-8859-1?Q?+IAghmWuALGZyywlZX1wEvRLddIbvjvZGhmCP3ziYrm6VcxjPu8UpA7zwX?=
 =?iso-8859-1?Q?1ocieeD7VLyl8hZGM4/YVom+8pEifYNl0xdAtCGOrHmC+/ujvF6jITEnze?=
 =?iso-8859-1?Q?m/h1HEbaqcwp/6LXj0I2AvfTy9lQ5PtuBn2kks+HtuAHfgx3PU6zHxfonR?=
 =?iso-8859-1?Q?5T4vCKzmulIZuRqfPELnAOdWJlTTzrXlVFDoPCc+JB+aAZBEiPHL8LLjrV?=
 =?iso-8859-1?Q?axDEPmFSK0zuzH729pPeLVubPu/ZCYbnSGNYPAnIFlhROK8Desggd5HD8M?=
 =?iso-8859-1?Q?OI4m3jw4cQDf2B0L79Pi/9XFF6sbmtmR+iO1rXx+LPyAKAJlxrdYt6qCI/?=
 =?iso-8859-1?Q?BUZCKD8Awek5M9qSPh0STMquAcQbnAyL5O2MoMw4pJhdYQ59rfFAF3SlRr?=
 =?iso-8859-1?Q?d8s1ev+uI9kK2hZ0meC2ByVqkQmEIHltBLQNkdKn7PMkDcTzNB3Yn2URpd?=
 =?iso-8859-1?Q?rT7GlK4kFqJssdETgmeHlDJ1p4wOOiRn2Y29WRJONlY/I+qVjhHo801vCw?=
 =?iso-8859-1?Q?6orOxh5xA8KtgJdisBiY/sg4Sba1/kVGN2V3eB5jSuiYe0/SOlNq39FDCC?=
 =?iso-8859-1?Q?81mrjdzKDGUn4JPNj3S/L+z2aVMYVKy/RbdzO0WQop6zODa3CYbM+JZPHU?=
 =?iso-8859-1?Q?61HPxAKIhzXG98cbekIt1BVC5Blmlo6rWeh1rDQWrfnjNJeJIc04lb+CIn?=
 =?iso-8859-1?Q?EVrJaj6NddolZmG/MrRjLyHfj/cLsdGoHrRpyN4/SJOL5I2gXkOy/yWjxo?=
 =?iso-8859-1?Q?wGJf7CC6hraJKT7+Sq5ZlcTdLeZn8zHpWkDh6eE4DDby3SL+s6otH+7hFq?=
 =?iso-8859-1?Q?ktxCh/si+Q+3mSf3CNr4SYA5wwJUUhXwIT70EyqyHzREYd+bo94U0I5HV7?=
 =?iso-8859-1?Q?h8QUNLOSfEQtlx4yh6NlkDOQ/HMkqRCNVBhrk1q9/BvXmrAYBeC07URR6W?=
 =?iso-8859-1?Q?A2cHMRqAYT7W7aCWud0FgjMXinXmNByjSiSX/f7LmmSlp4AolDrHAKivH7?=
 =?iso-8859-1?Q?xxXuAenTKiyryWE/XBwyZSBIJxxavoR16xhm+ZPN6xaLgGgHKGPt/pYp1v?=
 =?iso-8859-1?Q?T0rmP79SDj9Dd5vEoIjiiIYcb9h5l7c=3D?=
X-Exchange-RoutingPolicyChecked: Yt8N+nYrcK3xyeDnq1LeK5uG8vVggr+G67cyFIFzT22XIxdVVfkPdMv2Nggt9EuRou8r8B95JmB8ytdXmZxMS2wXYVIDc25cd3orahvqTGeyIxMOicHA22CzJGOeADmDu4cgGz1Pv3pQgf5JJHww+9yYh8K4W7vYBhixnsrjPDWwPnecdPJT/DyWx1i7dvbEoKVbgP2lBvdZbiM3SfdU+76aZ/uBhV+VBG9/nmP81kfa2qHOhwlLMGDUvNvC44uO5QpuRVgEY7TR6DoJvomovumuJxLVdcREDA6oGKBWOZjze/u8HDDOMeeRzXoTm0cmxjy1wsQDfT8RQu5iAQS/dg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 216d3f02-59b6-46bc-52e5-08df28d718a9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 03:07:20.8059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JP827VoswMzjg62scRNnmeSMpNJKxgkOPtfUjUwtKNLMHoFtMSmTaaMxIqLcOsSan8DFAz1OaUFZDBrkPZuW1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
X-OriginatorOrg: intel.com

On Tue, Oct 13, 2026 at 02:59:42AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] drm/xe: Infinite wait in guc_exec_queue_kill_sync() if GuC hangs
> - [High] xe: missing queue kill synchronization in teardown paths
> --
> 
> commit 85f52ae759a601199a902ba124e22498f6e78a14
> Author: Daniel Charles <daniel.charles@intel.com>
> 
> drm/xe: Synchronously wait for queue kill on FD close
> 
> The early KILL message disables GuC scheduling outside the serialized
> TDR path, but xe_file_close() does not wait for it to complete before
> dropping queue references. Split FD close teardown into two passes:
> first kill every queue, then wait using xe_exec_queue_kill_sync().
> 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 7ade915c59a85..af5d9e8f0b16e 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> [ ... ]
> > @@ -1623,6 +1623,19 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
> > +/**
> > + * xe_exec_queue_kill_sync() - Wait for queue scheduling to stop
> > + * @q: The exec queue
> > + *
> > + * This function waits for the backend to finish stopping the queue after
> > + * xe_exec_queue_kill(). It is safe to call multiple times.
> > + */
> > +void xe_exec_queue_kill_sync(struct xe_exec_queue *q)
> > +{
> > +	if (q->ops->kill_sync)
> > +		q->ops->kill_sync(q);
> > +}
> 
> [Severity: High]
> Does this code leave other teardown paths vulnerable to CAT errors?
> 
> While xe_file_close() was updated to use this new sync function, it appears
> xe_exec_queue_destroy_ioctl() and xe_vm_close_and_put() both still call
> xe_exec_queue_kill() followed immediately by xe_exec_queue_put() without
> waiting.
> 
> If userspace destroys a user queue and then destroys its VM,
> xe_vm_close_and_put() synchronously destroys the VM's page tables while GuC
> is still actively scheduling the queue. Similarly, for the internal kernel
> bind queue (vm->q), xe_vm_close_and_put() kills it and proceeds to destroy
> the page tables. This results in GuC scheduling contexts with torn-down
> page tables, causing IOMMU CAT errors and unrecoverable engine resets.
> 

I think we assume aside from an unexpected file close (segfault on user
app, ctrl-c), a user shall be well behavied (it is) and at worst it
spams dmesgs on debug levels.

> [ ... ]
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 609af66b343d5..36c8c3766f5fa 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> [ ... ]
> > +static void guc_exec_queue_kill_sync(struct xe_exec_queue *q)
> > +{
> [ ... ]
> > +	wait_event(guc->ct.wq,
> > +		   (!exec_queue_enabled(primary) &&
> > +		    !exec_queue_pending_disable(primary) &&
> > +		    !exec_queue_pending_enable(primary)) ||
> > +		   xe_guc_read_stopped(guc) ||
> > +		   vf_recovery(guc) ||
> > +		   exec_queue_wedged(primary));
> > +}
> 
> [Severity: High]
> Can this wait hang forever if the GuC firmware silently drops the H2G DISABLE
> message or hangs without triggering a global watchdog wedge?
> 

This is right, would have a reasonable timeout even though eventually a
GT reset pops us out here if the GuC stops responding.

Matt

> If called on an idle queue (no pending jobs), the Time-out Driven Recovery
> (TDR) will not fire. xe_sched_tdr_queue_imm() calls
> drm_sched_tdr_queue_imm(), which only schedules the timeout worker if there
> are pending jobs. Even if the worker runs, drm_sched_job_timedout() exits
> early if the pending list is empty.
> 
> Since this uses an unbounded wait_event() without a timeout, it could cause
> the close() syscall to hang forever in uninterruptible sleep (D state),
> leading to an unkillable process. Other functions like enable_scheduling()
> and disable_scheduling_deregister() use wait_event_timeout() and manually
> trigger xe_gt_reset_async() on timeout to prevent this.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261013023442.206915-1-daniel.charles@intel.com?part=3
