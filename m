Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033D137FF51;
	Fri, 15 May 2026 02:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778813713; cv=fail; b=SSqk0oXKxAgLYj49fsUCKPuwXmhk3xNIT8c0lSts6DrngH0eZSUb1zEhDeGeoASryaTQ9rMinsk91VPDd6H5cUoRIYyHyG734qxmQCLfZxqQ7F8T39/c0q6mVRxD7shoP2TPURMncr/51fFt6hqjAno/zsFuzZ6+m/FZw7M6cAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778813713; c=relaxed/simple;
	bh=PP4dl1GPvB6sM7/bwqWnCHew75aQykw2Zj10crOXSq0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LJlqU3Ltn2VK33Jy0E/X/sezO1kbj0fW0mA99wXrQlqULB5dGof8A+VJFmQ7i9VO0wUewyHqpNVpqQqeyG4kgEhZOgcce9LLTrMONWd33WiX/iqLGKcMqYgxYAMNik8zA7YbhTMroQfz8x5RE99HaKhmXeT8Txri9CMFE9+BdoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RBGKRp2H; arc=fail smtp.client-ip=52.101.84.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RBGKRp2H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAGjOtns+9zfmLf3MIR+w7l7iz7/LiQ9ggJ+qNKMCYV8w4sP7eJx+0oIlN2J88w+oyOPUHNF3vOzdUHI8LrckN6FXk134uQGFcgBpBRkA3I3gOthPz613QEl8Zc3YSwjGaNpL5gjxzJQ9xkAPrxTnBndIt5O09qh/jzX6viUWgtHANH29OKWVXTlVQgZWayViTfUv3RiIlr1xXjwchxNYMu/2c343da7hwaieRUg6T8KXbZHRpRJTTDO2eIUzGA5e+4tK6aK0w1TW1Hgtx7CKIguIBjR7d/pA9FPSMbQWnALtsOIkZod2uW7JE+GegR8IA2S8fTvkzsRWqs/SV9Wbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/U6xjOt1dPok4kvYeDsmTQTFoczGlnyEr4STSMh+ZA=;
 b=x1Kq0XuhK0uJ5D1tBAL0f8KnP7SzrvTfeGUvS2hvo0f/TG1JdqtY89ycrYoPObQt+6SvyweiNIPvmkSndcYoU5uNUxcC7hmy9EEGljOJSDjfmUj93GkpnYBPdhoEDHZLUY55MHzl3x1uWwgcCmuejJaVPIUVCwl3KTnbsSk+nnsxCoEc9oWM2Xo/V/ZNgksiFsTV+9eVc1483M9EJlDbfeLdYqLLZpFLs029co/zepS7WmndjFCrAq1dZXSRUIQ6P4kCabZbR2oco2f1OSVhPRpeNysQRlsz2MPvS/Z5D29C2PBLzPPhc8VY5CcmN1fFt/dWQJTEd3drt5N165JMgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/U6xjOt1dPok4kvYeDsmTQTFoczGlnyEr4STSMh+ZA=;
 b=RBGKRp2HXgKwcnW+DwBHpIPwaIpZd+r0mGKtexDWKr1HbBuMNhmW/8bUHlfC0uOrXzOM+5JeDZhj0glrNx8bHR7vEIEHtMeYb+d5ktZ5VSIX9aV99EAiRYMLrv/NT7xWGYtZfEkloOhwCNbJBwwbf9p3X3+KPIUvQTP6QEPMCg0WPJB2/LqXdK821T5DcCPXhzHhZYMTGMF8dlzI3CAOg1EUAdsrexQkogSh5Gcz1yt+gjp+axWeNKmlSbMpmyrywoFY+cL2UoocKczfGu8ZjF58T9YrYYz7H2bc26sXUgVqVwhX1sboePabRbDapwe6PyJ5UXHL/1WHim/9W81jVw==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by GV2PR04MB12139.eurprd04.prod.outlook.com (2603:10a6:150:2ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 02:55:07 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 02:55:07 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v7 net-next 09/15] net: dsa: add NETC switch tag support
Thread-Topic: [PATCH v7 net-next 09/15] net: dsa: add NETC switch tag support
Thread-Index: AQHc4oUVF3SVBvtUOEeHVNmeJ2a4bLYM/iYAgAFo+sA=
Date: Fri, 15 May 2026 02:55:07 +0000
Message-ID:
 <DBBPR04MB75009C358384D59E492BB04E88042@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260513030454.1666570-10-wei.fang@nxp.com>
 <20260514052203.57A35C2BCB7@smtp.kernel.org>
