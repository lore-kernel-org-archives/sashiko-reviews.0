Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1717F352007
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 20:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781728905; cv=fail; b=X7M7S4j9aVelmC7i7/ZrXZA65ZuW1bFOmORLQI0VrugpMz5nwtB2yQKhlSJof9kl1GRQLvd9VGDFzBoa0+RXz/d3pXrGiZLN7/Fou7Kur/gkAHQeHKcWyvKVPASSRKaNqoFfIKqttI/uRTSe8G5sLn9yeUdmv2XZq3NPIR2gGhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781728905; c=relaxed/simple;
	bh=ib3NK5fd/mD5WEjgYHQtN1R/tT13kNZr3EeBFIgOQD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=awn6Eu4y6I8D0CAX6nYA4ndY3Dimh8ru5vCOylWLSE7iZK0YZFkyci+HHomJBeDvC1HLRnKkbvAKTLXyiHvCn0gwHf2FEwpLG5pInVwUo1GzCeMR1bRcyO/s5JoPmsfajvt5Wgcn/tOawzwGzzg1f6vPcAkAflry15UznRkjk+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kIfXYCZZ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kIfXYCZZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntS1JKe5M6RDexZ/4x6ktkoXg/S5Oub63nk5toaQwjlpnVKM9++ZzfmCQBtElZvlcpOplm4xlAY7ujGQ5tdKmExCbHDNigsChkNcz0cqWxOis9mkKEMCVbTG3yhRX+WuCBxI7d/8x75Siz0F8RhqBpXlKjhYh/UN5JHkqUfHPZ5kKrRHu4IzZRyo4zzWQd5ZhCapqD0wSeLX3z/Y9oNJcO5VRjFkgQfCvJAeF7unVYG1cojbm8/hHW1aHDyjISonqks60KGdV7SisED/DUtmDq/OPSfG83AgPDbD345AK5GOL1cJ3meW18w2bjUsGHSOUx3I4nQkc8w54J7pWQ1qWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DO3m5N1ew/dd012KjG0E2kF1rVWTQHZpDgOxRDlcZas=;
 b=OZisQ3V1yO0UySPKq77SxuxLJ7rPO/g/OP0eP6DofcLLMWYxI6v609ku5e+mv9os+SA/xmJ7CwMtdypV9cJ6fhn3CdzCXq5PSULK7qr1npVeJMIuJvCFp/Yg2ybKqjJyJ8ryyykhjHNshO/a0gwCgjY/hptoTu7ZcOR7iLdueOjNDxl7ZchIjylEXNyS2v8Hij1lH6ahQWR6B74oHy+o0LH3It40nLpQbvnwMtb/8mUqrsvHzjmzsJJav1lv1sLt3CNZJzN83Tm8jJ3h7EP4PuSlNoF/OliTO9JFL9i6xE8rzCOaCkO+vU9capmZ+QFEhozVQS/rlmgE2q/4v8ZvTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DO3m5N1ew/dd012KjG0E2kF1rVWTQHZpDgOxRDlcZas=;
 b=kIfXYCZZ2vvqmyDGdOsKgsv8CjAWbcGr20+wgHE3B3CPn96o2MdCTGf1RWeGKjXPX4+1majkm92kNiPiTJ6ruwFnf44MwOpdsbsOv2aGekKKCSSeaWc8lrZahVUixYUAXSdZlQviHkv1IKsoe1BuiMOxbnDbu1O777Vu0S5yBqI55aD0TSL4LcMNILCoxKY+pFUr4UyeU7NMgsTH8XO3bcgcT9Q0QUtotzPZtzkBP9YQuSXxdwYQEQoMths4G2Q+jlOpqzYXXMdqdROfLshSGPqNLI+/UifqlPDRYBInF0hP3X89sRSwCKlXpIWkwAYYvUiN7CP+0LQJxiYByUGMYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB7179.eurprd04.prod.outlook.com (2603:10a6:10:124::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 20:41:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 20:41:39 +0000
Date: Wed, 17 Jun 2026 16:41:32 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Runyu Xiao <runyu.xiao@seu.edu.cn>, linux-i3c@lists.infradead.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH] i3c: master: adi: initialize the lock before enabling
 interrupts
