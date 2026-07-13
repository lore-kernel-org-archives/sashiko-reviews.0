Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EDD3750AC;
	Mon, 13 Jul 2026 15:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783956061; cv=fail; b=UaKQ15ZBHj6ZGYQbuARiTILTBrILaxYR355u+iBYkwtiE0xvnydVyPO5+jBUhVVWD0FKaG0/iHJKS8MkdTN/ST0kfQ0CMvGCakRqJFPW3vJsb21Pa9Ber1yREhSLtOBml0k0wmDDxQCmHniYm2sp6dg9/5UBX0jhHoOJR8/waMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783956061; c=relaxed/simple;
	bh=tZXADPg8BzIelCvmLNDY2SGr0ehhxvHKw7Gd2jlT22E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tiee3DpYxyswzRlZGB3bXXCWvQYgM3xsfX3YFXoX4DQcfwH0lsQiMwqvSbZEmzx0Zf1ApTcINrE22ZNAf+FRiTUViBCV9aCzRaIssD/gYOJy4DQA7CMMKxbnay2qjZHjmJM5JrPK7Tri4UGZ4TUi/A3GGZyOcIEg3Tqt3tT9GaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nkbjekwh reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nkbjekwh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KA3dVWOjb9itSqbQ59BscIWX7vB/zLhqt+R4bE4ydwWJtcz/2ZsF9HgSfahlrd71m5SEnbnvmdeDeOWW1AatAjxvenIyY9YhjFh2gPIUz/T1qoQcmL5cpVgCS4qX6d5uPRGN4aFSAcuUE3ZmtSn5fYhHNaG/Yqr76KvCG8w31Rple0JwiiSsiwidwCLzqFz1FoKjOmFB6PSshBviHAf24LJaQbsSxYMkWg1CI/Xh6RgbHi0xgwgxWptKVC+/3pcvmA5+O+fkd94g0G6I6iL1QpP5sgq3RrP0o4ydOGjEMhsgvHV8MUYnNpz8by0lyOdzObufxEfjYYyc0WemMCiYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnON8DURpBSTExYZ7LNRalkIW+L8D7Yx3W1wqqWK9jY=;
 b=nveTr3UueC79yPnrxuNg8HaLYXf4MIQ93urPiQGeiCNe/7oUOOPEk1iQGIOz+YOBnD3ljZDO01pAFkjL1DI2tYn8GkLpfycOd950QCQO3ke0UUNnwzbye7eGZdt+HjOGfm+e759MvlJPbDFnpssFfuYq48EpTOATMZ7Q5H6q5YyyiclMSvxlbYxBDxPyCBfqgDOqtAcqV5GCOaBQrzUs+iiJY+JTC2eGKre1SLhSvUAtNC1SmhLUBnqBi8+8nzOeeOsbrsSDa5HKNFPpp2iDcqCnCt9dmVu+6P4APUEy/EdsurrtHu9lNOy40fo+XGQHek6TLKuI25PpPkVWhApfmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnON8DURpBSTExYZ7LNRalkIW+L8D7Yx3W1wqqWK9jY=;
 b=nkbjekwhl6Uv6TB/VWJ/vwp9u2dQXrylI/BXKD+FCxVGOTCrw/onWyzJYBuCTraNErquy3DNL5yCD5oNr8LQHBxRzQGAls3mx46X8sg+wviDU4coqc5WC7tzZBrvx+Y34VMDpJJc5fLrDEwDoEzliYyk9+NkRWYCSPwpOfuxoGX8k9wa8G+EiWKnLpR6DPhACgZw7FvEMEvPk88X2Mie8T4LDJNiv1vun4oKJXqVGnw/DHlcQeZsf+kR2tGhRKAcl6w/XVhchDZmiRf/cPlhZ/X9Tgy2s0foxlrwF+Lgu0n7QYgYKAkUfh8T7Dn72aHhxsoYBoCVVaK5czkM/xpBcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Mon, 13 Jul
 2026 15:20:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 15:20:57 +0000
Date: Mon, 13 Jul 2026 10:20:48 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, Frank.Li@kernel.org,
	imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX8M-MINI
