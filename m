Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011065.outbound.protection.outlook.com [40.107.130.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA45D38C2A7
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779810730; cv=fail; b=sZbeZa/VkVkPO1W6Xm84sIMpelzcs9GuSnAdG5GL2peStLtNWG1ZhkXCQAAe7PrbAT8n05/vW4QrpOEvQq3Q2x7YBT9JVjScsXlt5OyRwVs+rLmeCN+pkJ5itzACrn6SxPBT6MSrxuXj3KDv45zy1+Mymsj2lu2ZyB0gJ8/bwVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779810730; c=relaxed/simple;
	bh=oVIjgwNpY3UsBf9mHWYPzOiG33QyQRJSm5GQwxqUl5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=N1eRPq3cevyT/5ZifMoJsDTVRySxqE8ofWHLEbIGXoHWxyS7vDUWmwzeD42nKrbjK0sPKcuuWqUWgie7JKROgqyCRvC6OcDMWto84iXc0sZ5yPJx9zt0+Qo0YwF5naJO+YNXBwhZxEldfu4CysJU1zMQ6Y9IDWRqjS52EQ65fJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=USSR7fPF; arc=fail smtp.client-ip=40.107.130.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="USSR7fPF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miVGYQoj9mt4fAuWuqWkiXgtAdWOjAbAR7TQR9qiPVSIvzpEVO5si74rY5woxjuNx0bjRJuLzFi88zPn5TIgkx7yeumWNiqMSsa1f7S4YjsWfEGuaPn09NiaEziUJOvr2p/KT/fICUq5gj4V6MSQL2goYjaUWHq18yuGt2fVvo8yxe5+W6nOEq0eSg9n82beGCjJsfrhkW8gEaBfATIjGucOqla1SmEnaek45EubEp0nZWLDMTUa9tiGZ+PYYBImZ+jC5jb00IEYVFpWz08wpd9SgGreYt2G0qhqugJqfN2Id1mpdi3SBD29o8wJtpghPiBxQtZu1/SM9tDMaAIM5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fXplID0m9tiUkDFhmgEN+gmbSFifHwsFocg9jtC6Rg=;
 b=HOZhyM2pb/lXrg4wjAYMutOOty+LNfLVWLy2F5WR+gq5eQNSnYsTop7acPn7h3daNE73E5bO1cdaFl4RhuO8IrRET3U/HoLcocPXWrZ3FWXiZUxF+qg8d4yzeoPg7ZHUn5vXCpyLzGfZB3vSHOolonD+o9mv6WRcTWU9xpWOZ2wXK5fkhAvUw/1DPDBZoFErSwu3zo8U9yxfPZDtBelrmYc1Ol4OM++NYHtXjDtYsKsLZH4UDk37EaR+WSWhI7bAv5z1y4zV/yN03ey5t3HKjHaYshissEqFQNg+7x2FQ7g6a1i7VmNMW7ae6j8iD+cyUqqejOW7xswVqwQ3bbm9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fXplID0m9tiUkDFhmgEN+gmbSFifHwsFocg9jtC6Rg=;
 b=USSR7fPFk+/0aexS5Qry5DR+vHpFyMzBAS5qGpeXEBYpH6WoCB23YgSsXldlMFzCXI3EHY+m/egmDYCNvN8Eh8EShmrS8Iz7VU3nVqP3iOWNNt96BBnQFs0S4PgVXg91MI0WxRSJTFubH5V+B920Gvlgy37YLx/PJxcCmhUICiDY9Ood7uV1kirDA14A3SRA3nm9udKySCM2/Wh5SSPkwaMIY0NhT+Q6edv7qc/8DzJNV8odc93Mt7xlKeT3BixgFc2l+7jsW708FbgaTQ0+zy5e1YETCJfhyNjZJEpmnrzqRBHYqSCQju4OOVlLfIL9e0xl5rmtYwBQkF8WPIKa2A==
Received: from AS4PR10CA0026.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::20)
 by AS2PR10MB7837.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 15:52:04 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::63) by AS4PR10CA0026.outlook.office365.com
 (2603:10a6:20b:5d8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Tue, 26
 May 2026 15:52:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 15:52:04 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 17:56:09 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 17:52:03 +0200
Message-ID: <d2d5e5d1-2d03-413b-8935-b440faf9ffbd@foss.st.com>
Date: Tue, 26 May 2026 17:52:03 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics f4 boards
To: <sashiko-reviews@lists.linux.dev>
CC: <conor+dt@kernel.org>, <robh@kernel.org>, <devicetree@vger.kernel.org>
References: <20260526-upstream_uboot_properties-v7-1-e17cd424d5db@foss.st.com>
 <20260526094120.B86E11F000E9@smtp.kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260526094120.B86E11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000196:EE_|AS2PR10MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: cd752d55-a55b-43f3-a05a-08debb3ebb9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|6133799003|4143699003|56012099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	LjPhzg86upGQaPcCh6VaDF/bOEMrYncezTX+BCPNF0AfKP9r/ly/aVhWYWJVU3pwYK1QfKxihoFdFQCc/1h5pC3t1ewRrMNTtqDx8B5YQGQdUCWz3bljwLSOhlU1a/nSAXTwnFm6hDa1xv5tvIF6Jgt7rDCnyNDRnpXa7PRCWAnm0OjNoT3aSM//llWqJ1/mFscVr0YrQ3qtStW6Qkg5NdjHsc/nsVrpc8UUtARm94dhiYS5TjJbgkcTlT7CzC8yf4hY5CawvFFwZHOnnksavSwAWgJmNB9Gwn0I1tE0/OOMdWfM1cyS/2YImYn9yDAj1sU6HEoq+iRxPpOjDuVZhiP5F9Ed0iRr51Puv2cXG2naMrnTaxefL3xa99F4QE/Q7Tjprpc8KnQQ1R9/nYLm3j6j5xAC/+x8mICvUQNQl8WwFNkSBRHvDL9GXPjG6XEnrfNYzuXMysFa1TOKaFdCdqpJZrPsGrUC50AK+o9k7cBzU2uwq6jI0yH3u99ZrvJ3Vjm+Bc94rwvmPT1U1q9AD1q/SNNrjjI4u3P063P5UhbuzbagMRQG7oMzPvgAdhMxXcDKMKa2eu5RYv5lvRKs6nBnI6xSUNHm+s13tWqJcQ5I1sQZwd59d2jtJweRDtGgDRipFWyv7gMsBSG2eF8bbuPsRiq/jOtHtHi3yzW8CsGoueeGE2iRo07OwEFYueneZnvZihG7rJJeA6vCXnjhYotb5espJ4o2QLjuoyMhypc=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(6133799003)(4143699003)(56012099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cEE8NSmzBOYYDRS99Kq2NgjAbc04Rkd8+Y46RshXExCDI+ZjVz+kVI0ZHT6EKyKqtSDf0h6CMG6J+oXACkgGJ0+7ksFasBFTklKgWFzxCqje7S0N/a/Qg4CF7FAt2TnzWMu7chk0nqSX7YiFaWY5f1Oz9sgDjIrNmM3A+1WATceEa33m4wfGaezquPnwh6KJPqj6RsxTglvKBduS5YtBjE13fRmtP+pTfI9tRxVo4DcdD7VTJbg65uJloGAc1OgNMqWgkboKeVHAe0q3Hj0j1tyYrzRh3nuVL4qGKT1dt5Iwr2a4srEFOmGbyrG/aAqVu7QS8SNGz9KWgHoJJ1TZXq8+H5P0Xdl+1rJNxuOFyZ1L/+gAT4eustdMQP2fp5C+9NJEc22Tg7UBjB4RJp/OlBu5yd14XOWIDecPNeq4olifWEe4i3AaUCRP2iS4Ivcb
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 15:52:04.2462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd752d55-a55b-43f3-a05a-08debb3ebb9e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7837



On 5/26/26 11:41, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] The `&sdio` controller nodes are missing the `bootph-all` property, contradicting the stated goal of supporting SD boot.
> - [Medium] The `bootph-all` flag is missing for the clock nodes (e.g., `&clk_hse`) in `stm32f469-disco.dts`.
> - [Medium] UART controller nodes are omitted from `bootph-all` tagging despite the commit message claiming otherwise.
> - [Low] The `bootph-all` property is incorrectly added to the LCD-TFT display controller (`&ltdc`) in `stm32f469-disco.dts`.
> - [Low] A duplicate `&rcc` node reference is created in `stm32f469-disco.dts`.
> --
> 
> commit 7a940b6d4b0cb2432e629736b8cac85e1dd3638f
> Author: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> ARM: dts: stm32: Add boot phase tags for STMicroelectronics f4 boards
> 
> This commit introduces the bootph-all flag to several device tree nodes across
> STM32 f4 boards. It targets nodes like timer, gpio, syscfg, clock, and uart
> to ensure they are present during all boot stages for SD boot support.
> 
>> diff --git a/arch/arm/boot/dts/st/stm32429i-eval.dts b/arch/arm/boot/dts/st/stm32429i-eval.dts
>> index f4b1c4eb64f28..8a08b9f6b8371 100644
>> --- a/arch/arm/boot/dts/st/stm32429i-eval.dts
>> +++ b/arch/arm/boot/dts/st/stm32429i-eval.dts
> [ ... ]
>> @@ -293,6 +358,10 @@ &sdio {
>>  	max-frequency = <12500000>;
>>  };
> 
> [Severity: High]
> The commit message states the goal is to ensure SD boot, but the &sdio node
> does not receive the bootph-all tag here. Will this cause the SDIO controller
> to be stripped from the SPL device tree and break early SD boot capabilities?

