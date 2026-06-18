Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47503DB332
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781790151; cv=fail; b=CkZiNnkFCYzdyEEtGDGLZccxeSSvXfpZGrTVSjLqSZSjaipMca0BOh623Qs27PLCmDNet6DOaYPSZNpLsQeKUECxfMQPYPTeW774J40hHiNJvAZAQExMlkUga7eA9GWVocKJdZBj/wxixidmpfLk7ewgecknOTgLMLSrA733rg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781790151; c=relaxed/simple;
	bh=5hU6O7obTEl/jw9isHLqv4lsOYYdjIOopGZxJKpXhiU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L5ixwZheIB0hC/Oo/kMQpV3ZOxGcdYBk0Ne53VZEyLQEkynYtQ0dvKFhzxq7bvHjueZ4ipswh6HMSgTY12l2niKzqBBgrtqCnq719mbm1Nbcfj7eNkciqSJq5Iz+PjB7dmBSsc97/IEOOpR1SFakycFZGu57nj+roam7ezql9t8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=uoi6gDrK; arc=fail smtp.client-ip=52.101.61.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="uoi6gDrK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXd47SUghHTCcXUGoM7LuuPgjYlbCg/Q9D3L2Z6CYPF9fxgx18/rrXIUzOXZnIJUaBVVr4FrBo2aH8+9scEN6M+KKPM4p4C1/t65ejxg4Z7D7ZBa5w5phB8WEe/GNys7fX3sh8sGEAo9VYO8b6XcYAk370pmAIw8SFHeau8Fyd8qmBnU2VipUH/TLHjn6KuKkiWCVDrwEHaaqULL8OfzAWGQ7SuD+7W5J475qSglpWqQy5UNfuBejuuCWKXsMqaeDCKHOog+DLfJ1QvXO/kVDWo0XHnu/h0mWVgX+g2ntSvhqX/TU/P1zum0yXeQ3LdyQN3TU26WTyyj6lhdThNn2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQyaKUrMdInBF7Ma/MXOm+ZmpHeLl6IGBNC5IBo/a3Y=;
 b=Uz/vtt9b3WNsaUGzIpwvack5SsVx6YWOeyW8vlFsJH16Av9gwoNh5+PBojjOJ0pjhSrxLfNgzoY3gk+gRIk8aR+/nG0mJcDwabYYATtkazHMdN0BLkwRAxuaJ4OcqjLkXH0zm9Oq/8n7TdTKPjEp3KWs5Lt4v4skbvMlsZfPy73ekdSStLNzE/hKsUhR88ZuRHP9oO1pevBSNgNmSSEB2moOdfzGoL7ocm0UiQX0yeLKSX7yRsRbdBGHTyAd6XPGuamPhrtOpdVB168D1Q8cxREdU6nrJ8d88kdGmotN6YDbHQMg2fARSDU6JiMjGitt+YY5IkfmvNL54stvXbHGEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQyaKUrMdInBF7Ma/MXOm+ZmpHeLl6IGBNC5IBo/a3Y=;
 b=uoi6gDrK9Gqv4jyxrw12mhbV/UotAbwdIkRK0Qv068SH2A0aO0WLR0GI5mCJ9rs28ZGZI9v8AXsrb45M+IhZS+tnYNZJcbMhuArKbExtoJ1PIHQwsjWNSHtSAC+NbzBAypgrmlWdzfn+PmtNh43yG9Z/FukfNvS65bINiE05sfE=
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com (2603:10b6:a03:53e::6)
 by DM6PR04MB6667.namprd04.prod.outlook.com (2603:10b6:5:247::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 13:42:26 +0000
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0]) by SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0%4]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 13:42:26 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 5/7] riscv: dts: eswin: add hsp power domain
Thread-Topic: [PATCH 5/7] riscv: dts: eswin: add hsp power domain
Thread-Index: AQHc/yhMZeEToNWjb0W6u1v6W3Ytpw==
Date: Thu, 18 Jun 2026 13:42:26 +0000
Message-ID:
 <SJ2PR04MB88967F187D6A90244C2CDA7983E32@SJ2PR04MB8896.namprd04.prod.outlook.com>
References: <20260615122016.1110206-6-pinkesh.vaghela@einfochips.com>
 <20260615123122.A624D1F0155D@smtp.kernel.org>
