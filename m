Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010038.outbound.protection.outlook.com [52.101.69.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFCE31F985;
	Fri,  7 Aug 2026 19:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786130433; cv=fail; b=sfGC7aVS/CcAK/guMNAOgC2xGKrDJyBiVIjQHkRAc+xB8PEQ9NZgGg2TZonkqhxcpScuIj2GHnsmQnIMwIlRlbLpbzDoqSSS13zTp/1paZlynFliwUu0CokzYV40GseEYtVoCOABQPoEg1gDLkorWYM/Nk4E2dV9OAl3/U0XHM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786130433; c=relaxed/simple;
	bh=sKzPiX9cIyPlLkYzfY/g0CsjI+uAFcb16jeCGKgGB3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kj4rUevM7QYdNBffzy6QS/5rvqpTHVUG6fxjYhy8RwkncDuIRGX4z5UsEtpzmHJxhYDvqfYZvPfMKhz1c3JhE0/jHK/BohGU0h+tnp8+jX5Qa0adVVrLsQF8gG8O/Zwgvnprn88MaEqzVib5dxHFAwPdgbQtHsLcA3MZHEsZwVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Jloag/9f reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Jloag/9f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCaeIgSTvoikxqc8Eu6Fz1vkWDn5RSSY7C8OkP4j069Uu5iI4vbjbzdpJvpVRg2OPsdBEbkPtUfAfZa6i3sTpEHWRwEsxUX3IvNS/2WHj+51733h0Y/G1t3J4bo58Xi6n3pOwhVJE497yqT6+oqA/fwVl0sHNxE7EfY/om0jBrGb6138mnhEOJYA5IYG1CqX3Dx1teEccO2nHQGV7WpBiFtiC9othoYvFVl/cJATt0uqhwNSioCZ3K4xyB1IYXG4Os8QKYB8c1YEwb1lfZEGEQrBAwmBA+r6hfXHoviumxTsuvqBLBOJyUTRN5t6N1524fQv6a0kS+aF0K77Cx0T6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cw9NiC9t/xW1/D+QyOTxaykQj+mWjUAtN7grB64rbug=;
 b=re/eC+c3pr46HZjbg94byspwZ33Y3dneM71GheGvIx/QTMg+Hhzvpqt2MMF2nw4PL65fmzMt+sfC6IKtGe9HhHmJcPTlbvJYa+Xx+GhiIW+thoswnh/qWc3NHViTrwK2NZj4CAZHHHfGeMJOmBq9EXPBtJR12NTut1oPR9FdpryKZqYquMZndzGG1oSb696yLHo0CjW8uQe1S4KQ1pKtuol6sVXBp9Xtn6DMwYwc9efw+0OvvbwhbG3EevKexd9E4SB1vo0S0jra8VZupSlW2omcGKB8l1++uKtKWZg2qbX7WPYlp8fhUu9fZ8uuNyIG1ywmfSfDwpBuGquq1K2siw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cw9NiC9t/xW1/D+QyOTxaykQj+mWjUAtN7grB64rbug=;
 b=Jloag/9fYT/aaE+W3gOUVjDc8uYWSiBUTCbV0S/Y85iWvLIiEZ58bkLHMMj0sPybyCIEXO1mhBr6uazmq375HBqlTCg9HGScTByS/ARtwp0Aeaj3ZLdlhElsykDXL7QY6Dy+T2tE/sVTHbpu6BTkTlMU1iBq7DRxZTve/pZXMiSEK0RDDHuRQxTBIG8GTJEkKCjJt32w+5rEXSZgJWAhbkW/j8pZY5pyzqTdrcZqmySw7POu4BESfOnKI4781fmwuv32swJ0UvmuVoFbpkKFs8mW+qkNkORLpQXidOYSBH+QTWRKA4eWohdfGdmuVB1TsiEj755d18pVuqK86v0MxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8410.eurprd04.prod.outlook.com (2603:10a6:10:24b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 19:20:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 19:20:28 +0000
Date: Fri, 7 Aug 2026 14:20:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: phucduc.bui@gmail.com, Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from
 optional IRQ lookup
Message-ID: <anYv8994aXbO4KU7@SMW015318>
References: <20260807065619.30604-1-phucduc.bui@gmail.com>
 <20260807070353.CC8C41F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260807070353.CC8C41F00A3A@smtp.kernel.org>
X-ClientProxiedBy: PH7P220CA0040.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: f01435ce-9749-4277-2021-08def4b8f061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|19092799006|4143699003|10067099003|11063799006|56012099006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	910Oyixy4CaVyZ/acJCvcbBLDTyqRWFokVkNuJGGZVWnWyrDJ1b6S5kEhpKQdjvWMEWvQ3XQv7TMiaxc2ZY8v/41fKfr8Nl28Dcd6NQX+C0NX2nxWV2rGn8g/Ri+uq85uS/6Tqpr8fN7HSAw0T9VrLJ1nz1iPOuGVq6kuzc1y3LbUyQHMzh/3cUfc49yLV1R7yOtmYKHvYp1mJcvySGPgSe8BX+U14CgfzzJwjiEsmY93K+4NXFRmLCP3cZQlbGyLUMqu2Z85+7MjqD4PdCV7egE0OmaWxU7G+wollbP4SqrUaF5xwpnPdHJ/qNTp3mUcKIN8CfnrRq1UItax9nFSZFMbh9d25pRowwVFsy6ZE2uuIaXwIKzObpWsm3WenJnsmQjt1n6WePPKf6mqiRKE0+FzNysbgtqbnoA1sc/r+mYoq0OtJ5lItW4fDeHWnXheJ3ONh2V5I6Efz7LAsBC+GiupfEl75RMEotzSqjGEOV/ycu9PYLiqUmEKVQoD9mlTRIIo52uTJflPTzD3WHKfQoRiV72S1kUtAoY1jNP8h7mGSRBVLJ2HdQnmdKnhpPmU3zsF2DpXeEXKR1gXeEgaICJMvf2ud9TT4G30XHVF8w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(19092799006)(4143699003)(10067099003)(11063799006)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?7ZHC8c7GCbFLiT2fJKMK2ikRWsSCLGldIoFDZNepaVqMAYytMQ0864m4q3?=
 =?iso-8859-1?Q?TfSNj+WBs2Wj3VMbugUxcfIF5VSovigWXdo9NRThuM6dn8ZpCmdkf2csff?=
 =?iso-8859-1?Q?4KHgaECVg4hDYDf66JO2YOLrd7APrDjZ4QM5axVxiH0ZA8K2MpKxXqSPIE?=
 =?iso-8859-1?Q?1ftWmhzc2hYpEvKsaJoOlg82i1tJIsLnHamD4P/0r3LJmLY7O/WhZuKkvG?=
 =?iso-8859-1?Q?MuNGH36W3qGCU3veGa16WdmNkNkPDoaR394kP/WSn85Ct3PceILqmOTTD1?=
 =?iso-8859-1?Q?Dd21cgnvrLPi7QU6s0b5CoGmexwBjA2/z8VgFMtszuw4C/ZA3tncB96iti?=
 =?iso-8859-1?Q?iq9blqulIUGvgXIODURMIysO/mMOa71Cpl9k6+oNBLY4WtwqBc1k16BlhX?=
 =?iso-8859-1?Q?oF90G4aF072+dZ3UW7wTVIJoz/22PU0+g5llNIoq9UTQZNn3RnZd2+bf9K?=
 =?iso-8859-1?Q?RrFJX7xRczd56UA2/voSAf2c9euYRURBC6uThkFbQd77xUV6cTXaJSqr31?=
 =?iso-8859-1?Q?MxkQBG0oXPnlGtMSBGTf+bk/4SOk/mDMgSn0RAsdhN8DCY4oDZa6WK76My?=
 =?iso-8859-1?Q?SdjI/LfzelQzbKp/KDoKkH2NHcJFIF+zPtI+IDPy9HUryGOrrt+6NKAfXP?=
 =?iso-8859-1?Q?5M0d8akrSd7oOsegYWHXaS4/O8jHhmnXWwYpdtUdd4Xr0jNbPjTAR0/bQZ?=
 =?iso-8859-1?Q?E5V4fDsN6+RtzMY7uD0+rzQnepY9g8lvv45Rwz4IjCqwZ1qjFZVTzdX6MF?=
 =?iso-8859-1?Q?ZALdOmscOBOg6XycMUjjxCCwfPG9AI0+vN5AGFw4eZBhLEXHGfPKZDoKjB?=
 =?iso-8859-1?Q?8ZVaRtgosHlR0ncgcyKR6TmXM1/O7UwcHVz5Ahq98a/kyGoqe70uKFA0Vd?=
 =?iso-8859-1?Q?dJ99NJo2z5wE/aczPBOTKHg02GFK53/wbPaGTNV/g7eEIgd4PvA6Mhe3Xw?=
 =?iso-8859-1?Q?dqlscXijdbHH3zhmBAYzcdQc2jlVNU04UZMSY11x1dQz5wYwXgBYAWOqFo?=
 =?iso-8859-1?Q?zcrvaV27O+Y1vK4Fx3J2j36fjPm/+0rhBaXVR0STH8vYv/WUJLoiEZVLE+?=
 =?iso-8859-1?Q?bIanCoyePESQtoFmovMulUW695ozjrbFab0M3UKhISBwfvsJxyVQBVCgc1?=
 =?iso-8859-1?Q?Vif9H1Gwn9/rV4CEeg6DVyHx50Y/9Sx0c6CeBvC4JfTVBNBVCd6O7waF+B?=
 =?iso-8859-1?Q?cqpXItcZxb4zANuRGNK02mkFprMLUSP2S/wZQz3dqklZEG5vPJp7z4ct2l?=
 =?iso-8859-1?Q?CG8lkes+BsGWfzw5huks2N+V2JwlSj+YgS9s6Nt7Pn7BTLYwWCRBLLdIgR?=
 =?iso-8859-1?Q?ufh9oARcp27CKb2rOf6qzjiEjumJTehThVtBP50NCt4ZM0oCTs+iYE4Hg6?=
 =?iso-8859-1?Q?hhmb0CP0hKuVAvMO7TShLjwbFG+5hLe94ZyMGbeREi+W1ycWgOmDx/Ff4z?=
 =?iso-8859-1?Q?peuwjO6OtbxVtoQ7rdyrUE1whYNy9P/CRpkJEgBL/fDZ9BpFooyelsKt1Z?=
 =?iso-8859-1?Q?0I4vLyFKKGWbmRwMPFyQqDxCBjUSM3HvxKDwc9NhQOuFSivVKPvOkbrypy?=
 =?iso-8859-1?Q?4mChB01YwfkNqV5SFAuqSs9dvFyiH7b6fwd1Ltgui65/jkMVTLL4pt+9oj?=
 =?iso-8859-1?Q?2iC3+ayk/oCRUnsKHqsxutRbJof4s+niH02N8EvCF8vstwGJ3oBIF4HL1l?=
 =?iso-8859-1?Q?7W6k5fnDWcnxBnNbTU5O3QQ1qYPmry8Hdn1zrGy2BKry8ec+UtFOdG1Ah5?=
 =?iso-8859-1?Q?ID4w2nEi56gh6NAy/jbvh642IoDB6ohgJ1sIyeu2eJy2xaCETY378x+h5P?=
 =?iso-8859-1?Q?312xIdbZYSyI5rlvQjD7nf0tl88jPVLuD6vYqH/vxRMRzGh09p3G?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01435ce-9749-4277-2021-08def4b8f061
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 19:20:28.1844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uL9P6hLM7TI4auk7LvwUikarimoOZDGDaKtLE7saiEjVypagwppdTGcV683/wavZiqWHAuGSGkItcMdREF1DTbEe8dVv0ioZadlr9GlQUUWb65Ff2EIpuLJtTLx8GBuJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8410

On Fri, Aug 07, 2026 at 07:03:52AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [High] The newly added error path for `platform_get_irq_optional()` bypasses `usb_phy_shutdown()`, potentially leaking the PHY initialization.
>
> Pre-existing issues:
> - [High] Pre-existing error handlers for IRQ allocation skip `usb_phy_shutdown()`, potentially leaking the initialized PHY.
> --
>
> --- Patch [1]: [PATCH v2 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from optional IRQ lookup ---
> commit 6c82c9cecd7d9e9567b9f2902520e1c741b42e44
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
> usb: chipidea: ci_hdrc_imx: Propagate errors from optional IRQ lookup
>
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
>
> Link: https://lore.kernel.org/all/20260806065254.28204-1-phucduc.bui@gmail.com/
>
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > index 56d2ba824a0b2..7387c9903e800 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -525,6 +525,10 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >  		data->supports_runtime_pm = true;
> >
> >  	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
> > +	if (data->wakeup_irq < 0 && data->wakeup_irq != -ENXIO) {
> > +		ret = data->wakeup_irq;
> > +		goto err_clk;
> > +	}
>
> [Severity: High]
> Does this jump skip the necessary cleanup for the USB PHY?
>
> If usb_phy_init() succeeded earlier in ci_hdrc_imx_probe() and
> platform_get_irq_optional() returns an error like -EPROBE_DEFER,
> jumping directly to err_clk bypasses the phy_shutdown label:
>
> ci_hdrc_imx_probe()
> ...
> phy_shutdown:
> 	if (data->override_phy_control)
> 		usb_phy_shutdown(data->phy);
> err_clk:
>
> Can this leak the initialized PHY state, regulators, or clocks, especially
> since -EPROBE_DEFER can be hit multiple times? Should this be goto
> phy_shutdown instead?


Please check this, make sense.

Frank

>
> >  	if (data->wakeup_irq > 0) {
> >  		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
> >  		if (!irq_name) {
>
> [Severity: High]
> This is a pre-existing issue, but do the error handlers for IRQ allocation
> also incorrectly skip the PHY shutdown?
>
> If devm_kasprintf() fails or if devm_request_threaded_irq() fails below:
>
> ci_hdrc_imx_probe()
> ...
> 		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
> ...
> 		if (ret)
> 			goto err_clk;
>
> The error paths jump to err_clk, missing the phy_shutdown cleanup.
> Could this lead to similar resource leaks if the USB PHY was successfully
> initialized earlier?
>
> > 			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> > 			goto err_clk;
> > 		}
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260807065619.30604-1-phucduc.bui@gmail.com?part=1
