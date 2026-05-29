Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2128.outbound.protection.partner.outlook.cn [139.219.17.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B21340406
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042068; cv=fail; b=MJ7PSLaakClRwlfVhBPyXRL3fhh2j8v3wYak3MWS3bq7NJ3RYRYgsffxziHy6YNzgcucf4Btt9hY4H1O6JfJ8jtLq1tUF8Wqht94CNezLaP1uU+9Am6oZeL5PrNkB24jd4ULLViwjyTWjWD7G8LQWU86xYX9N3T85rhK7yCCCwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042068; c=relaxed/simple;
	bh=NCA8dyWxLAEM4Qi/DMxV1UYvsp26vB4P4gGHDEppQG0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mcXdBpRGMlnAvpDXvIjIZ8Vf42x22KrkXdMJSumsvyobsWi1NnGuySlwpVzy8EjHIncECYU2aJaP7rX6BpCOvVJtsNcACN2vUmVvX5XZQ1i6pbS7W/SceQ0T5Md9TgiLPNqMF76afK+VGM14ITPC/lrd70JGFXSbaPidG9LOSUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LROuymO5L+voAGgELMnb2hJ6+Zt48AwmT66VQVoYK14DZ/hbV3+jUJbacon4R32UAFcgVJiqgm3gVYBHEIGbpWk+FPx2+jMKC4rwomt23BDvP3CO1+fb2LBRtqw8kykrwfjToxCUi2ztgN8xMuC9hcg9C6DrJkmTkYk+di3Nrdr5GOxO0kHANuhr/K1PEKAT/Uu//2BSXcygaceL93ILrP1I+yOSbUdN82EyV+T0BvTyK1g472hs3wL/qu4JsLUJEmxCyaTpZrjumrb3dSMV4+qY2QH1di4EkgevHzCW/+SS+t6FpKZSU/QfUQd0/z5ro/9i116EF6WWDLE//LYIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCA8dyWxLAEM4Qi/DMxV1UYvsp26vB4P4gGHDEppQG0=;
 b=k1G4t3f41kdipzMbqBxnPfW+dTKWU9JrkUYGLz75qesoAdilNOGk9MpmxPC6vreYybzLquL3JHVv6eCEWi7yTJUosWPWilW5N038E3PLDOwezZPocdwA5z1KP4JoD/PxT0EGS/Lc+1mwpYiKCbQJHRYxeFXcqApqMl88Dq5M4THaCMBL4+zIDvCGbqI7NBPGjcRVjeZsKN+vPTMLOqJETOlxLmFdWfwWB2gvVN7tl/i9rL4UOeA2zrM96ZgCAwzjbytZiywycYs4XTN1sYK/xoPHRCemmAq2TsKEYCJJrVTvcj0FwICGMa4GKoF6fje+fKwSu6w+OvpK790DyRooEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1260.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:10::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 07:34:54 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::4386:5cc4:3bc4:4795]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::4386:5cc4:3bc4:4795%3])
 with mapi id 15.21.0071.014; Fri, 29 May 2026 07:34:53 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH v18 1/3] dt-bindings: pwm: opencores: Drop starfive
 compatibles and update maintainers
Thread-Topic: [PATCH v18 1/3] dt-bindings: pwm: opencores: Drop starfive
 compatibles and update maintainers
Thread-Index: AQHc5C5S9fqR/+n1kECZdRj+yravLbYOmJeAgBYaUiA=
Date: Fri, 29 May 2026 07:34:53 +0000
Message-ID:
 <ZQ2PR01MB13077DA8ACAAC7F535830541E6162@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20260515054723.25024-2-hal.feng@starfivetech.com>
 <20260515060258.0CA3DC2BCB0@smtp.kernel.org>
