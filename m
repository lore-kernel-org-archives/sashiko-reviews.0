Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794869525;
	b=auWuPCmaYV6ugAyZ50b4XfxiiApwM27rHilx5tWXrBYFEbCacARsQhz6mHtAWZTtvYjE
	 r0sFrtJO5cKM0j2+gEzwA0EjMLkLigkQPBrhkGExAFvAzSpCKyvnjNnYRf88irbW+Kvhk
	 hvgDAd94bJbR8Dmew+khCufNZRhDzcn32aDjCcDj9RA3Tsxu+JRj4SJ9yG60ydVFzGUZQ
	 NhU2Dx+wkyOG8rDoNemO/KEqz5ihBLY9dZA76WK0Uw9pW3Xd9n0nPEcnXintiQ+5O5bX9
	 S8Mb7RknuRGp/uKFVtJkIHyAlrTPL1QtZscTFbhWkjYKwC1puN8qWpUlfnoUbAUBE5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869525;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=YaA9fjx5NEFOBmuLZh6JJFTFnSDGrYbN3fPDMjz2KxU=;
	b=eViuNkyupUrpol589ZTT9lTPPIY3MpnSzZOy5ikyduqOsO291JTedXWw5TTekng9B9kI
	 nHXfHDQ6kkusCIa11DD0/UbzKPGYQNsG2MozwiQVIulJ4p+RACqOrCcLP5ts/cke49lTx
	 nDpeYyGzNhSLLzJnEOrLf3x3ghxRLya3hfQtXG0cTjF1Tne9EBepRj1MJ8hFe+jaXdPcx
	 CUlYzzTHiT8wcHQkQxOFsvG9Uob5dpmOBY8COPY0YZm0/HiCS1Z7SmiY8slWBLJHaQHQX
	 qeI/OBs9wDXfy/2ghkOE3xCDAJC1A5zNJ3/yJwQY107Cf6yo96PW8DU2zeIK4niapPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Un8oVD4P;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=JpjU0CBg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6069F606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 22:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6069F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Un8oVD4P;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=JpjU0CBg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794869525; x=1826405525;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=mk8QhXYrcCBtnAS1lG11pu8nUvxkKzpvpuWkWqBZrk0=;
  b=Un8oVD4Ps96kM2TaeO8qsoqi2+gxQUM5S46UDQZTQ3zZd7bvViK/o7yG
   Dv6fw4/gjIbf8PrZvq+X2/uISrJLwfFSR3s/uAfw74U2DXFpgG0eVY0aT
   MQjJtYlmDe6TCZ00RZnaw9sBtGRM5yn0pjHPNXc1YWmMSZD3yUdxJ90K1
   ZdlgYRvVuR8ObZwr4p/d9SBjn05osPPfOVuZXvMAvA3zeREVXGdpaAx/E
   PPfF1t85yVt83cxFKN01xwUrGmWlaZbxsMsGL7RmMlr96FdjDSysa6f4L
   iYcZCYgbKIPQ2vdhT9yML1mp+4VNMMbymVJ9A2jPS8bnROIM48h5INNjd
   w==;
