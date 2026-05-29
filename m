Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FE03DE457
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 12:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056014; cv=fail; b=DF1nnHIx0HdeEglyPnnRY5j6GovzKFXUAlMadx70GY9YW7EAgHfj4gKLRoTgw1ZJcwzVMoqIB+huM3/oti9drDjdXttt2uVjqXIO1Krya6noC/EEySbhLK0GhNq5hO9PKD8U8PTwjfVYaWguKTFk/2+ad1GITpO+lRhnWtyVt24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056014; c=relaxed/simple;
	bh=nFbCDaIseQoSKq5p3kAchXxmRFmGeLXGZw2rOu0wnic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I7zncdoevEMh0YV+doSnOTb2tK+MRHeGCuW070QJfxuApbjxyF+bP7sgH98kjlv32bCp4RsA5sgx1I5uCpm4pAp/uMqBb9bs48uESOVynu2ympqLCJHd0JPciWNN3Rx2kP/EWPlk/mb9gj6qMNkxqG846vZRQW4Lji+dImiPqOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hea/400W; arc=fail smtp.client-ip=52.101.65.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hea/400W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LD4YK6NKYPqudF8O58dY4ODo2xU3s4lDtIgpCOJLDv3Wa6oevcXxXa4nzEsHtf5l+s9Q6+Ro/uQJzyQEpprVDUikHZ0cRgSz/DcSZ7JDNrdpvSu9LDtaAlnl2nVij4vroxfr8C9h7BLhN43qZQlpAzgkTQcNuOzx/aXS3HvV1H/67B9v9QNglI7X/85wAJZnK8pmHE63IThNsT8XSRKvrTi/4dyO+1+6OE5TOvncEjnMR5PLEgcJdPrwus6B2GCJuOPR2W6hf9gNl+GDlnlURxXhLlDh9s9Vu9gRICCZsclAy8kxAD05BDFgOoZfFeQL2nohJGbOOHGQGOkaqIY2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB8znex3XnjguGWIBKZLrwcyNroIqs27Alfqbe6C67w=;
 b=DeNcaXFjhUUCnGurfq5o5OUtn99J7+/KBf/PbsetJ1kZlUYrJIsRnqLpONXCDnbUB6v/wxtxPBbGgzT+7LJ7v1xPI0b10N1CI2tQ+neYQ4sgdvDXiz6AH2rDx3VULyHQQSsgGHhfLjT+tDIRfCPyGvetChFq2EjPN8xaszgImbCIZRXF1MQSs/KYls6UvLNWbRV1r9ND7KIkhRqLT9bfziAU8BbTaueKSqh9YalyUjIiXzZ04Ra9soUL8KmiyyFHPr86uVcqEfeWqKNe578hr8HYQn0qq3Z8aKb1oYOyu8LWWK/5sBk7kF88U4sXSF2fllKe/BpI+XVjN55fw4qg3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QB8znex3XnjguGWIBKZLrwcyNroIqs27Alfqbe6C67w=;
 b=hea/400Wl6sVc7hchNu98xWX4jDH9VXRkcvLwPSjDCLKOy/jFZLOOf6few2XlATj4Osw2VX3MJFo9djkLzCWNJEM63RCswWSr5tHSfUBbrC+19Nr/LV5edhb5xJyAECLO474FofEx/jyaa5bvRk6qMJan/04gntcejQK8Yjw2JLT0k9Wms0UdxZoOkL33QysfUA/u/ZGg0VVpDqCIdFnGvl6zWQiIz17sL3ODPUWBfDZwkpNFSoC10E6yb0CvnPrWaDyve3AVGDfF7FULkRDpPheaNOaIa+71eY4ew9OHyQGOJP4ZqKEUMrHUKGF9IEq8FHZb5Onmb20sj0RAbaXCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AS1PR04MB9358.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 12:00:08 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 12:00:08 +0000
Date: Fri, 29 May 2026 15:00:05 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH phy-next 10/13] phy: lynx-28g: add support for big endian
 register maps
