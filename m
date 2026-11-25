Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795606568;
	b=BZFQkE8vQ4nH9nePJiiwz4/ijysXzFuGh0+qL3mcKty05RKneqZwSFjQZoljAIksgR4b
	 z0CaBPL2mwwMw1r7k/+np4Z8Y/5lfDhwUZDN4un59wvAWL/5/4aYZ9CFsNiqUWlJd2PIL
	 d3zKr0tJEruHkBKm/bo4t4rs68ubAMmY/Z5TPc+PrYoG6UnmplztmvNkQIgNM17NaStuN
	 IZ/K+xHRBkq5Dpno7snWEjL13b518rZJWa5+ji3vfd3cgIo+1N7aTLJQwi1PkSj5a8Jf1
	 +RzsyRDdNu4dpoWwuN5vj2a8U/GlyJ9RoBt3BHdruiGGQTN2NnqYvNTAC/MVKQULUdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606568;
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
	bh=Rn7WF5V0XmrPEdEfp0KmYRhoDRsEpNRZyRFYdBwhAXc=;
	b=nq9nTZbNq3Ip6QxUFqr69V6uuEWk2uhR1Vefwk7AHS7M9tlyt1CapCTWSDbC2uRJn7Oy
	 eGWqqIeGet3Jog05iqGP/MocNFWwoaOdN+v6a+BBbyKQeVLXvR65+Yv4nLLB9be0it3OD
	 fzgY2T4+7ghyf+WkI1xS+mhtOVF65pVBk0eQTE1tYk6BAhey6UbJMf1NEx4F/u6ktWu9n
	 Jy/+VLoU7ySWlxfDP8GKm8Vh+HMsGDnHuqeT8yCEgWnV9csSPydFC/xad+aZu7tzAMw17
	 PoXbO56b+u3q9GeYZ4rNyVws5rcY2/rjZj/OcvYEmh2wVh2wUMrQ4gYcEGMnjF2zsWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kgpK2fAO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.33
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010033.outbound.protection.outlook.com [52.101.46.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581F1606A323
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 11:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 581F1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kgpK2fAO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/zqclK1bYRV6bc3B3zAtiztLaeFVBY6LwPOU/YpXjV2dELlUFVBFOrFez5FcOIJF/19byT4QkRRIvdYTcNycew7qpci40oko2nrhjeeg4pPAb0ru40JVyNAhtX7u3HWsq5Tul+JGhMeImRFLpRKLPkS6YuSmq2neUUJttIjpxZYowyzuMOmSKXhJQkYcHSAQvzPs3CKU3e1ndhumVc8IYbuhlxESZCQx2jHom/exHvgJ7rkIdveRP0m/SHYRTvrKXIDM+U2JOvY2NtXcFacODeLlTvdnmqzw0gbOymvxblwssxEuQEKwiHzepENKQsizoH903QTF4FSUYTG5cqYyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rn7WF5V0XmrPEdEfp0KmYRhoDRsEpNRZyRFYdBwhAXc=;
 b=lIvaHfUH9y1gTknR+t4F8Vq/FMXmXtIHTuUicCPAHbTXm4Al+XPKfX0IITcbqLoIIepELoRpwsPV6gtnuOVp2rkSXnq/XVgefZudxtYxyae8YTc96hF8x3v3av0alTybz8Yc3Qq3JOkwi1J1QGN8fZ2kFSbD7cD3ybeK8wkxqBxJkAOfSFEx2GpwQ/H4hqah9+0mBds2P0PKR7hBM2C5iCX9upah1gWPdI5GrsMxFwuaqDpEQXZZqhlO5E5X9HkZQj0X81tM6Mq1l2b5dJs8MzPVdTHB9ksSXMd1WQ+EVmw5D6NR9uYT/gVgogJggjiJsRjnf725sZf4qZzeh/izcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rn7WF5V0XmrPEdEfp0KmYRhoDRsEpNRZyRFYdBwhAXc=;
 b=kgpK2fAOiRPJYJX4IgMDY3Vk9LwQjlKH3OEuhMWwYiDQZyNocaH87J4EAzTXDhXsidx2bOg/k1cRsBfhM093OMlcqzLmsv/A+9052L0c1kdcHYXkMkYigTrXidYoYGXIKGnB6xBlENQAnzSC1gd4ZWZDihnc0P2dGfbA4qrF5Eg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by SJ2PR12MB9211.namprd12.prod.outlook.com (2603:10b6:a03:55e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 11:36:05 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 11:36:05 +0000
Message-ID: <ad695146-f273-463a-96aa-6e06b2a754ed@amd.com>
Date: Wed, 25 Nov 2026 17:04:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 24/24] soundwire: bus: use pm_runtime_get_if_active()
 in sdw_handle_slave_alerts()
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Syed Saba Kareem <syed.sabakareem@amd.com>, "N, Poojitha"
 <Poojitha.N@amd.com>, "Prasad, Prasad" <venkataprasad.potturu@amd.com>
References: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
 <20261124085033.682755-25-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-230836@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-230836@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0053.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::18) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|SJ2PR12MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: 808303e5-a133-4fa6-e781-08df4ae84a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|18002099003|261009223027099003|22082099003|261021133027099003|261022115727099003|261022105027099003|261022113327099003|261022075727099003|261021123027099003|261021135927099003|261021121427099003|261026140227099003|261026121527099003|261026130827099003|261026135527099003|261028144727099003|261021130227099003|56012099006|4143699003|10067099003|261102123227099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	okDIOBpKDx1me1llm1v4UkRCnUv+hNHBbdq4mVrM0t+Hwp6AnAva/Y8sdg01ieBSXvgFzMfsuloYptfbzjHMkErB/9G9zI0ua8OmPfYQmTYKMOMkLtJs/AyTaUi4qrv91x2Gt3V2HFPtBJP+BCBo2yA5DzFX6/Z76rRx/gSr9e86FltSFntQoglLkMXOg7rd4Xaezjnjr2nUh6et+g/WzwbHthBTK897tG5S64BAlKsNkGmqEqGr8Pk3dr1c7XWFXMLuV6sQNQpCXcWjj1lx8BBx/uYpZTwwZtRZtPv6pzvabp6qRxnQMT0xAclcrtbZy38ARTIanattJQdUsBTv3xBXyip+9gm/05b3GGV0AerHcKc2cJ1P+vN4dADLl1NmJbfUw3+k6BTwJ9cYQjbh75mgwMzRc1oT2sgLFaLAmktm/DWbDhzmo/m678nPmbii4jiV/Qssaqg+shw6BxY2K0gBuiZu2v7Q0xfMaE33iT6FsPH6kqnrmzQMMy2iRCXbkCKEKgYuhD3bMRZrlbLUlsbfbV0kXpFUugclgdj15b0qm1Kd612O6wb/TqhEvPc2HDPyMGIoBowyZQqdwUW5pF3RLnIQxXhy0awldllSzOYO5+PI2T4intKVa0YVKJ9DYzNGjNP1cL8GVbn+godkFCHCsrt5fM+yR6vFyBbvPls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(18002099003)(261009223027099003)(22082099003)(261021133027099003)(261022115727099003)(261022105027099003)(261022113327099003)(261022075727099003)(261021123027099003)(261021135927099003)(261021121427099003)(261026140227099003)(261026121527099003)(261026130827099003)(261026135527099003)(261028144727099003)(261021130227099003)(56012099006)(4143699003)(10067099003)(261102123227099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STdYa0RaOFJSQW5TMXpscjY1MU1xaTA1STU3bVZkS1VlYXJObkd6bWVFbFk0?=
 =?utf-8?B?N2M0WnUxbko5ellydk5Wcjd6UlJlNVYyVzlBNTJIcUdTY0wxWlFOOWlOQ0h3?=
 =?utf-8?B?bmRZbjdJNkJ1ZEZmaDJ6MGJpcGZjYkRXUkdxVXo0WGk3T1hsUW93NHIza3R2?=
 =?utf-8?B?cjJIU0lDSDIrVkRLa3BabkhnWElldjY0akVmY0pGc2MwMTlkd1lqRVJFWUZ2?=
 =?utf-8?B?K0lrRVRIWlk2ZDJZdU5QbTlReFQzdnBodGhZUDlWbXFmZG9ZZ2M1U1J6MG95?=
 =?utf-8?B?YUx1bFQ1dzZ0bld5SHpuTDRBUW5QS0VSczlqUnZXS2ZLSVFtLys4V1g1TXJH?=
 =?utf-8?B?RUNyWTVFcEc2ODFwYVpXV0dENlFLOVFDV0xjR3Vnd01qbXl5Q3lpNUxicWl3?=
 =?utf-8?B?ZTJCMm9JS3lxMndjMjMxYWZtY2hzaWJIMjh4RzBRSHZmY3FieG01ZjBLVytL?=
 =?utf-8?B?S3ZPZ1ozWWZYNmowU1BLeHZwWUlNQUo4ZGNBUG95b0xBK3BFWnV6Rnl5eXZa?=
 =?utf-8?B?RHMrWkZVWlFvZTY3R2llMW5GRlFraFdSRG1uUVI0WnRJWWIyNklkdDVvbnZj?=
 =?utf-8?B?NjZTaHBENTUwelF2M3ZLMVBxNmxxWjNjRytxaHdRMjF2QTg0L21GSTAwRFVU?=
 =?utf-8?B?dUYwU0FKbEQxTHZPQUd5ZFk4c0FkUDdqZi9YdnZyNzdEVUM0bStEN1VodTlo?=
 =?utf-8?B?K1g1RUlCZUk5TG1veDR6VWdXT3dpTC9ZZ1Q1cVZVSVhRZlRPUHl5SDlNOVBN?=
 =?utf-8?B?TWpHYWh6aGtncUhCZHlWQ2UwUUxrM1NmUmt5M3JJc2FUOXVpbTIveEhDeTdp?=
 =?utf-8?B?bVBKNFNVc2RyblpSZVJnMGp4amhjcHl5VTFReU5Zdk1EeURqRGJwZURSd2ZO?=
 =?utf-8?B?Zk11YUUvRDJxbVZNeEI4eXFMN3YwRURuaENBT09LOHArcTVqUjEzLy9IRWVv?=
 =?utf-8?B?OTVSRU1wNzBkQm9tSG9SNTFkWkpmTml3NTZXenprL0VNUEhtWnFibVBVM3hx?=
 =?utf-8?B?OVhiYUpCQU5iS2l1MUlCYkswOTU2amZRQmZCd0JPUnFqTDhOZ0FaS0lzUUNo?=
 =?utf-8?B?QkhUR1MyZm9sNXZQa0N1WURUeFVQcHFacGE4YVVHVmFqY0NiQlZ5MElCeFhV?=
 =?utf-8?B?Q0VVY2VEeHNJR1BaelNHQlMzT3dKSHZTMHdBSFYxNnE4MFNGUXdzajFFN1o2?=
 =?utf-8?B?NzVzUkNxU3I2aGZWc2JkYTVSQXYzYmV6ZWlBOGxHZWYxTjE2R2VtUnc2aDNv?=
 =?utf-8?B?MnFSVHNjbysxaEZPa3BkaVNteU5yalpEZ1praGNWcnUrZmo3eURqcDYvV2Vj?=
 =?utf-8?B?Mml3WUdnbk1NWnFUUFV0SjNuUHhIOEkzUkk3cGpiU1kwcGUzc2pOb3Zobldq?=
 =?utf-8?B?YjJBUWw0WXRGUW9lcUlQbTlGSE5WWVF2SkZ1aWswVGlFSWd5VlNnbkxpMkpm?=
 =?utf-8?B?L2lMR01lby9RWGNIaXVVdzhrSHpFb2F5UWlsYkxZRW9wL3BQaFBadzhsNzk1?=
 =?utf-8?B?aExzaEJ4czBnTDMvQk9pYzdLZ2ZMTTlRc3FsL3BSc0VybVYvbFZYbnpaTkFV?=
 =?utf-8?B?bHNZbG9uZHVCbjh4b0YydG5DRTZLSVk5aEtGOFBNWVVaTlBzNGhhUjE5VEM3?=
 =?utf-8?B?Y1lmL0xycDVZclNYbk8vdnl0OWtxL0dCeEZsRHpjb1F2S2R4U1BaWlNsekc5?=
 =?utf-8?B?ZE5jc2x4YU9XREtWZ09FRHR5cDZDK2Zvbml6OWhieVRNRnowN3htWmo2L24y?=
 =?utf-8?B?TTcra3d0ZG9PQk15OGtmNTFqZlhxWTlHMlpYSVV3WUQ0L0RidWNrand4bGhG?=
 =?utf-8?B?YWtBNmdEN2N1Y00wS3JIMHVXSjhNOTJvZWRTNy9tSjVBclI1T1dRTXcxSWpC?=
 =?utf-8?B?S1BLRTd1a3JFVDBFSnBOYnVSQXJJVHAxQ3FwaEFHWEdDWXdOQndERHNnbnJY?=
 =?utf-8?B?MFpJNjVCWk12QVNZN0NIU3MwZkU5T0M5M0IyeU5RZnpOVWN1cGswOGRUdVMz?=
 =?utf-8?B?cTB2eHppZGVyYk5DQWJqUFpWcFN5NnFocHNTL3RsNUQwL1N3cVBxS0pnN0Iy?=
 =?utf-8?B?OTE1R0JQYXQyWXhLcytVVEVpT1lFajhOYmVNelBWRUVmbGIwNnBMN0pxRkxJ?=
 =?utf-8?B?b2dvbWIra2lQOG14cklBWWxTaU5wZlAwY1ZSZnJ4bmd2alI0Q21ZVXBqNHVj?=
 =?utf-8?B?T3JVUE5oQ0VtTEllOENmekpYV2x2Z2ZGYkloNVgrRFlJVVNiL0Z1UzZUNElm?=
 =?utf-8?B?akx0b0QrWU4veEFsMkdMM0hhcVlGNG9HTnY4cVVRaUxzYld6YmZMSmU3UlZh?=
 =?utf-8?B?UnBzTVY3Qzd6OHdwam5rZXdRR2swOXpVeWhqQnNHWmdlNEs1QnlSQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808303e5-a133-4fa6-e781-08df4ae84a21
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:36:05.2062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpzoVN8qa4+7oUYRwr7Koyke29W0Uj3VeNuUmgrQNB+E6OBFW6Vw+T9LQG1dM9XkWQaXfQETsc/gG2moSHupxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9211



On 11/24/26 14:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] soundwire: bus: sdw_handle_slave_alerts() drops alerts during
>    manager resume
> - [Medium] soundwire: bus: unserviced alert in sdw_handle_slave_alerts()
>    on suspend race
> --
>
> commit ce0ecb1363ee793ca8d8a1d1cf6efec9d612e28a
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: bus: use pm_runtime_get_if_active() in sdw_handle_slave_alerts()
>
> This commit uses pm_runtime_get_if_active() on the parent manager device in
> sdw_handle_slave_alerts() before calling pm_runtime_resume_and_get() on the
> slave device to avoid a runtime PM deadlock with the manager's
> runtime_suspend callback.
>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index aeaae5a57c89d..0f8d634779270 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -1667,15 +1667,52 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>>   	u8 buf, buf2[2];
>>   	bool parity_check;
>>   	bool parity_quirk;
>> +	bool have_pm_ref = false;
>> +	bool have_mgr_ref = false;
>> +	struct device *mgr_dev = slave->bus->dev->parent;
>>   
>>   	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
>>   
>> -	ret = pm_runtime_get_sync(&slave->dev);
>> +	ret = pm_runtime_get_if_active(mgr_dev);
>> +	if (ret == 0) {
>> +		/*
>> +		 * Manager is not RPM_ACTIVE; slave is already RPM_SUSPENDED
>> +		 * by PM ordering. Return early to avoid I/O on inaccessible
>> +		 * hardware and to prevent a deadlock: if the manager is in
>> +		 * RPM_SUSPENDING, its runtime_suspend callback may be blocked
>> +		 * in cancel_work_sync() waiting for this work, while this work
>> +		 * would block in pm_runtime_resume_and_get() waiting for the
>> +		 * manager to complete its suspend.
>> +		 *
>> +		 * When the SoundWire link enters clock-stop mode, the MIPI
>> +		 * SoundWire spec guarantees the peripheral re-asserts the
>> +		 * alert after clock resume, so the interrupt is deferred
>> +		 * rather than dropped. When the link fully powers off
>> +		 * (e.g. D3 or equivalent), the peripheral loses power and
>> +		 * its alert state does not survive; the early return is
>> +		 * harmless.
>> +		 */
>> +		dev_dbg(&slave->dev, "Alert deferred: manager not active\n");
>> +		return 0;
>> +	}
> [Severity: High]
> Can this early return drop peripheral alerts when mgr_dev is in
> RPM_RESUMING?
Agreed. The commit comment's assumption "slave is already RPM_SUSPENDED
by PM ordering" does not hold when mgr_dev is in RPM_RESUMING — the
manager's runtime_resume callback has already restarted the clock and
enabled interrupts at that point, so the peripheral can assert an alert.
The early return must be restricted to RPM_SUSPENDED and RPM_SUSPENDING
only. When mgr_dev is in RPM_RESUMING the clock is running and the alert
should be serviced. Will fix it and respin the series.
>
> pm_runtime_get_if_active(mgr_dev) returns 0 whenever
> mgr_dev->power.runtime_status != RPM_ACTIVE, including when mgr_dev is in
> RPM_RESUMING.  All in-tree manager drivers restart the SoundWire clock and
> enable peripheral interrupts inside their runtime_resume callbacks while
> mgr_dev is still in RPM_RESUMING (for example,
> intel_start_bus_after_clock_stop() restarts the clock, calls
> sdw_cdns_enable_interrupt(), and then sleeps in
> sdw_cdns_check_self_clearing_bits()).
>
> CPU0                                    CPU1 (kworker)
> rpm_resume(mgr_dev)
>    mgr_dev->power.runtime_status = RPM_RESUMING
>    intel_resume_runtime()
>      intel_start_bus_after_clock_stop()
>        sdw_cdns_clock_restart()
>        sdw_cdns_enable_interrupt()
>        <peripheral alert IRQ>
>                                          cdns_update_slave_status_work()
>                                            clear CDNS_MCP_SLAVE_INTSTAT0/1
>                                            sdw_handle_slave_status()
>                                              sdw_handle_slave_alerts()
>                                                pm_runtime_get_if_active(...)
>                                                return 0  <-- alert not cleared
>        sdw_cdns_check_self_clearing_bits()
>    mgr_dev->power.runtime_status = RPM_ACTIVE
>
> Similarly, in amd_sdw_irq_thread(), a wake event and a peripheral status
> change arriving together queue an asynchronous pm_request_resume(mgr_dev),
> schedule amd_sdw_work, and clear ACP_SW_STATE_CHANGE_STATUS_0TO7/8TO11 while
> mgr_dev is still RPM_SUSPENDED or RPM_RESUMING.
>
> Because the manager status-change interrupt registers have already been
> cleared and the clock is running, returning without clearing SDW_SCP_INT1
> leaves the peripheral continuously reporting SDW_SLAVE_ALERT in PING frames
> with no new ATTACHED-to-ALERT edge to re-trigger the manager interrupt once
> mgr_dev reaches RPM_ACTIVE.
>
> [Severity: Medium]
> When mgr_dev is in RPM_SUSPENDING and sdw_handle_slave_alerts() returns 0
> here to avoid the cancel_work_sync() deadlock, what will resume the manager
> to service the deferred alert?
Agreed. For CLK_STOP_MODE without bus reset the peripheral retains its
SCP state across the clock stop, and without pm_request_resume(&slave->dev)
a non-wake-capable peripheral has no path to trigger a resume and the
deferred alert goes unserviced. Already addressed in the fixup:
pm_request_resume(&slave->dev) is added before the early return.
will fix it.
>
> Without calling pm_request_resume(mgr_dev) (or pm_request_resume(&slave->dev))
> before returning, mgr_dev->power.deferred_resume remains false in
> rpm_suspend().  Once cancel_work_sync() finishes, the manager stops the
> SoundWire clock and enters RPM_SUSPENDED.  A peripheral can only re-assert
> its alert in PING frames after the clock resumes, so if nothing triggers a
> runtime resume (for example, on a non-wake-capable peripheral), the manager
> stays suspended and the alert goes unserviced; in AMD_SDW_POWER_OFF_MODE or
> SDW_INTEL_CLK_STOP_BUS_RESET, only the manager controller powers down while
> external codec peripherals remain powered, and the later bus reset on
> manager resume clears the peripheral's SCP interrupt state.
>

