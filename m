Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211523B9927;
	Wed, 19 Aug 2026 14:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150443; cv=fail; b=cDIrnwgiM9FsDcKEWoHYg+0a6uSv08xmXbK+7PYsWdHUnqQjstb4Ta4rGVlujfZCDrn2PEYUqLriX349EztdvFrDF//+iIGxo7IkrSeoaH3rKskbTLHQKwUm5m8Ms0IrA366x1/x/q3fSVz/U6CYw/4Ull9BES9J7Ca9ZIkU9uE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150443; c=relaxed/simple;
	bh=9QLL58fMwLCH/rXi4bZZb77RRe9kADXEkRnJRkGgbpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jcz4FG7FOSN/dq2oU/SoD9woF0I5XxCzmkdXhG1nqefoOYocL5ntD7+rnE6a+ownJvA7PCT0rXInLFG052QfNO6TQR3wcBROv+OIEswxMGPk0bEoXA9PROmo1W+912KGcBmpwcieiSLqEdFMylSutgjPWkk5YzN4Hewr+n42xOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tB0MFucZ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tB0MFucZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbD+R0KRzENNAnHgkua+XKATBgXBjBC8OsYSymo/n8JFS7RWZs5hFwDaUbmol0PQAWfXXEXuDWUEmqxLIUMbtpLbsPAizEev8OF7AtowNXU2NClOcOEucyF5A/gwAww7rtlJn2lYMP49VsHPG+Mq5RkFXQ8iHlFwcYZrVDA3GC3kpCpTChi/rKJYuPW87BqNg9BkSEHJmeztOy48TdyfdLmgQjUnTzkbaYK3xCmsgtEpP1tCRrIMvuI5hcGFOO7mXV5uJJXBnKXVAZO47GqydocFyTXGUqsBuRCWwAj/TVHIqbxxtaoKzwRyoynzbj/2jmiyoZEXQm4DxHl3qJ9tXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7SqMDL7TVBupccugOuOSnHmNEe9/EyDJO8NNa7bJpg=;
 b=RXTfD+V91Ym192PaX3eilvqJCaBWNllSnmdVeaqo0KELsjb1IesZMhM800P+gFSo7mqy9HcgssT91hBV+o7922JW3jEamdZ72V4xfJz6dXCaX4IMbPDWTnhiRLfxF3QvAIXH+yAFmR7XLQr+fihG/iAkkITw+VaWS2Btzuy8PnDQlsW1CvcRKi15MgSDIOHuOWh5II4hRzvBIjsSc0NjbhNNVOfpXrhDT2aSXKK4Gimnrk9jDxCIaqUYAfVbBvM156l1zrCa+rlD9l7akg1gzHV7DA+4k2vDjV8lk7qc0bQ4m2VYI6E2IWwcBhWmnBiUx8M2nvPolzYhpGHqzod9kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7SqMDL7TVBupccugOuOSnHmNEe9/EyDJO8NNa7bJpg=;
 b=tB0MFucZ4NPbqG/z4meKqXNFAevTOowYL/SZAgKJu1CnnsWdDHhb6bOE0/XidgspKaSnh3e7s21YStT8PNFmFSHpumcUcc1gnsKzUs9jHS5QYEW1FwcAPW/qQSFWZXhEG80Afq/jXFEzjqT/7sOkox+IGhmOy6PRmMkaja+hzxOgFI+2M7cty+7wsyxM9OTTYAMsy+XFVCoQvWCWBxrMtMuxCSPfDDQqkgrQBLccDAdsflKtVnqbN9P87E0SluiGDPoxDpJDKorKkMCAe7D7YA1W7RUBFu88f1XLaihtgzxdOpuwuwarfozzuBdNq3FtrHXWJkPnTmVRMUKvoyIpjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB9973.eurprd04.prod.outlook.com (2603:10a6:150:112::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 14:40:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 14:40:34 +0000
Date: Wed, 19 Aug 2026 09:40:28 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Zhipeng.wang_1@oss.nxp.com, Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 4/5] irqchip/imx-irqsteer: Mask all interrupts in
 probe()
Message-ID: <aoXAXFI3kRWh98R7@SMW015318>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-5-Zhipeng.wang_1@oss.nxp.com>
 <20260819092506.832631F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260819092506.832631F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA1PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB9973:EE_
