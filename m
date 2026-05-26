Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7873BADB4
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779813094; cv=fail; b=a1tSy7qRRKIZG5yn9gSfxPyzQvNvtlOGb3klmT5W1FUle7A8BpM4lzrp+poX84maj1OoZ9XKC9rHMk0ETf21tTnpPkrWUaKSNPNCIF5ebLgXR10xT4qtMVhU3zaWLdj/i1ouvUEV8IHvfgKiccTyyZ0MAupOpvNGAakhpbLJqGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779813094; c=relaxed/simple;
	bh=a7Evjih5lHGtpzTsuUS/ifzDf8P12d/CgBMoCX0Dr/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Na1zGwtLOFjODaVmIDOADWpgMAei0qGBL4w9HuXsqdl7FXE1YlZJkEcVix3l0DEIlOTIu6famVSXKUSiPxIJ2HDZHSvuz5f7C087wGGsA8ScxCUSy9PV81fge5aAg5HH0LbGFpYhYnB4HJgXvJ6AJ3Fis02dFggT4OsSfzB8Djc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HeshFqNs; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HeshFqNs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+f+Miw88rPtMzydyjGRP7cEn9VndHEHd/+fH9warHb7cP63cDlMO8mFof+JCTfu9InWI/LIXESHzKgiAJur9ZiqHaPzytqQcoznviR1jBSyeZ51Q1rbASXbg8xGTL5+1CrXkfiHt+/Z/j7QV5p1W2gv+pVAZgFmMjF2oAmO8lxB0A1YxRjgQKtxqynMB8e/xdYbz8J8qHzN+1svAk7sJnzfq1siEu+iAwU4iCdMDjqXc3obUoBSXn79CNyzLP967wSaesI6ymdR9CCNIIELX6oe87vuLqSW2JfQ78lrqkfl4kVZWQ9SL6qGE82NBHGqNiRsKCFg4k2SCgT9P5fptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02HwkQl8m1LU8Nlpxl/FRtTTskhVtqBqjBvyHM7KFU4=;
 b=kw/gJ/PRF5UZI6y+KTyP0KOYRp4+Se/Pz8ldFXchkMB0spcKLkNSgpe0D7BhoBfhtaXYU/cMWkLNIEk8o2gi+0L/JpkKX0ebpEXuDYA8QO7km817MxdS3AsUWI7lke9/ICZWcIcLxtaIJhlfx9DfD4BLtiYSCaSPW4idu+WTMGaey6LgQ5YPKI4s+52aSgvz5yZ2+78RGei4gmFypqNIIXPC78fcLaO9ENWSRSdr7Z+yoGzHpejnW0rgKeYz/Zj6C3te4KxncYKM04gAcBObwwFOBillx9owR9SlmwIi6LOkqW4Gx7WKRKylAkYNE28LcJKe9J5DUjd2OuXyalvigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02HwkQl8m1LU8Nlpxl/FRtTTskhVtqBqjBvyHM7KFU4=;
 b=HeshFqNsPglO9O4iAyZgdM7u3CAv5Hy4RdT6bpskpKCBAcXbaLQyNAtvEUosO2YgNTxtyO/2I53EDCOzPdknkSeGpFYCxL+eMHf+JA8QO4f2UWL4q9sf0xk4+rWhgBbR6C0ELWAOrnlT+x4P9livWO9bYYlCJS5h1Og/ZsKv3DFn8t/KWvpWD/7AAoaXSiSHOTOR++X+xgk8tmMF10zGxBDHt/opOMVYcdiwWq+XjqaVJwugDaFLL1scLAmVAfN3pZenZQQKquIAUh2XrUXeMfvKuxWyB6OBJrqdyXCzvNPFnUKf4IjTfIIB1O98Ztv5JblcVGNNS6tB/U5wQuqT/A==
