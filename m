Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A79134E745;
	Tue, 14 Jul 2026 01:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783992827; cv=fail; b=ewJyr4KFIx0vKmOxGZ6W7ee0eYmxMXSeGS+bPizLjqfKgvq6MsdhpGT2ijf0RZACgt2duJbyL1zqPGU6Geu4Ci5K/xSFQ/Pq9FnXd6qTLgw4y3ox2w7W90vyw3HCy9XF56mY8QpACiGef9nyl+ONWtzQs+rhiUckNVANBN6tqoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783992827; c=relaxed/simple;
	bh=S1gZcTs9fEwfln710rYFkcTDJKtBe+3Eh0Jvr9LF2sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KrQ75mDpO/LV4SL2mqCla+6Tj1QGuqB2KhRes48+CXVi1I1wbQWISkzrJ7K02ZpwCRpPnugLavFeuX36SbbEVnc1xDaaCiS3sI248rKPIHVG+G6v++iScz6MpukQOzGtuNdFHjheeEeajTYinhUnjKU3ZwycVa9aIYs2kH1zSxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iwdAvqSq; arc=fail smtp.client-ip=52.101.69.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iwdAvqSq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmpB5ZE1qU5CQoW7FZNxrBEPipy26OExsW/7p+StQrx3Q9TJOAd/+sYKHoLAyIAiYtcMwF5aq3+bp/o7JrPGT6BkCmrb397SSgtMdD7tPt0BWqW7aAsG8f4AkKCKhAH8qiOY3hEj9d0NBw3gtPphPtE7pD0mSF8m1pfgF9P9heqOhDv3+y3UczwJWrWKHOe+ky097W3B6IJEP7GN9BUMU5cYEuhdl9hvaRbgBgae7PVpUSm4N1QFEFLO+YVMkCkF3EfwOgdekrpujXGIbDM3Te+69I7cTVySFpnhrMBi89j9rvZO4AViWlrxiIb11AtV6KsJ6IEsapQDMvJhVyVrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrxDUtVSzPgWFQZNqZjjueLWscAm/7Duwm4ZuvpfNTE=;
 b=Sl6Z/VXvIM9adYw+MQ/rsb3WtA/UNxIbtMdrP7X7X7HJKlEMw4QcQqdNkO/pG6EYWE4PMOlKTkGeu3LKjWnEIMrij35Hph8TiWPkag03Z5YjpJhj/mdPXk85dsPDZ3bZMMgGnnX5AG/6k0aK7VY/c1I86MZd3cKytGkkW/Tspo23iEzCmXTxC8X04qIRd5YSljp/ipR/EFhK7zS87lnS/Ff1R2kq7RBSmAbCLgkxWHfOfkBcgKXBqKsTH8NKZCq4cAUgqJP9lNz85nknYPjS8dGGi3E0cyN7YwE8KFAPbyVesy5K96XGe00pDTqsQrS51JZYQrCujLbQrxO326xhLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrxDUtVSzPgWFQZNqZjjueLWscAm/7Duwm4ZuvpfNTE=;
 b=iwdAvqSqxpwLUVatU3hfKnDRGJzR5lQ187dzdmm+XVoTTWj4aN2GZ3cBZTLEIQtbDw834K+gTolTMhnEvXKxaeLfZ8eTq2Ohj7Yj/R39M5hfRy9okb33FNBmzyLbnMAvecirBG8XAwZ3oKUIzfnCPEybdMu8MyD+aubcf20MGl41sK1JzRq9vt/DSfUYKcxu6cm2DeWBJ3/LTrFh+j7KMvBDDR34K9dmhlWZ3Uy/e6NTWGw6zKg6ZFAYyKi3h+LKaR6oWHAbY0k28kh2UBYYVvM86WsaJbjq05yPLvtZQmhJgPRxiZssXENLq46Z1mJ15II3Lg1OUDZflJJmBnmocw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by PAWPR04MB9912.eurprd04.prod.outlook.com (2603:10a6:102:387::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Tue, 14 Jul
 2026 01:33:42 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 01:33:42 +0000
Date: Mon, 13 Jul 2026 20:33:31 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 4/6] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <alWR66rjt-9jGEOV@SMW015318>
References: <20260705200534.151803-1-marex@nabladev.com>
 <20260705200534.151803-4-marex@nabladev.com>
 <20260705202439.3F5771F000E9@smtp.kernel.org>
 <alUICTI-24tREZO8@SMW015318>
 <f1e52327-42da-48e1-8e4a-dabf148ce216@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1e52327-42da-48e1-8e4a-dabf148ce216@nabladev.com>