X-MS-Office365-Filtering-Correlation-Id: beba3b40-5c88-40f0-0f6d-08defdffd3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|56012099006|6133799003|4143699003|3023799007|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	4DsH20ie/rJgOSKhbhP8BY8FH197VW24R0lVO3ZbXo2kQflkqvAtMHWFLmawNqtIm79+Mlf2xzKb04VQVIpHmSu4smRKxgmDpkoO1JBhw/4vB4m/3F0XUxYnQyH4641PVQBqBzC5Cps7t+pbvDSAV7u1P5p429iMXz6xUii8fx6tyloT/UNOG6MdhnCVAXTlpe6g9byBaB8qIoL9Hw22YzvKM4+Y3jMJCJRIoz0hSrO4UjbMMOCLFhJqkwjJIBwQzPuPdcAa0RZCnncNl9lg2U77a9zyqGJpAyED0QBsb02Y5x9YLD3dPUsPuBdxjIRV58ZtOkFrUJNeAixN0MXBJw/hshFe87rCAE56q0ruefHz33L9zlXkRc6+PdpbDCko7SGsfa1dviNgctc5rQ37Wg9gW+yoNXc6yuVW9oXMJP+mn3fkmoAn0fZ6BNJ9DXkeXtz8FNbDg5YkdFTpCXLa5SWN8x5X1AHfaks/0V+YOamdtV8uhiCSb0os4R8ib7NjMmAqK1tl15c8vjfnxjMI2Uq7/7yrvi2e7KYSgiMpEOFBu7Owv18XMoSRWe+y8c/NJxIiDPwHxzT3HsiqX1F4sYwQwEH+jZdrLZpQjpQiH7M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(4143699003)(3023799007)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?U1O+lI4anAcKlDsjSZlLevC+FGLhLIh7alB4ASr58fGHBUKuGUoVh4dCbX?=
 =?iso-8859-1?Q?oSGMDhWhVNVssk84cM8dSEkFhgmiY91XokYnBFYPBuqvwRLCxfdUOITwNe?=
 =?iso-8859-1?Q?XGzvxGc2S0dzC0CiTPt8PA2KB7EZqxzBROLD7So2i8ihvCCE4sCp7P0QDQ?=
 =?iso-8859-1?Q?07KClWv6WTFtcXlonaXEtOx7B6hGWswSYDuqeVPThJyvtrL8QGxOS/O5CY?=
 =?iso-8859-1?Q?KUY9jPX/uG+wgRPEeS9fRxMIgvbrKhKZwBaq2RfUhY4xEL2zx0j7nRDkAN?=
 =?iso-8859-1?Q?RN9hoGY0iXcGfhtoaoUbqSbxANtCRcUYaRKSEnEP97kklkCsKlS+7CBtl0?=
 =?iso-8859-1?Q?1BEKDDkLTDjUqHf+vTpaHrF5jvApVo6nXu1GvObjYoAWTLLOg5OPGEoLYH?=
 =?iso-8859-1?Q?/BhPisugwKidxpbgXZ0chWYFbd0HvSOFK7ZU3xy7qLJk3FEjXH9qHNSJRW?=
 =?iso-8859-1?Q?rcXPKtb2j4wf40/6si2Y3TYsbGRnQqIc7pu3PCtsQzZpO48R+F0vKxLZ6t?=
 =?iso-8859-1?Q?VOqF3tPv6J9RwAMxOEZAbmnRCHZtNKWZjhSIVFCIRfo5uSq8p3Vl3Kf9XT?=
 =?iso-8859-1?Q?s7Pj23slNISvBbFOG1E2owzsDWPf+Esl9UbyCNLmuraF3khcF6D6jZ2WQr?=
 =?iso-8859-1?Q?I/OZlcO5CgRiwRmpwwE+N8YmsEO1bBWeZ4ct57/BjkQ//Fxj/21lxovWlR?=
 =?iso-8859-1?Q?OzcJ0wdBrushi5x71HWHZ5JNku+DOWB2OqKUVp9WBE/p4NqYVfgzmCHVKd?=
 =?iso-8859-1?Q?KF+Hi0DJFwj0xQbYCmPBw1qs8imrKVB+o0u79+QVCChiSx0Oc5HLfgLC8e?=
 =?iso-8859-1?Q?4uCN9yL+t4KMAOAE2RP2wQM/6ndKScaiVII1DzB2ehQwOGBEOlB8mmqury?=
 =?iso-8859-1?Q?CPJrHrzZQmL4WglG6wXOYT5ziCahcQrleaWvaU7aQSY/67A2WfilnZ5xuQ?=
 =?iso-8859-1?Q?mdqhks+Baks+7kZUjp3CevfUMhTA7BRodGRuwqQY7EWxGPwyppDKvAhnYH?=
 =?iso-8859-1?Q?JOEQicLptL0t66ChTajlPgRqqSR2nh00+gY4d4BKtZXjCqqcPZ6JRLg+E4?=
 =?iso-8859-1?Q?zEaWnIJJZUPafwFhwHR/Swj9V0G6p1hv7G0jr9iXE+2B4EUynEM7fL94uo?=
 =?iso-8859-1?Q?s9MUuZwIg4U4Mw1gcMwbzMr6bBpusTIh2vs0IjrTKYZMTZVeM1oYinPgeL?=
 =?iso-8859-1?Q?0vS9DQoGa2rVi8riJEnGBnagj0twjjdlU4lU63fApL9rmpUr06Z3ZNMHqz?=
 =?iso-8859-1?Q?V/F9w/mJUDHPYvtWVKf66Z6HQ2t1yGPid2dBp9Ml24pYfYRJXf0CZwtfwp?=
 =?iso-8859-1?Q?I1Pcazd/a8khycJ8rtQGtSrIm7VRnDZ9BPmKK+N5CF4Eh+qoU4hlXKzq5c?=
 =?iso-8859-1?Q?N0f63nXBMpKXFee/2UebOXfzaGmF4D530QY7Gp78e1g8DpoL2Csi5rVsnz?=
 =?iso-8859-1?Q?rcU0ji2yIBttkd1xcAndLaVo2B/2rZuInR0rglx+0v+MOBFirCe834jh1Z?=
 =?iso-8859-1?Q?7/AHwBfaZYWxr3BWmF1gFlwVBC3rXwiqONfTzPw/OEmG8JB0GwuzQDQHh4?=
 =?iso-8859-1?Q?/MXNPoVbBjDAPXyuRqNJb57vEqvefyS0hyVYWjcYVfo16cjSen49zqb+2y?=
 =?iso-8859-1?Q?u89sMV/jVK/dYFAcQ6KKG0RURrKuBqw2LxPf9OUgdtP3wBrQC5p53IoV/+?=
 =?iso-8859-1?Q?Zu/ccHjXp/N/OPFnYPGvI38yaUDBFQq8y+H8LN5LbuVE7Z8kJXJIrYZYcv?=
 =?iso-8859-1?Q?tlPH9o2M+vYmKXJxf1nh2dRhFINqQ3Jeh4tRpS+AmNauiOB6+cbkSLv6ZH?=
 =?iso-8859-1?Q?iaEVRTyTxGZ3XHWk/pdNorGSEggwiyEOC37JUmGcukbj5EoX8iN6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beba3b40-5c88-40f0-0f6d-08defdffd3bb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 14:40:34.6724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJecAJJlIl3yrX1pDvt2ZokT+R6VAvbI0PZi4LVTZm/2YcvXbb9XTlpAfrBM95FV/+Y8E7CNAtrdb4XEaV/yatxRX7EoFeZ/81C41cGzH16ojdVKaGk7Y+p3+dxkP+k/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9973

