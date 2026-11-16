Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871083;
	b=XvmOfq22TYoY7gh15wR3rmIV9obXpU7POP6lE4ZIRV6RkI3IH/iWVPhxIm0IdfKw08Yb
	 tIkEw0iJzkhTvV354GIjoQP7Wab3+XiTaFqC2ZsXFr4MOn5SFVZmCAQNYKTfN6wKigVAg
	 7vaTVCPb6TO6Q3GUt4TcHV0b3mO/3uqNJfSrwzvN6Hu8OtR/1oAWzZdaPVRORli8tXjiJ
	 JAgBrLBUgxs+3vQUzAiGPJ32DS1/js7mAlNTSt/iJd31upQqABdk9IjDsMQng41oMcera
	 dWisdS97/VgGB9GFP8Eui7SNPDftimlkUFzp8ZUoFWwmgSdRyxdHpwcRhHtQ9SDSr4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871083;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=4/nuy4QglgrM0BuUt/UjkZOK+tfyppGGlKpZpa4QVN8=;
	b=Vwl1OBVmfB7nlSPzxlgflX1nTUI5RkckLgmcQXcitJdwK8UchZ3ftPbC/Qrm02t4PR0w
	 h8cMjbLN/kUTuVzf8PP/bUy9tWVyxsCDsZ/lyzhUAc1uGxwLQC2Pbj6do+TPVPZTLCkHJ
	 dToCofVywwO1fUrURpy0O5LZ48FeT+4inPTi+eDKqgG69omuCXMnSayz0MBWbKGnxszXl
	 8HobEplqxY4tuBWU4yWIfZVGKddC2KszK22aF5TNagYDMdJ2AV4vlY5puknR69QWweUCZ
	 LukigDy5VKIuknMqk+VVX6YgVoHwIsAb21dR20tp8V9NoYjkGteOkNvHdnkY8paCMiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="5b/oyWaa";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=VrGFOKpP;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60395606A329
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 23:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60395606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=5b/oyWaa;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=VrGFOKpP
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794871079; bh=4/nuy4QglgrM0BuUt/UjkZO
	K+tfyppGGlKpZpa4QVN8=; b=5b/oyWaawPhz2OCaX82yN+RXBcTgWyGG0jAnOuWkvocioJQR7P
	18uhC0WjZ94cmF96pMajDz0eYtziJS3lOFAA==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794871079; bh=4/nuy4QglgrM0BuUt/UjkZO
	K+tfyppGGlKpZpa4QVN8=; b=VrGFOKpPzJ0nHAqQRcbNSfi5bIWa4IwtOSfaKlUPckV/LFUq+A
	nlKp0AHxVBgbi9hFj3gB7xSScOnOi2QSFSgG+Rj3SrjtI+L+MZzpYgslCGRG8nksOIua5mcnj5t
	julvVmnrHiymKrf6ZIYlVnPPWbX51R6eIsZdzJtSSxsA7gfY0wYNScedmlqlVcD5+b45QkyN8u6
	pBcjrKG0bn47QuDIMlBkU98b67H5ybZ8rf/I3kXtzsLRtnbtJNvsBeSY7HflkC3Fgch0XBuNpJT
	sIh8t0eLZnMtDT7gsMBCAsNsCFnUMNi6WI04mza4nuLsqk+2cQkmUzu0xFtVfnyrT1Q==;
Message-ID: <164d15e2-0716-42b2-a0cf-24c01920c3d3@erebion.eu>
Date: Tue, 17 Nov 2026 00:17:58 +0100
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
Subject: Re: [PATCH v5 05/12] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-5-7318a19806eb@erebion.eu>
 <sashiko-outbox-217853@kernel.org>
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
In-Reply-To: <sashiko-outbox-217853@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------t6p4sJ0DekhsS7Y0qI4CcHYM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------t6p4sJ0DekhsS7Y0qI4CcHYM
Content-Type: multipart/mixed; boundary="------------0tZPo4lL8CnTFVY8TU3dQkrO";
 protected-headers="v1"; hp="clear"
Message-ID: <164d15e2-0716-42b2-a0cf-24c01920c3d3@erebion.eu>
Date: Tue, 17 Nov 2026 00:17:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/12] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-5-7318a19806eb@erebion.eu>
 <sashiko-outbox-217853@kernel.org>
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
In-Reply-To: <sashiko-outbox-217853@kernel.org>

--------------0tZPo4lL8CnTFVY8TU3dQkrO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAxMS8xNy8yNiAwMDoxMSwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4g
VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91
bmQgMSBwb3RlbnRpYWwNCj4gaXNzdWUgdG8gY29uc2lkZXI6DQo+IC0gW0hpZ2hdIGFybTY0
OiBkdHM6IHFjb206IFNpZ25lZC1vZmYtYnkgYW5kIEF1dGhvciB1c2UgaGFuZGxlIGluc3Rl
YWQNCj4gICAgb2YgcmVhbCBuYW1lDQpUaGF0IHdhcyBhbHJlYWR5IGRpc2N1c3NlZCBpbiB2
MiBvZiB0aGlzIHBhdGNoIHNlcmllcy4NCg0KLS0gDQplcmViaW9uDQoNClhNUFA6IGVyZWJp
b25AZXJlYmlvbi5ldQ0KDQpBY2NlcHRlZCBsYW5ndWFnZXM6IEdlcm1hbiwgRW5nbGlzaCwg
U3dlZGlzaCwgTm9yd2VnaWFuLCBEYW5pc2gNCg0K

--------------0tZPo4lL8CnTFVY8TU3dQkrO--

--------------t6p4sJ0DekhsS7Y0qI4CcHYM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavuPJgUDAAAAAAAKCRCOr0AybgKufZkm
AP9tgOKyWc8RQ71BtYVkEtcfvOh48aXD5lW0M7yQ0k27bwD+K05Tukdd8+tnQNcbd7p7yYs7Ba5F
iNgokZsJVqEfwQg=
=uLia
-----END PGP SIGNATURE-----

--------------t6p4sJ0DekhsS7Y0qI4CcHYM--
