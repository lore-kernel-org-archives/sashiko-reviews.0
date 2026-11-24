Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795514905;
	b=a2p9vggUvNqQ0selNtKzzfbN8W9La/2ey0miHYAhQNfz9uWoWLvrOsjeh31HC55C5djN
	 jV2w+Fa9c8DG3CsMGKddErdEfq0JN60mE2+C1axiuKQXPr6R48lJXFiQUUoLF9TopjK3r
	 ill01M5UZstr+bxwVSk9sRuXfMc7LlqENmGQzltNUFHQ9T+rkyfbs+iU+4NGVSIQG/SJg
	 kTnmCojhqzMl+R1ISMaQNYxpXWAnw7pLtb1Hy5X8Ls81/gyjHRro4phEmLOOfcrS0c2y6
	 ssqQQSfSmHeHQ4HCS8xc+3kh4RjcwmRHsrC8MZt8Pu3N0KH3bRDyZsefCgzGl9QP1Mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514905;
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
	bh=ydAkCzQVW3vxcVNGFXdG1l7FB0M6jVcB3e6F3muEVnE=;
	b=TOjZb6+rjxify29czALbFOzWpFd0EdUtxG8abD9nNgl49vq8b+b8XTgLaIBQpuTiGWh1
	 UbgOnQNq1oOBi9ResycWNex0l8gMCP9xxWWEKgYs9aOK/ycngP6JZb92Azz3330PZk3X5
	 cIGg65dVMNaWVAuU+tU+e3qqSVh51te/sCGPBrI5fCnM3QF6xV1aUMFupyqk4360Ndry7
	 Ief2rw1yn6U9axdNSxS4lne2jSKew5SSrc6UNoTkxicTJg1AQuJaJcgUyJUmrPUrtp+Jp
	 MasMDFcsRRw3h6OvXkbCE0aNaR26tMScuViye7wwDAho1HSTMdmSsRpMSq9WVnPAaUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Qa0Ctc6m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.37
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010037.outbound.protection.outlook.com [52.101.56.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A88606A33F
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 10:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A88606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Qa0Ctc6m
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJtpmm4CYt09D4+xobH9r4muL/1tiarn5U5wKsbk2oCqJFkmxx4HSe7oREkJZl4Ro2hEOg17sHdiZEGv0AM18gs3/Ke4QvBK15A2EiXWFgdPhfQU+wGTb/HI+RIB3z1KlyVr6rYIOfk5s78dEtuKvso+HBVIoWhIF3p8yMroXRMvxW+tqlA066Ir3ffrg9ND1jW3tFiTSgTUdg5rdk9oHFTkt8UiwEYXS/aGMqTiFa+CXMIBXzwfP+RuXw8DHxnqyBohBlmUeBhFQ0f61x8g0bEn+Uk/ajBa9Xmi5xZKn8n0IL3bKlbgvWR5GKA+Zx6hRnP7LcnUKn9E0qiGJn/nvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydAkCzQVW3vxcVNGFXdG1l7FB0M6jVcB3e6F3muEVnE=;
 b=FIFm44bh1srzma4Z2uyDggt8AX1X9drF+G6tao/PibRcKA4b+hRmYqpXZB+XLYM0kkyVLuN/V3GFAOx4Wf+/TlXzkgdiLktVcSxRYJrYQ/XdbQPjGPBQ1N/gfw+B3JFOVQnQDc6egzWoijRXh++zauoT2og5OPS2cg0xL8iO06yheJyVUvvuTdlKted62FqvUdWLzf5VX1j0XF4OQ1CoSFxxTigijEN847lV4lYfeb3jpi2e/9fmp+19HEqgJ1f+++xG8yxMgM2fouvyrDLvbv4vwsgQSgDkHehwrQSZu8h5Qp+As0CUJ9wqsEHCwq9qLOTxZUiClr/8vp0PaeXzVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydAkCzQVW3vxcVNGFXdG1l7FB0M6jVcB3e6F3muEVnE=;
 b=Qa0Ctc6m4XCySk+x/533J1PMPeQBAhLgjCk0hxjKwukMf6DwzJ/qjvt99LnW27zGDh6UoEyQFbNlR8MclRnxVc1ObUMVBo0SdlOQQaqAXDG48InQldGaVmTPf26lDDcszssgJUSNctBoU/uFN0q2xoQvK6O4YO//Ie83lphBepM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by LV2PR12MB5752.namprd12.prod.outlook.com (2603:10b6:408:177::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 10:08:18 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 10:08:17 +0000
Message-ID: <ed163b17-37c4-4dbc-9f1b-40fde4192206@amd.com>
Date: Tue, 24 Nov 2026 15:41:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/24] soundwire: amd: fix *sdw_ctx leak when
 sdw_amd_startup() fails
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, "vkoul@kernel.org" <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Venkata prasad Potturu <venkataprasad.potturu@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, Poojitha.N@amd.com
References: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
 <20261124085033.682755-17-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-230792@kernel.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-230792@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0285.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::6) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|LV2PR12MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe866ab-2de2-4fb4-47ae-08df4a12dc37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|261021121427099003|261026121527099003|4143699003|11063799006|56012099006|261022105027099003|261022075727099003|261026140227099003|261102123227099003|261028144727099003|261102130727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FSEiJSohr4iMVAJdDARkOfhrAu/rhye3JIa4xXFD0UkJf7rI4Acj6FmXg94WB+9tH2we+tFFSXeZYIjSLB2NB95oozTt8+9Qz5AOPcXQ+AEwnIiMsWaWfGg2Dqqzedc3u6acnlbmyJU73qCA/gJzdbSTIaOy1z2bPlBSaYzLn+HzAGHsW2XKRPaA5MiWCfrZiO8U1hJ/2Z+HcsITokJ7W+pSHIycFhd61zvc+pLP40w5ifm/vWXYmzCdIMXyrvOwoS+yg3nYOHiB780uAEKyxB6MGR3AsDzYrh4jFYRvwnlPLa4qsqr770YYqmpHZXYTAyQXvclSV6piy32bDSBOozbJ/xIb4boBjPA2c01rO9ZTzypEtiLmvAUdAdTxwVm9mdf/cXHhQZBFqPUGeTe37f+zG+yRlXxUF+eZfy95WY8Hn0MNXgbvuXFO05vlCIESXW63jNzpeh5uilzwXqfdtMLcjDRFBQJwXCs4DNaxrNpyhx2PFzLvflZ5hufvxNwG7jvQSABzWzS91WSqBxf0L6rogMf+UZvsPzmUudMk7L9BZWttrg0UIS9TBhZBdu6l9AlSttCzH9QZ0m7//RNNE+YtxE7s+ilBm8EO1krEExGNSLTVMvALOW2oxxcB9Kgs/cud0XScO15D+p4wpYQxrEU/DwIsqQ+qJZcUfLjbebU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(261021121427099003)(261026121527099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261026140227099003)(261102123227099003)(261028144727099003)(261102130727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0tQQnJGNzZZM2VSWHhVMnhJWXUzaHZ6L2FQYXRNQUoydm9RK2xyZkQ2ZVRQ?=
 =?utf-8?B?bUo0QVZDYjQwUllJY05wTStDWUZoZHFGZHhWTWJreTVPZjBtcExJR1hjbVBE?=
 =?utf-8?B?UUJ0c1J5NHJudEhjTCtQbEZoRWpPcS9HbW5OdFd4Y3JVS0diMFZnN2VOWEI2?=
 =?utf-8?B?N2VyVS9sUExUVnhRTzJUZmZmYTF2d3JiZVBzNTI2WGJUSEYvU0lSVXRXZDBi?=
 =?utf-8?B?dlBOSkkwWFJqMVVPZ29XeURnS0k3S0xHL2VxSThVUGVqRG9UcjJtenhVMXpv?=
 =?utf-8?B?M2ZRSlNXNExvS25Jb1VHLzN5MEY0WHh2L3F5aUwxdFRRdFNXOUxjc2xoZ1Nr?=
 =?utf-8?B?aEpmODlSMC9FOXZlYUswUjlJazdreFF6aTIyRHhST0I2V2VaTHJWRjRhYUVP?=
 =?utf-8?B?bjVwRTVCTm9wL3kvUFJDQitNdTZ2MFN2WkFNZkVzZGV0eTFmRUd1eEV4N1JM?=
 =?utf-8?B?VzFqdFFpUThqb0FKTEw4L2V0YlB5UWFBR1I0cWhEc2xCYVZXMk9SUEhjaGhX?=
 =?utf-8?B?Z0Q5RW9KQ3JiRUNSa3BLZ2xuT085Rmt5c05HSHBTWDJEVlRLaGF6bm1xL3ND?=
 =?utf-8?B?dDArUTAyYmpSdk1rRVdYaDlKZlZVZzN5RkhUN2FPa2FHOE50dGVralRaMWJu?=
 =?utf-8?B?d0pRcUk2aGJHQUN0ZnlKYXNPOVBLQ0tjRFJKRkY5QVE2M01RS09zcnllNURx?=
 =?utf-8?B?eDNkUGJTSks3K1RiaU95VHNxV0RHdDh2Y3BsOGJyaVVNeForMVdiNUUyM1V3?=
 =?utf-8?B?QkpHZkZuY0xrVVZkR1RTTDcwamF4N1EvZHAwNUVKN0NiUFU4SWl1MDhPT0dU?=
 =?utf-8?B?b2o2Z3RFeXJJNGtyUlF1OEpJbS9WNzZmVm44bm1PbXFLT3ZiNXl3Z0kxYlJ2?=
 =?utf-8?B?WmwvZUNHNVhmblkxelRYYVdLV1JrTWtXbEpjR1JMbnkrY1dubWt1bDdjZXRT?=
 =?utf-8?B?K2FPWENFN2JGcUY1RHF0VGo3eTF6K3VkK2ZHNkZmUkF3NEJaUE94cWFJSW5Q?=
 =?utf-8?B?NFJYaG44a0ZKaVdXK01INWN6bERYRUljN1d5VkcrTW15eE4xMngvNlJvVGR0?=
 =?utf-8?B?eFN5WXVRajBKamp1NmUvcWJXQTdYUHlPM2hCOEEwVmhhaVArYmNqMkl4WXEz?=
 =?utf-8?B?ZWs4bkMzYmo3T0FBSkNSTTJxTzhTWjEvUWlpYkV1aWkrVWdwbVFiLzZVYWF2?=
 =?utf-8?B?M21ZRm1NdFZONTlSRUJDeVZ6eitOS3Jpb2sva0xXQ1dqVlFEZHBSQ0VTOFdp?=
 =?utf-8?B?WWRaWmlCcVF0aGg4U1hVTGFVZVVMWkpkQUZ6akcwMlp3cVNmc0QyRzMwRWJN?=
 =?utf-8?B?YXg2bEEyZHgzZWp1aTFDbVBuVE96WU5MdVFxV1dHV0tYUk5ZeHY5S1dGZVJh?=
 =?utf-8?B?anBqR1pXcXFrNUtoTVBqOEJDR1FEYXFaamxaSHhLSXdtc0s4ajViN0JiWmdp?=
 =?utf-8?B?NkkzUVNSVStaRlFXam1tM1JQd05tMHhjYUFXR0F2UzFhcjhNLy9BU2xEWXp0?=
 =?utf-8?B?eDhYTjBxemc3R1FhbEJCaGVnRWJ6czNncngySFhyU25aaEZBLys1UDVhQ0VX?=
 =?utf-8?B?MkdnMkJrN1VpQkphN1lrSms4d2tFdmM5WmZ4aUY3M3hqWmp6V3FtRzlERTRP?=
 =?utf-8?B?NnIxYWwzMEtRZmVEcXFtcnU2RElpWmUyWFB3YjRxV2hrRGZ3R1ovVDZONWhU?=
 =?utf-8?B?clpKdUc0d2QyQmtvVW5KR0pEdkFFRVQ0ZFZLVnV5Rzh4enkzUG5CY01XTHM3?=
 =?utf-8?B?S2VBZVhCU3BMWkF1N3BNbllpeEZJSHpLdlBHV2F3ZnYrY3A0RjkrQkdMVTJ3?=
 =?utf-8?B?N3FrS1pVc3hVZmozNjdzbytNNGlCK2p5QzZNS0M5U1ZBY1VQeFpCVHZwa0Jp?=
 =?utf-8?B?YnZ5elJwbWQ0NktxUXM1V29oQUdnQTZkUXNnRGY1b0NTVmlLOG52U3hra0Ir?=
 =?utf-8?B?eXZHYmNld0FHbStPUGZjczV5ZFI1YmthTEtGRFZYakF6cXlWeGNFUUFaejBP?=
 =?utf-8?B?cWlqS3E4SkRQQVB5eWJHM1VtWUdaeFlzSGJWOWk1KysvSEFjWVd6UFlsNWpF?=
 =?utf-8?B?cXEweVZ0R21hYmNKNnFuTjlWRkJTbWw5SlB3MldsbUUyWkFxN2JFek9NRU00?=
 =?utf-8?B?THYwLzZDWEttN2tWejB3Q0w2MVBrelk2RWw1SzhnVkVCQ3JUYW9yNkNPV20y?=
 =?utf-8?B?dHI0Z2hVR0hGRTI2MnZodDNxODUyVHVncmtXQTVtLzFrQ0cvUnpoaEY2TTFI?=
 =?utf-8?B?QUxma3BtcUswT0R5WkNvbEkvQndFdXo3ZGNPek0yWXF5Q2dPemZjUVZoNTRN?=
 =?utf-8?B?a0tuaEpyZUVMdzhIZGl6MFk0K0lhK1hmU2E4ejV0Q2NFbllad0I0UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe866ab-2de2-4fb4-47ae-08df4a12dc37
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 10:08:17.8475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQyJFyrDk1QNb1KHj4JciDxrnjstBlVyPC1z2TnuyOIpFBZwBN9VEbvng16HvCBAcUhtDM5v9SxBZLL3MLgmww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5752

