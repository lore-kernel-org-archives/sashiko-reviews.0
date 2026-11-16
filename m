Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870405;
	b=r8M4GMBMImxX1QVPUZ1xeZlBVBalFDX8uaG6rqQTnbOwc32hLLaX/LjW4w2gf5HvtYyX
	 3CQZdlxspJj+z9K6KqR1OMypSRP2kmrCv+N8wZSYqoHV8pzOS/xKQVmLXFg3oEgE2XOGG
	 hu81rNglsJ+QdV/Cc83FJSVdrU9C0lwkeHE5JuzKA6HAqaWgN26t7gVU4mvklqJIKwa0/
	 pda5LJk4FyfmYEB5tmnUQepf2tYk/5TNJh4MRhXZd3pCwIsWX+tvAv5Gjp5NweLrQ+a9k
	 8eJ1vOUZIunz94YSefxSIdXJnyfU+DsbHdc3NdNojn2F2mhOBmtWz4mIocYFS3S40Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870405;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=2hMZLJA5E2nVyyEpRvgzw1ttFTQKHQbhJeeZU/8aMAY=;
	b=0IToE2Qhbk+iDZxFGbTuC627xgUw9vDDBiKvkFEZ9UypTHI3P1xBguDwYs8lOIsxEPP/
	 a5J9JHFLPKsgZY5/KW2ojdVwRT5qDsENGDxQGvv8wXuf+FsAK+iJMQSSk2NbVU1pFdTZt
	 OeHadpXJ4YBwVb9Qyrt2zXSgG7+exdpeukhQGFQy4Xt/Yzt2LHSMfJkyQ4WsgC9QEer+g
	 66VzZ/lm0py822Hh5riE5vAHiqsZXq3kaW240drAi0WVMkktC8W9v7GleKmXXqmSYyuN8
	 SQsSXE/2Bk0IwsJgtSiPDIzFC3LnaCl/qwptltc7ApOaGteS6+6dOR6Tmpe8oodbevQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=fi+FhrZx;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=pr4yfOdl;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830E9606A32A
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 23:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 830E9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=fi+FhrZx;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=pr4yfOdl
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870391; bh=2hMZLJA5E2nVyyEpRvgzw1t
	tFTQKHQbhJeeZU/8aMAY=; b=fi+FhrZx8PgtIctAjJXmLjj+6ZsJoaelxjZJkutRNDZMMCaa8n
	SInLKbXCxv2803cHhbpteWLSFQju4lVR3nDw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870391; bh=2hMZLJA5E2nVyyEpRvgzw1t
	tFTQKHQbhJeeZU/8aMAY=; b=pr4yfOdl/dIFcVD2aBJFJJSmU89mghZL9I1fDgqfCQ+cHtGZWV
	keWVDWJHTwSxNRiZPnj1CjpFxl6eRA5aJeP5b1CqQf0eKHYbs3A7OajS0Uz9BooyImgerr3S17i
	dnUau9Y7deBxyTpVGXUAH4cwsH4uKCyitf6FgEENS0RETbWn0zu0ix39XHb1TrjbjvVlZeFGWw/
	zr8C3Ndv6p/+YfMwMbb8Iyzew3yZnVOIV0Eujh1SdPYY4WrIg4YZz/rtJIV2PHnEWDeKLM+MZc6
	+DHlYDnf7YLvnG70pE/L/0a+H7zwlTckqDG0qIzxgfMD6X4FVJ+eOiZJUzrkzHSmVGw==;
Message-ID: <0eb630f6-dc31-4300-a105-a0c74c6cbddd@erebion.eu>
Date: Tue, 17 Nov 2026 00:06:31 +0100
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
Subject: Re: [PATCH v5 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>
 <sashiko-outbox-217826@kernel.org>
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
In-Reply-To: <sashiko-outbox-217826@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UVhvaGHvk5M3qS8js8orDHV2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UVhvaGHvk5M3qS8js8orDHV2
Content-Type: multipart/mixed; boundary="------------Gxec85njpFUkzUlwM0smqxVF";
 protected-headers="v1"; hp="clear"
Message-ID: <0eb630f6-dc31-4300-a105-a0c74c6cbddd@erebion.eu>
Date: Tue, 17 Nov 2026 00:06:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>
 <sashiko-outbox-217826@kernel.org>
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
In-Reply-To: <sashiko-outbox-217826@kernel.org>

--------------Gxec85njpFUkzUlwM0smqxVF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTYvMjYgMjM6NTYsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsDQo+IGlzc3VlIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBhcm02NDog
ZHRzOiBxY29tOiBTaWduZWQtb2ZmLWJ5IHVzZXMgaGFuZGxlIGVyZWJpb24gaW5zdGVhZCBv
Zg0KPiAgICByZWFsIG5hbWUNCg0KVGhhdCB3YXMgYWxyZWFkeSBkaXNjdXNzZWQgaW4gdjIg
b2YgdGhpcyBwYXRjaCBzZXJpZXMuDQoNCi0tIA0KZXJlYmlvbg0KDQpYTVBQOiBlcmViaW9u
QGVyZWJpb24uZXUNCg0KQWNjZXB0ZWQgbGFuZ3VhZ2VzOiBHZXJtYW4sIEVuZ2xpc2gsIFN3
ZWRpc2gsIE5vcndlZ2lhbiwgRGFuaXNoDQoNCg==

--------------Gxec85njpFUkzUlwM0smqxVF--

--------------UVhvaGHvk5M3qS8js8orDHV2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavuMdwUDAAAAAAAKCRCOr0AybgKufb9D
AQCOWzqhXJtm03smLT0dGFMiesohwEamlkB7DZK1loIItQEAmND50pB5gr2NxU/XRoofOn89XSuD
Wa9Z3JceFQF9Pgk=
=hwP5
-----END PGP SIGNATURE-----

--------------UVhvaGHvk5M3qS8js8orDHV2--
