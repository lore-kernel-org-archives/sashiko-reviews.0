Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011049.outbound.protection.outlook.com [40.107.130.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CA3380FFE;
	Thu, 28 May 2026 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957829; cv=fail; b=CjDIEh8WrSjUnN/+yv8JkksMfCp6KHXIbfKJ8mG25gmNCRA9AbJP9AQV7p2QHjj2pluqSucwtb4yeS1AvR3xDhW5A9x5XcqAMpuYpG05qGz3ELUM2jFRt7lAXWnxfYLeXwhP0eB/KCKLEQaNrfHt/J/4y3GvfdZsX43bZio1Z3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957829; c=relaxed/simple;
	bh=C6Se/Te88fKHKcAolXK/qW1gTXkoQFC6Z4d8sVybxnk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pLf/EmxoaKPiOMRwNhlPFo9wM0oB20Iek2Etb/5VzDXxN57101eS9KeFPSI74a1p/Vyai7VfJ8XSez0L359SV2nCb3z+LJbzGsTM2fppHzzdOnASzKn0/EJ2Pd985N3jbfzyHms8GYrJQaFN7HumEApQueTz+1vBj1SQ8DaQx5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fyIuw0pt; arc=fail smtp.client-ip=40.107.130.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fyIuw0pt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=un6vV/niqQxfaAJXgo7paMWNV4L8bu1xDFb/F70ha7QxA7I67i5LYQcWSO23YZ0uNMK/hEWd+doF1UhnDqbvhf40sc2P2p6a4ns9o8Zpts7gIPwb72TjyleT+ZC7wV0hBuz2LVfbxkXzqIVeZaoZJtfKBFxRQI20U7fze7f6eZr2vXrhych24fOW9lbeDzlis3LW9jZ8bmMsw7TdNNh8UcRTeBGhPR5kQD+W+5YB2ESEjAQLzN8rloT9SgQEgGt1qvhlHDmHq7t4irdPXDSYNdiVki30S2oDWJmKW5SEPM1EDd1g1yHsiKCBYMtpQqUnCbqIS67MMd8qcT3azlKoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcCx/RkagbhbTqh27BYhWMpG39iRt0hXxKHFomfwtCo=;
 b=kv9VzMmT4MuHpSDuA2lVbuNJJZA00DRTZSzfjbBzIfcQbFWIrPTmX8asCOpXG+g0F3kZUTwnJpB8y4L63RDcJIywfcWAIWUH7oLUKzpsRGQR9faG6mz7ZhVEdpxlbkBIo+6Re6FrIMA3Ri4R0ZMkMD6up85687ukwcDDpcPlYHwN2GnCxOc6DvzSKhyEOJHdV/1VF75UbEFRoKKS38H8pgYJkSyYUUj5hkKT3d9OR22UN6WfqcH8n/ZiQWD2zdJgKp3gepmnl1BNuSOqYfG6o+2LzAvBlfkENenvgyze46MMjAF9rGJS0ykMl+4Q/WsQEWo7Ooc4myKohsNQsy/z7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcCx/RkagbhbTqh27BYhWMpG39iRt0hXxKHFomfwtCo=;
 b=fyIuw0pt5GAiIIlfSKO11ygbMvimZaK2on202Da/3IFYV543iOgHg2jqK6C5UBxCI7Okk8QntGg0QsNn7qhfF2UDp8mFEWCdsd/TaqnuycFkepCH7HiFIBlBNSkkjegtesDF6XLyrqS1nkuL183xr9CrsUhW4gFPMny1Iby5/6UrFyK/8DfYNYSM48QQbt+Q8oa15gvJ8CsfUnkO9MOwM7RmrqY0OOjt+8WwUcBN4xfpRxKVPpdN8c3/Stf5RyLGMmLqoByLPTPLOb36GNOK9V8/ZIhWI/5F0Q3HBxpp2Dz289ZxrV1wr4dWXArgcNYTHh+/VkXKsLi+WF1eUPwkhA==
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com (2603:10a6:20b:ae::26)
 by GV1PR04MB10477.eurprd04.prod.outlook.com (2603:10a6:150:1cb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 08:43:41 +0000
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69]) by AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69%5]) with mapi id 15.21.0071.010; Thu, 28 May 2026
 08:43:40 +0000
