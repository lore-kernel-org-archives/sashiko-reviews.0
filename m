Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF93472795;
	Tue, 19 May 2026 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183755; cv=fail; b=ETrTc/Rb5mmytssxTflWbRPtp1Jg6Vt96cKT8XUKCGvBmCoORmK/7af7aKdiu3DN+gmi9sqSuwMkToiez4RuRPEqLKwvscNKuKK5urVCo/gNrb5IwrWYISXq/WP5a1JV+NlQQGzzUhFvcBqr+1ZuDMOeI7aFHo0erkEvprm/zTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183755; c=relaxed/simple;
	bh=oEdrrVFW/lXfFQPNKAZCHMtmFXWcWY5oeDTHCtCUgrQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lmogeMVYvlsA1cx5X1pTeeHQBQCvb7UiKvbzP3lTLzoL479n9xcr/n1nUJckc71NT5pAcz0g1uC/HdtU9PFtytSdAcO0OUl9Lyl4MLqmc6XE7+nhBJJikxjJJXg2OQLaSBqAi8Q7JhoLQJWtrWfiPCPc7wHEAF0bPVCEocMSLrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YYXf1Is8; arc=fail smtp.client-ip=52.101.66.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YYXf1Is8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmNMMor/Zpn5gNSIVRP5ZPBzz3oEa/yEcAff+01khQTEZRwW9v4cjeEOGHTCZJ8nuYPmuq/FbQO7h13f1XCMx+6mCTQDXqYdHoy5Kphb5zhsHHGp9+QimbwXd1+jMfK13zjy4SNRemXCq2wr2DnnE35xuxxLLYhmhdPT8UFDNEZvChknx/WfLT837u65XQpVXPsoDk81zNz3F2gE6iFXdqa20FPzt5Fn1Y8hQLcriXLhZdKxTE2mt5zv8ESQKLhJeEKOerDxgJCHtTPz8wFdYsinx3urvARUjn8XZz4QhRt+Tm1cQ4t8FMzpGasKxjZH47bl0Le1KAroaWjdXuhhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNI7xEV0hmBydDZ6QJKYQAWrnFLk2oUZmI3Nvqrum+k=;
 b=YmpJYKT26ZG59QZwDsb4eL6guUHb9gRaA+u1L5BKawuEqUHzUn4ff8rjggRj9e4PP2vh/GvyqIhLNIplyDBde27kLvNGhC8CF2fDzPAdXQ5zDEyU1+JTIWvW9zopoCw9BSsMO9hKw9SVCmxRCBDVTOp/a4FdhvjIsuab059oooCPjRjVk4ZTc8mQLW9eaRKUz149jLmkKAF+CCPtAv9J/pvInXeTX49UgKFDFHWQIiFtJupoPu6ncUvJPhgDqI73lOKyVplf2MPomJNHwWef4uPI+vKaEMyALA9msMCH+1ZQLqfBbUzgP9cX1Th0c9OJl7zMl5P8EtRrg7BILmTkSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNI7xEV0hmBydDZ6QJKYQAWrnFLk2oUZmI3Nvqrum+k=;
 b=YYXf1Is8CilGAOK5bVM4EIk26w8fxceC/4QkgNuaDwUewbIee9SYQIwOZXETHxxUaMd/lV6V1bngRkH1e4/F0FadCUZYSNQA3nlfWba2lXdkDV3IBAg9ihRwFdoygggzIipm/2ZuSvFvs/ZhRvMxf1wKJsi5AItA4VPASt1xk7UCsi2MN7RWnY+zoug9mxAScdQyXD9JhCEFu/lApSs7FTsKItugsA3CcXjII3di2z9wftOi9kwIauactUm9aIGTd4Fv5TVcC+pFhfks97Vg6d7tbD9urTU5c7XAjgjjBmOQ///zN75Avy7QKSBgvrOjzucv8nUlSJqqjjJtXFITcg==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by VI0PR04MB10566.eurprd04.prod.outlook.com (2603:10a6:800:268::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 09:42:27 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 09:42:26 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v8 net-next 12/15] net: dsa: netc: add FDB, STP, MTU, port
 setup and host flooding support
Thread-Topic: [PATCH v8 net-next 12/15] net: dsa: netc: add FDB, STP, MTU,
 port setup and host flooding support
Thread-Index: AQHc5p/H3dTgL/lvskKS7KpgHtIEg7YVBOUAgAAUFcA=
Date: Tue, 19 May 2026 09:42:26 +0000
Message-ID:
 <DBBPR04MB7500331ABC1E83C8F54D375588002@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260518082506.1318236-13-wei.fang@nxp.com>
 <20260519082538.B0919C2BCC6@smtp.kernel.org>
