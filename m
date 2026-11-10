Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.110
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794348943;
	b=1q4TluxBUbjX5NrA4nPFd3A9nUsJcRCWkNAGFrkAA6ulrDTwvcSagZ0rqjx4GMYMwuvG
	 Jpc7dxA83UPEk6HSe8rN/LiBYecMfvS8ozgj4fGAUNHsfd2OR5k/beWDa0SwL7VDRiMog
	 jdCjazpmUWQ+US29foE0PawY5i40INFvVaGbs/hN5joxIczNt7E1nAyzrUhvTYwPlyblN
	 qZW4bo5bfgp1mJbbiVuskB2ii06Zi1GO52qnv3VcUmbYLvNDYVZ6LwTO9i+R7lNBGiW9B
	 8S8lAaQhOFzL+IhYqXFMSUmO4SobcGoCYGtoGbrF3x6vLrzWZt5CEHhkf6Z/DTlwaCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348943;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=oOI865n5P4oNku/3mDlNqF9lRxH38RMCOSfO+0WoKTs=;
	b=ktpPUHEFh8ErY+2yaGsOzs8NFqxnRWFyDt0V620zCcOpw6apqghdRlUK68TgZIW/oUFJ
	 qTlp4WIPP2e7xewa9s2fYulc/QSU6TnhgAp4JOVE1FJK/4kenduTnJkkn2QmpxJUn9PZb
	 mGl7xR2HUnu0YBaPtZBtRLIkG+CqsPDC/5+tXgGLURCyrk6uaBaWzqMEFoYIMP7NK53/9
	 nUSL5N5gFgFItn6vzvy4Vb6SCNA6p87MllbacJAIH9U4CzU5KzRAaUKclB0pEiS9EZzrj
	 yk2TDNN9uaSqdwU3xKiZDKFzyIdMP4vLy93yty8ighswHb1Rhs0X8u4YShidzY37OBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.com;
	spf=pass smtp.mailfrom=phytec.com;
	dkim=pass header.d=phytec.com header.i=@phytec.com header.a=rsa-sha256 header.s=selector1 header.b=E7O8g66P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.110
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020110.outbound.protection.outlook.com [52.101.84.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05385606A320
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 22:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05385606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.com header.i=@phytec.com header.a=rsa-sha256 header.s=selector1 header.b=E7O8g66P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8chqym2JboHehgIwJMp4TUgTw425HgNRq3PAEX6y01LAe/iPl1Oka5In+VvH86XtsWTP21zXhBMFloZlxJWO2OqyUK8RMs5kyNrVE2szb4DK+hxi9hHrnjsFeBZJg0qulMUG6ff0lUrktBz31wau310Br5LZ3C8DgUi7+nmEJRS/AwYzJZJ5k26RCkh07hI7zLF2muCnFcwl66s1O96M1prK3btsZJ84a70jOsBmnJYPYib8EujuAPNcGZ7Svnj1B9mrTyqBJLegMTO6eYBrYjEPHAjpYPQyVjqxmApNzGnHhAcpEb44jbCgCHG6/ZEJsvGBxvjoxbTwWFRO3j3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOI865n5P4oNku/3mDlNqF9lRxH38RMCOSfO+0WoKTs=;
 b=n2fU7B9+yy/RB6Fctxou0G1S2mfwZZDfWXqRl8BUF5AAL++1Msc0mzgVVEq5dAM/RL2lBbcLnB+0EYvDa9mYTqw+LSv4d4zvLkCQWF0FcVO7lDaPYq6FD7Uf4S6YvykNg+by3NO3tfeZY6l4/P4iaLHi9mpne+Rg4Y1MkFFVRkWrjLUD1gAkUXuoYhy5u1Kuk1iZXMf+eAlYCoZWiMuUP7BInnF+p8EUaf684WVNy6Gsl0ayP+e+8VOwCycrZ5+tp209uH4hfNpQczyp8P//J44TgTcAQx1mCGjFClstxu+8h/xn99E8Pe1NyOS81vbwO7/KATQhHas/0epJ0+GIuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.com; dmarc=pass action=none header.from=phytec.com;
 dkim=pass header.d=phytec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOI865n5P4oNku/3mDlNqF9lRxH38RMCOSfO+0WoKTs=;
 b=E7O8g66PyCLZErqk8EJVkgqlbunM+eBuQTiS/FcsgExvZmzn8+8S9UBRQKjMHWgXAQY3xCSwngypqzC8YwO45uwjNP/WyPLZUC+IhSRRAkp37VM/Cj6pEdyQCrvSYUa2aZxXnRPn8pHjaJN6wV9eZS+WgOLEiYSJIVGyUQzvGT+1JoOpVjCdRYrxoodNn72ol//OkVJJpjRFRLBG1v3MbwID0LcSvAKTdhp90zkb6Gu0B63PnWu8KqvK7zdm9z81hLI3dk55bUdEgLC8p69R4pB18sMWyhU4Hpk/BRqDnxzkgZdN32cHt8HSng+9a7z1NgVs4vHaluGPyEwzX1cRrQ==
Received: from AM4P195MB3014.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:6e6::6)
 by VI1P195MB0704.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:15c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 22:15:37 +0000
