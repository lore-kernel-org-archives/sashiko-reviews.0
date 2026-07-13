Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013005.outbound.protection.outlook.com [52.101.72.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177C3340410;
	Mon, 13 Jul 2026 15:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783956504; cv=fail; b=bxBFVNq/YrkODpaU7z2qX2d9JAQus5g9YXSBLAdTjp5lxxBYpGBM/iqRdPIfGHEA4sNOuDfM1jVQ1hpry6kX0A90PGPUrZY0QwZOxyXdl0loUTc9anglWHOH4y13rjyVoFEYj2A0kY25QKlAhNoBUweHM2F2YkgvGlwFyLuTTdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783956504; c=relaxed/simple;
	bh=QJ9mgg6Bng5/FYf+qqb71SQdC5mCotQDIEVbbzQ/6zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PPI4xmvfLyW+b3nv4rboE/N8r6h4umdNJaMuPDgG0RgcimMc3WPM/aW1GGBbO+TJ+2905ZJVg2dvJl8T4qWft0/WadI4zMypHyw0N39DkpqNxkvSrJwyo+1DbfmUyc6bdjDLH5uSj+YywedfVy644ibnsUS/N62tc33Cuuaqmdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kSoLA7oT reason="signature verification failed"; arc=fail smtp.client-ip=52.101.72.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kSoLA7oT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reUqercUz0u+/gJv3xyh6EKmeWmxxlc+n5VZpO76ox76ByJT338ySzRg+EfrOg4lU76E8Y6g29oQvD14kx15BOlzm9320mEssL55fQ5onQXvMSxgw5cjJZBmOopCwHhuYtuE9d19FjZNc68r4N/r3SuA0VQWqfh3mpp//ijmBCrWAm6ll0cygTAo8ahbOlEj5e4h6aNtfPrxLXZGeyl2ZabdwnMwAwnjWtGzdfLPTjFAFIcbLPZxh5H0HJ/ShFvFxIAihHowlXYCitrW3VuJKp7bjDiRqpVuwW7hwims6FJNtA3ARjb3uMRF+uySIxB2Y+Ppd7Q1vwmLH9aWoJhf6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoy5Skn6s3y6Za2Ii6dKKYSH+FJTSddGiar3IkfEuzI=;
 b=J7mteRJOrU2haI/IYzdXQaXP0c8k8/HrEtcwe7vdetbRxs0DGiA3J2MNIJgnf5TaaZTrw22j2Za5EF6RiIFZmPjYdgUfM1MGTfOFXb5kswM1Sa1W7+UcqoBGhQLfVE/t4jHNavx3Bj+ZP16Lb6TiwuqMjAYXL8YR7dSQluPb4+0XXlwuGSvNhC/AJDtWPXvQJsrp6MCXrQs9AoeL+5Q/u4TXIZUGu/xZ9ANTGPPpSUgdndU/AfP1OZsS1uExKO8p3fQVRF2dXogSzuUtkGJlZd3wzYV4qvirKVRs5Co/2Axe9mIAAyNENDM9NvjVmb7fhTyFiri7S6VP5KR1jeDUCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoy5Skn6s3y6Za2Ii6dKKYSH+FJTSddGiar3IkfEuzI=;
 b=kSoLA7oTzuXTahVVbago+nmCBNpJp8m4JwGPFlc+9fs68gmW7AFJRbtmkocLWOCOCTjlcAq39M7htR5KWkRgKUvuYBAc2Om+oXhJVDO9tf0wf0KdbTjbNpOJ6tPfs/8AYeZC99uSVfm6b1HKURqlk86XcAUTLTvHxEfi7dN3jiabQ3fkbEqzVM1xEzMRrrRXu1Kfnzean/enFNsZkyay1eL1Vw1sJbTpn4Ip3ekYxOv5LnjNiE8wnHddQc1WV9XwX8irvMohi+VReq1JyGKzSRLov+RBHK2SO3zPby6QYJnSkpBCqt7uWObBrd/T/Caka633fbCwYL8kni5UHNjh+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBAPR04MB7303.eurprd04.prod.outlook.com (2603:10a6:10:1af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 15:28:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 15:28:19 +0000
Date: Mon, 13 Jul 2026 10:28:10 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, imx@lists.linux.dev,
	Frank.Li@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SOM-MX8 QuadMax
Message-ID: <alUECmBTNuf07Sq2@SMW015318>
References: <cover.1782812572.git.stefano.r@variscite.com>
 <69727b6a39f9ebfc00d7896377a8b24191926bea.1782812572.git.stefano.r@variscite.com>
 <20260630100712.25E511F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630100712.25E511F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH7PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:510:339::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBAPR04MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7789e5-0d24-404b-7642-08dee0f35e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|23010399003|18002099003|22082099003|6133799003|11063799006|56012099006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
	H7Bxu4YHgPHQpt9ECTRUArpfWnDDmpK2OhlyiFpgXYTOt7ZtkaS5IN2H/xR0LhYa1nURbTFKOAHyrK3oxTiZAKic2XStfgHp6IGKS7XfkZj4ycRSdJoLYJaDUmsc2iCW0+StEZA8De85UBkslinFU6mHLLizAhAz3CdFJFG0d/1M3jxtwu9+twWmpnfbvG0oze6mrQa+qEpLO1tbGlZj3CU/AyJtLetVX9qr/IiRq9AmLKbqQl4LoIKaFHIAIK4e7EBM4gY5WIsw8mFlhDh6WGiJQwQ8djfAudhRhefoQWAsIN7LJQE5ZmyJtCJ2CeNEi51IFUGYEpsAP5bN03w/syViKKIKb7tTMfsX7OKjCf/7M8DADKi0bSqn/1sog5bXcwma/EwuAQz1REyJ1vLn3bkNME7kahwd9KvnvuxbXIngsNLh0Tsy7v3h92Pl8ghPfmUytHhyYyX8OqpFaCppM5Cikuixo+rxb/8R2eLWU3gYCYmbcJeIyJZ9jcTY4iUfsGMzhORNBRUtbGPfm4NXjzVwXHgITPXyI4Mz1QphwmTgdvRmxQ5SDv6ej07pRHT8c/peJITUUaDO0tUDb58rpbvtVf11aZWPg7Rkt42mrqs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(23010399003)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?9TE/mdP8ZmZoZIX6+sWLzQlmDeyex4HpOFHtS8buGBF8ZEy3oUx9sq5oF7?=
 =?iso-8859-1?Q?kp1JL+UKfHFPEcA5g3b4a1LptOSy4ZHxn/hKP1w/ZyUV17dIsR531y2IMX?=
 =?iso-8859-1?Q?TJ1FYgnSpBppoJY0BR6lctERzVJLdWSbgRb6YjYZfN14dFDDMeovSAdhKc?=
 =?iso-8859-1?Q?yRJ5UqP4SBdEQ2BNrCNC1uOalLvLZUxpVxuBZdh+vX75bYeF4Lhk2X/8Wq?=
 =?iso-8859-1?Q?jm/DKOg7S55/CUp9GyzUslZxnX49z3J9Bl+wi9skTy9Q2X/QZ7ecS/xRN6?=
 =?iso-8859-1?Q?+IhJs82nd+F26ykrgHUBOyATFShBgaJb2a1NNqn7LPww8TTo13N1h8ZzDX?=
 =?iso-8859-1?Q?7SyuL4BKMZ6DlDeiJ80ejI2cSdZkihTceuMe+br8zxbIvQLAtkdBgaikPp?=
 =?iso-8859-1?Q?4Fim5k6HiksWG+Jmy3U3BmCHaavol8YsO4DR6bISClhYTrLt9jDQs5tiGg?=
 =?iso-8859-1?Q?ZeGxs9pR2fAs3o9uJ//6C/Dnsrzt6OEpECTNwVPtg2xoz2hkJXs3ubWcAX?=
 =?iso-8859-1?Q?N7kDUvrIEwHGFgsC6IJ3rKqbjj9BIhkV/Cg8THlLd/ghUaNv0U+U4ohc3t?=
 =?iso-8859-1?Q?ONMrCk+yzNEZ5geP4mUB0I8l0bSfj3Ugr0XrmgKuTh4qw487TvrMJRybNy?=
 =?iso-8859-1?Q?ry186T9m1pL8Wea2qKr0IpA94juJTdneFr5FEUl16WYnwPJ9HTNd9HAGEj?=
 =?iso-8859-1?Q?XY5sqSNqHZ4NQp1CdsqA/gFkfjsaI/SAwxXrNxAfifczzPIsj5oslc0i+s?=
 =?iso-8859-1?Q?1Rn9Dp1gkVn1qbiFLA5ueiTkNmKLUpVTlVRxNqz83JOqaeQ4tc4sLbHkQL?=
 =?iso-8859-1?Q?FRpV1/UgewFFV+0+fgrrNbOVa9VIVLeAH3n8mYCLZO+rxPKlHWZWAD6/J7?=
 =?iso-8859-1?Q?yh0iLr7X4DxDmc2SofL4gi9qaUxcpU2NkT6uFiacNQ7dlZF5FIokWuNZuy?=
 =?iso-8859-1?Q?F6uGYwXLl5rirjg9X/w5sSVBdxFdzkaNkZ66cJ9MfMO4c4z1GYpCMmQWsr?=
 =?iso-8859-1?Q?bvRgA3wCF4kF84nR7SgscxPyfxVmZmOaoic0cJ/Vg+w9kOaeIsaMd638JW?=
 =?iso-8859-1?Q?NL1ym3+mRH8uX0T+MgrhygTnW0AqaulJXKMk0/MCIbsCMQstFzKjL3v43o?=
 =?iso-8859-1?Q?U4WhdlpWY0BaO2TbcdIe2uovKoUNRDtwxJy7jht9E+/6drTtgsRtHtfQJO?=
 =?iso-8859-1?Q?8tmq2+zCWqqRWvwh0M76yolQ0bP6N87VD082pFQD9j+KLS9r07EectPu16?=
 =?iso-8859-1?Q?QCq6+59UjlXg5oP9Ivbpm3uFoWbFaVMA6xUpyLO54K7CZzq+PIUKkjoNUS?=
 =?iso-8859-1?Q?J7KdqvgwN7mZtl0uiIgzEy1cYXg0wWgfBPMrFOGdkXONU1vZsRDXXc95zN?=
 =?iso-8859-1?Q?5rL2F9v+TaQBwQXnB/bbEONNTw0Lpt/KzccoWhgYPsnV+yBt4e8TQX7qIQ?=
 =?iso-8859-1?Q?qmVgR8mLFtiQqC74jQWSpbys/lquSJgP6Xo+JpekeP6V5Q7EWbQESvvP+S?=
 =?iso-8859-1?Q?JcBFhnR5wmyxF8C+VLYjyohZBKjaoUHSz9/iboroLtDkmX910hWRW8zun3?=
 =?iso-8859-1?Q?QrlZVejrpAyn/ZYLNJ7MjiHqtpTU0nIq0uRQBwS+ZMRMcQjm1y863hXxg6?=
 =?iso-8859-1?Q?p2kg6uU7zaFji6fB+GWyKOQt/2kxdWqG7ZfIOop6sozcdC8tPExax23yQh?=
 =?iso-8859-1?Q?7/2QcQGGgvT/vDm0wGJLsBAalNEvuYpnYeyaO0RPsIyDcM3PfXRVjqn8ef?=
 =?iso-8859-1?Q?LeAPYg7RU0vQRcXXzz8B7RHhGQ33QINV3Z7EI+LY44tEoN3XkndRdPMHzF?=
 =?iso-8859-1?Q?QMfTxj35e5LY+HIvZzIM3tZUZ0LMl4fUTBbpnYYI3T86tsGky0tk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7789e5-0d24-404b-7642-08dee0f35e1a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:28:19.7150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j90pFm384FuZI8broEEz/C/zXgcmSMTtVNQxnbg5itFBhlAb6v4koL+OksyEaHpL+Am5EnceT5TJ/iP6UBGXr9IcBcIR7uOp1ennLC+Udm/M6b+dWtKrSv5FyLkJgG2m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7303

On Tue, Jun 30, 2026 at 10:07:11AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Wi-Fi and Bluetooth on the SOM will fail to probe because their enable GPIOs are never toggled and the Wi-Fi MMC host lacks the `non-removable` property.
> - [High] Incomplete PMIC cooling map omits high-power A72 cores.
> - [Medium] Missing PHY interrupt configuration causes fallback to polling.
> --
>
> commit c50bb64cb8cb31c1a2367dc07bbf18802022b684
> Author: Stefano Radaelli <stefano.r@variscite.com>
> arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
>
> This commit adds device tree support for the Variscite VAR-SOM-MX8 QuadMax
> system on module. It enables basic on-module peripherals including memory,
> ethernet, audio, and Wi-Fi/Bluetooth functionality.
>
> Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-quadplus/var-som-mx8/
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
> > new file mode 100644
> > index 0000000000000..2ffc32ddbf51e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
> [ ... ]
> > +	mdio {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		ethphy0: ethernet-phy@4 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <4>;
> > +			reset-gpios = <&lsio_gpio2 28 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us = <10000>;
> > +			reset-deassert-us = <20000>;
> > +			vddio-supply = <&reg_phy_vddio>;
> > +		};
>
> [Severity: Medium]
> In pinctrl_fec1 below, the pin IMX8QM_ESAI0_TX4_RX1_LSIO_GPIO2_IO30 is muxed
> alongside the Ethernet reset pin, suggesting it is intended as the PHY
> interrupt pin. However, this ethphy0 node does not declare an interrupts
> property. Will the network stack fall back to polling the PHY over the MDIO
> bus, wasting CPU cycles and increasing link-state detection latency?
>

Please check it.

> > +	};
> > +};
> [ ... ]
> > +/* Bluetooth */
> > +&lpuart1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_lpuart1>;
> > +	uart-has-rtscts;
> > +	status = "okay";
> > +};
>
> [Severity: High]
> The commit message states the SOM includes Bluetooth, but this lpuart1 node
> lacks a bluetooth child node to power on the Bluetooth chip. Since the
> required GPIOs are muxed in pinctrl_wifi below but never actively driven, will
> the Bluetooth chip remain in reset and fail to probe?
>
> [ ... ]
> > +&thermal_zones {
> > +	pmic-thermal {
> > +		polling-delay-passive = <250>;
> > +		polling-delay = <2000>;
> > +		thermal-sensors = <&tsens IMX_SC_R_PMIC_0>;
> > +		trips {
> > +			pmic_alert0: trip0 {
> > +				temperature = <110000>;
> > +				hysteresis = <2000>;
> > +				type = "passive";
> > +			};
> > +			pmic_crit0: trip1 {
> > +				temperature = <125000>;
> > +				hysteresis = <2000>;
> > +				type = "critical";
> > +			};
> > +		};
> > +		cooling-maps {
> > +			map0 {
> > +				trip = <&pmic_alert0>;
> > +				cooling-device = <&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +						 <&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +						 <&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +						 <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> > +			};
> > +		};
> > +	};
> > +};
>
> [Severity: High]
> The i.MX8QM processor has both A53 and A72 cores, but the cooling-device list
> only includes the four low-power Cortex-A53 cores. If a heavy workload on the
> high-power Cortex-A72 cores causes the PMIC to overheat, will the thermal
> framework fail to throttle the A72 cores, risking hardware damage or sudden
> thermal shutdowns?
>
> [ ... ]
> > +/* WIFI */
> > +&usdhc3 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_wifi>;
> > +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_wifi>;
> > +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_wifi>;
> > +	bus-width = <4>;
> > +	status = "okay";
>
> [Severity: High]
> This usdhc3 node lacks the non-removable property and an mmc-pwrseq to toggle
> the reset GPIO. Because the Wi-Fi chip is soldered and lacks a card-detect
> pin, will the MMC subsystem treat it as a removable card, fail to detect it,
> and not probe the interface?


Please check it!

Frank
>
> > +
> > +	brcmf: wifi@1 {
> > +		compatible = "brcm,bcm4329-fmac";
> > +		reg = <1>;
> > +	};
> > +};
> [ ... ]
> > +	pinctrl_fec1: fec1grp {
> > +		fsl,pins = <
> [ ... ]
> > +			IMX8QM_ESAI0_TX2_RX3_LSIO_GPIO2_IO28			0x06000028
> > +			IMX8QM_ESAI0_TX4_RX1_LSIO_GPIO2_IO30			0x06000048
> > +		>;
> > +	};
> [ ... ]
> > +	pinctrl_wifi: wifigrp {
> > +		fsl,pins = <
> > +			IMX8QM_SCU_GPIO0_07_SCU_DSC_RTC_CLOCK_OUTPUT_32K	0xc600004c
> > +			IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31			0x06000021
> > +			IMX8QM_SCU_GPIO0_02_LSIO_GPIO0_IO30			0x00000021
> > +			IMX8QM_QSPI1A_DATA0_LSIO_GPIO4_IO26			0x00000021
> > +		>;
> > +	};
> > +};
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1782812572.git.stefano.r@variscite.com?part=2
>
