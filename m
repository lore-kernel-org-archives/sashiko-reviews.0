Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870443;
	b=chbS0tjkCLPAcX0PWJK0cuaeXDoyUyQczIoVYC0WC75K0dbpE48thyb707XQtWxJM1OP
	 4lrvOGZ0EATtlA2HlAmChVAswmeq3LBjqyFA1cUmMhTSWnSM822VPIxSqrhfLJow/Dd6E
	 makWUCgO4uLwCqwNxZes0qS6rAtOgx7l5f9srZACbldC8/3fuZ+vMxe5eU5t9jonJSW20
	 KUQdbCOe0N8Rl1P/zFY0b6r+qwzgMnaFaTI364izDbPlCjLMp3FC/WFP9KzsyLhAKebsv
	 oq/KONzplgFK1heEaxaowAZ6fEf3DvEKqY32myCmN9iaRNJCFlykQCc6S4KM0u1/q2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870443;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=dgVi1lSEVS5fXXjdRzv7djQJvqWh8HDW0N9iCRl4qsw=;
	b=OI3/M/UnNXMLXm9EwinWwN8ZnWOv6/aaR0azzlBJgaKkhtXCgt1irK8IUCXQM0dghE6v
	 YqncXagL5BfqeVlt3wmSdCh53vWKyTRFakedKvoyA9N0Up0VNEA0MhhAZztEi0llU4n5w
	 jECZ7pFRDHVxUy8FfpJMMLZD5eVg+0EFy/vUMyV3gAyNiF6cPAFTnwrsJlMIRfVqFqyiI
	 maBTyT5+8Xd0Larj4IcW8wSnBGemDzpVni2hfIFAxRR5Mghbyf1xAXnyBPrgThbvR8P0K
	 5WxEpdWv5RS+mjpt9Od9ATKfv0sR7sXXI72JHZdhX0Za+9S5pQwpuRleAKou6jEEP5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="p/ggoG3V";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=js5nup7T;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C495D60A3816
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 23:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C495D60A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=p/ggoG3V;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=js5nup7T
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870419; bh=dgVi1lSEVS5fXXjdRzv7djQ
	JvqWh8HDW0N9iCRl4qsw=; b=p/ggoG3V+qegmChgzY0i8FW1+vCT2wVhgVvHcdA2ml0QlAdFbf
	B/SWf5CMto7vzPt7nNrVbEk01AnyvW840sCw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870419; bh=dgVi1lSEVS5fXXjdRzv7djQ
	JvqWh8HDW0N9iCRl4qsw=; b=js5nup7TsEzu5vu4XWfd7CjBN8+5XPs0MX7rkntxhXSkEr7Ocu
	B0/C3NS0nIN6XQDclL4AU3h3ekVDrvS1E7UWb8eTEXyoUzrkhUtZdiX4DwtCMH3Ff8sF+v8nNLH
	kEjGk674mRIOw0pEUuI4YfBPme15BdlzIHAN48vnDrdSN9VrI8Ffcl+Xvjg9PXRLkD9fxnx6Umj
	lcO7u5XwnZ26rvJKYwKMIrNg0hg6Cd0G0WehgYIB2J3cM78fTOaTaGKHYogt+Mxg/+rwGdu8/d8
	8usk9t/8I1wPfl307L6Fl+ucd0rupAbUhet059ikv3Ji/FUT4+xjrPR+NsNhC/bzamA==;
Message-ID: <d2c72eff-3134-43d6-9fdf-16809a98631c@erebion.eu>
Date: Tue, 17 Nov 2026 00:06:59 +0100
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
Subject: Re: [PATCH v5 07/12] arm64: dts: qcom: sm6350-lena: Enable PM7250B
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-7-7318a19806eb@erebion.eu>
 <sashiko-outbox-217847@kernel.org>
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
In-Reply-To: <sashiko-outbox-217847@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4a5WKrErbIXw8eSUGi81Gmv4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4a5WKrErbIXw8eSUGi81Gmv4
Content-Type: multipart/mixed; boundary="------------AQWDgadLAbaR9onZYEqN1aI0";
 protected-headers="v1"; hp="clear"
Message-ID: <d2c72eff-3134-43d6-9fdf-16809a98631c@erebion.eu>
Date: Tue, 17 Nov 2026 00:06:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/12] arm64: dts: qcom: sm6350-lena: Enable PM7250B
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-7-7318a19806eb@erebion.eu>
 <sashiko-outbox-217847@kernel.org>
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
In-Reply-To: <sashiko-outbox-217847@kernel.org>

--------------AQWDgadLAbaR9onZYEqN1aI0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTcvMjYgMDA6MDYsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsDQo+IGlzc3VlIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBhcm02NDog
ZHRzOiBxY29tOiBTaWduZWQtb2ZmLWJ5IHRyYWlsZXIgdXNlcyBoYW5kbGUgaW5zdGVhZCBv
Zg0KPiAgICByZWFsIG5hbWUNCg0KVGhhdCB3YXMgYWxyZWFkeSBkaXNjdXNzZWQgaW4gdjIg
b2YgdGhpcyBwYXRjaCBzZXJpZXMuDQoNCi0tIA0KZXJlYmlvbg0KDQpYTVBQOiBlcmViaW9u
QGVyZWJpb24uZXUNCg0KQWNjZXB0ZWQgbGFuZ3VhZ2VzOiBHZXJtYW4sIEVuZ2xpc2gsIFN3
ZWRpc2gsIE5vcndlZ2lhbiwgRGFuaXNoDQoNCg==

--------------AQWDgadLAbaR9onZYEqN1aI0--

--------------4a5WKrErbIXw8eSUGi81Gmv4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavuMkwUDAAAAAAAKCRCOr0AybgKufVtW
AQD5viIiUy5edlj6XLpH/Z2I++aJO2She2lwrF59sigp1AD6AkDICppoZYg2o5GwXcc2yNQiW0uw
fGgx3by9BEbPTAg=
=iq0i
-----END PGP SIGNATURE-----

--------------4a5WKrErbIXw8eSUGi81Gmv4--