Message-ID: <alUCUKa7UbyCSnzG@SMW015318>
References: <cover.1782571383.git.stefano.r@variscite.com>
 <17f248241982c2d421e83475d7e0f8b61ba50198.1782571383.git.stefano.r@variscite.com>
 <20260627150042.8F9A91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260627150042.8F9A91F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA9PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:806:a7::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf87db6-3e55-4289-89e5-08dee0f25633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sIt7jgputtsxGN5lHErVjVfFNQzo0JxWoK4DFRJKScz161KDVw9MYPlUmRLacL6slV3+59z/ZaRVa1oPohP7o55fJ7iegmKenbrVEyDXSFdNGSfJErSRU3kFaTDJ9/w9uMBZQ3DntPlSFCNC2iyL4QCJLaxeu9/mw2vVDWvBbg9+fzp6G7Nxt1dQafGm4BklgLybYOwhcmg+o2aCsEkAAk8NFZby1hUfdylyyGvNI2CmUUNhaLYYcil98/z8N3OvmtpDkEf3TVVgDm68ux6xTGMx+WGebYruRe7FtToFWxcFxsnUfuLvZM5bgGFxHf8judZuk4yPcWHFg5DcPLLPVpDrNWvsyIrKrqpi9pXszNY1LdocCjYH8jIcXpHeg45GIQran0DA58g6Xs4bylg9Ux9RKazKOPl1UNiTjFcBqa9gZNdJm+SP5bYWCMPADzTp4H/QGhbg9kA8GOpAP7VfZCA4Ep4PIMSVxoI5UlzHdv4jnmG2tb4M68848Wl6mu05IVu4slueyGKpjNbBBbA12g4Up5PJ4NCvjZ8w6QbqeWe5CF9Qg/e7xkBx31Sv+Gf/2hz4QPG7WQyt2InecYZ+BPVQOyLN6GQxqBmbd9Vj9xM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?h7NpgBShCi+YsiEEHqF6uHXZtCN2sJ1k/HNRq2Li2Imt7QMnBVTycmooR3?=
 =?iso-8859-1?Q?B+nPb/efrh096xJXmkDdJbsjB5CeoQ8saNzL78EWnCql29ZECxY+blQADd?=
 =?iso-8859-1?Q?2ToKrJ8uQ4Ru/p8dw+y6RSuUE1vrWGzeh+FiZeMRIhnaJJNcmm3f9aAO2M?=
 =?iso-8859-1?Q?wDGXTnq6LpSN7UMx0EIZTS0PxCFvYA8fdfIpmw4WEV26VOCuUlq1nZR58l?=
 =?iso-8859-1?Q?32tQweYhJ2Uuf0TMLko3kWhNUlkKWHwexqPw05KALfBZUM8T4A91tOHH5r?=
 =?iso-8859-1?Q?qusElcVo26Ro1dEt/ZR113OeFo7X4i+L/jM6PkGOQQloUgo97eKv5jAUS3?=
 =?iso-8859-1?Q?xMX5KHHWBtg2/vnAduFd8KRO7nx8rU0ZXwh6JVliqKahpwPMog2hTuXmEE?=
 =?iso-8859-1?Q?KxKGotE4d0fot3BOET8q2mXHeZYSj5p9nqI6GezASO3u6iXZneT5t2h39s?=
 =?iso-8859-1?Q?z685BKUic3CgH2HnC3fODcqPjEn6Gut9jfxwEQEg0lVKCnrMbMpa9PKFbp?=
 =?iso-8859-1?Q?NGvePgksL22RtpgMGq5kYhLrRiFh+EbUfmklO+zMYnEjwlHbS5AeFPm9Ym?=
 =?iso-8859-1?Q?INwkfKSHn6ztDORazJZbpbdo+/7xvJ6RRu/p5y/IqUoRzcAxOebWiAgi0V?=
 =?iso-8859-1?Q?DWOaxnx75UOPZ/HiDLaWqZuqwmxkJrKlehH5WopBsko3FkUKRnL/FmejEo?=
 =?iso-8859-1?Q?+wYFVuWoQVAgfRvyPywa69WYzb50HjabmhoxkY14g3YDJGphu6L75m5vlL?=
 =?iso-8859-1?Q?g15qWVCKubqawzowwR1TYyVwKh0TveXwMSCmfi/1k05EOlf1RBykPsSuij?=
 =?iso-8859-1?Q?9EXNvYBbAZkB2uItM+ofP9xygGNagiLmN8/P0WnkzGZ+Fea6Q/BrvKqfDq?=
 =?iso-8859-1?Q?QGDQcIYzz8s9jELsEjPOsw1hauo1Hz1e9VKzcSDuO0KQMF3UEsKYBuTDfp?=
 =?iso-8859-1?Q?GwkAm6zPOb0gAME7mz0L4QFVbRrKRxNfauZ9//y2wn/+Mn4pdMxQFhdATN?=
 =?iso-8859-1?Q?GKSNbrw+f8s2ttsNxzJFdFN7MAke3Oe6PwjtHVmrhXxKHDNKWWxlhxYpUB?=
 =?iso-8859-1?Q?aaQ+qSHJ2GYq03GO+y6ggfBoKeQJpEzl2r4QKN6dbmyKU2jL1uYFfvHpyu?=
 =?iso-8859-1?Q?Fmywf3uCnOaRcsGqhkEs60Wrg3505L8ynVEaTqDE9bYAxhGdM3UK4l8bLs?=
 =?iso-8859-1?Q?Yp/RzJspV1ewTFfZXATzRvq8yCk4o2ZHV21yazABJjZpGpwE+cGOr8RdU+?=
 =?iso-8859-1?Q?QaD6x3/O2jYGM+CaXzooJ0FntjS00oscTXHXrY27s+jEWkHb6urx/jxvwH?=
 =?iso-8859-1?Q?A7x70MwlY9+lVFyuZFWM3XgSVG+bACpuhMg+jshVpa6Bbnu9aUgiEhakDj?=
 =?iso-8859-1?Q?4pRnv3JNaBVMNr4xSUmdNURqzf95hvEi8dAzPxMqQ2dwvi0EJnEv21Q1XN?=
 =?iso-8859-1?Q?LSP0OsqDT6igL3pSIuOb/K2s8jQwm2uz5pe8Vorp1KSDJjmgk+IxHCt10S?=
 =?iso-8859-1?Q?8JTrAuD2p9BPNRokhBF5ooQEnyPqWiMqZYPWNYmBm5tPKwzpRFfJRdiE2P?=
 =?iso-8859-1?Q?bO2UHrg9MV4dnbvjrHUhbWihE+miWf6ruHvNDwXEIWZAKqBi/Cy1t4eCoA?=
 =?iso-8859-1?Q?gkDINBLLZIjAgsRDH5JJlchHZF5ABztIN9UyBMvY4WT259vBcaiOZwgwC5?=
 =?iso-8859-1?Q?X6I5/AH01BDvQXPqkAc9rdS5peBh+2MuuODsj4c1YvzsXTErADIvnZx8wh?=
 =?iso-8859-1?Q?KvRXBwvCedHh83FVTu02HY//mk3t4s18hjQuNwVegD+L9dE3k25ld82TlX?=
 =?iso-8859-1?Q?YVgFyOufHidnOkfOwPYtdK2wa5KmRaxzoY3oiisO0O1ZXOgqjVWX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf87db6-3e55-4289-89e5-08dee0f25633
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:20:56.9203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pxM/vzV9mjsBw55ZPyY5nowVq+wrdEJSzBsH5b2AqlKVOpGY0f+zDRatrKOFYpYj66CoOUYfIrQKr1R9//fO4FTZeMo8Iw5EgRrfCKbQz8nWdOC7Qs+IoUs5zj1CrEW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8247

