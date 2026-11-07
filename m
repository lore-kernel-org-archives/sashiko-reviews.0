Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794075501;
	b=NrC9neZcDoZQYc9XlKIl2asW4sRS6St+oFMaahe3BrTS+CbJURKnz4Pz/2/tQcCTuX9z
	 9FHRtmFrY4misVcIZ4lmZFxzvdLVOYDd0egqQhKTZoSrwjnr1YFXM9lNnA4UpB0iFif6V
	 JxR9rp+FttZ/ofHEj4S+3Tfbk4bWmRjlHdtTaVZWNPBYVGNM1YQ4nXJaXpI7HMQynv2Sk
	 b3KhQV2521VnlPxokt+2iBfUyb9JeO8mWo/cfyLjHibP3K5E7W9/oY7NgtCb1RGJiQHCO
	 1Hm00kOICnnLLnNzNim9mck5ZVtE0dcZVhczoM3OyFEzrpRDoaU3h/etwBbTsyt/+Iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075501;
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
	bh=NqmWjiBRy467EIvrCL+hR1SGS+pPWKWHim0KhNTE49Q=;
	b=tCeNkSJu76lVtHKKzMlPOdIzGku9r81FCVOFHtTjdfINWVPeaZ6TEC1ppUxgqgsCk0Y1
	 j9zrG+VkggBHMLkml6nNMzGN9LZ2gYmOZUMbiR9Ucs5Je9nQZwBdsOX+eLbEJEkU4tMdp
	 UW9c/ymj9hRLPOtgspga+N4hMwKmKTx347gTCO0xzxeFUOAkLX4ieESKotL2+ESQaW2JL
	 RzkWShY2XsudDUJjFDJPjUHRaEvlvFVtvUAVfciIb/5gyndJOv35QRfY7sZfAETnINxwo
	 IUTkpbPDvgVC3AoIWQMomIDV7ErKmiZW/GvXU2A12y18bEPT3uhxfuKvu/DF9X12ekQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vMwxLcB8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.21
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5705606A326
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 18:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5705606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vMwxLcB8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1WVJT8J+cW1eCrVB2ghSgiAuxYggM2tv0ZTr8FWTxW2Rp8YMfYqAYB5DiVOaLCOAWPtT6cV9Xp6H2cdyxWB90LHeD3KqlEXeXXd0aUAO7v3jT86tqSRB6k7+4eemyIP0wwqEPhhi+xXPYi6011MblHRbmZVIFR7gvUccX7ktbZs4L+8Sji4z2mU25QVYJcPdt9fBUp/XbPapcMKy0F+TYdufefzTlovA81d6OUDVNUiDncbBevw/4M7P+e07Slcz4A/oZh9DDR+vR6BNkEDPXAA4iclTzlC5E08O6gXc3zvPhqhNbPoaavjQIkEMqtQiw1deSiFrfZWzW8EFcFvPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqmWjiBRy467EIvrCL+hR1SGS+pPWKWHim0KhNTE49Q=;
 b=K0Aymog+QWaC8TpN7M7ioqi4Io7qbzde/9HDqGQRbhAo8CuXL44YDvMJp2yFZJ81exhDqGKxNDNKl1Z3q/F5vpNtfeUjnBu4SU1uP1rbbjytqPNpqvmVmKFUCAu/xDLdg970h2oMvZwZ/IOWyeR4+3sz0T+DC9k0grZpNzKIUd3sl6yMx0JtiT1u8x4QMAcIGhzfRciIZrdqZOomLVaAMfVq0591hizwpAA2gDIQpVu7O6mBPkANRoCQI8OANCkPgsRV40vhtqAVjCqIhUDOaFHiHBnyJYnp4SpYd6L7rEmgcsQkVNJS/vpAlJEJdo7BnKI+a0TAWIT57EO4/VFSaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqmWjiBRy467EIvrCL+hR1SGS+pPWKWHim0KhNTE49Q=;
 b=vMwxLcB8HUFsm1YLxQqOWLfMVPIIDTtrZzfcmkV4VEeCKijW6vNYhbKoNeg6+YBP/XO9SBedgIMNoH5rDY2EhQIcb+dM7/ZhXFcnviZf+GvOjyFFgpolV7FFlz1FE5QScSmCFVSxnAKsn/Ho2yDIIEwjok1JljkiStonCQHMHME=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by DS7PR12MB5766.namprd12.prod.outlook.com (2603:10b6:8:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Sat, 7 Nov
 2026 18:16:11 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.009; Sat, 7 Nov 2026
 18:16:11 +0000
Message-ID: <8909ff7d-1a12-462e-af96-98761691b84e@amd.com>
Date: Sat, 7 Nov 2026 23:45:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ASoC: SOF: amd: guard SDW IRQ work scheduling with
 interrupt_enabled flag
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
 <20261107175339.3547918-4-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-203151@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-203151@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYP287CA0063.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25a::12) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|DS7PR12MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d7c2bd-0acb-490a-18b6-08df3cfb335c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|10067099003|11063799006|4143699003|261026121527099003|261028144727099003|261022075727099003|261022105027099003|56012099006|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	Ez7MVpcR1yewUCZwUZjr2YRcLNQEJiwkLgfgeL1H/sQPkEefHSnPTRjppIEse3GwB3CIeJVRZlaLqkhmjeGMaQKKE9U5gB89SLMSyrLQW/pnMo4MbnUP0b/0Yv/UGZJw8nJ6by/V8KEZ+7zQNEtEOOFhCnXidaffdKnTMNjKBP+E8LoMZ2YimMReZAa6wnQMXmpQWbfdgJOg5s1lY90fKo8JWiTlIi0Z4P0a0qevaLl7ESP0vP9WGciFiu+62F8KGxqMc5EtGKsGT37OWYLw60WpzPUyiJoBSYJqB76x2jmpigFaS2Wy1asw8v7bparyw2dWyw9bclFojAG5OxevcUqcZ+6Ik2zUCCUj48vBg0PJfBPCbVVyBJCrartkIWqwtLuXHrMW4C2B8oIiTZTc+FbdgvZpq5Ogu5v1tokHc/u/LpEkBTxSdZE9U0KX8/cmby0e3v3kvGKzWEkeVv0IHNqquWp+r0hrFFc3vK1ijQ+vqDzPqkWT6ecpROP8OGU8xxozt6TqmlfDjtI08IF5A/W09h3ax0IqGwlVWJm8+Ku4rhU5eZnWBOY3+9vUX3imzYjNloXMHmhhwL6m08PubPSFcD0FSOJFRZm4MnA8L3D/o5i3jmrXGxyIHEGGzfKT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(261026121527099003)(261028144727099003)(261022075727099003)(261022105027099003)(56012099006)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWw2aXI2bFhQMzFPcnNNbUNtUHhsTDM4RzhMUnlpRWNkZElXNkpXMTBkSFAz?=
 =?utf-8?B?bTBEZXlPc3JTVGNrZ01Gc2NicTFIbk9rOU03NVJaWFJJdVZ6MkFnbFlZNHdF?=
 =?utf-8?B?SjZNWEZ0ZGo4NEFMblRoWkVMNTJmaEJRS2ErNUlzSGxyT0lnOURjaWIweTFm?=
 =?utf-8?B?dmxMK1B0RFNMa2VOS0hoU0NlSitKWiswK3ZoUTRwa1AxNUtJVDFPcXkyOFVE?=
 =?utf-8?B?dEdpNVQ1U2JhdkgyMW92ZVp3VE1vZitSQThXWi9CdFVGVWZxTTFJcVBDeitk?=
 =?utf-8?B?b21LbndleXRvN0hIOS9yVWxiak1VeVVYM1NacEJiU0xWYUxGd0FnNWxHaklu?=
 =?utf-8?B?bjJhbDlpZDRyY21OQS9sanljUmZiUGhEcmx4ZU9CZE1lNFdoTEtKeG9mcHdO?=
 =?utf-8?B?MkVqVzJKWGJXakk4N09FL2diSVI1TFk4ejlXU1B1T3Q1OXdTa2JScFJOSDJm?=
 =?utf-8?B?Zm9oTHhzN01FMHVOTTNHbGo5M1R0aGsySVJubllIQWIvWjN0SVA5WWFocmRx?=
 =?utf-8?B?NFN0WmkySm5wOENVVUVhZDk3ZndZbXNYd3lobnYrV1JwR3dmdExtNHhTdGdy?=
 =?utf-8?B?bUJJL3hEMGkzTnhyR2JibnNhaHp5UHBtWUg2bVNtWUpGemY4ditZSGhYYkcy?=
 =?utf-8?B?bWZDS3BieldNVDJQaUZTaDd0SWVYUzZQWmF2akNOZ2VlWUQ4dVJSbmcrRmo1?=
 =?utf-8?B?MFdsajI3MWh1UzFpK3JFRytpdGV6cmt6OXEwY3Q4SnpUTHVMZUhJcVlyeVhW?=
 =?utf-8?B?bVh4QU4yd1lLMnFMRzgreVVkb3pHQnBhb0wzV3lRT2xWbENzek85MWRsYnZt?=
 =?utf-8?B?TFFWY2UxSElob3dYMHU0clV3RDdOTzhQSUpRekxMUkt2QlRPRWQ1a3BQbGsw?=
 =?utf-8?B?OFI3RmhKYkdSbENKdzAvZUIrUHY4Z2ZxY09MNnJWSFd1d1hqNEJqVng5eHlp?=
 =?utf-8?B?VVNndUV3R3NGK056T3ViL2dlTmE3dCs2WmpCMlNTVDU4cUZ1cTB5TWNiZTh4?=
 =?utf-8?B?MkZzWUFhNk1zRlB5V2MvbERBZ1g1d2pLQk1uL2ZCeGlpN2tOb3A3dDF4MWcw?=
 =?utf-8?B?c1hadlRkUnZoKy91NWU1Znlhdk9DV2FWUU9NL1JvTHF2ZG5oMlI1NXJLR0F3?=
 =?utf-8?B?d2l1OWVQVk9NdEhTNUxTV2k1V1lYYjNIVER5VTkwZVcwRDJ0RlQ5ME1zNEMr?=
 =?utf-8?B?Ty80MGVSSzUvdDd2R21XdS92U3YwMTFSdC9SOGdmbUQrWmJzNEluNzlQelc0?=
 =?utf-8?B?Y2gvcFcwODZTcXg3SlVEaTg4RU1hUkY5ejlLM0FVRnBVVVVETmRTMUF5Wito?=
 =?utf-8?B?Z28zSWlTdW1LdnducG9qNzNZbzVaVm93M2NzYVVaT2Zpb1NwTE1FdTliNktm?=
 =?utf-8?B?d1pNOHV6QWZjanFWZG5oS0t5OWZsb1pTN1JtS24zVHdLWkVpb3YvTVh6bEQv?=
 =?utf-8?B?OWxLYThUSXVqQ04xSVdtN016OEI4d1htZEdydXlKL1Q5WDZENDM2ZUtFYm9N?=
 =?utf-8?B?UERiYTJuRkVNbnljSi9yd2RDTGZ6MmtMdTg3RHZGVEdWOHF1dDFLcjdQTEZC?=
 =?utf-8?B?aysydDJJY21STEFkSW4xVmJmSE1lSGhSdy9DbDRjS1E1QitCYzdBTG90dGJP?=
 =?utf-8?B?Yzh1ZmJ3cWtINWtIcjJFbnlYMEdxVHgyekZDSzkvRVd5bGVJa2N6a0Nqd2da?=
 =?utf-8?B?MGFsYm9RNXJmOUh0OS9ZbS9JY0hDcHorUWVza01MNVZjeGFuNmRONVpBS0dY?=
 =?utf-8?B?YUJhR01PNG12RlVrQThlNmhyQWJURWNwSFhvbU9nNEFoZnZ6RXZZMHdiazAw?=
 =?utf-8?B?QVRQRkJJNHd4bFE3OTFKeUl1UndoMzdzSjFQN3dyZnFTb1loZTM0RkNtaWph?=
 =?utf-8?B?M1Evc2ZYMGFla1VVbVhPSHg2Qm1iSUZmbWM5Ykt1RVFTMUNrSEdVZC9Nbktq?=
 =?utf-8?B?UGo1QmhKN2tKV3ljczV4L0FRWDg3RXdJcVhvQkJvdXB4a3k4N0wyYnVXVzN4?=
 =?utf-8?B?Z2IyWk9tZnM2SEVCNmJ4ZEVOZlB6ZnpkQ2YzcGdDUG1YVHd2TE0rNUVUUXV3?=
 =?utf-8?B?ZWNEQm93L3BndmlVb3BybXJHZXQvZDNEY3pES0tWVFUycGdwUStUbkgrU3Ra?=
 =?utf-8?B?Sm5YTEdMYldWTVpCTXRKcCt5SVluVHhHQkhmOUhnbnJkdVlZNUpoSS91bFc1?=
 =?utf-8?B?ZE80Qmx0aktQa1diZy9SR0Y0TUNaQ2phbGlmRlZxd2V2YmNObllVcllVUzhP?=
 =?utf-8?B?a1BRK1ZXRDZVc0s3eGZYQ1JpMTB6YThNT3RMVHhFaVBBcGlvMkZYZ21sZWdy?=
 =?utf-8?B?UXFjVVpYQlZ0OW5ObjdwSi9rQ0VNaWk1K0tqd0NvUEFucnV5eUlrQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d7c2bd-0acb-490a-18b6-08df3cfb335c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 18:16:10.9714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsaCWXTqysDwdMX7cc1rudj14ftUO4yk069yqacXtDDtNsVa78kud75tOPunyY5isT9n40K9ipTCNt8mC7U2qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5766



