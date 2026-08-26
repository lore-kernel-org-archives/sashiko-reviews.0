Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487CA15E8B
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 00:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787705658; cv=fail; b=ZCpHDzB4UAvSTnxddbA/VEi9P4B1xI2QZZjqHIL0ON8P9MVpK81qQHOp5BuE4RflsVBelww5mSHK34V07zpMFsmH4Y0FNFeVE8HiYZtFTdONXB/Oil85iQK+WaHY/Q9GQ4buedy5q5hZsIigO8spaNYlvVkE1TA2B9po7txCtvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787705658; c=relaxed/simple;
	bh=bmIA6kkXZG4TgH/vvJCtVQd+EXuHVUeD0WLJfOSbHhw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nhSMsq1/L7Ad/mvcaUANq8Du3cqVbjlV1Ncp0BnEjP0MJN63zNZqLYZn9zrJm4yHp/d40Yo4TSTS+kZk/t+4hnijBLF0zoCUvbMRAg7gvpBD7N+bAghLmH6MNHpl5RmrwLDva8+GPyJOCdlHtj0F5pqEWzvD5O/I/z1L+DzNjKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqqhtH1s; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqqhtH1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787705657; x=1819241657;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bmIA6kkXZG4TgH/vvJCtVQd+EXuHVUeD0WLJfOSbHhw=;
  b=FqqhtH1sj0dCTnvXahGh4zqrDzDsTXSGOvnzPhyNHkRYh1FMacuqgO73
   mxJYJ3LsRDKYfbwGDC6x/ndYmov2ejD3e0eUUn3fSDfPyWATgSseLBZdv
   gY8klbZUP+LxaI6qGpmad2fWrS6mwJ/YvQGc5Zu1aABbtgOhzDbL/i6oA
   QodQEPYGkJBgGvFh9lIAEz83AhUoOgk+fML5cUQ/sL42mRiU1b4Wr5QoF
   +pLlIc1oXDwClBlpmxlY3DDkfgAb0XbxFtNAJFkTQ8J40/4bsYus3Wd0F
   BJIMmfNKKEvDouhWby0VNRk1C9lSjvyAPHzqp4DNebXRK7kKSJE4SOIV+
   w==;
X-CSE-ConnectionGUID: qNpRJIKuQiuAv7cRxrI+4A==
X-CSE-MsgGUID: y4/EA7XmT2yCJ56bXdLVVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="92044886"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="92044886"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 17:54:14 -0700
X-CSE-ConnectionGUID: 6Y/3z2NBTDSo925aLdFUmw==
X-CSE-MsgGUID: V2yKWV47RLWiuca7UhY6qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="305662127"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 17:54:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 17:54:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 17:54:13 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 17:54:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCi1T9I+UuT5B7ZjZZsJpMDqy6Wrh2hxZE6zT34bgYXg+2GIFDcA6GqAq5otrQjN71boEgIs+BJHCTrCUH+s8fXEJ0Q3+4ZHrQJxhPKTd2cNXH8BayCWuPyBVUCbgMw8sL69cYWiRRx6xY543c0S5HhFCM+0mQJ4bcUhL/H9bZw6nWKxaxGIQxeGsJzGWFs1x6DXJeV9J5c6prL8A0ieV3y4PqI1cbfEUhEjHJtBQm9n7s/yBMMnbuaZo+B6Htq7QEIvZQXbHSJaItgILVhlltEKeh0SMjqHCUXSJNVDUGKiOwquw3jwSvLiMobFSukRgIDPrB21Rbzh8UCe1CmHvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSK1G0w1NWJIBUCUw7RfMhfoif14yIRo7hUnOZxeiVs=;
 b=AJhMoNA5bBCLrNY8wuTKmKFGJy0s2jAtbIJB3xRhVBuZu1imQKga+5/XO7JaxTQKfGUmdGvZ8CcDsAtNO10BQiIdPKakIp5efe/1hWBk/NNIAIzWhJwBJ772lFl8Da1nJxxM2XJjjiTFcP6nddKoyjGvZMMFZ/ZnM1TE5n5QpijLoGsQs1AY8KJKWoPsUoA13ElIJk2dHNGYhgoF7x6dpPyphDT9AMK5jRMTjclLfUgOFmJpoQ9ThPdMHRZKNT0DQJiP6qPvIIwgYZ3VMBgXDCAMvBxUbYNQDPyGIJNJygCbWNmVE/ZISn5E5GQ099mULz7MU8vSSMJ6wPFfpaNOIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by DM3PPFD320E2257.namprd11.prod.outlook.com (2603:10b6:f:fc00::f51) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 00:54:10 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Wed, 26 Aug 2026
 00:54:10 +0000
