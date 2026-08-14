Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C97F3822B7;
	Fri, 14 Aug 2026 16:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786724474; cv=fail; b=XNAYrVPw8342Ij3BnaTbo0ziAduKA3Ivjp4jlqbu639S5oCtw8WFc1okm5KeIVID3G0nQ516LqK1vTQ1BV2IK+gQrQfD/ZD2oJDnfKMOdVguwuatiQBbUS/MYuaQzGFheIOyPkhiSAO8t29LbTutj/spCQGCLaIA6ZrTq4DSmZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786724474; c=relaxed/simple;
	bh=V8CmgEnYTLicUVJ9ysnr/IRoxWV81QdwfbgZ2RxofXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Awmkm6pNzLJ+I7lc2sTkcjqn7nqLIL5ALQk80FmMHN4W0I5oLhS9q2EBg+g4HBxsTsoSiZ2hSkI1mkP0IGsZ2uJKkWPtdlZzPnlQisdgz6bxqCOhiesU568KbWipzshzBjPcjLMPDanBV77moPE8Nk8Yhubd78hiU8pR3hOVMWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AvuPUwzC reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AvuPUwzC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIlSofC0z6Uo6zSGIjS2UzWl9FpWyVfCH+nFgJ1eGG8jKfiM3YSVEfjmobDJi3DKQEze6M6GYXskugofi12VXYg11B7ehkVhjDtntjnTCQAkh9IvB1rniHVkncEBNvRL2JscGX4HR+f3s6pO5lyxx/nj9dzOf+AqQxlKvgGQBCXx7Ef+c/BpJgkrH3yBVlsUn17w5+95KPbWG9hE/bE196TQCYFBbUOpDKGnTgFbGFY+QJDk/lwNb41BcuzWu2dcK8xUeDk08NgknKaK9SV03CKF8hAxFWsvYnlIB22WUKO5H61YNg5Z2RHDwYJMByHqzvSF0BgvPyfsyLqeO/5oUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUfUNBrm1Kzmh6DxOw6ARCPQY26rS2s468WIwSobPIQ=;
 b=K2UVlHlIZL3n+WCtSwm7pjZr9Mq0CqiOYVAuxF3cHXUzfOCcGH61wu/jBckXzFXktbIl/MlZRN3whf5YOCMl04iKJXwigEqqb6GrWV+8uDVoDe9EwGqjM7KL/L8QKRbwFMWpA+igHt6DmqHkaaE438TbkHrYfgFPKoFFyCBtSXDWuU/qE/SeLwPUbC5wGhqUX3HSygxSEz6BJWGW2Hcaws0znvbjSb39TT8aEn0R97vXF0mDb6MMJNDMk18rI3IAjVAxCvxsp1oyAuPRWdOqWI4UC0204jNh8XoIdxip8cIR47yS2kxJCDuVuf8nJcA5tYMxW8oIhfmjnBuhhPuReA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUfUNBrm1Kzmh6DxOw6ARCPQY26rS2s468WIwSobPIQ=;
 b=AvuPUwzCIcg3IA0agfXHc0zcHX7AOU15VeVRrLBRFdtz09QfWNOtAKjrJkv1m2iapopczCMhzwIlqRAfZhqp2on+Eb+34epgtaikXQfQ39Gzdmr4dELqjkEP4rn8X3QGSI79R3yJKalORA/M/pw9hFcKaIuROBIj6yLmuSAiPa72K71JPRUicfo05yyBQPJpMUgKaF2MHhH+qWTuxmm+gwv2rcZLD3BTJbfOE6A1TlvUF289CkGeeGM/9j6RNhYI+nqEGmSFRlIMZmpORjtZL96tdmGcmdLyGWmd95HldMNl1RmwGGj6h7cUPol9CL2yZ3JA78jsi0wHSQGzsNNPhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by AMBPR04MB857968.eurprd04.prod.outlook.com (2603:10a6:20b:799::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 16:21:09 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 16:21:09 +0000
Date: Fri, 14 Aug 2026 11:20:56 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Chancel Liu <chancel.liu@oss.nxp.com>, Frank.Li@kernel.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 03/17] arm64: dts: imx91-11x11-evk: Add pinmux and mark
 conflicting devices for MQS1
Message-ID: <an9AaDX1EnCDVMRw@SMW015318>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
 <20260814072022.4064009-4-chancel.liu@oss.nxp.com>
 <20260814073138.27F5B1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260814073138.27F5B1F00A3A@smtp.kernel.org>
