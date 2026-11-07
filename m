Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794077594;
	b=QRqNiet7oqbR+Y3kenLh088FvF5qR0knoF+ONAuOzUE27euhafvVru/2OWcFyJRiGNf2
	 t1Mm29rX/ZYeBtf8ulCNclbCgSYqdYHFNOaDw6pW54JeTIG/TmdEF+RWMDmqrxDxustXH
	 s2/QCz1JDcRHFUua51djfFomis7nV2vsNLvZeisEFpggUgcy161D2n9kAJxaOzXHiqj16
	 ki2UFXKNQJyFOFPufnVwSMTWql+/TEDVKXZ1rHZZrwpZe6Pi1yoitjpZzDvDG1TDzRavm
	 GFkPvgqbzobbzoNotc+sXjkEf45Nf0ZJvMW5lN6MpXhcE54JqW31O45EUVPq1SnpD7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794077594;
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
	bh=c31snz0DQ3pC98th/8PWbhb1F+JGvI2dJgLWv8OlpHQ=;
	b=w4Ia43jCQalWy9DRRFNk5jrAY3T3JoeJ4xzqc01juOJIByZoe53YjnGGdM6+L53Ja2mU
	 QAZt7gkDDyn2Uz/FnW2u5PzuKZDsXc8RxteGT8mQ1guVyvk8SYrcrciVnE5/oG5IJ1IWo
	 QUjJg7ikWT/O9fdYI3xAvoQAb8QjfvZgHxxhX4SDNrvduGAHsm0LSx78cwYin3TccyRFa
	 S5vGvdP4fG8SJRypAv3cOyh8fcqVuXBkT3gi1zvK3Z9hmhmFzfgRoa4RMjSyFIWIsT5AD
	 m2Lot6sd3jxHRtV04F6WFxXfAXzxc7IXNos6xDbZya5mRtX+wCMVrcCmJDA0V1a4FXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ulii8gPO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.28
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1C3606A326
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 18:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF1C3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ulii8gPO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ed0SeKDByl6LszL8BNukYgCeP7xHcjOEw8dxiqXA+psMrzFaeTtWANQDwTvnFogcAajnxVcQ9WdGL0Mk21kShCNR5UX4HWEx64/npgT2/TLYthtgLa0qj8FNe2Ibni+zq2bqNoxgTLvGRZ+yd8zUy1RLJLJpWrM4LGtoPiZckzPFXu75LGBK16rsDPWg0KqWJ9acmv7dY/T6ILAcdjkWaVHL9Nm1D/BTADhayqiTAPMoObKsgNOipcDC4zk1ANDu5bEMuAfYzHkOWISNkmojzOdTpWoaHE+G6ns9137MysqHCjqNQ0plXp03rKyvkgxdBI76f+lNOBFn0/rPUWX/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c31snz0DQ3pC98th/8PWbhb1F+JGvI2dJgLWv8OlpHQ=;
 b=gJAWslHvvRSGxfg+27eUBacs/3DJkGLjpvXZp/TP/YEWsBnRHhc5pGX/LpSg9vm1rlO4Bzf6MM7MGtcWBDAiY5cwWcrQwaSr/g5UD6WzrTkeJA8j9k6/K6tsPQIeYByN3V4rtQMqCrPDi2VLVAGSMRioCnFDQty8aOqAAEZ0fpBbGvtYdG+CpqYqXsx2XlzeQ0Ppd/l8Wt1K/DvvNl6ZMZQKX4r9Vh0SoslR6x/wVXH7cVEinGh5/J9rj9tjSuYdkMKhnNWJDTO0zrTRypu8yE+QrLIan+tlFcrL369yjzvGixrTIUiY3EepQI/QzD9GZBI2ETzvQow90ZAIQuOeQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c31snz0DQ3pC98th/8PWbhb1F+JGvI2dJgLWv8OlpHQ=;
 b=ulii8gPOz1L6GHSWsn0c7UStnOzuep7MRMhBlBpBzeyG8tjcSRjI8MEVX6h1x9b1s4NiDY+PktdAF8WZelp3F7xXjY88DvEfOmJha+5dgcOKsBPZhtjWcS5IiCCjJQaX7ebca76F1YuTO3hTv/VPb0rOe8bhTej9PefFfsW2fxE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by MN6PR12MB8544.namprd12.prod.outlook.com (2603:10b6:208:47f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 18:53:08 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.009; Sat, 7 Nov 2026
 18:53:07 +0000
Message-ID: <cfab68e8-f6bb-4a60-b887-72edfff832b0@amd.com>
Date: Sun, 8 Nov 2026 00:22:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: amd: ps: guard SDW IRQ work scheduling with
 interrupt_enabled flag
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
 <20261107175339.3547918-5-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-203157@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-203157@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN5P287CA0043.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::15) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|MN6PR12MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a9198a-e5b8-4c52-b435-08df3d005c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261021123027099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|10067099003|7136999003;
