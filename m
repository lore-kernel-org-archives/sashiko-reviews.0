Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15166286D5E
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394165; cv=pass; b=alFvlnTwi7EIDYn0QZNDwkzZosz0OX/Sv+X1OF0BnG/P5zgABdm86zsfZJG9wEd3RJ72BmhaWUl2uQKffjIBArJhwMCXmz0jUUYvWQk2ZOWpYGYX9ItpVLSm6C/usb5vPi5dx23ozyLnmoLjbICcRjy65VhjGCtUIDPUBqwEGNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394165; c=relaxed/simple;
	bh=O59CtIljZhLqWH4hYhVsqdio4RXdVIpr8uwu6olzWvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owKmPMxjclOVwozUcFL8AI31KArbRXiiiL4unjyTW9dr3+RSNLTcwB8SO8XMdngNAlAcWFUKVXCODDnyU/YErC/+zXf4O/hdY41Klb37OGSiTjC91ICINXtAFAjhElDB+Nxo9vEZtn9mXf5UMcjvGzpGZsYqZrKLBxGnPtQHJKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEgH88SP; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEgH88SP"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c857fba35cfso1553913a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 02:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780394163; cv=none;
        d=google.com; s=arc-20240605;
        b=SlXzRUZ/qWppexzteQxgbxWMBNonlNxto2Yc+YU17Er4vkbZCi4GFOBLisxF0Enhwp
         7iNfPKJ0/gdVKIs5/DjSALmyNIpdVOAdYUXMBW50eQz3Ne60eeuGRx/8fzSmpeaU4k6M
         TQ2kdMsdx72siC51Zk7UJ8qP1uaHgVV/vfH9WAtNcxKOIn/fSFvT/mJL2nDbfgedY6iT
         L+4wVTDnuGM2ndBIJet8hS5rHLliOOAdAwWzTul/oUmAhMLHff1Xn6wjARzfKYQmnyHe
         +aryQ7y2bG851AGByi84R6HN+4J8pcx9c/CW+F+pqYGK0fopGzwKtroRgobgZcHl1ecy
         gVyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ry0TM5y3k6sgeU6WW3HpH4JK7qKCt8a8l3Hhsms+rjc=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=LyAilWji3uFtwTeuzn7X71lIRfqcem+tod226hoMAZv+RBUqv8SozwCHHQE8COUnd/
         IvWicAoV+FxYjHam2fpDx2ho5y9Bcb55wLo/HOkVOczwbnKxAC2snHPbXlzf6uzxyJ/T
         Pts8RhsVeQSpLxikFaHmfFWocXEVEAmbA0I/w7hstKo7IbLxgAXhcm4fINYVokWJh+Ru
         4m1caufDg4Dh9bPqeopDMjKPw8F1R1L07n/YCbhepNL6jh25wnwCzDDM93AQHDdK2pGj
         VtKPKFci7FLdn0coHhKSf/R8Ru08ZiNooPTPEblTs5oCF9kMfoy4eCFiqyMm/2nPkoC1
         rasw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780394163; x=1780998963; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ry0TM5y3k6sgeU6WW3HpH4JK7qKCt8a8l3Hhsms+rjc=;
        b=SEgH88SPwN9z+rvTd5sDArN+MVIX/g2aWfKlHAxzHOpxx1SMWKfx0BoK493YuchDLq
         ZTfIIbS9Ye+N3vh6Jaw+IOimXOJh9ktqPbbxJ+Luo4CPhrTgw/J/52tXsSpgEB0hv62G
         hWA2MQJW7CbirriQmKCy0y7ZBpoTkB9eZCjqHN03dabHeXZVMnkynFvdP0xxbWcdQftM
         ZyGtD8KyRNYWaykxqIcGK2/V0s7SyUhFprow78JStKGnv+jFThaWH2FgrAAlkaSflwLT
         AOJ5UgC8Pe0LJKhI3ewgh6RIYGayPdvVhzErKD26SGipPxFMZmsFTMt3VuLrBz7w3Wwo
         vs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394163; x=1780998963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ry0TM5y3k6sgeU6WW3HpH4JK7qKCt8a8l3Hhsms+rjc=;
        b=BV7pZZniYnCZRiV+xLXeLvS/XnN66Wo/ZeVhUjuJagJeUi705t7H9JCyzw7sGHr+qp
         plrrm0II+Yrh48eQy9IrfPu6jBW+BpX+DZ3NKsDuP3gAg9fJlhYrhcz4dNHDEGZKHYHU
         XVJG5y8KPpPRrCgkT48lZ0yCnkkpZx7+Ig6BRkUEusZnK8tGYlpdRsM6CG+bN7y1LX3N
         ZZaMpkC+lXoQzdFvhPO56NSMN/2fqy9b+0Tm3hcTGCSdrt3daxfh2hwuHewPr24/PTrA
         tQNNfPy3VpNrS02ZdVEvbBcUEObf6EUqpfQr49sW6ctdTYecrXapa1D1cRaUml17AzEA
         SSmg==
