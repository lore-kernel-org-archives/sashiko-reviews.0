Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793089763;
	b=TnCWAZB/X2mwOv8aDJoxJVYQ8WY+niNBvf6PeZRrCbHpDeJt/oEaQaPVmuJqynJgD82A
	 EisrE2Y1iYA1DQDuYRNgFPlX2a/l6bM94NWlvBPfG283qufaaf4Apr9P2P0F6HzjModF2
	 5LI2bBJG5S+rf+MarZD6i5aZOSVTB/QoOC08Oc5fEcy7iyu3xb70/LR5fgoR5q/gehGCW
	 AAdLmfUtMgnJv6rruT+ZOEpZ27ZnuE05mL7eoNRglh31QWjQlYXuO14XANsTYE2kqYYCy
	 hVaPokODuJtUG5TpRMXqCQwqcDbmDeyde/EXrsdXdePWFMdemUtU7gLZ+SJLoxZlxXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089763;
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
	bh=pjsIVBayaK3g+oi6KbL1a82i8CcyMXFudLp5Zg6GlFY=;
	b=JiBWYE5uDNpABakndGQNvY0IvJRQsFeJTseJP8Fv5SHe6xLVMCqSZmNnqz3BjEysq/WC
	 yr1c2xtoqU17f/a3dmt7V52k5gmCD8Y9td36lUQa44V0UR6aXdJQw5nMQge7SQYZOKBKR
	 1Pz6oPJJwje/z4/1/8G2aduu0m4jFC7VjmVFA47hbtSnzTatd01uw20CuO6COMLuiNQ9D
	 Rbeo1rdL4RZOmi9oYQExCvijSj5cgIMNi/xVxLL8R6Bti+0etjCQj+TAtSbjrQMQWvCKP
	 L1U7a9Q4SsiijMxRoMakKg3uNztlN+ioa6kWFr/uLUu5x7fXbnKkhET1SOh4skiM7BQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=a6kQIuT2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.46
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013046.outbound.protection.outlook.com [40.107.201.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F246B606A31D
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 08:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F246B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=a6kQIuT2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXWGIy2BnQu0g53Urs8n0ezRPt2TzGav07bXZ1WTZ3i/xH8im3zXHN3rcaiSJR+jSP6zftHt1TYAeXqFW0GLlndBbbMtHOObrpPKa59iJzpgv63HzYgE6ARI7ZbWsMbrz+QN74O94UKi1WbuRtkIOwlZpzJCzPlA/F/xcaIbtrLV9BkB9bJvHAexsiAeq7CVTaFjPHg5L0ZogT119TRfYGxAlR9ZEVnXWTrdVz9JBv5IzgvNdet4DyNthG2vA5EqNBZEq0/wM4QAJ7gzVmJ0+2MJsj2eLWvPUJsLkLuwSArcuhgadEQXEZnrXSFMZRJG5KP8o9B9FpeLyaKqCE2F7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjsIVBayaK3g+oi6KbL1a82i8CcyMXFudLp5Zg6GlFY=;
 b=O3a9y4dM108+p7vWoG+QkAm4WklFZI5ecv/m49Nt00PsyNGoZh5DRWB9aJ6qpwbL4/V6uxcLhDvgDKlr2aLZQZW9DMIRDzdTVJy5OoXWrXSc0so48NtPBInR4c7D/lz/JOdUA5q+DNlVE9QiySoAYjVhpIkuFrU5eubnWHZmzvvVr352hMgXdBgoJH4qPKcWnZAsQjoJdD/U53HEaLLldqa7g0ryqKj9bJYExYCjFTboIKfCL135O3rGV6P+8FAG2+JQci/BPu9G8+e4dcqky/yFkCfGvG6RUtUeoBcpPLdSxJQILdnndG/qrD+enZzhy/oXalgBzv+tRYEYx8xrgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjsIVBayaK3g+oi6KbL1a82i8CcyMXFudLp5Zg6GlFY=;
 b=a6kQIuT2iuHBf6HTm5niPktY75KoRClv0rU6o6QWIEw9o4leLLh7S9Lk3paFff7OJfS+TxAvowGXsVEnwYV7mew5M8UgqOBjtS6cjOIjVwSaBN3Rf67u/JuXO5PeMX88lfRCv9CpbwcIXQ7nwWKpkJRiTj1l1OFLRqSeuEp4dY8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by SJ2PR12MB8011.namprd12.prod.outlook.com (2603:10b6:a03:4c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:29:19 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 08:29:19 +0000
Message-ID: <64353fda-29e4-4751-9d27-3f232cebdb6a@amd.com>
Date: Tue, 27 Oct 2026 13:58:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] soundwire: amd: fix interrupt gate and work
 drain ordering in PM ops
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Mario Limonciello
 <Mario.Limonciello@amd.com>, Syed Saba Kareem <syed.sabakareem@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 "Prasad, Prasad" <venkataprasad.potturu@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
 <20261026044507.2310694-12-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-184937@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-184937@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYPR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ba::10) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|SJ2PR12MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dab2e84-e88f-40de-94f6-08df3404652a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|10067099003|22082099003|261026121527099003|18002099003|4143699003|11063799006|5023799004|56012099006|261009223027099003|261022075727099003|261021121427099003|261022105027099003|261026140227099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	yi6imLY5YDOOzS2JxoJNh91D7tM9qHOfYOzkRrmVB7AzsTBu/P/p3roluOWv+fjFLJ6w1OwJGHRllhdd51xSQWTj4ybKpMxLnSeppz1YeyPAObXGsR4/IcMROOGjMadhJb5ggoxJ/IaHKjLc8sp32C7BQ/1C8wgRaQCIvetWh+hEuQ99RKa4GvVRIiTvjg9K0vT8M0hXqmewms/8JrrxhIiK+Qgd3RQOXVQPlhPFBN5w5iloKYD5EFClXj8mFMQM3f8yv/UaCePryabZlFQwCYVtl8K6kLW3ScaVE1AFGb2NV/4oRNIjW440a56Emwz+mR95wJbnGRpFexHMWwmeyrlwNTJGySP/V8bJacWfPk8n7oL1FqD1jGzvlqOZ+0/8qyGfcpGsd48TOe6Ci33Qyzf16GhMHosS5YeDhJMyu2RB2UOgseLGZEdX+dCx7yFGQzSry9OtDWxaF6igpcG0xB4H5Be/FehjBgbos0WgmREBCtLiNX6gg+s6CHD1N5SqLSLpNa7etGXgksOPEphNbocNOhTdiDOxizZjJsfkd+RnW6xNDcppsraw3ZLd/mvhPfuz6B1vWJtW/Xb3m3Pw12mDOXjgJassWSKpK6WDHVyImv2rurS9/WSinNCyXVMnoRgREJ3aJiJDZJltJUiIob+crqPUwzQc4Ih4FWdWEI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(10067099003)(22082099003)(261026121527099003)(18002099003)(4143699003)(11063799006)(5023799004)(56012099006)(261009223027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261026140227099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjBwaGZpbG5nMTd3UzhzdTY3SHk2NHpaeXU1UGp5VVMrRkNhZzRPb1NDNFU3?=
 =?utf-8?B?RWtjandBd2RTa1k0K0VvT2NYb2hKV2FFZEF1THBySTdCeGhLY2ZLODVRSFpt?=
 =?utf-8?B?dGxWTldtR0NVQkdNYW4zM0FtTVJvL3JFSFkwa2lhM29uNUtkOW1iSGlKY3BD?=
 =?utf-8?B?NFN0cDdCT3dCYlJKODR2eEF6emU4bGVuT0hDeWN3ZnRuMGNLTzlRckxmU2dC?=
 =?utf-8?B?TUI0STZxaDVQeHU3ZkpZUjFyT3VGeEM1S3g5WDlGallYZFduNmlBaTBhWC9Y?=
 =?utf-8?B?WGJUamRZKzZhOTY0VjJQQk1ISzlFZ2poUVFMQ3JrRndnRmZQdjROOTk0clhw?=
 =?utf-8?B?ejcrcituYnBYdU8xN2R4UmNXS1lVK2VMcGZtSkkvVUd3aHR1bTBYakp6NUlj?=
 =?utf-8?B?ZEVvck4wN29uL0piemNrbURmMmZsdzRTSVlIbjE1NlFxaktNZSs2NTc1SXpp?=
 =?utf-8?B?eUdYbVhnb0ErbUI3QVpmRkFTdFB0eENOcm9yYlVKbXorR0c5NFJQUVJJeUJG?=
 =?utf-8?B?blA3OTNsS1dKaUJrT0JSalgyNnJEYTM0d0pxOVJLUUZKdlFnaCs4TjJxUkRE?=
 =?utf-8?B?eHRDSWN5c0ZIZzdVQzFPVzQzSk5pWlh3WFdqSVVsNk4yNFFYc3hVSWlTZktY?=
 =?utf-8?B?WkhWaWI3YTZwQ1NBdkljeEExMitpZGJCOHlicmdNVWRLdU1GU29UUTNNa21z?=
 =?utf-8?B?UkVublgzbFRrdWhseXN1Yng2aEg3R09tREFsZm8reTcvdkJsc2FnZGxXdlEz?=
 =?utf-8?B?LzZ0Mld5MU5WMHhQZGR4ZzZjUzZKMFpPaWw2ekEzeFR5bHZlcHhjZUVsZysx?=
 =?utf-8?B?ei9MdjNrdEtKeUw4S2hvVUx0UURkRHEzUlBwemszVWh0LzI0aHh5dFo0aTlh?=
 =?utf-8?B?ZTNjRmduaVZKWWhVbWRob2YxOUlKUXA5ZTJNWnZ4QjliUXZHQnVxOTBFVEl4?=
 =?utf-8?B?enNQQU5Yb1A5RndGZzhwT0x4UXppcmZTb0RJTnVobDhxcGowN1hpR091SENk?=
 =?utf-8?B?bERVSDhzQzllMXY5QW9QWERBcVR2d2NzbVdZcjJJaVFsVCtqQld1c1dNMUFh?=
 =?utf-8?B?eFpRbTJCNXZQUmhTTityeGFKUy9hUGZiMHNFeDRnRjRxY21OWWtVQitseWRX?=
 =?utf-8?B?YzVqOUVSQ1c4TWl0RS9nWHU5R2xDTUJxNTlQWmFKQjRFcThMaStyclpHdXBo?=
 =?utf-8?B?Ly9qTzVaT3Y3eTZlSm1TMi81NmtYT1hJOUhoN1p1bUlHc0RqZWVqUW92d3lu?=
 =?utf-8?B?TzRiTkNkVXJBdnVJWXRIMnBzQmlpRm13cWdnYnhPRFZ4a3VZSDFsRnVtcEVL?=
 =?utf-8?B?OCtxQ1RVSHlwYUdJVXFScmkrakpWT0NXZGw1ek91R2RjckpSOXdKNkxHVG9C?=
 =?utf-8?B?S1QxZVlaU1NFMzNwY3I4TlFiR3ZwYnVPMVZsa0p0N05ucEVBZTBmSHZVTEF3?=
 =?utf-8?B?QUt0ZWVrZGg2N2htbmxPelQyL1gwZjhHa0RQTHFDU2NKUzZLdndGTS9mSVhh?=
 =?utf-8?B?eXcrOFcrUkdTNm5rdzhkY05HdHZQUSs4RkZudEZLM2p0OGVRY09scGZIdEpC?=
 =?utf-8?B?a3Q4c0Y1K0RGNC8zMjU1THcxUWFFc0JQRVl1OTJGWnZReWdMNDNOVXgyVXg1?=
 =?utf-8?B?aUFReVB6dmlPdStXSDZWODVYeStsRkRFSXRJbU9OYkQ2Y25SRVFxWE50Sy9j?=
 =?utf-8?B?eVZISDZyeXV5eG10anAwUkhRWEU1YitYaGx6SVBMUXZEeTB0dStRMXJHR3l0?=
 =?utf-8?B?MUJwMFdSRG5WRjgwam0vdHV3c1JRbTh1QW1IS1hFNEhESkNXMW1vOFRGaVRN?=
 =?utf-8?B?ejFycGYwSysrNWJYMnJDSXVhTnFTN0VNOWtyWEx6YlNNR1FLdDhMUjIweEVZ?=
 =?utf-8?B?Szh3MDcyQkd1cTlVZWlaTU5kYk9KV2tZZHNJY0lHR0lXTFN0Y211T3lSdUR4?=
 =?utf-8?B?aW9melp1ajN1R1FwczVFWnVzN0ZURXpFdXdTTnVCWjdtMTUxN1dIVTI1VWUv?=
 =?utf-8?B?SmZhbEhXYWxlSEZmbW1oMXJIcjBzam9lakVUQzE3NmxPQ2lpS3ZxWUkwL0Jz?=
 =?utf-8?B?MzA0VHk2MHphT1ViYXE1Y3lNNXBySklYUURlSFBNaFRlaFFsVUFPaGlZTHJM?=
 =?utf-8?B?dFpMS1c5Q040eS80aUx6YWN5TDdaZGVraDRGczlWTWlyYnpiY0RCd0VwQjBz?=
 =?utf-8?B?bCtrWXhLQ2ZvZVBoQ2lIVi9GZ1pxd2lRRVF5Z2RCQUpycyt4M3dmRlZGNFps?=
 =?utf-8?B?NGE1WTlRYjNOb3IvUVVRWFpQSTFqZ25uZlVUMXoyVml2ZUZQcE9NbFNBSUk1?=
 =?utf-8?B?YU91UUNGYURvVktLNW5kbVRnNFFoZDVlTjlhNUpCL2pXMTkrK3d3dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dab2e84-e88f-40de-94f6-08df3404652a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:29:19.2719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnvT0kJUX5jjpdnHRVlIJyiMEKg5vHKblFyCdyRST8Y0OoG1EGpnRj7PAKcjp687L098Y/BVdiBLsANW84Zqnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8011



On 10/26/26 15:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] soundwire: amd: amd_enable_sdw_interrupts() in suspend fires stale status IRQs
> - [Medium] soundwire: amd: missing IRQ sync before work drain in amd_suspend()
> --
>
> commit ecf45f9e24e7a7e6c5e9ff39ceefacd5dd89af26
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: fix interrupt gate and work drain ordering in PM ops
>
> This commit updates amd_suspend() and amd_suspend_runtime() to disable
> SoundWire interrupts and cancel amd_sdw_irq_thread before draining
> amd_sdw_work and stopping the bus clock. In the AMD_SDW_CLK_STOP_MODE path,
> it also re-enables SoundWire interrupts and configures wake enablement after
> stopping the clock.
>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index a685bd7da52b1..d7289b840513b 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -1318,15 +1318,20 @@ static int __maybe_unused amd_suspend(struct device *dev)
>>   	}
>>   
>>   	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
>> +		amd_disable_sdw_interrupts(amd_manager);
>> +		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>>   		cancel_work_sync(&amd_manager->amd_sdw_work);
> [Severity: Medium]
> Can an in-flight hard IRQ handler on another CPU still schedule
> amd_sdw_irq_thread after cancel_work_sync() returns here (and in the
> corresponding AMD_SDW_POWER_OFF_MODE and amd_suspend_runtime() paths)?
++

