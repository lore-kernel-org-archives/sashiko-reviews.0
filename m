Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2096.outbound.protection.partner.outlook.cn [139.219.146.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775523DFC70
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 08:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177767; cv=fail; b=FPnRDcyvIr4mOuJphtLPtDzzAjj74GnqEwEEWzH0wF6Aa9zazFc8H/xUXZs+NpT0v4pE+N4pt+HvD/ViIlJD+6K/VQMN//twTgr2HfsZxUSDfddgEpYyyCVM85syF05mfcOjCruwTCCbpKjt4EIWEpKrcWfG9XsKIpd3hqHBcGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177767; c=relaxed/simple;
	bh=9N2PeyStzOT5751XYcEjw+j452qtw2FYrv+pm5ROVIQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sV3TDd/ybXzH2pUvE/Ln825ohs7e/W5OxVCZV4BqyMo65Dv7SRQPlxW0z3iNyKCl3i+vUAgNaA/mo3IjWT5kjnUbSLoQYT+9QVIaLdFTSe8HnpDShCdbnYZ8ZuWf8THbHUvfAXBBaZVMoXJbSAaABAY4qc0R2pyBKDNlGZoao+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NT0PR01MB0957.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.25; Tue, 19 May
 2026 08:02:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxirBzD+oOkgoFAH2S0mnV7LO9NnylXfZS6hi1ylfxsKvbOw47rj6En5HOJEzONBOd+focoMKkvN5rV7oD1F+ZbfQapH0a18ipYBHc3rBN7bG3FYVPtJgJR+agGC9AZ2Ax3i77IIUBwcDiCOuu4BJzRT1nkPR7DqgoQThOGJkLtzo8gwj1gC1u57/ozLVZT8x3N9dqEYEWKbjd4Ix68s0bbfeg6DFh3Tmh3zMzWwoUtNh9Mk2Qes/BYKFctKSFPXwJfWHTJEDm/0INyOoNz6YlpN2PHX9cac2g7Q5gACr4PuJdj+zIZOqTf3GJsi3Ae2soG2TKu5yMYZS6ngbw+ORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9N2PeyStzOT5751XYcEjw+j452qtw2FYrv+pm5ROVIQ=;
 b=CQjK3DoSZASlOpXtzfB5MaN9LwTtwfJo1KJz++x/4SP3k+mRG7aIzXCuyHALmLMOhp94OiW6kTltWeiakTdMieudIDTGDT96LHROxnV3JiMWzYmS9+hCLEcsD5JWbl6k1oNEYwpGfSdGl6JuZJDOPuFMTcbJDwsy9IBkbOsmrMuAGTywzzq5vMDFpfUDKKmUhvSRkbKg7lTEH+mIoVEFuk7IRgFaXwMECBviCLtK6OztR4TjHaELxczulBHHgnBQfIUb5Y/1Hyxj2hofZw6oxjX2czvwHIa0GWzdIbplOmMXhwSSdARSxqKVtK5EBM07LoJR6NwoecISIWvRFP1tVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 06:10:50 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::d8e2:3f39:6ae7:bdf2]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::d8e2:3f39:6ae7:bdf2%6])
 with mapi id 15.21.0025.023; Tue, 19 May 2026 06:10:50 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v1 1/2] bindings: iio: adc: Add StarFive JHB100 SARADC
Thread-Topic: [PATCH v1 1/2] bindings: iio: adc: Add StarFive JHB100 SARADC
Thread-Index: AQHc5p77jQOM2JwohkK7qO7svRU7q7YTcj+AgAEwNiA=
Date: Tue, 19 May 2026 06:10:50 +0000
Message-ID:
 <NTZPR01MB0956A84FECA24FF8D420065C9F002@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20260518081852.116909-2-xingyu.wu@starfivetech.com>
 <20260518082430.3F15DC2BCC9@smtp.kernel.org>
