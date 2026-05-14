Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6123A75A7
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 22:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778799236; cv=fail; b=issMZNvv4bRVPxFzpFeLx91m5XzfQSkmiNLDoYQwfv+jRMbVJcc0Ol/qmzH/VMpYPKXDGUuYnlbyXSvtJdljBAbVoNNDSsza0/FORSqZPYcLrd91qyU0/1JjT7tw+U1ijGU8kBpGEZ+Zjk8rF7L94yh1JDZN2JsX7qszobGLYN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778799236; c=relaxed/simple;
	bh=K6Exz6SRaa4TKac/Kv/y9Q496jf7RoDdErGrNxaknIQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rGEun2NvlGbB+GsRMXKGvS8Ufriv0yIYBCUWg6hojEiERqEAS7GaTccRjhfqMazJ8b3G3YJSBty9sw36XrU9UO+FIjT1h9Ij8OoeV5ylcJ6lXMpk1X2KOkqi8myW7IjI0QZ6+a9WHb1X3crsVuCjhEeuxjJ0/7KToqm1EKBJso4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RjCtFWBK; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RjCtFWBK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tI6DlgJcjxxnNBGInQE0qqaxF0r05FzgR8z1sCaHySKaTAbEDJuLtjDpbu+c1vSFbR5brJxBoPb9rbVSSZM2BAYxSkoThCtURfadvWovWtEJ3/Z+AZEb40X6vFxzvhf3p5DuAxBR/Z9HewTOzT5vzB+QxhEe5glE7hnQTUjzEAKqDXhs7N4xAQxJQG3WBml7dnlWASX6e+VcjFMtVuIVd5jbth83RzurAWAK9/haahGCYRN0kRE7Sg0VECis+VMt0hp8XJjwbKiJI+lgBF8eFRYzqHjm70xQFU4jKovh8+eszchRmodgnlWn2vzbZ4nWyWUzXaxeXuutYLSGs8wutA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6Exz6SRaa4TKac/Kv/y9Q496jf7RoDdErGrNxaknIQ=;
 b=IP5w3JswBtuHp0I9u+KyWwW84GXgYrOhVEZGMN+ao0mCjDkquEIL6f9XRhwWd9p+AYhhJt/dLLUitMou4EBp7cKo2iPbsSHZJRo0yrBdGvDfA8Ncn3I235HRGAkzRRBGQzEqq3oJtYhwP6zslxmxu9VaVkHSDGlXxlNnkVo1FrYHbboojP7etV/QvDQgTp6YRAUjIs7XorHVqfpGMowNShN6cfDYoLcDBlfOOHKUUkTvS5ljQVMDZnSdNYNqbp6SmjtVTfWND7YCW6chg7vZzvnGVduBacYdGa6g6wx6WLRx9vylFd6x29BPQPvJRMV+L42zlXN8l9ithoIG+m29xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6Exz6SRaa4TKac/Kv/y9Q496jf7RoDdErGrNxaknIQ=;
 b=RjCtFWBKercRbgJHnCiLHD4cxwjNIUGBKrJOGw6xm93uYOvfMUspkLn+tD0rKjKlm54UTUmNqAL3aUswHvWrDLYcnE1gFsjwRzIilyK3JJzo7wDURedIbaM5vEti6dtUmDzcWYghIiXdNziONbha+SQ3c23tAGPF16YMPQCqbog=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB13445.jpnprd01.prod.outlook.com (2603:1096:405:1e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 22:53:50 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9913.012; Thu, 14 May 2026
 22:53:50 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: RE: [PATCH v6 12/16] ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply
 clock management
Thread-Topic: [PATCH v6 12/16] ASoC: rsnd: adg: Add per-SSI ADG and SSIF
 supply clock management
Thread-Index: AQHc4j00EtrfN3pWykil/4S6Sy4GTLYM6lwAgAE5UBA=
Date: Thu, 14 May 2026 22:53:50 +0000
Message-ID:
 <TY6PR01MB17377EC6C3021F3D4F676BA31FF072@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-13-john.madieu.xa@bp.renesas.com>
 <20260514040912.DD2C8C2BCB7@smtp.kernel.org>
In-Reply-To: <20260514040912.DD2C8C2BCB7@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY4PR01MB13445:EE_
x-ms-office365-filtering-correlation-id: 0ff04743-9020-4d7f-e5ff-08deb20baa5c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|11063799003|56012099003|22082099003|18002099003|4143699003;
x-microsoft-antispam-message-info:
 ruz/vEi340NXzByyNAwNP5evS1f/nlxk+hNHISlCWZYyh/GhRsqvCDUEMDpxdoszcREl5bWCf0acRP/XBquswhbrkC5cLu2VLuxiG5ZhoCzbt2D7ie9voMtvAzwZrJkMzp3Ix4tSY3Ki33tfi9t1hOkOVVbkum22PRFFZzHK+NAp0/P7Il8Zc6iONdIfeioafd/ljRUslUnjq8AJsGBvANLsYilpTqEcyPCjWHoBmNiRmfOTodsjpLaqyFxPsuIzqEQhSxscw+9Rg3Ae8Tx+/qaUnRIS9A2/8mOhowjacWSPyNYDW9TdaymGFIXDW1nh90Jf3DmWWfZPkovEafVyMqHoeTqRqo7wpI9VLEsd4bbYvKezCm2qy053FqI3ALI/vd9sqQqpJUK8o9qBC9Vw4543ZrVZXH6GD0NoJN6OcdGSDl3GeK/dtekeahG8MAv2gqZnZ8a56QkMs8so5UlwCHYcOZ+09gQWFOYAKGFVKNXvcUwST1rOMVVbJ4A2XP7OaSjQN7ozEPWmYhjvZElBz7AkRnTYpEsTHaM6AaBzrktvRlfdl/L+bG7px9cqoBZN9UdbXqhY7ebO4gREByyGoZBQkhwTuxOHuQUqXgtBTfCMrSyIFkPedtiG39GcogVqj9CtAsmLXs1/pXez4BesPtzxj7pg1hIunu8E9/j/Qqon2E9NCbNkFJRzFkRXsfMSAcXd3xfNvnh+DLKXVVk0s8RxgVE5zrQ7hXAf8r3Q1I7gv5Uj8q6JbZOITVZofXM1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(11063799003)(56012099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VjdhejBoUlhFQ0ptNk1HR3VLUVc2TWtlOGlnNEZuSnFyTWRQbEY4TlRzQzZM?=
 =?utf-8?B?dVhRWXNieTBhRUxlVXNrMGc1MkhhcmlscEVQUXBna3E2azBDQWxrcDJORi9a?=
 =?utf-8?B?MzV6aXM2YUM0d0hjV3dBcy9acXBkK05IVVB0Ni9ZN3ZDa09hVWlaa1M0emg1?=
 =?utf-8?B?Z3dXMzJ3NW9UeFVsZlVGRC9qdFRBbEt1NjhPa1RPb2hHQ2FtcEk2NWVITlc0?=
 =?utf-8?B?bHFFVWlPWS9NaDBCSkFwWTVySE16aGUxSmdaN3RkYUQzZzVMdHlrNk9jbnQx?=
 =?utf-8?B?L0hMaTlaSDZKUm5udWdTTUhLM212U3JOTzNWRUY5VzVoVmVXTHkvbVcvQTRq?=
 =?utf-8?B?ZDdFWllZMlZuL1VzY25ueGNZcEZyc3BKanBrTWJVeE5QVTRHeDdiZlJWRlFW?=
 =?utf-8?B?RHFYV2EwQkRuL2FLM3QvZHlGbE9iN2tMamdmUDhQck9Fa3VSUmJOUXhiWm5r?=
 =?utf-8?B?VUw5M2VGTUMrYWNyeC9xc0JGL21lenpLSG81YW93M2sxQkJtSjhJbjNvUW1Y?=
 =?utf-8?B?c3NsZkF3Mk1Ed1gvVmc4NGlURk51Q3NRY3luSDF6ZkwrVUp6dHNiODBISUdE?=
 =?utf-8?B?ODFINTUzZENWSGpCN2F6dFVZK2hUejY1Y2QveTlZMm5ubjNyMUMwaEJ0Zkli?=
 =?utf-8?B?TldNNjVwb2g0cDFHWlIxclBRMGRFWm1kaXFRQWRLc2JhR3FSdHc0VEtHSGlz?=
 =?utf-8?B?UUJjYVBiOGVkMWYrSDk0OVo3V21NTFlmYStsSTgvMHpvUEJ0YXg4OXFxSHhK?=
 =?utf-8?B?SjIxeGgvcm1XdHFCOVgzUTlHK211REFkNnArYk0xZ2xsYTh5YzUyaC81dDJr?=
 =?utf-8?B?ZTY4QzI5T1VaVXdUeS9ubFQrOXdwZ0txSkp1b0RsN0ljaC9YMHdXWUNQWW5M?=
 =?utf-8?B?aGl6cWo5UG04ZEV1bzF3eGtQT3VDNkxURHYrZFVVckpTWDlGYXZNM2p5cXFk?=
 =?utf-8?B?WFF5V0dGNWgwZ0tLbG5keE4vZGJiZkFYVDBva0VlTU5OMUJ0TnIvNUc2WVNI?=
 =?utf-8?B?MXZtRTdKSlJZZzZDNnhEbGp5M3FYaFduS2NtOENSakhDR3BubEM5VHB1ZHZr?=
 =?utf-8?B?SEs2cWJ6K05vd0FpcjdvY2l3dktORHlEdldXcU5DZFpIU1BiNVczdWprMENI?=
 =?utf-8?B?T3FoclpDYzMyZkJMT0dnaHBNREFvRWdjMmpIcTJIUjBMMld5KzYzVkc3K3Bs?=
 =?utf-8?B?MUlCZ3ZqZE51VzZUcGYzU2FMVkNyYUZCcUhtNjNZdXlsckwxcUllU1gxdGtH?=
 =?utf-8?B?RTB2S2h6M3J4eHBNT3M2QmlKaXloem92T25FRFJqN280RVVFNVZER2VidjZH?=
 =?utf-8?B?M2V4NDlwSFNuYUZIZUdKUGQ4VklNYVdQbXJpT1hvdjcwNmJtWDRRWWJ3bXY0?=
 =?utf-8?B?Z1I5TXFjcjVibGRuSjNYZWFZN1RURXBER3NaOHgwVmtKakRpTXJqSEF6S1Zr?=
 =?utf-8?B?TWw1Sk9MdTdTeXpqY2xhOENXVmp3bE81ckZGRjk0MUhuRitYQzNGaSt3ZitI?=
 =?utf-8?B?aHpqZVlZTm9jeHoxeWlOenl3YjlSNythVkxiNnd1c01ETUV1cnE0OEdzY0gx?=
 =?utf-8?B?S09vaThEaU9lNHBXR2ZpaXRpeDBvcXovSFNSWG85VFN0aHplTldHTm9sTGlr?=
 =?utf-8?B?NTdtL3dJM2VkbnVzcEZ1Y1k3MWg3TDJudThWOC9SanhOUEc5U3BkQzFFK2do?=
 =?utf-8?B?cE1oc3NnWUk2ak5KK0FST1BoY2EzckhaalozQzJvSjRwMXFnSmdYQVhjeUFy?=
 =?utf-8?B?bDBOdiszcWI1aEFEdXA1OWN1ay95SUxVZkd1UTZ4VXYweWpvcW5FWjR5VXRR?=
 =?utf-8?B?eHRjT0FIVmxNSnpwcVM4TTgwSUg5aU1UU21xWVhaVHpHZFFWanNua3czVGMw?=
 =?utf-8?B?RW5sSUp4L0pVMTV2eEF5M2VSRDhtaU91UnBMMnFiOFlldnJSRGFHaU04YVVw?=
 =?utf-8?B?WVYxWk9XNC9SQWxDWTlDbGxqT1VDR0ZweitDRnl0Ky96ODNJbEdtakwycFNM?=
 =?utf-8?B?cU11RGtvb3QrL3A2NEtXSmxuYzlPdHhIeFdyU3N0OUZhM1RITkgvc2FLais2?=
 =?utf-8?B?ZGd2cmdLS3V2UzNrdUQwYWhsRC9yRGdKWXZBOThwL3prTUlJdjhrTy9pTHdC?=
 =?utf-8?B?WStzNnpGVU1Da0doUVBYL2RpeDNuT0lWQ3JENXFOaDJadzZVQnljemhadkw3?=
 =?utf-8?B?SzNTczFhYXFENzgzdFZKM2ZNSlBvaDVBaVFwZUFWSXE3VkFvQk0xY3lGT1p5?=
 =?utf-8?B?VUl4Yjgrb3VSK0hWRDRpdTk1WklzR0xybWorTGpKQlBldTlzeVQxMGdEQ1ZX?=
 =?utf-8?B?elVtSWkydjRlSWhUUHNoY0lJVGU1K2ZoUVZMbFVlWnFMam1GOEJtQzBjUGps?=
 =?utf-8?Q?T7IhoxPYhA5dVMBM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff04743-9020-4d7f-e5ff-08deb20baa5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 22:53:50.5334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5yjKPvwEirda33psrw3rbQYiwcWhFqOvWITWcQLLNpsb0WbE+tWSWzuxXMlp5e9+Uusl+c4r3l9Kr3+j8pLf8O9bHi5Wx8WtYbzNP29KTHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13445

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RA
a2VybmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogRG9ubmVyc3RhZywg
MTQuIE1haSAyMDI2IDA2OjA5DQo+IFRvOiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAu
cmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMTIvMTZdIEFTb0M6IHJzbmQ6
IGFkZzogQWRkIHBlci1TU0kgQURHIGFuZCBTU0lGDQo+IHN1cHBseSBjbG9jayBtYW5hZ2VtZW50
DQo+IA0KPiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHNhc2hpa28tYm90QGtlcm5l
bC5vcmcuIExlYXJuIHdoeSB0aGlzIGlzDQo+IGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9M
ZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gVGhhbmsgeW91IGZvciB5b3Vy
IGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMiBwb3RlbnRpYWwNCj4gaXNz
dWUocykgdG8gY29uc2lkZXI6DQo+IC0gW0hpZ2hdIEJpdHdpc2UgT1IgZXJyb3IgY29kZSBjb3Jy
dXB0aW9uIGFuZCB1bmJhbGFuY2VkIGNsb2NrIHVucHJlcGFyZQ0KPiBpbiByc25kX2FkZ19jbGtf
Y29udHJvbCgpDQo+IC0gW0hpZ2hdIE1pc3NpbmcgZXJyb3IgaGFuZGxpbmcgY2xlYW51cCBpbiBy
c25kX2FkZ19wcm9iZSgpIGxlYWRzIHRvIFVzZS0NCj4gQWZ0ZXItRnJlZQ0KPiAtLQ0KPiANCj4g
Y29tbWl0IDk2MjQxZjlkYWRiNjc2YTVlOGE0NDg5NjQ0ODc0YjI1YTg1YmIwOTcNCj4gQXV0aG9y
OiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IEFTb0M6IHJz
bmQ6IGFkZzogQWRkIHBlci1TU0kgQURHIGFuZCBTU0lGIHN1cHBseSBjbG9jayBtYW5hZ2VtZW50
DQo+IA0KPiBUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGV4cGxpY2l0IGNsb2NrIG1hbmFnZW1lbnQg
Zm9yIFNTSSBhdWRpbyBpbnRlcmZhY2VzDQo+IG9uIHRoZSBSWi9HM0UsIHdoaWNoIGRpZmZlcnMg
ZnJvbSBwcmV2aW91cyBSLUNhciBnZW5lcmF0aW9ucy4gSXQgYWRkcyBwZXItDQo+IFNTSSBBREcg
Y2xvY2tzIGFuZCBhIHNoYXJlZCBTU0lGIHN1cHBseSBjbG9jaywgYWNxdWlyaW5nIHRoZW0gdmlh
IG9wdGlvbmFsDQo+IEFQSXMgdG8gcmVtYWluIHRyYW5zcGFyZW50IHRvIG90aGVyIHBsYXRmb3Jt
cy4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9yZW5lc2FzL3JjYXIvYWRnLmMNCj4g
PiBiL3NvdW5kL3NvYy9yZW5lc2FzL3JjYXIvYWRnLmMNCj4gPiAtLS0gYS9zb3VuZC9zb2MvcmVu
ZXNhcy9yY2FyL2FkZy5jDQo+ID4gKysrIGIvc291bmQvc29jL3JlbmVzYXMvcmNhci9hZGcuYw0K
PiBbIC4uLiBdDQo+ID4gQEAgLTQxNyw2ICs0NDgsMjkgQEAgaW50IHJzbmRfYWRnX2Nsa19jb250
cm9sKHN0cnVjdCByc25kX3ByaXYgKnByaXYsDQo+IGludCBlbmFibGUpDQo+ID4gICAgICAgICAg
ICAgICB9DQo+ID4gICAgICAgfQ0KPiA+DQo+ID4gKyAgICAgLyoNCj4gPiArICAgICAgKiByc25k
X2FkZ19jbGtfZW5hYmxlKCkgbWlnaHQgcmV0dXJuIGVycm9yIChfZGlzYWJsZSgpIHdpbGwgbm90
KS4NCj4gPiArICAgICAgKiBXZSBuZWVkIHRvIHJvbGxiYWNrIGluIHN1Y2ggY2FzZQ0KPiA+ICsg
ICAgICAqLw0KPiA+ICsgICAgIC8qDQo+ID4gKyAgICAgICogUlovRzNFIHBlci1TU0kgQURHIGFu
ZCBTU0lGIHN1cHBseSBjbG9ja3MuDQo+ID4gKyAgICAgICoNCj4gPiArICAgICAgKiBGb2xsb3cg
dGhlIHNhbWUgc3R5bGUgYXMgZm9yX2VhY2hfcnNuZF9jbGtpbigpIGFib3ZlOiBvbg0KPiBlbmFi
bGUsDQo+ID4gKyAgICAgICogdHJ5IHRvIHByZXBhcmUgZXZlcnkgY2xvY2sgYW5kIGFjY3VtdWxh
dGUgdGhlIGVycm9yLiBPbiBkaXNhYmxlDQo+ID4gKyAgICAgICogKHdoaWNoIGlzIGFsc28gdXNl
ZCBhcyB0aGUgcm9sbGJhY2sgcGF0aCBiZWxvdyksIHVucHJlcGFyZQ0KPiBldmVyeQ0KPiA+ICsg
ICAgICAqIGNsb2NrLiBBYnNlbnQgb3B0aW9uYWwgY2xvY2tzIGFyZSBOVUxMLCBmb3Igd2hpY2gg
Y2xrX3ByZXBhcmUoKQ0KPiA+ICsgICAgICAqIGFuZCBjbGtfdW5wcmVwYXJlKCkgYXJlIG5vLW9w
cy4NCj4gPiArICAgICAgKi8NCj4gPiArICAgICBpZiAoZW5hYmxlKSB7DQo+ID4gKyAgICAgICAg
ICAgICBmb3IgKGkgPSAwOyBpIDwgQURHX1NTSV9NQVg7IGkrKykNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgcmV0IHw9IGNsa19wcmVwYXJlKGFkZy0+Y2xrX2FkZ19zc2lbaV0pOw0KPiA+ICsg
ICAgICAgICAgICAgcmV0IHw9IGNsa19wcmVwYXJlKGFkZy0+Y2xrX3NzaWZfc3VwcGx5KTsNCj4g
DQo+IERvZXMgdXNpbmcgYml0d2lzZSBPUiB0byBhY2N1bXVsYXRlIGVycm9yIGNvZGVzIGNvcnJ1
cHQgdGhlIHJldHVybmVkIGVycm9yDQo+IHZhbHVlPyBjbGtfcHJlcGFyZSgpIHJldHVybnMgbmVn
YXRpdmUgZXJyb3IgY29kZXMgbGlrZSAtRU5PTUVNLCBhbmQNCj4gYWNjdW11bGF0aW5nIHRoZW0g
d2l0aCBhIGJpdHdpc2UgT1IgY291bGQgcmV0dXJuIGEgbWVhbmluZ2xlc3MgdmFsdWUgdG8NCj4g
dGhlIGNhbGxlciwgYnJlYWtpbmcgcHJvYmUgZGVmZXJyYWwuDQoNClllcy4gV2lsbCBzd2l0Y2gg
dG8gZWFybHktZXhpdCBvbiBmaXJzdCBlcnJvciBhbmQgcHJlc2VydmUgdGhlDQpmaXJzdCBlcnJv
ciBmcm9tIHRoZSBzdXJyb3VuZGluZyBmb3JfZWFjaF9yc25kX2Nsa2luIGxvb3AuDQoNCj4gDQo+
IEFsc28sIGlmIG9uZSBvZiB0aGVzZSBjbG9ja3MgZmFpbHMgdG8gcHJlcGFyZSwgdGhlIGxvb3Ag
ZG9lcyBub3QgYnJlYWsuDQo+IFRoZSBzdWJzZXF1ZW50IHJvbGxiYWNrIHBhdGggd2lsbCB0aGVu
IHVuY29uZGl0aW9uYWxseSBjYWxsDQo+IGNsa191bnByZXBhcmUoKSBvbiBhbGwgY2xvY2tzLiBE
b2VzIGNhbGxpbmcgY2xrX3VucHJlcGFyZSgpIG9uIGEgY2xvY2sNCj4gdGhhdCBmYWlsZWQgdG8g
cHJlcGFyZSB0cmlnZ2VyIGEga2VybmVsIHdhcm5pbmcgYW5kIHVuZGVyZmxvdyBpdHMgc3RhdGU/
DQoNClllcy4gV2lsbCB0cmFjayBwcmVwYXJlZCBzdGF0ZSB3aXRoIGEgYm9vbCBzc2lfY2xrX3By
ZXBhcmVkDQooYW5hbG9nb3VzIHRvIHRoZSBleGlzdGluZyBjbGtpbl9yYXRlW2ldIHRyYWNrZXIp
IHNvIHRoZSByZWN1cnNpdmUNCnJzbmRfYWRnX2Nsa19kaXNhYmxlKCkgb24gZW5hYmxlLWZhaWx1
cmUgb25seSB1bnByZXBhcmVzIGNsb2Nrcw0KdGhhdCB3ZXJlIGFjdHVhbGx5IHByZXBhcmVkLg0K
DQo+IA0KPiBBZGRpdGlvbmFsbHksIGlmIHRoZSBwcmVjZWRpbmcgZm9yX2VhY2hfcnNuZF9jbGtp
biBsb29wIGZhaWxlZCwgdGhlIHJldA0KPiB2YXJpYWJsZSBpcyBhbHJlYWR5IGxlc3MgdGhhbiB6
ZXJvLiBUaGlzIGJsb2NrIHdpbGwgc3RpbGwgZXhlY3V0ZSBiZWNhdXNlDQo+IGVuYWJsZSBpcyB0
cnVlLCB3aGljaCB3aWxsIG92ZXJ3cml0ZSB0aGUgdmFsaWQgZXJyb3IgY29kZSBmcm9tIHRoZSBm
aXJzdA0KPiBsb29wLg0KDQpXaWxsIHByZXNlcnZlIHRoZSBmaXJzdCBlcnJvcjogb25seSBzZXQg
cmV0IHRvIHRoZSBTU0ktY2xvY2sgaGVscGVyJ3MNCnJldHVybiB2YWx1ZSBpZiByZXQgd2FzIHpl
cm8gb24gZW50cnkuDQoNCj4gDQo+ID4gKyAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAg
IGNsa191bnByZXBhcmUoYWRnLT5jbGtfc3NpZl9zdXBwbHkpOw0KPiA+ICsgICAgICAgICAgICAg
Zm9yIChpID0gMDsgaSA8IEFER19TU0lfTUFYOyBpKyspDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGNsa191bnByZXBhcmUoYWRnLT5jbGtfYWRnX3NzaVtpXSk7DQo+ID4gKyAgICAgfQ0KPiA+
ICsNCj4gWyAuLi4gXQ0KPiA+IEBAIC03OTgsNiArODc3LDExIEBAIGludCByc25kX2FkZ19wcm9i
ZShzdHJ1Y3QgcnNuZF9wcml2ICpwcml2KQ0KPiA+ICAgICAgIGlmIChyZXQpDQo+ID4gICAgICAg
ICAgICAgICByZXR1cm4gcmV0Ow0KPiA+DQo+ID4gKyAgICAgLyogUlovRzNFLXNwZWNpZmljOiBw
ZXItU1NJIEFERyBhbmQgU1NJRiBzdXBwbHkgY2xvY2tzICovDQo+ID4gKyAgICAgcmV0ID0gcnNu
ZF9hZGdfZ2V0X3NzaV9jbGtzKHByaXYpOw0KPiA+ICsgICAgIGlmIChyZXQpDQo+ID4gKyAgICAg
ICAgICAgICByZXR1cm4gcmV0Ow0KPiANCj4gSWYgcnNuZF9hZGdfZ2V0X3NzaV9jbGtzKCkgcmV0
dXJucyBhbiBlcnJvciBoZXJlIChzdWNoIGFzIC1FUFJPQkVfREVGRVIpLA0KPiBkb2VzIHJldHVy
bmluZyBkaXJlY3RseSBza2lwIGRlcmVnaXN0ZXJpbmcgdGhlIGNsb2NrIHByb3ZpZGVyPw0KDQpy
c25kX2FkZ19nZXRfY2xrb3V0KCkgcmVnaXN0ZXJzIHRoZSBwcm92aWRlciB2aWENCmRldm1fb2Zf
Y2xrX2FkZF9od19wcm92aWRlcigpLCB3aGljaCBkZXZyZXMgdW53aW5kcyBvbiBwcm9iZQ0KZmFp
bHVyZS4gYWRnIGlzIGRldm1fa3phbGxvYygpLiBObyB1c2UgYWZ0ZXIgZnJlZS4NCg0KUmVnYXJk
cywNCkpvaG4NCg==
