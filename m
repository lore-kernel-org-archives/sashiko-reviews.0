Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09B43CCFD4
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582965; cv=fail; b=m88m4Lm90VSNI3fJ/ScJWGJK2D2JPq88izAkTSf5KAxl657uz2Ggto7UqGuuCOneOVBRkDJQS1KmXFCg2uQlOwvs1vXLATq66WNycMrbZv3kZIb5Fbih8FSRg/Sr3g/kthKol7+niA6lKL0Orgo+I5Jk81EeSPiiflfZIAYuHNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582965; c=relaxed/simple;
	bh=5M+nsD4YW+PIkADpmLowv5VSXgYrMqYmh6mqQ6sN9Uw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RKz/cIzJMz1099zJ1BkL43p4hFg8s+1vlFtNRsHmEnCbffsuxAZe3XhYMCqTQWpLq5cHFDJc+vKlUv7arPk2ONXTGGJtVD7ZAtT3f801IdY93LkryAZJv/F8/2VNS7qZ7khj2k1zy9c76I8fd0kegajbxVpApKjXLzVu0pyL7UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=gBv8cyxg; arc=fail smtp.client-ip=52.101.62.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="gBv8cyxg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFt3qKQl+ML4yOrmhYdxNQBuPx2TKrpf1A9onbFbPplCbT7gYeksABsgIEuP42M4gVRT1ali7ql0ow6L3CPeQWdKpiI5ulAl/bH9JxuLzmA6FLip1GAMBsuDb2OWL5N/KLyX+4o8jKgzhaCfoN2JZk4o2eFqWBCS3v+xo4WPnjWHRF5q+/SSWLlaWn1ayn0kPdS2kTKrSqYZusVihp7fW3GBKeBrbc/bIsbhq5OvoNnCT97VNqA+JU4yzBy+qfcOWucvHyxIsrsdZHS7fj6h+dr0RNzH/JMS9bNwCftURSRxhWPireTZZ09JTeE3SieEQLl/MglMhNOFMTToe+ehLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmRXxKxDUEf6VTwW026RtXgp/vvt7YBvUbiwL5gBZMo=;
 b=Hp2nZAgRLu/erP5LAYnxujII/SBLbehi4oMlbu2E6aQzyiaERcfmV4FZJBvsmAmA5Ut8qX3vx/c6W2baXAd4bqSdFs3A5eY3xlw8F5BbmMwq1o5Qp3X97R/VKKghyp72crLj3n6BnUKMn592m7VO7b1c6CVIkMWJkJDaz8doIQJ47ENe24HmBO0LiZ+8c0vT5lySH7yAht8+tfvoA8TvAse2J+c6EFvpeJENKqdCwEMhMfCDxiJUkpeZwyt2udkV7g4fVjXOWbGYDo8dYkQc7OCDXHlHBt5YTsukvtjl4HSS+jtsL87Z6S5Jn7mBzRD9EKIDSLpP3RuUMEJ3dTQqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmRXxKxDUEf6VTwW026RtXgp/vvt7YBvUbiwL5gBZMo=;
 b=gBv8cyxgBDplgLp2Q0w6QEopiszKUZi5ltEiUat6qAFZMyFlwh8A6OzKhtWOuGmAdy2l7Ku4Knk+hze6X+SjnDZ/AAgHCnR/xbgBjORgvrcvvMt8I6lnfwX7HFcR2qYt3uJjtvP7beIOEndKLLznRJeQ2gaczNIHeailsEDl1Rc=
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com (2603:10b6:a03:53e::6)
 by BL3PR04MB8059.namprd04.prod.outlook.com (2603:10b6:208:34a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 07:42:41 +0000
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0]) by SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 07:42:40 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 5/8] riscv: dts: eswin: add hsp bus node
Thread-Topic: [PATCH v2 5/8] riscv: dts: eswin: add hsp bus node
Thread-Index: AQHdD3aFE2SXu5qv50K+/OTCjwlyYQ==
Date: Thu, 9 Jul 2026 07:42:40 +0000
Message-ID:
 <SJ2PR04MB8896974C22F1D261482818B283FE2@SJ2PR04MB8896.namprd04.prod.outlook.com>
