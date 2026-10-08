Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630A33A3E73;
	Thu,  8 Oct 2026 20:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791492374; cv=fail; b=eH0EJfyA9HettiWrmsz0k7GwszZRUsPrL5SK4/gbTMxNbyqCrI9HXpavMxAcpZHS7R0EPWdR/jL3fVDovnV22u9XifACvSSBYsEGNiws7pwBWRMu22Xo9FAOZEnznrOaXjS4cIb7Bhpo1pT8WFiJ5msbQQWHyT85eLS1wzutANE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791492374; c=relaxed/simple;
	bh=6tcLTJlf126j8UYxCqaae17hyCe8QmHPvNmwbjT9l0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jv6FOke0O67K34j00jIYfw1Nk6t+zUXTw3qVMRlh1lgT0SxXQAXvHCctZLQLti547LMnGAuuLZy5pY/FpmymToUkYQX8eigYRK5yAb+Z+LKsD1Rx/Z05xMiUVNo0H/3kVAZLlNRqzGd/8n5+Tt1ZnNhAilohYAb94DHnvfOEoS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ACo7cnPQ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ACo7cnPQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EI/7JAoNIgyDbKlrpUPWg7zcTBnvk2xKd9EAO8w+hoxC349v4e9yBVn1ArWUGaGTuvrlWxLYKO8axv8ReIA1vlcwPO4myYshA8CFgY6SuZQSkYBUfOy91yRt9j0JFHaYKx8AvjHiAeS9RbvMzt5pagWR2z338Gr8FNwQWoVmRacmxZWffmnUolPXN5NUxBj0Botris1OYx0g3Jb/KjpDuW8jP8/RRPNBe5j24G0FfYDiVhvBU9L3Bap93Y0w1xhW/iNPTWk0UTBOA+gBjH4e9FnJ9fyLM7O4U9hmpRiaFKrku9769v0LFc1IyLv/m6DS1APpBofhlx6CKrq5gWkJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1pM54oSKVvF+mfEacRXNyw4eZLatuFUP918KTeDigA=;
 b=W0bQX/35ex2sS5tg9LiJm60ezguoepvfPXN1401vsDGcnAuxZmc3+7Ai1YK4SQPCoFuhVQoQazneC1wq30/ch8fimQB/BDn7TwgMId2nFl4Egt7SUyiu6KfBdr8277r9BjeDNW1pn73KanoyfvJFZS+BG1dlLZ+J7bcwC2Y1t41pJZenY+NhAbtd3H3IhHh3KG1koGaH8lbWTkGgTxv6OAYt+YzPWi/sqOJwO2r/AJYoKd23inD1hfQp7o/z3a/FZfWY2kmaUz8+D9EnjnwZ+7bBvJ6mT0wfhWQqPPQACsE+R6NNdOhOpHal6Eq0sglKbXd7y0nclp1p/rPyWUvrVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1pM54oSKVvF+mfEacRXNyw4eZLatuFUP918KTeDigA=;
 b=ACo7cnPQl4gsfWhSDdmcsuAA+wmzUuEq2AE/GSGeoIwuN0O1RnTDBNJ6CgHL9Jaku8CMPBgOWmyyxJsk1pedArz/vQ8yO64xqZh9vi6wWjkQCJCukVB4/UxTpXgt34JHpJdE6YQUaIvSfIBX0JLhlVSETJxEvx1jS0W62O3h48A8z1PNA/6yGPNkWeeSQZ8oFSWhqw70Uk4QLnGrhpvXOwG0YcH4Yibp5ckwnwyEGvSZj4H6QrpeECun1WKO74djmnjOCyfdepOmk33hqb3JBbsRTvQ7i8vLEAFHMAJRfLALnjECW8EGCQZ/d7G+DBgnzJs1GAMveRV0KrkNnjByqQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB10025.eurprd04.prod.outlook.com (2603:10a6:800:1e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 20:46:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:46:08 +0000
Date: Thu, 8 Oct 2026 15:46:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Zhipeng.wang_1@oss.nxp.com, imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH v6 4/9] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_set_active_enabled()
Message-ID: <asgBDAfInvaIGbYL@SMW015318>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-5-Zhipeng.wang_1@oss.nxp.com>
 <sashiko-outbox-163926@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-163926@kernel.org>
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB10025:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca19631-83d6-4ebf-d0d3-08df257d2da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|4143699003|5023799004|11063799006|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	VjB/wiUxezP8kf9rVs0+mKhfWg/KyzuI3oMjVV9BEZyIbXkV0FvOtwEUFDliixUBMhXsmM3rLUxJgDzpSQZRIL8gO9TokpazuDjfKGggwvIP0DwizMhJOwTciTIqzOn11BZ4ECDNnguL73IshwYhtz7ferGoXPxA2ROBcWV0JpJkmr6mH8+s+OJJEn6CzTW0ailm+mc8cZo8ESAdtYVahSfeSpIEcXP6k1dG3gZH2UuM2uJBYUnrpnYgj0oAm+9tP93zVjDPlv7bQkoIqS9ur/7p6RM2bgfSXo3TJUXujoxp3Hgh0ghiOMwYuX3hm+dMhzS/UNBYI8DuBr1iTWZUu3YMDTfbFc5IgKZ986pplkkDCeh/BVP6oiy/+n1v8XLGMlefKWo6Hym1RhUz1Rv6hsFZwFUSqA3Dg6FCSinym5AcxatVjkfyGE9tfj4w+Uub5iqLY5VWuq3KMNCEPbLYnuRxlgEDBik1df8WxU+iZ0TWRdZUoMgPftMH2RcJkZCnTdrzFY/AOWDCCsE+ojbKvXSkPrbbQJOSsdbdccVQWQaSyIQ4rM+NqCBdPpEqf37wHdEpd/7/IEh3zHoyoDbfSchp+4rJoeHmU8gQlgj3ywY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(4143699003)(5023799004)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?lRZkxbX2M0To+ee0/l4WLb/GJdsljbSGpi+Pe/3J1oOYKYNj/c/b/L/UdM?=
 =?iso-8859-1?Q?qLLhs7LriPZ6gxC8EQPAsDd9RvUob8+DwJwjNbu4bSi/LIpHgapU7u5mXX?=
 =?iso-8859-1?Q?I+zcYw1ZvdttROnnXW0Gt7JLYobDHMZhnDxHjpK+OJowyctIU6wb4k54KR?=
 =?iso-8859-1?Q?rMfwCD2YuXwHYJl9k2wHOyev9R5C35e9Rbx2+YckU4hknYw2uIZVCHtumv?=
 =?iso-8859-1?Q?pYiV4RpdIZB1a5PPx88fm9bZyzZMBqvrW/YPpfQ9TQRqS+NuAJYCl4/YRd?=
 =?iso-8859-1?Q?odAyp/4mCNcte+u4uRSpu8K6cVebMnOjmpUM00R+AlyFfYYKOhpHr57fLm?=
 =?iso-8859-1?Q?W6TkU8+MKnoTSK1WI7Hk9kyqeUAdERsAj+UKjCrH6dqDB95AYlTbH+K/2H?=
 =?iso-8859-1?Q?tOcAwteqVzJ2KdvUHZoZwcK+/TLtfPvqPr5Vo7g1ro1jNsmZVZnSNUCme2?=
 =?iso-8859-1?Q?ojdTc3Lg1ufPxx6/ziuaxzr2c911MgGUWcVmxuqv3PdYD0yd99E4/OUtpV?=
 =?iso-8859-1?Q?DSAkZd/Ro7pDFhmP/lTx79t+Oq7W/7km4Mvx7hpqdXQ2R7jxx5KQP+x9DL?=
 =?iso-8859-1?Q?gx+MPYbil0vuf7Txg/g5Hx/WeBa2OkwU2+BKpYsuYjIOo4TBdi08/dFTcV?=
 =?iso-8859-1?Q?scFbZGmVdNsWa4j6ZrLyCBBRtzmqGUniGneVJGhhqVp2djGMjghwa6zJwv?=
 =?iso-8859-1?Q?OmBRQnqOyzLtUZ35KW0QTph4UuJ0vQkeyoy0PcMeZOxa2M8bwiZu4vmUFt?=
 =?iso-8859-1?Q?/2Nw/fNbAgfm3qz46Fm6W6NgnPTPPrrrO4H46lmvVXCwwvTcdAJVnM+KJe?=
 =?iso-8859-1?Q?28LPV3HxNdkFoKEpzOZqEbC+rIkLWQjfn9dHN9pvDNSY+dKsj9fM+UC8BU?=
 =?iso-8859-1?Q?tgWISQAqgSvfZ+/IgoSz/wfw+9CrHEpJguB/s+6hfc8Yjl/zJkLAy+lRAn?=
 =?iso-8859-1?Q?+03Q8FLH1W+BkHa5OA24x5L0uIZPFyaQkr2dAoNy9HKzp1eTkBog2JDBng?=
 =?iso-8859-1?Q?cbAZq8sC4hbpFyfeH2g/K4Jyv4tXwy52p8/43kJ38vAA4X1bxnnkLjjfCL?=
 =?iso-8859-1?Q?OJ6dE/m0LFLc5Y1UXsZsSbMEy34nGylyzLDveVoE1nCgMst+rarCOS/Tgm?=
 =?iso-8859-1?Q?80EKsEKpd2IXgV/BMWU5mQzfHpmWeQ5oSIchM21g3m/qjYlxLkBEzExcaK?=
 =?iso-8859-1?Q?o/xGMxGipc/e077r0xXM0FuWe6UIdO6BVQlfEqGVUFcOP9DsMuU6EPxOjS?=
 =?iso-8859-1?Q?wYZJHZBZAvxaW6P29r4macCvQwD3YTVf9macCSyfL7HZMhLK0N2xiEoA3+?=
 =?iso-8859-1?Q?vOZNbFiIPOUbiXlSZLDCofrnPXhVhx0/Ao4Gs/RmEd7XMoFzK0MHpTsJOu?=
 =?iso-8859-1?Q?pa5Azu5oiNb8C4cWahEP1doR81Tks7Z/0vY5oi1JQvLdSLct5+tfzKO2yQ?=
 =?iso-8859-1?Q?qSve+98OXnZzNyQJQgR5YubUoW9UFlxHtv+WxYrC2BMq2NSCVbpbkKIFca?=
 =?iso-8859-1?Q?Z5n5/5K3ezoipwwN/qPr5uE2VM+DxLg0k3hu78QR7bkK70xpXsjZsXwQSk?=
 =?iso-8859-1?Q?zLIeTSbZvAs8v4n4c58THDs8/TiIo5x1Sw750OGPlqDx7XJTp5w9tDOJp5?=
 =?iso-8859-1?Q?vXAZE079zlg8vxPMNkXaf/JnWTCCnthJBdpERhRnguVj4SuzTdlSTP9mB2?=
 =?iso-8859-1?Q?tnV7shFmV4VKm9/8Ywb6VMqFBj2u8trVbFlzxdkRtWsAH402dPlbuNKIHE?=
 =?iso-8859-1?Q?xXRwsjeoJbwnwubBZ8ze7q2pqO2Tr6dDBdAUwho54OoxSCx5Pw73pLmkVY?=
 =?iso-8859-1?Q?Ffb8nULoykHispDM1MlByJxme+oho8icugR2nBZRAU2mjX+iYwRK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca19631-83d6-4ebf-d0d3-08df257d2da7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 20:46:07.9081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhGGNfQS2/g0bW5MjwFXc9hwoTm5NAvbKgbGUvsytW1IQAzVf0W77QE/2P/ryZXVYRHYzZvCfNWVF3uPuRZxpkRwnb9Lt6IxLbhr8Xj0btdXy2hPrDzYyC/EGEkVczsg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10025