Received: from AM9P192CA0005.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::10)
 by VI1PR10MB3485.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 16:31:28 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:20b:21d:cafe::1d) by AM9P192CA0005.outlook.office365.com
 (2603:10a6:20b:21d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Tue, 26
 May 2026 16:31:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 16:31:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 18:35:31 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 18:31:26 +0200
Message-ID: <7b7c68b6-d2d2-45aa-bdf7-b786eb027227@foss.st.com>
Date: Tue, 26 May 2026 18:31:26 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics f7 boards
To: <sashiko-reviews@lists.linux.dev>
CC: <devicetree@vger.kernel.org>, <conor+dt@kernel.org>, <robh@kernel.org>
References: <20260526-upstream_uboot_properties-v7-2-e17cd424d5db@foss.st.com>
 <20260526095449.20E1F1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260526095449.20E1F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DB:EE_|VI1PR10MB3485:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd2c326-0e95-48ee-9d89-08debb443c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|22082099003|56012099006|6133799003|11063799006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
	m6tGb6obTj99qNAX3v8lOuThmt3ndK997n21JvKv2gm1KCraAUf7bH/ZTDd9ZwF2WrDIZ1iF2PbbjCH5GKxZ11W1nNVnrCYhRZ51WEI8P9P+YvFnNlKzXr/ux4FxYLWnJvQRtTCoYlzsW0hS4FhCPSDr3fI5SweHwBMUpkmTdL3V1B9IZo/+HBjMVi8l+paDLcUIWlBf9OX+jvVoKFXEmZ4IqB1IWOUNs62t3Q44sL27AHeRjwbM2EGDXBq/IqLxldFVe0raPkqOHgPXyuuQSt3DuIG1FD2trXMZN7V56rBh3QUmbBE5R72blQELoD4wneobI0S9vcCRxSOCNnHZ3c31y5ggQMKydLdvWHR/fQcoCOJbsmPf4OHqq7kSOJHm+1fFxszc1a/4OFIQ/ZcMLQskbiGb2vYKA++LrX1KpsIzTHtbDI5a2zYtXJ3ezSQ4NFEKIYKAgA+aRsFI8GZ+Scj5EpPu4QJTxlILcDFixH+ntSBattr3tfDmzwe1fgTvz4Q1hUlBC5TwHd4wgRKgBBkSdiLGdTp13oQN6d0CJ6NUxQl5jWPQHBYitbEF7JiP0oO4IpBRSQd3j+GeWGectnzB33SmewDK8WRhIAN1T+GATm/1AKNNGCXhviplNd09Zvaku4JfBRvXSzvKcjmbIINnR3LySRgxVauXk6CbM+n6nLb3AS4O8FZYlzLzf9Glj+0edgZWAi+e1ZrC3Keys+GRT3Fo66F3FDbsViPWX+4=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7ZaoRGy0itrbIN3FQNnpehPWwQzY+P+W4WlrG4yhZ7kihMNqkvHCgKFDccmfJ+3yuWroAbbWcqceJCPZRnRlJR66zhjiYGt/OZRcc8xbWEZe4DnXOQdWHwCo3Rmr1/nOiAiXOsoSvQpNDvWP4RdK6hU23bxIiU4oo8d16CRJFx7S79NVLhoCNILcZqD4XddpmXBX8Qjrl49lQ79Kd7Kil0R8+erCwG9IWyZ8jqh6hYYmtLoi9DIZJAzsGwzyjyQRnLuZzgt0W+yveIPjxXFoKioEX/LDd9oTsFP2+fkMt+RMRYGhZrDqaU/95wVcxiAKj4Qnkt+iBvLKIXr9ZbSYWyCsIxPxl6TDJSB+GZRCVlwgahjJsqEf/RmvbrpmdWdXyMVFMZQvQnMUFw+UKJ/81QT/6v3fInfHkSVALy9Hw4L9oSv9MDolKEJmXF7dxXP7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 16:31:27.6598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd2c326-0e95-48ee-9d89-08debb443c53
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3485



On 5/26/26 11:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] The patch completely omits necessary `bootph-all` tags for the `stm32746g-eval.dts` board.
> - [High] Missing `bootph-all` on SDIO controller nodes despite the patch claiming to support SD boot.
> - [High] The `&soc` parent bus node lacks the `bootph-all` tag in `stm32f769-disco.dts` and `stm32746g-eval.dts`.
> - [High] The patch tags `pwrcfg` instead of the `syscfg` node claimed in the commit message, breaking `pinctrl` initialization.
> - [Low] The patch erroneously adds `bootph-all` tags to display-related nodes (`&ltdc` and `&dsi`), which are unrelated to SD boot.
> --
> 
> commit 616809e6aaaad31d633ea36ad66133cc44b7b361
> Author: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> ARM: dts: stm32: Add boot phase tags for STMicroelectronics f7 boards
> 
> The bootph-all flag was introduced in dt-schema to define node usage
> across different boot phases. To ensure SD boot, timer, gpio, syscfg,
> clock, and uart nodes need to be present in all boot stages, so this
> patch adds the missing flags.
> 
>> diff --git a/arch/arm/boot/dts/st/stm32746g-eval.dts b/arch/arm/boot/dts/st/stm32746g-eval.dts
>> --- a/arch/arm/boot/dts/st/stm32746g-eval.dts
>> +++ b/arch/arm/boot/dts/st/stm32746g-eval.dts
> [ ... ]
>> @@ -226,6 +226,16 @@ &usart1 {
>>  	status = "okay";
>>  };
>>  
>> +&usart1_pins_a {
>> +	bootph-all;
>> +	pins1 {
>> +		bootph-all;
>> +	};
>> +	pins2 {
>> +		bootph-all;
>> +	};
>> +};
> 
> [Severity: High]
> The commit message mentions adding tags to timer, gpio, syscfg, clock, and
> uart nodes, but for this board only the usart1 pin configuration is modified.
> 
> Are controllers like &usart1, &timers5, &clk_hse, &pinctrl, &gpio*, &rcc,
> and &soc also supposed to be tagged here?

