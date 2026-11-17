Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794909622;
	b=NimvoGAVSQPgCwGaYYDyEyU6PWwTYuvPvhHIGcN4Ja+nAQBYaYkd86N5mSGmtTry8w+4
	 MeXx546xpinXOTjWJ2QtQlvgmJL37v8f4Ww0yJg9WnpCL6iE1GqQkHoqc42TJVAbidUaL
	 Qic0pYNZA4JM+j41a9Pcnb5tt3YNTsml40abCWc1mv92t8CNLXMc6qVUdJFpMy6FhLE4k
	 mUDf5j7yiH3oa1OdeCmnQx8ZVOuE+eRp1wYXAy7gjXt4u8TDIUgj9yGZlPP1RhQv1ID6m
	 bfIBPQVJOeRGx38jM4f7AVkTRVT8INtcj+qVolF1cYKK5GTI9V24TcoE826T/LwC4SA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909622;
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
	bh=LSSOq2sRF7yLaEhh9HGL4j9QUJjFRKQukBuXs+R8Vnc=;
	b=TjfQiDC7ay1WxtphVqBRQkkTkvJhk/qlNXaG8JdfkpB1hDz+G2k72WdZQaRYtY5Wt6dd
	 1l7ibwiCTe4LCshj8ktAZTnMgRgeKguIcLsyDqBuRhBnYfA0qk9s58RhBjge8531mM5FL
	 O7jL+i/V4jesPMmqi3o274uSju+GAwpn772Ft5MPO+EDELaTxUG98TNEu+9SDuwGQHzic
	 drMgbbYJ/SF2dJjwPvC5QfPTvYmJnVhz5tQ/7qcAy1zoaaswsULrfLMbq4l8qvT0WCk18
	 qpzf6menWaKaaybQvKqJWen68UbzH4X8N6kwhcYJPn+hRssweYZcUpdVzW2SKmxvZqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3znkW53v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.51
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010051.outbound.protection.outlook.com [52.101.46.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF580606A32F
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 10:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF580606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3znkW53v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JR+z70OZOA8a7kFGUOpO8fJdOWDtEPyar99nhCfv0pyjcjPBjSIWIGDQC9zLqSBOiwfJ2FITy+gJDrb4//bdE/GzpLIVEq0lSOEIsGz20VkaSIxOL2fqSizo9DvIFm76UJVEaqtxt+3qrOWTx5cptKFFCrPHsk7oooZ6cRspHP03UNBPECu4pGUuTBlfjM/qr4+z85kBCK7WIa866OCpLNi+Au7T2UIfd7IRFcAXsPE/7Oh6XRGOQVJ1Ssy4F5QTGeQrnK9b5rf5ggmDUdnDXzWGuvpnFRy63HL/5/AbB+vQd7uY5a2rtHz80bqZm/kKKyR+GKWDdzmNAzDNI6Fplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSSOq2sRF7yLaEhh9HGL4j9QUJjFRKQukBuXs+R8Vnc=;
 b=iOyWYlvHy1ApUBcMt65DYiFEgoAjONRxy76utbki9OYfbTnrCEodspJoCRsDtcMI0RwCpunc2N8o1q4pwjQZ+Xf848slsE2QSJz3O7pSYNMfiFzVcTlTQaG/StKFPEJxlXnxsXcp4NtqkAPss1u22H74SwkWUCrEdbytDos4Ui6BAF7afdSvS3+SdcUxCV9iciKS6lUoz5Z8qht1+gC45+ImRprQZ3vxVqX7N0I62QMjhfxuV4d5kR/uRW+Baxd7I3FHYoSEu3Mq7Ilr4o6U8X1NrnbxsF1Kj3w+rDkntN4ZZZSnynIlLyBHpg2vtAqgglyetHceTjmOyMDUE4ACMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSSOq2sRF7yLaEhh9HGL4j9QUJjFRKQukBuXs+R8Vnc=;
 b=3znkW53vflUQN+U86zjnZe/Rm1bRCPOZuxEAEtJ3lmLu3uS6qTNURN//MnYe1N8sdvCR0z6hfBzOIRRsV5Ztos4O2+LE16/G0LH0H/Oq5S0srXqEPnBEs3+2UOvBFNZ/1DvbcomGVyypHnnyyV9j5aG63mNXvppBArpP91/LraI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by PH9PR12MB497784.namprd12.prod.outlook.com (2603:10b6:510:411::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 10:00:18 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 10:00:18 +0000
Message-ID: <054d6e64-540b-4f53-8866-4b46e3478859@amd.com>
Date: Tue, 17 Nov 2026 15:33:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/23] soundwire: amd: fix work drain ordering in
 remove path
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, "vkoul@kernel.org" <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
 <20261117070906.803139-13-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-218350@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-218350@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::13) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|PH9PR12MB497784:EE_
