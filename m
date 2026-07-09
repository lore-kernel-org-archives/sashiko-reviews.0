Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012059.outbound.protection.outlook.com [52.101.48.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6795D3D567E
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583366; cv=fail; b=C19CFvgOzZP2e5dMdKoX+ttC2Ky71ffOi69KaUwML4F29d0v/1iMNEzkDAdgoe9bjVSrNFcYt9NSV0waGt1/RrGS5y10ZHJBPcSmPg0/7wDXL2T06PKIccorwrhY3WDIjQsP4CDq+ZrVOBkD8kCghYuxwgqtX1sL5xeMYzdGomU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583366; c=relaxed/simple;
	bh=sfgruvohAeAvc0wuzhv5VCzqVRqWkNayjTsA/ZLBx/M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aV8bdV+O7xRxVBgVWRQSJES6mHXth6M0aifRAjTbF0mb3+GG65lY4PYU0bHAFN4z6bCMQac5M8wNfcbIWkJQ1px5pDl4xjGPoTA0HTJYBr5BFE4Je6ikHAX2lNv93VWOXvahCAgs14eDKkg6Abfwfu04DQE6PFoqfAWkeHM+tMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=Q+BBOzZR; arc=fail smtp.client-ip=52.101.48.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="Q+BBOzZR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KF37EiWqJrarZ9G62rT2kvTQacCFSWFMXlLxbvJzN4oIexUDX6lt9oTJ4fg+L36pkluaEFZ+HxDtQZn046aLs8AYNjOJqR5Nl8B/GqzuH5QaFEoi6AVv8NVkg58sWntksy5AGlapZdnKzeVi2UP9p+usMDbQE2TfM7lYKn9WgJHc4d9FinHjH/ClENIGMGV3x+LPw21jr6y55w/sbGL53sfKQhp80Lu5TN8FihIXjih0QehP9YQz0RHThDoap3+P4d933lxtvxsB15mzIIqmBO56eT/kk0YcUieivO9q+QsUE09MqxHG2vGUAXor9MYMfvps322NoEqFIJqVZuQ0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxR6w01XfjLhAiIPTj/HhTrPTEdiwSY0hDOOSw7zexk=;
 b=yU6nyt06XPMmhUl5jggeNoumMkn5Fh5kgCQohM7z9D7YYg+7sK0qui/yJdbmTFD1GobOYP+2/nMDimcBT9bsvDItyqqY+El3AKQgPucc7Bg57tvVWDd3eNJvdc6VPtXGIQ1cUoswkjHvWC08tS0IKpT7pedqye5ZVTKa9xDbuFljzVObPlRpv2RgTH65Nxsqp4eQ5LGFSvWpl5pVMA8zcbpWT2R/cGjDbaFlnPPsOvqM8iLp9A8e6itfgz43dvjUFyGLIphlI7I2F0fiwc6db/xo6QBdjYZiD25QX7YVEp9OxbWn2aPtX2b9ey4H8qhyyStZswvdmbz9A+ojCySOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxR6w01XfjLhAiIPTj/HhTrPTEdiwSY0hDOOSw7zexk=;
 b=Q+BBOzZRM8IGeoNxkuo4WmzpKap+6ccMwhlbjOcF8rumdB42Rz+OLjiewXkRxj0zSmEGClecyJOFC74fhwezk0FmHo1pRbs6vM+5BOlHUzLHgXmONQwZmGFHoFW8IHWFqO3NX8BmGo7B4pKDigddgxI8aVeLl6HEKOi9wqmkbwA=
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com (2603:10b6:a03:53e::6)
 by PH0PR04MB7850.namprd04.prod.outlook.com (2603:10b6:510:ee::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 07:49:18 +0000
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0]) by SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 07:49:18 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH v2 8/8] riscv: dts: eswin: add watchdog support
Thread-Topic: [PATCH v2 8/8] riscv: dts: eswin: add watchdog support
Thread-Index: AQHdD3dyQhz/WI2mm0OkWc61WGI8eQ==
Date: Thu, 9 Jul 2026 07:49:18 +0000
Message-ID:
 <SJ2PR04MB88967DFFBA9E1D607658356E83FE2@SJ2PR04MB8896.namprd04.prod.outlook.com>
