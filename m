Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3688F4BFE72
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 02:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789008542; cv=fail; b=cQXlXJLjgkOnBJcUIHeQCEg4RcL/5VSNwnaB0Lz87c8vMs4ZWF/OQApqEaZ6e5u90VNx2BRqupWvL7VhP6wxZMskjabN4x07tQpoygj7Sv2RjdNcKX+QIjvTIbDRuJLFmk9zJ6gdErwzVDhbU9Yn/TSrOdpmP6PLgdJnNvEe2f0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789008542; c=relaxed/simple;
	bh=C+proCADCzjRhWQ5g6CWo3YC5HikKg1fn+M+WfQNpCY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MdVghOA9bP90wg0WxI1TVxaPAoXukbGfxAiTjr5JNxPNjii8GEmukG2QxmzVZjLNMcPZ0GFAjM9diazjtnPSAFJwH9JkRA1TgK9mmwgq1jEuDrHN4pMSDg07XYV6qR7YaZCvNAJ3xLnK3NPCbm4kQnQzpn+k424R8vZ5Y5EACv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEbXo8ta; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEbXo8ta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789008540; x=1820544540;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=C+proCADCzjRhWQ5g6CWo3YC5HikKg1fn+M+WfQNpCY=;
  b=YEbXo8taVFCkf5/Eih5rlSzRoko3fpZvvlcWpOdMfzjimT1GA9Iv5/vG
   2dVigtOiWHKhExhWdiL04nOirfU5Y0w3L5PbhnP52qtfakz15RcAr7tWT
   ANjCHsrwUv/uWFoEaTBnCrl6WRaZi7XxqnRFAEtXH3nVmdlFUdEBB+AGh
   uagSQIQPdzX8AbVyyo96Lj4KSSrJ5cO9aHmlxfwtsi3ycqOljwenAgcms
   PAg4Abhc2HISYgIju841ZYM4H3l6iqjQYWOu1V7ClZOMNSyj7UagAhKlg
   9eDA/DamzNvFmNcT7FGct1rO2FuGTBYVQniSd7gzVQKQRqR3QQn2+2VA8
   w==;
