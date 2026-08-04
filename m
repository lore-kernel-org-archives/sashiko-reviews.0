Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011040.outbound.protection.outlook.com [40.93.194.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD9E4477EC
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 13:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848832; cv=fail; b=keKewQhR9sIu0rLgnWEXdDaDJX99mzyWiPVvhG7ZFm5NaxELej8gntoGJn/LzRrvCDz2x9BuU3lWeRlBbpwAALj+NPJzjsfMfGNLYOje9WreYYRqG5eBQNTUJZiWTIx1XLPa9tRL/D7qlp4mo5pArb8ABwnASdzHl9S7YoR8xsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848832; c=relaxed/simple;
	bh=D9RUkDa3kJiW6/0DQ5FDAVJZWgvEMoMWNf8bHj43SmA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WicdN8jGOpM9I7iezAyhR+9kAF6GNYJq0gi7URMs552VjJAIcsjJpdb2/avj/RgJSNoeJQ43/tXnFyU+KlDOPu9gltFw+U9lAhANzPpjL2FJ68WocsffbWK3fF5IYrt8YDyT9e3nERNU/48sPpVqSKJfNRek/gp25DOAWrGRtVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=RgdHWM14; arc=fail smtp.client-ip=40.93.194.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="RgdHWM14"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vW1h4mM90TMVj+ZYfTinfgg+MtxHvbayHWRQQwNQACUvlLlog3Pmuh/Us+QWk/rt5OQErQYDbrWDnMle5ehE5AO6i7zq+9WD744Fvglt/lK4QjdkDbkQLupJjYBfe9RFKxAnWCyThAdfSIc/InyG6gHTv6XJwHn49CQdJ50cbwIF9nZHmblXiBetmDXRzhHOj2a3CzaA5mufk6FdoAzydnlhEe4ApfG72U4OgokdfoefPMl80XuKCSOGJIFECJYtnROqULKDU8phu5a9Ng7cifW+9OHWrRgsDl1N36sFX83sK//cLps2B/aD2lXKeDmUqdZaqid4yCkIjmC3N4AOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yqf4+poSMIEOBZyFYbDAdLKYkRJtjbXpIGL+19TgvBw=;
 b=I9w+vK+tGfL/ZPB9DopN3znbp6PkF/Y/XXLBg2Uw0IFCEgUb4CxMk9farDXCwBkluLyai4O0k46JvGCVS9t/d2MyAHfQc5NvWJFP8Xmifea1Rs+s3PUGf2zSFZpfaNnDbhDxxmcI1/cP/lgpoFN/dRWFJu44D6adkSq49UYrVy+fLPNheOvW2qDM5CmN1z5rhFIxb9jsA9ScFSoUHdMFtF7qwqRCSc98Rug+LoPTfWOd9CVpfJTXvWk0t5BFT+DVkbxp5yqAJ5HoN3fJz0Oe+KJqiYmtSSGiwH5wFLiaRUkDQCNs7e+D8DWl+OXuGy0395inJMvVBJboadsJScam5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yqf4+poSMIEOBZyFYbDAdLKYkRJtjbXpIGL+19TgvBw=;
 b=RgdHWM148Hw1qVexEPHpNvHU0lqWNnN4bPs7y3wAX3ZGa8tbhsdwt0EZBFpdmWlrDPU4zyN1Nqn6uRWq3lW3m3pgy4Lh48S33Hjp6CRRj/ehacJR0JogC5wC3BFH2pY7KRwaepIDh6J70qgJIt0r2MsuB6DY44trp6QiH7i3b1Y=
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com (2603:10b6:a03:53e::6)
 by PH0PR04MB7770.namprd04.prod.outlook.com (2603:10b6:510:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 13:07:06 +0000
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0]) by SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0%4]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 13:07:06 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH v3 5/8] riscv: dts: eswin: add hsp bus node
Thread-Topic: [PATCH v3 5/8] riscv: dts: eswin: add hsp bus node
Thread-Index: AQHdJBImSUgCwKHzVU6MhoVqNfl80Q==
Date: Tue, 4 Aug 2026 13:07:05 +0000
Message-ID:
 <SJ2PR04MB8896F33BC36482965EF1196C83D42@SJ2PR04MB8896.namprd04.prod.outlook.com>
