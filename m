Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013057.outbound.protection.outlook.com [40.107.159.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACD8200110;
	Tue, 28 Jul 2026 15:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251868; cv=fail; b=IQ7SBMBLqoZXgRJEFtSMA+9zn+cstM0L61qDsGGxnGZOo73Kd+eN1TiYDtct0BR8SMxQ9vHpnQG+WfJnAIvO8v439u/1rpbpmSkOz/u4/YpEiDscSoLNZuVhdBq4ICQsB4qY4cc2W8ZYEsWy3vdEk2ts0upc5y7KmnWdj3EwqFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251868; c=relaxed/simple;
	bh=hyMd6NI6gErZea8fjP2ZKqARFcR7yuhHzXGKV/MjQF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Imt+LNQNx0zcKoYCMF3oJppZpmhAbqGskn6rHut4Mz5bXMkxdK1dvZl8K3AtpcS2odyLc3aiS5g5+5z/M6SvBsEqrA4af/XGguvcqcmx7Tw0X3B1FqmLqz1C+Ywp5LE0mprbl5iWacZg+CDNS/DFL1StlKLiqzqBXs/57Dd53z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P25gQu/u reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P25gQu/u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jB2B1CgIrgPwMG2FHdYBK0ybE2iYP3mgoUbKcKFLMcHrfOIoJzatPPUeDZnVWj3tV22BoWgBUd4Sxy3M0eEu1Ln54JOwcuF9rN0h2dX6Ne+Fq6zDvxYWe91moxcVfW6hjeV6XeV2qun0l7zPNZ1sar32OqzqqkndO3KDPfd7aY17v5ITNoy67jbOtzuLca95ZWghqXNhXAGuBQmlIcU6xpEvDfnAkRYUTZ+qduVE9I9BXjOBuvwvlnLY3X395qBmPe1VnU+xylq72HttCu8tdNGaJ9bnmmDp+Ubv6AnBY9bmMzyqjoiqAcTW1DzL/BjaeNorNTypsY6R/h2A5bRodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6BO5ZobG43EU4zN4VsRVWjyY8z47lz74c7EDUvV/aU=;
 b=ja0q7vQnPCy0z2W/d+ak8b15fC74+h9rPeK2ZGYnf+tna/eX9lM8Ebri7lQmy/b4Dyi7XUINIMhyfv0M8LelWtgF+Hm/ZsFbX2TAUxe7165SQd/vtiuHyYjr/bM8laTbtM1QDQ2L+omKHLFDmZKLfqXetpawC/a/0bkZMeP/kbFwCRW2Sq7v129yiTaK02MR0kXn6mypSzf1hWpSira2jvoW4OAUToWoZPh9QRYQbeUymdQIvty4zrDL0H3eeIIGYJSLdJg6hdcQkq2/r8uH70V+Kme+F9C8JRRbIrTAUZdrfmiNvWbjv2AOQ0RB76QQIHbYQQOap47EiR+klqozdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6BO5ZobG43EU4zN4VsRVWjyY8z47lz74c7EDUvV/aU=;
 b=P25gQu/uXJxLJjQp66lT8IX549l93+bDnufTVlYh5rBks6KTOQiis68ss5OtOAFarfJrkN9oE+sNnlCJXCPI62/yIdiBOQWXUMRdMWswRZ46AhAChLhc0O3vl6VPgkL6kG/PMGsTZElhVusV0o67usClr2XG/DB6YAaMfsVsUVcvGUEBgeVTPq2WJg1rW5uLiCaCkC9HL7iH7ryanApYCEa0ntx2iPTdykOnexbUCAMr8Wsz4fuLnVW2Qywbi0CRAOTQV0JVz37BRFttqlW7oy+GDBTpD1REC1wUMCkwLlMMzpeX1tmPESQb+MtYT4INIY5Z8hpkT6ni3VcUDOHH/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7184.eurprd04.prod.outlook.com (2603:10a6:800:125::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 15:17:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 15:17:43 +0000
Date: Tue, 28 Jul 2026 10:17:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: haibo.chen@oss.nxp.com, imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH v2 3/3] spi: spi-nxp-fspi: propagate clock reconfig
 failures in nxp_fspi_select_mem()
Message-ID: <amjIEO7FSrJqyX9a@SMW015318>
References: <20260728-fspi-clock-v2-0-dbe786a4a6eb@nxp.com>
 <20260728-fspi-clock-v2-3-dbe786a4a6eb@nxp.com>
 <20260728102831.B55621F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728102831.B55621F000E9@smtp.kernel.org>
X-ClientProxiedBy: SN7PR04CA0222.namprd04.prod.outlook.com
 (2603:10b6:806:127::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: b89c38ef-b021-442c-4e55-08deecbb5efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|19092799006|6133799003|56012099006|11063799006|4143699003|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sxMT1vZQk+jKKfFLLbtAvZyAz5ThQubRBgUAOcWq2rv+tgxrTO4HcfkA3H6BPSjonjgR3aETB0gOyIbn7G7B4okXPsUdZIIWCrC/BSLGp9fe5vhzQKltrSSI3KFQdhDnu8tyjF3NsD80ONj9d7KkvPBa4moiDz4l2M7cbw6WwVoH5+4k8i0cB+gTOp/tCTHDhlozl0z8c71Kn5c+Y9/94hs/s7yWy6L9S58zoHV86Yiv+V/iRqc4ppUxGjdblwyRNt4oNMWdlNpoZPbmZn5bH8ztXzPopfATet0SkSMzo0YQuKSHnC6/cOXbE+1F8qdulMKjMV/u9CgcJbDYilzVpO9dyoZTKV79Uy0B20dmLiWcMyITwHUASq+GGudFzW+XK8juS3d7foeoPzoAJl0G0aCAo9SqloRbki+E2iHyQ3iYSMX5bCB36w7TTqoOsMs4ADTmvex1yQvVhj6zwJSopO2bnRQVUOHVg+ZuaEkG9BXcWE1AtxEP5r5NUKBjhWNxUXDHS/OzxsAmEvknIpCLi7sT7yiyeTSaLvRoXpFhg5FvEJoUdhB8X1Qiep/aCGstm3VN/oOE0bmJfpKUMtBuPcirym5rFvHWwbTGElUaR00=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(19092799006)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?rz8bZFvT5lAINqrwCWXFTR4oKUxdF/dt6nN5wfw7NVTcbPfrzpBhNLA0YJ?=
 =?iso-8859-1?Q?RwA6OpH8HU6wj4zvVNejjnYM9E6xzD6gQaMAkxpk+GqFsOSXI9al3+Sg2j?=
 =?iso-8859-1?Q?Du+c6rKHUSPoCmiqSaC9NMipk9yFYQ6bKEDyLhoFgCELkqn2Gr91RJIlcT?=
 =?iso-8859-1?Q?rVC9+DnzdDk1gXCcqV6GgyF1E57gXrnVaSHcgZb+A2BfAkKjlK7jMO4v1M?=
 =?iso-8859-1?Q?I0VVL+TtJEuKBeUDBaQEmmjDc/5FDXedCmVmInFGYuV5/geussEz/Qrunx?=
 =?iso-8859-1?Q?LtvjIlh+fJO+1vllWDhtgSsPAa5SGjTQNrCreXRjsLR6aCXGuMA/+WZ/4S?=
 =?iso-8859-1?Q?GzI308o+/lruJyebLo+Bc4StARSNqy6gQ6U78edXWVt4zB5ZDSz/FPmCie?=
 =?iso-8859-1?Q?tz1fwpSot133elsOmttu4b+EgndFaCfSMSg7zXL0nCqvQJk61rWDVwqrun?=
 =?iso-8859-1?Q?RBz3Dd4MBguuafOoYoOe7yppkTGT04gZpT3+odfQtGueX19jLhtbLffZ/e?=
 =?iso-8859-1?Q?5cI/jFO/NNW8CdMey9s/XhdebsVuKsaWZ5xyh/V8Ldseo5r9O4ltBFxO87?=
 =?iso-8859-1?Q?PouVs0PsRRzmjOFNpcqxfBYQJCoSsIQygOJpbMWIFId4aIKPsZA3IXuoKo?=
 =?iso-8859-1?Q?bVP1FLwHbDWX8UHoPfueKiRsIbf8ygr+X13z3k/sQbVmnKYjumwbT3CUNn?=
 =?iso-8859-1?Q?YNMmxILOd9Eej/4oK2s0FDs0Iij98fJ4nlTdkLlXPFbJ4Hl1d4sRFQFzEM?=
 =?iso-8859-1?Q?ZtDuvrUsfRKdC0EtioSkAVJDHwkKvFhnEh6L3rvTTzwGNYOmrK/4x3DIXj?=
 =?iso-8859-1?Q?OJ+wyZGYoJC4pwCoKJ66e6glj5ZbFKBeFdkNT35ja1h8c1RyZX7LvLuLfJ?=
 =?iso-8859-1?Q?q12bSFHeUnvyUCNulxns15Tru84uWoqphvce8FhvQDPJ+2QR/J1T97Hhns?=
 =?iso-8859-1?Q?LlisbtrwmE5BSxhvStD82PolwsORBpjefqJod2c1uPcdHuMf2fh68nlSPs?=
 =?iso-8859-1?Q?zj+2gZzqPHXqkpKYmbUvZpiCCR6qubrHtg1jrDFO6eW0OrwzeA3KWVxKH+?=
 =?iso-8859-1?Q?Lu05a042DRIFEn0iquaXaFV9p5wYQPEXzHV1olCJyaUf4D0pjZkyeaQVgc?=
 =?iso-8859-1?Q?zqWxoRoLFkZ2sxyXfQCb80neiKASJMWXDPlFtEGdXSudAp3eUMapr0/yY4?=
 =?iso-8859-1?Q?vAhhxY6PgZoLzvil9q6u4ki9AqUpLFO+lr0RIsCPjuXLnuwj9JXdt+hvZ5?=
 =?iso-8859-1?Q?c9H5+VM8IY4G7wKI7JZKbpiGb5uC8Jk2E04MfW8Y2XSj0HcHr8IfC5QkzH?=
 =?iso-8859-1?Q?aGEhvK3L9+PCx0RN/6Hyv17Ydr8xsccpelw0zISHf/1QmaCv9ZgtalUKyD?=
 =?iso-8859-1?Q?xY6A27zp2ot/h2WOgyiYngoVna9gLF2WYl3ObGK16CPhUuqxltgTA1JTMT?=
 =?iso-8859-1?Q?s7EFLWbOt3yXIFydOZu759J7/eQNaLIVy9B/InaV7bUaTAN3wdrLWVnH42?=
 =?iso-8859-1?Q?iDsiHuO13bpW73bNHuO1TAb4ArDZ5in8uqukEwRxPFy+hXAOaAKxyPmVxR?=
 =?iso-8859-1?Q?cQAkP4W78/OFVTg3ss3f9x3HMhJiiaJDjBEYCs3UE2fuDzsyEhHhMvu3L4?=
 =?iso-8859-1?Q?5tLQ0Lgfj3oQ3ywvwJUgui82q4xjSYqT+j5I1zfifiCdNQOzYZyp/jaIac?=
 =?iso-8859-1?Q?gKZ12G6BOTY0baTqnheRfNLBOhTe596NBO6uCsyaBITMSq2f0P/iH6ovy0?=
 =?iso-8859-1?Q?2J2QNB9pPM3qF38aZLRSUrWL47rhPiGI4dEirKfBnRPV3asmHo3MQXEzqL?=
 =?iso-8859-1?Q?nX0l9kYjuXS+Xo0YdRXwU5YAcvklERs2piUcGIaiKl0flt3sW2gC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b89c38ef-b021-442c-4e55-08deecbb5efc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 15:17:43.2411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yY0p8WbPcKVHR2IZmbz1Dgdd5W/+AoDqkrWtEzkhvcEPXDXTzWlPSxJ0d7IgLjt7XreShpp4rd2aJXVwQNvftCGNxuRknluJlXbcKVMsC/eAX//3ixkOsfpaH/EJrX1V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7184

On Tue, Jul 28, 2026 at 10:28:31AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>
> New issues:
> - [Critical] Incomplete state rollback on `nxp_fspi_select_mem()` failure leaves cached flags out of sync and the controller permanently stuck in Stop mode.
> - [High] Error handling in `nxp_fspi_select_mem()` leaves hardware clocks disabled while PM runtime remains active, leading to deferred synchronous external aborts and unbalanced clock disables.
>
> Pre-existing issues:
> - [High] Missing `pm_runtime_put_noidle()` when `pm_runtime_get_sync()` fails, leaking the PM runtime usage counter.
> - [High] The return value of `nxp_fspi_default_setup()` is completely ignored, masking initialization and clock setup failures.
> - [High] The timeout error from polling the controller status is completely discarded in `nxp_fspi_exec_op()`.
> --
>
> --- Patch [3]: [PATCH v2 3/3] spi: spi-nxp-fspi: propagate clock reconfig failures in nxp_fspi_select_mem() ---
> commit dbeb737d74251745ba44e92f371ba23d08069151
> Author: Haibo Chen <haibo.chen@nxp.com>
>
> spi: spi-nxp-fspi: propagate clock reconfig failures in nxp_fspi_select_mem()
>
> This commit modifies nxp_fspi_select_mem() to return an error code if
> clk_set_rate() or clock enabling fails. It also updates nxp_fspi_exec_op()
> to check this return value and bail out to prevent accessing registers while
> the clock is gated off.
>
> > diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> > --- a/drivers/spi/spi-nxp-fspi.c
> > +++ b/drivers/spi/spi-nxp-fspi.c
> > @@ -922,12 +922,19 @@ static void nxp_fspi_select_mem(struct nxp_fspi *f, struct spi_device *spi,
> >  	nxp_fspi_clk_disable_unprep(f);
> >
> >  	ret = clk_set_rate(f->clk, rate);
> > -	if (ret)
> > -		return;
> > +	if (ret) {
> > +		/*
> > +		 * clk_set_rate() failed with the clocks already disabled.
> > +		 * Re-enable them so the enable count matches what the caller's
> > +		 * pm_runtime_put() (runtime_suspend) will drop.
> > +		 */
> > +		nxp_fspi_clk_prep_enable(f);
> > +		return ret;
>
> [Severity: Critical]
> If clk_set_rate() fails and we return early here, does this leave the
> controller permanently in stop mode?
>
> Earlier in nxp_fspi_select_mem(), the controller is placed into stop mode:
>
>     reg = fspi_readl(f, f->iobase + FSPI_MCR0);
>     fspi_writel(f, reg | FSPI_MCR0_MDIS, f->iobase + FSPI_MCR0);
>
> Since the early return bypasses the exit from stop mode at the end of the
> function, the controller remains stopped. Additionally, f->flags might have
> been updated with FSPI_DTR_MODE. If a subsequent SPI operation matches the
> fast-path check at the beginning of nxp_fspi_select_mem(), it would bypass
> reconfiguration and attempt to execute commands on a stopped controller,
> resulting in a hang.

Is it true?

Frank
>
> [ ... ]
>
> > @@ -1132,7 +1141,16 @@ static int nxp_fspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
> >  				   FSPI_STS0_ARB_IDLE, 1, POLL_TOUT, true);
> >  	WARN_ON(err);
> >
> > -	nxp_fspi_select_mem(f, mem->spi, op);
> > +	err = nxp_fspi_select_mem(f, mem->spi, op);
>
> [Severity: High]
> This is a pre-existing issue, but does assigning to err here discard the
> timeout error from fspi_readl_poll_tout() immediately above?
>
> If fspi_readl_poll_tout() times out, it returns -ETIMEDOUT to err, which is
> flagged by WARN_ON(), but the function does not abort. Instead, err is
> immediately overwritten by nxp_fspi_select_mem(), causing subsequent
> operations to execute on a busy controller.
>
> > +	if (err) {
> > +		/*
> > +		 * On failure the FlexSPI clock may be left disabled, so avoid
> > +		 * any further register access (which would trigger a synchronous
> > +		 * external abort) and bail out.
> > +		 */
> > +		pm_runtime_put_autosuspend(f->dev);
>
> [Severity: High]
> If nxp_fspi_select_mem() fails and leaves the clocks physically disabled, does
> calling pm_runtime_put_autosuspend() leave the PM runtime state out of sync?
>
> pm_runtime_put_autosuspend() maintains the RPM_ACTIVE state until the
> autosuspend timer expires. If a subsequent SPI operation begins before the
> timer fires, pm_runtime_get_sync() will succeed without re-enabling the
> clocks. nxp_fspi_exec_op() will then attempt register access while the clock
> is gated off, triggering a synchronous external abort.
>
> If no operation occurs, the timer fires and runtime_suspend will disable
> the already-gated clocks, potentially causing an enable count underflow.
>
> > +		return err;
> > +	}
> >
> >  	nxp_fspi_prepare_lut(f, op);
>
> [ ... ]
>
> For pre-existing issues not directly modified by this patch, there are a few
> other observations in this file:
>
> [Severity: High]
> This is a pre-existing issue, but does nxp_fspi_exec_op() leak the PM
> runtime usage counter if pm_runtime_get_sync() fails?
>
> drivers/spi/spi-nxp-fspi.c:nxp_fspi_exec_op() {
>     ...
>     err = pm_runtime_get_sync(f->dev);
>     if (err < 0) {
>         dev_err(f->dev, "Failed to enable clock %d\n", __LINE__);
>         return err;
>     }
>     ...
> }
>
> If pm_runtime_get_sync() returns a negative error code, the usage counter
> remains incremented. Returning immediately without calling
> pm_runtime_put_noidle() permanently prevents the device from runtime
> suspending again.
>
> [Severity: High]
> This is a pre-existing issue, but are initialization and clock setup failures
> being masked during probe and resume?
>
> drivers/spi/spi-nxp-fspi.c:nxp_fspi_probe() {
>     ...
>     nxp_fspi_default_setup(f);
>     ...
> }
>
> The return value of nxp_fspi_default_setup() is completely ignored in both
> nxp_fspi_probe() and nxp_fspi_runtime_resume(). If clk_set_rate() or clock
> enabling fails inside setup, the driver proceeds as if the hardware is
> fully initialized, which could lead to silent failures.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260728-fspi-clock-v2-0-dbe786a4a6eb@nxp.com?part=3
