Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E12424169D
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977734; cv=fail; b=X8Cdpqwl7fsRzigfVBHVfVD0J05t1msec8o2jKzFdvb/7Bx7m+tAIIpLUPoHq0ab6/F88Cgve3ZkIfKAdcQYLF7F85XNVIVm0cwZsWkePDq9o9BBQKiozMZ7IqmS9yqSNGsyMOj+NJ1vvXggkzCV3U60OsJtD4BsM4cUIUNksgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977734; c=relaxed/simple;
	bh=XY+sjj0T8ud/ZZZMQDwvcpEja0udkO6MyqTYhfqLrVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YY3W2t1/YiTcwGgNjZXQ86IkCxHnZT2CsW101OjSbEAvkZHyqXEuXlb+iMkCOzltreHCBJJ7sWbLGK/bnUjcFKh/uv/Ob/UMSVj5Sjgcue3nuRFRQLVSlQxB0r5U+Wa3Qd0874WGmL5jlah9U2CxmdPXzYsmWWdXiRf5ZRuTGng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=G0ktvX2c; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="G0ktvX2c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pK1/V/lsNaGCdBnqVt124yuZ72nf6S+x0kCTg1F3fkzxEVn7wUg7NlXnZgjBpVKIo9LMW6p8hHW5EumhKXVEjJ7eRzZcrDOdunbKlOdbrcgSgT4fAQUnDwpwEmQF3LfcoYnlmlCyVP34r/zm6Ih+e6nTgMvc6TZa/Ymdi3hnJKEGYfNNmVo5+UFnc6ZAkQvGQY3qFG6LfvyQIuREj+lR17D98sfdg2KsQ5i+0WKUVOspPF5LBmoHmRtllk7VSpVD10hVVv4yz33H6hPbQtQpmYcIeLmDKu1Y/ls25Bhhj7ho8FEgYTOj/I1Ha5vib7KVM+UVMTlne2qT9jZiTqvxRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT3ZMT/KpybQs8eKdk5gA3GpHYirByCCZ/VZiRK0KRI=;
 b=Nsc2e+u56lvHNPC1HbL79WyC7bWCxv0ssUep1nAm9R07EKczKvH4GMHwIjYa19YNCkCI6NxmOJ3IaB6ptNKU+MOoMNRzEcBCwGuueNgs54av+BzPkx3KZ9a6n+TGcVuK/LMsnl8MACxYYedB5aeDEeY2JEDFYopiU1hAn3LTkxSOQoBe9fW7nqRRyxWn7DXbBG9W09QrYuiNFpL289CEBW+koF8rQBvB6smbyH59ha5AUynTBfMgaduVgNEVqfLpv/QCSL4SPn5wMUeO3D8ZcGT9aITGN+oRxFeNFHvFHYCDHR1M/vU7VCHX/mFU6/Q2jHkOfh4KH4p7Xw4dAR16cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT3ZMT/KpybQs8eKdk5gA3GpHYirByCCZ/VZiRK0KRI=;
 b=G0ktvX2chIXKG6KeZEM1tn263oBVkjkxoxcD/bi2QvuxC+ZQkDfyb5XECBmV80F78H9Gvm21RZwaVW2Ow0xw2t2LieqmkGK4D+xEre7Tw2UOG/bYwqZsZLbsg0mnlr77OYm/bhXdEnp5yoM4tYzXfcjKPr4rhobafNsKOh/UF+Mn0QXnqx+RvEG3VMBrBdG7VXKjEazvi9cylj97fSZfJTC+sV66zAxWDqiepwetMIIbdqrosXdcT4/2Xypj9gg6kauABt/4hVxUrIokHvuLkyXCT16OA8FdSThgw3N+ALp1eH/TDQVp2LfFf3YkZEWVbxtbfXk03Q5DnR8WFHGjJQ==
