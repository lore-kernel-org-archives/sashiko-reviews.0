Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3A22931C7;
	Wed, 16 Sep 2026 19:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789585747; cv=fail; b=MQ35DxpNjKZjK83V5Dd0CG91Jj77AD19BwQ9XJQsmgEIBJ46i9zgqepUPCdBL6pAxWDVFT2lFumWNDmEh+D/nMKgjpNgxYxyGs+SEUO1NNvL8xUsbKAU5z5FZfbR8pmYcuLuykIDg9QMcKil5m0EPIrYoruiO7tfZ1+fJcuF09U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789585747; c=relaxed/simple;
	bh=9Q+2tQHRIYfP9fGg1pdww9l3IYd74+GAvGDg5DcftdQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BBbfnsWIgTJxS5KgwT1g9vl6HTJiNObZjvsxB5HdjGuy5lGKeyrD/mBsfUctMHkZP4crWxy0fRV513xE3LN3ZHTa/lpuJq8S+9NH/sYDv74/3ZVhzPfIbORrxzTCMXSeogtEl3fQDrZUQ4iABtxE4Z7bY1l8Ujz7BVf2xty64AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X+IONs5u; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X+IONs5u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoYa9sBJ7j3ERi6YGCrLkUoeWb4aVJIJfwIlAWDnZgtA6rgo3FYtp1FEOCwAgjCeI5GAS+Du4rwKsv2Q2ZKG2CtqT4vDhIDmPK+BLW7ZWJEyK008Kcg5iGFLcrTHVYKLov3ndLPAWiCQYwRzPR3KjkzWYjDtOwSwKQQ1F+WWgRNeKl2Rpnp23w+JIXM0NCd/BD8f/M5zVEPBd6YtKLTlt30wJ2jmOg9KcX7HMttyc5SCEThZmh5j9pNFEwX2yZbUUIiDYHPkIX2ogNdIoXnxQWQDqMogxAyhjnHvSm5psiaKm9SFpqmbPub5D9SVxwG3WJPrrLsdiSTs5wNTS+pp0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Q+2tQHRIYfP9fGg1pdww9l3IYd74+GAvGDg5DcftdQ=;
 b=dCvlKCcYS9ui6D/kq/1ouQUYOuQnH6aPPrif0QmsDY4gEaKlCK6Nqdas5XebDiKW0ilSa+lJ+XV/D+IumylsZ02G2XQFPbI2EUeGT34sY7wId1f51o+aFWEl9RIVNfjp0GgWkBOmis9mryKhUf+A/54CKRoZ/8C3BiohyFbqQBbGN1jVszUOCNzTNQTTSCsHfIPT8chmi8Zpuph8Bvyy8SwcqKGKxGk+gGg8RDjiSxCzL2QSv027VtUMz19rgS9V3o9BbrUAEIjfTmIu6VcVbJdJppnN7RpK+vaF+x1nibhOOk8fEDFTWUz5ofstRyD8C80zU+U5pRDuepfz9JCp8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Q+2tQHRIYfP9fGg1pdww9l3IYd74+GAvGDg5DcftdQ=;
 b=X+IONs5ucOYxJu6SQPlrYAlq1keNhbbkCAFWLK+GgUteTDYZeNZWVCrhRer3jiSfN2uQrDi0Of+e+3OlGqj3bhvmdUBSvwmUeGOSVS5PKY5i4iQG9oWku+AdFk3JSfW08x3Waw6xy/LqdtmogeDlN9Mjrx2lJXNNSEn2eVtJa9g=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by OSCPR01MB16032.jpnprd01.prod.outlook.com
 (2603:1096:604:3e6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 19:08:35 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4%3]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 19:08:35 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "mfd@lists.linux.dev" <mfd@lists.linux.dev>, "lee@kernel.org"
	<lee@kernel.org>
