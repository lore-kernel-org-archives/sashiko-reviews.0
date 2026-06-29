Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A625C36212F;
	Mon, 29 Jun 2026 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727855; cv=fail; b=ZYW7BIgvymw+OOPa1Qa9DqGvnOgZP3SCQWSmKfEkljX1T5l0ArQBIWFxnoRecOijejXqFb9vkSckZqYtl7DcdQfFxHtGr5IFhy64AoN55ZaZzXe/Bq+Uu7A/lEh1KeG/N6bW9e3q8zlyk8DWzKF85jAHaNCaGOQtohObD0fWcaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727855; c=relaxed/simple;
	bh=8Vdw434bPWtUcWD/k4ThtKixPu0UoKImM3R2ADCyt6w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O2mcu91g2r+UBawq68k0s1qZEKYkYjdpjpk4fuCy/jaREP4DPza+RMuGtIrypAgClIYS6ZrtF7PjLFjT1O4ECYaVAENXEKHkUo2Uvrn/jIadmbCm/sHGSFopSQXb97ORL4EMkUZX7tFb1Xb2rOm5X346EJuwJ54p6ci4VzIbJNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BOLrwsHS; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BOLrwsHS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFSF4aOWZdrJEKxvXBpifz0HyiJ3L8VqGKsngl0b1TkNkPZl0J2QFvFAX1HTi9wwq0/a6kupdlqgToTNAD1hqEleJkU1a9w/BX5TvfdMVDGmdt6VQtZFv0uPDGcWrgLPIXGG2QcdeC2HqsAaotdiA1YTETEQSunkmGRu2/lbSA0y+BemHPzRHGdl0qRTpP5i/tNt3mu47r4W59+SV+RuTe6Hhpx2XoiIuIKXAC+DcyVo9maHnWkhBEJ/gcnHljaD0v+IhweTGF2Qs3QwNUHWe+YYQRVTQMFJjKdRbKiX0vivcy2ByyhUotS68ImysZ+mGFPtFRcGxRTkBik1KaLomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Vdw434bPWtUcWD/k4ThtKixPu0UoKImM3R2ADCyt6w=;
 b=mw1e08IyFWU6BohGOwmQRMZJ3uS8+5dxwigo5aTftTc/nq4DM29Wk5qCaYhUp34gQ6C48GwU86lcZ6yLhwCeLJxW2RnQOCYBj0yYNsAhApObe1Bu+IWb8kH4ClUV5lowgWVmwm8fQmoTZKCGcK3D9YBhPY5y4YEarpIdOT33I2cghhPKYx8u6zrjUBa0X0Q+MmhBv18C8mzkvV9VXQIkEn4Y43HS7FzHe6P8O6HHeqFZ+vkNu5k27CbWG1UURsPKLwoPdlmk1KnNMtWc+oL6i5WtQV+lfRxGmct9ccArW5yfG4r3jmEO8rUy9sNLoA1i7K3y1I0x9riSVedT97aH2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Vdw434bPWtUcWD/k4ThtKixPu0UoKImM3R2ADCyt6w=;
 b=BOLrwsHSxFEp9v8Kf91KP2qpo4YBU3MZfgQKMRD6Oqk3WK3Iy2pVeKj4jZNdOx/agtxeKp1UqATGIV8B3ZDMp96HzjS4RluJKuIKzpIGWmbmmEHoSjj6Sm3KKTh7NyMUrOOc+6fcKUqv4TQFNExS3AHllIdaApLyu3PAWJa9gIQkOi/bOcz6je+3YB4zT5ExTDzcZkv0oXQlrz5guHoGodQrde9z3L3rvpxB6ogsU9U4M77HKpZjF5T+FItXCvT7DN+bj/u2+WHMNHGpRMoYJDjnlMSl2zvINn0n47RN7LRO8FLMRBxMVRY6lRIq699reeh0eRxS919RJ/SxuTALyA==
