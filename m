Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010068.outbound.protection.outlook.com [52.101.69.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551FA3C4573;
	Mon, 18 May 2026 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779086570; cv=fail; b=H+ziquMUMGEXUFiuP0hU1pLP5tM94F/OKfh9IoyX+NunNIYBHiRrWYjRP4cFk0/GDT3mWQVPmqQFUb0RMN4wM/07+bTcbSOTe66xFLo+SCzEgQqD7NFE0akO3z3N9wi+J4JJQ26AC44kfRCiEYe0mwBL0m1UlVWAChZIV5GNVgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779086570; c=relaxed/simple;
	bh=sB1RO5dJPFcluzby+vqSkxreEyWGsDnuHq36Gyy7f3o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GrjT72L9v7zlfGhIG5pZIHbGi1FJ0wJCtT05LAj1ob45K93XowZIhAd7HTS+olHjea9sed6iLvRQdSdKpYXyfk2YGKTLeYM6BLSd25ugY2un/sJF3CARubxRlGl1xMeU2XXiBRsDoyk8gwBsRCA0/L7cVCIJBG+SbuigBCqqFpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GSiHJKzM; arc=fail smtp.client-ip=52.101.69.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GSiHJKzM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l40rpAYSlq7yT1Gk7fOb19+3ngqPdp3z2tq1Z6jrf+kXYzZUzpXlFxIvgEMm0Z1w8dPLsFSDr0n3kPU9WRxsKkrPT9ok5KEcoZlltIN9cBaVhONAKLKH78MfRZT2qzBDybC7kCUe+Dr+jmhkLO1yYjKfiykUgEET/rsMGrFEy4WO7uaj+obZqmiaiLq6IMFL9Tc3ljEppQhPxhnzJxgYh69FxnLsRbutW1uNNBfayaDM/fUdQ61YdLl1FCWFpXhfHfRDUxDN+6QXIjq1Q5z3VPqWSZi7+jOjWInV8xW1+WmAQQwiMe8kiexrbq92DbKKuAhQsVg8Btp4QrQJoydRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFIp3ffs0Gqy98uUjnwe+RS/xdiO4KMq001eHxiu88s=;
 b=b+us7EDS7bSPF31hFkIVpwmbS4iE5UplmYElQ/Sj0hTyzuDaS1Z6/iQCP8Nl5SevEv3W7BQvGKSZcK9ObMW/k62FCe5+sGc73LA1kfpfKLQ8bgSghe9QBQD1MJd0SXodNSNu2VgCBAsXy+giQhsOFtfItlYuOuREz3V4KGCGsfNZGW0Vz8OtY6wfOwE3EGY9MiEqqml20p6LbxbxXkUS5gE8+38q83DnhnE85MLcz66Fg75K9ULqMGQGftZN4nuaKqiN02sbnSuUw5kOYgcC34kfRs1STsXoEOEa3NmYJerW5Cg3ohjdhk2DcMxrRifb6O7o42PUz8roPjUZQJeRWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFIp3ffs0Gqy98uUjnwe+RS/xdiO4KMq001eHxiu88s=;
 b=GSiHJKzMa8mKcQOCUTbfqJyjy4w/NtfRoPKgkld1xZH0aKrWwXZng2TGjnQMNPg/OWOAQTs+TuurOs8Bws70iNWWb59sg3DhS1Z42Mot2dxNPoPds5AfdMeepcx8xcIEMmr3mXgxQItXDrxuML2QFnqXwozqZwDH//6bw8NWZ6B1y9ldIuRNkG5RlI87p4oLy+ZQDygJfug8wx/fW9cVuZYHyfdKJPhy6dze7qq6e02U0NiWJtS6lOFBHEvaN372BSLdUxS4piFo664Yoe/7r1A8mbCoeaGcJ1Fe4M0oLvdbbu5dg2utu0s3jQMljSWAOmMdMWuO0aE8SGyt0ix4Jw==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by GV2PR04MB11350.eurprd04.prod.outlook.com (2603:10a6:150:2ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 06:42:40 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 06:42:40 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v7 net-next 12/15] net: dsa: netc: add FDB, STP, MTU, port
 setup and host flooding support
Thread-Topic: [PATCH v7 net-next 12/15] net: dsa: netc: add FDB, STP, MTU,
 port setup and host flooding support
Thread-Index: AQHc4oUinxCxnhBfcEWwzs7CEe7a/rYNMEEAgAYldHA=
Date: Mon, 18 May 2026 06:42:39 +0000
Message-ID:
 <DBBPR04MB75008131F54350B48C377BCF88032@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260513030454.1666570-13-wei.fang@nxp.com>
 <20260514082123.5C9B2C2BCB7@smtp.kernel.org>
In-Reply-To: <20260514082123.5C9B2C2BCB7@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|GV2PR04MB11350:EE_
x-ms-office365-filtering-correlation-id: 96462bba-5e36-4b32-e30f-08deb4a8a81f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|11063799003|4143699003|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 kCqbjUQEBShg64AhRDEP5yonJBlfhf1Mfgro195/FgGfcCsLQ2aR5x0vYK2ONoNLfuCcqz85rp40tDC5RrXHAGJuj8tXt4QdhOIfGBgKODYxxIkPrulIAJ29Tqxc0HdfkxK0nXc+TcrKmWKooVepunHW00uYhVCe7MqMrhRsdZehwFu17VktbiSSkAwyr3rlEZ+Nmd7TJ8mmyxpgFR1huZK6MNeeWQZ01y8l9CYziqiP6VEpj6F94m/FNbq9Ho3AqFiYBfTxT3eXzezAwEi10LFnaeW+m1nrgX6Nj2uA3wF9HHAHYymsSzvu830Hg0eVGRfJkCiuFyfPpmXk0Js3r0rR+SifbbLaKSNdN+L8nYJXsmolHYwkMK1oNVcPMzyssPV/h+VuXGg/NhqxapPxzp3V0Jq449gE3SGPvaUWp3Y5v097fbYtzcP91FEG3qmMchc1pClhEqtdxBiygmD7v5oZjeXZAxnnAv2NEvXRioiw/bw9F4jdeHPnI5W/QNv29dwBQWsW0fdZ0mjpjFqj3cWEbFI03BpWuCB16uYCYzh4LdBHQWhQwPa/AU+ud197qQsSaddkbfYobohbMTjN++i+BKH39NQNAIfEJcR3nVHSAzpwXoc/zDv5KEQkuP0RB3oI4DbqFp3Ef/8wtqef2NXALSO6VYH6uV3ZiVSbpCV1z4G5KhENojnJTDA+H5/Sh0CzHiELGhdVOpBQLOZmBnalccNR44eiNhB5O1AA/Y6YdVUfu44QlZBBncDZ2VL+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(11063799003)(4143699003)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rdj2GlBrZD64PwShQ4CEE7VrJa7t/rV8CCeE7H080RXMijOBJ7MUWgB3eTck?=
 =?us-ascii?Q?chQK+0OSy2QNTBcFkUOkDyy/Ykb6sU7dL+rqYl3dLQq1kpMIVPBE4bs3WC6e?=
 =?us-ascii?Q?NDxXNLgI8pmDbdfJLOD19VKoHhCzfntWoEMpydax5kWjJaWHbWPJOkRs8xpt?=
 =?us-ascii?Q?v+YZotaSUFXHorZdiY++2hnmRflo9aG3W8RGZLqrBeExz7g3wlM9ApccZ3eR?=
 =?us-ascii?Q?yPbdUQRRBXuMpIAy643gBhCAnA5MtwaF3sdoTUejjvaDrBWT8ecZou1gBmHK?=
 =?us-ascii?Q?98EmeZbA2yUT6XqSlDEuLXG+y9IFZqY4idFBHP1obi+aeorvh9NtEddUsbwv?=
 =?us-ascii?Q?orfdiuNO/ETnO3tZFo87l2zPOk7GMYFGChFGm2o0Z14U5HFBxZ1BSXHEufb4?=
 =?us-ascii?Q?dfsbjHs2EhMuFvMbqzbyzocC1xcdhs0pZLStSVfDpQHzR/sbP0waRsg0C7NJ?=
 =?us-ascii?Q?ky5Y7+jSW4f/xGDaFB+FeUF4jiChotkvOBTk6LDMHA2pgVA8TZlrAjrUklAG?=
 =?us-ascii?Q?otbrFQabonGvNOuzsbyLJFx9AdJsHrdl6oLNfIZB9K/1vABDlwoyy8dOTFlF?=
 =?us-ascii?Q?R2SnuvPX8PFT5mBr9nHWgn+VICwzO5V6C2t+7h0+ii1BkAMlLZlfP8g88Dxn?=
 =?us-ascii?Q?n0jApWHRMTEW/QGT3NEc/xisAUigiJVf8Zfx0sjCtC6Z5BvrRNipgRNkSf1b?=
 =?us-ascii?Q?/zFr6npsXcvvA8WUVkk/JAtKbVywePW8Bu/sy6r2IX4R66816v0Of8Zf0jEU?=
 =?us-ascii?Q?wqIsJpAzDqwzDPMbygF5qXkBrT9ZbJTxoqf24rbytzejo0HaBSxPBoAKorjh?=
 =?us-ascii?Q?J7vRXI0wHGYvwlUT5P/nqsisx/33oTTrwo/n9Flfmies3kz+mL+sj+5s+00l?=
 =?us-ascii?Q?PON1w7zupEMp4ynOZ+zuUsyyrBqzMLUEvvzS0q3w631Nf5gcxUZ6EEWQir4v?=
 =?us-ascii?Q?VT6X24Cmel7/YU2J4F0Lmfq4W3uYDJNPpFDCy/MLI0esIVQGeVzsyqMHEkhr?=
 =?us-ascii?Q?yAwwS2J6pwnQFGb+dkZwi0Fe6KImP+KYggMavGu4jni24PttH48vcC2jJkZ6?=
 =?us-ascii?Q?UnYcwJue8a2wf7t3MGbdSgcAslXNs2bEsWhinQeWwXN6MlkGnlb9bM0iL+jQ?=
 =?us-ascii?Q?8idNEl+TlFNybUA5Gtv82rOFvb99o5AcC4vT9INRE0fMI1FPmbVOafd0+3Ws?=
 =?us-ascii?Q?oK1U2bodTJ+9ECVbb7ATE7RxG+QF3vgV10qUVz2UxWEchHoTSZiJQ9BcdCVo?=
 =?us-ascii?Q?/1tdO116kzQ+bbDCT4C27R96UrPDL+pYixf/Xs4PLgU7VflZ78xgxlhhFXsW?=
 =?us-ascii?Q?DzUh/EHZ+vntc8FaiN09aAYb+e/vBs7R2BCDHV9XI02Uu9Qj1ctjW4pX3qMs?=
 =?us-ascii?Q?A/LGJ6/VrNAlHqCp75Zk2gb52eMooh++GcDyb4wybiC0LESFhagw40qPCvIX?=
 =?us-ascii?Q?nIpl4lUGJwdvGHRms9UNYo+K/hBsJfVahR9QZsH7Gm6bOE2zkvrSlxoaGq2z?=
 =?us-ascii?Q?/eRzC8LSRRhDHhOlQt+eQV2WlD7qq32mw+LOSgeNyoHVuUMtv/fYBNXa/nmg?=
 =?us-ascii?Q?IycxVQJdRXWGGMeDhouw25TA7g8Z6y6jK3HYLO8gd9swjS7kTshjTL83bGLg?=
 =?us-ascii?Q?oPKZgA+aAlUDrzkUKWdP82We5ZY7XrFKFAjbv3hvPvDlemPc0ok53ULZrIqk?=
 =?us-ascii?Q?geO48ryUfDbPHwJeAuPWWf/CjIDnK/8Pm4UcdF/8llXzdxLw?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 96462bba-5e36-4b32-e30f-08deb4a8a81f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 06:42:40.0979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FtQd0DSMJIP15MjXW8hkIRF/6U9JPRdR1qyIcKc66nk4fYVXL8PvoMOi2/U1O9ufQRH2C1NU/1gxwoLvOD473A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11350

> > +static int netc_port_fdb_add(struct dsa_switch *ds, int port,
> > +			     const unsigned char *addr, u16 vid,
> > +			     struct dsa_db db)
> > +{
> > +	struct netc_port *np =3D NETC_PORT(ds, port);
> > +
> > +	/* Currently, only support standalone port mode, so only
> > +	 * NETC_STANDALONE_PVID (=3D 0) is supported here.
> > +	 */
> > +	if (vid !=3D NETC_STANDALONE_PVID)
> > +		return -EOPNOTSUPP;
> > +
> > +	return netc_port_set_fdb_entry(np, addr, vid);
> > +}
>=20
> Does this allow cross-talk between standalone ports, bypassing the host
> networking stack?
>=20
> Since all active ports are mapped to a single shared VLAN
> (NETC_STANDALONE_PVID =3D 0), they rely on disabled MAC learning and
> dropping
> unknown frames to maintain isolation.
>=20
> However, because the dsa_db argument is ignored here, a static FDB entry
> added to one port (e.g., via bridge fdb add) is forced into the shared VI=
D 0,
> making it globally visible.
>=20
> If a packet arrives on a different port destined for this MAC address, wi=
ll
> the hardware switch match the FDB entry and forward it directly between t=
he
> ports?

As I explained in previous mail list, currently the NETC switch only suppor=
ts
single port mode (each user port of the switch acts as a standalone port to
receive/transmit traffic to/from CPU). The FDB entry can only be added to
host (CPU port). We cannot add the FDB entries on the user port, for exampl=
e,
if users try to run the following command in single port mode:

bridge fdb add 00:0c:e7:11:11:11 dev swp0

They will see the FDB entry is set to the CPU port of the switch rather tha=
n
the swp0 port (user port).

Since the FDB entries can only be added to CPU port, so the traffic will no=
t
be forwarded between the user ports.

>=20
> [ ... ]
> > @@ -796,6 +1396,7 @@ static int netc_switch_probe(struct pci_dev *pdev,
> >  	ds->num_tx_queues =3D NETC_TC_NUM;
> >  	ds->ops =3D &netc_switch_ops;
> >  	ds->phylink_mac_ops =3D &netc_phylink_mac_ops;
> > +	ds->fdb_isolation =3D true;
> >  	ds->priv =3D priv;
> >  	priv->ds =3D ds;
>=20
> How does the ignored dsa_db argument in the FDB callbacks interact with t=
his
> fdb_isolation declaration? Drivers that set fdb_isolation to true usually
> receive the bridge database through the dsa_db argument to isolate FDBs o=
f
> multiple bridges or standalone ports.
>=20

You know current NETC switch driver only supports single port mode, in orde=
r
for traffic received by the user port to be forwarded to the CPU port, the
corresponding FDB entries need to be added to the CPU port. And fdb_isolati=
on
needs to be set to true, see dsa_switch_supports_uc_filtering() and
dsa_switch_supports_mc_filtering().

static bool dsa_switch_supports_uc_filtering(struct dsa_switch *ds)
{
	return ds->ops->port_fdb_add && ds->ops->port_fdb_del &&
	       ds->fdb_isolation && !ds->vlan_filtering_is_global &&
	       !ds->needs_standalone_vlan_filtering;
}

static bool dsa_switch_supports_mc_filtering(struct dsa_switch *ds)
{
	return ds->ops->port_mdb_add && ds->ops->port_mdb_del &&
	       ds->fdb_isolation && !ds->vlan_filtering_is_global &&
	       !ds->needs_standalone_vlan_filtering;
}
