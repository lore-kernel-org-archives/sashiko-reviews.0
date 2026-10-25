Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792937929;
	b=yKWF9BDHG7qdLgZYhPI1D6Ioow99xqgt6Lp1fKWoyUDaEGYgPBvmUdKX7bIG6DoFcNzl
	 90sy1aWxJhlftgsYQEl9nfAi5K8gixmBHh/vf33fKO0QbGkh/vHrJUTgsV20gBn1OpetS
	 HRr2ysjQubj1qdSQzDJkenuzOKZzhMHEoTiF+tCu/hAVpkrhsnC7B0MeO07F2Qb2L7aYC
	 1NkYnWc/RqhUwwdZdYjD+0VsK6Z7JZbrG7p7HLRuYNL2plT+1DTIvj6SsHQ0Mrd+tmTJr
	 lFYpDTxc+QdJXFrWqCxTuw9rgRAG/1ffrOjyzJh8+c6nJfGhuMKILYKUml+T109Yv5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=4VVJME7/gCLHk3YxwzcNW5mMjUauSr4kMD1EHj5gtSA=;
	b=ydOoY/b/WS7jtPydmcfDyjuqzNTuOSNkCg6pyU4Of9ANTfLSZAdW4jaMx8Dj+YcoFxvU
	 /zmF5aHhKCatonLnTU76BwCZ5Lo/7KbemaWGWxWA1PreUnWieoXYTRq4ObSa0oZ/R6oOT
	 lKszX08WRWXNM/6fH/4P4C7scvgjdhe45SJmH/IAEBmqICbkhLANRsxp45JAUgDL2HWFI
	 h37vKdpPNVk8ZtLVTf2hY9M1hBEHM/Lq89Z9zA98pOrdTX3O1ro7PZNLZOxndpRCRWPoO
	 Smjr4kvQXIdYMETxIomIKjGEnW0AP/GRQukrcTXjYlGJB7orTHGsT76fwCEWimXx22Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nMo1VVRu;
	arc=fail smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97B6606A31A
	for <sashiko-reviews@lists.linux.dev>; Sun, 25 Oct 2026 14:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A97B6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nMo1VVRu
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ea138a3497so13976795ad.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 25 Oct 2026 07:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792937928; cv=none;
        d=google.com; s=arc-20260327;
        b=gGXvqJEmHeRjpz0jDja3TtqrovsgjRRSNcp+pYs6JMtFakhDvjIMNyGVN2vhVHb6gA
         OXLiP0g+c2C8TSrzMEgSa71Hl1lx9aPLysoONHqU8rSvd17y8PBCsazKgkRNDcYL3E7v
         HFdFZR/2qyjkrUjtFgrx3dULoU+R+YOPd0VR0XxEKS8MXHwQQEJAI+WN377MtktG1V0D
         sPIcH9eA5/9EoseVxafbnQL0PywLH2bZKh/z1Rj++8WGEZgdQOLrbEEagdjy6rMpeH78
         22NPGkODzr/HsgO9Sf65luImLHGGPlj8peopLXVqEPkAZdu4SmMikytMlX1HLvYnteON
         OLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4VVJME7/gCLHk3YxwzcNW5mMjUauSr4kMD1EHj5gtSA=;
        fh=61pEyRGQWXdvwLxGcvwPuxSBCWmwHbm7ldu48yIiSE0=;
        b=AUH7uSd+M5q/sZzyFBB/0xaPbGsiBY+HcXFuMEDVEvjWl3od5m/j+OmvVCM63PUbUc
         vUzfQk6bqHPWYAh4ktp+9DP42oJZG9YPrneFfZUl+ofDhOnSRpUVtoxHDEcvd6zA8L85
         k88SObaXMnrbvPqfDFe3Ro7WA2IK3rnqbWBVv65Ty/Lt+CupLH3BFzx81uTFNUA1FSzF
         B6Hi8rjPbzDnhp5X5NcBIpBgi8eDwBr3wQu76VhxUMHNgbeFN8UQ8bkB2SF8KjY3jcqT
         ewfhX40AJQE4vG2ifGRrAL3HKJBwCu4n+rpL1S3FqYAmdrwly30dUvfq92A7/9tO4nVz
         sg1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792937928; x=1793542728; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4VVJME7/gCLHk3YxwzcNW5mMjUauSr4kMD1EHj5gtSA=;
        b=nMo1VVRu568ZSZmB4yPdiGJUGRjUBV936USFvJsyNzzD5/kbRZZ9mVbWK0HGTbwMkJ
         yEna1XGxs0ieMRptx+Ib9gVqAlmg8z9SUT+zzsqZKpz0O+CI4AiDjNcCvTKVTd25LWwu
         INXekfy+FNapeKfyGJ0DbROEpXJptQLoWGcw/dYzQq1Bxfd4bUEbaslb1DT3WZAvIZhS
         T8z/UGw9n0EtAfCTyftFFRkDXyDhwgEAMFN7X5gYTpDgfvE9ptK5V2AdiIrxhDFitIu5
         tWh8soBptQePGlVOvC8oHYupIOl0TCf4FkGRhIPPllAdyROg2Ohjq0AVR6em8CRfA9u6
         oiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937928; x=1793542728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VVJME7/gCLHk3YxwzcNW5mMjUauSr4kMD1EHj5gtSA=;
        b=WIeDPKqwfj5cUkHT24U0iKJaZwKi8ty27x2jF89FonIdvvKvMSG7h+I2Lt/SvUS0Js
         2QcJ9H4r2O4MIbarZr/QOCDW+Tl0mFrh9slMRqysfN27xKUfrbIUYYDuwwi2GlJz2aC6
         6Roxxz9CTsxSL5rieDtObJ148I1v36Vvo8vnYidgR0RJYKFLR3poC+hoJF6Biojqdrhp
         8Pd1cxnT4V4OFTffnI5Oq7aMPWDmpWFAQ6D0DMD7q6XYHjn0IhfOnSN2L4VBsA0fk/eq
         B6AwlYMSWKzJBEG+gv/CatooQokp6u1NAy/qoKXPLLKYmUnjh0oI1itRBBEzx3PjCRY7
         ItHQ==
