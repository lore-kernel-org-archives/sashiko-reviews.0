Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92571329C48
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 08:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979725; cv=fail; b=otiBXorDjA/UtIfhcUGvDRUxZdhUcEEAps5TADlVKKhbtGEIFQ92Pm/dkw7J+mmOtfdDi13KwWtzUGfu6HkNi0NMYO9EVHEctEYkWilkYZlz6cNkLsWNHqdnf7q6xPYp6Sou7iiPa/vVEIDjXDngU9yPlXSpr89sJQgkjlCNhQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979725; c=relaxed/simple;
	bh=H+tQ6q+lUnq9V/5NmDovm6KraKtdXAXxqgGQKOtAgrA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H2+o74wMXF23nZtd3AP37cT/rBzFJ0lRVfREBb5hwToZpTrV3EJj7B9JBiwlzRgsnnvWZiV+rI1dji6FP7caDFBR6P4zfEARvGkeGTbSJAUuIu8MZIQkUprfX03MucYYJSx3jS6PHfXGud7ch+nc5Q4cQr9Y/JBjTWvX/cmFNoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+gjtrBU; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+gjtrBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789979722; x=1821515722;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=H+tQ6q+lUnq9V/5NmDovm6KraKtdXAXxqgGQKOtAgrA=;
  b=k+gjtrBUqvZKEGEJ1v4PYoxngvdIcG10j18ox0Hb/z9uPYOc6vC7zjqB
   G1t3hsPjzmfwK2oqSK3sFfNyLEQDA9udoqyUGVKC4uFlAYn1Njdxod9Bn
   dnQFubStVSjVB4vKIIp7YaTjN5CYjWna/vTk4FnwrAEbJXjS8ILxtZirz
   zk0NQOFDnLAGcOuuvCJpBwq4LiYlTUUbg5BgNIpaZeT6CvHbojyLxoVLT
   ErsTonDbQw5R3nrqUQgo/N9Zo8wVmDMvLzl5sdyCMuInSzVg/pTniB2z6
   KCPD6i60B9NPunOWTOquqs3UAOk05ThBLzX0ND2vTrJaCHrJQzoQMcy/n
   w==;
X-CSE-ConnectionGUID: ImyInZi7Q6OcdLgHkAurXg==
X-CSE-MsgGUID: LiKOlvRERQOD+A5nLrOBug==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="94304364"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="94304364"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 01:35:22 -0700
X-CSE-ConnectionGUID: 7KN8jjJnQL2AsSbCStOXow==
X-CSE-MsgGUID: +KTqmnHOQH+Y9LxHGsPmRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3565911"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 01:35:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 01:35:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 01:35:21 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 01:35:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGcF2IfMfU1s+BkLyWp9SM5RYKmDB2bChYi9u7RKBDJYKqKhjn5E7t58CZ0lhX7bbGYe98LvYVLrjmN7mCFHWLHFk5bkLycexNn5lrRYpShrORfT/Izu6cYt18z0psHpQd2mMg01oyaSkyWiySyHupMyoBXEGFQ3RnqZCweYps9bq2mtrzF0upnKCnNaNcUmCNH23uc49dktJQFhfs9Usuxeuv2asiwOYOE80wXCcXx4H9E6vBx+dlMJ5NcdBpQOodiGqNQSIdAid9SW3dFGqLagAeSfcwR29u2PggqDme/OZ76neNn2PYR1PcEhHrN677DLIERcxvj80R9AZ+nF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6K4EM8C7ypN7aGd+KwmiHrPrYn3o8xnelwmhmHakgys=;
 b=RKKE6k3bpje08m+GX1tYwYUSQEdKgyqZjfS6CPdMM1YMcZV4J8Zyz0XuP1GTkVaIzrxZ0Il+iGHLfPuT047FAGRLXmK3dV6EgGJP230Re2HaZ0r5ycE7nkNHiprjO4bRSgu66bN/HMcxtkrMKQP/O4amqn/Dp+nt99Luo5dbN3ckpjjSqKXGSaoYmACthd8peuRutHYY83sxjo7rn3eSsSNuHCwiqpep7tJIgs6kBtNaT5x7nqUeCDIZdaXplYNOtdzTO+xas9wT3jP3cznVMjC12t4BsLGqwyXjHd06w/13zVRA+bZac/IURm9kimNlrYSqy3+83L/Q5dSQTUtW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 08:35:18 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 08:35:18 +0000
