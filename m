Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268AF2BEC27;
	Mon,  6 Jul 2026 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350016; cv=fail; b=JS5xU8y8XJYkcjOLz1Xex5CyxCp6S0VPX1XS09FcdviYTpT/OGe6aaJf7lnGZUAmhJ5GOyiPcJxacnuwZmWUu2nGfVuMwM9hDexc+EjX6xUYmaUFv46iN/8uwietiyzeWBKYjhVm/fd0UO6DI6kj39AoUV65r6fFgndNB2um52Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350016; c=relaxed/simple;
	bh=xt+mS5/x+IreER96Q8xDnOUYEj2EFeSghgMY4uTbo04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GmG1lKeP+kG099Ewpv5ex0+fom9gnbZOVTdP8Cszc7oV4G+jaihEQ9buSJBqSiQzG5MzAxwQePp310XjvgkklKzCw7oUFVB9Vt5malTs15GS8cwiGO1tebbXlrNQ28iV86POZENcFMQ8ixNgjQh27Yr9w05EDu8LyGfT2D1sOcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RAPjuOxx reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RAPjuOxx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmBKpB4u+HR8nFC2CJ6t6lUAWDgAsKmahFYCGCtM2TJOA+5YNENv5mOWfFy2J9ZtxRG1ySKeRsblUesXszOEW3/HS0NEHzUpxODBu2VnhZoanJiMz+eTk6ZX3+g/DTUANLnoyazq1HefIBnDJEWoadCj/GrvIsAp+Bz3NhkMxHG1uKLNYPv1p1SiwVMHLFlXMJ4FRoC2rYkJCAkFL5gGIyqIAWymE00dtu6a2IYW41JV7je5pOWaTYZ4V5PUBvleLpPQ9nlyBrYywW0CHvG0IfpUzzTi5tKuT1fmMgv8dAJH0igX3T0P5nXwKQk/Je1DaYDF2lq/G8+tvziwxm2S3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Stq6w+W1OSYtvKRrHTtOVkJu2rt1RsKUe+rNgS5xfUY=;
 b=hf1rf/0Ax9Qu6mvO+HkGZq/zNlDFDH2Pd6o+TjMQPchSpV5qS280m7aumD7pKfYdirpqmt7yRp5DmMqUcnniMZFzo+xeK2wgSVVXlqHgrd3PTPjmPEOgRHZshInXlapJWkeCp/SzkAUesxjuKSuEKS6MRWWJTaHMYyP+G8en7JXIeFLH82tOIstAj+vjC7nQcXoepcmWMwMsnhginTxuctZMO6PmbsUD/IBvdLnSBYsmGUKZCDinOEeB61fy0epVqp/d3cmM8WF1shpuMkih0nQC4Pd6+92lI4Haytw6zJO7cSNCJ+BEU0b/XuWI2RIu7uDRRPlGqk8Iyo3QjHapyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Stq6w+W1OSYtvKRrHTtOVkJu2rt1RsKUe+rNgS5xfUY=;
 b=RAPjuOxxCWjrOY4K7pmela+h5cBfL2pgk3WoquVJnpr713eNhaWabCNTl6xIlQnMyQck4F0jQTiccMm7541If3hM8O7hizNoWoW215nmpNBbCHVWIbKRGeTzFNs/q1BHuU4BOvbdXC38oxGHWfbS77TWm4KVfzl1uEzSd/OKhhycHDLOlVPCjsl/vZ54RW6KnAbSA672qg9bN+1YG+DkhyR3JqY7dPuupj5G2f12Kk0ueb0osL4VuOlIEIz71ZL0PHHsfXpaB/1CTZb4LGPHLSaPGyNtZDl6ysK+8XpoD0JdwfNTb8vlV37ML4PPWeTGaa0Qd2bt2Shvvzh5EeiR6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10165.eurprd04.prod.outlook.com (2603:10a6:800:22b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 15:00:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 15:00:10 +0000
Date: Mon, 6 Jul 2026 10:00:01 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, Frank.Li@kernel.org,
	imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 05/15] arm64: dts: freescale: imx8mn-var-som: Add
 support for WM8904 audio codec
