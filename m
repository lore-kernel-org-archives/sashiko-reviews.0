Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC5F3FE644
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 05:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790053686; cv=fail; b=Mn1i/XnwlPVIItZRkw+vVfrx4GMAod+rWAp9w0BP6qRG0n5UlgUhP22w2R+BEDOrxiHYrzh91ZiKDgNQ4rLZje8cQ/6pAdD8oRllv7V0+CB2pM2Pkj1GZP0FbAKX8fJtMxcu+7xG/kcVLuy2QH7v/6IqSzwZr6AFXMNGLR2Q9B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790053686; c=relaxed/simple;
	bh=Tdl1E3wQ6DphgEwncAlg1HitHSOKIU0ruuzNEi6EV0o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qhrFggfO0BxjW86DtbptmMER41GHvywVevf2CAXvK1VvFYr0H21SzbtARb0bOxOhYTiJ+l8hvZNAVPzoyZIUxCzC1MgvSNVMPCh0V3HlMSpEL/3uNP3u1jEfuMXNzANwKVwkKsQeOuMF0ZlVQixZalluRQMkxb1Y+xTKdQYViRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=izlDoRM6; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="izlDoRM6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rU7cvvfe2NYlTSe5RyBFa1hh8AlUjdNohCuPUNbA5qnFeCLVjJmy+QKKhZQs01KgUVedNgWNblGNWGI9EB5p9C44Yg6O4dVqiR1lCNZCStk6FlX1ftET8Cjdp/o1hM6DwkWRcQYN7IIr0mfaLK+Of3tEDqsWtjr+jUlwGK+PsxaJ+/AixNxAWxZ1jPIJqxcF+pKlz+Q6JWe4Y72t0KRTLbS04G4FIsNhvNZTuuh+DoA+p06In0EnrUPOcQAFoPoY/MXnbz/l4T83nAlUiorSsyxq/5DjcJ7Sy8o+kZFdjiq4JjA/C6/25xHzfD4erZ4uaVBJ8o2Cj0T3DbpIjC+3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tdl1E3wQ6DphgEwncAlg1HitHSOKIU0ruuzNEi6EV0o=;
 b=bERUPnBjkCE92XqSHJXcEeAxEpDAAuGL1MVhwCwF/xRxnezCxh9JgFfJEOc+w29rBSsbazemBKgXg9bJ6NeELlhZgicWv9fQDxNBzANvynlVFf5I9dwEAsL4ufY7Gz1H5XzOxCWwwmEdc9BtMj9FFuEiLCxGaI51hzyshW9KMKLQ00U3cvZM2BKALz6CDr5oQKGPLp1cfX2xRxflAka//0XldDTx+PjRN7qksgYd1QrhaNeoJRHgpwg4XKFvohlVWc80wfbHkKzSMUrY4DRyXJWx/au5kFcyJNt9OcGSeqFHCF1Yv8GyDsrPyEaI0x24lzzAYtZmpPYraeGV8C3L9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tdl1E3wQ6DphgEwncAlg1HitHSOKIU0ruuzNEi6EV0o=;
 b=izlDoRM6CHLmFVG/1OgEPiz4bc6IQ3qOUsAEtKxxwacMwh4woIu5/5ySyBTpfCg0DhsBz995bZqHDxv266Lzc9kn1rEiSYUqZv5TQXed6XSLB0444x94a0fFPYX+RtwfPQcwPWz5bjj4dlsppBNJ++JQkga5/Pe4hEcoQjtjKhk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB17065.jpnprd01.prod.outlook.com (2603:1096:405:339::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 05:07:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 05:07:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v3 8/8] arm64: dts: renesas: r9a08g046: Enable TSU
Thread-Topic: [PATCH v3 8/8] arm64: dts: renesas: r9a08g046: Enable TSU
Thread-Index: AQHdSkrWvC14B112yk2j/j1H5umxfbbaBWOAgAAFvAA=
Date: Tue, 22 Sep 2026 05:07:59 +0000
Message-ID:
 <TY3PR01MB11346E11D58AABA063062A01F86832@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260922042707.116378-1-biju.das.jz@bp.renesas.com>
 <20260922042707.116378-9-biju.das.jz@bp.renesas.com>
 <20260922044402.02C321F000FF@smtp.kernel.org>
