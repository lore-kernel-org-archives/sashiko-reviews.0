Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795265246;
	b=3+YSK9ti8naN5sfccqCdtSQ2OcHwtKObAISI1Yu26uhMg65hcze3AV9KtkB4yEJnt4sv
	 8QA7Jngb3c0E7SYD9zmRaYaA2D4xXDmRmKbTZaKGL7CsHWfPWAjLSig4BLjG8FqpQ5pIR
	 RmPRk9jUA722h7DvW4i1FX8O0UusxjcLEMnaGSsXVZsd2KFaJHxOk0ACGRiMU+YzyI+E+
	 3X4aTRE6gIDxUFq8Q+qBSZ7VXqXUuwdJMK8EWT9t05T5MRJ3EzE9MEBtFyUQt74Glxn6Y
	 Tu453PzZlLriw+bZcU0/9PmrpMYmAlv2oxEah8hH0V2Io26N/2WVPjWzk/aSm85UAvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795265246;
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
	bh=19m7vb8YaN/nz6XABWFhcO+mInd2GqjoN9Fd+33Ofko=;
	b=2jWHqCqIpwlgrnOPGhM0n7WKOD0fDLScMb3BbzEqSbSYa7TlbwImEj52JQNt2mCTosWc
	 3409RV0SJRdd7+DicWG61hqesjEYFdTo+c32MqZL9vOYnJ0NluPNcU8TIze4dENFUhP3A
	 qero4fEspUtxGFAat1QQI+Af8q3uRsxqDpeKMxgEoZmFYo0APuxrtSeHl0RfNDoXJQ7VV
	 cjuyUjjdV37pGfMWH1/tmz7jHpQm6IYVXpEkTpDiAihhWn6jISqDpppsf7Zm+yffuLjrr
	 GzHqZC9ruaob7zIb9gOt0Aviq6HSh8Vy62ISz8HSXM9z1hoRfK32UdHNNpAbg2dR5pA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQbB3hfY;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="VL/wr9GS";
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964CE606A320
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 12:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 964CE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQbB3hfY;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=VL/wr9GS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795265246; x=1826801246;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8CnwHnUooIZ6NUlvjQInXGvebOl7mSn3e0t1z0pb12g=;
  b=cQbB3hfYG7hbWn4lhQIUGQ1mFRo0PVoVkZ/WHIXgNSjrIxrRsOltTIeI
   3rZhJx1jKmqPb3t+RL/ReXkgPWg5vgoN45vUXHE1x3yeWBnrpWeOnIzkV
   Oos69UH5oi3z4awUBo7Dw0FMxffJb0soPbAciwjOCCFpaCJUrblcaVmUU
   /FGx4cRvFXRobxd4aACDoXm+ZwewaseLhTCm9vjAZLo58cMi9dx2q/TBc
   UfQ9aGsMgh7vqYrmVkk+y7um63lotxc7npnDtt4s2g9Fgm1OiJXxF6hDj
   0b0z0Y8F79rNCDV2uldeF5ybZKMAGJv+ou4Fv5FfMi8y6YfYLc10jGkjG
   Q==;
