Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ECA290DBB
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789746052; cv=fail; b=jz0mqRo4gHHzXXAXdbnRoLpEJcd4cwnvcf6640tTkwQO0xXtXHbqKrOKRwyvNqfIjWxZoqOW511Tco87dbmN390xdAElhuDbRT9flfkZbYR8j8ElRy4FjRpchNoY8V6tybTHYlHWYmjxbIo9TItITo3vy0DVoLdNkNfxEJ09tR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789746052; c=relaxed/simple;
	bh=ISue9JQwUIOPg3ezmoRt+HJ9xf2gj9OoKmvU4A2n+Ao=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OJEpdoFy5A0j4pLcELG9oJhlzhh7yOouDtj1Wu4KdezP54pzZDUQ0DVLV4ZuT7mE9vECvIQpyQvP6dfvy8BOeIcBpzrXaxlmxBktAxLfyO7I/GGZ34j7rK6P/T9noZdPCMLRTXnH+qp6bCZdD+PfQq1JrU2mH2KQF8GqRVVns+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mD9o5fKS; arc=fail smtp.client-ip=52.101.228.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mD9o5fKS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yemLmLMpJumUCSQ/gLZ4+e5hF/5SENoa3Tmikq3yR9kXOkj1+LcHuXOglkT90I74NSwj2cfqz+aEM7CYK19W9AuqrUn0sSct7GTcYnkTO93BmSXJ9V4YFGXeDwLX/Jn/AkwL+9lRaYmrunLk2PvJr9QwYBCWYgTF861NtOIlQcvVeCa89pxxhlh0ZUaVYizTLKug0B3234CU7GzD0alxoXhQ+nHxD8KVw4LHTh68kSFqBlbAXvYo/BaAEVZkRPG/JHVV7wC/Uk4f1/tdj6C5Wm0QM+TKqgGVAo5DdyJHfGMXv1kD2bPNl0x3XKe/lrL00cSropyyRPeK5WdlYx9zZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISue9JQwUIOPg3ezmoRt+HJ9xf2gj9OoKmvU4A2n+Ao=;
 b=tF0n+Zx7k4Zb7ALmJ1dN9KxHY1a6gZ1eCseIESMSvqBqW1RD2ICN5fF0ZRKWBSTci+QnMcSJ/aPxEJ8NlztWc4Ma2nOjvz9m4ETnXEYG9JzYNZlAwIylgDHXZALxaYtsfk6CRWo7p7tf9xihpJZfQ7do1V8H4Fymnzl+tBQUy0kpK2hoQV3/MSk1a7Fy0Ffyi9piZEwFvj5J6b8OvDrkRp4bzZUqIJ5KJ6o5taO8PcVSTbM5xxJWE3nWiqWXC+H0Muk06GDukc5x/RuIscdaemWwZFk1DOcT9TBNRpPTWDyzkt/SvtmU3Y7R6s3jg4n5WzhZosgN19SIiyi4Ye6Usw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISue9JQwUIOPg3ezmoRt+HJ9xf2gj9OoKmvU4A2n+Ao=;
 b=mD9o5fKS5Kb2lmolfAm3l1D3SKt+9ofFfNm01dLX9NZiYILL24PnB3wCOMsG+b/+yq1IU3S2iy5WY4QJrKlMDU3AoY0NQJgZGMY3LMnyK8VEQq4qImyp4mOCNp8xXHNrNSzGEP2ayIfXIZSe8Vw8RfQAI0pzbV2SJArQ+SeUXiE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13419.jpnprd01.prod.outlook.com (2603:1096:405:1be::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Fri, 18 Sep
 2026 15:40:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 15:40:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>, "robh@kernel.org"
	<robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Jonathan Cameron
	<jic23@kernel.org>
Subject: RE: [PATCH v2 8/8] arm64: dts: renesas: r9a08g046: Enable TSU
Thread-Topic: [PATCH v2 8/8] arm64: dts: renesas: r9a08g046: Enable TSU
Thread-Index: AQHdR3+z7LgVHeq+f023B4eaQwaXfrbUdCiAgAADgQA=
Date: Fri, 18 Sep 2026 15:40:45 +0000
Message-ID:
 <TY3PR01MB11346F7B4718113C76B93362986872@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260918150730.122056-1-biju.das.jz@bp.renesas.com>
 <20260918150730.122056-9-biju.das.jz@bp.renesas.com>
 <20260918152256.3C2221F000FF@smtp.kernel.org>
In-Reply-To: <20260918152256.3C2221F000FF@smtp.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13419:EE_
x-ms-office365-filtering-correlation-id: e736f80a-e553-4ff2-9259-08df159b3458
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|56012099006|11063799006|38070700021|10067099003|4143699003;
x-microsoft-antispam-message-info:
 RWrwOB6SmYO9SNnxwt6XQMK3i8PuUvYH6gWGGJPbglm7ct3hYKGb3BcRvt7oBawwrlgCTPhBKBpfSNMpyWeUGDD3qAAQIjw6hwS6uUqAEOGxGk5PtdbEtbm5Z+Q4mX857NzYnxzRKstDhrnN5I6I2lzYrAlqbC9oepnydzfAwFqgrG6symDg5fWhyl9IbZ2eysOdBZhriH9/IWQVKXz4zULKU8y3MB0hDS+tT6AbjJbFlvrePH6vbZnduzoRTc5immif84jnSi6aLADi8blfjfVGccer9tbnMGRx4iGEeiwHudPQF7mdB3GHMg2P5XdaYVQiPylfY3T/L+lSQivKAISSwxB0AF7QtBQ5rfiJmozi1TiUv3sfugqBRoo5BZWBG/+I9xKOsFKFuf6W9Ii4C6BDl0Q7OsqV2UjBH0IX8js0f2wlgnuNJLSIGVrDChPjz5Y8oMQOQWDYItqZdPARXwwIgRk1DU7TLdyGcK5KAQ3TxNAeLXGul6mzP8DsHtjJvcWmilbiNpNCq8RCFJkXNrgpQwMVBmRfYOGqFgPUxBrRX6tTT8yyJpXTRYuJyl9xlbkOkCfjXtQOYpX+xES+H0a1Sto9aRDYD2JqbElgfSEW/cAxlzya/M77IwQknQWTqDnrGR13lRQUCHitudCMnsphaLw9MvskZfNRGA6c91w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(38070700021)(10067099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SWhHdGNiTWhYNVR2LzhZOEFPNVRCVGUrQUk4Q2NQM3pnV094ZlFMU1Ivb3FK?=
 =?utf-8?B?R2hTOTBIL1U5OGxVaVV0WXh4cC9jOUlXOHBEZ0k1Nlo1SFFsamdEaC9GN28w?=
 =?utf-8?B?VDVwWTM4MlA3Y2ZibitPZnJaWE02QlgxREVqYlo3Y0dSOEpBdUJsSExGRUJS?=
 =?utf-8?B?QjU5TEtvRzF3RUJXZmc3YTVuU0UydGJCZXdsZnNHQXVtaDRBYWkwL3dtTU80?=
 =?utf-8?B?VzlmeUpZK0MxWlF2Z2tSRGVvVTdua2tjeWtEWHRQOTdweTlWU01Na1ZYMVhl?=
 =?utf-8?B?NlI0NHBZWWJLNTJLdk1BMWgxOFk2RGRQdkJ1R2VCY3AzY2VDNW9NWG1KZTdM?=
 =?utf-8?B?dWJ2YjJSK2dzZHpLMlJZMENQbWFUNXM3aWh2bzBGNm1Mai82bGJ4TjNmdU5n?=
 =?utf-8?B?SmJ0OUhvakQvb0NtV3FiY1V2a05oY1N1ZFRYUG9XbDYwYWVlR2RIUThOeFk0?=
 =?utf-8?B?SXJ0M25JQ3piOWdWTXRDUU0yWjRFOE5PYW5UOFFuUkR6cjRKaExoWEMrMUcw?=
 =?utf-8?B?a2NWM2ludjBaNWpIOXlyZTd3Y29nMEhiMFJqTmNoQVE2a01jSUdBWmpLSXlN?=
 =?utf-8?B?cUQxZHhwWmxQdVhuYmlpV3FjWjJvZkxrN25pa29QYVJRNnhuQ0oybGlNZ09w?=
 =?utf-8?B?YXVVZTZqRlRXSFFHTzJNVkQ5OUdjNGxTdlRoZnNWVm9HbGR3c09vMzRJcFdh?=
 =?utf-8?B?Wk8wbGRMaHZzSGpFeEtzeEpselZEaUV2bVZ0SU43V2JqSThUN2pBbGRWdzNs?=
 =?utf-8?B?VE5STWwwMlU1eXMxZzBycUtVaDk0c3FoL2U3a0phdzhHVWJmSlRqOC92a0F5?=
 =?utf-8?B?RFY4ZVZtWnY2S05BM2FOOTdhT2NFcjNjUlFtSExwM0JKelFJS25kbyt0eS9F?=
 =?utf-8?B?alg4VklGNnFEc2JhcnhtcVJielRTaURVbzdUOHQzemd5cW44TTlHMWo3VjNW?=
 =?utf-8?B?ZGhJcHdnRmFjaG4wN043b0xIcHdsaXNtZFdQY2Z4U3ZPWWJ6MDhoMVFsZlln?=
 =?utf-8?B?RmpoaUtPd00vUzZ5STBpcCtzMUo4dnFSTklzTnNzUFJvSXpNOTN2Qi9hQW5T?=
 =?utf-8?B?VHlSNTg2K0lKTVdUMmhldm01ejltcGVPU0ljNlZXbWpBYW9qREpTenpVUnAr?=
 =?utf-8?B?MGdJVlJHU2NybzhQcGJqS1dhYldxQkxpTXc2bEoycWRpUm1hRDBjd0pZQlho?=
 =?utf-8?B?UXI2eVg0UkZDMi9nU2ZodmFLZ2NnT2w3TTcrVHJpQWd2dS9KSVo5aVhJdlJF?=
 =?utf-8?B?cEVBd2ZYVkttOUJsNmVEYU5DaXduM21GZko4QjdQODRhQWdScU94cEU1UGJX?=
 =?utf-8?B?L29Kb1dIOXFaTTdxYWpUOEg4R0xZU0dobFprRFFqWnFSdzhDUnhIT1JDQU1Y?=
 =?utf-8?B?dlZlMmY2SmNyKzVqSllONUxlTlhrWnN2UGRyVHVqY1ZRc0xCUDhVRUtWQ0JK?=
 =?utf-8?B?WlpudVFQZC8zM1Q1RURsOU1UU2srUUF0dk1UblEwK2lhNFdDS1R5RytaSXpW?=
 =?utf-8?B?ZnEzUk5TMnpPbWU1ZkNGNHU2dER0MkVRWjloYk44RzRXOFlNMHB4eWxFVU15?=
 =?utf-8?B?SHErcjJvaEx5Uk8wNi85YzhyVWRpdmJlWS85T3VnKzlMam91NTFtVWRoZDR3?=
 =?utf-8?B?Yy9uaEFJR2R6RndDdEVhTmhiU2ljNHVZVEdhdWsxRm44MFVwOGNVL2hFYTZo?=
 =?utf-8?B?c3p1RDZISGIvMTdralkrYjBGRjRodFpOMDlEdnFjaTVYcEtBZUp4NC9BTERq?=
 =?utf-8?B?dWJkMUZuUGx1Q2VBb3lCaTRNbDZNNW1IU2RZRWpDOTVYMEo5eXExaWFudlhB?=
 =?utf-8?B?TDZWYXRwV0RMbGx2dDFIVG9uWFBJQ1FjSmlyeWtOQUZ6Z0JzcnFUQzhCWHY1?=
 =?utf-8?B?SHorRW9aQkxpMUFDeWxvOGV1cWNsdzFRR20zMHpwNDZObXNVci9CcjI3SG15?=
 =?utf-8?B?ZlZndDJUNUpvMzdCdkM5Y2Fxd0FhNTFvV0ZWdWlxYW8vRWZmRWRyMHhVc2hj?=
 =?utf-8?B?dGZmaGJ2NzZEVVlVOGpYVjdES3UzYld3TU9MRzlxLzJ3a0VISTg5QlQ2UnhS?=
 =?utf-8?B?NzJmQUJHU3NpWE04d3FVUERoNUZ5dkZUdlJoZ0MyY0lyWE5jWjBvRTRWVEpj?=
 =?utf-8?B?SStoZHdYL1VCRXdLRXdkWTJ2UGFvZXdDLzNndnQ0c2JSS2xoa2ZTd0RqVXlI?=
 =?utf-8?B?ajA3emxrOUxpSXl5ZHlOb1QwSFBJTTliVnlLclQ1Tk9TV1NCcXBrRGNJdkcw?=
 =?utf-8?B?VzRWTHdpdkI2emhmUjY5dGRMSmxtaFUxUUpnNGpqUTJBM1lQM25VWjczNlRT?=
 =?utf-8?B?cEFReXlnZG1zTzVvdVdqejV1VmVWa205YnRCNlhKMDBxNEVJSVNTdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e736f80a-e553-4ff2-9259-08df159b3458
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 15:40:45.0910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qS+4sVWekDCRUslppBFtFrlDfcMXgxB1lwFLKeJgI2g/v2FHLQSid7/s03n5u5xir7ewL7/1FzDOMLOY0BcQ87LQecOr2PYy5/cniS0x4i0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13419

SGkgU2FzaGlrbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNo
aWtvLWJvdEBrZXJuZWwub3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiAxOCBT
ZXB0ZW1iZXIgMjAyNiAxNjoyMw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDgvOF0gYXJtNjQ6
IGR0czogcmVuZXNhczogcjlhMDhnMDQ2OiBFbmFibGUgVFNVDQo+IA0KPiBUaGFuayB5b3UgZm9y
IHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBp
c3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbTWVkaXVtXSBkdDogaW8tY2hhbm5lbHMgaGFyZGNv
ZGVzIExpbnV4IGFycmF5IGluZGV4IGluc3RlYWQgb2YgaGFyZHdhcmUgSUQNCj4gLS0NCj4gDQo+
IGNvbW1pdCA0M2RjZjU2Zjc0ZjQ2ZjAyNTgzOTYxMGFkZGE3NDNhYjUwMmI4NzExDQo+IEF1dGhv
cjogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBhcm02NDogZHRzOiBy
ZW5lc2FzOiByOWEwOGcwNDY6IEVuYWJsZSBUU1UNCj4gDQo+IFRoaXMgY29tbWl0IGFkZHMgY29v
bGluZyBjZWxscyB0byB0aGUgQ1BVIG5vZGVzIGFuZCBkZXNjcmliZXMgdGhlIEFEQzEgYW5kIFRT
VSBub2RlcyB0byBlbmFibGUgdGhlcm1hbA0KPiBtaXRpZ2F0aW9uLiBJdCBhbHNvIHNldHMgdXAg
YSBDUFUgdGhlcm1hbCB6b25lIHdpdGggcGFzc2l2ZSBhbmQgY3JpdGljYWwgdHJpcCBwb2ludHMu
DQo+IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDhn
MDQ2LmR0c2kNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOGcwNDYuZHRz
aQ0KPiA+IGluZGV4IGM2M2E4NTdmMGU1YjAuLmEyZjY3MThjMDA0M2EgMTAwNjQ0DQo+ID4gLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA4ZzA0Ni5kdHNpDQo+ID4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA4ZzA0Ni5kdHNpDQo+IFsgLi4uIF0NCj4g
PiArCQlhZGMxOiBhZGNAMTA4YzAwMDAgew0KPiA+ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMs
cjlhMDhnMDQ2LWFkYzEiOw0KPiA+ICsJCQlyZWcgPSA8MCAweDEwOGMwMDAwIDAgMHgxMDAwMD47
DQo+ID4gKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzNzggSVJRX1RZUEVfRURHRV9SSVNJTkc+
Ow0KPiA+ICsJCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIFI5QTA4RzA0Nl9BREMxX0FEQ0xLPiwN
Cj4gPiArCQkJCSA8JmNwZyBDUEdfTU9EIFI5QTA4RzA0Nl9BREMxX1BDTEs+Ow0KPiA+ICsJCQlj
bG9jay1uYW1lcyA9ICJhZGNsayIsICJwY2xrIjsNCj4gPiArCQkJcmVzZXRzID0gPCZjcGcgUjlB
MDhHMDQ2X0FEQzFfUFJFU0VUTj4sDQo+ID4gKwkJCQkgPCZjcGcgUjlBMDhHMDQ2X0FEQzFfQURS
U1RfTj47DQo+ID4gKwkJCXJlc2V0LW5hbWVzID0gInByZXNldG4iLCAiYWRyc3QtbiI7DQo+ID4g
KwkJCXBvd2VyLWRvbWFpbnMgPSA8JmNwZz47DQo+ID4gKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+
Ow0KPiA+ICsJCQkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArCQkJI2lvLWNoYW5uZWwtY2VsbHMg
PSA8MT47DQo+ID4gKw0KPiA+ICsJCQljaGFubmVsQDggew0KPiA+ICsJCQkJcmVnID0gPDg+Ow0K
PiA+ICsJCQl9Ow0KPiA+ICsJCX07DQo+ID4gKw0KPiA+ICsJCXRzdTogdGhlcm1hbEAxMDhkMDAw
MCB7DQo+ID4gKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwOGcwNDYtdHN1IjsNCj4gPiAr
CQkJcmVnID0gPDAgMHgxMDhkMDAwMCAwIDB4MTAwMDA+Ow0KPiA+ICsJCQljbG9ja3MgPSA8JmNw
ZyBDUEdfTU9EIFI5QTA4RzA0Nl9UU1VfUENMSz47DQo+ID4gKwkJCXJlc2V0cyA9IDwmY3BnIFI5
QTA4RzA0Nl9UU1VfUFJFU0VUTj47DQo+ID4gKwkJCXBvd2VyLWRvbWFpbnMgPSA8JmNwZz47DQo+
ID4gKwkJCSN0aGVybWFsLXNlbnNvci1jZWxscyA9IDwwPjsNCj4gPiArCQkJaW8tY2hhbm5lbHMg
PSA8JmFkYzEgMD47DQo+ID4gKwkJCWlvLWNoYW5uZWwtbmFtZXMgPSAidHN1IjsNCj4gDQo+IFtT
ZXZlcml0eTogTWVkaXVtXQ0KPiBEb2VzIHRoaXMgaGFyZGNvZGUgYW4gaW50ZXJuYWwgTGludXgg
YXJyYXkgaW5kZXggKDApIGluc3RlYWQgb2YgdGhlIGFjdHVhbCBoYXJkd2FyZSBjaGFubmVsIElE
ICg4KT8NCg0KVGhlcmUgaXMgYSBtYXBwaW5nIGJldHdlZW4gaW50ZXJuYWwgTGludXggYXJyYXkg
aW5kZXggKDApIGFuZCB0aGUgYWN0dWFsIGhhcmR3YXJlIGNoYW5uZWwgSUQgKDgpLg0KDQpTZWUg
dGhlIGNvZGUNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y3LjMtcmMzL3NvdXJj
ZS9kcml2ZXJzL2lpby9hZGMvcnpnMmxfYWRjLmMjTDM1NA0KDQpDaGVlcnMsDQpCaWp1ICANCg==
