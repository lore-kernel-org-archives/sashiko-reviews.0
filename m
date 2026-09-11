Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C239C414434
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 08:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114645; cv=fail; b=VMP8Wf7VC7nLsXMOVgx7I84qIKGScM0VIYCwk//G+B/1EXMWvTvZL2aqAhNRvy0H/vnTNc4QLJa4Qk0SAYpmYAO6eX5StoMfp74kpPzyjxzqWtmauRcGKHPCUUz4bgmgD8XSzluqREYcGZHtwhr2GzYsPBYaQ5t03VGBHVurfaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114645; c=relaxed/simple;
	bh=HWpQObYs8UDWrsJ/RtQLwwyOz7jsegQ01mDKNwwnM7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M/vEMqemkAvHJjC5esS8qOCJkBo8UvL+Wu5nDTRPesXALgcT9ysUhiZ64Gh3Kl7wsZXDPjgEooxbBfPY04qZSA6hehqQ4tpj9ourVGbTFKT890h1hWAFffc0u3zrOs1dEKsvpL9q3NwSPZUpCik465rnokHURo4BhnXpMVozbPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OIje1wXX; arc=fail smtp.client-ip=52.101.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OIje1wXX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pL+MlYv/5FjW2i/tF3YvOITzG1jZnghGbsSUP3ES2FUcv5fHHM1MpyQoBzlwx+ldxH5vZXiAPytDwKkb5vWz1S09q3ILBoWJbxKYCUjvLIE4eO6wsulyY6OfTYVhYHmhbl22JJ8faMfbEpKzdiPW4IwFMcOMc6Cgw6gxmtNWqfDaKSsZyZRHtTy+NeKjfdSobTLMKqGDs/2O01OPb/rxtfCb1soNbgbrJ12HZDPhJ8K1yfE7k7XxEt5HoAEez1TOIK1SdndVRL/SGp5WhKXl/c5a5wxjYchTt/bzzczJdGSXM2bDj8i2a8NyFa8WdMdjEsYYrbpJJMca0Z4/wZpysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nkIc6AWuaKqvy6+k9kiaTJXSqCSJJs3/DH9VsSEYa8=;
 b=wjR40XejAv3T9t/RyEpfpAX6Viyy6JdNZoPilXhTmfu9XnH6x3eAG587ib4D+hEnIdEC4Yq+r8v31fqMdVgof7lNlO7WM1O0J18gI18XqrbhmtqbvPQXGhCO3g2/Ns6OjVZbDVcLG761/C6YJJiZEPKIC56o/qY1zTRp7Qh3Zn6K6apPw7znsj0fn0t2PhYOfPbxgYBmyomSRrSjnFp+To6xQeKb2zj9aFIClCcdxHnALcda6Sx0jQHO/UkOgPzga4277Z0MgwZMgkDrGEJh7/QacO1iiiEJTRSBSMx9ybiGXk/FG3Z/OSpCzwJ0bxZcfsnmuPvtr3y6S5B/L9sR5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nkIc6AWuaKqvy6+k9kiaTJXSqCSJJs3/DH9VsSEYa8=;
 b=OIje1wXX5+pubfwjvp89GQ80uFnRRNWwx/ELrEvSpfjacFeWrX++oCHq36hzxfAZSZJdxjg3HcrIc2HPjUXY8fjC/88gqLPVp1dd2OTP3aX/s1uq/t11vC3pRIVW2m7ggCygFGYGZFljsZn0+hTC3+SQm9tZynQGsxu3lBljQ83mW2mVgFftwfPyk3to4YCH70Rh5R+IC+9Tq6Ik4JoIH47dHILIAhlcg5R4n2I07mC73Ph1HkCCR8ei7RahIf/PT24xLGFsSksgkwqoPNfbccr2jrGG16vwznPbfYMO9uWCl1BbaCG6nyyycfI7w7tTmxSgdH6TXiO/TYn9at+jlA==
Received: from ZR2P278CA0072.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:52::9) by
 PAWPR10MB8282.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:388::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 08:17:15 +0000
