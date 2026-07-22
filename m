Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A23E3CA48C;
	Wed, 22 Jul 2026 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704553; cv=fail; b=dKS6l09wz/MiDOC8IEGHv7QT6Kxz+sRlsh8yv1Ia5+SdGTRJRODksffHohOBNM7OXKs6HgvxfUcXvFfjuqRADBNXPH7FzefMyNvETjkRdBM0ETf+WtCUbNJVbXiVbaRk2Zlpyggh5iC/LvKqhJ4cnj+nhtX66jECG1cHk687WT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704553; c=relaxed/simple;
	bh=O+KX7fb/Q/L8RUPrdPEcCtv5yDGoY6upR9qFLZDL9ng=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E/Avpf4sRuuo0feGKbRyrigZ2Vq4VeYMezZoE/zD/TOMV1/7YN80Aw0pNBP1dNdTvxeeooPAKL9Ois9vziyLp0ZA9ArMCW/cx2kzb7yAjytzAP/6HTkooTaQX7UVNbss+F+nLuHM0EELpyxP7ISRpODx4pelHjejR7x6aVTBCOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=G8e9TNCu; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="G8e9TNCu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kyb4RrnuUINiPVTkXrQk84xSpjT+lTXIWbFgNaszFGEOJeg8IbRvpb2nFZqM8OZ5+gHJnGzjFizA+qMQWuhbRfgVch5G399ebNkP5Fqhp3hKUqX1M/hJReoHhNFgB8fbD4ksGV31cd2aJmnfDhyQhCzuctrxqWM/GlATiRgh9V8xWemENZfCKjViOwQpmV1cNEFGOglbHwOYJ0S4DafOjxcGCCODKoVomKD5EzNcm5sxs7H4NUavoDbg6u1SKA7dZM2SVQQOwEAf0Wm3s857D4zmw15r8I8OgAHvCGrxqf15NM1n62DxK+530YWMew0CNVH7HMKkdKsxgED6LZ5gmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZBcwjHq4RwKI/6SqHLRqfcwM66npeSibs1lqg7hStQ=;
 b=GMWTgcrlUOZ68kDeYOmflyG1RNig4ObplDnvT2EwgRhxlp90D4eVHc0feUKCytdIdFw6M5bld7MHogfzWrlETblgDYdHWTLZ6g3B8PwzwDYgggwJFVdbacEoraPLW4eiIdQ/4SxKVkFZiLVwTzTyf7OTZ31sRfstvn5qE/1QePr8QI8Fqa6xxrgBK3+/wncGDmyJi5nLH4vcswErfduyUMShVaDXdfQBW8fVg4Ee+YPz0GHRrE8OTHC3OPplepNzai8v0vvCeD5GSAxiRyTDY99zGUS39yH9vcAed96imPhF8oQjRViXPTyrpKD2ixkc35bM3HLixbP8tLsxAp/pIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZBcwjHq4RwKI/6SqHLRqfcwM66npeSibs1lqg7hStQ=;
 b=G8e9TNCu3P3j32NZ0nXYfPiPnJohnCwqZz2w6+Y/rTHyD3nz69rPRKLaicvChZ37MIg3QbaImlcP37h3s/t4i1UjDf/r/+lnA9yhTxJZo++PvW3VCyPOOemhENUDNWxhBMkkSwq60nsHI+mnogKsWQ56ZsRxM28OU/MsQ7T3fe1fraCXi0rUwHMTN2vXrHkBezgTbq3zGxC15KhkejyxAE1Qt2XU0598FgKhX0GJx1GRPBJZDdwM/oJmJL5HvbnZFiozrb8D6j0CsRxnRF+wJ7M/vGkND9XlOZUJECZWS5SpanMTmEmMYNDyi9z6XXzm+F1kW39X0aesUu5PRLaqlw==
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by AS8PR04MB7894.eurprd04.prod.outlook.com (2603:10a6:20b:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 07:15:47 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 07:15:47 +0000
From: Joseph Guo <qijian.guo@nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>
CC: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"robh@kernel.org" <robh@kernel.org>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 2/2] arm64: dts: freescale: add i.MX952 FRDM
 Board support device tree
Thread-Topic: [EXT] Re: [PATCH 2/2] arm64: dts: freescale: add i.MX952 FRDM
 Board support device tree
