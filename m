Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD135898;
	Tue,  7 Jul 2026 18:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450226; cv=fail; b=ZtAbCIJJ4toETxncPMzpIJFkkJcl4K47jQY8Ih6DgHLY44XmCSDQwbp8JEQWpG2pJTyFnzRMJqm6CnCHsE3sxMs3Lcry1SMKIww2A+gAIFA+jPf2dEvnUmbfUe8iui+uNeXx5HTgwQLlLnL77XBj67JEc570IFHgufaaAPfQdBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450226; c=relaxed/simple;
	bh=B+E32SnC/Ucjkc94hLiqYhK62x2VuGNH28xmUd3MtoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sv7GO4muVZsYLsBP2BIgAbDp+PWrRwRAUkc71+fA8Ua6uGBEkyPkHmkYevz29NuKm977DucP0MXVUDFLLkUp6MPxyMIkHWY12EgkaHiOINM8hUlC1nd0Bzqb2Lww6FMhkz+BC1R0YzdtwItce+KRtljoudyHE+nAkNzIkGDlicI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=APxDBBYA; arc=fail smtp.client-ip=52.101.69.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="APxDBBYA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3IeTxhdIhjN1T/l9CfmobrWf8kzgetAzQvelHbliNZeAsI00Ijpwq99RbULtwVCgCRBm38z7tt2sndHruizaRtJgxgDzQ2Iif9oeKOyZvRNGArp0CUPbz3XXfBX62FGjrXdqpGjOryBN2IFfDQSoMJqoaFHl1k/NwKyAmDv7bTlH07LoLU+kmOwJ269wAfloQE0Zx/uav4bR7/ZvDA2ZQQX+oKXeZJj2fJqgRTaJBPD6G8A38A2YLDETHI/F7jiZqS6MaXN1eC4DsKLCIXGbHuggTECArHesLvbCSsyrY00erEslOdem9TkHu2AFfJCC4zDsqrWBZRXyXW00HP6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5ZaZCCGWtxuIOZb9GR1y1GuLljTI75/LSnEoqhGJbo=;
 b=WuGpHOjwBf3rMbtaBototQd2Jte7L4/mItXxlCEMMF4mr0XutfCCdFqTug7I3dRiOgsfDpsqqxEQsK4Xs7rzDhnt3Eb74VcPLlDY63YxYl3UIERTivbeHlObvfDLGxJEIOWXQAZMB9Sj8NOIYlV/hWAot91xa/n4sSnB+3dFpNwwN3x7zPOO6pgjxkBknWymoCEnyKxYPqo4rR6K3G0wuQzRs47JTjafpeqBMID6ihjqCNuP5Pe5uTnUJI3aG5JkvK7h82E69E7wZgODMl25t4b8s/40ltSjHiyfmxAjrVPM2byslpbHdzdJ05A7eo0JmDYDiy3q+tyc0uW8y0Atvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5ZaZCCGWtxuIOZb9GR1y1GuLljTI75/LSnEoqhGJbo=;
 b=APxDBBYA2UFw2aVt/cfflrEcHTtcoaWeUvBOADa1uZLPBNVFqyiA6JS/OmUYMaQmdiaghl44QxakrEzanoaCMGwJS93cREjPNOs2DEGhVxq/TFgPRRyOgzoiUXqLA7cCDG3z6ZIaAbIclIP+7JRYhXPFyp3YSORP/iLU+Bh7V1/EmDJZm3Pj2qdiW0I53HPLLiOMmkRRERotYglRvZGFPQHkjILfQ8nFYs640nt/bADICZzPsYr+9JcE6+Udc3RkQCLnSIYRsmIrQYFWIQhhCOCpDNI/9XInfNDgEpnGqckGQufRRrMTrw7MISXkSaay0CmimjT5l1j8OFijV6Bitg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 18:50:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 7 Jul 2026
 18:50:19 +0000
