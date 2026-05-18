Received: from mail.eswincomputing.com (mail.eswincomputing.com [123.124.195.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672443E0257
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 06:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.124.195.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085322; cv=none; b=Y+bXqFSZgQwLMuSRRLFq3qtGrtnFjcLIwDxLXi1cJcxNa1ZmBIQobCXYJLUfZJ7Nx4j5SafugL61tWnPIrDWbD/uwkf/c5iuXQ40u3A/WKWvXVDXd/29HAXY6mxiOXhZvykTRGejvdN/Y/E/5hgW00dzYV7hhquQ4K43ILHVP/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085322; c=relaxed/simple;
	bh=Y20Ds8Qt4A+0IswD78M8o8++pnWh8jQGVCd/QoQilJI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=EeVR1esRohppaXzjxTxoDzE9TXOvhOvA8o5mXc47mk2YI74cXJ3QKVEwUWxZrdUDTkGEzp1OLt71MkPYsrQ9Hzw+lvqrSsMufbst9BwwQc2xwxbw/61alUrwszpM40sQ9w2QXljDCVBDUG4WzvFzaajt2HGF81grii8njTTYI8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=123.124.195.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Mon, 18 May 2026 14:21:11 +0800 (GMT+08:00)
Date: Mon, 18 May 2026 14:21:11 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: sashiko-reviews@lists.linux.dev
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, huangyifeng@eswincomputing.com,
	dongxuyang@eswincomputing.com, benoit.monin@bootlin.com,
	bmasney@redhat.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v5 3/3] reset: eswin: Add eic7700 HSP reset driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260514195305.C4132C2BCB3@smtp.kernel.org>
References: <20260514114738.1641-1-dongxuyang@eswincomputing.com>
 <20260514195305.C4132C2BCB3@smtp.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <46181743.64a6.19e39bee0c7.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgAnPJ_XrwpqtFcaAA--.4269W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAgELAmoJ7hIa-
	gAAsx
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiAKPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBm
b3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoKPiAtIFtMb3ddIE1pc3Npbmcg
YCNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD5gIGZvciBtb2R1bGUgbWFjcm9zLgo+IC0tCj4gCj4g
Y29tbWl0IDA4MjgxZjA1OTZhNzY0ZTE5MWNiZWNmZDlkYzEyYjBiNTFmNjczMGYKPiBBdXRob3I6
IFh1eWFuZyBEb25nIDxkb25neHV5YW5nQGVzd2luY29tcHV0aW5nLmNvbT4KPiAKPiByZXNldDog
ZXN3aW46IEFkZCBlaWM3NzAwIEhTUCByZXNldCBkcml2ZXIKPiAKPiBUaGlzIGNvbW1pdCBhZGRz
IGFuIGF1eGlsaWFyeSBkcml2ZXIgdG8gc3VwcG9ydCB0aGUgRVNXSU4gRUlDNzcwMCBoaWdoLXNw
ZWVkCj4gcGVyaXBoZXJhbHMgc3lzdGVtLiBUaGUgcmVzZXQgY29udHJvbGxlciBpcyBjcmVhdGVk
IHVzaW5nIHRoZSBhdXhpbGlhcnkgZGV2aWNlCj4gZnJhbWV3b3JrLgo+IAo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcmVzZXQvcmVzZXQtZWljNzcwMC1oc3AuYyBiL2RyaXZlcnMvcmVzZXQvcmVz
ZXQtZWljNzcwMC1oc3AuYwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAw
MDAwMDAwMDAuLmJkZDRmNWUzZDdhNzYKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2RyaXZl
cnMvcmVzZXQvcmVzZXQtZWljNzcwMC1oc3AuYwo+ID4gQEAgLTAsMCArMSwxMTIgQEAKPiA+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gKy8qCj4gPiArICogQ29weXJp
Z2h0IDIwMjYsIEJlaWppbmcgRVNXSU4gQ29tcHV0aW5nIFRlY2hub2xvZ3kgQ28uLCBMdGQuLgo+
ID4gKyAqIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4gPiArICoKPiA+ICsgKiBFU1dJTiBFSUM3NzAw
IEhTUCBSZXNldCBEcml2ZXIKPiA+ICsgKgo+ID4gKyAqIEF1dGhvcnM6IFh1eWFuZyBEb25nIDxk
b25neHV5YW5nQGVzd2luY29tcHV0aW5nLmNvbT4KPiA+ICsgKi8KPiA+ICsKPiA+ICsjaW5jbHVk
ZSA8bGludXgvYXV4aWxpYXJ5X2J1cy5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4K
PiA+ICsjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3Jlc2V0
LWNvbnRyb2xsZXIuaD4KPiAKPiBUaGlzIGlzbid0IGEgYnVnLCBidXQgc2hvdWxkIHRoaXMgZmls
ZSBleHBsaWNpdGx5IGluY2x1ZGUgPGxpbnV4L21vZHVsZS5oPj8KPiAKCkhpIFNhc2hpa28sCgo8
bGludXgvbW9kdWxlLmg+wqB3aWxsIGJlIGluY2x1ZGVkIGluIHRoZSBuZXh0IHZlcnNpb24uCgpC
ZXN0IHJlZ2FyZHMsClh1eWFuZyBEb25nCgo+IFRoZSBjb2RlIHJlbGllcyBvbiBtb2R1bGUtc3Bl
Y2lmaWMgbWFjcm9zIHN1Y2ggYXMgVEhJU19NT0RVTEUsCj4gTU9EVUxFX0RFVklDRV9UQUJMRSwg
TU9EVUxFX0xJQ0VOU0UsIE1PRFVMRV9BVVRIT1IsIGFuZCBNT0RVTEVfREVTQ1JJUFRJT04KPiBs
YXRlciBpbiB0aGUgZmlsZS4gUmVseWluZyBvbiBhbiBpbXBsaWNpdCBpbmNsdWRlIGNvdWxkIGxl
YWQgdG8gdW5leHBlY3RlZAo+IGJ1aWxkIGZhaWx1cmVzIGlmIGhlYWRlciBkZXBlbmRlbmNpZXMg
Y2hhbmdlIGluIHRoZSBmdXR1cmUuCj4gCj4gLS0gCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNTE0MTE0MjEyLjkwMy0xLWRvbmd4dXlh
bmdAZXN3aW5jb21wdXRpbmcuY29tP3BhcnQ9Mwo=
