Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962C84EF152
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166916; cv=none; b=AEFYfYCfwkTO9ioQaTvTZ/Bh0m6zYPXoNkrRhSYzUL+1Ip4UudANb0sy4/iLWmXqozhKWaO4QL8lK5tdJbrkkdJ6FZV7NPrVpsJGaYjfsABB1qkz9JcJ/siTzj23MdqudT3mG0cINpwPrJ8DnjNFzEoBW7TxTmea8qP8v6v0qGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166916; c=relaxed/simple;
	bh=8A1d+qHHMFQaSJTrPG2tv/uY9JQA2ctyWGVH/vz47R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i35J9tKTGBxsI4GpJSal6yNj2JJCgJdE5uWbsGtexuZBgvnOTG+DusPFPIuuybJXkZLs4/ORt/d0wK8EeTEBydXZfD7LiLbQexTul6GMK7gctDiDcu/1Hbjy9orbieTWBAh165/ETHpWT/nn0E5mVs2ulStpwuYUFu/Iv0hstPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5d4d307fab6so36216e0c.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 09:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166913; x=1792771713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EBoejTYsbTcBCosEo6zoo5hOecy+fLbrjfkaXbBdKs=;
        b=qFMDIiwS86LrUfHSu7fpHdnGGyhk2qBDvIB2B3xbe9x9gKSLm+QJLX1HacSt9a9IuN
         LD8En0KqeqtFZxQpmQEIRbHjNwO8iabHuHgwY/Lnt9FzC1r6W4Dm6pIFD25dNLkI8UA5
         gdDU3ZUPbJeDaDgQMQJF3tWjb+20W5GdTvtlR4M2Rc7Q3l2HPYAXcd3uSs0mCCPeny2i
         0md3WteC/UpDH1aUSpQpyoZot4hk8NXZNW+fJRCtVU9giVfMwE8Q0MxefY99mC55VcwW
         leHXt64tqpjvmAVE3zcuetSzLMewjsADOLie3P2P/Ee7iT4ezp50lb7gwm/B+MvZilhS
         Zl/w==
X-Gm-Message-State: AFq9FYIKTfGL/3u4BXwC22x3tc5L2giQJNq/Rb2Re7IrN44iRBY4a1an
	o1zrMLq3SDsrN9rzd3xaTf9PwJfdR19j85FDTUMSUOR4sfE2O/+zS1+wGQv1cRW4
X-Gm-Gg: AYBFou2Or2x1Gncgd+nItfkoEubzb9lTCOkMudIqsuTDnBJsMXCXMidIFkeBwpxT4NY
	bLvAYzoifrpWU+xJUoGSo+D4vS9NHEtNERP2Onpm7/KPhuCQvyXlyTwk9q0pTEmmHi67Sw0QZqt
	krAe5RO5oa1olygfEF+y28vK1au2qTMFigX82GBbxBK6B6N6iM/OUjL6L1MG4qC4qWePW5p/rfj
	D8BtdCAt31YxdsvF0aaAin0gNvOIZ5Y3RuvxGK5YoG7Ya9T8eQ83JQODD3ZeXsct6ddxHMKeZVq
	j5K9m1d97cTpQ22To7mJWN07i5NS57i1O+h6+8wNdWSKf/vNp+Q6QqsG3j+32dFjuncBwIrvsdi
	dgpktHSTPQyRvL9upnYJTgGrBWC6pOiEz1u7WyYrq3w/EJuTT8PwOLe2W7U5/qwuNtbzW+nywJ7
	xrJTaJiASWofIgU55gNUc2ty1sGlcmgH4PC4rT5/l0KEtmDnjmDDuXJ+QIyZluHNcmXN40I+eVw
	2clxnrt8dKaVDeow+1E8oEi4IRgr+uV7L7lQN7y