Date: Tue, 25 Aug 2026 20:54:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 01/11] drm/xe/xe_ras: Add support to retrieve info
 queue data for CRI
Message-ID: <ao45LmvBTRk29CQy@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-14-badal.nilawar@intel.com>
 <20260825175317.6C7271F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825175317.6C7271F000E9@smtp.kernel.org>
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|DM3PPFD320E2257:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a32bcb-a822-4788-fe27-08df030c8a14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|3023799007|18096099006|10067099003|56012099006|11063799006|5023799004|4143699003|20046099003;
X-Microsoft-Antispam-Message-Info: ye517/TMsUFE7ePArTmKeCVbEXH5bLAJBx7q1Ol8RMhKd5zGg2k48gMv2ixPOZrazwhFBh2R1sb652wdK1U8x4SRQfdm7RPaklPO6VdO5CYsroa2ZiYZm4uDk1s64pvN/9DD5ppP1jvUYXYYTzoQA0j21Exf4rMnhVgRZQW8ltehELBt+wlE7t2ZCNOWxAIikPfj/JdrXcH/t72IACN9ZooNEeD++6lGhVLNfKOH06pqosZPKDnWBhALevfEP/J6RoEtFdzCUe7PwcvNQVcaT5LNQUSbueknVCUYP/xIAOk+WQf6Vomz3/6CNH/vjZSyeUNClSSDvr/7UKzpOyxDNnNNgEWXXA7H1eHGsmXgD4gCLjfkJTOPkq8JKXDoGUAfNCn9XAU5N0DqNUfSzQxmqFiynb/7z93O3RGG0nPsOHesJe8oQk7qk0Ule6oPpnxb69ScR3gktcyLYqTo1Zs2e/9y0KoIaKiDsmMHWZoixqEm61qBtGOffD1OAtSrk0ORvOJjhGtVdAVaq0cB00YX8oZqmViB5uc2VpeuKOLakh5DFCB4ucvwXC5QWXIo9weeNoC1a6L5LIKWOggdGK4MLYKvip4CvQjXyJYuHIc50xc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7752.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(18096099006)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(20046099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LISQylc+NIdIaAp5MC8PbMQs7zLhKRKq0R8VEgh7LswjMkfhrFEUEoGWPG?=
 =?iso-8859-1?Q?2v1wvg4mGm4VhXDsAU8OY7vmLob1SI9V5OMPUAzhWglA6iYtEv/1ce6ROn?=
 =?iso-8859-1?Q?RUwfY5CgKBFmDBE7DnYwI/SAPjCua5F1mhr9BSt7Ip7/mUYdnXHqCXmcV7?=
 =?iso-8859-1?Q?bl5o8NMOKJkOrAaCczhLDe7DhWHaEIxOGn/S/r6Tn3OctJzHNT8YIsqlEf?=
 =?iso-8859-1?Q?RJbTVZfJbiE7gxsq8lIs3G75MKh4EIXph4e3QLK7XN4Wb/1os6E7kcZlFQ?=
 =?iso-8859-1?Q?Il2Mf2p6qoDPXZY75TqqRDl2rq4ibik9IeG96orgfJXxPCjYQGHl3WNmqM?=
 =?iso-8859-1?Q?bwcSyQEa7myWLg3wt2zAaJwbV5mZVEcIe1LBUIR/+jN9N0gisf5R7MKoQW?=
 =?iso-8859-1?Q?DMkgU5PiOXi2ARjqqHFP0bJMfEghPoY8XvHz2ZLlaojiByeJlaq+V8FjAk?=
 =?iso-8859-1?Q?7mz6bZJfkCN/JNZuP1RsmvvsDylcmH2Ra20yWrw745MUrcvqgwNXRI1Khh?=
 =?iso-8859-1?Q?aatieVKv6bGLzTe7uk+hv35uGw5TD1J0FygvB4M9cqe5SrhAndVWJc5Sej?=
 =?iso-8859-1?Q?PVqTSL7eq290icJX2wpmxybLqVW00ic4jj7v9DD88kcq+JHdLzSznbReUg?=
 =?iso-8859-1?Q?NvtM2AlDYzdmGGluLkH6YinUzdLeCG1Xx/qHe+al5KAiOz84xhUjG4gVQ4?=
 =?iso-8859-1?Q?2nz8SCYHyTDXP6xQyYp2uh7bv8XHjnFYDbc9zDBdq3yb/Z291Ihr6nLpws?=
 =?iso-8859-1?Q?2NdoyGeUSPUd1sQuUib9bcedeusZWb1M55dJgbHvJhh2Cjzm0u421NJ+4C?=
 =?iso-8859-1?Q?0+Dd+r+Zt4xjymMoHObyMgO0tmxu4NAtkK38cuhudS3+e6HO6n+ge35Exd?=
 =?iso-8859-1?Q?zSNCXahP8KnMjbcW7/Qag6LcEh3/YbHvjtArX/j91vOZiVZn/zQetKihSe?=
 =?iso-8859-1?Q?wsFyY0XLKLHIshENjkC8BA6AMPKAPID1rVAHaUaUNa5oYpvmQvyad4YYo9?=
 =?iso-8859-1?Q?H9UBO+KsogUtpmFRqLWNMvAngx/qNSEv/EKkvCYSOtc73QQF74D86RNJbR?=
 =?iso-8859-1?Q?xr6O9mn7zgHoFV1Gmf9WozPA7YfQkaAEyNKfAg33VZepZwZQYjTE6KXf8R?=
 =?iso-8859-1?Q?hrwoiDkNGb0Jzu4ADUAPf+wsXtIMGZiYRH4xB20RWfwDU4hqRXZIMeMFoC?=
 =?iso-8859-1?Q?s8E7kPRfDbpoehEGLi7HQyt5p+XXyYp3Y+p3ZYeKBCqqj8Y7CN+tH1KXnE?=
 =?iso-8859-1?Q?RMVvtmv8v3zArATYP/gfqQfi+Bmta2hV8BJC3tymXBIigj9NbC57Ce7Wu0?=
 =?iso-8859-1?Q?rdLrmKCxGe5f45axZTL9Hhg2yRFvgdAYvMNR7kYCgyw7aat1Bt2MBP2WiJ?=
 =?iso-8859-1?Q?OErilNq/pGF2AId5HLZWy4QV9H4k+BCf4GWbAcDxdl6hQd+rSPCuBT1Qpb?=
 =?iso-8859-1?Q?pBozLzDnkO1oixj5pS872Jy3qkvicS8zCGymqjH3iTZvJR64nN36r0AX1L?=
 =?iso-8859-1?Q?FsCHZNJRVRtmdltURuxDqxE1I0LlckN+TV6Sx++NhElTeX0JS8elKRPHLl?=
 =?iso-8859-1?Q?ACIRa79vfjl57aG9XC86X/Zj/+bwmPEMihdubhNK1QmH5VHsmxgEMvkanS?=
 =?iso-8859-1?Q?G72UEo1ZfsIY8O0xjb+Y5s+pIxVYsRIi2wAC++IhhH9rG+gRDrErwhKj1i?=
 =?iso-8859-1?Q?NXVWOHFTNQJMkC2i93UU805gbSP0kuwoNxZTYsmBT/Mk8DSlc7qSh4UdP4?=
 =?iso-8859-1?Q?7wj9punDgDcgHdD2AcCX94SDw68+SD+SovKZWiDohaIDXh2CcDfORBGX9H?=
 =?iso-8859-1?Q?eJSnfPD55g=3D=3D?=
X-Exchange-RoutingPolicyChecked: y8FtnogK4p3OkgUvHpvSZgmrEArTn4zZFCaOaTdv0WV/VA8xwKPn71vXM4HQgqj3M5p+RjrQE7WTbywfgnNtMF8m/uce4svLq3eNR4pa7eg5jWDZQW5q0tnfZ1IfA6J2EQOkj/BQyWCucVtaXun5Q3tsODYQxXkR4RW40/zb7dXIJPQsV4apW9wSXEIpW/cunuddmVkbAr1b/+BNGLkzSzneREyPCPb9Lwy6s2zAa8Wn930ksSntAVLnBD/2cS3E2A4EW1emP09tQiPACO1+momrRjbIRSnQnFu1VlGexry5J9AzCbLBGjfdPmSxZCHT64NLEa3hGovy9A+cjPsO7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a32bcb-a822-4788-fe27-08df030c8a14
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 00:54:10.4301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxFgHTaAWvci+W8uX6TI8+ltrc1feYJpaksSRPRrQaBb54+VfpZ6KqPIMYT3JeJ+fNrAVDx1PyAV55ZrvC/H2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD320E2257
X-OriginatorOrg: intel.com

On Tue, Aug 25, 2026 at 05:53:16PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Unportable use of C bitfields inside a packed structure for a firmware message interface.
> - [Low] The patch introduces a static function `get_info_queue_data` without any callers, causing a `-Wunused-function` compiler warning that breaks the build.
> --
> 
> commit 82a6804e91047f9e3f922cd878001d1bc3e9d8ed
> Author: Badal Nilawar <badal.nilawar@intel.com>
> 
> drm/xe/xe_ras: Add support to retrieve info queue data for CRI
> 
> This commit adds support to retrieve info queue data. It introduces
> various structures for the info queue data request and response, and adds
> a function to send the command to the system controller.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > index d25d25f775310..6830872354825 100644
> > --- a/drivers/gpu/drm/xe/xe_ras.c
> > +++ b/drivers/gpu/drm/xe/xe_ras.c
> [ ... ]
> > @@ -661,6 +661,40 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
> >  	return 0;
> >  }
> >  
> > +static int get_info_queue_data(struct xe_device *xe,
> > +			       const struct xe_ras_get_info_queue_data_request *req,
> > +			       struct xe_ras_get_info_queue_data_response *out)
> 
> [Severity: Low]
> Does this function have any callers in this patch?
> 
> Adding a static function without using it in the same patch will cause a
> -Wunused-function compiler warning, which breaks the build when compiling
> with -Werror. To maintain git bisect functionality, every intermediate patch
> should compile independently.

