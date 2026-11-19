Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.66.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795122446;
	b=T5aVGepWOzC1D+vhT2t77OLcap6XbPawUDKeZydOZXeKbKTTaYP0WeBCNTdifi3TR8Q4
	 f++KFo96Fx2RJ9qABYLDpDS6v/YJSvidlzdn+JUjuE9g33OdXgqsPrQ+OD4EnY8CmDSh5
	 0gmJKAnTA3E/+Xl3/CA3TYI1bk1t/f9yz8zOYeAMhF+FmQF0a+nAcZEfW8CqYH5EmVppH
	 Yh/O2znRx6ehjtYo8TNCbLV9eYgxSaLJ6+9Yl5LGeWGghzVYko2fPbjK9Ym7cOtf0Os9/
	 ym0JK4sK4pjkonfv/ShHnSMaHclkTxy7BHcUp0j/FhHbt1rF8Rb2gDAPF6JeBeCRWOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122446;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1mGar5SAA13Sp25TXhERIFMIH957P7YdATkJAsi2o4c=;
	b=c5VLHBTV6Ft+zNRhd+fcWLOzBrqvloe2dB0WoDPWhmAciEFu/YmHpfF7iQbCxZsVzgEB
	 2Hocj37nf02CKKTz0kXErcIHBoDEU8yadmbSw2sxr68pwtv5qSS9k1C9q1s11WY8+CeWx
	 FwOTCb+1c9GiLcURAHKFf3If8lPpqqcRG4IO/ses8w5XDTYSZ3JhTDptEBObWT8Ru3s7s
	 93iZdQ92ETTn/CFHwpvJQHyW61QXzG07wtp1YXX8UzWUk+sqGmgZLXoBo9V1pN4cHW/xu
	 DX7s++mhTxAIDIWn0PNnplHxdyqzU7hJj5KtH1PC1zoK/kyaoXlYiuWP37NRyKa91sQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=itHfyCTQ;
	arc=fail smtp.remote-ip=52.101.66.70
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B972C606A320;
	Thu, 19 Nov 2026 21:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B972C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=itHfyCTQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsG80Qr4If5U7kgzuP7mlTg1Ij3B5L9wsLYg7WZ5St+GTO2Blhgj+3LJPW67Xggx84bgvQPfs/Szoe+WwUGeAB+IyzippyQ9NMRfkxadZBWF5F01ELqebW2Or9iuVqY347ibOsg1mJcWL2WOrvSVDFcUOvTurY+tNUgEMp3qLBpsirRrfGJ89CvpLJ1vFCDiVH+55d5LPT5exMWNLGnLg5TL79n0kplnh0A2WcWHSeQZ/P2JpgQestEcXi89VxsbPTeY4Z2/5KV2HretFplcDEmslhJZkHu0ZTiD8nvfR0WFverCAtSZv/cZDSj32m71H7GBQ6DKXPR7jWjl6jbd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+uLWwtc3KMTXdPbE7egAYUYs1a/HjKVrJ3J6KtX2+s=;
 b=NjfkoWBZtSUSQ0v2BMSOf8aoBddUEXx8Kb8zSG2wQjjkT/8KCkw7CbYNYffg77eBVkM5Fou/Q4k+lAckLsb/cnHSU1fWKC7tp6AabAzw0c60ulS9NQAUAf39O5MZgi/GY+mHoWe9aTT2tNdyQAPjq7eBEsGDWa+MUkntWhB6JyjsuiNhgBKxONLcYL9gkwKwnHSC7yrGjrAevBtiQ23DQ91/vBGRjBBjzcRfEsuQcUqPOUOL3HIuBmrUIcOi+XmCFqMnduGFxRB0N0m6dZ6RMZzmKguX7zsZ8L3f7DZMdBehSL6SKP+Z2ohLYY2IGuTEMP8gkMcowXyLdYzWq5oduA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+uLWwtc3KMTXdPbE7egAYUYs1a/HjKVrJ3J6KtX2+s=;
 b=itHfyCTQMahFxqJeCF9+W6dovEBOrerToAjM0qy/cqHzNd7EudQRFqZ4IeuKl/9sk1TIuLeJAZgLEPXw97kYSEFYLlzW9ClKlm4T7fvbWbRDgnXs7/rUH51kxuocV+MinR4asUDkMXqEeADmXW9aE/QKlq3ZIygoBzI3CNkGSey3aLQ5w9NhN93q3oODvjkkg6OF36OOHBl3pb1hrNsmrKnL/SZHlQ16gud65iMNtXFkYBscfWc8alnGogNYYW+EwcO0HEEopllw03uZD6xQSRoBxwTjhFonAxNUzHoF01NcFMwINCe8nrPsmUyt42OXrTiutxWU8PBCK75Nvk2+tQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV4PR04MB11752.eurprd04.prod.outlook.com (2603:10a6:150:2dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 21:07:22 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 21:07:22 +0000
Date: Thu, 19 Nov 2026 16:07:15 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>, imx@lists.linux.dev,
	Frank.Li@kernel.org, media-ci@linuxtv.org
Subject: Re: [PATCH] media: coda: Fix potential use-after-free after VDOA
 removal
Message-ID: <av9lA75EmTaC9OVD@lizhi-Precision-Tower-5810>
References: <20261107-0d0c29e10a-media-coda-1@mail.sdu.edu.cn>
 <sashiko-outbox-202680@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-202680@kernel.org>
X-ClientProxiedBy: PH7PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:510:174::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV4PR04MB11752:EE_
X-MS-Office365-Filtering-Correlation-Id: f678a1e9-fc17-4049-b03e-08df46811aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|1800799024|18002099003|22082099003|261009223027099003|4143699003|260925021911599003|260925021311599003|56012099006|11063799006|261026140227099003|260925022911599003|261021123027099003|261102123227099003|261028144727099003|261021121427099003|261022075727099003|261102130727099003|261022105027099003|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	W//CpfYb69r3DKA25so73Hovkht6lNF2eqjo5a/yKchuWKIth2tgkPe/+pVkg7AsIawWxnqLJtB+HyjF85Nkqu1hI/RLcD1GFbtsDpYP/CrH+tjnF5rYBgCzs80Jy5tHN1ZM1s1/KB/GL+F+J4XmTzYtfhPFUvfkqrVcLmc2QFI3JXa8CKRO1e52eC8i8ByfSfUTm+Vp/QG0FXxXtF43BYOeqtd0J8KIWK6C1Phl2SmkNR5gDg/P9DeJoVTZWQB2444jm5/j4cCchNpKpD28/hOP9Cq6EE/YA90l9BBFtSHKlFpVDR0O54Q0aPkN5Td9wv21O2fPS4JzWV/4teDhhi68KNcUnftoHdviBt0+yALSIpLka8MyZQdoaGFDts9e6blgu8KfyMRWFzbbwh4srtmoqyTGm0Z/Cgh5IPaLBT3OFlYfXqAmjuYxEH4BjM5ul0nyHUFappYcJgrn1D5UrV2hNgyJBUrpl44cVMGbR/AvPlyCJ5Vn5k8ayuwGj4+F5160VS5bjzeaEkNfB2QgyzFPVE/T14RmDSem1hxebBEl/7vqmFrBu5WGaBXkmMZUnkSZVeyUGHBlTQdQ1D6EJmbAPnl9RrDa60F6K+H9Vt8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(261009223027099003)(4143699003)(260925021911599003)(260925021311599003)(56012099006)(11063799006)(261026140227099003)(260925022911599003)(261021123027099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261102130727099003)(261022105027099003)(10067099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?JgqbA1XQDbfS9yr6HW0bnfxqDzPvTddfJ/XckPjPUCbLkZNl1aDBg2RLNS?=
 =?iso-8859-1?Q?lKmgoa+jV6t70DTXaAa1lkNQWwgEFmS3i+UnDtekzM8BCNZ87YVLp63aFI?=
 =?iso-8859-1?Q?DoNMAL88Cr4I6rB/cJdKOxGdSAgJhizCRdyvLXJQ4C3jvAqO8tmy6DJ3GX?=
 =?iso-8859-1?Q?y+q332LW/2ADzPJ562vm/R8YY05K3nepYE3rUp3j/TgL17LeoNpIn64+3s?=
 =?iso-8859-1?Q?Jy7KwnF97RNrf074hYedCascEXhHqrh3VxKU03jaWeMjMrIIGlBD5cbhn1?=
 =?iso-8859-1?Q?jmEHE8To1OZqGfQW/tdvALvSoDi4RZAq+tsNXkIiYVtQ/gt82Inc3OpEMu?=
 =?iso-8859-1?Q?C1AmJ/tPfFl1dKRvXNkj46Xi8tudQ6WDYtPIwxIFSev1LSbQnIKA/OvGiE?=
 =?iso-8859-1?Q?pVu6kkOWbeibmJ7M8/pgcIs9g77fUotXVQ6b5vQjfiL/rP9z0Owoi9oQKA?=
 =?iso-8859-1?Q?EpamoPCY4qdDE6Tu0D9jURtedOuEjYV5q1yJcwa9lzDFvdnI3GfA2C/VGl?=
 =?iso-8859-1?Q?4DEL0AG8xFgpEfOfPSH2B9onfH6hFhdCwz1FyZGVTP/JHmkmWhmw/lxfl5?=
 =?iso-8859-1?Q?oyA6tJ73WVfodxvjX6QBKys/xOiQjd1bXf0mlk8Vq4r7PLvSajacm4BMWQ?=
 =?iso-8859-1?Q?uqVTKun1uYdrCBoISlF5K42j2wOvXP4+wJTcKP7WMRAS32JmJRxfFGwihn?=
 =?iso-8859-1?Q?6LU0w5XcuU1zMqiPa6G0/WRBOTlQRsxnjB18CsspRSePlpID7ilWzoZF/B?=
 =?iso-8859-1?Q?cjK/o2vwipuBkwnsib43JRxNdMwCtlMEgeFip6xaviwty5bwLw8A1iDuQb?=
 =?iso-8859-1?Q?9GRa/p4mlhBGpc5ZSG3xj2lTtxT22wvo778KeaWOaQFlEh/ISLWPW/7A7Q?=
 =?iso-8859-1?Q?HyNA9kavx60G+miTTPLdvZccfjuC2TDc1KjtMT87Pht0K/9ZWo7uSDWQHI?=
 =?iso-8859-1?Q?0MTOA2zhhdd7QfUr5UTPibq/pYxyQalFzl17SK9NCMn48AGfBOaIq8Geih?=
 =?iso-8859-1?Q?ZfXo1ja4k7WHBYyf5TaQx9iSUQ/WlXPc0yLu2BYs/C9E9QGtDJGyRxooqD?=
 =?iso-8859-1?Q?q/EOG983x8+l0RAGaHQETvYpJVMbW6McOnu4EgsdwYt/XwrlHPs90zuabW?=
 =?iso-8859-1?Q?nk8Be6mbQfEPQvRTye4emUkaa/2OT2IMrRzvY2QWO8N6ENhEyXQe8Im4h4?=
 =?iso-8859-1?Q?EBPMiFU10QitYDzqZrI2zmt2GRUqYmLRBhtN9NV5YiqjgceQ5/9rMTWMiP?=
 =?iso-8859-1?Q?Kn41P/Ny/SeKagm/V4KYcb8xGNwQsCspQ3Gt/gOUfiFRYHWFPvbBPmR0LW?=
 =?iso-8859-1?Q?mX19xFiQPckY86PHQ4DTZkiBkEbLxxOIeZQnFHzXWj8/hXbCqoUonwluhX?=
 =?iso-8859-1?Q?auxI0/lHhwvOt+wAo4n9iwLtLM0E3M7IQSflSfprLITn5p/L7TXHzxqjx3?=
 =?iso-8859-1?Q?7QiJeGKO8fQldo7vn2nW1N3PivG56zl8YC6UNHqxAOVHAbP3kH9jjiOAnO?=
 =?iso-8859-1?Q?jIXl9yLAVCISXD8FzbKR5Z0cbsmlMHc9n6JAkfVDRyDnpIkmAcRphHjwhu?=
 =?iso-8859-1?Q?1T52zYUv8+hG969nf6JV59R2VE52/NXxvBi/zGT+le6BiDaK4QXltuJ2qT?=
 =?iso-8859-1?Q?lbV1F2xL9i/eF5REJwVKaqn2Yhf5RwgZmGuYsF+WTNjEiInvnuGbZGAwNG?=
 =?iso-8859-1?Q?3BbuSFg2aQbkDmTFLYuY9fluofujsGYqCkf6SBYpiV2faGEOeVcbY/d58R?=
 =?iso-8859-1?Q?kbYYW+jw0XA+0jA1OI/4Q+QLOHHhfmoNc6EWF0JXP1cWAQgsY9Fk0XrW4e?=
 =?iso-8859-1?Q?Q/jm5SlOHT/lz4a3f4SQnoP3R5K5xjQ/FXYZSP0aoKD1pTOItNA3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f678a1e9-fc17-4049-b03e-08df46811aee
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 21:07:22.7447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5MlcSpJei+c62M2Oiz83NFdmha+/KJhKSBq7iTvZPZ0K0fkiMCAvsSn+XJGBwEzZdEOzGgAJBu+WK1sgeI98t2uJ9Hc0SR5lUSRqamAOHz21tkwnM1LubG0KTFa7CiY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11752

On Sat, Nov 07, 2026 at 07:14:36AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] media: coda: unstopped DMA and job desync on timeout in
>   vdoa_stop()

