Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F863E1218;
	Tue, 19 May 2026 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179405; cv=fail; b=NFtBgwn43H6FT5rHDKuP4+fBFFnt+ehYp+YKNZT4RKNnf2E+BkPkUIb5vW7/YfjNmQGlLAmg174o0PLzFONllnXQMN9705CRXWwfN6nEG2toOBqmVpfjoVD+73f9xgUxfTk8LTlrHDsVsIuOCZmpMnDysO9FuH/g13jTCRgp4NI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179405; c=relaxed/simple;
	bh=1TFM4n+WR/4hTxaiqDk/gAYX55i2V6pSu+zTDM0jpB4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C+w7cfy3D9G1js/C+kYAkGK3p3WbBo6RUj9MsP42BibojLPQnU1SmHRzV9Tzzvu8nRTZfNH9Ja5dMcMRswBkB61HTB+R4Cvv06ie1RtpXVd+Abi/CLduTOPJE0xzNQnKUstUQRhzzzddg2oKZOQRSx7OTcPGEpMKLIRe3sJWyRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UREQqQAh; arc=fail smtp.client-ip=40.107.130.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UREQqQAh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bw7IV5cBhlIclMFgTp98JJLmoXdSrSpMH13PX9vMgOCYqTt3k2hkMe+EOlfcYrKnlmwlAhe3eDx4lsqBOpsI2yEXGLDEXeefJYdgDF425t0B21rAqM5KmaopcFMu5LzISjoQlxz/FuXyIt5TyLwGEOMVUp0G8hdyZSQqn38UyfizYZmH8C/PVxFs8pUUPbfqCpUeLcsQgGnl6Jh5y8LFnfCZkUIp5QBT3aLzxFWNybNypRjWYi7/VyZeitXRzaKkfXD+JAudiwJlktxe6HH4gvk58NJEvy5SCZ0hOpighnHUxWUXycizg5U4qkIEgUrJYPSDdvyGE5O5/XCqaRoXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5S54wqPMCBuDPiPb/VN4oRYIudc+SjgieAhLGXSqWMo=;
 b=dblArK5Gv1vRTptsRZzUqVV42xtcYXDTgP245wTiLLa30pVJ41ceH+Kt0ifS3alp6hhxHE/JPAtD0wNdic3vR2+1EC3yfFDWjVndcNucFrXroCo3OdIrCF/MWXwQ4YB+Yg+sthJsIXVD8yJmN/y0z7IcT7JizcoP2VcHiSsZDUV126VoK6pXqrzjp9CRnWNGgbyN2cgqgi3CQo1iXPDj6H1pXtDso6zBIoIvvteo871DZLG0XoTmwkbpDGgnYDVSlCnOn/STucjTLqWu8+JN6wlM1z5sL8spcmvcbo3ELFjbRlHl72/j7IwwUvp1pDFThwihgEXrhmDNKoIiJthWkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5S54wqPMCBuDPiPb/VN4oRYIudc+SjgieAhLGXSqWMo=;
 b=UREQqQAhNZA7thfzcjIWGrhwNSRRr6VRdSk3hjcyBPrl2RCYO39D1bBCwoKjQdZGv8uFpWzG1uLfQdSLroC2QljWZLqPzyousD4JLPzn2MCkxf4aOsb/I1l0717F+bE/vHYsNxLrs2IlJbqu49BYNdcX6z7oHamFtp9aNM55c83N2X/iMWmSfCNmWsL4Ag4ZKewTeXjR+oyc/KPMlJRcaUqpcqUkG/QiL5t3csbE+aZt043qBMCOLnfpApYFFpY0WXFMTszOxCVyKd9PlXdV7FL7Rlbq9rLJcWsWO9qTsG/uTehXfa8LhvVe8FnS+6fJqC2XJ4KKLVe3+VVCV70AuQ==
