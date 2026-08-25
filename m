Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390F1485515;
	Tue, 25 Aug 2026 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787670411; cv=fail; b=ukH4qY0RSe4cFBJxCaltoGfe5sVadvkxmJRYVSvuhWodj5DJ1LTgY9g/2wFiG0UWPF+gA55TeXOdXwuR9G8hK6yQpph3XwN/p7yXIzUZcgQSoay8kpRzS3GmI/s8fhXbLAQ5v8dMEtAIdTVTfKVfKWPx+XDfG3HRz52aeoxICQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787670411; c=relaxed/simple;
	bh=iXQnNRCbq+Zz02tGktlc3HdlT2Hk7ivc7N+BKNS1JLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r5X9rMxAms2sIwVmGQgNtf91OOs6Dkace13NVC8BkFc4/wSSjDYcRb1VUbE/cFNACAj4bLczoofioHJve3iasidyE0cKaxsrtTsnXhySdY+NCYDzg8XiY4rFpisM9o6PxSNtoKgY2VlCzAg5Bs0CNelw4pWuoRtICcJMTRqR+1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gTvEC7rC reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gTvEC7rC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icJSterUQco/Tpq+oLtKctNfj4fdC1b8ELpTDHaBoUA9hvIFrAOVvu0eS3UqFCu77GELDIvh4EbtVN1k/4Yh04uNfc8jYe9Y60ka3aZVILy3rW1c4lzdk5SNgMJNp/L+hozL0eSgo/JdjZoQ4oduOOdS6IciL/VJ6zjT+o4lnpwSrSq6stMUWMfibSpL9Y87JZexr/UvkhtqthxRTTvKX0KExGbaIM3Gx17038y2+dzrjqxOUmXQiVdG95wo83AGwQIu9jFUpDvPp8MgSLY07AvXYFwqVmm1Sci5PwjqZMhX7t8yZ+ajxAHW0Pj0ogUKTYnE+SPC52/4sqGXrqP1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzGKf2Z/0+smRnu9izlu1xUfCxrH/ouIsZCvFpCZCw8=;
 b=AYY9R2L80OlGvqiBeqfLcyFBpx54W7sY0U/7T0wOSzFldzmm8lx4j2vtTaFbwzEbPKa4xdsV0EWg/1+KGB1jV98kGxqMhce6X1PvE+8BKtg62IrGLSiDiWCMALVc3Bc57ZdHcE3KNBeQnTQmNBLRqtvvRKVhRAM0iHk1o/AosCxH6PcsW2YnvD2Odb3MWGZTmIe4wJQlllbIVDf+jvqI0V3yDK+MgUbCU8fOX3x+RvW0aJwbXMBP1Dp2ICzd89mktGmxv5YZIZmkK9tDfTjd8/06oB5/ngnTKIXBhZZ2B40LK5cH8OSdQMNMpo9uIE/loiYi8oMcuL0pie0EmjmZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzGKf2Z/0+smRnu9izlu1xUfCxrH/ouIsZCvFpCZCw8=;
 b=gTvEC7rCjMLVymbNeqICu1Lw4G99HOOGxT3V0EXUGnXZsu4azQvqOhzzAar5X1zRfcQwGC1jbhn1A+CJ9XR6Z9eePGQrwcU33l4OeW4gS0iHExC/mydmGRpvZ+BPOEblsKFIaCJwA1s/anaBTbEC/v9q34Y96VeqyPgluwv90C0tfXO2lYPenaTV3Vkw3WhfL5J3ONbcf1CjksgwGQosPOwY7Q+0uxq3UdkQD/RbqA5+u3PGCIHDh6WDHa/KOqAwGawc+K+vDid/HSK/3BzGa0XW/quDTbyGKCqaEeE438AvJbz8PeoGctxstAMfKx7dvCfcBzmurqyd69GTYC7otw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB12045.eurprd04.prod.outlook.com (2603:10a6:501:94::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 15:06:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 15:06:41 +0000
Date: Tue, 25 Aug 2026 10:06:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: pankaj.gupta@oss.nxp.com, imx@lists.linux.dev, Frank.Li@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v42 5/7] firmware: imx: adds miscdev
Message-ID: <ao2vea2Z6RvDL4oy@SMW015318>
References: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
 <20260825-imx-se-if-v42-5-2e8efac0bb16@nxp.com>
 <20260824175010.E8E2E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260824175010.E8E2E1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA1PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB12045:EE_
