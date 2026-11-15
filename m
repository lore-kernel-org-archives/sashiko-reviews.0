Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735847;
	b=hCcjyxPsn/LL0MPEEBhJojUjdNp6ACCr82wtOTL0ZIkR0G3ThPe8HThYWiHmZkmev6Kv
	 MhNPRzozuJ8LiQRiXsfqiFWeQSBizD5uNaMxiEZbbFhRpx4DMUE0JRE1LSOmELB8pfeaF
	 wvfS55x8OaooSCqHjTYwqJbbIle3L4plIsOlyw3FoM7/o6AXEku4LpJwtjd046NMJQC4T
	 jMXAcSyBXVkYXuwuNM7UZRXkR44DX4exgugts2Sa1uzGefDc0LNIXB0r5jz6k9w9966kJ
	 UZKqxNasUg7I9pRFhvkdW/P89j41P+niPPwI6H9BRhBnegdG4Z4gnwozqeAs6Lk9KvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735847;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RpQAkSou5b8icqF3P8gOQ5t+G3JTqaILCtPO0nm3W2s=;
	b=zMWXaKTPoG6YiTTbpAZWnRzfKw3WOH93G3xTq7C9ffLcumpae+QLxWTeFr3VqsyFS+4s
	 2yySbvmRpDInPp2c4z3Uvqb+pi2z2vWIohAl3dl4G9eTfkZH9S4OczEwPzUC4a4Vtkfp9
	 eSPWpPbvfRQKxBVor6Bk9lLuMURKjE9X5vaN0rsgNuXqbBELikElkLWbizJxFpATXcA4I
	 F/lhhU9KQ1VT9yLjBRBKwUu4vKwBjlZdgaVdSAXh5WGoIVs+XVwBaJLPoIQj8OOvZSfr/
	 lNTveV93aBhk8zTjAMcVbvW+VJTWKx30s+5iSoqCGv7DzJ/H+ZNYwn42JUZqxFObpNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qtp6yZON;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22482606A31F
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qtp6yZON
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B709B1F000C7
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 09:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794735846;
	bh=RpQAkSou5b8icqF3P8gOQ5t+G3JTqaILCtPO0nm3W2s=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Qtp6yZONauyl4HHIQLq//dQmvOMGBgyE4Oq56ypw2oUZetM3r8Lxh5wnAZCARyQKc
	 1a9kfcqtwQikRMIZwuo5OEpCdoDEkTglZy4XpqJMX5td/LpwkGjtAfOCb3AcGUd1ob
	 YXWV80839+3Ecsq7EjGRm40ZBT9EU3oe/wXXctmVWf81fas7WqZU76yq/xyvEZ1RRI
	 VZLe/1i81TFABQg8ugB/M8YN2EhjMxL2Nvsaf3w0CzwHzW+5UWTR4URDkICa8ge6zz
	 QengMLNTahFQZ/Kt4/fNJhOJyxdRz3m8miTZbiLQuVFZxzcYnbNLotRwLiDW4xvTY7
	 Q7FePrdoqqjpQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae3a5d440aso10267321fa.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 01:44:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFKLYyHVl+Gd1cVCYPt61jjh6+mNT6oFeT7p5eGdbwEW7+D3aBEjblJ9SsroSuiHoCyn5dNhD4+IaR5oF9RrUs=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ql5lcJAvA28WbxLNFyGU9tv8VAEoUd1Pbdh84DM/Y0PNa278h
	YhjelfDKKuvjZEs7qzO3DJlh6tdqV4NW6ZwrWB4zjdlT1UO0rW/N/uhWMXkgDBC6UB+EiUXNGju
	B0UdMNpT3NpZf0BdXgYK1tSVvM1aYvU0=
X-Received: by 2002:a05:651c:211b:b0:3ab:1639:9a75 with SMTP id
 38308e7fff4ca-3ae2b4efaebmr20925271fa.11.1794735845129; Sun, 15 Nov 2026
 01:44:05 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115-h616-pll-output-gate-v1-1-4cb3fc4d6c48@gmail.com> <sashiko-outbox-215303@kernel.org>
