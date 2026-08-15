Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C5630594E
	for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 21:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786829992; cv=none; b=tGAkn9o3Uugp4apezpClzC4TMWiOWrFOhgBwxFdefxoG3koUzyvVYhpGugFKeH15n9RGW6+Tbowvx+q/zE4aYcjNN1j+NZdAdOPrVuA6mSAgV+Q8BrWAMSmSg35nc/OWn1gCjFz47G/h/BaZ88NBoFJ/y22WQBbVEHFXZNAo5FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786829992; c=relaxed/simple;
	bh=BBL8EQyJT6vyN7BDVzYQ8qVCWKuSYDBgMshFrvQwg64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feJ3e3jY58rw09wak/CFWrEtei2XcTKE1rkbstiLjzK0VDpiwaxsWdsIHITCxTxeA0xY5FmqGnxdMiD/s+0rAL44tkaHWA+/z4ctLYkeuy/gKZK/I0RkXf7l9hJ1rQLyfAMq2NyCxu4WCOpHxsDFqCpPc8YyOgNDwU4kEHMIxhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HvaLCU4n; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HvaLCU4n"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1261195f8f.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 14:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786829987; x=1787434787; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BBL8EQyJT6vyN7BDVzYQ8qVCWKuSYDBgMshFrvQwg64=;
        b=HvaLCU4nU3tWmKtgXULde52QaPEgV55FaA41UtsUkzn45HC5DFXKL8ApZ3ETI4kgeD
         87MJ8F3B1kmAls8r5jg8TAY1m8C3OXm7vfS/z5jnnjMq5xaRI7uTJ+4bV70UW8Cjb+yv
         HPzQuNxzJx8EYae5xD6AV+zPN6dfuVkA7lbQYMueCVOeLwpp5qKRjqYDR1zocgQeiUP9
         rdmQkl/JShncoIaC2GE7UZxyJdI6fJyxWGAb5CO8FWLQ8KtJpDcpklDd1EfW6x1nj+Cd
         e0mAV/q4J5wLP+0cZJxaAwOTsLTi6OUmQWoBa2ZJtAwOk/uvMDJhjeKN/unvaQdeMYzB
         2BKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786829987; x=1787434787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BBL8EQyJT6vyN7BDVzYQ8qVCWKuSYDBgMshFrvQwg64=;
        b=hiScxH651i3RzZzN8dqzc2Mk6lm+QSUhYsK4FykFw/VJFyq7MJDDayUE9ZsEE7kzSU
         NfUPVmsGplvIPoaLMMpVROBuMXrpVW5F7LdDVN9SKXbA+mT2SOmJhH8eSDHl4X975IW9
         qqV5OoSVI4ZLTMlIVxcY7zRmCrEZh5LN5uWEjKMV4rhvk50ZPmEW2isx8OVHrYZDucID
         y3+FYXEptmxyuxdTDp8Oo8opE3ctGM42LS/7l0vmT8jTzpcWOb8fPkygcALsV6nDs0OG
         KONhlu1V+ruADlklmpURZ1QKDm24As/QE6a5u7Epueo0d7RzWEWKYfTIuZIYDamAIJdx
         j/qA==
X-Gm-Message-State: AOJu0Yzl4u3xE9ksI4o5SsTMTrKuX0mGIZ75haGGvnyfC0OXmyFeJOPx
	0ViQ2SitH7OmvukpcIx/DsrHGqa1MM7393VIIGWy7vnb33UJ2iKJJkA7Eo8j2FmI2E3W4C/U346
	FXQFy3f0=