Message-ID: <ajMGfHq6f-sEOft7@lizhi-Precision-Tower-5810>
References: <20260617150138.628578-1-runyu.xiao@seu.edu.cn>
 <20260617202258.E16421F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617202258.E16421F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH8PR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: 85365430-8be4-4f8e-3e2e-08deccb0d527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|3023799007|22082099003|18002099003|11063799006|56012099006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	lfl4jdP+W0SChGgYGjXkjxX0OM9ln4uvqvYi25fZfURKgQB+H4S+DjR3vzFXWICrpxvb3L5PxG5udRdFweVaIxP6vp1wy03/peqkiebNVmdSz5ps8NTH2ZbHQEgCxOnpb2DmtdHsxFmhnnNf68VKAX5uhYyYW6NGXKYNLPD6zoiud797+w4LJWpTO9fFZlYagttuu0A+yQIto0XRjkiliJSHcC2Z5huLYXEJB5SifYVCiDEgxi1/XqcMNRYF8laUq7Bkbuaek7ave0UDRzQPbZqPFuJ2FizZvq7yslS/1LKWnG08a5WNKn50DI3hq/0nSGJjufp5k5I4fI/3zTUIbTIlj5iRKkS440JVU7sAirfOc/9SwHW3YZRM9Zfcz8kcR/l4D1cFkbUsIukRLd8IlZjozBxipUBfRxoQ3AjsxnYUnt6tlcI+ZKkHmc+QFrVJKcOMpDgBAb9VSP1JEnPsgBCrZr49JzcnN+V34b8MGdPpg0Vbry43M+IYozKcfnKTgoG69D/jqjcMGosghZP+LVzQXKhFUzvYq42Nc3s/GjApAdi32X4IrDhbk54Pv2Y2mE1utK6Q/EbPYpWtfq2f5yp+PfxMBfSHLtvzW0IXxSz7t/e7DC9+lgpyMnR2WIGWC6rG9FZXh5f4LY0Keo7SkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?dIHdIchCPrdvZiW1gqrvRcCTkc65+W4TISTpLdtjFg2Yz6v1f+x9puLphV?=
 =?iso-8859-1?Q?TIRXLfzBN/Kyw6AeuaX3aXjv/OEQTXdLiCzgRrpMtjGehgcgvmhKoAJyzi?=
 =?iso-8859-1?Q?fapDCW6NosB0+Z7yLSK+MtDg391W158qYrjaEJgXnB+kT0XWGomY+iUcc/?=
 =?iso-8859-1?Q?8pAEFlqOl/TZ+dYfaPmVQz3hrEsgSoOggPRbpxJ1Vi6WJ5qwMf4pGLcjKQ?=
 =?iso-8859-1?Q?NOztyMUaG9UTL2yt5VbUfgfAJDQNjttzsPnPG3gpFwpk813inK9UCCmX5w?=
 =?iso-8859-1?Q?wGmtklc+e0zXpvS5XwVWmzHqZxswpHmLGbaU7fY3ivBrMZHMXVgLM71qHv?=
 =?iso-8859-1?Q?oIdxyteE50/Zsf9QZl4h+eRMaoCbEEkYrG/0sZ57IdJ+RBqzjmdMwwkkFd?=
 =?iso-8859-1?Q?AGyhKmxhpbtYfJAPl5TAVfGLEXYO6EvGo3d10yvLdzwtBnw02eNLtIE045?=
 =?iso-8859-1?Q?FCrGPLTB9hWBHSomInaMYgvz0a7oz/tu9LEYqAEtgtHOfJ3sHnJhL+gt+g?=
 =?iso-8859-1?Q?e34MCmhvY7MJu46Uho7+N+pvE5bYe+DtSror6RX0d/4SydVzvP7r82Af4I?=
 =?iso-8859-1?Q?5gz6X4je+93sVCVstpS/H0pLPQITpF1KipZFREMH8oMhPxKga199o7WI4D?=
 =?iso-8859-1?Q?xz/LJijt01709wlOVU9XRWmTuFySB1jSGFakp44FDIjJZLcBGzMIwJ8P3E?=
 =?iso-8859-1?Q?cg4pzDiCSC0bvdn4UqUhqLE1SmLl0TA3TO1f04xx9c1afvAec8hxTw6yZd?=
 =?iso-8859-1?Q?1hSqzkYyjZ+LQKp+/cAXRAp5O6OjiBeRdyhUhMLdsZw0E2YGML+0b3/lB8?=
 =?iso-8859-1?Q?zQeJg1RmFjrDMb92XLRMSCNLTepsgDdPW21mjrYoA/+NXXjP5MryIqLJQn?=
 =?iso-8859-1?Q?7rOyFq9Gt01ANMhUFUR1paznM0IemtbNECOJ4qPybu+aDiqmJyb0PvTtJZ?=
 =?iso-8859-1?Q?Jx5Ky/t9O8htuDYl7+exJB9eygi4BUAZF2YEzile7vyKksNrCKsR8LKyNC?=
 =?iso-8859-1?Q?m8zLRNROpaBSGzWHVPM12PPc2jy0YZbrkKT1zx3sWO/gqlNgaWOTVEQILc?=
 =?iso-8859-1?Q?+zeTpixTWrMRVI6bIcU009Iu+V/8Dm8fShUm3RqqD1wronP84EU2WDWpr7?=
 =?iso-8859-1?Q?MWaxTdV+H4lnbKHjtRjfHbyKrYMrxDHetGD5ONDZ48J7cQllEWU9Z3W/M9?=
 =?iso-8859-1?Q?jsrpbM9wEPCaEK64BstDpiefTmB/TWRWzT5/OVpQeWU7DE3pbLFsrb/YVf?=
 =?iso-8859-1?Q?YyPt4v32CoFcv9L7XdkTE3Uyd4DBZRgGfdGUvRFFol6195RVnmve93049R?=
 =?iso-8859-1?Q?ITrPLqwhVDVUDjFv7sMCet5meuUqsMSvB91JWDH5pzDrPZ4w16czNhMpST?=
 =?iso-8859-1?Q?DcYaaksCcvYvgGHHW/gz8NaWeYC3LIdk7CZkvraRff0pbLTXurEHhnpW0y?=
 =?iso-8859-1?Q?y3mROjCemC5I9t0RgN941XcUfDiRt5l7m9aILmDYoBOdNURe8wM08AoFUG?=
 =?iso-8859-1?Q?ItbuevtDcZrjWaBoFuL5U6wL2+UtRd3YuRV9Jls1TeWyN10PlIc4drNT8j?=
 =?iso-8859-1?Q?dMrZSE5OEUagsHMZJgmVZUMtOO3Ad6xyjFiabDLPR/XB0YGlEncLdhTqKT?=
 =?iso-8859-1?Q?Z76PF139s/83vRbIOlp0RjEKUNMENuMXghtGvRE3k5BQGLk6IKS/oWiyjG?=
 =?iso-8859-1?Q?PqSUatamRpFjME4ZR/9Vp7VV3wcFGehkFCWnTOikvdawFB4JxwSVFX9YFM?=
 =?iso-8859-1?Q?OgMhIlSMJIMAVWwUrBXgSeSF+mqg3fvlGGMQFATFcJg7c/cDO5htTAeRO+?=
 =?iso-8859-1?Q?5oL8iyBDdm+x1voGNe7F9nYDpl5O4+D4ezdMe9cMcQk7GYZX0BLa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85365430-8be4-4f8e-3e2e-08deccb0d527
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 20:41:39.7783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWrDTSbhgJmNBt5eegf5eTtESra7iDfyENEnGnssgUSJepHk3DKMUWdnVxN34ks6ylapAfvnjh9NJcCMV7w4/98+g1q72SKD7M2d4lsEiRLD/PKHcA5L3/DcRrzw0Yxa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7179

