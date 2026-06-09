Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012018.outbound.protection.outlook.com [40.107.200.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3591536C9C5
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019917; cv=fail; b=ZZyS45VT8w35Y8ShbH339o/w/cm+EOQBcgRTRPKCncJrxEw5I39WZbz4Mk4zPpX5vmv1pTz2OoUNcVZMVylrVGrFGXYdlQ7aDb0epIwC9UCkY9ga3oKyiJt4VGlt1JBsX9ppjNxRgrtFCSpAMzqrbEnObZuViRMgcHS6EqLnhxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019917; c=relaxed/simple;
	bh=yabOStuHXz76LX5Oj2XU8ipC5O1CIJYQcqs1CnhcPpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KoS/y2U7jHebdNIRNvvjAJLr3iE0osJgvoWpXHcISc1BZ6SVT0WLPEshI87ctmIG20CuLCfDXso2VTClYVeAVVvNWlu8Zs72eKRUhco4PYMf0uSp9AAt5fwOut6v9J+aC4EspzWollBJFNzCeRbaLhtp30XwlQKWCM80k1ELBDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bJGDmjtv; arc=fail smtp.client-ip=40.107.200.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bJGDmjtv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KofKit7TD+zxF6cfYtFVr1HSQ9RPZgtbBUUtAe/55ahjcKtmA2z8Nc0HyfZwMZTXpGyjLeYubIPa32dZZIuJ+VN5gxSppXTPlJo9oGGyy4ZpzGiYHe0YqQy9NP9PnAApI1ceahshyY2d7S59DgGMahHzkVzw0LOp0RO9FEXYBKJrgrsqFGfRu2AtXd9DjyPNj4P91PFFstX1LQeqd31VLodVvUONcN0sIdiOU/nX2UQ96NwTpmSqPYCVhwJRpbhLrpQJf/5L+FEGq6LvjYf97Zpmdaa/tSCNUu6LFIzh7CAEHr5J8+bxNRd+vknlY6VVLY4QUhkcIS2L/DEiquFCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQZXMDisj7MDWNHf5ZoH/aLK/2JHtxezMWaaxtUVJ7g=;
 b=OZV9pTUFI1fn8emrCjbKt/1cDAyQ8V/6g2c548dIkQHS3adtAHiVY0TcGXWaZeyjicjYiLmpZt1HqBhihgqqQf/rkwO1hZzTIRr6Tiix3JxRm0Oi/5d+qe1ju+7wJZgmS3NC+EchfHskc0ZsfWEq62ZLNpIEI5zVT4hmLkh9RziQO1iBO1iBW0Uchtx/YO++lUKaGkybZsH66mUj69aEvl3YHqViQYlUYBZKqex5V9LIzUV/VJXomUXkLkzGcb5qmeLHIYv8yQZVTfJeJNaLxE/n0xlLsNZ9IzhTJR7ChhGGXQIV9BCuJ1/nhEFVNcQ0yDPUK7c0p5jD/N2p/Euivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQZXMDisj7MDWNHf5ZoH/aLK/2JHtxezMWaaxtUVJ7g=;
 b=bJGDmjtv7Swhm0YDhRPa5dcnzqC98v67PV2NYHVftAyQazdwN3kHZl6650SZzTpmWyPq8MfA7R5PhBRZDl+eG14fg81qyz/bL8i8TKgdvqS4kWMPRLl6n9i67mxRNaK0hvFpzHEKkqNTR3Ms+a/mMfn2xm8v+0z8ZDCXQLfmGOk=
Received: from MN2PR01CA0049.prod.exchangelabs.com (2603:10b6:208:23f::18) by
 SA1PR10MB6470.namprd10.prod.outlook.com (2603:10b6:806:29f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 15:45:13 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:23f:cafe::38) by MN2PR01CA0049.outlook.office365.com
 (2603:10b6:208:23f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Tue, 9
 Jun 2026 15:45:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 15:45:12 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 10:45:07 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 10:45:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 10:45:07 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659Fj7CK1945630;
	Tue, 9 Jun 2026 10:45:07 -0500
Message-ID: <2bea6821-04e2-47f0-aeaa-825c2025e092@ti.com>
Date: Tue, 9 Jun 2026 10:45:07 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: ti: Add k3-am62l3-beaglebadge
To: <sashiko-reviews@lists.linux.dev>
CC: <robh@kernel.org>, <devicetree@vger.kernel.org>, <conor+dt@kernel.org>
References: <20260603192305.1347908-3-jm@ti.com>
 <20260603193953.DD9771F00893@smtp.kernel.org>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260603193953.DD9771F00893@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|SA1PR10MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: eb0568f7-8fba-4539-11ee-08dec63e181e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|22082099003|6133799003|18002099003|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	99tIiie5MHax2TsM9VKHq3kEtsKDoVXc7mxmN597qbWD3jUBj6snvpfOiTkyGVZCTevh1YeHjyf96yVaJc8Y9/bPSxhiHAm0vSzoVNrHQqpHdq1LSMGNUCUwGAHUVW3ySD42h3H47jGsHPXcmZEAEDmTzqWys4ehpxq8V1U8GcNE2Cg1El8IgTQ/5Sw6xFFgg4vlxEeXdKxjAA1kmr+A2gwxU8S897vaQhW8OtiMkLZXgcUiCcSifPROFR+X1sqIdAjan40U77D8laBw/hUkedV3RABey/+9nWg2lwXQr7c1vFX6agQ1vC/C0A+zCIq8IIdbMw7eheY1b/RWJjLquXmONQCUFJOPI7LW/4r8ocE2r8dKHusKMAdXGxSjEmEW8SBf39Q5e5NCa+++eR/KrzKjhzkJfUdCZiDRKf7EsifGXSScaZcuOfL4YsXmUjpW6WO9gfF/K9Wwm6SyE4w5Nj/KogyW1KOj+Cx2xkrFRx++Yu9FPmHQFE0GgiUU0SCm8K9Z5IkZx17BW6x0aeIYHfRgOvw3c/dBJLZJpitKFFYAy8OijG/nEux8wGlRIOVA357MqVlsrvXYEKgeafYdJEpE2EAod66TBL7gYM0ppH5TpNUc4TpRKBRQW7Fei1zMXfWwefidQ21qI7AX85C/DzKrPiJj1hfFGir15dtIPnU3u+OR3xlKHr7Rg1PyVyT+RiBm/U/QjFNiGj4IBGUcbxfjNX0xKXyVqOS28VZIvg0=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(6133799003)(18002099003)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X3CVW2PTfqwn0wxk4YFX4T9mPxkYC/95zY90wPeamwTNGf9UyzeawwHueukGqgTDW7O6hMSwcVy85AlNqlOUuluAuxW3OCpcC6Szo2ipP3v6XnHtkAPbvcIfKbpYovwoNGVI5O3fromFq+BhbKL+1Cr3kC2RF0sHKNvl+sXipANHrztplpuRodMjKafey9HP5PJoqgtMG+r7Yaw5/ErjSxKmNL+c760s7bN5pjjCzJaTDhjH1cIU9isbx3zx2jQjP8ujHWjJ45ajXOk2rpEIE1uWhMLrDhQRVt+WqajL4uOVs63z0egdxFVVWYgBB4HgzM34uzf3P7n7cJtmGwL8wIlK9rzDF1ofa83t0j4mH1a9yENgeBMzC1ppLjEIWJDvod/QXPciVwGIDY3kKcVLSEXW9wSNesPksovpzdMkNGM0sw5CaOKgxYGI+c6xIK6S
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:45:12.6832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0568f7-8fba-4539-11ee-08dec63e181e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6470

Hi all,

On 6/3/26 2:39 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Driver-Binding Mismatch: The `mcp23s18` GPIO expander probe will fail due to property size mismatch.
> --
> 
> commit dda0de04ef0f2160008191753ea45cc6c9880fa6
> Author: Judith Mendez <jm@ti.com>
> 
> arm64: dts: ti: Add k3-am62l3-beaglebadge
> 
> This commit adds the device tree for the BeagleBoard.org BeagleBadge, based on
> the Texas Instruments AM62L3 SoC. It includes configurations for memory, GPIO
> keys, LEDs, regulators, MMC, USB, PWM, I2C, SPI, and other peripherals.
> 
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
>> new file mode 100644
>> index 0000000000000..ee2d562baf51a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
> 
> [ ... ]
> 
>> +&spi1 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&spi1_pins_default>;
>> +	status = "okay";
>> +
>> +	mcp23s18: gpio@0 {
>> +		compatible = "microchip,mcp23s18";
>> +		reg = <0>;
>> +		spi-max-frequency = <10000000>;
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +		reset-gpios = <&gpio0 25 GPIO_ACTIVE_LOW>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&mcp23s18_reset_pins_default>;
>> +		microchip,spi-present-mask = /bits/ 8 <0x01>;
> 
> [Severity: High]
> Does this 8-bit property cause the driver probe to fail?
> 
> Looking at drivers/pinctrl/pinctrl-mcp23s08_spi.c, the driver attempts to read
> this property using device_property_read_u32(). Because it expects at least
> 4 bytes of data, of_find_property_value_of_size() will evaluate the length
> as insufficient and return -EOVERFLOW.
> 
> This would cause the driver probe to fail, leaving the MCP23S18 GPIO expander
> and connected devices non-functional. Should this property be defined as a
> standard 32-bit value to match the driver's expectations?

This issue is already addressed, fix has already been merged. Link is
here:https://lore.kernel.org/all/20260513231154.2703292-3-jm@ti.com/

~ Judith
