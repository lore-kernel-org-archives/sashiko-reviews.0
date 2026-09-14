Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022091.outbound.protection.outlook.com [52.101.126.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AC33290B7
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 03:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354824; cv=fail; b=GoTQgkUNCRNWONxtWtM/AKIXIY5LbTeS4WdUzmzWzL6fPKwbXVwALVG4towNLj6rbDqtv4WGYBmfN+strsTCgpUHEcDsYA8sTGf+Ri4L/nxoBGyE3V11vIdNUyR/XlmC5alWjsm24bEHWBDn3IlCSgIrmK7yVkLtcsK3qLG+V9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354824; c=relaxed/simple;
	bh=u6OSHB8HcgZDkW/DkpjcZkke4iNmHPZQ67OJ57vjBfk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RyUJP80NI/MGWDrpJrjlhk/hYNsyh6X5CW4v0I92C40AAVMRaDInayd67EbgAbuQjJDGm2qUXV8rXRsUE5GX0bI2W85xgIbGeoXEpEl4V0Ie0gczPLbQ+bKEQwcLWKDbRz8MtVsHLmJPy6M8wol0+rfQ3jvYv2TBovx4f81sqPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=lQvJi7Oa; arc=fail smtp.client-ip=52.101.126.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="lQvJi7Oa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwE7IQv1lzBLApZbyJBHJ6x+cr/kVNXaIZt8XHwdqIDzqafo0gzkfpYbWwC07xMFWNiIv/0ZjWNayN2lFx/+9SsKaHYCN7DUvDzWUqX9P9BKtLKWDTRESsyiUPFU8xEBi/ZViVzKeA/Otq+gopOqwXHobw+jsV4nowseXwkQ8wHUf0np9U1ysbAixJ2BS/EWNmSDsheRRad9J64SaiJ28qO0ueVD6WOUQ9qGGDiiXzzX1rvNT33VCHp7R6oMqkp9K0BwL7DAjnyKV/C5cpYyIpsWRkYDR0g/kVaNAmv0Lz6mvlqTK5lnL7TuV7G+psywD1gT90unII4SOVf0TRZBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4PllXCQ+FmuK2JXPzop8Seem16MYlsrBaoKHpUxyvM=;
 b=s6bWECwa+QCFhpaInH83N7VKot2dY2TsS0qGqPDHE/dZRi5d3r/vJZJcFAgRpeHCZXnwQpwyVRXEkLweNCAKvn5L9Z8+nrQ/oDYV0hKQXgzLjrPXNSTOW0SoCDiKwuf8erbcozJQJEl0gKegGT7fn13jYHp2VWSh+y2n9Uqp8OwERcRP1heP5GC20myAHs9YRuvitdk7WSVRsNuxQ/DLabT1das7L2RXomkoQ7R8Ur1nBZfmQnzSim6uep1qKgnIpgW7IK9cteVskIgOC6O9WVRs1AZ2yivepC32VNxb1j6qjpvDNYK1piFnKOkvcnMG9gBnmIwEb1Efc3mrAlP+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4PllXCQ+FmuK2JXPzop8Seem16MYlsrBaoKHpUxyvM=;
 b=lQvJi7OaWw7di55d6JttDYNkzOXTMf4H2PsfPPxlg8arokrOWLLAuw2rON62npcsy3sJxDOVYOw/zyWhbuVj8y7mwIO25fGc0wHjSUP8p6+JBeIyjDEUWcqNGBHbthui0xBE5nMq55kHSzcr/fH2prE6ESfpBDNK6VpLk0/tVgNt6ml59Vd1nLotteqnEnE4LaO/buVmlVGXjBo3XrUvcUXY7qY5wyBMuHqHxKsfAv6wBIWdVwUlk1W+oFIO9ibOmwIhlqGG2WMfG0vPCb2pHeknWtrbinZB33kyHOJu2C53AdM/rsQlxiWH6e/4Bl2VS83M1AfAkUthFgERWfUlNw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB8636.apcprd03.prod.outlook.com (2603:1096:101:232::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 03:00:17 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 03:00:17 +0000
Message-ID: <86ae1163-1507-4b4f-8d21-87fd2492a833@amlogic.com>
Date: Mon, 14 Sep 2026 11:00:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] soc: amlogic: clk-measure: Add support for more
 SoCs
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org,
 conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
 <20260911-more-socs-to-support-clk_measure-v1-3-940e269aa52f@amlogic.com>
 <20260911083742.9C6621F000FF@smtp.kernel.org>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20260911083742.9C6621F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P286CA0113.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::8) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 636e3c3d-d848-4f1b-9c46-08df120c4e0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|4143699003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	gHa5ZEL66/Iz0m4TDtkX7cKjfmbGdsiuFqcKS/JDwe+/L6SRshorPgWTIbJIO65tjcFoyWaXm/wV+IZvz4XGtgf4RgEQn/huN7N7N3N9DAYmfkGXQ/YiHpoCo8dx7YWhAXBWe/dn1Embc1RLnwRqY9bTcEhNWzY/c+AWwfuDB2ezhcozTTgja9RgD2Sy4ZqDeCye+/hPkYnkaeZTgw2jH6wgniLOcWZSxxOcLYZdftAwMxkb85/7va0bA/Mz5BLmZWzOHOr7OnPW3bWX0/cf7RiJDDyZAjISijN02maz6pIGyxVFMgwCdXrkLeQoJYEhWzBY6xBbJBs/hP3r7G8ggqomLUD8fpjbzDD4hRz/KppilPAeNFzn5XJh4bhixAO31XQhpwxDOoftB/i6wZ5ReY0wmwlKD/Tr3dqTDwVGi8jhPAGVOR2iJYOt2TKhYF1N7X8ZqifDzZep2Vzl8HPALsTkOP/sRrqMPQjEzQQoQdi+aXr+P4pLuGXzFCot3C46VPk6LAtNzF73xJFN/x3ON/UTC9u11DU3fUv/ktxNvaGMEQf46r065zlTVAze/UYhaKGyN3aW+KocsfVhMSiFiUqZVrXEGwgHGd0NDjTaiuo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWtEOEFwTWhzczc3aXNUcVFTSEpJK1pubktHc3hkakI4dkV6Rkt5bGliWE9Z?=
 =?utf-8?B?Slh1YlNWOEoxVmlVMlBJRURPQWRCdENIT0FjZDVmSVMzQURaeVM2VjFKeklu?=
 =?utf-8?B?cmIrcEQvWlFkdmlTVHRra2dvcVhtMUlNSFpULzZlZjdSWXFwUlNMUFBYa0Y1?=
 =?utf-8?B?dG4vaHRYZ2ZkNUpkWDVveGZLOGltMDV2QU44dHdRY0dFNU1MNVlNUithNm5k?=
 =?utf-8?B?MS9MOC9VTjBmdDZsWkg0QjB3K0Q0RXhZczNsS3pIVWR0a1VlbXI5NGhEQXVj?=
 =?utf-8?B?N3d1dEJOVzB6RXVrTHFWR3AwbmNCVnUyQjRLL251dE1lK3ZhclQwMnZ1OGdl?=
 =?utf-8?B?YkpBOENkbndFTXN6NHNVVXR5ajFYTkwwQzg5VnhFL01HTlpqTktrZ3lVWE1r?=
 =?utf-8?B?VXNtT0hBUTF0ZTZDaDdzMnZKai94bnNaM0JyaUhDQU13T244djNMK0JCMmlo?=
 =?utf-8?B?YnFtc0hpSlZrYWwxcHVlRkFBU0kwMWFwbVFWSXgyNWkxK2ZOMXF3bE9FV2hs?=
 =?utf-8?B?Q1pmaFNITGZySzR1cS94MkR1NE9SdmppVnp5L3BuWmpSS0d0d285cjZLUjdX?=
 =?utf-8?B?bEs1eTJ3WmIwM0lLZVljWDZpUy80UXY4aXEzU2NFd3pmd1o3T1dseUh4elhr?=
 =?utf-8?B?ZjQrYWNlM3FzK0JuZ2hYaVpaRDUzZnFuNkdPYWFXQTJJdUp1SjRhT3ZmZmFr?=
 =?utf-8?B?TGx3aG8xUHQ0aitzMFdkVGN0VzZQbmdJdTdIMllDTEdQUGp4UEJOSWFEYXRa?=
 =?utf-8?B?TkE0aDgzdXM4ZmtTdHlvdW5nMUdwZGFocEtHVGo5bWxHd013MWdvcXRYTHQ4?=
 =?utf-8?B?WEd1TDRnV2R1TCtpaWVlamhzdzQ4QmdaUlNMVmVnUXZ5eG81OW44SGlIRVZq?=
 =?utf-8?B?NmZPbjhacGZRZ1RVWVBqTS9acVY1ZXpDcVhZTC9RYndtZGNRQ3E0ZndkdHlX?=
 =?utf-8?B?NGFJc2U3WmFMWDNRSk1reGJlc0ZJYVgrUlBFdnN4U1lmUEVvckpNK1BCTFh4?=
 =?utf-8?B?Q1N4b1J2dytQL0VKTkJEN0xqL1lxVzNMWmRab1RRR2xEWlNSRjNqRHN5N2VH?=
 =?utf-8?B?OERSTlVtMzR6a1RMS05wbGp2TDVBSWcvR1QwTDYxMDdkZWI1NGVrenAyVmlI?=
 =?utf-8?B?d1RrYjR4WWo1cHA5bDhVWktJWVBwL0VwNDJ2cExBeVdSRnFpSTRLSWtRRWor?=
 =?utf-8?B?bFNDdVZCZjl6UmdwdzQ3RURORUwza0Ntc3NwdFJZZlhBeFVxaHVlVXZhMUJ6?=
 =?utf-8?B?QW5maDk4L0ZTTUQwd0gwQ1JORE9EekNrUUhXZEZtMG1nQkNSeTN3MFdkUVBr?=
 =?utf-8?B?RnNNZ2xWVCsySU1HcTF0MkhLcG40bTAvL1NJWEhhb2RlUHd5NFNLc2FHT0JP?=
 =?utf-8?B?TkZqd0lVc0ZqZmV6TjU2ZlQzckd2NHgrV1lyMWVRZmMzRkM3QmhJRXZuU3ZD?=
 =?utf-8?B?RTJKOVpDckxBb3lINkhFclQxUGxFWFVkTWlodi9tdXc5Yi9CZG8yQkdUZHRv?=
 =?utf-8?B?eDZqNDkva0QxeHQ4RHZ6TEtLWS9PWjNocXdCL0tQTFdlU2FwdVcwMEwxeUF1?=
 =?utf-8?B?SHpCc215V2JoNEpyM0NQSUJlcVIzaG5aV0lJWkpkcXFsZXVsOWZ3QnRUVS9o?=
 =?utf-8?B?OFRnai9HMEY1KzVZN01ZYnR2MHJRb2dqWll5Z1NUWCt3TXZjU3J2TVhhTTRp?=
 =?utf-8?B?cFNrQmFoTEU4VFRBOWFjY014MmN5dzRoeVpKdUFJYjNNb3dQSkViUUwrcUF5?=
 =?utf-8?B?U0JRUTkxbXJaQ2pITk9STm1QRk5oTTFSTkUrYlQ3SXBRbFR2NGhoNjFCWHlE?=
 =?utf-8?B?RXFBblFHWXVEd3k3VVBpdkI5QnZYRU8zSGFpS2loTTI4TzZHSDFETVEvTGxa?=
 =?utf-8?B?WkoxcENNWHBPNjBCRlFKUWpwbWlqUXRtT2RkTFFVUVR4UVdxLzFxRG1KUzlF?=
 =?utf-8?B?RUhtNVZ0b0RxdDFIcS9RZ0I5SjhhV2lBY1IrQ0l4dXIyQ2NTZ29lRmZnQ0hS?=
 =?utf-8?B?dlBxZFpyMkRTZnpGNmRpWk4yOWYvT2ZWT0pMTHBvUjNwWXB4a0wxQU5pa0ZG?=
 =?utf-8?B?dncrOXN6K2EzS0p0TmkvOGJuWG5qeHJDa1AzVkppSC9LUXZCYWFZUFM2aUpz?=
 =?utf-8?B?VkRvclhIaHZKYWxOQVMzWFY5UDQvdFBtcy9IN3JHV250elNlU0lwQmJmYjBW?=
 =?utf-8?B?ck5PTlVRZElWeXBMaDl6aU1mMHdXUExzWStBNTBpc2ZZSmJseHlsK1FzM1Zs?=
 =?utf-8?B?THNSOGRaWEtTcm5pOVVXYkkyNXJmTFM0ZDg1a3M3YVNnbTMzLzZrbWhjQmxP?=
 =?utf-8?B?djJ1WVJlS2NMeFE3SGE4WkNMUWR3QkRjOHB2UWorTXkvTUh3M0xDQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636e3c3d-d848-4f1b-9c46-08df120c4e0e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 03:00:17.0171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PI4UdZnBWhPyZ6SzCG/Z58bD5hLLV8C29pTmJxKKcWK9CSY0bvR8XppBnNd0EqHAz6NQ2wXA2GTmSHRJdZblRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8636



