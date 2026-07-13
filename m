Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698B13CF213;
	Mon, 13 Jul 2026 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783956572; cv=fail; b=On4kZlnNTJO2clUWSPSu9gKiIfNsiriEmArDQcAKSeEA/0sEiBvSklIUpGCM5qcJAQDS69Z3LYLBGfuyZg2NTRYGiAJ0fg3DgN+C1WaEMURMxhQyJBQIIUtTglTTzsY0mv8uFWjfwtDERPkQ4KVuRLnfVQ4jpj0IyHOiJNJ5ydA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783956572; c=relaxed/simple;
	bh=u2gJUR7FKJtZ1yRLZwvXyrKmflkBzjCoQPkcA10Hgto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oSsApqP7effYLh45EvETkxpEsYHSrmNhpmBP1r1mZH4ozSKYtwtKoN6/60vWarW2cXy3+ZqwZRUTEA9CO40t7qVOcsBJ9VbcqVHbAGsyJmwX28XaNpxGeOmKYIWMIQ57me+iyypChw1UW66utQGVq0FaSA7XoeFsWkJ9/NiePUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wRw4yI7p reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wRw4yI7p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbv2t31dWu2KxgAfkHl3R0zKGQI3WRASpBvkjUP13feyCpVqrjIWRq+O7LNCq5BdXmkg35Wx/ePdBSbNSlL4nfSlHPQ4kDpFbBGhU08GBGvZFY3QDKNW9S84p5sCBi+LivPpEkvVukyq8H8554Mx4zSJuXFxo8wlkXAY2bz0vEBn8vsRv/9J/Z9oRowtO7MQ+K3AtQcjzZkRV2qjltsqH+8suqIkoixgsXnvAC/2hYhEad9w/P8QIs9az0cOWFNksubIi1FPUKxwh6ZJXPFpPQC5ZZMNEf0GJNPVTObp/8rSVfsjI49J2L2FLJMqPdxpcy3Yz496XzMWlH8k9UtuSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyKWj6N7vAHRj0c31jSOxaFA52om9mjx/QAZHgJuDMA=;
 b=V1Vs5AuRSOh7SxRQDlsLbPrpmXY94rxHLn1M774OlbGI6/R9RLZqk6XVomBZG/SeGJTOK8eCDLXO5o2Xj23Y+CRhfyrazY0hfkVl5WfzzkWqYLqTbjtK9ZiI8Kn7UIjFXiKupU4i8P/nGOTli/lBDArmO9EEOPgYvpp9thfIBg3TJ3ALiZZs2uRI2Ym1KcFCGZ9yuEoYky2/AScNqB8ZeYLmC22lwNI/G/ATzjDBbELNSqEsZm21T8gIhVI5Q7CTn0yqoA8uZJ6hzyxu0DmzRUZZBfQV92pikY4n0EspjZFjOnzFdrFI8OmOSRazmPoLyonNJqCW3r9Pfll/DTSW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyKWj6N7vAHRj0c31jSOxaFA52om9mjx/QAZHgJuDMA=;
 b=wRw4yI7pZEMypOIUkPTSr2j/InfO2TX3cSEqaqrsSI4m1fy3Y9PlhH9CgerZWbAfK019DFtFwHMWtC0X2zG6tmD3VLRyLpsPkVaiCk/R/6JFs5CUHazg+GaKIO96hDuxwIJL7bXiBidmVmlm6Sox7TwwJeU5knFe77GiCckf4MD5Ci1Qdp0Ds3UtFuYpypIpD1ARgbik2xgWT3ro4ExpZWg2IrzFZQY3Bt07n0EgIHsMJFrNgR1Y0U5ctc0o5+HRS341Z1TT5y9/Z9qlUGLaaw38itFYroIzkYWkM9oCMiRUSAqc40qhDZRvm8TYkesFYQY6f+gUGe8o+r7J6jg9xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBAPR04MB7303.eurprd04.prod.outlook.com (2603:10a6:10:1af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 15:29:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 15:29:25 +0000
Date: Mon, 13 Jul 2026 10:29:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, Frank.Li@kernel.org,
	imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: imx8qm-var-som: Add support for
 Variscite Symphony board
Message-ID: <alUETGmhNEpJ6lwQ@SMW015318>
References: <cover.1782812572.git.stefano.r@variscite.com>
 <2cdbea18bba7c9e05addd24390e54063216bcf88.1782812572.git.stefano.r@variscite.com>
 <20260630102109.108461F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630102109.108461F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH7P221CA0073.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBAPR04MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 172e94d1-f29b-4315-f96c-08dee0f38568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|23010399003|18002099003|22082099003|6133799003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	D8hQQ4wezsLpkI5b5Cu7d6sgAKTpWgHWbp2A5bdCs3/fJLmSnCeVLu0Yppgi/Yo3XI/XoQCmEFrk0VIWTxkewFHa/XZOoo6qtmy2I1DlfyEuDvFM6hvmEpftOBjwSpnbBAtmI1Nde6LIKTqW41wM8rgMrZVyp6+WpLGSXnto/sx5gzkKpAMRDrG/GPvpQcFEM2b5OzCJQXDhjvukmVWHyUV2zVuFu3/6SDYHBhxKd8Q2zTULkd66lmoxYUAUp0m1hwNpeYaCQbcACZ0HoGZ6ruMoChf0DwgyK14x7kv5gy5rr1INj2Um9s7FKR7KNXU6iOA3Q49dRO2tkpAaiPy/1vTnVEcgnFquJ1HN2SOAYLpBCfFx9in43jQrRT4wyGOVaGhiCTfCzDJGCHEz7RujL+2OJO5md/rRN+Bea8aFnbQAU8JbiI+po8jgNDqmXd3Jv8UtRUcMf6ZEmlcESFm/OpXWvQqASDPY+e4cP3bX/RiFsr9WuceN9nRa73HD7BKwP4LTVSUpSvQFhJqcsdxAlU/z9XILh6FwH3iIEPJaitxKvHfDYngc1c7ZJ3uVe1G5lTLBq3M6QgiOXCDsbS94ms9fr4wvgOWISoipv0FssQQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(23010399003)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?3mkvEwy3W7HHapRJ8kMj78QB3whpTs0Yjrh3D0qTCM6NJqaJQEKTxlluxs?=
 =?iso-8859-1?Q?JgHmFVEpAD/g0rbOX6xBaDFpIAqJLI+T8yWvKgDGekMe+SAfPEne329gSX?=
 =?iso-8859-1?Q?lheBmo/SDxzj37cmeO2DnOCVAbZ2zhXcTwzUmGfYMHa3ZsUlYH+HnUgHdU?=
 =?iso-8859-1?Q?ijw2hg5rGm55aDdg4pm2g2x80HpSktNg6o2zyeZ+YHuNcSv5FaL9DHoRFv?=
 =?iso-8859-1?Q?97iVqqmNEQkzvwlaTxxOuWgmOU2eK4BRCvUlZEDVIigE7e8bFAk71EFcyp?=
 =?iso-8859-1?Q?JtYnruoSnCnq78wv43ltOvWpHt9ld9ZBS1cfNcwh7NqI09m13+3XvbXx7Y?=
 =?iso-8859-1?Q?1SKx7Eue8JHSS+3krS0wf33kMUipOznUbJiX1Qz9UIaNFbL9l2gwchUxsI?=
 =?iso-8859-1?Q?DLUDamiO5HFPJZ9Vr4apggelf7Sey7Vc1NFI3idfQ2mCX5Umi1eONx81sj?=
 =?iso-8859-1?Q?Z4yuoAVCRf8JwZyhQnKgb4YDCusP1DIkRKbCV/bGcTjpRt+IXVqqDSg+SB?=
 =?iso-8859-1?Q?On7+wSG3qyAwRfNv3yAba+cQgFT43lWfbndxOp4iHeaPE4hdDwrpPx/c+N?=
 =?iso-8859-1?Q?am+6zmIItXT1pg1KmuM+khkA9VTl0Do+VBpHhGuhQrAuL5P6774Hq50llM?=
 =?iso-8859-1?Q?sL3C2D3BXUc1fE1r/h/0xw4FW2oLLDXhleD3/utVEwjJgTExLN7WUTxEgl?=
 =?iso-8859-1?Q?yluewWoFv/UPRdm4jhMwtGooE0Pn7uK7+E4AbuKNs8AJh9hb5CKniXH9+G?=
 =?iso-8859-1?Q?ZaUtDjxlML7s+O6AYOi0ZO2M8CJUHRmqT79e8BZ6nmxK3b4ZiPXDYf9eAy?=
 =?iso-8859-1?Q?A/9pGgucmJ+Bp1uz7JDOTuXoG5AtPso/oEJSmtlzmgJOzw0A0lGaXeVHWT?=
 =?iso-8859-1?Q?iLBpSVDRgfx98OIxaMnU+VLFBmJjWvgTFnqNm9R99XEiR05XF1v0ESiCQE?=
 =?iso-8859-1?Q?JfJMY9LENtQm3arBXXDLoqkYbeMYaxEjR6dV/6LDcvEuEBET2ZvzW0xzwF?=
 =?iso-8859-1?Q?wkIQq2KzLL5io7LniM8gjdsRTZGuznlr/CU5+AQrEihQgiyJ6CQ2SGm/wZ?=
 =?iso-8859-1?Q?Xbq6sxs2/e8XBMcjulVFBD/Q8rcYFNCAFaRc3E/ST2bL/qvDxtelTAH+0X?=
 =?iso-8859-1?Q?CX+pGBwc67UvjqaMDv0I06ormb50Fi/OM+HE5xs6YVYB4cubXzkelMgI90?=
 =?iso-8859-1?Q?v3++Byq8mDddmHdo4EcXLCN1RxJZvwGkCbLwQ4OI+Tnl4mRUMq52t7uWB9?=
 =?iso-8859-1?Q?FU5OvbA+tjIxIBpRPgyivQTZOG4xFj4gJQLbs7EM1j0dlfdYkZtQpbUZ9S?=
 =?iso-8859-1?Q?HR1wOBbG2KVn897GgUHwFpf+KShcioFf8F82SMgGbUH20RwWZs+XVjtL1P?=
 =?iso-8859-1?Q?n72IfFA2UADlk7/Qz311p2/FASEcdS9tpKm6JN8H6lJkmAgrsQ+FNc5fRq?=
 =?iso-8859-1?Q?07IQOVfLgFLL6wiG8IrVJwhUw1J6mp6+f4idgnumTgfXL/gl3kPJhkladO?=
 =?iso-8859-1?Q?//kyKRsygIYSXtzuhS+UHBfsUoJ6chU7q2Gt5NlfZhUE4yeFvX3KDXqo2A?=
 =?iso-8859-1?Q?Kebadw7EbDOuOi0/CnuYpCXVk7xpKhRSk4NqNItqieYDliYNE9lXSotxhC?=
 =?iso-8859-1?Q?ZqaxIuY8Nw9YOJP9aTo7a2rQAJwVA7gBz7nJcEJKzikiNgCo/LqbQGjOMw?=
 =?iso-8859-1?Q?aI1BI9r8D+tuJfSPsK9oxFmavAAGGagrH3yTLPnJFWuEUFXkTfjvb0noCC?=
 =?iso-8859-1?Q?Ey6ubU0QBUOV3v7IjO7ZzsbXbYeT35Gdox4D6u9BTYzf/w/0E2IgPAxTOq?=
 =?iso-8859-1?Q?BZrIbsf5adhDYN6EtDVOo5TY8GUl2jq1zjRMF0S1vFjP02bM3EOl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172e94d1-f29b-4315-f96c-08dee0f38568
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:29:25.7259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05m38/dQcLPW6p5QtPRfaYIB/U3aJnJYJ1/hIsgxsOPMBV/OouZxLhkoGDN6dyF2or1CeAAMpK87ItbNe5MpMIE7BlPEOY1i9oIwzJBdZPsWrmV4o8ll4uK4JdOr4aFz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7303

On Tue, Jun 30, 2026 at 10:21:08AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The PTN5150 USB Type-C controller's interrupt is incorrectly configured as active-high (`IRQ_TYPE_LEVEL_HIGH`), which will cause an interrupt storm.
> - [Medium] The SPI chip select GPIO is configured as active-high by mistake, breaking standard SPI devices.
> --
>
> commit 640b696a79494ebf66cec9e81eee16f6d3d56651
> Author: Stefano Radaelli <stefano.r@variscite.com>
> Date:   Tue Jun 30 09:46:56 2026 +0000
>
> arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board
>
> Add device tree support for the Variscite Symphony carrier board with
> the VAR-SOM-MX8 QuadMax system on module.
>
> Link: https://variscite.com/carrier-boards/symphony-board/
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
> > new file mode 100644
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
>
> [ ... ]
>
> > +&i2c1 {
> > +	clock-frequency = <100000>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_i2c1>;
> > +	status = "okay";
> > +
> > +	pca9534: gpio@20 {
> > +		compatible = "nxp,pca9534";
> > +		reg = <0x20>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_pca9534>;
> > +		interrupt-parent = <&lsio_gpio1>;
> > +		interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
> > +	};
> > +
> > +	/* USB Type-C Controller */
> > +	typec_ptn5150: typec@3d {
> > +		compatible = "nxp,ptn5150";
> > +		reg = <0x3d>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_ptn5150>;
> > +		interrupt-parent = <&lsio_gpio3>;
> > +		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
>
> [Severity: High]
> Will this active-high interrupt polarity cause an interrupt storm at boot?
>
> The PTN5150 hardware pin INTB is open-drain and active-low, which means it
> idles high. By configuring the interrupt trigger as IRQ_TYPE_LEVEL_HIGH,
> the kernel expects an active-high signal. Since the idle state is high, the
> interrupt will fire continuously as long as it is idle.
>
> Other Variscite Symphony board DTs correctly configure this identical
> component's interrupt as IRQ_TYPE_LEVEL_LOW.
>

Make sense, please check it.

> > +
> > +		port {
> > +			typec_dr_sw: endpoint {
> > +				remote-endpoint = <&usb3_drd_sw>;
> > +			};
> > +		};
> > +	};
> > +};
>
> [ ... ]
>
> > +&lpspi1 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_lpspi1>;
> > +	cs-gpios = <&lsio_gpio3 24 0>;
>
> [Severity: Medium]
> Does this active-high chip select polarity break standard SPI devices
> attached to the bus?
>
> Standard SPI chip selects are active-low, expecting the line to go low to
> select the peripheral. By setting the cs-gpios polarity to 0
> (GPIO_ACTIVE_HIGH), the SPI subsystem will drive the pin logically true
> (physically HIGH) when asserting CS, and physically LOW when idle.
>
> This means an attached standard SPI device will be continuously selected
> when idle, leading to bus contention. While gpiolib contains a legacy
> quirk to rewrite this if a statically defined active-low child node is
> present at parse time, this quirk will not protect dynamically added
> devices.
>
> Should this be updated to use GPIO_ACTIVE_LOW to match standard SPI
> behavior?

make sense, please check it

Frank

>
> > +	status = "okay";
> > +};
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1782812572.git.stefano.r@variscite.com?part=3