Message-ID: <d2319fe5-81cd-489f-8497-061378de9f73@intel.com>
Date: Mon, 21 Sep 2026 14:05:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/4] drm/xe: Bump prefetch BO LRU via GPUSVM devmem callback
To: Matthew Brost <matthew.brost@intel.com>, <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
 <20260916112828.2528881-9-himal.prasad.ghimiray@intel.com>
 <20260916113633.087841F00893@smtp.kernel.org>
 <aq2m7LRrjAXw9pyC@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aq2m7LRrjAXw9pyC@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0363.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::13) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS0PR11MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: f2feedc3-c2e8-4c63-89b5-08df17bb444d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|10067099003|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: XFtSn35DtueBbX/rnmMggL/cPMAuAw80kV0zDUIcnK9zqK5sp1Qk9vl76JPF4kQOJRDPE3fZqGXfxbK7Bb2Sa+xdNopDZHTTx/mvX/s8+60/XpHKLf7gqYlzDIlbh3F79q7/G7ild82lINUG9wHgJbvcHjB8CSGk1CD/UZrw9cZVQaEGdVdfKLd2TsWai8d8buujmcWNX9nfvTx0qqOER0RsdauShEUg8OiBI0Ser1pD6rAL//2IZS1e3hxmNyL52CMIHZymOmvcXwFk5UeKROCl0r0X8SaBvLYWygIuU3ok74N2JVwsqAJ84e5lbGPL+fHa+B3XkjNhDL3HCpQn+RKPrffGYLW5j4kcJf83sUV3HwEUf706KdnE6xxE/6aoOmfOWO3KsyRaKg+FTS84jb1bWtC2egKplvlFan2RHWHnnPDOZsUOpgX1v3nJFqotmGYqiezrZ2e7EprFPRss3AmQVmJtQYk6BBs2kJfMRLtZZUGEvHZiM//Yw8fgRMENmkHypndFycqoNtO1xYSUxLqkHarplaFW2uZsu4rpDfNI2Wf6NuUOwackqLiERHpTvzGATLG0T1g3hsFZoDW4Izzs+x0H5lQQXRM6vRKNQT4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF691668CDD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWc4UmZldVUyeHlCb0tPbDM1V3gvNkxQd3VHamI4MXJxZm1sd0xSWllFM0hM?=
 =?utf-8?B?RUFpWjN0U29qWkdqdGpUVEMySjUrdFRsVnRVM2N5SHlYUGdrUk9QLzRSWklZ?=
 =?utf-8?B?RjVJckFsdndwd1ZTR3ZnVWUya2pJbjcwWlVvMDk1ZDJmU1luckFjaE9vK3RU?=
 =?utf-8?B?OG5jaVRURFQza2N2TDRLV0ZpM0pldGdGTklPOThaMytPaUs2OTdSbm4wQVUz?=
 =?utf-8?B?OWhRSlVFbFVWSW9HR1RUZVlDN0JLSEc4MUpMMzF6bUFGV1V6VG15eEtGbXda?=
 =?utf-8?B?NnRPZHZ5Y3lyNGp0WFVzbk02RXFkVk1XTXFZL1QxY2gxSFVWWWVEUmlMYldV?=
 =?utf-8?B?aU1HckdXbXBLOTh1QlpQOGNoNDJiR3ZGdnBKK3FqRWZmSnNheUdDc2YvbEVG?=
 =?utf-8?B?VlNXZ1Zxbm53K3ZqcmhPK0M1RWRJMmc3cXRta0Zma0UyS1ZnZmpEN2FnclZp?=
 =?utf-8?B?dEhoejJIcWtZeFJxQlgrbWp1a3RGTDBYYi9laW9aZnhsemZhc1hEVkZVanli?=
 =?utf-8?B?NFRUM0hzV0lnRHFUa3IrN2NIWWp0d1gzQUpGUGRLL0JiQ0NEK0VjamMzOElR?=
 =?utf-8?B?TGd3dE1RSGpIb0ExT0R5WURHTmtuVDBwZGFRb25IR29wd1IzcEJtVFRKWnNP?=
 =?utf-8?B?cGZMUTJ5N2J1T2FkaFdxMityTUVHdVVGVTZUYnU5RnI0U1BWdi9YOHJKdGtP?=
 =?utf-8?B?ZW9lcld1UmowbjV2UUVzOVVrczhlVERaK3V1WVJqdEJMZ3RXei9pdi9EcG1H?=
 =?utf-8?B?dUc4T3JSUDlwVDJVQkZNVW54WWNCa0ZYaXMzR1A2RUZienp1bjI0U0NGcyt5?=
 =?utf-8?B?TFJvc3EralArMWY2SzRrY2VqMTFzWnIrTU55ZmQ5TkdxV3ZGRFdnK2FjTWRU?=
 =?utf-8?B?amZ5T1E3dm4rL1hJaEtFZzE4MCtZdld3STdYalJGYU1TeE5Sd0pBeWZWTG5B?=
 =?utf-8?B?MU5mYnNhbVVqRGg2Rk5kY3FwWjgyWnJiVVdxYUJXMzRILzM5b2FGeTdKVytT?=
 =?utf-8?B?ckZ6RlRFSVcvVG43ZXNZaU4veUlPWjE2RmRKWldzcUlsaUJUSEI1WWVhSHAw?=
 =?utf-8?B?OTl6TjJScm8yY2ZsRkNCbEM5ODVjL3hUclZhQWxvak1PS28vZXRPaUp0YVBP?=
 =?utf-8?B?cS9Ra2tONHNHQmovWjhCQ3AyVlE5QkRLYlBrUFBpa05uWDh1ZVoyMys2MDdI?=
 =?utf-8?B?RWNNNGF0ZzNiNlRjSS8wOVJSa3BLTVdYamxndnFjVUFhRnJVZTJmeHEvN0JU?=
 =?utf-8?B?Y1BzSnN1TXpRV282OGcvdE9NdnJxNmwreVpxWGZSMUkwMTcwTk9ZSUl5R1Zs?=
 =?utf-8?B?YXZsM0I5aEhpTFhrRDhJa05ERmpmcVg4NDRkV0VHOEpNS3JWUVdzZHRxTXFM?=
 =?utf-8?B?NVlRV0dOMnJMWlRObWRkVDNacDNocWtKcStBVFlMbkoxU0lZOEdudThCOVJh?=
 =?utf-8?B?UmFUQmJmV1U1NjdMaHhSbzE3ZVVhaTRDem56cXFESzRjTmsvS202K2ZhZ2lm?=
 =?utf-8?B?RDNiOTBVakI2YWF6RVhTelF3YnExUlVMVUpyS2NvaFlsSk9WUlRMeTFDQUNw?=
 =?utf-8?B?MFYrY2RYc3ArV20zNXB0dXRUbUFpSXBBejFRcG1wZFlmZTJXZ3NJME9zNyt1?=
 =?utf-8?B?Zm1mcExPUXpqTDRrREJoV3AvdHhmYWZEVDh2ODhyMnVWVUwzbW1vMmtiMGNq?=
 =?utf-8?B?VHB0TlV6Yk93VklxcWUwSFlPaHlJdm9yQVVhMVMyRVlldDIyN2h0ZGFSMzMv?=
 =?utf-8?B?S3VRWDZ0MUk2UXQ0S2dPcUZCOUpWcllXNUxReEZUbFpKTFBBNEJoUmo0c04w?=
 =?utf-8?B?NUluZWxRczV1aVRDTldCQk1IVlBkenZveWcvSTM0YmdLSVp0Y3NzUzdZSW43?=
 =?utf-8?B?cDR6eGhEYURUUmVidTNkSkFCejJCbENYdEJXZ1hyRUJvdEZSMGZJcTIwemhN?=
 =?utf-8?B?ajkxY2tXaTNJVG5ZNHlQcmZDUlgvaHR0M0dtcm5qbU9hQy9lYi9VRjFCNy9R?=
 =?utf-8?B?dGljZjBkaGdZRU5Ya1VOWDhBR2k0bXgrZEkrK3l1S3RLV2d5SitlMGJOUEFa?=
 =?utf-8?B?eWFSemw4Q2Y2VE5WR0FyaHZRSVZVQjZzWVJCUm9HS012RDQ5cGdoYlVabmlu?=
 =?utf-8?B?ZEN3cWFSdVc5ZVlvZER4M01GTVZjTXFVRFpiRW9vcDcwYkZSRGJBMDY5UFJX?=
 =?utf-8?B?SVoveTNRcS9WNTVBUVRkS3ZDTEhsZ1NmOUxRVDJ2NHJuajBhWktFV1FsU1pZ?=
 =?utf-8?B?REJPQVdkR0d4blpBM0duV0VMZ3NCa1BKZzJWcGRpL1h0ZWNWRjZGYkQ5NmU5?=
 =?utf-8?B?ZDJTRzYvR1ZkRHYzUU91VzArZU1Ib1BXUzJFdnhXQmt5SVVwdDBGN2pONEI1?=
 =?utf-8?Q?iyvy9Qs7sRZQOnIY=3D?=