On 9/11/2026 4:37 PM, sashiko-bot@kernel.org wrote:
> [你通常不会收到来自 sashiko-bot@kernel.org 的电子邮件。请访问 https://aka.ms/LearnAboutSenderIdentification，以了解这一点为什么很重要]
> 
> [ EXTERNAL EMAIL ]
> 
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] The `clk_msr_a9` array is missing the `const` qualifier, causing it to be placed in the modifiable `.data` section instead of the read-only `.rodata` section.
> - [Low] Possible typo in the clock name "exit_Tsin_B_CLK_IN" for ID 26 in the `clk_msr_a9` array.
> --
> 
> commit f03ec42ca0d7092f88d23ba06d4bfb38fc33ede1
> Author: Chuan Liu <chuan.liu@amlogic.com>
> 
> soc: amlogic: clk-measure: Add support for more SoCs
> 
> This commit adds clk-measure driver support for several Amlogic SoCs
> including A5, A4, S7, S7D, S6, and A9.
> 
>> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
>> index 0d4ba2555d175..671e0c3753dec 100644
>> --- a/drivers/soc/amlogic/meson-clk-measure.c
>> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> [ ... ]
>> @@ -1041,6 +1041,843 @@ static const struct meson_msr_id clk_msr_t7[] = {
> [ ... ]
>> +static struct meson_msr_id clk_msr_a9[] = {
> 
> [Severity: Low]
> Is the missing const qualifier here intentional? Without const, this array is
> placed in the modifiable data section instead of the read-only rodata section,
> increasing the mutable memory footprint.
> 
> Other clock ID tables introduced in this patch, such as clk_msr_a5 and
> clk_msr_s7, are properly defined as static const struct meson_msr_id. Because
> the driver only copies the elements from these arrays during device probe,
> the original template array does not need to be mutable.
> 

I'll add "const" in V2.

>> +     CLK_MSR_ID(0,  "sys_clk"),
>> +     CLK_MSR_ID(1,  "axi_clk"),
> [ ... ]
>> +     CLK_MSR_ID(24, "ddr_dpll_pt_clk"),
>> +     CLK_MSR_ID(25, "mod_Tsin_A_CLK_IN"),
>> +     CLK_MSR_ID(26, "exit_Tsin_B_CLK_IN"),
> 
> [Severity: Low]
> Does this string contain a typo? The name "exit_Tsin_B_CLK_IN" is exported to
> userspace via debugfs.
> 
> In similar SoC definitions like clk_msr_s6, the corresponding ID 26 is named
> "ext_Tsin_B_CLK_IN", likely standing for external. Using "exit" here instead
> of "ext" could confuse users or break userspace scripts expecting consistent
> naming across SoCs.
> 

and rename "exit_Tsin_B_CLK_IN" to "ext_Tsin_B_CLK_IN".

>> +     CLK_MSR_ID(27, "u3p2pll1_0_clk_div16"),
> [ ... ]
> 
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com?part=3

-- 
Best regards,
Chuan

