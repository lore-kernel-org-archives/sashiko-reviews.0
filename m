Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1FC32B116;
	Thu, 30 Jul 2026 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424645; cv=fail; b=B5EZdWC6gKl6HkiVnKvIZIBhNtiLHF/W6OzO11QEjPI5NumhRjRu3DZZfSBHLbMUxrNTedLE9qxsG+LlfnXN9mSXFMjye6y4bJsbbO3H5aniJ/y6T/lYPHobBodepqJvId+atCBswEi+8hv1Kb8l9fxYx7BIJEwY+V6ctg3ltQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424645; c=relaxed/simple;
	bh=zAWS99A2E7Qw923z0LADnvwllimPhm+XvjKr7naUTVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KuOwvazgB6ofZvTNxxlSO75G7GqRiIyExbX9X8Fc7uRuPu5bGuhF3gYnIhmncTI/vxu8KLAzPY98RA3ekQ1tBCcaTcBVOomFBh4Ud7oWHGKdNTvz6OxLkP2Tb3ILMO6PlvD3WxEMFUbj0iTBVBJ+m62D1clsRFZpSrXIpqhlXVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NY2FzB7W reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NY2FzB7W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBh55filxUcOSOsZWrrJOiBVhaZNPDzHN9nkhvXmqo+JTDyqQXP7mj3kxgIVZWERyuO0IuAuYGKd4UGOkqb8D54yvI4TXndslymd/fxkRumU35Wai0LJBVr2qDePOcd029m+gyeraw1JLWKIWkQpHDTTE4vwA8LTTnGFsTxPgqs/KN8nlKPfdpo0y5Xlxk8DxvoJcm0pcZ9wSuXbVg/l3asKkNPxJb7l6fPVVaBSje0bjoiRGTtioYaVwhnWMAguPJZHYGrfqBoOO5MtYPptx10i1BDX4GJPMYrbUwEnwCjbxEEYgRR0eoxiKd5ngqBwxWBeXktd4Iy9gTdhNg0Iqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YytIxRgjvS4fN9e14K0N2tOL6yi1VuZfLPZePPR+KQQ=;
 b=fxFtWlZfJQ6pNdZRzj+bXKHlWVj9WEKDeDIWKZBueyqVoihE6AvfvrOc4En95SLgD7xbe39uxZP6Ntn3UZXRMqX40KwI3BRxRiW3KuvGx65OLed2UP5tYaDCJdtWXYNZLGwNw8IPHTwFUfZ1BY9lSifywnsDXkOZ8IeXUPKzCoqK7IdsjE37sprhnihZSRLrJeI5NewgpkKcdL0AHoB5TzHEgcLjWF/7fzUP64Q5oCnb7fp/7o2Gi1XE63HW+T7ZUzgaQecu35jc7JSscF5hRy7pc3jkU0knb44k3rJTuCo2ZzxSyaiV51XUe1duQzyohPc9h0WQLrpe2+BXtzJB7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YytIxRgjvS4fN9e14K0N2tOL6yi1VuZfLPZePPR+KQQ=;
 b=NY2FzB7W52YQxBZi0T9rtvaWSoKqhjS1StsmWJ8n10Vqbp7Q/+CQnRDjX4iij8jZ3fZJ3ilFFmX9UqtVpmyAEiyE+NG9XRjC96WspoN8xs4/97K+zwnrqstdL3u3y1BZxz67rjTTgP4jMmhIL2cQh27kHy5+BaDru401ElF090IdkoP6ezmezZ/m4QFJaQf9FaNXlQeSvCPDzwOh236mu9s/lj3JHaF1VQFwt4xJE+R/OuLDr9FGvqu8yw+H3156L0NN73qW/Ilx3yO5MqxrNGTxYZppsTtrslREIvMp38kLt9bLP1+z0gFP75yWoR9MUP5hrLZeZ1ie7/KTrop/aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7634.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 15:17:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 15:17:20 +0000
Date: Thu, 30 Jul 2026 10:17:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marek Vasut <marex@nabladev.com>, Frank.Li@kernel.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs
 for Data Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <amtq-Ukw_dyvavxJ@SMW015318>
