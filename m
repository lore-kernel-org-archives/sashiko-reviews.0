Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013027.outbound.protection.outlook.com [40.93.196.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5E52DB780
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 05:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945086; cv=fail; b=k3i9nn8hx0bioIbgbk0if0Qw5F8yEv1by2TIsuX/UfUx1NxMz4xrQx/nbIZ6w0AdAh0bAat6RYFpc5QM/2uwqyGooPO7kyTGedrs86CZ6YyP1kdmu1Qv0kJYgFKtYuM+8kydKUPxJlZyUDjQ73cuo4ZLBGYt1HdDIFPhtLO2fYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945086; c=relaxed/simple;
	bh=G/iKClLMQ2zG9K9KQKj+5UIV3uTRYVC6Om3TWu0YHNE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hlnaI4r6QCeL2hthyilRdj6QSZwqXkn61ouTEZ0Pkc3sW+rISdt7kTurqQL99fOPZ+krh6+/u2n391xvkTDtWF/H8okpatc2EdAanWDMWmSWRsSO8F5e7AiOHPWJlJ+DudvlB6aImYCXYFzqJXRH+fj3QAEdtb1jNodmRce+Iiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=vKHT2oRx; arc=fail smtp.client-ip=40.93.196.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="vKHT2oRx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNsxY5gnNDzXhK0DAKYSXV0hRngkj7qvaQSt0eq1ObSwxC3dEj9krNirx1nVvDk0HyGKrwfB3rh5lWeKHNT4qXzbi/GKKvG1uH2jFfG/u+PkB8wEBY7ozPZAfrvEapbzT4kPpFS4w9ecDfbSFVDIJmokdF7MT02TaDmK6KA+JjXeGFxGonq14zz4fryI8c9U+C4cYrvp6u5BvTrHh25gm+WhIKvEXA7fQ7EjIqBITmD6ktUTABIGxLNtu4aVUwXG8EqeLKvMpB45xifYGYgq4UoYN9nPSNcf5LYj1iPKK3oJ01pSfK6ArV+zY/5thNudSsO+zabD3Ts2YL+ZQwSd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVktPPNuTYuIembm+AIsoeIA/HVDM7JulsfMFAxLy98=;
 b=uiLY5KOkx1AWq2XnmKkXAQ8EKL3GdO5tTgIdl25PYhP9u0vD4nqcaElFIkpWvlCOrKVmypcIOYenZD+ytYE7CzBl7gKkmrm+8H4peSKjUn+yBCeiDv8b9+OjjKeEetyFmoywqvpxMbOqszgr4FxraN3B0ijQiVps0pgcVZc7DBOe9FLVztPGiR/Z3gP+xGJwB9jQdjabjlvqQp78I0/rt5sDi2CMbmF2u50JmA4H40+g3+ml+1NkterboufZoZXkjR2WpVLeNMJ7YskUB6+FBW3o/WsugcI/ELUDJ96aM7pm0SBoMIJf5j1ieO1qO/Mf/rdT+BARO5wOq2J1IGZGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVktPPNuTYuIembm+AIsoeIA/HVDM7JulsfMFAxLy98=;
 b=vKHT2oRxpWRF7zsfqaAhV/Enu+sV+J62LqwgkgU9NsxXdQxheMs6uGDi+7bZHcscvY5AJRY8ngOJR95bDz9tKuLFpyUtKBPxJJuoaQsZZotVMUPGNSB9gDIYu3OC1CzI/pQxDDf5VuHKUSv2GGsI/mdwHnhNwN8ViQnJyj467P927W5ndU0v+opStpfmFom3tKri5yPamVyVepn4jcs6ErXGTmdxALWcaAuJw8MN+NLc/f5AgabYH55x8FmOuSqmsdaKMNkVxsPqiTC1ZYiqddruJl/PFoFhK8QHluInGCIrOTaD5vJrKnu0gxU1CdteL2Ks+peq28CWcZzsgN0H3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CH8PR03MB8249.namprd03.prod.outlook.com (2603:10b6:610:2c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 05:11:21 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.21.0048.016; Thu, 28 May 2026
 05:11:20 +0000
Message-ID: <e5238a24-75ca-4121-8bc2-e8820fe294ca@altera.com>
Date: Thu, 28 May 2026 13:11:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: socfpga: agilex5: replace clocks
 reference with clock-frequency for dw-apb-timer
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 sashiko-reviews@lists.linux.dev
References: <43d6d68a74340a5b513972e8b25c1369b31b130a.1779785788.git.adrian.ho.yin.ng@altera.com>
 <20260526092419.220931F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <20260526092419.220931F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CH8PR03MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a88753-20c0-4bc3-7166-08debc778d06
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099006|6133799003|5023799004|4143699003|11063799006|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	hzKt/5MZFLq2+8yHcyPozNGyWMTXzbX0gM6rpWEf2aXL0O9H2gXPSyHvm1X+mZ5m8o3RluwwQ1erRVxitaAy7Nv6Br6svQn/viN4hkhX1Xbccu3uF1EkyIeHxYzQziZW8AADT0jB2p7ahGRxpDBEsAph5vtB+ZYY0XMckAtdSX7IHN6WN/A6N0OUFeLAKO5ZgAEO6i1mEGIzPpm1kov6LFIdQuiBag9EOWLhVFMV8PuDwj0Tbqhg3Xzr4wzsmzJQ8lbQ+ooSUINEFYLEKrm1/Y/HQTfOYXlVkakXakGJ2iYpv6NAMjfutpxkV1bsUIZDTgV9OarPiOquriTHFVAJXOM5vbQxNzUo3o3BMvc5amUu0fH2gv03EUbkl7nd1cwU3plLehvu5IFY2tWufgcC9fsvmChG9qRWLKiYCtTcPDOOva4YN9E8gWNVvcJtHXFlAb5dz4MYIAj2rsgTxLIrvNBsK0l/uq5CJSQut1yzsMz1bApeOjBfDQp8iPQ5IoMEh+UQyFO5bx0DkHHepBklWabx51Uo0hj82QoTQIIbCaSXLLplUrSdpLDjc7J1LzMThZ1zv0xwYguCsATkN+6BSWJrO2+JHk2X75GUoY7MiK3HxOMBqckiZxbSHMTCyoFqnPNS0iGv4KtnDbv90eYK78sDqaCLi8aAe8HZnVut6zjFKb989LQBAHJ61mgdLNSv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(6133799003)(5023799004)(4143699003)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2Jsb3IvRzNuVTlTeWJNendRNmV6OVdaMWRnem1nY0xEdjhYazYwSmFhYk9a?=
 =?utf-8?B?UHBtZVhvMnRvV0hGRG9LV1JGaHVnYzFDeVJsNStNVkRhSWNyMlJzVnQzYkhr?=
 =?utf-8?B?QUZvK0lPM0djM3pRaWZOZE1aRG0wejlJclVFU2h0ZUx5aHlBU0JGN1N6ZkNy?=
 =?utf-8?B?NzRLeTVGWUptWUs3dnAxY0dmQWJIRmNFcjFiUUR4YVNXdHh2cmRsWDlmODNY?=
 =?utf-8?B?UzJGdUt1dklWL2tGNWpmRkNFVjJrMUMrS2p3bDJSOW5oUzdLYS8rNUx2Y3ZE?=
 =?utf-8?B?MkJPMDRFYmNuV25jZ1kxeHp3MFRZSDhyTlBaaDFDdW1RL0h6ZkFUZG1XU3Zh?=
 =?utf-8?B?eEEyNCtVaHNSOURhQlU0U29ENlJlMTVxby9XaWZ4NzZRTFdXUGFHLzYvblVj?=
 =?utf-8?B?a05QZEtKa21CL1AxWkp6S29QRXBBc0ZSV3N6S1I0cGxvU2FnS2g2YnhBemZY?=
 =?utf-8?B?RXREK2NMNytLZUN0QStlRnVoWDdTanFLMlBtYUQ1ZWY4c0xwU1g1RDRyYTR1?=
 =?utf-8?B?WU0yQzY1YkNacUhvSWxlQjNtR0c0S21jNThZT1F4TWdKUk92ZjhSSVE2WmFT?=
 =?utf-8?B?SENHamNXTlhwdmxKZFFUNm9qbGJNNytiZ2pjNnVZbW9xNDl4QXpaL2dCcjdj?=
 =?utf-8?B?NlJXNzI1Nk04NUYvcmJFNnhwREVPZHFObUM2dW83RCt5UDZiQkhJdkR4Zm0x?=
 =?utf-8?B?Z21vUGJnQzVBUWU2K1hKcnRKVEJhK3VCWVRsS204Rm5KeTVkVmxEWEZ2QmFs?=
 =?utf-8?B?ME9jZkxqOVlkSnoyY3BUakx6TWxHSDFNWW5FR1drdExhU24vSUQwOVYxbWJz?=
 =?utf-8?B?V3BzakgyckJwdEhEWDQwbUdDUkR5ZmxJRWFDQy9nMThac2grMXJ6R0gyK2kw?=
 =?utf-8?B?cGJxZ09MS0RYRG84bFhzeVd1T1RVRnBNeDN3Mm8wT0NIbDVVR01SL0FWV2Nx?=
 =?utf-8?B?elg0NlhvWVE2U1IybHNzVy9lT0YvQXZHRloyNFRuVDlaV0oycjc3QnAyd3Bx?=
 =?utf-8?B?UUQ5Z29oMEZKb2Rrd0FzUkhKeUl0UjlPSTU0d2lzcDg0NWQwN1pGc0pzUi93?=
 =?utf-8?B?cUlsOTIrdU1zdjRCc3BhbzZIRTJiMVFwbWR0QkkyYXRNWTc3OUluVklYd2V4?=
 =?utf-8?B?akVCK0x2bC9FS3FEL3pWVzV4a25NTjdVUjZ1NDdSZFh6MDZ1UERuVE9OVGMy?=
 =?utf-8?B?dFJDQ0tiMDdyVk1qQkdmZlZsSVVKbFJpU3lINTh4RDBpVG1EUkpkL3c4cmRn?=
 =?utf-8?B?ejNZUmhpaDREZ3VLRDVVOFF3bzIyT29vOGhwSlUzQ2Z6aWkwOGN4NUFPNElQ?=
 =?utf-8?B?QUV5US9IWVgwbW1QOWI0RCtIS1F5UkRmSzBnVzg5SXh5VzcwaDBnaUhudGZX?=
 =?utf-8?B?b2FhcEkvd0dMWlNkU084ZHc2dnZObldGZ2dVT0N4NHhYRGtKVUQ2MkM5aW04?=
 =?utf-8?B?TmkxNG04WThiUXNwYmI5ZEcwc2Z0ZWxYNGZEMGx3d21uKzZKOFlRbHpCTGVB?=
 =?utf-8?B?cTE0bFhnaGJPRTB1ZGx2ZEVTRXFhYVowNzVqakhlMTRaMEFxOEdOQ2VxZWpj?=
 =?utf-8?B?QVJQUHRHcnRYZ0EvQXVnYTV5c0ZOc29EMFNDODZndURqS3hoOHVLaUVmNjhY?=
 =?utf-8?B?ek12MHFyQUJJZ0NTeFZNRFdBanRUZXNHQjRkc1BNUkowa3RNQW1zZzVmMGoy?=
 =?utf-8?B?L084WmlNd0ZBc3VkZVd5OHFNVlZYRTdvRGZpVStLSERzRTRWekNCM1hwbWxs?=
 =?utf-8?B?TC9TTkp4Ui81Q0VDL0VGSEw5OTRKdFlDbmo3WFNKNjVDMnhjdGdlTTNIK2s3?=
 =?utf-8?B?cUwvdnhJeUZjMkpWcXM3NkdyRmxGMXFkYWFEUEsrSWRlTmc2aVFLNGlYanRw?=
 =?utf-8?B?a2szQy96Q25nejJRbjd2cWVUbHRUTUJwbjZwS3RpYjB4Y2gzR0wvbFM3Z3lh?=
 =?utf-8?B?N1UrWEs0akdOWEJKdFFJcTViRFY5Rm1aNjlHR0NDVnQ4VWFPNURYeTk1RENq?=
 =?utf-8?B?c3cyNlg0NU1NaTR3eFZjdmI5VEh3Qkd1Yi9oMEpadGNKc3lvNEVsazF5aHl6?=
 =?utf-8?B?VWc2dlZGeWdadkhZVlpVS3ZQc2dLaERCdzZ3ZmFNVlFRSzRVM3huSENRczMv?=
 =?utf-8?B?TnJLaHIydmhtcEIwQkRVa0JQaEpWT0htclNGcldQK2xHVlYxUXNocElDUTN5?=
 =?utf-8?B?b0pBL1RsTWJWQ3dIeWpRMWJyVlYvdUZWWTVKWTgzb2w0L3l5aEJFWGlobGxJ?=
 =?utf-8?B?OTZGdkFXRzNnTm80em9wMzZJV29LcElZMjNMWUtGaTY2b2tDUFFJd3pXU1Qr?=
 =?utf-8?B?ZmUyNHdiQ0lTUXJRaEJnMndEaGNXM2tIVHVTdWxnN2l2RWNpWTRVQllpc1ln?=
 =?utf-8?Q?7GZMPWSZTFDqkHL4=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a88753-20c0-4bc3-7166-08debc778d06
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 05:11:20.4389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWFa/omdK6y4ah1Linw3HBUfgPDSvAGW7PJxE+cjR+tlfnjdYnIDTx8RGuFDfLyya0fKsZJ9ZqivnKHhp1sjCpY0ZWCbsshhTYKrprLh1vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8249

On 5/26/2026 5:24 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Replacing 'clocks' with a static 'clock-frequency' property to work around a Linux driver probe ordering issue violates the principle that Device Tree describes hardware topology, not OS software state.
> --
> 
> commit a7903d7afbf4e7139441f7d02ec41f33a88a0de2
> Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> 
> arm64: dts: socfpga: agilex5: replace clocks reference with clock-frequency for dw-apb-timer
> 
> This commit replaces the clocks and clock-names properties with a hardcoded
> clock-frequency property for the dw-apb-timer nodes in the Agilex5 device
> tree. This is done to bypass a Linux probe ordering issue where the timer
> initialization runs before the clock manager driver.
> 
>> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
>> @@ -430,32 +430,28 @@ timer0: timer0@10c03000 {
>>   			compatible = "snps,dw-apb-timer";
>>   			reg = <0x10c03000 0x100>;
>>   			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
>> -			clocks = <&clkmgr AGILEX5_L4_SP_CLK>;
>> -			clock-names = "timer";
>> +			clock-frequency = <100000000>;
>>   		};
> 
> [Severity: Medium]
> Is this modifying the device tree to work around an OS software state issue
> rather than describing the hardware topology? Replacing the physical clocks
> reference with a static clock-frequency bypasses the actual hardware link.
> 
> Could the clock provider be registered early using CLK_OF_DECLARE instead
> of removing the clocks property?
> 
> [ ... ]
> 
Hi Dinh,

With regard to this comment from Sashiko which method do you prefer 
since you are the maintainer for both the device tree and the socfpga 
clk manager.

Converting the clock manager to CLK_OF_DECLARE is technically feasible 
but requires replacing devm_platform_ioremap_resource() and 
devm_kzalloc() with of_iomap() and kzalloc(), and changing the error 
handling model from returning an int to a void function with no deferral 
path. That is a separate, more invasive change. The dw-apb-timer binding 
explicitly provides clock-frequency as the supported alternative for 
this exact scenario — where the clock framework is unavailable at timer 
probe time.

Thank You
Adrian
