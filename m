Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BED3221FD4
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 00:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085955; cv=pass; b=JTUhbZDPPBszH5Yz/hn5ABkuDDMsaP8whWN4fJc/hA9CqMCrvnXQ4TiLIBUmzEkJlmw1X6RSgJmwYno8z/6/1qYshbD6LjGU4vi7cZ8iuKSF8j4Zw9hHARnrzxC9kABaeHtLzxrqoBKwD/dpd9Bi/O5l1hMHxWdnK/lFFrInQz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085955; c=relaxed/simple;
	bh=6AJasxW3GodlVjAlTMJ767WLjIvMw4WJZ6v8qOvBjjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dmHcit2URBFBDRX3+xhrYHxT9ZigQwnlF88wsabArNaMy5fF3h7LQUM98HiSlPSiDJCOTmtYyk2hEsHaJjn2tg1J/aMCoqPraLewJ429cozWUtdj8UEURlh/BNYhliVZb1CZvTvDyIE6ZEzJk8+7Xn75hO7PiWbUKV+ZupiPvr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lor427Vo; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lor427Vo"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6711f05fb14so375124d50.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 17:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789085953; cv=none;
        d=google.com; s=arc-20260327;
        b=dHQBURoXG0xn7wtb39u0xE+j/UMNIho16sqIOfVNjz2gAxbWJzwWBFBGHkfMN6tCDD
         Re3ar3PQbooI82of/4PHs4xtJdu9yDIMPr3uIuZRn0Po7fHCbaBqMy3DQ8x3pjHP7QSk
         VxX0ygaEniw0T/7B13+1hKfTAYuXW7jtIGb9h/TRnKBDLb54UlXWJbi469tEoIAValfq
         nq3fEOj+41zLVhH0tJXK0wGpZ6h6Bb2TtDH6Hi9DyqXB1gwrmyF55YuyXR71UsNraTRG
         YB21q0cb/jeF9q5DGmFR1Ok7HolhOOiuXqSa5TVyuPclGkBcvcsMvQvaMerasJL++0nm
         RsFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6AJasxW3GodlVjAlTMJ767WLjIvMw4WJZ6v8qOvBjjg=;
        fh=U9m9r8NToeZlKg7bD9W/Rg6D5ZgF7Et3TXCJs9YvnbQ=;
        b=NSw+7CKxb8LXZyJpPmUmWNxIsjW44kReVB0QrXL93l/L0d5m7L+vvU24dnkkbFDFWT
         ZA9gRY3R7bs7PfEQvpqR7IBcmzzfFKaihO8+yLt/DMyYseqn6ehqGCqpDyTHLEsXQwcJ
         Cv8dYHoC8WyxW1REVKo7YwjAHK/uyPyJTlbovvJpbmdO00R79kx95EDvlb09wqm/5ze9
         gAOdg1YOCiH3uz4ISq5pELdEtFt5Xl2eW1fqPIrMRhqVnZP1fqezUXpIP5P/c6RA1RmN
         Lum4BQTPZJLRcRvJn3BBMUN4ncHwEsmNV5SRQWw77YeJdAOqnZzOCYMShvORXeMRZM04
         945w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789085953; x=1789690753; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6AJasxW3GodlVjAlTMJ767WLjIvMw4WJZ6v8qOvBjjg=;
        b=Lor427Vo7KRB4YOa8/ZxtpAhY3q+1A8h7goga4JvsOkESgyURlBkpmHV0EiZqRJmE4
         2ApNMwLRebrrh9b7pR2WsDYPOd6U0R0pqg1xguOh699RuX78zNq0DBxmh00jIQ6YTO5V
         0qeRZTwrLghOlPCDf5hqIcG0+5PP3IHhCOEkNpkj2sMusMf809I6MzsBYX43ukgF20xp
         0KoMxBmzZwdgiYyXcc7VsxyU0Vmqt8pIh7FAcjSBaJNXqTtDkFnIpayegfEpET/ZPs1K
         OkUpwLbwc813+IKiHwB3g6DgIZ3hhchYDeVa7SJ6uaQ67mm4yiI7SBE0LKzd3s7wrdSw
         ej8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789085953; x=1789690753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6AJasxW3GodlVjAlTMJ767WLjIvMw4WJZ6v8qOvBjjg=;
        b=q9ud9LSdOMNnr8skKla4pXUpPZYb1xWm4D+Edi/o64hW/bKKlhLDIVyTAswu8bP0eO
         99Yu/5id7znHszgedJ5Z9nVEn6QOJMKxE3We6sNP2SO6pxm20BSCAmzEDWbgoPgJu91F
         oXSv40YW3aY5px/l31DpR4XS5IaZmanM4HJ/FOocsMN8+NDPyMdsyg6WUTCewXxUNx7M
         YUsVVl13htcTg/kfV6yNaXDaMwpYtxT1HHFoAwvGhazUi8OSQZtR9fKlA6oh/Jn/dp4i
         maN6K96vZ9YRkQI4sHJB3Y43fY3qSgtgzCSvpdjjwoU/cpMvw/G0bmTFS+bjEoZr93mE
         ss5w==
