Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E05F2D46A2
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 04:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788495476; cv=fail; b=Xm/nwcOc8lz0iXG4BuDk4ftVMaHMFY91U2EwR+2brM/CPFPLHTznI1i+4y7nkQwagK+OolF9y7n8grlJmoAfQDgy6Qd2UJ9iMv5VgFkER1rb2Sgbpbv3LMq82dN59H5fp724psHTzAtBUK3eXKfF3SdZaCi0zdW/yy1PJU0OhLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788495476; c=relaxed/simple;
	bh=IP4XCzl9HqJCCEUXXL31up4VmZ0Ks/T5/PS31Hjh1tw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DQlu2uCEDx9rI60cMJ9bdqLaCktc+GlCu/Bf3fpfS0prz2wgeVp51Souvg9+hAuvdv4CRK1cQm7AtiaHu6qrwNlW7URnPyjQe9BlUJxst/r6wdkWn0vS0Ffwfm6Y+jl8OqFo9Uy3sVNQ/m/bVgQbwgPw/hUQGTJeNGGaQ+gstPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSJa7fUI; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSJa7fUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788495474; x=1820031474;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IP4XCzl9HqJCCEUXXL31up4VmZ0Ks/T5/PS31Hjh1tw=;
  b=cSJa7fUIiRL8h0k1Vl9COtWloCcWw3LP4QdRiUToqHuTBlVr5nze/6OF
   kwKBMM1HdGcX9pdbXcUECU59v3n6oqiVRIDhKDpwkiCtN50rdeEJL5zIR
   lYtIV4rsuTw1NduuculMRAhmwmlctanId408My6d67RvKHE6V6cGJFQ7c
   t5NZ3xxoQA9pR5KkUHSALunQDxfhOK3HY4hiXLq4u9AarAGwDRF3PcYyM
   vFqdC6FVjsGlXP8znER6N1iv9a2fh87cTpsk4AdmYy/jkhHQSkRB4BiZO
   SVpBU5MIDTHji335sGhyr8jEAr/ClslD5OssxvGYzS11V58YBIVbM4FJh
   g==;
X-CSE-ConnectionGUID: IbMpZ9MoRRC58Uw6yDxoqQ==
X-CSE-MsgGUID: qTSdJfYFQNKl1VJWZKlTmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="91505205"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="91505205"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 21:17:53 -0700
X-CSE-ConnectionGUID: cD2dY0dMSdif0leyGyyh9w==
X-CSE-MsgGUID: zaclWi5NRhSJKZlfi2/ySw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="274067522"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 21:17:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 21:17:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 21:17:53 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 21:17:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I14NESfPa/Yv8K3AwiVxC0uwdtvL1dRQxPTIdL2oOw64N3L3sJ6PkNC/HPGyTXElpDWEAFbT6wl0b6C6+CbX7IPcYkg4tQXmgR6wvWMGiwJ7mnU1mDrtsfzE6nWlbPVI7/zolnEKj8Wjx0891AXXvKJ7nRsFnSAIkfNHubrSAggQGoFTx0ebpwDC4uUAkmy7P4oJUAN7a9XYxpHK5fRjJTx/40QSIosDUsoEjjqpA5dUX/Bl2bb9vDMmsDab6iifTaugrNTZvGpoc4GdU6fKO+Q5Qk80iaYUhba8iE3fvJ6UqxEPNlfvoYf/ieQD364bkKThI0rhvhdSXIag5n7lsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoSYbEbAV3vwOaJpkIOwg98WQHN3WGecx9d/pYwLhII=;
 b=Q24jsceq2QBv2SiPBiTYhOSpfqGqHCPHMNuNemDy3mxR03zZT1hEheYVw+kI/NUecGeOKv964baqE5NVbj7ipAqxtzTPl+4UZvR+3zWe8RiG5nNRPXwho7IM39olkZYMHVqfanoRqtbWm9RawIk2pgcTZuVg5Sm78fyrd9c7D3p+eWLFaC1WL56cFtGexBASkchLE1Wydhld5cw7assDazoK5WS1b7kxC/O0VtpCEMnaV6EbMDOpguMhF/erK2vdXMU4gnUxjEYOSmdIcjkdt3nFrquTTYTfggXUPfaesBNz18DzoRUMdOwCBv7/ZQNYuvTRIkrcw+LMxy25Hge7YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 04:17:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 04:17:44 +0000