X-ClientProxiedBy: PH7P223CA0027.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::18) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|PAWPR04MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: 161fcfb7-4252-4a43-4e99-08dee147efe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|22082099003|56012099006|11063799006|4143699003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+NyC/oCWSGpm7agQI3+vYVb2jIAioU/ZvHPiEewW0LFNncy54oTOqXzzKmYDc7se8mPngb0GAsIN/viVqiSPkHI8gjutYrM/mrK0AMdPHZOKWLaOvkNiZx9OZR8B12d3PQ8kMubS1HCintJRAJ6FPbcPmVIdmNYzisboBNddYuhszzO0O4q9GN8564UQ7hdEHHLYyWDB/4m7TdV/kd2bL/uxtxlPOSMzPVRivZNPKc+bDeVURPadtsiqbicBedWxPJA9i983VP20gsY19pOcqUb51WOkzsLa4+sCjMfxMm3LhOdwVU9kUcepgfp1n3+kxsqIG7Z7msgx/4u2VIqSKWXp2O3Lle1f5B2zn9+FODJabOBqR9lz9sGaSLTltMYCKcDou2vReOauQ4w6KUYOlhcBsqBQ4uJBYxJFHYMAa5BjBeV9B9n0g2Cj/nZUzUSmzF1BwevOZMTyBOcL6GxA/4M+TgaTIKU2QuP+szaiz45oS6mdchCnjVOz3uir88jBGw416zxQzj1E07aO9IOJfsjGNRvuM+WYX7JYF7db4wtjOMWp3xwZTf8xmHA87oK+p9ABp0mDBwdlNIimjcZxTv14ynEA+0CjI7j1vqywYy8FBUHsa0prO6iXVcFUCpHBD2PKLi2z6B2MMw8GfdKCkPQi01Q+9aoSP5EQmbOmM/I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(22082099003)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/eK5ummz31Avm3unRxCN1HA26DSkvoWCJWpQvvNZAr7AH4rDzl8B+hkUxxNL?=
 =?us-ascii?Q?EVOIQtYn4vrv7uJ1YnhFbog+mkNGkVrQRF62+ajIqLJCGd8YSGKRV898alUL?=
 =?us-ascii?Q?iiTPnW5dqYlfHbv1fszGPaBEYOiVpsz5K1pxIvsXFuQbFLoXZQv0j8gCH77A?=
 =?us-ascii?Q?VEXAByD1YO0mDg+z79EQSXiOUQHNEWNXJ24INub2uyGWyrcPLrFD1Qnb/Ctv?=
 =?us-ascii?Q?MWR/pPL08DpjWb8AZ6xD8SbaPDTXEhLL5jqUIQUvi0Jb00ehAFGa7ACjmG9c?=
 =?us-ascii?Q?IJbLP95RJTKOnnIjTffwCrDOQmbw/aiu9awthUwWyjWE134se4VYtY2C7Kzi?=
 =?us-ascii?Q?o0k2N2DJ0GwfgYcs5Hd03nlBecauJP10SJ8CLXsixAB7xeXF+iGpa3ikrD87?=
 =?us-ascii?Q?1PcRskgLNyCc8XJXcGA2/bCNNdgFShF0am+RsX3rVMn97odmHe34rxdUJAK6?=
 =?us-ascii?Q?YB0gCqzAS8ocNUrFoJihKsPwj7St3O+/TtVJfAGaeWj24zoYaguTJy5yHlU6?=
 =?us-ascii?Q?QDJAps27g+7RZmejDOFLjxX2T6bQcpMTLRZPOhup/4+3+eZOg+6XUYY7bOeq?=
 =?us-ascii?Q?JJvZK7drjyETmTNruylPbthY8vj9pltGUSU85dS8co9piKQ1eXq10iYEaH0V?=
 =?us-ascii?Q?JMntOURJ4GBas+EKamnwKl7i1AcShU8eRmBms18Kdr96w85Z4/AQGyigI4zC?=
 =?us-ascii?Q?GPa4zY0dcxwUQkPwfP3Qgd3SEXQwcMMR9kqanSqDrC9fmsp0qja6IRuRvmZ7?=
 =?us-ascii?Q?za+Gh4nfA0g+faIiSHQYUEY65M2Wpi4xZc7l/QYqLoTnvzVY2cW5pyyey9QM?=
 =?us-ascii?Q?2Rs+bZVWU5ESAeLjo4CkPF0hdqiXWuVaz7RoUsS02FWnU8k/DpQMhfUg+hJ/?=
 =?us-ascii?Q?hfsWYqncqJ2Oo+4d2xVykcwL3qW2MMhIZq9vnGkm1Tk3FgrNCpLMJfWFy22E?=
 =?us-ascii?Q?HOjcMwXC5+oE2UIanPHPW5iLjPNAQq8CR0XZ5BMHEg4wAwrDt4ppx19N+Ex5?=
 =?us-ascii?Q?GUkuwyH2O97Z6LRt3taGDl1R4gsXidXO9nJygIYBqK+qFN01LQU4Iilw5r+P?=
 =?us-ascii?Q?O42/YRrNWApIKQaC5Rf/XVKK6Yk4cKsKnA2kg3eytPRLfViNz40kZ5M7cSKQ?=
 =?us-ascii?Q?Vy5QoY/L9pXEXHDIGAfWt+oCoh5PLYepmM59gLI65+RH3sGs6F83t2BiJW2f?=
 =?us-ascii?Q?jiNsaO30CfT+dNDsCn4lDd2WT+4vkmDdjaW4hmGAg8kaHa06a99/C+3x4hJ1?=
 =?us-ascii?Q?bWc8vHUDadzImffwi8AIv1zG8o22AoAAlych3L+9dqBf1eHMG7KMsADYhaBZ?=
 =?us-ascii?Q?eIxcAtfFVeqIB7scMFhJKTjf/YUheCMgs4rl51YTNv3NUNwTylwRBMPf56BS?=
 =?us-ascii?Q?qy5guwmFEDWTYGsq9xCKY9bmNUe7J5yMsL+RT9ytyixZ2p7xrcsJVnLKLuXZ?=
 =?us-ascii?Q?ugTIPqCQeFu350BtmY7hT9NM0nJGc8+DCSstw0wsnWRp+IH2nt++TtUuXimQ?=
 =?us-ascii?Q?PBsl4ZbJOemZxGhPQzLsPLnlFz5ofCc+Rf3PDPH6zItskNXhblNfpug2NU3D?=
 =?us-ascii?Q?Nc0ZyMQrd8Zk2pdTJqYABVEvPxePP6qZzIv2M7QF00fQs2ifnfElQFjbQFkf?=
 =?us-ascii?Q?6JqBUg36T3gztjQf7gjcEb4bvOaSu4KF+SboC+3tmRc6wmqJUjQTXBqvsCEs?=
 =?us-ascii?Q?QDOg/ixK/FdAmKo3sNScRlHygTIsnWkgmxYlrDlZbkjVVbHEVTsGipKoNPy2?=
 =?us-ascii?Q?7ofxpuC/pNEePobkrtuoBeoPy2QR5jIU8cmyHwqccoslbAEB2Ucr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161fcfb7-4252-4a43-4e99-08dee147efe7
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 01:33:41.9835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDPyFYU+tJ6MAZ6RgkqOuPeqn8qZgOoliOGIGFnTFckrYjpIxcQwYyBeTDwks/WKP9yrd2R8QZjemv7xRm/OFX391NzMmvRjwQ+1rgTkSO6lokQMc6Z2z0UTOkSXiHRZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9912

