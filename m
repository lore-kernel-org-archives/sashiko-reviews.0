Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793688159;
	b=PnDY+lNMCaoYv15ImziLggDvqhXUIwbguFGTU1yM1LMqz3ITGWL1hFihfXzQxc7/weWH
	 0+vEWDxsFen8dSCwP3zXTPLKtavuagfcqMw+ynWOJQXchXwIAO+yGmhxuJ9rUoJwfccl1
	 TZpBwg7cUp4b3BSBBVaXPFT6QJnAmmBJhjHn+Fj0arSyWhRGusfxXPuc0lwc79V5j8SDv
	 oeTQN5GPSNrjQI3GzlC9B1IrSjVZbb6KdCRmoawwXjn/XcH9Ikr1jl21jcC0CpoAlc8Je
	 dMF36/P4+tjSrbBgGVSIxWMvmtI9/3SZ3FoMygtlNze3XUnU/n6IrGkOddNj8yqy9hA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688159;
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
	bh=I+qmVMEJ5MV1/046BrTiwmLjdwomcmZIMm34U0Wx1DE=;
	b=z7nkbI+j7YoGFv+ePEntc3Nny7Pt3fxabEV/UiwdA/CDJNhA/9WgwZImiEW9wZghvY/U
	 0yQpsW9cK62tWAUCR++qMNf7PVLA4Eq1UYt9imFdGpHBh8ACervuHk9w+qCGp1ZMCFit5
	 gYRNYbBpM/q2tdwjG2gSgF8X50dKCn9uI4EweMeY+kj916VIEoBAYKTY73B1hJqDTN0AK
	 /Ju0ENe/5/8yZF2xEdZMpe4TszBn3LyLilI7ipZxDokVuqqm3HUe2jcV4P0u+xbQTEP6/
	 8EwCuPDViXPy/QWa+ughZ+zGBHIZtjHVEt9jpDxUqcTEFNVXlTU+MZK8U0/BUob5KXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l8iE78ys;
	arc=fail smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8A7606A324
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 06:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE8A7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l8iE78ys
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793688158; x=1825224158;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=UCMPeI7wPO8e7aTIQqEZxaS2IJ2CO5qyFgiWziSSQlk=;
  b=l8iE78ysWi6zJdMX1TO0xW3bKRags3GqftBPcVV/eOYJbzfVB5hEANe4
   zrL7Ahj9lVWqoEVlEhIBufdWrNtSvy61lsGQ09AujL7eSoIV0M1o6RU11
   fQhCe4kKQFwwKv2UnLFOOeNyWsy+W//rZQyNvDqMlGlHsHXrF3URAfV+7
   JmiuwKfj2bz2gaHvXVttsqMf6qVEhz20ZBmRbVgqMn+SxAz0Q+bLOf3xo
   w3PKtbOe68RwVaxinBTY0i8NNFKuXaQmTNVnEmegPnMZ3aNY9UZQUyTF/
   c6wHYNRYAM7ySI4lMINDznF4ZM5xmtU/eewF2QXmR92tv1bEkwGJG67T2
   g==;
