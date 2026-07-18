Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F168462
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784380025; cv=none; b=tAFZVuEKSs50IaCEIHcrHgXJ14fBVoGdG1LZIHMIkccdYXNMCQndILF5+D+jHNTBn/VgA5os5Yp3rYzU2FqjEwvLF/VBEK4v6w/zrKxz0h4GdJFiXhCwMocVp68reCEMa2zLSvIs6pYDok3bpQBGBPkUS0PLT8QcGrEgL5uQ/fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784380025; c=relaxed/simple;
	bh=RvXe9kWAuKBe1AbUROCD+9Q0OVFdFjSunwI03BAlk1k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jEndBqmgzxF0pmIJqdh3UDY5OoU3rlSP+BJsTLQpZdF3twlCXfFDxIm9Tate/2UxupCVPuXwgOJljqzu5xqib45plcQviNe9/bNiRGroImDrmui0+hL1kYGdLG4Mm8FpaCIBhzTSxQrLdXIRSFrSQ0M3EPRO68So4xQJ/VWuCqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=hNRLRGOg; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="hNRLRGOg"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id EDF2D240027
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 15:07:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1784380020;
	bh=zoR/07cNipfqPG7Komw+d9XvzKJGNdClqZIvS2Va2W4=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=hNRLRGOgKxttHK+/BrDBgLUPJYI6Q/0umeNNix3RJf1IAlTkurwdPb+k2W7n6oD0u
	 h9qBRjc0Ne5oWvKlvI/J3kMlIkppLD2R3RAcJO0YZTEO+x2oFqNVXoCnwb8faAxbsV
	 ZezGXujq6qo0SUjfeElB6unLMzqaXp722u0mblPSw2MA/yygjdpTpYCNaRmJNUxIdD
	 /WNXViYRNSuqZba6uCEOkcD3Epht0bXDJ0jSqrptJiUBL3vx5VchCYPE3/x+/ppHyM
	 nyzjeEcpueNaCvDovSFAI3vKbVgq9Me3TnMX0uh1t+Y+VVKPcFnSRUrJB9ULFX9wlY
	 +YTb9QPTfzkGw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4h2RrN3lRGz6tvs;
	Sat, 18 Jul 2026 15:07:00 +0200 (CEST)
Message-ID: <277c33cf5cbc5f2f067ab24c174d6c60bf8054e7.camel@posteo.de>
Subject: Re: [PATCH v2 2/4] rust: serdev: mark small functions as `#[inline]`
From: Markus Probst <markus.probst@posteo.de>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org
Date: Sat, 18 Jul 2026 13:07:00 +0000
In-Reply-To: <20260718125438.ADE381F000E9@smtp.kernel.org>
References: <20260718-rust_serdev_fixes-v2-0-e5214e03de13@posteo.de>
	 <20260718-rust_serdev_fixes-v2-2-e5214e03de13@posteo.de>
	 <20260718125438.ADE381F000E9@smtp.kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-DX3R9NO/T8D8x2K888+Q"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-DX3R9NO/T8D8x2K888+Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-07-18 at 12:54 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [Low] This problem wasn't introduced by this patch, but the patch incom=
