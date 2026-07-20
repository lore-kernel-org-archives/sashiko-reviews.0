Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603923955DB;
	Mon, 20 Jul 2026 09:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539837; cv=fail; b=ZCL9BbmV3+TBFk6/+qXRvdr56slIsuCIhntKNjY/9aabrEsvYJo6hG2gFn4bRDujIsVhBCHbJR7G1Aeo3Wz/kzvgMu7hti9LGJK7yK8/9kBb3RgkuVJyU+RxOfjKAR2OqbQ7ejhiY7rX7OgSnT4T8sVNncX6QKVYwNeGoytHE/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539837; c=relaxed/simple;
	bh=u/eYhAdiOttDc1KmJ9URtjUU+BQJEkeTG1gep+a2iSs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=haJOgtqb5aXht0jWS4UEyzAtgRlSVlmfc6myu0V1UQfSpPDtgmlHJeqtCXFSH3gogKnNLWlwdFUVDfiQHhQev6luVSdak0W8hPb5580dENGrDyz5Kg/JNObaMqz1zEsB4N+MLeWEnYXY+uw+m2UksP+FHhzdtGH5CyT6vzL0tvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aTHaOQpo; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aTHaOQpo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjrAuXcbRPM4veFfDzEcf7RM+TVZRf9bWuhRo+V4UrAMxcPz+P1gcy/+vxnAMGnHyguA0Uq6dSRgFiwRGpQclB/gsNabggxqs9Ybd+sYvl9U6TNzHrQUvv6RqyxjQT586psvm1prRkRGNfOkcLy4z3g1xUyd2IUxnBDgKaFfMGaae4kVXOkzaPggk4u7blXHL4Nj+ncPBMM+rkJnYlZtV0ApBqZxOSctGTPmczP4t7Qg5BK6EfIm1/dnXD7L0c741hGIyOCIqf5tuVlpY4FwKOvKAy9nJUWyaheEVPtnAcoVvkr1aB1Af+T3bSE/RAFIUAd7jNdZ9e1UtIY1a5k/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yew88GMjSUfiLPKLnP2blYBgvETnd8TYOL+SC+g9V+g=;
 b=UO8by6OPGx5I4mUelnyYLcDw35P1hpMDONxIu7RaNtP3xXYZgjzP8ZE8aHpl8Ak0DF8z+49+ZeO+tWPZYuWb2ppf6t0uanMVKhbkHzWhtz77ajooVwilJKw7pFQdtAFdf15VOVpNwUOxcx/1Ys77bPZEQDpcGbtpvdUjz/cLV6zqVH/fIzoD+nM2jjinWVHY5qhhDeH6Xz6tFwiyFJZw1gLmRwltJF7yj0kOgfUw1J+9otZUbzJ/wwxvP+HQCJgZZMlIsOEcuLq9rsz9qZr1sETSZ/mKsaLfk1Kot7dERz7RGMD1UwR5GmpXT7ZXvbFEwF3Vbs/fO/wWPqtwqZsXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yew88GMjSUfiLPKLnP2blYBgvETnd8TYOL+SC+g9V+g=;
 b=aTHaOQpogQtF5KlMCXY2NV9CGoQXWy7m7GYL/aQ/cC5EI5bVLjSwKQQkKAm4wxeJpks8E+4Rr4lwlIb2DewvBV8QndYoGGKymDV7+c0+/oevxR4qBSqH0zMaH91ANevzIdI8yZBqfnX+W9faufn9fq/TR65jsvQl8kxH7zOTB/NHByJZIvP4PF26LWWJDEmlk1US1Yoj0U63Fggeh3cBMgFuI6UBbvrkqSi96M6m7q34s/tlI5T1/9Tt/xfS/h+54sz2Yg/x9e0U3uxviI4WhfB2b5A04CoCtTd41Jr845OcHav6wZoHYCSt83P3xcvIz/SFtE5bMS7ShWrLNTwszg==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by PAXPR04MB9187.eurprd04.prod.outlook.com (2603:10a6:102:221::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 09:30:31 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 09:30:31 +0000
From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v28 4/7] firmware: imx: device context dedicated to priv
Thread-Topic: [PATCH v28 4/7] firmware: imx: device context dedicated to priv
Thread-Index: AQHdFdrPQK1ooUQeqU2LnDpgJLXUSrZxjv6AgABUDYCABDviwA==
Date: Mon, 20 Jul 2026 09:30:31 +0000
Message-ID:
 <GV2PR04MB122714ADA75EC394B8C1A87BD95C32@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
 <20260717-imx-se-if-v28-4-0a9659c7e69d@nxp.com>
 <20260717111353.7D5471F000E9@smtp.kernel.org> <alpU8weYCU95_c6E@SMW015318>
