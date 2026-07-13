Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011019.outbound.protection.outlook.com [52.101.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ABA344D86;
	Mon, 13 Jul 2026 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955852; cv=fail; b=sonkRkB+SOzED7IQJEXDLTATb9Xq+usPx7rRzFJX6pJc1DotUG0T0XF9hwONgRGxVt+DPlWvsJ+5XWw7U04aRKfY6xy+fSLM0SXjFoGZWnp6JHfJ6/s+icCl/PaTv6hMIA2un5YyyOweOXTqS/SvZvcizsPy1Qrnqo+DJ+cyTf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955852; c=relaxed/simple;
	bh=OaVyTfRBf4z34UpWgmgUyWen+mdF4N2Wl297pPjXqcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mNM933XiRoM0WIhUM0ttWBRqHus6fiG/5rcHKPUOfTl7u6KdANsrcSeuSh0Vd9Yi6JU4jCR6s7q0eYkCLdzqLFNyAUnfYj6sun6meKcujdx5BcSRXt4zDU7chjhnOy4eqMzrThiROlroRH/rRiYO5xegoauC7svtNI2vGXqUl5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rdxfBlMG reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rdxfBlMG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJ5H4wQd4Pwzak6wwdvnJvtIOOcKX/ARxMMY84TXUwoa/6Wdn04Rfax2I2ikbLzG7YPtPWewFeVznmy2R0bEkq9r2QxSxSbQl74msaQndx1KNgbElo9qAiI4mbPuGkuJSvjabWaPvG3W4dA5nLzUEEECPx5Z+A/23MCa3+VmSgfwENxNdJa1g+x8ULxILxlk22oikVe12N7H9Q515lXKeSeHFn7fxLbdILmIsW3gDV+nzQqsZD8ExlLLC4W+JXl2JH5KVs3GJYOYVFrsKJeSdYRW3LlqULKcoepdrP9nCHfyG4+rjOmyCJyY8bSZq/SDn5QNJWjqSwok6alak56Z1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXmjNqSBw0hgXxrMdU7A9POCxk7B1O1w68hTMBjP47U=;
 b=IpcWPb3cI/KCYw+qGRYq64Zr8cktWDg82CWzEWQMBoympU3Z17yU7WKDGH5W+pOjnoPHYNE49I3he/gXT9D7NCN8jCUoZlDciJSrETXN4KgsmdDB38Sgrd/Ad4egueLm55l2461aH2fdi9o20XZZ6ujTepaTTHdOV/omE98IKH4t6kh2jA9JqLSRUlc2ZLQ/nTuX5JM9xH4RIiP7O4anIYQi0muMkiEl8l+Hi61JgKEUasrNEdGwCPIDE6eORVWtMa5/8wYOqFi+RxOA1bKchKUxZoRVjn5EeRbZz9OlW77lm8Rrx9E77+vddlYX8fMH0IH/Dov2uRXAHrH8tTjf/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXmjNqSBw0hgXxrMdU7A9POCxk7B1O1w68hTMBjP47U=;
 b=rdxfBlMGwcDANydlNdxMNGyhiOD43mtihEGPDXhMNb9WjbsUzkjd7xDj96kszqAimOWbApBMbTWJXFno6crX4jcgIeAA+jnYgve6XKwY4aX+4VSaGPrh3bfhJOEUpNjgvF//KW+5Hmc3F7T8e0BCM8f0wRP2wzJhIl9f4Gs7em7b8U5Ky3Q3B8kUOwOF8ifDFJPNK2yLN2IDdMeSyp/UNWJn9ii3h814cBkCOcOTsV868nCdRSjwvAjLevPlcEX8pHsBiLQ+5JBX1Zb2+6MxqhPQZmJ3cyk5IXUZBHYECjQTvHvq5FSTMfjL6IvaVOtxURjSRzWpjmiy+6zTPfdhBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Mon, 13 Jul
 2026 15:17:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 15:17:26 +0000
Date: Mon, 13 Jul 2026 10:17:17 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, Frank.Li@kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mm-var-dart: Add support for
 Variscite Sonata board
Message-ID: <alUBfVmj2FvJA7q2@SMW015318>
References: <cover.1782571383.git.stefano.r@variscite.com>
 <e7fa5dc7f6f29bfc3f1b7b7e55cbec3758c28f14.1782571383.git.stefano.r@variscite.com>
 <20260627145754.943BE1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260627145754.943BE1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA0PR11CA0196.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb2d0df-b762-4f4d-de82-08dee0f1d8a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7ukehtql0NPbSe/H46RcyOo9f+hM5JlgYD3onW7yj21UnDXgZoCOKyxhoIiwfBkzEKoB8deHyWuuUqzm2HYLvjXmIr8mqC1lP/hulA6OtRF56+9JOi7a9sudQI6csvhecidAheQccekqce/TwpIKc2/FNlVEzc5fm1ROvOk/YFLofoq8+vg7BVZKk3/xTtvv6FWJSMsI/U8/q0qPL2tdNhqbj20sqNm3YurR0nVsyDED5fFw025VXDueu8+70Zl7CHrSQc9t1G9pwE/Ybf+fR8Kq6kTwCKfdjdjnvn4l82MpI4YwVs2p+Yj3O5EqRiXYiBTJ8dd5P+21Lhy+q3wjvCs/EzXLQyvvDogr6gjw2UMIxVw1E85uj/BVdExL3HI36NSDcuZF5gIqQ10HgLgZLS6xnpnQwuAJU2+KdNaS8WK0G5Mba3TJmHuBMTECL68ezR+0uUg3x6Es9J+IYpj5o/6P+631tVKdIJCrkZQVvFqr0jjWYr40leJ2cU61uEDRES8i0ZdRS93VkWkpaNoGCdIJCbTMubA5C53CV+xnCTWuJAXDmTHR1jOFiYJCGfGNgw4HdiV0UJTmVv69g8//cVJBnQ1R5FJdUOrmtE/WVAY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?kX3KkvUadtW4B/+JTMT0ESOwnqhvHQ9S9G2+pgqhmcFinIP5qXerwrBLzf?=
 =?iso-8859-1?Q?YtOTFhd3XzrJT1qcDYDPDNIK5uPAmyyjWkXKQUmm0r15xiKVZwsmbrCqRR?=
 =?iso-8859-1?Q?3YyQglmfdg0glAVvcqXDvB+9UffnksvxUvKE7y/ghSyYLF5Y0KF+nmUnVq?=
 =?iso-8859-1?Q?ZF8rs/pYXwK6f/gWKWe3av147tj2oT+rXJPdd4DJ/zAi/1nqS6NEhkG4ez?=
 =?iso-8859-1?Q?PlNjyaAcfEJ5BiDVLOTsg7cju3+OcYrGjDBORI93nWE59PE6SGXw7wCWKH?=
 =?iso-8859-1?Q?D7SSGgLQne5PyrSQA6PcajocbkCbURS959Ho9l4geyQZzbDNqB2/zWxqBq?=
 =?iso-8859-1?Q?Q2+eVQxCtONg0dsj5tBGPIMKw1VuoV2QdR+4V4nDp1xRw3cJz2wNP5aFwc?=
 =?iso-8859-1?Q?9SwgbO/iouDLiuq6VTY43cqSoZaPT04WGKguPAoemP4gwc+g/U/SzIeKq7?=
 =?iso-8859-1?Q?861cCOZF8/hQ7AW+K3j7fb75m82PAGY4Cb8wv3CK6ITbUcml3ACQGZ3oWu?=
 =?iso-8859-1?Q?lXYcpnMQStmkqIN38r3xMGxkrY4OAsuPN3QVgjdpz5OqS2xzfUxdYEpKr1?=
 =?iso-8859-1?Q?u5LDaat2p8fCkF+rmRoDAEw+wipGI9V6wZ5EG4qQCE73s2xINAFRg+LRTN?=
 =?iso-8859-1?Q?uslkpSa35tWQW0IRUczGisqfnH2Oc7e/ZdW7dXQiX8sWpkz3HW7FE+UIJv?=
 =?iso-8859-1?Q?HzMBcbBS13UOsbtekTqgGRXAzLzeo3sAfosv4ZqL1nxZEwnex5vOCQPnMC?=
 =?iso-8859-1?Q?qnO6nOEXrlr1DkGnJs4VHDwyTBKXJsOKYQrfwHk7zkC95zj+ETk547Gbg0?=
 =?iso-8859-1?Q?UJ24AoBEzj/zeF2JBjWADy5PbecQ8Nc6T+DsRbZasJrrtE1RnkoE/Mz1DG?=
 =?iso-8859-1?Q?71ayNWayWTm5pIlTnNmdn59Vo7JG2+Bs1l+lVhdaW8qQepB8H2z4rxI1z7?=
 =?iso-8859-1?Q?Wg/i5Sk4v2FNfzKDjZi1z3q7UuCeVxHR56SunJwepfAMMMuyUiV34OvTYZ?=
 =?iso-8859-1?Q?OjwTKJ6D3LcGV8MWIfVh2Qyzp4KWVRAETa+9akbTEmP9m1I+k3zmUqoLjY?=
 =?iso-8859-1?Q?NBKi7vVfxkjdOm4wXqYSgEQ5BNJoARHIvlg1rYbn0LChU46bPmbKpNf/Il?=
 =?iso-8859-1?Q?w/xe7wkMEzg3U/xPqGjsbXy+mgGkttYGCocx4YO8Q13rEbwuk63uC2zoNo?=
 =?iso-8859-1?Q?LTWu8U4XY9p7foMxkZO9cx0JsVKsesbR5DIa0j0rFh5A9YhZUCyuWIYPjE?=
 =?iso-8859-1?Q?SWtKDBi6I5rXVbQ+rHJ6ztdyg0K5BkCrRz6B4RXIA4j5hAP7Ko4pKK4v6a?=
 =?iso-8859-1?Q?9fgHALx8auua9tekpVafOpCXIg0kr0YhLg5lDIo5yiU1DpHLgWcU+AoNLk?=
 =?iso-8859-1?Q?7vQ1hAynBViGLq9dMODLHAQs2vGXtmqjstTRdsS2/559yV1eiyVO5XCz4S?=
 =?iso-8859-1?Q?syYaiAD8OGnmsnfZv/7uC4ahA17C+V5css7hEG+xFl9Kt+kksEEpGs1Y3M?=
 =?iso-8859-1?Q?v1fOZoxsf0/SGigLCn5RH3SMGqnl1gnbF7YnLJ+8qNnqzxOWv4mPLiKnnt?=
 =?iso-8859-1?Q?GW0OTeJdQfxiB9WhzSv2FVgJBz5n8IRRBqei/lesnr6v8hUtFbRk0eDRxD?=
 =?iso-8859-1?Q?mHNcwZC3R0z/mxExZhekrPDp8NbUpBWn/zPHR9zFx1iFatlw+2aNb1Uy77?=
 =?iso-8859-1?Q?ALvylU3nkzyOYOECUe5EYHUbmCfFRPQdpp49rzpXeX2Igq6/63v5Oo60Zo?=
 =?iso-8859-1?Q?UW/sdZEybpnpteVoUMrFuaJ5sSVkRWmabFgcU3MQvVZ3lG7YQZBkMHFUrv?=
 =?iso-8859-1?Q?QmEblZYLIWKYO0VMwxGNsvWO5WWKu5bSkSzkpz0O81hx/KKB1r8F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb2d0df-b762-4f4d-de82-08dee0f1d8a4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:17:26.3098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBitK7P6S368F4Zih2uycm+/WkhkMwdQa499zGN2aMIFd9GPI/UgnyRYthA/34NioxLWAI23rpqwndilrj+/fVWbHM0Dngczzp3eTcsZKsvn1ea3UyY9UrbNBX7VzOCH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8247

On Sat, Jun 27, 2026 at 02:57:54PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The MCP251xFD CAN controller uses an active-low interrupt line that must be configured as level-triggered, but is configured as edge-triggered (`IRQ_TYPE_EDGE_FALLING`).
> - [Low] The ads7846 touchscreen node uses deprecated properties.
> - [Low] The pinmux `MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22` is configured as a GPIO in `pinctrl_ecspi1` but `GPIO4_IO22` is never used by `ecspi1` or any of its subnodes.
> --
>
> commit bb01573339283cd17f8253331852c339f7a84276
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board
>
> Add device tree support for the Variscite Sonata carrier board with the
> DART-MX8M-MINI system on module. This adds support for peripherals including
> uSD Card, USB, UART, SPI, I2C, RTC, TPM, and CAN interfaces.
>
> Link: https://variscite.com/carrier-boards/sonata-board/
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
> > new file mode 100644
> > index 0000000000000..93b0076987b82
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
> [ ... ]
> > +	/* Resistive touch controller */
> > +	ads7846: touchscreen@0 {
> > +		compatible = "ti,ads7846";
> > +		reg = <0>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_restouch>;
> > +		interrupt-parent = <&gpio1>;
> > +		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> > +		spi-max-frequency = <1500000>;
> > +		pendown-gpio = <&gpio1 3 GPIO_ACTIVE_LOW>;
> > +		ti,x-min = /bits/ 16 <125>;
> > +		ti,x-max = /bits/ 16 <4008>;
> > +		ti,y-min = /bits/ 16 <282>;
> > +		ti,y-max = /bits/ 16 <3864>;
> > +		ti,x-plate-ohms = /bits/ 16 <180>;
> > +		ti,pressure-max = /bits/ 16 <255>;
> > +		ti,debounce-max = /bits/ 16 <10>;
>
> [Severity: Low]
> Are these specific ti,ads7846 properties deprecated in favor of generic
> touchscreen properties? Using the standard generic bindings might avoid
> device tree validation warnings.

Can you check it?  should be simple fix.

>
> > +		ti,debounce-tol = /bits/ 16 <3>;
> > +		ti,debounce-rep = /bits/ 16 <1>;
> > +		ti,settle-delay-usec = /bits/ 16 <150>;
> > +		ti,keep-vref-on;
> > +		wakeup-source;
> > +	};
> > +
> > +	can0: can@1 {
> > +		compatible = "microchip,mcp251xfd";
> > +		reg = <1>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_can>;
> > +		clocks = <&clk40m>;
> > +		interrupt-parent = <&gpio1>;
> > +		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
>
> [Severity: High]
> Does the mcp251xfd CAN controller require a level-triggered interrupt rather
> than edge-triggered? If the device holds the INT pin low while internal
> interrupts are pending, an edge-triggered setup might miss subsequent
> interrupts if the line does not transition high to low again, potentially
> stalling CAN communication.

Most likely correct, please double check it.

>
> [ ... ]
> > +	pinctrl_captouch: captouchgrp {
> > +		fsl,pins = <
> > +			MX8MM_IOMUXC_GPIO1_IO14_GPIO1_IO14		0x16
> > +		>;
> > +	};
> > +
> > +	pinctrl_ecspi1: ecspi1grp {
> > +		fsl,pins = <
> > +			MX8MM_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x13
> > +			MX8MM_IOMUXC_ECSPI1_MOSI_ECSPI1_MOSI		0x13
> > +			MX8MM_IOMUXC_ECSPI1_MISO_ECSPI1_MISO		0x13
> > +			MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9		0x13
> > +			MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12		0x13
> > +			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x13
>
> [Severity: Low]
> Is MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22 used by ecspi1 or its subnodes? It
> appears to be included in the pinctrl_ecspi1 group without being referenced
> by the SPI interface, which could unnecessarily claim the pad or cause
> conflicts.

Can you check it?

Frank
>
> > +		>;
> > +	};
> [ ... ]
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1782571383.git.stefano.r@variscite.com?part=3