Received: from VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 by AS4PR04MB9716.eurprd04.prod.outlook.com (2603:10a6:20b:4fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 08:30:01 +0000
Received: from VI1PR04MB6861.eurprd04.prod.outlook.com
 ([fe80::7f96:4bde:2e55:cd5]) by VI1PR04MB6861.eurprd04.prod.outlook.com
 ([fe80::7f96:4bde:2e55:cd5%6]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 08:30:00 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: RE: [PATCH] clk: imx: Add audio PLL debugfs for K-divider control
Thread-Topic: [PATCH] clk: imx: Add audio PLL debugfs for K-divider control
Thread-Index: AQHc4e58tc5C9w/OBUW4877OM2GKnbYMY3gAgAirlRA=
Date: Tue, 19 May 2026 08:30:00 +0000
Message-ID:
 <VI1PR04MB6861029A07FA85FAE55F099087002@VI1PR04MB6861.eurprd04.prod.outlook.com>
References: <20260512-imx8m_pll_debugfs-v1-1-e1e44b21be90@nxp.com>
 <20260513200412.A7D34C19425@smtp.kernel.org>
In-Reply-To: <20260513200412.A7D34C19425@smtp.kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB6861:EE_|AS4PR04MB9716:EE_
x-ms-office365-filtering-correlation-id: 39506a73-43ed-4606-1f0c-08deb580d177
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|56012099003|38070700021|18002099003|22082099003|4143699003|11063799005;
x-microsoft-antispam-message-info:
 B35YuM8fpAt2Kw0so/iFstOfpgDkO3tPiXa2k0zAmTnr3DcoruBvOCIYF+Xc8xrzpS7Q1qzPQm4fSUBpy5nxtuzYDMNcB8T7JdQPuTW+Ss8MC58S18E3gb5lRVvtQ20mFQ+ZsxKtJu/oyDstvgD3DJSWuN6ych9+Udbw5H5ow9zQ3raeBXOt/V6yaawIckZXsieHxmVBzmvu4S61CwVY51dajpQte3mnCQG+sxVChRu3wKq7UqbWte8bxnMYHEocztniMReiPVxdAnLC4KNsTyDM5qbyh/iE+e+wBEjckYaf7VYJuWyjPMo0OVn6WlooukDSvfhVGcH0ZVSwYrwbW+m2iCqK1QPuaiXofGBcgwnzZV0tmr2wycy0L5TVew1jShy8jG+4zgAIlBESvPHiVmZRAZYPl5idyoC5k4+eXCv1Dl/1Loat8UFQC8CUrkkX+JhXE9Ea/a5+0VW9h8RXkCyOLaKCtbW9gY0HoasuSn/10ciUxM90iU87SGyT3UhNkdSMSx8rXkaZnzxGbd8CAfJyErnAyfRIbxArQjbcEtK3OpOKE6pHyOqzJ6/qkw2cYxSXPZyzpvycQk9yjkTD5dHXCAFVpx0eczG+Diss0LAhYC4KtNxrFBjn1X2dJe7GZKj/GuFWWRhA/vEJ8cIa5SPAk6TkoXpNN2CQo1T/vtm05plhKTrMXtXMGLM8YJxQ7cynOUzjiaIkMAgbnXD81kVdKgDCahLFVEJWteW9NZ6+ygHbOvRTsC6sEaDxm50y
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB6861.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(56012099003)(38070700021)(18002099003)(22082099003)(4143699003)(11063799005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lymCCH01PPgHKywEM470mMTtOtNTSPULp2FZgCAvtAtSkULZvBNO/TrL/MZV?=
 =?us-ascii?Q?2/m4/u7IPuxvyobM+PdabDVsfYaiV2hCrjdscOoHD7FV+JMCCUOoXUcmD/Ya?=
 =?us-ascii?Q?qEdz2iAaGFabVvm5sqltejocNPDLZWweF3svSFSiu27za+0+GhqXQBXqKk8P?=
 =?us-ascii?Q?e4XpBv7k+8ESneKt+xcRVX4zPgOp9Yz04iHNuVF7Dvj0a8xjQQ32MaL4I+1N?=
 =?us-ascii?Q?lYDd5Xu5rDJN8195bwBpjNtKRl+fN1Lz+KJs7I2MT4Q+DRndkDkyYSNTZUyL?=
 =?us-ascii?Q?lUKVbFfqBJXGcBeEpxuyL7W8SptJ+3WHgPoJmsPixwzYmswMg6FwzhUbMk3w?=
 =?us-ascii?Q?CtX8ObUNKf7t8d/37XugQkPqme0K7bkcqMnwviPW/4Zod8UgERn4tALFQcWV?=
 =?us-ascii?Q?wMaUMlomnXDnSrZhZ+fRZ3rMAaHdilHax+jMOubuZGiCZtCKKEyvuwWp8fL9?=
 =?us-ascii?Q?Yb+xnNiyhImNgrlWd4CjWcK34xYi3VBDUmgztCt0HYwMEcGqUejWKrl2OkFK?=
 =?us-ascii?Q?QRPfTnQ5g3/aUOSd7tCRyUrm6D9XQZaM9uyt/CmXlE3KuHJsPV2NSgtk2hVT?=
 =?us-ascii?Q?rWNKit39FYHveoQoiFuCSh10n9pOaQJjPeCJI39WxLkqhdAK0fBMJ0ct3uPV?=
 =?us-ascii?Q?q2Sv9H3mj2gx1DfrNVZkmx0UCRpjNqeFzseTDwLjsH4YWKafWqYfZ0InTn6R?=
 =?us-ascii?Q?pw4cPwaQeF4Drw2GEUo8T6HTmPHFXGm6fMD0RmHrKYq8kAE+R1RQFCRxZUXJ?=
 =?us-ascii?Q?F6cicSm97gDiXTGRJ/6RBLWMn8uIkx7PUUe7oGlbJe+buYg0/44E8ItW3KBS?=
 =?us-ascii?Q?ObI79cVJHlfguFiWAATLC1cgZCAV5iQ9fl7Aj+/QdVbb+vqJl+jIi0pNBnSb?=
 =?us-ascii?Q?kkdz+0UOsrzlfKUzh0cmLy2F3Sh7DAyUQcr3W3J3jrhYB/MnSql6w1ST+TUF?=
 =?us-ascii?Q?xP/1UtNrx6N8Z2zVPI2j4dMhN5z+ZY+HG9vSNIAXk8EJyt6Aa/eV/esF9bAD?=
 =?us-ascii?Q?6OrSlmTh0yIQ4u8/FJUWYecDXN2Q/m5d0n00ipq3VPciZctrDw8EQfPoN4y8?=
 =?us-ascii?Q?E4AAkOejzsyvBwgzxJXsZmeDsdXNZVsaRWiwOytFLtzbCSvJwbaL2h3pH835?=
 =?us-ascii?Q?f93d0bUtm7BYTZplktf1SU0PZ0a4v/oSYzuyRrE6vhBRpypptTqwr2V3vkbG?=
 =?us-ascii?Q?2SQNyQxudaUEZ+6v6u7ql5Io7M/kTGQ3inJsTcATzM+7pcoiryQjKvfpHNAa?=
 =?us-ascii?Q?00QPE86XFVu7XFoulfDzwQOo/0o42yfyu70bk1QwBZdI0L9s7UaeEp9uX1MO?=
 =?us-ascii?Q?FnLeNWNdsMHhanXdj70GuV3Ex84/lC7djkvvm7bFYAYYuWDqphnW5tpU//VD?=
 =?us-ascii?Q?vQthWO6wY5dpUwJEmLbEORjgF0B1iZ/Chtp7NjusI772xt6EqF//5hyr6k1M?=
 =?us-ascii?Q?9OAcp3uT5gd+4EMqA/fpvhmhrLIUeXRAKrPFTbuM3yMlFVtMeWZffalA5nym?=
 =?us-ascii?Q?IH3+cxxAgJiHhrxHrMNXcHhhEQtzZkWL7rwW0R3dVoYPPcCO7o+6CgOfoQJU?=
 =?us-ascii?Q?L4BMmz92xxrbOhanSzY7kKgp0EV7WvktDIx0azinJI3xapUYxCVyA3QtXGdU?=
 =?us-ascii?Q?Q4/c2kj11F+ZMLXD6mLk6aGrN9TnOxU8OjMxHhcsDxcyxyeVVTzYy9u4cNhd?=
 =?us-ascii?Q?pAS4qX30D7RsioWRTGYFZ5HsiF7hM+pPCKHZSfxeLA+lhRfd?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 39506a73-43ed-4606-1f0c-08deb580d177
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 08:30:00.7687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dbHaDuKn8n8OnFUDx6EgDMHZp1bdU9TRBXtux/y4CrOo4gHfOiO+QMm7jLerF28RFdiNqgOqzlKTbHdOEPhITw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9716

> Subject: Re: [PATCH] clk: imx: Add audio PLL debugfs for K-divider contro=
l
>=20
> [You don't often get email from sashiko-bot@kernel.org. Learn why this is
> important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s)
> to consider:
> - [High] Unchecked ERR_PTR dereference in `audio_pll_debug_init()` causes
> kernel panic if PLL registration fails.
> - [High] Lockless read-modify-write of PLL registers causes a race condit=
ion
> with the Common Clock Framework.
> - [Medium] Missing bounds checking allows the K-divider to wrap around,
> causing massive frequency jumps.
> --
>=20
> commit 654083d958b35cc8cdcae8664a30b757df4a7f7a
> Author: Jacky Bai <ping.bai@nxp.com>
>=20
> clk: imx: Add audio PLL debugfs for K-divider control
>=20
> This commit adds debugfs support for runtime tuning of the audio PLL K
> divider on i.MX platforms. It exposes delta_k and pll_parameter interface=
s to
> adjust and monitor the fractional dividers.
>=20
> > diff --git a/drivers/clk/imx/clk-pll14xx.c
> > b/drivers/clk/imx/clk-pll14xx.c index 39600ee22be30..59f126f354741
> > 100644
> > --- a/drivers/clk/imx/clk-pll14xx.c
> > +++ b/drivers/clk/imx/clk-pll14xx.c
>=20
> [ ... ]
>=20
> > @@ -551,3 +552,81 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct
> > device *dev, const char *name,
>=20
> [ ... ]
>=20
> > +static int pll_delta_k_set(void *data, u64 val) {
> > +     struct clk_pll14xx *pll =3D to_clk_pll14xx(data);
> > +     s16 delta_k =3D (s16)val;
> > +     u32 div_ctl1;
> > +     s16 kdiv;
> > +
> > +     div_ctl1 =3D readl_relaxed(pll->base + DIV_CTL1);
> > +     kdiv =3D FIELD_GET(KDIV_MASK, div_ctl1) + delta_k;
>=20
> If a user provides a large positive delta_k that pushes kdiv beyond 32767=
, will
> this s16 addition wrap around to a large negative number? Does this need =
a
> clamp_val() check to prevent abrupt frequency discontinuities?
>=20

Will fix it v2.

> > +     writel_relaxed(FIELD_PREP(KDIV_MASK, kdiv), pll->base +
> > + DIV_CTL1);
>=20
> Because this read-modify-write sequence is performed without acquiring th=
e
> CCF prepare lock or a hardware spinlock, can it race with a concurrent
> clk_set_rate() operation?
>=20
> If CCF is updating DIV_CTL1 at the same time, could this overwrite the CC=
F's
> register changes and desynchronize the hardware state?
>=20

Fix in v2.

> > +
> > +     return 0;
> > +}
>=20
> [ ... ]
>=20
> > +void audio_pll_debug_init(struct clk_hw *hws[], unsigned int
> > +num_plls) {
> > +     struct dentry *rootdir, *audio_pll_dir;
> > +     const char *pll_name;
> > +     int i;
> > +
> > +     rootdir =3D debugfs_create_dir("audio_pll_monitor", NULL);
> > +
> > +     for (i =3D 0; i < num_plls; i++) {
> > +             pll_name =3D clk_hw_get_name(hws[i]);
>=20
> In imx8mm_clocks_probe(), if the PLL fails to register, the hws array mig=
ht
> contain an error pointer. When clk_hw_get_name() is called here, it direc=
tly
> dereferences hw->core:
>=20
> clk_hw_get_name(const struct clk_hw *hw) {
>         return hw->core->name;
> }
>=20
> Could this code cause a kernel panic by dereferencing an error pointer if=
 the
> PLL registration failed earlier?

Fix in v2.

BR
>=20
> > +             audio_pll_dir =3D debugfs_create_dir(pll_name, rootdir);
> > +             debugfs_create_file_unsafe("delta_k", 0200, audio_pll_dir=
,
> > +                             hws[i], &delta_k_fops);
> > +             debugfs_create_file("pll_parameter", 0444, audio_pll_dir,
> > +                             hws[i], &pll_setting_fops);
> > +     }
> > +}
>=20
> --