In-Reply-To: <alpU8weYCU95_c6E@SMW015318>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|PAXPR04MB9187:EE_
x-ms-office365-filtering-correlation-id: 31ac3157-a8b7-4e95-f27b-08dee6418b19
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|22082099003|18002099003|4143699003|13003099007|38070700021|10067099003|56012099006|11063799006|6133799003;
x-microsoft-antispam-message-info:
 n7qpklf0U4jJNjxY70uAkBxpBGmKw5V8TeVw0Ezu8A9Mpl6euAuEDez0sdMDgTSr3c9fv+ELGkTeSu+l/TIh9Zya6vp4dUDBpb1zmabV4v/XSxi5E3yjk7Z0mtMnlFocRtkTco58ATfj40fRtMhSGKrBBQVJmK9HZ54NP7yGEuXSZug1198zr+/2JVoOSvwmTLC6PFF1lR1hOG7pRxB3Em40XqL878o5HuwPnAXYomT/gPPXEuqTtzceTe15hb9lgkxgFg8w6i/u2wl6LOiGTlUhRyXYFhvAKDQulznduPSP7r31ZNUZc1zCEuMgqSDx1clkfFpJ+qIG7wod8u9j/KvDMHlqsE/TF9IdCGIAhHKR/JCOcnpQqNeNwoIyPo4lAM2RtzpZYtNZgprqMamsTATo/rowKc5JoBv3vcIhUCDkLZc+z2MFjpw/sLmOkEB3NFty5+Dexo7oQE3XlCB6TP0T4X6fD3wXZR6wQ+BxdtQ8wKGrdCF6XnTM0D09lmk/ZrtU7nqs8zLOWOvh92vMmeOk8KG476v6Q2eT0WdtJOelPY6ku48opOQii4jhFmpu4EFI+2e2g0ULk/KcqQwNSTyyP3tYiWi2g2VRzdhDLiFnfeMA/KYxemdyigLwdE5LVOKVcxDQq6seop9NGPFuGpa/pXow24HWvN/ZK1wArRM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(22082099003)(18002099003)(4143699003)(13003099007)(38070700021)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?v6PGTa1otPLf0V0taEkEiKB7QThFvsbKMwDOIx92ytgG5eiS2KJH2lyJHHlC?=
 =?us-ascii?Q?cEB2jB8SdAVyFp/QFIcN0BRKgG4+2WrIBkOdipOf+HK3Mb4cfMcauWSwKXiW?=
 =?us-ascii?Q?nBBorvbUu1NEKTSi5qCUWmSvC201R0CvJ6uFxyNvNrqL6YrjpomWhRjS+qbl?=
 =?us-ascii?Q?UVa9XzFnLdZ9K3xagf+Q/4YBqOOKahE7AUA7qtmXbQ2cD/pbC3xoHlvoRcVM?=
 =?us-ascii?Q?O6FfaRsmI+F4oI2zvDSF61iIt7++VTwOkNtDlwZB5w+ZK5hfjZ0b6hSy2Mw/?=
 =?us-ascii?Q?dpea68XvYbAyPcS8E1pZ0pdoPhOV0KfCCZ0lu37EcePbxtXLNVYsx7zimy2l?=
 =?us-ascii?Q?sXp8wHMbQe4YM9ZmsTRzHcOJUu39tpLwcCeA8SHAw8GTiktNBQtsXBjhQ7jH?=
 =?us-ascii?Q?n+xAp2tBRDPm3g6oKEKAJWffJDt4Ym0huU2g5vEZfexWn267fU/qFknnA6q6?=
 =?us-ascii?Q?q50JevkMmXlJXmVT5yh069h8sbhtosMqFnV8R+j6bbxF9PDXYnkdeDKRyLXE?=
 =?us-ascii?Q?ZpKweMAVVQ6ArzqVbhyOOf8CQ2cz6vGJLerJlCs2GGJfAx22BAE2/WyJ5A3W?=
 =?us-ascii?Q?fVjAvz0pkcKX+bYyBgw5khfc94OyiFlaZl5G3VY8SvfTlpf+ilmNn14fWl0Y?=
 =?us-ascii?Q?k9pT1tYP9ylgKFqEtj4m7TYpooydFzMA2xnDykcwn/WR4kPl806GR6fHV//w?=
 =?us-ascii?Q?7zoZKXtp1C1T9VyOFm0s0DmhBONtJWwPzDmSCHnRXOkJ9NEjyvHRWDbt5muS?=
 =?us-ascii?Q?SyTrA4unNF1UNWxH3/X15x6blSbY3hrHiRkuRET3HEJJkwLc49rgahLW5xWq?=
 =?us-ascii?Q?XI9VQsIGQZJ9njG6tRqPa0CItp1OPzPApaDqrkF6SIGugx82A5lEzdZRpsUD?=
 =?us-ascii?Q?60Un3MJsEJ+4EfmBI8d6Z6lmyBBYF225vnHUESCciSuCx6ppscT5omeisvGo?=
 =?us-ascii?Q?JMX60bbWseO4u9vfcnhLBd+R83nYIIenkqrpzGTF9cOVk3N3eriq2FltfXqO?=
 =?us-ascii?Q?CfJi4+nNWco1Q6kwDOKnF9mztY3k3kFiUtKsnX7rSmY9v8zDx54UNLH5rWWu?=
 =?us-ascii?Q?a5r3Er6rItuw97bosGVs16q8loLS82M5JREv7DD1643JSUKEvkXSs8O2H16G?=
 =?us-ascii?Q?NYBH1YhfGkZj21wuyKnUx6qb+Mb/PYZp6ahTirBu4tL3WLvwqNg8FGJOMzSx?=
 =?us-ascii?Q?jqNJE5SbzfrY7VUspg4fVNS8XHAc7C8KNzQblC+K4INpDCDrmTatGNSx9lpN?=
 =?us-ascii?Q?0B8CtNBKxp4f7QtqOBgHBJlLO2Nrh0FSNn9D42TtnF5aFYM/oPdTPU8YmPT9?=
 =?us-ascii?Q?NIaReK/cEJ3Hmd3Iq26NpfNh9ZKumOvYa4jlqr11vyATGPwOmqYzi3XKONlt?=
 =?us-ascii?Q?Z10+hETHm4ueKoWqYASO38wGHipEqjtE1FYysyvZfyWGGeHQkO9ohA8oaU7S?=
 =?us-ascii?Q?9EHd1xC8jwkGSIlR44gHHlnYzM3bg97ZhKhOY0verYVRGUKo3N4K1I2HAQik?=
 =?us-ascii?Q?gUOPNnY1S2hVvEpG6I3b1vQnSRfmUKh+0yGM0wj2Q/2ovvruQ6aYaKhzKR51?=
 =?us-ascii?Q?XJLuN8ViF/0/wRAP6DO5o6xxTFXMAIEbwuhg9Yv8nImuF8+QPGYARJ7ERE0B?=
 =?us-ascii?Q?myJRNaLLXOYRnylVNG2ytm7x1s9xb9SSUK3OTUl9e8k4k+yNkP2D6G0LUIFP?=
 =?us-ascii?Q?cACVCob8PrdDF0R0aRpVMgQo2TM8ml2Fl6qExR76R9NN7ukhRwxLTaG84Koi?=
 =?us-ascii?Q?N71cL5WxOg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ac3157-a8b7-4e95-f27b-08dee6418b19
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 09:30:31.3801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TwCH5T/uHveX9qllKKlRVirkynEsQ7mkX4cgaIiY7hEul77POI5DhdqpnyaKq0V+BV90O2HcfcNNveLnZw31zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9187



