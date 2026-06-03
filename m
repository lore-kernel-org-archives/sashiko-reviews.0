Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888DF3783BB;
	Wed,  3 Jun 2026 17:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780507998; cv=fail; b=WHG4sM5CV6wie39ga+LJMhl+2r/Gr0FcK+8SkwsSwHDaDHE6DWhpGmNf/Vseub99gwkrHH8SNCQaOZYFXbGhvzzJ3TCBh4sAlSaQUSYT6tB84ZTGcGgTb043ZvmHn9VSR7IyQKeDsPeNSGCvmmUXmm8gYMxATcdwBWcCwrc9vcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780507998; c=relaxed/simple;
	bh=F7l/fOOU2Ne6+3JeHbvyZiZcpkjnMwZsIJ9KQP8dabs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DuPQuwoTNIYgslETa9dNLuGKi0IeeT0knhdkjNMXPUTO7nYib1+oy1OYSt+CKyn1eyjMm2pRpROvUCRTgn2Gl+a6/0jnGj0ReE11wQApxVfb94GMuK46jT/GrtPg+PGFqdMd96/Aky7mdvx15GD5Rpzo1DMRFUgSSNFR18khqvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BvqGGvui reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BvqGGvui"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IT6joSOPybenC1Sb90xJL8/ak6hRWTNb6pDb+NO05icFxGbgTrnyfsGy0VEoPK3mS6J0QPfbC7UuMGoLsvsDB4pVboN4Jtq77A5NQ6ehmMQudj6xjAtczDcaki+vmvlcXVVOrAYkYL9LHvM4u+rOKAta05y+tBUgscgo+vyzPzHiV7ocviqXZzW+/I7O9VHqUqYga56FG4bc22MmXSBexVMVRcHiBuZ2KYckYGMccY0Xc5RAXqJ71gHME23yDtQVGJrEwwH34ggC7zCbTPdZxef/pgxK0Bn5yNtG77cQapYixr5ds3bA91KIBn1dGr/aBxSyNuN9r33aL3ooB3XDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qi/WkUUY053ZaYPV82c2lG3TOuqd5lL00Q2oPKhANWo=;
 b=FNNgyqKFrwOT/7qLvqgdoMJyMn8o8vo7d9mvKzq7ZvLjHzgkSicyVKkcDccU1rouVv05iO93wMjy+la2HLChmbaWOrBqCbsO9XPoNq7cC5jCsrehzgxuDiXdgT10QKHpySdbCCDEjHm9dVP/vRPOmveARWHaxJeGksq8ffUC7s8m98iS3q1GHgyBBb4yaLDu0Mrg5ruPfTnCeT0Sm0hhRxiwK3VEIcsx+/zvUthLu5nPX4WXgCtF4ceECYUilM/ZY541secHsPAsRbffESEjx1waWO7DzpERR3jmqWRO1E3UkmBIO6mt3V07c7c3njOgRnRo2pRNSJxYZzLXlTWZpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qi/WkUUY053ZaYPV82c2lG3TOuqd5lL00Q2oPKhANWo=;
 b=BvqGGvuinSEqjuq5kMbtGJdGhOCp3crYzE+93dOhE11AC3eXYKkaLcA5Q2Fpc/VSx6hVXYyl38Kod6gyUlMvKvgByOypYgiW+KsUXKeqAko4B4oTenEXIiDI4BXEAitYypEq+n5sErfXQZtvmL/D+gFZ/kT4lR+757LP6E7ls6owTGeKnyndTCqznNN3gZImIzJiVLp50h/kfVfrWxKNpWWos9dv4T0aDye9wB4L9i4Ij3Y4KIfcrA4/URQa702p0zUwh0l6szqtGuHQqjmESekbNSH/fByOqPli6PYeewrQTMSmNmGMIhGM7FhsGTA5SuLuD560t6WdQqUet7LQwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8191.eurprd04.prod.outlook.com (2603:10a6:102:1c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Wed, 3 Jun 2026
 17:33:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:33:10 +0000
Date: Wed, 3 Jun 2026 13:33:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, conor+dt@kernel.org,
	robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 13/14] arm64: dts: imx8mp-var-som-symphony: add second
 Ethernet port
