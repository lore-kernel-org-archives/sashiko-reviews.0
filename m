Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C8D30ACEE;
	Wed, 15 Jul 2026 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132545; cv=fail; b=fcoz7yxwWajPv7DFJc1EMckMHTDt9RZiYLolMVmwNyV/Aif71oWRmG/4rAAyXHONQeS5znL05LYNZ3zmnqSczKXdcF3zTrexsLGsVNZbLKCWVhRo2S5fXTv43QKKk1hYZ62xogGbPl1MiDx3YaoCIxSktN7dRGred4PuLLuwu3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132545; c=relaxed/simple;
	bh=uifCllynZSud+oJ3rbzLUw0ENwvF3UoTP9oSobUMcwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HpFKD5t1nwt/MB3T0Ad9HeBHmn9vAzZmAxIa+3gK41VoYVcjSun0tn421LrdmD4E/PM5BMl+ftMQcm2FXCdgm50knLezsCVH/7PXyRwlbAvB1602/rvXVFBah+QPZcLUsOXNICQ2xI9ivwoJgivt2jsWFOwUC5+hXioHcmS1STc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KGGbolCK; arc=fail smtp.client-ip=40.107.130.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KGGbolCK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBtIDtwSNVYqbAZqOU40U2i+CKavX6Ubb6IXoVhNtxCsvE9MiSSvAidROWx4spnD1BncY7EMf2xv2//dLHNit48MWI917oP60wJ50awMkwPe3oS+esvWydCkib/3ARWI21Sw0fBbfwfhbtaYKC0snkp2VF8/97ND17rW2R9mU0eugyDBe5iT8YcNhYLdnFpPSx+B6cXwWNDlWa/MRlQHd9mbq2wH5eQbnDjsdu5/mVzYZpoJpbFiGbht5XMA2gmT/1vXYUGn02h/1yldLT4eMhi3Fz95HK4JALi725QNRM1gnf9BBHVe2GYBMR8Sk+B6F10zWLbJCo2kOABCEh1BFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Je5VLBZLvoSMozpEbZJplS14fHGgnzC0stnslW71pnE=;
 b=dPSxnGQJehZty3t1ZyKfyOTxfXqzwC9oRyqfqf5dV4WcfiU/J1LhJw/0XjSy5+XkIZwinh2LXbCxOesRYyKCocMioczQmwW8ltashrmhN1bxOS7E6pvqTCj5NY1IWoOp3c3sF4MJzCax+nRaeSwLgvSeNCEAQzawozFDMtzg4laK+MWxQ7qBk4nkObduMF7neXh64JjbeA6g9EHfu+qhmrkE+wQlRpY8i1gDc6lBJNvM+YC7Oy3VjT/mg8BAFysIVgV7Kn535XWTwsjvAl94GrfwHPb+1meOxJPU0W5t/IIxga+4d5MTK149ErhFDv5kwxRjEozOyx9ljrSSXvG8VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Je5VLBZLvoSMozpEbZJplS14fHGgnzC0stnslW71pnE=;
 b=KGGbolCKgedIEBVK6pctnGFrkGFolOuEs9ri49G1p69Zf+RaszSntECJDmwue2QNHbicsoVvcutp75jmbHLy7QOG3Dz2iV3U4hMYvNkoZao2UnOl0Jn2HDWh/jyNQCNPeSSvGBGWu8YZkNncQNOTQgs1N3+herEGYfdY0/gXgSAqfiiGxR5lhvcAwL6YWYNJUaKQLpAuJRJYZOZikkrrNcrvZCN7XmwkiArwRMR5E2a8nXqnwnBLbvSWGEe7BYURnSopTgz0QlPVS4h/LHyADBwWL/FPc8pJO2GNeB2aTJv7z7KiDtnyH1Pi6I/sx8Mh/yP4+etHc+M951rVtDVMhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB7170.eurprd04.prod.outlook.com (2603:10a6:208:191::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 16:22:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 16:22:16 +0000
Date: Wed, 15 Jul 2026 12:22:08 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 4/6] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <alezsOsf61Zv6F4F@lizhi-Precision-Tower-5810>
References: <20260705200534.151803-1-marex@nabladev.com>
 <20260705200534.151803-4-marex@nabladev.com>
 <20260705202439.3F5771F000E9@smtp.kernel.org>
 <alUICTI-24tREZO8@SMW015318>
 <f1e52327-42da-48e1-8e4a-dabf148ce216@nabladev.com>
 <alWR66rjt-9jGEOV@SMW015318>
 <a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com>
