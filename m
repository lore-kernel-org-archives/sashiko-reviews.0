Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955A54A68B2
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 18:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916761; cv=fail; b=aLbI3k8qacJhXVGXIgQNggZoaUCfV8ZceZ3E1BbMtqi0xOy/Lc6QafFU1dsp24F7udUwWyKnxmn1qtWPlHFDTPqoqqC6eF9H+7happ/+nk3gKbHjBFeOq4mHLBjDr/JKROFhFGOPma8vtdgAFxseTcdF9ZQTcHT7spF23oCQXXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916761; c=relaxed/simple;
	bh=EVK/0O7B5zHVXXRk1XPOpwb+RaO4xtzQVDlmySUZlNk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JlSUQZMAg1AzmRkyu7XNUH71yqGQH5/BgASnaaQpyHWIYrE2znY/p4h5DlZCCvcupC0hl5yxyS+WYje3Y17pSMYuUlzKGYgJl0Dgb1ebQ3f8TSpaVqUgpcNRJFpfRe3O+CedNTvHDiaXM9fMqtw2j06Z6HppeSXJ+F206DnuKlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CScoI5Ks; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CScoI5Ks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791916759; x=1823452759;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=EVK/0O7B5zHVXXRk1XPOpwb+RaO4xtzQVDlmySUZlNk=;
  b=CScoI5KsAFPnGQyCrevSNTpWWOC+Wq4Dnipt06qpgtYGfxyupAYP60T1
   uytvmFaubMlfmwerFunJSXfED7mcZ1j5PI4Dx4L51Y8Idaka5H0cKwuQ6
   YYpHYyytcEWSU40YqLrWJ47uu8FTmcVHxGqEvqIihvxCADWoxt496GsVd
   Czk8X5NG5XWICy5OM/IKCRay3XC1Sixrrnqcddcion5j9AvPIkEY+mvNg
   4A0iFZnAlikCAUqD3uu7z+Mk0oOp+uxjX00dKyxNBgXMDNSEKFCFSKpAb
   CgPVbJ6OcQdVRixAi4tmJJ5C6xvds0vkynqQZjn23XMxbaLUv8jdlWlJJ
   g==;
