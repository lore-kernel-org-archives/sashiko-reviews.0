Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.54.195.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628234;
	b=XXkhIJAN4eK4JjeVodMF+GGQV8LzdCowllkfe5MA2wFJ6NXcPSSPrjgt0Cm3KIlTyzVp
	 EvyC3sHBloTUdDVsYFW8ZNAJfSeXSV6z0RPTNenYEdOHLKwsbvpnitPLpuxXnnRWqZHJa
	 xcnJ9Sdm7e+hqNgkoNC9B6Ia6arpkXiVk8c9kkyliMEop3sfTwp3lgUbSM0lNWRB+v1uq
	 13GjF0ZFhYYa1NfbVy5F6FiBtZZXJfaZNTtQLmb3aqYEskwXdd7z4NxU610URgORC9KhL
	 p1EHhZfG202c7Aj8D7UacmievAh4nOAHSxloH+qcxIWT3GaxYfNgs6drVcHe4MW31mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628234;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=h57i/afAPKpAfCNdbWXAzmFeVNIQu/6Av32a9/VHlPY=;
	b=mzZ7JShYQjFtUcH7FLfTT64FbUPtLGkO6gOQ4knXtxVQUxXNKjOrPKFPNpQhx4pNfDcm
	 uVVrCPK6aVmla1RDXpF4Cy8vz5DXi7kfhjgNJ+DbLAx3jay5bm6spkulnjmbhPA5h8jJP
	 IezKDeNA11MJUWoV6YOG5qgepIoZmDqP/xGR5YfaEZi07N/Vb6vQq4yeb20BaXSJoT5rT
	 FxUpbK+qkYOCCXYj1ksMHvMfUjT2/gWBEn+Y+JdQhLz/3AhbH3IxcX8YjQCD8MTgTXx0U
	 /u3ODhNcNkxhWhEfkjIm+fesnrsh5PZefWdXCfSZMFAoOI9MQrrguMaxfFoHNSUCBXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fintech.ru;
	spf=pass smtp.mailfrom=fintech.ru;
	arc=none smtp.remote-ip=195.54.195.159
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF139606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 17:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF139606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 25 Nov
 2026 20:37:10 +0300
Received: from Ex16-01.fintech.ru (10.0.10.18) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 25 Nov
 2026 20:37:09 +0300
Received: from Ex16-01.fintech.ru ([fe80::2534:7600:5275:d3f9]) by
 Ex16-01.fintech.ru ([fe80::2534:7600:5275:d3f9%7]) with mapi id
 15.01.2242.004; Wed, 25 Nov 2026 20:37:09 +0300
From: =?utf-8?B?0JbQsNC90LTQsNGA0L7QstC40Ycg0J3QuNC60LjRgtCwINCY0LPQvtGA0LU=?=
 =?utf-8?B?0LLQuNGH?= <n.zhandarovich@fintech.ru>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 3/3] drm/bridge: analogix_dp: Propagate errors from
 runtime resume
Thread-Topic: [PATCH v2 3/3] drm/bridge: analogix_dp: Propagate errors from
 runtime resume
Thread-Index: AQHdfPNFAxb+gG71U0SxVwVBLR38nLc+wLEAgABMAWA=
Date: Wed, 25 Nov 2026 17:37:09 +0000
Message-ID: <3b940c423a714ce7adb946552a0d8ae3@fintech.ru>
References: <20261125153958.1349811-1-n.zhandarovich@fintech.ru>
 <20261125153958.1349811-4-n.zhandarovich@fintech.ru>
 <sashiko-outbox-233697@kernel.org>
