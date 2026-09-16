Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31C63ACEE0;
	Wed, 16 Sep 2026 19:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789588081; cv=fail; b=bWFxL47m6qqK3yjyAxL+wvo3HZF13YZqBfxJvHywD8jx451j/Gl/WnA7gz3ebVS8pobJRwBGud4PhXKUi/DmGZgxqUssbRPjG5lIU573QSWBLBw2l4uEdBDIHb1F9aDUd6+zCosPWFfX1zX/MZVMpt1M6hM6HKlqzlmkK5uVLH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789588081; c=relaxed/simple;
	bh=xW+4pfcC4iG10nxkN8NmKSLn9/+rmvm0rzd6+s9LTbM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KB7FhH7mIC1ggXh/YlHXurxpnk5huWaIoASL1+A67M6NyhJ09koDmtFdTrSqcAGkxXk7KZibHZK850PX04CUn7BaEgoqdrTiAD5fOjmWx3FCEO4Kh2OSeOfY/Do/oWkv9HJ7Z3KcPC1TR9qfUj4H9g8cE7FdQQ0SV+fFnkUt6XQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=d9h8aXkS; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="d9h8aXkS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pactTAjaugVRNlBmbPFvoTsiwA0tDrLDtg9G9jYl6Iywe67uY5v1k7k7tzqzpAHUn0UpqFzyLXM8iICzxYPkcx1EeZzFdprJ4Gcb9PocNFMbGcCZxas8zIBQqQiZOMDMc08LHwTTRvpLLqHdrHVOzQUH3LsqAAMl1gx4E5zWuhrk0mVXxxpFe1Ueue3EPbTy6UMDwmYtjv9mLq/gv3u3TwjEAWbpjF3VEODLu///1piuMhgEizr0VNEqgrXmB14DZR/YLxd7ZbJG4e4MRu3s2Ap2nz/03Lgjm5vu8ggwIW9xgNie/fugttkxvifoWQ7K+dqI91Roe0wtkMifB4fZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xW+4pfcC4iG10nxkN8NmKSLn9/+rmvm0rzd6+s9LTbM=;
 b=rnobzOj99s5lKVb7EPPqcUdp0fKAvSK6Rpr9IjVzN/0sTqdF4rCN0dddXKwawasF+mj73i+Ipah5vnS31Ese8F/0CkdMQv5QVufoGhoc59lmd4+TsDwADHDzAI60XF8TwegGqOO+duuE3u2q4EH+Mz01ZVm+zm8xDBbQLU3lEEv4fAs/abBYkLbz9ajQDcfw1AlH10v+m65MXKoHxpRRcdaTmGV541sB+h0zxkihhG7HIPWfKNELwSzmXnKu2QxkHvb61VBZWGMKEdZ65mgs1NKVXb5+yud3Fk1v79jkft4hl1pEKu6aSUWVrpxHK74JrvrzcsK5p7LC2Wa/IzNC5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xW+4pfcC4iG10nxkN8NmKSLn9/+rmvm0rzd6+s9LTbM=;
 b=d9h8aXkSdCoZnEIVG2t6hOJc6g45hRWkCLzeaUmpOk2BDjQPAFMuDEWzsMSEGpnXGqkYCnGpmD4vaFNyIwpxJFjSTsnH92wPleonoOj0cLS6S1mGrSSHvR/KNNTQ2IMDOLHAT6Ceiu400yKC/FyDvb9lYV5t7K4Qfq4ig01mLuQ=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by TYWPR01MB10790.jpnprd01.prod.outlook.com
 (2603:1096:400:2a6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 19:47:50 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4%3]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 19:47:50 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "lee@kernel.org" <lee@kernel.org>, "mfd@lists.linux.dev"
	<mfd@lists.linux.dev>
Subject: RE: [PATCH 3/3] mfd: rz-mtu3: enable runtime PM
Thread-Topic: [PATCH 3/3] mfd: rz-mtu3: enable runtime PM
Thread-Index: AQHdRIXedt2DMtQrBk6gTw3h8N7n5rbOhgEAgAMU/oA=
Date: Wed, 16 Sep 2026 19:47:50 +0000
Message-ID:
 <TYRPR01MB1561982B6B8D79CDE53C4904E85B92@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260914201456.2018403-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260914201456.2018403-4-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260914202757.774AF1F000FF@smtp.kernel.org>
