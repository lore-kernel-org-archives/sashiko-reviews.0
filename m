Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870498;
	b=dEn44GXc6AGLekVmXgXJXertRxS9p3MvE7E5Th/ddFaUR1jzvG+1jHMV5ZjJ8n8Q+xRK
	 cjgwZ+YmyPyEvZhdng04azgDjYMbBVhwglxLQLjsJ3m7D5EIHmYUxX4fmDVzs+nRvMB+k
	 6aPbdEBjhVrdmfwqpr0lpHgFZa+Iwuzmb+/4kmAhX3h334tveQH0nSR5zgfbBxLH9eHOg
	 JfLSNh78gRGGsZPlV5tadJFEQVttd2cLz36EvqaoAl7RPbmPsJPvAghoMKkybq1STaq0t
	 Xk7Kka3RzhXcqeO57rmwAa+oEVQJQZZQ0uZiLdzEPd+/dlZhq3waTWnClTfoKC8Umbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870498;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=afPBzVWS7N4ap4n8fQaMs/ueVkncNvOW/sPNK44j9lQ=;
	b=RFuWsOjf8IXFjbOLN1X2SEa/+xmtKViCYDSRDh13tqzcpovJaeozKko8tNyYft6ou0j4
	 lvPxniuIeMhxepmcpz1gN/uzUYYGZJzXTuTtTzhRYZWt10bq5vdYCN5u63ekJfimZ3l5C
	 gl5oWLhjTIbp1O98VFl4MQjHNdtWGlky/r30r/ZSHJLSVsFSaBKMU5NnI3AFygPy8/PZt
	 3ngcyRmSLr3moxWvYrVrHn+sKxWYarJUmkoecIhDLgUDLHNGTwXe6hfxxfoIOSz9sWTE0
	 D1at8dWpENgLWVv3CYr7gMVZfdXaitQGvnMBaG1gqWm8H+nPpKuGR503lN+U/fxtE0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=JfHfsdl0;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=EDgHeiV2;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D296E606A881
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 23:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D296E606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=JfHfsdl0;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=EDgHeiV2
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870490; bh=afPBzVWS7N4ap4n8fQaMs/u
	eVkncNvOW/sPNK44j9lQ=; b=JfHfsdl0Qc2W5CpKu6/27xrbD5z3GkV6adBL1DXx4xwXdAw1HQ
	MhhAAPVEH4lWd+maVXumtT1OoZwyb5KUz8Dg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870490; bh=afPBzVWS7N4ap4n8fQaMs/u
	eVkncNvOW/sPNK44j9lQ=; b=EDgHeiV2MQfvx4i6RdNpqQP3rZbxTm7Y0dc+ToVm9D0AgH0f61
	lY7wyzZZkXapxPFp5sUg3xiIEa9CdPoPwkqTmwWtx931kahmR1dfkQ/Sh6nD7eySsxRN/gHfzbm
	m0DYpHiM86ElBsvJdTQEd5fc22BTBStZo2Vic9ZnQo7jyQ2VsjBOpeBwGJf7fowHxT87t7M76JY
	dFVh2NThO4RGdWvLpNFqx0KpbXmG1mhfRniAawQI6coXpAFCcF4767ve0MVDnNRhBbbjl9GQ0Vp
	HEMIGkd2B5rqMfMZZ0q6rBzXyoxPLTP4Wv8SIMXJvUNG0lpGPJs1SwapFF0/ql4YsDQ==;
Message-ID: <6a4eaa63-3e5a-4368-9ef9-da090170df22@erebion.eu>
Date: Tue, 17 Nov 2026 00:08:09 +0100
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
Subject: Re: [PATCH v5 12/12] arm64: dts: qcom: sm6350-lena: enable remaining
 i2c busses
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>
 <sashiko-outbox-217831@kernel.org>
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
In-Reply-To: <sashiko-outbox-217831@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3D3n7Jn46dFcaDMtJBeaf13T"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3D3n7Jn46dFcaDMtJBeaf13T
Content-Type: multipart/mixed; boundary="------------4GH7kgcIwElKmAHAAFaW4o5l";
 protected-headers="v1"; hp="clear"
Message-ID: <6a4eaa63-3e5a-4368-9ef9-da090170df22@erebion.eu>
Date: Tue, 17 Nov 2026 00:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] arm64: dts: qcom: sm6350-lena: enable remaining
 i2c busses
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>
 <sashiko-outbox-217831@kernel.org>
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
In-Reply-To: <sashiko-outbox-217831@kernel.org>

--------------4GH7kgcIwElKmAHAAFaW4o5l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTYvMjYgMjM6NTksIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsDQo+IGlzc3VlIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBhcm02NDog
ZHRzOiBxY29tOiBoYW5kbGUgdXNlZCBpbnN0ZWFkIG9mIHJlYWwgbmFtZSBpbg0KPiAgICBT
aWduZWQtb2ZmLWJ5DQoNClRoYXQgd2FzIGFscmVhZHkgZGlzY3Vzc2VkIGluIHYyIG9mIHRo
aXMgcGF0Y2ggc2VyaWVzLg0KDQotLSANCmVyZWJpb24NCg0KWE1QUDogZXJlYmlvbkBlcmVi
aW9uLmV1DQoNCkFjY2VwdGVkIGxhbmd1YWdlczogR2VybWFuLCBFbmdsaXNoLCBTd2VkaXNo
LCBOb3J3ZWdpYW4sIERhbmlzaA0KDQo=

--------------4GH7kgcIwElKmAHAAFaW4o5l--

--------------3D3n7Jn46dFcaDMtJBeaf13T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavuM2QUDAAAAAAAKCRCOr0AybgKufaXz
AP9iNihjDLOMEO9fjt7pw/jqYearktPi6wFlnTD0XWSGyAD/UEOyd6BFy9PK+/U+HS717YJiIGF/
9zB0piO9VfsAUg4=
=k6Sb
-----END PGP SIGNATURE-----

--------------3D3n7Jn46dFcaDMtJBeaf13T--
