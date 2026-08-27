Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023116.outbound.protection.outlook.com [40.107.44.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0610035E1B0
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 06:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787811878; cv=fail; b=LJUwS7y6LhJcPAI1nvEsWr8MUi9PAF2WT8u99TbeIGza7URGPhAK0wZyJIG395AsBYr1rBUYcxr3Wh18FtEv/dNq/mtKg7pzg8UMygwQ0KGOENFOKLuNAFthpvsV9DceFt5QTbHwPZIcw4+eHL1Gk383nsTiYecBJRPJulC4MUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787811878; c=relaxed/simple;
	bh=C3noWlH+j6oeG4hcpCh2mvoeAwXWd6rt3mKRpkkP85c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CZocr7KmD5HTvNAz1CwCMp2I4AU6SwlYItuN9w5o+lYBQ4ph8Hdx8nDWCP9mCGSFq3HyDIN1mOZJpsNyDXVdSgtoMUhNdf3+U2gaX8cM/yLNNdyrb1U2WaTKL7MSX+eBEyDAIIY4zmrt/10N+fjglKYZztBQNvZQhh24t/6EacA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=RH+PH/PF; arc=fail smtp.client-ip=40.107.44.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="RH+PH/PF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxilpqbPIbnMJsKJ47R/KsT+irJvue57fYRN7xIwpz9GxcIXKtszYBmyAwbJJpb+VTT2wQnPyp3FDCuQJnVC3GlxHfN/0ftyyc9q9KC78EJhZvXW6XQ37gfAA2l8UwiXnhF0Z5DMpJ53c0aNZOilMPtf4kFD9yGlX8WMt/pI8s36r9FPLubihEAM7/BJXDqQAvVbiPfZjZZSg/nUoF32WlbuLcjfutpQttEp10dboJ/uH6nM33Ww0oRnD8LVuymGajgXyUdfcRs0YZmdp8WV4tdfPxIdefEfeksyA6LQZCJlhMrrM0KJyi6Vjv92DnqAN1Zn1bOCT3z/WwYptyx2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3noWlH+j6oeG4hcpCh2mvoeAwXWd6rt3mKRpkkP85c=;
 b=eI9n1baAwULvs3lAEgHQaqlz1QEBWDMzyi7TrDsp68Vu4/rhekI+HvYL3p60x927cWuR8Hr5M2Dji4mH4sXJuaeTDQnfDe6KoUq3hACA0qMYwLYPpb0uIyqS8OviS+8DUhzdGMrK8HjewiMr7+i4xoPHgRBV4EL/RT7mPRn3Zsn3ZZoW7ioUd1aJwZ462l+KPAIZpUJRshK9Z9SRwI0oB7GatN7CLU3tt2TniixGzW8uGBrIl8ksW4sD0w6NLn+jRRokXgOP6NgnORn9+cFi1XcIQI6ZU+g2SIY5lJYsy9TNK7gKlnJmZoqWtx0JEeedvVVvDzaca4wmSl2EAFEg9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3noWlH+j6oeG4hcpCh2mvoeAwXWd6rt3mKRpkkP85c=;
 b=RH+PH/PFasoJz98SDg22T3tTvIFsQjv7FwXYX32Ek6CkaEUbcMQr1WTN2nXhz25dh/tHu7WsHLlA/zOm73aDbTuVIu3BQS8nYTDJKsZLk5vzl+xR0tvDlbpV3r6LIMjL92OdSfbqjxOdchmrAtjQl1Ozlpl5+qvzsGeHujnAaPYXkovshe/VOaGmY71nqoEkOw9+KZIz221GZgyFaMo7ePjan1i1/WAf0TVtY6KG+pId+c85I+85G4ZEgzBnXPrNJuf1STCnHfQw7Rhl0g+emy5lrLMviEAP4ADjkLL+CuDYURnK+FDJxuNS/17uTwZAkIZKr/5MeGgwUnpw3bMBFw==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by TYZPR06MB6955.apcprd06.prod.outlook.com (2603:1096:405:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 06:24:31 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::43a0:9857:dd1e:76d2]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::43a0:9857:dd1e:76d2%4]) with mapi id 15.21.0339.007; Thu, 27 Aug 2026
 06:24:31 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 8/8] EDAC/aspeed: Add AST2700 support
