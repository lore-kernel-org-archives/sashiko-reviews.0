Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.66.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792594672;
	b=U9evyF6IQYGczhOt2VgNnfTGJ72PuXCXQi621d9M2jZKmg4ujAGxRO+Np11l1sDjc6Is
	 2vXlalfN7row0krD0duJUX21F5bzOhJJ0OoF9EfBEIjUPEzg1geMO4/5UVxBWxiLpPQyz
	 Cc15A5qsJQpS2n8XKwPtEb9j4ov93pb9ojbveIJSBjaDI/WnjjWIDYZBxjdtaYr9MkPpM
	 SvNiXGRgkoeruGqBxHF6gq9IlVG85bP0JfXoA4AaOuPb6+Z4PV5qJEZw+Xe5EMn0xxdR4
	 kGJsT8VgxXtUE1nDWX+QXtIc0IgzG2UHAHQTwOVpl3w4YEy67X/HZDxyt9hQc+ivz6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594672;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qmbD65mCKIcVRe2JJfXDH9G4nmVuWThovzZZcr2UehE=;
	b=MiznBM1boL9wsQoZZDzNHnoBCUpv2Fk0IXN1jXXoxk2FlEkB6l+Gk5sfptUKwms5cDBA
	 Gnb63gZyLV0uuq7JQIfJtarfTHDismq98KwS6IOwp0gjqEG2CIacoyegcDZ0haqIQCtQr
	 nslZctnxi5dS9FgwuVqf79dFG2H0YoEWhUe/bK2P2r0gCQvxeH1LgaYKTufj0wd2Ff1fa
	 yFHNwXhCsytB7JisqJPIhozTYbvXZy7KpDyXZMqh3ZJCZCXjsbcvp+unX294kXnb/prlD
	 NgRLIxvsT/qRu2QuG4GOy7VdVY5Ym+z4Ak2zxEclK6vs7fdCPxyLMGOqQTsoxVSVW1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Pe4yFvMv;
	arc=fail smtp.remote-ip=52.101.66.16
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D26606A322;
	Wed, 21 Oct 2026 14:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2D26606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Pe4yFvMv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8jm+hhRuJD6ml7BhJj5FF/qDKmlKO5jtnsTgn6bHf/aksn0qeJy+9FlsWd5QBW35mOdyLnZ0jBMqXwRgllDOdbNJuyi0iwNmozllx5JMjpoi8Zg3PiHUi7gQMkzB13xkwssN6ydFz9PjEcn7nE4uRv3UJHXxjFO2KqCOxB46wvudHcfWu5IL/SLV04qilraczke0fX8tdLl+083xK2ZsFu1dPqfSn2Zio3B5EhdcMTGUV/kpZcul5pCoxuK9FBmFtPMRV2VklEPGzDE9/jxaP4KSzMbeSMJSEze755e7KtILx6/47R7kBSdsfI0hjQDsnVJS91JeIrsubd/9rcQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RA1zTFyP5q1JgRgN80v/T0cpLP1S5i4prgpFbfVzrM0=;
 b=NgR7ipndv46kTfdjz/Yp6jv3IvPxpHkYyMnDXOxHX89RkTJhlkJAAKyoLAvhxdDaorW4qTTpCGXaBXwiBhcpdQdZ75nPkMaenDqxaMkIQQHJwhK+GxszQhxkYQ2ZqwjgJXo61oHSpOjM/PmClEuxSxxJoOVK9Ib/KIYTajojmV1St/O2rlcA5odgEQo4KcXnT5fOHg1Icp8ZxpYtCePlVMVXm2QvKqMr+shAAtXvgWqHATYgBe9YnO1xhM7uYE7H/+gCnCusUsKAIyiF8wQkvU8nRd+R2Qy8CVajpLxjxjUIlM1mOduQuil9auC64kfguhGHW3/w7TGtP06BjF4/SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RA1zTFyP5q1JgRgN80v/T0cpLP1S5i4prgpFbfVzrM0=;
 b=Pe4yFvMvDFa11xUMYnVRhDaZOk5oDLFO6+m4FMxaOaRU/AuENXmb/VAaHXz48xIyCItG535Pti1ee8qSQun7JaPZm3xuDtLHWjULfM3ksWceQpM3wut3O0RVmMAXMEzG2lGO8C4u7HeCaVLcnZ1kt/27vFVLmNH+2mYR0M8bCztZ1SAovs6iGlqr7oXmggVgenp0JjX9+GXV55Q2jQ0FmI9Xgihu8EupvHjlgrzIw6xPV+/7PyBnX6BNWT2y1rpezQH5v6A5h+Hv0K4CanSp1RhR9bSy3RCj0XyMdR0JM+xyzvChSzu1qqDwa34LWJEKJmrIaOEbHjXwd/0QNVThaA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by FRRPR04MB12593.eurprd04.prod.outlook.com (2603:10a6:d10:1cd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 14:57:49 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 14:57:48 +0000
Date: Wed, 21 Oct 2026 09:57:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Petko Manolov <petko.manolov@konsulko.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu
 board
Message-ID: <atjS5TA33rHlIjPO@SMW015318>
References: <20261021092140.4142493-1-petko.manolov@konsulko.com>
 <20261021092140.4142493-2-petko.manolov@konsulko.com>
 <sashiko-outbox-180038@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-180038@kernel.org>
X-ClientProxiedBy: DS7PR06CA0044.namprd06.prod.outlook.com
 (2603:10b6:8:54::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|FRRPR04MB12593:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ddc0d2-529a-4ba9-d8a6-08df2f83ac35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|261009223027099003|10067099003|56012099006|3023799007|6133799003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	K52oYPW19FjUdpwHlxM5WAzofgcFDlpf3kZvYMGdyuGRmtSHnAZmrvagxxBpfK+x5tfgnF++PVgf4RatRe6PszzoUq7eQWT52PVjz8sQbAKynMv7ePWc6Ejp8+GDCQX1S4WIF9UYwsBJY+Z2kuDA2msoPE47IWJ77k+ix697ZPZDjC6f2ID4OTmJ2oEFbcI6YkeXM2kulG7fLXyreSySjKGdYiEsQtBCaY2FSKay0JLObI1xHiWuGcdYD84kT7htHWSpHtuj+RYgzrALYndtCnZhqSC1WPZ5iY4JJByMdlu1TjoTw3T6PO3emnX6IcXqV3O653uhQdD3eTuDeJXtVp1cOr9pT0xZ3gXAixwJXhM/Uhexuck9WMy1bS1SkOmg0mLLwpY7b7yfKFF6MsjWuiLG0rcoloLKrQuLoeI7LpainGkuxa4X5rqB+W4mLwz1Lwc2H4bLjeVYXZ6xKOHeSl0p4fZZayX/8ji2tQm3OhfQ5lC7pvsQk/Es0S5IRtRNYskPd1x1GpB8am3JmWrFIjrZO/820FFUOVfjH2NNQWfxoNRMcBKJeQs6ZQrhe+nKt1dCUQ4c/NWn9cNfwE+WhNFiJk+MO3dCbD0lWoxLP34=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?KrSyb8JHRvuNXfQ8xbmy+Z0frYZKGd1UuPIbC8z00pb1RGGYJrX0s1892q?=
 =?iso-8859-1?Q?QeWLcui7vQMb4y+6r2NpnflKn4GL5g8/Glec06QafreE8ae7qd93Exd/z5?=
 =?iso-8859-1?Q?3OH6UX7bPCwE1o7CwYLNgjwPvIDu5TdGcv97QBaPxr7wL9efYOfhnM/06n?=
 =?iso-8859-1?Q?zGcTifTKNn84+37/6ovlq/IQhROQUhtbh2O0MY1UYAEYHDwSRZq38PMeCT?=
 =?iso-8859-1?Q?dRte/xRN6NzjyaLPAk7PwxEZvSiBdRwHEu6Ul9iOx9+ygAVphY4pIVPHg/?=
 =?iso-8859-1?Q?X3crGqsqomNSTWmOusRZKx5Gbr5CqxiNRjLeQhrZTveMH4gld7gVl1YYHD?=
 =?iso-8859-1?Q?yDmx30+YHDKpM5AblmjOz1kV80gkbCzahdPuMYefjLC4gfRYdC61Kp9Gp/?=
 =?iso-8859-1?Q?sz3BnaWpNn6Azf14xjCGkMtJCdaiaw3dQQrOlmsXQBZruKmvOlODRpfZN3?=
 =?iso-8859-1?Q?aD1Gn97UfJErC2UhJit30OeK9GAKxJRPwxKFVUxGzLCxBia2NPFnk8BiJU?=
 =?iso-8859-1?Q?uED39faYtUP3pheGRt6p6rophbyhh2HJOkg/6JXhoM0jAYUOVBjHe4hyQq?=
 =?iso-8859-1?Q?rXJe1IkBVzLb/YCu/stQd/OUG9fbHskfmHwGtw8BaXKeyZeBiEZhcBP5/s?=
 =?iso-8859-1?Q?iTA2nUuJ1GOKBhGGpL54q3xX3b0qXsCOGfFODTIIA05ESa6DzLQT0URgzz?=
 =?iso-8859-1?Q?7k/IphjSbgpStEC36rC5VdZOhpBGvK0gvggbqbZ0mnFt21bvv12/5CNd0Z?=
 =?iso-8859-1?Q?oIKl3Yon9x0q/EN+BGVNmkZxOr3isVRvpDJ4Pjo1mv6gqNk91o6GoSVDQw?=
 =?iso-8859-1?Q?sYZQbcPNRAXBoi7ul8rqU4HIwFwFotbn0Na1wPe6DlWR/NgGWq5hr9Mre9?=
 =?iso-8859-1?Q?mEGxnkYQYoX+b7Z6+DgJbCyBqKDZbjzQPwrG1qkYNhgPrsh5diurIHkFo/?=
 =?iso-8859-1?Q?FYB/lxQ1RojHbe+0jMHr4+QXFz3YGcTTBILLg7MBZoqA8u40JY+SBHueaJ?=
 =?iso-8859-1?Q?hX2we5mfsDRqKsBwd9zljQ5R6TmgW4ODlaFfUpIBH2s+p8jtbHEdVJMHH3?=
 =?iso-8859-1?Q?pDDQVPBP/mIIBfA2ejz9RAfXDDB6IbyQDR6fsNL3PEi5/bszndeZ3i/4AE?=
 =?iso-8859-1?Q?wpMzGMmB4Mb8+uYk9PDRmb3LMfO74nt4UDkAAlo/ztoWQj98NufQihr4cH?=
 =?iso-8859-1?Q?9+PKdsFvt2EHkqy/b7FYiCWNxFzYJ8jDJWs73sWAMPTcveNWYTQlXk7YRM?=
 =?iso-8859-1?Q?bCu8k6SEoxkRVLckmLPXm19eTq185dXIvj6gdVexZqcReukECRVF2pod9V?=
 =?iso-8859-1?Q?IJeptAO0PI2HA8fO++2vZXoPZ2Sa5KZmK7cHTmwzOlekOB10Awd/XSffZL?=
 =?iso-8859-1?Q?ndL7BhpdsCSY7garkeonGV0kTaEKhfqdg7hf5FuKAuH7r3nbk0Bqo4Tabw?=
 =?iso-8859-1?Q?0H9nZvj7Obo5z8oK4ZKPD8wLOBIeDm5PrZxfOeGsQHmpbgOt+1vXvQHcfO?=
 =?iso-8859-1?Q?3PGuoNWWwX7QgESQD7+Ns+ofChxcmqI6z9gbRuVSD9VBYwbc3/u9rADHtJ?=
 =?iso-8859-1?Q?iSlqFlMYKDWlhBQsvIoghbNMzH8HluqKS3F9tH8qFt9PN1nwvb8YhR82mx?=
 =?iso-8859-1?Q?IERPdVB/kWcYrDmZFNOTZ6EgmYEjLFpVnqngWPZHd1ZuIijA9FvUVqIXUb?=
 =?iso-8859-1?Q?IQzcmIcyH8k1MYAr4t/vavpR0Z8psFQqeQcjEw9o0x5pVZMS7Ovzj7pRYL?=
 =?iso-8859-1?Q?IsgXpkLDZBoln1OE4wAYonun8U0xQvhQyC0t0em4lL0Ok6RxksX7A1g6S7?=
 =?iso-8859-1?Q?wGDEutSt067qZtwH8jsMVvDygSCAg1cpf0xVemh5M6rF6EgOBxyV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ddc0d2-529a-4ba9-d8a6-08df2f83ac35
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:57:48.8157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41PDYgUaFatys2FvAiuWJ352R7CRwNK/PEXrSheRAyzzmT5yMP1zVUdFH3I/DVQgPNUl5zTx2F8ykJJDALuTqOb/mDKK803/9nl9ErAwh5BTm9OIwAEmDv+eQzrkMh8D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12593

On Wed, Oct 21, 2026 at 09:32:12AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: arm: fsl: undocumented draeger vendor prefix
> --
>
> commit 795e5eabed6a73f1faa10f56606455efcbd039b8
> Author: Petko Manolov <petko.manolov@konsulko.com>
>
> dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
>
> This commit adds devicetree binding compatible strings for the imx6q and
> imx6dl variants of the Draeger M48 board to
> Documentation/devicetree/bindings/arm/fsl.yaml.
>
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > index 656f2596e1d53..8f3a04228780a 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -260,6 +260,7 @@ properties:
> >                - boundary,imx6q-nitrogen6x
> >                - compulab,cm-fx6           # CompuLab CM-FX6
> >                - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
> > +              - draeger,imx6q-m48         # Draeger imx6q variant of M48
> >                - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
> >                - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
> >                - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
> > @@ -458,6 +459,7 @@ properties:
> >                - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
> >                - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
> >                - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
> > +              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
> >                - eckelmann,imx6dl-ci4x10
> >                - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
> >                - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
>
> [Severity: Low]
> Should the draeger vendor prefix also be documented under patternProperties
> in Documentation/devicetree/bindings/vendor-prefixes.yaml?

This need be fixed

Frank
>
> Currently, Documentation/devicetree/bindings/vendor-prefixes.yaml has no
> entry for draeger between dptel and dragino:
>
>   "^dptel,.*":
>     description: Guangdong Dapu Telecom Co., Ltd.
>   "^dragino,.*":
>     description: Dragino Technology Co., Limited
>
> Without an entry in vendor-prefixes.yaml, process() in scripts/checkpatch.pl
> reports an undocumented vendor prefix warning when device tree files (such
> as arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts and
> arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts) or driver match tables
> reference draeger,imx6q-m48 or draeger,imx6dl-m48, and any draeger,*
> vendor-specific properties will fail schema validation.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261021092140.4142493-1-petko.manolov@konsulko.com?part=1
