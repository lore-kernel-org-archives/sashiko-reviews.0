Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CA7396D19;
	Tue, 19 May 2026 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184852; cv=fail; b=WRdKn83m707UAe4oU51lHcC9/ja38n4d8/sMMzGEDlfmjO9C46mvaB96Srk4gEJmWxVC6+GQkou82upTNANrk/121CW63f2ygerVm5PK8j/dNUSnK1T/kBNX9H6/oTdskwwWgeQRMY3w2lB56VO5wR6Aza3NgLmR5XkLhvh0O+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184852; c=relaxed/simple;
	bh=dXzn8Cay5gdahl26d6LfpGI0/jH6ItIWyfgsw9Bkfjo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YCA3wOp1qPw1hfPcS1HJXIAlVV+SB1AOxl8hI+qJMFz8i2PyWO/dkDc5xsxHDJAzOOiTyxLHBYeALz2Kdf42372AlyQ/NiBfvL8A6QWRS/zYLMAHH0smptLkLsbE10WYKzxOIdOK0dIIVfwqYbXBB0i7n01+D+gFWxtav3Xjlsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cQ2Xz7iN; arc=fail smtp.client-ip=52.101.66.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cQ2Xz7iN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVXrrN7Lm6tMoGGAgp5Z8ZLLOGQoTX/FaaqdiTW63ZuBoxflNXi3S8pJutfmAhz4UfiQu9LrJflFnfi1lSqlodljC7pm6aruJevbcEvRYo5qumhf+cKUGrjJOudiwKFkeNvHR1Kj77/9k3Yi00OZB/h9cGQsLuSGg6WMmZoXcK1gUz6ZNXWCbXmKrJJj3NI/+/fizG1UlUtMk4c3Ybd0i1lueVJlFyII6O5D25C+10hnOGRGIWpi2rop5FT/0J4ZosIhXFjpqPl7S2pAmL0FSouJAuVFpwlvlilCuhGrVHECgsV4KUbwrLwy14v1ckgzF0h2PlGAmJlVc773XgxAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ztg+EzhAdqt6mIH5EaSHmm06q9neueGA8qh0fUifcQ=;
 b=XXwlTL3KcoTNWCLhucVQ3yKahUKtdrtDwJ0856XTyKkhDVzVlsybGPYvn51RgSMN1fFsxMwyhFkcL4TbMomnK4zEN7+s9RsjuLJaLD9An0BITcCV3mgt4LgHg5ZJTFnOj9OA2JnZvRMgLiW0fatk5j+APxZ7wdsBbZODH2jpDEurcp0lEX9jVLZ+9tF7QAUvMn8fyOU5YtnKR+CPar0MN9J2QvxtqEyHmFWRITpGRQ7xRA0Vn66Q0TWWDwLakOm7Rat6qVtqe+iJ+Q3OJltgNf3XKgev8v3bNQQ3wvmE6tbmm38KOtw4r2ZprPA46Xr+GD8PD0OEwGOsRPV3fxf3kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ztg+EzhAdqt6mIH5EaSHmm06q9neueGA8qh0fUifcQ=;
 b=cQ2Xz7iNtxnxtO65h4ztMsdCeTP3/wXSqxF7QA1K0TEEjkxcfIgeVPCD1W4xE8V+sRyT77g9lzA46DJrApxN0E9Jl1cZ2Br4bS01sfYcPXA6ILwOtT6xc99PwR3PZPuW9lzakiCNSwg/wX5dohiqxwLUJfYzp1d5frVFrG3Xg8raJGXvCs8Fi15Al+bicR4T1OLrpPv+YN0RL1Ig08DtMqh0NUs2ItSezXdZy+06Izx0szp5Tdtyks3W8MriYbeoOd8JP29UVznHoHn1nKdioMh0Aru55z1h3vbSlrUlEeoX8UTmru8N9Ko9d2ezWLL818Upk8aExJZeG6qH1pvOnA==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by AM9PR04MB8145.eurprd04.prod.outlook.com (2603:10a6:20b:3e1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 10:00:48 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 10:00:48 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v8 net-next 11/15] net: dsa: netc: add phylink MAC
 operations