pletely applies the `#[inline]` attribute, missing several small and forwar=
ding functions in the same module, violating the Rust subsystem guide.
> --
>=20
> --- Patch [2]: [PATCH v2 2/4] rust: serdev: mark small functions as `#[in=
line]` ---
> commit 51b61be6e88e2f99505c9aba8afbad7558d43605
> Author: Markus Probst <markus.probst@posteo.de>
>=20
> rust: serdev: mark small functions as #[inline]
>=20
> This commit adds #[inline] annotations to several methods in the Device
> struct to allow cross-crate inlining for optimization.
>=20
> Link: https://lore.kernel.org/rust-for-linux/DK0SX3P5K1J6.1OV4ETJMXW83R@g=
aryguo.net/
>=20
> > diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
> > index 47ca57966abfe..79d61c6ceeecd 100644
> > --- a/rust/kernel/serdev.rs
> > +++ b/rust/kernel/serdev.rs
>=20
> [ ... ]
>=20
> > @@ -547,6 +554,7 @@ pub fn write_flush(&self) {
> >      /// Wait for the data to be sent.
> >      ///
> >      /// After this function, the write buffer of the controller should=
 be empty.
> > +    #[inline]
> >      pub fn wait_until_sent(&self, timeout: Timeout) {
> >          // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a =
valid `serdev_device`.
> >          unsafe { bindings::serdev_device_wait_until_sent(self.as_raw()=
, timeout.into_jiffies()) };
>=20
> [Severity: Low]
> This is a pre-existing issue, but since this commit aims to mark small
> functions as inline, could we also add the attribute to the other forward=
ing
> methods in this module?
>=20
> The Rust subsystem guidelines mandate that small or forwarding functions =
in
> abstractions should be annotated with #[inline].
>=20
> For example, Timeout::into_jiffies() is quite small:
>=20
> rust/kernel/serdev.rs:Timeout::into_jiffies()
>     fn into_jiffies(self) -> isize {
>         match self {
>             Self::Jiffies(value) =3D> value.get().try_into().unwrap_or_de=
fault(),
>             Self::Milliseconds(value) =3D> {
>                 msecs_to_jiffies(value.get()).try_into().unwrap_or_defaul=
t()
>             }
>             Self::Max =3D> 0,
>         }
>     }
This will be removed in the same patch series.

>=20
> And the forwarding trait methods at the end of the file are also missing =
it:
>=20
> rust/kernel/serdev.rs:AlwaysRefCounted
>     fn inc_ref(&self) {
>         self.as_ref().inc_ref();
>     }
>=20
>     unsafe fn dec_ref(obj: NonNull<Self>) {
>         // SAFETY: The safety requirements guarantee that the refcount is=
 non-zero.
>         unsafe { bindings::serdev_device_put(obj.cast().as_ptr()) }
>     }
>=20
> rust/kernel/serdev.rs:AsRef
>     fn as_ref(&self) -> &device::Device<Ctx> {
>         // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a =
pointer to a valid
>         // `struct serdev_device`.
>         let dev =3D unsafe { &raw mut (*self.as_raw()).dev };
>=20
>         // SAFETY: `dev` points to a valid `struct device`.
>         unsafe { device::Device::from_raw(dev) }
>     }
>=20
> Would it make sense to update these functions in a subsequent patch, or
> include them here to ensure the module fully complies with the guidelines=
?
Those are trait implements. I haven't seen inline to be used on those.

--=-DX3R9NO/T8D8x2K888+Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmpbem8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSLOQP/isEHeCTj64NEysRKVeo
Zk4AtIKAv+PlZne5NVJCCYh3+kuGnf1eX0xL6k2ek1e77JTWsV+iSIsow/8TNOmq
6+PH613dHFABgSBSeGBbR8BYTG0EAJLaRZVfNISWXPg8QZLXCTQ+PQ8OQOz1VbaM
T/9doUFyn0jL/BdOoGNmPq8QoF4hJopvHR4m0oJn7MTsp0sY9LNpLJFHLdPQmg0w
HeK9J5MS4AErN0xz8bOwbkDFZOoDIfFATvQxcbUjf5MaFj78bter2ZzyUtMzASW1
zIZwDz37NCK6+filz12KbqNr2trzquVFTCWKXXyneeInd4D/8zKQYdsPudYmhK0T
qIHrWW+aXwhqs1JcYURAY4xDh3YIwA1tLjAeYlOztcoYXDjsbWipUh9uAQOszFpu
kqAO3Cc5ld02uEEprsDS9kdzW9QtT0Zlip6FKB980yOmw8HZzl7C0FC5Pob94o5J
el6249EEwRCX+SCKDFcdFfe/5VjSoETkrkQ/khCZnJGI1SDFPM0qYt82IE5Llfk7
0tsalFQ24rjD83N2gIso6oIQll+OCuaqQJQR+aG6nc75ERCB9t8SGII79qziU7FI
BJ6GB3XgdqQmKJtZuZODjzJIdkl1GFgp9x/ruzOrP+TIRLUAqjxNn1Eclez4stVZ
Ioeygu9NSRfQ8qdmqHTnLf8/
=d0SF
-----END PGP SIGNATURE-----

--=-DX3R9NO/T8D8x2K888+Q--
