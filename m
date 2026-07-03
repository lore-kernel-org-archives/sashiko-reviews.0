Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AFD1F91F6
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 01:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783043449; cv=none; b=hzddX5ScLderVfPMtRzce4evullpXshW0vyeV47tldV1kBl6RH5hnJgMVCt/buTZ/BBRuR1jpQGcQBeGZKwPMHUH4gmHokerEW8VvWB8k9lBVuDL8qQzXsgV7hSqAL4E7hmaunnMmUs+ODr4SMSv8q8Imxwp45BEB4GyjeV5M94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783043449; c=relaxed/simple;
	bh=lmAqZhL8QCdehwLCHoufegfJomn7yDKioG8ZT5KJbIQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=JDiu2r8INnLSMOieNlMogqjyxtX32W7RctpHG8vN/+RZ5RrWZLm/Fn5kyjJGpiv+ScVDDhNZIozXs8Pe87X93yeOme2J1ToasLvSWDPvVW2mwVV4r99gn7C4FR02AsCwG9C2g+s/0umnaoY+KZexr2Rv4Dn3r7FuZTrmIZ83OCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Fri, 3 Jul 2026 09:50:36 +0800 (GMT+08:00)
Date: Fri, 3 Jul 2026 09:50:36 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, "Min Lin" <linmin@eswincomputing.com>
Subject: Re: Re: Re: [PATCH net-next v9 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <58532b95-bb74-4d87-acae-e67b41dd7d57@lunn.ch>
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
 <20260701063512.9ED051F000E9@smtp.kernel.org>
 <5de09a24.a11e.19f2207d7d2.Coremail.lizhi2@eswincomputing.com>
 <58532b95-bb74-4d87-acae-e67b41dd7d57@lunn.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <f21ffca.a15e.19f25abaea6.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID:TAJkCgBnCXNtFUdqIDIxAA--.11249W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQERDGpGkqQZhAABsb
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

CgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2VzLS0tLS0KPiBGcm9tOiAiQW5kcmV3IEx1bm4iIDxh
bmRyZXdAbHVubi5jaD4KPiBTZW5kIHRpbWU6VGh1cnNkYXksIDAyLzA3LzIwMjYgMjE6MjI6MzQK
PiBUbzog5p2O5b+XIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tPgo+IENjOiBzYXNoaWtvLXJl
dmlld3NAbGlzdHMubGludXguZGV2LCBjb25vcitkdEBrZXJuZWwub3JnLCByb2JoQGtlcm5lbC5v
cmcsIGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnLCAiTWluIExpbiIgPGxpbm1pbkBlc3dpbmNv
bXB1dGluZy5jb20+Cj4gU3ViamVjdDogUmU6IFJlOiBbUEFUQ0ggbmV0LW5leHQgdjkgNi82XSBy
aXNjdjogZHRzOiBlc3dpbjogZWljNzcwMC1oaWZpdmUtcHJlbWllci1wNTUwOiBlbmFibGUgRXRo
ZXJuZXQgY29udHJvbGxlcgo+IAo+ID4gSGkgQW5kcmV3LAo+ID4gCj4gPiBPbmUgcXVlc3Rpb24g
YmVmb3JlIEkgcHJlcGFyZSB0aGUgbmV4dCByZXZpc2lvbi4KPiA+IAo+ID4gQXMgZGlzY3Vzc2Vk
IHByZXZpb3VzbHksIHRoZSBEVFMgcGF0Y2ggd2FzIGluY2x1ZGVkIG9ubHkgdG8gcHJvdmlkZSB0
aGUgb3ZlcmFsbAo+ID4gRXRoZXJuZXQgZGVzaWduIGNvbnRleHQgZHVyaW5nIHRoZSByZXZpZXcg
b2YgdGhlIGJpbmRpbmcgYW5kIGRyaXZlciBwYXRjaGVzOgo+ID4gCj4gPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9sa21sLzY0YmY2YjQwLWI5NDctNGZmYS04ZDQ4LTRkNjM0MTkzMTMyN0BsdW5u
LmNoLwo+ID4gCj4gPiBGb3IgdGhlIG5leHQgcmV2aXNpb24sIHdvdWxkIGl0IGJlIGFjY2VwdGFi
bGUgdG8gZHJvcCB0aGUgRFRTIHBhdGNoIGZyb20gdGhpcwo+ID4gc2VyaWVzIGFuZCBwb3N0IG9u
bHkgdGhlIGJpbmRpbmcgYW5kIGRyaXZlciBwYXRjaGVzPyBUaGUgY29tcGxldGUgRFRTCj4gPiBl
bmFibGVtZW50IGlzIHBsYW5uZWQgdG8gYmUgc3VibWl0dGVkIGxhdGVyIGFzIGEgc2VwYXJhdGUg
c2VyaWVzIGFmdGVyIHRoZQo+ID4gYmluZGluZyBhbmQgZHJpdmVyIGhhdmUgYmVlbiBtZXJnZWQu
Cj4gCj4gV2hhdCBub3JtYWxseSBoYXBwZW5zIGlzIHRoYXQgSSBnaXZlIGFuIEFja2VkLWJ5OiBv
ciBhIFJldmlld2VkLWJ5Ogo+IGZvciB0aGUgRFQgcGF0Y2gsIGFuZCB5b3Ugc3VibWl0IGl0IGZv
ciBtZXJnaW5nIHZpYSB0aGUgRFQgTWFpbnRhaW5lci4KPiBFdmVyeXRoaW5nIHRoZW4gbWVldHMg
dXAgaW4gbGludXgtbmV4dC4KPiAKPiBXaHkgZG8geW91IG5lZWQgdG8gZG8gdGhpcyBsYXRlcj8g
V2h5IG5vdCBub3c/Cj4gCgpUaGVyZSBpcyBhbiBhbm90aGVyIHNlcGVyYXRlIERUIHBhdGNoIHNl
cmllcwpbaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNjE1MTIyMDE2LjExMTAyMDYt
MS1waW5rZXNoLnZhZ2hlbGFAZWluZm9jaGlwcy5jb20vXQp3aGljaCBpcyB1bmRlciByZXZpZXcu
Ckl0IGFsc28gaW50cm9kdWNlcyBEVCBub2RlcyBmb3IgcmVzZXQsIGNsb2NrLCBwaW5jdHJsLCBI
U1AgcG93ZXIgZG9tYWluLgoKVGhlcmVmb3JlLCBvdXIgcGxhbm5lZCBzdGVwcyBhcmUgYXMgZm9s
bG93czoKMS4gSW4gdGhlIG5leHQgbmV0LW5leHQgdjEw4oCLIHBhdGNoIHNlcmllcywgZHJvcCB0
aGUgRFRTIHBhdGNoZXMsIGFuZCBzdWJtaXQgb25seQogICB0aGUgYmluZGluZ3MgYW5kIGRyaXZl
ci4KMi4gV2FpdCBmb3IgUGlua2VzaOKAmXMgRFQgcGF0Y2ggc2VyaWVz4oCLIHRvIGJlIG1lcmdl
ZC4KMy4gT25jZSB0aGUgSFNQQ1JHIHBhdGNoIHNlcmllc+KAiwogICBbaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjYwNjA1MDYwNzMwLjE2MDUtMS1kb25neHV5YW5nQGVzd2luY29tcHV0
aW5nLmNvbS9dCiAgIGlzIG1lcmdlZCwgc3VibWl0IGEgbmV3IERUIHBhdGNoIHNlcmllc+KAiyB0
byBleHRlbmQgRVNXSU4gRUlDNzcwMCBTb0Mgc3VwcG9ydOKAiwogICBmb3IgYWxsIEhTUCBtb2R1
bGVz4oCUaW5jbHVkaW5nIFVTQiwgZU1NQywgU0QsIGFuZCBFdGhlcm5ldCwgc2luY2UgdGhleSBh
cmUgYWxsCiAgIHVuZGVyIHRoZSBIU1AgYnVzIG5vZGUgZXZlbnRob3VnaCBldGhlcm5ldCBkb2Vz
ZSBub3QgZGVwZW5kIG9uIEhTUENSRyBwYXRjaC4K
