Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37204305687
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 04:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783486435; cv=none; b=Dh/iSNafXr/5sgg4Qxtirbqbs5S9I5aWnogzy5gO83zfoSbe7phBOmxmOs5oxU2GbjMMHinBXQ2+KWMyrj1RUtTxy7ncOmWX4PqFvsP/M1G3oRq/XOldS9QH6na8w8ShhD0kHZQQ0z8TOj2+0dNaXz4Mnm5MzHNz0bFHahnGFKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783486435; c=relaxed/simple;
	bh=cW7Ix/tkCr37LiuIgaKSz6SxHzCDmgSjbLyC7Gew+w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/z/Lq+jND6CHH/nIpxg7SMuDm9icllGEq5bqke0/6y2B7aEglP+KpzhjbPKuitWKWtfYHAbddw5tdkbzTH3QfSXS0RuAqtYkU8zSk/IXSim+FgNqw44CtleyeqSYBLbDAiHwFUIvHmxAh5dvuKejkmloiufZg4mypGd2TJWGYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=X7FPR+QY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="X7FPR+QY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b7612475so1173555e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 21:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783486431; x=1784091231; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lR6urvfGdrDv+jncCfpvYz8EpWZuaAhkK2ctmUuEaWE=;
        b=X7FPR+QY+c156vOSu+VM7JTq7YH9OJLk5BLKopVpBRyMTqO75o/63q3saLU2RIh9aF
         TujT+6/LRanC4l7JpPJmmudrhblVq6FhPKHChTAdXkJUuuzAH1mWn9tUugEPUclf17ls
         WEwEdxwUlO7qRCCYJgY31UXjy6/BC/02ndyK8nzpreDgqBIxKpVuOpC8xYR4E9lMW7as
         u3qfcvV1HFNESevkYs0006sNrATfruHnpkaSHmnrtNyTpVrFZ50930GrBMHsaHekfB5W
         Lp+Jjk5xyOsIz8XVg/UZ3zRKZl9y4tn7GNjmHXUAdahgQdtPq4u99GiLhkLwIKeZeqVS
         Qm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783486431; x=1784091231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lR6urvfGdrDv+jncCfpvYz8EpWZuaAhkK2ctmUuEaWE=;
        b=SQfboGrjni8LKi9zn6tQw2AfjidpnyysVCVnjlshCMLdPQNn6QiK69JHQeYkZcXnDM
         fwr7l9S1LvEPCJ0McPEKBKOJ4OVaVF+ojM9uqp93RJrwOhBrR1RFwm83IkSsAVvkpRCV
         N4q3mLpqLnfTxc9LmI29wz5/PrhQI0zoMzsCLa+KnXBClkEfKhcObiPAbllI7TDVnDcc
         zDO551SAjKudSkHn8JpCuPiZR1u6wNcTwoXnb8CKs+CQnpYZmY3CWnzdfToWK/LNLY3U
         GyMsRtgdBuSCJMqvNL0MBOVlM3QU5MWnnIVVnlcOGsvdHvu0OptarjQhFywXvGqMDMbe
         HooA==
X-Gm-Message-State: AOJu0YzrwKTtFq3YyY6Ll0QybVeEhBta/2JnaUPNraaYu4A64hQscWfY
	iecWpxdusLLLaz803zP0SN20iNRwEqfiWAkWh5bkAsE4gLQF7BTiPTyc9UMv4p1WHsWMCzoKuZT
	4vjA1
X-Gm-Gg: AfdE7clCFgGzHjlPkR1ExLoEyxNrcXKemDw8ORdeV9AbinX9hNQiL3G+V9l+caMhlN1
	ZtC6AyyrXgptmNAwDpRkQQx1OHbcOTes7565/vdrHWW78peP2sRChx9hH+w5LV+hoLZrZVd/U3k
	teAa8QODrIKccBS4dw4bPnu3KZ9hVoGcRtRM4b0pc5fsjXVtfJ5uYLzW/A6v/OG30vPLDZOcFVz
	zeQsCHIs0GNXmx8ExhWaBQ/rpO5nfEUJQn8wDNYCkuT61U4IOqZq5Yqj/rvltSuIPMzaPbaJkkz
	+g1QoNsmL8hE2h8b2JqXzvquSXov/Fi2XXC1AFGzjKsJt0J9nrQIhT584oROd+vEoDNa7TMiF1H
	ffhsVyMfpIsvtf1/NV5NgNkv8bdiMxESFQjQ+L3jBogfsdIJ+3P3JpkY/5vY83I/h74Mra+ZKwe
	qO/7tiSPN9vgkbSHHAwZpMk8cLzOzowpZOxSdGxkjLudZsXS/eSEEb3I7Sng==
X-Received: by 2002:a05:600c:8284:b0:493:c8cf:27bd with SMTP id 5b1f17b1804b1-493e68642c1mr6847545e9.19.1783486431355;
        Tue, 07 Jul 2026 21:53:51 -0700 (PDT)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0f4ef53sm120746745e9.8.2026.07.07.21.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 21:53:50 -0700 (PDT)
Date: Wed, 8 Jul 2026 06:53:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: Update after split of
 <linux/mod_devicetable.h>
Message-ID: <ak3Xc44D5KKn8Ttf@monoceros>
References: <ede7ce64f20e10660ebf6bc1b41836dad750ae3b.1783349758.git.ukleinek@kernel.org>
 <20260706151304.D44521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="futkkaxv7oliuq6j"
Content-Disposition: inline
In-Reply-To: <20260706151304.D44521F000E9@smtp.kernel.org>


--futkkaxv7oliuq6j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] Documentation: Update after split of
 <linux/mod_devicetable.h>
MIME-Version: 1.0

Hello,

On Mon, Jul 06, 2026 at 03:13:04PM +0000, sashiko-bot@kernel.org wrote:
> > -.. kernel-doc:: include/linux/mod_devicetable.h
> > +.. kernel-doc:: include/linux/device-id/amba.h
> > +   :internal:
>=20
> [Severity: Low]
> Does this new explicit list of headers miss include/linux/device-id/acpi.=
h?
>=20
> It appears that leaving it out drops the kernel-doc for the ACPI_DEVICE_C=
LASS
> macro from the generated documentation.

This is a change to before the split mod_devicetable.h, but IMHO it's a
good thing that ACPI_DEVICE_CLASS isn't described in the list of
device-id structs.

Best regards
Uwe

--futkkaxv7oliuq6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpN17MACgkQj4D7WH0S
/k6sSQgAg2UbkPnq5fCVNEJREJjjG9/Jv6ANnY/8SITChPH2ixON8cQo1bXOCmsG
pR63i+Yq8pY/at+KPNbpIdA9rLNhnVEQP9Snzb1LXk7SVvAYxdBSMBDogepdUKfa
knQ5pyInDjs2FAbN2a5Akpf3zJUiZN33Pg6kNK9G3LKgsGsfzLfpp+Wsl500T53G
LaC4uZVMmnw98scQzNlTP48XoKSJ+1/f/m+/9mf0zIG7jKUnBZG9Uu2K1hXjw5bH
zjKa3Y928b14e5upG+PjW1MkDjg92XMnQRLT02emQvLXHThcgMbCZbS5dEf+kPAZ
F5AQfU2FM3YS0pVmNYQk6ShV3pVCAQ==
=mpmq
-----END PGP SIGNATURE-----

--futkkaxv7oliuq6j--