X-Gm-Message-State: AFuF++kaE9RdQ2YDZf9c6N5khbnNA6iBtbVZVEvbnxHgIPtTNNm9wTTw
	2xJDdiAceyDhlT5+AG3Al4NPouaGJ82/uUU9kjSkCUShqcRpDRZ3D51dr+Gf+s9Heb+OsovB7EB
	p54KF09nLbTUtkGOj31f39ksr6wgK0pdExaNJ+EA=
X-Gm-Gg: AYBFou05d/m5354ap32SciGTLAPAmuYClh1CalPoscmZXF5hakz1SVkCgdgVuwzPWY7
	vb9inpcgDlYCvmoMiRI8CzGkIWRraOqdj9d3PZoignbHCjckNWz5IMN3L0hGC0Ncn5lECiekx0l
	lSW78x1LyA1VhzHNHL8av8MdaLKA8yMR2Vj46MJw0rLcbhgrQx5bcBCVyZYIxAC8ds/cPSzwDNF
	hZWY4Wdyht9S0rpqIv9ysWOnV1nRhzdT631gAue3+aaZ3JLHPhphCTh0v4tH2ysq6TMa/uGZHEA
	yde8N0kb8Gn6JcnfsUwOhUr6fzGRd2Hrfyy7fWMDJMio5ea9I38stDYQXmdAteKmWX3l5IbNoz7
	GwjmYiI0viLU=
X-Received: by 2002:a53:c787:0:b0:66f:c1bc:4031 with SMTP id
 956f58d0204a3-67124725896mr622106d50.94.1789085953300; Thu, 10 Sep 2026
 17:19:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910185030.870-1-frazinjonathan@gmail.com>
 <20260910185030.870-3-frazinjonathan@gmail.com> <20260910190542.BE6AE1F000FF@smtp.kernel.org>
In-Reply-To: <20260910190542.BE6AE1F000FF@smtp.kernel.org>
From: Jonathan Frazin <frazinjonathan@gmail.com>
Date: Thu, 10 Sep 2026 19:19:02 -0500
X-Gm-Features: AcwNN1Xw_ZV3zJF9oPd7-FCfkmdUBDHBhWTNPa2DLIGGrFtpH901py50U9hSvEQ
Message-ID: <CANW_FuNBVteTL52+iEnM3pUerrVnRRLES2SbrDt1FUtLgPi3Jw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/tiny: allow a framebuffer larger than the
 panel on MIPI DBI drivers
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 2:05=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> Since tx_buf was strictly allocated during drm_mipi_dbi_dev_init() to hol=
d
> exactly the panel size, copying based on this inflated width and height w=
ill
> overflow tx_buf on the heap.

Confirmed. On a fractional plane SRC_X/SRC_Y the damage iterator rounds
the merged rect out by up to a pixel per axis, so it can exceed the
panel and overflow the mode-sized tx_buf. v2 will clamp the rect back to
the panel in mipi_dbi_fb_dirty().