X-Gm-Message-State: AFq9FYKZQmPe5uZkcTR9u8jqnKyebiEb6eOnEVv/ZkC7OAUUGk4jp21k
	qu6+eXxlnozp5u11zap4DBVPWKsiEw1oX6/xVu0IoW+I/eZ0kYV+5WAqCoI3UtzO4bPACnsAnXF
	eaKx4JY5pkfDupf1dagX3TX6Ze1HtN86aI9fBE2o=
X-Gm-Gg: AYBFou2mlasVi1KkOIl0SoxCK5w9WbcQwvRFa4Diny0hUKTNl3j/AkuuT8Wl8+gvmbt
	DEC6pQLvvkN1+b74ii7o6BSdXxqqJAY14GS5o4Kw9PrQuJA6trgaCS9ZJ2pPP3L9z1uP8twjUQ+
	5IGagkAzml1kf09qWH+ROa7lbwP0FRX6O/LEHSLLZ7FugCQDrL5jCnMBjKkzRCO6vgrZHGfNOdp
	1tzpZNv+SvJKkG90VwHl/QSHdxOy9g3lCST7fgZRgS4svenSV4o7ugHWKPvPPAYJfY7o0Zrhka+
	v6U51OaUlKingomz9FGvUpGweP1NfKRlzQUMcMjsKyU89jnRUgqaeuIgTAV340M6dyL61sVnLcT
	hkWRNzOh5RI3xa0QGz4in1mdbvjSSOSfr4nuB6AHQPklzkKaD/zzQ
