Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994AE3AEF57;
	Tue, 18 Aug 2026 08:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042736; cv=fail; b=Rb8OL9UPXuxa9nBLg4mSYSlQA13altVWEss7BH3guzIJxKv5P6rTM8rCtW7cWFsDUpwy6ZKP99f6VproGAaSFaRwsKf9m6OG79tJym2XLeq8yEZan9CVfcm4hdCirh1bQZlc+gTV0xGi697nKlYcSRpiGD5vz9+tGaZYJabKCew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042736; c=relaxed/simple;
	bh=ppty9dG+MTMURI0DnVs7Y6uOpGSdTl01zzNul7/7wuc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CTEs76gFsd0Ztqu5pLDN2gveazeEWknuRH00Ptw1rqn63q3Q/OnHfk9BwkU4UZoSSa+q+EDUGQ16OCCORwlAYLDCLCvknT6Q7e9/HL4MjTyLzpa0Q+12/767G0bhbzRcPUhpJqKVrnBFry8y0KqFQsR3auLzHSGX30hNXsxeVL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=n7V8dCdi; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="n7V8dCdi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1UdoRoP9D8nq/sjPN/KmhyvKu0WRO4lr6XOd2QROKII1IQ1bbnPxZ53nAlqcCZftrR0U/8221ldj3GdG6bNP6t2mX5Ivm/9YB3KK2kVEdF1UM5jzkxUBlHYuwiIiIMF3Yb9bGcLB53/xO8ZCpI/8BlxPX+kC23I60WsdYcwU2m3iGLUNUYsSEHZcAV3L4r/0u+Mc18k0JIxYbqGxEBR+z7qb42Wk6mQFQdYO3x+5o0GeSmwJzh0VJdFPbAo9m4xHl3IGWgYFu2rixgnjwxSqpSwwURLjNKVXPCZukiuItjX0dv5qtbeTHYYLodczLXfUsTCwgCrqGVUtgSTWkvL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGp0vC5WzVwCTOZ2plzVyiTDQVmlBAERoL/kYCkrAkc=;
 b=Mz9tiBu5KYgFeKabXlC31h/4J5tiq4zUIAchtyrFyYkw0Q78dPNv4XhQb58VqewAgPu3Owkr+FtNEM0timEKNqyDm6AnUH8001PYOAPTDDzjOoxnkHpZndixfkZrP4+84fbB6xkCOUm6gA18CJaO1SKa7CrGyjmlSeHItHg9+SA+kD0iI0J3VeesxTfsgDo9H753+7Nqsp3WpgTbfoCPqluK1sT+IvZ7OHeP3kO+3jGBPugfARNlbFyQy1Wt1s/+z/I2zXpvjT1BIo8FfEYTAZd1VBs92DlwWJbJ08LidI58enHf/Y5vpX9Uuwx4yp3FP3qV8aH80zi2VuDJFMDf3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGp0vC5WzVwCTOZ2plzVyiTDQVmlBAERoL/kYCkrAkc=;
 b=n7V8dCdig8XEmGjwOBtC2IKB6a1/6BOOLsMWgHDfrFkgpPH7kqGpDayITxMNwMZHQsRweG0qaqoMJcQfDHIyzB4j7AKdxchk7G7T34eLM8EADM0hDp5VPH8n4NFXtH6Adp/fukQ8g8ZKBdner9KD7LsDBHJbdAKvWHRb40G0razxKsjeVCYk8EkR0KMXcsbVooeCdXI6hto5LvD4RKvovPAqdchEQbGkhzBPvMcoL7qbV7bw5kfLR+Az/TQWSXHkWSt9aq7UCG09/zC6zpA7QOL+74OtvLHrgv4JoBUcqBlCFTCVPKFxDQ7QPUVB1MrymPK+gdxkL9A1VrkkUpv9MA==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by DBBPR04MB7562.eurprd04.prod.outlook.com (2603:10a6:10:1f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 08:45:27 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 08:45:27 +0000
From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>
Subject: RE: [PATCH v36 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Topic: [PATCH v36 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Index: AQHdLu3qjbFmlKSDBkGczVC1tbloFg==
Date: Tue, 18 Aug 2026 08:45:26 +0000
Message-ID:
 <GV2PR04MB12271D7E7AAD64AE668A673CC95A62@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
 <20260817-imx-se-if-v36-3-45c42847bfd8@oss.nxp.com>
 <20260817084817.DB1BE1F000E9@smtp.kernel.org> <aoNVs-TtpfQmR0Au@SMW015318>
In-Reply-To: <aoNVs-TtpfQmR0Au@SMW015318>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-18T08:40:51.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|DBBPR04MB7562:EE_
x-ms-office365-filtering-correlation-id: 8539d0b7-ea21-431d-3631-08defd050d25
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|23010399003|366016|376014|5023799004|11063799006|10067099003|4143699003|56012099006|38070700021|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 6YdGW363clDZX5RpUHB5JxX3kmL/I29rsLn2p0t41TqoXEYPYb4dbgTnlDd8KJRFJRPRYV23Y6Sc94ZtrLTQKc13pTV+M9DWNNmlQXTPyDijAKzT0t0RrTpcq0C0E9rcoaiE8xxT3UslcfMm5TEKZF465APcu33VfMGlKshSLQVk9E8qGmHr4HP/Xan43QljkN4RwH5EOk6lzR0oqV+16sHsmoLvVsYzemq3N8x/qJfyplYofabT+3pAxCH3psc4qhh341xYUUfwmknPg9EXydcpg9jrqrF9QWlctDE7CU7XGp2nxmvPyTQpXGR8F+9uBtN+X3hJKFjKKrnr+z2mbukzYrhi/gS3sKHVPETdBz/wmxtXg2tbKvuYGmXWp1BBi9epjgP0BDBaiMFPD0s2rkfTTqr3/OvLwGo+nqcs4kXyXtJdD+49PVURA3zFa3wSIUDrjrkhIqPsZk+eTZ+Oc7tKxAD295cb+AIHXXlc3mWJgSj4J31yAcYsJs7rnj1uUBDzIgKWBuZQbMlSKbvIC/ujPQ47Dfdbb+yqWP/ZRldPrgP5otz9452PUrUQfyftMMZ6V5A8Y22cbWCExa4TIxLYO5dUT909H+hoVuQ+0sSpYhSljpkaxkcEUeZf3PRekOeigPic0n6sG/KQpVvlTScmfcWun8Hr0EeuNboETwY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(366016)(376014)(5023799004)(11063799006)(10067099003)(4143699003)(56012099006)(38070700021)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ge7SR6OWrqHBYI6nOVbxo2Jyscbdf4+3UMySf2JPzEGnbYjNK+ST+EZAXYTj?=
 =?us-ascii?Q?XNZDrwv9MKEMLjrrT1VUACwPCGdOEn4eeiiUfi3ls1m843/tBAfbTJoP2+it?=
 =?us-ascii?Q?GK4qcE6dxST5Z/6YMc5Qv+0jc17qdIVRW7GV/xOL37R6EH4SA3Q1nLNL+LHn?=
 =?us-ascii?Q?VcvB+eK4B0e7tRYcS1G52AXSbP4FqvGf92/LYdvvB1EsP7/ZSKVjb3Kcd4St?=
 =?us-ascii?Q?neLxIn1A9gittkBF78dgMk0S2fRKAajz0D5ceNhGfSDCf+a8tIdXkaosNF/r?=
 =?us-ascii?Q?cQmuhw8j5TpgyxqESp6WGVmlTFmEUoW0M0wy8De0GyOYARtwx45OkALyj265?=
 =?us-ascii?Q?0CbQm8FH9Vu0nQ4o/mt0HcQV0phEjFlbYfjUjQ/+ULmfLPMR6sVC01LMedAF?=
 =?us-ascii?Q?VmBdSQUEJc+BtkTQ1YY0+2QPZj/OhQEu2kiuveOxcO7dKw0K48ztxgAvH53x?=
 =?us-ascii?Q?mHa4S6V+VfJCDHmVotUDdwoXrytYRwCDoInRwk4aaSi6/zlMZPZjxYHPI+Bg?=
 =?us-ascii?Q?260j4ovlMiQkg3Dh7NZOT4aKj9ZRQ9JUHp5t0P2ia+jrxW+bd5AFenrtNHEB?=
 =?us-ascii?Q?XsoOTlaCWyLeiRob7MtOsHsLAA5n+P2DIf9TpCm74n8iMwaRkD3aQ9Ngq96N?=
 =?us-ascii?Q?NrVxrwtrLbnvtxQKlGEsA7aM9P0P/BYjzjTKfdD3XaM+zQOw8GkOgvqiyAQU?=
 =?us-ascii?Q?szXyubTZLsDLPQqdWkiF+XkQZLY5534mqnhiRPpxOYAB0ZvY4J3ZNfMMF7lX?=
 =?us-ascii?Q?GsiVtpWm5kyrjq5mwQWTib4Mup9XWLdff0SQzODA9xM6Hd3KME8WAnruQI7A?=
 =?us-ascii?Q?U4brzaIzAPLumGVVKHyv/boo90cYUbHX/ttVKqtTUMXhBLAg6BHkRVp2ODTQ?=
 =?us-ascii?Q?Ah2yWtA0wZZW0CKloToOBMDVBEsBtcwV+dcvgtKFrerdLGOp4qkNYLtKOIvP?=
 =?us-ascii?Q?PoYWAO04WJgYijEg55I92lj1F/ZtBePBmaOIpp8A8aangafivECN4BQZMuwW?=
 =?us-ascii?Q?TSfD610PWm21QhW++j4ODcGPN+PoRaA3q1kgWXoFbw5tXFoJIaeDHwHi24r/?=
 =?us-ascii?Q?CDtTpv7ncDxUycipUx5ljI7UXU6Ff6GEnuu8ciY3HaMlLCo98WIFoCpxRRYh?=
 =?us-ascii?Q?jW9U7c8bp92WlR5ljct8G9BDFfADj3VodbP1+cGPgR/P+ON895U74LV43Ywl?=
 =?us-ascii?Q?pvVWzyEvZhxjQO6DwK9c9UQXxYzjzM4YvTy3mg3JuOz0AyBw6nAmEi3i4eQg?=
 =?us-ascii?Q?894+/JRUsQQxzb/LfoIRwR2gKyUwtU7182NsgFtIsF+kihSvQ25lalnUePb9?=
 =?us-ascii?Q?46i4ofjAE/M3Qipn8AIhGa7qoyJjFy24QT+POBuVzO+BrcCOnQqcSwF6q+xu?=
 =?us-ascii?Q?Qr3dBRlBDKN+WkF88vnq/ZReo1L65neOrqTmcU4V3m5fe7VelRbvBU2jj5bU?=
 =?us-ascii?Q?VCRpKkY6HAWiQE8SipeIHKzcCJnmygP2Pm2fMGe905ML/1FgGQYH0E0x03iJ?=
 =?us-ascii?Q?jbqmTFPj6VcPN+eYt7GAWUMBXNPsfskNq394G/9uFvrUdduvVsFSa1EjbvC7?=
 =?us-ascii?Q?xBZUYXuI5ePUfw8w6RT3DQojjUDvuNXp5rYbRhdYzfsu0MSErFL6hitie1xG?=
 =?us-ascii?Q?MlQGb8KqfQuxeuoqV9evwazFfCjxhbQFWr+FJn+WRu75zUZrzc9CxRXEw6xt?=
 =?us-ascii?Q?vcO7uEfJOT5hxb2ADZ16RBF15o0f5vV3p0h7x+HqB6b4YZjnVv/Wu1Hq7KRi?=
 =?us-ascii?Q?clKRjPQaRg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8539d0b7-ea21-431d-3631-08defd050d25
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 08:45:26.9939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dcFg4xF++rBlRlsXc9nnuqZrQMTMYgfxORJDxfhTtvGH7BOO1uo9ztM60n2I371VQnG4jBdeMZRFhn3IpN76Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7562

> > > +void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg) {
> > [ ... ]
> > > + } else if (header->tag =3D=3D priv->if_defs->rsp_tag) {
> > [ ... ]
> > > +         se_clbk_hdl->rx_msg_sz =3D min(rx_msg_sz, exp_rx_msg_sz);
> > > +         memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
> >
> > [Severity: High]
> > If the mailbox controller driver passes a pointer to a small local
> > buffer on the IRQ stack for msg, but the untrusted firmware-provided
> > header->size specifies a large size, does this memcpy() read
> > out-of-bounds past the msg pointer capacity?
>
> Please check this also
>
> Frank
>

Not an issue.
rx_msg_sz is derived from the firmware-provided header->size field.
It is safe to use as the source length for the memcpy() calls below
because the MU mailbox driver (imx-mailbox.c) already validates that
header->size does not exceed the capacity of its own fixed-size
priv->msg buffer (sizeof(imx_sc_rpc_msg_max) =3D 124 bytes for
i.MX8/i.MX93, sizeof(imx_s4_rpc_msg_max) =3D 1020 bytes for S4
variants).  If firmware reports an oversized length the mailbox driver
returns -EINVAL and never invokes this callback, so rx_msg_sz here is
always <=3D the capacity of the msg pointer.  The min() / min_t() calls
below additionally clamp the copy to the destination buffer size.

>
> > --
> > Sashiko AI review *
> > https://sashiko.dev/#/patchset/20260817-imx-se-if-v36-0-
> 45c42847bfd8@o
> > ss.nxp.com?part=3D3

NXP Confidential
