Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29A730C16A
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 18:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778869451; cv=none; b=Sr8fFsY5zehZWqbrwK1LtB0Gi29qXT7HN6Fbg8K+P6M44eiO/gqT0iMzbSuIdN/xfsU3vl6AHGn6fC1U2akrSGFurB3vmg4pDUh6E8OG17/R2CZNAVJxlSUdvrhd96tMEbJfg9VxrYNger/4SM6EhH685YKLmJNF5ADbVAE7LSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778869451; c=relaxed/simple;
	bh=AS71pRucfmN809kwuhAvoeRxAmi2KmVqk2IGzHnfojw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H8SBVGkTlQw1K45jR2ykp2gb4OwZvA94BHHvnU1kDXBlEo6AzUPX2F7wc8ZmLEM0PeKW8J02xDW3pmQiG3nMC2spjMSNxShg54Yp05f5aFpwiC2xriHrzt+9fdd/+OdACpHUnKbtXy+pONSJTi3QHQfZnT8u65kpQjAixxnmSH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlecuW02; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlecuW02"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67f7caa33easo287894a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 11:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778869448; x=1779474248; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AS71pRucfmN809kwuhAvoeRxAmi2KmVqk2IGzHnfojw=;
        b=VlecuW02aoEhCTcmnhoePGmoKP2kO4DNMoX8AoE/aKwzSMYKrGQYJmfkkzaWA3A88V
         Nf9ESCm+pOjvuJxcaSQB0OeXLLYIsL8WGK1Cm02n19QEYXgQBrfVeAP1/mlSJR+CzU6o
         GvOszI+onxot2yGLkRTSMs8DAn7GshsL60SMlcyo+Z9dH/F3sKf3lLeQNLk3H2xc3OsC
         k/fvraJZXV/aRTQ4kt78qXpKObJ2KsOFWexEWoXFH7JWRpoYvZfJAyKAQVLU6PILe8wr
         8xx1WXt+E8P7kXnbjLnva8S6OwA9SFWr8fS9GCOYtZQPDhRKa0qab40S4Gw7VseUdLrD
         NCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778869448; x=1779474248;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AS71pRucfmN809kwuhAvoeRxAmi2KmVqk2IGzHnfojw=;
        b=QpT69yaqMkaDwGATIntfAI2TmgtQqALP70HTJ4By/SG67FlmG9kAEPDMlPHu4Dx8Mh
         gyEF3ytjQE42k8TpJtGN1mIulKgmd6j3nb65hrIWtuAG9OfqkZ/Doirr9AaoR8z5isk0
         Qixeem660Am+7/mIScpIxDSndYJiFdtz3kfXcWeXujcttAEFH0mYIPNFSzdo3pL3lBiB
         wVNcOOIn5hr3qhVI6E/TRZKwXGIQPgcCDuFqTdCGPcCy+Kpcqh9/+d+r07wNbOSKCh+Y
         BXFoKmKITFgoeoe0QnoRPOMIQg9vZCYTFP3BIRHDl7xc/V0SbsvYfGlF+LJGGI8XUUHT
         7lXA==
X-Gm-Message-State: AOJu0Yxgi49N0UCBl8icLA+QHRUm86hL/zyaj9HlKQsdChECT3IksrK2
	MkHjyb4v6gunTPA5mGNBQqACrrAarHcU7Ftou1LtyNSl4taKNKBUwRmD+urfXYODGic=
X-Gm-Gg: Acq92OFwcM9v+JeK9RUyS41DDsDZrJAltdKJXaqhkNSw4Awd14uSgP0SukC7maOyhv9
	uEbXJI69TLk23/XulZ2HRbsYn0/0elEoV0PYv+LGNHsYxtU2pbbzsXRWh789m4a2191wl6cCFe0
	hpZ32Dvzi6i80Rwcdtq2jNjK03QNo0JkHnW1PlA//IwowsQRlSvnbwMDRpXXRGsPMT4X7uqDR+C
	hLCu8XXoDiM08z7wYVCxnQkxgxfF8zf6wgKsRn4SUok2GK5sXpdwUijIZflHStMuZB5bXaBR0MO
	okRUoGqlG5sGHzb/Nfzp8OVZFylI9RKjinY3HNfPNLNPJCGHLxYktbmmBFUWkbuBXt1vnHaGL+9
	iWxJFLmTJQZYCiN6idAR3L7mYTwj34Rwvve1PHScuG7l227+72e68DRkXxCFijvILt6zYr0Sx6M
	jsMM4Hg9PbSHDcYBddkAZ3VqWr6jAj4bWtk/cye78Vur41PbVFKnNIzbs=
X-Received: by 2002:a17:907:a0a:b0:bd0:83bd:3335 with SMTP id a640c23a62f3a-bd517865246mr272707666b.22.1778869447854;
        Fri, 15 May 2026 11:24:07 -0700 (PDT)
