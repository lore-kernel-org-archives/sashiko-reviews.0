Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928D33168E6;
	Tue, 14 Jul 2026 20:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784060721; cv=fail; b=DPXnQwcu59peRLtAUBd85IBMpyx+dImfjOf9P92fXvQbeTdzUh5jLscmHJSXTySz+wSASlhgzMTiMwVPuL6WgQRAlWNwAuUIrNFdlr8d4b+cITtY7jPqRD+kAMheCtKHsgYB4cLA/95PEIshv/vAVBoMjWv2qKLbvGOWVPwXlU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784060721; c=relaxed/simple;
	bh=ikLTZ+RtiI5R2BcDlNVwGcXoNO832cxRvdVyzqC5NPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sJtCLrKbxbDMtaFwFfSYMQCbavlMUUYUMtl19DdXQH03y8Clh7BQiaLrZqGO8wyw5Fv+HVqxaLlP+4yJ9qLNwLRvEho7dT5pGE9Q/5d5Mf8pkM7wTJvUrecjZy9LTpP3uZY9fuyL5UAusHjlHvoMkG6GsBae2UQMvxvbLCl6+g8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AQC3mJlx reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AQC3mJlx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFdH5mdRI0cf6miXUqCKa7RtfiORwpNkGA2wYKJyGmRsZj1EtEs6rqGR1ZO11iJ8sM8saheOHXfiPCxQcK5uddW/0kf2/erYtONJ5Oc0hWstRIDS5uxq4dQdD3APA/Oi4m5VE4eEPLD7biUGGluopC9U3igjZwoE+hxy49DCqgHNjWOSdc+E+L3tAE4FtCJQj42Cgy7pZJTMjOxsq+6WRIG54t676Wxo68Z1vhBnNd1Ux7V2zgUsH1UbyR17j9LwWqy+Hb36UWC8Da7qfPTeut5lgVs8ihJfERZ+dd8/AIHA5cT+pG/Ovv/w2IfY3mD00wqHgPR6iAaaDgUUPWysig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiBUmJfDq4y9m8MuWcSJeJonh6qGZmXZL+sbbgSMp+s=;
 b=iigiH0Q4nu1cP9GXtExy/a7zTWisVjsRQtmY9reucXCP8zt6So8tZBB3U9KtPL1DOet6eoTUcHOBBc2kNIurYNR2l+u1SBaQdzhq4Vy3uQ4xXnE3jFC8M0fr7k4UBmgckgMD+Y42DixrzujsANaAd5FqVog7MW1yHpUh9V2RWNkvqontvRLD6fWdPgtE+cPELTxsqapYR0EGumIzg43yaeDvlHG8kyLLJJ6FDf4yga9f71H3YWInKLgi3ul/KfflklEquJwAL4ad0yk0rlDG8bmx5XxOhG9yNxQ+yeRCBB02crFCERdtzZtN2ZJLpfXnoff19zEQhFXHurYvLfe7Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiBUmJfDq4y9m8MuWcSJeJonh6qGZmXZL+sbbgSMp+s=;
 b=AQC3mJlxeraSKvDOgoKchL3UDLeeEazo3l+nNGBinBy6HGSOseCgW5sHaXplrT76YV21LxWrS8MixbJSNEzaxjmUj5f152yHVtgI0kgFMM4HvKmy+/7bjo9S+zIfI0vvWyiiHHojuHwTZTioGHmkdQpFhZODrDsRNoLowyAPzbRttccKs5zAjzx7dVyc4JUBZkdM9uCzpGEYTs3pfirtw6T+pesryVoe/wJMS5QZd3bbaArz3g3wxYbezXqfwyNbBWuJZWXB0LVZzTGMXADeMlnSQN58KPopO2FLFysD2IDd821g8iSk5WeH4TWaWUgN5r+XJZpw4C/sUtCSTd6VSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11084.eurprd04.prod.outlook.com (2603:10a6:102:492::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 20:25:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 20:25:16 +0000
Date: Tue, 14 Jul 2026 15:25:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SOM-MX8 QuadMax
Message-ID: <alabIy1hxRcmQJgV@SMW015318>
References: <cover.1784059139.git.stefano.r@variscite.com>
 <f373059af209ed7ce8e63988066e730736e06e6e.1784059139.git.stefano.r@variscite.com>
 <20260714201703.3BDC51F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714201703.3BDC51F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH5P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11084:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6222f3-168e-49f3-6b68-08dee1e60441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|366016|6133799003|3023799007|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LZZUgBEkRir3MMylF0rwVPbFCjk0J46TWCnEKQKK2ysjqseY2Hrmjap7rs6LnCxI84iSjHAXcj/plAFbm2ntY1H80bKKInpFDgelIjLHveYBd0IyXtJ+iTyOAdogtCS7Fv03doVEnVOELwwaq0Bxhk+JxPR+ayKDCdRnEqclklDT5kUvsrlf7zQxpg/DlOqFKMe/9IbdqxONiPvbm0cYJVzIR3Us36o6pAfEJz5z+jmPuDxTFuq50paonlP1PTdKhEBKgW3NRYQ4SnJ8yYY20kG2I3sJEMs9IjSclgKMDTdAcjxVUgxorZA+IRKwVOR78gMiObZxUZE9bWJ6xznhCx9pDkAiVTjGkwwM3mbsjmJ9PKTtf69FbvT99gvIM52XxYvCwJTC2dZfoqvA3b+CS/FbSnvq37GJDUQYJaxQTjwPEojRN3Fu9tJQIwanepNTrsR3o1vE7eWKZsOFzsKPBxSIDY/e/FOPrACrMwZ5dAAc/qSZP20uAiTWn9yGxUeqJIvXsDjbxIwp6RBBeeLACmiUJytLw2EGsU/IVSz59/NiRmtRB7hsc2NKyTsrgxwacpZOExLPMh4lMLx+VABqgvicFTomN6HMUk4OnJnbUmQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(366016)(6133799003)(3023799007)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?7egipJp9p+SVLbY2+V60FTEVB5CNrhrRVA3cu8koRwWHmDa5OxrfC46lRY?=
 =?iso-8859-1?Q?x9QHvR7G0O20r0OC0G7WlrCD8HwsWNu9gbvyFJRKcADP+kcy8sdr0aLEmR?=
 =?iso-8859-1?Q?BG989HFTcr8qvYmP5vecwzsPkb6d31BCXE3CJOcaBEQSLEJioxTGKYFCjy?=
 =?iso-8859-1?Q?QuOA3Pt7qJ2JGYSmKI8uv26bcxNqGmcXFNN1JWjAv/FoAvvMyj6MK+mFO+?=
 =?iso-8859-1?Q?++ZsnGjmwG8S+P+0cRPBsmh+y3QkPDXrHoI/KA102U/EI3X4aWx3/Y61w2?=
 =?iso-8859-1?Q?g7XzaHKqPNzYj/KBKOFJxBSKwyxc1TwB0vGhBM7YOHN6h3mjAJQN+JaqOE?=
 =?iso-8859-1?Q?ddTl0bwoBtFvfHsAf/JkazuOQRfWyQNZT1ox2rOcm9g/uSxyqtMr6ZaBIY?=
 =?iso-8859-1?Q?CGsCCKVZvD5nkgz3ZyoZGxzmKYQrRI1AECWMNaWoqNs3ZrLsEr4CRq5Std?=
 =?iso-8859-1?Q?zB+qqGb0lykB04hwmTOlsuw7iK6aa8bsckqHY5VuljNtVMzfk6MynHtubK?=
 =?iso-8859-1?Q?oylhPxcCnxd9Eq7R5RyzVBvZ/2amb+tX8R+/QLjXzcjmDfpRoGGcioEYtp?=
 =?iso-8859-1?Q?AP0axnK7Aym68HzGjnfiFwZQTH/92i5353ca3yx70l+Nmnowlt2IO5e+Ew?=
 =?iso-8859-1?Q?ILSOkbeRk+x1XFdI0Fv1FxIVW81u5Vbn8RVVtSmAKk0mDXEuqPTExtT63N?=
 =?iso-8859-1?Q?rfpgLbR2T+1NiLXsINd6RSUHsnOjUJ3ffmJTje5Z7WYID5C1c8KP7s3a4H?=
 =?iso-8859-1?Q?nA9d1zO7RTSw65AMQ27B1FnN1cfo7a3v3H61mZwYZFpghElWuD24MtJK3w?=
 =?iso-8859-1?Q?Mws/XHxbzTiqeYG5f7U+hsJn0Nz0V3nFPrqtZ/ca4R0p+vKjI/bmXZwINH?=
 =?iso-8859-1?Q?gYOyGjgpyeTN6N93LW5ZYvhkfoNNGA1GWf/33mmwcePpw7GOcQ6MYmSs3E?=
 =?iso-8859-1?Q?++1TktCoX84OHMnODR3/hoIeqRPnCtTLmnvZjM0N8Br3H8U5vU8t8iVWkm?=
 =?iso-8859-1?Q?gOkzxJr9UbSXEyeIlFVAgD5JdiKbvkTli8qdnZRE7VKeBXq22YW3d2WMve?=
 =?iso-8859-1?Q?DO9tU8yRJHT2IcsBeTbGE+x5myPrjVwEajrsDB3y5h/H6eNaXLhAx7894N?=
 =?iso-8859-1?Q?LMB8HnPV/7aD8Zv/EXxBLd3NYakWYYFv94xdEtPLnd2MtyRS6m8m20G+ur?=
 =?iso-8859-1?Q?02EOYpk3BQQpcEeImEILKFS/ejA1opLKcDNWCwk9qrY+UJQ9pL4yzes8Hj?=
 =?iso-8859-1?Q?lpV0Hus8qrQANUWQHl+m5aw29y4AkFt2cJcD4QNXjSgGMizW0NYXAUCyCm?=
 =?iso-8859-1?Q?ApjptyTiWUIvA+Dl5T7TNB4Pr9V5Q3OWIbmVQlFoHm878d9s6PUNkd+Vq+?=
 =?iso-8859-1?Q?pFojAspnsIljH9ig/5YVmoFeD5Uqh+mOwGO57NWK8st7y9IxDJq4OEePq/?=
 =?iso-8859-1?Q?xlBG8sYS8deh+us04flqqjPRT5IZFCxHwn78WC5Rbx4T8IwPJvHGGwGUW7?=
 =?iso-8859-1?Q?CqlcOpSQygRgWb1Z2TqRXneuGdXF80qc8GOMe6OgCkSNJU5AKnNzpJ57Gf?=
 =?iso-8859-1?Q?P7y0Km9uRR7PNxkYn00hsqrn/s8UDpnFeIznMq6+RT6Vs6mnxdI9ZzniEp?=
 =?iso-8859-1?Q?u2WRBl4YUcjRST3cspF25w+7FerDYNoMmlTvVRBGpviovMVHjAvDPXz2Zl?=
 =?iso-8859-1?Q?UPWzDGZamov1/BY/pmivON09idubrF3D7bqq5SQfv0SHtcYWQIH3j3DoSC?=
 =?iso-8859-1?Q?L3OTkZA5RH30Y/WfdPqgdDmuw2/PAsYgOwdsLaYf4fvPSXZpZy5xB0346T?=
 =?iso-8859-1?Q?edYBQu5ad8SVPNU7Bdj7H4NUJWnuPTAlGZhowS+vBzrpsrWQiq7s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6222f3-168e-49f3-6b68-08dee1e60441
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 20:25:16.6463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7GAo6RZRRFsFtU/Ndl/WFChnI1yrCgAIlbNMv6lD3QJzUb7hk0Z+lWnv9zOxlRyOTKiNO7U1TZ6L3Cud6Coe+iOQqeQKXsLTcESiTb0Reej3glXM1Vfo0Mo4UsGqYaU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11084

On Tue, Jul 14, 2026 at 08:17:02PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The PMIC thermal zone's cooling map omits the high-power Cortex-A72 cores, severely limiting thermal mitigation.
> - [Medium] WiFi and Bluetooth enable/reset GPIOs are configured in pinctrl but never bound to a driver, breaking power management and suspend/resume.
> --
>
> --- Patch [2]: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax ---
> commit 33df8d987b7061b5d0c8453d1a7834088b34ace9
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
>
> Add device tree support for the Variscite VAR-SOM-MX8 QuadMax system on
> module. This SOM includes an i.MX8 QuadMax processor, RAM, eMMC, Ethernet,
> audio codec, and WiFi/Bluetooth.
>
> Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-quadplus/var-som-mx8/
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
> > new file mode 100644
> > index 0000000000000..e805c51eb27df
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
> [ ... ]
> > +/* Bluetooth */
> > +&lpuart1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_lpuart1>;
> > +	uart-has-rtscts;
> > +	status = "okay";
> > +};
>
> [Severity: Medium]
> Since this UART is used for Bluetooth, should it have a serdev child node
> (like compatible = "brcm,bcm4329-bt") with an 'enable-gpios' property?
>
> Without an explicit driver binding to manage the module, the Bluetooth
> device's power state cannot be controlled across suspend and resume.
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
>
> [Severity: High]
> Is it intentional to omit the Cortex-A72 cores (<&A72_0> and <&A72_1>) from
> this cooling map?
>
> By only throttling the A53 cores during an overheat scenario, the system might
> fail to cool the PMIC sufficiently. This increases the risk of reaching the
> 125°C threshold and triggering a hardware thermal shutdown.
>
> > +		};
> > +	};
> > +};
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
> > +	non-removable;
> > +	status = "okay";
> > +
> > +	brcmf: wifi@1 {
> > +		compatible = "brcm,bcm4329-fmac";
> > +		reg = <1>;
> > +	};
> > +};
>
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
> [Severity: Medium]
> Are these WiFi enable/reset GPIOs left uncontrolled without an active driver
> binding?
>
> While pinctrl_wifi is attached to usdhc3, there is no mmc-pwrseq node
> consuming these GPIOs to control the power and reset sequencing. Relying on
> the bootloader for initialization prevents the kernel from managing the power
> state during suspend and resume.

Please double check this, look like  correct

Frank
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1784059139.git.stefano.r@variscite.com?part=2
