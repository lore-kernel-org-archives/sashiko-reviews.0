Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCCF34EF0E
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784380117; cv=none; b=Dfq54t59EPaSzUmnJGV140tyH7OaCnpqG3Fq5694WbGpFHzGswD0zUObg+/f5n8DVCloTowOlkQFuT0Z+JqtVAhB4JqUZUZiS3+DlRXGakSXdjzSDUmMxcNUZy8aWc0xzq9b0WCSexR+PxrkxWoOU/uHqrYwHNcb72dl0VEgBoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784380117; c=relaxed/simple;
	bh=1CA1YSqSsQHUtvYot9U99z4Wbh+Q1pdmidjW1kJrA4s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ENcqdEYPlQi1150zTPrzu8PLRrp35igYak3HdymFAETHQAgF8sk3XvBmslli9McZGSy3FU4pajGh5+XxPS7kVxcBZyYxM8yiXWRrsqnP15qSMXpHkTMGv0bCuGuBlSnF+xDvK24X44aO1wiDu2lgcWQAXbtIQHebMxwphv7P988=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=oFO6xKrx; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="oFO6xKrx"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 7010F240027
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 15:08:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1784380113;
	bh=LEC8c5ywrxayZFx8HKgXhGV5NObkBgLx0uZlxtjvDU0=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=oFO6xKrx00MwNqCISzsa/ddB920NquVjzcDPPkX1fzvZfbQ2BateuXtqNxUSTJQGq
	 VAiM/tVe2hqgxFAxFIjftO5urw+7iOI09mgAKZicePPnqZe8kltJ+RUQyK/kEomlSl
	 9rpIBt279EmebLtQjmEnXMZafHbMdC6vypukqSzBPiKsjeI/CgdTtGd7O4Fg45K2lm
	 dTAoJWdskqMFx3H/eLHSvIaQEJZdU2vzeT1U3Mqj2QBTghNGg0TGRU90pEypoAu06k
	 smMV3smgE6RtpaODTXD97ccVbqvNECqInu4cIdeAJRq4Uv2tYFMaaLmEEJDESFW/DA
	 dLrnfp+f36pBw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4h2Rt903lYz6tsg;
	Sat, 18 Jul 2026 15:08:32 +0200 (CEST)
Message-ID: <ca639d7f2ca93533d085e72603c3aa8ff530b9d2.camel@posteo.de>
Subject: Re: [PATCH v2 4/4] rust: serdev: remove `serdev::Timeout`
From: Markus Probst <markus.probst@posteo.de>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org
Date: Sat, 18 Jul 2026 13:08:33 +0000
In-Reply-To: <20260718125757.C986B1F00A3A@smtp.kernel.org>
References: <20260718-rust_serdev_fixes-v2-0-e5214e03de13@posteo.de>
	 <20260718-rust_serdev_fixes-v2-4-e5214e03de13@posteo.de>
	 <20260718125757.C986B1F00A3A@smtp.kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Lq9dZlOM4CCXO2Zhgb4S"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-Lq9dZlOM4CCXO2Zhgb4S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-07-18 at 12:57 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The signature `impl Into<Jiffies>` fails to enforce time unit sa=
fety, as `Jiffies` and `Msecs` are type aliases for primitive integers, sil=
ently bypassing unit conversion.
> --
>=20
> --- Patch [4]: [PATCH v2 4/4] rust: serdev: remove `serdev::Timeout` ---
> commit 0f6c93da8f797f31f699e23c7c0c2ff923d0ea30
> Author: Markus Probst <markus.probst@posteo.de>
>=20
> rust: serdev: remove serdev::Timeout
>=20
> This commit removes the serdev::Timeout enum in favor of accepting timeou=
t
> values through an impl Into<Jiffies> trait bound. This applies to both th=
e
> write_all() and wait_until_sent() functions.
>=20
> Link: https://lore.kernel.org/rust-for-linux/DK0SX3P5K1J6.1OV4ETJMXW83R@g=
aryguo.net/
>=20
> > diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
> > --- a/rust/kernel/serdev.rs
> > +++ b/rust/kernel/serdev.rs
> > @@ -505,11 +476,13 @@ pub fn set_parity(&self, parity: Parity) -> Resul=
t {
> >      /// [`Device::wait_until_sent`] to make sure the controller write =
buffer has actually been
> >      /// emptied.
> >      ///
> > +    /// Use a timeout of 0 to wait indefinitely.
> > +    ///
> >      /// Returns the number of bytes written (less than `data.len()` if=
 interrupted).
