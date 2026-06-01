Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAE92D9EFB;
	Mon,  1 Jun 2026 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337164; cv=fail; b=jNkepvCrvqsWSz9duyUXH+Cm/40EYxevs2gWuiSszH7Rd0P88lhETbLTOfxvnQxwnX3eWIAM0Q2Q9vR9j1ctSWO7QT6GZ6pg9OOMQvmGabd9Kr6/fa1s8mRAWb52c54upqcr2uF0HQVYHhVxxfBb5aIuyNy+B5TDJZdvMtJ50ZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337164; c=relaxed/simple;
	bh=yCBCdCstrkftyz3++3vsBOHeHGSBHiclV/Z+40X4iDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UtJZE8vQ3UCx70VNj3p3tm0kOulrMjMt2PfcZIi6jEA4UQSxBIGau416Zjkv7GXz1mmkVIDemvj5KZNpK01/HhxqIJUPm/aSkTsTSaV8tFDQXZaLj5jzZzccLCUfvtSg3kVND+bh+UiBDXpWEhFrlaJGHrhZkMe9UtbJZEq8YvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hLqRCeNd reason="signature verification failed"; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hLqRCeNd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1XUBMvq7wKpcY95bXMrPlJRDHatCuIyztyEjQGYf76DTatz48G9ZBT91Nmvg7/GN/4VrUVJV6O888q0D9rXVHQnjxW9HavWkRkyMTmTQz7tpg3G8oyzZQYGmj9wa9NghE7aLpawL23CM4L7wz8cJQKBcgYw49Crly/bNTAgKKk3yLrBZJ7t4PpcxXXMhzSkzyymQHgpV2jLw5FVfjSIqavtfU96/EQqGuvBDZh/HOoaMmu4ZVHa2ST3p3kBEi+XedVNLWIuVbNfv2PFspympzrLp144aFPaMFmu1RnOSmquFnJviKNdrmOzE73ehHoyFnZWmSRWANH7wcis9ihh0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WtrD/Upip92jW2JIgwMF7SxHrubeNwBASqWQu6fD+0=;
 b=H7aie62p1e8w3bQkckbNmtD/evWoy5yUrXmQq4cN77s4Elweuu3RnWH59td9GVSbdMkgropSJ43A1+llC1SGro3HWvnaCeSrSqif4zAcKxdZpCR51HYb2vE5Vdx+6R2Zka4+R2Uk4V+jUNRl6kypg9FZM/2wfcAP5Fp6I+knP2MiP8WRXJ+b6SctxjJ5g5nt2+fwrxi19tOxHuZJJKz2v9GlbGkYC+UKSO/jQBt5zdToWi6a0I4QipsB6gS4Ps80SCijsmweeAada2zRibACbFHiUyqRWH5YfMN54Ka0o0jzuypLEo7Tc9qcBflshJX5FLsIfMFSQvC1nLRfPf7meQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WtrD/Upip92jW2JIgwMF7SxHrubeNwBASqWQu6fD+0=;
 b=hLqRCeNdwZd7Sk6+XIFaULn/bqa8gYKigRTOzG3tqlZxACcrCIfgPdrmiz85uI2gdz/dyEAf29LVV1UZwCev8kfKCwTXbyHK6Ey1VCy6Y1cC0DXIxzKLCx6iUWxbbBqcldVEGGeWn6aPYsHUEVEBYDijklJv39NK++V7ugT3eyXykrjeD01RqOmHfTWW7qAS77iqJh0Hea4dmiGbr38EtHujHYKKR7ni9GoplcUUAkjXFUVrmPeEcPgLYkLGd6tfHWVKfImuW2oevcRshXweuCLiddRsb6yiiogJ1ct2+ntnHFXId6Mx1rC3VRGQlXBoBPH7izqTtoMzXjRS2oMqsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB9932.eurprd04.prod.outlook.com (2603:10a6:800:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 18:05:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 18:05:59 +0000
Date: Mon, 1 Jun 2026 14:05:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stepan Ionichev <sozdayvek@gmail.com>, Frank.Li@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2] firmware: imx: scu-irq: drop wakeup_src sysfs file,
 log via dev_dbg()
