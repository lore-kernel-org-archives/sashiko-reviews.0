Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4420A380FF9
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 17:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781890519; cv=none; b=LWJztGlt76E9mxbvDEVEwQfjsP1PYwS0gN5N5ksCV14RT1Jvf5vj9SgAVgvYKafWls826nJVVM7G4hQWtr8Codm5cYSPiFGdvZSaSFHUsWJkguIQXvRy8Tb87ydiGdfX2Fh0VDwcxulZURXhuhdRN533YY9OyFT70/4nEy1lhhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781890519; c=relaxed/simple;
	bh=3kAluI+OK1a60ua4Ojr4hrMwx6+mT13I2kAsJtMdAl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9edDX7PFxIx9dWwm2rqkEmf9P2JlYA9Cv4k/7znXwiGpCPlxDKmTdgVYijllBu/wV2al4ZaIDNXETpsF0blfTjrnzS0sKDtYrKIc561qA4jjFmveFwEuZieCATdygmy3x0xh5Yb787FXgg89j1UdyBqXfIbqst1Swb7KrK7RuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dGN8QcBr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dGN8QcBr"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so12180645e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 10:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781890516; x=1782495316; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3kAluI+OK1a60ua4Ojr4hrMwx6+mT13I2kAsJtMdAl4=;
        b=dGN8QcBrVuD55GZ/1YSYgh4jBHyiP7lxRMmbgtoxID3NM/I+fzvAZFV39Ekce8pIpp
         29sIDCiYBVzC2bbUbooa7DvIeORoELN1GOmaXdYqIksPw7sIrudlKxLrma67qXVnSgVo
         sMkVRT1OmFtKSCZpqE54lBMAfvJA/3HH7GnOYtokzLcwygc9y1iKWVLUNAWlCe+nwYhC
         xLMy9Gzs/4y/MlLlUXG/yqVHdRlFguflnpbRf1M7X0e8tBUAUyL94zVnHushjIF80uTO
         hGmFbHlwH3kCYhhTTNYcmyYRtiLqfgMyMOxfgVJRHfW1ZPAC+dOT6WM5oayPKfrvJXX3
         CXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781890516; x=1782495316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kAluI+OK1a60ua4Ojr4hrMwx6+mT13I2kAsJtMdAl4=;
        b=ImAoboCE/VYIC1hBo6ljWAyATEtD7dIKqnEW5KbHuIMzxpwGY8bzSJoDthcb8qcO1+
         eNrZlA9qXuDl8NWXD5Be1bQH9xlDnV10BtPWbXJryTJbGdpal+5nz4m3tJ1Ona56G6N2
         ySUyanbC7Fsp79CjviWbaLPR59v55WVkq24n2U2tuXa51o09PfT1IR9gzWfw7nSz/Adt
         r1Zzxpa8D33Ub0SZB5RU2YBss+0Sa81uf53UfJ6HGwfKDf5eySE0umuICNI8xVHn+1Kr
         14UUxFQ/w5vkwypBt3G63TygUYOlSLwSKnyhau/5Z0igdWpkF+TM9kQ4Pt8K6j3JrO4i
         YeQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IvjD0GrfFr+ddjDpiv2c7bBUKRTQSZGM/IVW/QJjF292OeIbwpTlmlRz/POz0v10mW6GCNTGWKVt+egcRHkQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnqcpv3g99IuWpJ3NTq0O7cxdIPG9nD21HwMweutORBoWF5zMq
	ZTJzMkbEZ3BkHxAOvb6Se6js37PdiucrOFQIquvhwkMaoQYBqH9WF6QC23YmS36Da+o=
X-Gm-Gg: AfdE7clg2NdZSc33fCyUMvmPIneeLToQ46ayJUsr2jfc0txKf4RC9M4Vk57NqMieEHZ
	025bdhtuNQRj9iShVKCJXO9ZFV9+v8nEGPAnL9rH9IFpfnPpBcSLB19yk/69W3XT6fZDX+pDkyD
	39C2a+6by/+yTcEp/tdN8KcJpDa4GtTU6qLGGUN8c7jfk0itFjISygZL5Y1SzpFY61/PazyXrvS
	AXCJn1Td0ggc3yYEcJ5gO0mzSvjHeJtSz2p8uB4tCK90Tz+9J3eB4T4j6zCaSQw27B0E2Kt4G3n
	7ClHzAX54rgMpAE2CyHfUiioA3LBdV0Q6nTCoxUPx7cN8+L9uG4VSiq61kieR9BCpSRTBExmaYx
	hVEORV2hURKAZkMExipNBwmHSr6aTgR5N3vh4avSCpf7c/tJBThzQ5UJPShph63FP+8CwLTft2y
	2emH+jjSldXQd5iAtxSWxoWKIWAxVsavcl39Mfdl0ZpmISNweE5vTjBa5PGEYmMaEkePkVPoTQa
	MZhBJk7JjBCEg==
X-Received: by 2002:a05:600d:8654:20b0:492:45cd:82d5 with SMTP id 5b1f17b1804b1-49245cd835cmr26779975e9.24.1781890515652;
        Fri, 19 Jun 2026 10:35:15 -0700 (PDT)
Received: from localhost (p200300f65f47db04359fc0e70763236f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:359f:c0e7:763:236f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-466648c698dsm693532f8f.16.2026.06.19.10.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 10:35:13 -0700 (PDT)
Date: Fri, 19 Jun 2026 19:35:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, linux-can@vger.kernel.org, 
	Vincent Mailhol <mailhol@kernel.org>, Oliver Hartkopp <socketcan@hartkopp.net>, 
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH net] can: flexcan: Fix probing for m68k/coldfire
Message-ID: <ajV9XwYJSsqYiP2J@monoceros>
References: <20260618140147.142489-2-u.kleine-koenig@baylibre.com>
 <20260618141210.11C001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cgshtc6dqvrb74k7"
Content-Disposition: inline
In-Reply-To: <20260618141210.11C001F000E9@smtp.kernel.org>


--cgshtc6dqvrb74k7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net] can: flexcan: Fix probing for m68k/coldfire
MIME-Version: 1.0

Hello Marc,

On Thu, Jun 18, 2026 at 02:12:09PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] Network device is registered and exposed to userspace before har=
dware and state initialization are complete, leading to race conditions and=
 a PM runtime underflow on probe failure.
> --

given this is a pre-existing issue, I don't expect this to be in the way
for my fix to go in.

FTR: I don't intend to work on the issue that sashiko pointed out. I
don't have a machine with that hardware. So if someone cares, from my
side this patch opportunity is available to be grabbed.

Best regards
Uwe

--cgshtc6dqvrb74k7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo1fc4ACgkQj4D7WH0S
/k5qXgf9H3duB+br6QFgxRg+6Z8BihknViaOnUHZ7d046No2cNVc8c5KNb8qxiTb
aFKRhQsjTD4m/kQhjYjQNJn2Dyf46JkNBpmGDa6qx+4v0zuiP0qo0BQDo7ML8TcU
odKvV3PkNQJstzzhmRAaHgoh8mrq/nc0qACezd3XckQGSRf1h/virMzA88sDx7cE
4iY1N2IgPfAgd0Hw+rO/ZzynUs+IslT/9DYkE3OvN9lZVy4sUkTjICwrViLw/me1
QbAc0VlIul8gb/ndKVszQQFEkD0mAqDMsZiynSeyCQJ9mLjncxYNeivqK8p9ERKd
9xHzzNtbNL3aS85F1CJOHkwhgz5P9A==
=ADuo
-----END PGP SIGNATURE-----

--cgshtc6dqvrb74k7--