X-CSE-ConnectionGUID: nLIMdLOqRiawjyIYhtP/ow==
X-CSE-MsgGUID: qzgPQxCjT+ymTb4MTjZgpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4161261"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4161261"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 04:47:26 -0800
X-CSE-ConnectionGUID: ybTJeSs7RSilxd5mvIcreA==
X-CSE-MsgGUID: bTDENG/yTi6ih1iTSrzX+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11033300"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 04:47:24 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 04:47:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sat, 21 Nov 2026 04:47:24 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 04:47:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhXLRbaotWYxuZCWHDp1YH1xjd+UGKvjtKCGkezC1D4fgDCi87lZ5XbvEXRcOIkInM1eK46OKcT27skwUF8KN1lfKL+CPFD/2u7Q8DeY4indxu8H9nx01h0BCEljF9yV5tLPPZouyQqnUSxQH5Ql6TdNgbhPmsrTUhNlqwl6IlPebxCyHpEir52ZqyyFub+wy4XY5qxdMzWHtYal0qaFwmwZR11MwFHFsdyR3AbAvuSKX/qDCSUrbVQsdBJzethYS+pp8x+pbBB8koncwZRY+EV+0W8D7NwAwSvuVMC/SzljmnnymmGMxH1Fs169dLW5h8XBhJOmjq9krKKLR665Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19m7vb8YaN/nz6XABWFhcO+mInd2GqjoN9Fd+33Ofko=;
 b=DwVXoD24Y1h9LSpmT1oPDUUytqbQeCtkmGB2LqsDkI6Ujw2yuaJypIeuyq1INlMMGMw7Asi2EgqSMv5sEf7qhJSSZAB2kaIuHxLMOZE3c0rGaIhvr3CkBVh65PtZiJ+oBs92nmDLDM6SwLrpA7iMgKsgia8CzNuZH+uReuMRNFfF1nLRYxyL4fK1KROBRv7Vo+lFmCNdsdqgI7vo1fyz5dELeuY8BqJDe0sng3YL9mWhMg5YIV8zi9j5eaCLlmh3+iHGhhkwM4wkT7rl//nHSzz1d91Cnjdd+bBjjTA2Ukww0yeuXBFe1dQ1+7Mt+BP2Sq6f6rD3imD6y6bJ+7Gc2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19m7vb8YaN/nz6XABWFhcO+mInd2GqjoN9Fd+33Ofko=;
 b=VL/wr9GSJFGZEJ1fiY685KmsvT94RuVh3Hxuxsmd/QUvgsYdSczndlrDISEMakNP26Noym70Wphanpsle3in1i+B1WjpzsPxTdI/2URhSPFmnsHL+DUfXZBm9ixdEX6d5TnibVrwxOlpAHtEEoknJLA8m3pZL8kBAMGJRd0IOxA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by SA2PR11MB5001.namprd11.prod.outlook.com (2603:10b6:806:118::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 12:47:18 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 12:47:18 +0000
Message-ID: <9dd317cd-0dae-4a1b-900d-f5f842e23750@intel.com>
Date: Sat, 21 Nov 2026 18:17:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] drm/xe/oa: Quiesce OA streams on driver unbind and
 PCI reset
