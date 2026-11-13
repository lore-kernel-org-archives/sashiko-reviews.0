Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794534287;
	b=MmLVOiSj8iez7iEQvuDMoAAEINke6Rjt+n6HgeOTY1vtcdezex9MmLEXrv0cDD8kQLRy
	 Z/+J6MLbvXUTmXvNi//OT3HHftYfdPI+lrPpVNGl0v7OwMsqMO0Pwar7gIdIe6Vg0jB5M
	 SzH1vEv/0DlNlINjWlslZDlgQhzOaC2ro4+RO5zeHmK03LJ2xUQ81sCpnRzf9BHUX/qlC
	 5ZP+LMpuDfzMYFZCiQ4E0XI5o4A5cqeG4bdY5CC7ogrF89j8dtAB/WI6suv9SZaWK5KMU
	 7yZZ0LAqcMA1GAkjzYSmZEGLp5m1RdhbdVB5NvkjsvqkEpVSAVBWoRRc4L5yDZbFK7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534287;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=t3gq4poLwuJ3zhlC0nuDwOSXSXgKSUVubVtlVq0i2Os=;
	b=XnZh/baQh9kpUqXtKnTxo8UVYMmFJVXA60bu8T7rfv6jAy3BEcrToSLEAdAgtskWH1u9
	 GCSrEBXxsFxfTwoWCvOapmjZxx8zzIcGw5H2xKY26Zh3VBOkc9Uzjttu1PdlU1tKuBBnC
	 DbKN7NNdOmZZgcJzhnjviR53fptT6C/ggS6dHBtu8/4GhNrOOROTu8WIQ2+eBgfmxsLge
	 Rvcya5yDdEBPhxdX/VPOKGwCMRYnVGlDh00RP/Ig97SuUUWzeIjmDRM695CQ2g4Ma7sxH
	 Sw/muUwnxECZDP7m4tVGAIzakgrAbx9oVdUAn0+vtIpCltoeri3ybiZX1BagMSU/RDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=ejnBxPGm;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=OjBhsTiE;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71C7606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 01:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A71C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=ejnBxPGm;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=OjBhsTiE
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794534285; bh=t3gq4poLwuJ3zhlC0nuDwOS
	XSXgKSUVubVtlVq0i2Os=; b=ejnBxPGmnSUB8WqUiwx0k47AXy2gLZHstSq5/T71r4BYCE1b8+
	G3KR/ViMuXVGu5SXEGXBagb27ra8UOTtYVCA==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794534285; bh=t3gq4poLwuJ3zhlC0nuDwOS
	XSXgKSUVubVtlVq0i2Os=; b=OjBhsTiEu3sYOvFeWmI4qXedoptUM9mDZJQ/LplLubjbxNQ1GO
	0kjvkraXn2tj1ayBEVZIvu2D/UK5mJsv3ym2FR7UyY4va904chzUQIdkhSeZVUSqP55r+BhQ3IM
	wGqoI+WpXv/GqVx13F33qRbOOPxXhBn+ObOlafy4En/6tazh+NpBWUCXxfR0GZfWHNsnqh4qDlk
	6Gupql1hgEeUcuGeNjtrInEj2iz93+1dUYA+VjPHjbl0DQLP56rvdNGlYV6RXqrzF0Otx7tzrG/
	XQSRjSpkahoArK4rgI5rm1Zip1koIjAFHgxPz1AO9EUskleLSggtmcqC6wgPRi2odbA==;
Message-ID: <ce6117a5-273b-4369-b9a2-73304d80184a@erebion.eu>
Date: Fri, 13 Nov 2026 02:44:44 +0100
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
Subject: Re: [PATCH v4 02/12] arm64: dts: qcom: sm6350-lena: rename
 touch-en-regulator
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
 <20261113-pdx213-upstream-3-v4-2-4b01c50a821c@erebion.eu>
 <sashiko-outbox-212055@kernel.org>
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
In-Reply-To: <sashiko-outbox-212055@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nkJfrryR2RXI2iPb4H3UV4Wy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nkJfrryR2RXI2iPb4H3UV4Wy
Content-Type: multipart/mixed; boundary="------------4LBeq51Ca0JG4Lh3xnVgRZwe";
 protected-headers="v1"; hp="clear"
