Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D390D33123D
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112117; cv=fail; b=mwNx/3N71u3oINEet6bxTWACEfBEb4BWa0rUe0tjLd8Z/gPZkG9jiOEjh1w1Kd2XlqBMxd8jKhoHbgeNcxWgSCg6HSgbNsfjEH6TgKKGZZmnX+QTI7zMwDqALIQFJzZhAtrp9PVg3M2TEYknjVbLYvzmvIjmgJ1uRK1P5w9XbWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112117; c=relaxed/simple;
	bh=MDGRtPqsH+YEHmsgLetL7loZCUljokQlY5N/ddYumV4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GFE0g0QM312LoJvIlF7lWlDUkWcv9yccXZ6MiwSQypW1V6i85siKuHV/jYg12Ew1f8NVgsI0yIFRRxosC0mg3VtlhO+xnJef9l584sySszMQRTfyvQi5fN319DPH2V0nsNzH4j54Pf2x6WGdT8RzRUyDmDb1Dqe0G8bK4kUJmnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=St7r7oJq; arc=fail smtp.client-ip=40.107.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="St7r7oJq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWVCoQg3yBWPhXlA4C9UK/7G1fmsT8odzIXdtawsVLBsaHH+qT2AqutY9a64p3pd1dIf1AQtDdAFUA5LiVlOXJas09dibbOaPaHpo/X1UtzTr2nT4O3AncorM8zTlfdwVuRkCuSujXq9WnKCpW+XhvMRW+gKX7zZoxo+/nZiDuJQtY01lwitT77pB0CdNeWt0BHI56Y5+ffoIUeUU2NlfiEWsnhFelnZwRBqc4uHB8QQDUJOFENP/za1uq9/flW7toBm4LMmwsGHwZQ9+0FVp2OlQA3yyYU1/B81bD3MwXRYUR6kCZLn51wrc4n62TpmcUkYP+FIj31m6KR9n5A3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDGRtPqsH+YEHmsgLetL7loZCUljokQlY5N/ddYumV4=;
 b=jC53E+beQMoF4xd8p3hPg02yo7H2cpdENxn5dK3PVWqZJ52TctPOnLEiLDbq62wUVw7rSVg4FEmtS1G+BXUWVtzs7VjauMyEk/NoPQKwv3JJJhNey3sHooOtCkbsTUG1ifffjegULKGrsr66U0vAAghhc70mh2QKIy13FpOsC2skLAwLv/UMoY6lelBygpYnDyMxDb2rG8ecu8fbzEFGelId/WtUgo9SVDNnW/VrHa2MaBWDMF/+YdrVX/H/zYa3KflNW6y3kqdkVMzVrMYu6qvTFr3OuK2Q/WbJPyaxozkc5fckMukfKKLIV+pEv81trKkNSMPZg2KoH+2uJGnbmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDGRtPqsH+YEHmsgLetL7loZCUljokQlY5N/ddYumV4=;
 b=St7r7oJqsWan2cHG7llX7f5yx6Vh2ewgF4BRdEah6fpAuMmOwLrRhkUgRUOsL6S2M7K9qPtR5oJRS12gpb+rjMrPTitKZmIeTYjz5zO9uyonIMIpflONZp1uXe7b2gfidUZrGwi0JnXBz6pZQkU6YPesRToyMbHUK2wmyr8tyuSSj+Vf2snn2WnQItZePyxOxFEIPXstHA5JiyGaKi4NjWGYjHijpBYuxfmmzrOZFYdoDa/M6INAGxkDqkrty5AgxWqcg19s7JCuz/n+85lw83Ob2wX8pFNNMmXdSyhhqVA1s3LMiZ/QVRADTRZgvaTWRVZ4NJLHQ6vaLY32BcGQZQ==
