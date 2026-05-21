Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC3A379C4E;
	Thu, 21 May 2026 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779381533; cv=fail; b=orVsnVxgYqrgfanJoNeSnVtAeTaaebPB9OpZjZF98JN+7ND97EC0ik/2wiV+RqDdYSWjkgN5NA7bG6TG+aT9tGPJgFRXuCUsJSPVKIwPzk4W8Mq2GTqUCaOuUSntH6DYG+FTSGJ30VbU9UC/1r7pPNWn8001c9f2LXxwDOXQSTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779381533; c=relaxed/simple;
	bh=QD7nju/7HQbr+8oDecBbqrNydJLdRU8smdgCqhC2FzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EIjJesQkKIPGv1q1rVpHeRbhgzVo9p6bzudR0AugEvv4zv4hiVlI+4D0IV+QFqvsYhfRscXnYD7QoryD6nNkY9LwZnQvjkpk7SDzLK2cwtMEc9yyQzuu2ie2A3w33fixEdlOyxqEN3lZhLdxdzhbw9pKQD7doeze0MGTBUgsjmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fVi8EFFb reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fVi8EFFb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8pGBJllNCVdaH0TL/8VH+JlpfpbfyV8plU9/bQEkMTkmF8SevWkWeuoYL1lvsO9Dgz0mYpL7E7DJQrFx6MgUHOZTxLZADLm9Ii5csZ2lxdoqDFHUAO0YxCsEhHuehHxLmxGxiAcYjR9woN7xoFib1vke7y5i99UHOQNwTfqwBQ+EUW6ti0kZ4SrSC+1hfhHyXWvZEj/lP97UwPpltCfWYUVM9Ks6PQBo/fkmzDgYD+SfpuQDH6xG5ibPDqT+f/CNJkGeE/j4darST+FAvRKsSDEc+/URw0sSAUbTIlGV7UF4D44LLUGFZhy4MhML8pG5aDcADlYySYKvzsZeRmvyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSYKlVcnUoqmr60X5ozG8fV843C4VkHLGzRKx1cdENQ=;
 b=VgtPr//mUhkxzD75AS5t9taHdNSR2OiztaEhKd4pTLMEhgIAp067reJDffiwHU/evu/xUH2lfJZ4BbnrnFcIHGtT26ZfClDMKsx21aLRsV3ePGY87dAhOH43RkDFQB99zxzH3OjYzCrdl/Troqgz3EwcnQEpDuC+chJUl4eIwOY4JX9Y7YRHz7CWC846Z3wI6xyQJsuMTQ2Rmmnw0WyoS4D07RcUTDpfMWwJGXC6Kfxp9mMPaGew0n0cODZPWkncLfI+5eWkz6N1BBNQ5DMOkxyp1NQLOvEal+b0AzE6MPSNaiIpeVkXIJVFHfw+rVHZ5D8pgA/VZD4s0TKPheX1GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSYKlVcnUoqmr60X5ozG8fV843C4VkHLGzRKx1cdENQ=;
 b=fVi8EFFbPYsS042BdSymi6JsTv9+b8CWSq4Ln+1Ek3/vO3iWbaciBfO/FwJphbab/XyIYZhQLSAfA42/YPb54PXbYBhRUfAbI8SBq42fFf6FgvjgIJ+93dsbuVUhAnh+vg70rqaZ6rsfNFuMnJmEwXbP/1okjyZ1ja3guXke43HJh3AWFttiKc4Ey4f0M3W5Xtjpx/wgLsaqhTCIzoMnSM9TngMq7/3klk8XXFgoyOLAFceI4bpTD+cCQYkHRjq1nRgtv70FSjuhSI+PH26XWV/hYQcx6QrW2nNQ1+AEdujjBHHg2YzgmwMaEXWwKURBuNbBu/FQ/OqnI525OvHukw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS1PR04MB9407.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 16:38:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 16:38:49 +0000
Date: Thu, 21 May 2026 12:38:43 -0400
From: Frank Li <Frank.li@nxp.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org,
	imx@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: freescale: add Aquila iMX95 support
Message-ID: <ag81ExSYKmx_WEJ1@lizhi-Precision-Tower-5810>
References: <20260521-add-aquila-imx95-v3-2-621843807def@toradex.com>
 <20260521093854.14DAB1F000E9@smtp.kernel.org>
 <3pcmepn2kr2b2gku33mriosmnim4xd7e75pt2j7i7vnt4awhgg@3cptbxl5u4x5>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3pcmepn2kr2b2gku33mriosmnim4xd7e75pt2j7i7vnt4awhgg@3cptbxl5u4x5>
