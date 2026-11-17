Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794906494;
	b=hkE7fgW0k/nTBEcRR6UKuDcMt16oLZCDqV7NN7r+WKSdxywy+SUMEZ6fKlUTNhVRr9zF
	 ilQemmTYqS6jHPegYUv+Qxo8WDutaMQ1LpkOrhvdkjByd9Nn5F0SxNulImWEZS2tr6vV8
	 tjYc0+BkFTarr9uQXbfHLcnBxum3BE687dy81fn/9z40/NRGwqucY0ciaNzmXIXkg0fRV
	 wm5OGMgpJrVG1Z1KdokDNVY1IeJUYmUnkc6X2Ph+CIQpZIpVRE+5plT7dxhDfsfGCwBKQ
	 7N89tQ/46lKR4NXcmwhRr2d245NbP8wdoV2OPVC78M3pYUvOVnOjnQCVzm7U/2kBgwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906494;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=iIpYJPZimjQTGw3I5irovopL5vVDDsAT1H6lBRv7VCE=;
	b=1Pb5+i+yxAV60r0ivFyxn8hjdEUE2xinn4mwUpLvvjfNrk4bBNHQM+RkvLD8U+Te/1k3
	 JLZnpZSohH6qcCBj54mpyzkxw2I3D7M6MLhsaDGFI9nUAP8Sv0rVLjVYuSL7kebsXy9pc
	 hFuq/wL/oTNY3PiF/KyV5ih3TnZsFK+aUaq4dMoSFdGa7CAEomNQQGFpyVlviuuO6FCOA
	 FXiLVEg5I8YvvzLDGXwSnd4GliJgvYOAnp1nVnNXTIjtDOwIydJDl1q0Se1yu9Gjzixg1
	 4KB3WytNDMEIKTzN+xg3ZtV5FWt7G8Dw1LZhgyf5/sX2PxKsozJYyAIeWm4q5/KMyZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=iKOlTySB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.58
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013058.outbound.protection.outlook.com [40.107.162.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDBF606A329;
	Tue, 17 Nov 2026 09:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BDBF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=iKOlTySB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKdM2V7waAJT4jRjveQpxiuktwi/9b0NUDYrn5xiOh7M3XhmJb+C/OBZqMdMHMXWp1XBhH0CdUF7U8LvERluXEN3zo6NYQIndUwxdHwH0NYcHxYyDViX0ZO2tVGV2kdiPGNktPEDkXvfGNhupphOZe7C40A7wVduORSiDyY+ktmwXsieVcYim40jc9lFFZXX3otRnnXiAP45mKJBQH3QNd3yOySceynNta/JHMud/Zx0tJbsK80m42Y0UdoXjoA3Hec/q68mgIdWUoTaaQUDEvZTvMdDlhQ9tzpohVO2hXN0rJAH4UonykDMoaBJqLeRDFEeKO/GOpYkCYBYKKMoNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIpYJPZimjQTGw3I5irovopL5vVDDsAT1H6lBRv7VCE=;
 b=rSa6a0HRvAjIkfm7D2Wt9N9OnakuceJnIJABqznapiB6cvguiCc179iIRqBjTpMAZlZhCyLNfNDxgCV1xYhFB+vUKC+Sbtb5ousTlgqjFAkSQB45bUK/zLMpdGACmUFQ7khAisS2rc5eHKJzV/mXZ8oWV2Mh8Nf9MaaXOAkSZzt1MqbH8jH0ERXBtovCLAaGTNoye2e3XvfvHCbOi2pIMoZvVC9Nb6TLi2fFXLWyoUtfh11LbdkEd55QB8AaWDGLuEOjtLz8gphSuxH1Y6uv15L17Mv+Awq3Ps0S2P0lUJFsv3MLDHC4HMv6VoK/PfI2qWWJ/CJP2cmzXXCIkPI3cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIpYJPZimjQTGw3I5irovopL5vVDDsAT1H6lBRv7VCE=;
 b=iKOlTySBwPQcMMeliGxNYoED5CRuNU4Wl0lKLoQjjwuDPzxqs4y5u1f4+MHXfQ7AJoQxqfmnpVlQU9epF0AyR9a+4+67tKz2hsuO4rn1SdvpGQPAItIdRkZCZLJO4Izoiw6w1DUnerURWm8oEpZ5WAKWTV1qchk1NN+dcUqZWtICC+aREEjxuAvH8HIrneG2Raff2LTQN8d0Rxy7ha0OIvO92H7iFunFujkwWv5dhYmzQ9HGcfX7NJDzR1GPPz+Xcnrs2AA2wKbEnxFXHVx4BC/r/d13HeGemiB61mJOq6XxBglHiQ/pvk2U7CPw9lf98u0T7biw2rNYsj+d6ZeKhg==
Received: from GV2PR04MB11740.eurprd04.prod.outlook.com
 (2603:10a6:150:2cd::13) by AM9PR04MB8381.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 09:08:11 +0000
Received: from GV2PR04MB11740.eurprd04.prod.outlook.com
 ([fe80::ca5f:7e1c:a67a:a490]) by GV2PR04MB11740.eurprd04.prod.outlook.com
 ([fe80::ca5f:7e1c:a67a:a490%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 09:08:11 +0000
From: Claudiu Manoil <claudiu.manoil@nxp.com>
To: Russell King <linux@armlinux.org.uk>, "andrew@lunn.ch" <andrew@lunn.ch>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, Jakub Kicinski
	<kuba@kernel.org>, Simon Horman <horms@kernel.org>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
Subject: RE: [PATCH net-next v4 1/6] net: enetc: Add pseudo-MAC support for
 ENETCv4 Ports via a fixed-link node
Thread-Topic: [PATCH net-next v4 1/6] net: enetc: Add pseudo-MAC support for
 ENETCv4 Ports via a fixed-link node
Thread-Index: AQHdc4nYhJFH1dmVTk6cQvCCjjel0rctr1QAgAQ9z8A=
Date: Tue, 17 Nov 2026 09:08:11 +0000
Message-ID:
 <GV2PR04MB11740CF1755A54ECCB6075434967B2@GV2PR04MB11740.eurprd04.prod.outlook.com>
References: <cover.1794581338.git.claudiu.manoil@nxp.com>
 <4f51bfd237fa584c7d9187d7b82f36e261853ea3.1794581338.git.claudiu.manoil@nxp.com>
 <sashiko-outbox-214685@kernel.org>
In-Reply-To: <sashiko-outbox-214685@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB11740:EE_|AM9PR04MB8381:EE_
x-ms-office365-filtering-correlation-id: e536ee52-fb55-4360-ab80-08df448a4dc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|7416014|38070700021|10067099003|11063799006|260925021311599003|260925021911599003|56012099006|260925022911599003|4143699003|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261022113327099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 59+RAJjxLiUuiHpX+OgoFQL6qGoEZWo2hPAecDUOV5P5v69W9TuSjvZ1VjelQb27Q+igzC8XYg/7LyieoyHpxFAkq+bg+wpaWkzb3VnXveNXVCQWxVc4h9AP+hOkSpgCCY8wNBefheLw8BlyW4bEskr92Ywp5br87UGu5v2/WdPprtNJD6My/F0gGOUlvYFwaAvDzm7L7Ifz9B40Qsi+gaJvhMW6IQtL4JJpnwXwBm//KFFtqv2afkkpbRYGAXO+czEKBRAhMasvoP1kzCN+gjFBSGuW4Iy+RiGshqWqiYFrGZcMuLQMPVsbtOL8GSZL5CabYRPz4U8EqVvB4ubugoxUhX5Eq1p3QL0BWlAZo9qbVOITgRmtx1zVvkjPV46lxCWia/mpZB+AzInRVcC1dbZQUTVJ2KqfgFQgQQbRUyZMB83l5C87bJ4zUSkQ2VgtzNch9O9ry58Z+G1kVb7h70aEaOFa4d3da8ABQGPwZgvpkC1KSwcauTzF9hmF2tISBz/25SSWCL8Y+dyYC55NEHaBZhj6sZ+4Pt2XX2I/kY42ckQEaahdwI2wu0gd5y1ct2NKY/xgcTutnJqCAZnkhdG/5/JGyF83Lu7GXRv939EqTEa5mXXlEfK0IzADTH5xBO4ZdFrKzZGP/DEc/uFcMwLgoJtLddGVq584pmxLDi8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11740.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(7416014)(38070700021)(10067099003)(11063799006)(260925021311599003)(260925021911599003)(56012099006)(260925022911599003)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261022113327099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?t5FM3+vBAB9GsCp0n5hV5Bz9omzptI1lnwpfCAdOpZeWDLhfN12xyLgJ0I6W?=
 =?us-ascii?Q?n0cgaYGZEXeCd6bwAWuDUHdPY6C94wPw0Iyh7peQq9LJNBBr/H5cTVvvBB4Q?=
 =?us-ascii?Q?2Gmp9n6dCD5ZG+FK7KQ+21s7cUKshZ7MSEO3AlNEXoFpXU2GDBpXDBxj+b+r?=
 =?us-ascii?Q?REpYi0S/ozclEFoDpwzSZAx1FjTNTnodnL4yUqJ9vM9tf2vqHYbjx81/L7q0?=
 =?us-ascii?Q?dPqJVyFCyoe+hHtFyRc3M1jkthf/ygQM/IBG7p0tZJ9YUy9HrQVcvln5m1PG?=
 =?us-ascii?Q?J5tWpgBa2MSXTvTnvD0yTSmRV8vNI9skZdRIXtFTAiCxI7PbLSGV0po/DFxw?=
 =?us-ascii?Q?s8C/0u/H+REvWq881HIyu2clwfXDerRRz/XFof3Dr1fBwoVBoJzWsaJCQwQa?=
 =?us-ascii?Q?RKtGKANDLfq1S9cYVLsiJzptjmdBAdtdx5h8KXoFgwGB8FliwO1oxRjNDyre?=
 =?us-ascii?Q?iuwWujkRSBUa/iY1ZZp41a5ccR0WlQ8KFGd37C6FT9se77gaGYmhc8YLqpW9?=
 =?us-ascii?Q?hgev+F1/KINbZ6KI8OKmxnmsYJvR3BvdGneGP7wZLt4TbDR4cXx5BOH8ez4H?=
 =?us-ascii?Q?CuAubySX9i1E4Li2LETyHQyP7PcpbUzutL6uj4pCsVz215nsGkNq3btYTUuA?=
 =?us-ascii?Q?W3oPzQB3D5f9mFTOaIYns//qJdlkOw7BzKbkNR2+esjmKaaKbTGBDBX+d2zo?=
 =?us-ascii?Q?+jD4OKtmgMJSx9A8ML5A0Oi5N9TLbB0IFAVHxDm37M/11KNxymDjGuHhnL3T?=
 =?us-ascii?Q?spsxKqFDOqSwrqEolHbfXtRETjyLhC2Hl4uyG/gL8gHT3DedDQUZWvkH7UC8?=
 =?us-ascii?Q?etHYM+B5bJlNTEpyPrqJ2Zmml1NJPdcXEiMMTIOvEwDo6SIdyZD2aAKNi59z?=
 =?us-ascii?Q?FbXgzSbbLOvo5wC6F4hDAPqwpyM3IDan9jTLzYJsD/QYWwziy2QxSDpWQWHg?=
 =?us-ascii?Q?3FQTZKNznU/2vZw48ByN1I3o6hxxBJ+clC0F5B0hBfM/eJ8yTQPijhzMxUvm?=
 =?us-ascii?Q?DLLlapf+rT0BjAnBXhXAyv2abbaNm+bPMlrHK9NB8w4diUBhGQN/j4ow0Mqm?=
 =?us-ascii?Q?TWTTr7l8jBaaUie952TZRt4ob0UM2OCE3gpjVPRRJf2ImUUUc731UfZjwpxV?=
 =?us-ascii?Q?kDyfLZwMfC2cm6Nyn/RM544wPbOHxlfUd2wdHN/wH4Wu1nlei8dpPp1Dxasx?=
 =?us-ascii?Q?euX6aAtOrsQrGnF1yfAYg+E9L5mHmkbr07onmiLbLsSNIkIc378JBMr4mlq8?=
 =?us-ascii?Q?YJRd3UPAd6OY1HRmzZ/VFvwM0leIZ8i81Cc90v4X8/L6vNPsrqzcz1mdVC+x?=
 =?us-ascii?Q?Zol02nJXa7UhCqDSFs5BnlFfzMqUPUMvWS6FE6cRgITTke1c3PS6h1gN7yY6?=
 =?us-ascii?Q?FRvRtcdMB5193LPyekhutjLk/3wfGOSF2n4qxSFMri3v236+Vgd4Bd78AcTl?=
 =?us-ascii?Q?D0FFskHNFSFHiAMwVA6f7/HoMWYUxTiK0jbhGNOIze5hYVmH9OdR4vN5V3GO?=
 =?us-ascii?Q?6omSDHK4vw4f6kFCvtW1SD5hPAqnOQmahJA4b/VPEO6/RAZgLfB/xPRG888U?=
 =?us-ascii?Q?qG8jthpD2OB+pohLS69nk/StvnK8w31vXxSlDEOcju56O5kgoZcDSx/L0efu?=
 =?us-ascii?Q?RYHfYMHZiYDKmfUt+wKWPIHdfFhPfGyZUc3hyhATdcnXoLSzwnyWXVIT1aKt?=
 =?us-ascii?Q?PHfvEPG0yp8WWLrKXCJJyoxJyloMRwb6SlowEsNeXnczvzdEbOLmvizKKcNY?=
 =?us-ascii?Q?cyGBfODe4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11740.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e536ee52-fb55-4360-ab80-08df448a4dc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 09:08:11.0428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zrqa/CM1ogvVoWKeEmzkp9VxTq+psviQhD8H+UIxV6gIujR4BHVCdcIpCM8Kn4TkexEHE0jbE8JgtN0nbmhnjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8381

From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
Sent: Saturday, November 14, 2026 5:17 PM
> To: Claudiu Manoil <claudiu.manoil@nxp.com>
> Cc: imx@lists.linux.dev; devicetree@vger.kernel.org; robh@kernel.org;
> conor+dt@kernel.org; Frank.Li@kernel.org
> Subject: Re: [PATCH net-next v4 1/6] net: enetc: Add pseudo-MAC support f=
or
> ENETCv4 Ports via a fixed-link node
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] net: enetc: enetc_phylink_match_pseudo_mac_speed() returns
>   >10G fixed-link
> --
>=20
> commit 15e36db0338302292004a6cbf3727d8f9d63565f
> Author: Claudiu Manoil <claudiu.manoil@nxp.com>
>=20
> net: enetc: Add pseudo-MAC support for ENETCv4 Ports via a fixed-link nod=
e
>=20
> This commit adds pseudo-MAC support for ENETCv4 ports lacking static DT
> nodes by synthesizing a fixed-link DT subnode at probe time with the spee=
d
> derived from PCR[PSPEED].
>=20
> > diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> > index 8facc8bf8693a..b032b586f07b4 100644
> > --- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> > +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
>=20
[...]
> [Severity: Medium]
> Can phylink_parse_fixedlink() handle SPEED_20000 or SPEED_25000 when
> enetc4_add_ppm_fixed_link() writes the result of
> enetc_phylink_match_pseudo_mac_speed() into the fixed-link DT node?
>=20
> When PCR[PSPEED] is configured for 20 Gbps or 25 Gbps at boot,
> enetc_phylink_match_pseudo_mac_speed() returns 20000 or 25000, but
> phylink_fill_fixedlink_supported() only populates linkmodes up to
> 10000baseT_Full:
>=20
> drivers/net/phy/phylink.c:phylink_fill_fixedlink_supported() {
>     ...
> 	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
> supported);
> 	linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT,
> supported);
> 	linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT,
> supported);
> }
>=20
> As a result, phy_caps_lookup() in phylink_parse_fixedlink() returns NULL,
> triggering a phylink warning ("fixed link full duplex 20000Mbps not
> recognised") and leaving pl->supported, pl->link_config.advertising, and
> pl->link_config.lp_advertising with no speed linkmode bits set.
>=20
> --

Hello,

This remains the only outstanding issue for this series introducing S32N79 =
support [1],
and I would prefer not to address this in this series, for two reasons:

1. It is not specific to the ENETC pseudo-MAC support. The ENETC driver
   already advertises MAC_20000FD and MAC_25000FD for pseudo-MAC ports
   (see 7c9a6ae0edb2 "net: enetc: differentiate phylink capabilities
   for pseudo-MAC and standalone MAC"), so this series does not
   introduce the situation. It only makes it reachable through a
   fixed-link node, which is the same mechanism any other fixed-link
   MAC would use for these speeds.

2. The limit sits in generic code and in the binding, not in this
   driver. Besides phylink's supported mask, the "speed" property of
   fixed-link in
   Documentation/devicetree/bindings/net/ethernet-controller.yaml is
   also restricted to 10, 100, 1000, 2500, 5000 and 10000. Limiting
   fixed links to 10G looks arbitrary to me given that 20G and 25G are
   standard speeds and are already handled by phylink's capability and
   phy_caps tables for non-fixed-link MACs.

Extending fixed-link to 20G and 25G therefore touches phylink and the
DT binding. I think it deserves its own series, where it can be reviewed on
its own merits by the phylink and DT maintainers, rather than being bundled
with S32N79 enablement.

This is the only outstanding issue I am aware of for this series. I'm open =
to
send the phylink and binding change as a separate follow-up once we agree
on the approach, if no one else wants to do it.

Does that approach work for you?

Regards
Claudiu

[1] https://lore.kernel.org/netdev/cover.1794581338.git.claudiu.manoil@nxp.=
com
