Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013018.outbound.protection.outlook.com [40.107.162.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FE74A2E2A
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 16:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781713114; cv=fail; b=n4OmlvSb4IgnV8MWCk+mvZMPHs9PwF4GAdM5LFvXTu3H6v/dQVNu/nNq2LhbnZ64yXyd525wTt9CDO3ccUiFO3injeWf7zFs3uRQFPQCXKGIzFvwuyVx6xdoi8A5Hy8FsDC8o1r3QipNj89UbQtOEi3fII4C6af/i+M5+MpcNko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781713114; c=relaxed/simple;
	bh=peUGCMEInB7YAHHNGk/v9U3XRFl+ysJLkX5MZshOVqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TflhSkOzCFfcXJbHkrf/+t1q2A+7q6mlRB0l7g25ArNwCJSSLhaAvVduRJh7RW4xT/fwdswJZai7V0goIxbMVByPOV2QGVVPegz+3HO2cJWdeaq7XG+SKup6PuhFYsclRO96UB2bbHKy0Iw8ABWUhSMnfmBOJg+Y2DOfZcUlyiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CfJNX+cw reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CfJNX+cw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ermb8XuA54H7Tn/Djr+eR3GlNNOtZhO67iKgsJIp5pqaSRdUfZky94uGpEt10h+uyhibGo4WimtnK1IFdNsrA+CWOCo4SVqDKTsRyA9IXkUKyULpN6eVOCDG7yYGxVRWGLkWk+GV+AfqCG+EWnGpbko69i9J1wJWfsSypxZIgsgw/p0wzbMV9baqbI+jJ1mS7v+65dvg0kwWBWoi9HauI2G9ZlboYjwHkczkAOKwGNyToh8mjIcPJkyZwUkTpkN6CihHl40BEXVkCNcp+u/xxFH1z1sCb2IpLkunfoRWPgVGTMQ7qKP4rpnbFO7jpZTDdZQ4BUxqRtlTo4JysQW+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaI6upzSEiwR72qpWdqed8mUJLxPuuTuu3NTpKtzlCY=;
 b=erbFJeNbDNBHig7j8NiyE8f0XELMnY0esmqRzX+/uH2xruh6TguNKlu1M2UmkKjHWwbVJsHbgTCiZtK+qbdEre4D3jEjkAOJvBZx+i0z6cyytIOMzx5+Lznuat/IkjsEgpSEMbI8zNuuC8RhZVjUP7VYmKfMIVdAkU5gtxzpZdBdM8DAUfyg9LACTFBP1JsFdu/qro6fZgvUcYu+/RUNrWnLRhYxvtX1x+5fyacdv0SkaTuHnBelA/O17M35S8fHCf4v0DLYs/d9TOLNdrV9iRNKrif3JlnBcTM5rETRx6LwY4oD/3M2Itk6mwFAe5QYV9nxeiIJtb/qhZOHx0MMVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaI6upzSEiwR72qpWdqed8mUJLxPuuTuu3NTpKtzlCY=;
 b=CfJNX+cwUamK/vXdD4BI4ZGg+t2iMTTBQJiwSwINkTginfeGOrX48FMY1MWkuWeYj0ERf0i1XlnNwm+04HjIDNuJ0L5OHidLJzEyQsFNTgSyrSO0SwmQ2v5fV395mstqmJjZZY/L7zWv6R0oMS2vTTw2w+MkS76oOPT0PxcjqP/uUdUJseOKa6ylwx8x4qbf5khsU+VC0Z91V4O4UKdVG5ZMcFGgyVJN6HsB8fUG8ruKnYNih3O37VVy85j3V8n5SyLjyYDgMMx8wMVMReqt+fu0i3TxIdK3WdTa1Psj+XVj29u3c1ad5vKXE8bfegAErUOfjtJY6Ndcn82IQkhj8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10623.eurprd04.prod.outlook.com (2603:10a6:10:580::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 16:18:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 16:18:19 +0000
Date: Wed, 17 Jun 2026 12:18:11 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, Frank.Li@kernel.org,
	linux-i3c@lists.infradead.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v12 1/7] i3c: master: Add APIs for I3C hub support
Message-ID: <ajLIwyaTQHFnKf8D@lizhi-Precision-Tower-5810>
References: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
 <20260617110355.1591844-2-lakshay.piplani@nxp.com>
 <20260617112035.86E7E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617112035.86E7E1F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH5P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10623:EE_
X-MS-Office365-Filtering-Correlation-Id: ad36beb7-7715-4c15-75e7-08decc8c0b78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|19092799006|1800799024|56012099006|6133799003|4143699003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t1oSFNK238xzHHx56UKB93voBtf6EmTpYWQMRBxCtT5d1O3tgVbNUov/D6UzbDqLvFSX+tWCFDNU14GwxaMEHbZB0dXY7K32rNu38pcGXHW2jO5A86Kb6hefLMRff5UvZTSakO1ArhIMpOKa+7Bhr3LJNcBuXSCXjvX6RpURZmnViJaMmdIZ0KAqIdC7DxtKHGjGp8YWgCWkohnZ99BWCaslXxFwPimFIdn3P108lmg7+1i9DTcH3li52PkS/Nv9h5a45mAMoRWa4Np6+WwDFz2SPuQSIk70IBkUpvFtH7KH76buYj32Pb5/dGQW8qH0NVdsiJp0KZEK5W+X5gPvlYKlQnOBjXeFSRPDPSj1PzKt5vTL0P+4Py45MqSqP+hHAN+HhinZqt0IZAdt2Za6fnOkI50xx4a4w6AUxcwfhTE3mOaTMmOIyF3oO9ubqUctwO3ak5TCvbbmdWayPEaudp9vY5ZCDCxc4kVL2XslNARdXFRGAyLDg/L0RmTfCJG7nvNNsUmh30Q5TcdME9IgauaRoavUq3KuzU3RGJAKyvLu0PvOR9ia+WR6zdR2DIEgPwfUguaCK3toBcIVuHwacjj8LYGHSWAa9W5C5Ixg3H2padTiBxXeGUWHlJvZ6r/+7K3OG6iHzHvOgCZzrN8xmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(19092799006)(1800799024)(56012099006)(6133799003)(4143699003)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?vztwD6dGBynczh8vUE5F4NsWFzBKnWqd6oSz2ec8rO5bb2AiQ/gyQEeDkp?=
 =?iso-8859-1?Q?QX0Ug2slTsn53pn3f+DJu7S52HiWCBvcpp80y5g90TRE9SuAfUiWI8VyfA?=
 =?iso-8859-1?Q?XZKdex2VfjXpmAfSgxeQ5SjI0a5V1NzKnzsq5othFXuP5YxrFQgi4tOeKw?=
 =?iso-8859-1?Q?oRISN+bO+oGsxKlqyMiYQ7VYjCPxG7pZIohJgvXZCT7CoLr98WEa3pddsR?=
 =?iso-8859-1?Q?j0LTBJBKPxRQGXFdZ8N9pHMZ/R/rX3X/cXeFk33P0vtAHJmGizinzOqXEt?=
 =?iso-8859-1?Q?k9hidZEhPOWo7VPDMmSSli7savHiBdzyPG3JeFWn28WEEIv4jQHbScvdGJ?=
 =?iso-8859-1?Q?GAeYAbJQTeAUiHlRHzDcYpXazmm25ivJjizWD8lnayPk5HhDSnwb6wB9nC?=
 =?iso-8859-1?Q?swkMU7tmFowU3uZ7WFdm241rvg28f+B7obyvgI9sCy0tPJKU5yE451yfh5?=
 =?iso-8859-1?Q?MyDwdvRh3ec6NISNeV6XrKZKGAcAg0mcsB1D+b8aIN57KXln+V3SGUUcI6?=
 =?iso-8859-1?Q?S8muTMYNamLX0A4ZyV9NlntIodCt9Wq9PpUOhVyCw4Iu6v1Wxm8nd5yeFK?=
 =?iso-8859-1?Q?sw7LvMwMj/88xf4WVeR2EL+Y7bIeTke0mAmsA9UHh4evaBfsS7/0jJgWFW?=
 =?iso-8859-1?Q?zgypy0QWOj2KJ2tgAICzvTU8ds2CyEaUb42nKPusbBwNH3GYNto4L9RZlo?=
 =?iso-8859-1?Q?gpqcEqPjUQJa5yuNFrwXqSbRo/e4jBuDExLAqzBkO8VxlAm+yen4wlXNnu?=
 =?iso-8859-1?Q?hc0VSyyz4JQC55bKaVAwVdSsZs6P0HMNA4B4NIvdaocbGfnwkhcfx7iyqq?=
 =?iso-8859-1?Q?V1/MOaW9wvtgZWqsRNLhCqYa/nGnzGAGTGKPXeVd/IA1OmjLDQX2Bf6s1O?=
 =?iso-8859-1?Q?kBO1GE1OGIbyzgJGasIiFa4JQYKH+yJBArYpNNsydCvy8MLYyC0ncTj1ed?=
 =?iso-8859-1?Q?ddf9ILirhuvWSrJgyj7aWINAhg20ed3OYsDsLu0kI5YHJw9sit+net7h1e?=
 =?iso-8859-1?Q?lEBRPMSJKsRVKfmAAaD4Kp3BzIAIX3fOJVMbd/WY5Az1Uwk+hKoRUbop+S?=
 =?iso-8859-1?Q?DNT15a5IRDG7ssiKctKom4xGY1NogS/8fRJ1d5wt7KKTZ0uN0LryxkiC1m?=
 =?iso-8859-1?Q?OYejKnYd16BFOHghXUU6yUD/96xkf5pOm73ioLrtigjpBo2MFJ23xpP+1A?=
 =?iso-8859-1?Q?ORaoMS0AQ8P/hiNufxWN5xTjApMZm2AfknzDC8xoQkxPjtLueANkO+Mjj6?=
 =?iso-8859-1?Q?W28Z1o3je1UXKfUcdfP1hYPOVXS05Kf7lXw3REnprXZ2fZ3K5+xkJLPYdI?=
 =?iso-8859-1?Q?EjAOzh1I5HioR5H7vMRp7qnfh0b3auJ6igWLdKBsPOsBdWZzxupboMFsff?=
 =?iso-8859-1?Q?iKWgJB/JeDPZrqBp4DNoArHrbjCfurjmDBYe7YBN9ag4P29TvGVrcAD1gE?=
 =?iso-8859-1?Q?zgohmIz/Oq2oA/57SnH0Vk3vAhceSDmTz5zBTkzeQDxBzL7SS+0vwxcW/x?=
 =?iso-8859-1?Q?XF8Ft21sXlXhBMfaUB8FMZghm8twAmrNadeuAVEkpYVG/gYVaYUlEREhz8?=
 =?iso-8859-1?Q?fcAsdhI+pAQoMfpW9nD2I7M6I/CucKzF9I3r5cDt5LHkmIa/bbOMsmMNL5?=
 =?iso-8859-1?Q?G5cIEz7Yf/9gpZuAp8l2ZAfKnHOGUVWsRBFVQ3VDlE5xh3keAYI9tUvfNg?=
 =?iso-8859-1?Q?8JD+JzsD/gDalZkxM1AJLLKjAMMCuGtkbvdV2GRMFAJHnVuetOBlqyMqCE?=
 =?iso-8859-1?Q?hviKm4mu5qsMEWXSVDr5URJquS5rlF8iiSr5rImNzm8UpBQKtFeES0tRFZ?=
 =?iso-8859-1?Q?hnF3udUmegEfNcMQYWrAvmbR/IAsEyAcJszIzUa74MatDuVpxJXI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad36beb7-7715-4c15-75e7-08decc8c0b78
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 16:18:19.5781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+hoUH4R1cPP4UYPJBXMvp7Qd+qTxb/CsFhDJCTtWjtYbdrmGp7hllebwV5VqUjdbX9/Gwaga4YLEldCWEWfA0MpXPjI5wwetBmE2r7jF8lhIkPVcb7fXuyL0p6/dPYJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10623

On Wed, Jun 17, 2026 at 11:20:35AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] Bypassing core state tracking in `direct_attach` / `direct_detach` causes Use-After-Free, NULL pointer dereferences, and Memory Leaks.
> - [High] Bypassing address slot reservation in `direct_attach` leads to unrecoverable I3C bus address collisions.
> --
>
> commit ce08f4a6bc0d82c966d4e3337e6b4d082a9d09d2
> Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> i3c: master: Add APIs for I3C hub support
>
> This commit introduces helper functions for attaching and detaching I3C
> devices, alongside CCC command helpers. These additions prepare the core
> framework for handling I3C hubs.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -1775,6 +1775,70 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
>
> [ ... ]
>
> > +int i3c_master_direct_attach_i3c_dev_locked(struct i3c_master_controller *master,
> > +					    struct i3c_dev_desc *dev)
> > +{
> > +	int ret = 0;
> > +
> > +	/*
> > +	 * We don't attach devices to the controller until they are
> > +	 * addressable on the bus.
> > +	 */
> > +
> > +	if (!dev->info.static_addr && !dev->info.dyn_addr)
> > +		return 0;
> > +
> > +	/* Do not attach the master device itself. */
> > +	if (master->this != dev && master->ops->attach_i3c_dev)
> > +		ret = master->ops->attach_i3c_dev(dev);
>
> [Severity: High]
> Does bypassing address slot reservation here lead to I3C bus collisions?
>
> In the standard attachment flow, i3c_master_get_i3c_addrs() is called to
> reserve the address slot in the controller's bus.addrslots bitmap. Because
> this direct helper skips that reservation, the parent controller's address
> map is never updated to reflect the newly occupied address.
>
> Since the parent controller and the virtual hub share the physical I3C bus,
> the parent might still believe the downstream device's address is free. If
> a new device hot-joins, could the parent controller allocate the exact same
> address, resulting in an unrecoverable address collision?

Should check address before attached.

>
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev_locked);
> > +
> > +/**
> > + * i3c_master_direct_detach_i3c_dev_locked() - Detach an I3C device from its
> > + * master controller.
>
> [ ... ]
>
> > +void i3c_master_direct_detach_i3c_dev_locked(struct i3c_dev_desc *dev)
> > +{
> > +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> > +
> > +	/*
> > +	 * We don't attach devices to the controller until they are
> > +	 * addressable on the bus, so skip detach for unaddressed devices.
> > +	 */
> > +	if (!dev->info.static_addr && !dev->info.dyn_addr)
> > +		return;
> > +
> > +	/* Do not detach the master device itself. */
> > +	if (master->this != dev && master->ops->detach_i3c_dev)
> > +		master->ops->detach_i3c_dev(dev);
>
> [Severity: Critical]
> Can this lead to a use-after-free or a NULL pointer dereference by bypassing
> the core state tracking?
>
> When i3c_master_direct_detach_i3c_dev_locked() invokes the controller's
> detach callback, master drivers typically free the master_priv data. However,
> the dev->common.master_priv pointer is never cleared here.

It'd better clean it and free dyn_addr.

Frank

>
> If i3c_hub_free_ibi() calls this detach helper, and later a transfer is sent
> via i3c_hub_master_priv_xfers():
>
> drivers/i3c/hub.c:i3c_hub_master_priv_xfers() {
>     ...
>     xfer_ret = i3c_master_priv_xfers(dev, xfers, nxfers, mode);
>     ...
> }
>
> Will the parent controller end up dereferencing the freed master_priv
> pointer?
>
> Additionally, if a device is never explicitly attached via the direct helper
> (leaving master_priv NULL), would a standard transfer immediately cause a
> NULL pointer dereference when forwarded to the parent driver?
>
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_direct_detach_i3c_dev_locked);
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260617110355.1591844-1-lakshay.piplani@nxp.com?part=1
