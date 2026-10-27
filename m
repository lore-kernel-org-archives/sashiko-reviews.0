Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793089153;
	b=EgEUZ3GTzH9ZGmLT7isLyMBjB890fYwnPrCPWXtSgaE6kCGizWuZw8+wZ6VY9jFUvJQQ
	 y/drAwrxpxUwAyManreIW85Whh9qPoH4WtonpD9489HuDLo7Smz/GQsLrGwoDkPU4QZLq
	 Ho0TN190vFLrc/8c1b3uBgzUfSotR5gNiQ5ZTBTh5xLBSgVkpJG9Wzkshpmd2vdyXOvO+
	 Dh2QtlDhOkjlGrcGUIZhATCf57TxWCB8vmYIwv0GQXr5P46OuZzUY5nS3HDUQBnen/c+t
	 EFoJ9mOjHf8cKGttZQNposD7IbxUoa9W+GRu4kQHWJbihfrCLwQblNEB+tSY6ytAVOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089153;
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
	bh=H/8prYdEG7kHpNk2PSxqNm/qdNvSvofjz6W4bEqweU8=;
	b=XeLY4iX+OXaEWwydHfcXH/Y0V2FVL+BS2w6Xq2BcdNMkgk+aOqa4Qcd1O7XrlaDd5hnR
	 DU3DCcLec1Q2LZlVr2+KxoUFSWDzEH3i6FbLploof2bzp+TyLoZcIbC0gKv9F/4kFLI3s
	 8/sQ4cU64lAT821epKakugidOcjXWQwdFqaJgiwkhHQlfSV3C/lXZEgFGrERAINQ6DJPx
	 xNicfA0Ne+hvWRrmVtLdRoupCOfgYF60inUj67FqOOiFsIdDB2HiN6YPZPF80FtuXTQDy
	 QxEv3/f3qyThm7YalpXzQGfFsbod4dO7sa3EMtvr8HewAVxN/o1i8/8pGPFFD0Kg4pQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IpbBrT6n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.44
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011044.outbound.protection.outlook.com [40.93.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC7B606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 08:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC7B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IpbBrT6n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCsGWQHGkDpFm5zw6OrTxxT7qWUtrvXwRPPCZ3cs2FA6Tn7lkD0vwVJT0IhqVNOFR2VDxii87+UCwTT53BzBF3ma0BRcU/jS7eTYs7EFDmnmkdApk1XnXYjxGJaQkx2zdMHZv4gP72lYJyyi8WtDRNuC6I5MxBeGgX2tCi8GPNzhzWOsDPRi/bSRwkKq/yAnmU/Q1NQ5Fh5J9ItY9x06LF7YD5BvdV9WL2UcLJoM33CuVSU4I4Fl+/fVVOlulW14erLEaKiIHcupxoUlEyBPIdhsSRXvyXmlrLf4XfXz8cmtOjcUTNU8wQFF/akCcnVCgs9S5iOgafYQ5qimLtwmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/8prYdEG7kHpNk2PSxqNm/qdNvSvofjz6W4bEqweU8=;
 b=Br5P+KGQGTuiy3hcpuFful6EUjtEYP4CvoIgkKJyE4tTfkNss2vNKoNvf0rjmKfNRKyLOUB1gPMbg+0X2kMXWTXtgF2QDUzICHiBKSmYUbWstKd933OcAhHDlMzm/Bm1lHVNZrt74v/nuZAu4F1Veoar8RHwebEHhoO2FNhSXlitgyRep0XtgmCAsZCNsU78/i9TYMD+OOufAuuNR0AZXWO045ktjlTUzUPkTd5UXDLCj25pe0nWtxlLUMVJzdwlYFPokiAm9ry77dammYP43G7qS53SzD2EzlcvkCKlKm3x/muVJj8+ayUZrwo1juvkVhd4ONoRndKJsNlctgkY/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/8prYdEG7kHpNk2PSxqNm/qdNvSvofjz6W4bEqweU8=;
 b=IpbBrT6njDS7sH+iUWMf1BP/Y92GsUuJCrpWESmWtduJRTOLjt9EAxgoN30ffAPXU1qHNIEnh6xmMWACPrgnO5NiNW6jxx4VfhodGXZtP/K7CxoCYAoX/2Uw07IonuHKqLPpAGZC83AqE1hkMk5qYrxwNk+9ZaqVOyyVxVDJbZs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by SJ1PR12MB6145.namprd12.prod.outlook.com (2603:10b6:a03:45c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:19:08 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 08:19:07 +0000
Message-ID: <d7bfe5bc-bf51-4128-ba07-22d3ad4e5e8b@amd.com>
Date: Tue, 27 Oct 2026 13:48:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/13] soundwire: amd: fix work drain ordering in
 remove path
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Syed Saba Kareem <syed.sabakareem@amd.com>,
 "Prasad, Prasad" <venkataprasad.potturu@amd.com>,
 "N, Poojitha" <Poojitha.N@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
 <20261026044507.2310694-6-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-184787@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-184787@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYPR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ba::9) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|SJ1PR12MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: 583b5353-5b89-49cf-622d-08df3402f82f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|22082099003|261026121527099003|18002099003|3023799007|4143699003|11063799006|56012099006|261009223027099003|261022075727099003|261022105027099003|261026140227099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	Q0DDsQAcuDd1m51X1bwLMfoJ6P8qZtisYmPFYYv9l8zY8coLgm/TdXls2dzSHIqxG2DDJmX6l6mx3hUJCxtpyq8ncMNR3L5d54xuP59rKvwjvS/h/bC6w8R9M2q3ACDFaGCrCDU4mQM79dl/aWseDjlhTty9TkCtyplit7q15zE/pVcjWxcspqsVHkf6Dtoi0bbRCvf2P7yOLwZ0WWLoLV1/aw0/mUfCl8CXi4dPxDDTb6vEBCXaAZF0kupPPXXg3wfoPhM0Xj46wavGkeqMtiEuSxCsbTr5kOHbYP+K54zqVlLT98x0pakD7wrbWmnHKgD3UX5Fx/bGHZr4bBM7fb25PGigBGa0zaYf1fbW+uELxX+r0wYVB/Tpc57KTMR8mV7n2c64Mwj0LeZQFuXnLlXvPPkHLFuCeQyTtqWRHXxS6h/O4yAUXqCKS2BYMtdA6/cnqe8vpgHXo8XkVxnQKBuTjrViWdXkZIkMAhwYHmwu18gIJNDWhWD6ds5DmgnqUSOJF6ymTHcsJfLTa4Txua4rLmbkDm9MZ9zt6MceUbkKlfc6NMc+zPfCCIMpZFkVQ6fD8vK6EFIoQ1WuY7b2ZKhXQD8q1ep/fVW6cRfvdl0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(22082099003)(261026121527099003)(18002099003)(3023799007)(4143699003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(261026140227099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnNlcndnM3hKdTdtMU5wMEc4QjhDRDFWR2N6TlliLzA2ei9iTTZVZkpkeEpL?=
 =?utf-8?B?eTArZE9jczREaWc5V0U5bFJzWEVMdFNNOGlQR1JBQWN5WDk4eTNyMmU4RHdW?=
 =?utf-8?B?L2gxN1ZWU3V5ZWJvT3VRUTFWSnp1K2RUQ3ZrWU9CRUQxVlBHMVp6Z0NxejE4?=
 =?utf-8?B?Q2RjeDlsQ2djR0d2MXNkaTFRbTlXMGpQUkNNSW9jeXZ2emJ6SFZmc3pnZ2VB?=
 =?utf-8?B?L3gxMU1IRGUrMTNqZlRZTUVqVE1PTXdqWlJ2dm8zZzJmaC8yOTJHaWhWMDVy?=
 =?utf-8?B?YVRRUlpnSXIzVFljbWp0bzd1QWp0d2YrMGVDWG5SRmRZSXNETUtZMi9pTm95?=
 =?utf-8?B?VDdtbXhpUi9ndUZ3RjU0dy9DejJIWHFHZkVEdzNMa2tnL1VGRklHVDlTeExv?=
 =?utf-8?B?UzJnekw1akdWOFFaV1ZXVkRiek1LdEVKRFlkQVZvbzlFSXE0ZHprSGYwYzho?=
 =?utf-8?B?eDVtRzRaS2hKeURFQnl2OEtqVXc4MnFPRG9UUk93ZDREeWhLNWxqK3FqR0xt?=
 =?utf-8?B?bFR1aXUzMkEzTy8raWcvN3EzWjVWVmRMMjR2eEhwR2ZZdm9iM0NoS1N2QXhN?=
 =?utf-8?B?S2dnSEJEaXZ6UHMzUENkb2JOMTEzZkw4WnQ1cmE3WHdjUndNMGRDUVdNLy9p?=
 =?utf-8?B?UTlwYkxWZ2NxbmM3anJyNUhaY3VSQ0tBeEtZNGxUbFp0d2RMTkxQNmdxSDJG?=
 =?utf-8?B?VExFSUtCcmV0TTdEb2VQeVo0b3pVZi9ZTFhuTjdwUkE3SGFEeTlpVFhaQmZ2?=
 =?utf-8?B?UjJ1SDZEVEZoZGZZb2RMdklKUElJZHc0RjVZUzNZNzR2OTgyc3dsM3BQOHk5?=
 =?utf-8?B?YmVvSFpkNGRQN1pTcU9IcVJCclNhUGNqVzN4V3NKR1luaWdjM2hqVG9WOHRn?=
 =?utf-8?B?UUlqbHVaZXp1aXpIdm9TMHhNTVZqaHh0R3Nkak40NGtHV2RDUk1EWVZidnUz?=
 =?utf-8?B?ZTFIWUxKcEoyTlBXaVBRSUdWTmFsaTdaSndPVVlxTXFEVzdhVlVUM3dpVkor?=
 =?utf-8?B?am80Y1RXbmZNckhWcS9ZS0VrZjA0YnRlcEduUU9RQVhNRU84dDFpUURxZitk?=
 =?utf-8?B?ZWJpOUdJMU5HOE0yeStkeVZDVzVJdjhnQzVZZDY0aTd5MGI4cENtNzJxaHFz?=
 =?utf-8?B?R3AzRFNkYUVGRFo5OUZjekw3cE83K2ZCbS9VNFZzOFIva2JxbDhvTGdIT2px?=
 =?utf-8?B?MlIxK1JYb1JjR2g3a0ZMUFUzaVhPZmZOOXlEOUFhSExWVlJ2ZGVNSHFKUEtR?=
 =?utf-8?B?ZjZUQ0RiM2dpeDNxMEJxQ3d5L0ZlS0dyMDJRdFMwd1B5NDhsbThDNENEYVEw?=
 =?utf-8?B?WW1TcFFCd3haeHhLOVNGeGM3MWJONkV3cUJ5Y1l6UjA2K2psYWRCTC9ONytX?=
 =?utf-8?B?cElQT2Z0OSsyRVFLdkNLWURCR0lSd1VqRjFpZk5NcTNicThsNlh2RkZyNSt5?=
 =?utf-8?B?Vk1nQVg3L21NaVNpcGJEanBmbUF2SWxERWsrKzVIZlVqVDZEVDVHbmV1eWFE?=
 =?utf-8?B?QWZBT0FBWGhXamk1eldiaW02a211Y3hnazhYRGg0WW9PdmphQ1JwTEg5THYw?=
 =?utf-8?B?b2l3c3RKaDV4NDlza1lSU2xuSm01ZVpPRUx3azgzOWRnNG1jZmM1Y1hkZVVz?=
 =?utf-8?B?SGw1eTJ0d3RKZlRMOWs5OVV3V2t4NnJKMVV1YjhlOHNvdTRXVHNyR0VNaDNW?=
 =?utf-8?B?Wi9uRzBTM3lWaHFxRXRGeEZ0TktnajJRakx1cFQrQS95bUs0YjRQMytEYWRn?=
 =?utf-8?B?aEFBNVhOUG1YemNnNUNWeVdMUEVvOXVmNEMyZExIT2RURXVwVGpLeUNqTGJT?=
 =?utf-8?B?T2N2N1krdmNvcnhKYzAremlCeVloMEw2U2ZJMjVJQU1XY0xpdmJ2b2ovdTlQ?=
 =?utf-8?B?SEwvL1NkeHR6L3VoUmFiZXVlRVZYVFFiQ2FuM1VxbXM4dHd2MDVoUTRDdTYz?=
 =?utf-8?B?Y2wxNXRoaGJIMm5hSHVYOG95UzNhT2pJVVNWbWZJMEJGczd0V0pXbkhuU3ZE?=
 =?utf-8?B?YU9UV2F4ejMrWTBqQ1IyOXVTU2lmTzZXQlFIZ2JxcmxrZWxBdW1pNklxYlAy?=
 =?utf-8?B?c0Rua0FkODRsTmpCYjlDbDA4R0h1dzVBeVB1RWRLSis3eWVYbXdjbEk5THM1?=
 =?utf-8?B?TnhYcHdnTDZMZDRyUmpIK0VxWHg3QUM5amFrbWNYaGNoMm5YdE8rQWJsYWta?=
 =?utf-8?B?NmZCWXNOcDY4bGV6WUFCQU5EdlA5QlNpayt4YmZxME9OVnh1KzVScGxsQmtr?=
 =?utf-8?B?MFkzVzJKRXFQSVR2alYwMU9tTFBLWVNwQ1ZZdFU3WHFCZzkxNmZNUndrSE9v?=
 =?utf-8?B?dThVRDZ2czNTNVVObWRaT1dobGtMRUNVUHZJV3U0cWlMOGNhL3RLdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583b5353-5b89-49cf-622d-08df3402f82f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:19:07.0014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5J+vLvJ6SzjJxNSsxNggRMlD4e+aifCEmjRjiVK7scEHbTryaqOdo04JfYg5xGZjh2fHXrO6NHl5bosRWfJtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6145



On 10/26/26 14:57, sashiko-bot@kernel.org wrote:
> [You don't often get email from sashiko-bot@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] soundwire: amd: race with in-flight IRQ handler in amd_sdw_manager_remove()
> --
>
> commit 25a684110adde4056bf6250565965402e67408ca
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: fix work drain ordering in remove path
>
> This commit reorders work cancellation in amd_sdw_manager_remove() so that
> interrupts are disabled before calling cancel_work_sync() on
> amd_sdw_irq_thread and amd_sdw_work.
>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index 5e9d228d09d06..a82714cc2f6c4 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -1169,8 +1169,9 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
>>        int ret;
>>
>>        pm_runtime_disable(&pdev->dev);
>> -     cancel_work_sync(&amd_manager->amd_sdw_work);
>>        amd_disable_sdw_interrupts(amd_manager);
>> +     cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>> +     cancel_work_sync(&amd_manager->amd_sdw_work);
> [Severity: High]
> Can an in-flight parent ACP IRQ handler still schedule amd_sdw_irq_thread
> after cancel_work_sync() returns, causing a use-after-free of amd_manager
> and its MMIO regions?
++

The ACP IP has a dedicated interrupt line and does not share it
with any other IP. Once amd_disable_sdw_interrupts() clears the
enable bit in ACP_EXTERNAL_INTR_CNTL, the hardware cannot assert
the interrupt line again for SoundWire events.

However, a narrow race exists where an IRQ handler already
executing on another CPU has obtained amd_manager via
dev_get_drvdata() but has not yet called schedule_work() when
both cancel_work_sync() calls complete on the remove path.

A follow-up fix will introduce a software irq_enabled flag in
amd_sdw_manager, cleared in amd_disable_sdw_interrupts() before
writing to ACP_EXTERNAL_INTR_CNTL and restored in
amd_enable_sdw_interrupts(). The IRQ handler will check this
flag before calling schedule_work():

     if (amd_manager && amd_manager->irq_enabled)
         schedule_work(&amd_manager->amd_sdw_irq_thread);

In the remove path, amd_enable_sdw_interrupts() is never called
after amd_disable_sdw_interrupts(), so irq_enabled stays false
and the race is closed.
>
> The commit message states:
>
>    An IRQ handler already in flight may still queue amd_sdw_irq_thread, so
>    cancel_work_sync() is used to drain both amd_sdw_irq_thread and any
>    amd_sdw_work items it may have scheduled. This fully quiesces the driver
>    workqueues, making synchronize_irq() unnecessary.
>
> However, cancel_work_sync() only cancels a work item that is already
> pending or waits for one that is currently executing at the moment
> cancel_work_sync() checks it, and re-enables the work item before
> returning. Unlike disable_work_sync(), it does not block future
> schedule_work() calls, nor does it wait for an in-flight hardirq handler on
> another CPU that has not yet called schedule_work().
This is acknowledged. The irq_enabled software flag introduced
by the follow-up fix addresses this. Clearing the flag in
amd_disable_sdw_interrupts() before cancel_work_sync() runs
ensures that an IRQ handler already executing on another CPU
reads irq_enabled == false and skips schedule_work(), preventing
any re-queue after the drain completes.

The wake path, which is handled inside amd_sdw_irq_thread()
via amd_sdw_process_wake_event() -> pm_request_resume(), is
not affected. In the CLK_STOP_MODE suspend path,
amd_enable_sdw_interrupts() is called after cancel_work_sync()
to restore irq_enabled = true, allowing wake interrupts to
re-schedule amd_sdw_irq_thread for the resume sequence. In
the remove path, amd_enable_sdw_interrupts() is never called,
so irq_enabled remains false permanently.

> In addition, amd_disable_sdw_interrupts() only clears the enable mask in
> ACP_EXTERNAL_INTR_CNTL via a posted write without clearing already-latched
> status bits in ACP_EXTERNAL_INTR_STAT:
The IRQ handler clears ACP_EXTERNAL_INTR_STAT before calling
schedule_work():

     writel(ACP_SDW0_STAT, adata->acp63_base +
            ACP_EXTERNAL_INTR_STAT);
     amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
     if (amd_manager)
         schedule_work(&amd_manager->amd_sdw_irq_thread);

Any latched status bit is therefore cleared by the IRQ handler
itself before work is queued. Since the ACP IP has a dedicated
interrupt line, once the source is masked no new interrupt can
fire to re-set those bits. The irq_enabled flag in the follow-up
fix closes the remaining narrow window for any handler already
in flight at the moment of masking.
> drivers/soundwire/amd_manager.c:amd_disable_sdw_interrupts() {
>          mutex_lock(amd_manager->acp_sdw_lock);
>          irq_mask = sdw_manager_reg_mask_array[amd_manager->instance];
>          amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->instance),
>                      irq_mask, 0);
>          mutex_unlock(amd_manager->acp_sdw_lock);
> ...
> }
>
> Meanwhile, the parent IRQ handlers such as acp63_irq_handler() in
> sound/soc/amd/ps/pci-ps.c and acp_irq_handler() in sound/soc/sof/amd/acp.c
> check ACP_EXTERNAL_INTR_STAT and call schedule_work():
>
> sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
> ...
>          ext_intr_stat = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
>          if (ext_intr_stat & ACP_SDW0_STAT) {
>                  writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
>                  amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
>                  if (amd_manager)
>                          schedule_work(&amd_manager->amd_sdw_irq_thread);
>                  irq_flag = 1;
>          }
> ...
> }
>
> If acp63_irq_handler() or acp_irq_handler() is executing on CPU 1 during
> device unbind, module unload, or probe error unwind, and has read
> ACP_EXTERNAL_INTR_STAT and dev_get_drvdata() just before CPU 0 runs
> amd_disable_sdw_interrupts() and both cancel_work_sync() calls, both
> cancel_work_sync() calls will observe idle work items and return
> immediately.
>
> CPU 1 can then call schedule_work(&amd_manager->amd_sdw_irq_thread),
> queuing amd_sdw_irq_thread (and subsequently amd_sdw_work) to run
> concurrently with sdw_bus_master_delete(), amd_disable_sdw_manager(), and
> the devres release of amd_manager and its ioremapped mmio/acp_mmio regions.
>
> Should this use disable_work_sync() instead of cancel_work_sync() (or
> synchronize with the parent IRQ after masking and clearing pending status)
> so that an in-flight IRQ handler cannot re-queue the work after the drain
> completes?

Neither disable_work_sync() nor synchronize_irq() is needed.
A follow-up fix will introduce the irq_enabled software flag in
amd_sdw_manager, tied to amd_enable_sdw_interrupts() and
amd_disable_sdw_interrupts(). Clearing the flag before
cancel_work_sync() in the remove path ensures that any IRQ
handler already executing on another CPU skips schedule_work()
when it checks irq_enabled. This closes the race without
requiring disable_work_sync() or synchronize_irq().

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261026044507.2310694-1-Vijendar.Mukunda@amd.com?part=5