Date: Tue, 7 Jul 2026 13:50:10 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org,
	imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 05/15] arm64: dts: freescale: imx8mn-var-som: Add
 support for WM8904 audio codec
Message-ID: <ak1KYjOUWDy6po5j@SMW015318>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <4487a350b0e4667816c3fe62e9fd6df2696c18cf.1783330236.git.stefano.r@variscite.com>
 <20260706100948.DDA391F000E9@smtp.kernel.org>
 <akvC8UV5N6Tpk0_h@SMW015318>
 <akz_Lr1bRSEE5rhC@Lord-Beerus.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akz_Lr1bRSEE5rhC@Lord-Beerus.station>
X-ClientProxiedBy: PH0PR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:510:5::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 724729f8-15b8-47ac-dd3e-08dedc589769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|20046099003|6133799003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	I6nsNRZvpLj6B0PjyPh5rYsIfban+7QslUKW9h/V54uZ7MJdn60vo8czigFOYN8BPjFUAof5tjOU0ELzIpNZFRTrRh2Dw0DtA8jrZ3uo7Mtsh58tnYh8XRc/sUrQlTOXHWe2m2wgwfZsjwD2ww2c7x+Tbb7SvzMNRRz81CDnDOFOVLZLG1rzt2CMHWbuPdElMtfPA2CizzTgxKaFhvgQJX5bWeG3aiqH1KbmUzUp01ndCynIM/mO5pZUwU9hnvBc5gwXepbQRXbYBig6Bq7G7dIZsBay+Gfbrlvcn0ibmAl0EWLKHtbf97EGZfNu5gYDkHbv4ToQvGNVpwCijhsynvPcHdPf7J4cGKyrexUn3bPbBRSpfHOiZENn+2vpHFnGJmyFliZw7LAxVFj2a3ChdfZVPj3B8NWkh6IKsnwub0HOK9Cd7ogqiVeU8/eLAaw1xBmVVsulpm/WLctGghXp0hyITZETFIayegg6IK5UHaztElITpHOYnC+gxN0m48ztTDxTP2n+YgFf2Vgnckw6rBwA7AmRW7xSQIKavUganOyH3AjWwfmMuFZwyHjnOLBIzn1NNKrbMG1el/55Gv7Sur8l2SMSP0V1CsyR6IXcPJJ7A6paj6opDyM/2ZXSqUKJwi6Hzxjp2kx0aZ4yt2c+q33VHtLgb8kvHlsFkdIPPAw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(20046099003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3u/GkUesl8Hjdh57EelC7rKZfDw9qSCPVlvWoz56rzZ8M0FmffMSVcRw9DFc?=
 =?us-ascii?Q?i37I639U1EAW1EVRyiV3q13/LY+WuCINzpln1+L50rYrPqPlQWnAJUM34RVE?=
 =?us-ascii?Q?BU0mf2g0hoHcu42lsPTG9oiZ3unLorYiLB6SB2Ky5YtrqACSxkVMmxYJew1W?=
 =?us-ascii?Q?mDwmC4qTJQKrGyiDJvIHPy9tmfQdWV+znuONFEqIV7J42CObFnTZvR1dYd9M?=
 =?us-ascii?Q?bsjiLntptu+IdBq/c2zOaOEdKkoGHFHJKlv9jIYaT11eh9nJ9A48StHSdrbs?=
 =?us-ascii?Q?eVJGtMVLISjFvrdlgBd6xx1fkSodEkqq0JZDIL7os3ra+27nkUBuCDfze8ET?=
 =?us-ascii?Q?xdGAIFyU7NSW/WgaHSLYqLSJhH9qs6UtHWvup+ksYD6EEgMJzLS0X9KDASFz?=
 =?us-ascii?Q?2jic8eoZ4M8O/adLQsBoBRrghrp9q2BOq3rDPNgvbbYkltPzEvPIAvb9dWhl?=
 =?us-ascii?Q?AkxQNiGae8s2zfhcLbQWjv9KSnFToK7anXwnrjNk1Uy8TfjORWzs2hh8FACN?=
 =?us-ascii?Q?nPnPkgW540Whacm4HT4mu2Bx/0XuYn2wUgZOJ70nNBKXaMOTRe/DhXPYg+Po?=
 =?us-ascii?Q?EuQxwb+yO0zCDNpSEN5WBWxlKH85v3iLkeROinwQbSisWzZ9HHvFsqUyVMu1?=
 =?us-ascii?Q?RPOOuZiPkVzSjr1oYbFuZuAD6cxYFA7hNexZcdwsUNot2iXvWYkmHAsri3Ff?=
 =?us-ascii?Q?lJmKGPjese1OGztgvq2z90aUasaRv31G5rwjb1hY5bbgFdWaDX5KIShVZMGr?=
 =?us-ascii?Q?LhJe0sDmpf6cyUB5ZX+Yic5Po+Z83Ux5C4JxWoXaeXxoybOlMx3UaEr632d0?=
 =?us-ascii?Q?dUh7XRLcFKzoNNKuyKGNEh5jVcdshhlJ4QLAr7+59WZs2dmzIYRba/66sdhy?=
 =?us-ascii?Q?1nT1THpQG32OOOyAb6xPxFaBYcgHWGRBL2aO9v31qPPSosjg09209vM5VUwg?=
 =?us-ascii?Q?qXfN1bHgEUi9u2Kcl2jxvWPEkwcVIWAW2v0J6KtpMozV9EI8BqAu9kqErr+h?=
 =?us-ascii?Q?zrjZQ02toJc+zDcLX1Gq8RI6jll31/uAYyB+jxtzJcf4Li+87QlSc/9DVzEj?=
 =?us-ascii?Q?mquMj9NuEgIvR7b44AkSUSYQ8nLLn9ORQCIoBs9LU/X60JdrDino1fgLNpEs?=
 =?us-ascii?Q?bNy+2PT827OeYSYEKVanJx8xPEGMSDIbD11WN6PO5Q347zH0+kqkTLeq2YH0?=
 =?us-ascii?Q?bf+Z3ziepLB+fORq5uirE4qoJjlpZdEzPwowwEsKQOemWbSUtIuX7zucrWOE?=
 =?us-ascii?Q?iDuNzhjjq/MMPEZAHDWHfEF8UjTrbymFFL9ej5RtZd+74hmemuIbMXRf5qNj?=
 =?us-ascii?Q?x5Q9q+tUr9q6T1508aiU15bnligRE0y9ps00psBLBtrMSCzoWW6wyISJXjLr?=
 =?us-ascii?Q?b0o/4bAUaimlb4OXjQvHQLxh1OO5OLxQ+mq9o752H/vduix/oKEhoUU6gGD4?=
 =?us-ascii?Q?HenN4BG7+Go68/iYgQOZAGkNc/ccp7uf7OlDxKtOgrqrUXX8pf/rj4vKrOm3?=
 =?us-ascii?Q?/2vn+WLQXY6yJwUJdNB4aZz79jX160EMJL6TOmGrOTjpH3Sk5kiKg43BRmka?=
 =?us-ascii?Q?+VN/or6iKcALBPGgS25Ym9pu4gcee4b2MKz38JdRoGQXu8E/Bgmmgku5gM+G?=
 =?us-ascii?Q?PVVi4ZcuFkJ1XVz0lCIdR5EAh3hl6ArG1PLeqFsMt/9f4+V3k8BqGMJl2rJS?=
 =?us-ascii?Q?JvJlzJZ3JSN4tGZDh4TJeJrmm9H0fz38T0h/GfoYO86lQqi1YzgYw4TgbLTq?=
 =?us-ascii?Q?cIGa5tR/2A+ERRE2Bv9oYIw/Tihc5u8t0nKCD/YTNEPDjnyOyZG6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724729f8-15b8-47ac-dd3e-08dedc589769
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 18:50:19.2583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTBQSCsrr4Y8lLrBntJgtxvV7U65bhjd+9tCmEMTr6/CE8Awcazp8scJZOgshHC1fcJL1LSX4wC7d3zoZT/CH6EwE9/4Zh3+iIhQd8+V1vB3UwLasANTJSRCqCKCAc9I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8196

On Tue, Jul 07, 2026 at 03:29:18PM +0200, Stefano Radaelli wrote:
> Hi Frank,
>
> On Mon, Jul 06, 2026 at 10:00:01AM -0500, Frank Li wrote:
> > On Mon, Jul 06, 2026 at 10:09:47AM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] The `simple-audio-card,routing` property maps `Microphone Jack` to `IN1L` and `IN1R` but omits the connection to the `MICBIAS` supply, which will leave standard electret microphones unpowered.
> > > --
> > >
> > > commit 78e4da0f71f2e53ae4312cbe5ceecb0f6f2345db
> > > Author: Stefano Radaelli <stefano.r@variscite.com>
> > >
> > > arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio codec
> > >
> > > This commit adds support for the WM8904 audio codec on the VAR-SOM-MX8MN board.
> > > It configures the device on the I2C bus, enables the SAI peripheral, and adds a
> > > simple-audio-card sound node to expose the sound card to the system.
> > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> > > > index 09146ab763858..e2e04ad2fbb65 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> > >
> > > [ ... ]
> > >
> > > > @@ -42,6 +50,34 @@ reg_phy_vddio: regulator-phy-vddio {
> > > >  		regulator-min-microvolt = <1800000>;
> > > >  		regulator-max-microvolt = <1800000>;
> > > >  	};
> > > > +
> > > > +	sound {
> > > > +		compatible = "simple-audio-card";
> > > > +		simple-audio-card,bitclock-master = <&codec_dai>;
> > > > +		simple-audio-card,format = "i2s";
> > > > +		simple-audio-card,frame-master = <&codec_dai>;
> > > > +		simple-audio-card,mclk-fs = <256>;
> > > > +		simple-audio-card,name = "wm8904-audio";
> > > > +		simple-audio-card,routing =
> > > > +			"Headphone Jack", "HPOUTL",
> > > > +			"Headphone Jack", "HPOUTR",
> > > > +			"IN2L", "Line In Jack",
> > > > +			"IN2R", "Line In Jack",
> > > > +			"IN1L", "Microphone Jack",
> > > > +			"IN1R", "Microphone Jack";
> > > [Severity: Medium]
> > > Will standard electret microphones remain unpowered with this routing?
> > >
> > > The routing maps "Microphone Jack" to "IN1L" and "IN1R", but omits a link to
> > > the "MICBIAS" supply (e.g., "Microphone Jack", "MICBIAS"). Because "MICBIAS"
> > > is defined as a DAPM supply widget in the codec driver, DAPM will not enable
> > > it unless it has an explicit routing link connecting it to the active audio
> > > path. This could leave the microphone without its required bias voltage when
> > > recording.
> >
> > Is this true?
> >
> > Frank
> >
>
> Thanks for pointing this out.
>
> This audio routing is not new for this board. It follows the same WM8904
> routing that we have been using on our other platforms for quite some
> time, and we are not aware of any reported issues related to the
> analogue microphone path.
>
> If adding an explicit route to MICBIAS is indeed required by the
> codec driver, then this would not be specific to this board but would
> potentially apply to all of our WM8904-based platforms.
>
> I'd prefer not to introduce this functional change as part of this DTS
> alignment series without validating it across all affected platforms.
> If needed, we can investigate the MICBIAS routing separately and
> submit a dedicated fix covering all WM8904-based boards.

Okay, thanks.

Frank

>
> Thanks,
> Stefano