Received: from CWLP123CA0091.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5b::31)
 by AM0PR10MB3555.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:157::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 14:15:27 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:401:5b:cafe::62) by CWLP123CA0091.outlook.office365.com
 (2603:10a6:401:5b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 14:15:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 28 May 2026 14:15:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 28 May
 2026 16:19:04 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 28 May
 2026 16:15:22 +0200
Message-ID: <8f6c1930-5a75-4cfa-bbb9-ab02f48b560c@foss.st.com>
Date: Thu, 28 May 2026 16:15:22 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics h7 boards
To: <sashiko-reviews@lists.linux.dev>
CC: <devicetree@vger.kernel.org>, <conor+dt@kernel.org>, <robh@kernel.org>
References: <20260526-upstream_uboot_properties-v7-3-e17cd424d5db@foss.st.com>
 <20260526100231.395191F000E9@smtp.kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260526100231.395191F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A791:EE_|AM0PR10MB3555:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d0ad392-5b2c-40f6-8c69-08debcc39114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tuIc3o0/wl+EDphq1H0oADhXfUAGnQhK5Z+i+3MynG0v4NkxMkjautI4zuXMwwaJBFUwQTL38j21Exl//g9KSzyXIScyu8uMpfqNkV0ziUyQ9iPfQl+JzuxsG4gj9xrDobdhFr0DK9/Leost5FpSHpmpMogZb/nNX4JrQthflbABrpPZLAV7wcv7rBQ3JlIqSnBUJRMGL2oMT2bRCf3yRhXW7NtcZ6/D2n0nUw8/KD+vnzxX15WuU3xAvmVah8FK+agRaJGcczfaY29IWqg2HweGZAzwQVGWoctACYpNp92eqgJIYtp5culamrT7WlZadTMJqCiTuZpz/FMaQG9de7I+Z6arKRor8f+1qe2SN1dtfcFi7nQiZG0qWIcIiFko3vEtRHe2mMxpVa2p+YAX2jA6gDt0yhkQdkzvXZv0ZAY8cjocJgGvLrgtRCZdMEmUYpi1H4FYq/BPvPxvlAb5vOq4j7ti7FUu43Rv0D+uq8AveAd2h/0VF6oh6nUNXI/HGJWNZOZbAhHo4kfH3G0H9D2FN6tkvwPoMlxGMufCJ+dNse3XX4KoZL0SfYpWq6MRM5u2fxwEcj0Lm6pX+EaTRPq1VHeNeiEXD6jAg+2dcB/BKgIjwkZ+7trZ7sC/mpjRj2yfgDNxXptNkNn5ldhIhrCK3B4DyE90UCLb4sf03xd2ri8oNMOAkC36ZIbVSSNvyYlzw9zRsrcfiFKAhMihd3yLlFk94k2RklW2g9e/Y9w=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VdxBpApwzAPSdZbqb3BtS54LpaYUwFErHTFHtGwBFmJxt39bhed/s1nN4ToW/3bzsuHT8RJdhv5yNIrW91m/yjH69ZElZ7HEOmnkc22SQEyIKJovFvwJwTl0P2YaOSX5sYqfBLGHWO/uzkyHObeikIwpm7NiWkKG5QtSVaV8xZwLqfgaG5MNEm8ZKS6hcpFKQnLtOPaJZGvFIWFU2RynVLB8fmg+j2wLxqjtMD1OEdTj3ugraWlPBJNfj3RZobCGVqoHBz9VpohSZsisNdrnv4EwPThqh1iWcAYZykQE3WPGczPXm9wRMjHZkWQvOws+/ktHGwrfmv+AE2k88rS6AFREykiEGIORJzM0+iOYK0+ccPps4ZNlU4Qm5VgpZQe2c65YTZIBRxrMwRd1epEO9KPyBJ2NXrlsC0mvfkaRpXH9LkO97FMs8B/urUhOP9xd
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 14:15:27.1080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0ad392-5b2c-40f6-8c69-08debcc39114
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3555



On 5/26/26 12:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The patch fails to add the `bootph-all` property to UART and `syscfg` nodes, contradicting the commit message, and modifies unmentioned nodes.
> - [Low] Incorrect double-tab indentation for the `bootph-all` property inside the `&timer5` node.
> --
> 
> commit 46ae77600efc54228af475f90f412a5aaa703ea3
> Author: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> ARM: dts: stm32: Add boot phase tags for STMicroelectronics h7 boards
> 
> The bootph-all flag was introduced to define node usage across different
> boot phases. This commit adds the bootph-all phase flag to several nodes
> to ensure SD boot is supported across all boot stages.
> 
>> To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
>> present in all boot stages, so add missing bootph-all phase flag
>> to these nodes to support SD boot.
> 
> [Severity: High]
> The commit message states that syscfg and uart nodes are modified to support
> SD boot, but the patch doesn't appear to add the bootph-all flag to them.

syscfg and uart nodes doesn't need to be tagged, the commit message will be updated accordingly.

> 
> Since the pinctrl node depends on syscfg, if syscfg is missing from the early
> boot device tree, could pinctrl fail to probe in SPL? Would this prevent
> SDMMC from functioning and break the early serial console if the UART nodes
> are also missing?

syscfg is not used in U-Boot STM32 pinctrl driver, so no need to tag syscfg's node.

> 
>> diff --git a/arch/arm/boot/dts/st/stm32h743i-disco.dts b/arch/arm/boot/dts/st/stm32h743i-disco.dts
>> index 78d55b77db7ce..1b4b9bc5c72dd 100644
>> --- a/arch/arm/boot/dts/st/stm32h743i-disco.dts
>> +++ b/arch/arm/boot/dts/st/stm32h743i-disco.dts
> [ ... ]
>> +&pinctrl {
>> +	bootph-all;
>> +};
>> +
>> +&pwrcfg {
>> +	bootph-all;
>> +};
> 
> [Severity: High]
> Was pwrcfg added here by mistake instead of the syscfg node mentioned in
> the commit message?

pwrcfg need to be tagged as it's used by STM32H7 clock driver to configure some power registers.

> 
> [ ... ]
>> +&timer5 {
>> +	bootph-all;
>> +};
>> +
>>  &usart2 {
>>  	pinctrl-0 = <&usart2_pins_a>;
>>  	pinctrl-names = "default";
> 
> [Severity: High]
> Did this usart node also need the bootph-all property added to support
> the early serial console, as mentioned in the commit message?

not needed

> 
>> diff --git a/arch/arm/boot/dts/st/stm32h743i-eval.dts b/arch/arm/boot/dts/st/stm32h743i-eval.dts
>> index e5e10b0758eea..55674fe054311 100644
>> --- a/arch/arm/boot/dts/st/stm32h743i-eval.dts
>> +++ b/arch/arm/boot/dts/st/stm32h743i-eval.dts
> [ ... ]
>> +&timer5 {
>> +		bootph-all;
>> +};
> 
> [Severity: Low]
> This isn't a bug, but there appears to be an extra tab used for indentation
> here. The same extra tab is also present in stm32h747i-disco.dts and
> stm32h750i-art-pi.dts.
> 

Correct, the extra tabs will be removed.