References: <20260804104431.1391839-1-pinkesh.vaghela@einfochips.com>
 <20260804104431.1391839-6-pinkesh.vaghela@einfochips.com>
 <20260804111221.261071F000E9@smtp.kernel.org>
In-Reply-To: <20260804111221.261071F000E9@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=75c188c1-cdef-4655-86a7-f241b213ba10;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-08-04T13:04:14Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR04MB8896:EE_|PH0PR04MB7770:EE_
x-ms-office365-filtering-correlation-id: f16424e5-5db8-4652-e01b-08def22948a4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|56012099006|6133799003|10067099003|4143699003|11063799006|5023799004|22082099003|18002099003|55112099003|4133799003;
x-microsoft-antispam-message-info:
 IOwf5M1mI6XtQu+u3IT8U1m2XrY9KWIPleWNOuj7qIvWqkIVcpkzk6sGvmdlh1U3UDnMvNdTb2kGOsVGnb0hZTMp1m1vwreRbxSjJvK7jPMLfzn7lzmI19KqBUPbKuciIT1XDEl0X+Sav4/Y2TYzGhUUUy1JVgmW51W9QsLUKyp1OFqLjcJKgmArbswKhm13Y6MsWUkcOeLRtFZDBvVCFcoQ7hSXi1f92xjhjQ/eJLfem2sCf+ccx90gLvvS27CjjjAU8wUXnI4P8KpVKHfLStuONCI41SH+LOq+FBRUhfLWeM6CH2igGmTa86D+2iT0wCW8tusijdZQfSSkAneWc6cncWklijYDv5hr92/PRRZhK5O//if6DB7WZ42qEmG+fbgKGyhXQQeURXDpYhDmi5v7oOK//8EdKT/FN2/TCqfr4yhMGa9+pqRAWj7Qz8QyHtTLTY/LrUIZhtVSgOd76fBA+ZRdUkc0socfn4VH5jpjAajAcSXfhIBcdHuKqcOUfRVHOWUBq2tZRdA6GBw9Q3Ld83PgjQxOCAdWAe38ucKENXUEqJsHOrvEli9gtVQIxHAHDeYfdZFjPBQrnyTuK11+3OMexpY03NS8fRsBDPNnZ4hhE9IPI100k6OO6t4qr8GIluK1wwoif/xQzgmrDTZOzxCb3l8wCe790pQubzhKblsWRPhKGOjm5SCL0h8ZI6tUfcAHov4BfJJLrCAUY+uQjr3Y+iJx78/Cz+QxJRg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR04MB8896.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(56012099006)(6133799003)(10067099003)(4143699003)(11063799006)(5023799004)(22082099003)(18002099003)(55112099003)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5GWyMJTxS957jtks2hAbur1BcYZaHIkkpXlNeZyxL7cYtuaCnEYcdmMR+ZLd?=
 =?us-ascii?Q?+u06oaE6PsqJGyqhVpStTuMTa1Ou91t9xU9RCtklWaWvj2/E61eB97nScE5K?=
 =?us-ascii?Q?XBpRdPNbHX4WF6gj6fKVWvRD/dZLFGqmpHO0/ObcBZRCx/5Rttv2op5vQD+N?=
 =?us-ascii?Q?xUQE0th7nlA/lEdwggDz1ibcowbZp0W+tGrI3SDoPmlKD/D3pfVN1Ynh1Rs4?=
 =?us-ascii?Q?5ntP4TO4m279POC7l08mYwZ7NSx2Q3yJC3iJ+mEs27VUP07Xf1/lK+kjyGHs?=
 =?us-ascii?Q?WQtNfPJNFBFvEYsj0y3cbpBBNJsgtX3qwQcPZuUtaMoRycYBMX2BHWdMGgHT?=
 =?us-ascii?Q?iaCAvnBjRnhV00FNnPa4a/qmgV4MHPCyghXw3SIKCMiGRwL+0agQZDC031HQ?=
 =?us-ascii?Q?WqJ/3/OzEIUZ3qEFstWw2pW8nGJDwXvGJtszBi/m1h0TRqskiSIbag5EQUzk?=
 =?us-ascii?Q?zqC6mQ3SCp80Xd6MaHdFaKr0w3It1r5AU/UH/KpvuVUQ0NaSonXM6vC6l6vY?=
 =?us-ascii?Q?aC0DM8m0kRfzjH3I9XWIe6kYu4zC1nQiuv+rngxymoAsA+JmZ7SIB2ZQ1ZfJ?=
 =?us-ascii?Q?IggBxeNxDBhu7ADNoqgaGGF6xlZe3LvFkGS8rtFiF8YO05hSywnyCoUVNnEC?=
 =?us-ascii?Q?HPk6O7OdxTiMHsCkvpMqJrfNaPldprlSx/xJArzNxHeWMDBVaA+qjXW4DJkd?=
 =?us-ascii?Q?G6fYb8NI/WEkTtHDwOkmCahPyy+Y98Fxf8/wV3xbnE2OoyWOmszjvtEhHypZ?=
 =?us-ascii?Q?4uZHdhOVS44tzDVRjM5MrUCLfwnkGPeB/uiCMZDunxS/+sg3HYWDfa75Lchd?=
 =?us-ascii?Q?UtV4QhjkRUGq6+5Lhe/Qu5WvRQn63Ytaz1eNDEnOUNPZnt6fOr517P5mb6ZM?=
 =?us-ascii?Q?3Orw2mmU96u79x/iUYSYe27fIi8lH1EYlo8vQurQMEs9++/vPCpbQ3UotpGc?=
 =?us-ascii?Q?akgbJ1P6tGE8QtW8IfZV4UVa7vIvGEhKiD6lukmSBJjyn7wKzJLD3VYHJtot?=
 =?us-ascii?Q?p3zqDGomc4I3SRTz3UcPpPqO8GbScgcs4UXT3FCzYSolmKpBq72jwDTQOFHA?=
 =?us-ascii?Q?F8omYapaoDwQEPtp4y0ce9tyuTmo/KxaS7j0x9gq6IZ8uj48ixZo83h8rhUL?=
 =?us-ascii?Q?6He7LWj6boEhzlCOQx0sFJs1M4JZupXQ//fWZpuY4reYI/T6nXFsBkxSxMct?=
 =?us-ascii?Q?HwtzJrFtObYGB3rYvh80mFdyC/CsOAX5pk6DYAVgykUIsQhYUDZuS6abLgfk?=
 =?us-ascii?Q?KcwJNdgVc4r79CnmiRjA0QrxoYT/ToWRfjVXLTVYJGLp4D44lmeDGC1N8OGW?=
 =?us-ascii?Q?BJTp0Tvoz8nFQh57Lo2euVw4A9ig2lwVBPhUGYaSAQ5mMVzYUpQZvF8wU3Xn?=
 =?us-ascii?Q?H0DToGxwSrUCuBR63a29hBOY3mFzu/raKMR8RZC/XcJaJHuU+kvF6KH2ZIne?=
 =?us-ascii?Q?j8sMNClXibzvv0VI5gjW9s8XAIeqpSpeuRNPXeJgltSIoATxhczyXB0n5AO1?=
 =?us-ascii?Q?aCKJMiDqEiuSLdsEy5QW3deZEVpL4xDiscrf8TgzlCThBNtgvEl6ZA9SDFxh?=
 =?us-ascii?Q?nNg6aOp/7IuDtadD3k2Td7bMuqdFg/BvIMO+gQdtLUj/HhgLebgB0hQRAioP?=
 =?us-ascii?Q?hSbjAdihHsdDnNLw8PUIpTgQe6TfR87N7g6dMrOgPRFEvEKy1DgWR68FEulZ?=
 =?us-ascii?Q?nN3RKQIzgjGBeQEc9xBzp52aB3TlpKTCPmOLdu5TUuKmilptGoJ5CwBwKuha?=
 =?us-ascii?Q?yvpaoig7GLEgVxtPGZtDt/ob/0al+FU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f16424e5-5db8-4652-e01b-08def22948a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 13:07:05.8677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3zn6rDfrlbzwjVhjCo7eTJybfMXp64W8Opambu472H5iPUoJxfwf1x1tIwZK9IDKa0sohm9r00GImRfLmgAoMW/EKzFhVKmnYrr8wIvdKQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7770


