Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2107.outbound.protection.partner.outlook.cn [139.219.17.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F2386341
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 02:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784082326; cv=fail; b=nrV82j1kKp8mZHQK5QkJSjawrrijuuqbSVUEP5p8ra/OuMY/ne5H2qLjz+cs+t4eqMHbVvzVpgjCyLgKx0hvH6X2IH43Jm/NxwmysO+aPgNAiZUN5yBtcAb52Bp0yB4ivYoBdbiqXSEVCx5F6tc9tKNwvHnq0XmSZV9QoRI192c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784082326; c=relaxed/simple;
	bh=KhvsC13fwJ2GLgPXAZXqJeIJVS+C0pRzwoM7Qr+fZ0M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sKuA+T1GkBcp0uVrrvnGGgBSZVFjWlPX23KPLZjqXrBhAOyyVR1qerA2Ya2q/7HJCrJbZeoz834uDGIs1N8fHq7vzIeXh5cYzIq3Gble8hEuAkpRat0GvAlK27QTQrf+esEnrtEq0ziF0AnaWUsHcNxmzkVxR+luFcgOZ1pTZqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X109g2zmInCu7kO7pQIC4M+rIOg3O0oo0BlATHUVILXaN5TLiGY+v6UICji3OK1DFeSX0I8mz126gafTf+kB3lgzMdiIIayejWRLJdBc9t7gKVmeUgZVlEkqeOL9LCrfWfXP56HvGZVFGHPKk8PQsJCcQ+mny0TxO57HiaKgf5nTqM1Yc7ET36ypzGugimDy89co9W0pYuBPT9u2JJUBaRtP8a8DMbdgqgkP6tgpM9OI9XTTMPsAr+JCIMXlWvozSSH+01wwT4PnP0mvvF+3+yL5KdcRsd7Guv0FUxa1wgjt8W/O5EcYdddqYVHrCcy90M7vNOV6evDXvhilCNj7tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhvsC13fwJ2GLgPXAZXqJeIJVS+C0pRzwoM7Qr+fZ0M=;
 b=UVvypjOHNhSNVZLTSCsBpBD0Ojq36CZ7FMi+N0vYtM2Jvo/x7O9po79gPQFTE5S2DlAW6JtTRbrajfzQGzEd3c5ejXwi3jnCArklf1lFBROpZPNVoEdA+v1FaZeQHq5A30TpXF8gwkqYGbBZf61dtyLuKSA8mkO0CwUB/fBc1WUyPVDNhdNMsxCXmrTVG7FD15f5nv4S4mPwHgBcLMf4G0nhxFXRRdtYJJZVHG7o7dmvXo8X3whQIQV7HNnrgssgaE1EMJZ22/CDWH+Vh4vlN7B98xTxJ8ERGQh4XkZpUBum1dPaPsVTOg4RUsUjf+dv8ctXLb7/twof2Oc+2G4eLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1146.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:11::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.23; Wed, 15 Jul
 2026 02:25:10 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::4386:5cc4:3bc4:4795]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::4386:5cc4:3bc4:4795%3])
 with mapi id 15.21.0139.024; Wed, 15 Jul 2026 02:25:10 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v22 2/3] riscv: dts: starfive: Correct pwm nodes
Thread-Topic: [PATCH v22 2/3] riscv: dts: starfive: Correct pwm nodes
Thread-Index: AQHdE0ExmPqHPPnJUUicdDSSyJwm77ZsX7+AgAF8DoA=
Date: Wed, 15 Jul 2026 02:25:09 +0000
Message-ID:
 <ZQ2PR01MB13070E253E038C26E43C63C3E6F82@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20260714033050.44952-1-hal.feng@starfivetech.com>
 <20260714033050.44952-3-hal.feng@starfivetech.com>
 <20260714034453.8AA771F000E9@smtp.kernel.org>