> -----Original Message-----
> From: Frank Li (OSS) <frank.li@oss.nxp.com>
> Sent: 17 July 2026 21:45
> To: sashiko-reviews@lists.linux.dev
> Cc: Pankaj Gupta (OSS) <pankaj.gupta@oss.nxp.com>; Frank.Li@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; devicetree@vger.kernel.org;
> imx@lists.linux.dev
> Subject: Re: [PATCH v28 4/7] firmware: imx: device context dedicated to p=
riv
>=20
> On Fri, Jul 17, 2026 at 11:13:53AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s)
> to consider:
> > - [High] Data race in `ele_msg_send_rcv()` when initializing
> `waiting_rsp_clbk_hdl` state, leading to a potential NULL pointer derefer=
ence
> in the RX interrupt handler.
> > - [Low] Unused variable `flags` in `ele_msg_send_rcv()`.
> > --
> >
> > --- Patch [4]: [PATCH v28 4/7] firmware: imx: device context dedicated
> > to priv --- commit 64e554919e156aa88c2007ef9dd9fafde735e583
> > Author: Pankaj Gupta <pankaj.gupta@nxp.com>
> >
> > firmware: imx: device context dedicated to priv
> >
> > Add priv_dev_ctx to prepare enabling misc-device context based
> > send-receive path, to communicate with FW. No functionality change.
> >
> > Closes:
> > https://sashiko.dev/#/patchset/20260715-imx-se-if-v27-0-
> bb7c45952f06@n
> > xp.com?part=3D4
> >
> > > diff --git a/drivers/firmware/imx/ele_common.c
> > > b/drivers/firmware/imx/ele_common.c
> > > index ca8a32a82689b..1ca22c53b55c4 100644
> > > --- a/drivers/firmware/imx/ele_common.c
> > > +++ b/drivers/firmware/imx/ele_common.c
> >
> > [ ... ]
> >
> > > @@ -149,34 +151,38 @@ static void ele_msg_send_rcv_cleanup(struct
> se_if_priv *priv)
> > >  	unsigned long flags;
> > >
> > >  	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock,
> > > flags);
> > > +	priv->waiting_rsp_clbk_hdl.dev_ctx =3D NULL;
> > >  	priv->waiting_rsp_clbk_hdl.rx_msg =3D NULL;
> > >  	priv->waiting_rsp_clbk_hdl.rx_msg_sz =3D 0;
> > >  	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock,
> > > flags);  }
> > >
> > >  /* API used for send/receive blocking call. */ -int
> > > ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz=
,
> > > -		     void *rx_msg, int exp_rx_msg_sz)
> > > +int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
> > > +		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
> > >  {
> > > +	struct se_if_priv *priv =3D dev_ctx->priv;
> > > +	unsigned long flags;
> >
> > [Severity: Low]
> > Is this flags variable used anywhere in this function?
> >
> > It appears to be declared but never utilized in the function scope,
> > which will trigger a -Wunused-variable compiler warning.
>=20
> Yes, fix it.

[Accepted] But no need to remove this. As to fix the next comment, this fla=
g is needed.
>=20
> >
> > >  	int err;
> > >
> > >  	guard(mutex)(&priv->se_if_cmd_lock);
> > >
> > >  	if (atomic_read(&priv->fw_busy)) {
> > > -		dev_dbg(priv->dev, "ELE became unresponsive.\n");
> > > +		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n",
> > > +dev_ctx->devname);
> > >  		return -EBUSY;
> > >  	}
> > >  	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
> > > +	priv->waiting_rsp_clbk_hdl.dev_ctx =3D dev_ctx;
> > >  	priv->waiting_rsp_clbk_hdl.rx_msg_sz =3D exp_rx_msg_sz;
> > >  	priv->waiting_rsp_clbk_hdl.rx_msg =3D rx_msg;
> >
> > [Severity: High]
> > Could these lockless updates result in a data race with the interrupt
> > handler?
> >
> > They are updated here without acquiring clbk_rx_lock. If a delayed
> > firmware response from a previous command arrives concurrently, the
> > interrupt handler
> > se_if_rx_callback() will execute.
> >
> > Due to CPU reordering or compiler optimizations, can the interrupt
> > handler observe the new rx_msg pointer before the new dev_ctx pointer
> > becomes visible?
>=20
> Please check this
>=20
> Frank

