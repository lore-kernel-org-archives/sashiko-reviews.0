Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04ED32F76D;
	Sat, 15 Aug 2026 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786786809; cv=fail; b=ePB3s+oe13AJZQs3/gE92YTWScujS31Hh7FAI6i9O216QgWVkvht+wW1f3bl+NU97Bg1aaQBtDEcoqzOMbhQswKgC6eoTWksmgNpQmyhVJgDU9a8Ybt4pGvjwE47FMUuZT8hxkjMgY6xD8Pm4EgHZtaytaY0jxm9WwsIhDohKHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786786809; c=relaxed/simple;
	bh=zKu5tBshUtNwQFn5ka1VbjCFZ2tQGCTq+daS3gNj8mE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rc+AdUzPv8Pwg/lfMoyphK5xfcwkx9x2qGIdblKkhNjCFmYNV5V6JcrIUu5GbALtKkJwRA4yx+Gj2soQWvyFmNgYCYiB9fYu2DOVElZy8Id63A5Kw9lhEwY8WMa5cEO8us7Rnr16qUX8xQ96G/kSIwiyjQN7LgLw+4iwfegnJT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DuBZ9MpB; arc=fail smtp.client-ip=40.107.162.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DuBZ9MpB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtGhtFImKzeVBula6bz+jF7f8kyVrT6q2Uep6a2AZLSSnCDvx1YPf8ZGqK+xGRcIvPX+3+rvz47BLRyLWaU8H5qVoLHjWCF2IDHkAuX+2q/C4QWrl/0HTU2s1xC/Z6KjvaIJp4+NN41idbh0132mKf/YpoWHXm7BpqqDmsVnqXQLXFrcFi4XmRYoY9MgPUH43lT6qSdsaaO56vES/FztVvRe45VPBkbuj8QpqmyByY7eG3+MaQAsTgXNMNSvKTn1GjKNppWCdAML2Sj9D5v2qez+HCKA5RI2cVaz2biLeYOiQ0F9L4KqjAGvhTds8r3gL7iWAwFOaSJi+cSvn59F8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biRViJa2/QQdgFovqTaav3jn9g/pxQb1U8VrVytzwG8=;
 b=i47hrChEmVqlgE1nWTEXL4vb6gnD7bWNwX4LP89+WouTvZsoj+Cv5w01oLWvvFZTfCQSQgxoGWlR4TL0DdXi4AHhl+q9AdW6kijTjPZHvreViv6w7OJ6OBcbowCgZbuSqA6+EHnHBf9PxfQHo1Y3Mvf/b7jjBgFsUD/jtcqdbi6Q/rqEu6fQcshEvYORNnOBQCke5BkeTzCIY6iusMFTRDpdOv0xcpmXpqSNSYM9zuOzu66K7kcnQj4wxd+SAnns37mYVBZ2ZNvcpzFSFtBOsdu2y3Mq36gDnaUOMJXwDRPCQdkByCp50V4P6pgpf2tvO3z4QhPbncFeTZe67UtZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biRViJa2/QQdgFovqTaav3jn9g/pxQb1U8VrVytzwG8=;
 b=DuBZ9MpBZsA0g2VVBTnsGYAC/DHvGueDxeL719xcZ+oZ3o8P1i6E8UwvzlOxWPtFVdJcXFk+RjcdgOOclLRgf6CwsYLpOQLZB/dRpwzbOJiuD4u8MUwxf3vxaKLXRyFUR6HTExulF9Tu/zxsP+k+mzyA8SQvV3VNEKHOHS7rEjMGkfDjSg/k3Q8l7RhsRLKK2XAeubIvqaLZnexEu1BT1PcYkMBMKR81WO4iy0U5U4b7PjrNX3seufN5PSMZYwO8NxiJ0l9apGGYttmvJi7swRc2aFi8XWMlrsz8aStssSCkw7TBXo5N+FkpBFtlrvTaSkBrQ/jlYEaVCVe7QXpDrA==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PA1PR04MB10913.eurprd04.prod.outlook.com (2603:10a6:102:484::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Sat, 15 Aug
 2026 09:39:59 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%3]) with mapi id 15.21.0315.014; Sat, 15 Aug 2026
 09:39:59 +0000
From: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>
Subject: RE: [PATCH 07/17] arm64: dts: imx93-14x14-evk: Add pinmux and mark
 conflicting devices for MQS1
Thread-Topic: [PATCH 07/17] arm64: dts: imx93-14x14-evk: Add pinmux and mark
 conflicting devices for MQS1
Thread-Index: AQHdK72BovfNpqtxs0e3cRohfBm7obadJtcAgACT5oCAASGZcA==
Date: Sat, 15 Aug 2026 09:39:59 +0000
Message-ID:
 <AM9PR04MB83536B482CE48E651905D968E3D92@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
 <20260814072022.4064009-8-chancel.liu@oss.nxp.com>
 <20260814073317.E8A691F00A3E@smtp.kernel.org> <an9AyQbX8PCl0Cbq@SMW015318>
