Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047FA34CCE;
	Thu,  8 Oct 2026 19:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487950; cv=fail; b=P+464iJnGztEpbWGhaqEQOspketFJamsAUHPcVP0xHUB7SuacpyRQc6SyxsC3wiYv0IBK4yS2u84rIxNooZk/BsYIqECj4Boc6Uoqu4Cqg0ldazSRuhVHT2jv/ODQlc7AGOmR2eBHVfo+h2xtCkx6AWtCkwAw8/pIvycKBXNnZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487950; c=relaxed/simple;
	bh=5sW1D05Vr1ek2MxaIydav876yP9GGK8x9jM6B4ft8aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y9o2TrDnNkSU8IaarUbd2+mof5UFgkmTmSJ+QINAjze81b6HYS12BmdmT0DYaeky4AoVP/mdIvvpjkDjcbNU2v/ziQ9Ic0qyK3QfdxsbT+zRYTUiYe24K8O6U0zIgT2J4KmND0QMWmLIOBEb04vMkoFpmKOH119uJPrhH/tPKCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KdbLcwua reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KdbLcwua"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i44huUMgxOfsjztQmDJ73ia0oQe+sErFOk+HUUpZ0apG1ePh86vdv/YhLchXjmqU6hdvdIimsEN4jDSgFwvjuRhBaxSF9qVBsvG2b/BOPDvVn7RsoSpoxohfjPLQMLk0bj/JdTUfYePfGG+v1hMjshzTJx5V4sepdziLUXcQSzgGy6YGiqAESdUZsxS0F0NArTvf1E4pUjXbUJQPE63eMq+j3l1y70ORoqe0qukOPupIecPSews+Kk4hiTAD/ROJPNpAHtPryRKFPynzf+DEb8rAZXmYNBbX7HtQtkdZkUUVFdVmGU5Ssdd8Sd5w2F3n0QJRTuVEk6s8IlJ1fOtk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIstETZbrqTSezwJvtV1DBETJfL41LVnw5sOoPWregA=;
 b=h8xVW7DKIv4N2jCNr95RPoWBCEz10iyut9HNKyWljbutj9MjqYt0FuRIrckHpOZ4qwD2jkBmI+LsQvj3WkQkKdDLILSvysFG34Rr7totBpXGRZ8x1BcY2F+rIexFlWx9aU4qarIdgVBXFRipKV3tAXcjkkjAuAChMDyaWaKdlzCgM9KnKEXeCy9PgFDxkv3T+TShSB9cwAYlK9wOGI5AhkFL288rFnWi86gLcsqKJn9fsDx8x8p7XEGp8IrsWVGAbuzf/jrwZ9m5TSV3zZ2Xi/bOia7fY/lUto2Ua0qq5AnUNFT7uInilk3fcRf1p5siGvazJqLg/95SM5+R4rpvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIstETZbrqTSezwJvtV1DBETJfL41LVnw5sOoPWregA=;
 b=KdbLcwuaWYGsRG/5+j5NbHQ3TFj2l7Oh8pDBueV0JAqDTbtc9MJvKjRinYLFEw3QsDuVLh/aiCki3k735q6DUsccjIX9pupIkQVmpR+TseqXm4nlu2S9b+x5MIAud9q/+SQzF/ghDcQcAGxDkgDVgsZLXPieRTEUPGbzr6JbnbE9g/pQe7iLTl5JBkJSuMxv3tzGMbW6lK2A+YKJz4p6l3b15oP9HzCmgab/Zf1jlRTwkemYp68o4XmeirgNz0YSDwxmNvMubPPTyPIgu1zthsRCroIrOwwbn21sn7ap5i1IxSmJjTbIfSNyOvhIX7vACdW7EJSLM+bVSsf9j6abSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB12340.eurprd04.prod.outlook.com (2603:10a6:150:308::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:32:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:32:23 +0000
Date: Thu, 8 Oct 2026 14:32:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Haotian Zhang <vulab@iscas.ac.cn>, imx@lists.linux.dev,
	Frank.Li@kernel.org
Subject: Re: [PATCH] clocksource/drivers/timer-imx-gpt: fix resource leak on
 init error paths
Message-ID: <asfvw0AxvC88ZGeO@SMW015318>
References: <20261008173604.2733975-1-vulab@iscas.ac.cn>
 <sashiko-outbox-164434@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-164434@kernel.org>
X-ClientProxiedBy: AS4P192CA0008.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB12340:EE_
X-MS-Office365-Filtering-Correlation-Id: a20d6c39-4a99-40b1-c16b-08df2572e033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|19092799006|1800799024|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	k4RMVZxrDEUfbsUBZGMW0jyZvyUPoUuxRbrwOWRSfIA3+tVdYTPUcGAXxqO+M1cEQHhpComgMM68exmXT89Hc+TWbk0UnjbtHX13jg4Eljvp9AuVMm4DyvP/FXusmZ/UViHvVL3ul2Kl89FdYS5ix5nMKJgK4KSaP12L7+g73d6sJIWmJWhEbWyhVKQfrRL55vRhzCOwRMNwbYvVpDunskNmJokAF+Zj/Xm1UUrm6fQbQgAaljLoMNnSUzqq3Qj5ZXCM7w480U3JvIDIxURGXOgpuh4TNqGAwbOEuVC6KGZUqhElGpfy+YuDI7d7SzsQdb8SvGBs7wqSmf3UV4aejocbRwpgzg0VjORqz/nXRg4OnF/GOb9ab4zmiFWzLAon2jeBI9mfuUGc3Z55MarsMB4wQRwjALNj7oZ22SIOQez5pAlSeKIbkXYGCuM08PDEx3AehH52l1UDdgMTnZDGUY6i0ud9/g0bazThLAZ8ZVENT8SOKrVsKiYnW4XxWMOT++nO4a4z401yh84fEPBz3P87jQORt7WBLKcaG1rjWydSs7J1FeNkEoh3W3AIxA5RohjWa7mxIb/XSo49VGGoc6LDQ3w6exbzutcz6ANsKSs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(19092799006)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?cN/SPAtIiH2rNgO5oKnFggmaijgkbYmA67pptOAfk60/vl7z9qLUyNhhjP?=
 =?iso-8859-1?Q?Z+/AJkPSYxCoTdzW++Dk7F7mDu3jnrc8Z/rMBExmGfFHAFnfmojkH74LNT?=
 =?iso-8859-1?Q?e+myOL2JnzBcphWW+0MHDjcpRHAXZEKQU6pRpQeTtSBJgAlsOS7x3DT/Q6?=
 =?iso-8859-1?Q?QQzp2MhfbNSx1nrdf94qIpgAn3+HDxT7YabW+AnlWXwzFCMS8qNC7B6thN?=
 =?iso-8859-1?Q?CtUTj3NyVxp40fc4ZLxqTMR5WAbgk+7mL9sswoQi1w2BR/ctg9Ie9VnGB1?=
 =?iso-8859-1?Q?KPfGAtCM81perIDpwB4AvsXY4ndhMFpecFenglIsH3zuk8McTT1WB7JtHD?=
 =?iso-8859-1?Q?2xjIQpZewSbArH7WS1kDDkOeuIdXeCIuqx8kaH+JmB4FsxANenJAtYIX5W?=
 =?iso-8859-1?Q?guFgalS5MzbcxeKTfD8Kk1Lb+zwCSRJbPEeIm1glxu9ufFyHRXJjG6/V5O?=
 =?iso-8859-1?Q?bMpCAKxV09UabFW7coR7lB2NPGUZkE7qUGwwS8+yHYWZDxGHq4N1TgSIqV?=
 =?iso-8859-1?Q?8ZZ7iix/rrok+Qu7i551xifjaNaPjkyKA0wpsStTmUZ3hk/XxOgKWjeOJy?=
 =?iso-8859-1?Q?bDcHVHriL1BD/CI2PjU3GwcWvHOiaS8PcrLYJS09Fxf0IHUxry+55u1+4e?=
 =?iso-8859-1?Q?4OsFNZ2ScyNcvfdUVy7+JULYBgFEgQ51N06cCt5u+lxq5bQHXhM4gf/Qpz?=
 =?iso-8859-1?Q?duVmPTsK9hc7V2MrBZcIGOQ9j6XrTSxjsgCBVFli99ClyZVqKUWnOgQScc?=
 =?iso-8859-1?Q?JaxN+X7NRXh0ORwOGgfTPUIdEwOC5ynLY1ExHNJe6QhX6resWGC5LQ8C8A?=
 =?iso-8859-1?Q?muMzZBqLZLINUYiGSOsHBEDvOHDV8NrU5cr4tkcEIuwKtpSBYhT67jQj76?=
 =?iso-8859-1?Q?Gp/S2z9WGrFx7v4khJki+uv7rGVyoi+YxZJ9an5xgBuo4d/h76EoxxNxpn?=
 =?iso-8859-1?Q?fmFw4YgYmMsfJqYDDuZrH0RJU198LXnfXijNjW33nysoZDZ96ygNfdULU9?=
 =?iso-8859-1?Q?/lU2nShLD18QwXDk1ykv9bhjf1DX+KXMK0H3FSpheJ/+ZT75sgYmGP/2LL?=
 =?iso-8859-1?Q?Qtueuv6P4xSnp8U5bblpb2Y3QR5THaLDD1M1IPmnu8jQiKHfGiMJ2gxQjA?=
 =?iso-8859-1?Q?mrYxZKkZkuwmimK3KTt4BslR37S/Hk/ATUfWqB9QAASKL2awO+CFPKTYu+?=
 =?iso-8859-1?Q?OBadyefo/T/QpgWD9R23yuodyug4JUXpZ4nBI09T9MdDjz1AU3T/eKY5s+?=
 =?iso-8859-1?Q?VlSCpvMZFflkAh6NylKIsFpEvl/16immTpM2Z9TMPLzDPliTDdGxzzEYUw?=
 =?iso-8859-1?Q?bdFxRsAtvTezmyPf0w37Czhheh7YFdm03N1RHkLDo2yUcASQhyfKJTpy0i?=
 =?iso-8859-1?Q?fzkQgy96Sv79jfDTvdxlZVhFkUgMhhthmT0Wt8OWiYfib/nDMRq1qtUCTX?=
 =?iso-8859-1?Q?ZIqKeIRbZRpp/3BUSdzBgV8Aq6ZbwHTib6ACo7ynp0mGqmftvPORhEIl/f?=
 =?iso-8859-1?Q?/pZ7KJWsGDPV2Yh1i+fMG3kulyWB8OAU3wKpECLFdI1jDcove019wfYAKU?=
 =?iso-8859-1?Q?iPEps2y89efn98TtgzrtW5dHD4nd0D2+wJs8tCfsxj7jDmboB013xTGGBH?=
 =?iso-8859-1?Q?v5UsFx9ppG3yH1MiawKtaNd7nsWNUZffTHwcqmUADQDV3geWTWZmUDLH5A?=
 =?iso-8859-1?Q?X37iIZnvJAoxtCJAhDkPb5qftcs/WuSAAJxfi+RVyhWJVazaNloPCAr6r7?=
 =?iso-8859-1?Q?yzhGWMsct1NQ/4Lbr2/0Gy+17hNOjOOH+JeRwVzY02KR681ogxSig0WC8G?=
 =?iso-8859-1?Q?Lgcv+XIDpquJ+0do7SwWiLarFXHLBhw=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a20d6c39-4a99-40b1-c16b-08df2572e033
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:32:23.0008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtokExCcobZ8PS1dq9Jp9+fygYZrgH7eRjjhCAnHykTVEJ78RFMPNzBtT13hhpLTmQnE2Y+ZtH6AATjVFoMBMcuiVY4N10bVp3ukvPhhYoT8tTMHURsmMWWB2xqe6nva
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12340

On Thu, Oct 08, 2026 at 05:45:17PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] clocksource: Use-After-Unmap of timer base by sched_clock on init error
> - [Medium] clocksource: missing irq_dispose_mapping on init error path
> --

