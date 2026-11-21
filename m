Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795223917;
	b=nW+rjw/mIJkryl2bF6Y9a5jlJDhbye9+KwAkxkSkKJnAQjx5XH5CfMag0VS6PM0tRsb4
	 FpNFvMbe3A37inCggfTkn+MDaoPVchbiXP41noVT4AOayszS31P03yGPcQcOL9+KDeogL
	 dtwLwkWwPofdilGmn9MFf19uJWE/hD5n32u4ie1f3mEHOdqxxvkMQGZmDu39ryVg3ocO5
	 wi16oUMrP8pdbmWixs6meJ+OdFigpC4sH5L8nTCXQSKWOJADxm2LBmQl6AyKXP3vd62z9
	 kEbcGL0Tjx4NHtmk+IMk4syDBuotTsxo4Gq6kkmk9jAZw0TFODbrdof+3NUgvL/rQVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223917;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=+R2A7O0gPQyy6kuMHRWEYUGHvr8WUVB6SYGu41j+WmM=;
	b=UL+cXJjigz21UW9JqaWsDsHCtIZYomKFHc5GAjJOWbkrl1M1rSXKziabqsUiW9coUZhJ
	 3CCgosIElxXDy8OR8G9j2fL0oz7vvYOg+jp/aATEwGYbEyle5GKj/nlmVs3ELndOayH2u
	 /dMz6klNtnX68iBRZjgRDNj2F+kMafEnFLfMQVcMY8M7tv0kyUJWmgVJyO7IgWtjyGiO1
	 8d6wG1eXI2jOGA6hAANk221ibL9yBL+ggmBlnuBG3o3n1EV70V+0AZnFficBSy0g6YPYD
	 cir1EgsvJfydkhS3r5JC+cdu4SPHlDMcMxJy1jbgFActsAxjZgsu58X30EX7bCwdtfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S7o3elFi;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=I6LczrHT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B4E606A69E
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 01:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62B4E606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S7o3elFi;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=I6LczrHT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795223911; x=1826759911;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=R6+qYGcWmcOA+OlLaBGF9dJR/PbsVVhastmB59wq4Ns=;
  b=S7o3elFihwj5jZHJlqLfQ7AaZdERV+tuKYE49zFSksSqzGQu4rNJAk6h
   FtDTVZSP9HFRERWn5DXCyRDDkkC1ihxrBZNG0cP2urkErTV8jmJU9TC6P
   nV9KHtnx+wGiEdpWzvvoA/7ohntpgDrcFJN/gc1SGjQdilTt4AtfYNbY7
   /Ewa/zqp29kGZkalUWlZxJwTade3HL6vFuLRtCdSyKzBO2Kbbo7m+1UnU
   laPCXXi4yljJw/84++1VfhLiDIoaMHbj+oVBqpCZugn8UM+5hFhWn1Ov/
   QPhTzp2gPeHUcHHSV12fW/HAKIYa3WPKNiimlxTQN64fvl24Ecky8oVs6
   g==;
