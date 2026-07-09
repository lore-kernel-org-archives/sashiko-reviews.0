Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2E336E497
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612049; cv=none; b=taGVKGAxezGSvMjz7+wYpd17pFDtCJy3fpRhq6dxNx3zyk7a6hisQY8F+aFzbJwRgRr7qB8AEG2SwuGw+uo4TDzOGd276oxf8RZ0nCBL16Pe4Ec8KdHd8HlC8Hy7qKxfYcIezZ1W147CkVDkDNolPDJZJiG3TgPQvYguyeNiyAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612049; c=relaxed/simple;
	bh=EA7L7caIXI2XAV/oDH4j4Pgo/dJQkGiWu8U2J5PGXRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3xjz2rVLlXWPLCCgID8wmmHrCVJZwpxEMzB9kqML0cpqr7EcpaMw/TMEmMT+/nVYBOEtOLK+Ssw2itHIEizXPA6DO2chVzfE0s6PQ+Hft1X+xSnsvMho2CY+ZI+nVAlgLCtE2KJpoYxVl9AuiJRC4F2zrj74alDQzvPy9GhbFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kEh7G2k0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kEh7G2k0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ec555a26so6284525e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 08:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783612046; x=1784216846; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EA7L7caIXI2XAV/oDH4j4Pgo/dJQkGiWu8U2J5PGXRM=;
        b=kEh7G2k0zx6BuxgNgvQ2mU3a0QJUAioyXKclgmAbO7TgtzNbQQ9NCXStIuccTYvJzn
         utKWiHY6HmNjBJxjz9lLHXi2NVENibRm/CvJlMk3id+EM+PUo6eVC6pCST4vivFJ4xRq
         Tmp3cBEZroBPzOeq4oeTT2xb2mttAC0+834pTdlKYZc5UpUqyMLVxTCpB7ABomg+Ial5
         csBg/Z3bPAQ8GOl7k5WDHAQzchZMI4B8UBi09c4bpnrEkJtYW6Azq/tc6GADAggE7oD9
         ET0yGeFcQinDdykvAywpEFFv7MjvVjenFOAZ8/zt6DHcrwJUKQYHIy+p/A2HWg4ACdxV
         graQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612046; x=1784216846;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EA7L7caIXI2XAV/oDH4j4Pgo/dJQkGiWu8U2J5PGXRM=;
        b=Ya6Ptztx7cTm7jNVwEd1obCqvK3cAUyJFjlgPEmQfgPug61S0iwj22JoxQarIMHFOm
         WUjRhweLCBDil2c+/Th1b4jNAN578KBWLlmY/BdBIjvfVQqJ7om9/j42Bnhy8XGSKd9M
         JgxC6heDtGRJuZmBB3KcGG+CLv6P8k65Mh9bGEwMvX5khpQadIBmE3lKHWpkkctTGdH0
         sEHudUuWilJ3bAG3+FyYXKy/S3rZqm1jiRRVh56SQvUjVqe0LCuhpWk8eMi3uAeRkH8I
         alFspkpTRhmP+T8EAxLbvzKQa/Gk/9A1gKIrd9IlsvC8PEejkoyccDsopTN0y5zlXgjo
         3hMQ==
X-Gm-Message-State: AOJu0YwFF6OSxXAL6z8QXrvcxbEyk+PWjs1U0sZDLjXWR5ZcXhlYyY9X
	irUkjKL7rC5Nn1jGOjiYNPfoVQnOkdMQZ06QxMztjaof9MSQn3lEET//VXXaW0zwXuH1Q39Wk3H
	SXLE/