X-CSE-ConnectionGUID: USDxLSrcRLSRSXAjHlKRIg==
X-CSE-MsgGUID: q+5IhWPiTLuax++0NW6iag==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2504627"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2504627"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 22:42:37 -0800
X-CSE-ConnectionGUID: gTkpxqjcReSgbwGwcqnWmA==
X-CSE-MsgGUID: b3jw/BKgRHGux4LBnWZPug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6344677"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 22:42:36 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 22:42:36 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 22:42:36 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 22:42:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MD6kCyjRCQkyj8d5z3QPV3b3vAedn4uufM+Bl0iP/xKg6S6w5jcABcWZnJgsH3BbcNLmpZd3p2D6A9MsFvj7I9JFrKKQut7OAvlyJqs/7eMHi7ghUHP+vwiJ1UbKfcmxPfG54AHiYE/9MRDCtwwRgt9FAXApnbmfUZ5e+29O+fGmuXV1kYbFfxAY4lT3dFx4ACt2fVMRHa5KM0zdCB8tbLhFY7wFA0QLJqHOiXCswUDqj32CEjSXVjBa5Suo2eLxjmMu2+1PZHt2galLHyIV8e2iOwhPVYPbQeCxU7RegmkEkNT6Z8U8uSN/+n0WYIuz1XKb9xrd02JXBqB91Ju7zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+qmVMEJ5MV1/046BrTiwmLjdwomcmZIMm34U0Wx1DE=;
 b=uNMTU92Qp7PBximFF8w+629dgZTwyN/IMPwe1e/xiOzcJTVrNcZVrUeQEp3ulqWH136uIARasSncsUdzUp7IwVr1Xw4HhGVaGhCRcksBPrALxSTvdgXA0YTSN16/I7xA2FTU49ersR+YyJaGmt1avFAYrEAzfVMGvaFXs3e4hsgis08J5dn9tDECrOnGh8MOjRz92UiNcgNdu80hYvfXZV2a850viQgG+YWyu/RyrUyGyKOwWuqybzaEt+QTTjb/HCJwGtiNr5KuL7yaMr50Yk0WN217xTFTPvj/zD7jQwyXjgmFGbPPqH0gpk9FjMZo0MRvpm6QF5cZqkw1cKHsOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB7759.namprd11.prod.outlook.com (2603:10b6:8:10e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.11; Tue, 3 Nov 2026 06:42:34 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 06:42:34 +0000
Message-ID: <ef0080a8-defb-483c-961b-8ee2eae34cb7@intel.com>
Date: Tue, 3 Nov 2026 12:12:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/xe/hw_error: Initialize hw_error_work per tile
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
 <20261103060929.1586783-11-riana.tauro@intel.com>
 <sashiko-outbox-194620@kernel.org>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <sashiko-outbox-194620@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0214.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 641eecd0-3e10-4cfb-6829-08df3975a467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|261102123227099003|4143699003|5023799004|261009223027099003|261028144727099003|261022075727099003|261026140227099003|261021121427099003|261022105027099003|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: d9SXCN+SU5yH7XfEnFdlT7cFHFbBZRVmZX1la1edLWTU9ThXQ3Q3ewbUNP6kitL9PZWtgkUiyelv/mtmQKjyZgreC00ltomspHDPUQaVkKJPhSmVgg4PSQblPXIcmmud1HJCxckgYGbDOkM+1FBz65S1rxcseEcdk2Ewd2OUunHBWJDXinQ1EHBbbu1xZ+DnDH0K6mSNKJKBukj5TemK1BGFWqU07sgDzKZrQ/dIFffHKCJvdKk5sYhQmu1CNFie2ryXmY06x9WYPXEakAKSZcZ1dVunGgMikTjsotFdwE5Kh92BgnVo9vVQmaztKjOt9Lck0XvlNWfYwYszaLto8PtjFjJRR0RYaKlJ+GxX1lNq7IekfhrFsTMYK8K2MM4oYJctBOG0xNS2q6E1OLoTR+PVSDx7PSLSz2i7u/t151tfxo2WNBOMOf2vAD9TJiZoqU51UWPrRR53ueKkWBxEV1+520Cu0YqeGRRuXxrEJHqeMoYuAjM6g4SLpDDFpKNmHmoKrr9GixseZ8TZRIprB2aS6e1oYZSlzFM9OZJ2NPwo6q/pBtO7XAWE3VyhHW5VB8YZVnV/M5GzQAlg5/fVybPZMCj3E4wySl2WnKDS1cgXky2DrTzrIoMQDl7olaLI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7958.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(261102123227099003)(4143699003)(5023799004)(261009223027099003)(261028144727099003)(261022075727099003)(261026140227099003)(261021121427099003)(261022105027099003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVAvcnBHM1JoQWhrci82ZitkUkU1d0FMTVRPTzFLWVRrN3cyYnFxVG1KVlR5?=
 =?utf-8?B?UXhJNVVYZElOMVQzOUM0YnFGdUtFUlF4MjdCd0NHVmhFaVBCdkt3bmg2WUE5?=
 =?utf-8?B?ekh5SFhOaTk5dXZlTFdDeDFNeUc1YUxlMkJpNUdRemdwR1VZK2R5eXQ1NXRO?=
 =?utf-8?B?NGI4NmZ1WUpaeW5XazN0QzZCbzd5OGZQZWVGYUhSVWhPeWtKdW1tbG5mTFpN?=
 =?utf-8?B?Qnljd2tjN2kyV1NFc2JWcUxsM0h6dldhN1hKUFVqckJHZHFuSDZLcjBGcGJ4?=
 =?utf-8?B?V3VoRHBwMHRQSSs0MElzRDUwTkdtbFgyZFlpbGVCT2IzSENuVkZPSkJmaXlZ?=
 =?utf-8?B?ZjhiWU1YSVlhMTAxT0UzVytiQ1grOUpXc3hWWnZxU1lDWExoVkFBbXlRdFU4?=
 =?utf-8?B?RjBQbnlRTHlIRjVpN3FoTXFzUnB0YTBFaWhTWEs0ejBFM0pzSW5iVVUvUitn?=
 =?utf-8?B?bXVKZlFqcXF0YXo0ajRlY3lpbGJkZEJJMlRVaktsaHU2dzlwSlJHSnFrMzRY?=
 =?utf-8?B?OTBGKzNwUmc4cCtRb0dRNEluNDZ4Sm9wU1FGTnIrWlJwaWZrYXk5djdqUnl6?=
 =?utf-8?B?VjlnK1ZJbXZGSzZZdndkK0I2TkQ5cWV0VmQ2Yys4ZnI4UVBNbzcxSUpHM2s2?=
 =?utf-8?B?TDRHVDNJVGhuV1FqQWJySCtyV25KTUsyeXhDdVA2ZVEzNW8xVmtVMXp4eWpp?=
 =?utf-8?B?WklxODZaaG5aaG5KSjJmeFdmRHhsMS9udjEyQ0NLUW9yWHoyWk8yeGVlbkRQ?=
 =?utf-8?B?SHV3c0xGZlFNODl3T1hZQWdWeDJHcVBZT1k5cFFQa3ovTDB2MXlIVVo3WVhY?=
 =?utf-8?B?b1VjNGZxaktaNmhWdTlqeWNkUjNCc3lONmFIcGpmTWtqbDFtRnZmbjhiak5F?=
 =?utf-8?B?MWsrT2VPM2c5eWs4dmxGSU9ub2xraDJRTWF1K0swU0pBajVjZnlLdE4yWGsx?=
 =?utf-8?B?bHFKdWYxQzBpOGpJTWRaMkFGc1JqbDZQZE1tRGc0V1E5bENQMDFYeGN1Z01L?=
 =?utf-8?B?NDJLVnZWa2RkM1VOZHpNckxnVkkyU2YxVDg5b0JTU1RIOU83UEM4K3YvUHhM?=
 =?utf-8?B?RzByVEppTWVUb2lFTHB3NXMwVTFKR3lQVGlKbzhUang1ZnowaVdidDFKcGE5?=
 =?utf-8?B?ckJsQTRDQjdEdzlEVDUzYVE2UVV3UjMyczJTSUVMY1lkQlVORkcwWE5xbFpF?=
 =?utf-8?B?aFpmSmdzWGdtOGFPTm1udE40SEp2dWtNRGJpcXJVN3JtU1VmZm9JdWFvMmhQ?=
 =?utf-8?B?eEFMNXBhVThRaUlNWEVUY0N2QXh3TkNVUVhxQ1FMTll0Wk5CbE1lSW4wMlFT?=
 =?utf-8?B?SnRQQkdyVEpRRW1sT2xoSmRuV3ZKMXBkWmt2U2pGWlY5ZFNEcGxZMTRTYXl3?=
 =?utf-8?B?dkNUZ3FnZDg0YWwreU5Da2haVnRaYW5CODIxb0EwaEZzeEEwL052WWVYK0VC?=
 =?utf-8?B?NlBDY3BxLzNlVjlSd3FSb05PVldwQ0hpMFRPelBXWEY5TlBDS0EvQTJJY0hj?=
 =?utf-8?B?b3poUWo5eEl5MXN3V3kyWE5xV1Y4cW9NSERQVm9vUTRjTW1FK2wwaCtYblYy?=
 =?utf-8?B?ckREbElZbGRzNXROL1VEUDZpN3dpOTdPc3N0NmdVK292QVRDMGgxSEN6clVo?=
 =?utf-8?B?ZFlVaGtsTk9hUldaOUhxaWUxWGVCajM2UEg5bGk4bS81OUhOWUFlaUI5MGgw?=
 =?utf-8?B?eHR5T3ZZMFI1WEhYeW5MMHdLMXJYelEyTlJpdzc2WEs4Znd1bmttbm43L29t?=
 =?utf-8?B?QWNpVTZaRDBEZGgzSGtPb3ZTUnlweXhDZS9yTDR5RE9pNk5OY0V1WkVYdDBO?=
 =?utf-8?B?L0RuZm9ER2tTbEplRjhBdmg0ZW90ZWF2UnJwVUpIRy85N2I4eFNXRFhHTTNC?=
 =?utf-8?B?QVpvYjFUSFp1RGhzTXZRU1MvbTRyN1RmMU9adlY1REZYTzZCZTkvRGlDS2w3?=
 =?utf-8?B?RTVGQVVZU01RR05DNThnQ0EzQ1FONUlFWjNXdytscmpPa3JqQXBCejB5d0w2?=
 =?utf-8?B?QTkvMExVaG93UFhGbVo4WGNTcFNtbXhiQy93Y2RpTkJ5bVNST0c0R0VadVRo?=
 =?utf-8?B?SWVZVm1IbitmM2FiL0NnUDEvbjhRaVJXVzkwbTJZTG1BZ2V6LzlPN3JvZ0Q2?=
 =?utf-8?B?RnI0bGcraGtXcGE3cEt0Tnh2b1p4NTkzdy9UT1JvWm13Sys4cjk5Wmo2cFlV?=
 =?utf-8?B?U1FIK1JMejBtOTZndngrYk1KWDBGR2VsbHJ3ZEY1NlJLU2ZTS1ZmTzJPM202?=
 =?utf-8?B?UnE0L2Q1ZWsyVWhEeHdiOCtZTzBNdVN0UkgzODVZcXhhbWdjU2lBS1pmQjNz?=
 =?utf-8?B?ZWZzR3FFUG1DRGxGK1BzK0FpNjdGMjBENSt4M2tHQnh3ajMvK3JBUT09?=
X-Exchange-RoutingPolicyChecked: XamQ/PWaThxJrGRs9VgbviGKIsDdXDzfq1RFOSCAM4C2bsNHpKo6iDOlUQqPDB8LUrRToNlMykWevUPBdOyuIPjfU08KCQQqea9dnUVGTvHGzXzKZsfHcB0G1vWhNeor/gij5/P+Azo4frTg40bLJt5LSCXk5XQn29xBZURH2x6f3a9oFrbVqWg041STKTu5GPsywfxuSlDh6HLZpNhdM79XWP0V+pPdX5KPYmiR2GtKWJkSZiGDZkyyTmFtKI1oP05bNYEltvttE4jghLUzP69Y50N6OWcfi8rtQuYiVNYlatxy67B/Hin9QXyirYdodcS0E1RQA0bMvwGARGCCqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 641eecd0-3e10-4cfb-6829-08df3975a467
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:42:34.5163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DhvePWrJCIIC8X9JEQoSnP3vpn4byaDZ3Ln4dKQd+eOT84XQrhKE/Y9rUjft7agard0AQ4pJJWB6zsHOibGJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7759
X-OriginatorOrg: intel.com


On 03-11-2026 11:53, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/xe/hw_error: missing xe_hw_error_work_disable() on probe error unwind
> --
>
> commit 07d05aa9e22e61afa48de05e4142a663fa2508dd
> Author: Riana Tauro <riana.tauro@intel.com>
>
> drm/xe/hw_error: Initialize hw_error_work per tile
>
> This commit initializes tile->hw_error_work across all tiles in
> xe_hw_error_init() and adds xe_hw_error_work_disable() in
> xe_device_remove() to stop the hardware error work items on device
> removal.
>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 07a7ab6ac0832..8f498e3e3e586 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
> [ ... ]
>> @@ -1118,6 +1119,8 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   void xe_device_remove(struct xe_device *xe)
>>   {
>> +	xe_hw_error_work_disable(xe);
>> +
>>   	xe_display_unregister(xe);
>>   
>>   	drm_dev_unplug(&xe->drm);
> [Severity: High]
> As reported by Sashiko on v2 [1], what happens if xe_device_probe() fails
> after xe_hw_error_init() has already run?
>
> During probe, xe_device_probe() calls xe_irq_install(), which invokes
> xe_hw_error_init(xe) before allocating or requesting IRQs:
>
> drivers/gpu/drm/xe/xe_irq.c:xe_irq_install() {
> 	xe_hw_error_init(xe);
>
> 	xe_irq_reset(xe);
> 	...
> 	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
> 	if (err < 0) {
> 		drm_err(&xe->drm, "Failed to allocate IRQ vectors: %d\n", err);
> 		return err;
> 	}
> }
>
> Inside xe_hw_error_init(), process_hw_errors() -> xe_hw_error_irq_handler()
> can immediately schedule tile->hw_error_work, and once xe_irq_install()
> enables interrupts, dg1_irq_handler() can also schedule tile->hw_error_work
> while the rest of xe_device_probe() is executing.
>
> However, in __xe_pci_probe(), xe_pci_remove() -> xe_device_remove() is
> only called if xe_pm_init() fails after xe_device_probe() has already
> succeeded:
>
> drivers/gpu/drm/xe/xe_pci.c:__xe_pci_probe() {
> 	err = xe_device_probe(xe);
> 	if (err)
> 		return err;
>
> 	err = xe_pm_init(xe);
> 	if (err)
> 		goto err_driver_cleanup;
>
> 	return 0;
>
> err_driver_cleanup:
> 	xe_pci_remove(pdev);
> 	return err;
> }
>
> If xe_irq_install() fails after xe_hw_error_init(), or if any subsequent
> step in xe_device_probe() fails (such as xe_gt_init(), xe_vram_memtest(),
> or xe_heci_gsc_init()), xe_device_remove() is never called. Can
> tile->hw_error_work remain pending or running while devres_release_all()
> unmaps MMIO and frees struct xe_device, causing a use-after-free on probe
> error unwind?


Cannot add devres node inside another devres. That is the reason this 
was moved to xe_device_remove.
Will fix the survivability mode sysfs creation and move it back to devm 
in a different series.

Thanks
Riana


>
> [1] https://lore.kernel.org/r/20261026060459.771448-13-riana.tauro@intel.com
>
