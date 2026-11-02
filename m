Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793582632;
	b=biNBoGzRKyTN6yZnWfiu4dphWYcf9y49Wwqm3FgsmhR0Qe9w3estWfiaSJmhCikgkLXm
	 eL7wzlJbc80ppVn597Ho/M9qcxkzYdtuoD3cjRv5pTCcvOnImMQuV1/Wj0hRArgcjepEu
	 YUGQW5OclCL9VQqKlCSDPefoeHh8T1EfuD8Q3sbMvFujE8o5AsIqk4ONQLvjMuGADUBmw
	 dumDlbYeIcUbNe0dUBTTfgBt8yuB3y8AQPaCo2B87aCwDZH7R8wtKsiGByzSld6OWtF7N
	 N8nnset3YX3UBwksrgL0tgObqwXmmAVtIP4G2/dbdvS+aaufJ2Vu1NEYEulkgIHPruA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793582632;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=oYF6WKJQr7/UET0LEBtfGRVTZHFc4OlWWVDMWmtpkLY=;
	b=v0xja+HRzaftEVoyEDCoitQMHmlaeetqMhOklFvdJVSXkzIntxryyNRYQkvWYDm8EJg3
	 95SBOFCf4rffhk3NL0julV1AJ5Q/rsuBzLvKV2So+fa7dfclj09DJ1Qa2rIF+yYg+4zNP
	 OXMowd6IQyaEc6rGh+MjzkLB6ZnN8tguXAQESzDkmxWd1AIQ5qLUXlk+o3UHthffR0x+3
	 QaidRkHBL9V9eXPdMGLt+K88z3DpvHisT64VpascrZgT3lB91npPNpGlEAQVZl8hMbmKT
	 KwCcInrN4h1wdi2v59xrul6txjtpeIC8a/nT3xz2fZPwNZPjeBtU8fPxaojcAg3/aWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="/xmGjCTB";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=oguozKng;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6DA606A324
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 01:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F6DA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=/xmGjCTB;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=oguozKng
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793582621; bh=oYF6WKJQr7/UET0LEBtfGRV
	TZHFc4OlWWVDMWmtpkLY=; b=/xmGjCTBorFOiRLcreS3l+Z6CWgyiuUHDIYlwzDBRoNPc3ZbB0
	OuGoiEFZjaXNOST6VypfEjalesLA3LSHnqCg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793582621; bh=oYF6WKJQr7/UET0LEBtfGRV
	TZHFc4OlWWVDMWmtpkLY=; b=oguozKngTRlwngDFs2w+bp2m4E1qe/tevr0v2oW7hFiDLh7p2V
	UPwK287tqrPKZkz/LF0b5h83Lb93NmkHBsvA8qdzv4qA35Gr1I/tV4AsufSp+LjAcvKPTtsj4tz
	q8l+JCi6Rz90KmVEskYUyOnk+ipKHPHGKcER8eUfrXBNrw4n7Ekh8MvbI+8ldtSk+naR6SRZrtr
	FeXnhWiLuoL1ITrz3FYQ/YFROo2tN3uI7gVCqwa3ulVUZv8GFaiKUj2PXClmkrAv6Vu82AgFhd4
	QXS5GbUbMTSR+bntIR7OHLPPWjJMHk75DfIIOnBA2jvYQ2khByjsdX8BMy2K5WDIfAQ==;
Message-ID: <bc642f13-d532-46ca-afcf-678c49e8f1cd@erebion.eu>
Date: Mon, 2 Nov 2026 02:23:41 +0100
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
Subject: Re: [PATCH v3 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-4-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192764@kernel.org>
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
In-Reply-To: <sashiko-outbox-192764@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fTwScMSe0Hkot07lqpw0EolE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fTwScMSe0Hkot07lqpw0EolE
Content-Type: multipart/mixed; boundary="------------LgG41laI7Wv0Z1E1Z1jI5cAQ";
 protected-headers="v1"; hp="clear"
Message-ID: <bc642f13-d532-46ca-afcf-678c49e8f1cd@erebion.eu>
Date: Mon, 2 Nov 2026 02:23:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-4-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192764@kernel.org>
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
In-Reply-To: <sashiko-outbox-192764@kernel.org>

--------------LgG41laI7Wv0Z1E1Z1jI5cAQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMi8yNiAwMDo0MSwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gVGhh
bmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0gW0xvd10gYXJtNjQ6IGR0
czogcWNvbTogcmVkdW5kYW50IElQQSBwcm9wZXJ0aWVzIGluIHNtNjM1MC1sZW5hIGJvYXJk
IERUUw0KDQpRdWl0ZSByaWdodCwgZGlkbid0IG5vdGljZSB0aGF0LCBmaXhlZCBpbiB2NC4u
Lg0KDQotLSANCmVyZWJpb24NCg0KWE1QUDogZXJlYmlvbkBlcmViaW9uLmV1DQoNCk15IGxh
bmd1YWdlczogR2VybWFuLCBFbmdsaXNoLCBTd2VkaXNoLCBOb3J3ZWdpYW4sIERhbmlzaA0K
WWVzLCBJJ20gYSBsYW5ndWFnZSBuZXJkLiBGZWVsIGZyZWUgdG8gd3JpdGUgdG8gbWUgaW4g
YW55IG9mIHRoZSANCmFmb3JlbWVudGlvbmVkIGxhbmd1YWdlcy4NCg0K

--------------LgG41laI7Wv0Z1E1Z1jI5cAQ--

--------------fTwScMSe0Hkot07lqpw0EolE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCaufmHQUDAAAAAAAKCRCOr0AybgKufWtX
AP4jK3dW/YOnu3EA0gqJMHxm/kZhJNPVapyjUZ7azijPHAEA1HQcddR5TgtF7N553oiD98cI0j4l
1Jz1+6Yz3oXRDgY=
=S2ah
-----END PGP SIGNATURE-----

--------------fTwScMSe0Hkot07lqpw0EolE--
