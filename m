Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013043.outbound.protection.outlook.com [52.101.83.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA3A3FBED9;
	Tue, 19 May 2026 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183265; cv=fail; b=FwDXTKMUSNvUUtzeWIMi5x19L0wfqq01mch2Vm8Q8mEv66bleUVdx1MQlCC7NBGaTFozAGZwD45B8AxvT8+GgQnlRvQ9h4IDCwXsDL85FAdxWvYo3QHyUO3INHOKWkFXnWXIIvv8S7WtWkhr3qD71XzUGlWig//HwjIchQT0YYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183265; c=relaxed/simple;
	bh=rXy4WLydPV5n6F2MoGCLx0/wnQSAL1GxzPbVf9z3JRs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CW7RM1ZsdJrOADW+MahTks8nZ6tlNjIDJBtlsbosg1BuvSSM7ExWVpFTv+7af83wG0DyEP9y0B5+JuOXk3VdQf2bO/2Z1u99Zdi6Vt8GFe4CTmuxZ63thl3rKFWIDECe+BqZnAAvoRtvIj9zon9gARFrPl0MURpsV0P9Jac4jxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nMQPgQrp; arc=fail smtp.client-ip=52.101.83.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nMQPgQrp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StiEw7mB2QQirqwMyVatpuw/XNKnJ9Os4SDB6y74dgQuQuaScWOjAmUW16T3u31wpgoZYCCGmMab5QZOlEmTk4lgfLy3JSQudDahEAWQ+EQ/VGJVC71nr37/6pYN0MWuKztGqis/AMH4Hn4o3tR5Zcyez7onxcX1S5fK1o+5/ssI56VmyPtQ4F3m+/WlKUEuaRCySsZ+6S9u9Zy3E7mmSclmnu1jZ6k+1JFKgHHiE4NFVonH3z7QX8jLEMrysOILJfJMdxpefnStygAZqbSmpU1zFYo/9/uMVCRcROKAxBVSjQvD3qps7MqExYhx05jtn0dSu3rfQhtbm4NDRASrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuVzhkMheTFf7AmuziPSoGXNwpiC5BD94sm98q6qy68=;
 b=Gadc77GjTjvbCDmURu3Lp+qPUKvfta2Kd4PqcrnUOQ7QqNJYiqk7x629MsVT0xD1/ToqMBnCFe6C4XLArTcLAYQ3l9+Xvm4G2WzZCOkJx2J9BCmUcVRk325HwgHVr13YcGXaTNvVt6UK3Lsl6Aq3kilrq57aXdFCP95hpcsavuxMLoCePFY1hyRY4GhmRhsVxyCv8n0433S5FweYPDkhs4Xse/Gr/+l79nchZapJHU58dYmFMoXaeKTvUcj4+9rfIn1UtyBV2T1WiSwWoaP+DIIlewvyLPs+MAt9IukfQxu5zjHUcwywKyWdGySBDR1L+WhxKYOL4lunjefg/Xi02w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuVzhkMheTFf7AmuziPSoGXNwpiC5BD94sm98q6qy68=;
 b=nMQPgQrpkXFn6EkkOZBWAXRD6/5bwvLYW1TaAYUD37Z188JGcSURhtWamAf746v+r2IcqEIBeKVweOuyMB7MWERCETU722a/QhQCMDBy5kg8Xsz4MQn0TCKcBgvomH3eYIrCUAsXoTyBgSiuNZiUpxA6emdsrWgvB2lD1kFNSybqaDT32QP0qJYpbUIoXr2OQbuFEbQGzsxJAp1PfIDoCS0V7gWF7VLR1wZFICOO2+KLbOXCd0N3T0c2ODSo9758UUfNcstpfzta3OxyzQrsoztg67Mt784EaPnm+8UEP427SvR+kipv4l3YD8BaibBcFDznCDktcPUZbDyT5bliwg==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by AM9PR04MB8339.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 09:34:20 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 09:34:19 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v8 net-next 10/15] net: dsa: netc: introduce NXP NETC
 switch driver for i.MX94
Thread-Topic: [PATCH v8 net-next 10/15] net: dsa: netc: introduce NXP NETC
 switch driver for i.MX94