X-ClientProxiedBy: SA9PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:806:27::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS1PR04MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: b6040644-37f0-4cf5-fc26-08deb7576f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|52116014|1800799024|11063799006|5023799004|4143699003|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ruq6bQdpG0VkswGLCZTfuFv9pg6ojLvO+ySIvAvz9Mv/TSJEZ+F2Rt6rOi9EwDrjRwNQct3v4cvF1CUWdoWTYNsJ67NymcI7OG8XMlFe/Z3sL+qAgyI3yJcPMgfVG+A2cOtJLYBJDOZLF3NpuY0yHhSZxLr2UFoks+6T5lgE6lF2qmL8jYiwTPm9c4+5dP3BBD28XUrZaPKiz14btNpMF2vTFGI49980oUm6iaRAqobjmOxgVyBWvwdxQjn/vO/fwOG/5mSeV4wicaKS9YaXgcb6cpsgcNRVtasbjFXOQ0eHiliacn11XhfSsXlYL29lGDsmLU5kJ2Y1riX2Gdpnfyw+5LbyRMvbjN2JdisAie9bAQjIUTgtqJTLb8/fdmSRNgWn3yVfTW/aTKIOvGBM4UA+pGEKDepEZ+tU+8CBlQROkeNwx5N9PIGu/+Y6QR3RK+miOHAXqJ7we6IdqUe7H2DyBecyGHejCrOGXT57eGuwhSwvAjmIWbirfi+5MVd6XyliDe4MOhBK3kSOGzmZk2VIdc/V2Bh+6lEXCBBDhU7KL4bPxDMA5UFsLycW3Dl2GrEeYgB4jGAWaL24cHDnqKe999JMdrX/C3EnZ4/d54Giqb/k5d0xC0w+nKLyM/0HaGKtvwRbUwDjP0wAm8pHT7ublc0tgYvtlCjIdsPfwmmSC6syuHG0mJZAaxrI8KSD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(52116014)(1800799024)(11063799006)(5023799004)(4143699003)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?mLTN9DX4vn2xI3u24cCvf+5eqfM9Gfq7pZWEmMsjrGVlSeFlFJtCkgRBlj?=
 =?iso-8859-1?Q?nCzcRhoYDmDkqx6qL57SFuZMRp5dV8uoFKLNpL4Gkga34Akv9GLGZUoqaH?=
 =?iso-8859-1?Q?PAcqt92cwWO6wpD6jBx2DW0Vr77WzgLAYq190VMbI7GTwqC/hZWNQn+2vP?=
 =?iso-8859-1?Q?Qud5y8q0XI8KgiBFRyc3DhBesbZe9qeEHXyajDOqM+z0b1Gz1iSCMI+ZYh?=
 =?iso-8859-1?Q?mw3f8JSHmxNCBUdlCuvjtY/oSwZKb34Ve+NRYeOLKtcIiILfK5iYuAITBa?=
 =?iso-8859-1?Q?Ng2AdrfXEwTeeOiwtiQhxIm+zICKojZ1ELBlVzfJD0fml1VajDDXwf1mlI?=
 =?iso-8859-1?Q?DpOc0MCRy0jYOChzxwf/jFOaIr1hcRztM4inKLS0KmqJI2I4DQpkYWFAF2?=
 =?iso-8859-1?Q?IRCTo62guhnsKX440rnfpjAbdN0+unN9IvdO3dQgeyMp3hakdtQAkpJCld?=
 =?iso-8859-1?Q?kJru0sLA7eOfXJbjLvrUIB9fqpdJNRyKUca8hANE5iGKlK+WkYbhJl678D?=
 =?iso-8859-1?Q?rz885ARcOfulybzZgazyI58dbOkBW4rR4oGxYntstFHF/AucZR2+ZRCIne?=
 =?iso-8859-1?Q?IJBGANMl0z28BMFRzOmbitjCfWybYx85Dc4N6xpnC2Gwdj3ZR09GbuKJtc?=
 =?iso-8859-1?Q?EwXTOGz5/96HbcWOyev5adFVJsMpM+F19CYmX7MLWFPDCqBytCZbFFrbDy?=
 =?iso-8859-1?Q?gM0enhDl7bSzh++WHiChBkRCZ8bTUkSeD0kW6BaLY7hZ7BeLMr5kFFHGSC?=
 =?iso-8859-1?Q?8yEy+MZBFE7S2oqN/zj/Rty/0i6VxmC1prCcVmLPSt0N3lDH8uDSTm5atY?=
 =?iso-8859-1?Q?Uhnk2Tqiyi5ziGaD3j9ZKniX9t1M15QCMa9yAfRvN+CPAXszaK8AUy19su?=
 =?iso-8859-1?Q?vVNqVqrx+3XcOa0p1DPG9XfJPcoqST1mO/slrRSFZUXsnj7Up7997J/XIF?=
 =?iso-8859-1?Q?j2gUiyj7TrxBa1NhJlIXaHLs+O/w6WWmIYlMfKlAnzhK8AswKklZuuxd5U?=
 =?iso-8859-1?Q?BkILFJQgI5qP75OkumjkkfQP+VnCVNGbEp1JmYU7qoRX/mnrZG3cqa37Y8?=
 =?iso-8859-1?Q?7mwcHap6LepmjTxSSOeox536t2zJZdW8jXtpjA4fSqp/KwJf0JMgpQ1+nx?=
 =?iso-8859-1?Q?FDwwrVo5w6/CjsMGD1AdaBqE5QkQZGWhg0t3Zf9KN0xjTkH30gCryuDwxl?=
 =?iso-8859-1?Q?AogxthHqe3AXI9KmJDIGZvCnffgN7yBagOTwI+xJ3dpzXi9w5kw5XXXYbp?=
 =?iso-8859-1?Q?b+zb22+K6n+Fn2LRjgL7dfHelXlmSsQ7ChjSHwZorDDIfsuzqJUOlMi+lO?=
 =?iso-8859-1?Q?IInyMV8dbQvsyv3nQAoL7DUJkuYP5wM+Nr8D7KfSZFox8GoCZaytofzkbQ?=
 =?iso-8859-1?Q?kO/ql0EARdVgF9f3XknHP9Kp8zDp6B/WGlRcvNRGNC39doA6wALzCpiJOT?=
 =?iso-8859-1?Q?BH5c3FgO1FVFDJbT/rzBWFeQhQh9EyBDJAFf0kWeKrfzMlIFmX66n/9kV5?=
 =?iso-8859-1?Q?pijS6uYgW7oh5fm+QjC7pTFs48YGBn991YI435D0G1+qxDxGT30qH8ycDw?=
 =?iso-8859-1?Q?2Fuxsj54aTRhIIHkuZCILkq3nfOWmK9mEpupq933/Yh46JpsP5pf2VgqqQ?=
 =?iso-8859-1?Q?nHUL3C8qZBthLl7LbWsFbh+xjn3UGtWDjFFr8DYnPLuqsHrssWotnc19ZQ?=
 =?iso-8859-1?Q?LdTgWA/ikuLAKcpX2Jf56QErqUxhm0yKmiFCrbDgKgmzDVmMiempUmP3LN?=
 =?iso-8859-1?Q?kHuBOUsWgqh9mzxb00Xp2v1sPhrzxI82CjU/8C4hzkJWXK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6040644-37f0-4cf5-fc26-08deb7576f2b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 16:38:49.0650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7UDapA1HJsrhlq/x3h48sGQNugOZNIm/wBXMNRAZRLsKtfSiH0XBE9w5ao70LUsPy2Bmxpd7hn/Umt/lDeeyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9407