Message-ID: <ah3KAOf95HPJ_T3K@lizhi-Precision-Tower-5810>
References: <20260518093934.1910-1-sozdayvek@gmail.com>
 <20260518100816.38FBCC2BCB7@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260518100816.38FBCC2BCB7@smtp.kernel.org>
X-ClientProxiedBy: SA1P222CA0156.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB9932:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d727a2-9f30-4c26-f094-08dec0086f16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|19092799006|4143699003|38350700014|22082099003|18002099003|56012099006|5023799004|6133799003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	NRC+aY8Vb2tvGJd7QeA/6dnfMNQhDBxTvB1759chkcOyCYxwD0e1YuF3xLI1aLtN3P9M6+TWMguodhlC/XQrE11ARUm3EV1QNr55S2m1fQ5ypY2XD0+2Mv0gmWEIPrpWFxN9tsPGAMFqoBiqaJEMbpGbj9TClIIxj9lUuerhZJoI/YFEbxSmRfSNTFyaqE1oy8K1l7chRd4/eoyVrinb+j/N16fBna+ZzumA0LoW/xS70yJsyQ8YTVWQlvIS+IdGGJhHx8fYWKkh3pI92vD0LlMTrosTuHQ0Rr/1XuyDbo3BG2DqOhykijnql686WwspJYH+R2YcXwvo3V7anfi7x8gUfYxynL8v0yxuKoNAvPErTsn7x3tttzprd6QuesbYKRoTM/sXUODLh7XtBG9e8KsoZKTih6QNQQY/Z9rjovZiOAbf3ASmGtrPRWppZZMBQVaiPrkU5Mw7SOJH5oFZobdLpYEYYIx8RQ/ZlLsODHxReRtaM6iIyikROuxLx9aMH9jmBXMV1AJxY82z/yRPgMmjm/OGGS5WsT6FWk/uerdiO8aXugTYZqfPviW068g4k2xK1HJT45+rpWMLGoTah0FF2v73bQhV7/p4Cu0DrZMYSqqCBAgQ2lxbdPGLgU1IZ2lFV6iX1sk0wK9G5Y6+7W/bEh+/PSasTbFZBuuAjPkJzYFc22akiwtxSEFafChe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(19092799006)(4143699003)(38350700014)(22082099003)(18002099003)(56012099006)(5023799004)(6133799003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?/lKK6FxlI6cFpRukvi+RkPWKmn41WZnIw+KOB8NR57iI2Pex+tJ2FSyade?=
 =?iso-8859-1?Q?u76m8wG/NpHIVGIOaiNBwXc0Em1yk3+Op0KLqYCYFTPadAA/iJGWxcIPzG?=
 =?iso-8859-1?Q?3HRYO3E2v9jv8Fomlzl5hTEUz+1m/PVQraO2aQrKLRgpOtbDFOHom9brE0?=
 =?iso-8859-1?Q?o5tsYA0QSl7wnzJx6H0d+PZheYey1D/VCg/MBhtWUxeBnpPFdqvmiKU7jw?=
 =?iso-8859-1?Q?V05+nAXUm+yqfRKw31YnTRauHaC18U2CB/JyFpQ/13Cy16pJESDyzzgxjK?=
 =?iso-8859-1?Q?RYatJK6Qs4BwicNWnIy+VcOdoexXvS7WTFGY2ka34JwSRi8CViaFdCq60y?=
 =?iso-8859-1?Q?btRjypbh+BbnKabMEVpLXltxAEDnvyAnJizOOkGA8ugbthXNS4sn+hEJxA?=
 =?iso-8859-1?Q?ME2wZ9Aruf+2UW3pKX/8Dz0i+61tiKg3xiMYlKUZf5slNp8rbEx0Gm5U2J?=
 =?iso-8859-1?Q?KULoS+3EQlCXn3NF8ZGkhyLQHZ0Pwe4tz1lAeOKH17HdGa5ozkRQAWoD4K?=
 =?iso-8859-1?Q?OxODzmdn0oo+Gb+wwcKcUMbeYFlKeFJBF7pATublmRfBsjiwqWOFTVS4Je?=
 =?iso-8859-1?Q?6CbhppTdIwPtan8HX9WrC1DJWOg7dSecxq6uHXkW0Iu2iW/O5VEribDm3y?=
 =?iso-8859-1?Q?DSAUZ7DsIV4XvOxMBGShn4kxPB6fb+QoAoUAWkywNTFBd6kpJZRE3qk6m2?=
 =?iso-8859-1?Q?/1IVkTcoskXjr24kW6v2awUyKZxBV7/4EowQjh85fNBeQSBk/ZciPgV2Z0?=
 =?iso-8859-1?Q?ChEh71Aq/U7csrCx1LJpvKGq6bNVUN0xJaA24jV/2g7rLJrX5a1xtAt6PC?=
 =?iso-8859-1?Q?HvkaQDhOCDiJzKJ6dCBWd9gBOAhoQJQtNbWq8kFMaIG7T3/8A39Ud5dHC9?=
 =?iso-8859-1?Q?M89C3lVT0pxDkOYt5vVoDR3D/8YEg6HUC8iUUecCygmMoTB/XM9NyTF+ZK?=
 =?iso-8859-1?Q?uNWjwq9nrXxONEvTmGZ5vikdHWgSWNFnf6Le4b3fDogig1SF42RxEiB/gt?=
 =?iso-8859-1?Q?Fq6mX+bruSIqhCWd0mOwkHvPKZhfC6AIu8aP3NaWa3q345HGHgnFBNYe/Q?=
 =?iso-8859-1?Q?aIzOuwuuC8PZeGCFJmMVJOqeDijQviehsbMg+kAMO5K7uvDb6igaUdEwWV?=
 =?iso-8859-1?Q?Y2z2iRAHW7FPdgeW9rDsNly6zw9eutP8OzU1EnNquDh1N7FSycD8C143Wd?=
 =?iso-8859-1?Q?EpWI/UcAGXVZ2Jiv4ywn4X+F3Mudq9fwEnlEW4/sfNcTEyOayWJ0xvbWL2?=
 =?iso-8859-1?Q?JJiTNVqSWrMdBuLaxil/jdjouotofazEtuzIAEvCYDaZZKhghHjasZb8BG?=
 =?iso-8859-1?Q?2HnVtNlOFEmM/knSe88KyAVq2wUEkGUszZXQocIYVRCplHAvzEgPpDc7zc?=
 =?iso-8859-1?Q?qIQDpVn6jy+1wrcEZROv3NoQ2+wld6fy6xai6Q4zEmpMBFeRFv8C9740GP?=
 =?iso-8859-1?Q?EVPJe0eppHkI1LyOuVROu8O5EA+QCRCJlHOaS/BzVHxTev+FnaP7T0eWpw?=
 =?iso-8859-1?Q?tzhJ8Z91INueBJ+p50H5XKu/S23pn550n4FAvFZpcYu0FkL/aZlgcB82Rs?=
 =?iso-8859-1?Q?sGU/g63Z8X6pJqz90YjjFaddyRoavRywb7tzPkSvmBVTC0nZwfzL6mgrs2?=
 =?iso-8859-1?Q?UXUDmacG4j7I9rfUvqRGz2hAKT8Hk31mMeORXr8HoBPoO2iHzQNZVc/P1z?=
 =?iso-8859-1?Q?vQtiiCi6QHWMIRndVLIOSPVYosVOqjgWD59RzAFHkG5PTY/Rg0SADVpEmk?=
 =?iso-8859-1?Q?U6xLmyxmNF4fqexJ8jQqTMRTDaSHelaHYqzjF53H186NYL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d727a2-9f30-4c26-f094-08dec0086f16
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:05:59.0379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+Kb9R6N771SAKv7LpCozUFQRgPMTAIdTejvSUhwCCW+f/HRL9pPFTrwSwduRnDYAhjmHEVHnVzP7zOaca3RKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9932

On Mon, May 18, 2026 at 10:08:15AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The global device pointer `imx_sc_irq_dev` is cached without acquiring a reference, risking a Use-After-Free.
> - [Medium] Race condition in `imx_sc_irq_dev` initialization exposes an uninitialized pointer to the work handler.
> --
>
> commit 3ac9bd2a1c44ca3562cddf96e23e9b5c60b0feea
> Author: Stepan Ionichev <sozdayvek@gmail.com>
>
> firmware: imx: scu-irq: drop wakeup_src sysfs file, log via dev_dbg()
>
> This commit removes the undocumented sysfs attribute for waking up sources,
> along with its supporting variables and kobject. It replaces the sysfs
> interface with dynamic debug logging of the wakeup information via
> dev_dbg() in the work handler.
>
> Link: https://lore.kernel.org/all/2026051656-corral-edgy-290c@gregkh/
>
> > diff --git a/drivers/firmware/imx/imx-scu-irq.c b/drivers/firmware/imx/imx-scu-irq.c
> > --- a/drivers/firmware/imx/imx-scu-irq.c
> > +++ b/drivers/firmware/imx/imx-scu-irq.c
>
> [ ... ]
>
> > @@ -233,29 +199,11 @@ int imx_scu_enable_general_irq_channel(struct device *dev)
> >  	if (IS_ERR(ch)) {
> >  		ret = PTR_ERR(ch);
> >  		dev_err(dev, "failed to request mbox chan gip3, ret %d\n", ret);
> > -		goto free_cl;
> > -	}
> > -
> > -	/* Create directory under /sysfs/firmware */
> > -	wakeup_obj = kobject_create_and_add("scu_wakeup_source", firmware_kobj);
> > -	if (!wakeup_obj) {
> > -		ret = -ENOMEM;
> > -		goto free_ch;
> > +		devm_kfree(dev, cl);
> > +		return ret;
> >  	}
> >
> > -	ret = sysfs_create_file(wakeup_obj, &wakeup_source_attr.attr);
> > -	if (ret) {
> > -		dev_err(dev, "Cannot create wakeup source src file......\n");
> > -		kobject_put(wakeup_obj);
> > -		goto free_ch;
> > -	}
> > +	imx_sc_irq_dev = dev;
>
> Can the work handler execute before imx_sc_irq_dev is initialized?
>
> If mbox_request_channel_byname() successfully enables the channel right
> before this block, an interrupt could fire immediately, invoke
> imx_scu_irq_callback() and schedule the work.
>
> If the work handler imx_scu_irq_work_handler() executes before the
> assignment to imx_sc_irq_dev completes, dev_dbg() will receive a NULL
> pointer. While __dev_printk() handles NULL gracefully by printing
> "(NULL device *)", it would mask the intended debug output.
>
> Should imx_sc_irq_dev be assigned before requesting the mailbox channel?

This make sense, can you fix it?

Frank

>
> Does caching the global device pointer here also risk a use-after-free?
>
> The dev pointer is stored in imx_sc_irq_dev without acquiring a reference.
> Since the workqueue and mailbox channel aren't explicitly torn down on
> failure or unbind, the pending asynchronous work might still run after the
> device is removed.
>
> If the device is freed, accessing it in imx_scu_irq_work_handler() via
> dev_dbg() could lead to a use-after-free.
>
> Would it be safer to take a reference with get_device() to guarantee the
> device's lifetime during asynchronous execution?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260518093934.1910-1-sozdayvek@gmail.com?part=1
