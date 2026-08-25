Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7977A38330F
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 06:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787640335; cv=fail; b=cB+u6pgbXmswxR6EQCCwfAKFOWRtOJYcqO3QxIYkYLq06c3uUa+i9+LfcEHEgWVUn6kC4TW7pi++TkmsRlyegPYtObxN6Ap4cLe7GzfCWCz+FRcv/zu5v1j2Ysv/hUJkyGKq9GNpklaaiwSRk0dOh2NTO9+wcDNFO8ATfAwK3u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787640335; c=relaxed/simple;
	bh=sBscAZDxFN0GT42MyoYbCz7VqX/xIyYk8l/Va/tc+lw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WyYLKGlDKy9NFvjlMSHT9Bc1KOrGzc+EnoglRTKOfT7OYnv7iDV3TapnRmY5NUpFAzudpXmos60F25hxyJmzv9lSndtSRr1rmxeIADdmZHbt/SzGKtniXwkfyfh142vwBnyJgoJOgvXWnsU+2mPxgUask1SVzGVF1Vy/jIKvqw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWyHzSLI; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWyHzSLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787640333; x=1819176333;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sBscAZDxFN0GT42MyoYbCz7VqX/xIyYk8l/Va/tc+lw=;
  b=IWyHzSLIjrH8n9zlk7w+tp+6630leRDDJ45o6rzDrWSYp5HNM89iTIKO
   w65NUkvA7ssqAqusY9b5yaAAqtfzJ6i00I3wUSS69nf5a46EUNhY5tZeA
   212oUotQcyRoodfvx9+FHMnVPv06rbuM0RnoogyEKWSPThnzo/3KzXyEE
   hWjMd87wa7yJ11nNFaq03HBXRLsUQEYUNfbukX2IKoXMQE+U46gkjgq5K
   sGbYRbCicafw594fLEzsP3D2Mcs+z2b0+Wvu+BvMFUITMjlYoxp05rUG/
   DnOZ9cTQWhNAIBF5inW0hBCDv8dSoeUVsKjh7dtc6bnkhTAG2fLSdoNK1
   A==;
X-CSE-ConnectionGUID: eHHePwj/SP+954KBp/nDmA==
X-CSE-MsgGUID: 5Q2v+bohQ/i7tWyw8VikLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98435172"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="98435172"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 23:45:32 -0700
X-CSE-ConnectionGUID: QgTql39HTfSRGrkdTZA1og==
X-CSE-MsgGUID: h9M9CpouRy61LPrQ1bcnTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="265886531"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 23:45:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 23:45:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 23:45:31 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 23:45:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPqw/8iCqBF+KC/+kKQQdJQNzXjI6KWlXuRCq3Rewi40AJ/9/2jzRhcdZSky0rlSgFKZoWpRU+eHo4y5V3gVzk3+XhX9zC4Y42Z72TRdSakGKRISQ6ILXeuLYcnr4rw7xKA9TFthp+tZr66nM0nPm3xx52SdkSvOFn+FwikS4VuJ7iAZ2dK8rS9fMKcEWQAQEp+OO7ZW5lQmw/hLp64rofEHBLfd9ywEvhbGcuaM4BAqOHaB96f2LaKkvotHYOJ9vyA+dAAHYJV0CxAaNGMKRIKuEWQUb0zO7PomOAZH2tnhZ8D2RwFPOrVdQNCesgh41GJMFppiW3/w2tZcoFIoug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QC8bdEwO/IQUSSa4pzcEvsbwLlFrJq6LV81n1IISus=;
 b=wchL88RNEqb0/ArMEWL9o/kFOe1Zyu6ObyjRVQGZ6XhV1zfBXKnMULPX5C2n+/oZeRJ9zjNUE3+Vik/UKSo4ZDNgMuP4mG1tes9o2K85XofhJ0UUqPjlsw9rRCUr2AOeQMTEDvfGY2LKprhr/TXaMBPXX9711OXR3XfiZ4aeRnmx0fCe0NO0QCX6xlPo81iIPomVHttpMdmXzgVm4GXzirEer5ScApwLSCTyfD5w64HN84v2ysDWoitCGLm5cM/Ixq2LbGn3/b7DFAsMcDJSowJp3/cfg7ZJR08S0Dk6mCR8OciQhdOhmc3ANe5mdJrwaRN8rnkFGisGVl8VRqHgPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SJ5PPF37792A6D2.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::820) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 06:45:28 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 06:45:28 +0000