In-Reply-To: <20260714034453.8AA771F000E9@smtp.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1146:EE_
x-ms-office365-filtering-correlation-id: 697e8d2e-5cd8-4ea4-56f8-08dee2184b17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|22082099003|18002099003|6133799003|4143699003|3023799007|56012099006;
x-microsoft-antispam-message-info:
 tluZtv4rEw5LuWVFUQLi2C5ZjKC12zjtKvsfli40TrMVsshDlWMMRUL+j0yCqUcTmB0ouaInJaANFomsjzP59AKaunMUt/DMPFH4OEZQdokQDbdRtMuFjrmoDuQoDvM1A3UFlO/Gm8ellGFlIrON/VQxAYIE0CTcvbbniDsQ7K7qbGq0PCJes9YbJ4lzeCo4ZvwpSyiEj+Ns7FeHrM6lMBxRsu6DVQgDxQ8Oqw+U2C54lzh3W9j+C+NgsNp7/h8M8HKgZJkcCQcKQ/dSK5NCBf99FQNWB8qvw/wtjtwTYgE0+20bwRvIpfs10neF5YovRMsmbi7PgJxYFiaAJKs1V/Ccj/D426W4S+flybhYf7A20k74Lh0TnsG/bReJA9tLPozeheX4iCXh1oE7oLOeeoTa218WVxCZ1TB93eoEoDXSPpWy/92+2etvVeyyOSpQ0zdOnlwUsqjTrN/hph7x8NSMLqCwFGi5M5AaohzPQA1CV0YVtOxbwSlbzQhnN76dNKGtypzpZJIE60HoaVycTi3JlPKnTJlgMmOUeo2iQx8Fbvfio5eOSxxNrFD0tBBY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(6133799003)(4143699003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWtQeFJVU1F4UFpIMDJwQzdTUGRlOWFOYm9pcWFPWnZqQU9nZFNqZ254ZFZB?=
 =?utf-8?B?UXZWZVRGRFdSeVowdDVIWlBkd3U2TTBKZUp2WjM1aDkyK203SmVrdFRrdndH?=
 =?utf-8?B?bERJTmQ5dnV2eTk5dElHbWFHVUk5dENYOXFENmx5ZlloTEhSdnh2RFUzYVQz?=
 =?utf-8?B?Q3JEQjJpOUdZN3RLTnVUYTVKaUw5ZWJydlloMEozcUJLdit4dnV4UXJhOU9C?=
 =?utf-8?B?TEtSRXFGYlppcjhvRWd1NTFDdThHUTN1a1hoQnlOVndCbzAxbHZGVExpZHZK?=
 =?utf-8?B?Wm1PcGZYbzJZWWdDd3BUcThzNjk1OGtDK0ROQnRaaG1aNXBIYXg1TTFvaDJG?=
 =?utf-8?B?dVZtZ09MbWRLbTU2b3VmM3h1WEM0RzMxUkdXTHB2ZDFldWhkTld5b2w5WVM2?=
 =?utf-8?B?MHpoSENjN2RWbXlBVFoydXNSL2tHV0VXYjkvdzZwalFhdVVKbm5QTm9sVUNp?=
 =?utf-8?B?V0NkbFJueXNOT284NG1SNzdKdUZ5RUxzL3gvMmJiZXRXQzB5MEg2RFdZdy9D?=
 =?utf-8?B?NnB4NCsrQ0tBT2dtaitxa2x3c3J5Q052MVpxajNWcXBNWUJuUktqOXphMG5K?=
 =?utf-8?B?VWRDZ21tdm5semRYUTNHOGRIZEwzVk9nSEN5WVlnM3RRMFpzWDFOenFyMXYy?=
 =?utf-8?B?dlRDaDZPQ2tXcUN2cEJCcWd4T0NmTURsbUdremtFLzBzaUpIYmcwRU1qbDFV?=
 =?utf-8?B?VEkyVW53c0dhcHVDWXBaQnhYaFhhMitCYld1V2ZKUDc1YytmZVRuMDU4UVdv?=
 =?utf-8?B?QTY0eGNUZWhXQzBkaFdueFpjRUFTMGIwbWRyUEgwdy9zakFCYjZseE9MNDlF?=
 =?utf-8?B?YmRpRlZRY0ZmcDgvdU1UTTJGOVhzNTRwY1A4SHdqR1I2eGdIZEtQN1p1enNU?=
 =?utf-8?B?d0NhTU15Vm5NemhhbElCbmkxMWlqN1YwdkVlWmxZaFQxMjNtT1liWmNvY2cx?=
 =?utf-8?B?VmltSHhVNDV4LzRBL2RTa2pyZWpJNmpHQ2xIaVdGZUNsVTZUY0QyVHVNUDBu?=
 =?utf-8?B?SG9icllqTXllK3RhYVRVcHUrUVpsYnpiSVhNaWRRT2hzZGxHS1U1cW9TSWhT?=
 =?utf-8?B?cHNVTG01Mi8yRFVYM0p5cUwwcXBLRWpYYUhNaXZSeVdxejIwUGZwTlNXYXdD?=
 =?utf-8?B?azcrK3hZQ1VDYWxWaXV4LytLRmpSUTFVellXZWtvUkF1OWtiU0ZGb0F3Q2dv?=
 =?utf-8?B?dnhxSTNTdlFIVXcxSCs4SlY3M202SkRiNUl3UFdLRCt2YlhjS1lQcVh4Z3U2?=
 =?utf-8?B?OHpOelhzbXcwc1NKZ1p3Uk9RR05yZmdHK25jbVVhRmpwNC9hNzZVVkg0NGdk?=
 =?utf-8?B?UHZmVjhNTEh4NFRxZ3VXKzF4YVYyR005azlpSllqVmNKWnRqckZuQlZrTTZo?=
 =?utf-8?B?Mm1QUUJucGxWQ0E1QVF4ZDliUmp4eVNLZVd3RXJTWUlxRGY5OGlSVzc2OU1w?=
 =?utf-8?B?UEFKcGRUcldiWlgxMkJjYW9Rc1FpQk1mQjZVWnJHb2FrcXpJeWNHa2pwYlBi?=
 =?utf-8?B?WVYyVkxQSkdLT0w5VXFsb0lqTWZGTFlaMmpxQVhiQjd2WUl4aThDbm52cTBQ?=
 =?utf-8?B?YmdmeStSRHN6V1BJRkhNaUliNERqVGJsa1dMR1FYeUlLK3paZDY5cTQyRjlw?=
 =?utf-8?B?cjNYcTJablRrTUU2N2JNM0lhWitoWi9wSjN1QUlDMWl5d3dib3RFbVpnazU0?=
 =?utf-8?B?VlF3ZTROUC9tdHkyUFZGbGp1ZndCSGVPa21razZ0NDRNNGZaeFFrZUpieE15?=
 =?utf-8?B?ZlA2Z2xhaGJySFBzcS8xMERLMmxHRS81cFFBTVZ2WVF4QXR6cWtBTGxjWk9C?=
 =?utf-8?B?NVErUDhZY1ZFVmxoelBhV2orMlhPTTJrRC9qQmZLWWRySWZBTlgyN2NibFVo?=
 =?utf-8?B?dG1LQmxKTVoyTWJlQlg2cVRXckdLc0o3OTUzMyt4SkNGWHhNYXZ1TmR2M1hk?=
 =?utf-8?B?cjNXT3JtMFdNUUppOUIyL1FhOGNuYUgvTTRGbjI1SFVqZ1VGYURiU2dPajdI?=
 =?utf-8?B?aG9sUXlIb291UitjeEo0Qyt6cm1LcnA2WnFNVzBBZ2xENy8vaEpoZHpUTy9u?=
 =?utf-8?B?UUgxV1NTMSt0ajZsL3V3dnlhbGJBby9BbGZIUnB1TnNwY2tJbW9zTngzODFJ?=
 =?utf-8?B?V0V0Mm9zZjJ3QlB3R29pV0I1NDFKVFdUOFArMjdjMmZXdXJsM2JpbmxSdUdl?=
 =?utf-8?B?dEwzbndnZEFYWE5xTE5rVTBQMzcxTDZwQm5URHp1M2pVbzU4anFhU3VpaUJk?=
 =?utf-8?B?dGQrYUZpZzNQZktwY2VGcEdBNjd1VkRyY0JOSEEwbEFYc3lveWc0ajFUemc4?=
 =?utf-8?B?d2tJZXFXWUZ5TnVZYlhmclI5TG8wOUVoVm5PMWtqWlkvZjFqWXhCdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 697e8d2e-5cd8-4ea4-56f8-08dee2184b17
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2026 02:25:09.9841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YzYm83+RIrNULXgpVpS3PJPG6sFMouVLtfZ7R0meWpHUSqeY8iIkcD1fYgXZUspR3eBZfdRFMbOgVnPpGmPQnfxsy49jvl+DakWtpLeR0QQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1146

PiBPbiAyNi4wNy4xNCAxMTo0NSwgc2FzaGlrby1ib3Qgd3JvdGU6DQo+IFRoYW5rIHlvdSBmb3Ig
eW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlz
c3VlKHMpDQo+IHRvIGNvbnNpZGVyOg0KPiAtIFtNZWRpdW1dIE1pc3NpbmcgZWxlY3RyaWNhbCBw
YWQgY29uZmlndXJhdGlvbiBwcm9wZXJ0aWVzIGluIGBwd20xX3BpbnNgDQo+IGFmdGVyIG5vZGUg
c3BsaXQuDQo+IC0tDQo+IA0KPiAtLS0gUGF0Y2ggWzJdOiBbUEFUQ0ggdjIyIDIvM10gcmlzY3Y6
IGR0czogc3RhcmZpdmU6IENvcnJlY3QgcHdtIG5vZGVzIC0tLQ0KPiBjb21taXQgYWYzZDVlOTkw
NWFjZGVhZDllMjgxNmQwOWYxM2YwNTRiMTc5Y2JkZQ0KPiBBdXRob3I6IEhhbCBGZW5nIDxoYWwu
ZmVuZ0BzdGFyZml2ZXRlY2guY29tPg0KPiANCj4gcmlzY3Y6IGR0czogc3RhcmZpdmU6IENvcnJl
Y3QgcHdtIG5vZGVzDQo+IA0KPiBFYWNoIG9mIHRoZSBTdGFyRml2ZSBKSDcxMDAvSkg3MTEwIFNv
Q3MgaGFzIDggT3BlbkNvcmVzIFBUQyBJUCBjb3Jlcy4NCj4gT25lIE9wZW5Db3JlcyBQVEMgSVAg
Y29yZSBjYW4gb3V0cHV0IG9uZSBQV00gY2hhbm5lbC4gQ2hhbmdlIHRoZQ0KPiByZWdpc3RlciBz
aXplIHRvIDB4MTAsIHNpbmNlIGFuIE9wZW5Db3JlcyBQVEMgSVAgaGFzIG9ubHkgNCAzMi1iaXQg
cmVnaXN0ZXJzLg0KPiANCj4gRml4ZXM6IDhkMDFmNzQxYTA0NiAoInJpc2N2OiBkdHM6IHN0YXJm
aXZlOiBqaDcxMTA6IEFkZCBQV00gbm9kZSBhbmQgcGlucw0KPiBjb25maWd1cmF0aW9uIikNCj4g
Rml4ZXM6IDVlNTk4Yjk5ZmVkZiAoInJpc2N2OiBkdHM6IHN0YXJmaXZlOiBqaDcxMDA6IEFkZCBQ
V00gbm9kZSBhbmQgcGlucw0KPiBjb25maWd1cmF0aW9uIikNCj4gDQo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTAwLWNvbW1vbi5kdHNpDQo+ID4gYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEwMC1jb21tb24uZHRzaQ0KPiA+IGluZGV4
IGFlMWE2YWViMGFlYWEuLjg1MTA2NTQ1MDkwZWEgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMDAtY29tbW9uLmR0c2kNCj4gPiArKysgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEwMC1jb21tb24uZHRzaQ0KPiANCj4gWyAuLi4gXQ0K
PiANCj4gPiAtCXB3bV9waW5zOiBwd20tMCB7DQo+ID4gLQkJcHdtLXBpbnMgew0KPiA+ICsJcHdt
MF9waW5zOiBwd20wLTAgew0KPiA+ICsJCXB3bTAtcGlucyB7DQo+ID4gIAkJCXBpbm11eCA9IDxH
UElPTVVYKDcsDQo+ID4gIAkJCQkgIEdQT19QV01fUEFEX09VVF9CSVQwLA0KPiA+ICAJCQkJICBH
UE9fUFdNX1BBRF9PRV9OX0JJVDAsDQo+ID4gLQkJCQkgIEdQSV9OT05FKT4sDQo+ID4gLQkJCQkg
PEdQSU9NVVgoNSwNCj4gPiArCQkJCSAgR1BJX05PTkUpPjsNCj4gPiArCQkJYmlhcy1kaXNhYmxl
Ow0KPiA+ICsJCQlkcml2ZS1zdHJlbmd0aCA9IDwzNT47DQo+ID4gKwkJCWlucHV0LWRpc2FibGU7
DQo+ID4gKwkJCWlucHV0LXNjaG1pdHQtZGlzYWJsZTsNCj4gPiArCQkJc2xldy1yYXRlID0gPDA+
Ow0KPiA+ICsJCX07DQo+ID4gKwl9Ow0KPiA+ICsNCj4gPiArCXB3bTFfcGluczogcHdtMS0wIHsN
Cj4gPiArCQlwd20xLXBpbnMgew0KPiA+ICsJCQlwaW5tdXggPSAgPEdQSU9NVVgoNSwNCj4gPiAg
CQkJCSAgR1BPX1BXTV9QQURfT1VUX0JJVDEsDQo+ID4gIAkJCQkgIEdQT19QV01fUEFEX09FX05f
QklUMSwNCj4gPiAgCQkJCSAgR1BJX05PTkUpPjsNCj4gPiAgCQl9Ow0KPiA+ICAJfTsNCj4gDQo+
IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBTaG91bGQgcHdtMV9waW5zIGFsc28gaW5jbHVkZSB0aGUg
ZWxlY3RyaWNhbCBwYWQgY29uZmlndXJhdGlvbiBwcm9wZXJ0aWVzPw0KPiANCj4gV2hlbiB0aGUg
cHdtX3BpbnMgbm9kZSB3YXMgc3BsaXQsIHByb3BlcnRpZXMgbGlrZSBiaWFzLWRpc2FibGUsDQo+
IGRyaXZlLXN0cmVuZ3RoLCBpbnB1dC1kaXNhYmxlLCBpbnB1dC1zY2htaXR0LWRpc2FibGUsIGFu
ZCBzbGV3LXJhdGUgd2VyZQ0KPiBjb25maWd1cmVkIGZvciBwd20wX3BpbnMuIEhvd2V2ZXIsIHB3
bTFfcGlucyBvbmx5IGhhcyB0aGUgcGlubXV4DQo+IGNvbmZpZ3VyZWQuDQo+IA0KPiBXaGVuIHRo
ZSBrZXJuZWwgYXBwbGllcyB0aGUgcGluY3RybCBzdGF0ZSBmb3IgcHdtMSBkdXJpbmcgcHJvYmUs
IGl0IHdpbGwgb25seQ0KPiBjb25maWd1cmUgdGhlIHBpbm11eCBhbmQgc2tpcCB0aGUgcGFkIGVs
ZWN0cmljYWwgc2V0dGluZ3MuIERvZXMgdGhpcyBsZWF2ZSB0aGUNCj4gUFdNMSBwYWQgaW4gYW4g
dW5kZWZpbmVkIG9yIGRlZmF1bHQgZWxlY3RyaWNhbCBzdGF0ZSB0aGF0IGNvdWxkIGNhdXNlIHdl
YWsNCj4gc2lnbmFsIGRyaXZlIG9yIG90aGVyIHNpZ25hbCBpbnRlZ3JpdHkgaXNzdWVzIGRlcGVu
ZGluZyBvbiB0aGUgaGFyZHdhcmUNCj4gZGVmYXVsdHM/DQoNCk5vLCBJIGFkZGVkIHRoZSBuZXcg
ZWxlY3RyaWNhbCBwcm9wZXJ0aWVzIGZvciBwd20wLXBpbnMsIHNvIHRoZSBvbGQgZWxlY3RyaWNh
bCBwcm9wZXJ0aWVzDQphcmUgYXBwbGllZCB0byBwd20xLXBpbnMuIFlvdSBvbWl0dGVkIHRoZSBv
cmlnaW5hbCBjb2RlIGFuZCBnb3QgYSB3cm9uZyByZXN1bHQuIFBsZWFzZQ0KYXBwbHkgdGhlIHBh
dGNoZXMgdG8gdGhlIG1haW5saW5lIGJlZm9yZSB5b3UgcmV2aWV3IHRoZW0uDQoNClRoZSBzYW1l
IHJlYXNvbiBhcyBJIGV4cGxhaW5lZCBiZWZvcmUuDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvWlEyUFIwMU1CMTMwN0U1OERCRTNEM0VBMkRDQTlCRTlBRTYxNjJAWlEyUFIwMU1CMTMwNy5D
SE5QUjAxLnByb2QucGFydG5lci5vdXRsb29rLmNuLw0KDQpCZXN0IHJlZ2FyZHMsDQpIYWwNCg0K
PiANCj4gLS0NCj4gU2FzaGlrbyBBSQ0KPiByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8j
L3BhdGNoc2V0LzIwMjYwNzE0MDMzMDUwLjQ0OTUyLTEtaGFsLmZlbmcNCj4gQHN0YXJmaXZldGVj
aC5jb20/cGFydD0yDQo=
