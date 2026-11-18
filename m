Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795003691;
	b=ZXMm4X4BCdbGwmVaw4F9Bv/gFAud4F+ZkTCBdEWQtw19c54YLzIdjpJepmcfrJL6qM06
	 41y37q+eDyPosjZ9hl81BArDtWwaYMiizsoYsF3fn02wJZCtKaDplc05Iiov1vOnXi7VO
	 J6BENHWn3UAWVQD/CO2BM3iUNIO+4ayHsYSfwQmN8ddoLFrUV3kD1UVORQDBBzHV5uT/i
	 SEApF2huqh+Ares1hsg0Xr7zOMmMmwoJm8yWBVFnBEvIWDHZytSLegYfhb9ANDqRuEDo2
	 /KQ4TuI0GX5yo1hHONOMjmfPW+cgDVbejiq2fXvQNZXVR38waZKmBRrIlEQT+4d+x8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003691;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
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
	bh=Y0QWtJ/5Sycs/cjjxpCcEzlJILevqxSfWW28rk11l20=;
	b=DVJN3HU2smTjdIyyDq8ULZCfjI48KPEKiLD6SZYJ2OINf+nS4vwCjuwwrOhhRbCMFySB
	 63Trdf8CkL6HdleAY9znzZva5hyslnNY1csf05ZdkJFNIyZXjlWQvgFgXHE7D3KyF5v18
	 sFili7LvNLSeBqmWRXdrj0sb6dM2GRlG9Pc/OxPeP5/Yat8gP61USW3aNnzXFY+HvPiS2
	 zUcPNiBRny1BUg1U3C945HEj6IWpHbIkR9+bCosdgu7mTTBshXSjVWgR01Q8dm8Am7y1h
	 RJqor/U3IXkPc5D8IvL4Rc4srgRGCpe8Dz1/gZG2MgY+dWaaAkPnmLU1beMAtDBqSCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dL3ckzef;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.8
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010008.outbound.protection.outlook.com [52.101.193.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E7D606A338
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 12:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02E7D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dL3ckzef
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfV4RONlUatPkcstVicqFcaordqfSOs8F/G6TUHydu96zVukboHj6+mIH7qmgcmatf4X2CTevPIiehZ8yt+qra5SYX4X+c/4ZFIuyKjbwgrJohBO0Wa3oMULcnHuZGnt4uToAY/xgThhWAGyUh/LMPsI4vrCmYmVhK/+T+cZw6GCc1UGCkMPpQEe8IzULYOhrkJfyNCLUVugpeC4h84fPT4/hoUAsGR0MxKPObth3G8ESharhm0zVAVj8/ea2iHAR+aRV4O2YTqTltrcBTZ8aoSCxhDAPeIOTZ9NdwT37tJBJGVQWW82lwDdoq2jPryXSarSFFz8fFzcD17bcRWEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0QWtJ/5Sycs/cjjxpCcEzlJILevqxSfWW28rk11l20=;
 b=A8Ym82fqf2dxizh0fjqVty5rsVwSvLi54J3DdnObAlTOanAcg6BzqPukJSngeQ23E+o850LqAU3bWjK9inZUsmtMXryR1xJFI5MBREnryAPy2gOAEH/pV6Ga0qIgHHWtZd/G2VOrtE2adEs397JiBiOORNJwSKhHySRo4tFVbeRuwSIUVq6QnsyU+PWtEzABfZv5sxnRMxBEhl0aImyEWdlkTbk8vsOw/YJOh+23qRyP16V8aYSi2be5e/6HKzlLQ7pdf+Gq1jz99u5wmLROnO/3jRmGxUkjB4dbKFbiaxEsuvZtlflmPaHf9nLVutzJcjSykjf0Yi4uxSmmKlV7Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0QWtJ/5Sycs/cjjxpCcEzlJILevqxSfWW28rk11l20=;
 b=dL3ckzefX8Raxhlz1qoX1DZuT1ttCoiB60EFzz2TIvKvpThyJNnxqggNWc738dcm5LUD+mxM8TsEBSrcHEwrJM8fYHzCuH2GBBsuhBnBSlR4SqnkI/LzUdpljQtRD/7k/CwA3gLAqbG6zpd95QnP1B1r7Qmk5hKdasebb0DuEDw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by MN7PR12MB148230.namprd12.prod.outlook.com (2603:10b6:208:630::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 12:08:07 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 12:08:06 +0000
Message-ID: <90eb18e2-84bd-4543-947a-9cf8d9a29060@amd.com>
Date: Wed, 18 Nov 2026 17:40:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/23] soundwire: amd: fix work drain ordering in
 remove path
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, "vkoul@kernel.org" <vkoul@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20261118104353.331556-1-Vijendar.Mukunda@amd.com>
 <20261118104353.331556-13-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-220806@kernel.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-220806@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::7) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|MN7PR12MB148230:EE_