X-ClientProxiedBy: PH7P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::22) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|AMBPR04MB857968:EE_
X-MS-Office365-Filtering-Correlation-Id: 5654076d-00b2-40cd-705b-08defa200c8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|22082099003|18002099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	7iGZ/VbOpCbnM0MNO4fmTbdmXKXpuIi6YZccTJHwT/Fmwapso7EZgpMr1mi71Sn0yUwQV66UTptimyzcbyHLi8Vk03bFAA/EoV0c2m4mpDrny/xYINV+cZfhdKpv8kfyVM0wh2aI0l5dDUYQG4sbxvJp+iMnWapMm23qSGD1LldUuHwli9VrlXBHpMvOgQFCmOiiZAPmICowVcWNge2fS/RlFK6LYsBg4q6SqjMHHJe5sYdT4gLVwS/Y0KxmiTsvVC/WSr3nbnGAaaWVI6ebB7Q7i1utHZbZamtYa/wZSLTtj9x1VzAMSQlxf9QNFPl0EIbdjZBiKFdA47uHYDc6TIwTu5nbxAjtbuW9HtMlw7jOnMX7McoqOE6LQlOsBulvgeYWabwlvM/Z22jW9quqG31VcssNcMN/aLIPpI/p8yonYEde6bqooWDY+OKsz30tg1Zt6/6y3Otj3cyfhcq7JloOzYhKtI70gniZnRJqI3xFPadZXDhtPSQSQihVnXISZeCPM2VBIj1L5mxjjOqQbfRGKd0N8gZpBstejO3RMBXZUwfsz07PqwwL2i/NcOOl0uJhbMzNX6KRQSazU6XYBuCpljz/LeAjlhi3KExQ31c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?T1KE07OqFVfN5opt2fFRMkgaKLGW7b1OcGV15LjznSVlKWUpKtnwAtWsdd?=
 =?iso-8859-1?Q?BhTraJ3xsCokHYmBsMWstGgTsn63RUyDZYkzIrTLKOy4THgcxuwGaFTBXf?=
 =?iso-8859-1?Q?S2DFNEjiFgkiC9zNZ0ew+kxLU8FyZ8VKs6VAKCzCDB6bO7lghO80+TV10y?=
 =?iso-8859-1?Q?PPuL9vFCaWYBwbJrRY5WbBNXy38qrl5eknpQps8tFUyYaqC14Dz0gK0DCb?=
 =?iso-8859-1?Q?vTkMxKogt9GLxCj1g5L4vRBtBfYY0noHZdjITqMBgch8Wl9pK+Soxq4dek?=
 =?iso-8859-1?Q?C6bGIttSfem5LcXNDJjhAk5XLO755QhPhdVrxZHK6QhvDe55JVjYMYBMVI?=
 =?iso-8859-1?Q?6OCOvwGqyqM8G3MQlHtO9xOFslvuqey+CXTvhFiUolJZ0pJgjLFK9wHXZE?=
 =?iso-8859-1?Q?cGXMVaGqPGyGmUhvy+CIEMBFJP/zJU03eNQ/286juuF/oz3Vzqi5g/LJWS?=
 =?iso-8859-1?Q?wgsC0cq/p2+qUXeOB7POHLDOJMJaMPSfRpDok+pO0IyY3fVDy33+UzzbGe?=
 =?iso-8859-1?Q?jCbXUVrP6lIxC8VraRfCpqmhym40vvmWr5/YJYxzepHf0rQaQblmrZCcFj?=
 =?iso-8859-1?Q?1X5aiaSVJ2dQE43dCCR3afyKV+937Ltri8baY+lqyYMjqDpvcC2eJZS6L3?=
 =?iso-8859-1?Q?aVj7bZ4R2ZJ9UqL1QycWi1kVWyDYzNgmlHreAeyxK9av5RdDtshKoVGtg5?=
 =?iso-8859-1?Q?7HS8UnxoF7B469hVFJnT5Qm+L7swz2rSW+IxIaCzzMWd1G5NGXQYWtvzmw?=
 =?iso-8859-1?Q?9GecNOA1xJlltreSxovLgajVEWjVyCMY7cBZdPahmihoL5TDHEDMHitacs?=
 =?iso-8859-1?Q?z+gYWlC2evhn3YTlob+a7S4bzfQibk3Tk6SvhIK+6bCYt71G0JX48kG1Bc?=
 =?iso-8859-1?Q?ADSfjsXF24TtSFxs8ZVqHDA1Seikdyf8uH/875BarEUOF8ZAu3bmV1+kdT?=
 =?iso-8859-1?Q?d0Gi7RrmjxzYzNvsE/08PPAwcrnm4PmKbwpIketvd5GNxYYQn1KTQq8hAe?=
 =?iso-8859-1?Q?arghVu7/2aHYCSWdMPQYHhbErDy+YFZdOv439+FuoziE6tSDAGm33tuiyW?=
 =?iso-8859-1?Q?0OXv+V+oX/vKqYDNgn9h900qrcjNSrZS/SFlnQA5kRm6pP9D4zM2+fTUBq?=
 =?iso-8859-1?Q?ZiIUE1ONCx/hA4e8QNYqDOIoBBHGleUNqktRQmbLZccUVD7mNYpNGwCyFr?=
 =?iso-8859-1?Q?zCKO802mxcFCE0xrST9tESqOu0yIlZmz+4aTn2vN1l+O9XHicXkkpFzraF?=
 =?iso-8859-1?Q?vCVKw8A0OY4XRnhRLOpGcm6q9A9j/iCDTXskiUGKA5O79nGD0XPoWvyYWa?=
 =?iso-8859-1?Q?BVOiAkYBtefPcQS6B6ArEu2X5BNdzLN6LcUJe45Fz9knoWccDza3h624W8?=
 =?iso-8859-1?Q?SzRalOczfXvciPlA0ehdPonCCUF+Lr391M8S78OKagZwvebFzMsLmoyrTV?=
 =?iso-8859-1?Q?u2iIRrtiH4ydJAOvRhcXzGjdjcWKMYhPtyG3T+H+hUnr/j7qshy+yD5SIH?=
 =?iso-8859-1?Q?k8IAixfh13GmDMgA4VRfxxtbopxLph2Nx6VvoyU4Ln3Qp4XnzHxR0t3dzb?=
 =?iso-8859-1?Q?3aExii8NICUxPYl4CJrTdlZT/QKCBniXsSwXhdHDDEQGRC8G4cwrTCRvRZ?=
 =?iso-8859-1?Q?SymB6iXMbRn3BMmTBQZHqS+sxBxEwWRY2fyLRn5FoX8pZ4BS5wx2/+AJiH?=
 =?iso-8859-1?Q?uIaaENnzQ6XWeg9c2awvULKL26ztutQxVIU9IXLD6uozn9KkWc/DCpsktv?=
 =?iso-8859-1?Q?yXSwtsi6Cy4KRZVJIyXhE/h/RKNVeyXvAVQBwk+7aXtE7WpbicKgMGfaar?=
 =?iso-8859-1?Q?o6ehWBvQUa9lccbpyfkZNovkfKinfkJ4QjNJu5RX8Co1HLxRqtFp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5654076d-00b2-40cd-705b-08defa200c8c
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 16:21:09.2200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyFrwVbB5Fw9JV6RkyPe+oEONf7p8whkT7YthmFPxueXECUqp0GzBj90k/+26/Xn+43dO9UdRrayMY3Icg2oJEhMpXYI4ikCJQHBCR3nG9l57k+aNgPMmC3qnuB6ku6o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB857968

