Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E22390CBF;
	Sat,  6 Jun 2026 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748501; cv=fail; b=Pu4WDjJ+X1+QpsBdoGC4pFQi8eF1d6P1jZGxQ9qDGV6kpCoMHHiGfg5265dLMNajd4jyNtRva9UaOyyW3KOJ4e3AezsO6lEIspYz/6ov3+TKIKlV3nu+wIeCZjNa5MCrqHBNKQj5/JyJ+yzegT7ByvP8tAGCzirSkiBlhSaBFjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748501; c=relaxed/simple;
	bh=o9mhXAi3LMwQDwXXOIli4wdBuNea+z1oh/BDpBMhZFI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G0nVcHOl3//sskzo+vwz2c6bzwBLup4I2NQPCDK7W4kM8gAHtrPcJwG7zkcWAtPvGHryP6YdJkSCz/c5JOnUHR8LFFK7hUF3UXlZuc0rkxv6VX09RxBRTHTftyVD5RW0LN6Z6YjgTor96ACGWmrFUTIAluj6swtvi8sfedpp4TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NsxcWbQu; arc=fail smtp.client-ip=52.101.69.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NsxcWbQu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ae4K2q9esjyQMgQqNpn+1OIxJGTNfq2Bj6Wp2hYyrT4BHLb161Va62t8qO3mTgsAR69Ezkpd50BFkDxLH3dgyYf51/ZZBwERvYfdrOfhIhWRv9IV8QLTfLg8JTdu72P0oc0lOracWK6lqreiat2U76J5Zbza5kGboP2uFH1bUDIQwgLQCxabrE5Uf0poQbN78LHTN7hFZbrUQsvjLuR58DNmVtCZZNO+JaIqZbjP+1LuHNyEz0nxmU3m1PuxwlH1E4PzUnj6Li2rpZKHIPQc5iqojzdjZqTpoB+XJgVsg15BCNMcjm2sWHtiQ9q3HmStsAHIP4ttBxOJCXzBwfTJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9mhXAi3LMwQDwXXOIli4wdBuNea+z1oh/BDpBMhZFI=;
 b=yZFhhGV9QjQfBZ3jD+xZDPb6MnrVUm/U0Jss4fE7UG1pwWcuVpctBWpDprYqyjnbELdx9IxlaO3BtlGhzEJ4Y7t3f4ylhnK/dbr6DUYYsVfKGtD7qdJj5H5G5b+S4/8fZZvLKUZ6Xrghw6iZy0T6ugIzbCtJVXs+/wVs6SefnnpGZPYC9d9UapWhnenUT+SW6UFhQ2klr5OO3KLDkBi5TGMA/QPo6qzPbUNJZY1itPDPQ3seriLs6KrXD4PHMB2kr5PKGCVl1Yfz1kEoerTE1PpVMiKxgWIT2nEDxAga5XmZmj9OD3OrZU4oszOMEPsw8DwiADN7+evARPWN/C3U7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9mhXAi3LMwQDwXXOIli4wdBuNea+z1oh/BDpBMhZFI=;
 b=NsxcWbQuakO8BwfhQaQbtOCoD7/oUbO2hqwMAiW4oTJHHRXqFYktMVEZTnJy3Q7udGshRYt5QwwV7GahTNlQtNRCiCnt1k/YzFPTWFiRBf9wJdtBB7msqs/lyld9ReS5z0qzQvhpZnvmzlktu2y0PYji8Cs7nw+NkP6QOFBSqQ0FiSvUBiuWZWikTEnmIktj5NpWDqD+ivTJKhLvVXB2lmWb5VOV++DvXoXa72cysdQ/rtJaIqt6MlDDnaHC6c++jZAvuCzBu+sDqb8Yr0fI93voHer1TNPQD+AO0hnkHPLhhLoWUfpwiVooCZp7JtVmlycqqcDGM5um9XOUXEvYFQ==
