Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617722;
	b=dBLF6rMq4TezOYYloysfSwut5gNto+zMOVoDt5+kbMemHEoNbizNPqS4Tba3L9/rnASh
	 saXdgYSs+4ukjDFBCI24tbTA6b9+dxm8KZ9JCrO5B190pJe6t6ezF6wcWDss0cmRcb8mx
	 7Yi80ued3qkv2qoiv3Yy6D2C6v2YQubJT7DrgWnEyi7e/cDX0pU+30slBvIH/hHxUj95h
	 hFTM89Bj8EOcFCf1HZ3cSFiAdbBZ9x/Obrjdtl3z4gTGIaLlZxbja0e7M7H7oY5QQ0V47
	 19vbGwXkkZ8fZjmOYbeXOVFyaJOkZJTZADaXvQe6WLEDUGLrvNxFS2/5fgwmU5NztFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617722;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=/FwdiqEL1E7wjC1lZM45czY/I0C6kbRTSzkP+wrpdaE=;
	b=uboygjShx7Gamq9CZ/YZiQTB7EsB7hDq3EEUEwL4x2KyK+ZWmNUyFIQ5dD7npBWkzFcG
	 pqZw5li0NpzIO9f/Zv1RllZI1zXfKekjaJg35SlisiUwsrLe+2kE6cqGhk1geo/RHyLGj
	 gPrhMj+5kunWkNXduDqeKcKoM4ZDwrYeZb3+mN7xEPgTyqYD1HVIj/H6+phglZJ/IwuC1
	 6scKzjDA/kJyDg7B/+UDy0HPXeeVJ+adS1cE7EHDQyg0B4P7UXMAuq4LHNtOp4bORW6uZ
	 VNzeLJzUJ62EPsQ0MSI8fAXZAHZvbUD6Klm5QklKWGWG3U4yUCWqICIoZ4cth1rsD1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=MZLxGlp+;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=wJuk6bGH;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB37606A32C
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 11:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EB37606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=MZLxGlp+;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=wJuk6bGH
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793617704; bh=/FwdiqEL1E7wjC1lZM45czY
	/I0C6kbRTSzkP+wrpdaE=; b=MZLxGlp+0k8QGWJZV98wRrFbJ/FIeUraYjfzx7Ff0eOyBbGXBg
	iTRgyg47oag+6auUhq4ShK0YOoWX+kA+lWBw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793617704; bh=/FwdiqEL1E7wjC1lZM45czY
	/I0C6kbRTSzkP+wrpdaE=; b=wJuk6bGHwGQ4tFSynG6Rk37tLq1jtfsoRRzv6Q0WLh+708IUnY
	iuak8c3LHpchH1uu9dpx4jbXx3UXcHd5GR4TUNXBxjeQbRumulwSAONP4hI4L8XyzYxjgJqL0mR
	7dx6HOcrik+pTn/6vEg4ngpytgTCwAczH0RLQdC4WuaPE3/3SNEaGpeU72xCo5NpbZf9J7eYOub
	o5A0hbWyfhKrq791HNWCgMJXhvYLoKN422rwCVG6GEVqLK8EHydI7dH+8O/G4zUwXW2vwC6DICS
	N3DZco59Q1jnCkvOg3dd5AhiilMWwitl0ERq5HlFYx/gpw393o7tdzmu6ICAceMpV8g==;
Message-ID: <13fe5cc6-d48e-42f3-a6d8-83401c2a4b2d@erebion.eu>
Date: Mon, 2 Nov 2026 12:08:24 +0100
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
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: sm6350-lena: Enable PMK8350
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-8-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192765@kernel.org>
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
In-Reply-To: <sashiko-outbox-192765@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Y0N0KbcBzWjDoz1M0GdtktLG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Y0N0KbcBzWjDoz1M0GdtktLG
Content-Type: multipart/mixed; boundary="------------Hh5BSwsB1xOqcFqoW06n2vWD";
 protected-headers="v1"; hp="clear"
Message-ID: <13fe5cc6-d48e-42f3-a6d8-83401c2a4b2d@erebion.eu>
Date: Mon, 2 Nov 2026 12:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: sm6350-lena: Enable PMK8350
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-8-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192765@kernel.org>
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
In-Reply-To: <sashiko-outbox-192765@kernel.org>

--------------Hh5BSwsB1xOqcFqoW06n2vWD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMi8yNiAwMDo0Miwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gVGhh
bmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gYXJtNjQ6
IGR0czogcWNvbTogc202MzUwLWxlbmE6IGR1cGxpY2F0ZSBxY29tLXBvbiBkZXZpY2UgZnJv
bSBwbWs4MzUwLmR0c2kNCg0Kd2lsbCBkaXNhYmxlIGluIHY0DQoNCi0tIA0KZXJlYmlvbg0K
DQpYTVBQOiBlcmViaW9uQGVyZWJpb24uZXUNCg0KTXkgbGFuZ3VhZ2VzOiBHZXJtYW4sIEVu
Z2xpc2gsIFN3ZWRpc2gsIE5vcndlZ2lhbiwgRGFuaXNoDQpZZXMsIEknbSBhIGxhbmd1YWdl
IG5lcmQuIEZlZWwgZnJlZSB0byB3cml0ZSB0byBtZSBpbiBhbnkgb2YgdGhlIA0KYWZvcmVt
ZW50aW9uZWQgbGFuZ3VhZ2VzLg0KDQo=

--------------Hh5BSwsB1xOqcFqoW06n2vWD--

--------------Y0N0KbcBzWjDoz1M0GdtktLG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCauhvKAUDAAAAAAAKCRCOr0AybgKufb69
AQDKIN2UZJwU4v9BFS956kEjtIiuH8DP13rgxV7+nP+knwD+N+AiSHF3ZCfJxCio2fNieF+bGnEm
77iFbJSIptTvpgA=
=8/iB
-----END PGP SIGNATURE-----

--------------Y0N0KbcBzWjDoz1M0GdtktLG--
