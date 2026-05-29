Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2102.outbound.protection.partner.outlook.cn [139.219.146.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D78348C61
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 08:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042518; cv=fail; b=pTOJiOa1sR3i+4RcMDwQUd96kjdyhVso08lWmrxZKHXHpbZTcx+SIK8FXWU9Il22Uip78FnQ0czftLBmsQxlv2YU/4pf50DCiStDNaKexVrg46cAisM6X9AhcnDUtHsb6NcdYHMAiiekSclBKOS396Np2Q+7iZuX3v+GXbS3a7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042518; c=relaxed/simple;
	bh=S2aGyo0L+C+Oj0BkktWwIjrsDuvAxbiG1HsM0EuFL6s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kjV/yDi3CobvJNNV7SkpW4h3qXI6obilyfsgn8bys/OXUEavkhTQHRurgxJHRutisMdh5ae2uR/+ZHmgg1tNW8coEi855lUEm6dD3twAmbUqbj3705n4MhXxC6MeH7iKLrSNYdzlLoNgCDdcVwjEBNPQI4KGiKuxu7Xk8BgcJrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hc6BDWjjNRu3J7ZvK1IBz14zK2VFfH/G6+8VAvZWkhDcKhUAmz0IwlXgEtMcB8jgMhkl/ecxKd710WSOKdzlVOBPaZceYr8ibfqcwBnIFtUGbJiRPNnz0eE2EB0zeSD5jvFXq5ZeJv76Zinsg/h65+k8HtSq/srl7fohHFxNSiGRP469HELwWCKgCMOmGF0rQtgBIAj/yTTvSiSyFOVM8aLl7/dRXFCSLpwXqiueqEToUA9L7Dd5w1KYlZFUAHeFfLtW5lmvLFY643VlVUHttpi7XJ/PL04T5N/747Ut5r0/zUX0ESG3EbR59TvdSIQV1D4Hdt3XwEfhzWgkqEWDsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2aGyo0L+C+Oj0BkktWwIjrsDuvAxbiG1HsM0EuFL6s=;
 b=D08vP1r/i5kT+3nGPx0XY9yX7BVgarXxrdd71opCLwLkBy35ERAOLdRaItiNnFUMVaLpHCPFHaDdCGz2iAG5yxmFpzROHb0+2/4j2A3SCpe1NrS+D+5dlQTiOdZCe0E3pefdLGHlaOcZG1Jv+aON8B+AfaW79Aa5z0AzI3k99J+PDryJ8pSqlm5oSxhI4XOTlkZLRPtVhfmU3bj3qcJLQgYcPI9o5xUdOI4qidvQPCyIE7fQrNPBN5d2jeUWdVmJQlsaQnQWZFkoxALAQ74RYtWcuOnIJsIogAZylfkPQiCN24GGqw01clAw7kLafXsWLiqMIRz46uk9L/MsAst1NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1275.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:10::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 07:59:17 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::4386:5cc4:3bc4:4795]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::4386:5cc4:3bc4:4795%3])
 with mapi id 15.21.0071.014; Fri, 29 May 2026 07:59:17 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v18 2/3] riscv: dts: starfive: Correct pwm nodes
Thread-Topic: [PATCH v18 2/3] riscv: dts: starfive: Correct pwm nodes
Thread-Index: AQHc5C5T9NgT6hO6HEiFtrligTX8arYOoXmAgBYYQRA=
Date: Fri, 29 May 2026 07:59:17 +0000
Message-ID:
 <ZQ2PR01MB1307E58DBE3D3EA2DCA9BE9AE6162@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20260515054723.25024-3-hal.feng@starfivetech.com>
 <20260515063446.02792C2BCB0@smtp.kernel.org>
