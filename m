Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011049.outbound.protection.outlook.com [52.101.70.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ACA2BE7D1;
	Thu, 11 Jun 2026 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781188416; cv=fail; b=H38yl+4NQJv3NsKWs54GtuVWVtxydS7Fql9CRDAc0uRxuCFPmCRBNrQvH+8vu7MW13Qg5kjtgWrQK1S2vq3XK6G2UXlPOkrbRhZ3kmB4Yi4rijX94Pb85whvh6aM2JGUVczivdoZjCe/R5Jb2ekwo0OBh6FpH2ofYJL4xHYkHUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781188416; c=relaxed/simple;
	bh=Mt9HiH2f/8xiKMUbk7WzWY3ix0RhDE2Dznn+AZeGim0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QKlmbQIPjC0OJBFeM2Ixeq7fhcwiWtpuMsql/XHqkPztgKDXDcL8BEPBFfgwbu467WMShU3g+uBrewAlwo4YH5mP6j4ZdxMcCZ81YBUL3YJExbfXHaFNDes6u10MDypWC5SWpSIj0xw/Wq7f1TNldSUMEs64P1oIwDi2/ytHfYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KrFTHoyE reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KrFTHoyE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2AkQxPIlEyDNrPYdjCJPYlxUf3/jwpknZF0OQ5qzHPwMpR3oBNaplX7qaZSDxeq8bFFHY3wJDug6q9CSwcjbBySFrhjk5vWUaEMVc82rOVfoo+uaRG1M7DBKoFO+YzZx3zix586mA/0To2G2CVmVR7askGHH4z+8SZc9OUttn41wB9/tu3DSnPC/PJGv5DM5oVVjT0cTCVR4/oQ3RQQG/+F7uBtwA0wJx4vKRycusQezithFnobss1LeNw6HWJ3eZ68JPH5aIVlxPdMumJusXXzSGL4wQQb0nJ9OPtwfmtOcPdYOa0KFY+p006oAGlMhfbhUdsPx3KvyStd0r5aHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tK3k2n8McqVAiAJq+2T6lsscak6EtD6yFg+uRDMJD3g=;
 b=RjxpG2hY0/9PgfMVrrp5mxl2OPmivaZSIz7uhYUns35MSEJtjrbLiqSv29pZvX3xnPRhJEW7biLXkOw1vDse7IJ78qmbL1vgTkE82kZvjwEd6dRFzsj1pzJBVGELVLOwMkWR0vJBIAjvVJq9ep8uuK5vLXHCvKwFivlH/zVamG7QS7+v/4Ac+dh+RCxXm36fHmh/Y/vPfmK01wg3upQz1CkhWV6lH3H0Vm3qKLA6FmLduWBTL2PjGDuCIkSnXY6VFoZgxjlDbGYp6Tqk+mMQU/9By/DajNEOIg0kCcY+PHRanIJKlueYCOKUto1ZpAUtOj7azG3lG9bxOp0OiAaMAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tK3k2n8McqVAiAJq+2T6lsscak6EtD6yFg+uRDMJD3g=;
 b=KrFTHoyEv9peNFlC+c7b2cafLGZ5xIz810zeB7Ef/gFCqQW6fB0+5zTixE9O2/UxH/FjIQiKXpt5tp7fh7RlOsgi5Y2tyQmOfXnhJ1IuhseeUIuZYCAdf0ICR0Orskrm62AgHMRvTRBcKTCz/SY53YyAt5FmvU7FI4Y+pnotcIrvybcs6qV4smX51TlZVycRjrcAXq2WyxfljC++/fRF7E+wUBhWox7b+/l6z5qMwUFytvyqljJ8eCY/ypizKGzGKsCwZxaJ/evNG7bPWO/IqeeGir47Qck8gnl039OYr/Ro+6nBmMZkLRPwgyxV0QPd3EmtYnk5ai2YDR+TNSO0Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB9873.eurprd04.prod.outlook.com (2603:10a6:20b:672::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 14:33:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 14:33:31 +0000
Date: Thu, 11 Jun 2026 10:33:24 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, Frank.Li@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX8M-MINI
Message-ID: <airHNKBZZk1s1hCr@lizhi-Precision-Tower-5810>
References: <3b7987d3021b1f0e4c0730b5fdb5ea6b2a192c4b.1781024557.git.stefano.r@variscite.com>
 <20260610091334.3126C1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610091334.3126C1F00893@smtp.kernel.org>
X-ClientProxiedBy: PH7P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB9873:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a4983b-2cfb-4521-f3ac-08dec7c66946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|23010399003|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	HyPhUuWrxSuAbuGWZqBXsmhYLvsPXQA5kOpc8FALAS9h/YS933Ue0FDgAS8NtB4GjwOtzxlvQdXBH4XM2b5Gbg/feopfkdqVr9Vnl8LY3lKyKbwENr9pXk+HDKC9zRUZe13e9QSt0+EDNU8GP2UEwLgzASdmvHBRxbbGzRz3YtzYRK0YWpeRDWkgG2izVZQYkdMUjOLLIVWouT9KFjWZU/D4i2Ka9H3UuRzLEbBZVtzhpFeNJs+GkND6YDC5N7L5Qt8CvmnlE+gSEN2kYAtNm/9R4ISfQ8mbG9tgekpKWk9qPr2lWb9RcGmnCIJrs8GS0a41ciaalkTyGMEDXwi+BzX+q1M1sHnHwYSbY8cIilB1PjRjYs7AOa6ZmqJVwlwJfgcXYiHJimLRpE5xsbMSvt82RSHYda9D/17iI0KoR1TpAXVrntn2STtV2w6xMW/8b7My+x3dcPCGf/hq9anzEL85fk3oPa6YxYYTjezboJISZLv+lc6v1WGbqclRyiTtG/uP/h3eXguvZiHrUhTh6sj6D98+R+8CtuQunvnAf+drC8PFeDdsvJgM/4jlYt3OW5CviCsQ2XgSNoDO7ruUznw+UFLDtElWu8pn1HEgKsLlKoQThZFfCFqeFgvgP/Adyh85S+eiq6PO8r8QB7qWUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?TJZ2xfI/YmSyHCJhZrJ3MxurXuF7hnOlq0kVyDtAt9hSQiFKb88OHsl9LR?=
 =?iso-8859-1?Q?s3IIa78Mzc/GwEk2uJWuCaALWeBcfZioAKNcg26hwYbNWagPMM7R9I8FuX?=
 =?iso-8859-1?Q?rZ2jeKcwbXAhfYMuwtNqkEwAK9jPXrI5sxNVBOUjFZfqH5BOR7TkGT9SkQ?=
 =?iso-8859-1?Q?lwrFVYVxzuhr8QatoxMjzAdFK/UNhsWW1nuODlSdPU/9nmhYIabiUw68sr?=
 =?iso-8859-1?Q?xLx93t9eCQraR3bTriUCVQqZilz5tFX+FW7++kxBUvTvsxXp8kHV9pPpE6?=
 =?iso-8859-1?Q?d0YsezyiQVvHakj4e6Q9bwI83bXYt9v4cWM6e44Rk/iFrmWpreTrdaGGl+?=
 =?iso-8859-1?Q?d+MLpq/+vmKjESm1qzyliO4udA3UcYV8HTvZQFdz43oNq2S6hF33IMtQwX?=
 =?iso-8859-1?Q?X4+dRbHHIsNE2+8+H691qU7TJl+BJ1ZJvAbcIgeK9+k4MQOU4qdV5iCWN7?=
 =?iso-8859-1?Q?t8YzuFopQpVFoSKpwqjuQOxHXebfhENSoQbi+xTMTnce0pXjzUsUNvNk2U?=
 =?iso-8859-1?Q?vyZ6YXrCEiVi67xwvg5gAU06ZlhaCF6LEkrITcHTaHELM/DhtENXIfayi9?=
 =?iso-8859-1?Q?irdHJiHLHr3ilLlkWyAtVhrdV5otqS5jxH+T8WnCXJTAqucxDuJV428WgW?=
 =?iso-8859-1?Q?N+U2NP6JyPtCC6llEDm0zbT58+4AHKtKMEtmOugrq1QXJ6jdL44/JLIG2c?=
 =?iso-8859-1?Q?3QSNNmBl8jtR+VNJdOKb+rTkxzrA6i9h+uEi04kx2642jzl0YsU+j36X8G?=
 =?iso-8859-1?Q?vJ2Yy68TVeqKpDHL/tHCbUs1zVRcpKYkYtlf6BaU2sFOjqkt6HzqAqxN7I?=
 =?iso-8859-1?Q?z/O5IHYxtGbeG7zg+9ChB/C/j6rIteVJeBE8bLnamTuQnFra6lOYTB/Gee?=
 =?iso-8859-1?Q?Df/J3OhTHAupSii0urjs3PLU7ZExg3O/IZIoc92YL49CCEoFnnIkWOTBkl?=
 =?iso-8859-1?Q?zxQlYUh7ZuYucemwKrkWvC6Z56m9cgOfkosvGCqHwM9f0cxhePgr+3+w3J?=
 =?iso-8859-1?Q?eKe48w7JFMcuzj+hGzZhaxzN2mijkhKYxYqEA/rhJxup7fnRkv19z24y8e?=
 =?iso-8859-1?Q?iWq5rx0iDHcXvD9kkvWPbOVPR+8xK79W8qMUQUA7iusUCZI2Qmv/JT/k+R?=
 =?iso-8859-1?Q?zFmRbO1LoIA/BRQGkmPmfzNNOhZpEVI4hDrdyGmCHHbjIJsiUtLgrFeWgW?=
 =?iso-8859-1?Q?f1+7yH0HWZ6q1euMPKd5EfdWAcrDqmwVknPNNwEJVuBG+wY69wRa2e0cQ+?=
 =?iso-8859-1?Q?bolnwoh9vl+IAPR1nPffH5AhjdZR5ftsZak16vV/8ZfbyRBbfkzgbTTWkP?=
 =?iso-8859-1?Q?YQgGwZgMrBNSklOkpX0evQbtBASVXlMyLnyYuNT77Nz0l6Ru8Um9oegUY8?=
 =?iso-8859-1?Q?8vjJPMLnmFOob4CvBR7KB46R72B6us+Cs/pRTYjfas5uMFvttd+YM1K6dX?=
 =?iso-8859-1?Q?5/hppcFvBJxhSmr+7rLO2yYKX/XzUqWxwa68ybBmSHcq0eMGpmNppoJGOm?=
 =?iso-8859-1?Q?IxzujWwIlb7Iq4HYPxV5xoqnVv9JzBCqSRM632H9U4VW50VVeNIpKCiWAj?=
 =?iso-8859-1?Q?04wSsJ8fZJxXjVnU63EF7nPGUuvVWVDUEIWk+LDnz7aWHObh1pw5VlGsfV?=
 =?iso-8859-1?Q?Acpt2BTxAvwMIKfdVhpwyupv5Wcu7N8T/3+/pkRm/Og1Qs5VDwVQSyrF8U?=
 =?iso-8859-1?Q?i5Le+EGHDeVViO1l0EIxuFxJ9qyBs2IUTLyn1a/jpYatxaVG6L4df3BeM0?=
 =?iso-8859-1?Q?xDBO884nuWPZCiF6S5xgYHHebxPKALgagg1IqUZQtGkCXqmZIDaJ7H17zb?=
 =?iso-8859-1?Q?om5OFJd4d/Mo9+twnU1Q+HcW15rDuTs=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a4983b-2cfb-4521-f3ac-08dec7c66946
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:33:31.8915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPNvYaXby5MbidW17D9STGWUFBkb8DTETf443KyvQgDjR3pYiIrYZrw/R3nxeKyuZG3Yl3g0dwnJlWUaIk4FxKxzdWkR6QAC05uFgDJRKwaHNDnLRlwBnTeyI4Uqw35p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9873

On Wed, Jun 10, 2026 at 09:13:33AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Contradictory GPIO polarity in fixed regulator `reg_eth_phy` between `enable-active-high` and `GPIO_ACTIVE_LOW`.
> - [High] Simultaneous deassertion of power enable and reset in `wifi_pwrseq` violates hardware sequencing requirements.
> - [Medium] The audio card hardcodes carrier-board-specific jacks in the SOM .dtsi, violating the module separation described in the commit message.
> - [Low] The `bluetooth` node is missing the necessary GPIO property assignments (`device-wakeup-gpios`, etc.) required to control the Bluetooth chip, despite the pins being configured in `pinctrl_bt`.
> --
>
> commit 9e70fb8b6cc043ee758ca5e7801e30846eec594b
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
>
> Add device tree support for the Variscite DART-MX8MM system on module.
> This SOM is designed to be used with various carrier boards.
>
> Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-mini/dart-mx8m-mini/
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> > new file mode 100644
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> > @@ -0,0 +1,559 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Common dtsi for Variscite DART-MX8M-MINI
> [ ... ]
> > +	reg_eth_phy: regulator-eth-phy {
> > +		compatible = "regulator-fixed";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_reg_eth_phy>;
> > +		regulator-name = "eth_phy_pwr";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-enable-ramp-delay = <20000>;
> > +		gpio = <&gpio1 7 GPIO_ACTIVE_LOW>;
> > +		enable-active-high;
> > +	};
>
> [Severity: High]
> Does the PHY power switch require an active-low or active-high signal?
>
> The reg_eth_phy node uses GPIO_ACTIVE_LOW but also specifies
> enable-active-high. Under the regulator framework, enable-active-high forces
> the GPIO to be treated as active-high, overriding the GPIO_ACTIVE_LOW flag.

This one make sense, please fix it.

Frank

>
> If the power switch requires an active-low signal, it might fail to enable
> the PHY. If it requires an active-high signal, the GPIO_ACTIVE_LOW flag
> seems misleading.
>
> [ ... ]
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
> > +		simple-audio-card,widgets =
> > +			"Microphone", "Microphone Jack",
> > +			"Headphone", "Headphone Jack",
> > +			"Line", "Line In Jack";
>
> [Severity: Medium]
> Should this routing and widget configuration be moved to the carrier board
> device tree instead?
>
> The commit message states that carrier board specific interfaces are left
> disabled to be enabled in respective carrier board device trees. However,
> this sound-wm8904 node hardcodes routing for physical jacks (Headphone, Line
> In, Microphone) which normally reside on the carrier board.
>
> Including this directly in the module's .dtsi forces all carrier boards to
> inherit this exact jack topology.
>
> [ ... ]
> > +	wifi_pwrseq: wifi-pwrseq {
> > +		compatible = "mmc-pwrseq-simple";
> > +		post-power-on-delay-ms = <100>;
> > +		power-off-delay-us = <10000>;
> > +		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
> > +			      <&gpio2 20 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
> > +	};
>
> [Severity: High]
> Does toggling these GPIOs simultaneously violate the hardware sequencing
> requirements for the Wi-Fi chip?
>
> Grouping both WIFI_RESET and WIFI_PWR_EN in the reset-gpios property of
> mmc-pwrseq-simple causes the driver to toggle both lines at the exact same
> moment.
>
> Would it be safer to model the power enable signal as a vmmc-supply with a
> startup-delay-us? This would allow the power rail to fully stabilize before
> the reset line is released.
>
> [ ... ]
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
> [ ... ]
> > +&iomuxc {
> > +	pinctrl_bt: btgrp {
> > +		fsl,pins = <
> > +			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6		0xc1
> > +			MX8MM_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5		0xc1
> > +		>;
> > +	};
>
> [Severity: Low]
> Are we missing driver property assignments for these Bluetooth pins?
>
> The pinctrl_bt group configures GPIO2_IO6 and GPIO5_IO5 with pull-ups
> disabled (0xc1), and assigns them to the uart4 node. However, the
> bluetooth_iw61x node does not assign these pins to any driver properties
> (like device-wakeup-gpios).
>
> Because the driver cannot manage them, does this leave the pins physically
> floating, which could cause spurious wakeups or increased power consumption?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1781024557.git.stefano.r@variscite.com?part=2
