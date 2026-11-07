Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794083439;
	b=blScYP38WBwHeb3Sz0wOALIB+jpVPE7d6kXeIAi++zUtMnDvHu72NZ2vTG71Jc4nojGL
	 aJIMO8AqtMiy8WLGn5MUJY8cUqDCGNJtfimfcYd2RZusIgKcvW0+pZyl81hPmrYOEF7Cn
	 a/3AUCGWnRnII2yJ8klVz/X4cv5PyO12/AN+1CsOBI1ZctT6DG66Qd91NP4G9xKORdjDX
	 hpaNCD5xJ6VceSlEzMsGtlVcPzCDuKftchXymwBTzMVI6VUNyue0wvGFwRhy5ck/h6ltb
	 e+askA9f3htYeqYfywmk3wIx1FSIcEHmvor1kBjsp4po1sLhsL9C/8Hk548ngNf3jhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083439;
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
	bh=4MNWf77dqXeZAlerMtxCa2SF+zjRzTrravYG0Zjbt3Y=;
	b=CcFq4qnNtLjtBPcr5ass4bfQuNmV5tm1exPqlJwc8K5MBFRddnIp9Jfpd43iTkDk0goL
	 z0r0qPU/iGpOCtcCUk6AlVCd38oC1/RlwF60sV3SuHLPsn1VOkVAl3GhlaZTDO4aNEt2M
	 FiNkV8uFR4+T2ObcRep892NHqdIRHcvY0bNc5CzMnmhSgIe3h0g7XNY9OTBCMTBVzbkjy
	 XwUQq7MmeR81Rv7kMvmnsuGhk9Qe34qWzacD5nfE4tVyEyIZQU88XKArv2WlGCSyXlqrO
	 2UNA1EQnrQRRT87+0MvN7+YOG7y/RojaAIU7PJf+BfPAHwDntLJMIYESlm26oYSw9BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mbHExxpx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.30
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5547C606A326
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 20:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5547C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mbHExxpx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhL6SC74bmueT+gJEW8/RWS3/qLWSmDRi5KZxwKSFB4FI9nIONLC9S/bd582im1JtHk55tDXNllSXVHTShCReUIE83IRP3UNd4ckiRVsM+YlT6LzKYzYnWW0ew6tWjmiKp2S/41IVYNDOoin6ayVvkTZOgrttK5zJ14kNlp5P+s5yCBaq0IImOWc7uyDUYFtWhfsVHnT66EOd9NP2tW79LoTC++YnzpjzwefabyxAKCpFkqckfeWTiTduKvrw+vvBFgz1URjaOSyv31LjZzcHMvnYRgEa1MKYTGxSlRihj5UC8v9tLFQxyC1l3Ke0Y5nBLU39eAEmoTiRoEXXBno+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MNWf77dqXeZAlerMtxCa2SF+zjRzTrravYG0Zjbt3Y=;
 b=HTWpKOFCxYRghD1C4yQZe4kZY1Tl/jkEZ7+M85G0+pEYmi4ZvR200rLAS0lGNPvwOWZm9GIsagflmfJDNrmoBbFiviYxGbhqmqO0oTcfrtKYlOZk1fBnUp6DzrxPqKumVUoPyOhwDvP3HKhJ7YRksiDwdas79f3tbImUna0UrO67iBQiUk6ukb06Rzla81XsT+JRVRvW+PB7ZehTy7loFbP9lQScDfqtBVHZ0yKx4mcp6vtLRyXuqbiCsQViMMtPTz4E14bK2w9ZwoUtpEvXamX4hunetHvN6ib+SRM1sJ/EP8U7IYhlQQcCilv9H0qrskB3SAv4SDAnVVNS8+zt1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MNWf77dqXeZAlerMtxCa2SF+zjRzTrravYG0Zjbt3Y=;
 b=mbHExxpxeOcpKBYo1veQJDM35B8TpIf0DSoxKxPxi4nHU6nUMT4lojuhKQseeB07JLutXbnGmJxzkoSx4WF6LhYfQtHJL/kykncTYUXLygd2TNnrTJHbbrZKMbS7X61W/kC3SEm6mRsbzQNYAuPWNLaCzOU4uA2Z/Kj/WIDwfq4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by SA1PR12MB7270.namprd12.prod.outlook.com (2603:10b6:806:2b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 20:30:35 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.009; Sat, 7 Nov 2026
 20:30:35 +0000
Message-ID: <8761158c-943f-4bfc-af89-d6e1e26435e4@amd.com>
Date: Sun, 8 Nov 2026 01:59:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/25] soundwire: amd: use interrupt_enabled flag to
 guard IRQ work scheduling
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
 <20261107154659.3358223-18-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-203052@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-203052@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::7) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|SA1PR12MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: af3e20da-917b-4ff1-af2e-08df3d0dfa79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|4143699003|261021123027099003|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lAxdqCuUT7WaItcLTxWxTrYt4ObJmC5bL4VcPvawNYo/NeweqtkU2xbUO6YGvm7EMAuI+tphzbQNDw8F8rb9bdHWsAa0hugwOa/+WnBA2i8L2By4VqL7rOllqIUi38GlvnUhQNpRnDKnrIJ9CzmL5TzUvyVPveClB6ARp100R5CHbZUQ3FkI9J1cQFY6qZnsIzI9RpM6WFmd07Z2YCQe5u8T33SPNLZlW5Yavphfas00AuHhoCIi2y3ltyKectNqVQwZVr/OT6FqQmTuU/j2bhnG65ytlB0wXYpLQjV9qXEa85YM4MgLuII1u6/MV843+1klf0VjPsktm6RGdsXwSIPOKMYQpeYHayY7o8ivGmL1MkEI9P2My6e5QCj7mT1XZwGQYTNMhQzYff1eZXqEuKMZK4RDAG/9Epqw61eksPE1XC2S9WX1Q6GuI4JeudNQ0tW7Z5fm6HbN1Lan81BglyhknyKnAf9Vaqk+xkKx+43TAQTsbG5l4UvHxDkbrUxapqXUtxpJ11rGQ2QGvbFUXZAkMd67Q6uYj3vemhCDzoqUUVpzHQZ+n7aF6Wo9a2AJixEw/kOn22XVP6hhlw63xUJP4885nihOHzY8aSwwEQI4k2R/EvKAuMw2atjppyfyV0WW0q+wQFRPSCAEIQVHtj6Ye9ZnK2mf0piTd0D3+no=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(4143699003)(261021123027099003)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anhZS2dqN1VzWnB5d3BhMVdXS3lkYWswQ1JTeVdITk5wd25SaGJjeTBWTEk1?=
 =?utf-8?B?T2VEUVM2VE53aUgwWDFEU0kveVpib0prb2FHSGxOeTg3QU1IRkhyYXIxbGlR?=
 =?utf-8?B?bkJoTFhlUUwvUkdOdCtCTW5RV2F6akYvQnJwd29LR0YxaTRHWWVJcm52c1ZD?=
 =?utf-8?B?ZzRFcVMxWktoV2xvaFIvSWY4SFBuYVQ3eWhjV0F3MFR4SXZXbDRINVRxU0xv?=
 =?utf-8?B?Sm0ybkZCM0dSU1ZSbTBLNVVWdHBpRWQ0TmViTnBKdUhiUWF5Y3IvalVEdkpx?=
 =?utf-8?B?WVorRXdlcldEaVBFbi8xb0NCTDJMdXpQL3FsZ21qSVJJL2hlR0UxQ2dCb1hY?=
 =?utf-8?B?Y0M2Z2N1OG1DSDRvS21QcEhtcXhsUy90WVk2U0ZKVG9IVGtjaEVOQW9Ya0lH?=
 =?utf-8?B?eFRYeFMzbXY1TXdFeVNId1QvQUs1bzF1byt3LzJFSXJCYTQ4ZDFYRU5EeERY?=
 =?utf-8?B?MmpScnJxSW56YjlyYUYwMVZxMEd2Q1hwMmdsT3hyQ1N1OW0vU0o3U3JIQ3FQ?=
 =?utf-8?B?cUU1SEd2NXErODNOSitHa0V4VUE1VWY5Y04wNEx6SXN1YnM4ZWZHYnFrTUtR?=
 =?utf-8?B?WFlSZ04ybmdhWmlZdXd6RWFpYkxaNFNKNndGWVY2ZlVFcUFnSnpKRk9JZzRP?=
 =?utf-8?B?THN1Y1lyZURzNHdMV3R6bFhTWGp1S0xINlNCR1BiVld5dzFoY0VRM3gwUjBE?=
 =?utf-8?B?UEdYRHhCT1Z4Q3BvODhUamhGdGc2UHdVd0Q2M1Bub1hzMkJTMDFma2htaWRr?=
 =?utf-8?B?ZlIzeVg4SkV4MGFPSFJrVUJkZG5HeVdPNmRsV1lmaUllSTdCazFPRXpTOGRD?=
 =?utf-8?B?akhkNHdBb0QxNVJsM1BEbDNoKzJma1dyMXZCM1RKU0YzU2I5L2J0ZXRtUTNl?=
 =?utf-8?B?RzFmZlNFUGpBRXozVEl2cml1TkxzTUZ5WnM3UzkrVkl1ZkMwczdvODhhYzl2?=
 =?utf-8?B?K1RVSWxVWjhFSUFjSEc0UTBWMTN1c3RjNm80bWJlQTVRMzNDcFhIMTErbndR?=
 =?utf-8?B?am5zMmhVb2RTZ09pazNDbjRoN2RZS2lHT0V2K2NUemxFSWlQYVNMcGlXVFVB?=
 =?utf-8?B?RnB5aU9YYW8vVlhTNWh1aDdRVXE4OUFQMEwxdnNwUEs0THNFUVFIYjY2RVhh?=
 =?utf-8?B?WnRKekgzWjZmZExXVC9IU2R3WkVMaHl3b3pxVW5zQ1pLWWNQcVZYek5ENHdp?=
 =?utf-8?B?S1Q2MVhlZjZzbkxnY3NURXR2Yll6WmJ6c1lES0t3aWxhTEQwSlI4bHpKcWg2?=
 =?utf-8?B?L1FqODN3eW1tY3VIeklpbHpISjdSdnlZK29vZ1dzVk1hRlJ3RysxZ0Z6c3NU?=
 =?utf-8?B?Q2diUU1BRjlqR2l4ZVdIZTkvQzNySno0ZWdFZDRQbGw4c3VrR3ZwcEtENTZj?=
 =?utf-8?B?UktkRXBzY3BCd3hQWFlwZjhtWFZVU1puWXhrTFZORTMyRjNUMGdzOVJWVkh3?=
 =?utf-8?B?VHd2TlV0K29VSjlZWVQ1ZXBBTWdCWXdNdlNPSFVJK2tuc3JvemRUUHVVQ1Zu?=
 =?utf-8?B?bEhFQzFiV2xqSkNzZEdXTmRZU1pyYjVDNXlmNlRET0dMeFFMODdmSWxwYkZj?=
 =?utf-8?B?RWpsaHYwWUlOMkNrSFVZUlA1UmdnMkQ2TFppMmNsZUdVS2J3MHNKUnNVcmxI?=
 =?utf-8?B?VmJlRGU2VCswcW05ekVjczRGczNlcjY5ekNTOTY0ZzViT3Zwd3JaT0wwZUZ3?=
 =?utf-8?B?K1RvWWdNMGNvL2pLRmd1MmNpZER3RzN0VWMzanJ4cElKQW82eGpoZUJOU2VL?=
 =?utf-8?B?YldCNjFTMXVNemsyd3dSb3B3QnlIRlNQSHMwUkFBSXJ0RytKWk9PMDNWVEpu?=
 =?utf-8?B?eGJZWVBHNnFKSUVKUWd2VFNRT1FVMVErUkcwdjJqSUVSWnRSSFNtVnRJVm9y?=
 =?utf-8?B?NHVlYmpZWUxpRUhFaG5ub1g5QkdDK2pXMVpHTytPMnVXdlJOS2hQMXVJZ1Ar?=
 =?utf-8?B?M1RyQ0xzNGlTNVJpWlJyekd0bHRRMm1jc0hxRjh3YXhpbXppcGdlQzR4T1Ju?=
 =?utf-8?B?djMzaWZEV3UrSHpaUmV3QUI2RlpnWmp2U1Y0S0lCOFdQR3VYbkZzVjk0Yjcr?=
 =?utf-8?B?Y1FIU0RQVG1jd2FRMnA2UUQySzd0NXN3SWRyTHd4UkFYR1NXc0wyNkVrME5t?=
 =?utf-8?B?UVA4Z1JmNGxmeExDZTFvNG9oZVNXdUVrQmhJcUI5aURiL0JTNUxXaUxXWENJ?=
 =?utf-8?B?NjlyemMzcmxCd3NQUEZ0REtGVVpxV2hVYm96a3ZSVFAvY2JuMmREbW42YkJK?=
 =?utf-8?B?ME9ucytsME14MXJxcVlGNEgxOEpQQ0FpN1dQem9wZkdZdGNCWTJHSisvNHVO?=
 =?utf-8?B?SmhHbFAxSWlvc0RESlhNQko0dHd0Z2Vya0hyeTY3WlhiZTVXWlgvQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3e20da-917b-4ff1-af2e-08df3d0dfa79
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 20:30:35.6823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIhD0NSRD6lETCgRiLHZGAlmBAfRk8oof1L9t7bV2kByJFeWr/412DaRoOhagOnffJ20e/c9TBGRRBM6mCuJWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7270