X-MS-Office365-Filtering-Correlation-Id: 64568be8-f1ff-4bae-e734-08df44919563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|261102123227099003|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261028144727099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	yWtRfrznR6IGplZlizwpZNWzzFOrT3WWjfeuvZ6f5p2a5TUytC97yDl1Ua73SEiqptNVUTSrr60nmSYSCnkFTpxqJxwCtKiiDN0eiC6jWl6e4rXb6UnmmMI2hgva5Twn1jPOS9iYVfvrUppJcjqAHt1BH0D+CHB9xAWUYomljfmv4UCXNpWRJdi9KOXjUOqD8mc4LgAMxZxcbgE867urRccvYmwlBUrAHakJCeAqpI9d+SExRM89vtzrESg9T3ufcENcIjA2gtOgHghIb7eaBdF8Rc0qhGzWeN7yBb+O1yZdH0Q3H00jsUnBBE7VD8j2JiV3FzoqavgWEAd/OR58do9UFSpS/sCn7qkVEx7kgEKWYuzOKPTyOnp8Ztf6lv5BFzBC9nVRazl/cc4HQzad3d1Fn+f8I/gyh1QTF6ut/gyOE5kCS8LDFIAbwaCyZPUMyq8l2jJq4QB8yXO+uiYqMl03pZZvvDUZA4Emv/2xyaRuZOy9u+ZebbSt5dSQEltvTxEpU5G8MgWKWxVQ2Y7MXM4hLqDcP8BU+TL5tIG4QsOzAc38iaO/RkbAk+mz0ZNNUiViJ1oUt+MJglIGxATl6hbWFc/wMNHrUW459xOQ6eD4w2MMYhUciVFuAxiM8k7wTG28xBCYJd+XCGU/ID4lCyb2hclrpSBDEGUzdFMBvmw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(261102123227099003)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkluM1c1Wldybm80SEc4N0xvM2VLOTRWUHZlaTFSNUxDWUREQVFzNVFLdno5?=
 =?utf-8?B?YjJ4cXE2TkpnK1NUc0ZFSmRoTDZzRk96K3J5Z0hEQTlSQVZRT0lJWDZRSFlX?=
 =?utf-8?B?dUpVSXBJWXdMTG1nY05aZVZpVlpPVkN5bXRkenhqOVBHNTZBQlJIeFlVTE1W?=
 =?utf-8?B?Q20zT3p5dUJ5Zi84TW9pUnFNejYzNTZPRk1Ca2lHVlJVUmZkYkl6N0w0bGhK?=
 =?utf-8?B?ZnNlZ2J4V1JqbTd4dnpmN2FOd1VnRFRzbTFpU2RCWUdrbFowcHM4NTZGRnE4?=
 =?utf-8?B?U1NKcDBjQ0xMeDZzYjRmcUtzdTRCOHRSS1FsQ2tNNXY2VWdTNmI1M0FwdUY3?=
 =?utf-8?B?cjlsRW9lc3pkc2ZubDY1M0dxZGlWVlkzRUMrVVcwZnRqS0xTUm8xT0pQSmww?=
 =?utf-8?B?SVFWaTI0d3NsUG96UE42c1BwNWJIWXI3aEhyQXR0cmhrbXlndVZnOVcyWW1C?=
 =?utf-8?B?Z0ZxUk5RaUNnQ1RXLzMrUlA4NVFReVJYbXUzUWEwMW5wOEdIMklKaTdJOVA2?=
 =?utf-8?B?TFRJSElka1NsNnAxZ1BqcjU2Z3QzQ1RFMk1yTU1kb1BSWWZ6TDUvRTFHT0wr?=
 =?utf-8?B?bVFQcFdNbTNKWENMemNxVy9wMGpZQUVWQ0szWkxqMm85OXZST2xBZ05oaVcx?=
 =?utf-8?B?cEJKMHdYSmJxcXBMTlIyUnhQSFUvcC9sQ2xFTjJadlZlSWUxRndteHNLU3dT?=
 =?utf-8?B?dnphTjdIVllibDFuNWI1WWZVZnVPazFVMDdObmZkWE9aUlA5bUtSdnJTMVl0?=
 =?utf-8?B?MVZ0WGZJQUZvUFh3RzRlbEdPakF3bFlsUGFmakZudVBick80dGd2QWV4VVEx?=
 =?utf-8?B?cE4zZU1XWG5RUHZSUEFmL2RIbFR5S09tVnRnck5ZTmlFUGNSZFlKeS92RFVo?=
 =?utf-8?B?dTlLRDAwaUYvNWlwaEJndmVvNkNtMnoxcS8xdFhLSW5XNlVoVkRRUFh6SDZw?=
 =?utf-8?B?R0I1R0lRZERsMitMZCt0TkVKNDRJWUJXcWRLVUVIK1V2YjlWL3FnZWtSU2FY?=
 =?utf-8?B?S3lvQ0FPVW1kSnpsOHlMSkw3QmJ6azAxWnV6S2pGNnpZQm1rY3hpSStraU5j?=
 =?utf-8?B?dGhKQ1FLUFhURHVxV0NQblFEMkZPbUcvK2pYUGtlbys3c1oyNXBPb2g1akZQ?=
 =?utf-8?B?Wlg3N1dVMC9qNzRpcWs3dkk4UGRHVXZIM1dGVGVCc081YjZVSEtCRTMvRndI?=
 =?utf-8?B?bnRNY0JOUVlReWQzaUtsMzkzVW1lYkRsMDVDaVJHMm0rMTJwWGN6WU5sdFRz?=
 =?utf-8?B?aGtZSk9IOGlUWkxZYVpBSjlMVndQdWI4ZkMyeU4rUE1rd2srUy8wdllzb0w4?=
 =?utf-8?B?T1d6VE9CaFY5eG4zUUNIa1d4dCt6QzJhR0o3Q2RBWEFzVStUTnJBM0o5aEUv?=
 =?utf-8?B?WUY3bEpsVENCQmVzVEhDc3dmNzN6c3lhS2U3Tm5pVlRmcTRId29LeE9ZdVU5?=
 =?utf-8?B?a0xpak9mS3FvTGZhQWZyQU9sR09hVFNIMTZyMFNPRmhTMWVJOGkxcjlQT2Iw?=
 =?utf-8?B?TVhuUE9hcU5IWHZCZ2l4ckFkKy81cmM4UHc3RFhwdUNVeUJYMERNTmhvbGxx?=
 =?utf-8?B?anVpQ0RPbjZTNGtmWXBaTk1RaEIzd0d0YXFMcEtSVkk0MExhd20wZUx2YTNE?=
 =?utf-8?B?TXRtQWQzTWdxbGVpTGEzei90Ylc1YzN2ZDVOSlczbzVvTmVGZDZwdkJ2RHFs?=
 =?utf-8?B?ZG4zb0k1QVNnNTI5SllpMWp5WlRJeXFBN09HTVFBU1pPWkIwZ3pNMjFraWp0?=
 =?utf-8?B?OFRaWlZKTHhtZEs0dU1uUEpGSndCZURPc3pjNmgvaUR2WnFra3AyVWk4LytT?=
 =?utf-8?B?N1dXMXJtUld2dWZjSnE4d2hscmxYZVhqTGFoaWdJd2dDUGFoc1BtQWZLU0Mw?=
 =?utf-8?B?TDQzZjRVRWFHVjZld0YxM29nWFV5dXVLekN6V2UzY1EydkJXdUFWUE9yMGNY?=
 =?utf-8?B?TnI0YkswN1EwVlBTYUpRT2NwTlhXU253YXphRU9KeWc2c0dGaS9vNnRKelNr?=
 =?utf-8?B?UGhEdUVad3dwZUVyL2lYOEtBY1FaVFN2MC9ja0V5TTVWc2xaYi9PYzBUZDZv?=
 =?utf-8?B?K095ekxjek1WMExsdHZsMnE3TjFqK1FwUW9CMU5BblY5cURzVzNZL050Z2Ji?=
 =?utf-8?B?UnZ3VENsYzBmMTRwdVlyeU82ZExCS3FWbmhDWnBUeHJsWFl2N1NKRVBINzEz?=
 =?utf-8?B?SEF2QUxPT2l3WFAvR2l1T3k0V2Q2RGhkSk1xQWlndHUvZmJQNUJwT2dKWDg3?=
 =?utf-8?B?VEtDNkRQbCtYYjI0T0VIQjZEMFEwZEgrS0FjTDkzOHVpby9BdHdtb2NoUktL?=
 =?utf-8?B?d0xKQmRxdWk3ZjFpOGJlbVB4T0sxZEZKaXlGdkRDU0JlZXFrQy81Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64568be8-f1ff-4bae-e734-08df44919563
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 10:00:18.0814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAiu73bdUlT1zHX5R3Og8DHKhxYEmSCiPK4DzQDM1x6GJrabpgISYeMTPuAaFtUT1wUKj/IiLVQaXIEz8x5c8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR12MB497784