X-Gm-Gg: AfdE7cmLs34fcQxfHW1iJn97B+s1Qejhdi5n1iZUsHsp4MiY9x4+jPZGy8fZ4HtKXjt
	kEIxUjUnb4M0O5tsWz4pKil4J64mKz2gfXQr/gc1tFLv8I5ruMK6gNjwpejNf6A3OlqaEiMO9mR
	8taUjiHlqz797nk9d+rEiqi6yLRzpffp6zIs4EMzqLTzw/foHQw/c9Z42IuF3UvzjerTBobEiUY
	m8YRGq5Lpl5RRVMJ3bp4hqWdHC96ib/NacJ3aVDQpNyp0s577iO/t65/n6LneSpBaqWjcvQG/cg
	SGLEowrJvMDqZxz6e8FYfrSNeuG4DvlOz0OMTOLO2UrqFWUgAN43dRWcTx634/Q/JH7HuhZ9czO
	Hj46+YXXH4x59MXih5WdTJQT8VnbcvlZMGpZQigulmRAssPBrACtjffOjbT4wL6jwaEmrpsjazv
	Mgy/RPyM1pjsKbpcCU0k0KNFEXG1HcrR52CazGR25seqD7HJPMNK1ZJ5T4fcuwTCSHOJCGb5V1S
	VS/
X-Received: by 2002:a05:600c:3e88:b0:493:efcd:b809 with SMTP id 5b1f17b1804b1-493efcdb895mr16436325e9.6.1783612046460;
        Thu, 09 Jul 2026 08:47:26 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6ccaf1sm124528725e9.2.2026.07.09.08.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:47:25 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:47:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Subject: Re: [PATCH v2 15/23] mfd: Use PCI_DEVICE* macros to initialize
 pci_device_id arrays
Message-ID: <ak_CNIdQ1QvF5TKM@monoceros>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <afa9a60627dcc211c8d975c6a90708d421ead8e5.1783507945.git.u.kleine-koenig@baylibre.com>
 <20260708112723.080911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2nh437hk5opgvhwa"
Content-Disposition: inline
In-Reply-To: <20260708112723.080911F000E9@smtp.kernel.org>


--2nh437hk5opgvhwa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 15/23] mfd: Use PCI_DEVICE* macros to initialize
 pci_device_id arrays
MIME-Version: 1.0

On Wed, Jul 08, 2026 at 11:27:22AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Non-standard commit message prefix omitting the driver name.
> --
>=20
> --- Patch [15]: [PATCH v2 15/23] mfd: Use PCI_DEVICE* macros to initializ=
e pci_device_id arrays ---
> commit 01daeb728dc1ab5baf28174c28473f068ecb03ae
> Author: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@baylibre.co=
m>
>=20
> mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays
>=20
> pci_device_id entries are usually initialized using these PCI_DEVICE*
> macros. Adapt to this more usual style.
>=20
> > mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays
>=20
> [Severity: Low]
> This isn't a bug, but does this commit message subject violate the MFD
> subsystem guidelines? The guidelines require the prefix to follow the for=
mat
> "mfd: <Driver>: <Capitalized description>". The driver name appears to be
> missing from the subject line.

The patch adapts two drivers. I guess mentioning both in the shortlog
isn't the right thing to do?

Best regards
Uwe

--2nh437hk5opgvhwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpPwocACgkQj4D7WH0S
/k6+Zgf/e2P3Jm49aEWhJ3uv95ltjPYkZ+KJNBdK6Y9AVMqXklrF9ZwuMcVKFl+t
A+QvKKSQZFV28xhELbE2W45eFDeCNRN9fwqyPzjIXRTWsLHODclxYFlrczsj3vkh
5eIEZmmyiMxKk6scUpYFYQEODV/H79yEOuSKo0P1rRDCkHONCn2N+WmHVJvjhGUY
Y3tENhB1MP/n5Nw6HfLRg/BfLqQxz9zcl3reovvJha1dX1a27SDpb8citLmu4uIA
1fYLArHPSeBMAHZpZocMncfVRQsYc4Q38IynIggoQDggAcvJ2toNV5hhyRRR9zPr
vNeMHyvlQpg4VNes4oXJjgTwjmWTMA==
=3WMp
-----END PGP SIGNATURE-----

--2nh437hk5opgvhwa--
