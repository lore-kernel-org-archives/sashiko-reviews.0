Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8995C4E1C7D;
	Thu, 15 Oct 2026 16:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080380; cv=fail; b=LFLq3QWe6DS8FwL8ER1fiAo91QQkJzz+b7CeNyxM+XUaCmd5HKvCOnfakEKHPqfzQS0uiXCwxTz8whTBtvx1s3N7x16MH07fxV13Z7sqSgI56ZCNsoQw8kgY6OHD1YiLDM015e4N3BkXRU5mGXbhso2Om9OrYsFaUIkOAiTFL/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080380; c=relaxed/simple;
	bh=13qcUDBrPSbcWj582MadxnFWndpokL5AijdTW7YaeD4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MVjNMNaER6ea15N0XDH2+7pYeB9PYZ+OORxkjfEADpoOgRbjxtWOswt1leiJ0z7u2Tn0rrHiuRglsh9FFJ5OX2nTx/akfpjZwkoS4xysoZnwOZzVXwh01lbI8UM69A8HMiAsIxfLVjjFhNmn9u8kuOHECdhnbNRWMFBMVVIBPSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=J+xX5bGh; arc=fail smtp.client-ip=40.107.74.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="J+xX5bGh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIDv6TLTO1hRBqqUCyi+A1kIehmoQpCkg5QwH2cZZJJ1F305C6rZzSpnDk67qUNmyld07g1kfcZzH3CKZu1GwPcewzrbWzMPREo0U5+lNtoZovGT+WYuBXZb9ozXylFuovX91JFy+Ypx27Y3qhl7NhlAqq7rE2pGgrefH7rCX17nKojgNpSVjmHlYY9aVobFINwXFU4k3/wswJP0244T5+8qT5FclbPmE0cBNXHip2nwjI6tslnN+pCW7Aho2Fz5GYaAxA/tki879+zL92smaiLUbiLgIw6/EEa2sNElf3Gtn1EuJMaQHa/K29e4zCwLlTbv3LslnveOncD4iVCd5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCL265NXipM9D87yqnfYTv9H9u93IJv4ptcMIvIhldE=;
 b=DavHj9HOw0O+m+l3TCHBMlyAfT3XZPPzt7Z0WaWuEVUPIVwF3C8l18C+LXxa5bK33RcEJ5wF4AWKBs1MtuZn2xKW3nmm9pYK1ih9c7FXtyaYizIZhG2r54vdyX0+tW50LZ62L4tTkMwMREQk8FqncOxEbmUUZPrIAlSuTy1RXZxUFvm6HFvPiBD2PgcwiWpTnn2qVrwtaXTziaEjvjlTC022lv0C1F6umRl3nffvXJOSb+7616f+IvjWpG1KBnnPEtWKsayEIltdH+nCy1+j9tGwY1MKWObGnLTMHW6IcZp532DNdaa1VKUtHwL1SARpDkk+PeEEaNmvv5tHdcguzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCL265NXipM9D87yqnfYTv9H9u93IJv4ptcMIvIhldE=;
 b=J+xX5bGh0aOW0o3r3mzF0C9p9DHZdV5km9J2aT9T02dxw6rXh5wH5K4WhsM/NgeJCBc2xUZ8T8VkfQtDTh5pCbecmMNZlRaNngUlyHlHBkq1Rh/ShQixwmNvGxS68E9+Y/Nm1yR3rJVq2H+C/rKg6gFMJzs6gJs4Nj1WzX6sG98=
