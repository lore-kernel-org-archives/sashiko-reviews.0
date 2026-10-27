Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793130056;
	b=lhO3At66We39Q3iYqZIlqWtZg8RB2o7qUmLSOONIIQDAWUqp1/EnEpiuwPPJpjF54vLU
	 mXCW4v80zW04rEdCgu4ec9Itne8OIkgWXbpcs7mrQXAovhOXTetbuhq+XAXKLJEJgzcOO
	 4dz7Hmb6kCnZmwOrXMYT5Y/bjIhK/37Z3T0egoI+KRx0TVJK2uYYJ+9Py4cPuyEhacvTG
	 rr4NuC6rKVaKHkVmwEUmm6q8k+BF6fIzeRbkfDooofYTjsMPmcKg5rn+YVtU2vTVUxPvZ
	 DBU9ENOnbzXgRED+wXaeTirXwUMYna3TijQDsdRFJfK8ZRS1xYjtFWHlk1ihiDXJBxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793130056;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=0sud/BK9MoNQAFON+d86NBeT9p51dT4rjdS2NSws+CM=;
	b=oY3VqzM6xfyD9WmrmZ5f5dxuLj9thfaGmk7WTyKFZfxf1IwEessDhRHAOvas0dJsaWMG
	 nq/cCQupD9G46KFyL7vHuXUPrYSrgraKT+Q6HNTMLb7oMgWT16uBCOcGMjIjgbQDihICL
	 Ym5EnfzearBgMPsKgyeWeCEJ6UUjkg+5K+hKxn/VJRa1ZixJizlsxeQxMwXiiIHapK9/W
	 yCjBpFkz5hiWyJZV0vsNiWJy9ZpWe+kyzL5YzsheCeGEvnJgcx9fcZxsP7hTnmjPfVS5A
	 yyXyRniCqU4T9fB/+HdvcFFH6SLuv0fYEySx/wP4GSDa3xjpZLNEcVmTfS14+f8bzGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B62w8Va7;
	arc=fail smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B083A606A31F
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 19:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B083A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B62w8Va7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793130054; x=1824666054;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Cn8ha/UX6geWrjHUs9twB/3QSPHq2S1C5Jjnj2ZYQrc=;
  b=B62w8Va7X/g+1qlPrPn4iOYsJ5Cm5iwL1M2WFTtHYjZoddX9pZVRK9XQ
   6qCMdcKHxREAR3lzbEnFlytf9XDbOyY4vrESiKMrxhOle/grQcvMzYDBG
   P+xKrm6CR4EecawrCy22fw76Cm03alKFo3T//JzjGJdXZyEKX7+cnuzgH
   euhmcz1OkrATK76DYIHkXEtLcW/PcYSut9Vpx6U+Q3n8yAn1PQlm5gKb2
   tlAcrb83MpYKE/nNlDISnx9d+VZ4UFQIv0EZGmfr6OfuWDEMZNUgAMhJC
   bKrum6QTeZ9JXK7WfziVNpV0swIOZrTRXSgwK8GL+tjuj+lXh8B/Ccbwx
   Q==;
