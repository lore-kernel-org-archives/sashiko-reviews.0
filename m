Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744454;
	b=PnxwdAzXe3z4h/m0bZsD0JtXDqSU0eU72jMqGed+G3HbcESJt2mFtWHYxQMnkUNzMiX4
	 brmsRRRBWFFZzg3PR6yJPkAr40l0SPorCRJ7bU65H4oaKqIkmFNlRAwDCLnYBZbdWgt/C
	 blCa5Ej8Mq0NZiCv13T/x67WUzTxw1pdAWK/h3SzHcwQ/TgpT26si34yjLKZWx7O52UR0
	 RiMQl8Ilohexyf96mkzoANM2iiSReyCrQc9c9mgrqrUv9yEG0JLMnSWTGkheEmqs26iWS
	 +ApwO28IPKMObvbHqh6Mi1rBK8YR0gNEkUJ65Gd4YJTCI5Yle6ft2Ja8kp/aiTPI7Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744454;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=pAyFOMytrC+WHeplIQk/P9QT+U18pl2Kv43Ux7MJxzk=;
	b=ZQk9wQIOzTX9TapO91Lkr53aJpUDLOgzbnsamsRN8e4ek+GNQR0N2DC3sPYwtMJ9rsJ3
	 VfDJGMbgY8RDBB2F36MkEcungVr42+ayg+HfRBMk82OiT+agfRCkNOO3AJ5O864pmU61d
	 1aUUfSBbKZWsnmOopCc+wsNw1K0MpH3DSvw0aDu5rBpQUfVI9NJNe29Q2NJyo2H7xN86N
	 qEUrUU1lv1G93AkHfJgojuAfy9AVFm/XAPTLF1RuxOYtlL/OgoXHZc1FvrSDuucJL46tp
	 ehCwKx5ZY8tkoS2qXMiye7SiuIiPTfedP9RfzaqHiuLwX8b1sTYApxesUVGhzuZFATg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QmryQVy3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16091606A31A
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 12:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QmryQVy3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65981F000C9
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 12:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794744451;
	bh=pAyFOMytrC+WHeplIQk/P9QT+U18pl2Kv43Ux7MJxzk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=QmryQVy3E4N4wEuCGP5CyTEkNTyKEYCUZRKbip0gcAAbNA8XjVCONvX1P27ojkmK2
	 7wlRSq6lkiWMj3EkWkwQgJdwRLGN7RGgtGvjP8nhcKGYuwoA7jYvt25xAHHvQj7G0+
	 zhaffkcEJHF9LY/5rfg8kj/dyKMuUp1emC6EF0WDhzRWkh8e8ehO6K2cwPgIPToN2w
	 y1nhTkR+Z2VIr1K7WGDrFwhGbNfmFstNZRPdMB3BL8jzHwGas9wcBEF0bxFKT6y3uc
	 /A3bifvu+XZpGDBD9fN14pMIu81f8POg8z4RcF0j/qFeYnsE3dJmsJc176FcysyTvV
	 rPFzIWhB+6NuQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so22797301fa.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 04:07:31 -0800 (PST)
X-Gm-Message-State: APuU4Z8HfBeYTQMSgwB0iK7w4DFnioVQ+K3ynPvMdU5ihSJT2Q0d5W7T
	u79EXJdraUk9/umFyuLO1rxeVsfH6u1C0En5jonINsffthuG2rVSbYMdJ+VWsmXPCJn/5+Ir0rH
	NX1k4LLOEGIhYvzqV8GtjlMqrjyvoRn4=
X-Received: by 2002:a05:651c:b26:b0:3ab:3bf3:1606 with SMTP id
 38308e7fff4ca-3ae2b52ecbemr25194061fa.24.1794744450062; Sun, 15 Nov 2026
 04:07:30 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
 <20261115061102.229680-3-jernej.skrabec@gmail.com> <sashiko-outbox-215249@kernel.org>
In-Reply-To: <sashiko-outbox-215249@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 20:07:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v6544+a2Cv65u8ZCsJmP4d6DD8W2Kb3WOtvo8=Q2+snt2w@mail.gmail.com>
X-Gm-Features: AclHuK_eMLnNxsMBol5YFdkTkMTb1ru6MI-INl_vc-Xaa50KKeV9dybfAnsle1E
Message-ID: <CAGb2v6544+a2Cv65u8ZCsJmP4d6DD8W2Kb3WOtvo8=Q2+snt2w@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] clk: sunxi-ng: de2: Export register regmap for DE33
To: sashiko-reviews@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 2:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] clk: sunxi-ng: de2: missing select REGMAP_MMIO for
>   SUN8I_DE2_CCU

Added while applying.

> --
>
> commit d1c006fcc75e6e1facbfb7f265581bef0d4d672a
> Author: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> clk: sunxi-ng: de2: Export register regmap for DE33
>
> This commit removes the hardcoded DE33 plane mapping writes from the cloc=
k
> driver and exports those registers via an MMIO regmap instead.
>
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-n=
g/ccu-sun8i-de2.c
> > index 6ec6c0dc4c261..f17570efafaae 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
>
> [ ... ]
>
> > @@ -336,13 +367,19 @@ static int sunxi_de2_clk_probe(struct platform_de=
vice *pdev)
> >       }
> >
> >       /*
> > -      * The DE33 requires these additional (unknown) registers set
> > +      * The DE33 requires these additional plane mapping registers set
> >        * during initialisation.
> >        */
> >       if (of_device_is_compatible(pdev->dev.of_node,
> >                                   "allwinner,sun50i-h616-de33-clk")) {
> > -             writel(0, reg + 0x24);
> > -             writel(0x0000a980, reg + 0x28);
> > +             struct regmap *regmap;
> > +
> > +             regmap =3D devm_regmap_init_mmio(&pdev->dev, reg,
> > +                                            &sun8i_de2_ccu_regmap_conf=
ig);
> > +             if (IS_ERR(regmap)) {
> > +                     ret =3D PTR_ERR(regmap);
> > +                     goto err_assert_reset;
> > +             }
> >       }
>
> [Severity: Medium]
> Should SUN8I_DE2_CCU select REGMAP_MMIO in drivers/clk/sunxi-ng/Kconfig?
>
> Without it, enabling SUN8I_DE2_CCU when REGMAP_MMIO is disabled (for
> example under COMPILE_TEST=3Dy with ARCH_SUNXI=3Dn) or built as a module =
with
> SUN8I_DE2_CCU=3Dy breaks compilation on sun8i_de2_ccu_regmap_config or fa=
ils
> to link __devm_regmap_init_mmio_clk().
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115061102.22=
9680-1-jernej.skrabec@gmail.com?part=3D2
>
