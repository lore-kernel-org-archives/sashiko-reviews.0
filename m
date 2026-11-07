Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794083906;
	b=1W9TEZDF3ued7fcb+sNoycOtlBOTnGy5DNE9EMph/0MBLK7RL5COr8cq/922A07mo/by
	 8VVID03velM6DcRz5eTvPWUriA6nIybgcstMh/11t8UxpUzeKmE8wnfdutmnLA1YYH6UX
	 ZZyRRA+mUgz5KiKVqA2TzRU8zI54GwXcb6w/euvecUOKuFDxpytNeyyJL/aKaB4PCtB4r
	 ucdFinrTjKJGhuWIJk1bd7xyxGtEYSqIGHle5YgRaRR+0kRBOg0dGAGu/7Z3PlPagpwTZ
	 qrV/ewk60z87XkUAhzhNztEFspinBIW/4IeTGDplgcqYVBSRgVw1ReRylPWDOUA/vFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083906;
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
	bh=CLYtWhIwpbnX8RlqJeel3Z71WulY7AcSA8mOTKDY9as=;
	b=sIkpiqZscFwLYVBZrwrKkJEtqg44RsQMLJXJgTNCYtmdIGjaKPbQ3UEWu1AIPYvKBJhd
	 zqocWwIV0z+Ni6pnbcxPHfMMQ0qd0xqIIQmd+lgaYwffpLGDiAKB+/1tx9BiHtFFJMZya
	 A2v7YV1uPyWgwCiwqG+2+PS+KHtTPyIyCQboYcR9yhCk4krkb0zM+C7QXJDT58OiwaxoL
	 JPlQYULTDjuRBK3UFPHYQhmRImi7FhSRmsKKp8aB/f2My83wxTONAstzhT9C7IKC0UdYK
	 t/OoPYUOcwkc9wk6P5kXOjruqxs1KJKCdKfl3jcaIQpGRyL7GOOqDBs7QZoU7Jfl83Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="L/NYwpJL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.63
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012063.outbound.protection.outlook.com [52.101.43.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30E5606A32C
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 20:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C30E5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=L/NYwpJL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfsGiX5ytdMLnt1Q/WqHt51SXamUyeGW/vHaP9THxWKsUkJ1fSFU0zMtE8duAo2SNGxhhQ8CWHgg3BDhh8gfhDYgclT6F3mzE2Q1naadraWwcH8xkg2Gs3bYMQ1XBzYENXd8XAblcaAuXteCM4dcxb1AD8eakLLYuTthc5EBqVIPtl0jHBkFOFBQvQo2M5tKVSyNNe9t3+N0rKGg3nwasykEAS89rNb892fonNUFGki7n70Z/xhyLYuu1hT8x/F3tMQCw98iRDafnzr9yX/sLU28yTH5H/Jc2yQK3GUH6yakHhGeRhFyuHR+kDNo+ymYRoOd/UrIQKZrwvHlaG+E4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLYtWhIwpbnX8RlqJeel3Z71WulY7AcSA8mOTKDY9as=;
 b=nWFumGiBnB+RJ8hMGGsclGtpGU+DhYxl8KqxTJF8SYb0vRpNYq2+cqs0ZOza3j6UCP/Qlu1zhLQT/Ny5LkzNufope6MC9AeU/nwcp7pEhR5D5KNscbV/vGl1E2je+yeu8Q8/j2OIWUyRh4OsfkjSAVlCiZDpexSyMCoy6FUI4wtJKaHIJVkZV1hM7b6ptOxVtWszyVd4d6siFCCbmywcXlze10qSb/mI8852Trj3+tPTmwGSMdCivivWW4tz1/r2d4w2uHcBDRaLnUCOCJAK0/YLYw0EanhC/e0scpRhmSOw6Tra5Q/fY5smcvYXTrnuvcFPT0OQwakgPa3bqFoI1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLYtWhIwpbnX8RlqJeel3Z71WulY7AcSA8mOTKDY9as=;
 b=L/NYwpJLpsC2E3i1yIcMV8RZihRAYbyYadYbO3IHiIAsGRAHY9Z8RjFkgjeMi0ZWsYiPvJMfKSf6HmlTimm7ElyZiJ90xjjqMZ3iO3QavV0PQu3MeHZlC3M0XasuupDefCHo8aRDpWc90qnqWHBzc6kBm0pDTU+eu5I8i1ESdOY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 20:38:19 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.009; Sat, 7 Nov 2026
 20:38:19 +0000
Message-ID: <11fd6b5b-9f36-43c4-bd97-5b3d55cf0bd5@amd.com>
Date: Sun, 8 Nov 2026 02:07:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/25] soundwire: amd: fix interrupt gate and work
 drain ordering in PM ops
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
 <20261107154659.3358223-23-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-203057@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-203057@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::6) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|SA0PR12MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b2c011-f169-4d98-4e51-08df3d0f0e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261102123227099003|261021121427099003|261021123027099003|261022075727099003|261026140227099003|261026121527099003|261009223027099003|261022105027099003|261028144727099003|4143699003|11063799006|56012099006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1NMC3FJl44op6hYhZs1LcCBcVD802a8+kOmuphVm79UrzOA8eG3ChhWG1W1KRu75NxzBRHMlXg+qk3WdpaioYYivpaGKyevM+VJ9IlhCP0Pwb4/qv7c5qY9FKm5NN0xNkvegIiRgLxGKtsMXP5MpCyoxr8r3UG4E/UcKH3gnwqsQtgEKsut8mHqkiJGfgbGQNnUAaSWTuUO5La4y6XCKtMDqW5heDRzXSqiT57k2hEMWcf0Ll1sTWuPAmDNe7A/M7lfxiIZGunaQOrAji7cG0QAYmWOtRMVEkgoev73++GT0D6uYD109b9pmoZHOdPA+p/CFSOGuKNEQFyLzzT7g0rCXL+iI0lcaLBOqSkAhIJlZjhRe99lkKe+rVvktiU1uc+NepeLSFohLhDOsAWVwXc8skDa5UjxWThRvdN0Kx+4llHc7+His2bVlbbc1bT8iRIVVJqhmrBfAPkn8ZduPAw1hGfOc2zi53k1Mtxrik9BmNLEEzuI6olgzAofIT/Lsi155xTj7N8PO/qPoNE5uJMRBEkUBy4BAFicIoVtZ3YdPJRw5l3aLaBB426owRttmCUaHCpCvMU3Au5Jov7i4pepKxGHKN90qkKTK8KQ5T5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261021121427099003)(261021123027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261009223027099003)(261022105027099003)(261028144727099003)(4143699003)(11063799006)(56012099006)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VURpSEQ1K0tvckNKUSsyZm5XOW9HQ1kxcDVQK2NodDYzaUE5R1Bwd2xtWU1F?=
 =?utf-8?B?aHR3VndLTGpCZFZydUdnQnFoVmJoV0syWVhNTngvNllzbmhOTlBxVjdEcVVD?=
 =?utf-8?B?SzZNZVUzdVZ2V2x6aUQ5TWFOMkRwYXd2ZE1obk5HTE5uc2VNcFdVY21aU2pW?=
 =?utf-8?B?TDMwYkx2Q2t3Qm9kQisxdzh3b1FlWUxFbStYclltZUxpR0ZEWXpUclE5R1NU?=
 =?utf-8?B?NmJObmFwUHJWdlQ3S1plS0lRamZKYkNUeGRuZ2hheXlqRVNzcGNldkNKcWFs?=
 =?utf-8?B?Qk9PRkRrVjBMc0ZJZHRCVUJmdnRLTG1mSlJ4UWRJNFJFV0ZwdFMwVzNDV3VI?=
 =?utf-8?B?VFRBU2QvWFZqeFFtREZDb2pUNUdEcG02bVVVUTlmL05OdW9rSzEwWUhkTFpr?=
 =?utf-8?B?VVFrcXVwYWJZT0I3QWRCYVIvcU14L3hSaHhJelFkKzV6KzUwV21kWWtxTFc3?=
 =?utf-8?B?dGptVC9FNXBDaVJRQWV2aG04VzIzRFZkb1Q2eENiQ2tYakdNUFR0eURhR3Fv?=
 =?utf-8?B?bWlYSnBtL052ekdWY2FTVzZFZWNSMW9FbVpkRFI3QU1OcDhvUndmYmV2T3Jq?=
 =?utf-8?B?Z2NndERLaDFYZm9XOFVoL2ZsODQwcVJ0TGZGbE0zeVpBUFVXQWJaZkNwRHBZ?=
 =?utf-8?B?dTdHUGxOdzh6RDF5MWZ0cVl3TytiWFRrYUo5NEZVZkNlYVdyRm8raWxMVkw2?=
 =?utf-8?B?aUU4NTZuS0dIbmJ6a0V3TVRYYlR1WDhqcGlBT3QxVldreTVUREk1d1ZRMnho?=
 =?utf-8?B?MGRCOG9XR1VSVHhwajZXbjFLWEZ6RmRNU1FJSzNLUGNMakQ3ZEovY01CNXRv?=
 =?utf-8?B?TFlqREgwS0pucnl6RHlHeDFUeHhTaTNJcHFLZFhlUkd1UHloa3BvUkdMRWxW?=
 =?utf-8?B?QjRKVVgvVU9aOU84NFhHaDNodGhPRDJUUmc0ckxrcnpYcER0dGY0d2xhdUZ4?=
 =?utf-8?B?enJDWGpQSnN1RW5EZXNESjlBWGtxek90bFBXY1VNdENyTHFzaXkrWlpsWGgv?=
 =?utf-8?B?K2g1UzR3djFENFo3YVJTVndkT1BXbGhCZVFtQzVoL1BBZllCQ0hUenNyMHlO?=
 =?utf-8?B?UDBrS1JjOERzeWw4ZUcyUEd2bHREZDRVaUE3bUVYOGxDZWlUMXczaHk2bFNM?=
 =?utf-8?B?aXBFa1R3Q2puYXNQUmFZNTdIOFJzVlFLdjFOb01qVzlmYng0YWV1b1h2cC9I?=
 =?utf-8?B?TS9HU3g3Y2JkckNENXJQR2hlMllveDBGbnRNRUhyWEltWFU0YWlPSys3di9q?=
 =?utf-8?B?L0EwU3VqQUh3QW1qNXZnZ2EzSm5sKzVITUQ4Q1hzY2ZmSGNMcEk3Z2FRejFH?=
 =?utf-8?B?R01hWno3Qm5FT2wwU3VoTi9iQ1ZFQm5lSmJPdS9KUy9VZ0Z1LzdUWVQ5R2d3?=
 =?utf-8?B?YlZjRTdRR2oxaTBZV0ZNNzB1SDBLY3VTeFdyYU81RU01QkkwTnJWWUh4SkR2?=
 =?utf-8?B?YURpcGxxemxvNng0Sk1EV3p3YUppWWNIblhVRFIzeG9qZTlGbFZLcnBteW9k?=
 =?utf-8?B?aGdLSkdNc2hGZmFlVmVScnVsejJ5OW93YzdXM3lVZkgreFBIM0RDK1lRK1Vo?=
 =?utf-8?B?M210ZmJFU3lmNlNVT3hMN1FXTnU2UW9URHZLYWw2Zk9IMGRWUEhIei93Rzky?=
 =?utf-8?B?WDhRWUdVLzhDck81SU5yK2E0dGYwOXhuRHUrTGM1U3pKbVE3UDAyd3NKRXJo?=
 =?utf-8?B?eFRnWWYxbWVCQTJCM1dtVFlJazUzcnA2RmN6RWZUbzZ5UlVLMS9BVGdRaDFT?=
 =?utf-8?B?M2MzTTB1YjFlTFhQSE5WanVkWkpGUFhwVWd3bFFZSkUwSXVYZGdOWU5EaGdm?=
 =?utf-8?B?bElHelp6cGxzUkJLOURDeS81YTVvUTJ5RkZPU0M0TURheGFTYlg0NlYwWUlY?=
 =?utf-8?B?MXM5TC9yN0N2VkRIZjlyN3JGME56Q1dUUWlmc05NdUpEQ20wRTE2eld3UlRo?=
 =?utf-8?B?WjBlYlpiTGVQcm5YOU4xaTlJb1BBZnFaS1hnc05nY3VZMFhqL1pKclpUT1Q1?=
 =?utf-8?B?R1RKcjlhLzRwd1ZmRHNWdmIyT3NLWkprYVh2MUwrcFlQZnVSMm13R1JBVit6?=
 =?utf-8?B?bDhHZGFUVldVZTBmZm9ZVWYwOEtuWGVSVWdMR0lLNzl0WmJvaEJDNlBQS2hN?=
 =?utf-8?B?aU9nNitZYTBUb3pPMG5WSkVJeUUxa2p5Yi90ejJ6RXlQUXVOQzZ6aTMyVC9G?=
 =?utf-8?B?elIwaUF4V29rSktVMm9NOUlDRGt1Mm5jWDRsa1ZGczNlMVJwRWk1c2pRMlNq?=
 =?utf-8?B?MWRaTG1MbXNxNVJ6RUVUNmRNYXJEK2sxSDhkWHl1TjRLT1I2WkgyeTJMRDA5?=
 =?utf-8?B?aDJhcEh5OFlzQUFyamlGTXZ5cTd2Z21LamNrd2lSZlpPT09zYVo3Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b2c011-f169-4d98-4e51-08df3d0f0e9d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 20:38:18.9813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqtFIUb6RdlyIDYVIuZReNR8o/rrRWAZEsG30poCUmhTZJLbXqQGi1Moxxn9o+UvYc2IIX3Xr6q4v0s5j37EWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7091



