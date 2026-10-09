Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2C74562BC
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 12:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548884; cv=fail; b=VaCBbbCSUCTS9dGo76BZUF2A7J+h63lWavqqTXB1dbdAbosaeVw9UOZyPWCUnxx4PKkD1GaN2b0Z/sxKJ1Y1iGg2hlVm7jUKBVjb40dZLi+MdpKsU2efA0JzGqymkDEzKKHexxTTncqITzj0dgyJAfPQof3I7ohJTqYpmM6ahFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548884; c=relaxed/simple;
	bh=82/j3iDxal5/kpTNzTbIuo1O/rbbhQupQB7iTqlkYkg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ii4yNQMPOhm5DTojadDSvZglAlzPzB1vHO54QZXX8riQkc7944rF1KuB2Dn8v+Wk1JkaBzpwe8n2ez3hRXtRhvvfyvNxA0u+jgmO9PRHAbZvquwFQaalzrUX0T5OvE0yDIHKzfv7Dnugm/+ya9C0xM5feXfUVXa4vfCCe+7XxwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btRsKkCW; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btRsKkCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791548873; x=1823084873;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=82/j3iDxal5/kpTNzTbIuo1O/rbbhQupQB7iTqlkYkg=;
  b=btRsKkCWNKlknUAclNWf7ZnXacq5HbxXR6UQZLXULKyu6Ngv5yEFy9ZQ
   JsYUj7h4Zq8HwJ/umSiczXzVQYq51gLLfKuac2N8enhuIYQjljxY4xS6F
   VUI9KYU/Uk32d3RptGpId+vWY/1fZCXPfje5yZsGqH2XGxVe0gL+Naolb
   YcH5MqjEuh+bkrpVbhDDXmMACY36KooliK/Xj64oGjjVZ4a7cgtY8khyC
   m77Z8Rvs7SNaMbE2uCp0cibJyMTGHJkIhWo4oO3t2fMyjh/HCSQEice/p
   DdEFps/ZEYX7kKGVo53vWu3PTQmGK+zZRLhC6jOpSkfwrYbeSJdTMIV1o
   w==;
