Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18D3484226;
	Wed,  5 Aug 2026 17:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785949312; cv=fail; b=H7hfTWwtBEehwvmmlRKjqHckaRaFEcwWmcoDvUZlm8lIr6ySF6/v1Iw9jiF6n61bpAPueIXTQWRHu6wP84IPBEXY3EC3C+ZPN3P5hS9HUa6VnJqmHgFIvZB1OeJQUgn8nj4F8bm1xs5ibmNOjQT03tk4MxGOLN6HwY8H0MLndbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785949312; c=relaxed/simple;
	bh=awhuEOWS+mce9cHZ2S8wbd8gsFKH237v436uGnrI4Is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GzES4tfyHHmO8HJw527/3gStk+Cdo2D9PCy3hb84iz7KT+q0COXgxmrQytp0jSVnYXAQSO81eKNIvvtT4H4TQxrOz7wB3sD3qQeozlcBXCc9qKZJimptL2DArTbkVXrS+WlO9fuyAL9wvz4RNQipRcDb9ienO2KKD1Elkna+VaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WaipHrke reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WaipHrke"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gekBbvhbOiojGy/vNHvZdxd/0N+wi/SW37dq00ozDZQa8Xo8O6f/JNp+HIgyToXF87kKOwbn6jNCXQOsnuZTooJz2WvEJ2QdN2TDfKPrHfKg3weutWmObUe/LClOtAtBEatLwc8Vxyd9LJLiJVkErO2+eBgoGkTiDsSaHH5VQpSTovmG37C8ioBwc5qbM6tc0A5L0zur0e6QxmTI2GnUA1J+M99GM+8wWY0o7DspsEqEnpFmlicnXM8SMvFE/qTUpmIF/59bjsxu9FcJCUOSUJhkTj3XdW56b+v7DzTTUe/qe+zP/zP3Z2+zYvAzpkIX/bRGJuF1RwaDmXrQZ800WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLISJcBcDqINAy6j4UDKMKR8yBX+bMBfZr6jYDR/hBE=;
 b=uCs97vurE8/pH3ODKbRMD7IW45TQo6lt9/01WYx6rRG52PGegey0fJINzahlSl1IiORrzzs3hSGzDwy7MdmiOainxc8cQ2sulnAdAZyjCCVU1wCXy8TMFbPn4CVZ2SNDUlj1tzH8fZTocxAZ9u8yqVngAAryXUSmSSBat6alQhomePgniuRz5KyS+2Mamx2ULboFSzpFpldv2R+r0kgSvjQ1C0z1sGN0HeA1fHPKAqsNN11AUp9dePV1iNGmUHLRjU3HIRBf+6XfxIYqkgzLJQVXfnSySJHzLJRzGw0JlEEQSvXqzLxT63T72EF181ZPXAsMhWgwF+dmoCC4UCeVzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLISJcBcDqINAy6j4UDKMKR8yBX+bMBfZr6jYDR/hBE=;
 b=WaipHrkeLxrS6S09QHgmQgg24Oaxnbvxh/2ub4VpLgEfFvPGN8a1Hp9dpFA9DzR8oEfo+Jns04JKjwwniSureqbYUy7NQ9yMIw6/lOmTQNNRmJjIGLZvcXbi2JN1yrUoryUgTwf5ounXm9L1c90toPphhg7AfwJYzdf8UUQri8Z/wdsJH9Ic5FZUCOiEWld0lqGoQ3Y/SRLMnRQ36z38sbcx6Jb8Slag57Fz6+PvHJfHRzDCMg/c+FAu0fC/cSlJCN4/wEDnOtV3gkgDpfJNjU72lPL49iiYyIvFW4QsoUfd8WEVQHXqzLkN3nQVbtzbaicbQdt3zp2qhPnGbRItBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11351.eurprd04.prod.outlook.com (2603:10a6:150:2a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 17:01:47 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 17:01:47 +0000
Date: Wed, 5 Aug 2026 12:01:39 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Fabio Estevam <festevam@gmail.com>, Frank.Li@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2] irqchip: imx-irqsteer: Convert to
 devm_pm_runtime_enable()
Message-ID: <anNsc8nBkOTuSbH3@SMW015318>
References: <20260729221416.499781-1-festevam@gmail.com>
 <20260729222246.24B551F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729222246.24B551F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH8PR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11351:EE_
