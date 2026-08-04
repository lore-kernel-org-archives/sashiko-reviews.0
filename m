Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011009.outbound.protection.outlook.com [52.101.57.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62A3624A9
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849598; cv=fail; b=ZlUfZ4hwQRxNYoMgNBgwN/EmAv81NqHlF5qOHNEHz2eNMpZBYLbby79LCfEoZAwxh1ripUJvvcc90DL1fD9HEhZKD+rjj83bP8XK1uPjE3qGeGTES7XJhj1r7B1O6ditbQjngpwYImTiapJnzdtiw3qEsFdW9RiQw7ilcXFcN7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849598; c=relaxed/simple;
	bh=9snpdf3Enthth8dhf5apdCN+Yb+NNK/6GlQSMTk9yfs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eiIJiJYcFeNUUow1Ahgzbp1BiexSSnMAA5kv8r/MhHtlK8VGFpWXIilIgyx7ikHT2IMlB2CFhZsyeN5Znuqfbc3OD+bx8/WOaX1pv21A2lLFyhfwe118+Vi5OitACEjJ168h7nwaZd2Cza0ZrJElHcMiEzNXr6DHlMzkZkMHWpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=L5oyqFzZ; arc=fail smtp.client-ip=52.101.57.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="L5oyqFzZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kW0GwfEo+Pt1W61PxuHV//Ni8//k0D1SMJuYlrarmXa9Km+X+kgb2gNsWklqA6pEcPicAEEDUJso2EVN272I2nXlncTqG4XGQ8JWd6KkVypcdmP5BUCA7UP2nP5y0J3QyvpWjpnvQvm5sFE7wKeA1/9xs0CQjRsvANlOpJ2M36FCPti/JYLJF0OjkKvwemB4fx5cQzA5vX/j9kGreryqi2DoaB50SXuitPOdxlaxNlIJfgX8cmeH3Mgcjjume3OtJXh8T7jtaiSWerbNBwEj2xUSL5htP6m721+2pYgrKJn/+7Lt5ZDfbClOEK6q2cm0jGL2/VV3x1u34nmZ/ZAb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRtrUiDuonSksS1ugQs3Qi9W7vQAJWrFaoPFNUhr3pk=;
 b=pwga9ia4767+JHtyRjy9zXjoUwG2NdcFfP3VfAttV9fe9IwdZ25nw4xw0wZwK5LsJDUzpzpquUyR2F+x4wFOUcBSLJ7P48jPOsr0L4VDcNIkIL5q/Mu5x4Cxzbx0c+k3X2usG/Y17vOD51JGolDG288LSpXptWHcWAIwjIaNiYx0ZJsey+oFiorLR/7rt+YP0p2aU61USW1gc/j5EwpK4T5TQ1dOEKq0qmEaH462IGN2UACo3MNpt4qHN+mGsifxOh4SDMwUX+x5CrXtzwSbl2gnEfGaSbhvtrZHFANRztEYBiWINoZYTajWhXFelkdZ5U/smgVbAWMaTgKOS+sAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRtrUiDuonSksS1ugQs3Qi9W7vQAJWrFaoPFNUhr3pk=;
 b=L5oyqFzZ3AQJHxzTygKiSTGvhbi2KwxL5z8ZsuGHFtLK/fAonwjSplyodMFTzoyzdJ7R/tA1nUN5xZls/bTjMDrkH+nd/im8U4jMgslIakdF6pb2NJCTqXQosNUGOMY53UMPl+v4v9MvyetoYljXM0/XQRsZyf9aFLYZqRYp9HQ=
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com (2603:10b6:a03:53e::6)
 by CH2PR04MB6936.namprd04.prod.outlook.com (2603:10b6:610:a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 13:19:53 +0000
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0]) by SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0%4]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 13:19:53 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 7/8] riscv: dts: eswin: add I2C controller support
Thread-Topic: [PATCH v3 7/8] riscv: dts: eswin: add I2C controller support
Thread-Index: AQHdJBPvSL7EkAZykEiAEMv5Ys+Xkg==
Date: Tue, 4 Aug 2026 13:19:53 +0000
Message-ID:
 <SJ2PR04MB8896855121A11EB9DE5E2D6083D42@SJ2PR04MB8896.namprd04.prod.outlook.com>
References: <20260804104431.1391839-1-pinkesh.vaghela@einfochips.com>
 <20260804104431.1391839-8-pinkesh.vaghela@einfochips.com>
 <20260804112252.9999E1F000E9@smtp.kernel.org>