Thread-Topic: [PATCH v2 8/8] EDAC/aspeed: Add AST2700 support
Thread-Index: AQHdM3I9exUn4Do/VU6s5hjV2AXr1basgPwAgATxdwA=
Date: Thu, 27 Aug 2026 06:24:31 +0000
Message-ID:
 <TY2PPF5CB9A1BE62172BCC358347C4836CCF2AD2@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260824-edac-v2-0-c8d8bb693586@aspeedtech.com>
 <20260824-edac-v2-8-c8d8bb693586@aspeedtech.com>
 <20260824025454.D735A1F000E9@smtp.kernel.org>
In-Reply-To: <20260824025454.D735A1F000E9@smtp.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|TYZPR06MB6955:EE_
x-ms-office365-filtering-correlation-id: 3c386b83-511d-4a00-fe5c-08df0403daf4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|10067099003|6133799003|18002099003|22082099003|4143699003|5023799004|38070700021;
x-microsoft-antispam-message-info:
 HgKFUreDHRMPPDCPG63ncGbtmG0GmwgK7wLrXxxB9Dmh8naX3Ne3gud4LAwgjyFlmFoIbzoW3rr0Nr6E+j93Pyi2C0wxSae9f3xmgCnbs0mG1B2WgWlXtPHhfjpLiwLJl4b8GSU5ZEz86QuVKIDTBWNVcu+yDzl5Yav/Neb6r+KEjnmjP41BLCFouWHKofgL8ZgLNbQuKAdIibLZyXnMjPpIFNxIOWcb12spdC0EcI6RfRpBo45HFvjLNwah6AymeUg3MaWMgN1U09opAuUO2owzLPzYcy4zhAVtg640lHMNk0YhdqAedZMtTWyX3u/ZgEAsuCcwd0FPe10KZn3jBh6tppEQg+pkd0c32biLk49kpa31TFld79H5K7I3oTAwmleTmFh3tyEx0PHmnmhMVTMnPubyYrtjDrNAD6ZYdsreKd1dZgr0vqnHatoFsE4ert69VlikaW7ZN3pbZGi/zDHOuAP/KVFwkXHGrxdreLnAFWLjWsVja2z5UxnNekJyQNHno1OqhN3OnW25D5E91+OFfJ4RSlUAQ2OPZsCj2uKP+uncsYsFFAbfJrwj6PRndLpk6RTuuQhJHdVj0S3ri174NU1JFlJHbSSAn46pBReMDTBKAHkcqiOnHx2sv4gzwOz1sgozI7O4MCXvwc/x10dn039Y2iMU/NPVIaiHrQs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003)(5023799004)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K1grdTlrckl0UGFsNURzcXJFSG1aaGEwSnpvbU95TlhiWFJoNHU3bFhkWkxt?=
 =?utf-8?B?YU8zM1hBc25Rc3FoL3pMdmRDZVJGRjgvQU5aNXFwclV6ZmNtOWJhZFh3ZzlG?=
 =?utf-8?B?ZU42VWpGUExLRnErdnUycWZkbjRhOThoNzNXTnNwYkRDUkpaV1dxaVpaRlVa?=
 =?utf-8?B?QlhzV1hUcytma3lyL1hjaDdaekgza1p1Q0tXY0N3MUoyckVvQ1V1K3RGSUtw?=
 =?utf-8?B?VHFVdE5jemRhdm9WQm1GU2dDR3kvRlZmMGphZFdFM0xWdzBqU0RBbWJsN2px?=
 =?utf-8?B?em5nMWR6WTdkaSswUTFyMW5kR0RsZXkyeEZkMVBtVDBkaXJaK1VjbFI5MnZI?=
 =?utf-8?B?YzJ5QVNjVGlWTFBaTWNQOTEyWGxVQUY4ZFk1QmRHN1JVcTgxK1hoTG1KVHht?=
 =?utf-8?B?R09HT2owZGUwYjhvWjJ4RjV5Vnl1bFVLMTdobEIwY2c3TkQ4bHllYmdTZVJs?=
 =?utf-8?B?dk94ZEl1VUhiYUZjSzdQSDF2cUc4TG5VdWJFSStFUzB0TTd2enJUTlFxYUpJ?=
 =?utf-8?B?NzRuTkZqQ3phb0QxS0x4Sjg5QnFyRmhmREk4SlF3YmV1eVpodFJxVzlqMjNt?=
 =?utf-8?B?R3JCR0w5TExhelZLbWJocUxFdk80djk2ZnJkU1BHYkJnY0xLTGdzQVBpY0Np?=
 =?utf-8?B?N05McnYzUnlObzcraGxGNWFWdlZhVU5HcXdXRWFvU0tRbjBSdEZJcDc3cjlk?=
 =?utf-8?B?eHZ2RnN6YzBGME5nQk1iaHZBQjc4U3pLamVOSWQwd3o1aVI4S0crL09JM2do?=
 =?utf-8?B?OVhOMjJsWC9LWEV0NjJ1eDFqVXEvS29mQ2xZeENpbmNNeXB1WVg0SEh1RDNy?=
 =?utf-8?B?WEtSSDRtMnBoTFhIUy9JVENUdG4xQWMreVdvSE4wRXJEd0o3U3ZlbTltaWk4?=
 =?utf-8?B?WDE3M3ByZmIwYno1SG9sT0o0bXhnNXUxL2xZS251RU1DNks3ZnhPeVh1MVg3?=
 =?utf-8?B?aElpQWRqKzg3UFNaQk54VzMzRlhVRXlvVS9udHVCZW5VVHhNdFRZR01NWU9Y?=
 =?utf-8?B?bVM5VUVCODFpc242elhEVkJBWjJ4enN5ZkFwTng3dGZjZ3JMTnlwY0J4Qytu?=
 =?utf-8?B?U1dCRmxUSFA1ZkZPYm82bXJQUnZVTmI0MGpVS3NGMnBwc1dtcDUrQjFZaUFW?=
 =?utf-8?B?SHpWb3gyMWZidmRXemduNmloNG1lN2NKUUgyMStabEdZSXdLMG9xZHFyZGZl?=
 =?utf-8?B?clpRVXBXU1BScXg2TmtzQnVsMUJnNlJZZ0R2a25BeEZDSEpzeHlVVWY2UGc1?=
 =?utf-8?B?ZG5JMHlZTzB5VlJTWjFIcVVRY3lodTUzKzNoN3B5SGRLUE5JV1N5RStEWTV5?=
 =?utf-8?B?d2FqR0h3V3RaRzlPUVppMnFNU1JsWEJWb2VoZ3ZtOUFjcDYzWGtla1BFRisv?=
 =?utf-8?B?QjdQaUh2MXNSYS9KZFMzRXFRVUdyaThEWkJzWkdGTnpPN3k3NUhpZEs3MnNk?=
 =?utf-8?B?NC9MUWt1MFFyVnpPQ3hBS2xZZ2RITnptbjN6T3RNaFdwYUNqcFB0K1ZmRmtQ?=
 =?utf-8?B?Y1AyZGk5Uzh0S0hUMyt6NTloeGtZWkthNVdWSThxQUFVeEl2NUEralNWQ25n?=
 =?utf-8?B?UTh0Q2FxQVV1WEZ6QTM3MDU1RDc0YUM3M3FJMGoxZXlzcGI3cUk4aEJzTjVN?=
 =?utf-8?B?TlE1NS8ySVYyRzBQV3N4VzdxK0E5U0RveU15N0JrZkFVbFlmdG5iT0tnOHY5?=
 =?utf-8?B?cDE4dGE3cE1yZjJibXl6bUJqcUI1QnNoV1RRL3JlQVNTT0NLVi9pejgxNDdN?=
 =?utf-8?B?c2g1L084cFlwdUNRVW5ROFNFR1dkakxYVVdTeCt3Y1NVRzFLNld4NzNvUDRk?=
 =?utf-8?B?QTd4bzdWZjlSWFh0QTdRVGs0cmdLSkEvemhJWnhFaDlDU0dqT2VySHcvNE5M?=
 =?utf-8?B?Mk5WWTFJa25VL3EvMElzOTFHUmh4OGlyMzcyYjNNVnZRanNwL09ET1V1ZTBs?=
 =?utf-8?B?VXhkNjhPelQ3UE5qbk5ZVHBpWEp6NkxYR1ZoTHlMVEl6RmZzc2FJZi9ieWU3?=
 =?utf-8?B?dXdvS0w2OFpYeHpqNjZWdkVyZVBKSzcwNTBOMDBCQW0rMjVXS3lBTEx1ZFdn?=
 =?utf-8?B?VDR1dkZTTjVJSUM2KzNRekxxb21tUTZBSCtud3M4c2g1QktLVVFtN1BkNHln?=
 =?utf-8?B?cWR5WXlvNDFldTFHR3RYeCt3OU9Ja3J3TFBCaFc4R3BSaHZvZUtQc1R4cmVX?=
 =?utf-8?B?M2xrcituYi9WTnppbXVBNWVKUUhrZ2Y0T1JZQ2JNNU82bm9EWk9kZ1BPYzJB?=
 =?utf-8?B?blhtcy9VMEw1RjdXU3NuZU5sRXFxR25neittMW9kc2tPcnBhRGl0MWNlOEdQ?=
 =?utf-8?B?N25TamtYS0JmRjRJMk9mSUs4RzZDeEh3bytoTVMzNzhRTStPdW9yUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c386b83-511d-4a00-fe5c-08df0403daf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 06:24:31.4685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rye0Y09g8os4HebGiX4LHBtiwQupS61/H4FxOvDNseae5aDSlmsnjMNVTadhOyr/2k+8WqizcVsdBIB+V8Uaifm8Q69a6as+XRkTjOr5Evk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6955

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDgvOF0gRURBQy9hc3BlZWQ6IEFkZCBBU1QyNzAwIHN1
cHBvcnQNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkg
cmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvDQo+IGNvbnNpZGVyOg0KPiAtIFtI
aWdoXSBSZXR1cm5pbmcgSVJRX05PTkUgZm9yIHVuaGFuZGxlZCBleGNsdXNpdmUgRFJBTUMgaW50
ZXJydXB0cyByZWxpZXMNCj4gb24gdGhlIHNwdXJpb3VzIElSUSBkZXRlY3Rvciwgd2hpY2ggcGVy
bWFuZW50bHkgZGlzYWJsZXMgRUNDIHJlcG9ydGluZy4NCj4gLS0NCj4gDQo+IC0tLSBQYXRjaCBb
OF06IFtQQVRDSCB2MiA4LzhdIEVEQUMvYXNwZWVkOiBBZGQgQVNUMjcwMCBzdXBwb3J0IC0tLSBj
b21taXQNCj4gMGQzZGExZDYwOWI5YjA4Njg5NTJmZDY1NmM2MGQ5ODhiMWMzMmU0MA0KPiBBdXRo
b3I6IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiANCj4gRURBQy9hc3Bl
ZWQ6IEFkZCBBU1QyNzAwIHN1cHBvcnQNCj4gDQo+IEFkZCBTRFJBTSBFQ0MgcmVwb3J0aW5nIGZv
ciB0aGUgQXNwZWVkIEFTVDI3MDAuIEl0cyBEUkFNQyBoYXMgYSBkaWZmZXJlbnQNCj4gcmVnaXN0
ZXIgbGF5b3V0LCBhIHNwbGl0IGludGVycnVwdCBzdGF0dXMvY2xlYXIvbWFzayBzY2hlbWUsIERE
UjQvRERSNQ0KPiBtZW1vcnkgYW5kIGludGVycnVwdCByZWdpc3RlcnMgdGhhdCBhcmUgbm90IGtl
eS1wcm90ZWN0ZWQuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2VkYWMvYXNwZWVkX2Vk
YWMuYyBiL2RyaXZlcnMvZWRhYy9hc3BlZWRfZWRhYy5jDQo+ID4gaW5kZXggZTg4ZDlkMjY0NmRl
Ny4uODhiN2Y1ZmYzNzI3MyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2VkYWMvYXNwZWVkX2Vk
YWMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZWRhYy9hc3BlZWRfZWRhYy5jDQo+IFsgLi4uIF0NCj4g
PiBAQCAtMTgwLDYgKzIwOSw1NCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgYXNwZWVkX21jcl9pc3Io
aW50IGlycSwgdm9pZA0KPiA+ICphcmcpDQo+IFsgLi4uIF0NCj4gPiArc3RhdGljIGlycXJldHVy
bl90IGFzdDI3MDBfZHJhbWNfaXNyKGludCBpcnEsIHZvaWQgKmFyZykgew0KPiA+ICsJdTMyIGlu
dF9zdHMsIGVjY19zdHMsIGZhaWxfYWRkcjsNCj4gPiArCXN0cnVjdCBtZW1fY3RsX2luZm8gKm1j
aSA9IGFyZzsNCj4gPiArCXN0cnVjdCBhc3BlZWRfZWRhYyAqcHJpdjsNCj4gPiArCXU4IHJlY19j
bnQsIHVuX3JlY19jbnQ7DQo+ID4gKwlwaHlzX2FkZHJfdCBhZGRyOw0KPiA+ICsNCj4gPiArCXBy
aXYgPSBtY2ktPnB2dF9pbmZvOw0KPiA+ICsNCj4gPiArCXNjb3BlZF9ndWFyZChyYXdfc3Bpbmxv
Y2ssICZwcml2LT5sb2NrKSB7DQo+ID4gKwkJaW50X3N0cyA9IHJlYWRsKHByaXYtPnJlZ3MgKyBB
U1QyNzAwX0lOVF9TVFMpOw0KPiA+ICsJCWlmICghKGludF9zdHMgJiBBU1QyNzAwX0lOVF9FQ0Mp
KQ0KPiA+ICsJCQlyZXR1cm4gSVJRX05PTkU7DQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IElm
IGEgbm9uLUVDQyBpbnRlcnJ1cHQgaXMgbGVmdCBlbmFibGVkIGJ5IHRoZSBib290bG9hZGVyIGlu
IHRoZSBtYXNrIHJlZ2lzdGVyLA0KPiB3aWxsIHJldHVybmluZyBJUlFfTk9ORSBoZXJlIGNhdXNl
IHRoZSBrZXJuZWwncyBzcHVyaW91cyBJUlEgZGV0ZWN0b3IgdG8NCj4gcGVybWFuZW50bHkgZGlz
YWJsZSB0aGUgaW50ZXJydXB0IGxpbmU/DQo+IA0KPiBTaW5jZSB0aGUgZHJpdmVyIHJlcXVlc3Rz
IGFuIGV4Y2x1c2l2ZSwgbGV2ZWwtdHJpZ2dlcmVkIGludGVycnVwdCwgYW4gdW5oYW5kbGVkDQo+
IGFzc2VydGVkIGxpbmUgd2lsbCBjYXVzZSBhbiBpbnRlcnJ1cHQgc3Rvcm0gbGVhZGluZyB0byBh
IGRpc2FibGVkIEVDQyBlcnJvcg0KPiByZXBvcnRpbmcgbWVjaGFuaXNtLg0KDQpUaGUgcHJlbWlz
ZSBkb2Vzbid0IGhvbGQgb24gdGhpcyBoYXJkd2FyZS4gRnJvbSB1LWJvb3QsIGJlZm9yZSBMaW51
eA0Kc3RhcnRzOg0KDQogID0+IG1kIDEyYzAwMDBjIDEgICAgICAgICMgSU5UX01BU0sNCiAgMTJj
MDAwMGM6IDAwMDFmZmZmDQogID0+IG13IDEyYzAwMDBjIGZmZmZmZmZmDQogID0+IG1kIDEyYzAw
MDBjIDENCiAgMTJjMDAwMGM6IDAwMDFmZmZmDQoNCklOVF9NQVNLIGlzIEdFTk1BU0soMTYsIDAp
IC0gdS1ib290IG1hc2tzIGV2ZXJ5IGltcGxlbWVudGVkIHNvdXJjZSAtDQphbmQgYml0cyAzMTox
NyBhcmUgbm90IGltcGxlbWVudGVkLiBTbyB0aGUgcmVhZC1tb2RpZnktd3JpdGUgbGVhdmVzDQow
eDAwMDFmZmNmOiB0aGUgdHdvIEVDQyBiaXRzIGFyZSB0aGUgb25seSB1bm1hc2tlZCBzb3VyY2Vz
LCBub3RoaW5nDQplbHNlIGNhbiByYWlzZSB0aGUgbGluZSwgdGhlIGhhbmRsZXIgY2Fubm90IHJl
dHVybiBJUlFfTk9ORSBpbg0KcHJhY3RpY2UsIGFuZCB0aGUgc3B1cmlvdXMgZGV0ZWN0b3IgY2Fu
bm90IGtpY2sgaW4uIElOVF9TVFMgcmVhZHMNCjB4MDAwMDQwMDgsIGkuZS4gYml0cyAzIGFuZCAx
NCBhc3NlcnRlZCBidXQgbWFza2VkLg0KDQpOb3RlIElSUV9OT05FIGlzIHRoZSBzYWZldHkgbmV0
IHJhdGhlciB0aGFuIHRoZSBoYXphcmQ6IGNsYWltaW5nIGV2ZXJ5DQppbnRlcnJ1cHQgdW5jb25k
aXRpb25hbGx5IHR1cm5zIHRoZSBzYW1lIHNjZW5hcmlvIGludG8gYSBsaXZlbG9jayB3aXRoDQpu
byBkaWFnbm9zdGljLCB3aGljaCBpcyB3aHkgdGhlIHYxIHJldmlldyBhc2tlZCBmb3IgSVJRX05P
TkUuDQoNClRha2luZyBmdWxsIG93bmVyc2hpcCBvZiB0aGUgbWFzayByZWdpc3RlciBpcyBzdGls
bCBmYWlyIGhhcmRlbmluZywNCnNpbmNlIHRoZSBkcml2ZXIgZG9lcyByZWx5IG9uIHRoZSBib290
bG9hZGVyLCBidXQgaXQgaXNuJ3QgZml4aW5nIGENCnByZXNlbnQgYnVnLg0KDQoNCj4gDQo+ID4g
Kw0KPiA+ICsJCWVjY19zdHMgPSByZWFkbChwcml2LT5yZWdzICsgQVNUMjcwMF9FQ0NfU1RTKTsN
Cj4gPiArCQlmYWlsX2FkZHIgPSByZWFkbChwcml2LT5yZWdzICsgQVNUMjcwMF9FQ0NfRkFJTF9B
RERSKTsNCj4gPiArDQo+ID4gKwkJLyogdGhlIGludGVycnVwdCByZWdpc3RlcnMgYXJlIG5vdCBr
ZXktcHJvdGVjdGVkOyBjbGVhciBvbmx5IEVDQyAqLw0KPiA+ICsJCXdyaXRlbChpbnRfc3RzICYg
QVNUMjcwMF9JTlRfRUNDLCBwcml2LT5yZWdzICsgQVNUMjcwMF9JTlRfQ0xSKTsNCj4gPiArCX0N
Cj4gWyAuLi4gXQ0KPiA+ICtzdGF0aWMgdm9pZCBhc3QyNzAwX3NldF9pcnEoc3RydWN0IGFzcGVl
ZF9lZGFjICpwcml2LCBib29sIGVuYWJsZSkgew0KPiA+ICsJdTMyIHZhbDsNCj4gPiArDQo+ID4g
KwlndWFyZChyYXdfc3BpbmxvY2tfaXJxc2F2ZSkoJnByaXYtPmxvY2spOw0KPiA+ICsNCj4gPiAr
CS8qIGludGVycnVwdHMgYXJlIGVuYWJsZWQgYnkgY2xlYXJpbmcgdGhlaXIgbWFzayBiaXRzICov
DQo+ID4gKwl2YWwgPSByZWFkbChwcml2LT5yZWdzICsgQVNUMjcwMF9JTlRfTUFTSyk7DQo+ID4g
KwlpZiAoZW5hYmxlKQ0KPiA+ICsJCXZhbCAmPSB+QVNUMjcwMF9JTlRfRUNDOw0KPiA+ICsJZWxz
ZQ0KPiA+ICsJCXZhbCB8PSBBU1QyNzAwX0lOVF9FQ0M7DQo+ID4gKw0KPiA+ICsJd3JpdGVsKHZh
bCwgcHJpdi0+cmVncyArIEFTVDI3MDBfSU5UX01BU0spOw0KPiANCj4gW1NldmVyaXR5OiBIaWdo
XQ0KPiBEb2VzIHRoaXMgcmVhZC1tb2RpZnktd3JpdGUgc2VxdWVuY2UgbGVhdmUgbm9uLUVDQyBp
bnRlcnJ1cHRzIHVubWFza2VkIGlmDQo+IHRoZXkgd2VyZSBhbHJlYWR5IGVuYWJsZWQgYnkgdGhl
IGJvb3Rsb2FkZXI/DQo+IA0KPiBUYWtpbmcgZnVsbCBvd25lcnNoaXAgb2YgdGhlIG1hc2sgcmVn
aXN0ZXIgZHVyaW5nIGluaXRpYWxpemF0aW9uLCBwZXJoYXBzIGJ5DQo+IG1hc2tpbmcgYWxsIG5v
bi1FQ0Mgc291cmNlcyBleHBsaWNpdGx5IGluc3RlYWQgb2YgZG9pbmcgYSByZWFkLW1vZGlmeS13
cml0ZSwNCj4gbWlnaHQgcHJldmVudCB0aGUgc3B1cmlvdXMgaW50ZXJydXB0IGlzc3VlIG1lbnRp
b25lZCBhYm92ZS4NCj4gDQo+ID4gK30NCj4gDQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3
DQo+IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgyNC1lZGFjLXYyLTAtYzhk
OGJiNjkzNTg2QGFzcGVlZHRlDQo+IGNoLmNvbT9wYXJ0PTgNCg==