Thread-Index: AQHdGBEQXkiNIeaJMUWWJfgjnUz9NLZ1+XWAgAACGgCAAIcogIACoMGg
Date: Wed, 22 Jul 2026 07:15:47 +0000
Message-ID:
 <MRWPR04MB12117DA2847C308FDF2108B7394C12@MRWPR04MB12117.eurprd04.prod.outlook.com>
References: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
 <20260720-imx952_frdm-v1-2-6d145eaaa5c4@nxp.com>
 <20260720065549.C24301F000E9@smtp.kernel.org>
 <56975936-9db1-431d-91a5-c038dc16c196@nxp.com> <al45mQ_okIqpkDW1@SMW015318>
In-Reply-To: <al45mQ_okIqpkDW1@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12117:EE_|AS8PR04MB7894:EE_
x-ms-office365-filtering-correlation-id: a2ab044b-a814-4a70-3531-08dee7c10d9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|4143699003|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 VwZuwezgwPoPl/VmzmWkipWkGiIGhnn/TTAhTRXgV17MZgazNiQkGbxLMDDLwcMf1yAI67bjhZDwaLr1Z6WypKECER+HE9g4zqSG9Wknyw/mE+1yz4vcKrg78wKo/5WJ4gxUtfJBCVPjk4tnOccCzHkjwtarQyerJlph6s0LGUHn0QGsQjQW2S3NjxcYnQCb0KkCWdC8kCoXlACWxXlq/V3ToUv0fr6N0fYAcEdTCyWyKp1Q00TSPHbAhOG2IKrvyaRP9chQACKDRYIgcbwwSK9l7JFzkBfn1V6wGmDLe6K8iPlrs2GnFeN86xiJbc2hnzAdQGQPsEBHuDblpSHVZF6jRVwnLoUJ1g9d51WhzLf4m8VPwpwAiTK4ZDElj7X7LcJ+5ZJuhJ2jlt87jRef7/Up6bNGbuYYlBw+liZRw1eN0stpdh8vY9cceAkqXrz1++N5yp/xqLtg1USE8ughs7e6yliAtFNHDbof1a9sWx6GbQuFd2UXvfXROn7c7YR/SPlw6BTl3ehxnwY6rIU7citbe8IFKh26JTBBo2mW06LTC1D6BXGwWwHWRPZ6QGIDYJxVJu1YLK8MnDAii2QdpGasEaeDj/bu/y24T62vVG+L+hRPbkWImHpFrimfGx9zn1C8MhsxqqsTPhr38uFX7EXjtohSR/pY52gteXP44BM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1uLAfMyyGwWdGoNuTFBzozOvpKmlz+tZG43SfaUppLTWN58jtc5PB9qXQ8yT?=
 =?us-ascii?Q?fypCzstssgrMaCuw73uspH6XtOQPMMx9eS0s/zVTjR6IGwA4FSMdvLvVggOr?=
 =?us-ascii?Q?QHWzWlAcWJiiMNVP4y0I/g8KVOAkJEGEItq4hyMoaFNm1QMuycixF6gktLJn?=
 =?us-ascii?Q?b4zUOzoaIvzdWqO2xnNaugCONLYfrnCioS+HRlzJi0ffK/DSCe1yzijJWnEz?=
 =?us-ascii?Q?0Vpb1rm6irnw7gsZwRBENu0ljkz9cFq07O/uPXE4k5EXVnTOCACH51TujvOV?=
 =?us-ascii?Q?bw0lWg48yLAQd17Po2Du/T0eS44UZk3+Qhtp5akvCreien2C24xXpEw4Yaf7?=
 =?us-ascii?Q?o712+OeS7gsD5vIOq5ezgFsNydSwozhZGA/cfseRomiDySvTdtudgtMrEZ0E?=
 =?us-ascii?Q?UOWzQIo3bJluEXy/hUOdzmAQXLbp+wrwnx2/zUWTuqyLtS3rtu9nUZSVgGTZ?=
 =?us-ascii?Q?PJVdJZW4SwInjEkdzebgHT90WfG37yDanBoRt0ImYH0aMosnCuAA5SJ5ft5G?=
 =?us-ascii?Q?UBUCbxDA3zIbf/CET4474COAcmJbupwIGfSz4AL3mdu+cwpajBDPilygf6t3?=
 =?us-ascii?Q?GHu/RhQ6sU8kUu8zrwuHGmeqa6+5r0HiOJ1fZhZtXX43PgeBlwowgvH/qzA/?=
 =?us-ascii?Q?akOXkaxDyDeY3d00PFqdUj6zKoszXDEj5kN2Ez7DdCe0xAYJGJIpIf1O8dlK?=
 =?us-ascii?Q?Ud81ge/jJxfqpLe5cXenJKPILlE5jLynab2om59cVVhJk1aMc+9Kd6VS1M70?=
 =?us-ascii?Q?T39H4teyGYiU9yxqZfzQ5TlyRlYtOe4gaS01YvJuWFoUMjC9f+Y8jJWgdZVf?=
 =?us-ascii?Q?HaQnxBkEx/BS4GnYppH8xoE2l7SvihHkWHYk9vzm18X2t+kJxWa9GXcZasdv?=
 =?us-ascii?Q?2NtqY3ACTCkBgX0V3RAIH4TahSU8RTCrAcRB+uvJX1pXgUvNutjNYUmqR+f5?=
 =?us-ascii?Q?36ALyoixZIrARwIDyB2U2SGDZjpQJO2ah0JW6ch8cp6hpvDo/Hn0DehLE35j?=
 =?us-ascii?Q?Dptn1i4ZdyFpz3081QnEzl6MBfxp5KjYj/zIwQzXdG+/K2FlKKAsJiBVNDTf?=
 =?us-ascii?Q?rYEpuVd3kNf9EvFdeHEAHPvW1cOts1SlxDUWJvsCz9uHJukg16Vt/GbhNbif?=
 =?us-ascii?Q?cD+4stapG0ciiL0wee+lCK3KM1NMzZ6dhNZ5WOGZqRQS6fsG1SD8qumSBvjJ?=
 =?us-ascii?Q?obEGoC7Dir1o3xlHSQNl4v9WaBMAi7Jt+zgEidQhnpRVtHIP04IEfZjFyULN?=
 =?us-ascii?Q?0oqdoAyX9tESJ6IRPt5EIHeyWznM6K75lRCcG2IAxluPEwkg6fSJSOxPSuYX?=
 =?us-ascii?Q?cXQtOpW0s9XK/taeID7jtjRJCoEaact/6wDebAZfkVcVD+JkOsX2XAhduYb0?=
 =?us-ascii?Q?i//lEZjln6FZ06q2EJj5nx05YYUxvG0tJc7sj3L2KxbSOLsbpMJZn+wabpuS?=
 =?us-ascii?Q?xH0dpRsNEAyFqn9HBqdHFo8dD+uh40YULMrXl2MkS2NXHiHh6YoP8bNAEEFH?=
 =?us-ascii?Q?gIofxwGTIbpe5YMlahhrfwva50RtYRfmkWQ+TT3Rp1caxGotUmlj//adz9DE?=
 =?us-ascii?Q?NwYqGLMgkSED3gby/FL0qUg5780EB5OkpHHq+8n3q/dkuNnMeLOr8hJqqSPX?=
 =?us-ascii?Q?h6eA5WSHucK9yPW2FCwhMmJtA4nvYdQroxBL+7s7TrDy3ivayzByN3snaQMI?=
 =?us-ascii?Q?N96J4j9zrjJGFsrZF4iaNTuyXT8j4s6jQPPj+KkpkF6oTkez?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ab044b-a814-4a70-3531-08dee7c10d9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 07:15:47.3216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0b2e1vjTTHqYrr3RfZT+B0Ugv85tVad9T4+58euhZqp2rk+6mtPLqHSyBQs4Iceqw0J1JhgWq0ME6FLz6AyPJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7894