In-Reply-To: <20260914202757.774AF1F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|TYWPR01MB10790:EE_
x-ms-office365-filtering-correlation-id: 51610b72-cb94-40b7-9330-08df142b63e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|38070700021|5023799004|4143699003|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 jXPsx1RcihQtBoajv2kYBLnda8m2OIhYoFplSqyqAjhMrSp5KMx/lJStAdUodgoIPr0cyAuTuXV7Yvws1VmuEO6kfZs1uWqi+7FWwfnK94Cvxd4Ayp2KYMnEv/vwQavvlwfF6iH6jSGFrDymydi/rBDg4Z0a/g4V7QzlTK+WPOmRnPb0mzHn7bKQ5GDOXVb+DfZwcIiOc1CYSIN42EMMFota/fR3jcMMywubFXhPphFsQI2T9WtXJq5NnSeNWzNOlavZDT7aInEiiE7+NA5f7qb0WUgmdyAWZgiCgSPgzkzNJRMRQ3iyvjzb9zrh4K+x5coAPKwT7e7iV0xwdcGaG8W/sSOWeJUeA1sUMEchvM82OWZhNkoJwH1vVr/ynn+jiA1+vqfWPSlTKOLug3h+47Z8KIKtlvPGZGY/FrZpKnq2QyfrckZD6R5l6b/fhSJJMHih7gx/7+htQTGdB/YRmrHTiK7AefNHsEgQ1M2qKSodlRy3mAY+YfbzWdEb5/MAzukeRw64174VTvotpn6dRAx//U/h4MNEE3PyEn+h5eQtz7wNk8I8NeRIdjHy36EnUyX0ORfSUiRYKVolSBs0/DDu4yUvW+HMV+8HoXHi+VYQGWtCER/sfukmqYvSeAInBLVa77sFD2NbpdyFZJPPz4uUhQHdyP8LW4GKUL144uFi3ercBx3B8zUcCZtsuX6VJg8ANRdCT6Vvh3VoBAb6Jd+ARQr3mATQ9XnR37KZE/Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(38070700021)(5023799004)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M3Y1ZTBtUGJWLzR6UjF4RTgvTENYYlRlNlJEU2RGeHErOG9oSlFvRmxuSmNW?=
 =?utf-8?B?Zk8ybWVjc1FteDR5N3FRU3hjRVUxVnJDb3NRNUJXNTFFNVdCczNVWWozWTZD?=
 =?utf-8?B?amhoQnJTbGt2bDZwQ1dhRFNkclZRMG9iOFluelhkcWF2cE1jenYxWU5PS2ND?=
 =?utf-8?B?SGQ4SFpmWXNZb01RRmlPWTJPSkhjZHRqSEM2Q2pmYlhOcVUwb1NkT2t5djBw?=
 =?utf-8?B?WTlkSlNyd29TV0V3dGRMMjVqZWlWVGI1b2UyL0VqUmxpRThKWGF1dTdHRTdI?=
 =?utf-8?B?Tk52d0VmeXRtYmhjRXl6UUZTTE8wdjV0Rmx3bUJYUWZHeUE0dDJVdExPT25U?=
 =?utf-8?B?b3hKYXM2d2VIaUVON1BNdXhGSUwyNUVyc0lxbk1RTk5ub0w0c3lLMWpLQkFC?=
 =?utf-8?B?OGhKeWNUZ3RXNGlrcTJ0TDdQUksvRTYvN1dZSjQvVWF5eWpJbmNnd0JLZVI2?=
 =?utf-8?B?SG80L1NqNlhiTVlpSjNKQWtDajlpWUprRUZ0NkM2dW5sL0NVRWFuMm9lV3My?=
 =?utf-8?B?U0NwU2F6UkFucWhiTURBR3RlMFV2WklvTStSTlBwc2tnaWxMd0Z0emswdVo2?=
 =?utf-8?B?YUczcGNHUURZaCtGOXkraTNTTy9BYURRaXAxb1Y5ODNNOUFqWHMxamQ0SlZz?=
 =?utf-8?B?YUVhWll4YmJza2tDOG1kdWUrZmtLT0c4RjdHeXNGUUdEQ2FGeW9hY2llMXZn?=
 =?utf-8?B?Zm5uNkE0TGd1c2RzZWpYOG9ybzU3T0NjekZDVi9TZ1k5Y0NaR2FMT05yNjZj?=
 =?utf-8?B?UkZmSmQ5WXlXU292ZlVOSXZDdVF6SU1vbXpGT1RxM2V1Vk1Hd3BFWU1vWTN6?=
 =?utf-8?B?R0RZdDB4a0VlN2dzOXp6Q2Z6dDRyMXhBR2dncWNSOUpNMnl3ZHduOTZsVVcr?=
 =?utf-8?B?S253YWZJZUE4OHpYMVlXR2t3akxKamZyelA5WWhwNGV5aTVJaDBsTkc0UFFX?=
 =?utf-8?B?Y3F2cWtRR1ZPdy9PUFphdWVYRjhlQkh0bU9RTjFqa1NISHVvc08vVkpVbDh6?=
 =?utf-8?B?YVQxR3ZBZHJyUHBtZzRaNDFmWEtvR1M3R2lJZDk3cWltSmNGdndNTm0yUWJo?=
 =?utf-8?B?QTU3TkkzdEhoNklLKzgzUWFkcUtNZWdiK1Ztb1lhNkZzMUczVGVuczNHUmNo?=
 =?utf-8?B?cTUvcGI1dGoyN0ZFZHNhRWZYWlhkdWEzWXZZUDhmT21iWGJyaXc3bDdIRFJq?=
 =?utf-8?B?MFVKNmhVanZlRVBqOVJ3TDF2QWR6ek4xemMzcVRvNGVtS0N2NVk5NUFWbzJq?=
 =?utf-8?B?L0Q1YzE1QWR0cVJwazU2N1REdDNwem5XQ1k4b29aKzBqQ3Z6SW5FOFhDT1Fq?=
 =?utf-8?B?WFBIS2JCRnF1dnRTemI3YWR6SVZvLzhqY2ZZQTRnbEJaTmhobkpKZ3RhM1Z1?=
 =?utf-8?B?L1doU2puMVBRcjNPRE5pWHo2VmpQL0k2R0hucjg2V2RCWnR3cG5UaHM2M3VT?=
 =?utf-8?B?S2oyRHltemxYMDcwMytBZjlPbFRkNnBHbWhoWXByWW1UUTRraTRONGFpWjJ3?=
 =?utf-8?B?MCtERU9tb2FCUUZ1Z3d5STQvLzJFR3Q1SzVjNDhpa1FHaUlDTjlxMzdJd2pM?=
 =?utf-8?B?dHVLb3NKOHA0bXpob3k2Y3NnckFjTVk0dlRDZGZBUVB1MnRJOGdTZ2J1Vnlq?=
 =?utf-8?B?NmhHK2lPS0NkR3VxWmg3UCtqZnQrazV2ejRMM250cldQamNxS0tMblp1M3BJ?=
 =?utf-8?B?NCtPUXZEZU4wYklGK0RCQXFIaTlmaGcvL1J5TSt0ZHkvSnVyNnNuMTZrZm0y?=
 =?utf-8?B?bjA0SCs4UWx1a0pLb2JsRnJwcFh2L1JGUXVxN3NEMmRraHJ6N2srTUt4eGFT?=
 =?utf-8?B?OFdVMUkyK25mR3pXYlJ1SWE3RkRvbzlEdVduRDJnNnB5TnduWWFwZmF3bTIy?=
 =?utf-8?B?TGxNc08zTWlNSzRNMkFKYUYwNFlaa2hraGV4eVlNTnVYM3VDdmM1NnNJams0?=
 =?utf-8?B?UmlRUnhaOG92cFAzZldkdkVGeFIzT1FYcnNnbWNEdmdHTExZamVIYmJmbXhw?=
 =?utf-8?B?WEcrVFZKM1RBemJucE9SWGtZeHRySDJNMGNRSjJJc2JFMjF2WDdhRWFsU1oy?=
 =?utf-8?B?dlMrcjZ4RXNPd1JqTkpMS3IxNGh0VGhDdGZQTlN5VE5QTmRkT29jcGxRc3hy?=
 =?utf-8?B?SEhjS1psc3N3VVFKWGxneVVlUVpCY3Z2bE1lOVcrMXRPcnc2UWdNQVVELzdN?=
 =?utf-8?B?TmQvUVkrOTE4R1U3YkFOSEltdzJZWWZzN1BpdVVReE1RN01ta1lxa3Via2Rp?=
 =?utf-8?B?bENKR3A4YTEvWnVmZXFVaUxwM3FXektUMS9JUDJxcWVCRFVqemZKdkh4eThW?=
 =?utf-8?B?L0FwRUN6YWx3enUzd0REdkx5OHJzWUNFaHJ4aHg3Um95NG41K3J1cnQwM3JH?=
 =?utf-8?Q?IClNLdtfpLFCW3ng=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51610b72-cb94-40b7-9330-08df142b63e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 19:47:50.1939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Szzm29p3cGL5YPtPybLuhY3EMRktNmdpvw1CSGngEit8Gb/sGhUUsaTsdOHlScFjKPw35gboBSwjEzqZG4Dd0lcBSYOp2iTQxZXHimDvOyMf13cqjS444SaqD5hbWlM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10790

PiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0K
PiBTZW50OiBNb25kYXksIFNlcHRlbWJlciAxNCwgMjAyNiAxMToyOCBQTQ0KPiANCj4gVGhhbmsg
eW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMiBwb3Rl
bnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0gW0hpZ2hdIFBhcmVudCBkZXZpY2UgcnVu
dGltZSBQTSBpcyBlbmFibGVkIHdpdGhvdXQgc2V0dGluZyBpdCB0byBhY3RpdmUsIGNhdXNpbmcg
Y2hpbGQgZGV2aWNlcycNCj4gcHJvYmUgdG8gZmFpbCBQTSBhY3RpdmF0aW9uIGFuZCBwZXJtYW5l
bnRseSBsZWFrIHRoZWlyIGNsb2Nrcy4NCj4gLSBbTG93XSBUaGUgY29tbWl0IG1lc3NhZ2UgZGVz
Y3JpcHRpb24gaXMgbm90IGNhcGl0YWxpemVkLg0KPiAtLQ0KPiANCj4gY29tbWl0IGU1ZDAwMGVj
OTkzZGRkYWY3NzMzNTI1MjVmMTFhYWUzNGU5NWE4MTINCj4gQXV0aG9yOiBDb3NtaW4gVGFuaXNs
YXYgPGNvc21pbi1nYWJyaWVsLnRhbmlzbGF2LnhhQHJlbmVzYXMuY29tPg0KPiANCj4gbWZkOiBy
ei1tdHUzOiBlbmFibGUgcnVudGltZSBQTQ0KPiANCj4gVGhpcyBjb21taXQgZW5hYmxlcyBydW50
aW1lIFBNIG9uIHRoZSByei1tdHUzIHBhcmVudCBkZXZpY2UuIFRoaXMgYWxsb3dzDQo+IGNoaWxk
IGRldmljZXMgdG8gY29ycmVjdGx5IHByb3BhZ2F0ZSB0aGVpciBydW50aW1lIFBNIHVzYWdlIHRv
IHRoZSBwYXJlbnQncw0KPiBQTSBkb21haW4sIHJlcGxhY2luZyB0aGUgb3Blbi1jb2RlZCBjbG9j
ayBoYW5kbGluZyB3aXRoaW4gdGhlIGNoaWxkIGRldmljZXMNCj4gdGhlbXNlbHZlcy4NCj4gDQo+
ID4gbWZkOiByei1tdHUzOiBlbmFibGUgcnVudGltZSBQTQ0KPiANCj4gW1NldmVyaXR5OiBMb3dd
DQo+IFRoaXMgaXNuJ3QgYSBidWcsIGJ1dCB0aGUgY29tbWl0IG1lc3NhZ2Ugc3ViamVjdCB2aW9s
YXRlcyB0aGUgTUZEIHN1YnN5c3RlbQ0KPiBmb3JtYXR0aW5nIHJ1bGVzIHdoaWNoIG1hbmRhdGUg
Y2FwaXRhbGl6aW5nIHRoZSBkZXNjcmlwdGlvbiBhZnRlciB0aGUNCj4gc3Vic3lzdGVtIHByZWZp
eC4gU2hvdWxkIGl0IGJlICJtZmQ6IHJ6LW10dTM6IEVuYWJsZSBydW50aW1lIFBNIj8NCj4gDQoN
CkFjay4NCg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9yei1tdHUzLmMgYi9kcml2ZXJz
L21mZC9yei1tdHUzLmMNCj4gPiBpbmRleCA4OGFhMWZlZGYxZWY1Li5lMjRlNjdlN2E2NmNiIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWZkL3J6LW10dTMuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
bWZkL3J6LW10dTMuYw0KPiBbIC4uLiBdDQo+ID4gQEAgLTMzMCw2ICszMzIsMTAgQEAgc3RhdGlj
IGludCByel9tdHUzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gIAkJ
bXV0ZXhfaW5pdCgmZGRhdGEtPmNoYW5uZWxzW2ldLmxvY2spOw0KPiA+ICAJfQ0KPiA+DQo+ID4g
KwlyZXQgPSBkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKGRldik7DQo+ID4gKwlpZiAocmV0KQ0KPiA+
ICsJCXJldHVybiByZXQ7DQo+ID4gKw0KPiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBEb2VzIGVu
YWJsaW5nIHJ1bnRpbWUgUE0gb24gdGhlIHBhcmVudCB3aXRob3V0IGNhbGxpbmcNCj4gcG1fcnVu
dGltZV9zZXRfYWN0aXZlKCkgbGVhdmUgdGhlIHBhcmVudCBkZXZpY2UgaW4gdGhlIFJQTV9TVVNQ
RU5ERUQgc3RhdGU/DQo+IA0KPiBEdXJpbmcgY2hpbGQgZHJpdmVyIHByb2JlLCBpZiBhIGNoaWxk
IGNhbGxzIHBtX3J1bnRpbWVfc2V0X2FjdGl2ZSgpLCBpdA0KPiB3b3VsZCByZWNlaXZlIC1FQlVT
WSBiZWNhdXNlIHRoZSBwYXJlbnQgaXMgc3VzcGVuZGVkIGFuZCBpZ25vcmVfY2hpbGRyZW4gaXMN
Cj4gZmFsc2UuIElmIHRoZSBjaGlsZCBkcml2ZXIgaWdub3JlcyB0aGlzIGVycm9yLCBpdHMgcnVu
dGltZSBQTSBzdGF0dXMgd291bGQNCj4gcmVtYWluIFJQTV9TVVNQRU5ERUQuDQo+IA0KPiBTaW5j
ZSB0aGUgY2hpbGQgY29uc2lkZXJzIGl0c2VsZiBhbHJlYWR5IHN1c3BlbmRlZCwgd2lsbCBzdWJz
ZXF1ZW50IGNhbGxzIHRvDQo+IHBtX3J1bnRpbWVfaWRsZSgpIG9yIHBtX3J1bnRpbWVfcHV0KCkg
aW4gdGhlIGNoaWxkIGRyaXZlciBiZSBpZ25vcmVkIGJ5IHRoZQ0KPiBQTSBjb3JlPyBJZiB0aGUg
cnVudGltZV9zdXNwZW5kIGNhbGxiYWNrIGlzIG5ldmVyIGludm9rZWQgdG8gYmFsYW5jZSB0aGUN
Cj4gY2xrX3ByZXBhcmVfZW5hYmxlKCkgY2FsbGVkIGR1cmluZyBwcm9iZSwgY291bGQgdGhpcyBy
ZXN1bHQgaW4gYSBwZXJtYW5lbnQNCj4gY2xvY2sgbGVhaz8NCj4gDQoNCmRldm1fbWZkX2FkZF9k
ZXZpY2VzKCkgLT4NCm1mZF9hZGRfZGV2aWNlcygpIC0+DQptZmRfYWRkX2RldmljZSgpIC0+DQpw
bGF0Zm9ybV9kZXZpY2VfYWRkKCkgLT4NCmRldmljZV9hZGQoKSAtPg0KYnVzX3Byb2JlX2Rldmlj
ZSgpIC0+DQpkZXZpY2VfaW5pdGlhbF9wcm9iZSgpIC0+DQpfX2RldmljZV9hdHRhY2goKQ0KDQoN
Cl9fZGV2aWNlX2F0dGFjaCgpOg0KLi4uDQppZiAoZGV2LT5wYXJlbnQpDQoJcG1fcnVudGltZV9n
ZXRfc3luYyhkZXYtPnBhcmVudCk7DQouLi4NCl9fZGV2aWNlX2F0dGFjaF9kcml2ZXIoKQ0KLi4u
DQppZiAoZGV2LT5wYXJlbnQpDQoJcG1fcnVudGltZV9wdXQoZGV2LT5wYXJlbnQpOw0KDQoNCl9f
ZGV2aWNlX2F0dGFjaF9kcml2ZXIoKSAtPg0KZHJpdmVyX3Byb2JlX2RldmljZSgpIC0+DQpfX2Ry
aXZlcl9wcm9iZV9kZXZpY2UoKQ0KDQoNCl9fZHJpdmVyX3Byb2JlX2RldmljZSgpOg0KLi4uDQpp
ZiAoZGV2LT5wYXJlbnQpDQoJcG1fcnVudGltZV9nZXRfc3luYyhkZXYtPnBhcmVudCk7DQouLi4N
CnJlYWxseV9wcm9iZSgpDQouLi4NCmlmIChkZXYtPnBhcmVudCkNCglwbV9ydW50aW1lX3B1dChk
ZXYtPnBhcmVudCk7DQoNCg0KcmVhbGx5X3Byb2JlKCkgLT4NCmNhbGxfZHJpdmVyX3Byb2JlKCkg
LT4NCmRydi0+cHJvYmUoKQ0KDQpTbyBhbnkgdGltZSBhIGNoaWxkJ3MgcHJvYmUgcnVucywgcnVu
dGltZSBQTSBpcyBzdXJlbHkgYWN0aXZlIG9uIHRoZQ0KcGFyZW50Lg0K