In-Reply-To: <20260518082430.3F15DC2BCC9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NT0PR01MB0957:EE_
x-ms-office365-filtering-correlation-id: 2681a7b3-0b4f-4e43-d506-08deb56d601b
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|38070700021|3023799003|4143699003;
x-microsoft-antispam-message-info:
 qi1oDe0oPbaw9xnP2rNsvTATRE7sFBfRn5jNE35CdRXj3UhVtVV9djj4KwFfN9GbZvfcsVkPYv0A1xshNaZF8d4DR+1o3WpNMOdeVHBoHci14Kv3h3TLE557AgnlKdSRNNjd9MBwIC6/5fH6DXdnGtErvD6Fa9OaWmYctF5k0+dvFB87BlK2hQO9JgjlWyZfaaUiIu2rK+kfd6S8bNcdNTFkVa41YlT+ZMG03GHU/hUg5xQUJKhXAP7B+c0JeirP7i0QksZ+Fdqkkph6JSVcdI6MJig7H1c2KU4LqHK43X2gZM8a2UBb5KPBqGoOR0V01eDpW+O/I/XHjNFVTlEXQrUo7kWSTXNM6X8fiCeCzM8mENt8O6/aM5uJSYEca3tUhS18vlhXbLK48HLFT3gmzfTgi+tovLGib+W9w4nvft3QyqsCMNLDtZiOSfG/6xrN217CSuFRCxrHDpNNIEYW9yYJdaVZ+nvihoiyOjzaizeQPa/MkKtgdj0FcQrke9Ftcm+tnhHXD63OOaIAHUELiBzZXYclHeQpeS7m++UiiThpHlzQMOjt+FRHPYIzmwCb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(38070700021)(3023799003)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHpNSnlFbHl1QjNYbzNNTXRGUW95RXRUelUrL0I4aXNleExURDBLWTlHVHRQ?=
 =?utf-8?B?K1Jxayt4ZTF6bXQrdUZCaXUyN0JLNWdGYkZ3RHdIZTdsWURvYU0zbjM5RUxo?=
 =?utf-8?B?ZUQxUnZEcTdkemdJZWlUbGZ5ZWFwRVNSZFdzYjFJMXpwQmtVNzJuYU5pLzVy?=
 =?utf-8?B?enhUckxEWHg3TEIzbzNzd0NqQTJ3REVXaW11V1ZhYWJ6S3BpY3Nsd0NFcFpS?=
 =?utf-8?B?OEFPV096UGJxZ0ZsSkRlSUxNWko2YlVueDdIdThJUUNxS3JsU3FyVTJUVXhi?=
 =?utf-8?B?RFpsTFNqM2VSQjdyYWNmTVgrTjI4alRqYW1FSmdKODFxLzJURWU4cFZnU0M5?=
 =?utf-8?B?amRCQlhKR2NpMHBEUWNNZDZROUxvdmNUNCtUaEVhUTNaRHBoa3NMSE0xWVRB?=
 =?utf-8?B?eUIxbTA3ekRyUHJMbTJiWC81UkVEL1BsOHo0UFRrMkdxZ2tFdWRhZXVtYVFq?=
 =?utf-8?B?dEovZndYU0htMkRMem9GT0czTHo1bkhHZW5vM2ZTL1VNeTNZR2x6QTdzNmRo?=
 =?utf-8?B?UVU2MnJ4aG82UUZMWFBCbVc2T2U2L0hLMEZvUEFFQnBCaDQ5eHdNaDNGanNR?=
 =?utf-8?B?azhkeGRZbEY4bnpvYklFN3V3cm1ERzFRN293a2Y3RkpxNjB1NkJZVk16ZGpY?=
 =?utf-8?B?TkdscHVrTUdmdlZCQytDcjhDWjFEcU5kRmVwNHFsNStXVjFrWWdnYkJpMDM3?=
 =?utf-8?B?b3BsRndxZzUrTEhDSnpNK1JkVW82U0NFTlYvUkozS1JVZXBmOXlUYkVZM01W?=
 =?utf-8?B?QXdWL2dnL1E1Z2o5ckh0QzMwdnJOakU1bXNQY2I5QUhtdFdHM2RMbDdYckJ0?=
 =?utf-8?B?SU1YZTNIMDVBMC80SzdIRnVuMFgvUExNaXVKdHBENElQOVQyUGRLeWRxRmxK?=
 =?utf-8?B?Tk8rQklac0dNVHJYUnAvUmJHSXFyTG1ZTGloSlVVOEpzMzRMV295UWNnRUJu?=
 =?utf-8?B?UEFxNWhQREtySkZDa3BkQkZRMm5xYlpXZCtKRG5qMkdtQk90SVRtaHM4Szl6?=
 =?utf-8?B?c2ZaRU9KK0Qxa1NOMHYzODB4R0ZhNGtBdjBWaCtXMEorY0ZFd2t2Y0NhZFpO?=
 =?utf-8?B?MWlqT0NOdDRJRm1HcWw5MG93WDZSVnk2a25wUm5yMk5hdHJZd2kwUnpVdnhp?=
 =?utf-8?B?Q1NtTnVSOXQ5NFRYZk5yaXgxaytTZWtzWXZaaGhtaUtBc1A4MWR1QytxalVl?=
 =?utf-8?B?ME5HVlNOZUZQSHFYaDl4MEtlbHRMWE9JR1NzanlmSmVQZlR1YVBuWHpzTFNa?=
 =?utf-8?B?dDJKUzU1bUo1WDYzUkd0QkxITWFGRy96eUlVa29NZE9YRW9GaDRPWUJ3VlZj?=
 =?utf-8?B?ZTNSdnlGM2xEMWFhektZYy95YjlFNG94N1dURThrMFQ5Wm5kN0ZPbDdnRDVy?=
 =?utf-8?B?cFhwMGlDWVBHV092YjljcFpsVERvZUJCRmFZcHRNOGdTSFZxOStNU3I5QmJh?=
 =?utf-8?B?UjFoQlRMby9CM0RPOVRQU09TSUZqVnJJUFZoN29UUFpoNWZNdnoxdFFESzJj?=
 =?utf-8?B?b0tPQjE0a1FlM25KWkFpeUo0TlZiR3ZLRG9JWVNkWHVCaElyRDRrQkovaEhC?=
 =?utf-8?B?N0J1am1uK3JEeWt1L2VDcmVYU2p6Z2pKM1ZWM3NhZEVmaWVWVEZnZ20xSTVW?=
 =?utf-8?B?ZklzRW4zckhJUUxLY3haOEdpbktJREQySjBQNmxGNWFxS0hnT1Q1NUhkUzky?=
 =?utf-8?B?Z1ZWM0ZVemJRV1dDRSs4cWU5NU5iWHdJRTlObUJiVWJXMXYxY0dFL2hBWmFm?=
 =?utf-8?B?N015WTFQQ2gwOFcrb09wOEpDOUFXeTd6OTkxMnRHdU8zY0RLejhTL0ZJamdr?=
 =?utf-8?B?OUxWSGJMUTdnOHhxc1dIcE85Zlg3bjIwNUNySENkYldBc2FvYVF0N0lITGJz?=
 =?utf-8?B?RlVRQmNsdzRmNk5UT2s3UXp5anl0S2FBWWVaWXBCMVRIckxOU1RmVWlxOG5w?=
 =?utf-8?B?cjNOY2MyVkZXb2M5T1o5MVpwZlAzazQ4VS9QalVYSG1aWTIyQytWMUNhVVBl?=
 =?utf-8?B?R1BTdEVDL29jYlVZc1pGV3o3Y3hGQUNEWmMvaFM1SEtzK29uREROTHVVcVJz?=
 =?utf-8?B?VDVyK0xhcTZMTVZOOExxRDk5VFZkUmIwcWR4NUpzN3RRR01xeHhUS3g2RDJF?=
 =?utf-8?B?R0lHTDhYVVh0NVdBa3FjNTZhc3AzS3VsNGRrdkNlMGo0VVhsSENnS0ZEVXN5?=
 =?utf-8?B?eTR3NDUzMnE3N1RFSUdjQmptTjFsSTZKb1hnZE0zczBSOUlwaFpnd1JBcHQw?=
 =?utf-8?B?dlZJeVMrdHpiZGFKOG0xeEhKaktWOXYrZFVoKzRxcEYwZVhETkhZWmczTHlL?=
 =?utf-8?B?eE9GRUpVWTBHcEdmbDlwa1lMK1BoZHhSSytFbGEvd2V0ZXd5UGFtZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 2681a7b3-0b4f-4e43-d506-08deb56d601b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 06:10:50.1099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xeoHfPq252dLox7eCypY6anslgJwADMkCyvk6rjFAz2P3L1oR1OLrRDMYcuZLXskziNzHg5XPA+0WrSwwKS8S5OHHiyB5Js48329BqZjf+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0956
