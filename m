Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012033.outbound.protection.outlook.com [52.101.48.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2748D3A9002
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 13:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849968; cv=fail; b=jI2PhLhUMO1+pYSKNPyUICa274ssa8i8Oj2sXLC2k1lb3iVNQ/4f/c+Jx+k0TWRfm11TIePU3A+NgPQ/t2phZjgUjxUeh/S5GOmWl1HNK1NboVrGWYtq4rEqzTBuOEujuvgUsDnl0o3SRffM6T7diMgylferhB3MvnkkP0xplQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849968; c=relaxed/simple;
	bh=mkZsDbwmikvXsGqpyXt8HXIJ5RgjFm0U/e6Pyer6rnE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hkbW/w999TKxpx/DvgWIg3Pcml01vuFfKrm9PlHaet2YN2xacHSrGWUfUPxjJnn0D7nJj+OQjta6qG44R9rJtaBfmk3SQXhusTWxv/AwmexOBDu7yd++MP+KIm/pLAAA4DH7/adStygjz4BOpzR5sMTXNysOli4YlysaRcTDwXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=B6zRWi8a; arc=fail smtp.client-ip=52.101.48.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="B6zRWi8a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncNZCCs1RLIt08JcassQaZCMj2w96vhpfrZclVi1YSTPdZmL+T+YE180zV6tZnIls7OmEwvprqcExPfYewHnsZ09i1qeemRbSJR7PrEa865T+/5GecyXi+UBZ2SvjFeZtYnjgULzQRKJfeXrN9hTUurAx/1J5+5+aS09j4WszWa3KMcAHQHWo9dvgbbGEjvoFEAhsYuc3qD6kGSSoGcf+QZcqMCrgKh9Wm/Vo+ZF0PIah7BBCg6O0mS4uGt2Hw+hw95TWnOSMcFR8JGy+qneiIbgzaKY7vFCsJikSeMuYhp5FsOgzufB3U05AGPlxNtPC4GMnNUNX3ZJFac38i1m/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2brTbRrCj6YAuV17o/CgTqvNX2bG0NgFNwsAShyqypc=;
 b=jRPmjUkuwAnIWCk9ebW/Jg+C9qX8OY/BhUhLJzDH+cn6BpGqqcBaGZbVQhp/5XVxZlhvXPJ87kFunxb7XKR8LotUsh4t8tHrC+w9fiB7S5tjonfjMtA37AGx/YclksQk+L+OxNaO981p9HSjwSw6sus87Ei3KbNN1J914NaxdTahjdCrQTh1do+LmrboQd+y3CyRfnRC1fuyEOxdwyjHpa/EaETNlh+xrFrhblKPUD17L90DM7BXzOtB4H+BAKrSvnSRJzOuMBLO+frxaQg7/6e6o7uLg1zTJkN5X99yqg4kRKPNGkEn5sdfIAFW5T25l/mEDVHQoVtbAunM5zksrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2brTbRrCj6YAuV17o/CgTqvNX2bG0NgFNwsAShyqypc=;
 b=B6zRWi8aNo02OIN63M+hDXfzQNWfPfhHHwLkPGRCeEiPPT06urC4LZZmxDueW24NOD2XGeXRamCWjo6U4Fgc+GZ5mTyXxskFoN1PqX0mtar9dvR0zlM5WjQWtPYOUCCRG0Xpy+qXS16l1dy3Zvju9ExsKLxjPG3oQSW4/SttB58=
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com (2603:10b6:a03:53e::6)
 by DS0PR04MB9463.namprd04.prod.outlook.com (2603:10b6:8:1f3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 13:26:02 +0000
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0]) by SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0%4]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 13:26:02 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 4/8] dt-bindings: mfd: syscon: add ESWIN EIC7700
 compatible
Thread-Topic: [PATCH v3 4/8] dt-bindings: mfd: syscon: add ESWIN EIC7700
 compatible