Received: from BY5PR11MB3990.namprd11.prod.outlook.com (2603:10b6:a03:18d::31)
 by SA3PR11MB9510.namprd11.prod.outlook.com (2603:10b6:806:47e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Fri, 7 Aug
 2026 14:15:08 +0000
Received: from BY5PR11MB3990.namprd11.prod.outlook.com
 ([fe80::2349:6631:bb47:77d3]) by BY5PR11MB3990.namprd11.prod.outlook.com
 ([fe80::2349:6631:bb47:77d3%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 14:15:08 +0000
From: <JensEmil.SchulzOstergaard@microchip.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next v11 2/9] dt-bindings: net: lan9645x: add LAN9645X
 switch bindings
Thread-Topic: [PATCH net-next v11 2/9] dt-bindings: net: lan9645x: add
 LAN9645X switch bindings
Thread-Index: AQHdJOfvKbp7kSGnM0CN7gyyATGlQLaRGLYAgAGLxAA=
Date: Fri, 7 Aug 2026 14:15:08 +0000
Message-ID: <44fcdb0ca68c9f7bc09737240412ff904ff74652.camel@microchip.com>
References:
 <20260805-dsa_lan9645x_switch_driver_base-v11-0-007ebc983a0a@microchip.com>
	 <20260805-dsa_lan9645x_switch_driver_base-v11-2-007ebc983a0a@microchip.com>
	 <20260806143836.F095A1F00A3A@smtp.kernel.org>
In-Reply-To: <20260806143836.F095A1F00A3A@smtp.kernel.org>
Accept-Language: en-DK, da-DK, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3990:EE_|SA3PR11MB9510:EE_
x-ms-office365-filtering-correlation-id: 730f5de0-4f45-4946-4579-08def48e491f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|11063799006|5023799004|4143699003|56012099006|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 rQJ1Dqr1vt7jBCxrXaKcPCAmUCuCoyGPIyiWhixSEb6khSc12Fc1LmUDkTB9Z+0Tru1LAASIDuyEPnw4kTStaa48jQkX7zwYDAk+fUAUBoX0f4hxU3ZeF1L0r71Jink/jvuo04a9czZIjUd+XwlhUFhsA5puwrQ5X9/hbOHg2xxPleTLqF5Iv93bLsGbRWNgmR2J+9lpjwWPYIXyR+QKhV6sketVdTHG+VxGLbQByEFoWWxp2GF1jgch1CNyYDw1dw43qOpwevq0syLUriv5Io8winIRJLouKuXJ3+bMo5l2eTvO5Bc7fJ4iN0UtmGmAwnVJWRtZn9hvdjoFuDgOGx9+QGoU3SLh310Lb8/ezTtNyq6Q3PRNeblmFy5y6yg0Ccqv9NCR4WFOZSvdiyTdV1i2Fe5aCoognghzaL953wQ0g+XOC1rM3j1oAoomE11ZMo4uAxiMvEgfcdbUdIXEfhBTMua7ueoFv6MtQ6io8T2rIndfcsZmEz1rW0h/RjZgW3l+xd67QlBKCuE+DQyJaT1hkSIhqby9jdVOwizSUuX7iJdkn61V2HUO/JCHOS1CIOPvLKJzummBNsL9fEfcsTyJ8gVtSqpVecV7kPATEgiuLq/7VdSgPIQb2o4moPhGWeyl2SWHBuPwe/wkaGXrVVinFrf/n3PCeMFWx5dgkos=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3990.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZmV0dkNXZDZMZFJndVRWbnhGQmZ6dlRZZ2pkUFFwTVlxaGtRTm1rM2YyVHhT?=
 =?utf-8?B?b1RvdEowbXlXMEhPdE1vdzB6VUlIa3o3dUt4dnNXaWE3TCtXOEpyd1JLK05X?=
 =?utf-8?B?SGUwQXZkQ2tvaytSTmMwa1h6Tkwwbmg3Q1FEWExlKzBqM01IK25HU1IrK2Nw?=
 =?utf-8?B?bllkYlBYK2g4TzBiNThNQi80NUxRWkRHbEFQL01aenRycHRDbWhFQktOQzlN?=
 =?utf-8?B?TDZPUWtVUzRIUXJ5NzFsTlRNOWJ6VFJhL2dnV0E1aU1jQnNET1BtRWJWNlN5?=
 =?utf-8?B?eEZud0xsMTAvY2hmSTRmNVJoN2wvWG1tRjJwLzNTZDdXWTdaS2trQjFIKzcv?=
 =?utf-8?B?NlhzUWlYSDQvcG9sanZ5MzRUTm1mVGJNREFkQXh3ZXlmOC9SUDcxbXI5QXN0?=
 =?utf-8?B?SEYwZlREYUNQODd0NTIyanM4c3IweUFDVWpiNGFqRCsvaVg4N1FVTDFxQU1K?=
 =?utf-8?B?ODV4L25mbjFONHpDOEZnUjF1Q1FZb1hxMjlMRG5NTDRKR0dnSjNtd2FJc3ZC?=
 =?utf-8?B?ZHg5S0krQk95WDh0N1ZlYzVQTjN2dkhKcVBoMmtEa0hKKzc4S2h5ck1zUlRR?=
 =?utf-8?B?YlVEYkVEbUsrVW9Pb085bjR6dWlEM1JuUEw3aENOM0EzVURZclZUTVdRUTFF?=
 =?utf-8?B?MjhZK1JXa2p6L0xwY25qTExOVXlVQjM1cVpuV1B1c3ZtUmtkSThaa2ZzdlZp?=
 =?utf-8?B?SmN5ODdXMGprTXJCL2N6R25yd3ZXSGV5ZDZ1Z3hPYW4wWTNFZk5QWVlzNXpW?=
 =?utf-8?B?akY3SXBNWGhkNVd3SlpObmdZVC8vOGR5VlA4d1BrUTlSeU5pS1c0aFV5K29v?=
 =?utf-8?B?K1lkT2RuUzRoM21WNWNJbGhrVXBDT25tNitNY3hoVHVLd0ZYWFp1VDhyZ204?=
 =?utf-8?B?WWxJRFM3RXJHUnZETVViZ2p2clp5R3JCTVZPcHpTUTEzVHdYblVpK0xYYXhT?=
 =?utf-8?B?M0t2VVEwRlhibldMR0dJTTdKTHRsRVhCZkxVaitWNDNnL3BETUc2R3Z4T3FF?=
 =?utf-8?B?cFpPbEVOOHllVVlvaHBaOUllQ1FTa0tlZk0vODZQd3A1dXJVWUUrcUhUTHV4?=
 =?utf-8?B?Q3lxV1EwUkhpM3ByRG5TSnIwMm5sWlFOVzdTc3NBUjVrUUpDNDZGczE4aXY5?=
 =?utf-8?B?QkJBZEhTUXZrQzFlSm5IZ1ZEeEJFUHZSdmZsWXF4QVlBYng5NlV6ZnFDWmw5?=
 =?utf-8?B?U29zQmljZENrYkp1UDgvWEk0Q1ZCNUhFeFB2L1dUY2xoUTB6empYUHExRmNy?=
 =?utf-8?B?eGl0ck1YYXU5MW9aNnpjZ2l3bU1DUlA0YVFDMjkyaEZxWDRZdWtiK2NXWkF0?=
 =?utf-8?B?TlhmSUpPZEhhNTdKOFdDdzk4NVJvbjhVQysyOGh0bWtKZFRZNmJEY0pzZWlY?=
 =?utf-8?B?SHBxbFFnMWJWM21TcUtyRXBkMDhPWmUyUmZXU2FNSys1UWMzYmZCYXgxRG0z?=
 =?utf-8?B?YkFaZnJISnFsMGpaNTVkS1FYZlczVkJFWE9rN0tXN0FiRVFBalFndm1lbmE5?=
 =?utf-8?B?UlV3WEJTQXFzbGZPbnFOMGVZc0VlRktNNDJCUFlxeXVtaUdlRTRPZUN2eTR1?=
 =?utf-8?B?dU4yNWpEZjlhL082VE1lTFg4V3BxSkRyMDdPcGhsd3Q1aytEc0pnRE1TNnIx?=
 =?utf-8?B?Z2lGQ0Z4S0kvTGNHeFNRV3lzOFhpZ3U1RUNVbFJsbVZRS0xTbU5taGpWMC9V?=
 =?utf-8?B?ZUN3SnlCS1RYSnJENllsUWdmN295b0hUb3FrNlY4ZjNrYnZjMUdtQUtERlhN?=
 =?utf-8?B?d3BoYzNFUEtkS3M2cndCQ3dUVVMvMk1aaDRhRVJUc2pNNnYwQS9NSFlqa3lT?=
 =?utf-8?B?VUY0RldNQStVT2JSZWsyODZzcGtMZFoycFRNdnJIaUtsL1JqUzdTRVFUSGY5?=
 =?utf-8?B?VEpRd09vYXF3eVpGSTYxS3RKU1BLR1hxUDJKU0daeERIcUk0VDlIMlgzeVZt?=
 =?utf-8?B?OTdPWEJhanlqU1J6Wkh1Z2grQ3dCd0U4SlRLSHdRL3phcDNCY210WkxkRXVT?=
 =?utf-8?B?Ny9XNTVaQkZEWk85Rk5OT203c1NDUit2WEZpNitWN1dHaUdDeFNDcFBYd2l0?=
 =?utf-8?B?eWs3T1NIS2FBaUpBYVFGSzdsUmUwdnh5NHhYTmdvdHVtQkJRbXhkT0tWT3Zu?=
 =?utf-8?B?YjNuTjVBMi9ManFYYkh1Z2puODc0OGFBekhlM1RDUTI1ZGJCcFFTZGhyUmwx?=
 =?utf-8?B?VFpFSWlnV1UrMzNxSFlEenBnR2t4dkh1a2VBdEo3K3B6aExaelVCWFk1aUlI?=
 =?utf-8?B?OUl4N0VTOGJVdVZIOTQrODhUN0pCZFlSalJJZUczdXpMZjg1dll4U0pIZ2Zq?=
 =?utf-8?B?VXVrSlRLK242M2F4bVN1VzhodHNKQmVBbkRPdEIvRk9VdVBrZFYzNHpYQ3d6?=
 =?utf-8?Q?t5txVhk18yGdVMj7dzbDBmGzj18gaSpsdpgAoHxQHFI+s?=
x-ms-exchange-antispam-messagedata-1: RH9cCEg5zAdFeQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B684CB42AE80A14F9619C4386BABE371@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730f5de0-4f45-4946-4579-08def48e491f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 14:15:08.2256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 31LnxQBxBGagutyMAt93a6TllcYvb5hP7aVlJoyCfseT+Gqb0gyOEAc4HMlNDJ1KPEzjVWZtqblBt78fsQ95ngC6nDFUKVbs2dLN3HVCfKGC7UujskNak0u0URiKKqo1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9510

T24gVGh1LCAyMDI2LTA4LTA2IGF0IDE0OjM4ICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IFRoYW5r
IHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDIgcG90
ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPiAtIFtNZWRpdW1dIFRoZSBzY2hlbWEgbGFj
a3MgYW4gYG1kaW9gIG5vZGUgZGVmaW5pdGlvbiB3aGlsZSBzZXR0aW5nIGB1bmV2YWx1YXRlZFBy
b3BlcnRpZXM6IGZhbHNlYCBhdCB0aGUgcm9vdCwgd2hpY2ggaW5hZHZlcnRlbnRseSBwcmV2ZW50
cyBpbnN0YW50aWF0aW9uIG9mIHRoZSBpbnRlZ3JhdGVkIFBIWXMgcmVmZXJlbmNlZCBpbiB0aGUg
ZXhhbXBsZS4NCj4gLSBbTWVkaXVtXSBJbnZhbGlkIGNvbnN0cmFpbnQgYW5kIHVzYWdlIG9mIFJH
TUlJIGludGVybmFsIGRlbGF5IHByb3BlcnRpZXMgaW4gY29tYmluYXRpb24gd2l0aCBgcGh5LW1v
ZGUgPSAicmdtaWkiYC4NCj4gLS0NCj4gDQo+IC0tLSBQYXRjaCBbMl06IFtQQVRDSCBuZXQtbmV4
dCB2MTEgMi85XSBkdC1iaW5kaW5nczogbmV0OiBsYW45NjQ1eDogYWRkIExBTjk2NDVYIHN3aXRj
aCBiaW5kaW5ncyAtLS0NCj4gY29tbWl0IDM2ZWIzMjU2YzFlOGJkZWIyODBkZTA0YTEwNTkwNTY1
MGU1MDQzOGYNCj4gQXV0aG9yOiBKZW5zIEVtaWwgU2NodWx6IMOYc3RlcmdhYXJkIDxqZW5zZW1p
bC5zY2h1bHpvc3RlcmdhYXJkQG1pY3JvY2hpcC5jb20+DQo+IA0KPiBkdC1iaW5kaW5nczogbmV0
OiBsYW45NjQ1eDogYWRkIExBTjk2NDVYIHN3aXRjaCBiaW5kaW5ncw0KPiANCj4gQWRkIGJpbmRp
bmdzIGZvciBMQU45NjQ1WCBzd2l0Y2guIFdlIHVzZSBhIGZhbGxiYWNrIGNvbXBhdGlibGUgZm9y
IHRoZQ0KPiBzbWFsbGVzdCBTS1UgbWljcm9jaGlwLGxhbjk2NDU1cy1zd2l0Y2guDQo+IA0KPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2RzYS9t
aWNyb2NoaXAsbGFuOTY0NTVzLXN3aXRjaC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9kc2EvbWljcm9jaGlwLGxhbjk2NDU1cy1zd2l0Y2gueWFtbA0KPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwMC4uMDQzZmI0ODkyMmI0
MQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbmV0L2RzYS9taWNyb2NoaXAsbGFuOTY0NTVzLXN3aXRjaC55YW1sDQo+ID4gQEAg
LTAsMCArMSwxMTEgQEANCj4gWyAuLi4gXQ0KPiA+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+ID4g
KyAgICAgICAgICByeC1pbnRlcm5hbC1kZWxheS1wczoNCj4gPiArICAgICAgICAgICAgY29uc3Q6
IDIwMDANCj4gPiArDQo+ID4gKyAgICAgICAgICB0eC1pbnRlcm5hbC1kZWxheS1wczoNCj4gPiAr
ICAgICAgICAgICAgY29uc3Q6IDIwMDANCj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBJcyBp
dCBpbnRlbmRlZCB0byByZXN0cmljdCB0aGUgcngtaW50ZXJuYWwtZGVsYXktcHMgYW5kIHR4LWlu
dGVybmFsLWRlbGF5LXBzDQo+IHByb3BlcnRpZXMgdG8gZXhhY3RseSAyMDAwPw0KDQpZZXMsIHRo
ZXNlIGFyZSB0aGUgb25seSBkZWxheSB2YWx1ZXMgc3VwcG9ydGVkIGJ5IHRoZSBtYWMuDQoNCj4g
DQo+IFsgLi4uIF0NCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAg
LSByZWcNCj4gPiArICAtIGV0aGVybmV0LXBvcnRzDQo+ID4gKw0KPiA+ICt1bmV2YWx1YXRlZFBy
b3BlcnRpZXM6IGZhbHNlDQo+IA0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4gU2luY2UgdGhlIHN3
aXRjaCBoYXMgaW50ZWdyYXRlZCBQSFlzLCB3aWxsIHVzZXJzIG5lZWQgdG8gZGVmaW5lIHRoZW0g
aW4gYW4NCj4gbWRpbyBub2RlIHRvIGNvcnJlY3RseSByZXNvbHZlIHRoZSBwaHktaGFuZGxlIHJl
ZmVyZW5jZXM/DQo+IA0KPiBJZiBzbywgd29uJ3QgdGhpcyB1bmV2YWx1YXRlZFByb3BlcnRpZXM6
IGZhbHNlIGF0IHRoZSByb290IGxldmVsIHJlamVjdCB0aGUNCj4gZGV2aWNlIHRyZWUsIGFzIHRo
ZSBtZGlvIG5vZGUgaXMgbm90IGRlZmluZWQgaW4gdGhlIHByb3BlcnRpZXMgYmxvY2sgb3INCj4g
aW5oZXJpdGVkIGZyb20gZHNhLnlhbWw/DQoNCk5vLCBhbnkgcGVyaXBoZXJhbHMgc3VjaCBhcyBN
RElPIGNvbnRyb2xsZXJzIGFyZSBtZWFudCB0byBiZSBjaGlsZCBub2RlcyBvZg0KYW4gTUZEIGRl
dmljZSwgYXMgc2libGluZ3Mgb2YgdGhpcyBzd2l0Y2ggbm9kZS4gVGhlIE1ESU8gYnVzIGRldmlj
ZXMgd2lsbA0Kbm90IGJlIHN1Ym5vZGVzIG9mIHRoaXMgc3dpdGNoIG5vZGUsIHNvIHRoZXkgYXJl
IG5vdCBtZWFudCB0byBiZSBhY2NvbW9kYXRlZA0KYnkgdGhpcyBzY2hlbWEuDQoNCj4gDQo+IFsg
Li4uIF0NCj4gPiArICAgICAgICAgICAgZXRoZXJuZXQtcG9ydEA3IHsNCj4gPiArICAgICAgICAg
ICAgICAgIHJlZyA9IDw3PjsNCj4gPiArICAgICAgICAgICAgICAgIHBoeS1tb2RlID0gInJnbWlp
IjsNCj4gPiArICAgICAgICAgICAgICAgIGV0aGVybmV0ID0gPCZjcHVfaG9zdF9wb3J0PjsNCj4g
PiArICAgICAgICAgICAgICAgIHJ4LWludGVybmFsLWRlbGF5LXBzID0gPDIwMDA+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAgdHgtaW50ZXJuYWwtZGVsYXktcHMgPSA8MjAwMD47DQo+IA0KPiBbU2V2
ZXJpdHk6IE1lZGl1bV0NCj4gQ2FuIHRoaXMgY29tYmluYXRpb24gb2YgcGh5LW1vZGUgPSAicmdt
aWkiIGFuZCBhIDIwMDBwcyBpbnRlcm5hbCBkZWxheSBiZSB1c2VkDQo+IGhlcmU/DQo+IA0KPiBB
Y2NvcmRpbmcgdG8gdGhlIGV0aGVybmV0IGNvbnRyb2xsZXIgYmluZGluZ3MsIHBoeS1tb2RlID0g
InJnbWlpIiBpbXBsaWVzDQo+IHRoZSBkZWxheSBpcyBpbXBsZW1lbnRlZCBvbiB0aGUgUENCLiBB
ZGRpbmcgYSAyMDAwcHMgaW50ZXJuYWwgTUFDIGRlbGF5IG9uDQo+IHRvcCBvZiB0aGlzIG1pZ2h0
IHJlc3VsdCBpbiBhIGRvdWJsZSBkZWxheS4NCj4gDQo+IElmIHRoZSBoYXJkd2FyZSBoYXMgZml4
ZWQgaW50ZXJuYWwgZGVsYXlzLCBzaG91bGQgdGhpcyB1c2UNCj4gcGh5LW1vZGUgPSAicmdtaWkt
aWQiIGluc3RlYWQ/DQoNCk5vLCB0aGUgaW50ZW50aW9uIGhlcmUgaXMgdG8gZGVzY3JpYmUgdGhl
IHNpdHVhdGlvbiB3aGVyZSB0aGUgQ1BVIHBvcnQgYW5kIHRoZQ0KY29uZHVpdCBhcmUgY29ubmVj
dGVkIG1hYy10by1tYWMuIERvY3VtZW50YXRpb24vbmV0d29ya2luZy9waHkucnN0Og0KDQoNCiog
UEhZX0lOVEVSRkFDRV9NT0RFX1JHTUlJOiB0aGUgUEhZIGlzIG5vdCByZXNwb25zaWJsZSBmb3Ig
aW5zZXJ0aW5nIGFueQ0KICBpbnRlcm5hbCBkZWxheSBieSBpdHNlbGYsIGl0IGFzc3VtZXMgdGhh
dCBlaXRoZXIgdGhlIEV0aGVybmV0IE1BQyAoaWYgY2FwYWJsZSkNCiAgb3IgdGhlIFBDQiB0cmFj
ZXMgaW5zZXJ0IHRoZSBjb3JyZWN0IDEuNS0ybnMgZGVsYXkNCg0KUkdNSUlfSUQgbWVhbnMgdGhl
IFBIWSBzaG91bGQgaW5zZXJ0IGRlbGF5cyBvbiBib3RoIHJ4IGFuZCB0eCwgd2hpY2ggd291bGQg
YmUNCmluY29ycmVjdCBoZXJlLg0KDQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MDUtZHNhX2xhbjk2NDV4X3N3aXRj
aF9kcml2ZXJfYmFzZS12MTEtMC0wMDdlYmM5ODNhMGFAbWljcm9jaGlwLmNvbT9wYXJ0PTINCg0K