X-CSE-ConnectionGUID: 1AbnkrHUQZmjteXNJx8YAg==
X-CSE-MsgGUID: lRSTZrsQT8yg5W0uwbP55w==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3959721"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="3959721"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 17:18:30 -0800
X-CSE-ConnectionGUID: yCIu7LA3Tu+VpbdSU2wfaQ==
X-CSE-MsgGUID: e9zMoHXyRo6lucGPfVdyXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10736635"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 17:18:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 17:18:29 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 17:18:29 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 17:18:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6SN1AUlzG+AosX+/uw46cp2MtAINUQhMChuV9WnkFIldYD3lyYaaZvd2f+FpRLxRa3l653D3qYv1vkHEI01jzhqywohiKVOzZC4+bNu23a78JxiTXX9l943MLL3OXtvT5oSOwozmMoTHkSzmHCTCVoYm5HIsE0AkeWjsaGlx/JfUX3p2eFDtWf2GjuoPAiNCoRaqZdW4yYe4AHTo8FzYhjRIEox1kL2wBJpfflFb9uCMZuWSDFya/WgHFZx6JTrJ4AcRdsSmMnrT0+Mg8v6NPW57SqUkyfWwhB5CJ0MzjaV5l9XniEJiEyeyE7UWiqms4iDX0IdhfqTBXs028qQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+R2A7O0gPQyy6kuMHRWEYUGHvr8WUVB6SYGu41j+WmM=;
 b=D6KPfZzIslqA4febKk98jljGucLEB8eT5hN2paahIfq8U9S4xVHe+7fz/h5QcfUS6YvP+ITBUdkYKqUV0AfAWK0GgPxQ9A3EszwnKS4xV/1AhHpqtabg+aBh+lapEz4rf/QXVIYVO2lg5kJ/F0lE6G0Za9PDjzBOS3t1yF5qfmkMJ/fAxVg3KlzDAnDluYCXdWUeBvb/Yt+eLtFgmI8XINwriqRyimFIzPSngbDXX0K5FhwZsvuBCrJKZ9XXETTwNLCJNTicyQPboD8Ld3122bWH2KZ4P0SWHNWAUPAI29z/4aMlo65rl8FJ8YUF9dHqGhA7AE+27Oc7wbszDHcqmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+R2A7O0gPQyy6kuMHRWEYUGHvr8WUVB6SYGu41j+WmM=;
 b=I6LczrHTu8lZ2xTFXKM6ZiyKmY/aIFUIk9vNeTvGJ/EhGiKMfidLOMgKXxIc3HWQ4wa/xRQMge98HNF73Dyayw1zDyTOAxwhA6lsFlkrYfWygvIEaIvORvI17l7tFtANeM2Hb+7htxp5pLVUpoj4cAmfjQkjgWrWEONHFPmI04E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by CYXPR11MB8712.namprd11.prod.outlook.com (2603:10b6:930:df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 01:18:26 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f%3]) with mapi id 15.21.0639.010; Sat, 21 Nov 2026
 01:18:25 +0000
Date: Fri, 20 Nov 2026 17:18:22 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 8/8] drm/xe/oa: Quiesce OA streams on driver unbind
 and PCI reset
Message-ID: <awDxXtG1q3zUs1se@soc-5CG1426VCC.clients.intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-18-umesh.nerlige.ramappa@intel.com>
 <sashiko-outbox-222279@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-222279@kernel.org>
X-ClientProxiedBy: MW4PR04CA0150.namprd04.prod.outlook.com
 (2603:10b6:303:84::35) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|CYXPR11MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b736da-3543-47a7-ca8d-08df476d5783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|261026121527099003|261028144727099003|261022075727099003|11063799006|5023799004|56012099006|10067099003|4143699003|261102123227099003;
