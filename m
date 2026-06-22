Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9563B14B6
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133652; cv=none; b=lnOdXZZyeIuFWcvRGgoki3NZsK2dU/u+Ixfvlo2SJlWifhOKlF85Tt5bMtEBZO7Z/McdEXgqe+paTEuV1hc4friPmMWvwMmxzfcNAB87xuEiQyeSMgVIPE8jtWoZ2uPRpce53YjRwp17TkuJ2GuGX2m9CJ5ClMmGgNTWP72a+58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133652; c=relaxed/simple;
	bh=1etyWsaiUeb9zM/M27udCVQPp+0lo8G8Gomb4RFTGHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nf318YqnfvKCzV3Fcpi36mqPMqmCv9Xnf0gwHRYCptwmd/A114XPVJAVWl7GOilCom+HduJferfh69u57KOeUX98MRGOEE6jz8eYhY2w+wVvqawb469TptIQgfsB4/of64iYBIttUfVwuGjosbK6ckC2KoHwlF7iwco3nx5jNa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c0efc7ef797so125759166b.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 06:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133648; x=1782738448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZq4bH2MyvWfP84B8pnnxe0yT9Gu/blfmP5NcpwNQ1A=;
        b=XoYzf4aZoWDMazsEms4MtrV081Po/nwp6/GrwDsCIqu/Dd3oTTvPkgkm4kuWCYzbJQ
         kx2mJT26g8YhnZkbtwj8E29vG6/Z0vg8o1t5lvVgOcL5xcg3f58CNxIa8VgKqnNzUGY4
         hXjii3ktepD41zBYFG5WMkLWF62fcVzhbV3ReY0tz1ez5WU7WrvHkrrMuMSN+1+QIKeX
         NmLB/7kdu1GrhCkcRyDHPtcOQknsHIYNPs2l9E5MMzIf+7/evyrOB50e0Zr3KndKKLpz
         NmoUw8ScKi6PsUlDvx7VhUlPzcKGcQ6bgjegdHZyfvDDWUy425S2hMPV1IZyTZ59jOE+
         KKzQ==
X-Gm-Message-State: AOJu0YzSZ9IUxesDlkYb5QUwYpd1OiEttpzWmLlP6tqBmohgMHF/QJTg
	QN1WPoYbhFScnWtHnpGcRckFJUOlHX3ll3b0gQnUMYb0QBNsPEkk/6FVph/0qiyE2Nw=
X-Gm-Gg: AfdE7cn3cSkY23d1K0cKdlu+ey0nkRff0tzQNtMonI/1BDKcFdQxGdS8tDno5piVjYr
	Mq46WwT4CwgJ+uNp38ZMlGt8v4WK4sTILjPp0zOl1cGV0DN0HE7kmxX4SfmgFWywK1uqBqaB4UO
	IGP5qxv4OD/AHfEsr4eTFSlZiTo67D54ZwKAiJ+Zh9nByDO7qI6imOZcD083HzzYpAzCQ17r50t
	0SNn2hGjKg/W0WTO7Jn9xJ00IFceUI3bE7TfsE9/HoaPGNXn7WGKgQ8XoduL0lun1JIKV/9ljIs
	QSKo8ge+LMjld1Flvf2TTvGsZQ2sxL89f16k9l05L4HGy798t1eXymrUeN9YXbvojKJrl+cS4pD
	FBvdfhvfMnJCLvLpwsf9otM3w+I38Z3AfoeZsCAGZZ5iX3X0Q0YCa1hyUkyojQW5y5QelOOHlpc
	5XVShBVGAC8wqCuoYOgEgTJGamVrfPWIgUCJKkiD0Wyxr3J0o2+g==
X-Received: by 2002:a17:907:e849:b0:c09:4ad0:9a3 with SMTP id a640c23a62f3a-c097ae0c8camr752568866b.4.1782133647818;
        Mon, 22 Jun 2026 06:07:27 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac80c8sm348475966b.40.2026.06.22.06.07.26
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:07:26 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so8040607a12.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 06:07:26 -0700 (PDT)
X-Received: by 2002:a05:6402:5386:b0:691:b158:b416 with SMTP id
 4fb4d7f45d1cf-696dde5eb11mr6568890a12.6.1782133645683; Mon, 22 Jun 2026
 06:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260618181949.3036280-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618183334.F10DD1F000E9@smtp.kernel.org>
In-Reply-To: <20260618183334.F10DD1F000E9@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:07:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKuzYPm-3XyMUZCM6K+GpQPE=JgDJdQiaPtwyYR7cYWw@mail.gmail.com>
X-Gm-Features: AVVi8CelaUC9eVEsVaVP0hR5s-RRU3sKR6olPCsBX6FF2PRrYumOZ-b82ZBXojk
Message-ID: <CAMuHMdUKuzYPm-3XyMUZCM6K+GpQPE=JgDJdQiaPtwyYR7cYWw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
To: sashiko-reviews@lists.linux.dev
Cc: Prabhakar <prabhakar.csengg@gmail.com>, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Jun 2026 at 14:11, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Silent 32-bit unsigned integer overflow and zero-extension corru=
pts PLL calculations when 'p.k' is negative on 32-bit architectures.
> --
>
> commit 68e2983ee9a6e8d870b293872442cdc2bc7b3e74
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for calculat=
ions
>
> Introduce a per-SoC PLL reference input frequency parameter to avoid
> relying on a hardcoded 24MHz constant during PLL configuration math.
>
> > diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2=
h-cpg.c
> > index e271c04cee34f..fff89f2bdc0b2 100644
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> [ ... ]
>
> > @@ -335,9 +335,9 @@ bool rzv2h_get_pll_pars(const struct rzv2h_pll_limi=
ts *limits,
> >                                       continue;
> >
> >                               /* PLL_M component of (output * 65536 * P=
LL_P) */
> > -                             output =3D mul_u32_u32(p.m * 65536, RZ_V2=
H_OSC_CLK_IN_MEGA);
> > +                             output =3D mul_u32_u32(p.m * 65536, input=
_fref);
> >                               /* PLL_K component of (output * 65536 * P=
LL_P) */
> > -                             output +=3D p.k * RZ_V2H_OSC_CLK_IN_MEGA;
> > +                             output +=3D p.k * input_fref;
> [Severity: High]
> This is a pre-existing issue, but does this multiplication safely handle
> negative values of p.k on 32-bit architectures?
>
> Since p.k is a signed 16-bit integer (with limits->k.min allowed to be -3=
2768)
> and input_fref is a 32-bit unsigned long, C promotion rules on 32-bit bui=
lds
> will convert p.k to a 32-bit unsigned integer before the multiplication.
>
> If p.k is negative, the resulting 32-bit unsigned modulo value will be
> zero-extended when added to the 64-bit output variable. This would incorr=
ectly
> add over 4 billion to the output frequency rather than subtracting the
> intended fraction, which could severely break the PLL parameter search.

Good point!
Although this driver is only used on 64-bit platforms, the code might
still be used as an example, and copied for use on a 32-bit platform.

> Could p.k be cast to s64 before the multiplication to prevent this unsign=
ed
> overflow and ensure proper sign-extension into the 64-bit output?
>
> >                               /* Make it in mHz */
> >                               output *=3D MILLI;
> >                               output =3D DIV_U64_ROUND_CLOSEST(output, =
65536 * p.p * divider);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618181949.30=
36280-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1

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