X-Exchange-RoutingPolicyChecked: 3Y7lDHo434MTSmsSfPZHqRInDU/fjk5JHx8Oy7FyaaHSFsDi6P0PdlppMTxaOgH4BCPPPcxgyYd6NsrX4P/e/GD6mt8Iia9O6Q0pU6dsiEBrygco6RbF8Mfn6zMTGVILucGMY8jhA9U8mGGF1aZoD+1EnZ+ixkejk7qMcJ+wngPXjEknr78wOHl2tsMtI4/NFyTE1rq7dq4Qnq+Fyju9KlJSnapxbjR3xWyXfHapNZrpxFqErowpz0eQrIusGMQDkekZI2AS3EUXwOAxWQSgVUIBbbQOGfZ130Zq4WfgJ9g8udvuvHA31yAa4ISK8DNaKgXQRrTlaDsd1FVZMrKB8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: f2feedc3-c2e8-4c63-89b5-08df17bb444d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 08:35:18.5425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRs+7G7jwPg4tdK6I9yQzgXFacc1ykxYD75vJCabTOtdGYSzpDShdVz3vLt2MVx/6mNL3fuNOJAc6N8+BpFLEheVF5NQ7+lmf9LczhlVt30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7408
X-OriginatorOrg: intel.com



On 19-09-2026 02:32, Matthew Brost wrote:
> On Wed, Sep 16, 2026 at 11:36:32AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [High] drm/xe: type confusion in xe_svm_devmem_lru_bump() due to unverified cast
>> --
>>
>> commit 09484da3688fb659e04396330f11c6ca63c00b90
>> Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>> drm/xe: Bump prefetch BO LRU via GPUSVM devmem callback
>>
>> This commit adds xe_svm_devmem_lru_bump() and sets it as the
>> drm_gpusvm_ctx.devmem_fn callback in the prefetch worker to move backing
>> BOs to the LRU tail during get_pages.
>>
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>>> index 6c3033fc4db73..7de6ed818d45e 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>
>> [ ... ]
>>
>>> @@ -1612,6 +1613,25 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>>>   	return err;
>>>   }
>>>   
>>> +/**
>>> + * xe_svm_devmem_lru_bump() - Move a range's backing BO to the TTM LRU tail
>>> + * @devmem_allocation: The device-memory allocation backing the range's pages
>>> + *
>>> + * Intended as a &drm_gpusvm_ctx.devmem_fn. Runs under the GPUSVM notifier lock;
>>> + * the dma-resv trylock avoids inverting against eviction/shrinker, which take
>>> + * dma-resv before the notifier lock. A contended BO is simply skipped.
>>> + */
>>> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
>>> +{
>>> +	struct xe_bo *bo = to_xe_bo(devmem_allocation);
> 
> Based on Sashiko feedback - we probably want a check here...
> 
> if (devmem_allocation->ops != &dpagemap_devmem_ops)
> 	return;
> 
> This would future-proof us if we ever start using SVM with device memory
> sharing on non-Xe devices while still sharing the same
> device_private_page_owner. At that point, we would likely need to
> rethink the LRU bumping, perhaps via a dpagemap_devmem_ops vfunc, but we
> would not immediately explode.

Agreed.

> 
> Matt
> 
>>> +
>>> +	if (!dma_resv_trylock(bo->ttm.base.resv))
>>
>> [Severity: High]
>> Does this cast safely handle generic device memory allocations?
>>
>> If userspace maps device memory from another DRM driver into the SVM address
>> space, hmm_range_fault() can return those foreign device pages. The drm_gpusvm
>> core will then loop over them in drm_gpusvm_walk_devmem() and invoke this
>> callback with the foreign driver's devmem_allocation.
>>
>> Since the generic struct drm_pagemap_devmem * is cast to a driver-specific
>> struct xe_bo * without verifying that the allocation actually belongs to the
>> xe driver, can this lead to a type confusion and invalid pointer dereference
>> on bo->ttm.base.resv?
>>
>> Unprivileged users mapping memory from multiple devices in the same process
>> could trigger a GPU fault or prefetch, making this a potential denial of
>> service vector.
>>
>>> +		return;
>>> +
>>> +	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>>> +	dma_resv_unlock(bo->ttm.base.resv);
>>> +}
>>> +
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260916112828.2528881-6-himal.prasad.ghimiray@intel.com?part=3

