Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011051.outbound.protection.outlook.com [40.107.130.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3173A453F
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782398130; cv=fail; b=PosjIUfbLRsXafvWZN1yYC+oG0/HiWZNHYW6q1McYzxhsCuBNoE1Pwy8zFCNRb7pppkQ9LVroNli3lfK52X8tdtTtdQunZdSpxIjHXZEVPEB7wyp51sdxNJqY9TbehaVWNFZb4ITkPaM+vJFqp0yoPgT40TBG5j2+hzZ/0FPZpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782398130; c=relaxed/simple;
	bh=/Zf3eUg6HBGSjqwQY7k5WllvZ9k56E5frBi/qdDD7n4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hqbthiXwnRRiXDih7BpOdIUWVvqabg16KOz5pPd5QicGMmtPHVb7tchc/Fbuv3LtCOwvncTOqfOPZwnxvOinCpsgjjFcJFu72ffMXKs3JjuRnkvGcG+tOlmrZ7f/Alzano4BDeDXLsVeMov2lH53qKsgtCyMP7N3w8VGjs4ZD1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FISktZOC reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FISktZOC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXsfKehYJepe9lJASSHdqypXuPE4Ne2jYOjOTbLubP594S/7o0PERi8GhLsrKysHA1dLHoDPayMV+IPGaEpo2jGFHJrbauQu++uJMt7cj2uytpZ15IFLZl2aTrvJimsEFgiNdg9HiEKvncMXY2b8kWCkWCu3CeS/RD8Q7AS2AbCww3FC/B1+o7AmD8Yh/IiJsz2eLSnxC7inyLxeRRlTnrpu1A524oTlNRmY/Z9Y5adEp4Wak9bG+W7pWnwrAsO3flFi9C1KqYY3gxlJ6s/X3ojy0iGXQ5tfG2+qa2DIfLmcWtD1Ay1BKAbH9axyiOc/mPnBYJydUEl/mETGAgmaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+ILdfGXj4StQfygvSbkEiAFNwtR4ekyaYtaJw7sGrI=;
 b=fGvHbPfacInT0sut/9mRtG4BEYaQr3k8tHTLaQz3W74PXU8Ds2DEo9+Stn6WiuCvwSazKPhmJgIslolmRtFnk5w3E9QCwB7G5MO+Cxol7HONuaeUGzl/4mmYdR5nzKESftCKnDbnqhluyOBcVjT/6d8Fag/4uM+ThQyhzNHD4vpvdlniaup2TnrGOIibqu6b5z06NqEWeok/qAmHBQeLA0p5sUy/H9G0p6dvypRNH6iOivWjZx69LOJHa2qfmurIL09MPiGjDhmTO3nipL0zuK+PhWZSz+VHcX29N/cRGY95taauD+MpE6JCbHRLfK1iBzrJvUghNIocCQ3H2oC8Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+ILdfGXj4StQfygvSbkEiAFNwtR4ekyaYtaJw7sGrI=;
 b=FISktZOCPBThcySB3DF5gL+CNvbXlx8Ggg7wPidBPpeGpw3M21Iw+vE7kNNQn4KDnEz3uVc4ZWZHCFnpwXHjtzk6TVw2lrnwiYnXVMei+ImqItJCMsJknKEfV7G19TI4ml4HDCnPZlvu6wGPBrweGtg8J5O3m0NmiPVscbybI9oT/b76Bi3B7dhohzEHbYoBFvBvnpS4lwECRZu7UY0aypGWuLc04qO1IUWIxPItieVRDLkTIdC5UhzFKV7uYXz76XBOJbVKibYXkBCRV8jE7zvYq1AIXPiRvKwYG8Ia+OqKmZYaH0NWQHNx+uosRy7vFcNmCI0n+SloT004cUTSJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7291.eurprd04.prod.outlook.com (2603:10a6:102:8c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Thu, 25 Jun
 2026 14:35:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 14:35:25 +0000
Date: Thu, 25 Jun 2026 10:35:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, linux-i3c@lists.infradead.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH] i3c: master: renesas: reset xfer status before each wait
Message-ID: <aj08pyM2TCahO6a_@lizhi-Precision-Tower-5810>
References: <20260625030357.87402-1-pengpeng@iscas.ac.cn>
 <20260625032059.14A3D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260625032059.14A3D1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA1P222CA0051.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: d223688e-52f6-4d2b-85f0-08ded2c6ff0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|23010399003|11063799006|6133799003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RbuhqiflM/KErfPcdYKi1RVY954SyOgpkk5CK1z9lA/88bn8GtvL3Dbox7k8JG55cFLvsEe9x9lA/3+S0GKrDXuT3ZDrbOAlX3KFD9pbyR3F1jC+CSaohsRMKCYk7kRThFaKP6m4jCuCtei2HzrHvnac/FzBHWNHRxmj43N7wepAGoWdhMSz50JI9psx8q4qjetZ/VKa+wvGLzGnklc8xYUivFZtIE87WA4kqD3UQO6w0RkbDlXwcSVJVC8ViSKrH8INox9bl3tklDKAf/iPNKEz18lVmZrtCIzg6JKq3Mn7jsIVc77h9dey+bsnTLMorCz0pLrYHQq7LFpG4uBcmKjIdRaVgFGH44uOmB/U08/g/rJNS/x6iJGo/EchtrpSUb/BtngirZdGK2zq7Ypmkzf5qAcXjsLcxE4VxS8uCQ1/kdA0PNNkRk/B07tDzu8V7EosbDZeZ4TjOVmtaP05vd80TyGCxD9oBaS2lRkySNCJNJw3rYPkhXaiq1ZEZtwPm1tY/bnVoSuZ6ujLUhLaeKRte9r25Ww9kN/inPo4o6WCh9fFsvzqa+PhO6nXYwZUEJPWff/ZAovPFj5w2C0iv+VtAVTXXEI6M2HJzziKR0c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(23010399003)(11063799006)(6133799003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?5lc1r1T30bzaK0zVBfZ7VKwN2jlmj4+bODGRoWtWAlLZhah7yutujHFRq0?=
 =?iso-8859-1?Q?f4H5PCHfCSyBPXptnnQA/FZ1n2w+r34eKMbpd385bJcY4jzMTg36rEkn2l?=
 =?iso-8859-1?Q?HMlILvghx3fn8hmqC2iWQt7fbIv5yFc4CbQBigkDozB5Ti+7if/I7VKyBs?=
 =?iso-8859-1?Q?xwrrf5PpjtVRGnaS1XYAzCZ5DlqLLSk6hVvZpidYFkAc/Q5FiVJtC4Tps4?=
 =?iso-8859-1?Q?iTOm4j+GaOi4n67ls04uizRim31rjXLyTYKcfU8ObQjP9PGJiMeNJeNE1o?=
 =?iso-8859-1?Q?vfpyv6LdPlPDiKF/ujN6oH8v6MkaKW1fLrgnPnn+u2L4GNcu2DyViiuu2l?=
 =?iso-8859-1?Q?3cdwXTGjU2o98d6SJ6r2WBAHD1zUEH3xw9tAe/L7HKKwgRvnw6Rg3jOZTL?=
 =?iso-8859-1?Q?p7w6bHoM519F8zgxa2kx41ZoiaBt/4UbWflJu7Z39vdwWhBMDaCgS9mcPQ?=
 =?iso-8859-1?Q?LlwEmXHYiDoRCR/9wjBlVGHiM/QOkQOZL1vtZlEBW/QoyIhtmGNyJkQv8A?=
 =?iso-8859-1?Q?n6M94QU5H6NQtn+xXz/fi2lDilR6OXZmsfCLODJspzdujPlDwzxOabgyud?=
 =?iso-8859-1?Q?a2JjXM3awKZahva6l7qr6WBUa98llNJZV7z/LJkZa4iRzOp2MHb+Wgauor?=
 =?iso-8859-1?Q?cJ12vu9/wPYUPXlTTC5b0eJhZogK3d1rtm9oZuyTr/ZIHF4fRBquUtFvev?=
 =?iso-8859-1?Q?1yuUMqoVcxrzjt16CsrPO19dKiKpHmw/unZdgkLfvyjyDhi6PClvhJlVf2?=
 =?iso-8859-1?Q?BA695iVXzTxrMZEnTKFwEE+b1LkTPAhY0tSiOBTFNxET3cnMHiYmofyvQR?=
 =?iso-8859-1?Q?1oZOWo2TM7P0T7OR1Y2J6THTvmXXQqDiB9f6Lz6nKoqMNmrxgv0/HHdxWk?=
 =?iso-8859-1?Q?RhFNrAJy7sD9weiCiJ1hqfOp1LFMKMflfDaLTsthnLb1AkFsGEYnKnlhIa?=
 =?iso-8859-1?Q?J9/Pxlj/usMnt5LED4vGbiYd87LanK151ujA3nJamd26OON/8Blyvqmmkq?=
 =?iso-8859-1?Q?ecM2sCQPUk8EaICCUeL6YLNFkH2XKVt/jXYJpYdGegjxtud/spQGS0sW+Q?=
 =?iso-8859-1?Q?xt80KbJUFZWf5iI5bbWcj6ShiRapHFRSxPWLjAxtqIfX2He1GGoBpTNtrd?=
 =?iso-8859-1?Q?knEC29499B8thi7p/jcmjo31+Z77iVlN0XruQgXEBLjRc5KsAxP0+KqTku?=
 =?iso-8859-1?Q?K0/+c+bQeMKG8JKOSX8T1GD7y3xOKW4+2MYRaFtg+sqw0DraQdw9D2Bsl3?=
 =?iso-8859-1?Q?JN8S4wLU9tZ7R4aTAAoelyzsKaCogQYRr3QZQRFq3Q3BIVyQ+e6mKRcRmE?=
 =?iso-8859-1?Q?0NYdOscVRjw9IEJMydILFaXtMK3DC4+RtWbhOCyzdwDgnW8Jsn0alLhiy5?=
 =?iso-8859-1?Q?DSk85daLywZ7MGUdAp91EFw0UqILD2HW1n4oRtkNoWFhQYgoN50qxhz7Gr?=
 =?iso-8859-1?Q?Fd+5wLK0hNHjVvF/SWqHgCWgHZ1LnPWyu76tmcgEoxFziC8gqp1ecMMgJg?=
 =?iso-8859-1?Q?qE7S9mJnhwlqq5CQwtjtxIXlmRCt30NE6ZcLtBl1bbk7t3BukVo77sRw2X?=
 =?iso-8859-1?Q?UxcRer22qJixrm3DASJhbTmUpxZ9TfYz6V1+vhX3H9ZZVhPKRBqPOBZLDq?=
 =?iso-8859-1?Q?0IUPyxCLVO0uJQmmHf2pdRfJNBFjFvt0x+tsr+OQQuvZ5f83pE/KWyk2lV?=
 =?iso-8859-1?Q?Q0w2XkYUIIPgOWHisWWjIN0r0nxiXxY8XPeBJfKZtSuz5dNIhUTjSvPhIC?=
 =?iso-8859-1?Q?GnRK18lVkh03A2PqckcF3jmTayjnidUtnJN0LbN8SKc+q3xTTe2ZNhCOqY?=
 =?iso-8859-1?Q?/0IVWicnPjGx0njJVFRqSeGlO1rfvj8XwMUSRg6gEF6zynWGU3n+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d223688e-52f6-4d2b-85f0-08ded2c6ff0a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 14:35:25.9009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YggdETY19v03wLs/yuaHcJp0lwK4mmt4Qz3534p0PGhMcx2SnDkboHL+9kgJIQ4ZdiieEoF4IGrP4j2GDeEd/Kl6oULkVKLk47EZYQrELv33GQOyN8iXgzVQZjizQdt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7291

On Thu, Jun 25, 2026 at 03:20:58AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>
> Pre-existing issues:
> - [Critical] Buffer Overflow and Data Corruption in Transfer Interrupt Handlers.
> - [High] Missing Hardware Teardown on Timeout causing Use-After-Free and NULL Pointer Dereference.
> - [High] Ignored transfer timeout leads to Hardware State Desync and silent failures.
> - [High] Unvalidated hardware response length causes Integer Underflow and Undefined Behavior in GENMASK.
> --
>
> commit 1827d9b795e70cd1f909f688b702f06c732c89e1
> Author: Pengpeng Hou <pengpeng@iscas.ac.cn>
>
> i3c: master: renesas: reset xfer status before each wait
>
> renesas_i3c_wait_xfer() reinitializes the completion before queuing a
> transfer, but it leaves xfer->ret unchanged. After one transfer completes
> successfully, a later timeout can therefore reuse the old zero status.
>
> Reset xfer->ret to -ETIMEDOUT before each wait, return the transfer
> status from the wait helper, and propagate it from DAA, CCC and private
> I3C transfers.
>
> > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > index f39c449922ca2..7f123cd72cdf3 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -433,15 +433,18 @@ static void renesas_i3c_enqueue_xfer(struct renesas_i3c *i3c, struct renesas_i3c
> [ ... ]
> > -static void renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
> > +static int renesas_i3c_wait_xfer(struct renesas_i3c *i3c, struct renesas_i3c_xfer *xfer)
> >  {
> >  	unsigned long time_left;
> >
> > +	xfer->ret = -ETIMEDOUT;
> >  	renesas_i3c_enqueue_xfer(i3c, xfer);
> >
> >  	time_left = wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000));
> >  	if (!time_left)
> >  		renesas_i3c_dequeue_xfer(i3c, xfer);
> > +
> > +	return xfer->ret;
> >  }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does this timeout path safely
> abort the active hardware operation?
>
> If a timeout occurs, the driver removes the transfer from the queue via
> renesas_i3c_dequeue_xfer() but does not appear to halt the hardware DMA or
> interrupt execution.
>
> If the caller then frees the xfer struct, and the hardware later completes the
> operation, could the delayed interrupt in renesas_i3c_resp_isr() dereference
> a freed or unrelated transfer?

This is one problem, although it is less possibility. suggest fix later,
you may reduce timeout value and add some debug message isr, this problem
should be triggered.

Frank

>
> drivers/i3c/master/renesas-i3c.c:renesas_i3c_resp_isr() {
>     ...
>     xfer = i3c->xferqueue.cur;
>     cmd = xfer->cmds;
>     ...
> }
>
> [ ... ]
> > @@ -687,7 +690,9 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
> >  		    NCMDQP_CMD(I3C_CCC_ENTDAA) | NCMDQP_DEV_INDEX(ret) |
> >  		    NCMDQP_DEV_COUNT(i3c->maxdevs - ret) | NCMDQP_TOC;
> >
> > -	renesas_i3c_wait_xfer(i3c, xfer);
> > +	ret = renesas_i3c_wait_xfer(i3c, xfer);
> > +	if (ret)
> > +		return ret;
> >
> >  	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
>
> [Severity: High]
> This is a pre-existing issue, but does this calculation handle the case where
> no devices are attached?
>
> If no devices respond during Dynamic Address Assignment, cmd->rx_count will
> equal i3c->maxdevs. This would cause the subtraction to evaluate to -1,
> leading to undefined behavior in the GENMASK macro.
>
> Could this result in newdevs evaluating to all 1s and incorrectly registering
> empty slots as real devices?
>
> [ ... ]
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does renesas_i3c_i2c_xfers()
> properly handle transfer timeouts?
>
> When wait_for_completion_timeout() times out, it does not set cmd->err. The
> loop then checks if (cmd->err) and proceeds to the next message:
>
> drivers/i3c/master/renesas-i3c.c:renesas_i3c_i2c_xfers() {
>     ...
>     wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
>
>     if (cmd->err)
>         break;
>     ...
> }
>
> Could this ignore the timeout, incorrectly return success, and allow a delayed
> hardware operation to corrupt the buffer of the subsequent message?
>
> [Severity: Critical]
> This is a pre-existing issue, but do the interrupt handlers correctly manage
> buffer lengths and offsets for transfers?
>
> In renesas_i3c_rx_isr(), the byte count is rounded up to the nearest 32-bit
> word, which can write past the actual buffer length for unaligned transfers:
>
> drivers/i3c/master/renesas-i3c.c:renesas_i3c_rx_isr() {
>     ...
>     read_bytes = NDBSTLV0_RDBLV(renesas_readl(i3c->regs, NDBSTLV0)) * sizeof(u32);
>     i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, read_bytes);
>     ...
> }
>
> Additionally, the transmit ISR writes the entire transfer length without tracking
> bytes already sent, which might overflow the hardware FIFO:
>
> drivers/i3c/master/renesas-i3c.c:renesas_i3c_tx_isr() {
>     ...
>     i3c_writel_fifo(i3c->regs + NTDTBP0, cmd->tx_buf, cmd->len);
>     ...
> }
>
> Finally, the response ISR reads the remaining bytes into the start of the
> buffer, potentially overwriting data previously received by the rx_isr:
>
> drivers/i3c/master/renesas-i3c.c:renesas_i3c_resp_isr() {
>     ...
>     bytes_remaining = data_len - cmd->rx_count;
>     i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, bytes_remaining);
>     ...
> }
>
> Could this lead to memory corruption and out-of-bounds writes?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260625030357.87402-1-pengpeng@iscas.ac.cn?part=1
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
