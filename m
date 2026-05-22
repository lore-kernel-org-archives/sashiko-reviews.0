Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861C028C84A;
	Fri, 22 May 2026 03:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779420639; cv=none; b=bmhK+4cs/5JNkmAcGYoroAmSzBwi+WTppFonNSTuVQ0j6t+u2s8S5VJQD4CayKy7lkVyrQ7JrQPcIkHQsiwP5H++wquy6q3wmwl8Uv5xegYjApyVAlqWLIcVDREvjKORlGsrmRF3bai6GTsww6dyY/XTPSmYMBDYHgBSAd5BoLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779420639; c=relaxed/simple;
	bh=F8RX98jKX6EWZaxc/gTBAnZXa1YRN9/hJQnHWYekS+s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XlApSyZREJiaISOUlVxMIhP0OLXjHvP5Xv/glSI1aFN1U4xZTLXB3jLIVrv7e52dOQJLka+In0SxGGSiMU4RO6z0cskHO85QJFqvAGKhxaB0nDUZOA42mMW0fPMu9JYX2lXWOnu1Jm3iXM2PmdNg/QCUpAjGdIvnbgdPIu/OCU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=bmajDI0L; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="bmajDI0L"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64M3UG6201981315, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1779420616; bh=F8RX98jKX6EWZaxc/gTBAnZXa1YRN9/hJQnHWYekS+s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=bmajDI0LmCvg807PoJ6bUPKwaQQGDN+gOSvaz7kOdDkIEmynziFoAeALHtIL66ObM
	 4jc18+LKe6ZYZ1cQ4eGtpPjflAYYzFVa91EXbObEFVR86Z/Duahz3QtUHHoLmgRNpJ
	 DACYVhvI3mTFgYrhcetb6W7iRxIi1jq/cZaWbasFQQjeN/GlX09uGL+2fHMO9vTmt5
	 r8XCiZ9qj476Z9yutCHYNdT6MjuElDg4lNNzviwtMyb1pvbz+9GwEwlLLDeePEfa4+
	 eyV4lrEAjodFnPW4QY2BgffUX1/Z8OBqdPMqF8KI6QyqkltWDo3tTKLH66jXAqEnvB
	 B+4NNvC1isEJw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 64M3UG6201981315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 May 2026 11:30:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 May 2026 11:30:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 May 2026 11:30:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Fri, 22 May 2026 11:30:15 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Marc Zyngier <maz@kernel.org>,
        "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        =?utf-8?B?IkFuZHJlYXMgRsOkcmJlciI=?= <afaerber@suse.de>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>
Subject: RE: [PATCH v2 14/17] arm64: dts: realtek: Add EL2 virtual timer
 interrupt
Thread-Topic: [PATCH v2 14/17] arm64: dts: realtek: Add EL2 virtual timer
 interrupt
Thread-Index: AQHc5EOhlk6NhsNODUCpXhfSQwD6+LYZa8bQ
Date: Fri, 22 May 2026 03:30:15 +0000
Message-ID: <c5157b3d333b4fd0838bf5c4e1e6beec@realtek.com>
References: <20260514150945.3917510-15-maz@kernel.org>
	<20260514231804.000CCC2BCB3@smtp.kernel.org> <87tss99j4j.wl-maz@kernel.org>
In-Reply-To: <87tss99j4j.wl-maz@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