On 11/7/26 21:55, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] soundwire: amd: unserialized hard IRQ race with work drain in
>    amd_suspend()
> - [Low] soundwire: amd: commit message describes prior patch revision in
>    PM ops
> --
>
> commit f3586b88e19b93c1d283c25b97e67e7d9da93bab
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
>> soundwire: amd: fix interrupt gate and work drain ordering in PM ops
>>
>> The CLK_STOP_MODE branches in amd_suspend() and amd_suspend_runtime()
>> did not close the ACP_EXTERNAL_INTR_CNTL delivery gate before draining
>> amd_sdw_irq_thread and amd_sdw_work. An ISR already running when the
>> drains completed could re-queue work after cancel_work_sync() returned,
>> racing amd_sdw_clock_stop().
>>
>> In both CLK_STOP_MODE paths, amd_sdw_wake_enable() was also called
>> before amd_enable_sdw_interrupts(). Since amd_enable_sdw_interrupts()
>> writes the interrupt mask unconditionally, it clobbered the wake bit
>> set by amd_sdw_wake_enable().
>>
>> For both amd_suspend() and amd_suspend_runtime():
>>   - CLK_STOP_MODE: add amd_disable_sdw_interrupts() and
>>     cancel_work_sync(irq_thread) before the work drain; reopen the gate
>>     with amd_enable_sdw_interrupts() after clock stop, then call
>>     amd_sdw_wake_enable() so the wake bit is not clobbered.
>>   - POWER_OFF_MODE: add amd_disable_sdw_interrupts() and
>>     cancel_work_sync(irq_thread) before the work drain; remove the
>>     redundant post-clock-stop amd_disable_sdw_interrupts() call.
>>
>> Fixes: 86a4371b7697 ("soundwire: amd: fix for handling slave alerts after link is down")
>> Reported-by: Lee Jones <lee@kernel.org>
>> Closes: https://sashiko.dev/#/bug/linux-3b774ace-00cf-41e6-82eb-85cd43f5e1d6
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> [Severity: Low]
> Does the commit message describe an intermediate revision of this series
> rather than the parent commit?
>
> In the parent commit, amd_suspend_runtime() did not drain
> amd_sdw_irq_thread or amd_sdw_work at all (this patch adds both
> cancel_work_sync() calls there), and neither CLK_STOP_MODE path called
> amd_enable_sdw_interrupts() before this patch.
Acknowledged. Will be fixed in v6.
>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index 2b38b9bf97f50..4e151f7350c96 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -1437,15 +1437,20 @@ static int __maybe_unused amd_suspend(struct device *dev)
>>   	}
>>   
>>   	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
>> +		amd_disable_sdw_interrupts(amd_manager);
>> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>>   		cancel_work_sync(&amd_manager->amd_sdw_work);
>> -		amd_sdw_wake_enable(amd_manager, false);
>>   		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
>>   		if (ret)
>>   			return ret;
>>   		ret = amd_sdw_clock_stop(amd_manager);
>>   		if (ret)
>>   			return ret;
>> +		amd_enable_sdw_interrupts(amd_manager);
>> +		amd_sdw_wake_enable(amd_manager, false);
> [Severity: Medium]
> Can an in-flight parent ACP hard IRQ handler still queue
> amd_sdw_irq_thread after cancel_work_sync() returns in amd_suspend() and
> amd_suspend_runtime()?
The acp63_irq_handler() shown is the pre-patch state. The companion
ASoC series adds an interrupt_enabled check in acp63_irq_handler()
(pci-ps.c) and acp_irq_handler() (acp.c) before schedule_work().
With that guard in place, triggering this race requires CPU1 to be
delayed between reading ACP_EXTERNAL_INTR_STAT and reading
interrupt_enabled for the entire duration of the suspend sequence on
CPU0. A hard IRQ handler cannot be preempted by normal execution so
this window does not arise in practice.