References: <20260729214723.557461-1-marex@nabladev.com>
 <20260729214723.557461-7-marex@nabladev.com>
 <20260729221033.3CDB41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729221033.3CDB41F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH8PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:510:23c::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: c68b2b61-6323-4491-199b-08deee4da611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|23010399003|10067099003|4143699003|11063799006|6133799003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/607XjbKbYiTH2BPV9CDlANNjzlPIi2sCduTvqcKutRgeARMv5sOEWDwgXqNKHpBoBYY9av1kEF1FrGaYvnilE9x7mmQCiokjomBd1wjAiKmJ8Z9pyD+I+zToaPaqr/CEPb8xw848a4+DMEeLnvzQwlq3WcYgbLOJH2KoqbSeY8een7XFn/HEQ/nvPOXp1cFKyZPbxqQi5rSGJMUmpge3zvPiJOWhGh/uh9I/+xca7F1/DVnDGcp90s/N+GxWarCUEC+Ou2BW2a4DVos0YQCxjLXJ+bDhEJBhnzj15pBcwDitkZt1trITN5vNBa3Gu3pmpj3MGQ7xSfY71A2ZpjmgoDU5inTuLPet0sLIz240/OQWfrzNBna3IwtJL0UzYp3SFnGSPGpHbVDd6D+RP2gF09AF8PgaHJ1wphrGcftHnBuOu2brYZTtogEZocWj7mQD5F53Vy3iJR0K5tMeCkO1YNUnRJqVk7c/P6TpdIgV+p0VaU6hLiT5Jnr8eqlP6dvv15XOuxbyl2hD9cvThNwU4JPEwmsxJc0i1FqwQXpbjFyiU6hSqaN9ao/E5opCrYNzzXY86UKnvAWtAXumgGmiutxerYTJGABMReMMKno8NQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(6133799003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?TKOVftDtZ7u82ug1x70b9+ULdvbJv180FqsqP/13NWLBJh5eE5qT3ugUdy?=
 =?iso-8859-1?Q?t4SBpKrEBpjavr+1zxzT4HQCyOasXcY1un6j6QbBob9TD18P5KBSzRf9NF?=
 =?iso-8859-1?Q?dxnb9fHQLt4tmS5+Qor1/Ppa+CiE8JrwerdAV3VzqoYSUhDfZre5Aoa2yp?=
 =?iso-8859-1?Q?Pwo/uebzq6tGo51L23vk2XtuVtW4MTUDubEOOpQ5TMvMNEabhfB9Gm2NI0?=
 =?iso-8859-1?Q?j3hM3iSAMbwlLXZv4TR3KB1UirvnxssLZO2nbN9ag4OSwLY4euCQ2rcaQM?=
 =?iso-8859-1?Q?CltRZU9dNDrn2jO66PItUq3RAQG7QphtoPhqmOtM8X23qa/SS1ivG82UvX?=
 =?iso-8859-1?Q?ihNKsYFaDivYfu+XvMA1HJeTFigLF10iiTWh21wBZtU1+eO0gZYF1HzGaK?=
 =?iso-8859-1?Q?xJZMskZzfk447Hm2Bv7lPg75jzgqbT0jFfXLxptoilAdCmC+qycZ1j2w5C?=
 =?iso-8859-1?Q?Z/M14jzLgXJo5g3mG1+41WzzCPgJqKwfULwMcOQKJBRO4LFmY4jEc14H0W?=
 =?iso-8859-1?Q?CftnKr0jMx34tPg8uynRInaGIrgVHXMxXakgQMArSux3dcGia+fcQum6Fd?=
 =?iso-8859-1?Q?birdmE2ziWgg6xWUfO+IhVp8/wJ3XAj+OJz+Fovx6WM31F877inXY3tjan?=
 =?iso-8859-1?Q?jN81h3fwzt9/rZmsQxRNN0R1IvrYxxqgzEp9AabzO11x0gJt9eeDsZbWQu?=
 =?iso-8859-1?Q?pSJf3T9X9BhuEUrhcSOw6oXM3CoplfrABxFtOqAuv7QHF8ONLG2j89AmwB?=
 =?iso-8859-1?Q?4cmudy+VAnfQpSSC5L2zjYg3V1N13Q5kVOLN9gQ44IqbI//TxXawFEWJfp?=
 =?iso-8859-1?Q?2fp9DEikVaQU1x91fB/oD9Wg5X1Cn6FDtNTfyyS1B7QLGYp3uD7EHKSDjg?=
 =?iso-8859-1?Q?PbhAC/KqhKdX+CUemzYKf840Z7NhyjM1Hu3zaKtCzx1ZvACykovD7ZEpCa?=
 =?iso-8859-1?Q?QUPKxiF2v/Qc8R2VU1mLuV7KJpyFgbK+rVUvReYAE7xX0mtQ/DyHHMuLR7?=
 =?iso-8859-1?Q?iymUxgoB2N0Qx9jFaUnoeRh3z2xLcvSqNoMsC2ZQSeeemwvTfgGzjC0vxn?=
 =?iso-8859-1?Q?l2AeyGM8y6MQ+yotq4coz9dK01O+lWZ8E9zzLI0VE5t1Bzq7X5Er7EjDAj?=
 =?iso-8859-1?Q?vvE59gcqIdFd3CNN0GxsdNjDVLBWDsQHDGzq8oAdZaNsLSOGG2o32Y1gVs?=
 =?iso-8859-1?Q?TRRfbpvkcSy1C4bfgjoTnIRkkAiTGOEf2c7fWdcFiIEp0ent/A4dzjYtti?=
 =?iso-8859-1?Q?Ve2h9u3jRgIbdeu/mRPgBQlSGl4TgAsLzHqV2GUYPuGwVZIrQXX++M+sCT?=
 =?iso-8859-1?Q?ZWO2MVWSD8sql6XYPwq98jedSiYocKwovNvnnlc4pfduBBS+6zPsmfa6Ky?=
 =?iso-8859-1?Q?su2MwTcK6ZgXF+Lg43fyEMobjFKwpkBZZcgTMDICplXa8ES0H2yrsMossJ?=
 =?iso-8859-1?Q?wEjR/Tl1pUYnWPtTp6aSoRLIsdVD+mzJYju7t1VdejoSlb60flU+RVvwLP?=
 =?iso-8859-1?Q?H+fCVuDXgjYIMCiCUyE0r3qLOCp653F8kyC7Ute+4LUhJ187ZjzynLlx+C?=
 =?iso-8859-1?Q?Z1uvwl6uAm1iRaZkC4n9o4hj3ksEptguOlslLQ6VxHyuzqLiP4QZubPpaY?=
 =?iso-8859-1?Q?3TnJP2ZkXWEOXUInEzraZVokL2aalEHb+aG7cXre5AZXS8S1yrmxrUDlRT?=
 =?iso-8859-1?Q?yzx8m5+GAozrAfpvwyU0Acjl5Q7GQK8l3ysk2wjeQAoR8gLilByZti2lCg?=
 =?iso-8859-1?Q?9nxwIjYDWGln4AiqcBJFjeH0fDrUCYP51HdXGIf7D7KVRYTPlJvs860RLF?=
 =?iso-8859-1?Q?Ts8iwtSawkKwN3OJ9sBetCBGLoC0EcmBEjsYlH+s9Ljx5o6or5PW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68b2b61-6323-4491-199b-08deee4da611
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 15:17:20.2539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zk0LeV8KWlXBiMfCZIytux7bA2ABXb+hplChYtivYPdUG0MhvCfzsELHcZDiC+0XQdFxeEhjZE1TqIdFbg6yD1JJJX/2TFqxd15J2o0Gpz34nca/4zKy+pxtyC/BwpZ3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7634

On Wed, Jul 29, 2026 at 10:10:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Hardware Interrupt Routing Mismatch causes PCA9554 GPIO expander to conflict with CAN1 on i.MX8MP.
> - [High] The `fsl,sai-asynchronous` property breaks audio capture (and playback) on both i.MX8MM and i.MX8MP due to missing clock routing.
> - [High] The i.MX8MP overlay fails to configure the clock parent and rate for `sai5clk`, resulting in an invalid MCLK for the SGTL5000 codec.
> - [High] Duplicate `unique_unit_address` causes devres memory region conflict between `sai5clk` and `sai5` drivers.
> - [High] The shared `.dtsi` unconditionally disables `uart4`, breaking onboard Bluetooth on the i.MX8MP SBC.
> - [Low] Commit message inaccurately claims the overlay provides a "PWM Beeper" and "additional UARTs".
> --
>
> --- Patch [7]: [PATCH v7 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC ---
> commit 43246870359af0cd7d3d40f8db5eaaff8fad43a1
> Author: Marek Vasut <marex@nabladev.com>
>
> arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>
> Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1-Audio
> providing additional UARTs, CAN, PWM Beeper, I2C, SPI, GPIO breakout and
> SGTL5000 codec. This adapter can be optionally populated onto the eDM SBC.
>
> > Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1-Audio
> > providing additional UARTs, CAN, PWM Beeper, I2C, SPI, GPIO breakout and
> > SGTL5000 codec.
>
> [Severity: Low]
> Is this description accurate? The commit message mentions a PWM Beeper and
> additional UARTs, but the code below disables uart4 and repurposes the
> SPDIF_TX pin used for the beeper as a GPIO instead.
>
> [ ... ]
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
> > new file mode 100644
> > index 0000000000000..01cf5c89dbff4
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
> [Severity: High]
> Does this interrupt routing conflict on the i.MX8MP baseboard?
>
> The shared overlay hardcodes the PCA9554 interrupt to GPIO5_IO04, which is
> correct for i.MX8MM. However, on i.MX8MP, this pad (SPDIF_RX) is physically
> routed and configured for CAN1_RX.
>
> Could this cause the GPIO expander interrupts to fail and CAN traffic to
> trigger spurious GPIO interrupts when loaded on the i.MX8MP? Would it be
> better to override this interrupt in the i.MX8MP overlay?

Yes, I check flexcan1 use this pad at i.MX8MP. you need disable flexcan1
at i.mx8mp's dtso file.

>
> [ ... ]
> > +&sai2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_sai2>;
> > +	assigned-clock-rates = <24576000>;
> > +	fsl,sai-asynchronous;
>
> [Severity: High]
> Could this fsl,sai-asynchronous property break audio capture?
>
> It forces the SAI block to use independent clocks for TX and RX. However, the
> pinmux routing on i.MX8MM only provides RX_BCLK and TX_SYNC, meaning RX
> lacks a SYNC clock. On i.MX8MP, only TX clocks are routed, leaving RX without
> both BCLK and SYNC clocks.
>
> [ ... ]
> > +/* UART4 is blocked by RDC and used as CM4 console UART */
> > +&uart4 {	/* UART to 1-Wire J5 */
> > +	status = "disabled";
> > +};
>
> [Severity: High]
> Will disabling uart4 here break the onboard Bluetooth on the i.MX8MP SBC?
>
> This file is shared between the i.MX8MM and i.MX8MP overlays, but on the
> i.MX8MP SBC, uart4 is actively used for the infineon,cyw55572-bt module.
>
> [ ... ]
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> > new file mode 100644
> > index 0000000000000..4a02bd026ac16
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> [ ... ]
> > +	sai5clk: clock-controller@30050000 {	/* SAI5 */
> > +		compatible = "fsl,imx8mm-sai-clock", "fsl,imx8mq-sai-clock";
> > +		reg = <0x30050000 0x10000>;
>
> [Severity: High]
> Can this cause a devres memory region conflict during driver probe?
>
> This overlay adds a new clock-controller node with the exact same unit address
> and register range as the existing sai@30050000 audio node.
>
> Since both drivers will use devm_platform_ioremap_resource() to request the
> region exclusively, whichever probes second might receive -EBUSY and fail.

at imx8mm.dts, 30050000 is SAI5, here you change to to use clock-controller

Suppose address here is wrong.

Frank

>
> [ ... ]
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> > new file mode 100644
> > index 0000000000000..90c2dd1e67248
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> [ ... ]
> > +	sai5clk: clock-controller@30c50000 {
> > +		compatible = "fsl,imx8mp-sai-clock", "fsl,imx8mq-sai-clock";
> > +		reg = <0x30c50000 0x10000>;
>
> [Severity: High]
> Similar to the i.MX8MM overlay, can this cause a memory region conflict with
> the existing sai@30c50000 audio node?
>
> [ ... ]
> > +		#clock-cells = <1>;
> > +		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
> > +			 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>;
> > +		clock-names = "bus", "mclk1";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_codec_mclk>;
> > +		status = "okay";
> > +	};
> > +};
>
> [Severity: High]
> Does this node also need assigned-clocks and assigned-clock-rates configured?
>
> Unlike the i.MX8MM variant, this node leaves the MCLK unconfigured. The
> SGTL5000 driver and simple-audio-card do not dynamically set this clock rate
> via clk_set_rate() unless mclk-fs is defined.
>
> Could this leave the clock at 0 Hz and prevent the codec from functioning on
> the i.MX8MP?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729214723.557461-1-marex@nabladev.com?part=7