X-CSE-ConnectionGUID: EPHfoxSQSUmtYiv8khGgjg==
X-CSE-MsgGUID: gL/wvms0RNSdJP9YDMgbEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544372"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544372"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 11:39:19 -0700
X-CSE-ConnectionGUID: 5+IcSZfjS1atgfRoZCDJZw==
X-CSE-MsgGUID: n/D0O8VqRf2MYKsnYQYb6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1593118"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 11:39:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:39:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 11:39:18 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:39:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyVFykIzGG1TQqn7hmrfq3Ui5z69c2LGEH05vc0HjlY9DY+IgQ8t96iFCJPnx3oa30QrqlaAVTbSFn79bnsICZonxqHam+bcFLV4IpDL2TZQYF3k4gCJUxCNph5PDZCZ+BGwao8IKh5KdfgnUXnJIrCEyUGPmYRUHLjuNrS9P0/+g5GFSWsXouNFPhDoxnaKqjdTsvirWW/zhuG2DaHDYkRQiziwE1MDWWU+fdG6aOQbwXWcVVvxs27/K/fQO0qoAM0dzQpuW3RiqYJ6bJNeGcmvS3dlDdA+1T9Ff9Sr/126w95JU/lXyhYwIMnR+UGyHR2L6fz3qrTkde74dNWemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQ0+km6m5HqseUxvV/ya1h+XNW06oDE/teMJhxX3wDI=;
 b=JoijYllp/BZnyeeaVegzSu13ZN0eaYoYGlPGCCyCbelgpbxzYo7oFFJYAvli8fighfcu7Jy7rEzYrDoiSG0x+ZpFhXgoDpfmoBVjD8h/72m1qph04hitpIt00Hd8o1Ybiv40TAW3BkdkhSyjGkUugmeyA7BGpM2burjqaGRYPLdMvbWXzfSWxptzU5JPJ0US1xK9rFyZu8K8cLP/mXpb4tm0JULTSLqrTz+R4wbN39I2BV9RWJzdBhSpSMad9RrTkZl7O34PL35T5vZkxWAb08fGCu2TcAImWBr3MLvVIg8rW2rkP/poIxdN5ZL/HtQU21prfS8LNclHdxhLaYVVQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by PH7PR11MB7596.namprd11.prod.outlook.com
 (2603:10b6:510:27e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Tue, 13 Oct
 2026 18:39:15 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 18:39:15 +0000
Message-ID: <c6aabaa8-0ceb-45da-9010-84660cf1cecd@intel.com>
Date: Wed, 14 Oct 2026 00:09:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/16] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261013020636.447620-1-karthik.poosa@intel.com>
 <20261013020636.447620-2-karthik.poosa@intel.com>
 <sashiko-outbox-168868@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-168868@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0347.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::19) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|PH7PR11MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: da2bc8e2-871f-40dd-d054-08df2959484f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|4143699003|56012099006|261009223027099003|10067099003|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 53ISIZT9w+o7OlWkN6gYA6K/FL4wSUyUJHFOHtJPGaZfg6RHBZ4McvLGZBoMqpLtZrhy//+1J06sYN7bZak9l+Z/hBVjzCAnHeEQ+W/LzVJJKjoaWzIWSAYt626ONE7TYZlqC6FtgdxAo6pQmipOIhatBgNOfHGNfw98jLMO0iB4C0m4c7iamoS1Zhla4gflNPsMHDC2YDoNXSxt+zfnKR9Ej7O9rKcvsSoBcG00/xlYcZx4TGuXKpn/RkdDHzJsC5AMXAH/kn8/If6ky30ljmb85gEwfrn1ecXMDpenxxvGtZFm3RWKDkvR1NJ/a+fT4/54Ic3ogd2cA7108xe/PDSEx+Y3Je8N7QmuLl0Jdta3l0W4m8kHiJQ4HdCIE63KiK5maUDu3KhBAZBmrZWliEoBOKg3gmFKO7ZvS90y47amvlIUdgzoukunlDUIWXY2UGEzzfQl49iP6dRPtbv2LwqBDqsk92hcCuQON+Xt6C/XwBAPy7EWvq9pP3VFLWQFsyT+4Hjkt2DCdzPRd6bI/u+pqamRzo8lb3rSQDeZKP0qcE+8U7MOsxdbc8M27Rjkka8IoHGKWdoUG2OtEVjKRMiaD1+XrQuaNllFpwX4y4IEmoqfBtfmyXuqhgVxkdOypGu8Ma0Nd+9RlWILbAmGK84BOxQMmlHY9/IR+qfvVIY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB852307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(4143699003)(56012099006)(261009223027099003)(10067099003)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXFjdi9EMU1Xci9LYWFLQ1NLcnNNcjRrWDFYcG9lbG52cEN3RWFGYmpzWHc4?=
 =?utf-8?B?aWZabjcvSDg0bW03SEptUDZKZGU0R1M5eGpqSHNkcTJiUFB2b09FQXBiU2Rz?=
 =?utf-8?B?d29la1JsVUJ1RUwyeEhwMEtvVDhmQzEzK1VJT2NobXdTdjA3dFZWakZkWTRO?=
 =?utf-8?B?SEV1QmNITWluWW1velFwbGJ6WjFodGdhWDl1SFdTbHNaRWpUTGZ0L0VTMUxW?=
 =?utf-8?B?WEY4c2pBL0VDUVpnZXNIWHBtanBPazN6QjM1ZjNlTmo1aThRTjZzMnQ3NlRw?=
 =?utf-8?B?VWpkdUZPaGlxZ2E3eGllUFhwN215VjVNKy9teTZRRkswTUdGUnJ2QW1BcFdW?=
 =?utf-8?B?L21ZRS9ybmhxKzFSb2RkSEdxM1VCUGpxSnI3c00rUmRHYWZ3MTh5dS85blZm?=
 =?utf-8?B?ODg2TnJGQnZIQnlqVGxtRXJiVnBCUExQN28xbHNTSjQ4aTVMOWdwckVremRY?=
 =?utf-8?B?cC92TFFmS2paOERJYlVBa0x5d1d2NjY2S1dvZXV6U3haaHJOdzRhYzF6NUNP?=
 =?utf-8?B?WnplOXZ5eUpWVjJWZE03TVc2NUhjT0dXZHd6ZGVjZVZTNzQxQnFvaHBOYzFU?=
 =?utf-8?B?RjRraXFXbFNUS0xpSnREcS9XRi96NDRCd2g0aS9xNCswbmVZT0ZFMmdIRHhk?=
 =?utf-8?B?a3ErWlA3OHk1dE9OMHZTRVFuU2dtMy85ejBWYzdIZzhXRUNKZC9seUd2bUNt?=
 =?utf-8?B?QUdSTnhPdEFIajZNdmFYeTd3dGsrK0Q3VlhManZwdnlTSHFPM056ZlV6cEhF?=
 =?utf-8?B?cVhqUEFGSlRRa0p5MWtCdGZzRjRnRzZLY2t5dUtmZlhyV1JaTStITzRwdUpq?=
 =?utf-8?B?elpmY3RiUGlLeUp5ZUxjSGgyTjRjaXB1K1JVdzdiRnFVM1QvdnV3VStoelcr?=
 =?utf-8?B?a0Z0ZTI5SVd2dWFpOHlzcUdMZ0ZOYWc3TDIweitUYVErY05WYjZ4TFVJWUsv?=
 =?utf-8?B?WXhMNzd1bXhJYjBreHp2T1NLZDhMN05BaUZmcmNUUnZOOXNzcnRZUHpOdUVo?=
 =?utf-8?B?V09HSmRNbXRrSnh4b3l2S1hsR0JndmFyYmdXQW0wZ09MeWd2L2tGeXVobDRk?=
 =?utf-8?B?S1ZIcnZBOXBBNDEvUW9FTWlZVEViRm1DeHdUQ1o2aUdVZG5MUFR3ZUtiZlIy?=
 =?utf-8?B?WHIzcmVlMHFBd3NXWVZPWVg5L0FXOGYrbGNiRll5V0xoRW9zRC8rQmxYNXVs?=
 =?utf-8?B?ZEwrU2cwRHRDaktQRDBDaWVrUno2QktybnNVRnNTRFZqeW92VHl6VlVicmtY?=
 =?utf-8?B?eWJ1d3dOUHQzQmo1Nkk2UW4wMkpRS3Iva1Blam8xaFR4SVV2dWd0VHhFVlVt?=
 =?utf-8?B?WitPSFRZTHlPaVVZeUpFdnpTeU1HaU9EUEFEekhMQmVZeElmZVJySXVEb3cw?=
 =?utf-8?B?UEs3UnNsditrL2tudEVXeitaWXl6dFBkWGFtQ2FrR3A1ZUZ2bjdxeG5LRUZn?=
 =?utf-8?B?VEdwMUtOSjVwalZ5OUI3NlA1OWFYaFJXWVBGbU54K3d3UldtSkI5SWZBR0p6?=
 =?utf-8?B?VUF2RDh1cGlPNmx3MlBNcEMwZWxGdGlrK0ZVT0VOUjFoY2w5SFhQQTFEV2Jw?=
 =?utf-8?B?djZiT05oZVY4Tm4rWjVQQXVDQ0t0UWE5UTNzRmVGRkNaaVZtdFlWQVdBWXpX?=
 =?utf-8?B?S2MxS0ZNa1I4ZytaLzZYdEswb2VGS0NWcHZvVi9DTG16b0szdnZmNXNNTWs1?=
 =?utf-8?B?K3JlcnRyKzN4TncwbGhrKzhHTG40Z3gxYWN1TXd3NkF6SE5YZTlqNVFqSzEw?=
 =?utf-8?B?MXJUMkdwaFc4KzVmV3JvUmRYa1BNRjl3aEtBWVFobkxUVWdnY29KeHhhOUwz?=
 =?utf-8?B?VVFYeWI2QWRSaDcxUEMwNnlBVFRuVHpzM29OL1J5aVg0SE9qYnd0UlQvdXZl?=
 =?utf-8?B?b3owL2pZL0d4UVlWYmpPWFpEVkJ2QW1XOVFua2hKN1VjVWFmTUcxV05OdjhQ?=
 =?utf-8?B?RWtVbGtsNlJUbXVIeTNtNWtoK3luUWc3ajFUSGR6eGF0ME5mWXQydUMyWFVt?=
 =?utf-8?B?eW1BZ0IxbjNFb0RlZkxFcGdVeC9Kd0NtcW9rc1owNGpHOW9iM3Faem5tQ2po?=
 =?utf-8?B?WVlIUEZxU2ZtdTh4Q09UdHRtU2ZQMnVsUFJjTk96UWNyeG9jSysySzBrN1lG?=
 =?utf-8?B?UG9RZW10cTBHL3B0WC93eVBQUmIyTjhqL0JQQkM0YlA4RnZ1azd3b1ZyRVJZ?=
 =?utf-8?B?SXNlbmJQbkRDSXVQbFY4U29uRXJHaW5odzlIMmRTZ1hxWm1YVHY0ZDFJaTNR?=
 =?utf-8?B?T0hjLytnL1dQd0xhZDBZeXdHRHhHTG92dldqdmZmYnVXcU1PR1hwY2xMNk9H?=
 =?utf-8?B?Y2JqSFh6OUdrS01OWk5SVFV1TElOcHVHN1R4cXhTRjBZN25UZ3pHUT09?=
