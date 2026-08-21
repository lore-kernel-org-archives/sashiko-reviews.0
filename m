Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010030.outbound.protection.outlook.com [52.101.69.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040E431E821;
	Fri, 21 Aug 2026 14:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321664; cv=fail; b=ZlykPlczyd6+Fm+8TMPB+EIK531Lfd9uR/Sgt8UM1UwMaiLNWNnrkH420Zn+sQ/upt1jeq6GhkW2JQ7GTf4NU2+7eseunvrEXGNpSbjeMiHh0o3QPttKmTQtuqbHIPwDYxsQXZ1VLkQCBSuuQ1Mm5NA8/7xGI9jGGGRl0pKIoZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321664; c=relaxed/simple;
	bh=HfeUJyWcEkAyGXoMmo79wy9yI4EmCqZ3RfwAMd148vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YLyUV2k9cUPU37LTE7ufaFO3tqmX58MQDKCOcuEQtkgJLTbnRO9ijW0HbHvQOr0oBPWu5U+I+rA/NW1OAwQGWgVjnLzHEE7GyhnG16Hb4NQP250JGg9WtptrkWNPMfvrHJSusxP9PpLZeE0UNhms9fgcOsSFLwS/sGQ7OhH3Svw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KMvW7f5D reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KMvW7f5D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7nbIwHyRP2XYDXunLRWCxeb/5bOC9hNHPh54AtTtLHiwPqxd7nnY31beODmEC90iej5HdIkfVgNgrCt8c6/1Xeir1JTsY0YkiA0U3pbNhm7hBqjgNMBhCdaTt/kOw9TN9VE/MTOj8fUnCkPmXZNf2PSXJubK7oXZPx8i7ZVi9zvJK4VLEFHXbqZJ4232h/rLy9UkQ8/Tm1TKL5RW/woGeaUDvA4s77l+qBJ3TklnzRqAXN6zYOssMhkfEEC4Cq16qJxai6X0FB0VyRSoIDuJrhjs0jtAyYX9LForWXurcluIWMO/YNVxqHgxbFC8ndqTiusVlydLH35n3ODwUrL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAZ6seswxuRiw+ttABEsF0phIRmy30movO917BbLOso=;
 b=XCEkw1j4jYfYcRDMhSzRWJ8O135CSL0kzW+kr7iNmpQAdxEEkGqdfzlOHPo62Za0cuEZz6uIqQU1yIx6jOTJ2EO0nQtV8FW5M5O8kIDZ0AkewLohjzmcK+ndgJsrhn1jNOTYhendery5yJ3IKfDyTWeejsp5GHV6SICfH0uuXiWrPbNJLb+1n7dIMsRYNUSLoPRazOFEmYkh+hgXnIrm6TigVPHNpybLa4r8ddnnAZsSOvATuRsxe8e8QZob2HmuNCKyl8CaWqZSvLycJ5Cas8BBgEfpEAVhud+EEIVptAUsZI+7C22TdJeOsNv4XIjg2JOlonIQbuh3r5gg3ObIlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAZ6seswxuRiw+ttABEsF0phIRmy30movO917BbLOso=;
 b=KMvW7f5DmKgjSo95uBLMjmfcXJ0g/erZWFTxc9dIdFCEJ0u+7Pm7SGfmsWyJMO54j3AgqXFnsNQoMmElJ2Ex8HkSo5I6z75+hMZTtpiofBH0obVRHQ+l8SYsNjKaDz4ejAjUqbbq3Ixzxp5Q6n9Nhqb0ld3eR1ASMGCq0fBRnUrAS+rzo+cVtXLbj8Dy5BpviWZgBJK+7GHxQkGU5pTNXuPI7jxifgKLtArB2OZWRGVlNJitXaHIXmYs5lZ/1RkIbNDe3yNj3HjXOlq9wUW1gJrlvb1D0WsajAlHdvLLn93qkakiAA0asJfrdQ2vKADPUiS1xW8JuDrCrEL0ONOpmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7125.eurprd04.prod.outlook.com (2603:10a6:20b:121::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 14:14:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 14:14:19 +0000
Date: Fri, 21 Aug 2026 09:14:11 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, conor+dt@kernel.org,
	Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <aohdM1PmiT4loOz0@SMW015318>
References: <cover.1787314780.git.stefano.r@variscite.com>
 <d709664186f2a85b6c3173b5e5a8a297464fd7f7.1787314780.git.stefano.r@variscite.com>
 <20260821124107.DA5971F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821124107.DA5971F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH7P220CA0099.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7125:EE_
X-MS-Office365-Filtering-Correlation-Id: 423cbe27-096b-4106-5c3e-08deff8e7d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|1800799024|3023799007|6133799003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KkgQBhjs1bwy/QbBR6QG8TSDRtEVRx/k0nupgHJbfZDjAxOIxvRdT8VzGbqZ7sqIerHVGS6KkEbjp//jvo+u2qDIqA167y7wAeBTwsHsNR3vlQ9cSpCHa6IAHsx5HZae6AUKiWHoS2LFNShELnctGrCR5qgdNXSNrqa6SMlvYCTfq2+AJmiJ0TK4AO7pjH350PrZOH8Y/knulfz7GPgba4l0euASL7uEHSzlsS+iRqFTk/PDyMGZbz5k8jQvarLM29U4GEXqKo7uYRPuAVUs2jCW2hrSXLt2v309wJ+azajVMhFSzsHxzugOexak3zAjbJMsD2IJiDLfKrdHZAgM2G8yBctMqUcqKcrT+MOztwkDttZMDwH6waMFvAu3dolNDnoKgq+tW048sDgtYadoQWuaA6FeXup0/bHjYLXdzairPbwg/Xa5Q2bWmdpkOXbwkF+PczdfvJIBHeyt4z6iPJDuXbEDxkc9VtgcP7XBEKHEKKzxtWbAB+7k1LbjMhi0rIFZNyMlEe68r0lApWPx50IN2KPRV8erd6AscOieiDl4hw5TJPmHz2uPAMw7CA8cifz05Wj/vs5D6QPgh+Ww3rfcRU8xbzzX8A7QC84bT2I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(1800799024)(3023799007)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?liak0WslHGRZeIFbLE/spMUlTQXYPNWc7TKxwFwrM+I6+JZIbSi5unJq5v?=
 =?iso-8859-1?Q?rQh4ysZrhkHOuPLJd5D58BYrzdwcE6o5QJl27ZUnLVHXXLo827XDGRdPuQ?=
 =?iso-8859-1?Q?7+VkHUw9EDMaUPaeekXftlsjyC97Jo5V8W7hj4OPj3AfKcfAi3m7s8f/59?=
 =?iso-8859-1?Q?5lV51boc7o3E0nmeZ+2LY8nZNoKcr1Q5jwWnMPHfOErZ/2EtSLmNdKTwba?=
 =?iso-8859-1?Q?6ApQ7iMYCwBo50KFRfrSaMYNEpLen0GOJUem5d30vk3tM1GNpRSlFjr04T?=
 =?iso-8859-1?Q?RC1G0WeeqkHlICX9uMJ0a+4ny5NmR62AIpoLa+yOCg356NwFXy6IA5WCO+?=
 =?iso-8859-1?Q?m+0iuxOk6djulBOgQw4mDsyKwKsB4Y0zqPGNSmb7rtDpjRMjweW7SyVKWr?=
 =?iso-8859-1?Q?/dpb5owSkKNM51nx2wIl6/rJGGJwIqzExbbb+3s2j+51k1ml5b6ZPcwfSH?=
 =?iso-8859-1?Q?OVaSprGD4k8fcrt6QEc1+jnr7LuGpM4wXcM0Xc05UhgRJMnFSFgu/oPBmp?=
 =?iso-8859-1?Q?yOTmah2ZapOLF2Qi2EJaFjL6KNJy8mE5TuLatKJp6J+VfA/Xd7PNb+/+Z4?=
 =?iso-8859-1?Q?2q+XKxSw30MS/cnmgPzPlf+/6epnRphni/cT4n9XzR5PP4Frzuc9pKVvzv?=
 =?iso-8859-1?Q?mqliYJZczQeox5x3Qwg93sQrYR8nijxblTmEhFQ1ytBvcf1Oh573DkJhmb?=
 =?iso-8859-1?Q?TWoOigc5Zqdiw2/eJuE8nWFoN0H0yrb/PoQG+s4Hfq2FjaDLA0E6jSoLpD?=
 =?iso-8859-1?Q?gWEunCRBdl3hv+tGrKPPF1n0m0GScgPUrjH2eYRETP1tN5g/3YRcbvipij?=
 =?iso-8859-1?Q?UsASXZlHMUxEV6/+H6MA74e+bJjJUUnAiTVMM0jcU91dd9PTfjgQKxFjZo?=
 =?iso-8859-1?Q?qiz2mg3/4KYFjrV+ErqCZkzrzPdTeisC0MHKZIJHH00lDNlLoVAlGVsnGI?=
 =?iso-8859-1?Q?PLzxmB6zxCqP6g84U5m9L12RkN+ynJZ8o2Ux4QIgMqBnsg9M6ptaASvyXl?=
 =?iso-8859-1?Q?LyGO2IAX0YPtJhcde9zYAadmzCXz514qf9QxeOW6hCsW4J/z2ieaQRRW5t?=
 =?iso-8859-1?Q?aXqxm+OUYcELrUo3Ew/pFYm4QZvZKIMiDot1zD6WQRRTJ5ezXZknYDgdhn?=
 =?iso-8859-1?Q?i1tx84A8Pnde0jz16gT1itseg/8EGC9yyIM4JyiGRz7GyJWixr7ARmLlM2?=
 =?iso-8859-1?Q?bTez9w4OB5decfXAQ2iJb54KVbTBenjWre8ue60/D5IZtG0JIeBfBX+tUg?=
 =?iso-8859-1?Q?ICu34mjEnzXUdaG4Xa2JBlepAWHyZ1F3TNL4G+wRwHwX/g3cfnXNKfIZTQ?=
 =?iso-8859-1?Q?U/Wa7bFNhiE+zcxlzmpKOZePQrRWxXirhMt84cb8zfYgUz7tbc+3v+IlfP?=
 =?iso-8859-1?Q?zNT/7MVHasGxa5eeYRFgUOgT/L6Maxzascu5hRhUHWC6HuIK0Yw5AxvTvz?=
 =?iso-8859-1?Q?7S7CKtNjnVbKewz2Zh3KIjuvA5yXJ3Vvbq5xrM0WORczMj4QMn2kLrd6ZN?=
 =?iso-8859-1?Q?/qEcWa3qy1rWihwobtRNTOpORlvpv93sE2XlJgTB5McodAfzxJ7ehF4ghX?=
 =?iso-8859-1?Q?Vc+Z9hL/NW6iXAdMB9J0iUE9thnSRAFBv2Q9JB8S6cMZyBipfCR8Iu9l60?=
 =?iso-8859-1?Q?S6jDt9e27otcWvAIw7EjAZcGTR7MA9O2FoNInbKeegB/PfDa+vVmLpgHRk?=
 =?iso-8859-1?Q?tWTKgyytJw1ubCscdDjud+M7PUnuYtHrVjXjvqOfp0bHsUINjD2pzWErim?=
 =?iso-8859-1?Q?SqjqTnn4K3Sn9ZxEW6Ex08VEu1aMcsqOccAqmyoecEP4mu/bY9Ux5rdqU6?=
 =?iso-8859-1?Q?hg8600FS9zKSwxXKU4nT+H7/4SF952cvbCwYGG5K919wt5lw0HNC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 423cbe27-096b-4106-5c3e-08deff8e7d72
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:14:19.1177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zASLkJ3nS3p8NHP69EGtNWs+jd34ErHh5R71Y0UkRapAZc5CcO4z9+S0qI3ZJ/a4lJMYGyLo5vAkwBVtJMPzTk9St7OI0MtQhJxvxddovaLbJPY+WcJ7X2Um1j+41UyE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7125

On Fri, Aug 21, 2026 at 12:41:07PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] The Ethernet PHY reset pin for `ethphy1` is muxed on the `fec2` node instead of `fec1`, causing PHY detection to fail during MDIO bus probe.
> - [Medium] Use of `IRQ_TYPE_NONE` (0) for touchscreen controller interrupts.
> - [Low] Duplicate `assigned-clock-rates` property in the `&sai1` node.
> - [Low] Attempting to delete a non-existent child node `bcrmf@1` instead of `wifi@1`.
> - [Low] Missing required `color` property in the GPIO LED definition.
> - [Low] Use of deprecated `reset-gpio` property instead of `reset-gpios` in the PCIe node.
> --
>
> --- Patch [2]: [PATCH v1 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support ---
> commit 910d1859fce3905900b424cb29918719c63275b0
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
>
> This commit adds device tree support for the Variscite VAR-SOM-MX7 system on
> module. It provides the common SoM description along with configurations for
> eMMC, NAND, WM8731 audio codec, and the V2 hardware revision.
>
> Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> > index 0000000000000..82814535fb93e 100644
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> > @@ -0,0 +1,378 @@
> [ ... ]
> > +	leds {
> > +		compatible = "gpio-leds";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_gpio_leds>;
> > +
> > +		led-d10 {
> > +			function = LED_FUNCTION_STATUS;
> > +			gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "heartbeat";
> > +		};
> > +	};
>
> [Severity: Low]
> Does this led-d10 node also need a color property? When function is
> specified, modern LED bindings generally require the color property to form
> sysfs directories in the format color:function.
>
> [ ... ]
> > +&i2c4 {
> > +	clock-frequency = <100000>;
> > +	pinctrl-names = "default", "gpio";
> > +	pinctrl-0 = <&pinctrl_i2c4>;
> > +	pinctrl-1 = <&pinctrl_i2c4_gpio>;
> > +	scl-gpios = <&gpio4 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	sda-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	status = "okay";
> > +
> > +	ft5x06_ts: touchscreen@38 {
> > +		compatible = "edt,edt-ft5206";
> > +		reg = <0x38>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_touch>;
> > +		interrupt-parent = <&gpio2>;
> > +		interrupts = <30 0>;
>
> [Severity: Medium]
> Is it intentional to use 0 (IRQ_TYPE_NONE) for the touchscreen interrupt
> trigger type here? This can cause the interrupt to be unconfigured or
> incorrectly configured by default, which may lead to missed touch events or
> an interrupt storm.
>
> [ ... ]
> > +&pcie {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_pcie>;
> > +	reset-gpio = <&gpio2 31 GPIO_ACTIVE_LOW>;
>
> [Severity: Low]
> Could this use the standard reset-gpios property instead? The reset-gpio
> property is deprecated, and dtbs_check validation may emit warnings for it.

Yes, please add reset-gpios under pci port (&pcie0_port0) for new dts.

>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
> > index 0000000000000..724aa6fb36de2 100644
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
> > @@ -0,0 +1,64 @@
> [ ... ]
> > +/* WiFi */
> > +&usdhc2 {
> > +	mmc-pwrseq = <&wifi_pwrseq>;
> > +	/delete-node/ bcrmf@1;
> > +};
>
> [Severity: Low]
> Is there a typo in the node name here? The node defined in the base dtsi is
> wifi@1 (with the label brcmf). Trying to delete bcrmf@1 will cause the
> device tree compiler to fail since the node doesn't exist.

Now don't prefer delete-node.

>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> > index 0000000000000..5fab164a64820 100644
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> > @@ -0,0 +1,65 @@
> [ ... ]
> > +&sai1 {
> > +	assigned-clock-rates = <0>, <36864000>;
> > +	assigned-clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_SRC>,
> > +			  <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
> > +	assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
> > +	assigned-clock-rates = <0>, <12288000>;
>
> [Severity: Low]
> Does this node intend to duplicate the assigned-clock-rates property? The
> second definition (<0>, <12288000>) will silently overwrite the first one
> (<0>, <36864000>), which will cause DTC to emit a duplicate property warning
> and the intended 36.864MHz clock rate configuration to be lost.

Yes, please fix it.


>
> > +	/delete-property/ fsl,sai-mclk-direction-output;
> > +};
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> > index 0000000000000..cbd6252bd18f3 100644
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> > @@ -0,0 +1,633 @@
> [ ... ]
> > +&ecspi1 {
> > +	pinctrl-names = "default", "sleep";
> > +	pinctrl-0 = <&pinctrl_ecspi1>;
> > +	pinctrl-1 = <&pinctrl_ecspi1_sleep>;
> > +	cs-gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
> > +	status = "okay";
> > +
> > +	/* Resistive touch controller */
> > +	ads7846_ts: ads7846@0 {
> > +		reg = <0>;
> > +		compatible = "ti,ads7846";
> > +		pinctrl-names ="default";
> > +		pinctrl-0 = <&pinctrl_restouch>;
> > +		interrupt-parent = <&gpio1>;
> > +		interrupts = <9 0>;
>
> [Severity: Medium]
> Is it intentional to use 0 (IRQ_TYPE_NONE) for this touch controller interrupt
> trigger type? This might result in the interrupt being unconfigured by default.

why type is NONE?

Frank
>
> [ ... ]
> > +&fec1 {
> > +	pinctrl-names = "default","sleep";
> > +	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_enet1_rst>;
> [ ... ]
> > +	mdio {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		ethphy0: ethernet-phy@0 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <0>;
> > +			reset-gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us = <20000>;
> > +			reset-deassert-us = <80000>;
> > +			vddio-supply = <&reg_phy_vddio>;
> > +		};
> > +
> > +		ethphy1: ethernet-phy@1 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <1>;
> > +			reset-gpios = <&gpio4 3 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us = <20000>;
> > +			reset-deassert-us = <80000>;
> > +			vddio-supply = <&reg_phy_vddio>;
> > +		};
> > +	};
> > +};
> > +
> > +&fec2 {
> > +	pinctrl-names = "default","sleep";
> > +	pinctrl-0 = <&pinctrl_enet2>, <&pinctrl_enet2_rst>;
>
> [Severity: High]
> Does ethphy1 fail to reset during the MDIO bus probe on fec1?
>
> Since ethphy1 is a child of the fec1 MDIO bus, fec1 will attempt to toggle
> its reset GPIO (&gpio4 3) when it probes. However, the pinctrl for this GPIO
> (&pinctrl_enet2_rst) is attached to fec2 instead of fec1. Since fec2 has
> not probed yet, the reset pin may not be muxed properly, preventing the reset
> toggle from reaching the PHY and causing detection to fail.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1787314780.git.stefano.r@variscite.com?part=2
