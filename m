Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870465;
	b=ozk1fGIkPckfYWV+jSjhdXvFbjGcu8kumQVL0YmDPwUE9QZJvPp+O5apWtgKLAnyr/Vt
	 FZ3SbxDspIzPSKWBt5/foaIw07znvW05R+8s9YjD+L2hSchzJUUa/xW0E5LAxESZHSgww
	 /R5TeMmmL9Z/FvfB3qMgC+ZLVTAn8FnpLaI3YGzboU459iXoj8QhPdFu7fx9r5H+V8iyX
	 WkC/4QtkavTtB0AVGzQPMsYoaBk9yOAAgLblH4DN2VZw+7D64pwg05EuyxUIM4lbe2Z9y
	 raMLrJDR2DBHkZSe3Z3F8/u6tHxtXZvU7eiyrfcva+wILLpJPpnj5y/L95be3svG9Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870465;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=8+3U529qd98YQA4pnP8Fc2UR/OHyX4N7wio2v6kJcCs=;
	b=V9komjP6PPz1OlGk5MbY9ck8/i3t5J5O8RFX1iebynVJPch8/ZyXNo784BZ5aKeUicRT
	 0B2GyJZ/OpOSB6HeZfKWAQ/7hLqomatulFKGfhC36yRQRYCQe95RndnRjHVhs+n8BqZfA
	 DBbiaFNMXqsWn2twQX6DxP3XRs6gRnwv5vITvdxk1gU7c2k51/jTgROUrS6MU7KDOb+yM
	 q/gu8O8vU7ZiLauO4pJK6AlLW8GCmN93u6TuGeHXZbJ3OHCC0919yjE8yVHHctoEGsuve
	 +1QKodNWOUIfeMQE2Ms0VVEjx7vf21z3rL50/BmiZxn2tpAuGgonMg3ZR6EJrtE0gPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=60q11bcJ;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=ooCejUep;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63365606A898
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 23:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63365606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=60q11bcJ;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=ooCejUep
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870464; bh=8+3U529qd98YQA4pnP8Fc2U
	R/OHyX4N7wio2v6kJcCs=; b=60q11bcJiNMgCW+li2uUR8ofFJeC6OOl5bTBk3miDpXMF1dPiy
	MMpvSUahT1Z4Wk3F7WaHl6aNPEGaohKUShDg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870464; bh=8+3U529qd98YQA4pnP8Fc2U
	R/OHyX4N7wio2v6kJcCs=; b=ooCejUeps+mWMliB0nJ+m8yBz1LWyIVXPhaS0PmB+e9wAUgiJ9
	FlU2flXs5KO1+Q3A4Nn3jd5DB3Ci3Souf9G0oWP6UpnvwSCtX8QDV7eH4alNocYzp5vqK13OwNH
	wWtg4CWZqlomhv9kFnFCuimGHojR0kPe4jRAfp+NZltHzWg8weG+9fYJffyIsAY23VGoRo007BO
	ziu4zkDHK19BiCsbHNuff2YN717w64d7i2ReQ2Utbjed5STQXKxFGZW8WELqhk8DkyzAh0Xe1Zc
	nYxwIVlpx7Zf3OSmhwQe2hqWopW+KM8x62l7oFXvfwi0I7PHm4QeGPX5We/qk1TRN/Q==;
Message-ID: <65722de3-1a7a-4be4-87c3-db553ffe3f02@erebion.eu>
Date: Tue, 17 Nov 2026 00:07:43 +0100
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
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sm6350-lena: Add PMK8350
 thermals
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>
 <sashiko-outbox-217832@kernel.org>
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
In-Reply-To: <sashiko-outbox-217832@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5WWZRXgWmTAmybL0yLwsA4Su"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5WWZRXgWmTAmybL0yLwsA4Su
Content-Type: multipart/mixed; boundary="------------JjcnBEAqzdKFJPiL08fgFnv0";
 protected-headers="v1"; hp="clear"
Message-ID: <65722de3-1a7a-4be4-87c3-db553ffe3f02@erebion.eu>
Date: Tue, 17 Nov 2026 00:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sm6350-lena: Add PMK8350
 thermals
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>
 <sashiko-outbox-217832@kernel.org>
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
In-Reply-To: <sashiko-outbox-217832@kernel.org>

--------------JjcnBEAqzdKFJPiL08fgFnv0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTcvMjYgMDA6MDAsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsDQo+IGlzc3VlIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBhcm02NDog
ZHRzOiBxY29tOiBTaWduZWQtb2ZmLWJ5IHRyYWlsZXIgdXNlcyBoYW5kbGUgaW5zdGVhZCBv
Zg0KPiAgICByZWFsIG5hbWUNClRoYXQgd2FzIGFscmVhZHkgZGlzY3Vzc2VkIGluIHYyIG9m
IHRoaXMgcGF0Y2ggc2VyaWVzLg0KDQotLSANCmVyZWJpb24NCg0KWE1QUDogZXJlYmlvbkBl
cmViaW9uLmV1DQoNCkFjY2VwdGVkIGxhbmd1YWdlczogR2VybWFuLCBFbmdsaXNoLCBTd2Vk
aXNoLCBOb3J3ZWdpYW4sIERhbmlzaA0KDQo=

--------------JjcnBEAqzdKFJPiL08fgFnv0--

--------------5WWZRXgWmTAmybL0yLwsA4Su
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavuMvwUDAAAAAAAKCRCOr0AybgKufSkB
AQDtYQbjaZLozYYTWk/wQwfYDg0In3HWNYsKheTxEPQIWQEAmYKeDShJC1rsttQcFnOWzd+tF7Bd
FOSYQiXbBiw2zgg=
=Uzh6
-----END PGP SIGNATURE-----

--------------5WWZRXgWmTAmybL0yLwsA4Su--