X-Received: by 2002:a05:6122:328f:b0:5c9:a60b:e5d9 with SMTP id 71dfb90a1353d-5eaaa6a3b3bmr275631e0c.19.1792166913496;
        Fri, 16 Oct 2026 09:08:33 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b474b2asm1828423e0c.4.2026.10.16.09.08.32
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:08:33 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5d4d307fab6so36207e0c.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 09:08:32 -0700 (PDT)
X-Received: by 2002:a05:6102:5ccb:b0:7a1:fa0f:1106 with SMTP id
 ada2fe7eead31-7cb3a1baeabmr5620835137.36.1792166912166; Fri, 16 Oct 2026
 09:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <b9e68c8df1e545191e0359dba23fe53de31a4ce5.1792163045.git.geert+renesas@glider.be>
 <sashiko-outbox-174595@kernel.org>
In-Reply-To: <sashiko-outbox-174595@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Oct 2026 18:08:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyr7MN3Q_p2xYWukmbwdSPCmR90++AJWohsS7TWqxp-g@mail.gmail.com>
X-Gm-Features: AclHuK94_MM_qmX3UtowEDModV_nQO7Yoe2DHkKw0PQAKUP0rJtGNhubnONEYfQ
Message-ID: <CAMuHMdWyr7MN3Q_p2xYWukmbwdSPCmR90++AJWohsS7TWqxp-g@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] reset: Add reset_control_get_from_provider_exclusive()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Fri, 16 Oct 2026 at 18:02, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] of: memory leak of device node reference on error path
> --
>
> commit 6e1c5e27c808997c3ce5fe5fc257fedbfabb6954
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> reset: Add reset_control_get_from_provider_exclusive()
>
> This patch introduces reset_control_get_from_provider_exclusive() to allo=
w
> looking up and obtaining an exclusive reference to a reset controller fro=
m
> a provider. It modifies the existing __reset_control_get_from_provider()
> helper to support this lookup.
>
> > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > index 0e11f4c81c10d..421bcc4c89cc2 100644
> > --- a/drivers/reset/core.c
> > +++ b/drivers/reset/core.c
> > @@ -1153,18 +1154,30 @@ __reset_control_get_from_provider(const struct =
fwnode_reference_args *args,
> >       if (WARN_ON(args->nargs !=3D rcdev->fwnode_reset_n_cells))
> >               return ERR_PTR(-EINVAL);
> >
> > -     if (rcdev->of_xlate && is_of_node(consumer)) {
> > -             struct device_node *np =3D to_of_node(consumer);
> > +     if (rcdev->of_xlate && is_of_node(fwnode)) {
> > +             struct device_node *np =3D to_of_node(fwnode);
> >               struct of_phandle_args of_args;
> >               int ret;
> >
> > -             ret =3D of_parse_phandle_with_args(np,
> > +             if (consumer) {
> > +                     ret =3D of_parse_phandle_with_args(np,
> >                                        gpio_fallback ? "reset-gpios" : =
"resets",
> >                                        gpio_fallback ? "#gpio-cells" : =
"#reset-cells",
> >                                        gpio_fallback ? 0 : index,
> >                                        &of_args);
> > -             if (ret)
> > -                     return ERR_PTR(ret);
> > +                     if (ret)
> > +                             return ERR_PTR(ret);
> > +             } else {
> > +                     of_args.np =3D of_node_get(np);
> > +                     of_args.args_count =3D args->nargs;
> > +
> > +                     for (unsigned int i =3D 0; i < args->nargs; i++) =
{
> > +                             if (args->args[i] > U32_MAX)
> > +                                     return ERR_PTR(-EINVAL);
>
> [Severity: Medium]
> Will this leak the device node reference acquired above?
>
> When consumer is NULL in __reset_control_get_from_provider(), the code
> acquires a device node reference via of_args.np =3D of_node_get(np).
>
> If an argument exceeds U32_MAX, the function immediately returns
> ERR_PTR(-EINVAL). This early return skips the of_node_put(of_args.np) cal=
l
> at the end of the block, permanently leaking the OF node reference count.

Yes it will!

This can easily be fixed by moving the for-loop to the top of the
branch, i.e. before the of_node_get().

BTW, perhaps the time is ripe for helper functions to convert between
fwnode_reference_args and of_phandle_args?

>
> > +
> > +                             of_args.args[i] =3D args->args[i];
> > +                     }
> > +             }
> >
> >               rstc_id =3D rcdev->of_xlate(rcdev, &of_args);
> >               of_node_put(of_args.np);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792163045.=
git.geert+renesas@glider.be?part=3D4

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
