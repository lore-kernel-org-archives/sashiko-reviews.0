Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013050.outbound.protection.outlook.com [40.107.162.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BEF3EF0AF;
	Tue, 19 May 2026 09:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182612; cv=fail; b=H/mlkW3qcqucUFnsr+4QZoURN2pf9rb9v26Spkno7e8LvJn/GlIx32GLIUwn+ZGyxBTMIu8emyBJptqb7OQMQPbpAl7jBnfyDZhqo79Znll/cXe0qg3kUJeWUfnbjJAy1Hyxfv0gP5n+xCNi2gWHX3RajdBYLqnmvvwzyq6y20E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182612; c=relaxed/simple;
	bh=qYwWWH1AKi41B+YhY0AJRyducvT79e+Yy8keVN7PBiU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tkcoy2ySfUAh9bOUJgyxu0To86Hi2QAer+5vlKqgH/JWvoE4tYwn3sabPb1hbXbz2V+S8O5j+jLI6I60ppuiYa8hcYq53/qbUPDcmVr4eZsOWlXDVMPAMZn8OUYkCEeQpKcbxVEbk0qLVVmrxSzdAXWFaDq1+4BYW1vH3u1x7XQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YvRrWGjR; arc=fail smtp.client-ip=40.107.162.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YvRrWGjR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujtXFJFj0PF6X79eQPB1LL538ueRzHkX8Gev5VcYzoB91YovzUgxgiNaAn5NbMixFfVm0B3mHOCA0RVnUwhGqdyF+4o10wAjWkENKGA5TqcM7XX8HrO2druIpG4LgPYNNvp3LSw+pyF3D19NVIKaJHHnv9U5V8Y24bFkm2MzMRjR6s3XizkEpZGuiRPUiWY6yaFaY+NqeI7OWfNU6UtzxFQI9/3zIedKeDUT49/XYsSELkHPgWhvsU7oVHeGpZ7MTY0EmIQBBTHDij7prqX7FaQYWRGgpCO8I2214wsnbLkVcNKxmS9521YYk06HpB0kzEhGrpdsZEpjcf7d2jK+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvHa2r62TBQvGPurHsbxLQKHIWTBhxt6vssEU0daLOo=;
 b=I6mEx5+JEsysrp2P82UAp/3x4t1dwwwrEDM1ybgCsZI65havbZqyaWONwWZLNUEYo4CKrHLSxbUlmXn59OyflejpxNjKqNiEGL1xtfAMHNPx0l7iZ2Ya9933Ql71/+U2TffL++f09QXiZy7Ap5roZLOVmxwhLW5/V+xkoZLPvTILC3rh/HrlHB5vYh/n+M7OGI/81WFP88Qqnshr+oMVxut53iXode+jZgg8WDOkqeFyEi9nBs18SggJs5Kw+y9v/F6E41nZYLRr3yGuE1o3c/yeK7bblAtG4vNtP/zxaJIi8zuJDDGVEsW4zaYdgSpXKb7QAkLuRUWXZO01b/Kt0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvHa2r62TBQvGPurHsbxLQKHIWTBhxt6vssEU0daLOo=;
 b=YvRrWGjRYH/d3Hyq1+qzyzpZpmn/0o3x/dSUSCoZll/KqpoCSUCVpPiInANA35pm5/+v92I+0kwVkLH/JTolxGo5VGzoOGZkI/jkfzV6bt4j8q70E+K0awzIwbx2wvuZsGee4P/hnO2zCWMbPgJY81eB1Q0vcR1wwEQLkqUvrVBgaJBRw6xNkWSu15TORcGOy/yNe85KJxzFIxbeXvMuVd7xx30n/7vSQSilGUmla6VxHkrnYcyS5WakCjBBV8uTXkx0Eq7C3Q4PGx/F2QQkrNowyWX/C0q2plR8ZEmzXuF4wflvBsoESvFspmxsbnTlXxwBPPJ7fz9cTAdepb9HVg==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by DB9PR04MB8377.eurprd04.prod.outlook.com (2603:10a6:10:25c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 09:23:27 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 09:23:26 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v8 net-next 09/15] net: dsa: add NETC switch tag support
Thread-Topic: [PATCH v8 net-next 09/15] net: dsa: add NETC switch tag support
Thread-Index: AQHc5p+zeOkrNVowXEyHCQIZICFFkrYVBN+AgAAPw8A=
Date: Tue, 19 May 2026 09:23:26 +0000
Message-ID:
 <DBBPR04MB75000698156070EBCC44E89788002@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260518082506.1318236-10-wei.fang@nxp.com>
 <20260519082533.A9D7DC2BCB3@smtp.kernel.org>
In-Reply-To: <20260519082533.A9D7DC2BCB3@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|DB9PR04MB8377:EE_
x-ms-office365-filtering-correlation-id: 35b57288-6a37-46ec-f424-08deb5884853
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|22082099003|18002099003|56012099003|11063799006|38070700021|4143699003|3023799003;
x-microsoft-antispam-message-info:
 oWTZDtxDMX/5QrBcQLxBFg6wahrSjISpUOO8gvjiLyGjH9AjJiPoEJWU/6GxsDDgkrgDM2wI77qbGP/rqh9kSESfvNMAE36k9vzcvBGpsECfqGN6yzWH6lRF8R1lpWdZL+nZ3geC5zs3w7LVsu+I8Puau4gZRDdSovrhp+BDBuhkAfkWSaOvVHu7BkaB9Ci2bPsocW4m6QrWFCiw+GSfXJM5vBtKXNgAc1zQTAVtZciMgWgSTTM5u6h8MAOHVjKVDBE7sZo65IAmdBwul7bOv5n+LbpHwMxDBlbDsr8TPe/sfWx6jBA+h9/jJ4zjOa0jlPD+TlB5ECE1u+fO6ERvw9AbP3t/pgdQ9BWoUvqMHVCg417bsaFseg0TeFOLKnVVhp2tiJ7wrRES3BOPnJ8xzlaFKVXzYIta3FUuU8dqtxQv1PftiF4OAaIUDf0fsjvcmvFn9INrBzQBkM+wW1qo8c8vKmJGto6pypmiNMV0cYBGyUUtUCBT2ztlAtOhQ8DRUOUTN2aCDv0YqvXDQAH2LDdnANLbxNyq4Z3Pz5eHWRDQXo7eMmVF/5he6kPZ2iwPOx+A5/U3GPC4Ve1lS432LGfkJV28vIrFTh1uwFJMzJ2GDTYRGkZ0W4le3mIKgDtcKkM17s8PtxdfRDvIvnSkeydsj9ET1b5ilek6Dv7x1t5d1OlJZve0j0a9Hh3mKmgFIrPufSUux5pZJqQy9jaBCRdsinOgWdL/6nJOqw1ZLZVI8G7PEO0ycfNxVtR3RvPv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(11063799006)(38070700021)(4143699003)(3023799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?g66J+lgJrOjh1oUDE9HDU0iLDpxsJwelpZUGYEPjcmNmFqxb1MraDaYafvnZ?=
 =?us-ascii?Q?pelnHV8drUr1mWIsHZsLZBvZ3ztwOq0/Af7SbjqGzETBkXleHVuNtL4e0YK7?=
 =?us-ascii?Q?qw3tiFbRUfeBtdn1CewPlbb4Sy1h94yxiyO0bEUHjyOSHwFz4MMcAMw758rP?=
 =?us-ascii?Q?cWfP7NI/9xToGfHB6V+zrMaNWXrV50zNzbx/CZkkLpd+85IlbY71/i0hI4LA?=
 =?us-ascii?Q?c2rnOsae3/7sYxZJ/kxOXwRxKYOsW87Xgpd+Zpgl+hRPiYe4b9sTN2TWjJDn?=
 =?us-ascii?Q?m73gSaYQWFAzSb77OFKWuukvwqK8UcZcHMkZ9AkVbNFShP8QItZ405J9hhZ2?=
 =?us-ascii?Q?KCg9mdFztX7mB8Zeb5C0NFbj/c/TsJM9CW3q1DYR5LJyvnPk0jG1LQfdNPNX?=
 =?us-ascii?Q?weZt5gxC+Q7IBCJsgeiP0oAbgQ48u2geenCdAI7S1CqLcRMG7LhpQ9Vs+djD?=
 =?us-ascii?Q?klTKMNh/b1NmBNY5Ix7iY1NcbOFegtgh7Ww5BVCb2Kv3/x5+xPK+GKXErKaG?=
 =?us-ascii?Q?wxafMopRFwKFtsu4i2aU15lNde/tB46IS9to+h9IrJBceK0GrqIqRCfuaxkd?=
 =?us-ascii?Q?4zLwHLUBBYD0nblhccVxGkC6D0NOyyLVzdtG37WzA1oFOyG81VBGXPSe3cI3?=
 =?us-ascii?Q?4yqdgo3thY+Tn5ApDD9tRGckYimX3PF9jotDNsVMbiiRosuwr0TUNiZIHoBQ?=
 =?us-ascii?Q?fowBNEKbzHZRmJzNfZjAO+QdKzl+8hN0ZzcPsAANefz4VW38KM7ChOv8u7Ef?=
 =?us-ascii?Q?uw1PcupT9YMIQsRyRhAGybMaWEgAagJuw8AAY0jdkfM0QU4qC58wKqC1p+vw?=
 =?us-ascii?Q?ULGDgbUlAW9ZA5gyzBnNHme4W+OxBfv495R6aE8aC52PEn4zrUA9gmNjDiq2?=
 =?us-ascii?Q?llJabxNZRMPMTXJSE1KjvwrgHmznPuOb1e7Q9vSHKZHvpnxb8rFq9Nj0Vd96?=
 =?us-ascii?Q?047ZFiVelH8gTrAQRnoCpd5B+hUtwBaPrW31j0g1vZRunRmoNZGIarNMOhBG?=
 =?us-ascii?Q?BHnGAWDIPi+z1EogLp3hdg3yzddo+YuNuXTjzswTeK8jtaID9UHio+y5j+ZI?=
 =?us-ascii?Q?ras93+4lyQC2f9N4mGLGgRS4ctRf8uxRek8vIZsmIhXo5dnzVC+eDxljulZj?=
 =?us-ascii?Q?+uCsk28VtqnzqWwrAGxgZeVg/Xhl2kKM9wX9CHbVeumwpgCInY0sPEzodWsC?=
 =?us-ascii?Q?0N0RTbNiYjQQ00D3NzTVMjD1Bylw2Fr6vkm6jKY5vGPUND9AM+KrPguvtb4E?=
 =?us-ascii?Q?ljHZs9mOvCn5uyaYmjueSXsf3843qc9FP4RXxm+eJCUd34Ujp5pRLG1kiAl0?=
 =?us-ascii?Q?MpydfCKNCXDmul6wu0mxh4KSOzJU00u7b5CY0hMcbsyi9v1UHUyNt2plG6ot?=
 =?us-ascii?Q?bXz0yu3A5vSaqpnHl7SMEk4JCyJQ8iGisnXVCTRfmpfK5PA/846ANxY+3lky?=
 =?us-ascii?Q?ylZKuMm6ps49oJbiLHjO8SFKchoNoBFGJ20TJi0Tp6YlpLRZupAJ92bOMOJz?=
 =?us-ascii?Q?TthJeKK9+rAFilnrLaHYfPbsbeXQR+aPRzijXI+57nt5pEfGMFZD9/NwMAJI?=
 =?us-ascii?Q?17Q680sgQri2IEsQBSjVFndSmuZTfIC+FKwYaEUiI4kCzrbHcl/YUss5bV04?=
 =?us-ascii?Q?CSE+75rw1BTMdDkbUBi+ayBWY0OZg+3haDEfOAPlY0R3k9DkstrKTh7m4dQy?=
 =?us-ascii?Q?fzYd3nNhbQPjrvssobm9P1d99M8i3S3So/zic1sk2rC0AHii?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b57288-6a37-46ec-f424-08deb5884853
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 09:23:26.6776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DWjslj2LG4fcP/mQlw94R8ULDJYAwQI+BoeSizX+omLc0kwuw93Q3RbUlufRhn0XHGeAOMc4kTVWhTeNqkf4wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8377

> > diff --git a/net/dsa/tag_netc.c b/net/dsa/tag_netc.c
> > new file mode 100644
> > index 0000000000000..ccedfe3a80b64
> > --- /dev/null
> > +++ b/net/dsa/tag_netc.c
> > @@ -0,0 +1,214 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2025-2026 NXP
> > + */
> > +
> > +#include <linux/dsa/tag_netc.h>
> > +
> > +#include "tag.h"
>=20
> This isn't a bug, but should linux/bitfield.h be explicitly included here=
?
> This file uses the FIELD_GET and FIELD_PREP macros.
>=20
> [ ... ]
>=20
> > +static void netc_flow_dissect(const struct sk_buff *skb, __be16 *proto=
,
> > +			      int *offset)
> > +{
> > +	struct netc_tag_cmn *tag_cmn =3D (struct netc_tag_cmn *)(skb->data - =
2);
> > +	int subtype =3D FIELD_GET(NETC_TAG_SUBTYPE, tag_cmn->type);
> > +	int type =3D FIELD_GET(NETC_TAG_TYPE, tag_cmn->type);
> > +	int tag_len =3D netc_get_rx_tag_len(type, subtype);
> > +
> > +	/* The RX minimum frame length of the NETC switch port is 64 bytes,
> > +	 * and the frame is received by the ENETC driver. From the hardware
> > +	 * perspective, the receive buffer of RX BD is at least 128 bytes,
> > +	 * so the switch tag header is guaranteed to be in the linear region
> > +	 * of the skb.
> > +	 */
> > +	*offset =3D tag_len;
> > +	*proto =3D ((__be16 *)skb->data)[(tag_len / 2) - 1];
>=20
> Can this cause an out-of-bounds read if an skb is injected from userspace
> (e.g., via raw sockets, traffic control filters, or BPF) directed at the
> conduit interface?

No, I do not think so. ETH_P_XDSA is only set on the RX path by
eth_type_trans(). All locally injected packets travel on the TX path, and
skb->protocol retains its original value instead of ETH_P_XDSA. Therefore,
the DSA guard condition proto =3D=3D htons(ETH_P_XDSA) in __skb_flow_dissec=
t()
is not true, and .flow_dissect() will not be called.

>=20
> If the injected skb has zero headroom (skb->data =3D=3D skb->head), readi=
ng
> skb->data - 2 will underflow the allocated buffer.
>=20
> Similarly, if the injected skb is fragmented and lacks sufficient data in
> the linear region, reading the inner protocol directly from skb->data
> could read past the valid linear area.
>=20
> Since the skb is passed as const to flow_dissect, pskb_may_pull cannot
> be used. Would it be better to use skb_header_pointer to safely access
> these packet headers?
>=20