In-Reply-To: <20260922044402.02C321F000FF@smtp.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB17065:EE_
x-ms-office365-filtering-correlation-id: eb5cca1e-16f0-4145-2731-08df186778a4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info:
 Ira53iCbXTv5LE3B/8uMQFfj0xT0G+8EulApPD7xrM+DIGPswblLxM/oku0LQAYhQfiYElpkAAe8abx3LvCbVQ5/r7RoZQ+JPVfHNWy2n2jrAvafaNSpZEE1Oj0UU0+DTdE4An1ZRQaqYBACr10Tt0Xj5P6gvnGsWmlHXXoKdH/JQClB42B3ItrA/JGs5e5669CNszegZA9FUfEyq1bJ3Pf4H3ALkm+kOg3A7+dRFq+iER17TtBKUFlX/jqztUKCv46BVVOBSSx+rB5YQuVMfrzDq1UIXs+wMFwUzh1OGt/LZQvUdfMT2cX9gQxrwvQ0J5JoqI68lfoijCOE4b8v8efGiiVB9GZc65OA11qlAaP8n8vtF1tz/Me/sg640fJ2dJ0m7HXeHY0UXrGK3yTo+lrTvQJqU177kXEPylJ86YSoSBetoozD7FuPJevpk50T2z/ADSdxq8mbksNJKqplVbpmonjRNki9uA2njbbJoLC1XzPKY1srw99sTqtznFALi21MrZQE30CN+YQ+s/tStJRZkk3l9vYJjTLYoiO0m1KH4WqXUBLhXqSjAeJiXfux8AS9EKIwSS+gqzyH+ats6oxThendNCHBNBjdnRCr0GWK0mnhdlpFxy90Api3TuTlndB62DfBf6r3ZSB+bQ+UQ6se1yPkc4mxlSLX7Y0QYEA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RU1MUzZnRlhtbDVnd0twVkw3QjNFZ0JZdmNyeEJWTTZMNVZWV1I0aVgvbjlF?=
 =?utf-8?B?TmR3TU9kT3BobDQzaUk1MHd1WU45bHQ2SjNxTFJLVklQY3lieTBjTjF3OVpH?=
 =?utf-8?B?T3ZBdTVKTWVMY1VtZklZbklwc3hxeENZQzRmVTA2aVlGaVlvOVJjQ2hSKysz?=
 =?utf-8?B?RDUyK3kxb1JHSFR0OGJtcHlKaldVTDJXNk1KMU4xelhHUFZJTm03bk1Vb1Rh?=
 =?utf-8?B?VlJqRVovRlBjUEVOMGRiVzdqZWlrVngvakVCS1hkZkE1NGRzZk5XaGdNemFW?=
 =?utf-8?B?YXd3SUsxSUptZ3c5dWYxaHJPK21kTkhEdmUxT2xzM2VmNXFVYUlseENjRURq?=
 =?utf-8?B?WXViLy9XT1lsTW96ZUJWWGtWY1dtbkdMWmdDanJ1R3luZDVaZGxEZGprUkNW?=
 =?utf-8?B?RTFwb1BlR3QvdFBtMEdHNGYyZFpId2lIZER3eHdSdDJyM2RzV0hLdk9SVUZC?=
 =?utf-8?B?QnJNamNmOGlJRzVsbDYwL1dHYUw2R205UjQrSDZYSytldXVOMjN1MEFMVG5L?=
 =?utf-8?B?OCsrQUI5RzBHRnVnS2VvTHFnS0lYSmVxUnNYaUhwUk1QN05xZzlJWXNyb1h4?=
 =?utf-8?B?NEx2eGZwNmVnZytZcjRUY2VqTHlzUXNoNTlMVUZHVUM0SUpnTURSTkYvT1Fu?=
 =?utf-8?B?aDF2akFjNmFoVFRGM1VxMnlyNmhxWVpnZmlkZG5tTzNVZVFiWGxQMC9HUHpl?=
 =?utf-8?B?VGFya0tuUWwrWUdoMXg0Z0l4K0JDRmdsb0R1b2VrZHBFSkNYRkVDQ2MrdG9i?=
 =?utf-8?B?NEhNQUl5cS83YlF6c253WE9vd0x0OHNRUjFZOEtFT0d0QVZPWHZ6MjFlb0Nu?=
 =?utf-8?B?TUpjL1A2MjJoVUFvNEJGcmRIVXVCWEFwRkw1bkhkR0pQV0tOSjVPMUhST21x?=
 =?utf-8?B?ZDBqSUF4Z0Q3anNVenJmNm91b1N1blZtY3JuV3hVSWc4dkJOMzhOdy9GQlI4?=
 =?utf-8?B?ZlY0OTlSeUJZRU92VzB2YU55OU1RZjVkdjQwTWRIK3U3OTlNbmZReGhKU2M5?=
 =?utf-8?B?L0NTZlA3bHFiNGhmMVQxa2NVTnpBU2huSDRNQWR2U3FDZWYwdXUybjNTSzB2?=
 =?utf-8?B?VGp1aDNGYVJZY2FRcDN2aW9xUCszY3FoWUFQdFcxNDArUWN3d3F4Wi9reXl4?=
 =?utf-8?B?Yk1ES0NIOTBsYTc4akxmOG1aU3J5amQxTWdENlZsZ1lhZ0JTZFZvYTRib0N3?=
 =?utf-8?B?SUw1djlpY1duVm93RlFmWnI0UUF0aG9ZSER5alhUaHB5TnFjS3BvUUw5NTNM?=
 =?utf-8?B?ZVREbldWVFhEd2R4UEdBZWsyb0lWWlZGT3lqNTBsYjZ5UVJzdGc0bXBOemJZ?=
 =?utf-8?B?eGYzeFo2UXgwdHNoeXpMNjl0eEFmOXQzMm9Qejd1UUlsT3VydFY0NHlTeStY?=
 =?utf-8?B?L2FKWDZLVGlOUHhNKzN1c1J2SnFYSksxT2dJd2tMQWpiVmVrbS9Rak5OaCsz?=
 =?utf-8?B?dEJPSWdtVHJJTTRMbVFNbGltQUlvMHpPajBrOWZDVUx4T3lxVGljc0JUNWc3?=
 =?utf-8?B?dUxOTnU2SnRSTGxZdm5RanlObDg0a3dSN1VVdDRWenMvaVRjS05qSzB3M21i?=
 =?utf-8?B?Qm5YRjhwcW56aTBSZVQ2aUQ3V1hhbjhJa3BRVmNKOXIxQ2x1NkdrSU52YXBT?=
 =?utf-8?B?dFAxSlJLeFFhK25WQmwyNW1GVmtpb3loUGV3YjU0SWI5bmEyeE1JK0M0S2Fx?=
 =?utf-8?B?MlFqak9DTFVtdEUvNm8xRExhV1l4SU5oZWJIYm5oWjBqdGQvR3Y3dlVsZEVt?=
 =?utf-8?B?aWI2Sk1pUmJ4NFNMR0VBbTg0NThQaFZ5T29lYTVCTjlncU9tMTd5T2ZsWncz?=
 =?utf-8?B?aDVQRDlBaDNnUGlEM1d1Rms5MDMreFBtRlJiNHFtZVpXWGk0V1g4YU0ya0ta?=
 =?utf-8?B?cDBNN1FPQWIzQ2FtWWNRSy9lNkxKaFNERTNnbHl4UU5UZjRKR3NNSy92RnhW?=
 =?utf-8?B?OE1udVU1SlB0VkZqak9wcURUKyt0QTFuVnFnbERYM1lTVmJYU3U1T3ZMRXQy?=
 =?utf-8?B?ZjQwZUx1am1ySERSQ2lDK3B3V2pOMTVFMXJjY1MzMU9IaHFaakxYN1ZmSlFj?=
 =?utf-8?B?RU5aMlREME5rcmlidjhwclJmblFoNVh0NTZUQ3NGcTJDdGVQVHcxVXdTdUVV?=
 =?utf-8?B?VjVuKzJENEtaQjZjZHdDMTdDVlFGSGR0RU1CcVE5Mm1FL1NUeEpTSWFCTTBD?=
 =?utf-8?B?L0I2anc5bDlkbmd3cGtvUVNZUWxrTk9vOFVNelB6SVVySHNSZVM3NUNKZU9P?=
 =?utf-8?B?K0NuYWR4TEtsY09BYVlicy9LS3lkTjh5aUIzRkVzaURqbEZzQWVaczB4WmJE?=
 =?utf-8?B?REx6MHh0cTJ5UTlud0tZYWRkZjVDQ25XZldUd0ZzMTcrSDlyN1NiZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5cca1e-16f0-4145-2731-08df186778a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 05:07:59.4522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AHJBYpyrNM4dTsgn9eoRDvfR3PIVF1PGLL3YRlo/rkGqAT+pfoYvowMK02Ug1/QaalN0SUBeeztdza5CqW5MS2tMRkSu/vBejSWSRSTvfH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17065

