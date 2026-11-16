Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870454;
	b=tj0iVjCGw+WHMjsUcr+JVDzl+MWuGbjWET40+rv6xGN8u7eeckudpJWQQdZP8Fkv64n+
	 nIT/IgcC8vpKkwYWoHwZkjn3bTAeKwS7yULu3piyt5DHsnMQoaH7xbcAmIS04dAvMl0zo
	 uuwOF0j3utsVGGqiOKQ9odomDI656mTWD+07RW0r7UdPt67fgImlz2IJXgzgqcADd6KFs
	 cRM3LfpjNQJwb0UWP6YO0vkqJMddRrPjAHsyRxWkzzRES1+EFHllL271XcWIMiyugDZYX
	 Rs5zQsbVNiF8D2GXxkJ2havmoY6AUmIOv5vJGF1M1z0oTsoUaNaMovhjHMxLWytsMjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870454;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=qpEC0B8EjYpcr5XWQf31rELd6g/+I4r53svfv9yqoyk=;
	b=UDUzkxbEgAWYX1evIBY81liLSkWP3JGDUp76DuoTt9d0PWkEob5NiloZA+RHzQIKqmYQ
	 hBgTz/vw1Falvk01kINsg0pQ0/NdpSxzVxeln4uQB40PFv1A4Wdo/hpTehqatWm5XD2+7
	 zCyjy27sBSXxQKJFp/Nir/9mFIQaETL0tYPDMM6DkDkGyrceVOJvDCtLhoYn6327nS0ln
	 UvGYlG3uhqiWH01aQT0PhXmHMZE8W+qMjDZhyRALP7m1t3Z2mgk1NsOjYT66gKAu/TCWr
	 eeOdLiFGr2tJVTan2nFZj/nnZ/zhl6MQOAlDFx0p6nNFUxrGqtJklOznQPpQnj71I+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="/6pXpDBx";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=miWDyWlJ;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5742B606A8A5
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 23:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5742B606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=/6pXpDBx;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=miWDyWlJ
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870450; bh=qpEC0B8EjYpcr5XWQf31rEL
	d6g/+I4r53svfv9yqoyk=; b=/6pXpDBxlQ7kiitiPsIJYgwgFjCYJrdJapSMs51oppPKIcEogB
	k7Z2js0rccU7NYrT8+yKbr1hyjtN90FTejCA==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794870450; bh=qpEC0B8EjYpcr5XWQf31rEL
	d6g/+I4r53svfv9yqoyk=; b=miWDyWlJjnZSTchcOp2wopVR1uFx1iJbIKV/Yh/mggrnMvZ2kY
	KgfWZ37F6oWTiZcRAZtZk5DdyMMX3cSNjRstmvGsz0anbEOiTPxrIJnTplpJ9KWcO/9iD1reZgQ
	DXdiRv3EWszKMOTMelqi/dqyYwCaIZ0dW8RWKhqcu9Ul776ne+j5hIx6/imn/AqefG0mc4qtD3P
	sHddZCNF33+8F0t6aLWkngEVOWZZvIMqk8CnEcSN0RW13a7/AbiIto8Y8EFpeBVv1cLu3+ntZek
	FPakIPQYC0GNpmhSZOqOhbP4sK66SJP8oZZiwhXW549KV9GcrpM3lSffE94T1kB/4MQ==;
Message-ID: <f810dd42-b753-4374-a436-7bad36176a1c@erebion.eu>
Date: Tue, 17 Nov 2026 00:07:30 +0100
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
Subject: Re: [PATCH v5 09/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
 thermals
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-9-7318a19806eb@erebion.eu>
 <sashiko-outbox-217839@kernel.org>
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
In-Reply-To: <sashiko-outbox-217839@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Snru5QX7T0tiOlA0M9olbP8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0Snru5QX7T0tiOlA0M9olbP8
Content-Type: multipart/mixed; boundary="------------Ox1yA5pWt9U6JrHfLNESuWof";
 protected-headers="v1"; hp="clear"
Message-ID: <f810dd42-b753-4374-a436-7bad36176a1c@erebion.eu>
Date: Tue, 17 Nov 2026 00:07:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
 thermals
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-9-7318a19806eb@erebion.eu>
 <sashiko-outbox-217839@kernel.org>
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
In-Reply-To: <sashiko-outbox-217839@kernel.org>

--------------Ox1yA5pWt9U6JrHfLNESuWof
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTcvMjYgMDA6MDMsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsDQo+IGlzc3VlIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBhcm02NDog
ZHRzOiBxY29tOiBoYW5kbGUgdXNlZCBpbnN0ZWFkIG9mIHJlYWwgbmFtZSBpbg0KPiAgICBT
aWduZWQtb2ZmLWJ5IHRyYWlsZXINClRoYXQgd2FzIGFscmVhZHkgZGlzY3Vzc2VkIGluIHYy
IG9mIHRoaXMgcGF0Y2ggc2VyaWVzLg0KDQotLSANCmVyZWJpb24NCg0KWE1QUDogZXJlYmlv
bkBlcmViaW9uLmV1DQoNCkFjY2VwdGVkIGxhbmd1YWdlczogR2VybWFuLCBFbmdsaXNoLCBT
d2VkaXNoLCBOb3J3ZWdpYW4sIERhbmlzaA0KDQo=

--------------Ox1yA5pWt9U6JrHfLNESuWof--

--------------0Snru5QX7T0tiOlA0M9olbP8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavuMsgUDAAAAAAAKCRCOr0AybgKufcGm
AQCzC8G+dAKVm/W2FZLRa4j9lwgb5c+y6v+vSs6NuxbmDwEAhz1IXO0eO9Zncr4+31yw4n5Sdv1W
vcYoGxtagXHXJgA=
=DoAk
-----END PGP SIGNATURE-----

--------------0Snru5QX7T0tiOlA0M9olbP8--
