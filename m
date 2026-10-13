Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4BE472074
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 03:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860959; cv=fail; b=m+HF9LR1YFzz7XepGD9aIanq7qDwm37/tGNiZlja3BRR5e2dI3od6PON3zoFod2YgrFEZtognmajqRTaBWG+kBhaij9RbSKiQGwIY1rvYHosaJsmoircVunfjw7hZmwIUCKNNpFqFxs7kZ4QW8IcWc860boJI2FKpRvMhXjxL2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860959; c=relaxed/simple;
	bh=xSXtK1S/Rc7OeTNM5Qip+XW+eMHkNdBghjqJkALMxAo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pAd3YnYdC4HVAMrj0EPNR7K1mt735P9V6lCPS2/NfGcDIQH1IgxS5cieHQY2DdKUMdG2o4gc0KY1Soh+5z8kzDTFNIC2F8Yyl/6ExFgnp6NXwv2o2x2BTDssgBk7IjbWGZ5YyCTmdLVjMZqQcLIvOaX4d7xO/+7NFJLt0WOq3Kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkZzgHVk; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkZzgHVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791860958; x=1823396958;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xSXtK1S/Rc7OeTNM5Qip+XW+eMHkNdBghjqJkALMxAo=;
  b=ZkZzgHVkDxBfZP5r6/JyzJMg1Y0JSEvBVHkAe4SeOFpCbv25dWPV2OvG
   aMuS7tqZoj7GV6GAvDK7lGYS9zDMTVWRpzREEQTdNneSpw9KspBky03ku
   3Ttzl0SRSneCGNx3pX5Sg2r4uvE3KTm/Vto90tVN7RW3V7FSVXtvxwa8c
   pCOZc+1Vb39LMZOWvs0C7FeztnTmMmEHHR2y3fbb0li9RhKq9iFNOqgba
   HTb7G17rK0JccavyIgskAih7rV5QLSj5xlUHqS3kvMsaJwf1fqsUpvqqe
   vMmEbjV2DkWQ9dG2pZJfXcLl+jddyaR4LpT5Wp7Tcem0Gcn9XDDaT6pyn
   Q==;
X-CSE-ConnectionGUID: W/6KYrrFRHyA2xBVlBJJCQ==
X-CSE-MsgGUID: tQtWoxKPTxOLlFfX78c5IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="607941"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="607941"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 20:09:18 -0700
X-CSE-ConnectionGUID: 1VrCdOKHTEe2VIVCix9v7Q==
X-CSE-MsgGUID: jVDh0QfDSFahTE1JZ2pGHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1369194"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 20:09:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 20:09:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 20:09:17 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 20:09:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPCBpdanTIHE5/Id3GcGfoP9IZHf7GF7KUq5IKwP4CtTwn45w1j702gvLYZwKUpASdtqGtGHpuoWuFmXv3QlLjl/fJFgCvjlZsbHeN49a5dKf5adX2/Zwedri9Hwyp3ccIjQukR8GYNbbE28qzlntdeY7WA+4IvDjO2Tq6oQl/xtq0DW9P/ErMoEFhZuQzMUYDUCb+9QNlPmzSHirwetcXBIiDkGznY59cH6nac4EWX7PY5wMpN84gH8DRy1R1xnvxpoAKsiAtP6dHcPFfAGxW8v4yYK+bXOyMsEusGYiNYiXv0NoojG6dSEwPbgup2jCULQXQb4apnjtSLxG8DW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIdOcAe0Q6nshXMAdrPanvLgg6Xh7CYZsT5BmWSpgKI=;
 b=Cru0soIX/L7tInnqHU/KE0fWaa+8t6K0BN3kzj13q+IvGaWG5EPewN/VYMlMsZyq3qwolzxCG+V+HuSnTyzhdBhpLwowcWGbIbEDKIkUmux2guskhAzFuJtQgb1ZYX3Q704YizwGuyDVYcqSpq0S50XULu81ghbergsmpYcEVMNhpLtTJ+QFRpVWfn/uacVj5/OOvmsvxK0z3BYxRkj3W2OGJ/K7czsGwhDnC2htWck+74G805Q3tyJuhTVX0TfPJb5QIO6Lx5pX5He+saafMQt/YeCVUm5+lCPrFZjAM13ZZczbCzgSur8qbqEjbQRAfBlexrqmE9EEpYug8azzlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 03:09:11 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 03:09:10 +0000
