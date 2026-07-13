Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011041.outbound.protection.outlook.com [40.107.130.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5A02798F8;
	Mon, 13 Jul 2026 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783957808; cv=fail; b=R1cdzR97Y6Noy4/EjzxvOJcS8/EDJVmRhQyRMbkWJ6Zxnl2LxZL2YZ/PT73QyhEAM7vEWpWS5hN8twg8SQpnvTUkvg7iILwAq3Au9E5LvlPclDTxnnat9xnlxwXG2CveRvOaD4+B77REVMkpJZo1LJQ6vv6UrlLFFwpcS9lg1BM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783957808; c=relaxed/simple;
	bh=BS0eRM22uGS1uDvCEtLuRLrACQ2uPAFLc6AmY8NY/qE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JldbTeqsSx/OQR05QWruVrhXwNOGCNtaO5DxU3riYqPvxJPIoB0M6/otbWP0xwzmh+Qa0Bw9RzG19CYLmd6tpCtv676xDljgJ8tFo6yWBHgMCaOCB0DHUMpylVIx0v/RxNFnJPKGDs7VW4iNtdLNR5lZB83mp1rbWCDWYjVfSa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=O51qVjNB reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="O51qVjNB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRWHdURRE3aco/dYZ9DsZLW2P8cSQeM8ncIE3kxYaWxYW3w9pgwC1ViA47QGqJxnBRUXXcxN+CUpylAf6VEtjuD54oPSEDszrZ8DRmL4zT5QX1zVc3gJ5BQOjKuPpEGv+TCO+VNMDiOpU/djZey9c3gwL8wvijywGj31K7a6cGZuDMl7y1cgbYcuhc16guPyrsos1bvLX5GzYHd5lONS5r22vwrjYBdpVz1upuDyMBKv9GFEsGIFSWQ2e5EEVL95pQ1D7o7VvEXNKRuXHFFd+TNluItSXgxkcFUwRdRpUjd3sVGxxah+OEcWcBVXnUb/mkeCBMnNIQc2oeon12K0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sd+689/Q04zJTUjqaD3LmKOBSNi0OBQ8ZnO0MR1iPs=;
 b=bvqzxUp9z66RFEyBKibHVcO3vfTNmgT7tThkbPLdWq7TwZsNc6jbWXPtmPi57fi5gPdyBvvOCYoR+KLHY8CNdHSVekhHC8gXbLoUUSKUlPTkbHXc0dgkPUIZSUu1W3/FZM/ESyqrNjbj4LbYQPu1IId6SO5W0EId1Az/rdCWCDEXizdhJU0qN6TU1V3ujWiUpzSYcv5TVo+hBPnV1ZZqd2TRuUtcgnQDrKLo3eo4FbsEl6S1eCQC9DlIOl75ovPe+yGhqWs9cDTGj0DEukC7t/vaKiE12dvKwLFITzmV2Gg7RM3hA2mx0HHcH1VkXpSLsaZhyo9ap7jaU700HM5x0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sd+689/Q04zJTUjqaD3LmKOBSNi0OBQ8ZnO0MR1iPs=;
 b=O51qVjNB+PwWjHQOX0xnhQpWnBFEppf893F68sDuu9fIZuDASM5611DaCTey3tM+KAS1hRV2pmboLVV2j1NJyAw3G6nKwCrtBZeiwaMRCR77j7O2x+7Nt/Rt2WYNOipTkB0NJcoIauhKNCrlD/cAashYNwq27ezQb95v+igLJ6mzFJ7wT8KpTTAYqgglMAsut2m9DPs5qUK6DoMw8S7ewlQTBomO4KMPiPdna1TEfvu5Y05D8v3jh4iGcz2vq/4iM9hgHJCeEWRQfnC+TlUPTkKkJ3XMf0ggxP+RbBseQyvtD0k1o40fb6tCQJr6zozFvpGWMsg+Prh30nqf+it+UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7551.eurprd04.prod.outlook.com (2603:10a6:102:e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 15:50:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 15:50:04 +0000
Date: Mon, 13 Jul 2026 10:49:54 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marek Vasut <marex@nabladev.com>, Frank.Li@kernel.org,
	imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs
 for Data Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <alUJIlUUo98_x0Lm@SMW015318>
References: <20260705200534.151803-1-marex@nabladev.com>
 <20260705200534.151803-6-marex@nabladev.com>
 <20260705202221.E99291F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260705202221.E99291F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH0PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:510:5::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad75b59-8450-4bcd-8338-08dee0f66796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|23010399003|376014|18002099003|22082099003|3023799007|6133799003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	LAqYtYWX/YoMrFwG+oXLQcR/9rDsvi4LPNAKJhXtzImzsbUMLZkut2RZkZQzWyRvqf08W8cc6ZsF4it1UkEtg9AmcMD730S83ZLmB4NNFoszCv++A3SRSP+uu48K35c1cq3OuXWN/fmkQkPOBBW4ZPL0mYNs2K7Bj7Jxh05PoFdLH4rWXtUJ/4+7ixV5Osf6WvGahtUyxd6lZLHZTGYJb3rRTVY9bzCXgruVBrChKG8mSpfM4COJPFcKlLYSQnfShJ1XpXascIbcxn/3XZDQIh8a+Z3CvlPSpJKGmTbesBpWLGNC4kzhjSgNsx0Tr+WrWAwP8zbKaF4NCAXqi/bSukaOytgGgLbCYxhrdWtM8DPVeiVDxxKiPsoBmQK9kkPGLV6z9u+d3SCDxjfKBc3lJJ75QV0U9+GgEcAup9m5Ep3lsKqmDvoZ82rm52z6G9CxLsrDMry0wh7ElJtyIBbYsMyENNTN3CK9S/ffEVHZ7snlKVQwFMv7gPwFeW9CjOJsUd3ZudIcSKZzfM3V6x8bcwl9jXDl38BOpmnweHyY1/I4ufPwkp19jkuS8LT76hfZ9WGQeQceGKO1aLwIjLv7mt8AxsCBT4ZfffnfObF0l3k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(6133799003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?jPMHqn1mb74eIrdSsNOwhCQuUx3TfsnChF+mjG4dsSnGrhUzIlCWc6K1/o?=
 =?iso-8859-1?Q?Z23WPX2e0HeA4UKqYjH8T5B1UgbqzJ15PEOlTIrJAxooMXp3MI2JcvazYI?=
 =?iso-8859-1?Q?RZfvLvJo3RcV5PH//ptgXMscAjtI52aBQ2UVi0HtYi8JsdBPPSakiFhYM1?=
 =?iso-8859-1?Q?5Vc5YsDVxVIrMcvnNR8eO6cnpxTODabubbx3+4FYNYRsqUjez41kIxdZ+D?=
 =?iso-8859-1?Q?xHlK9Ike6SFds/F8NzXIgwWQGvwrohIdB4912f6VmMTHiRQnf/RSFjGl/f?=
 =?iso-8859-1?Q?+BwnJ/ufQsuu9IAhgiuTY3PxUoWJiNvoHTPKCeQ3nB8IkhAJ7nyUUOW3Ok?=
 =?iso-8859-1?Q?eBFg3u63KoISd5Lhb8HDb6tmUlWgrZJ8ArQmA3q0p7WYp7YbmNrwMqmftV?=
 =?iso-8859-1?Q?6Xe/cOMB+XKPSjM9K75kLVwCithO9D/hlbcGhNQ8bLTt9tB60ev4kAxLj9?=
 =?iso-8859-1?Q?6/hXBM/8bzmwojF8DD+DgbfLtQ1X6Vpd32C3D3gYRjuUjaBFa445ERa/3a?=
 =?iso-8859-1?Q?0A1GpJ31PShq6mVV9uMqLnUwKUnscuN1zSw2pq2RihSR30KjAZ9sYAq92d?=
 =?iso-8859-1?Q?e3giIkLMinRxnAaHzNi4GCgfnr84htQ9x8b8jqV/q6icBNd+p3Oxh68o5f?=
 =?iso-8859-1?Q?qhv8sLGyv2Ml60JdGQFKYvMEpwG5rK5ylR1p5Zcmvnfto3bj6GsLmonToR?=
 =?iso-8859-1?Q?7KAG5KIdSvm7mx7nOC6Exq3cmzqWu95JhWB2vgiFLaB2GNuvvU1yxNPv4q?=
 =?iso-8859-1?Q?VP57pc+CDiKhw5r3GnueZOeD1kIIKpgm8PEJ/btQYL3caozM9zEYlFC+KA?=
 =?iso-8859-1?Q?GC/zUjq7DHtVtkZgZZ0V+Mh1ifebCQ0mJ0AhKM/NVKyBa0scdPIkxVd4M0?=
 =?iso-8859-1?Q?noYLEV+ip16MoKQXHOjn1iHdSsUjj3CGrwzEjRsacHbBD2zuwoZPLH4+p/?=
 =?iso-8859-1?Q?4bWL7y8kdHDvwyeokEJLo8NbEdzZ/0zsBvsUA6NzZSwzKcwWYj18W74Stv?=
 =?iso-8859-1?Q?N08ZrsWChkg6akLNguH1Lg2gRlbyfV0u0XErPkOCeEW/wQuu3QYKqBFizx?=
 =?iso-8859-1?Q?RlTjbNF8y6sEnE6dcCL/+NUWpahKkyqAFrZOSTX7z24moyVedcekAUlwWk?=
 =?iso-8859-1?Q?VzcmCNyaF+NpsCODsxq5rDFi8YbwRzBrKMchPp2D757ry4l9HI20hMvesa?=
 =?iso-8859-1?Q?nFQBNg5iYhzXOGAMRNOEkV+V+UtbMbR1GE/YCu7EXaBpETNF7VxnKCq8L3?=
 =?iso-8859-1?Q?ajWzpg0RBdsTvgkWy7U6Dpl9HRUlRqNqevZDvNq9lvuVqKFR1v+jVPDF7s?=
 =?iso-8859-1?Q?S8+nRumq7Zj77dbJxuh23jSPFzYZqjSBPE8JWBQFI09VkrAHeUbeFTSyxz?=
 =?iso-8859-1?Q?H4FXNVL+UOVrM5SyO6ooO/j/PvhOB8EgAW1DMg5H7XUVAKOxLmA5I/LuW8?=
 =?iso-8859-1?Q?s+EgxTUAqT5OibhHUJPr9W3XC/q+LevFuJSh3T+B+vBtE9Sif0AjpO32A3?=
 =?iso-8859-1?Q?16tNtyogFY7aCcKl7ThANaPKGW+/RGX8x1E20ZXbEjFPsFk6Ngy1V3VqCW?=
 =?iso-8859-1?Q?xwiXWBRmXvt1Tq/MMWW6iIcSP4b/deFrdy63hnSlUh7OKGnSid8+k0rO5i?=
 =?iso-8859-1?Q?Pst+HW0bbpUOkhBPcRjaXpHkdgKO4Uckhkl0lnwzVhYcrx0SqBIQSWkTg7?=
 =?iso-8859-1?Q?t3c0YKpKubm+av0Hob0pv0z7ozDl4JBc6Xc23cr5BoFQ7BIVcwC5LH1qH7?=
 =?iso-8859-1?Q?2VCmnQZia5GXrvXNgZzIZHDcFT4ss8p1UhgbHgFHoYvuHfZ4dcH45VUSO2?=
 =?iso-8859-1?Q?dzJbjUsOxvqZYcN+bKO5WRHR4yI8pvdL1+ruBeu8iCOvbGbI6tVH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad75b59-8450-4bcd-8338-08dee0f66796
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:50:04.0765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5niYR3d+nz3tO7VN0Uocslklzcb83Ub1CcqwVnLkd7yc8w3NmfKCjCBTisG6j5R2T+lyuBE8/ZmWUqCe90IxCxnxlVIcpFQLvUmrsKpbQgWaEc548omUeNqTgPYJraI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7551

On Sun, Jul 05, 2026 at 08:22:21PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] The SAI2 interface is incorrectly configured with `fsl,sai-asynchronous` and an invalid `fsl,sai-bit-clock-swap` property, leading to audio capture and playback failure.
> - [Medium] The overlays instantiate new `clock-controller` nodes at the exact same unit addresses as the existing `sai5` nodes, causing DTC warnings and resource conflicts.
> - [Medium] Missing interrupt override for the PCA9554 GPIO expander in the i.MX8MP overlay causes the device to listen on a dead interrupt line.
> - [Medium] The commit message claims features that are not implemented in the patch.
> --
>
> commit 1e6ee57031100e82b436dac299b0eed194860d5b
> Author: Marek Vasut <marex@nabladev.com>
>
> arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>
> This commit adds device tree overlays for the eDM-MOD-iMX8Mm-FIO1-Audio
> feature connector expansion module. It provides support for the SGTL5000
> codec, CAN, I2C, SPI, and other peripherals on the i.MX8M Mini and Plus
> boards.
>
> > Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1-Audio
> > providing additional UARTs, CAN, PWM Beeper, I2C, SPI, GPIO breakout and
> > SGTL5000 codec. This adapter can be optionally populated onto the eDM SBC.
>
> [Severity: Medium]
> Is the commit message accurate regarding the features provided?
>
> The FIO1-Audio overlay only seems to enable a single UART (uart2, while uart4
> is disabled) and doesn't contain a pwm-beeper node or PWM pin configuration.
>
> Could the commit message be updated to reflect only the features actually
> implemented in this variant?
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
> [ ... ]
> > +	gpio_feature: io-expander@20 {
> > +		compatible = "nxp,pca9554";
> > +		reg = <0x20>;
> > +		#gpio-cells = <2>;
> > +		gpio-controller;
> > +		#interrupt-cells = <2>;
> > +		interrupt-controller;
> > +		interrupt-parent = <&gpio5>;
> > +		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
>
> [Severity: Medium]
> Since this file is shared between i.MX8MM and i.MX8MP overlays, does the
> interrupt configuration need to be overridden for i.MX8MP?
>
> On the i.MX8MP baseboard, this feature connector signal seems to be physically
> routed to GPIO1_IO08 instead of GPIO5_IO04. The i.MX8MP overlay doesn't
> currently override these properties for gpio_feature, which might cause the
> expander to listen on a dead interrupt line.

please check this

>
> [ ... ]
> > +&sai2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_sai2>;
> > +	assigned-clock-rates = <24576000>;
> > +	fsl,sai-asynchronous;
>
> [Severity: High]
> Does disabling internal synchronization between the TX and RX halves of the
> SAI block break audio?
>
> The SGTL5000 codec only has a single set of I2S clocks, and the pinmux
> settings only route one clock pair. This leaves the other half of the SAI
> physically disconnected from any clock source.
>
> [ ... ]
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> [ ... ]
> > +&sai2 {
> > +	assigned-clocks = <&clk IMX8MM_CLK_SAI2>;
> > +	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
> > +	fsl,sai-bit-clock-swap;
>
> [Severity: High]
> Is fsl,sai-bit-clock-swap intended to fix the asynchronous clocking issue?
>
> This property is a downstream vendor leftover that does not exist in
> mainline device tree bindings and is ignored by the upstream fsl_sai.c
> driver. Should fsl,sai-asynchronous be removed from the shared .dtsi
> instead so the SAI can operate in synchronous mode?

Please check this ?

>
> [ ... ]
> > +&spba2 {
> > +	#address-cells = <1>;
> > +	#size-cells = <1>;
> > +
> > +	sai5clk: clock-controller@30050000 {	/* SAI5 */
>
> [Severity: Medium]
> Does declaring a new node here cause a duplicate unit-address warning and
> potential resource conflicts?
>
> The base SoC .dtsi files already define sai5: sai@30050000 at this exact
> address. Because the node names differ (clock-controller vs sai), DTC will
> create two distinct sibling nodes rather than merging them.
>
> If the baseboard enables the existing &sai5 node, both drivers could attempt
> to map the identical physical MMIO region using devm_platform_ioremap_resource,
> causing a -EBUSY error. Should this overlay reference the existing &sai5 node
> by label instead?

Make sense, please check it.

Frank
>
> [ ... ]
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> [ ... ]
> > +&spba5 {
> > +	#address-cells = <1>;
> > +	#size-cells = <1>;
> > +
> > +	sai5clk: clock-controller@30c50000 {
>
> [Severity: Medium]
> Similarly, does this cause a duplicate unit-address warning on i.MX8MP?
>
> The base SoC defines sai5: sai@30c50000. It seems the overlay should
> reference the existing &sai5 node by label here as well.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260705200534.151803-1-marex@nabladev.com?part=6