Message-ID: <20260529120005.icj44ffdvdk25fjm@skbuf>
References: <20260528172404.733196-11-vladimir.oltean@nxp.com>
 <20260528174757.9AFF31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528174757.9AFF31F000E9@smtp.kernel.org>
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AS1PR04MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd78dd9-e184-48bf-b54f-08debd79d46f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|10070799003|11063799006|4143699003|18002099003|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	unQBm6Pt20eHVa+DV62I28mf4cmbBL3/6j/pqdW7i59qQyUcofgVJy6l41lh8JUSIdVzzfg+53KHU/LBVO6u1CR+hWvtpO0EnKN+qWtJECMHCDogxsik03tTQDhl3iO9HAhm6hZNntWd8Ty98ja/remNGkjhDSBuQObFYOVSpj/tas4wGZt/WsNykodTceYKqeRnUwLFAmCa/f8ggngKRo762j/Q8TJKwsOMBQigJPzlm+nxhIzEHlQqDr5RPkfnV0gydyeBznuMccj32HDbhLG5U3Xk7z7rbzWtbHJuHQuouq3n/+4C0E3tH/E8sKInn5ZAYE43B2mV8UZfkzVaVGDmDf/u147TpaULIszda8oOO+Jje9sozb9zxTskI0HjP3HDtWsLMe0rnQmjs3nRjcCu35NCaqPZFm6eKntb2Lc77EX5BDji6Fllm5otliRN30qQzlkR0gyzW5hMVWmqmqNbrB6twZUqWxBLgPcoPTue5uUWWdGd+SkEIQaw9X1SGCKASLv1AO97EhNQom/w4nKRVwArR64Ud72ARZ83Oz+ILWAKmyorOJJdC69Qimp2BhZ1/yLaoLSH1r2nLgutf0OlOmQr3I2DAVIBNTR2HB31gWjlPblg3DFdLyQV7ViIvnXPUJq5v6BRpK6WRyuXsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(10070799003)(11063799006)(4143699003)(18002099003)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?naeT397RNYpMqG6DUY5oKlqbrObygMzijgLs2v5pJljNNFzR46k23PAnfH?=
 =?iso-8859-1?Q?Vb+U1374B+ScFSYBmRkyPA/mLMpwjR2CFdfzdseeU41NMaFyLaVC0zP3OE?=
 =?iso-8859-1?Q?WQpI4D53Um6tCiLIaDDkTiZocmAKleUh412xyxayMgVwpGsnr26idHyLpC?=
 =?iso-8859-1?Q?Lrb6ybhw9FPUFJ6zzXXkiZt2aGmZydZj8j8kyOEneUAOVTrNAJM7k8bQ3D?=
 =?iso-8859-1?Q?V6G5yGdsHD1RsJkAeENKfYYJjLrBGSXddGBw1GYj+B6AGdka3y7ZChxrSU?=
 =?iso-8859-1?Q?fxGbXB47fM5D5S+aGFrOuR8kAZxrHtRssBs/bf+BlMuGJ3/w2Sdmiq8r08?=
 =?iso-8859-1?Q?b8vREcDiwaDUyS8xLuPSpEIzs1Txu8SKN97lp1rNU81LS6GHzMz0sdnrPr?=
 =?iso-8859-1?Q?Uycx8vVz3A8pJTSIbynTnM0rXsZXsF4833UXHnvqdOFJaWCP0yYxIn33eG?=
 =?iso-8859-1?Q?tgggsQr0+k0W5cw0Q3FCNqCu5rDCZ267bKSKkHhdmTMca7TBaBX9A87RtQ?=
 =?iso-8859-1?Q?sHjtZ/drkk8GEvJXbKG/CUa14Op1ZNnpw74RpWTG4pBjjM2wzjJGqaQ1S1?=
 =?iso-8859-1?Q?LORh++5e3GcP6dAAmhwbA+OcQDCZj+mk0IiM0OIGHfu4OUvDgezOTCN3+Y?=
 =?iso-8859-1?Q?aj/GVl7RiK/ywM7LUxAa+K1aqglXs1kOQqgNf3N6feXv7FMC1m9Qj+GB1y?=
 =?iso-8859-1?Q?bnIEvRAITyDD2U2edli8JDz1FMDWabEw9Uzg+D9Zw9eqOVSL5i14cvruk0?=
 =?iso-8859-1?Q?eIJHWKmm7KkAycLKbcXs8ukHQGnTRSLZWam2xJeg2WKJ++QcZLVmeLgihY?=
 =?iso-8859-1?Q?z6SoTfIlQyLfjYtm1xtY48IomcpfjMn9KSpVKgVMWotf7ozUTsh0+pPdUc?=
 =?iso-8859-1?Q?K8CXYefwWmQ2ccvQuZOoUK2VPF99yq1t/AwfxTZzan1Wl66P+jesfPJLxl?=
 =?iso-8859-1?Q?LBGopoGOvIBW2mmaO9IK3xPBSV69X1ibBKrH7bwKSvZBmn9dEuxrQNBnR9?=
 =?iso-8859-1?Q?UWD9HMfVvT8NkVPo48E8cFNrwBPKNyv5NWjJh2bh9QQsietjXjTKw/RZOU?=
 =?iso-8859-1?Q?Cho3Uu/qKp5T/x+nAJYhvzSjFZoRtWin1r5lYNYj49uhSWz7S/vTe0rXep?=
 =?iso-8859-1?Q?C6Pji1w3qnoRGep8lY57vc/6prU9GTpXwE0pNkvD0X+4wmfmxuEsUOP7C7?=
 =?iso-8859-1?Q?6xcnwfsCceB1qPNEsSQnm+W6rWu3x8VB+OKJFeZC0sm5KjgKUeJf1mER5G?=
 =?iso-8859-1?Q?yTDB7BriBqT6fxcSm1VOHcDiywi7/g6NF4P1m9ckBCvXQVIo1lUG8av07T?=
 =?iso-8859-1?Q?jY6Jw1LsW17IDHf5nL3RG25/YB+LOISrnRqMxdKnLxmpPWd9/rtRl4Q94I?=
 =?iso-8859-1?Q?w945VxTfMjRFVlcT7eI3z5/Ic/j+6xIrPQplqdXFPLgy8B+aGbVEWaBMfi?=
 =?iso-8859-1?Q?o6m4tLUBlchGCBjDYu7KlY+UMJKgY4S0LKSZmMAJTTeZWKNRIoX13xDlh/?=
 =?iso-8859-1?Q?MwNZe/VpADoIhNnT7JnmwZL4UA3AEsWE2cZhmnKP7mR+9Vv9Oz9RpPOu5H?=
 =?iso-8859-1?Q?LNopsLaZh8NqJgTY4m5PhuNY5M5WpVgu1GqLrxMGxNZYmcn4FfSOIMtdSf?=
 =?iso-8859-1?Q?YHLLHRTqq7UEH24ZId7FlYo1xBTgDzwY1ZYevqVF+eRUsr7luVNzVupSND?=
 =?iso-8859-1?Q?xdU4vPCtYaXxeCAAdF4+tzj0YOdvO0LH0C6wGShDtgGoVpdc77WaNsz/Qk?=
 =?iso-8859-1?Q?eWLrRx7VmGz+ldvDlxPC7sk4591zwyxQtVMsL3lx2mA0DR48lkCeHvrZIn?=
 =?iso-8859-1?Q?YIE39OiJ3sbD7q2Y7vpa7sT3Tygudh67gMDYSZTFQt4/U1D4XJXccvfi3r?=
 =?iso-8859-1?Q?pN?=