Date: Mon, 12 Oct 2026 20:09:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Daniel Charles <daniel.charles@intel.com>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Read scheduler message opcode under lock
Message-ID: <as2g1GqmqaW2yYp6@gsse-cloud1.jf.intel.com>
References: <20261013023442.206915-1-daniel.charles@intel.com>
 <20261013023442.206915-2-daniel.charles@intel.com>
 <sashiko-outbox-168882@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-168882@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::25) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SJ2PR11MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a2d72d-e0c3-4425-3471-08df28d75a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: C33VFLv2C93jv4gqJOdoKroomZkAhw8EqcI4zSN7Qv0iJxAGEwbMARZFv2uCkKiIRzfA5zuZWzTYhjpeaoq/5kEGasPxyVvkI0FhfQD+3Ov6/0tMfi+KDmIhSn1/7+b0cp4UKo6s8wRxbObbUS9Que9W0UWOwuDCxqj0KareZ6RjVY+fG2hCxrSnFkNjomA2qS/vyDdYwGSQIO7n8prZNsLA9NgHRf8TxfO0jJZySRgleTKD2q0TLECcWt3lpL1MKQVnQYgrGU6rWXQdzOXvzswlj8wI/8+AkFpI5mK2V1ddn44QCjnCSJtxgVaNu0OMk+YiZtjt+vTYsLXjaQO1NuBHkrOtrlb1/eNEr7YBaOxf2OgnL2xXHlc3CVArWByzbw2DQCDaZ2dcFoTazaNJTChUYV2pjZK1nwmu15pZv9qAa08a/xgx14fxovyyiE9vf5Y67VVFawWOSHhb+7lm9FRfGXgOhuH9ZVcJbu30lJtE5D62pRugGv6V3wzrvE+Mt9MpXUepLNQFzNUWFtyL4KAqEwzRDWZOxyxgbL1DDs4z7JrlfamnNKTiRCXrdMaWY+hJutwJ8m40b+gLq/E6p0PWt2hDY9jVHCOgjHtQAWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qYHvBYPsOOcJcjgvFvky/n+5Zy0d14Mh6G9iva7W071xJMnVZEQeGs6z1/?=
 =?iso-8859-1?Q?rXHLuslU4UFQ5IWeUy3XAztzD/KFsgKU/Nqzf0wyvNLuCxzV2tyHk0cAj9?=
 =?iso-8859-1?Q?Jt6G5yXCJIKl/HSzzW6B4sbIvs+ChhAxMeUgE+93T9hQW+H4No3Pt+1fYC?=
 =?iso-8859-1?Q?Dwl63Sd6ZBIxekrUn/Ay2KhDkFwAHAXzrFZk0bHC1Hp7kW+/8Dt2KruYjL?=
 =?iso-8859-1?Q?N4x6AV7nMjKMktCRHfHI+hgGkmQgRy/Jwg0j+GgUiRGYzraFCHeSpPJyil?=
 =?iso-8859-1?Q?wRQuvSK096R6ajUpQoWSZwP2+qdN6+sWAqozxncoMPPuFHPjI247yhKvMU?=
 =?iso-8859-1?Q?UUynoR5Wf0HaFvJs20H+SzlYDgP2V2IPXASTxv6QOGpRhnGWZVqPA3+EW5?=
 =?iso-8859-1?Q?q4aBbe24QL83rfH5fCLlgZHlKfdN1aSntkgP7I7up2WUUnZu5evDI8w+a8?=
 =?iso-8859-1?Q?kkFFoL60Prk3OZ4LNVnJXEGN79OEAOhEKR6XJ8+HS0K0Dy0wsaMaCgwnsk?=
 =?iso-8859-1?Q?prTIHyGk+7TEgAJjV/JajCbF3Oyessf4d4OhnirX+Rki2OVSFGafKvX/nz?=
 =?iso-8859-1?Q?gmB0JEg12Jhy8KVNyWTe5hzQDA8QQULVEq1hXOg5QHhrw8aV6zW945/N5q?=
 =?iso-8859-1?Q?aHa0/97nNiBibZmWWn+GLp41KEcRX77tAFIGsceM5sM4qmapUusWT+cYsp?=
 =?iso-8859-1?Q?Mg6nSuJKqL0Z519wtFULXPLuIfOHd82ShmJU/6hJ2+iZe7S70FfOZeW0n5?=
 =?iso-8859-1?Q?HMe5100dRMlxqFktD9q5AQoJ3MrsfkZeT/hodh1sFPZ1YASzL06yfTLxAI?=
 =?iso-8859-1?Q?lssTR4mX89sLPrRPPidjwtMWC05w5F2kozYSn7wGNu8jmK4i7vdE+C0TyM?=
 =?iso-8859-1?Q?QGTum3LyDU+kq3Dx7llsX8OcRdb6vEpfMySwsnpwibB2wFn2xy7kUUdgsC?=
 =?iso-8859-1?Q?s545kBm9aauc6jV6JTMW4mFb40lJuZwckSPGVuNZdZJhUTbsFJjhXQCHVE?=
 =?iso-8859-1?Q?gFPbRNyFVO4OxDf2bit6d6OBwrm4sfWAP/bz9VPliFzK54XIVSQwVju6xb?=
 =?iso-8859-1?Q?NE6iH9llIOQVdUJsQ8+K4Lkhd8PBkv5HTMVzGN7l2Dxe/3qcDJeW/3Ca2Y?=
 =?iso-8859-1?Q?+5RRe9U7fCU9OQEjG4fb0mqrnphOLgL4jt3iDH0uRGfK7EbZUurgKd7ywX?=
 =?iso-8859-1?Q?PPRimB2kryHMyClc8FCKepRtMpwOWWnDV8xbVYdQhEPTWpwuQ+NIv2PGHo?=
 =?iso-8859-1?Q?29Y/PSWrk634sAt1F1F+LrtMIkMUTAc0QMBzCYVakaJ5nfTpJjxcvJnjiY?=
 =?iso-8859-1?Q?NHViaFsjrJ903gh8c8JM/u9rr5YN3kORYvvxi+AG+9tPwS4Cb+vQKylO4l?=
 =?iso-8859-1?Q?f/eenITeag15SQznLBugEnBbjEIKv4Bvpif5FiMkAhsA1JjF+j5y9WA7uH?=
 =?iso-8859-1?Q?VlVZzX/mC8saRex050T6pviiALUCXN7ykN+S65pvuk4LRRjy/+VUrN473K?=
 =?iso-8859-1?Q?ox9u9SpXI1tV4gp20Lr0cjnerMGqaE86UlrLnBanaSyXr0UfTGT+m/PoqB?=
 =?iso-8859-1?Q?kZ/4U7GFxFZV+jmbCEye6zHt2UMcdnv38zbaYWa/ls0Ibe+PEOQaHGhLa6?=
 =?iso-8859-1?Q?8PBLWtH1/D8ZnQ00bORlWw9hbbNBOWviG5nmF3xhYDi6+AGNCAQNEHemO2?=
 =?iso-8859-1?Q?QZyel1IKoNyh+lAssb5m1qyu+geiZFY5dwQsgQoS8fgNfqx6JCNvlK31ol?=
 =?iso-8859-1?Q?DKw/qIdOtzK0ltFPc7qJ1li7vmX7HPdjx9YALgknOwOOdkNXvvjZE2XTTI?=
 =?iso-8859-1?Q?IRquVBiASUlq5cZikK6KrdPBwUwA3P4=3D?=
