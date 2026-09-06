Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749F830D411
	for <sashiko-reviews@lists.linux.dev>; Sun,  6 Sep 2026 05:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788674186; cv=fail; b=kDxLKaPOErVr94pawSl+PkK884QiQ+7CswZqy7xcuzy/VVPwSioUbm/61Bw1RZwT7y+1+CEH/c1UVx+QcwI1wYc+vQEo0SWfEz9NZWFbgUSvTvVR7mLl5kJEnOoV1dJIUVnFWxc2GhzOl3wXFoZUaLkqtx87M2fWU7yjWSCMjIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788674186; c=relaxed/simple;
	bh=dH5a38+F0gqYGuaJsx630PCTSoeqSUV/vftC/de2oXU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U3TMgfOF+k4KNkOXhUJsCUqBw7N5bmAobEyuOSIXMPIV+DTTXu4PKrIDD93Za/oQu8YbW9NgeFfGq84GStB7G93rb9iRywdzS0ETzshci9qeYGShvv2oLVO7qfWLq/dQXzDKnEsUfm9ZlzN9ioXxDMLc9OGZJWuUz8bxPIC+T4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSsVBxGM; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSsVBxGM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788674185; x=1820210185;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dH5a38+F0gqYGuaJsx630PCTSoeqSUV/vftC/de2oXU=;
  b=dSsVBxGM699V5uUDhKRtZUhoSse94rOUdZhn+Yxpa+LVUKouVaEOWl/4
   q9DurN3HKsZkZ3zAdNKnmPC+ERJjSl1XvhBiGm00WQIEs9vUvlINLUAuP
   4ArwQwqHvzJQylKI8yrb1dQfNGyS3PslQYg8tU+95Il5oy2yBQgoBPXka
   jXbYyyvV/Fh1NgrZ+mpfBaRmlV3V00DueaPE1iBT/G3QzroaF6pxC6evh
   T99z2gdJAjnWfxtYGZ/TgLzIO9zZW7eI26vyOr5evgQFiMJe/ZM5s9ZgO
   KPtsfh1aQx8sr1Xb9pBEoIsagc2hzJZYQ5ut/+4Y3b4WhCVAf4bhRCs36
   Q==;
