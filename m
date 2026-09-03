Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3778037756F
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 06:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788415911; cv=fail; b=gAdcR33+816C6jhgo+Ea+jrUMe+vR/XnInI+uQbwgbXZeUJ11Yc5vJzquqoiUD07RDGkVOrCiuu6vIVneja5UXjdJ0AP15Qe/LnhrblrOfThr5pb5o+uJlt7b97ztzYX3EtLhwtNgN4EAx/cecYZ0dHNJQTtjEzRqR30a443SP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788415911; c=relaxed/simple;
	bh=oFBpgnott9UfdMPerZlSlNX2EGCvG3Ds5CGgQmJadYs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I3cMQ5QSKPuMg7sKTdlAlXCz7qrKaYkNdDb5DMPrQSFsSUVfX8f2f9/8+d/hWzwfBjQqjKoj9vBTNuyUPPPTQlAfVNV4HEYf/XATT00kw5OfejGXH2Pc4YcsJohOkbv+80muWTH/2dSfNhaiLDlErXv2D8M4GxoVjZQMrsn+49A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xk5NkCLn; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xk5NkCLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788415910; x=1819951910;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oFBpgnott9UfdMPerZlSlNX2EGCvG3Ds5CGgQmJadYs=;
  b=Xk5NkCLnnmKWj+BQzfHAIyh/U1Xhh4lzZLu568FZsc9Px4nLwiigIuAu
   xJQOKPZ77bncBoRYjpkmSMI2CcAFb4kqFBbmaIslVd+V21KN9jzPNoPBl
   fj4bHSxdbKfOnLh7xOoEkKhYniTsk6sPPlChUkKpBq+TJj1iCyycL+WEy
   9Lc7YJdp3XYH0aL264EEzdA07XmNREgOiAUO8PI3NkhLiU1zK0iSf/d21
   FOWjolkAcnD3IauwBf/p/c9Up2+FJVxrsphnUUkEue5gQ2tNFde0Qa/28
   JYYbwUiRGlx06dFJoUaLOjFZXzytwpa3MTqtIT9EXDtU+TTFL8nXaPHKW
   w==;
