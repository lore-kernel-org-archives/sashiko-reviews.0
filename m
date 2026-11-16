Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857535;
	b=fnl3iyO6VzFflq/Uuais4qrn1GaY9ffzLSHm0TXsyBGYXU6s+vLlO+uM6Ec3//qEtAfJ
	 gzglWSr6G/E224XLvM2b+P14RNcHUu8SpwOgj0VXhk+PsZxlq6dzITuP4r6rQHQAkpAtq
	 jgq56rSbP7Vg6zUp4HVC45DBM05GyJ+Bps5YEg3ee5totBXOR/Zh3o6mWQK8r5UROfc8C
	 fR1TxIy0DbI1M0XvxP8H5JQ2jNFBX0zUtf7kVp6Biy8Z/QcDDgks50vTSLvQeUx7LyHo1
	 +1Rvia1LPDukmT9E18nj7n56ZYmLTf0OIprXcE4kSEdpY8L3r8ScuB8ZkNiNO/wJ5gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857535;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=kOrKPAbJH9s20JY2TmteragNHBys0sbDG1IryjvDSNw=;
	b=4x2DOK/TfNhTZnW6K4X7wLxffSFZ/QhrTaz86A2HyHfz13Lm9tqh8Fqmarj1VT8gvpkp
	 jtZUdPwvkI2/6lozgjxbmLhWNDdWxCCpTdHVlYxh6QHSaalTur/l6MYYEjyWp107dtOab
	 eF58H+mCCA8ROnqoAgHTdabYSipzMAo3oUhSnZsltU4/IIhkkbMb8zYo/2uNaOupLmYOt
	 MNpYjkKjHCq1GMaQCqX5jrMEZ7URLyKK1SOwa8sYDMt8QXGzkubvssMKWidysQ2hAgWoE
	 XE/aruiU6AcYpgbZie9AWFilZswGJTkElYAO7woeaX4J6S6zvvIHXx/9MJqoMlHlb7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bk11m1zO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5555606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 19:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bk11m1zO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED391F000C4;
	Mon, 16 Nov 2026 19:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794857535;
	bh=kOrKPAbJH9s20JY2TmteragNHBys0sbDG1IryjvDSNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bk11m1zOVoy9EBis9tMld1Db9e1O0ixuhDVGSG8Hg5fjd/eLfn19i1yf9jjKgkBXG
	 3fPpjPHt4oLdpzaQ9ME3YBF0RtmKfQ5V/yFJ6hAHRcv4eYLV5CTaUe7WRiris4gGd9
	 ctb/0hBB+LA+QJ3LCLsWuqzA2Bx9sTw6L6o+kFFRB8R63EMsetrb6/ng8m1j1h6rAG
	 dOrZXhqA/PTePBI2bEwAAPa7CHj4/77k3zh41Yg6AZZZqvMSTMZZRS4hDNIEOB1XaA
	 pQyk5UJMVnNG4WZSAeCR6yheJMzZd/afVbObE5gM44wAlJC95FgxQlw/mBlMjsV4Qk
	 ymj09XLyavgeA==
Date: Mon, 16 Nov 2026 19:32:12 +0000
From: Mark Brown <broonie@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <21e60c06-3400-4a71-bdbb-aaec97cf0717@sirena.org.uk>
References: <avtUOSIWVojTuTvx@sirena.org.uk>
 <sashiko-outbox-217562@kernel.org>
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
	protocol="application/pgp-signature"; boundary="wXXAko09Ayc7sQIx"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-217562@kernel.org>
X-Cookie: Madness takes its toll.


--wXXAko09Ayc7sQIx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2026 at 07:30:02PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] drm/xe: missing Signed-off-by trailer and unresolved template
>   placeholders

This is not a patch submission, please fix your tooling.

--wXXAko09Ayc7sQIx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7WjsACgkQJNaLcl1U
h9DDoAf/copjfdLbXnLGeA1vBGLMg7FmtIB61eAhTO8qM9uEtTgZSQ/4YRwpKNqS
CnY5joPKiNj5LfexE96vxywxPWKm99SAZQGh98sxfWS/Omv2l7hf4wHzBWj++4e3
xNrHVmJ52p6MIgf1FaubhVbptvpZ78ydu2KV9dD0xWTcfxx6Sr9xq35nM8XGAtsO
6tDUPC53p78DR3YCQbDNP7rN/A6ZDbbbQAdX1S+/eRPsb8bJwF6P2i5QOJbYrqee
MOG016gsrVGa5C87u1x2G3+8FRYCVkSw43G5Q3aAIYPxqV0A4wvkHF+6uSRifjxN
vPAb7llG9c5A79GoqutLkQn1bki5pA==
=fw5d
-----END PGP SIGNATURE-----

--wXXAko09Ayc7sQIx--