In-Reply-To: <20260804112252.9999E1F000E9@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=5e08aeca-e0b7-441d-beaf-2d95a9107ff4;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-08-04T13:07:24Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR04MB8896:EE_|CH2PR04MB6936:EE_
x-ms-office365-filtering-correlation-id: 1dcaaca5-f3f8-40ca-72d0-08def22b1224
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|38070700021|11063799006|56012099006|55112099003|18002099003|22082099003|4133799003|4143699003;
x-microsoft-antispam-message-info:
 3xdNzazB8U/V/ZaSrUuOLuwMZzlw8SlF0B7kFQUDdDXnRxmPdS1EiZ9B7uJWPqUsGvrpi4MNJr8xejAQE4B0JL9Hrxtdm7q8F0CDN3wErwkYzzr8GO1rB51oAhg6Imm8WkiD375IsqY1005/og1yHb41PGIwwfm6cbSPkyyH+x/appicrOxFLVedk3q4K6no1uUlqyFlHkvyLsCP9XRKsC+HeV5EY+FFeKLiXUQgBpLDcIVDbfngplWvHZpkgMo8lmRnSxneVdBzttRt37+AzrFQg84G4WsBkwyhbhxyy3JMssCpqE75xQpHe6b2eiCRZ6l4HTw3U+GojVJpKUPP9qoVuinbHvRI3b4pGD93svyikGK1UOmIW9t6fylN4BDgJgj0ZevD/ynJnlmg6r5bxvTSV+1HYUe1i0UNc6vK7beWM/y7qmOLzKXh7QbrGCJsD+GUSnYhMR7mDw/DCu8xbaqftWgPk3rv9Os2ZkDLOIRxImn0GRFVBEbx7sYWM1rhFdyEKfmP9esBHkd+sHlBEwUF1jbVANoid3s9pA5pYiSpHxfp7YLbi0MdTlbEyuykg5eN9l+HmC5G5TTgtxRLI21+DqLiZd16A8nusi9Rw/V4VRIJeWjFOGLykZJCo+invklI7ouWjGcMJ1JELTbxY3bx0ee90i3hyeRXezLbZEhLrdTZyyfSN/zruptJmnlDVjIz+dDulSMUWfGoxPkeGZHW+oq2So+70XgZSG27tHw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR04MB8896.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(38070700021)(11063799006)(56012099006)(55112099003)(18002099003)(22082099003)(4133799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uo4r4Z4MGTJEbCToRN28y25Bo66dpjT1HA58+UUOxFFAChZpA709CmwIs632?=
 =?us-ascii?Q?Te/wNwPTsyHMTgEhAoyAUiFhJ34W19s2HD5COtqTkThu/gw6Mz3wpPrtIbNA?=
 =?us-ascii?Q?KBTpro/dL0gBOO3IRIaVFRDnhY8SP7jhy640a2h/dKmgO+eQnI+6XBixTC68?=
 =?us-ascii?Q?KjhbRd+YJut8vKoDx4FOwLvqBOhpgPyiWlc6WRTnS6fbyGh5s0WyQ+5NT0ds?=
 =?us-ascii?Q?CL2/8Dc8QSHW3lTqk55Thn6yPOZBlx3Mrx/Mq+UBvS4Q5qp9LqkwDsOw6Sbb?=
 =?us-ascii?Q?aBIvsbBwzqVU6rzKaGy0Qof8e+C69SqhJ2OCL+HzWN64Xjmmc+02ckAzXcNd?=
 =?us-ascii?Q?saiyrvc1MZ0iHXE/t7SbOX+f5tf5G8FDPUkw03XihEI/DD6eQ4Qz9mE8SoE8?=
 =?us-ascii?Q?mC6oQUxf2y0hf7Z7zpEnTcxC72yP3F/+TVpHO3WAJk8SfECWd8u/oNy+/0WR?=
 =?us-ascii?Q?iBOQKSF20MgRXvQyDmcMM5K+coUqAKV+r0jZ7Nq9taxjGhXev5gwetlIW26T?=
 =?us-ascii?Q?TZQJzlS0b2yh99aZZbtbSLeF7MqmZamVHfxzBFhgDQsNa6ve7nBvF5Ko0u7H?=
 =?us-ascii?Q?Vd/sKIiheEfWbNeqqmCIqldtDD14zzB0bRA1vOjAWCnX+3ccOe72GcIQa5bk?=
 =?us-ascii?Q?e9b8u4EaekpEqiiOxymbDqy0Euulyut+dO3OhkbORjwLWVHHxG+a2ExjLEjs?=
 =?us-ascii?Q?cz9HCc6r0NchhBPMApvXiMTR1TwTJYSyOZVqXBhz3Brdl9oXp6GZvtCvwqXJ?=
 =?us-ascii?Q?ap2jNCAo8BCbZqvhCQZJntJZR4NQnc09BGFllxxnLtJhmUfFZC4y047LZ+f0?=
 =?us-ascii?Q?PkqRcbGpF01M9VTeDc6DExQvd0BmsT8FmVYr4m3Ch3baRgq4mAiuHXsjTLvf?=
 =?us-ascii?Q?Eh5z1A5zjO9Auv/CTTsys6EU2SoI3B79v94cW47YVIyfa2HHaOtSGjZIrhsp?=
 =?us-ascii?Q?l0Nq0YSvUlV2fblocqMyPwDYGWPnrFkXkNxinQz156ZzONp286s+qAdnFS0C?=
 =?us-ascii?Q?lSToghMfaZdKuE7/+mIG0xjGaVR1LP8xWOBjLDA+uosaYOGiiV8T2fEp3dFU?=
 =?us-ascii?Q?myiEKHoARBmi/zXhvz1TaKMShztQR6IcwyJohRrFM63BsrEiQdZ9NE//vmdm?=
 =?us-ascii?Q?aGajE2oa458N2uO7cJ4o90WEUGx1cYvRYyIPRJZnqh7u7XSQrnwEoEP1FKdh?=
 =?us-ascii?Q?gCPAptIBHqqRU78gJfohXoQqQCrKCwzLPVmQbtL8diiQCO3P3YnwzUS8mmeu?=
 =?us-ascii?Q?RxA7Ms/xWqIqm9DSMxYbOEZg39kwIYHkuM023VAPwk5s4LhTcHajs2nSwiXT?=
 =?us-ascii?Q?B/ukKJE/Z5WL4/jm9A4XcQgcXw+Jj9TvGEd3NEYB6Hx3Q5DW0k8skrFspABe?=
 =?us-ascii?Q?SmCNC8xNQdC7kDraBmDI2zWz4kUSDbqvwtdMHOWlSla59SgCQLddJlblGscE?=
 =?us-ascii?Q?wNhqDH9WBHHHFpVzQItRLw58HGGx3l1c+36VLBtxvYrKS1Mp1Pn45U8gb+38?=
 =?us-ascii?Q?DPS4V7pn3pF0nnA9kDqNeDJ8gBGz4S31c/8bv0v33X+ssH5ySQKrh5l9Rd22?=
 =?us-ascii?Q?XuZLU7ML73n6RMZPPA0YzycsH8XXO4G16g+mSlNPzBDj89S0eAqHxZwmNLVM?=
 =?us-ascii?Q?+7hyDrnTbCwCOv9GR1eGKvoEdCzo3LMmqhVnz6pyGS19d0z0KRxc77MuSRHi?=
 =?us-ascii?Q?VDSJT8MPpmVzof5AjuTCpYg/jH1OnXD/ua7mze5wX4dPnLcV0cRE+fnuoun/?=
 =?us-ascii?Q?T9VeSuSbaOsZ466hrbKwaxpZ6WxumlM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR04MB8896.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcaaca5-f3f8-40ca-72d0-08def22b1224
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 13:19:53.4015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+L/OWZ+PCYY6eo9fF+ptQHzgsV9LrIXCEZydaLLMOfVhIhEGi5RjhsW0QapnSH4bGi4GgI6nOpFm49ZVwMd7sju/qOQCIYBGgojzrITWIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6936

Hi Sashiko,

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s)
> to consider:
> - [High] Incorrect pinctrl assignment for AON I2C controllers, mapping th=
em to
> LSP I2C pins instead of AON I2C pins.
> --
>=20
> --- Patch [7]: [PATCH v3 7/8] riscv: dts: eswin: add I2C controller suppo=
rt ---
> commit dd055880a3b8b5096248d3b1a4bdcec3e5acbe01
> Author: Pritesh Patel <pritesh.patel@einfochips.com>
>=20
> riscv: dts: eswin: add I2C controller support
>=20
> This commit adds I2C nodes for the EIC7700 SoC and enables corresponding
> slave devices for the HiFive Premier P550 board.
>=20
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > index 3101fd90d1714..50c15e08a57f8 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
>=20
> [ ... ]
>=20
> > @@ -130,6 +130,62 @@ &gpio111_pins {
> >       input-disable;
> >  };
> >
> > +&aon_i2c0 {
> > +     status =3D "okay";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&i2c0_pins>;
>=20
> [Severity: High]
> Should this use the AON pins (&i2c10_pins) instead of the LSP pins?
>=20
> Assigning &i2c0_pins here configures the pads for the Low Speed Periphera=
l
> i2c0 controller, leaving the AON I2C bus disconnected from the external p=
ads
> and preventing communication with the EEPROM.

Yes. We will correct this in next version for both I2C.

Regards,
Pinkesh

>=20
> > +
> > +     eeprom@50 {
> > +             compatible =3D "atmel,24c02";
> > +             reg =3D <0x50>;
> > +     };
> > +};
> > +
> > +&aon_i2c1 {
> > +     status =3D "okay";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&i2c1_pins>;
>=20
> [Severity: High]
> Similarly, should this use &i2c11_pins for the aon_i2c1 controller?
>=20
> Routing the AON controller to the LSP i2c1 pins will cause the ADC and po=
wer
> sensor to fail on boot due to being physically disconnected.
>=20
> > +
> > +     adc@10 {
>=20
> [ ... ]
>=20
> --
> Sashiko AI review *
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsashi=
k
> o.dev%2F%23%2Fpatchset%2F20260804104431.1391839-1-
> pinkesh.vaghela%40einfochips.com%3Fpart%3D7&data=3D05%7C02%7Cpinkesh
> .vaghela%40einfochips.com%7Cd8bc429a6c0946a6b9da08def21ab9f5%7C0b
> eb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639214393771766036%7C
> Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDA
> wMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%
> 7C&sdata=3D0EXL5kcwVb9qtE8hUzTyjhOYtlomJ2zP5N3MVrMBBmM%3D&reserv
> ed=3D0
