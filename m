Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793577933;
	b=Z4LmA4saEN+nEvwlaaRqOCgG96D3N9hxVR2nP3R9RkHle3QvFtvnmuvWRExP8KRsdBvr
	 tHJfQkpufADgnSOcAxb1I8iiUC/ua03RbaeZ6icxuMhc4QV4+gP/A23FP2+CFeWWXAqAH
	 VyPMFgKMRPjDvU49tmVasbJ3ZoAZuOgL9EoMWFwrQ73Kiv+a0pXK9m5yYsnJZyb9V6EuL
	 5Tm6IvLelHliw3/0zSJ/up5R2JLXX5V1hAFIaOn8pb589QdH7JqlG0iDPdzhdZpUA/zz4
	 lcbm+MzLLRPD6M9S66JtwLIQYI9HLwMR2CHd+zothdeMRYJIzWQ6N2oLi+ArfJVfJpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793577933;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=Zyp6Ql5N1rWlYxuROJ0el25M0bYgmu9qE6tE4Km9PMs=;
	b=CdKIeMDL92rZHCxI26iaaEoftW93byySfocW0ks5Xlzi/k8hHusEN/6KBfI16gY1v+L9
	 YZrJuexN4OXxT+kHJ7wnRlNTz2FVV/8JxZBttjaF5vJOkI7yc7BJAay2LTdVfC7T86wpl
	 r/IFfnGTm6tNRnelcZGmPOijJc9fMvNn0yxHAsawiyIEMtcRmchm9ai+2X8349zhsgmVO
	 ofhxw4uOmcr28mdNrTCGQ/cWbYQfNEntSv1Tk4ntgmjVoNUKqgegjIGv+FogR2oTZ84Fx
	 7siviygmwGstrkA676lFOaWKkdY5zqeK4pMHtJwONB3F26fR3P2Q8ulAkwyucZ8xWMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=dWyAcbiJ;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=AFBbnnBT;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D536606A324
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 00:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D536606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=dWyAcbiJ;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=AFBbnnBT
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793577927; bh=Zyp6Ql5N1rWlYxuROJ0el25
	M0bYgmu9qE6tE4Km9PMs=; b=dWyAcbiJlhekDlG3AtkMUe7XDMEMVyWToIijbESJKdL3bHD3jb
	g3WqcUhc+XMiM6Ox9WibNiqzOjVtdpmt/ZAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793577927; bh=Zyp6Ql5N1rWlYxuROJ0el25
	M0bYgmu9qE6tE4Km9PMs=; b=AFBbnnBTrQNndV3stO+6iA2dZjtlSO9RS+TVPb6YTIXWPPuHfA
	TZZTc+d16gK7NtKVw+dFB75xqDN0zahBw7zu4syOpPou7NzUBGfgZ7ON0rL9czXl4sG4Tq96elX
	xqa7GyjnMG8cQO3eqfbfZLyTg4q172shJZbVRgj7/z7aX0LjS4ZfhWEL+jPCg0AM7agHrwMKRRh
	YGZrgGKLgzZAi/EuEVer2OqQOSTumUtZ+XcG15cbfvBHUpPk5mo7R38wFjbua9FTb/4bHLsrJF4
	VxfifC/zBt4975F0Ed1PMSC1jOqnzkLQWsalvdFK1fgf5uv9nuFPclFmPp1FgdhQvpQ==;
Message-ID: <218cfd0d-30db-42e9-923c-5e6514f0836e@erebion.eu>
Date: Mon, 2 Nov 2026 01:05:26 +0100
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
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
 thermals
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-10-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192767@kernel.org>
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
In-Reply-To: <sashiko-outbox-192767@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------N0qJnxep6JA5K18oUsDVI0Mn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------N0qJnxep6JA5K18oUsDVI0Mn
Content-Type: multipart/mixed; boundary="------------5YIA4P0FAXJCX9zdLr0qUAmO";
 protected-headers="v1"; hp="clear"
Message-ID: <218cfd0d-30db-42e9-923c-5e6514f0836e@erebion.eu>
Date: Mon, 2 Nov 2026 01:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
 thermals
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-10-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192767@kernel.org>
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
In-Reply-To: <sashiko-outbox-192767@kernel.org>

--------------5YIA4P0FAXJCX9zdLr0qUAmO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T3kgeWVzLCB0aGUgYm90IGlzIHJpZ2h0LCByZWJhc2UgbWlzaGFwLCB3aWxsIGZpeC4uLg0K
DQpPbiAxMS8yLzI2IDAwOjQ0LCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOg0KPiBU
aGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3Vu
ZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbTWVkaXVtXSBhcm02
NDogZHRzOiBxY29tOiBzbTYzNTAtbGVuYTogeG8tdGhlcm1hbCBvdmVyd3JpdHRlbiBieSBj
aGctc2tpbi10aGVybWFsDQotLSANCmVyZWJpb24NCg0KWE1QUDogZXJlYmlvbkBlcmViaW9u
LmV1DQoNCk15IGxhbmd1YWdlczogR2VybWFuLCBFbmdsaXNoLCBTd2VkaXNoLCBOb3J3ZWdp
YW4sIERhbmlzaA0KWWVzLCBJJ20gYSBsYW5ndWFnZSBuZXJkLiBGZWVsIGZyZWUgdG8gd3Jp
dGUgdG8gbWUgaW4gYW55IG9mIHRoZSANCmFmb3JlbWVudGlvbmVkIGxhbmd1YWdlcy4NCg0K


--------------5YIA4P0FAXJCX9zdLr0qUAmO--

--------------N0qJnxep6JA5K18oUsDVI0Mn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCaufTxgUDAAAAAAAKCRCOr0AybgKufdPd
AQDCUGISN4DDlHW33Y4I4F8RyaQhK11Yq5IXhEeBfGkaeQEAymafLGzzalQ5u5nJvem3t3H3xz6p
3zeAnym8G2rEJgA=
=xtkD
-----END PGP SIGNATURE-----

--------------N0qJnxep6JA5K18oUsDVI0Mn--