X-CSE-ConnectionGUID: 2GXAF9yWTOGKM4E/h8b0BA==
X-CSE-MsgGUID: qGQXr0yGTGWN/qHKjqXlQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88907945"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88907945"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 23:11:50 -0700
X-CSE-ConnectionGUID: iN6tB8GJS7SEOJhi64SC9g==
X-CSE-MsgGUID: UC/2hefLRUCgD+6Y0Mwi2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="307823052"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 23:11:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 23:11:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 23:11:49 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 23:11:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pI/C+Zl2d62dKzgPv/n4DTmfxslH69VW+kP7n0r+9KK1oeZyGZ5tYjEiFX1rfhKfZTP5dzgyM+qr6Q7ZpO2QTMqjLeRHDbO4SIC8uvABTd1NdNvNwzyU32Nr7nAVNsl/H5KiWiUmtTs+t8wTAgQMhvckzLsfM6tsHt93/5cxvKoPJUL+P/ULFJo1EBfcqAyjs9/P5xfUbwYWpk/oyzU5C+TZGY0DeJk5Ph01Eh59MNSNRij/IpF+gesC0WhY2CmTPlP0Oe6ih3Binwm2VQPpQl1J8RVBiByPCQqXFXSopdJNM2dWcv/mVdGISa3AMzMi6PA+BRauZNBRbUPyIIQYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+HapvchgM6qx1L0Hm8Jq4X5sUy/AbOs4sfDCxklbig=;
 b=pBwfyaZkxr/6ta2THGxb+c3m6ssy6UlYfYMVLangaxc+vjmoM6WOVG0STMn7V9MIBGhpdx5sjC1i2hhYucIZ6JPQaluyV/aPw+xB8nrkAioyPr9oZYHw6DM8g3Sc+yxvrImrfyl4KESUrWCQzIK7kmYGcVdy0MG9n4NoD4oKaOWeUyJD2naHRdHoO7ovCmaL7XDFQgxy58fSnBjuCZigNrRTP+V1tgn+PhHtxQ0sMowaBEpHpEww5mpUKDvwcPcH6JObWc8Nonoo8pXGwCrCIJYLpKwskk0yr4k9emzgLwPgDUESa+R4ow3CiU6k56BwDB/fgTcCHsBCfj2nhmsbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA4PR11MB8990.namprd11.prod.outlook.com (2603:10b6:208:56b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 06:11:47 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 06:11:47 +0000
Message-ID: <4321ffb7-e31a-4659-850b-27da377c30c3@intel.com>
Date: Thu, 3 Sep 2026 11:41:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/xe/hwmon: Disable memory controller and PCIe
 temperatures on CRI
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260902175507.3910573-1-karthik.poosa@intel.com>
 <20260902175507.3910573-6-karthik.poosa@intel.com>
 <20260902180715.508DD1F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260902180715.508DD1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0356.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::12) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA4PR11MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: bd0d576a-7962-4618-bd70-08df09823c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NFTVMllKSS5QuHSFnHbk4XiG+o7dF3DdGB9RPKTnCFxAU6nVLOhhSltGMOrKlhhHTP3yNhdzFH5h6v8RgTZIrapUez7pYyZBaCwGpLVDW/FjyQ4UZ3LlE9Kh/D3WPAZCK+MpdA+FUApwlNP5mAOGXDwDmtC+P5d9vvt+KBrn1IiW/9vz37+V8ptHGFwczv644O9H+zV3+ygaDavMOuh86TYP8MB6DM6U4HEqYJEBLMDmpRiEhlNEjVHBAFyVU7t9amFO2qWo02MqZvUadaZLWy203jDwsl2/wMoWiV+rbGCWjEDA490rHnoWfjx9TKJl8AHApQ+KQU8KrikpP3t3Gc5C6qYwB15TWGDYqJFb6D7jB9TiM7OH8gPo6cZAHwOCHdNDR8UpMa04EDzdvfdjcMuwwcHcFp/imNp4RFqDMklJE09yyYR4cGYSC1tKC1Bn5IaNMr2NQz+a9bE7+GddXgj6Bs/069NkIesRo+nVkRlNP+vATC/nimFQkhpXoW63Fl0rl6xS7qaOkiBGfY1sSScR3NyybnOv4w3XvGboMWh5s3iLXCljQ5kClo46I40rCEqv1VSBMz7PHVZjuSt8ZuW0ei8k8Kzz8ePSf0fL30Hm1u/Ib3oOkJaB4EXBNh06IAg8/eD5TcRacrIStf4wEGIjIJy52WOYwO8nGB5oBZg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVQzcnJwKzMvY1pjYWVlaTQ1bkdOaWZyOHMwVHltanJraFpZQ3ArcVpyYlh0?=
 =?utf-8?B?S2VNV3RuM2xjMDVBSVF2NzNSTWVaWkFPNTBkaVljVnp2L0Uzc3ZkTzRpMmxC?=
 =?utf-8?B?cEtjcGx5eFc0LzVIcEpiRE5HQ0tWZForL3A2Y0xlektXK3BHRXpxdVlJYWY3?=
 =?utf-8?B?ZHJhYXRkS2J5QzArM0gxb3E4WXpnRjFuY0RJbjdFVmtHMUtQOW5BbUxndklu?=
 =?utf-8?B?bklQS216b3gwWHRxdUtlRm9ibnk2OTE4Y3pza0krWWcyMnZPcSs2cUR2NEM2?=
 =?utf-8?B?ZXZWVktXNk1GVVBpckNtRnZCV1pPQmhoMzlyeEYrQVZCTkdSUERtc2dqRlRw?=
 =?utf-8?B?S0RDVjEvY2IwZDF5bzZxeUZkQmtEMitIQ3FUODJqb1lrZ2gvS0dJdVFEN1ZV?=
 =?utf-8?B?ZGNLckhsUDNFby8xWkd6YnRuZG9nbVJVTzN0RGE1S3dIMkR6L2FicjdRM3o4?=
 =?utf-8?B?TlcxWk9PZHpPeUJDajZKUDlBUkltWU5nVU9hR0l1U2RkUVVBbmVIY2hCZjZF?=
 =?utf-8?B?TkxRUGM2d0dJcFdHQnBFT003RVI3cFZpaGlESER0VzI5V0NNMDNqZzBOSzBp?=
 =?utf-8?B?Qzg5YVhLRFRuNXU1K0NGS3AwWGc2VFVzK0hCY2RLQ2x6N1hTc1RRRGtOSHdx?=
 =?utf-8?B?UFlVamRJa21aWStCWlIvb3I2Q0haNkxRMmxHNlowMkJSZ1V4ekcvbWdFN2hy?=
 =?utf-8?B?S2Q4bkhLeXRlMkJSZyt6Q2JkczVaeEg2Qktha1k2SE10NnlCWURBbk9Ibm5u?=
 =?utf-8?B?MCtxRXd0RTIrM0FXTzVnY0pzTmhodk5vOFhSNnViQWpCa2hRbSs5eUM4amg2?=
 =?utf-8?B?M1BDalZpMG1IVUdYN2hGT2tuTmRsOFhHZnF1RTF1UUc2SmcrTTI4amUvclRT?=
 =?utf-8?B?aFhjdWZBbmcxZEZ4ZUxjRmpSVEs5cUIyQTl6dmliaGVsMGloeUJxZUZyM3FB?=
 =?utf-8?B?WTZiV1JySlpOdi9YZnRqcEhQcmowNVpBWEd4Q2hGQVRBZTNaU25EQ3dyNU5X?=
 =?utf-8?B?bFFiQ3Jvemd6d0o3L3R5c2dvMERtdnRuZ051a0JiSXNvcnFTa0E2bE5YTDRu?=
 =?utf-8?B?SWgybEIzMFJMNE96QlFBTEhpallyc045Yk1nM1B3eHllWDNyOVlCK3h5K1Fa?=
 =?utf-8?B?QWdxV1FvMGw2WmQwNFdjMDJadGFPamVJR3dHbllLMnMxYkoxT1FtOGlwMDA1?=
 =?utf-8?B?MURqTnBDNS84dGo1YVBNbjVjbUVFbjdZcHlESnpqU2tEaDYwM3h4czJwSHI5?=
 =?utf-8?B?aUh0dGMxS25nTXYxdEUyNnVYUWhROURoUGVhSERKUlc0Qm9qV3FLYlFCdklr?=
 =?utf-8?B?QkY3RndSLzZTV0l6ZTY3RDZRTWkxQUpBdUM3UDd6MlVNK3BjVGNNc2NGVmhD?=
 =?utf-8?B?bEdMVG5GRlpzMGxVYi8vRHFQNGVsMXJwMVVUNTdVNm14TGQrZmZmS3hBeldo?=
 =?utf-8?B?bmNKS2pTK1hYWEVPME9PWWYxV3hTeERib3lmYk5zbmFWaUhqNnhXbGdiRHZM?=
 =?utf-8?B?SXlxT2ZUN2hzdkZTblNHQzJjMnZ4UC9FWmxoTzFCdHhOTTlMSzduYkpFZzdo?=
 =?utf-8?B?M2RacDE1ZWRUbEpTODRISm5reDdmd3dzTWV2eFNnOCsxUUlGSnhFUUZuTlR1?=
 =?utf-8?B?TnE5RU94RFRVdnp2bVFCK2tQYklUMUw4Qk0vK2dDZzFIUnRJdXBWY1J1bUI0?=
 =?utf-8?B?V1VXTWtRTzNsM1Y0SnA5MlZuNkJWeFdGTkxpSUlNb01IMzdXYVk3S29IUGRQ?=
 =?utf-8?B?VE1KVzBCZENyUmpWd3lFeW8rdGVHb0dsS2J5ajdJc3dvOUdqTEhEcThVRXNw?=
 =?utf-8?B?cXFjbjhtQk94OE9ZbDFJRlpXNDl6WGptNUVubndrTzNrcnVYMXZrWDBQMENG?=
 =?utf-8?B?RkxrSmZ0Q2hvbXd1MDNWZ2tpcTRDNm9JVk1MMGRJcGJyNkVFUVhVOUZCNEVX?=
 =?utf-8?B?am9CVERCT05yWDUxMTJDdGYrSWljS29CS0VDc2M3YXJiWFYyZVRSaTBpLyt0?=
 =?utf-8?B?TFgzbmJMdm0wa1lPNjVqMU5FSlJjQ3FVWFdNajE5TUw4cTNhbHBxM041Tnhh?=
 =?utf-8?B?OXk1ZFR6U1FhbGZmVzVrV2FtYkU1WDV4V1BYTVdZQkh4Z1hKVEJIaC9ZVUNQ?=
 =?utf-8?B?UCs2MDVlQkpJQjIzWXlLZWppUFZPU21mamlvU2EzbFNYKzRRSDYxRnJ1UHd1?=
 =?utf-8?B?OVU0dC9Zbk80QkU0bENvY2pwT1hDR2tQZEVkbzA2Ym0rYUJBWWVWdi9ZaW95?=
 =?utf-8?B?MkFDSWkrZG1jZ3JEdUtGZDBVTE9DQkJHMUhxMFdCUWMwOFNHajRPdjZrZDNa?=
 =?utf-8?B?NkxLT2ZBVHVTdFhhSTJSWTVDYUhtYzNSUlI5Mml1K0ZBVHJIc1ZSQT09?=