X-Exchange-RoutingPolicyChecked: ekzy5rTGJDfvPjglF+l8SUu02da61D1Urgh7irRCVaB7TqUgdPkh6+lFelI3ZH6Bwi6O3i1NBd/WsryUgaANDv9fA9+bbQrGbH2t8ab66VbLthcg47vii+wIGdreFCMtFSG8mkYwD4rzunExmx3YsixZEuimWKDrxjtbOt6ZtMvqSHJoR5kwllQUdAJv4mtRusgi91REAYRZfjpYnthLBHZXlHMha2QnfzEoO4FDDGZX16LanE6q/gUCSHLKzmh7Cc9+sqy9Hp8JBAgSfzeGwWS1IzGz1s5KgHdq4z+WTePfhHqe5HWbooTVvybknQHt8zsx+pQu1SFXd1Qnb/SdMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: da2bc8e2-871f-40dd-d054-08df2959484f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:39:15.5125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4tkCXFhjRaAvOc+Z+1lpNiYvFu4gOxyNUPvr7meFWdnwOkNGPUXrsztfmY+IrGiuhm830UR5OgrefGewOHUvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
X-OriginatorOrg: intel.com


On 13-10-2026 07:53, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/xe/hwmon: missing error checks for pcode writes during preregistration
> --
>
> commit 79685dc42e50f60af65d94b261b8f9a9cccf79d0
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
>      drm/xe/hwmon: Handle pcode read failures of xe_hwmon_pcode_rmw_power_limit
>      
>      Return early when the pcode read operation fails in
>      xe_hwmon_pcode_rmw_power_limit() and check the returned error in
>      callers to avoid updating power limit settings with invalid data.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 5edeac961ec33..9884e06f83e59 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>> @@ -394,7 +396,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>>   		if (hwmon->xe->info.has_mbx_power_limits) {
>>   			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>>   				PWR_ATTR_TO_STR(attr), channel);
>> -			xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
>> +			ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
>> +			if (ret)
>> +				goto unlock;
>>   			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>>   		} else {
> [Severity: Medium]
> This problem wasn't introduced by this patch, but since the commit message
> mentions checking the returned error in callers of
> xe_hwmon_pcode_rmw_power_limit() to avoid invalid data, does this patch miss
> the callers in xe_hwmon_get_preregistration_info()?
>
> If any of these writes fail (e.g. due to a pcode timeout), the driver still
> sets hwmon->boot_power_limit_read = true. This forces all subsequent power
> limit queries to use READ_PL_FROM_PCODE or READ_PL_ACCEPTED parameters instead
> of READ_PL_FROM_FW:
>
> drivers/gpu/drm/xe/xe_hwmon.c:xe_hwmon_get_preregistration_info() {
>      ...
> 		} else {
> 			drm_info(&hwmon->xe->drm, "Using mailbox commands for power limits\n");
> 			/* Write default limits to read from pcode from now on. */
> 			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> 						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> 						       hwmon->pl1_on_boot[CHANNEL_CARD]);
> 			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> 						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> 						       hwmon->pl1_on_boot[CHANNEL_PKG]);
> 			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> 						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> 						       hwmon->pl2_on_boot[CHANNEL_CARD]);
> 			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> 						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> 						       hwmon->pl2_on_boot[CHANNEL_PKG]);
> 			hwmon->scl_shift_power = PWR_UNIT;
> 			hwmon->scl_shift_energy = ENERGY_UNIT;
> 			hwmon->scl_shift_time = TIME_UNIT;
> 			hwmon->boot_power_limit_read = true;
>      ...
> }
>
> Because the defaults were never successfully committed to the pcode mailbox,
> can these queries return stale, uninitialized, or invalid limit values,
> causing userspace to see incorrect hardware monitoring data or misconfigure
> power limits?
We can check these return and report a warning.
>
