Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011034.outbound.protection.outlook.com [40.107.208.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E97C3AAF7D
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 15:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340018; cv=fail; b=o+ZqFSwYd5bgTSE8ppCRJJI/hCsjeeiEySU1qiAEWgGGSrVVY0B8aUeEtmfivQGxnKl1WqEkLs8ZLYo3QnNiZ8nOwDX0invMGAOvaEhRu9TCrGmNwy0RR8LJI51CicYwBjEa9tkkMUS7TZdzm5Bw63Yy2h4VIszbhDj/wedeZKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340018; c=relaxed/simple;
	bh=KmTdBItS9PwjQbffHclazoFzlfYvXKEG3lYGlIu9sVs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oKE/YBa6aAxxjLYxrcPAt3rRRncO9MbVVVzrnWwIjkyhgrPBF035GWCSHFfsisixaQqG4BZXk+HQQICneFQ05fitv4ekhz2KIgBzKJ3Ng7+TPi0iK34+FjsKgDGT3s67qnJrndzmsraDehlWp93bDX8VffcfxYT4f/zzR7udrww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O6qxhTi1; arc=fail smtp.client-ip=40.107.208.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O6qxhTi1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKxt8m2dtwXJLMgYJcV3iqMqWwTBwEhlE0w7JuXpaBUkD9g5Q5DWvdmtNTCm6cp9czix5R78TXhwSmOXz5E+wfrm/mJWccTTMESWl6XCb6qDLzOMvt9pSNVe7UwD+VUVFssdQUsAAEIuZtD2jn0r++BQPp3SrOGBGxWxN+8GXCKrYdbB6FqIDSVNvhkZE+RIKz+T2kXAPmZeOY7yCNAhdsBdWYzpjzEkPYR6wB7QtTHfvq/WAKRwNPGamCWnnqSh7JtZQAxO6Lv6BH/VcTvb7JZIAjlAzIZEiQKITca7KxKjHZd0Lk1PqbjuUWjHDjzCYAbj+z7bgXGXZaZ0ehHTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QXN8waYKgNpw926+8SAbZpQ66qe/JU7hqffTKP7hD0=;
 b=ZLexsySPEd1zf27cjhllmXY48UvIoajq0eugDwHB3xxnaO4ADsTdvhfHUm90aTGWPg7k+MeK2EaipsHCpOylJV+y+q1KQLvJZLko/JqEovmnWTe+rSPLEqZrnlQZjSSn4b1zoQ5JrF7gSoV9RtN6f58XVmCa9xg+7HSH5Ykima7Tn5yfbyKBcqsNtq9jfOIHwD/+LZkljGLTwg9EQhulrXJRmmnZqnXAf9sdx/40kt8La+qicIJuDuarFz+N7jjTA+/Ha2rBOfejAJELlxvjkGhKlQgbxBwsLLctroxZ+lhAE/R4iXSmP2npV9RqLUmMSZbD+bE3uDycfQ57l5n4IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QXN8waYKgNpw926+8SAbZpQ66qe/JU7hqffTKP7hD0=;
 b=O6qxhTi19KJmkfUX/7QU1IJBs37kIYgMixOndp0LVaX2jb8Ohq4eLOr/UD3sLTRyh1TdtAtHDEwD9F0l5IQU/QQxla6SgCCmai1TsRiwOJnMIWtwpDqYEhHLWTdfkUgXjH8z5nd4W+qCd6agMEo85heA19yNjpN+p33gfDMT8HU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by DS4PR12MB9820.namprd12.prod.outlook.com (2603:10b6:8:2a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 15:46:52 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 15:46:51 +0000
Message-ID: <f30b3b94-b6e9-42a9-a780-d680916eef4d@amd.com>
Date: Wed, 29 Jul 2026 21:16:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] clk: clocking-wizard: Do not map the memory for
 static-config
To: sashiko-reviews@lists.linux.dev,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
 <20260709111403.1579159-3-shubhrajyoti.datta@amd.com>
 <20260709112803.424C81F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Datta, Shubhrajyoti" <shubhraj@amd.com>
In-Reply-To: <20260709112803.424C81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0076.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26b::7) To LV5PR12MB9828.namprd12.prod.outlook.com
 (2603:10b6:408:304::19)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9828:EE_|DS4PR12MB9820:EE_
