Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010058.outbound.protection.outlook.com [52.101.46.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8B53DB31B
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848643; cv=fail; b=ZDwIP9nxNd9eTAOGsgeCeGG7ngTNSnVWG8I5xZJqg2zfcPJ4RabZZcHUijrTi5D2BZgXFoEhSUiV1zxxIV3T9OEETqRsB5LW/ce2NeFFZAhUoL5+zREIf/rlYUFsCYihDp0O015Sv/XTr/QyXaSQSWovW5XOBZvcXbP0byML4Vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848643; c=relaxed/simple;
	bh=iTAIrGoqvlgx+AqTMTyxG+MtljubDUbngZD/NL2NshY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GYAffMJ9tq7c/8VWToRbl/DI4RJ4NJ/bqmU2VpZoYh5RtRd9fZLPTxgajlcUhdekKFq51ikL5FHHIs0s55441X8FzbN7BIBSoqTcno1hUaEgvbZ1FjEs5jjXzJ139C88XMEabktBRLRrTIGiO0fmnKHPix0Qdx9gDSERcUcWQq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=YLHhXzGQ; arc=fail smtp.client-ip=52.101.46.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="YLHhXzGQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCKwydNLFZPEa9KP6O9KzPD2r+5Xtmd/6fqhcbtgRAHnM5eDuO8KqQhqza0qxJshPfzz05faHRFvAoqNbLZBPkTMlImyn4ArAnHtSshlemFHdvP3N/7iJqpY1krW+Wwp2UOfrgziU5H46za/PdlwCSuJDY1pf3DlQ3C+dH5+yGJ9m4pnS7kVmxjn8kW+Issx9RRlhFtIU2KzRxoaCXTczkrJLPVOdghg2rzp1gKtNvD+RC6638xkWcqNHvR3Jzp/dh4MJ40KxgUmZf5lzK/LGfqsLfk6Xqkn429l/k+9iSOznoGFWkIvCACV+6E8OymhKweXJzPQmRZvXwyGLVHyXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AynLX9ORB22jQzazbW+mlHMosBtuM3h99INBpIymW/o=;
 b=MHnLUiKJT71pRh+PnpjItxFPePpK+0IIHsU9TChYFCqqK+y+aXJQFRvyKesA4Z6IlbUWoIYlKPL0LwttEj3Olh/OT013CIhNkhhSr4XnCRGNhLMkF5IFeQ8EIpZBhduIhNyYd9ik3SVrR1pAs9VKgwRsRqzvL0wLMPa5Np3savet4V0YBFRNy9TRzlQX+rTWlXaOYLe5DJHxVCfp11J+o6zPofC1BLlZnvqMzc+cpoOuZQ1rPZYp4eIS006bIYZGTs4sRgrCOWM74Xl8nuAmW1stYCAR6EnTVgqc4/iitigYWvFnDeG/y2jdli0dNoqyOE2Zx02z2pq1chtUooHqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AynLX9ORB22jQzazbW+mlHMosBtuM3h99INBpIymW/o=;
 b=YLHhXzGQIJx4F3YoOXA/4VPMtlvlTMGSpMY2fvEEKGFFbxA/Apa7LLvfRQcD/FcHpEc07MD7mUmSXsP68y+xE9uMMZsjDKI4Yaf01MB6wub4374NGqsy+KKiAEzu38phpJTRJdxq8UNXPBAQgXo3B6EbjMIlYV0gO88myGYoJLA=
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com (2603:10b6:a03:53e::6)
 by SA0PR04MB7146.namprd04.prod.outlook.com (2603:10b6:806:e3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 13:03:59 +0000
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0]) by SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0%4]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 13:03:59 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>
Subject: Re: [PATCH v3 8/8] riscv: dts: eswin: add watchdog support
Thread-Topic: [PATCH v3 8/8] riscv: dts: eswin: add watchdog support
Thread-Index: AQHdJBG2uC0ig5R4SEKg+pdtXr8SNA==
Date: Tue, 4 Aug 2026 13:03:58 +0000
Message-ID:
 <SJ2PR04MB8896E2430AA6A8E96D6787E683D42@SJ2PR04MB8896.namprd04.prod.outlook.com>
