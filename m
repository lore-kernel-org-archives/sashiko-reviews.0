Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870423;
	b=pexhsoMu/8WubbdefGrxik3UqXHrQ6olGViQYEkPGSe0d/KWq2PC97pD3EIeU2cRyEAi
	 JtKPZDGDr8oqWj9Xzrd5HqyRQFIn4TltLxGZWTnYwuBnMic5CSn3KRRiFLJXKs7HAkh2a
	 gFRclATEySaWRuyrLs7UpzaLkB3tBGf+o9SLGnKIVYaYDBvZIGQCe8S38O5WijwmQf5ID
	 CH89pY09igPVseYllqBAhRU1qF+rllEft99e6LuLQoBu17ME/LDOqd7Tnwf5JoW0ClK+Z
	 jw6h19HieE3GBQHdK7rJ/4IuJ2Dqq64IPPlJM6FiLF4UrSsc0ZVKZ/MsgsTsnK4liYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870423;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=1zG5seXGoYlvBJzHn/0HbYBl3NQWQveVdHCEOzhGHtA=;
	b=dwjLFiBrQATtH6U84UzbCRpmZ6YHmmI534zOqsPw7qeDPjXJB9gdbteQW3fK/HLPQMbN
	 ngRRtd0PhyzV9LVgSi69mX9GRxuu1rxZAiF41qWhurXJNWeyUK2hYF0ACQrJzFSfYyggy
	 w1Kycdnl5HsziA4UV3hl1nQEHXC0c2ZHJNHvfTnvec0ftIE0Y3OrB6eAq1oPIM/Bfl3Z2
	 FPXh+VIIzS97njgqAZOjNHAH+OiTH0NW8bzURXJFat4SKm5XOgkXpepuNFXFlWQHxfS4F
	 BJ0TjcV/5ZG+WXMnKqPfIVQXLGepL73w+WSm4s9I04tsW6iGALPFMY37+I7jyvbbCSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=O9ewXwZy;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=H6wVSQ21;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F231560A260C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 23:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F231560A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=O9ewXwZy;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=H6wVSQ21
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870407; bh=1zG5seXGoYlvBJzHn/0HbYB
	l3NQWQveVdHCEOzhGHtA=; b=O9ewXwZy2+/LvZVw5WpYLZv3gaqMOnrpFtC9ETVCXpqJskR2m4
	mWgx9IsKuUNWG5KSvRYbWeNbxEnHLUPcK5CA==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870407; bh=1zG5seXGoYlvBJzHn/0HbYB
	l3NQWQveVdHCEOzhGHtA=; b=H6wVSQ21WHy4mA0yhRSRl2H7LJHhMwmQFYbH38PIVwu837UfR1
	fDHcwSPkNbfStN4oYTN881EvxFv5d91nhzotq2PkM2wbzEUGnyol45aYwKqe72+KXvZIS8RaSuW
	jevT8HG6L2WecgqUlRBXXpw/wufEvCLIpb4D1qLzcQNdiCf8YABVecegSFHTC9ayYmYKonLcaeC
	q4NENRxAW1xUGC40LPs57aATuaGlHOAThrn+QIOrPiEKDxvgeas2F/ZPlzToQfCwqGE4t79vS9L
	Y6w0EveJL2zk7ULdVUvWxIir4FYoNvJjpYLj2PQBdvIC8Xx4s4MWjZ+r8fyOxLfzjXw==;
Message-ID: <01f936dc-20d7-4b63-b3b7-c1e9c841fd11@erebion.eu>
Date: Tue, 17 Nov 2026 00:06:47 +0100
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
Subject: Re: [PATCH v5 06/12] arm64: dts: qcom: sm6350-lena: Enable wifi
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-6-7318a19806eb@erebion.eu>
 <sashiko-outbox-217825@kernel.org>
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
In-Reply-To: <sashiko-outbox-217825@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pWh7rxlbKNUN3h1nSLgB0TyK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pWh7rxlbKNUN3h1nSLgB0TyK
Content-Type: multipart/mixed; boundary="------------ftwDOvZB3FQ6fHFfbCDAPZAD";
 protected-headers="v1"; hp="clear"
Message-ID: <01f936dc-20d7-4b63-b3b7-c1e9c841fd11@erebion.eu>
Date: Tue, 17 Nov 2026 00:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/12] arm64: dts: qcom: sm6350-lena: Enable wifi
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-6-7318a19806eb@erebion.eu>
 <sashiko-outbox-217825@kernel.org>
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
In-Reply-To: <sashiko-outbox-217825@kernel.org>

--------------ftwDOvZB3FQ6fHFfbCDAPZAD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTYvMjYgMjM6NTYsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsDQo+IGlzc3VlIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBhcm02NDog
ZHRzOiBxY29tOiBTaWduZWQtb2ZmLWJ5IGFuZCBBdXRob3IgdXNlIGhhbmRsZSBpbnN0ZWFk
DQo+ICAgIG9mIHJlYWwgbmFtZQ0KDQpUaGF0IHdhcyBhbHJlYWR5IGRpc2N1c3NlZCBpbiB2
MiBvZiB0aGlzIHBhdGNoIHNlcmllcy4NCg0KLS0gDQplcmViaW9uDQoNClhNUFA6IGVyZWJp
b25AZXJlYmlvbi5ldQ0KDQpBY2NlcHRlZCBsYW5ndWFnZXM6IEdlcm1hbiwgRW5nbGlzaCwg
U3dlZGlzaCwgTm9yd2VnaWFuLCBEYW5pc2gNCg0K

--------------ftwDOvZB3FQ6fHFfbCDAPZAD--

--------------pWh7rxlbKNUN3h1nSLgB0TyK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavuMhwUDAAAAAAAKCRCOr0AybgKufVDl
AP9bdsGivDZ+5ZFbswLaeKvB4ixNiCxlnuyaWRGIhA/21wD+PGChG8OLRjLlsi07HgWmxqedE9qi
LYBhIfRgfzyd+QY=
=s4wk
-----END PGP SIGNATURE-----

--------------pWh7rxlbKNUN3h1nSLgB0TyK--
