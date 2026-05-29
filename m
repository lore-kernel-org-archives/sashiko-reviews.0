Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011060.outbound.protection.outlook.com [40.107.130.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5441021ABC9
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780058864; cv=fail; b=bl4gLhSkwrta6JgtUuhLcLLz2VQT3cQw9qvhX4m3EpKoGsKhpAWLRqoXy8kkVPlAyq7Q8wQ7B13Udn60145MShtsC2+Qnyqp1IBAexdW/jGuhaaz2FLmzwLJDYBec1z7FfQEoUiwUpLHewh6TN5k7xoUUOhPVIOJGIYxY8it80g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780058864; c=relaxed/simple;
	bh=QuUyJhsbxiX45D47DN7/z7If+2C6KtYCPrQIcFxe3g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j1Ih19+Xzw6E4m7LMsJDEZy4056KyoGLWgaHUDDKBTH1gNmuXTXrQr9PiQLQF4NjUqRcbk/z3RSByqBnXs61xuz+a0WTJzZ5M1fv2CT5Zi5zhYvguVD2DGr64hH+UYQBpeTHT5f2N4ksFwjSqwD/4cP9BXfryFo+7wIOFojMF98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Oj5+62eG; arc=fail smtp.client-ip=40.107.130.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Oj5+62eG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9zt2LofLgFp/Y/wetgAsNzCnsBmZ0v1lzNH3VBgWXTU7A9DSFDylijeGPhoZm3Q2i76d0JQCW97BlIckk4pbQDqFEIM+Ztc3tm0EN0WAsMiajQi0fPUcvhMePvV2DMIvCnUzfTNZzbvZ7EK2ocxggkz7W1q86zK1HACK+560dAG0RYT851hlb6suWgMGHnrHlWiIGm0h4cmz+Vp/iEgfqSeuSBF7bo8IA4Vs0F+dGxwyJrM3CFcHm1BOkiMjkJ0Ht+WZeUbdsANOsLbY5xnmNwnn3v063teQ0B/D5+KzUav6mRJQuz/WW+yIqbKwji0qB1CScqGPPsbYupdlf8gyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgfNtLeDGD1Hj1dD41EUfLVFfDT0DKy9SRMAF352lgc=;
 b=bHKt/MV+Zx5sR2Y6KYb+I2WiklFS2of+OvyZmr5LifYWsDh9Wq+/sijVQ1cYf9x4U6nkcZjmCEbmk/KrDCxKh7bMGgCiRI06pP3X69N4C3yDFaWRKkGQ2obGfJpnhhC9vSsulp18LpnEqlXKLZb43Paj61RCx7t1e11tt8XHx9hsrLOoGNXhd0JZtoWOSoFxe+z4UIETueH1scUPBvXSjlX0C20+vB++TajcNOsOFUxrd1QFL5yooXRsHj2NTSQ38iYXtYsmzryWkKM+7slSQT1Y46939HnsUozbF6VxKskWedUODItzSt7YqXazCZIiQumk2boTyy5Tz6LYO9T9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgfNtLeDGD1Hj1dD41EUfLVFfDT0DKy9SRMAF352lgc=;
 b=Oj5+62eGVsWR0n1E9tFFMUr0w6DVhIThj+CawmBSe86aPoC44FCye8DhBmZR6ZW91xdKOaaH5+mHHIPhImU8sstKcrYJyOEAy10LOR8K928WtOwmZP9R5QQrBI1xr97Wt0+OPNa57HpfZBFzBscvW83mYBHo2+oOxwR9pmG6aBUomg9xsamJjvNPf2WHNmj81ZVY04rnhdK/URzDexMtCzeNTbLMYhsIeJmXKmXOVIjEhYZUq6KQC2ctwtHnEAbS7osM7JNVCUbTYyIM9rlxxwqfRXK51GKffZcubJY8+UeDvHMyn9+vZP8LNPqvyU4DDY+xn+udaF0n4PQz8Ia5Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by DU2PR04MB8981.eurprd04.prod.outlook.com (2603:10a6:10:2e0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Fri, 29 May
 2026 12:47:40 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 12:47:39 +0000
Date: Fri, 29 May 2026 15:47:36 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH phy-next 09/13] phy: lynx-28g: common probe() and remove()
Message-ID: <20260529124736.k63pevj6v6qqi4hw@skbuf>
References: <20260528172404.733196-10-vladimir.oltean@nxp.com>
 <20260528180215.9B1D41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528180215.9B1D41F000E9@smtp.kernel.org>
X-ClientProxiedBy: WA2P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::26) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|DU2PR04MB8981:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c1caad-73e8-4b7a-7790-08debd8077de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|10070799003|1800799024|22082099003|4143699003|3023799007|11063799006|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	EpWb+9KAk9xj7dlTjMMxT+CPxwQ0e4hUce9zTNLlFfhV08hSP4qGzbqZrjucjACMzKbk65qayPWr/wcV8xyNGAAHAGa9FSr7eXzdRmogMvhm1cSCoxmpLcyNx8EgvDJ72y+gCicueUkZ6P1iJHVcB7bzESTS567dooEfs0H//AKFkh/b9qNhMhpGLME7FrmSFi5MGinTxoVlStWyLMb5ixxNzvdJCvN0MbXADA7gtzoKPTS6OM5B2RdT0Hej1Nz5Au+8faN5Hx2/HFPp7xSMyp59dJrSYhQpFTCTltg09CG8M9jnGYAV2l5M12q5Rvf32bjMdnb+9iTDf+VaNv+/5RXtLQZVpzIv8yRjWeO2RfNIM5/epGFDkA0/jlGttWkqZpoMhASyXUsZttWJUCmy0ZLXx44/X/MmXZsLGCPR2j2EW+PRAzAozTFt3Zpf7j531mhsPM4LkIve8FGVut1SozygxUkPJXVrQxeuGyXancdfdiT3MCjYak1TF8qyteDGWD8HkirZF7P9CjBhA/H0ovU/9OTYIqK0xsiUlkBNpNrEsFPnbm8c9zl3As/j27+RQPbOo3SGApdb3aTYruQrWpVL9xIIQwA+97DbXKoIVXOBV7xEXJucP3rfZ7xw9KU+HdS5fq77z+MjPWKA/6zZSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(10070799003)(1800799024)(22082099003)(4143699003)(3023799007)(11063799006)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?AhTgdB/g2P20OdQlLaA8a7x7dJq2JFtaen8rPpkVVfJf2DBKx/po1n2so9?=
 =?iso-8859-1?Q?Sal+XOEXKoGGP6c4Tr7q26NzqGLlz7H+dh3CT2hywPjGj8vw+cirHXk2LZ?=
 =?iso-8859-1?Q?XwkNOXWwRF8VjSb20lskeVNj4ZauSMRGVneGYLFGpWw29oWKGRJaC39ZB9?=
 =?iso-8859-1?Q?Tgy2x2vTHvK4YgC65VnSX+Pi1tRgW6RuVZeJeDnewUK19oqgiEhO9MFxhB?=
 =?iso-8859-1?Q?oEiZIvxSO324+bd6zm7V+M/DXTR0y/dJqM+27Q3TySuMcaihDvmTyNloPn?=
 =?iso-8859-1?Q?WSBciZESds87UA6oofCg1JSEGEhk+NgysTt2S7BObDnWD1H0LqZbdAOV9e?=
 =?iso-8859-1?Q?zCOw5llxOgICmfXg1jgqbK5XW3AuK+BHTGD1YVoVTHx+fMDeb+hyYWlWeA?=
 =?iso-8859-1?Q?LDAgMGjY89Otef9WHPqz+hH0XWTLKRYe3LkcS0ei+Pv+JHaXnoLfQ8eQvk?=
 =?iso-8859-1?Q?E+2T5r0wzFCK/TI//Oxyx18CKXrFWG7E8Oz8xAgB5MXxt4MuI//YCXhT4F?=
 =?iso-8859-1?Q?09ZMDMdY5TkXdKjhSbOlq33elMUnJWdC2ub83jhmva2FGm1y2klClf12Qo?=
 =?iso-8859-1?Q?gyROf7j9TPbw/JQGddGp7H2vxFFAKVjHHl4qClJNtx8cAx9xPMs3VDDhx3?=
 =?iso-8859-1?Q?adirNQQzqrMNJGXooBMXRd1oW/wzdeLHSIQH0dnYUQJjNIjrVzIBxCIdtN?=
 =?iso-8859-1?Q?VTPcS8tK3wjf4QMckHuLEB3zCVxL1DpUnWEyPfxZ/pN8Nmb69v3Dz1rRG9?=
 =?iso-8859-1?Q?C27H+u72bX/JKLkrH/9rbH/+mS7D9ZoJAMhobdscnhI/pCFunN73fTfiLK?=
 =?iso-8859-1?Q?UaQQkSGUt/vo1ugQRwLDTySQVWrtF7iTEK+hFB7lI2zu1V8OTnzUyIHVJi?=
 =?iso-8859-1?Q?EdUdP/Q7aBLNlZqdfOpUX0jrYOc6GYZ+3/jhN6ByVPirjSY7lM9dS2GAL3?=
 =?iso-8859-1?Q?n0r/I3zpwsoTD3rU/BiEyQwNt3TYw02ntP+xbRr6qQWpL5nAiCtQxzeOc+?=
 =?iso-8859-1?Q?+46Lp9tx0Gcv92i8nu15lBbY5SurUNeznqnj1BGE4sC6mnRlbXG1buVtAR?=
 =?iso-8859-1?Q?nH6j9B5Sm+2DyBU5HEWPlClA2hh8PIOCjBCv06U7yGg3Z1Gumql1T9TEld?=
 =?iso-8859-1?Q?2VmL3szOkzM6aryxNXqwV9tS1rVYCtygC2ijtHIFXsPiPCiGOPqYAiWKbK?=
 =?iso-8859-1?Q?crrhklM+icE4vc3uuxc2/+pHJeWqnRo4STz1GgM08H16WYkY9iGPmlnlvN?=
 =?iso-8859-1?Q?pNnF8fyH1DVYRc3p+koAwd2TeKj6jHSZ+36xGyksjzDUkfQ+YJ/vzT6bEd?=
 =?iso-8859-1?Q?yYdgna4YSVxardZF0QdssIRgPwQymRCiV7CXdp9nJFioJQAGGKsWyYDdh7?=
 =?iso-8859-1?Q?RcCXpX4gtbxCbUWxEFYd/oudmr/RYSQ46e2jRYG/OkYp+v+MQHLdbch4EI?=
 =?iso-8859-1?Q?UsOQMoUxASE5Zq3soJPWfnZBu053S99eNscQZlSFqIGw+N9bCz2Jji9PdH?=
 =?iso-8859-1?Q?msFgTgmWHyZtu128PpdOZapynqcCpDEmJcia7bIkw/C4V7KpDCJOaCoeFX?=
 =?iso-8859-1?Q?CC4xP/lKD2oXNv95AkmZdo76M13ndyD+C6opPYIgq5jFGiUOgkdUZOOygt?=
 =?iso-8859-1?Q?89kFFQkpcXx2p9VjzYZmplB+K8cWSQrYfMgRkidpdMZV1nVAvNGi12dxdf?=
 =?iso-8859-1?Q?u+/79o0U3OD071/WgLbnK3Ez1sBARJGCswoONQ/dWdCmOkH43OqhxB9HdU?=
 =?iso-8859-1?Q?EmXJJtdq/V9uLEqJplCrUpO5s+PZF0Bu55bPnJO0pQF/w4jLre+Whv4YBB?=
 =?iso-8859-1?Q?tPHXdUNrqypnO/WspKsRFex5pHNWDQx1WvpAFsKZ4lGoVE3gr891I4nTlG?=
 =?iso-8859-1?Q?mj?=