Received: from pc-oliwiera.localnet ([2a02:2a40:4bf0:bd00:6130:de6:bb7:addf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd0992sm254422266b.13.2026.05.15.11.24.06
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 11:24:07 -0700 (PDT)
From: Sigma Twoja-Stara <sigmatwojastara@gmail.com>
To: sashiko-reviews@lists.linux.dev
Subject:
 Re: [PATCH] treewide: replace /usr/bin/python3 shebangs with env python3
Date: Fri, 15 May 2026 20:24:06 +0200
Message-ID: <-akktSauTROVIklUiOkpZA@gmail.com>
In-Reply-To: <20260515181547.99D82C2BCB0@smtp.kernel.org>
References:
 <20260515180806.246914-1-sigmatwojastara@gmail.com>
 <20260515181547.99D82C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartkOuhbjIORWOzEg2RstV0qw";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPartkOuhbjIORWOzEg2RstV0qw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sigma Twoja-Stara <sigmatwojastara@gmail.com>
To: sashiko-reviews@lists.linux.dev
Date: Fri, 15 May 2026 20:24:06 +0200
Message-ID: <-akktSauTROVIklUiOkpZA@gmail.com>
In-Reply-To: <20260515181547.99D82C2BCB0@smtp.kernel.org>
MIME-Version: 1.0

Dnia pi=C4=85tek, 15 maja 2026 20:15:47 czas =C5=9Brodkowoeuropejski letni =
piszesz:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider: - [Medium] Commit message states it replaces
> `#!/usr/bin/python3` shebangs and causes no functional changes, but
> actually changes `#!/usr/bin/python` to `#!/usr/bin/env python3` in
> `tools/perf/tests/shell/lib/perf_json_output_lint.py`. --
>=20
> commit 7d3e9689ede53be80434b3ba8cd07c27777d11ad
> Author: Oli R <sigmatwojastara@gmail.com>
>=20
> treewide: replace /usr/bin/python3 shebangs with env python3
>=20
> This commit replaces hardcoded /usr/bin/python3 interpreter paths with
> /usr/bin/env python3 to improve portability.
>=20
> > treewide: replace /usr/bin/python3 shebangs with env python3
>=20
> [ ... ]
>=20
> > No functional changes intended.
>=20
> Is this description accurate?
>=20
> [ ... ]
>=20
> > diff --git a/tools/perf/tests/shell/lib/perf_json_output_lint.py
> > b/tools/perf/tests/shell/lib/perf_json_output_lint.py index
> > dafbde56cc76f..dccafd507bb79 100644
> > --- a/tools/perf/tests/shell/lib/perf_json_output_lint.py
> > +++ b/tools/perf/tests/shell/lib/perf_json_output_lint.py
> > @@ -1,4 +1,4 @@
> > -#!/usr/bin/python
> > +#!/usr/bin/env python3
>=20
> Could this affect functionality on systems where python defaults to Pytho=
n 2
> or is managed differently?
I had tested that script with python3 and it worked. The syntax anyways is=
=20
Python 3 syntax, so it wont work on Python 2, so its safe to use python3.

--nextPartkOuhbjIORWOzEg2RstV0qw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEJq4cYbVoHbo+BAdiJS5NBMDqPbQFAmoHZMYACgkQJS5NBMDq
PbRS7wv+OsIGsBuuDAoQ9gySaHTq7GANsNvBBRRcgBpoKj6dn6eK8xg/UFpvwBGK
PNySm4y63xtriBDT0w4kptZ653XgbEdq4ugwSkOIHvVLC9ivhSws2AUbvvNHavO8
vCiDnZdEdeKxZm3kPhejRWyMh0fX5vzANwJIQjHQQr+Cl1RuTqeFG44tFBubC/F1
SeRIojcRB+jToPHE6FRTTs+kSEouVuM2zUN5WPB7fK4obyEsxoSlYmE7jtqgPJi9
SfkENoAExfqZhJUZsY07K/kLcxj1NRmC65NJBE59DUMCrLuD9PLToiXtOwqE0PjN
yWunAt1mqbsj7HWTGD2vBO/7vlGghtMkRt9xSgvguj9Zu8eqsjhtoz0EagxcNmTa
O4CK5xzw0kWkYN6rR8OzpRzha6ChLad4NU7aPCVAq1oiyA7LicChv7j6qDO6/7sl
eUlKpK8IJgjOXYu6h2vftQvHTPUVdCcqI/GTT+K4p7NBmYosiS6yZR4EtQba/wPg
NNWWGnDN
=CQYj
-----END PGP SIGNATURE-----

--nextPartkOuhbjIORWOzEg2RstV0qw--



