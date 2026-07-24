Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3DA3515DA;
	Fri, 24 Jul 2026 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907044; cv=fail; b=rf5gc3PA3snCnpRaT1nDvU6wvg9DfIvt7nyysB8vW7OO+NzSRQ/kIRkqBnAISh9SvuE5rTjYas6wwXmgsNqzrxwMiJyssv6N9avTitTUJnMrY/48CnFmLKI13ccOf0x+GML65b0oIvLP5XLrNcVuBLYM8xj64KZAfzizaNUJyOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907044; c=relaxed/simple;
	bh=1YaCti2jR1QJhs5/RU6ZJDNSrMJaIOkss8te7kgw/6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EvmaOxvfgkCQ07+8KAWRG+spgvqaZZWYrVvcd/k1X0w564g7U3cIcT1mqPO2ho8sTd2qq0X7UU06GM+szmSynZIkkPnAvqHP7kDcOJJLiiWGkuv7RFmiJxzyO0m4rCS3I6BuHrvlvJIrkJ0Bi72tRvmoN3eMqUGTTKEJ2s6Penk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kSG+1asf reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kSG+1asf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3ubMS8zw9g5euVBmgKQLw88/OvhdUBGNH4Qcb+HGRSiwCJPCZ3Ds1PifwzGD0eQldSlMxfsqvYPxvNf4YQX+623vw9b9rYVk4ca3pogwHUjpe+lJRqK/6nQsw3qyeo+EeDZGQkxNZkXXFcyCczZnxY18VcF2hCUzdswQCdt7F9amAWQLwBvdWoBty+22QbJpEpJfLF00YYO2g76CvoiuVuAPzsCVs7LV40nMnabyjm5albK1/o/ZzDdQFDsblBUjdhmvm11EoSHvi8aEPfv2jPOGpIjL2kDys9lTXncRujxXV/xUKjwHEoLzDFgU8mhisEHYreaeMh3qwVTOQbB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tL6y57saqTwzogPBCVMBp8TSuSkRoCOstyNGc2R6toc=;
 b=J/Eu/ydpwHMU3QQYI+D+M07xyy2qMXKfQU6IKlTotaf7oDBriHPrOFv3Avcp7EsEo8ss7hvV8sGC2B5EC7t3nQylend8Rk8KA3V10HcqTaEv0gkMuUs+bjDL2Wn96RMou3AgzKbJshrsRXshY+X0pHh51dpxmxx2T83HunxvYnMsWjHvDne64kMvbygjH3m+pTMLm74+GbcpNCZ0fAI9KcFvQA9xnm9yn1vVWjke4CMNfK2Aw5o+bgFn8nnAXi2/N4VOPXY4aJCYoRc4hKsnAUVxf+NPPa9sxKvF/fnoNnX1r3tB16P3qUc/g6Ok7RMN0ZTPl+j+qS+aAoQPlGKt5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tL6y57saqTwzogPBCVMBp8TSuSkRoCOstyNGc2R6toc=;
 b=kSG+1asf4nO5xrYI0d7AM6Kt8PJKPqjgAvkIR+/XoMeWA/Sr7Tgdia1bbt1TNVtnytSIyc7fQ5UUPvXowQzGcUGSPByEO+ofrr1WDqbLdIeG2vYYS0bxRd37llnGDk/tGCbiSoUmHIVFMhK/TF0MsbI2dVPWQmsTglcuFnckwx7kXJyQDfFQgmhslG+7KgkXRlSoUFvEHPGR1OyKoxdw17bLtrZfcxQnOyI0S0yRxhWJiOxfO4Qh5F9uVlsksOhzbOAleZyb5/bJyEqvhGDd5hMVgVWPmXtLSqV1BT2F9lqtplIgLs1dN8UIrmF83SY2JraOcz/Caol0cI1S8bJlSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB12093.eurprd04.prod.outlook.com (2603:10a6:501:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Fri, 24 Jul
 2026 15:30:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 15:30:39 +0000
Date: Fri, 24 Jul 2026 10:30:30 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>, imx@lists.linux.dev,
	Frank.Li@kernel.org, media-ci@linuxtv.org
Subject: Re: [PATCH v4 3/3] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
Message-ID: <amOFFm253o4lwhs1@SMW015318>
References: <20260724-isi-v4-0-27df7b5f6060@oss.nxp.com>
 <20260724-isi-v4-3-27df7b5f6060@oss.nxp.com>
 <20260724080342.998CE1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724080342.998CE1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SN7PR04CA0230.namprd04.prod.outlook.com
 (2603:10b6:806:127::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB12093:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb9264c-001d-451e-a6a9-08dee99883cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|19092799006|1800799024|6133799003|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	M4lv40LbXCL4eUzOM5zyczw7aJbztKoqrGLxS0809xoDPBiqgjdy9xHLRhxx1TDe6fs+NJbTTmPqdrpzlFQ7m+9eD6bCLEnU29/ipaUmG/CPQLan/mtwbS2vQusz4Gc082/NG8OhK0Xlh6beDdBwdq8BpzOGGFhQxy9nCK1+G84rgyWCvcdGmi1EYtHuXj3MlOn6ccGElxdzB0ogx4gJ1fW5mGbH27wuBkdyRrbYfVThxZNpfBqOoDjB8TwCLa5gCDwa/gYh4w/I2Z7m6lW06yKtltm7vRpDcknH+F2FINh0O1LlinqrwA8ZtoT2jiqG5PznH/E1xxeLw//fgP+6SaGnkunGAfoFPyDreKbURWKLtVI9VX6w9ffeX+wf4lXgOhbco0G17g0i8iw5XBejAGateyl39/knVKv6cWxJPM5FMm8v5hGu3r0sYOR+BW4IAGnau6u8IvH2p9d4o62l2Ai1R0QHptrE13BKpO+BEIv+BKqfXk12hGDcQ0w0s9fRToX3NWuc//djDupsuV/0PuDdHWm1HpZcy0JzacdWxASeP9kBYlmX05Sciw518rLvsedwFlFyduFxbsyniAtvx/SmKkLf33wMxaXLlIhEy08=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(19092799006)(1800799024)(6133799003)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?/6MBfTQdkDOSAHhF5726tYyz4BI3JDb1KgZkdBV3P+02lIQDPXK11L/Jy6?=
 =?iso-8859-1?Q?/i03WKTap/KPtgw7xYaOQzVRti9XRIb/cxya2nRPRlJm3ZeUhqV1X59G0n?=
 =?iso-8859-1?Q?8f+VWZQq6W+jFeX8jwvdyHLjdEgsORUZCm+1yG/s/OKziQxfD1ix3lpsfh?=
 =?iso-8859-1?Q?7WMyGkQe1Jutwq3xotquPr0/8br5iFy7Fx0+0L2Y67+KgoE/TuJpxkcZ8w?=
 =?iso-8859-1?Q?xim7sfnJ/MNIVOe+vR4tuSbmpd6kjdNhejcMS7SUUP/MMfYMRIkycE51Un?=
 =?iso-8859-1?Q?1CKF8drN7nsbtYbn6Um2xIKwz+Y1XvlC0XyNFyzYKF20kX7MCMZeG7FViG?=
 =?iso-8859-1?Q?K98bWuTA5jRw22YVRG5j0kO6ZVXnTYSh4s82NTtwtp7EM9pOF2f7NU5W7x?=
 =?iso-8859-1?Q?YFNVkkDEFw20WOy8grQ6/jImRPho8T733QR0Hg/ModaoNzTvrGE/P0fV+L?=
 =?iso-8859-1?Q?z8ZQbqXI6ogB0l6wq/eI+uCvAFL1Y/JRxC/UU4sUNSsAqm8ci7pd2yhAk3?=
 =?iso-8859-1?Q?B9iq6jTG6XQms6PBTOh83eCPuZMna/Jtt6OCCUR1lp1RgmX5oLUlfXvFiS?=
 =?iso-8859-1?Q?qnVyUzGNfqVrfh3HwqkTjO86A5omtnpc2JzDQeAd2GfVl25fazhoLCT5U8?=
 =?iso-8859-1?Q?roW43ptU1+EXzRXSn8idnvTc1PGXShejh3Ft92NjGgQbEeTsycojy4AIKU?=
 =?iso-8859-1?Q?dKvp9/niLymWHL0H8fvNIJ45d+2HIN7f42JyZo4gJwMuJwQAE8T5TOBTqG?=
 =?iso-8859-1?Q?hTfOo1RKj8yJUaIHkMGcIo3AwOBJb30DRyfbvVHiUYhJcjAZqbjn7wta8z?=
 =?iso-8859-1?Q?0O5GIcPrvDQblFL3xWKT9lvWNqFYLoqtgHJRujqigtGRBSyuRMVjfZD592?=
 =?iso-8859-1?Q?26kHbFZVrDEY5xWnVpzpR81HhCkrQUD+1x1qzJnM2k6O/U78zs4gzyQ1iK?=
 =?iso-8859-1?Q?t7daFX4EwT3lOYKiyXaiZmBGRKeEiqp/d1NhhucwgZVKQpCP8JNT6C3gaL?=
 =?iso-8859-1?Q?fiL8AqH4jsdrhmdv+ZfJOTB0OhDLSy3lZrS2tU643lnAuc7gEyD4XmCHJ0?=
 =?iso-8859-1?Q?a1047xJkg+1WP0NFCdSxIfZysiiSLzPOoKKv9Oavq9gqMe4F5k6YFKipTo?=
 =?iso-8859-1?Q?oqCLwfg3CnFcry8eBCZYo/LmhMt9S22defo8C1gcZvREv7Ek6eQl7l6TPo?=
 =?iso-8859-1?Q?h3jKljJzJLPUTVukLC3CEQlHIEm5zHQmRt5BrQe0XtlzFWJwmDG3O9JWU6?=
 =?iso-8859-1?Q?Ny3FS4RxMM5L4nVqxm70BTcJ2G/pdnqDoPXq8p7G+jwYAeUAWssFjvSQlz?=
 =?iso-8859-1?Q?j6Y0gdMWuicG1+YF5KYSMSpC/1sCoehIOxZ13e1fdYGF64Le+1w0WJPB8J?=
 =?iso-8859-1?Q?jxG/NEC4KvaZ351RYXYw/W/i5JULsNBNGaMq5S2a3eOru2o9FN+fDPLNG8?=
 =?iso-8859-1?Q?N24JoSn0j+bdYFk2pizXjCwsQLlhZe7o9kvXJk9fDT4As1fqcL+yHCJ8T5?=
 =?iso-8859-1?Q?lh3Oh/prE+HC3tm4l1yuc2+uSS4gZ1KQP3uXFsWf9YgCodrE6Wu6Rtteuu?=
 =?iso-8859-1?Q?kXw5mchw6NWTSlBTCp7uN7T3uhCZHNiKcq1BbT/QxiDDxVkReF3/R/FGZN?=
 =?iso-8859-1?Q?CmKkeADjqMZvhkG7HQeUH3pPglmCju1/g5pQBKtZMqisL54QyzyDgIqoc+?=
 =?iso-8859-1?Q?FPGwZeaOeMhAuhjGl4w31VVGczBk1fVvMUz7chUPMdA5+rRpuuSlITR280?=
 =?iso-8859-1?Q?gxBvHma7UgX/1r11uYecMoZha9a0O94dKEOFlbXe1lxcUU8zbQdqpql2YU?=
 =?iso-8859-1?Q?AEn7iqnjTEk4BE4GkyxWF0nwuYmCxqBm5s3I/Vk0JbyVrld73Yke?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb9264c-001d-451e-a6a9-08dee99883cd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 15:30:39.1877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ra06jqRVr3/YTlucsm9aQXpdgFY8fEPIlJit+us4O8ZCzKDpmRoV8euJptSOJwBWzQ6RduDzjCrHRxSPEGl7ZYx7lYfNTeTVkzWI6zc9AHI8D/HKrsdG4AYHCdJiwv8s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12093

On Fri, Jul 24, 2026 at 08:03:42AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] V4L2_PIX_FMT_RGBX32 and V4L2_PIX_FMT_XBGR32 share the same isi_in_format, which will result in swapped color channels during M2M reads.
> --
>
> --- Patch [3]: [PATCH v4 3/3] media: nxp: imx8-isi: Add additional 32-bit RGB format support ---
> commit 60dac66057b0040d017034c0952f79ec30cec366
> Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
>
> media: nxp: imx8-isi: Add additional 32-bit RGB format support
>
> This commit adds support for additional 32-bit RGB pixel formats (BGRA32,
> RGBA32, BGRX32, RGBX32, ARGB2101010) to the i.MX8 ISI driver. Formats with
> an alpha channel only support capture, as the ISI ignores alpha bits when
> reading from memory.
>
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > @@ -166,6 +166,57 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>
> [ ... ]
>
> > +	}, {
> > +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> > +		.fourcc		= V4L2_PIX_FMT_RGBX32,
> > +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> > +				| MXC_ISI_VIDEO_M2M_CAP,
> > +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
>
> [Severity: High]
> Does this mapping for V4L2_PIX_FMT_RGBX32 swap the red and blue channels
> during M2M reads?
>
> The newly added V4L2_PIX_FMT_RGBX32 format (memory layout R,G,B,X) maps to
> CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8 for DMA reads.
>
> However, earlier in mxc_isi_formats[], the pre-existing V4L2_PIX_FMT_XBGR32
> format (memory layout B,G,R,X) uses this exact same configuration:


Is this true?

Frank
>
> 	{
> 		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> 		.fourcc		= V4L2_PIX_FMT_XBGR32,
> 		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> 				| MXC_ISI_VIDEO_M2M_CAP,
> 		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
>         ...
> 	}
>
> Since these two formats have opposite red and blue channel locations in
> memory, can the hardware DMA controller correctly interpret both layouts
> using the identical input format configuration?
>
> It looks like this could result in corrupted color conversions for one of
> these formats during M2M operations.
>
> > +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_XBGR888,
> > +		.mem_planes	= 1,
> > +		.color_planes	= 1,
> > +		.depth		= { 32 },
> > +		.encoding	= MXC_ISI_ENC_RGB,
>
> [ ... ]
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260724-isi-v4-0-27df7b5f6060@oss.nxp.com?part=3
