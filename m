Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012057.outbound.protection.outlook.com [40.93.195.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193373E51FA
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 11:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779968498; cv=fail; b=gJtx8Thn7qcsGGuZshA0k94U7gqX9ZRs+ogV/xQ8loG/jf+dXc95VnVbn83JN/YrswavdXYCBDHIp6ur8bSS0EX5/r3ynXjl+S7ucFPXxrYrZUwSE5gjfEbInyI/JFTEcWeLMbSZ2Qk1CPlaXWfdx5vR+UTsd0ZvE3LzN5bv/eU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779968498; c=relaxed/simple;
	bh=/gUiBgNCy7zaeryT0MUGpnLVEzv0tzCERPSR/Wsov88=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JangN0Q49KBM8NtgGVUX50d+4Cx+6KWU8zSf4971nPDFkqPPPgIathRsJpd0rkQnqpd16W4KI5oNs46STifNzrNU04ITqF+NVkPUKojMdkNMnRBId3HDxebADNDXxHRO76p4K9D0VrpcuMBEKuGCTlPneutPwgSDsCOrAjLsUnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Jd+UXCQf; arc=fail smtp.client-ip=40.93.195.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Jd+UXCQf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UytPa2fpacZmp81IQSagFD7geRtpbSUtIoEM95zeA8IH4lwXaSynZf4SN+hdgntiKBAdsVd4s9zoE7orAzPubodGTmh6z6CMlIshMDQifeut64G83plLMrEjOd6joKwNStyTFYRGX458Gr5eMWYDEhWCI5UV7PqfNqGZrogMbB5FEjLCKzvozkds5b+MTf7J4ZUhcDmUlUEt2g3KctqdQL94vi6Ojw443AFap45e4eWFyX5GhtlAPe3Uz4R26xhc2r10Y6g17z/t9PSvenRgKzQk2LHjmsbbFc5MXmoAOgnbwgLdQM3LtJvhrEMQm850ojT4bdMorMEk5ye5kGScAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXSRz+lKIfTTBx1v7vsbrT+UPRM0rl31Z5Fu/qkOUFE=;
 b=dTmT/Wu+6aAb08B/rUE1il/PyaFHtaasu14Ak7iLHkLrGclH1hqxR07ATwOIqct4e6n3oDtNGmt17O9sDRyM4ThTQNS5AkBubcTMOnnrjrSmgk9hkHKIA8/Nw7ohmdsiOQUAu9z+G7neSLeJnPPgB4XVR8CugwKhSVcvKW8qAjMLbnyMGEjutffeOs4+N0tKpeoRhQsUl2RDDHW3SlVlqZ50S4h68H85sXxs4wbyVfUULJa01o5PO1VsOoYBE7pbobDqC7sL9qiC2vokvV9/1FioMAgGzgRBiG4zzth+rZawPZzYCbNt6+AgBqimyfvAbS6/h4aYs+2rJwnR+Fbpeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXSRz+lKIfTTBx1v7vsbrT+UPRM0rl31Z5Fu/qkOUFE=;
 b=Jd+UXCQf69nkfrVICSGM8KA3YxVERDI/fTp+ohJSlPn6so1/R6Pl4ODs7qbvWEF5LHGqVi1tmj5KblMLsF5hVu58L9OKQjD0ilorOXgWHswKshw8vTIZOE45JJKzUGbLPYxK/eDXFWZfVVojluAG2G6pr9G4OatapZ8jz2JwsAQ=
Received: from SJ0PR05CA0092.namprd05.prod.outlook.com (2603:10b6:a03:334::7)
 by PH0PR10MB997689.namprd10.prod.outlook.com (2603:10b6:510:384::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 11:41:34 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::15) by SJ0PR05CA0092.outlook.office365.com
 (2603:10b6:a03:334::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.4 via Frontend Transport; Thu, 28
 May 2026 11:41:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 11:41:33 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 06:41:32 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 06:41:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 28 May 2026 06:41:32 -0500
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64SBfUpB1970859;
	Thu, 28 May 2026 06:41:30 -0500
Message-ID: <9cdf0c9b-97d7-4a98-b3a3-56fd31384131@ti.com>
Date: Thu, 28 May 2026 17:11:29 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62l: Enable HDMI & DSI display
To: <sashiko-reviews@lists.linux.dev>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>
References: <20260513210942.692269-1-s-jain1@ti.com>
 <20260514112012.0B0D0C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20260514112012.0B0D0C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|PH0PR10MB997689:EE_
X-MS-Office365-Filtering-Correlation-Id: 10860ae8-007b-49eb-bb74-08debcae119f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|4143699003|6133799003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	+fc0Tg+AfWSDunvlV0CYx+J87UmXaY4X1KimkCpBFV+m63X69fpPBvXj/DCX+uoA1rcp3cIPZwqf5BTHNkn9vTDFS9u7s51LuWOMKsOW7bCqFjE7QN43gQKPJ4KkgO0J5MJ8KeIbTJ6tYPiRzSNtuBu31Ryy9h/YJgzVDfAxyxiJmvPlX0/xPYO207x0rbKHRXJIlt79oZUPgfbDuRf8kZvxZvMZHBLCxk3Xo/AKg3i5xNhUNmxkI9DZ6Gxn0ppCGI6z6F3X4szN7wEQUMaIEojs6Peezek3V5b6rXETETIry4PPmlI3UOk4SgZYWZN34Gpfw6nR/FD8GKUVCaQIiGv6el7+OYlpEsYxL8Tm4bNSwQNjSkePTb+viWxglLCNmNMAEOvWt8urx1txLeJPvgpyNo6gQHGAatZ6ORd5iSTTUCCf88jUtrKNsyjL6S3F8b6HNco+ncCcFmU/zkdgReutts2iYl/AJ0JZs/5210CF0w1G/n2VbvC8Qj+Cx9McBfgsP6/0P2Rjqt1Mf534sRA9jZTwjDxu1fK8FSq64fnh8Ni0aKtzFTCKgq8gkV6Zd1lX+JwGoY+m6n9QBgAvgXgwciALAqOcjxT6a2tm0WbfOlt2GgpQFejfLux2yb+z5cWmuc5f9pSglu5aPBjyZ1rpc5HMdaNkaWeu5sl5rss/hT1NUYUwPL+OwcHGHGsCmBD95zMUmWwhYlq5x8o00zzm2HsS9eTN1TDB2sm/U70=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(4143699003)(6133799003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fb+bVxW1unAoKDoXdHmkenlhjTYZ8mpFuLvzmvVxciNygJbnIIoKBHkc6y7LVzK48iDiJ8pgWdrQsw7YUsHGo0rlase19CUaI2Ux647apMuctNUG0Lc4z+D1CnN3Un0dC+3DSZH4nK42tJ0YtEvo8CyRaEIFO9NE1YkndQRRlY8L3ctaUKa64626bmC+OD3HB1RWC678TIvWObO6kVLXthAbZTmB2vNlChS9No0I8iVUrA8vDDfuDJ57xIyBwouu31PM+xWHG4mnYmNzbnatQxhfWYA/nINeHsPn5M6mtthuIjr6U+e9XeM40K7ZO5TYGVykmhSn6qPLbAW1hyXO2+jG9iyZ/z4paG7C1fggfgKh58LgHET+XvM7YBy7MMP6WZ3yqE3exUrZJofm4kiBr1CklEi54SydnkyM4NPFClgyPwq1X/6nD1LrfO+GIiHC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 11:41:33.7843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10860ae8-007b-49eb-bb74-08debcae119f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997689



On 5/14/26 16:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Missing pinmux configurations for the DSS DPI interface.
> - [High] Hardware IRQ routing mismatch for the HDMI bridge.
> - [Medium] DSI display nodes are left disabled on the EVM.
> --
> 
> commit 83fc36958520450910c6fa0df0ef01548f3f6fd9
> Author: Devarsh Thakkar <devarsht@ti.com>
> 
> arm64: dts: ti: k3-am62l: Enable HDMI & DSI display
> 
> This commit adds DSS, DPHY, and DSI nodes to the base SoC devicetree,
> along with enabling DSS and an HDMI bridge in the board devicetree.
> 
>>      arm64: dts: ti: k3-am62l: Enable HDMI & DSI display
>>      
>>      Enable DSS, DSI and HDMI related nodes and pinmuxes.
> 
> Are these descriptions accurate for the actual changes in the patch?
> 
> The dsi0 and dphy_tx0 nodes are added with status = "disabled" in the base
> dtsi, but they are not overridden with status = "okay" in the board-level
> dts file, leaving the DSI subsystem physically disabled on the board.
> 
> Also, it appears the patch does not add any pinctrl properties or pin
> configurations for the DSS node. The DSS DPI interface relies on a parallel
> bus that must be physically routed to the sii9022 external HDMI bridge to
> function.

Yeah, the commit message requires more explanation, and, will be adding
pinctrl as well in v2.

> 
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> index a1af4571a815d..7462921e21804 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> [ ... ]
>> @@ -192,6 +204,36 @@ exp2: gpio@23 {
>>   		bootph-all;
>>   	};
>>   
>> +	sii9022: bridge-hdmi@3b {
>> +		compatible = "sil,sii9022";
>> +		reg = <0x3b>;
>> +		interrupt-parent = <&exp1>;
>> +		interrupts = <16 IRQ_TYPE_EDGE_FALLING>;
> 
> Does this interrupt routing match the hardware configuration?
> 
> Checking the gpio-line-names array defined for exp1 in k3-am62l3-evm.dts
> reveals that index 16 is an unconnected pin (""), while the actual HDMI
> interrupt line ("HDMI_INTn") is explicitly mapped to index 20. This could
> prevent the HDMI bridge from receiving hotplug detect and EDID events.
> 

Yeah, index should be 20, will send a v2.

Regards,
Swamil.

>> +		#sound-dai-cells = <0>;
>> +		sil,i2s-data-lanes = < 0 >;
> 