In-Reply-To: <20260519082538.B0919C2BCC6@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|VI0PR04MB10566:EE_
x-ms-office365-filtering-correlation-id: 7574f0d9-53da-48a5-cc3f-08deb58aefe2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|4133799003|4143699003|38070700021|11063799006|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 eXzHC53uA1TyiY0sREIj5TfxY4z5eEcKBO4A/rGn1p72z+mPFYFctrF/ZfdxAbIveyJxdh3BSJaN0qwmHkH0603an1aenaVtM52H3mcTtjH0qpibXvEnrx0sLHJ3QDEqTNtKm6RCTVUOtZ7/a4ivwqVkb+dtKl4ej2WaY8gib76jNQLYuUumt9k6HfdEAGBYO7YCwrpDnR5tpcHAc6ZZ3zWZuN6/iwzjiILuobc4ahPSITSXZTVwb0t6P3iG/wjS5qMLXW6zh9FE9EghmEtS94pJkCpZdZJzoMHjrsEC3ArCkNxPN1oF6QJI0bybT6qbU0FKXCplSQKHJvstRNCkIasafz5X8qzKjjK311NgY9TD5LRhzB9QdV8BCQwNQ6ZTetcMH099J+ojAEji/8aKbT/EX2hcoF3Y2sOV5eP5ceGucxzQCWUKtxorV+kRYr2xaSHpOfMTHLYXqjnRlWor8OTtTgpi+a5ASnI4KyiHFjLUPP6mLNq55WfJHvjlCMjDpsuaG7+MYpS8rp025flMNGao0BmyKqwEHA7FCDIsBF22QtgPJyyyEfzceAnNrYRfpBsVCpt5a/ORb/q4Vi+w2seHQPEzd42h4LA75pECuWzlB4cEFsexOGll2rKb9PgE1Ft28F9oNsrDluHILNHM2kya8UBLo9qQBRava8OuemhoxhWTkJ/strVr/U7Qs4KO//FHdAin0tu1uHjs6PG9sw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(4133799003)(4143699003)(38070700021)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?H3aOPwb8INQZC3OCpGyyUEvMkI7eISKa70TpvzZi3MhU1lbRJmfvf3mBXwgi?=
 =?us-ascii?Q?H/Dr5KABZ/IPAaYulHOhqRNXz/0Iu9X1Z1hA27/OlmWgnfSGJl0cFwMNPCVu?=
 =?us-ascii?Q?p/N+H34RRp+MFbf4Z9VIIgAhf/Q+cHFkEhxn+pikJqU3+aL12ytswticof9v?=
 =?us-ascii?Q?z6uXQrojabmzReuYWJTWK0JQT0LkocNdKluLKqtlu3hx7RFoMO6voiLDjYPe?=
 =?us-ascii?Q?dLRarWLnYsWohEgK/hgVs2rfZ2YkcLsexy7kWhNBfL10R55qzlCsRlhhW2hv?=
 =?us-ascii?Q?Lf0sNzztRsrJZvPTPRkyXI7g3GE67zPRUqNJbk7W/9AzxJmMq0vKWh18nPyS?=
 =?us-ascii?Q?jHYWcRB9ENueh8AlZ7h40uPBqQo0vziLzhzVcyzDrvtrqDnNlJA1gNmj6JKy?=
 =?us-ascii?Q?mZunwrDPrJx6cEGbcfKbD/yPS/Nb5JTdekhA22gZs5pss9/FWxm3rFFHNnMv?=
 =?us-ascii?Q?FQULrKTAAkT4cGDqx8ymY6q2joP3N4TE+jzqeiZ5vfwfGv4ZPRk+pzAOR/Nw?=
 =?us-ascii?Q?WW0raOyfB0wVjRl3bBDu0AqWCCQduQ3pZwe/zXJZsSbN1aY4REmJ7jzk4384?=
 =?us-ascii?Q?9HXXbEuomcyMmm6Bs6QBVsBb7Qpoxqz4GQfY6gCC2fEYQ6V0o6uOqqm8fBw9?=
 =?us-ascii?Q?1cmyCthehOcvJov/fj42lTTowyeQuxNpAL7Qwq0godzqzdRbuuXPOOUCA35Y?=
 =?us-ascii?Q?G/qXIo9aYdnJ6eRKJvL8Jl8IDxcpFs+sHx/FIbJWc7NPmDz0UlU4hSG5802X?=
 =?us-ascii?Q?ihc7tNsA690j1idEYZSbBEp2Igga5733KmggV6MaNfpx2TIgwYsrRMi/wVGG?=
 =?us-ascii?Q?NqZnpKFCYTsxJ68/dIuSQES2oFruM7TYNEBLFQXECVHSj0OUjokSC/HYKTJw?=
 =?us-ascii?Q?PGEoGJIkHkYLVrtzRp12SHM5sVrHJonbihfhm8L7jxOwhfPEvNQYM9Ce4SJL?=
 =?us-ascii?Q?QqAb1PgdRp6pJqZzLnUvjt3MHzfJGvhTZlxBF4GZ3n5kMN5s9C06tzQuwvBo?=
 =?us-ascii?Q?jI2yVauOjaApQHiMPEsYJjZJg04tmGylu8vGWEWJHi23lkV7WcRxXnGjgyfo?=
 =?us-ascii?Q?k46VqYqG0Y5KV4ejFVtIPpMcXWLXkffqb9UBM+V9ZeE+rIWy+giQn5bB2xoI?=
 =?us-ascii?Q?5c4jovRh47bvJE+viEGvo29XOXtejud7hGgES77pNWheDGPOBSheBXK3PeHu?=
 =?us-ascii?Q?57Z5BuYf0TZNimmmObEitjMk+QhSNZ7yIFQtWMbxpW3fkfmwdryBKN9umHFa?=
 =?us-ascii?Q?FXIfuqlcn9QWP/MshKuke/Cb/HlYK27G1EMFGS8AoNfAnHO2wJhIOfpGD/QL?=
 =?us-ascii?Q?shaPqqGL9LmVnc2Zh4yx8p+snYnYSeQhz9ggcIIVrEovRFZ+USxoXYin6Cvb?=
 =?us-ascii?Q?c4ic/EHhkES833QsJmkhtpCYv14Zxby9U7CbXzlWGGdT9TGRx4haX3tMeXqi?=
 =?us-ascii?Q?59RWGmmnPhqTJBHnvjEySewuJ2Kz34l3r9sFJ6jSD/eM+F2w5OfahzjltMRS?=
 =?us-ascii?Q?i3UR6ikjkZaKfmkJiBd5YlwzwexvSpFcshSzrdVWmMLwhm+G7e/7MwerUG5j?=
 =?us-ascii?Q?OXdOyXywhsml+44+DJkBFtRHSM1nv+lFSbCJXcQymPkhZpVh2KJayp25A9n/?=
 =?us-ascii?Q?tsQPKgH9Z2L/3rhXm74Y9FbXo1xA7eQDlW/oYHXCXw7Thpd02qzhcPqNzr6M?=
 =?us-ascii?Q?8CmKDe88KW93+Q75jLblMk7cMD269ZzKUbBpTQ1E+6xcR5/b?=
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
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7500.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7574f0d9-53da-48a5-cc3f-08deb58aefe2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 09:42:26.7481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YT2DoTQtIL7vXFARZ8Kv5PuefM18jNOLzGMPt4i/3shcji6nAYUScUJmrpiqiXVopoMTzay6P3cjVYaNnauFmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10566

