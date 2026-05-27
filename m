Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8460C37AA7F
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 12:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779885907; cv=none; b=QughF4plRDqFrycdW2+1RhgMg0bDCL4fcxrYRAI6A1pXm9npl06ujTjKlP/YN6O/MStb0EA4ujw7Ook0PjUCqexkelvnDB6zUb1iFVHrODYT4Yx88iM9zYwy2pWZWuglvItlCvDPJ0YAS5qI0g6O6OfIcsFV4fvJHXQ0Z0zR4VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779885907; c=relaxed/simple;
	bh=CHmi2tzKRp9iEkWNt7hiYl4WAuhMTowdb6VPQfNs0nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIbyae5qMOG5c3AgUdssEDSKOGwz3MmM39dqL+nTGJhvAFwxr48/mN5+ijvysQfiPPit9m0Ac+EaOatHVZexy+SzA1HhHXIKkOuIyqwfBJAT4AobU5sreZiYLDOvG+PCnyVs2IOvRx40LvGY+Uqw2TEufGEXaQuU6W1L5ceemIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-631a7868228so7720162137.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 05:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779885904; x=1780490704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfMIenARBAqpHOVTmcafwSvjzdDvSTCw5oC80BE5U+Y=;
        b=VLzzlWr7HJ14uAfovw5Co4mXs/k2UwFCUTbXxZpPRLP+H8ajipTEgsg/ChhDAxNTc4
         QIxlr3MsstCpKuq4tuqegBOacBKU7ZW8cYDLErIOSAlKZVDbuAEalkTVfSky+sY+krP0
         WOWzDWRyuLBBNzS38o8KG3wOjNDvlE7PtSZrVy5KwysW0C7+lf37PGNSzxfXWTQ3+HUQ
         SYvHBjX/eZPTDmVXseHvQB47azdwHv8KYushXic1cnFAVMcjSzZ+CemGrXyxFqMlRgJ7
         RTsIv7YJuXdrJdZlwv7FpJtKkL4+PzTWnNcXqKjKhJaMsR16D2256rpaERuwi8A5SLHu
         +w4Q==
X-Gm-Message-State: AOJu0YzjRcFm6QgdRY0Ia8iRVyorYzgFyJ2iVLHZtI3dpfnBdW8Jb6Yo
	P7LSoozoxMz5wThAIdBDRvU4EPMwmMkvfDtFJU2RtrIlxvA8zedCsT228tiC4g1mgy4=
X-Gm-Gg: Acq92OF74n0oa+G+oDxUIxvmxRxBg70Oyp07uEjKMD5iimWOvrCyRCVKm1C/pFL70tP
	Iuf5tRRhy055BBEHssl2Zc9oBbebZZTYRH8svo5WVm/aj6eKAXHOmdwqnvZJj8/gZZFXRHSUtxm
	pcEROUH2jHFkL98MfgN/loJpmR26OLr8TiwEy0sZXcWC7U0JnRgP6nZZaLymm4AjL5vxfvi0BYg
	H9GWRTvWYCbHogRfDHdZNlOUMGG2DJ8RjeFM0Grplq5VFJK3G6wFJmZ+58blPo0PQk/PzzYkl+W
	cRFuhac+ZP8IFVhduFiX518T7AAc7F8l7+m5zoxi/ZWijQQi1Dq9KrvKequd32IPkLAskyCUWgq
	aRWAELY1AyofNxcCgjdWf4nQgKU7PsqTJ+bG5jvKYHELStbXblFla90TzeWIJv+P2S582faaqyv
	xEMKke1ULUtXNq+oZP4JKRfQuJoWaCovGWRCXnZ8t47Focl9HEIiOpFl42L9tf
X-Received: by 2002:a05:6102:32d5:b0:633:84c1:7c83 with SMTP id ada2fe7eead31-67c805b4f3dmr11661250137.9.1779885904364;
        Wed, 27 May 2026 05:45:04 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961cc2b70e5sm3878574241.0.2026.05.27.05.45.03
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 05:45:03 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6314287380bso8588559137.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 05:45:03 -0700 (PDT)
X-Received: by 2002:a05:6102:5a89:b0:631:5ef5:8324 with SMTP id
 ada2fe7eead31-67c8d07131cmr12162490137.23.1779885903418; Wed, 27 May 2026
 05:45:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
 <20260525111920.15F771F000E9@smtp.kernel.org> <20260525-gaining-unaired-c96367a78c9b@spud>
In-Reply-To: <20260525-gaining-unaired-c96367a78c9b@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 14:44:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUeExOnKm1=kRSr0=HVJhgyLDBAK3VqTP-LK1q0-f9gA@mail.gmail.com>
X-Gm-Features: AVHnY4JCGT6L93dKt-0-T45Be15psMBpt17wMGNiRfpFy-lZ2xPXFXW2IFtgjsk
Message-ID: <CAMuHMdWUeExOnKm1=kRSr0=HVJhgyLDBAK3VqTP-LK1q0-f9gA@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: renesas: Add audio clock
 inputs for RZ/V2H family
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, 
	John Madieu <john.madieu.xa@bp.renesas.com>, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Mon, 25 May 2026 at 18:57, Conor Dooley <conor@kernel.org> wrote:
> On Mon, May 25, 2026 at 11:19:19AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Strict array ordering prevents the independent use of newly added optional clocks.
> > --
> >
> > commit 3723d06ba80fe72a3e7492af52e5e54aa0f36b03
> > Author: John Madieu <john.madieu.xa@bp.renesas.com>
> >
> > dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
> >
> > This commit updates the clock bindings for the RZ/V2H family SoCs to include
> > the optional external audio clock inputs AUDIO_CLKB and AUDIO_CLKC. The
> > AUDIO_CLKA input is fed internally and thus does not require a binding entry.
> >
> > > diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > @@ -26,16 +26,22 @@ properties:
> > >      maxItems: 1
> > >
> > >    clocks:
> > > +    minItems: 3
> > >      items:
> > >        - description: AUDIO_EXTAL clock input
> > >        - description: RTXIN clock input
> > >        - description: QEXTAL clock input
> > > +      - description: AUDIO_CLKB clock input
> > > +      - description: AUDIO_CLKC clock input
> > >
> > >    clock-names:
> > > +    minItems: 3
> > >      items:
> > >        - const: audio_extal
> > >        - const: rtxin
> > >        - const: qextal
> > > +      - const: audio_clkb
> > > +      - const: audio_clkc
> >
> > [Severity: Medium]
> > Will this strict array ordering prevent the independent use of the newly
> > added optional clocks?
> >
> > Because JSON schema validates arrays strictly by position based on the items
> > list, if a hardware board connects AUDIO_CLKC but does not connect AUDIO_CLKB,
> > the device tree node would provide an array of 4 clocks where the 4th name
> > is audio_clkc.
> >
> > When dt_binding_check evaluates this, won't it check the 4th element against
> > the schema's expectation of audio_clkb and fail, incorrectly rejecting a valid
> > hardware configuration?
> >
> > Should this use an anyOf block enumerating the valid permutations of optional
> > clocks to avoid forcing users to write incorrect device trees to pass
> > validation?
>
> Seems like a valid question to me. Can be solved by making the second
> last clock an enum.

Calling them optional may be a misnomer: these pins are present.
Typically we provide zero rate fixed clocks for such clocks in the
SoC .dtsi, to be filled in or replaced by the board .dts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