In-Reply-To: <20260615123122.A624D1F0155D@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=b93f298f-9acf-481b-acc8-c7b0a37d4608;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-06-18T13:28:34Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR04MB8896:EE_|DM6PR04MB6667:EE_
x-ms-office365-filtering-correlation-id: c5c6c58c-4f38-43cc-f2cd-08decd3f6f56
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|55112099003|11063799006|4143699003|6133799003|4133799003|5023799004|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 X3wpw+w0NC5YniRUA/FLw5dNzu3dmzf8SvbssxiEwoKJDJvslDXYd8m9TRdiPWI4ThqCUkwcF/KMVbbQS1BYZLLYuCZcx+fi3MakyQ8fNAYoGTO3wrY+mzh4TxWkzeAnAOMjRBdVD0Aeyf+p0oaLoF6EaGhR7VdpEe4caIm9rnmxcLMy06ZXGlrJ94di0VIeS9QM7u06qOtrBXQy60PUxWcN9VcWv1cvptC/ppdldj2eL9fDcMn3aqen7KY60x7x/DvRAB1mdZ0pHfF+SWVxHXuzNcjRmQixJcykEMK9R5IPCZAKrueaRbVMcuzyqW2ZhmGOqb8sDuIoWVL5HvxDdcku4rGrwzU1CnupO3/xNsRdLRqj7nLfPskKhMbKPhcl+k2gg01exJC/3QbSLQEbgUEWQUPwz+iy4AAMuE9BoW3/0XBjmEHQxVrPrxnZ7MK6IJ+sZGTFXW+/B9xdna5TezFiJJ1Xj6VKnCy0sqSj2u//6agiku/cYg0YGlLq9XyqHTCsyYZPv3cei3bf9L8PF+BcHW8W3NpG9qjZNlFYDN28sBGjwut/X8IkXn7YiO1Fiwnv1/zA5F4CqbOPE7y6V3wj9U2+A04g6U3OTTeV40EStJovwGo4nyszuIKbTP97PBF9Lm1TDw+83DnipeF/BL9hF5tqOpQYbXF9Ghp+lrZWGXPIkHIyDpg3rHUsRSOWnEYXS2CO0fZ14z6ovUxlos0+Sq3hax3Yq+HohDwFwCNBm4KQYS80qEVE1qQQYHm9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR04MB8896.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(55112099003)(11063799006)(4143699003)(6133799003)(4133799003)(5023799004)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VimqabtBvx0w2IqmtGE+xKB2U6T9c9+mcv6Q/3W1LZGZuZXrgMTcYhEsioIa?=
 =?us-ascii?Q?8aJ0iCoUN6UGQgAXbSVzZNfPbNAn503UkJUePxxhceDRP5fh7uOzx5vxwAaD?=
 =?us-ascii?Q?tQ0KLjZJ6SvRRVY2vGP7FT05Tmrcv9uk45O0EC4r7MrjxsI7ZdLRI0YhqpBb?=
 =?us-ascii?Q?+edjHWhn/RlWP9hgUwUJu4z3Ed5AmG8vV/PHrDTvdige0JRa506OqMfsxSXE?=
 =?us-ascii?Q?K3IMbHQNykCtnEpsZSPARskTNs9pVrGHDdIKErZvr4lz9nogeUmwqnwqNRig?=
 =?us-ascii?Q?WsYq3csyUw2VZm7Tlrd15brPIp7BjZwH+MWH4hbYozfMpraK+DxBIlKW8o6F?=
 =?us-ascii?Q?rV4hNHwx/1vV74ej/oE9spnNLuWOvYEVgijaG+pzmuoXfy1IrBlgP4sycgYj?=
 =?us-ascii?Q?h0g8KMDrWWMgS+reLu4gB1js53NIbNZ2f4drbUs4/g95sZuFaCA3zB9LeibH?=
 =?us-ascii?Q?s4WT0BabFLXicYtYhVwbyjy+XsKICWjhyPrpFhFL18embSkU6MwA+Mxkktel?=
 =?us-ascii?Q?9U/cI27ZbSxnmP9l8kKVenuaLntNk8PhQm6EfZhkHwHFNS2A/XgnzxkZvqYz?=
 =?us-ascii?Q?n4mYWfK27WkmZ8qMb7IcQp+GY3q9rqFOHAWylQ+7oTsmQt5r9uqk19ISkewH?=
 =?us-ascii?Q?jU9x7QDtN3LFON5gjyXqMAHqa1Ly4BDfZGgOHUvmcxIgrfAZoHTOkbmkVgbb?=
 =?us-ascii?Q?DJIITAGSjqYNbHvpSvGNfSFv5Kd57t9XWK6UQIM9qVhGSvp5Py55yth3x2+m?=
 =?us-ascii?Q?2KmS2D3eeUUsKKX2IbsIKv5pCXr5FnKTM3/WIuf9wPKrcIEVr8SoFE/1Ewvg?=
 =?us-ascii?Q?xZD+0her2DFJXVOQs8cj5h4QSNcf38Ek+ZwQ9+Vs+hFQW16QZu1jL2gSuZIJ?=
 =?us-ascii?Q?octBQRPSQugffqt2sqT1qm6fgrsg97Q4YQTgdG5+UsK4KT0sw4zPB9QuFM+3?=
 =?us-ascii?Q?waO7L4oe01mPMoM7q6Ewtx9x9vtyQlzMllOiNpNXpbr2LRJFmPDbGG+AYm7u?=
 =?us-ascii?Q?q+Y6No1QFRksm2cYisrGkg95/+pnpHMk1QjQMZ6IeYYQTYh4+uU0kqGtKvDa?=
 =?us-ascii?Q?Kf1huf781EnfpZmQpUYjx7EBdlOVlP91Z8sk2xxe2Lc6B6yeCg9xBga7IBcW?=
 =?us-ascii?Q?c3iYLnpYD9ITzNeFN/AkJGNWEwUy5x0a4qgjiY4Y45KEABvzmMtBPySseDXI?=
 =?us-ascii?Q?dB33+BFSf2UMWGVl2CAg3OzS3WWAp6afUixTQ+5yv4Xx10TBZpeoftS9IrXm?=
 =?us-ascii?Q?BZxBopx7s8rupc+0TCziCR8//ARRLDMlTmUcrlXvtYTbOq+QWuSEpEeaiTjL?=
 =?us-ascii?Q?ta4wzFu3JPQdSyrkWU96twkOBMTBEXeqNN9FEIupow1QZ+2CygLbgPiEce8X?=
 =?us-ascii?Q?dfc+L0g2VC+WISLUxUn9NKrmSEaLu/ZeQmFRqNlfA/jugcGb7q+iMWJtWNbH?=
 =?us-ascii?Q?xqvW8da38xFGbn5Z8O7Mq606Tas7iFDwexM7l+pYkz6RputWDUV9+pivaC93?=
 =?us-ascii?Q?3CNrlcwQxaCKKDhvp7K4KEKikZ10vooqiM7Gim38lYx9wtFDxgUXjoaZyFKD?=
 =?us-ascii?Q?O0bccsKMMO6k6FoKu08d7yLS1pfA8dez/zhrRrbhtuWiKC4pYauUaMwnCMSs?=
 =?us-ascii?Q?SSbncdB3WX2tqtiWMTTReVkdgLQCauBGxdTCE2KJ/YKj3E7++yJKPlzjEXFN?=
 =?us-ascii?Q?ndWwUXLsxG3mf2/BiVk8EeclVJ5CCWBx9jatJqfLR6ChrKTf3kjfVokyIMFF?=
 =?us-ascii?Q?PcX4WxKKKw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c6c58c-4f38-43cc-f2cd-08decd3f6f56
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2026 13:42:26.7729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nlw+7OXUFB11rdEXNiYeZX+mKfmRinqbznNgsYDCPOhu6pRVQmenzp6W3Lc5TreaCq43gNTbX6ldBpo55ViD73LZOeRYoa+4dc7JzibBPXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6667