X-MS-Office365-Filtering-Correlation-Id: e8098ac5-9ee3-4ee1-b583-08deed889bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|4143699003|56012099006|10067099003|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	A/0BlbC4T4QuEv+lQ9G4etx1Xqf1On8vpS9KlQMcIv51SW0m5YOqZOdkKdPOSY7fSv5jLZ+lvQABCWiDbh/F5euJUSe1au1BpPtqzgaE47zRNLJbn8Tknk1gnkurk7aZMhgTu+70KTIf3w61GZuERiPgu44WCLgfTStcu+RN6lq7kQW1Zu9NOKG0eseH07rCcGCNX8KeTZfzbSeotRAq2kM9IPkmFEAAbJho5BNf283NntBONhuhY/9PAqWgrTo/zcsAm+tCvwx69E/1FDxxYUQhYwegdLWkvm0i5KWWNAPC181MT69dMXBNt6HG0zuKkf6DuNNeewGaNQT6qNTkZ4yt1Ia3GmoSyB6qz59dk4lHay/PQGr1I1aooKY5fvAZOf9cWTyUizMlYmlPQripnJ3Cd9AnjE8gfhPkPSGT7it7tLw+BNNQ5N/TSxjZTfCREWLrxZIVz4pbH/dBhf2sAxYYxKCUrTzl3upS4qTIyIbN4gsaw42/26uekysTFUWiJprIt85YA/BNn9DleBLt2yWAhun2By430FD+cSinIu6CyUGCEZEQqyvt1T7VCXXhkJH8vfJ65nqwdE7jPjx7d6G6U3311DZ5sMQ7Qza32XM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUVtTVM0VmpzdjlSMUVzWjB1OGpmaHpMU3V5MHIrRVR6N2wzcWFMM0dSemZr?=
 =?utf-8?B?UG02VlBZZFloV1krMm9Cdi9Dd2dZR01DcFR1UGJLRmtESm93Y1VESDdZT3Zk?=
 =?utf-8?B?VmdGSVBxckJHTzBuWkRFSm91V1J3UkpZWnFqY293ajRra2ZZS0RJYUJjMlNz?=
 =?utf-8?B?aXNPYmkxaE5LNG8xb2tJYm1od0hYLzF6YTJwVElzQ1BVWHVxaWdhd0lVT2hs?=
 =?utf-8?B?dDdEdFJsZ2FGOFhhbUpxNlUxeW5XN2huQlQ1dUNhUVo4KytYMFBLSzBUMXRl?=
 =?utf-8?B?YmE4WGJUZGZ6MG0xd2JUTk81ZjZ3cHJJYlNyWGZJNExibTd4SlNoUXZXa1lk?=
 =?utf-8?B?MnpNUHVHUm9rSzBwTitQa0lLS0pCNVRUbld4VHV2SWpBVEhScFVwa0dSdHFm?=
 =?utf-8?B?a21kZGMvTFZSUUM5V2pJdkhxSDdrQXdQTkVGL0NzSGVBU0lZRVZGcmR2VnpF?=
 =?utf-8?B?NEFaYzJHUlkyMjB6SHVrTFhJZmlSSlpXOGdST0pOS1RHNXIzWlg5bm10TlNo?=
 =?utf-8?B?akJ5RkU0WmxGVURmQW9ibDV3VGt1a1lKU3k5NkkyQzkvNFg0Y2ZrMC91a2Zx?=
 =?utf-8?B?bWZROHYxZHZsRlZrTjZIVFg1LzEvL2J5MytCMWFGeGVyVDl0RGczMEY3a3Jv?=
 =?utf-8?B?Yk1Jc1k4U21GdHdFa0hlK2FKWWJwTGpGRUNDd2FUYTNIQUk4d2lPajN5dmM3?=
 =?utf-8?B?V0VhdzNjQ25lNXR1V1daM1NZTEg5ZkdJbUxxTDQ3aWJVT2s0SXRnRkVEWW93?=
 =?utf-8?B?dU1STEZHYjJUdEhJSUsrcDQzQ2tuWGtrQmtTNDdxRGRic2RyWTNlVlJZUjVX?=
 =?utf-8?B?UVVjenk3VEdjbHhmVUpkYkFTd3JLTmpnTWNaUXNXUTdCUFVJUjM5MnlsNTRm?=
 =?utf-8?B?eWlZTWFQYnNyQXNvQUFCMVl6d3U3Q3k3b1ZLZnFxbC9ETFFsU24xaUxmZTFS?=
 =?utf-8?B?aDRGYzNLNzJBd0d4MjZGRHdhelY5MXZOdC82UXlwTUQ3Z25sMXV5UmhycWFi?=
 =?utf-8?B?YSsvdURXRFV4QkxyUHZENEtGbFVKdmlJUHh1Sk9XOEUreVlpMkhRT2tzQUZN?=
 =?utf-8?B?djV5V2xxMlpRbUhJTC9hVCtPRjljTVhKcUdYbTlidzljam40aFQ0V3YyQXNp?=
 =?utf-8?B?Tkc5dHF2ZDRxSDQvZjhoY3N2VWZ1bzdnUkliWnJZUGxSMTN1SlFQVnJSN08z?=
 =?utf-8?B?N0tuVkFlQzNJMzU4cEE0YktrV2NNb01tOHp0a3hnOUc1NWx5RktuT25PYS9M?=
 =?utf-8?B?NmdKN1ZKNUhZdnlReVhxQkNjMXdENlhTU2ljUE5xTGJYcTk5QWJKK2hOWXB4?=
 =?utf-8?B?Y0sxazFaeEh0TWRzWHo0SDhtYmZzN0tIbG9jOVkwejI2cUpKamNXL3BKWXl1?=
 =?utf-8?B?bXRNQjZJWktINjZrNy82eHdHV20vbFI1M2trMk44L0t4eU9tVVFYZHgwQWM3?=
 =?utf-8?B?VWYzS0MwR0p4bWtrOVJkZ2RMaUpSNTVaYTkwNkZwdFNkQjRXYzNqejBKd3Ay?=
 =?utf-8?B?dlBGSnJtejhpN2VFUWgrZ1FjVGwwZitHVDY0Q3FxckZUSjFPVTV0OW5QWlR2?=
 =?utf-8?B?eXM3RmR0NmsxaGRvSG8wZlljamgzQzA4T0ExMDlZSHlLQlZHZzNkMmkwLzVM?=
 =?utf-8?B?eHpPVkROVER2MVVXK0paTVROVS8yTlNNNWNVbExFcVR4cHBENGd1akhveGxu?=
 =?utf-8?B?YzJ6eTVZZnk3SDBabXFwcHNiQzhYQTVlbCtMSExhNk9nOXE3MG1XMitEYzRr?=
 =?utf-8?B?N0JnTWx5dUJWY2NOY1hxRHcrMC9TTHVzNlJ1bCtObDB6RWtadFpxRlZ6VDk4?=
 =?utf-8?B?d1YwODFkeE9qamlSYnppOHlZalMxZGZzb1R0eTJ0VDR4TUpDOFN6ekJMb0Zq?=
 =?utf-8?B?REs5aWtyNE4rQy9RNkZpMXprdWN4SjRCNFpacjg0MVZKeWRxSHlzSnBhekhw?=
 =?utf-8?B?SjFwdVpXNTZobFRaTk5QbnN1N3lkcE9JYnNwcHVHYTdJUmdyejEvTEczUzYz?=
 =?utf-8?B?eitvaGh4QnlBNXhKemt4NFdXdysxK0QyRExTY2k4a0lLMWRiK09ZcldYc2w0?=
 =?utf-8?B?TXVQQnh0OGRSem9waFZKMHRDSkpsNHNZd1Q2UktJOXUvNkc1bVk1WnVUeHRX?=
 =?utf-8?B?Mm16TmF5QkxIQmpVRXIrV1FvbUphdHcycGtYZHFzMSs3WHB2cnZWckNwaFMy?=
 =?utf-8?B?bVRFWWdnYVRhN0ZDTW4xU3RCL21OYzZDcjMxaWZPL2h3TW0rajQrc2F1Qk82?=
 =?utf-8?B?WW14bXhLVHJOVStxMCt1Nmd1c1lDaWZLdVk2K1VkVzkrZzMzc01MWVduQnRo?=
 =?utf-8?B?aWxvekt0RlJWYXQ3Vlk2NlhGc3ZiWWtuVUtoTHJuS3hKN1RDZGNKdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8098ac5-9ee3-4ee1-b583-08deed889bc7
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9828.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 15:46:51.8969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TSipG7JAMbCy/0uZKST1ZX/9Je4r8UjSY5umMUQuMMpvNBnppojDr8snUm2pqC/MFZh8UOrciSkuhkcRPcDqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9820