Received: from AM4P195MB3014.EURP195.PROD.OUTLOOK.COM
 ([fe80::ffdd:c1d2:306:d309]) by AM4P195MB3014.EURP195.PROD.OUTLOOK.COM
 ([fe80::ffdd:c1d2:306:d309%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 22:15:37 +0000
From: John Ma <jma@phytec.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: Add support for the phyCORE-AM62Px
Thread-Topic: [PATCH v4 2/2] arm64: dts: ti: Add support for the
 phyCORE-AM62Px
Thread-Index: AQHdZkrhvyQh+TwqHUKdHpiiqBKLkbcRy72AgBYpsgA=
Date: Tue, 10 Nov 2026 22:15:36 +0000
Message-ID: <e819fde55d9f14aaf89e2ac44186878fe8e5829f.camel@phytec.com>
References: <20261027193901.3538135-1-jma@phytec.com>
	 <20261027193901.3538135-2-jma@phytec.com>
	 <sashiko-outbox-187077@kernel.org>
In-Reply-To: <sashiko-outbox-187077@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4P195MB3014:EE_|VI1P195MB0704:EE_
x-ms-office365-filtering-correlation-id: e2e3f539-a2de-4fb6-456e-08df3f78259d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|3023799007|261009223027099003|4143699003|11063799006|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|56012099006|38070700021|10067099003;
x-microsoft-antispam-message-info:
 Li3TbDUo+cp2SOYlCksWfxqoUpah2dGUSwY2Jm0+cXbnDw9cCY3Z27MOKdFk9b/9kg3KRdFwUqoV9FuL7Ghdgc7YVkJxFBgZuYb7vjlimzQh3Bj8GrnPuPYL2r7tkXXnrkUZzpcr01cnJizlBe8ufgJFTcHs6Liku9oq9EsHrLW8x5UFHhdi+anDSF809S/6dZ8PBBHeOlBkedCcQ8syvgMTWuMNprpv/Ew6sVD5JLdwR+ramvqrR8fsSgk5HCCa00aepS/gpVYurS+go3PoDQxpF4GFyjB+JJRTeC3SJeg+YpPS5/iqhLXNUjeigG/H5nOR5L09V9aS7/dCixFU7MilchW8cgAJ9RMg8n3vVqfb83cAKzeIDjePcmNpQFaDc+2t3x5UJrKJ2lmLt83WMXnrwtWLLJtEYcUnz1xnybHJ23ekrk4zS6od9VrITWOuzbqsRiYwtJwjdZ/KtQX1+CEpiXrU4PAXsNgLP6U/wYRVFQ2ZrXxM4LJCfftLFvVESVJ1C1HMxu3wpIL7vK+92LUD4ZgTpP1CeZwFkCJ9msXJxp4IwKlB6bv8zitvs+TBNqI3MCSdzt0lEsjWVxeAt0llBZ4r2L6R0cX2kc5mMhY1qY1LzXAs5LUiwYeT1svG7RSldnXvcVvY1OT1bf+E3JNjl/Wsf3MMJjVYni2B9QufkP/XEBqG7pnh6f7wklGLUUMRaPf9b6WyKVH+BDfyps7OyfkWKTb/Cw1HcbcCvQc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4P195MB3014.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(3023799007)(261009223027099003)(4143699003)(11063799006)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(56012099006)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cGxwQlQybjBLTGtWZ011dkZUbmY0Y1A1TWFFbmticHlJck5ON2IyaDNPcjVE?=
 =?utf-8?B?d09RbjdselRLT1hlSjhYdHBXZUgyRkFzYlJxczBibmpIOXJ6QnFSTURlOFdX?=
 =?utf-8?B?Zlc2cUpjZ0p4b3ErdUlBSTlZUG51M2lxaUFkS0lnQUNsRXQwOFhJWkpHL1JY?=
 =?utf-8?B?MU9CdFcwZmZhaWJzbFpUVDU5WHEya24xTktQZEtLZDRpZzgrdHZZVTdER1c4?=
 =?utf-8?B?STVNRUhnSUtvNVI2am5ldzJ6QmcvOWhQYlBrT0Q4dzBQRVIwVEQ4a21vRUYx?=
 =?utf-8?B?cUhGSEUzUXMxS0NYZ212NFVyakpULzNHTlJYYVpYRFNRT1czVGJPdkhTR0o2?=
 =?utf-8?B?a0NzenA4OWtxQ2hTODJJSlZLZWZFc2E4KzJjc3puK1JFRjNBZ0VNS05lOUxx?=
 =?utf-8?B?K2RYNFkvU0FESWE4OFRTaDlLQ0d5RXBJR3ZkdWEwRWgwRFZXOUd1cTc1d2pu?=
 =?utf-8?B?SXlicG1UWkN3UzR2YzlsMjNOaXlUSjN5Q3doWVhaa3JWdGRvYkFiMzdxYTNm?=
 =?utf-8?B?Y1dVMmQxQkEycG56bVZZWlpyVEE5aEJ4Qi9DNEhCNldRbkdoZmdkcHI3UGZi?=
 =?utf-8?B?SERIbjl0Qkd3eUQzSnpxWE5yYnNGcW9WcHppbUtOVkcxZDIzNUYvMXBRM0Ft?=
 =?utf-8?B?ZW43alN2VXlCU090V1NjN1RuS2RaaWMrall4Ykw5S3RBR2JjSzBPM1U0VWor?=
 =?utf-8?B?cUNVWFVkaHJVRjVSaVRCZHQzSG1ZTkd1RG0zL1N2aWxmNWtUK002WTZINEda?=
 =?utf-8?B?eXUwYisrMHBxZ29MbkJ0Wmd2aUZRazh3KzZUY1lMNUk1THYyd0Z2WVlIMmNI?=
 =?utf-8?B?YzcwS1lKRGh4azl4Tmo2azdOUXVRaUZyMW96YlZlUlc5N3Bzb0RqSWppRUJl?=
 =?utf-8?B?RmQyNXQ3RXBkdUR1QmZ4WU0wcjcvbDQ5bklWcTJjS0pJblh3cElkVk93Tnho?=
 =?utf-8?B?V0YyMGUrMTYvczJ4WS9GcEFSWUxmNlkrNDZqNUZCcVZnTUhTTzNVTzhzeURT?=
 =?utf-8?B?VXVmcWZRUUZLdGdwL3ZSNkhZdzhMeHhhd2szbmg1Y1RjMnUzRTAxMTBCcUxC?=
 =?utf-8?B?aVpraDhuTzc5bEJiWk5NSkMxTVhRQm9rWGZhQVMzekVZQTdEandQYkxKZHJt?=
 =?utf-8?B?RjYvdlY5V0gzRkRVTER1WGdjYlZrb1FjWkZocmgrbHRyWEMyRGVncnRKTUtk?=
 =?utf-8?B?SFhxTlp6dDlkYnVocjN3TzVvZkxXbmlGeEdUYW9VdHhlL1U2V0RqakVIY3I2?=
 =?utf-8?B?UlYvc09qaGdmODU5R1haUFNxdU8yTUxlamJkcVZVL3UxcGxnM25Mb0lHeldp?=
 =?utf-8?B?RmEzMXRUdWVlTTQ4c2tTd1FBRng3cWs1Um5sa1ZUajJOYm9CNHFaUnlMbC9o?=
 =?utf-8?B?NGtlVVl6U1JkdEYyaHpaSlVMSDRHeGNjVnlsdHVzdjBjTWNsSzlVcnowOWNu?=
 =?utf-8?B?Z004dGM5ajhaL09LSXUwNHFnc0g4OWlMTWNvMnZFWFIva05ha1dJYm5PVEVz?=
 =?utf-8?B?M21yejFwSGN6a0tRWmtod3VyeFptOU1SOFk1U2pGaXE1WlE4VWlJTzZjd0RQ?=
 =?utf-8?B?bGdKK0htaGoxRGFueUJBN2dUS2ZtMXV5MVI0RXVmb0JUMXl2NkRoTzFrZndz?=
 =?utf-8?B?czhCUVhKeUFuc3FQVE5ieDFNTHpYZ2JpbXBneDBRNVpZTEJKVllwdTlJdFc0?=
 =?utf-8?B?WDBDRnhydGxabDZEMm8ySkEvUzNEMjBRTFgvWTdtdlBmSU1iYWJxWjY4cXJX?=
 =?utf-8?B?bnl0MEFLczhqK3JXa21yZGNSYTNHazUxTE8zaUVUUmtLMHNFSVpOOTE2RXkr?=
 =?utf-8?B?Um42ekhyOU5McTN0N0ZUalNPTVZrU1FMY1dGY1B2RmtxZzZIS01TNG5SS1E0?=
 =?utf-8?B?WXA2SkVFWThsMitVY01PdFJRZThzY3BMR1p3MDhDMUNyVVBMdk56OU4yYWlt?=
 =?utf-8?B?cWsrOXpGc1RzVytjL1RQMVZCVjRPUDZkRkoxLzh0Y1J3aEFoczh0MHk1V3ZC?=
 =?utf-8?B?L2lTUGNuY0gvS25OaWJPYU5jYzlVWEFGaFhSQTJCdjB4ODVmTi9OVWxsaitT?=
 =?utf-8?B?YmpWbVh2VEpFT0RWaXd0VnIvUnNCekxMVnE1ZStSWU5FU242SGRPRHE4N2Nj?=
 =?utf-8?B?eGlQb3FTZkl2S0kzSVlDQUpad1ppZjJDV1l4WXcrVHVHMXFTNkRGVW1aNkMz?=
 =?utf-8?B?L3hKTHlIWVl0dmNlbENEM01ubFVzMW5hWDYzM0RBT293b2RDeVd0K0EvdXh1?=
 =?utf-8?B?bmNXS2ZabVkwSDM0a1o5OWZVTzRVUTZSdnd3L0pJaWErUjl0ZGROL3dCQlcr?=
 =?utf-8?Q?Y+Y+s6rRjBp839Vx05?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65E53D8040E42944A6C0A962BF4FD32D@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4P195MB3014.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e3f539-a2de-4fb6-456e-08df3f78259d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 22:15:36.8641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DoK2/WQtOv9YvxQLyQMDuDn/sgPGcZ0wrmy0tUpsSzYZIpOpAWtGCksSU0MIYBUQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB0704

SGkgc2FzaGlrbywKCnY0IGlzIGJhc2VkIG9uIGEgdHJlZSB0aGF0IGhhcyA0NmI3MjYxYzJiYWQg
KCJhcm02NDogZHRzOiB0aTogazMtYW02MnA6ClNwbGl0IHI1ZiBtZW1vcnkgcmVnaW9uIikuIFRo
ZXJlLCBrMy1hbTYycC10aS1pcGMtZmlybXdhcmUuZHRzaQpyZWZlcmVuY2VzIHRoZSBzcGxpdCBp
cGMvbHBtLSovZG0gcmVnaW9ucywgd2hpY2ggdGhlIHBoeUNPUkUgU09NIGR0c2kKZGVmaW5lcy4g
d2t1cF9yNWZzczBfY29yZTBfbWVtb3J5X3JlZ2lvbiBubyBsb25nZXIgZXhpc3RzIGluIHRoYXQg
ZmlsZSwKYW5kIGszLWFtNjJwNS1waHlib2FyZC1seW54LmR0YiBidWlsZHMgd2l0aG91dCBlcnJv
cnMuCgpUaGFua3MuCgoKT24gVHVlLCAyMDI2LTEwLTI3IGF0IDE5OjQ4ICswMDAwLCBzYXNoaWtv
LWJvdEBrZXJuZWwub3JnIHdyb3RlOgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24h
IFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsCj4gaXNzdWUocykgdG8gY29uc2lk
ZXI6Cj4gLSBbTG93XSBhcm02NDogZHRzOiB0aTogbWlzc2luZyB3a3VwX3I1ZnNzMF9jb3JlMF9t
ZW1vcnlfcmVnaW9uIGxhYmVsCj4gYnJlYWtzIERUQiBidWlsZAo+IC0tCj4gCj4gY29tbWl0IDBi
ODUxNDY5MzlmMDE3OTE0YjJhZjVjNGFmZDVhZjA5OTNjZjNhYWQKPiBBdXRob3I6IEpvaG4gTWEg
PGptYUBwaHl0ZWMuY29tPgo+IAo+IGFybTY0OiBkdHM6IHRpOiBBZGQgc3VwcG9ydCBmb3IgdGhl
IHBoeUNPUkUtQU02MlB4Cj4gCj4gVGhpcyBjb21taXQgYWRkcyBkZXZpY2UgdHJlZSBzdXBwb3J0
IGZvciB0aGUgUEhZVEVDIHBoeUNPUkUtQU02MlB4Cj4gU29NIGFuZAo+IHRoZSBwaHlCT0FSRC1M
eW54IGNhcnJpZXIgYm9hcmQuCj4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy90aS9rMy1hbTYycC1waHljb3JlLXNvbS5kdHNpCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
dGkvazMtYW02MnAtcGh5Y29yZS1zb20uZHRzaQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+
IGluZGV4IDAwMDAwMDAwMDAwMDAuLjE5NTVlZjQ5YmMzYWYKPiA+IC0tLSAvZGV2L251bGwKPiA+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvdGkvazMtYW02MnAtcGh5Y29yZS1zb20uZHRzaQo+
ID4gQEAgLTAsMCArMSwzNzggQEAKPiBbIC4uLiBdCj4gPiArCXJlc2VydmVkX21lbW9yeTogcmVz
ZXJ2ZWQtbWVtb3J5IHsKPiA+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDI+Owo+ID4gKwkJI3NpemUt
Y2VsbHMgPSA8Mj47Cj4gPiArCQlyYW5nZXM7Cj4gPiArCj4gPiArCQkvKiBnbG9iYWwgY21hIHJl
Z2lvbiAqLwo+ID4gKwkJbGludXgsY21hIHsKPiA+ICsJCQljb21wYXRpYmxlID0gInNoYXJlZC1k
bWEtcG9vbCI7Cj4gPiArCQkJcmV1c2FibGU7Cj4gPiArCQkJc2l6ZSA9IDwweDAwIDB4MjQwMDAw
MDA+Owo+ID4gKwkJCWxpbnV4LGNtYS1kZWZhdWx0Owo+ID4gKwkJfTsKPiA+ICsKPiA+ICsJCXdr
dXBfcjVmc3MwX2NvcmUwX2RtYV9tZW1vcnlfcmVnaW9uOgo+ID4gbWVtb3J5QDljODAwMDAwIHsK
PiA+ICsJCQljb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7Cj4gPiArCQkJcmVnID0gPDB4
MDAgMHg5YzgwMDAwMCAweDAwIDB4MTAwMDAwPjsKPiA+ICsJCQluby1tYXA7Cj4gPiArCQl9Owo+
ID4gKwo+ID4gKwkJd2t1cF9yNWZzczBfY29yZTBfaXBjX3JlZ2lvbjogbWVtb3J5QDljOTAwMDAw
IHsKPiA+ICsJCQljb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7Cj4gPiArCQkJcmVnID0g
PDB4MDAgMHg5YzkwMDAwMCAweDAwIDB4MTAwMDAwPjsKPiA+ICsJCQluby1tYXA7Cj4gPiArCQl9
Owo+ID4gKwo+ID4gKwkJd2t1cF9yNWZzczBfY29yZTBfbHBtX2ZzX3N0dWJfcmVnaW9uOgo+ID4g
bWVtb3J5QDljYTAwMDAwIHsKPiA+ICsJCQljb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7
Cj4gPiArCQkJcmVnID0gPDB4MDAgMHg5Y2EwMDAwMCAweDAwIDB4ODAwMD47Cj4gPiArCQkJbm8t
bWFwOwo+ID4gKwkJfTsKPiA+ICsKPiA+ICsJCXdrdXBfcjVmc3MwX2NvcmUwX2xwbV9tZXRhZGF0
YV9yZWdpb246Cj4gPiBtZW1vcnlAOWNhMDgwMDAgewo+ID4gKwkJCWNvbXBhdGlibGUgPSAic2hh
cmVkLWRtYS1wb29sIjsKPiA+ICsJCQlyZWcgPSA8MHgwMCAweDljYTA4MDAwIDB4MDAgMHgxMDAw
PjsKPiA+ICsJCQlib290cGgtcHJlLXJhbTsKPiA+ICsJCQluby1tYXA7Cj4gPiArCQl9Owo+ID4g
Kwo+ID4gKwkJd2t1cF9yNWZzczBfY29yZTBfbHBtX3Jlc3RfcmVnaW9uOiBtZW1vcnlAOWNhMDkw
MDAKPiA+IHsKPiA+ICsJCQljb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7Cj4gPiArCQkJ
cmVnID0gPDB4MDAgMHg5Y2EwOTAwMCAweDAwIDB4OTcwMDA+Owo+ID4gKwkJCW5vLW1hcDsKPiA+
ICsJCX07Cj4gPiArCj4gPiArCQl3a3VwX3I1ZnNzMF9jb3JlMF9kbV9yZWdpb246IG1lbW9yeUA5
Y2FhMDAwMCB7Cj4gPiArCQkJY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwo+ID4gKwkJ
CXJlZyA9IDwweDAwIDB4OWNhYTAwMDAgMHgwMCAweDFiNjgwMDA+Owo+ID4gKwkJCW5vLW1hcDsK
PiA+ICsJCX07Cj4gWyAuLi4gXQo+ID4gKwlpMmNfc29tX3J0YzogcnRjQDUyIHsKPiA+ICsJCWNv
bXBhdGlibGUgPSAibWljcm9jcnlzdGFsLHJ2MzAyOCI7Cj4gPiArCQlyZWcgPSA8MHg1Mj47Cj4g
PiArCX07Cj4gPiArfTsKPiA+ICsKPiA+ICsjaW5jbHVkZSAiazMtYW02MnAtdGktaXBjLWZpcm13
YXJlLmR0c2kiCj4gCj4gW1NldmVyaXR5OiBMb3ddCj4gRG9lcyBidWlsZGluZyBrMy1hbTYycDUt
cGh5Ym9hcmQtbHlueC5kdGIgd2hlbiBDT05GSUdfQVJDSF9LMyBpcwo+IGVuYWJsZWQKPiBmYWls
IGluIGR0YyBkdWUgdG8gYW4gdW5yZXNvbHZlZCByZWZlcmVuY2UgdG8KPiB3a3VwX3I1ZnNzMF9j
b3JlMF9tZW1vcnlfcmVnaW9uPwo+IAo+IGszLWFtNjJwLXBoeWNvcmUtc29tLmR0c2kgaW5jbHVk
ZXMgazMtYW02MnAtdGktaXBjLWZpcm13YXJlLmR0c2ksCj4gd2hpY2gKPiBjb25maWd1cmVzIHdr
dXBfcjVmc3MwX2NvcmUwIGFzIGZvbGxvd3M6Cj4gCj4gJndrdXBfcjVmc3MwX2NvcmUwIHsKPiAJ
bWJveGVzID0gPCZtYWlsYm94MF9jbHVzdGVyMCAmbWJveF9yNV8wPjsKPiAJbWVtb3J5LXJlZ2lv
biA9IDwmd2t1cF9yNWZzczBfY29yZTBfZG1hX21lbW9yeV9yZWdpb24+LAo+IAkJCTwmd2t1cF9y
NWZzczBfY29yZTBfbWVtb3J5X3JlZ2lvbj47Cj4gCW1lbW9yeS1yZWdpb24tbmFtZXMgPSAiZG1h
IiwgImZpcm13YXJlIjsKPiAJc3RhdHVzID0gIm9rYXkiOwo+IH07Cj4gCj4gSG93ZXZlciwgdGhl
IHJlc2VydmVkX21lbW9yeSBub2RlIGluIGszLWFtNjJwLXBoeWNvcmUtc29tLmR0c2kKPiBkZWZp
bmVzCj4gd2t1cF9yNWZzczBfY29yZTBfaXBjX3JlZ2lvbiwgd2t1cF9yNWZzczBfY29yZTBfbHBt
X2ZzX3N0dWJfcmVnaW9uLAo+IHdrdXBfcjVmc3MwX2NvcmUwX2xwbV9tZXRhZGF0YV9yZWdpb24s
Cj4gd2t1cF9yNWZzczBfY29yZTBfbHBtX3Jlc3RfcmVnaW9uLAo+IGFuZCB3a3VwX3I1ZnNzMF9j
b3JlMF9kbV9yZWdpb24gaW5zdGVhZCBvZgo+IHdrdXBfcjVmc3MwX2NvcmUwX21lbW9yeV9yZWdp
b24sCj4gYW5kICZ3a3VwX3I1ZnNzMF9jb3JlMCdzIG1lbW9yeS1yZWdpb24gcHJvcGVydHkgaXMg
bm90IG92ZXJyaWRkZW4uCj4gCj4gU2hvdWxkIHJlc2VydmVkX21lbW9yeSBkZWZpbmUgd2t1cF9y
NWZzczBfY29yZTBfbWVtb3J5X3JlZ2lvbiB0bwo+IG1hdGNoCj4gazMtYW02MnAtdGktaXBjLWZp
cm13YXJlLmR0c2k/Cg==