X-OriginatorOrg: starfivetech.com

T24gMjAyNi81LzE4IDE2OjI0LCBTYXNoaWtvIHdyb3RlOg0KPiANCj4gVGhhbmsgeW91IGZvciB5
b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMyBwb3RlbnRpYWwgaXNz
dWUocykgdG8NCj4gY29uc2lkZXI6DQo+IC0gW0xvd10gVHlwbyBpbiB0aGUgYHJlZ2AgcHJvcGVy
dHkgc2NoZW1hIGtleXdvcmQgd2hlcmUgYG1heEl0ZW1gIGlzIHVzZWQNCj4gaW5zdGVhZCBvZiBg
bWF4SXRlbXNgLg0KPiAtIFtMb3ddIEhhcmR3YXJlLXNwZWNpZmljIHByb3BlcnRpZXMgYHVwcGVy
LWJvdW5kLW12YCwgYGxvd2VyLWJvdW5kLW12YCwgYW5kDQo+IGBzY2FuLWZyZXFgIGxhY2sgYSB2
ZW5kb3IgcHJlZml4Lg0KPiAtIFtMb3ddIFRoZSBgcmVzZXRzYCBwcm9wZXJ0eSBhbGxvd3MgMiBp
dGVtcyBidXQgZG9lcyBub3QgZG9jdW1lbnQgdGhlaXIgb3JkZXIgb3INCj4gbWVhbmluZy4NCj4g
LS0NCj4gDQo+IGNvbW1pdCBmNTFhZGZhMThkZjliNzMyMzkzYmFhODdmMTFkYmVmNTA2YmI0YjVi
DQo+IEF1dGhvcjogWGluZ3l1IFd1IDx4aW5neXUud3VAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gDQo+
IGJpbmRpbmdzOiBpaW86IGFkYzogQWRkIFN0YXJGaXZlIEpIQjEwMCBTQVJBREMNCj4gDQo+IFRo
aXMgY29tbWl0IGFkZHMgYSBuZXcgZGV2aWNlIHRyZWUgYmluZGluZyBkb2N1bWVudCBmb3IgdGhl
IFN1Y2Nlc3NpdmUNCj4gQXBwcm94aW1hdGlvbiBSZWdpc3RlciBBL0QgY29udmVydGVyIGZvdW5k
IG9uIHRoZSBTdGFyRml2ZSBKSEIxMDAgU29DLg0KPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9zdGFyZml2ZSxqaGIxMDAt
c2FyYWRjLnlhbQ0KPiA+IGwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9paW8vYWRjL3N0YXJmaXZlLGpoYjEwMC1zYXJhZGMueWFtDQo+ID4gbA0KPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwMC4uYmE4ZTE5YjcyYWQ3MQ0KPiA+
IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaWlvL2FkYy9zdGFyZml2ZSxqaGIxMDAtc2FyYWRjDQo+ID4gKysrIC55YW1sDQo+ID4gQEAg
LTAsMCArMSw2MiBAQA0KPiBbIC4uLiBdDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0
aWJsZToNCj4gPiArICAgIGNvbnN0OiBzdGFyZml2ZSxqaGIxMDAtc2FyYWRjDQo+ID4gKw0KPiA+
ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW06IDENCj4gDQo+IFRoaXMgaXNuJ3QgYSBidWcsIGJ1
dCBzaG91bGQgdGhpcyBiZSBtYXhJdGVtcyBpbnN0ZWFkIG9mIG1heEl0ZW0/IFRoZSBkdC1zY2hl
bWENCj4gdmFsaWRhdG9yIG1pZ2h0IHNpbGVudGx5IGlnbm9yZSB0aGUgdW5yZWNvZ25pemVkIGtl
eXdvcmQsIGFsbG93aW5nIG5vZGVzIHdpdGgNCj4gbXVsdGlwbGUgcmVnIGVudHJpZXMgdG8gcGFz
cyB2YWxpZGF0aW9uLg0KDQpXaWxsIGZpeC4NCg0KPiANCj4gWyAuLi4gXQ0KPiA+ICsgIGNsb2Nr
czoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIHJlc2V0czoNCj4gPiArICAg
IG1heEl0ZW1zOiAyDQo+IA0KPiBXaGVuIGFsbG93aW5nIG11bHRpcGxlIHJlc2V0IGxpbmVzLCBz
aG91bGQgdGhlIGJpbmRpbmcgZGVmaW5lIHRoZWlyIGV4cGVjdGVkIG9yZGVyDQo+IGFuZCBtZWFu
aW5nPyBVc3VhbGx5LCB0aGlzIGlzIGRvbmUgYnkgcHJvdmlkaW5nIGFuIGl0ZW1zIGxpc3Qgd2l0
aCBkZXNjcmlwdGlvbnMgZm9yDQo+IGVhY2ggZW50cnksIG9yIGJ5IGRlZmluaW5nIGEgY29ycmVz
cG9uZGluZyByZXNldC1uYW1lcyBwcm9wZXJ0eS4NCg0KTm90ZWQuDQoNCj4gDQo+IFsgLi4uIF0N
Cj4gPiArICAiI2lvLWNoYW5uZWwtY2VsbHMiOg0KPiA+ICsgICAgY29uc3Q6IDENCj4gPiArDQo+
ID4gKyAgdXBwZXItYm91bmQtbXY6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogVGhlIHVwcGVyIGJv
dW5kIHZvbHRhZ2UgdmFsdWUgb2YgdGhlIG1vbml0b3IuDQo+ID4gKyAgICAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MTYNCj4gPiArDQo+ID4gKyAgbG93ZXItYm91
bmQtbXY6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogVGhlIGxvd2VyIGJvdW5kIHZvbHRhZ2UgdmFs
dWUgb2YgdGhlIG1vbml0b3IuDQo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy91aW50MTYNCj4gPiArDQo+ID4gKyAgc2Nhbi1mcmVxOg0KPiA+ICsgICAgZGVz
Y3JpcHRpb246IE51bWJlciBvZiB0aGUgc2NhbiBjeWNsZSBpbnRlcnZhbC4NCj4gPiArICAgICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQxNg0KPiANCj4gU2luY2Ug
dGhlc2UgYXBwZWFyIHRvIGJlIGN1c3RvbSwgaGFyZHdhcmUtc3BlY2lmaWMgcHJvcGVydGllcywg
c2hvdWxkIHRoZXkgYmUNCj4gcHJlZml4ZWQgd2l0aCB0aGUgdmVuZG9yIHN0cmluZyAoZS5nLiwg
c3RhcmZpdmUsdXBwZXItYm91bmQtbXYpIHRvIHByZXZlbnQgZnV0dXJlDQo+IG5hbWVzcGFjZSBj
b2xsaXNpb25zIHdpdGggZ2VuZXJpYyBwcm9wZXJ0aWVzPw0KDQpOb3RlZC4NCg0KVGhhbmtzLA0K
WGluZ3l1IFd1DQo=