On Sat, Jun 27, 2026 at 03:00:42PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] Simultaneous assertion/deassertion of Wi-Fi power enable and reset pins in `wifi_pwrseq`, violating typical SDIO Wi-Fi power sequencing requirements.
> - [Medium] Bluetooth GPIOs configured in `pinctrl_bt` are not assigned to or claimed by the Bluetooth device node, leaving them as unmanaged floating inputs.
> - [Medium] WM8904 codec configuration contains contradictory settings blindly copied from binding examples, likely breaking microphone functionality.
> --
>
> commit 4642338fef518c3eba73b9681507dd2dd37ee845
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
>
> Add device tree support for the Variscite DART-MX8MM system on module.
> This SOM is designed to be used with various carrier boards. Only
> SOM-specific peripherals are enabled by default.
>
> Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-mini/dart-mx8m-mini/
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> > new file mode 100644
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
>
> [ ... ]
>
> > +	sound-wm8904 {
> > +		compatible = "simple-audio-card";
> > +		simple-audio-card,bitclock-master = <&codec_dai>;
> > +		simple-audio-card,format = "i2s";
> > +		simple-audio-card,frame-master = <&codec_dai>;
> > +		simple-audio-card,mclk-fs = <256>;
> > +		simple-audio-card,name = "wm8904-audio";
> > +		simple-audio-card,routing =
> > +			"Headphone Jack", "HPOUTL",
> > +			"Headphone Jack", "HPOUTR",
> > +			"IN2L", "Line In Jack",
> > +			"IN2R", "Line In Jack",
> > +			"IN1L", "Microphone Jack",
> > +			"IN1R", "Microphone Jack";
>
> [Severity: Medium]
> Is this analog microphone routing missing a connection to MICBIAS?
>
> The simple-audio-card,routing property routes the Microphone Jack to the
> codec's analog inputs (IN1L/IN1R), but without a connection to the codec's
> MICBIAS pin, the analog microphone will likely not receive the required bias
> voltage to function.
>
> > +		simple-audio-card,widgets =
> > +			"Microphone", "Microphone Jack",
> > +			"Headphone", "Headphone Jack",
> > +			"Line", "Line In Jack";
>
> [ ... ]
>
> > +	wifi_pwrseq: wifi-pwrseq {
> > +		compatible = "mmc-pwrseq-simple";
> > +		post-power-on-delay-ms = <100>;
> > +		power-off-delay-us = <10000>;
> > +		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
> > +			      <&gpio2 20 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
> > +	};
>
> [Severity: Medium]
> Does grouping both the power enable and reset pins in this single reset-gpios
> array violate SDIO Wi-Fi power sequencing requirements?
>
> The mmc-pwrseq-simple driver toggles all GPIOs in the reset-gpios array
> simultaneously. During power-on, the Wi-Fi chip's power enable and reset lines
> will be driven high at the exact same moment.
>
> Standard Wi-Fi power sequencing typically requires the power supply to be
> fully ramped and stable before the reset line is released.
>
> [ ... ]
>
> > +&i2c3 {
> > +	clock-frequency = <100000>;
> > +	pinctrl-names = "default", "gpio";
> > +	pinctrl-0 = <&pinctrl_i2c3>;
> > +	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> > +	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	status = "okay";
> > +
> > +	wm8904: audio-codec@1a {
> > +		compatible = "wlf,wm8904";
> > +		reg = <0x1a>;
>
> [ ... ]
>
> > +		/* GPIO1 = DMIC_CLK, don't touch others */
> > +		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
> > +	};
> > +};
>
> [Severity: Medium]
> Does this digital microphone clock configuration contradict the analog audio
> routing defined above?
>
> Configuring GPIO1 as a digital microphone clock appears to be a direct copy
> from the wlf,wm8904 binding example, but it contradicts the analog routing for
> the Microphone Jack to IN1L/IN1R.
>
> This might expose unintended side-effects by driving a digital clock out of
> GPIO1 when it's not needed for an analog microphone setup.

Please check it?

>
> [ ... ]
>
> > +/* BT module */
> > +&uart4 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_uart4>, <&pinctrl_bt>;
> > +	assigned-clocks = <&clk IMX8MM_CLK_UART4>;
> > +	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
> > +	uart-has-rtscts;
> > +	status = "okay";
> > +
> > +	bluetooth_iw61x: bluetooth {
> > +		compatible = "nxp,88w8987-bt";
> > +	};
> > +};
>
> [Severity: Medium]
> Are the Bluetooth GPIOs defined in pinctrl_bt missing their assignments here?
>
> The pinctrl_bt group defines GPIO2_IO6 and GPIO5_IO5 with floating pad
> configurations (0xc1), and the parent uart4 node applies them. However,
> because this bluetooth node doesn't map them to expected driver properties
> (such as device-wakeup-gpios or host-wakeup-gpios), they are left as
> unmanaged floating inputs.
>
> If one of these acts as an enable or reset pin, floating inputs can cause
> erratic behavior due to voltage drift.

Please double check this also

>
> > +/* WIFI */
> > +&usdhc1 {
> > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
> > +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
> > +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
> > +	bus-width = <4>;
> > +	keep-power-in-suspend;
> > +	mmc-pwrseq = <&wifi_pwrseq>;
> > +	non-removable;
> > +	status = "okay";
> > +};
>
> [Severity: Medium]
> Should this node include a vmmc-supply linking to a regulator for the Wi-Fi
> power enable?
>
> Modeling WIFI_PWR_EN as a regulator-fixed assigned to vmmc-supply in this
> usdhc1 node, while leaving only WIFI_RESET in the mmc-pwrseq-simple node,
> would ensure the power sequencing is handled correctly.

Please double check this also

Frank
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1782571383.git.stefano.r@variscite.com?part=2