X-CSE-ConnectionGUID: M8tenK7UT1iRgnceKZ3PWQ==
X-CSE-MsgGUID: H/pJSbkYSj+rkI+9SfECDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="89040458"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="89040458"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 22:56:24 -0700
X-CSE-ConnectionGUID: 4OB+b2/iTXy1kcRBM9SzyA==
X-CSE-MsgGUID: XXyKqKUjTmKAgdxmqym0sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="300304594"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 22:56:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 22:56:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 5 Sep 2026 22:56:23 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 22:56:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugahM3lv5S9/ek5OAmg7MJynmVvKa+di7dpTJBwy6WXARPJc/WE2kwKL3IGEoHCwbOFCBgCZk01/zXSn+CBjB14ckNC8rhexklxGVZqO+z9t6yeGEs/IEOlR3zAkUBiRDk+ZCVLJ7xjeQrMdadmaKStXNaJ1Hifyg9bkCheiBBqUMldcw7RYCH5LyED1hkRRrEzv6vR4lNpm8k0LI6yJVVCF+U5qybMJNAtpVXvkcCPvWTcfWcz1tp5Wge/jQqWLni/QgioG72CgtHhHS1jbShOT2QwMgvQniH1w5XkPcycaNU7DNMGzoxexOaXvQKU1OWfvANdD/xFpIPgdevB92A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppVSg2jhSgkSlHk2oI1bA2xranoXdJEQUKU/2HR+fto=;
 b=mIlwr6PUgXzl7T+o32ze2zN6LLNYY07M4thkHYLvzB0CLVLwcpbiV5RwD2K1fMe5Sg+Ts+iLaMSQJfYtxHhAMBQGOg4pJ5P0fCjhupV3zW3dstGf+1qsfDc5PLneaNBXXNNrHjIMh0cbyHCm+rX8A2z2XJdQzCY4QRwRFwHuaBnZRA8FnCgZQBiXUs22fgorrhe3KWIOagt915EQ0S6Vhk6GK9C6UxKvE2FFP8ULjNr/3MnYScOgfI+jWHwrlV8LcjBK9p4olK5H03GK43wW4JH2wz6livaiKlhsQpgQxoR9oI/HCGTIZ46RDnrAgaMQK9fxRt1yAfb2CKK5ZdwOqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SA2PR11MB4986.namprd11.prod.outlook.com (2603:10b6:806:114::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 6 Sep
 2026 05:56:16 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0382.012; Sun, 6 Sep 2026
 05:56:14 +0000
Message-ID: <3b128dea-409c-4f2d-8109-58ee3c87898f@intel.com>
Date: Sun, 6 Sep 2026 11:26:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] drm/xe/xe_ras: Add support to retrieve info
 queue data for CRI
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-14-badal.nilawar@intel.com>
 <20260825175317.6C7271F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260825175317.6C7271F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::12) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SA2PR11MB4986:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf5b6b8-5179-4cf5-6d65-08df0bdb8f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18096099006|4143699003|20046099003|10067099003|56012099006|5023799004|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: z5CW6GM3W02KcQY9LmitrudL8HlxScIK5FJRuVG1QnEzk/8Y/ZlJkf3oJVJUo2MIiD1ZMprKQYlKZAiOzWwqxbV8yi+Ota9ITb3kiaAyiL4XjN0kTdwVHg8q6teCfYZEAZvGl+RiT5DW0j6eQYM8JWyOyaHNNWAduh7SW7rTJKRMq5Zi7XxkdPTk/w2bvxn/Z+a0+u3fEADzNc0FFPWFDlvO+1ejlfz66Wg3qxKnysQ/mRkjMulnR/9V52aVH1Ro+aKAMIWubYvr0J58zIychU8zA0FhUDt0eKMwJ8vVPCQ9eKj6awb0n+OxvvOT+hzy5hEMXw/RqZkSAydmBnzY2wOHbi10oWonKNVd8NWv5l3PO2fSn8rTdpfgAwE/qj39FT6hFBz/xF47EWCWg3k0A6HRzWEavXgXpJ2kyC12bgzrtl8wWDcve8ijk0q6VJio3w+qzb4sRWdPEJAA4Xv/DGHit9befjgEVkgOlowwxb9EfiRh03rth9zbol/Zr427wQ3plsGBWr87Havqkz/f7WIlD6fnHb7yVeMgL42iCth03KZ1DVdVLyd+97WVVjhIZs+zs+X19PlRlm2guD5NeVvmK08oCePw7bckGTO4yxRQ1xoEzS0VRE9r9SF2wIvzjV4b2j00d/Hlhz0QjZmTSCVvFKlbvLfY7IVEixRhhd0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR11MB9792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18096099006)(4143699003)(20046099003)(10067099003)(56012099006)(5023799004)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzRHbXpBL0FkeXR5Q3crd211WkpTRXQrc0Zvc05DWldoc2JPTGprZTc4TGd0?=
 =?utf-8?B?UnpSMXJuZ1krdnZCUVV5SkRUQ0VhTTFFeENXRGtrYTY3MG5uMWlBaUM0MUZh?=
 =?utf-8?B?T3dBZ2tUYlFXVTIxOHkzRXRaMFoxYmdjTUZ5L3dUb3M0M1hVVmJGU1lJS0lu?=
 =?utf-8?B?UHpkVmVzQ0lmWHIxajh6UjN2MVhqTVFQRmVOUEtZT1I2REY3QlNrUiticTFi?=
 =?utf-8?B?d0lUSU51OE9GcGR4Q0tLZkJtZ3Z2MkMvekV3bkNaaVdHMGNzTnRvS0dsQVpZ?=
 =?utf-8?B?N2s0bmYwMXMxeEVuREpuWFMyK0hNL1AxVEo2MHRGeXVDSlRUQzVidG5SV1BF?=
 =?utf-8?B?MjRzRFRYWWc1Z0Ryb2hRTm9XVnpVaHRmR0dVaHFXY2JYVEZ3bUVGdytOaGlE?=
 =?utf-8?B?cFMxN0ZMOTJ2bEpJT0IvRUZHWFJkNkUvRE1QL0FSK2l6ZUwva0R3RFEwUnR2?=
 =?utf-8?B?S1dDbVloUEcxNERvSlNzK2pDRmJPcWRDRVFtdTVYNHpWQXVFdGdVVXhhM1hW?=
 =?utf-8?B?Qm43UTY3UmM1Sy9BWThlUURwc3k4RjRaemozMWNzVXFudm43M0IyL1NZZHRZ?=
 =?utf-8?B?WUdhYjNuN1RrY2RzQkY4QTJUcFRZNXl4OVRaUEpQWFBlN1lNcFNyUllKUSs0?=
 =?utf-8?B?TG43YUtZSGtiV2E4SEZ0MVQzQms0M3ZNQnFmRHVOZGJ5TkZQUDRZTVlBVlBs?=
 =?utf-8?B?M3JyVkhVK1V3OUdTVU14bFdNVHRUSktDYnlzejRoenNlQ3VWWi9nQnlzOGt6?=
 =?utf-8?B?UWZiV3JEZmM5S2c1QlAvQzZOUEhlWUdvMGZUKzk3TFJsMjV2UmFzYWZ2a0NR?=
 =?utf-8?B?V3UxQ3hEbUdyeG8vUTl1Q1A3VXlMSGlMWktZVzZTS1dlNFFQOXc2bzFuY2FB?=
 =?utf-8?B?Q0s3c3NCa0FIUzROVWY1UzZCblBGZ3BHTXowblRoTXZzSUFOSmxPWGJhL1Vl?=
 =?utf-8?B?bnJHZFl6dnlSRkZ0aFlpWDNVeHJ6aEl2Ky9lME5iQkRsZFFkRkVuSTY1ZTho?=
 =?utf-8?B?djRkNGxaMXNtdHZmR1hkV3FtYVdFUnRvTEhqQWc1RHBISWd3UW5GQjVYSUpI?=
 =?utf-8?B?NWFjbXJ4K0RXVVlxMGJlRWdDNmxSQjhtcVQrK2NIMjl4eTVDcFN4K1FNY1E3?=
 =?utf-8?B?M1o3NG43bkUxZDAvSDlGL3U3TjdLalZpQzR6WWpaNDR3WTkxelY4ZWlCVzlv?=
 =?utf-8?B?M1IzTjNucWNSbGZKT1pOMWNqaDZiQW0zdmdqeTlRRjFLb2NvY0NpOWw3NC9j?=
 =?utf-8?B?QzVQK3ErcmRnZEkwaWRYLzJ0STRvK283SEp2Z29ubGVDdGk1N0NYTVdlQUFw?=
 =?utf-8?B?MHVZSU9Rc09DajNkKzVHd3MvMTZ5c09ueEgwNkhubWVBclF5WUphR0I1bWJY?=
 =?utf-8?B?RVJ5VTRzYlhBZVNJV211VGF3TldLVXJ3M2I2OGlZVi90d2ZiY1NXRm05N09F?=
 =?utf-8?B?S2pXSjkwVXRITk1hd2tYazdnZ203eTMxRHFoNVhXeG51eGNhTzZLVFVlWmly?=
 =?utf-8?B?UXZwa3ArcS94bzA2amxUbWZQa1RZT05CWFNLb3dSaCtQUlgyK043OWt2dWFW?=
 =?utf-8?B?aWlBUkdEb2ZBbGV1MGtvY2w2Q1NDVERIZnh6K0xjR1ZkYlBQbmg4ZTJOMG81?=
 =?utf-8?B?cnVVMGMrRzZtTXlTdytMVm9VMVQwWDVTWEVJcFVSL21RRmZTOTlrME9SMkIw?=
 =?utf-8?B?UVZOWG1LTVVERW81QldTVjlWVEhmVkFMTDlmQ0Fkc2gzSmpFeko2bVh0dEdo?=
 =?utf-8?B?YWZyZnFaNG1FN1o0Zk43UDBTRk8wejNrKytzMmoyNHk5bjJadE9MNlJ2ejlu?=
 =?utf-8?B?S3lFMk1EQkplMExjbFZlaWhIT2Y2KzRLNG43blhyL2JlN0o2dGJud2QxeUdN?=
 =?utf-8?B?MkRHVjNwK0NwQ3Y2dUJEVkdGN1R3M3ZuRjcxMWZOYzNMcXc3VGZkQWZnSUNv?=
 =?utf-8?B?Ym5MQ3BZUW4zSnZEM3JJSG51SmxRclVTdWoyOWxmUTBRdDVWYzBuZldqVGd1?=
 =?utf-8?B?S0ZiSTE3c2lmWi93UzQzdHBoQlc0UmZqUWdBcmNDUlJRcmpCVWc0Rjl1QVFQ?=
 =?utf-8?B?RzlLNUpNNkFkSUhYY1hUbCthNHN1R3JNbmlNVU5VNU12aTVJdzU1K1NuVDhP?=
 =?utf-8?B?cGQvMGRMTndjWVpvYS8yZTJaWXRpdmo1bnpRMC9BTDNxMnJlNnpMMjdsckVp?=
 =?utf-8?B?a0JFNzJscEt1NTFsLzRuVmEyQWMyUVVQUUVSaUppK2YxdVphaGx4YXNhYno4?=
 =?utf-8?B?bU1JZVVuVFJTd01KOTVvbXlLRFZMbjNHK1dFT2p4NkN6Sjg3S3V6VEVoeXlG?=
 =?utf-8?B?dVZkNm1iUWYzbCtWZ1k5RVNWa2lIdlRuSzF1NXM4UzNpajNuMDRqUT09?=
