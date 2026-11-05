Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793866773;
	b=uMtQBQBMBkhTC9xQH2dbNk/ij+JtjR+N41aqZIl7o97DTbwJNDq2M2vTdcWuGtpmT7rJ
	 vIWXebiytsYufpg5kb4EGDgaNn+snDKaDoIOogsI2UYHBOPYk037jAfb5tXMvXKL6av3w
	 zwzzz0ScfO64+tSZK8vAA3TVxM7ULGR5+BL1ITY6Eu7M9jJ/Su052gk3Wz8ieseX6hAXU
	 3O69moh0MRmX7i4IcMVs8tfkIypIAR5ur1+56IIRsyJIVBHJyvJ0Fi7xHRyng6UsDCKhy
	 m1WaOn1FwuT5LqusQ+o4W8bkjsaGKQxobFE7yR5DB1HCgOWImGvRggVVmxu7E0BeGTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866773;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=1ciCV+5l0i9zrEoZ6NLRIUsvaRDxV3/LTluwEuP5vMw=;
	b=l8/c93T7T0tTFWDQ+btE7GpalQrJlEzmIMgwcl/xgbuCPGB3IF+mMb4g4QperxVPdqRk
	 E5/KQf0frW3EF5roEGmr2lcpS7WDXvj8n33AFbDdEuKCCV8F0HYwX0F8ILBxq1GkvNhCn
	 mPrXcldd3LmTSRbiYOUwjZNhaGkfSW2ySuMcneI4NSld2Ui4Rs0teVahHbQsA0e+4IKdr
	 S/3mo8HPiIzoEy1cK0TUwrEu0s8Cw7QLnmNMiLRjot6tnOOB2wPyetd0UEL3gDlynchbp
	 Ee+T4Q02dxVJpx4YtIKyqtN7/F9mwNmeBAPMfQ8/2/oDhSGNuCO1+ebb2eK84oGDW5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I36hk0yz;
	arc=fail smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1049B606A326
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 08:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1049B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I36hk0yz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793866773; x=1825402773;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=dvQ+0JdSVT8fqMCSXYtYPQ6UFNgysrTcm4Og3+Dne5k=;
  b=I36hk0yzsLTH1MYxEVCGRVOf2sEcLBwm8dpMNKpKaYV4iz6wGZbQR+/g
   tLKRxGV6M6a1Ru1tWVgNp/TEfPClmTPfcpUFGD9DcidUfJQcT+sbsVvCE
   9DQoJysNCito4dBhQJR6Z2s4/4DaGlXuZquHrSX623rpYfUji8jyKV04C
   T15orlSHHbR9Hs9tZJcBfQcJyOSzDg+n7zQiuYjlHtxi5dGBQz0ucjiLv
   i7gfnzYsMUSF7ztQ+jUxZedGhtQmEbuj0OX/4RAc5ZemBhDYvUF9xFL8N
   TpNzo4P5Rsa+AcH3pM7w27FEC2GuCTjv7lXImoYPh2X7XqSNUsISZrhhv
   A==;