X-Microsoft-Antispam-Message-Info:
	CZguFCOoZw8mx75n7Ssup562EYIyAYqik1E5UAPpLrdb8gF6JqhYnq1Q/fB2VNZEUGZdqG38WUE3RaYEkU4SjMw1iFNEXtMruevegt7EEkzPPZnL14Wzp1HxXcIz0oso0RUvRW1jL2s5j8O4MN7XUvbLxjhjQ5SdO1a9Q000rm0s1qfxz8xRPbF7W9PN8UMI5UY6lJqPJE3dultihO0UJ+97u6IOS/3SdIC74ZS2eF/xD9Fg/20iaWetO+jeyodBcDIwn5F3SFKqT+Xeshl1XafypmANIjWTHzirvflRxhXI/TI10UdMoXjBwS9vPDHfvzytJ8BwF/2a1nCxUI9TOBYuv6VZIED/3B+D47MGtoe+a1z1/4fJjMdgzusV7XkdWRjEdoO+XfG6tL+GY5Y6FtT3ItG6zp2fSgCer1BX5/G2CHr3uKk3QTkEt9LSj/UoMgAiZMg+d2Ri9bhOOp02iu9JEayqlrGzA/AMqEJC+Y21ru28oXlwHB+5DgSzWJN1To+od43fURL0bJulLVv+Ejft9pq/sFlzpMNrP/4Yq1TcIfOh5/2f9KXIcou5qVDVkcbBuxc89W6mvj4oyU0uCROejnJe0IrLLeZ4n3KSPT5mKbCWwU5uaIaUtbMx/p3s
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021123027099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(10067099003)(7136999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d21kUkFVOUc1R3YzeTNKdEF2SHFvOHNORnNhWkxvdHdJNmdBTFBabDdtR2Vt?=
 =?utf-8?B?VUNOM3djUkpXMDlINlZYZHZUU0lXamlKY0dsOTVybWRiaWIrWVR2dlRjdGx1?=
 =?utf-8?B?aHNmTTdOeWhQYk1VRWtBaEVpV0NlWWl2RUQ2a3BlemxJNnk2RVU0Vy8zK1Q4?=
 =?utf-8?B?K2FlYS83TUxvU2FXRHRSL0VsVjRFRE50ektDZVFaNXJ5T29wSHBOYjhqcG5m?=
 =?utf-8?B?dVNmOEZjalpPQ2tZMk1QL0xyNW5RdkhIOWlWa3NPbVZCQVRCZ0lTRmU4azA4?=
 =?utf-8?B?OC9hZ0ZSWWpVWWRPTVpobmp3ZmlQMUlLVkc0Zzd0dk9GZURTejErcE9zNVRN?=
 =?utf-8?B?c3JxV1NGNDYwbnZrdUV2UWxhVElIa1laQ1RWWHZCYjRXdUxubUEwN0krRXo0?=
 =?utf-8?B?b21vMm56eUVlVC9XWTFSYnloemtyOGF4aEtneTdNdkpwUmlBVE0rRDNzRjZ4?=
 =?utf-8?B?SUV0SzVQVzVVbTVQRGdPblN3eDRxWmpmVlJHZGJKMC9Ya3lvOXFwY0VGZG1H?=
 =?utf-8?B?d0l2bG14SWRjQnd2MmtJQ3dUOTg4Qkl3RC96K2hMRmYxRS9HSjZpVDFVa29q?=
 =?utf-8?B?TFhmUVJtODBUVXhma29YeVFQdVVoK0U2RG9FK1JUOWtRMzJkL0lTRXBvdVVi?=
 =?utf-8?B?QWhodmFGV3RzY2tMOXJLdUQwcDZtRURzRWVMMEJrSG9yUEJYUnphcmVoa0Yw?=
 =?utf-8?B?STVpdFpoKzRkSEIwQ1oyS0JVU24rQVd0NGVhai9vZ2lRQVBnSTVRWFduY1ZR?=
 =?utf-8?B?OEV6cCsxT0NwZHRmdHNYNzZGNFBKUXJRYjQ3UCt4ajN5MWlXRW03T09zandx?=
 =?utf-8?B?RHlTcTZuZkVPdWpSZmQ1UzA3UlB3K3Y0YUhBL0o3U0FWYWRXa29uejVtaTdh?=
 =?utf-8?B?ZlZ4em0xTFhjdjEwM1pwa1B0d2ZNY0xpQXBJcExVLy8vNFJQVmxrVzRzNjVF?=
 =?utf-8?B?amc3VWdjVXZ1NTE1UmwvMk44Y0dEWEc3a2JxTjY0bEpQMjkzdEpCQ0cva0Zw?=
 =?utf-8?B?Q2xpZ0NhMnRTU05KL1FMbVdZVTRHYWpyWnQ2Y3NSUW4wZllPQ3BQOWluRFhs?=
 =?utf-8?B?UjlZREhYSmV4bHU1NlEwQytlcTN2ZFZKdWc0bXh0YTkrUTl2Z0xZRkNzbkxj?=
 =?utf-8?B?b2pjN2FpaldYWDBvUEJFbXVUZzZOWm9TMVA2bmFvNVN3QU1aeGdWZjdmd1d5?=
 =?utf-8?B?aWU1QWUwVTBGREx3bThmS1Z4VkhIQU9FblZYa0tSdnM3Mk1kSlVGOFJsc2xl?=
 =?utf-8?B?djdqYkdGWHFzY0NCVzJ1b29GdTRJdXBLN0JGWkhwSjlDR3VrVnJFQmY1SjFv?=
 =?utf-8?B?Snc1SGdKU3pOam1GUHd4TDJWRUhJTllmRHduc0NoaDJYNVFLeUhFNnUrdzla?=
 =?utf-8?B?V1g4Ym5Lejh6U0cvYTJ1S2JFTHJ1WUViTlkwaVhCOXhRWVB4c0VKZ0d4OVNh?=
 =?utf-8?B?Mi9kczRCWWFERzh6R3h0T2VWWGorMS9hcEk1cit5TXM5VEhTTXVYendGUWph?=
 =?utf-8?B?WDFUMG9RczJrUU1aeHNiQndXTEViRGFjVkN4ZG1DbmhKRW05WmVIN1hzcndT?=
 =?utf-8?B?SER0TXJjRitsN1RYalJpOXlaU3MxdTdrSHZ2eHVxZW9HS0VuOWQyMTZRYnUx?=
 =?utf-8?B?Q1JMajl2ZFB5SStQdHJ0aDVicG91dGczSU52ODV1MGJ6U0pBNk5QT2grNHFr?=
 =?utf-8?B?QXVFaTJ0MGFKU3o2WlFHbUtBMHF2SVNqaWZES0EvZVJoT3kxd1grVnpLeWVM?=
 =?utf-8?B?c2VCY2UzVHZ3MStxcU1yR05zVEIzZy9CdWdaMDdxVE83V1Z0aVVocStPTGdP?=
 =?utf-8?B?NHF0Y2NtSnJ2d0phR0dBd25VTkppYnd5R1pMTmdsSzQ2dklLRTZhSE42Zkd3?=
 =?utf-8?B?aHc1L0VOVVJsYjh3Z2VIZDAyYTJjVW5kNUhLWkdUbCtVbzJHZ01IN0JxUG94?=
 =?utf-8?B?WHpXRVczSzlRV0xjMWgzbGg3c0Z4NUMrSGlCcCtVTlZMOXdVMjFab1NzaFJ6?=
 =?utf-8?B?clV4Y29ycVVmVWVPTUpGajU3OStGZ0E4V0JFY09yK2hqbjljK2JJYWJBWk1a?=
 =?utf-8?B?ckR0U3d6M0JlYVpaSEJmMFJSVmdmVlpWR2kvZ1laeFlSVnVvdU5LQUJPaDF4?=
 =?utf-8?B?eE9DbmxzOXQ5WGV4MlJ0M3pQN1FMa0lGc1BSVEdJeWxWdWRMWFl2eWZqN2F2?=
 =?utf-8?B?Z1hyaGk0aldDTGRjTkREWmNPc0pOTDBoT1A3dlp6V2tES2NhLzkxZ2QySEdY?=
 =?utf-8?B?SWpQa3ZpVWYzQ3ZZNEtEM1UwMmpaTTFZTTZRcUlMYnRtUE80M0Y1OG5mQ0d2?=
 =?utf-8?B?UXl6clhYY2JhTTlJOWVsUDU3VVk2blZWaEloK0tNV3k5UEM0ekJ0Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a9198a-e5b8-4c52-b435-08df3d005c8f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 18:53:07.5496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHboCBxT/4uVS6+0Rom4MBpHNVHldI2Md62fqqKKQ4p4h4jP0SNklCpjO7+emcLa5hf2EstQngsO2rtA4hFhPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8544



On 11/7/26 23:42, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] ASoC: amd: ps: build failure in acp63_irq_handler() due to
>    missing struct member
> - [Medium] ASoC: amd: ps: TOCTOU race on interrupt_enabled in
>    acp63_irq_handler()
> --
>
> commit 371c40e74acce37765aa0469d9b4a4ac8ef4b3eb
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> ASoC: amd: ps: guard SDW IRQ work scheduling with interrupt_enabled flag
>
> This commit guards SoundWire manager work scheduling in acp63_irq_handler()
> with an amd_manager->interrupt_enabled check for both SoundWire instances.
>
>> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
>> index d0b66df101579..0442010e969c0 100644
>> --- a/sound/soc/amd/ps/pci-ps.c
>> +++ b/sound/soc/amd/ps/pci-ps.c
>> @@ -215,7 +215,7 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
>>   		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
>>   		if (adata->sdw) {
>>   			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
>> -			if (amd_manager)
>> +			if (amd_manager && amd_manager->interrupt_enabled)
>>   				schedule_work(&amd_manager->amd_sdw_irq_thread);
>>   		}
>>   		irq_flag = 1;
>> @@ -226,7 +226,7 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
>>   		writel(ACP_SDW1_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
>>   		if (adata->sdw) {
>>   			amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
>> -			if (amd_manager)
>> +			if (amd_manager && amd_manager->interrupt_enabled)
>>   				schedule_work(&amd_manager->amd_sdw_irq_thread);
>>   		}
>>   		irq_flag = 1;
> [Severity: High]
> Does this break the build when CONFIG_SND_SOC_AMD_PS is enabled?  struct
> amd_sdw_manager in include/linux/soundwire/sdw_amd.h has no
> interrupt_enabled member, and neither amd_enable_sdw_interrupts() nor
> amd_disable_sdw_interrupts() in drivers/soundwire/amd_manager.c sets or
> clears such a flag.
The interrupt_enabled member is added by patch 17/25 of the AMD
SoundWire fix series which this ASoC series depends on. The
dependency is stated in the cover letter of this series. When both
series are applied together the build is clean.

Dependency:
https://lore.kernel.org/linux-sound/20261107154659.3358223-1-Vijendar.Mukunda@amd.com/ 

> [Severity: Medium]
> Even with interrupt_enabled added and cleared in
> amd_disable_sdw_interrupts(), can acp63_irq_handler() still race with
> SoundWire manager teardown and cause a use-after-free of amd_manager?
>
> CPU0                                    CPU1 (<hardirq>)
> amd_sdw_manager_remove()
>    cancel_work_sync(&amd_sdw_work)
>                                          acp63_irq_handler()
>                                            amd_manager = dev_get_drvdata(...)
>                                            if (amd_manager->interrupt_enabled)
>    amd_disable_sdw_interrupts()
>      interrupt_enabled = false
>                                              schedule_work(&amd_sdw_irq_thread)
> device_unbind_cleanup()
>    devres_release_all()  /* frees amd_manager */
>    dev_set_drvdata(dev, NULL)
>                                          amd_sdw_irq_thread()
>                                            /* dereferences freed amd_manager */
>                                              <-- use-after-free
>
> acp63_irq_handler() checks dev_get_drvdata() and interrupt_enabled locklessly
> in hardirq context on the parent PCI device, while amd_sdw_manager_remove()
> never cancels amd_sdw_irq_thread or synchronizes with the parent IRQ before
> devres frees amd_manager.
The remove ordering shown above is the state before the fix series.
Patch 14/25 of the AMD SoundWire fix series corrects the remove
sequence to:

   amd_disable_sdw_interrupts()       /* clears interrupt_enabled,
                                         masks hardware IRQ source */
   cancel_work_sync(&amd_sdw_irq_thread)
   cancel_work_sync(&amd_sdw_work)

Once SoundWire interrupts are masked at the hardware level, no new
IRQ deliveries can occur. An IRQ handler already in flight before
the mask took effect may still queue amd_sdw_irq_thread, and
cancel_work_sync() drains both amd_sdw_irq_thread and any
amd_sdw_work items it may have re-queued. synchronize_irq() is
therefore not required: the hardware mask bounds the window, and
cancel_work_sync() covers any work queued by the in-flight handler.
>

