Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E518387359
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 07:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780299824; cv=none; b=ZMqY4oSwPed4kF7g6TTOaHa3zHjrXu9rsS4xg4qZF0u7LJ2sz4jl+zjWIRmWoovZXpk5tZRCTnCRW4sh0UJDPEaFmTSNn7Pf61Kdhuh7ELeiSF3IRsQfPaA8RU7V2Q6OL6DihiB59NC9Ce2ZdWMVb98LaNSB9J7WIk0lpd4fFgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780299824; c=relaxed/simple;
	bh=qMtKzaRG1JyxGNgBU/zbhtltiFCLQAPT4zq0DN3gSGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxvbrzGZ4VTHgFpGd+FqzXyls6cV+KQjtz59uy9Zgs0RnMCPdoUEkuYrFLVBm3U6Aiw0n5NP0Yw+gBOXTSRTCcR66WW6cgwA0bU7Ne5blsxHMh2mrEraxNEgH+t+enB3GZToUyY2l7XbMmoPFTS/MrDvzq3AT4+LnsVQtZDm5zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBdr+jJx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBdr+jJx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A221F00898
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 07:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780299823;
	bh=qMtKzaRG1JyxGNgBU/zbhtltiFCLQAPT4zq0DN3gSGE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZBdr+jJxED4UPFH3pIatQubDjAj2Jd18uItu4u72LwwJZoSUNA9L+9vt5NbCtsR8V
	 gwebINCZ6dPZfeLXfelzSmgOVdikm/j8+DwKca3XzM1SOARjBzhYI/708iKCfA7Toh
	 Oja/BhwfYZJg/wEbA0lmatTOpUrUfseb0L/uRxTQ5tOA3LgRxnpfO1OypjJ0itNz80
	 rveo3wH2bMHMaX8EsJvHsPaWb0ZZpQ5KguAy6pfnDOdO+qiJqJlh+D1hCEc8VLWWHT
	 Nj4+Zo825yIpn5ksPswnm7eGso5m8t5px/0c9IAgV2Ky/I7aOhY6Lg4pb29bCyWdaR
	 a9sQYvCc+rt7A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39677c434efso12408281fa.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 00:43:43 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyaj2ZrRHXt30fNTq55AEDuRgg2oQ3Xj8OIKUGoWQlMmg4ndYwW
	IwuNhDKgyNFA0rFUOk2RnY/BBZ7nOKZv8dYoguuRM8HBPoDTKDH5trrL05kBT98i+z8isEyImLk
	eP+b7PeeDArYYXCjbqJd56A7ZgV1yIYY=
X-Received: by 2002:a05:6512:65d1:20b0:5a8:94c2:d49a with SMTP id
 2adb3069b0e04-5aa6090338emr1997047e87.27.1780299821994; Mon, 01 Jun 2026
 00:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-ks8995-to-ksz8-v3-1-c530f651989f@kernel.org> <20260530004900.8C1C51F00893@smtp.kernel.org>
In-Reply-To: <20260530004900.8C1C51F00893@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 1 Jun 2026 09:43:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLmT7pcna8DzckpQG7TG7KrfX-kUVNiKB2Stux-VbAgHiA@mail.gmail.com>
X-Gm-Features: AVHnY4KHNantugeBORRJz-jK-ADm5ZSHfpwdjpHGJ_0lybs4LwI3uSXJAaCOSY4
Message-ID: <CAD++jLmT7pcna8DzckpQG7TG7KrfX-kUVNiKB2Stux-VbAgHiA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/5] net: dsa: microchip: Add fallback Micrel compatibles
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 2:49=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Making the KS8995 driver mutually exclusive with the KSZ SPI dri=
ver temporarily breaks support for legacy `micrel,ks8995` hardware, causing=
 a bisection regression.

Straining a gnat.

Nobody cares about a temporary module compilation issue in a series of
changes to
an ages old driver almost used by nobody.

This kind of comments add work on top of work for maintaining old code and
incentivize people to not maintain it. Go adjust your weights.

> - [Medium] The Kconfig dependency `depends on !NET_DSA_MICROCHIP_KSZ_SPI`=
 fails to prevent both drivers from being built as modules, defeating the s=
tated purpose of avoiding probe races.

It=C3=A4s not about probe races, it's about building both.

Linus Walleij