X-MS-Exchange-AntiSpam-MessageData-1: bQzTGUDbKiaQaNayuG3VAOCa7bWJTDEk9is=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd78dd9-e184-48bf-b54f-08debd79d46f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 12:00:08.7737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEakAAJYZjG/8AvdPHTDoaKLp2paktz9YEGQfTaBZtONWzT1oDLCzKcpQWwrsf+6gNp5FJZpvWi7RUgqJcSPJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9358

On Thu, May 28, 2026 at 05:47:57PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Returning an expression in a function with a 'void' return type is a constraint violation in standard C.
> --
> 
> commit f3cbe0a1122ada7c6725f37e9dc47932febfd4ad
> Author: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> phy: lynx-28g: add support for big endian register maps
> 
> This commit adds support for big-endian 10G Lynx SerDes blocks. It reads
> the "big-endian" device tree property and updates the lynx_read() and
> lynx_write() accessors to use the appropriate ioread32be/iowrite32be or
> ioread32/iowrite32 variants based on the endianness.
> 
> > diff --git a/drivers/phy/freescale/phy-fsl-lynx-core.h b/drivers/phy/freescale/phy-fsl-lynx-core.h
> > index e8b280cc9b38c..d82e529fa65a6 100644
> > --- a/drivers/phy/freescale/phy-fsl-lynx-core.h
> > +++ b/drivers/phy/freescale/phy-fsl-lynx-core.h
> 
> [ ... ]
> 
> > @@ -58,36 +58,52 @@ struct lynx_priv {
> >  	 * like PCCn
> >  	 */
> >  	spinlock_t pcc_lock;
> > +	bool big_endian;
> >  	struct lynx_pll pll[LYNX_NUM_PLL];
> >  	struct lynx_lane *lane;
> >  
> >  	struct delayed_work cdr_check;
> >  };
> >  
> > +static inline u32 lynx_read(struct lynx_priv *priv, unsigned long off)
> > +{
> > +	void __iomem *reg = priv->base + off;
> > +
> > +	if (priv->big_endian)
> > +		return ioread32be(reg);
> > +
> > +	return ioread32(reg);
> > +}
> > +
> > +static inline void lynx_write(struct lynx_priv *priv, unsigned long off, u32 val)
> > +{
> > +	void __iomem *reg = priv->base + off;
> > +
> > +	if (priv->big_endian)
> > +		return iowrite32be(val, reg);
> 
> [Severity: Low]
> Does this code unintentionally return a void expression? 
> 
> The lynx_write() function is declared with a void return type, but it uses
> the return keyword before calling iowrite32be() and iowrite32() which also 
> evaluate to void.
> 
> While GNU C allows returning a void expression as an extension, standard C 
> does not permit it, and it could trigger warnings in strict static analysis 
> tools. Would it be better to just drop the return keywords here?
> 
> > +
> > +	return iowrite32(val, reg);
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260528172404.733196-1-vladimir.oltean@nxp.com?part=10

This was intentional, because "return iowrite32be()" also stops the control flow
and is more succinct than "{ iowrite32be(); return; }".

I thought the pattern was widely accepted, see include/linux/skbuff.h:

static inline void consume_skb(struct sk_buff *skb)
{
	return kfree_skb(skb);
}

Unless a human has a valid objection, I will disregard this feedback.
