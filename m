Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D43B363C7C;
	Mon,  1 Jun 2026 19:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780343543; cv=fail; b=GA518/V0J9Qv2lqJHUi+Wlr/V5NjYUX4l74n/nFG1Y33MOKTSdTH7JpQP8cr7zIFwSkC7pA59TIHeIhYbGMSkdd6M0Y2UqP8LRaXUPhgSO53KjHEhxUwtrGT1dXSmAS97yiVTEoXtc+04WYWmxy+mmy1dTiARoCPxdyVgOZWDOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780343543; c=relaxed/simple;
	bh=CITRQNwmmPHYlbIdBQn+7oze+8omvt0+wXXjzFQVTKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S20Rg2/hVB56Bz4M5YzMPlTElIiUE8WKF2s2+Ph9j9k8rddG4U08/KDRwH/uuRqx5Hj0EN0ahNLmbFrqLdaXYeUKlEm8vV7WZZ34/9ygqfDyELRQiG1Z6uE+Rgf3EjZRcBxoynC64Z8l+63HqdP1m9wCej52yEwe8CvtR2bUF6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cynF4ilY reason="signature verification failed"; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cynF4ilY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZbgwZg6m/uNETzaAtYTALYfujxkyxNpewguQU7d1spu/uzv6L8iFjZIEdVJTQ4otXR3qICkIDmL/p6HOjZfwvgSF2roQc7DAWSQL1EVy6LhHraQGDvIJG2mpedr+/xAMmyHIZuAlILEmwBzzNPEfT3i9KVFVCaf2GWZQ7rGyGn8VZaFjC1TELjGa0R0xg5LcpL198bVbclLEN+bQY9qTIoRhXQGyiEufnd0IVOHiruBriUQmMSne9/06U+eqr2yQultd8rpgwER4eBoULaE7J5Wd7A285uZDv5XV8DBhMK7kWBr2fqpG4FBCYKCQfTQBBbje+1b766f2YlDK0IAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LY4Q3dGyx1A18J5Vwes50I7BMYV9fluM97sBJH0c5+4=;
 b=jvrdv22ADmLcd+I5DP0848PQaXoQoje+qQ3+FlGCbrM+3hWiEwqVACbY7Xl3u0KhTiNRa7RekoWzkcPQZ+iajKhWwobWCw5oDcQZddYp4rR3hqiPWLHCbe7n+H34azJ00mlzlKZrBEDtz4r5xMKmz/cgt8tjkuu+IzrUxq/s0RrR927kHM2Ai8bwwU/6TrRrb032FBXRYsYnE63Wr5DcMPHjAz/A5DiKp7kr1ETPBTVY6AexIoViNGyOa+Of9wpbZw7rITQ3gpvinFX0UjCa160f9iWmyAHjYU+3uvLZwDdBi/XFPpRv7vrssc68MnoM+1I47iMA9zOVuHwGf73yIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LY4Q3dGyx1A18J5Vwes50I7BMYV9fluM97sBJH0c5+4=;
 b=cynF4ilYMKeFuL7QWPxOZVEA+778bsshZ/jokRFwVQ5of0UUunZkvji3vNJvVEx5QeCUhQj9d+D0Xc3Bv2B29S0amZ+PpAIHfW5NETV08hHF8dTIXeEqSg5ZeFG29sb1ct95h+y/YBhpkBHvFTUjvuE1RqVKgUmm8snNFJpb4HJaL/PaGNg7T/sg0B/l+7RefbEOMst8pWRYRK2hR8IpHaEiRAZyIfpDzfcFnOhRbajmuQxxfgJokY4MJVKD135+Tm3H6oT9i/bf/keVXRxD2CQqlC6JOyLDtL4vWimTIcgyG0f8u0G7n7m2huGshTp12kFQLdX84vGWg6Ty/i/qgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB12656.eurprd04.prod.outlook.com (2603:10a6:150:36d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 19:52:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 19:52:18 +0000
Date: Mon, 1 Jun 2026 15:52:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, conor+dt@kernel.org,
	Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v3 2/2] arm64: dts: freescale: add initial device tree
 for TQMa8MPQS with i.MX8MP