X-Exchange-RoutingPolicyChecked: gzhAuB6Cqguxqx4PdiAO5XR5lBaybNl4076gXbQL987diyVlMAOFnEWlBoTPdKPB42AF6NTf2fRRu8lCqJNt/FDcXeNNU6C+N8XMSfdguhuD7T6sHNdFEbuLylGa37WMBXi2Vo9EDOkvcnWmCLJVfMAxxLvuhqfDdI+3cAwAnKqiKUAmQYal3Vuswq19Km8KtRUKsnqaJopVaQhZRgGRTxB2lbzolsh9GNt2AuRGON3zq3bYeQ4/vwZk2YVU8ul0E8caRUBJY/X8ZRVuan9mP6hJdPaC0To5OCWTyFKpgFGbRGsagLPoiNA8qHYG1Qz3WWmNogQwkGHbmzoN3pQILw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf5b6b8-5179-4cf5-6d65-08df0bdb8f50
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 05:56:14.0587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yf4z9qE1ISLpU0d/3CNjypHYUaHJfsjthQJUlISGiUpIUha5RNUHaQk1YBW7a4a2I3hfQYPgXZOJRi7x4JDBfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4986
X-OriginatorOrg: intel.com


On 25-08-2026 23:23, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Unportable use of C bitfields inside a packed structure for a firmware message interface.
> - [Low] The patch introduces a static function `get_info_queue_data` without any callers, causing a `-Wunused-function` compiler warning that breaks the build.
> --
>
> commit 82a6804e91047f9e3f922cd878001d1bc3e9d8ed
> Author: Badal Nilawar <badal.nilawar@intel.com>
>
> drm/xe/xe_ras: Add support to retrieve info queue data for CRI
>
> This commit adds support to retrieve info queue data. It introduces
> various structures for the info queue data request and response, and adds
> a function to send the command to the system controller.
>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index d25d25f775310..6830872354825 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
> [ ... ]
>> @@ -661,6 +661,40 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>>   	return 0;
>>   }
>>   
>> +static int get_info_queue_data(struct xe_device *xe,
>> +			       const struct xe_ras_get_info_queue_data_request *req,
>> +			       struct xe_ras_get_info_queue_data_response *out)
> [Severity: Low]
> Does this function have any callers in this patch?
>
> Adding a static function without using it in the same patch will cause a
> -Wunused-function compiler warning, which breaks the build when compiling
> with -Werror. To maintain git bisect functionality, every intermediate patch
> should compile independently.
>
> Could get_info_queue_data() be introduced in the patch that first uses it,
> or temporarily marked with __maybe_unused?
This will be fixed in next rev.
>
>> +{
>> +	struct xe_ras_get_info_queue_data_response response = {0};
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	size_t rlen;
>> +	int ret;
> [ ... ]
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 99b2466e2062c..d87db9f5174a2 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> [ ... ]
>> @@ -95,6 +99,109 @@ struct xe_ras_threshold_crossed {
>>   	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>>   } __packed;
>>   
>> +/**
>> + * struct xe_ras_info_queue_header - Metadata for large info queue data transfers
>> + *
>> + * Provides chunk metadata for commands that support extended info queue
>> + * functionality. Used when the total data exceeds a single mailbox response.
>> + */
>> +struct xe_ras_info_queue_header {
>> +	/** @total_size: Total size of the complete info queue data in bytes */
>> +	u32 total_size;
>> +	/** @chunk_offset: Offset of this chunk within the total data in bytes */
>> +	u32 chunk_offset;
>> +	/** @chunk_size: Size of the data in this chunk in bytes */
>> +	u32 chunk_size;
>> +	/** @sequence_number: Sequence number for this chunk, starts at 0 */
>> +	u32 sequence_number;
>> +	/** @flags: Info queue control flags (RAS_INFO_QUEUE_FLAG_*) */
>> +	u32 flags:8;
>> +	/** @compression_type: Compression algorithm used; 0 = none */
>> +	u32 compression_type:4;
>> +	/** @num_headers: Number of detailed counter headers at start of queue_data */
>> +	u32 num_headers:5;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved:15;
> [Severity: Medium]
> Are these C bitfields safe to use for a firmware message interface?

Yes, safe with xe kmd, which runs on x86 architectures.

Thanks,
Badal

>
> When the driver communicates with the firmware on a big-endian architecture
> or using a compiler with different bitfield ordering rules, the bitfields
> in xe_ras_info_queue_header will map to the wrong bits in the underlying
> 32-bit word.
>
> Using C bitfields inside a __packed struct for a hardware/firmware ABI is
> generally avoided because their memory layout is compiler-dependent and
> endian-dependent. Would it be safer to use fixed-width types like u32
> along with FIELD_GET() and FIELD_PREP() macros?
>
>> +	/** @checksum: CRC32 checksum of this chunk data */
>> +	u32 checksum;
>> +} __packed;
>> +
> [ ... ]
>