On Wed, Aug 19, 2026 at 09:25:06AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> New issues:
> - [High] The patch introduces an unvalidated loop that performs out-of-bounds MMIO writes if an excessively large `fsl,num-irqs` value is provided.
>
> Pre-existing issues:
> - [High] Missing Runtime PM cleanup causes unbalanced clock disable and potential external abort on device unbind.
> - [High] Missing synchronization with chained parent IRQ handler in `remove()` leading to potential external abort.
> --
>
> --- Patch [4]: [PATCH v4 4/5] irqchip/imx-irqsteer: Mask all interrupts in probe() ---
> commit ecdadc89363972642c46a3ef5443dd52db1ecece
> Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> irqchip/imx-irqsteer: Mask all interrupts in probe()
>
> probe() sets up the chained handlers without first masking the input
> interrupts. Mask all interrupts in probe() before wiring up the chained
> handlers to prevent storms from stale asserted lines.
>
> > diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> > index 320082d3a6325..a9909ecb6fef7 100644
> > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > +++ b/drivers/irqchip/irq-imx-irqsteer.c
> > @@ -236,6 +236,14 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
> >  	if (irqsteer_has_chanctrl(data->devtype_data))
> >  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> >
> > +	/*
> > +	 * Mask all interrupts before wiring up the chained handlers. CHANMASK
> > +	 * has inverted polarity (a set bit enables the interrupt), so writing
> > +	 * zero masks the source.
> > +	 */
> > +	for (i = 0; i < data->reg_num; i++)
> > +		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
> > +
>
> [Severity: High]
> Can this loop perform out-of-bounds MMIO writes?
>
> If a large value is provided for "fsl,num-irqs" in the device tree,
> data->reg_num could be oversized. The bounds check for the maximum
> number of interrupts happens later in the function:
>
> 	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
> 		ret = -EINVAL;
> 		goto out;
> 	}
>