X-Received: by 2002:a17:90b:58ef:b0:3ad:93b4:718f with SMTP id
 98e67ed59e1d1-3adeafcf07dmr3732331a91.65.1792937928015; Sun, 25 Oct 2026
 07:18:48 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025135745.102970-1-pmazzini@gmail.com> <20261025135745.102970-4-pmazzini@gmail.com>
 <sashiko-outbox-184238@kernel.org>
In-Reply-To: <sashiko-outbox-184238@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 25 Oct 2026 14:18:37 +0000
X-Gm-Features: AclHuK8AxVUbPpSRccmmoUo8xuovbvn143lgZz14iNyQWbJc3TwwX5_2Erfpfy0
Message-ID: <CAAxh=juk_TCTSTcC=REn6M7aJAoL0APmEtzG+ZsSVbMZnHYy+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll fix it in v3.

On Sun, Oct 25, 2026 at 2:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] pinctrl: sunxi: sunxi_irq_base_reg() ignores irq_bank_map on A73=
3
> --
>
> commit 1d99efa95c547fd409284e1974176bcf35345f69
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
>
> This commit updates prepare_function_table() in the sunxi DT pinctrl
> driver to number logical IRQ banks starting from 0 at the first bank that
> supports interrupts, rather than starting from PA. It also updates
> a523_irq_bank_map and adds a733_irq_bank_map to map logical IRQ banks
> 0..9 back to hardware banks 1..10 (PB..PK).
>
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinc=
trl/sunxi/pinctrl-sun60i-a733.c
> > index ca82f08a3a65b..3ebe926a1bc6b 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> > @@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MA=
X_BANKS] =3D
> >  /*     PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
> >       {  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
> >
> > +static const unsigned int a733_irq_bank_map[] =3D { 1, 2, 3, 4, 5, 6, =
7, 8, 9, 10 };
> > +
> >  static struct sunxi_pinctrl_desc a733_pinctrl_data =3D {
> > -     .irq_banks =3D 10,
> > +     .irq_banks =3D ARRAY_SIZE(a733_irq_bank_map),
> > +     .irq_bank_map =3D a733_irq_bank_map,
> >       .irq_read_needs_mux =3D true,
> >       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> >  };
>
> [Severity: High]
> Does sunxi_irq_base_reg() in drivers/pinctrl/sunxi/pinctrl-sunxi.h ignore
> a733_irq_bank_map when SUNXI_PINCTRL_NCAT3_REG_LAYOUT is set?
>
> In drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c, a733_pinctrl_probe() pass=
es
> SUNXI_PINCTRL_NCAT3_REG_LAYOUT to sunxi_pinctrl_dt_table_init(). However,
> when accessing IRQ registers via sunxi_irq_cfg_reg(), sunxi_irq_ctrl_reg(=
),
> sunxi_irq_status_reg(), or sunxi_irq_debounce_reg(), sunxi_irq_base_reg()
> only calls sunxi_irq_hw_bank_num() on the non-NCAT3 path:
>
> drivers/pinctrl/sunxi/pinctrl-sunxi.h:sunxi_irq_base_reg() {
>         if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
>                 return pctl->bank_offset + bank * pctl->bank_mem_size +
>                        A733_IRQ_REGS_OFFSET;
>
>         return IRQ_REGS_OFFSET +
>                sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
> }
>
> With prepare_function_table() in drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> now numbering PB..PK as logical IRQ banks 0..9 instead of 1..10, and
> pctl->bank_offset set to A733_BANK_OFFSET (0x80, the base of PA),
> passing the unmapped bank index in the SUNXI_PINCTRL_NCAT3_REG_LAYOUT
> branch shifts every GPIO IRQ register access on the A733 down by one bank
> (0x80 bytes), so PB..PK access offsets 0x0c0..0x540 (PA..PJ) instead of
> 0x140..0x5c0.
>
> Should the SUNXI_PINCTRL_NCAT3_REG_LAYOUT branch in sunxi_irq_base_reg()
> also translate bank through sunxi_irq_hw_bank_num(pctl->desc, bank)?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025135745.10=
2970-1-pmazzini@gmail.com?part=3D3
