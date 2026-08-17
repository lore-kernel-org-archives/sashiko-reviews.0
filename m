Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011045.outbound.protection.outlook.com [52.101.65.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C0743D50C;
	Mon, 17 Aug 2026 18:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786992066; cv=fail; b=hTIMsHw6o7d2QHTtXJ7oZ5nVu80yKVIi3svNbaZ/M96IdLevUyYu/Vri3MrpEuNg0Umu0ctew1vMcZE8OC6gjMQainZqidLbbInDIAwmx09KWfYSxQnxlK6A+4T2GAUkDWbSjyHdBfeuRD4KCmjdRYYWnLurh95gCeWeU84M0EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786992066; c=relaxed/simple;
	bh=Z900inJ1X2K5DU2iiFyp8prjQ+8td4bXCQSsT97wqyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t+kXUXQL8gAIbuNaignvyvcTKo7OWT8RHUsKovtV2z6p/mwQXW1EBxYVp/uov+dova10QNP0hnXNndGFesF6nHfal2Jasd9Zqodsp0nKAukLXG8byX7iP4KWPamGCBTJ2xnor3SW+2veF0hfX8F0M+K0QQi9+byTU3MOAxa0lyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NSeZtML1 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NSeZtML1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unW+0eYUvYiV6SMt+jBcscHdqzD3Xt12QfyNrWtk5ZQxttvjTmrCq+GZ+CxsqE2jX2DVRPo3unuKNiOa+u+L6/bPWfH60HumlELf029cvYweuBZUUZ70Gaxn9VenkG/ctuPmBDnEH3WIXkmAyNzlGcqYj7h+DQFDyBNd1yTyJhE5VeEEI+Y91VBDbha6msQlt52GKq95h6T3Mm6fDavRr3/De+/1cAr6jMdp2Myt/lM+kNVaQPjap2t0zADWM7vsRHK63zRar2jHTD5fhKg7ERC3+fqPEV5TNzlk5MmpTdDkEv88kMetwWUILwhrzmZGK0rY5DKINS1EgBuOBLNgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vt2H35B4kp1dH0kS/IBhilCG/e2Yt7xeDFod8IEQLFI=;
 b=qpNwr2LJL/9DpOAYYs0YwQzTsz2+2+FS7Ut+/eQlHHUhMzCcePH9HNi/rs92Iip9xz/B8cyM9xErJygArdbXEla3rjACXPTNhq98F/2u0p7xFakv1Jc7N95wfzLxkokxX97TJAiqssS3hy0/3E6TberM3aYdUgwvzG7iMx1kGW6dq5CiP/qiDac1oIG21uN8ScI3Px7yB78Of1bLkRVT1lAg4Po6i27iPqOJT3sPuL3sffZwHhXQdcRWms8/RgsqAbJhw6pFmKR7KGoor+xpSwrfFVNh8encwyTp5ao4xwGqQ3yWMjT1s4spP0DuqMjPciJaetrsDlnKwRRm8zwe6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vt2H35B4kp1dH0kS/IBhilCG/e2Yt7xeDFod8IEQLFI=;
 b=NSeZtML1sQJ8Sr3LsMkK+ZBs8qOohft006YrygwN1benlOFNltK2V1Bm9tsZrIn78hch60rwauZYrg/bQ5tC5jWP6ADyPn2BBxRKnAV2q+SBJZ+YMlyo/W5ThHFQz2JjDicDwl1Fjld3pn5aLNcC82wO//quXBR13gkBDNdnfLrFdtsbbC83HwEh0QdLcI/h0bnWwIInZM3u0cvtXG8vhECPe+27tNk+URMZBxlwFxjT3GiI31AmEJ89lYeDac9Lr9bw1lZAM51OxpN+zUGzrw5GhlqSmmud9LUwtbnko0QNovpiXHA1YvxyAjWNsQ2P+1w+gDdREMaYjE+ILUw3Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8559.eurprd04.prod.outlook.com (2603:10a6:102:216::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 18:41:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 18:41:00 +0000
Date: Mon, 17 Aug 2026 13:40:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>, conor+dt@kernel.org,
	Frank.Li@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v36 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <aoNVs-TtpfQmR0Au@SMW015318>
References: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
 <20260817-imx-se-if-v36-3-45c42847bfd8@oss.nxp.com>
 <20260817084817.DB1BE1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817084817.DB1BE1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA9PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:806:a7::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a621b4b-1459-4fec-e6a7-08defc8f1596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|18002099003|20046099003|22082099003|56012099006|3023799007|11006099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	p90r7gEqR8E3FTbU8DInVLgLRzj15KWM2LH713D6OxvAfDs7W73KxBW07xjZHSX8qHsPN3OCRJUqsfr7ED9KBBCxMefqC/hYt6zSc+BvGgXSUmdrwbBHeexScKsLgsncQaUHh5h7+wHss/POTql0/osyw7qi1IV3FICXLuGupJNJLpk4LpRBEOE2FIkPlcU/78P3ivLy5Suy+4vmeuDxUf5tOw5P47diQLfdaWulWysdOOfoHS+UwlnyMXtQivIcIVdi5z8nQNx+riKHGuh7LssqIw8Z4Z5NLxKKZN2f5cx2BDMK6c/s2cvG98aO7tkCXp5NizYi2bb2hOeW03PwbStsB2JkPUJyLcQQmXA9YmDlhHk/C0GPT+eIsjAll9a1q2GWgr9keahOra5mxcIsYxccDL4BdTYZhyywiSsZY3jif9RojO6IFKHtWuI7KvKBs6PWC5Bo6XGHTrcBwnGKTj+rCrPUBXTPikRtz3AtFZZ3JIr6/1zbTtx4B9oWeVVayn/RVSkmoqmpXnHxXhvIFT6eFjhLONUIzq32Ccp8S7yO81ji+CNXhYMa1Mp+ZHSBl/dfJI3rFqRe4LvbioR/TYPtBzNj4r/lSGj7H+KKQTY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(18002099003)(20046099003)(22082099003)(56012099006)(3023799007)(11006099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?V5UjL1SH7AnspSImdicwxTsd6TL07Af1bTmffHTmsvWo8lJ0gePY/sKA0n?=
 =?iso-8859-1?Q?R/IAlRa3hsiKlfVSGsdAK8v3ohmlb5W9UjHHq/Bkjy7NQOw3tyKPbqb6uE?=
 =?iso-8859-1?Q?d0OOzExy1CjHdu0719zv82bqykSKBagykQi72YGkmLvt+1w90qLmIgrHdx?=
 =?iso-8859-1?Q?HCGrb0TpLMg6lwbFwPccVC1jxRA3APLZn2yt7JQnNLPHvASQJ250oXMfFI?=
 =?iso-8859-1?Q?HqiDL4Wxdo87WpP/ITZBMl9chSgguv5ST8vozUDxuTIf7IzssuEZbE3m7F?=
 =?iso-8859-1?Q?EB33iKhs91f3BzdJMsxCpvieGOci1X2SiUDmcAZZoiBc/lw/6+aMX4Wuea?=
 =?iso-8859-1?Q?713+INHHqEPu2I8ZhhTi0eWxKydGFWTed8gMM+h7pxGlDPRj6VeIHpK2/C?=
 =?iso-8859-1?Q?gSoZe2PakCpiWo2ViVXLy+26F3u2DdXLi+VxcggXPKk5SQSdPJ8q4dQQ+x?=
 =?iso-8859-1?Q?sG6bWNIdkMksLvyiA00odOVWtD1bC/L3TQ9NPK8KKHHjsG3c7UDk15Eamy?=
 =?iso-8859-1?Q?vavkiPg1J7C1B0i4UbJFmyo6BlHSvbCqEgWJP1OnKZPvLOrXCUvTjEO4ae?=
 =?iso-8859-1?Q?RQSt84bP1BAH6UOimTcL6esyfYwJzfISvn6/bfuI29qGYduack1dJ4FMWd?=
 =?iso-8859-1?Q?nMD4BGmFUJM9dAGGbSxDxGcq1ZGw7TpKdWDgsPvxkJ0bQP3PH6lN0fRyHb?=
 =?iso-8859-1?Q?QULGyn9m15b8EnqSv1T0Sd7DYxqaEw6G2wQddH2RKJrcEbivw29QBQXzXC?=
 =?iso-8859-1?Q?65wRTgZr9eqWosyW0ddFd0tBrgQGBl5kN35mll7kJvh1g9eCfq5gQRGdeE?=
 =?iso-8859-1?Q?FrhcqEW+hpPjQdsnf5noXcnUKOfaZ1j9VkKrGYrwDGq4oNLBJkmXlv0d1S?=
 =?iso-8859-1?Q?8jzd/0FDJoyyaksJtb5Hg+OXZ8r8cRzwuQcNPHzVUn0yoH75bxQuYkcUvZ?=
 =?iso-8859-1?Q?OECa02DF6EuxTfvZ37Rdf43em37GyXVfMQ7dkSBoM7Zg5rHly88Q4b2xtR?=
 =?iso-8859-1?Q?dWSKKjtMBwQjQSc0tm7onAsmPPDq1V/5/W83AK2O4W8UVnXtYzfSGIFK3r?=
 =?iso-8859-1?Q?Znjlnc9r1iyN1PKOvZxmTgzlMFe5dL3JicdVumQw/hA+koM/r7nuQPGe2k?=
 =?iso-8859-1?Q?pYAlDNWcgF5P2w486wXpD/op0l2Mx5rNzpTpnsXjuh4iLQYx+iHxwTZSyt?=
 =?iso-8859-1?Q?tdzwFt933rFQYTvVZCTyH+y0H+CCmoLAhr1hmwvDTK+bmCcU5RCHTKe3Sx?=
 =?iso-8859-1?Q?/Vqj8on5PmpepaGGC+189SsCik2ZHBg0ZKxDIw/zfgTIqm2XiDEkuaGAB7?=
 =?iso-8859-1?Q?nUavTo994KWE5Z0NhKiY03lySh6xPPYhgUL3u4Ft18vOg4+JdlRpdORryd?=
 =?iso-8859-1?Q?WtEv84XcR++vFGrgk8MAThoHxivR4lbpFr7BoQeJ7UiOs0GElyaKGuMV/V?=
 =?iso-8859-1?Q?p81aQadld/s9T8kq3HGB0/UWWexSjfaGzfqMCSCEa0t1k6fPv85Mgvco7M?=
 =?iso-8859-1?Q?bMvS6XAJibq+SEEl0lwsHMBQ7Qz0J0R+zrSvoci+5qylARBW7qiuh9kLPA?=
 =?iso-8859-1?Q?Q3XHRhBtiAnoCbK32IcH3qLTQr+DUl92F2zTrYu8UDoUfZFpstL+Ob532v?=
 =?iso-8859-1?Q?C8xjt87N+oByGs7I6oI2DETc5Ph2C+IuBWbWK6EyvX64gvlT+b1TIxvZR0?=
 =?iso-8859-1?Q?+4MwDAemt/aDXqs0GJjsaEUc3BshW5Zah2/s/ulMYtvVI7ECLBVvYF2zOg?=
 =?iso-8859-1?Q?aqFp02uc10WSW+leHSF0cA8VtBlVKJXzNTjwhEQoRCDBhnxaShi8L3Du9Z?=
 =?iso-8859-1?Q?6jW/QCrs/MzJZFEYOHaUqb069goFvfWCE6elnseIf1/F61wJOdQW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a621b4b-1459-4fec-e6a7-08defc8f1596
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 18:41:00.9013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGhS2oxF5ffkqZzanMy6MgoQkCBhVbC493R5/YfWY7weJ/ePiuKS8omrrY7fHCa29f+k3j/UZhzZOV+xnq+3bvHrT6odmtAa2RW70+KJ53CEtOGUGyBnlroSx98BXQUk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8559

On Mon, Aug 17, 2026 at 08:48:17AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] DMA Use-After-Free vulnerability in ele_get_info() when freeing a buffer after a command timeout.
> - [High] Spurious failures and duplicate executions due to explicitly overwriting successful hardware transactions with -ERESTARTSYS.
> - [High] Out-of-bounds read in se_if_rx_callback() due to trusting the firmware-provided header->size.
> - [Medium] Permanent probe failure instead of returning -EPROBE_DEFER when the SRAM pool is not yet available.
> --
>
> --- Patch [3]: [PATCH v36 3/7] firmware: imx: add driver for NXP EdgeLock Enclave ---
> commit ba0b4841b861b1ed1d3d0d02b5e6c1bb39bdf404
> Author: Pankaj Gupta <pankaj.gupta@nxp.com>
> Subject: firmware: imx: add driver for NXP EdgeLock Enclave
>
> Add MU-based communication interface for secure enclave. NXP hardware IP(s)
> for secure-enclaves like Edgelock Enclave(ELE), are embedded in the SoC to
> support the features like HSM, SHE & V2X, using message based communication
> interface.
>
> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -0,0 +1,282 @@
> [ ... ]
> > +static void ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_addr_t d_addr,
> > +				 size_t size)
> > +{
> > +	if (priv->mem_pool)
> > +		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
>
> [Severity: High]
> If ele_msg_send_rcv() times out in ele_get_info(), does releasing this DMA
> buffer back to the system allocator while the enclave is still programmed to
> write to it cause kernel memory corruption when the delayed firmware
> transaction eventually completes?
>
> > +	else
> > +		dma_free_coherent(priv->dev, size, buf, d_addr);
> > +}
>
> [ ... ]
>
> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -0,0 +1,501 @@
> [ ... ]
> > +int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
> > +		     void *rx_msg, int exp_rx_msg_sz)
> > +{
> [ ... ]
> > +	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
> > +		/*
> > +		 * Signal was deferred until the FW/kernel protocol resynchronized.
> > +		 * On success report -ERESTARTSYS for the interrupted wait; the
> > +		 * command is not re-sent. Keep real errors like -ETIMEDOUT.
> > +		 */
> > +		if (err > 0)
> > +			err = -ERESTARTSYS;
>
> [Severity: High]
> Does explicitly overwriting a successful hardware response (err > 0) with
> -ERESTARTSYS cause the VFS to restart the operation, leading to duplicate
> executions of non-idempotent hardware commands and spurious failures in
> kernel contexts like PM suspend?
>
> > +		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
> > +		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
> > +	}
>
> [ ... ]
> > +void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
> > +{
> [ ... ]
> > +	} else if (header->tag == priv->if_defs->rsp_tag) {
> [ ... ]
> > +		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
> > +		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
>
> [Severity: High]
> If the mailbox controller driver passes a pointer to a small local buffer
> on the IRQ stack for msg, but the untrusted firmware-provided header->size
> specifies a large size, does this memcpy() read out-of-bounds past the msg
> pointer capacity?

Please check this also

Frank

>
> > +		complete(&se_clbk_hdl->done);
> > +		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
>
> [ ... ]
>
> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
> --- /dev/null
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -0,0 +1,507 @@
> [ ... ]
> > +static int se_if_probe(struct platform_device *pdev)
> > +{
> [ ... ]
> > +	if (if_node->pool_name) {
> > +		priv->mem_pool = of_gen_pool_get(dev->of_node, if_node->pool_name, 0);
> > +		if (!priv->mem_pool)
> > +			return dev_err_probe(dev, -ENOMEM,
> > +					     "Unable to get sram pool = %s.",
> > +					     if_node->pool_name);
>
> [Severity: Medium]
> Should this return -EPROBE_DEFER instead of permanently failing with -ENOMEM
> when the SRAM pool is not yet available during boot?
>
> > +	}
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com?part=3