Thread-Topic: [PATCH v8 net-next 11/15] net: dsa: netc: add phylink MAC
 operations
Thread-Index: AQHc5p/Ana3KNu5kpEmDnFBPwwJeTbYVBOIAgAAV5tA=
Date: Tue, 19 May 2026 10:00:48 +0000
Message-ID:
 <DBBPR04MB75002B75D71DFE0F442ED68C88002@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260518082506.1318236-12-wei.fang@nxp.com>
 <20260519082537.4A3FDC2BCF5@smtp.kernel.org>
In-Reply-To: <20260519082537.4A3FDC2BCF5@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|AM9PR04MB8145:EE_
x-ms-office365-filtering-correlation-id: 08633751-72f4-4b89-597e-08deb58d804d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|38070700021|11063799006|56012099003|22082099003|18002099003|4143699003;
x-microsoft-antispam-message-info:
 nZS5oQz29AHG89atXNFVq7GQf+6JtMW33Of7BI8IKnVgnhvDdAliIOg8kgFR0iF6H3QCOitSV449cJ2C3HtcqzIdJLuc3Ef5sX0cgDxE6KdLHrB/8Dp3UG19eakX5HmhuW80PFjNTTRhTF2jBfaqoSK+YIA2C645JUDyZxMjeRy5mtlkLgQiHczsDPBXFk1AObdQDDUCuIvD8u3q7LIo1oRCe0bbiKXz+6NwxPVooeWAOQVhulVuK5q7mmN9h5+aFCa7CNMZCQX9vBOfZ+tumpbWbahrL5tF/vK8p9ncjNMiMgqBMM/i/JZndllvUGcFCD5Q0jjwG+6YLxCryQu0rE2ql0Em3Z+HO/LcDySiKh6vt3nmKthrrDhDnN1oPk+PZHcOX/YDwsBxoo3g7Rdupj/MljyDQ/P797IMPT33Uh7Nyheo/878+5Inkr7TDMmVn45bGYIbLF8JeQJCq6YTM2Uh1zNJ9KEmZnLSm/svoubpMmOJrcfwTkhwhPRCxx2VVvktsFIXez4KTkYjbr7iEzCKwdIRn9Kf1X4sZbH5XO/31ELIQsHB771bLpwMmNWJroJvHVkBhgwtb4tE5gx62wEa1rDbvV+cpT5VwdlWtn2wWEiq1bUBGvGtcDI2sE8aNsPMWBecXnbmoFl00wB7H9qMnj5YDUEUkBqsoux6P3hMNxAUCeU1TqNvUnSKyIgAet62OD/eTbmPOfxoytLpgb/uNPkHu4KQSILRjDwJrwV+JLt/Zmmi1WUDMTsPo1Zh
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(38070700021)(11063799006)(56012099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FD3+wX+L+OtrSRVVBxjXVa4J1T5C43lNwEnpoOQS5EOh9TgDyR5ZBoUQEjDV?=
 =?us-ascii?Q?55R/Sj1JIWP5H+ioucbiSG80lQQZhqt9KHk5WxUKNQIiVM9fxoxbK4w7P3ku?=
 =?us-ascii?Q?EOlrw0WOWquW3Alra410q+IjOCgT9mXC6G2pvjrXVNbrBL07DTqt4DpB+tVN?=
 =?us-ascii?Q?avCh7N6r2IRQ4CcgduSPYCVSEMS/cxtvjZpzJhDZS4yC9uKbY8BVsArLdPpr?=
 =?us-ascii?Q?SMvNSvJLd1OTdTerzwE0HllNZrW+lmPcFv2/T/QX/d+a8/0pyGrbASUCBug4?=
 =?us-ascii?Q?DMe7dlxb8GGs0rcGzneInUECTl/lyYXaISFxR8n93BRA+u5I/zO7H6Q3uIb1?=
 =?us-ascii?Q?kMsnbk+KBJ/K9ckq/sRhzR1IdeYYIq52gf9TXRXHjtnhFU7UwMSVriLsHyeY?=
 =?us-ascii?Q?KU6b5IAUnzg5MDVfEGez/xF726ps1NYAmnV9R8/omXZZT0SzXnRWvFjH3zPW?=
 =?us-ascii?Q?HkVHrvklC19MyEf2tKsWipOh+ExpGNqOlYS8WsLVAFp3ZwxONnQcjb7u7mjC?=
 =?us-ascii?Q?Z0XrcTSntVBKy3TezoRpdAtc2EETeYyWCUAIZT1o+QUpaVYQgGz2oFpsXtMJ?=
 =?us-ascii?Q?fuPL1mBhkvsLlxcKf7dAygt9KaxCGWp27ukUPF18dI/zX8F1kWJm7RxQgXpZ?=
 =?us-ascii?Q?a69Tpb10ivInxQjxrQfJlAVGZyWUhR2Zo7vdMq+o1xTLiGZt2TUPgvermASR?=
 =?us-ascii?Q?zhvv5q5r3kXSEERJ3dhgL/tYt4Ql9H5ElSRFszw14p4uZh6xS4MA71q8mAvR?=
 =?us-ascii?Q?XYqJfBC1x22XsB3b+Sk8bwDWEnyrxAnGsePDu4ekWu/0kSfhXzEHnrXaXBiw?=
 =?us-ascii?Q?FvQDENPAaClgYARM6jJ0W5kdrkRKeyCd2mZ5o9qhYjL0J7gAiXPGLAGGx4uu?=
 =?us-ascii?Q?ysNqJ1ofrIpV1YBlSPYn0vJiO9wLzeEeZaopEzy2KuYnFQc8uI3dLrK2vw1k?=
 =?us-ascii?Q?Z3GTk4TKaCRei/SpZMO54l/GcGDQ3Qh8XamlAPGIcz5EpR1jLEO0w7L7P2Ef?=
 =?us-ascii?Q?6upRYoaxAlFmn8Zy47CJ9LCD22oMwU7o7dg6pvLtKGDqmH0yya5avG7jhuiB?=
 =?us-ascii?Q?lnDpbSBXjTHxkE9Z5P/YWJHZ9q7u0AhRtE3LAtBbYibStdFJIf5ONicaheN9?=
 =?us-ascii?Q?c+1t4viCPHe4gzfL4MGqW/xoHCqxlrdE8DXbDL7dXl59mfDRGFA53szPZ0SY?=
 =?us-ascii?Q?zVrd9d0XsnSOer7RPI0/OQK5Rgh5Ht1qWp2UrWob8L0gvGb7c/y8Bd/wf0gB?=
 =?us-ascii?Q?qQgXVKHkRqt7/TMbiLahdCkg0wVBGvDwG9xHHo5JAX+XcUnr/L1pu5xRcRCm?=
 =?us-ascii?Q?aKVsVhYNiCbI2sP+kD1D3ztzM7X9BukFXiOjsq84kcXadAdWyxerm7/yAVNZ?=
 =?us-ascii?Q?msnDOUQwmgCfC3G+rTr68vN2wdHzG1jSKkrF2dvNQdzkF3d0FY3GkzHLBtUZ?=
 =?us-ascii?Q?qLiQqdK0C/P+Rc3hyt+3qdX36wnFOoG+MIateAZGhJ/HXwldLtooqGJC2puD?=
 =?us-ascii?Q?CO55EDWmRqhZesjxKSQjwdoGC95nYOcRTh9AxBph/TtC+jmQF4ZvikK/9j6l?=
 =?us-ascii?Q?GfIaO8Mq6GKwX/wD8L0yW1PlclTnqmtfVsK9uMrj41THuR3W8pdBtiwVLtJI?=
 =?us-ascii?Q?eH5YGoU7os9UxsA4M17icqaqyyB+yiupBVbkZ5RE17TtbCu+dHHn0Z/OMCNW?=
 =?us-ascii?Q?dX2mZje6uVDdI5pvWpb+7fOx4pp4BRV8gPXwQyicxTDpNnpa?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 08633751-72f4-4b89-597e-08deb58d804d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 10:00:48.0311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kyo74Xu1BQpVaf5FfCE838E7AlOFzJp/0hrEZO0Ey25v4QrYePyqyXTiplMFQXeDK5TqURhtR4+NHR5/N2haUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8145

> > +static void netc_mac_port_rmw(struct netc_port *np, u32 reg,
> > +			      u32 mask, u32 val)
> > +{
> > +	u32 old, new;
> > +
> > +	if (is_netc_pseudo_port(np))
> > +		return;
> > +
> > +	WARN_ON((mask | val) !=3D mask);
> > +
> > +	old =3D netc_port_rd(np, reg);
> > +	new =3D (old & ~mask) | val;
> > +	if (new =3D=3D old)
> > +		return;
>=20
> Does this early return prevent the pMAC register from synchronizing corre=
ctly
> if the bootloader or previous state left the eMAC and pMAC desynchronized=
?

No, the switch is reset when the driver probes, so the eMAC and pMAC
state is synchronized.

>=20
> Since old is read exclusively from the eMAC, if the new value matches the
> eMAC's current value but the pMAC's state differs, returning early skips =
writing
> to the pMAC register entirely. This could leave the preemptable MAC opera=
ting
> with incorrect settings.
>=20
> > +
> > +	netc_port_wr(np, reg, new);
> > +	if (np->caps.pmac)
> > +		netc_port_wr(np, reg + NETC_PMAC_OFFSET, new);
> > +}
>=20
> [ ... ]
>=20
> > +static void netc_port_mac_tx_graceful_stop(struct netc_port *np)
> > +{
> > +	netc_port_rmw(np, NETC_POR, POR_TXDIS, POR_TXDIS);
> > +
> > +	if (is_netc_pseudo_port(np))
> > +		return;
> > +
> > +	netc_port_wait_tx_empty(np, 0);
>=20
> Could this disable the MAC TX prematurely, trapping data in the pipeline?
>=20
> The code disables the Switch Port from feeding new data and then waits fo=
r the
> MAC TX FIFO to empty. However, it doesn't wait for the Switch Port to fin=
ish
> pushing its current data into the MAC (PSR_TX_BUSY =3D=3D 1).
>=20
> If the MAC momentarily drains its FIFO to the wire faster than the port f=
ills
> it, PM_IEVENT_TX_EMPTY might briefly read true while the port is still
> actively transmitting data into the MAC.
>=20
> Should we poll !(val & PSR_TX_BUSY) from NETC_PSR immediately after setti=
ng
> POR_TXDIS, similar to how the RX path waits for PSR_RX_BUSY before disabl=
ing
> the port?

The implementation fully complies with the NETC reference manual. The TX
and RX cases are different, so the configuration steps and their order are =
also
different.

>=20
> > +	if (np->caps.pmac)
> > +		netc_port_wait_tx_empty(np, 1);
> > +
> > +	netc_mac_port_rmw(np, NETC_PM_CMD_CFG(0), PM_CMD_CFG_TX_EN,
> 0);
> > +}
>=20
> [ ... ]
>=20
> > +static void netc_mac_link_up(struct phylink_config *config,
> > +			     struct phy_device *phy, unsigned int mode,
> > +			     phy_interface_t interface, int speed,
> > +			     int duplex, bool tx_pause, bool rx_pause)
> > +{
> > +	struct dsa_port *dp =3D dsa_phylink_to_port(config);
> > +	struct netc_port *np;
> > +
> > +	np =3D NETC_PORT(dp->ds, dp->index);
> > +	netc_port_set_speed(np, speed);
> > +
> > +	if (phy_interface_mode_is_rgmii(interface))
> > +		netc_port_set_rgmii_mac(np, speed, duplex);
> > +
> > +	if (interface =3D=3D PHY_INTERFACE_MODE_RMII ||
> > +	    interface =3D=3D PHY_INTERFACE_MODE_REVMII ||
> > +	    interface =3D=3D PHY_INTERFACE_MODE_MII)
> > +		netc_port_set_rmii_mii_mac(np, speed, duplex);
>=20
> Are SGMII and 2500BASE-X interfaces left unconfigured at the MAC level?

There is nothing that needs to be set for SGMII in netc_mac_link_up().

