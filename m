Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622054;
	b=L6Zdqk2pHorj/V/DEWA+daQBDi6/O8LZRHOrBinWOGLsyLppvGJxe43+tUMcosJdulur
	 2IOARpio+BHbo1Vh1YierN5eLCX3wWLK8d2KnVJypAdQCD1iSxpib0Ou1xouAtqx9DsKE
	 c+vKY4M8qn3K+BjTDgWYWUhhASWedliWRsgERgum9nVirinGy/ohy3CTSHlgnVNNvBVBF
	 sMTSN5cls67C8RSX9M2Z3m6Kv8qo60KwRwzjklVmdQl2LKMnb8MIZy/fP/URseuvK/bwx
	 Pykg7GJlzL1hpdfxRBFm5/poWWMiT+nzL2szh/HHIADAHDuALiqVCtjJmhhPyVaFVzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622054;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:From:To:Cc:
	 References:Autocrypt:In-Reply-To:Content-Type;
	bh=RtKTi6lwJ4fch5OCeYjhsg7s4+EyI/ILJ6qlxyxa940=;
	b=UM0S2rwS7Dd21iUdte5o3Bgu4Ojvy1bJQ2vlCe+OLzZU3kIABkkRNk9oFPXkQoqZwIW6
	 9qtyxuTnhAa4hglwx4xaBhF3YThaYJWXKaDBewZptCwP4FelYjJJySeOee1p24jLi7lEX
	 MLtENp0zrc1CkeFGvu8Az5gIwQwCZQJx5hNpywPcRlYDq8oUOC6hFNAhzXN+aK7Y/PxjI
	 4t2rFjCTdPlhU+lJbYlLSMrgL5z6YPPLdyWi87phbb0JYSMThlwkKeJhDr43o8VBK93WY
	 GKKCdd/MDB4gR5pvRr/fdPaDtWj6nPjlQpjkJXb6T06yUyCEC6Z4xZ9g8Cr7kxdcU/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="z1+4/uer";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=r6zqq8BD;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43900606A324
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 12:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43900606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=z1+4/uer;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=r6zqq8BD
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:From:Subject:Date:Message-ID; t=1793622036; bh=RtKTi6lwJ4fch5OCeYjhsg7
	s4+EyI/ILJ6qlxyxa940=; b=z1+4/uerr8cHYL1w6+Hv/p/kkYlVfJlMWKncQX+mYIFDKRkmci
	sN4xEMwPGuW23h+fVzw0bMdvkKGnD4maXSCA==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:From:Subject:Date:Message-ID; t=1793622036; bh=RtKTi6lwJ4fch5OCeYjhsg7
	s4+EyI/ILJ6qlxyxa940=; b=r6zqq8BDiz3b02+Tw4UQML7SPnfxxQV6gjUrgJxdvLag5rTLZ5
	5KrrW28YcPyxWGDdpJHaziIMzqsgGcRtv36O9V37X2MF+wg5/j/9KZVz2X9yWOBeM7eNlj8tXWn
	2ThYmzSEZ4T5Hk5L7f35k+gU8V06vgEBCUuN5Blsjw7Zev8MjNjtjz1CKFd53Ch3fQORsWUU8kN
	0Gqd2oPlsX+P5xd+f75m3zKADbqKlqwRk1lE/VTPySa57JMCXbLcIWTV0Z/JEqleJ9M3nLqXlsD
	Q7hZpSyduV0MQQN9l6e07lF0uzuNfnGEoOh3AXAb5WFXlcAj17CvWfgFEYavmWkDVag==;
Message-ID: <a29b9e58-996c-4e94-b121-106e4bc17237@erebion.eu>
Date: Mon, 2 Nov 2026 13:20:36 +0100
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
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: sm6350-lena: Add PM6150L
 thermals
Content-Language: en-GB
From: erebion <erebion@erebion.eu>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-11-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192768@kernel.org>
 <dc96c6bb-0ac2-4f67-84b5-2284d37afa44@erebion.eu>
 <c539ae6d-8018-49ba-b4fe-8e52306c93bd@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <c539ae6d-8018-49ba-b4fe-8e52306c93bd@erebion.eu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UOqc5Wh3bge3NTajNydAHPsn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UOqc5Wh3bge3NTajNydAHPsn
Content-Type: multipart/mixed; boundary="------------H0BohUyAyRGKbi8hEbhSKGjo";
 protected-headers="v1"; hp="clear"
Message-ID: <a29b9e58-996c-4e94-b121-106e4bc17237@erebion.eu>
Date: Mon, 2 Nov 2026 13:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: sm6350-lena: Add PM6150L
 thermals
Content-Language: en-GB
From: erebion <erebion@erebion.eu>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-11-cdc3be96d257@erebion.eu>
 <sashiko-outbox-192768@kernel.org>
 <dc96c6bb-0ac2-4f67-84b5-2284d37afa44@erebion.eu>
 <c539ae6d-8018-49ba-b4fe-8e52306c93bd@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <c539ae6d-8018-49ba-b4fe-8e52306c93bd@erebion.eu>