X-CSE-ConnectionGUID: VoQ/iqbPSTSqg2075ztqiQ==
X-CSE-MsgGUID: wrfQuqoPSZ+KsOVIzHtFEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106817921"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="106817921"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 19:49:00 -0700
X-CSE-ConnectionGUID: Eu10CNctQ7q3oKq2q+zvWw==
X-CSE-MsgGUID: bCBZXh3+Rfe/iOzbyB4kcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="271014204"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 19:49:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 19:48:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 19:48:59 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.10)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 19:48:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdsHf1nOF4ezhl/GYMvYKuP7tTb5mlN86FRj2E/I4l1QpoO1dvHw5FI89zuKw/5p1LJfXzHbhOghpy9LhXo4bdev6RlO4XADRX7Vs4k9emTBec/xLY8FykE+2IyQ85poMMj5mBwP3RSdgQ9XICbRPcTa31VcJwQjbdUyzo7cwlzpMNeOwArKFPFE/IrpJAuDrWrdR9xpa6z/6LM/oZBOUgLNYyLvNqxdhRfMbCqDUCzFARFpjBPC8U9zX7fOMuBGJsz3uMU/HLetEo4jEnTIIhVPXgtcUMHkfwjMAoJDU07cW07pX0+et69kD4VJ40dWE5leICZxAJHIbeXfPMciKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPUqjjeZHw7ubramWTBd0t4i1MCyuvKOf0qmzOclAHI=;
 b=oLymprZe/CCvAtcy+l+oRSh1DoHvjYoi7BkFmuWP2YpfCs5Uz0Qy84oM8F9iLT41gHvQUfMdsYl6adubdsedQVT5A+p3/PuIY0f9yiD+mdm5AIPlrtIXroVrVnsJXQ4sOnLVvM/2/Fd1Y4cFkuG6nra7kSneqzDKPa+3XDlUU3439DOHn2t3K+g7IMx7sTOa0y9nfzcBVLWFNWqO1dk0ne7IkVeFArR4arh6WwPsRNS5pBoFf/NWURo1WOf4QbxZQ3y15iOuN+W2c++J2HkwiWwaFAdjof5XcyTYO6R7Q2uf1/E/mlgZF3rj1LknNr2AKKHofMukvtMvwl/KMNlA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by SA1PR11MB6823.namprd11.prod.outlook.com (2603:10b6:806:2b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 02:48:57 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 02:48:57 +0000
Message-ID: <ef61115c-0f8f-4267-b6ca-7b134216a79e@intel.com>
Date: Thu, 10 Sep 2026 08:18:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/12] drm/i915/dp: Introduce helpers to enable/disable
 CMN SDP Transmission line
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
 <20260908062224.2897987-11-ankit.k.nautiyal@intel.com>
 <20260908071204.661D91F00A3A@smtp.kernel.org>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260908071204.661D91F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|SA1PR11MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: dc32e8d1-8e65-4b38-1a59-08df0ee60f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|6133799003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Zag5JvWddE0epofV2oW8FKV+ZJYUU4xHQwKwfIBIj4bY2GyULAqcdqzDrs4vrtZlQWHmCeNo45qWgNjDpxvrrwGln9PbxRqKzuSYDys7dX7EOvXQoQSqweTic0I1JUsexKjX4aVJUxSQwKsSO9cZRXss3OW0kVlvvRlCAPJr5adPYMypGLh5bGFN6bhS8ZC6VCnc4HvYXcoQ/Wj8gC03GbtxcpAhMTMJzpCgEHFQW2LHEagbqTb1Z5G8lfDi2fqqVDm9wYe/o8B4LLOUT4P0X0fZ2yQZ5spdnJeaUm6B5mtaoJnWxPef8dD5mjyFeYBFS4K8Pggarx8NMVYxG6YA1KU5Ac2Go1xyeHOgeieZ5cC40TZSgQrQiW2Ze87EpVZcMV5Ve8tLzX6En40er0FWDmBPYNOUjCFYw18mARsNAqh29hcULu129bB+7vpbY9/FWeA6p83nx6eBkt6kYjn7pSp6qK1P7nXzwMp059Dz3GVRkiZ4KDXdW6A0dtLrIngpuBDUr3aB4wbCSARXihm4YL2TFDsxwlfGVPjXu3O3HFiAbTQH9MaLQGPAcf4T85PZmlYK8urzeIxPDobT9nxuDA47cI9yKY0dOpLRkpauNwnfCpcrWvvl1PpeVWhgqvwBW7BUEE7bnesHjnIFI2awjHPRPKtIjJflXHF1sEuc/Sc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB7554.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emlIZlB2QjdtcGxKeU81VmV5ck81QkViMUZrL204T3pzOUo1VWNSbFhWYjl1?=
 =?utf-8?B?L0txMXlOVW5JU01yZUovV1l6S1cvSVV1WklUTkdNUUtkbHc4YTRmZGxjeFRx?=
 =?utf-8?B?YVI5ZzNLcE91VmxoRVhUOWovSjkxQmFxT3M4Q3ZMYkx1QktxQlhtaTAxS0Vp?=
 =?utf-8?B?bUlTMGlYR1duMFBLUFV0aXE3UzVuZ09xSEdTTXAwMHhjeTIySkZNSTNqNTF3?=
 =?utf-8?B?bTlSU2w5YlR3b2RIalF5YUh1aUxDQUU3K0M2MklnZWFzblZobTl1QmFhS3dG?=
 =?utf-8?B?MmloenJNVGUvVEllRFlyeTQ5Y2d0S3pNMy8wdStwc0E3d3Z5Ym9TaE11Y3N6?=
 =?utf-8?B?RmNPWG5xQ0FtNkY3dlJmYWFxUGk3cmdGbE00T3E4VFpLOFNCQmlSWDlyWHdo?=
 =?utf-8?B?SDZncDF1aGJrZ0IrVktrc1E0amdCQTRVelpYeS9OZ2h3RUkvamtleksyTnMz?=
 =?utf-8?B?TWc5MS9UYzJ3SkhMbHdLSG5oRXhqZ3FzNkJjampTTVlwcVViUm91MVdOZ3JS?=
 =?utf-8?B?c2gxVkpRY0RTci9KU3lqNVpIRXlER1AzU0FOcjkwU0kzR2pQVG1ZaVA4aUt2?=
 =?utf-8?B?Q05YdnJKRTk3RUViZk51TEhadnkxSk9OdWdDdVRrU015Ukdsd2VaZXE1MUo4?=
 =?utf-8?B?TjdYcDU1NnV1eWVxSkVYM1FON3Q5bWhtZldMSlVYdzZ2WkVpSTZSRTBaZW5w?=
 =?utf-8?B?VzNCODdPVGtOdkdrY3BLMTZFYjFLT2Y5bnFHWXZDbHhtVzFGQStHMVRVSFJZ?=
 =?utf-8?B?LzhVVS9JbWZaQy9XNUxoNzByNjg4NmJyQ1d0OWRsLzU4WnlNSS85djlQdDZq?=
 =?utf-8?B?TThmbnFBQWVMU3YyZmFCWlFMY3hqRFRUMnl0Q2dxU01GRnlQY0U1UloyOXlo?=
 =?utf-8?B?dkdMbW5MamV0ZnNhV3kyNmNVa0VkSTEyMWdpWGFqd0RpN1pZUVNlVGorRFg0?=
 =?utf-8?B?eDc2dUpLNTZhZ0x2RDhoT0VZK1JWQ3laVXZsQ0VpdEdOQzZzZnFaaDhPbHVL?=
 =?utf-8?B?Vk5xZURSQ2hqQTBDdVJnT0NySEN0TXN3ekxFN3l6V1ZFRHM4QlMyTk5WUis1?=
 =?utf-8?B?ZEhyS2k5a3VCOEU2VEhQUUMzUGZlM1B6WFM3RzlaVzE0WWtKRks0bkh5TWlW?=
 =?utf-8?B?Yk1FMkdvV2d2OWRNKzhjeGdYMGo5Ull4V0ZVZTB3TW9oVm9ocDNYNTVkUERa?=
 =?utf-8?B?ZzNPVjRJL3lROEVRSFpFNVR6MGdjblViTnQxeXBhUnFFSWM0MnZmSE5tdHZv?=
 =?utf-8?B?eTgyRzNLbFNiMjl4UHZqeUlXcHVsMlAybUdQOFlHQ3hKVkZ0L1duT2RGZzNt?=
 =?utf-8?B?blV5YjRQZWhDeEV1VkxuR0V1MWs2dzBoWG1qVDlPODRBV3pLVVB5Y2lOTXZ1?=
 =?utf-8?B?Qm96L1h3SGlKZm5LN0oxOXdQUHN3Z3lPMy9FSDlvRkRHY29hbVlBWjRjdWFm?=
 =?utf-8?B?VXV3dzVJai91QTRRL3V4UVU5S0JNWFBSN3JKZFFVMTFybUJuRVF2VXlzNVd0?=
 =?utf-8?B?SnNIVkxFVmFBQ2lnMHh3Y0h5OUQzV3pzeGpBb3ltQ05CUmVhNG12WEFiTEVN?=
 =?utf-8?B?RG9kaHgzM2VTakUzTXovWkdTMnJHSjY1OHNHK1ZRRmYva2UreUs5QWN4TmlO?=
 =?utf-8?B?U1F5ekVNV20wMmltbnpibHZrWWJCMTZWeFZBK2FGalFkaUJ4ZFRod3QvajZi?=
 =?utf-8?B?R1ZvM3JGa2pFc0dlcDhpbzFMQUZGTzBPWTh0dSt2eldIcnZaa1Uya1FXcWdI?=
 =?utf-8?B?akxKcXF0c3VaTDBvWGlCUDdMSzVmYjFCV1d3N0tuQ1NsNTZsYURFL1FQcWZZ?=
 =?utf-8?B?R2lCOGdGdW9ibzU4ZTlEMVgwZnk3Lzdob2tCZnlYZmxsU3lPZ3VsTWlsUWMr?=
 =?utf-8?B?c0pXbWlLRE45UDFXclI3NHh6WVpLREZsblMzNnB5MW5ta1FIRkwxYUk5eWt1?=
 =?utf-8?B?WFBBZXJTa0NncUlUMG9PNmVGRVdjRWxhSTAxa2loQTJndkNRRWxobWZJRUlM?=
 =?utf-8?B?a0ZIVnZzVUxTeU1TdThNZ3ZtQS9DUkk3Tit6b3ZnOS90K0RmRW1tWFZnSHFh?=
 =?utf-8?B?OU5FQWRmQS9NVHlPWWZBdXhaQmpEQzliSE1vNVM4YVd6WjFRSHpXVkZlNlJN?=
 =?utf-8?B?ZVhnbGlvZ2dueDdDR1pkbEhDblB3Q0ZmSzFhMG9yY25Dd0FNOGJxdW1sNjJU?=
 =?utf-8?B?dUk5RHVGdWtyd2dOM1hkNE5BTE01ZCszVWVuMElwQ0hldFJvalBsMGcvN2FQ?=
 =?utf-8?B?Q2h5OG93N0JPQ3lFT2w5bzJLSjZzdU52Kzh4cS9taDZWMDg5VXc3S1F0NVpu?=
 =?utf-8?B?WEJOb1FRU0huckdtV083RkkrZjRrdDBBWFlrWStuMmV3RWdkRmpsSC9OTHJD?=
 =?utf-8?Q?4IW0hY5ex+UGROq4=3D?=
