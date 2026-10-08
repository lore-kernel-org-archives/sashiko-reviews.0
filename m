Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1802ECE86;
	Thu,  8 Oct 2026 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493176; cv=fail; b=arTjBgwVE7rzPMUNYmhwzEyeTrYk/rlnLHNyRpcN0m+xayQsBof8HNQl+bX8D4fpkUxeVSTYOfRPjcTB26aQLJ/P4uDYdty8RlYu3hvwRxtmosw+yemPOQvTgNFQCCc5METUMPZyNfblodbGl4x47URCw1sc3mIjBX0wNddm3aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493176; c=relaxed/simple;
	bh=8IKJ/5X+t5LoxgtGox6dCC0XsN0+V/TVRJQQBsJA76I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aBj1o+bkwH/DmU3dbpp9yoyrEI4FZ0Uvx1Blen0suaSWixcL4qifbuvmwpP2pd+FIPYyKLUROVINIWjhQVASzJ/TNguNKGJWEeD1eN//7OP/ONPhLAaKidS8cAwGnXtT+2wTS9PCzHHVtnXjaMmpbgvSwu1EsE658dt45boxmlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NOMS+bEY reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NOMS+bEY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsRoww9hbiZkHGDlrq1wwOA6nxxc6s5wCME5X8evLXHoW2ZnjC8qcyLVl8PcctK+00s4nrkUIgFjvuULf0H6p9UncIml2jgNv/lZXBh9nepcbk6civTS1dYtDAurHS/GZuV8djyasPQWIrZ9q4IAMRZVOPddtEPgI8xfLsg4f0lxOOTH3qcmr5guywK7VCldCsvKN/obJG0p2VUs0sWzCIoTh6Dnoz+3jb14jRilvKU6VU6fsWOjx3g5/SvPA4sFJfduK1bWnzMSIiruIRh85tkbwiWsygcnpz7wDa3QbCR6eiCJqtB562nQ4lBjcqbl6rverMFS692I2g8Fn9XOXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRA9tBKk9dI1BATgQ63O1cNCG5mIrjR0oVE6QD+KVm0=;
 b=GV7BhnIFI8+WH6l1CZPZ6HJ1Aw97NTezgbhhvT2VychhOisHX759St8Vp9KQe7lGkkRVr6UZ6whkXUmejcKybvt9MiITDzw3I/Y5iK0KySVRgLOZ8HNDO6OSe14uj14HiSo/yzfqwXaheirjSOGqSw5C21mqRVw7eJ7fL0UD9l8wCIDV7+T7VnjZ6SZZ+DIklnaiueTGUuYjNRctgJcC2XDszi/qmICjKlM5g9TXgQ43njXJZmUWoz2kEK/x+I7bZHlJ/f/GiXkHvMI8fG6Xw1zbItARcTikPrU5n2vY+7idllxo9tg1+yh9VzVfZcCrJWhxbOlRpQKOscXGpw2t2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRA9tBKk9dI1BATgQ63O1cNCG5mIrjR0oVE6QD+KVm0=;
 b=NOMS+bEYbubUJrNZkFvX3T8/xqEW+PN9wEQrJHc4r4L5NIjaKkO6kharUGieR4e8d+3FlyC35bkVJyInyqq17i8QBQt7IgJ0NrCbececHkeb/N+CttD7DRjaa2zSyc7ZTOqNWh8UXMMIoshBSlwEJ8DV/YlQOX9cl8Ng71WKYiIc2XwuahWTPNhq0Y5i2Am1KOmJyaj77OFUlpdLhFnKR2mMUGei117e4pJxyxgnJwive/U3bX/W0LGDCibxc2olDyrkmzvIutsW85mzRpWpAj8z29FVyRSVuym+iPUt5xPLzieBEabZoWMLjATD+02sU5jr+P/CQXEadHG+C7It7A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8273.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 20:59:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:59:30 +0000
Date: Thu, 8 Oct 2026 15:59:25 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Zhipeng.wang_1@oss.nxp.com, Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v6 5/9] irqchip/imx-irqsteer: Mask all interrupts in
 probe()