On Wed, Jun 17, 2026 at 08:22:58PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Missing hardware cleanup on `i3c_master_register()` failure.
> - [High] Dynamic Address Assignment (DAA) repeatedly assigns the exact same address to all discovered I3C devices.
> - [High] Premature IRQ unmasking in DAA combined with a missing bounds check causes an Out-of-Bounds read.
> - [High] A single transfer timeout causes subsequently queued transfers to stall indefinitely.
> - [High] Lockless array iteration leads to a Use-After-Free of the IBI pool.
> - [High] Missing return statement causes the probe function to proceed with unsupported hardware.
> - [Medium] Pending hardware interrupts are not cleared before unmasking, leading to spurious IRQs.
> --
>
> commit a3affb1ca97425b3ccb4b28da6e2b361f1b86e4e
> Author: Runyu Xiao <runyu.xiao@seu.edu.cn>
>
> i3c: master: adi: initialize the lock before enabling interrupts
>
> This commit reorders the probe function to initialize the transfer queue lock
> and IBI state before requesting and unmasking the IRQ. This prevents a pending
> CMDR interrupt from attempting to acquire an uninitialized dynamic lock.
>
> > diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> > index 047081c9f0643..e29aac2869577 100644
> > --- a/drivers/i3c/master/adi-i3c-master.c
> > +++ b/drivers/i3c/master/adi-i3c-master.c
> > @@ -964,17 +964,9 @@ static int adi_i3c_master_probe(struct platform_device *pdev)
> >  	writel(0x00, master->regs + REG_ENABLE);
>
> [Severity: High]
> This is a pre-existing issue, but is a return statement missing when checking
> the peripheral version just prior to this line?
>
> If ADI_AXI_PCORE_VER_MAJOR(version) != 1, dev_err_probe() logs an error but
> doesn't abort execution. The probe function then proceeds to map registers
> and initialize unsupported hardware, which could lead to unpredictable system
> behavior.
>
> >  	writel(0x00, master->regs + REG_IRQ_MASK);
>
> [Severity: Medium]
> This isn't a bug introduced by this patch, but could this lead to spurious
> interrupts?
>
> The driver initializes the interrupt mask to 0, but fails to clear
> REG_IRQ_PENDING here. If a bootloader or warm reboot left stale pending
> interrupts, they might fire immediately when unmasked later in the probe
> function.
>
> [ ... ]
> > @@ -986,6 +978,13 @@ static int adi_i3c_master_probe(struct platform_device *pdev)
> >  	spin_lock_init(&master->xferqueue.lock);
> >  	INIT_LIST_HEAD(&master->xferqueue.list);
> >
> > +	ret = devm_request_irq(&pdev->dev, irq, adi_i3c_master_irq, 0,
> > +			       dev_name(&pdev->dev), master);
> > +	if (ret)
> > +		return ret;
> > +
> > +	writel(REG_IRQ_PENDING_CMDR, master->regs + REG_IRQ_MASK);
> > +
> >  	return i3c_master_register(&master->base, &pdev->dev,
> >  				   &adi_i3c_master_ops, false);
> >  }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but what happens to the hardware
> state if i3c_master_register() fails?
>
> The hardware interrupt is unmasked by writing to REG_IRQ_MASK, but if the
> registration fails, the probe function returns the error directly without
> masking the interrupts or disabling the hardware. Even though the devres
> framework tears down the IRQ handler, the hardware remains active and can
> continue asserting the interrupt line, potentially causing an interrupt
> storm.
>
>
> While reviewing this file, I found some other pre-existing issues:
>
> In drivers/i3c/master/adi-i3c-master.c:adi_i3c_master_do_daa():
>
> > 	for (u8 i = 0; i < ADI_MAX_DEVS; i++) {
> > 		addr = i3c_master_get_free_addr(m, addr);
> > 		if (addr < 0)
> > 			return addr;
> > 		master->daa.addrs[i] = addr;
> > 	}
>
> [Severity: High]
> This is a pre-existing issue, but doesn't this loop repeatedly assign the
> exact same address to all discovered I3C devices?