X-Exchange-RoutingPolicyChecked: 4XQU1bwztA/PElr21e1wH+HcBMPs2iQC+lUA0Eeh9iuP38KhiBL0Ff/KId6lynMR5a5xVrZwsMtrTKkx5co6Nuwzt9Vcd3sw/wiSVj/Wx37iDgCdDRGfbX3bBkeLLHUh5CR1gev+WfZTAkTshY94TrE6SjtqE2uVp7q3OtOmDJAAkeiq+LuvJVxz7XxdfcAUvWX4hwbF+5DAjomaN6/MUotqXSXQlKq/kSGmmIst8hMWmsg2MHs6sLjvNCOXKoJcgw57Fa5lJxodf4X7Rgg5pHeVu0JRKigV/Ht7SqsX9qoHQfeoWRlsXuZ6X6NQehqh0JQvCqfe/2zPwiITLdpVtw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc32e8d1-8e65-4b38-1a59-08df0ee60f37
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 02:48:57.3398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2A9AJ7wYWnXzLrQKGTS45sC4Nh2EP0MyuabW9qFsPEtr83/9ltz3I0Ro/AG4+enGhJrtw7vXqr60AtyNDVbal90pAt40qdkljsJmCeiJezk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6823
X-OriginatorOrg: intel.com