X-CSE-ConnectionGUID: hV2oPngySCufn6vaOTsn7w==
X-CSE-MsgGUID: Y/HtX+AuRpipVQpV73Ro1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1736039"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1736039"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:40:53 -0700
X-CSE-ConnectionGUID: gYE/sMQWS4m/5tXwPBM3cg==
X-CSE-MsgGUID: GW5z1/+6R4ydBYHq0gAGxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4587525"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:40:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:40:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 12:40:53 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:40:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usc+iDu+XuF81PqAUJJEtdZpfafL3ixYN6Setvuqr5X9G8Mk41UbcnC5j6HkQSiMEMIA7pJCBQl/YAL1jWDLDcP0Xeukt1G3cRZ9p1Tj3hwp9zOWFkZpoWvZVwkktHeabPEN5DmKcBAx4VOS28skyHhCQngcIzN4v/HZgPQ3bP5+8tGA225WyVldAUlvV1VWUNWoQFHKYsI8Q4NmbX+P9vrIwG+DG6doLNxHGLQvB/lgq+r0GeChzT4U46LGLj8jMGInZNpPwY54I38WgJTWMfWETTKJeh9krkg3YWpVKCxb1lpQ8Yi1jxZDHdrCb8TOZbE2++uFE1XpFfnCNsz7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9p60OpTQtgX+DsgRHqvKFFcOFlyYLFbqCfR5rU/0Oc=;
 b=n0sf8zjE3z1Hz39n+WPSRT9EZuzBJYzB3eL2kTuHGnsy0Ai8oUwhpsjxuCvobQovk3cX8Pb6V0suDU5vOtA9fv8G2MSxBM71JiOA8Wo9/2DP99e1l1rFaluZy4XMReS0xnu58LCzAJyG2Q+JUiUgs1H4+zUC4vfBpJ20HYesGe3y0+TKVJ4CSEVIz85WYd6LUM13gcglzKMPamstWc1wq4K2O+p015GifJqEbW6amldOk6Ldz4biPfSpFylSRHObDUN2KKisl6eYSPYUX9KKjuA+Wv0BZC/z+hb3k+1mglz+oRXu+TfOtuTNoMGl6GUztdUwtDkUTUbHW5o9z+ycMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by CH3PR11MB291940.namprd11.prod.outlook.com (2603:10b6:610:366::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:40:50 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:40:50 +0000
Date: Tue, 27 Oct 2026 12:40:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 3/5] drm/xe: Leave the VM bulk move on BO release, not
 on GEM close
Message-ID: <auD+QGnArEx1GAOJ@gsse-cloud1.jf.intel.com>
References: <20261027183638.1031299-1-matthew.brost@intel.com>
 <20261027183638.1031299-4-matthew.brost@intel.com>
 <sashiko-outbox-187039@kernel.org>
 <auD1DQSSOgXvtLgE@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auD1DQSSOgXvtLgE@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0340.namprd04.prod.outlook.com
 (2603:10b6:303:8a::15) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|CH3PR11MB291940:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a0c64f-92bd-47bb-0db1-08df346234c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261026121527099003|11063799006|4143699003|56012099006|10067099003|261021123027099003|261021121427099003|261022105027099003|261009221227099003|261009223027099003|261022075727099003|18002099003|22082099003|6133799003|261026140227099003;