Although sashiko tags this as low, this might break the bisect for most of
us because -werror...
So, please add the maybe unused mark or squash this with the user.

Sometimes separate small patches help reviews, sometimes it is the other way
around. A bigger but complete patch might be easier to review.

And then perhaps only the ABI itself in a separate patch and in a separate
directory like Michal pointed out.

> 
> Could get_info_queue_data() be introduced in the patch that first uses it,
> or temporarily marked with __maybe_unused?
> 
> > +{
> > +	struct xe_ras_get_info_queue_data_response response = {0};
> > +	struct xe_sysctrl_mailbox_command command = {0};
> > +	size_t rlen;
> > +	int ret;
> [ ... ]
> > diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> > index 99b2466e2062c..d87db9f5174a2 100644
> > --- a/drivers/gpu/drm/xe/xe_ras_types.h
> > +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> [ ... ]
> > @@ -95,6 +99,109 @@ struct xe_ras_threshold_crossed {
> >  	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
> >  } __packed;
> >  
> > +/**
> > + * struct xe_ras_info_queue_header - Metadata for large info queue data transfers
> > + *
> > + * Provides chunk metadata for commands that support extended info queue
> > + * functionality. Used when the total data exceeds a single mailbox response.
> > + */
> > +struct xe_ras_info_queue_header {
> > +	/** @total_size: Total size of the complete info queue data in bytes */
> > +	u32 total_size;
> > +	/** @chunk_offset: Offset of this chunk within the total data in bytes */
> > +	u32 chunk_offset;
> > +	/** @chunk_size: Size of the data in this chunk in bytes */
> > +	u32 chunk_size;
> > +	/** @sequence_number: Sequence number for this chunk, starts at 0 */
> > +	u32 sequence_number;
> > +	/** @flags: Info queue control flags (RAS_INFO_QUEUE_FLAG_*) */
> > +	u32 flags:8;
> > +	/** @compression_type: Compression algorithm used; 0 = none */
> > +	u32 compression_type:4;
> > +	/** @num_headers: Number of detailed counter headers at start of queue_data */
> > +	u32 num_headers:5;
> > +	/** @reserved: Reserved for future use */
> > +	u32 reserved:15;
> 
> [Severity: Medium]
> Are these C bitfields safe to use for a firmware message interface?
> 
> When the driver communicates with the firmware on a big-endian architecture
> or using a compiler with different bitfield ordering rules, the bitfields
> in xe_ras_info_queue_header will map to the wrong bits in the underlying
> 32-bit word.
> 
> Using C bitfields inside a __packed struct for a hardware/firmware ABI is
> generally avoided because their memory layout is compiler-dependent and
> endian-dependent. Would it be safer to use fixed-width types like u32
> along with FIELD_GET() and FIELD_PREP() macros?
> 
> > +	/** @checksum: CRC32 checksum of this chunk data */
> > +	u32 checksum;
> > +} __packed;
> > +
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260825175916.1103841-13-badal.nilawar@intel.com?part=1