X-MS-Office365-Filtering-Correlation-Id: 83da933c-9c48-4c54-13fc-08df456c9acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|6133799003|22082099003|261009223027099003|11063799006|4143699003|56012099006|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	SCXeDEQhTQfmZ5kBgu03pJB3gKMSHb7gxcGSYTsqx3haMvzOeoDaShy/b7peuq7zgNaL/I89+Uh0FiE245+9/+ZORHiyv9+NWO7QkAJCdSbIzlv7/kuuDOoecS2cavLEt4S5ZQx6Pp6bv2lgxQTx41vKAw4BnXuArbb9Kj98PiwS3HWBT/dZG6Wo0NJF9m1L+0Gn0MpjitMXnZBjFQrJ9T1c3uM4X47PHm0X4jA9LqmHkLbWLRrwQJ4iWiu7A2tEluBwC/jpSwR6kXXX73Pm+Fpc3vFV2w5isls/tZGcsjq+VdE6LLgsSaEDfrZpPTSjMbNuE3wSjC2SPioTpqpoBJVH1ffL2OSK8W3OVN7bLucjjLqpVRa3oqCkfp9EkWj49AG6Ci7eYTyBtI/QO7K1gKUzsb+pXVQS6BV/KkZyekrnLZfGlgnxxBbvQvYJT4/R8MxcgomRaxEJHEtITnrYDAIb63cmTnbJkUFcH5CwI3jEv9wRJ6dSjfj2dQn/zale82Rb1R2d0nWAbrokjogLj9u2G5vh7uZdDNMjUf30bWQ/CDBawJLWxBP3KovXSzl4jqv0zdOkxda4qvf5B580HrR7da95R9R4DTLmIck3JMsvEHKPyojOxXETzMJDqOEBxbC7AHczi/1Jva7nBPE6YBxyiYFe9SSELl/CcxWN2BM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(6133799003)(22082099003)(261009223027099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVhXZTU4bkc5cnQrVmdnRDRpUzNUQkJaVmVBZ2FGcVYvSXpFZjlRamZNUTlx?=
 =?utf-8?B?UlBwc3VXRGFETVVFWlFUd1pHK09hRHIrcHI4RHJ5bVRzMjR2U096VEhEbXB3?=
 =?utf-8?B?L0x3U2lvNDIxaHYvbnR1TTRoMHpsNnRlQXFxUVJCY2krUXQrWll4TEViQTlw?=
 =?utf-8?B?UGEvNENwR0tvVkI5WEh2UVJUTFI1a3VqcElhOHNybmI5Q1VmOGk2clpxdWlJ?=
 =?utf-8?B?NVd5a0tmKzB2N2tNRlFIclp4MEE1VmM1aEdkY2s2V0ZrZVBlYWVEaHVPMGIy?=
 =?utf-8?B?QkxCeUpFb09GaVEzQ2txZk5qbDlyNVpaSGNkeFUrQ2hydzZPY2pLQkR4N2Z2?=
 =?utf-8?B?Q0t3NG9ydUlHbytPaUdZQWVDUFhKVFRCLy92cjJjcmtJQkwyZlNOdHpiblJ4?=
 =?utf-8?B?c043OG4vN3E4WW9ldSs1OWNUV1ZGQmlLMjUzLzhQMUltVk5ld3dwTm9hNVZm?=
 =?utf-8?B?dUFFZmNra2ZtWGpndS9MbFNBZHZDK0d1dE40cHREWWVZaXo5Z3lTNXRyY3BF?=
 =?utf-8?B?bnhUdlJVREQ5U3ExYzlCUWR1VUpidG5CcWpSS3kzNnBmSStyWWRVUHBsTjJx?=
 =?utf-8?B?V3V1TzZxTDY0VWhUaktiOS9tR200RzM4VjZFVmVubXVhdkRKcWhnR1h2RWdq?=
 =?utf-8?B?UkhSM2VPL1kyTVBNTk9Ma052UXovc3FBcjIzZ3NwZVIxQ1dvTmlQWnBGTEJW?=
 =?utf-8?B?bUcvMWlvc29YandXajAxMVJyNDZaZDEraXlJM3pmYTNNYUcrNzhRMmhHQkNw?=
 =?utf-8?B?SGlNcjRMUnRGWkhWSDdVSjY1M09ZakpnVXpRTW42TlBPY2VjRmcvSzVRTFNh?=
 =?utf-8?B?eGdlU01NdjJzR2hPMlV4RVJ5dFdod2dWOGhYT1NWRjh1WUZoamx6OFV3L210?=
 =?utf-8?B?MjduUFJJSktjTTZ2QXBBMVZHQ0loSEVKNjhhZXBWNVVPaVN0Q3kxMW1JNFVQ?=
 =?utf-8?B?UExUTnpnU1dNOXlZVEMvY2l5MmptZDlJZU54aS9va2FtYzRjL2l2Vk55bURo?=
 =?utf-8?B?bmlRYU0rOHhwMjVTWCtkbksvZC82LzJhQTg1ck43RVhaUjdFK3NsaEVlRFNu?=
 =?utf-8?B?OEpJWUZQUDA0S3F5WWN3VFNWL3N0b3g1U1J0OEluUDd0V3VrRHlEY3BVUzVt?=
 =?utf-8?B?RjVwWXVONFdPRU9FTkY0Z1dXcVBJTml6akx0NXJvMU50UHJmY2ZydFFLalJR?=
 =?utf-8?B?b0NUR2c2Uzk5QUpaTmF3SE11cGhXVm0xd3lseDI0WVU3dWx3bjhjd29aaFpL?=
 =?utf-8?B?eFV4ak8xV2g3elV3RzRnaXJLUkU4ZmtlbTZTcjYxS0Q0bVNQK3djemY5a2Fa?=
 =?utf-8?B?MDgyQkswNmt1aVRxWjQ5MmxGZFRRbE9VaVh4L0NkcStZU0Z4QlFkTmhycWZu?=
 =?utf-8?B?U3dxV2N2dlYvTVFzTE1nbEx1MkVjVkM2UGpnNnVDOXdYTEJ6SjJraGVDT09Q?=
 =?utf-8?B?L1g2b1M5czIxemF1QVJPN1lwSGc0Rmc3ZUFyQkJlOWNRNE9yOWJaNW11YW9v?=
 =?utf-8?B?YS9OOHI4eGtxZFdmQWtPejRIaW5qMHVBNlprNDFDOUI0SHppeGFIM0lodmVO?=
 =?utf-8?B?UmRYcS8yTEJNNTBVWW9hWEZpVUlzTE94TlBBUnFLWXpjMU1kYithZXhjd21h?=
 =?utf-8?B?UHlBclpEeUN0TnVmZm10NFY4bVJRYStZL2xnZjhPTGNNMFR3bXdEY0QvWE8y?=
 =?utf-8?B?N01oeG5qRjJHS3AxT2I4OEhLVmlKRlNVWVVZbEwrVHhkWGFiTkFDem5qRWV5?=
 =?utf-8?B?Wi9Pem5YdjZqRnIxT3g1c0NheFZuZHJ6b21udFNuSDVsMnpSNGRuMjNpbVli?=
 =?utf-8?B?VDFtSFE1TDRYNTZBRVpaTXdGK1FtQkdqNGNPdkkvZUxYcEwwaXhTWjRrY2ds?=
 =?utf-8?B?Qm84ZktpdXY2ZjZ2MVk3czNqdjg1VmJhdzZCQnhrb3MxbVQ5NzU2UlpUaG5x?=
 =?utf-8?B?UGN4Ykxzb0FVUHdyc01CNUVTaFpJTXZQQjFWbFBHODNySlRvdGhmeVI4TjZZ?=
 =?utf-8?B?ekhkNk5NNUhsK1hEU2dKTlRTcWVTL0VrQzgreEh3MksxZEsyemJsWGpzR2xk?=
 =?utf-8?B?SUFiQ3BVT3lMbk1FalpJQitjMmtLcXZpWEszalRuMHozbThVMEdOZUdxa0Yv?=
 =?utf-8?B?ZGV5VUh5ZnpCOXNydmlIT2czVkRtbVBOWGhSOEVXUGdpTmVva1gzS2J0VU5O?=
 =?utf-8?B?QjFxTkpLT2VtSXkwcHRJTUVMK1NMV05TTTBvQ010K2dveHlKbW5hVUpDTjhM?=
 =?utf-8?B?WTNBNTREZmJQZ1lJRkhwWHhZcnF5eVlRenNlU2YybFJjaG9ncWVpMTZhVGRS?=
 =?utf-8?B?OFhnYytnNy9hQURpQ1ppOXdZbUd4KzV4R0oyT1FqeHhRVHZiTnRYQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83da933c-9c48-4c54-13fc-08df456c9acb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 12:08:06.9028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elkCkWKp4k2oEr4FOaPDxiMMnbysINGlKC4MCNQH/cENXVJrvEsfTCHS2RJpwS6SDdpmVtXaUWZNk745sOgbOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR12MB148230

On 18/11/26 16:41, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] soundwire: amd: unsynchronized in-flight IRQ in
>   amd_sdw_manager_remove()
> --
>
> commit 71739fc162fa17f1b5b19380cfeb8b58889aa69f
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: fix work drain ordering in remove path
>
> This commit updates amd_sdw_manager_remove() to disable SoundWire
> interrupts before cancelling amd_sdw_irq_thread and amd_sdw_work.
>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index 9715e2eb22498..44ef45ba943bc 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -1265,8 +1265,9 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
>>  	int ret;
>>  
>>  	pm_runtime_disable(&pdev->dev);
>> -	cancel_work_sync(&amd_manager->amd_sdw_work);
>>  	amd_disable_sdw_interrupts(amd_manager);
>> +	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>> +	cancel_work_sync(&amd_manager->amd_sdw_work);
>>  	sdw_bus_master_delete(&amd_manager->bus);
>>  	ret = amd_disable_sdw_manager(amd_manager);
>>  	if (ret)
> [Severity: Medium]
> Can an in-flight parent ACP IRQ handler still queue amd_sdw_irq_thread
> after cancel_work_sync() returns, leading to a use-after-free of
> amd_manager?
No. See explanation below.
>
> The commit message notes that an IRQ handler already in flight may still
> queue amd_sdw_irq_thread and relies on cancel_work_sync() to drain it
> without synchronize_irq().  However, cancel_work_sync() only cancels work
> that is already pending or running when checked, and re-enables the work
> item before returning.  It does not wait for an in-flight hard IRQ handler
> that has not yet reached schedule_work(), nor does it prevent subsequent
> queuing like disable_work_sync() would.

