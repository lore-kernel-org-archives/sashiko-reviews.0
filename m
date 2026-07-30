Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010012.outbound.protection.outlook.com [52.101.84.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4B03DDB04;
	Thu, 30 Jul 2026 10:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408919; cv=fail; b=ryVgUoCtAQIutQQvUmX2Rqx2TtUlk4UvTXS9WR5a2dn0ZBNeWoCdmBtRlMN4jCZo6x1NPVJBrymPcMSsHsy1maxXkbrf53Ji1QztgVz5wPtU/g0wmxTkhirSloG0r0pHfqG4qKe2DscfLpRa5gkeN8BwI5h03bqJ50vJrIRQaFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408919; c=relaxed/simple;
	bh=AeH4MjsTKNMnNbZzeKW2xafgPWVQhiuYrp1gZSts6nU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B3S+vjX6KqMQxJLckWhuJrCCFMmelqJw3uSi3oN43aZo3MnRrLf6zj6XX43h7UEZpJYwSuQF3MIL2QFwAwxRL0W3p/Ien744bABHu5XH2lfEELAW6g2BfAqychyF9iWOU5U/Lw5/CQJ02kpN1/ci6BL4ldzVUSf+Jp2BwBuGiWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qUgaE/NI; arc=fail smtp.client-ip=52.101.84.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qUgaE/NI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMp6tQY57WRz0Y1m8DBzT2ew3WAIaKBAnlXJXL9qDxAHnGG6yLEXQXqtTPKkXe61m60EuoV0s5pZXEaMMbPUXbc8Oy7b58sB9ejMU/w2TYGvtrOcxI0ZomiThXDNmliENLcMK70bqjsM9/LCNJk0kF12KYrLIFNC6bRJFRNlR+Oz/kaJ82ufp112reoxrz0nxlhWZ3qjn2uUt2uwfu21TZ+01cyQJY8mYCxV3KN+yAp8vXdPIr4dxYohVJTZ/6db7mffcZ1ooq8VvX2+gHJ0xVoHVn8i7R5xeUNPy85RU7arS/fCJH/65KlCLdtMBCCa41brW1rClqfmrC69NXP7uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeH4MjsTKNMnNbZzeKW2xafgPWVQhiuYrp1gZSts6nU=;
 b=DvAlYDh6vRqL6WKdG3rYeoWVNA2xtrlcrfBiagy5SXFEru5cfKJwQqY095E3cOu4uw7YIgHkTXxiQoQVgznapPrbP9DpBzD2OJ4bgWJ+XNNv0dkYvz5vU7o1ZcOcwfL00nE/EtiXiPrVY7RVWbj20TUe7FwPDE87ZzzJLX8srcgBNWTw+wrD2on2g+71CW0x0yQpki2pYMGnCPb8xmixGqAMtObwPdGsakjccfYgreg4cGeFBvQ4H5AXoq18k9Xq9xc2Ln0Yyai9hTWlt9UI0KMGwTY346fmXpxr8J8mNBiY4VA9Iywn69k7FiI7IylJ9aBcdg5uXDFtLXW4jG2Fdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeH4MjsTKNMnNbZzeKW2xafgPWVQhiuYrp1gZSts6nU=;
 b=qUgaE/NIiSfjsNDBO6wYzpuq0BNIzs2DvuhqjrwyVHNe8UR55qIJ8pM56WXqNpBuFmpW1R36DV2XUT26DxlkdK84pc+NXdNrdZcJhl/6iYeOYAX55tnrVzarBzpkoXs6R3s1zr5YannPJMhApVYyAy59EQO5OJc+r1bAi063ViGLX8W31UpkNzF5//A6TTTMtd3n5I3bY6O34o0bzfhaM7kPnVUEqV8Loqg4WiUBsnLPoHBLLTwPFhRf8CtFu7n+W7Nm8j70UB5T4EchuQMmZzxz5J7bfodQdGED++4mZ1xgBKcpx97AXGITvT5jBmQyeOSkU9u82WuZ9PG9NF4qoA==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by GV1PR04MB10774.eurprd04.prod.outlook.com (2603:10a6:150:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 10:55:13 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 10:55:13 +0000
From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v32 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Thread-Topic: [PATCH v32 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Thread-Index: AQHdH8lgNKR5cc+kXkyGYYCw7vvwwLaFVJWAgACM9/A=
Date: Thu, 30 Jul 2026 10:55:13 +0000
Message-ID:
 <GV2PR04MB1227197DA7F11D88433507C7895C92@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
 <20260730-imx-se-if-v32-1-95f56dff4ba9@nxp.com>
 <20260730022107.A0CEC1F000E9@smtp.kernel.org>
In-Reply-To: <20260730022107.A0CEC1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|GV1PR04MB10774:EE_
x-ms-office365-filtering-correlation-id: af830663-cf44-4de4-f50b-08deee29087e
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|366016|23010399003|1800799024|38070700021|6133799003|56012099006|4143699003|5023799004|11063799006|10067099003|3023799007|18002099003|22082099003;
x-microsoft-antispam-message-info:
 icye+gK8h2TLnZXiRhC2EkGydhB1Trt14XX4N2/OMeQrFD5rrYQ9/PFwO2ZvwstR0UcyA6mBCtBQlFn3OY7x4MpggeQ4umcuPpaiWCYIO/SfseQJOBtA+NVyXnitMcNN+ZE1jAejh9sSTU0ik4Yt+BPLg0yQkvRZ/9tz2O7hFH9OfAg2fG7qJQTUAjipweQB6Pq33YyFeSf9fNbqI6t2NuLOfoPhuLyyCvWepYzDt/3tOkpp1Bj9p3UtWkqkQO8YDMn7WUCdkDM0N13qQxlvhrOzPKY99AoRhpjWUcZaFoTSdEWu9OlVUFfQQyv1Zg2KIh6ruGlYgM8Nlw+O7KPYBFllKqRp0f2qMuWgyvwRKOiy27/3iTWXjkF+Rusv/Q9R2jmduA1454hEqzXVWxBYUU8/RyErTJaJPTx7xd4zbYoSWItNFJiKt9yp1HJj3oaUGYcZOqqjO21frpWllxbgnWWpTfwnlCP/at0UL+HvheGzusI2xMLok+2YDAP10zjSelZAl99Y+pVtjGVf17ktm5teJ9BbIiJ8kKHU78A6bj8Pg86J3eR1Bi6TTIE9nGEHWboONNSisEt1LkYi2TE0x7T6oJiP1OIVKQJyOCQyJ6L7FG/UxNVc8pHhMGB6u7H55A9MCy0KHQocnYW2aHliqHBy/oSh6HTypkyIWT2BiCTSHeHoR+uTHA0vc2yk7E5lYLPLXY1SRvv58iZAfUOnrby2Fzgi27CbFSvse0764gg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(23010399003)(1800799024)(38070700021)(6133799003)(56012099006)(4143699003)(5023799004)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NUd0VWxDNyttZ2QrblpUWmEwUUJCWnR0NVA2Z2R2QTBwT0VUakUwQUwvUTY3?=
 =?utf-8?B?MGFGVGxRcGZuYms5bU10dnFQbnV4N20vNyswVGVYSWE4YmRVdCtBL3dkS05l?=
 =?utf-8?B?ZEZYTjExL0QwN2JCSnNjV2swUGhxVFErZ3dNR0F4aVEyc0t2MnFlVmw0ckRH?=
 =?utf-8?B?cldJYm5xVnpoTXVpbGR0YWJSNlM0VEJOYjNSMzExTXVjT1JEU1Z5alE3UjhO?=
 =?utf-8?B?SXJMN1NIRnQxMUp5bGlOajFURkE2ZVFVNXh1WGk1a2NjQ3dFb0tMWm52ZWZj?=
 =?utf-8?B?UE40YTVWMU5Geng4R015eHBNN3FVL0V4OVN4ZHV2b3B5RlVDRytuM2ZPVGZh?=
 =?utf-8?B?NGlCLzQ1Z3dwWkc2bWNRUlFZMEpXQ0kyMFRqNXhuVnBnZHRaNHg2RHNwcTB3?=
 =?utf-8?B?Tnh4dWJ5MVVvMDBMZTQyZk5MMEpUZWhET0taMUhTNWJPRHBtbnIvMGczZlV0?=
 =?utf-8?B?L3lKM255VGgzaTk0OCtxV2YyWHdIMWh2L3E4eXc2S3U1R0lWdTBpd2VqMFNQ?=
 =?utf-8?B?L0pYYVNrSmgyQnhUUXo4dHZXZVpzaVJVZ0J4K1g4MlVRNTN2b1JKSFY3SXhO?=
 =?utf-8?B?ejZOeGlSeTI3cGZhbmpOTDZsbjdjdnVNM1ovMThpVHM4K3FwbXhRN2Npb1dF?=
 =?utf-8?B?d2xPU1JmWGRKUW5QRW5oU1NuWkNrVWZieHNzcGM4MjhTdC9CZm55RG9yc2xT?=
 =?utf-8?B?M1Y1QkpUNEtBNGxNNjFGbmo5WExncDFwWmV0SUlMMGpsNTdqeXgyK09XZS9C?=
 =?utf-8?B?MFdZSktxUGw2ODNHUlhvTWFyRWlSM04rVlNLb28zNGVRbjBjazQ0dnZqb2lV?=
 =?utf-8?B?bjZxbG1XVkhCYUgzSXBxRW5JendQMUwrem9vQWdCRFUvdUlHajhPc3A1d3o5?=
 =?utf-8?B?QzZzcm1kOUE4a0FkYzVWOWoyZ2g0YWpyTTZ0ZWFzcTI0OFFTZDYzaXJwUlEx?=
 =?utf-8?B?YjJ5VEYyL1M1eHV2N29TMlRiRCtaRXBTckVVTXJQbWg0b3ROOXhlcGsrM3VC?=
 =?utf-8?B?cm1LMmo4alBwQ2Nvdm1MYnk4WFh4cWMyTCttLzh0MmlIdWxMekRzb0FsQWh4?=
 =?utf-8?B?cjQ0QitqdkpoYlpuNnp4TXh2Rm5lOSt5bE50STFDd255WXhMZkVON0h5ekU1?=
 =?utf-8?B?ektjNjEvdmhWSGIySHpzMitnZ3BoM2FYSkpha0lxeWNENUI4YzViMnF6MlFU?=
 =?utf-8?B?K2xKQ2RjdHZWc2NwR2hkcHQyMDNEVFJaempQaVZiblBwWG9yb3ZscmhtY1dW?=
 =?utf-8?B?T3Bob2Y4dUpEb082S2JvQW5KUXk1aVg5bkVSYXU3RHJGcVo4V3phTnloSUdJ?=
 =?utf-8?B?RGNzQS9pc1l0dDNuOXlIMS9YRU9BUWh4L25qVXg1RG44Ly9hRGkrQzJkSzR0?=
 =?utf-8?B?aWhLYmpzMlFmVktLODV6b0dTVjNxQmVWd1JiQnBBcTJJdkdZQnhPQWczVUNX?=
 =?utf-8?B?cVQ4ck1LbTlQUzEwZUg5Yy9pa29PUVZQNjl0bFJnOGlxWlNFQVVuNkNOMm4y?=
 =?utf-8?B?eHNCaFVKVE9OajhYVnphRUgzYmdnOGpTS3A5c0xDSUllT04xTXg3U2RTcm5F?=
 =?utf-8?B?ZG5FZytqbnZEcDB4TTlVVG90Yko3QTF4eENuZHB5ZXpwTXpIZi9ucUF4TlND?=
 =?utf-8?B?OWJZMGtTTExDMnY1d1daalErd3RWTURQZzBiM3pUcDBERDlBV2dza2dVaVdK?=
 =?utf-8?B?MHU5aW9sR3ViTm5OQkp2NTdxUHVFVC9oZ3NKRGZyT20rV2pvbVhwa2RGbVZQ?=
 =?utf-8?B?TlBLSXB2Rkd0Y3VIS0gzTnNSeHVvVlBYSjNkNDZ2Y0d4LzBOOFM0WjI4NFRQ?=
 =?utf-8?B?Vzh2RXZydlluKzl0N3hzWUh3T1IwTG9nTjB2T2t1WEFSMzNvNmZ0QWJJZytF?=
 =?utf-8?B?NjBOcXkyYVBMVlJZaUlvYkxuVVdLSUNDR0FsYkM4SG9BNGZ4Z3ppMm1iZ2pa?=
 =?utf-8?B?cnI3VVgvVUdqN3E4TjVjcGRBNW5lSGM4T3l1Wjd6ZzhEYVM4c2hhdmtrN2Nu?=
 =?utf-8?B?RndSNFB5byt3Mkc3SnR1QWtORXozc0YwTG1tb1JFdlhpamhhbHhoL3JoYjdy?=
 =?utf-8?B?S3kwa0w4M2R0dHlEMVZIOStNZGVXanBPRHZvL0lxeHVoVHdZeElma1AwNlFl?=
 =?utf-8?B?SEtFVmx2Vm14RSsySjFla3FiQkpPTzBQbUpYU0M4aHJ3WXdVYjYzTkh0V2hw?=
 =?utf-8?B?QjJYNThNUGJPaTIzOXVxVllXNWwycm1UdU1oQXZsSFdYZE9RQkEzVE1ieEdH?=
 =?utf-8?B?T2Q1WFZtUVNhUnhMclJ2ZUZ1YXo1SXI3ejJXZnd3L2Y5QVd1ck9uUlorVzJ4?=
 =?utf-8?Q?SzK3jbJmciAC5xUnHO?=
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
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af830663-cf44-4de4-f50b-08deee29087e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 10:55:13.6443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: djaOKj3vtOabAxne0+vWliQWH0TDK8niaEZvA/gLKe8S+u47RYIp/iFTQgIfLzi2pVDa2doNOntigA+uP7qV7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10774

PiBEb2N1bWVudGF0aW9uL2Zpcm13YXJlOiBhZGQgaW14L3NlIHRvIG90aGVyX2ludGVyZmFjZXMN
Cj4gDQo+IFRoaXMgY29tbWl0IGRvY3VtZW50cyB0aGUgaS5NWCBTb0MgU2VydmljZSBsYXllciBh
bmQgY2hhcmFjdGVyIGRldmljZSBkcml2ZXINCj4gZm9yIGhhcmR3YXJlIElQcyBsaWtlIHRoZSBO
WFAgRWRnZUxvY2sgRW5jbGF2ZS4gSXQgZGV0YWlscyB0aGUgY29tbXVuaWNhdGlvbg0KPiBpbnRl
cmZhY2VzLCBtZXNzYWdlIHNlcmlhbGl6YXRpb24sIGFuZCBjaGFyYWN0ZXIgZGV2aWNlIGNvbnRl
eHRzIHVzZWQgdG8NCj4gaW50ZXJhY3Qgd2l0aCB0aGUgc2VjdXJlIGVuY2xhdmVzLg0KPiANCj4g
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2Zpcm13YXJlL290aGVyX2lu
dGVyZmFjZXMucnN0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZmlybXdhcmUvb3Ro
ZXJfaW50ZXJmYWNlcy5yc3QNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZmly
bXdhcmUvb3RoZXJfaW50ZXJmYWNlcy5yc3QNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZl
ci1hcGkvZmlybXdhcmUvb3RoZXJfaW50ZXJmYWNlcy5yc3QNCj4gWyAuLi4gXQ0KPiA+IEBAIC00
OSwzICs0OSwxMzYgQEAgb2YgdGhlIHJlcXVlc3RzIG9uIHRvIGEgc2VjdXJlIG1vbml0b3IgKEVM
MykuDQo+IFsgLi4uIF0NCj4gPiArV2hlbiBhIHVzZXIgc2VuZHMgYSBjb21tYW5kIHRvIHRoZSBm
aXJtd2FyZSwgaXQgcmVnaXN0ZXJzIGl0cw0KPiA+ICtkZXZpY2VfY3R4IGFzIHdhaXRlciBvZiBh
IHJlc3BvbnNlIGZyb20gZmlybXdhcmUuDQo+ID4gKw0KPiA+ICtFbmNsYXZlJ3MgRmlybXdhcmUg
b3ducyB0aGUgc3RvcmFnZSBtYW5hZ2VtZW50IG92ZXIgYSBMaW51eCBmaWxlc3lzdGVtLg0KPiA+
ICtGb3IgdGhpcyBjX2RldiBwcm92aXNpb25zIGEgZGVkaWNhdGVkIHNsYXZlIGRldmljZSBjYWxs
ZWQgInJlY2VpdmVyIi4NCj4gPiArDQo+ID4gKy4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2Zpcm13
YXJlL2lteC9zZV9jdHJsLmMNCj4gPiArICAgOmV4cG9ydDoNCj4gDQo+IFtTZXZlcml0eTogTG93
XQ0KPiBEb2VzIGRyaXZlcnMvZmlybXdhcmUvaW14L3NlX2N0cmwuYyBleGlzdCBpbiB0aGUgdHJl
ZSBhdCB0aGlzIGNvbW1pdD8NCj4gDQpXaGlsZSBjb25maXJtaW5nIHRoaXMgSXQgaXMgYWxzbyB0
byBiZSBub3RlZCB0aGF0IHNlX2N0cmwuYyBjdXJyZW50bHkgZXhwb3NlcyBubw0KRVhQT1JUX1NZ
TUJPTCooKSBzeW1ib2xzIGFuZCBubyAvKioga2VybmVsLWRvYyBjb21tZW50IGJsb2NrcyBhcyBw
YXJ0IG9mDQp0aGlzIHBhdGNoLXNldCwgc28gZXZlbiBvbmNlIHRoZSBmaWxlIGlzIHByZXNlbnQg
dGhlIGA6ZXhwb3J0OmAgZGlyZWN0aXZlIHdvdWxkIHB1bGwgaW4NCm5vdGhpbmcgYW5kIFNwaGlu
eCB3b3VsZCByZXBvcnQgIm5vIHN0cnVjdHVyZWQgY29tbWVudHMgZm91bmQiLg0KUmVxdWVzdCB5
b3UgdG8gaWdub3JlIHRoaXMgZmluZGluZyB0aWxsIEVYUE9SVF9TWU1CT0wgaXMgYWRkZWQgaW4g
ZnV0dXJlIGNvbW1pdHMuDQoNCj4gSXQgbG9va3MgbGlrZSB0aGlzIGtlcm5lbC1kb2MgZGlyZWN0
aXZlIHJlZmVyZW5jZXMgYSBmaWxlIHRoYXQgaXMgbm90IHByZXNlbnQsIHdoaWNoDQo+IG1pZ2h0
IGNhdXNlIGRvY3VtZW50YXRpb24gYnVpbGQgdGFyZ2V0cyB0byBmYWlsIG9yIGVtaXQgd2Fybmlu
Z3MgYmVjYXVzZQ0KPiBTcGhpbnggY2Fubm90IGxvY2F0ZSBpdC4NCj4gDQo=
