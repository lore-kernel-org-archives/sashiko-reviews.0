Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794907848;
	b=qgcKdGa6AvI1+wVROKsUMZaS04uyc8x1zFpeci/xXBiLMV8H34LhtYDcCWZ3zBkQo/kt
	 DxEB6RXAfp81FAz63NHJdGxmKNLlltTFJa1Ak8qTwLReo8rnvaqWmyqbGNSxTpfYJI9Tv
	 4fpDlOMOc4b2ABXSr5oq7Fk1ebIHuc7Qb2otbNWuq+A47dP8oQmPrjLq/S88tHkH8Xdcj
	 n2TD6DvVL7pcFha7z5oVaz1yl2xVAiNExbn98s5LTIV+1r1BUPDSe5Kfu56KID5goctwt
	 UFoIwVc5UPnXY1KRfIOmRPtuhVkGAyptPdju0i1OH63tmvjQsNVJfsI9JeDYFUhxVtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907848;
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
	bh=YjqmZ91lg6Ixsq9TkQca79gGEUKnKVJc1sBbphnhgc4=;
	b=QYjmMjl1NQYmAJMYxvHMWMBUM4/7/MPxXrva21D5BTDA/m4gCwUyJzLboGnxB3P6A40L
	 LoONXkvkkNDaTVrufclQlS3rCsYx7l3xOHdYmRjBdpebZhQQpFhQ9+9l70lv49NN9L/Ch
	 IPKo6mZps5Pc+vINbVNhLKswrwOVTEDSs3WNkACMQtHCCAToqsQAWrQlgIW8uVWjWLl5K
	 LSBjEJCDrar8bHFIQ9ePvDU0vhnytp9YBUZrFKq19QVq9N6a5Zhnzqi1ufGM3HhPZYOd6
	 6uej1koO/mqY3+YH59/RBfeMeN8bfue9YaNb9PnW9ZIvCtLTad9Xv9zJAQolSFxjciw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2s4rTb7X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.36
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013036.outbound.protection.outlook.com [40.93.201.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B492606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 09:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B492606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2s4rTb7X
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dls9FgQDwsj1R+MrYfljYzMQ+f349e8Rryzfwte1SBiHwzGeWoC6YiGgjSBSKDlHocjOsvp+32jsUFmPH3HYMqpI/xIEj22dHDsFQhrvzLbm7s/o9H73ZbfxHc4IXjq0Y8ZVLjRKhyGJ6/4rfBTrtzR64PFgEcoiBwwRELpenJl+ADdyWI9bCkIGV5EMPwIk0a1RvZUU6oP462cNYRmstHuupRhgObj3RgLJ+XHhzTx4FCaoeZ7B931Ugi7gxIXZwHTKPXa20z1oXBciPUXezP/23WOIMwwqLyiVrDPtElgORvdBFboenn7NrJNCavZEg+/T9KJxgMLsp+8ZI19GvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjqmZ91lg6Ixsq9TkQca79gGEUKnKVJc1sBbphnhgc4=;
 b=lniRK4xNW9kru+TrENEib+SdqdoFokHDmWgCBuTmFQA0UDshp91iIy7pyfiBGyA/dMGaf6cvwKZvdpfgAz/q8Ch5JAfDw1do4+LQ6E4iin9E7+dxK+gLjhk4yiPEmLLeP4Nv0dXoItP3c0kY0lwcaRWnHemJjUzlkFajImvALWrt+nvJA7jL2yqqbZoMiUX/lx3Wl2rcddvqVANSrvNhUgqqfG+t9r4BC2Hk9hjqyvYCtZkr4IpZW7jF2hmENNbQFJ/6Hei2vworEDexV0IqoME1M9VKEL046RamdlLnJeT6nFxYkIeMFKFTxgVRVxT8ACVGQFCABb4Vs0xz+pz05A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjqmZ91lg6Ixsq9TkQca79gGEUKnKVJc1sBbphnhgc4=;
 b=2s4rTb7X2zyXGS2tG1o+TUgxPbZK+thTKWFFKy2S+POxR+b+42d1NtRTNHN9q9a5/XzwRXwUfxUZULO3GzvgZOET/LJY2jkbJL7o+GysN3ud+2kQa8XSCK7D6ozPF9sJGSHnjy/6gv7LWt/Hm+gbYsm9k8/swuQCY121htEEZxw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by MN0PR12MB6056.namprd12.prod.outlook.com (2603:10b6:208:3cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 09:30:43 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 09:30:43 +0000
Message-ID: <f82e7566-d4a6-4f9a-98db-f959509ce605@amd.com>
Date: Tue, 17 Nov 2026 15:03:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/23] soundwire: amd: remove STATUS_8TO11 clear from
 amd_sdw_process_wake_event()
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, "vkoul@kernel.org" <vkoul@kernel.org>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
 <20261117070906.803139-8-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-218337@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-218337@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0202.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::8) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|MN0PR12MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: d704aea6-36d1-461a-2603-08df448d73a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DITVbjUSV/yBE4ZaI6vgsMye5mT67TFAXX6TAs0eJn1eC5iRUjsCJXmb8MfaeSJ+jxXFPBSfinqzhcsLaAkcY4eC0iak1slZKmMSEQ84jpOcl1RSW85y/7E0E56qpC54k8Cb1rSiyYaszdMTBdYTcWexNp9ZUMX2/XFM1R743fLxZ5kuYfnbm9JyKajxHvYD/l61sC9VeUeEmMBzeqkQKwS9ksZn3XSDUqRgtPFNI1PGSDwzJsMH7kXXgoibAYyEWXE3t5PAZ+IaAyAXoZkpOrz2DFkDfUolxUeEVyGdMXJGnMX9NQ6sUBCccBq7b61/Q8C/RzM4LWL/a9YdEoJpgiR6z/6jBxUL789GLyIBgLuxMsCmVBEH5Erv5/54sQ1d5UbiC7z8CU7x0x8qDoQWxG4XuqacSPKEVyNlPGS30buS8BgfBsi7xz8qpDGEdSm1/6RFZeRuxqqFqZdKU4hop1H7KOnmRY2PxmwIw1YqVoAxomD9qEPx+nm9dqu4glott9l+tICC8QGdI7mimaRPTipntk5uJ5drvLSUcGO8dX4O4Bf+fnQCdvMYMlr4rTeEiDdNCvfb7Up4iYwFdVGsVg31yl2WCPTXRJzlKpiqt+oUdjF2klfQR0Kh3b8VtZYbCcwnVxjD/BiBSQgY180TdUQMU+qkceN+Q3G9jIuQGWw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGZHeFBMTkk4K0M1MDJXbkFXRjJaYmpBWGlWWDJ2UitBVTVmV09XWWFkaTFD?=
 =?utf-8?B?YzFXeEtvMmtrM0grU091akFMM3JWZGhPV0s1Zzl4MTdZYXlJSFhpMkc3cVNV?=
 =?utf-8?B?MVRzQStOSytZczdjYW9TTGg0NEtiK0EwaVBJYUdhUThQLzdINy9CQlB2RWx5?=
 =?utf-8?B?bHVpMlRGbE10VWNud3hhckYwU2xhRUZXR3JwUXp5Wkw2SWpSYWtwRFphenRP?=
 =?utf-8?B?bm1obld1YTZmdWxQRDR6bnRGUnlHZzkxci9MbDByZ2srNnNPeldIazZRNUkv?=
 =?utf-8?B?OC85ZmRsa0VFYWhIUTZrOXE0QjhVcGtrUkZXTkJQK24rNVdrdVVHa1hvY3FQ?=
 =?utf-8?B?UktPcHltcjIydERpSllwN1lYL0Z5NU9kUmIrK21rOHBXdUlRVmxLV2N5aEJZ?=
 =?utf-8?B?ZGxxNzkzQ0taa2ZQbmpNQm5YOGI0cWErdlpkSWc5dnZXK1JGNWllZjdhRDZL?=
 =?utf-8?B?bE56WURsNmExRlpIcW1Xd0Z5TjduLzZOMEFvZFFoQW9lT2ZjMUczazBxQ29R?=
 =?utf-8?B?MXE2M3czZ0NpYUtDR2tpV1RNNy9zaHpHZE1VdmZKQkpEaTBlZ2JCZERDVTVT?=
 =?utf-8?B?UVdJS0VyRzlaSmtJNUFQRCsxTXZOSnhnSWZjQ016aVM4azZ0TEN3WHlWbGFE?=
 =?utf-8?B?T004QzQ2cEJBZFlXQVFlTkluVmNsMmxyZGJIekxzTXJDQzVkckdEeEFDd0VH?=
 =?utf-8?B?dXNDMmNuRlpkdlQ0WWZUV0pWMnZnL3Z3UWE0QWQyTGtUWTg3MHFqdDVvNUFL?=
 =?utf-8?B?cUNuWEFsNkt6Ym1UdjJZWUhZRXNBUit5TEdKMEYrNFM4ekNCVGhNbS9oazlk?=
 =?utf-8?B?Mmh2cnUvekk0SmV2eU1XWmhqbk1IZ3B6UXNiaEFHQWxUdTNxUkszYW5seEZv?=
 =?utf-8?B?SmY4Qnh1OTNOWTZicC9HbnJidWttVmJBYVVHZlY3MGoxTXFvdDFaOStiSHBv?=
 =?utf-8?B?V2Vjd2pTdlQvV3dlUHJFRUcvRjc5QmYvbWVQV09IYlJJSmJITFFscjlNSUFE?=
 =?utf-8?B?ZGo4VjhYdmRQUmZPWm9pOUhlY1MzZTh6MWdEanVqVHE1TC91V3lyNXFmRjM5?=
 =?utf-8?B?TUsrbE9ISHdIczJoWTBqeVAxY0JNbE9vS0VJVnVTK0dmUUNTZzBPMXhFbmZ3?=
 =?utf-8?B?aXlEanRnRmNZYmt1dGR5NlB1eWZuTXMwTy9vTnJNZ29qU2FCY0I3MktORnd3?=
 =?utf-8?B?UWtZd3duakZ3RnB6OTVDTWlCem93c1c2VGZzVVlyTG1yQk9jalllblhvbzE5?=
 =?utf-8?B?TWwxd2lnMDV2VHg2T1RMdmpnbkxiQmtEZVdFTkVtSzhya2IyWm1rVllTWHM2?=
 =?utf-8?B?SzFjQTVoRUovdkNnLzhpWGRYcjBQV3crc2l0Z3A0L0htcjFSU1lJTS90UGlp?=
 =?utf-8?B?MjZSSGRjNUdGV1dnV1R5bXNLemtobmNvTkV5TWh3Q3ZiYXBxMmVudXU5aGoy?=
 =?utf-8?B?NGQ1SEJjYjlpVzd3bFZKRmNXSjgvdGw4amx4NnBGUVJuNTRoVFViekxvdGd0?=
 =?utf-8?B?QkVKL3BCelRVZ0JuZkdITEZzUXpFRUNpbXhXM3JaUTNyUnN4SzhrNzc4YTFl?=
 =?utf-8?B?b0lPNW80aFZJUkdjV3NnYXpzdlZUQW1zNlk4aWtHM29ZR1ZqeVBSd3lUeFJ3?=
 =?utf-8?B?ejlIWTBEbDRjWUZjOVBjUHB2NTl1NXNNSVFSeEJHNjF6UlduVG92YWU5U2Fi?=
 =?utf-8?B?WHI4aDRpMmdCN2d0b0hKZ2o4cTk3Qk5lS1FWOFJHRU5CQXBqamxubkFrcVhw?=
 =?utf-8?B?QWJtQXlqcFJZTVpPS3ZHQUYzazdXTzVGdjRjZzlybW44M1kwVFluZEVjelZz?=
 =?utf-8?B?c3d0RzlPUkJuTTJkYVVoc3pJSjd2N0ZqaklCM3NXZk45YmVFY3Nqc0NCTzR0?=
 =?utf-8?B?S2RCT1lsMGNvVnVxaElBZVl5OENOMld1ajRVV0U3bGxVTVJTVFZwWUlXOG9o?=
 =?utf-8?B?dDZpNlJ3M3hWcHdaWGdkbEwzZ09aeU02amVxVDRybHZDeGVlTFYwK2xUWGpX?=
 =?utf-8?B?RElMZGRmWkloZEZVdzNJMGJSZ0dyK0pFZm1aVzJONkFWZ2VkaDFJenU0aDBN?=
 =?utf-8?B?U2xjWkZHNVQ2Z09XSElBS1oyenYvbWc1bncxTkZUejQxeWZDblpVaVAvMzNz?=
 =?utf-8?B?VzcreHRJS2NHeTQ2cFpDUDllbENGRXpUNzlMY1QzM0ZFSEdrTTRyYUJKVUl5?=
 =?utf-8?B?MVU0NkV3U3R0K1JWQVNtc0Z1VzN1bG44TEplMHNTRzAwVXR6NHhkTG85Zisr?=
 =?utf-8?B?UFdOdmNSUmNwSUFYbjFrcGNxRUNsS0ZmQTdJNXVQWFpSYmZEb3BxT2JzSStG?=
 =?utf-8?B?MENYdkIvdVJVazUxcmUrSUdHQ3JqUUhZZlFYelFiSjJoeHhXaU8rdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d704aea6-36d1-461a-2603-08df448d73a4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:30:43.4602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DcV3YXAc1uMGiHjwsYSQgwEsOxmawi+h+Y3142N4bQ/5dVBh8sDilBCOa7zdc/HaIFjb3r1Q/rGIDnOXLVpZLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6056

