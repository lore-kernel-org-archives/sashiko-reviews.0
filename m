Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927373;
	b=k7Mpa35CFDnN+5IAOP6muhXXaJyQoFdBRAs2wnYRRMT5NCbMhnBVNGGBztQNkZgAe2KH
	 2kK+FucPs+k85dUIdAo7gLlgmFxt6PsMVdZZa7jZ9X9gJ3ZQL1AIJnPfHmfidzqT+/8lG
	 55X319j5N3EkZoqwPgANE1KhQBxF9vKV3cNV2JVMvU8ZDTiYkvLfqTU1HwalrTzMg8nTU
	 eWFUdFCOkDlIae3pjcK7TUix8niEK5Uh6U6Y7pYpCsDQ0ZFHcULzIoRwcaCTXjsOwwzAi
	 xQ1zA5r+zE3/aCNAu4AU3aOdC1sLi6Xs93f/Yg32j2bchmQaVynSi0FjgdA4VRnYYXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927373;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=w4JGQvI664VpDb1Fh13jCOJBoCesF4YR6bUiuqxzVQE=;
	b=SEchoJFw/azC1Y3tQBTfELNSfd2AxAsdWcQJ5GzIYdOLf1IcwodwOMSlJ5DrEWUMXqDX
	 SIHZgWiM37+3maJl65GDhbhHU3bXZ/ioA5h+jH4wCJiz4me0jHg8rQWpuwMfOOMMCwanI
	 +SCbTCUVzPG1jfys5ZCIw/7kG4DpQ7EdwUpM0kTPiHJtzynF7aGcI9v6NBru8HUKhlqcf
	 AaWXPjzISrUF+6mpkvsNluE+7E+k61AA6vw4RANvHGJdj4pQ9XzTsFOlD2BIfp2sIihwd
	 sku/CoAngWgYwuW5Jmq8oOMyYVIYfP68o3JujwfUyR+D2CKqI5ZRyTSZIp4imNiuNaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJFgrE54;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3092606A330;
	Tue, 17 Nov 2026 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJFgrE54
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87331F000C5;
	Tue, 17 Nov 2026 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794927372;
	bh=w4JGQvI664VpDb1Fh13jCOJBoCesF4YR6bUiuqxzVQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KJFgrE54vuCNkhS+w95HmBU791kq1zEKu8Z4t664W3ZP7067G+ntmn8zz2RGUunYd
	 STrgIgkSJSwOruYFXwk4ZHSkx0JPVl+Rm6bsuXS73XOWztvLfCrK/d+REfB8Kg8+gC
	 Cd3Z7dHcxOzKFJ5rnm91FnkeFYATt7wDRRjAeYMuoAIK7UWfURDL2kASwTuXiANj0L
	 9CkYfQ9IQYGZlHnRSngP6GSkE6tKXjJBfn7AmQ1FT/7Acg1Xj92PbVllrJMEn1UwUc
	 EAJZ2Do4bnZHC85/TxXSE3Ax5kJgyETmvJU4v+0eJ7LYDxnTlxFP9Kr/zIm3Hf3ZyI
	 QvB3d8zmSqQSg==
Date: Tue, 17 Nov 2026 14:56:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: sashiko-reviews@lists.linux.dev, linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: cs35l56: Add KUnit test that widget init
 doesn't write ASP registers
Message-ID: <afc8e84e-5288-43ce-8a1e-1bb75eb6d7d0@sirena.org.uk>
References: <20261117125937.658976-1-rf@opensource.cirrus.com>
 <20261117125937.658976-2-rf@opensource.cirrus.com>
 <sashiko-outbox-218869@kernel.org>
 <aa8c43bd-d55c-48fb-a022-060bdfac97ff@opensource.cirrus.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uh6dJoF/wFAc5m9u"
Content-Disposition: inline
In-Reply-To: <aa8c43bd-d55c-48fb-a022-060bdfac97ff@opensource.cirrus.com>
X-Cookie: Marriage, n.:


--Uh6dJoF/wFAc5m9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2026 at 02:22:28PM +0000, Richard Fitzgerald wrote:
> On 17/11/2026 1:23 pm, sashiko-bot@kernel.org wrote:

> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:

> It's so annoying that Sashiko only mails the review to the author and
> one mailing list but not the maintainer or anyone else who was on the
> original email it reviewed.

This is optional per subsystem, someone could send a PR to get the
default changed.  I think there was some consensus to do that from the
in person meeting at LPC, though TBH I don't think it's great for a lot
of submitters since it's prone to reporting non-issues or just plain
wrong sometimes.

b4 will show me anything from Sashiko using API calls so I don't need or
want emails myself.

--Uh6dJoF/wFAc5m9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8awMACgkQJNaLcl1U
h9DRLgf+Ih4sVLUZ12OlwaIh7RUkI8qU3yeytOIl3Mm6/cp4MKafiI2wuEmH60/h
zuPRk1JLIho/mnepHnxtR3cuJg/Smrjyd62ARZGHwhD1tc+I1GARNcms3S/LgUIY
HsoFGVpyt7Roeuv3LIXNY9ASNF0GSF47DgtnZLMJx1kcbldR+kZDBy4IfW5sVyOT
KsFZmxF3DBf1HGlKlDKCyBSA9V/DuYDz06x2OVHJs/vGZz9Qb9PalWjUoofknQc1
nUOtx0tLT7CkYAkBh0CDwgezHZPIRRHDyPABkuwgsmJJ80pjOWpAC9t0xQNnLY7r
L5gJjuNlVv2WjPLeqjilLPg7AK0lIQ==
=3s3q
-----END PGP SIGNATURE-----

--Uh6dJoF/wFAc5m9u--