X-Exchange-RoutingPolicyChecked: c7S4KE+v1bcni2sqsDAT9LnKCgvQK4jp4KntvwqAuVv6rIt6o0dy5tVAHz9mXgUAbv9sJaJvf/asCxF1bjBBDTJU/cZ3Z/Mxfm7XIIjjEYuYu5nxsBp1vBU4fL2f6CFNrS2IBLmoFFgYfhNGL9K8siM/52cwFbYydKdNGgLuhEghGQN7WMNpbHP1FP3vg0T63Ei/QrFb015gquCaTpxEaFA8TR8fRhuDzfPhjd37AKGqdHxUslcc7Swzekb3v9w9C994xFryR/mLzvw6beKBd/pBpoylgSQfBVjhb1W8/7a1SgGELeN7oq7dO7EamasajolfpPTUfyqRUZl6C/8Bdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a2d72d-e0c3-4425-3471-08df28d75a48
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 03:09:10.8625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LS2PsOd3JngG+/7MFZ74c+owIWm2Aq/Gvgk6mNB5PoS71su9DPb1KL/kSuCYUA8AkU55ltR8jh3DTJ1YcIltgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
X-OriginatorOrg: intel.com

On Tue, Oct 13, 2026 at 03:00:33AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] drm/xe: data race on msg->opcode in tracepoint
> - [Medium] drm/xe: memory leak of dynamically allocated scheduler messages
> --
> 
> commit f8887f43a6b200067866b162e2ad500eb6e16175
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Read scheduler message opcode under lock
> 
> For static scheduler messages, the opcode is only guaranteed to remain
> stable while the message is on the pending message list. Read the opcode
> under the message lock before removing the message from the pending list,
> and pass it through the processing pipeline.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > index 9c8004d5dd915..d656db758cb3c 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> 
> [ ... ]
> 
> > @@ -42,13 +46,14 @@ static void xe_sched_process_msg_work(struct work_struct *w)
> >  	struct xe_gpu_scheduler *sched =
> >  		container_of(w, struct xe_gpu_scheduler, work_process_msg);
> >  	struct xe_sched_msg *msg;
> > +	unsigned int opcode;
> >  
> >  	if (drm_sched_is_stopped(&sched->base))
> >  		return;
> 
> [Severity: Medium]
> When the scheduler is stopped, does this early return leak dynamically
> allocated messages?
> 

