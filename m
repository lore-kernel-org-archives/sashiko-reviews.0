Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6854337DE9D;
	Wed, 15 Jul 2026 21:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784151478; cv=fail; b=tIbliapOffURR8eBoqiTHGAHu+tKT62Vwt518whBehgcVaQD8tt30lZFlFrCpWXNqIEE5br7JpfJ7bH+eXAHrE0Ius7Hu0ySUZjAIypCMccg8aB4lK8MjKRccDqRmSpRiOxNrLley5OrXq4GRvo9/dPatFJHfevS0ZdVwpR22mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784151478; c=relaxed/simple;
	bh=N6CQ99EI0ZcklwAjGZyf5AWozv4MqR+E7b/bEJMbQKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nmWCB03mz8tef19qjkT8MYSllSFAO4HPiCG95qspXeoJ7mCWhwTIoQdMwuQksGmAAUR+oi5vUWLsW7hwP7QCXMz0tPXLbC8WwT6ILD7gISl4/YErYwfOte7+4SSVcv2aeVtomEIWUzUc3wzRE4r7zOKG5xWlGSO8bmsqxZNcrzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ffZOt5bO; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ffZOt5bO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ja1hB08RDiLfRpv4XAYlDRzCEJt8gjO2i1W3SOi2THse0FgH1+OsqleQtStaOP9v/J+odPSAi9KEcZnEf5e6bRRegzVl/YpunzjRhmoYmhb57WjRX2iHc7VRLQHpO1Nl0mUscY5nsCZ+fR7N114+E+vOdtV7PYeKdf0wcBTH8pLPrAQb4rkFR8WbFI8PncaeymVNFzrBzYqODhlFrWNeNyp2Aep13aHrknDyenEHR6WsdUsrzB0EJkvnNDomhyOMRpkPpaaKd74hiNlffrtZsMvqHoQ+N5GsQshRUP12cIR/DTvSlL3fQIycNXki+eibmoSEaiJdy1cDZy1Kw9EvCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FspOPfPEb93+icAGRFQvwrW4OC+uuhTmWBZ1gsfdB/w=;
 b=H+tFVZ68S8XNMu4eOO3IrnMj1tI4G7JU5mf7M5wiNL9WgWbjrrc7Gl8anvwRIwuLsLNTkbkOt7etKP3Y5cP//Z71iC2lje6MUYOz2ibShC1zcsyO4Mr4Y1byDZ8VYYPlSeU+hDAA60FOe7X/rQpD3ixYUVTF8Udf+4wdy1m8RHCqAWF6UgtcuYzfUbITAgNdSYIhh5NgggnfIKprKVBXNUzCcQSFb2NL8HcpG4HoJpEu5TCbCtgxm1uzcDLTy/Pa0ROj6VUioRAAUHkxJJUndi4F3/1HrEQ+9YubcmOmttgGG8Jiuz7FEeUcrvtIrMlfz+BUu2OfE900p5uKdFS/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FspOPfPEb93+icAGRFQvwrW4OC+uuhTmWBZ1gsfdB/w=;
 b=ffZOt5bObIn1DhPH7K7FQ232RooLuvqQgYA/WrtnSpO5nGlSRERqAiBduG449tbMNUE0Sp/TPobLXr1/onyXT+hi5NENK+A98zFX/dTo5krqMW9darA39BSo6Gmgmt2SvwpFzqACDWb4fnhgv7Z2kBFL2k/ITbR73i1vSE9UprbuaAC9XHF359cyWG1jeP8b8qgalhZTXrMmHpTJ2O1FziwxeRLYeSDAxFubG61qEkYugQm0htMuzK7nZOX/fafjbpxAWQBFrBsJFDS3n9KD+e04PrXqBAgGsAzc1UrRID49Wdp8esOnfOJU0d0lyfs/RhkG0CgAHWejLqzbsBCJmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10969.eurprd04.prod.outlook.com (2603:10a6:150:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 21:37:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 21:37:51 +0000
Date: Wed, 15 Jul 2026 16:37:42 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 4/6] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <alf9pp3c_zI4rwC0@SMW015318>
References: <20260705200534.151803-1-marex@nabladev.com>
 <20260705200534.151803-4-marex@nabladev.com>
 <20260705202439.3F5771F000E9@smtp.kernel.org>
 <alUICTI-24tREZO8@SMW015318>
 <f1e52327-42da-48e1-8e4a-dabf148ce216@nabladev.com>
 <alWR66rjt-9jGEOV@SMW015318>
 <a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com>
 <alezsOsf61Zv6F4F@lizhi-Precision-Tower-5810>
 <c9a67cbd-fda8-4016-9cff-9125f3191b74@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9a67cbd-fda8-4016-9cff-9125f3191b74@nabladev.com>