From: Joy Zou <joy.zou@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [EXT] Re: [PATCH 4/5] arm64: dts: imx91-11x11-evk: add reset
 gpios for ethernet PHYs
Thread-Topic: [EXT] Re: [PATCH 4/5] arm64: dts: imx91-11x11-evk: add reset
 gpios for ethernet PHYs
Thread-Index: AQHc54CZhl7hYCitdEujvP/o4XKtmLYVQHqAgA3romA=
Date: Thu, 28 May 2026 08:43:40 +0000
Message-ID:
 <AM6PR04MB576539A94CFC3C8E3C612A12E1092@AM6PR04MB5765.eurprd04.prod.outlook.com>
References: <20260519-b4-imx91-qsb-opt-v1-4-9b416d2dc224@nxp.com>
 <20260519120511.C59D6C2BCB3@smtp.kernel.org>
In-Reply-To: <20260519120511.C59D6C2BCB3@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5765:EE_|GV1PR04MB10477:EE_
x-ms-office365-filtering-correlation-id: 7bc229ab-22ea-42a8-263a-08debc9537ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|38070700021|11063799006|5023799004|6133799003|56012099006|4143699003|4133799003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 AOMkVC+8PUUmXgaUzlwXdZBzJJIOk8egoQawIjd3/+esdP/cgBek1b42O/aEhg4rYr1V1Ch55QB3q+Q91Kz6U2pYHxgaJZslW19sQ6SSP6cB0i/huD1v0qUDbvVWaTh4g5pWu8knBmcBkRZJ7QkWBVFq1PBJsGHX4ZbRxljXfiCUsHvRRl+5WBrgeXbNkV70WppftH9/AjWY7r/hju6L3ujR4WGHVHdXBSbdG7FP8p8VaK22x+znAlQmTJxa4Ds9I4cICeG3PflCL1pmpfQyG5I8UApS81Tbdip2elN9lcgK0oAwljZENKMoA9H5xIRL5jV/WMBz56MzfYLjwdT3O8TBDQ/KXcmVNxd/TsySYfmeNnjqwXnxqjnhUWpdaqxHPVAn2GCp41EmBrfo1BqdKBM+FJzyFhgmvCGblUAacUJyhyqT8ClPCbQJMq2E3O5U4nN7t3Q4xXK9DPJVcnNhAC7MuA+WzCWlWQmweUmGJHAQdfk/9C/xj2fuXYi8pv0zwLxJpbyeinxhpc1gT/zDve1jdMKpuQcrQz4MPL1pwuPYGmN/HNx7kMd8JNy+BTdUOu5gMlH0Bf53gVdQfyYH/o07SiPP4bO4+EpJKP2oHLtG79r2Db86xbHL0ORpoSl7HRvfhc0PDIXm4tKFmUocgkrpZKVRCISYmnOg1eEknF7a0CF1qDjAvKjPlI6tI1pA0cPHL6Wxr/wL3khSgEtONA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5765.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(38070700021)(11063799006)(5023799004)(6133799003)(56012099006)(4143699003)(4133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?a6ZOd5RWMVFCovdzyfZiNFNlwSw4EqjgGZ4Hwlmb+C9IBmyLtBkNqWH5vobt?=
 =?us-ascii?Q?MfsNxHMeYdSYkXnAIBX++C7YP+E7XhiECLATm5bdnkGPuk4vNfs5oeldfUF6?=
 =?us-ascii?Q?lv2FFKWi3EA9TFxJ34ooK83M1GifooR/JDc+8A5+QctEdf/AJCNVCOZQGREU?=
 =?us-ascii?Q?9ZkSnpB8wpF58iyy+XTaudLr2R5Isz/lOaJeaZcm9aH/izXHDdf62h2MVV6q?=
 =?us-ascii?Q?t1Cq4rFaDRWusR4ZcejfTzdC9400Q3oMRZLg9ukyaYRjDGaqf1bujMnxtD+8?=
 =?us-ascii?Q?XilXduFB8adu1nQB2FxKBu5TxY2ToWbzowQRFPU/MgRTuakfYMYzUFann1LS?=
 =?us-ascii?Q?DdaBB/TcEYU4vi8witZodbGHGebyhXrxekJ0j0CpXqFVYti0b58QDDtwY7NN?=
 =?us-ascii?Q?7TYBysVdLMGxd1egxP54tzWQC+8bgz5rNq5eQLOVdzhpKatbQ0iF5W5IOdbL?=
 =?us-ascii?Q?+f2TopA3i1Q5t45XR+dYgaxb1W3gg4u30B40VjhxqWZ/Pkd+SB8wHTg4CLWl?=
 =?us-ascii?Q?R6NhF6XEUJZuye6+6suNGElRnXoarw7Ez10wxsVe725PmR08OU+eYbjd/n4/?=
 =?us-ascii?Q?MxflGMElfJQRIxCHaNtnmC6f/x5huYm/82jLYiVhVNMI2enHKYGwDIPEc61l?=
 =?us-ascii?Q?QiXWH7iY2xUpyhf8/O1uZQ/Zc7oUGQO6CIfj0NfRHQyO0geKP0vNgrOGkACr?=
 =?us-ascii?Q?Q1eubRfKH4Bn+kvTtIF93g6OHpHGhtboyfdmnWSXMlC6J+eLcSjbaFDWoKuV?=
 =?us-ascii?Q?9Yujs4+8/sDPowvmygc1AcMchgMkmEftjxV/OKKDr92Z0CHwSNEJtYAmsLry?=
 =?us-ascii?Q?+Oj0oDHh4kQzlRUOhqk1hgnSRDtKUTyipB4ipiCsJ2AHdiR2/i9LUvrVFdp/?=
 =?us-ascii?Q?swwTx4JrYbSGpQuVvT9+Quj7esiskksSj9aa4bYzQ+yZqGs5IRZvRk+VJH2D?=
 =?us-ascii?Q?cYnL9RMdjQ84tlyos8kXk9kYEpVXbG+KFCqKK6DEhGis1yWlPCdNOs6qn1/d?=
 =?us-ascii?Q?i9nroInPTdiynKgbqTGQ6oWVoMve+X29/6Z2fgFwR8s7yMZ/VGETtPy+hFtM?=
 =?us-ascii?Q?pYRg2/SRIuRoeTM8TUmzpvUXTLHit5OKf8OEGrVRz67oQjW7MLITKE1ebvoa?=
 =?us-ascii?Q?6Kh4faKc/HkAjivIcYU4+qi/LA53yIBSq7goRbI6a5CoTarpWShg+QIZP6GW?=
 =?us-ascii?Q?QLm7Va9eXkNd9fcOkFY/qyvvBYUi+dT67S9hCVAiZSIiebS4EWmW44wit9xA?=
 =?us-ascii?Q?J0zGdTsPJkya2nihavrpfoTxukaO5Y4cYHjGPHu+TZOnicOwGRVuJ0T68AJe?=
 =?us-ascii?Q?LaHNkmLpqzHAwX0gZlMxAzjdoOIghfIoEejfs6RYSkEB9HoRw6yb3dwszGgr?=
 =?us-ascii?Q?EbN0jZVQlNfXAsCUwntSetZdhXEwnxHtaF0HZc/ht6ezaedxVAXk+Oboo2Hl?=
 =?us-ascii?Q?P524voqIZI4Un4MRUoOL4FdkdTWRckGRm52SiPRlu6AGAm3VgPsyJmh1Zm0F?=
 =?us-ascii?Q?HJY0Y7MJQl0skZWUGt+wOkg8EcBJfmVthD/piwfYKQNa7K67wKlayAGl6IOe?=
 =?us-ascii?Q?8cMxopC3hwSqnYgQ8WMiV1Js1GpdDE2Ck9rzViU1/2N32DVZaHmiVJKyt9Zh?=
 =?us-ascii?Q?wUt/VTUMwARVLpwLDb2PuxLYdMbWIbGUGW3CeiYBG3uOoKm9VxWKINCpuO/C?=
 =?us-ascii?Q?PAyitLwsssqdnFdwkbDnFVjGWhWKvk50zWAt9cr1PSXd+qLE?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc229ab-22ea-42a8-263a-08debc9537ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 08:43:40.8669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J2sqtKOJqWXJfDpZB9HqmdIAWn/FsIlNTGt5FcfQiTON5dQMWaY/FwXvKgKj4utn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10477

> -----Original Message-----
> From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
> Sent: Tuesday, May 19, 2026 8:05 PM
> To: Joy Zou <joy.zou@nxp.com>
> Cc: conor+dt@kernel.org; devicetree@vger.kernel.org; Frank.Li@kernel.org;
> robh@kernel.org; imx@lists.linux.dev
> Subject: Re: [PATCH 4/5] arm64: dts: imx91-11x11-evk: add reset gpios
> for ethernet PHYs
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s)
> to consider:
> - [High] Missing `compatible` string with PHY ID in ethernet-phy nodes ca=
uses
> silent probe failure when using reset-gpios.
Thank you for the review. On our board design, this pin has a pull-up resis=
tor by default,=20
so the PHY will not be held in reset. The PHY ID can be read successfully w=
ithout the
explicit compatible string.
BR
Joy Zou
> --
>=20
> commit 3c4c46607dcfd2582ce8a02581310d0901a9d667
> Author: Joy Zou <joy.zou@nxp.com>
>=20
> arm64: dts: imx91-11x11-evk: add reset gpios for ethernet PHYs
>=20
> This commit adds reset GPIO properties for the ethernet PHYs using an I2C
> GPIO expander. This allows the PHYs on both the EQOS and FEC interfaces t=
o
> be reset during initialization.
>=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> > --- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> [ ... ]
> > @@ -198,6 +198,9 @@ mdio {
> >
> >               ethphy1: ethernet-phy@1 {
> >                       reg =3D <1>;
> > +                     reset-gpios =3D <&pcal6524 15 GPIO_ACTIVE_LOW>;
>=20
> Will this cause a silent probe failure if the PHY is held in reset at boo=
t?
>=20
> Because there is no explicit compatible string with the PHY ID (for examp=
le,
> compatible =3D "ethernet-phy-idXXXX.YYYY"), the MDIO core must auto-detec=
t
> the PHY by reading its ID registers over the MDIO bus.
>=20
> If the PHY is currently held in reset, the MDIO read will fail and return=
 0xFFFF.
> This causes get_phy_device() to return -ENODEV before the device is creat=
ed.
>=20
> Since the device instantiation is skipped, the reset-gpios are never requ=
ested
> or deasserted, and the I2C expander probe deferral mechanism is bypassed,
> leaving the ethernet interface permanently disabled.
>=20
> Should these PHY nodes explicitly include the PHY ID in the compatible
> property to bypass the hardware ID read, allowing the kernel to wait for =
the
> I2C expander to be ready and properly deassert the reset?
>=20
> > +                     reset-assert-us =3D <10000>;
> > +                     reset-deassert-us =3D <80000>;
> >                       realtek,clkout-disable;
> >               };
> >       };
>=20
> --
> Sashiko AI
> review * https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2
> Fsashiko.dev%2F%23%2Fpatchset%2F20260519-b4-imx91-qsb-opt-v1-0-
> 9b416d2dc224%40nxp.com%3Fpart%3D4&data=3D05%7C02%7Cjoy.zou%40nxp.
> com%7Cb1c1f9973c614b29b62c08deb59ee238%7C686ea1d3bc2b4c6fa92cd9
> 9c5c301635%7C0%7C0%7C639147891166666445%7CUnknown%7CTWFpbGZ
> sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIs
> IkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D%2FxBInCq%2
> Fh2mOxbC8W2GhpLPwybGbSMs3xIsF89sSYd4%3D&reserved=3D0
