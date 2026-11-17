Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.189.121.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919459;
	b=KGV6KqGqcTeHcpgegG8FVzUvecrf77j4VDzv4EhH0zhzFlAw8BIcZAbXq/rSwkVkToxq
	 GvX0Iy2O2IGzHrzaS4kgwJ7hzyk7vz9ONKOKpeVM/1zwwKJ039PwTc792hGj4LX44qWSr
	 VqIyDIgmlnNr5vEo8b7EC8+GhJ3lJ1KIRlCzh4uHJaK2AYxXuXXybhjj+oJeqaMmUXeIJ
	 9Acp1e/OBuVSV82kZDCazMJpfCIjbOW/W6aeMsbLpqQVVs3JAzo9DwBOzKWDkW11iozAj
	 NPQyQEOmJUhThnSV7cWesY8EuHpJjMHsCG1wOmb308EBjeeRVbPY817nU44RX8UHRvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919459;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:MIME-Version;
	bh=0oMpxMqAh1huD7QvmrRmZJkCRKZ5apl5xyHDTsm2JJw=;
	b=bJi9i6RESviccRH7yYNRvLb8MuiMhzjGT0Wk6vPR6kE+KenvRb64ptPaeu/sYrvkKSt+
	 6bD48aLq3nAf7uk5XmPtD0GZ7o0od65zaZlYKitz87d+HZAsyPm/vBEe6FtOZb474weEh
	 zFdN0U96bTjUtvEEejvPkoLtoyai/w8KNV4HVmTv3j4EZoqdWqcb65+IMUIpK4xd/z2Q3
	 MxmarwkuTyLLT9+HMMNQ8W3UXK1guZNozXp9bYDssLsWteosDdC34eUp3y/uUvo3BtFMH
	 zF1KUCua6qqt92oRmzl1NV+jOU3YW/YgjnFhuoiwF4Y5RScK81k917bY6oPn+eGcOaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=itx.no;
	spf=pass smtp.mailfrom=itx.no;
	dkim=pass header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=Vfyqj0f7;
	arc=none smtp.remote-ip=91.189.121.228
Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D41606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 12:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D41606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=Vfyqj0f7
Message-ID: <8c0c3734b9ad1ba0072ce1fbcf895b544563798f.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1794919456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0oMpxMqAh1huD7QvmrRmZJkCRKZ5apl5xyHDTsm2JJw=;
	b=Vfyqj0f72ALQ/u7eN/0j8cbqTU95GvMzRaoRfB+Krw2PHCHJjECcgJkPZ7dfedjVob+JaI
	NsQIetAtcU+qFsai8utJWoCEL1XQFYr1L+mOcg/Kal0AiuKcxySHKYVceq4SIzVd6DOQW5
	G07VxzqaJAgnmnWjEOS9F2XwIRrBHNA=
Subject: Re: [PATCH] sparc64: Read qemu,hwcap-list from the OF cpu node on
 sun4u
From: Stian Halseth <stian@itx.no>
To: sashiko-reviews@lists.linux.dev, sparclinux@vger.kernel.org
Cc: Andreas Larsson <andreas@gaisler.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Biggers <ebiggers@kernel.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 13:44:14 +0100
In-Reply-To: <sashiko-outbox-218725@kernel.org>
References: <20261117112914.2300417-1-stian@itx.no>
	 <sashiko-outbox-218725@kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-OgfmDeW2u+LdEbYAhuII"
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0


--=-OgfmDeW2u+LdEbYAhuII
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 2026-11-17 at 11:46 +0000, sashiko-bot@kernel.org wrote:
>=20
> [Severity: High]
> This problem wasn't introduced by this patch, but can hwcap_list_caps()
> read out of bounds and loop forever [1] if the property buffer is not
> null-terminated?

Yes,=A0and we can fix that in v2. As it stands the parser trusts the list
to end with a NUL, which is not guaranteed if a QEMU user supplies a
fw_cfg file directly.

>=20
> [Severity: High]
> Does setting HWCAP_SPARC_CRYPTO in sparc64_elf_hwcap on sun4u cause a
> regression where the sparc64 skcipher drivers corrupt FPU state and round
> keys across skcipher_walk_done()?
>=20

This might be a bit worse than I first thought. I was aware of the
self-test failures, as noted in my patch notes, but it looks like this
could also cause some data corruption. Only QEMU can hit it, since no
real sun4u CPU has the crypto opcodes.

I have not reproduced it myself, and before spending time on that,
I would like to get Eric's take on removing the glue code altogether.
If not, we could fix the glue itself, for example by dropping the FP
state before skcipher_walk_done(). IMO that would be maintaining code
that probably should be removed. Not my call, though.

Andreas, please don't apply this patch as-is for now. I will wait for
Eric's reply before proceeding.


/Stian


--=-OgfmDeW2u+LdEbYAhuII
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCavxMHgAKCRDoeAEuJe36
VtAtAP40VSMQ5ymr7U87qFc4sjU2DlNO1iIUxQ6PAl/9qkXMbwEAhFXM6W5sZ2WK
P3euzWF5g10P7eRmzRwhw/vt0WCezAU=
=TGk3
-----END PGP SIGNATURE-----

--=-OgfmDeW2u+LdEbYAhuII--
