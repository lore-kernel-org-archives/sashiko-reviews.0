Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022103.outbound.protection.outlook.com [52.101.126.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB0A388885
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 07:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321565; cv=fail; b=RD6R0AwL/PIsV4YZFM/DFOE2T0HaQXsEcxSyPlTn3ESEABjdB/vCM5GwxBnKOaX8wVM3moWmBLAAvbR1zGv8mDuCy1XPd3p/hO4mZoZJ2vYYmxDCLObmjNRVpBF9Sn0VFAPO2GocPBltXGOTFbyRPajFovqJQ/vUNxVz7S+vGHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321565; c=relaxed/simple;
	bh=cbGjEqGA8fZ4wgbU86Qcui2jx7Sb1qHEFpTqjc2+sAc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ioT35cGtgnjEp+KxGq2N2Z73bDusV2GFwpDQiOl1WJaV5y57M9eUO8fdkm8ZUw7i9SDqpHKrey5qRQzXSGygTzFYKOi2j+idFTfR8yhf07m2WoyJTGp5X5/tNkM990s5LdAoIIvr+WzzIhzB8Y3cDMbHRzC1JfDJeUwv88DEf+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=yukHelHK; arc=fail smtp.client-ip=52.101.126.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="yukHelHK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bc2p8ltyDSkc1Ez1npT7I21IBzu00K1lf7mNFHXlBPTy56WUgfwn+ktTTj491Dt1GyPBrs1ivbQkfejWFRuSSpiQaNzlKLABdjFQUyv5se5iXeaomUOPoGZAyiGzuGI8KOfMNeCZE+Y6gXkdrongwvwgHQOSJVfYBpugprwiGL2IbuN5XQY/VRWr/KuUhNyiszkF+g/L4he7RUqW9tDfPv6ARPXZop7A+fPudkyVwnTFzD+OLIEJQqpA1lgo56c8QWidArNPXD8s7iPmndMaTue42OsLWjKDLE/4GT1Ja6yFD8Dv1RBlRA8ZwkuY1Vxh/KqkKrCjun8UjNV4upOX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FABaG6hS05jrItrgGnaNXCAC7ghSeK8Qg49T89BlTM=;
 b=PwogVv6jnn9BRJotrYroMudab8NyUnEyu8IHtHJxB+rzWITVAn2Qgq5HVkYf62t2gJ9gkvEyoszu2QhXewrVPrsGaYhyofwP8ZOp4M1WYSwltftJcIlOjfpgSCea7YXq8GY6oP+cdQ3nAgXHOp8ZBUZLZVLVdYbpi+yQlhi/ZS6sl0Er7xjkRbLNNf1EboG0iFAYKFt68ZLawWKW34D5R2iVCI/WDxi6ixXWSy17Jx8u+UuupiJs+CrtchRwu+2+0ofObcWJuMyueyn3h0jjN81fKME6Q8PnBFbNmZrvi4wOi/VvVeV4amTqs1O41/yA/NpAbx609o7eomp4fOTrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FABaG6hS05jrItrgGnaNXCAC7ghSeK8Qg49T89BlTM=;
 b=yukHelHKt1prENq+k9NnrqU9thb5sXPAbqqL6LHsEodc7SGBqB2WNGv3JsqShphmUW1S81OGYHJ4FyhdRfybTh7PLyAAia9+1X1p5v1xKS8w3lQufdWXjNcd00D+gB9R9W24/nZ7nXT3XgFitEy8nFKZIZ/6cuk7JpCyF3fV7xTxicx2OUI5nzZTCt3dLdYrGX+dixfkhzfWeZNgJyVGdoPC65A/6nKoy/d7dlXIPiVFSgCy6FNRrVKnAfORMuVHnuyuyE5jpZ/BiBnAcPYme1zhpEXunxDoI1hcBxuwU8jyg0hfILR290IXVVc7mCVpRGwHb4qeE1t/NSTIVOWPIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by PUZPR03MB7061.apcprd03.prod.outlook.com (2603:1096:301:114::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Mon, 6 Jul 2026
 07:05:49 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 07:05:49 +0000
Message-ID: <a28dbf0c-4692-4baf-9958-56bd4d78e669@amlogic.com>
Date: Mon, 6 Jul 2026 15:05:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: amlogic: clk-measure: Mark the clock measure table
 as __initconst
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
References: <20260706-clkmsr_optimization-v1-1-70f5aae6e60b@amlogic.com>
 <20260706054342.C738F1F000E9@smtp.kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20260706054342.C738F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|PUZPR03MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c297e8-b408-43a2-3004-08dedb2d022d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|56012099006|11063799006|4143699003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+qmPXL95zMq2JQ0xqjL3uzVPbdhr9NXzhRf7jUWiE2k0fUCDCP66zvNaApuxaz6+pDuA/qV8Oyv1HhzmFzBk29XysoY0NFPxFEEo9AcSz+Zxl8T1Y2pgwRNNBkk2FOFKltBNVAaZtPljUwU8uAuhLCdouHiY2Ep4Cr92YG1SINJkZ9MiP0Gdd54O8hrQRN/TuPrnr2phKzz0H+/67M/Ab1k9HcnXdvC4E0XqdhrUxDmrbA0S9wDqLkkp8oq2OwV4n6p8mqu4JUnY9Q4OtZHHbQLxw747SZHLCWcEVMN9rbuyzBjHQ6MfWqPUp357Vbe171JW1iDO7E+X4iV/NvKr0fdgSsBOjdxCbvzQiOhtdXSYCrUQRWhcnN85inQLSuMIXM47+eHOSjNVC5XJjaBng9nc15KGB0PT9R3WmiRtmYpx5TQGM+FSmMkxb2MAHA22eLQn2p2WJUBXl/uXLof0SXkovMKPKFfQx58agbshfvTg/BQSdiEK+MtUz7SVwyoD18PimY4WxaYoIaKljoGkUq9XqPcKxW/k0JDmcOd6YmYoIc1oHcwnLkmCl4KcU1/iBn/FzLUhHPgyDDaivsWID6rAWAgXi+bPt8NwY/S0xn0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW02cTBKczhoSnJJMy85akE5ekdnYTlac1kzVU40M2VKbEFUei9WTlJDWFJN?=
 =?utf-8?B?Q2FWTm5ndkIvTG5RUWw0T2d6NDUrK0RNMkp1OStrc01kb1AvQUhDR2FTU01l?=
 =?utf-8?B?eE5OQmowUU9VT0cwUlZaeVRQUzFnZ0FHVWdTWFZnc2ZHMGlLSisrNTAwUzFj?=
 =?utf-8?B?WWFYNGlSYXpqTVluM2EzYmFvMmtFRzdGZmF2TzhDZnZFTktJejlyQ0M3VDE0?=
 =?utf-8?B?VXorKytsMW9rVXRFWm5Fa3lycFFrOEdIUGM4TGJJZDlLc3crUlgzMXVmTElv?=
 =?utf-8?B?b3BkSGRianI2eXNXM1hFanJnTnFVRlBwRHgra3hFVkVoSWVsaURhK3l4MXcw?=
 =?utf-8?B?dEVIcWZFSllSYlV0ZkhLSUhvNlR2VU5RY2tadWx0b1UrUzZzRU14dGJRT2dx?=
 =?utf-8?B?NStzSWQrRXRYbDByRmNTT2lac1gzVmJQNEZmRFpOQTNVajdnRjhQSTNWdmVj?=
 =?utf-8?B?VE5nNUZ3cWNUVk15ZmYvUjVSYVFvcURHTmNnSDNGWWIwTjV1OWtuOWxiYmZQ?=
 =?utf-8?B?YVk3Yy91MlArTXVuTUdZWmcwUGhaR2h4TDZ0cXhoR1VPbnFNNmNOMFJGQUNa?=
 =?utf-8?B?cktnY1ZGdXlNeVJZbkR6QkJ2ZjFIVkZyY2VaYXNsVmdNcFFkRFZjVCtYNy9k?=
 =?utf-8?B?M0J6L2xjRVpoUjlPaVlNb3dRT2E4SW90Zy9ERFJaSXIzTGg3U2pwNzF1bnl4?=
 =?utf-8?B?N0tDVTNqc05sMjJrT3c0VWU5RmFXbTdtK0g3bXJSR3phOHMzdWNDRUU4ZCtp?=
 =?utf-8?B?OE5tVEkzVi8vVXBYUVdzZDlzM245cVJDSERhMFJXbG1RV3NVQlAvamdpVTVP?=
 =?utf-8?B?MXkvTmRBK1VYRVBNWndLekFCd2hqbDJCSXN3OVV3OU9mamdmRVVHclplb3pX?=
 =?utf-8?B?V1djQ0JqSm5QanM1N3YzcGtjcmVJTFRiMkIvU1kzdU9HL2pSQllhMHRGNG9h?=
 =?utf-8?B?MjJyUHBrL2t1cXR4VUw2dklLQzd0SFVxNGZodWo1VWdDZDQyN0loaGFVWGdU?=
 =?utf-8?B?MHRQUU9HYnpibzRHQ1BycG1KakZaUWxsZDFWeUViZVp3THN3VW4zb2RlL1Z6?=
 =?utf-8?B?SFF4aXpKdk4wZlR3VXoxenZNTzdPdWJDS1dDOXlFbmltN1NCZW1YUUlIcUZi?=
 =?utf-8?B?dUZWelFPVTVLVTFmakQ5QldNUS8yemNOTEEzczVFSkQ5ZXMrQ0hMTWZkSzg2?=
 =?utf-8?B?QlFZT3RQWmMyRml2TDd5NGJydm1kZm9ZQnMxbW9TVHhpcGJWQ3piYkhoMWty?=
 =?utf-8?B?clpmcEx6YkhwZ20xTzJTeS9kakpqdlEvcDV0Vms5TElheXRjbVdBWEl6RTVS?=
 =?utf-8?B?bGFGSzNlTGhjMVRqaUtZYjdVVS92eTVkdXlqUWgxZW56ZTAvZGxhalVoa3g3?=
 =?utf-8?B?MUZaSDJpV0M2N01QcGhMc2pBYStqekxiTkVpWEdCRFVGbUZseXB5bWdBQ09B?=
 =?utf-8?B?cGttMHpHU0t6emx6b1BOUzRTK05PVmZEU0EvOWRzQ3Q1dnFuU2dxZmpjRjM3?=
 =?utf-8?B?SVpqWkdMRzUyYTJGUlZyRWdteVVLUUZkRGdDcldWYldLNlEvQmdtSlpHN3F4?=
 =?utf-8?B?dHJmVk5LTlArdlptbU1tN251TGdzQ3Q2ZWl2YlJLSnkrL0trNDkvbDd4c1Nn?=
 =?utf-8?B?QmJ2UXdtdFhUdlpsT2xTckw0bHU4SDdTY0pwREJKbi8vOXFhc2JlNUx2aGEz?=
 =?utf-8?B?Ukp3SHkzcVU5REVkdG9Ed0FiaG1IUE1hZXFZOTBXUzRWcjAwa0xMMHFLK1BC?=
 =?utf-8?B?OGMwelNOUkk1NU9QbVRNYjUzWXV6WnVaeFRiRGJVS0UrUDdobEpVOE9rMW0v?=
 =?utf-8?B?aFVzamdlQ2FjQlVTR2dydUdURkxtV2xlU0EybHNmeU8zNU1ZaWxJMHdkQ3Rp?=
 =?utf-8?B?Ymo0U0hNTGVUbGtRbllwVGRvQ3diSURzNHF4cXpITCs2alVybk9ycmZxQXZP?=
 =?utf-8?B?YVpMb3QvQTZyL2YwTEp1V0NZY0w2cDF4c3RmdzhUY2VoVHZGMllFMTFwbEE3?=
 =?utf-8?B?b1JXcURkUmdsYmxLNElsZ2ZjSHc0MjMvcjdkNmFPSzhtNjg0OUNQQWJuZWVF?=
 =?utf-8?B?c3doY3p4SjZ5c09yR3NITzJPeXRac0FhWUswRmZPUlN3MlQ3MHdDRnZaRnJK?=
 =?utf-8?B?THFvelVYZk5KQ3MrQThTQ2FSb0toQWFIcXVrV1duUWNYQVBzSmVTdlhaVVJq?=
 =?utf-8?B?QlEwaEtyQzZmV2RYeTlXTzVFRUVKeUVLaHdaSFI1VWFqMVlpOTZwU3F0amRJ?=
 =?utf-8?B?ZWVtRXRuUEc5MDArcjJTbkdrVnhCVFVzMU5zY1JOUGdmMTkrTVptWFFNaEgz?=
 =?utf-8?B?Vkh0cFhSNHg0ajNIQkcrdjZKMS9wLzZHOEdlUGhhUlVqT1FZWGExdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c297e8-b408-43a2-3004-08dedb2d022d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 07:05:49.1214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDwuDLjZOGm1+fOItaE53ZPEoIgedo2JsvGUkGpqR776tsHHZDtqMpyXqIEXS2R9tkLexGYxEbQak5IG6qkWDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7061

Hi Neil,


On 7/6/2026 1:43 PM, sashiko-bot@kernel.org wrote:
> [ EXTERNAL EMAIL ]
>
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> New issues:
> - [High] Marking `clk_msr_*` arrays as `__initconst` introduces a section mismatch and a use-after-free vulnerability.
>
> Pre-existing issues:
> - [High] The driver lacks a `.remove` callback to clean up debugfs files, leading to a use-after-free when the device is unbound.
> - [Medium] `clk_msr_summary_show` blindly assumes that the first entry (index 0) in the clock measure table is populated, which will cause a null pointer dereference if a table lacks an entry for ID 0.
> --
>
> commit a817a04ade20a00516808ca084a60df1513d5b20
> Author: Jian Hu <jian.hu@amlogic.com>
> soc: amlogic: clk-measure: Mark the clock measure table as __initconst
>
> The clock measure table is only used during initialization, and the
> table data is copied to the msr_table field of struct meson_msr_data.
> Mark it as __initconst so it can be freed after kernel initialization.
>
>> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
>> index 8c4f3cc8c8abf..e1cf67fad83cb 100644
>> --- a/drivers/soc/amlogic/meson-clk-measure.c
>> +++ b/drivers/soc/amlogic/meson-clk-measure.c
>> @@ -55,7 +55,7 @@ struct meson_msr {
>>   #define CLK_MSR_ID(__id, __name) \
>>        [__id] = {.id = __id, .name = __name,}
>>
>> -static const struct meson_msr_id clk_msr_m8[] = {
>> +static const struct meson_msr_id clk_msr_m8[] __initconst = {
> [Severity: High]
> Does marking this array as __initconst cause a use-after-free and a section
> mismatch?
>
> Because this driver is a regular platform_driver, it can be probed after boot
> due to deferred probing or manual sysfs bind. If probed after initialization,
> the memcpy() in meson_msr_probe() will read from freed init memory:


Please ignore this patch.

After taking another look, I realized that marking the data with 
__initconst is not correct,
since it is still referenced after the init section is discarded.

>
>          memcpy(priv->data.msr_table, match_data->msr_table,
>                 match_data->msr_count * sizeof(struct meson_msr_id));
>
> Additionally, this array is referenced by clk_msr_m8_data:
>
> static const struct meson_msr_data clk_msr_m8_data = {
>          .msr_table = (void *)clk_msr_m8,
> ...
>
> Since clk_msr_m8_data resides in .rodata, wouldn't pointing it to __initconst
> memory cause a linker section mismatch warning?
>
> [ ... ]
>
> [Severity: High]
> This is a pre-existing issue, but does this driver lack a .remove callback to
> clean up debugfs files, leading to a use-after-free on device unbind?
>
> In meson_msr_probe(), debugfs files are created and associated with memory
> allocated via devm_kcalloc():
>
>          root = debugfs_create_dir("meson-clk-msr", NULL);
>          clks = debugfs_create_dir("clks", root);
>
>          debugfs_create_file("measure_summary", 0444, root,
>                              priv->data.msr_table, &clk_msr_summary_fops);
>
> The driver lacks a .remove callback and does not use
> devm_add_action_or_reset() to clean up the debugfs directory:
>
> static struct platform_driver meson_msr_driver = {
>          .probe  = meson_msr_probe,
>          .driver = {
> ...
>
> If the device is unbound via sysfs, devres will automatically free
> priv->data.msr_table. Any subsequent read from the persistent debugfs files
> will dereference the freed memory. Should a cleanup mechanism be added?
>
> [Severity: Medium]
> This is a pre-existing issue, but does clk_msr_summary_show() blindly assume
> the first entry in the clock measure table is populated?
>
> Looking at clk_msr_summary_show():
>
>          struct meson_msr_id *msr_table = s->private;
>          unsigned int msr_count = msr_table->priv->data.msr_count;
>
> This immediately dereferences msr_table->priv. In meson_msr_probe(), the priv
> pointer is only assigned if the clock ID is defined (i.e., name is non-NULL).
> If a future SoC table were to omit an entry for ID 0, msr_table[0].priv would
> be NULL, causing a kernel panic here. Could this be made more robust against
> empty first entries?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260706-clkmsr_optimization-v1-1-70f5aae6e60b@amlogic.com?part=1
