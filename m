Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E13953444B
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 19:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070262; cv=none; b=qqhM5ZyH2TVkCklWItlCwtJ28B5dtdQPTKm1sLfiovqlxVJp4Ng9KWQm5OqiY9/LOITTWloM6ZeuOYpL7Re3rkxuQIGZdPLYKZaMKrOLPTCqeZEOi5bmpGvtkuFB6G/V/x3biBJonK6HZhS6pStOe3Eoj0Jdp3HngsPzGxC7s8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070262; c=relaxed/simple;
	bh=N5yb026aPpGcyxAfW2H08bwqsUKfbsOzxbksxqY9/Aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/R4UnP3wUTz/lnRBFznafH5vdHBBPi7N0B/az5GrVh/pY/O+rATJCjMjeEaISzzk4UgOc+2Xp9dpAy3cdgVAOdC4v4epNEihrxWOPy+ElvWUcURIKknBULb9OANQ/1yb1oSzJKF7XXEXmA3c6s4uM4G1cAYX4j37/UPF4lyU+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kry1BvCC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kry1BvCC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240A91F00898
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 19:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789070261;
	bh=PG2Ci9DmgoMcJpWSVzZ/I5j3co930uXzNqqYb/mpL20=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Kry1BvCC8uBvh2m5JaA+q1QswLf5wwl7J5A/hyOf6y5bCsraNpfnU+Pxs2FfGiXbq
	 /b8xkEzROAzmiMNgaFZxng4XCZTIClkquIAJVgbUWD7Qd0kt+3eCUsg6kGGabe7Xrq
	 xZRFhCX1Ta3SsN9KZtz6Zfnt7/8G3P1ishnnl4dKDGjyCjrLMpIxBS3h1W58yJovy0
	 hy5vgsyk24XA2XvuuqYrCBLPSZtKrlBD1+A7jqWICGVf8M1F2Papi7XybzmQdnMeEf
	 K+cSr5IJjJaQc8GmaSTzsWS27zu7cEBG+QqgoedWH764nFXoplwBLjEhKO8HRaWrP6
	 seQ+8zCi8hwTw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b5e907853eso179020e87.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 12:57:41 -0700 (PDT)
X-Gm-Message-State: AFuF++k6zBDjT0722JsTG+hwcq5zLagovHSLis2ZR6efGn0hz44jqKfU
	FRG/0YaYhZotBgP2tc97d2/IkX384r64lrzwkQ6ttdWCut9WnLacg01yb0YeBWUYbDzycl6JNr3
	+XVBcNMbwTEi3jyzQIQfBXpQXquZZXrw=
X-Received: by 2002:a05:6512:31c7:b0:5b6:1a7c:59d3 with SMTP id
 2adb3069b0e04-5b8a030d9f4mr210443e87.45.1789070259856; Thu, 10 Sep 2026
 12:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909-ks8995-to-ksz8-v11-0-0e04411a559d@kernel.org>
 <20260909-ks8995-to-ksz8-v11-2-0e04411a559d@kernel.org> <20260910170118.03DCD1F00899@smtp.kernel.org>
In-Reply-To: <20260910170118.03DCD1F00899@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 10 Sep 2026 21:57:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLkdyL3Rd3Su3Ewmx_80wGE70Rgb759bdpCPpR+-w7sOsg@mail.gmail.com>
X-Gm-Features: AcwNN1WD3i-rXXO3zdtB7GgqUncUy9J4OgpnOVk17t5DpmvrZa_xkc5hKsdOx4Y
Message-ID: <CAD++jLkdyL3Rd3Su3Ewmx_80wGE70Rgb759bdpCPpR+-w7sOsg@mail.gmail.com>
Subject: Re: [PATCH net-next v11 2/4] net: dsa: tag_ks8995: Add the KS8995 tag handling
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 7:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> > +static const struct dsa_device_ops ks8995_netdev_ops =3D {
> > +     .name =3D KS8995_NAME,
> > +     .proto  =3D DSA_TAG_PROTO_KS8995,
> > +     .xmit =3D ks8995_xmit,
> > +     .rcv =3D ks8995_rcv,
> > +     .needed_headroom =3D VLAN_HLEN,
>
> [Severity: Medium]
> Does this code reserve enough headroom for the worst-case transmission pa=
th?
>
> When an SKB is transmitted via ks8995_xmit() with a hardware-accelerated
> VLAN tag, the driver first pushes the hardware tag into the payload via
> __vlan_hwaccel_push_inside() which consumes 4 bytes of headroom. It then
> inserts the custom KS8995 switch tag via vlan_insert_tag(), consuming
> another 4 bytes. This requires a total of 8 bytes of headroom.
>
> Because needed_headroom only requests 4 bytes (VLAN_HLEN), if an SKB arri=
ves
> with exactly the requested headroom (such as when forwarded from another
> interface), will the second tag insertion exhaust the headroom and trigge=
r
> an expensive SKB reallocation on the fast-path?

That's a valid concern. I will increase the headroom for v12.

Yours,
Linus Walleij