On Mon, Jul 13, 2026 at 06:33:33PM +0200, Marek Vasut wrote:
> On 7/13/26 5:45 PM, Frank Li wrote:
> > On Sun, Jul 05, 2026 at 08:24:38PM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] The virtio device buffer node is named `vdevbuffer` instead of `vdev0buffer`, bypassing the driver's carveout exclusion logic.
> > > --
> > >
> > > commit b1e78cbda66a659316ae8170db75a75bd2d9d9d2
> > > Author: Marek Vasut <marex@nabladev.com>
> > >
> > > arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> > >
> > > This commit adds device tree overlays for the CM4/CM7 cores on the Data
> > > Modul i.MX8M Mini and Plus eDM SBCs. The overlays allow CM4/CM7 firmware
> > > to be used with remoteproc and rpmsg without imposing the overhead on
> > > every user of the platform.
> > >
> > > [ ... ]
> > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso
> > > > new file mode 100644
> > > > index 0000000000000..8d681c0eff0d4
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso
> > > > @@ -0,0 +1,56 @@
> > > [ ... ]
> > > > +		rsc_table: rsc-table@b80ff000 {
> > > > +			reg = <0 0xb80ff000 0 0x1000>;
> > > > +			no-map;
> > > > +		};
> > > > +
> > > > +		vdevbuffer: vdevbuffer@b8400000 {
> > > > +			compatible = "shared-dma-pool";
> > > > +			reg = <0 0xb8400000 0 0x100000>;
> > >
> > > [Severity: Medium]
> > > Will this node name bypass the driver's carveout exclusion logic?
> > >
> > > Looking at imx_rproc_prepare(), it iterates over memory-regions and checks
> > > specifically for the name "vdev0buffer" to skip processing the vdev buffer:
> > >
> > > 	if (!strcmp(it.node->name, "rsc-table") ||
> > > 	    !strcmp(it.node->name, "vdev0vring0") ||
> > > 	    !strcmp(it.node->name, "vdev0vring1") ||
> > > 	    strstarts(res.name, "vdev0buffer"))
> > > 		continue;
> > >
> > > Because this node is named "vdevbuffer" instead of "vdev0buffer", it appears
> > > it will be mapped as a generic carveout via ioremap_wc() and unintentionally
> > > included in the remoteproc coredump.
> > >
> > > Could this node be renamed to "vdev0buffer" to avoid wasting vmalloc space
> > > and bloating the coredump?
> >
> > Look like make sense, please check it.
> >
> > It is not good to use node-name as ABI. Laurentiu is working on use
> > memory-region-namses.
> The memory regionss are referenced from imx8mm-cm4 { } node via the
> memory-region property:
>
> memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;

I known, but now code parser node-name, At your case, it.node->name is
vdevbuffer, but driver expected vdev0buffer.  so above check will be failure.

suppose it should be

 vdevbuffer: vdev0buffer@b8400000
             ^^^^^^^^^^^

I know it is bad, but waiting for Laurentiu to fix it.

Frank