Received: from DU2PR04MB8629.eurprd04.prod.outlook.com (2603:10a6:10:2dc::6)
 by GV1PR04MB10847.eurprd04.prod.outlook.com (2603:10a6:150:20a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 12:21:35 +0000
Received: from DU2PR04MB8629.eurprd04.prod.outlook.com
 ([fe80::9d04:7526:a901:fe47]) by DU2PR04MB8629.eurprd04.prod.outlook.com
 ([fe80::9d04:7526:a901:fe47%6]) with mapi id 15.21.0092.010; Sat, 6 Jun 2026
 12:21:35 +0000
From: "Wei Fang (OSS)" <wei.fang@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, "Wei
 Fang (OSS)" <wei.fang@oss.nxp.com>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH v3 net-next 7/9] net: dsa: netc: add VLAN filter table and
 egress treatment management
Thread-Topic: [PATCH v3 net-next 7/9] net: dsa: netc: add VLAN filter table
 and egress treatment management
Thread-Index: AQHc9I0GfJK4vWqRCUy632gpJofdYLYww3eAgACxbwA=
Date: Sat, 6 Jun 2026 12:21:35 +0000
Message-ID:
 <DU2PR04MB8629DC43F16193A69856CF75881E2@DU2PR04MB8629.eurprd04.prod.outlook.com>
References: <20260605014808.686024-8-wei.fang@oss.nxp.com>
 <20260606014626.266211F00893@smtp.kernel.org>
In-Reply-To: <20260606014626.266211F00893@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8629:EE_|GV1PR04MB10847:EE_
x-ms-office365-filtering-correlation-id: 692ca4a9-5504-4992-887b-08dec3c626c2
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|38070700021|18002099003|22082099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 Wrw5ObUBP0yRXJzmLLSCJP3p5HXLOQCfVGFTWW9l4IEIqvOx7oVWVrP5XIQl44TKyjo/xmzm2jlg6IIYVtlpq8REq+OR9Njz/uvTlBNBg6vSELlqHjfXt14f9TYnobUACPCSlsppjrwKjaTC0c39t1yRdLZ/8oZ3+E40JdMrfkcKwZZV2ckW58xCvPae8LLtYnkbsm2edF/tPsWezrKsoltKOYHSLFXcr6pfK4Lm81Lq5Pv91xvhnsIhesesYdWj+Omvlj3Es8u+zmZXtabC62IB0K+AdHt5k5lMT5fzlkIOPSNxDgFgOm+nsMAb8ap1N2pLrqnaPJzPAVjJwLHxeaGAqY4aaeQBPZmNBUc/5AwWjuUDyDU/0zgCvaEgc0bNvICIYzn9YtiWqRiL9PA6lTfXIWOqxg4mUd+qV+LzcW6X+O1LduuO3TK5e7HwVNW6XDmTMQrpn8Jsdr1IFDtlBICeRyhHH5ytfSvRy1/RpTEMJvA22Yysujv9h2SkZad8jVeVDNmc8H1ZjzINnK/scylrIr9qbkfD04/6gn2fXB/A0uT7LkIPEeOgbR7kdwWshJFaVWyIOIC5TP57mzH2tFNEINurfo22qC0HlZ1Uv8xQcmoVOsph1OkS/AI4BF2wEEzJeUU3HRKOlaS7uM3ST9uotJEDuhMtsjY9XjvONCjGJ1RvyG8GPcU51kUZ0VsrBUunj70I0M0iSmEKoqOIFC/ZFIc2z5D+e7HGQ7TKIo85gUdWPWxcCgmml5e+OXuq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8629.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(38070700021)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RUhFaDlzTXJsMWVXeTZiSVQxRFJBZjRTeFFTTmtVejhnbXdwZFh1UTRkNVR6?=
 =?utf-8?B?a3BxTDVObEdCZGViTUkrWWVmem0vbUhmSTJodU9ENnd2em04NXpZa01RcE83?=
 =?utf-8?B?VGlIWjU2SXNEU3ltMDM0ZEdaOG90RDdQMUNabStBVXBnQzg4ZzV5MVdoeHI5?=
 =?utf-8?B?WWdXNTRpL3VhUk9xU1NXZW93b0dFY2VPc2tmS1pvbkQzdytKM0dFWkp0b2tG?=
 =?utf-8?B?K256Z09jNU5uam9sNVFWb3pyMVVDSEMrTlU5L0dXWldaMHkweXhxdVVKdmZK?=
 =?utf-8?B?MU5OVHdQNEtucXpPUkpxWVZzd3lZZGdQSkVoZ2tycXhUTVR3cStvb3VMUzR6?=
 =?utf-8?B?Unk5WHJieVBYeGIzQjNHYWFQS0I1eHJHaEJZL0E0aVJBZ1B3YzFwVnQ4L0J2?=
 =?utf-8?B?MnFTeVpoUVB3c09Ca1gxb201ZGhJRmx0Q3E4ZGRvWk9TdDB5VUpRT0VWUW45?=
 =?utf-8?B?cno0dVQzSFRvTWg5aEg4OXhKQzlhbzVOK05Tb1BXSCtxbWhEZHFWZVUyb0E0?=
 =?utf-8?B?UFA0SS9VcTRBSDVwSWlLK3hwd3JKdDY4N3R5aGwrL1A0dTIrSWtjTC95TVI4?=
 =?utf-8?B?djNJRVhPVmY3dWw3eEVSbW5xd2ZWOGNTN3huOFFtODBLWStBc1YzVWZ0SmNY?=
 =?utf-8?B?Z0duUUFJR1VzQXhpMndhQUFRT0NIdlJuVzhGajQxanZNVmd2RlB6QzhpeUhJ?=
 =?utf-8?B?Q21OU0lNMG1jTCs0MERScytNd1pJNXBOcjBjNnh3YlBpcEZQWGJqTGhlLzI0?=
 =?utf-8?B?dkt0dUVnS1dXWUpyY1VHb25YOHNOMGFYc3dXaEdoQklyRFVIbmM3d0ZYTnU1?=
 =?utf-8?B?R1lUTnFaM25GdXcxZkN6cnhvYnpubXlyK3Y5cXJkbElVSzNTOUpWSFVabzQ4?=
 =?utf-8?B?MG5xKzQxNFo1UTd0TXhmR2ZyQkRNaTRkYmRyZVpuYTNxelpZSkFBM2VHazlm?=
 =?utf-8?B?QnRTbUEvTXZVVEdxM1RoaHpaY3Vqb1VQNlhmbTlVZmx3ekZxWnZOanZYTGt6?=
 =?utf-8?B?TU1ySzlrUTZ1RmRpeGs3eTd0RUQwUkE2eGxGczVNZk5mdTNqeVUyRWxoYUN5?=
 =?utf-8?B?bExXYVlvaHNPd0NOM1R3RVJIa1R2bVhMNnRRU3dlV2pVV1RVTG9SNnlkMnZ1?=
 =?utf-8?B?MHdMK3crWFdDVVhhY0kySzRRNCs5amZOZVFZeVIyV1BkQ0JDYjdxMVpOZ2J1?=
 =?utf-8?B?ZHlURGQzMFZINVVybFAvN0RLRGZZb1N5QkNvcXFBOXhrQkZrZFEzRzF4UHFv?=
 =?utf-8?B?SHkrdHFRZWt2R0NWZyt5aElXK21CTU5ZUEUra0c1ejZJV1NtOTRONjYwc2tL?=
 =?utf-8?B?OWhkVE9pbjdXbFFvM0s1TzdBbitiNFJtUW8xb2U1OE85UnFJMndGR2RpOVRH?=
 =?utf-8?B?cGJOOU9zeDJaNEFsNW5mVkMwa1BsKzB4VXhPcllLUjFhd0hCMDZQM2tTVTIx?=
 =?utf-8?B?RUt3a1A3TkJkajVnTmxVdDFHNnpKTEM2UlYyYW1CbCtITUUxNGFtMk5Yajhj?=
 =?utf-8?B?RGEzWWVMbkkzeGdzMkEwNmo2R250MmN2Q1RUaWZQK0JuSFpJVDh5WWVqQmFO?=
 =?utf-8?B?cFp0Q2xKNk5wN2ZGZXhrWlUzT211eGw0U3NVWWdzS2t6NndRNVh3RTU3cDZU?=
 =?utf-8?B?NWF1b0pkYWdrYVFuUmVpTjBSaW0xOTI0R3laYWdEVmlWeVRMWXQyOExCMkFy?=
 =?utf-8?B?TTFXazF0MmVjY0Jhb0w4cVRZWVYrVFh2cFdGN0c0ZmpEWERwclBSNU9WSCtv?=
 =?utf-8?B?UjJZMWZhc1VoWVQrSnVTb0I3YlZtbjFTQ1VqalJFTUpNV0lDVWVNcDRyVXRJ?=
 =?utf-8?B?ZUpSYkdzT3cxaXRXSExZR3Z5SnExWnIrd1k2cmsrR3hrNTFBN2hpOHhrY0pN?=
 =?utf-8?B?a3k0YXJtMVExcnM1bFFvdEF0c29xSFRUeHJrT0M2MVNrVVBWeXVKK00zM2k5?=
 =?utf-8?B?TllXem9VQnpMZGhLaXhZeFh0V2wwK3psU29UU0tkNVZIZHBHTWVWSEhXejhz?=
 =?utf-8?B?aXFSajVMSWZmY01DRUNPeGk0YUo3NDMyb0d3UjJVVGZ3c0VZZi9lQVNxWXFi?=
 =?utf-8?B?dHRhVVVuOEVnNUJKR0J0WjFHWWE0WkFwYjBUSUpsYkhsRTRmalZnLzFHNlZS?=
 =?utf-8?B?SkRSZm9RWHRSZGxaMXpKZVhOcW9mcHRBTzVwK3RrZ3gwcSs3RkFjNStKVHpM?=
 =?utf-8?B?VlA3ZFBTQXQvT1FHTWhpYzF4L2ErWEdSVUMrWHJvMWF4VkhNaXNOTFpTWkhk?=
 =?utf-8?B?ZzBhMTR2UHorTFp2Um5TbFhkZHB6dVJVWSs0WVlzNEQvOWlaeHVOaHcxNzg2?=
 =?utf-8?Q?Jv2Cgq1hUtmfUtMMe4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8629.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692ca4a9-5504-4992-887b-08dec3c626c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2026 12:21:35.3923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9orKdzIweUkeOu348LOCUts0V0avriV10jkN/ioAjNrGQO8i4NbxGUvUDgAQOi0d62Wzp7Bx73J69yNVz238bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10847

PiA+IEBAIC0xMDI1LDYgKzEwNTQsMzg0IEBAIHN0YXRpYyB2b2lkIG5ldGNfc3dpdGNoX2dldF9p
cF9yZXZpc2lvbihzdHJ1Y3QNCj4gbmV0Y19zd2l0Y2ggKnByaXYpDQo+IFsgLi4uIF0NCj4gPiAr
c3RhdGljIGludCBuZXRjX3BvcnRfdXBkYXRlX3ZsYW5fZWdyZXNzX3J1bGUoc3RydWN0IG5ldGNf
cG9ydCAqbnAsDQo+ID4gKwkJCQkJICAgICBzdHJ1Y3QgbmV0Y192bGFuX2VudHJ5ICplbnRyeSkN
Cj4gPiArew0KPiA+ICsJYm9vbCB1bnRhZ2dlZCA9ICEhKGVudHJ5LT51bnRhZ2dlZF9wb3J0X2Jp
dG1hcCAmIEJJVChucC0+ZHAtPmluZGV4KSk7DQo+ID4gKwl1MzIgbnVtX3BvcnRzID0gbmV0Y19u
dW1fYXZhaWxhYmxlX3BvcnRzKG5wLT5zd2l0Y2hfcHJpdik7DQo+ID4gKwl1MzIgZXR0X2VpZCA9
IGxlMzJfdG9fY3B1KGVudHJ5LT5jZmdlLmV0X2VpZCk7DQo+ID4gKwlzdHJ1Y3QgbmV0Y19zd2l0
Y2ggKnByaXYgPSBucC0+c3dpdGNoX3ByaXY7DQo+ID4gKwl1MzIgZWN0X2VpZCA9IE5UTVBfTlVM
TF9FTlRSWV9JRDsNCj4gPiArCWludCBlcnI7DQo+ID4gKw0KPiA+ICsJaWYgKGV0dF9laWQgPT0g
TlRNUF9OVUxMX0VOVFJZX0lEKQ0KPiA+ICsJCXJldHVybiAwOw0KPiA+ICsNCj4gPiArCWV0dF9l
aWQgKz0gbnAtPmV0dF9vZmZzZXQ7DQo+ID4gKwllcnIgPSBuZXRjX3VwZGF0ZV9ldHRfZW50cnko
cHJpdiwgdW50YWdnZWQsIGV0dF9laWQsIGVjdF9laWQpOw0KPiANCj4gW1NldmVyaXR5OiBNZWRp
dW1dDQo+IERvZXMgdGhpcyBzaWxlbnRseSBkZXRhY2ggdGhlIGVncmVzcyBoYXJkd2FyZSBjb3Vu
dGVyIHdoZW4gYSBwb3J0J3MgVkxBTg0KPiBlZ3Jlc3MgcnVsZSBpcyBkeW5hbWljYWxseSB1cGRh
dGVkPw0KPiANCj4gSXQgYXBwZWFycyBlY3RfZWlkIGlzIGluaXRpYWxpemVkIHRvIE5UTVBfTlVM
TF9FTlRSWV9JRCBhbmQgcGFzc2VkIGRpcmVjdGx5DQo+IGludG8gbmV0Y191cGRhdGVfZXR0X2Vu
dHJ5KCkgYmVmb3JlIHRoZSBjb3JyZWN0IHZhbHVlIGlzIGNhbGN1bGF0ZWQuDQo+IA0KPiBCZWNh
dXNlIGVjdF9laWQgaXMgTlVMTCBkdXJpbmcgdGhpcyBjYWxsLCBpdCBsb29rcyBsaWtlIG5ldGNf
aW5pdF9ldHRfY2ZnZSgpDQo+IHdpbGwgY2xlYXIgdGhlIEVUVF9FQ0FfSU5DIGZsYWcgYW5kIGRy
b3AgdGhlIGVjX2VpZCBtYXBwaW5nIGZvciB0aGUgRWdyZXNzDQo+IFRyZWF0bWVudCBUYWJsZSAo
RVRUKSBlbnRyeS4NCj4gDQoNClRoaXMgaXMgcmVhbGx5IGEgYnVnLCBJIHdpbGwgZml4IGl0Lg0K
DQotLQ0KcHctYm90OiBjcg0KDQo=