Subject: RE: [PATCH 1/3] mfd: rz-mtu3: do not use struct rz_mtu3_channel::dev
Thread-Topic: [PATCH 1/3] mfd: rz-mtu3: do not use struct rz_mtu3_channel::dev
Thread-Index: AQHdRIXbV76ZqXzLDkql35i2AavpALbOhiaAgAMHykA=
Date: Wed, 16 Sep 2026 19:08:35 +0000
Message-ID:
 <TYRPR01MB15619117776C86C7E6BBF444E85B92@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260914201456.2018403-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260914201456.2018403-2-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260914202828.46A991F000FF@smtp.kernel.org>
In-Reply-To: <20260914202828.46A991F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|OSCPR01MB16032:EE_
x-ms-office365-filtering-correlation-id: 973dfb94-0fd6-4e26-b01b-08df1425e852
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|10067099003|11063799006|5023799004|56012099006|4143699003|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 db12CeYjSQ83TYKHzb2IPZivwfS7+wF8YCVkCJl8E583jteWk2Uo/h9A79QzXKZPWVUC0aLUOAdh+VIOX6OucDqA6Q8xWVErRbca9PoBKfSCpTYZgb1oQQv8hL3OTqO7FhGqBA0R8sdxNbV6j9y4VhwywftbQo8P58G1yBY81VlpUKVcvSHJ34t4P+DxWji3dOvQW+5WL9ed/KQAV7cjIqeLyREOekNR8e8/Qm4GWqPxX8n8yDrnHSilfkpPbc694za/7HFlR5qnWV4GFA9m0xx3FujQ5z45C+QFRFekX9FPunvVg42tdfq0IKCghJJf6SVFKqTEgtcr8FWeJb0cFXZ/MjpSx8FJHNH8h/fIAiNl9ReBWz1L9hk3nla6ZM+Y+vkOuMl/jpXTPcu/XvsXjUIdcda5vigAAraGj90Jl/5Z2IgEH7mY0EN9kIOQ90B/B1DDj2WtS3RSDjCl4TG4QV678DkBFm+DgrM2W4DQdB6sqUoDhupC6U3wh8v0uPOiYucOlWUYj4ZmjTBCTuhiBGh93D806plyCg9vxJH18+NRSfy13JLDvyWaqOyOkf7z+pnYNtQgJCTxV87yYJWVA2wOOuhq8IJVSE2Zhex5uRxWvImixo2LWASy841TTdpxjEYNud+PqauM+z2752al9KBar2DdgF+dTzLgG05l2HgDTd9qVlxceH6gFLub4RAWTbbXzW/5NfmtxX5IpIhJgBR9n75tbh2kRKgx3ITROUQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(11063799006)(5023799004)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ODdPTnBEaTVzcDdpRXE5ZHR5MytVQUJnYThkTERJaDcvNWFPNVk5VUpqa09i?=
 =?utf-8?B?ZDkwZTE3UW9xUFNvWFd1emFldDd2dHMyaXd5TDZqak0wWHFyY0IvSEZkZ2FP?=
 =?utf-8?B?L2V5bHk4OUw0eFU2dWlZNW9XOHhQSmVodEZtMUZTSXF1NElxNU9HdkMza1JL?=
 =?utf-8?B?dGhrSDN3ZkwrVHRKZGhRdzJ3VWZ6NFQ1TE5NZG12L20zaUlyczk0Wk4vTzRn?=
 =?utf-8?B?b0dwblhCck9hcWVrVkdxZUFRZ24zRmVvbFhLZy9UTHdUOUd3OUllQnQvZ1Rl?=
 =?utf-8?B?VkNZWXQwSm5vN29hTXE2MTI0NWoxNGdRMW5xUGdNTkNZRzZMd2kwbFo1WC9k?=
 =?utf-8?B?RUJmdjh5bVRPYTFJTTBmODc0Q3dvcnJvV1lkb3JyQ1ZQUnNsQzRxY2NmLzNR?=
 =?utf-8?B?eEVyTFlKajV3dkVLaHltRi96RyttemNITmswcUo5NWJFL0IxMlRlejJ2ZExw?=
 =?utf-8?B?cEZkbzE2NHBXS0psbjV2clhZVFowVmRvMEZsWVJjMjNQN05waFQ1ZFAwNE9X?=
 =?utf-8?B?SlVyTlZqenQzVStMbWtKNDhONVJLblhqQUdWb2syV3FoWllBRy9HaTdyYVBS?=
 =?utf-8?B?V1lobStFbWJ0WWpaZk5JTktVT25lQjZ2RWdoZkFIcUt0T3hkRkJqcFRPaEhY?=
 =?utf-8?B?eDFWdndZR2hwRTY2Wk5nR2VUSndyb0k3QnpLYTJ3VmhHM2ZTTHEwQUM3RGdz?=
 =?utf-8?B?TWsyM3RxQlBQck1qMjFrS0QvTGhSU0xEYWt6SVYwenljQnhZYzkvQ2paUWFS?=
 =?utf-8?B?Y0VqNUErTjNTTzArRHgyVllIeUNpOTEzOW9qUzNYdDNuWGhUcTIxQ1dUVDJh?=
 =?utf-8?B?NGF3cGhYckh4S0UxK05pL2lDS2ZrTC9jS0k3QTgxbURGS2J5UzBkbEZKd1FT?=
 =?utf-8?B?dVlsNEJlM2x2Q0xzVWp2SlpBVHZ0VWRESnVkck9ZLzJPd0s1d1MrUU5mVTMr?=
 =?utf-8?B?eEN2ZFFLM25DdnFBUWRXV0dGZWU2c3pzSm9FL0ZoMm4veEFzckRVNy8vdTdr?=
 =?utf-8?B?OTBlYXNZWm9MemNNWTF2UWZDSWYwN05oRkxDaVg4TjNUOERMdWxQOENHYytU?=
 =?utf-8?B?UXF2bVVoT2xZeG82ODc5ZmlEQzVCeUpybDI0VlMyTWRNU1FTb2pZV3U5bklQ?=
 =?utf-8?B?OEwvL3VTWjJFOGpHNXZiSjhPc3ZKNGl1dktWanZLVEVRZHVDSW1JN0Fmckwz?=
 =?utf-8?B?NnlJSFQ4MTVBWWd2bzRqWkRUY3hPR2t6d0FhYzFYMjkyV0dxRWJWQjdMdlpi?=
 =?utf-8?B?TzdGTkpvQWhldVpkSkEvYTM0ZXB6ZFNGUE1XeElvbnB6UUZHeWg4cFNKcUt3?=
 =?utf-8?B?Y0FKOHdVSVkrNzhISGxwUU0wR3BKQzFYcDR1TDZ4VlZjYU5mTENOdWI1ZXJv?=
 =?utf-8?B?NmJybjhSMC9xS0t5SFR3Y0V2RjRwQnlqYjVuNWZENkcvQWZkWUx6UkxrVTll?=
 =?utf-8?B?Mk5tVzI3QlhON0lwWmx6bC84LzhleGtGbFdIZ0E5MVZzRi80bG9naTdxTHU1?=
 =?utf-8?B?RksyVlE3TE5XR1p5T1lMWVlYem4rckErOUVNUVQxdEFESjVaRU10WHNsNUtG?=
 =?utf-8?B?bjRGbGJhemVCT1ZkNmpuUTVDNjR3RnJHcEdUVUlObUJUTXh1YUZ3U2x3bVhO?=
 =?utf-8?B?dDRNdmgyYXRuZmZUdW1rMERVSktYNEpNLzhTTDBSSzA5Q1dxTVp3Q0hKaUFQ?=
 =?utf-8?B?RnE1NjZUREpzVnJHVm0wcVpQWUdqajU5d3psUkhHNUpIdXE2TndRdmFVTys3?=
 =?utf-8?B?QXlqTmxReUJpem1Yc3dVWUtoR29OaDRwREwvRVhSYUI3TnhxaUZOQVEwOWsy?=
 =?utf-8?B?RW5uOUhyUzgzUnpjb3VqZCtXYklNSGJGeUFqS0hVQlVrSVArU1RINkVHcHpa?=
 =?utf-8?B?Q0hYUW00ZkE3NXZ4Vm5uL1E2ajc1NkgvQUo3VnFzVnFqWDBZWmgrS3l6YjQv?=
 =?utf-8?B?ajdNekpMSUZSeERTaXU5aTVJMnN4Yi93TG5kM1dpZ0RDRDNZTWJRS01wckd4?=
 =?utf-8?B?TW9lZ2VVSWg5T21lWGhnTGFkTC9aTXJaczBBdEdTU0Z0a3NjeTVYTXFJUjI5?=
 =?utf-8?B?bFFwWW8yK0h5V2svNmI4bGNLdmduaDZidDN0Zmw2VTlWUSttY1dHQitKREcz?=
 =?utf-8?B?TEJWVWhhSCtBV2ZuT0p2UmM1eHFxdTB6bWZsMDJyTzBqdUF1NmhUOXk0ZUUz?=
 =?utf-8?B?Y1Z6T29sRWxrKzlJUFphVFFxUGVZTU9uL3daM3N2RGowNVF1SXBkOXg1TEtG?=
 =?utf-8?B?WmZJSHQ3SVRCOFVhaytPWGFEdE55aHJnZ0NIQUt3UC9LT0grOUNwMndvRkZ5?=
 =?utf-8?B?RXQvVTd6ZTA2ZTdUVHFwd2FQajRUTCswSFpDbUIrOWw1ZjQvc3BhTjB6WXFq?=
 =?utf-8?Q?8uTXS/Dvnk+Ha12/tmuUnhyutE6vb38QGoavn?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 973dfb94-0fd6-4e26-b01b-08df1425e852
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 19:08:35.3940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t5NYRtVCNXzxnex0SIvL912FSedlv3+RGojpmAp8Kt4TLDr4yk3Xr+dl3ZEps0uC0YmZviQUCReQT3v15q2TSoqXA8oDDGStYp8bQDdwQoDsM5y05XwLC5/KynzBDcXl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16032

PiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0K
PiBTZW50OiBNb25kYXksIFNlcHRlbWJlciAxNCwgMjAyNiAxMToyOCBQTQ0KPiANCj4gVGhhbmsg
eW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMiBwb3Rl
bnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gVGhlIHBhdGNoIHJlcGxh
Y2VzIGEgc3RhbmRhcmQgQVBJIGNhbGwgd2l0aCBhIGJlc3Bva2UgcG9pbnRlciBhcml0aG1ldGlj
IGhlbHBlciB0byByZXRyaWV2ZQ0KPiBwYXJlbnQgZGF0YSwgY2VtZW50aW5nIGFuIE1GRCBhcmNo
aXRlY3R1cmFsIGd1aWRlbGluZSB2aW9sYXRpb24uDQo+IC0gW0xvd10gVGhlIGNvbW1pdCBtZXNz
YWdlIGRlc2NyaXB0aW9uIHN0YXJ0cyB3aXRoIGEgbG93ZXJjYXNlIGxldHRlciwgdmlvbGF0aW5n
IE1GRCBzdWJzeXN0ZW0NCj4gZ3VpZGVsaW5lcy4NCj4gLS0NCj4gDQo+IGNvbW1pdCA4MDk4YzI1
NTA2NTVmOGJkZmE2YzdhY2QwYTRiMWRmYmM0ZTU3ZTJhDQo+IEF1dGhvcjogQ29zbWluIFRhbmlz
bGF2IDxjb3NtaW4tZ2FicmllbC50YW5pc2xhdi54YUByZW5lc2FzLmNvbT4NCj4gDQo+IG1mZDog
cnotbXR1MzogZG8gbm90IHVzZSBzdHJ1Y3QgcnpfbXR1M19jaGFubmVsOjpkZXYNCj4gDQo+IENo
YW5uZWxzIDEgYW5kIDIgYXJlIHVzZWQgYnkgYm90aCB0aGUgUFdNIGFuZCBjb3VudGVyIGRyaXZl
cnMuIEJvdGgNCj4gc3ViZHJpdmVycyBhc3NpZ24gc3RydWN0IHJ6X210dTNfY2hhbm5lbDo6ZGV2
IHRvIHRoZWlyIG93biBkZXZpY2UNCj4gaW5zdGFuY2UgZm9yIHRob3NlIHNoYXJlZCBjaGFubmVs
cywgc28gdGhlIHZhbHVlIHN0b3JlZCBpbiBpdCBkZXBlbmRzIG9uDQo+IHdoaWNoIHN1YmRyaXZl
ciBiaW5kcyBsYXN0Lg0KPiANCj4gPiBtZmQ6IHJ6LW10dTM6IGRvIG5vdCB1c2Ugc3RydWN0IHJ6
X210dTNfY2hhbm5lbDo6ZGV2DQo+IA0KPiBbU2V2ZXJpdHk6IExvd10NCj4gRG9lcyB0aGlzIGNv
bW1pdCBtZXNzYWdlIHN1YmplY3QgdmlvbGF0ZSB0aGUgTUZEIHN1YnN5c3RlbSBmb3JtYXR0aW5n
DQo+IGNvbnZlbnRpb25zPyBUaGUgZ3VpZGVsaW5lcyBtYW5kYXRlIGNhcGl0YWxpemluZyB0aGUg
ZGVzY3JpcHRpb24gYWZ0ZXIgdGhlDQo+IHN1YnN5c3RlbSBwcmVmaXgsIGUuZy4sICJtZmQ6IDxE
cml2ZXI+OiA8Q2FwaXRhbGl6ZWQgZGVzY3JpcHRpb24+Ii4NCj4gDQoNCkFjay4NCg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21mZC9yei1tdHUzLmMgYi9kcml2ZXJzL21mZC9yei1tdHUzLmMN
Cj4gPiBpbmRleCAwYTI1NGU2MWVjMGE1Li5kODA5NDM2ZTIxMjRjIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvbWZkL3J6LW10dTMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWZkL3J6LW10dTMuYw0K
PiA+IEBAIC02MCwxMCArNjAsMTcgQEAgc3RhdGljIGJvb2wgcnpfbXR1M19pc18xNmJpdF9zaGFy
ZWRfcmVnKHUxNiBvZmZzZXQpDQo+ID4gIAkJb2Zmc2V0ID09IFJaX01UVTNfVENOVFNBIHx8IG9m
ZnNldCA9PSBSWl9NVFUzX1RDTlRTQik7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW5saW5l
IHN0cnVjdCByel9tdHUzX3ByaXYgKnJ6X210dTNfY2hfdG9fcHJpdihzdHJ1Y3QgcnpfbXR1M19j
aGFubmVsICpjaCkNCj4gPiArew0KPiA+ICsJc3RydWN0IHJ6X210dTNfY2hhbm5lbCAqZmlyc3Rf
Y2ggPSBjaCAtIGNoLT5jaGFubmVsX251bWJlcjsNCj4gPiArCXN0cnVjdCByel9tdHUzICptdHUg
PSBjb250YWluZXJfb2YoZmlyc3RfY2gsIHN0cnVjdCByel9tdHUzLCBjaGFubmVsc1swXSk7DQo+
ID4gKw0KPiA+ICsJcmV0dXJuIG10dS0+cHJpdl9kYXRhOw0KPiA+ICt9DQo+IA0KPiBbU2V2ZXJp
dHk6IE1lZGl1bV0NCj4gRG9lcyB0aGUgaW50cm9kdWN0aW9uIG9mIHJ6X210dTNfY2hfdG9fcHJp
digpIHZpb2xhdGUgTUZEIGd1aWRlbGluZXMgZm9yDQo+IHBhcmVudCBkYXRhIGFjY2Vzcz8NCj4g
DQo+IFRoZSBNRkQgZ3VpZGVsaW5lcyBleHBsaWNpdGx5IHN0YXRlIHRoYXQgY2hpbGQgZHJpdmVy
cyBtdXN0IGRpcmVjdGx5IGFjY2Vzcw0KPiBwYXJlbnQgZGF0YSB1c2luZyBzdGFuZGFyZCBBUElz
IChsaWtlIGRldl9nZXRfZHJ2ZGF0YSkgYW5kIHRvIGF2b2lkIHdyaXRpbmcNCj4gYmVzcG9rZSBo
ZWxwZXJzIGluIHRoZSBwYXJlbnQuDQo+IA0KPiBXaGlsZSB0aGlzIHJlcGxhY2VzIGRldl9nZXRf
ZHJ2ZGF0YShjaC0+ZGV2LT5wYXJlbnQpIHRvIGF2b2lkIGRlcGVuZGluZyBvbg0KPiBzdWJkcml2
ZXItcG9wdWxhdGVkIHN0YXRlLCBzdWJzdGl0dXRpbmcgaXQgd2l0aCBhIGN1c3RvbSBoZWxwZXIg
dXNpbmcgcG9pbnRlcg0KPiBhcml0aG1ldGljIChjaCAtIGNoLT5jaGFubmVsX251bWJlcikgdGln
aHRseSBjb3VwbGVzIHRoZSBpbXBsZW1lbnRhdGlvbiB0bw0KPiB0aGUgcGh5c2ljYWwgbGF5b3V0
IG9mIHRoZSBjaGFubmVscyBhcnJheS4NCj4gDQo+IENvdWxkIHRoZSBjaGlsZCBkcml2ZXJzIGJl
IHJlZmFjdG9yZWQgdG8gcmV0cmlldmUgdGhlIHBhcmVudCBkYXRhIHRoZW1zZWx2ZXMNCj4gaW5z
dGVhZCBvZiBpbnRyb2R1Y2luZyB0aGlzIGJlc3Bva2UgYWNjZXNzb3I/DQo+IA0KDQpJZiB3ZSB3
ZXJlIHRvIHJlZmFjdG9yIHRoZSBjaGlsZHJlbiB0byBwYXNzIHRoZSBwYXJlbnQncyBzdHJ1Y3Qg
ZGV2aWNlDQoob3Igc3RydWN0IHJ6X210dTMgdmlhIGRldl9nZXRfZHJ2ZGF0YSgpKSwgd2UnZCBo
YXZlIHRvIGNoYW5nZSB0aGUgQVBJDQphbmQgdXBkYXRlIGFsbCBjYWxsIHNpdGVzLg0KDQpXaGF0
IHdlIGNvdWxkIGRvIHJhdGhlciB0aGFuIHRoZSBjb250YWluZXJfb2YoKSBzb2x1dGlvbiBJIGlt
cGxlbWVudGVkDQpoZXJlIGlzIGFkZCBhIGJhY2twb2ludGVyIHRvIHN0cnVjdCByel9tdHUzIGlu
IHN0cnVjdCByel9tdHUzX2NoYW5uZWwNCmFuZCBwb3B1bGF0ZSBpdCBpbiB0aGUgTUZEIGRyaXZl
ci4NCg0KQnV0IGNvbnRhaW5lcl9vZigpIGdldHMgdGhlIHNhbWUgZGF0YSB3aXRoIG5vdGhpbmcg
bmV3IHRvIGJlIHN0b3JlZCwNCmFuZCBzdHJ1Y3QgcnpfbXR1M19jaGFubmVsOjpkZXYgY2FuIGJl
IHJlbW92ZWQgZW50aXJlbHkgYWZ0ZXJ3YXJkcy4NCg0KSSB3b3VsZCBhcHByZWNpYXRlIHlvdXIg
ZmVlZGJhY2sgb24gdGhlIGRlc2lyZWQgYXBwcm9hY2ggaGVyZSwgTGVlLg0K
