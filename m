Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010046.outbound.protection.outlook.com [52.101.84.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFC032142B
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780411952; cv=fail; b=ZQ8i+Avbek2tat8OUn4XiFZ1VyLaxB6i9WDduUgVVYsPK0NI8ldeRheLP+NArdyTGALDYkVwhdegwJfcv/AKjvs/+gtOqPeD95KpaGYs42y01nlVLIL5ioSheV1kjdYnMAl0jKc1vBub+zE1XRmR/M5YDRCwuO+gCPEJllONCFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780411952; c=relaxed/simple;
	bh=zQM35GPYyJyTsbajqyTl3HUixBCTiIncCgF3eKL9dDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nSbiwGHxWGhdEYYBauzkwGLqy/cgJcwW7WqZ8X90BI33lsGdxSDYLNdGHHcy8TbBB3PHrf3BEFx6Ix7X5gszwlOgcWwXOjGA7EBF2OXd9t8eNyb86uahIEJ8qTukO0IW1ntEUISeOZHpigm90rk/R5Y/zsAq3gK9TfDsIelfG4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W6lUbSUs; arc=fail smtp.client-ip=52.101.84.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W6lUbSUs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sde/5a0vn/sHxhpOdR22KzkcdI3zi9Xd6SPcrlODAgF3PCfJdnnX5iSa90bp+IRrFlS2Qk/wi1UZq0O/hn9gXvS6CdB0bb50FgAykq/N0fWmQQ9WXr/FXB+uUtD6PNUVyHTrssiRoTasqQLqqHpW6orG9BgcL60YDUYUcXobVsGQc9w3m+zFOF+IBNdOHHe2C8ubmzlibNtwIffaqtyXGYXWUXcMhA7QUa1C1oLHyGAv48rkzSv25qsJpCnRgK6yLJsylQP+Oag/OhxDga0CB07aj9stIfAifNmJGgOl+zh+k3qcCcPuE4Pj6NPbBSPogorDwU9X0TNtJOXgnOU92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7OVsoqQ9EEedF2DReVjY6RgDfrEWTZYz219XyDBmkc=;
 b=tI2eai8mW8J8sFZ3WrMb5S6AZB6F+BUmpQ/gxZWWnF8TJi074oJNgigmGilpEj2ZBahdnEmpCF8FgBZEmLEggOqbLy36h4jN7xvvjgjXZ4NCcXxEsGKkEzYI/NIs90yO3NnnaFD0q+zfOUnq6BCWTHenm55Y1KvzBRIxlql1osGOIwCIynHLNKP7oKKAML3M6TpPIDwNRCyJkBSR6X91QCfrzujWP5LyANr1QanmEyzT8V5dVPrZBcVstOsEaV9zUXtoZRSxkRyoSedUGISgZuE3YOM+e5U950TtrNV7ZQKEXFXnyc65dklsWQG9G22Yz5H9rZgoT646PUesTodqkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7OVsoqQ9EEedF2DReVjY6RgDfrEWTZYz219XyDBmkc=;
 b=W6lUbSUswD6MYelXZFlChF+h4lQAkIvD75P9aucCohegce8k9tc0om4gOzkadI0ml50ayMRaY7Q/SAwxYOJJq0OLn7GDhfIIOmhCbK2Tn2yjkSir3OohaaDopPK+YCP88Q7BcAUm2YRqZn3PZ94EzePti0A3y4RkDmvmTMy7feROIu6gT+AHbDQReFnUYjboekJ/CkBV07RJ33ta7buxs0XLhhB3AznUbP+XFHaa3J5ga4fxtF4qlo+X90XSYJg0ZNCiSzJOXbFMCpVy3NrdgkI1G4FtyBSnhmL/KolzQvWZgPSzAg7Ywl0UKxeQFYzdDUs2roIA2eursrwETPd3ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by DBBPR04MB7993.eurprd04.prod.outlook.com (2603:10a6:10:1eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 14:52:27 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 14:52:26 +0000
Date: Tue, 2 Jun 2026 17:52:22 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com,
	neil.armstrong@linaro.org
Subject: Re: [PATCH v2 phy-next 01/15] phy: lynx-28g: reject probing on
 devices with unsupported OF nodes
Message-ID: <20260602145222.rukxvfhant3x56zl@skbuf>
References: <20260529171509.1163787-2-vladimir.oltean@nxp.com>
 <20260529173544.908FE1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529173544.908FE1F00893@smtp.kernel.org>
X-ClientProxiedBy: VI1PR04CA0119.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::17) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|DBBPR04MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 64465f59-35b7-4122-0700-08dec0b68f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|19092799006|376014|366016|22082099003|18002099003|6133799003|3023799007|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	/SHVPjD46EmZIgZWVYGVDuq/8S7R2TWb73IjIJlg+M4CLUnopaNcv1irrXdu/NACBJpFBAi7eSqoo7j3nO1bq9WhktFYJvP8D4WNV83ERpA26VRw2y7Uscb2J/r0ylqeTC1jt3RgegEM0AEp6pGVml/WVPTCpGJQe6LZanozjCpaDGIDvyWTVHW0cgnLpuanVZvSndYktMrY0F2hza607tMjjJ9A+z+Qp66y1FNzomg3AlcFp11aU7DWuY56Nz2SL8NcnxkylXTgggNtJ3rcHpJNufIH3Mz4tlUpy89VGT2mgl1QpKen0O+xm69qlCtwB/wL5zCIMJ9KZGM4moL7czlksu/MqJiUPBSQGH1+wyyScrwx3bbPuYYAdy3NcVY6+H9VJK8FHaTZVm9FQXA4f7BCKKeQlbLQZOOQ8lAOz4mNJuU+qVA/rIUJ/I33q8OC7PYk88wFohXs74c2COPT529db3IC5xEebS4uCryY1MGXHEhSwyadLhax+2DOgyPIbbkmfK/fmz9AekqLwfxKvZSncI4sQxBYKGlQf2e10/y5KllKafLIrYNqBShW7BXmGb5DWUKcvaUJtIACpQlu67t2TUC7EIv0iX0hIQDxHyUdZtmnrAq5bc95/Q5ErnnjRHw3KKA6zbSsu1LkqlmpQDsb0Kqv8Ld2AvTdyAeZN0mpzO6MxHbEsxWZr1eRvTHs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(19092799006)(376014)(366016)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0814vTGi7eF9EOHn2yzG+681bpWqJcddMLoiOHW3FHNkMebr0AvWQNpCDNmC?=
 =?us-ascii?Q?wyUOLHC8ruen0WfUWZi/lf5H8//aw012FvXLJg3A9Ed+b0nv0Nl5rnwROtK8?=
 =?us-ascii?Q?zch1ISZE1QwF2MFQcB3SvY+kczmazrphqIF4mtVSr//yHybIzoS1xNtjjB5X?=
 =?us-ascii?Q?hbWpAIDCw+zpVidQWwHV1zDZZIMFEhmhFoMqg1qNdJtRq8lm3tZSBYqJdIPE?=
 =?us-ascii?Q?uFfp/G2PL9vhU6IcDLbj4LyKQh/KEbT3VHd6QFhKCT6SYfMtag/aJeriRdFj?=
 =?us-ascii?Q?xMBRX6XRSSQzDSwlUhk/D9HOSkOmBVmaT4hPH+asaIWU1lBIsGC11xeTr7TA?=
 =?us-ascii?Q?FbDbQa6g2YrM6c/wGW5g57m7nLLlns1IQIuiWlwePD5hMHeAtx5I03fjjcKp?=
 =?us-ascii?Q?1CRABhDZmXBddQ0grh9Mf7GXaBOBfgoLShymwCs4aBiN3DI5IBAGR08S+5Hz?=
 =?us-ascii?Q?o+Dyays6KwxkvGK8//TW+uvkYwHP12X18JP8sQ5hwuGcP62a4oAwZOWc19Ii?=
 =?us-ascii?Q?AOHF2jIDa6GTlfsZuAk2a2Cb8zCpYUDCZMIeCIi8i3h8fstvPZtubWXub5U/?=
 =?us-ascii?Q?c9P9crYBU0uyzVuSE4byT41SzAGpdzdgaA3aLS376rl2JoNtBeZjxNVTOJaR?=
 =?us-ascii?Q?TBbzktxaZSmu8ZAwWwC8yo9d3d3Rzuzd8j9M5Ty8o/+SfOKolKT8AO3N1X6w?=
 =?us-ascii?Q?4FMRRkCVxfkGqOoFAViB45xDWAshzuNFKwePZaQvN/X5rV27naj1tJXRim27?=
 =?us-ascii?Q?MVavH5f0FJWXGPEkcoySFBNrv+L90gPr3jefZDQp7gWKl+VXX8GRO8e8kvjk?=
 =?us-ascii?Q?aVdNmWYPhJS31Pjn3p8UAmU4z2M3lXfCz0fOEVsYafMym7fmnlU1fIvWLrAq?=
 =?us-ascii?Q?j+90+Y6J3q1gu+C9yu7luDGCEnHuXxceafR7KQEqcVplY7ysXYVNpTOZxKwJ?=
 =?us-ascii?Q?bqUOYgcPPi+HXlNo4GcqIzlDjW0SCOR5sWgfEgkP2/MRXzfZcE7klaZIoWWy?=
 =?us-ascii?Q?02OpgJB7KFHYQYZi4VuloRtMp41HiwT6Cj0l2v4fym/TY9XsHioQbYqvvFxn?=
 =?us-ascii?Q?lRrmSymN0gNtXCwcmt8IjZbV1XZRflGahCLZ5nJqNzWJgfzFxPF690xrYK+4?=
 =?us-ascii?Q?AOfskfMCmp4FJkeCGmcUIeh0gnXoQs/fkMDIILiOrlTuiUnoPQXbSyG7E2GG?=
 =?us-ascii?Q?ssyazS+oinNxeXyIhG4aBnFY8dsBdbvnllZuplZRM4dhS2DxIqKDg/s5JdXN?=
 =?us-ascii?Q?5o6G+5I5x73oEFgWN/VxtL4Yfs16vVlspP+/nq8G9neCycDonGGkFxJWN0A2?=
 =?us-ascii?Q?4R9w0OEAWWSTKH3oOuWgiW4NBOrnpBLtdkmNWG9zDgiz0ywcmbO6RFHsg3Jy?=
 =?us-ascii?Q?SNKgSwNKQtK0Z3jrvJN4t91Q3oQ9GgvKzTyQfewMA0CnxkwoEYqDYujrmPlJ?=
 =?us-ascii?Q?+OPLHr91wc7KSCp9Boo3Yzm5qGnFucCp+W2Fch9vF7cwgKs+CjR5ZNwirk/5?=
 =?us-ascii?Q?5irHPzotYeUoKDdnKmYayCLWZvk/4W/83wvBDhQRl/RuaYSyldsQXKFScpp0?=
 =?us-ascii?Q?t3Dde8Aphe/2xf08T5jlsP/drEYNr2U6RrzZLXQd3/i12zWwCka5gSt+rHmH?=
 =?us-ascii?Q?QCMqCcu32mV/5M9TxeKP5sKBYy/wUdEAQLearJNIVbtoDHw4RsJTX4QsuTtp?=
 =?us-ascii?Q?MhcrSKmq1yAq0AFiCNlxYJRxKV3oNkVOUBFxINf72oV7Z2iExJ5JZ6spy3PM?=
 =?us-ascii?Q?wDbaUGvr7C/suEiEwQeBGUGxtN7k7iTVae2k7InRuARmWSbZLS1tk47Y5AUl?=
X-MS-Exchange-AntiSpam-MessageData-1: SHbYO1uz2+JFOTYeuH2FY7sTx3kyHqGaZOw=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64465f59-35b7-4122-0700-08dec0b68f9d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 14:52:26.0217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1bHu403mgm+1mBzJmHji64RnVG9jcce4c+zEhpDi2PxvWU8Ey6jQGhYP4GbQYvIB/R66OqCAf+SX2qbwVHwHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7993

On Fri, May 29, 2026 at 05:35:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The lynx_28g_xlate callback can return NULL for uninitialized PHY lanes, leading to a NULL pointer dereference in the PHY framework.
> - [High] The PHY device retains a pointer to an OF child node after its reference count has been dropped, leading to a potential Use-After-Free.
> --
> 
> commit 74be4f3f82272eac244d345f53d8340e9a230084
> Author: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> phy: lynx-28g: reject probing on devices with unsupported OF nodes
> 
> This patch fixes a crash triggered via the driver_override mechanism when
> of_device_get_match_data() returns NULL for a device with a different
> compatible string. It adds a check to return -ENODEV if the match data
> is missing.
> 
> > diff --git a/drivers/phy/freescale/phy-fsl-lynx-28g.c b/drivers/phy/freescale/phy-fsl-lynx-28g.c
> > index 92bfc5f65e0b8..4461b47a16ad6 100644
> > --- a/drivers/phy/freescale/phy-fsl-lynx-28g.c
> > +++ b/drivers/phy/freescale/phy-fsl-lynx-28g.c
> > @@ -1477,6 +1477,9 @@ static int lynx_28g_probe(struct platform_device *pdev)
> >  
> >  	priv->dev = dev;
> >  	priv->info = of_device_get_match_data(dev);
> > +	if (!priv->info)
> > +		return -ENODEV;
> > +
> >  	dev_set_drvdata(dev, priv);
> >  	spin_lock_init(&priv->pcc_lock);
> >  	INIT_DELAYED_WORK(&priv->cdr_check, lynx_28g_cdr_lock_check);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does this function leave the
> PHY device with a pointer to a freed child node later in the probe process?
> 
> Further down in lynx_28g_probe():
> 
>     for_each_available_child_of_node(dn, child) {
>         ...
>         err = lynx_28g_probe_lane(priv, reg, child);
>     ...
> 
> The for_each_available_child_of_node() macro automatically handles
> reference counting for the child node.
> 
> When lynx_28g_probe_lane() creates the PHY, phy_create() stores this
> child node in phy->dev.of_node, but it does not call of_node_get() to
> acquire an additional reference.
> 
> Once the loop advances, the iterator automatically calls of_node_put(),
> dropping the reference. If the node is later dynamically freed, such as
> during a DT overlay unload, could this cause a use-after-free when
> phy->dev.of_node is accessed?
>

This is a problem within phy_create() not calling of_node_get() when
assigning phy->dev.of_node. It is out of scope for this series.

> [Severity: High]
> This is a pre-existing issue, but can the xlate callback return NULL for
> uninitialized PHY lanes and cause a crash in the PHY framework?
> 
> If a requested lane index is within bounds but the lane was not probed
> (due to a missing subnode in the device tree), priv->lane[idx].phy remains
> NULL and is returned directly by lynx_28g_xlate().
> 
> When this NULL is passed to of_phy_get() by _of_phy_get():
> 
> drivers/phy/phy-core.c:of_phy_get() {
>     ...
>     if (IS_ERR(phy))
>         return phy;
> 
>     if (!try_module_get(phy->ops->owner))
>     ...
> }
> 
> Since IS_ERR(NULL) evaluates to false, it proceeds to dereference the NULL
> pointer via phy->ops->owner. Should the callback return ERR_PTR(-ENODEV)
> instead for missing lanes?

Yeah, ok, _of_phy_get() does not work when phy_provider->of_xlate()
returns NULL, it needs to be an error-encoded pointer instead.
Will add one patch for v3.