X-MS-Office365-Filtering-Correlation-Id: 4873909b-d785-45a9-09a5-08df02ba77e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|19092799006|6133799003|5023799004|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0rZl1oeM+lJwK83gwLaJFe5z13zSkM6AuL/gaf4KmAP3iFN9D+762uRp3M2muTcSjI/63Za4tMNwYQZCm0HfXvZTTCEkXJNE6VGHzR3L8QFf0+ROpG/eLNCdVPlTBH1Nd+eaCUYj8ZJ3nZXGGDgB8gZ3mBVQwt0fKEBBbysFSYZPSn2QKW+/VkrdU6dDKEWO6ErSokai7DUcGrj6FAoipQeO7FgYh1iZTPuBLMLvxmX+mOrPrRIbZgaD2fDutNKu1cHpVgplAfTDLacKl5W+m2FbMvZ4FvO94BRTJ+icFScn1Y53ry1DiX+hpIGU0L0O73si+ux0jI6IUu6IvZA1xF4J8/aystL643Lp0Wv5keAsbaYxzDVBtKhLZMhm0spx1OePGQtZv7RJY+7UZKz/dz5BpCzSAF8hIlfxPGZUerOsuCejJ8zS8xH/7Zlgml8HJAHbJQHetuLyraCT+uQLiB5NiXBG0D++P46IEYyjX7LoxPfgslHsCRds2Tls33t1BVCKKG4n7miOkJWfIs/9lU0u5h6s55mgtnCZmTOTbox2HEEZzqpBEbmK2aJIrUxqRU5EimrezW/OlxWVvEMd9v96qghjxc0gQuc3kWn6M3Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(19092799006)(6133799003)(5023799004)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?cg6VOUEONOVOHHBwWfL2/ovPL8BlPJOk/vI/3RSoTiiuzvyLr1/XJ7N7Yu?=
 =?iso-8859-1?Q?VSSljZx2Xx8s6pVNoghD+DJEIwJ5kR1XeWPxR+XPP1c6BfpxZioZAfkSDy?=
 =?iso-8859-1?Q?iWa5yoN11rlq0FPzpZDxK4m1f9BAQ/OYC2eKNX3p+bvuNYLtYN/3ktaKGV?=
 =?iso-8859-1?Q?+6uxsyHzBHO4/DGhEzZFzHGQRXb1IjRRN+M7p0Z5Yznojxme6W6jQ1hRaV?=
 =?iso-8859-1?Q?BvwFAoijCS+InGxKAQcTPfXYCCTHixNK+vWQlAV40XdIxPTuKejJslCd2f?=
 =?iso-8859-1?Q?J4PJrqSADw4Oy9RXpuTYAWrUM5K38vEsQqpaSxPC+hxK7neI6Afuw5I2Td?=
 =?iso-8859-1?Q?41+cq5yUxWr0SkKqxjSlFs7Z0cK0Onkgqcg34We+OuMwaVfuL+ut4Z9Iwd?=
 =?iso-8859-1?Q?dxwrhsmnynC0h9djlu5hXOf5y1uqL+gVlXFoh864rIkFc5s/Hap0qWmUll?=
 =?iso-8859-1?Q?dw8P6AgwkwYltFaaE/autt4nT3f05v5EcNj4CWupx0TaIASnry5jVKXSY4?=
 =?iso-8859-1?Q?nAG4NqDGCR0OYA/qsXUzBpCtmWqbf/gvmXSMYzSV96/FDvwz7EM1SwCvD+?=
 =?iso-8859-1?Q?fyAXQIu8h260ZIg6ro39lX7B7zm+1FO09utI+wtT2QropiQJAzNzfNBM19?=
 =?iso-8859-1?Q?wN323rh4LWHsOwo3rglbEmbqm2f0MakEpbh9u082JI6LqWzlGuiFsmVEcC?=
 =?iso-8859-1?Q?CPmllM9YP8vEIuUCLWTJIkOX47bvANc0RlEwrn3Y43MoDuTKCMw1crDGhG?=
 =?iso-8859-1?Q?WYKhNOzQ4xPExcsxWNkpt4eD7hfRG15oUYshBOpqEmtThKiOarD62tkxlg?=
 =?iso-8859-1?Q?E/tT30FRll43gstmwwjeLk7O4wFrXVx+Hycqh/vmxCamtOyCiSEQoLJ2xV?=
 =?iso-8859-1?Q?InJ1x/Waif0/DQc+Pzi9DK4xwv58ajFfk6qf6FtRvZK8pqxvOmvg97IhRH?=
 =?iso-8859-1?Q?JxaD/q9UDawKd5B6xfnmrVj1vzLGTD6YFBYCEHTPXKfxxdW8q6hbRdQTqk?=
 =?iso-8859-1?Q?SGpXwl5HlAwMIloFoZaPt53SZGUpxwfuvxv9hDFTlCMuxXmqgn7OWeKIB5?=
 =?iso-8859-1?Q?gVTBoUTx7jalJ7Wcq/IonKsAHMQCFgVWeda88VM6CCxooIB0Dapn/tCx6y?=
 =?iso-8859-1?Q?3ucwG2KFHVwUNPBEwTJf0ENGkuyTgBW5XlS//gTZWnlubWHeKle5J4nY+u?=
 =?iso-8859-1?Q?Oe9BT8OegE54UL1uNAZSR/Z0RyMfES6X/7a3yz4TxxnGsTTdg3m+rQ4hps?=
 =?iso-8859-1?Q?O3JRS/avV/NAKGPBwxhKiMiB+KOnM1+aOpZFcFs3GqfEOrr6FdSqmHlV1O?=
 =?iso-8859-1?Q?m0UW2cfaJJEaioj0kzcvwA40nSFkPC48mLHVG59KE+RTqnxNsWmKfP/ERC?=
 =?iso-8859-1?Q?NN9BKPXnAuCIjnDK3YkJBu0qNhaL6f5KObHCGFUrNC4N7Zv1kMcrPZ3MDM?=
 =?iso-8859-1?Q?6+LWRUJ+Gh5nV28MeLYGCysgL2x8/aYg7eVA72txBpDbav0g368ukCazuU?=
 =?iso-8859-1?Q?ggkeNSTJjI72cV9grr3W3EEnDPAlrjHw3X5S0VNGkCtNFdorEtfDUJKEPS?=
 =?iso-8859-1?Q?zI6yzwqZsLOMs5drImqE+3IfO4ebPPRI4W7OWKYjdeJwkL994gHTIxstq2?=
 =?iso-8859-1?Q?k2gKrj/7KsLhnT154r6DWsMu9nbHSNWJXvDOSnpmDTz+2TCHWZP60jU1oM?=
 =?iso-8859-1?Q?iIR6KBJjnvW2fyrnHQ3Rs2mvHzMdIOkHgsYHDZ7+HV+3frmbGIKP2jKQRe?=
 =?iso-8859-1?Q?2sT6c+kE5qtzJ8MJ2cNvlLavBzfYethoO0QBOy+tmKb8c/4ViWiB8BFmIq?=
 =?iso-8859-1?Q?TS4kf3vOYoHyX87taNc7CjUd8X1krOufMtcTmbwzuY/atuc2Ncgb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4873909b-d785-45a9-09a5-08df02ba77e2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:06:41.1563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjxEETeXfByHt/FEsA3ZbD+mjdUdO3C7IwO7b3RYM4aa23YpXldENQit8gVQEI1JzYPS0j2R5XGcq6W8r9QIzLb2gG4xn7TbBrZzXvoDlyOx+PbJXs/KuGBvEl5xhsf4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12045