Received: from AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21)
 by GVXPR04MB10356.eurprd04.prod.outlook.com (2603:10a6:150:1e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 10:10:45 +0000
Received: from AM7PR04MB6870.eurprd04.prod.outlook.com
 ([fe80::f080:2b31:578e:716f]) by AM7PR04MB6870.eurprd04.prod.outlook.com
 ([fe80::f080:2b31:578e:716f%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 10:10:45 +0000
From: "Luke Wang (OSS)" <ziniu.wang_1@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, "Luke
 Wang (OSS)" <ziniu.wang_1@oss.nxp.com>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH v3 7/7] mmc: sdhci-esdhc-imx: fix resume error handling
Thread-Topic: [PATCH v3 7/7] mmc: sdhci-esdhc-imx: fix resume error handling
Thread-Index: AQHdB6+Mkg8umpK7R0WWCAHRPYzRLg==
Date: Mon, 29 Jun 2026 10:10:45 +0000
Message-ID:
 <AM7PR04MB68701F6FA7C2FD1D950261FEEDE82@AM7PR04MB6870.eurprd04.prod.outlook.com>
References: <20260629091954.3227151-1-ziniu.wang_1@oss.nxp.com>
 <20260629091954.3227151-8-ziniu.wang_1@oss.nxp.com>
 <20260629095403.0A7951F000E9@smtp.kernel.org>
In-Reply-To: <20260629095403.0A7951F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB6870:EE_|GVXPR04MB10356:EE_
x-ms-office365-filtering-correlation-id: 3d9f8770-6016-4fa2-2915-08ded5c6af7b
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|6133799003|38070700021|4143699003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 c7VrneATPHRBQnRyPlYd8BHstMrEt8xs61y+zb0kBAuloWHq3JF2wRN4UYBR2wmvdJN3kD5kCloyJULqnp0d+JiWmjWd9C5+FwUP9YjEIdgi6nSDSfT0ky0Md6oqu8hOzP862aWYCpWHbmen0kPhzHLG8/I4j7zNBBViWV9v+Zdu9Lz0h9D2Eas9UxXh7143RsBcRbXFUrdPlbihHo8D+5KxThBlLBJ+6ujHNNbSQ8eEuf2hZfHUHYDvg003ui/d7NdfMHxfwbZtEWYDAM8ddpfyLv5EVXmFJOTznl0BcPRIeXw/jPOxfr60FlYvuIrNpFJ3r39ruWwmsrVIO/ai5+DIDvuMx4e602F2LurSzD9xD9/xiiHchG+y+5kVuOyFUkc955z7whA7RY+a75EK5sqrHaRqRltOaUCJUDbMfV3ELEQY6aCIfrNcdIRfAqufe+70W0yckHM9SYaSnAwy0LU9wSZwhw1WDmJiTMm/3ULSK4J6mLr/gxbuhTI9OO9lk7naJ4GKK87eoGBn1+kovHHv86p3xISrj/MP30HV+AOL1C0Yn6oxi7UfWcYl68T3CVMV/FDGOFsj05LkPGxsGdk7Tyse37hJbg4nXqQB0tcH7b4BFQPycqYTuzbSGvW+bZxjSsGSsiresP3jOEiC595rj+nWhngY0jqZCKUXTLI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB6870.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(6133799003)(38070700021)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OTMvblY0TkNpU1NuUmdHZVFpa0tldCt2R0F1bGE3cE1aVzMxaC90TE5zVHk5?=
 =?utf-8?B?UzhjU1lIcXJIMXNCMkw4aFV5ZGlmR3BvbUl3Mjg0dHFJS0N6TlZzcWEwblNi?=
 =?utf-8?B?L1o3cTJ6Q1RrMVI1K2ttT0kxVStGamtKbE05ZzVoVW82aVBkQXJMcEMxS3pn?=
 =?utf-8?B?MVRHSnJLazNzNkVvWndZT0RHSHZ2SUxwRW03OTNaSzMveTl1WlZNV0VxZnBG?=
 =?utf-8?B?TTMvTERzQll0NHZ3aDJqWDBCRGhDUXRxcXpLR29SS3d6RmFzeDlWeUtsVWVW?=
 =?utf-8?B?ZWk1MmF6ZjZ4d2pGdFllcTBCSmJkck1rMmI1cnErT0NxcGU3VmJ3ZlBVK1kr?=
 =?utf-8?B?bHZkOExzaGVYaGV3UDdEMTRvTVA0cEpEYy8zSEdURDVheXIwZ3dUL3dHY1l5?=
 =?utf-8?B?NE1uODErWWwyZ1gvRzBXRXhIN1JmMzdHMUUrRXNZclRCS0JEbHgwYzJoVXc4?=
 =?utf-8?B?Y1ZyMXpzc010M3EyMnhzOS9UbDZSMDF6UXROUEREWGJ6Nm5MNERSZEtjVTBv?=
 =?utf-8?B?ak8zckU3NlVHSlRCTVl6T1doK3hSU0k2bEJBaEt0bXBtelZpK1FmaCtzNFB1?=
 =?utf-8?B?bFFpZ3FiMmU5ZjJBeGgxbFBrUllsWUlWc1N0Y0l0M0RjTkh6K05kRkJleVhS?=
 =?utf-8?B?OUtsSERZOVN6YWIyK0RqaENMekQ0WlhTb0dXc21qT2lUOHJINUpTYVlGbHNN?=
 =?utf-8?B?aFNWRklNZkRwSExoMmdiZWNGSFRCNlY0UW5XUmlmOEZQaEc5Ylk1eUhsRkdM?=
 =?utf-8?B?aFBxaUJhRkxKSEs3amVMS3JwM1Q0RkQ0MUtGZFRvQW1rbkE3aWFMZWZWMUZy?=
 =?utf-8?B?LzJzamJsZVQ3RzdidWNZZ2k4UjR0NEwrZWZUd21yVFl0UVVwVVFHNDNtMWFH?=
 =?utf-8?B?eWZVZGkrWTQrN2NpbkYvMDFObEVCODlqT2tFYmNpQ25td3J4SDJHSEFvbzdu?=
 =?utf-8?B?R09INzRhSHplNXFTa3NQMW90emNlWWorMTJnK1ZGdlJsRHhnZkdiUWNjakNK?=
 =?utf-8?B?Ky9pRGRXWUh3eHBDZ0Yyb2VCVHQxWTlMYmxBS3NzdS9QODdLSEh2S3dFVkEx?=
 =?utf-8?B?TFRoMFF3YmRsdXpPL2xMaUx4UTBKZEJGQ1pkcE1zUk01ZER5VEhFL0RYQnRM?=
 =?utf-8?B?dXkwa2NEV1Y5UldOT3hIb2lNdWlDYWRLZkJWcitSMXBWWWozdTBLdTZ2UXBH?=
 =?utf-8?B?elNiYWREVk4xakFPWEJxWkxFU1VuUDM5b3pTTC9wcjdwUUFEWHE0blNyK3BN?=
 =?utf-8?B?a1BoOTU1cFRLeGZhQWZTbjI0cEtFZFRKeGc4ZTFqc2hRVktPcEVLZ1k2bHNq?=
 =?utf-8?B?MHdheVRKQlBtRTBSYW9heFBiVlhGYjc0Z0c1WTVkb2tYY3kyOG9XSE1NZmtU?=
 =?utf-8?B?ZDBOM3pSRHk4Y3NLWWx2ODBRQTlNZ3c1Rk10RjcxbS9ML3pOQWo3azJoOHNB?=
 =?utf-8?B?eGRXclowS0FNdWRVQmQ2ektuRHVVaFM0UmNyN2FvT1VRZ2NDOHl4SXhxa09B?=
 =?utf-8?B?aVBQMFNPNm1lNncyUUpWallUSEpURWhEcDVmWlJQTlNWUUk0Y21oV1FKUFJB?=
 =?utf-8?B?MEIzaVFwZlA5dUk5RzRHeXNYejNVWFhUU05lV3hKa2hVN1V5aHo1L0NTd1By?=
 =?utf-8?B?cjVpNkhjbExsbGl0cXJKQkJrZm0vOUNRNUx5c3RsQU1ZNFhnTHIrb1F0RERw?=
 =?utf-8?B?WWM1bEtzb0syN0lZK1p3N3lpK0ZWUHhDc2plcG1oRWlPM0lCYVVYZmFnOU5I?=
 =?utf-8?B?RnZ0ci9JRC9xUHp3ZVR6aTVjSkpXczNGcER0ZE91OFRNMXlRMW1ocjZScXlR?=
 =?utf-8?B?TUpYNGoxc2ovR3d4aTNJUjA4bzdyZHFPc25tSERYaFZhd09sV2JCaHNrbVBx?=
 =?utf-8?B?QlJaamR2ak40dUxZWTNtcmwybU1rK3ZGbG9BMDYyR1MxejZvMmwydE1uWll4?=
 =?utf-8?B?OVRHVFJqU2xHNFFhckFQUFpuNzdFNWlQRDBmK25mOG9UcEdVd1FMSUVXTWla?=
 =?utf-8?B?R1FLMVJJSXhwN3ZPYTczLzRNWm1IQlg4dzFvK1RucVh4NldZYmM2dkJ2eDF4?=
 =?utf-8?B?ZnhIWnBRTzNudVQ1aEVxSVBxV2JhVW1lcE5EbEROYmlESlgzVWVSQ1ZLQ3Bk?=
 =?utf-8?B?cXNDcitJUmZDd0RINFRhaSsrSDVwT1M0andoK3VNTnIwVGtreDVnekI0bVdK?=
 =?utf-8?B?ekpLSGNPOWhHcFljVldpVUd4RVBHY2VPdDVSMDBxaTl5bFdBZGtMZGFyaGJm?=
 =?utf-8?B?RitJOFN6VWtLQTRyTkZGdWltb1JJWGhWZ1Y3UlMreThiVVZlczAyb3FJaTJG?=
 =?utf-8?B?R2NrdTRYQzhwMmJzOHB3cGtVMkdvQjNGQmE2bzg2bmkyc28yemo4dz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB6870.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9f8770-6016-4fa2-2915-08ded5c6af7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 10:10:45.7241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WbDNKGWYvgl08NPFG1+KgJvzOmPRiB+F8vUZVXf/EJBwn9+lyUO6EHXQETLiN+H9om6z2nUVYfrhCv3zoZ3AuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10356

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBKdW5lIDI5
LCAyMDI2IDU6NTQgUE0NCj4gVG86IEx1a2UgV2FuZyAoT1NTKSA8emluaXUud2FuZ18xQG9zcy5u
eHAuY29tPg0KPiBDYzogRnJhbmsuTGlAa2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDcvN10gbW1jOiBzZGhjaS1lc2RoYy1pbXg6IGZpeCBy
ZXN1bWUgZXJyb3IgaGFuZGxpbmcNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRp
b24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpDQo+IHRvIGNv
bnNpZGVyOg0KPiAtIFtIaWdoXSBFYXJseSByZXR1cm4gb24gYHBtX3J1bnRpbWVfZm9yY2VfcmVz
dW1lKClgIGZhaWx1cmUgaW4NCj4gYHNkaGNpX2VzZGhjX3Jlc3VtZSgpYCBza2lwcyBuZWNlc3Nh
cnkgc29mdHdhcmUgc3RhdGUgY2xlYW51cHMsIGNhdXNpbmcgYQ0KPiBQTSBydW50aW1lIHVzYWdl
IGNvdW50ZXIgbGVhayBhbmQgbGVhdmluZyBJUlFzIHVuYmFsYW5jZWQuDQo+IC0tDQo+IA0KPiBj
b21taXQgMDA3YzE1OTQzZmVkYTdlOTIxYzBjOTYxM2I3MDJjYzhiOWVlN2Y5Nw0KPiBBdXRob3I6
IEx1a2UgV2FuZyA8emluaXUud2FuZ18xQG54cC5jb20+DQo+IA0KPiBtbWM6IHNkaGNpLWVzZGhj
LWlteDogZml4IHJlc3VtZSBlcnJvciBoYW5kbGluZw0KPiANCj4gVGhpcyBjb21taXQgdXBkYXRl
cyB0aGUgcmVzdW1lIGZ1bmN0aW9uIHRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgb2YNCj4gcG1f
cnVudGltZV9mb3JjZV9yZXN1bWUuIElmIGl0IGZhaWxzLCB0aGUgZnVuY3Rpb24gbm93IHJldHVy
bnMgaW1tZWRpYXRlbHkNCj4gdG8gYXZvaWQgaGFyZHdhcmUgcGFuaWNzLg0KPiANCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1lc2RoYy1pbXguYyBiL2RyaXZlcnMvbW1j
L2hvc3Qvc2RoY2ktDQo+IGVzZGhjLWlteC5jDQo+ID4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9z
ZGhjaS1lc2RoYy1pbXguYw0KPiA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktZXNkaGMt
aW14LmMNCj4gPiBAQCAtMjEyNSwxMiArMjEyNSwxMiBAQCBzdGF0aWMgaW50IHNkaGNpX2VzZGhj
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlDQo+ICpkZXYpDQo+ID4gIAkJCWRldl93YXJuKGRldiwgIkZh
aWxlZCB0byByZXN0b3JlIHBpbmN0cmwgc3RhdGVcbiIpOw0KPiA+ICAJfQ0KPiA+DQo+ID4gLQlw
bV9ydW50aW1lX2ZvcmNlX3Jlc3VtZShkZXYpOw0KPiA+IC0NCj4gPiAtCXJldCA9IG1tY19ncGlv
X3NldF9jZF93YWtlKGhvc3QtPm1tYywgZmFsc2UpOw0KPiA+ICsJcmV0ID0gcG1fcnVudGltZV9m
b3JjZV9yZXN1bWUoZGV2KTsNCj4gPiAgCWlmIChyZXQpDQo+ID4gIAkJcmV0dXJuIHJldDsNCj4g
DQo+IFtTZXZlcml0eTogSGlnaF0NCj4gSWYgcG1fcnVudGltZV9mb3JjZV9yZXN1bWUgZmFpbHMg
YW5kIHdlIHJldHVybiBlYXJseSBoZXJlLCBkb2VzIHRoaXMgc2tpcA0KPiBuZWNlc3Nhcnkgc29m
dHdhcmUgc3RhdGUgY2xlYW51cHM/DQo+IA0KPiBJdCBsb29rcyBsaWtlIHJldHVybmluZyBlYXJs
eSBieXBhc3NlcyB0aGUgZW5hYmxlX2lycSgpIGFuZA0KPiBzZGhjaV9kaXNhYmxlX2lycV93YWtl
dXBzKCkgY2FsbHMgbGF0ZXIgaW4gc2RoY2lfZXNkaGNfcmVzdW1lLCB3aGljaCBtaWdodA0KPiBs
ZWF2ZSB0aGUgSVJRIGRlc2NyaXB0b3IgZGVwdGggYW5kIHdha2V1cCBzb3VyY2VzIGluY29ycmVj
dGx5IGNvbmZpZ3VyZWQuDQoNClllcywgdGhpcyBpcyBpbnRlbnRpb25hbC4gSWYgcG1fcnVudGlt
ZV9mb3JjZV9yZXN1bWUoKSBmYWlscywgdGhlDQpjb250cm9sbGVyIGNsb2NrcyBhcmUgbm90IGVu
YWJsZWQuIFByb2NlZWRpbmcgZnVydGhlciB3b3VsZCBhY2Nlc3MNCmhhcmR3YXJlIHJlZ2lzdGVy
cyBvbiBhbiB1bmNsb2NrZWQgZGV2aWNlLCBjYXVzaW5nIGEga2VybmVsIHBhbmljLg0KDQpUaGUg
SVJRIGlzIGtlcHQgZGlzYWJsZWQgYmVjYXVzZSB0aGUgaGFuZGxlciByZWFkcyBTREhDSV9JTlRf
U1RBVFVTIC0NCmEgYnVzIGZhdWx0IG9uIGFuIHVuY2xvY2tlZCBjb250cm9sbGVyLiBUaGUgUE0g
Y291bnRlciBsZWFrIG9ubHkNCmFmZmVjdHMgdGhpcyBhbHJlYWR5LWJyb2tlbiBkZXZpY2UuIEJv
dGggYXJlIGFjY2VwdGFibGUgdHJhZGVvZmZzDQp0byBhdm9pZCBjcmFzaGluZyB0aGUgc3lzdGVt
IG9uIHRoaXMgY29sZCBlcnJvciBwYXRoLg0KDQpUaGFua3MsDQpMdWtlDQoNCj4gDQo+IFsgLi4u
IF0NCj4gDQo+ID4gQEAgLTIxNTcsNyArMjE1Nyw3IEBAIHN0YXRpYyBpbnQgc2RoY2lfZXNkaGNf
cmVzdW1lKHN0cnVjdCBkZXZpY2UNCj4gKmRldikNCj4gPg0KPiA+ICAJcG1fcnVudGltZV9wdXRf
YXV0b3N1c3BlbmQoZGV2KTsNCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gSWYgdGhlIGVhcmx5
IHJldHVybiBpcyB0YWtlbiBhYm92ZSwgdGhpcyBQTSB1c2FnZSBjb3VudCBkZWNyZW1lbnQgaXMN
Cj4gYnlwYXNzZWQuDQo+IA0KPiBXaWxsIHRoaXMgcGVybWFuZW50bHkgbGVhdmUgdGhlIGRldmlj
ZSdzIFBNIHJ1bnRpbWUgdXNhZ2UgY291bnRlciBlbGV2YXRlZCwNCj4gcHJldmVudGluZyBib3Ro
IHRoZSBkZXZpY2UgYW5kIGl0cyBwYXJlbnQgcG93ZXIgZG9tYWlucyBmcm9tIGV2ZXIgcnVudGlt
ZQ0KPiBzdXNwZW5kaW5nIGFnYWluPw0KPiANCj4gPg0KPiA+IC0JcmV0dXJuIHJldDsNCj4gPiAr
CXJldHVybiAwOw0KPiA+ICB9DQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJDQo+IHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MjkwOTE5NTQuMzIyNzE1MS0xLQ0K
PiB6aW5pdS53YW5nXzFAb3NzLm54cC5jb20/cGFydD03DQo=
