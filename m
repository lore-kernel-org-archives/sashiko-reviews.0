Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016BE457E75
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255843; cv=fail; b=VlvZdW7p+bLXd/KoByTRULkW2xioJttTpyoXPbBFg1JEFLUDVxBdZOLi8Z3ohdDUaH+LflRXKWjt+tjF8xBOKaxHpQTQCh6HjMiskrAv4pqJD4JMmwRG66ArxcTlR5y51eiZw4VphUI4AjFxKw1YI4kCLXxr96XjecyLFs/g0Mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255843; c=relaxed/simple;
	bh=hWRb6k+BOTHQFUi4WcUxstb8ZDKiakBN6XBIyZrGJ/c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DqdqzC/U4cxxgVK/dMxa9g+R6oXQATVGnRBlCVqDzCrHGL6HYLJPw2grBeuqV0lSymrwlGKCAB/pDdgAsTK8LMH/xaCh3MG5bsJ9CTRuiW7GcMZA65C7WRzAayR94YVW6AKXgHzCR9CP4Bj5/5L6Yu7K/cDQVdhNfMVCzyBARW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUc7qBxa; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUc7qBxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790255841; x=1821791841;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hWRb6k+BOTHQFUi4WcUxstb8ZDKiakBN6XBIyZrGJ/c=;
  b=AUc7qBxaO+g0wSxWfubGPql3a9Oyljz+mBPDpZGaoy3RZMh2yRsv1Xww
   0+Flfu92zsCwKivGSJioLfF6WW6b+qE2KL28d37EL/5xpPVEQNVXQdgyJ
   lgzWxdAnqNEySrfpNChtb0jQDXIKLe4Og0busglT0oC6z022qknL+ajZm
   DJ8a1ZpE/ALGf8HnD7GhsO/xH5ny81AXnz38YHidQ2nD54riQEPLiDhRx
   uw8CRt4JxPi5nAN3NxOVnHcHrIYWMQX8G16owV6nqA6vW9jav7wudGnsm
   DEZZbYhuOCSN4B4dMEWRqDTcDNq6WI94vad2pIBerZyzvydJkyNAf7nv/
   g==;
