Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A58638399E;
	Wed,  9 Sep 2026 06:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935171; cv=fail; b=QGw71wZWT7aYD2lsUV5IMkqPVqpVWit51aRLk1S9yT+9OAbPPqOBrA4RVzKNXJvrO1pahtSmRt0OvPYbhxCBrZznS1Xl1iAov80R1UGe+Z1yAPf+/MCEEhq5CvAoDe43mzcYFBjCXk4JTiIVuHv1YXDejlyVF+B3hs57ARIsTwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935171; c=relaxed/simple;
	bh=ouaTq63aRnRI85nC+gqSNns27b5jkt5TsZ6k4p7BcfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qWa8kOgGRxVYUZa+ArfRiSDpG13N0k8w46wcjEB6KRPYCEHeabzTA2GQ2K6plIKtyDmC5wBE+NCzATs1x/RgM+8VqZjeWvD2Q2BgXELqOi89LjzgZwrUPzmYb+8zbee2plCX3tOnB7xgZvcB5uzVpPdcVs3i9hFoLsj/TNRARw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=U5/05L55; arc=fail smtp.client-ip=40.107.162.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="U5/05L55"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyYY8tFHvUOtr9kFQDZAajoHaanbRY/B7hx9TVJAtfoeAJdwCk9EVBk4JYqrddukYbtZclSF/j+kR4Y1KGyW0FpUJ+o9U2/mQ3BQ1z7DB70DtDQbgGMrIeRcGphosKkgR160iVtGJrZ/MH1YsdsLd1xtlgenfuRwAA5f3wDn9hyoAGKmn+hh+u/Cr4aClAE21XOJHDF/PDyr2iTVwzJHIX2DBcYRNiP8AXqm6NaDssgLWQumnw4ZueJEXIodMIJfGbkU+3WL/vr04OsWNvxjZvwVQEi4zwh0NxLLrZGwhHvpFXCGCG9PAHKCXXkVHcCdt7cJkztnTvSmKc/RGaL2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4TS6B831X2XvhO/saXiOYzhd2TO/vtyMa8/cPWb+S0=;
 b=yEWwZXCcur6iX2zAkotH7hCqfihNQp+TmPd/e5x/CFVAgs19ynb9egvEbmwn6t75h9MyP/5acowgYfZqJdmbpMRNu14O+j60SwrnQMEHkTA4aBN7FQWuwQ0sb6quSEntwIAaoY6Ng+nmE8oieoTbvaIlKnziocjpWAW2e1fyizBv7DVOvNOEdmgV/0jViW0H76T9SUCn6ZH7lOtjgEwU0G/TO3XSxT/TbaiR1LLllifOFEKVO2bqr4OfV+AF55IiFd9nyEMow2a+0w9jp8iBGvVu1X1IcHu+52uJ684d3CeV5+moLDFf3mJtgu+qBnUl4jAAFnfpnkJ7ajrLOS5Lzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4TS6B831X2XvhO/saXiOYzhd2TO/vtyMa8/cPWb+S0=;
 b=U5/05L55zukK75N1bexBfHIoksSD9BoD+tgwDoTdbVsmTt3yZs1lUlibXMDS4gqBrncNP8HKvb7WxmgWEII9tAmqgEkkGOTRIdpU8O56swcOeJ8KteobpC0b/HxEakS63uXmkdHcS2nahB0DOWfLDUEUBMK57tNcUT9sWP/pBsxJP2MSlvleTd+eGyDLkkYVYeUZd4xXt7iHVEA3iEtFDs/GLlhx1+XuM/B1OS1/wDm7ZtjxdutMIHFOz9ituYKcDCs7um9JrzJv5TzakSu4KYY7K9aTGRPP62bqXNmtidPWPl0I6TQ1nMOcwO92l8mJFRCXADo3yD727MmwU4tCSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by DB8PR04MB7145.eurprd04.prod.outlook.com
 (2603:10a6:10:fc::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 06:26:07 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 06:26:07 +0000
Date: Wed, 9 Sep 2026 14:30:18 +0800
From: Bough Chen <haibo.chen@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev, mehmet.fide@gmail.com
Cc: Mehmet Fide <mehmet.fide@gmail.com>, imx@lists.linux.dev,
	Frank.Li@kernel.org, brgl@kernel.org, linusw@kernel.org
Subject: Re: [PATCH v5 2/3] gpiolib: add get_config() and
 gpiochip_generic_get_config()
Message-ID: <20260909063018.sajfn5vjk4y3oyi2@shlinux89>
References: <20260903075940.2089367-1-mehmet.fide@gmail.com>
 <20260903075940.2089367-3-mehmet.fide@gmail.com>
 <20260903081432.278721F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903081432.278721F00A3A@smtp.kernel.org>
X-ClientProxiedBy: SGAP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::22)
 To PA6PR04MB11909.eurprd04.prod.outlook.com (2603:10a6:102:51c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|DB8PR04MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9d14d7-df8a-43c6-ed9f-08df0e3b3b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	d85ztXW0rYzAhzkdy59miyNlxPn0eA2vprB35ySYzb9tc+WRsuH/64xEeDfxscce38AwsTTsaIw5CocJnZd1cDVzYc3hhs9F61jPSAxKQPD8Bc4NjzcRmGt+X8c51PBpds5ypzTnUcXWheLPISTkp6kCFG4NRzEn5C2c0s/dNw7fEPSkD7Wc4JGrU/7XgPP/oLoGVrFxScfXpWOfvAhvlyjZ+ps4mSoTtIZfrEsLHlVXS06MkaenEaSWcaE2gP27e29Td8m45vD1JXLULmAkPjzEMPQpRTo1N7PGM+Sdc5gKFYdmpF6KS7rC5LjTULPzBkm6rWfgbdvhot23Xq3of9tkIN54ip403ZAEg2tVum1pN3QwL4hEo+3EDlhAYYmmNdJt0RYMBhDgfq6UThYVrUgK2ycnjQxgNn5MDFcHpqfMRSYaS8cr9T26A4c7DzDPK2eVxEbwtt9kL19V9ZsIgj1PQnd4PjrkPtTV3wtXH2opKNSyc+1B15RkoK2EVbNSQu5pKSlnNJiiHpjmmCQfZjIK1eGbam2s/GQutaroDruL0Mca5882++ytGPEZ1b8V6pDAtLlJgHg4Np2zUlkZqwjEE/a18zqbhgVfzpTomFQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk1jMUxQT3hOaTVCanlZY1hWWWthZDNjSFdMbHYrSXNlNU80dyt1aHFpaTk1?=
 =?utf-8?B?NTZmeXIyK0JRV1g3b0VUWmYyMTlYRDV5TFBMTFI1QjdYWUNHOEMvVHhsVmhl?=
 =?utf-8?B?dDR4YWNZN0M0YzFhaG5YU1JSZGdrT29iQURKbVRvMW1UbVJZUW42c09TdjU5?=
 =?utf-8?B?a245dGxoWWFzQWFOak5NcjZreUJtQ1pIUCswQjdIUkEraGR5NjRGTUJhZXJs?=
 =?utf-8?B?bjhZYXV4eTlsNEkwYWt4RW9nZlR0SHJXdzc3M3BQV3dXdmpiRjZTdEJsQjRB?=
 =?utf-8?B?RFZTTzFneklMemo4RXNSc2k3QXhtbXQwd25zOXdJMEIwcW9pUHJMc2pjYjB6?=
 =?utf-8?B?U2F0MklQSkFDVGY5OVo0OEpjYVRZdEdQaG01MkpkMnE0ancrOG0xQlNWNkQ1?=
 =?utf-8?B?dERYNjN4VEpPSHZsVmxwc0pLOHlPak1FekM1ZWo0Z0hHWC9rRjdCdGRYZkoz?=
 =?utf-8?B?a1FNcXR5MkJuNUg4eGd6ZnM1QzNTa3lsT2NMbVhzYnlBUmJsb1h3TTBXWDNX?=
 =?utf-8?B?cVNqSDNLSVhJWWhHS0RJWEwxLzc1blZIazlnckdMOExzZ2FTaGpja2VXWStN?=
 =?utf-8?B?UzZncFFXbjh0VVNVQTJEM0xJYjlmSWVlZ09SM1FHNmxwbGpMZGNGK05HVlR5?=
 =?utf-8?B?YXJWVE91aHNtL3lYU3JNYStBRC9OYi9CZTdBVkYyZWNlenZwbU16a1ljV0xl?=
 =?utf-8?B?VmlKaTFVYy83b3FGblNKMXlBUnA1SlVWOHIzenFUTGF0VFI3VmQ5TGwyUC9u?=
 =?utf-8?B?VG1RMGJZakdlNE5NdnEzUERIVjQyU0RkekRla3AvYjEwQnBncGhkMCtCTTFN?=
 =?utf-8?B?eVMyZTR6MlpVNjY3RytaaDJWamRXYkw2VCt1b1lveTVvZ0IzR1dPYzBOdDRz?=
 =?utf-8?B?dmFIY0wvWkQ1b0s2V21CZWJncm1DYlZGZHkwdHNpU0h0S3RHbUdsb3plUHVy?=
 =?utf-8?B?NHMyN25sK1NuWU11dmVvZ2YreEhRL3dPeTA1SzVtK1Jobm8ramN1UmpjZjlY?=
 =?utf-8?B?MUNlSGNlVDQ3ekxOVi84TlJINHd6WXFra2wvZWhHK25nbFJuL2R0VUtVZkdP?=
 =?utf-8?B?RlZzZ21pb3U2Ui81b21TTnZ2TjdvZThGVWhwaExwVmx0NllqZEJWamFIZzRh?=
 =?utf-8?B?aVovSTVmOHZQdkVDOXhPeG1jNHdKNy81aHhHMUZQOVh5SU5wRFN5QjU4NnA2?=
 =?utf-8?B?MUdOaTZqN0lzaERTYjF0MEdqMG5UVjYwZHQ0ZUdZdGN3WXo3VnBuSndsVnBw?=
 =?utf-8?B?Q0plaVFzeTRWZnEwVWtsL1J2ajR3MUptMlJ5eVN0aXVWTWQwcjJqOHE2TUxj?=
 =?utf-8?B?RFVSOHFLVldXQXVtN0tzRHpHcWI1Y3JCZHlYZS9XaEJEYWxqUHM5c295WjVp?=
 =?utf-8?B?UlkrUzgvZDBrNEFJOG1Ka3h0OG1iSXJpOU14UzgzUUVTcmVpcVNFM3dSSHJY?=
 =?utf-8?B?Zlk2NXZvaE9ZZityb1NlWDZnK0UyZjY3U0F0SVFSY2d6Yi9FRnI2a1h1TGp5?=
 =?utf-8?B?YUo5cEVEWVlxSmRFRVdJcXcwRXZ3VnR5enNaS3RmcWRmZlFNUTZBS1RrUFpF?=
 =?utf-8?B?TS9RRWlNWC9DblFhYlNkbkpmRGdwWTFvdVptdFJnSXpiQlZ1N3ViVC9ia1ZN?=
 =?utf-8?B?QWQ4QWlTZTJSb09kU3ZJWjRvY0ZjcWsxU0pERy9rUjZVNHlPTVdsNjhoTysr?=
 =?utf-8?B?NXJuNVoxQ211U25lU2NGdFlZeG81aUxad1dyNmRyRFRYdmxiL2EyMFdhTVhh?=
 =?utf-8?B?SGtXNHg2OXdjbHc5SHdlNmg1NS9ITnozUmRJczc3TFZjc0pibGNzbjlMOUxl?=
 =?utf-8?B?MDFWNGw2TmFBZ0hsS0hORzFMU09GdEU0MHJTcXhIVDZQWlFGNWlXRnFER1Qr?=
 =?utf-8?B?cmdVenJIZmtPRzJaWFNxaGFFQnBPUUZ3S2p6ZWxxQm44QkI0VFg5Y2Rsc2NM?=
 =?utf-8?B?VlczTjlQdURiQ01aTi96c1JUU2lxZHpicnAwaEpkK3BrdE9IKzNIKzhkMkJt?=
 =?utf-8?B?cWtaTnJuUzhXalp6Sm5IaXNvaUFRUDFHOHlUN0ZiMDB4dGRBYkhXWGRCU0FF?=
 =?utf-8?B?MExSTTEwNkVDMklvY3huSDBKZythbWRSaU5IQkhTVWsvdkdpZXBUcHdxeFhs?=
 =?utf-8?B?eU9YZmc3Q25ZeE4wdW12UmNJcGE4UDluYXlNZm9SS1pCUFZOWmkrWUh5Zklk?=
 =?utf-8?B?VWpSdjFtK3k2Tm85K3Y1a0I2RnQ4YTNUbmVCczFkREtNQWxseE1LOWE2WU1k?=
 =?utf-8?B?c0o0UzEvZ1N4WDdBV1h2VGpuVDNSSFdUYldHWTJ6UEhOa3RnNDE2NlkyNWJ4?=
 =?utf-8?B?SURGK0lPZ2NmcURvUDI0U3pPN1JMT2FpQmNXRnBPdzY3bGRHRVRsREVYaFJ4?=
 =?utf-8?Q?UccyBsefKV6YwrtJGOTps7L99VfMHNf8y5NSC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9d14d7-df8a-43c6-ed9f-08df0e3b3b1a
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 06:26:06.9523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+iNN3Hit4BYxLT8RCeu2gQR6NKTaL00JYFU2I8SYPxwVOJ0HdJ4WhvecjPgUJ+ZlN+/1gchP0AIqJ2xD2nThM/UAbL1BkwGImAJFGJwFjeTBzsDRkYXYzgWkHB2GeU5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7145

On Thu, Sep 03, 2026 at 08:14:31AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The fallback stub for `pinctrl_gpio_get_config()` returns 0 without modifying the output `config` parameter, causing callers to use query enums or uninitialized memory as hardware states.
> - [High] `gpiochip_generic_config()` returns 0 (success) when `CONFIG_PINCTRL` is disabled, silently ignoring hardware configuration requests and creating an API inconsistency.
> --
> 
> commit 5e30160f0acecf52b9ebfedbbaf09c6e99e8ce08
> Author: Mehmet Fide <mehmet.fide@screeningeagle.com>
> Subject: gpiolib: add get_config() and gpiochip_generic_get_config()
> 
> This commit introduces a new get_config() callback for gpiochip and provides
> gpiochip_generic_get_config() as the generic pin control backend implementation.
> This allows a chip to read back a line's configuration, which is useful for
> determining line direction when the pin controller owns it.
> 
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index ef8ccaf17c9ce..fb3ef6754a9ee 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -2440,6 +2440,29 @@ int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
> >  }
> >  EXPORT_SYMBOL_GPL(gpiochip_generic_config);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but right above this new function,
> gpiochip_generic_config() delegates to pinctrl_gpio_set_config(). When
> CONFIG_PINCTRL is disabled, it skips the pin_ranges check and calls the stub,
> which silently returns 0:
> 
> include/linux/pinctrl/consumer.h:pinctrl_gpio_set_config() {
>     return 0;
> }
> 
> Does this cause hardware configuration requests to be silently ignored while
> reporting success to the caller? The new getter correctly avoids this by
> returning -ENOTSUPP when the backend is disabled. Should the pre-existing
> setter stub also be updated to return -ENOTSUPP to ensure consistent API
> behavior?