X-MS-Exchange-AntiSpam-MessageData-1: 9sDb2CN0MESVD/Iq5aSeX2Ga9ZiIpDBBx2Y=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c1caad-73e8-4b7a-7790-08debd8077de
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 12:47:39.9043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YadzNzzYMaPdLrC5Li0WauqDB8BXG8aZcCq8Yfr3aLSN9ty373woKsGCNzPRdhtattf3BKNSIbXSG1jfmJzVtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8981

On Thu, May 28, 2026 at 06:02:15PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing NULL check for the result of `of_device_get_match_data(dev)`.
> --
> 
> commit 4307af42a82313eaf19153e90d7c48e0bd5f9626
> Author: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> phy: lynx-28g: common probe() and remove()
> 
> Factor the device-agnostic logic from lynx_28g_probe() and
> lynx_28g_remove() into lynx_probe() and lynx_remove() inside
> phy-fsl-lynx-core.c. These will be shared with the 10G Lynx driver.
> 
> > diff --git a/drivers/phy/freescale/phy-fsl-lynx-28g.c b/drivers/phy/freescale/phy-fsl-lynx-28g.c
> > --- a/drivers/phy/freescale/phy-fsl-lynx-28g.c
> > +++ b/drivers/phy/freescale/phy-fsl-lynx-28g.c
> [ ... ]
> >  static int lynx_28g_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > +	const struct lynx_info *info;
> >  
> >  	/*
> >  	 * If we get here it means we probed on a device tree where
> >  	 * "fsl,lynx-28g" wasn't the fallback, but the sole compatible string.
> >  	 */
> > +	info = of_device_get_match_data(dev);
> 
> [Severity: High]
> This is a pre-existing issue, but should we check if info is NULL before
> proceeding?
> 
> If a user binds the driver to a device using the sysfs bind interface, and
> the device's OF node does not match the driver's of_match_table,
> of_device_get_match_data() will return NULL.
> 
> > +	if (info == &lynx_info_compat)
> >  		dev_warn(dev, "Please update device tree to use per-device compatible strings\n");
> >  
> > +	return lynx_probe(pdev, info, &lynx_28g_ops);
> >  }
> 
> [ ... ]
> > diff --git a/drivers/phy/freescale/phy-fsl-lynx-core.c b/drivers/phy/freescale/phy-fsl-lynx-core.c
> > --- a/drivers/phy/freescale/phy-fsl-lynx-core.c
> > +++ b/drivers/phy/freescale/phy-fsl-lynx-core.c
> [ ... ]
> > +int lynx_probe(struct platform_device *pdev, const struct lynx_info *info,
> > +	       const struct phy_ops *phy_ops)
> > +{
> [ ... ]
> > +	priv->dev = dev;
> > +	priv->info = info;
> > +	dev_set_drvdata(dev, priv);
> > +	spin_lock_init(&priv->pcc_lock);
> > +	INIT_DELAYED_WORK(&priv->cdr_check, lynx_cdr_lock_check);
> > +
> > +	priv->lane = devm_kcalloc(dev, priv->info->num_lanes,
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but if info was NULL as mentioned
> above, would this unconditionally dereference it and cause a kernel panic?
> 
> > +				  sizeof(*priv->lane), GFP_KERNEL);
> > +	if (!priv->lane)
> > +		return -ENOMEM;
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260528172404.733196-1-vladimir.oltean@nxp.com?part=9

This seems to be true. I was able to trigger a kernel oops by running:

$ echo 1ea0000.phy > /sys/bus/platform/drivers/lynx-10g/unbind
$ echo lynx-28g > /sys/bus/platform/devices/1ea0000.phy/driver_override
$ echo 1ea0000.phy > /sys/bus/platform/drivers/lynx-28g/bind
Internal error: Oops: 0000000096000004 [#1]  SMP
Hardware name: LS1028A RDB Board (DT)
pc : lynx_probe+0x118/0x4fc
lr : lynx_probe+0x110/0x4fc
Call trace:
 lynx_probe+0x118/0x4fc (P)
 lynx_28g_probe+0x54/0x7c
 platform_probe+0x68/0xa4
 really_probe+0x14c/0x2ec
 __driver_probe_device+0xc8/0x170
 device_driver_attach+0x58/0xa8
 bind_store+0xd8/0x118
 drv_attr_store+0x24/0x38

It seems driver_override is a huge foot gun, which probably many drivers
are vulnerable to. I will include a patch protecting from this in the
next series.
