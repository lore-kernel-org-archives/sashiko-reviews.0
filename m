Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCF4372B50
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319549; cv=none; b=mdVRuarj6iLML59fi2ovkl2Rlf9zAVXmzB2MZ4m5+AS8Ekb0C9xH61L+FkyCYm+LSNMqEPG3y5/gHqCILi22F97OCfExj+XUsOQqGR+0h87ImppBd53qcq4onqgXEYAnjY/5+KTxPHAvMXXeccqb1jmG/XNsSPX8eUzXJEDKcPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319549; c=relaxed/simple;
	bh=5dVk1Lp5I+yruMPgh3E179DUkAyiEJxxLJrxFhHEQ5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Erx/Y154f8HX7iX0XGLMXukGuMCejdL3zDlhMNt04ZwpRUOS2+m/s6gwgunQbhdRzXUMCfywsYGafHLM8eecx46IeJMNTorefe+RKmzMsLmaEhmDMg7SgfZ7E6SamNIjV04Zml4QT9Oj1TJ8UEvqR5cYf+LIAf/34mKmEAVkln8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvOJbbaA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvOJbbaA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AAD1F0089A
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780319548;
	bh=5dVk1Lp5I+yruMPgh3E179DUkAyiEJxxLJrxFhHEQ5I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dvOJbbaAttMoQQH1ju74EgrOZXYKxJM7u3oH1gYTD+UinAbKH7hQ5zqyJ7FvhPd3T
	 ZTXH+OeOQ5Yb94JG5rcoqDzu//cEG6Jn0RgnlYvAB4EF90oHFFbnZH1D2nboJkQc0U
	 Q6myDJ2DDbQ5tdMdldXm/dyNkCJkxmhX4akqWPbBX4qWrYGm/Rj+B/OQp5sIX5524v
	 4JDd1XUq0G4mhlisLpHkLquMbzbTAs0mdJtR9KoL4EpuIk2ZYpUne8NQZmr0HQL0LZ
	 xQU23X+bgNo4+sUphah9njD3jEecGCLjIWjJ6oifrKvoQoaPhW8oJlBwm9zXsHf+GD
	 wlF2h6Ghxit6Q==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-396779b9a7fso12205561fa.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 06:12:28 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy10dMZZU6pKSX70HQg++V/Vgzf09jAhg5H3Vwf2rFh6FlCmwaR
	o+VxwUTOk2ZC3WlMXEoUHjo2BFbt3t1HiDNJhRt3DTH7nxi1AKbeVjXemKz5HvlMRiPQcof74r4
	DUWk4D/g87nCgneAlNDw6BSLIbx2zOfM=
X-Received: by 2002:a05:6512:1504:10b0:5aa:6301:846b with SMTP id
 2adb3069b0e04-5aa73e054b7mr19003e87.5.1780319547052; Mon, 01 Jun 2026
 06:12:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-ks8995-to-ksz8-v3-5-c530f651989f@kernel.org>
 <20260530004902.BCC381F00898@smtp.kernel.org> <CAD++jLmZoGh+o5YKfjoUCWhwiRaO+Lm-9DFUdUzd9KpydWK27g@mail.gmail.com>
 <69dfe2a0-ce0f-4a92-98b5-c4cefd30ce49@redhat.com>
In-Reply-To: <69dfe2a0-ce0f-4a92-98b5-c4cefd30ce49@redhat.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 1 Jun 2026 15:12:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLnZ1h4MpDEZn5FzX7yzGLYGCpt794zNf0OXQmgKnFPWew@mail.gmail.com>
X-Gm-Features: AVHnY4LUshpVi1FlOnwrP2XEg9PLFn_Xmy8Mug-mvKbshLCGNkUUq8U-oquV09w
Message-ID: <CAD++jLnZ1h4MpDEZn5FzX7yzGLYGCpt794zNf0OXQmgKnFPWew@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/5] net: dsa: ks8995: Delete surplus driver
To: Paolo Abeni <pabeni@redhat.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 12:41=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
> On 6/1/26 10:09 AM, Linus Walleij wrote:
> > On Sat, May 30, 2026 at 2:49=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> >> - [Medium] Silent loss of switch driver functionality on kernel upgrad=
e due to missing Kconfig migration.
> >
> > No-one cares.
>
> Uhm... I have quite mixed opinion WRT to the above points as try to
> avoid breaking users in any way. I'd love to ear a 2nd opinion from the
> DSA crew.

OK then, I can be less cowboy-coding and try to play it nice.

Would a phase-over Kconfig option making
CONFIG_NET_DSA_KS8995 just select NET_DSA_MICROCHIP_KSZ_SPI
cut it? (Sashiko suggest this I think.)

Yours,
Linus Walleij
