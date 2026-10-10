Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013027.outbound.protection.outlook.com [40.107.162.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DB8379C23;
	Sat, 10 Oct 2026 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621521; cv=fail; b=Mgrx4EfjBpsg0SQJRsrSors5V3+OO31mEzf6wGg5xV92GIGxdJaE9clT8VI247BM4aN2WIuDIi+VIAYDMSVv5BgaX3dZVDgmlXy6hBzs1OBSpjglexn8z2m89p5Rz88dVTe+YqgM80OfOKLiNHOOf9YFQY6gD4XgIbTWnqnIzgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621521; c=relaxed/simple;
	bh=by+s9uroa0Dfv6nsWmEYEU0dZekO3C1kLAhyQcO5TU8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oD5D49PjOpbignTvULsBOW7baNFbcSZwYbr3MWGV5YfiBgi/vW/RTShKjclr/DGiPFyZGe0OXCPNm+p0uBSW3yPdhj7LHMdLSGmid8s97TERN19gS3X8vbT4GMHZvlnIW7eIPVOJ0AFA87KFCBAjs7OxC1LvjgfpEm+OErChTfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CKoVxN1O; arc=fail smtp.client-ip=40.107.162.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CKoVxN1O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJbIHjDnIrsMue4U9UWIp9UGWHXe0qNUAe3o34akwGzfWH3g5yGrBe/mALOvjIHmxuzC+Kv7FrVHimKTzyaGCyL6NQ9EJmi0ZyS7fmmr2CaJxYgDaDTme0j1O4F2vf3Hn+YWoefsecx8Ib65vbuRN+HH4lbki56wvDWqXzCNkd9TuLpquu62xSoQbeeCT6rzKXu/LWMvS2vmDs3+ftHhJf53QlNbNidxUbFt7o8xIe7tIG58Pq8hGn5cWpnzMrEkH9zKbehlm/uLaq/cgSwYxg9XydEmZSV+MxH6nSeHbJh8OZWYkYNAtQeLD0S8Q6GPRrRVMj8aU0ylNoW879NQeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emUzgYRrUnCbXl/hDaHSuwK25M2yBNZ+ySMZKNOMBQE=;
 b=PiG0oiffOMnsUkLUZFR53QFjN7yv9vSQHnjj5Q9fob9DIP8L3c0WATuW4AEkeotebcOh+0B3KML+2XF0uNuX7wMD/1YTqEqq6BHLQbSv83KP7m5xoEmDcDQLcN7Gr4mueLnrnALHQAUBU4K9CrViZtZjW/EvOnhDl9Ki5VMUJXyWeKXD9zavqthaUE6AjQCRIIvoYa+k5c6BOH0kSilv+InZCA6ZHQzmPF+WB+aeGEai4C0aJfIZNGV8GVa2Z6DUpByOxDQxSrQMJjkYvCrCvWVL5IczyN1aYvIat9Nymf/QPvsWoE43/UB32WfneEa3lzTYkgczDehQUaPCzylX/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emUzgYRrUnCbXl/hDaHSuwK25M2yBNZ+ySMZKNOMBQE=;
 b=CKoVxN1O3YdHbpwJFPVGqbYx6ZfqdYfnHOLYftIV8RdVPtfxbDxjVCvCylVpIbM7Gh5cdwrzvE6JAFA03CLJdJjLv9cYSoF7Cdv9rNFotoNu0oIgjtXyzHpd5+eQg1+33FVo46RI2DM800Jf8PJI+ROBPFQ7/pvx4DSMQ2gkXAfYFhEdd0D9vQNgNhAg1Y8WN8kK/IsJNTB3jqnWy8q1DYTTg/jp+5eAGcBsbrVS90cxI+Usf5Jeoxf1nuisrm8nWTN0B2Ihb08XXrsRxJWZWDOitRIUOFftFTlZOENpCzrlBH9TL7/RWavq8W0QOmafhC34TC6KHhL9gYxxK/7/Qw==
Received: from VI0PR04MB12350.eurprd04.prod.outlook.com (2603:10a6:800:30f::9)
 by DU4PR04MB10669.eurprd04.prod.outlook.com (2603:10a6:10:58e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.18; Sat, 10 Oct
 2026 08:38:27 +0000
Received: from VI0PR04MB12350.eurprd04.prod.outlook.com
 ([fe80::5a14:6ce3:f50:495e]) by VI0PR04MB12350.eurprd04.prod.outlook.com
 ([fe80::5a14:6ce3:f50:495e%4]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 08:38:27 +0000
From: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>
Subject: RE: [PATCH v6 4/9] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_set_active_enabled()
Thread-Topic: [PATCH v6 4/9] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_set_active_enabled()
Thread-Index: AQHdVwPob9a7fzEWtUOKOELBAOYCT7bzXr4AgAC/TACAAlkisA==
Date: Sat, 10 Oct 2026 08:38:27 +0000
Message-ID:
 <VI0PR04MB1235096831ED9E00171F0DAA7EB912@VI0PR04MB12350.eurprd04.prod.outlook.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-5-Zhipeng.wang_1@oss.nxp.com>
 <sashiko-outbox-163926@kernel.org> <asgBDAfInvaIGbYL@SMW015318>
In-Reply-To: <asgBDAfInvaIGbYL@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12350:EE_|DU4PR04MB10669:EE_
x-ms-office365-filtering-correlation-id: 95258299-bdd4-4c82-a619-08df26a9db25
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|19092799006|38070700021|261009223027099003|56012099006|5023799004|11063799006|4143699003|261009221227099003|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 hVBfFuvVsM9k0dGeUU6XeaqOpJbMcZ+zCyp+ILV7RdlGTqU8m2//wICmiRNsVDLbUidY2L0E/CSpTfL4g092mF4Wa74ORgpmhnUaSAJ/jStJClY+azWQ/wDDoFuaDG1sfoDz5yfgN/OSMehV7vtPIi5fLoJ7MtcItlFrgZQOsWQ8zc0V3pZwOIRhpSCq/z643u4TfDfg/4IXh61bHAhQzS/1aFswb+p1zl9Cee+WVHTYpYcuUyBT5rsWOHZBU+IWC4RzndLWrjFbCpcNH3MRnMoTMIU78EyB+iSAKbDgKSYJA0dvDVHY+F9GApuOX+eqL62HxchzfhwZh5cD+FVxrnWjJ2Y+e0vMclQHBbBZ5MEja/Df+8lP4JX+IsBkfSQqkJSCtQSQ1b2RWene1QaTQjIyykcaSY5JHceeiCrdzAAxCc01JYZ76dljVNUmavMXmhPU/5KJvNIn66RcWBbW55AAl+yiTPtcnn1HGnV+0Fc8GHdFjxSgh1LzugLFWPGyL4CuRAMCkzw/lcPTn6q3bW31RzvK6lD+Qx04yOjaNIkqt2HsrSGwvqFOm+Mp1ugVub700kF5BxK4bg2HMWL2CjWb0JXj16MywUskpsSUF4plluEJSSbrid+XVwLW7ALbisRwJ52420PFGD0iwzA0fJNWjuTt/s+RkSFdql0UIWU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12350.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(19092799006)(38070700021)(261009223027099003)(56012099006)(5023799004)(11063799006)(4143699003)(261009221227099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5ScZ/FMRdhmANpdiV9cRMKmEpPEDS2cvrxKcuInl0KYTNl6s8XU784upeNna?=
 =?us-ascii?Q?rxBuvykR8f2HdAA1Q5XkQxLqJvzFWoSQ9UynTkROYFk/C5JaWm/rOWYllunm?=
 =?us-ascii?Q?NteFwCXTjLbLhf7xqrhQQN7U7CrqXhpwIzspUQQA5pkYf1Ow0l2aSiNMxee+?=
 =?us-ascii?Q?l2ZSnurwHziK4jW6T5RB8pl268OgVOFTE+IWNlJVwUEF+btsMNA8M1ED1vxu?=
 =?us-ascii?Q?iYvFFQexVRRqgYo9oSFMSW6YTRfpG5mU9ikhwHQK7Y89TqbWw5go7v397r0w?=
 =?us-ascii?Q?uXKuhhVGHGMHt+ML5mi1kVy7sQ4suxhwMpXfbBvhO7aYTSV6Wvzk/h+euO8n?=
 =?us-ascii?Q?CU2Mb1QOP1yUI6rsHOy7Yw4HvpAgsTBE3dn9PuxEAw10ufRqdloBM+oIzWpZ?=
 =?us-ascii?Q?IppEECZvNOarPmngswhQ2nSaymFozPumrozjd4J1JVbWuSWGKnxD3p26+4YS?=
 =?us-ascii?Q?fDKEUtZbAaeL2+40jv/lk7TJNJinyJ+S1ZZLOSW6mX+xDHfd8gHDpsxGMNGm?=
 =?us-ascii?Q?1JNXX3UeZzIAYqfO5RCwj5+181AChKuFs/VhTLpn1E5Awdtdgqcv88Yb4IPY?=
 =?us-ascii?Q?oCY1VN+67kA4FxjTjtvutq/6iDfHePZVzUPRNuqv0C9vGTQRlcdbkqmEKQQn?=
 =?us-ascii?Q?AfOEnmd36wTOudAN1lHfE2MncOHzpO4M//nQ46/dst+8YZL1Zjsq3VPunqP7?=
 =?us-ascii?Q?96wc+nLXFf5EnjxwZvuI+3c+nQ41V3+OXW/KOE1xdtZ/hROp14MMlKgGwzVd?=
 =?us-ascii?Q?zWxcy6M0vk7XVkJNo+rQ5/VgDX3zHsQHBaE64tBG9a3DpOf4yaC+0K3s906l?=
 =?us-ascii?Q?fXQ52cqO2bFJ+RO5OrunzgmvXjBIIVgpjprNk3d4B69+0cBFmGfOP68888Qq?=
 =?us-ascii?Q?K2VXn8ZGwRcaILHDPjVrNnnmxLmL6VHxPsUrM3ebzUmISkvbyxy9vP2ISiC+?=
 =?us-ascii?Q?MIs1vYr5qCzOU5IE7hCz5NxkJWOeoiBzeb3ZWr7Vsj4WMwWkan/cfIksisV3?=
 =?us-ascii?Q?Qs0pQQBNvutK6Z6eznplQcuJZi9z0feo26POetVjpCMIULufIODTbhY0XuQ1?=
 =?us-ascii?Q?wfc9IUdOuLX9lMHMSVzqzb/d7L7iUItBNm5ZkEphIe+BNOyzdkKyFNBfXUZa?=
 =?us-ascii?Q?OuJuv9ItT6O2U/HUXJBT2HgheIpE6Yga46ymhjDOCVg9a0IH9cuAvieO/Ygf?=
 =?us-ascii?Q?rd6qnIt09Gk27sZ8zoo9l3fssvy2A+3MQ2Sq8IPGdtGyN5OMzI8h9RzMLNCi?=
 =?us-ascii?Q?zJtB7nTu64qd5iYbHXwtCjv9C5QMv8+BYy7PDDl83x6VWUkmJxaFu6nv9wM0?=
 =?us-ascii?Q?M4bagJHCOyTISesZH5ed1Ve/9bJvNx1Zs3vlS66S6sahNLInytIBLJgl18ps?=
 =?us-ascii?Q?Hc42xLQLNvfIC0myjiMl0dWipcfcgewpiiYhNZMevXSnNWRPx2YU6TooiWA7?=
 =?us-ascii?Q?8JNcHvD2B+jHf1/t4eWiPlU9/1DY11c91BTqxHux1rQS+5einksbukQ+HHde?=
 =?us-ascii?Q?wcgjFNHG9PkUh1sPT9BAdE61CLoI/tlwfXPop1kIt1SBpHdKLzUYUjlfJGuk?=
 =?us-ascii?Q?I9i7E4ZQh/OooRWX3sbIqsu21YHmP7I1rmNKTROORg4VST5XaS8Ya6JjFart?=
 =?us-ascii?Q?RciUpD8Ux+HZDpeyVUopMRoGCPE1aJTgVMwC+HTFC23xPB+g/P8UaPdRzO5x?=
 =?us-ascii?Q?dNwqO4N5DRfADTC9hmhShaZLn/R9a1TkowtCGIdW+RcuGqNDE07v80XyoiTh?=
 =?us-ascii?Q?1yanV/MYew=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12350.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95258299-bdd4-4c82-a619-08df26a9db25
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2026 08:38:27.7813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XpjeKoAfi6gxXN0pTDLBRdK50AmoGVotJnbJb04K4Xj86ky1KOKLAzXPqw7xDFvnmpoypZnrZRo/W7d+0xJpcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10669

> Subject: Re: [PATCH v6 4/9] irqchip/imx-irqsteer: Convert to
> devm_pm_runtime_set_active_enabled()
>=20
> On Thu, Oct 08, 2026 at 09:21:24AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s)
> to consider:
> > - [High] irqchip/imx-irqsteer: NULL pointer dereference in suspend due
> > to early PM enable
> > --
> >
> > commit 5322ea0be538e254fa9c813752002c35702c23cf
> > Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> >
> > irqchip/imx-irqsteer: Convert to devm_pm_runtime_set_active_enabled()
> >
> > imx_irqsteer_probe() enables runtime PM with pm_runtime_enable(), but
> > imx_irqsteer_remove() never disables it. Runtime PM therefore stays
> > enabled after the device is unbound, and rebinding it triggers an
> > unbalanced pm_runtime_enable warning. This commit uses
> > devm_pm_runtime_set_active_enabled() to automatically disable runtime
> > PM on unbind, fixing the imbalance.
> >
> > > diff --git a/drivers/irqchip/irq-imx-irqsteer.c
> > > b/drivers/irqchip/irq-imx-irqsteer.c
> > > index d05de3d26fb28..5acc04504e520 100644
> > > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > > +++ b/drivers/irqchip/irq-imx-irqsteer.c
> > > @@ -239,6 +239,10 @@ static int imx_irqsteer_probe(struct
> platform_device *pdev)
> > >  	if (irqsteer_has_chanctrl(data->devtype_data))
> > >  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> > >
> > > +	ret =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
> > > +	if (ret)
> > > +		goto out;
> > > +
> >
> > [Severity: High]
> > Does moving the PM runtime enablement before platform_set_drvdata()
> > introduce a race condition?
> >
> > The PM runtime is now enabled early, and the IRQ domain is
> > subsequently created and exposed globally.
> >
> > If a concurrent child device or userspace sysfs bind maps, requests,
> > and releases an IRQ from this domain before platform_set_drvdata() is
> > reached, releasing the IRQ invokes irq_bus_sync_unlock().
> >
> > This in turn calls pm_runtime_put_autosuspend(), dropping the usage
> > count to zero and queuing a runtime suspend which invokes
> imx_irqsteer_suspend().
> >
> > Since platform_set_drvdata() has not been called yet, will
> > dev_get_drvdata() return NULL in the suspend callback and cause a NULL
> > pointer dereference when passed to imx_irqsteer_save_regs()?
>=20
> Please fix this problem also
>=20
> Frank
>=20
Hi Frank,

Will fix in v7.

I'll move platform_set_drvdata() before devm_pm_runtime_set_active_enabled(=
),
so drvdata is valid before runtime PM is enabled and the runtime suspend
callback (which uses dev_get_drvdata()) can never see a NULL pointer.

Thanks,
Zhipeng
>=20
> >
> > >  	data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev),
> data->reg_num * 32,
> > >  						&imx_irqsteer_domain_ops, data);
> >
> > [ ... ]
> >
> > > @@ -260,9 +264,6 @@ static int imx_irqsteer_probe(struct
> > > platform_device *pdev)
> > >
> > >  	platform_set_drvdata(pdev, data);
> > >
> > > -	pm_runtime_set_active(&pdev->dev);
> > > -	pm_runtime_enable(&pdev->dev);
> > > -
> > >  	return 0;
> >
> > --
> > Sashiko AI review *
> >
> https://sashiko.dev/#/patchset/20261008090231.796511-1-Zhipeng.wang_1
> @
> > oss.nxp.com?part=3D4
