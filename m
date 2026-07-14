Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013055.outbound.protection.outlook.com [52.101.72.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF5337E5DE;
	Tue, 14 Jul 2026 20:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784061067; cv=fail; b=Opj9rPPqIKxYMxJRHt4g1JokO1OrQo5x3zTe0VBptOcGY+ss4q2znd5mHBM0Te0reXgYuRQfJ7uoX5s64BiibrKyxHaDGWdtXbissr5K0rC1sHUZ19OpxPjg7loyAFgAhL3tTaXMrHdmW9M0JfIkldXSYZ1qy5Qcq43Nfbst4lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784061067; c=relaxed/simple;
	bh=xSeCVtkX1SlPpLMSdOjqHz3rEIa6J8nWXwAMm/m1AnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Mxl+1pevQ/PqCLmG3IFhuj2R+RXr8z+b7KHxwf+aksKErJ7J1JunQX08YJUyECi8uUj4+vnPc6D4QJj1SU5TahqPQVtnli2TKS+Apa1Q8R0fFsD4jKsrusmuv7ZoksBYfpHt0d2U6DOWIpXBhxpzRHvM7b2V3Bss4dn8DbnNlec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kPrJYfj2 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.72.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kPrJYfj2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q271BZV9vQZ2UZSr6kJ/lH8P3O/5WVMvGHva6Iu0fBSI1U3IqodbLMDsqgvpWQyf63Ne61NBpZfQ3xxXjyAjDpzuNtc4vrogIYn7aBLDw2pP1IqTMv6k0GTsn1QIPy8qw/oOSr8WN54j2ef88P6PqYeN4frbJjEc72pptgdP0Sgy1hUr/MTVXOvvCsxGY/DTuRfSRuyTRqdSFaSTYqJfsgDFmtQ+QLNVDH5AI91Nxd0txTFwPDyTglCKvDJ5p9ad0Ja3tEBGAz/AUl9NhO4KZAoFoKRUaJQMoX8L6X7u47JbISebfKDBQ4EMRS4T1pZQ2Dd6Ip5fqAA8ColWeKI/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ak9BrI4YGdXWSpufRf8QzogVbfCpvrM8dEfCach5qR4=;
 b=HcXQSYwxnnM4QofXkerx2V+JNeU0ZbWLyzmd14w5sgaD8WS9N5Yx+7vQIg7qAmqYmQ3Db6fiZZQdSQ9YUanqqvPW6rPfHYotljHmzBxLk1i1CIoLfInR5Qz/cI1B/9Ukvcs7YC8bu30vlxf0EZXXPygV964GChiBffFWis3lQafafld4BDvogAa/ceCLIyXreQ8Echm5c81KN5uZHW2cXXCusQHzWZKBNaym0xoVO42NqiwnFGPwot9mU5qt5WtWLy3PSo+EqosECvoHivV9c9HXNxOPhLVzHivuOdaI0o43MkHFThuS6iPW38WlKW/EWnRluOZ6sWpyvh/h3mMqLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ak9BrI4YGdXWSpufRf8QzogVbfCpvrM8dEfCach5qR4=;
 b=kPrJYfj2OSPwZoBV2Dav6yhbPUCO6L3cHRTafTTAubCLMP1XfVALrj3EyiPKQj38MDwpDbprEUh+FfF8wLBQoQ4gnE0S7JtnBDLEPMjxU6/ENn5MyNcMqpbZIAaLs14Sz67mOMF/iKH97SDs+YeQaiE1yi0Y030sKllRBjGwZzH91wle5teBqrHP1HbzA/asXeX1QwLkt6Wm26TzaexunCn/UH7qas9K8miTm/RypeaNAfgunHxjD3QDGcBVoK7ZVjFEWMBnFgWkc8X/w6cHvOdd933nSFWtBzOawPi94N5tmmqhKq27bhl5bqOSMW3zaaF5OnoU7P1D65B84K2aXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7793.eurprd04.prod.outlook.com (2603:10a6:20b:240::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 20:31:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 20:31:03 +0000
Date: Tue, 14 Jul 2026 15:30:53 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, robh@kernel.org,
	Frank.Li@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8qm-var-som: Add support for
 Variscite Symphony board
Message-ID: <alacfVm-MfHPm-qy@SMW015318>
References: <cover.1784059139.git.stefano.r@variscite.com>
 <206397f61c47d3acc7b5a1dc4a12a33a049f1dce.1784059139.git.stefano.r@variscite.com>
 <20260714201804.8D8681F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714201804.8D8681F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH8P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f9944ac-24e5-4dc6-5618-08dee1e6d2de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RwfGXtsRfNDOvfjQz5il7YvJ1s7j+6Ycusmnd+YhCUF1mtQ89zdk8vtvK//56Leu+HJgm1KNiPc/gjW/ZoskRJK3Do39Opx9W8EBHmL6ZnnzMf/ZSCUCKUAUE/4fF9waooK1i0ctUCbfv2Ngdr8DnR+W2hOi9LyLydswtGeK4t4Kzj473Jzz0j+XdFuMhFaoXMgdh7QE5SWRKFaLmWu54pz3ckGvxJswidJz98C3ZP15aqPhu4HVvGs2/MXSwNzt4IpvBuRByXkxnvEU2mrVS7BA0+O73oBXRIjjI8zjTzCIt1Gj6vVJfVcCH5gwkz8TYlXKrFRcfZL4f48HriaHlmZ/1vC+Yy/QVGvrbfhjYaUCC/oaoU0sGY2CytFXua7+56ABwjaKNUSxRKLFVXPXOBQKC3G0F3MqYAznexaycHdLueJEvwJNSNvSxcndRy43PQQztn1FGdh+HPY+b8xirKsvYj20b3Fd8V2cX5sCrz5vRTYMSZDtcEGGzPiLe5DcVOhznEeyYq42vgAKajt79kWSEut56/3+Iv5T0cK9jgM1v/MKE1IzHGgYLm9IQy1S7VXHBRvGk7faq3nOkIb/rj+z/dKeLYfJ5C5RpxA8r5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?pfeijjCp8aVEpAySRrxx+M8KT1qZPmX8xuwoQNaEz1qDoqSr7gpA3IBi82?=
 =?iso-8859-1?Q?hPDPv8V7qokWK77uhqH5MAUmktXDLqPDZKD9yZLP1dioysBy845vSjimaG?=
 =?iso-8859-1?Q?rJcGYEXgae65Jn/GFq0E/X3UJdinOUjTTILLcWuxiYimrU2BqVjan4oMqI?=
 =?iso-8859-1?Q?rPrM3DD0ZIm9LeUAFN+j+NuQSs7DDJD3x9qnYqP8ete7ulri0PJrUojtvW?=
 =?iso-8859-1?Q?9U7knWHBtRiTEaFdgAv/Qh7hccqyikJfoh5XHvCpwlSG7kNvs567GcJhzY?=
 =?iso-8859-1?Q?w/bZV5Ut5qTaH9H5CvBCk/s6dOeJkJNvMqjot+CpNanwwUyhY1Xh7MDOQR?=
 =?iso-8859-1?Q?lqvyaupxzyqQgdETbhg+O02D1dHWJfjBOxJdu7surv33J+zJ52SmPvkl/E?=
 =?iso-8859-1?Q?Mx+XCLxx7ZpSGgXMKcbk7UYgdJEHM5vH3vq2lpoD8+FUW6mBGhLl1Xvkca?=
 =?iso-8859-1?Q?BRL9DSo+qtGeI8aCefgNFdou5PmRSg5rTideS7ks0fHwBf9aKBFsjvkD16?=
 =?iso-8859-1?Q?LVkHrRKAKmy2/Hvi+GlXslahfQyL94gVgpcRIVtwDbu/+xw6+xrOGmPfJ9?=
 =?iso-8859-1?Q?SuMMfdV5qMtqTTkUivX0rrKVGHDXZFdWCrN64gftT2WxY3iWdbTGFVHea+?=
 =?iso-8859-1?Q?VkFG+HEFAwj8yk5c0Awf/jF5AtoLWlwbm6hE0E62BJrr+F7sXI1/3EUnFw?=
 =?iso-8859-1?Q?WkEHHJN7lJvV1049P4ueBbyYGeoVqCevZOly4p4I4DXBY8LnIzk3uggWE/?=
 =?iso-8859-1?Q?Klon/kBHcOfWWtBo442x+lHJn7oub6DDnQMfWLWGotHh0/BssEeylP+pLy?=
 =?iso-8859-1?Q?mYrymDwC/gqSWGg6kArDYtwWPpluMgDjfG8gwTPhXkGkX/Fn2Bi0FUMw8M?=
 =?iso-8859-1?Q?b97zyTkxxkow1CiRvDAoKipAroWz/YYnvPg+GI/MEuEv/OGr1nywPLmngN?=
 =?iso-8859-1?Q?H1H8gYXiD9u1VwBSr3/tOKMFcNuO+oMc0tv35KHeb2QT3I66+azUGcIwBz?=
 =?iso-8859-1?Q?Ucqrr6I8wrR/Hav0Z2nb1TUU4ix6BgZhBz0K7vVTFbTrD3wufdGwTGUzNN?=
 =?iso-8859-1?Q?Gd6GSv9on1fO7JXcyPmlNwH8CP1TcXr1U46JHE+AwZ5yMtk+Ru3nv+Qm9X?=
 =?iso-8859-1?Q?Gw9pkmOEet2qvtb1tNgth4wxz6kF/KcQRcGCrjZPdj/8HWidpcdhPzYx6o?=
 =?iso-8859-1?Q?AM06K6jTIFuVwws8XRG/gwDxLTpSl8Jbdj7/4prrQCcKRF8F3qpY4h4gUw?=
 =?iso-8859-1?Q?5pyRvwrmVmmw3r3Ez8EMGrTnwMl7jwbNoN3qi9eLwkXFfZNgRYHZ6tUPLH?=
 =?iso-8859-1?Q?8C1cD3pL8PAyrBvDAHsXBgwUErihpNuAArkihzTsajLU15AUs981xBKVS1?=
 =?iso-8859-1?Q?KcZYZkSu/q/9kGjqmPB2ipgGRuKf2ks4jSALsSRqdPq2WPtAkFNgNOFtmL?=
 =?iso-8859-1?Q?XPtNWbC2WMvDqfeXkPXmyqnAKaOGjK/E0hXAWZ96ly1W+TfWhJygNFpVrZ?=
 =?iso-8859-1?Q?1vH7+OQUgIpCVYyJrwXj339ElzgcUIEPjykTkhttzP+xjUk62ogqXmoy42?=
 =?iso-8859-1?Q?soi71FtAlcGYV1q0N7+I2rEx+UdI751ZKdGEySYAPbvUKpsf46So1Sj91a?=
 =?iso-8859-1?Q?VJFhRxHTRh31L5zSGjqzq8yz6mM0SnuLtHLKs4NEJqe9h1xg0S2cbbsc1D?=
 =?iso-8859-1?Q?RDqyKytYC4LVC80W3uZTCsIkh3AzrrpEg0LhtIvCIyBIkTG/zq4hWWgZhD?=
 =?iso-8859-1?Q?fgXiXz39+Jk8gxUwsw30OaM8putfvRna7DZfkx/5Vkxld+jc5UeAPSjKak?=
 =?iso-8859-1?Q?dOSCF+k5YTOx7rzW59NZu4SdgQSAzpLYvvKtK38wsf/kHDwlShVn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9944ac-24e5-4dc6-5618-08dee1e6d2de
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 20:31:03.3509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRSuTyh96e8V8hPWxavIik/fdJHmg0psleJa2RgLT+fqb+T5OcfXtMoSZkrI37kerfbr8HJFgHQ+8rVdesNc4TgatI2LB8kCr0lnv1A1zgEmOnYNt8/dSvz+xtvohl+Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7793

On Tue, Jul 14, 2026 at 08:18:04PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Medium] The capacitive touch panel node `ft5x06_ts` lacks a `reset-gpios` (or `wake-gpios`) property, stranding a configured pinctrl pad and potentially causing probing failures.
> - [Medium] The pinctrl for the USB VBUS regulator GPIO is incorrectly assigned to the USB controller node instead of the regulator node.
> - [Low] The PCIe node uses the deprecated `reset-gpio` property instead of `reset-gpios`.
> - [Low] The LED node name `led-hearthbeat` contains a typo.
> --
>
> --- Patch [3]: [PATCH v2 3/3] arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board ---
> commit f84a05986e6ac58f10d1a6e2091672e4f1bf919b
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board
>
> This commit adds device tree support for the Variscite Symphony carrier board
> with the VAR-SOM-MX8 QuadMax system on module. It configures interfaces
> including SD card, USB, Ethernet, I2C, SPI, RTC, TPM, CAN, and PCIe.
>
> Link: https://variscite.com/carrier-boards/symphony-board/
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
> > new file mode 100644
> > index 0000000000000..bf66786378301
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
> [ ... ]
> > +	gpio-leds {
> > +		compatible = "gpio-leds";
> > +
> > +		led-hearthbeat {
>
> [Severity: Low]
> This isn't a bug, but there is a typo in the node name (hearthbeat instead
> of heartbeat).

small nit, fix it

>
> > +			function = LED_FUNCTION_STATUS;
> > +			color = <LED_COLOR_ID_GREEN>;
> > +			gpios = <&pca9534 0 GPIO_ACTIVE_LOW>;
> > +			linux,default-trigger = "heartbeat";
> > +		};
> > +	};
> [ ... ]
> > +	/* Capacitive touch */
> > +	ft5x06_ts: touchscreen@38 {
> > +		compatible = "edt,edt-ft5406";
> > +		pinctrl-names = "default";
> > +		reg = <0x38>;
> > +		pinctrl-0 = <&pinctrl_captouch>;
> > +		interrupt-parent = <&lsio_gpio0>;
> > +		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> > +		touchscreen-size-x = <800>;
> > +		touchscreen-size-y = <480>;
> > +		touchscreen-inverted-x;
> > +		touchscreen-inverted-y;
> > +		wakeup-source;
> > +	};
>
> [Severity: Medium]
> Is this touchscreen node missing a reset-gpios property?
>
> The pinctrl_captouch group configures LSIO_GPIO0_IO16 for the touch
> controller, but it is not assigned to reset-gpios here.

