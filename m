Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023115.outbound.protection.outlook.com [40.107.44.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA06A40B0E0
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 08:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027418; cv=fail; b=AuFYH4nZLIUzxAEp79+4/VyxE3M33cN7x+tfCCoDc9+E7StIhY/ATybjJCp2g4Ch7di9gFhPL4hDk1DDprcg4uyFOr/cNqPscfwMs4pWsE7evsdth+bxFTbRJ+Q0WC4cyW9HjIYAA+5H77DWGEDa+ME5t7RPJHLUgZ6Jn3KafiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027418; c=relaxed/simple;
	bh=9XYqgUL7+G9vVdHuezdLHZTaA2inclmEtXyTMofafdg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r1Gv0MpjNcUBYKmgDQRzNqAy2FKKAUxbXeB3QF7nYxf7JEVFGGAQHqwz2Q2ysWAxxHsHC5fj07so76w1rmwaV2OAlITGg6Lrb8/zR02Sfd/Zj907hKNEtuGl2G/wpRs8jqmlSVPRDmlyqAMpuR3l6CeOqlI2Fr+YniLn9NbHBMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=QgG4Yjlq; arc=fail smtp.client-ip=40.107.44.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="QgG4Yjlq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhI7q81BWuAzRU5727v+UtfzdPda7WgbC56xGdhfNsAJHrFFSEyY85Pl9uxSTrw0Hy9lihloZNyWNVqEjbt8Hn3w7HEsDu8YAfUwJMYYU0XFQDkZ5a1S5TgQyhvSuTycPu+T3e9/u61PkrZsQwRg2t89XtfbzDS0GfIPpAWbgDTUFO3RNI9HnRE7b+F+zNjHm7YqWUfcYv2nGw3OFmtLuRSOJp+DZeSq0FFNoCV6GYfOnIhRnpKFLfgTEr7rWLV0Wv/eH3s/SnQzjBzcIezpWE1O0Na1D5XLTJExb4xtFlkggeGq5gzemwWyiMdD0Fs1AjUM5mk2Ihk+gHeBSzpJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/r4amxtseGwCzAJqRpHnfpSRofe7mcBXg/uH1pnFDs=;
 b=EwqRIeFvwK4BEwVW/pabDwqAMBLTWdW2Q1jfcJwZyR3+Yp/YdYwDQpX13udbraTf7URxA74EQc2zPEMqVNLn4PUgmJ+jwh9xd+QQ0Kyghfs95T7fCVLwyZpvLd6UZF8mgVUhZBJqiD3iNe9c35y+cRR641Rniv4fyAG/eXo3CUM67i1mjAWdopFQF3dhcCGPQ6MH60dmnlqXbTaaT5NWek9WbMj7CBP/sY1eFJz2SMbYvsWS0aMlmdCcZ8l8GPypldZD24B5u211+V3CRaVMfk5xUYFkp/DAzxRfztvLO8OF+zb4z1Y7xJubwwHc9W/Nb7O/OYssR7qaWixQLS12RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/r4amxtseGwCzAJqRpHnfpSRofe7mcBXg/uH1pnFDs=;
 b=QgG4YjlqzxIgUgsgLue7fJzJqFZAe9WXMKHSrseFDqBSxa4b2iSi3thwyPb4bBXQxqGgAwVSPsWywgYR1IScHCsAKPu0qCwNUYlTin0++Y9A6LnPdda8U8Z4x50czVebYA6G9QKNldjKyFzHaRNQhlqxaYGBBxP5DvxVYqLXX2CnHjY4C8xyMjtE1Ef9N5t0JcqAUStC2fc+dvdzJaJ9QVEQxu4+2H8h2ZaNdDa+RQDhOWkC3WASgs0V/tdIEC9qH0N5dCTl7pDElymyq5nfk4knw4dsSnHzUJMJlJLctQK5UbLVRmk5yPprZWAHY7O3MfN7k40yRQH8saP00iIO3Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYSPR03MB8393.apcprd03.prod.outlook.com (2603:1096:405:50::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:03:19 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 08:03:19 +0000
Message-ID: <6671af4d-1229-4277-a355-71247dd696f8@amlogic.com>
Date: Thu, 10 Sep 2026 16:03:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] thermal: amlogic: Add support for A9 thermal
 controller
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, neil.armstrong@linaro.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org
References: <20260910-a9-thermal-v5-0-892d798723e1@amlogic.com>
 <20260910-a9-thermal-v5-2-892d798723e1@amlogic.com>
 <20260910070634.60B5F1F000FF@smtp.kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260910070634.60B5F1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI3PR03CA0014.apcprd03.prod.outlook.com
 (2603:1096:4:297::15) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYSPR03MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5f2ed3-cdcf-4bb5-73e3-08df0f11f9f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	ul13thWrQ2H7QGLMJpTTdtpjRcdQen40xYtyM1M9VWP6luLNfQFwZkeOEVTtqtUK9se+i19wEkYrxUIbcGmFFoFAJQu1bSotbbQHP7+MMRZmsjPvpDmaesh0XNz56txwwP8Sa/vPn8HBvPj0d20OOMHMYz/oy7NYwAsVjQraVSpsz6KYEOlz5LcV87bvhJby0C6kXnXmfVhcxjiXxLKP7qMfIM3amSnOp9IK5OSYjiYNYKdwyo/424aSB4TOlwMIXeMlfB1WlH/HMKA1y/ef6dhI5+TRPyW/tFVUzZ+hM7hcyX3a/+4ZCR3/XkjVYKXBU/ac4x8TTkPMuujEVKc7dMNl29yVURG0kH1bz3CmJFg1hosfVCVZWjkMV5/QFYTr7CDkNqw+qBTGim7qqhe/BedISqBtWQZZ4vj85TUjevH26/JlrXgGGwh4TxynQ458qM6qSAre94EgDVk1UHe0chHi9cDdrhpfwN+LM/UG60wYsikdUdCXBMOJiwQQnNjmVDi9N0z6ho7lOcnghHPhln66cUmZBevdRG8hxi63pQ9gTIvvBwk/EZZEVN7OY9FygLPbHR/utpG70EobhjG8CZ9S/eQXJQHCRHShz+ifaiw80sG9WpkjK1uji9HPHkIPOeT6qQPaH3SpqgJsDZg4kIICBb/UDJ2gFIDvgZ3DcVg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHdjaTNFR2ZqVVovNnJyakpOVVpuUStVak9NWk0zUzZSWTZVNW5RcTZQU3dT?=
 =?utf-8?B?TUkvYnJJMlZQRjI1TjdkYmc1ZnYxWFNXK2NXWWhxZjZzUlBZYUx3a3RRejlK?=
 =?utf-8?B?S3ZUQ29LcjRhZ3kvSHIxQzBlRCtRYjFUTXNzeU1qME1GQTlwb0VPbzBlNFZH?=
 =?utf-8?B?S2RNMEtLZEFJdmVwTFR2Q2Uzb0xlUXBOWFBDWmVQYVcrM2pUTzNFQUdNUlJW?=
 =?utf-8?B?MzJTZXpJMFBqa2N4cytJbUVEZjFycmp3NHhvaTk0SGdZRE1lMTIzTlJMMTQx?=
 =?utf-8?B?b00vUWRINFFMaWhDSFlFOHlkTVI3OU44SjZvS0RQOTRvaTBZQTJTUzZJcGZU?=
 =?utf-8?B?Q0VvNVAyNHorUE43bnF2VjFETGdzTlYwS0lIaElKcmNUbnhnYlRCNHNzdnpZ?=
 =?utf-8?B?Yld1RjBoWUR1eG5FYzFDT1NJSDR2K3M2YUpwVWJsd0lUdURacDdyb0V6eGdx?=
 =?utf-8?B?RzkwSUFERzMzdGl3K0tVMlVuWlJISzB1UDBlbUdrNy9YQVBDRnFua0FPV1pY?=
 =?utf-8?B?cm5yWWMvbjB5c2dJLzN0MlkyZG05UUdhamw4RDM4NFJKNzlaMzUwL0lZc0tw?=
 =?utf-8?B?L2hwdG5kTEIyWjNsVTdzY01DTWQxMzhkR3hQT3FaWTBhQXNNZ0Z6T2RvNlR1?=
 =?utf-8?B?S2ZBdngwWjNUWld3Y2RiaWNGMWJpNWdsUGNCOWk0QUZIOEN0UlpUelJrVTVl?=
 =?utf-8?B?WHYxRzFtZmk5aGdHbHhuU1o5dG01ZnNLTysrU0g1LzdKZlpaV0Z2V1QwTlZM?=
 =?utf-8?B?by8vbG5GVlBMQzFjUDV3QWhDMWNIMEZNMmtkQnd4dmdUcDdjNThlQUtuT3FS?=
 =?utf-8?B?UW9VRDM5S3FacjFrYWVmZ2dOblRUT0FXbGl1VXBRZ1l2dHZpSEE5UFYxQVRy?=
 =?utf-8?B?MXc0UU9MU3h4eFR5Q21kaldrVjZPOGFVVGRwQVZKTDZIZ1pabXVkSUtOSVNZ?=
 =?utf-8?B?eUxHZ2djc2M3OHBSRFBHSzByYlRPejFPSnEzbll5aHNhRlRZdDlpdWxZOHN0?=
 =?utf-8?B?cndiMklIVlBYTjExWEg3ZjJwMXFUemtyQlEvZXVHMzdRQXpFOXk5RDdycEkx?=
 =?utf-8?B?cGV5VGdtb3V0K2h5U1hnbTEwNUNZejd5TmRpRko1WTY0cGdMYzBiNnNxU0xX?=
 =?utf-8?B?c2dpV1N4QnJ3NTdSVjVXZmw0NU5QVFR4WlEvdFVFTCttOTFDK1NLenErc1Nx?=
 =?utf-8?B?cjJDODBWTStFczllaDZZc0pXM3ZHSEZGOTRxQ0kwMUV2cWM5dDVpMGt2NU83?=
 =?utf-8?B?UjQzcHM3d3YwWnlBbDdZQTZqRkdHUytkMVJYVXg3RW1CWkpUMkpPVDcxK1ph?=
 =?utf-8?B?ZHcrVHUvVjhlclZGaWtmM0FMUlI2Q0xLbnVVQVJrS000UkZWeUs1R1NBRURD?=
 =?utf-8?B?MzZkdHZ1d1lmSUJmWFVhTGxhSmM5cFllMC96SUF1L0ZiR2VHM2xmcnN3b0h2?=
 =?utf-8?B?ZHpoMHJPSmluR1RXMzd4S1JpQTc5eWRWaFc3RXhTN0d1d0E2U1lubjMrV0FT?=
 =?utf-8?B?RmM5d1NmK2crbHlNMnFWTU10VUlkOTZKck1YSFQrZUVKT0xQbEtQb1B2OWpQ?=
 =?utf-8?B?UnRTVEw1bmlFVjZ3S054cFJMeWFKU0lhVG56VG1kQUtMQ1UwRGQzWERmWWJT?=
 =?utf-8?B?UjdIYWkvM2RreTYvRXdRUXNtUUhXRTg5ZjJhQmVhNmdaMm5JbDJRbi9Ed2ox?=
 =?utf-8?B?bGdOZWIyMXU5ak1Mb3Rjc3lZSFJYVVhYWjZmTHdsS1hNM0Y0bnR2SEFMTTNK?=
 =?utf-8?B?ZHBMWC9HcWRQV1hneU90ZnhXNTREbmw1NWlvVnl4c0JWOGNHQW1YZExYVDY1?=
 =?utf-8?B?Vks4VUdMWW1oVTdyMk56TGZFZ0srcWRtcHJlU2w2blptejl2U01QZk1id3lv?=
 =?utf-8?B?UUF3VzZoTTRibDRIY1lsb0JwaFpjcCsyQWR2SWx4K0xTV3F5aHpaT0pUbWY4?=
 =?utf-8?B?K0RtbXJqMTJXRnZsU0Q1cFZFMXBodDNJN1MrSktJQ0xJWTRvdlZMdE1WQnNj?=
 =?utf-8?B?aGVOeEtFbzFxZk1qOUVoeFZtK3FKaWV6MC9WZEtXVlA4bUx1aHJCN0EyRkpQ?=
 =?utf-8?B?dmszdU5CZVVvWTVmdUNXM0hobWdPVmhENlk3SFVsZW1QU29JZWE3Y0dBOFA3?=
 =?utf-8?B?SmZHUUoxa1lYWlVKV3RjZ1ZYL2M0Qm5OL1BpMHZsb1ZIM0QwSFlZbDEvR3pp?=
 =?utf-8?B?ZmMzWXJVMEY4aDU4R01tR1JIMzNISWpPNmQ4bVpNMzlPYjhsem5tWGVzYzI2?=
 =?utf-8?B?b3ZrNCtRaWJXc2hEVWxRTUhYRjl1emFMdVFndzE0TDcyTnp2Skpzc2lBNndM?=
 =?utf-8?B?cnMxY0o0VFFQc3ZOY21LVmh2bncxVjdVWFU3ZVJqbkh5TTIwUmI4Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5f2ed3-cdcf-4bb5-73e3-08df0f11f9f1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:03:19.3229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6ECT8018JXHtqwajk1o6FUrFwDTODFim88otxcsCVPppvoExGoTe37WhEQmLHaxC/V3XX4xvuPEEx+d0NL2SEHhrPPeZj8cz8nr9tpRoe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8393



On 2026/9/10 15:06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [Critical] The A9-specific hardware over-temperature reset mechanism is enabled unconditionally on all SoCs, causing unclocked MMIO accesses and undefined register writes that will crash existing platforms (e.g., G12A) on resume.
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the thermal zone and hwmon sysfs interfaces are registered before the hardware and clocks are fully initialized, creating a race condition that leads to unclocked MMIO reads.
> - [High] This problem wasn't introduced by this patch, but incorrect sign extension of a bitwise NOT operation on a 32-bit unsigned mask causes massively inflated negative trim values on 32-bit architectures, breaking thermal calibration.
> - [High] This problem wasn't introduced by this patch, but disabling hardware clocks in `remove()` before the devres-managed thermal zone is unregistered introduces a use-after-disable race condition that can crash the system.
> --
> 
> commit c409169ce8a3938d784d6682dd656715a5d6d606
> Author: Xianwei Zhao<xianwei.zhao@amlogic.com>
> 
> thermal: amlogic: Add support for A9 thermal controller
> 
> Add support for the Amlogic A9 thermal controller.
> 
> The A9 thermal controller uses different calibration parameters, requires
> separate core and bus clocks, and supports a hardware over-temperature
> reset mechanism. It also restores the hardware reset configuration after
> resume.
> 
>> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
>> index a0b530624b60c..e7cedb9443151 100644
>> --- a/drivers/thermal/amlogic_thermal.c
>> +++ b/drivers/thermal/amlogic_thermal.c
> [ ... ]
>> @@ -138,6 +158,51 @@ static int amlogic_thermal_code_to_millicelsius(struct amlogic_thermal *pdata,
>>        return temp;
>>   }
>>
>> +/*
>> + * Calculate a temperature code from a temperature value .
>> + * The unit of the temperature is degree milliCelsius.
>> + */
>> +static u32 amlogic_thermal_millicelsius_to_code(struct amlogic_thermal *pdata, int millicelsius)
>> +{
>> +     const struct amlogic_thermal_soc_calib_data *param =
>> +                                     pdata->data->calibration_parameters;
>> +     s64 factor, uptat, uefuse;
>> +     u32 temp_code;
>> +
>> +     uefuse = pdata->trim_info & TSENSOR_TRIM_SIGN_MASK ?
>> +                          ~(pdata->trim_info & TSENSOR_TRIM_TEMP_MASK) + 1 :
>> +                          (pdata->trim_info & TSENSOR_TRIM_TEMP_MASK);
> [Severity: High]
> This is a pre-existing issue, but by copying this logic from
> amlogic_thermal_code_to_millicelsius(), the new function inherits a sign
> extension bug.
> 
> When the hardware provides a negative trim value (bit 15 set in trim_info),
> the bitwise NOT operation on the 32-bit unsigned TSENSOR_TRIM_TEMP_MASK mask
> evaluates to a large positive value on 32-bit systems (e.g., 0xFFFFFFFF).
> 
> When this is assigned to the s64 uefuse variable, C promotion rules
> zero-extend it to 4294967295 rather than sign-extending to -1.
> 
> This breaks thermal calibration for hardware instances with negative factory
> calibration offsets, rendering those devices unusable.
> 
> Could we fix this integer conversion so that the negative value is properly
> sign-extended into the s64 variable?
> 
> [ ... ]
>> @@ -346,6 +440,17 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
>>
>>        devm_thermal_add_hwmon_sysfs(&pdev->dev, pdata->tzd);
>>
> [Severity: High]
> This isn't a bug introduced by this patch, but registering the thermal zone
> device here before the hardware clocks are fully initialized creates a race
> condition.
> 
> The thermal core invokes the .get_temp callback immediately upon registration
> to establish the initial temperature state.
> 
> If the driver is built as a loadable module and loaded after boot, when
> bootloader-enabled clocks have already been disabled by the clock framework's
> late init, the .get_temp call will attempt to read from the hardware before
> its clock is prepared and enabled.
> 
> Will this result in an unclocked MMIO read and subsequent bus fault?
> 
>> +     if (pdata->data->reset_temp) {
>> +             reset_temp = pdata->data->reset_temp;
>> +     } else {
>> +             dev_dbg(dev, "using default hardware reset temperature\n");
>> +             reset_temp = TSENSOR_HW_RESET_DEFAULT_TEMP;
>> +     }
>> +
>> +     pdata->temp_code = amlogic_thermal_millicelsius_to_code(pdata, reset_temp);
>> +
>> +     amlogic_tsensor_setup_hw_reset(pdata);
>> +
>>        ret = amlogic_thermal_enable(pdata);
> [Severity: Critical]
> Does unconditionally applying the A9-specific hardware reset setup here
> cause issues for older non-A9 platforms?
> 

Non-A9 HW is support too, just that this function wasn't added before. 
Here, the default value is used.

> For existing SoCs where has_sysclk is false, the peripheral clock (data->clk)
> isn't enabled until amlogic_thermal_enable() is called on the next line.
> 

The existing SoCs sys clock is not control by this driver, it is enabled 
by default.

> Since the clock is physically off during probe, does this regmap_update_bits()
> write inside amlogic_tsensor_setup_hw_reset() trigger a bus fault?
> 
> Also, could writing to TSENSOR_CFG_REG2 cause undefined register modification
> on hardware that doesn't support this over-temperature reset mechanism?
> 
The Non-SoC has TSENSOR_CFG_REG2 regiter, the register was hidden before 
because the related functions were not supported.

> [ ... ]
>> @@ -370,7 +477,15 @@ static int amlogic_thermal_suspend(struct device *dev)
>>   static int amlogic_thermal_resume(struct device *dev)
>>   {
>>        struct amlogic_thermal *data = dev_get_drvdata(dev);
>> +     int ret;
>> +
>> +     if (data->data->has_sysclk) {
>> +             ret = clk_prepare_enable(data->sysclk);
>> +             if (ret)
>> +                     return ret;
>> +     }
>>
>> +     amlogic_tsensor_setup_hw_reset(data);
>>        return amlogic_thermal_enable(data);
> [Severity: Critical]
> Similarly, does this execute an MMIO write before the peripheral clock is
> enabled during the resume path for non-A9 platforms?
> 
> On non-A9 platforms, data->clk is only enabled inside
> amlogic_thermal_enable().
> 

The sysclock is keeping openning all time for other SoC.


> If this write occurs while the clock is still physically disabled during
> system resume, could this cause a synchronous external abort and break power
> management completely?
> 

Non A9 clock is aways_on ,so for A9 if enable sysclock failed, it will 
be return.

> [Severity: High]
> This is a pre-existing issue, but is there a use-after-disable race condition
> in the driver's remove path?
> 
> drivers/thermal/amlogic_thermal.c:amlogic_thermal_remove() {
>      struct amlogic_thermal *data = platform_get_drvdata(pdev);
> 
>      amlogic_thermal_disable(data);
> }
> 
> Disabling the hardware clocks in remove() before the devres-managed thermal
> zone is cleanly unregistered could crash the system.
> 
> Because pdata->tzd was registered with devm_thermal_of_zone_register(), it
> remains fully active and exposed to the thermal core until the devres cleanup
> phase, which executes after remove() returns.
> 
> If the thermal core's polling timer fires, or if a user reads the temperature
> sysfs attribute during this window, amlogic_thermal_get_temp() will attempt
> to read from the unclocked hardware.