>=20
> On Mon, Jul 20, 2026 at 03:03:20PM +0800, Joseph Guo wrote:
> > On 7/20/2026 2:55 PM, sashiko-bot@kernel.org wrote:
> > > [You don't often get email from sashiko-bot@kernel.org. Learn why
> > > this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > Caution: This is an external email. Please take care when clicking
> > > links or opening attachments. When in doubt, report the message
> > > using the 'Report this email' button
> > >
> > >
> > > Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> > > - [High] Shared GPIO requested exclusively by two CAN transceivers
> causes probe failure for the second transceiver.
> > > - [Low] Use of undocumented, downstream-only device tree property
> `fsl,cd-gpio-wakeup-disable`.
> > > --
> > >
> > > --- Patch [2]: [PATCH 2/2] arm64: dts: freescale: add i.MX952 FRDM
> > > Board support device tree --- commit
> > > 8bbcb28d08a05e0f4c57023333492b4e023f7caf
> > > Author: Joseph Guo <qijian.guo@nxp.com>
> > >
> > > arm64: dts: freescale: add i.MX952 FRDM Board support device tree
> > >
> > > Add basic device tree support for i.MX952 FRDM Board. The
> > > board-common hardware description is placed in imx952-frdm.dtsi so
> > > that it can be shared with future i.MX952-based FRDM derivative board=
s.
> > >
> > >> diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> > >> b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> > >> new file mode 100644
> > >> index 0000000000000..b9ef6bec2bd5a
> > >> --- /dev/null
> > >> +++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> > >> @@ -0,0 +1,727 @@
> > > [ ... ]
> > >> +     flexcan2_phy: can-phy0 {
> > >> +             compatible =3D "nxp,tja1051";
> > >> +             #phy-cells =3D <0>;
> > >> +             max-bitrate =3D <8000000>;
> > >> +             silent-gpios =3D <&pcal6416 6 GPIO_ACTIVE_HIGH>;
> > >> +     };
> > >> +
> > >> +     flexcan3_phy: can-phy1 {
> > >> +             compatible =3D "nxp,tja1051";
> > >> +             #phy-cells =3D <0>;
> > >> +             max-bitrate =3D <8000000>;
> > >> +             silent-gpios =3D <&pcal6416 6 GPIO_ACTIVE_HIGH>;
> > >
> > > [Severity: High]
> > > Does this cause a probe failure for the second transceiver?
> > >
> > > The first PHY node successfully requests this GPIO line, taking
> > > exclusive ownership. Because the phy-can-transceiver driver uses
> > > standard exclusive requests (without
> GPIOD_FLAGS_BIT_NONEXCLUSIVE),
> > > the second request for the exact same GPIO line fails with -EBUSY.
> > >
> > > This prevents the flexcan3_phy and the flexcan3 controller from
> > > probing and functioning.
> > >
> >
> > This two CAN PHY did share same pin as their silent-gpio on hardware.
>=20
> Hardware share gpio, but driver may not handle this case. Are you sure
>=20
> flexcan3_phy probed if can-phy0 already probed?
>=20
> Frank
>=20
Hi Frank,

root@imx952-15x15-lpddr5-frdm:~# ls /sys/bus/platform/drivers/flexcan/
421d0000.can  42220000.can  bind  module  uevent  unbind
root@imx952-15x15-lpddr5-frdm:~# ls /sys/bus/platform/drivers/can-transceiv=
er-phy/
bind  can-phy0  can-phy1  module  uevent  unbind

From the log I think both can-phy probe successfully.

Regards,
Joseph

> >
> > The same design on i.MX95 15x15 FRDM. This should be fine.
> >
> > Regards,
> > Joseph
> >
> > >> +     };
> > > [ ... ]
> > >> +&usdhc2 {
> > >> +     bus-width =3D <4>;
> > >> +     cd-gpios =3D <&gpio3 0 GPIO_ACTIVE_LOW>;
> > >> +     pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > >> +     pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>=
;
> > >> +     pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>=
;
> > >> +     pinctrl-3 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > >> +     pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "=
sleep";
> > >> +     vmmc-supply =3D <&reg_usdhc2_vmmc>;
> > >> +     fsl,cd-gpio-wakeup-disable;
> > >
> > > [Severity: Low]
> > > Is this out-of-tree vendor property invalid in the upstream kernel?
> > >
> > > The property fsl,cd-gpio-wakeup-disable does not exist in any
> > > upstream device tree bindings (such as fsl-imx-esdhc.yaml) and is
> > > not handled by any driver code in the upstream Linux tree. This acts
> > > as dead code and will trigger `make dtbs_check` validation warnings.
> > >
> > >> +     status =3D "okay";
> > >> +};
> > >
> > > --
> > > Sashiko AI review *
> > > https://sashiko.dev/#/patchset/20260720-imx952_frdm-v1-0-
> 6d145eaaa5c
> > > 4@nxp.com?part=3D2
> >
> > --
> > Best Regards,
> > Joseph
