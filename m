Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAB33C8C49
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775886; cv=none; b=C+ufylp+r+RIUntyM7at6GRDnPuSXuxkUbySZy1ZBGlMmiH30ZpAk/Jv+anMrgCzRsN1vToY1SgkYbLGpEYEu2zE6+/o/rj91rvjWqlavuqTH0S0/6kh5pH/22TyojErXded3MDTct291QZWlAkzE9b1r0XzrQSqKA9nWpli1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775886; c=relaxed/simple;
	bh=Oqx/l3rviU3aX6pHP28Vdd7aIxHWEvQAMMcf7e8LKzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXy++j+gzXMHQMPNsaIVR1mEbud+9gqBzsq5MsjA94FP0I9Ia0B5j8k4ueBapUvCOI3eAo+kbj2CTsXBu1e+S+u4rtEQNncm+u9WdF4G8iL9EyA5S2b1mY/J0jOLdPEKQhEXezlWLvdguqovDpFKHCKi3fv2hUX5qWp4OMnrJAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kGgKe5xz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kGgKe5xz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Oqx/
	l3rviU3aX6pHP28Vdd7aIxHWEvQAMMcf7e8LKzg=; b=kGgKe5xzk5G9f+YBdfS+
	6JCCGrAmHq0orRiWmQTKNqKK75JyxFJSUGWU6Hgh/32ZJaIK5nwwKw2o1x5tfDYk
	iSOHzjRXOzPybG0AG0QYGO8OUlGgoDb364pO2pHYJQ8rLorrs6OcnnZ/262QHODA
	MkboVHl8gHmpKRh+0BoI3eDYaSQNUi/DNsX2n7U4aMA+KvXF9FCw6H6WhJV7RX6R
	3jA+TIuM3diI0k7LSVK22kpUkDyAiMH4mwjwy463TJOozMWa1qUBL3xVSU2iXP9L
	KmF4IwIBfXP0urVCarlBdbmtYZvI1eK1pLz9xK1POeFkJtGYepTceUYGKxGl05+c
	Ng==
Received: (qmail 2343451 invoked from network); 7 Sep 2026 12:11:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Sep 2026 12:11:17 +0200
X-UD-Smtp-Session: l3s3148p1@tnjA1uFaQp8ujnsC
Date: Mon, 7 Sep 2026 12:11:17 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: sashiko-reviews@lists.linux.dev, Chris Mason <clm@fb.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	virtualization@lists.linux-foundation.org, ksummit@lists.linux.dev
Subject: Re: How is sashiko bot deciding whom to Cc?
Message-ID: <ap6Nwf94aq2dk3WD@ninjato>
References: <20260907055646-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ukpn3ScpmSWIkEka"
Content-Disposition: inline
In-Reply-To: <20260907055646-mutt-send-email-mst@kernel.org>

--Ukpn3ScpmSWIkEka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> So it picked some mailing lists but not others, and some specific people.
>=20
> Is that opt-in somehow? I'll be happy to get Cc'd on the auto-review emai=
l.

To get me CCed with Renesas specific topics I sent a PR to modify this
file:

https://github.com/sashiko-dev/sashiko/blob/main/sashiko.dev/email_policy.t=
oml


--Ukpn3ScpmSWIkEka
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqejcEACgkQFA3kzBSg
KbaU2Q/+LbU/+mSXPvVLMjs6D+LVE70LG0Whq76bO4zbytOfYavmIG3oJ/PfHYPy
0kA7r8MoKcJG9aPri2eQnCKshhkd9DhUZA4dsLi/ojuF2WPu4LyW6ebf9udjcE23
Qwc8kVe8qIShZzWHz8QXlrTQIpAfJf0Sjm1bL7XCte8f2BFys+LuXV4LLHSSLQpj
JTlGvNz1YPd162sUDNUR4TDBfXZpBLJqbIcp6mAESDAf5Wc5VtJ7o6ypjjQSUeI3
Xe50WgwWj/j/jr4LCOnlnlXO60U6gt2kcNf8IzCubAOCGkKVWjuGKqmAFrA9Z0il
44nnphDpQ9MbGU5uj9PjWdDXruirnGcwQ9hoClVMx8jfrutH8pO6m7XG4pN8br5W
+P1jtKimQhPw7/wVbTPktX5UADMMT1F/CdjsB7sZHD8MFuQAeaHkBuVUb+ufyAjL
5FlhyxwvPxeMP740ZbZjLO9Uo4Q2feySR9RI6BH7LAQ0ul0DsyZw7FM+v7iGMomY
/TRiBrpA1R7E4eK0qHOcJAnVQZWkO8xLNGrQok1D26QnR6Nwov2Wq2430hQNGNP2
YkoJIFRgEGEvFHRnGwNHDTVeR2gP1udQEfdv3i8yko6EFPaMv6GxtfWilGRpzU1c
cp4/xbjEg5qQTU93jIhEHgPi6keQqIyoU5tR5Qd4G6kq3/gKGjI=
=lhkt
-----END PGP SIGNATURE-----

--Ukpn3ScpmSWIkEka--