X-ClientProxiedBy: PH7P220CA0056.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d25aaa1-feed-45e2-a044-08dee28d3c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|19092799006|376014|56012099006|11063799006|4143699003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LZwXdr2k/heosMoxZUy5zkHc0IxwDnpcAO+qXvD2Cgj2+EM/rLGGActKyGDgGYw6HahC+bjh546eGAf9t85u8IAKzrXualb2N0tH+jP2GHOAb883nk+lFjgPyvzSHrX7RZiWVPNIpPq/B1lGU/l1zBdnJnpQ6vcwAlXfK64QDodyqPK3EuqD79CWiabLaVwjcBfuV5WdTm5z+DOmmBfmMIiGvqesx12Jumil7n8JtvHIfmUihTD5VVkat87EX+DetTsvvV/yWGazB5mXfAZ8IgPOMpP44Lc7niYvMJ8LUUqlyqJ3hExEJzjl+dav1GLC9Rb0pRsdOpf/mSPFKoMQ9qJYfTZtRAmTD2Guko45JXv6mg6zBRQ0Fht0/rrH+fFGT2BjntwqCuuWMaP+QFV6+EbVeP//fxeaYJoFi/796vX8ydrFnq41WjmZn3iBuYBp/4li12UBaJv5gzo7TKCksnM+fqEi4S8/wNKfOfOkiOVYc9ZoTA2NUdy4n8Hm0RiNOLrg4Z6/Ao5IW9uNmOnZM2ze326+N3ZgRynnj6dfDale8nFFnpeTKmhCml+j7O4Giz3G7ZeSVfdMTovfCnjW9dIjmNL4oxY/ycJ3/4yteuGpb2f8yuqZyb8/UdXHiCcfugko9y+P+Dd5RY7zBZxjdbFEHFjFM/oQXvh2LntElMo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(19092799006)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vdv9xg0SKwoxeRJU4EZFghmWMVz6CD31TbpGMb0rYC4tf15L4oa+Zzfz8Y6l?=
 =?us-ascii?Q?lApvveFaEc6Yl0ksOGa4P/iOXSkJSE8vDGGSODACbrWf9y2Aw5bh9bcOt4PU?=
 =?us-ascii?Q?QqXwPCk+JHE0kW9I7J5FmXoIOGaDb/p6sch56wjmfOJZdNzsbPSZ8mW0xh9+?=
 =?us-ascii?Q?fF9ibuBwRIFC/Eu+nZI9wvAutODTQh05uIAEIZXkVX7DgeDFBJFhJNXFiOJp?=
 =?us-ascii?Q?qJgZMuH/dfOLqC3qUgYfr6nTiDq215upQJXXPzLJKPaIzESL/iwlyW7w2Hl0?=
 =?us-ascii?Q?wqDiR29cbRZwoxrACPP4dMovDHsITA+QlGDU3Xtn9/juMrWzUX9zLsO1Pl0I?=
 =?us-ascii?Q?EaXalG6fEXrRPzZFU89QwypT+Rjwq/YoD5V1mXlcAvWxjzJUNRT1JQJdQaA/?=
 =?us-ascii?Q?FUGlvN1gAJWZgmI574ELfwnDiF2mLpaSsjDIQ5bRZOGSX95DPbDS3B9VWI6k?=
 =?us-ascii?Q?aA+hDJLuz3B8jJtmTqthINg4hXONX13hWJZiGztpYPqX02ry1n0noNjNjAGg?=
 =?us-ascii?Q?huDRMNQySS0RKwmuF6Qb31WQNrD8J+iYscXtGvSEc4h5XMmPw8HqB7r0BwbY?=
 =?us-ascii?Q?HL8z7imp99xKvkCcfGlxcjPTxLzssWaU8YGeOlz1ZXLm34JWKP6bR4n0yP3S?=
 =?us-ascii?Q?MzawMg1vMERKo9TPrvSCvFNAaQ+VJj53/Ip898ipIId/XMb1ZeOMlORXGRIy?=
 =?us-ascii?Q?JHa3l9vQpb26ohAejCuXFFuSA0jIMeGSKCN5ECVyMB3c9/dztKvLD8VBQDv/?=
 =?us-ascii?Q?XRb6vyl9urX1TMsw4q9rBazdntO8e0MGIyIJ2Kx03Oz7342BmTmhkz5d5yFc?=
 =?us-ascii?Q?k+TMsysSpBdMwyC5FIfYzQpx8y7kbUI16Mr/lRoQpNmBbzPAf6NgcPOfaHCz?=
 =?us-ascii?Q?pm6XFRCcB3MNFEltcRzLoZ5b5/dTEkNThzWwu0eImrkiMrdgVPEVbMlBlymt?=
 =?us-ascii?Q?2xjyVontwnZb4+i36jQL8JMPCy0KsuXeAbtLlk9zz9LOpPBql1SnaQCUptib?=
 =?us-ascii?Q?UbI7SKd65TSzavhOfatBfiPDtC/f1x82kmd3DxoFWyton22U1QUFWgPbrkNb?=
 =?us-ascii?Q?heqHRL9Ty3s69EpWa9F4Ctgxb+t8l05UtlPCjDHQrS/Hs8snmbuW/U6zR//r?=
 =?us-ascii?Q?lviM5J6aSmzxXIj3pOD7Kz9B7PPQNlmQvucQpEKcrIWNlR7/2+pTW7zmaAr6?=
 =?us-ascii?Q?NHntHVQ+i2kWaprfHLWR2Db00rvijlKospJNm8PQTELB7LQdhMVvBqdnDhba?=
 =?us-ascii?Q?oh1cH/dfNp0SqmpJ6sDpvP4quEb5QNmxgmMzzy8RFdgwSxM+Yk76jie35Evv?=
 =?us-ascii?Q?IA2hI9uw84ADK2Zi1ZXqoC6EFkMZbjOu5mTwRK7YxWuh0xbJNkhZHzRYOzxY?=
 =?us-ascii?Q?1mm7wnesNSMM5rXF1fAW48rTYrJmOv1m4cN466ucUNf15M/mrDRxn+0irDWX?=
 =?us-ascii?Q?yvxUzo1xaspQ/OwMCHtV9hhvM9p5LZG9ydh3Qfwa4netT8jHaZrlgMc3ZDC4?=
 =?us-ascii?Q?1Ool0QUuXpEyo/HeZZB9S/ETzYoj1fbtpBYObTWUkt3CVbKgjWJeFNdRsSzD?=
 =?us-ascii?Q?Z1HDrqz/22rKwwyneilZZBljVS2998GbxGgGt60roxOJLJ6XvSoeq+N+aLMh?=
 =?us-ascii?Q?kC7VhL2T40MbIxC34FUqRUI+KnjPCBd+AdaseD5YXeY+gMLvdahgbEctNgqg?=
 =?us-ascii?Q?Nr1tQcHIq5HDeD+rZpfEOD+VVsrhI4ydEMDX2rRnOPLY9GxoIaDKdxFWZ6E9?=
 =?us-ascii?Q?0BZin0aYHeTWU4Hn1d5gUC7v7poIayfdEX7Yifwj5QUrKk5CzRTy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d25aaa1-feed-45e2-a044-08dee28d3c29
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:22:16.2852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Va1Xfjg5eGaRTxkfBc6yd6grLauPeQMgXNsgv16mcPynRoALsReSZZeTujI39GkQm8GYW7QhWDNQti1I6md3wdLx+4ySpgG92maxdS9iDCC5XSA+kETPxaJezrbt96QM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7170