X-CSE-ConnectionGUID: 1i133AK5R++eCVrJE5Ps2Q==
X-CSE-MsgGUID: chWohqPaQXSjNBJUPDMXtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93915700"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="93915700"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 06:17:21 -0700
X-CSE-ConnectionGUID: BmyW90JXSe65PJYASetjWw==
X-CSE-MsgGUID: QzqXbVJVTeqdRyUeLmPUNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="273518884"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 06:17:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 06:17:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 06:17:19 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 06:17:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRHVFtY1apLrZm23GyNlJ6ykBO9pblLjSe9cuzxJ9aMRUECdX2+4SYTpVSSVL5GSmBBAb++TSLjBeTu8M7gP4P4MKNWoyhg2R1HNZ0gh1hafwLqnD+E2BknuO08e/zEFsgWxLjjmOtMMQwh8jIDgFEFpw/DQtNuCujolip5Hcie+ZWdgwS7p2purrb7b6Va+C8HaYvz4L7D64nTGdfE33LZAyI5Oeu/9KMQpQrwFRkA2pabFz/HpXxFqzT7K7TjpSYLxG+1sIB4TtJ3+KBHxpYLyLeIK+MEulT5LuovscP1QD+5hKsqmzkAYW/QZLX4Q12LAfxjlK1JeNyWFx7Y8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8iM4Eohu+Bh5oats9PcVjE4tJGToJC9ylVSAlTZXf4=;
 b=A06mOa7amv2S/pfE71EBJ7PQD1ICgYSOq3qOnqhr66HcuAkJgOWKRAEsFnjmV7xvL2bUcUZBCzHovIWihev0Iw9LLL/yC1gThsFl/GgSByG77wJG99ijV3ac+AcIslSgEBf5jbVRV3YdlCN3rA0m3CWPFps6fGGpBpYEQnRq8MumU8soxCmooq4pWJ6axyR7WWVUay77pL3iSdsgrsdgjJt/Iq/4HjCI69KGHJx8ikomjhmNnMn3XxYMuZYf04xaXUxgtdeixhZdUxd6Tr5R75FxYXT6v2/WPWv6cwL80RBTjuTjpC7DBlebiOGaId79sQrbvuNlal3XOyVeU3ALww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DSWPR11MB9798.namprd11.prod.outlook.com (2603:10b6:8:3c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 13:17:05 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 13:17:05 +0000
Message-ID: <948f7d9b-458a-4f6d-961e-18c7ccc72061@intel.com>
Date: Thu, 24 Sep 2026 18:46:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] drm/xe/hwmon: Consolidate temperature sensor
 availability checks
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260924111156.2628915-1-karthik.poosa@intel.com>
 <20260924111156.2628915-8-karthik.poosa@intel.com>
 <20260924112434.E374A1F000FF@smtp.kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260924112434.E374A1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0150.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::7) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DSWPR11MB9798:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f525168-632b-47e9-4db1-08df1a3e20a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|18002099003|22082099003|4143699003|56012099006|11063799006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info: Gz8y2+/u4Hh361DZ4NdQERmRFNwYNlXBZx0s00uzt7GfWBCtAX/fKTCFS80UHsD/gRmTGhGvZh8kJ1okUgEmQa2C5HMCfa1JbEBvjgkT+lZHg47JJgLQNsED/f1RZ0/GuTSr+FaGN+4l+MuuXPU2Lk6nFYgKLlSg9nsUHWMuc1TzOPNC37FuFplo+chNp+m+wZy8LjMCD5YOPx5NIm7pqIzrMRtmMDv5kS2NuHfi1bxh00zbQBTdFVwOzIIx/ie6r8MFcBCIkZGdBeweZdY4jYjF+vC+w0FAiTcPQoNmnECf2NTJxKwd/temCeI9j2ZsCLkeE1d6u+njZvZIa0GyR35x66kACf2MPV4SmXPwlOaE02Bld33yEOyzErDU3hdWhGlhgw4QKHKy3FzwHMgRg0jjHFjjXFMp0LiXE96imJnJpW1Tq3RKQpGDYtqTWUzdBKXFBoqcUNbXw9CDDqskfGjWtlUx8hcQjMbb9j0AUq+ao9UvlN7xQSK/puPfm6vZCmPM8gjAFUXXHRijpaAeXKvjhdjNXAIJI8C2smoK+vhKwevrG4GonDdIGARcghupAwjkm9GAZfh45lqlLdO9kESFWB+mjtq4Xam36jxgXUbL9oP2vtb2zM1jlQobEBr754GdpzzVXLrx5JvbBOwZOLpJ7wBgSDZRee6z6X9DH2o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(5023799004)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVpnVjlYckhTbWhQQUR3elNJYjdOSEhadXVmcnBqby9TYVQyOVJ4ZS9FbEJH?=
 =?utf-8?B?ejhlUkFxeVJJYVVNdFJVY2pTY0JoLzcvRjZrM0pFdkYzSkszN3gyd2VyNEtB?=
 =?utf-8?B?V2xyTUlHQzdxaVpNekVwakRYeVhIMTZ1ajQ4aElwWUh5V2h4NVJEc09ZUEhI?=
 =?utf-8?B?WDZOVXhCNHJLREowbXZuYVEvdkVyK1ZIQ2JQNXdFMzFtRDZqckFEbUt6ZGVa?=
 =?utf-8?B?ZXhtRXUrcmJISjkyZUxWbjhibTNCUyt5Z1Nxcnphcm1EN1hETmhvdHVVZFFT?=
 =?utf-8?B?N3g4Q3UrZGhGWGJtZEVqZGNKanJPVWJhN3VhZUNoVU5aamlocGN3ZG8rWXRJ?=
 =?utf-8?B?dkpqay9TYVdjSmk4T0JzQjBNdXJWWjNsKzRzck1jelN3TjdGRk9FcE5RRE5m?=
 =?utf-8?B?THo1WVR2NGUyWktJWlMvTG9CUnI3T0hkSXQ5akdlVEo1RllvZmVZQW43SGxi?=
 =?utf-8?B?cXd1SzRpa2Z3eURrYndQQ2RQNzhoWU03bW9mZ241K251L1h2SUNCRXRiTkM4?=
 =?utf-8?B?aFJScUFxVGgzdklibitRVTA2UlJYM3VHSVVSbDRrckd0ekUwVXJpK2wwREVM?=
 =?utf-8?B?c1ZDWnVFU1NFSEVEeldoNFljZ254dzNTb0I2aTNKdzd6NzM2emNDZDhETzZX?=
 =?utf-8?B?c2gwaW1YWitEdXJvZWM4UXZkc3NabEFJZFpuTjNJM0drVG5uWlhrRmVxT0t4?=
 =?utf-8?B?Yzd5Vm8wTlorSmtxcWMxMnFjUFNTc1cxc0ZMOHpQSmIyMTFkNVFCdU9ZZGxt?=
 =?utf-8?B?NWl5WlhkOVhNbWk2NjA4ZnNySUc5MHdEWjkwU2tCVDU1Q0lIcmx6QTlGb1FD?=
 =?utf-8?B?QW9ERXhlSXc3K0xWN1ljcFZBMW9CYXV1K0xZRk5QS2JSSW9WWllQQ0NzU2RN?=
 =?utf-8?B?bFFwZlhHVDZkZllyaEFIQ3U1ZCs2WmUya09LR0VIRzRhRllVV0g0SkhNdXhR?=
 =?utf-8?B?bm12aHJNekVETjdzcTBjNFE1MHVhNlJZcnBtMmJhRjd5YnQ3NzVYcjYzTEdk?=
 =?utf-8?B?bkRhSkFWWlFxZ1lTTlBVYVJ5THdUYlg0Nk1LSVNxOFhoWWJ1QmY2SlB2WU9I?=
 =?utf-8?B?S25KT1ZDalpMOWkxbENYM0RObjg3WXZQREFvS0xna2NiTUw5RWhJdytDQXhj?=
 =?utf-8?B?NGtaV1NQdkNKbzRiUzRrRElteUo4NVFyc1pCaENiNlV2Zm9GTCtIVnN4WDlN?=
 =?utf-8?B?ZEttajNzSGVhQ0ZvcWwxZ2kycnZwZlcxbG83cStUZkdiMEhmUXBMT1UraGxN?=
 =?utf-8?B?eXhka3hPRkdQQWpiYm9MQ3lON2NkenVVN2hKS29yWTBldzU2WDVXL2IrMVdD?=
 =?utf-8?B?YWpXNWdPc3NKQWFBOTA0ZEEwakpnVWpuUzZMMTVYTEFpSjNtaXY5Z2JGdDV6?=
 =?utf-8?B?V21hN2lqV3AyeE1XTEVvRmt0YmxWY3JhOWpSNkF4dW1uZU81NHpjUXdLN0Nz?=
 =?utf-8?B?YXNEYlVod3hkeDlMeWU4TVFmOTRMdWRTaHFPdndtUEtkVWJXQTBsVG82NlNj?=
 =?utf-8?B?bGszNTJUbiswZ0pKT1Q1NzFGN1ZHUURhOVc0VlFubWNxckpMcWUvRVBLMjJv?=
 =?utf-8?B?bjNtd0g4N0pEN1J3aG5iakoyZlp6bVgrcEpRMlcrc2daTGErZm9QRFc0TkUv?=
 =?utf-8?B?TEJvekNaUnVQb05XN1hGdW1RTlJYVGVQdVZNY2ZvbkFaQjduanZ3a1VpS3lP?=
 =?utf-8?B?bkw3NjhVc3dxdGNYRVBMVVhqa1JWaTgwUk5HL2d1OU5SbmVqT21kM1FSZHpT?=
 =?utf-8?B?Vm55N05BWXdjRkQ5elcwMXJjMkk0RmdoY0swWThNMXJpTloySGJPNkJwSUdj?=
 =?utf-8?B?cVNXeVJsUWIxQ1p4ejhaNC9zd1dqRWdORjFkS1NZSEhRRVVJUGx2eVQ3WVRX?=
 =?utf-8?B?cjNqUnI3Z2l3UktsN1ZJa1ZqZC8rVGZvZTlndy9qS3JzUXIvSzNGQm85V0Ni?=
 =?utf-8?B?dUt3bjAzekdNcnEvUGhLYWZhYUlla28xWWdXRVpscXViNGNCT2tFV1NvclZG?=
 =?utf-8?B?eFBqZ09FZERLaVZYT1RvOFZUdXdLa282cXlIVlVOcGVVZnFaMUtsdEIzVU1F?=
 =?utf-8?B?STdtbEx6WmdnQjZHdnhvNmlpM0RYNW5vbnIyajAzY2I3NllZM1Uxa1FQMk83?=
 =?utf-8?B?RXhMWlFoRlZqOTVuS2lyMDMydjVtNFlOd2UxUDhhZGpLc1BtT3I4Uk04NHNZ?=
 =?utf-8?B?d0MzaDlVL3Y0a2NLNUVBbWpPckNhQmQ2SGJINkZYMzVTMFJhb08xb1pIUHVl?=
 =?utf-8?B?Z0luZE5pVGRWRXFTUW1EejdLWE5lT21iWlNBMEJmNkVEdy9iQmdZYnV0L1Ar?=
 =?utf-8?B?WTlXVWpjRnRsL0VDaTZJdHhxNkFneDl2RDhsaTJtTk5KVng2MWh5Zz09?=
