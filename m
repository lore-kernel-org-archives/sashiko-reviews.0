Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F4F3DBD48
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 07:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248231; cv=none; b=kewDZgIixf10NsWxk7zsXOtVSw7Y4Nk8PjRmX9oPEjLYncY0V9s/hgTOd6sznsUexBmEdA4LewZPORX5hVZDWCdjPkrHiSG1nhaO/pCd/GzZSNqPaGx7w4pNPyiot4D35EnlSpe8XRcYEIIKWRCltOBwiME1GFvdygnvLBDRj7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248231; c=relaxed/simple;
	bh=ZygED/TgcSaqbUiAwx8S4bYpGHo6x10dsCPWD/CLMT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0Y5ZokS65STFw/YffpLvGxC+nYhVV6hs5iQo6TJ+W7sPWa18TjKC0vxM/DVXKMrb1X3du5js15ylOB6JmKSgr2LnrE8mb83xRyKlXZ6WlepKjcK4bodDKc1X1YcwILKj4Pw4Znv8uhT553To3bwfhreRF9M11VY7XD0A1dUFEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WB+j5kB/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WB+j5kB/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b3637b90so4366295e9.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781248223; x=1781853023; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZygED/TgcSaqbUiAwx8S4bYpGHo6x10dsCPWD/CLMT4=;
        b=WB+j5kB/jzDffStg4tgDyLoJq4JN0ZKur7vpAMf8s7x/4gD2U7Ok8Ig7zglZ4VL+JT
         5bRi0hve1qBTdrTeg01jKmc+q5jPkgRe3nPUm3k7Rtu/Bp4hThPnA7P/at67c7Ah3aG4
         Md9EMJP+3Zwp2dsdXg0fkNT1INoCaluZGJ75QoStmLwGtnweqhrY25OUcY6ToR8wPJAx
         rL5DzEh3plsSOgBrUFLc8ODDE+o9AXWuKDaU8sD8PY1mLUCz9Jq97/CvukkO3OVjpmqP
         aQmUZe5gPDn57pytUMvDH+44E4LBUgNYJSvCIH/GH5/616+ju6uz+0gzcePcZPUWL/mN
         HSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248223; x=1781853023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZygED/TgcSaqbUiAwx8S4bYpGHo6x10dsCPWD/CLMT4=;
        b=BkXHDgQykOylSRLpVWP6TxOnid260gI5xcKNTJumH3U6iyNe1U4VscLwScbKEmvFad
         WA3+7n7JT8OTZ5cgs+NNt/jp1MGt1nVG9BghP94z2juLKrlHUGl5+Ih+GVxebwoEosQE
         cc8eLFpxcW3oNgsRKZzVXrbAGmFNj9xtGp5sDwOfoZmtX7mLT3kDpIboaoH54qBgKsCc
         k0aghDYAFKnaUho6UPQ63L6BBo7s9M3izUs/wU4lIz7kJwd1evhONGvtDLQg3hSxwV4S
         axasA/9v2oNbq1a+KGrHeIGiX1zM2r0B8rlL+Ab+fUf51oNySwH4iVXhes3GuaQfa6Fe
         wyjw==
X-Forwarded-Encrypted: i=1; AFNElJ81vhML65jduIL5Iz7UvxB9QO6jC18ihg8CY/XgBPQnlaneHamCmxLvQ9o4J9kPGlFDjdSMAdCA1PeG80p7prQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YykUmElKWOpbl9T9hQYuedcx4yTlc1LwV9w9zQf9Nn5TiSMIxyD
	zhqcdilZqrgR7lRrdipBIh7w+0kCDDMZ6I7gLzv6u9RbtWbnHvMHzBkm5wfClm3kd54=