Thread-Index: AQHdJBTLdl29zsq7GEK0VwMsc/o9sw==
Date: Tue, 4 Aug 2026 13:26:02 +0000
Message-ID:
 <SJ2PR04MB88964582060B8F7CCB807C3E83D42@SJ2PR04MB8896.namprd04.prod.outlook.com>
References: <20260804104431.1391839-1-pinkesh.vaghela@einfochips.com>
 <20260804104431.1391839-5-pinkesh.vaghela@einfochips.com>
 <20260804110206.E4BF31F000E9@smtp.kernel.org>
In-Reply-To: <20260804110206.E4BF31F000E9@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=69cc34fd-3647-4938-b50d-bf55b2ba6f93;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-08-04T13:09:28Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR04MB8896:EE_|DS0PR04MB9463:EE_
x-ms-office365-filtering-correlation-id: 54bda5ee-3235-43d8-1089-08def22bee02
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|10067099003|5023799004|11063799006|4143699003|3023799007|4133799003|6133799003|22082099003|18002099003|55112099003|38070700021;
x-microsoft-antispam-message-info:
 KgzL6bd8tDdR/S9Y2YaaBsy+jFwNxkM3iMJeYk/ipLLh9ooyz0sxyxIGETUqt4fgRhvFbReQ+e8hQN189kICCrAbRlpqoluU7Y0yraCiNd0hKEAtUSI6RLB6T6eOXQj0kXnv01iAZowmdvh0V3xYsmm/3LhKnMQYSYNun6OXZqJkmSHRZjuCanr/HOgs340Z7Rt5JJgGg3776AonB0C33WsRFShWhgRQ1stFMVJDzjyuqnujokjn9JykxcF5ycJkMvy9SaybHCY8ATv0atqqj6xx8x3+RMPBzGmgD9tea26Jd1MdGy4S4u/cmJnPH+LZi3W1pE5Rz2Wxbm7o3n2gy01zN11T8ZqBG0+nW+hQyYTAussZ+oEPpQHe02EJbde2MFj18wXVI6GDvoFGtqbGjx2woyiERk8mTKfMTUANdjMTrZPFOJ91Bcyq5ErUGQJ+X2B95ZWPT4pvf+oeYx5YVdkBHU9Lm2KBEMZtoUhildSm8aVSZukSoVNVbnFKDftEgKnH41RDEOHQMAwyQvT3cHFMCDc+cgLx3Wh7LEabsBizsAuvUsV0w6E4BiGk8HKCNP+NlBQcxq9crh0Q/NXZz0YG0e3/0/w4CsjzhTRWpOJC+gjnQ7Whk1o7G6jZZTNFOJT7KV9DBhxz1gJKzTfuqGer0ibV/68Z6j0HhLFI8hzCDIZMUPzlOUsAOqf7Iu5GEKAZG9mlSzmPjHDTL7qh21p8wKg3yH0uTuqu3ntDutE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR04MB8896.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(10067099003)(5023799004)(11063799006)(4143699003)(3023799007)(4133799003)(6133799003)(22082099003)(18002099003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lA3oP/s7+6uE3SMImT0ize6GpAGQ9FVa0rZHAvFoEzUIsLbPvyVEDkh7Ggur?=
 =?us-ascii?Q?5MIwzHrx0HxzwVpsjpn1ZsI3Bt4x5kXca/R6TaftjqrCTO8gpSibZ+PCO2gW?=
 =?us-ascii?Q?aNpTSyNxaZN8wqYeY4wVIgycXgv/AprfnCnPwQ2gaZzYYBRJ6j5rEA2YKXzi?=
 =?us-ascii?Q?J3/QoVFveXuM8Ciza4RN1PxvlUZ6KlEw4k4HyQT4xBmLyAuMmkr2W1wapMou?=
 =?us-ascii?Q?Ign9uQX+GsyI1udinb7VA5t6Ed/wkxGVOT3BxUsa2VX79a0lXaxBfMqXeu+h?=
 =?us-ascii?Q?SLZz5aLHl7RD8Sfy67MPsCLjbaLs14hqtwzr3mUBYIrcqo4cJEDym7hLbkZn?=
 =?us-ascii?Q?zmu4XxvtYcPwCzU1vEuBHpD/6Xd+FkmO5FblWKPwrMV+lpQ7jw0j4RXdE2YI?=
 =?us-ascii?Q?0yZgfYXsqac07+ttEZQEUgnTQiCRIsteGC452IuQgbmwjltGStYGqCczVkdz?=
 =?us-ascii?Q?1Rzhx7eTn8/iBTUK0VC3kiZXWkXMadwTl8NGkZEXmO/mEv8/dumIpFPR2uKr?=
 =?us-ascii?Q?V+qAMfRJ1jZQFU4ZvOnzbDG1Kmi4XwX9Cn61xk6tfN4QNNZyOhlaiaoewstn?=
 =?us-ascii?Q?3V+YOYGSJjLg17YDmPbZlPwXWgICbsbeo8BnJB3kY0o3ZPKtxk2raNHlxX2a?=
 =?us-ascii?Q?lQiM+1IGiguT5F/whRwVGPaaJMAhoIiOSUE3aZY8oishAYqSiPHUJP0CQWab?=
 =?us-ascii?Q?wPf5KfxlNAkAr2IM6ep/JEBX6f0UhZo/jGTK9CvYwvUpXSTIGfXUuQHgRT9n?=
 =?us-ascii?Q?YVFTUpn4NC0mwNl4ouD5NTodqUPZnAMhjtiGuCMoySu26iJRwPzYAhOaUFdx?=
 =?us-ascii?Q?mLUwBmLZN7M/hcq6rXyRDS6jLI6lfZ7kN7L6fjO7VO41CBamH8pzc0NQwfnx?=
 =?us-ascii?Q?J+km2P3TGJgcdai7wu/461CdbjDezi+KcyMKFbvVuGCkJML2cEfOfuynA+G9?=
 =?us-ascii?Q?DsiFkmpWxmD0jS8/fPdw+De99Ik2Gu8hr+jW4tYiPeTRAKocMLVxkBDFvMgN?=
 =?us-ascii?Q?fz3rn/bFokrm0rX+PPanMvOA6iH9W3wQ22SA0lYvdBpD1S91D4AdVlQ24j9b?=
 =?us-ascii?Q?iEv0fHO9Xkm9T9bdjyG7b0Mx3zzwt3TxiJCkeOQslgWyRZ02mEboD/gUSc/L?=
 =?us-ascii?Q?4t55L3Seb+R6FocUCM4F36e4lHrsxzRGXilun0Z2Yxt6/7fjO4eRHK/xM2yq?=
 =?us-ascii?Q?4h65XFeMaJjF4fqgcf42Ms+I7qNd2nwL7MqXXWsGEIJXWz4M0wN4Ha2oFqe1?=
 =?us-ascii?Q?1NsIqbGNuRYL5OHY9+9RAoIknoPjcaBk8PDXWCSvi1cJT/6a+41xleXdqptJ?=
 =?us-ascii?Q?mHshLzYSbUuThXbknxwEAD33L/RWrQM/LYYdNyjqO8FAEK3KeuKl2CaA8+ef?=
 =?us-ascii?Q?9ZjGuJFAneFs39rOYL0ZTbpOfWzrYhGm3es5MSUdrG8L95wTkIMIQK5ivQEM?=
 =?us-ascii?Q?4FszeHf1pNTvHr/AWW70mG/zxTGqSCbQJ1aZlXrwSMrV9z8tUyYKNjOn/+FZ?=
 =?us-ascii?Q?JHVZN+yQDoJFeT84zxRfGlnEWI0rDDc36WYO7IjAS9AFhESNhh6TnySl5NgX?=
 =?us-ascii?Q?76+IGlcQE0k0YKtyudgTApKPA32uex2TisnmtcAWmGVQIG2CDpm+z3C4+f1q?=
 =?us-ascii?Q?8P6wM6EgUVDFgvncz6cRA/5WOydoS1BMTRLEdSVbsUQYYnuG61gFdBcNTjrH?=
 =?us-ascii?Q?J4aL2p8fHUfWCjmmvSoHcSWp2EZR+dyM9SPktWy6scaJwGSR5dVbQKbSRaca?=
 =?us-ascii?Q?sbHI21XmKfTITHaL4RWxYw4AeuIZ83I=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bda5ee-3235-43d8-1089-08def22bee02
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 13:26:02.3156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FNaAncm/n/7S9o+k8L8Q/VAkAtFJjvr2dk2Cn1l942cs75BBj7Rr4ZGI6yHv8oyBwltkChL5KFlL9DJA6XJdcVkIkdeZhNvfLRnv8fuhiLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR04MB9463

Hi Sashiko,

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s)
> to consider:
> - [Medium] The new compatible string 'eswin,eic7700-syscfg' was omitted
> from the 'select' block's enum list in `syscon.yaml`.
> - [Low] The commit message description is not capitalized, violating MFD
> subsystem guidelines.
> --
>=20
> --- Patch [4]: [PATCH v3 4/8] dt-bindings: mfd: syscon: add ESWIN EIC7700
> compatible --- commit b6fbe8a9c92251f8d7a4c290284000e71004ed87
> Author: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
>=20
> dt-bindings: mfd: syscon: add ESWIN EIC7700 compatible
>=20
> Document ESWIN EIC7700 SoC compatible for syscon registers.
>=20
> > dt-bindings: mfd: syscon: add ESWIN EIC7700 compatible
>=20
> [Severity: Low]
> This isn't a bug, but should the commit description be capitalized after =
the
> subsystem prefix to match MFD subsystem guidelines, perhaps using "Add
> ESWIN EIC7700 compatible"?
>=20
> [ ... ]
>=20
> > diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml
> > b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > index e228670880631..2bcaaba6948d3 100644
> > --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > @@ -175,6 +175,7 @@ properties:
> >                - cirrus,ep7209-syscon3
> >                - cnxt,cx92755-uc
> >                - econet,en751221-chip-scu
> > +              - eswin,eic7700-syscfg
>=20
> [Severity: Medium]
> Does this new compatible string also need to be mirrored in the select bl=
ock's
> enum list earlier in the file?
>=20
> If eswin,eic7700-syscfg is omitted from the select list:
>=20
>   select:
>     properties:
>       compatible:
>         contains:
>           enum:
>             ...
>             - econet,en751221-chip-scu
>             - freecom,fsg-cs2-system-controller
>=20
> will older tooling like dtschema < 2024.02 fail to select this schema as =
a
> fallback, which could silently allow invalid configurations to pass undet=
ected?

We rebased this patch to linux-next. Since custom select is dropped in patc=
h [1],
we don't need to add this in select.
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/Documentation/devicetree/bindings/mfd/syscon.yaml?h=3Dnext-20260803&id=
=3D6165900f3922f923bb363d58c2893005d26d1b30

Regards,
Pinkesh
>=20
> >                - freecom,fsg-cs2-system-controller
> >                - fsl,imx93-aonmix-ns-syscfg
> >                - fsl,imx93-wakeupmix-syscfg
>=20
> --
> Sashiko AI review *
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsashi=
k
> o.dev%2F%23%2Fpatchset%2F20260804104431.1391839-1-
> pinkesh.vaghela%40einfochips.com%3Fpart%3D4&data=3D05%7C02%7Cpinkesh
> .vaghela%40einfochips.com%7C0ed0a6e6a57f412e089e08def217d38f%7C0be
> b0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639214381360842991%7CU
> nknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
> MCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C
> &sdata=3D3EBV%2FOCsfYO41uNqK4URl2MK8gMPfGsL80nf3kE1WGs%3D&reser
> ved=3D0
