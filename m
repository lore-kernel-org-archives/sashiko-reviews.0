Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEDC440637;
	Tue,  1 Sep 2026 16:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279296; cv=none; b=RJM+zEYh95+kA70jnqYW62jfwZzmBczFqwpmSqBv8GOQ0kDoEAYcJ1PGSDrquFgm4GNus1VmuJQloMZdqx+qzthW6wsXkg60nrf5J+B1rx2Ah+xHCdE0FdTLyaCzAoOlgGUuLftjq/4SdBjj5A1OzOiove1MyPRqiYDSjb4m3N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279296; c=relaxed/simple;
	bh=S2+d6sioky0oy/VglVL55+Wq+ng2ODNppYHvXa/xaAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRSE9vlEL94g3YbvBOps5C0TUKSA+4o+j9+hvOavh/fI4R+p7JOQgj2XZO1lq4phsApuqVpf7+s4r7oqt0oEn4UWnGcKwZPft1N6/1ymd+UoBO24KY8oljkkSFoAKKrCaGAiAbQSGHLLL+K7oS7Tw0tBR1i7AxrSBr84LrY63nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wkk6/Imd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wkk6/Imd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8601F00A3A;
	Tue,  1 Sep 2026 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788279295;
	bh=S2+d6sioky0oy/VglVL55+Wq+ng2ODNppYHvXa/xaAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wkk6/ImdoBpcbGKgqNrMQ39n5Q3W+pgeniuecK5UbYVNNlbl/5PRGsXOLOfnhzzBF
	 CD57SzJGtHzF7hDh/vK26fMWE9WZv98YXCDdPhO7CxIv5lqHf5dRuApnrJ5aNRQi2P
	 lTyqYJf+slyRPAM4+LZ01wkIH3ld9r4we2Cn5CIFh1IIZsMWVwcL8vIaYPAe5+4stp
	 LHmu9SRW8BBRXJmlucsM9Vw7eCDJAqiSzdUPOXS8q2JNZcDHGAgSiRLoBLEXGBB3FS
	 gRfc1pUsG8thao5OOGHlbmRGzXDtZWlMoZqha+L6S/VJwGAA2/5BpqKNesTsuc9El7
	 oHXGP0dUj0S3A==
Date: Tue, 1 Sep 2026 17:14:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] ASoC: cs35l45: Adds support for SYNC bus
Message-ID: <d0940aa2-6bff-4a79-a7fe-fe9de1ac24b4@sirena.org.uk>
References: <20260828-sound-for-next-cs35l45-sync-v4-v5-0-fe3feba709ff@opensource.cirrus.com>
 <20260828-sound-for-next-cs35l45-sync-v4-v5-2-fe3feba709ff@opensource.cirrus.com>
 <20260828155715.233751F000E9@smtp.kernel.org>
 <5dd66981-8b03-48f1-b8c0-90e391784257@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rdwmME4vjnxN9KZd"
Content-Disposition: inline
In-Reply-To: <5dd66981-8b03-48f1-b8c0-90e391784257@opensource.cirrus.com>
X-Cookie: Prevent forest fires.


--rdwmME4vjnxN9KZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 01, 2026 at 11:10:59AM -0500, Ricardo Rivera-Matos wrote:

> Are you expecting this comment to be addressed? I am not opposed, but the
> suggestion does not fit the style of the rest of the subsystem.

No.

--rdwmME4vjnxN9KZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqW+fsACgkQJNaLcl1U
h9BUVgf/e+/2PAR7QIxQ7iuVF0JQtzFc1ab3yFsHxIcg/quRzAqfQBPf2mZBoFfL
ietVYK2v2/1UDjaiYLm2JvSVNvXVygWqaO0U/dBnOIJWGEY6cevnRQTE1a+VJ8TZ
r+z9ROft8awI9zC0PQbJKKoD5/62FjFyLI2C+0/++D7X6OyZQavyC2wP80z7lVMw
2MiRw+DU6BhmP/XG5hzEIo4iVAUBDaag4W7wVCZbFXlN/pHMRiC5mmlg80WacWt2
nQ/WQzd+dFO+m1iu3+OzCF042E0JoiVU4i1mVqDARuJp2ckXpeZpshWAxgsyh+8L
DLtZn6/HftXF30YUIY/Ygb60d+Te5w==
=18EY
-----END PGP SIGNATURE-----

--rdwmME4vjnxN9KZd--