amd_disable_sdw_interrupts() runs before the drains and clears the
ACP_EXTERNAL_INTR_CNTL bits for SDW. After this point the ACP hardware
cannot assert new SDW status bits in ACP_EXTERNAL_INTR_STAT. Any interrupt
pending before the mask clear fires once — acp63_irq_handler() clears
ACP_SDW0_STAT via write-1-to-clear — and cancel_work_sync() drains
whatever work that invocation schedules. No further hardware SDW assertions
are possible after amd_disable_sdw_interrupts() returns, so there is no
subsequent queuing to prevent.

Additionally, in CLK_STOP_MODE, only the SDW clock is gated. Even if
interrupts are re-enabled after clock stop, no state-change or error
interrupts can be asserted because the clock is stopped.

Wake events are asserted only after the SoundWire manager enters D3.
This hardware guarantee ensures that no new SDW interrupts can occur
in the post-clock-stop window.

>
> If amd_sdw_manager is unbound via sysfs while the parent ACP PCI IRQ
> remains active:
>
> CPU0                                  CPU1
> device_release_driver_internal()
>   amd_sdw_manager_remove()
>                                       acp63_irq_handler()
>                                         readl(... + ACP_EXTERNAL_INTR_STAT)
>                                         amd_manager = dev_get_drvdata(...)
>     amd_disable_sdw_interrupts()
>     cancel_work_sync(...irq_thread)
>     cancel_work_sync(...amd_sdw_work)
>   device_unbind_cleanup()
>     devres_release_all(dev)
>                                         schedule_work(&amd_manager->
>                                                       amd_sdw_irq_thread)
>                                           <-- use-after-free
In this scenario CPU1 reads ACP_EXTERNAL_INTR_STAT before
amd_disable_sdw_interrupts() clears ACP_EXTERNAL_INTR_CNTL. The handler
clears ACP_SDW0_STAT via write-1-to-clear and obtains amd_manager from
dev_get_drvdata(). At that point amd_manager is still valid -
devres_release_all() has not run. cancel_work_sync() on CPU0 waits for
any work scheduled by this invocation to complete before returning. After
cancel_work_sync() returns the CPU1 invocation is complete; no further SDW
interrupt can fire (CNTL is cleared) so schedule_work() cannot be called
on freed memory.
>
> device_unbind_cleanup() calls devres_release_all() before clearing drvdata
> with dev_set_drvdata(dev, NULL), freeing the devm-allocated struct
> amd_sdw_manager while the work item is being queued or executed (even
> with the interrupt_enabled check added in commit "soundwire: amd: use
> interrupt_enabled flag to guard IRQ work scheduling").

The acp63_irq_handler() in pci-ps.c guards schedule_work() with an
existing NULL check: 

  amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
  if (amd_manager)
      schedule_work(&amd_manager->amd_sdw_irq_thread);

platform_device_unregister() is synchronous: it runs
amd_sdw_manager_remove(), then devres_release_all(), then clears drvdata
to NULL - all before returning. After it returns dev_get_drvdata() returns
NULL and schedule_work() is unreachable.

Additionally, companion patches already merged in Mark Brown's ASoC tree:

34ea81a7f284 ("ASoC: SOF: amd: guard adata->sdw dereferences with
                 NULL check in IRQ handler")
41e06aaef9c0 ("ASoC: amd: ps: guard adata->sdw dereferences with
                 NULL check in IRQ handler")

add if (!adata->sdw) at the entry of acp63_irq_handler(). Once the
parent driver completes sdw_amd_exit() and clears adata->sdw = NULL, all
subsequent IRQ invocations bail before reaching dev_get_drvdata() or
schedule_work().

>
> Using disable_work_sync() on both work items in amd_sdw_manager_remove()
> would prevent any in-flight IRQ handler from queuing work after the cancel
> completes.
The hardware interrupt mask clear in amd_disable_sdw_interrupts() closes
the source of new scheduling, and the two NULL checks provided by the
companion patches provide defence-in-depth at the IRQ handler level.
disable_work_sync() is not required. No changes required.

