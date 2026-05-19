Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013037.outbound.protection.outlook.com [40.107.162.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254C0481252;
	Tue, 19 May 2026 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185311; cv=fail; b=tHMOShiuP7FheFyr9vus7/SH6EriJGqx9eRParT+U0xemzKr8Gd12CdJ1KCYQu+EjfEhhYWGQpwNQWZ25bRAtNl1YYFE19fIX4Ga3qMIQrj8g3vOCL0J1m7FVSYnUaglioB5QiXoHIa/THGpRwbc8rOcKQy7b49A1iqYbM6bobU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185311; c=relaxed/simple;
	bh=/B+UHfCNmNi23VGzqNVwfdMSIloxygXk2pRcp6SHpx0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pkh268cfFXtOvkTiKa9s5UDW9G7dpAT6XnDUPguyGIKZWo7hjDw3BEUg/b/RWnLOtXJJrDPXsjIViRxQ4vZ970opTWvlysVjPvAyrArTH2fzoZvb/fHZaoMjrd+u1UlqggDN3ZMng+dXi/+9wiIanY6mC/XxheGhOlX22t4+u84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Fi6HlPaY; arc=fail smtp.client-ip=40.107.162.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Fi6HlPaY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JX+LzS4zqvAvVwlHPEYTftAfZtiWXwog+gOAw1cGfDNN7ePHLxr/UmgzVAsB5Z6kNyjwSQ0wb8DfjdvUm96F5yIIMoxrCLyBiEwMd4FXazur8vUC37y1ENK+2aIXZ25X6tOhOB7uXrEISUcMAOrmeTz56dZ4F6ScYwKJclJ8V4eVnNXGj/puSlIkkymgZzKFPbFmdMWADUe+oByMXrSJhgyrhBnlWYtkVeG7CCiiv8Oj9wOHwDzD9E6KFOBk0EflZt5Vu0/o+SrevX01VDc8wEmXGR10FbUDpEWMgjd4AGqZ+Ip6qcxPQLY0hrOAdA3QwJkpuKk31HTOO+3KbnzmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAkSDBOU4nDU/atJc6MSNEM/6E2Xcy/8ljmD5pNUFwU=;
 b=GJscVGz7a2/Xqk+uvFq5DCMuQliL7uEYRnvLOcVPafr5bxPGW0YaCSDKvIkIrGja0L32npwnEn/rK8XvpOeDpLt+wZImPEzPFLN7v9kA11ia7tEM4mgM5rtIoLhw+qD+DYnFI3PLfGHY62BpIZRb/TDV7HOHLhBMzuvHg9ui+2CZ2q9bzGHAjO4BigILlHw/GAg1mcdbV/BSnPF4jBQ/lbZZEtUmzlRrv7/z3eNQp2zNE4T+r5pPec320rr4c1bGrfIOzUjU4sKjDg1QLrX9+AjmCASmMX1+Ub03rkz9gQDqoqFjfoYm0Y4e8P1UHzKV/zYT0QP8xT/NXmkPME5HLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAkSDBOU4nDU/atJc6MSNEM/6E2Xcy/8ljmD5pNUFwU=;
 b=Fi6HlPaYWUVxuTTlBMNg2cGEbcwSai1VgZ3ffYBd1iGzzU3tvIpogYSp7cioB2iF573EuwkLTBaLe/JJ1gUK1Qs3qUGVR0b1g7DORz1qjdvKiBPEbXbrBj5E1+3vkq/y9Rd8Qws0+WD3I4zEmGnPuCYYzRVwQO1zuPEjPQX461IrfwmsX3oXkAJjHTGZ5SPPMJ9HW6iD30r9y0AAs6oeJUt7p3EpsOZkaXg/xHBJJHKQ0fhDWVI+FMCwFwsgStm8teq0vFYtv/z8GPXua4OPpnwnNLO8SliqukfFvJBtTC4zrcw4EtY/TqnqOGv1dALBvjQ2whS5zphAnrWCCSJs3g==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by AS8PR04MB8817.eurprd04.prod.outlook.com (2603:10a6:20b:42c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 19 May
 2026 10:08:27 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 10:08:27 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "robh@kernel.org"
	<robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v8 net-next 14/15] net: dsa: netc: add support for the
 standardized counters
Thread-Topic: [PATCH v8 net-next 14/15] net: dsa: netc: add support for the
 standardized counters
Thread-Index: AQHc5p/TuWN/XJ0Ww0uEIalcdmBs7bYVBOaAgAAcb4A=
Date: Tue, 19 May 2026 10:08:27 +0000
Message-ID:
 <DBBPR04MB7500B63E350D10C5952D4F6B88002@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260518082506.1318236-15-wei.fang@nxp.com>
 <20260519082539.B3040C2BCB3@smtp.kernel.org>
In-Reply-To: <20260519082539.B3040C2BCB3@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|AS8PR04MB8817:EE_
x-ms-office365-filtering-correlation-id: 77d8cb3d-20fd-4f70-5304-08deb58e9204
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|56012099003|22082099003|18002099003|11063799006|38070700021|4143699003;
x-microsoft-antispam-message-info:
 sBpNZPKM3U2ARPB1DW1LyUtrG7TQa8ablJOJQl8elZsvs6Ffvpxe25tNY0pTR18m3OryYAoQvyzTixUc2PM9NamV5vWbbqPivh3l/yYqPLDsMW+YHYBEu/db/xByimu47F/dLm4wzCTuJ8kY7r0masIScdJXyhbu8pLvanfPbysu0dRTyowoeFBZJ8djkxgOWzJqWUSG1lVmc71ICBNzTAoqPFj/szwHyedytA6BaHScCVKBUi9wNuOBQRlq4ZPoQnjStlIWmmZkobUWRLzLVZzmXjS+XiD6JbEgTaL1JHVKE1j3U1lY57ON3rE0osc7qwZX4t6/OW1jRux5jE3i+PSgAONo9EpkUL7iC+poqLwKd1SxsqUM6GJqTdHQGmea+hYpeAP7ue3OYLzgqPI3eANwpm7oxwsrTtxUBNc494ZnOvbFGejxnVZ4fq+sLOWsu0vdVfEjGcWca41FU6BVB98vHfxF8KJilycbyupq5HZxn413WpkxY5hDry6vRaczQ1EY2CR2wUPqTEprwLCaQdB/9RH4ipjY7SaniIOiWkaScV1ITLmQ1GFj5vRNRVTh/FZVdPlj9utteeSkLmy+joA7Qt9IjnsisSS61mmL7eoPGLw6dcidHWKDgChXE1ZNdV9urF/nNdc6Sfb9hW6OFyQEgFa3/Q0C+abagfHWWkci03+AjkJVucPPIg31g3HWk/Ssilq9K0SUlRmm5M9GGaHy7QTaeeqoLJLP+EPY+k4yvax2PJEnQeu+mFT8IRtU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(56012099003)(22082099003)(18002099003)(11063799006)(38070700021)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?N1lzLHCP6ekfzPonSEfDyiIhNaVqaTlomufzzx6MEu9Ky/8Z3lQo4z1074K9?=
 =?us-ascii?Q?ylrD+jWg79gLf2221vwQ4Gohsfo0Xjp5y941UPwd1uhP6mu1WClHWgEDx9Oi?=
 =?us-ascii?Q?sE4H8VUteCDf1vFIvUkoeNHTrPqQzQuK734jHLyxJ9hXuxZk1pnWP0yIo5lH?=
 =?us-ascii?Q?IYSqq0p7mE9/11pXM8rac+wJojvyvraQvFDsOrRipT6a6r/KljLvSgnTa+lD?=
 =?us-ascii?Q?vtaKJRizTBnui5Ur+RNkCOfZ1naH3DYo/4bW/HhV2z8LZSsdYmj/JL5bbCvC?=
 =?us-ascii?Q?cq74h+QgxV+a9E03qUOR8w3NAQjr+9OLOEsgXTu8SVLfEeQbnLLbkJz8VYpx?=
 =?us-ascii?Q?xtAAZCnEgneZGjNP7vZp+yR/0/fUvTmdR2T6nNSrrv4R5nColwSJBDMJzmPG?=
 =?us-ascii?Q?v/A+hATdd+ZpNh+YjF9QxQNmGVTJu5uviwQyFA/B+42HcKbVb5BVaiH6Nmuh?=
 =?us-ascii?Q?XYAQ1ULMPXIefXa3k3iGbIeLUdbK7aka1jzC4WF2g+ZVaZeNNshAH5jgz8Cv?=
 =?us-ascii?Q?K6OxPYUT+7jxGkntlKFG0L6gfwQR08dm9KOiw1XgbMABu8UpoTJAWYO3O2QW?=
 =?us-ascii?Q?V/gyVHcAZCROoyONLyJqR5kPl4LEYHUC0jmmu/BQ6Gyd9oLZoRf/vbc/uLXQ?=
 =?us-ascii?Q?daUmJIPP3uhVGohxYgijvhIlJOMX/Q1qOgtsA2525hOHXOnYbeiFE3TEDGiJ?=
 =?us-ascii?Q?mvj6eAg7tD+BejhVOx3QC8ZaJVUMD6qotAjPdMTFI2tvA8pnFS0VIpZ+X6f/?=
 =?us-ascii?Q?FyR8ACqKd987BeJV3iFkpHzLn01jvR5HzgRg6zGQpmpcBICP6B5BntEv+3Z/?=
 =?us-ascii?Q?1FaYWaEh/2skjDtowa8Hgcm+fnD0U4FBQqE8oYuN/HY9NNf2XCp6k16nxCL0?=
 =?us-ascii?Q?q4uy63DglcbNmWyMZHnboesofIG+XCpEDS8piYSRGBYsfytOLuw4vtu1tixI?=
 =?us-ascii?Q?jXRxCGkVTSreBIjHiPKwiplMENY1U+Py/96p/p9hXnV2DQc/ZdAIB6MTHL2o?=
 =?us-ascii?Q?/2XlrmmV+KAji604ZBGdGess4SdauN24D6GAH9taWH7O8kmJ+kb2vLGSFV+g?=
 =?us-ascii?Q?cq09T+5ZrFx7wajTlMlVmvVyM3D6sVXH30ht9+onSFwI6tXR3Zl1khYYnc8t?=
 =?us-ascii?Q?REtP/sNcU7xszbLchsp1iDwIMsXUe5oHZI6gtQdL5/+xo6CjS34z//nhbJyF?=
 =?us-ascii?Q?AMx0Pa26nSeS9TXZG2aFXm/w5Gv111IJe9PBYFn+B4aaoWEVn1bjbZrpUl57?=
 =?us-ascii?Q?7l6+EdHveJZH0P5P8rh7/Mn4c04+U+8pcfMwfLyBIRMkO/BHgMd9e9NoWrg1?=
 =?us-ascii?Q?us6Mi6t6AdrbLRKdZDrgQLEagjrnzW7krhKoD026VzGkZ9fNI/QzU+0Gn+OD?=
 =?us-ascii?Q?ZHHi75Sg0f/WRgGXWYGwmd07lTer9UkP2JDtMh1QR+BQ6fu9yDO7w7Rvd0Nt?=
 =?us-ascii?Q?x7Drjcu46n2K8XdTNP2DuWLJGBTl7/FktSSoixHatUbkKeefdM4Vd4mk9xDR?=
 =?us-ascii?Q?IU00A03P5+xbZWOoZkvmFNryvvQNgHrXwlet9am8HTtGbpg66js5L0Skg5Qh?=
 =?us-ascii?Q?7hGE4YRNSf5VCTpvUqys37ORPqwqHXpERx3nN3JUbz4Gx1mPKJ7g4cimBGP5?=
 =?us-ascii?Q?4eEwiaHb55BrYUlTkUReC7cylPL06Vfuq37z/tkUFjBvT1xkQRe9235MZTeo?=
 =?us-ascii?Q?mgVVdN+YHaUcm5/tTAYEfsEexaVMxvp90p5KbwH+cXDasR7K?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d8cb3d-20fd-4f70-5304-08deb58e9204
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 10:08:27.2871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OmNYl2WsNi/6W28Chac1GjlvI/+fyRIdcDrKEcVNZOsNp2RVoJ8aYT4HJQ36WV5Ihnaveu/rY0cqCA7B9Y5zhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8817

> net: dsa: netc: add support for the standardized counters
>=20
> This commit adds support for reading RMON, MAC, pause, and control
> statistics for the eMAC and pMAC on NXP NETC switch ports. The 64-bit
> hardware counters are exposed through standard ethtool APIs.
>=20
> > diff --git a/include/linux/fsl/netc_global.h b/include/linux/fsl/netc_g=
lobal.h
> > index fdecca8c90f0c..5b8ff528d3699 100644
> > --- a/include/linux/fsl/netc_global.h
> > +++ b/include/linux/fsl/netc_global.h
> > @@ -5,6 +5,7 @@
> >  #define __NETC_GLOBAL_H
> >
> >  #include <linux/io.h>
> > +#include <linux/io-64-nonatomic-lo-hi.h>
>=20
> [ ... ]
>=20
> > +static inline u64 netc_read64(void __iomem *reg)
> > +{
> > +	return ioread64(reg);
> > +}
>=20
> Can this cause torn reads on 32-bit architectures?

There is no 32-bit architecture using NETC. The NETC is used on
ARM64 architecture.

>=20
> Since linux/io-64-nonatomic-lo-hi.h is included, ioread64() will fall bac=
k
> to ioread64_lo_hi() on 32-bit systems, which performs two independent 32-=
bit
> reads (lower half, then upper half).
>=20
> Because the MAC statistics are free-running hardware counters, if the low=
er
> 32 bits overflow between the two reads, the upper read will see the newly
> incremented value. This could result in a spurious 4GB spike in the
> aggregated value.
>=20
> Should this implement a software retry loop to guarantee atomic reads of =
the
> 64-bit counters, similar to the pattern used in the ENETC driver?
>=20
> do {
>     high =3D ...;
>     low =3D ...;
>     tmp =3D ...;
> } while (high !=3D tmp);

