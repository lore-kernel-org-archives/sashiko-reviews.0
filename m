Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794921090;
	b=xfv/EQvp3DYNeM3KX1bv0Cb70JSYOmDm9dm1VZuXuI16AIDZKfPELUCSq1ne3xd1D8/7
	 MSSZGZNPrDg2jrJ+x575NvLRMfYTHNkb02+HgK7iXYF/XaY+27R5AGqHOZC6ZXzAfN/HO
	 bVj0MkqImbqHOWOThFOwxb8mJ+nmdmWlcKOHVRVH64PCSSh2YQfuT2h9fx5VBi8D1f5jN
	 co1K2o49lI/Hx65tZu5eO3wiEX74tkLloWdsWZzvwrARADNX0D0Af+SXsUHf7PmOlBzEd
	 eB1ajzeat4U1aS89TTBZB45F5wFc3wod9FwxtiVaZDOT8tAAyPS0tEaO/hB+QGNJxqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921090;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
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
	bh=lzztRhRnTleJnVsoeSAAS/mmaO5nxTVrZC5UcrA5i7A=;
	b=MU3foTJcE8ax5O1lCNlx54z/j5IvmV/fOQhmLZhGtHuziidqeq8e90Yq1vGcVoacbJim
	 enk0zpeSA1AT4W1KBLu7dg1+tJw3SAqiCFeSxwpqEA+q8humvglhXIP1lYOf328OavIjk
	 XpJX4eaZHpctPbwWN8B+uvo5amoiIv4csTs3gw3ewCaClRru/VumnVLoJEX3t2Rm6Avu1
	 bjvyaApl68T4hzwTgi0gSREjtTlFc/vcveP5Nv+EIlkupPN2O6DFvB+3SC56DMqk6O5W3
	 44aEyj8c0Myx6PHvzy5lFQJHzKBwSGL9WLRC1m08v6iteQrcqDYELJUoM8lTC6wTMsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jAjJQXzZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.10
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010010.outbound.protection.outlook.com [52.101.193.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0531606A329
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 13:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0531606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jAjJQXzZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNXLLXgrHIBCWMXBUr+JFFdL71BMu49c0govI7NTn0BV1UUjFPSln5wcKW8C14Zj2HXDkBb+6hxbzGBULfDQgnIK42DWTF1+dOteJc7hZkRYN18qt8W0WR9aCNFaSOwLm6PorwcBWVAQ6EANqHZ5nLRizxQEEmb0SbIE2i3uVmok/YHBVDP4382m8my5CsPwfZmvak+mR+HMbyHDO+mVTotA3jxXGFknrpGnVGSwGNgQpbk3agUQP60TFfbGn5ZhNILSqErzV8/d1v00soVpzilLpNLD+Sdf3RK2BqUTbviDyUja1BqYNAvME1I42UpYI+o/p8NUUOETEQ75V3dlrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzztRhRnTleJnVsoeSAAS/mmaO5nxTVrZC5UcrA5i7A=;
 b=prK0uNzAJXr+hQWP+PyCCXv7fOIVSqev/VWzj3E4yo2GueN2VBWpH7uD1V9tAoAJGBYfICyWoC2FVpWSbCySIqG7VGdi9eoZ5WClIVJNbwVauFHdA0a62IIAj0fkfU5R/WVJ5PdtNcOFExVDmUK6jRBiN8zJxp4k2h8rwUhi80kDxHWgrHyJjspPeTGl3Y9wZpmUppTgSJIzLoA/fkpmbzrZrQ3McxC9mW+cLqiTr41pBIImwbqIbceVY9ShNKSVEwD8UypMqkkmp/ne5Pix6bh1C7XgYx2xGb8yrj90nB7NPLENFb/K6ZBcADwWQvjNOGRZyKy0VjzEyr2KxlLNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzztRhRnTleJnVsoeSAAS/mmaO5nxTVrZC5UcrA5i7A=;
 b=jAjJQXzZPDd7mn/za2cKG4M3F/N66XrkxbIkGIyAFThK5EkMIDzLVkZv5zrOx70vt0H8RC859RQUvpr7HSsL+pw0uZnr3sGjmYnvaOtgagv+mgY4FM1aNaStcFqqW7+iW6ytQKgGlt3uBHC68QjGrR+JDn6BVP97aYv++2abMOw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by SA3PR12MB324197.namprd12.prod.outlook.com (2603:10b6:806:536::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 13:11:23 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 13:11:23 +0000
Message-ID: <34ab249a-c06d-48a5-badd-5f7c8799d57f@amd.com>
Date: Tue, 17 Nov 2026 18:44:12 +0530
User-Agent: Mozilla Thunderbird
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Subject: Re: [PATCH v6 16/23] soundwire: amd: delay *sdw_ctx publication until
 after startup succeeds
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, "vkoul@kernel.org" <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
 <20261117070906.803139-17-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-218354@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-218354@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::12) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|SA3PR12MB324197:EE_
X-MS-Office365-Filtering-Correlation-Id: 152b732a-c5f8-4c11-e6c1-08df44ac4740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|6133799003|22082099003|261009223027099003|3023799007|4143699003|56012099006|11063799006|261102123227099003|261102130727099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	o+4owj9agyvUngezhNKP7Zk61IeQ6/UzGjDOZ0O5//uH6bq46l9txeRJ4xNAIPp9B9zzE/jSLs0I1zAGj8SYf+YgIWDRHfvPqDMycwgtaW779+LlLqoNJ9AJt76bv/kNEt6RngyEMEwpxV9A3bsXIPeTd7TkWRC3xvlP1ztQieRLUomj1nJZ0cQUjZQvypvaVKP05n+Gubj0CmMlOQuFXMHeJCbHwtmZuK0f9IJO7WqhasUQax6gSwsTKrFbKjVDOHL5hOxSwb3NLW8A8RMANNOZB3ZfLwwu3Zr9OrggsjPjaNh76NFtfoSTLW5rwLwxtTih2vco1tHQu5nIpH6YW4EOYFOLojDyERAsUC3NEpQVLItLvita3Pc19Y634erByvlsw4cQTHbgiGM+auY51GYapzD5cm/g2nrUeSWwgaTsdc3RzTlkvGPTlmxyOjVYwJyC14eFKRp6i9D2Dm3jCLqQBgoJwYyhShk6OpDHTQpJV58xjr6YldNZcmRufXT4DS7X9RMrvgeyKciPUxMm1igPDgbg3fjliXKiF4ktMcFFkZ+4YG13IaSKzw5u1u5iNBrsG5Vs85gWiXNSKpfAhJHsCkdJxrYGjqLn2/8cP+u/+UkdaMmXTbdgjUG3EBu93DstEZNfjBnRiRz6mZIAhA5Ev1WIoojedZG2YP6bwoY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(6133799003)(22082099003)(261009223027099003)(3023799007)(4143699003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGNsRXVKRDV3NmIvN0NXdWI2MlByNVpwbDMvYnQ2a3VxWU1jd1dWUnQxQjRT?=
 =?utf-8?B?NnVJcE5KdU04aXZrTzluSFFYbWxTcHNuTThmY0E3UVorbnp4a0lwUlp2b1hz?=
 =?utf-8?B?dm9wK2tpdkdPcWtjbXQ3cEE1b2EyVWN3Zy9uQ04yN21vdEV6cXJld09SVWQ0?=
 =?utf-8?B?UGUwOEM1c2lFckNJSnpTSzg2N2tVNlN3NDI5NWZCS01LUEVhUnkyMGJ6NFdq?=
 =?utf-8?B?cmRPNk9OSTVSbFg4eFp2bU10eElEY1Y3RXpaM3JVSkg5K0tBanRrbHE1UEJX?=
 =?utf-8?B?YU4vMnlKcVQ1TG80QUx1RUQ4WDVjUzQyeHZRdUVvVmdxOFhuNmlBaHF5UGJ0?=
 =?utf-8?B?ZU1ZKzV5UmJWQTVvbzVGU2g3Z1RITU9PK3ptQ1R0N3JZTjIzeDc3WDRlU0Nn?=
 =?utf-8?B?WUhTL2VzdnliV2xheTVvZ2NqNDcxRk5ieUJteFdHc2k2TTRXTFZ3Q3kzVHJU?=
 =?utf-8?B?MHVabE9pLzV5QVAzdlZzeEh1cjcvV1VtOSs2dmVHK1oxb3IyZ0toRm1QbFZ5?=
 =?utf-8?B?WDJ4SzR2eVhZUkRsZkgxNEc1NE01Z3RSVjAwUEsxZzE3YXg2VjdqWUpjcFE4?=
 =?utf-8?B?UjVINmVHTURkZ1FmTzc5REM1elV0VGc2a0hYaFl1a1BVMWFMaitPS3hYOVAr?=
 =?utf-8?B?LzlJYmljS1daMUgyMkV1US96WHJkY2gwUys0YjZpaU1pUktDdU9UbzdJUWMv?=
 =?utf-8?B?SDV1OXg0SU9nbDNGNFR6Q3hYcFg0ZHo4MU4yZ2VUNDFQNDArVG1yQnI2UWFH?=
 =?utf-8?B?NWVZMkZIRHIrY3RhaXltU0JWWFR6RkdNOWx3a3VvdStnbVdmbm94aDhFcVdG?=
 =?utf-8?B?MSs5MlJLNlZNcnNxVE9Bd2laV0E5ZjVhcTZPM0d3aDA0M0FGQVBQVzBlNzJO?=
 =?utf-8?B?L3F5SVViL29NQW43QXFNMGsxekphWkVzaUhTYlEyUmhJTkN3L1RHWWdFVERH?=
 =?utf-8?B?NCtrakJ6OElOR3JLNjVOQUhnUnFCNFo0eVY0dERWa2FCd1laZmhWeCtmcjVw?=
 =?utf-8?B?bXpiVzB0MmxmNy90VjZNeFRWakhIb0p3dllEVXIrOFN5SjRkWm9VL3A4cmcz?=
 =?utf-8?B?a2p1cEJSTG91c0dtNWFTQ2hkU0hPVE5Mamo2S0JuVG44eG9xNElZWXZZWVNX?=
 =?utf-8?B?UjA4M3NNRzZSVGhibU9VUUpYN2EvMVd6cjFRT0RrRzNzZ21Tek1uU29GRjFV?=
 =?utf-8?B?Zk03S0RleGgyazZyL3ZtZjFxN1RCNUlKL2tjZ1FyRk80UjU3amdJVFJ1bEo1?=
 =?utf-8?B?bmZIY053Qm15UVhQYU56RUNlYnlVSHJyc0E1c2E3MjFCQmRrUVpKSmdlRG14?=
 =?utf-8?B?NDl0MjFpZURmU2VRWERsN0tmMUZkL3FiWG1KK2lCelhMZ2V0ZkF2STdxd1hF?=
 =?utf-8?B?MXlWRVNKZ1c3aHczYzlKNElTS2JFQzM1MzZYMFNyNE1BTGtVU2MyYnZndlZQ?=
 =?utf-8?B?MStDd1Q1V00xbWZlUWptL0NpV2x2UmlRSmR3TnZYbkM4dHBpeW9VdEtqUERi?=
 =?utf-8?B?K0tlZnZBZXFQcm94SnFZR0FQN29BM2puRVB6ZG1QRFNjeHRDS1VmbDcrNWMx?=
 =?utf-8?B?YWpTM2MzNXFOWE0xbUZId2hSeEtHb0dSUzVMb2JUVzJrRGh5bUllVG5NcmEy?=
 =?utf-8?B?SWlBUFdFbUpaTWV4NlY0Q1hzMTFVcGdRcXFSckVBRW9qVXhRUHRuSUYwcWYx?=
 =?utf-8?B?VzhCSjhxeHp3UEZPc0xWdTRaR0c1Rkx1akdoTmwyYU1vS3ZmeWZIT1VGcU5O?=
 =?utf-8?B?bGhVbUREUkFkSFpwZkF3R2VHaVMxS0JpRFhxKzl1aWVyK3JPaVBNbUxNZTgz?=
 =?utf-8?B?akN4Q1hGYVY0OEhqbU96K200ZUJTVzVodzhWdUhsa3ViZkRwaWRodVF0TS9N?=
 =?utf-8?B?WGdFdDJheWlQa2tDcVh4OTl4ZjBrVXdobkF5V2V5VW1mMlRLalRualFKd0JT?=
 =?utf-8?B?YWJhZVZENU5aRDNXWGE5M1V6WHA5VkxMSVZMTTQ2dXpOL3FQcldZUlNtdm9q?=
 =?utf-8?B?b2NXa3ZWKytoVjJTMjdHeG9iL002N01HOUV6NjBLTk9SU2ViTUpzVVVWNFBV?=
 =?utf-8?B?WUFmYWVsL3VwVnQrcFUrUy9UQ1d1ZFowYmRrc1NyclNpS0JZeUZWVVJyTUZP?=
 =?utf-8?B?M0ZrUzhTTkVjMVBSUEJRZWRReVY4U1h6Ty9aTDNabmRmYzdSS3hyVEZFZE9l?=
 =?utf-8?B?bys2R2VDMGRXNWlhOGZ6QUJLUFNyV2dtSDhaMWQ5OUc0eExWTTNvYnR3NFNt?=
 =?utf-8?B?T3JEVFY0QXlnNWhUd3Fpak5KWk1TU3RiSStVV09WWU5yUHZCVjVmc0F1VkF2?=
 =?utf-8?B?QlIxd1VKNWc3bWZQYnY1eUJsM0hnS3JTTm94dkQrZ24xQlAvcWptdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 152b732a-c5f8-4c11-e6c1-08df44ac4740
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 13:11:23.5315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x24hbEUoaJuoib8+uUhEie7nSx+IIbkqmpWr6jrHmZ2UKtKn3RV1Ah7uGIMxJxIRvP41AKFz2a0iblXV/x4gng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB324197

On 17/11/26 13:01, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] soundwire: amd: lost IRQs in sdw_amd_startup() while *sdw_ctx
>   is NULL
> --
>
> commit 63d0953ca7aecb37f123b556809d3ebfd5afacf0
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: delay *sdw_ctx publication until after startup succeeds
>
> This commit delays assigning *sdw_ctx in sdw_amd_probe() until
> sdw_amd_startup() succeeds, and calls sdw_amd_exit() on failure.
Will fix in v7; details inline.
>> diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
>> index 8019a4faeae5b..74d6c0f371046 100644
>> --- a/drivers/soundwire/amd_init.c
>> +++ b/drivers/soundwire/amd_init.c
>> @@ -182,11 +182,20 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
>>  
>>  int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **sdw_ctx)
>>  {
>> -	*sdw_ctx = sdw_amd_probe_controller(res);
>> -	if (!*sdw_ctx)
>> +	struct sdw_amd_ctx *ctx;
>> +	int ret;
>> +
>> +	ctx = sdw_amd_probe_controller(res);
>> +	if (!ctx)
>>  		return -ENODEV;
>>  
>> -	return sdw_amd_startup(*sdw_ctx);
>> +	ret = sdw_amd_startup(ctx);
>> +	if (ret) {
>> +		sdw_amd_exit(ctx);
>> +		return ret;
>> +	}
>> +	*sdw_ctx = ctx;
>> +	return 0;
>>  }
>>  EXPORT_SYMBOL_NS(sdw_amd_probe, "SOUNDWIRE_AMD_INIT");
> [Severity: Medium]
> Can delaying the assignment to *sdw_ctx until after sdw_amd_startup() drop
> initial peripheral attachment interrupts?
Yes, the scenario is correct.
> All callers of sdw_amd_probe() register the top-level ACP PCI interrupt
> handler before calling sdw_amd_probe(&sdw_res, &adata->sdw), and
> sdw_amd_startup() -> amd_sdw_manager_start() unmasks the manager
> interrupts and starts the bus before sleeping in readl_poll_timeout():
>
> CPU0                              CPU1 (<hardirq>)
> sdw_amd_probe()
>   sdw_amd_startup(ctx)
>     amd_sdw_manager_start()
>       amd_enable_sdw_interrupts()
>       amd_enable_sdw_manager()
>         readl_poll_timeout(...)
>                                   acp63_irq_handler()
>                                     writel(ACP_SDW0_STAT, ...);
>                                     if (adata->sdw)  <-- NULL, IRQ dropped
>   *sdw_ctx = ctx;
>
> In acp63_irq_handler() and acp_irq_handler():
>
> sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
> 	if (ext_intr_stat & ACP_SDW0_STAT) {
> 		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> 		if (adata->sdw) {
> 			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
> 			if (amd_manager)
> 				schedule_work(&amd_manager->amd_sdw_irq_thread);
> 		}
> 		irq_flag = 1;
> 	}
> }
>
> Because ACP_SDW0_STAT is cleared in ACP_EXTERNAL_INTR_STAT without
> scheduling amd_sdw_irq_thread, ACP_SW_STATE_CHANGE_STATUS_0TO7 is never
> processed and cleared, losing the peripheral attachment interrupt so
> peripherals fail to enumerate.
Agreed. ACP_SW_STATE_CHANGE_STATUS_0TO7 and 8TO11 are pure status
registers; pending bits there do not re-assert ACP_SDW0_STAT or generate
a new PCI interrupt. The attachment event is permanently lost.
>   On ACP7x SOF, acp7x_irq_handler() guards
> sof_acp7x_handle_sdw_manager_irq() altogether with if (adata->sdw),
> leaving the level-triggered shared PCI interrupt unacknowledged and
> returning IRQ_NONE while sdw_amd_startup() sleeps.
Agreed. Returning IRQ_NONE without clearing ACP_SDW0_STAT leaves the
level-triggered PCI interrupt unacknowledged, causing an interrupt storm
during the startup window.
>
> Would it be better to publish *sdw_ctx before sdw_amd_startup(), and reset
> *sdw_ctx = NULL on failure before calling sdw_amd_exit(ctx)?

Yes. I will update sdw_amd_probe() in v7 as follows:
    *sdw_ctx = ctx;
    ret = sdw_amd_startup(ctx);
    if (ret) {
        *sdw_ctx = NULL;
        sdw_amd_exit(ctx);
        return ret;
    }
    return 0;
This keeps adata->sdw valid throughout sdw_amd_startup(), allowing the
ACP6.3 and ACP7x IRQ handlers to process and acknowledge interrupts
during the startup window.
On failure, *sdw_ctx is cleared before sdw_amd_exit(), ensuring that
callers cannot access a context that is being released.
A partially initialized context should not be exposed to an interrupt
during startup, since the ACP_EXTERNAL_INTR_CNTL masks remain cleared
until amd_enable_sdw_interrupts() is called. Therefore, ACP_SDW0_STAT
cannot be asserted before the context is ready to handle interrupts.

>