Yes, can you help fix it later?

Frank
>
> i3c_master_get_free_addr() returns the next free address greater than or
> equal to addr. Because addr is not attached to a device until after the
> loop completes, subsequent iterations will evaluate the same addr as free.
> This populates master->daa.addrs with identical addresses.
>
> Should the code increment addr to request the next available address?
>
>
> Also in drivers/i3c/master/adi-i3c-master.c:adi_i3c_master_do_daa():
>
> > 	writel(irq_mask | REG_IRQ_PENDING_DAA,
> > 	       master->regs + REG_IRQ_MASK);
> >
> > 	master->daa.index = 0;
>
> And in adi_i3c_master_handle_da_req():
>
> > 	adi_i3c_master_rd_from_rx_fifo(master, payload0, 6);
> > 	addr = master->daa.addrs[master->daa.index++];
> > 	addr = (addr << 1) | (parity8(addr) ? 0 : 1);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but could this create a race
> condition leading to an out-of-bounds read?
>
> In adi_i3c_master_do_daa(), the DAA interrupt is unmasked before
> master->daa.index is reset to 0. If a pending DAA interrupt triggers
> instantly, adi_i3c_master_handle_da_req() will execute with a stale
> master->daa.index value, which can be up to 16.
>
> This would cause an out-of-bounds read past the 16-element array when
> accessing master->daa.addrs.
>
>
> In drivers/i3c/master/adi-i3c-master.c:adi_i3c_master_unqueue_xfer():
>
> > 	guard(spinlock_irqsave)(&master->xferqueue.lock);
> > 	if (master->xferqueue.cur == xfer)
> > 		master->xferqueue.cur = NULL;
> > 	else
> > 		list_del_init(&xfer->node);
>
> [Severity: High]
> This is a pre-existing issue, but does dropping an active transfer here fail
> to kick off the next transfer in the pending queue?
>
> If a transfer times out, master->xferqueue.cur is set to NULL to clear it.
> However, the driver doesn't seem to dequeue and promote the next pending
> transfer from master->xferqueue.list.
>
> Any transfers already queued could be stranded indefinitely, only executing
> out-of-order if a completely new transfer is queued later.
>
>
> In drivers/i3c/master/adi-i3c-master.c:adi_i3c_master_handle_ibi():
>
> > 	for (id = 0; id < master->ibi.num_slots; id++) {
> > 		if (master->ibi.slots[id] &&
> > 		    master->ibi.slots[id]->info.dyn_addr == da)
> > 			break;
> > 	}
> >
> > ...
> >
> > 	guard(spinlock)(&master->ibi.lock);
> > 	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but can this lockless array
> iteration lead to a use-after-free of the IBI pool?
>
> The handler iterates over master->ibi.slots without holding
> master->ibi.lock. Concurrently, adi_i3c_master_free_ibi() can acquire the
> lock, clear the slot, and free data->ibi_pool.
>
> If handle_ibi reads the device before it is cleared, but blocks on
> acquiring master->ibi.lock until after free_ibi finishes, it will call
> i3c_generic_ibi_get_free_slot() on the freed memory pool.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260617150138.628578-1-runyu.xiao@seu.edu.cn?part=1
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
