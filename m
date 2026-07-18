Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBAA283FD9;
	Sat, 18 Jul 2026 03:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784343883; cv=fail; b=rdQMMqmETMjIxZHksEtL3/HsZROHnJ5uzAsQt4DFvcqzKzNjEcKFhfFCAPq1GBul+4uHBnJGjOBrQSpoPqpBxq/97+xpTEM0NHcWGGhpQr1QXAYpirkuGHBKTkXjWezogOkg6m35OyQYDnqfhJ7ykL5DUOkUvFqm/bkwYZK2ngI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784343883; c=relaxed/simple;
	bh=OWADNJe7Ux8QnoIf5WFpazUPwUKrVXlZwdKo2kA0zfM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XmIHVKprPnQkY+59sSsszP7ao6/JBUlP5URJhtaKphWUBf/Fm/+Fd5INXwrnKIIVS8WRJAAKMmEEXQRf8W66KOHkxUI926YlIShtsCvdF0kBg33l590htXdKu1bNJ8qLMZAztmbI6FwkGiSWRuuLL87UhfgnK+dMVDkgLZzGpWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YZcp5pvV; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YZcp5pvV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6qe6PRlk4ihFy46PO+P5IPysbQnzuM4YMlwbUX8rci1et8XKJeh4m7Wpmg0jTMk/+odgBnYbTvzOyUpo3vHEXBcHnVPstfbz6TqjGm7ktBBqqBt1ZI/QG8a2ldp3vgbF5IIBRmuYiZH5dKN4B60hESzRCmWyIRQN/GquGwKxtNKL2e0AdC+0cePyA6RslIQAqwADdHjS42NZVFleCTA6lmBUgi2doALzYgmfYQs93f4MWOl4pcL6yLWUb/BXUyxz8qInyBIpwrA6JTYD1/43TdXENBtrOGAlRq5LVAa77OQCM+qVJ5hHq3k19o6+DkvU5+Ab9vNwShsrGcuzJq5Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvPDpH3pDAy8UPS0CmlV9h7+bDloOLR4iSB2BzUcyTE=;
 b=d4IZaauGZnGCZPigg8/wocQsGxAgegcDME6A5oWTGD0g3Na02ToHGeV064WomoxKpWpkCLF/Z/rPuG+iLbGzfpgKcNtEyHLj8vwIl+RNTYC6Fl/fEW7MzAFLiss6i9WULICNO0tj6eYPfKWpWjN6QnKIpXtwd1qtq9yezv64GWBiVkt7TI9uFoEkMBy4nb1UhGL974x2VsM4roh+KVhNd/ZCBRVFA5EgTcJmnqKDtDlqa9wsYjts7Y9ZYiD2PNzMJI4Qo7v3S3y6mbYyOOhHzvymSz6G119EOaIr0k6ZFVfV0CrCm1/tOyHpw4SQpW4fpNW1A4DSPr9EPSEastyuPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvPDpH3pDAy8UPS0CmlV9h7+bDloOLR4iSB2BzUcyTE=;
 b=YZcp5pvV7EfMPBfduRVtH7CwpWB1CXPBnyLmVlG63IEdHA5AK6kj1GLI+OSxvx0Ug4xjml2VuiZ46Pe0apIe2VG1Wvvr5i1/xkLl+fSvBWI0UOr/ZoYU5NpGdlE3r0JjfMJbIr6hWK0vP0iVvQlJTJMrZBRuXNdODqWdt62xYzFc5Ga6amjNHuBjcOUnvsed1p0DGPZwy535rJwQuYQx8hACntq6cUHv4vro8m2ISujpmcpv7RnoX8As5zJo3rTXXqWCbAuiW+UACagp6PY+H87yNtzyyWc73qygyXBvRqYY2V6Qic1eInRIsGktW05VEDPNyp9T4+VPPaqNl+ewKw==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by VI0PR04MB10300.eurprd04.prod.outlook.com (2603:10a6:800:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Sat, 18 Jul
 2026 03:04:33 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0223.012; Sat, 18 Jul 2026
 03:04:32 +0000
From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>
Subject: RE: [PATCH v28 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Topic: [PATCH v28 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Index: AQHdFdrMrQ2/7lZrskWtBxUe/LrG/bZxjfOAgABUUoCAAAwxAA==
Date: Sat, 18 Jul 2026 03:04:32 +0000
Message-ID:
 <GV2PR04MB122710DD95A0AEC916818F4AC95C52@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
 <20260717-imx-se-if-v28-3-0a9659c7e69d@nxp.com>
 <20260717111009.B55531F000E9@smtp.kernel.org> <alpUTTH1VA9hvQva@SMW015318>
In-Reply-To: <alpUTTH1VA9hvQva@SMW015318>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|VI0PR04MB10300:EE_
x-ms-office365-filtering-correlation-id: 4adbabdf-a2f8-4cad-0e8c-08dee4794aa2
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|19092799006|1800799024|38070700021|13003099007|10067099003|6133799003|4143699003|56012099006|5023799004|11063799006|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info:
 MjJ+QnShJ748ufcSWlE5HMIOyC+rh95hYh58/Y9ovbaefBavgbEPHIZGIwd/VXoE9rvvb4aDldUdUZGwxtbaPHNidyU+XeskWsFPOICWop2kmYRlKHg3OgA6t4eKuvFidx13ncvhzfO+me2K7eHO114Wn/SP4AMAaV6PqIblpjCY8vNoefVnZCvt/j41jA4ce2viocEzQU6AtgySLjcpoZv2ahB+Bu/WQ2FDoGlk6HbGioNsrT7yQijAd4tWDeXomUTUIlx9eF2VDBMjY523WkxCBJJABxoVonCk9th37ljOR5Qwhq4Ua8XHAzugTV/WD+HXQhz0SLtOsTLP+fQFF9QN2Gx36E8k8yh3QRJiOO1CffeYDAPf0xdaL1+s6B84DIE4gQQQAYW3vhhBRw/6yfsjmMbd52JLbh0F2+TpzRjKg0LNWf6Mczh5S6IHswFEyXm/RF6wYHL6Fi/Z7ZOBOMkzCqsyGFTyh0ucUGV3aEVOgo3nPXz/Knnohk6O0usWGkFini0NTeiPQQcLyKGWTnfHiyOdHuTL6nLrOJ/yiYMiTWug7LkBPWyPGdvTmJDNDFsC78w8RFIMAsxlg41d1Mn12TV2dhCXoD+43reyarOTQAPnW3R2ryu4f9fbzLPKV4hqCEM/hZZgrvGQq2/ZIsfH4LRe6PchD66xkewIDZE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(19092799006)(1800799024)(38070700021)(13003099007)(10067099003)(6133799003)(4143699003)(56012099006)(5023799004)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?X+Qp0iqM4Y3YC9gTZJyUiu8WGisBfDBRSbPmzUcnhWOfDUW7zOEJlLDhtNSO?=
 =?us-ascii?Q?45hPLxEha5BR8dOc4hEg34/8baM0V7HMt7ysnuTj0NCab2LMt7LDlDcsAg3Q?=
 =?us-ascii?Q?B/+WYugTxDceNVQX3CLABMdbfIxawnD4QN0h/mC1ADD9xqjZAxKeDgy2H+3x?=
 =?us-ascii?Q?uIV5kolc43KDbczkSPXIoV5hig+SO6/kwHzp7vY0SoSZ0PgUt8ytRrOwi99W?=
 =?us-ascii?Q?uCNTZemvxIrxUzQdVNH1cs9VqD4HxrvG6FwMB70Z98AbHUWQjtn5X3Jwjmz0?=
 =?us-ascii?Q?VvTa8xxOE1A33F27YdavkraqhVHejso3eEgLtoS2oCugc/grEOB8mJH6XRyV?=
 =?us-ascii?Q?QF81SMtzOuNDBuvNpF6pCdR/tpX2hDFvI5hYD50AIAOD+oKogJ3LRHfmzUM6?=
 =?us-ascii?Q?O7iEP49BVeVJupOjizu7zt7tNL1ijHOhQiy0hE9ebaHiV+7PZm3qZEVoELeu?=
 =?us-ascii?Q?HSDCP4zVpCuaJ/bt9sy5DrBvKGNMCWtFunyXStnd84TC6a3b4qf3axXZAw82?=
 =?us-ascii?Q?hkddAgvfoQvyoeNpJEcDCS093OlSbrmxsx6oDOqZX96WoNvb0Y+AAmIbfS52?=
 =?us-ascii?Q?5kKD/TP2ZSZJSDNFUSvIh/iSFeDy7YX3ulqII43pgwPZ97bapz0OqmAgTSEZ?=
 =?us-ascii?Q?XUu8aFnb465CqQFq8zswJTr4n3QOYJhiTCxg8DixvXumYQRQuGE1EfZK1mmC?=
 =?us-ascii?Q?mNPfmgbs+ER/dpo7m3QnlOe4fqsP2xJQ/0MeJcsOsGY7rpdJF1YVLezYINt2?=
 =?us-ascii?Q?XwHTZh43itVUe/70F1/ABlstqfNJnD/L1kIiv1tzj5SDqUnbtv6sn+nepdhu?=
 =?us-ascii?Q?SHK9ejLgoLzpAXVwcxStDncBJwjaJgMq1z7kDN3cedFlKo9mmsmKlYGSgAnw?=
 =?us-ascii?Q?9LoYvY6cj8d1ODq/B+qF0GGtA7bQUAMU3yoBVOrCZQ3IkczKwxmd/C9RStSQ?=
 =?us-ascii?Q?iOrqRm/uipuvxXNLKPmW5xKYVWryfnMrxvjbQ1uClME+hsSTgz8NMmqNCNEa?=
 =?us-ascii?Q?WcwatE7LAmoaB6zN1E01iii+gv0OhVUQ8HtgCYClt4V/dzDVCCiWPyGWbl8W?=
 =?us-ascii?Q?R5+yo/3y0gx9Lp24RlQoGmqbMV+I021pzUFuaImN3F7HStKPaxpEXf/7fEF+?=
 =?us-ascii?Q?VwAv14OKEvrf8mrRAxES0hqsMsLqk2hZ8NEeo27DogGqii1V6R5VK6k1wQpP?=
 =?us-ascii?Q?gLm8946b2fzsaSRiCWKrkScWh1ScV/9PkE89eEXKdcNWFUr9GIK/OpbEDb0G?=
 =?us-ascii?Q?GgBdtcjfCEA4FjoWFfnZ2cQ5OUyP1hpkspGdaqWF84RyW7oCA3mZqOeyiVM3?=
 =?us-ascii?Q?lDwIwa8d3+oLbHGjOpPAJ8i/TkzrZHizF6wfY+KJAt2gOhLTsdrVSNptAvCp?=
 =?us-ascii?Q?ZlESxHEf1CykDXgzbanfu0eMKvszFQZ4N7b16yLJuXHNTI+gdA/zvxU838cC?=
 =?us-ascii?Q?pl3ab5W9/wOknWl0bQEEYfCKYKLAtXbBBgaxm9Dqk332f1MIdqZJ8+A36sNq?=
 =?us-ascii?Q?kiEnm/vL2+DijXMON9PXogp/icloh8XlgouW4H4rz5eWGzIVWalDWpwu4VPZ?=
 =?us-ascii?Q?GAYYoBYsPavmeFcqCV9vKKFYpNXd3QvzhvNgbEhbIZehUr5nH1gWxQiRYkC2?=
 =?us-ascii?Q?cx+IPZHI8WuofQymtEpoEM66EwnYv73+9tNfvFHr9ogA0/rlBhXBXHfVoP3L?=
 =?us-ascii?Q?+MBH4sFnWugorX9iOtQo+wN7JgkVMiUtOZ8gQsnV0+Okh8NKqJXWgrSSp71F?=
 =?us-ascii?Q?cIy6Ad4bvg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4adbabdf-a2f8-4cad-0e8c-08dee4794aa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2026 03:04:32.6867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jju7tHcTyPDg4w2cZ0rXLSN22Zy6RtFosWLzzKQ5GbW/pUEpylrbF1jGhAY/gG23105Jzd3FzI6rok1p1564xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10300

=20
> On Fri, Jul 17, 2026 at 11:10:09AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 6 potential is=
sue(s)
> to consider:
> > - [High] The mailbox receive callback `se_if_rx_callback` dereferences =
`msg`
> without checking `IS_ERR()`, leading to a kernel panic if the mailbox con=
troller
> returns an error.
> > - [High] `ele_msg_rcv()` uses `MAX_SCHEDULE_TIMEOUT` causing an infinit=
e
> uninterruptible wait and subsystem deadlock if the firmware hangs.
> > - [Medium] Global state `var_se_info.soc_rev` prevents SoC device
> registration and per-device IMEM state initialization on driver rebind or
> secondary device instances.
> > - [Medium] Casting a 1-byte aligned stack array to `struct ele_dev_info=
` and
> `u32` pointers causes undefined behavior and potential unaligned memory
> access faults.
> > - [Medium] The driver fails to expose the file descriptor interfaces cl=
aimed in
> the commit message and Kconfig.
> > - [Low] The SoC revision is incorrectly formatted as minor.major instea=
d of
> major.minor.
> > --
> >
> > --- Patch [3]: [PATCH v28 3/7] firmware: imx: add driver for NXP
> > EdgeLock Enclave --- commit a06a0c9a5464457c1ae77bb60350c41fff331ed9
> > Author: Pankaj Gupta <pankaj.gupta@nxp.com>
> > Subject: firmware: imx: add driver for NXP EdgeLock Enclave
> >
> > Add MU-based communication interface for secure enclave.
> > The secure enclave FW communicates with Linux over single or multiple
> > dedicated messaging unit(MU) based interface(s).
> >
> > Link:
> > https://sashiko.dev/#/patchset/20260715-imx-se-if-v27-0-bb7c45952f06@n
> > xp.com?part=3D3
> >
> > > diff --git a/drivers/firmware/imx/Kconfig
> > > b/drivers/firmware/imx/Kconfig index 127ad752acf86..e3cb7f965e70e
> > > 100644
> > > --- a/drivers/firmware/imx/Kconfig
> > > +++ b/drivers/firmware/imx/Kconfig
> >
> > [ ... ]
> >
> > > @@ -55,3 +55,16 @@ config IMX_SCMI_MISC_DRV
> > >  	  core that could provide misc functions such as board control.
> > >
> > >  	  This driver can also be built as a module.
> > > +
> > > +config IMX_SEC_ENCLAVE
> > > +	tristate "i.MX Embedded Secure Enclave - EdgeLock Enclave Firmware
> driver."
> > > +	depends on MAILBOX && ((IMX_MBOX && ARCH_MXC && ARM64) ||
> COMPILE_TEST)
> > > +	select FW_LOADER
> > > +	default m if ARCH_MXC
> > > +
> > > +	help
> > > +	  Exposes APIs supported by the iMX Secure Enclave HW IP called:
> > > +	  - EdgeLock Enclave Firmware (for i.MX8ULP, i.MX93),
> > > +	    like base, HSM, V2X & SHE using the SAB protocol via the shared
> Messaging
> > > +	    Unit. This driver exposes these interfaces via a set of file de=
scriptors
> > > +	    allowing to configure shared memory, send and receive messages.
> >
> > [Severity: Medium]
> > Is this Kconfig description accurate? It mentions exposing interfaces
> > via a set of file descriptors allowing to configure shared memory,
> > send and receive messages. However, there is no character device
> > registration or file operations implemented in this patch.
>=20
> please check this

Patch 3/7 only adds the base firmware communication path. The
misc-device file descriptor interface is added later in patch 5/7.=20
Will remove the file-descriptor wording from the Kconfig help in patch 3/7.
And add it with the miscdev patch 5/7.
>=20
> >
> > > diff --git a/drivers/firmware/imx/ele_base_msg.h
> > > b/drivers/firmware/imx/ele_base_msg.h
> > > new file mode 100644
> > > index 0000000000000..4c3699543e879
> > > --- /dev/null
> > > +++ b/drivers/firmware/imx/ele_base_msg.h
> >
> > [ ... ]
> >
> > > @@ -0,0 +1,98 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * Copyright 2025 NXP
> > > + *
> > > + * Header file for the EdgeLock Enclave Base API(s).
> > > + */
> >
> > [ ... ]
> >
> > > +#define GET_SERIAL_NUM_FROM_UID(x, uid_word_sz) ({\
> > > +	const u32 *__x =3D (const u32 *)(x); \
> > > +	size_t __sz =3D (uid_word_sz); \
> > > +	((u64)__x[__sz - 1] << 32) | __x[0]; \
> > > +	})
> >
> > [Severity: Medium]
> > Can this macro cause undefined behavior? When called from
> > get_se_soc_info(), the x parameter points into a 1-byte aligned stack
> > array (u8 data). Casting this to a u32 pointer and dereferencing it
> > could trigger unaligned memory access faults on architectures with stri=
ct
> alignment requirements.
> >
> > > diff --git a/drivers/firmware/imx/ele_common.c
> > > b/drivers/firmware/imx/ele_common.c
> > > new file mode 100644
> > > index 0000000000000..ca8a32a82689b
> > > --- /dev/null
> > > +++ b/drivers/firmware/imx/ele_common.c
> >
> > [ ... ]
> >
> > > @@ -0,0 +1,470 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright 2025 NXP
> > > + */
> >
> > [ ... ]
> >
> > > +int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle
> > > +*se_clbk_hdl) {
> > > +	bool wait_uninterruptible =3D false;
> > > +	unsigned long remaining_jiffies;
> > > +	unsigned long flags;
> > > +	int ret;
> > > +
> > > +	remaining_jiffies =3D MAX_SCHEDULE_TIMEOUT;
> > > +	do {
> > > +		if (wait_uninterruptible)
> > > +			ret =3D wait_for_completion_timeout(&se_clbk_hdl-
> >done,
> > > +							  remaining_jiffies);
> >
> > [Severity: High]
> > Can this loop cause a subsystem deadlock? Since remaining_jiffies is
> > set to MAX_SCHEDULE_TIMEOUT, wait_for_completion_timeout() blocks
> > indefinitely. If the firmware hangs and wait_uninterruptible is set to
> > true after a signal, the thread will enter an infinite uninterruptible
> > sleep while holding the se_if_cmd_lock mutex. The timeout fallback and
> > circuit breaker logic become unreachable.
>=20
> Can you use reasonable timeout value to avoid deadlock?

Accepted. Will fix in v29. Though it will get corrected in patch 5/7

>=20
> >
> > > +		else
> > > +			ret =3D
> wait_for_completion_interruptible_timeout(&se_clbk_hdl->done,
> > > +
> 	remaining_jiffies);
> >
> > [ ... ]
> >
> > > +void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg) {
> > > +	struct se_clbk_handle *se_clbk_hdl;
> > > +	struct device *dev =3D mbox_cl->dev;
> > > +	struct se_msg_hdr *header;
> > > +	bool sz_mismatch =3D false;
> > > +	struct se_if_priv *priv;
> > > +	unsigned long flags;
> > > +	u32 rx_msg_sz;
> > > +
> > > +	priv =3D dev_get_drvdata(dev);
> > > +
> > > +	/* The function can be called with NULL msg */
> > > +	if (!msg) {
> > > +		dev_err(dev, "Message is invalid\n");
> > > +		return;
> > > +	}
> > > +
> > > +	header =3D msg;
> > > +	rx_msg_sz =3D header->size << 2;
> >
> > [Severity: High]
> > Does this code safely handle mailbox errors? If the mailbox controller
> > returns an error (like a timeout), it typically passes ERR_PTR(err) to
> > the callback. The check for !msg allows ERR_PTR to bypass the check,
> > which would lead to a kernel panic when msg is cast to struct
> > se_msg_hdr and dereferenced here.
>=20
> Please double check this ? if yes, should use IS_ERR()
Accepted will fix in v29.

>=20
> >
> > > diff --git a/drivers/firmware/imx/se_ctrl.c
> > > b/drivers/firmware/imx/se_ctrl.c new file mode 100644 index
> > > 0000000000000..9bb59c200911b
> > > --- /dev/null
> > > +++ b/drivers/firmware/imx/se_ctrl.c
> >
> > [ ... ]
> >
> > > @@ -0,0 +1,417 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright 2026 NXP
> > > + */
> >
> > [ ... ]
> >
> > > +static int get_se_soc_info(struct se_if_priv *priv, const struct
> > > +se_soc_info *se_info) {
> > > +	struct se_fw_load_info *load_fw =3D get_load_fw_instance(priv);
> > > +	struct soc_device_attribute *attr;
> > > +	u8 data[MAX_SOC_INFO_DATA_SZ];
> > > +	struct ele_dev_info *s_info;
> > > +	struct soc_device *sdev;
> > > +	int err =3D 0;
> > > +
> > > +	/*
> > > +	 * This function should be called once.
> > > +	 * Check if the se_soc_rev is zero to continue.
> > > +	 */
> > > +	guard(mutex)(&var_se_info.se_var_info_lock);
> > > +	if (var_se_info.soc_rev)
> > > +		return err;
> >
> > [Severity: Medium]
> > Will this early return prevent initialization on driver rebind? When
> > the driver is unbound, soc_device_unregister() removes the SoC device,
> > but the global var_se_info.soc_rev is never cleared. On a subsequent
> > bind, a non-zero soc_rev causes an early return, bypassing
> > soc_device_register() and leaving load_fw->imem.state uninitialized.
> >
> > > +
> > > +	err =3D ele_fetch_soc_info(priv, &data);
> >
> > [ ... ]
> >
> > > +	if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, var_se_info.soc_rev))
> > > +		attr->revision =3D devm_kasprintf(priv->dev, GFP_KERNEL,
> "%x.%x",
> > > +
> 	FIELD_GET(DEV_GETINFO_MIN_VER_MASK,
> > > +							  var_se_info.soc_rev),
> > > +
> 	FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
> > > +
> var_se_info.soc_rev));
> >
> > [Severity: Low]
> > Is this string format correct? It prints MIN_VER_MASK before
> > MAJ_VER_MASK, resulting in minor.major instead of major.minor. This
> > might break userspace parsing expectations.
>=20
> Make sense, please fix it.
>=20
> Frank

[Accepted] Will correct the order. Will fix this in v29

>=20
> >
> > --
> > Sashiko AI review *
> > https://sashiko.dev/#/patchset/20260717-imx-se-if-v28-0-0a9659c7e69d@n
> > xp.com?part=3D3