[Accepted] priv->waiting_rsp_clbk_hdl.dev_ctx, priv->waiting_rsp_clbk_hdl.r=
x_msg, priv->waiting_rsp_clbk_hdl.rx_msg_sz
will be updated after acquiring the clbk_rx_lock.

>=20
> >
> > > -	err =3D ele_msg_send(priv, tx_msg, tx_msg_sz);
> > > +	err =3D ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
> >
> > [ ... ]
> >
> > > @@ -302,8 +310,8 @@ void se_if_rx_callback(struct mbox_client
> *mbox_cl, void *msg)
> > >  			dev_info(dev, "ELE responded (late), recovery FW
> available.");
> > >  			return;
> > >  		}
> > > -		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
> > > -			*(u32 *)header);
> > > +		dev_dbg(dev, "Selecting resp waiter:%s for mesg
> header:0x%x.",
> > > +			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
> >
> > If the interrupt handler sees a non-NULL rx_msg, it assumes the
> > transaction is active and attempts to access
> > se_clbk_hdl->dev_ctx->devname here. If dev_ctx is still NULL from the
> > previous cleanup, won't this result in a NULL pointer dereference?
> >
> > >
> > >  		/*
> > >  		 * For rsp_tag traffic, the sender provides the expected
> response

[Accepted] Create a local variable "const char *devname" and assigned its v=
alue under the clbk_rx_lock in se_if_rx_callback().
> >
> > --
> > Sashiko AI review *
> > https://sashiko.dev/#/patchset/20260717-imx-se-if-v28-0-
> 0a9659c7e69d@n
> > xp.com?part=3D4