X-ClientProxiedBy: PH8PR22CA0005.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::18) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10969:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b1a201-3b31-4165-2068-08dee2b951c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|376014|3023799007|4143699003|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	IpPyGuCBGDaF9a15WYUoiJSZw3zkv/x9KTsmdNT/F3G0GOEB42CMFumVVYvcLz647hbRQLsAnOXTj4DU/y+rmg3P9o4mSfiXb0oiOwLIc4d2VHXjdmWhp2zNyxDkf6jYRw5kUAi7pDV3uylhlQXQNkbAnjpOksF0c7QpnnAXfGP26UfVK0pNsfopaTaWCV6dZjX5dE/3yLlRJ45nm3f9NxbtABnSvCNfizq9HiLxzoNE5O4PD61jwFXYMyYwQ8PwuS0/3JAPWhi0hhAusNLtflOHD3650KdOGMEl5IYXpH8ML9VnnUWZ+bAWb8J67OSRSmDL17SxAOWQwx/1KnTnjwVZaS3CdN37tpGiBUE93FHsOrOUAgQZ8s3o/13rqXTekfKo4oM8NZjm0eygNU46lak8eKG9jT3m8nSkG+KE8S/qTyIRHAm+BQU+RMgWZ2m2yeD1wFHuWIxE4xW0hv7I6IB5r4+w82onEsUgcd2FKHKumH2lZ8T75jxzZzJKLIG0i2wHMYvlLKON94LMU+FExs507/3QfAxz49vJ9ua/IK21fWeN+QBnw1mCLq/iKq+Fn5KpjrG1mYtY6JO/XsRft0vQOe4FPtCeCyY67H14h19Rj2k4nLWdMlIskodSNTwVWjos24IC6MDXdQ+opbezp+BqLm3Tkiw/KlRLo4rVUD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(376014)(3023799007)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mcI1DL5iu1mSi9siWs5qj0MmmguDiRRWaQqh5UaJ9/9CW/3lRwMomeQKP2A2?=
 =?us-ascii?Q?P8aj24DHk2GfX+ydgNgCmeFcvytkz6Zg0z5/XqW58mJ+tAUz9cfZZiDvgfIW?=
 =?us-ascii?Q?DWz7pn6BWxvm8/dJLDzrWEdLbFtUBwj3grqYvmXokVOIInNkPZhIsaZN1t8V?=
 =?us-ascii?Q?vaBGe3S/SDe8KuWfn5civRKYPGkHCxhDjaDHsYxPMAfU8tj+w+ozNZ/+gpIT?=
 =?us-ascii?Q?1v+mpS/TdzBh+FQG+1CPWZrAo+AhohMH2v1kxeHqgUblTvCp59GouzhDK0lQ?=
 =?us-ascii?Q?+FG9V8WaFnPdn5mbKP008aX5EUPqg7Ecj3ZTGokkHYaXG20fA4q6Kjaavw5y?=
 =?us-ascii?Q?AUbZmO4YBVre19gzb1znZd4KNz7IhSlEZbLpBztQRwDgbAIy6/5tz8lpESbU?=
 =?us-ascii?Q?OP8wyPkLRudFwY9ql+YCbMRpJnjX3Jd6LbP0M38Dc+HFY0fQlfNW4I96TIl+?=
 =?us-ascii?Q?mkEJ25Ci8uxNnpd3s/phxiHQYu2kD6ihW7n8AD85EBi5EcQ70/Yv6ogo73dp?=
 =?us-ascii?Q?KBG6Z74bwUNet/V7HEF3iUncbsQgvqDSW/ofIH1U5yz3SZtH7Hex5apF179H?=
 =?us-ascii?Q?cAdzFvD6zE0XVxSyOlvE+PXXxtU/Ywkx+3LhOuYB6ugJSe5IJkMYyhpFQPIp?=
 =?us-ascii?Q?e/3JUQzUSonjTsZjOpyXTugOzgJqq608RX6UKenfTQvHQ+jmnRD2wq4SrqAj?=
 =?us-ascii?Q?I/5zp/JbBLDi7Hwil6STlyKWpp+a3AB3UJnvYh4+ho+Tu3ZpQoAAZp6BbA8w?=
 =?us-ascii?Q?rAVd4a1wdIWLbIgnr4b8Zl09TMpCzn3pTAm7u/3xHjeO2xLaRz0UWKlk2v6F?=
 =?us-ascii?Q?t3m+DDLnbBjYCdLUi/BCFsud5deQNB5JxdDjsdBbq87vIAdOopgGL51I1byS?=
 =?us-ascii?Q?ASsgA7SlOZDy79m4SbNMG3rxW+ESo4PbsFvm2tPPFc+nKa0zJxIMtFGmK4ML?=
 =?us-ascii?Q?xFwggeH5zehOc6I+1tt3Ta91emAjkERejKw0oGL+cpDWY+rYcorH5w/WVfBa?=
 =?us-ascii?Q?h9ZMi+XHrtGAxicaVP5m0Vt6lidIvsyql++c7xo4h1n8AzpFTKPp5V24wcXd?=
 =?us-ascii?Q?q4covm9Hfo1xXlFbDgNjGUAjmY1z5J5L/JlcDIOWuE5FC5gNVDkqA+aZ4yNo?=
 =?us-ascii?Q?DWOmDPnPsH5+pFOv0EdhdD0YP/KDib6mFAB+MsVcvrXqmV5VcsCsahq4mZqg?=
 =?us-ascii?Q?Gc1fXPKwjXS4wM/rjwvojA9cGpkyqKw5sd5BQusP8gNGHXuFOX0BmEF1q2UP?=
 =?us-ascii?Q?5iDezW9za3Wn+AdhJWH+vW4Kg/38+LdQsRiGDBko6hsBh+cQU+/hmkR0iVb4?=
 =?us-ascii?Q?8YwbBVw67UPOgODAdIwJMlXgL1QAQgNtY9BKjEGuzOz0wopv05L8n0T8Xr1j?=
 =?us-ascii?Q?GISRa1ImATvIdIEwdaVt2BRRuZCfa+199FksxgHVIxqEPrkCUyKQPV8c77Ux?=
 =?us-ascii?Q?Vrd3EcmwiQkNF4Ry6e+bil8lVjtAnsRnf8OYExw0OBN0XqbUru+XXMhTje5q?=
 =?us-ascii?Q?NDtIVGOdJKGIILXPIt3w13BFbFPsqFVAXnPS65Gjpv70C5Hk5lUGDRYO91D6?=
 =?us-ascii?Q?m4sP46wepBD+K7YK950kdHgbPT4uWHvKdMiDBujRM9x7CiXyQ0BA1jROmF1h?=
 =?us-ascii?Q?uI2E32aAwY+1MWCx6nGIhR7VSs86X04ZjGes1NQ3ONxMCVx1wNo8K6X81kHU?=
 =?us-ascii?Q?eWSpRRVGkVegtekRsktHCOd6B584g3JiS9gtpZIwEP2B+F/zacwTJv3btQJs?=
 =?us-ascii?Q?nj1GexKnyTJqqvWJuKu2h/IwftFKnT689illJVeVTrXp5MRRU9bm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b1a201-3b31-4165-2068-08dee2b951c0
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 21:37:51.1081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lunbWdhUHtBFQD3CeQkmHsSob3xBsM3MUGIjSwO7slpnZF/yWCSZ5pcGCAYYDQhHk35aphBHISKnrIbNBfd7bP7dTjtUjvq0NXNRwllcglw4p456eJ42t3WzlWBcPgf8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10969

