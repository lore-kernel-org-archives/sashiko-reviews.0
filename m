Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443C141B8F7;
	Fri, 31 Jul 2026 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515787; cv=fail; b=BL2fQZMkCtHnErNKX+1eCwqPiVJXWVBXYK98xNfUBrmlBJuiKlfaIIpSnIIaVq/qKyNNQXCxdUDj0I52ajJGRX6UYeiL3toqy5YVa1v5P9UsHORwjjonycATz4x3p20nuwj7ZYt7dc/sYM2WBZXUvaNkGAZLipjMPdknDoKQKco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515787; c=relaxed/simple;
	bh=e+cQDOabT3HHJmH+fwl3i81CL3a6tyXIAqwNTHfEPhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TjVG6TLS+1Mv6UYukaXcZOiOWBsi1u1GD9D7blyeVT7dDv9wj9s6bHumjKR/7jkxx0KmQ+ctkHY90V/zDWC7CoS8KgwUmctQvBZCLuy0Ssqzz8QkGMGS9u3HI3VFVuRrqQm9m15NB4ABtg3Fekv8kZjEHsIses4SqWWBHvv9iWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bny1p5AC reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bny1p5AC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8zpshCnnal7YdF0r0F1w1B7NNBPlFKbzWzGGkYAPvdhp7fBD8bkP3t3qnIb6J2zfC2jsYyj08riIuB6FU/849u2DNfJbAZLY1rfK1ypbLPsaBAt0CXBNe+gawFxzEpLQ/URKuHxgXq54DQ53/C7/UF5ZEZzIPRkfmcRqB2ykNRfbOPfqYNilV/8zw5IAhctHMPYTbu+GzTfuKLJNR3UolYUn7mmbZ/7ve/XAqsHpdOvmHSstkLm7VlyqTrk72nPfdrFW5CeS1DrZTp9FgZTGo7K98xykjfq4KzKOPQqwew1PGkKf7iEAf15rBQay5oq8Atrw60BVfEi3+SE4xalCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHZZILjkTvOBfW4DsD9OZcJM6/Up8iSRnUAVGid3T2Q=;
 b=Vp6tpN73ZqKkBUCd7lFyCWKAJ5qCy7wlDe/VtfygSkIrVJ9FbfyOwKIs+lrX6+Zk7Y+u6oXPWJtUqu3NsVvroiKThYilikYr0gTB8rDBBVk3NeexRi54MjEWdm6Zsj3RXLPvwXODsfqVaNrsUGKDLTS1zxzGgtiOYJCoWwCETVEvyox56foE47YYLIPAOtqnKbMpblX2HjRCr5UbYShOvKJySUE1K3T9lP/SYZvjvDtc56ZvXYPtyvEc49VpmVzzFAkYj2cJktHcsm6eEs4d2PW+rsNqwKU1ZZjo0jgK08WOtZS1Q4FVHzMHeq1waQRr9oYcJyuripo0F2ovnzsL8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHZZILjkTvOBfW4DsD9OZcJM6/Up8iSRnUAVGid3T2Q=;
 b=bny1p5AC29qa16SAXAZC1ILPqca/dgJlib+g1x1wuC7M8lPN/z2LdCWg3AH1alsndRTBMJADVlnk5HazaOvNpnVW9LKspjQ6NjcH7kJVpahQjqSWnJgKVwcoi3bAetn+JMUhxCRQ4iu2NCCl7lf32teb9UCYm6Kn3f7sJb/6TslU560WCoSikXN1DMr/ilorYjpOohFCh3JZArXuwNioAjCxaPI7Lx7VDQRhj2mJz1C86GhMjvJKSGWpW9ovN8zNxuo2Mrwusa7H1PgL6KsZvGAW1FQEe3dSz+ZebhJHQe+j2ynaGzKFZkJWifBYZ4+Hw+x+5bw9DvtnIB4XmssAqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB9061.eurprd04.prod.outlook.com (2603:10a6:20b:444::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 16:36:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 16:36:22 +0000
Date: Fri, 31 Jul 2026 11:36:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marek Vasut <marex@nabladev.com>, robh@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v8 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <amzO_vv2wjOWgZXg@SMW015318>
References: <20260730224351.95006-1-marex@nabladev.com>
 <20260730224351.95006-2-marex@nabladev.com>
 <20260730225802.A493F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730225802.A493F1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA1P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e03453d-7a6d-439b-bc6c-08deef21db24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|56012099006|3023799007|11063799006|4143699003|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TLZ4LcK3Yb13TJU0bOxAcNnp0wLnFuQQYDUM1T0d5A5iDlZMIHDhUSvjiUHToMG3ir7GLqt4lTYqYBidgbfpA37IhoRC7JJotfFdJwUfbFkM3mnte76/xcOrkjs9r4qwM2geoGvJniz3R6J6kP7oRMFTFHFkEFyMnRE9buH/v90aIdgpQUqSgpy2kdRPTqPAC8yUwf/omHqJzkqpEV8k6UnJbnDIDLruathxqyPsZlU/vj8VsFBq7LpUPoRweG7u2cInKXjJSu3YUgo3yTC3fuO2JNOfS13I0nHynoVx2yfzmtbOU0R/hk9SH3dUEIQWP+jlLgW0Jp5uHueN4+RNKU0MKYckBYPQNHUS6qKcftjv3l9Vh5WmO8IYA5fd+oY206TA+9eRi8ioZAikd+llvxYiiHxSbRAkdQiDtxzQYPwZJrfBc1/4u2hXCB603xLBwpu3T0eqoPFDmw8Nt7Lj5TRBl/FOPBZhuwUSZVE6GpWOM/OVTb+wLb0eqhYreRl7MGod25GsTqDOGi2P+rGx+hv9ahQCbHSvWR1Z9dAX0s6vzou+wfbnDGAqvFo8G9TWkQj4MVPVxUtKeKI+rpiPGe4W9X+If0KrKxHC20yIlIE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(56012099006)(3023799007)(11063799006)(4143699003)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?d8hfgMQPscBZxEtI8ArUj/swFCT+70V11XHqR8RDhJElVsly3iUU/sJ5Sp?=
 =?iso-8859-1?Q?rjMUR/7o34YvY+HpeYEce3k0TefE3OU6HjCyeaE7wHs/IJNwJMPaKdtIZs?=
 =?iso-8859-1?Q?rDyWpsLm5+cEgrTNobAm6yhjs8qGHsUzy/u18tVbwpODJLl/D99VvrT0wJ?=
 =?iso-8859-1?Q?SB9CGk1RCDE8v+KjCRKVqIZw8l/bv21k9FE9xC5NggK7wmsPlLwJ74wJD6?=
 =?iso-8859-1?Q?EoCCe297Dv4Lf1wD5x6Mmx3NppM39O5wlS5eHBaYfR711grrsmTreNeIqi?=
 =?iso-8859-1?Q?9UwdDDoDkaOgzP/9UFkw5J7CWQpqtzfVI2333Xzwm+lmrns4IEx0CzGUJW?=
 =?iso-8859-1?Q?oJtDxpwMuwvPPbvJWupvulJu599JolcDHFhVegMUFPz2kOLwItzMm4HB4Q?=
 =?iso-8859-1?Q?XaZQspmcc+CHCbNWMSSDBcUK/n/6uyRK8hZWgAQw2iejaZpdldrB+CvnIs?=
 =?iso-8859-1?Q?Hv5ibldWFox1ZsJ6aCZDpEMpe4uVRuBHyKJXADE0nHXda1EW0bAK713gHI?=
 =?iso-8859-1?Q?fZqraAl6Wogpeou3Xm7IMd60TGh2q+JjlprsIUyXTH92SIn517L/0Oyd7I?=
 =?iso-8859-1?Q?VPOZFZWsLR84MJ2pmK7GSaDX8N84IhZNDXja9YFOM87Nw5SV/A3ZQ/bVFx?=
 =?iso-8859-1?Q?QwTafprNMst6Q3Xf1iVd+a7TrulL4dReCAW2GkPzWYhBF3r2HclfChHA4I?=
 =?iso-8859-1?Q?x+odIH+hW1uLmuPITj+X4XugAPF30z51GLnNzk5kyvfsnb3aLTcect/ZP/?=
 =?iso-8859-1?Q?ZG5eQwepvtrse1BFSRLojUmUmEqlqNc0rNw9eyRyfaNKZBFylxDUf/V9W+?=
 =?iso-8859-1?Q?p9E0g+apX/9ggXhWR3wRQACpQ0sVp4HHM/Vi80uRCcUWOKU7UQtdhS5zk8?=
 =?iso-8859-1?Q?7ZETDIEdKoH3Pw8t7gURLXO5NDO9QO/bD8qYdN2G5IdomRpvCZdk4PUmBw?=
 =?iso-8859-1?Q?znL353Tp1BSsaOT44prSNNMhpdAwrHMfJw07OVu4W72tvWLrbq6XKJzEZQ?=
 =?iso-8859-1?Q?LzDtWyS7QELltO6S6mUD6rBTBcpxu8O4CiKTsXHaWtcAwlCRTPp/rccR/D?=
 =?iso-8859-1?Q?FbkWeBYqpBsEPZVvcYVD2jI87rJwE1bs6WoVgPafMnaLQX3RW6mzzJOiHy?=
 =?iso-8859-1?Q?+4p6xP8PdCe4c1qF8zPpJNY4nRNdJJZuJFqZs4frqs3tyff4AGiEcsyTSZ?=
 =?iso-8859-1?Q?UwR8VR/Vn9uV0XsGesQq1qMDg2GHJl9OkQtF0sy/C86fRJ/qwI1/shsf7+?=
 =?iso-8859-1?Q?DsAx3kVMmMuIC5ynG7WNKiu7DiJQ1+wtoyDC+YO3IfqPQ1//VVSu9+Z2n9?=
 =?iso-8859-1?Q?526miNAEuUf/IZLJfYqOa6ZIrJfa/RRXHZVW2RSkL3eOqQEdMwbkgBR9dw?=
 =?iso-8859-1?Q?tB+h9BFeSqnVsNzkxtWCtQ7PFZ8fpSfd5yGw0xQB2Ow5yNDwbyxFHhwOZm?=
 =?iso-8859-1?Q?EKHmuA0v53Gkpj4urhPfD9jc7RtjzNGn0E5YgUR2z5x/zJgyWfZgmgIR8t?=
 =?iso-8859-1?Q?Xr9FZugRY5rTKYKxsIKVKE10mAI7y0i4kcIw+kiyVLBsf58zbLwJ/1nUWv?=
 =?iso-8859-1?Q?O043EVA5+y51RUKGCQGI6Nn2qUBq12p7xCW6FLE1E0BQQ3STKzyj0JZNvC?=
 =?iso-8859-1?Q?FoQOZFOdURAv+2aZmqpbH11zqYyGAcs+0QUJKhImRMYa6kdONBgKnqSEzZ?=
 =?iso-8859-1?Q?V6pBEZ7QFJVwB79ZuE56vw9iCWkewK+wZnHOnpQOxoMsrpVEssGK2eBN7n?=
 =?iso-8859-1?Q?ezCxHBvWQbplmDEmtY4bYPkdjXlRGcY7Qxisdmv5H9pK0EbPHDZFhiMpjN?=
 =?iso-8859-1?Q?aRDYlCKOjR+6dORI7GIuovnu5Ul3K8Y9iVNdcdcUlK0HLsTLR6Cn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e03453d-7a6d-439b-bc6c-08deef21db24
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 16:36:22.6294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dbw9lPAw+pnIhWpwAuDlAsHDsmq3+TQfR4SOw47J0Ope2wTTcjxo1sFVnKrCrv4dydybBT3XOsZjALDqWadcc1LDPWM0ekaIv87QvWoowGH5kvMHRiJ7Pudd/IYybdOK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9061

On Thu, Jul 30, 2026 at 10:58:02PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The G215HVN011 panel overlay hardcodes the adapter-specific backlight enable pin, breaking the backlight on the i.MX8MP native LVDS adapter.
> - [Low] The documented MP2328 voltage divider formulas and resistor values mathematically contradict the claimed output voltages, risking hardware damage if copied.
> --
>
> --- Patch [2]: [PATCH v8 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC ---
> commit 7f9fe59083c08b9930a9101dbccb23e4a6fbf244
> Author: Marek Vasut <marex@nabladev.com>
>
> arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>
> Add DT overlay for the DSI-to-LVDS adapter eDM-MOD-iMX8Mm-LVDS populated
> with Lontium LT9211 bridge. This adapter can be optionally populated onto
> the eDM SBC. This adapter can be extended with multiple panels.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi
> > new file mode 100644
> > index 0000000000000..3585170bd59dd
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi
> > @@ -0,0 +1,30 @@
> [ ... ]
> > +&backlight {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_panel_backlight>;
> > +	enable-gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>;
> > +	/* 6.5 POWER ON/OFF SEQUENCE, T6 >= 10 ms */
> [ ... ]
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
> > new file mode 100644
> > index 0000000000000..a6d13c3609796
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
> > @@ -0,0 +1,36 @@
> [ ... ]
> > +#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
> > +#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi"
> > +
> > +&backlight {
> > +	power-supply = <&reg_panel_bl_supply>;
> > +};
>
> [Severity: Medium]
> Will this hardcoded adapter-specific backlight enable pin break the backlight
> on the i.MX8MP native LVDS adapter?
>
> By setting enable-gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>; in
> imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi, the adapter-specific
> gpio3 0 pin configuration leaks into the generic panel configuration.
>
> Because the native adapter overlay
> (imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso)
> includes this generic panel file but fails to override enable-gpios
> (to <&gpiowifi 0 GPIO_ACTIVE_HIGH>) and remove pinctrl-0, the native adapter
> inherits the incorrect gpio3 0 pin, which may leave the backlight off.


This finial dtb

backlight {
                power-supply = <0x120>;
                pwm-off-delay-ms = <0x0a>;
                post-pwm-on-delay-ms = <0x0a>;
                enable-gpios = <0x54 0x00 0x00>;
		^^^
                pinctrl-0 = <0xbc>;
                pinctrl-names = "default";
                compatible = "pwm-backlight";
                brightness-levels = <0x00 0x01 0x0a 0x14 0x1e 0x28 0x32 0x3c 0x46 0x4b 0x50 0x5a 0x64>;
                default-brightness-level = <0x07>;
                pwms = <0x9e 0x00 0x1046a 0x00>;
                status = "okay";
                phandle = <0xa1>;
        };

At drivers/video/backlight/pwm_bl.c

get optional gpio "enable-gpios", which toggle this gpio
 <&gpiowifi 0 GPIO_ACTIVE_HIGH>, which may not impact function, but it
is potentially impact other funciton, if there pin conflict, need disable
related module.

>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
> > new file mode 100644
> > index 0000000000000..b06af369a9245
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
> > @@ -0,0 +1,79 @@
> [ ... ]
> > +	reg_panel_bl_supply: regulator-panel-bl-supply {
> [ ... ]
> > +		/*
> > +		 * MP2328 voltage divider settings:
> > +		 *   R1=51k1
> > +		 *   R2=5k62 with optional series Rs=2k21 (12V)
> > +		 *
> > +		 * 1 / Rx = (1 / R2) [ + (1 / Rs)][ + (1 / Rt)]
> > +		 * Vout = 0.5 + ((R1 / Rx) * 0.5)
> > +		 */
>
> [Severity: Low]
> Is this mathematical formula for the MP2328 correct?
>
> For the 12V backlight supply, calculating Rx in parallel (1/Rx = 1/R2 + 1/Rs)
> using R1=51.1k, R2=5.62k, and Rs=2.21k yields Rx=1.586k.

I calc it,   1/(1/5.62 + 1/2.21) = 1.586

>
> Applying that to Vout = 0.5 + ((51.1k / 1.586k) * 0.5) gives approximately
> 16.6V, not 12V.

It is correct, it is 16.6v.

According to gpios settings,

GPIO 0 1 to choose coonnect R2 and Rs

only choose Rs, it is 12v
only choose R2, it is 5v.

Not sure how to generate 3.3v and 40v,

Frank

>
> To achieve 12V, Rx needs to be exactly 2.21k, which means Rs would have to
> replace R2 rather than run in parallel with it. Is it possible the formula
> was copied from the AP63300 comment without updating the calculation method?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260730224351.95006-1-marex@nabladev.com?part=2
