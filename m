Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26BC2C17A3;
	Wed, 26 Aug 2026 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757350; cv=fail; b=kT6LahfXAA/TU2d9RAkeCgIklOs6M/FIbQxwD0kxHzFdgSANQ29x9ZpwjDiWZuCu3V9FjY+2FapoVyoGzzl23KmouhPI6mjWO+4jfCA6R1v3lV/WEQseLCxfj/hBntU6GrriczmAW/OqcGhPigXykY2dglL+m4VX0BOR9K6G10c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757350; c=relaxed/simple;
	bh=d+BYIzsahhXlQx7TRB5asYWFIrCA8Guu03RDbwaFZt0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D4ClkRUAEbV+8dozGxBkiI2v61Vywc2rZgS+X5B96H3ht07Wa1Rg75I7tUBsIoene8qoyFakpeDKHpgET414wHZu4DhCM+Wg/+QiSoZFeKn3rRBwTwJ4PkddFTJWO4Rz0i++nU4YeYGNU/usX5MfzFKiVv86slX3tZkn6prc4jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kRHEdWRW; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kRHEdWRW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8lBTUIQwqGiCDbYKyZ3Fcn9UplHb8h+rzze6BHth6zZK/U0TG6eOc6iYKus8Sv0TbqcM2BxSrdwf2BoIuQt5L2AfcdW/E6Zv7qSDw2KYQXAWqGW/b+ay6Qlysjnax/hCnBlk1EdIsyjwNI+EBd/OZk9k7wWiNdp+aEAjj1Rc16T+6MwVoc4KrhfkGAkDY71rSlFKqBXW/AxWGlXk2U6WywFRuJ1xxsD2WzdmcbJxEA3H63ccIFBmeaENA8nrmcjRITJiNticuQkn0B/phXtDsIf1jhFaYwj9DsPE5tujyxKL5Tvm0lXAVCZ1Drn3LOFPWJSQE0igMkWpAE9SnEDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DdrrlLtuUpxY/3VWA4ipNa/ATpLbZ7fJ6pdLZW4cVc=;
 b=lKCntjSlh1QHRwi/QoTdfOIrFtzSxU3Y8T2FegwpotXbj2jmwdqjcbHPmWmzX7fRKK7DL/kjan1YA5yz02VnXmJ+6ZMDckQALE9ZU/3lmVJ1a/ITsZGNVn07AywX/qM5P00kO/H6j4cxZinFevxnYRub76ZwEWroyxinuNvph4ALtlDV/tuBH3X44TEoQPKIaj54cMZrzwOplDSh93LbwEMjVLKLXXI18OwMFF9x/42Ho5RfxOV7foZGmf0mWTZpyy8ZHxhkvShKE+bBMMJEECvkJ/VDXqitS2ISvyu0GHIFn+aGhOWkUra12PWSpdeb4qAKmE3Xx7nBaQTcvFa0jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DdrrlLtuUpxY/3VWA4ipNa/ATpLbZ7fJ6pdLZW4cVc=;
 b=kRHEdWRWPlX7Q1e8IrB+LjZveiAdx+KykO19LOWGLvG7BKEylE1DxXAK5qjZGAaozuHsgUYdL3gO2WiYf0g4I2v5MQ4zbhnmQQpKZgcK4+Bw7J5xnbNWL1gLrADHg90o+C2zmXxvcaosE5pKQ+Xaak+eKAnkjvRAQ+ZU4J1K2DzF23efkAMbxY/duz78UDI6RrM/p2JnfCHytztZTOg+5Rc5E5BXx2bPYje5XVvCNGU0DietFzpC2qW7/0xCxRaqBlyXF4kydFUM4dOseS4EwNxqxnGzltatc8MqvGjqgNmJALt8lXDs+0ttrEVoBjxlwO5XophCwkySbe5iyMTQtg==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by DU7PR04MB11186.eurprd04.prod.outlook.com (2603:10a6:10:5b2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 15:15:42 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 15:15:42 +0000
From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>
Subject: RE: [PATCH v42 5/7] firmware: imx: adds miscdev
Thread-Topic: [PATCH v42 5/7] firmware: imx: adds miscdev
Thread-Index: AQHdM+62vM6+B38BAEOIJdyhzzlrGLateiYAgAFknoCAAZIpEA==
Date: Wed, 26 Aug 2026 15:15:42 +0000
Message-ID:
 <GV2PR04MB12271A88AE415E200228B8A0D95AE2@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
 <20260825-imx-se-if-v42-5-2e8efac0bb16@nxp.com>
 <20260824175010.E8E2E1F000E9@smtp.kernel.org> <ao2vea2Z6RvDL4oy@SMW015318>
In-Reply-To: <ao2vea2Z6RvDL4oy@SMW015318>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-26T15:05:56.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|DU7PR04MB11186:EE_
x-ms-office365-filtering-correlation-id: 598dcb9e-f265-44bc-17c0-08df0384e524
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|23010399003|56012099006|10067099003|6133799003|3023799007|11063799006|5023799004|22082099003|4143699003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 ntTEeC3xYLmvysfCiwc5X2V1gFBmef0TuLND8jZeS/HetIeg2OxPwmNLsyj7fuKo9mQSNA6n8pA2x6Q2mVv7b2gA2/uDmRpAUYXmAEO2PXd3k0M3s7YPGrSTYB3dDjrwteFFTBIPN9BNkkV+2/bl78B5ax4RQWp/bfkVrdPQz9VL5SZWNWfSZsO+4pM5J+7+EOJxc51e0E+iqgOG5C3rGYZoSWksZ8kEVm9iXWrHnl5Scj3HDV7hoCTIDh9aEx4Kf83krIt398xKKOCtzFvU/A7NZ1Ix8+gQ4V/6mzI/PVkLYp6RZf+nZ/GybUcqIStV7Iwc4zugWUQCgGdHZs1L2Q4mLR0q4FYlNoyKrI+W4bkXp/BnjC2RSLphgRV0Ja/BejkLHSRFuVw/q/p++ny7vFQ4Lof08Z2OTPr0WBu+3O3mBTiHhf27/nsxDjBgPbeQ4EAgls0SWyBwmx2IIPq1vMhY0d/i0wASiFVBNNSalrcpRnuJmQtouKrBPZOicaHEwx0chMdMmCuI+VdtSM0ifZzvJIr2MUbRoP4HflTCNqZ+QJxUNj9qcqEVzqDgcBOdxKQ33FZZshRzzbEpVVoQGDkCP17vcKNVAdwjEvguDytw/szl8KI9jcZEu3DrLcej9ivkA6eljFNVajL4xpAXhl0ueFszRmpPx0TjrqFHMLE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(23010399003)(56012099006)(10067099003)(6133799003)(3023799007)(11063799006)(5023799004)(22082099003)(4143699003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZiElI/s56oVN7oysqBoEZ204Rs6GtgVuZLlW4XgxrmV/oGpW53R+W6L7H5v2?=
 =?us-ascii?Q?3UFHRWntlHeAtGKkQeMlC/UkXerHaD76dvPutpqZnb2Dpmn3sJWINPRjzcVD?=
 =?us-ascii?Q?WE82rW5yPUjsM2WIDQkywxkt2dilA5yJSccvZM6R+0vnmBrfSudWilw2UrQs?=
 =?us-ascii?Q?xk89VKZmvAmXlJErRz7G3lkIiwP2/dOqUB1R7Nre+X3ikCeUhgEoBoZgAgJs?=
 =?us-ascii?Q?4R4PyHlsIM/o3+awjcCLL7iZfw1ky2gyxOxRsmRxNh7F7KWYyEQc3090KHU6?=
 =?us-ascii?Q?qBQS95vYabD294/mm/1XJX9Xdhpy7wM5MP8J1AbiEf1VVy2n6x9S081Tr0oM?=
 =?us-ascii?Q?Oq9ZytqOtfBByfES+WBoGlM7V9XpBcGEOmZQWAs8zHRyUzsSUE4HRixhaax9?=
 =?us-ascii?Q?dJsq1xJNVGWA5+IhXFguJOASv1NzPhUTmzhSmHkg30WswP5NavgYV78B4qde?=
 =?us-ascii?Q?8IogKSfKf18VktTqx+w6CFmzfZ+pTenu9As5mqF7pEDjNKI/iKdTjf8wCkq2?=
 =?us-ascii?Q?E0PUTyMjjnhru3kYukLAnM3lNC2qng0pspliRR/c7SWjJAu104j5nIF14UNP?=
 =?us-ascii?Q?wbEbhkDA2h5SBvOt0YH6h/AoQAgi+SyaWM9MgSjJQV4J0RzLm0R+4dkAiSSy?=
 =?us-ascii?Q?+rmqb8zrvbU3z1RELxWyLJmTjf5qinOHSooHGRHWnDYns/VSLP+y0lhlD1rQ?=
 =?us-ascii?Q?Eaa28mFzuovNfoiqexx9bPcjCtNlzODRZHSAwlgaPOK8479RRffi1MUxXPNG?=
 =?us-ascii?Q?6OJaAb/MDmXCYwhDsOe3orSR3f+jD1OB07+RQYre7nLQqpp04fwl6QW2qRlK?=
 =?us-ascii?Q?pnXRmsM7vrt8HTNTUtdzBbGFIYIiyRgM2xYe9j02uu7JBk1xo6SEnPLGrhiE?=
 =?us-ascii?Q?dU82PbigctUAj1WNQGZiKhc1yZucHWJCuwxaXm7w8lRNt8WUQJcZ95qA5Q27?=
 =?us-ascii?Q?VSe2wSvi6XkqgtaroB1PrItF3S0CKktgS1/YBc9MXSITORQX5YaTy7yoQVCz?=
 =?us-ascii?Q?jWJo/1nzhfD14i5B+PiD8S7JdBmDU1ZkEXJn5WKWDOsmtSDhfRVUHlzSD354?=
 =?us-ascii?Q?MUoudN1Jl7PO2tWueD1MCDV1rLmanNW6rEbzLQ0coMkSesbY2YoxpunCKZxh?=
 =?us-ascii?Q?rVRCivQXtXu4wOT2Y/MTfj6j57lMQgkFpQjO4mg19YgRz3IUD6ipfaJrXwh9?=
 =?us-ascii?Q?JiSAwD8+oGQpCzkq+R0Rn5lYi/8l6maHmgoQvD4elY5egDy8Pj1j8LYQZJ7P?=
 =?us-ascii?Q?4yjLjFsKD9Q8SfFBlgB5iST2HM2K5EnTCAv9hZIMwUHAWOBHdPf3GhV0a7fo?=
 =?us-ascii?Q?tXPqnIZntFGDCCXWN+pnJDq5sTkrT5KkDvqB7hhmkUBrVYTApvDUxjRdPK9N?=
 =?us-ascii?Q?6k9FzZgnVrdR5T0JIPZAIjLV4d7vROdjJ4GDOYrZ3sj24gcpd/SRRCa3ndj8?=
 =?us-ascii?Q?SyVvfAkSh6xZUCiUWrmSfYnNi0GG+e5M3hmtbH36rpB8ZJzsNu7Y6FZ9nqMi?=
 =?us-ascii?Q?Arbcwlml65pSiAlHJl9q6Ap/PrVaGd3NGotte6f6CpD5Pzbt+7vniOFc4G3/?=
 =?us-ascii?Q?3YUQKyJpsd91z6nGhXjFfKQQaHYqlEAeN5KGnffVgZxhubH21fnbkUgdrWbw?=
 =?us-ascii?Q?IKzhlBzCuWUMBQvVwlfQCHKRhPaOsMi1E+7pXv84NoXVypgrrF1cym6/T6wB?=
 =?us-ascii?Q?QeWtkpUAMwyzDR9+8S5j7QeFde/yR514hDSpzpJUSiyDJk76Dp+1UB49rlSS?=
 =?us-ascii?Q?ygc8yNS9WQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 598dcb9e-f265-44bc-17c0-08df0384e524
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 15:15:42.4495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tf9zX6lztroPkfolJpjLtDYrfDSqSfnLt3JmJNVqiZGI85I3pPVyXLuN8isKyB+s14fmmlTAQK8cG8tITjCO1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11186

> > >   err =3D ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
> > >
> > >   if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
> > >           /*
> > >            * Signal was deferred until the FW/kernel protocol
> resynchronized.
> > >            * On success report -ERESTARTSYS for the interrupted wait;
> the
> > >            * command is not re-sent. Keep real errors like -
> ETIMEDOUT.
> > >            */
> > >           if (err > 0)
> > >                   err =3D -ERESTARTSYS;
> >
> > [Severity: High]
> > Could this leak firmware resources when a non-fatal signal arrives?
> > If a firmware response successfully arrives but defers a non-fatal
> > signal, this code overwrites the positive success size with -ERESTARTSY=
S.
> > Then in se_ioctl_cmd_snd_rcv_rsp_handler(), this is converted to
> > -EINTR and returns early without copying the response payload to
> userspace.
> > Because userspace never receives the newly generated handles (e.g.,
> > keys or contexts), it cannot issue cleanup commands.
> >
> > > [ ... ]
> > > @@ -660,11 +660,11 @@ void se_if_rx_callback(struct mbox_client
> *mbox_cl, void *msg)
> > >           se_clbk_hdl =3D &priv->waiting_rsp_clbk_hdl;
> > >           spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> > >           if (!se_clbk_hdl->rx_msg) {
> > >                   if (atomic_read(&priv->fw_busy))
> > >                           schedule_fw_busy_work =3D true;
> > >                   spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock,
> flags);
> > >
> > >                   if (schedule_fw_busy_work)
> > >                           schedule_work(&priv->fw_busy_work);
> >
> > [Severity: High]
> > Could this lead to a use-after-free of the priv object?
> > In se_if_probe_cleanup(), cancel_work_sync() is called to wait for and
> > cancel fw_busy_work before the rx_chan mailbox is disabled. If a late
> > firmware response arrives in this window, this callback will execute.
> > Because the callback schedules the work unconditionally if fw_busy is
> > set without checking going_away, the work could be re-queued after
> > cancel_work_sync() returns, causing it to access the freed priv object =
when
> the unbind finishes.
> >
> > > diff --git a/drivers/firmware/imx/ele_fw_api.c
> > > b/drivers/firmware/imx/ele_fw_api.c
> > > index 0000000000000..0000000000000
> > > --- a/drivers/firmware/imx/ele_fw_api.c
> > > +++ b/drivers/firmware/imx/ele_fw_api.c
> > > [ ... ]
> > > @@ -155,10 +155,10 @@ int ele_uapi_allowed_fw_cmd(struct
> se_if_device_ctx *dev_ctx, struct se_msg_hdr *he
> > >           /*
> > >            * Reject the storage-open request when another context is
> > >            * already registered as the command receiver.
> > >            */
> > >           scoped_guard(mutex, &priv->modify_lock)
> > >                   if (priv->cmd_receiver_clbk_hdl.dev_ctx &&
> > >                       priv->cmd_receiver_clbk_hdl.dev_ctx !=3D dev_ct=
x)
> > >                           ret =3D -EBUSY;
> >
> > [Severity: High]
> > Can this create a TOCTOU race condition?
> > The modify_lock is dropped immediately after checking the receiver
> > availability, opening a window before the command reaches firmware.
> > If two threads concurrently send ELE_STORAGE_OPEN_REQ, both could
> pass
> > this check and receive valid storage handles.
> >
> > > [ ... ]
> > > @@ -244,11 +244,11 @@ void fw_api_specific_ops(struct
> se_if_device_ctx *dev_ctx, struct se_api_msg *rx
> > >           rc =3D set_dev_ctx_as_command_receiver(dev_ctx, false);
> > >           if (rc)
> > >                   dev_err(priv->dev,
> > >                           "Failed to register %s as CMD-
> Receiver: %d\n",
> > >                           dev_ctx->devname, rc);
> > >           break;
> > >   }
> >
> > [Severity: High]
> > Following the race condition above, if one thread successfully
> > registers as the command receiver but the other fails here, the
> > failure to register only logs an error and returns void. Does this
> > allow the ioctl to return success, routing the second thread's
> > firmware callbacks to the first thread and allowing interception of NVM
> traffic?
> >
> > > diff --git a/drivers/firmware/imx/ele_msg_addr_field.c
> > > b/drivers/firmware/imx/ele_msg_addr_field.c
> > > index 0000000000000..0000000000000
> > > --- a/drivers/firmware/imx/ele_msg_addr_field.c
> > > +++ b/drivers/firmware/imx/ele_msg_addr_field.c
> > > [ ... ]
> > > @@ -51,7 +51,7 @@ static const struct se_cmd_addr_field
> ele_oem_auth_cntr_addr_fields[] =3D {
> > >    * Output buffers must be fully bounded; input-only buffers are saf=
e
> with
> > >    * addr-only checks.
> > >    */
> > >   { .lsb_idx =3D 1, .msb_idx =3D 0, .has_msb =3D true, .flag_idx =3D
> SE_CMD_ADDR_ALWAYS,
> > >     .size_idx =3D SE_CMD_ADDR_NO_SIZE },                    /*
> container_hdr_addr */
> > >  };
> >
> > [Severity: High]
> > Can this unbounded input buffer allow arbitrary out-of-bounds DMA
> reads?
> > The descriptor specifies SE_CMD_ADDR_NO_SIZE and a zero buf_size,
> > which bypasses end-bounds checks. If a malicious userspace process
> > places the buffer at the very end of the shared memory window and
> > crafts a header with a huge size field, couldn't the firmware read
> > beyond the mapped shared memory window into unmapped space and
> trigger AXI bus faults?
> >
> > > [ ... ]
> > > @@ -138,7 +138,7 @@ static const struct se_cmd_addr_field
> ele_keystore_reprov_en_addr_fields[] =3D {
> > >    * memory the caller already owns. Output buffers must be fully
> bounded;
> > >    * input-only buffers are safe with addr-only checks.
> > >    */
> > >   { .lsb_idx =3D 1, .msb_idx =3D 0, .has_msb =3D true, .flag_idx =3D
> SE_CMD_ADDR_ALWAYS,
> > >     .size_idx =3D SE_CMD_ADDR_NO_SIZE },                    /*
> signed_msg_addr */
> > >  };
> >
> > [Severity: High]
> > This appears to be another instance where an unbounded input buffer
> > might allow arbitrary sized DMA reads by the firmware. Is there a way
> > to safely bound this input payload?
> >
> > > diff --git a/drivers/firmware/imx/se_ctrl.c
> > > b/drivers/firmware/imx/se_ctrl.c index 0000000000000..0000000000000
> > > --- a/drivers/firmware/imx/se_ctrl.c
> > > +++ b/drivers/firmware/imx/se_ctrl.c
> > > [ ... ]
> > > @@ -746,10 +746,10 @@ static void se_if_probe_cleanup(void
> *plat_dev)
> > >   while (true) {
> > >           dev_ctx =3D NULL;
> > >
> > >           scoped_guard(mutex, &priv->modify_lock) {
> > >                   if (list_empty(&priv->dev_ctx_list))
> > >                           goto out_done;
> >
> > [Severity: High]
> > Is there a devres initialization order issue here?
> > Because devres actions execute in reverse order (LIFO), modify_lock
> > will be destroyed before se_if_probe_cleanup() is invoked, since it
> > was initialized after devm_add_action_or_reset. When the cleanup
> > function later attempts to lock this destroyed mutex, could this lead
> > to undefined behavior or crashes during device unbind?
>
> Please check this
Accepted and will be fixed in v43.

>
> >
> > > [ ... ]
> > > @@ -1151,9 +1151,9 @@ int set_dev_ctx_as_command_receiver(struct
> se_if_device_ctx *dev_ctx, bool is_io
> > >   if (se_clbk_hdl->dev_ctx)
> > >           return -EBUSY;
> > >
> > >   if (!dev_ctx->strg_hdl)
> > >           return -EINVAL;
> > >
> > >   if (is_ioctl)
> > >           return -ENOMEM;
> >
> > [Severity: High]
> > Does this check render the SE_IOCTL_ENABLE_CMD_RCV_STATUS ioctl
> broken?
> > When se_ioctl() invokes this function with is_ioctl set to true, it
> > will unconditionally return -ENOMEM here and the command receiver will
> > never be registered via the API.
>
> Please check this
Split the function into two, to make it acceptable.
>
> >
> > > [ ... ]
> > > @@ -1532,9 +1532,9 @@ static int se_ioctl_get_mu_info(struct
> se_if_device_ctx *dev_ctx,
> > >   struct se_if_node *if_node;
> > >   int err =3D 0;
> > >
> > >   if_node =3D container_of(priv->if_defs, typeof(*if_node), if_defs);
> > >
> > >   if_info.se_if_id =3D 0;
> > >   if_info.interrupt_idx =3D 0;
> > >   if_info.tz =3D 0;
> > >   if_info.did =3D 0;
> > >   if_info.cmd_tag =3D priv->if_defs->cmd_tag;
> >
> > [Severity: Medium]
> > Are these structural identification fields intentionally populated
> > with hardcoded zeroes? Setting se_if_id, interrupt_idx, tz, and did to
> > 0 prevents userspace from dynamically identifying the secure enclave's
> > type or configuration.
>
> Is it true?

In earlier version, it was populated by instance id. There are multiple ins=
tance id for i.MX95, and onwards.
For i.MX8ULP, it is only one instance id, that is 0.
There was a comment to remove that field. Will add this filed with the patc=
h-set that enabled i.MX95.
Hence, it is correct what it is now.

>
> Frank
> >
> > > [ ... ]
> > > @@ -1614,11 +1614,11 @@ static void cleanup_dev_ctx(struct
> se_if_device_ctx *dev_ctx, bool is_fclose)
> > >                           struct se_if_device_ctx *tx_ctx =3D is_fclo=
se ?
> dev_ctx :
> > >                                                   dev_ctx->priv-
> >priv_dev_ctx;
> > >
> > >                           if (dev_ctx->strg_hdl &&
> se_close_storage(tx_ctx,
> > >
> dev_ctx->strg_hdl))
> > >                                   dev_err(dev_ctx->priv->dev, "failed
> to close storage.\n");
> > >                           if (dev_ctx->sess_hdl &&
> se_close_session(tx_ctx,
> > >
> dev_ctx->sess_hdl))
> > >                                   dev_err(dev_ctx->priv->dev, "failed
> to close session.\n");
> > >                   }
> >
> > [Severity: High]
> > Will firmware session handles leak if a process exits via a fatal signa=
l?
> > If se_close_storage() encounters a pending SIGKILL, its
> > wait_for_completion aborts instantly and arms the fw_busy circuit
> breaker.
> >
> > When se_close_session() runs immediately afterward, it sees fw_busy is
> > set and aborts the session close command without sending it. Does this
> > permanently leak the session handle on the secure enclave?
> >
> > --
> > Sashiko AI review *
> > https://sashiko.dev/#/patchset/20260825-imx-se-if-v42-0-2e8efac0bb16@n
> > xp.com?part=3D5

NXP Confidential
