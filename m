Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795775948;
	b=Bx6n60Qz/a7EMBVVj6RE2/b+NMNdfOZKPmytFQFtsxpa0Qkz0mGUV3EN6HN3Qvh+KfBm
	 8uu3WBsax9yUqmONJz4KYKQ6G9RJ4IxrjdoHQVdH2gjT1LK3qbtZstV+bSVxyaW6j4Sp0
	 9ZRQNYe9o/P3SPiwoEorN/9xryOtiy997gvMTJtA9uXysazpmWA1AZ4+Kk/H7FKSvB7rA
	 wkusBNd81phphAExbKSB5qlqwcp/A1cEXp7Fmrpcr97NuTD/MsyZqCINk7ao2FC3QJCza
	 h67rKE3eDe6XY6Y9eXi4sy7gbu0O8FywXFs598o4i/UCOeVYR/I8gG5ulVDVVePXjQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775948;
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
	bh=yuxgGyK7sH0AQv9TUPJLc1CfQ6Q/Ro/OlhcRBAzCvfI=;
	b=1rDyFid6Z/w2zxdDmivxjTzp6As0lnNhS6mlRsiiR2Sr60qC1uLqlvxYzPXAeD7fGzLf
	 AGyx22fpgiB/3b7oBSzL+3uyBCETQT0UDgIlS1UZeIgmlIQRCtuNYSodeQU/vb4Q0AU+e
	 u5S8y6i7d5GA8Xqi+ue4Fjk0tffbgX/lBhvvAHKTVwZYfdBC5MO5JOCwB7gU85WcCuTIx
	 4hOMVk7vJvBNcNE/5gm3anRMwBCE9flBN/gtMRMPl5+yXj7l/HtMxEe1frdxWmRmJYtJ6
	 4qUtMVKF9HarwPiXgLOqEBSNMwQVw/o8fUQ5u1zCsEwEl7CfE2RXreBzNvCp7eop6Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zDS3eyAU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.55
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010055.outbound.protection.outlook.com [40.93.198.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB00606A31E
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 10:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FB00606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zDS3eyAU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eb944RSaLPePVZ+ah6wbxMcEUE1vgdRHMvE5xGp5p3TG2bRj9ijhfAPkxH9yW0PJV9/YyiYhtVer2MkwetALC3eRxlNKFx+nDnBI3qxf/+hPx8wl2C+/dkQ/ef1+ZXR4UXMnnvdOKy1Pdgsjja477vRwFwbQtbs3vj2NR/Da2Y4BpBG/KCOxmxQf0shT319mZpjuY56PdVGB83bMW+Vp0hmpzXJW5zpY++2vJPVGJZm6lDYZFD7PNvjNR9fAvwKoFQFMDRj9JZkffL/ANY69tzuRfcTkwHItb9a6wL+V9/7QVcFs0u4quzFsLydJeQJV/p6nI+GlG7rsjghTn5tlYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuxgGyK7sH0AQv9TUPJLc1CfQ6Q/Ro/OlhcRBAzCvfI=;
 b=HzMnmel3EyZkP/vEwi2H6JVMMYOOHT1nhMZF35OCgD39Dj6AnoFesV+rweSkLfDADEkk9D4OW6jPf9jQIqTVBjuqKH4b11f7EQnNBIC3rBMwjeviGccgPv4z07K8orkrHSoJHHNcUgD16e8MYDAq3UVgy3E7g3xMMBBTHB/K/4VCvZRxkWvKAZvEpPrh/JLeTivCQ2wBMcVp6U6w1UISHm/tjpwNhVA/sukyJTXQYmwJmpOSiBJNEAIw9rxDog+PEpExITrkPSZPIDB4wLYntV0ZEs5AFLMQyf1R0+7kIWBx76WU1nfB2Vk81N2NqW5Ob+DNpIdDVC/ve3PBVdxNTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuxgGyK7sH0AQv9TUPJLc1CfQ6Q/Ro/OlhcRBAzCvfI=;
 b=zDS3eyAUcpzuzC9AWdBFTY5SC34CMImiY4Ddyrp2A0B5UWDL9hSQffFJ+I4c5T6nUBEWl4TJXQOL0Z/zCEFFOIaNF7glMfyZj4OlajhQQ53RcaJiZAVnlAb8RrjM5Q0YgbBHb9qUlJI0gygERHWzo9Rb9Qq6nlTY5sCn/9Z6xBg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8466.namprd12.prod.outlook.com (2603:10b6:208:44b::7)
 by SJ2PR12MB7893.namprd12.prod.outlook.com (2603:10b6:a03:4cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 10:38:58 +0000
Received: from IA1PR12MB8466.namprd12.prod.outlook.com
 ([fe80::150d:6209:9689:944b]) by IA1PR12MB8466.namprd12.prod.outlook.com
 ([fe80::150d:6209:9689:944b%6]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 10:38:57 +0000
Message-ID: <f377995a-f433-4ba3-b6ce-2789d8d00989@amd.com>
Date: Fri, 27 Nov 2026 16:08:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: SOF: amd: acp7x: reload firmware from disk on
 S4 resume
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, broonie@kernel.org
References: <20261125053843.1611378-1-sravisar@amd.com>
 <20261125053843.1611378-3-sravisar@amd.com>
 <sashiko-outbox-232637@kernel.org>
Content-Language: en-US
From: "Ravi Saravanan, Siva Subramanian" <sravisar@amd.com>
In-Reply-To: <sashiko-outbox-232637@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::15) To IA1PR12MB8466.namprd12.prod.outlook.com
 (2603:10b6:208:44b::7)
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
X-MS-TrafficTypeDiagnostic: IA1PR12MB8466:EE_|SJ2PR12MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 268a2de0-17a7-4915-aa7a-08df4c72a3ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|11063799006|261009223027099003|18002099003|22082099003|10067099003|56012099006|261022115727099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	3rkME5uHFCTPvrYeWl+JqebuqsWr2thHMQ/gFqAOPd7C2oMAYTbZqXfNCS8caAalUsc57V5GmtYmfmXfrR2HA+0lCtmZKS2Uhulh203zCzQ3a5K+0PW/p9PZmDUEw3BF8WnecgKtSmJEMnEZrsMjlybwyzU4t808yFj2RBk3W7cGgeR/74G+OwZqUZpw+nnXCTZzGVlYl0tKuPG4KR4MqXm28LqxtFC2a51gmchBOb73yddkhg1fFF1EyQq1+tShf8KSUDureHzRd7cigWyIOHh12xVGNjkgQvPqVz3Rl5St34yDFOC1hnArgv6yO8dNZ5yF1yWKpyvov0P/h4VZgCVWiltGraOw83o7dNYsnXw6APjUiIpqNDtlj/eorT9//ZcKrQxycgfdaePZ6WJScOLV1K4a9ZO/XRKRFG+hB138zhD5wAQSRzAVe74kw63SeaceqZn0RPd0N04RSBqoQrZu/TtlVeewCSNCYl1fQceB9oqEygM1FRjm4wqhZz4WXKCx+QtQoT10UV0Eu6RVwFcfCzW7sONVLlBnC2eVaCTFC0tqLQPxEnhulxE/Z+LVLgfdk+eghQZ+VHaqW3/rYc/C7V4PfcyCMNi4aA/KfLc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8466.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261022115727099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXRGTE5NUDhjejFkcEtxQVdNMTBRb040TWZ4S1dZRDlCQzFBRmltZEcrVFBu?=
 =?utf-8?B?ditnZGtoK0JibExaTHRDbnNmK2ZxNGdLcUpTODV5U0ppZ3RHdHpZWVU5emUx?=
 =?utf-8?B?UU55dEVMVXZxUWEzMlU2cjRCZ2lXSkRsUnRSK2RhNlZ1Tm5UeFJaVkxhNFpV?=
 =?utf-8?B?Q1pJN09Ha0JxTE5nS0RsTjFOdlBLcmZGK0VlcndVTHQ0cjZUZUVIWUhIcnV2?=
 =?utf-8?B?MmRNbEFUZzZFNFZtSG1CMTdjc2hhQWIyNkYrSW5KbEd5QmFNa2FRMGwzZFUw?=
 =?utf-8?B?VUg3T1hiNG1DT2NpRVFGeGx5TExkSUZ3NzhpRFpLRGlQUTVDRFpNeEMxMkpC?=
 =?utf-8?B?OGJEd09Mc0w5ajA1WU4xckpmdGNocGZyb25lcXhQdVFTODZGZGtqN2VHdVlw?=
 =?utf-8?B?RGtGZlUvNjZFdWxnVnRabmptdFB4eWFTU0VPd1R5clhLV1VkbVE5K29lbGdI?=
 =?utf-8?B?VXRRZGVXQVQ1UnowekNpTFBUS3lkZC9WZUpBU1VPQnV3dFlJclFaalpPK2lk?=
 =?utf-8?B?cE5tbVpKRjhqYjlhL3dsOVE2SWFKQTY5Ylc5WENPa3BHOUFzUzVIcmVjbUdZ?=
 =?utf-8?B?UzFoYUtpeTByWkpOMXVHcjZxcDljZC9aeHVnc3JJcmY0TnRwSXVyZUJyMFdY?=
 =?utf-8?B?MWRBN2d2elAzUjNwN01KcWlHclM0TVBBd3ZTRW9SV0prQmppemlMVlhxVGhm?=
 =?utf-8?B?V1JkL0VFNHFaenRRaUpYaXlSb3pZVmVtRExtMGE4ZmJjVlhzeWVyRVRkeE9k?=
 =?utf-8?B?dCttdXFVcVJ2eU1MOFQvdmU0djhnN2hXbndoZ05IelMzK0JlQkJNdyt1dHMy?=
 =?utf-8?B?dmkxUnhQajRSM0Y4eEJrS0FQSDZGUzAyeFkvQkR6K3RYejdpdlJZaFAxWjNC?=
 =?utf-8?B?Nk9yOXJRNThhZXBuYk1xV0lVRHhIUmxubmVNMGwrN3Jxd1JqTEVSUlFwYjg4?=
 =?utf-8?B?Yno1NXM4Y3VPb2NKdkl6RkVISk16YjlwMjNPcWNabDcvL3IxQSt3VWtwVjNV?=
 =?utf-8?B?Qm9zY3grWmVzbmgrelZzMnhBMkhhTHdSeEpHWmRhMkdjLys3MW9nN1VRYkJB?=
 =?utf-8?B?c3Ezd2gvSVpLaHNicFRDaVBNTStjNmQxSjZpNG9vUWdKN1BuMDhvOC90TnYv?=
 =?utf-8?B?c2VyNHNtWlNOajNsQ205OW1yMG1zbmgweEFuZFQ4cVhIeFptK2hwMDl5cVNp?=
 =?utf-8?B?bmUxYm0zcXdWZ3JZc1UrQUIzWGUwTkFkcnp2b2g2WmE3S2pFOEF4UWVIV01R?=
 =?utf-8?B?YjRZYU05SE5BRU5xRkMvUGJPR3Y1cDhEb3BDSlNoSFNjSjliSm4rVnRRNDVv?=
 =?utf-8?B?SXoxYXRnTVltb0dkS2pQSHdXMFNQVkdjSjM0czY0aE0vVXIyWHZpYnJodklh?=
 =?utf-8?B?YXU0QmNBT0JTU3pnZm15eVV4eE4wTTdnaUZMUG1GMGFLblZSRWVUUXh2bmNy?=
 =?utf-8?B?dG4rc3Y0WC9Va3czTHhtWjFRNDFuVWlNOXZIbWQzZUtoOTdLUFVqOWk5ek1U?=
 =?utf-8?B?ZEtLeFhQMnZ0amR6c2tqeDZySW0zS2dmS1VIaXlVNko2QTRZZ1BDYzhUeUZY?=
 =?utf-8?B?UGZqa1hHUGVFcnNtZGxQWWx6NzJpVFBnM0NodlJCbmFiSWt5ek0vUExjVHZJ?=
 =?utf-8?B?VkROY3NVdHhhMEVpT3pvOFlMMkEzejQvNDRHNWk2Z0NGMUpIUGYvbEtpUlkv?=
 =?utf-8?B?cU5aMDAwM2x2V0VEMFYyOXpBcUdHRHVud2ppMk0wbThIbDZBeTZhMTlGbHlp?=
 =?utf-8?B?bGM5STZ2U2FTUnlYS2FUT29wRVhMNlREdTdKR0ZRbHZ0bkxKb2ZHVHlhOHBB?=
 =?utf-8?B?WDllRHh6UDJqaW55S1M5ZWhMU2xtWnU5MkxCTUo1V0NzTGt0RUNZU0FPbFNU?=
 =?utf-8?B?dzFhTGZRRW9kTEpmZ3FDdC9CMUoxNmNuK09CcEhZQXNRT1I3SnpJRlU1c0s2?=
 =?utf-8?B?aVJGMExJeEM0dmVLME5tZkV1bTBtdnNkMVRGb1FiZ0V5TjljZ1UzREVwdUpD?=
 =?utf-8?B?TGlITnFmSmVCWkE4bXZGcmdxU0p4dk9adlErdkZZMFoxWFBCZFZFWVR3d3Fn?=
 =?utf-8?B?amRTV0JEb0gvMUJzYzk3UDJsMi93UkEvOWl0NDJSazg2UElZdUViZlNBNkJW?=
 =?utf-8?B?c0xvWVlVZFlxMEdoTGgyZTMzUDJoT0ZFaUhNbTZ0V2Y2YlpJcmtGRWZScVE4?=
 =?utf-8?B?Uy9iVGZxZ0kydkdZR2p1NHRjV0NISlRxWnlZVjA3a2MvRnZvV01XRE90elZC?=
 =?utf-8?B?L3dlbUFXMGROa3pWYkRqNVkvdzE2VWk1Z0pFWUxXdEl0aGdURDl5VEVzR29U?=
 =?utf-8?B?MEF2YlpkbWRKb2R2YTZZSTlyUmJGMGdJS0R5U21iTnN5Z3pPZCtJQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268a2de0-17a7-4915-aa7a-08df4c72a3ea
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8466.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:38:57.2389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1VgntlhZ9VLqPpwFM2iQJT2RwDjh31cJN2lRAf1qZ8+8/PrWGB6r0LkfgFbKo2mf/qYdDwhAVzFt2IIm0ogPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7893


On 11/25/2026 11:32 AM, sashiko-bot@kernel.org wrote:
> [You don't often get email from sashiko-bot@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] ASoC: SOF: amd: S4 carveout reset bypassed in
>   amd_sof_acp7x_resume()
> - [Medium] ASoC: SOF: amd: missed carveout clear in
>   amd_sof_acp7x_resume() after FW crash
> --
>
> commit b8704d96ab1f4418fdf040e05ffe9e060f0a776b
> Author: Siva Subramanian Ravi Saravanan <sravisar@amd.com>
>
> ASoC: SOF: amd: acp7x: reload firmware from disk on S4 resume
>
> This commit clears fw_code_carveout_addr on S4 resume in
> amd_sof_acp7x_resume() so acp7x_load_firmware_carveout() reloads and
> re-validates the firmware into the ASP carveout after hibernation.
>
>> diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
>> index 0d208df621e29..4ad54e5b4f660 100644
>> --- a/sound/soc/sof/amd/acp.c
>> +++ b/sound/soc/sof/amd/acp.c
>> @@ -1672,6 +1672,15 @@ int amd_sof_acp7x_resume(struct snd_sof_dev *sdev)
>>               return ret;
>>       }
>>
>> +     /*
>> +      * S4 powers down the carveout, invalidating its cached firmware. Clear
>> +      * fw_code_carveout_addr to force a full reload via VALIDATE_IMAGE on
>> +      * resume instead of a SHA-DMA from the stale carveout.
>> +      */
>> +     if (acp_data->asp_carveout_base &&
>> +         sdev->system_suspend_target == SOF_SUSPEND_S4)
>> +             acp_data->fw_code_carveout_addr = 0;
> [Severity: High]
> Does placing this check at the end of amd_sof_acp7x_resume() leave
> acp_data->fw_code_carveout_addr set when acp_data->sdw_en_stat is true?
Agreed. We will move the clearing of acp_data->fw_code_carveout_addr
to the start of resume, before the SoundWire and acp_init()/acp_memory_init() 
early returns, and uses > SOF_SUSPEND_S3 so S5 is covered too.
We will respin in v2.
> When SoundWire managers suspend in clock-stop mode,
> amd_sof_acp7x_suspend() sets acp_data->sdw_en_stat via
> check_acp_sdw_enable_status(), causing amd_sof_acp7x_resume() to return
> early:
>
> sound/soc/sof/amd/acp.c:amd_sof_acp7x_resume() {
>         ...
>         if (acp_data->sdw_en_stat) {
>                 snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP7X_ZSC_DSP_CTRL, 0);
>                 snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP7X_PME_EN, 1);
>                 return acp_dsp_reset(sdev);
>         }
>         ...
> }
>
> sof_resume() still calls snd_sof_boot_dsp_firmware() afterwards, so on S4
> resume acp7x_load_firmware_carveout() will skip VALIDATE_IMAGE and
> SHA-DMA from the unpopulated carveout.  Similarly, if acp_init() or
> acp_memory_init() fails before reaching this check, snd_sof_complete()
> resets sdev->system_suspend_target to SOF_SUSPEND_NONE without clearing
> fw_code_carveout_addr.
>
> [Severity: Medium]
> Can acp_data->fw_code_carveout_addr also remain set on S4 resume if the
> system hibernates while sdev->fw_state is SOF_FW_CRASHED or
> SOF_FW_BOOT_FAILED?
Yes. We will clear acp_data->fw_code_carveout_addr in 
amd_sof_acp7x_suspend() when fw_state is SOF_FW_CRASHED or 
SOF_FW_BOOT_FAILED, so the next boot reloads from disk.
We will respin in v2.
>
> In snd_sof_prepare(), sdev->system_suspend_target is initialized to
> SOF_SUSPEND_S3 and the function returns early before querying
> acpi_target_system_state() when sdev->fw_state is SOF_FW_CRASHED or
> SOF_FW_BOOT_FAILED:
>
> sound/soc/sof/pm.c:snd_sof_prepare() {
>         ...
>         /* default to S3 in case the followingaske fails */
>         sdev->system_suspend_target = SOF_SUSPEND_S3;
>
>         if (sdev->fw_state == SOF_FW_CRASHED ||
>             sdev->fw_state == SOF_FW_BOOT_FAILED)
>                 return 0;
>         ...
> }
>
> sof_suspend() then resets sdev->fw_state to SOF_FW_BOOT_NOT_STARTED
> after snd_sof_dsp_suspend() returns, so on S4 resume
> sdev->system_suspend_target is still SOF_SUSPEND_S3 and
> acp7x_load_firmware_carveout() will SHA-DMA from the powered-down
> carveout.  Clearing fw_code_carveout_addr in amd_sof_acp7x_suspend()
> when sdev->system_suspend_target > SOF_SUSPEND_S3 or sdev->fw_state is
> SOF_FW_CRASHED or SOF_FW_BOOT_FAILED would avoid both issues.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261125053843.1611378-1-sravisar@amd.com?part=2
