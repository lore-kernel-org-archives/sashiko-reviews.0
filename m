Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608619;
	b=uGmOKteY06w/hqe3z6y4VPQIFSIil9WQ4M6/pgQ22HG5pgyPgUYY8RCul4AcybtJO9vp
	 7srWLLU/PFd7sRSfrRhk2N3MxegFJ6uwKoZz2chAQRyZpt/JE5fxb+usCcGv3ODQQjd46
	 H3wcCkJIV3jSiTAVTfdp9G5t6hbs76AEnIOFgZQhrzFwIpWmmx3TJuRD6FzfUAq9hV5po
	 ds8FwIZ/farbK05nbiTd2FVipB9Bpk088kBPizgKpmDaaEaDUMiNNkfsQRdvrIiE+m2dt
	 AkxN7rpkEHHlXYwLrtZwdCP+03Ytb2O7XrslJ1ZbULP0N31tDjztQz86wjTSCLBc/nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608619;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=LOCTMQ1srMwoLHdDzXY4ap1GXVFuZ/PHi1A1lWwV1zM=;
	b=E/d2xygNOKc07oVP7t2YCQQLlLGHb9G5kUFe5yUSMkXt6Jwr3/sPD6Gd/oHzuMT+zxan
	 dDJgeQ+c8qo/9NqbPzOureWzc3bG8KhKF8FSvzhGSK6pfuDvaPyMAbd0eJpYHVULl+Pj2
	 iZKBXGg2nY6lgyaIlCdEalnAr4UKUgp8RDxt1bAdAgPUTBT6LRGvdCs2iGcqQhAiehd95
	 +vvLDsklRSWWqhhUnLE8U3lEorkVxnCmMibu49vMQ1A8odqxXRJLyoS65b8E1GXLnR8En
	 x9QKdvoY0kPwcMyQ8SLL2Jo86CrVCoyvpzFb+wtJ6Ni5J4G0di3rlr1yG25uQ4RdEmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="2FLt/AkK";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=Ie5KVRw1;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC29606A326
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 08:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC29606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=2FLt/AkK;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=Ie5KVRw1
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793608605; bh=LOCTMQ1srMwoLHdDzXY4ap1
	GXVFuZ/PHi1A1lWwV1zM=; b=2FLt/AkKxcYYaJqfZj3/Bz3H1cJsYNQL89ggm8T1ATo+FM6Ts4
	Uaxjxaq3YsH1KlpUUzMXLxxxHJrQwmQMOjCg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793608605; bh=LOCTMQ1srMwoLHdDzXY4ap1
	GXVFuZ/PHi1A1lWwV1zM=; b=Ie5KVRw1YO61cNzjzUIQqLDzGb995KaYQQS0AMPyFpj2H+Ki32
	mbMlBJNmdIehHfbJWU0SkpuW9hOcD74kCTZon74XNrq10f2wMU4yFyf+d3pstUVvyEFYOllosrX
	VZxB5v2MOg2ftY5AKLL1Eo4tmWoDeqbA3/o1hoLD2eFjQRvNSRT0prOvP0cw0fXTHiusJJp9YiR
	wn8jV41PxCg7biHE0o3QiR0jfcbCuCs5o+RMRiqYvECDfnddHdixicI+BpslcNmWsjWh0AM3aoq
	qFk9QruJLDRYumMcHUtGglb094PYqEpG7P+kX/dhlxhaU4vdLJeBUf9SJccZc37QxGQ==;
Message-ID: <63c329fc-0ff2-4402-b575-e26e25b3ff8b@erebion.eu>
Date: Mon, 2 Nov 2026 09:36:46 +0100
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
Subject: Re: [PATCH v3 02/12] arm64: dts: qcom: sm6350-lena: rename
 touch-en-regulator
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-2-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192758@kernel.org>
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
In-Reply-To: <sashiko-outbox-192758@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1zMlbbPw2yA7NEha6URysRrv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1zMlbbPw2yA7NEha6URysRrv
Content-Type: multipart/mixed; boundary="------------Yc0R4nlDaTZca2G7LoGTbbzt";
 protected-headers="v1"; hp="clear"
Message-ID: <63c329fc-0ff2-4402-b575-e26e25b3ff8b@erebion.eu>
Date: Mon, 2 Nov 2026 09:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] arm64: dts: qcom: sm6350-lena: rename
 touch-en-regulator
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-2-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192758@kernel.org>
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
In-Reply-To: <sashiko-outbox-192758@kernel.org>

--------------Yc0R4nlDaTZca2G7LoGTbbzt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMi8yNiAwMDozOCwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gVGhh
bmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gYXJtNjQ6
IGR0czogcWNvbTogc202MzUwLWxlbmE6IHN0cmF5IHVudXNlZCByZWd1bGF0b3ItbGNkYi1k
dW1teSBub2RlDQoNCk9oIG5vLCB0aGF0IG9mIGNvdXJzZSBzaG91bGQgbm90IGJlIGluIHRo
ZXJlIGFuZCB3aWxsIHJlbW92ZSB0aGF0IHdpdGggDQp2NCBvZiB0aGlzIHBhdGNoIHNlcmll
cy4uLg0KDQo+IC0gW01lZGl1bV0gYXJtNjQ6IGR0czogcWNvbTogc202MzUwLWxlbmE6IGlu
dmFsaWQgbGVkLW1heC1taWNyb2FtcCBpbiBwbTYxNTBsX2ZsYXNoDQoNCkJvdCBhbHJlYWR5
IGNvbXBsYWluZWQgb24gdGhlIGZsYXNoIExFRCBwYXRjaC4uLg0KDQotLSANCmVyZWJpb24N
Cg0KWE1QUDogZXJlYmlvbkBlcmViaW9uLmV1DQoNCk15IGxhbmd1YWdlczogR2VybWFuLCBF
bmdsaXNoLCBTd2VkaXNoLCBOb3J3ZWdpYW4sIERhbmlzaA0KWWVzLCBJJ20gYSBsYW5ndWFn
ZSBuZXJkLiBGZWVsIGZyZWUgdG8gd3JpdGUgdG8gbWUgaW4gYW55IG9mIHRoZSANCmFmb3Jl
bWVudGlvbmVkIGxhbmd1YWdlcy4NCg0K

--------------Yc0R4nlDaTZca2G7LoGTbbzt--

--------------1zMlbbPw2yA7NEha6URysRrv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCauhLngUDAAAAAAAKCRCOr0AybgKufbAj
AQCugOnQNhF7bSbWnpiRtSybkYyGVFdtISiL0f8r/aViigEAttB4YzFPc7KahhGlrIDPfqGv9VKm
JSWf+3NL/MwMpgc=
=XyV4
-----END PGP SIGNATURE-----

--------------1zMlbbPw2yA7NEha6URysRrv--