Message-ID: <de2b3d0f-a361-4c3a-866a-a4cf208bad39@intel.com>
Date: Tue, 25 Aug 2026 12:15:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/hwmon: Detect unavailable temperature sensors
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-2-karthik.poosa@intel.com>
 <20260824185917.D2B0A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260824185917.D2B0A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0055.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::8) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SJ5PPF37792A6D2:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4dcdcf-9000-439e-df8a-08df027472e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|10067099003|56012099006|5023799004|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: IHMzA6/UORYI7RqrFsGMumK4GedJ1VAYyqfoW9vINlTQE7ObAqHLLBpfEccnOBeRzI1UoaWTD+Qd0Kdq51hlI4TNMgZdy4YPZOra+A6JNrQB2Wb1kaDbE5OuOgHm4zXT3f3kiT1VbcVdHAVTclFsrGESr+4dt8u02DnYdJ2W4B5YSu0Rf7LnNkEHuyga9lAL0fDAap1IeZyLE0tJtf8JI/VLsf44z1L4BmgUE+jfYM0Es9irvAd7SWY7XboJLvaA4H935xsE0IrJsst/x6yBXibAUjRzS6itFP3YqdAUEH76YC5537XLYc3s4PLOA2jsbHXvLCQ1qPu5pxPITxZ122rlSpl3CFfh8FOL/w9bYqUaFB2UfyeLZ3hX9cB/E47MBGdmE/KbRw1rOMAASJ1Dqz9ItyVuPNmgoO1hULqfOHyXNc1XSQX+bYFD4jdYr4Jz+AiSvdSoscoFdVi1JOCEVGYC1XHUM+dbbrFLGdCu33WGuyXNewY/oapJECydi+eAMzH9/6qTm+WY5l5Qli2VWCiBb9bOZQLeS3Js9zMnJ2rQJ6fnszCAKfxDkCodIx3rHuJBJpBjRALCG2V/KzkgcnK8QJNsR28+NEhgnJL2eC13bidejODq+ryVOgcTkbhF0SWs0OKuZi1o7ZuhCuqwzJndc5J8JNgLDLRKUCTJdbY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3JIQXQ0S1B5WGZSZndZYmdFcFdzWldMSGowNkxBS1I5MEswS2d6ZXNEeU9q?=
 =?utf-8?B?cWlMUXdLQ3MzQnpPWHV1eXpQZXliK3BwaGYzZDZpRjU5UWJ6eWRaVjBtd0hp?=
 =?utf-8?B?aXVDeXNmSGFuWTRqRDBGdlhxaTlyVlN0MVpDTDZRREY4RTFLaEVDNHp3VEty?=
 =?utf-8?B?VE1VV3IrczUySjZlNlYwWnFGbnAzRmxSYkRKM3Z1dE42N1FNMlV3U2J0TUZy?=
 =?utf-8?B?MXZ1ZW5TNGJKbkpLRjliSURrY0VmdVdiTW5URlNRVXdBTlhKakZVbFpiY21R?=
 =?utf-8?B?ZzJLOFJSMnhQTHFuMmdkL3FYTi9PV0ZSTTFpOVFCZjBINUFNVlNrZXlWNDNv?=
 =?utf-8?B?cGVpRjIyT2IxTWxCMEhaVmYwdnFoRUV0UFhZQy82d0s1MHJOZnREYXdBcFk4?=
 =?utf-8?B?QkVXcmk0YU1ESEFWTTRpNGM5QWFlNTVwVGZQMHR5Mk1NanV6UnVyQUNPN2s5?=
 =?utf-8?B?eVRuWkZlWldzeGFhTjhtclp4RTdIaHl3VzBoRTd1SDdob2xlc01KSzVMS1kw?=
 =?utf-8?B?M1RPUWhyRWV3TWdJeVVGRWlpRlJLdzliTVc2K3pwMTRXTVFBczEvY1Z4ZFVK?=
 =?utf-8?B?MC95NHkvK3RlVkhzOVVGQ0l6Q2s0Y0xrV2lxUnRNMTdzLzBmcnluWjZyV1dX?=
 =?utf-8?B?YjZxbUFrd1VzU3Q0TE1FdFRCWnROenZVdy9SR0QvNG1zcTBZSmZsVkZWOWNx?=
 =?utf-8?B?YlhNbkF4NHltalgxWEwxVkFjUW52TXN3cTVPQnpMWG9PRTl6bms5cUtIOWUz?=
 =?utf-8?B?ZU5ucGNNSEo1dVpFSzlxdWlhU1ZyOURaOVZXLzhWbll2dDVtRnBWTHZBMDZi?=
 =?utf-8?B?ZHBMbmRHWkxiYnloQlhGOUEyOEY0K1JkaXB0N08zbkJXWE5hWTg4Ung5L28v?=
 =?utf-8?B?cnNud2lFeEx6VytwUjQySkVRUXJXRDk4Nlk0K3pSQzZBMVJmdlNPK2dOdkFa?=
 =?utf-8?B?ZE96WXp6dEpoNkkwTmNlZDZVbUlTaFRONWlEcUhGSkFqL2IvR3lZNTE0S0ZK?=
 =?utf-8?B?c0dyTDNxTmE4bFd6Z2RuRmgzbkp2bEhTTlRCa0x3K1l4VlQvaU82QWZpdzNO?=
 =?utf-8?B?VGt6dTBiMC93Vjd2R1JaUDhJY2NYM05yMlFuYVhDSWErNUJuTmhoeDgyUVUz?=
 =?utf-8?B?WUQ2SXNMYStnTWg5RXVjRVh5cGFxL3hYYXJHM0NQR0lJdC81c2F3cS8zSWJK?=
 =?utf-8?B?K1FkN1c1SUNnZnVFdUNVV2JaMVE4STd2cHkzUXl3M0N3UFRrNkFuWnJ6OWgy?=
 =?utf-8?B?b0xpell2TEs5UllEQlRxK216bmFGc2kvdDhqZi9wRnFIVjlkeXF5QzhxU2JL?=
 =?utf-8?B?cnI3c1NkVERaZWVDSHg3RzBPVzlDQjB3aVkrNWUvMTRSbktKSjlYUVNWRkxE?=
 =?utf-8?B?L1BmRFpEWThTQTY4cHoyOTR3OUNIb3N2eGpaK2lGbVpybDdmaTZHZ1YvR2U2?=
 =?utf-8?B?QXJ1QS9VaFplUHBZMzFuODNrTk85dW54WDlrazVqQkkxbGdjU0NNRjRyWk0r?=
 =?utf-8?B?VnB5c0FEQ3p3bHZhbWhmd3pXV2J1TzhnMDZlM2d0ZHk0QlYxS2FJS3podk80?=
 =?utf-8?B?Ynp3Qjg1TjRZTFpNVHBKVlMrUTU0STNHMDdzRWJaL25STllMUXpuTllVK1hU?=
 =?utf-8?B?TXVqaGpLdXJ5bFdyNzlmNDUrWEtjTnVhTm9vYUZ0aWtWRVB6YVltVncrVysw?=
 =?utf-8?B?WFI0Wi83andxdGtYTTFGeDFuQkJsOWNvWS9US21XdThjTUptN0NMdWtZK2pl?=
 =?utf-8?B?ZnBEMnp3Y1YvbEFhZWJqZjV6SUhJMVlHT05GaXB0aTl0bGF0WldZRC9IRlk3?=
 =?utf-8?B?Szl5dFFaQUZZTEJuS0NBZ3ZwL042Unh2Y3crNjIybEtVeUJXZ0ExWE91TEpp?=
 =?utf-8?B?a1d0TVJYbitnb2dNQ1VuZHdTL0RqNmNlcmtSRlVJdGwzYVdacG5BSTlyTFhL?=
 =?utf-8?B?WUFQSElEM3V1N3MxQlc0SGJvUkMwbjFFYWUxVS9CaG4rNG43Sm9odllqcGxM?=
 =?utf-8?B?aTZ1ZjZOMGcwU1JtYlpaZEpGeWZTVjM0L2EzajgwZ2tIZEdGRllQUC9hLy9w?=
 =?utf-8?B?VUxxTXlQTWdRa0h2a28wR0NzM2ZPcENFQk8wV3NwUGhld2xVbDBEUldUei9k?=
 =?utf-8?B?Y3hidE9aaE52d252RDJoSmZraTJBWDJYRCtabk1VcktlSDYzS1lmRXJyUW1U?=
 =?utf-8?B?cmxCWVRXckRQNDU5bE5taE44WDRtUndpRWx4L3FFb3RvTzUrRHdNY3FvNkZ4?=
 =?utf-8?B?N0twZlhoeVJwYUZlSndmWjc5Uy9IdW9DUGxmN3pRNWdydXFoWmVUUlU4TDU2?=
 =?utf-8?B?aXExNDZJU3dQa2xmMG5UZ2tVdlY5MGlIaEMxcE45cjhTL0djZUE4QT09?=