This finding is an artifact of the two series being reviewed in
separate trees.
> None of the parent ACP hard IRQ handlers (such as acp63_irq_handler() in
> sound/soc/amd/ps/pci-ps.c) check amd_manager->interrupt_enabled or acquire
> acp_sdw_lock before calling schedule_work(&amd_manager->amd_sdw_irq_thread):
>
> sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
>      ...
> 	ext_intr_stat = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> 	if (ext_intr_stat & ACP_SDW0_STAT) {
> 		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> 		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
> 		if (amd_manager)
> 			schedule_work(&amd_manager->amd_sdw_irq_thread);
>      ...
> }
>
> If the hard IRQ fires just before amd_disable_sdw_interrupts() masks
> ACP_EXTERNAL_INTR_CNTL, the two contexts can interleave as follows:
>
> CPU0                                  CPU1 (<hardirq>)
> amd_suspend()
>                                        acp63_irq_handler()
>                                          readl(... + ACP_EXTERNAL_INTR_STAT)
>    amd_disable_sdw_interrupts()
>      interrupt_enabled = false
>      amd_updatel(ACP_EXTERNAL_INTR_CNTL, ...)
>    cancel_work_sync(&amd_sdw_irq_thread)
>    cancel_work_sync(&amd_sdw_work)
>    amd_sdw_clock_stop()
>    amd_enable_sdw_interrupts()
>      interrupt_enabled = true
>                                          schedule_work(&amd_sdw_irq_thread)
>                                        amd_sdw_irq_thread()
>                                          schedule_work(&amd_sdw_work)
>                                            <-- runs while clock is stopped
>
> Even in AMD_SDW_POWER_OFF_MODE where interrupt_enabled remains false,
> amd_sdw_irq_thread() still reads SoundWire MMIO registers and calls
> amd_sdw_read_and_process_ping_status() without checking interrupt_enabled,
> racing with amd_sdw_clock_stop(), amd_disable_sdw_manager(), and D3 entry.
> In AMD_SDW_CLK_STOP_MODE, calling amd_enable_sdw_interrupts() right after
> amd_sdw_clock_stop() also sets interrupt_enabled back to true while the
> clock is stopped, allowing a late amd_sdw_irq_thread() to schedule
> amd_sdw_work and trigger MIPI command timeouts (-ETIMEDOUT).
>