X-Gm-Gg: AR+sD13gkPCVVRAsXYO5XGOkU0esvBaZ17v/hCyN1jxW0HiW/ONQtgvsrHsFA1kiU77
	tHESNfpMC0YJkKolO5xChBjpK6nuCaAhNMmUnTjEK7Ky/k0f7L8q+lRXhc6lcxypl0grOzDkr7r
	pKynupNzhOWlDhl5bbV22wmhVtisQ4/WWk6+52y5vhSnQJtfvC/k6tsWTA1MKExtzmB48nLVmZS
	vNtph+KGECIBMa719v5a4bSu4Cm5dvUXNh4P2r3QaDv4zvM+X1AfS6jr+PX6ZdSl4a+uKhPb9+O
	c8TTqQMRX+ptSKg/9qzY3GUp8oNevLPATvcyJ9EkRFlPDEFcTHg93BGDQ0tZiCqy0KJDQsVnFje
	iB4OnyfVS5AAKxaQnPtIIVguMd5EprFXOn1hOjZDyesm6ideoSXcngoPrTUKNWf6l8skK9IZC7m
	qaSdM70zOJArFcO/mrTnwshGWSGyigRPhMGhqgW+JZ5poG68PWcljJPG9YN4o2bKUPSg==
X-Received: by 2002:a05:600c:4f12:b0:499:491e:4b0d with SMTP id 5b1f17b1804b1-499879c627bmr236930545e9.19.1786829986865;
        Sat, 15 Aug 2026 14:39:46 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4999130d9a4sm111435945e9.15.2026.08.15.14.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 14:39:44 -0700 (PDT)
Date: Sat, 15 Aug 2026 23:39:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v13 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI
 PMU definition
Message-ID: <aoDZrWaC20bfc2jX@monoceros>
References: <20260815082048.4043217-1-irogers@google.com>
 <20260815172712.50119-1-irogers@google.com>
 <20260815172712.50119-2-irogers@google.com>
 <20260815173050.041A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="drgmyt6hkmp5k23g"
Content-Disposition: inline
In-Reply-To: <20260815173050.041A61F000E9@smtp.kernel.org>


--drgmyt6hkmp5k23g
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v13 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI
 PMU definition
MIME-Version: 1.0

On Sat, Aug 15, 2026 at 05:30:49PM +0000, sashiko-bot@kernel.org wrote:
> > Add Device Tree bindings for the Broadcom AXI PMU hardware blocks prese=
nt
> > in the Raspberry Pi SoC line (BCM2835, BCM2711, BCM2712).
> >=20
> > Depending on the SoC and security configuration, these PMUs support eit=
her
> > direct MMIO access or routing via the Raspberry Pi firmware Mailbox IPC.
> > The bindings support defining 1 or 2 backing MMIO regions natively map
> > the system and VPU control surfaces.
> >=20
> > Assisted-by: Antigravity:gemini-3.6-flash
> > Signed-off-by: Ian Rogers <irogers@google.com>
>=20
> Sashiko has reviewed this patch and found no issues. It looks great!

While Sashiko doesn't find issues any more, checkpatch still does. It
(rightfully!) criticizes usage of LINUX_VERSION_CODE which is unsuitable
for mainline inclusion.

Florian already pointed that out in reply to v10 or v11 (these two
versions were not marked with a vX and I don't feel like doing the
detective work to find that out. Usually you can see that using the Date
they were sent, but they were sent on the same day and both in reply to
v9 (which was also sent the same day =F0=9F=99=84)). Sad Ian knew better and
continued using LINUX_VERSION_CODE. :-(

Best regards
Uwe

--drgmyt6hkmp5k23g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqA3JwACgkQj4D7WH0S
/k7vGAgAh9OCi5rmtHL/MLTSp+jox4z83Dr/Oz5u4Sf4Fu/1aEN07NgJdZFpZd7d
mkVkEbHsHb6kdOzrr+VOHA1kkc6Eiz9VuXkFuC/qgFW9OHPp/hmYcTtOXSF1jGEN
zApJE8qSeau6iuGcC18uHn8ygprg1asloNf9+prmTe1iS/M9di+oDRSq8M5mk5Mp
r60LrdKZim+gtGnlzN/2s9FlgJEZwdxtI5MCjWOfZFgjTi9vjEFbvGY0idXLrEO8
aMSmWdgk+nrS0u3GiXsXiVJo+/cAn+ZcEfkfxUFMaKtnkQhccktg+7AYDGGUpFv6
w9pOo+QPuGcbpuXYV+1KOU9NzkuBDQ==
=Xlbr
-----END PGP SIGNATURE-----

--drgmyt6hkmp5k23g--