On 9/8/2026 12:42 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Using cmn_sdp_tl == 0 as a condition to skip hardware programming incorrectly disables valid configurations where the base transmission line is exactly 0.
> --
>
> commit add857e2d6bd573b97121b3d862f0f6816f3b50e
> Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
> drm/i915/dp: Introduce helpers to enable/disable CMN SDP Transmission line
>
> This commit introduces helper functions to enable and disable the Common SDP
> Transmission Line (CMN_SDP_TL) and its stagger registers based on the
> configuration stored in crtc_state.
>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i915/display/intel_dip.c
>> index d1acc7eb5a391..0c80d6305feca 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dip.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
> [ ... ]
>> @@ -61,3 +63,57 @@ void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_st
>> +void intel_dip_cmn_sdp_transmission_line_enable(const struct intel_crtc_state *crtc_state)
>> +{
>> +	struct intel_display *display = to_intel_display(crtc_state);
>> +	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
>> +	int gmp_stagger;
>> +	int pps_stagger;
>> +	int vsc_ext_stagger;
>> +
>> +	if (!crtc_state->dip.cmn_sdp_tl)
>> +		return;
> [Severity: High]
> Does this incorrectly skip hardware programming for a valid configuration?
>
> Since the transmission line can be computed as crtc_state->vrr.guardband - 1,
> if guardband evaluates to 1, cmn_sdp_tl becomes 0. Since 0 is a
> mathematically valid 0-based register index, this early return will
> incorrectly treat a valid base transmission line of 0 as disabled, skipping
> the register programming entirely.
>
> [ ... ]
>> +void intel_dip_cmn_sdp_transmission_line_disable(const struct intel_crtc_state *old_crtc_state)
>> +{
>> +	struct intel_display *display = to_intel_display(old_crtc_state);
>> +	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
>> +
>> +	if (!old_crtc_state->dip.cmn_sdp_tl)
>> +		return;
> [Severity: High]
> Similarly, does this skip disabling the transmission line if the valid
> configured base transmission line was exactly 0?
>
> If the base transmission line was initially programmed as 0, this early
> return prevents the register from being cleared on disable.


Thanks for pointing this out. Makes sense to gate on 
HAS_COMMON_SDP_TL(display) instead of checking 
crtc_state->dip.cmn_sdp_tl in both places, since 0 is a valid 
transmission line value.

Will fix in next version.


Thanks & Regards,

Ankit

>
>> +
>> +	intel_de_write(display, CMN_SDP_TL(display, cpu_transcoder), 0);
>> +}
