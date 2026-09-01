Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013016.outbound.protection.outlook.com [40.107.162.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423B543CE46;
	Tue,  1 Sep 2026 16:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278854; cv=fail; b=oCHP+4fl2yeANd3OHGcdLVQBfRU+nVbz6XMMsV4HnrltI3WWoG9TSM9jvOW15rW40ux8z1P/AAUF+W18C6gLHGyl9xTJ0I/LOAvpzBzWMokjA3arR0vqirKkqQKTWiwCX44w1DvQW9YytDhczoT5ETx7DiWcr1R7I4eZKzGBoJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278854; c=relaxed/simple;
	bh=h3RO1Hv4hNtWOlrM89pLmnhIP7/70Pj5NKwF23uInwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cL0Ly80Ip7+F+8J27TNLbUa64gPMkKMpJje1jj/TR4jnXPjDxz42FODvgK5GbZJt2nQsgADJVBOCTqnJCREzj/i3/nmS48KYj8M7wMioAdaZJrK6AXxiCHJz1R1D1T8fp5dIENOoLd4/6qYavZMTPdY316ZJNAlZBl+kjaE2ruE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NHHUunsu reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NHHUunsu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+FvTn5tW52xiNyDTzYHelGB6vkARIyG24cuJrzhGWBGtxHw4fBowrtaM2jMpNMjY2Qv4EMiqp7VOfjbA4vpTeBuvabPdcH9MJK5FW0Ky1v0wSrQjU+GWnWz9qTRLRNUrKbdqYhaomQ2D25dFd8WOhJA76voBT20i/DXhMI+sr7mgVo1Z9xkv3/c9oAyBttuqsp5bkrwTzXrdkJlRIAyMfEBh7GtTcA3dheLZwa2fXmM2RVHTe79v8i1aqQsDxpYgtyPCzBaglmBMhdd/s58KouU50A4ZWeVfpbqIwMpbIbfZclt5Rywpd4zOTTOJCZD/KDWe8++48n2HgppddTl0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wqon2cQYgTHT/XzuaUb0aLpxMZSiuI2IIZZcLUyjkM=;
 b=H9Q+oBzelM+tmA0GFdurVXvLTsJURrrOmibHlLXoyqhy9rzGofqhVX879d9n4N+lblQGkdUkXdjRxCFHTzdwPrSSMhFBwCPjRdaclZzqQMuuUjaVGWIHPJaOs+BHt8NdUEbC/8PSUCjxBj4MKcYwKucsU9snTqFzEu6MkKRH+GGDhD0UBxS9Ohnk4d47GN9rczgT3rs2Mpj9x+/jN83iaCVhuhvhZFDQQPrzaTDwiSY3BoO9tDGnb26tmt5d0z+bc/WwjyCovEysxqJ7jr9MAbgs4VTx0jCWLc1yawKregVk4t6iJRjM5WTpyME7ppYZicXkIOS/FbfzJ8uY/3dcQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wqon2cQYgTHT/XzuaUb0aLpxMZSiuI2IIZZcLUyjkM=;
 b=NHHUunsuqVThQeVxHYshdWJuNinbxe+edZcCt5ScNdYO5q/6DYUXoXlH9r0s8HgapVTljYzh+ov5eHEHB58PWi5M1p93cbPy0jz9ditLfSrsPcJYYN+ooyzbPLAQFvrbvmk9I8iA8PSmJtJo9zc/NXEVzCoUy2s+brHvWBoRImd7ZosA9djKGYT1TvcEKWyaE3JRdISmcmhv8hTiJrO2OdWd3/1Sefm0NLoPQvwbWg5tgVNz2klw/+viL6830Wbu9rZt4A7r9GlKql9BDLIAAltNNVfWny16nU/jbn7FOutgm+M6D4GI2LX0Cv+vHUhwC7K1r6GXnjCOuMV+PL+SAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10291.eurprd04.prod.outlook.com (2603:10a6:800:245::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 16:07:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 16:07:26 +0000
Date: Tue, 1 Sep 2026 12:07:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>
Subject: Re: [PATCH v43 5/7] firmware: imx: adds miscdev
Message-ID: <apb4NwD6WnHHOb01@lizhi-Precision-Tower-5810>
References: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
 <20260831-imx-se-if-v43-5-a3deadbda4ef@nxp.com>
 <20260831070508.252E01F000E9@smtp.kernel.org>
 <GV2PR04MB12271118795C0D2201499034495A82@GV2PR04MB12271.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GV2PR04MB12271118795C0D2201499034495A82@GV2PR04MB12271.eurprd04.prod.outlook.com>
X-ClientProxiedBy: CY5PR15CA0200.namprd15.prod.outlook.com
 (2603:10b6:930:82::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10291:EE_
X-MS-Office365-Filtering-Correlation-Id: 24bc9248-1bfd-4b8f-0dd5-08df08431d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|3023799007|10067099003|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bfLbx0tiSPk/aKiTlyuy+92Cenywh1FszqpFQ291dDJjEW9nM7TQlXtQNRUEhoNl3xb75DMMpXtQMStGUQDqfire2FjU4WDuUvnIC2QIVGJ8+GTQJbLGTz+rS2ezJa4SDl8R/aF+S7OFfmj//N/DETsyjzWnynQMYL1VkSEU+b16UKhNrNxbQOu2tBWtzIxLpnVC7CTVS8AC7gqnxUBlN8fqrfNvhHTQCF7B6VjKwyV6ydYCcpy12YNe0Y9z/QB3d6GfzP9N7RG3SRhtPLe9csd3Z2sZay3Jmw/ueKn9m/WbTG/CBJUgMS9zlzgvUiWklKhlv3j6OTKq4D8Kiie2jVzsg2ykf37s9iOaA48/Wbjn9p30Ok0Jzj7HSLWFEl/ifLnHlRGDMjRWmqEmLXoClpEPpj0crH36rd+yFUo56gAElyjzYxClG8tLQg/XUXBi7cu7Nyx5oySdLOXMA4gGurHBXBDWHvuWv/Vi1nr9JjxXGFn9GreoQT75tNtJ4Wn1+PFB8rvQjZMsaiUfE38yolxx35Aw5GDaFG/NxGudVRHBJiUXLSOwGyLHiBFWaRKsfzNnfLqiP/AoiQrjoMX9usAAwiVRLoRJh89bWzXeMqo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(3023799007)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?BGuMeHg1FwLY0X+LdUC4JSxM20fO92pahrHHtHkU317datkzIqCbtghRXk?=
 =?iso-8859-1?Q?k+5RPW+PvMh/WY7dLwbRqfFvWRe7xSJMo1T0VZghCDyvVXEVtp31RMVfp4?=
 =?iso-8859-1?Q?SwMdawWkWEbudtGNv6hsD6ow2UL3ybUJ0NJEHJpkpUYelK2kevdY00V4R7?=
 =?iso-8859-1?Q?6UPnY2zVtGWkOUe0THstlfkpJ3/4A/t8bk9ETWN45QRMWD7yhPiSDJXSGr?=
 =?iso-8859-1?Q?MD/DW2JTGDUXWNSYtyRW/QkTt5hHjNxhshmaUfryGMpLzhwiFBOzJYq6Ht?=
 =?iso-8859-1?Q?daj4pRivpFsa09b+f3bBmfldfDl3NTLcO44GwoPX9FTvJAOPZJzVw/fLSW?=
 =?iso-8859-1?Q?PSIK1mqDGIu1RXSKa9ybVW4lECjjX3cnI2bpD7Za2b8s/B94ziioTxv9s5?=
 =?iso-8859-1?Q?6thjRHW7THa1du1kh9Ux7s/lzhPKmK9MlGNsMnbtAu6rEE/pq4ww8g1I74?=
 =?iso-8859-1?Q?SU0kP7l8bGKXCpcR+erJlh9Mw3uoVufW/VUnpvcWWf1OSFSz9PFVt0SkZW?=
 =?iso-8859-1?Q?JONrV0FUukc9LtQ9uWNCbfneSinn1KSGxoIxOKIEGpQkfy4tCaijQkp9hG?=
 =?iso-8859-1?Q?Heiwm9jhVmOAxOjkMbZhQYhENAbOxo+ZynIFQCbp0soX0BIEVR5OYvX6Np?=
 =?iso-8859-1?Q?Ufrz0MHwkKUTAcctbHzKCVtWgkbXVGnV3e53z25Bcm5/qdNNvO7JzIlm0S?=
 =?iso-8859-1?Q?IVjO71YJmyl9Sgxidkxtjbl8oASkIQLZNzI1kChOkyv543iaXvE7G5IGPW?=
 =?iso-8859-1?Q?Ht/wfGUpiZ2LboRGT5/yFilSL4YZPWkVPoGs/ODboVU0f4m+OtBjbAFboi?=
 =?iso-8859-1?Q?BlP2HsBWGAJpStGBDzOJHRV+foKJe2dXhctsmePhppcHPlUUW8j8qtgRby?=
 =?iso-8859-1?Q?6NVS3oOCpZXCmr2xN6TWiJXpKq1y1dHEvORmjwKsCyHnSwwbEBE7xn19rH?=
 =?iso-8859-1?Q?nnEd5mN02yfHpAHYfOtlqFCdg+jhUldgoGokTRUA3+jaGQIezMdXIt6Awx?=
 =?iso-8859-1?Q?onUZY8ouVQU3bJlRZNP/bNGVzC4s0rZp6iKOYaFkQoXaFD9b+mi5y2tzsX?=
 =?iso-8859-1?Q?12Bmpvq3ZZD7EJik7niYBN/nHspa8aecarbjiWrhJx125lf/NgEG7fyzVx?=
 =?iso-8859-1?Q?9fmEodYEem0OdZ0x52ocQ2ZFPuFkBJYgqharnFRcm8FcM8VGlyG4KLYBGE?=
 =?iso-8859-1?Q?4/vGECi4hHFlAzUAtyDYliYqFyxWg0+YdZlIFy2zKn7H9sD0bVBHEzpMU9?=
 =?iso-8859-1?Q?i/SsYbNQNn6U9ZLxsl5acFBGgXfZ75eGJf22LHW9KTqKDTfyd5QlTXWt3Q?=
 =?iso-8859-1?Q?AeRAUKeKG3F4X6cgRYibG6uJrZi/2wYo0oM8qv6jcekV15JTQmW0HoGOJ1?=
 =?iso-8859-1?Q?i6x0kDPZV3VAEOTlRLttazA/4APqWQiJgZ6cz2FTznnq5B/8N6GAjDL43D?=
 =?iso-8859-1?Q?R3ovcpugIK2cZl6IFQ4fxjy4MZoEB72g6Ume8FRyAthczW/Wra1fuBgX/Y?=
 =?iso-8859-1?Q?P/oVfVcAxVCB1SI7tTbus+GTjukuL5k/ByJEWXARKXw+HltdTC9K1nOCCY?=
 =?iso-8859-1?Q?1sagY7odAZ4dtyvkfuZ7WJhbYDjG3UdZ5yVqMWZbME7uVNN4TKbBrLweQ3?=
 =?iso-8859-1?Q?3i4PkH7jjDAcVPqvBq35KUwG6YnW5wCxN+8lr9zTZ5wyhgol83O/eOpelG?=
 =?iso-8859-1?Q?IOCONVJxjezsviJ5e1Wq0V1ZDA6TeOZrnaSvg3AU9w6PXEq5Yv5aG+1mZl?=
 =?iso-8859-1?Q?8jjcPzvXFmpKCSRBCKLG2tRlDPcJW0yaWX3MiMxCmsa6n2TyzFvMET7Epm?=
 =?iso-8859-1?Q?k4aIvpfBZXYjEDOO2FFtmUqmngJZV7g=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bc9248-1bfd-4b8f-0dd5-08df08431d6c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 16:07:26.3543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMQBw2s0sUqbY9uElyXyaBNIp7GWdUlaXR/MIVXDbynbtf0HZrdIBWET18ts/8/yP8zJjWEW9kNcZbeAwh71wNJR+yLeG+UT7orPnVpEUAo23DFQzrtP0ql5pqS3NUqF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10291

On Tue, Sep 01, 2026 at 03:52:35PM +0000, Pankaj Gupta (OSS) wrote:
> > > --- a/drivers/firmware/imx/se_ctrl.c
> > > +++ b/drivers/firmware/imx/se_ctrl.c
> > [ ... ]
> > > +           switch (cmd) {
> > > +           case SE_IOCTL_ENABLE_CMD_RCV_STATUS: {
> > > +                   guard(mutex)(&priv->modify_lock);
> > > +                   err = check_cmd_rcvr_status(dev_ctx);
> > > +                   if (err)
> > > +                           dev_err(priv->dev, "Failed[%ld] to register %s
> > as CMD-Receiver.\n",
> > > +                                   err, dev_ctx->devname);
> > > +           break;
> > > +           }
> >
> > [Severity: High]
> > Is it intentional that se_ioctl() only checks the status here but does not actually
> > perform the registration?
> >
> > It appears set_dev_ctx_as_command_receiver() is never called, causing the ioctl
> > to fail its intended purpose and always return -ENXIO if not already registered.
> >
>
> NOT A BUG. SE_IOCTL_ENABLE_CMD_RCV_STATUS is a status-query IOCTL, not a
> registration IOCTL. Its purpose is to report whether the calling file descriptor
> is already the registered command receiver, via check_cmd_rcvr_status().
> Registration is performed by set_dev_ctx_as_command_receiver(), called from
> fw_api_specific_ops() during the storage session open flow
> (ELE_STORAGE_OPEN_REQ). The error log message "Failed to register" is
> admittedly misleading but the underlying logic is correct. The log message
> will be improved in a follow-up cleanup patch.

Maybe error message "Failed[%ld] to register %s as CMD-Receiver", miss
leading AI.

SE_IOCTL_ENABLE_CMD_RCV_STATUS
	 ^^^   also miss leading, according to you description, look like

SE_IOCTL_GET_CMD_RCV_STATUS

Frank
>
> > [ ... ]
> > > +static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
> > > +                                       void __user *uarg)
> > > +{
> > [ ... ]
> > > +   rsp_status_err =
> > > +           se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg-
> > >header.command,
> > > +                                   rx_msg->header.size << 2,
> > > +                                   tx_msg->header.ver == priv->if_defs-
> > >base_api_ver);
> >
> > [Severity: High]
> > Could passing the firmware-declared size (rx_msg->header.size << 2) instead of
> > the caller's allocated size (rx_buf_sz) lead to out-of-bounds reads?
> >
> > If a user submits an intentionally small rx_buf_sz, the subsequent validation in
> > se_val_rsp_hdr_n_status() and fw_api_specific_ops() might read past the
> > bounds of the allocated rx_msg buffer when accessing data[0] or data[1].
>
> NOT A BUG. se_val_rsp_hdr_n_status() only accesses msg->header fields (tag,
> command, size, ver) and msg->data[0] (the firmware status word). The sz
> argument is used solely as a consistency check against header->size to detect
> a mismatch; it is never used to index or iterate over the buffer. No
> out-of-bounds read is possible regardless of what the firmware header claims.
>
> If userspace provides an rx_buf_sz smaller than the firmware response, the
> MU/mailbox layer silently truncates the response. This is a caller contract
> violation: the userspace library (plat_os_abs_cmd_snd_rcv_rsp()) is expected
> to allocate an rx buffer matching the maximum expected response size for the
> given command. Returning -ENOSPC in this case would orphan any
> firmware-allocated handle (the firmware command already succeeded), creating
> inconsistent state between firmware and userspace that cannot be recovered
> without a reset.
>
> The correct handling is a dev_warn diagnostic only to flag the mismatch to developers.
>
> >
> > [ ... ]
> > > +static int se_if_probe(struct platform_device *pdev) {
> > [ ... ]
> > > +   ret = devm_mutex_init(dev, &priv->se_if_cmd_lock);
> > > +   if (ret)
> > > +           return dev_err_probe(dev, ret,
> > > +                                "Failed to init mutex: priv
> > se_if_cmd_lock.\n");
> > > +   ret = devm_mutex_init(dev, &priv->modify_lock);
> > > +   if (ret)
> > > +           return dev_err_probe(dev, ret,
> > > +                                "Failed to init mutex: priv modify_lock.\n");
> >
> > [Severity: High]
> > Does binding the lifecycle of these mutexes to device unbind create a use-after-
> > free risk?
> >
> > Since priv is refcounted and can outlive device unbind (e.g., if a file descriptor
> > remains open), closing the file later calls dlink_n_cleanup_dev_ctx() and
> > cleanup_dev_ctx(), which will attempt to acquire these destroyed mutexes.
> >
> BUG - FIXED in this series. You are correct. devm_mutex_init() was used for
> priv->se_if_cmd_lock and priv->modify_lock. Because priv is reference-counted
> (kref) and can outlive device unbind when a file descriptor remains open, the
> devm cleanup at unbind destroys these mutexes while they are still reachable.
> A subsequent close() would acquire a destroyed mutex - a use-after-free of
> mutex state.
>
> Fixed by replacing devm_mutex_init() with plain mutex_init() for both mutexes.
> The mutexes are embedded directly inside struct se_if_priv (not separately
> allocated) and are released automatically when kfree(priv) runs in
> se_if_priv_release() once the last kref is dropped. Explicit
> mutex_destroy() is added before kfree().
>
> > [ ... ]
> > > +static int se_if_probe(struct platform_device *pdev) {
> > [ ... ]
> > > +   priv = kzalloc_obj(*priv);
> > > +   if (!priv)
> > > +           return -ENOMEM;
> > > +
> > > +   priv->dev = dev;
> > > +   /*
> > > +    * Pin the parent device for the lifetime of priv. A file descriptor may
> > > +    * stay open after the device is unbound; close() then still passes
> > > +    * priv->dev to dma_free_coherent()/dev_warn(). Without this reference
> > > +    * the struct device could be freed while priv->dev still points at it,
> > > +    * so the reference is dropped in se_if_priv_release() via put_device().
> > > +    */
> > > +   get_device(priv->dev);
> > > +   kref_init(&priv->refcount);
> > > +   priv->if_defs = &if_node->if_defs;
> > > +   dev_set_drvdata(dev, priv);
> > > +
> > [ ... ]
> > > +   ret = devm_mutex_init(dev, &priv->se_if_cmd_lock);
> > > +   if (ret)
> > > +           return dev_err_probe(dev, ret,
> > > +                                "Failed to init mutex: priv
> > se_if_cmd_lock.\n");
> >
> > [Severity: Medium]
> > If devm_mutex_init() fails, does this function return directly without cleaning
> > up?
> >
> > It appears this would leak the priv structure and leave the device reference
> > unreleased, since devm_add_action_or_reset() has not been registered yet.
>
> NOT A BUG after the fix above. With the change to mutex_init() (which cannot
> fail), the early-return path at devm_mutex_init() no longer exists. There is
> no leak because mutex_init() always succeeds. No additional cleanup path is
> needed.
>
> >
> > [ ... ]
> > > +static int se_if_fops_open(struct inode *nd, struct file *fp) {
> > [ ... ]
> > > +   priv->dev_ctx_mono_count++;
> > > +   err = init_device_context(priv, priv->dev_ctx_mono_count, &dev_ctx);
> > > +   if (err) {
> > > +           dev_err(priv->dev, "Failed to create dev-ctx.\n");
> > > +           goto out_unlock_misc;
> > > +   }
> >
> > > +static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx) {
> > [ ... ]
> > > +   se_shared_mem_mgmt->non_secure_mem.ptr =
> > > +                   dma_alloc_coherent(priv->dev,
> > MAX_DATA_SIZE_PER_USER,
> > > +                                      &se_shared_mem_mgmt-
> > >non_secure_mem.dma_addr,
> > > +                                      GFP_KERNEL);
> >
> > [Severity: High]
> > Does this code allow unbounded DMA coherent memory allocation?
>
> NOT A BUG. init_device_context() calls init_se_shared_mem(), which calls
> dma_alloc_coherent(). If the CMA/DMA pool is exhausted, dma_alloc_coherent()
> returns NULL and the error propagates as -ENOMEM back to open(), which fails.
> This naturally self-limits allocation: once CMA is exhausted, further open()
> calls fail with -ENOMEM. The kernel's CMA pool size is a system-wide tunable
> and the driver does not need to impose an additional per-device open count
> cap on top of that. No change needed.
>
> >
> > If a userspace process repeatedly calls open() in a loop, it seems it would allocate
> > 128KB each time without any limit, which could quickly exhaust contiguous
> > DMA memory.
> >
> > > diff --git a/drivers/firmware/imx/ele_msg_addr_field.c
> > > b/drivers/firmware/imx/ele_msg_addr_field.c
> > > --- a/drivers/firmware/imx/ele_msg_addr_field.c
> > > +++ b/drivers/firmware/imx/ele_msg_addr_field.c
> > [ ... ]
> > > +static const struct se_cmd_addr_field ele_oem_auth_cntr_addr_fields[] = {
> > > +   /*
> > > +    * Container Header address: a 64-bit physical address split across two
> > > +    * words. data[0] holds the 32-bit MSB and data[1] holds the 32-bit LSB
> > > +    * (ELE API spec Table 27, word size = 0x3, so the command is header +
> > > +    * MSB + LSB only). The message carries no length word for this buffer;
> > > +    * the container size is variable and not communicated in the MU
> > payload,
> > > +    * and no static firmware-defined maximum is specified. Because this is a
> > > +    * read-only input buffer (the ELE ROM/FW copies the container header
> > > +    * into its internal memory for authentication and does not write back
> > > +    * through this address), enforcing only the start-address range check is
> > > +    * acceptable: a rogue caller can at most cause firmware to read within
> > > +    * the shared-memory window, which is memory the caller already
> > owns.
> > > +    * Output buffers must be fully bounded; input-only buffers are safe
> > with
> > > +    * addr-only checks.
> > > +    */
> > > +   { .lsb_idx = 1, .msb_idx = 0, .has_msb = true, .flag_idx =
> > SE_CMD_ADDR_ALWAYS,
> > > +     .size_idx = SE_CMD_ADDR_NO_SIZE },                    /*
> > container_hdr_addr */
> > > +};
> >
> > [Severity: High]
> > Can the lack of size validation here allow the firmware to read past the bounds
> > of the allocated DMA buffer?
> >
> > If a user submits a command with an address pointing to the very end of the
> > shared memory window, the firmware might read unmapped or unowned
> > memory, potentially causing an IOMMU fault.
> NOT A BUG.
> Both ELE_OEM_AUTH_CONTAINER_REQ and ELE_KEYSTORE_REPROV_ENABLE_REQ pass
> read-only input buffers; firmware never writes back through these addresses.
> A rogue caller can at most supply invalid authentication data, causing the
> firmware operation to fail - not corrupt kernel memory. Firmware is
> responsible for container bounds validation. If firmware reads past the
> shared-memory window, the IOMMU will fault and the access will be terminated
> by hardware before any kernel memory is affected. The original
> SE_CMD_ADDR_NO_SIZE entries with buf_size = 0 are correct and the existing
> comment in the source already documents this design decision. No change needed.
>
> >
> > --
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260831-imx-se-if-v43-0-
> > a3deadbda4ef@nxp.com?part=5
>
> NXP Confidential
