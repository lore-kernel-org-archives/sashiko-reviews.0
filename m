Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013066.outbound.protection.outlook.com [52.101.72.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D3A40488C;
	Wed,  1 Jul 2026 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902945; cv=fail; b=cciSYO+z7HZQ8EbkZbXZyVQiKgpLHUK90/Bk7hvHc9y4ApdlsxSW7aNbS6cY6FvrT9J7w0EhWEzxgxDZwox/8shl4nkrw0FCjfXeiM2j6n8lq2QrNjrPYaOEgd/+X4mnhZW3Jh7sTYXW8eJ5BTVHWwrHZ+WAYJsm5USEN4y8eVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902945; c=relaxed/simple;
	bh=JRc3Dy9zFe85tIyfs/uX5K/x/3B4OSG/4/0RLn09k70=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H0x2xOaa8zAeXQoOEHJ0Oy+hzishnNw83gEUxTTGQ60Sh/AhkNtlgZTxSiZYZcrb/XV0IIyV5LdekCHn+4h15q9FShgQWmstN8Qjuiq3Dy/UqIo3dCeLK+u9Hu7eCk5xV2QRM07WKwzArvwIZS5XanPwh+clisZmb24cCHWA0j0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FZ/X6KVd; arc=fail smtp.client-ip=52.101.72.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FZ/X6KVd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOYaDD/+rkrk/+2xBl47ZLatGcID5BV85AFoy3Gl0eUCoQQRSm3XRcajgDx4SJRrgvIFxMoH2VtiAj7bVWlaGbprAFrbSYiJ2g4bWE83km3JbYOk2diHAN+sInvMj2VGvRR1fAvsj+ZLKmr9bafBVQkVmrXCuavhzYpHnD6OU2JE7G66tY4AluLnvRhnoehJ8vVxJXJ0ZUazcCNYYl1jENPH8zLWzabEOB3uB0jVGA5R9N6kZvQ5POGnEEza7AwDknoTWOeb0JnwWoCLdqJHi15HSorS94OFBBbujvDbEEqB+gIwZoOySQo9pT8KzShDDXqL8GRW8uxVJGfteclpXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRc3Dy9zFe85tIyfs/uX5K/x/3B4OSG/4/0RLn09k70=;
 b=UIJgDRyKh0FHqNMMCFrUk9aM6joDmAE+hJ1FmLJ2z3/NKOhROkq6d8BzX3ueCQJr+/LHzzhPxnM2HmXZCpH6NBKM5n++1VjeV6RKILLYpakNwOwkhdkWyKkhK16saM6/rlk9LJLv8Lbyp8yIHevnjnMiU3FDwyTE6LST8dyL3PIT6GleWAY3LkRFWesx0FAadjwBr52+0R682hzqxyINKoZaQthJlGrHkFTjWz4oh4W24jHoWQOyOmWh00oZbja7IW4clppPuV48K2N3e2sC5BYQ0V2OxAjhquJvgwFQxTax7x5kBiax1XgWKpFIcaQTq0gtuUdzkcEYCcRpyxQyoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRc3Dy9zFe85tIyfs/uX5K/x/3B4OSG/4/0RLn09k70=;
 b=FZ/X6KVdRZpvUInpcYETEJ7fT4tN0xpmzhUfdH4AMkXDMmw8QIgopGn1USpFJaR/tBCeosJO0zHS6+zhsix8uQvvUpIcC2MN23zOcszQVPrIaTJ/c/ks+IxFvkTbguoWdLOjcq3EyeC3ZTMi7x6zwiOpJ0ZMFXFdY7Lw3q7q8ESI8LjpRKh1xrwPnUtPcY9A2C1pU5iF6KTU/PoHBVn/IwtSWstXI4zFTdCPM5eH1QvENEHZpMFIHj3XlmHWboSShrLog1Kb2kfXkWDaUeDKzZwC397WiZvzIecx0eSrfeGmvIXu4gxLxda+EUSn85sSfKMZdI43ECbILqJwa1Zt7Q==
Received: from DU2PR04MB8629.eurprd04.prod.outlook.com (2603:10a6:10:2dc::6)
 by VI0PR04MB10639.eurprd04.prod.outlook.com (2603:10a6:800:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 10:49:00 +0000
Received: from DU2PR04MB8629.eurprd04.prod.outlook.com
 ([fe80::9d04:7526:a901:fe47]) by DU2PR04MB8629.eurprd04.prod.outlook.com
 ([fe80::9d04:7526:a901:fe47%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:48:59 +0000
From: "Wei Fang (OSS)" <wei.fang@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, "Wei
 Fang (OSS)" <wei.fang@oss.nxp.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: RE: [PATCH net-next 13/14] net: enetc: use alloc_etherdev_mqs() to
 create netdev for VF driver
Thread-Topic: [PATCH net-next 13/14] net: enetc: use alloc_etherdev_mqs() to
 create netdev for VF driver
Thread-Index: AQHdCGULWNcTl7e+5U6Ln2nZILcT/bZYTAAAgAAxpEA=
Date: Wed, 1 Jul 2026 10:48:59 +0000
Message-ID:
 <DU2PR04MB8629AD7EF68F5FAA8DF2BF4288F62@DU2PR04MB8629.eurprd04.prod.outlook.com>
References: <20260630072036.382761-1-wei.fang@oss.nxp.com>
 <20260630072036.382761-14-wei.fang@oss.nxp.com>
 <20260701075117.34DB31F00A3D@smtp.kernel.org>
In-Reply-To: <20260701075117.34DB31F00A3D@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8629:EE_|VI0PR04MB10639:EE_
x-ms-office365-filtering-correlation-id: d1801c87-a8b8-4003-bd02-08ded75e5ba2
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|23010399003|366016|4143699003|6133799003|11063799006|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 C2Ugl2oTh7K1RnBvEEKqOmpUT2DoBCQT2qDhTCq1s6ppKB1y4AEwaI7D0xZQOr1jS3+UIS1vQ+MxksbPdYU5YwRqiO+q055iQiT7tpnpGItREgf9qWzqBA/4juZnsdfWU52DOQ4Pca4ACD3pOAG5doAVRZVrArRMOjheVnjQBjzYvUGOAgcbeXwT+aFp1uiTKjSL597xWaqsNwsnG20X2hg02fn15HArG72Ad0T32yLkw9GXQ3j9yuxJojkAmN9a6By9dGMgRMRDES3Lm2bop0iuFqu/J8tEguO1IsuQc/80CHuLr4Ie4siv8vLYJXOeYST7Fc0ubFd9SDDB1oAbb7I/YtrfPd942ScueJaNbanuLzXcyBp7l5w4OyVYweOqh0WAlgn4QXwLwdT5dUmWGo8m/yQRzLUzLSUj3YfuOPyasv7SAzKE1a9NVApn3ZRN1Fsj9QgyUhGLN6s/ME/hh5iW5nuajKySHDB6jQQBPaSnjzdGpNO5kfo0tZJ3k9EtNjohiFE/S4DNTQ8DhNIUcPLHB8gwikfqpIQBz4HwAoi8H6qpGJpLFHNMiE/PMaXRNLXYLrsOZiGU2RPyaoP4UoITvD5wTV/L2k2Ibtz54mShK60KerI224sDNavMwwpmfEi9On8uV9c2xDQpNj5+wP9PMGkVwpnWxnd/moZ5khH1EhOtqL1nATNfrx5Z6pgw7qaDTEKBC6LivPa2G99obItNH6argxxehAKbUUXNIjY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8629.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(23010399003)(366016)(4143699003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WTUvOVowUi9WRjR0eGt6WnpBc2NZbTVOQ0I0SUsvRDJXTUtHSk1iSUdMUDNZ?=
 =?utf-8?B?ZHMrSDJwZTRmOTYxN1I1ckFZQ005WEJudmF5UGtGS0pwZ28wWTQweXI3WEJ1?=
 =?utf-8?B?TFk0RDZHREFCUGlvMi81c21odjRIR0hUQm9tQ1Y3cXNWYU9lSVArZWtCTlZ6?=
 =?utf-8?B?b3JDaVF4NzV2THVVUFZHS3ZSUmxVeStacG9IZjhuL29GeUFnbDhoMGpENVp6?=
 =?utf-8?B?OTB6ZlNmY0xjeE83VTVDMTROOHRMbjY2VEhYendnL25ldzVJOGh1d05Edm9Q?=
 =?utf-8?B?NjVLemNXQnNDN3hORFJ5dWc3N0xxWWhVRGwwYUZWQkFTNG9JSnExK1QvdlFw?=
 =?utf-8?B?ZHZJbmFmL3JYM1hNdWxwa2RlWHdETUZqY3pYbUZYcHliVnNoOUFlcG5JcUp3?=
 =?utf-8?B?UnhQakJKTzFWbEt2ZTdZZG1YWGtPZjRjOWJmdjNZSFJleE5hWGkvVDlGSkp2?=
 =?utf-8?B?Q2FyNTRkWUJDaFVUY05vdTNHZ1IydHUwaVpxem13ejdMQUZ0bHQ4MlROMm82?=
 =?utf-8?B?dndnTWdsUVR3Ly81THJJNzNDcEJQd0JyQm9ZKzF2WUN0a2ovRVYrendrcGU5?=
 =?utf-8?B?VHZqa25peCthZzFiRUIvd0NwYko0d1g2eDByYVUxT0dKWEF3eXhBUXBoV245?=
 =?utf-8?B?ZW9RekNkYytNRzdzblRzM01YNlY3TVlualhsUUZ6ZmluZ3hCZ2RscmZmRlI0?=
 =?utf-8?B?ajU3aGc2bFkrck9WbndrYUhraERFVGJKWUZnVmh2cWNHdzRBYWg4N09CcE9I?=
 =?utf-8?B?T0RQZ3p3UDRDS0xQSkNTRFN5bkJsZVRobDk4M0N6ZnhvbXliZm1oZk1Fd2RC?=
 =?utf-8?B?QXhmRTA0bmRSUHora1pCclVNUDVXanJodFk4b0E3K0djczJCa1Zpam5EVHlF?=
 =?utf-8?B?YlhRWXl2VHE3R01XeG5RZTREb1VwMzVDUUVqRC9sRHNEMEdUSUNKOUl2UERU?=
 =?utf-8?B?ZVZZaDZ5MWpyRkxJSjVtSTcrUW9yV0pBYWM4Yk5NZUtCTm5yNW1UeHYvd1Av?=
 =?utf-8?B?YlU4Z2Z4OVU5RjZvTkUzODVkejFyVko2TXpnUDNPb29zZWNxUGQzMG55NW05?=
 =?utf-8?B?WWJlU2RrdWplTWRJbjZPdktkbjVhb3FZVzFpcTF6OXFLVm9Yb1pnT2Q0bTJO?=
 =?utf-8?B?YWZKZWFSMDdlb0JRYmYrby9pank4SEszQ2xjSUVqc2RYSnlBaFRCTWM5SWNQ?=
 =?utf-8?B?ZjJ5cTlacDVFK2h1N2FVd085ZUd1Q1M3M21VeWxWR0dZK1lUTVBXekE3NGVO?=
 =?utf-8?B?dzlZMVZKeE5lb0VHNFVDalJBSytMeXk3TFFHSXl3Z0dNTDVKTEtYZGlMYVVx?=
 =?utf-8?B?UHdlSDRvWnI4bU1YNnF4UTI1dmlsT3JFdmMybGE2UjFLSlVHS0drdzJoNGtw?=
 =?utf-8?B?c0xLcDVleTNxVmVBMzR6WjRRbFhBZXRGOUJBb1VvOE8yVXFtQTNjUzdwRm02?=
 =?utf-8?B?RWFhU2dON25ROGVFellHOFhUL1QvTlY3c1dXdUZobWZBa0JDODdnNDVoSzNN?=
 =?utf-8?B?TVE2TFREVXQ5MmNxZjh6Q1JTSTlOVHhCSys3YW9iMUZsd0EvSFhIT1JvTFd1?=
 =?utf-8?B?UVUxcjhhclRNZG5oVUhUZk9iaFU0MzNVTnBCQk5EMU1mUW9VSkVMS05DRWZr?=
 =?utf-8?B?VTRRNTZWQ2NOQnh5MEtIN2w2ZUl3SW5mNUJ1TFVHekhad0t6ZTdDdWVBWXZm?=
 =?utf-8?B?UmlOdUo0YlA4QTAxTmF2NGRxSWNUbGdlZDQvaGxJS0t4dVpPZTdZaStDSzhJ?=
 =?utf-8?B?R2tFQlQ5aGxvVE5qWm96TFY1cXYra2p3R3o0QjBDTzBoeEdhNWhqNFdBN3Qz?=
 =?utf-8?B?VU5pQWx0VjlIblVlaG9hUHVyZW9TTmsweHBQVzh1bjFRTExEbGlEdHc2dXRh?=
 =?utf-8?B?cUliSHJiMGdMMlRPb0h2NkxxZHF0SEE1NTZRMEZzVE9lelQyM3pLd2kvM0VZ?=
 =?utf-8?B?WTYxVUlTTjlJNld1eDRBZE5JcDlsNjNkWkhYRmtFRTJlL09CV1JxejV5a1lZ?=
 =?utf-8?B?Y3ZtQ0hEOTVJbi9HT1VqUjVZbm52ZUZsbjIwRHM4bFpmVmF6UGxydEdoVGZi?=
 =?utf-8?B?RmZFeHJzY0RlUHJhbi90YldvVjdDdDdxb1FRSEs3TzlCeG1MUHlHcDdiMEln?=
 =?utf-8?B?eU1yY2QzSDNzWVFHeEkrSEVYWWwzMEcxVEI2ZWdnVktJcXFkZ0pqVkdLNmZz?=
 =?utf-8?B?Vk4ybEcxeXdTaTF0cE5kVkNIK2s1UjE5TUtqNjBIZkVUbHdxY0NlOVQ5L0ts?=
 =?utf-8?B?cGZySVlRUGMxUnM0ZDBrSjJUUlFuNlVZeXpjNWRVME5uMWlac1ZDNkk3VFpY?=
 =?utf-8?Q?keQSVrpukCLwNooDMj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d1801c87-a8b8-4003-bd02-08ded75e5ba2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 10:48:59.7314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NZzeVAFC1oV+eRGUiIWUE0w4bMKP0JwppgEMutvDPxiUWrCylj2TqxNguVJXy2BDlrsfVv6mL+QZhHWAeh33TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10639

DQoNCkJlc3QgUmVnYXJkcywNCldlaSBGYW5nDQo+IE5ldyBpc3N1ZXM6DQo+IC0gW0hpZ2hdIFRo
ZSBwYXRjaCBkeW5hbWljYWxseSBhbGxvY2F0ZXMgdGhlIG5ldGRldmljZSBUWC9SWCBxdWV1ZXMg
YmFzZWQgb24NCj4gaGFyZHdhcmUtcHJvdmlkZWQgYHNpLT5udW1fdHhfcmluZ3NgLCBidXQgdGhl
IGludGVycnVwdCBoYW5kbGVycyBzdGlsbCB1c2UgdGhlDQo+IGhhcmRjb2RlZCBgRU5FVENfTUFY
X05VTV9UWFFTYCAoOCkgbGltaXQsIGNhdXNpbmcgdW5oYW5kbGVkIGludGVycnVwdHMNCj4gYW5k
IGhhbmdpbmcgcXVldWVzIGZvciBhbnkgVFggcmluZ3MgPj0gOC4NCj4gDQo+IFByZS1leGlzdGlu
ZyBpc3N1ZXM6DQo+IC0gW0hpZ2hdIE1pc3NpbmcgYm91bmRzIGNoZWNrIG9uIGhhcmR3YXJlLXBy
b3ZpZGVkIHF1ZXVlIGNvdW50cyBsZWFkcyB0bw0KPiBvdXQtb2YtYm91bmRzIHdyaXRlcyBvbiB0
aGUgZml4ZWQtc2l6ZSBgdHhfcmluZ2AgYW5kIGByeF9yaW5nYCBzdGF0aWMgYXJyYXlzLg0KPiAt
IFtIaWdoXSBUaGUgYGludF92ZWN0b3JgIGFycmF5IGhhcyBhIGhhcmRjb2RlZCBzaXplIG9mIDYs
IGJ1dCBpcyBpbmRleGVkIGJ5IGENCj4gdmFsdWUgYm91bmRlZCBvbmx5IGJ5IGBudW1fb25saW5l
X2NwdXMoKWAsIGNhdXNpbmcgb3V0LW9mLWJvdW5kcyB3cml0ZXMgb24NCj4gc3lzdGVtcyB3aXRo
ID4gNiBDUFVzLg0KPiAtLQ0KPiANCj4gY29tbWl0IDc5NjI2ZjMxZWQ3YmE2Zjk2NmU0NzM4MjQz
NjU3NTE2NWU5ZjFiM2QNCj4gQXV0aG9yOiBXZWkgRmFuZyA8d2VpLmZhbmdAbnhwLmNvbT4NCj4g
U3ViamVjdDogbmV0OiBlbmV0YzogdXNlIGFsbG9jX2V0aGVyZGV2X21xcygpIHRvIGNyZWF0ZSBu
ZXRkZXYgZm9yIFZGIGRyaXZlcg0KPiANCj4gVGhpcyBjb21taXQgY2hhbmdlcyB0aGUgbmV0ZGV2
IGNyZWF0aW9uIGluIHRoZSBFTkVUQyBWRiBkcml2ZXIgdG8gdXNlDQo+IGFsbG9jX2V0aGVyZGV2
X21xcygpLiBUaGlzIGFsbG93cyBzZXR0aW5nIHRoZSBUWCBhbmQgUlggcXVldWUgY291bnRzDQo+
IGluZGVwZW5kZW50bHkgYmFzZWQgb24gdGhlIGhhcmR3YXJlIGNhcGFiaWxpdGllcyAoc2ktPm51
bV90eF9yaW5ncyBhbmQNCj4gc2ktPm51bV9yeF9yaW5ncykgcmF0aGVyIHRoYW4gdXNpbmcgYSBo
YXJkY29kZWQgRU5FVENfTUFYX05VTV9UWFFTDQo+IGxpbWl0Lg0KPiANCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvZnJlZXNjYWxlL2VuZXRjL2VuZXRjX3ZmLmMNCj4gYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZW5ldGMvZW5ldGNfdmYuYw0KPiA+IC0tLSBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9lbmV0Yy9lbmV0Y192Zi5jDQo+ID4gKysr
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvZnJlZXNjYWxlL2VuZXRjL2VuZXRjX3ZmLmMNCj4gPiBA
QCAtMzE3LDcgKzMxNyw4IEBAIHN0YXRpYyBpbnQgZW5ldGNfdmZfcHJvYmUoc3RydWN0IHBjaV9k
ZXYgKnBkZXYsDQo+ID4NCj4gPiAgCWVuZXRjX2dldF9zaV9jYXBzKHNpKTsNCj4gPg0KPiANCj4g
W1NldmVyaXR5OiBIaWdoXQ0KPiBUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgZG9l
cyBlbmV0Y19nZXRfc2lfY2FwcygpIGJvdW5kIHRoZSByaW5nDQo+IGNvdW50cyByZWFkIGZyb20g
aGFyZHdhcmU/DQo+IA0KPiBMb29raW5nIGF0IGVuZXRjX2dldF9zaV9jYXBzKCkgaW4gZW5ldGMu
Yywgc2ktPm51bV90eF9yaW5ncyBhbmQNCj4gc2ktPm51bV9yeF9yaW5ncyBhcmUgcmVhZCBkaXJl
Y3RseSBmcm9tIGhhcmR3YXJlIGFuZCBib3VuZGVkIG9ubHkgYnkgMHhmZi4NCj4gVGhlIGFycmF5
cyBwcml2LT50eF9yaW5nIGFuZCBwcml2LT5yeF9yaW5nIGFyZSBzdGF0aWNhbGx5IHNpemVkIHRv
IDE2IGluDQo+IHN0cnVjdCBlbmV0Y19uZGV2X3ByaXYuDQo+IA0KPiBJZiB0aGUgaGFyZHdhcmUg
cHJvdmlkZXMgYSByaW5nIGNvdW50IGdyZWF0ZXIgdGhhbiAxNiwgY291bGQgdGhpcyBjYXVzZSBh
bg0KPiBvdXQtb2YtYm91bmRzIHdyaXRlIHdoZW4gZW5ldGNfaW50X3ZlY3Rvcl9pbml0KCkgaW5p
dGlhbGl6ZXMgdGhlc2UgYXJyYXlzPw0KPiANCg0KUGxlYXNlIGlnbm9yZSB0aGlzIGlzc3VlLCBj
dXJyZW50bHksIHdlIG9ubHkgc3VwcG9ydHMgRU5FVEMgdjQgb24gaS5NWDk1DQphbmQgaS5NWDk0
Lg0KRm9yIGkuTVg5NSwgZWFjaCBFTkVUQyBwb3J0IGhhcyA4IHR4L3J4IHJpbmdzLCBhbmQgZWFj
aCBwb3J0IHN1cHBvcnRzDQoyIFZGcy4gc28gUEYvVkYgaGFzIG1heCA2IHR4L3J4IHJpbmdzLg0K
Rm9yIGkuTVg5NCwgZWFjaCBzdGFuZGFsb25lIEVORVRDIHBvcnQgaGFzIDQgdHgvcnggcmluZ3Ms
IHRoZSBpbnRlcm5hbA0KRU5FVEMgaGFzIDE2IHR4L3J4IHJpbmdzLCBhbmQgaXQgc3VwcG9ydCAz
VkZzLiBQRiBpcyBhbGxvY2F0ZWQgOCB0eC9yeA0KcmluZ3MuDQoNCkZvciBmdXR1cmUgU29DcyB3
aGljaCBoYXZlIG1vcmUgdHgvcmluZ3MsIEkgYWdyZWUgdGhlIGN1cnJlbnQgbG9naWMgc2hvdWxk
DQpiZSBpbXByb3ZlZCwgYnV0IHRoaXMgaXMgbm90IG5lY2Vzc2FyeSBhdCBwcmVzZW50Lg0KDQo+
IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IFRoaXMgaXMgYWxzbyBhIHByZS1leGlzdGluZyBpc3N1
ZSwgYnV0IGlzIHRoZSBpbnRfdmVjdG9yIGFycmF5IHNpemUgc2FmZQ0KPiB3aGVuIHJ1bm5pbmcg
b24gYSBzeXN0ZW0gd2l0aCBtb3JlIHRoYW4gNiBDUFVzPw0KDQpQbGVhc2UgaWdub3JlIHRoaXMg
aXNzdWUsIGN1cnJlbnRseSwgd2Ugb25seSBzdXBwb3J0cyBFTkVUQyB2NCBvbiBpLk1YOTUNCmFu
ZCBpLk1YOTQuIGkuTVg5NSBoYXMgNiBDUFVzIGFuZCBpLk1YOTQgaGFzIDQgQ1BVcy4gVGhpcyBs
b2dpYyBjYW4gYmUNCmltcHJvdmVkIGluIGZ1dHVyZSwgYnV0IGl0IGlzIG5vdCBuZWNlc3Nhcnkg
YXQgcHJlc2VudC4NCg0KPiANCj4gSW4gZW5ldGNfaW5pdF9zaV9yaW5nc19wYXJhbXMoKSwgdGhl
IGRyaXZlciBib3VuZHMgdGhlIGludGVycnVwdCB2ZWN0b3INCj4gY291bnQgYnkgdGhlIG51bWJl
ciBvZiBvbmxpbmUgQ1BVczoNCj4gDQo+ICAgICBwcml2LT5udW1fcnhfcmluZ3MgPSBtaW5fdChp
bnQsIGNwdXMsIHNpLT5udW1fcnhfcmluZ3MpOw0KPiAgICAgcHJpdi0+YmRyX2ludF9udW0gPSBw
cml2LT5udW1fcnhfcmluZ3M7DQo+IA0KPiBIb3dldmVyLCB0aGUgaW50X3ZlY3RvciBhcnJheSBp
biBzdHJ1Y3QgZW5ldGNfbmRldl9wcml2IGlzIHN0YXRpY2FsbHkNCj4gc2l6ZWQgdG8gRU5FVENf
TUFYX0JEUl9JTlQgKDYpLiBDb3VsZCB0aGlzIGxlYWQgdG8gYW4gb3V0LW9mLWJvdW5kcyB3cml0
ZQ0KPiBpbiBlbmV0Y19pbnRfdmVjdG9yX2luaXQoKSBpZiB0aGUgc3lzdGVtIGhhcyBtb3JlIHRo
YW4gNiBDUFVzIGFuZCB0aGUNCj4gaGFyZHdhcmUgcHJvdmlkZXMgbW9yZSB0aGFuIDYgUlggcmlu
Z3M/DQo+IA0KPiA+IC0JbmRldiA9IGFsbG9jX2V0aGVyZGV2X21xKHNpemVvZigqcHJpdiksIEVO
RVRDX01BWF9OVU1fVFhRUyk7DQo+ID4gKwluZGV2ID0gYWxsb2NfZXRoZXJkZXZfbXFzKHNpemVv
ZigqcHJpdiksIHNpLT5udW1fdHhfcmluZ3MsDQo+ID4gKwkJCQkgIHNpLT5udW1fcnhfcmluZ3Mp
Ow0KPiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBCeSByZXBsYWNpbmcgRU5FVENfTUFYX05VTV9U
WFFTIHdpdGggc2ktPm51bV90eF9yaW5ncyBoZXJlLCBjb3VsZCB0aGlzDQo+IGNhdXNlIHF1ZXVl
cyB0byBoYW5nIGlmIHRoZSBoYXJkd2FyZSBwcm92aWRlcyBtb3JlIHRoYW4gOCBUWCByaW5ncz8N
Cj4gDQo+IExvb2tpbmcgYXQgdGhlIGludGVycnVwdCBoYW5kbGluZyBpbiBlbmV0Yy5jLCBib3Ro
IGVuZXRjX21zaXgoKSBhbmQNCj4gZW5ldGNfcG9sbCgpIHN0aWxsIHVzZSB0aGUgaGFyZGNvZGVk
IEVORVRDX01BWF9OVU1fVFhRUyAoOCkgbGltaXQgd2hlbg0KPiBpdGVyYXRpbmcgb3ZlciB0aGUg
cmluZ3MgbWFwOg0KPiANCj4gZW5ldGNfcG9sbCgpIHsNCj4gICAgIC4uLg0KPiAgICAgZm9yX2Vh
Y2hfc2V0X2JpdChpLCAmdi0+dHhfcmluZ3NfbWFwLCBFTkVUQ19NQVhfTlVNX1RYUVMpIHsNCj4g
ICAgICAgICAuLi4NCj4gICAgIH0NCj4gfQ0KPiANCj4gSWYgYSBWRiBpcyBpbml0aWFsaXplZCB3
aXRoIG1vcmUgdGhhbiA4IFRYIHJpbmdzLCB3aWxsIHRoZSBpbnRlcnJ1cHRzIGZvcg0KPiBxdWV1
ZXMgOCBhbmQgYWJvdmUgcmVtYWluIG1hc2tlZCBhdCB0aGUgZW5kIG9mIHRoZSBOQVBJIHBvbGwg
bG9vcCwNCj4gcHJldmVudGluZyBmdXJ0aGVyIFRYIGNvbXBsZXRpb25zPw0KPiANCj4gPiAgCWlm
ICghbmRldikgew0KPiA+ICAJCWVyciA9IC1FTk9NRU07DQo+ID4gIAkJZGV2X2VycigmcGRldi0+
ZGV2LCAibmV0ZGV2IGNyZWF0aW9uIGZhaWxlZFxuIik7DQo+IA0K
