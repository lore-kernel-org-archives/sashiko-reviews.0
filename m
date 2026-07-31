Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011048.outbound.protection.outlook.com [40.107.130.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E195043B48D;
	Fri, 31 Jul 2026 15:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511414; cv=fail; b=F/5U6GV2kM0hnz93KcwPZfRS/LSoYmmBkdvTjSqfxUNwKjF9UjD2KY+7dsGv8H37VAj1RB3mUHDT4AaoObueoCmfvZN8htRK/n+rzf+sg+GFE40MyXmA1GG+dX17qm9AxQpQMhqUf8mMfTN8dYbPNtoa7ANph025JWbO9FdYmps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511414; c=relaxed/simple;
	bh=TYOho9xm4LRemRiNPU7yCLcS+6a/oZScEQEr5BLs9rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t7TxzpxjoMOeOTqP1LiRa4zkFKFuLx1YG/MZrCujoJ337bRG38Q9SPs/50yAMgwhZ11bkavLi5OSsZKT1t7liyIenvjfS/t33OnNrYRy2TK2AoCNUJy7/daEJG9439P3YFA2HYTIQE2Kj7zduqIOczKzbGQ78yKAAVoLLdhZ9OE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HwkE/xXQ; arc=fail smtp.client-ip=40.107.130.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HwkE/xXQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1olyaKWjTpzxx9VUjHo9kvRzZ6xF9docH2scNaTA0+/3LR4Gs6QzDniMLG8l+CZZIREqNKsdJN3UjJiNsGtzHUoNr/WcGdJMgBGyV54MtGVadKsYt+wEofEYutA1s9YHqFnq90McOjkGuQSA8iwKkXT/18u93YqYOQkLFEZXNlhhxpMf+gJz7f97NNylEdugfZKm69827j5x3R9BnY5Z3Dk9JQmsxoP49+RbJNqkr2i/+ftL+z0duu2Ua1sgatE3qzA5fH788+uNEqaq9vongMEjh3jGbnA8ugv6dIfQNFvhts5Ld4CC1kaWHTuyXpOVI6BF6UasGr9pssANThGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUgsr/+nRX+I13wkA27Ws747yd1CmrFcI7yvP+4VQJs=;
 b=SnvVGbDZJGInXVfyUR0WFQjaPO+3u40dDMK9wnVXWU0NZvm+1vZOgaVp/G2FOOsH4hUxGh9gfvfryMSqa/tzSP0UxKUpVO9XGM7ESgL5CDtp1TW004jGQr/eJt9EGbumjqotwPCaJX58U+QQM5wjYQHvZcMvpn2/uteW/RU2JxQz1kCHkm/BptClgJGel5JAgPB+i5TwK0tc2jolh5EFJZ2U7H5GgkKVNhaudJ9me8LYit5JeXpU8/n9UKYlS7EBHOSrYkBwr8zyBwYHVyvP52qIreVdMUhgBFRVJq4hWFhEv6zLy3OhKTvLg5MQbToCSxxFeqvoAA3LwLllvPh8Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUgsr/+nRX+I13wkA27Ws747yd1CmrFcI7yvP+4VQJs=;
 b=HwkE/xXQ1e4beQST1rOr63wcLe1OpaW/OIS/sv4rx62Dw6Ffj8WKkZl9KF0Xrx5+qVStwdS3iNsso/SVwjnEgYVxYklbAaLu9QzxNtwNmW6sFzFOIDqD1bEe5Hw23ZKlLHnHFXQJ34rFr2wX5zFWzKHPqq6pXx+I/Y+nmLNiyf2QeteMWPzRjMzG7guDDzBDAAS97ZS6WW4Y62cmF7RrhE5ky5qNiFBj9OjIuQsZs1O7d4E6lXnkHDgHUAB01Al4aRIyXwY28wVN6SglnXSEP82/gHp1y4Y2qPhuB94cXkHqM0r3KKIanto5k8Pyopzg3/eNVoELgLXRScC3ieiHRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMDPR04MB11582.eurprd04.prod.outlook.com (2603:10a6:20b:71f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 15:23:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 15:23:28 +0000
Date: Fri, 31 Jul 2026 10:23:20 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs
 for Data Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <amy96HmlzdtBz4nl@SMW015318>
References: <20260729214723.557461-1-marex@nabladev.com>
 <20260729214723.557461-7-marex@nabladev.com>
 <20260729221033.3CDB41F000E9@smtp.kernel.org>
 <amtq-Ukw_dyvavxJ@SMW015318>
 <e4f9ef42-d752-4563-a86b-4c62f47e43ac@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4f9ef42-d752-4563-a86b-4c62f47e43ac@nabladev.com>
X-ClientProxiedBy: SN7PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:806:f2::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMDPR04MB11582:EE_
X-MS-Office365-Filtering-Correlation-Id: b8469720-b8b7-4497-1330-08deef17ac0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|6133799003|3023799007|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dM4K/8YvG86usAtOScjY6U6HlbWzPozjLoUjjR0RkAsDvm6uICQPxMErbxnoBRcv7cKleZseW3razjA2/XPz1nVMxLltdIXoeThxnRqe5rBFdI5Qr2jDzUTVWdliVz5trhoit9jq/7ic4oEet/QvWsBOaPX6hdraAYOMQcSEdqVs3MGV7It4cEamXYY9u0lI+soEKV0NEocRokEz6CzkF/ki0pIxjdqB3BhDf8E7k2nsjUFcouwod5jPqM903WbBsCAN1jnDkPPLtM0Du7JfcIkn7cXqhJTqpCDPFnd8793j340xnhiPsNZphVB5HKhMaBs3RpoPbceaA7mfXVcVaq5C6EJyvWUZ8Ilmnb4g+hqencmOQ3DXPAESHzjohCXDrrzDCfBrCDGVfaDfxsKGSWcH71sFdA4yxEHhdGSkKCf55AVPyNsBo4SGllhlCSuMSO4zvf5aW+bwOqiDK8dUueGzmpyFTovJD6BjkGWU8b2qgO0P/V/hq/fvrmBywfNEU7ApjdwrLpgRiCEDGN04EvLBZ9d5x1N4PlGmy7/LAoOU5cN5OroWLmvJ47eoj973/SPKiVgY2+7B0t2xbLyv9K1fBkbcNVCk1G76VA08J1nQxotOnMRRV2yfob0hl4W14VONhYhBOfdFVxpwVMddQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(6133799003)(3023799007)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2wFJmho1KmA+9olQOcZhaGHitGEs4TMdZn3aBdpHP/czeWIhGFsuLSCSHv4j?=
 =?us-ascii?Q?cmwwuTdhz0UrgH9pXLX3j21DAZjE0wCgKFN8bVS5AxsxfHSvA0t8uHIyPcWm?=
 =?us-ascii?Q?9JRA3EpjBi9a3SnywkGn6pXXIMv4SqqQvZN/N4JS9NAjVMcHCyOAtqxj7yBF?=
 =?us-ascii?Q?KJT4lu7bX9W9es+TEDlLMwGiU61rS/EA7hWpSO6+V5qycq7ynbCYOpOTXft4?=
 =?us-ascii?Q?LKeYtEtTVMTAhWB/K4rErPAl7Huux5FEIu+NVskXdMAFFiltIeHDLpjeSR2h?=
 =?us-ascii?Q?nd+lX4nXgImg3bXfmHS0cPoLAivReiKprfrU5gfHKMzTbNZJasNUpCXsPafq?=
 =?us-ascii?Q?kb7C3iJVwyeAoJatRvRTxCs3pOlaa75J0Z0TZ2e5vqchQZ8UhAlQmtlV6wGL?=
 =?us-ascii?Q?vpP8TjL1oJpfeoZzK1w+ETbIEFmdJ5ieO0XZvVnol5SbUXqN5F5m275Lmiru?=
 =?us-ascii?Q?uUkw1nJnVMDf8E6P2GuxOGa1EAB2WvjiaVECJfMz4Z0Dr1hdDXAs0zRCQgbu?=
 =?us-ascii?Q?puNzslnDGPLsEs3rFcQKadKS0r7n6NI+54Ki6qLfl1q7QBHeMPNG4faX5rR7?=
 =?us-ascii?Q?4X5p3g+1yngj2Tu1ZyNP1rJuSDWNfruPoaROlw+K6j5wsGUQiQ6YcV9HlWC1?=
 =?us-ascii?Q?zwbb/txYLRT8+281WSifzonZlivaBd6ZUTr+9kj/2DqLm0q5VdczlkID5aRI?=
 =?us-ascii?Q?0Ngub++7UQAUsN200yBIhHnVrQLEDo2thCHCDX5/4xiCBHQc3cJiaQ8fOLqB?=
 =?us-ascii?Q?I0fd25a12ydVzyToX6pCm/GXF2dC+Q3b4dXsxEc1HgnLHJ2pk45caQM9tJE2?=
 =?us-ascii?Q?LBX20jIkFBljH8ae961dlwm7UK75AwUnxLiQWHW2j/EZkFk36CwlS1QYuV9E?=
 =?us-ascii?Q?2mMKlC6gYE9Ct5FeFKi7aLfirULTXFRpxXchOoMngFgIgHOvSJokekIi2ewc?=
 =?us-ascii?Q?gvptZxYxWiPlkPT+Dxsq7fZdWF5wGNXSGeOVFS2ftQXr1vT7n8432Siq53IK?=
 =?us-ascii?Q?iM9mJWgg1Q/vcfURcreTaqqn/rj5cpQX8qANDkE9o8Zz11ipEwIMW0jTk0q9?=
 =?us-ascii?Q?he/fYJePj31rqEvsHDThf7NUCRsLSz6d4zQn4s9gCpLnhPlw7UDo6ocaF4p3?=
 =?us-ascii?Q?V0+Onxqp1LlT5Zen+BH68BGzNa/ht8FHyB2R5wM/sMmGNylb058eWtqygJyU?=
 =?us-ascii?Q?xDQugjytLYkV8R3A6ts367vKFQiGkYxtTz5JyLfpkzmnRE6TaLdIVz++ugvu?=
 =?us-ascii?Q?DBlEL49kydOct6EhWBJQbyPIhYZXdMOXODNMQckqU31mgJPfWkv8aPYc1NNa?=
 =?us-ascii?Q?OJ15TsObrT2VaDflql4GxPLsSj3WkOZQ0rKpXscvznuOrylFtfTN5qdXqykw?=
 =?us-ascii?Q?yWMWoxZSX0CPNu4CZhBzDAqHEWFd/UNDufsxmuBpPt+vFkmZsDh3Mmsg4SZk?=
 =?us-ascii?Q?1wXm4Y65NC1qsGkjQROgfHgLEeapfQZzDgeZ8bIk1uT0RKt3yYPpcNbd0gXU?=
 =?us-ascii?Q?0n2VJ0ORS3FAhJ+rElkVR0Ab+GaPA9IjOrKR7E0RO70gqhkIHjOaxndLqXjn?=
 =?us-ascii?Q?DnJ7AYU480y8WOJxm0wQ7nT1I++31Qisv1venWmsyEGlM7ihgPRfJ5DuRn+c?=
 =?us-ascii?Q?6ArOKP7LJyVISM4w4IgoLmmYW0jMkE14G/hkjzbztbLm8TPd+PgYq1zmagRF?=
 =?us-ascii?Q?roowxaWCWSmy26G9juO1CDwHNasmeucj0Ta/hRCIQguCEpNULOtuAq54+sZ9?=
 =?us-ascii?Q?kqE4oRqYWpdLbPKN9S2b/U2Tw9Ef1Cq8AOj9rJxicEqsK8bD31MT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8469720-b8b7-4497-1330-08deef17ac0a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 15:23:28.4778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fz8P9AxJGx0H0Coxy8ppc0XjD/e5j3kkxhk/ODxSLxGNHCZiLm5Hyw+IoS1hpsllD21RnVdHZ6g0jMewzjhFLxRt4tf6+LgIUHFSNhlBBppYI+TBWS8DdarpMvKw0OqX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11582

On Thu, Jul 30, 2026 at 09:34:43PM +0200, Marek Vasut wrote:
> On 7/30/26 5:17 PM, Frank Li wrote:
>
> Hello Frank,
>
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
> > > [ ... ]
> > > > +	gpio_feature: io-expander@20 {
> > > > +		compatible = "nxp,pca9554";
> > > > +		reg = <0x20>;
> > > > +		#gpio-cells = <2>;
> > > > +		gpio-controller;
> > > > +		#interrupt-cells = <2>;
> > > > +		interrupt-controller;
> > > > +		interrupt-parent = <&gpio5>;
> > > > +		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> > >
> > > [Severity: High]
> > > Does this interrupt routing conflict on the i.MX8MP baseboard?
> > >
> > > The shared overlay hardcodes the PCA9554 interrupt to GPIO5_IO04, which is
> > > correct for i.MX8MM. However, on i.MX8MP, this pad (SPDIF_RX) is physically
> > > routed and configured for CAN1_RX.
> > >
> > > Could this cause the GPIO expander interrupts to fail and CAN traffic to
> > > trigger spurious GPIO interrupts when loaded on the i.MX8MP? Would it be
> > > better to override this interrupt in the i.MX8MP overlay?
> >
> > Yes, I check flexcan1 use this pad at i.MX8MP. you need disable flexcan1
> > at i.mx8mp's dtso file.
>
> I'll fix that in V8.
>
> [...]
>
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> > > [ ... ]
> > > > +	sai5clk: clock-controller@30050000 {	/* SAI5 */
> > > > +		compatible = "fsl,imx8mm-sai-clock", "fsl,imx8mq-sai-clock";
> > > > +		reg = <0x30050000 0x10000>;
> > >
> > > [Severity: High]
> > > Can this cause a devres memory region conflict during driver probe?
> > >
> > > This overlay adds a new clock-controller node with the exact same unit address
> > > and register range as the existing sai@30050000 audio node.
> > >
> > > Since both drivers will use devm_platform_ioremap_resource() to request the
> > > region exclusively, whichever probes second might receive -EBUSY and fail.
> >
> > at imx8mm.dts, 30050000 is SAI5, here you change to to use clock-controller
> >
> > Suppose address here is wrong.
> This is correct and we already discussed this in V4, the SAI here is not
> used as an audio controller (not using sound/soc/fsl/fsl_sai.c driver), but
> as a clock controller (yes using drivers/clk/clk-fsl-sai.c driver), the
> bindings differ, hence this node.

Thanks, I forget it. Now, may not allow this method. The same hardware
have to use one compatible string.

Frank

