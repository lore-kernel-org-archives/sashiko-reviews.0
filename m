Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013031.outbound.protection.outlook.com [52.101.83.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088D4195B5;
	Wed, 29 Jul 2026 08:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312632; cv=fail; b=lKWb01QkImZpn+FOKRjk4whMr6YIkFulxgGy6KLEHsOJ/2rB1W3wXDJwDpuytdkdUnS+vPCT7DeWEEcJL2Jzr2+yybC1fk+omShp7lBOWosbOvs8fFLGGatCcrt6qlwWpDs6VyZ8W0vFfhuz6AzImegY3BJ7oZcl7C9+yj/e+Ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312632; c=relaxed/simple;
	bh=/jqCRtI3tIT70SoKIfyVKbgMfjYJVwc9o+GWH1+Tn3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B3OWTW5Rz5ePk+Q6yfQnhmube6kSI4CK1Nhq+4+V94Bgqa4WqPPGe14NArusH0hYXQ02atZMmJx4yI+P0DINS8/sVMYnkcMPeEX9LwaYVj/r1+V24jOfWIFWO60HeGNrRoAseCUqCFW1EGMSVTuveojqMiXpuDuSDTJBY4rA6jA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Cg4S94Fy; arc=fail smtp.client-ip=52.101.83.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Cg4S94Fy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNzfBU9juXxn62Kyg2hI3eWJpCNTSF62K6njypx/CwYglSIGEJ8gGoTcdIyjEFMSBz16RF/dG6NXJhrKBX0wCka6SkV63JY0gqflqqANGz2kcPm76ATpAakZAfzJkXi1t2RDPbJE3UcyrMa4fGLxDmvTO0z5GlBNxnMADX2AN9jA2yYV5Z8v+wtWP4ouuA+zCp6207H9Gi1HY8K9JGWkLbwiandyVvfZ2XEtP9GjmSn+l8VuEdOQm7FQtxGkDJ7DyUmHbru2PWpN1jw4Epqk6sjjHQtLf1qwu5IJh4hD0XkppEc1LsaFgwmGgFQ69BZFnT+Zb695D65D1+ou9PbhgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1tAZLbJVDa0O6IMgpwE91/psNpG3tcZviitsCzHcf4=;
 b=D7oIPMbo9luDnIgmwAokGdmbxvAEq7wejWvpbXF+306nbAWz4nxx2TRL8Rb28I1X3on/g6WB9cxYwHtUtv5bAtvooC0w1kgyTtuQpOQSSwS8tt2FBR9JOoLzJ6xN4euT+i0nC3FW3d5Vc5x/eLAzpbKRoBOFs5GilOd6E1tcQBPrZWavcCR1SZmGpICCkCAqBvyrHQ1DhGLqw5jAyOuNMNQyN3MIMHx8I6Ab4MEMXxCyTHMd593fOeqpSLBrpHwwvEhvBE2vDUBGv5mCFggJOHYA6mmCLAB/GFemyNbF0H6iA07FEFrgljN8lY6VVomSiJvzp+qSCK5vyaVxATzcBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1tAZLbJVDa0O6IMgpwE91/psNpG3tcZviitsCzHcf4=;
 b=Cg4S94FyyA0r+H93+eXo+CEBiB3YXtJXsPb7QI/Hf1oL6mlZvU6lGXnQCV1uLFdNzzNdYg+D95FNg/fX7RFSD+ug/x8mcoN7Xi4hRTd9Yhj8idgvOpi6pW3JrXaSRyzuceYBKWqtn8YV4BR+PR+bI+ioJ1CJoGZ0xDVz9IooLFtdNY36l1vTS0VwMDFJClW8vDHm+wo2zEAMxDkW1Hv0xyCUnI6PFWanYQcEaBFjN9WHVKJMvzqOwaz/87u4RVMb5JDmnCPM/Ec5rsddsWhxlnBdvSH6gdVCKTq1vn6tP0gjxouF4WhG/gmSQPunsQzBvSdgXr559ApftMv/Qc/15w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS1PR04MB9630.eurprd04.prod.outlook.com (2603:10a6:20b:475::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 08:10:26 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 08:10:26 +0000
Date: Wed, 29 Jul 2026 16:08:53 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, Frank.Li@kernel.org, 
	imx@lists.linux.dev, neil.armstrong@linaro.org, olteanv@gmail.com
Subject: Re: [PATCH v7 3/6] phy: fsl-imx8mq-usb: add runtime PM support
Message-ID: <n7wmcjqy22rukm4ddktmgxqxdwcxnpfdskh5ddjbk64b6fuow3@uljhwmsy6bmq>
References: <20260729-imx8mp-usb-phy-improvement-v7-0-c385ee40ade6@nxp.com>
 <20260729-imx8mp-usb-phy-improvement-v7-3-c385ee40ade6@nxp.com>
 <20260729065521.32C7E1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729065521.32C7E1F00A3A@smtp.kernel.org>
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To DU0PR04MB9418.eurprd04.prod.outlook.com
 (2603:10a6:10:359::6)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS1PR04MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: da40ecbe-b461-4026-e973-08deed48d834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|6133799003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	D4uEvKflaeTZqc30Fb9QN1aqHgc5ZvDJizIjsZlbVOiKgw7K/ru/xxJ76lyvhwtEMwjRusD80L22Q5nxUQaUCSN0F58H3gsf589d7lkTY7zgxI8ThD/+Is5e4zE67JYgHdkd5LPXtMY/M4HX4byDPYa+NlGwF06YfLW1zsd87Qlm1mUQ3OgbCm0txIWnyMN5MKMoTpTU042WrzJUXRoAs6JSAxrA27vZzAxjSCp4BshMpIcMunLFlZIiKy/yo+qjsORdvmN4xKoPtl1qXpnoXn81g0w4lwbSTqi6S+HZkwqHlmv2nPecfusUzDoUk8kDFvUV+HTLj5Oa/eyIoVtL7Hpof8rMuI0XfCifaLVcjjPM5dkKTNNzq0e8wOJ2ijx83ECPguOCq9TihNBzaNrEI5UdipIPKGqGSv8mFsx+Ua/OjUs+vIr5f7w46KPh5jhMCpWu60OWAFPNibdPE42wMaFk5JlTH+ET19tHNhFdf0fd9OqmFD3NpMgrQ040Ay0JBA0+jOxvLuNgWM9ZpDxUUo2bKdANmX1TD3fJSphpQ9J2oryqVup2LiNTPAFZ5ko+NGGGxvHvxwAkDayJSGRKC/9W8+BBGo/vLIDj5d1TXjH7rQ2PtTI710geNxJyOSGyOsmpnoKj4Z5jRiF7ybLcrhEO8QvKa/E1lF/96h1qXcQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(6133799003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Er4LjjYooQXcqiDD5Dmv9MEwirawzXVkdpPIdPK0XdwFcMB5aB37QhvsrRLH?=
 =?us-ascii?Q?sPUzPxy6956c+plWpyMlG5mzxNuyTYY6MmDw4gFL2WCBhE3+eO24sgFqLUz1?=
 =?us-ascii?Q?te+NGLHiM/e7h9KxcSsdraOf3Fd8cegAHYmROaWsR54/bqNANVv6LhlK5ecP?=
 =?us-ascii?Q?8o3/X909jMXf6TaD/pPa5P1up7RwLZfPXofwd7toxO1wY/yswi9K+iBXqIbG?=
 =?us-ascii?Q?qSquDqP+WNHQUVJT2EgIvfJHsB+7SYxXLCaBgKy9sOsN7hE9w2WhDON1My1N?=
 =?us-ascii?Q?BixQ155Wv1MFqmOJcN0xCaorwZyxFReVlVM00iRqXRt9LV92VDUVPm/4+Cq8?=
 =?us-ascii?Q?F6Cnsxnn5MjLk3qYfXU48u1rBEhRwUEJbdtp4KQlhRV63Br3eqITdAVpwIEd?=
 =?us-ascii?Q?YMvcZ3kc1Z7Ut7JUVIrw3Cu8WHsiSJhgbaK614m+xA7W0KBym64It7ElbQhj?=
 =?us-ascii?Q?hlF7SHGf3E5BGgWygt3BqRixjd4zop1GpeSvTg0+H8V4LL+goJ4BvKoCoKxs?=
 =?us-ascii?Q?+Q6U8RdC/NOUizYmSohXUScuaTVuckn61gMEkorrSv7hHTt+kqm+msXFCjTr?=
 =?us-ascii?Q?wXI+TjZ8GCU+xU6WLJiMpvcPgCo1az4de3288VMWGb7pNsjsMlNUghhIB+dg?=
 =?us-ascii?Q?JMFZ/+Q1XhM+oF3A+tJzI9EJPNGo5Kikj7+uTVRePn05jIyf3NH4dqXJygM+?=
 =?us-ascii?Q?dn0w57Acu07Rvh6x/wA+GKadpQJKe7vte+HO4X2CTOETqCukllUvXP3pWSZi?=
 =?us-ascii?Q?qoY+NkckKhX4q9UklSgVozyBKWbly3HGUfCSTYk8OdNcIq1vfELVw+d8I5f/?=
 =?us-ascii?Q?4xvoeAAgVO+sjSumGAUri/A/2B4WBfrP9mJ0tYFXiu4R7lPtKhzkGi6AOpv2?=
 =?us-ascii?Q?6VBrZrPsiNJky6igPfdsXmXv6M5L0xG/oAWmX8natf7bCG47QFnbnY7767Z6?=
 =?us-ascii?Q?MhyJYEH2f3etGqYFSxL1Ze+0lGr50SqlKQ7MV0Z6Iyxglj83nKopbCBjBm8H?=
 =?us-ascii?Q?NmnxqMmivk/P3k+4FmqU+BZzSRJJB2G5bllmPy1zU51Vi2VQJOBMvZ3VJ4eZ?=
 =?us-ascii?Q?TfAFJagVUN3Xb7brOA1X6yWCT+En52sY3tXJtATaEli/+9Efq1KDMGrFItP+?=
 =?us-ascii?Q?km16bs5BZ4sH745/eYncK4SjFq+YHxvu6OkVxFG3pJVzpPTFueHggC834BzH?=
 =?us-ascii?Q?EPeCJ6yKnRiG7dXq4ewvzaaCf550lf2UnJh9k6NvkXJXgNWYPsc8yuuVEwoI?=
 =?us-ascii?Q?UObNcEwlVVxojiohGAWVNjGIywoH7rKBKYNhIRhD6k+bBt6RMakLq1149HGo?=
 =?us-ascii?Q?5tjxjGhHYHD5oK2S6cbfpBYrBj+Sgbd9ZfYrWCIuCHPRtKyoWhlQQV8u0Kpx?=
 =?us-ascii?Q?C0icCGvnWh2r2Bc69E0kr5Thj9UAgKf3tkYcvqkNwzKZOfiRsgNK7j5uoWPa?=
 =?us-ascii?Q?BSrIByA2h9S9Hh9oHJXVHgwg6fh92rRTKs1n9BjzrRxZe/pWQWYWseJknB0f?=
 =?us-ascii?Q?xXmzHL3WzBlaekzSHMoffu/r0QFU2LCBUP0qAMJLV/oho4rswR4L6niSImpH?=
 =?us-ascii?Q?49zpgOAwuw1oQSWPR1vpfzp8bwPRipRS8gXwhLFdUW1vHwkDnrY998hj/pSc?=
 =?us-ascii?Q?Rr4rwSkXK4s3e7GvucmJZIiUJqWUozvNbKVnRzFUtPgoqBJfAigvBj6NHxGy?=
 =?us-ascii?Q?tY87dTz/FNXpCWsQQSt9jc/FJKeTKeLrmDagQT129VbwDUzBlrrHMFYg3NC+?=
 =?us-ascii?Q?SzVvOgMot9N3Bq+H9am42FrCHPxfiYu+b2TkpiZhCx2ZAoaoHwIy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da40ecbe-b461-4026-e973-08deed48d834
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9418.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 08:10:26.6077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QN78rvh6K0oClxmlvyeMQbWWxIkyf5cHoBnBzJAnWN4wvMDBsOWy7/Xl9MLfRv3KoXii3IupqG6cSInYTLQfj7F8xvEsBm6Qli/U9I8n8Qsr2OqrcsrSE99PKTAPOk71
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9630

On Wed, Jul 29, 2026 at 06:55:20AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Incorrect error checking of pm_runtime_get_sync() return value causes spurious warnings when the device is already active.
> - [Low] Failure of pm_runtime_get_sync() in remove() leads to an unbalanced clock disable by devres, triggering a kernel WARN.
> --
> 
> --- Patch [3]: [PATCH v7 3/6] phy: fsl-imx8mq-usb: add runtime PM support ---
> commit f054765f7ebd59735a4592c4d68b74584abdbeeb
> Author: Xu Yang <xu.yang_2@nxp.com>
> 
> phy: fsl-imx8mq-usb: add runtime PM support
> 
> Add runtime PM support to ensure the PHY clocks are properly gated
> when the PHY is not in use, reducing power consumption. Clock
> management is moved from power_on()/power_off() callbacks into the
> runtime_resume()/runtime_suspend() callbacks.
> 
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index 3a5788c609e1b..74e665525ec48 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> [ ... ]
> > @@ -708,44 +696,101 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> [ ... ]
> >  static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> >  {
> > +	struct device *dev = &pdev->dev;
> > +	int ret;
> > +
> > +	ret = pm_runtime_get_sync(dev);
> > +	if (ret)
> > +		dev_warn(dev, "failed to resume on remove: %d\n", ret);
> 
> [Severity: Medium]
> Is it intended to warn when pm_runtime_get_sync() returns 1?
> 
> Since pm_runtime_get_sync() returns 1 when the device is already active
> (or when CONFIG_PM is disabled), checking "if (ret)" instead of
> "if (ret < 0)" will trigger this warning even on successful unbinds
> where the device was already active.

My bad. It should be "if (ret < 0)". Will fix it in v8.

Thanks,
Xu Yang