In-Reply-To: <an9AyQbX8PCl0Cbq@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-15T09:39:03.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|PA1PR04MB10913:EE_
x-ms-office365-filtering-correlation-id: 633bf2d7-5dfd-4b5c-f5a6-08defab12c80
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|38070700021|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 HKfP92W8XZGgogKoFrWQg4R9MQmxH8eUHvyzsY0UPDeiUMb3pX0kuGpXb7MzEXgPHonBHkbj3dqEeoHsxrvn7NFWKsWuLYKZ7dw751ME3EFyOkR0Jc6iNHNpM7cABjt+R2K0c8PlusjLc++u4dR+FdF9UmI5YAF0ibNBvibrxI70myg8PX/qrKPuX+4vniXifBheZuaA9KkQHf3zxeo2f++G1pv7InUZ7fsjHBTFJrWzqhMqfuv/z8CpE4W7LJkWM0esDFg3p822ySZYB0Ju5I6P++ecxlGHnZ9LnSKU1b8uYXX/Ky+mg3OHTgztrrRwh40v+SgeAQjb47WXGrc9nUOscMiwRB4BhWOR07t7bXZAIknRkB6m6SCeu8sflkzYKho/uS5Jqp5E1nvaOCSuUttxXaEkZXyMm82q7kdzvussxZZLwVFURkeDGFEpDxV1S4iLJfopwvJ2HApYNX2uPxLZ0SO0tzrkLW+RQY1GfQJx8lVaaBoV8CuFA2Gta5U54vGnbb67xGGrM/aTr6LUIbmFuEJvrAsmXUwQc6njOhxA0qWPiSWtj2X8U1t751wm0aH/CdTlJjYNXvhFyauz+xO2cBzmtq1Q5yOcUeSTO8Sn9c4BH+ryfDQUo3cK47xEtvb9Cn0WW/DaXF2sO+1Dp4SlWkxmOK3dQw21R7Czi9U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zqHoRLEkBP/OCUO+KGRDZ9+jdkRwf1L9QVh9JNnKCv3+sTo8fJYrCK0vnXHv?=
 =?us-ascii?Q?kpL5HFILresU3JA/1pRvf6OAc8xa6ppwSGhka8Nr80HX9NoWqgWRrFG8oEiV?=
 =?us-ascii?Q?jRnIZ2oJnw0rWVJlS/XdtaxHQ3ThnQGU/ZMZ5gutQK5oGIOi5yxcwspkTY5V?=
 =?us-ascii?Q?4BhnIEoTR2xaNfT0ldu+g1P2xLATFZbyxCShtnOzqpdqGJ37v9Rio2GKz3WN?=
 =?us-ascii?Q?sesILx+rDX9UGpl+S2H808R33hTc2xGrj8OpcWlnfompS+aLe0/5cYOGxbXB?=
 =?us-ascii?Q?h6v4AKO0W1AEk0zPLDhildXBykt+r6Fo65/Ckw5SL2QZdY0pGtxN1x/CjmrO?=
 =?us-ascii?Q?1lst3dQJVMyUuimb/JbS252Igf0ra58oYtIIKI8c/Zwycb9IYrdx/YtfKNN2?=
 =?us-ascii?Q?ufAXmI0SvR8CtSeMtDKgzlpHz3pC/s5N1oVhb1t2xB/qSdvSHvYxr6NJnxov?=
 =?us-ascii?Q?HBggHmwoGVNdarG8dCOfcCrwR6be3R2gGnt/f7OZU1XJCLSKPADYs6iHIOwY?=
 =?us-ascii?Q?uFK3j43RbYY91iE2p3gFZRCBRLfcE6jsgINqKFejFRppXZA9MGhgnv5wVyTH?=
 =?us-ascii?Q?NnA9aNiYJiUHZh0BnL5NxvbdzsxVYXuLxHA4LAA4MA6F90xF9En4yrVfIadn?=
 =?us-ascii?Q?VW2cIdoSaX9XPs1m7ZPCSPmRQEcKUFbM3Rmts4K7QTZVumGsSPxMrQwq/4Qi?=
 =?us-ascii?Q?ru5SSLOvV5xcTJeiycoXV6Jj853aU0IogB1GO2Jj8anY+L/4d7e8698PSOQV?=
 =?us-ascii?Q?X+Lftz0g+MlywetbK1HLzNPA3Rd0jH+i3eoTtMzCxOOjk9IRdjbL9v7b8fej?=
 =?us-ascii?Q?2+3Lu43IqOy+lenYwDr/Z+onXjwsyp3o0SQehKgsiG7HfhOkTiZ5N9ZiA3KZ?=
 =?us-ascii?Q?qzkH7w+cRftaOGzMfv4v5kjOTQ7mn6hn3qD4FW1W3ytEepv1FsbToPDWyRQQ?=
 =?us-ascii?Q?QMCGuArYyISXGYAOg3nSfmPDs2tbW2jKtnnhujmuLOM+Mt2estmyDNFHmRPb?=
 =?us-ascii?Q?cpyUMbxrTMnQwg3DjTXRa/L30Yavd+dgCBqY4U2fY9mGYqIz9vY7wa5bE074?=
 =?us-ascii?Q?r5nmBptEEQBVopN/FeTjsSiXTyIEMveVukCw4yNax/BAK0bMIDaE7LokXjDs?=
 =?us-ascii?Q?t8RM/M1uW91pssaat3SrXSDewcro64NRwor79TDE0RcuWA5mlC+vcylyHFpZ?=
 =?us-ascii?Q?QLCRm9xJMFEJETXmmqMetmM63a/vb1QH/vyhZlAgWC3pgGZmZV8KX0WXMBKU?=
 =?us-ascii?Q?hU23AXfeUcpYpVzvz6s2LiRDzTRfGQYcU0jP7YegFcL+VqrQIRBvWqrRDd+j?=
 =?us-ascii?Q?BOpqbRDLC0O+mHySFLuTVGYCdp8MTNvPmLRox+BFFO86khrB5/O93DqdPjSE?=
 =?us-ascii?Q?kn+kjfZ32wmnZX6H2yBTN6br1lyrir9XonDnh2kWAhvDF9Fa3q4JA3vUkhrE?=
 =?us-ascii?Q?dt+4eMfjnO+Ax5iJw/7QgEhtPgI9O15XvrDpZhsLQNif9Q4paucZNF1aIf2u?=
 =?us-ascii?Q?HYb7Kt/00q93GkYXAqKIs6g+4lHJp3qKSxRryP6gdfUAd/kSZwE56gY8Doth?=
 =?us-ascii?Q?82Ci2iRX841x8lRrPV5u+Z2/u/mSTxrCzYb0grMEBUtcOnzcUD4tGgGi6b80?=
 =?us-ascii?Q?uM7IKfnkOFwV7nXxYeO3Ox2MHgundpk2C37ZeeqmN3p+Pgbx5PGWg3j5JF+J?=
 =?us-ascii?Q?txB9xwrzCogNk7PRXs+R9Jd9Uv79aBHDUXFhEQqO3LO0Po/K?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633bf2d7-5dfd-4b5c-f5a6-08defab12c80
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2026 09:39:59.5101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Odd969w2nwl/8PVsxWqY55MLGPPQEX0hNKjNVh3QOYKl7jV5dKhQ+WPB5zVafRJ9wAcqb3qpYnGPF9K4jGi+4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10913

> > Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> > - [Medium] The `&flexcan1` node is missing the `<&can1_fun>` pinctrl
> state to claim the board multiplexer, potentially leaving the physical
> pins disconnected from the CAN transceiver.
> > --
> >
> > --- Patch [7]: [PATCH 07/17] arm64: dts: imx93-14x14-evk: Add pinmux
> > and mark conflicting devices for MQS1 --- commit
> > dcb616d828fd4526406432c88e7ade3c33414225
> > Author: Chancel Liu <chancel.liu@nxp.com>
> >
> > arm64: dts: imx93-14x14-evk: Add pinmux and mark conflicting devices
> > for MQS1
> >
> > This commit adds the MQS1 pinctrl group and labels conflicting devices
> > (BT SCO card and FlexCAN1) so they can be disabled by a shared overlay.
> >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> > > b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> > > index 502237fab3324..11bb7e52fbb1e 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> >
> > [ ... ]
> >
> > > @@ -282,7 +282,7 @@ ethphy2: ethernet-phy@2 {
> > >   };
> > >  };
> > >
> > > -&flexcan1 {
> > > +mqs1_conflict_dev: &flexcan1 {
> > >   pinctrl-names =3D "default";
> > >   pinctrl-0 =3D <&pinctrl_flexcan1>;
> >
> > [Severity: Medium]
> > Is the &can1_fun pinctrl state missing from the pinctrl-0 list here?
> >
> > If the MQS1 overlay is applied (setting the mux to state 1) and later
> > reverted, or if the hardware boots with the multiplexer GPIO high,
> > flexcan1 will become active but will fail to assert mux state 0.
> >
> > Without the &can1_fun reference to claim the board multiplexer, the
> > physical pins may remain disconnected from the CAN transceiver,
> > causing it to silently fail to communicate on the bus.
>
> Make sense.
>
> Frank
>

Yes, &can1_fun should be referenced in CAN1 node.

Regards,
Chancel Liu

> >
> > >   xceiver-supply =3D <&reg_can1_stby>;
> > >   status =3D "okay";
> > >  };
> >
> > --
> > Sashiko AI review *
> > https://sashiko.dev/#/patchset/20260814072022.4064009-1-chancel.liu@os
> > s.nxp.com?part=3D7

NXP Confidential
