Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.189.121.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006409;
	b=hk4K98pIPVHOcN6FAwSTR1R+1UWjlDsnKl1YAErm1G+VYO+f645KaWCO+/M0pAJ/Ls/Y
	 qnIsT1sanSIuXtHqPM/M29oYTUhChkFitNRkMHF53y6L+fyEy2FUuXh2oXxjpXXzxS7qy
	 MljsyJ1dWfLeObndL/ut0oxZWT5u6F7NrDWFsFLGtA3GTzue+WBOMjpYA1KH1pxs6lyIq
	 mgcGadtAhwZjVnLmmtBGhhP9ePAZJkaY4MZsvB2ZOvs3YCWWYbkFQsDgEges4/QKuXR4m
	 jxIlVNF2rp5EDXyRHT0jm30Z3kzGfYP4P2GpzWAy/BlfSNC2D/5wSRDnBaqm6qSM8VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006409;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:MIME-Version;
	bh=KWrc5VN7yT42tqPLw7rYJmyMVxl7tUpmfInMF0IRSZY=;
	b=S/KSkJcSl/dVs7Ki8oyfJQO5jtKjkc0qT+o7sfWykqTUY+DrLsCvlLxyTLd+1+nebur8
	 ZvgMOm3ddSHA2rqMmkU0lsJBfLj6d9a4v4fnLMDCX93ywvv3U+ZcuNSi4gdfzbxKboN9E
	 8UwyeFsZKeTh9u5mhizz25sg4RatY9k8lutlF4IxcaMMUeSI1cYdXAQ+DyBf1QqkY5a2o
	 Xrwrjwjz9cSXBqipjdROfgSO4HBaWvbwd8IOtcJhJvKJ3W5rBsf0HbO+5yEDl0GrIBhJT
	 aFEBeGCEASnaVQ+5rBroJDDxf1v2gSpSkfYtdVabZHikWMbpoBGivkFqOmYPLl6MH2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=itx.no;
	spf=pass smtp.mailfrom=itx.no;
	dkim=pass header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=iMe7wvJb;
	arc=none smtp.remote-ip=91.189.121.228
Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1DB606A334
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 12:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B1DB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=iMe7wvJb
Message-ID: <fead846b415ddff4e2a97acff37c3dc40c107d3c.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1795006401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KWrc5VN7yT42tqPLw7rYJmyMVxl7tUpmfInMF0IRSZY=;
	b=iMe7wvJbzhnF/FIY7scBmR2G/cEKuqtjZ24WfRS7APzoqH5Mwta4b3gvAiRkna9c+Gx2gM
	eTyiEhOpHSDZ5YM+9yPWAqNAx0lgDgtWozrdMkCLkH6eS+bmwhKz6HriNmetZXMSuVqcrh
	+FKwNYoV8XBA4BlVjV6NG1Drmbr3SbA=
Subject: Re: [PATCH v2 1/2] sparc64: Stop the hwcap-list parser at an
 unterminated entry
From: Stian Halseth <stian@itx.no>
To: sashiko-reviews@lists.linux.dev, sparclinux@vger.kernel.org
Cc: Andreas Larsson <andreas@gaisler.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Biggers <ebiggers@kernel.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 13:53:19 +0100
In-Reply-To: <sashiko-outbox-220876@kernel.org>
References: <20261118115537.160675-1-stian@itx.no>
	 <20261118115537.160675-2-stian@itx.no> <sashiko-outbox-220876@kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-hi747SlEPGLCVfYnjJEu"
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0


--=-hi747SlEPGLCVfYnjJEu
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Wed, 2026-11-18 at 12:07 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
>=20
> [Severity: Low]
> This fixes a bug in mdesc_cpu_hwcap_list().  Should this include:
>=20
>   Fixes: ac85fe8b2124 ("sparc: Sanitize cpu feature detection and reporti=
ng.")
>=20

Yes, the loop came in with that commit.

Fixes: ac85fe8b2124 ("sparc: Sanitize cpu feature detection and reporting."=
)

Could you add it when applying? If there is a v3, I'll fold it in.

/Stian

--=-hi747SlEPGLCVfYnjJEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCav2fwAAKCRDoeAEuJe36
VutsAQDhMlTr9OgxrKTn6KDAx+emKbqBtKGJgTJcJEdBIeQbOQD/dJJ/aYUyVS/B
W8EVbt5B/8d3nM0cuZLUK1Cnmnjs8QQ=
=oVuM
-----END PGP SIGNATURE-----

--=-hi747SlEPGLCVfYnjJEu--
