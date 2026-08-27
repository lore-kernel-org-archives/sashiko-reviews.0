Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B97B35E1D3
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787814446; cv=fail; b=jx+ivisWbvsyTFTt3G7E/dM7jxsQ0WNvEMMvIx/Zc6PZiPPWa2StYsk3wvGEGOiUPtObinant5lKAVX3qsGf8vguv2ZkiQlNh6rOiBMqz0NCEw1+uiMcw/PBuotnq1yU7k0ATu5NEnjHCdTO0pMkDvHmjfaWeQiiYLgHE2RiLos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787814446; c=relaxed/simple;
	bh=BxmnR2mylv0ANE1jrbzQ3fhI8j1spccjBgbScg51u1U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X7Hg0H1lLoNrq+HvFy3cf1hZVQdjL6qJs1syVs3klTHpsZlkNgK/x3gq+wE/2/4fFnDOhygyiKsPyR7gi21xNlYZKMTPmGaTRzjiE0axv2Ra2rCVwsfZr33rFFcS4PW6UO/jVZPFn2mGPGukIvv0FCmMkWVZ35Wl0MnaimOh0lA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ax1qSn3D; arc=fail smtp.client-ip=52.101.84.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ax1qSn3D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMGp6KPrL8YF7zPavs8bhbGhhujLPfDQvHzQHJYyt4qyA0MR/e+BYrW7MThEYlAnW6c1cxhuy2n9I0NyAsFfA6AZZLbuM5kqGPJ2Xp8FDvpeA3DlIZ8Bsv8qolBcR4MW21FsWLuhWgdh5MUorursb9XLO4kIYY+yLuaHCuOILZCd+lvkF28L3wHLL+b/l+lsobKgpwQEZRuvejOZFpYZ9FPF16TLIX+835K6fOb+aT1b1tDJlLQvVssQhLP5k3wOoAhLRGA3lLtj6pRDHE+trcG9cbqS0mIx1sVmkh1KbDTOZ9grojf1pKNzFMc74I/7LM29TYW2avQF6ZVm1jBqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlvrEAbjN3270M/AKeh12fEzRrZJdu8Ybu1UgJ2nm7Q=;
 b=pnYQJAuX6p1l0p2KaufBhAzztDg04B5JymPloGebQifsFRVkXpdeZBvUopbBAEtC051xEtD/LGajfvmAbHRrR6MLfLeVftQT1T+WgviIg1DIFpz1+ylqUOnbWcp+rF9IFuAoc+N1qgvLQ5iR+w/m/vsGFahFx9vmMQBEZVkiBKIHygpjUXZBu1PsBIHyXAA1yZog64GKY9BR1Uo/PSvc/vHU0j1g1TdDktktJfyl/a0aNtrwtoc83psG6GG2KBhArp9BlGvUoCfYrt5OI3b1aRIUFX6VJ1H3zDCYPf23738/XPHShiKCk6kK6lgynLKqzyrvyDGCzsUHXUK8dFexdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlvrEAbjN3270M/AKeh12fEzRrZJdu8Ybu1UgJ2nm7Q=;
 b=ax1qSn3DciakW4LjfipLDPiZESIqLtXf3kMEgdYAqpmU1JiRNrBB93SjHUD7jepqQWDPK5jI8mccdc4Wkq8mETq6+XbDsXh5M1d+q1mOhJSVJh+0Lx0Swc+kaHchQtOMnjcvuXDd8VwhLgdsKR96InpQ7u3PMTAqbV47Jxj897TfwQe37dFJJG6c10Un5+CK2n8/0ctofF+tal8Gcw7/Zhj/4SH4n42xVR1VfSHyTmEKAR/plX3rBoeU/iUHuLmeNFGh57Da9ctXls3/AKwXjbSpJBsg9sU8yPpsh5096rkBGl089IzDJxFOG9ZZ9XkRwWXsV2M/NEqoSCVxxG6AkA==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by GV4PR04MB11451.eurprd04.prod.outlook.com (2603:10a6:150:29b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 07:07:21 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 07:07:21 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
Subject: RE: [PATCH v16 6/8] i3c: hub: Add support for the I3C interface in
 the I3C hub
Thread-Topic: [PATCH v16 6/8] i3c: hub: Add support for the I3C interface in
 the I3C hub
Thread-Index: AQHdNXy8pVJMAHMCNkqAf6BO1NgveraxeTGA
Date: Thu, 27 Aug 2026 07:07:20 +0000
Message-ID:
 <AS4PR04MB93620ABA477555D42B400D25FBAD2@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-7-lakshay.piplani@nxp.com>
 <20260826110407.8FF461F000E9@smtp.kernel.org>
 <ao8cNDN1IeD8teUs@lizhi-Precision-Tower-5810>
In-Reply-To: <ao8cNDN1IeD8teUs@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-27T07:02:54.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|GV4PR04MB11451:EE_
x-ms-office365-filtering-correlation-id: 18f40df8-6f6e-4140-6f65-08df0409d69c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|5023799004|4143699003|6133799003|3023799007|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 Li+X6FbHvSCkofLvyOiJSqBGMZdJAZDAlKkcRDKyLz4QB7VqudBba9fOS7FuV1vIscposoQJ3QLGpNHhvwwgOIAQfbHhhOGLgNmWI7c2MbjAwzb4G4WSvA409DDGuA6ln6MgrjLRtewnhFjtcRguuY9VqxDRkXJyrZwylxBlQYi6034AW3OTpgv9kOYAFTQ4kYG3O2m60YiFTGRDRSYD2z+6sbivfsBo1Mwk2LrKzIe9MvoMnGP2RZgBvvI4kSF3eLOo2/k4kklduws8n1o+dOpQ5CH6LM5KiHmkCccCToe/kt3t2v+PbwidPmzDHJ469gpbRic+1yksety1zqwqRP7PeZQGB/GF2oDbheoNs5472xT/ISYIvuY56pUuAl7suZ7oxnACyNoaSMEU0wqhF5aSitrvpKk1oSYxR+xRapXBQoz9SzW8tm//fq/geAaI/3nS1a5U+lYQRZOyjQTf/urKoVx/tfVxo/MnDK+w5+WfbCO8R4SpTLOqDVy3UlHQ5MWpJ3B4WOjpiBob2B3OH/BFEQbRsxuxWqcSDPb/AJ4QKBm9HEsn23D7UsB5gP37uxqHIR32rSDZ/gie+LEiGvuwqSbkTy8qSjnQWeYZgzZ1/1n/VAyorvarWtjKXH5GsgRl+0qUZ34akTt4MKGTvt8q3hHJ9BFYI6pvfb2cXYcuZ2V5KtjhvQUIr+Ip2+N4hQUQ3zgVT5MJ/2lGYt8Ol7j7hJ1/8MmE264FC9uFn2A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9PGbtBmSkczrP6W8ArHGhVZnTnCiGXV8yX5ylB+7VlPnU7YNXjN8fB28+bZ2?=
 =?us-ascii?Q?epMTArbb+NeWRt8/SaAcuO+58YU24nO8nfg4uGXOlxKws59WvNvJonQTLjmz?=
 =?us-ascii?Q?BWtcpI1GM2hDaswN2pvo93m2PgNlsalXQzNUE4ikZct3ypIt//5egOw2QoUy?=
 =?us-ascii?Q?+2A0O277wgKSLaQ5OssSGL7oliD4EOq4di8pRx7ALzMl3QpS6eRqpALeOd8y?=
 =?us-ascii?Q?pRe66YfgkifRFQ22jSWeae2EA8FuAYq7288WNRE2vFrHYo8YtlYSGIp/VKlJ?=
 =?us-ascii?Q?kpy+1q2Y/ACL/7pyADvIkIztAWU9jC942lP+/v2NFYgrWNNAbXgX/dMcIvDP?=
 =?us-ascii?Q?4OuU1LWW14slnZglgd3zAcuHJgKGKO5Y6H/BuAKAURjQuPm/YMq17gg7PdZ5?=
 =?us-ascii?Q?5ArUwTZNBSpYbrwCdroeOH5t8LCFzVsXcj6nD60N5XoF6UBMg1My8fj6fHI0?=
 =?us-ascii?Q?5ZhwrhVLuF+bNQVWeayNrb8pnWFF8TU2xZ4AnqAtniSigCnwwjCTL5qgycBK?=
 =?us-ascii?Q?ngf01T4M2B1e88mb2wZUew8rAKfo0ELpq6vw7kCFQhepd0XYKSu7P9g3eWih?=
 =?us-ascii?Q?sVbxdr4YT9aTY9qiS1OX9ylm4j+8bEunXRViPzZ0QhY6eMhSTpaHHn4SnJe7?=
 =?us-ascii?Q?w7I2a+9QduZwmASkqMY2nP5dbc8M4M/8/frZwpc1wIH/Wo+L35WDdkIVsNJp?=
 =?us-ascii?Q?0CefZLwj6zemmtFSXfpkURLUqUB+WlDlUReGs9t9pnaN84CbY5JMVrpA+MdB?=
 =?us-ascii?Q?TsV2OKeZg9Q6PxMUxS3t6B5QWV5ysIzKpGU+qqp3uMrSGh2aupVB4rzee8Pl?=
 =?us-ascii?Q?EY4HgTb0wku7h71RfHbLKoYQIKFsEQ2n3/yU17SigAbZJY40OP1cqC7ubGVF?=
 =?us-ascii?Q?rE5K9t52qfzAVj3jne/mb6xz6uA6DpLk2J1CwU9bLNCSsxWL7hkhED9lG4uJ?=
 =?us-ascii?Q?kiHrrLj6n3RSR7DQN0/ITcpEoltoxIpauTLbqyixIFbR/GVQEtfOQ+iYRFoP?=
 =?us-ascii?Q?pyoClVxMMRou434NzUVh+6503gNgME7CBii/Bo8vPOk9/v792pqJ567dImqn?=
 =?us-ascii?Q?oNb04pA0Dmo+GVnnhJw5cdlNLYWrZDBunJ3+2jwsLCfLdnCwxKk29uHKdWPX?=
 =?us-ascii?Q?vibTBuz5ZGMqy60J5DfDy6jMcXT0pO0SZyAGTuxtlv6mmE4nwHKuA3vCk8MS?=
 =?us-ascii?Q?zoybG4gITlBHgO1Y0U4h9jpcCwOV0ce18xFcYxLwMhKeOYJZ379O8arA1s2G?=
 =?us-ascii?Q?SVcYxBDXzFDBCiIoiQLWTmRUGkEp2yJPnwmsGnd0et58NHZLCOH2LF/fwuRI?=
 =?us-ascii?Q?M/GKHHESxQNJsY6SK73hGB8QPAHkgdlvAcS/BYxTJduOgkU+SaxcP9dNcwO+?=
 =?us-ascii?Q?DlLkrGbbAptMrBgjdxzxpsyjjZSganJayNriE8AT5iWqV9vvkIGpUvhnfqi+?=
 =?us-ascii?Q?tTlZkExv25te0Y0hqpJGd6NavsFQ6GkPp72m4rkGDB/a9rGemcuj49Lwu6Ij?=
 =?us-ascii?Q?maZ3pgkHJ+3p4K8cIM3Ss9cSC4bCuy8jH3dxSm6Mtk50GYp2FlpqZLE8NlNS?=
 =?us-ascii?Q?E+h6uj5kNuluaEVq3Abd9TPwD4RU/utDKq1wvTcf75I6/M174+i1VlImIdzS?=
 =?us-ascii?Q?hL9kXcZu/Zyr+L6MtCUBjrEcC/bAZk06ZlFefCpPuyLpflWhXzvatSbFaGaZ?=
 =?us-ascii?Q?9RJD9A3t9zF0dsJsAsQXFW0lszt0PGgbOquJkUc+tThdtorq9UiAhfQ0/B1Z?=
 =?us-ascii?Q?u9dcYMx8CQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f40df8-6f6e-4140-6f65-08df0409d69c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 07:07:20.9324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 45tfA1I8/QkFH+upN0Endo6JlZg5xJAGgGXExWf1INDgn9MJU3O4mMkGGzYeKmSyHI9zTVSh+RVs/xsob4CYxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11451

Hi Frank,

Thanks for the review.

> > > +/**
> > > + * i3c_hub_do_daa() - Perform DAA via hub port
> > > + * @hub: Hub instance
> > > + * @controller: Virtual controller for a hub port
> > > + *
> > > + * Enables the port connection, performs DAA on the parent
> > > +controller,
> > > + * then disables the connection.
> > > + */
> > > +static int i3c_hub_do_daa(struct i3c_hub *hub,
> > > +                   struct i3c_master_controller *controller) {
> > > + struct i3c_master_controller *parent;
> > > + int ret;
> > > +
> > > + if (!hub || !hub->hub_dev)
> > > +         return -ENODEV;
> > > +
> > > + parent =3D i3c_dev_get_master(hub->hub_dev->desc);
> > > + if (!parent)
> > > +         return -ENODEV;
> > > +
> > > + /*
> > > +  * Lock order: hub routing mutex before the parent bus lock (taken =
here
> > > +  * inside i3c_master_do_daa()). The depth-keyed lockdep classes abo=
ve
> > > +  * keep this nesting acyclic when the parent is itself a hub.
> > > +  */
> > > + mutex_lock(&hub->lock);
> > > + i3c_hub_enable_port(controller);
> > > +
> > > + /*
> > > +  * Downstream devices reachable through hub target-port routes shar=
e
> the
> > > +  * parent controller's I3C address space. The hub gates access to a
> > > +  * target-port network, but it does not create an independent dynam=
ic
> > > +  * address domain per virtual bus.
> > > +  *
> > > +  * Run DAA on the parent controller so dynamic addresses remain
> unique
> > > +  * across all downstream devices, even when they are behind differe=
nt
> > > +  * target ports.
> > > +  */
> > > + ret =3D i3c_master_do_daa(parent);
> >
> > [Severity: High]
> > Does delegating DAA to the physical parent controller break
> > reachability for downstream devices?
> >
> > When devices respond to ENTDAA, they are instantiated on the parent
> > bus rather than the virtual bus. If drivers subsequently initiate
> > transfers, they use the parent controller's transfer operations
> > directly, bypassing the hub's i3c_hub_master_priv_xfers(). As a
> > result, the hub target port is never enabled during the transfer,
> > leaving these downstream devices permanently unreachable.
>
> where reorder port, is it true?
>


No, P3H2x4x never re-orders or re-switches ports. All I3C ports are connect=
ed once at probe and stay connected (always_enable makes enable/disable_por=
t no-ops), so a prior DAA never goes stale.
DAA runs on the parent on purpose: all downstream devices share the parent'=
s single address domain, so addresses stay unique across ports.
DT addresses are reserved for the parent-bus lifetime and aren't freed on a=
 port toggle, so enable/disable only gates reachability, never reallocates.=
 I'll add a comment.
(enable/disable_port are kept as part of the generic hub op set and would b=
e the hook for optional sysfs port control later - out of scope here.)

> >
> > > + i3c_hub_disable_port(controller);
> > > + mutex_unlock(&hub->lock);
> > > +
> > > + return ret;
> > > +}
> > [ ... ]
> > > +static int i3c_hub_send_ccc_cmd(struct i3c_hub *hub,
> > > +                         struct i3c_master_controller *controller,
> > > +                         struct i3c_ccc_cmd *cmd)
> > > +{
> > > + struct i3c_master_controller *parent;
> > > + int ret;
> > > +
> > > + if (!hub || !hub->hub_dev)
> > > +         return -ENODEV;
> > > +
> > > + parent =3D i3c_dev_get_master(hub->hub_dev->desc);
> > > + if (!parent)
> > > +         return -ENODEV;
> > > +
> > > + mutex_lock(&hub->lock);
> > > + i3c_hub_enable_port(controller);
> > > + ret =3D i3c_master_send_ccc_cmd(parent, cmd);
> >
> > [Severity: Medium]
> > Can forwarding unfiltered broadcast CCCs to the parent controller
> > break virtual bus isolation?
> >
> > If a driver on a specific virtual bus issues broadcast commands (such
> > as SETMRL, SETMWL, or ENEC), this forwards them to the parent
> > controller which broadcasts them globally. This will unintentionally
> > alter the configuration or event state of all peer devices on the
> > parent bus and other open target ports.
>
> Look like system design limiation, add comments here incase it happen.
>

Agreed - it's a system limitation, I'll note that a broadcast CCC on a virt=
ual bus has parent-bus scope. RSTDAA stays blocked, as forwarding it would =
reset the hub's own address.

> >
> > > + i3c_hub_disable_port(controller);
> > > + mutex_unlock(&hub->lock);
> > > +
> > > + return ret;
> > > +}
> > [ ... ]
> > > +int i3c_hub_reserve_parent_addrslots_from_dt(struct i3c_hub_controll=
er
> *hubc,
> > > +                                      struct device_node *node) {
> > > + struct i3c_master_controller *parent =3D hubc->parent;
> > > + enum i3c_addr_slot_status status;
> > > + u32 assigned_addr;
> > > + u32 reg[3];
> > > + int ret;
> > > +
> > > + if (!parent || !node)
> > > +         return -ENODEV;
> > > +
> > > + for_each_available_child_of_node_scoped(node, child) {
> > > +         /*
> > > +          * Only consider addressable bus nodes: a valid "reg" is
> > > +          * required to describe a device, but its static-address va=
lue
> > > +          * does not affect the reservation below.
> > > +          */
> > > +         ret =3D of_property_read_variable_u32_array(child, "reg", r=
eg, 1,
> 3);
> > > +         if (ret < 0)
> > > +                 continue;
> > > +
> > > +         ret =3D of_property_read_u32(child, "assigned-address",
> &assigned_addr);
> > > +         if (ret)
> > > +                 continue;
> > > +
> > > +         /* Skip nodes without a usable dynamic address. */
> > > +         if (!assigned_addr || assigned_addr > I3C_MAX_ADDR)
> > > +                 continue;
> > > +
> > > +         i3c_bus_maintenance_lock(&parent->bus);
> > > +         status =3D i3c_bus_get_addr_slot_status(&parent->bus,
> > > +                                               assigned_addr);
> > > +         if (status =3D=3D I3C_ADDR_SLOT_FREE)
> > > +                 i3c_bus_set_addr_slot_status(&parent->bus,
> > > +                                              assigned_addr,
> > > +                                              I3C_ADDR_SLOT_I3C_DEV)=
;
> >
> > [Severity: High]
> > Does this code permanently leak parent bus address slots when the hub
> > driver is removed?
> >
> > The address slots in the parent bus state are set to I3C_ADDR_SLOT_I3C_=
DEV.
> > However, there appears to be no corresponding teardown mechanism
> > provided to revert these slots to I3C_ADDR_SLOT_FREE when the virtual
> > controllers are destroyed or the hub driver is unbound. This leak can
> > eventually exhaust the address space and cause failures for subsequent
> devices.
>
> I suppose if hub have hotplug later, we have to reserver all static/assig=
ned
> address. Can you add comments here.

Agreed - I'll add a comment. The reserved addresses come from the fixed DT =
topology and are held for the parent-bus lifetime. If the hub is removed an=
d comes back, it re-reads the same DT and reserves the same addresses again=
, so nothing is used up over time.

>
> Thank you for great work, fixed the most problem.
>
> Frank

Thanks, Frank. I appreciate your reviews and feedback throughout this serie=
s.

Regards
Lakshay

NXP Confidential
