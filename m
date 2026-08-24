Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1C225B083;
	Mon, 24 Aug 2026 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582955; cv=fail; b=kV9hdz87wtymHCcCziEyDi7YpFvHt6mDwUAD98n87hWJxonpG07Sw4PMbwQVGTNpNSjaDkTPYOCqx1rPD0B1VF11yoXhfdYMfzhxAhQE9ZLjmmf3a/nXY+WrFKL3L+kXukNBM+aPdfZovxKHkwOd6t8+AmiTHu5YkzSfXB+irZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582955; c=relaxed/simple;
	bh=Lo3hCahDRr/DpNU3A+syKZQjZ7dvFrOLUIE/viq6qNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R9NtF08chCqLDaBR1W2vrgLYY/5NNf66uUqWsMFbGVTb/aovUahTlz41LZfTeOLPsYO4C1LBAh1TeNqn7RUnr1bixTurfoCqYjeI/lYEAD1aUy91pdmqxAppd6jP2e57HgVqUfZroIv2a4xu4mAFnozSAPFzO5JgvqHOpOC8fbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oujakUfo reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oujakUfo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhkuKxUL/A3d42ngiakKCsOa4+gNK5XfhzO9VkzvKuA6v/UhDW7tRz5DO5T6tKNrsXY2dmIWPjzpi1I+uu+aylvuc6Bs8/hphG0Zzyx6b9TheeLbqe3vIiruPXdBL6COqjxbPDlz6z8KT5lqu5xaI8V1mOzWuSEnzfadiZ7Pl4f4VvLn19A1gp7DsCja4YFvgiGfCdBAkRtlL9h7yJrnxgMZU0/LW+ExzyhGBZdvbFQYyWJrcp2b/S3DaQPqntZB4KMdwl9E8MJH7TGVTDhOkDoURhdfoj1MxROsI0ljqOVIiaZDI2GlDtoMCMdBxTXTSCe0ehIl+PjdCaPZRKnGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIaBEaAu8w2BzfqK0y37hvOLJS0lARci2eMr1xpur6I=;
 b=tXWvJrzmD3JdGylQgbDBoy9SOxSN2NQL7O6jlph4Q78gjDTa83qXD/kZ0JUi9LSnSsJk0mUuPKwMJmJqqUTXNDsRBvZMZf/CZHN4kLButSO89smIJsvrkKLpBHtLQs5RJyuZ9LUl6UV/nuqOiEIAWV1ho0dtIh2QF6woyoO2ZCeohScyAT52uOAS5Oy8kLfMn13J/ddXHADL4Z/kJ3uFt/zJrG7wmCLOfXK7E0TKIChEHAeFfYK4Kzunz90pqTeALNY4LFu7owi+Ww9dqhL0cRTe5iPmkKpmh9yqMdrHut0x/FCgAlodmmctCnc82ktuuJfjXIcepqx3zZbeYXfV+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIaBEaAu8w2BzfqK0y37hvOLJS0lARci2eMr1xpur6I=;
 b=oujakUfoJa7wAzqTDYJNlqHWXkkJRsE2ny2+3PBs2dFdf3qXlHWggLsYULM6ZGEsS2Bqi21Cc28t3o4n/i8w1we4wPpoEXULsnhJjnEiipmIVG7VaOP4j8TXjc8deb4OMKl8cjGNquWWuBuwKzj1YOy4KP2d21ct9XOMONi0vaIfD2SmkcwnPCyQCSn6T6uqZHAjGGAkur4iizZ99IcO20ZnWRyE1vnu+ILfPoe+g+R9Q4LPvDSIBKg4M9cIci84IBXDY5xOwq1YQR/ADHcJGXOQAv3bNu2MILk3yWO84yPpNkbRBVIqXeLPosuHG6NqS+k6RTEMJeuJdXkSP0OIxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7686.eurprd04.prod.outlook.com (2603:10a6:20b:290::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 14:49:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 14:49:11 +0000
Date: Mon, 24 Aug 2026 09:49:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, imx@lists.linux.dev,
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v2 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <aoxZ4CILG7YF6FJZ@SMW015318>
References: <cover.1787566980.git.stefano.r@variscite.com>
 <f54545f2a08a558977b0e76bd0f44b2cf1158783.1787566980.git.stefano.r@variscite.com>
 <20260824104141.247111F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260824104141.247111F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA1P222CA0025.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e78ea6e-3d51-43f7-eec8-08df01eedba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|23010399003|10067099003|56012099006|6133799003|3023799007|22082099003|18002099003|4143699003|5023799004|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	1D42nJ2gTcTrS5lnw4kH9B2eJ2PEF2S1vMYfJuBHqmT9WpPcEmspT0Nzcn9/LD1Tw0tC57jGb9CluZddSmhi4tMEj52AfC44Rb5X8p8XWrRWMfkdUDIAMdfgFJ6UPdKN/L5h9sWheYH0WGw4y2omOSkIUoH7ZanTzwVTRSitvq3qr/8FxChZWRQ6A61GfCo8qvjP0milBT+Z38Z1GgRNLDeI1rguOyxnryZA0QoblC/usvd5ByGKtXSU2dOZBJMuq8Z8Pc3dQmfetXUKifmWCgXASxUjDYKG6Syes52962ivnBRsT+9sXlizoSh3nQ3kJcnyxZWf5lvqIZlyEZtq8CBQ2UIQA3DjrNqIoawSYCP3dOfzkBKhTuPbo1ZWvamdN/IgO7YFFp+/ME9vOeVgXDa3g48g+vjrsPa0EnE/OHtobp1YBrISzjWpiqgYy4J0DYZmkmkXm8IjO6Xnnm0v/BAYRMcC94/UAW05zno2vfYBRdihFaAMDmavjsXHuMsjzCtUNmuPf7Tw/YOR8b5Q0JnVcjLGAEONCgzzbV+tCg/1i6Suwl+S5vbmk6GOcQZwkr1iPxNlZCn88UNE+ui0WXUHcVHwnKHdshWQUDtENA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003)(4143699003)(5023799004)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Rnp1FFQW/AO93tYHbd+c5Ze6zDpZIvu8aYeVQU7u4emtV9oUNqMRQk8UiR?=
 =?iso-8859-1?Q?QbBNsqJ8EHgwHvC9xGff04gvjmlVsAVoztmuzz8hGM+Eu8Ppqn63hKj5Gr?=
 =?iso-8859-1?Q?Qj4XqbrWHf8WXCHZ8nKSmovXtMd3z3kymp1BOCWNkIzojD8NF3ZKcGdU6L?=
 =?iso-8859-1?Q?r5cwXnna4JJue/LCUGbQhAaKxA2bdd850iocCWYJfAMtvV7JafXW2XvmbJ?=
 =?iso-8859-1?Q?29ILDHkpohoXLPoMF6kKD/VuCZF8i72+xlRmVvhNC7jdEk7FiT2lRsT0Cq?=
 =?iso-8859-1?Q?SWjiClOUL8FsKmZ8au8Qy5hFNnM+El4JA9EMtmxHuaobqRdvIuC+O+X52F?=
 =?iso-8859-1?Q?QP1sF0qo7fiOR1NcTQTpDM9h74Q5I9udwG+mXgw/edzXt7MH9NK+JjCy5v?=
 =?iso-8859-1?Q?TKvsvs+xMqSSwmx7XueMRPSELnmffoV51xYsr7BGE6AYbigrXs/cxfMQAV?=
 =?iso-8859-1?Q?EYmtD4RrSKApsJMie23u4Kg26nSkrfVQgI1jJhcK09RSo+eL0o5Wrf1PUk?=
 =?iso-8859-1?Q?STd6WszWxL7SL9abn8GCg1TON7dI2pNfGX3F/Ho8Kz7BdbLH6ffhpcIGEw?=
 =?iso-8859-1?Q?eIVNUubOlFr98lLymxteHjAl4asFD+CAA2KJZntivy7UPGeW4nzGfAAro2?=
 =?iso-8859-1?Q?X92vMPL+lbMM3ZTbqH0W3DkUgan41Id45RI06EtxUsnpAZH2eY2O2Sjtep?=
 =?iso-8859-1?Q?sn9Oy6dPiCycgRAM5HeIwsEk6nat2gLWTCbClx6E4tmGJ7mAKLm5Xg48y/?=
 =?iso-8859-1?Q?MLxJjRjULxEUpRZRAAr7n9v0z5vMNMN79IUUj6Uc1l9R9vKfC4iNP0ClEr?=
 =?iso-8859-1?Q?4pem61xgl9lBQmjbI8jx7b6gT+fEavhdkKYNyHB5xVmd88vcJKS12e1XCx?=
 =?iso-8859-1?Q?65qwgjqDZpah/DyMPJiNktX4Ff0isOkdTGBbEgnZYkx7mwBJvoJ1fcqV3d?=
 =?iso-8859-1?Q?T0XFCWnU6g425DgGGycfeU94deF1po1yNRwCOxk+39s7IE+XQEk7ezkBLm?=
 =?iso-8859-1?Q?EJNwzG1dPjaGLFHyL5acTanRvOW3f/knVr1XQorsf80kezw/Jr1r71FvXS?=
 =?iso-8859-1?Q?sN5XikKOOKw98hJfIhMazsBYiA7SEyPO5LTDpcpbfmNMo+UepoXkB7EBoy?=
 =?iso-8859-1?Q?QPIgIkcJdiLYGdECW4vR8Cx4dNvvtUZaEM/pYd2joJsrwB/WHCDQWU10lo?=
 =?iso-8859-1?Q?Bud/cCebRn6gHu2RDx8X+CaDk6djyFUL+KjftfzsRNy8xg2P6AhlPcmlI3?=
 =?iso-8859-1?Q?UfajGc4YzicM4j2rbvTrj1nQrlnGdvQVoXGi6EHv/PGE2SnqFG0NMHwQfv?=
 =?iso-8859-1?Q?kvXKFeYPqgeP5ECiIQ2amAtXKvM2I8Gvh8AEN69Ja6q+IFoUQjpB/VF4ru?=
 =?iso-8859-1?Q?0zJlhyK/GJZOT6uL8DHpKNvC4inrgIURjFWd4g9ct7YjckNMfKzOPkBLHX?=
 =?iso-8859-1?Q?Bp0hF7JRGgKt4penemA/XfFVSiGA0B4wpTWgYqT2iPq6YGmPENUi8ZkCCO?=
 =?iso-8859-1?Q?pYhvh/M4PzYosGLviTc0/91U4R3WjEfP+wZpJU9qPfqeVTC5N4AleRRHVB?=
 =?iso-8859-1?Q?75Mh4n7cPXmIVIN8UirGkDE9mSnd4wNQgNisKXiUfRie9dGaoOArQ5D2p4?=
 =?iso-8859-1?Q?aswmxKToQ4905RyXxXiPaEi8tP5MpqAsttrpyEUM1JIjd0EixwLFOx0Ug5?=
 =?iso-8859-1?Q?JFhN6ALEgUfPOxcpfY4+gr+aT5UD+NyROSN7CokXatuK2iXheqkGhkblEK?=
 =?iso-8859-1?Q?d9FpTSMkvZVPLLFzWdK45VpctBGFzGSW8w0X1WRlkU3nsU2Vuu8DBeUmaL?=
 =?iso-8859-1?Q?FYw2siFMyl++FBJJRICIeiUsdJq/sTm8MH5hAJIz8EbXt8EE1TOv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e78ea6e-3d51-43f7-eec8-08df01eedba9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 14:49:11.2078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGJYIKOrCH9x+9t6ibwvjxcoifyYo+E832Sed+GI+bSxO+I3ROIvHBDg3R0nNhgwJnbszQLv44g+pVfVnhSSJrtGVXRqUNTHNr8PpgHPZmqzG5AYYArjW0ENhqnvYaA+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7686

