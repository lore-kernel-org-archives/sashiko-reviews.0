Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013000.outbound.protection.outlook.com [52.101.72.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F7F3B777C;
	Wed, 27 May 2026 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877948; cv=fail; b=PMhvUEm5oiRB/H9Rb8tcb3a3Ozs8243qqnPgxKvxOpUQC9enQXBnP7UTXwrPs/WQ0RUFE1oieqUn7FsZ4aCopXBQx7vMzS6tTXQTtyA/J/OEUYD7uZ0lsDYh7mzGZFdQz1AcAQsDp/vhSBuCivC4xZ0Mtz1x6D9PZq3It2SmGbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877948; c=relaxed/simple;
	bh=9pcjzi/HrTfkp5yv8oJP7WvStOZ7m7+f7VTBwj2KS14=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tgmamo7ASZuKqGNgKxFiORVMXJBKY7h06+qszZ8lqepxgZHJDUmG0561sqn+V84GQPmR3A+TN8KpsBg97HnHlct+dT52pdPzzPIh19Fp0pVnUPggLSHx9hnoSyWz4w+xZniDUOk7Ym+JXkAffV/P5ij8zl2rpAiTxzoZgxR8lcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CN4smb/N; arc=fail smtp.client-ip=52.101.72.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CN4smb/N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGBG0AuYR/YpRN+7aSlNpMXrluhaLywGt+m1ly8NpIL5uitoXLfe5/B/ART3VJ9nOnJmwqWDUoVUO+9U9KrXoLLoC5z/eDphBEczU2TMd1fnHyRqN7lI9vh5qX1HvX6oL3Wf3RYvZTSxixx7+gHCXsImNOHdu4wXsvCsz709FWFFZvwb64fHGU7i1EUU6bLzAy/i0KV0cfNe3RmHz7kgNkfio8uCegu7uIy2cWICdtHmY2oIvv9ZQijNFA2DQA3A9FEidQYww3CTZOO1TscfNbO9B+hKtUv4sreHcgwvy2qpcrVup00Lr3UNAv2VKc98EPw+/wM6SlphabU8hIJH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaVPO9LsLQyv/z6zqqTi0iBMUVf9dwh04t01EXGjv4A=;
 b=gsCIsKrBQas/lMQI5MVFy1koisjRi/fDsPX/xn7J3/xjpswQhoXC47vMLgIyr3bwPndPw0JRkfimAqnFVVf+hW2o9uSHysmcuTfQoy5OPHqtRpKKnKb7xQGWnkCtIUcxrQP/mtmYaYDNhiHzUtnJ68IJPWtxXwytwbSaA+xCYNiRU9CmJt2slHAzx09dQXQnjjmprUrlNDOrFwfUAmMt7+VMS3dgtPBH1uTFnJwmmwy5WjpQ6/04VQ9352LWpuZ53WOfr47JhSNIv3dOsomPWQ2I+eY8rddYaL6Odsdwm5zkMXRHN/PeYeUw2P+vPKDH75H8AI4JfsAtFzfNkx+jPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaVPO9LsLQyv/z6zqqTi0iBMUVf9dwh04t01EXGjv4A=;
 b=CN4smb/NblXYyRqza5Ns+EQTF1Ey61bJPAMENs2bnlh0a/Ab9KaI85fxF8a4cBsbflePNYddamRJnH66aO+3k4W7OytTOA3nr375ycy4hUWgLbxwqwdChBtj/GQqIjLeBsw3dqJrfJSJhjvCQWQR+LKh2Jt7RGDzl8vGJO3AKytFxAVwvePNeYE8yiBCEPgVRVyy5Kb86Gi1jrh+Q3WnCL5rQA/YZNWT1coYxZtCX1+xOSGyyp8WoZpZZaRJ8UuBOoJcVHnOShA7tPQpAYU18zqVygd7UYEIhiQeoeG7CYbqI0TVraTFcnWdT81pEXfdlCRrD0tnjmdAhnLApGLh4A==
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com (2603:10a6:20b:ae::26)
 by DU6PR04MB11229.eurprd04.prod.outlook.com (2603:10a6:10:5c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 10:32:19 +0000
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69]) by AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69%5]) with mapi id 15.21.0048.019; Wed, 27 May 2026
 10:32:19 +0000
