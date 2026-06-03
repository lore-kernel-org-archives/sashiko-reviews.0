Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011036.outbound.protection.outlook.com [40.107.130.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67953CF058;
	Wed,  3 Jun 2026 17:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780508519; cv=fail; b=TLxJlX+Qo5tZt6Ib1TgXJ22hd8U7RHguidHocj4jH2Qytlcu0LNITz0gqgQv2mOAQmhTd4XqHYOPK70B10eF8/llACyekMehsNeJPoRMlZO4B6Wwbcwn3DVXFGZni8o7uTVDmOIoHTEoRp+bBxQv7Z3HN/naT/OMtHC5Hkq9qcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780508519; c=relaxed/simple;
	bh=epRNxFXNdOM99RUfHWdAG0Oxsxxkko+I8u2wSPJlHYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hc5juTI006sF2DFEkS/0lWEOrbwatKO38ASAfCmOEocHxrm/fl9vmo4vXFyWSMrYcTNSrPQG9hz+rJr3ZdA+Wiz6/Cflo64Nq6cnuwWYax+OZyO0hTuLer2LpsFPzz7JPJu60C6qF7NrELHscJJyC/E2vS43hsGUJA9jm2SvWXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jhej7Zzs reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jhej7Zzs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaC4hszGNuu44ZTsm7qr7NKNlPKc9ZFehXadg4PFOSxeyiGiik77jpRSRBPOAiHy1XmCK/ILVmAxLyfNm6e9mR+JEFoho+5PjzNmmlefevPcWhwLW+J3AyDoQDlfPKUBOeIBbGw4H0gAi8kINMRrFay0IWnqU6//6XsqrJ7ad/9ID9SsOZWQXA2OBnM1/7Izqe7dOOPyzAa9mBCqpbmolyuLQTvYeIPKw5h/aVc7YZ1PA7J4+EYhdImiicLvXA7z+lR9yeocs8GmSyBsThwGK8dgIkkoC+IgWLmdZJZXUzT0kjaT57XRW1q8eli9qiUdy5g0WbHFD4BewKc2XYmEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tehRoeauYin0xW30r0MX8tlKHvoTJMH/YJGLz53wW+E=;
 b=Lyv94esPpx38VX9PLU/L3swLeGBLB5Z9MBzrTBveiTDMcjAeJbBX19pKEcnkVdQ9SRijGC69ne/Tdw4W9xEivBFBbGhceSR4Xe+ElTFjUISjAmNHjnvq8+DjMTp8a2wXpQGl7kYHOwiCFTCxxTQHN1r4ImJ91fsopBAVTI7CfRe7VxA9QIwAU/YTRRORcrmpltnIKOiZzDMtyr+jXcXSgcZBOFszE7LLA89LRc7kAHp2BU09Hh20FmMgfrLR3PUnZOS0dNpTFatmEGDI1dsYn+Kv9ZEljO7ayllHFvCqH8O+EnFCenuvMQ6NjkQxE/TaQ6DZS7AEz+vUkqwNW3+LgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tehRoeauYin0xW30r0MX8tlKHvoTJMH/YJGLz53wW+E=;
 b=jhej7ZzsQcpUuM/MPI6/Bqysp4TbXCvk+DO9+9vgh8U2q7R8HVRfk1fqDoApGVIcml3b2XMfvpbTgPy88rJVfEG1VKj2acT3Ill458qo8bjsGEwpQQXYxHVoJrttws/mgXyL4yL9lMNsu6fh7jxGhR3THCEUaBToh6oB3dKpeDzkNTOa7Mm3uHo973L2faIHeXzEdIO6qHd7safLGCCgyqQkoLy0Ns+3eFKkmVCJdsbkJLxgibNjg4nI8w4SRmqfEzNwlPeLZ8p3jjDDLBe2v2l6zzPt8dceRfTrOqRu7rVlbDzInapfEn1yG0vOVK6ZsWHu0T6WomLbVpFFz/5/wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7689.eurprd04.prod.outlook.com (2603:10a6:10:206::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 17:41:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:41:54 +0000
Date: Wed, 3 Jun 2026 13:41:47 -0400
From: Frank Li <Frank.li@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Frank.Li@kernel.org,
	imx@lists.linux.dev, wsa+renesas@sang-engineering.com,
	devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: freescale: add initial device tree
 for TQMa8MPQS with i.MX8MP
Message-ID: <aiBnWwW2x1TOsGcy@lizhi-Precision-Tower-5810>
References: <20260603093621.2504490-2-alexander.stein@ew.tq-group.com>
 <20260603100559.6E7E21F00893@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603100559.6E7E21F00893@smtp.kernel.org>
X-ClientProxiedBy: PH8PR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:510:2da::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: e6be3ebc-22f2-4354-e60d-08dec197669e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|19092799006|366016|38350700014|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vN0lWhR0gOMDo7aIr8t9fA/LlFPz36/99fjc747CpwQSfwg/VEfvpB2Benxxp20cBCs9YWoqV7eHxRHN+EqQw/DK62JpJ3QgH0vz/28EnlLAXjjvEQudOhzlaYaL9S+XCVZb8wFjK4CfYhB9UH1kTlpnW3cIJGZZT07wAPuIRNHcr2ekfBGKYAmsxryHejoau7Onqal151DU6tLakqsIPEwJCj4zYzKvktA62iv+MoxwV1MCIKHiQQ2anVU9eeCYSUjpKgnGLnr1O+X+f8Kes4DwHtPEGpSEtWON01pnfna15bMjJExbwsX9F5pm1Lv/cN/IFvU+IqK8tKLQ9uSa0i5N1jNY7mlYcCqNdJjsP9XLEjfIJD5wIWoqrFteoqtUruMsU0O8m6PREGWwz+IfeYK8yJeHyVKpYo5tdttXETemtY4f6XC3WION5P6wpghiPE3vT+pglfG62fjFkuHUuC9/FjhGxeInEX7Ae/I+8TMhU2HcsWwB2YZMKQ7ECG21f50wMWzsYTR2poBhImq4gCn0llYXRKp5GCYOOwhBM0yMikKWLKhJkvi6nvVu/AIpgBHXt5sDZ/ptLUGioqPPXH2Od6K/SVIich2mNp1SsvHzYbgsTNmYfEDeT+M1CBsXS7HyI/3mOl1SF1wI/TLncBfPjQ1BCEU4PwY+s3J2psigtwVnkUh8SUX6TIb/YbU7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?cttBvZYKkgLmrvClk8F19wM2Ncc5lkYg9Q411L2iIpOudnwLL0pkx2322s?=
 =?iso-8859-1?Q?1EI3EdaC/YPDweyDOah19o4uySh4PCfH+qiiEGXVXTQGZ8owG34sk+TgK7?=
 =?iso-8859-1?Q?+82fe8gLz4QdcNy2HjGfQfDCtPL9p0LFjFHl4Ix2tJCph/UQKW42wipkUy?=
 =?iso-8859-1?Q?1VI0I9UUWHXJ+ebU5f/882RnDoLnH6UfzgJDqEAPGsbY002fgC6Nw4TL/0?=
 =?iso-8859-1?Q?ZA39fFqUixXJwTEs/jd3b4Ck89YiM2h9DXbwUNcnNaVH1MD1ga0YpUOScK?=
 =?iso-8859-1?Q?mhOZq+y5jjmdYkwoESXT9towo2/ElNgCCHmcl2WjTZT9kv6hcz2/yIMAcT?=
 =?iso-8859-1?Q?TGK7lIgocOLR3I+2j50L7ajU+fUKRnVhrdmh/Y0o4UiLiTqe3bdX/O9C/T?=
 =?iso-8859-1?Q?MzcpgsSW5VoRfx2cQEWhl0mS6nf0bpb7kZARQWE7rCidRZ45NoMb8U3s3W?=
 =?iso-8859-1?Q?HsqRQuQlejVcXoLVoIxGs8DHOe4IL14tpq4Cj87FNPRzfx/4C2T4jQIOMm?=
 =?iso-8859-1?Q?VZtM3HUdOPja98mxTafEZu21utPF8/RMs0aQwoVJEFfIw4p5E1YxGF5P5I?=
 =?iso-8859-1?Q?/ktDRib0g//jCc/J+2mbVXNrcRJruX1eOv42j8LOGREDkDXcpFu5LSVGar?=
 =?iso-8859-1?Q?Me+U2cS5rRlSmePX77g6WMaYQto724HbKLW/vlcCmd0TBW0gnKCpKGpB3V?=
 =?iso-8859-1?Q?8wTWEYBddxl0jd3UZG4jgMJ/wxpc9r8xAm07ZUqih+qo5XZjTFF6kI0E6D?=
 =?iso-8859-1?Q?NdNRk3NQZXXSqTgGZwoAudtswePcUW9zqDNL2LyU7CNPbCPth1w65fFSFq?=
 =?iso-8859-1?Q?JVUCdvPG+D0X/YpWTpTVH5FpG1kKFkvp/6SHKfRo6Ngy1Kqzrl8/j93R5q?=
 =?iso-8859-1?Q?AV5USNMRDjxZ+G+nOg15k6tR6cX0a2e1h8vwRE0aj8AO3hvQ1gL9v6gJ7V?=
 =?iso-8859-1?Q?3aquQEEs15zSSam8y4xYmav3PpGwqW/LFzMiw5L23mUsCUmJSrX3Mw1kZ7?=
 =?iso-8859-1?Q?fightC2/5vm2mnbL6lWwdVKrLYOCfsfJaTOvIqS4IXzahFvlq1uzN1uAnc?=
 =?iso-8859-1?Q?m/l4PO0fjHj19oMnQR1ZU9EnDin7XTywed1GoOiGHZo7WtU+Ryn0FBznfS?=
 =?iso-8859-1?Q?TqaRnCJfJoEexq8E23yNk3m3shMDHOttWZJhZTKT8rwJUla36eMw6bkpu9?=
 =?iso-8859-1?Q?HHqLEJWSEOOvmUDp+ifgAVQxaJMcxqzKu7oES5hDd4V01/w82ibMJEPmWJ?=
 =?iso-8859-1?Q?ryW+gLqZcfXJ9msYdpnwS7f8GqBzi+2xJNOZfAZURnCQo7h6+Q88dMeTNR?=
 =?iso-8859-1?Q?JogM/eq/o9gOWqq8tgkuPGWaIXNLV2/Jh8E8v5qhS5pWhTNb2Af6gUq0j+?=
 =?iso-8859-1?Q?xfEP12C1F6T6Q16v0pSVz2brZRHMINI5ZAkdjvzRjp631kuzSJz3hCvSw0?=
 =?iso-8859-1?Q?+UZiNJA0G/+t4N6D/GqxDZ0QUy8PUkkLnHsCt+Cx6vM+zQMbs5kCrvEZki?=
 =?iso-8859-1?Q?LnDoB3OIeLNgOFrCATwbSKLqQpf6snZm+5JonG/LuDcgx3NBTdbPTuIw/z?=
 =?iso-8859-1?Q?gi5l5yh1G7H5xEwFHQCLaLVhOg4tp5jCdEPyEmCepQgtuR7W1iYF/NrnsI?=
 =?iso-8859-1?Q?6HwV9+dg/QHXbYWzdz7ezOeoGk4L+cD76Y6jNn/WTvVG7DyWcALhsTFN6a?=
 =?iso-8859-1?Q?ipQdJeNsGorkTKdb9jgEJYSQv1FrI3MMgXoOEHqtSUgkK0TAzw6a97QPmS?=
 =?iso-8859-1?Q?mAYKVcgv4+8EYHDRgNI4iq2ILHbmA65DO1iE7eF/57qBNJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6be3ebc-22f2-4354-e60d-08dec197669e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:41:54.0963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFnwROFACISJ4MqDJZO8D4+oDZn7ph8E5HjkBhVllVULD6k3bwEKRr41AUu3XN1EuLKxcDZdgu5jaby/uj/9tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7689

On Wed, Jun 03, 2026 at 10:05:59AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Incorrect `reset-gpios` polarity on `dp_bridge` will permanently disable the device.
> - [Medium] Missing `interrupts` property for the DisplayPort bridge despite hardware routing.
> --
>
> commit ec4a92e3f2baae5d65ed787df020c8a40c851231
> Author: Paul Gerber <paul.gerber@tq-group.com>
>
> arm64: dts: freescale: add initial device tree for TQMa8MPQS with i.MX8MP
>
> This adds support for TQMa8MPQS module on MB-SMARC-2 board.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi
> > new file mode 100644
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi
>
> [ ... ]
>
> > +&i2c3 {
> > +	clock-frequency = <384000>;
> > +	pinctrl-names = "default", "gpio";
> > +	pinctrl-0 = <&pinctrl_i2c3>;
> > +	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> > +	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	status = "okay";
> > +
> > +	dp_bridge: dp-bridge@f {
> > +		compatible = "toshiba,tc9595", "toshiba,tc358767";
> > +		reg = <0xf>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_tc9595>;
> > +		clock-names = "ref";
> > +		clocks = <&clk_dp>;
>
> [Severity: Medium]
> Is this node missing the interrupt properties for the Hot Plug Detect signal?
>
> The pinctrl node pinctrl_tc9595 configures GPIO5_IO21 (DP_HPD_INT), but
> without the interrupt-parent and interrupts properties here, the tc358767
> driver won't be able to request the hardware IRQ.
>
> Will this cause the driver to silently fall back to 10-second software
> polling for HPD and link training events instead of using the hardware
> interrupt?
>
> > +		reset-gpios = <&expander0 4 GPIO_ACTIVE_HIGH>;
>
> [Severity: High]
> Will this reset-gpios polarity leave the device permanently held in reset?
>
> The tc358767 driver initializes the reset GPIO to logical 0, pulses it to
> logical 1 to assert, and returns it to logical 0 to deassert. Since this
> is specified as GPIO_ACTIVE_HIGH, the final logical 0 maps to a physical
> LOW signal.
>
> If this pin controls the bridge's Enable or active-low Reset, won't holding
> it physically LOW leave the bridge permanently disabled? Does this need to be
> GPIO_ACTIVE_LOW so the driver's logical 0 maps to a physical HIGH instead?

Does AI said correctly?

Frank

>
> > +		toshiba,hpd-pin = <0>;
> > +		status = "disabled";
> > +
> > +		ports {
>
> [ ... ]
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260603093621.2504490-1-alexander.stein@ew.tq-group.com?part=2
