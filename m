Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AF33FFAB0;
	Fri, 15 May 2026 09:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837139; cv=fail; b=L8Rke0MqvYpKSPuPgOUoHbC2E0kyBdHkRadUKkEffK1OBVamcz41zpE9oSeDvnVnT7Vz2TX+zLuOskAfxQbf7XWXlNCfAInNr+G4D3MSik0QKNn5qB1/gyNFzGKIx9OhhSn6J6vvMKzPP5r24ZMkEcfN9g07x+B+jSSIyQs+dio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837139; c=relaxed/simple;
	bh=mDrZHS/nmQIVg3131cmM01AzkxWvP/T0/EXglaYiiLQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lqM6za5MnPPAOejN/USOezbscUWkCsfD5+0MyEx+qvLewnceeRiGL1Yj7SDTjANvfwSEfCH+7L7sq9M41FdMUIqGuiPiLAKZQ7ayfT3kGUF35MPL8L8zLRjMbE4aLQEpUP9+9FjgDyrKb9PyMxy6zvL9WFmPgOeNAgAvtLzd7OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QmZ2iRMW; arc=fail smtp.client-ip=52.101.66.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QmZ2iRMW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IY8GVx2jsuOZazkA2KCVjHUPd2LMYdkJB2EKY/P9XqUMsb2wR5om8sZCjIT/NsAEFGblTfL0bpK8X8gaHOdmiG6XaSuZ1338uGwHB1IzllC2xl5h/ZCJ5S6rrwxSIYztsVeRViEh03dNLyzo8evz62bFq+g3HVF6W0kzFtC2UVRoedAVZ/lpEMadVmkMsfuqysRD/fzgCrCOnZWsXgeMNmtNGYUjxwADftAd2BGrtPWgpDzZJ5qs0Lemw+Gt0wrkEnkjMbTtH5igq2o7Vxb90IKTgWDHF6FJKdtOiZwTAK1g6Y0bikQgTFqbssTUykzR+PZ5xnEBKTXo+EX//bPdMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45NxpZq8yld4bP0Miy0hpyUtZpo947RY6bao6FYr1ow=;
 b=NWbLw/SCIvSPvECogm6v1olvHml6VhI7TidZzZBj5+IcIEMl4V49ZbTVqpQQmZ0FQ/nbv4yziXTN4RAgDC+bAGOCbsAqNfhE09WdLlZGQm7rD5Wuv+aHwIQfl1WNLVAF03p07jnnY/e0nLLkrLcP0jkV2VDZt/8xNH4U8pVOJnXqbFsl5vo6YVF/77d72stnycHirsYzO6BpubX11KbCHPbQROQk5Y4GQkPQkKxPP881pvmKGbMRBZ2zFMeT/vZ/LuP3d9Q/ucwIpwrz5VgXG7v0Wn42phowjcdkBJLctM01/D65yLYa5P8x3338zOeuNFuvN/MppwnfksBAi2yWRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45NxpZq8yld4bP0Miy0hpyUtZpo947RY6bao6FYr1ow=;
 b=QmZ2iRMWmUbsg8leHOqYJD2wV+WgdKqMRYqMlpKmD51BcKgdKyTlUz/9/7IAMKuPYvdM7NTbkBiDHWo/N/ibY9g+2EVdgemtQilLSru3XG5sua4z29JuZ2gF1tdghyv7r2xBTblLHaPfg78pqZ2OwhpS4IXqP9vhO2SocM98zqB5NrQpL23DxjiiGg6RzehRCrqxamHJUx7Q41cZUlgrd3SlAqdV1udoEU+iMOs4eVHVkE9XaweiNn1f80Kq0B9kY3GK9VUqVZJJY4YrdJeiTFCz7ICx15kNkr53vQrZO/Uhef8GIWbz9uGRcyP0wfK4BIEeETmuD3Hg8h9QFNS7tg==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by PA6PR04MB11715.eurprd04.prod.outlook.com (2603:10a6:102:525::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 09:25:34 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 09:25:34 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: RE: [PATCH net 2/6] net: enetc: fix race condition in VF MAC address
 configuration
Thread-Topic: [PATCH net 2/6] net: enetc: fix race condition in VF MAC address
 configuration
Thread-Index: AQHc4sc4Iq7A9Uw0c0iMl2VGLzv4TbYNW5mAgAF0eCA=
Date: Fri, 15 May 2026 09:25:34 +0000
Message-ID:
 <DBBPR04MB7500E299684A7D0981BC514288042@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260513103021.2190593-3-wei.fang@nxp.com>
 <20260514105821.6B993C2BCB8@smtp.kernel.org>
In-Reply-To: <20260514105821.6B993C2BCB8@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|PA6PR04MB11715:EE_
x-ms-office365-filtering-correlation-id: 293540bd-4cc1-45d6-419d-08deb263ead1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|38070700021|11063799003|56012099003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 2rn4/uL7gQLMOB1AMrj7rsVNfPNChKe3Pw/Y4eUfuXmStHNOOiBZkZ/L6l6qlKwLC30heEoi5g0p84KIZNwA79DH/97GqLYEp2iTl6KOOUIQo5j/eYdvmMH5IPmLTNjJ546wYpZ5xfvczt061qDpZc5qmXqhQWeFrr5BH2p+IicsaeQVuD+OzdmZhWRRKnYupdNs7Yop2PB8M2HyXetFU12uhRwwISkpPM39ZmM2HOwh6ft2XlGO0JtOqX8C+Ml1ZKMyLrM+aTxtEu0WvHZxxhBqeCRlDxmoPVgdMEVmh84ySLL64Sv1f5ym+lLiXjGQ7DY/mbVhPVIosoqJumy92W6wzAMQdkHab/+6q8Di/uAH/zPve0VT9P3aFl4Cjyr+ypBt+BPaM9mO7GQb+MenQpGsZbcADpwXTHbJdTJ7Nglgv+O/wQ3gSjZOkSAKqwe1QhEB45GtlwDim1NeuJHTmdBwMekyM/rxzHEasmx6z1sKNAODmiKDseSmNUV722AeXBE3dGKVH8iq/EimrCGiuYnemHSeKe4W0bp/GgEPmSWt4NDUrwNm4hLI4G2v2ViGUASkuvP5loif7xL0eWxYRIT9xmSld00741MXzSCm+YzbXQ+6K5q1uR5gapyK5zchd4swjbLSKuLU52vtC7EsjGYI6LL2IMbStJQ7MRBDMsS3hLQOqm+eFeHYwEXdMDv3UHh3fSF7uFTxSG2YAG4w+7QhH7UIJHAYsno+o1Yl54AzH8nWgt80diBGfdUmIDya
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(38070700021)(11063799003)(56012099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/DGZXqQJdV7wr1bUvh667335rlyN4soxD+8acRJd24aLgAlGm2+oFeJ70RtN?=
 =?us-ascii?Q?mM16cSBk6L6/Is6AUQPZpVmUO7BchpyTZDl1SNBZcw8hzcQ/N0w/q8Ff4j5H?=
 =?us-ascii?Q?G2F6y8HYx0RqC9Mj25sCoK0zJX1tuvWtSbWO2WXnxz0iRZyBRMw8yaEcFOK1?=
 =?us-ascii?Q?yK1fMUY35RviwpNykmViwA6Up9h5PB8LC80tdhMxg1faNugMGcJayoHQCiUu?=
 =?us-ascii?Q?+fGIA0Ell/NaT/i3N+bOsl/lllBNgYpMI/KMh33jXeAmtaoICIBsBPXei4qE?=
 =?us-ascii?Q?yFWmDnzp5/LWPbw016wHRcKygjdJLeWdDcP/yl/ZYvunES8XdZCKUtdoIYsU?=
 =?us-ascii?Q?joh/1EUVhKeCZ3shj9Lhcxd35dZfNaYtORYIkv+IM/cHPMr8wpqxDGhncP/k?=
 =?us-ascii?Q?vyYhWWIMW5oRNmIBfk+37yZ6rASZTJwJXj5f4J5QIsI4/D5ZILZKrmVEFoXq?=
 =?us-ascii?Q?zmHeqio2bUPrdQVlKNGrN7a3lu7zo5QvZQ3ag09CaEdfvGg7GKbCsCFV94P3?=
 =?us-ascii?Q?5F09ifLZjEPRTuKwoPLFd/nD4q/zYo5FgNkbBM7fc5PStGoIurVZaTnuVqvN?=
 =?us-ascii?Q?1E4/4QT3uQgJTg/XBtvLZ/99hKloVNNiiex3ziYl9k+l/MPhZdQt9xBvX5xx?=
 =?us-ascii?Q?3iEi7/DQkd3seiS/KVPSfuW2fg/3pAdBOx+M+v37rVsg/Qd67xwCnQSTJ7iD?=
 =?us-ascii?Q?gK913ED4XSDsGOq9mGS03EeiDavRO3HOFlx+LGI6XlnktdgpsUpMJ+MzejKK?=
 =?us-ascii?Q?hy9kBhcy5XJ+hoYvIJ5RCMheqY0sSKbC9H2ot494S+hY8swyQurCEJroGYZm?=
 =?us-ascii?Q?W+c0xl3ITkysxU2Gtf4fVEVZleWTA+T8GO09FjNJYyCpYcOd5fiklAwZjna9?=
 =?us-ascii?Q?ZeMsfbmcsbddXUeQ5362XKEtd8JwhlJb+TqUr3VKDeCEr7l6mboGyKRW6NAa?=
 =?us-ascii?Q?dgO+VRvdosYEaBLSJjV+uUmjrcqyNPkQRvIhfnvmv/pcKP9kLLtVdh7ZzQIP?=
 =?us-ascii?Q?649aBnrLsiA3O7ZCsIG6KbI8QqWbc0EFD4OLsIpY/BhWAlFa71ER88x2xOuz?=
 =?us-ascii?Q?fE1NYLb/FNcgMlmsBgfmCnnmje/FH/G+dvStwi9oTZTLJyOc2NnxEgD5UE21?=
 =?us-ascii?Q?Y4hU3zuMpf8jVxlYtHS0T3LkPWGETWUUdU4Sd4sEM5DsujKbOhoBZwOYRu6t?=
 =?us-ascii?Q?2TKlC1eP30yn3C+8cS8ZJgkEm6VeX/alBG21HtA5jtc0JUGd231MsjPVhRIV?=
 =?us-ascii?Q?fO4FJYmpSSP5dd/rCvzeI/U9wM65vmLu4t9GThh49D/fdoI6w1LX+8BAuOdC?=
 =?us-ascii?Q?x/louMFtbLKRKi2fQ++9b2fFudC6m3Ofbns96ov8xznnGCIOZv97MPr/d54g?=
 =?us-ascii?Q?4/hQUjgsR2Bh7Db2lDKEd/XNpN6yGkJ8H9T4CJAsk8STHQ3O3JBtSVWJD1kS?=
 =?us-ascii?Q?DSDT36+Iu7AogYK/S1EENuukIzJMKfrRjeJhRAghhmkyumpDEHsK4VNE+rkd?=
 =?us-ascii?Q?mqW3Thlw9sc4IRKR/AqAIatDVZ6+aqKzxFCWgHOKfOmGwtTn+t104PJehabJ?=
 =?us-ascii?Q?4W3sfVHrDfxd5dyY1NTpV4mnGrcQWRxm7b9x0W+Vpnk206+SEzv7cMIG6G0n?=
 =?us-ascii?Q?ShLrkL+X5BXX7mLmwwN6jQHtoHn1rl+6dyD0ekVaBj2NsXMMKt8i1m3gQKAu?=
 =?us-ascii?Q?i0JEh7AAoJIN3GJvUk6UCaqOcGod1CYEC07r4EskEHvT2NjF?=
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
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7500.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293540bd-4cc1-45d6-419d-08deb263ead1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 09:25:34.4174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DbRplRw7p65FK/c5HE4lDhJ68T89qeywtkB0qPXckzzMEd6WhtP73I7nHR6y8+CutKIrlAC2wt0QXZvocFJL/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11715

> > @@ -252,8 +252,12 @@ static int enetc_pf_set_vf_mac(struct net_device
> *ndev, int vf, u8 *mac)
> >  		return -EADDRNOTAVAIL;
> >
> >  	vf_state =3D &pf->vf_state[vf];
> > +
> > +	mutex_lock(&vf_state->lock);
> >  	vf_state->flags |=3D ENETC_VF_FLAG_PF_SET_MAC;
> >  	enetc_pf_set_primary_mac_addr(&priv->si->hw, vf + 1, mac);
>=20
> Is it safe to use __raw_writel and __raw_writew when programming the
> hardware MAC address?
>=20
> Looking at enetc_pf_set_primary_mac_addr():
>=20
> static void enetc_pf_set_primary_mac_addr(struct enetc_hw *hw, int si,
> 					  const u8 *addr)
> {
> 	u32 upper =3D get_unaligned_le32(addr);
> 	u16 lower =3D get_unaligned_le16(addr + 4);
>=20
> 	__raw_writel(upper, hw->port + ENETC_PSIPMAR0(si));
> 	__raw_writew(lower, hw->port + ENETC_PSIPMAR1(si)); }
>=20
> On big-endian architectures, these native writes lack byte-swapping, whic=
h
> might result in the hardware register receiving the MAC address bytes in
> reverse order compared to little-endian systems. They also lack memory ba=
rriers,
> which could allow the CPU to reorder the writes.

Both v1 and v4 are used in little-endian architectures, so there is no need=
 to
worry too much about this problem that does not exist in actual use.

[...]

> > +
> > +		for (int i =3D 0; i < pf->total_vfs; i++)
> > +			mutex_init(&pf->vf_state[i].lock);
>=20
> Is it necessary to call mutex_destroy() for these dynamically allocated m=
utexes?
>=20
> If kfree(pf->vf_state) is called during the probe error path or during de=
vice
> removal, freeing the active mutex memory without destroying it first migh=
t
> cause lockdep to report use-after-free or list corruption warnings when
> debugging options are enabled.

In enetc_pf_probe(), SR-IOV is not enabled and pf->vf_state is freed after =
the
PF's network device is deregistered, so the mutex is not held when freeing
pf->vf_state.

In enetc_pf_remove(), pf->vf_state is only freed after SR-IOV is disabled a=
nd
the PF's network device is deregistered. So the mutex is not held when free=
ing
pf->vf_state.

Therefore, the problem mentioned above does not exist.