> > +static int netc_add_standalone_fdb_bcast_entry(struct netc_switch *pri=
v)
> > +{
> > +	const u8 bcast[ETH_ALEN] =3D {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
>=20
> Since stack-allocated byte arrays are only guaranteed to be 1-byte aligne=
d,
> could this cause an unaligned access fault on architectures that trap on
> strict alignment?
>=20
> Looking at netc_port_set_fdb_entry(), this pointer is eventually passed t=
o
> netc_lookup_fdb_entry() which calls ether_addr_equal(), and to
> netc_port_add_fdb_entry() which calls ether_addr_copy(). Both of these
> helpers require their arguments to be at least 16-bit aligned.
>=20
> Should this array be marked with __aligned(2), or could the code use
> eth_broadcast_addr() instead?

The switch runs on ARM64 SoCs,
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is always selected
by ARM64, so there is no need to align bcast to 16-bit. This is a false
positive.

>=20
> [ ... ]
> > +static int netc_port_add_host_flood_rule(struct netc_port *np,
> > +					 bool uc, bool mc)
> > +{
> > +	const u8 dmac_mask[ETH_ALEN] =3D {0x1, 0, 0, 0, 0, 0};
>=20
> Similarly, does this dmac_mask array need explicit 16-bit alignment?

No, see comment above.

>=20
> It is passed directly to ether_addr_copy() below, which has the same 16-b=
it
> alignment requirement:
>=20
> > +	if (uc && !mc)
> > +		ether_addr_copy(keye->dmac_mask, dmac_mask);
> > +
> > +	if (!uc && mc) {
> > +		ether_addr_copy(keye->dmac, dmac_mask);
> > +		ether_addr_copy(keye->dmac_mask, dmac_mask);
> > +	}
> [ ... ]
>=20
> --
> Sashiko AI
> review * https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2F
> sashiko.dev%2F%23%2Fpatchset%2F20260518082506.1318236-1-wei.fang%40
> nxp.com%3Fpart%3D12&data=3D05%7C02%7Cwei.fang%40nxp.com%7Cd4044aa
> b3e6f451c87c608deb5803635%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0
> %7C0%7C639147759429810177%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1
> hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUI
> joyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DQfR3ODqouHoPZbY1a%2FoEkbKrtFFs
> H0AwBO2sDlQWyco%3D&reserved=3D0