PiBPbiBGcmksIDE1IE1heSAyMDI2IDAwOjE4OjAzICswMTAwLA0KPiBzYXNoaWtvLWJvdEBrZXJu
ZWwub3JnIHdyb3RlOg0KPiA+DQo+ID4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEg
U2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykNCj4gdG8gY29uc2lk
ZXI6DQo+ID4gLSBbSGlnaF0gSW5jb21wbGV0ZSBpbXBsZW1lbnRhdGlvbjogbWlzc2luZyB1cGRh
dGUgZm9yIFJlYWx0ZWsgS2VudCBTb0MNCj4gZmFtaWx5IHdoaWNoIHNwZWNpZmllcyBhbiBpbmNv
cnJlY3QgRUwyIHZpcnR1YWwgdGltZXIgaW50ZXJydXB0Lg0KPiA+IC0tDQo+ID4NCj4gPiBjb21t
aXQgM2I3MzYzODk1MGEyOGVjYzMyNGUxYzI4ZmE0ZmI5ZmNiMTNkNTU2Nw0KPiA+IEF1dGhvcjog
TWFyYyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz4NCj4gPg0KPiA+IGFybTY0OiBkdHM6IHJlYWx0
ZWs6IEFkZCBFTDIgdmlydHVhbCB0aW1lciBpbnRlcnJ1cHQNCj4gPg0KPiA+IFRoaXMgY29tbWl0
IGFkZHMgdGhlIG1pc3NpbmcgRUwyIHZpcnR1YWwgdGltZXIgaW50ZXJydXB0IHRvDQo+ID4gQVJN
djguMi1iYXNlZCBSZWFsdGVrIFNvQ3MuIEl0IHVwZGF0ZXMgcnRkMTZ4eC5kdHNpIGJ5IGFkZGlu
ZyB0aGUNCj4gPiBmaWZ0aCB0aW1lciBpbnRlcnJ1cHQgd2l0aCBHSUNfUFBJIDEyLg0KPiA+DQo+
ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZWFsdGVrL3J0ZDE2eHguZHRz
aQ0KPiA+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlYWx0ZWsvcnRkMTZ4eC5kdHNpDQo+ID4g
PiBpbmRleCAzYTdmNmUzNWI3Zjc0Li40M2IxM2QxMzNjMzI0IDEwMDY0NA0KPiA+ID4gLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9yZWFsdGVrL3J0ZDE2eHguZHRzaQ0KPiA+ID4gKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9yZWFsdGVrL3J0ZDE2eHguZHRzaQ0KPiA+ID4gQEAgLTEwNSw3ICsx
MDUsOCBAQCB0aW1lciB7DQo+ID4gPiAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19QUEkg
MTMgSVJRX1RZUEVfTEVWRUxfTE9XPiwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICA8
R0lDX1BQSSAxNCBJUlFfVFlQRV9MRVZFTF9MT1c+LA0KPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgIDxHSUNfUFBJIDExIElSUV9UWVBFX0xFVkVMX0xPVz4sDQo+ID4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgPEdJQ19QUEkgMTAgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1BQSSAxMCBJUlFfVFlQRV9MRVZFTF9MT1c+LA0K
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfUFBJIDEyIElSUV9UWVBFX0xFVkVM
X0xPVz47DQo+ID4gPiAgICAgfTsNCj4gPg0KPiA+IERvZXMgdGhpcyB1cGRhdGUgbWlzcyBhbm90
aGVyIFJlYWx0ZWsgQVJNdjguMisgU29DIGZpbGU/DQo+ID4NCj4gPiBMb29raW5nIGF0IGFyY2gv
YXJtNjQvYm9vdC9kdHMvcmVhbHRlay9rZW50LmR0c2kgKHVzZWQgYnkgUlREMTUwMSwNCj4gPiBS
VEQxODYxLCBhbmQgUlREMTkyMCksIHRoZSBmaWZ0aCB0aW1lciBpbnRlcnJ1cHQgaXMgY3VycmVu
dGx5IGRlZmluZWQNCj4gPiBhcyA8R0lDX1BQSSA5IElSUV9UWVBFX0xFVkVMX0hJR0g+Lg0KPiA+
DQo+ID4gUFBJIDkgaXMgdGhlIEdJQyB2Q1BVIG1haW50ZW5hbmNlIGludGVycnVwdCwgcmF0aGVy
IHRoYW4gdGhlIEVMMg0KPiA+IHZpcnR1YWwgdGltZXIgaW50ZXJydXB0IHdoaWNoIHNob3VsZCBi
ZSBQUEkgMTI6DQo+ID4NCj4gPiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlYWx0ZWsva2VudC5kdHNp
Og0KPiA+ICAgICAgIHRpbWVyIHsNCj4gPiAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXJt
LGFybXY4LXRpbWVyIjsNCj4gPiAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1BQSSAx
MyBJUlFfVFlQRV9MRVZFTF9MT1c+LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxH
SUNfUFBJIDE0IElSUV9UWVBFX0xFVkVMX0xPVz4sDQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPEdJQ19QUEkgMTEgSVJRX1RZUEVfTEVWRUxfTE9XPiwNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8R0lDX1BQSSAxMCBJUlFfVFlQRV9MRVZFTF9MT1c+LA0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDxHSUNfUFBJICA5IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0K
PiA+ICAgICAgIH07DQo+ID4NCj4gPiBBbm90aGVyIHBhdGNoIGluIHRoaXMgc2VyaWVzIChjbG9j
a3NvdXJjZS9kcml2ZXJzL2FybV9hcmNoX3RpbWVyOg0KPiA+IERlZmF1bHQgdG8gRUwyIHZpcnR1
YWwgdGltZXIgd2hlbiBydW5uaW5nIFZIRSkgY2hhbmdlcyB0aGUgZHJpdmVyIHRvDQo+ID4gdXNl
IHRoZSBFTDIgdmlydHVhbCB0aW1lciBieSBkZWZhdWx0IG9uIFZIRSBzeXN0ZW1zLg0KPiA+DQo+
ID4gSWYgdGhlIGtlcm5lbCB1c2VzIHRoZSBFTDIgdmlydHVhbCB0aW1lciBvbiB0aGVzZSBSZWFs
dGVrIFNvQ3MsIGNvdWxkDQo+ID4gaXQgcmVxdWVzdCB0aGUgd3JvbmcgaW50ZXJydXB0IChQUEkg
OSBpbnN0ZWFkIG9mIFBQSSAxMiksIGNhdXNpbmcNCj4gPiB0aW1lciBpbnRlcnJ1cHRzIHRvIG5v
dCBiZSBkZWxpdmVyZWQgYW5kIHJlc3VsdGluZyBpbiBhIGJvb3QgaGFuZyByZWdyZXNzaW9uPw0K
PiANCj4gVGhhdCdzIGRlZmluaXRlbHkgb2RkLCBhcyBQUEk5IGlzIHByZXNlbnQgaW4gdHdvIGlu
dGVycnVwdCBzcGVjaWZpZXJzICh0aW1lciBhbmQNCj4gR0lDKS4gT2J2aW91c2x5LCB0aGF0J3Mg
bm90IHBvc3NpYmxlLg0KPiANCj4gSSdsbCBhZGQgYSB0ZW50YXRpdmUgZml4IGZvciB0aGF0IGlu
IHRoZSBuZXh0IHJvdW5kLiBNYXliZSBBbmRyZWFzIG9yIFl1LUNodW4NCj4gY2FuIGNoZWNrIGlu
IHRoZSBtZWFudGltZT8NCj4gDQo+ICAgICAgICAgTS4NCj4gDQo+IC0tDQo+IEphenogaXNuJ3Qg
ZGVhZC4gSXQganVzdCBzbWVsbHMgZnVubnkuDQoNCkhpIE1hcmMsDQoNCkkgY2hlY2tlZCB3aXRo
IG15IGNvbGxlYWd1ZXMgYW5kIGNvbmZpcm1lZCB0aGF0IHRoaXMgaXMgaW5kZWVkIGEgdHlwbyBp
biBrZW50LmR0c2kuDQpUaGUgZmlmdGggaW50ZXJydXB0IGVudHJ5IHNob3VsZCBiZSBjb3JyZWN0
ZWQgdG86DQoNCjxHSUNfUFBJIDEyIElSUV9UWVBFX0xFVkVMX0xPVz47DQoNCkl0IHdvdWxkIGJl
IGdyZWF0IGlmIHlvdSBjb3VsZCBpbmNsdWRlIHRoZSBmaXggaW4geW91ciBuZXh0IHJvdW5kLiBP
dGhlcndpc2UsIGp1c3QNCmxldCBtZSBrbm93IGFuZCBJJ2xsIHNlbmQgYSBzZXBhcmF0ZSBwYXRj
aC4NCg0KVGhhbmtzLA0KWXUtQ2h1bg0K
