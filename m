Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010041.outbound.protection.outlook.com [52.101.84.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2096338425A;
	Mon,  1 Jun 2026 19:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780342947; cv=fail; b=RBzY4Id2SItSBmEUDGI6JhPO7r4N3D/2wdEQOD2VsRqeyekixxVDunUntzL16IW1AA3q7bEF5znBYZxpLLOZcT9HJ9LElmnhR26b9xhBN9gzmd/MOTMGZBZ80uz/ehhXwAe5j6LNL4KIRzqCJOQ1hzx1SzWlD2LllTxgBMtUA5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780342947; c=relaxed/simple;
	bh=xbyEr7Wey7qVTa6YORKP6BqypW/axj8GadcquP65yeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KrRrzGrRU0tYggIII0+qbsBPp6MrTYrqSwKDAghJpUSuQ+tMI+dMupwHRnYtnhOo0+lwnmzdHunKAkjdQ4B/drecpxLvmNgvLNr3Fv4xJ+G2GYLc4pAqQB5w9TE/5DeYDzyGEpdQuL+l74EUoZ5T/dVjJ+Wl5ll3IUDqnUcSVOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DYfhIuzW reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DYfhIuzW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWNB8QQ1yeeXRCOV8e+3ilboZ37lW2L7BYsheiUbcixTLWwQwNO50b7dPjsN5kd1jA+S2wAdjnzjdZNwammInu5PW/uYP9kXlHwiFJU+ZqUb5Tv92IQcWHqu1X6DpVEf8bTIjZ1xRvsoGSasRmwr31ZGNldUrdXasSWYHaimFnIz15dquuZR0kVucuF6ulR1q701fmto8z7VdKDJJgpkQi4+BScJY/+H0eS5jj4e2nj6zC7lxa9HRApxwPMUZBLrKf0ngqyqU4avJdQHGoRb9YKjBEdq3zNtoMyBQkg7uvO7TQWtmu7uuEnbeDUnnaATfO2Deixe5wu4i7b6ZrhJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaCJdCnlr2UMgK4aGUrTEIvFZccGCunvv9zg9AYNmQM=;
 b=xAy6JfOmKp557/O1zRAy3KFPJJJ14M5zbsPf5oQke7kmjH8bxicrWboS1oEs8YiuwB6/EoE4f1Sn8Gh25VhQEMXoMzb9bbC1DRdk0SD6iXSj8apw1YvQdJm0TPmtL/kiLDWleUMT0BjkzWDG0W0EFrUF2umLLJ9fCK5B7E/pAn0Xl2q2rvnZccZ6SNhLsZWybRu/mUTRA+loyCiMLy08wvz4cYlsItPrzUEqsKj+Vk6/n41ecLePD1/f9iocCm/xSbuSTZ5sw4FH2mLxd7s4z8ZUgiteZ8vVJPQgmhHGu+ALM23X0BNsSZ5RKrVEgH18IvNnAr9CD3sUhMfdC8zwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaCJdCnlr2UMgK4aGUrTEIvFZccGCunvv9zg9AYNmQM=;
 b=DYfhIuzWkUkY0HQfbGsyw1eD9uKQKLNmYVReL3EQMFv8qlzgxSxRdsxasW3PaK+24ANbBd171Xn2KzRCKz7OIAdj1BJa6Lsq/93VbjklDW6AFuXyRZVKNfpUoYXo8Ado6iZo+eGg5VdIK2yF/qoUF7bHfkP+9ASw8h93kMMdRA9Q+CKSWfzCV1mXDXpqRuLoXvG3ksbdspJYBXZRJEK708gnSWQffpfIaLVM0GprwOl/a9LuSWwZzvAxRC0x9b9GyHJmJZZg7lf51qNY+y2ayg52vB4v1XJBqgzYTIMUjRb0KT3bQlXSm3+2Ph+yfGO5w8pFslaIcpkQ9XEkTDzkBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PR3PR04MB7241.eurprd04.prod.outlook.com (2603:10a6:102:92::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 19:42:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 19:42:20 +0000
Date: Mon, 1 Jun 2026 15:42:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Franz Schnyder <fra.schnyder@gmail.com>, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 2/3] arm64: dts: freescale: add Aquila iMX95 support
Message-ID: <ah3gl2imBTPoEpHm@lizhi-Precision-Tower-5810>
References: <20260521-add-aquila-imx95-v4-2-5a7f86c824f5@toradex.com>
 <20260521173020.0A03E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521173020.0A03E1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA9PR13CA0178.namprd13.prod.outlook.com
 (2603:10b6:806:28::33) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PR3PR04MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ef51f4-3d55-4e67-7a0c-08dec015e553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|19092799006|366016|38350700014|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	KSpJiOkmhT34bCiPKXIDTdsY7cQ+6u5q8AJG1jG13eEuOERvnBa3YiRxeWueK6CidwNnfNUbcmqnPRe4WYHSiGoEbBRp3OXoMFOSiNfTYoYDXPdCxoZ1//ixE6JCq7oXAwrR2WAr44Ejq44Q9CW9/wQNBeA2yetCSZZB5R90mIgimG7h5bnLzJEL+T9z80vfK9qyysCn6gm8s3TB6DT1HYipfj+GWnjynkxy3Yua3YyQBabLnkJ6eROkNQoQ4hp9Vky75KRp/0pJ3uXGh0SCh0c9QcneS3ddP/RTTC2hPEhI6wLh4v8UqbYAFsrJcFo82D2hzx0fUbtTIiCB0EbOik4ZgA6vY+maiS/vqaZabSJtfpNzlQqd3Pf5vvxez8d9NcCRLAzWspwrRQn5tsdQrKRVj4EoKT5cxsysA76sjBthkESw9S7AJqFMBv6QeZseDNH5UWVP5uW1LaR7mqFJJWIeTRNmOjcF+SvZZzbmhE5OsA/kM129K/Cic5Qa0d5yg8INzj5Yzu4K/ODSnXuDbyvp+/bCTBOYRY7H9FH/UE2Ke6s5aA/3IJd93ep8XbeRaHaHSCgI+QygqfzncJtnszcGlxhOcFVkLlskoF9PerkQhRqUD2rsGJ2266GzkNO1PROW80WbrYWq/N9WaPiWKV4PKilCUwrnVls6UZp2HuIxM3p1kIH3zSOnlDdbsk5x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?EV6cGqtQq6XFWsvdZ+5BFitRcaPjwGdYgnnu/mCnvFO/3QeessdnSRoWRw?=
 =?iso-8859-1?Q?eOX4UEUyqCJqxrKp27FjaWRWtrlJcnzN2FWWZE20U7G4vpHAg7JCUJilzQ?=
 =?iso-8859-1?Q?GHAQGm5A4NEWRu2tba3n+eHt8Y+V6mIl15sga62WO/JSJD34udPWpusabE?=
 =?iso-8859-1?Q?e7uGGLwEHwyhpUW94Z6srervN+0fbu1xDxDWVQQ3Y+QyXBMiaOOCczrIpV?=
 =?iso-8859-1?Q?C6Wxcmg+7/sLz+blOMNsLSV4NaRcg86MB+RPZtW7B6P7mF7K0qtXTJE50a?=
 =?iso-8859-1?Q?Q0FeRJO5PvlTo6SUDaNa3vUScoiQ9s1amEXcMvr4/xLU8bLpqnuxqTU3q+?=
 =?iso-8859-1?Q?LiPOShnG4Txm4S7U7AS1jhcBEAUqzMzHzIR/NGM64ZNFPzfwp4vinOBLTU?=
 =?iso-8859-1?Q?k8/TLQ3p1pjyThkrbmciXrKFXOoRCCquVq93oloxAL6PUTTGo9J7LjUIwf?=
 =?iso-8859-1?Q?vS0yUaO5THqcWwdR1ALDlsL/WFZualEX8gKKAJKlm1kXbIWNJe0ZDaK5jn?=
 =?iso-8859-1?Q?euHwcaDrlPkPMDuL3L9vXgMjVglKhVjjGd/JFwZudLcgmh5AfQbTeYA9Ha?=
 =?iso-8859-1?Q?iOCz/41VkS6JT6egmKsIfN3cXGL54i2VIJ9kOLC9x6T6pVDaZJLxEWOadJ?=
 =?iso-8859-1?Q?eFsl0Ny6PbYTJYxra9Ob9kywp9z2Tv/3+CP3cr1c+PxgtFDYDqLLcfEkYA?=
 =?iso-8859-1?Q?0KeKP97xbxksq4F1aldliannjoWKWPxDJASHZeJ7bFquYl7NYD2KVsGdS9?=
 =?iso-8859-1?Q?smkXxUVYzAOD89jAvem+gZFr7QrEgrc5+Y4+FUVDB+g9KXmy1pC67CL4v3?=
 =?iso-8859-1?Q?tZK/AhTm3+XuiLgZ/1E2PVPnmIRbXBUc9ihS3+5M8V/hKImVbFsRD9A3el?=
 =?iso-8859-1?Q?GoaIGWg3ReMOVahfoudUWoRdFnWYhzhr0kN5YAGY83LYQAJRpNkh7F9msj?=
 =?iso-8859-1?Q?0hx7EkY+Jbn+PiQ29Sn01HfLlgu1XFtvvM+ijJeEChD+6rmjU8xrZXHjAM?=
 =?iso-8859-1?Q?ZMnY1NF5Jeqj8C9dDO9bKMcEYYbWai8lkT4h1kOxI9n88y6uFF3uzu7pjO?=
 =?iso-8859-1?Q?l5ySd+Hmd2WySYruqNo3Lvy1Fy4UkFSW3VyDyMaEZfW9mcTqBC3lMXRxoW?=
 =?iso-8859-1?Q?87rm7kUkJpGLmUu/WqgCbT85f6KilFrRTb8W9emVfWqQfZfFk/nNYWMRUc?=
 =?iso-8859-1?Q?6AGGUCFgC0rJ3AQpNQyKcB7bmE6o6MlW0Ve0mR+4f4pQIjCsUfK08zMx6U?=
 =?iso-8859-1?Q?M/uwpUJFQ9Ioz2PEAwL2Z2MtcBRv4UcAQrGBHbpxBCWgMuz0wLnyUxOGTl?=
 =?iso-8859-1?Q?UqC5suf9ShmgIsXKtI79y2kRtc4Ol8TuORhRxctY5K4TPvGZt2qAgRkhN8?=
 =?iso-8859-1?Q?D9l9UA0OIRBpEp6A0Rt59QpKpzvBKKzcfC1vZmPYhiy5xnZVIYSPVFxJxZ?=
 =?iso-8859-1?Q?kAst9fy5FmPaVm+sX3CKTgupU0UYdB77AsfKcFjhKUW0d600yoaXGb+6Nx?=
 =?iso-8859-1?Q?a639gEbL/QTBqQKsNaOiqE9mSlKe5a0eO15QgEQ321o7ckM5OQfytDSQa4?=
 =?iso-8859-1?Q?S9QXzoEzb1faKRGC773HDha//PIbvXFOvWkMG58n77Sg5eAlpxpGmN9XPL?=
 =?iso-8859-1?Q?HIrMtzORYY6d8OGqQdCA14f3EosjF3o+hbDiRNb8n38FTdY2KRORLgVjgU?=
 =?iso-8859-1?Q?44mMt4BAuniHDRB0tieEvzvNav/jx3QlkNwZuyd3AMM+gOXa+RYZKOaCAa?=
 =?iso-8859-1?Q?BgKguD2cYew1bFHbb5nOSuruhnNJQtwm6JVMYLYiZr/K1a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ef51f4-3d55-4e67-7a0c-08dec015e553
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 19:42:20.8840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AYqEJjfoxzh5Qa+6bnSKWm/1foybItSwWST/iMuFOxJNeegt4PYFecgSOXeM0SMWotTskJNRECG/Ctb2caP7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7241

On Thu, May 21, 2026 at 05:30:19PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The DisplayPort connector references a disabled DisplayPort bridge, leaving dangling references and rendering the connector non-functional while wasting power.
> - [Medium] The dedicated power supply regulator for the disabled DSI-to-DP bridge is incorrectly marked as always-on, wasting power.
> --
>
> commit 3392fc6b669bcc9dccbd369d342a80d81c494ed6
> Author: João Paulo Gonçalves <joao.goncalves@toradex.com>
>
> arm64: dts: freescale: add Aquila iMX95 support
>
> This commit adds support for the Toradex Aquila iMX95 computer-on-module
> and its corresponding development carrier board.
>
> Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
> Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
> > new file mode 100644
> > index 0000000000000..3df17700b632f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
> > @@ -0,0 +1,389 @@
> [ ... ]
> > +	aliases {
> > +		eeprom1 = &carrier_eeprom;
> > +	};
> > +
> > +	dp_1_connector: dp0-connector {
> > +		compatible = "dp-connector";
> > +		dp-pwr-supply = <&reg_dp_3p3v>;
> > +		type = "full-size";
> > +
> > +		port {
> > +			dp_1_connector_in: endpoint {
> > +				remote-endpoint = <&dsi2dp_out>;
> > +			};
> > +		};
> > +	};
>
> [Severity: Medium]
> Since som_dsi2dp_bridge is disabled by default in imx95-aquila.dtsi and not
> explicitly enabled in this device tree, does this connector node leave
> dangling references?
>
> Without status = "disabled" on this node, the display-connector driver will
> probe successfully and unconditionally enable its dp-pwr-supply (reg_dp_3p3v),
> wasting power on the carrier board for an unusable interface.
>
> Should this connector be disabled by default or have the bridge enabled here?
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
> > new file mode 100644
> > index 0000000000000..69dc962a24a1d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
> > @@ -0,0 +1,1160 @@
> [ ... ]
> > +	reg_dp_1p2v: regulator-dp-1p2v {
> > +		compatible = "regulator-fixed";
> > +		/* CTRL_DP_BRIDGE_EN */
> > +		gpios = <&som_gpio_expander_0 7 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		regulator-always-on;
> > +		regulator-max-microvolt = <1200000>;
> > +		regulator-min-microvolt = <1200000>;
> > +		regulator-name = "On-module +V1.2_DP";
> > +		vin-supply = <&reg_1p8v>;
> > +	};
>
> [Severity: Medium]
> Since this regulator is a dedicated power supply for som_dsi2dp_bridge which
> is marked as status = "disabled" below, is it necessary to have the
> regulator-always-on property here?

This one make sense. Does this regulator-dp-1p2v really need always on.

Frank
>
> The always-on property bypasses the driver and forces the regulator core to
> unconditionally assert the CTRL_DP_BRIDGE_EN GPIO at boot, continuously
> powering the bridge chip on the module even when disabled.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com?part=2