Message-ID: <aiBlULkmNBVQ3d6I@lizhi-Precision-Tower-5810>
References: <57b48c65ec479641f3714292fc691ec8b70aa669.1780497188.git.stefano.r@variscite.com>
 <20260603155135.CDCCF1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603155135.CDCCF1F00898@smtp.kernel.org>
X-ClientProxiedBy: SA9PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:806:28::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b58ca9b-6b1d-44ad-bbbb-08dec1962e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|52116014|38350700014|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	4GzE2YfiE9bD5p19kEkCxtfv9f2R27k6IFPpi5sMNK5NZLTdzvq6qFsXnKG23PKGXQ9AFSzgXDu7uZSv1jlcS90XLGnpOBDOant0z1baVwkIMub0VILbO6q4R78jF4xRFRqzM8e0mRaqOIQM78361qiWIMcxCgsmxFptP8ygOIHZOu7M4TpVgSE5zbCyyQdnGNdbL1YdUojWkqU5HKQAvS9rPt3xsz90WTqvHnR4SgzHA4Cuza5UizSDQhxyHOAxZBj0CVCYFsXKdR58heZ9AOraHrSCsdMQwFXKyxitHcaQo8Kni6t+TAc5ZGNTDkdr06MY84y8n68+Fe+nPvQfge0gG/ogmIm9kOhKAwIa2OdPO4YT96HNPMlx4e8lyXceSqpBor24lg5F5riHyFTa7QSEHR86Yes4zpJN+PlUOTArE/LBPoz5shwRizRlVjDV1PeP5CxMEUPAe1e+kSV7T0aOSRCUcLDhufXyg9CoyHpfNOZZvmp9lWiasPSL5IVtz5CLrGtaVv8qHCCqvFMDBiLbfpucd4N7qMzUSjel3OhCkGzkFi60SkVvHIUsZXs9c4LWEGWI8ArSNwvEDHnRKo2hkbFTdSeNgkHjWMLyb2kUYUTtFlJWVY9cHZxTUGbqvn808mw/aDfCH68APXOahNtH7K7gYxhK4hw5lTy5SIytc+sKMlhBYr6NjDWjALZf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(52116014)(38350700014)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?LgAJlvgKufE3lsEmK5gwP0YL9bT18dk4bKXTYWA+/36hCsoUarPIIMHs8D?=
 =?iso-8859-1?Q?YvwsbtHWjYjxOlZHoieifZXHYXwv1NYuOlauWChEKCSFQ1MD/9CEc9GfII?=
 =?iso-8859-1?Q?oKLooH9MTQY18iL55N2RAxeshEfKl2Gs5ziDZ9ADpp0hIa1Ju/+yTkahsb?=
 =?iso-8859-1?Q?9XRHA++PHi9foL9UNkETHWUY2oOx+UXZi2p1NPPcRns+PmS3XAzwHHejjM?=
 =?iso-8859-1?Q?Sw45KFU7vQsUP6fjd64AYE7czN8tD6Zfw7ROcu29F+0Ctd7Vo13V2jClh/?=
 =?iso-8859-1?Q?Rz2I+05KlZeeYWv269GRrvCSigcpfOeQaKhkjX7WaRd/F1oj7PTzCmtjh6?=
 =?iso-8859-1?Q?DqKIHdtPeNzzyHU2uxuVMlW79A/eeg7ryM4IVRyMK1P6t9wUOSqORS4lBa?=
 =?iso-8859-1?Q?NG1C3Ba58roBx626QxqJNncvr2lT0hy+UVqstPJug9hiwm26REJjAYcIta?=
 =?iso-8859-1?Q?vFDBgsvivdBM2/IUgj/kQVSb3I9CVxXtpHEgpzgWBaQqzXwiea/zNZFgnK?=
 =?iso-8859-1?Q?oAc+mTSPsqbKDTGXJajd619g3EY/s8/YAcwx223rZoN9ea5KMc8ymKMoQU?=
 =?iso-8859-1?Q?02thEIS7ohtIJGgDoxavU/I219vpDYqYAH43JVKx6z3uMAHsFCrvUzxCah?=
 =?iso-8859-1?Q?H6Kvm5zVNRnZTCh7Vzzz9o4z1kzYt2wK90KN8NEzjPBLQFPTKaN5rsnJ0d?=
 =?iso-8859-1?Q?fitlNw8SFgvRMz6iWAJWspnOARwm2iAmWt6n15gDzEG+/+ylyXFMzPAC2/?=
 =?iso-8859-1?Q?ZaTbH4JaisDgOijafqif+Xks0ezIAmOKjOCaYttnoPOi6OHBAWGIuRaz+e?=
 =?iso-8859-1?Q?TSwnRza1WFXmuqF61sG/KwqnAP7CofSUYhjvNOuc7ksYztQ53MsWjNakJR?=
 =?iso-8859-1?Q?lUerHE9EIXuXUwvmGl4zQACgUcVouONZvEOJj7gM720ZoLD4c7QtH6KFgm?=
 =?iso-8859-1?Q?pVv3a3ExfUK5T1E0jufjR/HDvXxE/ovgz9vr1Tv9CwNXX83IfeRR16ReUL?=
 =?iso-8859-1?Q?eWigJ8K37tZF1ac54Rizz/fcLqYQrW4dprrWjwYYQChsizoLF7fFEYH5Y8?=
 =?iso-8859-1?Q?j9ZNG5InCiBOXLHSs11n71Af5fIV/KSJ73l7TYzbxL+hikGpM/RdgusY3Y?=
 =?iso-8859-1?Q?fiyTwjgRvm6yaJUiErDEAinF/W/JTvNNwv+J0pIkVJ6NrQvOF3QBBwG361?=
 =?iso-8859-1?Q?99DXC5e/IkYx6y9G20cN605lN/j3IjPjLqjojafQvqAyXxF3iGFSqA2Ab6?=
 =?iso-8859-1?Q?eGGhiBeJxo78wCmJqnGSQuhqc4rxXl6Xhquo4X2D25pw3+tkiFz84uc3c8?=
 =?iso-8859-1?Q?RAWdTYsdU4RATfSGwBOpQHMG4Nmd6b5wv1rwjxiQUW652JnSU65WwtCTYw?=
 =?iso-8859-1?Q?iZkGs/GV62tr4LAM3pa8VIyXNocmd4YkuYQefYzMLCaZiVUpLffWQfi814?=
 =?iso-8859-1?Q?Bz8SwhFhkGjTcwYbNOIXpJLxYDpDF6axrXj/op5eqit/Q4wXuj8sppbHsJ?=
 =?iso-8859-1?Q?3ZxT5RiY4jpRxH9MpXSfoPk0LGMzlAy2vFfBsK5C7K120Kqkg7biivF3CZ?=
 =?iso-8859-1?Q?biHaIeEce7yfgQcBOLHZWZbYyNHpXef2eWrpHCXKUaFKpcMhfKDEpxzNPv?=
 =?iso-8859-1?Q?D8bHNjgrLlsocaUDdvfW+ZABM1sr7dchmJsEdbJDO/U6VN6gzv4T19RH0L?=
 =?iso-8859-1?Q?hFQsgxcHBg+PVUdpgoG+OJX2NZ6kA2o5iAwvPof15URNWVFsKlB4RtK224?=
 =?iso-8859-1?Q?rL0aDeqG/20engJdB9jMWdypbwyxp07e5icvHar33IogHCyf1IjJuI+8UD?=
 =?iso-8859-1?Q?zFYLwkbujA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b58ca9b-6b1d-44ad-bbbb-08dec1962e52
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:33:10.0707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cSyqEiqjSiZlNGVkgVdk/bASbyAlfp48EYGOWiqoSbJOEl0MhLqhKutP9b3L1YOVBL/wvj9l6/J2BG9B2HTgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8191

