Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD875233954;
	Mon, 13 Jul 2026 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783957528; cv=fail; b=VIEjo9As4aDVtl+cY8eJ6Ob63m9oyrPI/NuEVMRpNJ9uANkvDAaljBk0R67wwyvRotMf6uK7CIx9ORDiDAOooEHiNJK6SIbqfIIM+Fsl7tKMlgpFfz57kQgsC+M9XcPLS6MjfM3D6W44/NwFAdPGCwt3imEaO47gv257nvnCtwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783957528; c=relaxed/simple;
	bh=m4RL2QcXBILQbHYuo7Uib5H0BqmxECrJNnsypAXAWrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eee05qZtRj6dhYOIFj6zGWNDsDiWjBD09wlJGGu0S9TGxPJZ8DHMGzCshL8Gxbp9l0QDhDTBaZ4NUwHSaWMN84gTdcmMkNFlJA6ro+sZJs8rBBl36MFWCjwdpsZuZi8ROE9yi2vnqsWARRWr81PvNmTenoowLoYldo9I4vKkI58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qVl5O84n reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qVl5O84n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9UwTtluODcyQgLXUOskJ04qpjYrMIq90U1IyTdtXBbHMXKeFvYJbbQ/EJYWugnObzRUM0em7Pi2w0zhkmUwk6zj3E5lgAGVzsnya91pXN2pM/ifiRz8RjzTW5BVyCDsMvaUbdVebOg/ekAlgovSFvXc+kiuWmV7pRopppPP4QDAm2QEGxTONkwcs5Rv1oaIR2oftp8U/Vq7yp8PWJIju2Cr7PRWnciD88ktE54FRCN7inxfAfH4m+DZLCK4Tyq+5tbu3KeJtXmNPa4d815HKykIKS/f9AYiFBcsaUxhRRfn6CrSZSX2SXdHN6JhybclqC3dH3IrOTLwvsvCwJTSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0jfNc3TwGHsSQDwvbBI6TQt0SRJ0NssWdi4s+cufjg=;
 b=N2EZn5i99RmkRO2N+dx1D7M7ZtmLcA55FOhQjxMi4c1e+2tK74/ZuBKbJ2wyebTUttLIwczYKIjJEe2MvS0Eh5PTChCCR2kMCHGrCmgSkXZHkN/0UG/h3AdBvfOcbZA8mAX55jQvMDyvWGDRTK8GSDASxxJguXCH23dzj1xEUBge62Yc/o9ylLDCIoL/j7FL/tUAKe1shcR0O2neCSjmPYpSiIblz/oqOv7wDGpzmfxvDl0Z4zkv1gHtSOiJtfe15vHHU3YGkc+OE676ihQ2PJ9+Qe6hIOoeLdamm15cekoqp7LUEoN8/hm2lE5T7ZC2n9gUbXAp9es+VNyvysYfZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0jfNc3TwGHsSQDwvbBI6TQt0SRJ0NssWdi4s+cufjg=;
 b=qVl5O84nMfurBCqrM4Y4rz2+CgZyMRwgO9H/PI4vElp8E82a2IAD08t3v3lx4NHdc7pU6AiyE1IVbDiFSw7IE/EoOg1oxRlO1o3L1EIgT7xmZAgM8O7dMeqNMppVYlV2PRexnq5uGk2ipI7hmSvimwP0OSoXHEZODm7RYusDSH3wLRQq2GV/eg9LuyG+zjCX1XaSjGCEaJpjJ17+RlPqLaMw/2JDxYu9Sv1wSFumX2OaxozrtxcZtWUGQDwXqXIkrZqtRHhtWmxaKdlp4FTICdPBpjZ3vUdYIebJeRTKjdR4BtVDpKwlOG7CBTSZEpsp05MpZ7vMxdAMfnJzBKuIuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9897.eurprd04.prod.outlook.com (2603:10a6:10:4ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 15:45:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 15:45:22 +0000
Date: Mon, 13 Jul 2026 10:45:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marek Vasut <marex@nabladev.com>, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 4/6] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <alUICTI-24tREZO8@SMW015318>
References: <20260705200534.151803-1-marex@nabladev.com>
 <20260705200534.151803-4-marex@nabladev.com>
 <20260705202439.3F5771F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260705202439.3F5771F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH7P220CA0133.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9897:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a432326-ce2e-4ace-4460-08dee0f5bfc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	Jd03kM/XjZuwDleij7QZ46XrbdBo3gojxlZ9wKqOJSNO3odjsGfLo83MrwHYmb5HiKRwwy0ZEp3dV3/d0RCLtUtd873wpMayHVFX3zhL8Kz/coPW2RROPpPWCrjbDWGL1RbtpqxDjx2XjHhZAqkQl74HUfBF8yyJLL4MT72M+d29mXs83ZBdkiae7Ab1QHeyIkaIFcWaQnEb+RIpZ3d1IV8J4TvFl7AXIWGhFVVyBa6C/4etDL2My59vB2OiQ8M3sZwmCnOw8EIbfQg/8/s3LWYI2eYb3MvAmvZetBe0ZHisDWXVraBbGR4g5pOONb0fz1kQUyt07BpYceRhnd0GG0gxyG0ioM6ZtMGzmZzPQFpsg834J1tJ38zbdOHpLyBYgT0gIXF6W9Yq7LPR8QexUEUVyWOdoWAdfbwsZWi9H0sg+e7pa3IQV3hqwgy0yTSJk/9FKp2RlAtUeZtul0v+gcyEDgxW7+cTxwXRU9LKLEC47+n8bp4Pi4yg393dObTfC9uJm+GWG8KVjXgGaOG25AHXYPdpzy1cwIu3HsAK9q6HU64iduPWZYdIrGpjKDRk3Ob4/yKX26XJXmesZQj2JSB9LCNVDmYG9auFrUBwWgs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Z7sB4aC0ZAN1OquogY+5E2gZHqAr7A9L/CJbyAuLN/NihgtmKfHe8v0jFG?=
 =?iso-8859-1?Q?/xEWTrJHVRgTRBN/E8AOZP5Xv4a41B2ESlpd1wNw8hEP/E/OTZI34a5Q7K?=
 =?iso-8859-1?Q?gWk8k2uhv6f1wafAGM0Q7hcuCDaZlED/ocN2/IOnfo9Nh+eRf1FJJo93n2?=
 =?iso-8859-1?Q?bCR29AuFTWpGq/Jn/UQQhqCVsH9QUtPT3UUFicS8KklGMT/11dzg5fDiye?=
 =?iso-8859-1?Q?6dsQ91vqKza2AgeJ4SDVU4A8dFDCWfvDMu8+YqMpENWGg5o9Q/847+LKOw?=
 =?iso-8859-1?Q?Z7sC51rnVyisdSFhjKdRR7GduISxv8tlbq4dKdGyjRh2cG1dsJDTHx9ZT/?=
 =?iso-8859-1?Q?es758eRFDrG828hOX/ehNby4M/s01csQfWWdQTVsju3BCFSUIhE0S6M1TF?=
 =?iso-8859-1?Q?imKvrmSCsJD45Ll6R7asvpmBl9UPpOW8X2WrdN4D4ssx4YCQgb9JWBdcFV?=
 =?iso-8859-1?Q?Q8YHfsJe+IFbrYDVIvmmP/H48lAyySv/Y0LBlYpjFc9udRiKJBRwsF8NJU?=
 =?iso-8859-1?Q?3ko/pcixO37wCXq8h+1X2fQ9of23lxlh2+A3l2gO2b3lrexcq4hKQWru2b?=
 =?iso-8859-1?Q?9kE+Rek8ghIPz3j7kwI9Irz+OAxWz58qG8wr7VRmDCnHgl4gbVBA60LlJF?=
 =?iso-8859-1?Q?LRYexgPNFH3DATNq1yNMO4mxT+d23ppI6aOs3cRFIzgQfwpyeQEuAJKwl2?=
 =?iso-8859-1?Q?VuTrVFKmEH0oWzBOZBD78cHaB9bdIxP/wx6bdWatA6E0gPyNwI8QLuQFSf?=
 =?iso-8859-1?Q?aoy4kE6VVKNTcH6Zpr+DZ3FrnTu/GIn00Hv8+BBdXbvfBCo6e0wNWMPDNS?=
 =?iso-8859-1?Q?RPpBw6VVncApLlQcjBE5bkB+n4yQo0w75CSsKVxiciW1LEwEg498FxRJta?=
 =?iso-8859-1?Q?gC+NtzILWD4Fgn5JBMABVlzU4HeGLEF2IdcZRGWJ5eBsAS+NhBrseZ5kTl?=
 =?iso-8859-1?Q?yL2mXccDqDqKNeCNgE55merF0zfo25eAXNG+qCayh+Z3NGASnhSTfsKBUA?=
 =?iso-8859-1?Q?Pv84Qhaj3hvGcY1O5ptfi9AM5PQHTOvoNBBZVocFvzz/qM3AwcfIdwjoBZ?=
 =?iso-8859-1?Q?nqTcjPafJn8a1dsFtUU/AEoowN2pZOORcaII8oksBaW3lb5h/ZvlKmmeWr?=
 =?iso-8859-1?Q?QF4zpM87xaeyRJO8dvw2iDh2lS3XRhyxuOXCZDwqfGW2KI7wMubpkw4NkG?=
 =?iso-8859-1?Q?unTqrO7Vyw0ueYXHg+x+8gZbbpANndxMy/X9zoBZRKXQYnjZ4vaXeACmbZ?=
 =?iso-8859-1?Q?QdtlsXrGiu74AFN2r+8tifqV7NQLknWxxtsCkGWJCYicoVU2RJLyhtJdDj?=
 =?iso-8859-1?Q?xiniDFGn+QAW8QAciOa97ccyAYt7vqaIfC0Zxm/Cl2TKMjZxWYnPwpW0g4?=
 =?iso-8859-1?Q?iOGKifau5fC4ZVF7CNg0IpVgDrDm5NouC9H1qBiVY7+OIh8TBSOweBMG5z?=
 =?iso-8859-1?Q?H86ihjpvzh6cQq5MtSTTEe5IOPWKHpcTafp82g7kFmDKhGlyw4OwxfApVC?=
 =?iso-8859-1?Q?pWS7fQZgN/OMl2pvbvFXSfOSI/fI+un0Yjv2FA7DJIu/OnShXnp+AYGMxa?=
 =?iso-8859-1?Q?2q92TnFHKNeC8cIgSVKJWnpNBC6zCvRKgiRJH1ZqS3P7HzTujfwecdO30G?=
 =?iso-8859-1?Q?QnhIPBPb14dRIhMy9GcpnoqZ2q4BzzQnMCOpPqYrsR+GBm39/DmvjU5sIZ?=
 =?iso-8859-1?Q?NYCBPZXMijMrwanGHrwYiCfC8FM1iT4QywaOanEz0lafAeExsMS37o01Ck?=
 =?iso-8859-1?Q?N6SUnv3PY7JIrhsV8Zn07PyuVNYumwNx+ro1QIhaToclWR8A2KQHlz4DGA?=
 =?iso-8859-1?Q?QXiw7r4vEy0K6nSwzYK8NJlhwgXnzgzz+EW4bo7xSejIaqSMWTzL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a432326-ce2e-4ace-4460-08dee0f5bfc5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:45:22.5333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KEfIikWE4cYcHUQ5IZkTv8vskVCKsHSHFXmjf3bIsZkMy1S51mxrh+JJy1XIp3tIe6ZsB9Ybrm9rzO6DzGt3yWoTBGuDuHleL/rMe0h/1H1mPxrwPw4U2WLIFOOhyTg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9897