In-Reply-To: <sashiko-outbox-215303@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 17:43:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v65bC7-ZSRVG+KgK7BcTaXR3SbEiTcqGK+LuVJjpL4ihXg@mail.gmail.com>
X-Gm-Features: AclHuK8jwUtBWiLYgeJdJCLUdvN8oG7NhxiuPhYWv3uHkiiADDymIYAejmjwfqg
Message-ID: <CAGb2v65bC7-ZSRVG+KgK7BcTaXR3SbEiTcqGK+LuVJjpL4ihXg@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: h616: Gate the PLLs with their output
 enable bit
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 4:45=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] clk: sunxi-ng: h616: sun50i_h616_ccu_probe() leaves BIT(27)
>   forced on in loop
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [High] clk: sunxi-ng: h616: wrong GPU notifier registration order in
>   sun50i_h616_ccu_probe() [1]
> --
>
> commit 733f137b19620733cea59e88a8f5b18ba7301d4a
> Author: Arun Iyengar <aiyengar1990@gmail.com>
>
> clk: sunxi-ng: h616: Gate the PLLs with their output enable bit
>
> This commit changes the H616 PLL clocks to gate using their output enable
> bit (BIT(27)) instead of the PLL enable bit (BIT(31)), and powers up the
> PLLs in sun50i_h616_ccu_probe().
>
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi=
-ng/ccu-sun50i-h616.c
> > index 955c614830fae..da4156b39c2cc 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
>
> [ ... ]
>
> > @@ -1214,6 +1214,13 @@ static int sun50i_h616_ccu_probe(struct platform=
_device *pdev)
> >       val |=3D BIT(0);
> >       writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
> >
> > +     /* Keep the PLLs powered and gate them with bit 27 (manual 3.3.3.=
6). */
> > +     for (i =3D 0; i < ARRAY_SIZE(pll_regs); i++) {
> > +             val =3D readl(reg + pll_regs[i]);
> > +             val |=3D BIT(31);
> > +             writel(val, reg + pll_regs[i]);
> > +     }
> > +
> >       /*
> >        * Set the input-divider for the gpu1 clock to 3, to reach a safe=
 400 MHz.
> >        */
>
> [Severity: Medium]
> Should the existing pll_regs loop earlier in sun50i_h616_ccu_probe() be
> updated to set BIT(31) | BIT(29) instead of adding this second loop?

I agree with Sashiko's assessment. Please tweak the existing loop instead
of adding a new one.


ChenYu


> drivers/clk/sunxi-ng/ccu-sun50i-h616.c:sun50i_h616_ccu_probe() {
>     ...
>         /* Enable the lock bits and the output enable bits on all PLLs */
>         for (i =3D 0; i < ARRAY_SIZE(pll_regs); i++) {
>                 val =3D readl(reg + pll_regs[i]);
>                 val |=3D BIT(29) | BIT(27);
>                 writel(val, reg + pll_regs[i]);
>         }
>     ...
> }
>
> Leaving that first loop setting BIT(27) unconditionally ungates the outpu=
t
> of all 12 PLLs before the video and audio PLL dividers are configured and
> before disabled PLLs are powered up via BIT(31), and causes the clock
> framework to see every PLL as already enabled at registration time.
>
> [Severity: High]
> This problem wasn't introduced by this patch, but later in
> sun50i_h616_ccu_probe() the GPU clock mux notifier is registered before
> the GPU PLL notifier [1]:
>
> drivers/clk/sunxi-ng/ccu-sun50i-h616.c:sun50i_h616_ccu_probe() {
>     ...
>         /* Reparent GPU during GPU PLL rate changes */
>         ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
>                                   &sun50i_h616_gpu_nb);
>
>         /* Re-lock the GPU PLL after any rate changes */
>         ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
>     ...
> }
>
> Because both notifiers use priority 0, they run in registration order.
> On POST_RATE_CHANGE during GPU frequency scaling, ccu_mux_notifier_cb()
> reparents gpu0_clk back to pll_gpu_clk before ccu_pll_notifier_cb()
> re-enables and waits for the PLL to lock, driving the GPU from an
> unlocked PLL.
>
> [1] https://sashiko.dev/#/bug/linux-b48c9987-4bbf-4231-b1fc-24d8ccdf62d9
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-h616-pll=
-output-gate-v1-1-4cb3fc4d6c48@gmail.com?part=3D1
>