> >      /// [`kernel::error::code::ETIMEDOUT`] or [`kernel::error::code::E=
RESTARTSYS`] if interrupted
> > -    /// before any bytes were written.
> > +    /// before any bytes were written. [`kernel::error::code::EINVAL`]=
 if `data.len() > i32::MAX`.
> >      #[inline]
> > -    pub fn write_all(&self, data: &[u8], timeout: Timeout) -> Result<u=
size> {
> > +    pub fn write_all(&self, data: &[u8], timeout: impl Into<Jiffies>) =
-> Result<usize> {
>=20
> [Severity: High]
> Since Jiffies is a type alias for usize and Msecs is an alias for u32, do=
es
> this impl Into<Jiffies> bound silently bypass time unit conversion?
>=20
> If a caller passes a value typed as Msecs (u32), it inherently implements
> Into<usize> and will compile, but the value will be silently zero-extende=
d
> rather than being correctly converted via msecs_to_jiffies(), resulting i=
n
> timeouts that are grossly incorrect depending on CONFIG_HZ.
It is intended to be used for Jiffies or Delta only.

>=20
> [ ... ]
>=20
> > @@ -570,11 +543,19 @@ pub fn write_flush(&self) {
> > =20
> >      /// Wait for the data to be sent.
> >      ///
> > -    /// After this function, the write buffer of the controller should=
 be empty.
> > +    /// After this function, the write buffer of the controller should=
 be empty or the timeout
> > +    /// elapsed.
> > +    ///
> > +    /// Use a timeout of 0 to wait indefinitely.
> >      #[inline]
> > -    pub fn wait_until_sent(&self, timeout: Timeout) {
> > +    pub fn wait_until_sent(&self, timeout: impl Into<Jiffies>) {
>=20
> [Severity: High]
> Does this also suffer from the same unit safety bypass issue, since it
> relies on impl Into<Jiffies>?

--=-Lq9dZlOM4CCXO2Zhgb4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmpbetAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSI4oP/1x1APDTk+m+ukJpOblL
Z6QQlB6JLmBP4fHKA8VH+MHEuB+F6nhlcBJZwoctwegfDx2Y8hr1y2ufNVMKtO5e
xiUHn7+JH7wO8+HFkt0W5hwmZz0JPrZeWUuctaMipSNAv0Zx/upOJ2IepcNy9BxA
slcD1H5XlWHT0rWHxZ32ZP9DK0SHm80F4MYNylDFegpD15rhzsSG1HR5YLUZlm11
gv/rHEhYSx6WAllmXQUNWCUNxA4KMHmWG1Ke4VqXsecbkEE33JYVtUtzU1/8oOzi
YDbLUcEgxJGMC/Op2KQ4wtRmChkCaDyXIwWYY7EoypDEQGMIBE/5xo5GVtsjVX1c
crFe5VXNaKJrwN323gbV9SVsmxu1ab36x3uRT5Cch2X1F7IHM7h+faqNIGlEFp/8
u7mjwGegynbqikwuX89ejHNLmP1F6TV5eVQcKxatMeckoWntgxRITtZYPmWruYFH
jH7WvtaNmrd/hnsmXIUeAQ+ay5FLlaOLtN25FiuHhrVybX+2frmHHZrRzGsM13WM
/Hw4IqlGBJAdP6qP3GmobzTsHYt9Sb1MAtEJR+w0UgXDW89T+CRgG1byR/ao8dCz
Nh1swZyzZ51rb7njEDLsIFjbLJxVqz9cAMMgXSHd+gPyxoZA1XPKv9rtMy5No/a9
iM8mcK7NMJanOWVE1oAyj+HW
=2KrD
-----END PGP SIGNATURE-----

--=-Lq9dZlOM4CCXO2Zhgb4S--