--------------H0BohUyAyRGKbi8hEbhSKGjo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAxMS8yLzI2IDAyOjMzLCBlcmViaW9uIHdyb3RlOg0KPiBPbiAxMS8yLzI2IDAxOjM1
LCBlcmViaW9uIHdyb3RlOg0KPj4gT24gMTEvMi8yNiAwMDo0NCwgc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyB3cm90ZToNCj4+PiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4+PiBTaG91bGQgcmVh
cl9jYW1fc2Vuc29yIHJlZmVyZW5jZSBBREM1X0dQSU8yXzEwMEtfUFUgaW5zdGVhZCBvZg0K
Pj4+IEFEQzVfR1BJTzZfMTAwS19QVSBoZXJlPw0KPj4+DQo+Pj4gT24gUE02MTUwTCwgcGh5
c2ljYWwgcGluIGdwaW82IGlzIHJvdXRlZCB0byBBREM1X0dQSU8yXzEwMEtfUFUgDQo+Pj4g
KDB4NTMpLCBhbmQNCj4+PiB1bmRlciAmcG02MTUwbF9hZGMgYmVsb3cgdGhlIHJlYXIgY2Ft
ZXJhIHRoZXJtaXN0b3IgY2hhbm5lbCBpcyANCj4+PiBkZWZpbmVkIGFzOg0KPj4NCj4+IEFo
IHllcywgbG9va3MgbGlrZSBJIGNvbmZ1c2VkIGdwaW82IGZyb20gZG93bnN0cmVhbSBEVCBh
bmQgZ3BpbzIgZnJvbSANCj4+IGluY2x1ZGUvZHQtYmluZGluZ3MvaWlvL3Fjb20sc3BtaS12
YWRjLmgNCj4+DQo+PiBXaWxsIGZpeCB3aXRoIHY0Li4uDQo+IHJvb3RAbW9iaWFuOn4jIGNh
dCAvc3lzL2NsYXNzL3RoZXJtYWwvdGhlcm1hbF96b25lMzgvdGVtcA0KPiAtNDAwMDANCj4g
cm9vdEBtb2JpYW46fiMgY2F0IC9zeXMvY2xhc3MvdGhlcm1hbC90aGVybWFsX3pvbmUzOC90
eXBlDQo+IHJlYXItY2FtLXRoZXJtYWwNCj4gDQo+IFdlbGwsIHRoaXMgZG9lcyBub3QgbG9v
ayByaWdodCBlaXRoZXIuIEkgc3dlYXIgSSBkb24ndCBsaXZlIGluIEFudGFyY3RpY2EuDQo+
IA0KPiANCj4gID4+IFNob3VsZCByZWFyX2NhbV9zZW5zb3IgcmVmZXJlbmNlIEFEQzVfR1BJ
TzJfMTAwS19QVSBpbnN0ZWFkIG9mDQo+ICA+PiBBREM1X0dQSU82XzEwMEtfUFUgaGVyZT8N
Cj4gDQo+IEdQSU82OiBWYWx1ZSBsb29rcyBzZW5zaWJsZSBhdCBqdXN0IG92ZXIgMzAgwrBD
DQo+IEdQSU8yOiAtNDAgwrBDDQo+IA0KPiBQZXJoYXBzIEdQSU82IHdhcyByaWdodCBhZnRl
ciBhbGwgb3IgaXQgaXMgd3Jvbmcgd2hpbGUgR1BJTzIgaXMgd3JvbmcgYXMgDQo+IHdlbGwu
DQo+IA0KDQpPaCB5ZXMuIE5vdyBJIGdldCBpdC4uLg0KDQpJIGNoYW5nZWQgcmVhcl9jYW1f
c2Vuc29yIHRvIEdQSU82LCBidXQgbGVmdCBhdCBzZXQgdG8gR1BJTzIgaW4gDQpjaGFubmVs
QDUzLi4uDQoNCndpbGwgZml4IHdpdGggdjQNCg0KLS0gDQplcmViaW9uDQoNClhNUFA6IGVy
ZWJpb25AZXJlYmlvbi5ldQ0KDQpNeSBsYW5ndWFnZXM6IEdlcm1hbiwgRW5nbGlzaCwgU3dl
ZGlzaCwgTm9yd2VnaWFuLCBEYW5pc2gNClllcywgSSdtIGEgbGFuZ3VhZ2UgbmVyZC4gRmVl
bCBmcmVlIHRvIHdyaXRlIHRvIG1lIGluIGFueSBvZiB0aGUgDQphZm9yZW1lbnRpb25lZCBs
YW5ndWFnZXMuDQoNCg==

--------------H0BohUyAyRGKbi8hEbhSKGjo--

--------------UOqc5Wh3bge3NTajNydAHPsn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCauiAFAUDAAAAAAAKCRCOr0AybgKufeWj
AQC6bMozBSjMpiz13+tQE4l6j7IzqEmspS3fqYiRBWgZWwEAj2e4BQfdRcPZ7n2y819AWMUTHsoM
WHupSm0JNSWG2AE=
=kwDt
-----END PGP SIGNATURE-----

--------------UOqc5Wh3bge3NTajNydAHPsn--