On Mon, Aug 24, 2026 at 10:41:40AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Overriding `assigned-clocks` in `&sai1` drops essential `SAI1_ROOT_CLK` configuration, breaking audio.
> - [Low] Missing device tree binding headers in `imx7d-var-som-mx7customboard.dtsi` causing undefined macros.
> - [Low] The SoM `.dtsi` file incorrectly includes a `/dts-v1/;` directive, leading to duplicate directives in `.dts` files.
> - [Low] The `usdhc1` and `usdhc3` nodes specify `no-1-8-v` while defining unreachable 100MHz/200MHz pinctrl states.
> - [Low] Device Tree node names contain underscores, violating DT specifications.
> --
>
> --- Patch [2]: [PATCH v2 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support ---
> commit f0d7c3577a1db2d9fa7ddee6134d561982409054
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
>
> Add device tree support for the Variscite VAR-SOM-MX7 system on module.
> The module is based on the NXP i.MX7Dual SoC and is available in
> multiple configurations and hardware revisions.
>
> Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
> > new file mode 100644
> > index 0000000000000..2f8185f8c526e
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
> > @@ -0,0 +1,99 @@
> [ ... ]
> > +&usdhc3 {
> > +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> > +	pinctrl-0 = <&pinctrl_usdhc3>;
> > +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> > +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> > +	pinctrl-3 = <&pinctrl_usdhc3_sleep>;
> > +	vmmc-supply = <&vgen3_reg>;
> > +	assigned-clocks = <&clks IMX7D_USDHC3_ROOT_CLK>;
> > +	assigned-clock-rates = <400000000>;
> > +	no-1-8-v;
>
> [Severity: Low]
> Does this no-1-8-v property conflict with the 100MHz and 200MHz pinctrl states
> defined above it?
>
> By forcing the MMC core to stay at 3.3V, UHS-I and high-speed modes that
> require 1.8V might be disabled, making those pinctrl states unreachable dead
> code.

Make sense, please check it

>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> > new file mode 100644
> > index 0000000000000..ecd4601c12bfb
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> > @@ -0,0 +1,382 @@
> [ ... ]
> > +	gpio-keys {
> > +		compatible = "gpio-keys";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_gpio_keys>;
> > +
> > +		key-back {
> > +			label = "Back";
> > +			gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_BACK>;
>
> [Severity: Low]
> Are the KEY_BACK, KEY_MENU, and KEY_HOME macros undefined here?
>
> It looks like the dt-bindings/input/input.h header is missing from the
> includes, which could cause a dtc compilation failure.
>
> [ ... ]
> > +	reg_hsic_hub_connect: regulator_hsic_hub_connect {
> > +		compatible = "regulator-fixed";
>
> [Severity: Low]
> Could this node name and regulator_hsic_hub_pwr_on below use hyphens instead
> of underscores?

Yes, node name should use - instead of _

>
> Using underscores in node names violates the device tree specification and
> triggers node_name_chars_strict compiler warnings.
>
> [ ... ]
> > +&usdhc1 {
> > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> > +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> > +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> > +	cd-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
> > +	no-1-8-v;
>
> [Severity: Low]
> Does this no-1-8-v property similarly prevent the high-speed pinctrl states
> from being used on this interface?
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> > new file mode 100644
> > index 0000000000000..af5dd6d459ad2
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> > @@ -0,0 +1,64 @@
> [ ... ]
> > +&sai1 {
> > +	assigned-clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_SRC>,
> > +			  <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
> > +	assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
> > +	assigned-clock-rates = <0>, <36864000>;
> > +	/delete-property/ fsl,sai-mclk-direction-output;
> > +};
>
> [Severity: High]
> Does overriding the assigned-clocks here silently drop the required SAI1 root
> clock configuration defined in the base dtsi?

Please check this also

Frank
>
> In imx7d-var-som.dtsi, the assigned-clocks property sets IMX7D_SAI1_ROOT_SRC
> and IMX7D_SAI1_ROOT_CLK. By overriding it without retaining the original
> assignments, the SAI1 block might lose its required clock configuration, and
> deleting fsl,sai-mclk-direction-output forces the pad to become an input,
> which could break the audio interface entirely.
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> > new file mode 100644
> > index 0000000000000..486e9360dea52
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> > @@ -0,0 +1,637 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Common dtsi for Variscite VAR-SOM-MX7
> > + *
> > + * Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/
> > + *
> > + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> > + *
> > + */
> > +
> > +/dts-v1/;
>
> [Severity: Low]
> Will this /dts-v1/; directive cause a duplicate version directive syntax error?
>
> When this dtsi file is included by carrier board dts files that also declare
> /dts-v1/;, the expanded source will contain duplicate version directives.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1787566980.git.stefano.r@variscite.com?part=2
>