To: <sashiko-reviews@lists.linux.dev>, Umesh Nerlige Ramappa
	<umesh.nerlige.ramappa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
 <20261121020145.147384-16-umesh.nerlige.ramappa@intel.com>
 <sashiko-outbox-226548@kernel.org>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <sashiko-outbox-226548@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0066.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::11) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
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
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|SA2PR11MB5001:EE_
X-MS-Office365-Filtering-Correlation-Id: abb15268-0eff-4857-ef1b-08df47cd93da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|261022105027099003|4143699003|5023799004|56012099006|11063799006|261009223027099003|261021121427099003|261021123027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261022113327099003|261022075727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8V4I2VfV1prC/bYPnuj1mZUP/L0guCtLOlNev3Mv1xpYeNz+WL+YN/rYPAjMQlDoU96A22PuTulrK/WwD2y/zjhDNULeZMLPpYp7ul20hKUoDT+MlMesyQihHM9KR5HOXtBhqaao2bK5DS9i8jMp4Nf+0ekTs9/8MSUkI4Kc+WIRVEx4GAtHiheoCouVK67aB+u8xCDVomxM+1z5PPiulS8jw6PoSFvFyCYKqvwcEE18UhJWVuAHpf1vEEWDXZOGRXYaVBsvRzf7Qk9c2uIG2W+9lgCkWAk29JfpZ8bHKoySZCGYlRbHWQOA0T2YzNeLaamt3qo1Y9Qr6Jng8UBNOkfpJh6ou1G//1GxqO97r6KvldQIoj4odJb7+LV37xxeeniIokEQn58Tu4ZIud1zJjW/s8+cZfWsXvaOxQ+vFBV8yq3XvArszXrloszpOOZUfOoZ3FwPfvbRxtWs/V+vX/YyPviT7aqOMwkk+VSwT3G6fEotC8fuLL3FZ/cwwQZ6pZutOgjKzKJqblBxGDmETLBHR7aVQAMiAdBG2LH/GaqceCNsQLYxoKr+1bWNQT/X/wk2XZDTyWmzeXOTAwgCIpCtVnd/c5KqimWJPrQCa4p0fz3MG79qbkJ5m++mKPHvGqIH84DPl/J6FIJzC2LNoimef5HlcaMdYB5XOnMaQjA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(261022105027099003)(4143699003)(5023799004)(56012099006)(11063799006)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022113327099003)(261022075727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHZ1UzJwbGxJcUc5REVvYmtQM3JIQTVNZDhrd3U5NUpYanhPaEF4VWxTT3Uy?=
 =?utf-8?B?MGllT2RxV2RGdUo5dTdjcVlSK3FERWdKeTgwU2NtOXBqbm1sdU55TDdKamVm?=
 =?utf-8?B?aEI3bjhqYjdEUkM3SjVXb3paWTM3aU8rRzYxN0JLQ3BDTlV0NlkvTWJ1b01o?=
 =?utf-8?B?STRIYWJRRm5IbEFKOEJpaUovNHFIV3BweDhJajBRUGg4RjEzcGZZemRTeGpJ?=
 =?utf-8?B?Z3JyamFiY2FleCt3c0dLNElrcy8rWWpuYnM1OW0vamZBNGNWTXp5K1VNRXVX?=
 =?utf-8?B?RHpSZ3UxVy9HME9KM0txVlQ0c1hDN3pmOVRCTEx0TmlJV1pwbWFJbnBTZ25D?=
 =?utf-8?B?SFVTWUVhUlEwbGxpTDV2Q3Y0L3dkQ2E5c0lFVTFvLy9TWE1pQVh6N3JnZ2JD?=
 =?utf-8?B?clR5RldKOHk3MEJhbWhHS0dBdUswbzdBaElOc2U1U2g5MUdQU0dLYmNzSEVV?=
 =?utf-8?B?cXBndm10cjVxWFlYZmhPSGFuZ0NzOTJwQzUvcmxpRWpXU2xXZFd5RkhDR1Vw?=
 =?utf-8?B?ck9QNU1Yc0MxbS9ndmptaEgxSWVqckdPSnQ3MTE1VFNwWlVOZ3NDZ1hKK1Ry?=
 =?utf-8?B?NFNZdStTeVpWVG9UR2hsVjFaY0k4Ym5qSnkvaS9FeHNDTC83QkpWNEhxbGtz?=
 =?utf-8?B?c05aSkRVaDFkZnR4TGlTMFY3OGRyR2piUTdqS2E2M0Z6QTU4MzdTTGd4ZHlq?=
 =?utf-8?B?RWo5Si8xNDdSKy9nQVFaYjdHK1Y3T2tuUlBmeERMQ3BkQ2hXd1l4RzNCckxC?=
 =?utf-8?B?bzNaMkxUL2ZpeFp4TGs1UHFwWk5GZml2SW82QXIxbzZVWENueEpKWEdaY1BK?=
 =?utf-8?B?UVpRcnNCY1luUTJrL3dmbHRwSkhyRFN3Y25hT09mQ09WdnhNeDl3T05kQytE?=
 =?utf-8?B?R2UxUlBNa200Vm9UWnJYeG1xcmR4WkZkQlM0WWxzNi9XTG9vWDJVeFQ2QU5M?=
 =?utf-8?B?cUQ4Mm81MEJHRjcyRlJYa0tHV3dDNHYydGNxUDkrS0d5SFJPeW05UERlOTNn?=
 =?utf-8?B?cnRCTE83cXVMTVF2MUtRTjJIT2NpMnJ0S3Y1Nnd3dE1YY1Zha1J2cG5vcVBi?=
 =?utf-8?B?NElrN3BiQVgzNE8rUUxhWFkrTmxabXRRcjBsaEt6dEJPdUgyTVZHdFFQbVJn?=
 =?utf-8?B?bWFHU0wrbm9TNXFoWWRPTmpqaEdVczJyczlqKzI4OU9PSndqM05QRkV5Qk5k?=
 =?utf-8?B?UVBKT1k2QkI5YUphOFJsZk5NcWtQQnVKMng0RWNGQUVRMGZKYjZMT1BJOHVM?=
 =?utf-8?B?Nk5yMEhEaGwwM2tuZ2Fyb3dsK1R2U3A0OEJuOUhld3hBb3NTVENIYnVMQ0ls?=
 =?utf-8?B?YzArNzMzK0ZkMkp0VWw3VEpLNGxkVmdmdjVVaFFhSmQzZHF5cFNyQjBERElV?=
 =?utf-8?B?U1pVL2s2b09KUU0xRFoySGp0V09nOGkwcEx1aDA0Q0VURVhHTk9abXZEUlVz?=
 =?utf-8?B?Q3VoSVF5WjRWWkg2SEdGR1lnVTJJbXpjUVZFRHRxYXF2SDRnbDlUWDVJczdi?=
 =?utf-8?B?Um9vbzVLaEVBeGFmc2VtVlYvWHQ1R1U0QWxBY0VaZHFoRVZSdk5Lc2NMcXow?=
 =?utf-8?B?Ull1ZzV3V2loRFRCaWxBeU1HWWZ1azV4dmQzbHVSeGgxRUxQdEZGQi9tS05t?=
 =?utf-8?B?THd0NEJ6T0JZTEUzUU1lRWc2R1hVWGRENWs1MXEvek1NdGhpZnpmenFweUJT?=
 =?utf-8?B?NlhDbzM2dmsyRmZ1TkplU1p1L2VPejFJYWhMbS81S2dXOUY3UHdOUFduVSsy?=
 =?utf-8?B?Q1dydHBocWVOaG1kNjZBUDFIb0MrekJwQUttK0ROVldDWnJ1dnFSK0w5d3R0?=
 =?utf-8?B?T0xzVTBBYmk0MVRwKzVCbXFjMVY1eFhndG1xQzhWWXBpSmg4YkNJS0E2YmZo?=
 =?utf-8?B?M0I3RXhoREZpaWhzWGR4ME9wdXJqYjNabkRaRENoN2lGRUVSQTVjbE91VnV1?=
 =?utf-8?B?TThSTkxtemJBQmNvL3JQOWVwN2d0Q2w5U2FSMC80UzFDSzdDN3BWWTZtWlZx?=
 =?utf-8?B?ZFlINGdidG5iS2NRaHdxaDI1VjBjaW9Wa0FvVHpOWmtCZ3RMQWVFVTBMcEZZ?=
 =?utf-8?B?VVN4T1plVkc2UG5kK2JQSEx2dEhiZFRzK1dOQzNWRnNUZ2Q3Wm9ndHhlRUlm?=
 =?utf-8?B?QWVuOVg4VmpGblVpUnMzcnpFV1NnaXZrQm9TT21UaGxMQjVJUzgwVTY4VU9z?=
 =?utf-8?B?RGhkZGV6anZGbGhUY2JzcmFTNTVwUnl5bWxycFIyS2czdTRma3d1cjEwYnM5?=
 =?utf-8?B?VnpvM0owN3MwaVpJS0kyTmlWRndwbU1VNTU4NTk5bFJiSzhSenkwSkxNYzR1?=
 =?utf-8?B?TFBNSzFGQ1RVNUswUzNFWDJBZG5hUG56T3dOczRWVjd0L3pnSjRQQT09?=