On 7/9/2026 4:58 PM, sashiko-bot@kernel.org wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Unconditional fetch of `s_axi_aclk` causes probe failure in static-config mode.
> - [High] The driver completely skips clock and provider registration in static-config mode.
> - [High] Notifier chain linked list corruption due to registering the same `struct notifier_block` twice.
> --
>
> --- Patch [2]: [PATCH v2 2/8] clk: clocking-wizard: Do not map the memory for static-config ---
> commit 0264def41bcae176c3fa735b3a9b2da6412f451c
> Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>
> clk: clocking-wizard: Do not map the memory for static-config
>
> With xlnx,static-config the MMCM/PLL topology is fixed at synthesis time
> and no register programming is performed; only the dynamic path needs
> the AXI register block. Move devm_platform_ioremap_resource() under the
> non-static-config branch.
>
>> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
>> index 4a0136349f71a..e082051221bef 100644
>> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
>> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
>> @@ -1168,10 +1168,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
>>                return -ENOMEM;
>>        platform_set_drvdata(pdev, clk_wzrd);
>>
>> -     clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
>> -     if (IS_ERR(clk_wzrd->base))
>> -             return PTR_ERR(clk_wzrd->base);
>> -
>>        clk_wzrd->axi_clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
>>        if (IS_ERR(clk_wzrd->axi_clk))
>>                return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
> [Severity: High]
> This isn't a bug introduced by this patch, but since the static-config device
> tree bindings explicitly make the s_axi_aclk clock optional (because the bus
> interface is unused), doesn't this unconditional call to devm_clk_get_enabled()
> cause the probe to fail with -ENOENT if the clock is legitimately missing?
This is fixed in later in the series