Message-ID: <ce6117a5-273b-4369-b9a2-73304d80184a@erebion.eu>
Date: Fri, 13 Nov 2026 02:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] arm64: dts: qcom: sm6350-lena: rename
 touch-en-regulator
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
 <20261113-pdx213-upstream-3-v4-2-4b01c50a821c@erebion.eu>
 <sashiko-outbox-212055@kernel.org>
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
In-Reply-To: <sashiko-outbox-212055@kernel.org>

--------------4LBeq51Ca0JG4Lh3xnVgRZwe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCk9uIDExLzEzLzI2IDAyOjI4LCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOg0K
PiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBm
b3VuZCAxIHBvdGVudGlhbA0KPiBpc3N1ZSB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0gYXJt
NjQ6IGR0czogcWNvbTogc2luZ2xlLXdvcmQgaGFuZGxlIHVzZWQgaW4gU2lnbmVkLW9mZi1i
eQ0KPiAgICB0cmFpbGVyDQo+IC0tDQo+IA0KPiBjb21taXQgZDEyYmYxYjFkZWUzM2IyNmE1
ODAwZmFhOTRmMmI2ZjYwZjk1OTlkZQ0KPiBBdXRob3I6IGVyZWJpb24gPGVyZWJpb25AZXJl
Ymlvbi5ldT4NCj4gDQo+PiBhcm02NDogZHRzOiBxY29tOiBzbTYzNTAtbGVuYTogcmVuYW1l
IHRvdWNoLWVuLXJlZ3VsYXRvcg0KPj4NCj4+IHJlbmFtZSB0b3VjaC1lbi1yZWd1bGF0b3Ig
LT4gcmVndWxhdG9yLXRvdWNoLWVuLCB0bw0KPj4ga2VlcCBhbnkgZnV0dXJlIGZpeGVkLXJl
Z3VsYXRvciBzb3J0ZWQgdG9nZXRoZXINCj4+DQo+PiBSZXZpZXdlZC1ieTogTHVjYSBXZWlz
cyA8bHVjYS53ZWlzc0BmYWlycGhvbmUuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogZXJlYmlv
biA8ZXJlYmlvbkBlcmViaW9uLmV1Pg0KPiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBCb3Ro
IHRoZSBBdXRob3IgaGVhZGVyIGFuZCB0aGUgU2lnbmVkLW9mZi1ieSB0cmFpbGVyIHVzZSB0
aGUgc2luZ2xlLXdvcmQNCj4gaGFuZGxlICJlcmViaW9uIiBpbnN0ZWFkIG9mIGEgZnVsbCBy
ZWFsIG5hbWUsIHdoaWNoIGRvZXMgbm90IHNhdGlzZnkgdGhlDQo+IERldmVsb3BlcidzIENl
cnRpZmljYXRlIG9mIE9yaWdpbiByZXF1aXJlbWVudHMgaW4NCj4gRG9jdW1lbnRhdGlvbi9w
cm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QuDQo+IA0KDQpUaGlzIHdhcyBhbHJlYWR5
IGRpc2N1c3NlZCBpbiB2Mi4uLiBBbmQgd2h5IHRoZSBoZWxsIGRvZXMgdGhlIGJvdCBub3cg
DQpzdWRkZW5seSBzZW5kIG1lIGFuIGVtYWlsIGZvciBldmVyeSBzaW5nbGUgcGF0Y2ggaW4g
dGhpcyBwYXRjaCBzZXJpZXMgDQpzYXlpbmcgZXhhY3RseSB0aGUgc2FtZT8hDQoNClNvIGFu
bm95aW5nLg0KDQoNCi0tIA0KZXJlYmlvbg0KDQpYTVBQOiBlcmViaW9uQGVyZWJpb24uZXUN
Cg0KQWNjZXB0ZWQgbGFuZ3VhZ2VzOiBHZXJtYW4sIEVuZ2xpc2gsIFN3ZWRpc2gsIE5vcndl
Z2lhbiwgRGFuaXNoDQoNCg==

--------------4LBeq51Ca0JG4Lh3xnVgRZwe--

--------------nkJfrryR2RXI2iPb4H3UV4Wy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavZrjAUDAAAAAAAKCRCOr0AybgKufYjp
AP9jBtZGi7F7N/TI8ccaGOf1PCPqIYXDBEefbXjvFM4aeQD/TkTnIiWuRGqvfSIA+VvAp7RnXVEE
XXfo9nJf47bljwg=
=PwEV
-----END PGP SIGNATURE-----

--------------nkJfrryR2RXI2iPb4H3UV4Wy--