X-CSE-ConnectionGUID: a2XkcE5nQqSo/+pWaFlGTw==
X-CSE-MsgGUID: fTx8CbksRS+T+Tj7Jpcdyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3611499"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3611499"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 14:52:04 -0800
X-CSE-ConnectionGUID: Fg7YxJdWSzCzPYFrcCEoMg==
X-CSE-MsgGUID: DzMVTJG9SEGDNgROfrbMmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9711413"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 14:52:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 14:52:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 14:52:03 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.38)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 14:52:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXOQbG7DoLThQFAEsZseXEBhlkpE5bCACBxyBJhRf9IYbEUOClgvLjirhPMc1sRb8HDz05sNLJwpkFnfEAOiVPMj5CCjILxqqgNPXFKjaCKniUe9yFm/DdHsK0mvqdmqn57Qj2MtAYlVmXMZmEPwPFCv2NxTJyfnFjaJmGXVzHh2jRMEtqZPUv4Ee+cKM3LhvNKQyCLgBgrMU1dofXULlfJTLWGJYW27dN0dcjiEv1nSOaHsrN1tm6IZAybw4AorbGfyqS0gf20U22Zl+3m9MNPCBH/2qSKMb3MVW2/9NCb/+m5/YUVUWXJJSr2BIwCZLRLlbL3vTjdEtl+xu+Xesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaA9fjx5NEFOBmuLZh6JJFTFnSDGrYbN3fPDMjz2KxU=;
 b=hOjILJKFNUMVMFEwK4JOH6aUGCYND59orcItnWmchNjpE4YHKQy31A9oA540/zPAk+CCzWZvD5BCQYQv9qqDTXvt2da0kqhUnpoRvHRHSfzg0BYQyguHjWS3OEpigQehnBSfm7DOci3WAuHrDzVTaFcs+nAeCE3WhvkfeGEZmPWSzUDkIvhIp0KaMH+ehabZ+bEMOMRuNmdH1rPSWLngfnpaB+jQe3sIjCttAdRUcY+AVm6Dh/RuLajGJEt4KGKthUA37EkfJoItg+g6DcFEXQni6tKjRQgiM6ncbACI+AZWuIZd6GZQa41WD/N2jV4lF3wtU82eduoRd65tTjXePA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaA9fjx5NEFOBmuLZh6JJFTFnSDGrYbN3fPDMjz2KxU=;
 b=JpjU0CBgv8pgH6YCslEFodtIWonnCA0IRlOZcdm6O6PUtJdJyn0kapn5gTkGHXAMNzXvQjeTCdsB1j/sNRYq/4EQMiRRqqDEedhZQ9eZ9s/jSwZWdngG1OfGhANvHXtuFjNMYd1h18t+mEDoy6cmvWIrRXjvkBhfAopcGGgeYmQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB013943.namprd11.prod.outlook.com
 (2603:10b6:208:548::8) by PH3PPF8517B3F27.namprd11.prod.outlook.com
 (2603:10b6:518:1::d35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 22:51:59 +0000
Received: from IA3PR11MB013943.namprd11.prod.outlook.com
 ([fe80::1766:4eec:eeb0:13c2]) by IA3PR11MB013943.namprd11.prod.outlook.com
 ([fe80::1766:4eec:eeb0:13c2%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 22:51:59 +0000
Message-ID: <78f7a561-b8da-4737-bbf1-f94c7cb7d76b@intel.com>
Date: Mon, 16 Nov 2026 14:51:57 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe/forcewake: add delayed release with
 hysteresis
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
 <20261110220542.432595-1-zongyao.bai@intel.com>
 <20261110220542.432595-2-zongyao.bai@intel.com>
 <sashiko-outbox-207832@kernel.org>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <sashiko-outbox-207832@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::28) To IA3PR11MB013943.namprd11.prod.outlook.com
 (2603:10b6:208:548::8)
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
X-MS-TrafficTypeDiagnostic: IA3PR11MB013943:EE_|PH3PPF8517B3F27:EE_
X-MS-Office365-Filtering-Correlation-Id: b78bd6d4-78ea-4c71-4277-08df4434390a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|261009223027099003|11063799006|4143699003|56012099006|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: 5eRp1rzmi0HDNRZeTIrRFN1102CqxwnGxNuWR7bPUZPUTPfcXmzC6ldHsfcOn2+5YtwA9BkdlwU8Ds2btgj4udoVL/3rvi3rtqScUA56tMQr7SuoSTMfBZpwM7JMZKS1c9xwO3yNLk0bXKISFt92jh4HQTbgGSqyb/LnbwiNCcd97rN0un//Ab3B8jy+1xaaGwDQUBilKB+Lh4K5o89qfqrNJiQ8RxYjUq9N/iBG5qzaxqhJ9Dqp8OzT4BLDMialSnB9/AAWm5UPdL9E6Gzq+LtHbjPUNSH/kCPyfxRois/AyXzydgRX7nT0ogAOt6+tX12OP9/oZbTHqQ9ahCwZFnvMjk1ia+Z348HvZnysViVe6D8AGS79jycswPTiLiMSq5IpmMlse27hfbuDy8diUfJK5nm9qKmZgGKq9MEhzcDpWYTWSIvkprAmqo7fSEiGopKLiw09xepGGyGTZ9/9p698bQjSOE+RPGlJ1AjpqXFWowuYnr4ZixAIMX4Dj1HybszE4ZUykfVQQBKKbwSV9OGYMvgJ/dsl4+gj82MKCwnjkHuYYURiSWi1+Sxuo6eKYpnWkBrtXrtD/zy/kn3Ox29Og2XzTyV9edsXalBEjCjvWHJ1BYFVE6MtRSmylo57SPacDYSXCVVOvRTKRaZayr64iTRandGeXCUdBOEtasA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB013943.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(261009223027099003)(11063799006)(4143699003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWQ4b1pMMk1HUEkrV1YzVDdCZEo5WWk0Q3locEdJM3FZak5jMTdiYjZ4R0x3?=
 =?utf-8?B?RnZWZFNxcW9OTERyUUJpbk1WTlhhZUkraGxtMmE5ZW9OV3pLaGNsN2FDKzlE?=
 =?utf-8?B?bjBMdlJRZGNNaml5dWJuaEdWMFRRUXBlUXJBeit6ZnZadHJnTUtjcFp2RVFv?=
 =?utf-8?B?UmVFUC9mME9JYmx3ZlFBTE9RZHNiRDBYTzJYREpmWHNzdnpLR0MzeFBnQWpv?=
 =?utf-8?B?TURTeVBnZktlc0E5NDJEZWxCQk52QXJOd3JtU2tYK0pHTkI1aWZqWTJINEQz?=
 =?utf-8?B?am53OHd1Nzd3eHEzNjRIaUliY1FXRmM1ZGdZb2p6bWxJMlhMb2RWb3F4czIz?=
 =?utf-8?B?L1QrVXVuMk56dFpzZC82ZStZYnBJVm9zbWY4Nk9ZcVp3SGk5WkRkMmlrYXoy?=
 =?utf-8?B?YXJCaFZTYXBsc1F2YStGM3RnNUNoVVg0Ymd2ZGZjTXhPT2JzUHVDNjVnbWdo?=
 =?utf-8?B?ZGQ1Ym5GKzVweEI0c005Rk1YSHJnSG5VbTlCQjdGZnpzODJsMHo0TE92bktI?=
 =?utf-8?B?YzRuUnA1TWFZeTEzdjQvdVBWRUpHNjBGVE5YZWY2Rm9EVHhVaERqSGxaNUpi?=
 =?utf-8?B?UkhKR2hkbmFrbkpXQ2licHZ1ZjBtSUs0SlQrK2tMRWN1ZWtvOEhBTjBrVG5N?=
 =?utf-8?B?MFRWcno5VzJsbEdLQ0RsMGpka1JEZllud3hXRlNpN3pvc2JsOVdMQlV0U2Fo?=
 =?utf-8?B?SStZUXhxY1ZyV1hpKzIraGt5N1hXZWozSVN1QkFVandkNWhrSEYrT0lsY3Na?=
 =?utf-8?B?UU8wTnBBeDdsNVZBL0c2dnFILzR1R3ppUEhyMkUvZGJxMkdRRkVMT2s1VUty?=
 =?utf-8?B?MUVDR3dYTEdKeGdLcVVNSXdVMFFhcEk3eHVwbERIWGIvYmFMK25jNm1vMVRa?=
 =?utf-8?B?WFE2Y1RraldLWThva3JoMUpyQVBCbkthWDBFV2hQdWxpZHkyT0F0TFAveWNq?=
 =?utf-8?B?UTBCV1dQYnFpSVdFUVB2MzMwd2x6RU51bVhnem5zaW1zREwrdU9sY3RwK05S?=
 =?utf-8?B?cG9KbkRjV2lTclUrUk9kWEt1RDV6eDdPM0N6NmlSdUZ0UEU2d0o0b3JMcVkz?=
 =?utf-8?B?TUxsL21xR0kybDI1T2V0SGlQNHU1YlRzNUQ2aHZJZzRYRjVvQzZ6elJ4WGht?=
 =?utf-8?B?QzBKSTNDbjdLdkVBT0N1SVhlYStUdk5hSVN3Qk4zb2VWTVN6aXBxdGs4Mkt5?=
 =?utf-8?B?b2hsUDVxc2pHQ0lqemo0MU91d0FBNlF6Q1kvdHZOUnVnSmhleGg0UW02eW9z?=
 =?utf-8?B?UjVWQk9oZTBNbEdUYWZLYjh6Zjd0RWpkYzFhc3pHbDIrSTVlNjd3M2JmTVo2?=
 =?utf-8?B?TjlQNVNRWVUycWF5ZjAzOE50clZXWU9MR2dLNUlyNG0rWkVkUEgvOEJLVXlL?=
 =?utf-8?B?b2NUVkRCakYvR1UwMWI2RlN3YmVFbHNTTDIram9BL1kvS3FyVEQrQUE4Qkly?=
 =?utf-8?B?UnlCNkF4UzZLQjZSeS8zTE5pbzNjeUZtZVBwUWJ6TUlucjUvc2VpZTFHbEVT?=
 =?utf-8?B?Tjh0QS8zdTAvZGUzNDhEdXozQXcwMjlxdDY0UFZ5Y3o2RU9lWDRXOXhrVnp1?=
 =?utf-8?B?N2dac0s2UjN6UERpVnlaQk55ZjFic3h5d2JDSjNBamVJYmFzRzZyR0xqYWV6?=
 =?utf-8?B?eW1SaExCRXZLNEZsVGc4QUhBa1hSc2ZQaWpqa1VoMFc3dEw2OFBTT2Q2aSsx?=
 =?utf-8?B?YkpQNEdvZVl4OUFZV0VDOU13R1RsU3ZnR3c3UjR0QnFraVZqcnM3QzZYeDhE?=
 =?utf-8?B?WXVqSVdtOG9iaFpnZXFUR0FLT3YrMitucEJNdWg1a0JLcjFRcEd6NENZcUJH?=
 =?utf-8?B?RmNseXFjQVBKVUVHclZlRXB1NWhFeTZycjlkS2U4M2RHOFovMlJxTTNXK2Vt?=
 =?utf-8?B?L1Vpei9oeGdoenkvMkdWQlpNci9vRFlJVXdWV2lQL04zSlptOTJObjVpNkxo?=
 =?utf-8?B?WTBDd2pFdzJXZ0ZTOFdqcmRjTlB6MFp4ZnI2VXFwT1YxdnBvZ0l1VllsODVT?=
 =?utf-8?B?ODlRNnlvR1FjZ3lYcFRncGJWOGNEUndXRFd3U0ozN0pBSTJtbGdHeFZ2dnY5?=
 =?utf-8?B?SHNEeUwvTUdkdEZHZHJZTnk3QUp5SHN6TEpsUW0xOWw0MkJjUHNnWHNsMGdU?=
 =?utf-8?B?aFNwNmV5cFdESkZBL0p3K2Q3R2NpcVgwNmI0dVZKbkl1Z0RRSjlUNnFrdG1Z?=
 =?utf-8?B?NGZzTjcvMzJsZ2ZaMkF6eDFvbGo2ekkzblcrbStiRWN0NDhqYUtlSVlqWm9o?=
 =?utf-8?B?Z0g2TjZaakRKV3Ztb0xWZVFMV0dlY0gzWGdkcFF3NXBRWjJUU1BTcW9wMlBl?=
 =?utf-8?B?WTY4NEZreGRXNFNvdHJUcmRtUWJFQUZoVjN1bGREazVhdHYyc2tIQT09?=
X-Exchange-RoutingPolicyChecked: FPJSmbC65lprdIgZDAYgIrJV2nYH8X62n9Ocgnxk5e85jHUZlB7Q1JiGxsVNSHpnsbUso2Pnj5UAtwV8xngTTsJm7rew2Pfr9V4P1CBF8ok278vmXE1I5lYC4ydc6pp0F5lXk5UeCZalkrGYK2UXfQahwapAZ4chVk1GtrsMHbiiHAEPM5m9BsO6zI+djnmbp6R5cxNfJuuUMQ05bJ9pP/9hFHjkp7/5wbc6jnKrkiPjfmfFUGvZBTXHjtjL4ssCzkVij02xUPVmWgDd5JVNg2vgMZ8xI9Gzs/RepeNu86INtxehYzcZFc0lGaRzxHTbH3+cY0k7ODR2hHl5ohEAiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b78bd6d4-78ea-4c71-4277-08df4434390a
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB013943.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 22:51:59.6976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nczLAR20n2gxDKMA4twE7sNktbVgqQavN6P5sHEC34A5tg5bmqw12P/k3q7S1ki0qNXbO8qSg7IGyXbiE7jBUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8517B3F27
X-OriginatorOrg: intel.com


On 11/10/2026 2:34 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] drm/xe: delayed forcewake domains stranded when
>    rpm_get_if_active fails
> - [Low] drm/xe/forcewake: xe_force_wake_assert_held() passes on delayed
>    domains
> --
>
> commit 4a71af2399dc0153d2185a60b2aa48a76a02006c
> Author: Zongyao Bai <zongyao.bai@intel.com>
>
> drm/xe/forcewake: add delayed release with hysteresis
>
> This commit adds xe_force_wake_put_delay() and a delayed release worker to
> keep forcewake domains awake for a short hold period after their last
> reference is dropped.
>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 197e2197bd0a3..d09d138c10840 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> [ ... ]
>
>> @@ -244,21 +307,101 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>>   	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
>>   		xe_gt_assert(gt, domain->ref);
>>   
>> -		if (!--domain->ref) {
>> +		if (--domain->ref)
>> +			continue;
>> +
>> +		if (hold_ms && fw->delayed_enabled) {
>> +			unsigned long hold = xe_force_wake_hold_jiffies(hold_ms);
>> +
>> +			domain->hold_until = jiffies + hold;
>> +			fw->delayed_domains |= BIT(domain->id);
>> +			/* No-op if pending, the worker requeues for the latest hold. */
>> +			queue_delayed_work(system_percpu_wq,
>> +					   &fw->delayed_release_work, hold);
>> +		} else {
>>   			sleep |= BIT(domain->id);
>> -			domain_sleep(gt, domain);
>>   		}
>>   	}
> [Severity: Low]
> Does keeping BIT(domain->id) set in fw->awake_domains while a domain is in
> fw->delayed_domains cause xe_force_wake_assert_held() to pass even when no
> caller holds a reference?
>
> drivers/gpu/drm/xe/xe_force_wake.h:xe_force_wake_assert_held() {
> 	xe_gt_assert(fw->gt, domain != XE_FORCEWAKE_ALL);
> 	xe_gt_assert(fw->gt, fw->awake_domains & domain);
> }
>
> During the delayed hold window, domain->ref is 0 and
> xe_force_wake_delayed_release_work() can put the domain to sleep on
> another CPU at any time, but xe_force_wake_assert_held() only checks
> fw->awake_domains & domain without excluding fw->delayed_domains.
Agree, will fix in next version.
>> +	ack_fail = xe_force_wake_sleep_locked(fw, sleep);
>>   	spin_unlock_irqrestore(&fw->lock, flags);
>>   
>> +	xe_force_wake_warn_sleep_fail(gt, ack_fail);
>> +}
> [ ... ]
>
>> +static void xe_force_wake_delayed_release_work(struct work_struct *work)
>> +{
>> +	struct xe_force_wake *fw = container_of(to_delayed_work(work),
>> +						struct xe_force_wake, delayed_release_work);
>> +	struct xe_gt *gt = fw->gt;
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_force_wake_domain *domain;
>> +	unsigned int tmp, expired = 0, ack_fail;
>> +	unsigned long flags, next = 0;
>> +	bool remaining = false;
>> +
>> +	/* Never resume from here, the suspend flush settles delayed domains. */
>> +	if (!xe_pm_runtime_get_if_active(xe))
>> +		return;
> [Severity: Medium]
> Can returning early here without sleeping expired domains or requeuing
> fw->delayed_release_work leave fw->delayed_domains stranded awake?
>
> Although commit "drm/xe/forcewake: flush delayed release at power and
> teardown boundaries" flushes delayed domains in xe_gt_suspend() and
> xe_gt_runtime_suspend(), xe_pm_runtime_get_if_active() returns false as
> soon as rpm_suspend() sets dev->power.runtime_status to RPM_SUSPENDING.
> If xe_force_wake_delayed_release_work() runs while xe_pm_runtime_suspend()
> is in xe_pxp_pm_suspend(), xe_bo_evict_all(), or an earlier GT's suspend,
> and that step fails and jumps to out_resume, the remaining GTs are never
> flushed and runtime_status returns to RPM_ACTIVE with their delayed
> domains still awake and no worker pending, preventing C6 entry.  In
> addition, when CONFIG_PM is disabled, pm_runtime_get_if_active() returns
> -EINVAL, so xe_pm_runtime_get_if_active() is always false and delayed
> domains are never released.

Agree:

xe_pm_runtime_get_if_active() only return true/false.
Use pm_runtime_get_if_active() instead. Do not drop the delayed release work
while a runtime suspend is in progress.
The work never resumes the device and handles three cases:

a. runtime PM active: put expired domains to sleep as before;
b. runtime suspend in progress:
    b1. re-queue and retry later. If the suspend completes, xe_force_wake_flush()
        cancels the work and settles the delayed domains.
    b2. If it aborts, the device returns to RPM_ACTIVE and the next run
        puts the expired domains to sleep;

b. runtime PM disabled (e.g. CONFIG_PM=n): the device stays powered,
    so release the domains without taking a runtime PM reference.

>