Message-ID: <akvC8UV5N6Tpk0_h@SMW015318>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <4487a350b0e4667816c3fe62e9fd6df2696c18cf.1783330236.git.stefano.r@variscite.com>
 <20260706100948.DDA391F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706100948.DDA391F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA0PR11CA0029.namprd11.prod.outlook.com
 (2603:10b6:806:d3::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10165:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b01e9cf-f444-470b-ecfd-08dedb6f4662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|6133799003|20046099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UTaAf/qV4kQtU5yfExit/9l08suz+XZ0AsEoMTVPX13s2f7PoO7/tFFa+nH80nNfBfortFMSIE/bzbhCVNB7/7HlkJJyoyoCy2YhDGyn1aih6mSjloZirF/FvFBSpnmUpaYBP/JS6RIRFR9WywKIFezAedp8Jhxo+HgiJuLELx4l25zaKJ0wqp2IekR5BPsokfs1VblYTu9rY/lZt0/S7sjHQIvZ9w6+3xdE8A9gbrm49vCMRoFAZzaFLUd9A/4+RsGIiS2k5uIFETPxW2Y5hzDqv89+H+gfa+X5n/4ECeW3b7aQlxdDwvevjXKGpGo8Zi1Yx7bDN/w8h2IuBGuZ2nkZaxK9hxoaOdiuiSyOHqAMQzblAkCWv+mzROg/8TCvlXNauI4BFiEE0hFa5vHgNwEF6OfI5/3pidtwyi7MA+ov0BooGRCL6gh7+CVFllZypj0cI1IefitqMsGvTqsEdv/FHbAtPMRs3brusArT+87a0ePNALI06D+iJk9Onp8m19VBDaEyryZRr4ipUwrFEUfAFSk3SBGayh67RiRgP6kSDpO2DtmVjwo0w7zWmVZFRIPsMVnnBCYqoSygty8APfY7jN93OKZE0ZPTv8XYs4Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(6133799003)(20046099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ypJc24CsKFjeQIbNTYeboeSX7FjTuzQNF/H5uYzKwHkarfjJ/6PexM/YoU?=
 =?iso-8859-1?Q?+jLUKFS/yt+4PRqX1ryUwIC+5LX23k38Yj1DvzKItiUPCQDGmbOAjnQ4sr?=
 =?iso-8859-1?Q?p7dCJlot6v7lnyXl2M3NfsYlwFO/BlWJcGhxr+PFBGWKusBMtGHT/fLPvC?=
 =?iso-8859-1?Q?f5h7g+2wlx1gJhSdugPmSJNgPHCJNN2/j6WFHwgNV3Icc/eBb594nqQ+SP?=
 =?iso-8859-1?Q?dkT08hiRRsMmH2N2qXVLpZxXY7D3z1B1oivrxCfV2zUMLautUy57sh6gkG?=
 =?iso-8859-1?Q?akKEdMVat2K/jazMXXx4czuRhbJqJJ9l0NebfESVaqtAggYKQvilvRiXtH?=
 =?iso-8859-1?Q?MCyPRfJvN0CkliHBxVBqqgqJQILFHTqNDHPoRNOs5T/pG8nxUS46pujfZe?=
 =?iso-8859-1?Q?BXts5A71J4360Q3RlKUnxkLvWNjFMJ+uwl0v64ljxIDGAzb6ySOaDeGn4P?=
 =?iso-8859-1?Q?iHYsaV9cUfTu1/QuGtn6NYEDkJ+z9Ajjh1bZ2q278rL1fa5YsA7xFyUHx6?=
 =?iso-8859-1?Q?KTlxG1OVlDgOz/XnekRqTQLh7Nkb5WymW2QjbxWNVhkbpY4ZXIKrERMH0B?=
 =?iso-8859-1?Q?20l9EQ8zP8yQOolBnddiecpF7u5E8MRBEWwX7CsK3y8m4/Bx9gc/42zxWV?=
 =?iso-8859-1?Q?+nTypcfknJOsYwUYeHWP79Z/YXTC42BZqH1crMUaITUN98IwhbyGbGuwAG?=
 =?iso-8859-1?Q?y8+BYzRGZLwE5iIelh8gY6QuVKKGMpveR3inASk+PuH2vR7tVV9aDJuY+9?=
 =?iso-8859-1?Q?H6JAW2Bqz/LLST2en2pc9vzEL2cGW9CIIRL0spawgQfjezb6OVND+Pbr/t?=
 =?iso-8859-1?Q?EMGmGdpPqehjlkfaH+mRSvxMq4hfoqUTAFmHxMuSQg5VhSj6b8IwD4l2lW?=
 =?iso-8859-1?Q?IBpEZf87ptIXnowwp5gi01lYwxKF7/81VTdA9sxpoW4Rmy1XE3lZR2HChp?=
 =?iso-8859-1?Q?a6V9IrArX3w084qPL+vYf/eagSUK/yE9dOQej8Lt+YBFF5f1VXaFs1jycD?=
 =?iso-8859-1?Q?CgSGJjOxL74RGZSiR7KV0j+Vhsj6TWcRyjf966J5SdL76tIxJlEOl3Hael?=
 =?iso-8859-1?Q?xttaHilu9NZUERplT6Ss1pgErahrQGOWvvT2depEiuFcYLMHIzWlGGlryq?=
 =?iso-8859-1?Q?iG6b1DliwPo6zSRH7nP02qOvgQ6l1OwyMVk/nUFSf2PE3vOoAe5eCYILMK?=
 =?iso-8859-1?Q?HX/giZuXT1l+venPGRi8vc5Mp7H4sx0imvDN2+rYdgg2NbOSynVsl0la+w?=
 =?iso-8859-1?Q?xGnX9hvIFHTv+FfTIrytuYGXqdu2qjUEfmd/0lL6VxYI2Q7fpjhHGtw7oz?=
 =?iso-8859-1?Q?vs2wZltrEWD0l015ppgxWEu20HROaJi1QNYS7TOioAAyAIQVJvorcs2BGI?=
 =?iso-8859-1?Q?hnmXLxe2tJK8NRElgJTIbnRqgN3QmNryx3lEusQct2yPu/9CjBNctvMuyI?=
 =?iso-8859-1?Q?TqSngNs1CmgU2IWLDWi0Cv4kTXQwkvPiGWaI75zFKl313EsM2Eo1WYIItL?=
 =?iso-8859-1?Q?6RoGYKlnrYcAxAiGN0CEhJ1AsuY+DN4bpVgeAMCWBKuijKHYAnmsUABATx?=
 =?iso-8859-1?Q?R6Dnp6Qv7Foq7jyD3zSTDADiM2m6UtGdO2aM8EFgrqldqJQls7bAKcJL9K?=
 =?iso-8859-1?Q?zaHbTjjEQbwCx7JfF02QMdsjE+S5yzoFzCwzbHoz2oM2akKntDqa63eoy2?=
 =?iso-8859-1?Q?QbspzPVdOSjgXG8P1k14Az3mKogBnT/nH1vreqCTyt56x5TtwhpQnSeq29?=
 =?iso-8859-1?Q?wtZFO52EKkCqq+xAwKuDJ+XuDbESxuvqxnCYmz1d9ZaARsx6Wt2mzDjG/Q?=
 =?iso-8859-1?Q?Ys2ZfFhHvPLSeXmFMxvlAw+/XFARgwP5AXpZAbDJUwvBrWEZa4Xg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b01e9cf-f444-470b-ecfd-08dedb6f4662
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 15:00:10.6004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iu9V8D/dYSgfOtHAfaUZGNJXI383vPF0Aqgk/bvOLNTdMjEOTITAMzOnDWf+2Zup1TINlq09IFojDNc5FK9W4IMXcNgftabmI9auaOpfFk6wNC62KArYt2dPopPi2jVn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10165

On Mon, Jul 06, 2026 at 10:09:47AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `simple-audio-card,routing` property maps `Microphone Jack` to `IN1L` and `IN1R` but omits the connection to the `MICBIAS` supply, which will leave standard electret microphones unpowered.
> --
>
> commit 78e4da0f71f2e53ae4312cbe5ceecb0f6f2345db
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio codec
>
> This commit adds support for the WM8904 audio codec on the VAR-SOM-MX8MN board.
> It configures the device on the I2C bus, enables the SAI peripheral, and adds a
> simple-audio-card sound node to expose the sound card to the system.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> > index 09146ab763858..e2e04ad2fbb65 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
>
> [ ... ]
>
> > @@ -42,6 +50,34 @@ reg_phy_vddio: regulator-phy-vddio {
> >  		regulator-min-microvolt = <1800000>;
> >  		regulator-max-microvolt = <1800000>;
> >  	};
> > +
> > +	sound {
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
> [Severity: Medium]
> Will standard electret microphones remain unpowered with this routing?
>
> The routing maps "Microphone Jack" to "IN1L" and "IN1R", but omits a link to
> the "MICBIAS" supply (e.g., "Microphone Jack", "MICBIAS"). Because "MICBIAS"
> is defined as a DAPM supply widget in the codec driver, DAPM will not enable
> it unless it has an explicit routing link connecting it to the active audio
> path. This could leave the microphone without its required bias voltage when
> recording.

Is this true?

Frank

>
> > +		simple-audio-card,widgets =
> > +			"Microphone", "Microphone Jack",
> > +			"Headphone", "Headphone Jack",
> > +			"Line", "Line In Jack";
> > +
> > +		codec_dai: simple-audio-card,codec {
> > +			sound-dai = <&wm8904>;
> > +		};
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1783330236.git.stefano.r@variscite.com?part=5