This is a valid concern. A follow-up fix will introduce a
software irq_enabled flag in amd_sdw_manager. The flag will be
cleared in amd_disable_sdw_interrupts() before writing to
ACP_EXTERNAL_INTR_CNTL, and checked in acp63_irq_handler()
before calling schedule_work():

     if (amd_manager && amd_manager->irq_enabled)
         schedule_work(&amd_manager->amd_sdw_irq_thread);

Clearing the flag before cancel_work_sync() ensures that any
IRQ handler already executing on another CPU reads
irq_enabled == false and skips schedule_work(), closing the
race window without requiring synchronize_irq().

The wake path is handled correctly. In the CLK_STOP_MODE
suspend path, amd_enable_sdw_interrupts() is called after
amd_sdw_clock_stop(), which restores irq_enabled = true. Wake
interrupts then schedule amd_sdw_irq_thread which calls
amd_sdw_process_wake_event() -> pm_request_resume() for the
resume sequence. In the remove path, amd_enable_sdw_interrupts()
is never called, so irq_enabled remains false permanently.
>
> In sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() (as well as
> acp_irq_handler() and acp7x_irq_handler() in sound/soc/sof/amd/acp.c), the
> hard IRQ handler reads ACP_EXTERNAL_INTR_STAT and schedules
> amd_sdw_irq_thread without holding acp_sdw_lock:
>
> sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
> 	...
> 	ext_intr_stat = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> 	if (ext_intr_stat & ACP_SDW0_STAT) {
> 		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> 		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
> 		if (amd_manager)
> 			schedule_work(&amd_manager->amd_sdw_irq_thread);
> 		irq_flag = 1;
> 	}
> 	...
> }
>
> If the hard IRQ handler on CPU 1 has already read ACP_EXTERNAL_INTR_STAT
> before CPU 0 masks ACP_EXTERNAL_INTR_CNTL in amd_disable_sdw_interrupts(),
> CPU 0 can complete both cancel_work_sync() calls before CPU 1 invokes
> schedule_work(&amd_manager->amd_sdw_irq_thread).
>
> Because amd_disable_sdw_interrupts() only clears the mask registers and does
> not clear ACP_SW_STATE_CHANGE_STATUS_0TO7 or
> ACP_SW_STATE_CHANGE_STATUS_8TO11, the newly scheduled amd_sdw_irq_thread()
> will see the non-zero status registers and schedule amd_sdw_work concurrently
> with amd_sdw_clock_stop() and amd_disable_sdw_manager(). In addition, since
> the post-clock-stop amd_disable_sdw_interrupts() call is removed from the
> AMD_SDW_POWER_OFF_MODE path, a racing amd_sdw_update_slave_status_work() with
> status[0] == SDW_SLAVE_ATTACHED would also write AMD_SDW_IRQ_MASK_0TO7 and
> AMD_SDW_IRQ_MASK_8TO11 back to the mask registers.
>
> Should the driver synchronize with the parent ACP IRQ or clear the status
> registers after synchronizing before draining the work items?
>
>> -		amd_sdw_wake_enable(amd_manager, false);
>>   		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
>>   		if (ret)
>>   			return ret;
>>   		ret = amd_sdw_clock_stop(amd_manager);
>>   		if (ret)
>>   			return ret;
>> +		amd_enable_sdw_interrupts(amd_manager);
>> +		amd_sdw_wake_enable(amd_manager, false);
> [Severity: High]
> Could calling amd_enable_sdw_interrupts() right after amd_sdw_clock_stop()
> here and in amd_suspend_runtime() re-trigger slave status interrupts while
> the SoundWire bus clock is stopped?
>
> When a SoundWire interrupt fires just before amd_disable_sdw_interrupts(),
> the hard IRQ handler clears ACP_EXTERNAL_INTR_STAT and queues
> amd_sdw_irq_thread, leaving ACP_SW_STATE_CHANGE_STATUS_0TO7 and
> ACP_SW_STATE_CHANGE_STATUS_8TO11 non-zero until amd_sdw_irq_thread() runs to
> completion:
>
> drivers/soundwire/amd_manager.c:amd_sdw_irq_thread() {
> 	...
> 	status_change_8to11 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
> 	status_change_0to7 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
> 	if (!status_change_0to7 && !status_change_8to11)
> 		return;
> 	...
> 	if (status_change_8to11 || status_change_0to7)
> 		schedule_work(&amd_manager->amd_sdw_work);
> 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
> 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
> }
>
> If cancel_work_sync(&amd_manager->amd_sdw_irq_thread) cancels that pending
> work item before it executes, or if any slave status bits latch during
> sdw_bus_prep_clk_stop() and sdw_bus_clk_stop() while the masks are zeroed,
> ACP_SW_STATE_CHANGE_STATUS_0TO7 and ACP_SW_STATE_CHANGE_STATUS_8TO11 remain
> non-zero after amd_sdw_clock_stop() sets clk_stopped = true.
>
> Calling amd_enable_sdw_interrupts() at that point unmasks
> ACP_EXTERNAL_INTR_CNTL, AMD_SDW_IRQ_MASK_0TO7, and AMD_SDW_IRQ_MASK_8TO11:
>
> drivers/soundwire/amd_manager.c:amd_enable_sdw_interrupts() {
> 	...
> 	writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio +
> 		       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
> 	writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
> 		       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
> 	writel(AMD_SDW_IRQ_ERROR_MASK, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
> }
>
> Wouldn't unmasking those registers with stale bits still set in
> ACP_SW_STATE_CHANGE_STATUS_0TO7 and ACP_SW_STATE_CHANGE_STATUS_8TO11
> immediately fire an interrupt and schedule amd_sdw_irq_thread() and
> amd_sdw_work while the link clock is stopped, causing MIPI command timeouts
> in amd_sdw_update_slave_status_work()?
ACP_SW_STATE_CHANGE_STATUS_0TO7 and
ACP_SW_STATE_CHANGE_STATUS_8TO11 are internal SoundWire status
registers polled directly by amd_sdw_irq_thread(). Stale bits
in these registers do not set ACP_EXTERNAL_INTR_STAT or raise
a CPU interrupt when the masks are re-enabled.

Once the bus clock is stopped, no slave status interrupts can
be asserted — only wake interrupts remain active, which are
handled separately via amd_sdw_wake_enable(). Calling
amd_enable_sdw_interrupts() after amd_sdw_clock_stop() is
therefore safe — no spurious interrupt delivery or MIPI command
timeouts can result from stale status bits.
>