SGkgU2FzaGlrbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNo
aWtvLWJvdEBrZXJuZWwub3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiAyMiBT
ZXB0ZW1iZXIgMjAyNiAwNTo0NA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDgvOF0gYXJtNjQ6
IGR0czogcmVuZXNhczogcjlhMDhnMDQ2OiBFbmFibGUgVFNVDQo+IA0KPiBUaGFuayB5b3UgZm9y
IHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBp
c3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbTWVkaXVtXSBhcm02NDogZHRzOiBpby1jaGFubmVs
cyBzcGVjaWZpZXIgdXNlcyBzb2Z0d2FyZSBhcnJheSBpbmRleCBpbnN0ZWFkIG9mIGhhcmR3YXJl
IGNoYW5uZWwNCj4gLS0NCj4gDQo+IGNvbW1pdCBlNDMzNjZmODBjZmZmZDMyYWUwMjZiMzNhNmFk
NmMxNzBiMTI1ZTc4DQo+IEF1dGhvcjogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiANCj4gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDhnMDQ2OiBFbmFibGUgVFNVDQo+
IA0KPiBUaGlzIGNvbW1pdCBhZGRzIGNvb2xpbmcgY2VsbHMgdG8gQ1BVIG5vZGVzIGFuZCBkZXNj
cmliZXMgdGhlIEFEQzEgYW5kIFRTVSBub2RlcyB0byBlc3RhYmxpc2ggYSBDUFUNCj4gdGhlcm1h
bCB6b25lLiBJdCBjb25maWd1cmVzIHBhc3NpdmUgYW5kIGNyaXRpY2FsIHRyaXAgcG9pbnRzIGFs
b25nIHdpdGggY29vbGluZyBtYXBzIGZvciB0aGVybWFsDQo+IG1pdGlnYXRpb24uDQo+IA0KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDhnMDQ2LmR0c2kN
Cj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOGcwNDYuZHRzaQ0KPiA+IGlu
ZGV4IGM2M2E4NTdmMGU1YjAuLmEyZjY3MThjMDA0M2EgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA4ZzA0Ni5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I5YTA4ZzA0Ni5kdHNpDQo+IFsgLi4uIF0NCj4gPiBAQCAtMjcw
LDYgKzI3NCwzNyBAQCBzY2lmNTogc2VyaWFsQDEwMDRlMDAwIHsNCj4gPiAgCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsNCj4gPiAgCQl9Ow0KPiA+DQo+ID4gKwkJYWRjMTogYWRjQDEwOGMwMDAwIHsN
Cj4gPiArCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA4ZzA0Ni1hZGMxIjsNCj4gWyAuLi4g
XQ0KPiA+ICsJCQkjaW8tY2hhbm5lbC1jZWxscyA9IDwxPjsNCj4gPiArDQo+ID4gKwkJCWNoYW5u
ZWxAOCB7DQo+ID4gKwkJCQlyZWcgPSA8OD47DQo+ID4gKwkJCX07DQo+ID4gKwkJfTsNCj4gPiAr
DQo+ID4gKwkJdHN1OiB0aGVybWFsQDEwOGQwMDAwIHsNCj4gPiArCQkJY29tcGF0aWJsZSA9ICJy
ZW5lc2FzLHI5YTA4ZzA0Ni10c3UiOw0KPiA+ICsJCQlyZWcgPSA8MCAweDEwOGQwMDAwIDAgMHgx
MDAwMD47DQo+ID4gKwkJCWNsb2NrcyA9IDwmY3BnIENQR19NT0QgUjlBMDhHMDQ2X1RTVV9QQ0xL
PjsNCj4gPiArCQkJcmVzZXRzID0gPCZjcGcgUjlBMDhHMDQ2X1RTVV9QUkVTRVROPjsNCj4gPiAr
CQkJcG93ZXItZG9tYWlucyA9IDwmY3BnPjsNCj4gPiArCQkJI3RoZXJtYWwtc2Vuc29yLWNlbGxz
ID0gPDA+Ow0KPiA+ICsJCQlpby1jaGFubmVscyA9IDwmYWRjMSAwPjsNCj4gDQo+IFtTZXZlcml0
eTogTWVkaXVtXQ0KPiBEb2VzIHRoaXMgaW8tY2hhbm5lbHMgcHJvcGVydHkgY29ycmVjdGx5IG1h
cCB0byB0aGUgaGFyZHdhcmUgY2hhbm5lbCwgb3IgZG9lcyBpdCBiYWtlIGEgTGludXgtc3BlY2lm
aWMNCj4gc29mdHdhcmUgaW5kZXggaW50byB0aGUgZGV2aWNlIHRyZWU/DQoNClllcywgUGxlYXNl
IGNoZWNrIHRoZSBjb2RlWzFdIHdoaWNoIG1hcHMgTGludXgtc3BlY2lmaWMgc29mdHdhcmUgaW5k
ZXggMA0KdG8gaGFyZHdhcmUgY2hhbm5lbCA4Lg0KDQpodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92Ny4zLXJjMy9zb3VyY2UvZHJpdmVycy9paW8vYWRjL3J6ZzJsX2FkYy5jI0wzNTQN
Cg0KQ2hlZXJzLA0KQmlqdQ0K