Thread-Index: AQHc5p+5fKWu3KTmt0uDCfaU5+bK+LYVBOGAgAARwXA=
Date: Tue, 19 May 2026 09:34:19 +0000
Message-ID:
 <DBBPR04MB75006F761A909CB36C6D84A588002@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260518082506.1318236-11-wei.fang@nxp.com>
 <20260519082536.4A77EC2BCC9@smtp.kernel.org>
In-Reply-To: <20260519082536.4A77EC2BCC9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|AM9PR04MB8339:EE_
x-ms-office365-filtering-correlation-id: 4f2eca2b-d3c8-4970-dff9-08deb589cdb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|56012099003|22082099003|18002099003|11063799006|38070700021|4143699003;
x-microsoft-antispam-message-info:
 4Xx5uzG/3Sg43PUigNIvzvpsKlPCdicDum4i9l6JHxVV032iljaOfyuEsqtHZ6a4wJNOMA6KvS4CGjjUmGIvh2FNkyixoSaV16Q3wqhwtQqfhNR+HzXtLXTdY2ncULGJoNRZqK7tB7U5uwHKhzRd0rdr64q5tVY74bAgAlz/Jm6PbxFfrs+fImxjqEJu2NgI1S6Z7MrRIbgTy1Lz0DS53QhSeKl9Y2fxBtEABQjvR4P7mgOx9tT80c3/62f9kSvPX9aYMiHBkmoks6gPsq8K638V/quoqnZCVhFAIfvSyRg6UfC0IhvvBrKO9EKeC5wz8FUcMNphwonRvrNIO5fGqEeruNeRznS15bdbuMInFB1uPkbhKDVUeEnk4enI5pqKix+fhl5pp5kR4oEKwTk6gIKRmabiYlV95GBrUAsV0I+uNByy3HcLUhoHOkYDocT3vTBfYJvCI0QwESN+/HUKNMZbBV5Dnc9DbwWYTGQHK38ip/qTq9fW4SdNgVlhwh7CbVDTJIHFCLes3e1cVk8oW5gBnisyPYZfX2gmsZi/JJUqopbv7qfn0a9DkEa7d5Qo9K1kMZxp8N3YSfNVvRC0dZ25uA9lCNSElQcQGqInIrEhFfbHOSUsTb7ZaBCL+V7E97R7MePhFxe3olROu6lOpmo5eQKoWIft8x5ZCy7MqL1bsCn2KMeO4vCubcwf0iA5Ri52LzdGZ0KqnEdj9irRe0aQqmb/GoGvbdifpPCKPboCwrjfHEs53Au1s2UWbJ00
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(56012099003)(22082099003)(18002099003)(11063799006)(38070700021)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?koi8-r?Q?baV8wcQ2c7Mnu2+rqhgyISHCnqsilpMdogG30p7QfbyqVWlNnk86wxNCBTQLKK?=
 =?koi8-r?Q?t/Inni2M4x8vmZEi0J83NtJVXYbgGTNdG/uDoO+JokYn7N3NPYkis10nCSxIjF?=
 =?koi8-r?Q?/FaP7lI0DYbCcOLCmAwboAioHSEdnKz43QwtZwcVLjKccfwgj8D3VIyvfLOJ6Z?=
 =?koi8-r?Q?8s55ZJrBVBiGfXbaAvfhlKV4Cz1pTIHzXPG022M2SVkgPTkQ/QMeTMG6l5lWDF?=
 =?koi8-r?Q?dsr8iSZwomwckjzIkHm6NTu87cBiIitIV62TRA9yFWbLGG7+4WpYBr5NOM4ehU?=
 =?koi8-r?Q?zV9vnYsQFZrCOjZOkwkkOovFuZ5ZFP3iqQNfItfqbHhgCRzAg4W+DWLzYLXSkY?=
 =?koi8-r?Q?gg006aHSymBE8Bkq/FBSkCMji84BZTIKogBY9DKp1j5pAslRK71HGJjiV+pmC9?=
 =?koi8-r?Q?2wCcQj0HFeWBf/TvynlPcSWzDoMo/+Ynvfbr9zJbYQhDhHEpvqtooEiHB3XffB?=
 =?koi8-r?Q?FeX7pG0NkBIEWKw6D6qUa1/Wdu4F1hS2V6LmQ7xTWOCZVDLzt8e/Z/CD0eHg7u?=
 =?koi8-r?Q?vNIZK3mLS0NJMAC7A0kbZBeSReZdti0pFZ2JYHdpvbWHTzYMjkLIjzzUb0NLxV?=
 =?koi8-r?Q?SPStz4G4Mb8cA9kWxBF0rVj3G6bocaHvSWzgRazgDHAZOc2ALChr1ynFbktle3?=
 =?koi8-r?Q?FBpV9+T/ZllAr97Z8VpGid1dUYO6Tt7IoIXGdNzXM50ELtz/jKWAA+5/ZQYtMI?=
 =?koi8-r?Q?1e9LPJXGD7mU/1C04VQpCuKTyl53iOqi32TwqgXvIBZkxM9ooXkOpZbRCUOwuL?=
 =?koi8-r?Q?XocRDAQYPz2XlNbBhpOShi7we153BhtfHGU8naUcmQ8y13Op+mR+VaHfZ40VM0?=
 =?koi8-r?Q?cmbaRUEK6wliyxq7Uh5+elzs2vD4WbyjlvkjST5Uk+IkK3MemhcY7b1PgINqx3?=
 =?koi8-r?Q?uEawPkNzVI7y1G6TlyjV/Zx4f7wFRkxnadycQiiFepUbWjLHy0Nz4Jt2T0w2Tn?=
 =?koi8-r?Q?CPzYJu2wU/7lqKtxozCRqebVv8XpeT/S6Nsqm7WYTHO00cvbmYQxoFagKN4by6?=
 =?koi8-r?Q?v+gFj88QhWIZq7w032U0254mXaq6lqmZ+35maZFLdDnrhBLf/e3Vr1wHCCP+LX?=
 =?koi8-r?Q?aZ2OQL0u/BeKuMusTVL90r7pynM0gJza4UaS2Edgmu62izz4bYySzQ3Zhu0wCD?=
 =?koi8-r?Q?cHMbQkq1rmmd7ml3whwsFXI/iFm3mOQDgBaReSHSpL/XzHSZd5tq/NoBKb27AZ?=
 =?koi8-r?Q?c/z+LavP2QaSL9LKI2LwIFo1/Pp+NId2Q+OQGkkqE0aTPv2YT1OT3VD//Nbyrs?=
 =?koi8-r?Q?ylxPfJugXIIx490XWq0hEjWawtlLJ1bv9AgU/Q/HDpCV1JWoYkwBkQ5o/Gu096?=
 =?koi8-r?Q?ykhkLiFXuuHjxTd6o/++YZRUkTDvfJBK9JQ8OoK60MyFzIjyXWu9JBG+qlZfwN?=
 =?koi8-r?Q?t9yzuhmv68e3wfyQThdXt4Kuyx/e8Vak1mES2muOvit6qdrjZknN9ktrL35es4?=
 =?koi8-r?Q?pnISHAs4td/9CX0SK3YOtkkKoUQYrlrcr8b6yngJ2e1eXzuPHA0337CWBG2WgN?=
 =?koi8-r?Q?62DcUBkQmKyqCV7pVFeECJkru+J00zfkv0BN5fMlv83f2pVwTS0LLxpmMMQSGd?=
 =?koi8-r?Q?Uj5NyCgjLJ9FgUtulLBSsorBzGLzhWSrNdX0yDHA/WPvxgy1yqgIZIGgnaO7ZV?=
 =?koi8-r?Q?bCGZXQR03YhkrAgEkGfdstuWbqTS3aE6VEBVWna9LP9hnIKE1t+BVI?=