References: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
 <20260706081055.1126275-9-pinkesh.vaghela@einfochips.com>
 <20260706082238.C8C891F000E9@smtp.kernel.org>
In-Reply-To: <20260706082238.C8C891F000E9@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=9fdd0c09-522b-4cbb-b111-d0d82289db15;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-07-09T07:43:24Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR04MB8896:EE_|PH0PR04MB7850:EE_
x-ms-office365-filtering-correlation-id: 2fb27158-2e74-49ab-c806-08dedd8e94ac
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|38070700021|22082099003|18002099003|4133799003|4143699003|11063799006|56012099006|55112099003;
x-microsoft-antispam-message-info:
 44yQRsQbHINAwsRl+Vb+XQlFOWQFoDkcyl4J2xXY8ILjvMAEiE4DbyaVYwBdes7+uSaUmhnQ1K3i24SC3Hofb0BYk1rv1BbU9MNVLvtpZCezVr7nRn1oah9fiZ7d2oOBtKOLzqVqqWzwhUd641Ff4tPO1EirprYfTWhavBo9mUCJy9cLysHJLkZLjhhgBPO49qm8EeUXFI983QhTNQ6WGqmAWT1u1NOA5uPvuTzzIXDKsToKVTlTQdn9P5P/u22/c9GuCF27pp1RhjjGh7WVM1ZD3R84CRffxAqAuefEoOroMjfBPPN27y0hiVubIKqi1Jx0cpUBno7cri2ba9jhVn1PvSMLiDZPVIF39E94Pd7y9EaoBNa8z3fuT5Mq2vfqK8uGbuG29kYv2RXBrlilisgtoKIAp0r/Q2vuFDneb63/c+JWSrsr8zW7mQgkzBbcZrPuUz+KBVD/t0HoiWcahZiczqxEbC72Oru0fgQRtTxoQ/jHw4nTWRIyKnrjMq+Fr44NN2ZxITg04YvYRunOUGMk24ZBB9hmevB30S5Zm66I3yfClszxikY6ASji2lizWq124TE0m7Oi0wbKc9YEKSLCNJxUjgmLKWYx2gIGLTbu0zMv6rymROFBg9B8Z2vRhjPcd0hdvvEAPWPubCvWw1e9cyof7uDBNr0ynJ4xuMhnaG+rVor+S5j42CoJLermMgsO/Xlgl7s0bnwtugFUu422u09X1pSLtgu6AZT6lh4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR04MB8896.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(22082099003)(18002099003)(4133799003)(4143699003)(11063799006)(56012099006)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Va5omB5GByTv+8Y5GPNdVJMEv5woACYDvEvU1MW0MANa7n0Q9uBN4whWk8Nn?=
 =?us-ascii?Q?3otIErbzAurIxpi9xakMKnZ5vCC1pCz7wL3FsGx3xmnMtoIXZxuFSxBsmzXu?=
 =?us-ascii?Q?TzlOrYOjostzpdIz7iHvJ9jWb7QXSx8uIo0cYDotM2RQnwhdVcupbnl+51Cg?=
 =?us-ascii?Q?i27zoR5FQyboq+ns4vwi++EsSFc5+fT3w7eHxHAaC87sL2sF4Cd4p1NCGvOZ?=
 =?us-ascii?Q?B7xb4EuIDP0GBtEFZOBjj66sUrsDtHuxN1wxW/RVmDKs71oFvYFuj27AVUDB?=
 =?us-ascii?Q?gQY5yyEuoZ+4H0UhipTSMxJYwfg56otpiw9X6LbjCXKNIQ8rA/RS7/+nqaXv?=
 =?us-ascii?Q?vwBl5AcIlDZS+BYtOlC/oFeRaqjuFZkXa19ELtHApd3Am1YavJbPK+YC5YwP?=
 =?us-ascii?Q?ghBkR837lGxV3wcT+xJy8ydHOCluYFoHgwE5RUtqpwpW6jzR+m/bICsc1RLC?=
 =?us-ascii?Q?4T3aBt9uw1xfl5hg5xHMxw4YqeIIIDJKzlvG4O+8Y3iwuGPKVK8CYIJFldYk?=
 =?us-ascii?Q?TPHejU/CiWhOx3JnK9QPMBzl6tkq6Q44nbJllqjp7p49X2wntjT4VAzThPrX?=
 =?us-ascii?Q?+zBzrAbgdYCZUus9vqAYhldDnI/s7u5GKLRbkK95JdVj7PC31SZRpUtsmemP?=
 =?us-ascii?Q?HjB9eTQ1hOEF65EmG/jDC7i5wCiWlgsyo7ygStrEBRxkiX+raqI8V/KASYoy?=
 =?us-ascii?Q?OS/8gOG3iutzN0RKxLsr+nkGIJ8niJEpYzIw1j3fTkqQBfNomL/1vQJ9NKy4?=
 =?us-ascii?Q?Ahpve6TzmMghlisT2Ts5CYEtvp4Lt9PbhXRpHuXpUA/HqSfWUEfCiVA1syx8?=
 =?us-ascii?Q?fYiIYsHe70O88/fObuPCYKFAfN83ngtj11N1c9hvnagy0B7tRaKugRO1W0Hc?=
 =?us-ascii?Q?G2Uwh0RWijt53Ue52TKjHELOa97pV4Xa0zeqVvOBJX9hth3qjOCZBevgI4EA?=
 =?us-ascii?Q?b1g+gh3Nyt3qsIeiXo4JE6mSFqvE5KqAaGzlHxWxFpUcH0N5px90Ha9ZY/qR?=
 =?us-ascii?Q?Qz3AAbPOdOw8rL5MsyZqvczvZoKLbRmPwOQhoAbnihueC4xq9w0FBM2893fW?=
 =?us-ascii?Q?nkJmCfLXck5XyVQKqkQX6nZTnXgxnMdBt5Vv9P2v4DPcywaaTTgA6NGmbPul?=
 =?us-ascii?Q?CmCZ3AKahsDe11hlXkpY9XdwfpDA6nWU2+nBL8ydpaJZjLXUge40kT8tDtPk?=
 =?us-ascii?Q?wysMXwgLTbloBvB8xuenJWAtXSPW9urCxIBN2gCH7bYFVv91ViZ2lB2N4wko?=
 =?us-ascii?Q?DceJgik946OkHqsFGRqEYxBYLORNQUkyykcTHIrssZ6W6mxO6mluzS0AyV9C?=
 =?us-ascii?Q?RYWfLXCQUd4d77zqTw3dFZKbvc9cdsfPgsquVI6AV8CvTIPmGl8+434OXxnV?=
 =?us-ascii?Q?MzKi1tE8L27AQ1v8sQ22A8A/SaMXZdxZIjCIGK6JkwtdpMw4urhIlwv26Na9?=
 =?us-ascii?Q?wJFh0KZZRzmIGnZNEWmD0/wYbs1eHwSJSgCq4D/sFKVErHhECpvFRw7M4or1?=
 =?us-ascii?Q?vC0H0FgL2FcpJUNmoQZUevTJCUfIo5K36qTHNY5CfqMPfivGD9NcyKoMuFJi?=
 =?us-ascii?Q?NzPuPtJh818ixHsQV5GWMcGIkiRuMMN98W5HMeFFRX9goqdaZGEWko5J5dvz?=
 =?us-ascii?Q?KeiAwYqvYMKgSN2bBbRhwUeFBckBQbcTbYWDJwgOr7RKoPrIAvMsWqmAATNt?=
 =?us-ascii?Q?ldrxaFj2MU2yNz3vLBW59QyIUV6b0F75uM+Q+EWy6YekOhkW3cI+bz9nSuEp?=
 =?us-ascii?Q?6AIY0DIDZA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb27158-2e74-49ab-c806-08dedd8e94ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 07:49:18.2576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cPOSDMWOOZx6QWWDtuEutywr2Gom/ImUs/PrdkezTbQb3x+dvvr6hwWHPxNXd4MYKN4ahdGubCHPGmGMaElTirkqp1DzVkt6ctM3lgF/SMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7850