On 24/11/26 14:41, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] soundwire: amd: race with hardirq handlers on
>   sdw_amd_startup() failure
> --
>
> commit fb658db6de398fb5ff736ed8e17029fdf853a4c4
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: fix *sdw_ctx leak when sdw_amd_startup() fails
>
> This commit cleans up the allocated SoundWire context and resets *sdw_ctx
> to NULL if sdw_amd_startup() fails during sdw_amd_probe().
>
>> diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
>> index 8019a4faeae5b..50e487e409a9b 100644
>> --- a/drivers/soundwire/amd_init.c
>> +++ b/drivers/soundwire/amd_init.c
>> @@ -182,11 +182,21 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
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
>> +	*sdw_ctx = ctx;
>> +	ret = sdw_amd_startup(ctx);
>> +	if (ret) {
>> +		*sdw_ctx = NULL;
>> +		sdw_amd_exit(ctx);
>> +		return ret;
>> +	}
>> +	return 0;
>>  }
>>  EXPORT_SYMBOL_NS(sdw_amd_probe, "SOUNDWIRE_AMD_INIT");
> [Severity: Medium]
> Can clearing *sdw_ctx and tearing down ctx here race with the parent ACP
> hardirq handler?
No code change required; marking as false positive.
The specific NULL pointer dereference concern — acp_irq_handler()
(sound/soc/sof/amd/acp.c) accessing adata->sdw->pdev[i]->dev when
adata->sdw is NULL — is directly addressed by companion patches already
merged in Mark Brown's ASoC tree:
  34ea81a7f284 ("ASoC: SOF: amd: guard adata->sdw dereferences with
                 NULL check in IRQ handler")
  41e06aaef9c0 ("ASoC: amd: ps: guard adata->sdw dereferences with
                 NULL check in IRQ handler")
These patches add a NULL check for adata->sdw in acp_irq_handler()
before accessing ->pdev[0]->dev and ->pdev[1]->dev. The interrupt
status register write (snd_sof_dsp_write() clearing ACP_SDW0_IRQ_MASK
in ACP_EXTERNAL_INTR_STAT) is moved outside the guard, so the ACP
interrupt bit is always acknowledged regardless of adata->sdw state.
This prevents the hardware from re-asserting the interrupt when
adata->sdw is NULL.
This patch sets *sdw_ctx = NULL before calling
sdw_amd_exit(ctx). After *sdw_ctx = NULL, acp_irq_handler() sees
adata->sdw == NULL, acknowledges the IRQ, and returns without
scheduling any work. sdw_amd_exit() then frees ctx safely because
no IRQ handler can access it after the NULL check.
The STATUS-register pre-clear argument applies to the sub-case where
acp_enable_sdw_manager() itself fails: STATUS was cleared at gate-open,
the manager hardware never started, no PING frames were sent, and no
peripheral can set STATUS bits. The companion patches cover the case
where manager 0 fully started before manager 1 failed.
>
> The callers of sdw_amd_probe() register their PCI IRQ handler before
> probing SoundWire, and amd_sdw_manager_start() unmasks manager interrupts
> in hardware via amd_enable_sdw_interrupts() before
> amd_enable_sdw_manager() and before subsequent managers in
> sdw_amd_startup() are started.  If startup fails after interrupts are
> unmasked on a manager, the IRQ handler can fire while sdw_amd_probe()
> clears *sdw_ctx (adata->sdw) and runs sdw_amd_exit():
>
> CPU0                                  CPU1 (<hardirq>)
> sdw_amd_probe()
>   *sdw_ctx = ctx
>   sdw_amd_startup(ctx)
>     amd_sdw_manager_start()
>       amd_enable_sdw_interrupts()
>       /* startup fails */
>                                       acp7x_irq_handler()
>                                         if (adata->sdw)
>                                           sof_acp7x_handle_sdw_manager_irq()
>                                             snd_sof_dsp_write(...)
>   *sdw_ctx = NULL
>                                             if (!adata->sdw->pdev[instance])
>                                               <-- NULL pointer dereference
>
> If the hardirq handler instead loads adata->sdw->pdev[instance] right
> before *sdw_ctx = NULL, it runs unsynchronized with sdw_amd_exit(ctx),
> which unregisters the platform devices (freeing amd_manager without
> waiting for in-flight hardirqs) and frees ctx, allowing a use-after-free
> or scheduling amd_sdw_irq_thread after cancel_work_sync().  In addition,
> because *sdw_ctx is cleared before amd_sdw_manager_remove() calls
> amd_disable_sdw_interrupts(), any SoundWire interrupt arriving on ACP7x
> in that window sees adata->sdw == NULL and returns IRQ_NONE without
> acknowledging the status registers.
>

