Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011057.outbound.protection.outlook.com [52.101.65.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158AA3CAE8D
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 16:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082276; cv=fail; b=VYFQH31Eh8digbdTtGuZnea+OtRyMr2ygHye1jz+2ZvWKezp+XQfLQO2QbWVHaez8di0+HydOOwhhpn2DsFI3t/5rTC6msXal8MSnI/7TsJwBO98JriETHZc7wgIWWpEjkNjwg6lKyz1kCpI/idHVK8Yet7D654PbHPpNxFyBsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082276; c=relaxed/simple;
	bh=BSDVn6VxlR/2RPz3Bg9N5/laMYw5jwQOPA8mEEVKsyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mOKHHRx+N03AGuR8lG+fxbkREKcCU4yFBPcAAlwI28ARYnmPxmAq9gPp0uRp5frGJ8TxRfOBsNCBx4Z8br6CCCkqK2Q+t9eLMXDhrm72dI3tZ+78Z8XFNNxpIKD36o6WWLpOr/gf32Zx9J9mwhhbEKSC9YnEl547sEO5kXxfdhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=c35BiSRi reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="c35BiSRi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdCe4/MrBu0slc3isQHGuH8r/55XuVs7HR+XC6uugeSQo9n+5yMZJp/vlqfKL+LE2Uqs2vgyM7Cyn/Ys/Ue5THmufyjuF1xvLqia4a/EQTcM3A5AOdXvBxp2BeOgoEQxgA10GfrQChotLvctB2UX6JmAOe+nOFlLFb7pjTSOGMWsUNZN7MNZrhrz/GylrrDqh0Yr6MzIDZ3W2wNk+ciidZuMAmTntAc006ZI9LNOQ5smaUGCDcQ2XxAPAPuNCSlWC+5e9VL59Os8ZRKNirR6JyeV/hgoUjjbX+MrU/SRHu76gZIucfYXIH8MF5wQ3VWXVtqibEVJp7FEdizbBDC2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Uw6gxGZCET0sxRKAQztPvatGM9CI7utzQeXZtV7x4E=;
 b=sn8GIGoy8yrPP2pIOYfWvg91AF/oet95s+LzSOKWnfCmyi1xAAX57SOzOY9UxHH5brMoMmCFS+NHJ0YeVEViV8+5vRGa+5C4SHE4DLviAPfhpmefWtVh/7+DxKDC0sMALMzkYS7Sl2LRyquIoo9PgmiJLAe3/RgkcKsGbNTRXHaEr59s5yWGhF4LNfzGoC1/K2/a4r32NEk+6Os3uWYmCEfgMeHwIrKHu/Wp/DpkzXS4GCCg/PXQZdvjIANKn8LBH4Q1WI5pFvFHeOWYt0bPVWzBNjDRoM82V8ouY9EeCbd9LKK+DaFwb2FH5cjSeyEJCHTZuJ9wpkkX1iQxsZI+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Uw6gxGZCET0sxRKAQztPvatGM9CI7utzQeXZtV7x4E=;
 b=c35BiSRiV+1ZmfO+9aqm0qxYXONxmsRXElsWa76tpvi+MjEzQEA75YRAmMLEwNEsEGCAMAGug/AXb6OOOkKCtUumKZ8+fa0aeAkvevmPYanyiLI/ilqO1V48OcJEAKKnHWrNeEzONp9ScWOnviO0GFmZOUAolzZEy/Mq3qMkBPyejeRuJV7gMxhfi+Tp2kO/4KJ7LdPShWSkzkYapHeeTf9DBP825aQ/W5qChGzFOXGhq8Nss67o9mAqhGS1byBHY5uIMekLxLZSvlTAHVNmmtQ5XHXXWDGO3xPMT6G4x6SiAJfwosaGlz1qgiXz+zwa6bVN0DAUSO9nYGOsTblFtA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8944.eurprd04.prod.outlook.com (2603:10a6:102:20f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 16:37:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 16:37:41 +0000
Date: Thu, 15 Oct 2026 12:37:34 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>,
	linux-i3c@lists.infradead.org, Frank.Li@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] i3c: master: dw-i3c-master: Add HDR-DDR support to
 Designware Controller.
Message-ID: <atEBTtGLQLMtwgAS@lizhi-Precision-Tower-5810>
References: <20261013073126.5948-1-parame@synopsys.com>
 <sashiko-outbox-169200@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-169200@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8944:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a06b65-09b4-4b08-e0ce-08df2adaa1d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|56012099006|261009223027099003|11063799006|4143699003|260925022911599003|18002099003|22082099003|10067099003|6133799003|260925021911599003|260925021311599003|3023799007;
X-Microsoft-Antispam-Message-Info:
	rPIto92V7HkEQQ4YjgzgGXosfjSYSf0ORRFHTXrYDuNPfRej/QlQPfAcvdNgIeFH2t8hxmtR0HhMGIwCQ2NR+uNnwx3Gd01s8SbO/mR+GxMFWhlV0OWPXiizK9pXqS9mWJlCsYbbhaM/os9ZG9jy2UfyICf0ZgfAUjaIyRXSIWvN20Svkbd1coCe4GnxxiJzqjavfQ+LGekauw0OA3qzLe++6OgNwpnNXOlthS2clgm6oxW09orCry9flu5HT/mY1kh1QPTnPbECCXga0Yv3+wG9iRiRO8BiJBZETVTdTguuI2upAir5u+UPMp5/rX3rc0sgzpw343emqBYOnp6PrKVK6MyTlAJNPuvFWWQSL1k6HEctm2suFISqh9X6wa9omXg4hRA2CjjjVuuixgnvIelXzfOofCDz3sEkDz2dbDbapyCSsc6NncEtJ71qkkJZ7wN7UUaTZ13+/gtrnZF4UOLPKAZ7F8KVFyFEyt01xPxxBI+PvU13sEVgX0EQAhFmK9QdMOTY0RnMTa8WYJSyMO48HFgShO0B2MfWSbWTaGfyXbH3P3pzqMPAHFlvEsPBKkfwYyp0dFfbc8qedIKqd4WbCcxz16DOntbPyHJU4yc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(56012099006)(261009223027099003)(11063799006)(4143699003)(260925022911599003)(18002099003)(22082099003)(10067099003)(6133799003)(260925021911599003)(260925021311599003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?2rJ8pMYuJfNVOzDCPBgr1EQm5vPnNptBS9cQg7/cL2iGcHeAsIhV5eWaTn?=
 =?iso-8859-1?Q?MUfafOzWnByZKRMPzcWq2+BEpKAyhM4wI4uPgUuRRwlFyGPFkqhU4eQD84?=
 =?iso-8859-1?Q?Dty/lNoAdaY8cxEs4yPQS5he+Urm6nJqVtZnuTsLx9Jd4+mEElNdWDPqCA?=
 =?iso-8859-1?Q?hqKOFMPoiZ4fMd4y2UpKzKAnGauBNFeBhieXkMk+MT0mwSW/610Sz3jEkO?=
 =?iso-8859-1?Q?O8m9SQZft6zkMMrrbWKpeXLC0dYlPEp2yLxtZPPSxAcAvdJAsTQ8+y1tPi?=
 =?iso-8859-1?Q?EBbTNDfCPtn6WBeIackAXR8k+BgRIDz0Wsr40fscbB2MnMd7v0xRCSgo+C?=
 =?iso-8859-1?Q?2jLcs1eVC6JB/D6j2aLJGu7LmjhekC1tUinCV9O+eGL51U3IK7UReE6nlW?=
 =?iso-8859-1?Q?InirZ2zFinhsRBxEZpFiWV70p6QmBQymdjUq6TE2w1vRW3MtJtIsVwVnud?=
 =?iso-8859-1?Q?G19ooD1D31Iz+6+fBv5+sp49FswBuKEa9JeA3cVSsUKS8WYXKdyE4C1PLm?=
 =?iso-8859-1?Q?iEYuBKatkhB4mvn4hZOhuxkoVDgCURhwM7LrotKXLahEwB9guBh+vBCcRu?=
 =?iso-8859-1?Q?UnRvLUjHyeyttu5p/1nLuwvF+Zv8/1+quQTloDJHn4/SZfCM7+vh6fQ9Qh?=
 =?iso-8859-1?Q?vNkk5P/SrZZVOXLeSiLRpc7scFFBMMsEG9eziuRzLXRm0dcM/WAR7+upUP?=
 =?iso-8859-1?Q?0Vx5epjANJm5gZ+7efauHut5viG0TsIinXS0icEsTGc7x1TXnpvRlRf6ha?=
 =?iso-8859-1?Q?gtqxuK6LbB+syqN2QJJCUk382QCOdj3wOSF1crmg9U2+fyhqOg7SdiXOBD?=
 =?iso-8859-1?Q?IXdL1uFK0+urS7kQH7rWXlZZ2ZRlCdMHJ93avfP3Tc/+TH1DR2PRisQzC6?=
 =?iso-8859-1?Q?Y0qjk0QPR+Gk8+z1bRUpzmrPwZxNheiWUv4U5YKSzmwI1yPtmejj3Ua82i?=
 =?iso-8859-1?Q?RfaLxETrw1vjje+6jGb7vJWT0DK0RAIGknBu/5ObH/dn51sQQ5HkD6i06F?=
 =?iso-8859-1?Q?eYy7P8KkVqi/ZqVbPd1fSwm1oaeUIBEO7H0x3s02KOuLTw5+W6o3ZiBE/N?=
 =?iso-8859-1?Q?vOJrjOSGith2kg3bzaYqAM/5dN3GojEyA7o/R5zzZnBeDSmlWtASxObOM1?=
 =?iso-8859-1?Q?vqBbGlGAdSw2B5FKX7mtZIQ/8EGR7Nc1+wJ9rx5037QWtxk3ZyfrVhAvoA?=
 =?iso-8859-1?Q?g7aS+ekaN3gOUEdSgcK/mx2JMgC3KEv9QT8rbEzgWDbpyRrhfuUOoxEAzQ?=
 =?iso-8859-1?Q?bMZrGZ9NpUGO6tpQVyi6qR+eC4cr6RuAeL5pwvbgNmpVfTWfiwQoaMJhtZ?=
 =?iso-8859-1?Q?yMCGl/rhlPjWRrooa8sPf+RZBHxK2yDhuAofTEiG3F2nyxJ5RqImkgGLze?=
 =?iso-8859-1?Q?UV50xjPkeJE7/H4EaVU6/ntEe7bnKD33tLqxtzuoUDreWAtcgcbHLy93vJ?=
 =?iso-8859-1?Q?umgGStBunkRQgW6WAZXQ3RPngjk6Ir9ynHSWnIQAmpBxFEP1CySRk+cfeB?=
 =?iso-8859-1?Q?MmWVbxNOD0RiVVchzxxK2l0DfI66Q+0rt2vnxUmRyHWN0RBmTbVDjckbHv?=
 =?iso-8859-1?Q?OcYVS0xvb58GZeHSD/1MmqrZFv+z++HxVIkBLZyNJhfJo1LMF7CTNGMi74?=
 =?iso-8859-1?Q?sv2A1I4jV3h+Xfz1B93IpoeXArdogk/lFgo7qQAH6eH1ZcYF1ZvAvkg29O?=
 =?iso-8859-1?Q?lZdsuiRRRKXZ7lNPmxJfsZmv12HtkV+MQ+EiBRHFrDaV2LDGeTE4GObHZr?=
 =?iso-8859-1?Q?roC645+NHoxooRYXvY1Fq0P34Pf8bkdtom6OUtVakDO5XcHajGfdpfbDZe?=
 =?iso-8859-1?Q?K7F1vL91gIQsHuiA/e8LPtBWlea+Ot3apSKynswTsurfSQcVNZYU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a06b65-09b4-4b08-e0ce-08df2adaa1d5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 16:37:41.7887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBzDZzKB4wbLUQaDEyyBEyuSE7uidy02bkGSclr1CL/it/cZ40JwlP9PeIu8i2+jGCM/8AZR/EhMHqZ3jrAqCjZGainx2YkvPwiqln0K0fyYgw8hidUCS0sdKABaRfox
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8944

On Tue, Oct 13, 2026 at 07:42:47AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] i3c: bitwise OR without clear corrupts COMMAND_PORT_SPEED in HDR-DDR mode
> - [High] i3c: ENTHDR0 CCC redundantly applied to all transfers in a batch
> - [High] i3c: speed field corruption and ENTHDR repetition in HDR mode
> - [Medium] i3c: missing HDR-DDR capability advertisement in dw_i3c_master_bus_init()
> --

Please fix above issues.

Frank

>
> commit 9eeaabb296fe13353bcd0cb7883076567e265760
> Author: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
>
> i3c: master: dw-i3c-master: Add HDR-DDR support to Designware Controller.
>
> Implement HDR-DDR transfer support for the DesignWare Controller.
> Only support for private transfers and does not support sending CCC
> commands in HDR mode.
>
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index d1119f203d1b6..d1013204ab7b7 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> [ ... ]
> > @@ -1017,6 +1019,11 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
> >  			       COMMAND_PORT_DEV_INDEX(data->index) |
> >  			       COMMAND_PORT_ROC;
> >
> > +		if (mode == I3C_HDR_DDR)
> > +			cmd->cmd_lo |= COMMAND_PORT_CP |
> > +				COMMAND_PORT_CMD(I3C_CCC_ENTHDR(0)) |
> > +				COMMAND_PORT_SPEED(DW_I3C_HDR_DDR_SPEED);
>
> [Severity: High]
> Since cmd->cmd_lo was initialized earlier in this loop with
> COMMAND_PORT_SPEED(dev->info.max_read_ds) or max_write_ds, won't this bitwise
> OR operation merge the two speed values together without clearing the previous
> bits? This could result in corrupted speed configuration bits being sent to the
> hardware controller.
>
> [Severity: High]
> This block is inside the for loop iterating over i3c_nxfers. Will this
> cause the COMMAND_PORT_CP and I3C_CCC_ENTHDR(0) command bits to be repeatedly
> applied to every segment of a multi-message transfer, instead of just the first
> transfer? Sending the ENTHDR0 command repeatedly while already in HDR mode may
> cause protocol violations on the bus.
>
> [Severity: Medium]
> Since this patch adds HDR-DDR transfer support, should the master controller
> also advertise this new capability during bus initialization?
>
> In dw_i3c_master_bus_init(), info.hdr_cap is not updated to include
> the I3C_HDR_DDR capability:
>
> 	memset(&info, 0, sizeof(info));
> 	info.dyn_addr = ret;
>
> 	ret = i3c_master_set_info(&master->base, &info);
>
> Without setting info.hdr_cap to include I3C_CCC_HDR_MODE(I3C_HDR_DDR), won't
> the I3C core reject HDR-DDR transfers with -EOPNOTSUPP in
> i3c_dev_do_xfers_locked() before they can ever reach the newly added code in
> dw_i3c_master_i3c_xfers()?
>
> > +
> >  		if (i == (i3c_nxfers - 1))
> >  			cmd->cmd_lo |= COMMAND_PORT_TOC;
> >  	}
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261013073126.5948-1-parame@synopsys.com?part=1
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