X-Microsoft-Antispam-Message-Info: DgcAn64lfK3LTLckUe6WXddP8GA9nEN7UEk4xHGP8lj/N/L0UmZjbOXhFS1uX9QKXaiCJkV80VjpF6+a3DYH3+ORY3xONG+X5vMsZRtg6NGSmqeOWgZNm2Hyw08Q28rNNvltjK/VGQoOcHjDQB8sFYKBrsK9EHA4mjh3eSDk9VHTTHLZaciGxYmzygKBcyqPVCdaYW3YTd0ICO8PmXWOtCH9yYdVinHvGkAdsXFy95n6RJHeq8ITGIdCfQVz6DUCXeXrY+u/ziZPth3w5F9zFhxIMFmSSFolyO+PiLjeieIBtP1V4mf7LDn7U9EpyRnBvvSKLcds/VryzkltjUmUFzeMhetd8nDcFNQsdvUeU1XDhomGzFNU2N79QxemhGboO077m7vGLkpq77SKGVbrAbQ32rnMyndOdLapM3AELF/eyUg4x5cNbNMkJbBe0TND9+35Mpmq5tfDproBzJUv6mqCU5X7Lmf0aF8cAi0ntg6eF268rzvAzmT6xlnkJP8l6XIvQ/Nk2oe4fjTRxSZagIWK9MYncfGQ9GoUfUZonUGb2S5OBbbk3zv05N9JI5Hamp5deDRriBzPpgSBVzRgw5ohF4Jf77LeRLHkeXFLbwU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261026121527099003)(11063799006)(4143699003)(56012099006)(10067099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009221227099003)(261009223027099003)(261022075727099003)(18002099003)(22082099003)(6133799003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ad/5hAuGublTPo5b1geB8TmI0kzitdlbsB9lEJESWzJBLhGM6YkAqlTA+Q?=
 =?iso-8859-1?Q?Lma0zZ5V4QkS11/gPrImPhmqJ/UJSpQx1FTaXpFB4wvdmfbzzaSaclF/Tb?=
 =?iso-8859-1?Q?Sp92H2ARghXoT4Xa2lE/s+FuUHXBaDPxgCe0CABU44LmR3OJWG9mVVpOeY?=
 =?iso-8859-1?Q?rtcHPr536btgKwEyhALOYI+ywbXWL8FUKngHIkVzIWtxMblHT6wAP7Lu5E?=
 =?iso-8859-1?Q?IcX2sFDYLDvvV5jU3wBZlZEpgJzsw5+ha5lX9KFURRA51IbVrASDugtGMW?=
 =?iso-8859-1?Q?P1VfWFN74HycgQ3iImCURoPsbj9gpd1B7b0zyiTdkVx8/VLYNFRsORj1oa?=
 =?iso-8859-1?Q?+3WjHarw0q8AW4DxRiQiFs9/mKSAm9TIgz3u4Naot0M2SZYbKOSkB0p+K/?=
 =?iso-8859-1?Q?UpehdHe9qzbNVgrZ2qQXHskTqT0+OHC5S8Bz2+66nE61Wqx9tJkYWRyNo4?=
 =?iso-8859-1?Q?83kjfOSxdIc5+3V1a3jDkyZUY4TUaoZvSMOUxV+q/udLYc2TeLdUXCys78?=
 =?iso-8859-1?Q?mW7Q1KwNP32K6z54k+4lJQH3FY7Q9CKE8LDOfuSKlLaGXc/hZq+xiKVNtc?=
 =?iso-8859-1?Q?xiw4mXMHJyHY8pjfdh1EZu0z6dndY3JGUsAaaKHSfhBb58h0d6ylyQ75Yv?=
 =?iso-8859-1?Q?84hDz6gmzLw/RIG9ZhDrVXcJF7Jnk0qrC6hqW8kHFnP4yUYMzxu/aqA+gZ?=
 =?iso-8859-1?Q?vB7KggNMziWxhL5Ko1o15jHobmaaslBKDSZbmGZOJFqw4sGbg2wIo55XrN?=
 =?iso-8859-1?Q?9E7eosGqSIoEGUUP2nnaUqtKuOARY4C/ch3j8MRJmYC6k684WHIB6d8qp3?=
 =?iso-8859-1?Q?jLpF68evWO4xb4hFqb8ISFOfIxXSRTJID1mCR292E5LVXRwyelsWIukaOd?=
 =?iso-8859-1?Q?4l2+MxB0hjw3ALpe99CUF6X+IUBD2KI1j7JyKg0u32EC+7ZTMSlPy7nAzX?=
 =?iso-8859-1?Q?2+o1WqEtp70GSAi+lQL/I6GF8cIgxH/7mAjph35V3X35cu4caBWeuNDmj2?=
 =?iso-8859-1?Q?bJmbrrSEF6/JK47DSbHSrRIrRGUeLS0RC+5M1flJ89BpQASN3DzxZrvrQk?=
 =?iso-8859-1?Q?Qfkxyq8TA7cLDE2MF4Fdyc74BSzOeOp9X4xB8dRH0K2LRph+2RtwIPx6Kn?=
 =?iso-8859-1?Q?OMij1vuFYpySIb7VQGB0U3byNgazwQ8gJ5auRcsROjImwNta72FsG/7aco?=
 =?iso-8859-1?Q?FTb5bSANoBmQkqYTBCgwUe3g49BgYj1AH7lRb7b+kUM2l4zJK/rhoPJMuA?=
 =?iso-8859-1?Q?i2agtLIJWKK/kJTFU4K/xUHphrrjOtgLYYiasLZ0RDUZy1W52/+mp39eRa?=
 =?iso-8859-1?Q?eN3sxWU7j3bA1xUVPmxEv81CjHljisvOoT0240KsYeaRvYx1sSD/NXlsPg?=
 =?iso-8859-1?Q?C90ytwFsi1kh/Q1MnlYwLtJq1JB8DoI8B5hps67W9e+TXTA7LKRCajqwkg?=
 =?iso-8859-1?Q?5GfFaGZs7FwAM8976GZwjmJ7b2dc78jrf7nzBLwvFNljjqx4dY7i/9FXF3?=
 =?iso-8859-1?Q?sWCwlBPa7W2LnwnvuIjLxwfXIkrITBFQ5pvYfzjo6UjWnaUFmIN+DUAihW?=
 =?iso-8859-1?Q?gwO41GVV1aB8OmO0xjty3iT3joXTpFU9HbxjLvTXVbnPwXxe0xwZRSwpYj?=
 =?iso-8859-1?Q?vxYqkFFXxWA8ogWCnsc9TT10JUS9m1xZNnXrIV5fLNvxnn19TeKpmvRgTo?=
 =?iso-8859-1?Q?LQqMOUk6bQvSfNSS3znoCwaLY8hEaUP0f3IHXWZpUmAY0tXLfYhT5g5NG0?=
 =?iso-8859-1?Q?6dtm7EqwKYHjGbCKVRI99dIUBilkG1Yc2RU+f3FMsiSPmNDJ1rdRa5Td/Z?=
 =?iso-8859-1?Q?Dww+ef1nMA=3D=3D?=
X-Exchange-RoutingPolicyChecked: wwtPftlbkHLnSFjiUZ+mKUSSSX6Bw8fOV9/J046eevbtePB2LB1RBBOix+uYnv+lffFaeS3l0ZTolcsbXcNQJDozbX98Yob6912v3zi/VDZR0uJyVJj2m3rUj/XwqdasDZ7+b835uco8hxLJt7tpv+tf9Cf2GFdvP/JtHU0xfG+0AXT+834eN4Y2FdEuB3pqxnMtNfi4kgONGgahHO2NhvtGnTI91/ihaeS1lSd1BaCTRYr7Bqj45MGYrgeuk4Hg37sYuu2FXPMJyP18QPwkaHgu5Osu4PYn3xeCJhfNC87YppipqOpmmTzQbg2w9EWInxzuBKrFSgSknzEKRcTD6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a0c64f-92bd-47bb-0db1-08df346234c4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:40:50.8200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rzf/GfX1unq1pjr7hf78EVYYU+Q/Z1OlAUiqfj5P/w3WZnEaUrfzFERrAZEZBUbmmgC/xhGKEsluvH78ciTCBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB291940
X-OriginatorOrg: intel.com

On Tue, Oct 27, 2026 at 12:01:33PM -0700, Matthew Brost wrote:
> On Tue, Oct 27, 2026 at 06:47:57PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] drm/xe: bulk_move detach in xe_ttm_bo_release_notify() violates TTM invariants
> > --
> > 
> > commit 5d85520c1e2e507cc032c4248bd48c50a734e710
> > Author: Matthew Brost <matthew.brost@intel.com>
> > 
> > drm/xe: Leave the VM bulk move on BO release, not on GEM close
> > 
> > This commit removes xe_gem_object_close() and moves the detachment of a
> > VM-private BO from its VM's LRU bulk move into xe_ttm_bo_release_notify()
> > so that BOs outliving their GEM handles remain part of the VM bulk move
> > until release.
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 42a6aa1a2e4a0..ba16b260dbcb7 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1869,6 +1869,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
> > >  	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
> > >  		return;
> > >  
> > > +	/*
> > > +	 * Leave the VM's bulk move, which is only kept alive by the VM, and
> > > +	 * whose LRU position no longer says anything about a BO on its way
> > > +	 * out.
> > > +	 */
> > > +	if (ttm_bo->bulk_move)
> > > +		ttm_bo_set_bulk_move(ttm_bo, NULL);
> > 
> > [Severity: High]
> 
> Ugh, this is correct - this patch doesn't work but the code prior to
> this patch is also incorrect.
> 
> I'm not immediately spoting an obvisous solution, so I will just drop
> this patch for now.
> 