On 17/11/26 13:00, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] soundwire: amd: unsynchronized in-flight IRQ in
>   amd_sdw_manager_remove()
> --
>
> commit 3506edf69d0fb093063647130bfc49c4745d7c81
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: fix work drain ordering in remove path
>
> This commit masks SoundWire interrupts before cancelling amd_sdw_irq_thread
> and amd_sdw_work in amd_sdw_manager_remove().
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
> Can an in-flight parent hard IRQ handler queue amd_sdw_irq_thread after
> cancel_work_sync() returns?

No changes required. 

Patch 15 later in this series ("soundwire: amd: use interrupt_enabled
flag to guard IRQ work scheduling") adds an early-return check at the
top of amd_sdw_irq_thread(): 

  if (!READ_ONCE(amd_manager->interrupt_enabled))
      return;

amd_disable_sdw_interrupts() clears interrupt_enabled before touching
any hardware mask registers. Even if the parent IRQ handler re-schedules
the work after cancel_work_sync() returns, the work exits immediately
at the interrupt_enabled check without executing any interrupt handling
logic.

>
> The commit message notes that an IRQ handler already in flight may still
> queue amd_sdw_irq_thread and relies on cancel_work_sync() to drain it
> without synchronize_irq().  However, cancel_work_sync() only cancels or
> waits for work that is already pending or running when checked, and leaves
> the work item enabled on return.  When the amd_sdw_manager platform device
> is unbound via sysfs while the parent ACP PCI IRQ remains active, an IRQ
> that fired just before amd_disable_sdw_interrupts() can still schedule the
> work item after both cancel_work_sync() calls finish:
Agreed. cancel_work_sync() drains work that is pending or running at
the time of the call. The interrupt_enabled guard in patch 15 handles
work re-scheduled after cancel_work_sync() returns: such work finds
interrupt_enabled false and returns immediately.
>
> sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
> 	...
> 	if (ext_intr_stat & ACP_SDW0_STAT) {
> 		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> 		if (adata->sdw) {
> 			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
> 			if (amd_manager)
> 				schedule_work(&amd_manager->amd_sdw_irq_thread);
> 		}
> 		irq_flag = 1;
> 	}
> 	...
> }
>
> CPU0                                    CPU1
> amd_sdw_manager_remove()                acp63_irq_handler()
>                                           ext_intr_stat & ACP_SDW0_STAT
>                                           amd_manager = dev_get_drvdata(...)
>   amd_disable_sdw_interrupts()
>   cancel_work_sync(...irq_thread)
>   cancel_work_sync(...amd_sdw_work)
>                                           schedule_work(...irq_thread)
>   sdw_bus_master_delete()
>   ...
> devres_release_all()
>   /* frees amd_manager */
>                                         amd_sdw_irq_thread()
>                                           readl(amd_manager->mmio + ...)
>                                           <-- use-after-free
With the interrupt_enabled guard in patch 15, amd_sdw_irq_thread() no
longer proceeds to readl(amd_manager->mmio + ...) in this scenario.
The re-scheduled work checks READ_ONCE(amd_manager->interrupt_enabled),
finds it false, and returns without touching any hardware registers or
manager state.
>
> Even with commit "soundwire: amd: use interrupt_enabled flag to guard IRQ
> work scheduling" later in the series, acp63_irq_handler() and
> acp_irq_handler() still call schedule_work(&amd_manager->amd_sdw_irq_thread)
> unconditionally. 
 The unconditional schedule_work() in the parent handlers is intentional.
The interrupt_enabled guard inside amd_sdw_irq_thread() restricts
execution rather than scheduling, keeping the IRQ handler fast and
lock-free. The result is the same: no interrupt handling runs during
teardown.

>  Using disable_work_sync() in amd_sdw_manager_remove() (or
> synchronizing with the parent IRQ after masking) would prevent the work
> items from being queued again during teardown.
The patches 12 and 15 together achieve the same safety goal without
requiring disable_work_sync() (a Linux 6.9+ API) or synchronize_irq()
on the parent device's shared IRQ. The sequence is:
  1. interrupt_enabled = false (before hardware mask writes)
  2. hardware masks written
  3. cancel_work_sync() drains pending/running work
  4. any subsequently re-scheduled work returns at the
     interrupt_enabled check
>

