Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792505;
	b=jllVrSuBY0m7YPVN5KcCf5zspDdiMIVXJjcdnZ7c848xvBQkv7M4ytzPwjG22ZeG4/SG
	 PNS5FPm5rLTVZkU24MwH8yIsr2W3Tf0rKEqHX8f/kP2SbO8b/cjJ5eBWY1AIRR8XS7q2T
	 1dECgRwFGbgCcoXgOQ2Yxrgs15esPh9CxDoebxq/He2vlZGv3kM/emSYvUzDkNQYfIJJ8
	 cLAy4vfvxqnPUtgHaLsmfBrD1jOk27z/+IP0scHSbFt/PfnIU0hnDvSaHJDUw7HV0k0W0
	 31kSrHSZ66j0bbQcuGAXulbc8/6jYYr2I+4zLJS5jhJWc6Vjt5rbZtkuokvL6dLiBVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792505;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Pl7eYpVNCziZD2XZ6oIeaBCNINvOfK2Nc8AqEeMAmj8=;
	b=1dTBUdrkD6ceyW+taszyA7fF/YRxUYftJmh8J9DMSxpWspq235DFT2dWAahJTZRrLAlH
	 +L263WvOgcPf4+W4eOHxQs0HIyk1tQTZbElAEtzolKyPd2E3mG3yys6l+zWA4XehoQRVI
	 KddjEYiGauvOLXP0qlvUpseyZNViB3wbucOHUeJbEHZjBk8B+xjsspDiAJZL2vwyO6+3A
	 YITnrIZ5Sas62tq+gkC5qMvmGCJ+1p5ZAk7QBeZWUcGo3AZsraoMULRH3zvN/S/dZMLNf
	 1uR62mx8x/wrEogn85UQAUmj+LXnEokiY/ZEH91m/fyRCZ+Q0IyCNFee9hzE0q2yYlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="tM/cNcUr";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.20
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010020.outbound.protection.outlook.com [52.101.56.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82054606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 11:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82054606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tM/cNcUr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjRjD08625CfreiyP4DpUtONwpAxLh66g0Tw2xKaJzi2YafYyaFtq5kgTe1eepGiTX6Kh7QWpcJsXHFbXtfwe+GURpgIxtUDoInbluPlgxb6x3iMELh+ZdZsCn3gCjn3P9hlXLAYHTcyYVu74kaEYHh3XXNfuZWY2tjolEkyPxuz8YiNVjOxFEOhQDzyMOQ2CUW1b2YbM8Y3BV8jNjNOrdYTDKwlGa4bqkurOZvde86a6+UXGxZOLm0p6Rn7cj4YvIKn2bCfw2HceCrkijJaTag5CeGmGZmHzlZ2AmPQnzexTurvamq03q9AJos2Bw5SoPkOvfbSgRgja5n55u4M9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pl7eYpVNCziZD2XZ6oIeaBCNINvOfK2Nc8AqEeMAmj8=;
 b=g4bcpm9sT3YVNF0a1nDavJ/OPqmD8MGNlD8MCAhgljXcnw54WQlebO8K4Ttd+pRgaesIOz10fCIBygtGWha82aBA5LZQvFq2KcGPlXOqEgdT2PtPaZpdtkt+sBUarmxyweZzDFQfSlSFXr+QA6JNdHpggjS3Xqm3YijofHAYUlsVpDA8AbjjrsgFcmRiFOdUxkOiwa3prTXgYpQ/r9gCuDUBs+MvQa3r06qtTU/eaE16cpJWEA+cRq/zyjyqvP2GiLy5WuYN67VCQqII5jDZDeaYQNax3FJyv6iMWlmAdXpqXiMJ5hbvrhu/4V5BOWuyuaaS6+f+E8N5TPhjvkcykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pl7eYpVNCziZD2XZ6oIeaBCNINvOfK2Nc8AqEeMAmj8=;
 b=tM/cNcUrROf3Rqxwsx7mmEy5Ha4yeoRm8T4ZzRHlBHd64sW7Hjjq9qdFEoOFVcluFv4sv6KvRWrGql9tDM/FOp6S5FwTNtiWY+MiCb+sXU40JmkcwQT4tvsX343e2ekq5BTkfs1y0kFgVQKk/qG+Er/t9y1K60ToJeAgUX3iMQg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7771.namprd12.prod.outlook.com (2603:10b6:8:138::6) by
 LV9PR12MB9805.namprd12.prod.outlook.com (2603:10b6:408:2ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:41:40 +0000
Received: from DS0PR12MB7771.namprd12.prod.outlook.com
 ([fe80::9a3e:791f:33b6:3d8c]) by DS0PR12MB7771.namprd12.prod.outlook.com
 ([fe80::9a3e:791f:33b6:3d8c%4]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 11:41:40 +0000
Message-ID: <3884e89f-9c0e-4b24-8f3d-365c0e2732eb@amd.com>
Date: Wed, 4 Nov 2026 12:41:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/unaccepted_memory: Do not accept ranges that are no
 longer E820 RAM
To: sashiko-reviews@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Ard Biesheuvel <ardb@kernel.org>,
 Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 linux-mm@kvack.org
References: <20261102113127.161823-1-pankaj.gupta@amd.com>
 <sashiko-outbox-195153@kernel.org>
Content-Language: en-US
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <sashiko-outbox-195153@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0278.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::15) To DS0PR12MB7771.namprd12.prod.outlook.com
 (2603:10b6:8:138::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7771:EE_|LV9PR12MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: dd06a91d-fd39-4501-0003-08df3a689730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|6133799003|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003|261022075727099003|261022105027099003|261022115727099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261009223027099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	F57I8I7YarY53Dt5N2znxTS+V1YOwcjGeWy5jA7xySsg5tNsQDs3WSfpC+FmJ7E1lWTMnCZCCQE1oG0+k93Uarj6torc2NKRjh5vZN2NytL3N0Ik8mv4nHzyyfIpmwgCJcO+8s2e5ITDMAuJZbYYYR5ZUunwrdRLpuDtmbyaYqu3gH+O2W3pQ5JnUpSbyeiLTmajYD3cAWgi7EKWb1pzj1fSZzR73d03cTO8hD6IaF7vn9Z0X0otY4QFCJu1m8sfU+BPMJuZFIcS2ll9wsZQfDnVO0Nlxddaln1G2mSVPbjW1PLS1KB8dTrZLNoceCbJBwuAxylS+f0JECGuEVWn27ZBEm97BttBcYqcmdV/uuGFLqMdfRR5tR2g5RoKaa4f5asVDkthwk9TYwI5ddhOJERCWYqLDXldK1fdF1160y5X5UUdkU/kRDhVY/5sv38sbmfURo5Pj+yNTuglvYC9BC7YDf35VgZa+rx72mn/4RL9no6TwI7rM2YyfSGYnucxazOE/CeNxsVwZUhrO2Y6uW6p2Wy4wfOIzvWP9YNEbm7QpBxwqiSJvFgIkcc55FQ3Y5bBLRW539P05LVlSao1M3nUrFGY+EKXs8NTYYKJHlPWcsU2kUWL22s8+3wpezyVw/JA84w9I0VhwJOW/07omvLVUYClHo89dM5ZvO1CPgg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7771.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261022075727099003)(261022105027099003)(261022115727099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261009223027099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2o2SVViNW9KTnZRaHgzcFFiOHA3Z0EwM3hTTHlJU3Zha2hqZy9ac0ZVV0FD?=
 =?utf-8?B?TVdiVEdlOUwwdmJsUStrV2tOdEN5NE1DeThlZTFhb3JTOXdLbTNXK3dpYWVT?=
 =?utf-8?B?ZlRNUUxqUTlhc25wTVpoRzdoWVlOT2QrWkM3V1loSk1NZ0xTVHNkUjNGSUNB?=
 =?utf-8?B?cm0rUmxXeGhGVjE2NU9ETG4wZlExd0xkcS9FSGJjOVhtTDFOdURzcUNDQmJL?=
 =?utf-8?B?WTBoOFVxNnZpTGY1RVRVM2ZuenV0NWFJVHB3cjRpbGhFL25qWmNOcUMxeEg1?=
 =?utf-8?B?Ukc2dDRlS01mY3h2L3BCU2NKb1g3RE5mTFpKQklYbEZLbmZ1bXJpZDVUeDNQ?=
 =?utf-8?B?UlRQU0ZCVlozTjcyYmhjSzFDQ25qdXFKRlNBZW01dVYxSHpzK0xaZTFaY1FC?=
 =?utf-8?B?YW4zbk1BdktGMHRlcm9yblZONnlpSlg1NXJGdmFzUHo3UXVMZDFmNS90eXpt?=
 =?utf-8?B?N0R5YmRMdmp0RjlYa2ZUNmVuOXBsVEFIOEhDbVczR3lZNDFNVFlaWFVaWHVZ?=
 =?utf-8?B?emVSbFg4VGIwTUtpMng4Um90MFkxcXQrT2JxMTVhaXFmSUxIZHdVdUVWSENa?=
 =?utf-8?B?WktVeVRFdE5oTHQ1djl6TlJ5cTFFYmhVVVppSnY5TVBUN0cwQTloenpYSE5Q?=
 =?utf-8?B?SEdCWGJlSktzSy9BTHFnd0sxZnZhekU4amYwNy9pd1M1bTYwK1pXSSs4bDNo?=
 =?utf-8?B?cXk3VDhwYmFwRG9aV3Q3azRxMjQ3NS81SUh2VU1UQkxDZ2xsK1UzcGtLb2hj?=
 =?utf-8?B?djdvVGxTejAzK1FXdzN0QjYzMU9ZUVdJb285YkJZYXhQam00UVU3OVg0Y01W?=
 =?utf-8?B?b2VpYzVybUJONjZDYkhMZCtWRWpNRmFOZ3loMFpBeTVYaWdrUTFEN3JDYmsy?=
 =?utf-8?B?eTFoTDBzNHBkd1ZINTRuWGVEK2IyMVN5OWhlN2Z3WG5GUnJwT01tazRVb3Rl?=
 =?utf-8?B?aHZ3cjdMZXAvaFU0NGlxK1FESXMxZkMvRGU4bmZEZEZwSXBiYTJnVTNSdVk5?=
 =?utf-8?B?UEhCMmpYVm5EakNKL3o1aFlsTXJUUXF0WXFyREJlc3lsR2p3L2MrQkIveld1?=
 =?utf-8?B?NUFFYlJBMVRJM0tEVnQ3eWRQVlp2amRleGZXOC9rVUVId2VFQ0o3S3VxSG95?=
 =?utf-8?B?Vy9pQ0JWcnNXalNFWFFCQldEVDdoQ0wxRjRDZEhlTmxvY1RkUzFiZWcwQ09a?=
 =?utf-8?B?QlB0UnBRdEp5cjJ0ejBNOEQ4cnBWUE9wWDFQQTA2ZEZiWGdja2RvdVI3YlpC?=
 =?utf-8?B?aWpRazlOSlBYU0tULzE5S3lpRHpHZDlUNWVJOHNuN3R1MlpieFVOSG55ZWtG?=
 =?utf-8?B?dWdJdlhnVHRGWmpZOVFJV3pKZnBRVHhRbEpxQlZydzNKL3h6MVREQUJDUDNs?=
 =?utf-8?B?eElFVTBTeTZ2WVFvbjFZQlJnT1Q0aGxXeWVsRDJwM1B6eW41djFQSWZpNURC?=
 =?utf-8?B?Q3JpV1BFemtPc21pYmo2WDVDMzNtY3BscDY1YkoyWE1WcG5CTjZDSGlvQ0VP?=
 =?utf-8?B?dlpYaExET0t3eWVCTGt5OUVEYlpZNERIUmRTRGtEVldUbmxOblNRekZUc0xB?=
 =?utf-8?B?K3M4VjRXYlR1OEZhZnNpbzVyRlUvS1JrV3c1OHJvbDdKSU9rRmo1RnlaVVUz?=
 =?utf-8?B?UlZxN0VDRUQzRnA1eTJsSEU1TTNTL1grbWx4N2ZCUW9iaGJ0SEdhQi9YK05M?=
 =?utf-8?B?SmxpWldyTGFvV2ltcC9nbUlXQUM0dWtNazFPTDVLbEVSWVZQVDZFU05sT1dD?=
 =?utf-8?B?V0JYLy92K285RWpnSEtUejRrRENPY2tEOGtRVGxPKzd0ZEU3ai9qZ25UcUdZ?=
 =?utf-8?B?VVl2K2toaWtNeDIxRHJ1M3dzTFhuZEFpV3dNVGJVOXlaWXh6QUc0TGIwSkhU?=
 =?utf-8?B?VE1aa01oS3FCQVhlZWlqMWRuOHA5RnpUcVVRSEMxN1ZCamZNbGQyTnV6Z1k2?=
 =?utf-8?B?OFJ0SHY0TkJFR0RwUzVBcSt0QnM0cXlTdTc2Q0JNcjliR0djS3hlQ1RqeTln?=
 =?utf-8?B?dmJWSWFycWovOWpvTHJFNVlmWldTb2hQQm1IYm5GTGdERWxKYnRIQzZMTGM3?=
 =?utf-8?B?RnEwNTY0NDkxZW5CaVYrN0liV25iZSszeVdzSXdUempRRE4rV2J5SmttTmpQ?=
 =?utf-8?B?N2paRjVMUEZkS1dReUhDTFA5NE1DVmZOb0J1cUQyRVRRSXpxTEI3WitLU3hI?=
 =?utf-8?B?WEN0R0xaZzFjTmh6RXRKVllncTE2NWQyWDRrd1RyM2pRSjYwV3VYRVIweXMy?=
 =?utf-8?B?UkI5bmx5RTB1eEZrZVhEQnhHUktJTTN2eUl2QzBtdGkrWnRVdG5kSzNKY3Rn?=
 =?utf-8?Q?m+5D6athKKJFG1Q7B3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd06a91d-fd39-4501-0003-08df3a689730
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7771.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:41:39.9980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eeGGGkOc6d3krd8jMH4zZr6/6qEm2RD0u3Rt/yTs11OczELysX9vDHICbj65mxRJYPfSuSBJrf3DoftuJungcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9805


> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] x86/unaccepted_memory: arch_accept_memory() desynchronizes unaccepted bitmap
> - [High] x86/unaccepted_memory: unaligned E820 bounds passed to __arch_accept_memory()
> --
>
> commit f56630bdf157fa53e09d29e75f1fc454adb6cd1e
> Author: Pankaj Gupta <pankaj.gupta@amd.com>
>
> x86/unaccepted_memory: Do not accept ranges that are no longer E820 RAM
>
> This commit updates arch_accept_memory() on x86 to iterate over e820_table
> and only accept subranges that are marked as E820_TYPE_RAM. This avoids
> attempting to accept memory holes removed via the memmap= command-line
> parameter.
>
>> diff --git a/arch/x86/include/asm/unaccepted_memory.h b/arch/x86/include/asm/unaccepted_memory.h
>> index f5937e9866ac1..744f1a993352c 100644
>> --- a/arch/x86/include/asm/unaccepted_memory.h
>> +++ b/arch/x86/include/asm/unaccepted_memory.h
>> @@ -2,10 +2,11 @@
>>   #define _ASM_X86_UNACCEPTED_MEMORY_H
>>   
>>   #include <linux/efi.h>
>> +#include <asm/e820/api.h>
>>   #include <asm/tdx.h>
>>   #include <asm/sev.h>
>>   
>> -static inline void arch_accept_memory(phys_addr_t start, phys_addr_t end)
>> +static inline void __arch_accept_memory(phys_addr_t start, phys_addr_t end)
>>   {
>>   	/* Platform-specific memory-acceptance call goes here */
>>   	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST)) {
>> @@ -18,6 +19,26 @@ static inline void arch_accept_memory(phys_addr_t start, phys_addr_t end)
>>   	}
>>   }
>>   
>> +static inline void arch_accept_memory(phys_addr_t start, phys_addr_t end)
>> +{
>> +	u32 i;
>> +
>> +	for (i = 0; i < e820_table->nr_entries; i++) {
>> +		struct e820_entry *entry = &e820_table->entries[i];
>> +		phys_addr_t s, e;
>> +
>> +		if (entry->type != E820_TYPE_RAM)
>> +			continue;
> [Severity: High]
> Does skipping non-E820_TYPE_RAM ranges here desynchronize unaccepted->bitmap
> from the actual hardware page acceptance state across kdump and kexec?
>
> In drivers/firmware/efi/unaccepted_memory.c:accept_memory(), unit_size-aligned
> range ends are extended by an extra unit_size to act as a guard page for
> load_unaligned_zeropad(), and the bits in unaccepted->bitmap are cleared
> unconditionally after arch_accept_memory() returns:
>
> drivers/firmware/efi/unaccepted_memory.c:accept_memory() {
> 	...
> 	/*
> 	 * load_unaligned_zeropad() can lead to unwanted loads across page
> 	 * boundaries. The unwanted loads are typically harmless. Map an
> 	 * extra unit if the end of the requested range is aligned to
> 	 * unit_size to avoid page faults on unaccepted memory.
> 	 */
> 	if (!(end % unit_size))
> 		end += unit_size;
> 	...
> 		arch_accept_memory(phys_start, phys_end);
>
> 		spin_lock(&unaccepted_memory_lock);
> 		bitmap_clear(unaccepted->bitmap, range_start, len);
> 	...
> }
>
> When arch_accept_memory() skips a range that is not E820_TYPE_RAM in
> e820_table, accept_memory() still clears its bit in unaccepted->bitmap even
> though the pages were never accepted in hardware.
>
> In a kdump kernel, e820_table only contains the crashkernel reservation as
> E820_TYPE_RAM while the panicked kernel's remaining RAM is omitted from
> e820_table. When the crash kernel accepts memory up to the 2 MiB-aligned end
> of crashk_res, accept_memory() extends end by unit_size into the panicked
> kernel's adjacent unaccepted RAM. arch_accept_memory() skips that range, but
> accept_memory() clears its bit in unaccepted->bitmap. Later, when /proc/vmcore
> is read, unaccepted_memory_vmcore_pfn_is_ram() checks
> !pfn_is_unaccepted_memory(pfn), sees the cleared bit, and reads the
> unaccepted page via read_from_oldmem(), crashing the kdump kernel.
>
> A similar mismatch occurs with kexec: e820__memory_setup() populates
> e820_table_kexec before parse_early_param() applies memmap= or mem= options
> to e820_table, andarch/x86/kernel/kexec-bzimage64.c:setup_e820_entries()
> passes e820_table_kexec to the next kernel while sharing the physical
> efi.unaccepted table. Both kernel/kexec_core.c:sanity_check_segment_list()
> (which calls accept_memory() on kexec segment destinations placed in
> e820_table_kexec RAM) and the unit_size extension at the boundary before a
> memmap= hole will clear bits in unaccepted->bitmap without accepting the
> memory in hardware, causing the kexec load or the next kernel to fault on
> those pages.

Valid bug. In v2, I will clear the bits only for the units in which 
memory was actually accepted.

>
>> +
>> +		s = max_t(phys_addr_t, start, entry->addr);
>> +		e = min_t(phys_addr_t, end, entry->addr + entry->size);
>> +		if (s >= e)
>> +			continue;
>> +
>> +		__arch_accept_memory(s, e);
> [Severity: High]
> What happens if entry->addr or entry->addr + entry->size is not aligned to
> PAGE_SIZE?
>
> Entries in e820_table can have byte-granular boundaries from firmware or
> command-line options such as memmap= and mem=. When memblock is set up in
> arch/x86/kernel/e820.c:e820__memblock_setup(), partial pages are trimmed via
> memblock_trim_memory(PAGE_SIZE) and left unmapped in the direct map, whereas
> e820_table retains the unaligned addresses.
>
> Clamping s and e directly to entry->addr and entry->addr + entry->size can
> therefore pass non-page-aligned boundaries to __arch_accept_memory(s, e):
>
> 1. On TDX, tdx_accept_memory() -> try_accept_one() requires start to be
>     aligned to at least PG_LEVEL_4K and len to be at least PAGE_SIZE:
>
>     arch/x86/coco/tdx/tdx-shared.c:try_accept_one() {
>     	...
>     	if (!IS_ALIGNED(start, accept_size))
>     		return 0;
>
>     	if (len < accept_size)
>     		return 0;
>     	...
>     }
>
>     An unaligned s or a trailing sub-page remainder causes tdx_accept_memory()
>     to return false and __arch_accept_memory() to call
>     panic("TDX: Failed to accept memory\n").
>
> 2. On SEV-SNP, snp_accept_memory() passes vaddr = (unsigned long)__va(start)
>     and npages = (end - start) >> PAGE_SHIFT to set_pages_state(), which
>     masks vaddr with PAGE_MASK. If s is not page-aligned, vaddr & PAGE_MASK
>     rounds down into the unmapped partial page trimmed by
>     memblock_trim_memory(PAGE_SIZE) and faults in pvalidate_pages(), while
>     (e - s) >> PAGE_SHIFT can truncate npages and leave the last full page
>     unaccepted.
>
> Should s be rounded up with PAGE_ALIGN(s) and e rounded down with
> PAGE_ALIGN_DOWN(e) before checking s >= e?

Also valid bug. I will address the alignment issue in v2.

Thanks!

Pankaj


>
