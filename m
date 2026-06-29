Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF00F4657F2;
	Mon, 29 Jun 2026 16:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751729; cv=fail; b=P5Y0EOH2vXmIMd1LOVCQxOVXXVtoTjPS0ReM4jAc67veQTFJT+g+RPtP83I4elQf0j1uu3aeVz5TKiciKMGjfv2S9SSV6C1vm0kmrjeJPfn3B4uxa8hYdHL1k79Dw2jsvaQZL3SQ5AWb6v59rDnImmmwpzzN30kvOiS9f8bHtaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751729; c=relaxed/simple;
	bh=h3eVxef9vjdX7jozX/vjqEHnjqL649QPSN6BdHvu0k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nC3+V7KriVSiPnXwK5jL7RxN8Bx+rX9D4LHu7GOgIe9WtZ9svsYVZgwXM6byIpYCoD4E71YvMDsSBWkXEqJF5h0sHkHS7TSRcMGJWlfvNsN9AibYFttRl5bDWtnv8uRB46efLO18rhlJ39086vLV1Si2FDH31VMCaYw73yBQW9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Zudy3aXG reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Zudy3aXG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFztzZsk1k2+L/hRA7eg+QCN4bCv2bfmazE5UZOzUYu289RPEjvddtrMW1LwN0fAG/3PByWpbGbM2qaxbDUyzAV89tEDGLmCuoYFFbJpn7LCe6q8ir7snpHrjg66aTsX931OWcgPUCqDGjLidr/lnTyXSb+559hsohkrVI6BaXtqUC/Rbb6eDFi+4EJYFGIiqKZSKVLgFP8MBArm9FsdXnQnjoE01mwpC4E49QTyuFG856OI566kUQEbBTwUmwbe7BgRI/t1cSZS72wAu1e5ENek8MHDnpDF1HjFKGduxDIdEYw8l0lIX4vf8yO627mx07leiN5J8VM/CiLdIwGixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5tzl5WnUe3hCksisAA5VWSKB3GUqgQqWnD5/35/DGI=;
 b=SKXxyjCJ/1CSD6YRyOvYEvge5NRRtpYxT1eEs2cGxPmzHFAEnGwu7i22j4SQs7Q/ZmdAyTZdkF6YOH44cbWpJ7lb/3+Y8DbpefgEztbwbXTLzdjsRPvLrfuKeLUydyAh0+OqUTypDFR/OYmCxsMFi/xqFZ5X6VspH76ZQzDX7ievFVmaTScQyPLuqlK5G3NUacn2Ws3ETkHzFcAdoMq13Pf2xYNtAWYC8nkFqyGlqzyoXGRckGYBRd4me8mj+2NRJZqaRkKeRD5d6R0zxLqu2FhBdLtoFs3nQ88MhtsaVrjScnInP4ZW5+xNpji19oHzJiB/h7jaY4FV4UtJajp3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5tzl5WnUe3hCksisAA5VWSKB3GUqgQqWnD5/35/DGI=;
 b=Zudy3aXGoIp9u0y98BtPuygbFwIFvPNw4XlOGTPFR4hV2uvfqF1m+ppNPyE0H0sWdq/4tmGszBDpAsVXE633/GB94eoRdasT9I7orFMttWMCXK5r4KJjiSVnbsnlymNUtvWGKU+5R5joAqOOQPY+9wXic+nu9YqJLIM7Gjg0IYx0z+2PGDoDh/0joZ/ECELR6KbDL8OSJ3nTcQiWBmCTSBA9zVlUsImYuHe5aTNqAVqXiBAFN+2m7Pl2na0TzQ46r3uovIlc1hA63WlkzBi1xMEYqy6VRuNzZTzyriPMPAmblMClRXGtyrJ9fnCT0P3a/6DbmzcLhkK7MOg95SaEyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9221.eurprd04.prod.outlook.com (2603:10a6:102:27d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:48:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 16:48:43 +0000
Date: Mon, 29 Jun 2026 12:48:37 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, imx@lists.linux.dev,
	Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX8M-PLUS
Message-ID: <akKh5XbMS_JjGpPF@lizhi-Precision-Tower-5810>
References: <85af11e85dbb7cf5097d7c0ee567272ff6e87ec5.1780998600.git.stefano.r@variscite.com>
 <20260609100729.C9FF21F00893@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609100729.C9FF21F00893@smtp.kernel.org>
X-ClientProxiedBy: SA0PR11CA0019.namprd11.prod.outlook.com
 (2603:10b6:806:d3::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9221:EE_
X-MS-Office365-Filtering-Correlation-Id: 9939f2e2-e6c7-4da7-91be-08ded5fe47dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+nA0mrr52QaDOc+757XoSCzcj3DtfoeU8b8G4zh4E8u78gipeDBeBJyArVzqt8t1t+bwFKFd383ANVTdau36ctHgEYB0+Vek95o7enqBxU9ow7LODgY1F1cYlqrZko/B94tZzLYtDLDVOSj5jNdSqNTJPnswagAAIxefRyimiFO9kHrXqoBlbf7Q00CW5O0JYz5UCFDAH0RwD8PAdt+t4fcPuDuxXmw10ErsSijjCDaUf1zlM8vwQs+Ry0FHFBM1bldFV9CsYiGNABbpSWdiD2wHNcBsBYDCu+fWsY/QuQlV3BjCdOIWpqsIORlZ1VrLOw5itQZxWnQicGIO3kLCJyo0ROcYhOkP7rvzChc7T0veXyCqqTwl2/qM0RNdsmCwqxQu9RzJ8QbsbX8mN0JIw2WFHKilWBO865jF+O3IbXmZlTNc6F60WAsQVHNjtWQfvKzQETFXTM004TTTfmOkANkCx8LcMO8i3pPlieQCkaWEyFoKQm2mPJaJ8JnBmnM6Zt9brS9tv2YKYd0cx+qPQRSEuuIAW/AkmvWxCYmbmXanSAH13IThENEJAiUQms11QC2Op4ykMIzmJR+ak4E+uKw2vJ868pIKWzCgSafZkug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?0ys6pIeZd+xChHZNXCMm3fd4EB4jDu9WCEZw5rACfqoyln3B5lQT+JNM/I?=
 =?iso-8859-1?Q?p6QvB8X3l5gvvvfY3CeHqK9j8CDUin92afVM2vrYftUqXTEPaZ5xujve1x?=
 =?iso-8859-1?Q?WKcewGa64pCPb2IBcA/5/dtzX6zLrL/9F3XesIQHGwv6qtmMbKkTBGd/wZ?=
 =?iso-8859-1?Q?DBiAh0rkQh1xbb2fmwImn/7YLsOj6upP34RSdvcU/h/wybPdzplc6pjsCm?=
 =?iso-8859-1?Q?r1rFGctJflirlXz1ku2ekCtIO+AOBnELCRtJHmaka0zIzB6OKFz6FdT7bt?=
 =?iso-8859-1?Q?AdHx8NIfOUHi1NFJtBOxzVXYD5dZoM2+oBbl9/LyVZsYqOMkFGivmfH3ak?=
 =?iso-8859-1?Q?gS5tzdBKxGb76UC3rPOoMnTn3pdEDsmzlVa66Cdx6FU+aEhzEAtIqBbqjo?=
 =?iso-8859-1?Q?JPWYOCSCXl3HL6fqTN5NMpTtIfxyIPiBVboXCmaX+y7kcEXMwjJ9rJ0gNN?=
 =?iso-8859-1?Q?KAJ9mX51Wr7I5lLqhb/fenKQ0/p8o+ud8a4ZzeQjmWtiMUJM8fsOlkWjZV?=
 =?iso-8859-1?Q?11YixwXCtTThwFhYdXvB0LVEZh3iyl3pUSxoeNvpa3zNWBtQR/uRNAaZTF?=
 =?iso-8859-1?Q?UKkW+8DVnIJdYX8VBvXiskvrvflwDQuFH/gJI7hpetDVxrqZYSUPIBoOo6?=
 =?iso-8859-1?Q?nwL5WgF70V3J4wngZabgNssbuZeELEYoc7+JgEUa0oYMMb1XYidSBVpuIb?=
 =?iso-8859-1?Q?FvudVDV62z/CO5sb5fZ5Axh87Ih/QAdx3GK9pr2S5nEn1YDSeLJT2Vfcyy?=
 =?iso-8859-1?Q?2vfl5qgbFYljVxkmIjxFVEQnL6pfxM/QBNP1X7owaQ4LLiwhhpwr1lgaUx?=
 =?iso-8859-1?Q?ojc/ku+x0nqjdpAvmBEwcIKRF86/ZQbtJfUrkc2QGKCVGvc1twNDu2fVKa?=
 =?iso-8859-1?Q?ImcyjMUPQQVIQtQXR0ov128LmLseyVAQ+0Mp8C6mmi8fa2h8Qd2SEgjcE1?=
 =?iso-8859-1?Q?Itzy/Bl+vkJgKD5QeWvcEwmcArXzuOo7LTciR9y5Sig/iXX/eI7b0oPZIv?=
 =?iso-8859-1?Q?5uhKh9yxkrQzMg3Y4rygS+WZgRiadXNF6D3qp7zS9NWWTrl+m2rEd5Ei1d?=
 =?iso-8859-1?Q?uqThw7aJXv4LD03350uRQZIeGDabTFfiaEaMI3dUeyy5XvwIQR8F18A8fu?=
 =?iso-8859-1?Q?NY8lgAjwniea53ivs6Ku5LVYlPv1trDKvgkj+xKt853+WrQd1NbmHZS0YE?=
 =?iso-8859-1?Q?0He6oaZ5vwPcxj1qNzljq3Vcz9mcLKABrVn52mbNPO4wiER3YkGKubxd1l?=
 =?iso-8859-1?Q?DVueBrWkmo0wSO1JNkK5m0k0Oav/7WD0GRPoyICXbvoRCLJlbJIv0dQIVW?=
 =?iso-8859-1?Q?e/KrCAum46ZgPXOuWnzL6/970cTHd/wYcCNg7sBoq/eOqtTFR85E4gU+l5?=
 =?iso-8859-1?Q?e/ug02iu3cZxjBqF2glRt465u5yJ26nzpsCOGv8Wt4dDwnNwJobhLjO0Cv?=
 =?iso-8859-1?Q?43TLHX0N+NzGbIjbLgSB0hpRnBDoF+naQ2Kk0Hpwjz3XRkplaMTawK/tCH?=
 =?iso-8859-1?Q?Tfr0a2z0/w74L+i0i8996WgFO26frNU0OpT1/YlDnAFfSv7/rgIoscvgoV?=
 =?iso-8859-1?Q?QryEIiyCTylAkWt7P7wRatKNIMG8voGZYugKtJFwqFAVjoMuIaTaiu26aY?=
 =?iso-8859-1?Q?BSc894SvLSOOnl3J+yyy34G4Li619jy2A2tzFEIs6aqPclef1Wp41Ys2Vs?=
 =?iso-8859-1?Q?1uWWiUwovZw9ExBkrM8fR5k56rI30dk1JVebf0p+Cb/ZtRgVpVNYUAIxIw?=
 =?iso-8859-1?Q?vNPuvvlfnTGVvuiFXzob4QiarT24b/xcjIjxUmmNyhDNTfGqHKncPxdIJ8?=
 =?iso-8859-1?Q?UUf9oj9HjZch5zYM/IMWFGZACKlvm2FF9CE8Wz/7UyEutaKlBjF1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9939f2e2-e6c7-4da7-91be-08ded5fe47dc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:48:43.8911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYgxM/Ui4GxyYVj8bi9MqyBPseGHajwG+LAU4DbQxFcxN169HIUw6746u7pY3xznrNRaumayHBQCbHUMGsOK1ZzWanlMOcTX+4Rgzv8GwnkXhvB46M3lVn+AaCh1X+y2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9221

On Tue, Jun 09, 2026 at 10:07:29AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The eqos pinctrl group claims GPIO2_IO20 but no driver or regulator uses it, potentially breaking Ethernet or SD2.
> - [Medium] Bluetooth control GPIOs are muxed but not assigned to the bluetooth node, leaving the chip in an uncontrolled state.
> --
>
> commit 7c8394d85e349e14bbf3796b542f8e133683dff3
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
>
> Add device tree support for the Variscite DART-MX8MP system on module.
> This SOM is designed to be used with various carrier boards.
>
> Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-plus/dart-mx8m-plus/
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi
> > new file mode 100644
> > index 0000000000000..a647a2e0ab94b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi
>
> [ ... ]
>
> > +/* BT module */
> > +&uart4 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_uart4>, <&pinctrl_bt>;
> > +	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
> > +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
> > +	uart-has-rtscts;
> > +	status = "okay";
> > +
> > +	bluetooth_iw61x: bluetooth {
> > +		compatible = "nxp,88w8987-bt";
> > +	};
>
> [Severity: Medium]
> The pinctrl_bt group configures GPIO2_IO06 and GPIO2_IO09 as GPIOs and attaches
> them to uart4, but this bluetooth_iw61x node does not map these pins to any
> properties like device-wakeup-gpios or reset-gpios.

Please check it, look like make sense

>
> Will the kernel driver fail to toggle these pins, leaving the chip in an
> uncontrolled state? Is it relying on bootloader defaults or userspace sysfs
> toggling for these pins?
>
> > +};
>
> [ ... ]
>
> > +	pinctrl_eqos: eqosgrp {
> > +		fsl,pins = <
> > +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
> > +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2
> > +			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90
> > +			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x90
> > +			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x90
> > +			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x90
> > +			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
> > +			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x90
> > +			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x16
> > +			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x16
> > +			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x16
> > +			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x16
> > +			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x16
> > +			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
> > +			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20					0x10
>
> [Severity: Medium]
> The pinctrl_eqos node configures MX8MP_IOMUXC_SD2_WP__GPIO2_IO20 as a GPIO, but
> there is no corresponding regulator or driver property that requests this GPIO.
>
> Could this unnecessarily block GPIO2_IO20 and cause a pin conflict for any
> carrier board that attempts to use it (for example, for usdhc2 write protect)?
> Was this possibly a copy-paste error from imx8mp-var-som.dtsi?

Look like make sense, are you really use GPIO2_IO20 for eqos?

Frank

>
> > +			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11				0x150
> > +		>;
> > +	};
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1780998600.git.stefano.r@variscite.com?part=2