X-Microsoft-Antispam-Message-Info: UErr1iZgQ21tZR9gJASAHMC/ZPHWduBhGl6bo2J25gOjgGLF9FgZMDLaAa4lWmZJOMuMfFjcGGU7LOjz2UoBMpJR60TFIdyZXBxqJwL0C9C8KkDpzW0y+La+49aLligDlSO2DQ5k2dRoFq3b2BOsS1WfEmLiwetfsvmS5ila5Shopco3tR+iqJEdGZD1QInHfntM0lG5jxTp/RY9hUoUKOQ5P6WhIbv16iR4IeCrziCIrqp8HU/iKHFz/uYQc2V7UPtg1ZTRS2m+2jb815i5jc/k3xwTxRwCWt9lWZNjDv2v41Pe5rTOkHZEicXPIoCpgjCzxSd7nky5tlsYHtgsnUTsQE3mU1CXY441DlseIIctROGW/6uOsqLoigpLmI8kUud0WA3R+i1GqQWkZTkOmQOKGUMUA2jXqfl6czTChVJy0JWchqfCwMqc5EwvKJLkx3xPalPUqSaM201xM9pdHAuQwuORuhMk8dRdIM668Pz0HGeXn9fBQvp9qCFZN1ZsEfNWgrtpJUck05xSWVwrt6qp3C9PF9ZpiNYo5UREXWPUJuzf65t6VgwdUWxvMvz1AL9m/l2w1q8VK3U6P6VJ2Lly+NMd/AZQ+8G8fCmRbnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7401.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022075727099003)(11063799006)(5023799004)(56012099006)(10067099003)(4143699003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bC94U2JiOEhLcFBtK3lET053SDFkSVBERkk1VVFQNExYVEU1YUU4cDRwSERZ?=
 =?utf-8?B?Z0hORW5INnVRdnJSeXFQbm9KNWRSVit5clFEQlptcEo1RjVBNW9peS9WVncw?=
 =?utf-8?B?NWtlOVM5M1RyeW8vU2VRL1c3YXB5K2xQZTFWRmU3dVAyeTlGWHROdEV3UU5j?=
 =?utf-8?B?OHMwdFMyTUVLVVVQV05kRHg4Yzd6T3lBc2hwdkRLbUhNVlQ3QlR6U3Jpd0RY?=
 =?utf-8?B?c1pzZzNRWEJRaHlNR0I5UityU3JmcUczQW1hRjFrK29ZLzJqUVVLNmJMUDFv?=
 =?utf-8?B?V2VGbmVPNXZvWXNpNmVTS2ZWbHdxZjJnc1V0Q3pCL2xxdXZoaTR2KzNGeUlM?=
 =?utf-8?B?MzhycURwc0YvNGhjRHZzMC9oM0pOZUg3U1Btc0tXWCtuaFg0Qk42RG43Zng4?=
 =?utf-8?B?SUc2cy9sMTh4azIwaHlDanVxei9DMUpUT1ZnZVRBTEdmdVhRTHRPVDZiS3Jq?=
 =?utf-8?B?djRTdVFxQUw3M0xobzZybU9zZU83d05xR1ROQ2wvS1V3N2hoaHgvYU1mb3FX?=
 =?utf-8?B?ZjlHaGhBbDdSVjV4dHcyYTRCU2l4bUlmTXRKQks5S3ZRWERrSitpRGdicGU5?=
 =?utf-8?B?eG12QUowNTI5OGJGY1doSnRScG1WSitDeFd3V0UyWVVlNEJ4QWlKdEx2VXUw?=
 =?utf-8?B?YjVlWlpwdDFvenAydk51eWFNMWdYak9JOWpvWEpJMkt3K0tpRVRlM1p1VERL?=
 =?utf-8?B?amJqNHUxc3NDZ1pDZkp3SjMwSHFZa2x0eit4eUcwQTk2MlBUeTZ2SitPanBn?=
 =?utf-8?B?S2Q3czNWVjU5eTZ1VGxBNXkySWNyeFNtMWpxbWZ6ekVrQVlZaldyOHpYQU5Z?=
 =?utf-8?B?ZFFtMEk1d0taQlBtNG9jYWFSV20yeGRYUmI4SkFMTzZsbG1iNWswdFFsRHVX?=
 =?utf-8?B?NWVnNTBoSWg5ZnEzcHAvb1lZR1hEcEdiQmZieFg0dTlJdGJnQjc5MkxQOWNU?=
 =?utf-8?B?UHdoMzFzd3NCMlBiY3lnQ2UrTDB0WUpjc2E1MmF2cXNNM1ZZeFJIa3djMmZw?=
 =?utf-8?B?akJMbzg3YVVnNXU1Y0k1TlRiQ1FReWYwYlhYdHNYK1pJWG1IYlZ3L2VIVmlS?=
 =?utf-8?B?NHJjckhrNVVIYUhyUE43SjhBZ0dwSmQrblhodUhPMkxtRm5LT2plb3QxVlhu?=
 =?utf-8?B?RWFnT2EzajNHcUdzemxKemx1Q3d6N3VabHNSanBYdEhGaWlRVW03K1VRYi9G?=
 =?utf-8?B?Uyt5eXdXVGExVThmVmFJNXZlcWIvZUQrbmYzeW9CN2FheXBDbVZrSVhVdVBs?=
 =?utf-8?B?M0ZER0szbW1WaEYyWWFqWHVCdkFTOHRCR2VtSTRCeWlnNEFhUjAxVDlpKzMy?=
 =?utf-8?B?dEQ1QzFSU2R5T1VrY2QyWnM1MTJTa3VwaURLSEcxb0hNeVJjWkVkblhqZ3BV?=
 =?utf-8?B?SHlzNWtrUXh1UHVsRkZFUHZ0d3pGT2lwSklweHB4L0FDajh1NlplNWxuMGl2?=
 =?utf-8?B?eXBWMmdzVkZRVlVEejdVeE1oTStkYTdOWXBRWmNQLzhscnhNY3RhaVVVa0Jl?=
 =?utf-8?B?WC9DTHcxYWl0aGVzTkN3ZHVQUGJXZk96ZjNKeFlCK0VKUmE4TXU1QXZSelFa?=
 =?utf-8?B?Z3lVMlVTQzlIQzUrSjdWVzlleU8yWDRhOGM4RTFrc3VlZnAvd1JkRHhvUGp1?=
 =?utf-8?B?K0xsdUtkaGcyUGJzR2RsZU9CVU4xV3BzRWtLcjB5VVZJdE1YT3BNSXZFYXo0?=
 =?utf-8?B?ZnNiVjJsZThkblFqYkNIVkRoMm96TUR4U3ZRSndPdTRRd0pzU25EcEVYVkVt?=
 =?utf-8?B?RUR2Y0RXak5CdWlKR2pXcktyOWNVUzlpWEFoR0VUWFVhRlMvbWtLVU9EbVNn?=
 =?utf-8?B?c2R3RTQ3RTd3Y2hvWGlWUWlwVFQvMWdURVhQRmJJZ1RLbnN1TDhwVHpiblZh?=
 =?utf-8?B?cDkxa3dQd25ybGhibkJGTDlNUEZIakg5T090QWVXcnRyQ3FLSjI3VzQrK1pr?=
 =?utf-8?B?WDlUWXdKRmZDZTJlWTRCdVdlNWFKVmcvb28vOVNaTTJQQXEwTkJYMlBaTHJ6?=
 =?utf-8?B?ZytpTHRRL2F4Q0xhNUtnUGZubkwvWDNzMy9TVHgxclorME5sY3dDMFlWT09i?=
 =?utf-8?B?NE5vTVJZeXVCbTZYUWNWTmdTWXdiNHRIWnhmR1lFVGMzZ09aUjE5NXVhU0tS?=
 =?utf-8?B?Ylk2Q2dJUEhVVGd4Z3BnblBndnBjQXk4UmVycmcwd1RyZUZnanNMVnBIc0cr?=
 =?utf-8?B?WTZUKy8rODI5M1hBb1NyZ1E1bEszY044T1RYZG1YTmtnN1ZhWDlGaEVSVGlT?=
 =?utf-8?B?clo5ZjUrTU1TWTZJeWZKM0hoZitwa05wMDdoYTljYm9ycEFwUmdBS2RYTmJw?=
 =?utf-8?B?bjdYL1FQdHE3Y3FJT2dHWXRjaVBQL2ovZndtMzF5dUpqOHphL0djRWY2am8v?=
 =?utf-8?Q?O+2e7jp9HYynw6nU=3D?=
X-Exchange-RoutingPolicyChecked: u8tacePZDJPFhfavSx5e3LzDDN3bdoz/XZaLhipzCBoGcXJzafFrW/zT7KPS2flPw/n5wK8v7JN7q3KGZTC3rYAhdyEF3Og6bYS5QBAUOMzrsEqcRHHx4EMbnCw3NErjDMT9ZShszOCFbFxuUjMdHZEBTasJQZT7IYd2hSbTAni+BtGmxplY0xKu1yG0f3sx5KjjDiDO6ATMuF6wq95hZE/tTWwk6iTJ6nU94TjqKvpY+/9pvCku1xjE0WcRF1EaUXclma6eM4u0I3+Nquu6E3/QEYrNxifq4YYQ9zwk/pv5UM7/HmQAWKPHi/dsaEEyWM6ouAw7WR8I9evOqHhxPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b736da-3543-47a7-ca8d-08df476d5783
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 01:18:25.6302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a979gwTSa75aE6OQjbzLuwGrS0xfoDOCFoiGaqCfkuCev8U0ul5SLGia9V+OO0p8ILMWcwMzVRb6sm8cQ4LNRSh0JORBiU759wVrOxYHu38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8712
X-OriginatorOrg: intel.com

On Thu, Nov 19, 2026 at 01:11:41AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 5 potential
>issues to consider:
>- [Medium] drm/xe/oa: drm_dev_is_unplugged() race in xe_oa_release()
>  skips ttm.wq flush
>- [Medium] drm/xe/oa: OA buffer BO references can outlive
>  flush_workqueue() on unplug
>- [Medium] drm/xe/oa: missing or blocking drain in xe_oa_stream_init()
>  error path
>- [Medium] drm/xe/oa: NULL sg_table deref on resume after
>  xe_bo_dma_unmap_pinned()
>- [Medium] drm/xe/oa: unconditional drain and batch submit on wedged
>  device in destroy
>--
>
>commit 2b379416db1422398b8cce664304d4acea228c64
>Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset
>
>This commit quiesces active OA streams on driver unbind or PCI reset by
>marking them dead and tearing down their hardware and device resources
>while keeping the stream structure and pinned OA buffer allocated until
>the stream file descriptor is closed.
>
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index 223419347eb7b..0b51bc818ef47 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>
>[ ... ]
>
>> @@ -937,6 +959,13 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>>  	xe_oa_disable_metric_set(stream);
>>  	xe_exec_queue_put(stream->k_exec_q);
>>
>> +	/*
>> +	 * The OA buffer is freed on release of the stream fd, an mmap may still hold a
>> +	 * reference on it. Drop its DMA mapping now, while pinned: the fd may be released, and
>> +	 * the BO unpinned, while xe_bo_pinned_fini() DMA-unmaps it without the BO lock.
>> +	 */
>> +	xe_bo_dma_unmap_pinned(stream->oa_buffer.bo);
>> +
>>  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>>  	xe_pm_runtime_put(stream->oa->xe);
>
>[Severity: Medium]
>Can calling xe_bo_dma_unmap_pinned() here while stream->oa_buffer.bo stays
>pinned on xe->pinned.early.kernel_bo_present cause a NULL pointer
>dereference if the device suspends and resumes before
>xe_oa_free_oa_buffer() unpins the BO?
>
>CPU0                                  CPU1
>xe_oa_release()
>  xe_oa_destroy_locked()
>    xe_oa_stream_destroy()
>      xe_bo_dma_unmap_pinned(bo)
>        xe_tt->sg = NULL
>      xe_pm_runtime_put()
>    xe_pm_runtime_put()
>                                      xe_pm_suspend()
>                                        xe_bo_evict_all()
>                                      xe_pm_resume()
>                                        xe_bo_restore_early()
>                                          xe_bo_restore_and_map_ggtt()
>                                            xe_ggtt_map_bo()
>                                              xe_res_first_sg(NULL, ...)
>                                                <-- NULL pointer dereference
>  xe_oa_free_oa_buffer()
>    xe_bo_unpin_map_no_vm(bo)
>
>Non-MERT OA buffers are created with XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT
>and remain linked on xe->pinned.early.kernel_bo_present until
>xe_bo_unpin() removes bo->pinned_link.  Once xe_oa_destroy_locked() drops
>the last runtime PM reference, a system or D3cold runtime suspend/resume
>cycle will evict and restore the pinned BO via xe_ggtt_map_bo(), passing
>xe_bo_sg(bo) == NULL to xe_res_first_sg().
>

Addressed in v9. The runtime pm move patch (6) is dropped and the oa 
buffer is freed with the runtime pm held. Also the dma unmap is only 
needed for the quiesce path and is moved to the quiesce code..

>[ ... ]
>
>> @@ -1754,19 +1786,35 @@ static long xe_oa_ioctl(struct file *file,
>>  	return ret;
>>  }
>>
>> +/*
>> + * Disable the stream, restore the HW state and release everything but the OA buffer and the
>> + * stream struct, the same whether the stream fd is closed or the device goes away, and
>> + * whether or not the HW still responds: all HW waits are bounded. Afterwards the stream is
>> + * dead and any further read, poll, mmap or ioctl on the stream fd fails with -ENODEV.
>> + */
>>  static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>>  {
>> +	unsigned long flags;
>> +
>>  	xe_pm_runtime_get(gt_to_xe(stream->gt));
>> +	mutex_lock(&stream->stream_lock);
>> +
>> +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>> +	WRITE_ONCE(stream->dead, true);
>> +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>>
>>  	if (stream->enabled)
>>  		xe_oa_disable_locked(stream);
>>
>> +	wake_up_all(&stream->poll_wq);
>> +
>>  	xe_oa_stream_destroy(stream);
>
>[Severity: Medium]
>When the device is wedged, does xe_oa_stream_destroy() stall for multiple
>seconds and log a timeout error?
>
>xe_oa_stream_destroy() unconditionally calls xe_oa_stream_drain() and
>xe_oa_disable_metric_set() without checking xe_wedged().  If
>stream->last_fence is unsignaled when the device wedges (for example when
>a config batch is waiting on an input fence or after xe_oa_emit_oa_config()
>breaks out of its wait loop on wedge), xe_oa_stream_drain() sleeps
>uninterruptibly for job_timeout_ms + HZ and prints "Timed out waiting for
>OA batch".  Then, when stream->exec_q is set, xe_oa_disable_metric_set()
>calls xe_oa_configure_oa_context(stream, false) to submit a new batch to
>the already-wedged queue (which guc_exec_queue_run_job() does not submit
>to hardware) and waits again in xe_oa_stream_drain() until TDR or timeout.

In v9, xe_oa_stream_drain() returns right away on a wedged device. That 
should avoid the stall.

>
>[Severity: Medium]
>Similarly, in xe_oa_stream_init(), what happens when
>xe_oa_enable_metric_set() -> xe_oa_emit_oa_config() cuts its synchronous
>wait short on device unplug or wedge (introduced in commit "drm/xe/oa:
>Fence OA ioctls and mmap against device unplug and wedging")?
>
>drivers/gpu/drm/xe/xe_oa.c:xe_oa_stream_init() {
>	...
>err_put_k_exec_q:
>	xe_oa_disable_metric_set(stream);
>	xe_exec_queue_put(stream->k_exec_q);
>err_free_oa_buf:
>	xe_oa_free_oa_buffer(stream);
>err_fw_put:
>	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>	xe_pm_runtime_put(stream->oa->xe);
>	xe_oa_free_configs(stream);
>	...
>}
>
>At that point the config batch has already been submitted to
>stream->k_exec_q and recorded in stream->last_fence.  Unlike
>xe_oa_stream_destroy(), err_put_k_exec_q does not call
>xe_oa_stream_drain() before xe_oa_disable_metric_set().  When
>stream->exec_q is NULL, the in-flight config batch on stream->k_exec_q is
>never drained before OA registers, forcewake, and runtime PM are released.
>When stream->exec_q is non-NULL, xe_oa_disable_metric_set() queues a
>context-restore batch behind the unsignaled config batch and blocks in
>xe_oa_stream_drain() for job_timeout_ms + HZ while still inside the
>drm_dev_enter() section of xe_observation_ioctl(), blocking
>drm_dev_unplug().

In v9, drain the batches beffore xe_oa_disable_metric_set in 
err_put_k_exec_q: to address this.

>
>>
>>  	if (stream->exec_q)
>>  		xe_exec_queue_put(stream->exec_q);
>>
>>  	drm_syncobj_put(stream->ufence_syncobj);
>> +	mutex_unlock(&stream->stream_lock);
>>  	xe_pm_runtime_put(gt_to_xe(stream->gt));
>>  }
>>
>> @@ -1775,14 +1823,24 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>>  	struct xe_oa_stream *stream = file->private_data;
>>  	struct xe_gt *gt = stream->gt;
>>
>> +	/* gt_lock serializes against xe_oa_fini(), which destroys the stream on device removal */
>>  	mutex_lock(&gt->oa.gt_lock);
>> -	xe_oa_destroy_locked(stream);
>> +	if (!stream->dead)
>> +		xe_oa_destroy_locked(stream);
>>  	mutex_unlock(&gt->oa.gt_lock);
>>
>>  	xe_oa_free_oa_buffer(stream);
>>  	mutex_destroy(&stream->stream_lock);
>>  	kfree(stream);
>>
>> +	/*
>> +	 * Freeing the OA buffer may defer the BO destroy to the TTM workqueue. Once the device
>> +	 * is unplugged, this may be the last reference on the drm device, so let the destroy
>> +	 * finish before drm_dev_put() releases the GGTT.
>> +	 */
>> +	if (drm_dev_is_unplugged(&gt_to_xe(gt)->drm))
>> +		flush_workqueue(gt_to_xe(gt)->ttm.wq);
>> +
>>  	/* Release the reference the OA stream kept on the driver */
>>  	drm_dev_put(&gt_to_xe(gt)->drm);
>
>[Severity: Medium]
>Can xe_oa_release() race with drm_dev_unplug() and skip flushing
>xe->ttm.wq before dropping the final drm_device reference?
>
>CPU0                                  CPU1
>xe_oa_release()
>  xe_oa_free_oa_buffer(stream)
>    ...
>      queue_work(xe->ttm.wq,
>                 &bo->delayed_delete)
>  drm_dev_is_unplugged(&xe->drm)
>    --> false
>                                      xe_device_remove()
>                                        drm_dev_unplug(&xe->drm)
>                                        ...
>                                        drm_dev_put(&xe->drm)
>  drm_dev_put(&xe->drm)
>    drm_managed_release()
>      ggtt_fini_early()
>        drm_mm_takedown(&ggtt->mm)
>                                      ttm_bo_delayed_delete()
>                                        xe_ttm_bo_destroy()
>                                          xe_ggtt_remove_bo(ggtt, bo)
>                                            <-- use-after-free on ggtt
>
>drm_dev_is_unplugged() drops its SRCU read lock immediately, and nothing
>during device removal flushes xe->ttm.wq for an already-deleted BO.  Because
>ggtt_fini_early() is registered with drmm after xe_device_destroy()
>(which calls ttm_device_fini() to drain xe->ttm.wq), the final
>drm_dev_put() tears down and frees tile->mem.ggtt while
>bo->delayed_delete is still pending on xe->ttm.wq.

This is a case of deferred destroy and seemingly affects other BOs as 
well, so should be looked at in a separate series.

>
>[Severity: Medium]
>Even after the device is already unplugged, can a temporary reference on
>stream->oa_buffer.bo outlive xe_oa_free_oa_buffer() and cause
>flush_workqueue(xe->ttm.wq) to run before bo->delayed_delete is queued?
>
>CPU0                                  CPU1
>xe_device_remove()
>  ...
>  xe_bo_pinned_fini()
>    xe_bo_apply_to_pinned()
>      xe_bo_get(bo)
>      spin_unlock(&xe->pinned.lock)
>                                      xe_oa_release()
>                                        xe_oa_free_oa_buffer()
>                                          xe_bo_unpin_map_no_vm(bo)
>                                            xe_bo_put(bo)
>                                        flush_workqueue(xe->ttm.wq)
>      xe_bo_dma_unmap_pinned(bo)
>      xe_bo_put(bo)
>        queue_work(xe->ttm.wq,
>                   &bo->delayed_delete)
>  drm_dev_put(&xe->drm)
>                                        drm_dev_put(&xe->drm)
>                                          drm_managed_release()
>                                            ggtt_fini_early()
>                                              <-- ggtt freed before
>                                                  bo->delayed_delete runs
>
>Because xe_oa_stream_destroy() leaves stream->oa_buffer.bo on
>xe->pinned.early.kernel_bo_present, xe_bo_pinned_fini() still visits it
>and holds a reference outside xe->pinned.lock.  Similarly, in
>xe_bo_unpin_map_no_vm(), xe_bo_unpin() puts the BO back on the TTM LRU
>and unlocks dma-resv before xe_bo_put(bo), allowing xe_shrinker_scan() to
>grab a temporary BO reference.  In either case, xe_oa_release() flushes
>xe->ttm.wq before the last BO reference is dropped.

same as above. Need to be addressed separately.

Thanks,
Umesh

>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com?part=8
