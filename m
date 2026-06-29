Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010013.outbound.protection.outlook.com [52.101.84.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335A81D7E5C;
	Mon, 29 Jun 2026 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743444; cv=fail; b=VMxzOGucC4rJ99Q95QsC+xcAQVw6i68mpQ8z5xanpEveYRXeeS1GsFTyTHYP/HUbfIfVUOWsKDbT8AEGeFK16P464+U/SNnv7Q2LmGeoNXLeCEqIgd/COPWl8TMFVfVPreY6EQcXayGdeCu31nDKfOWM1Vk7nn/HpQR82vScokI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743444; c=relaxed/simple;
	bh=fVgdxFn0YBeomHkdPjFu3vV9Gs4Jkg2Qc611+sF/Xt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Zu3rg3hghDMH2ZDxOkMaA/18vRCJR4Kcun0Moi2TDEcfXPSHiTSgpZ3L+eXUD46zmX2wRLvSZnTmvru8jmkT9Du6iGgAGSuROHeQo9PlKHvZLCGyKkojulwHahAGh+/OlD0DCenGCeDSleLRhOly4aaQdXfi+k5DZeEpx52BNYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PZcCd88O reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PZcCd88O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCGnzcB3TKiAfV0CZxiP9OlKs6Pjo0LgKO46vW1VwB1zMff2jx4BFnHwc0MdVlDnrQ3ubZ3x8tXQaMimkmMBVcRuzb3I2csgnK+0qycj49iufl9GrYEaW8sNH3KShNfr+JJ+DFy6Bsh9IutKZAmXI0oef+K3kwLqAA/JRBdgdEXKbpmD9zOvbQjuU0sYqR5AT8EIhyxLN2cFroUCsxTbWdzR68fbiRv8StPnACpZ45qqgbu5P+rBvMQQO5AClOCZ0twP6fZmKS8pQ9YDQQskw3FREMWuOexvH8wetpDE/HKubwfX84q6ZCev/F0vRJucmbynp4FrGjJiNzlH3fpP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoV3+QK1nLfqnNMx5Py0Iz58W8XVBEFuh0CZpsOTLVs=;
 b=DtZOme6Wdecvz+HUSS//qk49i92bYN/O85a8iraofWLA9W+l2RfnBUYz9uirB8cUkkyMybsdWXYmZBJI+Vo8gWpVGq3n+u8sQxP8d30pRN6WT9ultj0iQmRiPzdcj0s0IkWMx9v3w/6fy7ubxHSkdULG8wVd6cZ5QFXoIkZN/nKyHIg6VQbG9vl3CO9yfHxugkLTq6bXZw4DN9EmZw3Vi/QD2ZjdZTbvW9EjR2oomfzsx0cGBmescEVWsXQ0iYh7+ZSGLbFY51Ow2jlvENYmqyxDOTZFj4KzHt6g2P4AYDEbs5fNYzKOhI7q4FzUHZ3VB52iu1skOunRiIXAcC/UAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoV3+QK1nLfqnNMx5Py0Iz58W8XVBEFuh0CZpsOTLVs=;
 b=PZcCd88OnooZ9/Ss4Np7Q/7J5HENRpmUQ0Usey6R3ItG0w2zUanKbzWM30y472koRIth2RQ6+MA/l8z7KAlIrou/BE1o0qWp9zDfSKILC8E82bTlZ+aJX/kL01Mn+/yDt8kZ0EzAE8IR5sskx+huaUAj+SWkBw6Ge09/7wlXhD37REWOpTg4qGddPgYfCE3eQP4segWDF3uIKf90lxaQx8sDCe1rV/VxznadObmKqoQxD8qRHCmhRAOUKt9HcElEmRtuz2ISR2l5SDl9IvhBfS+txYu1Y5IfaUK5iwqeamhrc7t62TYZRJgL8sfjqu/WFPlk3JhWU0f3C75BXOCkIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10964.eurprd04.prod.outlook.com (2603:10a6:102:490::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Mon, 29 Jun
 2026 14:30:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 14:30:39 +0000
Date: Mon, 29 Jun 2026 09:30:28 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: pankaj.gupta@oss.nxp.com, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v26 5/7] firmware: drivers: imx: adds miscdev
Message-ID: <akKBhIcXjtLpxIwE@SMW015318>
References: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
 <20260629-imx-se-if-v26-5-146446285744@nxp.com>
 <20260629072138.EC5C31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260629072138.EC5C31F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA0PR11CA0130.namprd11.prod.outlook.com
 (2603:10b6:806:131::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10964:EE_
X-MS-Office365-Filtering-Correlation-Id: 666a802a-9548-4893-7b5b-08ded5eafdc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|3023799007|6133799003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	jgxLrCPoIYYA5zJuQKvHnz8JfT7YpQeDFuHVSqxq87PjbT7Pr6XTtOMSm4qcMeJBL3tVTn+kZDb7SXUxk0+BF0cj7qB/16+SGoUQfneUeWL6/t+2bFEJ/0kCRHuu0So2Begy5A0JTOknbAwcAPQ8DPrkvGRI0GesHY0Dw/cPFdvpzf0NdXcyrdLIpAfI/WoWhvXwbILKKESZ0igniBf3Xact61tVWm0dadBvsmSAuxFoDPJKeO3hvL/pS48DH5AI5WoZs/fDPnFlvIUQcMd0rCo8KpkOWtAzoPOEXpCvixf1yNauvSpV8p6YF7uDvhhK13MSnkBryENHmUdJmApxqdhqxv94MpfjCzI6H7blcDSePZUm9DXP5H13hGldAGSViREwyBh/v/X/DcGeHwCr2Py56768YM4wzeEIs2czY0KGCRiv/xIYHVIY1YXofszthn5Sk60r9bOI+zSughR31Po6XNg2a7iFlPDdzja12nY9HD08eT1xAAa/4Dtbf7Xp4Mv84wMzceFExElZefCBrXMhAi1SdVFX7ZtH4Ia2wkwSKpbaMl/k0XOs0zSoFc1QAo/KDFQm67/j0OAhF1+dVtfrdce/oCLIyDKJeobunY8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?yztFEn/irMmaNgICid6t7399Ibf9IRmgEV7ca3JxCgyOBsa5rC7Xk6nUZR?=
 =?iso-8859-1?Q?h+qAgHRWOuhvg0P670LqvhH5jNG7pvAIcLJoPzZMTsKQqhfA9uYTpCA60F?=
 =?iso-8859-1?Q?/nJ0l5njtvolqj093lHZZveuuuADLG/N5DjAVDCG1PLxl6d2NeDJAjwp2u?=
 =?iso-8859-1?Q?BPSEej91NA3PQ/NcaHoDZqCewS4UzcMgA3mXt9N8A8cav/v4cQIMStUKZQ?=
 =?iso-8859-1?Q?CnG1oGU2s0j6Q23hJOBAy9QCzU2CK47gW44evCUpomQXDhvzANJDe8XNE5?=
 =?iso-8859-1?Q?mShETJE/Rp3yhexOlWTZtNNktguAB8348hjtxR6J4liwAIjhv8bNcj2Zu2?=
 =?iso-8859-1?Q?cnPHnM+CazDmDu1AZm+c4NU4wJ76i72LzwZvbmbYjGG82AuqVBaWhTkqx1?=
 =?iso-8859-1?Q?2SQ+q4KhWtmuBXLpyDRvGfTfXNoHCby0pdU5XUllTAnzyu+hXRj1JQ4J7/?=
 =?iso-8859-1?Q?AsXQEeULiADLT8xoVLaJorMYybc7ImFzxnS2eKEQ9jZBcKX3tI3ZU2iGNA?=
 =?iso-8859-1?Q?VPoifDjuG3vounSYnEm13h7VWjKjTolcgYBNs45Hr0rMcs9KZUUxLOqrwM?=
 =?iso-8859-1?Q?uNGRqbVr1ok95uoqiS1x3+9pg930IglIzgE2Y6meKQkx7ao+f1mgtTV6Qn?=
 =?iso-8859-1?Q?63Z7o3PD4YxZdqJgvgtf+OAFHHEhXaX18enPKsJh+5F23R+bRtWMWCPTI+?=
 =?iso-8859-1?Q?8YUKVf0uJjiY3cVH1CPCe7w/GBN4A+PDlF2P331bRmxFD2rp8P57/1G+yz?=
 =?iso-8859-1?Q?kbp9MGmaKzqYTZO6IGyZrzmRzjNYeDRMlqpEgQWYZU1TVZUlEA0wXCbj5m?=
 =?iso-8859-1?Q?v+L+MV1SqhCudVnnWA9S4pD/Pc76RqwG79TgmIcdjpVT13TBs3YhBRKloD?=
 =?iso-8859-1?Q?PvD8PnePCpJHg+OnEKhBiboFWHtHhOHwTGKEQq75HePkkqQUxQY/KzYS4a?=
 =?iso-8859-1?Q?AsDOEmfp1s0zr6gSbLi22OTHTinDmyLhj3cUthim3TKXp4NG1OYVS6ihvd?=
 =?iso-8859-1?Q?JNQjzbVcqblqXcQlizGyMPN9P0/tKZaSP8v0ydR0cBOkGgawKubk6rywf6?=
 =?iso-8859-1?Q?aFln4i7t/vNgwJxM6/lfk8JtrPDEUZaUR/rvQd8C3NWxqJUSl33X8IO7yK?=
 =?iso-8859-1?Q?4Yxg/iXY8Gcu3g4l+9D9JktCDjLi5NrTP6pNPvZ/6yTEgfWUqWd9y9TSZ+?=
 =?iso-8859-1?Q?VQr2Qlu33PKyHKX4+6x7PZf5Z1Ke8D3uJvrCdNl/Mchzv9oWvdR52j5QW8?=
 =?iso-8859-1?Q?O5VtJOvyD72BUZUEQ8HKnEjwLW71C3Nf86i+25OcytSQ+FbNX4sbZmfxXf?=
 =?iso-8859-1?Q?lyG7OzNJ/+xoSlyeua3QPvpFuNx3MjjZKIx/U27UCyMPIJVaJYAudtWCgb?=
 =?iso-8859-1?Q?J3GOs/clsRWLRKjb3rxxe+HHr8Q2T/TTdbUP38nsr4vuONeNNIS4AAwrvR?=
 =?iso-8859-1?Q?wBNz71JxkR5OevAOsSKuKcC9/mqAiHuaOWfsQlh4lbwS1yo18HnjXn9x7A?=
 =?iso-8859-1?Q?YkU9iw3SKTnpxHAT06wuhuRdGjWCdJ1ReXazCOA37x3w/BobLpHC7S0OVg?=
 =?iso-8859-1?Q?WFTxWkopvB9WeLmzLpeA7t9It0X3dVGrJOzHt5jpdgcQJ9rLNXy9mJOHFo?=
 =?iso-8859-1?Q?xy4D6UygJsWxNtOt4YtDPX88lv1jvh8+FzKGFerSyXumRfz57QcEDvd1mS?=
 =?iso-8859-1?Q?ybwz8Klpn08cL6wlShZJ5be1X2/eYxzIoYygm/faJZRitbhDj+JGjovf/7?=
 =?iso-8859-1?Q?c4Y9RFUj3Suur1bVrewVxQI+uDC9QsiMRcKnaImUy4ZsuI7N3iZ8udPCyc?=
 =?iso-8859-1?Q?SXW+ADVgnmuWSO0qeZ0RxhFLweWYNbrBta/yh6FsRj2w9nFKmC0a?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666a802a-9548-4893-7b5b-08ded5eafdc8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:30:39.2682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plezc3f3x4D1htsyTOj9jEJQ0rUiqZ8C/o7N7Q8zTEZ0h40wKmh3pEA17SUMrI6WRaI9Yp4Dr/CN0a7MzRd33l+0uMLo6dFL7gU4ToKu8u3hIaWC1/dUItAUINVgBbdH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10964

On Mon, Jun 29, 2026 at 07:21:34AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 13 potential issue(s) to consider:
>
> New issues:
> - [Critical] The allocated DMA address for the encrypted `imem` buffer is discarded, causing firmware to corrupt physical address 0x0.
> - [High] Command receiver device contexts bypass the response timeout, causing indefinite hangs on firmware communication.
> - [High] `dlink_dev_ctx()` frees the command receiver's `rx_msg` without holding the required synchronization lock.
> - [High] Missing `kref_init()` in `init_device_context()` causes the file context to be permanently leaked upon close.
> - [High] Unbinding the device or removing the module hangs indefinitely if a userspace thread is blocked in `read()`.
> - [High] DMA memory is freed when a file descriptor is closed, even if the firmware is still actively processing a timed-out transaction using that memory.
> - [High] Concurrent ioctls can cause multiple firmware authentications due to an unprotected state variable.
> - [High] Kernel pointer leakage to userspace due to struct type confusion in `get_se_soc_id()`.
> - [High] Early return upon mailbox send failure leaves a dangling pointer in the shared response waiter state, leading to a Use-After-Free in the RX interrupt handler.
> - [High] Invalid use of `dma_to_phys()` on a DMA address returned by `dma_alloc_coherent()`.
> - [Medium] UAPI ioctl structures use variable-sized types and pointers, breaking 32-bit userspace compatibility.
> - [Medium] Unbounded user-provided size is passed to memdup_user(), allowing potential kernel warnings and memory exhaustion.
>
> Pre-existing issues:
> - [High] Misdirected signal handling in `ele_msg_rcv()` corrupts another thread's state and traps daemon read threads in an uninterruptible wait.
> --
>
> commit 17a7df5c75595fcf60d2885ef3d90c709156c8d3
> Author: Pankaj Gupta <pankaj.gupta@nxp.com>
> Subject: firmware: drivers: imx: adds miscdev
>
> This commit adds a miscdev character driver for communicating with NXP
> secure enclaves (like EdgeLock). It provides ioctls for shared memory
> management, command exchange from userspace, and firmware loading lifecycle
> management.
>
> > diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h
> > --- /dev/null
> > +++ b/include/uapi/linux/se_ioctl.h
> > @@ -0,0 +1,97 @@
> [ ... ]
> > +struct se_ioctl_setup_iobuf {
> > +	void __user *user_buf;
> > +	__u32 length;
> > +	__u32 flags;
> > +	__u64 ele_addr;
> > +};
>
> [Severity: Medium]
> Does this struct break 32-bit userspace compatibility on 64-bit kernels?
>
> Using pointer types like void __user * changes the struct size between
> architectures. Since the ioctl uses _IOWR which encodes the size, a 32-bit
> process will have a mismatched size.

This is real problem, may user application use 32bit application.

>
> > diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> > --- a/drivers/firmware/imx/ele_common.c
> > +++ b/drivers/firmware/imx/ele_common.c
> [ ... ]
> > +	if (dev_ctx->priv->cmd_receiver_clbk_hdl.dev_ctx != dev_ctx) {
> > +		is_rsp_wait_with_timeout = true;
> > +		timeout_jiffies = msecs_to_jiffies(dev_ctx->priv->se_rcv_msg_timeout_ms);
> > +		deadline_jiffies = jiffies + timeout_jiffies;
> > +	}
> >  	do {
> > +		if (is_rsp_wait_with_timeout) {
>
> [Severity: High]
> Does this logic correctly identify the wait context?
>
> It disables the timeout based on the file descriptor's identity as a command
> receiver rather than the type of wait being performed. If the daemon issues
> a synchronous command via SE_IOCTL_CMD_SEND_RCV_RSP, it will use
> MAX_SCHEDULE_TIMEOUT and could hang indefinitely if the firmware drops a
> response.

Please double this one? Please look other sashiko results.

Frank
>
> [ ... ]
> > +		if (ret == -ERESTARTSYS) {
> [ ... ]
> > +			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
> > +				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
> > +				wait_uninterruptible = true;
> > +				continue;
> > +			}
>
> [Severity: High]
> This is a pre-existing issue, but does this signal handling code modify the
> wrong thread's state?
>
> When the daemon receives a signal, the hardcoded check against
> priv->waiting_rsp_clbk_hdl could corrupt another concurrently waiting
> thread's state. Would this force the daemon read thread into an infinite
> wait_uninterruptible loop?
>
> > diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
> > --- a/drivers/firmware/imx/se_ctrl.c
> > +++ b/drivers/firmware/imx/se_ctrl.c
> [ ... ]
> > +static u32 get_se_soc_id(struct se_if_priv *priv)
> > +{
> > +	const struct se_soc_info *se_info = device_get_match_data(priv->dev);
> > +
> > +	return se_info->soc_id;
> > +}
>
> [Severity: High]
> Does this cause a struct type confusion that leaks kernel pointers to
> userspace?
>
> device_get_match_data() returns a pointer to struct se_if_node *, but this
> code mistakenly casts it to struct se_soc_info *. Reading se_info->soc_id
> will extract bits from the first member of struct se_if_node, which is a
> kernel pointer.
>
> These bits are then exposed to userspace by the SE_IOCTL_GET_SOC_INFO ioctl.
>
> [ ... ]
> > +static int load_firmware(struct se_if_priv *priv, const u8 *se_img_file_to_load)
> > +{
> [ ... ]
> > +	se_fw_buf = dma_alloc_coherent(priv->dev, fw->size, &se_fw_dma_addr, GFP_KERNEL);
> [ ... ]
> > +	se_fw_phyaddr = dma_to_phys(priv->dev, se_fw_dma_addr);
> > +	ret = ele_fw_authenticate(priv, se_fw_phyaddr, se_fw_phyaddr);
>
> [Severity: High]
> Is it safe to use dma_to_phys() on an address returned by
> dma_alloc_coherent()?
>
> dma_alloc_coherent() returns a DMA address (IOVA on systems with an IOMMU),
> and dma_to_phys() cannot reverse an IOMMU mapping. This will result in a
> garbage physical address being passed to the firmware for authentication.
>
> [ ... ]
> > +static int se_load_firmware(struct se_if_priv *priv)
> > +{
> > +	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
> > +	int ret = 0;
> > +
> > +	if (!load_fw->is_fw_tobe_loaded)
> > +		return 0;
>
> [Severity: High]
> Is the load_fw->is_fw_tobe_loaded initialization state safe from race
> conditions?
>
> It is checked and modified here without global locking. Could concurrent
> ioctls on different file descriptors bypass the boolean check
> simultaneously, leading to duplicate memory allocations and multiple
> conflicting firmware authentication commands?
>
> [ ... ]
> > +static void cleanup_se_shared_mem(struct se_if_device_ctx *dev_ctx)
> > +{
> [ ... ]
> > +	/* Free non-secure shared buffer. */
> > +	dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
> > +			  se_shared_mem_mgmt->non_secure_mem.ptr,
> > +			  se_shared_mem_mgmt->non_secure_mem.dma_addr);
>
> [Severity: High]
> If a synchronous command sent via SE_IOCTL_CMD_SEND_RCV_RSP times out, the
> background firmware operation is not canceled.
>
> When userspace closes the file descriptor, these coherent DMA buffers are
> freed. Will the firmware eventually write its response to the freed address,
> causing kernel memory corruption?
>
> [ ... ]
> > +static void dlink_dev_ctx(struct se_if_device_ctx *dev_ctx)
> > +{
> [ ... ]
> > +	if (priv->cmd_receiver_clbk_hdl.dev_ctx == dev_ctx) {
> > +		kfree(priv->cmd_receiver_clbk_hdl.rx_msg);
> > +		priv->cmd_receiver_clbk_hdl.rx_msg = NULL;
> > +		priv->cmd_receiver_clbk_hdl.dev_ctx = NULL;
> > +	}
>
> [Severity: High]
> Can this result in a use-after-free and data race?
>
> This frees the command receiver's rx_msg without acquiring the clbk_rx_lock.
> Concurrently, the mailbox interrupt handler se_if_rx_callback() could
> acquire the lock, observe a non-null pointer, and copy incoming firmware
> data into the freed memory.
>
> [ ... ]
> > +static void cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose)
> > +{
> > +	scoped_guard(mutex, &dev_ctx->fops_lock) {
>
> [Severity: High]
> Can this cause a deadlock during device unbind or module removal?
>
> If a userspace daemon is blocked indefinitely in read() holding the
> dev_ctx->fops_lock, the teardown path unconditionally attempts to acquire the
> same fops_lock here and will hang indefinitely.
>
> [ ... ]
> > +static int init_device_context(struct se_if_priv *priv, int ch_id,
> > +			       struct se_if_device_ctx **new_dev_ctx)
> > +{
> > +	struct se_if_device_ctx *dev_ctx;
> > +	int ret = 0;
> > +
> > +	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
> [ ... ]
> > +	mutex_init(&dev_ctx->fops_lock);
> > +	dev_ctx->priv = priv;
> > +	dev_ctx->cleanup_done = false;
> > +	INIT_LIST_HEAD(&dev_ctx->link);
> > +	*new_dev_ctx = dev_ctx;
>
> [Severity: High]
> Should this allocation include a call to kref_init(&dev_ctx->refcount)?
>
> Without initialization, the refcount remains at 0. When close() is called,
> kref_put() will fail, bypassing the se_if_dev_ctx_release callback and
> permanently leaking the file context.
>
> [ ... ]
> > +static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
> > +					    void __user *uarg)
> > +{
> [ ... ]
> > +	struct se_api_msg *tx_msg __free(kfree) =
> > +		memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
> > +			    cmd_snd_rcv_rsp_info.tx_buf_sz);
>
> [Severity: Medium]
> Is the tx_buf_sz parameter validated against an upper bound before calling
> memdup_user()?
>
> If a user process passes an extremely large value, could this lead to a
> local denial of service via memory exhaustion or warning spam?
>
> [ ... ]
> > +	err = ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
> > +			       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
>
> [Severity: High]
> If ele_msg_send() fails internally within ele_msg_send_rcv(), does it leave
> a dangling pointer?
>
> If ele_msg_send_rcv() returns early on error, it does not reset the shared
> priv->waiting_rsp_clbk_hdl.rx_msg pointer to NULL. The caller then frees the
> buffer, and a late firmware response handled by se_if_rx_callback() will
> trigger a use-after-free when copying into the freed memory.
>
> [ ... ]
> > +static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
> > +				size_t size, loff_t *ppos)
> > +{
> [ ... ]
> > +		struct se_api_msg *tx_msg __free(kfree) = memdup_user(buf, size);
>
> [Severity: Medium]
> Is the size parameter validated against an upper bound before calling
> memdup_user() here?
>
> [ ... ]
> > +static const struct file_operations se_if_fops = {
> > +	.open		= se_if_fops_open,
> > +	.owner		= THIS_MODULE,
> > +	.release	= se_if_fops_close,
> > +	.unlocked_ioctl = se_ioctl,
> > +	.read		= se_if_fops_read,
> > +	.write		= se_if_fops_write,
> > +};
>
> [Severity: Medium]
> Is a .compat_ioctl handler missing here?
>
> Because the ioctl structures use pointer types, a translation handler is
> required to support 32-bit userspace binaries.
>
> [ ... ]
> > +static int se_if_probe(struct platform_device *pdev)
> > +{
> [ ... ]
> > +		if (load_fw->se_fw_img_nm->prim_fw_nm_in_rfs) {
> > +			/* allocate buffer where SE store encrypted IMEM */
> > +			imem_dma_addr = phys_to_dma(priv->dev, load_fw->imem.phyaddr);
> > +			load_fw->imem.buf = dmam_alloc_coherent(priv->dev, ELE_IMEM_SIZE,
> > +								&imem_dma_addr, GFP_KERNEL);
>
> [Severity: Critical]
> Does this discard the DMA address allocated by dmam_alloc_coherent()?
>
> The function returns the IOVA in the local stack variable imem_dma_addr, but
> this address is never saved back to load_fw->imem.phyaddr, leaving it at 0.
>
> The firmware might then be instructed to use physical address 0, destroying
> data at page 0. This will also cause the cleanup path to pass 0 to
> dmam_free_coherent().
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260629-imx-se-if-v26-0-146446285744@nxp.com?part=5