Message-ID: <ah3i63BKcwav8t7n@lizhi-Precision-Tower-5810>
References: <20260522075656.841745-2-alexander.stein@ew.tq-group.com>
 <20260522082439.011DF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522082439.011DF1F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH5P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB12656:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc4f454-14df-490b-0ab5-08dec01749cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|56012099006|4143699003|11063799006|6133799003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	a0bGB2H+ZrjwYIiUkvuS1brObqEDScz+HuNxkvkwZurtMRZr6fcxl7SUp1BiX/Pl5OffDjMZV1ByFQlc3eyEkwCq5oh1FY+120BHwIk3od0O02uO9NPjEsTGJLJ3EsIeEPeyl7oceg5U2H+ZZ49PQucbdm1mZtkIt+iEn4rmeSR5AWiHj0u50Uz7VTLieokNUU2fSAmwZzE/WAkl+tlxVo2NkGwa+WGIUjz0KzRpAnje6lQ6AdTU6ULhrhLW4OFQoqH6NkHnCGzJVz+aHiHG2tK9gS9Xef70h3VrelzVb6ETrAGWLIaRjVfH346+y+CjWMjpdiijVR2mYBAgKfqwQ8wTHycXVSbIzM59wATZB4t/78mo1jULYrzpAah6JtICseWo7uFB9J1rcF5SwhoBQ4IwGj6HUW04TriNtFMAPt4PZVgassjGig1C3Xrx4iQ1FICGqGOPk0uwD21+cUBrAqv2MHO0yEFx1nLr1FRlLneauFGcv5SMSjVE0i5tXn80E1ciKnFBWAjZF4quTRf4fKgViYd8mw+K7faheIIRliiylAzPx+1j3W7/Wd1UnsFGH7qRh4/aH3h29iygJNqH1BATsOi5E7al0sUo1nIMDWFiRSrdpAEe3T02btEfSwo7/+4RMpyDKLXP2CFjXIPFOBKbDfyFmGRvsv5i9K1/hR0T4GQD7TuiWqgqAjSzDvIg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(6133799003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?qwSkROfAodPn1IY8PCOgaA69eWDotXCDoOijlq2FCvpQmYjf754ffBvpC8?=
 =?iso-8859-1?Q?jsS55uXwY/2UWq8Wa/P1ZBMXGWlhHvP2hatbIy8dUyqQjMagBaWkY4Wy+d?=
 =?iso-8859-1?Q?i/y8CgrGPdjcxFdhHw5vwS+nW119pysSnLk5Ru7UA3H+y62OMAqetaRGs5?=
 =?iso-8859-1?Q?FEzbpa5qbsrAPBfJBFXOLQg1P50aT3ttBzFjXQoGyKWA8Ip/IdlB5zro2h?=
 =?iso-8859-1?Q?kd3tm0bav9F7lyr+tPtbK6lHo6aA0txtNTxILhbdpobpzSvFVT7n5wWx1D?=
 =?iso-8859-1?Q?MQq8hpszfTGVBusQ5jQRpmVa2PLh1oDSNNx/zS02Tr0M/ImbO51dHBUNT9?=
 =?iso-8859-1?Q?QqDhRqDE33qjE+OfsI90oYwY+K0Up2C8vceyttBwEwNWv2v4soA/YgAnCf?=
 =?iso-8859-1?Q?wKihaJ2BnbBe4rTB2YkJxSSbpxa8ipdgaIzx0nPTkbIg7SQpcea7mNDH5d?=
 =?iso-8859-1?Q?r/AX4k3MlqiKvb/tWSRbuZu4O1EE3LKuF8fOGERWDfDOUzlYv9SJnC7v9p?=
 =?iso-8859-1?Q?O5hqsIioJ2Wf1LUq3f5Hr00kIWXGBBv/g5Rg//pzuTA2ttYKpZP2YmpS7Q?=
 =?iso-8859-1?Q?jzTlD9Kuq/Xs1QT18st9dS0/5W1VVkWJ6UXX4hCJuu66a9Bcns3Tmc4DHx?=
 =?iso-8859-1?Q?NInsSfmA59wt3kF0Ew57qxvMbxHXiD1WxKDSz1lqN4WUhZOo3bzG7d9D6R?=
 =?iso-8859-1?Q?ehppQ2bYXDv2kVuMMfVjV1w8fZJHYsDGD5Vjw5t7SJUNdr+ATJpZg4pxPL?=
 =?iso-8859-1?Q?qWvfBVMLR4VZBIJOe36fmOa8stOR7JNUMeyjIftGCRaSTIXwbWhjbiGz15?=
 =?iso-8859-1?Q?/K0hTBHu39CVVA+Npkh8tQvGtpHqipeolgVpvCwfiOxdNMpudXrjHiRdJs?=
 =?iso-8859-1?Q?HUYmZR6mrWyUPok2qM1hV6ziL7h4EzULIE7dkGEdrDBhQnzeKe7mO/q4Iu?=
 =?iso-8859-1?Q?OXhzGtWNXv2YgNgPMhrXepHlAFGivKNNk/JCj27DgdIx2RsGZz99CcZyEW?=
 =?iso-8859-1?Q?qyGgXUnAwpNo46yV896ToTxMsYPsIQDB5A6YSIySo6D5I2XemsEbhxB92x?=
 =?iso-8859-1?Q?Sjoq5chd+HoGtGMb3b8VZrK9eZUx8eE58kP6NPhzxRlrfTO7lm/a+qrY7f?=
 =?iso-8859-1?Q?imeMl0wg7fn2RR4W19bkLBEKu3goR8LGEjx6BcnqC5A+3zoLEQWk38nyVB?=
 =?iso-8859-1?Q?UHguZvQZf7MGOANCddxGv373olkCBpysHteg8dy5bPyL4lDXNnHc2lVcSf?=
 =?iso-8859-1?Q?tag4IafbGqJjsXVwhLeYO3PPAm6noz2b8zhIBlCpWefFtbcyuNqurMhb1e?=
 =?iso-8859-1?Q?Aljk/GtgovztxcYwxutANiUqbwwQAfSxhR4iBV6HmmWRI/Ee46/t3ERECC?=
 =?iso-8859-1?Q?S5X5B5ry65UYGYwnWLGZaoDA8SKccg3tz085eEgQxgCUx1DXuy1/G9Fqke?=
 =?iso-8859-1?Q?wHmMYuX4yiRj7ihgGkxMHcAT+RdmHl61x52IPiT5cyQ0Yg7254+UhqstDJ?=
 =?iso-8859-1?Q?6MPtgxlQke0qx0twfscV2citlaadQD07Mu6PPFPkHeoFjQhOHShg0RYLNM?=
 =?iso-8859-1?Q?ei5JWWQ8DB3rTj9nDrOw8RlcB53jDl3vT7WQ0WGCq78FD9qWPZpx3cI3Fj?=
 =?iso-8859-1?Q?WW+HTdGudkDzz0Ox0Sl4ZcJ1LshGGRDrpqLOTEt6XnJCCDHhec9XZE5vUJ?=
 =?iso-8859-1?Q?3r2rSLDnW3ANpUX2072ZbqJXNGu2Ov5lGWqk/4v2VPKkfnbz+ZD79gmtAC?=
 =?iso-8859-1?Q?PpQ+1+TLAMaUAy+DNF+xsIJExBG1ugkJuCY0o6LFZPK9iD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc4f454-14df-490b-0ab5-08dec01749cf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 19:52:18.9397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhjZuH7aIL+uJ6tBw2ijRit/sPLv7RMEQKB5dFa8E3xYgEqdqNeNu3j+OnGyHuVDGxhNiOPv72OhYIclWfTYOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12656

On Fri, May 22, 2026 at 08:24:38AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Off-by-4 error in `gpio4` line names array assigns GPIO names to actively driven Ethernet pins
> - [Medium] Redundant `gpio-hog` nodes for pins concurrently used as interrupts by drivers
> - [Medium] Missing `status = "okay";` for `pwm2` and `pwm3` will cause backlight overlays to fail
> --
>
> commit 33a28c1f4850f44b57edd7bcc9794f6b7f5401a7
> Author: Paul Gerber <paul.gerber@tq-group.com>
>
> arm64: dts: freescale: add initial device tree for TQMa8MPQS with i.MX8MP
>
> This adds support for TQMa8MPQS module on MB-SMARC-2 board.
>
...
>
> > +&gpio4 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_gpio4>, <&pinctrl_sdp>, <&pinctrl_espi_rst>;
> > +
> > +	gpio-line-names = "RTC_INT#", "GPIO8", "", "",
> > +			  "GPIO9", "ESPI_RST#", "", "",
> > +			  "", "", "", "",
> > +			  "", "", "GBE0_SDP_DIR", "",
> > +			  "GPIO7", "", "", "",
> > +			  "", "", "", "",
> > +			  "", "GPIO0", "GPIO1", "",
> > +			  "GPIO2", "GPIO6", "", "";
>
> [Severity: High]
> Are GBE0_SDP_DIR and GPIO7 placed at the correct indices in this array?
>
> They are currently at indices 14 and 16, which correspond to GPIO4_IO14 and
> GPIO4_IO16. However, these are actively driven Ethernet lines (ENET1_RGMII_TD2
> and ENET1_RGMII_TX_CTL) as multiplexed in pinctrl_fec.
>
> Could this be an off-by-4 error, and should they instead be at indices 18 and
> 20, which are explicitly multiplexed as GPIOs? If exposed to userspace as
> GPIOs, could manipulating these active Ethernet TX lines cause hardware
> conflicts or disrupt network connectivity?

Is AI said true?

>
> [ ... ]
>
> > +&pwm2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_pwm2>;
> > +};
> > +
> > +&pwm3 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_pwm3>;
> > +};
>
> [Severity: Medium]
> Since the backlight_lvds0 and backlight_lvds1 nodes on the baseboard rely on
> &pwm3 and &pwm2, should these controllers have status = "okay"; added here?

Make sense, in dtsi, pwm2 pwm3's status is disabled.

Frank

>
> If left disabled (as they are in the SoC dtsi), won't any overlays that enable
> the panels silently fail when the backlight driver cannot acquire the disabled
> PWM channels?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260522075656.841745-1-alexander.stein@ew.tq-group.com?part=2