is it for reset or irq line?

>
> Will the edt-ft5406 driver be able to toggle the reset line without it, or
> could this lead to initialization failures?
>
> [ ... ]
> > +&pciea{
> > +	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
> > +	phy-names = "pcie-phy";
> > +	reset-gpio = <&pca6408 1 GPIO_ACTIVE_LOW>;
>
> [Severity: Low]
> Should this use reset-gpios instead of the deprecated reset-gpio property?

Now put under root port

pcie@0 {
}

Frank
>
> > +	status = "okay";
> > +};
> [ ... ]
> > +&usbotg1 {
> > +	dr_mode = "host";
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_usbotg1>;
> > +	vbus-supply = <&reg_usb_otg1_vbus>;
> > +	srp-disable;
> > +	hnp-disable;
> > +	adp-disable;
> > +	disable-over-current;
> > +	status = "okay";
> > +};
>
> [Severity: Medium]
> Is pinctrl_usbotg1 assigned to the wrong node?
>
> The reg_usb_otg1_vbus regulator uses the GPIO to provide power, but the
> pinctrl to configure the pad is placed here on the usbotg1 controller.
>
> Could this cause the GPIO pad to be incorrectly muxed when the fixed
> regulator framework tries to enable power before the USB driver probes?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1784059139.git.stefano.r@variscite.com?part=3