On 17/11/26 12:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] soundwire: amd: inaccurate Fixes trailer in
>   amd_sdw_process_wake_event() change
> --
>
> commit 37e17ac67e68c6f83de067cdc5e343eec8f2c9c9
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
>> soundwire: amd: remove STATUS_8TO11 clear from amd_sdw_process_wake_event()
>>
>> amd_sdw_irq_thread() falls through after handling a wake event to
>> process any coalesced PREQ or peripheral status events, rather than
>> returning early. With the fall-through in place, both
>> amd_sdw_process_wake_event() and the tail of amd_sdw_irq_thread() write
>> 0x00 to ACP_SW_STATE_CHANGE_STATUS_8TO11 in the same invocation.
>> Any status bit asserted by hardware between those two writes would be
>> lost before the next invocation reads the register.
>>
>> Remove the writel() from amd_sdw_process_wake_event() so that
>> ACP_SW_STATE_CHANGE_STATUS_8TO11 is cleared exactly once per invocation
>> by the tail of amd_sdw_irq_thread().
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> Fixes: 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interrupt")
> [Severity: Low]
> Is the Fixes tag pointing at the right commit?
>
> In 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interrupt"),
> amd_sdw_irq_thread() returned early via amd_sdw_process_wake_event(), so
> ACP_SW_STATE_CHANGE_STATUS_8TO11 was only cleared once.  The fall-through
> that causes the duplicate write was introduced by the preceding patch in
> this series, commit "soundwire: amd: fix IRQ thread dropping STATUS_0TO7
> on simultaneous wake".
>
> If this patch is backported to a tree with 66c878838f37 ("soundwire: amd:
> handle SoundWire wake enable interrupt") without that preceding commit,
> amd_sdw_irq_thread() will return early on a wake event without clearing
> ACP_SW_STATE_CHANGE_STATUS_8TO11 at all.  Should the Fixes tag be dropped
> or this change squashed into the preceding patch?
++

You are correct. The Fixes tag is incorrect.

In 66c878838f37 ("soundwire: amd: handle SoundWire wake enable
interrupt"), amd_sdw_irq_thread() returned early via
amd_sdw_process_wake_event(), so ACP_SW_STATE_CHANGE_STATUS_8TO11 was
cleared only once. The double-clear did not exist in that commit.

The double-clear is introduced by patch 06 of this series, which changes
the early return to a fall-through.

I prefer to keep the two fixes separate, as patch 06 fixes the dropped
STATUS_0TO7 on simultaneous wake events, while patch 07 removes the
STATUS_8TO11 clear that becomes redundant with the fall-through.

I will drop the Fixes tag from patch 07 in v7.
>