[PATCH v2 5/8] clk: clocking-wizard: Skip s_axi_aclk for static-config - 
Shubhrajyoti Datta <https://lore.kernel.org/all/20260709111403.1579159-6-shubhrajyoti.datta@amd.com/>


>
>> @@ -1183,6 +1179,10 @@ static int clk_wzrd_probe(struct platform_device *pdev)
>>        }
>>
>>        if (!of_property_present(np, "xlnx,static-config")) {
>> +             clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
>> +             if (IS_ERR(clk_wzrd->base))
>> +                     return PTR_ERR(clk_wzrd->base);
>> +
> [Severity: High]
> This is a pre-existing issue, but by putting all the provider registration logic
> inside this non-static-config block, doesn't the driver completely bypass
> registering any output clocks when in static-config mode?
>
> If clk_wzrd_register_output_clocks() and devm_of_clk_add_hw_provider() are
> skipped entirely, won't consumer devices depending on this provider hang
> indefinitely with -EPROBE_DEFER?
[PATCH v2 4/8] clk: clocking-wizard: Add static-config clock provider 
support - Shubhrajyoti Datta 
<https://lore.kernel.org/all/20260709111403.1579159-5-shubhrajyoti.datta@amd.com/>
Will address it later in the series
>
> [ ... ]
>
>>                if (clk_wzrd->speed_grade) {
>>                        clk_wzrd->nb.notifier_call = clk_wzrd_clk_notifier;
>>
>>                        ret = devm_clk_notifier_register(&pdev->dev, clk_wzrd->clk_in1,
>>                                                         &clk_wzrd->nb);
>>                        if (ret)
>>                                dev_warn(&pdev->dev,
>>                                         "unable to register clock notifier\n");
>>
>>                        ret = devm_clk_notifier_register(&pdev->dev, clk_wzrd->axi_clk,
>>                                                         &clk_wzrd->nb);
> [Severity: High]
> This is a pre-existing issue, but does calling devm_clk_notifier_register() for
> both clk_in1 and axi_clk using the exact same struct notifier_block instance
> (&clk_wzrd->nb) cause notifier chain corruption?
>
> Since the notifier_block contains a next pointer that gets overwritten when
> linked into a second chain, won't this splice the clk_in1 and axi_clk notifier
> chains together and cause list corruption or use-after-free during clock rate
> changes?
Tried to fix it
[PATCH v2 8/8] clk: clocking-wizard: Use separate notifier_block for 
each clock - Shubhrajyoti Datta 
<https://lore.kernel.org/all/20260709111403.1579159-9-shubhrajyoti.datta@amd.com/>

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260709111403.1579159-1-shubhrajyoti.datta@amd.com?part=2