I think Sashiko is correct, better to aligned here, but in a separate patch.

> 
> >  
> > +/**
> > + * gpiochip_generic_get_config() - read back the configuration of a pin
> > + * @gc: the gpiochip owning the GPIO
> > + * @offset: the offset of the GPIO to query
> > + * @config: the packed parameter to query, replaced by its bare argument
> > + *
> > + * Returns:
> > + * 0 on success, or negative errno on failure.
> > + */
> > +int gpiochip_generic_get_config(struct gpio_chip *gc, unsigned int offset,
> > +				unsigned long *config)
> > +{
> > +#ifdef CONFIG_PINCTRL
> > +	if (list_empty(&gc->gpiodev->pin_ranges))
> > +		return -ENOTSUPP;
> > +
> > +	return pinctrl_gpio_get_config(gc, offset, config);
> > +#else
> > +	return -ENOTSUPP;
> > +#endif
> 
> [Severity: High]
> This is a pre-existing issue, but I notice this helper explicitly works
> around the behavior of the fallback stub for pinctrl_gpio_get_config(). 
> 
> Since the stub returns 0 without modifying the output config parameter:
> 
> include/linux/pinctrl/consumer.h:pinctrl_gpio_get_config() {
>     return 0;
> }
> 
> direct callers (such as pin_control_gpio_get_direction() in
> drivers/gpio/gpio-by-pinctrl.c) are left reading uninitialized memory or
> query enum values as hardware states when CONFIG_PINCTRL is disabled. 
> 
> Should the root stub in include/linux/pinctrl/consumer.h be fixed to return
> -ENOTSUPP directly to prevent other callers from breaking?

This is also correct, and more critical than the first one. If changing the
CONFIG_PINCTRL=n stub in include/linux/pinctrl/consumer.h to return -ENOTSUPP,
then I think you can drop the explicit "#else return -ENOTSUPP" in 
gpiochip_generic_get_config()

It depends on you to send a new version or a separate patch for this.

Regards
Haibo Chen
> 
> > +}
> > +EXPORT_SYMBOL_GPL(gpiochip_generic_get_config);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260903075940.2089367-1-mehmet.fide@gmail.com?part=2
