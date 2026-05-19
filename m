Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013052.outbound.protection.outlook.com [52.101.72.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91092FE05B;
	Tue, 19 May 2026 05:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169743; cv=fail; b=UyGvPRKi0o6fvSbd16cegXskHcCNuWU6VEB2veGBn+JeT9zFHwzFOrZRSE3kWD16NPotIVppnz9XzqQaPlnwWjCG5HQvTfrIKJS2Ckg4nDac9tIcsU5hm6Q4lGB+wozcJM8d2gsXMI/9yctXOiH46fk8aIRRjy7mdPjljWd8Y9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169743; c=relaxed/simple;
	bh=iamI8KsGdeAp6r+W0o/aaFXDhtC+/5GG2tsm7JA6OLU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VFEOgU+RQNjMrtJ9UTHHQB5jpI7BD/kwoKpDikFkkt2oMJBWOQONkrnVQMO+TQiAsT2h9sa2crj9NYR35j4vxiF2/AmSg4uVCUXbMrIPzFTC3X6RHAMK1pRq0+z1dz5zXgEOItLvGXp/rcAN+OCGxOL3AjbGqHLpah8J+weyUuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lzUAcDNy; arc=fail smtp.client-ip=52.101.72.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lzUAcDNy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MS4dYnfjpKUuFykLS4U/XhmAvH5ErX7HOBRpGX7y6GSFYr30MBxNkkFm1TpG7GI5hrBVSp92QvEhPoUIUR+cGo+sEC1+P+FbYkXfhc8NBd7Xw5Xh4inEhnQgq6vvXCGNNLjIwi/wFX1nne3n/oFdnGtZTQJHWjsMUYO1NV60KeLIB+MvAkq0ilVwOxArLRM7HIMgsedWkJvm7WCePBD3S472maZnewnFKu+aNeH2X6y8+YPE3uBUU/OGXXsSRzYMFlbCzdskJjxusNk7dUzjUKQOfQFn5lzh68z01hwCPU0WPrlsR5niC2+oajO5Y7WMaxLRZzDSA7dsYnZkoUJrmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RntkQROpNrz1kxQMwWY0FbNr9NIlRBkZsXbZUPHklDE=;
 b=y5zxlTg18lEw56ISx56t8W9j9iU7btIFR/IWTGBqm1e+z9Hopdsnpa4dwowAsn5WVtTun/qwvMrMmmDIMrIHXHmbMYkVgmF6UuSY85ksdG2zJb9eJj6UZuuWJ23f04jpfa29AG6/M98chw+9FFAGLPqLAryjAC3k6XzriJbM9OsfAsmead6BpqlxNBoWVAKYReOyU0IM0vIxkzW4yKNVe1D+esJANBIm0AOTZtdLgKTOPZjlhErV1Vz8g3WhvGw4bVyLEwdRPd7P/u54UW3+sJ4K4eO4X4b6HmDTWAq/d2FEzrK/yebv6mUG0rsJZeJZ3IT3Acl9Myg0BKoTfbHqDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RntkQROpNrz1kxQMwWY0FbNr9NIlRBkZsXbZUPHklDE=;
 b=lzUAcDNyJy6wOkGNJUFrO+4QMwGOs8683XB6dxtvlQLBvaaFRzLeCO3dN+mQNegHNO9/ESADDTVvHOPR7hoCv/XTLXIZ99Ft9ybCB82Zxe/dfYc8WcBv9v1q11hVQDH+tVdLSQRxbV8f5iI5w3BijvbEQsTK185HLPFzolahjSBmb6AND1ttljSgeE8AeAfVAjYMQ79pEBgRIZPx1Ihc8SNdSNAJZQXVp210bKzruzTtKGXZrP6by7xd9aPg+lxe3u380eVutTY1BBRmQBaUqKH6JUpoopbIeywpvnXVrf7R4hsS0YP5Jph2sMf+FOjS7uY0+UF2ZP5zGsEmVWQ/ig==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by VI1PR04MB10002.eurprd04.prod.outlook.com (2603:10a6:800:1d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 05:48:57 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 05:48:57 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH v2 net 7/9] net: enetc: fix VF-to-PF message handler
 unbounded loop DoS
Thread-Topic: [PATCH v2 net 7/9] net: enetc: fix VF-to-PF message handler
 unbounded loop DoS
Thread-Index: AQHc5nLmRwL2mJt4AU+O1iSToa2OSbYUq3OAgAAIH5A=
Date: Tue, 19 May 2026 05:48:56 +0000
Message-ID:
 <DBBPR04MB750088F9BBED2516DEAE767788002@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260518030535.1057228-8-wei.fang@nxp.com>
 <20260519030415.A7F22C2BCB7@smtp.kernel.org>
In-Reply-To: <20260519030415.A7F22C2BCB7@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|VI1PR04MB10002:EE_
x-ms-office365-filtering-correlation-id: 2c7eef65-2ef0-47f2-4e98-08deb56a5166
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|38070700021|22082099003|56012099003|18002099003|4143699003|11063799003;
x-microsoft-antispam-message-info:
 5eL7344Vcidh7FgokauHwXjFpasX8NP+miLzxD+IQZt0XIpkzhPwV9tU6WVeZYe3g5c24I1stNa3htXEdDPZuiGWVd7JsKX7CtFALwCGR/XhAIzeEKV9qgKTZ6hsUIn42utMBSaek1BqyM+mrpOUAyhAXKfDjR54TtNffbRiXRPIWQIIm7y64VoAH2LeITKVdnPM75YeIiK/WVTAisG+ZlrRma77la9c5cl3itW/ULSrQEJrkB3eNqgRvm2jTFF6Jgji17VROXIljCub9YHaCgxY2vj4qUyw2Zq0lOjzjvJ+SGo5uErw+JyCpEmWw15Cv1Flk7VeSSaBcZ7IWJkwOPWuV41NeYVGhc6TA6YXgtRscNPsYlOP7aGI7t2/GUOSyofrPfQcVSyX17g3YIov3UuOCal1weydZLid6G3VKrnrMdJezpTxmSzzDaaEr6aktmrLVTdGsjE4MV+IZDHbKqTFljTgnj3g75wanO7XRSAEGeoA0LJ3jp+MkO788BzCMsMg7LGRD6X8b3B1/A4oGi25UCHHHUJL8d1GaLh7PCnZNYCfzhYueEdx+wFgIjTFsX/cebB/QOJXfjRtnbi1Hzl5zNl1KJsE+171+gzyl4d3bR39L8LkGcr41l6YO2cAMfmbc9vaeKjF0MIXAGWC1jIgr9gvwZQ5ItOAQPTRDZg5wctUa4PkkOI9A9kyVdud/9mCeE2QuoeY0x73YL6cG8WrfGVCnvYIxp0u8f5cskBGlpKR0y/4FS5QOCarfL8l
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(38070700021)(22082099003)(56012099003)(18002099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bH7y9m5PAEX4v9C1FTaeNKzUZsLVjHm17s+AWajKeHTc0NocQ/ma6a8HWcC8?=
 =?us-ascii?Q?h3rps6AmrLkC2dh07HRBsIYM+UlM52mSpJ6MZHhy1nJoyeGGzPQdq2akQDbi?=
 =?us-ascii?Q?PV4ydF3ZuSUGszcLe1m/sdK3PzYiJKLXLDUoRDkfZsQ4qQTsCGBdxicSqQnF?=
 =?us-ascii?Q?I3D8uBtmkCcR21VRdiI7cLaVF4m8KdD1JeJ1y/7jzA8zWN6UypdoOtQ5GiS1?=
 =?us-ascii?Q?Y2dFKKImPlcGPzvO5nAW3mERRVDsgIqhdnwVMp8nvy3dp7WPgv0T8is/R+58?=
 =?us-ascii?Q?h36XWHBSGaIGjpyAnl9yKukVvjJSwH0V2SdDz4RfA1S8OxySZZkqS/8fLQwA?=
 =?us-ascii?Q?EzKaKpSJ+UOlLpAiD2iM7bxdwPu4h9qGLW4I4oamehlsNXNIeoRhGHodzkaU?=
 =?us-ascii?Q?3vsUepXLYVKdJKZh2DRbpVs00oUEI18qXHlJel2Uu6l7lGqcX7+YxoWRaBen?=
 =?us-ascii?Q?jgNIYN7vWbAfwsBBxiGSrwiz0YMBmDUZLQEF4QtuDjyma3881QaaLQ0QTQ2U?=
 =?us-ascii?Q?hzxe6s4J/CyNxSKwFSTgxrQrEs/nA2M/ntqm6jLPR0vv8jZ9YxT8XR8t+JVB?=
 =?us-ascii?Q?cU2Gf5jcdtBk/d5DfmzCxwEcizPUHfZ5qERYPs/wwxyPqM8Im501AjygRJlR?=
 =?us-ascii?Q?ztGgEpvtqGAFMiyROIzo1I47YKGh0+fMolzqx49RVUmTaNrTUW63FO9FiNBR?=
 =?us-ascii?Q?dwtIY08v3qvSd/IyAYelac2Vskossha1uJGQmCqNIGXY8N/uYYCWbW5nVUjL?=
 =?us-ascii?Q?VUlxXn0+u43Kx4EunG3so38Zt8jlbEeOXiW2Zj1ck43jthpJ55x3nh1iKVUW?=
 =?us-ascii?Q?zeyorlPeWSw59SPLPg24R13Libif052F1r+kLmcaI5fS5sGGGcbl6mlr6IdD?=
 =?us-ascii?Q?48tktjkN1mUcSnuDXX9nCNE9bZ+qkubNW4jfx011UwD415SZsxP59tAaQO/H?=
 =?us-ascii?Q?FTosUMEJ6EuM1zyQkmdlMr39SZKyLtdHdX7i7pzH+IGvDoBTKzL1S3ADp5dr?=
 =?us-ascii?Q?BUUVs/Z0FpNr0h7vZpbvxClPjqXYinClBJvEOe+c35RJU6YE7cGpuMUrwh6M?=
 =?us-ascii?Q?JLjOvtfAFYwk4XImkwO/pQc4C6ywiyvWXBEqWJjQR9wJOjA8FvM8AZoda+wb?=
 =?us-ascii?Q?zyGP+C9DUqoXOEbe+y4PQT2DcBtOE9vqfcxxoKShZKhNWYV7hgt8bGROo9Pm?=
 =?us-ascii?Q?TIe8HEochH7LFAfTvLcPMXIdNmQz77nZw6F1eVo3nkFy1MiACb0TmKT9vUyt?=
 =?us-ascii?Q?yjzjmkkfRtoO1awGgjRPodahvw0bNfE4xE8DFIa5HQ6rFg+rEGFDBVKp3qN6?=
 =?us-ascii?Q?Vkcv9FoT1Lczsup4gucGVkABsal/v7Y38GZ0PqhH+Ud8g40ulxTFt9z+atUR?=
 =?us-ascii?Q?WqisIyFyIsr9UzwZaQOuLDMk1calDDXirAnqzOMjkd6N8prYvxK9Q99TxmKK?=
 =?us-ascii?Q?Y1rATvOw2E4Oqqzvx08N4R8MJBcUQiKQMJbPxAVMMpdZyxa1htnMw8udbTvY?=
 =?us-ascii?Q?oViiLkbKP3WVlGdWxJHiziXAkv2DOf34YGp+50Shbpbk9UGaLDJjtFAjTL6X?=
 =?us-ascii?Q?6sMVmoLPHWMu7E/x/dVukqaEBGp03fP9jztELei2LDyVHRR+yDrMXsyukXDt?=
 =?us-ascii?Q?KDcHA2Pt50BphbwMWn76LObDYjEuryCnK3Y7gpoUk92aI7CqaumBYSQ4cV6F?=
 =?us-ascii?Q?2a3+DUQVEqLWpHCzGGJF8rV732Y3f+90ZjVNhhVEb8mUHTMi?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7eef65-2ef0-47f2-4e98-08deb56a5166
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 05:48:56.9885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hm70SQKOyVFwGLM7OnPzCfM+7tPfAIU8251TVHBmWAe0aftWXIzdE9jWBqld64eR2ZTI9ejN7Rr/GvnR/DiCpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10002

> > diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> > index b4d7457097e60..39f057fe85c70 100644
> > --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> > +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> > @@ -32,32 +32,32 @@ static void enetc_msg_task(struct work_struct
> *work)
> >  {
> >  	struct enetc_pf *pf =3D container_of(work, struct enetc_pf, msg_task)=
;
> >  	struct enetc_hw *hw =3D &pf->si->hw;
> > -	unsigned long mr_mask;
> > +	u32 mr_status;
> >  	int i;
> >
> > -	for (;;) {
> > -		mr_mask =3D enetc_rd(hw, ENETC_PSIMSGRR) &
> ENETC_PSIMSGRR_MR_MASK;
> > -		if (!mr_mask) {
> > -			/* re-arm MR interrupts, w1c the IDR reg */
> > -			enetc_wr(hw, ENETC_PSIIDR, ENETC_PSIIER_MR_MASK);
> > -			enetc_msg_enable_mr_int(hw);
> > -			return;
> > -		}
> > +	mr_status =3D enetc_rd(hw, ENETC_PSIMSGRR) &
> ENETC_PSIMSGRR_MR_MASK;
> > +	if (!mr_status)
> > +		goto out;
>=20
> Could this cause a regression if SR-IOV is disabled while a VF has pendin=
g
> messages, and then re-enabled with fewer VFs (a smaller pf->num_vfs)?
> Wouldn't the leftover message bits in ENETC_PSIMSGRR and ENETC_PSIIDR for
> the
> now-inactive VFs remain set?

The VF is disabled when SR-IOV, I do not think there will have pending
messages. And even so, it have no impact, because it will not trigger CPU
interrupt if the VF is not enabled (as the corresponding VF MR interrupt
is not enabled).

>=20
> Since the loop below only processes up to pf->num_vfs, it looks like thos=
e
> leftover bits would never be cleared. Could this cause mr_status to remai=
n
> non-zero but unhandled, leading to an immediate interrupt storm when
> interrupts are re-enabled?

There is not interrupt storm, the corresponding interrupt in ENETC_PSIIER
is not enabled, so it will not trigger any CPU interrupts.

>=20
> >
> > -		for (i =3D 0; i < pf->num_vfs; i++) {
> > -			u32 psimsgrr;
> > -			u16 msg_code;
> > +	for (i =3D 0; i < pf->num_vfs; i++) {
> > +		u32 psimsgrr;
> > +		u16 msg_code;
> > +
> > +		if (!(ENETC_PSIMSGRR_MR(i) & mr_status))
> > +			continue;
> >
> > -			if (!(ENETC_PSIMSGRR_MR(i) & mr_mask))
> > -				continue;
> > +		enetc_msg_handle_rxmsg(pf, i, &msg_code);
> >
> > -			enetc_msg_handle_rxmsg(pf, i, &msg_code);
> > +		/* w1c to clear the corresponding VF MR bit */
> > +		enetc_wr(hw, ENETC_PSIIDR, ENETC_PSIIDR_MR(i));
> >
> > -			psimsgrr =3D ENETC_SIMSGSR_SET_MC(msg_code);
> > -			psimsgrr |=3D ENETC_PSIMSGRR_MR(i); /* w1c */
> > -			enetc_wr(hw, ENETC_PSIMSGRR, psimsgrr);
>=20
> Could writing to ENETC_PSIIDR before ENETC_PSIMSGRR introduce a
> regression
> involving a race condition with new incoming messages?

No, ENETC_PSIMSGRR[MRn] and ENETC_PSIIDR[MRn] bits have the same
function, both indicate that the PF receives a message from VSI n. But the
high 16-bit of ENETC_PSIMSGRR is message code field, this field provides
the result of the message back to the VSI which it originated.

Therefore, the normal order should be to write ENETC_PSIIDR first and then
ENETC_PSIMSGRR, because writing ENETC_PSIMSGRR will return message
code to VSI, indicating that message processing is complete and VSI can saf=
ely
send the next message.

>=20
> If a guest VM sends a new message in the narrow window between these two
> register writes, the hardware would set the MR bit in both registers agai=
n.
> The subsequent write to ENETC_PSIMSGRR would then clear the newly set
> message bit, but the bit in ENETC_PSIIDR would remain asserted.
>=20
> When the task re-enables interrupts at the "out" label, wouldn't the
> uncleared ENETC_PSIIDR bit immediately trigger a hardware interrupt?
>=20
> Then on the next invocation, mr_status would be read as 0, and the task
> would jump to "out" without clearing ENETC_PSIIDR. This would re-enable
> interrupts and potentially cause an interrupt storm. The original code
> appeared to handle this by unconditionally clearing ENETC_PSIIDR when
> mr_status was 0.
>=20