Look like this is real problem, please check it.

Frank

>
> commit e37f50884f58329bb1905901be3a80315d582d01
> Author: Haotian Zhang <vulab@iscas.ac.cn>
>
> clocksource/drivers/timer-imx-gpt: fix resource leak on init error paths
>
> mxc_timer_init_dt() maps the timer registers with of_iomap() and obtains
> the ipg and per clocks with of_clk_get_by_name(), but every error path
> jumps to err_kfree, which only frees the imx_timer structure.  The
> ioremap'd mapping and the clock references are therefore leaked when
> irq_of_parse_and_map() or _mxc_timer_init() fails.
>
> Unmap the I/O region and release the clocks on those error paths.
>
> > diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
> > index 8335bd7f8c6ce..b8005054b30ae 100644
> > --- a/drivers/clocksource/timer-imx-gpt.c
> > +++ b/drivers/clocksource/timer-imx-gpt.c
> > @@ -441,7 +441,7 @@ static int __init mxc_timer_init_dt(struct device_node *np,  enum imx_gpt_type t
> >  	imxtm->irq = irq_of_parse_and_map(np, 0);
> >  	if (imxtm->irq <= 0) {
> >  		ret = -EINVAL;
> > -		goto err_kfree;
> > +		goto err_unmap;
> >  	}
> >
> >  	imxtm->clk_ipg = of_clk_get_by_name(np, "ipg");
> > @@ -455,12 +455,19 @@ static int __init mxc_timer_init_dt(struct device_node *np,  enum imx_gpt_type t
> >
> >  	ret = _mxc_timer_init(imxtm);
> >  	if (ret)
> > -		goto err_kfree;
> > +		goto err_clk_put;
> >
> >  	initialized = 1;
> >
> >  	return 0;
> >
> > +err_clk_put:
> > +	if (!IS_ERR_OR_NULL(imxtm->clk_per))
> > +		clk_put(imxtm->clk_per);
> > +	if (!IS_ERR_OR_NULL(imxtm->clk_ipg))
> > +		clk_put(imxtm->clk_ipg);
>
> [Severity: Medium]
> Does this error path in mxc_timer_init_dt() leak the IRQ mapping allocated
> earlier by irq_of_parse_and_map()?
>
> If _mxc_timer_init() fails, the code jumps here to clean up the clocks and
> the ioremap, but it does not call irq_dispose_mapping(imxtm->irq) to clean
> up the IRQ mapping.
>
> > +err_unmap:
> > +	iounmap(imxtm->base);
>
> [Severity: High]
> Can this unmap in mxc_timer_init_dt() cause a fatal use-after-unmap page
> fault in the core kernel?
>
> If _mxc_timer_init() fails late in its execution, it might return an error
> after mxc_clocksource_init() has already run successfully. For example:
>
> drivers/clocksource/timer-imx-gpt.c:_mxc_timer_init()
>     ret = mxc_clocksource_init(imxtm);
>     if (ret)
>         return ret;
>     return mxc_clockevent_init(imxtm);
>
> If mxc_clockevent_init() returns an error, mxc_clocksource_init() has
> already called sched_clock_register() and registered the clocksource using
> imxtm->base. Since there are no APIs to unregister the sched_clock or
> clocksource, they will continue to access this memory from hot paths like
> timekeeping. Unmapping it here leaves those subsystems reading from freed
> memory.
>
> >  err_kfree:
> >  	kfree(imxtm);
> >  	return ret;
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261008173604.2733975-1-vulab@iscas.ac.cn?part=1