X-MS-Office365-Filtering-Correlation-Id: 1629cb37-387b-4d42-cfe6-08def3133bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|23010399003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Isr93sJuU9t6eGvpU3wu94p0UfFwprP3FgcOzai99TSuEqu6G62kyzSGcwyIcZXG/9ftFqBqYPyYSzPKGleBo/P1g3PsBeHHvfqdRX8hST8acxT/6g7PT8jtjR3xEqkWgXiNEwc2VoyKlv9pqowkF6VeaA8ZpwbEC8IkIWdmzLJveYv3g9mxmkjqtLIJcOW4T9gs6i2nAPKFuTN7RRSxuA7+Un3aBsj4ATTb1fWtHgjs9WbcTH88M7MuGAJsc+fHxNomzUBXoWsj4D3+ar0bJa29y8cVbWQyy4T2BmnPH+59MP9swxAR9r/5zTD3W67bVuZzZEdxft6XSrBv7STxuajmlTrbpmzQAhdEYsZH5e2m644TuNQrbScqBujjuvuNykHLark44ReRfY6dRVanUw1/uHlPAsrvqgNwjkYsn4gzXIjEbTtHEjbwDDC6i46ynZPpHMB6EBsJYGf0BOWS8QW3S5UQCyDVtA3l+/T5s5FZ3kZ85i1Bk8k5TiUE/Wr7R4JyactHkPWPB9aDHdoqUjw8w2y7rxSXgfDqFk0mbhl4b2gvP0uUCIRTC/WFWc5Bv1FMK1yv5HkH6ZCJhglEDG/ox0ZfmtEW8A2EjoVUbas=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(23010399003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?DfDEvyTxt7S2nFwyEKbuf2fXlLissfbszpPC3g64jcNIMmcPysOrvdvMXG?=
 =?iso-8859-1?Q?bFxD3lNBZhtM7dHYGK4kfPjV37VraL+fGbs+/j5Axw+rg62P2R5aMSRv9q?=
 =?iso-8859-1?Q?SyrsEvnlmeyh6fH7s6IuilhJp2wlygKg72aZ5VhoIuFPGsA8DhAvZ3WdqC?=
 =?iso-8859-1?Q?HFSFuthKyyYUalVoaC37WxVB+W8iP17cba+OkY5PggUx8J9Goakl1udf0i?=
 =?iso-8859-1?Q?zPWoTtgeWAEO8Gn15TqEEzIlNZOM0BJrDVWHV5wrcN/kpaF+R3z56J5aBE?=
 =?iso-8859-1?Q?//DdnImAPNZ3i+XWqaOVJXzRgZiNpXluoDFYo2uTncwuRsPSOdfpMCm5lY?=
 =?iso-8859-1?Q?pyUNEd2i3dFmHnCu9DeVab1toCnsguuYFj/xKI13XzSKkqCbzlsud6nkl8?=
 =?iso-8859-1?Q?3n50GSjgI05OoLXQKqUI/mjPel/3F49QNl3+CYbs1By0p299mURog7ZDdG?=
 =?iso-8859-1?Q?EFL3f+ueJ07dtAoO5x4VabgfeyN84KM1nN9qfYA51RqEwjH/ZcV0WePmu/?=
 =?iso-8859-1?Q?8Q2L66XIw3ASup4sl3lnNzNK//p3hHfpPCU+Q0p2zlo5C2JZfmuAbtfcTL?=
 =?iso-8859-1?Q?Kp+EnAvnHuvNC1Oh/0ssWxksMOQVFccQ9EAtSE5yiaYuNXstdT0/MBHiGP?=
 =?iso-8859-1?Q?om7LSpioQFr20ZIhy3CTjIE81NEyFM8/8vZwolT9WQmsGp8UgUjZ2k3zsr?=
 =?iso-8859-1?Q?ygY3cvYB3mgdhj5U456A0epxkgHwUTTbmHUR+R83309iI1z7YZjWi/+ljM?=
 =?iso-8859-1?Q?94dRNl9pbfMQ2bEeMiJ3oDT6Z5FqNIvHFKxo3NEfsiJ5OkDD6yoCvzKIt0?=
 =?iso-8859-1?Q?CdiQjlKy+jpW8/+JpED8tgHQkUckf8O57UGK090t1mqhNn2NOJMMP6bMtv?=
 =?iso-8859-1?Q?0+SEWsxjrXkEssokNLJ78BQLIfZyFmJN1VWWBCLvEaXMrTUL1T4eZlHkpb?=
 =?iso-8859-1?Q?a90Ei0EW8gw0oAVn7ggxH0HhzkrzTMfj2EJSI87ARVpKzcLWXZyFtRCtqI?=
 =?iso-8859-1?Q?ouKIBwj+5Oz11Hf+XAmnMzsSR1HvtTxFN6iyFkDub9+fwF40K/0L0Jtm3r?=
 =?iso-8859-1?Q?LKdBkMWALx1Ecii7LjV0NQ0CoE21fk8AFtYBXo/JQKy8Psxf9B/0WIm25P?=
 =?iso-8859-1?Q?DrYLn6gKPvzQYV8926k+l6NKBdEW0AFJUpVRV45jj6/enRl75TacdhAi36?=
 =?iso-8859-1?Q?pMoRoW4bwnZCLMne63eHte4oF6ENrS2eNcBcvRO9rTByO8IhUXebo9ztH/?=
 =?iso-8859-1?Q?qb8iIygoSqDuCcxv4uflMQhKwiYN7RzId4kHxdnrxFXVQ/b0Iwx6+lfjeQ?=
 =?iso-8859-1?Q?OK8R5Kl4pWR16dH0Q12DxdhhKDNwIQ9ka95wji6d7doPXbOW2TYLWEGGP4?=
 =?iso-8859-1?Q?CbuTWRE0Sns7hSumtRYOVemhe28ohFuVC4h5Ec82Ej4YDTMclgzn7BTuWS?=
 =?iso-8859-1?Q?AnQ7hKb6UtOHpcOLTxrbi3uHpgOfv4uPUVIa5QCg68tWnHr4qXoJ0hSPSh?=
 =?iso-8859-1?Q?sw2MzqYBmMAE2wWeczp4ibkSxkcBlEwnRQtkEAUlRM0ZHxPzO8yjzHZByV?=
 =?iso-8859-1?Q?edHB44xbSL855u7251Sq2Da6AZqrCVRrkV+QQGxEwPW933iBVNDm7sFYoh?=
 =?iso-8859-1?Q?B4CVwPQ001B4i4znmzaiD7vMIR0a1BtZS1B0kUi9m1Da8a8j5UtXpuvmKB?=
 =?iso-8859-1?Q?dV3jq4yDg5mv2pKwncTtuPqnZlLwTmpQKHBgTqhglBY0mye0cFx2Nu/+P7?=
 =?iso-8859-1?Q?7NflnpQnaWzjRebj9YVreQMmiVq+38DeFXcvk1MRQsZXAaKDbDYXG/Q9D3?=
 =?iso-8859-1?Q?PU7QTq25zf7Af3PxZAG5pBHtxNnq9tFFFBMqsNsm0jnM/JFcYbyb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1629cb37-387b-4d42-cfe6-08def3133bd7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 17:01:47.0493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyajTS0iHSTCb+eEFh88fPLXIJKcaTCaoevF8tcTci660vUtYzBAXu5cVvUvZHECiz/7rvf2wIGIqL37Td/FkbrPJ3Ecn0RX+1JsXH1UDL8gt78N3vqPvqAWxnF8Omcw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11351

On Wed, Jul 29, 2026 at 10:22:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [High] Adding devm_pm_runtime_enable() introduces a failure path that fails to deregister chained IRQ handlers, leading to a Use-After-Free.
>
> Pre-existing issues:
> - [High] The irq_domain created during probe is leaked and left registered on error paths, creating a dangling pointer risk.
> --
>
> --- Patch [1]: [PATCH v2] irqchip: imx-irqsteer: Convert to devm_pm_runtime_enable() ---
> commit 3959004c7e2715ec92cba0eb90ac30fdaf1b65c2
> Author: Fabio Estevam <festevam@gmail.com>
> Subject: irqchip: imx-irqsteer: Convert to devm_pm_runtime_enable()
>
> This commit converts the driver to use devm_pm_runtime_enable() to
> automatically disable runtime PM when the device is removed, fixing an
> unbalanced pm_runtime_enable warning.
>
> > diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> > index 87b07f517be35..ba1203d3edd4d 100644
> > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > +++ b/drivers/irqchip/irq-imx-irqsteer.c
> > @@ -263,7 +263,9 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
> >  	platform_set_drvdata(pdev, data);
> >
> >  	pm_runtime_set_active(&pdev->dev);
> > -	pm_runtime_enable(&pdev->dev);
> > +	ret = devm_pm_runtime_enable(&pdev->dev);
> > +	if (ret)
> > +		goto out;
>
> [Severity: High]
> If devm_pm_runtime_enable() fails, does this new error path leave the chained
> IRQ handlers registered?

I think move this before irq_domain_create_linear() and use
devm_pm_runtime_set_active_enabled() should fix this problem

Frank

>
> Earlier in imx_irqsteer_probe(), we register the chained handlers:
>
>     for (i = 0; i < data->irq_count; i++) {
>         ...
>         irq_set_chained_handler_and_data(data->irq[i],
>                                          imx_irqsteer_irq_handler,
>                                          data);
>     }
>
> When we jump to the "out" label on failure, devres will free the "data"
> structure. If a parent IRQ fires after this, could imx_irqsteer_irq_handler()
> dereference the freed pointer?
>
> >
> >  	return 0;
> >  out:
>
> [Severity: High]
> This is a pre-existing issue, but does this error path also leak the IRQ
> domain?
>
> Earlier in probe, the domain is created:
>
>     data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), ...
>
> The "out" label only disables the IPG clock, but doesn't call
> irq_domain_remove(). Is it possible that the IRQ domain is left registered
> in the system with its host_data pointing to the freed "data" structure,
> leading to a use-after-free if IRQ mappings are attempted later?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729221416.499781-1-festevam@gmail.com?part=1