X-Gm-Message-State: AOJu0Yyb7h94si8bT0aV4x8W4EMzxpbO19aFkc7azSkMdUy2pocHL50y
	OYzzXma3hW6Yv2TZr/Wk/8Z+U+YbLDTnP4AGJP/90YWMSok/I3fjNbHIZZbRzFn4bIIa1qm8G8/
	CKMY4KjfQ0GwsAB1KamJ4INmOGHYm0znyI3+N
X-Gm-Gg: Acq92OFdFF1zAxyXOLNTRDHVTLxC6Mb5L+vBIWGvXRmsaZLNPLovV8aDTI/P44THquG
	k3+l/Ww8IGIYGl2HMivF8Ct0JfTsI5KH91YtipZ7M48cV8N9diUljy+Eo1Gc61OAX2GmbIlniDa
	Ax9/TMBx6tDVsITAMZb6o2dYFK5tgLn+49Mq0wIIgoXcZmGVlxT5BB6kT4w8i4oK1+bqIGTXAyA
	JbEeXtDIXBLX4PGPImn1f+BX8u/aUMtSC/wjdXTkfDh8cTHQymWsysWErbKx68gPdXMHwhNWO93
	8AdIjmpIsOjO757mCvDNIJ81xcIEpT735rIKeIaCdx4hTaNh
X-Received: by 2002:a05:6a21:7016:b0:3b4:71c1:ab29 with SMTP id
 adf61e73a8af0-3b471c1afafmr5517169637.16.1780394163282; Tue, 02 Jun 2026
 02:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522100318.73474-3-phucduc.bui@gmail.com> <20260522103713.6C09D1F000E9@smtp.kernel.org>
In-Reply-To: <20260522103713.6C09D1F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 2 Jun 2026 16:55:52 +0700
X-Gm-Features: AVHnY4L1XSy8xh1n7_8eywzteDnYmK_ktmmzmw4IKNhvqBL8NzTqlNXMe3QnjJg
Message-ID: <CAABR9nFn95Pu4AGd+AXoKdezVyxqHwnPNimQrrzoqAXbqq1Seg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: rockchip: spdif: Reorder clock enable sequence
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review.
I agree with your analysis. This appears to be a valid issue, and the
fix should
be relatively small and localized. I do not have the hardware on hand
for runtime
 testing, but I'll prepare a follow-up patch.

> [Severity: High]
> This is a pre-existing issue, but is the regmap cache-only state left
> unrestored on this error path?
>
> If regcache_sync() fails, the driver disables the clocks and returns an e=
rror.
> This causes the runtime power management core to leave the device in the
> suspended state.
>
> However, the error path doesn't appear to restore the cache-only mode via
> regcache_cache_only(spdif->regmap, true).
>
> If a subsequent register read or write occurs while the device is in this
> suspended state, could the regmap bypass the cache and attempt a physical
> memory-mapped I/O access?
>
> Since the generic power domain would be powered off when suspended,
> attempting this access might trigger an asynchronous system error or
> synchronous data abort.
>
> >       }
> >
> >       return ret;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522100318.73=
474-1-phucduc.bui@gmail.com?part=3D2