On Mon, Aug 24, 2026 at 05:50:10PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential issue(s) to consider:
> - [High] TOCTOU race condition in ELE_STORAGE_OPEN_REQ allows NVM traffic interception
> - [High] Firmware session handles permanently leak if a process exits via a fatal signal due to the fw_busy circuit breaker
> - [High] SE_IOCTL_ENABLE_CMD_RCV_STATUS unconditionally returns -ENOMEM, rendering it broken
> - [High] Missing bounds validation for SE_CMD_ADDR_NO_SIZE buffers allows arbitrary out-of-bounds DMA reads
> - [High] Use-After-Free of priv due to fw_busy_work being scheduled after cancel_work_sync
> - [High] Mutexes initialized via devm_mutex_init() are destroyed before se_if_probe_cleanup() executes
> - [High] Successfully received firmware responses are dropped on non-fatal signals, leaking firmware resources
> - [Medium] SE_IOCTL_GET_MU_INFO returns hardcoded zeroes instead of enclave identification data
> --
>
> --- Patch [5]: [PATCH v42 5/7] firmware: imx: adds miscdev ---
> commit 2e1b01a2a813fca5bf21f8f8fd015fe9ea573491
> Author: Pankaj Gupta <pankaj.gupta@nxp.com>
> Subject: firmware: imx: adds miscdev
>
> This patch adds a character driver to communicate with NXP secure enclaves
> (such as EdgeLock) from user-space. It introduces an ioctl ABI, shared memory
> management, and validation checks for firmware commands.
>
> > diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> > index 0000000000000..0000000000000
> > --- a/drivers/firmware/imx/ele_common.c
> > +++ b/drivers/firmware/imx/ele_common.c
> > [ ... ]
> > @@ -546,6 +546,14 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
> >  	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
> >
> >  	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
> >  		/*
> >  		 * Signal was deferred until the FW/kernel protocol resynchronized.
> >  		 * On success report -ERESTARTSYS for the interrupted wait; the
> >  		 * command is not re-sent. Keep real errors like -ETIMEDOUT.
> >  		 */
> >  		if (err > 0)
> >  			err = -ERESTARTSYS;
>
> [Severity: High]
> Could this leak firmware resources when a non-fatal signal arrives?
> If a firmware response successfully arrives but defers a non-fatal signal,
> this code overwrites the positive success size with -ERESTARTSYS.
> Then in se_ioctl_cmd_snd_rcv_rsp_handler(), this is converted to -EINTR
> and returns early without copying the response payload to userspace.
> Because userspace never receives the newly generated handles (e.g., keys
> or contexts), it cannot issue cleanup commands.
>
> > [ ... ]
> > @@ -660,11 +660,11 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
> >  		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
> >  		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> >  		if (!se_clbk_hdl->rx_msg) {
> >  			if (atomic_read(&priv->fw_busy))
> >  				schedule_fw_busy_work = true;
> >  			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> >
> >  			if (schedule_fw_busy_work)
> >  				schedule_work(&priv->fw_busy_work);
>
> [Severity: High]
> Could this lead to a use-after-free of the priv object?
> In se_if_probe_cleanup(), cancel_work_sync() is called to wait for and cancel
> fw_busy_work before the rx_chan mailbox is disabled. If a late firmware
> response arrives in this window, this callback will execute. Because the
> callback schedules the work unconditionally if fw_busy is set without checking
> going_away, the work could be re-queued after cancel_work_sync() returns,
> causing it to access the freed priv object when the unbind finishes.
>
> > diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele_fw_api.c
> > index 0000000000000..0000000000000
> > --- a/drivers/firmware/imx/ele_fw_api.c
> > +++ b/drivers/firmware/imx/ele_fw_api.c
> > [ ... ]
> > @@ -155,10 +155,10 @@ int ele_uapi_allowed_fw_cmd(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *he
> >  		/*
> >  		 * Reject the storage-open request when another context is
> >  		 * already registered as the command receiver.
> >  		 */
> >  		scoped_guard(mutex, &priv->modify_lock)
> >  			if (priv->cmd_receiver_clbk_hdl.dev_ctx &&
> >  			    priv->cmd_receiver_clbk_hdl.dev_ctx != dev_ctx)
> >  				ret = -EBUSY;
>
> [Severity: High]
> Can this create a TOCTOU race condition?
> The modify_lock is dropped immediately after checking the receiver
> availability, opening a window before the command reaches firmware.
> If two threads concurrently send ELE_STORAGE_OPEN_REQ, both could pass this
> check and receive valid storage handles.
>
> > [ ... ]
> > @@ -244,11 +244,11 @@ void fw_api_specific_ops(struct se_if_device_ctx *dev_ctx, struct se_api_msg *rx
> >  		rc = set_dev_ctx_as_command_receiver(dev_ctx, false);
> >  		if (rc)
> >  			dev_err(priv->dev,
> >  				"Failed to register %s as CMD-Receiver: %d\n",
> >  				dev_ctx->devname, rc);
> >  		break;
> >  	}
>
> [Severity: High]
> Following the race condition above, if one thread successfully registers as the
> command receiver but the other fails here, the failure to register only logs
> an error and returns void. Does this allow the ioctl to return success, routing
> the second thread's firmware callbacks to the first thread and allowing
> interception of NVM traffic?
>
> > diff --git a/drivers/firmware/imx/ele_msg_addr_field.c b/drivers/firmware/imx/ele_msg_addr_field.c
> > index 0000000000000..0000000000000
> > --- a/drivers/firmware/imx/ele_msg_addr_field.c
> > +++ b/drivers/firmware/imx/ele_msg_addr_field.c
> > [ ... ]
> > @@ -51,7 +51,7 @@ static const struct se_cmd_addr_field ele_oem_auth_cntr_addr_fields[] = {
> >  	 * Output buffers must be fully bounded; input-only buffers are safe with
> >  	 * addr-only checks.
> >  	 */
> >  	{ .lsb_idx = 1, .msb_idx = 0, .has_msb = true, .flag_idx = SE_CMD_ADDR_ALWAYS,
> >  	  .size_idx = SE_CMD_ADDR_NO_SIZE },			/* container_hdr_addr */
> >  };
>
> [Severity: High]
> Can this unbounded input buffer allow arbitrary out-of-bounds DMA reads?
> The descriptor specifies SE_CMD_ADDR_NO_SIZE and a zero buf_size, which
> bypasses end-bounds checks. If a malicious userspace process places the buffer
> at the very end of the shared memory window and crafts a header with a huge
> size field, couldn't the firmware read beyond the mapped shared memory window
> into unmapped space and trigger AXI bus faults?
>
> > [ ... ]
> > @@ -138,7 +138,7 @@ static const struct se_cmd_addr_field ele_keystore_reprov_en_addr_fields[] = {
> >  	 * memory the caller already owns. Output buffers must be fully bounded;
> >  	 * input-only buffers are safe with addr-only checks.
> >  	 */
> >  	{ .lsb_idx = 1, .msb_idx = 0, .has_msb = true, .flag_idx = SE_CMD_ADDR_ALWAYS,
> >  	  .size_idx = SE_CMD_ADDR_NO_SIZE },			/* signed_msg_addr */
> >  };
>
> [Severity: High]
> This appears to be another instance where an unbounded input buffer might
> allow arbitrary sized DMA reads by the firmware. Is there a way to safely
> bound this input payload?
>
> > diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
> > index 0000000000000..0000000000000
> > --- a/drivers/firmware/imx/se_ctrl.c
> > +++ b/drivers/firmware/imx/se_ctrl.c
> > [ ... ]
> > @@ -746,10 +746,10 @@ static void se_if_probe_cleanup(void *plat_dev)
> >  	while (true) {
> >  		dev_ctx = NULL;
> >
> >  		scoped_guard(mutex, &priv->modify_lock) {
> >  			if (list_empty(&priv->dev_ctx_list))
> >  				goto out_done;
>
> [Severity: High]
> Is there a devres initialization order issue here?
> Because devres actions execute in reverse order (LIFO), modify_lock will be
> destroyed before se_if_probe_cleanup() is invoked, since it was initialized
> after devm_add_action_or_reset. When the cleanup function later attempts
> to lock this destroyed mutex, could this lead to undefined behavior or
> crashes during device unbind?

Please check this

>
> > [ ... ]
> > @@ -1151,9 +1151,9 @@ int set_dev_ctx_as_command_receiver(struct se_if_device_ctx *dev_ctx, bool is_io
> >  	if (se_clbk_hdl->dev_ctx)
> >  		return -EBUSY;
> >
> >  	if (!dev_ctx->strg_hdl)
> >  		return -EINVAL;
> >
> >  	if (is_ioctl)
> >  		return -ENOMEM;
>
> [Severity: High]
> Does this check render the SE_IOCTL_ENABLE_CMD_RCV_STATUS ioctl broken?
> When se_ioctl() invokes this function with is_ioctl set to true, it will
> unconditionally return -ENOMEM here and the command receiver will never be
> registered via the API.

Please check this

>
> > [ ... ]
> > @@ -1532,9 +1532,9 @@ static int se_ioctl_get_mu_info(struct se_if_device_ctx *dev_ctx,
> >  	struct se_if_node *if_node;
> >  	int err = 0;
> >
> >  	if_node = container_of(priv->if_defs, typeof(*if_node), if_defs);
> >
> >  	if_info.se_if_id = 0;
> >  	if_info.interrupt_idx = 0;
> >  	if_info.tz = 0;
> >  	if_info.did = 0;
> >  	if_info.cmd_tag = priv->if_defs->cmd_tag;
>
> [Severity: Medium]
> Are these structural identification fields intentionally populated with
> hardcoded zeroes? Setting se_if_id, interrupt_idx, tz, and did to 0 prevents
> userspace from dynamically identifying the secure enclave's type or
> configuration.

Is it true?

Frank
>
> > [ ... ]
> > @@ -1614,11 +1614,11 @@ static void cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose)
> >  				struct se_if_device_ctx *tx_ctx = is_fclose ? dev_ctx :
> >  							dev_ctx->priv->priv_dev_ctx;
> >
> >  				if (dev_ctx->strg_hdl && se_close_storage(tx_ctx,
> >  									  dev_ctx->strg_hdl))
> >  					dev_err(dev_ctx->priv->dev, "failed to close storage.\n");
> >  				if (dev_ctx->sess_hdl && se_close_session(tx_ctx,
> >  									  dev_ctx->sess_hdl))
> >  					dev_err(dev_ctx->priv->dev, "failed to close session.\n");
> >  			}
>
> [Severity: High]
> Will firmware session handles leak if a process exits via a fatal signal?
> If se_close_storage() encounters a pending SIGKILL, its wait_for_completion
> aborts instantly and arms the fw_busy circuit breaker.
>
> When se_close_session() runs immediately afterward, it sees fw_busy is set
> and aborts the session close command without sending it. Does this permanently
> leak the session handle on the secure enclave?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com?part=5
