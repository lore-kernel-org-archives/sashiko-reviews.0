Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011029.outbound.protection.outlook.com [52.101.70.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E595E38E5DA;
	Fri,  7 Aug 2026 17:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786122410; cv=fail; b=e8QfTAYu91CTta7BOSHxRyAQOx9REuBpzCFO/L4kEnjKq4bHGOqbp1GrxqcRs1ectk7G6RO5Z/Bxnq/ZvLAz72UHPUQee5kohe7HyLVQHpjYw77GMy1m2KnekCn7Gv66ixJN1PNLU/PXJJ/07HRUfoxvRNfaGFeICMdUxDs8Etc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786122410; c=relaxed/simple;
	bh=ASTaUCIxt6qYTwkha1EiYQtKAhclqZuUWQZBDgiqgpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ElFhXH3k5DkdAeBewETgTy4PfpmYqkB/fxrDSH19/qAkJnKz5RbPZ3izoqODBmW7B0PprUVOhVjsHMgLJfWcVgqLSydgDIGiwzP9zSEHwwva9yw4MPGRP9V2bOlf+i52XLxogaoCt/vFNR+evEG9pJNSsah+DzG14zDQYg9NEgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JAVJcFDy reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JAVJcFDy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdjFV9XwLTelf2oqtt4UA8WB8kwAe8QgMM+HsQjRZhdpNZiIoeTo1GgfXnvt+Dos+2IaPyo54cfJuq6S6zEawxZgkjy8dpGqR4guQd38l6hcZrwbesonjWw0WJLn2ihqmXmS00JjDj1OBlWVxvNpOANLsL/bbogh+mw2epXAirOFktJYMEyoPg3TYo3UbbbiJlyWcsyfVoQU7u4qmDUM/wAapR95V1RgGq79p4zGAvnlO61QTSWA2t6AxZi2RcOTEY2/a83OSyedZgl/kKILdFoHS0lCQuro1xTiF42fE0v/KNduxQP8RaRYr4OsU/xa4+i7i7UH279ksl9nq0JQuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rUjjP1d0ECgtlDQRmKSWC3JaF4qNeIhqRA3XgPW/Kg=;
 b=CcyHogzut/X+v93df/mBieEdlod2O6g26VVO46bNB2ySYes9kxut6Ot7ouerpK+ASDGdx6le5zmYx1RPU5hun1vpvgXZ6TNlNmQzJHarJUls74Aet7+NNmAtg/BztiA8mPjZSKGpBLdckj6rGyKDAG7k/s7sZP3tZNqmun3JbmVmWqixzjEFSLFwWpliuSNAOCJDkTXXtvdqTkqZaAG3gzEmBmfbvKr7VtnvCRORfCxCyxWPTu1PF3cvMGGrDJrUy8ZwUw+9+pqTRxYsBn5mLP1RHA1RRf+ikBJRNI0StwLI391GGDAvt8oRc0MBswnY9Vh8ImGRuZzYb8S+SPC8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rUjjP1d0ECgtlDQRmKSWC3JaF4qNeIhqRA3XgPW/Kg=;
 b=JAVJcFDyMJgvtIYFrZOeJr/IwNk4MzDD4DIQ4sk+lw0xYpIxbXDB9IlsBjCcINwwX19FQj3AHdheBu7RXKf17DbekmMQSHTl59n5xX/zWxQUyp4gGEKxbT6H4MiSxjp/5uEoGR8J4UMLZJQl6nZnAEZ2qTtuLYc6oySQHxpi9BAo3IkOMgElR4sr++ehf+BIZDZ2/bUDeICBoaAPoElxWJfBXhOfA80KB6vjgxeNwaL+AcdLrgzQr0GkebAXORdUDGy2vsSOhfxUyQxzSEgX8om02FFdH0ENgcVspq414nyQ3jY7Q6L8T8QB3kTTz4xFLl+j0bRJZBiOk9Fmx4tXQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 17:06:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 17:06:45 +0000
Date: Fri, 7 Aug 2026 12:06:37 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Rudi Heitbaum <rudi@heitbaum.com>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org, robh@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: imx8mq-phanbell: Enable the rt5645
 analog audio
Message-ID: <anYQnd1jW2ecFq_n@SMW015318>
References: <cover.1786107925.git.rudi@heitbaum.com>
 <54ab90ba6c05b38c6561e0ea732d487da9443f1e.1786107926.git.rudi@heitbaum.com>
 <20260807141524.179AB1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260807141524.179AB1F00A3A@smtp.kernel.org>
X-ClientProxiedBy: SA9PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:806:a7::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ee5199-8626-4fbb-b780-08def4a6425a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	nKXtwpe2G4Ekbxkjrq7f4AfeiKOw38D2f1f2Xdx1Eu51esJX8xtikMfZCM/ad/HodIUCewcP2tb7Y+dxKYTqixjWaN497zijCk5lGWy1wk3d8dhMLgZJ624EIE4wB1OkfqM2dh2YgNyPSQTwMtCG02hK2qOhAE1Pd80eyDj9rL0wA6fETIrblQ3odp/l4dxoT3ZUFZCv3eUy1nIU1/4GVsG6VyqzBeecCgmPA6LfSgu7xSFdPzNIT4En12Tt/gwLQPQIOkrexhJ8hq+mqFWphAZskRQZElrmfgePE+o9o0/D5l+LQLRxeQmuL56/hJZAerhxyOv1NipUbTx9KVfQSH1MqILbf43WMkHWGV/dsgcJcQaYdUCLpgmKzd681yHRsQPvo06JsuVG/AzM32+zN2Hfx2yKzQFtTDS4NbgJ6iLGUWoAN5QlS5c8+Q3EwWD4XF2ByxK/P1+MnvrYzRj8MpFGnyF/yEtIdYSyd7HXdIW0iqsRkZzlmA+tJEwjXg3cpbmsZl8Md2XLD60M6jIJsuYZ36hvNEOav1Rnc9nQ1Cx+ShRM7h7pXOATi+DgtVn1Sh1NcWoWSv9OdBYkuoVwXQs15UKdtQfMaBmm9n4XnvQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?W2aaiQF78w7zwSIU9e1j3o8hlaJRP3keRvsVv9TYpme/M/f1ypZqa9kH6U?=
 =?iso-8859-1?Q?pA3GDn0RQjXn+GydA3ofoNOdvXj9421i+w/JKFYqISFrRPcnYhW9xoF8w5?=
 =?iso-8859-1?Q?B83ioNNIk5wEw2TEoItOLuYhTd3/sQk270ClVoWVeUYMWKV+TJZ3SwPCko?=
 =?iso-8859-1?Q?nNZZApLXDPx8HI1NRQu90LQFErhBrz/YFF+OeFsIwngbMh65UuygNGtECC?=
 =?iso-8859-1?Q?y6/PecxLaojj3SMtQJUwsPJn4vLFGwuPyoitykwIxJ/JEJ1DV8vjpvdz4p?=
 =?iso-8859-1?Q?Dr54pNzZxmywrCWA+UOL4kb68BHVva/q+Tk83dasieRTcFzLiNlobbHY99?=
 =?iso-8859-1?Q?Zaa6mHl0UVnWv2Z2Aa8LVnq5CXhX3b40dIrKp7ihpZM/wl6LMIMC9KPBGf?=
 =?iso-8859-1?Q?MiCYvz3YfNxEAGTHOw3WjDDVUdBKGbI1FMB2gsvM0vr7MC5ou6ecNvVvHW?=
 =?iso-8859-1?Q?CBGZP0bHDpw1uybBh4RkvXxmhp2dLj/3VyRqatmWBIJ4bdOnnDNel43X4M?=
 =?iso-8859-1?Q?AO7AGevb6ZOsWxeW3QnZZ9zmOHVn3zRSWs2WtCDetLHA5TxmKAQ9NbhYJ3?=
 =?iso-8859-1?Q?QzaB4QzgU+UIE8fAR2tfLGvkscFAz5jUUpPoBLdT5HEyvdBgKMshehTLRQ?=
 =?iso-8859-1?Q?KYFtvtPKzbtAaRYExFSY0xaAVu7fzmNoFFTMY26m+vtmn2UAyTt4EztNmy?=
 =?iso-8859-1?Q?attFF22Gy6+9RW+rOaB9x91WNx+4sSuJzwrng9eU80LbeImXowtF/9CCp4?=
 =?iso-8859-1?Q?Yd8q+VK32zBfWmH5imz141rBYaXhmr/wavNzwX1iaFDHnt5XilL9YJvo+y?=
 =?iso-8859-1?Q?UgJlErMNz+bIKzowUoLemJVLnCN90d9NHF7UPaxR55o/dH5e6A4gFzM/cg?=
 =?iso-8859-1?Q?O5djpEiL8j2P42aCsC5YQYNOPThYiUD8hnivP25BYT4W0Fl1LidFQxgZ+K?=
 =?iso-8859-1?Q?0B2AiC0vwUCQo0UM9N1hnNOVIQg+WBLjcfqJeHaL5h4r7rX4zde3ZTsMil?=
 =?iso-8859-1?Q?B1unA2Kab7TvXSsmfSWGw2iGhbRZfWeBum2hEdY33673CeOCe/FQGBiyhD?=
 =?iso-8859-1?Q?Oq35612BIbdz39AoOoLdDOMYnvaVU7vdcQk6rud/qnHl7r4BZYTYoxlaRq?=
 =?iso-8859-1?Q?ewK0zPA+g1VoUL0ozVEq14uwNiZf0glKUe/xS6YOR/1oONm0fCYddtQcGx?=
 =?iso-8859-1?Q?Q5zPh8gnkL9xiOGbank7j3eW2nKKsXKXBpynnTvmhGFOQARlAQFMoxFEXs?=
 =?iso-8859-1?Q?CmdKOWg6a7N3MGrkSizhGQy1b2buYLre1j4+Wqy3xHSulRB9FS373QR384?=
 =?iso-8859-1?Q?DDM+Eft7dSRvgYyOc12Ib96eHjV+3FE35/328j1+S72+HIsxhTEhIkAdBc?=
 =?iso-8859-1?Q?iFlpNVCdeoO7VqZS4mM2JPL3d2NSHxFET8erem89pSjNj7q+pwi+7h1KdA?=
 =?iso-8859-1?Q?iz6wFITjJzgnO2445XuFu6dl3K2FIimccIm0Wwex9Zv/gJ6mRjKHTkct+4?=
 =?iso-8859-1?Q?0LMcTcm5xsHaL5YjQJ2fclMZNoPrTmcV1kSJPwhcWQxdmqEK4UGgyKQCpz?=
 =?iso-8859-1?Q?3o0C/5dDUzXH5MAc2Cwfo5BdgN42tLfKy8+2EV2EA8/0k31Wh8j2W0yh+M?=
 =?iso-8859-1?Q?eDEvd9b0tFbp46LiFB/kNGlDKj0ykowGO60wlVavw2w3xsDr6jVc5bK4i9?=
 =?iso-8859-1?Q?/y86YmlfYtH3icDlK0uofHVX/FzK2lFalEyV0nlIqLrYytRGsjaWTTzPuR?=
 =?iso-8859-1?Q?9dkWL6bIukE7fD2/QKi3rGt+TUh99w0S6WGfDSYfYcU+jgfbLTWXytF7KA?=
 =?iso-8859-1?Q?IK0/DFkhBprAoKYgIlkU9mCU5jBMQhf87dEJ2KmwaOafJ3UuNXmz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ee5199-8626-4fbb-b780-08def4a6425a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 17:06:45.1203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f67IthwNi+PKutbeH90dk+vIPZM4TaVhtprM7c0dX7KlDVRHTxeX0rQNOJrtf1/uLajJtpFXFFybEnYOp0wKQmNWCbHIws/JS6tWA36T0gdGvkwaJUinfVrs5iBb48Tz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188

On Fri, Aug 07, 2026 at 02:15:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Incomplete DAPM routing for the external Headphone Microphone breaks headset recording.
> - [High] Using `system-clock-direction-out` without an explicit clock misconfigures the Audio PLL and breaks audio playback.
> - [Low] Missing required regulator supply properties `avdd-supply` and `cpvdd-supply` in the `rt5645` codec node.
> --
>
> --- Patch [5]: [PATCH 5/5] arm64: dts: imx8mq-phanbell: Enable the rt5645 analog audio ---
> commit c3b167f1c120ceab271f952ec9169de906983534
> Author: Rudi Heitbaum <rudi@heitbaum.com>
>
> arm64: dts: imx8mq-phanbell: Enable the rt5645 analog audio
>
> The board has an rt5645 on i2c3 driving the 3.5 mm headphone jack, its
> microphone and two on-board DMICs, fed by sai2.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> > index 2d134eefb7659..b819e644fa54e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> > @@ -46,6 +46,41 @@ fan: gpio-fan {
> >  		pinctrl-0 = <&pinctrl_gpio_fan>;
> >  		status = "okay";
> >  	};
> > +
> > +	sound-analog {
> > +		compatible = "simple-audio-card";
>
> [ ... ]
>
> > +		simple-audio-card,routing = "Headphone Jack", "HPOL",
> > +					    "Headphone Jack", "HPOR",
> > +					    "Headphone Mic", "micbias1",
> > +					    "DMIC L1", "Internal Mic",
> > +					    "DMIC R1", "Internal Mic";
>
> [Severity: High]
> Is there a missing route here to connect Headphone Mic to a codec input pin,
> such as IN1P or IN2P?
>
> Without this route, will ALSA DAPM see the microphone as a dead end, failing
> to power up the codec's ADC and breaking headset microphone recording?
>
> > +
> > +		/*
> > +		 * 32 bit slots regardless of the sample width. sai2 divides its
> > +		 * 24.576 MHz root by an even integer only, so a 24 bit frame at
> > +		 * 48 kHz would ask for 2.304 MHz, a ratio of 10.67.
> > +		 */
> > +		sound_analog_cpu: simple-audio-card,cpu {
> > +			sound-dai = <&sai2>;
> > +			system-clock-direction-out;
>
> [Severity: High]
> By specifying system-clock-direction-out here without an explicit clocks or
> system-clock-frequency property, does this cause simple-card to fall back to
> the child node's first clock (IMX8MQ_CLK_SAI2_IPG at 133MHz)?

Is it true?

>
> If so, simple_init_dai() will set the Audio PLL to 133MHz during probe.
> Because fsl_sai_set_dai_sysclk() blocks clock changes once playback starts
> (when sai->mclk_streams > 0), the PLL remains stuck at 133MHz.
>
> Will this cause fsl_sai_hw_params() to fail to derive valid BCLK dividers
> from 133MHz, breaking audio playback completely?
>
> > +			dai-tdm-slot-num = <2>;
> > +			dai-tdm-slot-width = <32>;
> > +		};
>
> [ ... ]
>
> > @@ -272,6 +307,18 @@ &i2c3 {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_i2c3>;
> >  	status = "okay";
> > +
> > +	rt5645: audio-codec@1a {
> > +		compatible = "realtek,rt5645";
> > +		reg = <0x1a>;
> > +		pinctrl-names = "default";
>
> [Severity: Low]
> Are the avdd-supply and cpvdd-supply properties required for this codec node?
>
> Will omitting them cause device tree schema validation (dtbs_check) to fail?

Please check this also

Frank
>
> > +		pinctrl-0 = <&pinctrl_hp_det>;
> > +		#sound-dai-cells = <0>;
> > +		interrupt-parent = <&gpio5>;
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1786107925.git.rudi@heitbaum.com?part=5