X-Gm-Gg: Acq92OE4xt9XYk981/l2qNgVz/RP4dV0eKUoyqJhz/e3AZbDSmyI3Xm5h37H1BtX5uQ
	vjTl7La8dt+kx8/FIqhmgdKA+UR4bPWBIhYxq6D56rroUYQyqkzq7tN7mpO+wUBtDpLuz45GgpQ
	2liX2/fj+imWlEtHfEu5Qm4UQGreNYNHjNtMSU2jp8SgkChT6breKncha3DjYl7vLR3mJAySy42
	E06WMg84YQpxeuD/cvFEWser9WaEtSyfWUo9iOzbQy9uQB4AAUeZHzsCJRQ4+98DxgI5rlSBvpL
	ZADJivY1siZ9+dK3u4ypYeQZJ+e4tVEozL9+5LqkgHd3DmYr/6R2jmJUaNXYdhPAWsRIPLeYpoo
	Bv17nhxEIVpMwjk4rMjVMwpmWp9ykgtWi88a5pT6s8x7eLc4ybRMqSX7S/mHpR0XMo8KOwcBjFu
	0U3vFoh8q3XIWxPYL0Khu5F7ENOvsBZqd1pN2vas85vnhDx4G4Om/TILLQFpiI/0ZykmzzphVLE
	vBW88wHx0a3kaZQfyh5G8kK
X-Received: by 2002:a05:600c:83ce:b0:490:e18f:d112 with SMTP id 5b1f17b1804b1-490ec4df0b4mr15052315e9.21.1781248223452;
        Fri, 12 Jun 2026 00:10:23 -0700 (PDT)
Received: from localhost (p200300f65f47db040e4e5c1e98e7f0ff.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e4e:5c1e:98e7:f0ff])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490e2c7ead0sm139245145e9.3.2026.06.12.00.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:10:22 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:10:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: vkoul@kernel.org, Frank.Li@kernel.org
Cc: dmaengine@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2 1/2] dmaengine: hsu: Drop unused platform driver data
Message-ID: <aiuwi9amtiyoppxZ@monoceros>
References: <86a23025da12369034dc7444f43a7763f2e515fb.1781161455.git.ukleinek@kernel.org>
 <20260611081105.863831F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v6zxtse6fli25xdv"
Content-Disposition: inline
In-Reply-To: <20260611081105.863831F00893@smtp.kernel.org>


--v6zxtse6fli25xdv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] dmaengine: hsu: Drop unused platform driver data
MIME-Version: 1.0

Hello,

On Thu, Jun 11, 2026 at 08:11:05AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The commit message incorrectly states that it modifies struct pnp=
_device_id instead of struct pci_device_id.
> --
>=20
> commit 5cb66572eea17e218716d84ce22cd0b73ee38c30
> Author: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@baylibre.co=
m>
>=20
> dmaengine: hsu: Drop unused platform driver data
>=20
> This patch drops the unused .driver_data assignments from the
> hsu_pci_id_table array. It only modifies the source code representation
> and does not affect the compiled output.
>=20
> > The driver explicitly sets the .driver_data member of struct
> > pnp_device_id to zero without relying on that value. Drop these unused
> > assignments.
>=20
> [Severity: Low]
> This isn't a bug, but the commit message states that the driver sets the
> member of struct pnp_device_id, while the patch actually modifies an
> array of struct pci_device_id in drivers/dma/hsu/pci.c. Should the
> commit message be updated to reference the correct struct?

Should I resent for that? If now, doing s/pnp/pci/ on the commit log
whan applying would be great.

Best regards
Uwe

--v6zxtse6fli25xdv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmorsNEACgkQj4D7WH0S
/k5VTggAnQMbpuIjjXuyeTA+SehAUaSHYsiNRBA74BCHsQQf02RPbJtTmJUywI7g
XCQmC1+9M3o8qP3dCC+2Ii/S1grqPyuKllQclUy0zUIcWhiKZXKC/ULhALI4jVyo
c2WwptI/ghLVLmjfIO4WgY1CNHFqKG5AjJO/GQaLmACTTh3xKM6+z+pDa9ZxxzFW
B/8hWOAiiDvrqnRaehBmGcHTIAQQmauZDZglL9CXCEYkyPlrn/ywHyTgPvxu1xgh
1haly4K1LDxHlOataGDX36KPMhHXEmlZcqfWj0Vt57ysTILEMYcmtHHmdLsYhbkp
re16aIueLFbBwAXB56A2yIeyoUl+hQ==
=Ldv9
-----END PGP SIGNATURE-----

--v6zxtse6fli25xdv--
