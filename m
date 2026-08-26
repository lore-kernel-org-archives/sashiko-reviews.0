Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012052.outbound.protection.outlook.com [52.101.66.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7126340F726;
	Wed, 26 Aug 2026 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760000; cv=fail; b=QnsZNTd5gRfsCBIhUig23iumydgc3268j6cVkzkEyt0CM6KM+ictMT3BqPoNKLOgacfftLukldAU+PAYxft51mzUogbe3XXM6dS2XUe5HT+OCNObZ4UrIzCrI34QUSvqQu+im4echQm3qysSTph1QzUbpHgm72/78Z1O2r+LltA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760000; c=relaxed/simple;
	bh=zsm4AvylXipP/p5PpezupoFnsRxQWylqNWoA2slS7EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j7E+4eFb/quFC6gzrdowTi9dV6h2xz688FntzKB7uNw04mGkJgF/+lc/5lHv8vGfrq9h5k7EtZVMJPcpbQ7pI6DgnQrrjqTM4MtPpS5qAq3nXarN6eF68wXU02TGEW8oDAaWqiDBeOoSKYZcaEPCxTNJAaoO2/578akP9a9EPbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oVkysQqB; arc=fail smtp.client-ip=52.101.66.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oVkysQqB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxU+9H/nQCF/OxZbuJd8fTH7ZxmxLXiKh+nNxVWVQOP7lWk4WNCat/jTwYvO8TRLh4J+250ZW8HpIGx81/Yiiu35R18hb06f1UovERe/k8iUfS7qTNwjT6d+dA6BQUIFX7b9Nfac/aYdvKF2UmH4bHrEkFhAnDSZb1aNNlSTjypVlsSpYjxPXJ5/3eNPJCCjyq1J60jol5JsyD+C1eFh+m4MiBwPxNICN9RrQs13YRk+XtMdyKQg4N2EXwArtoJLN/XJS+Jz2NO74a87+zhSZipnw2SYvPwP/uER/JpN7F5mAFJpEEZ9YgtyWs4QCsd5vgBrimuJALNEYe+c0pFG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiN1jyk71nki+2XjEqKzxM8TAYZkH+OoxHg3LPtgbm0=;
 b=RdxYYDVQOsY2ouDyhdu3v/FojVqrNrEQtFsO4kY4ShqA9Zc1wu6RStIK9Wy6sBYTHJVOmIguGPcC2iYWYEAO+BS1svkkzs0U55fZc/O47Zk4Qy7cmODWzpCuc+5bNB39QJhmz8FCicObEa0tIs0R0iNQk3k+mY0axbh+CQny3U8nBeanr7APnThDl6hpj9NJRM22KUb9dnMMtYifLPbRHPPScu7us1Uw3lgAp3P2BTfH7YBWEsMOpVaRAnb9YmnTI8VKjVCYA5BRE45j6YvJtMujsCwj979FKk9MJ8OKFjdFIyYPcx+PdLjXHrWgD3eRpB7OHeOS4w4vtFBkLeIiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiN1jyk71nki+2XjEqKzxM8TAYZkH+OoxHg3LPtgbm0=;
 b=oVkysQqBRJ0A/UVav6r4UAmyldjXZBFjuUoqvcIjXGvE7ZCCwL/k4U+mAJOf3aI5ARsAIMC6GGfMCzi5lemmx09RdL2Mn5lw40DDjGL2GmFybTdiVLbniEWGzgBGKEm5IxllMf4O/WxMhbKWD5QWSd4um9LD4/QAaoRqLVtczM0yH2fNnhhw8jo1Ng2s6iBOSvmGJtWmQfPrNTLl3LBdSV771eam+fHhN9eSJBhMjfDgLC5afCi3bLBIwHfP1BIgdILE+CCwUSWnLfQi0ALEdS7p8jnmKwTd6zz+y4k6RH3azUXMGYFsg/2ht4DaaVkDx14/+cv7kZhSrgIuRjUg5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10201.eurprd04.prod.outlook.com (2603:10a6:150:1b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 15:59:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Wed, 26 Aug 2026
 15:59:55 +0000
Date: Wed, 26 Aug 2026 10:59:47 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <ao8Ncyeuu8XrmE5B@SMW015318>
References: <cover.1787674237.git.stefano.r@variscite.com>
 <749f32d1a92ec87ce76f1ac0ce0d780c431fdde2.1787674237.git.stefano.r@variscite.com>
 <20260826083133.C97A21F000E9@smtp.kernel.org>
 <ao6lTMiwplBt-4zm@GLaDOS.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao6lTMiwplBt-4zm@GLaDOS.station>
X-ClientProxiedBy: SA9PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:806:24::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10201:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f244dbc-60e8-4bea-bf65-08df038b1251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OmNbpiTU/C5Mdy0sgIpEtVUVGhSEhvMvasekgeWppmjJrQ3HFdhYLNVn8//8yrEA3b5Bf3I6rqQvzuFjWeFKUdF+0VysQ6PZ9FcYJtF8c5SSRSsT/nGDXI6UxGRUZTRZmpCn/pv28LqQKgwCMdWCKiK5cQjhtTKXScLZD3jHXLYVSvC3gcNDw12M0sMnUluvn2PIwJEUXpPW/vq/LJXDy/xf/eGutTRbVdUjDirXj9oPOh2gNOW34+weGA64UcnrkhvsV0y8PrxTMgxxFshMh+pJ18fWdKoQRpvHSUpMNlyvcTYc+XjaAXCK5REHd9NSKC2vydXybAC4wA8yz8cj6Wlj16VRuhRDBtSMR+82ODsYLPraqCAA9iQQ8CUvrfBMWY2KwWtudYWes4HBCuMaDDJsJPgbFNEPsRlfKl9mQAgucxwQLfHhs4piRJSkuRRkY7LJYK7nyZywJaU0n6Nyo8/eFYxgi7CIUTVR8Lsu8PuixDuiYYa7YSE8Tl4ShvPC4Ac2jsU0d052z51cgvzRggUlNDXF5K/GFDivE6xuOfGmvCGOYr8cTrlHhdiTyq1flyM2TRdyj/XJsTTvj3oMIHTH/arl1PseDNZSntBtmNxOYWACBYSzD39nUU/YFQ6c9kGD02y0RDqqyBvp33UTpiVBJK6QqpFdyDcn+OMQHco=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zgy+cCuHzZVz8C9sVx0EOZO7y/MenUkkpPyRFHJteFC9vXKpaSUmyWjHNhiv?=
 =?us-ascii?Q?XfMS1r0SSaJVAPeOnATFLH0ZHvu508jIpnH2UfOz6zn5tj3lg3kZ0ijErPsx?=
 =?us-ascii?Q?GWnNQedJ4dHVoklgj3vX8Q1HJcmaTj45tMq9STdqVYJzCA6dZlomxv6O4tJk?=
 =?us-ascii?Q?w0reTxuYEm7lvx8ww5FEZW69BqC+dU+MhYQUhuO3cwT2Y9ms6XBUZ5FrzvCi?=
 =?us-ascii?Q?gVu0EQboAar8rngx5ibVX+TzQkPQOMSpNBcDtgYqGLfIN61JkGcDGCKAcXK4?=
 =?us-ascii?Q?eUhOd6PAr8ZukFuA+nwgK8krH9A/I/Vi6QSCOXP1w+UpvxS0j1Rwkzmlv2wL?=
 =?us-ascii?Q?iG+m1MEp/kWV6rEaGOPvHegEAfbhxnf1GAhVneaLVhZuj4R00wv9FcZFYFjn?=
 =?us-ascii?Q?e/4uDnKXR/oKXvVovqrjWnjpccmgAefgxshEGCMEprHWEZ0GrEa8t5YCBRXm?=
 =?us-ascii?Q?579r76SJ3GLaDR+5Ip5EM/m27ZHL4DMcfsZL1rMwxftcUoukBxWtjoJDmqkm?=
 =?us-ascii?Q?ktJKp1wfis9bEJq20QLNb/xct2ESk8oBeLZjmyYs3FJv1Yczc38alAWQJm/X?=
 =?us-ascii?Q?gyj0vUktla0pumwXh1lSrj4mvsaNsxT2vyUfYR1kAkuBAZFvtz6qEG7Hj5uJ?=
 =?us-ascii?Q?0XGAr9tggdM+nBElEmo+jATmng2ZGxrOl37oXMVNAWkjcZbifuA29TXNOOLM?=
 =?us-ascii?Q?DCzBNbq9GgMm1yl5envmRNu59DVbfaIP5UElk175rIiuV+aJB9UpaHD9c5He?=
 =?us-ascii?Q?rTUSdsFwemWLO0a2VZo56deW0Ma8oyWt6itdYr0beMBTgqPxLTMXax+4QkuK?=
 =?us-ascii?Q?x32/xjTQP8ZMnrFAnCKKCFcDWGBYC5k8qkSDcUXKOI/HsYAzu3FE2QX1PmCg?=
 =?us-ascii?Q?5oSTqsJuY7/kU9u5DxKvcVKgeopl18TZ7RIV/qzYaGc0r71iJJt7WDtYNoXB?=
 =?us-ascii?Q?IPXARNzuydS4RP4rbExRWRmmqlkbB5kb7+e7Lr9tuhbnokJLRakTHdsBR6sg?=
 =?us-ascii?Q?DRJX+14S3XNEMgr5Yp2w7Yz3Sx49fqC3ZM0UGgTjNq8MlU2y+stfWfNeHn++?=
 =?us-ascii?Q?26p5Igbg++GC7HVaWuDWvH8HamBIsIT62YCwf1rfRmOj4vmFOJzdEHXMxT/O?=
 =?us-ascii?Q?qwriFw+rGpoqGZB1fsxyVwSB5ikEp68Z8sQkmm2INWTNRKSS9V/jdmqihHF5?=
 =?us-ascii?Q?nYX/kxCOpB0Bk3xJ6khABxcONeWg6R4Rd49Pea/t2RQreMggoZnA8/SuppEs?=
 =?us-ascii?Q?eXivVqzGpaenLyHsHlLFUq+AOzkEF+LxYsJlHc9/ml42JomrPLRhIqntn0DT?=
 =?us-ascii?Q?A9TLW4wlLDJDj9kbihSgsbxQqx1qqLAaYqwRrWbS9NuDQGXDzMjxJGb4aPaO?=
 =?us-ascii?Q?WNtVBRpVx4MerM8tDYk0aosZlPT9EYeKBJtdin7sHzDE0cNoCX/sK0EI0Bep?=
 =?us-ascii?Q?s5FufPFCPHQKloaNZ4ESxpFrLN+bzaTMKLBZSFBUtlHoTW6Wzr1Ze4s940N4?=
 =?us-ascii?Q?osR+rN5yCE+bTwZ1+GKYpskNHTbV26no9L7Y7eWFNxkiqkmQNGPDOlDWpOsA?=
 =?us-ascii?Q?F0KVJvOaQRwlED2zKtRxJ5/NVNdJX3u+BX+6FOo06+entkpkiX8W/KovETbi?=
 =?us-ascii?Q?Db8Bw9lfu1u+5XTYsAvBm8Wtj1tO0VHN0a3TeUW/AjlGGXvhDN+bxAAhE8Fk?=
 =?us-ascii?Q?fKjIILHBTILvoJswXc4QMxSHr9w1ga3EVNk6wMeO/O5ekcPIkhrakrGEK1u/?=
 =?us-ascii?Q?ZS/OYGZdOk90TypIc4n5l5a10MW6ftd8+HbCEjcwkulQ35a11r9B?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f244dbc-60e8-4bea-bf65-08df038b1251
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 15:59:55.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43Iu5Xk0ll8eUUvEoqHQHEDzUFr+Gx9b/GKlWoFpyUdgJ8HeGx5rvRmYzp31EYaPTonmg6rQ7tViHGDNhgl1FIYSI6AHrrm0u+Vomn0eWr6LAky/k6b7eg/vaMUutyyd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10201

On Wed, Aug 26, 2026 at 10:35:24AM +0200, Stefano Radaelli wrote:
> On Wed, Aug 26, 2026 at 08:31:32AM +0000, sashiko-bot@kernel.org wrote:
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> > > index 0000000000000..aecc8c747f041
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> > [ ... ]
> > > +&usdhc1 {
> > > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > > +	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> > > +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> > > +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> > > +	cd-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
> > > +	no-1-8-v;
> >
> > [Severity: Medium]
> > Does including the no-1-8-v property here needlessly cap SD card performance
> > by explicitly disabling all 1.8V capabilities and preventing UHS-I
> > negotiation?
> >
> > The pinctrl configurations below for SD1_VSELECT prove the hardware supports
> > 1.8V switching:
> >
> > > +	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
> > > +		fsl,pins = <
> > > +			MX7D_PAD_SD1_CD_B__GPIO5_IO0		0x59
> > > +			MX7D_PAD_GPIO1_IO08__SD1_VSELECT	0x59
> > > +		>;
> > > +	};
> >
> > With no-1-8-v present, the MMC subsystem will never switch to 1.8V, rendering
> > the UHS-I pinctrl states dead code and capping speeds at 50MHz.
>
> This is intentional. The board does not support reliable 1.8V signaling
> on this SD interface, so no-1-8-v is required despite the presence of
> the VSELECT pinmux.


Needn't pinctrl_usdhc1_100mhz and pinctrl_usdhc1_200mhz if don't support
sd3.0

Frank
>
> >
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> > > index 0000000000000..158158afc3391
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> > [ ... ]
> > > +	codec_wm8904: sound {
> > > +		compatible = "simple-audio-card";
> > > +		simple-audio-card,bitclock-master = <&dailink_master>;
> > > +		simple-audio-card,format = "i2s";
> > > +		simple-audio-card,frame-master = <&dailink_master>;
> > > +		simple-audio-card,name = "wm8904-audio";
> > > +		simple-audio-card,routing =
> > > +			"Headphone Jack", "HPOUTL",
> > > +			"Headphone Jack", "HPOUTR",
> > > +			"IN2L", "Line In Jack",
> > > +			"IN2R", "Line In Jack",
> > > +			"IN1L", "Microphone Jack",
> > > +			"IN1R", "Microphone Jack",
> > > +			"Microphone Jack", "MICBIAS";
> >
> > [Severity: Medium]
> > Does this routing contradict the configuration of IN1L as a digital input?
> >
> > The routing maps the analog Microphone Jack to IN1L. However, the wm8904
> > node configures IN1L as a digital microphone input via wlf,in1l-as-dmicdat1:
> >
> > > +	wm8904: audio-codec@1a {
> > > +		compatible = "wlf,wm8904";
> > > +		reg = <0x1a>;
> > [ ... ]
> > > +		/* DMIC is connected to IN1L */
> > > +		wlf,in1l-as-dmicdat1;
> > > +	};
> >
> > Because IN1L is placed in digital mode, does this cause the analog signal
> > from the Microphone Jack to be ignored and break analog audio capture?
>
>
> This is intentional. IN1L is used as DMICDAT1, while the analog
> microphone path is handled through the remaining codec input routing.
> The current routing matches the board hardware configuration.
>
> Stefano