On Wed, Jul 15, 2026 at 06:38:32PM +0200, Marek Vasut wrote:
> On 7/15/26 6:22 PM, Frank Li wrote:
>
> Hello Frank,
>
> > > > > > > [Severity: Medium]
> > > > > > > Will this node name bypass the driver's carveout exclusion logic?
> > > > > > >
> > > > > > > Looking at imx_rproc_prepare(), it iterates over memory-regions and checks
> > > > > > > specifically for the name "vdev0buffer" to skip processing the vdev buffer:
> > > > > > >
...
> > >
> > > never existed in imx_rproc.c:
> >
> > AI refer old version code, but problem is the same
>
> No, sorry, the aforementioned piece of code never existed in imx_rproc.c
> according to git log. There is no old version of the code that looked
> anything like what the AI produced above.
>
> > if (strstarts(res.name, "vdev0buffer"))
> >
> > >
> > > "
> > > $ git log --follow -p next/master -- drivers/remoteproc/imx_rproc.c | grep
> > > vdev0vring1
> >    ^^^^^^^^^^
> >
> > vdev0buffer
>
> The AI generated review content above does refer to vdev0vring1 , which is a

No, AI talk about "vdev0buffer" at beginning, never said vdev0vring1 at all.

"   Looking at imx_rproc_prepare(), it iterates over memory-regions and checks
   specifically for the name "vdev0buffer" to skip processing the vdev buffer:
"

> unique identifier, but that unique identifier exists only once is the entire
> history of drivers/remoteproc/imx_rproc.c and that is as a code comment .
> That proves my point that the aforementioned AI generated review feedback is
> not based on code that ever existed in the kernel.
>
> > >      vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
> > > "
> > >
> > > It seems the AI hallucinated something which is not based in reality ?
> >
> > git log --follow -p linux-next/master -- drivers/remoteproc/imx_rproc.c | grep vdev0buffer
> > -		if (!strcmp(it.node->name, "vdev0buffer"))
> > +		if (strstarts(res.name, "vdev0buffer"))
>
> "
> if (strstarts(res.name, "vdev0buffer"))
> "
>
> and
>
> "
> 	    strstarts(res.name, "vdev0buffer"))
> "
>
> looks like different code , and the AI reported "strstarts(res.name,
> "vdev0buffer"))" which never existed in drivers/remoteproc/imx_rproc.c as is
> clearly visible from the command output you shared above.
>
> So, what exactly is the problem here , can you please clarify it without
> referencing the AI generated content above ?

The problem is simple, node name should use

	vdevbuffer: vdev0buffer@b8400000
                        ^

Frank

>
> Thank you for your help !
