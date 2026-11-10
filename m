Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=180.76.5.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298666;
	b=V6Pu+eGJy3nBRdNIhQlGSjf1RSRfh4wzUbDYCJPWN9TrBaU2viP653NNVWXSFwIwDd+A
	 RIn+/L8xOA8yZR5GWWVWhYA3gKxxHqdo3a7YFptAtmPXckfrDjWrTu/oHfmiaHRZLvVRW
	 pxiE12YiWIPEuO6nyMd0BvxTybq8Wmt/cl2/zDJg9RRiLNghPnFG0TOPewSsyuIyz+LCe
	 dAz60TSFTRdAL6vGkuznHz+nGMxfGlPKlmjuXUS4k4U+iAwSuWiOjqXKejpIiELsr209h
	 trHK1GUAQKjVH5eiwJVto5fL6QGttwbIi6MmNoy8f9kVnmVKWzKikuh1iwmIqO83i8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298666;
	h=DMARC-Filter:X-MD-Sfrom:X-MD-SrcIP:From:To:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 DKIM-Signature;
	bh=G2889yLwspt9VlX+AjgV0bymVsnBvUCRJF49BCxOO6o=;
	b=Ur630dx/xT8wzm6UHT9h8ndgczv3AuuMrYTnuJtKaHB9qDjbfisaMLaiREpSjV2XKxEi
	 FVX5O9NhAw9uv6T0tZnqP02l0GyC3qstrq3P2NG/vT1Gv9MisjSr7pXv1hOEX+OW9tkIC
	 pNrlHLiPqznq7j7MApR/utnhXcpD/kRdWTIiwauvSfeAeaA5C8J9tN3fqB+baMFywtCu5
	 XGr0DalGnEeUjIlthzMo6Ks6/rX8jPP0as6X8B6zz0an/gAiPQ07H3rP+LxnHQqjnN529
	 vor6eUogRqYNEBnXh53C/gm1sYGUvcGqoo++TkJcs3+SckaBUi0BqMjfrR7RZG9eQew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baidu.com;
	spf=pass smtp.mailfrom=baidu.com;
	dkim=pass header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=B6fbnTlN;
	arc=none smtp.remote-ip=180.76.5.236
Received: from outbound.baidu.com (outbound.baidu.com [180.76.5.236])
	by smtp.subspace.kernel.org (Postfix) with SMTP id AAF05606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 08:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF05606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=B6fbnTlN
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: "Li,Rongqing" <lirongqing@baidu.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiBb5aSW6YOo6YKu5Lu2XSBSZTogW1BBVENIXSBQQ0k6IE9ubHkg?=
 =?utf-8?B?cmVzdG9yZSBzdGF0ZSB0aGF0IHdhcyBzdWNjZXNzZnVsbHkgc2F2ZWQgYXJv?=
 =?utf-8?Q?und_a_reset?=
Thread-Topic: =?utf-8?B?W+WklumDqOmCruS7tl0gUmU6IFtQQVRDSF0gUENJOiBPbmx5IHJlc3RvcmUg?=
 =?utf-8?B?c3RhdGUgdGhhdCB3YXMgc3VjY2Vzc2Z1bGx5IHNhdmVkIGFyb3VuZCBhIHJl?=
 =?utf-8?Q?set?=
Thread-Index: AQHdcNUWC1MIoRMMhkuS1koLpaMYRLcmRzqAgACuwZA=
Date: Tue, 10 Nov 2026 08:17:39 +0000
Message-ID: <e10398e8f2fe4d448e12c1e871564a9a@baidu.com>
References: <20261110053348.2419-1-lirongqing@baidu.com>
 <sashiko-outbox-206347@kernel.org>
In-Reply-To: <sashiko-outbox-206347@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1794298663;
	bh=G2889yLwspt9VlX+AjgV0bymVsnBvUCRJF49BCxOO6o=;
	h=From:To:Subject:Date:Message-ID:Content-Type;
	b=B6fbnTlNmE3puCV1MUuagokGoSRwoMGvy4DFgq4ot/2bg5iCj1T/LPMrZ2+qc8Lg9
	 Ca/VyyRtOX6gKDXlMO27FJZ2g2DjrCoh+Sm4QNXWjeJL3AedFxUhROqRgqqx1BFJjL
	 VzM07HVtNV+0diwoZZNeFG0gyMOjU4W2eq/JVH00dHs0k9JwlDydrfG92978UdwVZO
	 y3K7SW47Iywe7XOzLspNlHlYOOFippMQK4kd7FrHqiFNEpN50tkXLQHRTOtZZDc/qB
	 iKXuy8lvZebubHX3gir5l6sUmcvq1wHwVjVD+mu+v8FoByIYp4AGMyV/cIfB6ZfFC1
	 I4U89Kp0MUJng==

PiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IERvZXMgc2tpcHBpbmcgcGNpX3Jlc3RvcmVfc3RhdGUoKSBo
ZXJlIGludHJvZHVjZSBhIHJlZ3Jlc3Npb24gdGhhdCBsZWF2ZXMgdGhlDQo+IGRldmljZSB1bmNv
bmZpZ3VyZWQgYWZ0ZXIgYSByZXNldCByZWNvdmVycyBpdCBmcm9tIGFuIGVycm9yPw0KPiANCj4g
Q29tbWl0IGEyZjFlMjIzOTBhYyAoIlBDSS9FUlI6IEVuc3VyZSBlcnJvciByZWNvdmVyYWJpbGl0
eSBhdCBhbGwgdGltZXMiKSBzYXZlcw0KPiB0aGUgaW5pdGlhbCBjb25maWcgc3BhY2UgaW4gcGNp
X2J1c19hZGRfZGV2aWNlKCkgYW5kIHJlbW92ZWQgdGhlDQo+IGRldi0+c3RhdGVfc2F2ZWQgY2hl
Y2sgZnJvbSBwY2lfcmVzdG9yZV9zdGF0ZSgpIHNvIGEgdmFsaWQgYmFzZWxpbmUNCj4gZGV2LT5z
dGF0ZQ0KPiBpcyBhbHdheXMgYXZhaWxhYmxlIGV2ZW4gYWZ0ZXIgYSBwcmlvciByZXN0b3JlIGNs
ZWFyZWQgZGV2LT5zdGF0ZV9zYXZlZC4NCj4gDQo+IENvbW1pdCBlMThkMWFiYzNiZmYgKCJQQ0k6
IEF2b2lkIHNhdmluZyBjb25maWcgc3BhY2Ugc3RhdGUgaWYgaW5hY2Nlc3NpYmxlIikNCj4gdGhl
biBza2lwcGVkIHBjaV9zYXZlX3N0YXRlKCkgaW4gcGNpX2Rldl9zYXZlX2FuZF9kaXNhYmxlKCkg
d2hlbiBjb25maWcgc3BhY2UNCj4gaXMgaW5hY2Nlc3NpYmxlIChzdWNoIGFzIGR1cmluZyBEUEMp
IHRvIGF2b2lkIG92ZXJ3cml0aW5nIHRoYXQgcHJlc2VydmVkIHN0YXRlDQo+IHdpdGggfjAgYmVm
b3JlIHRoZSByZXNldC4NCj4gDQo+IFNpbmNlIHRoZSBoYXJkd2FyZSByZXNldCBjbGVhcnMgdGhl
IGRldmljZSdzIHJlZ2lzdGVycyBiYWNrIHRvIHBvd2VyLW9uIGRlZmF1bHRzLA0KPiBjbGVhcmlu
ZyBkZXYtPnN0YXRlX3NhdmVkIGFuZCBza2lwcGluZyBwY2lfcmVzdG9yZV9zdGF0ZSgpIGxlYXZl
cyBCQVJzLA0KPiBQQ0lfQ09NTUFORCwgY2FwYWJpbGl0aWVzLCBhbmQgYnJpZGdlIGJ1cyBudW1i
ZXJzIHVucHJvZ3JhbW1lZCBvbmNlIHRoZQ0KPiByZXNldCBtYWtlcyBjb25maWcgc3BhY2UgYWNj
ZXNzaWJsZSBhZ2Fpbi4NCj4gDQo+IFsxXSBodHRwczovL3Nhc2hpa28uZGV2LyMvYnVnL2xpbnV4
LTYwYmFlNjc5LTVjODUtNGM0OS04MDQyLTY4MTdmOWNiNWM4Zg0KPiANCg0KU2FzaGlrbyBpcyBy
aWdodCDigJQgcGxlYXNlIGRyb3AgdGhpcyBwYXRjaC4NCg0KdGhhbmtzDQoNCltMaSxSb25ncWlu
Z10gDQoNCj4gLS0NCj4gU2FzaGlrbyBBSQ0KPiByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRl
di8jL3BhdGNoc2V0LzIwMjYxMTEwMDUzMzQ4LjI0MTktMS1saXJvbmdxaW5nDQo+IEBiYWlkdS5j
b20/cGFydD0xDQo=
