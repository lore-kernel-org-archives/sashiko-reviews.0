Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB3A135A53
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 22:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778798868; cv=fail; b=eJ3+E9hGnYJB8JTGu9tbr80xZ4fORZcSeuytYzf/1dMtiepTkDRDOPxURqcluyEZYvU8tEvUl3zj1OEVTxeggviz30OILlK9XxbLLqeqgt4efpw46MiZxH5w2ow5ys2w0n7t6TdZTnSgriwX2IQjbET7B7O3SprwO+aNkpj5yC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778798868; c=relaxed/simple;
	bh=h9pqBE74cTBvpSk+zT+3NT41mBL9hEX0x2rfas9IZIw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mhQs0FenVsFikgXyITcef4PZ47c7inu7Lp5zZBwjVstbfTVgliTTsvLiRVejHUMoTnBGbpS1PIJQvFzXmBqeYqWJ6GuMM8wkldfQfso8Spq5YTxKOzW5KV3e6fPsObTSZhyvmZp39WO2xLEt0xGi0Xnt1faoX/ePdXB6FJ8+MwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EfvFFPYW; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EfvFFPYW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tn6yi8YBuuBoNC7hSk8tuO/mza88ocaagrm43tF92B1BoCSs57QNjujnXTib1g65OWKlOCKF2ZiT/WCnLmoSqq6ewPX+Len2xMkwto/la4Lpwymk9ui1gPzcMae4hpGc/nZ9+qSunFj5pz60W652p7IGUxfcwivogiTGbPcWyj+lryfrOCjdQar3Osso6XNElPdKV34uW3U6JUAdgRIfhC+3YKnin/zhEbCl3FZUVlASu8YdPypT6V8gmwMWWz5cxd3Y8IruijRtdmiS8G+2l3LhysHAh0bcGVoUaplsdOngQcEVWRBZrjkdKCXmOGi9ynmlP20oirsXl150GRb48w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9pqBE74cTBvpSk+zT+3NT41mBL9hEX0x2rfas9IZIw=;
 b=F+93YR3xIK5P36uMEDmiGjmACJ5YVclDfjxeIavNqHmyc6lcvWKgRzahnA0cQdVdCaqST5ELB0TpnMyNH7lqXf4PWvivITmYT5ZHGhJSZ1LfFFgVRVkG7KZsqqCW3GrgUkpPC3Uu1hl3a87lwe1mAKBLSBCGvsk3GQvhNdIuDlgb8omKjZGxmkLqmrop+hcjHxRGIOtL2SPmwIk1BrjthL+vLCWBCUlHZuuCx4NcldNFIhuglFAArdpY/6mtIZAdkXPSldA/JhLF8tqhm0rHe+DoFC3S0rG8qhI/5YKD7fLJ8vHd1kGB3Cqli7eA+Vh8IQkqKxWf/R+DMyNz07RkOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9pqBE74cTBvpSk+zT+3NT41mBL9hEX0x2rfas9IZIw=;
 b=EfvFFPYW1UOb/2rPkwTwEGtLo2qG+Q7M8moHGrE6YVX7rEhzmjSFnzp0+Wn9QB8VRDojx/7S9S2yCfychPA6XSlyNe3psf11tKYAQzwmGy2otDLPFvnEoqG0MiHGckJDDXqW7PWK10RY3QoLlVZxZDEbpIX3Dcl1WCaRJz9CDUA=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS9PR01MB17968.jpnprd01.prod.outlook.com (2603:1096:604:473::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 22:47:44 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9913.012; Thu, 14 May 2026
 22:47:44 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: RE: [PATCH v6 10/16] ASoC: rsnd: Add SSI reset support for RZ/G3E
 platform
Thread-Topic: [PATCH v6 10/16] ASoC: rsnd: Add SSI reset support for RZ/G3E
 platform
Thread-Index: AQHc4j0sQDE4yrEFOUiH7V9peSmX27YM3T0AgAFFHsA=
Date: Thu, 14 May 2026 22:47:44 +0000
Message-ID:
 <TY6PR01MB17377A03F90D80895F2B6B6E9FF072@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-11-john.madieu.xa@bp.renesas.com>
 <20260514032215.5A3ACC19425@smtp.kernel.org>
In-Reply-To: <20260514032215.5A3ACC19425@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS9PR01MB17968:EE_
x-ms-office365-filtering-correlation-id: 42146906-0953-4faa-dd31-08deb20ad014
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|11063799003|56012099003|38070700021|4143699003;
x-microsoft-antispam-message-info:
 elazJCj+CJBSP3aL8hpXSBTueHq/TzSzmbcOWI3I9V+gv/DabordVLsY1JiP2zVbjmqiMyQmaNwcoTRe5X08vbDbojWhq+s1rsH2kKIqEkSIV0IVEgNloTScrIZeTogmoQ7AxfVzotwGe11OJW99jLaBNZiJV3W3mrcbwiI3xUx4M18IXZZp+h0VJ2E40jZOnC3nTR2Z5eXNoEV+NXzvcKKW/IP1uKxhtYby2Mld6WaNbGWHtt87/oNwf1j0iZFARvr26Wi1lMf9RCnLkGoMKT+4rWEAtELpf0vgAKA9Kk8fImS2o+N4oZru7vf8pBOSiB2wf/8CItKbVH2DnzXeZUc5EVei0UY52I9wIsIuzuEC2iZXp5QbE2bL7cjmcoJWD1FuY63B5FBwX8HnLxQzHr4hVxAod/8QnWtF/WUB2PcJfv1EShEQUe09YZFWcorWp25ophhAyoy89I3KmYAzRYeJkOiU0PDHUzHu1Lnqws1IgW/UMUqdnF97QC4aaqSs9O8mYls50KgTUNUkOsrvQVC7LJb4SEaO6/RcANrp+3KuEo6+OdkdLOHeNFADBqvtLSMvEdEsZFEdckxKLil0Dh0P/bogWwLmBJg+y/Q5nEYKmDM4mW3KUnHnVLgK1G/tKqXefhakUad9duDj0A5L22irYLawZ3grT0g6BhMyuEi2lVJ2U6PfNpyRitdCrCirF4+uPTCbuuEWxLtjcUa93G+z+SdUMRnYiyBBKp+/pX0KDQdYlVoNniJstSHanruy
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(11063799003)(56012099003)(38070700021)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFZzeVB3RmQwVlgyaVBPekpaNFZkWUxTZWxENVFXU2JlYVdaeStPWnVJRjVz?=
 =?utf-8?B?K3JDOUhYQ2hIVWlrMnFiM0FneHJSL0UzVmppTzJaZDVpWVViZU9HSEgwcGZ4?=
 =?utf-8?B?aGo4b0c2K2NVUTVIZHdqYzdNdkxTSTZYdDFDR3ZUcDJWQ280ZzVvOTVLVklV?=
 =?utf-8?B?QUtvWFdFOU9sSExGQUlISDVodG9RL0VXRkRZeDd1WnkyS3NQZzR0K3N2cG8v?=
 =?utf-8?B?cVFxQVNGMlI2RDlQRjVGc2NLM3NHOVoxblE3ZUdtY2wzYXZXUGo3SHNKS3Vq?=
 =?utf-8?B?Q2xIVnJQNzV1MFpKU3RLU0EvdjhsTHluMy96NThDQkp3cC9HaS83Q2xFZUlt?=
 =?utf-8?B?VmVET214THYyME1RUDhmcTY0MlF1eitsc2RZRSswYXJmVmRSUUNHZWphRTRl?=
 =?utf-8?B?ZkduZXdaYmlUM3ZQdXZOOUVZcmVuY3hsbitncmJtWEJQQU5ld0lPQ1hYTXRK?=
 =?utf-8?B?WG1IVXN0MWpWWTlRMXllNXJzQVVleGprcENpUWRBb2lFeEM2bzQxSW1oZWRs?=
 =?utf-8?B?YnBKTER2SVRoZTRncGtXdllCWnkyOFRDWm9HMGNkZUdRZVZGL015dmtrL21a?=
 =?utf-8?B?UzdiSkV1ZU44QWpQcXVPcnAxRTFURXJSa3lCNy9heDROd256TlZnL0dOc3pP?=
 =?utf-8?B?VExVU1V2K2lPd3J0VzAyaGZJZE9WYngwLy9oUGVBWlhRRjU2dlJLMVFZR0ZT?=
 =?utf-8?B?QjA1QlJuUVFPSGx0dlFHT3EySW85TUlBVXJwelFiOUVFN2lzMVF6UDlPaXZO?=
 =?utf-8?B?d1dxMDJlZG5sYWZzS3I3TlFmQUZyMUtNbmlvU2tYYXdaU0xHV0FLZnJTWnEv?=
 =?utf-8?B?ZGQ4Zjl1dUdQc0JZTjdHVjkvWmp5dlV6bHpaOERkR1U4bEJvSGZ6UVRGNHdZ?=
 =?utf-8?B?dzRCQ05EaTE4NHQrbUVYdUxaRElLa0NLVmgybGJ4WHVGbDdEUzFHck9SUlBH?=
 =?utf-8?B?c0xsRkFVdER3K092R1hZSjkvYTh1ZjJpT25mNUYwdWFJS1ZLZmc1bTgyYkpl?=
 =?utf-8?B?SEVhajg1eEQ4aGVDNjV1MC9mVjgrRmlPeFJuMk1meklEeWpxeDhHdXZ1Y2g2?=
 =?utf-8?B?RUNwNXJoZlRqL0xwMXdIUFN6ZjN5N3VwUzBLYWxIQkpIK3JidG02TDRSRUtB?=
 =?utf-8?B?NzRPZEZOejY3cG5PTWZacGJrQ3VTOGxvc3N3RjZ6eFdNR01CWWNJRUYzTm5X?=
 =?utf-8?B?aHFkWk5jVnFrZnRUcjc4Q3ExTGRvSzduR0J3cHJ6MnpDYzR5emFCNmxzVnpW?=
 =?utf-8?B?dUhwM1QzNG82SEJzK0RBUmN3TDJJMjRtNGlSVWo2YVl1cDZ2c2lzWVNvMFVK?=
 =?utf-8?B?NFl4WktUZHNzVlNNUzl1dnNlMy9aR1hLaVR0VDF6eU96TXpLTGV5dW41SDlm?=
 =?utf-8?B?ZFQyeXlzODhBUHpDaFh2a1AwTGVvbVZnd3FoWUg3aDRIVWE0Q1d5cFlYQ0dy?=
 =?utf-8?B?Z0NvaldIbFEyLzFDZ29Wblh1cGVoWlFrODFCbUt5Y1RtZUxpeURGdW5WS0NX?=
 =?utf-8?B?bmpjcWJmeVpCdk5jbnYwL0VSSVZKVjd2UkdYblBYZVhYaWlnQ0tIdDdPaXMw?=
 =?utf-8?B?TXdTRmhIU1p0cU5jTFR4SzYzeHlMWlAwZEVrT1dkOE0zZXp2ME9sRTAxdVN3?=
 =?utf-8?B?TG9jOVZ5RlFXSXhaUUlLdW9qV2lIWEJpVlpKSE9xWEFlMy85RnRQRjRTZ0ww?=
 =?utf-8?B?WnRuc0tVUDRaYzBsTDI3ZkpnamVlS00zT1AzeWozOUs2Uk8xRFBqejFuQ3hn?=
 =?utf-8?B?aGtXcWhWZVkxbkY5SU9WM0NFbmYvbUEyelNxUHVoUFM4RHdia2hhUGo0Z05C?=
 =?utf-8?B?V25pL0ErUDJURHhUM0Z0L1BJczRFS0lyeHRJalU5UWk0S1ZGdDFhWW1qcXZW?=
 =?utf-8?B?Y0hlbFlJRkNUbnNYTEhCZnBFOHRwWmxkMTBrWHhWRGFjTnBmb2NJcXZIM0ww?=
 =?utf-8?B?WGMwSWZ1VTdkS0Y3Q25XblJpUHZkLzl2dTlhbURhK0IzZ081S1JtWkliUEJY?=
 =?utf-8?B?dzRnWlVXSFFqcDQ4aVhxNDllTmQ0VFdlNHB5dlVmWmFIV0QvM0IxdjloT3BU?=
 =?utf-8?B?VGNIRmNraHB6Ulk2WmxHblZia2NuejFkZHIwN04yV0Q4ZGtIQ0NmN3dLKzVx?=
 =?utf-8?B?dXh6cDJpdUhvd044alJET05sYS9DUnBLUDVHNWQvbUdyRTdsQndxbVhFdXVO?=
 =?utf-8?B?WjZ4czlYRU1xNmtFY0t1SHJ3cjQ3YWFCK3hpZVNTaDFONTJlSlJWdVNJMWU5?=
 =?utf-8?B?MnF1THgvWUNObEZHeHJ3K0ZzZ0FEcWovaWZTbG5mSmJML01HV0pWTjBudU9m?=
 =?utf-8?B?ejBkcUhuVUllWmRhSy8wenEyN3A4d2tNblV2RFRXVnNKZHJRekVtY25ueDhW?=
 =?utf-8?Q?2UjqlUyE2pp3z6Co=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 42146906-0953-4faa-dd31-08deb20ad014
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 22:47:44.3571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UGL8zaKoJ04gE5/LQrUrwQoHln9b0r6zoSxrVUEAXzqVWtmnpM8kzGNX4d5ecMuIBaffD8GaSKQDTGV89wsiw7Zqerg7nFKkhwBXCr/BCwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17968

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RA
a2VybmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogRG9ubmVyc3RhZywg
MTQuIE1haSAyMDI2IDA1OjIyDQo+IFRvOiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAu
cmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMTAvMTZdIEFTb0M6IHJzbmQ6
IEFkZCBTU0kgcmVzZXQgc3VwcG9ydCBmb3IgUlovRzNFDQo+IHBsYXRmb3JtDQo+IA0KPiBbWW91
IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHNhc2hpa28tYm90QGtlcm5lbC5vcmcuIExlYXJu
IHdoeSB0aGlzIGlzDQo+IGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2Vu
ZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlv
biEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwNCj4gaXNzdWUocykgdG8gY29u
c2lkZXI6DQo+IC0gW0hpZ2hdIFRoZSBjb21taXQgbWVzc2FnZSBjbGFpbXMgdGhhdCBgcnNuZF9z
c2lfdXNlX2J1c2lmKClgIGlzIG1vZGlmaWVkDQo+IHRvIGFsd2F5cyByZXR1cm4gMSBmb3IgdGhl
IFJaL0czRSBwbGF0Zm9ybSB0byBwcmV2ZW50IFBJTyBtb2RlLCBidXQgdGhpcw0KPiBpbXBsZW1l
bnRhdGlvbiBpcyBlbnRpcmVseSBtaXNzaW5nIGZyb20gdGhlIHBhdGNoLg0KPiAtLQ0KPiANCj4g
Y29tbWl0IDlmYjQwYTExNThkZDMzMTFlZjM0YmYyYTAyOTRiYTI0YzhhMDdlZDYNCj4gQXV0aG9y
OiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBBU29D
OiByc25kOiBBZGQgU1NJIHJlc2V0IHN1cHBvcnQgZm9yIFJaL0czRSBwbGF0Zm9ybQ0KPiANCj4g
VGhpcyBjb21taXQgYWRkcyBTU0kgcmVzZXQgc3VwcG9ydCBmb3IgdGhlIFJlbmVzYXMgUlovRzNF
IFNvQywgdXNpbmcgcGVyLQ0KPiBTU0kgcmVzZXQgbGluZXMuIEl0IGFsc28gbWVudGlvbnMgdXBk
YXRpbmcgdGhlIGRyaXZlciB0byBjb25zaXN0ZW50bHkNCj4gc2VsZWN0IHRoZSBCVVNJRiBETUEg
cGF0aC4NCj4gDQo+ID4gVG8gc3VwcG9ydCB0aGVzZSBkaWZmZXJlbmNlcywgcnNuZF9zc2lfdXNl
X2J1c2lmKCkgYWx3YXlzIHJldHVybnMgMSBvbg0KPiA+IFJaL0czRSwgZW5zdXJpbmcgdGhhdCB0
aGUgZHJpdmVyIGNvbnNpc3RlbnRseSBzZWxlY3RzIHRoZSBCVVNJRiBETUENCj4gPiBwYXRoLg0K
PiANCj4gSXMgdGhlIG1vZGlmaWNhdGlvbiB0byByc25kX3NzaV91c2VfYnVzaWYoKSBtaXNzaW5n
IGZyb20gdGhpcyBwYXRjaD8NCj4gDQo+IFRoZSBjb21taXQgbWVzc2FnZSBzdGF0ZXMgdGhhdCB0
aGUgZnVuY3Rpb24gaXMgdXBkYXRlZCB0byBhbHdheXMgcmV0dXJuIDENCj4gZm9yIHRoZSBSWi9H
M0UgcGxhdGZvcm0sIGJ1dCB0aGUgZGlmZiBkb2VzIG5vdCBjb250YWluIGFueSBjaGFuZ2VzIHRv
DQo+IHJzbmRfc3NpX3VzZV9idXNpZigpLg0KDQpDb3JyZWN0LiBObyBzdWNoIGNoYW5nZSBleGlz
dHMgaW4gdjYuIFdpbGwgcmV3cml0ZSB0aGUNCmNvbW1pdCBtZXNzYWdlIHRvIGRlc2NyaWJlIG9u
bHkgd2hhdCB0aGUgcGF0Y2ggYWN0dWFsbHkgZG9lcw0KKGFjcXVpcmUgdGhlIHBlci1TU0kgcmVz
ZXQgYW5kIHBhc3MgaXQgdGhyb3VnaCByc25kX21vZF9pbml0KCkpIGFuZA0KZHJvcCB0aGUgdW5y
ZWxhdGVkIEJVU0lGL3VzZV9idXNpZiBwcm9zZS4NCg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvc291
bmQvc29jL3JlbmVzYXMvcmNhci9zc2kuYw0KPiA+IGIvc291bmQvc29jL3JlbmVzYXMvcmNhci9z
c2kuYyBpbmRleCBjZjk4Y2M5ZWU0NGMzLi5lNjczNDY3MTMyOGM4DQo+ID4gMTAwNjQ0DQo+ID4g
LS0tIGEvc291bmQvc29jL3JlbmVzYXMvcmNhci9zc2kuYw0KPiA+ICsrKyBiL3NvdW5kL3NvYy9y
ZW5lc2FzL3JjYXIvc3NpLmMNCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gQEAgLTEyMjAsNyArMTIz
Miw3IEBAIGludCByc25kX3NzaV9wcm9iZShzdHJ1Y3QgcnNuZF9wcml2ICpwcml2KQ0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICBvcHMgPSAmcnNuZF9zc2lfZG1hX29wczsNCj4gPg0KPiA+ICAg
ICAgICAgICAgICAgcmV0ID0gcnNuZF9tb2RfaW5pdChwcml2LCByc25kX21vZF9nZXQoc3NpKSwg
b3BzLCBjbGssDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIFJT
TkRfTU9EX1NTSSwgaSk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJz
dGMsIFJTTkRfTU9EX1NTSSwgaSk7DQo+IA0KPiBXaXRob3V0IHRoZSByc25kX3NzaV91c2VfYnVz
aWYoKSBlbmZvcmNlbWVudCwgdGhlIGRyaXZlciBjb3VsZCBzdGlsbA0KPiBzZWxlY3QgUElPIG1v
ZGUgaWYgdGhlIHBpby10cmFuc2ZlciBwcm9wZXJ0eSBpcyBzZXQgaW4gdGhlIERldmljZSBUcmVl
LCBvcg0KPiBpZiBETUEgYWxsb2NhdGlvbiBmYWlscyBhbmQgdHJpZ2dlcnMgcnNuZF9zc2lfZmFs
bGJhY2soKS4NCg0KDQpTYW1lIGFuc3dlciBhcyBvbiAwNS8xNiBhbmQgMDkvMTYuIE5vIFBJTyBh
cyBwZXIgYmluZGluZ3MuDQoNClJlZ2FyZHMsDQpKb2huDQoNCg==
