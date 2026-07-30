Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF24B443AAB;
	Thu, 30 Jul 2026 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425487; cv=fail; b=jOc0XE4EZWvIKRZdVsdjtJl3fTncLRpHqcWYOtoY2o8wy5aJEE1fcRmmMAAI/KwAjjQ6SeLsmtH5GrkJ7O3wKH/YznJ3FsqL7fGGPZ0Vpxesf8rX1sjktqK2v4EH3w0M2SbwXJYFGb6u/gc9i94K+ohPyLDe0Ozh21BG8O3ZP3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425487; c=relaxed/simple;
	bh=fEx2JaRGllFj9cyXR3/tzEi3Gm9sVIgJgYkQC8fynjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZttetQ2FRGGCGdB5fVwAG1uM5qjakFGX1HJbPXtg66970pC99czTMDQOCwpdjCzEq3rXMlNk5g/6pIcHWuRkqpdqrSpOaafohXleuu1mPLXP1Cl2bN0csrFaLCAL4AQXjUfVgKrishEI2CCXz9ilttZTFw1xMzhkZwDkLSqy3yE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GnXDpn5E reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GnXDpn5E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mytenpye7YzpbQQZwnSp+dyNuaDhGxjZl3MdDzeK8t51sBkvJanC99QWdXEac6vHLD+h+2Z1OsXnBnXUSU+NITA5/SvMlEOYrwLiq4wlHC9tpcoiFiNSOvovxfSZVVV8ZaGrgsppYoZuU65eso3VkIfv5RQX7nqLnZ/AwgPMbFLPilALdVPHhjNfgHL6bDAaPPs6qME/b79DrIaLCysPng/IwK66fOEtD5zwsu1o2Q8lqTII7BysHbFZTH3997blcFJqzQQmfjOzsodyNEOyWCnhzEpcJclCQTLIwXy6MRym9c56S6PwYD4vRcnwITViDuxiH2EYWHdcSauKmaq0dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9dP32/8zOEaORB8bGE162NGm8SWvDhggDvPTm12irY=;
 b=m9V1eDmAKyYs9WcVXkJEptDGv48t1Vgiim1je8y0uxeco02O27fjiRlW4GvzWEXzeaIIF40ojQJjLaiLqMAOMGW2baC1aOhlPFrAOrLuZRQ6LT2p8+sOr+LJNZHW4TlKIiF9vwokFQEcB0Lp9OmCXQnutZsplcOtfSynZPBFRhDbFsJfAHx4kjo91tnUK6iMASMkT/HRURMj8siYmcBe8q5O2AIXLVmbfP4n3BgRpImz02VD9Bg9yq0WzTppWZO8qXWQ6K/zoIy27Hwi2dNVGfLBcNVCDoltF8l0/5YLjzPpbQIx28gHsN9RrfMDMYpRlcRyUwouKSYi2Vjjdc2VBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9dP32/8zOEaORB8bGE162NGm8SWvDhggDvPTm12irY=;
 b=GnXDpn5EyNxWnw8iwLt6LC5Nd/n1ILh0oxnBNXsp0llK5VUR7YArRlXjGeJ7MATOiiLzjBvLx1hjehLpfsK9y7+xVLrvpmFKWd2hBggoSFHnd19aVugKqH16GLjopa/rxY2yjW0HJLwjNUGPwdFf8t8fmxgy82U7YPp/dF36bRsVdpNMcg7B6GE4Mp9J++tYKiUHQf4iaTIfJdAkTp2HvYYtFSyRYHUGicMn0YFJOgSNR1dDYDYDlqkHHJmzhEQZYRvuJoaTDVoqBaguOxL0t/4Ht4E4JAkeB3XBMOH7/rYWMtYrRuyAbJ42Bj7PylZRZ1hYCTzkh373Aee4AD3Z5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8508.eurprd04.prod.outlook.com (2603:10a6:20b:433::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 15:31:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 15:31:22 +0000
Date: Thu, 30 Jul 2026 10:31:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marek Vasut <marex@nabladev.com>, Frank.Li@kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v7 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <amtuQUa0aPGdlRCT@SMW015318>
References: <20260729214723.557461-1-marex@nabladev.com>
 <20260729214723.557461-2-marex@nabladev.com>
 <20260729220634.9AEC31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729220634.9AEC31F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH7P221CA0036.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: d910bde5-3fb3-49df-ff24-08deee4f9be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|22082099003|18002099003|11063799006|4143699003|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	efzuEgfLaFzaPow2o0IdnWDXLVBYXzDHsDVRJ+EPn06Bjf5d6Zd1EmpQXEktdbMh75oql+FsbpALxAjx/BOaTAy7RfRyREFKF30phpa1sIQDnQBT1U88K87OPH3TVnUGxf/A/JCPskBFN0zppuNFKAF56ml6DGepfNYjFl8YGie/rS7GPNj1hJxIDT5zDFngV34I1VaeTjzTfU3OfqtNOfQ2zm38LqpOWqhNNmWKOH4gROio5ifYftARDnrKNgA7dIOL2W2u/TQit0pPQWli+DSJB/4PzMbo6sLn6lih+tpxyI7sA7RD7xZhN4tK6yvxzjcMnXw4X7RQINX+VgZ+ROGj6+3VQIS+koNGtFfgjexCHmgu6wDwxZfiSI1hmDikmjg2mJIddY5zQSCFU4kcjvsC0DCknbbWnJxvQStGMgyv1vvAt5q1zAHnAHuIDCel3se3mzO8XyNhcMq71ROlpKdSG9/87aV0nn2Sa5KeQxo/Td6HFLAyZvz2shntPkag/WhPCOfKAu2gNnA6qm0LU+uhHaRP9Mkgapj9c47UhySLWI7WiE1yXAzH6qPxgHLDdeGPgq8FYbMGATTEJp6OI30FY7mjbpJONaYw0wsqEHw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?birJfBDOzuJBL0wpdsDKrAQlM/XP6ME8QhXFduTiJ6Vceph8Yt0lrCm/MT?=
 =?iso-8859-1?Q?Aol3GGqfxRfhUZ4x1y8wVQov7luh2PLXwS5ndFQkjiFtL4SKxtNgX6JRCd?=
 =?iso-8859-1?Q?bJa39ixEOXsXlmCIr5EUX1WQs7GmEC+Xc2RMmFN9DSfuArACk0wOlmt47w?=
 =?iso-8859-1?Q?MQsaJ8DHw9AyCyhgLP9dbJQrUgQGOvts99wabkNdcBO3TxiewW10VvxeUt?=
 =?iso-8859-1?Q?8kw4NlDe9sCcSuGZx/rp2hR5bj1oe5v8krvbGA+I+LiA0rFQTsf09P96w2?=
 =?iso-8859-1?Q?HVkCvICuS+9I13jA37QRXiDGWPJGZFuOlvhCMGvD0doPWiABD0Rbv+iCT9?=
 =?iso-8859-1?Q?IrU2HahB6pWEdnDvxbWw7bv5sQNSy7AmVaj8ajlaxCO8mOz/25OKfeyZ9g?=
 =?iso-8859-1?Q?qQAdzRtFh6MVPE/XZX208SgkeFXWnYRoGkO6tdV9n2USN94kxdHtdblYVw?=
 =?iso-8859-1?Q?O48VCnWQooSfY5S/eGgaTS55Uoe5eIctO3JpVNINEKxNjb0/avbWpV/VZV?=
 =?iso-8859-1?Q?k9C/02vIt5PxGeFrg920BccNyV1KBOX4xnomF/WgRUAwaiB8Y9AoPsghy2?=
 =?iso-8859-1?Q?NHVGornPbXHRyTIby21U987+cH3QcMGBzJgoHoyrCLrjv32jdglt8qwR01?=
 =?iso-8859-1?Q?QzaEhU3xWzopvKsYmEnC2w3X+mlUrPgLBxPz3G3jJn7TTmpJIMPieoISZJ?=
 =?iso-8859-1?Q?D/1Y104KtZkuLNBt6PS1RAXrggJ5Yfxzaq+se9B6TXATCOquspZulnNIjJ?=
 =?iso-8859-1?Q?UOJ8RJbRbTEDVS/YVQdZ8quUmVhYS5QBJeBxBp2ErWNjl+jymLlALjCYFe?=
 =?iso-8859-1?Q?oz4MmcJVNP4eFTV1v461te/aJn8GNsJESFo6S+Mc8sWPnkwHIXcR4G/lvR?=
 =?iso-8859-1?Q?/WWGaQZ/IS9CCoUl4rzBPvB8461xmgcAounPzdcFZTmMO01tJSKmjKilMB?=
 =?iso-8859-1?Q?pKLctuqBO+qmaO2id5+HyFvVPJY/y7JBqLISBlulsul6vWcEKbAEnOcuoY?=
 =?iso-8859-1?Q?MzKidsc7lsy4VarYLuK0hS38jsoA+eC9DPWx4G6/KicZk2vWuQgtAo09Ud?=
 =?iso-8859-1?Q?E1nHq0EJe6IpM0IL0ebS+ynp6K9/1HudBIeKEJnaEthcYiMCSZTcK0fntk?=
 =?iso-8859-1?Q?tz5oklkRlvhDqo5baLCDXzkI3KTMe4Nx01d4N8eilE97jtgqfAVielY5Qi?=
 =?iso-8859-1?Q?JT5moX/wIbJcxO6xIBmORScwUFjrVvR8zXuN3Cv2SjjVDOjosNG03uNnY5?=
 =?iso-8859-1?Q?ZnYcsNMndb0Y0iP+h2xDYrQbeztMmzdQzqyQPELxHYfM/5JsbEKPD/EmpX?=
 =?iso-8859-1?Q?kvNJ0RBuLDW/ErJjV82s2zO1S4yIjzlaBS/JU0ulEYXQqr8CQ4bgmJYKt/?=
 =?iso-8859-1?Q?gmV6f5OBalzwXU48jiVKmc25FkBgSFq7YfxVF6sGpaW1AhMUrmbDCX6H8V?=
 =?iso-8859-1?Q?gX44ccLm2lqVHtf44L4xILbMJV+xEwYEWOAVp+i0bQhVC1GCH4bgXM+ftn?=
 =?iso-8859-1?Q?VZkycT1h64jIa5ERZC4DvDp1C+oMxNirTq3zs/xbDkSy6l10ZFakhA80kA?=
 =?iso-8859-1?Q?10saGVf8rO0BbXON+LWCdcFkcWX/K8vbeKRPGxa+cpnAvbmFEh3bB3W8Ho?=
 =?iso-8859-1?Q?NZ0cM/nVcL+/LObGKSJJ4h3SH+WxOG5xNnz3ajbtcxq+zFq3suBxfrrPJa?=
 =?iso-8859-1?Q?szYzQSsdVlne7M4upAX73xtQn9JpDls+O3ldlpPC1qXXzTZ76Cba0GmSO2?=
 =?iso-8859-1?Q?iRItZC5huJpyixVxo9mw72GurlhguuyTjop4uZoqCZGvZSJOJov7UVxykP?=
 =?iso-8859-1?Q?B75LsFFbq0fbkP7GQn0X86Vr8Xuc4/nbQ9TV8ax0d09SXvNkwDiG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d910bde5-3fb3-49df-ff24-08deee4f9be0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 15:31:22.2500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4KVOGFMzaH40GX56bARUP/4mZPKay+5SjkQ3sYOVlGVquRAJpG9jsQxlQjOguS2WmInQTQuH5bwPxwDSowUrnML/koHZdQ90YWLBh6HNBMV1V+Jqwtlpd94XrgIgwSs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8508

On Wed, Jul 29, 2026 at 10:06:34PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Incorrect backlight enable GPIO and pinctrl applied for the g215hvn011 panel on the native i.MX8MP LVDS interface.
> - [Medium] The `assigned-clock-rates` property in `&media_blk_ctrl` lacks the required `assigned-clocks` property, causing the LVDS panel clock configuration to be silently ignored.
> --
>
> --- Patch [2]: [PATCH v7 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC ---
> commit 57ce2b382e55c1c98951209e8e0a8f4ea3f2c65c
> Author: Marek Vasut <marex@nabladev.com>
>
> arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>
> This patch adds DT overlays for the DSI-to-LVDS adapter populated with a
> Lontium LT9211 bridge on Data Modul i.MX8M Mini and Plus eDM SBCs. It
> supports multiple panels for both the bridge and native i.MX8MP LVDS
> interfaces.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi
> > new file mode 100644
> > index 0000000000000..3585170bd59dd
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi
> > @@ -0,0 +1,30 @@
> [ ... ]
> > +&backlight {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_panel_backlight>;
> > +	enable-gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>;
> > +	/* 6.5 POWER ON/OFF SEQUENCE, T6 >= 10 ms */
>
> [ ... ]
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
> > new file mode 100644
> > index 0000000000000..a6d13c3609796
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
> > @@ -0,0 +1,36 @@
> [ ... ]
> > +&backlight {
> > +	power-supply = <&reg_panel_bl_supply>;
> > +};
>
> [Severity: Medium]
> Will this result in the wrong GPIO being toggled for the native i.MX8MP LVDS
> interface?
>
> The shared imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi file hardcodes
> enable-gpios to &gpio3 0 and defines a pinctrl. However, the native i.MX8MP
> LVDS interface uses the IO expander's &gpiowifi 0 (via reg_panel_bl in
> edm-sbc-imx8mp-lvds.dtsi).
>
> Since this overlay only overrides power-supply and does not remove the
> inapplicable pinctrl or override enable-gpios, won't the backlight driver
> toggle the incorrect baseboard adapter GPIO pin instead of the intended one?

I am not sure what's bad impact to wrong toggle enable-gpios. need check
this,

change exist ones to keep consistenet, all use enable-gpios or power-supply.


>
> [ ... ]
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso
> > new file mode 100644
> > index 0000000000000..817d4ec62d0e8
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso
> > @@ -0,0 +1,24 @@
> [ ... ]
> > +&media_blk_ctrl {
> > +	/*
> > +	 * The G101ICE-L01 panel requires 71.1 MHz LVDS clock.
> > +	 * Set IMX8MP_VIDEO_PLL1 to 497.7 MHz , since 497.7 MHz / 7 = 71.1 MHz .
> > +	 */
> > +	assigned-clock-rates = <500000000>, <200000000>,
> > +			       <0>, <0>, <500000000>, <497700000>;
> > +};
>
> [Severity: Medium]
> Will this clock configuration be silently ignored by the clock framework?
>
> This overlay (and several others for the native LVDS interface) defines
> assigned-clock-rates without providing or inheriting an accompanying
> assigned-clocks array.
>
> The base board file imx8mp-data-modul-edm-sbc.dts does not include
> imx8mp-nominal.dtsi, where the assigned-clocks array is typically defined.
>
> When assigned-clocks is missing, of_parse_phandle_with_args() returns -ENOENT,
> and __set_clk_rates() silently skips setting the rates. Should assigned-clocks
> be explicitly defined here so the panel clock frequency is correctly set

This is most like false alarm. But for better read purpose, suggest
write whole group property

assign-clocks
assign-clock-parents
assign-clock-rates

Incase some change order in soc dtsi and forget update here and cause
wrong.

I met similar issue before.

the similar case is clocks and clock-names, should appear in pair at
every where.

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729214723.557461-1-marex@nabladev.com?part=2
