Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3747D36D503;
	Thu, 16 Jul 2026 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218122; cv=fail; b=K3Dljnu0wdSpZQigzEI4aC38OCGgzOw4JHco8XdlPEb6Ri3eHUN+albpc/0TQmtS/yUAtv0TKCAcAU3OZ0dskPA+cgTQmFd//A+AFX9NTce4B3dr73YZd25F4w9sgEEfpMqUuiTsCLK5nA6CZe1veOOTsa/OxrCeBOH0zHMJgI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218122; c=relaxed/simple;
	bh=PVCzVByii/Ap+WCVbCU3yuWjzyF39kYdwMS1Dt3oUEw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qfIOuCzTqEKTBHSHbWdl1gO5j9YiPMFyRPCOyZHGKwp6Vh8yl3JUVIcmQ1jjkg5oP2mWO7kA0BXn/Oogn7VpTzBBKd2YNAKoqBRWvyUK7MpmplWv8fwqGvlGqELCX/0au1FSTmyClOJi9T3bEvHB9f3CF+S2UcqqqQ0RbFRxY1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NyvPBvkg; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NyvPBvkg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuqevhtSjSKN7UCOSMhV2s+zCJUU0tGdS2YfKONdbNMq05/C4hn51ErR5Jb8Xbt52mWl8N6Iy4N+delieBNsLUABNOFpH6qKuYSHtp2A2QrLHMsvVVOLfNm0SHRTAGqcB5TZCkN7ojBPwoAoP/xZ/ZYtGKIjEXOM64MjqIVWNReTS6XGaZpZxbSmDG/YYm4pnKMt8uKpAIhXMib1h/KurdY3CeEy3sjcfLVK18b6VdE1Jz7vgYev7t6sz0EUQxyyKGbReS+e4BcKK4wEj0HjccF1v8FgKwjyuvzDOEGCKoz3XH65pAe4CJWHOIjb5F6ETM9LrF83aIm8ThOOnrWKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FlaGoD4YR3J4VUZSnY0HHTVIC5svK6IdAOSb1SAedc=;
 b=w0i7J5Fi9cwL/vuUIJRDJuFw06vnN7xH/8NdBoSjMSa+5CCvDkOVRTTxhjGvrcr8I04CTEW3K/HK1qmvLQu5hVN6OwTpfbr9kDg8hZh4xvm4cAUZ8eq7XNt6yly3Jdz6sh2viH39MbjUXvMqjIFgYzUyJH/j+zN/bcBKF4bfhu8Bi2SxPSH5grsWWQ2OCVpWiQFnObRUTtX0aehGo/Zy3gB/nUpPHcwYkHU9Uh89pYQq6SxjMgupt8YE271i+66EB9Oabl6U1OKTYaO+hI/lcnk74ByDUwbmmlPNXEuX1s+q7O3K5ClG5wIy6gbe1Lj6rwMLlojOM1PLO1Q3qrk+hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FlaGoD4YR3J4VUZSnY0HHTVIC5svK6IdAOSb1SAedc=;
 b=NyvPBvkga2J5nWtEn9BIONs1efQL+67aT6xkKWqCVEz9T8gKmzljzpn6k2yA/5Ex+royN00JqXGpMSe1tNN2lmqX21SVY5ktmGKRbGo70f/GUyMxsFBqd3jlKX18wX1Ex6PRuISr/3tTXujgsZxg7R0C/RoxAZyjc2tBa1DvCoQQuGt93dcTMH9Nct6xqpAyflrMm2FLrqS+KZJS6rNbocQtWLTWA9Kw9aXR1te3Uvnh0l6SoPtzjUHbtXAPbOnzasqNLOWRKDYXIC7/4vXAyDmLKswU258DNdvjjJCBRvgdJZcBg5UEl05wzGV7WcEu107A8NOywARBy/bwl7kwsQ==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS5PR04MB9998.eurprd04.prod.outlook.com (2603:10a6:20b:67e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 16 Jul
 2026 16:08:31 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 16:08:31 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "media-ci@linuxtv.org"
	<media-ci@linuxtv.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v12 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Thread-Topic: [PATCH v12 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Thread-Index: AQHdFPI2BxCx6oGQ30ixtkjati0BTbZvvV8AgABer4CAADK14A==
Date: Thu, 16 Jul 2026 16:08:30 +0000
Message-ID:
 <AS8PR04MB90802814B5BCDD9FF1C89742FAC72@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260716-csi_formatter-v12-0-2601d17fc4af@oss.nxp.com>
 <20260716-csi_formatter-v12-3-2601d17fc4af@oss.nxp.com>
 <20260716072052.A20961F000E9@smtp.kernel.org> <aljVwX1wzPqV3c_7@SMW015318>
In-Reply-To: <aljVwX1wzPqV3c_7@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|AS5PR04MB9998:EE_
x-ms-office365-filtering-correlation-id: f610835b-9102-4b57-abc1-08dee3547acc
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|19092799006|366016|56012099006|11063799006|5023799004|4143699003|6133799003|18002099003|22082099003|10067099003|38070700021;
x-microsoft-antispam-message-info:
 rKG8WSt7z39LSHJtXjYTzskwpnxBVB1q185BCUIiL9J7LqfNbPNo+8RsAA3cst0zhXHvjtyCN/rEdNMDDI7BxQyAk+r7jB3dfId1x1WaUf7HRcx8Ozgt1WdpDDVyweKovLCRDd8gRCZCEUkMDfffdDWrNLTVRh/MgB+09FCkpk3S38lNmtlUVGnX88m0nwZJ2nfHyANqOPh6ak38OPaPr9InBQCh1mUavpbEb6ZupopTEixrL8UZ2TotqvWTC5p6/vTjhci0cTcO12fEm2ESzrFrKQ+tZNZ+iBezB/wsEdbbau8efc8hsnVLzEH2WYn0yaUGR+PfFkOtqXKyS9mqpeT2OofziXfPwTI4UY0e6z6EpDgFgBXx240me4d8dmWI2+tO2NwJGFPiDCrH7kQrOa7mLTCKTFkoU6XJbG/cjtCGahFA8asb8bTtcKAuW4IdF/hV+k95qZlM3dHhLsmtRq3BJONbkBWFhYLBbbWYV7XYxhmvFtNWzatfBOZOX6ibchMEnDe+ztL1q7cMvO4VjcujoIuYvuIWi1jKIRWJEb/uILtvQ+9a96BpLfzbgNs5QysqGinNZ1gD73/exyTQ18mLJDwJuM/Ooy5M5wGGahYy8+EKKRXPzUZV8VI4QeWfp6PmBFI44tnLMjIgDwXgksteCMPQLmALuy640Ng5l4g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(5023799004)(4143699003)(6133799003)(18002099003)(22082099003)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7tvlatccyYlMuzmdVrWZgfZYtOTDLrDnm5/6FcrSQin24UyUs5w9FEUaPUHE?=
 =?us-ascii?Q?dhbzQRBl0kDuNALJYiplgO5v6DYIF7rPMU8dhqF6rmAZkGhYUyRqMWoC9yw/?=
 =?us-ascii?Q?N7z9V71j2imkBJDdct0ullYt2tpsJF1JY07FmuimyHExrIad6YEH3GXjsXYD?=
 =?us-ascii?Q?zbPUedYczjt47x4zeqPWR3lqPWn8VlG9jmEnd4ZPuydxxCczVkwN0Ta25OWx?=
 =?us-ascii?Q?WhmbXmMviu4B7IdeUiHzbus271p6apa9r9k66vEKqSiiBBPDRS2LZWkW8WYz?=
 =?us-ascii?Q?p3+7F2w2UoMRZDWEB+7igyaUUa7LIdsw2lJx6IzDwScdQJsqSHCoO0JLDl7H?=
 =?us-ascii?Q?cz/La/2eNshqupYfeBAWsUbjBBOMUyADbbIUpWAnQBD14XPIluk1Dy+3pRYT?=
 =?us-ascii?Q?IEuG9vhQagpQe3DYKcW6AMg+O/rdYJ3E8soU/OhlEWMfJ/s89YKET1qI37vt?=
 =?us-ascii?Q?RWl6hFAQ1NL/kbMGw4OAe7pCcWJciDHYfMHRkkSD5sw/DLz624cFOs5ptU2w?=
 =?us-ascii?Q?1dyER8OqZMaRd2bcpWOU+zpkim63K04k5iaXRWQkwGU4fhgyBGdtsusBgmBu?=
 =?us-ascii?Q?SmbOuDPOIdJdId3MlgM6+sRzk0+zlPWcxfdW20RH/a16zer6TW9Cxu1ghtyw?=
 =?us-ascii?Q?c54hsfhJ/fMAHZw58CCpH3XW6g2Hq+PpFnB59pUyVPGfNjyj5kXHQ6/l85K9?=
 =?us-ascii?Q?eazsx+q88wrTS9ClMEcllFUeWN53CHqNQqJUWqCN2cfBK9F7hFc6/beT05v+?=
 =?us-ascii?Q?PEn6KVkygAlj9rBDB402p7EGbrOBRyLbgCK6zfXYezMlkmzyih8zE0plAs9O?=
 =?us-ascii?Q?YJ3Lydn+lU88cze9aaQ/mPtsUO3rWcWyc0Cu8cg/zcZ3pTu55+wkmtqBbYrQ?=
 =?us-ascii?Q?OwjtEumWGBqALUlE+ddWzE9GkmbxvbPtcY7MErjBbf0f/s3U7YH2VXyAmIJN?=
 =?us-ascii?Q?543lPPaCX+E/rg33UDbVM5JImoqABhCc1zQKKZ22DQu4CwcUHDmT6wvw/S7A?=
 =?us-ascii?Q?V0CmgjKwaUPbABRx4AMceqwiknbuO8WV9oWQhn5OzWJexAT0nJmhI5P4Ag6L?=
 =?us-ascii?Q?atCjaINbei8V85rerw3LPHtEA5jop7iYSRuSCCqvbJDwJU+jjBHCTto9ooJP?=
 =?us-ascii?Q?qSLBmEZ4uBNiffFd6vo7HkrJVSz1Gp8LG4gA6wcDWQPWOBlKQGJjkh8RMU/q?=
 =?us-ascii?Q?zW1eILvVhtTOT5dR6sZMKadXKR4ut9l5PqEocF+QqdOZy8fld79Q6NmnVw5B?=
 =?us-ascii?Q?TVqr0nu4IjsWdyCGmvqWyNFUzDfnmfPtf18hUJeOgeE13bdDMKfILWKC10EV?=
 =?us-ascii?Q?fOtKOAFH5TO1hWWFAvkz8VGw/j8wwHTKiXzxa2FwNLf+fp6u7g0YJOwAku8g?=
 =?us-ascii?Q?TeErfTXme2Jabz28JWKlBpA3Mv29uPJhWE9aTFadHzp1+HTG87T90ZH1tAfa?=
 =?us-ascii?Q?nxiRFqcHt760Z+MRSuysuAxaenL7p0hvBfnNT4Alt20kWzshknTWikU0MmlI?=
 =?us-ascii?Q?xR2FugmYZ6v4zo06HHAHWyczYPPhCtloDcp5MBHlIUQlNRc927MLB5HBq1Mr?=
 =?us-ascii?Q?j9IXiuOnFfeurePFSaEuSAIxqCsh6BNFLWT2dnQDzmOLr9eKN+xPZ71fy7uy?=
 =?us-ascii?Q?lW0hJGumImExHmmU6A+MvBxxKzceyc3MF6x9WuZv5WcEfpK2dYKz8YxcudT+?=
 =?us-ascii?Q?sBaT+FxpMWX7OvvLBFLn9uAsQ2xH9h4saXOGBUiAwJ8iYP8X/0NeMJ6se/H6?=
 =?us-ascii?Q?xXFz+AZqiA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f610835b-9102-4b57-abc1-08dee3547acc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 16:08:30.9672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hRu8QyPqdQhY4B8wjHXtGa8s+HJaWYn8IqTKeTWxjHAwnSxMmgRDGFsh27F7bz8CRjPWGCEXoEBM0D7j/qFAQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9998

Hi Frank,

> -----Original Message-----
> From: Frank Li (OSS) <frank.li@oss.nxp.com>
> Sent: Thursday, July 16, 2026 9:00 PM
> To: sashiko-reviews@lists.linux.dev
> Cc: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>; Frank.Li@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; media-ci@linuxtv.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev
> Subject: Re: [PATCH v12 3/3] media: nxp: Add i.MX95 CSI pixel formatter v=
4l2
> driver
>=20
> On Thu, Jul 16, 2026 at 07:20:52AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 5 potential is=
sue(s) to
> consider:
> > - [High] Missing NULL checks for the return value of
> `v4l2_subdev_state_get_format()` allow userspace to trigger a kernel pani=
c.
> > - [High] The driver caches a pointer to the remote subdevice when bound=
, but
> fails to implement an `.unbind` callback to clear it, leading to a Use-Af=
ter-Free.
> > - [Medium] Mixing `goto`-based error handling with scope-based cleanup
> (`__free` and `guard`) in the same function violates kernel cleanup guide=
lines.
> > - [Medium] `csi_formatter_subdev_set_fmt` partially modifies the subdev=
ice
> state but returns `-EINVAL` if the stream has no active route.
> > - [Medium] The `csi_formatter_read` wrapper ignores the return value of
> `regmap_read`, potentially leading to uninitialized stack variable usage.
> > --
> >
> > --- Patch [3]: [PATCH v12 3/3] media: nxp: Add i.MX95 CSI pixel
> > formatter v4l2 driver --- commit
> > 0cff6156940653a6a408d93ee678b339b7218ebb
> > Author: Guoniu Zhou <guoniu.zhou@nxp.com>
> > Subject: media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver
> >
> > The CSI pixel formatter is a module found on i.MX95 used to reformat
> > packet info, pixel and non-pixel data from CSI-2 host controller to
> > match Pixel Link(PL) definition. Add data formatting support.
> >
> > > diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c
> > > b/drivers/media/platform/nxp/imx95-csi-formatter.c
> > > new file mode 100644
> > > index 0000000000000..cea60327c9729
> > > --- /dev/null
> > > +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
> >
> > [ ... ]
> >
> > > +static int csi_formatter_subdev_enum_mbus_code(struct v4l2_subdev *s=
d,
> > > +					       struct v4l2_subdev_state *sd_state,
> > > +					       struct
> v4l2_subdev_mbus_code_enum *code) {
> > > +	if (code->pad =3D=3D CSI_FORMATTER_PAD_SOURCE) {
> > > +		struct v4l2_mbus_framefmt *fmt;
> > > +
> > > +		if (code->index > 0)
> > > +			return -EINVAL;
> > > +
> > > +		fmt =3D v4l2_subdev_state_get_format(sd_state, code->pad,
> > > +						   code->stream);
> > > +		code->code =3D fmt->code;
> >
> > [Severity: High]
> > Can this cause a NULL pointer dereference?
> >
> > The V4L2 core does not validate the stream ID provided by userspace in
> > VIDIOC_SUBDEV_ENUM_MBUS_CODE against the active routing table before
> > calling this function. If a user passes an invalid stream ID,
> > v4l2_subdev_state_get_format() returns NULL, which is then
> > unconditionally dereferenced here.
>=20
> Is it true?

No, it will not cause a NULL pointer dereference since V4L2 core's check_st=
ate validates first.
If NULL, it returns early and never calls the callback, so the callback won=
't encounter NULL.

>=20
> >
> > > +		return 0;
> > > +	}
> >
> > [ ... ]
> >
> > > +static int csi_formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> > > +					struct v4l2_subdev_state *sd_state,
> > > +					struct v4l2_subdev_format *sdformat) {
> > > +	struct csi_formatter_pix_format const *format;
> > > +	struct v4l2_mbus_framefmt *fmt;
> > > +
> > > +	if (sdformat->pad =3D=3D CSI_FORMATTER_PAD_SOURCE)
> > > +		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> > > +
> > > +	format =3D csi_formatter_find_format(sdformat->format.code);
> > > +	if (!format)
> > > +		format =3D &formats[0];
> > > +
> > > +	v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
> > > +			      &sdformat->format.height, 1, 0xffff, 0, 0);
> > > +
> > > +	fmt =3D v4l2_subdev_state_get_format(sd_state, sdformat->pad,
> > > +					   sdformat->stream);
> > > +	*fmt =3D sdformat->format;
> >
> > [Severity: High]
> > Does this also risk a NULL pointer dereference for the same reason?
> > Userspace can provide an invalid stream ID during VIDIOC_SUBDEV_S_FMT,
> > resulting in v4l2_subdev_state_get_format() returning NULL.
> >
> > > +
> > > +	/* Set default code if user set an invalid value */
> > > +	fmt->code =3D format->code;
> > > +	sdformat->format =3D *fmt;
> > > +
> > > +	/* Propagate the format from sink stream to source stream */
> > > +	fmt =3D v4l2_subdev_state_get_opposite_stream_format(sd_state,
> sdformat->pad,
> > > +							   sdformat->stream);
> > > +	if (!fmt)
> > > +		return -EINVAL;
> >
> > [Severity: Medium]
> > Does this leave the subdevice in an inconsistent state?
> >
> > If a user configures the format on a sink pad stream that does not
> > currently have an active route to a source pad,
> > v4l2_subdev_state_get_opposite_stream_format()
> > returns NULL. This causes the driver to return -EINVAL after the sink
> > format has already been updated in the state earlier in this function.
> > Setting a format on an unrouted stream is generally a valid V4L2 operat=
ion.
>=20
> look like make sense,
>=20
> Does v4l2_subdev_state_get_opposite_stream_format() call before fmt->code=
?

No, this does not leave the subdevice in an inconsistent state since in V4L=
2, setting
a format on an unrouted stream is a valid operation. The sink pad format ca=
n be
configured independently of routing. The state remains consistent - the sin=
k format
is updated as requested by userspace. The -EINVAL return when trying to pro=
pagate
to a non-existent opposite stream is correct behavior, as there's no active=
 route to
propagate to. This is expected and does not corrupt the state.

Best Regards
G.N Zhou


>=20
> >
> > > +
> > > +	*fmt =3D sdformat->format;
> > > +
> > > +	return 0;
> > > +}
> >
> > [ ... ]
> >
> > > +static inline void csi_formatter_read(struct csi_formatter *formatte=
r,
> > > +				      unsigned int reg, unsigned int *value) {
> > > +	u32 offset =3D formatter->reg_offset;
> > > +
> > > +	regmap_read(formatter->regs, reg + offset, value); }
> >
> > [Severity: Medium]
> > Can this write uninitialized stack memory to hardware registers?
> >
> > The wrapper csi_formatter_read() ignores the return value of regmap_rea=
d().
> > If the read fails, local stack variables remain uninitialized.
> >
> > For example, when called from csi_formatter_start_stream():
> >
> >     u32 val;
> >     ...
> >     csi_formatter_read(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), &val);
> >     val |=3D BIT(csi_formatter_get_index_by_dt(pix_fmt->data_type));
> >     csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);
> >
> > The driver performs bitwise operations on val and writes it back to
> > the CSI_VC_PIXEL_DATA_TYPE register. If regmap_read() failed, this
> > writes garbage data to the hardware.
>=20
> It should be fine. MMIO never return failure.
>=20
> >
> > [ ... ]
> >
> > > +static int csi_formatter_subdev_enable_streams(struct v4l2_subdev *s=
d,
> > > +					       struct v4l2_subdev_state *state,
> > > +					       u32 pad, u64 streams_mask) {
> > > +	struct csi_formatter *formatter =3D sd_to_formatter(sd);
> > > +	struct device *dev =3D formatter->dev;
> > > +	u64 sink_streams;
> > > +	int ret;
> > > +
> > > +	sink_streams =3D v4l2_subdev_state_xlate_streams(state,
> > > +
> CSI_FORMATTER_PAD_SOURCE,
> > > +
> CSI_FORMATTER_PAD_SINK,
> > > +						       &streams_mask);
> > > +	if (!sink_streams || !streams_mask)
> > > +		return -EINVAL;
> > > +
> > > +	guard(mutex)(&formatter->lock);
> > > +
> > > +	if (!formatter->enabled_streams) {
> > > +		ret =3D pm_runtime_resume_and_get(formatter->dev);
> > > +		if (ret < 0) {
> > > +			dev_err(dev, "Failed to resume runtime PM: %d\n", ret);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	ret =3D csi_formatter_start_stream(formatter, state, streams_mask);
> > > +	if (ret)
> > > +		goto err_runtime_put;
> > > +
> > > +	ret =3D v4l2_subdev_enable_streams(formatter->csi_sd,
> > > +					 formatter->remote_pad,
> > > +					 sink_streams);
> > > +	if (ret)
> > > +		goto err_stop_stream;
> > > +
> > > +	formatter->enabled_streams |=3D streams_mask;
> > > +
> > > +	return 0;
> > > +
> > > +err_stop_stream:
> > > +	csi_formatter_stop_stream(formatter, state, streams_mask);
> > > +err_runtime_put:
> > > +	if (!formatter->enabled_streams)
> > > +		pm_runtime_put(formatter->dev);
> > > +	return ret;
> > > +}
> >
> > [Severity: Medium]
> > Is it safe to mix guard() with goto labels in the same function?
> >
> > The kernel cleanup guidelines note that the expectation is that usage
> > of goto and cleanup helpers is never mixed in the same function to
> > avoid resource leaks or double-free bugs during future maintenance.
>=20
> This should be fine if goto to error path only
>=20
> Frank
>=20
> >
> > [ ... ]
> >
> > > +static const struct v4l2_async_notifier_operations formatter_notify_=
ops =3D {
> > > +	.bound =3D csi_formatter_notify_bound, };
> >
> > [Severity: High]
> > Could this result in a use-after-free?
> >
> > The driver saves the remote subdev pointer in
> > csi_formatter_notify_bound() via formatter->csi_sd =3D sd, but there is
> > no unbind callback in formatter_notify_ops to clear formatter->csi_sd.
> >
> > If the remote subdevice is unbound (e.g. the sensor module is
> > removed), the
> > V4L2 async framework tears down the link. Because the pointer isn't
> > cleared, subsequent calls to VIDIOC_SUBDEV_ENABLE_STREAMS on the
> > still-registered formatter video node will dereference the freed
> > formatter->csi_sd pointer in csi_formatter_subdev_enable_streams().
> >
> > [ ... ]
> >
> > > +static int csi_formatter_async_register(struct csi_formatter
> > > +*formatter) {
> > > +	struct device *dev =3D formatter->dev;
> > > +	struct v4l2_async_connection *asc;
> > > +	int ret;
> > > +
> > > +	struct fwnode_handle *ep __free(fwnode_handle) =3D
> > > +		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> > > +
> 	FWNODE_GRAPH_ENDPOINT_NEXT);
> > > +	if (!ep)
> > > +		return -ENOTCONN;
> > > +
> > > +	v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
> > > +
> > > +	asc =3D v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
> > > +					      struct v4l2_async_connection);
> > > +	if (IS_ERR(asc)) {
> > > +		ret =3D PTR_ERR(asc);
> > > +		goto err_cleanup_notifier;
> > > +	}
> > > +
> > > +	formatter->notifier.ops =3D &formatter_notify_ops;
> > > +
> > > +	ret =3D v4l2_async_nf_register(&formatter->notifier);
> > > +	if (ret)
> > > +		goto err_cleanup_notifier;
> > > +
> > > +	ret =3D v4l2_async_register_subdev(&formatter->sd);
> > > +	if (ret)
> > > +		goto err_unregister_notifier;
> > > +
> > > +	return 0;
> > > +
> > > +err_unregister_notifier:
> > > +	v4l2_async_nf_unregister(&formatter->notifier);
> > > +err_cleanup_notifier:
> > > +	v4l2_async_nf_cleanup(&formatter->notifier);
> > > +	return ret;
> > > +}
> >
> > [Severity: Medium]
> > Does mixing __free() scope declarations with goto error labels here
> > risk cleanup ordering issues?
> >
> > The kernel guidelines specify that functions should either convert all
> > resources that need a goto cleanup to scope-based cleanup, or convert
> > none of them.
> >
> > --
> > Sashiko AI review *
> > https://sashiko.dev/#/patchset/20260716-csi_formatter-v12-0-2601d17fc4
> > af@oss.nxp.com?part=3D3