On Wed, Jun 03, 2026 at 03:51:35PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] RGMII TX pads are configured with lowest drive strength and slow slew rate, degrading the 125MHz Gigabit Ethernet transmission.
> - [High] Race condition in PHY power initialization due to misplaced `phy-supply`.
> - [Medium] The `vddio-regulator` subnode inside `ethphy1` lacks a `compatible` string and will be ignored by the regulator core.
> --
>
> commit fb47dd91efd03a99780078ebbf8ddbd840e641f1
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
>
> Add support for the second Ethernet interface available on the Symphony
> carrier board. Enable the FEC controller, add the MaxLinear MXL86110 Gigabit
> Ethernet PHY on the MDIO bus, describe its reset and power configuration, and
> add the required RGMII pinctrl settings.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> > index 6b2aaf6bae071..f4926ce0aec7e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
>
> [ ... ]
>
> > @@ -106,6 +117,38 @@ &ecspi2 {
> >  	status = "okay";
> >  };
> >
> > +&eqos {
> > +	mdio {
> > +		ethphy1: ethernet-phy@5 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <5>;
> > +			reset-gpios = <&pca9534 5 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us = <10000>;
> > +			reset-deassert-us = <20000>;
> > +			vddio-supply = <&vddio1>;
> > +
> > +			vddio1: vddio-regulator {
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +			};
>
> [Severity: Medium]
> Does this subnode need a compatible string?
>
> Without a string like "regulator-fixed", the Linux regulator framework might
> not instantiate a regulator device for this node, rendering the vddio-supply
> reference dead.

It should be correct, and move vddio-regulator into root {/}

>
> > +		};
> > +	};
> > +};
> > +
> > +&fec {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_fec>;
> > +	/*
> > +	 * The required RGMII TX and RX 2ns delays are implemented directly
> > +	 * in hardware via passive delay elements on the SOM PCB.
> > +	 * No delay configuration is needed in software via PHY driver.
> > +	 */
> > +	phy-mode = "rgmii";
> > +	phy-handle = <&ethphy1>;
> > +	phy-supply = <&reg_fec_phy>;
>
> [Severity: High]
> Can this cause a race condition during PHY power initialization?
>
> Since the phy-supply is assigned to the fec MAC node while the PHY is on the
> eqos MDIO bus, eqos could probe and scan the MDIO bus before reg_fec_phy
> powers up the PHY. Should phy-supply be placed inside the ethphy1 node to
> ensure proper probe ordering?

look like make sense.

Frank
>
> > +	status = "okay";
> > +};
>
> [ ... ]
>
> > @@ -363,6 +406,23 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
> >  		>;
> >  	};
> >
> > +	pinctrl_fec: fecgrp {
> > +		fsl,pins = <
> > +			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0				0x90
> > +			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1				0x90
> > +			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2				0x90
> > +			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3				0x90
> > +			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC				0x90
> > +			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL			0x90
> > +			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0				0x00
> > +			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1				0x00
> > +			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2				0x00
> > +			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3				0x00
> > +			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL			0x00
> > +			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC				0x00
>
> [Severity: High]
> Are these pad control values correct?
>
> On the i.MX8MP, 0x00 maps to DSE_X1 (lowest drive strength) and FSEL=0 (slow
> slew rate). For 125 MHz Gigabit Ethernet, could this cause severe signal edge
> rounding and potential failure to negotiate a link?
>
> > +		>;
> > +	};
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1780497188.git.stefano.r@variscite.com?part=13
