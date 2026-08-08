Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazon11022119.outbound.protection.outlook.com [40.107.40.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550E537C927;
	Sat,  8 Aug 2026 10:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.40.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786183869; cv=fail; b=iecwcu88GMsDk9adiag5m8bpcM7q3owizQtIouTHk0ujhQQZvjjNZIVCX3L9UTJ+z2hWf/An22cQu36nJ67U4jovc/kJVRfXo1l7lGZQWwiAGIUzMIbww25FIcpm4kId0ueAsFDoaJQd1miIDvbjuTNryxf4Dwh32QR/0QuEnVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786183869; c=relaxed/simple;
	bh=pUqbpG5KWMz71dZkOYpqOfWx+EZSJT+D67eBY/aDlHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QABlv6cXuYGmUxlaUaqLTa5hBMT0yHV88TlEDz4mPq2UTsZVbX9IYhpwdaPJO6ED/n/sjBHbyn93UHYPK5lBBCmPKIkTwWw13g4wQZB/8kaUmAsUbMYfIAM0WL5r56GeeJ4llwX5ZiJApmx4GDTT5a33Fi6Dr0mSFJ9gVpjGKBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; dkim=fail (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b=Wt0ByPTh reason="signature verification failed"; arc=fail smtp.client-ip=40.107.40.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b="Wt0ByPTh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfmybVYw5BRfafQZdvnMVsK68h3Gw20ps0Fsu6V8oVPeUGaF28FIVPSSOio195RkLxLoHi9ZTfGLG4i+jgRYvpolVeGzT1V15NHAgyy/UTGe64FRZrcIuCimiv/YrGDd2C1W5NfA++N6ZHXaVTvckdMaQ0SOha0pjbkPD71E6MP2AWKP992kYOHxE0X23GD0/q5iF++N/2/6iaO5CwZAQJZjE+roCDk9M5oJcfljoCthLqW/RZaVQEItFlU/ktMJJ0UFR1sbYFbFXkpODSifoa0XqlQoDwXUv6eFPR7jxTPXh4/071u3pCnelivBDyl23BLvX9COoN6pN2oRZEJ7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlXIXDill9WGQ+9XenGRTiGI5bUPeXw/Ch7CHsOwgYY=;
 b=omp9/QEXufADqi3PAGlf/wCgFfG8lVduZ5mxRW8Zp0mDuUId2XvqU4IkGHRiDkIXFp6lOQL6P+yna3tFApUQGNxqzPUDExjv4GYR75s/QeXQ9YzBE/tkJsMMd3gr10j7jXlk5fxI9uYvLmU0q92tuy9S2cldKq8fgAVgTqq6jL+2I5X9Ot6SK28b0AJ9SP/7lhUWECRfo9+Y/dIrS5qFTTayYefonoJLLfyHOkMU6JMdL/WlddiD2403RrvQYk7tbureTOOgamRLz7CbG+sxgeNiSA7by3knffMtcFrQC2hCOTyBLJrQ+bxcgYsdo3pitavt7GuUxnw3KHGOlQbcbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlXIXDill9WGQ+9XenGRTiGI5bUPeXw/Ch7CHsOwgYY=;
 b=Wt0ByPThvgC4BVEF/fXERNAZ38smToe7SUVMFdUd94IB6XjqZfHegu9hMMz60H7EUOdFClCLZtAmBnO+W1a2/CZ6k2l8onxmiu+ae9/o3N5mLfQWs8V7HGa7Riyl4a1YRK/Rl3L/xy9teYJvwrdgCnVl7x4F7wRe41UsnK0bMwSdseB84kBoV9zx8DkPdeTlBmFe8lGd6MutX+cAbMeioisQor5zFfJtLRs7DeeWDYzoeR2dnDa3+ZmsM8LhyqB+YkkazdQCIgonq52pTkzG+CUZCBxsW2oR7jeeWzbNsPPMg6AfG6R99Z9fjZzFWtJCgxKTY5Y6AQN3w/A2k5mqmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SYBP282MB4053.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 8 Aug
 2026 10:10:55 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0292.024; Sat, 8 Aug 2026
 10:10:54 +0000
Date: Sat, 8 Aug 2026 10:10:37 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org, robh@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: imx8mq-phanbell: Enable the rt5645
 analog audio
Message-ID: <ancAndEEWUAtkCWE@b179574a4811>
References: <cover.1786107925.git.rudi@heitbaum.com>
 <54ab90ba6c05b38c6561e0ea732d487da9443f1e.1786107926.git.rudi@heitbaum.com>
 <20260807141524.179AB1F00A3A@smtp.kernel.org>
 <anYQnd1jW2ecFq_n@SMW015318>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anYQnd1jW2ecFq_n@SMW015318>
X-ClientProxiedBy: MEVPR01CA0022.ausprd01.prod.outlook.com
 (2603:10c6:220:205::19) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SYBP282MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c17b5b-745d-458a-26e7-08def535555c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|10067099003|56012099006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
	39MkJp/lpbOobVxgphm2xXlX/W0R9prosZSkiZUBTcWuwXXTF5B5HOxHOgKIZ4ff+9wgO+3xImwhiF5ZzbidI/zlMtrY3ODCQJhGlPF5FrzIC8J0s3N/VpWK+EKqUd2Gogkg0fAd+LjbiuPrBRRJDbtti9TJBgT5GqCbD34mNOXptebUj7QXErfg4YFVT5U469pMr45Sp6TU8n3EHnyGsj4BjmAGrztcjJpgci5grd4Zr+hcHyKoHkSzv4hZWBSoaK9CACmi9QsePJ8Ldnq6h7RBZz4iLDZZq/YZelOIKRjySeKcGAw3G0gu6KWncHpnJA5A/wOlmUm9xI+oLkpbawDEAsoYj36p8cpnsi7VpZ4VqG+zQeGa3f4yo6D5hEBZTFJupbvyFEGpNeYSIaG/uj0s3UPWc2BI/DU6m+Yalh2gXechnKCPHkpD3MAHBE8/MZnQAZxfDTNR2RSj5Tt3ch81tn9Y5R+KYKolZA3ByPTw24vBIzxwSxhCTKyWSYvPOW2HX7N9vpofFsrdPxGhd6wp+2LnhxNJj2APkzk2BKIa03cko//ISWXl+AjZWfZwsbDUFF361mTIBNKr1b12kC4uXTPDr2IYSv8uB3Drs8Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?DAJXE9tb2n4jUOttwp3ecn4ODrjKXERNJlEHBYo2+L8ni8mUYgLmJmybpL?=
 =?iso-8859-1?Q?9SKBHj4Q9iWI/Yw42X4SdIbqaKnwoGHzewKblnMzHmO2UjzNfrf9wSF61O?=
 =?iso-8859-1?Q?jX0IpGhO+sx59+/TncYMv2GUtQp634czFPiV5ifzSs1Z3BCQ+h1fJBSjoP?=
 =?iso-8859-1?Q?Ru4MmkK2A+M3nxmwvE/pt3pvT73Vupzv38pGymJRTzEO5Wn6XJvuMTqCgp?=
 =?iso-8859-1?Q?s3L/uGocf2AGmu+ZYehhuWgaq99FfzCL+ujHWJLraPgo6xIsl0VlW6gaCy?=
 =?iso-8859-1?Q?6pCUe8kHyl5breA017ULdFPFCxXK1uID+fW/wcGLwIDsGHXhA/fGfyO98w?=
 =?iso-8859-1?Q?IbEkTGdedHItN5GhBm3GmrwIk/bbwoijZA9xHvy9/TNSBWStc3GBPSrGBO?=
 =?iso-8859-1?Q?2SJ3zvyx8c9YdKAROHuRrPMz3OddeTV0vwvrZE4tzuOM8WtBNOscK+UHSO?=
 =?iso-8859-1?Q?Fhi6q+TtAXFS9JO3ODxpv693l9wVKoqutFsWA2qqsjcSgGRxUHMY0cFrOF?=
 =?iso-8859-1?Q?uU1V2Qa8JEFd0LRmFnB4mcwyF7KLtUrp0EPlDZAzA1SKSBVo+e0px/dCKc?=
 =?iso-8859-1?Q?ivyhSWA36MhXlNPtORqoQadPA0yeJudJ+eWw6ta+juUaUvcQmB4vjtv01O?=
 =?iso-8859-1?Q?k8e5/ja2H6LZTtrMCjhWVMJaMtJ6o+zCSU0hub5WpNQHtamvKPwSmuWvO+?=
 =?iso-8859-1?Q?nB3sL3qqkHfszXpOvON6OTI6ZWDp/6pyebo2u1dxGIjw86R7AlU3b+Surh?=
 =?iso-8859-1?Q?IVawmZ15fOEBzfCG8zNpiWBvqSdF288cLZ+kf+sEDi0KnfmIEJntrRE+vV?=
 =?iso-8859-1?Q?HgD9/mv4nYc+q9mOX5lvV57JgMlvc2jhNrE7T5sUDyGJIDvi5oxG1oztpW?=
 =?iso-8859-1?Q?Bpx9Or1MZnWtCOLPolaNGq1vKzFKQmkW+BiThP+yzxep64jEqS7hvPzWdm?=
 =?iso-8859-1?Q?MmEv4Z23mPAFgBz3MVWWfxnNFzdgqRJhYrdTdwHq52llbDY7QMXxhc7H6a?=
 =?iso-8859-1?Q?CxV4hgbZ6IM0vJVRBPkgCtohd3H+Hy7Y0gRdb7DgZKNtoD8I9Ri2vQOdRt?=
 =?iso-8859-1?Q?Nw7Uh/HyrTj/QFziXUA1Sd4bVe3KxI5wTeY7tDssFPtTxyMPkuSHTg8n9z?=
 =?iso-8859-1?Q?P8w1QXyiwGKD6UVco9fKP489WkMUTWZ/rla/Bq3R28pllZACGbmfYrUOkl?=
 =?iso-8859-1?Q?PvfCLBcCw6PQbX4gYDY0h4stqa7HlpXN2yvpyNHaPTJ500rwoBQ86mhSxQ?=
 =?iso-8859-1?Q?34gjBTVQutjzIBVEHk+D7SvmGH5yQVUHtNxFqnw0dOwHR92o9i/FUyntRW?=
 =?iso-8859-1?Q?2tHTjLHA9/Pntcx09hmI1+5RFuFnbus5Pr5+g4v5YCFhTtBizmiIB4b586?=
 =?iso-8859-1?Q?U+HEe8oJw+8KYXhR61EVV+DFtvG/kIHfVaGqaRVfUtuspkR7J938/A/iLn?=
 =?iso-8859-1?Q?+pIk8lgy85Z9TJ8FFkmsEbrg/2bKRgVL2NdpPKP7IWPmelFs5ozwVCl/Lh?=
 =?iso-8859-1?Q?BGp39QKHhEPElG/8DZQhWhxj8nJXpFUdMQPP+LMefxLEkgUnLbzvgOXMbB?=
 =?iso-8859-1?Q?KPL17OsQ5sL4SQ0tfA22Pkadm+c1/7KtBezmJ/bwiX3jYIF+j+I3Fu09wM?=
 =?iso-8859-1?Q?nVnn4vaj+ZQvuH3lip2Hqrtmjn5OqxttnEcbeLXJI/c3RiILCCGgCJN/Zc?=
 =?iso-8859-1?Q?SwwpKgyn4xvMv7+GHl9Q8U+MVd1oFhqKW+5bTJhFHDuJa+PUUvlmYWmScf?=
 =?iso-8859-1?Q?3vLz3YN8Nyc/8qF7GADiLbWLp7zaIEg5gCvHW+GwG7DaJI?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c17b5b-745d-458a-26e7-08def535555c
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 10:10:54.8473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYS5BfUNmIDdSe6ax2i6Wq6JUekKP76t0fIBauM0cPFDVBA21eiMantz9Qz0hLmkgLVFsjdAqxBvKWUu/dTd8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBP282MB4053

On Fri, Aug 07, 2026 at 12:06:37PM -0500, Frank Li wrote:
> On Fri, Aug 07, 2026 at 02:15:22PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > - [High] Incomplete DAPM routing for the external Headphone Microphone breaks headset recording.
> > - [High] Using `system-clock-direction-out` without an explicit clock misconfigures the Audio PLL and breaks audio playback.
> > - [Low] Missing required regulator supply properties `avdd-supply` and `cpvdd-supply` in the `rt5645` codec node.
> > --
> >
> > --- Patch [5]: [PATCH 5/5] arm64: dts: imx8mq-phanbell: Enable the rt5645 analog audio ---
> > commit c3b167f1c120ceab271f952ec9169de906983534
> > Author: Rudi Heitbaum <rudi@heitbaum.com>
> >
> > arm64: dts: imx8mq-phanbell: Enable the rt5645 analog audio
> >
> > The board has an rt5645 on i2c3 driving the 3.5 mm headphone jack, its
> > microphone and two on-board DMICs, fed by sai2.
> >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> > > index 2d134eefb7659..b819e644fa54e 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> > > @@ -46,6 +46,41 @@ fan: gpio-fan {
> > >  		pinctrl-0 = <&pinctrl_gpio_fan>;
> > >  		status = "okay";
> > >  	};
> > > +
> > > +	sound-analog {
> > > +		compatible = "simple-audio-card";
> >
> > [ ... ]
> >
> > > +		simple-audio-card,routing = "Headphone Jack", "HPOL",
> > > +					    "Headphone Jack", "HPOR",
> > > +					    "Headphone Mic", "micbias1",
> > > +					    "DMIC L1", "Internal Mic",
> > > +					    "DMIC R1", "Internal Mic";
> >
> > [Severity: High]
> > Is there a missing route here to connect Headphone Mic to a codec input pin,
> > such as IN1P or IN2P?
> >
> > Without this route, will ALSA DAPM see the microphone as a dead end, failing
> > to power up the codec's ADC and breaking headset microphone recording?

Headphone Mic route - added in v2 as "IN1P", "Headphone Mic". The jack
is a TRRS part wired to CTIA from the datasheet.

> > > +
> > > +		/*
> > > +		 * 32 bit slots regardless of the sample width. sai2 divides its
> > > +		 * 24.576 MHz root by an even integer only, so a 24 bit frame at
> > > +		 * 48 kHz would ask for 2.304 MHz, a ratio of 10.67.
> > > +		 */
> > > +		sound_analog_cpu: simple-audio-card,cpu {
> > > +			sound-dai = <&sai2>;
> > > +			system-clock-direction-out;
> >
> > [Severity: High]
> > By specifying system-clock-direction-out here without an explicit clocks or
> > system-clock-frequency property, does this cause simple-card to fall back to
> > the child node's first clock (IMX8MQ_CLK_SAI2_IPG at 133MHz)?
> 
> Is it true?

system-clock-direction-out without a clocks property - the fallback is real,
but the conclusion is not, and the suggested fix is what breaks playback.

Falling back to the DAI node's first clock, the IPG clock, sets that as the
system clock once at card init. It is replaced at hw_params with
rate * mclk-fs before any stream starts, so the init-time value never
reaches a running stream.

I tested both ways on the board. With no clocks property, 44.1 kHz and
48 kHz both play natively. With clocks = <&clk IMX8MQ_CLK_SAI2_ROOT> on the
cpu dai, the mclk never moves to the 11.025 kHz PLL family and 44.1 kHz
fails in hw_params.

So I have left the property out, and said why in the v2 commit message.
 
> >
> > If so, simple_init_dai() will set the Audio PLL to 133MHz during probe.
> > Because fsl_sai_set_dai_sysclk() blocks clock changes once playback starts
> > (when sai->mclk_streams > 0), the PLL remains stuck at 133MHz.
> >
> > Will this cause fsl_sai_hw_params() to fail to derive valid BCLK dividers
> > from 133MHz, breaking audio playback completely?
> >
> > > +			dai-tdm-slot-num = <2>;
> > > +			dai-tdm-slot-width = <32>;
> > > +		};
> >
> > [ ... ]
> >
> > > @@ -272,6 +307,18 @@ &i2c3 {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_i2c3>;
> > >  	status = "okay";
> > > +
> > > +	rt5645: audio-codec@1a {
> > > +		compatible = "realtek,rt5645";
> > > +		reg = <0x1a>;
> > > +		pinctrl-names = "default";
> >
> > [Severity: Low]
> > Are the avdd-supply and cpvdd-supply properties required for this codec node?
> >
> > Will omitting them cause device tree schema validation (dtbs_check) to fail?

avdd-supply/cpvdd-supply - correct, both are in the binding's required
list, so dtbs_check did fail. v2 adds them and the fixed regulator they
need. CHECK_DTBS is clean now.

> Please check this also
> 
> Frank

Hi Frank,

Thanks for the review. I have posted a v2 including these fixes and explanation.

Regards
Rudi

> > > +		pinctrl-0 = <&pinctrl_hp_det>;
> > > +		#sound-dai-cells = <0>;
> > > +		interrupt-parent = <&gpio5>;
> >
> > --
> > Sashiko AI review · https://sashiko.dev/#/patchset/cover.1786107925.git.rudi@heitbaum.com?part=5