From: Joy Zou <joy.zou@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/5] arm64: dts: imx91-9x9-qsb: remove unused property
 clock-frequency from mdio node
Thread-Topic: [PATCH 1/5] arm64: dts: imx91-9x9-qsb: remove unused property
 clock-frequency from mdio node
Thread-Index: AQHc7cQYdg60LXPXfUqUmSOo5e1ZEQ==
Date: Wed, 27 May 2026 10:32:19 +0000
Message-ID:
 <AM6PR04MB5765E4BA2B5A621DDB92B4B3E1082@AM6PR04MB5765.eurprd04.prod.outlook.com>
References: <20260519-b4-imx91-qsb-opt-v1-1-9b416d2dc224@nxp.com>
 <20260519112314.60D28C2BCB3@smtp.kernel.org>
In-Reply-To: <20260519112314.60D28C2BCB3@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5765:EE_|DU6PR04MB11229:EE_
x-ms-office365-filtering-correlation-id: 38ad38bf-fba6-4c94-c234-08debbdb3b19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|22082099003|18002099003|4133799003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 pyd9WIaUarDtLCIe2ho4k10ESFOm0c6cwy6aFY9pE1SnT6NF0+JlAdaMPL+hHajllYhUhKzOws9RGoWPaoHAJKWau1cQCdIF+x9mPguTJu1pJmEAHG+H7X6gzjna5m//iRhDxuCGvOgqLaexyNVzjGSwSARqN0d9jedJDd9hHtSeD5r/lKrUG/wsVr3RnK/9xg5B9ctP9cr0+0ldf/X0rIjNFcMajCAMcBBgdzEcElq2UyNRuCkDHc7XNJF6OXg4W61AuG2z2aMWqCE4nWEg3PhOPFy8Pdl9OTogm2QWSrNMAsHL9vAHOHcyvgCCce7Boc0CWe5vAPJF0da9zNNCeuuSbjHWBHQE7E3kJ6MgiyOyXGw4NuChSFeXGNFbCZZHHcCx63eLhEj2qN6P2Bt/jGppM7Sp/NnLiGhtdNZPR9no0n7fP3G+20gXNHOpKV+oFk32+YIV+vxATeXXIk3qmTF6PnOkJJL2525tcAYV1CUIFYqlbrIK4eo42KgOoYArbUime53Hsx4ffnTrEruENxJY8cXg/62p0xerP4VBxEUgeKGfeFAqY+dfKoDZh8ciIEKiXPTGTqH9bH9O72qa2rXSU7z5JTPIH8D8R6Gvfp0vgabIrCL6x6i8iclBnI4qWcQV9y0PzD5rzY7Q0FtU2FSp73IvS2vsod8wLLTy6+wHQlHtLQ2tr7vvBt/ze4bsYMQJ5xqUkhyc7nyIR1D7ug==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5765.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(22082099003)(18002099003)(4133799003)(56012099006)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Arz4t/3MnswoP2My03bHNGAX24gMiYY182+Jpc9+tlEqQPJTFrlBK5fxwtY0?=
 =?us-ascii?Q?l3skeAlwGzu2AOt/60H89tyWC6aaOPP1pirHqe1Yv2ieIgg5BuBiheaMsXAL?=
 =?us-ascii?Q?GxozLkE6fJ3QMNWy8zDmuxG9O9nrwhrA8VpXXJxswW4OtsckkS/yyfWVrNr8?=
 =?us-ascii?Q?0nEZqBa764VjbcANERrQtyJATNl4he5z/Jn4maOo7C38OlKUJG3ZrQ4CxblQ?=
 =?us-ascii?Q?TvKKery5OtO6CZUeiYk/jcBlUprD3l4fbaw9FKgwk73T4FDz/MPDT/uOMP0o?=
 =?us-ascii?Q?0umIpw3eFX3DHq4FD9eYfvN0lqjIHPCYv+YcBbeWuLFjnLiPG5z/pLEIVEa7?=
 =?us-ascii?Q?2oOB/GBL1qc18XI9P9TBfPut/ClAm3Xr9tHfXW8aAVFw3d4nrKLy41B1PLAo?=
 =?us-ascii?Q?cioCVnz0h8bJw9JAFEUMWheRXvuInjWSop+YgOCCIjg6fgv6zcVsBEv0+X7M?=
 =?us-ascii?Q?xsVhBtxCBX72y8KTqou8m1Aq+nk3wXPCXKZCTnORhT8snlffwP12JL/j1tWJ?=
 =?us-ascii?Q?7Aqf8YDtZ4aF2hrjPSMOABfVgUnc2K9D7L6QP7FCU4mfWHWNK4vlAH991lS/?=
 =?us-ascii?Q?TodAu3q07dI2LiiZGgafuhHaOVULRBXlHS9noLLrqh016DqSm3tRFErBT/5W?=
 =?us-ascii?Q?gLGXJRRT/q+UrADY7fFzs5vTHrSzFab270TuzMbsg/Vke7HawKvumLV9OScw?=
 =?us-ascii?Q?qmQq06c5k9M35fwfVG62K+rJuymWYI9iUnRPn64/TeWBDojR6I02GMXKOF+O?=
 =?us-ascii?Q?mAjPUV3ozo/qIv1hik+boq73XDM5CvDQ4wSgb0JFvXUr0bmun18jVFNgfCQu?=
 =?us-ascii?Q?6pkB5sROfhacbMoQqmD9mASCmUsEUerJZ2WDsQEOKPE1/FuNWrUL/bw498iE?=
 =?us-ascii?Q?sih9MW0XVV2vj+NfIi1FEITWuoK1O78S+5uLT8ZT+fPA6l98DUolZWrdE6LZ?=
 =?us-ascii?Q?H31TAwHoQ2h7VP53QTr+GKaWVGsa4IJoGgwUYNe2sDS7p8eZ4b5gBj72AIuu?=
 =?us-ascii?Q?yPf7ZJUrJlbjHQHXs3159TXNZfZQVzp2MPnZvN55wKlwv7n+y+uyp1KdIdeK?=
 =?us-ascii?Q?ziHO3/sY/DQCkgIMDS27xjzxYn25oe94T5JVe4dvt1L2xDeo8q0z3eV+a/os?=
 =?us-ascii?Q?bMsZ/4ZG83pgdVp5bz5DoG4VPNXjovBEQW/wv/QLbTtbNbCqDLC8/d9YBkah?=
 =?us-ascii?Q?vkfXZykHMcjLPOdNtbyHx27MBKGgfntvOPih6W8Jcd84w1naVRL3ysbzbZKw?=
 =?us-ascii?Q?G6yiAXYxfAUVKtiW1aReFi7c0838g1H6qgyTr/HS0Ag6/5uygMkPRvsGY9Rj?=
 =?us-ascii?Q?kF4yjP4JX/kU6G8Ptg2CNryLffjM37MRacBdqxtD702KZ3W4ZXDgw1G0TJvn?=
 =?us-ascii?Q?5U0E3wUmHOmoieH03/hsRKrMsPygnG6rfd6PvhzzrKxZ4ui3in+0BYOTkgBV?=
 =?us-ascii?Q?p8TJP4VFTU8/bL6d2SGZB28ry0ZvMdfOhnxQXUZOh7hI+ilu8JALQBmycgoI?=
 =?us-ascii?Q?gPe8fB6x78ObX+bCD7UfCJI49vTcQQ0XrmKx3dP3CAbGHwDybOVarIwIHnGQ?=
 =?us-ascii?Q?ggekJdOgh3sY4HNhNPZOrhP0JzLKFIsOEWfaYZ9NnqH0W3QPoTRe6Pcfu7Xp?=
 =?us-ascii?Q?5zD5ZbefFEKFwnQNfkA/UkVvlyz2n8z26WvrvwJqYCNzdGYWBobI7maFXlYf?=
 =?us-ascii?Q?63Ioc0VIUAtJ/RFeNE5AOi4WigkpGAYZLLFr+npQzHGWptj5?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5765.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ad38bf-fba6-4c94-c234-08debbdb3b19
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 10:32:19.4324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9CIyZTczn3ldeUxjvkeRf2CYdU2FLb4plDONHnqYDDHGhK2yRBoo1jEvn1EDHYoL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11229