Hi Sashiko,

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s)
> to consider:
> - [High] Incorrect mapping of the APB clock (PCLK) to the timer reference=
 clock
> (tclk), omitting the actual reference clock.
> - [Low] Missing space after the '=3D' sign in the 'clocks' properties.
> --
>=20
> commit e654cdc83801a14778ef2783efed381807629c6f
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
> > index 6d328befc623d..d079bb337ecbb 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > @@ -265,6 +265,46 @@ hsp_sp_csr: hsp-sp-top-csr@50440000 {
> >                       };
> >               };
> >
> > +             wdt0: watchdog@50800000 {
> > +                     compatible =3D "snps,dw-wdt";
> > +                     reg =3D <0x0 0x50800000 0x0 0x4000>;
> > +                     interrupts =3D <87>;
> > +                     clocks =3D<&clk EIC7700_CLK_GATE_LSP_WDT0_PCLK>;
>                                 ^^^^
>=20
> [Severity: Low]
> This isn't a bug, but there appears to be a missing space after the '=3D'=
 sign.

We will correct this in next version.

>=20
> > +                     clock-names =3D "tclk";
>=20
> [Severity: High]
> Are we assigning the APB clock (PCLK) to the timer reference clock (tclk)=
 while
> omitting the actual reference clock (NOC_WDREF)?
>=20
> The snps,dw-wdt driver retrieves tclk to determine the frequency for TOP
> calculations and to enable the clock. Because
> EIC7700_CLK_GATE_LSP_WDT0_PCLK is assigned to tclk here instead of the
> explicit watchdog reference clock (EIC7700_CLK_GATE_NOC_WDREF), the
> driver might calculate timeouts using the wrong rate and fail to enable
> NOC_WDREF entirely.

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
> > +
> > +             wdt1: watchdog@50804000 {
> > +                     compatible =3D "snps,dw-wdt";
> > +                     reg =3D <0x0 0x50804000 0x0 0x4000>;
> > +                     interrupts =3D <88>;
> > +                     clocks =3D<&clk EIC7700_CLK_GATE_LSP_WDT1_PCLK>;
>                                 ^^^^
>=20
> [Severity: Low]
> This isn't a bug, but there is a missing space after the '=3D' sign here =
as well.
>=20
> > +                     clock-names =3D "tclk";
>=20
> [Severity: High]
> Could this result in similar incorrect timeout calculations for wdt1 due =
to
> omitting NOC_WDREF?
>=20
> > +                     resets =3D <&reset EIC7700_RESET_WDT1>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             wdt2: watchdog@50808000 {
> > +                     compatible =3D "snps,dw-wdt";
> > +                     reg =3D <0x0 0x50808000 0x0 0x4000>;
> > +                     interrupts =3D <89>;
> > +                     clocks =3D<&clk EIC7700_CLK_GATE_LSP_WDT2_PCLK>;
>                                 ^^^^
>=20
> [Severity: Low]
> This isn't a bug, but there is a missing space after the '=3D' sign.
>=20
> > +                     clock-names =3D "tclk";
>=20
> [Severity: High]
> Does this node also need NOC_WDREF to avoid incorrect timeout
> calculations?
>=20
> > +                     resets =3D <&reset EIC7700_RESET_WDT2>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             wdt3: watchdog@5080c000 {
> > +                     compatible =3D "snps,dw-wdt";
> > +                     reg =3D <0x0 0x5080c000 0x0 0x4000>;
> > +                     interrupts =3D <90>;
> > +                     clocks =3D<&clk EIC7700_CLK_GATE_LSP_WDT3_PCLK>;
>                                 ^^^^
>=20
> [Severity: Low]
> This isn't a bug, but there is a missing space after the '=3D' sign.
>=20
> > +                     clock-names =3D "tclk";
>=20
> [Severity: High]
> Is the explicit watchdog reference clock (NOC_WDREF) missing for wdt3 as
> well?
>=20
> > +                     resets =3D <&reset EIC7700_RESET_WDT3>;
> > +                     status =3D "disabled";
> > +             };
>=20
> --
> Sashiko AI review *
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsashi=
k
> o.dev%2F%23%2Fpatchset%2F20260706081055.1126275-1-
> pinkesh.vaghela%40einfochips.com%3Fpart%3D8&data=3D05%7C02%7Cpinkesh
> .vaghela%40einfochips.com%7C5826c0ca87d041fc145908dedb37be6b%7C0b
> eb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639189229628111306%7C
> Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDA
> wMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%
> 7C&sdata=3DxVW5msgNd6IpeyK9ZEkPua7oBwMYAJPYFy7jW8C7doc%3D&reser
> ved=3D0
