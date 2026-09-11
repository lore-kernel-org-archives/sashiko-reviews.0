Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609A843F4BD
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 08:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114739; cv=fail; b=i9bJGSG3BU9d4e3whBeTkO1eGTWeWSqGY+rYcyKyqEJvJSJTtNtiQSmbwxGicr2htbce4HOy4eQ1EmHmyADdUkut9UZv+ku81GI/NJUQUqhtIYvTHU1ry8JgUqsUNkVT/Vw8xj45ipfHI2OXkMt2J3st2c3XJtnH4HWhDRIJAL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114739; c=relaxed/simple;
	bh=VRCPk5KFw56+LoPvZ8JXlBUsMCYkv8mbmJUaz2B2zgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eXzxfvPFMyuJZ0VfWGvl3dG57OYTKpugyp8GSvNNtj7oTHZBezfIlr4CgGTa276jAprezy0xXZxRRP7t8HMYMexUAXhhCY4zefybanio2ySAD9cMjrIVNd9NWxOn1hKcEpNdjvVZcuKcH6bbOrdaGmPEfeX0o6tVdq2cPMM4p8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=K2NDsazV; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="K2NDsazV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIXulKgAINdcAFN9SAPHemItEnpKiFS0PSgrA1nUch8c94wx1ad5QhgttDp1ePO3E/uuf4NrEBATigFGZnkxb73tfCnXboK7r1RSHCs+uFX+8soh9WfhfIrFS5cMmBrpBA1SkLuyt3mUVLwFWjE+wSFadcFdUjfB1at7ZszUMQexc9Ua8AAVuaWKpJgYd0JV0bY31/zULZLOf5f0Gh5NqiX1UfFTM0ceVcVlKuYF+MEYhV+sPSquDHq7cCf+pZxLS8i6pDYvRG5PS0D9e6y6DVexdp2nTFqhUtl5gM69uFI4RZ7xtkq0e9299WSE4eLtdv1pASCpVWZtogBuetagkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76LEf+CsrdRNo2c4fJHmloM03r/15RWoIeAwm1vMIPM=;
 b=Byn2FcEdoSHOnCnaYn2MwUX+Axk77MKzsRpipzoqLBEn+GZ0qd9Q88IMEKxa5e0lDLCpC5oBMS3n3fiCGxJjAr3SouFkTNO9bwMWpLOe1HiAHA/+eN2k+snrWtuXagPK8InwKf1qUMtcioVBN677TdruVtHZCfea1y8zYnJVeYcnADjxu3dl6aGi61LJuUrcTjyyPslT58gXLgZo5mIBkv7TgQLmVLCAZNbi/fKssPfVO4TauMpoldbTObmzdAXMlMVOwr8k+zct5j488fcYrBZNCoGrDQbDZyzEtnTAZcBnlV9Etw/fULpz9pwupWnkZpPz1+RdjMeHeE9rXr74Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76LEf+CsrdRNo2c4fJHmloM03r/15RWoIeAwm1vMIPM=;
 b=K2NDsazVtWYGkuWhcMrsJyJrzYnTysQfNBTeV0r3FuZae2zqnfKxcYGSjk2OMRYW8Y0VxmqRBmAzHu1D9hEbWA1oTMt/2Oqrfnfcichlh+P/mkdQATy0ZFV8ImLcmU2sQ2CWGMcaLsE+pkIFs7e7V4SzkZbjduh59+xWbO9rVNVYxN0bup9QRjzVohzG7TBLj3eWezLrlbP4vOwiVu65Uni5yqNytO92zRqpeFPShFVqouOJktL6DFrsYx0tmOhIEVhyD/xB7xsx7ynvXaLA+tRq2jtO0rfopHOFIJXO4HkzzxX6nFf1IDhYuPqiBZeshhRlos3YDkllDWyZ86Wokw==
Received: from AS4P190CA0030.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::20)
 by DB3PR10MB6812.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:438::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 08:18:53 +0000
