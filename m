Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC093FDC05
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727303; cv=none; b=k7a+sDGe/sTgIBA7N1APk/BQQHg/7cRsgE1yfuUYfNUmiWpbXyMYAfkF1cfYGkvPCHe9Aov5yzrrNneo1wv1XOp3JMFDTugjl3In88eBCskC5cM6riLGTocj7Dy6ksJrBiItJlZH+Pfjhvsn+AUfBiI6iWAmf0BhMlGNI1KdyHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727303; c=relaxed/simple;
	bh=BhvuqdmZgGlLMonxzMz6WGkvhntvo8o92vKjsq07kcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqagXiszXVm++RtOazKQr8Rx/TmFXTkPw0uCHxl5Wj14UWmvQtGiVJBG9KNSr16GHFNSKcOCGeXnPx6d6jzUpQbV+/Jp+b79RSppCytB0HriBE7REoBjtBpQ0QNhl4CzFSR4Yhqya1pknmas4uWsy1RvqPXXxujrwEV/+ASi42Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RC98etgs; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RC98etgs"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-472326ca506so587164f8f.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782727300; x=1783332100; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BhvuqdmZgGlLMonxzMz6WGkvhntvo8o92vKjsq07kcY=;
        b=RC98etgspkSkgil7S3na/TWttCO1zwcvViSuxeiJFx8BksABgcHQhgpCffXgwGvucR
         /dw54gjIu2Il8nQJpsqqC3i8C7UibpLiFrTsI/7ppfCVm4v7ZiC6QwdJnlfEivljMCz2
         Ye8qt4CWCFiJZRH7zN5pSTyg5m6kU8ZcGAbmkEqEPD3qHBipG0PShOpIkHdPdM/0OGQ6
         +kPk9Qas4o67XAePopFzmB7IAPz0fmc1HgbjrTAc8MNXac9DHm9JMUEStLjGObZZGx/U
         3BZOzy2dUcA8ra3Ue2FQWzJ4gO+IYjM/vsuiIllCHAJczCUyROjfDoJsfl2xXb04T3fP
         aypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727300; x=1783332100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhvuqdmZgGlLMonxzMz6WGkvhntvo8o92vKjsq07kcY=;
        b=ChyyvhE2UphtxjJFaBSv7nOBaPNKt9S67i5FWaVMB/JPNADW+xzGAjx2U5Nr57FIgi
         tI2aS0RKCk+5pOtBebn34DO1FAnNA5Xz9bfWcq6IIi0N1snrADkjgJN4DyUBZ8TOdYL8
         iCDqFWpXuCu3aCX9M/FKq4ym6keE4o+IABkz1uMYSc7/kZkQaSZSdVjnRzTK5uPkqdJe
         mE3y3ht1LokUzSOc+79u8KACHnH+QQfMmyCMMlD2xHsrQqiIR+C+2Xli7SP1UaT/Fngq
         DgSUsuKLn2ZjzY+4P05bNJKb0aKfC5tSSooaYPuPCZvaEVs5a3kgpSr8hRUaeVfn3ses
         VvyQ==
X-Gm-Message-State: AOJu0YzWAnavfQ32Z/6MPFcaAbcKcfES49LgbiXGcCEfzEFiKGOnEtMY
	QZjOw04XhLvxgK8V9hDeZuwxmlvfGbpR/4OBOTCn6GRfT8kWz+AT1rYcoap5QtuuKpRX68jrRT2
	633QJ
X-Gm-Gg: AfdE7cmpdZoACmwWSRShI3mvIZWl6iC5Xlp4zgYgq0a0MCjMcf1IZBpXGGp7zTs1dww
	afx6+C5rlmCH94VhcCCZcDv2A53Hz5uthF+qI/h/owj3McIViyJxSb/fRe8xeNCPAAHkRGlqR43
	yK+W3RKXElaCW6ecHKAWzHRtJ3TRKWlTGamD6xW9bN1eLNxrEvYeAmw9eJvJRjK2jxBjn6kqtIq
	NjXwGL4kQZUV25UaLXpjlicVxBKc2bsHhtA4GI6GzMC8lyImuWfBBgvzFwVxDpTa+4AZBXaISXc
	LAYxhG1INKYNS5ywz2IJta8su9iAUAEJ0ogqTsS5XZc4WDwy5Ie3cza7HWk7jlHvx80ftIk0WWQ
	0RmayK8HwtNMlu9QznFeq5dzOJlS21Sw5r500s2eQ2fldK8MF9pf/WC8R0++7vVXLWE5a+snI9T
	cn1SBODGxoGkEvcQfXddjSlCOaaHS5NS8wf35+QkChTMaFtCpX/BlBltvgpW2qqowBzLCRJzdoD
	wHT
X-Received: by 2002:a5d:618b:0:b0:46a:1f35:1133 with SMTP id ffacd0b85a97d-46fb87d3aa9mr12390832f8f.25.1782727299837;
        Mon, 29 Jun 2026 03:01:39 -0700 (PDT)
Received: from localhost (p200300f65f47db047d55c3c4f7db55be.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7d55:c3c4:f7db:55be])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46c1ee018e8sm54708881f8f.11.2026.06.29.03.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:38 -0700 (PDT)
Date: Mon, 29 Jun 2026 12:01:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v3 13/16] LoongArch: KVM: Add include defining struct
 cpu_feature
Message-ID: <akJCE-04_eK-PGwS@monoceros>
References: <cover.1782682124.git.ukleinek@kernel.org>
 <dd99dd31bbdb74884b27ea940e76872913b6dc1e.1782682124.git.ukleinek@kernel.org>
 <20260628221539.4440E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x6363enzrownmmoo"
Content-Disposition: inline
In-Reply-To: <20260628221539.4440E1F000E9@smtp.kernel.org>


--x6363enzrownmmoo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 13/16] LoongArch: KVM: Add include defining struct
 cpu_feature
MIME-Version: 1.0

Hello,

On Sun, Jun 28, 2026 at 10:15:38PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] Incomplete error unwinding in LoongArch KVM initialization leads=
 to memory leaks and dangling pointers, risking Use-After-Free crashes.

This is a pre-existing issue that is out-of-scope for this series. So
I'll not address this issue.

Best regards
Uwe

--x6363enzrownmmoo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpCQn4ACgkQj4D7WH0S
/k4Vkwf+K81o8OzEov3caLTz+vbPdJOpWHlUreaQWlJFp1oKWQenKpBUrtxEoDT/
oRa1WgfUOz0SZDpXC+d3uRiqkhOV32KJ+PkPaoKIAtTQYB/jVQSz6h3RHwqKEJz5
jiQP8SgbcZVjMbfcSDwqfeLW8NuHxHqOVl6AZR3ijVBuY34sgAfNpXKmUIDBVmkQ
Ce8EuCNUzWV07Uep/ToTV/5/109eG+tqfh/TukWZl4KdlOyOAf91SZLPXYyNWfLD
2axttFi98aM+Z02slFfWZGfqJ9XdvjO+LAj0G1vSAo6tvlmZfbPBagUJQiFE++PN
ze9zsxM5Tqkuy9KTlhcYcO0srPd1lg==
=R2jD
-----END PGP SIGNATURE-----

--x6363enzrownmmoo--