Not right - queues always start again regardless of any type of hang.

Matt

> If untrusted userspace triggers an error path by queuing property change
> messages (like SET_SCHED_PROPS) and then causes the queue to hang, wedge, or
> close during teardown, this worker exits without draining or freeing pending
> dynamically allocated messages.
> 
> During queue teardown, xe_sched_fini() and other cleanup paths fail to
> traverse sched->msgs and kfree() dynamically allocated messages before the
> list and lock are destroyed.
> 
> > -	msg = xe_sched_get_msg(sched);
> > +	msg = xe_sched_get_msg(sched, &opcode);
> >  	if (msg) {
> > -		sched->ops->process_msg(msg);
> > +		sched->ops->process_msg(msg, opcode);
> >  
> >  		xe_sched_process_msg_queue_if_ready(sched);
> >  	}
> 
> [ ... ]
> 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 7ce73489c35fc..c4ef3e9bf7a18 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2056,16 +2056,17 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
> >  #define MSG_HEAD	BIT(9)
> >  #define MSG_PM_REF	BIT(10)
> >  
> > -static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
> > +static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
> > +				       unsigned int opcode)
> >  {
> >  	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(msg->private_data));
> >  	int idx;
> > -	bool pm_ref = !!(msg->opcode & MSG_PM_REF);
> > +	bool pm_ref = !!(opcode & MSG_PM_REF);
> >  	bool bound = drm_dev_enter(&xe->drm, &idx);
> >  
> >  	trace_xe_sched_msg_recv(msg);
> 
> [Severity: Medium]
> Does this tracepoint still contain a data race by reading the unstable
> msg->opcode?
> 
> The patch addresses a data race by extracting msg->opcode into a local
> variable under msg_lock, because static messages can be concurrently
> re-enqueued modifying their opcode outside the lock. However,
> trace_xe_sched_msg_recv(msg) continues to read msg->opcode directly via the
> xe_sched_msg event class:
> 
> drivers/gpu/drm/xe/xe_trace.h:DECLARE_EVENT_CLASS(xe_sched_msg) {
>     ...
>     __entry->opcode = msg->opcode;
>     ...
> }
> 
> Because trace_xe_sched_msg_recv() is called here with the message pointer,
> rather than the stable extracted opcode, this leaves a data race where the
> tracepoint may log an incorrect opcode or trigger KCSAN warnings.
> 
> > -	switch (msg->opcode & OPCODE_MASK) {
> > +	switch (opcode & OPCODE_MASK) {
> >  	case CLEANUP:
> >  		__guc_exec_queue_process_msg_cleanup(msg, bound);
> >  		break;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261013023442.206915-1-daniel.charles@intel.com?part=1
