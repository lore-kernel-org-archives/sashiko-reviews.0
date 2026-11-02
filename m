Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793580098;
	b=4sFgyJlFWY440FALuCOYRjsg9Jc7Xk5Sp3PU1iAM0hSp7Sw/wyqItfvlEuZBtjgQVl7e
	 oZUHC45YmA3WBRhWuEOmvn4LZ4dHDOU3WqSX7PgYJCeQKmM/K4TiRt+BJKnZNNjFCFAU/
	 qwhF4JHd4LqLYdQcgoZmjjx7RP/0XR9EpvkOIqLd20QLRPK/QlPWz5eTNljWGuQhOIZlx
	 k+PywrqTlr68szZO7XErUd6dBxTz0mSYtBWK33I3hiXr0H9bOSf5hVI5Db+ZWKfXnh3TJ
	 fTvLaENyETXbMHkLdGoDPphhycouSmyTaXNbCVIiM6QYiesZcOqEuZnUOF79LEdzlyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793580098;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=ha553o7VVEnJLN7WZLxD2YS/lsVO9uX8I7dIyIXm6uI=;
	b=rsLXoMXiTrwWhkbAJafzBSJIr/n7AaMCgDRV+feRd3Rzg59INZyB/Jy06aQGHaOaunM9
	 U8Lc/Qsvwo9wvKkLC4dkFGXs2vAaEyygnh27btTgBLIu+GtNYPNnFW9LXQtQLNK6OXVtB
	 0Qc+OMtY47Iub886iWX/LS/Sh5OCsbAGvN6WrMT5BYgctJxgToXYzfHS06+2qV3wXztAz
	 /19cLOm2m+q+rU8R8JwmtezkKnjR3beogo3DQmhqdxrMYbrcXl+s6+f82C/nmg4/0Ja0w
	 Gwm59sWXG4yuMzmzPPoELYmN/hGdmHoUA+4H4ec1lMteVp+gKKp9NuWstt6zHzjCK8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=WrwxBB5C;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b="eBJL4P/I";
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FBB606A324
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 00:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13FBB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=WrwxBB5C;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=eBJL4P/I
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793580076; bh=ha553o7VVEnJLN7WZLxD2YS
	/lsVO9uX8I7dIyIXm6uI=; b=WrwxBB5Cgz087rd41Hd1MF3enU+yrMYIqZRBfGS68+OEI4f16j
	w4m+uROxszOmEV6PJtzySX0O4iZCII9hwhCQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1793580076; bh=ha553o7VVEnJLN7WZLxD2YS
	/lsVO9uX8I7dIyIXm6uI=; b=eBJL4P/IGvSkXECT3EVArc/gppxNf91dhq6SUUclwZ+LuZhrc+
	CEl8nOXvZRydX8CVZGqAJBT5hetDzPRILqLf+s0vLyUv+CnFww5EDDuzJy04TZjRZU+aVBGK20X
	6w3bulXcKwpfwqA1gE9LyT11D5SVmUihq/0+r9QZu9a8DFf3vMUnrvywPdHS0wIPXmW/xEjhTxW
	Fogq4+FkYNvX3qQcaBTCB0kxs2nxaj+RLMBg1mtcRSxEWCqZ3pgPmW/AYwS8nrHYIq7YuvaXNzY
	ID5yx6AVgZDd0evXP8EjEpEk+KbSCCw2F69U8O9JfCogfFD/XFGRn1C/sD6s4NmoS8A==;
Message-ID: <0a1333ab-9deb-425b-aaeb-737eedefb093@erebion.eu>
Date: Mon, 2 Nov 2026 01:41:15 +0100
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
Subject: Re: [PATCH v3 05/12] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-5-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192770@kernel.org>
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
In-Reply-To: <sashiko-outbox-192770@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1q3Fave0c6Xa17tUQLJxEmYd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1q3Fave0c6Xa17tUQLJxEmYd
Content-Type: multipart/mixed; boundary="------------51ZeVxMtWai6uINlADMwO0VA";
 protected-headers="v1"; hp="clear"
Message-ID: <0a1333ab-9deb-425b-aaeb-737eedefb093@erebion.eu>
Date: Mon, 2 Nov 2026 01:41:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-5-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192770@kernel.org>
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
In-Reply-To: <sashiko-outbox-192770@kernel.org>

--------------51ZeVxMtWai6uINlADMwO0VA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QCBLb25yYWQgRHliY2lvOiBJIHJlbW92ZWQgaXQgbGlrZSB5b3Ugc3VnZ2VzdGVkLCBub3cg
dGhlIGJvdCBpbnNpc3RzIEkgDQphZGQgaXQgYmFjay4NCg0KSG9waW5nIHlvdSBjYW4gY29t
bWVudCBvbiB0aGUgYm90J3MgZGlzYWdyZWVtZW50IHdpdGggeW91LiA6KQ0KDQpPbiAxMS8y
LzI2IDAwOjQ1LCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOg0KPiBUaGFuayB5b3Ug
Zm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVu
dGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbTWVkaXVtXSBhcm02NDogZHRzOiBx
Y29tOiBtaXNzaW5nIGJpYXMtYnVzLWhvbGQgb24gcXVwX3VhcnQxX2N0cyBpbiBkZWZhdWx0
IHN0YXRlDQotLSANCmVyZWJpb24NCg0KWE1QUDogZXJlYmlvbkBlcmViaW9uLmV1DQoNCk15
IGxhbmd1YWdlczogR2VybWFuLCBFbmdsaXNoLCBTd2VkaXNoLCBOb3J3ZWdpYW4sIERhbmlz
aA0KWWVzLCBJJ20gYSBsYW5ndWFnZSBuZXJkLiBGZWVsIGZyZWUgdG8gd3JpdGUgdG8gbWUg
aW4gYW55IG9mIHRoZSANCmFmb3JlbWVudGlvbmVkIGxhbmd1YWdlcy4NCg0K

--------------51ZeVxMtWai6uINlADMwO0VA--

--------------1q3Fave0c6Xa17tUQLJxEmYd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCaufcKwUDAAAAAAAKCRCOr0AybgKufUMi
APwNZEwTyKJYMOmzZqs5GguzMzZSAKiedoI/2s6f84B5cAD/XadEAiOe9TnWX7ZfFnCOoS7qSS6W
wH/u33x4bAGpxw0=
=fRZ1
-----END PGP SIGNATURE-----

--------------1q3Fave0c6Xa17tUQLJxEmYd--