> -----Original Message-----
> From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
> Sent: Tuesday, May 19, 2026 7:23 PM
> To: Joy Zou <joy.zou@nxp.com>
> Cc: Frank.Li@kernel.org; conor+dt@kernel.org; robh@kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev
> Subject: [PATCH 1/5] arm64: dts: imx91-9x9-qsb: remove unused
> property clock-frequency from mdio node
>=20
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s)
> to consider:
> - [Medium] Removing a valid hardware description property because the
> current Linux driver does not use it violates Device Tree design principl=
es.
Thank you for the review.

The clock-frequency property is optional per the MDIO binding specification=
=20
(Documentation/devicetree/bindings/net/mdio.yaml) and is not currently=20
utilized by the driver. Removing this unused property prevents potential=20
issues and maintains consistency with other similar i.MX platforms in-tree,=
=20
such as imx91-11x11-evk.dts and imx93-9x9-qsb.dts.

If future driver support for configuring MDIO clock frequency is needed,=20
the property can be reintroduced with proper implementation.
BR
Joy Zou
> --
>=20
> commit c26ce3df4b77107e385684e72957f14db0b4c96d
> Author: Joy Zou <joy.zou@nxp.com>
>=20
> arm64: dts: imx91-9x9-qsb: remove unused property clock-frequency from
> mdio node
>=20
> This commit removes the clock-frequency property from the mdio node,
> stating that it is not implemented and removing it cleans up the device t=
ree.
>=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> > b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> > --- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> > @@ -79,7 +79,6 @@ mdio {
> >               compatible =3D "snps,dwmac-mdio";
> >               #address-cells =3D <1>;
> >               #size-cells =3D <0>;
> > -             clock-frequency =3D <5000000>;
>=20
> Could removing this property introduce a regression in the hardware
> description?
>=20
> The device tree is meant to be an OS-agnostic hardware description. The
> clock-frequency property is standard for this node and accurately describ=
es
> the hardware's intended MDIO bus speed of 5MHz.
>=20
> Removing valid hardware properties due to temporary software limitations
> strips away useful context that alternative operating systems, bootloader=
s like
> U-Boot, or future Linux driver enhancements might rely on.
>=20
> --
> Sashiko AI
> review * https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2
> Fsashiko.dev%2F%23%2Fpatchset%2F20260519-b4-imx91-qsb-opt-v1-0-
> 9b416d2dc224%40nxp.com%3Fpart%3D1&data=3D05%7C02%7Cjoy.zou%40nxp.
> com%7C9d1075e0ec324dc5cff408deb59905cb%7C686ea1d3bc2b4c6fa92cd99
> c5c301635%7C0%7C0%7C639147866021106629%7CUnknown%7CTWFpbGZs
> b3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsI
> kFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DFVEXjwdA2N9s
> Bzrx8aZLY8A4jvAwdv3t0n9Kbl7Y2FY%3D&reserved=3D0