In-Reply-To: <20260515060258.0CA3DC2BCB0@smtp.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1260:EE_
x-ms-office365-filtering-correlation-id: 7f72928d-c73e-43c9-ce9f-08debd54c66e
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|4143699003|22082099003|18002099003|3023799007|38070700021;
x-microsoft-antispam-message-info:
 GQjUExpQdpuPYTshL+Otfwv+Duq8E2v2fdJQAc9ygWv+DQLFtc0mnLDaTLPXEbCMNHF9lRLQ8fdq/TcYWRKUIlsN+8gCDfu9xjd6bzwi632njxd12IwsSRVfI5XglYTNS6XkprVk/5nAF1jQEcRoT6/Fxt7REjLjc/1v2RXctLnO9QFCg+c2O2Mw6qXuJlcTGNilQ2wmdtL8IpqmjBp0Sr1j3ZYsPOUSTlSWoW4JYcwi54JvYb++mYzDyhopjNI0Ob35rcEkpMA/nShbvQhGdi6o8HME9iz0p7/8u3jD30iQsPqgNcRtJrFkwP78RucznpxEHPXsBmS7gjfC2qRVWGls/4GCvLiwDCcnmVceF5UfGDePrGitpwxPLHoKYwPsyzmqObAPQ3vDvZfGw4aSNe95FZCtSFE313Lp4dxLy9VGsv7HkncbLkzcXbGqsfx7+o2QwaXmJjZ1yI5r7wY0uba5wDVu427J8r2BBwh5XCW0oGRimtJ3PQ9vTZa+UEAXI4Tp9xLKNIt92SgVaLPoV31Y0IrWHiB6ffK89IkTUpUzlTzdrrE0dbYxRi02QfpL
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(4143699003)(22082099003)(18002099003)(3023799007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VzREYldURHpiMjc5SWdLaWcrOVZBY3F3KzhJbkpQWTdhN3hoTitSc3JSTDc4?=
 =?utf-8?B?MGlNdFdhdWI1VDgrWGVJTENEbWo0THJjM29VWDBIN1ZpTDZzVDRQZjYwcmJK?=
 =?utf-8?B?dkJsd3lVbUk1Q0hhOWVQd3A4KzV1OXcyd2lzSXdXdmwzZ0NzUWpESFErTFVm?=
 =?utf-8?B?ODBFSEorUTNEMTFtc1hNc1QwNmNodEhYeWFpZlJMVEZHai9Xc245SDRma0xT?=
 =?utf-8?B?SkJSaUQ0RXNyZjUydTBDQmVWeFZxbjJzUDZFWXBieVB1RXBDdFNCZGpZamZr?=
 =?utf-8?B?L0hUazJCSHVKUGlIbVFxVXloWWM5TGVmcU4zQVF5Ry9lRUMyUlNUSUJpUC93?=
 =?utf-8?B?ZnFuOXY5dElXRzVndHpwbXlOVUJUcWVLb1o2bkl0Z0Y1VGUxSUo0KzZUYkNV?=
 =?utf-8?B?aUlzRE9RSHFGS0lvWE8yT0lOeTJEQ3hqNDBoTS9uMjdiT09MeFRhTkk2UEZD?=
 =?utf-8?B?YWZHR3VGdFhudHBZWXhwRnpEZFJwNUVFRUNyamR3a2wrSHZEYUNjMmMvVStN?=
 =?utf-8?B?UlVMM2dRQnRQQzBlNFlCODRueFZEK3lJWTJxdi9JOWZSZVhkZ3RsRXFvWVJU?=
 =?utf-8?B?R0E2UVJzMTZEOThsMGoyQzhLbXU4MERnZjRMWVZRaUYxNTI0b01RS1VYVE9D?=
 =?utf-8?B?QldjK28weVoyODNMQ2ZpaVdab1VnS2pkRjRxTDUyL3RIbW5WZzZsZDd1cUZz?=
 =?utf-8?B?SUZkV2Y3Q0crbFk0Yy9vRzl4L0NEQ256Ly9oU1FmWUMybHBIeDRqMjNJeitx?=
 =?utf-8?B?TnlpTXFKbFIxNis4K0g5NFFWQlZXakpyVzdOejZXb1pnOHl5NjhIWWpjY3ZH?=
 =?utf-8?B?cmNkR1JIVHJ0RU44eFd1ajgzK284VHhOWldLSm9xMnBhUW1Ta2YzcmhTVkJv?=
 =?utf-8?B?VjFSYTV1SEorQjBnaXUxald6Y3IvOWdRM3h2L0E2NkFkdTVYK3FOWFM2cy81?=
 =?utf-8?B?WGEzNHZrTmE0SWU5RStyZ0VPQTJiRkcrMVluVXNwQnZrVGRiK0l6c2hQK0Jr?=
 =?utf-8?B?SDVibDBSZ1ZGYzI2YTRRT1FxU0x0dFRNckJISm9OSmRIRnJJZVNFbWhvVGJ2?=
 =?utf-8?B?cDJ3OS8wbFVUTkVubHFGRnZVcURQVVhqVFZlaTRaTVM5Q09oY2U1bjdWUFls?=
 =?utf-8?B?VFV2WWFDM3R3TmtsMmpvcXZLTlJrYmpVcEVJRE0xdEhnQUR0b0hRbEEzU2FO?=
 =?utf-8?B?WHVHekQyckxjcklIR2hWL0prNUVGVFArR1ZEVkxpY3RuTmxKNklHSlNKazFH?=
 =?utf-8?B?a290TGsvRllvbHRINXNieHZPMFdsTko5UkpEeS9lNTVycWJHUXJYdit5N2Jp?=
 =?utf-8?B?NXJ1ZDE4SXV0UlhaZnZRRXY2Y3VZQ1kvTEFtY1dyQkFtNytiSHZsMjFSamRW?=
 =?utf-8?B?bDNxVmx6RzFyUmlTemR4eUc2ZEZ0LzJsMlJXRCtuc3ZSRFlWdFlVWldncEJX?=
 =?utf-8?B?NXNXZXYxZHVZMERmc1ZhbUx3djVOV2tsN1hvNVNIMnc3ckZlOG1FYWF3R2xJ?=
 =?utf-8?B?NlJBdkl6NzZ3MDVIdDNabDhDeXJpektaQXZkMFJlYU0xdGYvWWpJVC8yVzFx?=
 =?utf-8?B?VzliVDJiNVB4NXR1VExVNVhld1NlTUtlMEl1cGc5WW10L0hmMTVvNDVzbTVJ?=
 =?utf-8?B?eTVKUE83aEMyeWVrZzhKcDQ0YWN3ZXFoR2tQajdUdEh6alhxTGtLOHo2cXF0?=
 =?utf-8?B?bC9RclI0NWQ3WmNOd1VCNXVCSGl4cmtsYjc3enZuNmt6eXR5M25peEp3Vjll?=
 =?utf-8?B?TlNodFJrRXpxN0RIRVRBNVlSalgvbGdJT0xEZXZSMDQ3OU1KR0U1Q0JjQUJz?=
 =?utf-8?B?OEdRV2xPRm9YUmZZWTNkeDhETnBsaEM1dGpRT1k4Y1NiOElsWVFkV3Z0SzNV?=
 =?utf-8?B?RHlLK09kemxOam9XOTZsUDRSVUhMRklPLzhqd0xQTXZVV014VmJTeitjQVZP?=
 =?utf-8?B?WlRLeEMwdnlTdjlEMVJVWkZYdkhwbVJHaGhxbFhOUXN3UEN3aVFyWTdaRkth?=
 =?utf-8?B?OWlyK21xVjk4c3lMb1E3bWcxeU1hWXlla001dXVRYVp4WUNIMG5EeTVuSkJk?=
 =?utf-8?B?bjArOTJNMDNjVFpxZVpWQ2lRQTh3cm96NU1pd0hOV29od3FQSXQwczA0L29o?=
 =?utf-8?B?ZTJ0Mm9IN3pwTFVSVHVPUUYzMEoyV21maTJzWnNPeWRBeHhEY1I5a0pMVVlG?=
 =?utf-8?B?WEtWUklwUkRoM2JrTlNKcU9NVThXRzlETXJwaUZyT1hkdHlTamxNZHJYLzVF?=
 =?utf-8?B?Qk5WZFdGM0M0cS8xTURrVUc3bkRqa0RMZUxnem03NkMrc2RzWE9aZEZsaU9W?=
 =?utf-8?B?TlJEV2J1V0dQMUpoVU5wajFKOWQwRTNzR0QwRk45VEREUUJERThUUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f72928d-c73e-43c9-ce9f-08debd54c66e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 07:34:53.6702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mAKFqtnazP7NYXWVJnJJsUA9SaBrsuoRNLVsyk2AvQqb70NNzWYjAVNv4GkCFdiuXpZ+1ZqshtsQbKWu8GXwpJ1yRzCImq/qn8SYbrJzT6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1260

PiBPbiAyNi4wNS4xNSAxNDowMywgc2FzaGlrby1ib3Qgd3JvdGU6DQo+IFRoYW5rIHlvdSBmb3Ig
eW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDMgcG90ZW50aWFsIGlz
c3VlKHMpIHRvDQo+IGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBSZW1vdmluZyBleGlzdGluZyBTdGFy
Rml2ZSBjb21wYXRpYmxlIHN0cmluZ3MgYnJlYWtzIERUIHNjaGVtYSB2YWxpZGF0aW9uDQo+IGZv
ciBleGlzdGluZyBkZXZpY2UgdHJlZXMuDQo+IC0gW01lZGl1bV0gVGhlIGNvbW1pdCBzaWxlbnRs
eSBtb2RpZmllcyB0aGUgYHJlZ2Agc3BhY2Ugc2l6ZSBpbiB0aGUgc2NoZW1hDQo+IGV4YW1wbGUu
DQo+IC0gW0xvd10gVGhlIGBjb21wYXRpYmxlYCBzY2hlbWEgY29udGFpbnMgYW4gYXdrd2FyZCBz
aW5nbGUtaXRlbSBsaXN0IHN0cnVjdHVyZQ0KPiBhZnRlciBtb2RpZmljYXRpb24uDQo+IC0tDQo+
IA0KPiBjb21taXQgYzMxNTJhMmEzOGI1ZjRkM2EyNWRmMDY5NjY0NmI4NDBlMGQwNGI2MA0KPiBB
dXRob3I6IEhhbCBGZW5nIDxoYWwuZmVuZ0BzdGFyZml2ZXRlY2guY29tPg0KPiANCj4gZHQtYmlu
ZGluZ3M6IHB3bTogb3BlbmNvcmVzOiBEcm9wIHN0YXJmaXZlIGNvbXBhdGlibGVzIGFuZCB1cGRh
dGUgbWFpbnRhaW5lcnMNCj4gDQo+IEVhY2ggb2YgdGhlIFN0YXJGaXZlIFNvQ3MgaGFzIDggT3Bl
bkNvcmVzIFBUQyBJUCBjb3JlcyB0aGF0IG9ubHkgZGlmZmVyIGJ5IHRoZWlyDQo+IHJlZ2lzdGVy
IGJhc2UgYWRkcmVzcy4gVGhlcmUgaXMgbm8gbmVlZCBmb3Igc3RhcmZpdmUgY29tcGF0aWJsZXMg
dG8gZGlzdGluZ3Vpc2ggdGhlbSwNCj4gc28gdGhleSBhcmUgZHJvcHBlZC4NCj4gDQo+ID4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vb3BlbmNvcmVz
LHB3bS55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL29w
ZW5jb3Jlcyxwd20ueWFtbA0KPiA+IGluZGV4IDUyYTU5ZDI0NWNkYjEuLjgzNGZiMTdlYzU5NWUg
MTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9v
cGVuY29yZXMscHdtLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcHdtL29wZW5jb3Jlcyxwd20ueWFtbA0KPiANCj4gWyAuLi4gXQ0KPiANCj4gPiBAQCAt
MjAsMTAgKzIwLDYgQEAgYWxsT2Y6DQo+ID4gIHByb3BlcnRpZXM6DQo+ID4gICAgY29tcGF0aWJs
ZToNCj4gPiAgICAgIGl0ZW1zOg0KPiA+IC0gICAgICAtIGVudW06DQo+ID4gLSAgICAgICAgICAt
IHN0YXJmaXZlLGpoNzEwMC1wd20NCj4gPiAtICAgICAgICAgIC0gc3RhcmZpdmUsamg3MTEwLXB3
bQ0KPiA+IC0gICAgICAgICAgLSBzdGFyZml2ZSxqaDgxMDAtcHdtDQo+ID4gICAgICAgIC0gY29u
c3Q6IG9wZW5jb3Jlcyxwd20tdjENCj4gDQo+IERvZXMgcmVtb3ZpbmcgdGhlIGxlZ2FjeSBjb21w
YXRpYmxlIHN0cmluZ3MgYnJlYWsgZHRic19jaGVjayBmb3IgZXhpc3RpbmcgZGV2aWNlDQo+IHRy
ZWVzPyBPbGRlciBkZXZpY2UgdHJlZXMgbGlrZWx5IHN0aWxsIHVzZSB0aGUgdHdvLXN0cmluZyBm
b3JtYXQuDQo+IA0KPiBXb3VsZCBpdCBiZSBiZXR0ZXIgdG8gdXNlIGEgb25lT2YgY29uc3RydWN0
IHRvIGFsbG93IGJvdGggdGhlIGxlZ2FjeSB0d28tc3RyaW5nDQo+IGZvcm1hdCBhbmQgdGhlIG5l
dyBzaW5nbGUtc3RyaW5nIGZvcm1hdCB0byBtYWludGFpbiBiYWNrd2FyZCBjb21wYXRpYmlsaXR5
Pw0KPiANCj4gVGhpcyBpc24ndCBhIGJ1ZywgYnV0IGxlYXZpbmcgYSBzaW5nbGUgZWxlbWVudCB1
bmRlciBpdGVtcyBpcyBhbiBhbnRpLXBhdHRlcm4gaW4NCj4gZHQtc2NoZW1hLiBTaW5jZSBvbmx5
IG9uZSBzdHJpbmcgaXMgYWxsb3dlZCBub3csIGNvdWxkIHRoaXMgYmUgc2ltcGxpZmllZCB0byBq
dXN0IGENCj4gZGlyZWN0IGNvbnN0IHByb3BlcnR5IGluc3RlYWQgb2YgYW4gaXRlbXMgYXJyYXk/
DQoNCldpbGwgZHJvcCB0aGUgYWJvdmUgY2hhbmdlIGFuZCB1c2Ugb25lT2YgY29uc3RydWN0IHRv
IGFsbG93IGJvdGggdGhlIGxlZ2FjeSB0d28tc3RyaW5nDQpmb3JtYXQgYW5kIHRoZSBuZXcgc2lu
Z2xlLXN0cmluZyBmb3JtYXQuDQoNCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gQEAgLTQ4LDggKzQ0
LDggQEAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gIGV4YW1wbGVzOg0KPiA+ICAg
IC0gfA0KPiA+ICAgICAgcHdtQDEyNDkwMDAwIHsNCj4gPiAtICAgICAgICBjb21wYXRpYmxlID0g
InN0YXJmaXZlLGpoNzExMC1wd20iLCAib3BlbmNvcmVzLHB3bS12MSI7DQo+ID4gLSAgICAgICAg
cmVnID0gPDB4MTI0OTAwMDAgMHgxMDAwMD47DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJv
cGVuY29yZXMscHdtLXYxIjsNCj4gPiArICAgICAgICByZWcgPSA8MHgxMjQ5MDAwMCAweDEwPjsN
Cj4gDQo+IFRoZSBjb21taXQgbWVzc2FnZSBtZW50aW9ucyBkcm9wcGluZyB0aGUgc3RhcmZpdmUg
Y29tcGF0aWJsZXMgYW5kIHVwZGF0aW5nDQo+IG1haW50YWluZXJzLCBidXQgZG9lcyBub3QgZG9j
dW1lbnQgY2hhbmdpbmcgdGhlIHJlZ2lzdGVyIHNwYWNlIHNpemUgZnJvbQ0KPiAweDEwMDAwIHRv
IDB4MTAuDQo+IA0KPiBDb3VsZCB0aGUgY29tbWl0IG1lc3NhZ2UgYmUgdXBkYXRlZCB0byBleHBs
aWNpdGx5IGV4cGxhaW4gYW5kIGp1c3RpZnkgdGhpcyByZWdpc3Rlcg0KPiBzaXplIGNoYW5nZT8N
Cg0KT0suIFdpbGwgYWRkIHRoZSBleHBsYW5hdGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2VzLg0K
DQpCZXN0IHJlZ2FyZHMsDQpIYWwNCg0KPiANCj4gLS0NCj4gU2FzaGlrbyBBSQ0KPiByZXZpZXcg
wrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNTE1MDU0NzIzLjI1MDI0LTEt
aGFsLmZlbmdAcw0KPiB0YXJmaXZldGVjaC5jb20/cGFydD0xDQo=
