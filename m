Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013008.outbound.protection.outlook.com [52.101.83.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B12C3F0744;
	Tue, 19 May 2026 10:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185237; cv=fail; b=EXS5NnUBAZWvQJURSQnPYwO+A6stBgBhs26wF0xkTJkd1+Bl++MA97YTFkPAAjyd6KH2McoO4HEJTMO9fwifGejKvbaioe0Z3nROtjTRaQ12Zy8BWb1Q2wyU0KUApjarsQcv9qkzgmHxt9rPPV0t2hI58cM+zmivNJOTlhzV5jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185237; c=relaxed/simple;
	bh=uFWzxY85offYCM5CezqKGtwjCdE3/wWcvh3W+AiClYg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SmhNyikR3A/a7ZoIMmM3ZTUXJGDfkPUoHynG8Gpl8fFWk7jLfL8SDSRo1BdZl4Ll67MR0Mq+uhlPy+EPGUfqeTvz32CYIt5W1c5S/7nReSmIf3Uq5F4EbvmJmnRGTb+ZZXyGhCVmk5qf0Df+FBM/UYiOsmj0laIq36K2VqVnHuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AmY5ZixM; arc=fail smtp.client-ip=52.101.83.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AmY5ZixM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VF2/Adp38jtfokZ7MO2vr6h+2Ob7Ty4dgDl1maAE6XYKv3IcszezBy5rG+AEqBgkhkvwE50FJ8bAdeWFQqK47n59r44YXUmGEbBUOvQw6VOqUe2eCNlAK+G80+sP1KVToKBUVr5WUCcQS0bUJYFcvHc/gbFou5k9keo33C8bpsyRG5BoZtkrMoiI2F4duIxNiHPPlSeBclEcNc1A7eQelbruH/pN2lLKb3acPJaJy5FaRiK+uh2UJg2vHpYX4ZUEwtCJF4qqTd1oqyqFnYPyERwm1b9nfDmcN5m8hDZamrmuo6Q7x73M/mDa8To4vWCjqPu1FbdZnjFY0cXRUl2qnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Awj+bi8WwPYqPRFoUQARgIbzGhul58H32w0M5EEfA+I=;
 b=xxoEs/yFKlH+FspY8x9BUoyGYpLMZoefXy0/ttDXC1AcS9bH6dUhufZ6Qc7PArD0tpUYU3+Tg+5mkYZyDA7bgC891hBdfUzEjEjpBp2PPoXE4yZ7dNbAc1ecYDQynF6T/loFMu/i1hQS/gdrv2tGvhd/ajkg09hiPb3c3NOWiHFdqFSU6qh86v6mjFhOqfZ3NMmB3e8ONR2LJlKio68cHu/GwRiwLPO4rhNlV61RyGGcfCcINKpc8ShVDRRgMgs8GsozZ0Yxm6hctOBIzHoxqpbOYavXne/Gmzhv4mQ2jMNT8IyHKA3Znoat2XUKfmWzfrXLcrjrD14JMRBm8td42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Awj+bi8WwPYqPRFoUQARgIbzGhul58H32w0M5EEfA+I=;
 b=AmY5ZixM32QD/qwjT7qJxSyfY8fCtffu6QSy6bBU6IxbehynHGzejOi82XSaolprYd4EFeiYWnKmTR1ZUHVsi+9QWxQF8hyodsFbkm4a8bm0B8MOX9SiUhI1phOvQskpsIQgkpn2vzAMn6TltOjTymdaywTd95Jw8/BsnS7vf+U7Z9uSVsMjF9SmaXxzWeXd/1Y35uubCaf25lXypLrf936URyAzzb+ZpRM9vAEYU04ZHH/xtAGwLKjF4DYATkgQSur0WJSFtFUwWVkYk6cQe334roC1v37IqTheDAl530HbvnQCiuA0+iunhpd9U+onZVk4chVDQvNGwsvFRIcUlA==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by AS8PR04MB8817.eurprd04.prod.outlook.com (2603:10a6:20b:42c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 19 May
 2026 10:07:12 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 10:07:12 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>
Subject: RE: [PATCH v8 net-next 15/15] net: dsa: netc: add support for ethtool
 private statistics
Thread-Topic: [PATCH v8 net-next 15/15] net: dsa: netc: add support for
 ethtool private statistics
Thread-Index: AQHc5p/Z9p1Kj339JEWltLqu/uGwz7YVBOcAgAAbQcA=
Date: Tue, 19 May 2026 10:07:12 +0000
Message-ID:
 <DBBPR04MB75006047E549807C87BA521788002@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260518082506.1318236-16-wei.fang@nxp.com>
 <20260519082540.A8F47C2BCF5@smtp.kernel.org>
In-Reply-To: <20260519082540.A8F47C2BCF5@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|AS8PR04MB8817:EE_
x-ms-office365-filtering-correlation-id: 6a599f25-1a7a-4801-22f0-08deb58e65a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|56012099003|22082099003|18002099003|11063799006|38070700021|4143699003;
x-microsoft-antispam-message-info:
 l3gNuNc32CIYyjPY/gM70ov7kBQSXdVyzoqDSeQ5DTNOohVMhVTcyiTQlDU+ExP0JmYSbKsgY3kWJQldKRTX5PLH+ikVeLrQ/a55xTxDDtn+BEPSG8itZYLGtjWRTw+OnoquFmugl5L7mVsuhQdcMxlUqakUMcIAV5d4gIxUnCSFBXzcRhkkz99gy2Jljd3QfRkWs12x/MggYlsUXtgVPcSKe0oRC7jZ1vcR3+fdEStCx6Xs4B93JthdFgh6uMl1yzP6TqMXHWtd8m+sRJiNm/b5Fwjan2c+tYaqeZyxJGkys4GtiUQGvdWihttTibj7iQHlMpjLb6uLwiyful1lc39TbF/km8RKeXF6n7xGXrBcxZv3K4+KtmI1CpUvXzXQ4nKT6ljHm6+R6wYwI4yMZMX+cWQjpeDuxB0LX7y5IqiN9+tBCFnjVX4KDnSwMJhgXHAHW6zRNVwWskDvhpeRJuRbgpha2wAnOmhA79wBNekdiZH6WuICcfYTvQupOeblfAQ08w9R2ZirMHBAvZRvoQ5DZ4PPL9T/8WidzJXrUjDA4APzpkMkGuz48ydyki+iTPMiSXcH1h9Hsz3O3kh/ffjJFzuP+cUjSFTioVczoYUFcGKB/wsSzOoXafcVHjcmNRxg/MG0nALLgSvlaMgbWaq9Crk/T09VGIHLFWDI7BWGrHumvB6XVyDUHtpYdFLqSSnFRsXUw/ximtrE8VKihg9XT2UycOe41fqPJG3XNyA09VWH3jEQ1H9p9I4S+urj
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(56012099003)(22082099003)(18002099003)(11063799006)(38070700021)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OhprezCLt98luj+oEXc2y2azTbkBdiCK54SNrsmxK6jxsjJFCalQC62rRBFU?=
 =?us-ascii?Q?A3OTV29CO/CxD9PyX3Ive08hTCReMDO7oyXFQtns27UbiCvlGyd+27xsm8Ey?=
 =?us-ascii?Q?7C9T8s4eHFsqLTXoWAi/sdGbAqJAqXHj9YOjHfSyY59kfRsl/dHAvCLkEOix?=
 =?us-ascii?Q?gCPGnj/LCLH8FU/nRVIT/St42I8WZNgNgMKRps+0wC1vc5jOscA42BTG51c/?=
 =?us-ascii?Q?nWobVM03/n3wxOz+f18B9vEVB4/bp8un9btCA2540ziHKttmfeq2jFxMdevP?=
 =?us-ascii?Q?OPhpS9eT/zQ77kk0LUERLuFryghE1J2NeeCUuEXqr4ZMnYqflUn9/3bC2hMy?=
 =?us-ascii?Q?JU9kGFWFC27AHxXGvkoE3s/alLk3oZuq4u/+Axv6L6eym5sq6jJa627P1AQv?=
 =?us-ascii?Q?FC0usyYRemAUTfpVnEHHcKUooc+3/d4OkYykctGhO9d5hxV/gH7srrNQUIEC?=
 =?us-ascii?Q?And0mhDyNdCJU16Rj6rjRGNTGaGLqPPvmOZhG9dIaklFHXS9y4A6BHltitJv?=
 =?us-ascii?Q?3rYOBidmQi7/XxB8XSpaSjb+Ck1hbTfKuCrFt+4IDSLPgTCDZvyTLB7UqzLY?=
 =?us-ascii?Q?URduUNpBYG/WpMWlLt2hu9H6xbF64Fz05MDKIoKgbqeIOFcRwMMle2SEKVpi?=
 =?us-ascii?Q?s8i3N0AoJWZd+7ua26Hg2MrVQyQY8cA9P9KNV7m/uIda7W/VzYsWdK8KJUD7?=
 =?us-ascii?Q?h/Mwh5WsHZby0H1Psc2r2nXq+VBFiCR2QuvomqylXaS2ie1cinbnug+YHOcv?=
 =?us-ascii?Q?96Dd72clzf0k1PYFQJ9ueb6XA11cwJjc38L3J6EuzQBnAmqgW43bJ3eftk0Z?=
 =?us-ascii?Q?35oh7Odbz7EO2Dh5LpfVicIO5dimMlTWF8lm2Z7qrRhzv8mZ7BX8PzKXqF7Z?=
 =?us-ascii?Q?yvDKRX6UadAbhT7e7Z4MRH9/R0ftG+0/QKEQKOPInudI1LVSSmmcgcVsdA1W?=
 =?us-ascii?Q?Gn6c6zTMyQtEpfdnBdRoYwtR2WDJYIwNXoRaF+I/qAYWT5V/3q3YTZiWsTll?=
 =?us-ascii?Q?cpO8AOEy1Kwrx6siOZhIrJzY95GJLbQn/DhZvLMBSHRuGVn5/E/aHudHgmO8?=
 =?us-ascii?Q?q6SHurQYQ9LIDFxE4lEKgz2cHfr1r18QukeP4be8PeFrFo98oorlTrZiBQRI?=
 =?us-ascii?Q?bwnNANSNeJdk5r0ei8hVZNbOPLOC7KsBrygihEktkdIV4Q+QK7BSWLgQOPT0?=
 =?us-ascii?Q?ysfLSVne5+ZmCr0MgOxwUhsjg4EM2C8Ju9eu9gRKbJQ/uLTjJDTDPuPi1bGP?=
 =?us-ascii?Q?Nrvn8E+ucYsmvFGaXVeRddIcMUT6ikVPd7ZTjW0CI3bO6FjtKjZlHM3aV883?=
 =?us-ascii?Q?1DF/cBQCzq+5ZovwPi3OLweFLD4vp5rJEhBYmIPCRrEnwviVMKIypJCzm0G0?=
 =?us-ascii?Q?dCHT8Z+eNjv/d9ZlufBIHDeQs7D61hTYLE9Mz5ihP97rs3Q7Hs6qJ1FEcoLs?=
 =?us-ascii?Q?YxoMBx9PHowmcdehflX+VnOp1GmXbu3xLqOdYeLakvWUZvIbfYRWJulKdOe0?=
 =?us-ascii?Q?W/GmGVrD7M0hJ1ktkDmtAYUxLBN0oIUtKf/muWjPzHttSJmoeszc+N1201pk?=
 =?us-ascii?Q?1h6dt8368+6FVTUHUGdJ2hXQ03txK8DuRvd2FOdDhbShyJM2QNlyDiVBMHoM?=
 =?us-ascii?Q?zTKxuoPJ2dGXJNNKRMCCNEJNcW2PJWmNIzB86KYgT9AJel8+Y4oDWzPKSpKN?=
 =?us-ascii?Q?ohvOorRkPWmxdGDLiktAJ6HsHSaTJ/Gsg6onaTPmVtu3/LH3?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a599f25-1a7a-4801-22f0-08deb58e65a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 10:07:12.8065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QqkWyXMdbhzjQdpZwEBKHgYp1jYbePpPvgwadbdh4JYtm+uu+P20wZxl/jNDv59cujyj0KZJfJrKCU2GrlnyGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8817

> commit 69ac5ab61c392e1560b98f2d827a22869f473c36
> Author: Wei Fang <wei.fang@nxp.com>
>=20
> net: dsa: netc: add support for ethtool private statistics
>=20
> This commit implements the ethtool private statistics interface to expose
> additional port-level and MAC-level counters. It adds string-based counte=
rs
> for both the eMAC and pMAC.
>=20
> > Note that although rtnl_link_stats64 provides some standard statistics
> > such as rx octets, rx frame errors, rx dropped packets, and tx packets,
> > these are overall port statistics. The NETC switch supports preemption
> > on each port, and each port has two MACs (eMAC and pMAC). The driver
> > private statistics are used to obtain statistics for each MAC, allowing
> > users to perform analysis and debugging.
>=20
> Does the standard struct ethtool_eth_mac_stats interface already provide =
a
> native mechanism to report these exact metrics individually for the eMAC
> and pMAC?
>

The statistics provided by private interface are not included in
struct ethtool_eth_mac_stats.

> The ETHTOOL_MAC_STATS_SRC_EMAC and ETHTOOL_MAC_STATS_SRC_PMAC
> source fields
> appear to be designed for this exact purpose.
>=20
> > diff --git a/drivers/net/dsa/netc/netc_ethtool.c
> b/drivers/net/dsa/netc/netc_ethtool.c
> > index ac8940b5a85c6..e6028851a6d09 100644
> > --- a/drivers/net/dsa/netc/netc_ethtool.c
> > +++ b/drivers/net/dsa/netc/netc_ethtool.c
> [ ... ]
> > @@ -19,6 +19,50 @@ static const struct ethtool_rmon_hist_range
> netc_rmon_ranges[] =3D {
> [ ... ]
> > +static const struct netc_port_stat netc_emac_counters[] =3D {
> > +	{ NETC_PM_ROCT(0),	"eMAC rx octets" },
> > +	{ NETC_PM_RVLAN(0),	"eMAC rx VLAN frames" },
> > +	{ NETC_PM_RERR(0),	"eMAC rx frame errors" },
> > +	{ NETC_PM_RUCA(0),	"eMAC rx unicast frames" },
> > +	{ NETC_PM_RDRP(0),	"eMAC rx dropped packets" },
> > +	{ NETC_PM_RPKT(0),	"eMAC rx packets" },
> > +	{ NETC_PM_TOCT(0),	"eMAC tx octets" },
> > +	{ NETC_PM_TVLAN(0),	"eMAC tx VLAN frames" },
> > +	{ NETC_PM_TFCS(0),	"eMAC tx FCS errors" },
> > +	{ NETC_PM_TUCA(0),	"eMAC tx unicast frames" },
> > +	{ NETC_PM_TPKT(0),	"eMAC tx packets" },
> > +	{ NETC_PM_TUND(0),	"eMAC tx undersized packets" },
> > +	{ NETC_PM_TIOCT(0),	"eMAC tx invalid octets" },
> > +};
>=20
> Are these counters duplicating metrics that already have a standard uAPI?
>=20
> The networking subsystem guidelines state that stats with a standard uAPI
> should not be duplicated in the ethtool -S interface.
>=20
> Since the driver already implements netc_port_get_eth_mac_stats() to hand=
le
> the eMAC and pMAC sources, could these standard MAC statistics be provide=
d
> through that standardized interface rather than adding them as private
> string-based counters?

The statistics provided by netc_e/pmac_counters are not included in
netc_port_get_eth_mac_stats().