X-CSE-ConnectionGUID: OnNMdpp+TKmaWWx2dIwhig==
X-CSE-MsgGUID: l0UEzBAtSc+96PZHpX+EvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="353365"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="353365"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:27:52 -0700
X-CSE-ConnectionGUID: SN4pt0J9Sy6IWnQodHUF+A==
X-CSE-MsgGUID: EkObl4J1Qgy+dHotDjVbUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="619284"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:27:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 05:27:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 05:27:51 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 05:27:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuqe85k1B+oaT/Jo8PtU4ttGWpH08XVxe5bCdgabxs6oSdI/F+M5S7DuabqChG8NIJGu7znFQBWsXWSGMkyjwgYRwYDtGpC4lh8D4EEtpjNWOumRnA8pBZWUoEmp/vmPARix+rIi47qo9aER3/9QnA32gj4UMHWd3GJnCWIvwOmGk+l4G3oqqUROVbuGNAxbjVyJpjd8hlONELsrBapg9In5zkKBz2AZF3XpIhLsct3NPuOpZuv7KlnbiXOiRQoVVBLqo+as91TNvdWjZqtxl9UQ1cwQZGcnLZUxEGnSP6jo+r8n7fwJUv4NQ/HTM84bRh33CiN4GVgt6lFE/WGZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nra+E/RiZkq1K27OgVufNp3YPomKdDTsMEmNfNeol3k=;
 b=sunNg5T1iGGaMDC7PSKwv4FaAPdbqIbePR6/UooYeQK+mEBDgFnpbBL7AOMCrnp4ZZI870bp1us7BV3OOJRuKbDRBd7zZxJg/pLIT5RSbE5/8s7xm3cp9vI/aTI86U0ZMNDF4eTDFB+yhaGlTUB364Dw7XoeTKtRRnHJLNu+SUbcFlGH2HTWn9h89wCfFlKW8wF0rEfOB6wpbnqV05uk2+gssBZIDc8i6Vv6jY/VSY4sYSRzhuCgbK1WZrdKPzQ/0NqctCcOFk7Q46ZLetnbkmqiv4l/zNUix0o4aoQ7raCkCNgPyOV+adKa5VyUYPHP/zPWwxm6jpKEjeAFvPya2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS0PR11MB8232.namprd11.prod.outlook.com (2603:10b6:8:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 9 Oct
 2026 12:27:48 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 12:27:48 +0000
Message-ID: <1cce4e92-2fc6-4eef-9439-a64a1c6a5d90@intel.com>
Date: Fri, 9 Oct 2026 17:57:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] drm/xe/cper: Retrieve the error counter record
 for CPER reporting
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-16-badal.nilawar@intel.com>
 <sashiko-outbox-165261@kernel.org>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <sashiko-outbox-165261@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::16) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS0PR11MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c883354-6e85-4ad8-f611-08df2600bad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|10067099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: aLugbKkfEmIOTa34HXBvd6uWf15oh3/IvA5IMfV9RU3ALlhsBt51A8BctmLYWsb97C9/Xf6qJBLAhmgClumUsl4jZ06Ry0Myi91SOpv3ZETvAd8RtwYnsO5SEK1ZBQxs8jDoK4xUoKjq6nVU9rAdwGmb8d3OX/al+B8WIah6/jh/HuP4p06d3b7oaMSrn3IcQm+F+oGkIVTB+2JZWUNui1h+443NWiZ2M6MaD0f5O7M08E0B2HdLjtQaez7nT0L+zzIoUnK38vnhWf4zjBsJIYChwbF9aoTYUrUeK5Qc2030CTCZ8Dx4HLfTMG68cxAtlD7lJyIYkG3T4YEoCJoC4+Xyz9DLE3xxW8GI04QG3u8YUTTsF1JRZNYDEiOtldI/XQKnjTrelUKK6kKp/f7hZnqbcy4tBkVSfP/28/z0GzE6JH2tEjHZ1UdWvXSQStQWqK8MZD9g7brSF4OLJz2yHa5zTanM+fo4+0PEiCLuz4Zp6E6cNJWwUpQU3UPP94eEHqCVg1AUQezKkP3B115Jy8uDqjpKHN5Oz9DjuAfMzcED41F5PoSpjHMCgSLgqBQXO5NwktF5+mO/L5rowEJ9n54GOI24qQyUFnOmj0v6jj6rUC2zYX32EmtmjLHJAoRx/uMwrKRsXySfvkzfMb8Dgn+NVEruRSwYyTQmphKJX0U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR11MB9792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(10067099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1gvbGh5OFFidWtMVDRWMElBVVdZd21kMHdtbW5KMGgwZFkzVE5WdytKTktM?=
 =?utf-8?B?Q2toWnhiTEhoOEFNN0lMR2U3Z2Q4bEIyYUk4TWJLNHdMdUgrYlc2U2h5K29k?=
 =?utf-8?B?eEtDNk12M2ZLZDgyZy9tZ2RBOCtNdFVJQ0JSMU1ZaGZwR2dFOUZCT0dUemNl?=
 =?utf-8?B?UHNxdGpDS0ovVzMrL2NYaUFISWdRbTZMdXpNWGNiZkNGR1ZQa2ozNXQzdVA4?=
 =?utf-8?B?dWZnNGtjTjhTTmVCMFcrNzZBeTl1NWFtTG9ZWDJ5Q0VLV2YrUVJyb2xkZ0wx?=
 =?utf-8?B?ZGJVRlBySkZJKy91b1pFWUN6aWxqWis3RmpvVkprR0RadkNKUHpJWmxXcWhG?=
 =?utf-8?B?SkpWS0dSVXgvZ2ltWldJMjhibm1GckxiaXZYMlVFTFVVc1h4aGdEN3I5U0E0?=
 =?utf-8?B?Zmtkd1BMMSsweTNkOHFEOEwrcjRyamplN0wyeUhaanJobDBGamJwUUd4NzFF?=
 =?utf-8?B?SHFHUlBnenJ1Y01TaytSZWNILzRBUFF3ZDZYRm9hTGIrSzcvMjJxaFlIMCti?=
 =?utf-8?B?VVR1eDRzWVhId1k4aTE1c3BRMWM3U3VZdGVCQndNa011WVBvTlBpc3BMOUUr?=
 =?utf-8?B?MUtzZmtGNzEreFdoVTJCZDhZRUFsR1RxM2Mwb2R6VEREOUI2V1hDcHV3d3hx?=
 =?utf-8?B?TXR1aVVsbGJ4TXJFdXlxN1h1MVRLUGQ1Q1NoOGZ4T0Z5QzJsOUlRaDZwcy92?=
 =?utf-8?B?RnZEdGJPL0E4eVZNSlU1eFVRc0FrL0x3S1JkakExR3BGc2h2bWo1R0tuejZR?=
 =?utf-8?B?aVl0aXQrRnE2cEk5SjlTeG8velNXa0I1RHNOUVdvMmkwalgyVDBvRytaV1A5?=
 =?utf-8?B?Wk5maFhBbmdrSmcrMDI2YmRxZE5SZE9INjdDYUlOM2xDaVlua293dktUUVZN?=
 =?utf-8?B?WEFqUGpDZlNTVzhha1MzR3Q2VklpYXBQdUtGMXJUTGRtQmR3enlxbjRTaHYv?=
 =?utf-8?B?TGM4TkdoZHFxYXZ2Q2pYMTcvNmNrYTQ3eXRRSFhCbzhqRkVLREZsUVcxZXdK?=
 =?utf-8?B?bW10MFB6eE0wa2pLWldiOEpHNWlYeFJqOU8rTDJBd0syMzFxcEhmUXpHRi9z?=
 =?utf-8?B?a3p3ZGF2U1FoUllWOTFVOXR0UzVGYnpTakdnVUYyTWs2OHRMVVdsMTNSSkcr?=
 =?utf-8?B?b2ljSjdRWGJTenFQWGdqa0h4R2FzeklHYnRFZ3dTRHhqWWhRaFBxU3VRbzQw?=
 =?utf-8?B?bTliaWdHeG9la0daN2x3RjhuUlZyRXIvYnJTNmN0eWFOOEVDR0RiWmwwYk5R?=
 =?utf-8?B?ODJMNzUxcm9zRUM4QnF3K2FxaW1BQXJ2WGsvaldpZWRERGtIbk5mUjZxZlJo?=
 =?utf-8?B?M0g3Rk5qaGV3ajllM0JzR1lUenFtZ2l1Qnh1UllRZnRGdXc5WjBJZXUzNUR0?=
 =?utf-8?B?NnZTaktBd2MralRzRG5ERkZjUFBaTGdaeEFzcGpDN2lqdnRUbjNIdXFXcXNP?=
 =?utf-8?B?akgwZ0JOb1Q5Y3dwYU1hNmtGQUhEQUp5WXVQazlaRW5ZZnJHYUxUVU0yYjF6?=
 =?utf-8?B?RDlOVER2ckk1cmtGYWtXQ2ErenVDMm91ZXViVk52THZHMnBSbjBGUGNRTGFB?=
 =?utf-8?B?aHNMSU9IcEs3ZmhWRksrZU1GYW9mTnIzVXNiMWZ0VUE0d3JhU1BCSk43anhC?=
 =?utf-8?B?OFI4b01LbERxZlE2TFhmOU1MSTJ0d0oyNlZDV2xEczZjUFB1NkV6aEZnL2hq?=
 =?utf-8?B?M1hEWlhjMUZGUjdZcmFiUllHSjcxV0kxR2NHd28rSGxpYkNTRzcyUkxjYVM5?=
 =?utf-8?B?dFQxWjNDVXU5OHd5b215eW0vRzUvMjhSb2E5dUQ0VUIyWUVUZVNjTXlFSndW?=
 =?utf-8?B?Y2x4L0k0bzBPVzh3anYxVVo5ZER5V2tXMW9NT003Sm81bHZpZjd3L3N6Zm1P?=
 =?utf-8?B?MzhNeUwxaDVVNzRKaGQ3T3NNVXNZTkdzeWhTMVl5a3RtZk5DQTZOK0NnSlBO?=
 =?utf-8?B?dWxXODVDTFFNKzM4N3hiSlhEM1BWSi9CSVQ2SjJmN3ROZk1aa1p5aXNvUDgz?=
 =?utf-8?B?MXNSTUIvYnl2ZWo3dUdQL083dVZSNXF6aUQwVDhNcDhMT1F3QTV5ZXJtSEZp?=
 =?utf-8?B?TFNjZFpSUUlwUFMwK3lEMlZLL1dTalByeDh2T3B3WmZXUmtyMXpNdGZKNnk0?=
 =?utf-8?B?WmFQTFN2QVZDbjJBOUZtVzArb0oxZHV5NExDZlpkMTVnRWhDdy8zbEZBVXdO?=
 =?utf-8?B?eGR0cXBnWUdFbFcxYkVXdFp0a0JHTjc3dkFzN04zSmFSY2Uxb1pJeWJoMDIy?=
 =?utf-8?B?Y0lOdzRlSDIvS2ZoMmw4QzkwT3FaOVZDN3VoNXJNdVhCV1B5dEdOV1M1TjZQ?=
 =?utf-8?B?V0RzaHo2ZXg1T3ZKVC9PbG1xTTNDQ1AxTnhOV0dxS1hMdHhlcXRpUT09?=
X-Exchange-RoutingPolicyChecked: 3TCqAO9RCwS2DPgpttUaC3JJyidos3XvNtT9gpulH4yffZVmYVIzHgBOQD1de0rWQ4VO+gEy76DNdiLIivj5io7wNxAt5S0pesPjtA2vJVn/mbOd8Uv5XCPQtcEF7C2b97EwAg5Gu4DQuMhXugGtJKfjw799fZ9nR+yYGtL1HzQuSanKYi//LcxVIAqbBd39gOk7ks+raQMRgPJ7DrXO+dy5yXstsXcqccatLuCNZbUAnfcMGtDybPUm7pKKbo/gD9q7TgojQqeE1E0+NEuhbs8jrqZbLRtP5dW985nALSNXnJ7qSk9nORIuJ5gT87tCZALPw9mg/yL93Eg8V8KANQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c883354-6e85-4ad8-f611-08df2600bad1
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 12:27:48.6613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwUbO2O/1K0V50Rq3LC1zOT+vCAYFRLLJiGJVY40JCwxHIAP9wizWvfl4xG423WhNDWNThHjSKrFSZLuK3AA7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8232
X-OriginatorOrg: intel.com


On 09-10-2026 16:16, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/xe: out-of-bounds array access on informational or reserved RAS errors
> --
>
> commit 27317cc719f71d74be0f7fcd94c5a8fbf53f9e5e
> Author: Badal Nilawar <badal.nilawar@intel.com>
>
> drm/xe/cper: Retrieve the error counter record for CPER reporting
>      
> Retrieve error counter record required to build a CPER record.
>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 7a85735c57d58..5cfc9beff8c13 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
> [ ... ]
>> @@ -284,21 +282,21 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component)
>>   {
>>   	struct xe_ras_error_class counter = {0};
>> +	struct xe_ras_get_counter_response response = {0};
>>   	u8 drm_severity, drm_component;
>> -	u32 value;
>>   	int ret;
>>   
>>   	counter.common.severity = severity;
>>   	counter.common.component = component;
>>   
>> -	ret = get_counter(xe, &counter, &value);
>> +	ret = xe_ras_get_counter_response(xe, &counter, &response);
>>   	if (ret)
>>   		return;
>>   
>>   	drm_severity = xe_to_drm_ras_severity(severity);
>>   	drm_component = xe_to_drm_ras_component(component);
>>   
>> -	xe_drm_ras_event(xe, drm_component, drm_severity, value);
>> +	xe_drm_ras_event(xe, drm_component, drm_severity, response.value);
> [Severity: High]
> When firmware returns valid but unmapped values, like
> XE_RAS_SEV_INFORMATIONAL or XE_RAS_COMP_RESERVED, is it possible that
> xe_to_drm_ras_severity() and xe_to_drm_ras_component() will map these to
> their MAX values (DRM_XE_RAS_ERR_SEV_MAX and DRM_XE_RAS_ERR_COMP_MAX)?
>
> If so, does this call to xe_drm_ras_event() cause out-of-bounds array
> accesses?
>
> In drivers/gpu/drm/xe/xe_drm_ras.c:xe_drm_ras_event():
>
>      struct xe_drm_ras_counter *info = ras->info[severity];
>      ...
>      node = &ras->node[severity];
>
>      if (!info || !info[component].name)
>          return;
>
> Since the arrays are sized for the valid drm enum mappings, using the MAX
> values as indices would lead to wild pointer dereferences.

Good catch. This is pre-existing (from 6a9493e47075) and is not 
introduced by this series.

I'll send a separate fix that skips the drm_ras event when the severity 
or component has no drm mapping.

Thanks,
Badal

>
>>   }
>>   
>>   static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
