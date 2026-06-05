Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01EE34FF58;
	Fri,  5 Jun 2026 06:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642788; cv=fail; b=sHmLTpzkS+S/yBX9N4+t6di0pX8EydzATlNgouaWiJHyQlHzxwRiFHNtNV0E6GWIVbU8FG0QIKLyC7d2d8d8epk2hNHVCV81/vDVLwQJl4olgxkl3heBgg/nwQ2wq+TbqefLxMOGvqdzDiEikg0o+36nv+o6X3eLM0xqhQPrpVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642788; c=relaxed/simple;
	bh=W8kzhqvKgv0Qv9ZeDvy7yVkm0GkNWgxwRwLZx4xRdzQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q9tzTy3lxUZTPS9mV9fMFbiLRqdTSja53k5nh7Ni73mVarnPyIuiJsnNnEToOT08GVIN7yNMV5hOQNjCPeTZsr+uWewRY1KJ2xcGxg1HdwjC8+YAywtL2vxwLr5r/+8S7qvB5kWGN3E05sQhu+h0e42b+2LPLbS7Qt8VT0ScrJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=anjl+4oP; arc=fail smtp.client-ip=52.101.84.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="anjl+4oP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaHCyFWWauQ2pcCAFXFSo/cmC7XykuUhep+ED5iznBk7vtLHq8xkjFW92zVxI2rOpW/hRlq9/JsaZiWZ8ue62iZSuEowRSYSmYLiRbzBg/2HlxTHlTCsO5QRZ9x2DiBbUxPMVs9iatRkAkiJCf2jEN0VybhIKiBrGbtsmYSwfiJKPUhzTgHJTUHIP2kUjlMSOKjvypJY339H6yDSkpOAQ6rCsxzhiSzz9wxM9wNxhL3JdMtuGCJMQjiLlXpEkOG5Kxb0ezFrhNCt7fqDK64wd/lgq0uBKuo+qiyNhJTS3MaJtCv2DTiPDwDjwNpPzvA0TkJRH2ogkVbTHlp8KE21DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPyAizXztfR9E9a+QoIAhnA0iXelYZL8fPd9hh41+ag=;
 b=NCg6iyq1MiAmnqFzPTK1e91jTtNvH3wAIyYxwTYOq8TmtvUyjZDC7JJMpFaPI7XqTI/j76GuP9AP+Z0/EwKUH8sF6w0NJDEVmISUUVnCZhdDgAM8wyIrpa7g5ArvnS6CR7f6nl8mDduRJrB951Z9ZVmVFtmgSGzTjGXJttnELZ+qzWs9h4piZD0NethNi/T3TpsFu8DGv/qqPdte6xnLUNUGVTnoQYxq3dN1zzgGpxvbmdodoH949b+CvY94skPrGSc2kMKyyKS3LfoVQ2xsgvNpb3bk68IMyJ6pLfafVKIXBIouIogeyhGeqfFu9NeDTZR/3RegcZA0L6xAzm6sMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPyAizXztfR9E9a+QoIAhnA0iXelYZL8fPd9hh41+ag=;
 b=anjl+4oPdt2bcCtTyQq6F9ZlE06lX/Zyof3O+MjUmxmVX1jKNX6nSBpAej7LGAyHoiIkXCkX/BvhGbHaa0KGfJ+KaMtg/yE4fd2KiawJ/ZsGRaADLECxjLyCxYU941y4GdTNhcGzwj7fW8UV9VI2HN2z4i2qKwB6hJT+HtVvzHIoAWVl1k93CFMiP1XySGT9P8RyfvehxeQRLO+aS4lESGj/izksNDyXX2PzNTDFrc2quQ2AIZQ90gCvrvSCB8nQOYurphZdyQ4AUSkEoT7zADrMkZnzS8ZUEV1rYQaUi2BgeWKsUcYrgYDRifKfio9cJqZL81Eku9u0SwIZmpFv5w==