On Wed, Jul 15, 2026 at 12:51:26AM +0200, Marek Vasut wrote:
> On 7/14/26 3:33 AM, Frank Li wrote:
>
> > > > > [Severity: Medium]
> > > > > Will this node name bypass the driver's carveout exclusion logic?
> > > > >
> > > > > Looking at imx_rproc_prepare(), it iterates over memory-regions and checks
> > > > > specifically for the name "vdev0buffer" to skip processing the vdev buffer:
> > > > >
> > > > > 	if (!strcmp(it.node->name, "rsc-table") ||
> > > > > 	    !strcmp(it.node->name, "vdev0vring0") ||
> > > > > 	    !strcmp(it.node->name, "vdev0vring1") ||
> > > > > 	    strstarts(res.name, "vdev0buffer"))
> > > > > 		continue;
> > > > >
> > > > > Because this node is named "vdevbuffer" instead of "vdev0buffer", it appears
> > > > > it will be mapped as a generic carveout via ioremap_wc() and unintentionally
> > > > > included in the remoteproc coredump.
> > > > >
> > > > > Could this node be renamed to "vdev0buffer" to avoid wasting vmalloc space
> > > > > and bloating the coredump?
> > > >
> > > > Look like make sense, please check it.
> > > >
> > > > It is not good to use node-name as ABI. Laurentiu is working on use
> > > > memory-region-namses.
> > > The memory regionss are referenced from imx8mm-cm4 { } node via the
> > > memory-region property:
> > >
> > > memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
> >
> > I known, but now code parser node-name, At your case, it.node->name is
> > vdevbuffer, but driver expected vdev0buffer.  so above check will be failure.
> >
> > suppose it should be
> >
> >   vdevbuffer: vdev0buffer@b8400000
> >               ^^^^^^^^^^^
> >
> > I know it is bad, but waiting for Laurentiu to fix it.
> Actually, if I look at "git log -p drivers/remoteproc/imx_rproc.c" in
> current linux-next 20260714 , which has the entire history of imx_rproc.c
> and the latest content, the code cited by the AI:
>
> "
> 	if (!strcmp(it.node->name, "rsc-table") ||
> 	    !strcmp(it.node->name, "vdev0vring0") ||
> 	    !strcmp(it.node->name, "vdev0vring1") ||
> 	    strstarts(res.name, "vdev0buffer"))
> 		continue;
> "
>
> never existed in imx_rproc.c:

AI refer old version code, but problem is the same

if (strstarts(res.name, "vdev0buffer"))

>
> "
> $ git log --follow -p next/master -- drivers/remoteproc/imx_rproc.c | grep
> vdev0vring1
  ^^^^^^^^^^

vdev0buffer

>     vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
> "
>
> It seems the AI hallucinated something which is not based in reality ?

git log --follow -p linux-next/master -- drivers/remoteproc/imx_rproc.c | grep vdev0buffer
-		if (!strcmp(it.node->name, "vdev0buffer"))
+		if (strstarts(res.name, "vdev0buffer"))

Frank