Received: from OS3PR01MB8667.jpnprd01.prod.outlook.com (2603:1096:604:19b::10)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 16:06:00 +0000
Received: from OS3PR01MB8667.jpnprd01.prod.outlook.com
 ([fe80::a7ca:1a29:beab:1921]) by OS3PR01MB8667.jpnprd01.prod.outlook.com
 ([fe80::a7ca:1a29:beab:1921%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 16:05:53 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "mfd@lists.linux.dev" <mfd@lists.linux.dev>, "lee@kernel.org"
	<lee@kernel.org>
Subject: RE: [PATCH v2 1/3] mfd: rz-mtu3: Do not use struct
 rz_mtu3_channel::dev
Thread-Topic: [PATCH v2 1/3] mfd: rz-mtu3: Do not use struct
 rz_mtu3_channel::dev
Thread-Index: AQHdVCecJSRjA2/PD0GsBGVmpNdXq7btqSMAgBEoyqA=
Date: Thu, 15 Oct 2026 16:05:53 +0000
Message-ID:
 <OS3PR01MB8667BFF24F5FDCE7B191979B859C2@OS3PR01MB8667.jpnprd01.prod.outlook.com>
References: <20261004174024.502949-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20261004174024.502949-2-cosmin-gabriel.tanislav.xa@renesas.com>
 <20261004174938.9F8831F00898@smtp.kernel.org>
In-Reply-To: <20261004174938.9F8831F00898@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8667:EE_|OS7PR01MB14460:EE_
x-ms-office365-filtering-correlation-id: edaef567-ec6d-4f73-5d9d-08df2ad63059
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|56012099006|5023799004|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 g+PwTDQfg5JQYIS89VB9BloB+p9P3SfN65xgoRNGxkwQOW+sHhkACaTCSIY/axXDQwePBM97AmN0U9MiKIHw13yAfgvVBCkhIB3GEW7rue12fr/ug0VkAYkQMRn4DPDEEiRHSjJy98dEViApfOjZ9QxQ0xFjskRExp+zX3EilP8g/AxPPQXoJnDMpgnUmcMRWerobOv1sQMEF4AQdbEyUZuY6vW+y635SmIbMfDxaI47Jnzm9u3vHyXInbu68GhlqwgmtBsBApTlChRTl6nts+oZiw28Y1En2rSeDo9slurdSG9ykSMlnGKEYzXVd+tG6FtC/PYmh2Ty2heqobYbqDT2BAwO08kJxkFlF3O8D7cZ/3u6Y0B59nNfWEPGs3n8Y211xL/M8VUbX7DD7Sm9iJw193wBOQ3q9TtPgAaKRSDpT4fm3ZqC+H3h7nJV5wEcbLUaXKy6c0EjJmwU3xc9lAXndHRCAINLCqMYSCjZS3hLLlIstJEz2eCAPpuU8lTwZy+li1VQe/T60KRoTO4TbdWcHl1X0sgxv/Zn9nu2j5sUCML4AaO34VWgEsVxYvLTk+0GKVvtV+qJrm4waI0JXFQFj5SwZrAKwaWY/9UtZM12mBKiPgEIQxaQF7Y8+MQprzZOEhdoIW5+6QYr5snGZCEOiUGLddAPRUsX3xV25TgVE4Fgs1xeDeXN60YXspPdRvUTZZlUSqhn7XSatHPGyPD0Pah8b/kTjvhxJGSzXgQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8667.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(56012099006)(5023799004)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+AE1H36BLLDI+O3+n6geNAww/nHfzMVnHreXqk0+PwzE8UaISzQ4vnb9fv4B?=
 =?us-ascii?Q?tAuzEVrL7MCKnPVHMzeTTqn+bZBXqf9LCQqHzb3aH6zFlQPdvq3igiG5KtDr?=
 =?us-ascii?Q?I5WGmfvyiC2osLow57PsY1eohAvnnnW08HBqLjl7Lc0rFyBlBgun2h8CKAFd?=
 =?us-ascii?Q?69hno3p7mZSFTY72lgRm30RKcSJm5rBPnE/48qmhWyuPXtzuKONaq8tcCQvm?=
 =?us-ascii?Q?9seJ1VLo303a9lkcTkkHFBUsMXc7c+jiQLzl+DlCW+V9BzGX0WXiOdR+EDWJ?=
 =?us-ascii?Q?Pt/4n3k78xcA1LlwCXXF49xRVskpCiwfopPoe8tySJrlBdGWRV7YBdtbc3u3?=
 =?us-ascii?Q?waLlgRWHTtPtdstgsK4Zf15bhA63VA1zhhqSPxhtog+JjNc8mGCkBNU5W//e?=
 =?us-ascii?Q?sJJhoWNtVtm0M/9EAfD1S11xlnX65aLbwSELnwcN70olZHXi7A7Z17q8cAF1?=
 =?us-ascii?Q?EVSRSuT6nuWSap9nWya4ujqqtkqQUuS7Ae/1t6T0JU9fbgQlJdgXxIcbgJI9?=
 =?us-ascii?Q?J7MJhtjmtXMgiOztxFZRUXuDN916sMXv6dgrFNQLDu6EF9AMJpZRumcJ7Pxf?=
 =?us-ascii?Q?kkfwzJE4D6lECvqCe/Lvk+7dsasJOzWJI4VD3cYC3aebLSut7OFqmyw0Pa3/?=
 =?us-ascii?Q?IZ2ZPifDNYERTM1LxnGIe0aEpXXBcVHMdVIVCavIN0QDs237K5ZtPNtQR/qN?=
 =?us-ascii?Q?l8/C7NTHtXUMWCq7V8qdIcsqAXa3L4hxPRcUQbtx2SsPpLN9+PZzth/YTZJr?=
 =?us-ascii?Q?WriBil/763u1KcLaggwHb2jS3lyEQdhveZyO7qdnHIBWcTZ58tjMk495FK1n?=
 =?us-ascii?Q?dDVR4UqNUYw2drKS56eDhzlicObbVD3t9A9r2Zyi/wWoas38j0GUNKMA8N16?=
 =?us-ascii?Q?NejNYgKjhgd8+f5O7a/wEmPSrFYJW36pBPQyZaJRyNcDBbV1YXSMqsged75s?=
 =?us-ascii?Q?R9IkHXjjE6QhgW4/masFuM+D9LnDCxdlzXwwrl8fyB8LMi9aO83h8P7McItf?=
 =?us-ascii?Q?1SO3H9/LAifvJIQTwFe9UaBt6zM3q0s3gNLCqVH3l06NHibVswMJIQ5vvE2G?=
 =?us-ascii?Q?EuMS6XFRl1gsaux0m1mjC2/ZBKAC2gP+gsQ5nW5qIAQl2BBAI9LIgwdH6e9D?=
 =?us-ascii?Q?RrjssWFzXqh16kMaugfeGBSktnPkRMm5lu3t6zDmBKEcmpCOO1SrmMF2OaSk?=
 =?us-ascii?Q?K3PYFv2mAD41GjB9HPyvAZ3ot3GsVv84OqEHw01+2aORH1hT3zeNHvmMpKb9?=
 =?us-ascii?Q?Hl19pHY9+2noG1IsUMjouWDATJsP5CGygK5UE9bspApF6glQfJdHkokHedMl?=
 =?us-ascii?Q?8d7/tkaTnVUbbZXWfDxSW/0qibme5sUI2NU5LHSrahI1TU5QxkiCyXmm5Kcd?=
 =?us-ascii?Q?5JmEloazSWJ4Gk8GBPF8NchJV8SMNLpDKBI6KziftXCEuedWVe2pobf9XfDx?=
 =?us-ascii?Q?iWViE+EkDs6UWOXJuDrEzECEmcieivRAQSCIkP9j66jldv8iZwveHxN1U5A2?=
 =?us-ascii?Q?j2rmsMw07eAVFApMuaaNH2chCuUf4wFxmA20FIqmS1fCnD5QNjjMkptdHwWU?=
 =?us-ascii?Q?AQd88ET2xX8BiVD+wzye8vufQjCzNn/3+ptju6uGC00MbYgs13mld5nzQSkl?=
 =?us-ascii?Q?n9gncH5qS6YW+wAdY/ZYQhK4Pe7wJQsK0qhUiv5ipdmRAokd0eFYa+sj+93d?=
 =?us-ascii?Q?3KCaoH64Hzg/gvp2fyoUs/IhKnLii8mhDoHQTipCDlhKrOJQ/0KihULKISm/?=
 =?us-ascii?Q?/N5Z2I95GEc3bM3Fzi0BbjZ4+x6AZLLLyPE0Fb+i9wnNM2VYEtVj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8667.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edaef567-ec6d-4f73-5d9d-08df2ad63059
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 16:05:53.1818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ycr2BgiIfzCMkVbZ7X5fFN54zWkfvKoaB0BFsSit0wT6cm2bH4GJe7iFoxduXmaDXXvytqNX0Zg33tLpP6lnNcGKfYx4WQ94p9K0Ajr3QRgGN+SjRmATrFYvvZE0KACy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

> From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
> Sent: Sunday, October 4, 2026 8:50 PM
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] mfd: rz-mtu3: introduces forbidden parent-child data sharing v=
ia intermediate structure
> --
>=20
> commit 4212c1766ca715fc3ce07b2855bbb23c7d2c3f39
> Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
>=20
> mfd: rz-mtu3: Do not use struct rz_mtu3_channel::dev
>=20
> This commit adds a priv pointer to struct rz_mtu3_channel populated by th=
e
> MFD driver at probe time. It replaces the use of ch->dev->parent with thi=
s
> priv pointer in MFD core helpers to retrieve parent driver data, removing
> the core driver's dependency on subdriver-assigned state for shared chann=
els.
>=20
> > diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> > index 0a254e61ec0a5..0fca16aaa5669 100644
> > --- a/drivers/mfd/rz-mtu3.c
> > +++ b/drivers/mfd/rz-mtu3.c
> > @@ -62,8 +62,7 @@ static bool rz_mtu3_is_16bit_shared_reg(u16 offset)
> >
> >  u16 rz_mtu3_shared_reg_read(struct rz_mtu3_channel *ch, u16 offset)
> >  {
> > -	struct rz_mtu3 *mtu =3D dev_get_drvdata(ch->dev->parent);
> > -	struct rz_mtu3_priv *priv =3D mtu->priv_data;
> > +	struct rz_mtu3_priv *priv =3D ch->priv;
>=20
> [Severity: Medium]
> Does using this back-pointer inside a bespoke accessor bypass standard AP=
I
> data retrieval?
>=20
> MFD guidelines mandate that child drivers should retrieve parent driver d=
ata
> using standard APIs like dev_get_drvdata(pdev->dev.parent) rather than
> relying on custom accessors that use parent-initialized intermediate
> structures.
>=20

Hi Lee!

Based on your reply at V1:

> Either passing a pointer to `struct rz_mtu3_priv` as the first argument
> or adding the same pointer into the channel struct would be acceptable.

> Both of those solutions are better than the current '_->parent' lookup
> which when conducted _from_ that parent is just odd.

I thought adding the pointer into the channel struct is acceptable,
so that we do not have to change the API.

Does that still hold?