Message-ID: <asgELRM6Z6gKSLrx@SMW015318>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-6-Zhipeng.wang_1@oss.nxp.com>
 <sashiko-outbox-163917@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-163917@kernel.org>
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a9c122-983e-4433-3eb0-08df257f0c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Jm8oUge+icStjIymPSrzqTDZYoac9n87ZkA8HZx6JN+1fFxmzQiv0hIN7pBXQfWfIdPaAQVoqgnV0D7wW/GtJzbWWmQQZIArbZ5pdZhwS7lGFBK7B5qSbc+zYz3ZavvVsGoZwamUHyG7OBr0ZkzIMiixCnWhSm2FDmAm4SE6vDRe4DG4WpqUR45mSXd98rzcNzcjo6nFgu8qEJJP92SsHf+GmSpHEVfv9zciwFOPlYk7KsMyAKVYcXrYIkiqYgiFg5F4DtH/q7dfaqyVXh3GHF0eVcRpXgcQtohHf2vCwwiDL959vRQk0M+1id+Uk26h/WCrBfutZferCvH6ywrmcGDTWdFNo08F9o47Ydk5voInhw1btD7WS0E9kzfLv+kkGOCasNP5HOVrlYbttoGE3ALHsg8skANT8gWiy7Q6ycfsMoYbnvX6HCqJfadOblQ6sOD4FrqKGYqiFwfcZLSsOVIiTA3XCd5MJZvh2o9GJ9qEE8sBqDBZZ4HYBceXdaJl2DOS5ld0qVrfVD5CXyU+ZnSIFVNb29V5OirSVcWaVrGN74CecyhmwQ69iBQKJKwzXAaG6+Mv/WsgLyDzwbFStKrMiMONZhe5kI7JgiAvxRk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?mKb49s5Ruik32jHSePq21eawQQFMS9dQoGw9TZqEvXbasET1gjL+AOf7tY?=
 =?iso-8859-1?Q?mzLURaBKF0knsm2/jXAOD9YLo3rgsBPzjb3Wg+oXoF2l1wj92n/ldX/bev?=
 =?iso-8859-1?Q?qVhfjWltS8FHEG54kGLCUqA5GmXWCmMZuBhSlZjcfRSYe1iAehNshamHGs?=
 =?iso-8859-1?Q?cT0JL5FMMiYUxJy0HD3+pSWWhiNtXGLfnGK5f5GK2oDV3e2K+4Bimw8dz6?=
 =?iso-8859-1?Q?PU6MYXKWtvgKhbWKFxGFZsZPtfnyf9Q5ftoC7tpgVeW1C63Rcs0/2L/HeP?=
 =?iso-8859-1?Q?YvYiZ3IPHPLe6MS8j8o6HBNeZQ6bBoBCG6l9itV3w715JCOpkOgRZFSc/O?=
 =?iso-8859-1?Q?LUu/bc9ObAsLOCIhjQ1KdpQGCrEA6K90QeuKslBcv9SmkFS6aOkjDjraSn?=
 =?iso-8859-1?Q?WDMQX0uHF37wQTcISTRVHgTCWSPR8qSutWQX56exLstMagGtjqmojlfIKG?=
 =?iso-8859-1?Q?osjwR5dv6ie8qaJaCuQXHtaaQ9ma/ATQ+w/0D6BBI/YOIpolu3I9v34t4H?=
 =?iso-8859-1?Q?i6qP4F6vaSnj4aW6vVAWllvUbgw/PmcBNvIWI/9JMPs4gJAvIdj4Ru9JKf?=
 =?iso-8859-1?Q?4H33JHuw5ALRnpnuRPGyRymiDRSu3oAgNm4kKEsqphiqDeN0YpujL22l3W?=
 =?iso-8859-1?Q?JDi3jCmidjxg51KLirwQoXEwQCcYBSa6+O4mZJ4Z6MdBU2dwy5cmroT1EC?=
 =?iso-8859-1?Q?QesrE8po+/HQlFdFnAvsczjUWuAnOQMbjkmemwfTcaRZTt1TnpUq7MLT0c?=
 =?iso-8859-1?Q?2wI22E8KaBhRpA7WgZSLSYqtvnWkkBkhRBGGCv1cz7kmM0fkagggd5tLfy?=
 =?iso-8859-1?Q?D256EgIXOzdasWYg2JwfjhUClIEI5fxDJBNkIjuBSpZ4UMVBr1QvqD2rku?=
 =?iso-8859-1?Q?f8jPi818RwZgo+aKXtupKR4ALoCwKLRdbQLVI9pMLl3LPOvdbUmVao54vT?=
 =?iso-8859-1?Q?zoLs4PnS6vvfYMrglCqAHeBcYPjgbWY+3ozPF+vFiBRSLt+oyMWnSajTl0?=
 =?iso-8859-1?Q?nKiDheWb4lx+2hecV13KiX51RrfCn2ixoJAC8Qqnwce3RupY+0fUeDzY1+?=
 =?iso-8859-1?Q?653yocnocWLcGkpzcD4OGU/sP9TZXVymVJazhqZqftJyt6006hoRX7HRmN?=
 =?iso-8859-1?Q?WhPaXUCent7nWVKp80LZW841avcBe4qr3F8B92cLJ/zJlxt2hAMO+M/S9k?=
 =?iso-8859-1?Q?Lw+CdBiquK9RwM8HtAYJBZqPTBTe1q/a1GEu8Xc6w/uuvu/corBuKwBe2b?=
 =?iso-8859-1?Q?MsNjk7FwTDRFMOuZh/IzYqLm5MKAMVbuwkic+/m4JzYDAeSJOBIUO41wOR?=
 =?iso-8859-1?Q?hPxR94y9K8Yv+pd5PvaWfSptbpY/wN2sr+IhcvYbhncgm/KJ+WXFK0oKuQ?=
 =?iso-8859-1?Q?fJZ0SQWf3z4fGQpueWu0Zv/l+7lMLWJCqzpLN/af4rbDyrSFrZnTWOqov0?=
 =?iso-8859-1?Q?vGfcHp3a7tyd3aZfaXEqZS3Qou0wpY9mMeAAtnHaJ2MH6ICq9vDITvbbZ6?=
 =?iso-8859-1?Q?koA4GMt1HDmC90DuUvIYH7GhFEGhTZYu/CZu5tQ2C7phZ8Ks1Pro/o0OP1?=
 =?iso-8859-1?Q?7t9thnQsH6duhjdVLFAUXRzW3jnKJwNeWOhLal9A+FgltBGEjH48WOLofr?=
 =?iso-8859-1?Q?kWyYzX2sbk/Z/cqLIJlYUrR5LsmZIJ0oL+mxj/3RY1i34cU+iRfLjkcvki?=
 =?iso-8859-1?Q?eQ4ghLFJiXcUG2e4BU+kaanHAKa/6dK4G8C9gokocVYPRMbUaKB3gXi1ng?=
 =?iso-8859-1?Q?cmTVDKGYrGZVG9rpG5pXOu15xo4Db7Z8nepnTOMqy/rqs0EdWJaNVNvSCe?=
 =?iso-8859-1?Q?nPKmeTf99TBuG5L9+i5o673adVX7pyxUqcdBSeXkhgwc6pPbWgLR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a9c122-983e-4433-3eb0-08df257f0c3e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 20:59:30.7964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FnqmwRtaZjPDx3uu9aUuVkN/VEsgnTeYHLEfNgJdj6CO24iHYI6d8+yjT11fFLnyRPLMNZDuXBltArTHW9U6k3xZe2CH3hQrU1yS9TOt04O7CEICZl9K/iTMPV4e6buv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8273