X-Exchange-RoutingPolicyChecked: k71j2j7sExO406XG1l4ZvUco1sQgH4h2ziXQo+/ZZDzDHGPDzioZT5sG6SZN5iM1qhU19yeXwrPIXH62CQGq4Ny8S1fp3y1WIBNFREWrZtsHf7rMN/Ibf6gb2LUD2X5zFqx+i+m6+gDXUminoqg+D6bMcUTqw4EjxtZ9e3t9mV2cFajhqlfb/Dilz86dxFw05//6aAm7/zSmThj/UMjDNGTUGNZMI4OKQR/HGNDunPLl4h4lNjynkflMXKJH/QbeehnGoigSmidxMN7srZzsC6xBppvK53J8RV/M5s3x646owYSYvfvg15Tv3fmBtkzHeLQO7oyg1tEjWORuQjLpxA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0d576a-7962-4618-bd70-08df09823c0d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 06:11:47.3109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGpGeUG5yVPBKSkTbIDRWcDgecBuwZlZxK5udqWQw1YMKo/rXIbQ0PpZ8uTtmqctHbuAphpkms3coJOFCuNNYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8990
X-OriginatorOrg: intel.com


On 02-09-2026 23:37, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch uses an enum ordering check that inadvertently disables memory controller and PCIe temperatures on Nova Lake P, splitting the Novalake platform family.
> --
>
> commit 91ec5832293666790affd1f3a6202739f54f4e49
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
>      drm/xe/hwmon: Disable memory controller and PCIe temperatures on CRI
>
>      Temporarily disable memory controller and PCIe temperature reporting on
>      CRI platforms. The definitions and interpretation of these temperature
>      sources are not yet sufficiently clear, which may result in inaccurate
>      reporting.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index c2b8d4c79783a..5b2cef292ffcc 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -1061,8 +1061,14 @@ static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>>   
>>   		return true;
>>   	case CHANNEL_MCTRL:
>> +		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
>> +			return false;
>> +
>>   		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
>>   	case CHANNEL_PCIE:
>> +		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
>> +			return false;
>> +
> [Severity: Medium]
> Does this check inadvertently affect Nova Lake P?
>
> Looking at the enum definition in xe_platform_types.h, XE_NOVALAKE_P is
> defined after XE_CRESCENTISLAND, while XE_NOVALAKE_S is defined before it:
>
> 	XE_NOVALAKE_S,
> 	XE_CRESCENTISLAND,
> 	XE_NOVALAKE_P,
>
> Using the >= operator will disable memory controller and PCIe temperatures on
> Nova Lake P, while they remain enabled for Nova Lake S. This seems to
> contradict the commit message which states this disables temperatures on CRI
> platforms.
>
> Should these checks use == XE_CRESCENTISLAND instead to avoid splitting the
> Novalake family?

HWMON is only supported on discrete GPUs. You can see here,


               int xe_hwmon_register(struct xe_device *xe)
               {
                         struct device *dev = xe->drm.dev;
                         struct xe_hwmon *hwmon;
                         int ret;

                         /* hwmon is available only for dGfx */
                         if (!IS_DGFX(xe))
                         return 0;

                         ....

                 }

So for both Novalake platforms the function itself wont be called.

>
>>   		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
>>   	default:
>>   		return false;