On Thu, May 21, 2026 at 12:18:41PM +0200, Franz Schnyder wrote:
> > > diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
> > > new file mode 100644
> > > index 0000000000000..bb4a3631af9ba
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
> >
> > [ ... ]
> >
> > > +/* Aquila I2S_1 */
> > > +&sai2 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&som_dsi2dp_bridge {
> > > +	status = "okay";
> > > +};
> >
> > [Severity: Medium]
> > Will this bridge fail to probe since the DSI input connection is missing?
> >
> > Looking at the ti-sn65dsi86 driver in ti_sn_bridge_parse_dsi_host(), it uses
> > of_graph_get_remote_node(np, 0, 0) and unconditionally returns -ENODEV if the
> > remote node is missing.
> >
> > Since the upstream i.MX95 SoC DSI controller doesn't appear to be implemented
> > and linked to the dsi2dp_in endpoint yet, should this node remain disabled
> > until the controller is available?
> > --
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260521-add-aquila-imx95-v3-0-621843807def@toradex.com?part=2
>
> Hi Frank,
>
> This is valid point from the bot.
> If there is nothing else, I'll send a v4 that removes '&som_dsi2dp_bridge'
> from the Dev and Clover board, since the node is disabled in the SoM dtsi.

You can post v4 anyway to let sashika check again. It is always quicker then
my manual check.

Frank

>
> Thanks,
>
> Franz
>
>
