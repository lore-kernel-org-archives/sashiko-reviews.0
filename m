Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618715;
	b=ZrXT6ipAN7CCoAw/LFXar9sNdCaci28KHIW/WN21+Mp+ZwHJ6gS/GN5iIYXY7+iP8YKE
	 UByb8PuOtYZNU9w2h4e/Zp4TuSnV87d2eRKVZrowSTf/69xlH6v+MPof2A5QVH9NT9GRs
	 4k9LcVbXTRSrSMTEJnTDXVq/2X6h4mmhle4Gcl1YYJ24X4cpjuBd0pZn7w3Vvbezr1Lif
	 Yvj0Ng2I7ZSpZZW2A/WpL+ptWDOVIw7wx9BVcilxKfBh694dHndsSPaQAcB9Nkwr+r9H2
	 EsR+PU/+fmAqNnyYoQI5v0P8x/SiT6KzS+tcbQyudPOR2G0CzGcbgZau8ZHclLlzIOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618715;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=Jl6MqUd4ByZxR5XS2vXABv/7IuldpVQ/38egYOhDAkY=;
	b=QllWO3Azbi4dU9gpS6B5xLw6So2ZuCOc/x+47oMbuRBORgxlx9CnIKIXhUUTjT6GSYjS
	 tkrDpjQun3zHeFXfTwKW1UwQDWWFkKhQjJPCX2qlAkPrh7NFLAlFOtNk6wISQQ6Tf5I11
	 usJKKFe92DtcLQPOHvkPClG+shMQax6M2T3HMId7X+xas5sE3hYhaGX0dWPQ63j03UbN5
	 GBs9LYpMYLULofz5CpSX81mrbWAQA+l1PmtyNliqDTfpsXJjY3BbUSHemhSdNaQZ09ag6
	 yDF/V7ZbmBsTRYKhk4Ys2Rihl7l0fHYHgvO2T1MIknvzJ/frTpH31L5xsjuNDQnTWFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=vLewcgaz;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=HmMucyiK;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9525A606A88C
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 11:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9525A606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=vLewcgaz;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=HmMucyiK
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793618699; bh=Jl6MqUd4ByZxR5XS2vXABv/
	7IuldpVQ/38egYOhDAkY=; b=vLewcgazmjilFezUUQTHLwLo3daD42yq+f0Jm+1mrmVsWLgS/i
	Iuo04dS4juwj+rbSDWn0GjngruJetKVi/BBQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793618699; bh=Jl6MqUd4ByZxR5XS2vXABv/
	7IuldpVQ/38egYOhDAkY=; b=HmMucyiKt+cWBeqCVhEigbAHDj+8O+wAP7c9MtlO5H8Ls5FrNv
	1sWC/NgT5BOt4xKWmzbIf0VhExYUsCkGXCjofGFYPAhvlefRrOet/H/Ivb5+E7n0HyLG4p+NeXO
	HRtYl2GAFUnslr7McqpBAfCRrbBitCIMu5+FWG4qexBPEswsgqE7JLO6MbIWwMnAFRVGerZItyb
	IJ783rlW8Vt0SsUjdXjJ/qQCyVgFR8OSKdlQtdmwalbnnD8wRB/0sbffPxzrj5LT8a1ZizrQE7h
	r5U3RfRhQQuw6QTQnZheuyBywvxL0yyT3hNUMf9SRaqIEANK951BO7NIZzZ81jZB1eg==;
Message-ID: <d52c6018-b494-4470-aa4d-a92fcfb280e8@erebion.eu>
Date: Mon, 2 Nov 2026 12:24:59 +0100
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
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: sm6350-lena: enable remaining
 i2c busses
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-12-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192773@kernel.org>
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
In-Reply-To: <sashiko-outbox-192773@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8DJvsePEo8cSfZrcrIfR1weq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8DJvsePEo8cSfZrcrIfR1weq
Content-Type: multipart/mixed; boundary="------------K9q45mfxPccftvc00YuvS9l1";
 protected-headers="v1"; hp="clear"
Message-ID: <d52c6018-b494-4470-aa4d-a92fcfb280e8@erebion.eu>
Date: Mon, 2 Nov 2026 12:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: sm6350-lena: enable remaining
 i2c busses
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-12-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192773@kernel.org>
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
In-Reply-To: <sashiko-outbox-192773@kernel.org>

--------------K9q45mfxPccftvc00YuvS9l1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMi8yNiAwMDo0OCwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gVGhh
bmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
NCBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gYXJtNjQ6
IGR0czogcWNvbTogc202MzUwLWxlbmE6IHVucmVsYXRlZCBhbmQgaW5jb21wbGV0ZSBHUFUg
ZW5hYmxlbWVudA0KDQpzaG91bGQgbm90IGJlIHBhcnQgb2YgdGhpcyBwYXRjaCBzZXJpZXMs
IHdpbGwgcmVtb3ZlDQoNCj4gLSBbTWVkaXVtXSBhcm02NDogZHRzOiBxY29tOiBzbTYzNTAt
bGVuYTogd3JvbmcgQURDIGNoYW5uZWwgaW4gcmVhcl9jYW1fc2Vuc29yDQoNCkJvdCBhbHJl
YWR5IGNvbXBsYWluZWQgd2l0aCBhIHJlcGx5IHRvIHRoZSBQTTYxNTBsIHRoZXJtYWxzIHBh
dGNoLi4uDQoNCj4gLSBbTWVkaXVtXSBhcm02NDogZHRzOiBxY29tOiBzbTYzNTAtbGVuYTog
aW52YWxpZCBsZWQtbWF4LW1pY3JvYW1wIGluIHBtNjE1MGxfZmxhc2gNCj4gLSBbTG93XSBh
cm02NDogZHRzOiBxY29tOiBzbTYzNTAtbGVuYTogdW5kb2N1bWVudGVkIHVudXNlZCBsY2Ri
X2R1bW15IHJlZ3VsYXRvcg0KPiAtLQ0KDQpCb3QgYWxyZWFkeSBjb21wbGFpbmVkIHdpdGgg
YSByZXBseSB0byB0aGUgZmxhc2ggTEVEIHBhdGNoLi4uDQoNCi0tIA0KZXJlYmlvbg0KDQpY
TVBQOiBlcmViaW9uQGVyZWJpb24uZXUNCg0KTXkgbGFuZ3VhZ2VzOiBHZXJtYW4sIEVuZ2xp
c2gsIFN3ZWRpc2gsIE5vcndlZ2lhbiwgRGFuaXNoDQpZZXMsIEknbSBhIGxhbmd1YWdlIG5l
cmQuIEZlZWwgZnJlZSB0byB3cml0ZSB0byBtZSBpbiBhbnkgb2YgdGhlIA0KYWZvcmVtZW50
aW9uZWQgbGFuZ3VhZ2VzLg0KDQo=

--------------K9q45mfxPccftvc00YuvS9l1--

--------------8DJvsePEo8cSfZrcrIfR1weq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCauhzCwUDAAAAAAAKCRCOr0AybgKuffka
AP4hbCOzgx1uY8aVVNWIT9coUtqqkdtjBeEPgAFcxpttQwD/T1zQTYPwO6HRlgT9N29vV7nDXT0b
E8IECfOtMLvpiww=
=BaN+
-----END PGP SIGNATURE-----

--------------8DJvsePEo8cSfZrcrIfR1weq--
