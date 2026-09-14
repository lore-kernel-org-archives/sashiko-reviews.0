Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CFE3AB26D
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374729; cv=none; b=UmGlwSIUQUdyIRtpUntsSzyGQhL5UixCPFsiiju3jD1HKa53wuriczqIpPuSzDWrTCurvAZ3REhJ3SPwrPuA/Bd04GXvX6MBJKqv0G9aJz4mq6NIoUp7PmPQr8bBXhKwTtn1q1L/WFDCdueit4uM5jREeF2ofWY/ZLd5guiaHRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374729; c=relaxed/simple;
	bh=ZjvoAZq6BqkeR00N7bUgD3L00YB0HoOliJ8WeMyqzas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4zuA2fwIMijTy9+Bx+jSXtdIBWya1alq7NNwcaIej2FROkrMtVk4lAkjWU3UhceDtP2u4Qoovk/jxWO9jObXWoqgW6EmVRh3/9WzvUsHbdm35Ic48ChKxCRLpgtT0JF6rgHPeZ45LJee91PkyzBJ079qrugX5vy/CbgWyxMKz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WKicbR6o; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WKicbR6o"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so7056415e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 01:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789374726; x=1789979526; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZjvoAZq6BqkeR00N7bUgD3L00YB0HoOliJ8WeMyqzas=;
        b=WKicbR6olNEP2LPDlrrvJa9W48eulKCAPL8lHCbcOBEXnolprZO7Krv2aW6b5TuXQ0
         3YaBLT3xQUjA+yF/F/HvrJw+vGcWZroJayREzOpkpTTsSg2u83bpNRWVqjFB/I6tELWf
         Wkf7dBR33HqzpkvDT7snQ/NiXGh/HEOcydIdOxWeSCt7hmIViI//pM2qykxoP1CL8tT3
         nzsk1M8kzaFFNOA8eRInUaGrBz9K5slwN2wbMRHYrGjMDtzMXlVpG54aRQSz4WEsMBx8
         caYOdhcvBIs8b7EQaVRb8YiYHWC4BeSghgVkC5N7jH86PCF+id9MuSEFXyeZxbxtQ3VA
         X4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789374726; x=1789979526;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjvoAZq6BqkeR00N7bUgD3L00YB0HoOliJ8WeMyqzas=;
        b=EedrObemcImwGMGq4AmcUENYiWjGZDiNLdawJA1NP1YAiPprVlk3YfCINrp23cZ9HM
         agw8JI63AMsv6WwCnDj4t9cY0vuemlukc3VALpT909yFeoKH93EsRItFRj1dH/LPK/N7
         Obi2v/xu/tR0Xk4dNIes2i2hdfGv/vkClmd1WNgdC0BRouhXianJ37pDCpZoXiXw0lbJ
         glx7eugMHdOqQKjcZ2FMCbrPptXq+6PEfUmuZWtifgx9AGqAY9xu4V2PCv3At3YG+ijR
         yQ9PwOJR1KIltIVpTtmK4EVT3J2VxBmNWKzmyaBYuf1VPq7ue4woSQeqZeTWaFuQJZ7J
         o1Bw==
X-Gm-Message-State: AFuF++m9DV3009idk/rQ+hjUm+r8pe7UP4NWgKsrx6Ghzdgmz0I592Bm
	wB7M05qbDl18XAU+fnGxR8gFO8bSCJ6XQDwZBInj/akkrjlw7YwPX9m0G/wIdZfE60poHEFyWsq
	VLOfT
X-Gm-Gg: AYBFou2hrTWxzEs+tzC2bYhpanQnpNpWVJGcrBcp9OYtIPPFeRXeKG9oMelLnYtw0CR
	1ZBgFZ5tvtV7/I4wXL3dJXWa38q4SO8my5SlP/qmN1Vh0DIHRq2R+wIqmqw4MzWyY6wIToGGFTK
	qEdN0U1jZznjbZImzOQdYpaeMY1Q7V5qBj8fB51IKhA4GsyiLUaJIX8i1BGOE/ax1nHi4F4B3Gw
	EGevbHO0Fg3DubcaxCuZvl/tfkeB8eq1iDDd8rqYXC/fVKaRbRMBGaporsmihxjgK0wfSL+A1fo
	ealXqfGtadA6+j2z/hIt7PLUPW7i6WxgIFYS4qTXA14wiXzHfkJELB6poxxJ+T+jyf7NYHderLP
	gDKNZX6dJyASYlRQPoWjzfu29QDOCRY7FvGNmLxnptVr3LRymJ2c26XzaB7YHkgcwMKHf626KM3
	yfInDdnaO1SXQukFq237p9AJXJmvXCJJSeeEreSAs7qfcrGDz6wilj3KA7RcNF5uYF5eJ/sQQ6n
	i9gDsdFP4lStxvrKaqAJl/1B4MS9hGgLI6VGH5d9hYaz+2b/8LLxU7LI/EFC8L90TVTIIa23w==
X-Received: by 2002:a05:600c:c8f:b0:49e:715e:ec1f with SMTP id 5b1f17b1804b1-49e7a692430mr15660125e9.30.1789374725646;
        Mon, 14 Sep 2026 01:32:05 -0700 (PDT)
Received: from localhost (p200300f65f19a904d5c06a7863c841d4.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d5c0:6a78:63c8:41d4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-486eb357288sm25639728f8f.29.2026.09.14.01.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:32:04 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:32:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: Chi-Wen Weng <cwweng.linux@gmail.com>, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
Message-ID: <aqew8W2wgNvlqrfc@monoceros>
References: <20260721062308.536947-1-cwweng.linux@gmail.com>
 <20260721062308.536947-3-cwweng.linux@gmail.com>
 <20260721063343.9C6561F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ucvzjrpo32wzefdd"
Content-Disposition: inline
In-Reply-To: <20260721063343.9C6561F00A3A@smtp.kernel.org>


--ucvzjrpo32wzefdd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
MIME-Version: 1.0

On Tue, Jul 21, 2026 at 06:33:43AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The apply callback returns early when !state->enabled, dropping updates to polarity, period, and duty_cycle.

FTR: This is fine.

Best regards
Uwe

--ucvzjrpo32wzefdd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqnsQEACgkQj4D7WH0S
/k4T+wgAsIgiczkV9Wuo63Pki2TvLHBbduzIfu9P6B0CD5KEzPO6FQXvrCrTNFbH
xicxyvVumhSSPvHN07qM7x0HQZQaPPaH4A399FJHh+o0sQM6lCHlh9GXNcRA9Uls
CLNTgeTx+9YlaafkTMQ4vSUEcYX4xTrlfggluCeHHmEW1XzhppGQpTJufmeANnnv
scuzxuzV0wAD7LV2vHivtgPaShrpR8KhUVWordnkSRmbFGHZ8KfZnT2y9ZeF+Iv8
xhoHpQm3f/zvSGkO5EQUTelHYG+eDxJV3DhdymPoo2C78MhUCCqMEehZ8K5DsI0a
NiGHzjD5LrBJzAIhx4u9CyuADB7bNA==
=RNyn
-----END PGP SIGNATURE-----

--ucvzjrpo32wzefdd--