Correct, bootph-all property is missing for &usart1, &timers5, &clk_hse, &pinctrl, &gpio*, &rcc, 
&pwrcfg nodes for stm32746g-eval.dts.
> 
> Without these tags, the early bootloader (SPL) might drop these nodes,
> causing the SD boot sequence to fail for this board.
> 
> Additionally, since the explicit goal of the commit is to support SD boot,
> should the SD/MMC controller nodes (like &sdio1 and &sdio2) also be
> tagged with bootph-all?

The SD/MMC controller nodes soesn't need to be tagged, as SD/MMC is not needed neither in SPL mode nor
before U-Boot relocation.

> 
> Without the tag, the device tree tooling for U-Boot SPL will prune the
> SDIO nodes entirely, leaving the bootloader without knowledge of the SD
> hardware.
> 
>> diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
>> --- a/arch/arm/boot/dts/st/stm32f746-disco.dts
>> +++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
> [ ... ]
>> @@ -179,6 +224,7 @@ touchscreen@38 {
>>  &ltdc {
>>  	pinctrl-0 = <&ltdc_pins_a>;
>>  	pinctrl-names = "default";
>> +	bootph-all;
>>  	status = "okay";
> 
> [Severity: Low]
> Is bootph-all required on the LCD-TFT Display Controller for SD boot?
> 
> Retaining this node bloats the memory-constrained early bootloader device
> tree (SPL) with display hardware nodes that may not be functionally
> necessary for booting.

bootph-all property is needed to be able to allocate the frame buffer before U-Boot relocation.

> 
>>  	port {
> [ ... ]
>> @@ -188,6 +234,22 @@ ltdc_out_rgb: endpoint {
>>  	};
>>  };
>>  
>> +&pinctrl {
>> +	bootph-all;
>> +};
>> +
>> +&pwrcfg {
>> +	bootph-all;
>> +};
> 
> [Severity: High]
> The commit message indicates that the syscfg node needs to be present in all
> boot stages, but &pwrcfg is tagged here instead.

Correctn, I will update the commit message accordingly.

> 
> Does this leave the actual syscfg node (syscon@40013800) untagged?
> 
> The pinctrl node relies on syscfg via a phandle. If the syscfg node is
> pruned in SPL because it lacks a boot phase tag, will the pinctrl driver
> fail to probe due to a broken phandle, cascading into GPIO initialization
> failures?
> 
>> diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
>> --- a/arch/arm/boot/dts/st/stm32f769-disco.dts
>> +++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
> [ ... ]
>> @@ -140,11 +136,13 @@ &cec {
>>  
>>  &clk_hse {
>>  	clock-frequency = <25000000>;
>> +	bootph-all;
>>  };
>>  
>>  &dsi {
>>  	#address-cells = <1>;
>>  	#size-cells = <0>;
>> +	bootph-all;
>>  	status = "okay";
> 
> [Severity: Low]
> Similar to the ltdc node above, is the MIPI DSI host required to be
> present during the early SPL boot phase for SD boot?
> 
>>  	ports {
> [ ... ]
>> @@ -199,6 +242,19 @@ ltdc_out_dsi: endpoint {
>>  	};
>>  };
>>  
>> +&pinctrl {
>> +	bootph-all;
>> +};
>> +
>> +&pwrcfg {
>> +	bootph-all;
>> +};
>> +
>> +&rcc {
>> +	compatible = "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
>> +	bootph-all;
>> +};
> 
> [Severity: High]
> The &soc node was properly tagged in stm32f746-disco.dts, but it appears to
> be omitted for stm32f769-disco.dts and stm32746g-eval.dts.

The soc node doesn't need to be tagged in stm32f746-disco.dts. bootph-all will be removed.

> 
> If a parent simple-bus node lacks a boot phase tag in U-Boot SPL processing,
> its properties are stripped and the driver model will not bind to the bus.
> 
> Should &soc also be tagged with bootph-all here to ensure the children
> nodes can probe successfully?
> 