In-Reply-To: <sashiko-outbox-233697@kernel.org>
Accept-Language: en-US, ru-RU
Content-Language: ru-RU
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBOb3Zl
bWJlciAyNSwgMjAyNiA3OjAzIFBNDQo+IFRvOiDQltCw0L3QtNCw0YDQvtCy0LjRhyDQndC40LrQ
uNGC0LAg0JjQs9C+0YDQtdCy0LjRhyA8bi56aGFuZGFyb3ZpY2hAZmludGVjaC5ydT4NCj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAzLzNdIGRybS9icmlkZ2U6IGFuYWxvZ2l4X2RwOiBQcm9wYWdhdGUgZXJyb3JzIGZyb20NCj4g
cnVudGltZSByZXN1bWUNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNh
c2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsDQo+IGlzc3VlIHRvIGNvbnNpZGVyOg0K
PiAtIFtIaWdoXSBkcm0vYnJpZGdlOiBhbmFsb2dpeF9kcDogcG93ZXJfb24oKSBlcnJvciBjaGVj
ayBicmVha3MgRXh5bm9zDQo+ICAgRFAgQVVYDQo+IC0tDQo+IA0KPiBjb21taXQgYjUxMjJmYTIw
OTBlNDZjZjgyYzg3ZmM4Zjk2YWQ1M2EzMjJlMzgyNA0KPiBBdXRob3I6IE5pa2l0YSBaaGFuZGFy
b3ZpY2ggPG4uemhhbmRhcm92aWNoQGZpbnRlY2gucnU+DQo+IA0KPiBkcm0vYnJpZGdlOiBhbmFs
b2dpeF9kcDogUHJvcGFnYXRlIGVycm9ycyBmcm9tIHJ1bnRpbWUgcmVzdW1lDQo+IA0KPiBUaGlz
IGNvbW1pdCBjaGVja3MgcmV0dXJuIHZhbHVlcyBmcm9tIHBsYXRfZGF0YS0+cG93ZXJfb24oKSwN
Cj4gcGh5X3NldF9tb2RlKCksDQo+IGFuZCBwaHlfcG93ZXJfb24oKSBpbiBhbmFsb2dpeF9kcF9y
ZXN1bWUoKSwgdW53aW5kaW5nIHBsYXRmb3JtIHBvd2VyDQo+IGFuZA0KPiBkaXNhYmxpbmcgZHAt
PmNsb2NrIG9uIGVycm9yLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYw0KPiA+IGluZGV4IDRkM2Q3MjQ3NmRkOTUu
LjkyMjg2NTU4OTNhMGIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
bmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYw0KPiA+IEBAIC0xNTM5LDE1ICsxNTM5LDMw
IEBAIGludCBhbmFsb2dpeF9kcF9yZXN1bWUoc3RydWN0DQo+IGFuYWxvZ2l4X2RwX2RldmljZSAq
ZHApDQo+ID4gIAkJcmV0dXJuIHJldDsNCj4gPiAgCX0NCj4gPg0KPiA+IC0JaWYgKGRwLT5wbGF0
X2RhdGEtPnBvd2VyX29uKQ0KPiA+IC0JCWRwLT5wbGF0X2RhdGEtPnBvd2VyX29uKGRwLT5wbGF0
X2RhdGEpOw0KPiA+ICsJaWYgKGRwLT5wbGF0X2RhdGEtPnBvd2VyX29uKSB7DQo+ID4gKwkJcmV0
ID0gZHAtPnBsYXRfZGF0YS0+cG93ZXJfb24oZHAtPnBsYXRfZGF0YSk7DQo+ID4gKwkJaWYgKHJl
dCkNCj4gPiArCQkJZ290byBlcnJfZGlzYWJsZV9jbGs7DQo+ID4gKwl9DQo+IA0KPiBbU2V2ZXJp
dHk6IEhpZ2hdDQo+IERvZXMgYWJvcnRpbmcgYW5hbG9naXhfZHBfcmVzdW1lKCkgb24gYSBub24t
emVybyByZXR1cm4gZnJvbQ0KPiBkcC0+cGxhdF9kYXRhLT5wb3dlcl9vbigpIGJyZWFrIERQIEFV
WCBhY2Nlc3Mgb24gRXh5bm9zIERQIGJlZm9yZSBhDQo+IENSVEMgaXMNCj4gYXR0YWNoZWQ/DQo+
IA0KPiBPbiBFeHlub3MgRFAsIGRwLT5wbGF0X2RhdGEucG93ZXJfb24gaXMgZXh5bm9zX2RwX3Bv
d2Vyb24oKSwgd2hpY2gNCj4gY2FsbHMNCj4gZXh5bm9zX2RwX2NydGNfY2xvY2tfZW5hYmxlKCk6
DQo+IA0KPiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcC5jOmV4eW5vc19kcF9jcnRj
X2Nsb2NrX2VuYWJsZSgpIHsNCj4gCS4uLg0KPiAJaWYgKCFlbmNvZGVyLT5jcnRjKQ0KPiAJCXJl
dHVybiAtRVBFUk07DQo+IAkuLi4NCj4gfQ0KPiANCj4gQmVjYXVzZSBlbmNvZGVyLT5jcnRjIGlz
IE5VTEwgdW50aWwgYW4gYXRvbWljIG1vZGVzZXQgYmluZHMgYSBDUlRDIHRvIHRoZQ0KPiBlbmNv
ZGVyIChhbmQgYmVjb21lcyBOVUxMIGFnYWluIHdoZW4gdGhlIGRpc3BsYXkgaXMgZGlzYWJsZWQp
LCBydW50aW1lDQo+IHJlc3VtZSB0cmlnZ2VyZWQgYnkgYW5hbG9naXhfZHBhdXhfdHJhbnNmZXIo
KSBub3cgZmFpbHMgd2l0aCAtRVBFUk0sDQo+IHNraXBwaW5nIHBoeV9wb3dlcl9vbigpIGFuZCBh
bmFsb2dpeF9kcF9pbml0X2RwKCkgYW5kIGJyZWFraW5nIEFVWCBidXMNCj4gcGFuZWwgcG9wdWxh
dGlvbiBhdCBwcm9iZSB0aW1lIGFzIHdlbGwgYXMgcHJlLW1vZGVzZXQgRURJRCByZWFkcy4NCj4g
DQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3DQo+IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9w
YXRjaHNldC8yMDI2MTEyNTE1Mzk1OC4xMzQ5ODExLTEtDQo+IG4uemhhbmRhcm92aWNoQGZpbnRl
Y2gucnU/cGFydD0zDQoNClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4gVG8gcmVpdGVyYXRlLCB0
aGlzIGlzIHRoZSBzYW1lIHByZXJlcXVpc2l0ZSBpc3N1ZQ0KcmVwb3J0ZWQgZm9yIHYxLg0KDQpQ
YXRjaCAzIHJlcXVpcmVzIGVpdGhlciBBbGV4YW5kcmUgTWFycXVldCdzIEV4eW5vcyBwaXBlLWNs
b2NrDQpjb252ZXJzaW9uIG9yIE1hcmVrIFN6eXByb3dza2kncyBhbHRlcm5hdGl2ZSwgYXMgZG9j
dW1lbnRlZCBpbiB0aGUNCmNvdmVyIGxldHRlciBhbmQgcGF0Y2ggbm90ZXMuIEJvdGggcmVtb3Zl
IHRoZSBwbGF0Zm9ybSBwb3dlcg0KY2FsbGJhY2tzIHJlc3BvbnNpYmxlIGZvciB0aGUgLUVQRVJN
IHJldHVybiBkZXNjcmliZWQgaGVyZS4NCg0KVGhlIHByZXJlcXVpc2l0ZSByZW1haW5zIGV4dGVy
bmFsIHRvIHRoaXMgc2VyaWVzIGFuZCBtdXN0IGJlDQphcHBsaWVkIGJlZm9yZSBwYXRjaCAzLiBJ
J3ZlIHRyaWVkIHRvIG1ha2UgaXQgYXMgY2xlYXIgYXMgcG9zc2libGUNCmJvdGggaW4gY292ZXIg
bGV0dGVyIGFuZCBpbiB0aGUgY29tbWVudCB0byB0aGUgcGF0Y2ggMy4NCg==