Make sense, this check should just after

	data->irq_count = DIV_ROUND_UP(irqs_num, 64);
        data->reg_num = irqs_num / 32;

Frank

> Since this validation executes after the new loop, an oversized value
> would cause out-of-bounds writes to data->regs before being caught.
>
> Could the validation check be moved before this loop?
>
> [ ... ]
>
> While reviewing this file, I also noticed a couple of pre-existing issues in
> imx_irqsteer_remove().
>
> drivers/irqchip/irq-imx-irqsteer.c:imx_irqsteer_remove() {
> ...
> 	for (i = 0; i < irqsteer_data->irq_count; i++) {
> 		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
> 						 NULL, NULL);
> 		irq_dispose_mapping(irqsteer_data->irq[i]);
> 	}
>
> 	clk_disable_unprepare(irqsteer_data->ipg_clk);
> ...
> }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but can clearing the chained
> handler here race with an executing handler and cause an external abort?
>
> Chained handlers bypass desc->lock and do not set IRQS_INPROGRESS, so there
> is no natural synchronization when irq_set_chained_handler_and_data() is
> called.
>
> If a parent interrupt fires right before the handler is cleared, the chained
> handler might be running concurrently:
>
> drivers/irqchip/irq-imx-irqsteer.c:imx_irqsteer_irq_handler() {
> ...
> 	irqmap = readl_relaxed(data->regs +
> 			       CHANSTATUS(idx, data->reg_num));
> ...
> }
>
> If imx_irqsteer_remove() proceeds to disable the hardware clock while the
> handler is still reading the CHANSTATUS MMIO registers, it could crash the
> system. Is there a way to synchronize with the executing handler before
> disabling the clock?
>
>
> [Severity: High]
> This is a pre-existing issue, but does imx_irqsteer_remove() miss PM
> runtime cleanup, leading to an unbalanced clock disable?
>
> The function unconditionally disables the clock with clk_disable_unprepare(),
> but fails to call pm_runtime_disable(). If the device is unbound via sysfs,
> the driver core calls pm_runtime_put_sync(), which executes
> imx_irqsteer_suspend() and disables the clock:
>
> drivers/irqchip/irq-imx-irqsteer.c:imx_irqsteer_suspend() {
> ...
> 	imx_irqsteer_save_regs(irqsteer_data);
> 	clk_disable_unprepare(irqsteer_data->ipg_clk);
> }
>
> Then imx_irqsteer_remove() unconditionally disables the clock again, causing
> an unbalanced WARN.
>
> Alternatively, if pm_runtime_put_sync() does not immediately suspend the
> device, imx_irqsteer_remove() disables the clock but leaves the device active
> in PM runtime. A later suspend would call imx_irqsteer_suspend(), which tries
> to access hardware registers with the clock already gated, crashing the system.
>
> Should pm_runtime_disable() be called in remove()?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com?part=4