Hi Sashiko,

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s)
> to consider:
> - [High] Generic `syscon` node under `simple-pm-bus` will be accessed wit=
h
> its clock disabled, causing a bus fault.
> --
>=20
> --- Patch [5]: [PATCH v3 5/8] riscv: dts: eswin: add hsp bus node --- com=
mit
> 4e57b37c3aadc988b1aed52b079b78ca92be234c
> Author: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
>=20
> riscv: dts: eswin: add hsp bus node
>=20
> Add an HSP bus node to manage the HSP CFG clock used by HSP peripherals.
> This clock is required for accessing both the HSP CSR registers and the r=
egister
> spaces of HSP peripheral devices.
>=20
> > --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > @@ -252,6 +252,19 @@ plic: interrupt-controller@c000000 {
> [ ... ]
> > +             hsp: bus@50400000 {
> > +                     compatible =3D "simple-pm-bus";
> > +                     ranges =3D <0x0 0x50400000 0x0 0x50400000 0x0 0xa=
0000>;
> > +                     clocks =3D <&clk EIC7700_CLK_GATE_HSP_CFG_CLK>;
> > +                     #address-cells =3D <2>;
> > +                     #size-cells =3D <2>;
> > +
> > +                     syscon: syscon@50440000 {
> > +                             compatible =3D "eswin,eic7700-syscfg", "s=
yscon";
> > +                             reg =3D <0x0 0x50440000 0x0 0x2000>;
>=20
> [Severity: High]
> Will accessing this syscon node cause a bus fault due to the clock being
> disabled?
>=20
> Because the child syscon@50440000 uses the generic syscon compatible
> string, it does not bind to a standard platform driver that would invoke
> pm_runtime_get_sync(). As a result, the parent simple-pm-bus will remain
> suspended and the clock EIC7700_CLK_GATE_HSP_CFG_CLK will stay disabled.
>=20
> Additionally, since the clocks property is on the parent bus rather than =
directly
> on the syscon node, of_syscon_register() cannot fetch the clock to attach=
 it to
> the underlying regmap_mmio.
>=20

In this series, we have not yet submitted the DTS patches for the HSP perip=
heral
devices. The intention is for all HSP peripherals to be placed under this
simple-pm-bus node so that the HSP CFG clock can be managed centrally.
A simplified example is shown below:
=20
hsp: bus@50400000 {
        compatible =3D "simple-pm-bus";
        ranges =3D <0x0 0x50400000 0x0 0x50400000 0x0 0xa0000>;
        clocks =3D <&clk EIC7700_CLK_GATE_HSP_CFG_CLK>;
        #address-cells =3D <2>;
        #size-cells =3D <2>;
=20
        syscon: syscon@50440000 {
                compatible =3D "eswin,eic7700-syscfg", "syscon";
                reg =3D <0x0 0x50440000 0x0 0x2000>;
        };
=20
        sdhci_emmc: mmc@50450000 {
                ...
        };
};

> Does this clock need to be placed directly on the syscon node so the gene=
ric
> regmap core can manage it during register accesses?

This clock belongs to HSP bus because it is required to access both HSP CSR
registers and register space of HSP peripheral devices.
So, we should keep this as it is.

Regards,
Pinkesh

>=20
> > +                     };
> > +             };
>=20
> --
> Sashiko AI review *
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsashi=
k
> o.dev%2F%23%2Fpatchset%2F20260804104431.1391839-1-
> pinkesh.vaghela%40einfochips.com%3Fpart%3D5&data=3D05%7C02%7Cpinkesh
> .vaghela%40einfochips.com%7Cf2c475cd29514377c91508def21941fb%7C0be
> b0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639214387462287117%7CU
> nknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
> MCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C
> &sdata=3D0qgID0%2FlnkF1Lugz0W5MhGpiuV2CbrQ3BVxS2gQH2ZM%3D&reser
> ved=3D0
