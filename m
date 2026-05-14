Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D453CE098
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 22:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778799388; cv=fail; b=lVsdpHN0JsUc03vLiXcxhMcMdKZBE8hxshn9MFmhu6mHYUdnm3Vsl/hZbpXyMswWvAq/OBM7pZay6TWI6Jeu/PYJ9FRm/o+vUhUGxJqNH9Sy8C6PVcJiA5KFbUxTHJEC9Mgval8IdN31HXtNMrs8tZ6VmNNA8V6U9iSMFVdldl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778799388; c=relaxed/simple;
	bh=/moJf4d0l1H2rNoveqilYqW7G08JliCqQoHDbu4+3+U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BIw3MUUlRWky9Eg5lVzKeN+494jwpMXZT67PFrNf3soO9/DfAbOZTGRL9VFFCxOExpO6RxuhSkkHOIY0okTiZ3Wduzpv313H6ydxoKAY8VP01d5a8jibmmnSw4oMWHupzdjr/LWOt2RU59+dVoDNQvHf5QFIUJuO9/4FNvO7vTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ttQ1XSKg; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ttQ1XSKg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jANIuGmjqL8VmqLOEeawl5AF5VRHPSJUHniLC0UzIrqQkghqEvIwp4Wmbygw6sKNMe1LtNGKi/hNWVzVC0o3Az3s10bBHmm1uwnrfjNUpI6XRD3LmWl2XBycNC5AGvzLTTwlJBwdpHBGnph2GXcahLywSe0yrTknlTtrPnFAy3LxSpQT+xgXvoUG8BJkBvySO/0aR6IeCgf7rh+ymvWQtRDNWno5T0lG0v1XtK9jMb5n/00WUixlHNKUbtlMNqoC+4q9cxA5f5yQpkyNi772QTmFUGuvwAIG/3ijYd1k4u8+Y1Fp7y8eifpb3xMMyQEzia86rQhrRfGhqWH5yIEgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/moJf4d0l1H2rNoveqilYqW7G08JliCqQoHDbu4+3+U=;
 b=XlZq2M2T4nWJtUU5Ee2qVEbzmOjLWmvIut6uSCgdNWZDBWMxQlWDQup7xpl0bYqXYsy1FJhPNTx73Z4nl+Swfs+onHcXjTrxVePE6VwH5MSkkxtESX+Gg6rLolRJ8xOwwhiAS2lWRaCnyDKUYpCIhXETTNANoRfNLlF+c+sLMVtlmbELxtV1gTWePYXQuOTcPXYvaWpFo9O7vBnoEFb3q21yJOIeuD4FL0c1MCIT5u7A/S9b/g4jTOtKIE8345R8v/QIbnfWom7cOSed0vaoniDtfplbAEBVT3GRoAvmK9qUj/OAoYaDVL3UwIi5/GJfQcyNzB5N3hJUAWIDwXndTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/moJf4d0l1H2rNoveqilYqW7G08JliCqQoHDbu4+3+U=;
 b=ttQ1XSKgBJ6Y3nDD4Cncge0cFdS8ZF14fyjauB5LZNjUHiBg0cKlPp6d9SP0uwrUil/dzLayjWqPoMhtvY/gpsJkFT0dXW+ZzS0JK226+9h2ELdCICs6F0pBLBLRv+ifXg9+7oPoguSWDVNacexFMeKieakhIkTL7kPeJLpSgqc=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB13445.jpnprd01.prod.outlook.com (2603:1096:405:1e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 22:56:23 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9913.012; Thu, 14 May 2026
 22:56:23 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>
Subject: RE: [PATCH v6 14/16] ASoC: rsnd: src: Add SRC reset and clock support
 for RZ/G3E
Thread-Topic: [PATCH v6 14/16] ASoC: rsnd: src: Add SRC reset and clock
 support for RZ/G3E
Thread-Index: AQHc4j08eobqidsIDEiVEE4+07blV7YM+fKAgAEquMA=
Date: Thu, 14 May 2026 22:56:23 +0000
Message-ID:
 <TY6PR01MB17377BC1A8B40AC436C7B2151FF072@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-15-john.madieu.xa@bp.renesas.com>
 <20260514050500.5AA86C2BCB7@smtp.kernel.org>
In-Reply-To: <20260514050500.5AA86C2BCB7@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY4PR01MB13445:EE_
x-ms-office365-filtering-correlation-id: 4b50c497-78a8-4aed-55f3-08deb20c0572
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|11063799003|56012099003|22082099003|18002099003|4143699003;
x-microsoft-antispam-message-info:
 N3N+5RWPFO0kA82q/pJcQNJx/TCkbH8Gh6FvSHyMvq6wwwElZqQUPW2GeTNfY4ICt0Nipd8VXNImsb59DaUUmsjXwCeLEGvLijmS7dmhkMFk576j8I/RSR+n/I4jC8EmUTu0WEuGwoYBX0dWpWTNIYd9yNGyQRTxSkpNRaJb5Av5DBWjuA3LztEhxrvvCZ44HoKyWDirvetnreE1f3obqRsH/XMxKTk0QTAciTucTQ6l9dKf6Ne86k7W0v6mFDTJEs90JmXrNkc2jZEjrWCSmCiPPmba5c/iyBzyTDWnZg2Oj8g3o5wi8GsJ2pp0FNOnxsi/JJxgcpk50EYdWYsTsr8yo34wbp0rcsjUb/PQKZG8NbUahq5w3C/Xp3NetDCjfvYDsW2HwUoYugOmHBYvv2jdiuGJMddA92Kw+76pBDxpWjF75kV3CGTlTlzLP1sb3PDiA09h9Msj/lH/J/8eVhb4gONnULQQYeLr7k7yFJn5EXPBvDi/Qo5LSBwSEmRCOhpP2NXrQsakEeXXtYwxazRgymnrHCLZukZYvSQUDP17DK9kHMhsxDzD9GtJVi9ljEu73L8k2nW2zYKDvbQXJ0Ari9jsPwOLNXM/UgVl5H8Dw8XfPe9tCXoV8zIEHtDJPpkeaCS7HyNfKIR7A6119BCaD8eENw2kMoSG45vQTQrBQ77BJVenasj26m4UcyVSjJdyUjCMBhisV/6vpA3PB4goBe/aj8WNO94WdHT/aAWBWGO/DI76j4LQVV0VWm+o
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(11063799003)(56012099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N3pHNmFVTGdyeXZsdHBrSGZ6VnhkakxveStZa25DSUhCbmNzb2k5REFOOXRB?=
 =?utf-8?B?N1pjYWNEdC91VTROTnpHbVlGRWo5ZDdlMmZkbElyZTRFL1NXV1dQZ0Fkbmw1?=
 =?utf-8?B?cUtRSHpvR0NCYTIweUdhS05wWGlHQnY3UXBwT0IyS2QyZlhIWDJQMXljbVE0?=
 =?utf-8?B?b1dtTWxOUktsWDJ1WHdVWnlkRjNuQ2Q0QnF5Qi9zMmFhc3A5NENjVHpnOW9K?=
 =?utf-8?B?QUdaemJNK2d2dDBKcmliL2NURmt5Y0dScW1xeS92N0xLbWtrS1pyTHErMjZW?=
 =?utf-8?B?clRwbG1lTkNQWmM2Yk1pOW83bmROdWhwSkU1Zit3aVIzU2hUTENMS2NyT1dm?=
 =?utf-8?B?aHB2bVZUY21sd05pZUR4STRockgrQndDWGI3WXdkN2M2alRtT1NBOFY1THRs?=
 =?utf-8?B?b3RQRHcyQmFmc1VlT2FlVW1qQXhPRnRBMzhLQ2RrbjVUaFVJYm9uM0xmVHpC?=
 =?utf-8?B?U0hlWnRoT2pIUVRlTjY4U2NqTldvTjNraEx5Y3YyM1Z5Z2dqRGNKa2pOS25w?=
 =?utf-8?B?eWcrRTBLaUgwWXNzTXM4dEliYW85YXk5a3VSUG5oRW1WbGtjY1g3S2tIbTM1?=
 =?utf-8?B?SmZOTkp0N1dHUmJvYlJId2V2OENzbEdYSVZrYSsydFNob3ZORFVRUDljazZp?=
 =?utf-8?B?SUZ6bWJnTW1aVjVZa21mNnJmZ24xOFd6SSt6eFJNdE9DZVhMMFhvbm9iQis3?=
 =?utf-8?B?Ym5kMXNobW43MlBod0MxeFh0Wi9EaW44K2pVQzVKSFBpbm0vYW5waFkzeTNM?=
 =?utf-8?B?V0piMm9pRUs4Q1JjSGtEbXFrYlRlcklha2NsdGtTbzYwN2JLTXhGWGM5MlJS?=
 =?utf-8?B?aFQ4TnJUVHc4cU1oTFhUaU8zOVlaYTBjcmFwUGVuazRxMTA3eTV0a2VLQ0tR?=
 =?utf-8?B?MU1OUitvSk5ydUh0TEtEakF6akJYWEQ0OEFsdldRMERXSC9SbWo5a0puWThM?=
 =?utf-8?B?N2svQXA2YzdFRWtEdisxaUVjNW9xTWlxK3ErVmxndWlQOWo5TzNlMDNKMno2?=
 =?utf-8?B?MldweTQ2OTF1Y2FGNE9UY3hrTlBuQjJXS3RzaXRhbDdiaUZLRUNodkRGWExS?=
 =?utf-8?B?NlRnMUhtQkV4Z3pjekdFVFIwbmdTbEdtK0JwTHJ4a3QvYjNFckROb0NNeTlk?=
 =?utf-8?B?MHBZd0xJNDFGekJrNVFuWEd5d3BKM3hTS2RVU2FuNzJxQmVpc2R2eGd3QkhP?=
 =?utf-8?B?UURzZXJzSHhGd0toLytMVC9QeE5VQk9JWW8zZ05Iamh2V0lzVktaUHRwcUF1?=
 =?utf-8?B?RjA0cUpzMkxpcjFvVC9qblFUZmlIUDNja2lSTWU3RmlxT1hrN29UY3ZBWUtu?=
 =?utf-8?B?U1pGakZJUmpPYzhyNG1EK2ZUSzI5dnUyWGZMYWhGVU9UTlhwVmxyaEJKVFBM?=
 =?utf-8?B?K21FNWdUT1N6K09Xb0s5VEkzRGN2akg5VlNHOHZRdmg5dUh6R3dQU3FSbHMv?=
 =?utf-8?B?ZFNKSlZuemNXeitSTDUzV3hrVGcyVkpJTDh6SDVIWjhlYkJSOWJ5SGRhRU1Q?=
 =?utf-8?B?cUs5MzRreU1tUXA2dGZaRVg4WHhreUg5VDd6eEdKMm5sSGdxNE1vcW9lWE5K?=
 =?utf-8?B?eWE5TVFnaUV6VVcvT05uQUsrL3FZamhLRVNMcHpVeHI2aG5idmF2K1JuR3JL?=
 =?utf-8?B?eGF5b1U5cy9VTHB6ZklYVjl0NVExcXcvTy9lNUZtK0UvYVBJZDRTTFo1UHdB?=
 =?utf-8?B?VTdQUGx5WHR6b0ZuNG1LWDlZVlNTYXBkMTdIRlk1OHVld1B3cUNXb1pnZkRN?=
 =?utf-8?B?L1dMN3JtNllySDBYbTh2RSs2L1hDWWFkR05ZRm9menVEVGN1eHZwS09vWHRR?=
 =?utf-8?B?ai95Z2pGeWlNVElRNlBvb3FObW9BOGw0N081dSt0RmJ6U0VjZWRkQ3lsa3Ju?=
 =?utf-8?B?ODdZYkEzakt6WGowbHM4QlJZQUV6VElKaDgrYjlScWdOYUxDYlVIYVdSblBx?=
 =?utf-8?B?RHp5bk5tUXE4eGFySndNSitjQnJVRUZKdDFVUWZFUGFZVTcrNFkxZHNwVnlP?=
 =?utf-8?B?VUFJYzVDS203TVgzR0t4cFc4aWk1bjd1WjYyTllKWkRxK0FEZmRPc2RKLzdI?=
 =?utf-8?B?KzQxUS9kZktMUC9UMGwva05DSGJaWVI2RWQ5WkpOaE8vMjUydkZOeWdlcVhp?=
 =?utf-8?B?czRnVS8wRXFFVE8xakxxbTNnMmVDcXlLcWhKWGJKeUFISkJZUTVrc24vNnZo?=
 =?utf-8?B?ZWNxdlFleG1VUkNOQnNPRldHMm43WWRodXF4Q1AvMlpjT2xocWh2WGRsSExH?=
 =?utf-8?B?VVNDM0RCNXc1T0xPS1czbWcyUmN4ZVFTRGJGaHFERFNhS2h0TXFoMWJadHMv?=
 =?utf-8?B?RGlBY05ueXhTVjRyeFBUWFVrMjdMbjRUa2kzS1JlSjNISFNuY2xJNlZ5ek1l?=
 =?utf-8?Q?NSB3JIWHJL3PDLgo=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b50c497-78a8-4aed-55f3-08deb20c0572
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 22:56:23.3697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i5HVWjiR15+0ye0ir6juHKRgxkCA7AfjyC0sqHwX6Ha7V0+WsudM7m89mNITqO9i3G3ZPskssEy+ZSB7dx53ijc4UPI01nME+HrpMzPOfZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13445

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RA
a2VybmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogRG9ubmVyc3RhZywg
MTQuIE1haSAyMDI2IDA3OjA1DQo+IFRvOiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAu
cmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMTQvMTZdIEFTb0M6IHJzbmQ6
IHNyYzogQWRkIFNSQyByZXNldCBhbmQgY2xvY2sNCj4gc3VwcG9ydCBmb3IgUlovRzNFDQo+IA0K
PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHNhc2hpa28tYm90QGtlcm5lbC5vcmcu
IExlYXJuIHdoeSB0aGlzIGlzDQo+IGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFi
b3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRy
aWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMiBwb3RlbnRpYWwNCj4gaXNzdWUocykg
dG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gTWlzc2luZyBlcnJvciByb2xsYmFjayBpbiB0aGUg
cHJvYmUgbG9vcCBsZWF2ZXMgaGFyZHdhcmUNCj4gcGVybWFuZW50bHkgZGVhc3NlcnRlZC4NCj4g
LSBbTG93XSBSZWR1bmRhbnQgZGV2cmVzIGFsbG9jYXRpb25zIGZvciBhIHNoYXJlZCByZXNldCBj
b250cm9sIGluc2lkZSBhDQo+IGxvb3AuDQo+IC0tDQo+IA0KPiBjb21taXQgOTg3ZWNmMzU3NmYw
NjgxYWQwODA5YWVlZDIyNGYxNDI0MWE3NThjZQ0KPiBBdXRob3I6IEpvaG4gTWFkaWV1IDxqb2hu
Lm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IEFTb0M6IHJzbmQ6IHNyYzogQWRkIFNS
QyByZXNldCBhbmQgY2xvY2sgc3VwcG9ydCBmb3IgUlovRzNFDQo+IA0KPiBUaGlzIGNvbW1pdCBp
bnRyb2R1Y2VzIGV4cGxpY2l0IFNhbXBsaW5nIFJhdGUgQ29udmVydGVyIFVuaXQgKFNDVSkgcmVz
ZXQNCj4gYW5kIGNsb2NrIG1hbmFnZW1lbnQgZm9yIHRoZSBSWi9HM0UgU29DLiBJdCBhZGRzIHN1
cHBvcnQgZm9yIHRoZSBzaGFyZWQNCj4gU0NVIHJlc2V0IGNvbnRyb2xsZXIgdXNlZCBieSBhbGwg
U1JDIG1vZHVsZXMgYW5kIG1hbmFnZXMgdGhlIFNDVSBzdXBwbHkNCj4gY2xvY2sgd2l0aCB0aGUg
c2FtZSBsaWZldGltZSBhcyB0aGUgb3RoZXIgU0NVIGNsb2Nrcy4NCj4gDQo+ID4gZGlmZiAtLWdp
dCBhL3NvdW5kL3NvYy9yZW5lc2FzL3JjYXIvc3JjLmMNCj4gPiBiL3NvdW5kL3NvYy9yZW5lc2Fz
L3JjYXIvc3JjLmMNCj4gPiAtLS0gYS9zb3VuZC9zb2MvcmVuZXNhcy9yY2FyL3NyYy5jDQo+ID4g
KysrIGIvc291bmQvc29jL3JlbmVzYXMvcmNhci9zcmMuYw0KPiANCj4gWyAuLi4gXQ0KPiANCj4g
PiBAQCAtNzU0LDYgKzc5MiwxNiBAQCBpbnQgcnNuZF9zcmNfcHJvYmUoc3RydWN0IHJzbmRfcHJp
diAqcHJpdikNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgZ290byByc25kX3NyY19wcm9iZV9k
b25lOw0KPiA+ICAgICAgICAgICAgICAgfQ0KPiA+DQo+ID4gKyAgICAgICAgICAgICAvKg0KPiA+
ICsgICAgICAgICAgICAgICogUlovRzNFIHVzZXMgYSBzaGFyZWQgU0NVIHJlc2V0IGNvbnRyb2xs
ZXIgZm9yIGFsbCBTUkMNCj4gbW9kdWxlcy4NCj4gPiArICAgICAgICAgICAgICAqIFItQ2FyIHBs
YXRmb3JtcyB0eXBpY2FsbHkgZG9uJ3QgaGF2ZSBTUkMgcmVzZXQNCj4gY29udHJvbHMuDQo+ID4g
KyAgICAgICAgICAgICAgKi8NCj4gPiArICAgICAgICAgICAgIHJzdGMgPSBkZXZtX3Jlc2V0X2Nv
bnRyb2xfZ2V0X29wdGlvbmFsX3NoYXJlZChkZXYsDQo+ID4gKyAic2N1Iik7DQo+IA0KPiBJcyBp
dCBpbnRlbmRlZCB0byBmZXRjaCB0aGUgc2hhcmVkIHJlc2V0IGNvbnRyb2wgaW5zaWRlIHRoZSBs
b29wPw0KDQpObywgd2lsbCBhY3F1aXJlIG9uY2UgYmVmb3JlIHRoZSBsb29wIGFuZCBwYXNzIHRo
ZSBzYW1lIHJzdGMgdG8NCmV2ZXJ5IHJzbmRfbW9kX2luaXQoKSBjYWxsLiBUaGUgc2hhcmVkLXJl
c2V0IGZyYW1ld29yayBjb3JyZWN0bHkNCmhhbmRsZXMgTiBkZWFzc2VydHMgb24gYSBzaW5nbGUg
aGFuZGxlLCBzbyBoYXJkd2FyZSBiZWhhdmlvdXIgaXMNCnVuY2hhbmdlZC4NCg0KUmVnYXJkcywN
CkpvaG4NCg==