Please check this issue.

Frank


> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Medium] media: coda: resource leaks in coda_open() error paths [1]
> --
>
> commit 641eafc2847290538ca328a1783a635a0c449aa1
> Author: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
>
> media: coda: Fix potential use-after-free after VDOA removal
>
> This commit reference-counts VDOA driver data across CODA consumers and
> contexts, serializes VDOA hardware operations against driver removal, and
> destroys the VDOA context if coda_open() fails.
>
> > diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
> > index be37ea568bfe5..b519cf8541ded 100644
> > --- a/drivers/media/platform/chips-media/coda/coda-common.c
> > +++ b/drivers/media/platform/chips-media/coda/coda-common.c
>
> [ ... ]
>
> > @@ -2721,6 +2719,8 @@ static int coda_open(struct file *file)
> >  err_clk_enable:
> >  	pm_runtime_put_sync(dev->dev);
> >  err_pm_get:
> > +	if (ctx->vdoa)
> > +		vdoa_context_destroy(ctx->vdoa);
> >  	v4l2_fh_del(&ctx->fh, file);
> >  	v4l2_fh_exit(&ctx->fh);
> >  err_coda_name_init:
>
> [Severity: Medium]
> This problem wasn't introduced by this patch, but does this error path
> still leak ctx->debugfs_entry and ctx->ctrls [1]?
>
> coda_open() creates ctx->debugfs_entry with debugfs_create_dir() before
> v4l2_fh_init() and initializes ctx->ctrls in coda_ctrls_setup(), but
> neither debugfs_remove() nor v4l2_ctrl_handler_free() is called during
> error unwind, leaving stale debugfs directories and leaked control handler
> memory when opening the device fails.
>
> [ ... ]
>
> > diff --git a/drivers/media/platform/chips-media/coda/imx-vdoa.c b/drivers/media/platform/chips-media/coda/imx-vdoa.c
> > index cd085c1c73f42..d9249c943dfa2 100644
> > --- a/drivers/media/platform/chips-media/coda/imx-vdoa.c
> > +++ b/drivers/media/platform/chips-media/coda/imx-vdoa.c
>
> [ ... ]
>
> > @@ -142,17 +150,43 @@ int vdoa_wait_for_completion(struct vdoa_ctx *ctx)
> >
> >  	return 0;
> >  }
> > +
> > +int vdoa_wait_for_completion(struct vdoa_ctx *ctx)
> > +{
> > +	struct vdoa_data *vdoa = ctx->vdoa;
> > +	int ret;
> > +
> > +	mutex_lock(&vdoa->lock);
> > +	ret = vdoa->removed ? -ENODEV : vdoa_wait(ctx);
> > +	mutex_unlock(&vdoa->lock);
> > +
> > +	return ret;
> > +}
> >  EXPORT_SYMBOL(vdoa_wait_for_completion);
> >
> > +static void vdoa_stop(struct vdoa_data *vdoa)
> > +{
> > +	if (!vdoa->curr_ctx)
> > +		return;
> > +
> > +	if (vdoa_wait(vdoa->curr_ctx))
> > +		writel(VDOASRR_SWRST, vdoa->regs + VDOASRR);
> > +	writel(0, vdoa->regs + VDOAIE);
> > +	synchronize_irq(vdoa->irq);
> > +	vdoa->curr_ctx = NULL;
> > +}
>
> [Severity: Medium]
> When a transfer times out in vdoa_wait(), does vdoa_wait_for_completion()
> leave DMA running while vdoa_stop() leaves submitted_job and completed_job
> permanently out of sync?
>
> When vdoa_wait_for_completion() returns -ETIMEDOUT to coda_finish_decode(),
> the caller immediately releases the internal source frame and returns
> dst_buf to videobuf2 without VDOASRR_SWRST or VDOAIE being written, so
> VDOA DMA can still write to the returned buffer.  Furthermore, because
> vdoa->curr_ctx is still set and completed_job is never updated to match
> submitted_job when resetting the hardware in vdoa_stop(), the next
> vdoa_stop() call waits another 300ms on the same timed-out transfer, and
> every subsequent job on that context sees submitted_job != completed_job
> after completion and stalls for 300ms before resetting the hardware.
>
> [1] https://sashiko.dev/#/bug/linux-28a3755d-8800-42ad-8451-7f7421db4955
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261107-0d0c29e10a-media-coda-1@mail.sdu.edu.cn?part=1