Hi Sashiko,

Thanks for your time to review this patch.

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s)
> to consider:
> - [High] The HSP CFG clock will never be enabled, causing a hardware hang
> during register access, because `simple-pm-bus` requires children to use
> `pm_runtime` but `syscon` bypasses it.
> - [Medium] The node is labeled and described as a 'power domain' but is
> modeled as a simple bus without the ability to act as a power domain
> provider.
> --
>=20
> commit 0dad730760e600f73d118515b1907e14ac735dad
> Author: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
>=20
> riscv: dts: eswin: add hsp power domain
>=20
> This commit adds an HSP power domain node to manage the HSP CFG clock,
> which is required to access the HSP CSR registers. The CSR is defined as =
a
> syscon child node within a simple-pm-bus.
>=20
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > @@ -252,6 +252,19 @@ plic: interrupt-controller@c000000 {
> >                       #interrupt-cells =3D <1>;
> >               };
> >
> > +             hsp_power_domain: bus@50400000 {
> > +                     compatible =3D "simple-pm-bus";
>=20
> [Severity: Medium]
> The commit message and node label describe this as a power domain, but
> the node uses simple-pm-bus and lacks a #power-domain-cells property. Can
> other devices actually reference this as a power domain?
>=20
> simple-pm-bus acts as a transparent bus for managing clocks or resets for=
 its
> direct children, rather than a genpd provider. If this is meant to act as=
 a power
> domain that other IP blocks depend on via power-domains =3D <...>, does i=
t
> need a dedicated driver and the #power-domain-cells property?
>=20
> If it is strictly meant to manage the syscon clock, should the wrapper be
> removed entirely?

This node is not intended to be a generic power domain (genpd) provider and=
 is
Not expected to be referenced by other devices via a `power-domains` proper=
ty.

The `simple-pm-bus` wrapper is used to manage the HSP CFG clock, which must
Be enabled before accessing the HSP CSR registers and the register spaces o=
f
the HSP child devices.

The current label is misleading. To avoid confusion with a genpd provider,
we will rename it in v2:
hsp_power_domain: bus@50400000 to hsp: bus@50400000

>=20
> > +                     ranges =3D <0x0 0x50400000 0x0 0x50400000 0x0 0xa=
0000>;
> > +                     clocks =3D <&clk EIC7700_CLK_GATE_HSP_CFG_CLK>;
>=20
> [Severity: High]
> Since the child node uses the generic syscon compatible, will this clock =
ever
> be enabled?
>=20
> The syscon framework in drivers/mfd/syscon.c does not register a platform
> driver, does not probe a device, and does not invoke pm_runtime_get_sync(=
).
> Because the child device is never probed or runtime-resumed, the parent
> simple-pm-bus will remain suspended.
>=20
> Would this cause a system hang when accessing the syscon registers since =
the
> clock would remain disabled?
>=20
> Additionally, of_syscon_register() natively expects the clocks property t=
o be
> directly in the syscon node. Should the clocks property be moved to the
> hsp_sp_csr node and the simple-pm-bus wrapper removed?

The HSP CFG clock is required not only for accessing the HSP CSR registers,=
 but
also for accessing the register spaces of all HSP peripherals.

In this series, we have not yet submitted the DTS patches for the HSP perip=
heral
devices. The intention is for all HSP peripherals to be placed under this
simple-pm-bus node so that the HSP CFG clock can be managed centrally.
A simplified example is shown below:

hsp: bus@50400000 {
        compatible =3D "simple-pm-bus";
        clocks =3D <&clk EIC7700_CLK_GATE_HSP_CFG_CLK>;

        hsp_sp_csr: hsp-sp-top-csr@50440000 {
                compatible =3D "eswin,eic7700-syscfg", "syscon";
                reg =3D <0x0 0x50440000 0x0 0x2000>;
        };

        sdhci_emmc: mmc@50450000 {
                ...
        };
};

The purpose of this node is not solely to provide access to the HSP CSR
registers but to act as the common parent bus for HSP peripherals that
depend on the HSP CFG clock.

The current commit message is misleading because it suggests that the node
exists only for the CSR access.
We will update the commit message in v2 as below:

riscv: dts: eswin: add HSP bus node

Add an HSP bus node to manage the HSP CFG clock used by HSP
peripherals. This clock is required for accessing both the HSP CSR
registers and the register spaces of HSP peripheral devices.

Is this acceptable?

Regards,
Pinkesh

>=20
> > +                     #address-cells =3D <2>;
> > +                     #size-cells =3D <2>;
> > +
> > +                     hsp_sp_csr: hsp-sp-top-csr@50440000 {
> > +                             compatible =3D "eswin,eic7700-syscfg", "s=
yscon";
> > +                             reg =3D <0x0 0x50440000 0x0 0x2000>;
> > +                     };
> > +             };
> > +
> >               uart0: serial@50900000 {
> >                       compatible =3D "snps,dw-apb-uart";
> >                       reg =3D <0x0 0x50900000 0x0 0x10000>;
>=20
> --
> Sashiko AI review *
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsashi=
k
> o.dev%2F%23%2Fpatchset%2F20260615122016.1110206-1-
> pinkesh.vaghela%40einfochips.com%3Fpart%3D5&data=3D05%7C02%7Cpinkesh
> .vaghela%40einfochips.com%7Cd647a45fb159406b1be408decada02f7%7C0b
> eb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639171234888553198%7C
> Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDA
> wMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%
> 7C&sdata=3DzdGzcGOEAAOetK3OWTF5JjYPXpfvcIgMARFEP7DI39I%3D&reserved
> =3D0