On Sun, Jul 05, 2026 at 08:24:38PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The virtio device buffer node is named `vdevbuffer` instead of `vdev0buffer`, bypassing the driver's carveout exclusion logic.
> --
>
> commit b1e78cbda66a659316ae8170db75a75bd2d9d9d2
> Author: Marek Vasut <marex@nabladev.com>
>
> arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>
> This commit adds device tree overlays for the CM4/CM7 cores on the Data
> Modul i.MX8M Mini and Plus eDM SBCs. The overlays allow CM4/CM7 firmware
> to be used with remoteproc and rpmsg without imposing the overhead on
> every user of the platform.
>
> [ ... ]
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso
> > new file mode 100644
> > index 0000000000000..8d681c0eff0d4
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso
> > @@ -0,0 +1,56 @@
> [ ... ]
> > +		rsc_table: rsc-table@b80ff000 {
> > +			reg = <0 0xb80ff000 0 0x1000>;
> > +			no-map;
> > +		};
> > +
> > +		vdevbuffer: vdevbuffer@b8400000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0 0xb8400000 0 0x100000>;
>
> [Severity: Medium]
> Will this node name bypass the driver's carveout exclusion logic?
>
> Looking at imx_rproc_prepare(), it iterates over memory-regions and checks
> specifically for the name "vdev0buffer" to skip processing the vdev buffer:
>
> 	if (!strcmp(it.node->name, "rsc-table") ||
> 	    !strcmp(it.node->name, "vdev0vring0") ||
> 	    !strcmp(it.node->name, "vdev0vring1") ||
> 	    strstarts(res.name, "vdev0buffer"))
> 		continue;
>
> Because this node is named "vdevbuffer" instead of "vdev0buffer", it appears
> it will be mapped as a generic carveout via ioremap_wc() and unintentionally
> included in the remoteproc coredump.
>
> Could this node be renamed to "vdev0buffer" to avoid wasting vmalloc space
> and bloating the coredump?

Look like make sense, please check it.

It is not good to use node-name as ABI. Laurentiu is working on use
memory-region-namses.

Frank

>
> > +			no-map;
> > +		};
> > +	};
> > +
> > +	imx8mm-cm4 {
> [ ... ]
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtso
> > new file mode 100644
> > index 0000000000000..21e2a8c0bab0a
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtso
> > @@ -0,0 +1,57 @@
> [ ... ]
> > +		rsc_table: rsc-table@550ff000 {
> > +			reg = <0 0x550ff000 0 0x1000>;
> > +			no-map;
> > +		};
> > +
> > +		vdevbuffer: vdevbuffer@55400000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0 0x55400000 0 0x100000>;
>
> [Severity: Medium]
> As with the CM4 overlay, will naming this node "vdevbuffer" instead of
> "vdev0buffer" cause the 1MB buffer to be unintentionally mapped as a generic
> carveout and dumped on a crash?
>
> > +			no-map;
> > +		};
> > +	};
> [ ... ]
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260705200534.151803-1-marex@nabladev.com?part=4