In-Reply-To: <20260515063446.02792C2BCB0@smtp.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1275:EE_
x-ms-office365-filtering-correlation-id: a643665b-3042-49c8-ffb0-08debd582f1b
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|38070700021|56012099006|4143699003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 WesEDpPyCNJqgU8SeVH5W+pGY09O69zINjOZ27YeHiKpUFIVbXFFYMVhmBmIW1pU1WNxJwB5XErKquWfHVatrqwl8zAM2iKdsqikfi+S8fGfVsnbmaDtk73B+9vDei3GWl7y6yDzhT473qWGSmCxuRdoxc762hdAz9hgeVFDg3lpVe4o/GrA/3LTa1R3gq3txZyYUkHokLHicfCCg/RAhlVf5xsLWM3AcIQdeD387VYzPc3JRsMr4rok1emtOMP1RvGrqT7joZ7zSCE1jNz9YFz2kG7YvIz5C8IRW2Tg7/xa9c4TzgpbGQ9N6+jat66OO8YCnku5O5IwhJ6pA2xnFN60oCnIiTYLtWeHRBOtxy6oTcmuK3C1GbxkgrdcgZ6HAFI2g5qPDraLw46VdzYbexvtDM4aI3xVbnOtrAj5URFWbswWvSpHqPA2NqDlpsFYK+hyCf54VstWntT/n2g4irRB9XqhtVE8N8mNmF83ReUl+fwn3AQKMXBQMrz3z6YLatkInYNc+jTeqiocmtdG9AyEliYgSeJqfVEjVl3tG8rv+3DRKk08RZKtxlvWsswJ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T0V5T2ttU01mZzVzbW90TWZZTUdxcGVuN0h6TWVPeUFmcHVzTnBMZHF5Rjhm?=
 =?utf-8?B?VW92L0x2NXFzMFZzQnF0MUF4MDhpNG9EcHNNL1U2TDRJZjJEcGsrQUlhUjV6?=
 =?utf-8?B?czJrRTBISG12dWo4VWFRaUpxOEtEOEdmMmdLUEZzMmtJV1NEb1hZYkZxYzVy?=
 =?utf-8?B?Tkw2UWV4NHJVRVViQXlRMU5qUkRTa1NGcXpoTms4YXkralA5UEVPTTdPQTU1?=
 =?utf-8?B?eTRrL0h0cjE1NjR1SExXRUhUNlZyRWlocUREbEhiVk1zNUVqcFFtTnV5YWx6?=
 =?utf-8?B?ekV2M3BxV2hnYkZBWHE0OU9LSTl1SkdaQmI3bVJQLzU5ejhrOHRLUytQWnlh?=
 =?utf-8?B?Y3dwTkxNNkppdGx3MStHSWgrSjY3RHNKaDR3YjU2NU15aVg3M082eDRUKzVE?=
 =?utf-8?B?OVhMT2RyZXFtQTNTdUVjWkJxVE1DbVJRcXNlL25CcmNYSTVUNmZuV1l1ZFhw?=
 =?utf-8?B?OUtDWlZNbWFkOW5lcnNMdGdob0ptTUF1QklydDdTQUtqRG9jYnJ6ZjVsQ3M2?=
 =?utf-8?B?cXEyRVZEcXBiWExmaW1UblZQcUxSWmZWRWJoMldUVEVEUjdqSXlrZlBnL0kw?=
 =?utf-8?B?V1JwY0trYm5SdkVwdjdtV0NxTXlwMXdyWU83N0xrZUt2NDV5RUtFSUc5RnRD?=
 =?utf-8?B?ME5GdzVIM1V6dDlVNkNjeW9LNzh3QWxpdlZmMVM4WUdPTncwekxUYThZOHk1?=
 =?utf-8?B?VUdNZmtRZWI3QldZc2dTU0ZhblFOUkw0MmNkY0tLSjZmQVozK25yd1N0aWor?=
 =?utf-8?B?ZkwzV3g5K21oQ0cvRFhWNnRNNHNPcmZIUjhnaEVxeC9kbE1JdTl4cngxNk1l?=
 =?utf-8?B?ZEtFcjAxMkdoTStlOVdTd2ZpeEpGUURjUytxYW9ZUDJiaWJVdEtLZVNWaWNQ?=
 =?utf-8?B?a2ZSR2FNVXNqam81dS94d2lkdUdrR1htM1JnaVBveTN4UFBuL3g1dUZwS3J2?=
 =?utf-8?B?WWhwZnNqdzl0L1BpSVRNTjBrbkdsZUdFWjExejQyQ0Exc2crNUtzcUxmbXl2?=
 =?utf-8?B?ajZDcmxYVW9hd1VFREorUzdreFhSNmQxcHp1WC9rcG94OEZuMW8xYnlCazRY?=
 =?utf-8?B?RWtUTzBmYmJoMEt6Y0J5SmZhMFlnWHJ2aUJHUFV0VDExZHBoVVJEbjhUbFhX?=
 =?utf-8?B?c0E4eUZRQ25qUDNlWmt3K1BXV3hqaDVVQXM5L0NOU24rTTdDcVRSNG56UjFV?=
 =?utf-8?B?OFZMYTZDOUtrai9KUW40aUZudmw2SlRjbXdLU3c0NEZjY0NGaWNVVFV4Tjkr?=
 =?utf-8?B?UkNXcjg1d3dnL290TE95OEtqRmpQRGp2K3Z1TXBMellTVWVOMEh1N203MmxM?=
 =?utf-8?B?S0NaczFLQ3U4TUswVUExbEVqNEJUNGhNYWt0ZVUwcmthQ3kvZksrUUsrZjlt?=
 =?utf-8?B?WnNnZmFEZnR4SjFsdjVaa0hUc3RFNzJTcGhGSzQ4YjQwSTNpcnAxVjEyRDJ4?=
 =?utf-8?B?Q3FLTllnaElLNGFyOWRBRDg5d21iaVkwcTluU0wxUkJOdWhnbDdvQWVDdC9v?=
 =?utf-8?B?c3REZCsrSU1iQ3ljY29kSHB0VEc4Uk5OanY4a3BYTFNONmIzVFZEd1BRZ1lL?=
 =?utf-8?B?Wnd6Y3RHbFhMR0h4TzNSdThzQmRkUXV1b3QxVFRhREdBTkFtM3crNm55VU9v?=
 =?utf-8?B?YW92cW5ISE0vQ3BaeUMxdm9KeW9HS3JSUFVGN2ZZMFBPVHhkYzh3RlE2clkv?=
 =?utf-8?B?TGUxM2lVV2VBRGx3WHZoSnJweFExbStQdFlrcFhYZWg2ekRvRWhPM3pVYnpX?=
 =?utf-8?B?a2RhUlNlZ1lUMVFBWVdYeXdhbW96R0d6OG9ZWTB6ZFQ5VWpuTG9Gc3h4Y2JJ?=
 =?utf-8?B?bUJNT2xVSkR0UG51R29VWDhhNGtKQTRNdjJUSGsrTnNhcFFzVFc2UWNCQzBX?=
 =?utf-8?B?N2lnOFpBTVpocVdmTzBMVmZMVk1TbmUxWk40bjh4WXVYVnVvbjlrbTE0WG9a?=
 =?utf-8?B?ZWpnMkRkblQ1cGRsRnMzdWxQUFI5SmZEYWhvK0lQTWE4N3REa1YvVThaR1FV?=
 =?utf-8?B?QkUzak9CK1N4SDBpczQvVmQrWGs4b0NYa2MvVDlBQlVtUUhKSlRHaGpVVDA1?=
 =?utf-8?B?S25sZDIrMDBiVGpjYTI4c0FDT3RQUW0yUC9tNHRnaUowM1djVU02czg0SDll?=
 =?utf-8?B?eGxQY2JhcjQ2dkQrWXYxSnIrdHB1d0tzazhFazBnczFaUzYxaHdreTRQejBj?=
 =?utf-8?B?VkFiNEhvN1pnSlNiWU1CaWJqR0NBNnRLdytNUVNQQ0kybVVpNkFyUUFNcmNo?=
 =?utf-8?B?U2IvWXJQNUdMRW1TQ2RCaGcyd1Fnd2t3bVRLVlovZkVFR2NVaFBTTGc5TlFV?=
 =?utf-8?B?aFVqWEsvTmVKNDRJbnhydzl0QWNKK3BhT0xmdGVKbEJ3YTUrOEtodz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a643665b-3042-49c8-ffb0-08debd582f1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 07:59:17.8003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: axB2NmjZqmzvBWOfdViPTgs6ITaLR+HyhOPM7JV2Xs46HHnHwErRhLU2oQuhWwpFTJAMBcOS3eZXFB3QT+LwO0bkh5po8CA6VYI9YH3RSiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1275