X-Exchange-RoutingPolicyChecked: ff56i7WBeI0ON4r290pWs28OUv4dqXVE3FUNdrh6sbXzA78fw3c8ygGeBDvk6amTx5pIKEkOOTXxF3aNQkipqEB5hejg6Bv0DZ7t2ENfO91TBl4csfgkZvsCu7Kv0rGgjWhp5KAQcBBF+R45l8jyNJ4bTRVs6zpViBNpR1yI+kkheDfOAGQKO5316WidBDXRpMQ1SujE6HIuDJy7fu07Yy6jiRSTDgN7dIRbi7S6A5e01YpNjBzTRScww8jCS4ivX5MW/aDzlcmxXhfZk5RflGtuXW+tMcThO7sIHSecVS3/QcyRSLHjcYjhf/zdFJD9ThJlnyVNa0CCmshXSfA5kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f525168-632b-47e9-4db1-08df1a3e20a3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 13:17:05.1421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HA3He7Sjs4yAop/kvu+tGe0xNaAk93wuhduDR50UxUJiFkSVw1NLz/bxnDD0/W7U1dyjt1SU+4buTlsSn4i9JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9798
X-OriginatorOrg: intel.com


On 24-09-2026 16:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] hwmon: initialization race causes permanent attribute loss on slow sensors
> --
>
> commit c02db655e6dabb60e61a8acbe0daf64a353e248d
> Author: Karthik Poosa <karthik.poosa@intel.com>
> Subject: drm/xe/hwmon: Consolidate temperature sensor availability checks
>
> This commit replaces is_vram_ch_available() with a generalized
> is_temp_available() to validate multiple sensor types. It uses this new
> helper during hwmon registration to prevent exposing sysfs attributes for
> sensors that are not present.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 7bb7a5f402d1e..d62f95a1912f3 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> -static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>> +static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>>   {
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>> -	int vram_id = channel - CHANNEL_VRAM_N;
>> -	struct xe_reg vram_reg;
>> +	struct xe_reg reg;
>> +	u32 reg_val;
>>   
>> -	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>> -	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
>> -		return false;
>> +	switch (channel) {
>> +	case CHANNEL_PKG:
>> +	case CHANNEL_VRAM:
>> +	case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> +		reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>> +		if (!xe_reg_is_valid(reg))
>> +			return false;
>> +
>> +		reg_val = xe_mmio_read32(mmio, reg);
>> +		if (!mmio_temp_valid(hwmon, reg_val)) {
>> +			drm_dbg(&hwmon->xe->drm,
>> +				"channel %d temperature unavailable, val 0x%x\n", channel, reg_val);
>> +			return false;
>> +		}
> [Severity: Medium]
> Could this cause functional sensors to be permanently hidden if the firmware
> is slow to initialize them?
>
> During hwmon registration, is_temp_available() performs a live MMIO read to
> determine attribute visibility. If the firmware hasn't populated a valid
> temperature yet at the exact moment of device probe (for instance, returning
> 0 or U32_MAX), mmio_temp_valid() will return false.
>
> Since this determines sysfs attribute visibility, doesn't this create a
> silent failure where perfectly functional PKG sensors disappear intermittently
> depending on boot timing?

xe_pcode_probe_early() wait for pcode ready before hwmon registration.

These sensors and pcode are expected to be ready by then.

>
>> +
>> +		if (channel >= CHANNEL_VRAM_N)
>> +			sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
>> +				"vram_ch_%d", channel - CHANNEL_VRAM_N);
>>   
>> -	/* Create label only for available vram channel */
>> -	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>> -	return true;
>> +		return true;
>> +	case CHANNEL_MCTRL:
>> +		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
>> +	case CHANNEL_PCIE:
>> +		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
> [Severity: Medium]
> Similarly, does this live PCODE mailbox polling risk permanently hiding the
> Memory Controller and PCIe temperature sensors?
>
> If PCODE is slow to respond during device probe, get_mc_temp() and
> get_pcie_temp() might fail or return invalid data. Because this check
> replaces static capability checks (such as hwmon->temp.count) with live
> sensor data, it seems to introduce a race condition where a temporary
> initialization delay results in permanent attribute loss.
same as above.
>
>> +	default:
>> +		return false;
>> +	}
>>   }
