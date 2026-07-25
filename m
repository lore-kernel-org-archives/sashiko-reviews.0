Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E502931FF;
	Sat, 25 Jul 2026 06:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784960546; cv=fail; b=lEfMAeQI+w0L4CxzOjPs4kwiPhgGfyp6vVFL8kORk5MnoOBm69fMiwN5hPRuPy1ldmYjnHCTaDGNCEQa6+iz5ls17UBUbKAh8qWcyS8d3BMKnXo/1PRoFwpklcLxwPTalkBHpToZ7p4z8pxGXpzxaXHM7cFGPRrN5dr7AtcjCRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784960546; c=relaxed/simple;
	bh=O7D32Yrq9Bl8ulSr46gKQSzOCTxa+LoNPMMh61EQkcM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h9bk2cccC1bby3+iGTCt8QniGqfqA8MDEawXAHqXFMdafk2FuoUd+eTEx9Hb4UtoBiG0cAH7EtQMa0y40wb9vLSZsumIrGv710j7/SzHpoR5tcINGDkNhunToUlHulFbBJey95MjtrrM9PT1mTU9mBYcsTIl+AM4TQQ04WLFAUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BBCoebCx; arc=fail smtp.client-ip=40.107.130.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BBCoebCx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AthU9XS8sf1QqmMdGvMWBhuiyp92KegfZiyqSVLPcPlYvH3QB33EMzmicNfn7/LU4QjIqxV4J5vjysJI8Tkir+ZtM6Fli4AiIQe6yh1WFO0b8WbShXNs6nYfnLlww+lnnC1o0CVQkDgJGnZ2f3iuljVRZlB02zNQlXGuXGZx++uCcvOSlt3G0G+jvKtkNYtm36fJZcg3Ec9MZu/N0iqGVTZTOYsem2BlnVrmtxlKoVvB5DimQlUW+P06SmGBQxBLmI11G6DulEzjzipcxrYAA4IyqOk2u2XBDGTF0Z2hRsQNFQMIumUlExksr6svOreaGaWquhscQrrf8TxTV3qAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt/teTvSgaiSf9/kxly8NrVSTuYzNEHC702ozJI1Cq4=;
 b=nD09f0c5yGMMlti6zeVOooEw4a3+4oFsTbCTdtSN4/7NAWts1BBBmmql7NXgm+x/XFOveB1NtSy9MirBdczYo78iPkXRVi9er43Fb+plWeXS6Cd0J1oumUju6/9w1EMfCLq5uoRfAMfmOd+JwUpl0dWdbWYJKdudgb/iJs0fmaG2BHsRyeZQKJScBLkE1SD3xbhhu5hSple8t4q0GWddgZ2/yXrL7B6UJOSIPUmbRi+D668K69w1hMEVQ8QrCSyHdQfU5BCZBFxf4DW/jJByt3cowS82HBzuvC/iwJXjLUMIzFhVSNHBBUpcVxj372K5M87Z9CK+/U815vSFIp6lzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt/teTvSgaiSf9/kxly8NrVSTuYzNEHC702ozJI1Cq4=;
 b=BBCoebCxKroagYIwYZYqpDQ0qCHd4P3aydsRChgRfrVlY2KH1LPAvabrje/+tLSrUzOev0MgyCtrkOIPDe5F5ac7jwvRfzQP9WqFbu7hmwn7R8jNQE6qK+hqcLitbpWUI2cn3Tsbd/rtkUmc3XyVcI0td249SjqZKfiOpSAEe9vcTWVuXntXnnakIFwAa/6e4qhmTYptF/5f6rwHoVq2ec39k8M2pkXHQUgFDKVHfyiaUZkVrn1srTR9de3d+rMtoBYVBUPmK9EAMvt0eY6kV9lbJc3KqtJfdXSBUue+ROm/fLduMVMvE+enQPRT8oFCDjOQoAr9Cmn68ZIeJf32zA==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV1PR04MB10797.eurprd04.prod.outlook.com (2603:10a6:150:20d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Sat, 25 Jul
 2026 06:22:16 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 06:22:16 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"media-ci@linuxtv.org" <media-ci@linuxtv.org>
Subject: RE: [PATCH v4 3/3] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
Thread-Topic: [PATCH v4 3/3] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
Thread-Index: AQHdG0D8PSwCpr6b00msBzkFKhwzq7Z8T2AAgAB81gCAAPgKsA==
Date: Sat, 25 Jul 2026 06:22:16 +0000
Message-ID:
 <AS8PR04MB9080E95D676915F8DAF9A710FACE2@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260724-isi-v4-0-27df7b5f6060@oss.nxp.com>
 <20260724-isi-v4-3-27df7b5f6060@oss.nxp.com>
 <20260724080342.998CE1F000E9@smtp.kernel.org> <amOFFm253o4lwhs1@SMW015318>
In-Reply-To: <amOFFm253o4lwhs1@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|GV1PR04MB10797:EE_
x-ms-office365-filtering-correlation-id: 7acb46bf-ce3a-4d91-243c-08deea1512a2
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|38070700021|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 5WHsHtE+LeslQsmtM1X/fWaGaaXqyIIYKf3yEM19KGasD9FqZ9JtPo1/5WAKlun0aaJsGf6NfY/GEFnCbX1jsz6Ahw9it4HFYHW6KVabDovKKoch3kuvCQwXX1qqmIgx41KOSPvOYh54wl5mj0dJHspifYP5eVOmpHL8ZrizcnvsTxFBl25bE1qfP/i34Wtd8WV4AASyZ3tVU+su1RWXZjMtTkIAwqkbAP0lQ43xhp1V17ujd/t7Kwcb6HNwv5pby8POfXFX0Y83h2bU0VVgDzQvMMbcyCX1piC7KCoOxki/lpl1YRFsHnQ5NvSctctBI+EO89J5zPkIFtHzcFnrBdTNZz94yIPEwjq/8qO8l5LvysUTZCwHAsiVMywk27gqB2LxHxqdUzjvKj78wJE8N10z1Paaw/In/fCbe94IcsFIrDh1llAPF2XZd+Rys7eeiyRL/kSfsMF+mfCI5vTXveswXDlHNffZa2jxduQ7iTZ5QdcmV7KOWeGx2dGKVBhLm3vV9m+MXtvPQ2DeNG9J3GjhhhFfE2ZPQNCvkgVoNjR6SwWm6MUiQ8qh1tumBH72hfRT/PeHUtzoDzF1bUO9YjItdQyucQxJQhgqal3/EsF5SaAei+J2fkoT1vW09p0EFpReAjMuRqP+TZo+8NFN11plsjAAQAWe/haCTryXLlw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(38070700021)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PSaTPwD+v0tN6p/J/hxXOAWB7zItRqLB4MNuLR2daYY4VTV/n+fqy9JtTgND?=
 =?us-ascii?Q?70TlH9N5t67FaN6zqiC6ILNzSM+KaHWO1UeF7KgDY7qPPikyXlg6HLZxy0nA?=
 =?us-ascii?Q?irnTCQcCzGxdtZqdVr6hRFkTBmPjs/4RwXfN/xFtQbdBDPnY52hLF5v0PmhA?=
 =?us-ascii?Q?wJM01WWWewgcAUdjKxEMl3JDgUBp9uvzX1jLx4bybKk6YLTVzUKU7YHBplQA?=
 =?us-ascii?Q?5GPufII8OF8Vtk0lnNup/s2vN0L8FcnPVaVcxBmVFvmPoo4yDkP/XlKHkKE5?=
 =?us-ascii?Q?vCIMWNLNlTeMK4y4cfR1mx6GqBa6WzCHiqhL0WiwKXSVeKY6D72GF0XtwsmL?=
 =?us-ascii?Q?A0eAVuqgPfkDmsf+xGPkDQCghq/Se49kZxrvPQvgvh+i3xqT/dK1TL1sMLG2?=
 =?us-ascii?Q?GtsVDcGgk5BeKp41/jHGMe6xV8JZowZSdQdv4WHmGDjJZysgP9jM6iwb0YwK?=
 =?us-ascii?Q?+UO3PJdGOdsYpxI4VAOClANWEV9PA91uIWS6goYTXAGg8e0xkvOZBqp4K7uq?=
 =?us-ascii?Q?7j2/y54WYnIJQxukVv4nyO8habq7/yKCn8TSoPZMQlOR0blr2YWPBHeSqZ/m?=
 =?us-ascii?Q?6wbgWlqZKTt/9bIm5NEqvcrZHoQm9fBCXsMypOH06bD7GUoi2A+VcnXG7/JF?=
 =?us-ascii?Q?f7Z4JCzpIZe6suRUcXcvznlfCT8eIFqXx/x5ut9NOru3jHp2aWPWyt5gptVW?=
 =?us-ascii?Q?DHbYeGCEq3cx46PEkb66akyJ9IxAoeJ3uu6tJH8PKig3AfTE39timmGVDsy5?=
 =?us-ascii?Q?sZpOFwD1KQhmlhdVZ52XnmCONux1GCvuyertggrZsq4NMetVyme8loeFKu5N?=
 =?us-ascii?Q?Y3iTknNy5/t/r6tMcJ4AMhVCt4bB9/sC7uUeQ98aVzEfowBG8TdT/ZRml+zJ?=
 =?us-ascii?Q?gyubBdGfbnYeyl03yzzxvcK+PPGtskfPSlYxJsrdXGfPaiUci2Al6LdqelFb?=
 =?us-ascii?Q?Gf5JJzTtPQkg7TYczPaUIiCNn1RqXC4XFoIVN2zOk3KHgXlqg8/7M97kmate?=
 =?us-ascii?Q?vmATeK07WGtr+NF6axUR4WhgF75+apYaOy8vUlUiR/U8mJct7ht8WNUC3jgd?=
 =?us-ascii?Q?RKmFDmOlBKMc+WZA92s72vUAC2UwUYQF1PrFpRaEOm1NX9QTPbXZNQeookgN?=
 =?us-ascii?Q?L90CuRd0kBBbL4juV2tuHti+A6q1NKafG2qS/JKz06ZDb0pioZq2JBVX4m/3?=
 =?us-ascii?Q?p78oPLwbGwN7HSbManjTdfuu+De0geF225vmkQhCzXvkVt5PUMhnKl+vu1i8?=
 =?us-ascii?Q?G2BYnhpSZXYNxvHOIZ8AFtsNSREOOYrtiWc5D5NacGUAz+12crIKMWccg5CJ?=
 =?us-ascii?Q?XXcKTqpxtaU5lkULOZbLONzgxsTHj2yzGokI3jO66gwPU5e+YYTbt8Gpa28Y?=
 =?us-ascii?Q?Zt85ZIrerqiH8/cNcwGAYv+QqbUzjSGz5ALKVhpMtK6kziPO7pXoug5aSnyB?=
 =?us-ascii?Q?sgTLtzIvT5UWt9M2sFaDbftxOcDMcs6bYGc/2Bvt1+VxWsZ5HGr7AqDtANGY?=
 =?us-ascii?Q?zQKvyvxEdPpYD8Fr7wEjG4Hru4oXf3m8k8oPcZnqqiLoyoLtFyBIlvI0GJRo?=
 =?us-ascii?Q?yBJ1O4xaG37UOx2Hvlv/INauMunUIZmsu+oBQTwjtlTLrPE2CErHOdO/hY36?=
 =?us-ascii?Q?Z8zy1V9h9nj0BZylkmEo0Zx4xFq5/JuiCeHFdi70amoeZXIKx2bBDBCDah9J?=
 =?us-ascii?Q?XaAHFnq83QMpb+bLCj/KwTT6m0HmFOhcql7deyESFMiMifLH?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7acb46bf-ce3a-4d91-243c-08deea1512a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2026 06:22:16.0380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P8Aty8MrY+z4VdiI0z0O7sBq8GkqiXn64edhYwMNe+TjUsYGiP+uuUsIzO0nZxPl1ASY9MCvqaEkaBy14c8gOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10797

Hi Frank,

> -----Original Message-----
> From: Frank Li (OSS) <frank.li@oss.nxp.com>
> Sent: Friday, July 24, 2026 11:31 PM
> To: sashiko-reviews@lists.linux.dev
> Cc: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>; imx@lists.linux.dev;
> Frank.Li@kernel.org; media-ci@linuxtv.org
> Subject: Re: [PATCH v4 3/3] media: nxp: imx8-isi: Add additional 32-bit R=
GB
> format support
>=20
> On Fri, Jul 24, 2026 at 08:03:42AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to
> consider:
> > - [High] V4L2_PIX_FMT_RGBX32 and V4L2_PIX_FMT_XBGR32 share the same
> isi_in_format, which will result in swapped color channels during M2M rea=
ds.
> > --
> >
> > --- Patch [3]: [PATCH v4 3/3] media: nxp: imx8-isi: Add additional
> > 32-bit RGB format support --- commit
> > 60dac66057b0040d017034c0952f79ec30cec366
> > Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> >
> > media: nxp: imx8-isi: Add additional 32-bit RGB format support
> >
> > This commit adds support for additional 32-bit RGB pixel formats
> > (BGRA32, RGBA32, BGRX32, RGBX32, ARGB2101010) to the i.MX8 ISI driver.
> > Formats with an alpha channel only support capture, as the ISI ignores
> > alpha bits when reading from memory.
> >
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > @@ -166,6 +166,57 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] =3D {
> >
> > [ ... ]
> >
> > > +	}, {
> > > +		.mbus_code	=3D MEDIA_BUS_FMT_RGB888_1X24,
> > > +		.fourcc		=3D V4L2_PIX_FMT_RGBX32,
> > > +		.type		=3D MXC_ISI_VIDEO_CAP |
> MXC_ISI_VIDEO_M2M_OUT
> > > +				| MXC_ISI_VIDEO_M2M_CAP,
> > > +		.isi_in_format	=3D CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
> >
> > [Severity: High]
> > Does this mapping for V4L2_PIX_FMT_RGBX32 swap the red and blue
> > channels during M2M reads?
> >
> > The newly added V4L2_PIX_FMT_RGBX32 format (memory layout R,G,B,X)
> > maps to
> > CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8 for DMA reads.
> >
> > However, earlier in mxc_isi_formats[], the pre-existing
> > V4L2_PIX_FMT_XBGR32 format (memory layout B,G,R,X) uses this exact same
> configuration:
>=20
>=20
> Is this true?

No, there is patch to fix the earlier incorrect mapping.
https://lore.kernel.org/linux-media/20260720-isi-v2-5-45845bc5d4fa@oss.nxp.=
com/

Best Regards
G.N Zhou

>=20
> Frank
> >
> > 	{
> > 		.mbus_code	=3D MEDIA_BUS_FMT_RGB888_1X24,
> > 		.fourcc		=3D V4L2_PIX_FMT_XBGR32,
> > 		.type		=3D MXC_ISI_VIDEO_CAP |
> MXC_ISI_VIDEO_M2M_OUT
> > 				| MXC_ISI_VIDEO_M2M_CAP,
> > 		.isi_in_format	=3D CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
> >         ...
> > 	}
> >
> > Since these two formats have opposite red and blue channel locations
> > in memory, can the hardware DMA controller correctly interpret both
> > layouts using the identical input format configuration?
> >
> > It looks like this could result in corrupted color conversions for one
> > of these formats during M2M operations.
> >
> > > +		.isi_out_format	=3D CHNL_IMG_CTRL_FORMAT_XBGR888,
> > > +		.mem_planes	=3D 1,
> > > +		.color_planes	=3D 1,
> > > +		.depth		=3D { 32 },
> > > +		.encoding	=3D MXC_ISI_ENC_RGB,
> >
> > [ ... ]
> >
> > --
> > Sashiko AI review *
> > https://sashiko.dev/#/patchset/20260724-isi-v4-0-27df7b5f6060@oss.nxp.
> > com?part=3D3