On 11/7/26 23:38, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] ASoC: SOF: amd: build failure in acp_irq_handler() on missing
>    struct member
> - [Medium] ASoC: SOF: amd: unguarded work queue in
>    sof_acp7x_handle_sdw_manager_irq()
> --
>
> commit 84b5998c660c53c97f1f81d73a850a90f66dfb5d
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> ASoC: SOF: amd: guard SDW IRQ work scheduling with interrupt_enabled flag
>
> This commit checks amd_manager->interrupt_enabled before calling
> schedule_work(&amd_manager->amd_sdw_irq_thread) in acp_irq_handler().
>
>> diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
>> index 623e016f38b83..5c4eab0be497c 100644
>> --- a/sound/soc/sof/amd/acp.c
>> +++ b/sound/soc/sof/amd/acp.c
>> @@ -586,7 +586,7 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
>>   		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_SDW0_IRQ_MASK);
>>   		if (adata->sdw) {
>>   			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
>> -			if (amd_manager)
>> +			if (amd_manager && amd_manager->interrupt_enabled)
>>   				schedule_work(&amd_manager->amd_sdw_irq_thread);
>>   		}
>>   		irq_flag = 1;
>> @@ -618,7 +618,7 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
>>   					  ACP_SDW1_IRQ_MASK);
>>   			if (adata->sdw) {
>>   				amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
>> -				if (amd_manager)
>> +				if (amd_manager && amd_manager->interrupt_enabled)
>>   					schedule_work(&amd_manager->amd_sdw_irq_thread);
>>   			}
>>   			irq_flag = 1;
> [Severity: High]
> Does this break the build when CONFIG_SND_SOC_SOF_AMD_COMMON is enabled?
> struct amd_sdw_manager in include/linux/soundwire/sdw_amd.h has no
> interrupt_enabled member, and amd_enable_sdw_interrupts() and
> amd_disable_sdw_interrupts() in drivers/soundwire/amd_manager.c only update
> hardware interrupt mask registers without setting or clearing any software
> flag.
>
> [Severity: Medium]
> Assuming interrupt_enabled is added to struct amd_sdw_manager, should
> sof_acp7x_handle_sdw_manager_irq() also check amd_manager->interrupt_enabled
> before queuing amd_sdw_irq_thread?
The interrupt_enabled field is introduced by a prerequisite patch in
the AMD SoundWire manager series:

https://lore.kernel.org/linux-sound/20261107154659.3358223-18-Vijendar.Mukunda@amd.com/

The cover letter for this series explicitly notes that patches 3 and 4
depend on that patch and should not be picked up independently until it
is merged. There is no build failure when the series is applied in the
correct order.
> sound/soc/sof/amd/acp.c:sof_acp7x_handle_sdw_manager_irq() {
> 	...
> 		amd_manager = dev_get_drvdata(&adata->sdw->pdev[instance]->dev);
> 		if (amd_manager)
> 			schedule_work(&amd_manager->amd_sdw_irq_thread);
> }
>
> On ACP7x platforms, an in-flight IRQ in acp7x_irq_handler() racing with
> amd_sdw_manager_remove() or amd_deinit_sdw_manager() can still queue
> amd_sdw_irq_thread after interrupts are disabled and pending work is
> cancelled, leading to a use-after-free on amd_manager or register accesses
> to a disabled manager.
ACP7.B/7.F SoundWire manager support has not yet been added to the
SoundWire driver, so adata->sdw is never assigned on ACP7x platforms
and this branch is never entered.  The interrupt_enabled guard for
sof_acp7x_handle_sdw_manager_irq() will be addressed as part of the
upcoming ACP7.B/7.F SoundWire support series.
>

