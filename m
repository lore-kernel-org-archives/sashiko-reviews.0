Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013054.outbound.protection.outlook.com [52.101.72.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA6D3F8EDF;
	Fri, 17 Jul 2026 16:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784304899; cv=fail; b=m0fmvesZWtPoPsPMTqtiJLxdPDXBOMXJHw+vCBf8LMFsGKxLsqJzDHerassgz5p54KnpzWkohpLM3v9lJVmse/GljAvrgFGGtVU2HHaR8APvi7Gp5jpP7dEYWiQdxa6axHkTAg8W/rI8nVWIduvYWdBVJKjpuU10xsFS5DEpNmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784304899; c=relaxed/simple;
	bh=uKps7uCdRFADMRQlm0h0DgwMLOluwuGs88DkgtjkmyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pYc2BMeRLGlQMYcgWWN8jlqIaCT2jZw1AxfpGdJlVoiS3fnk/SSWNpBZDFL3AMJxM7NBqLCejZbvdvmzdTNB53Kvcc8kkSXC0MYiS5xaGZdL5+UmohAFICuByro7wtgjA+dXsh1jOPSUXSLBinuLH9xUnH1UlWVzXtvZkJbbgy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YnnfSVUV reason="signature verification failed"; arc=fail smtp.client-ip=52.101.72.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YnnfSVUV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BzBPMDpEqfRlqFcKEuz/DHHM7ed2CV89G6Of6c9/ZMrebSSZdxJEsvsTIUz/ufeZE0740QFiCLURIYwIMjgR1xf7012frY9QJ0JFohe5zjY6at6mnUNfzTnJ3LM+RsLhCIc4wNl0WR1Jb+BEemzI2Bzm83UZw6hOozXpDORwR+rWNsxFqoatXs+xzWteUzwLvb1DYSCPWa8NMRWMBPoGFhSndSTTvAdF+X0FymfkR9vlKGlVop0C3SCiBjwe66qifN0281XNIvZ8+tmwryu63RxmMDbR8RZpqAp0vZKE+QvsH6Yxb2PGNpHNVFuPLn3a8bImDXaNPGDJ3yQoi8rQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNV4AA9x7ZGutxCq6aiJWBQUOZrnAfWBAZjsk1Lh908=;
 b=jwlmEDdD6sScr6Qekit2tvAkYZWaT2gJ+Fyz1LWCrh0qvNFLepocBwRR7yNOnd1oQWfkMhpdTDSLFP5zd8botiyatrVLJdxdTMysef1Vuc+rPJ3+D8oa55at1HIzbV+K4wyJv9bx1SQGyh5fq+Q4iaBTSztB7Y8f9tUGNLmAlGuU+X28dhdOMP4tYbzNhKeTsm45eh2Y7mPgCnPm/enl1tirmcwkIeZKp6vPD2rEgDW19yrPr3YuoM1nP9lu5Yt9QqadB3Ldb/38FwuUlRtoRkIZfwf7NdA0BUmzPiBgka6TvnqvZfgehXGKByWcOZtzPOT6X3z6z0EUuluSfK6cmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNV4AA9x7ZGutxCq6aiJWBQUOZrnAfWBAZjsk1Lh908=;
 b=YnnfSVUVMpZRNLXxuWECuucw33T/AYqyXZLRd0G0zXpLFAOmnENazG4tmB9kF9UGX/dN+yXQJrpNRhEoDTzWFmGZx7lrVjipT6VI+v5NFEvE6R0vxuT0wIIQUcC3A5g6EdnDwCdeF1yL0cKS9/iCfszz5GEV+jR1zpvfeK860IKaKZoZu7bwpz6yN27CUyIXk/lCGXbEIG0kpVJ7FQiB7x8QQ24AH+jdampQFU+QYCndQeF/z6KNPOdOavDeDt3rAI8g0s5zvRcKpWGb1ihPU+AMptZm8/PGbvbKcXCsjZ101GPOxsGcrS11+eufEOmb2x6Hl9WCrIH7bFdMRL9Wow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11918.eurprd04.prod.outlook.com (2603:10a6:800:306::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 16:14:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 16:14:51 +0000
Date: Fri, 17 Jul 2026 11:14:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: pankaj.gupta@oss.nxp.com, Frank.Li@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v28 4/7] firmware: imx: device context dedicated to priv
Message-ID: <alpU8weYCU95_c6E@SMW015318>
References: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
 <20260717-imx-se-if-v28-4-0a9659c7e69d@nxp.com>
 <20260717111353.7D5471F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717111353.7D5471F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH7PR17CA0018.namprd17.prod.outlook.com
 (2603:10b6:510:324::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11918:EE_
X-MS-Office365-Filtering-Correlation-Id: 6834fbe7-8639-465a-8788-08dee41e8804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|18002099003|22082099003|11063799006|4143699003|13003099007|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	pl7MN6ecbVdtZ6CWso5vwb0q3yNUUrKm7i/OcmKzp42pOheCv6Rb6M2ZvE4TRhaNez6AuKG6e5nCIZTSgCB3OIIqbUXZEQYnGqECZs3wLu5y7prkUWzYj5IfbRdKAgqs3HxFAR/TADiXQM8mj6F0+5lbN0bIncJH5KXhCNWq4ERZdBQZ3o+SE73/eRJlpCsD+tclnmZuKj/P7HLjak1bYQp8AaaTtpcSBFu8IEoGORSbACUgZXDCJES4Z43gtSdey48zrXidH8eDnAECtDj0z5ppKfZ2qhl1WWTCnvSgYjDr5E9KnWtB0MMQB1enD4Hns6VYvmc3QGkPni73E4r4oor33v6YiNHHHoAGIUZG3Y1ueQ1Ss9v6V5tkc3Wm4RB0p33Uuk/3l1MxnfWn7RQf/D4kpqdjnUVmSyVgWEYVwVlMLf5cv/CYKdpgObh4SIIRDkJAt/QqjGmMvNs4f6fE6yV1EF1+4+Zz8vHHCg9HnYD0rWDlkAMr65VXA8wWedZICgqQT7dwldjfideJ/Ggt5EjN90//iGpWk8aAcYejVjkViy3uLs5U4doDcOIvyNcD9EGoMa+cFtzmlthFlKfsqplUmjrZApgE8kyvLjoOIjE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(13003099007)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?M5r1VTOTwme3tRK/6mHjgp7h3Xr3qZBx77QdX/3X8bDVCJPqVcukyNd4S7?=
 =?iso-8859-1?Q?69iB+lLpjcKfLPS0ql094zpMAn1+2fmudbgFkzjrc4Jp2yqqi5xmBnD0pJ?=
 =?iso-8859-1?Q?EFcBDXsr4m3pSs5N6N+UCq3YjCjzufBBkcOlSehVVKFsYsRoovcbZ3jJEh?=
 =?iso-8859-1?Q?GvNrZPU26qm3gIAMt+YnC3peSYZeMOUwqhAOygVR4sMmOV122cAYmCtOFP?=
 =?iso-8859-1?Q?B5+cOY0PkcfSp0CYzMEQX0ldnyouwroIHB1gsdx24nUPfMFOQ675TOyXRo?=
 =?iso-8859-1?Q?P00EhRud+pqP340lOqxkiAUERmvojUB7nvLGd9geIQNZOHXAwueFphizO4?=
 =?iso-8859-1?Q?lmarFfHJZPLoRHN6h7lR0/8XR7KH0VsFYtVN436o3Tn+Y2NaLOH3JenhmG?=
 =?iso-8859-1?Q?gbLGkZjtYuF5lRM9Azszv/3iTGk1r+IgY5Su3Yk4XZMeZkJCcg4lH4oZBg?=
 =?iso-8859-1?Q?uU0dkpXEVESdSnG1iqwvEd7jLgpU0K1SOXI/kA2Bw20sZlEylAGIdzvveA?=
 =?iso-8859-1?Q?zux0VrwiJnHceGwvKFU9qbPLIrUOcthd6HO7DJhDOfC/vGdkrafNeFjeQL?=
 =?iso-8859-1?Q?fgbjHfR0MscyFqecs/RRea1wXl+8s2+FB5vl1qcQoEoMq7BCJi5nUK4TBP?=
 =?iso-8859-1?Q?YOPTRCWli3/Ka3bIw2yx266ugbhd6zT9+186r49YoSIV1bzLCgB8jjhRPX?=
 =?iso-8859-1?Q?ElO2IQdQ89eZfbrKye3DB5ki1P1WHON5WaBkR4lET2fG3HT7ysZV5HqYAj?=
 =?iso-8859-1?Q?9TYVDZmr5QBNup3YtQRp4YubfYizos9Sazd/na6XIAeODStgI9mhESgnKT?=
 =?iso-8859-1?Q?6HclpvXzMKwyNMF2pLwlw/4rTBxEa0pXsFEkgseC8J5RHX+7jH5U+YFb8B?=
 =?iso-8859-1?Q?bNKi1q3C4olvoJIw+8D2fbc2+Vsd/JiVl43dy5JFlS70q+C/5sSkoMh7vg?=
 =?iso-8859-1?Q?91H/Y4cxRsN9N48zIZnNRMtgYeu5rUdCppjjBETOS21ss147+N9X4bP1Hb?=
 =?iso-8859-1?Q?4hmLkeXQiK9UQf5+4hddd/QA+1C/B4s2v7+hxas7yyaCohgRWxPhVXQyFJ?=
 =?iso-8859-1?Q?bqz4VAhnbO3vuA2zYR5xMVEIQXxECQUuBZw8OajRuzayKMDzOqoq+pP1FK?=
 =?iso-8859-1?Q?CiIhkpKUHcuDEzlXl073JtQOb6vDjxI/ALIABb4W2xxOjT6WSxqJvnQS02?=
 =?iso-8859-1?Q?by8ADuUXfDacfzeVDVbUzzUur3wdg897wvfTD8bgRfPz9wBL27NCzC3pdI?=
 =?iso-8859-1?Q?eVHnc6qZssRHEo3gZFOCvMFU2lDCcgwKUto/QxZV2Vo2gipDoglF7YuUDX?=
 =?iso-8859-1?Q?5/Pdg2pnofHkkZQ9uAtHHzOf2Khry5ioZfC0R8NLGn/0L3s1a0KEUHtVE6?=
 =?iso-8859-1?Q?IntfISYJarcK4nJkNIdpiY4g0nWtVpaCwXWa6HDhSIfi8utO7zNy1smSWt?=
 =?iso-8859-1?Q?qATP4oKl+Czr5XH9X/xC4rCjyUw/j6yq9L1rlcdlt3a5MQjdkBAVVbzciM?=
 =?iso-8859-1?Q?5qFxtsnCKvLU+ALw4lc4KbrFYMSDzBlb4g7cIEs6rsNmf5MBeYBKG7kyeW?=
 =?iso-8859-1?Q?U+pBxS2zQeg5sZvLe6SNQxD4TIL52Ka7iznYTkYTgUG0E2QsQKsHLbHOF1?=
 =?iso-8859-1?Q?oMXdtje6PhUneoVa5q59EOJgxwGqdYgWU9i432p4hQtHOd1mtaQHww6UT1?=
 =?iso-8859-1?Q?sY4ksAizR68h85+C/lb5iLtcb3MBgq95688dy1pts+MMBmkafvv5DGWxpv?=
 =?iso-8859-1?Q?23ZLpl9eZFbT5hBp0tseFJLEdtNsCi5ic3XhgVIXN9lHXg1jJSwBq6dq+r?=
 =?iso-8859-1?Q?N9Kd6YU4OLmNIDWvuvw8tjXVrQB/MSm/bzg7v7vfDUlzeXbH0dZ/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6834fbe7-8639-465a-8788-08dee41e8804
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 16:14:51.8658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeEOVBUU8ZN0u9P+lxy/Zq2ZEewDO3FGVTdPEV9puFDHIPX2G2oD/xTXEViaV7+/pOyUMqHeojTTEoZWjH63MZGVhsMP4pcBQ0PazqYKakA7FwUrdN3477/tqzejzfmK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11918

On Fri, Jul 17, 2026 at 11:13:53AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Data race in `ele_msg_send_rcv()` when initializing `waiting_rsp_clbk_hdl` state, leading to a potential NULL pointer dereference in the RX interrupt handler.
> - [Low] Unused variable `flags` in `ele_msg_send_rcv()`.
> --
>
> --- Patch [4]: [PATCH v28 4/7] firmware: imx: device context dedicated to priv ---
> commit 64e554919e156aa88c2007ef9dd9fafde735e583
> Author: Pankaj Gupta <pankaj.gupta@nxp.com>
>
> firmware: imx: device context dedicated to priv
>
> Add priv_dev_ctx to prepare enabling misc-device context based send-receive
> path, to communicate with FW. No functionality change.
>
> Closes: https://sashiko.dev/#/patchset/20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com?part=4
>
> > diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> > index ca8a32a82689b..1ca22c53b55c4 100644
> > --- a/drivers/firmware/imx/ele_common.c
> > +++ b/drivers/firmware/imx/ele_common.c
>
> [ ... ]
>
> > @@ -149,34 +151,38 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
> >  	unsigned long flags;
> >
> >  	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
> > +	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
> >  	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
> >  	priv->waiting_rsp_clbk_hdl.rx_msg_sz = 0;
> >  	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
> >  }
> >
> >  /* API used for send/receive blocking call. */
> > -int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
> > -		     void *rx_msg, int exp_rx_msg_sz)
> > +int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
> > +		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
> >  {
> > +	struct se_if_priv *priv = dev_ctx->priv;
> > +	unsigned long flags;
>
> [Severity: Low]
> Is this flags variable used anywhere in this function?
>
> It appears to be declared but never utilized in the function scope, which
> will trigger a -Wunused-variable compiler warning.

Yes, fix it.

>
> >  	int err;
> >
> >  	guard(mutex)(&priv->se_if_cmd_lock);
> >
> >  	if (atomic_read(&priv->fw_busy)) {
> > -		dev_dbg(priv->dev, "ELE became unresponsive.\n");
> > +		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
> >  		return -EBUSY;
> >  	}
> >  	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
> > +	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
> >  	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
> >  	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
>
> [Severity: High]
> Could these lockless updates result in a data race with the interrupt
> handler?
>
> They are updated here without acquiring clbk_rx_lock. If a delayed firmware
> response from a previous command arrives concurrently, the interrupt handler
> se_if_rx_callback() will execute.
>
> Due to CPU reordering or compiler optimizations, can the interrupt handler
> observe the new rx_msg pointer before the new dev_ctx pointer becomes
> visible?

Please check this

Frank

>
> > -	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
> > +	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
>
> [ ... ]
>
> > @@ -302,8 +310,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
> >  			dev_info(dev, "ELE responded (late), recovery FW available.");
> >  			return;
> >  		}
> > -		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
> > -			*(u32 *)header);
> > +		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
> > +			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
>
> If the interrupt handler sees a non-NULL rx_msg, it assumes the transaction
> is active and attempts to access se_clbk_hdl->dev_ctx->devname here. If
> dev_ctx is still NULL from the previous cleanup, won't this result in a NULL
> pointer dereference?
>
> >
> >  		/*
> >  		 * For rsp_tag traffic, the sender provides the expected response
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com?part=4