Date: Thu, 3 Sep 2026 21:17:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 22/25] drm/xe: Add ULLS migration job support to GuC
 submission
Message-ID: <appGZjA7NTSPRnNT@gsse-cloud1.jf.intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
 <20260904022207.3490018-23-matthew.brost@intel.com>
 <20260904024935.1A7D71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904024935.1A7D71F000E9@smtp.kernel.org>
X-ClientProxiedBy: MW4PR04CA0103.namprd04.prod.outlook.com
 (2603:10b6:303:83::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b8dedad-8d31-46c9-25fd-08df0a3b7825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|10067099003|6133799003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: u0xwvEwM7XVYLl0OlSQrQnBl0+cSMknXIBXOyP74XGM58ol9pBNEQphLQJvgZ0UrU5VFxTf9XLDDSm/8d9oCCzKdsJIxgZknsf9u4r5AV6t0iFPPMz6Xwd/mRtlU44nByjsKIhDTgjiyJG3Y7t7Qdyt7dJQRHwjm4kqZcOIemRn66oh+MDdXmpYO8Oyax0+ZhpJaJPBTkbVEyYVxSEuXvkEuOjznyxG/n/ZXQ4BklwC4+J2ncNcq/zhstIC9LPgaHixM/e9tNuOpv+j6jQn9xc9UB2k52wsYm1oQm31ScLyXnRhYXanSmlfUYoE4X72DpkRTrlpJIrbon7PqwUlkJ4jSuk9EIQ7akHPRlrJeGwjgfnt//66OQvq1fHOxU8WIncJcp9FZBtPQnTwF9PLC9EeLJA1/iqxb29yYlt5smsIIREV6+XoJF92Uol45d8pTZAggS5axegAQuBy6fqIXAZ+XrfPoTVt3eGSjKxGudPkH/shgkVrm5Wux0iQFUS7u8uMCgEKai9h3eEAkoOg5HuzvMSlQGWTKrm/DpCAKZL6Y0ESAWt9IGC4B+51vJTX2B4QHus7TMu9jyDo3rtwSHviRXbfiCfesFSwUzWFecec=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(6133799003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rZkdJ66AetiSdB/d0s1g0idPBW2CNAGOYUszlaHVi92YVG6QnyFJ3lPm9X?=
 =?iso-8859-1?Q?iOI+ocmnsZHn3+AuF0IXyWcwLQ4DVpPfdYV3/zBW1DlUBm3nboPC0fIuVl?=
 =?iso-8859-1?Q?NAmvj4VGXK/ag6TxNM1hQjvcY8ClYwS0GiX9qaUPvrepqwRk97YH5OHKDd?=
 =?iso-8859-1?Q?Ry+jG9hz4m1E7Tye152AeCiy4OPZCiWhwqfyulP7VZb1chKOmNp2MffvzS?=
 =?iso-8859-1?Q?gA1Qw3p6OpYlUUl2/LguZHHo/HvMffCFs+IokRhrLSUefE2EzccW+ekbwz?=
 =?iso-8859-1?Q?d33jLUcxa84ya/fMsLt4pW9ePtYzEXWJ6fE4jsWVsXGII/tBlN84pjhoJO?=
 =?iso-8859-1?Q?XGWKTnN2OJlSgeBF1DlkRdLGxptzsxcypzkStNWwbALjrnw32xisIEq9NL?=
 =?iso-8859-1?Q?yhTpyp3gvfzy71qESd/xr83n5QcWHmEU5sKftMphifv9LC+TkGTPwq0oc4?=
 =?iso-8859-1?Q?YttBICfh1tpZG2b/EyNgU4rn0EMaxe9sBcOJ4e+aDubPuWWaBJBCqdkcgc?=
 =?iso-8859-1?Q?BO2hTWFDGKJGEKOfLPuNwu3i3ZZ6yYbmwGf0RvYeYJ4uiw7aGHUjOFNxcG?=
 =?iso-8859-1?Q?/UGeur8MNFB3e5HoxqfFzDrongcr4fJAlVKlTNkASnwL0oLvsT5ZwEVcnv?=
 =?iso-8859-1?Q?lKv2BcJzZvZ1iMuKfp5JFqIosLiHJwoPPqxUvdOJF+zpJ6h4Bkp4PSx/ks?=
 =?iso-8859-1?Q?b42MIHdYvo9DojdXayjywXdwAyc+WGVShbB4y6evgNueZN+mBdT70CsKHr?=
 =?iso-8859-1?Q?FW3+P0C3ryYxulxI82SSrTbV4V6MazguFM5xNVu1RpcWOR7kX0BPPfRnKQ?=
 =?iso-8859-1?Q?qdYFzUjcnEfS+thT+C1Bh0ugeZW5Y46FiYCeHDY1V4e4eNUUH3FswcBMts?=
 =?iso-8859-1?Q?zrrWWF/i5LFraSqe2ZatATedQhH72zioOM14xnfp6CtYSxGFL6I+kYXwZt?=
 =?iso-8859-1?Q?/x99c6OpZ5K5tVSknbsOEd/y6iac+h8uHyEVLasMSAunyikoy4fHoeKAx5?=
 =?iso-8859-1?Q?oj2Z6gJqwCd6QBRopaZ4DwtryIgjlmzG8bY7LK8YuWvktEzNGQWn817Z9G?=
 =?iso-8859-1?Q?VboGxshOnXo/MCwBkcQTNIrtWYI89A2F8NCEDAREyCDK+b3xI1n4JgbsYN?=
 =?iso-8859-1?Q?ylOCrqoL/Lfpf0QEzEPXDo4KajlkCLhjBr6/qmrsC7zMB+gq1rY5RS++Ii?=
 =?iso-8859-1?Q?L1zgKa1FI+TMnlP7Mjgwz8XlFqXOrMdRzB0p/o9jZeeppjwYLGR6EUeTKs?=
 =?iso-8859-1?Q?jCCwxkXatslh+OQ3LX9pLEVGCCxn42y7k7YTnHbhGI1SP3JLhv7UdqFvjX?=
 =?iso-8859-1?Q?cHOhk1ApMR//azm2/e4QiM7eB8LITcU3XV7yJ/RT6NDB2iJIDprM4HKTh2?=
 =?iso-8859-1?Q?DYSNVk9sv+jxzsVJdGDImUW68FNEZbUlBnd8s1AG0t5gYk4y1yTD2eNlyn?=
 =?iso-8859-1?Q?ac4464bQtBEMLmOg0cswquJ7+dk8b4UhHdaf8pKV9/KOZJCoVggKOyn4Gf?=
 =?iso-8859-1?Q?HAWpGXEzI0uY3ZAyaGA3UtObPCm0n20n2/dhmON3pfWsAzp6Z+5tcl/T8l?=
 =?iso-8859-1?Q?SHYmaHmKYi6N65YEhmTBK8o+73JfqzI2UvFqHdCW3uOe31FsFh9UUtz7gZ?=
 =?iso-8859-1?Q?xfhsnH31pLEwlVUtLnLf4dO1AjChZT0QFhjsB1UQnkBLsn7Jyryx0gB6Kk?=
 =?iso-8859-1?Q?XDNQmWkLWsO2bC4rg+tBh465ka/KL3mk2/4ytR9zwnbNghvUava9IwxNNH?=
 =?iso-8859-1?Q?YtoU4vjVh7zRgdGEoGHp6MpLciL9e+2CqQpvAg5npZA6w2ZBzhCM7bwI9k?=
 =?iso-8859-1?Q?nFx0xQ6dKNXlDHfGVKf1GiuGBYwKiVc=3D?=
X-Exchange-RoutingPolicyChecked: MC4hgUxgdouO0vQ7yAfiVM3TYUCR7bBKBIBNjuF/LrYD/5iGvMP+4bqLgp22Bgn7RIaRUM/VobdvbjpScPt6ukc4s42OEXL2AvriC3Fq3qgR87PLhYQ78ZFkHiaS/qtKbguVrRte0CHDMw1T4KJCJ38SgVorkHoT42Yl591cd1SSS54gQ0MqfYj9aznHznNcuebGBEyKorh9Ud293nDuFRNyi13F3iRfWBynqLseX1sOb6tByCPhO+mdoJH1g+0Sxa9Ae7WtRerayT3Z1PS/GlQq1B3jaD8IzYNxQbcmJobK9smvElDMeQE40uDtBgshtiiDQBa779B7L1tscnfEbQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8dedad-8d31-46c9-25fd-08df0a3b7825
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 04:17:44.6552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvU1tKlsQpWHnBuT0+5NS0WlSanU8TlxH+vTeq8z8Szoh3YYA2KmSAMo+4IdwJcYEMt0L7lp4g/Xvt7s5DwUBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6425
X-OriginatorOrg: intel.com

On Fri, Sep 04, 2026 at 02:49:34AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing MMIO readback to flush the posted write to RING_TAIL before signaling the ULLS semaphore in memory.
> --
> 
> commit 454390e5dedb020c4422d2a8b279ed19fa3eb789
> Author: Matthew Brost <matthew.brost@intel.com>
> 
> drm/xe: Add ULLS migration job support to GuC submission
> 
> This commit adds ULLS migration job support to the GuC submission backend.
> It updates the migration queue max jobs, directly sets the hardware engine
> tail via a MMIO write for ULLS jobs, and sets the ULLS semaphore for the
> current job releasing the last job.
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
> > +		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
> 
> [Severity: High]
> Does this sequence miss an MMIO readback to flush the posted write?
> 
> A posted MMIO write is issued to the hardware engine's RING_TAIL via
> xe_hw_engine_write_ring_tail(), and is immediately followed by a memory write
> to signal the semaphore in xe_lrc_set_ulls_semaphore(). There is no
> intermediate MMIO readback to flush the posted write.
> 
> If the CS wakes up from the semaphore wait before the MMIO RING_TAIL write
> arrives, it can observe HEAD == TAIL, assume the ring is empty, and go idle.
> The context is then switched out. When the delayed MMIO write eventually
> arrives, it hits an idle engine (or worse, a different context), failing to
> execute the submitted ULLS job and hanging the migration queue.
> 
> Because xe_migrate_ulls_exit would then hang indefinitely waiting for the
> unexecuted job's fence, and the migration queue handles GPU page faults and
> SVM prefetches, this can hang workloads utilizing SVM.
> 
> Does this violate PCIe ordering requirements for flushing posted writes before
> dependent memory writes?
> 

Maybe. Again [1], it's something to keep an eye on, but I've never seen a
failure on BMG, and I've run `xe_exec_system_allocator` thousands of
times on this code over the past year.

I'd like to avoid adding a read unless we start seeing failures, as it
adds latency that we're trying very hard to avoid in this series.

If this does turn out to be an issue, we'll most likely move to a pure
memory-based model for ULLS with a single ring tail update. I have a
prototype of this, but it is significantly more invasive to the ring
operations and submission code than the changes in this series.

Matt

[1] https://patchwork.freedesktop.org/patch/750801/?series=149888&rev=6#comment_1383766

> > +	}
> > +
> >  	if (!exec_queue_enabled(q)) {
> >  		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
> >  		action[len++] = q->guc->id;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260904022207.3490018-1-matthew.brost@intel.com?part=22