X-CSE-ConnectionGUID: Zxhr47CWRDK8u7VEDa7YAw==
X-CSE-MsgGUID: 2hvrSJ1/TDWGikBIaHe8MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2649926"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2649926"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 00:18:57 -0800
X-CSE-ConnectionGUID: K0yzoWqZR6yGiTG2hGVqtA==
X-CSE-MsgGUID: GUUjI8lCRvq4FdfWg8uU6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7060518"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 00:18:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 00:18:55 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 00:18:55 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 00:18:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hu6kQGbI3pVnF8WvWAveMOWmRIXc/h0JynGQkFypwYDIrHdcxtiW+JPdZxfj2rh4i1Xrv0EIil5FWjMmwIWLYUwwvVFD19MBM95noF0YMd9icLTvAB7Mgk1bpD/hZxMu+RsvmHg6GveGOSLfqAdUT3GJvlcQ7JnEaK+QjpOdGSrOKw/LfDlfMgcJlV3kzv/hp/v44RLxDuVRGFTIUuTJEnNJJkB6vcnuIJcWCgX4KYzI4kJbBiguPvG1ouP0jYr8s4rEMAS+cgaVGqKy6hEmyhQYD8mtTnM7WFOTy67d4a23DUXlcNM9NuUHNAoPUXoaeAwBwgcerlxlPPtYBurEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ciCV+5l0i9zrEoZ6NLRIUsvaRDxV3/LTluwEuP5vMw=;
 b=P6DrnA7EISUm7xwzClWaTCQ0CDfo+QpFT+0eKv9GAYL1XjzFV7OMpRWosa3kJuXSqAGGK1/3u/ohqkgtN2o9UwzcZIeUWjoE+t0CCoJ0nelpwOnCIINwbH8884F6xkIcmXUUVV6VfURcMHmv+OLDBWHKHqrGMNn4dJLg85el9yBXIjwM3ERGTvBQpytEtoW/xFwbzKvNLqekgioaYszjkTeZbras+jAMcS3iYpH084t/uVY3XZuMfZyf6Ks84nQB/o66l2s3zK3k/2DX+OOfOzIA3W4bzilRdgpwcGQtX/mC23F3wKgu3n04k51kDy6aNzoB+fZl3UFmKJr7snD9/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by DS7PR11MB7805.namprd11.prod.outlook.com (2603:10b6:8:ea::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 08:18:48 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 08:18:48 +0000
Message-ID: <b312b52c-d7a9-4abd-b326-a6f83a94c2f1@intel.com>
Date: Thu, 5 Nov 2026 13:48:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/xe/cper: Support software CPER records
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
 <20261029132609.907017-12-mallesh.koujalagi@intel.com>
 <sashiko-outbox-189398@kernel.org>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <sashiko-outbox-189398@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0284.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::13) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|DS7PR11MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc3e036-e04a-4004-142c-08df3b156aad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|261022105027099003|261021121427099003|5023799004|261022075727099003|4143699003|56012099006|261009223027099003|261028144727099003|261102123227099003|261026140227099003|261026121527099003|10067099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: BTKHaLbnvqjWqXDfMXQlZA/H9V4vGxb2sDio0KZB8PD440zmErDibhSJaFBNmVl6iA22eq8Synve+FlhTg2VuztX9wq/2kYdrjD1DxHrmGmbgy4BJp2BkPBUPzDjYq/+vy47sXo4TZlrKT2QkoOp96b1U2QhAPRQxFkm3xbf1EbQX5vTVKpKxAVDP8Sta0Uuli3A1U6tGZk88mjbCKJNabDKDG7JlBgF35iwLIf2wKTntMZFvuDdy4N9IATBN1DbwJ2ypEvd/rXZaNEkt5mcS5ErX3Up3bJhcf+fJsftox7mbVKqrHgTWFqXqzlx8hJREX7LjzS4838vyky7DsEifnJwFjVDEVD50ZfEK+OsvSTOi0YeVlRGaB2JB68sMde2dciMLEnMjH19r0YcSnse62GtOG4KvwC2P/PXSUvCw5LBpd+WNWnRiDmENIDNcyOMQjLPDIVVPGBbpuz0HDZzLQMMi4AnZ/G2Hkj78XxvrfXP8sQmwoSyPkXMQiDt4BAoLhKUrRkwr5x/tTvnt+6/E19H4ZnM5ie4E4rgwLoHJwlqKIRi8yrOyhfrnvSVtIF9UmywODhuZnqH8ZAdVNkiBtaXvx24E8ZPbPWI6BJsDmMmDaBstWl7U0tux3dSmo+tN9YvQoOnVJldRonL03VV9PIsTCVObjPGER4f0dObQDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7862.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(261022105027099003)(261021121427099003)(5023799004)(261022075727099003)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(10067099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXNScHY4TStqamtyNGhvMzVjN1ZJc0NtclBQUzBDWjh2ajd4SmFoQ1lJbXdw?=
 =?utf-8?B?ZWcyLzBJdXROcFRGM0tuVFl1MFIwMktWZXpWOGFGWGZ1d2VOQUV1QVBndEp6?=
 =?utf-8?B?dCszTzhsMjFGcEloQ3NqZnh4UFNUT3RENDBOcDZ3aTRmNFNLRVUvNXU0STFx?=
 =?utf-8?B?TjF1ZTM0TkVrMU5KSEhlSlhBTENQQXg2NG9xRzZnVmlMOS9OZEZPYzFKenNL?=
 =?utf-8?B?b01nY0JlRFBjYmluYy9YcWhZb3pOcVZodnRsNllUa256eXNpM2h4VVZXR2I1?=
 =?utf-8?B?R3lsRXZBUkhZUDZMT0dKeGR3RVIvNzJic3RPdGNQSk84eGk4TnZOZnRmMC9P?=
 =?utf-8?B?LzkvTHBkQndEYTlHL1RLblc0aWJJbW94aUtxVHc1NTNkUkl4OSthaHFNS2JX?=
 =?utf-8?B?S1prVWFoL3hMTXBhT1lBM1VBY1lWWkt6ZXhLdHcyNFhZV3FrZXdnMC94K0Ji?=
 =?utf-8?B?U1ZtU1I3U1E0VmxZOWZVMnhjazViS3J4RHBsVGxFdEN0b0ZUaXdycDVMTTRE?=
 =?utf-8?B?eEg0WnliZ0lyWE5yYTMzeWZFOThZK1FHTWljdkFxblRvM2hZaUQwc3BBbGFV?=
 =?utf-8?B?S2cxNXVTbitBRGFmRVRNSzZmSURKR2dHeVc3Mk56VkhtK3hjQ0gyK0RueGhu?=
 =?utf-8?B?L3hSR2c5czBKL1gvUG02YU5VNmN4NFVJcU9WWmhiQnpuYTJ6QzNtZWtobEpC?=
 =?utf-8?B?SHVhOEV1dDQ0QW90d2h6OWUxV0JoakdqYkxBWm0xdE1JQkJiK3psNlFERDly?=
 =?utf-8?B?NVpUamJxa3ZtMkVwTTNBMHJHdVdIWGlNV2M4cm55NWZHUUNBRWhqZ0k3UTVK?=
 =?utf-8?B?YVJabEUrVDJLR2pIbmMyYUNpWHhqdHpEa1NSZDU5WVR6WTFVNnpOVm1Cc0J1?=
 =?utf-8?B?eWo4SWJyK3FCTSt1R1pqaWlnM0oyVW81ZjhZVHdsRURvOGhoWnQ1Nlo3UXdi?=
 =?utf-8?B?SkU2Q2g1Z1dkeWVYdEw3TEZ4Sk13amJMU2NpcWRSd3gzWS9iamtPWVBET2pu?=
 =?utf-8?B?UmNyMVI4Sk1yUGVzM0tWeHRhZHVQQ0kxOStLUUN5RFlIb2xnb1FQcjRUOW9J?=
 =?utf-8?B?V0M0UmR1N3VBUEJDZUxLNlVTOThwZVZmci9INGl4eHFnNm8wbmtsNm5CaWc4?=
 =?utf-8?B?b3VaQkV3MDVWSnAvRit4SWg5RXUxSnIrNkRoUUdDYmgybUwrRGZyaHJlWXU3?=
 =?utf-8?B?UTdkZ3BJY1c5T2lQWnZQWXVBMzl1RkZRMnlpbG03eE90M09PT1dxcnlGV3Jx?=
 =?utf-8?B?V0RaTmhxYS9Pd28xaGcxdG00d0FYbHJBaFJFMlY1MGphMWhPbzJnNklnaXFB?=
 =?utf-8?B?VzJFQVJpSkxEREpJeEFzWjFkWEN0UTRkb09Yb01OQWFFejFZdkJHVXU1Z1Ex?=
 =?utf-8?B?Qkh1enRPYTVaQ1d0RGVPYUlqWFZzR2tKM2VGclY3eE9hVGJoVTIySkRXK0Rx?=
 =?utf-8?B?TW51ZmcvQ0lBMHZtWmZpYm5QN085cFEwVjM3M2E0dFg1WnpWakpONEh3UWVa?=
 =?utf-8?B?Tm1mNHp4ZlNOZVF2YlM0Y20wSXIzU3VTTjA5am1iR3FSNlZvZTd5aCt2d05U?=
 =?utf-8?B?U0JtVlVWZUNuS2kvRnBxMDk3ZVlHSGxkS1Y3MW10NDhVU3FlMDM0ZHFwcWhU?=
 =?utf-8?B?ZC9HYzdzSzNMV0lFWlc0anNZVW9ZeTJFeVJjNDI0Z3p6b3ZnWEdKaHdySzNV?=
 =?utf-8?B?T3dEVEsyS21sZkdQL2w2dllQL2E4Ui9TNGV2d0RlV3I1U3VHdk1LSnQzQmlm?=
 =?utf-8?B?UFdDMk1PYkluTTlsNi9PRG5NS0x1MzZOV1dwUGVaYjZQVEtacnNXRW1Ed0ZZ?=
 =?utf-8?B?ekFCR2xRaTdJYklLT3lzSTRFSjcwOGJreTI1UmFvTjM2OCtmYmt5dEhOVmhF?=
 =?utf-8?B?UWpOby9BNEIzVk84SG1BVlVoa09tMFVWVzFESDc1anVzTWVBMU92RlREcHRL?=
 =?utf-8?B?TmtSOGUzSHVmUFFKWGJjZVJMU1JQb0FlTUUzRnZLcE5qdkxDWmxSWjVkZlNy?=
 =?utf-8?B?YXBpSExkM1JobGRXVW5BOXVaM2tzWjRzWnlKUFMyeWlQR2IyQVhEbTBpUFZY?=
 =?utf-8?B?bTBlTWxrdjhnM1ViQ0VPQ2xScmV5bDBHbzBFM0VLbUJiNm1OVzJvcWJxTmhz?=
 =?utf-8?B?YS8wRlVpZHkvZ1lZaTh5QTBBdnVoQ2NwRHA5cU1oUGRFR3pVK2hoWXQwRCty?=
 =?utf-8?B?a1dTdm1RUnJmTHBvZUlnSzFKdUtHOXdvWmhFWTFqQjFXNERNZ00wcnNoM0FO?=
 =?utf-8?B?cjBRdndpbVFyUTJHVHduWkR3Y09YK2QwdEhyYWlzUytTR0sxakN1NlUwWnJ1?=
 =?utf-8?B?ank1RG5hd0IxUlJ4ejhJcFhpdGxMaUgyam1GUXFJakxCL3pVUVBOaG9JdUJh?=
 =?utf-8?Q?QbKHwD1E0SAkyU/g=3D?=
X-Exchange-RoutingPolicyChecked: zFLook2fAxf8T60Uaj9AqyRbVf0fD2JwH7QK6CHGjSdMfv2ctejHNwpNG2MNXIEmOv5I0ACnrfuD1FP4KzItMgxVGq8emfKN2QwEMsv1Imp7WjUbCw1z+8o2WkyhbE/aLCoLmLFO2eXh/qQTRIE0VaWjHM/yMs8dezxLunSRoXaw3I7pNjR8ay0nE+ly2wLfFr3/Rhk8egd+Eu8Gg9rwAgaItaI38dxoLCcGXccrip8G4fFTwn0S4dC/ukZoP3TOCeykNwEA0xQvNNjzE9sZCbkmFURVcPjy6ywXzsImXAlygpWBxyCJgG+MOQYNhOBvFHHwTgcnAwvjjpVO2XkO3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc3e036-e04a-4004-142c-08df3b156aad
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:18:48.1449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buBOmQ5tPXYc38W89q814iCYW8tKy9tQoMMLaR2Im9rY3ieptd1tEz8cd56DnE5J947yrlNsDzERwqeh8wLOHFoyqP7+OcgYpJpTXxYKMnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7805
X-OriginatorOrg: intel.com


On 29-10-2026 07:07 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] drm/xe/cper: sleeping in atomic context in cper_emit_sw_err()
> - [High] drm/xe/cper: NULL pointer dereference in cper_emit_sw_err() when xe is NULL
> --
>
> commit c16a87d05ae708e1a17ac24623a75a82d558972b
> Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
> drm/xe/cper: Support software CPER records
>
> This commit adds support for handling software SIGIDs in xe_cper_emit() by
> formatting the log message and emitting driver-notification CPER records via
> cper_emit_sw_err().
>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index e802f534eb45a..ec61605d0a314 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
> [ ... ]
>
>> @@ -239,6 +246,37 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>>   	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
>>   }
>>   
>> +#define XE_CPER_SW_MSG_MAX	256
>> +
>> +static size_t cper_format_sw_msg(struct va_format *vaf, char *buf, size_t size)
>> +{
>> +	return scnprintf(buf, size, "%pV", vaf) + 1;
>> +}
>> +
>> +static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>> +			     u32 component, u32 location, const void *data,
>> +			     struct va_format *vaf)
>> +{
>> +	struct xe_cper_intel_hdr ihdr = {};
>> +	struct xe_cper_driver_error_class *driver = &ihdr.driver;
>> +	u64 timestamp = ktime_get_boottime_ns();
>> +	char msg[XE_CPER_SW_MSG_MAX];
>> +	size_t msg_len;
>> +
>> +	might_sleep();
>> +
>> +	driver->error_type = cper_sev;
>> +	driver->error_component = component;
>> +	driver->tile = location;
>> +	if (IS_ERR(data))
>> +		driver->cause = -PTR_ERR(data);
>> +
>> +	msg_len = cper_format_sw_msg(vaf, msg, sizeof(msg));
>> +
>> +	cper_init_intel_hdr(xe, timestamp, sigid, 1, &ihdr);
>> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
>> +}
> [Severity: High]
> Can cper_emit_sw_err() sleep in atomic context when software SIGIDs are
> logged?
>
> In drivers/gpu/drm/xe/xe_log.c, __xe_log_emit() unconditionally calls
> log_emit_cper() -> xe_cper_emit(). With this change, software SIGIDs are
> routed to cper_emit_sw_err(), which calls might_sleep() and then calls
> cper_record_emit() in drivers/gpu/drm/xe/xe_cper.c:
>
>      total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
>      rec = kzalloc(total_len, GFP_KERNEL);
>
> However, several paths in the driver emit software SIGID logs from hardirq
> context, while holding spinlocks, or with preemption disabled:
>
> 1. In drivers/gpu/drm/xe/xe_guc_ct.c, xe_guc_ct_fast_path() runs from the
> interrupt handler under xe->irq.lock and ct->fast_lock:
>
>      spin_lock(&ct->fast_lock);
>      do {
>          len = g2h_read(ct, ct->fast_msg, true);
>          if (len > 0)
>              g2h_fast_path(ct, ct->fast_msg, len);
>      } while (len > 0);
>      spin_unlock(&ct->fast_lock);
>
> Within this critical section (as well as in g2h_release_space(),
> dequeue_one_g2h(), and __guc_ct_send_locked() while holding ct->fast_lock),
> g2h_read() -> ct_corrupted() and g2h_fast_path() -> __g2h_release_space()
> call xe_log_err() for the GuC component:
>
>      xe_log_err(ct_to_gt(ct), GUC, err, "CT: %pV", &vaf);
>
> 2. In drivers/gpu/drm/xe/xe_pagefault.c, xe_pagefault_handler() (called from
> hardirq context via xe_guc_ct_fast_path()) and xe_pagefault_queue_pop() hold
> pf_queue->lock and call xe_pagefault_queue_add():
>
>      guard(spinlock_irqsave)(&pf_queue->lock);
>
>      empty = xe_pagefault_queue_empty(pf_queue);
>      lpf = xe_pagefault_queue_add(pf_queue, pf);
>
> When the queue is full, xe_pagefault_queue_add() calls:
>
>      if (WARN_ON_ONCE(xe_pagefault_queue_full(pf_queue))) {
>          xe_log_err(xe, PAGEFAULT, -ENOSPC, "Queue full!\n");
>          return NULL;
>      }
>
> 3. In drivers/gpu/drm/xe/xe_wedge.c, xe_wedge_declare() is documented as safe
> for atomic callers and is invoked from hardirq context via
> dg1_irq_handler() -> xe_mert_irq_handler() -> mert_handle_cat_error():
>
>      xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
>
> 4. In drivers/gpu/drm/xe/xe_pcode.c, xe_pcode_request() disables preemption
> around pcode_try_request() -> pcode_mailbox_rw() -> __pcode_mailbox_rw() ->
> pcode_mailbox_status(), which logs PCODE errors via xe_log_err():
>
>      preempt_disable();
>      ret = pcode_try_request(tile, mbox, request, reply_mask, reply, &status,
>                              true, 50 * 1000, true);
>      preempt_enable();
I'll handle in next revision.
>> +
>>   /**
>>    * xe_cper_emit() - Emit a CPER record for a SIGID log entry
>>    * @xe: The &xe_device
>> @@ -272,7 +310,8 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>>   		return;
>>   	}
>>   
>> -	/* TODO software CPER */
>> +	if (is_sw_sigid(sigid))
>> +		cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
>>   }
> [Severity: High]
> Could this dereference a null xe pointer when xe_cper_emit() is called during
> early PCI probe?
>
> In drivers/gpu/drm/xe/xe_log.c, log_emit_cper() resolves the device pointer
> via xe_any_to_xe():
>
>      xe_cper_emit(xe_any_to_xe(pdev), cper_sev, sigid,
>                   component, location, data, len, vaf);
>
> When a struct pci_dev pointer is passed to the logging macros before
> pci_set_drvdata() has been called in __xe_pci_probe(), pdev_to_xe_device(pdev)
> returns NULL. This happens in drivers/gpu/drm/xe/xe_pci.c in xe_pci_probe()
> when a device ID is blocked or if __xe_pci_probe() fails during early setup
> (such as in devres_open_group(), pcim_enable_device(), or
> xe_device_create()):
>
>      if (id_blocked(pdev->device)) {
>          xe_log_info(pdev, PROBE, "driver loading blocked for device '%04x'\n",
>                      pdev->device);
>          return -ENODEV;
>      }
>
>      if (xe_display_driver_probe_defer(pdev))
>          return -EPROBE_DEFER;
>
>      err = __xe_pci_probe(pdev, desc);
>      if (err) {
>          xe_log_err_fatal(pdev, PROBE, err, "driver loading failed for device '%04x'\n",
>                           pdev->device);
>          return err;
>      }
>
> Because those probe logs use a software SIGID, xe_cper_emit() now calls
> cper_emit_sw_err() -> cper_init_intel_hdr() with xe set to NULL, which
> dereferences xe->drm.dev in drivers/gpu/drm/xe/xe_cper.c:
>
>      strscpy(ihdr->pci_bdf, pci_name(to_pci_dev(xe->drm.dev)), sizeof(ihdr->pci_bdf));
>
> Should xe_cper_emit() check for a null xe pointer before proceeding?

Addressed in next revision.


Thanks,

-/Mallesh