Received: from CPH1EPF0000051F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::93) by AS4P190CA0030.outlook.office365.com
 (2603:10a6:20b:5d0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 08:18:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 CPH1EPF0000051F.mail.protection.outlook.com (10.167.241.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 08:18:52 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 10:24:54 +0200
Received: from [10.252.12.102] (10.252.12.102) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 11 Sep
 2026 10:18:51 +0200
Message-ID: <702db76b-fb98-4944-95c7-b050f19af5fc@foss.st.com>
Date: Fri, 11 Sep 2026 10:18:50 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ARM: dts: stm32: add TAMP backup register in
 stm32mp151.dtsi
To: <sashiko-reviews@lists.linux.dev>
CC: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
References: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
 <20260910-upstream_tamp_nvram_dts_part-v1-2-e2bca58a65f4@foss.st.com>
 <20260910152630.428241F000FF@smtp.kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260910152630.428241F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051F:EE_|DB3PR10MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: a6651c93-d3c3-4b53-446b-08df0fdd50ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|10067099003|5023799004|56012099006|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	a5tyWoZ+C1/7x3H1XLG3xs5dNY7G1Ql6dpaHv6LXaouUlc85p9+2CtNCaQUlF7+ivynoQMTrUhh5zNOVJbHk57rVZB4Y/bgl0QBNCZFELj3IWwyu/RIW+dfXx2mH7OYpVWljWh72VjmMkYIDvaNwch7/Xcw4TjWyWZL7SpnU3bMyFH2oPEABFNUEgHyV/W8Oop8RvcShIEBwuCr+oD4FGRIu8CnZH7WW4EjeVzNM7vPU7/pa9QDJCoF+qBpvdjcA5bdvzDLYp07f3F60eF8iJ/mz7wwSNNOZLzAwRWziQDbwIITv4htKZc8f9pjj9VDPK2A97hTWU4ys4LBg5WX7ukOPU282zpRKUw1pDXgG6m6j2bDmcxJvC4STgiqVX12u9qta5QQdYgx9lqQ15QbjPohmPuRpt/8d2yk2YHjQtRMcHTTIOrpG5vcXzzMXbZjyVtAbZOaOo6hvWu1p5bUsvzsL7+l0kPxVCRRFIMVqwk64M+rAjPI57PQ59NqSOwwO8qKGXco9nDvu9/f87Ctl7+wXZ2KfW1wZCXbKhDCg/2b5ZVA4kQql+BpbvVIWQTVB72wjNyXgXCMWVmTjBE45EVyAWaIDa7P93z0GcODovsUNKdcmkqaaNa7cgE1SbQZ2PdUXZo6ubSSp7FGA8n91JR7DguLgomL3p8xj0RtTbA2ZZkP2Eiplgq8VNAxW1C4xRpwwRfyH1QIEU9XmsUYrHw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(5023799004)(56012099006)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q5DUur35fDAD6q22jpqNZSVWMoXrOGnA8zpj6xidLIl6qKaF/W+kOorj0t2Fq/3oMU4O6aytoskEPlQxDtIaVqeCZH+s21oFo/iuoyNm/QYte7Kg3DF5tnZf/RVZeZfo9xgCaIMQceCyv/dRU2o15CymWec5T7Ya3ErlA0NHohnlNcWPop82Spd5LXJrbDuNjo4CC8/5imk1hYkmZTtq02o3OYEAQ9E7DuRu3OWxSZhzV+CmPBRcUYFUmSnPG6f2kx1Jnhku/agvepH5jByadlnokvD/x6srqJOc7lECXAg5ewYWvc9LsTAjUNrQb/3rPsBh8GqDAPY6fBTTUU6xLaH5YpSh0j4WLU5y7gkUN7x/VRBfTsPvq5a7DeCDJRwcZtsecl1rQAGFTD8/AK/sMHJ4DZgtwf51hLs6MasCKSKaL0fDujWgc+QBHSQf5fOH
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 08:18:52.8928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6651c93-d3c3-4b53-446b-08df0fdd50ee
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6812



On 9/10/26 17:26, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] The compatible string "st,stm32mp15-tamp-nvram" is introduced without any corresponding DT binding documentation.
> - [Low] The comment 'SHA-0x100' is a corrupted reference to 'SHA-256', resulting from an accidental search-and-replace of '256' to '0x100'.
> --
> 
> commit 143934b850adb47535f66b1f12ec54c5c90f65e6
> Author: Simeon Marijon <simeon.marijon@foss.st.com>
> 
> ARM: dts: stm32: add TAMP backup register in stm32mp151.dtsi
> 
> TAMP backup registers allow information sharing between different software
> components/execution levels. They are described individually as nvmem cells.
> 
>> diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
>> index 84f68e8563d85..0ad75e0108394 100644
>> --- a/arch/arm/boot/dts/st/stm32mp151.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
>> @@ -2060,7 +2060,89 @@ i2c6: i2c@5c009000 {
>>  
>>  		tamp: tamp@5c00a000 {
>>  			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>>  			reg = <0x5c00a000 0x400>;
>> +			ranges;
>> +
>> +			nvram: nvram@5c00a100 {
>> +				compatible = "st,stm32mp15-tamp-nvram";
> 
> [Severity: Low]
> Is there missing device tree binding documentation for this new compatible
> string? dt_binding_check validation will fail because
> "st,stm32mp15-tamp-nvram" is undocumented.

This new compatibale has been introduced by this patch under review: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20260910-upstream_nvram_reworked-v1-1-521c16175cef@foss.st.com/

> 
>> +				reg = <0x5c00a100 0x80>;
>> +
>> +				nvmem-layout {
>> +					compatible = "fixed-layout";
>> +					#address-cells = <1>;
>> +					#size-cells = <1>;
> 
> [ ... ]
> 
>> +					m4_wakeup_area_length: tamp-bkp@5c {
>> +						/* see cortex-m4 wake up feature */
>> +						reg = <0x5c 0x4>;
>> +					};
>> +
>> +					m4_wakeup_area_hash: tamp-bkp@60 {
>> +						/* SHA-0x100 value see Cortex-M4 wake up feature */
> 
> [Severity: Low]
> Was there an accidental search-and-replace here? The comment says
> "SHA-0x100", which seems to be a corrupted reference to "SHA-256", likely
> resulting from a bulk replace of decimal 256 to hex 0x100.
> 
>> +						reg = <0x60 0x20>;
>> +					};
>> +				};
>> +			};
>>  		};
> 