Received: from MI3PEPF0000848A.eurprd02.prod.outlook.com
 (2603:10a6:910:52:cafe::3d) by ZR2P278CA0072.outlook.office365.com
 (2603:10a6:910:52::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 08:17:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000848A.mail.protection.outlook.com (10.167.240.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 08:17:14 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 10:22:42 +0200
Received: from [10.252.12.102] (10.252.12.102) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 10:17:13 +0200
Message-ID: <5593c9ac-7e63-437c-b2c3-e52012538bd6@foss.st.com>
Date: Fri, 11 Sep 2026 10:17:12 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARM: dts: stm32: add TAMP backup register in
 stm32mp131.dtsi
To: <sashiko-reviews@lists.linux.dev>
CC: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
References: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
 <20260910-upstream_tamp_nvram_dts_part-v1-1-e2bca58a65f4@foss.st.com>
 <20260910152936.59E461F000FF@smtp.kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260910152936.59E461F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848A:EE_|PAWPR10MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 22493864-52fd-47a8-7395-08df0fdd1687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|11063799006|4143699003|3023799007|56012099006|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5VCU99mp06+yJ3GFSnbWEtcbm8oWF+RQT6b7hx6Z3M9uKHkfgNZFTu3w1qAlFPJeu9lXgiCdT9rquhz0UywyGbaiJiK02Re4i86snNEDkRMZdhyTO9e+C4LA4vTf2AR5gXgSKqRb2uW9UqGVy0zMkPl77jYHNUXemYNO5v+ojSn1T3Yb7t9/W4zi2ZOghmTZ3RK1ntgXx6CI68nuyDRu8v47gstkndSSnFt9kM2JDjO5PKRJ3Cgv4rHS7DcBZFV4A5Yy9bcSv7D/KEziM3aoBfHQiYNNAnqHp6fo4XqypX2gmhs6RxSY/FELHjCAtmdPYywfq1yMyLbR5U8uSpmuNXL46dSTeJhRjWUvIZczqAWQGwRTRYGGSZqFxLnXS0ACI1WJLDV+UKFujZ4+RxH0V5N6bypjnojRb7V2QMGh0qCMO5t9BR/DI7pz5AdPxJfw6u9eB6XIx/MaDVBO3OVggW/jDHrbNk3ocVbdc3YgmVzKOVDKtNNXhiZw4Enu2Q10Cd6L4KtUp+oxpSyhRQJV5nPF15LNfyFVKZaaBkmZ+XPDddtDmj86YvVR4LJWjdBiTCEmHqzKUhldOJ6H1KCaz9DcqMpLZe2YWMU87qnSoi+2gHna4ew2Dcdcdvc5cD5t9vHH6ADNBrChAFW0VKmcPQMSDDWI9a+VrMaLinbxpW9VU0FAu5XsE0S+gImC9EdOYp4VYXyWNrF2Y/+eXFJ5OA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(11063799006)(4143699003)(3023799007)(56012099006)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PhD6G23POoERQF9b1gm6Aei49ZuTnmCnQk7nH3s1Z7y7v6/NPvsWzeQ1zt2rX3k816PuicM5XGvQ1efCNfjpUVqnXG1xzGTv5ku1FZPYYtYgrnk58UWeBDvDjRskJIk+YQOOf4NZXnA3rv/D9lqWNebccU5OVKvPpp4Nd1pUOGbsLbBxa9i3MuyGv3U5Oi1rybDRjbT8IwSQe1/ot+pRRI6FPRRbo27/Nj6AtgiHUZ7VVS34l/oRYOsrHiTRZS5q4rqmQDcRvCzmAtz5Khbj9Diu7ugki4B/Y5Ylt0709EUQB+rhygVemMm6lH2EHePbC98wSCbaMlpl2AKXO+DCkC3g0wCibuHd/lxE2EFWnI9xSEiYmMq5ay/qLeM3iCjhWGnN/7732Zk9LyJeycx1exGzuXGi6pSGVEIYI9tUV490MwnoXoUyG9ooto1iZlTT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 08:17:14.9302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22493864-52fd-47a8-7395-08df0fdd1687
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000848A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8282



On 9/10/26 17:29, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Adding child nodes and properties to a syscon node that has `additionalProperties: false` in its schema causes immediate validation failure.
> --
> 
> commit fd4960b03c2c4e269bdd41d3965ee803d12b57df
> Author: Simeon Marijon <simeon.marijon@foss.st.com>
> 
> ARM: dts: stm32: add TAMP backup register in stm32mp131.dtsi
> 
> This commit adds TAMP backup registers as nvmem cells in the stm32mp131
> device tree to allow information sharing between different software
> components.
> 
>> diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
>> index 83ae59b73dd09..b37c22b1379cc 100644
>> --- a/arch/arm/boot/dts/st/stm32mp131.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
>> @@ -1918,5 +1918,39 @@ gpioi: gpio@5000a000 {
> 
> [ ... ]
> 
>> +
>> +		tamp: tamp@5c00a000 {
>> +			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			reg = <0x5c00a000 0x400>;
>> +			ranges;
>> +
>> +			nvram: nvram@5c00a100 {
> 
> [Severity: Low]
> Will this introduce a schema validation regression when running make
> dtbs_check?
> 
> The matching schema in
> Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml dictates
> additionalProperties: false and does not define #address-cells, #size-cells,
> ranges, or child nodes like nvram.
> 
> Does the schema need to be updated to support these new properties, or
> should they be structured differently?
> 

The schema has been updated by this patch which is under review: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20260910-upstream_nvram_reworked-v1-2-521c16175cef@foss.st.com/