On Thu, Oct 08, 2026 at 09:18:11AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] irqchip/imx-irqsteer: missing wmb() allows interrupt storm race
> --
>
> commit e530007174d6dce33c6ec542e006f51e4a17dc73
> Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> irqchip/imx-irqsteer: Mask all interrupts in probe()
>
> This commit masks all input interrupts in probe() before setting up
> chained handlers. This prevents an interrupt storm if a child interrupt
> was left unmasked during driver unload, as the hardware would otherwise
> assert it immediately upon re-mapping in the new domain.
>
> > diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> > index 5acc04504e520..fa233de9bc2b2 100644
> > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > +++ b/drivers/irqchip/irq-imx-irqsteer.c
>
> [ ... ]
>
> > @@ -239,6 +239,14 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
> >  	if (irqsteer_has_chanctrl(data->devtype_data))
> >  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> >
> > +	/*
> > +	 * Mask all interrupts before wiring up the chained handlers. CHANMASK
> > +	 * has inverted polarity (a set bit enables the interrupt), so writing
> > +	 * zero masks the source.
> > +	 */
> > +	for (i = 0; i < data->reg_num; i++)
> > +		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
> > +
>
> [Severity: Medium]
> Is an explicit memory barrier needed here to ensure the masks are applied
> before the parent interrupt is unmasked?
>
> Since writel_relaxed() does not provide a barrier, these writes to the IRQ
> Steer hardware could be reordered. The parent GIC interrupt may be unmasked
> before the IRQ Steer actually processes the interrupt masks, leaving a window
> for the interrupt storm this patch is designed to prevent.
>
> The parent GIC driver uses writel_relaxed() to unmask (for example,
> gic_unmask_irq() in GICv2 or gic_poke_irq() in GICv3). Furthermore,
> intervening locks like desc->lock in the IRQ core or irq_domain_mutex
> provide only ACQUIRE and RELEASE semantics. On ARM64, an intervening RELEASE
> followed by an ACQUIRE to different lock addresses can be reordered by the
> CPU.
>
> Could this allow the subsequent GIC relaxed write to cross the prior IRQ
> Steer relaxed write, meaning a full wmb() is strictly required to order
> writes to different I/O peripherals?

On our platform, all IO read/write is strict orderred. So no this problem

Frank
>
> >  	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
> >  	if (ret)
> >  		goto out;
>
> [ ... ]
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com?part=5
