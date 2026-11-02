Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609276;
	b=A9rF3ZFdgLIeT3nzKDggFf/FnYuItrBKBfLnh5Ia6ltZJwWBeC0Vdg07jAy7eF0UCBwb
	 FcBAjHzEX5YRgPjybA43OBvcC8c7NP/B7pcqoVa+LGKPW3VdvaPAD0nRnmN9xTZghAQjB
	 /O7TFCdGMB1mTEJGaG0BRnlVDe7wszUaWiak95zz7qbdleBJVaOX6p48cplrFK1MbZ1Gv
	 ydtoqry6mFdi8dv0NHS0sghPo6B6SBKqMV2svIyqRMwGrFCr8Y2in0HvLFPpGPznKvQ+z
	 vfYgGFgTLMKInIKyvYH/HZRAkXsYoQuG4tXqOoJu/kqLD68K3h/erbUt/O1nRlkSVTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609276;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=hZHtVE4qd9DYb5N/5XOjcgGSd6FAQlcmL56vir1tLWY=;
	b=bEcEbc3oQFAI0JuAtDWM4yI60LCVuXfZi9TcqsSxR+ixLhi9WRDHn0IcDwPIsNbw+Zw/
	 tgHsFRYfNORx3W+FiFdq/YYhgiIXKAffiCtDRTG4hA6d2DPMFNPtqy6ybyAQHDVNkCC2t
	 JtPpOwao/BR+yDX+mYCiqkOv0IPaoZdeEnwuRQHY/e7q8DEEmnm3oJa2kdbyPoLeoAA/0
	 FMcq8kPw1inU7Uqse5D6NDj5mViSrEsxjO490CkLgaJCYgavD6BGnK1JeWMdZ9OECjKxk
	 dFgCz5pRCjI0YvuoqmC1nn7htFQ6TREapfiyZYW/P8DdrvUtMs3JzRDYdKdC+1M+tVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=dVhnM4tl;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=n0FbTmzK;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2700C606A329
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 08:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2700C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=dVhnM4tl;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=n0FbTmzK
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793609264; bh=hZHtVE4qd9DYb5N/5XOjcgG
	Sd6FAQlcmL56vir1tLWY=; b=dVhnM4tl0n13m5KRxhifmUIJth2R1QHle+gJGVpjlztRHML4vA
	XX0UpbVrXJLoLuM+FpX6f3nqJhAtDUGtJFDg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793609264; bh=hZHtVE4qd9DYb5N/5XOjcgG
	Sd6FAQlcmL56vir1tLWY=; b=n0FbTmzKMJxuOhj7K/KtxAR31klclch4CevL7wvJfdTJDg+W1W
	PTSeW8CFu2Bm8x13WKB37bbO0kWUx0CCdnoPOXfJjQoMDqeWYEZIl5YmyuLeFFNJqFWbLtKw/M9
	uWL8wa5SxUzfYiLRkriGW8EtLgDvQeb5ImZ/61QQx8PD0m8deOdGFm4tobsA7g2B4ADgksJA5fB
	mZw2zkZfaIrsTecReK9tBN4hCkJXf5tsvbuNXFw20S6rErH+MQX1p2WV3jRRWovqh+2BeJ5h3HR
	Yiv1UziwZ84kNTy3l9R/5DtxeOkZ0Q8eGcDabFODak+P223xw3sFWsQpdbIY83QBiyQ==;
Message-ID: <e43cf8cb-2bd5-48ba-9ba5-cc81c46bbc8a@erebion.eu>
Date: Mon, 2 Nov 2026 09:47:45 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] arm64: dts: qcom: sm6350-lena: Add flash LED
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-1-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192760@kernel.org>
From: erebion <erebion@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <sashiko-outbox-192760@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wnHmBNF31cfelGivPGPUGxTl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wnHmBNF31cfelGivPGPUGxTl
Content-Type: multipart/mixed; boundary="------------cbp6GNSF4M5YcfinY67Dm0aM";
 protected-headers="v1"; hp="clear"
Message-ID: <e43cf8cb-2bd5-48ba-9ba5-cc81c46bbc8a@erebion.eu>
Date: Mon, 2 Nov 2026 09:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] arm64: dts: qcom: sm6350-lena: Add flash LED
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-1-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192760@kernel.org>
From: erebion <erebion@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <sashiko-outbox-192760@kernel.org>

--------------cbp6GNSF4M5YcfinY67Dm0aM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMi8yNiAwMDozOCwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gW1Nl
dmVyaXR5OiBNZWRpdW1dDQo+IElzIGxlZC1tYXgtbWljcm9hbXAgPSA8MTUwMDAwMD4gaW4g
cG02MTUwbF9mbGFzaCBpbnRlbmRlZCBoZXJlLCBvciB3YXMgYSBsb3dlcg0KPiBjb250aW51
b3VzIHRvcmNoIGN1cnJlbnQgbGltaXQgc3VjaCBhcyAxNTAwMDAgdUEgbWVhbnQgaW5zdGVh
ZD8NCk9oLCB0aGF0J3MgYSB6ZXJvIHRoYXQgc2hvdWxkIG5vdCBiZSB0aGVyZSBhbmQgc2V0
IHRoZSB2YWx1ZSAxMHggaGlnaGVyIA0KdGhhbiBpdCBzaG91bGQgYmUuIFdpbGwgZml4IGlu
IHY0IG9mIHRoaXMgcGF0Y2ggc2VyaWVzLg0KDQotLSANCmVyZWJpb24NCg0KWE1QUDogZXJl
YmlvbkBlcmViaW9uLmV1DQoNCk15IGxhbmd1YWdlczogR2VybWFuLCBFbmdsaXNoLCBTd2Vk
aXNoLCBOb3J3ZWdpYW4sIERhbmlzaA0KWWVzLCBJJ20gYSBsYW5ndWFnZSBuZXJkLiBGZWVs
IGZyZWUgdG8gd3JpdGUgdG8gbWUgaW4gYW55IG9mIHRoZSANCmFmb3JlbWVudGlvbmVkIGxh
bmd1YWdlcy4NCg0K

--------------cbp6GNSF4M5YcfinY67Dm0aM--

--------------wnHmBNF31cfelGivPGPUGxTl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCauhOMQUDAAAAAAAKCRCOr0AybgKufXbr
AQDf35KRbSht2jD16GFLEj3tNhDwyd9vVuQlg6ENEIf+ygD+Ps+SyrK27L48NK/lEEKkr/TokFbd
wWFCjwBGVf1OGg0=
=mluI
-----END PGP SIGNATURE-----

--------------wnHmBNF31cfelGivPGPUGxTl--