On 11/7/26 21:51, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] soundwire: amd: lost IRQ in amd_enable_sdw_interrupts() due
>    to late flag
> - [Medium] soundwire: amd: unguarded IRQ work queueing in
>    amd_disable_sdw_interrupts()
> - [Medium] soundwire: amd: race re-enabling IRQ masks in
>    amd_disable_sdw_interrupts()
> --
>
> commit c646d5fedeac998edd11296e03517aec14fbed88
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: use interrupt_enabled flag to guard IRQ work scheduling
>
> This commit adds an interrupt_enabled boolean flag to struct
> amd_sdw_manager to guard scheduling of amd_sdw_work when interrupts are
> being disabled.
>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index 01aa051cf63fa..108553b0f32e8 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -129,12 +129,22 @@ static void amd_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
>>   	writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
>>   		       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
>>   	writel(AMD_SDW_IRQ_ERROR_MASK, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
>> +	amd_manager->interrupt_enabled = true;
>>   }
> [Severity: Medium]
> Can setting amd_manager->interrupt_enabled after unmasking the hardware
> registers drop an initial peripheral status-change interrupt?
Agreed. Setting interrupt_enabled = true after the hardware unmask
creates a window where amd_sdw_irq_thread() runs with the flag false,
skips schedule_work(), and clears the status registers, permanently
losing the event. The fix is to set interrupt_enabled = true before
the first amd_updatel() call in amd_enable_sdw_interrupts(). This
will be corrected in v6.
> amd_init_sdw_manager() has already enabled the bus before
> amd_enable_sdw_interrupts() runs, so a peripheral state-change interrupt
> can fire as soon as the mask registers are written:
>
> CPU0                                     CPU1 (kworker)
> amd_enable_sdw_interrupts()
>    amd_updatel(..., ACP_EXTERNAL_INTR_CNTL, ...)
>    writel(..., ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7)
>    <IRQ fires, schedules amd_sdw_irq_thread>
>                                           amd_sdw_irq_thread()
>                                             status_change_0to7 = readl(...)
>                                             amd_sdw_update_slave_status(...)
>                                             if (... && amd_manager->interrupt_enabled)
>                                               /* false: skips amd_sdw_work */
>                                             writel(0x00, ..._STATUS_0TO7)
>                                               <-- event lost
>    amd_manager->interrupt_enabled = true
>
> Because amd_sdw_irq_thread() skips schedule_work(&amd_manager->amd_sdw_work)
> when interrupt_enabled is false but still clears
> ACP_SW_STATE_CHANGE_STATUS_8TO11 and ACP_SW_STATE_CHANGE_STATUS_0TO7 to
> 0x00, the peripheral attachment or alert is permanently lost.  Setting
> amd_manager->interrupt_enabled = true before unmasking the hardware
> registers avoids this race.
>
>>   static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
>>   {
>>   	u32 irq_mask;
>>   
>> +	/*
>> +	 * Clear the flag before updating hardware masks so that any IRQ
>> +	 * that fires during the mask-register writes sees the flag as false
>> +	 * and does not queue new work. Once the mask registers are written,
>> +	 * the ACP hardware will not assert any new SDW interrupt, so no
>> +	 * synchronize_irq() is required after this function returns.
>> +	 */
>> +	amd_manager->interrupt_enabled = false;
>> +
>>   	mutex_lock(amd_manager->acp_sdw_lock);
>>   	irq_mask = sdw_manager_reg_mask_array[amd_manager->instance];
>>   	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->instance),
> [Severity: Medium]
> Does clearing amd_manager->interrupt_enabled and zeroing the mask
> registers before cancel_work_sync(&amd_manager->amd_sdw_work) allow
> amd_sdw_update_slave_status_work() to re-enable the status masks?
amd_disable_sdw_interrupts() clears ACP_EXTERNAL_INTR_CNTL, which
is the delivery gate that forwards the ACP IRQ line to the CPU.
Even if a concurrently running amd_sdw_work re-enables the
state-change mask registers, no new SoundWire interrupt can reach
the CPU while the delivery gate is closed.
> drivers/soundwire/amd_manager.c:amd_sdw_update_slave_status_work() {
>      ...
> 	if (amd_manager->status[0] == SDW_SLAVE_ATTACHED) {
> 		if (retry_count++ < SDW_MAX_DEVICES) {
> 			writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio +
> 			       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
> 			writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
> 			       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
>      ...
> }
>
> CPU0                                     CPU1 (kworker)
>                                           amd_sdw_update_slave_status_work()
>                                             sdw_handle_slave_status(...)
> amd_disable_sdw_interrupts()
>    amd_manager->interrupt_enabled = false
>    writel(0x00, ..._STATUS_MASK_0TO7)
>    writel(0x00, ..._STATUS_MASK_8TO11)
>                                             writel(AMD_SDW_IRQ_MASK_0TO7, ...)
>                                             writel(AMD_SDW_IRQ_MASK_8TO11, ...)
>                                               <-- masks re-enabled
> cancel_work_sync(&amd_manager->amd_sdw_work)
>
> During runtime suspend in AMD_SDW_POWER_OFF_MODE, amd_sdw_wake_enable()
> then performs a read-modify-write on ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11
> while ACP_EXTERNAL_INTR_CNTL is re-enabled for wake on ACP 6.3, leaving
> non-wake state-change interrupts unmasked during suspend.
>
>> @@ -1143,7 +1153,7 @@ static void amd_sdw_irq_thread(struct work_struct *work)
>>   		/* Check for the updated status on peripheral device */
>>   		amd_sdw_update_slave_status(status_change_0to7, status_change_8to11, amd_manager);
>>   	}
>> -	if (status_change_8to11 || status_change_0to7)
>> +	if ((status_change_8to11 || status_change_0to7) && amd_manager->interrupt_enabled)
>>   		schedule_work(&amd_manager->amd_sdw_work);
>>   	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
>>   	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
> [Severity: Medium]
> Does guarding only schedule_work(&amd_manager->amd_sdw_work) inside
> amd_sdw_irq_thread() still leave amd_sdw_irq_thread itself unguarded
> against an in-flight hard IRQ handler?
The acp63_irq_handler() code shown above is the pre-patch state.
The companion ASoC series posted to alsa-devel adds an
interrupt_enabled guard in acp63_irq_handler() (pci-ps.c) and
acp_irq_handler() (acp.c) before the schedule_work() call,
covering the in-flight hard IRQ handler gap.

This finding is an artifact of the two series being reviewed in
separate trees. When both series are evaluated together as a single
patch set, Sashiko does not report this issue.
> amd_sdw_irq_thread() is a work_struct callback rather than a threaded IRQ
> handler.  The actual hard IRQ handlers (such as acp63_irq_handler() in
> sound/soc/amd/ps/pci-ps.c and acp_irq_handler() in
> sound/soc/sof/amd/acp.c) schedule amd_sdw_irq_thread without checking
> amd_manager->interrupt_enabled:
>
> sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
>      ...
> 	if (ext_intr_stat & ACP_SDW0_STAT) {
> 		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> 		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
> 		if (amd_manager)
> 			schedule_work(&amd_manager->amd_sdw_irq_thread);
>      ...
> }
>
> Without synchronize_irq() or a check before schedule_work() in the hard
> IRQ handler, an IRQ that fires just before ACP_EXTERNAL_INTR_CNTL is
> masked can queue amd_sdw_irq_thread after cancel_work_sync() returns:
>
> CPU0                                     CPU1 (<hardirq>)
>                                           acp63_irq_handler()
>                                             ext_intr_stat & ACP_SDW0_STAT
> amd_sdw_manager_remove()
>    amd_disable_sdw_interrupts()
>      amd_manager->interrupt_enabled = false
>      amd_updatel(..., ACP_EXTERNAL_INTR_CNTL, ...)
>    cancel_work_sync(&amd_manager->amd_sdw_irq_thread)
>    cancel_work_sync(&amd_manager->amd_sdw_work)
>                                             schedule_work(&...->amd_sdw_irq_thread)
>    /* devm frees amd_manager */
>                                           amd_sdw_irq_thread()
>                                             readl(amd_manager->mmio + ...)
>                                               <-- use-after-free
>
> Even when amd_sdw_irq_thread() runs with interrupt_enabled == false before
> cancel_work_sync(), it still reads and writes MMIO registers and calls
> amd_sdw_read_and_process_ping_status() before reaching the
> interrupt_enabled check.
>

