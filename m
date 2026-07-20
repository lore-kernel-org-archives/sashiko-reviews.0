Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011071.outbound.protection.outlook.com [52.101.70.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE88D433BA9;
	Mon, 20 Jul 2026 15:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560041; cv=fail; b=K5eZ1rTBLwYgGymbb7tAMt4RKjvR7Vu8f+AgBQuQlcbokjmQG5N+FxgXIczMHFuM1dheT103WyInN0YnIWKcgbA1JEFHS+OR8u1tQBFyhAibVV8TIIxPabPRHGeFZjjZK7EJu+f2yc5+QtTLzeB7g4wzz9lgmJgjmZlKtHuxwe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560041; c=relaxed/simple;
	bh=2WWlj6j0QxzOU62ns1Ep81miChUgQE/DWaBNirTWhjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VPLuXqL0b0snEu/+4qgPWw+9YG9Top3ubYiNW2HO2/j1Twi97vDDph4cu2wqzk+XtoAghjEcDFmDKxeb55DHfq0ipFN6J1aOP6OvHV64OxDx1fzQCqEMf3z+yjkojzRdcl2t57JHR7QuFrNlK4ROVz0mwKkjqukiDfF9u+vtmtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=F+YVwzR+ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F+YVwzR+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ag9YHzFkIw00GfJPQvJwmu1epF9xvZqXl4c0yFFgQee8dKnwLGWd4YagN1YpPPtT+S+GPM1XQ+k3UnHtiRa9nEf7Y7OE3/N8OD1K5Aq7iuffQUx5m1Gvdz1jOo8+yVmiqY4396FJ2CZiBiIppMfKGBVTt4Q/V/EU4twMDsr8MIBzObQoFyfGN/fW7FDWJs25SSuOeNFV0hEVI8/hsPGNE5XgiREXIfI4ym3odsd30z2y5RfWVAUB9jBru7yWsVwJ0r4UNydrC/ES3RIOy5P/pUgCOrGqmHwhun5rFxZL59PnJpfeOLlTDEEFaF74X4SO/+/hBLf8eaNR7a4ZxSpfVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mihWxY8hCC3E1/feUiP+NAgQY880mNytAOxKEvJ4Tg8=;
 b=f8b8xz8R/A2pA5LnLLzw5RkUUvDCJ9nDlEMb0ClHKGzypBWWRDjmKPlQfMevgYNViSNiG0kXeSZlhXHkJmPmPTpFP6U2DWhsdu+KYQaVfkd+BW7TIIVfynedePJxRS9mZNaXm1TOCrvyRHa5NupbsDnPXoGbta1fOLlXednpmanrqeixfI0BAj110G35v04Xnc8TpOwSmwhR48a9b4DVMsrqtdGPQi/QQpxaNZezV66KPCXCn325xkYMwpm5K8C1ODABk06PUKlncLPvEXEZTef6EMr+wx/KwNb6WYbzj6tlUNnIwcPc9Psg6eyAr/Oj8rySHeIkAsnMIw4pQJ0iXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mihWxY8hCC3E1/feUiP+NAgQY880mNytAOxKEvJ4Tg8=;
 b=F+YVwzR+3xt24lV4g0FA+eMYWgpb6ZyrmdL6UOT1l1+GlAnerPl+cq0tNvSEhJS+k4muve/REcMwKEfXjtPo8aBRbSwU0pGdUIhMEHET3qoHeRmrj5ZWdUMuLElwEfhXZf+EFewaLosGlWDchv1m+swcGG3TX1liK2Kq72BYhPW/qgh6MHsR+rfk+ZDX186ezETnY6WkDIFwZi8oMFlhLX7C9xdts6ZpZntYhpijUiDB9bSwgJm+M6QcuhSTBpiLoXeeCQYSpI5KbMdDUEfkAjAbcjh7QWbaP4ax4K5c3dz6Hdgr7tvpJDCkM9NmJrJD01qxfpATUbiCGFs6DHgGtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12352.eurprd04.prod.outlook.com (2603:10a6:800:322::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 15:07:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 15:07:15 +0000
Date: Mon, 20 Jul 2026 10:07:05 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [EXT] Re: [PATCH 2/2] arm64: dts: freescale: add i.MX952 FRDM
 Board support device tree
Message-ID: <al45mQ_okIqpkDW1@SMW015318>
References: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
 <20260720-imx952_frdm-v1-2-6d145eaaa5c4@nxp.com>
 <20260720065549.C24301F000E9@smtp.kernel.org>
 <56975936-9db1-431d-91a5-c038dc16c196@nxp.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56975936-9db1-431d-91a5-c038dc16c196@nxp.com>
X-ClientProxiedBy: PH7PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:510:23d::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12352:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d185fd8-e201-41a9-7259-08dee6709532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|23010399003|366016|56012099006|11063799006|10067099003|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o3vVjZeu+zdqqX+k6yj0+M4GgfTTFPIRUmPS029QiaHlHx+eEdI4MFRQHRu8BUNLm8+zTSsOY7AsDF6Iy5bduE+Y+QSHERtClRuoszumxNYBxvLDqpREA6xjPl80BTsXbCNpk0ED7D2FZpaQCjj0jZVdquxilvLJlYzE0f+EQDU8skbKYnbiOejaYoJYY4lb5wi0aGJe5ddXCCNnwPvqum8fV9GcQ3QPvMxhzl/yi31sSoLRKI+EOMn+bNNMQCenk+ApUuIUZq6842ojP3l0giVo6G3G0aHnc+w4U1Vz1rWe1LmxrN06Rcu43jiOa+p+xoamK43LLmcG72exIQ5lbP420GYqO0MgG5LojrwgwH8oHkd9RB6XnJQyA8XKInGtl0smzZvivcxC7P7rMPImJY1gESFtPa4T1Ux26zDT05RMBjxU+oYk5eywJKgRC7CiSuzs1jfIlDQ5GeboFB5grnq9tYiD553C/EMX9IFQiraMCoC9C24RKWB3BPgpNijd/e6A360cQO1QP62aJstZOkqf3klMXjHecCDnwJP14e62G64OPnDwvozS4z+H7b0ELRE8THSSQnppQJ/DCQHDK3xcrjW8FcKC8o5YJUTVEBI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?rpNvPUmj6haWgcTTEwwokJU75nNnvZjsl/2IULerZXJ9DfQADmqvdYKOAr?=
 =?iso-8859-1?Q?+XxGO/LEOeXwdrt/l/X12LYwthnLO91IpL+6eY+tq3CbMr2vBJdKazlXwD?=
 =?iso-8859-1?Q?CKsPpz9vM+uvAMlRijpkRyjDGLF5qyAoOaLgTV1hTap200EXyphyWSaCLB?=
 =?iso-8859-1?Q?FSWRgHgUeXrVhhpPL11OS7zCqViwdwX5vwf8Ka6BgFMQzpGl1IbD8oR6vQ?=
 =?iso-8859-1?Q?8Lm7Yfw9LUCu+hRND0QGlX/CdDxKheu2aQ0zrkXbzgwdU5j1na+QHSwzMs?=
 =?iso-8859-1?Q?ncTYM1CsoJzmDFsadL1bivLaV0/qKBmeLwm6SRgGfC4JDCRc5ai//kovNN?=
 =?iso-8859-1?Q?xHCK7mTKjWbxrb6+7tt8xC7Rvzrx5+VEYOk/D/L3DVmvkMPmKC71DzZJoT?=
 =?iso-8859-1?Q?orjZpoxPHCeMfK3VZsNILpL/3zpCQH2w1iWMuSgUUmsj4k+RDxMzLGezPS?=
 =?iso-8859-1?Q?yS+hxXoD284xa0sHRk+OSg/G8clYKLyL7JY9zPHuX3nwmNJefJM5fdYeyb?=
 =?iso-8859-1?Q?VERuBTSryL0iiDXWM8pTucYUsRd2gli+Neq1XG8gTvsIjUMA3R2Awv/UTq?=
 =?iso-8859-1?Q?pLBgki1Xmc4hoExWDOtTzB8nMnbD2z/8XMNdFCBcwCX8Ci3jxmYTRQtiFC?=
 =?iso-8859-1?Q?+xM9zu3GerC8K68opnKfkXbEeOzVXEC2lJIb2T9U8ZsikNqAQC18o69rNi?=
 =?iso-8859-1?Q?VQq3ufpFfJq2E57Gjpf1tE4vT51UQi/avjCG/Rrel4s7dGI6IkPdB3ziJe?=
 =?iso-8859-1?Q?1VcfxoYR+X0CCoStsV8JCQDJZMAEsEpyUzKpMLtUp13ILkJ0L1mv8ht7lJ?=
 =?iso-8859-1?Q?YHjXzX9UFkMw2Hu+xuVL5q9BvA3nsyRZOnJ6IqjliRAJJ5IOFRgQaBQGMu?=
 =?iso-8859-1?Q?jiknaq+dsNdeYw1OizkbhRSgQVPp/SOmv3hS8wIGARoFBsYdyxP98tDQl4?=
 =?iso-8859-1?Q?sPGWmg7V6vaGh3HvxfPGeDkye2/ENoXZgKRiVQpQlYrY9wCwhBz2DKfULp?=
 =?iso-8859-1?Q?c1qqQNBNEzm3IxlUjFZAqRumPSsNuAyMoCOssORmlH0VXGfBYz9bHoMaba?=
 =?iso-8859-1?Q?Lw2Ukgr04TJi+l2+NPmXJDXcbsElTKb/kgaoSb3z+WRUzG5ss0ZpFb3eW5?=
 =?iso-8859-1?Q?bPwBgMnakY6ItIKqGb/aK49wkdZb84PHJjpY8lo2X/iCaVIsabNcoO2a2i?=
 =?iso-8859-1?Q?gADYoNiV9mc4vjTZRGqtTeho4T3F2k8r5tKYGlg6D6O1qIEr9Jioshrbn/?=
 =?iso-8859-1?Q?fhLzjP4OomE+uL0lrw4FTN1jMn64uCwZx2ToPEo7hZxFqxFx+gOOO93RCA?=
 =?iso-8859-1?Q?1nBmK7gfFZjYQYRWIcFqNyC88yewKR5+kj6nKjSwukwOIdklW/ejdXWWlg?=
 =?iso-8859-1?Q?8r2cGkAZ4fDb2ii5cPeHJp9XNgnsvaOE2/xQW2af5NFsfE9CfItjectJ1Q?=
 =?iso-8859-1?Q?W87PabAQtDrSWSpTCOfgXQYFhGScMRTY11ViPTv8vAyiEQck7BMVJnSHAw?=
 =?iso-8859-1?Q?mEFBdNZ0dhlta1v/Hn6kjqFkRQCoX85WySfvdfAujMeA6xDHZQQ5Tyy9Sw?=
 =?iso-8859-1?Q?KaLlcJoAm3+U3ZYgPYadyaR4C67p//Ra8dGSrIlVVH8o8pUW263hC79zoP?=
 =?iso-8859-1?Q?1MqOX2Ma3gE73eu+nmAdRwE0TqXw2SFIzgJ7T9mdwbcSUSbuUpoLyhhved?=
 =?iso-8859-1?Q?sevhlhQoYJuI/9oIIkOBA6csfxnjh5JRnjSd0O9y9BobBD27LXfnV3Ecn7?=
 =?iso-8859-1?Q?SNchss/HnTtL8Sbz45A8LacDd/3/x5XayLoQQuoXP1HBGzBUtIr89jug+9?=
 =?iso-8859-1?Q?psmIkWeEIZGNBaOutTDS9EN1T0hwJkt6Yq9N+GN8KWI97uCi8/IM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d185fd8-e201-41a9-7259-08dee6709532
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:07:14.9891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmZRCCdaS4vUnudXw3IHPzh4SVRI6l/FVM63wq/HIhK51UC80ShXZzCnPnvshPev9NnrtC7Hr5+v5O9QBkd7lr1zR57Fo3TU7JuraP2bWUxZ+cJv65dFgWL0jEELoWPJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12352

On Mon, Jul 20, 2026 at 03:03:20PM +0800, Joseph Guo wrote:
> On 7/20/2026 2:55 PM, sashiko-bot@kernel.org wrote:
> > [You don't often get email from sashiko-bot@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> >
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > - [High] Shared GPIO requested exclusively by two CAN transceivers causes probe failure for the second transceiver.
> > - [Low] Use of undocumented, downstream-only device tree property `fsl,cd-gpio-wakeup-disable`.
> > --
> >
> > --- Patch [2]: [PATCH 2/2] arm64: dts: freescale: add i.MX952 FRDM Board support device tree ---
> > commit 8bbcb28d08a05e0f4c57023333492b4e023f7caf
> > Author: Joseph Guo <qijian.guo@nxp.com>
> >
> > arm64: dts: freescale: add i.MX952 FRDM Board support device tree
> >
> > Add basic device tree support for i.MX952 FRDM Board. The board-common hardware
> > description is placed in imx952-frdm.dtsi so that it can be shared with future
> > i.MX952-based FRDM derivative boards.
> >
> >> diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> >> new file mode 100644
> >> index 0000000000000..b9ef6bec2bd5a
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> >> @@ -0,0 +1,727 @@
> > [ ... ]
> >> +     flexcan2_phy: can-phy0 {
> >> +             compatible = "nxp,tja1051";
> >> +             #phy-cells = <0>;
> >> +             max-bitrate = <8000000>;
> >> +             silent-gpios = <&pcal6416 6 GPIO_ACTIVE_HIGH>;
> >> +     };
> >> +
> >> +     flexcan3_phy: can-phy1 {
> >> +             compatible = "nxp,tja1051";
> >> +             #phy-cells = <0>;
> >> +             max-bitrate = <8000000>;
> >> +             silent-gpios = <&pcal6416 6 GPIO_ACTIVE_HIGH>;
> >
> > [Severity: High]
> > Does this cause a probe failure for the second transceiver?
> >
> > The first PHY node successfully requests this GPIO line, taking exclusive
> > ownership. Because the phy-can-transceiver driver uses standard exclusive
> > requests (without GPIOD_FLAGS_BIT_NONEXCLUSIVE), the second request for the
> > exact same GPIO line fails with -EBUSY.
> >
> > This prevents the flexcan3_phy and the flexcan3 controller from probing and
> > functioning.
> >
>
> This two CAN PHY did share same pin as their silent-gpio on hardware.

Hardware share gpio, but driver may not handle this case. Are you sure

flexcan3_phy probed if can-phy0 already probed?

Frank

>
> The same design on i.MX95 15x15 FRDM. This should be fine.
>
> Regards,
> Joseph
>
> >> +     };
> > [ ... ]
> >> +&usdhc2 {
> >> +     bus-width = <4>;
> >> +     cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
> >> +     pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> >> +     pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> >> +     pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> >> +     pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> >> +     pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> >> +     vmmc-supply = <&reg_usdhc2_vmmc>;
> >> +     fsl,cd-gpio-wakeup-disable;
> >
> > [Severity: Low]
> > Is this out-of-tree vendor property invalid in the upstream kernel?
> >
> > The property fsl,cd-gpio-wakeup-disable does not exist in any upstream device
> > tree bindings (such as fsl-imx-esdhc.yaml) and is not handled by any driver
> > code in the upstream Linux tree. This acts as dead code and will trigger
> > `make dtbs_check` validation warnings.
> >
> >> +     status = "okay";
> >> +};
> >
> > --
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com?part=2
>
> --
> Best Regards,
> Joseph