Received: from VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 by GV1PR04MB10822.eurprd04.prod.outlook.com (2603:10a6:150:205::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 06:59:43 +0000
Received: from VI1PR04MB6861.eurprd04.prod.outlook.com
 ([fe80::7f96:4bde:2e55:cd5]) by VI1PR04MB6861.eurprd04.prod.outlook.com
 ([fe80::7f96:4bde:2e55:cd5%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 06:59:43 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH v3] clk: imx: Add audio PLL debugfs for K-divider control
Thread-Topic: [PATCH v3] clk: imx: Add audio PLL debugfs for K-divider control
Thread-Index: AQHc9ChZxzMwvzgFyk+3ErpCF6IkH7YubE8AgADho4A=
Date: Fri, 5 Jun 2026 06:59:43 +0000
Message-ID:
 <VI1PR04MB6861F8F8C2CA70655AAFDA7B87112@VI1PR04MB6861.eurprd04.prod.outlook.com>
References: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
 <20260604135909.410651F00893@smtp.kernel.org>
In-Reply-To: <20260604135909.410651F00893@smtp.kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB6861:EE_|GV1PR04MB10822:EE_
x-ms-office365-filtering-correlation-id: 73bb4706-a231-4e65-9410-08dec2d00560
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|38070700021|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 0qUm9qLiSbYH5YgiOEXa9JMkbZSnLPM4EPh7YLr+HLbKaTXDKenraCgJjeBzOjV1R1sKT1nlQbWFHiZV7U3xbAjUSLJb6iq5tJ+Nsyy+C3owdbpSb31fZSHB1odOfpVAUtJuN0ZU9H13LB81W9Pa3x9OLrKZNLdbJ6ppsTrghWfvKkgDVWChqXOdncrHq3J/+bbCmSI9HhP2zL2KbPPa1+imyA9SGDiZ6Du4/HTbC9u8kHcqhmHS0fB3BjYzVhVyDj2Uuv9oAYfd6ObCyxcMA6ZCv6Yo5fCpQIVkdVnbg4uS0+3d30uB3+DQLXm3z2Rk+QiUpiahlO+hD/Y7sp0yC7nWyKfvbXvjhDpsF1FTT04xDueNSa38JLyI/cBgJzvnZ1Ro5mybAVJ5zPeVUu+NmrUfGDT5R3vd5eG751iUSB8k3FvgHbobTUy2vZfLOtJ+Kr4GNTlsFL73m+tENULB9fsZt4x75/UrhMcdVJmMNvyYEnOCdmP09V1Ls1FqJM1lnuucDEoldueDXRsad5BAXYcghSAwrg10hzHgmWPImv8i7hqnXW/R89W9y+Y7btjjxUF//gD5/7s8WAyesHzPUxFICbaQdbTFharZrsV+PpPvGGlEsXoKctVl7QSYMOhMAxHcJhWSbAppPfhYoleNMDMtrPlsMkGzRgW8PxtoO8mYsSsOf9yePAHiCzcT0EViIvZTgD20BqnMy6RimvAlL7VVudSsjPPar+/ervC/jTa82Es3k7L9OzqBGcwVAypo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB6861.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(38070700021)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+MPuz6DTsJ61Ci1eidSJR0Rk3gFiqdYxv4Ls8AIxLpnB0IKz2r5g+tL3H2vf?=
 =?us-ascii?Q?2S2sfrgOLvey16wtMU9rGzsVOEfIMHzeUubt22+CbYwfOyHP+KZSeO7JBePU?=
 =?us-ascii?Q?t2KUAqw9eyxEfC9k+NDI8oVidYn/qWSqQsu8GUSg24dYCnSSEhO00O1NWhI6?=
 =?us-ascii?Q?jFA/O99oO/BviILzWFElllt9nclJ/KynaDLe67eos/5QBXw2PcILcVrflCo7?=
 =?us-ascii?Q?FZwFK6hK9aNQJ8381eReXV1FzmQgh80LDyFw0HzhP46DaOAF9574I+ssHUgm?=
 =?us-ascii?Q?0CYJKOKHnlmIJYVLSa7ShUhJm0ibUGx2nqopjanFeTb/Lu2yw30pGJ6Akyt3?=
 =?us-ascii?Q?pxfLau5e3nrlzOjrpL52Qi6GS/LKydht8sWsQJJG51xisKo+gRHVmqgMgYnh?=
 =?us-ascii?Q?grmbO0raVwmLmdzDjE99+9lpcHis0Xn+BaSPC1zLio8IbDmGI86VlX7uE0Io?=
 =?us-ascii?Q?z9bsRosaGcUyk8t9/rwF5NMdWZgx+4g+v4Cus4qHDh84gp/Y09ZMWv78H3Ue?=
 =?us-ascii?Q?fBE1fuMu/UbMdAmu4Hw5q2EZFixIJqGOQUdJjk9eQMukPF+tlHww6Frw1uYi?=
 =?us-ascii?Q?Lu8WYbUEHeyZn/Uzu0A92ukypNoKU5gtp2JNYrH84X6YnR3OPMFd2D81t/ba?=
 =?us-ascii?Q?65O8EPe67McdGF87Q4KPGjIvmsVpuY1Qwi9X6c5jbTD7zpJRalqqg6Smg16r?=
 =?us-ascii?Q?u8o8ONhV9Ygm/JFBch/sG4XXlWuRdACLKwucZBKoydy4rfH0BaYmjY8bT5iz?=
 =?us-ascii?Q?+rtKDaamo5cVSOiQIMbCJfPZECaX4m7vsk1Y3cgvds4KHs1gctdOPThXtSr+?=
 =?us-ascii?Q?76kDDwiKVoa0bmy/7IoemSQqFQsxbHoIqSpXJJn2B8FQmRmsNMcxMDtflaw+?=
 =?us-ascii?Q?y2WIVPb3DhNEZy6sDw+wDuB8A5mCS/oiX0jDdWaOkf2OLdKHx2w3wk4Abzxk?=
 =?us-ascii?Q?cFXJ7d16JMdiAc5/JcSOF5a1WOHF9YbFr6sTOjgU+B2Bj/erVHayf4caBY6Y?=
 =?us-ascii?Q?VSRFslmRmhCGpDjcyzP54KqSaQVm975s0zduTzzgQb8YHKGVLZzut5UaRiBT?=
 =?us-ascii?Q?GNoShOURwpygvCoklPSnbvWsIJlZ+eib7bA7iVaehkyBTIE378z1r4dEkzfR?=
 =?us-ascii?Q?1COZySlVYBjLi9k5N1T3FbtY3WoFlFiVHUou3DOErouUtxI3MGs4LHLE2+bB?=
 =?us-ascii?Q?epmSttGz55HRkA17RJSaO6EN/DsGzKx7Lbf7SL1KHbo/fk3mlVZsIAxfUNdW?=
 =?us-ascii?Q?A1fBly8NOtDyAaOTJx7fmGWn2cglE/mhKePsFQt4PWHUf2y0Mwvj0PfgMpw3?=
 =?us-ascii?Q?ZJFxuvaJYsm9eoAp28yNK0yepQgCe0GSHol3MIVnkZEEbhYm21nn2Kisjxs7?=
 =?us-ascii?Q?9CrvkQ8OrN98b2+HlHfaPuxE1sGQEeVlpn6DLdAQPnpi0TMjWXt/SER3k/Ma?=
 =?us-ascii?Q?NIy0lqqyfE4p9GRe+9esApTcU7yJ0fvz21bJpf/TJkOdQyL0Eawob0XLNUj7?=
 =?us-ascii?Q?oh09D6qoz0dqN7R3OQhgAPxRle5ZpnTI3z6+YXtUs4je84mPaAVIeAN34SAs?=
 =?us-ascii?Q?vNVY60bWG3XeiAN6s1X8vx1l1dgNN9OjsEK6BGo8vztqtuG/5JeRgbaM+V76?=
 =?us-ascii?Q?XIwIttJI8UBScnJ/EGrnAu/GTHpfUyPoF01A+kAm2FhB5xBJXPHJkgUarlGQ?=
 =?us-ascii?Q?dmDDN+xpZUg+KKLLtngoDQFYHTUniz8rQ60fIB9xr0qw4ifh?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB6861.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bb4706-a231-4e65-9410-08dec2d00560
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 06:59:43.1224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S5dJ0+l0z1iXUs6fdTGY0I8e47KLUqj17r82Ddl7rH14HxJahAF2cFxvx7R4ib/lFgnp/sqOR0RzYMDYB+QnbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10822

> Subject: Re: [PATCH v3] clk: imx: Add audio PLL debugfs for K-divider con=
trol
>=20
> [You don't often get email from sashiko-bot@kernel.org. Learn why this is
> important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to
> consider:
> - [High] Missing teardown API for exported debugfs initialization leads t=
o Use-
> After-Free and broken functionality on rebind.
> - [Low] Unprotected read of `pll->delta_k` causes a data race.
> --
>=20
> commit 817ee72c2810a6a79b5b707e34db091aae62c704
> Author: Jacky Bai <ping.bai@nxp.com>
>=20
> clk: imx: Add audio PLL debugfs for K-divider control
>=20
> This commit adds debugfs support for runtime tuning of the audio PLL K di=
vider.
> It exports delta_k and pll_parameter interfaces to userspace for fine-gra=
ined
> frequency adjustments.
>=20
> > diff --git a/drivers/clk/imx/clk-pll14xx.c
> > b/drivers/clk/imx/clk-pll14xx.c index 39600ee22be30..b6f1cc9f57005
> > 100644
> > --- a/drivers/clk/imx/clk-pll14xx.c
> > +++ b/drivers/clk/imx/clk-pll14xx.c
>=20
> [ ... ]
>=20
> > +static int pll_delta_k_get(void *data, u64 *val) {
> > +     struct clk_pll14xx *pll =3D to_clk_pll14xx(data);
> > +     *val =3D pll->delta_k;
>=20
> [Severity: Low]
> Is this read of delta_k missing protection? It is modified under lock in
> pll_delta_k_set(), but read here without holding the lock or using READ_O=
NCE(),
> which can cause a data race.
>=20

It is not too necessary to take care about such case. In the audio clock sh=
ift tracking
case, the decision is done based on the current PLL setting read from the '=
pll_parameter'
attribute then calculate a suitable delta_k.=20

> > +     return 0;
> > +}
> > +
> > +static int pll_delta_k_set(void *data, u64 val) {
> > +     struct clk_pll14xx *pll =3D to_clk_pll14xx(data);
> > +     unsigned long flags;
> > +     u32 div_ctl1;
> > +     s16 kdiv, delta_k;
> > +
> > +     delta_k =3D (s16)clamp_t(s64, val, KDIV_MIN, KDIV_MAX);
> > +
> > +     spin_lock_irqsave(&pll->lock, flags);
> > +
> > +     pll->delta_k =3D delta_k;
> > +
> > +     div_ctl1 =3D readl_relaxed(pll->base + DIV_CTL1);
> > +     kdiv =3D (s16)FIELD_GET(KDIV_MASK, div_ctl1);
> > +     kdiv =3D (s16)clamp_t(s32, (s32)kdiv + delta_k, KDIV_MIN, KDIV_MA=
X);
> > +     writel_relaxed(FIELD_PREP(KDIV_MASK, kdiv), pll->base +
> > + DIV_CTL1);
> > +
> > +     spin_unlock_irqrestore(&pll->lock, flags);
> > +
> > +     return 0;
> > +}
>=20
> [ ... ]
>=20
> > +void imx_audio_pll_debug_init(struct clk_hw *hws[], unsigned int
> > +num_plls) {
> > +     struct dentry *rootdir, *audio_pll_dir;
> > +     const char *pll_name;
> > +     int i;
> > +
> > +     rootdir =3D debugfs_create_dir("audio_pll_monitor", NULL);
> > +
> > +     for (i =3D 0; i < num_plls; i++) {
> > +             if (!IS_ERR_OR_NULL(hws[i])) {
> > +                     pll_name =3D clk_hw_get_name(hws[i]);
> > +                     audio_pll_dir =3D debugfs_create_dir(pll_name,
> > + rootdir);
>=20
> [Severity: High]
> Does this lack a teardown mechanism? If a module that uses this API is un=
bound
> or unloaded, its hws structures will be freed, but the debugfs files rema=
in.
>=20
> If a subsequent userspace access reads the file, won't it trigger a use-a=
fter-free in
> pll_delta_k_get() when dereferencing the private data?
>=20
> Also, debugfs_create_dir("audio_pll_monitor", NULL) is called uncondition=
ally.
> If this is called multiple times (like on a rebind), won't the second cal=
l fail and
> silently break the debug interface?
>=20

The clock driver can NOT be unloaded and reloaded, no need handle above cor=
ner case

BR
> > +                     debugfs_create_file_unsafe("delta_k", 0600, audio=
_pll_dir,
> > +                                                hws[i], &delta_k_fops)=
;
> > +                     debugfs_create_file("pll_parameter", 0444, audio_=
pll_dir,
> > +                                         hws[i], &pll_setting_fops);
> > +             }
> > +     }
> > +}
>=20
> --