So it probably is;

 - If in xe_gem_object_close if bind count == 0, remove from bulk
 - If in a bind operation, bind count == 0 and gem handle closed, remove from bulk

I will do this part in an independent follow up.

Matt

> Matt
> 
> > Does detaching from bulk_move in xe_ttm_bo_release_notify() happen too late
> > in the TTM teardown sequence?
> > 
> > When the final reference to a VM-private user BO on a non-fault-mode VM is
> > dropped via xe_gem_object_free() -> ttm_bo_fini() -> ttm_bo_put() ->
> > ttm_bo_release(), ttm_bo_release() checks bo->bulk_move and individualizes
> > bo->base.resv before invoking bdev->funcs->release_notify():
> > 
> > drivers/gpu/drm/ttm/ttm_bo.c:ttm_bo_release() {
> >     ...
> > 	WARN_ON_ONCE(bo->pin_count);
> > 	WARN_ON_ONCE(bo->bulk_move);
> > 
> > 	if (!bo->deleted) {
> > 		ret = ttm_bo_individualize_resv(bo);
> > 		if (ret) {
> > 			/* Last resort, if we fail to allocate memory for the
> > 			 * fences block for the BO to become idle
> > 			 */
> > 			dma_resv_wait_timeout(bo->base.resv,
> > 					      DMA_RESV_USAGE_BOOKKEEP, false,
> > 					      30 * HZ);
> > 		}
> > 
> > 		if (bdev->funcs->release_notify)
> > 			bdev->funcs->release_notify(bo);
> >     ...
> > }
> > 
> > Because bo->bulk_move is still set upon entering ttm_bo_release(), releasing
> > such a BO will immediately trigger WARN_ON_ONCE(bo->bulk_move).
> > 
> > In addition, ttm_bo_individualize_resv() switches bo->base.resv away from
> > xe_vm_resv(vm) to &bo->base._resv under bo->bdev->lru_lock and then drops
> > lru_lock while the BO's resource is still linked in vm->lru_bulk_move:
> > 
> > drivers/gpu/drm/ttm/ttm_bo.c:ttm_bo_individualize_resv() {
> >     ...
> > 		spin_lock(&bo->bdev->lru_lock);
> > 		bo->base.resv = &bo->base._resv;
> > 		spin_unlock(&bo->bdev->lru_lock);
> >     ...
> > }
> > 
> > In the window between ttm_bo_individualize_resv() and
> > ttm_bo_set_bulk_move(ttm_bo, NULL) in xe_ttm_bo_release_notify(), another
> > thread holding xe_vm_resv(vm) can access vm->lru_bulk_move while the dying
> > BO is still pos->first or pos->last:
> > 
> > - Calling xe_vm_bump_lru() -> ttm_lru_bulk_move_tail() will fail
> >   dma_resv_assert_held(pos->first->bo->base.resv) or
> >   dma_resv_assert_held(pos->last->bo->base.resv) in
> >   drivers/gpu/drm/ttm/ttm_resource.c:
> > 
> > drivers/gpu/drm/ttm/ttm_resource.c:ttm_lru_bulk_move_tail() {
> >     ...
> > 			lockdep_assert_held(&pos->first->bo->bdev->lru_lock);
> > 			dma_resv_assert_held(pos->first->bo->base.resv);
> > 			dma_resv_assert_held(pos->last->bo->base.resv);
> >     ...
> > }
> > 
> > - Adding or moving another resource in the same bucket via
> >   ttm_resource_add_bulk_move() -> ttm_lru_bulk_move_add() will trigger
> >   WARN_ON(pos->first->bo->base.resv != res->bo->base.resv):
> > 
> > drivers/gpu/drm/ttm/ttm_resource.c:ttm_lru_bulk_move_add() {
> >     ...
> > 	} else {
> > 		WARN_ON(pos->first->bo->base.resv != res->bo->base.resv);
> > 		ttm_lru_bulk_move_pos_tail(pos, res);
> > 	}
> > }
> > 
> > Conversely, if ttm_bo_individualize_resv() fails (for example, if
> > dma_resv_copy_fences() returns -ENOMEM), bo->base.resv remains
> > xe_vm_resv(vm), while xe_ttm_bo_lock_in_destructor() only trylocks
> > &ttm_bo->base._resv. Calling ttm_bo_set_bulk_move(ttm_bo, NULL) in
> > xe_ttm_bo_release_notify() will then fail dma_resv_assert_held(bo->base.resv)
> > in ttm_bo_set_bulk_move() and ttm_resource_is_swapped(), and mutate
> > vm->lru_bulk_move without holding xe_vm_resv(vm).
> > 
> > Should bulk_move be cleared before ttm_bo_release() runs (or before
> > ttm_bo_individualize_resv() detaches bo->base.resv from the VM reservation
> > object) while holding the VM reservation lock?
> > 
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20261027183638.1031299-1-matthew.brost@intel.com?part=3