On Thu, Oct 08, 2026 at 09:21:24AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] irqchip/imx-irqsteer: NULL pointer dereference in suspend due to early PM enable
> --
>
> commit 5322ea0be538e254fa9c813752002c35702c23cf
> Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> irqchip/imx-irqsteer: Convert to devm_pm_runtime_set_active_enabled()
>
> imx_irqsteer_probe() enables runtime PM with pm_runtime_enable(), but
> imx_irqsteer_remove() never disables it. Runtime PM therefore stays
> enabled after the device is unbound, and rebinding it triggers an
> unbalanced pm_runtime_enable warning. This commit uses
> devm_pm_runtime_set_active_enabled() to automatically disable runtime PM
> on unbind, fixing the imbalance.
>
> > diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> > index d05de3d26fb28..5acc04504e520 100644
> > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > +++ b/drivers/irqchip/irq-imx-irqsteer.c
> > @@ -239,6 +239,10 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
> >  	if (irqsteer_has_chanctrl(data->devtype_data))
> >  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> >
> > +	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
> > +	if (ret)
> > +		goto out;
> > +
>
> [Severity: High]
> Does moving the PM runtime enablement before platform_set_drvdata() introduce
> a race condition?
>
> The PM runtime is now enabled early, and the IRQ domain is subsequently
> created and exposed globally.
>
> If a concurrent child device or userspace sysfs bind maps, requests, and
> releases an IRQ from this domain before platform_set_drvdata() is reached,
> releasing the IRQ invokes irq_bus_sync_unlock().
>
> This in turn calls pm_runtime_put_autosuspend(), dropping the usage count to
> zero and queuing a runtime suspend which invokes imx_irqsteer_suspend().
>
> Since platform_set_drvdata() has not been called yet, will dev_get_drvdata()
> return NULL in the suspend callback and cause a NULL pointer dereference when
> passed to imx_irqsteer_save_regs()?

Please fix this problem also

Frank


>
> >  	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
> >  						&imx_irqsteer_domain_ops, data);
>
> [ ... ]
>
> > @@ -260,9 +264,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
> >
> >  	platform_set_drvdata(pdev, data);
> >
> > -	pm_runtime_set_active(&pdev->dev);
> > -	pm_runtime_enable(&pdev->dev);
> > -
> >  	return 0;
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com?part=4
