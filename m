Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346D041930A
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746174; cv=none; b=HGLulVDXv3tbC0+VWatn4n4zgenevABbHcwvZ2cttBg/LbZOlIqXr4cMl+jQmGQN2UW/DT/5dM9QKJgkbdEEFp7zL5cTF1mgJ2thwsXlWq32yYLW+1ERgPvpJG955FAJChSAitHm6xi1tfEa1Wi2Uspkw0kl6htTurJF4wTU3ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746174; c=relaxed/simple;
	bh=5qUvDc/anpKY0rZWXjGyA7aC9jD5KwFfUPFWYDXIwuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1Dwxyb4VT/FDXQzI1NXhDqRTBq8JdPizF3LPHhUy+MhlG2w9jF561cwMAQCPp1LCLSPsw9XjHekxAMk2KUrqzKWnfdK4QMXsxfvHjlEAKkJ7a4OF+dmYam2F5I2hSfHurf9FS6DB4FVQJB1IcQeZ1GKfsWiqVancB8fr99IfQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRrqQBNq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRrqQBNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B321F00A3F
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782746173;
	bh=eohseHTDVRorRwqLGgg5MSpmUGbKyFrl+Pmkvc7rkbU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=QRrqQBNqmhO8gQLY/RpbMxC3EEMDVBUulR8F5IrMqI8z2p1Gp5nViDZCmERffAgn9
	 BZkRt7Ce7re84q4acTElbEInzATEA9UHSV5q4lokpD8ItAldAvt4h8Njra2wJFXhJ5
	 3V+1t54Evi8kyULd440f3IYRO0K0zu8r/Upahc4bkATxc+Q+H4oCaXNwwx9Kg99Yus
	 ixoGNguok7z8aZnfUmgz9Gr/LMR9wJU/+jH+opKT742KohANrPVOHpYLMhL8IPIZx+
	 1fi+5NuhUhpfBMe7bvKrmjrnkJ7HIM9JLXg3lxv5uYuGYssZ2qtpC94DqhdIF3Qpza
	 ZIoljEqaQLIAw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3996c9eeebeso27225851fa.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 08:16:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq8Vo1gj5e4wCiqER4TNyaef854DdohDT+yB4an1YtgswOahTfE/m9xUa03OlrlLfUamalv/VW6U1pVcJTI68Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh0wAZ7iOHvw5fMNcYDcsj93ZBtxy5e22L5Kf3DGbUzLoHu/R3
	Q6/7lDwKNIqO3Uxz4cgZ5qjC+Q3BxHyFT/Yn3Fa6Tp+NzlYsqG2KJufjbgvC1tN5OGc4+9Ns9jW
	8oArNMmhon2iLlhf6PuwQ+RgwU5UO2t8=
X-Received: by 2002:a05:651c:1986:b0:39b:90f:b1dc with SMTP id
 38308e7fff4ca-39b090fc4f4mr12449031fa.13.1782746171458; Mon, 29 Jun 2026
 08:16:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
 <20260629-a733-rtc-v2-6-7b72112784f8@baylibre.com> <20260629131546.8D0261F000E9@smtp.kernel.org>
 <1jy0fx8lvp.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jy0fx8lvp.fsf@starbuckisacylon.baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 29 Jun 2026 23:15:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v64VWt6KBtQsqSez9HWBASh50txA4TvKwvdSeFtDH-x9rg@mail.gmail.com>
X-Gm-Features: AVVi8CepgUHMPDQkqp9e-_HXov3hbmLBBrR-cBueJlKz6r_Uxuo6w9fTKHdibJI
Message-ID: <CAGb2v64VWt6KBtQsqSez9HWBASh50txA4TvKwvdSeFtDH-x9rg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] clk: sunxi-ng: sun6i-rtc: add a733 support
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, robh@kernel.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 10:25=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> On lun. 29 juin 2026 at 13:15, sashiko-bot@kernel.org wrote:
>
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Critical] The master DCXO enable bit is incorrectly mapped as the
> > exclusive enable bit for the 32kHz divider. This will cause the clock
> > framework to inadvertently turn off the master oscillator, freezing the
> > system.
> > --
> >
> > commit 83ebb861eeea7934e5df335b0d1620cad0b733bf
> > Author: Jerome Brunet <jbrunet@baylibre.com>
> >
> > clk: sunxi-ng: sun6i-rtc: add a733 support
> >
> > This commit adds support for the sun60i a733 CCU RTC. It introduces a
> > new auto-detecting oscillator divider and several phy reference clocks
> > with dedicated clock gates.
> >
> >> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-=
ng/ccu-sun6i-rtc.c
> >> index 25dd87e78eb7a..2ec09e3464724 100644
> >> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> >> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> >
> > [ ... ]
> >
> >> @@ -227,8 +237,28 @@ static struct clk_fixed_factor osc24M_32k_div_clk=
 =3D {
> >>                                          0),
> >>  };
> >>
> >> -static SUNXI_CCU_GATE_HW(osc24M_32k_clk, "osc24M-32k", &osc24M_32k_di=
v_clk.hw,
> >> -                     LOSC_OUT_GATING_REG, BIT(16), 0);
> >> +static struct clk_div_table osc24M_32k_div_a733_table[] =3D {
> >> +    { .val =3D 0, .div =3D 732 },
> >> +    { .val =3D 1, .div =3D 586 },
> >> +    { .val =3D 2, .div =3D 793 },
> >> +    { .val =3D 3, .div =3D 732 },
> >> +    { /* Sentinel */ },
> >> +};
> >> +
> >> +static struct ccu_div osc24M_32k_div_a733_clk =3D {
> >> +    .enable =3D BIT(1),
> >
> > [Severity: Critical]
> > This maps the master DCXO enable bit, BIT(1) defined earlier as
> > DCXO_CTRL_DCXO_EN, directly to the 32kHz divider's lifecycle.
>
> Forgot to remove that unused define
>
> >
> > If a board uses an external 32kHz crystal, the rtc-32k clock mux is
> > reparented to osc32k_clk, leaving this internal osc24M-32k-div clock wi=
th
> > zero active consumers.
> >
> > During late boot, the clock framework's clk_disable_unused() routine wa=
lks
> > the clock tree and will disable this clock, clearing BIT(1) in DCXO_CTR=
L_REG.
> >
> > Could this cause a hard system freeze? Since this bit physically turns =
off
> > the shared master 24MHz crystal (DCXO), does it immediately stop the CP=
U,
> > PLLs, and all peripherals?
>
> I don't quite get what the AI is trying to report here. If there are no
> user, the clock will be gated ... so ? Am I missing something ?

I think it's just getting confused. Since you said it was unused and you
plan to remove it, I would just ignore the AI.


ChenYu

> >
> >> +    .div    =3D _SUNXI_CCU_DIV_TABLE(14, 2, osc24M_32k_div_a733_table=
),
> >> +    .common =3D {
> >> +            .reg            =3D DCXO_CTRL_REG,
> >> +            .hw.init        =3D CLK_HW_INIT_PARENTS_DATA("osc24M-32k-=
div",
> >> +                                                       osc24M,
> >> +                                                       &ccu_rodiv_ops=
,
> >> +                                                       0),
> >> +    },
> >> +};
>
> --
> Jerome
>
