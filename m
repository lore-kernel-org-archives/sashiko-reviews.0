Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012039.outbound.protection.outlook.com [40.107.209.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D323B27DF
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 10:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779963001; cv=fail; b=osgJsKR0sYqdFRCFzaUOZDxK2cTGMPjQPtu5HLa+lh7R2dMx36IJa/WDi8d3rigDXg1NQDHHvwSMRfWALMQdzdPk38qYzJeAtRavwKfbMpDWT8jxK0xB3JsgyYiG3scN7K7T6AxHTn6cZT04oBpbFmqcqve/3CxOw44+JSchDPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779963001; c=relaxed/simple;
	bh=Bhciiip6/64CM2CSgvaY2leOR5Pjq7SEb1iUrGJoU70=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Zbn/uvNq8aB0Q5LSmHHroO+jjXDENLNDL4Cz6vQlEb1fJXgHbLgVFrKHVbDPpqgog3FEOVUTw7TClwx5Fiua04MH9eAowq3H0DSacvZx1za7UH+yZoLeCNXuAyvUw6nX5JH6gmuWnnsomKlCGSAglO3ZAkkvdCjCP9RdsKpMENQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Nqog3BMC; arc=fail smtp.client-ip=40.107.209.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Nqog3BMC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWX7pnVPOn6iEvjyVXvJm+Q/7A/LMAPwms99RvbWmalBHw+9tBm55jO1zyWIdFq6SAlAyFKWEI9u/5i6Tugds8YapSH4VJBCbYjW7R2sabdUIDRZl4/CuwcnZCse6R2E+6plBCBgM9M3yC0CL2AEu0fXMTw0B/Co9pcpCJl0si8RqaWYPuFBhND5ftHS7ej2faXOSCt+4T2bBBswbFvEGOj8svvycOF/mq0PyA8at+LxQjMP0wPPNWE0ijQ5uIx0ODg5+BA3eI/rs1eja8GFuvyPxpyzbRei6SVV6WnGjy+KxuMEkYxIpFDo+FLCVEc+bofEbNKeSSU5xU6d2Uns4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koWWVe7Tou4yDDkFyn/Cd6ryk+3y/aR1aDDEojrLToI=;
 b=IJgY5H0krxkv6s3gVlZGtf7kCfxyEVA5rF1A8pcod/jQFM7BHckX65AcnTJV++EY3QSKGb4gEkSoaMeh9o0AvMbIQd1yCg5EO1M4FHF0XzXKoaTmEYf6kwdtU4PhVxgGD8agiyJ1i9Ba4AYAb5jHvBgQHUGRq4coa59kxRUkBfnyR5R6kjr7/xJezE55ouu6S/QVL3RiX4U/GWCQLqQ0GP/HvmFADduyU0B+FuxGplczh239vgTQ8QOglfyM8wr2LSVC+iLZcidIVsaI0Dx19St+7IaRKyPob1qM68zvpefrFsmJx/v7Rbic3GyvljsdlILKXJOHckcrfLud90Ee6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koWWVe7Tou4yDDkFyn/Cd6ryk+3y/aR1aDDEojrLToI=;
 b=Nqog3BMCSlMeU6RjNzyeiBCGzUL5V6Y3UQTah/RA9pCE2wXK4+B1ggj5Rc3HLVC+Bm9Um9Z3KoeTCbdOvgaDa33AFS5ov6ssrD70ktiV5zRsGu8XwdykWr0AumPU+3dROU0qjs2bBq5FdI/pLn0vC/O56xtcF96VUNYIp5kNjqY=
Received: from SJ0PR05CA0013.namprd05.prod.outlook.com (2603:10b6:a03:33b::18)
 by SJ1PR10MB5931.namprd10.prod.outlook.com (2603:10b6:a03:48a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 10:09:56 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:33b:cafe::6) by SJ0PR05CA0013.outlook.office365.com
 (2603:10b6:a03:33b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.4 via Frontend Transport; Thu, 28
 May 2026 10:09:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 10:09:54 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 05:09:20 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 05:09:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 28 May 2026 05:09:20 -0500
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64SA9H7S1837049;
	Thu, 28 May 2026 05:09:18 -0500
Message-ID: <44b3408a-22f4-4714-b047-3492bf1cb2d7@ti.com>
Date: Thu, 28 May 2026 15:39:17 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay
 for AM625-BeaglePlay
To: <sashiko-reviews@lists.linux.dev>
CC: <conor+dt@kernel.org>, <robh@kernel.org>, <devicetree@vger.kernel.org>
References: <20260521020630.816220-1-s-jain1@ti.com>
 <20260521023423.6B8031F000E9@smtp.kernel.org>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20260521023423.6B8031F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|SJ1PR10MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: a7e15406-31d8-4790-7220-08debca14415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	3hQVt4vtQ0cyGF4vIkppYvF301s1HfDd3oPAzunJG/0g1o645s7RkGtEp4UUV5gFRRYJvSjRhkeSZOt0mpO7Ora6Gi9IquvepsSEFsoTk1RQkmnMlAtqjxyGYZx7W5bxIG07ITIBSSn4i4W8oSqt23icBMYX5v8kvoXqXKFxp8FXjsQfLNGib20qMm3aNooZOKGw2+GwvczFpLaG2W+NmTtjs6iirzp5Ig2xvZOJeTyVLWvicau9vJHeLZ6u0LoKGeN0qvTIzWu5NPfaCfGqgccyysffQSnlWCan0ealSwXYcdbYL+Rr0+yp7qLBdqDfPsCGcnX64qW4BhOs8v6A2eNXnXWKjqyFM0hp/qT5WbgvKRyg00Et+zdeSuuvJQFI/Ta1q7W7evH5/Djtmtz9AU6gzafv84rSzu8n0B+3d3GEN2civR0TkbjFEUeSnSMiCsqpVMXqlJLLcTjhbDsr+Tb8lryo1Yrdw5RbmcEgQLGyCUqBP9xSjK7JrFS36GSXw17lSxmDHYS09ZiINoOMZ2TqANmb4Z43NDMoTBjm3I5+5c24BVuFBqq3Bv8ro90m4eBjx+eyreuekV2YWS2kgPxL2uhxAcTS5uj7rfP2PJeNwe8WJHEyP+ndqgJn/n0PT315QWtzIK6ILUngjTF1zlPOTTLJa867DRO4JnYsjcDmuiAyGUcwcs7v+DtbLLIsHvXwMsNhYH5N4kh8Bm9cye5rea/Wcv4IwbRHWCugus0=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bnvKyMiwZ1oe6iUfNfs9/2WawCC2s2ko896mmV1AUxpj2xwLPUDX4LJNdDEalnk95KGsK6noIZaztqCQOMyOkPBfWKo+VCHcs1mBqynzgVrv13arhettP+KbFl0z3+ZksJKLlhdGJ9EHFhFNTl+rHADkYOpXxYHY3knsVLKn/BEu/BKgst8ce5tQd0E+AqscBP0Uxzc32v49EWqTAf/9N6DR1NDBCj8xHyzjjQUa3/vvOQfojRDDIrVRfe3/G7TdNRrQXVFk5sVS9Oh+xpof/bTI3nSMjFiTqeR9OoauBHkOrta8xjIwbLL4Jz/tv8/apT+vZyYpskgWNS3LmKD36TyQtYqq7Q/NHHf4D6lTaMCRoKZ3NC+0qVXItJNiVX8LScNLShTjdiFF09PA1Ut0dtKenCKkFZgER1hOHBb0OR5b26QNXphfgapOqH+N/eqL
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 10:09:54.9923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e15406-31d8-4790-7220-08debca14415
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5931



On 5/21/26 08:04, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing pin multiplexing configuration for the OLDI interface, causing display signals to not reach the physical pads.
> - [Low] Incorrect indentation (spaces instead of tabs) for `pinctrl-0` assignment in the `touchscreen@5d` node.
> --
> 
> commit e2feb337dbf24067c54227c036db263d92a14b0a
> Author: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-BeaglePlay
> 
> This commit adds a device tree overlay for the Lincoln Technology Solutions
> LCD185-101CT panel on the AM625-BeaglePlay platform. The panel is a dual-link
> LVDS display supporting WUXGA resolution with a Goodix i2c touch controller.
> 
>> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso
>> new file mode 100644
>> index 0000000000000..e7cadd48d4391
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso
> [ ... ]
>> +&oldi0 {
>> +	status = "okay";
>> +	ti,companion-oldi = <&oldi1>;
>> +};
>> +
>> +&oldi1 {
>> +	status = "okay";
>> +	ti,secondary-oldi;
>> +	ti,companion-oldi = <&oldi0>;
>> +};
> 
> [Severity: High]
> The overlay enables the dual-link OLDI interface but does not define or assign
> any pinctrl properties for the OLDI data and clock pins.
> 
> Since the base k3-am625-beagleplay.dts does not configure these pins, won't
> they remain in their default reset state?
> 
> Relying on the bootloader for kernel device tree pin multiplexing can lead
> to the display signals failing to reach the physical pads if the bootloader
> does not configure them.

OLDI does not require pinmux configuration explicitly.

> 
> [ ... ]
>> +	touchscreen@5d {
>> +		compatible = "goodix,gt928";
>> +		reg = <0x5d>;
>> +		pinctrl-names = "default";
>> +	        pinctrl-0 = <&touchscreen_pins_default>;
> 
> [Severity: Low]
> This isn't a bug, but this line uses spaces for indentation instead of tabs.

Ahh, sorry I missed it, will send a v3.

Regards,
Swamil.

> 
>> +		interrupt-parent = <&main_gpio0>;
>> +		interrupts = <39 IRQ_TYPE_EDGE_FALLING>;
> [ ... ]
> 

