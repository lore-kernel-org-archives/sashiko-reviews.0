Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012046.outbound.protection.outlook.com [52.101.66.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BE7373BF6;
	Fri, 17 Jul 2026 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784305634; cv=fail; b=o3RFmYJ0InzFOTnyWiZHK4Dm6UDLGs694Z1lajMmNFkS+ljfgit8u3Ua6e1kOsXLDLNZvM6byP0HYD+uSLb0SuVYSzNzfHhxq98DistKqz0pbSP8BYRwlRXb4AkBUieCHtG9AhSL2WWg91kC+9D8GWyD4h4g+p8alEGQvrYAEg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784305634; c=relaxed/simple;
	bh=KFAECU8+30I23k2EXDfD0k6qegIIem+bAF6pnryglWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IEa639ZGpoagn8YI7WrKTdZhjQ86AiClumOa/xDj4JP4urv1RH85j0/qH2Uf1pKG9LVCK+UtUZWLZ/kEgewKQ1Xzax2vJ//X9PAMeEsB6wAZ/Z7o3y0Kb1Rc+M3XIjD8M7qTchNTYWZbkbwcIF5OUkIkPhCSNjbnIxhDEgWZ6+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=M9LRtcmn reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="M9LRtcmn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3nQqJVT9XtjTAPd9tfdnjFjuh7iZbgn//05/fmiz9Fb7w7XMy54z4Z8Lqx3eC1CzzjlzjPOFj2fzHRQOvXw8coLCpHG5yrElT50q+v7SCWQ5VAX/ZPTEW8u03mVZpa0FCvXHgxK849dCivoAMQYp61u73o1bwZyZ6FZ+MTW+05Y+EnLpFmEHXRz1zfInKTwa3HYB5oXgZngPdsoouO74UavdMMOYgIuoPnk3FT2sH0+X8t2/KIXihtgqUsoGw/H3TM47c/+FpicuPeVuavPLAYZSeQq5gjcZY1rA1PswotlgjNl75WSVKeyS3QJtwb0otduGDmQHy2yWAWA09h6Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUJSBFYt4PDyWVhD5pIUCgi4DN+aYl4lB8amKxIBYO0=;
 b=wlKw61zvafI/ErBUxXGLFK42AICawTI9OSCnJt94fRfluMpwnBgaHO0mjWCOIiit3fbONcvzH1fl7ip95sBTnqNF6KmMtIEgI8s2MSvDpCnQjyL3AW/lzllwJ8OFdBS/2elIXAlfGIeLEEk7BwwG0lExYdR2Z8TZ1WFrKHqbTswTO3Nc8nVB7/p+0ZD1kW07kjDLGKcxf2RQb2odUCsKAlpK1BFVS5BG2yI6xgQmmSXzny7nysuqGPMIglDGvbHbDKAe+ZeS8l16UaozdCQGNpabSUfOMSjyLch3pnB7Ci102nlyb0GHGxJOfiDRH1yz4R+UsHd1eWeJ4toQPToWtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUJSBFYt4PDyWVhD5pIUCgi4DN+aYl4lB8amKxIBYO0=;
 b=M9LRtcmn8XPJ9a4w8BihX2MGHgCZA9QZEKDjdL9mbWNn0kZs7uImTE8ImZHEvZbwsE7PyqYYGq8XkT8bokJRQo3wKuySAslT4S5x18WPaYN4YvZev84dnY6q5hhG7nYAEjFA1bUa5rKKFiNJ0CGsEkE5xTsKfaMABIrHU5C/d2RHY2RTCE5BWkEuetzRMNAGFMz64CKX+IT6eJa9BVa+VM+sdMvmPVJHjYOI5s1H4xOH9nuLFz5sKOWNvqEcw0tQfDodiTdp/xo1Y0CdBNp2fXqnyUYLDwU7jQLjQnGikJSQYlkACi3DauQz38pYeRlGVWBdOu7qmlwvDx8ZTRXG7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9746.eurprd04.prod.outlook.com (2603:10a6:10:4b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 16:27:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 16:27:04 +0000
Date: Fri, 17 Jul 2026 11:26:56 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: pankaj.gupta@oss.nxp.com, conor+dt@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v28 5/7] firmware: drivers: imx: adds miscdev
Message-ID: <alpX0HwyFZfxCIxV@SMW015318>
References: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
 <20260717-imx-se-if-v28-5-0a9659c7e69d@nxp.com>
 <20260717111257.260351F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717111257.260351F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA0PR11CA0008.namprd11.prod.outlook.com
 (2603:10b6:806:d3::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9746:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc5c2bd-ba5c-4ddc-68d6-08dee4203c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|6133799003|3023799007|18002099003|4143699003|22082099003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	HEp0iGfr+0XU7zRNQbG7VfACEI2Ex+yNV3Q9zpJv/gfgMGtBh7ficQx/cvlu0U0sK8FD7AJqyOHEFU6/QcPJlCeOvrAiFk8pt1ygvxii59Uvt7cPEW2KTjiFRsdxnAP3UJh2mSOyK+Zvp5dgbR01GityjtRhijn9W0erk1Hj/n8Nhd96fbv6pC+XOn8zcsmYJJK3HNl1rUE5PIWadADWV+WrwOhh3OOGtRIAqce94TEobhyjWBfaMhYL3r5oFagcV4MSsGrvye43P1jTvBqg1rV/XjDTZyYonYdOmaEJEnvwQmTrRg0JsC8TBSpXjC91u3JVtndtZBo6z9wwmkkNGV90eES9xZr5moOCiaQVgd8Xa4yoS/z0WASH0XNVXnyOGmw7aZWlbkfvp1PEoNrfnv6zDBgI/Rzb2qRyKUG5CA1GQIxV0n6YeBV/yINB/+chaq/miNX42Csi7/E+QJyOoe2OlrLbMjLJIrbpBRoAe3G+hDVTHPhXswEJ4kUFavsZy1I1cR6NPyJPnKghcjmI+wwS51pjAyFVlUyYX7iye+gZ5h4F/kPlZSRtEVgEEI3EE3MXxKX5H/TnyZlaHMROt6GP4qcCCrXfVpweawZjiLc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(6133799003)(3023799007)(18002099003)(4143699003)(22082099003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?r3YFW7MaOtc58T2zvg0aiZqkNH14B37FzeAeLqc5dtwnI6JolqPnyuxOP9?=
 =?iso-8859-1?Q?FE2w38Ey976Evg6Pt48ISgiH1PZXwi05cnKXGvmNbvABo/opQhb7UmAGvK?=
 =?iso-8859-1?Q?CnA4/qiYA5TKEMTgqlDMTPDSzYKYgGJsnduZd32dB0WevpDf6T1/uQgznD?=
 =?iso-8859-1?Q?GTySFGvurjixLpf7j1c2Feq+gOhGggwvhitw3j4q4ofG4+CuF6HDHWIIL/?=
 =?iso-8859-1?Q?zm/Vff8JBDXJFTsLrNoo8EITtwIUK8PHqhU2TWVeQCr+Ld0FmeXNLvvEkC?=
 =?iso-8859-1?Q?OKJU/Kyh5rD+MtYjAcIn/OYMvD21lH/0mRiwOp3LWJggf+ftUCwtoYea86?=
 =?iso-8859-1?Q?CH+w6GUxIjGsBe46PO1QlSuZpxfaj+OezJW9QpucW3KO9IzVkvjI9Wi3GT?=
 =?iso-8859-1?Q?tIhUkGcyGy9fD7xyd192mrQBYqD0cNfrnNmvzRIbVyB8e0n86hAWDxVIpt?=
 =?iso-8859-1?Q?Z1OiPBR0YCr20JHOYSJBQZE+PlByiR9CYRNUUt6QKejkV8QIRdcKLjm2OK?=
 =?iso-8859-1?Q?DzsWx0kzeIYWyWZ6tS3/tetBWXAZY6o/nGev6m2Bi3uwfiye2S/+9ArR87?=
 =?iso-8859-1?Q?aLlsFqI9wpdNxZdFaqe2eZGXIQFsoxSmPlDn/bJ4xK7h6Dp8VwE5iU01q5?=
 =?iso-8859-1?Q?FO433URdW1FAerw1HZv0/JhGT0ZQe1LCbEX83lg4kdH28Ivr6Wyd068sca?=
 =?iso-8859-1?Q?uv1rstqSbHXv5HM+5BMZwgIpeAqQLKtgCn3deCSlA6BUJAmmmos/iKJWWy?=
 =?iso-8859-1?Q?Zj9j7CuUGDrO6Vcola0mAAKVljn8fWgmAuZb6HO6sksTpFEquj2G1GUIa6?=
 =?iso-8859-1?Q?8cqpoT9ANbuZ4dc/XmjP98ZEhTXL25VNGsCGNt81Ag3h5TKIkULWNBIMKK?=
 =?iso-8859-1?Q?km8CurYIXKio96yPTG5GnvqAuBtZrQiJ4zekffWP7JL779o+eP2tDtg5tl?=
 =?iso-8859-1?Q?epfZdXP0HJJ+TpgoB9sUQPCSp04vMBoLnnAJESp+33uBmTfM/aQArHsLHS?=
 =?iso-8859-1?Q?o7gt4D6f82TqA8EYjBw99txorllbQlpHiskhxYRM6gLGvADGX4uTMipujR?=
 =?iso-8859-1?Q?YSH3YeCJMrYKJ+aU1SvyYCc5TykBDuwZMbtD7e22ZuAkfmUUmqL9/8ZCkr?=
 =?iso-8859-1?Q?40VJyMUfLTJh6KzfbNGQIYOHs74ZOcVEwq+F8GH9s2zL6fBNJ2hi1H59Rs?=
 =?iso-8859-1?Q?6ePNXY5I/7i/9UIiBdj7jgyAQF98Uo8eRkBHGITrjQqn/7E8Uy4D4Zu2Q2?=
 =?iso-8859-1?Q?QTKgPo/6hzTYlIHZG++LsCFJG9asgPQ6jU9XfNocb2SmfcNpFpmXo3R99K?=
 =?iso-8859-1?Q?i2T1IYeRmfYqYhTC6ShEhfiv3+yzk4S8bt6F7xSQrpB5+RXXx1arfQCO/7?=
 =?iso-8859-1?Q?lqIW4z4CZaaD/8tTlxN50IIFcTe3NeIqK96wzh5BgSRQX029nAmtVGfvyF?=
 =?iso-8859-1?Q?QwoW/ZFiqTJHGhNUBZ52O47dmptDw7jshXmps2qmFl/aqtQoYIT2Cd/M7t?=
 =?iso-8859-1?Q?R5FvhtqtRvGsJjlZdfj5AMTZ72zK1pQLFvcE2DKS0LlnwQ1Lv226RblP/H?=
 =?iso-8859-1?Q?B57srVKeOwa//i2iw3S6qfv5go7+3s7wuln5UPS+H+H6Y0/yqDwQeNL7HX?=
 =?iso-8859-1?Q?qxEqUuh1AfqPb7WGqQThHtXjf8g07rtFWOQ0LDhmhdugFD5JLcFcvd2CyN?=
 =?iso-8859-1?Q?xd614lcJsbGEFGf2Hm+7tqnPMN/UYKH4qrVY6OZNLhWIEqeyrWA70/0qGV?=
 =?iso-8859-1?Q?2MDdhd5IoEy92ml/vRHBym8K/+iusg4yzKWZBwWjHmHvubzeVH0q+OHHng?=
 =?iso-8859-1?Q?qYcjcFIrfsNFvJp8zC3wPL5v0Bg993o0EFrEZgGeGjt/Gyj+UfXU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc5c2bd-ba5c-4ddc-68d6-08dee4203c81
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 16:27:04.0619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lF9HUzzWokCHmoXMHJbq3E+aYjjNSdNWIHiVuiDT2gpqurHqSgyuwtMX1z1ZCxtDHOuTxO+5tI+hw55E0fT98VaHrX3RFc/unJBt4iVq7Jtx8NpytF+oMx2yB6DpHau8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9746

On Fri, Jul 17, 2026 at 11:12:55AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 13 potential issue(s) to consider:
>
> New issues:
> - [Critical] ele_get_info() uses an uninitialized variable for memory size and fails to check for allocation failure.
> - [High] Unconditional and lockless clearing of rx_msg_sz in se_if_fops_read causes state corruption and message loss.
> - [High] Returning -ERESTARTSYS after a successful firmware transaction causes non-idempotent commands to be re-executed and discards successful responses.
> - [High] se_if_fops_read() performs shared memory cleanup without holding the fops_lock, leading to double-free and list corruption.
> - [High] Mailbox channels are freed before the misc device is deregistered due to inverted devres ordering, allowing use-after-free on channels.
> - [High] TOCTOU race between se_if_fops_open and se_if_probe_cleanup allows a device context to escape teardown and access freed hardware resources.
> - [High] init_misc_device_context() leaks DMA memory on error paths and falsely reports success if gate allocation fails.
> - [High] The DMA coherent memory allocated for priv_dev_ctx is never freed during driver teardown.
> - [High] ele_get_info_cleanup() frees gen_pool memory immediately on timeout, allowing the firmware to corrupt reallocated memory.
> - [High] Data race and memory corruption in shared memory allocator get_shared_mem_slot() for priv_dev_ctx.
> - [High] TOCTOU race in se_if_fops_read allows dereferencing a freed rx_msg buffer.
> - [High] The misc device is registered before driver probe completes, exposing uninitialized state.
>
> Pre-existing issues:
> - [High] User IOCTL interrupted by a signal can trigger the hung-task watchdog due to an excessive 5000-second uninterruptible sleep.
> --
>
> --- Patch [5]: [PATCH v28 5/7] firmware: drivers: imx: adds miscdev ---
> commit 65c691a4b86b3b1a94b7ed63800d73fff3355b12
> Author: Pankaj Gupta <pankaj.gupta@nxp.com>
>
> firmware: drivers: imx: adds miscdev
>
> Adds the driver for communication interface to secure-enclave, enabling
> userspace applications via a character driver. It implements the ABI for
> shared memory management, command sending, and file operations.
>
> > diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
> > --- a/drivers/firmware/imx/ele_base_msg.c
> > +++ b/drivers/firmware/imx/ele_base_msg.c
> > @@ -32,6 +32,9 @@ static void ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_addr_t d
> >  				 size_t size)
> >  {
> >  	if (priv->mem_pool)
> >  		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
>
> [Severity: High]
> Does this unconditionally free the DMA buffer when priv->mem_pool is true,
> even if the firmware is still busy processing a timed-out command?
>
> If the enclave command times out, the firmware might still perform delayed
> DMA writes to this buffer. Releasing it immediately allows the memory to be
> reallocated while the hardware is still accessing it, potentially leading
> to memory corruption.

This is hard to fix.  DMA may still runnings and can't sync with cleanup
function. You can add comments here.

If timeout value is bigger enough, it is statistically impossible

>
> [ ... ]
>
> > @@ -74,9 +74,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
> >
> >  	if (priv->mem_pool) {
> >  		get_info_data = gen_pool_dma_alloc(priv->mem_pool,
> >  						   ELE_GET_INFO_BUFF_SZ,
> >  						   &get_info_addr);
> >  	} else {
>
> [Severity: Critical]
> Does this leave get_info_len uninitialized and skip checking if get_info_data
> is NULL when priv->mem_pool is true?
>
> If gen_pool_dma_alloc() fails, the code continues and calls memcpy() on a
> NULL pointer.

This need check return value.

>
> Further down, it passes the uninitialized get_info_len to
> ele_get_info_cleanup(), which would cause gen_pool_free() to corrupt the
> allocator state by freeing a random size.
>
> [ ... ]
>
> > diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> > --- a/drivers/firmware/imx/ele_common.c
> > +++ b/drivers/firmware/imx/ele_common.c
> > @@ -107,6 +107,10 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
> >  		if (wait_uninterruptible)
> >  			ret = wait_for_completion_timeout(&se_clbk_hdl->done,
> >  							  remaining_jiffies);
>
> [Severity: High]
> This is a pre-existing issue, but can this trigger the hung-task watchdog
> when a user IOCTL is interrupted by a signal?
>
> The userspace contexts are assigned a timeout of 5,000,000 ms in
> init_device_context().
>
> If wait_for_completion_interruptible_timeout() returns -ERESTARTSYS, it
> switches to wait_uninterruptible for the remainder of that 5000-second
> timeout. If the hardware does not respond, this uninterruptible sleep will
> exceed the 120-second kernel hung-task threshold and panic the system.
>
> [ ... ]
>
> > @@ -216,6 +216,8 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
> >  		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
> >  {
> [ ... ]
> > +		if (err > 0)
> > +			err = -ERESTARTSYS;
>
> [Severity: High]
> Does returning -ERESTARTSYS here discard a successful firmware response
> and cause non-idempotent commands to be re-executed?
>
> If a signal is received but the firmware transaction still completes
> successfully, the success code (bytes received) appears to be overwritten
> with -ERESTARTSYS near the end of this function.
>
> This would cause the kernel to auto-restart the IOCTL, re-executing the
> command on the hardware, which could corrupt state for operations like key
> generation or lifecycle changes.

doube check this one

>
> [ ... ]
>
> > diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
> > --- a/drivers/firmware/imx/se_ctrl.c
> > +++ b/drivers/firmware/imx/se_ctrl.c
> > @@ -487,14 +487,18 @@ static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
> >  	gate = kzalloc_obj(*gate, GFP_KERNEL);
> >  	if (!gate)
> >  		goto exit;
> >
> >  [ ... ]
> >  exit:
> >  	*new_dev_ctx = NULL;
> >  	if (gate) {
> >  		priv->open_gate = NULL;
> >  		se_if_open_gate_put(gate);
> >  	}
> >  	kfree(dev_ctx->devname);
> >  	kfree(dev_ctx);
> >  	return dev_err_probe(priv->dev, ret, "%s", err_str);
> >  }
>
> [Severity: High]
> Can this leak DMA memory and falsely report success if the gate allocation
> fails?
>
> If kzalloc_obj() for gate fails, the code jumps to the exit label where
> ret is still 0 (from the successful init_se_shared_mem() call).

Yes, need set ret = -ENOMEN

>
> The function returns 0, leading se_if_probe() to interpret it as a
> success, but the 128KB DMA buffer allocated for the shared memory is
> never cleaned up. Subsequent driver operations might then trigger a NULL
> pointer dereference since priv_dev_ctx is NULL.
>
> [ ... ]
>
> > @@ -531,10 +531,9 @@ static void se_if_priv_release(struct kref *kref)
> >  	if (priv->priv_dev_ctx) {
> >  		kfree(priv->priv_dev_ctx->devname);
> >  		kfree(priv->priv_dev_ctx);
> >  		priv->priv_dev_ctx = NULL;
> >  	}
>
> [Severity: High]
> Is the DMA coherent memory allocated for priv_dev_ctx leaked here?
>
> During probe, init_misc_device_context() allocates 128KB of DMA shared
> memory for priv_dev_ctx. When se_if_priv_release() frees the structure,
> it seems to skip calling cleanup_se_shared_mem(), permanently leaking
> this memory whenever the module is unloaded or probe fails.

most likely correct.

>
> [ ... ]
>
> > @@ -993,6 +993,8 @@ int get_shared_mem_slot(struct se_if_device_ctx *dev_ctx,
> >  	/* Allocate space in shared memory. 8 bytes aligned. */
> >  	pos = shared_mem->pos;
> >  	shared_mem->pos += aligned_len;
>
> [Severity: High]
> Can this lockless increment of shared_mem->pos cause a data race and
> memory corruption when called for the internal priv_dev_ctx?
>
> The userspace IOCTLs protect this via dev_ctx->fops_lock, but kernel
> threads calling ele_get_info() on priv->priv_dev_ctx do not acquire this
> lock.

make sense, please check it.

Anyways, it is much better than before. Please continue follow sashiko
comments.

Frank
>
> If a concurrent operation (like se_load_firmware) happens at the
> same time as ele_get_info, both threads could modify pos simultaneously,
> causing overlapping DMA memory allocations and payload corruption.
>
> [ ... ]
>
> > @@ -1180,6 +1180,9 @@ static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t size,
> >  		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
> >  			priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
> >  			se_dev_ctx_shared_mem_cleanup(dev_ctx);
> >  			return -EINVAL;
> >  		}
>
> [Severity: High]
> Does this allow unprivileged processes to locklessly corrupt the command
> receiver's state?
>
> If the calling dev_ctx is not the registered command receiver,
> rx_msg_sz is cleared without holding clbk_rx_lock. This allows any
> process capable of calling read() to disrupt the NVM daemon's state.
>
> [ ... ]
>
> > @@ -1222,6 +1222,8 @@ static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t size,
> >  	spin_unlock_irqrestore(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
> >
> >  	/* We may need to copy the output data to user before
> >  	 * delivering the completion message.
> >  	 */
> >  	err = se_dev_ctx_cpy_out_data(dev_ctx);
> >  	if (err < 0)
> >  		goto exit_mutex_unlock;
> >
> >  	/* Copy data from the buffer */
> >  	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
> >  			     priv->cmd_receiver_clbk_hdl.rx_msg,
> >  			     priv->cmd_receiver_clbk_hdl.rx_msg_sz,
> >  			     false);
> >
> >  	copy_len = min(size, priv->cmd_receiver_clbk_hdl.rx_msg_sz);
> >
> >  	if (copy_to_user(buf, priv->cmd_receiver_clbk_hdl.rx_msg, copy_len))
>
> [Severity: High]
> Can this lead to a use-after-free of the rx_msg buffer?
>
> The rx_msg pointer is validated while holding clbk_rx_lock, but the lock
> is dropped before passing rx_msg to copy_to_user().
>
> If driver unbind runs concurrently, unset_dev_ctx_as_command_receiver()
> will acquire the lock, set rx_msg to NULL, and immediately free the buffer.
> The read() path will then copy freed kernel memory to userspace.
>
> [ ... ]
>
> > @@ -1248,6 +1248,8 @@ exit_mutex_unlock:
> >  	mutex_unlock(&dev_ctx->fops_lock);
> >
> >  exit:
> >  	spin_lock_irqsave(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
> >  	priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
> >  	spin_unlock_irqrestore(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
> >  	se_dev_ctx_shared_mem_cleanup(dev_ctx);
>
> [Severity: High]
> Does this unconditionally clear rx_msg_sz and perform lockless shared memory
> cleanup on the exit path?
>
> If ele_msg_rcv() is interrupted by a signal, rx_msg_sz is cleared, which
> will permanently drop a concurrently arriving message by overwriting its
> size with 0.
>
> Additionally, se_dev_ctx_shared_mem_cleanup() modifies the pending lists
> and frees their entries without holding fops_lock. If se_if_fops_close()
> runs concurrently (e.g. process termination), it can cause list corruption
> and double-frees.
>
> [ ... ]
>
> > @@ -1282,10 +1282,11 @@ static int se_if_fops_open(struct inode *nd, struct file *fp)
> >  	priv = gate->priv;
> >  	mutex_unlock(&gate->lock);
> >
> >  	misc_dev_ctx = priv->priv_dev_ctx;
> >
> >  	if (mutex_lock_interruptible(&misc_dev_ctx->fops_lock)) {
> >  		err = -EBUSY;
> >  		goto out_put_priv;
> >  	}
> >
> >  	if (misc_dev_ctx->cleanup_done) {
> >  		err = -ENODEV;
> >  		goto out_unlock_misc;
> >  	}
> >
> >  	priv->dev_ctx_mono_count++;
> >  	err = init_device_context(priv, priv->dev_ctx_mono_count, &dev_ctx);
>
> [Severity: High]
> Is there a race condition here that allows a new context to escape teardown?
>
> By dropping gate->lock before creating and adding the new device context
> to priv->dev_ctx_list, se_if_probe_cleanup() can concurrently drain all
> existing contexts.
>
> After teardown finishes, this function will append the newly allocated
> context to the list and return a valid fd to userspace. This would allow
> userspace to access hardware resources like mailbox channels that have
> already been destroyed by devres.
>
> [ ... ]
>
> > @@ -1546,6 +1546,9 @@ static int se_if_probe(struct platform_device *pdev)
> >
> >  	ret = devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);
> >  	if (ret)
> >  		return ret;
> >
> >  	/* Mailbox client configuration */
> >  	priv->se_mb_cl.dev		= dev;
> >  	priv->se_mb_cl.tx_block		= false;
> >  	priv->se_mb_cl.knows_txdone	= false;
> >  	priv->se_mb_cl.rx_callback	= se_if_rx_callback;
> >
> >  	ret = se_if_request_channel(dev, &priv->tx_chan, &priv->se_mb_cl, MBOX_TX_NAME);
>
> [Severity: High]
> Will devres free the mailbox channels before deregistering the misc device?
>
> Because se_if_probe_cleanup is registered as a devres action before the
> mailbox channels are requested, it will run after the channels are freed
> (LIFO order).
>
> During this window, the character device is still active. If userspace
> issues a write() or IOCTL, the driver will use the freed channel pointers,
> resulting in a use-after-free.
>
> [ ... ]
>
> > @@ -1588,6 +1588,11 @@ static int se_if_probe(struct platform_device *pdev)
> >  	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_fops);
> >  	if (ret)
> >  		return dev_err_probe(dev, ret,
> >  				     "Failed[0x%x] to create device contexts.",
> >  				     ret);
> >
> >  	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
> >  		ret = get_se_soc_info(priv, se_info);
> >  		if (ret)
> >  			return dev_err_probe(dev, ret, "Failed to fetch SoC Info.");
> >  	}
> >
> >  	/* By default, there is no pending FW to be loaded.*/
> >  	if (se_info->se_fw_img_nm.seco_fw_nm_in_rfs) {
> >  		load_fw = get_load_fw_instance(priv);
> >  		mutex_init(&load_fw->load_fw_lock);
>
> [Severity: High]
> Is the misc device exposed to userspace before critical state is initialized?
>
> init_misc_device_context() registers the misc device, making it instantly
> available. However, load_fw->load_fw_lock and var_se_info.soc_rev are
> initialized later in the probe sequence.
>
> A fast userspace process could open the device and trigger
> se_load_firmware() via an IOCTL, which would attempt to lock the
> uninitialized load_fw_lock, causing a panic.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com?part=5