PiBPbiAyNi4wNS4xNSAxNDozNSwgc2FzaGlrby1ib3Qgd3JvdGU6DQo+IFRoYW5rIHlvdSBmb3Ig
eW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDIgcG90ZW50aWFsIGlz
c3VlKHMpIHRvDQo+IGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBQaW5tdXggY29uZmlndXJhdGlvbiBw
cm9wZXJ0aWVzIHdlcmUgZXJyb25lb3VzbHkgb21pdHRlZCBmcm9tDQo+IGBwd20xX3BpbnNgIGlu
IGBqaDcxMDAtY29tbW9uLmR0c2lgLg0KPiAtIFtNZWRpdW1dIFJlbW92YWwgb2YgU29DLXNwZWNp
ZmljIGNvbXBhdGlibGUgc3RyaW5ncyB2aW9sYXRlcyBEZXZpY2UgVHJlZSBBQkkNCj4gYmVzdCBw
cmFjdGljZXMuDQo+IC0tDQo+IA0KPiBjb21taXQgZTA1YWY4MzM5OGE0OWQ3OWE1NGRhMWJhZDhl
NjRjN2MxZTVmOThlYg0KPiBBdXRob3I6IEhhbCBGZW5nIDxoYWwuZmVuZ0BzdGFyZml2ZXRlY2gu
Y29tPg0KPiANCj4gcmlzY3Y6IGR0czogc3RhcmZpdmU6IENvcnJlY3QgcHdtIG5vZGVzDQo+IA0K
PiBUaGlzIGNvbW1pdCB1cGRhdGVzIHRoZSBQV00gbm9kZXMgZm9yIFN0YXJGaXZlIEpINzEwMCBh
bmQgSkg3MTEwIFNvQ3MsDQo+IHNwbGl0dGluZyB0aGUgb3JpZ2luYWwgc2luZ2xlIFBXTSBub2Rl
IGludG8gOCBpbmRpdmlkdWFsIG5vZGVzIHJlcHJlc2VudGluZyB0aGUgOA0KPiBPcGVuQ29yZXMg
UFRDIElQIGNvcmVzLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9z
dGFyZml2ZS9qaDcxMDAtY29tbW9uLmR0c2kNCj4gPiBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3Rh
cmZpdmUvamg3MTAwLWNvbW1vbi5kdHNpDQo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9z
dGFyZml2ZS9qaDcxMDAtY29tbW9uLmR0c2kNCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3N0YXJmaXZlL2poNzEwMC1jb21tb24uZHRzaQ0KPiANCj4gWyAuLi4gXQ0KPiANCj4gPiArCXB3
bTFfcGluczogcHdtMS0wIHsNCj4gPiArCQlwd20xLXBpbnMgew0KPiA+ICsJCQlwaW5tdXggPSAg
PEdQSU9NVVgoNSwNCj4gPiAgCQkJCSAgR1BPX1BXTV9QQURfT1VUX0JJVDEsDQo+ID4gIAkJCQkg
IEdQT19QV01fUEFEX09FX05fQklUMSwNCj4gPiAgCQkJCSAgR1BJX05PTkUpPjsNCj4gPiAgCQl9
Ow0KPiA+ICAJfTsNCj4gDQo+IEluIHRoZSBvcmlnaW5hbCBjb2RlLCB0aGUgc2luZ2xlIHB3bV9w
aW5zIG5vZGUgYXBwbGllZCBlbGVjdHJpY2FsIHByb3BlcnRpZXMgbGlrZQ0KPiBiaWFzLWRpc2Fi
bGUsIGRyaXZlLXN0cmVuZ3RoID0gPDM1PiwgaW5wdXQtZGlzYWJsZSwgaW5wdXQtc2NobWl0dC1k
aXNhYmxlLCBhbmQNCj4gc2xldy1yYXRlID0gPDA+IHRvIGJvdGggUFdNMCBhbmQgUFdNMSBwaW5z
LiBXaGVuIHNwbGl0dGluZyB0aGUgbm9kZSwgdGhlc2UNCj4gcHJvcGVydGllcyB3ZXJlIGNvcGll
ZCB0byBwd20wX3BpbnMgYnV0IG9taXR0ZWQgaGVyZS4NCg0KTm8sIEkgYWRkZWQgdGhlIG5ldyBl
bGVjdHJpY2FsIHByb3BlcnRpZXMgZm9yIHB3bTAtcGlucywgc28gdGhlIG9sZCBlbGVjdHJpY2Fs
IHByb3BlcnRpZXMNCmFyZSBhcHBsaWVkIHRvIHB3bTEtcGlucy4gWW91IG9taXR0ZWQgdGhlIG9y
aWdpbmFsIGNvZGUgYW5kIGdvdCBhIHdyb25nIHJlc3VsdC4gUGxlYXNlDQphcHBseSB0aGUgcGF0
Y2hlcyB0byB0aGUgbWFpbmxpbmUgYmVmb3JlIHlvdSByZXZpZXcgdGhlbS4NCg0KPiANCj4gV2ls
bCBvbWl0dGluZyB0aGVzZSBwcm9wZXJ0aWVzIGNhdXNlIHRoZSBwd20xIG91dHB1dCB0byBvcGVy
YXRlIHdpdGggdW5kZWZpbmVkDQo+IG9yIGRlZmF1bHQgaGFyZHdhcmUgcGluIHN0YXRlcyBpbnN0
ZWFkIG9mIHRoZSBpbnRlbmRlZCBwYXJhbWV0ZXJzPw0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMDAuZHRzaQ0KPiA+IGIvYXJjaC9yaXNjdi9i
b290L2R0cy9zdGFyZml2ZS9qaDcxMDAuZHRzaQ0KPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc3RhcmZpdmUvamg3MTAwLmR0c2kNCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0
YXJmaXZlL2poNzEwMC5kdHNpDQo+IA0KPiBbIC4uLiBdDQo+IA0KPiA+IC0JCXB3bTogcHdtQDEy
NDkwMDAwIHsNCj4gPiAtCQkJY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMDAtcHdtIiwgIm9w
ZW5jb3Jlcyxwd20tdjEiOw0KPiA+IC0JCQlyZWcgPSA8MHgwIDB4MTI0OTAwMDAgMHgwIDB4MTAw
MDA+Ow0KPiA+ICsJCXB3bTA6IHB3bUAxMjQ5MDAwMCB7DQo+ID4gKwkJCWNvbXBhdGlibGUgPSAi
b3BlbmNvcmVzLHB3bS12MSI7DQo+IA0KPiBJcyBpdCBpbnRlbnRpb25hbCB0byBkcm9wIHRoZSBT
b0Mtc3BlY2lmaWMgInN0YXJmaXZlLGpoNzEwMC1wd20iIGNvbXBhdGlibGUgc3RyaW5nDQo+IGhl
cmUsIGFzIHdlbGwgYXMgInN0YXJmaXZlLGpoNzExMC1wd20iIGluIGpoNzExMC5kdHNpPw0KPiAN
Cj4gRGV2aWNlIFRyZWUgYmVzdCBwcmFjdGljZXMgZ2VuZXJhbGx5IHJlY29tbWVuZCByZXRhaW5p
bmcgU29DLXNwZWNpZmljIHN0cmluZ3MNCj4gYWxvbmdzaWRlIGdlbmVyaWMgSVAgc3RyaW5ncy4g
VGhpcyBlbnN1cmVzIHRoYXQgaWYgU29DLXNwZWNpZmljIGludGVncmF0aW9uIHF1aXJrcyBhcmUN
Cj4gZGlzY292ZXJlZCBsYXRlciwgd29ya2Fyb3VuZHMgY2FuIGJlIGFwcGxpZWQgd2l0aG91dCBy
ZXF1aXJpbmcgdXNlcnMgdG8gdXBkYXRlDQo+IGRlcGxveWVkIGRldmljZSB0cmVlcywgYW5kIGl0
IG1haW50YWlucyBBQkkgY29tcGF0aWJpbGl0eSBmb3Igb2xkZXIga2VybmVscyB0aGF0DQo+IG1p
Z2h0IG1hdGNoIGFnYWluc3QgdGhlIHJlbW92ZWQgc3RyaW5ncy4NCg0KV2lsbCBkcm9wIHRoZSBj
b21wYXRpYmxlIGNoYW5nZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLiBUaGFua3MuDQoNCkJlc3QgcmVn
YXJkcywNCkhhbA0KDQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJDQo+IHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MTUwNTQ3MjMuMjUwMjQtMS1oYWwuZmVuZ0Bz
DQo+IHRhcmZpdmV0ZWNoLmNvbT9wYXJ0PTINCg==