On Fri, Aug 14, 2026 at 07:31:37AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Undocumented modification of the '&sai1' node's clock properties.
> --
>
> --- Patch [3]: [PATCH 03/17] arm64: dts: imx91-11x11-evk: Add pinmux and mark conflicting devices for MQS1 ---
> commit 2ae9b14f843efe8a48368cba7c61c4f11632f83b
> Author: Chancel Liu <chancel.liu@nxp.com>
> arm64: dts: imx91-11x11-evk: Add pinmux and mark conflicting devices for MQS1
>
> This patch adds the MQS1 pinctrl group and labels the conflicting sound card
> and micfil devices for the imx91-11x11-evk device tree. This allows the shared
> imx9-mqs overlay to disable these conflicting devices.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> > index 4d1ada6a3942b..4a3dfafae3773 100644
> > --- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
>
> [ ... ]
>
> > @@ -511,10 +511,19 @@ &micfil {
> >  	status = "okay";
> >  };
> >
> > +&mqs1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_fun>;
> > +};
> > +
> >  &sai1 {
> >  	pinctrl-names = "default", "sleep";
> >  	pinctrl-0 = <&pinctrl_sai1>;
> >  	pinctrl-1 = <&pinctrl_sai1_sleep>;
> > +	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
> > +		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
> > +		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
> > +	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
>
> [Severity: Medium]
> The commit message mentions adding the MQS1 pinctrl group and labeling
> conflicting devices, but doesn't mention modifying the &sai1 node's clock
> properties. Is this change to the clocks and clock-names intentional for this
> patch, or was it included by mistake?
>
> If it is intended, could the commit message be updated to explain why the
> pll8k clock is being added to the active SAI1 node here?

Make sense, please update commit message

Frank
>
> >  	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> >  	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> >  	assigned-clock-rates = <12288000>;
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260814072022.4064009-1-chancel.liu@oss.nxp.com?part=3