X-Exchange-RoutingPolicyChecked: CnCTS4bpNcjJLhLcAr6ohavauxgo66NH/30wZNmFkHU3/TMB/GBIJudioe1kyEU15Sigl4VOZogciDvyAPvB5iRYOJoti/rjhn2WbbyyQ2mEWPT09IMErBKn0mxP+Bsx1GQQXBkjIVx0bn9OtYXSLQNoE3M9aIaliBFH2lLwZ/9WnkhgoGixNoenX3EXDTafIs9E5ktuLzE4ehJsfVBQJZ6WlATgH6lXROtMqBWoXACly5NQdiUb1qhu1YpQPS904xspjeQikEljs4zhlk8KQNE2r0NQMUJ9S/Jv9DF5BzcK3L4ZBK43ywvTfK5FZxc2Y1ITV6jqOciHW2nbEc9L3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: abb15268-0eff-4857-ef1b-08df47cd93da
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 12:47:18.6287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VoZgWBuRk8yfvNFxGwf2cADNoGq0lOEkaCKwzqLZrCS84XMgfMmy+ZqCFyroP6vAVDxRrOqNjTfwlclKRD9P8nimKWnAxskyFLfleAS1f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5001
X-OriginatorOrg: intel.com


On 11/21/2026 8:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issues to consider:
> - [Medium] drm/xe/oa: xe_oa_release() drops gt_lock before
>    xe_oa_free_oa_buffer()
> - [Medium] drm/xe/oa: drm_dev_is_unplugged() race in xe_oa_release()
>    skips ttm.wq flush
> - [Medium] drm/xe/oa: OA buffer BO references can outlive
>    flush_workqueue() on unplug
> - [Medium] drm/xe/oa: unlocked stream->dead check for runtime PM in
>    xe_oa_release()
> - [Medium] drm/xe/oa: xe_oa_disable_metric_set() submits batch on wedged
>    device
> --
>
> commit ee62062a6a8afa8ac686e03248886c0c4f01f369
> Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
> drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset
>
> This commit quiesces active OA streams on driver unbind and PCI slot reset
> by marking streams dead, tearing down hardware and device-bound state in
> xe_oa_fini(), and deferring OA buffer and stream struct deallocation until
> xe_oa_release().
>
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index e719cd92b271b..e8228a244cc2e 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
> [ ... ]
>
>> @@ -865,7 +887,9 @@ static void xe_oa_stream_drain(struct xe_oa_stream *stream)
>>   	struct xe_exec_queue *q = stream->exec_q ?: stream->k_exec_q;
>>   	long timeout;
>>   
>> -	if (!stream->last_fence || dma_fence_is_signaled(stream->last_fence))
>> +	/* Nothing in the ring runs anymore on a wedged device */
>> +	if (xe_wedged(stream->oa->xe) || !stream->last_fence ||
>> +	    dma_fence_is_signaled(stream->last_fence))
>>   		return;
>>   
>>   	/*
> [Severity: Medium]
> When a stream with stream->exec_q is destroyed on a wedged device, does
> xe_oa_disable_metric_set() still submit a context-restore batch whose
> fence will never signal?
>
> drivers/gpu/drm/xe/xe_oa.c:xe_oa_disable_metric_set() {
>      ...
> 	if (stream->exec_q) {
> 		xe_oa_configure_oa_context(stream, false);
> 		xe_oa_stream_drain(stream);
> 	}
>      ...
> }
>
> xe_oa_configure_oa_context() pushes a new job onto the already-wedged
> stream->exec_q and replaces stream->last_fence with the new unsignaled job
> fence, which xe_oa_stream_drain() skips waiting for and
> xe_oa_free_configs() attaches to every oa_bo->bb suballocation in
> kernel_bb_pool.  On a long-running queue where guc_exec_queue_kill()
> already ran at wedge time, work_tdr is never scheduled for the new job,
> leaking the job, stream->exec_q and its drm_device reference.
>
> Guarding the xe_oa_configure_oa_context() call in
> xe_oa_disable_metric_set() with !xe_wedged(stream->oa->xe) would avoid
> submitting a batch to a wedged device.
Sounds reasonable to me, something like this:  if (stream->exec_q && 
!xe_wedged(stream->oa->xe)) { inside xe_oa_disable_metric_set() would do 
the trick.
>
> [ ... ]
>
>> @@ -1754,33 +1781,67 @@ static long xe_oa_ioctl(struct file *file,
>>   	return ret;
>>   }
>>   
>> +/*
>> + * Disable the stream, restore the HW state and release everything but the OA buffer and the
>> + * stream struct, the same whether the stream fd is closed or the device goes away, and
>> + * whether or not the HW still responds: all HW waits are bounded. Afterwards the stream is
>> + * dead and any further read, poll, mmap or ioctl on the stream fd fails with -ENODEV.
>> + */
>>   static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>>   {
>> +	unsigned long flags;
>> +
>> +	mutex_lock(&stream->stream_lock);
>> +
>> +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>> +	WRITE_ONCE(stream->dead, true);
>> +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>> +
>>   	if (stream->enabled)
>>   		xe_oa_disable_locked(stream);
>>   
>> +	wake_up_all(&stream->poll_wq);
>> +
>>   	xe_oa_stream_destroy(stream);
>>   
>>   	if (stream->exec_q)
>>   		xe_exec_queue_put(stream->exec_q);
>>   
>>   	drm_syncobj_put(stream->ufence_syncobj);
>> +	mutex_unlock(&stream->stream_lock);
>>   }
>>   
>>   static int xe_oa_release(struct inode *inode, struct file *file)
>>   {
>>   	struct xe_oa_stream *stream = file->private_data;
>>   	struct xe_gt *gt = stream->gt;
>> +	/*
>> +	 * Don't wake a removed device for a stream xe_oa_fini() destroyed. If xe_oa_fini()
>> +	 * marks the stream dead only after this, the device is still bound while it does.
>> +	 */
>> +	bool rpm = !READ_ONCE(stream->dead);
>>   
>> -	xe_pm_runtime_get(gt_to_xe(gt));
>> +	if (rpm)
>> +		xe_pm_runtime_get(gt_to_xe(gt));
> [Severity: Medium]
> Can sampling stream->dead before acquiring gt->oa.gt_lock still wake or
> touch runtime PM on an unbound device?
>
> CPU0                              CPU1
> xe_oa_release()
>    rpm = !READ_ONCE(stream->dead);
>    /* rpm == true */
>                                    xe_device_remove()
>                                      ...
>                                      xe_oa_fini()
>                                        xe_oa_quiesce_gt()
>                                          mutex_lock(&gt->oa.gt_lock)
>                                          xe_oa_destroy_locked(stream)
>                                            stream->dead = true
>                                          mutex_unlock(&gt->oa.gt_lock)
>                                      /* driver unbind completes */
>    xe_pm_runtime_get(...)  <-- runtime PM on unbound device
>    ...
>    xe_pm_runtime_put(...)
>
> Nothing in xe_oa_fini() or devres_release_all() waits for an in-flight
> xe_oa_release() that has not yet acquired gt->oa.gt_lock.
>
>> +	/* gt_lock serializes against xe_oa_fini(), which destroys the stream on device removal */
>>   	mutex_lock(&gt->oa.gt_lock);
>> -	xe_oa_destroy_locked(stream);
>> +	if (!stream->dead)
>> +		xe_oa_destroy_locked(stream);
>>   	mutex_unlock(&gt->oa.gt_lock);
>>   
>>   	xe_oa_free_oa_buffer(stream);
Unclear to me, please do the necessary here.
> [Severity: Medium]
> Can dropping gt->oa.gt_lock before xe_oa_free_oa_buffer() let
> xe_bo_pinned_fini() race with unpinning stream->oa_buffer.bo?
>
> CPU0                              CPU1
> xe_oa_release()
>    mutex_lock(&gt->oa.gt_lock)
>    xe_oa_destroy_locked(stream)
>      u->exclusive_stream = NULL
>    mutex_unlock(&gt->oa.gt_lock)
>                                    xe_oa_quiesce_gt()
>                                      mutex_lock(&gt->oa.gt_lock)
>                                      /* exclusive_stream is NULL, skips
>                                         xe_bo_dma_unmap_pinned() */
>                                      mutex_unlock(&gt->oa.gt_lock)
>                                    xe_bo_pinned_fini()
>                                      xe_bo_apply_to_pinned()
>                                        xe_bo_dma_unmap_pinned(bo)
>    xe_oa_free_oa_buffer(stream)
>      xe_bo_unpin_map_no_vm(bo)  <-- races on xe_tt->sg without bo lock
>
> Once xe_bo_unpin_map_no_vm() unpins and unlocks the BO while
> xe_bo_apply_to_pinned() still holds its temporary BO reference, a
> concurrent shrinker unmap (xe_tt_unmap_sg()) and xe_bo_dma_unmap_pinned()
> can both unmap and free xe_tt->sg.  Keeping xe_oa_free_oa_buffer() inside
> gt->oa.gt_lock (or DMA-unmapping before clearing exclusive_stream) would
> close this window.

Again, sounds fair to me, we can just move the xe_oa_free_oa_buffer call 
inside xe_oa_release before mutex_unlock().

-shekhar

>
>>   	mutex_destroy(&stream->stream_lock);
>>   	kfree(stream);
>> -	xe_pm_runtime_put(gt_to_xe(gt));
>> +	if (rpm)
>> +		xe_pm_runtime_put(gt_to_xe(gt));
>> +
>> +	/*
>> +	 * Freeing the OA buffer may defer the BO destroy to the TTM workqueue. Once the device
>> +	 * is unplugged, this may be the last reference on the drm device, so let the destroy
>> +	 * finish before drm_dev_put() releases the GGTT.
>> +	 */
>> +	if (drm_dev_is_unplugged(&gt_to_xe(gt)->drm))
>> +		flush_workqueue(gt_to_xe(gt)->ttm.wq);
>>   
>>   	/* Release the reference the OA stream kept on the driver */
>>   	drm_dev_put(&gt_to_xe(gt)->drm);
> [Severity: Medium]
> Can drm_dev_is_unplugged() return false right before drm_dev_unplug() runs
> on driver unbind, skipping flush_workqueue() when bo->delayed_delete is
> already queued on xe->ttm.wq?
>
> CPU0                              CPU1
> xe_oa_release()
>    xe_oa_free_oa_buffer(stream)
>      /* queues bo->delayed_delete
>         on xe->ttm.wq */
>    drm_dev_is_unplugged(...)
>      /* returns false */
>                                    xe_device_remove()
>                                      drm_dev_unplug(&xe->drm)
>                                      ...
>                                      /* devm drops its drm_dev_put() */
>    drm_dev_put(&xe->drm)
>      drm_managed_release()
>        ggtt_fini_early()
>                                    ttm_bo_delayed_delete()
>                                      xe_ttm_bo_destroy()
>                                        xe_ggtt_remove_bo()  <-- UAF on ggtt
>
> ggtt_fini_early() is registered with drmm after xe_device_destroy(), so on
> the final drm_dev_put() it tears down ggtt->mm and frees tile->mem.ggtt
> before xe_device_destroy() calls ttm_device_fini() to drain xe->ttm.wq.
>
> [ ... ]
>
>> @@ -2673,6 +2740,49 @@ static void xe_oa_unregister(void *arg)
>>   	oa->metrics_kobj = NULL;
>>   }
>>   
>> +static void xe_oa_quiesce_gt(struct xe_gt *gt)
>> +{
>> +	int i;
>> +
>> +	mutex_lock(&gt->oa.gt_lock);
>> +	for (i = 0; i < gt->oa.num_oa_units; i++) {
>> +		struct xe_oa_stream *stream = gt->oa.oa_unit[i].exclusive_stream;
>> +
>> +		if (!stream)
>> +			continue;
>> +
>> +		xe_oa_destroy_locked(stream);
>> +
>> +		/*
>> +		 * The OA buffer stays pinned until the stream fd is released, an mmap may still
>> +		 * hold a reference on it. Drop its DMA mapping now: the fd may be released, and
>> +		 * the BO unpinned, while xe_bo_pinned_fini() DMA-unmaps it without the BO lock.
>> +		 */
>> +		xe_bo_dma_unmap_pinned(stream->oa_buffer.bo);
> [Severity: Medium]
> Even after the device is unplugged, can a temporary reference on
> stream->oa_buffer.bo outlive xe_oa_release()'s flush_workqueue(xe->ttm.wq)
> so that bo->delayed_delete is queued only after the flush?
>
> xe_bo_dma_unmap_pinned() leaves bo->pinned_link on
> xe->pinned.early.kernel_bo_present, where xe_bo_pinned_fini() ->
> xe_bo_apply_to_pinned() grabs a temporary reference via xe_bo_get(bo) and
> drops xe->pinned.lock before calling xe_bo_put(bo):
>
> CPU0                              CPU1
> xe_bo_pinned_fini()
>    xe_bo_apply_to_pinned()
>      xe_bo_get(bo)
>      spin_unlock(&xe->pinned.lock)
>                                    xe_oa_release()
>                                      xe_oa_free_oa_buffer(stream)
>                                        xe_bo_unpin(bo)
>                                        xe_bo_put(bo) /* refcount > 0 */
>                                      flush_workqueue(xe->ttm.wq)
>      xe_bo_dma_unmap_pinned(bo)
>      xe_bo_put(bo)
>        /* queues bo->delayed_delete
>           after flush_workqueue() */
>                                      drm_dev_put(&xe->drm)
>                                        ggtt_fini_early()  <-- UAF in destroy
>
> The same can happen if memory reclaim (xe_shrinker_scan()) grabs a
> temporary reference on the BO between xe_bo_unpin() + xe_bo_unlock() and
> xe_bo_put() in xe_bo_unpin_map_no_vm().
>
-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