References: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
 <20260706081055.1126275-6-pinkesh.vaghela@einfochips.com>
 <20260706082335.4C4351F000E9@smtp.kernel.org>
 <20260706-antiques-famine-8c4a765c4680@spud>
In-Reply-To: <20260706-antiques-famine-8c4a765c4680@spud>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=dfe20256-e11f-4dcb-b829-c2063ad7ccc1;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-07-09T07:33:55Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR04MB8896:EE_|BL3PR04MB8059:EE_
x-ms-office365-filtering-correlation-id: 751fa742-1d21-43f4-4f20-08dedd8da7d7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|55112099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 lHWHW3dnLtLa0USLpWDNK9/3/ZSIHdm7ryNnyMsMYD46YPdJwttImK5evU1tJHvLdxA1EnhobWOyMfW0OAIR4NzH5B+IgmZq1SXE9MPZB7POEq4JYjPjycfXUO3+28C0WB3K4LfPdefbNm9DPeG+cvKcgChK0lI9uC0pYFk9fYtG9/MtUAqxRYfjUfLVKxpuOhlcpHh54ja6t2m6AiEv6JUm0VmGMbWQFQ2ekeCKNy3AeyBaJAJAujBFpbbagPOP3s7ve4bLjRzj/TQ1oTWWs68k8a9INIEiAPz/dcLddcwl6fsQyv2d0gXdELkjWTXiFbLZP2dMWoQh/66Mh6eWt6V2YbC2YNWwtjPhny2Gs1T/nfc2feJ6pP98Wp/CWmI9GFg0nA/qx+yH8SsideIzEOb0Ba7JGSWB22Mg35Lo0RhQithfI85RiRkEaKrkh0xTTUWM2nCT/p4Zsf1MMEKLmc6QYVBC9k9X787KFw8CWiGzRq0qp6UVjsTGREzBCVAYaYS0/Ph95WIUJ58u/QSPMIcsqDbufJRv4Q7UPufttgnI/QkRaucRxNzYRwu+g8wc8aWqzVeOpWe5/1fFL4sjjncICpXrIplFFK4VnL7isUdhS05AkYrdbtoeU7JF5p6fpheLaevJ+g/VcaJgDJfg4iOG6RD5MKpJZxcjNWnJeBY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR04MB8896.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(55112099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8MGTvb/KoFLJV8Ud2mDo6SUk9umqX4zSJcfOgGMOIlbk3BvDTEITYJi2aiCl?=
 =?us-ascii?Q?m4kr8rh+g2T7PXjLoSgWwcVdr4Vov4l7koPNNMMClEaaJXhZUvNFXMw8rP/8?=
 =?us-ascii?Q?tWaJhEXYm5DoiE9MyRwYlKDdEw92rmkei4UPXeKenimzw0OSHAHFseKVZFlq?=
 =?us-ascii?Q?4oR8EQl7BBOkahSqqeO8z9gFzx6H9Z4l+dpPHMch63MfuKuqYb3Hn73J/jpO?=
 =?us-ascii?Q?YWS7lDfMcQdzLDVSoFpiytb0uYS8PS66Pb9+k2X2et/l5pSoGNcu/KEmcddC?=
 =?us-ascii?Q?v5EoaGvX+CffZ+lB+IkBc9itA9ICHDkf14sV8B8C+ubvc9nIfgC0FmD+aezh?=
 =?us-ascii?Q?9VcIEQd60WxR+2B3iaMashimy6oOZqmrixkzLa6kz4cQ1SEsvWedKNYqd/+q?=
 =?us-ascii?Q?j6bFWnvm3Sfamv+GHPw8VD4pj0K4MA1F5w/Uffg+m+z8qeW/kO3kuUOdnM5J?=
 =?us-ascii?Q?X/+DbsdlP97R+y+07NWpeSoKN7BuxIHvsUE9PuwemT92rbV4ykNZE56HaFJt?=
 =?us-ascii?Q?fE1MSnw2t8BxQtlkmAHOkwJXTnWS2g8rwVasTmmGrp3/xnfM8QrXOoBhWrvW?=
 =?us-ascii?Q?3eqsm5NnQk1sSZiyOF3SpVdLwz1sU5OeRS+/jTMnsa51NUzqCX0o7+D6ZKv0?=
 =?us-ascii?Q?bDotzUlrkN9eGJBydQODqth0eXbQY11rMPZrbTLM3GiwPi87FGUpIEhRC0wg?=
 =?us-ascii?Q?HCGzuOQqqNWuMioiVO6m7b9lniRQ1mPsjdeVzGnQmIWj8KywE7pK/4WFQUsY?=
 =?us-ascii?Q?3qjLgN67TyPGzhhdkLt3whV0qUHETEbfWCtHVMqX1Bbl6peOZYOYJeqLkP+7?=
 =?us-ascii?Q?zIfdtkZZlh9uTwajDU1cy1NaXqeb3xEIhFBdChx/T7yLqjzXIsF3U/Kif5G5?=
 =?us-ascii?Q?jlEDzI/EK64qGXKeFKYL333s9WH8sdn+bBxVrygsdHou6DITGDpa3HpmQ/9e?=
 =?us-ascii?Q?luzseBTyuwUb3qN6pXASfFyoNapCcIfyZv6+7pE1lgd0X1l8C9tJZVN0mSY9?=
 =?us-ascii?Q?/2Y2QRPRn7U0Kq/jD1NMgcFl8rxQ8KeIBAS3AFdIQZfbg8KT8mG729V1OUcq?=
 =?us-ascii?Q?ty1aex0GXLu1EXVIuL2y4K9GDNJBIoJMZFBBAjGe2BSusBqkoPIrMHqLY7Jt?=
 =?us-ascii?Q?60AdZB7nHCewaPrhccqVF1YOwP7bC1f00Y/kGuuxn62sgExDFFELr+fEyxDt?=
 =?us-ascii?Q?WUhflbgpsSyTLsj54cnGL0++l4w1YP+OXGKZPnUomz5BN3dlYfdY8WleLxU+?=
 =?us-ascii?Q?0BLMPKq+01dPrEnXay/1xZ+c9zumlijzqPImWYJSvwQTvJTwJvpbbDRL5hN/?=
 =?us-ascii?Q?MMA5YG/3zQBQ/j03irz0GxIjBmT47eESAs+F0Pkgm38BmXcbkzPvR4zGz5ur?=
 =?us-ascii?Q?23mMAi9ekR4uRRDtCjDvlqvcXXKThjGmyYVCYgLjZW20wr+69fJXCvAc4DnW?=
 =?us-ascii?Q?415EHoh6ypkrPe5aYGU/D2k4dJxiLw7yasrnYEa7H0IC8wWboceLbDx9yn/H?=
 =?us-ascii?Q?ZGn/eat1k1jeRbendRN4/zzSY0Oe7pQ3OrDyK5aQxAqM4U2FmFkpKVN7Di56?=
 =?us-ascii?Q?qUcb+pK76UDYdxLPWVU9/gnSmizvHCHLQ0Unj5Ynkx23QEljy4Xuqwq+sUAB?=
 =?us-ascii?Q?FGeTVVHbFN04hUKUwoQXtNFgNHrEmeE6+DzMw2WvfRQwAY7j0Q5FJjek03uI?=
 =?us-ascii?Q?8h0FwaA1PUhizU+FBedxd4fGBVbIAygE6mX62lpCtOw60hUYOAwy5p6rt4Lc?=
 =?us-ascii?Q?qUpgyZbQDg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 751fa742-1d21-43f4-4f20-08dedd8da7d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 07:42:40.9083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dX65nBNd+0BGNgrV4CIxr+C5deNurghNiiigbUHLc6X8lJ/eecvm9PV8DcPWQ62PNyacCi8GZF6SfRLea3ZQ/sN6laCPHrRW0P2waMF7shQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR04MB8059

Hi Conor,

On Mon, Jul 6, 2026 at 10:36 PM +0530, Conor Dooley wrote:
> On Mon, Jul 06, 2026 at 08:23:34AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> > - [High] The `hsp_sp_csr` syscon node lacks a `clocks` property, causin=
g
> unclocked MMIO accesses that can crash the system.
> > - [Low] Non-generic node name for syscon device.
> > --
> >
> > commit 2f5171ba39f634bc5960f8f8754a5b822bc8c76b
> > Author: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> >
> > riscv: dts: eswin: add hsp bus node
> >
> > Add an HSP bus node to manage the HSP CFG clock used by HSP
> > peripherals. This clock is required for accessing both the HSP CSR
> > registers and the register spaces of HSP peripheral devices.
> >
> > > diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > > b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > > --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > > +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > [ ... ]
> > > @@ -252,6 +252,19 @@ plic: interrupt-controller@c000000 {
> > >  			#interrupt-cells =3D <1>;
> > >  		};
> > >
> > > +		hsp: bus@50400000 {
> > > +			compatible =3D "simple-pm-bus";
> > > +			ranges =3D <0x0 0x50400000 0x0 0x50400000 0x0
> 0xa0000>;
> > > +			clocks =3D <&clk EIC7700_CLK_GATE_HSP_CFG_CLK>;
> > > +			#address-cells =3D <2>;
> > > +			#size-cells =3D <2>;
> > > +
> > > +			hsp_sp_csr: hsp-sp-top-csr@50440000 {
> >
> > [Severity: Low]
> > Does this node name violate standard Device Tree naming conventions?
> >
> > According to the Devicetree Specification, node names should be
> > generic and reflect the function of the device rather than its precise
> programming model.
> >
> > Should this be named syscon@50440000 instead of hsp-sp-top-
> csr@50440000?
>=20
> It should.

We will change this node name to 'syscon' in next version.

>=20
> >
> > > +				compatible =3D "eswin,eic7700-syscfg",
> "syscon";
> > > +				reg =3D <0x0 0x50440000 0x0 0x2000>;
> > > +			};
> >
> > [Severity: High]
> > Will accessing this syscon node cause a synchronous external abort?
> >
> > Since this syscon node is placed under a simple-pm-bus, and syscon
> > nodes do not bind to standard platform drivers, no
> > pm_runtime_get_sync() is ever called on behalf of the syscon.
> >
> > This means the parent bus remains runtime-suspended, leaving the
> > EIC7700_CLK_GATE_HSP_CFG_CLK clock disabled.
> >
> > The syscon regmap implementation can manage its own clock explicitly
> > during IO accesses via regmap_mmio_attach_clk(), but it requires the
> > clocks property to be present in the syscon node itself.
> >
> > Because this is missing the clocks property, neither the bus nor the
> > regmap will enable the clock prior to the MMIO access, which could
> > crash the system if accessed via debugfs or a consumer driver.
> >
> > Should the clocks property be added directly to this node as well?
>=20
> The devicetree should represent the hardware, so if the clock belongs to =
the
> bus, not the syscon (and the size of the region suggests there's other st=
uff
> here) it should remain in the bus node.
> If that causes problems for driver registration, then the code needs to b=
e
> changed to enable the parent's clock.

This clock belongs to HSP bus because it is required to access both HSP CSR
registers and register space of HSP peripheral devices.
So, we plan to keep this as it is.

Is this acceptable?

Regards,
Pinkesh

>=20
> >
> > > +		};
> > > +
> >
> > --
> > Sashiko AI review *
> > https://sashiko.dev/#/patchset/20260706081055.1126275-1-pinkesh.vaghel
> > a@einfochips.com?part=3D5
