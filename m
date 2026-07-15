Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013001.outbound.protection.outlook.com [52.101.83.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1723ACEF7;
	Wed, 15 Jul 2026 16:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784131209; cv=fail; b=MNR9vqI+a6WlbFSIi9DlncXVtjiS64M2NbLI4DJ6BKD+j0to+B4y5SToAFNK7AtWaRpASxjYtPUmqx8FdPJCA1cmPgE4Ejr42BHzlh3he6ehUfjxwcNSIv1EwVf7eNxqlbjdyGr7kAqoH/SbBWc4cXULMQMYcXLcBeDGvdhU/4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784131209; c=relaxed/simple;
	bh=k+Zhl1rQ4nI66PuTjmbrkADx2lmw/CKAK5YFI/EidRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XhlgUWJRcnB5bLsSGFZm8BA6tdN4YhpA1ZLrk1c/J1PZwVG5OeRvSBXBXBphcC5acn9xm8jQSyR7CjXpO3Xta5q9PZzkLNaJt40CA6IDDJn+jM0bPQ1/KKhm7p4THLOMaeI3+CICtrEASdkrjvsDdNNluMzbRb79NwOfPyKB37E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NEVqFCIZ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NEVqFCIZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIw01hoe/pWah8lbBDDYPbBg5o85/pWy9/uKKEN+l3caNx/FsPbYgz0yACtVEJ9DJlna2OQ7QUgOfMJdfFXjolNOKxlCf/AvwQJzFyuLL+on4kwO8B6/AJmj3u6102RdQ15JDM24vINRUEM6GSla/28j9Lod9N8HJOfkDR5skMj7jdwUH1A3zpO7VJbwknv0DArhAEjzPs7GA7G6At/KD/CECCn/Kv6Tuq2LFAxUOinPZmEIy9Sy6MzAE08fOPMFbJiW2hQ7/jsTPSFgDHMJAGAXmdSH9NX0LI6S807Mcq+H39fiz7yb7kVQ2A8P5t7Mqt8jVKXo6uTC4vLenyrSnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxmCXKpHDxg+QM1zifivAaqw8S0tDKL6cErpbNoRcAY=;
 b=dLKq7ILDPgh72ABgsJkS5v2wjeASqlbMIhWOy1nvterKOBrBCaRmoglUjoqDzczoBaoQx1nNC1gL6OU4cvm9yzntwuvzgKKTS5+fyA4jmMMnsHx7YOa6+VC7TDsXLcb+e3bT1LzTjlNkmmnU2F5lKwads5BpTD1Sq3pgHnneB+6kumjN/A1TdxiE9HyrgIx6HjAQiOTQ70L45wVIMaRMWq2NgY7PIMVjowEuwXwTxzgd/4zLgt24pYBAcajuYQgRBqnH/BPv5Ob+5bfjsckkwHDn4JZnM1y3UTdAQ9Dpmd8DfVuRJn354gfF8AB46cyMWWNUFCY0/VsK36pNmXRlDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxmCXKpHDxg+QM1zifivAaqw8S0tDKL6cErpbNoRcAY=;
 b=NEVqFCIZAJ4WAV+7fiFhXGRxhK3VM+aToJJB94BbnyRlnpVq9Lh+aGyxa5JWIPnlLAQddzMVxRRhEWdZgrpka6rdgpEJpnTeZSeht9BpNhrlJrg2bLaU3yDKDHkQekyH3zf2xKYyGOcEPHzSQlQvMs9i6EzZI3spRFT9s079jXS+mP+Sga3Md2ayT6IPf06ti0Gnazap1vPgRx2z/5dSMbBPAP2INm2f32BTGtJ/HiBDURo0q6w3yQCWwmlL1sFu8HDRuMelU9SeKsU4l4TQmlEGjjwBNZl3LDPbc/M7+d/LmQ6MFaxgigr2kpJefe7Qg17J4MtY08meQgPo7LrsBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10103.eurprd04.prod.outlook.com (2603:10a6:800:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 16:00:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 15:59:59 +0000
Date: Wed, 15 Jul 2026 10:59:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, imx@lists.linux.dev,
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SOM-MX8 QuadMax
Message-ID: <aleudxvfXDVTzEHV@SMW015318>
References: <cover.1784113547.git.stefano.r@variscite.com>
 <6d163bb501669d004431acda73e2dab07c0ff8f8.1784113547.git.stefano.r@variscite.com>
 <20260715112110.EFC7F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715112110.EFC7F1F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH7P221CA0024.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10103:EE_
X-MS-Office365-Filtering-Correlation-Id: 6740569e-9fac-450a-067e-08dee28a1f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|376014|10067099003|18002099003|22082099003|3023799007|6133799003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	HlzzhoiiLtsZEyQHqQpr+aiDOi/txKjzuw+dXfpdclAvOyysxrvjJ9BIVaNqr9EE0VSXxtIlTc43NmbJ/dlrXFHRsDiGBLBpJ/QN0wjWtfRJEZSdi2cy2cilq1CsK1M8TX+pjUo0JRPOBC6y0fWIylua1FBGkh1QPZxCTBZ1umfCe/6dll+t2F/vtc2aYj0eKQIYUY0BMS1BFTG7OXOm3ib481xDnJCrutC/GRBXOUL0fekdmzQQnpiVuBNEbJYM4oYHt/oZvhPRgeYKpxO507ft5DltgjvzHujm9Ys5XFhCastTH/xbJgAefQFIYCScJwb7MTfbY3dr92FdEX86bn3a9z+vUwMWF1GN1aV1ZVEkjM1cDaKt//biEOBxc5bCy9VyGkzyJqQBRswcB40Rd4pORtQLHpeq79RwnvOewhBITXxt/laBfDt0R5igXUptFgLY/Suwk/T1bl+wzvIbgu4Okx8SJJMD9LSzItvHaCcd7rjdIVm+kVpN4nRTVcY5ndiHFbQJhZX27WKLIu+3CqSRJmCgjgZTu9yN2CoF+9s07LfwtGAjPfrIVkCZvAiwo5H3Z0jyEvXF7PtvV383OOZFUDivZH6XGdKkkxeUVwU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(376014)(10067099003)(18002099003)(22082099003)(3023799007)(6133799003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?BqDUXNa8Xo8NlGQFY91/VqDpoekAuJ8EkvKR5iNM2Y4noAkKBqo2fT5FCu?=
 =?iso-8859-1?Q?6mk6tCzqXDXKSMAMTJNddzyt9njFLrKUVTil/UZXplvdcDZrWA3yI7esnW?=
 =?iso-8859-1?Q?WyIu4wU2heHFNH0oiuHuNwHdOrbdYFeeJ0O3E7g874s3lIt/2HTeJv6kxE?=
 =?iso-8859-1?Q?y+UWi24JClOzF8bk3hBWUKO52gjZJOTWqva0QeS+7nrkgOXA30UboLuSn/?=
 =?iso-8859-1?Q?OEDbSv5LWwurKT2GBsfuD1hEK2I7RtfXUnyVy1ahvUd3TIsvlTs8CCakpH?=
 =?iso-8859-1?Q?ptItLFaOycvCssGzz4Q7bRWu0npjyyuzlnqtgp8El4YvKY1hS2kbO6J0hr?=
 =?iso-8859-1?Q?THvJIxP+U/IEmOD9Ysc99ALR/VWNwK/j/DqBmMkHYkEiJ498Qi0fBb0n2B?=
 =?iso-8859-1?Q?Yy4xAfeXO5+5MvT/5fQ9cn7sudXAOTMaC5AQnQe8lNg9/zxFzTEiOiiAP/?=
 =?iso-8859-1?Q?akxJHiQbI26SCU63wpQXlU2NdPQaAwcFMIFQlbFwa2q4hNnza7kD9ntK4e?=
 =?iso-8859-1?Q?8OEEUTxa7yLW5jyVHoEcfmnxk+eA3J69N+fZ5TD8Icfienwi1dCnz24/HI?=
 =?iso-8859-1?Q?62llw8dL9K7fD66Y/AP+aecdddudWGWBPCKhVsN24oitsh5BV0Rh6ha4rC?=
 =?iso-8859-1?Q?ONlNXsCt1s/AZYHI6i9FK2SsLZaQXMUv6SZyw2cYEW830/mj4X/Po49Etn?=
 =?iso-8859-1?Q?W/Xn6clVe965aMI0FLfOiyQbihZH6sstA6Wms3MQPHX/yKZjhFwXavDJND?=
 =?iso-8859-1?Q?ReBJ2AoapWXEQEhYaXFIQImbCD6/dkUwYF3Hp3aaLkCNsfGXRNt820RhiA?=
 =?iso-8859-1?Q?MstphuqWUuzz5qoc1LnQ2ckNlrvHo7QBvBwe+LQN59LdBslCKjCMkm5fWJ?=
 =?iso-8859-1?Q?bWocwOy3jJo1SEL+kw0xM6abeszhanh8EpNCFAfCLgWGqMIc28/+iXCTui?=
 =?iso-8859-1?Q?+JQ3mhfImbNow+4YOOcnS85MODFo38HW949zyIZNdcLZIw/vhqh8st8q7X?=
 =?iso-8859-1?Q?zud+li47iAOrLdK8yW5aRPW2HkUoT/nw/5t4RCQC/eRiysoxHW46bALaJE?=
 =?iso-8859-1?Q?XMQzIB4FAgkk6vsqFEmAcEos7qHydKsmQdC5WkI2bAR09rOmxAD5/sevKK?=
 =?iso-8859-1?Q?PVJPBpuCn0N0tKWujgo26RgK1XmLWeIqEUqPYvDHi+vOM6ZXUc8C9Ol2ns?=
 =?iso-8859-1?Q?Vh+bHq7apFm4nKiy9aUtEE0Uy9Fq10xu5i00Gs9krXsuqfBDjn1sdIBqSb?=
 =?iso-8859-1?Q?RL9mzJX8KkB8/cxEBDRod2WLBW2v8jLd0cS+f7GIRodU6HH98A20/wa2ni?=
 =?iso-8859-1?Q?Jp79r/gcJoaF9s0xWpFzocWUKFyILuV22GcsMdNbH+x0pJ9UEfoNqtWBxo?=
 =?iso-8859-1?Q?KQm+n+A2HdNqSeQ3jFIOgwnrKYfWUwgkt43mVieo26sBSO/ztrjJkrmFPt?=
 =?iso-8859-1?Q?zzNPhT3EyKeLidp/7hCsFCKQ7nN860fCcZZ68MuqUNIbapHJyXVePLngCP?=
 =?iso-8859-1?Q?QNg1pMCMIjumAIxfH1uQyQeCNAZjJfoOMPxPH8z4F1Qx3w3kxM3WvB9ovP?=
 =?iso-8859-1?Q?tJYHX/E7vxKI2kG8IleynQ89Vwkb+rq4rHqVmrzJiu/pqcp+CES17tt+5C?=
 =?iso-8859-1?Q?1qLfR02Zci8LJEbkQdOYwDUSwiZWswCJ4krqQlVh56fCuehpB/csEu+Afa?=
 =?iso-8859-1?Q?att8p1Mfr+e/JeO3ujhI3yCwC4d469LYb0CytcU1kV9gprh8TTljeNcdSv?=
 =?iso-8859-1?Q?4n4+2MaG+EroVSTeF07GvRXPn2OAeq5ubgedxRwni+9CmbjNr57/F4qmPn?=
 =?iso-8859-1?Q?+ogBsSSLQrYIvwBpsQxBofqBrhxpjURKybPbOmPmSfI+DxqudFo2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6740569e-9fac-450a-067e-08dee28a1f8c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:59:59.8844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTXjigm170m6FN9dU1ygdMxOcTtmpb8yPOlXyDIZEhynWGbDU6M+50zj8rugFFoAV0i8bj6ECemkhhEj6hf4KDsTtcgVHUB8wrqtHXyMyhaGI0kmOdiGy28C0xL33PTO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10103

On Wed, Jul 15, 2026 at 11:21:10AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Audio master clocks (MCLK) are left unconfigured, and audio baud rates are erroneously applied to peripheral bus clocks (IPG) due to incorrect LPCG clock indices.
> - [High] Conflicting assigned clock rates for shared audio PLL MST_BUS.
> - [High] Codec MCLK pinmux connects to ESAI0 high-frequency clock instead of the configured LPCG clock.
> - [High] The Continuous Memory Allocator (CMA) pool allocation range is strictly out-of-bounds relative to the default declared system memory, breaking CMA initialization on 1GB SOM variants.
> - [High] The PMIC thermal mitigation map ignores the high-power Cortex-A72 cores, defeating effective thermal throttling.
> - [Medium] WiFi and Bluetooth enable/power sequencing is explicitly deferred to user space instead of being structurally modeled in the device tree.
> --
>
> --- Patch [2]: [PATCH v3 2/3] arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax ---
> commit e14b5ef256af728dc56444b803ea5575d3814182
> Author: Stefano Radaelli <stefano.r@variscite.com>
> Date:   Wed Jul 15 11:08:11 2026 +0000
>
>     arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
>
>     Add device tree support for the Variscite VAR-SOM-MX8 QuadMax
>     system on module. This SOM is designed to be used with various carrier
>     boards.
>
>     Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-quadplus/var-som-mx8/
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
> > new file mode 100644
> > index 0000000000000..08b02173b780c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
> > @@ -0,0 +1,530 @@
> [ ... ]
> > +	memory@80000000 {
> > +		device_type = "memory";
> > +		reg = <0x00000000 0x80000000 0 0x40000000>;
> > +	};
> [ ... ]
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> [ ... ]
> > +		/* global autoconfigured region for contiguous allocations */
> > +		linux,cma {
> > +			compatible = "shared-dma-pool";
> > +			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
>
> [Severity: High]
> Does this alloc-ranges declaration break the Continuous Memory Allocator (CMA)
> initialization on 1GB SOM variants?

Do your board have 1GB variant?

>
> The declared 1GB system memory ends at 0xc0000000, while this alloc-ranges
> property forces CMA to find memory strictly starting at 0xc0000000, which
> would sit completely outside physical RAM on a 1GB board.
>
> > +			size = <0 0x3c000000>;
> > +			linux,cma-default;
> > +			reusable;
> > +		};
> > +	};
> [ ... ]
> > +&esai0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_esai0>;
> > +	#sound-dai-cells = <0>;
> > +	assigned-clocks = <&acm IMX_ADMA_ACM_ESAI0_MCLK_SEL>,
> > +			<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> > +			<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> > +			<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> > +			<&esai0_lpcg 0>;
> > +	assigned-clock-parents = <&aud_pll_div0_lpcg 0>;
> > +	assigned-clock-rates = <0>, <786432000>, <49152000>, <24576000>, <49152000>;
>
> [Severity: High]
> Does this configuration incorrectly alter the IPG clock instead of the MCLK?
>
> The assigned-clocks list uses <&esai0_lpcg 0>, which is IMX_LPCG_CLK_0
> (the peripheral bus IPG clock). The master clock (MCLK) would normally be
> at index 16 (IMX_LPCG_CLK_4).

Yes, 0 is wrong.

>
> Additionally, is it safe to assign 24.576 MHz to IMX_SC_PM_CLK_MST_BUS here?
> Later in the file, the wm8904 codec driver assigns 12.288 MHz to this exact
> same shared audio PLL MST_BUS clock. Whichever device probes last will
> overwrite the other's frequency, likely causing audio distortion or failure.
>
> > +	status = "okay";
> > +};
> [ ... ]
> > +&i2c0 {
> > +	clock-frequency = <100000>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_i2c0>;
> > +	status = "okay";
> > +
> > +	wm8904: codec@1a {
> > +		compatible = "wlf,wm8904";
> > +		reg = <0x1a>;
> > +		#sound-dai-cells = <0>;
> > +		clocks = <&mclkout0_lpcg 0>;
> > +		clock-names = "mclk";
> > +		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> > +				<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> > +				<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> > +				<&mclkout0_lpcg 0>;
> > +		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
>
> [Severity: High]
> This assigns 12.288 MHz to IMX_SC_PM_CLK_MST_BUS, which conflicts with the
> 24.576 MHz assigned in &esai0.
>
> Also, the codec driver expects to control its clock via <&mclkout0_lpcg 0>.
> However, looking down at pinctrl_esai0, the physical pin is muxed to
> AUD_ESAI0_TX_HF_CLK (ESAI0's internal clock) instead of AUD_ACM_MCLK_OUT0.
> Will this leave the codec without the expected master clock source?
>
> > +		AVDD-supply = <&reg_audio_supply>;
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
> Since this UART is used for Bluetooth, does it need a 'bluetooth' child node
> to properly describe power and enable dependencies?
>
> Without it, kernel-level power management (like suspend/resume and rfkill)
> will not be able to power down the module.
>
> [ ... ]
> > +&sai6 {
> > +	assigned-clocks = <&acm IMX_ADMA_ACM_SAI6_MCLK_SEL>,
> > +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> > +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> > +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> > +			<&sai6_lpcg 0>;
> > +	assigned-clock-parents = <&aud_pll_div1_lpcg 0>;
> > +	assigned-clock-rates = <0>, <786432000>, <98304000>, <24576000>, <98304000>;
>
> [Severity: High]
> Similar to the esai0 node, this assigns the audio baud rate to clock index 0
> (IPG clock) instead of index 16 (MCLK). Could this cause bus instability?
>
> > +	fsl,sai-asynchronous;
> > +	status = "okay";
> > +};
> > +
> > +&sai7 {
> > +	assigned-clocks = <&acm IMX_ADMA_ACM_SAI7_MCLK_SEL>,
> > +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> > +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> > +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> > +			<&sai7_lpcg 0>;
> > +	assigned-clock-parents = <&aud_pll_div1_lpcg 0>;
> > +	assigned-clock-rates = <0>, <786432000>, <98304000>, <24576000>, <98304000>;
>
> [Severity: High]
> As with esai0 and sai6, this applies the 98.304 MHz rate to <&sai7_lpcg 0>
> (IPG clock) instead of index 16.
>
> > +	fsl,sai-asynchronous;
> > +	status = "okay";
> > +};
> > +
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
>
> [Severity: High]
> Should the high-power Cortex-A72 cores (A72_0 and A72_1) be included in this
> cooling map?
>
> If the A72 cores are omitted, they will remain unthrottled during a PMIC
> thermal event. Throttling only the low-power A53 cores might fail to reduce
> current draw sufficiently to prevent a hardware thermal shutdown.
>
> > +			};
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
> [Severity: Medium]
> Is it intended to leave this Wi-Fi SDIO bus without a vmmc-supply or
> mmc-pwrseq regulator?
>
> By leaving this out and explicitly reserving the enable GPIOs for user-space
> control (as seen below in pinctrl_wifi), kernel-level power management is
> bypassed. This will break suspend/resume and rfkill functionality because the
> MMC/SDIO core cannot power down or up the module itself.
>
> [ ... ]
> > +	pinctrl_esai0: esai0grp {
> > +		fsl,pins = <
> > +			IMX8QM_ESAI0_FSR_AUD_ESAI0_FSR				0xc6000040
> > +			IMX8QM_ESAI0_FST_AUD_ESAI0_FST				0xc6000040
> > +			IMX8QM_ESAI0_SCKR_AUD_ESAI0_SCKR			0xc6000040
> > +			IMX8QM_ESAI0_SCKT_AUD_ESAI0_SCKT			0xc6000040
> > +			IMX8QM_ESAI0_TX0_AUD_ESAI0_TX0				0xc6000040
> > +			IMX8QM_ESAI0_TX5_RX0_AUD_ESAI0_TX5_RX0			0xc6000040
> > +			IMX8QM_MCLK_OUT0_AUD_ESAI0_TX_HF_CLK			0xc600004c
>
> [Severity: High]
> As mentioned earlier, the wm8904 codec driver configures <&mclkout0_lpcg 0>
> for its clock. However, this pinmux connects the pin to AUD_ESAI0_TX_HF_CLK
> rather than AUD_ACM_MCLK_OUT0, meaning the codec will likely receive the
> wrong clock source.


Please double check this

Frank

>
> > +		>;
> > +	};
> [ ... ]
> > +	pinctrl_wifi: wifigrp {
> > +		fsl,pins = <
> > +			/* GPIOs used by user space WiFi init */
> > +			IMX8QM_SCU_GPIO0_07_SCU_DSC_RTC_CLOCK_OUTPUT_32K	0xc600004c
> > +			IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31			0x06000021
> > +			IMX8QM_SCU_GPIO0_02_LSIO_GPIO0_IO30			0x00000021
> > +			IMX8QM_QSPI1A_DATA0_LSIO_GPIO4_IO26			0x00000021
> > +		>;
> > +	};
> > +};
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1784113547.git.stefano.r@variscite.com?part=2
