Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011022.outbound.protection.outlook.com [40.107.130.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211153B27E3
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075836; cv=fail; b=ruUCjCWGUtSJb0ijiEOMUELW/dCeDn/gqoDZ1RMpLWLAuAB1XE+M6XWJOUXSfcUIRstw2Bf2VJLmiGQG46o/xYC67wR0GhLtSXUgaWnP6aX1rPPp/puSimW2r9RQ5ft1ljHlSZsrKMxKkq2r6faHfApI8vaOO4od2J7QZcYjBc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075836; c=relaxed/simple;
	bh=FacBHceuS2kUp9kNMkmfOTwsr0Z3EPuzZMvXjxJDozc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Olr4EQrhN1aNb2tZnLbR0yDf6+VlEFbAkuwm34eCr/W7cFQRVp2fYLs15ROVfGgBOm0LB9tUAYoLjHk0CW1EFItA8gYV+YoFfV156DvIw5W7tp3qc5haBecZ5elpde8+7n6sAMzjw7IaK35k+d1I9rduOqaFM7e30nL9a9u/1CI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WjxADmQU; arc=fail smtp.client-ip=40.107.130.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WjxADmQU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYuflBaL9PNl2CnnUoiubZCP/ToVtAzvd1d0iznK7LcGQdyuBZF3a4dsc/m0de1btC9A8YVzO0gaZV/EFq7eQrdRSjCTqgmpUJIAIE1+qMC1RrBIpocKe2YCfWXqifAitTR4tvNVP0edj4QD4FJczPd2U5H+zV6RKHJzUMIcmlQHD/dkZutyfJ09oqHstHK9ie2cIEaC6A6MjMsdmQahef4XYya2RSBiiDjbI1dyeMEr1lT9xA+7xndjOHV2lJydESfvxocdC2Cd07H6OWeP5yLvInzuk43gINr0iiOcwL5DeSLt13N0m68nBpEyoeKzHRLCE8sfG9IS/1dB90vwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HF9VOLKprswapEDAPCs1DA1SKU+Jz/YTpWdq72BTWN0=;
 b=K5iF3mbKLHYTZtV5jRAAaTK5XtzqxDeR4nevNEo3I0HB4n5vEb1nhhrblOqe8LYa5NQGl7wYN6gHN8s5SRiREsqCT2MPVRHiF42SPLzb4allMjouBNBhiJrHKcLzCL0HoY5nQW+ic1CiQlkvBgQBiD40BKkuE2dKm3RDZ5WBGfFbrVAtrYiRjLVGYZXrTgVl9ZZVEgFVzq2wF7mUxfeh8dW74cZFO0ggfyX1La/zpCZMGMlWuF2Rk7LvU6NpM5iQGpIVffcsgAjhbsLKW0eFpFDCl+kEa03tQHZ/4Oy/mH2rvztuz7PQEO58n7WU31i77pDJnKI9PDExzjbn7eolYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF9VOLKprswapEDAPCs1DA1SKU+Jz/YTpWdq72BTWN0=;
 b=WjxADmQUPUVnYT/u+nX/gpcDfkk+643PZFeSBKkzpXyUwbvRemjpoWOT7nJ2UC6vhHk+YD22XtuujDNY3answHeMc098AyQj7IPgMbUcwRnccFlmFB0zlbhVXoFZUU8DJiCUmgblHfZrAD1pmLXPrPdTxpJ0LajFomV+Ce20vpl/wcrnA9OWDZH7V8bC0qF/CIlzqH5jQsbJAcsagMNxlYSpJXuTbdBgvOAPL9F15KpdhsMvr72Rfet8iZkY8XHx7rjIQtOJaVkQpBNBerdm2bNsiGRxk347aWXrKlFlhSgE9j6OK9XNxLTnh4RSpwQI8pWKMhm8TIwYLOC+/oGu5Q==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 10:50:30 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:50:30 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"robh@kernel.org" <robh@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>
Subject: RE: [PATCH v13 5/7] i3c: hub: Add support for the I3C interface in
 the I3C hub
Thread-Topic: [PATCH v13 5/7] i3c: hub: Add support for the I3C interface in
 the I3C hub
Thread-Index: AQHdCZHA5sJA/lH7RkG4wctPPYMVVLZbm71A
Date: Fri, 3 Jul 2026 10:50:30 +0000
Message-ID:
 <AS4PR04MB9362B88A0273E3AAD52E812DFBF42@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260701065755.2067793-1-lakshay.piplani@nxp.com>
 <20260701065755.2067793-6-lakshay.piplani@nxp.com>
 <20260701072319.165A41F000E9@smtp.kernel.org>
 <akVtnLsdN4ZEP7XN@lizhi-Precision-Tower-5810>
In-Reply-To: <akVtnLsdN4ZEP7XN@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|DB9PR04MB9500:EE_
x-ms-office365-filtering-correlation-id: 5290703b-8ac1-4c46-998e-08ded8f0e69b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|38070700021|22082099003|18002099003|3023799007|11063799006|5023799004|4143699003|56012099006|6133799003;
x-microsoft-antispam-message-info:
 AU9VLZzj99TrTL4nHnhXL/6Jlzx0TO43XJgGBtBXrZB3H4GmunWW13DeVONcj194gU/a0H099LkSTJG0bwowO1nFbkwEnWUXxRXcoiK2Nu7e33QS5UuALZpQ94DhdWxBm1a8fDFwTtQOvXd9kQVkIv2t47xCL4EvDNo+jNnHdkpfhgOF92tcEBRPokDANJpJ+bBLgfRkvZD7IrJy+GHE+R/oHyyTh4aAqHpzQeHGyDa2orSMHodAdtX61ZsGZT3Qn0j1O8svgM5oj0z6EVs0ocM5brikHdgDYGyjmm2Wi1kIr0ZvTeAAbdLosLWVoZRTKwwq9cdsDpkxgo8V2AqEmL93LL6iYg7hBM3Igum/fDvD5e0epcb+bKWly8HX9MNASoOLxK9tYj3XlcUhOa0x1UU9/kdF3j5EbxwwJeRu2VqT9wcceMGR8BaxNGkbm3qinFptvJfcJpH/roBZzHOHN0MRLac5Yzh8MjhB0jsgZ289n+ZzKPhitXey6zS4TFSnQYqKYs9gUbTFEVgS2+4kT0Ni/scTlCfH4OURfKyjI/yrqC6Le3UXrV4LBaVPGb7/ZOF8M2wr4cnmooAxs65Jr/YTE0bv20APrdEFp0rw9xmFbgthfydV5dFWIxj1ymZmsmWzvQ8lOk6Mv2RGUCtmWlemuCrEAd6jMG2+3WHuz8gYJhqrTCyZ5sOi3IUEtCMbbl/EJGzmvIl0E9mhRJ4W0rgKB8PMawkoKZW9YxiuzJo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(38070700021)(22082099003)(18002099003)(3023799007)(11063799006)(5023799004)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sGxCKL/JIyYcrihOGoWAYUGD4l7c3vTvouuIDzonFOBlvXNvc8sPcG+fWd5M?=
 =?us-ascii?Q?aCu+7bk/gSGmomBd62QIR11QFhEKa/61GFYzkB5MHpyj8wsAmHJ7x6VFPudu?=
 =?us-ascii?Q?GitTpiilLKSuI9DPYwlD2U/A/g83BvKwfvweeuTz21E13Y8bkHsIZL+Fm0ak?=
 =?us-ascii?Q?aiUNJXjy+f10PufydG+o3rAQGjR5m5PLnEd0PSrNB9dIzzJSHTK37gGy7M0+?=
 =?us-ascii?Q?9hSIZDqjtobU6cygIQK/VDgS5WXzAh1qkzuvzyK6tJUeSpTrYVa78oXU4yNU?=
 =?us-ascii?Q?YJl3pyItZ33N+jjYFrRgVUWF+sGChw6rd6vnmE4isteHTQnIml4+dIo/QJNJ?=
 =?us-ascii?Q?QqtaeH4J42deMCycBmHI7wgGJnfFegqkVBAe/p9U73LAoq5vd5kFKjOeGFHK?=
 =?us-ascii?Q?5Gat+A7x2S3i03uyIPHM+3X6qBif1GEes+6jq2ExQZMsTx62O1tg9dXAU8Q4?=
 =?us-ascii?Q?TiVBQOIH+DzQ/9axfGzprnO1HA9BV6gt8QxhpYWh0USu0YVUfbrX4qoUrrsw?=
 =?us-ascii?Q?v9iJF25GI00unlOsCy82nors7ON30fL57OIIQHKjffjiD7shYLcTxY2A+euu?=
 =?us-ascii?Q?Sg9+/k+1g9vHeK9CW0cBQIUJo62RkvwdKnfHabysPmCSIhILsapypermeYcv?=
 =?us-ascii?Q?rCD2VmNjzWDsY+R8dW57I7Prli6PKfDai7FsT4r3NwGYi3d0ULb94FSvN6Ab?=
 =?us-ascii?Q?+DWMnc8/FDgJDi9jn+1M0FWrQATjyRIxPVQNPdmJNo0LC0VK1kH/bpjSStpe?=
 =?us-ascii?Q?XHSfE54yeqXYVn0jP2RzYFmVjGaqER4+GJ5jIMWHSj2xpzmqF7wZyMGoBRjf?=
 =?us-ascii?Q?Viqrci46ssTuieG1ka7ezGB//HeUUBpEzAEXlVOYnVKvq6moN7lXexkQYaAT?=
 =?us-ascii?Q?DnnZAxxotPcy9foU7RL7h646kA9bacJ1QuWOS6gphZNl/qSUXpI6cOYqxy4v?=
 =?us-ascii?Q?npMvgw/Ngw2D3QAtbPKzoitvW5pCu8qJk5PUA0BN2tfqlwSsSoztk6GTT1Ya?=
 =?us-ascii?Q?TA2fhVUmyFaI3xtjUTsXTDZXGw0G8kQ+i/rbp6XX5sbpFa2cvFBHotLfndBC?=
 =?us-ascii?Q?u93Xz2MEIEMPicEAiBQwrvYt5yCK1NiMpFlM0QmTzsp01eE6eZ0jHqOyy0ai?=
 =?us-ascii?Q?hLEtFeoFcN1mJygV+bOR2XJZA12dCRF9LnoFTQEqDgOjfFebfLaC5GBoSiB/?=
 =?us-ascii?Q?L1pDMxdjRpKa73R0Z5fX+KLp5+bUcPVl8MBntxusRsPTXjuAFRBfD3k87ZoV?=
 =?us-ascii?Q?KZhp6bRUvZdyu5UJwl/ie+JCFNLWnJzlT5fpTM+Fbu0aOb8MDzVhqMUhC9bE?=
 =?us-ascii?Q?lLPNw/4wgw5TzB5HtpK2wRLc2l5CamozL8h3N13bjnp4juDeUTEmChB/3LHu?=
 =?us-ascii?Q?Ihx/drU/t8aDtrvkPOG0w6UTFP95HJqwsRlGx7Shp2aKPnq+XbYX/B+MgXEx?=
 =?us-ascii?Q?AVVjysQHNQIYDx1r3R+GXrddyLEjLof/ArZJj0c3nIRwYvWXPhnWB/K7+zQL?=
 =?us-ascii?Q?XWLHjELvsF3EiaSUSb8K8RB+BXJcndqoBYPh0L85BM6fYDANEMJnC0c8wP6O?=
 =?us-ascii?Q?RJ5BSPpB8Y9Dgtw6zdIZDQSBElOI+cWQPx1BkQ556IqcRL9sSK+itp0vzZLE?=
 =?us-ascii?Q?NqFRun2diKeABBHC5jxPT1AoJEagNw6HpDzrvCjX3/qFy9JQpOgPqclnQOlK?=
 =?us-ascii?Q?wMHckUw8xGr4XL7ntVpIdpSFmSd0njityFaagfppMrTW5yNvQTSx3RwipfSz?=
 =?us-ascii?Q?mqbLIDAycg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5290703b-8ac1-4c46-998e-08ded8f0e69b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2026 10:50:30.5629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i2ryt6WRKG+B2vqf/zkomFYQd95doPZex7wPyHSUtXjrE1W/bljuzx1S/H+WHgeaUSE3vaMd6WRUhg7v3jNjRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500



> -----Original Message-----
> From: Frank Li (OSS) <frank.li@oss.nxp.com>
> Sent: Thursday, July 2, 2026 1:12 AM
> To: sashiko-reviews@lists.linux.dev
> Cc: Lakshay Piplani <lakshay.piplani@nxp.com>; linux-i3c@lists.infradead.=
org;
> robh@kernel.org; Alexandre Belloni <alexandre.belloni@bootlin.com>;
> devicetree@vger.kernel.org; conor+dt@kernel.org; Frank.Li@kernel.org
> Subject: Re: [PATCH v13 5/7] i3c: hub: Add support for the I3C interface =
in the
> I3C hub
>=20
> On Wed, Jul 01, 2026 at 07:23:18AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 7 potential is=
sue(s)
> to consider:
> > - [Critical] `i3c_hub_request_ibi()` intentionally frees `desc->ibi` ou=
t from
> under its caller without cleaning up its workqueue, causing a memory leak=
 and
> a double-free on failure.
> > - [High] `i3c_hub_free_ibi()` causes a guaranteed NULL pointer derefere=
nce in
> the core IBI free path by recursively clearing `dev->ibi`.
> > - [High] Address spoofing in `i3c_hub_master_priv_xfers` corrupts paren=
t bus
> address reservations and suffers from an unprotected race window.
> > - [High] Missing `xfer_lock` in several hub operations allows concurren=
t port
> enabling, breaking virtual bus isolation.
> > - [High] `i3c_hub_free_ibi()` permanently destroys downstream device
> address reservations on the parent bus.
> > - [High] `i3c_hub_do_daa` delegates DAA entirely to the parent controll=
er,
> breaking boardinfo matching and DT topology for downstream devices.
> > - [Medium] Acquiring `parent->bus.lock` while holding `child->bus.lock`
> triggers a lockdep splat due to unannotated same-class lock nesting.
> > --
> >
> > commit 22c2a31197952a434777498d93a1ed925009d6de
> > Author: Lakshay Piplani <lakshay.piplani@nxp.com>
> > Subject: i3c: hub: Add support for the I3C interface in the I3C hub
> >
> > This patch adds virtual I3C bus support for the hub and provides an
> > interface to enable or disable downstream ports. Virtual master
> > controllers are created for the downstream ports, and bus operations
> > are forwarded through the hub device.
> >
> > > diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c new file mode
> > > 100644 index 0000000000000..d29ed40b6f735
> > > --- /dev/null
> > > +++ b/drivers/i3c/hub.c
> > > @@ -0,0 +1,566 @@
> >
> > [ ... ]
> >
> > > +static int i3c_hub_do_daa(struct i3c_hub *hub,
> > > +			  struct i3c_master_controller *controller) {
> > > +	struct i3c_master_controller *parent;
> > > +	int ret;
> > > +
> > > +	if (!hub || !hub->hub_dev)
> > > +		return -ENODEV;
> > > +
> > > +	parent =3D i3c_dev_get_master(hub->hub_dev->desc);
> > > +	if (!parent)
> > > +		return -ENODEV;
> > > +
> > > +	i3c_hub_enable_port(controller);
> > > +	ret =3D i3c_master_do_daa(parent);
> >
> > [Severity: High]
> > Does delegating DAA directly to the parent controller bypass the
> > virtual hub bus entirely?
> >
> > By calling i3c_master_do_daa(parent), it appears the parent discovers
> > and attaches downstream devices to the physical bus instead of the
> > virtual controller. Does this cause boardinfo matching to fail since
> > the devices are defined under the hub's device tree node?
>=20
>=20
> Add comments here: like
>=20
> /*
> 	All target devices which connect active ports of hub are tread as
> connect to parent bus at same time. So keep simple, all devices dynamatic
> address should be in the same address space, that means it is differences=
 for all
> target devices even it is at difference ports. So far, address (128, need=
 double
> check) is enough now.
> */
>=20
> Please rephrase it.
>=20
> >
> > > +	i3c_hub_disable_port(controller);
> > > +
> > > +	return ret;
> > > +}
> >
> > [ ... ]
> >
> > > +static int i3c_hub_send_ccc_cmd(struct i3c_hub *hub,
> > > +				struct i3c_master_controller *controller,
> > > +				struct i3c_ccc_cmd *cmd)
> > > +{
> > > +	struct i3c_master_controller *parent;
> > > +	int ret;
> > > +
> > > +	if (!hub || !hub->hub_dev)
> > > +		return -ENODEV;
> > > +
> > > +	parent =3D i3c_dev_get_master(hub->hub_dev->desc);
> > > +	if (!parent)
> > > +		return -ENODEV;
> > > +
> > > +	i3c_hub_enable_port(controller);
> > > +	ret =3D i3c_master_send_ccc_cmd(parent, cmd);
> >
> > [Severity: High]
> > Could the omission of hub->xfer_lock in this function allow concurrent
> > port enabling?
>=20
> look like correct, you acquire it at i3c_hub_master_priv_xfers(), should =
be
> similar here.
>=20
> >
> > The lock is used to serialize private transfers, but callbacks like
> > i3c_hub_send_ccc_cmd(), i3c_hub_do_daa(), and i3c_hub_enable_ibi() do
> > not acquire it. If a private transfer runs concurrently with a CCC
> > command, could multiple downstream ports be enabled simultaneously and
> > cause the hub to broadcast traffic incorrectly?
> >
> > > +	i3c_hub_disable_port(controller);
> > > +
> > > +	return ret;
> > > +}
> >
> > [ ... ]
> >
> > > +static int i3c_hub_master_priv_xfers(struct i3c_dev_desc *dev,
> > > +				     struct i3c_xfer *xfers,
> > > +				     int nxfers,
> > > +				     enum i3c_xfer_mode mode)
> > > +{
> > > +	struct i3c_master_controller *controller =3D i3c_dev_get_master(dev=
);
> > > +	struct i3c_hub_controller *hub_controller;
> > > +	struct i3c_dev_desc *hub_dev;
> > > +	struct i3c_master_controller *parent;
> > > +	u8 hub_addr, target_addr;
> > > +	struct i3c_hub *hub;
> > > +	int ret, xfer_ret;
> >
> > [ ... ]
> >
> > > +	if (hub_addr !=3D target_addr) {
> > > +		down_write(&parent->bus.lock);
>=20
> call i3c_bus_maintenance_lock(), move it to API.
>=20
> >
> > [Severity: Medium]
> > Will acquiring parent->bus.lock here trigger a lockdep warning?
> >
> > Since virtual hub operations are invoked by the I3C core with the
> > child bus's lock already held, acquiring the parent bus's lock (which
> > belongs to the same lock class) without nesting annotations might
> > produce a false positive lockdep splat. This also happens in
> > i3c_hub_enable_ibi() and i3c_hub_disable_ibi().
> >
> > > +		hub_dev->info.dyn_addr =3D target_addr;
> > > +
> > > +		ret =3D i3c_master_reattach_i3c_dev_locked(hub_dev,
> hub_addr);
> > > +		if (ret) {
> > > +			up_write(&parent->bus.lock);
> > > +			hub_dev->info.dyn_addr =3D hub_addr;
> > > +			goto disable;
> > > +		}
> > > +		up_write(&parent->bus.lock);
> > > +	}
> > > +
> > > +	ret =3D i3c_device_do_xfers(hub->hub_dev, xfers, nxfers, mode);
> > > +
> > > +	if (hub_addr !=3D target_addr) {
> > > +		down_write(&parent->bus.lock);
> > > +		hub_dev->info.dyn_addr =3D hub_addr;
> > > +
> > > +		xfer_ret =3D i3c_master_reattach_i3c_dev_locked(hub_dev,
> > > +							      target_addr);
> >
> > [Severity: High]
> > Does this sequence permanently destroy device tree static address
> > reservations?
> >
> > When the hub's dynamic address is altered via
> > i3c_master_reattach_i3c_dev_locked(), the hub's original address slot
> > is set to free on the parent bus, leaving it vulnerable to DAA theft
> > since the parent write-lock is dropped during the transfer. When the
> > address is restored later by passing target_addr to
> > i3c_master_reattach_i3c_dev_locked,
> > this marks the downstream device's address as free, which seems to
> > wipe out its reservation.
>=20
> It makes sense
>=20
> 	i3c_bus_maintenance_lock()
> 	i3c_master_reattach_i3c_dev_locked()
> 	i3c_device_do_xfers_locked()
> 	i3c_master_reattach_i3c_dev_locked()
> 	i3c_bus_maintenance_unlock()
>=20
> Another problem is previous lockdep().
>=20
> int i3c_device_do_xfers(struct i3c_device *dev, struct i3c_xfer *xfers,
>                         int nxfers, enum i3c_xfer_mode mode) {
> 	...
>         i3c_bus_normaluse_lock(dev->bus);
>         ret =3D i3c_dev_do_xfers_locked(dev->desc, xfers, nxfers, mode);
>         i3c_bus_normaluse_unlock(dev->bus);
>         ...
>=20
>         return ret;
> }
>=20
> simple method is promote i3c_bus_normaluse_lock() to
> i3c_bus_maintenance_lock() when dev attached to hub devices.
>=20
> and also lock parent master's i3c_bus_maintenance_lock(),
>=20
> So here needn't lock in hub.c
>=20
> if parent master use write lock, hub->xfer_lock needn't
>=20
> >
> > > +
> > > +		up_write(&parent->bus.lock);
> > > +		if (!ret)
> > > +			ret =3D xfer_ret;
> > > +	}
> > > +disable:
> > > +	i3c_hub_disable_port(controller);
> > > +	mutex_unlock(&hub->xfer_lock);
> > > +	return ret;
> > > +}
> >
> > [ ... ]
> >
> > > +static int i3c_hub_request_ibi(struct i3c_dev_desc *desc,
> > > +			       const struct i3c_ibi_setup *req) {
> > > +	struct i3c_master_controller *controller =3D i3c_dev_get_master(des=
c);
> > > +	struct i3c_hub_controller *hub_controller;
> > > +	struct i3c_master_controller *orig_parent;
> > > +	struct i3c_master_controller *parent;
> > > +	struct i3c_hub *hub;
> > > +	int ret;
> >
> > [ ... ]
> >
> > > +	orig_parent =3D i3c_hub_update_desc_parent(&desc->common, parent);
> > > +
> > > +	ret =3D i3c_master_direct_attach_i3c_dev_locked(parent, desc);
>=20
> All IBI cap devices should be already attached to master bus when DAA? ne=
ed
> attach again here?
> Actived port's devices logically attached to master bus?
>=20
> So needn't switch port.
>=20

No. During DAA, downstream devices are enumerated on the virtual controller=
, but they are not attached to the parent controller.=20
The virtual controller's attach_i3c_dev() callback is intentionally a no-op=
.
For private transfers, we temporarily update the hub's dynamic address to t=
he target device's address, perform the transfer through the
parent controller and then restore the hub's original address. This does no=
t establish any parent controller-specific attachment state.

Therefore, i3c_master_direct_attach_i3c_dev_locked() is still required here=
 so the parent controller can establish its controller-private state before=
 requesting IBI.

Lakshay

> > > +	if (ret) {
> > > +		i3c_hub_update_desc_parent(&desc->common, orig_parent);
> > > +		up_write(&parent->bus.lock);
> > > +		return ret;
> > > +	}
> > > +
> > > +	kfree(desc->ibi);
> > > +	desc->ibi =3D NULL;
> > > +	ret =3D i3c_dev_request_ibi_locked(desc, req);
> >
> > [Severity: Critical]
> > Can freeing desc->ibi here cause a memory leak and a double-free?
> >
> > If a downstream device requests an IBI, the core
> > i3c_dev_request_ibi_locked() allocates ibi and ibi->wq before calling
> > this hub operation. By calling
> > kfree(desc->ibi) here, the outer workqueue is leaked.
> >
> > Furthermore, if the recursive call to i3c_dev_request_ibi_locked()
> > fails, the outer caller will execute:
> >
> >     if (ret) {
> >             kfree(ibi);
> >             dev->ibi =3D NULL;
> >     }
> >
> > Could this result in a double-free on the original allocation?
>=20
> look like make sense
>=20
> Frank
> >
> > > +	if (ret)
> > > +		i3c_master_direct_detach_i3c_dev_locked(desc);
> > > +
> > > +	i3c_hub_update_desc_parent(&desc->common, orig_parent);
> > > +
> > > +	up_write(&parent->bus.lock);
> > > +
> > > +	return ret;
> > > +}
> > > +