The property bootph-all is not needed in sdio node as sdio is only needed after U-Boot relocation phase.
I will update the commit message accordingly.

> 
>>  
>> +&syscfg {
>> +	bootph-all;
>> +};
>> +
>>  &timers1 {
>>  	status = "okay";
> [ ... ]
>> @@ -339,6 +409,16 @@ &usart1 {
>>  	status = "okay";
>>  };
> 
> [Severity: Medium]
> The commit message mentions adding the tag to uart nodes. While the pinctrl
> configuration for the UART receives the tag below, the core &usart1 node does
> not. Could this result in the UART controller being omitted during early boot
> stages, breaking early console initialization?

bootph-all property is only needed for pinctrl configuration of uart1 node.

> 
>>  
>> +&usart1_pins_a {
>> +	bootph-all;
>> +	pins1 {
>> +		bootph-all;
>> +	};
> [ ... ]
>> diff --git a/arch/arm/boot/dts/st/stm32f469-disco.dts b/arch/arm/boot/dts/st/stm32f469-disco.dts
>> index 943afba06b5fe..ecd33d6003b34 100644
>> --- a/arch/arm/boot/dts/st/stm32f469-disco.dts
>> +++ b/arch/arm/boot/dts/st/stm32f469-disco.dts
> 
> [Severity: Medium]
> The commit message states the bootph-all flag is added to clock nodes, and
> other boards in this patch update their &clk_hse nodes. Is it missing for
> the &clk_hse node in stm32f469-disco.dts, and might this cause the clock to be
> stripped out during early boot?

bootph-all property is not needed in clk_hse, clk_lse and clk_i2s_ckin nodes of 
stm32f429-disco.dts and in stm32429i-eval.dts.

I will remove them.

> 
>> @@ -181,7 +181,52 @@ dsi_panel_in: endpoint {
> [ ... ]
>>  &ltdc {
>> +	bootph-all;
>>  	status = "okay";
>>  
>>  	port {
> 
> [Severity: Low]
> Does the LCD-TFT display controller need to be present in early boot phases
> like SPL or TPL? Including it might needlessly inflate the device tree size
> in SRAM, as display initialization isn't typically required for SD boot.


The bootph-all property is needed in &ltdc block as frame buffer memory allocation is done before U-Boot relocation.

> 
>> @@ -191,10 +236,26 @@ ltdc_out_dsi: endpoint {
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
>> +	bootph-all;
>> +};
> 
> [Severity: Low]
> Does appending this new &rcc block create a duplicate node reference? Since
> an &rcc block already exists earlier in the file, would it be better to add
> this property to the existing block to keep related properties grouped
> together?

Correct, i will merge both &rcc blocks together.

> 
>> +
>>  &rtc {
>>  	status = "okay";
>>  };
> [ ... ]
>> @@ -252,6 +314,16 @@ &usart3 {
>>  	status = "okay";
>>  };
> 
> [Severity: Medium]
> Similar to the &usart1 node in stm32429i-eval.dts, the core &usart3 node here
> is missing the bootph-all tag, even though the pins below receive it. Should
> the uart node itself be tagged to ensure it is preserved during early boot?

The uart node doesn't need to be tagged with bootph-all.


> 
>>  
>> +&usart3_pins_a	{
>> +	bootph-all;
> 