References: <20260804104431.1391839-1-pinkesh.vaghela@einfochips.com>
 <20260804104431.1391839-9-pinkesh.vaghela@einfochips.com>
 <20260804113419.EF11F1F000E9@smtp.kernel.org>
In-Reply-To: <20260804113419.EF11F1F000E9@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=e336c4e6-192f-4f0d-bb5b-943cc871334d;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-08-04T13:02:41Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR04MB8896:EE_|SA0PR04MB7146:EE_
x-ms-office365-filtering-correlation-id: b0827efb-b2f3-440b-e44b-08def228d94b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|38070700021|11063799006|56012099006|55112099003|18002099003|22082099003|4133799003|4143699003;
x-microsoft-antispam-message-info:
 aqUSNF57t0Ha9dxcr6IwUKC1U+/bv+7GsktWIrKI/OU9kRrrtZk5N3WgPgJK/v4iamXBGjtV4FFa++cvRcbJpiX5xBgwhj5nnUguHn9gcb+JfFJ7Amk5bq57iX+E9z9QsZJOzZlGyhR5s25S3dFloaf9P0lDYZ6ES1yF/+mC8lBFisclwxQgKwNejdI57fvp7V3VRD30I2Q970E5IpMuaGJAOsCmRMnOODJmw4tAhmpUihlNLqts/OR5bBfvqzVDE9QzmSWXD51verhWjOFOtnyDovPIhhQTvz2l8lQB5SVN4/wFWqDvRel1MHFbzPdSZ/FVHxBKu1BDN692Y7Mv0SA812ykdGw7eYzQJXFjZ5p+7oCrTnXRqpHIowq9oo0Bn8D4hcGbdn+bDQVtT66ZCiiwoMQ0tA7AU37axLgdxfckgUKVmj7+t9lnHDWArYo029kFyqrTjV/KX/3zS3uRWXapQy8N6y8nrzLcCtL0V8AB/PnaRuzs5/riuKI5tJJmIBlDq8i6+lg4Y/fUSDGgTFikiXvMocXBA347wqCZSi6766K4fEc4lxsIebfm6PDMZSHDAwNcm7kfFzPojYvEWQSqufPhZLk+SQ8lJfDN32JDYA+7lNG1CR3GrWiUnQR0y84n/NsCEdUgCdpqKJSqHZ+GePci5quMZJ0FSPtAPtII13ahKd2O9Y4UZUloiU3/8vlt1bzHeOaB5mVR8y76hd9Iohx152L7fxKz+VfmujE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR04MB8896.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(38070700021)(11063799006)(56012099006)(55112099003)(18002099003)(22082099003)(4133799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QEN+hEcNjvj2us43GKdKND2jRwNE/lhushqxXlNkxdToCt161LNKPU7k7sZI?=
 =?us-ascii?Q?QsI3N9LkFk8QG/n5NsPraaJ+vqI8VzONVKVudp/U70yyunc/5GfoEpr6N366?=
 =?us-ascii?Q?jd574sjLdL5dY0pmGTmXuVnEu/cC9vDd7GvNRq9qtbNC0BlyD9M0y7/bCxFx?=
 =?us-ascii?Q?BD3bY4fENK4Kk71n3XOEacw7y6B/eQjiPeQKjJOQ+Wgil25mGzjtCHNEfZqi?=
 =?us-ascii?Q?mmyLVSs2xhpUUV/ewjleT/qOyLfuwP5Yb8c5A2Ck1ZM2fvsDTTPexPt+Qq1u?=
 =?us-ascii?Q?A6Y1tXhuadT/7y0EtkDOt/rJr3i0i9WYW0ykLxZqcbv5p341x8jbYmxNr3yy?=
 =?us-ascii?Q?ZtujUVnj4vEPYMHpNf3jw3NFGN5IJdzaL/9IrvJPSI361SLSWD6PRi9ytLZF?=
 =?us-ascii?Q?fFnFMTLGJle/u2t3GStCP7a+Ba4oK+Xpc3ubZVxG7Tx1Pk3yFt1bysrHBPEc?=
 =?us-ascii?Q?Vrbgz6Hn/iPgL9XDz0zzcPd8cw4br7cJe8nibw3pK+HvfzVd7BWm5epGXjeU?=
 =?us-ascii?Q?9DgVwUufdEU0eN7JpzywM5xW76hBZZ3Ck5BLvYEZNQ27g5Hiv517bO9WLcQ2?=
 =?us-ascii?Q?Dq3uEr0vM0rk/cbYhFN2Z1sMScmuE704FiY9mxyCmzFkrcW7/MbykySNoStf?=
 =?us-ascii?Q?0mrItQ5VI8nHr8FD/VywyWRo1lxJ4e0CfZE2B0nOWqlTUTIrUJXyKW3PDam+?=
 =?us-ascii?Q?5DzCsrdCNU7vOXmPAPQi3oI8mN9+/u1kktg14sxhjASM+hu9GStXizrMZKDq?=
 =?us-ascii?Q?BvNcCZ4YCDdR9+mai5EAhTV1qcRHx6iRRUMsxjndYz+oWB6UUKmks7nYfUfA?=
 =?us-ascii?Q?mlCZ8CKA+rsrVLEooRvsQ1OM42Bnud0l/kt0VAcs51J8fNp3LgbOhrneda31?=
 =?us-ascii?Q?4FbdFdRyNQMPDgNli7v7hbWAd/Qe+Md/xS8eBX55tow03RwEkkVt9cC9IL39?=
 =?us-ascii?Q?uDadYADNZESjanTDfMrIKM2p1FHUMia3BqJM0LAR/mohjyNm5vDRGwGcH5LB?=
 =?us-ascii?Q?wk422s4ZCbqLQOeCPEDISLgkGPYbDFCAjcE21nrpD+Iedaa8qMenJ01LLk5d?=
 =?us-ascii?Q?fyY/1Gd3YP2iUXXE5LNHEwYdzJ7OGMe7CZHlB09eUN1yrUP9yn/xUQGZN8ku?=
 =?us-ascii?Q?jf+bOm41syvmGgG5NPyZFnx7cZHgs6V3VwVUzLBxTICa1hKnTbmd1Ub5BFYw?=
 =?us-ascii?Q?TqF3W2QI3IbQfYvySRFau54ohFmAkq7iwmgYctTF3kT5i4tYbjE+7WYa0Gle?=
 =?us-ascii?Q?jkhzNiZ3ynrvXraZ5ZJvRGqur82C8H1qDG4QG0h+Tjb2gQaDFy4npBVC/MEQ?=
 =?us-ascii?Q?84cGEHmADv+9jfpL0oWbLrtSb8pvCSd3WY7jOSd8UEKhwu+LEQJCMcCf7xL3?=
 =?us-ascii?Q?D5Ci0JKmEYCHwMoiLAyfom+WCBHZuw1Gswuo5gXehwHHoS6W9FZU+8fRWDGG?=
 =?us-ascii?Q?IAZikW55PHMDQSnX0ceAa/+UXyluSIHJ9O9qvJ9GXUCHbhA7uWidmKw/oicd?=
 =?us-ascii?Q?PZBGJr4KvGrVAD5DpZtO66EoUkG0ocltS3XmbrbY6+2JDW51mkDftKd7mU3+?=
 =?us-ascii?Q?Wfg8+4VRMQKlIeXjbgZulqXKz4k3vhkFH+QYgHrDChtIaeg/URlEVWUZzxcd?=
 =?us-ascii?Q?fSJ+GfUf+bEX2y4MT/41rpVtv6FnHA0wdkcpQI2QE5w9qfGTE3MK9GiAEhRf?=
 =?us-ascii?Q?SD1ieI0CtWGO1D3QFobe5OeIxY6KOR3o4SBPUdk+SbO7bRjbbrHDyuoLZxMX?=
 =?us-ascii?Q?4T1Nv6N+xlfTCYx+3vmTKK/wFcKBYOI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b0827efb-b2f3-440b-e44b-08def228d94b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 13:03:59.0885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3KL9kuM1OUEhS7MvlEIE/A6N2JrDoUxYFZQZ9wMhgq9Lrj6ShBhLLrgHb6aTneel7PhmNG3RyuuK3zjA/sGtRWn0unNmPj0IeLc2YOOM7Do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR04MB7146

Hi Sashiko,

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s)
> to consider:
> - [High] Incorrect timer reference clock mapping for watchdog nodes
> --
>=20
> --- Patch [8]: [PATCH v3 8/8] riscv: dts: eswin: add watchdog support ---
> commit bfe09d553ee566b62eb6947526013fd32a57d405
> Author: Pritesh Patel <pritesh.patel@einfochips.com>
>=20
> riscv: dts: eswin: add watchdog support
>=20
> This commit adds watchdog nodes for the ESWIN EIC7700 SoC and enables
> them for the HiFive Premier P550 board.
>=20
> [ ... ]
>=20
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > index c13432d145042..f873e9eeb9290 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > @@ -265,6 +265,46 @@ syscon: syscon@50440000 {
> >                       };
> >               };
> >
> > +             wdt0: watchdog@50800000 {
> > +                     compatible =3D "snps,dw-wdt";
> > +                     reg =3D <0x0 0x50800000 0x0 0x4000>;
> > +                     interrupts =3D <87>;
> > +                     clocks =3D <&clk EIC7700_CLK_GATE_LSP_WDT0_PCLK>;
> > +                     clock-names =3D "tclk";
>=20
> [Severity: High]
> Will this cause the watchdog to calculate timeouts incorrectly or freeze
> entirely?
>=20
> The snps,dw-wdt driver uses the clock named tclk to determine the frequen=
cy
> for timeout calculations. Here it is mapped to the APB interface clock
> (EIC7700_CLK_GATE_LSP_WDT0_PCLK).
>=20
> Since the ESWIN EIC7700 clock driver defines a separate watchdog referenc=
e
> clock (EIC7700_CLK_GATE_NOC_WDREF), providing the faster APB clock
> frequency to the driver might cause it to calculate extremely large tick =
counts.
> This would result in physical timeouts taking much longer than requested.
>=20
> Additionally, if EIC7700_CLK_GATE_NOC_WDREF is not referenced here, could
> the common clock framework's clk_disable_unused late initcall gate it and
> completely freeze the watchdog counter?
>=20
> This same clock mapping pattern appears in the wdt1, wdt2, and wdt3 nodes
> introduced below.

Since the watchdog in our hardware is driven directly by the APB clock,
EIC7700_CLK_GATE_LSP_WDT0_PCLK is used as the watchdog reference clock.
Therefore, it is specified as tclk in the device tree.
EIC7700_CLK_GATE_NOC_WDREF is dedicated to the separate NoC watchdog
and is not applicable to this watchdog instance.

Regards,
Pinkesh

>=20
> > +                     resets =3D <&reset EIC7700_RESET_WDT0>;
> > +                     status =3D "disabled";
> > +             };
>=20
> [ ... ]
>=20
> --
> Sashiko AI review *
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsashi=
k
> o.dev%2F%23%2Fpatchset%2F20260804104431.1391839-1-
> pinkesh.vaghela%40einfochips.com%3Fpart%3D8&data=3D05%7C02%7Cpinkesh
> .vaghela%40einfochips.com%7Cfe48de46d29048e4790508def21c5398%7C0be
> b0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639214400661176845%7CU
> nknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
> MCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C
> &sdata=3DvO6SqAlUtK%2F7QM%2FaiH07F5SqH%2BmuSmCjoqk9FyHC4eY%3D&
> reserved=3D0