In-Reply-To: <20260514052203.57A35C2BCB7@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|GV2PR04MB12139:EE_
x-ms-office365-filtering-correlation-id: a56a0a35-f0e9-4cda-9745-08deb22d5f55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|22082099003|18002099003|56012099003|4143699003|38070700021|11063799003|3023799003;
x-microsoft-antispam-message-info:
 WqXtZwBKjXq1XN8JDGDMAAfbBsDtWWp+G6SwJKP4dOnEQ49l3weaSgQeUlHX537DIbJWg4+ZdtU/R/33I93UrH7QZki9clwmee+CRBqB9xw475t55Y9ekwgVosDA71/3wr7lWsBpMrIqAgtlLyU55LZ7kDPLnEQhlAclGAoolbQ+epCgKPvpMV7Be9LSQkxjWQh+6s3GoXy1vHGrexBpkXPfbbBVReGzMVtU8O1qBXqQqZdDyu7iS3e6necJmOBnmuciwNUvGNMHkro8nIQqrEimJziEjVAJ/gj/u4fEgpsVjvlhkrzu91WqSrdNgh9oDDK14CYg8ril3qlX/JkNDQuaEJN94XGaS0QsEcX4oJT+Bgs/5LW5D+Ix4aI5s1aJNPFmfQXlFk9LPQPg09l/cynp4CA7D+JQr4JEsBJ1Yj4zmDmO2kglcLFbdV7oaYa7aGJFiCRH1X6xTLmK8LNy/mErlTJWa3L8cQD9tWMzMBzAX6S6LPXXlDt50ITdPeN+MsVb/hpa/rj0JqxXABoIj7SJJyLRPTgVU9xPWRdYXjCoaC/gZ2Qj/f/ip5WpNVn79n2GDJrZnv9DixbMjY2zbst95BylCCZuKRYUS8bLodIw7yTveYFIbHlGXdnGXyCbNAWSajG/ygngiTayzEVNF6YELAsJtPOn3Ij8koSCxr+UAEnfXBdvLCP1MUohyEAvNv+BkYtAJxmugDDDCP7RiJDdO6WnjhfgerGxiKMaKVbtE9eTsx7I3nsKex/0hwNu
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(22082099003)(18002099003)(56012099003)(4143699003)(38070700021)(11063799003)(3023799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IbzinvugiphEyjFuToEREQlOA+bnggkQ0fBJfgCXYK7gsiI434eO4SYlWMlv?=
 =?us-ascii?Q?fUuDBjnOWoQTVBOEnUy6uWR6eDAAAoNaZiNszODlOgRmUtMHtmXT9C4epdNr?=
 =?us-ascii?Q?W3bvjB+jNemW/iluPKomUiCSla1vQNKIe7S/jOkVXCOdAWCChIyf2pUyFCNr?=
 =?us-ascii?Q?buGJO/LA+XRWYI04cJJSHm7i6BAFyG2ncDAejQjxZhRJNcd0Pnxo0kU4AUQ/?=
 =?us-ascii?Q?40GA4DScCZpZvlyOCzRzlSbdlQi7GzYhGycSShm4aynXgNPEOKMGgnDpKSrO?=
 =?us-ascii?Q?yKe06y1AafnPtJkeL42nQfVXdhbWNpAYBVtKbbg/Nuru7dcLkM5S1voyn5Oj?=
 =?us-ascii?Q?FOB3Y1D0AFwfMhP0MY8EBlI/SLLOR5HRFTvFpa4wQknMP61Ha/Hgoenpw1UN?=
 =?us-ascii?Q?olYf1gpwj+J+vFEgTd9UzBHXjKaQIzULPc3gVSjYJYi8KfVwACCs5nC8GAhS?=
 =?us-ascii?Q?BacWaXUftWBzQMw1Lukm0InjPxlyVsBTB36DYS9HADjOetDvX0WdNVTJ8FmO?=
 =?us-ascii?Q?BB4i3L+QmEf+/sW0jT0uEo11kKXtJbDEAaNgGr/x+AfJJ+PTk6tSsqiDCWKk?=
 =?us-ascii?Q?a29EVfb5SQIDipTCW2oHCQtuBv6+i0cclyzIt73DcH/V0hs5WdfEyw7VvS+i?=
 =?us-ascii?Q?zi7h9gs/Q2DYcsFNzKoY6N/g+q6wV+zpO4SXORXfrtX6xtHgI1I/VhkGFdjq?=
 =?us-ascii?Q?V3kDUi3axZWC9V4yr3DAL444dF7aC/MO0PeOgqnFEGANTPOjMfCS5WOj2TiZ?=
 =?us-ascii?Q?m3tW/iN3QBX74NsiRw1DUHcAKJRsaCSs486fSMmfrHR19Jd5BASPVk+sT8sX?=
 =?us-ascii?Q?NcCDDmkFFtuaMmHywbkdS+WdHDBAuH3HQ3pMI3jhq+2W4n+NMD7cPb2fB8s1?=
 =?us-ascii?Q?QgR2A31RTfSxdcbcX5Ai6cFZrcSj9falYRX2i3ZBxyaoptt8emhc9hOutbWI?=
 =?us-ascii?Q?vnJoQDneS63UMi+QC03UORJSL4j5MZGlMks39aGp5gg6X38bLhK1bwmyKraq?=
 =?us-ascii?Q?Vyo6G8InGqMH0/WxbWK8SQlxmM4MM99xNHOSpZe1NRnn9OziSMXOiOTT56Gf?=
 =?us-ascii?Q?Ljn4/51GC8rd1q/IAjcWPzO+hJoZn0dbXjpVlLRPwPaL0Mv4Gw8RSFzb48gQ?=
 =?us-ascii?Q?HlS6dXHMGaEWsLu5EV+r13XB/7SuicXBhTz8w+lc28jYRNGY43+EGYmJiShT?=
 =?us-ascii?Q?EFYtUyRKu+i+lS8KO9udjXF64kA20aRv7Uk94GTLdWsPTzqNiBPN4/OEgSlF?=
 =?us-ascii?Q?k+myUWjMSdv5odvGurmFLgfCfzHtKHvLbwfRqWU/Fb8rErcaWk3cZ/plZhmN?=
 =?us-ascii?Q?KzKLls5Sz/KLTj8eS5qz7h2rdWxoY4XUTS4xkxmkGG2yu8jj3/vdFEva2/gm?=
 =?us-ascii?Q?ktpYuCmDpDJlKb3PEyXx5TeMwyzly9l+zru4E6h+wF3xDE2i9lnVYB5YnMyR?=
 =?us-ascii?Q?NDV6rkmNrP1SCsozAuZWHbcw3oD7odFLX0ezpO8RqnZnD1elvbG+MrYqJs/3?=
 =?us-ascii?Q?TcMP/CibfCJ/WjM6H5kFDDiFSNh0F0nlUBm5ZVpEnnKo67skqhEWwqvmWC/1?=
 =?us-ascii?Q?O4Xj6jzbLAu4oTqkieuINFBdEE6YuGmz/r9wX/+aFOeY7vrH3ze4KJlDL/yh?=
 =?us-ascii?Q?cYDOIsLiqspkVHGqnqtiDeoVkmLh1ilP/nlrem++G9X2kuGQ/N04KO8PuNPS?=
 =?us-ascii?Q?KGKHI0Ksa90hL79zh9ip/E9+YhSbz2Mzk87pTp4zLuoN3Vce?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a56a0a35-f0e9-4cda-9745-08deb22d5f55
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 02:55:07.5404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZhCHyZi7ZfCuWgo+D4Dzjt+7uA0l4O2/PwBZ7dRC5xkTBT6ihYa/7PbZ24gHLMH0lbtV7a/pB4xbb+KEQEQzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12139

> > +static void netc_flow_dissect(const struct sk_buff *skb, __be16 *proto=
,
> > +			      int *offset)
> > +{
> > +	struct netc_tag_cmn *tag_cmn =3D (struct netc_tag_cmn *)(skb->data - =
2);
> > +	int subtype =3D FIELD_GET(NETC_TAG_SUBTYPE, tag_cmn->type);
>=20
> Is it safe to access skb->data directly here without validating the linea=
r
> length of the skb?
>=20
> While the comment below notes that hardware-received frames will have
> sufficient linear data, skb_flow_dissect() can also be invoked on locally
> injected packets (for example, via AF_PACKET sockets, bpf_prog_test_run,
> or tc hooks). For these locally generated packets, skb_headlen(skb) might
> be extremely small or even zero.
>=20
> Could this lead to an out-of-bounds read and kernel panic if the skb is
> fragmented? Would it be better to use skb_header_pointer() or validate th=
at
> skb_headlen(skb) is large enough before dereferencing?

ETH_P_XDSA is only set on the RX path by eth_type_trans(). All locally inje=
cted
packets travel on the TX path, and skb->protocol retains its original value=
 instead
of ETH_P_XDSA. Therefore, the DSA guard condition proto =3D=3D htons(ETH_P_=
XDSA)
in __skb_flow_dissect() is not true, and .flow_dissect() will not be called=
.