Content-Type: text/plain; charset="koi8-r"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2eca2b-d3c8-4970-dff9-08deb589cdb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 09:34:19.8826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uCO/WJOAnzbiG9OequCWsr0iJUXPjVg4maPalLXJSKF4t9bHuHMTWUrRZ5rWRrRuIU9gM2nGxdMmMHHx5R6IRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

> > +static int netc_init_all_ports(struct netc_switch *priv)
> > +{
> [ ... ]
> > +	priv->ports =3D devm_kcalloc(dev, priv->info->num_ports,
> > +				   sizeof(struct netc_port *),
> > +				   GFP_KERNEL);
> > +	if (!priv->ports)
> > +		return -ENOMEM;
> > +
> > +	/* Some DSA interfaces may set the port even it is disabled, such
> > +	 * as .port_disable(), .port_stp_state_set() and so on. To avoid
> > +	 * crash caused by accessing NULL port pointer, each port is
> > +	 * allocated its own memory. Otherwise, we need to check whether
> > +	 * the port pointer is NULL in these interfaces. The latter is
> > +	 * difficult for us to cover.
> > +	 */
> > +	for (int i =3D 0; i < priv->info->num_ports; i++) {
> > +		np =3D devm_kzalloc(dev, sizeof(*np), GFP_KERNEL);
> > +		if (!np)
> > +			return -ENOMEM;
> > +
> > +		np->switch_priv =3D priv;
> > +		np->iobase =3D priv->regs.port + PORT_IOBASE(i);
> > +		netc_port_get_capability(np);
> > +		priv->ports[i] =3D np;
> > +	}
>=20
> Are these device-managed allocations safe inside the DSA setup path?
>=20
> The DSA subsystem allows the switch tree to be torn down and set up multi=
ple
> times during the device's lifetime, such as when the conduit network inte=
rface
> is unbound and re-bound.

The switch driver is removed if the conduit interface is unbound. A device =
link is
created between the switch and the conduit interface. See dsa_conduit_setup=
():

if (!netif_is_lag_master(dev)) {
		consumer_link =3D device_link_add(ds->dev, dev->dev.parent,
						DL_FLAG_AUTOREMOVE_CONSUMER);
		if (!consumer_link)
			netdev_err(dev,
				   "Failed to create a device link to DSA switch %s\n",
				   dev_name(ds->dev));
}

For NETC switch it does not support LAG, so the consumer_link is created
when dsa_conduit_setup() is called. netc_setup() is called only once during
the lifetime of the switch device. The call stack is show below.
netc_switch_probe()
	=84=80=80dsa_register_switch()
		 =84=80=80 dsa_switch_probe()
			   =84=80=80 dsa_tree_setup()
				     =84=80=80 dsa_tree_setup_switches()
						   =84=80=80 dsa_switch_setup()

So the reported issue is false positive.

>=20
> Because devm_ resources are tied to the PCI device's lifecycle rather tha=
n
> the DSA switch tree lifecycle, they are not freed during teardown().
>=20
> Will subsequent calls to setup() leak memory and fail to register the MDI=
O
> bus due to naming collisions?
>=20
> [ ... ]
> > +static int netc_init_all_cbdrs(struct netc_switch *priv)
> > +{
> > +	struct netc_switch_regs *regs =3D &priv->regs;
> > +	struct ntmp_user *ntmp =3D &priv->ntmp;
> > +	int i, err;
> > +
> > +	ntmp->cbdr_num =3D NETC_CBDR_NUM;
> > +	ntmp->dev =3D priv->dev;
> > +	ntmp->ring =3D devm_kcalloc(ntmp->dev, ntmp->cbdr_num,
> > +				  sizeof(struct netc_cbdr),
> > +				  GFP_KERNEL);
>=20
> Similarly, will this device-managed allocation leak memory when the switc=
h
> is repeatedly set up?

Likewise.

>=20
> [ ... ]
> > +static void netc_switch_shutdown(struct pci_dev *pdev)
> > +{
> > +	struct netc_switch *priv =3D pci_get_drvdata(pdev);
> > +
> > +	if (!priv)
> > +		return;
> > +
> > +	dsa_switch_shutdown(priv->ds);
> > +	pci_set_drvdata(pdev, NULL);
> > +}
>=20
> Does this shutdown handler leave DMA active?

No, see below.

>=20
> The driver enables Bus Master DMA in netc_switch_pci_init() via
> pci_set_master(), but this function only brings down the network interfac=
es
> without clearing the Bus Master Enable bit (e.g., via pci_clear_master())=
.
>=20
> Could this cause silent memory corruption during a kexec, if the active P=
CI
> hardware continues transferring data into memory regions that are now own=
ed
> by the new kernel?
>=20

NETC switch is PCIe device, what I learned from pci_device_shutdown() is th=
at
it is unnecessary to call pci_clear_master() in netc_switch_shutdown().

See the comment from pci_device_shutdown():
    /*
	 * If this is a kexec reboot, turn off Bus Master bit on the
	 * device to tell it to not continue to do DMA. Don't touch
	 * devices in D3cold or unknown states.
	 * If it is not a kexec reboot, firmware will hit the PCI
	 * devices with big hammer and stop their DMA any way.
	 */

So the bus master bit will be cleared, the reported issue is a false positi=
ve.