X-Exchange-RoutingPolicyChecked: sj1Hzj0v5etKgt5q0Zodt0OtVsLC16u5RBSfgSNoRMabdCuL8I15NT+Ro6zjO4SL1JfXLtbRRNSzO4F61zMWlh4qEblV/I1ydfK5oD/BJYbDU5Yuz7taXbE2EJqTS8f2dF+koTHVtH+PzeSfF7KgoubMml6mU0fNV4lWO1G9aUlic5zKALEx4FEWj2yhaB4uJ++YkGJJYOsypLhZA7MnuCnL3amXV6S+sZUOmtjFAfuR27j1CaZRMV/OPA4VQFaLOyEzXhYtHkSZYMlSxKakM/RcmGh5i7ja/cfX3+bp8minpN1V+Z292vYiRigSveEHe3lsrS6/2u0QsZ4Xs+Yg6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4dcdcf-9000-439e-df8a-08df027472e9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 06:45:28.0749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjWh9meVXBHYgmw/zK2CyV7S4hgeuEI16ZX/HekJ1faQ4suNopfaXFTnJZyUHLkl+y5x0UXs9UUeAGK4EZolUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF37792A6D2
X-OriginatorOrg: intel.com


On 25-08-2026 00:29, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Incorrect register bitmask `TEMP_MASK` extracts fractional temperature instead of integer, improperly hiding valid VRAM sensors.
> - [Medium] Inverted short-circuit evaluation causes unconditional hardware PCODE reads and excessive log spam during hwmon registration.
> - [Medium] Threshold limit sysfs attributes are exposed for unavailable sensors due to missing validity checks.
> --
>
> --- Patch [1]: [PATCH 1/3] drm/xe/hwmon: Detect unavailable temperature sensors ---
> commit de3d36ad17dd257811068fa1f47a4b3779a65fb1
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Detect unavailable temperature sensors
>
> Add is_temp_valid() to validate sensor presence.
> A temperature reading of 0xFF on CRI platforms indicates that the
> corresponding sensor is not present and should be treated as unavailable.
>
> Use this check from xe_hwmon_temp_is_visible() callback so that attributes
> for unavailable sensors are not exposed during hwmon device registration.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index de3f2aeffc3fb..c15312b0858ca 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>
>> @@ -804,11 +813,25 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>   		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
>>   	}
>>   
>> -	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
>> -		average += hwmon->temp.value[i];
>> +	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
>> +		if (is_temp_valid(hwmon, hwmon->temp.value[i])) {
>> +			average += hwmon->temp.value[i];
>> +			count++;
>> +		} else {
>> +			drm_dbg(&hwmon->xe->drm, "mc temp sensor %d not available, val 0x%x\n",
>> +				i, hwmon->temp.value[i]);
>> +		}
>> +	}
>> +
>> +	if (!count) {
>> +		drm_warn(&hwmon->xe->drm, "no memory temp sensors available!\n");
> [Severity: Medium]
> Will this warning be emitted multiple times during device registration?
>
> Because hwmon subsystem core evaluates the is_visible callback multiple times
> per channel, and the logic in xe_hwmon_temp_is_visible() evaluates
> get_mc_temp() first, this warning may trigger excessively if the sensor is
> intentionally absent.

Yes it does.

We can change these messages to |drm_dbg()| to avoid generating 
excessive warnings in such cases.

>> +		return -ENXIO;
>> +	}
>> +
>> +	average /= count;
>> +	if (val)
>> +		*val = average * MILLIDEGREE_PER_DEGREE;
>>   
>> -	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
>> -	*val = average * MILLIDEGREE_PER_DEGREE;
>>   	return 0;
>>   }
> [ ... ]
>
>> @@ -932,11 +961,21 @@ static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>   	int vram_id = channel - CHANNEL_VRAM_N;
>>   	struct xe_reg vram_reg;
>> +	u32 reg_val;
>> +	u8 temp;
>>   
>>   	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>> -	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
>> +	if (!xe_reg_is_valid(vram_reg))
>>   		return false;
>>   
>> +	reg_val = xe_mmio_read32(mmio, vram_reg);
>> +	temp = REG_FIELD_GET(TEMP_MASK, reg_val);
> [Severity: High]
> Does this extract the correct bits for the VRAM channel temperature value?
>
> For CHANNEL_VRAM_N, TEMP_MASK extracts bits 7:0, which may represent the
> fractional part of the temperature rather than the integer temperature.
> The integer temperature is typically in bits 31:8 and extracted with
> TEMP_MASK_VRAM_N.
>
> If a valid sensor has a temperature with a 0 fractional part (or 0xFF on newer
> platforms), could it be falsely detected as missing and hidden?
You are right, from VRAM individual channel temperature, we should 
extract with TEMP_MASK_VRAM_N.
>
>> +	if (!is_temp_valid(hwmon, temp)) {
>> +		drm_dbg(&hwmon->xe->drm, "vram channel %d unavailable, val 0x%x\n", vram_id,
>> +			reg_val);
>> +		return false;
>> +	}
>> +
>>   	/* Create label only for available vram channel */
>>   	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>>   	return true;
>> @@ -953,8 +992,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   		case CHANNEL_VRAM:
>>   			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
> [Severity: Medium]
> Will this expose threshold limit attributes for unavailable sensors?
>
> The input attribute for CHANNEL_PKG and CHANNEL_VRAM is now correctly hidden
> if the sensor returns an unavailable sentinel. However, hwmon_temp_emergency
> and hwmon_temp_crit do not seem to check is_temp_valid() for these channels.
> Could this lead to userspace seeing emergency/crit attributes for sensors
> that don't actually exist?
>
>>   		case CHANNEL_MCTRL:
>> +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
Currently, temperature sensor detection is supported only for mailbox 
and per-channel VRAM temperature sensors.
We have requested support from the corresponding team to provide similar 
validity information for package and VRAM temperatures as well.
Once that support becomes available, we can extend the implementation 
accordingly.
> [Severity: Medium]
> Does this execute a synchronous hardware read before checking hwmon->temp.count?
>
> Because this uses !get_mc_temp(hwmon, NULL) && hwmon->temp.count,
> get_mc_temp() is unconditionally executed first due to left-to-right
> evaluation. If temp.count is 0, should the condition short-circuit before
> performing the hardware read by placing the temp.count check first?
>
>>   		case CHANNEL_PCIE:
>> -			return hwmon->temp.count ? 0444 : 0;
>> +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
Agree, I shall change this in next revision.
