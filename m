Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5CB37FF62
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896727; cv=none; b=glNAyKjH9CVO5BWACEQ9lyc4HYSSy8kP+mV4zHossTRsTQguWD3bHwQDjr80dFx1ByQ8sp5vLmqxkmWQ921l8TYrgPg982L6uK4Uvg1V0xxOq8r6OsGKGuLxsM++ofFiuxZF8/5lnaG0f0pRnszh/hWe8pHI4JvUnEF6nJ89Zb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896727; c=relaxed/simple;
	bh=64AjsCM32ow8eV6+udUpdB2v5Y+cSGnnihxYiV2n9E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNhdt61Fy49NYJVKcYKXVQx1/DDfGWmR/tSrs/oAOT0ngvEbI2u0QwMtpRKgQmU+oVfGVJhCf7IrnUh3phPX564QBDLF87n4c34TLhX1Wch9bqXyhvfTVC6RZNQlufKN2a+yVmqVnC7uIFJCjCykosmU1EU15r0JKZcySSHkLSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-575124e716fso4139213e0c.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 08:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896725; x=1780501525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfOoR/aqXQDsThFuP1OYYuQj5JnMHoQiHq+9j/hSjtk=;
        b=fUEEmUdouKjLEf6Ds5OOlThAxOkDY9+IoBC1uUpMIU1h9Hc908yOH6n+L/9s3SJA0R
         MBcWJjI2BHIfvId5OiKXGgtzuiFZITaQhEwb5rudauwh05d3amLkSaCbTi+hb3NYW1SF
         iHq/Rman7XyVCyKowYEvCSYrw7shM9kNdiItWhO3K/SFVyVEXYshe4uGCAJztLps4DgY
         VK/79sC4MPooClsY1/qlbRwqtk52ImY3bmdpqJZN/c+n5cWVxXgBSrP2IN4JHF06e6kP
         N9pc58bEB59ogc/4K5kr8pJGYAlUNjo16Fv7PCHP3vwl8G6fJb5aptOCBMd9D8k9rs2n
         8ARw==
X-Gm-Message-State: AOJu0Yxe8ugBUeutbCAkoMTLxzl2WddvqyNh/GFX9fGlQaU+tKjLjyYO
	SiEJ7+dI04bFpog3e+1yqkCCR33GXQGRI3KD8uB0PgJUxlWgp0sTdpwQGJYBAkucAbM=
X-Gm-Gg: Acq92OFHTTRgVMnqHzFj+qjNf5PTvn/USFjo1n+lFlKszShijXpkzExg2ieXbzqpnV1
	etL2uSvD0/fS09/ZxXC3+IqkjxACyQZF4reO3SNnhG6xuVPM/llGmmg/hXTmNWgOlhpUtW5e2ez
	57QxBHDjnSIs1NS1Mm2cdn6j7Iv5bgk7txzlgAX4LLR3ooZxDtkTkwz9EczcB8e2diXbfMosp9b
	Gajqlyn4Wxj7Mw4XhTldnihqHnKwWv3eM31dgSxZoQzs9dwJsaCj4j53dDjbe7852m2WV6RAku4
	3KlZMghIueJd2KeHU8/DnEKppIh2GLz+nKQK2olYKNaWUdp628ZOs21oVF9gvgUvvhidzjdDIzV
	FuRvx7yUgoYplhZUHMZLBAXQrmeqYSC6DD0DbmfYY37oZvXBI4Yt3+a9BvkYvHvtoWwrVW9sNbK
	Z6mKXa9rAXdAYHxDtOrmTPdWiuLbQC/s82jbS9WWsis7o2FAcqpoeu6yMmqrCU
X-Received: by 2002:a05:6122:3482:b0:56f:1ea2:8609 with SMTP id 71dfb90a1353d-5865e4a448emr12198654e0c.3.1779896725022;
        Wed, 27 May 2026 08:45:25 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f3c003ffsm20787406e0c.8.2026.05.27.08.45.24
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:45:24 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-963849a4611so181477241.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 08:45:24 -0700 (PDT)
X-Received: by 2002:a05:6102:6a88:b0:6a2:b2a1:f16a with SMTP id
 ada2fe7eead31-6a2b2eee043mr2865434137.2.1779896724115; Wed, 27 May 2026
 08:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
 <20260525111920.15F771F000E9@smtp.kernel.org> <20260525-gaining-unaired-c96367a78c9b@spud>
 <CAMuHMdWUeExOnKm1=kRSr0=HVJhgyLDBAK3VqTP-LK1q0-f9gA@mail.gmail.com> <20260527-prankish-causing-4139d0dd0b51@spud>
In-Reply-To: <20260527-prankish-causing-4139d0dd0b51@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 17:45:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtLorK+Hjc-ZWCAn273ZN6yUEdyjxpJ5ynZ09sWqcBdg@mail.gmail.com>
X-Gm-Features: AVHnY4JYQCCMZ23A5R3RVcLGsHx5LrnGPL_lIUR8tDNP9RgCHgiKXFedQjj7oJw
Message-ID: <CAMuHMdVtLorK+Hjc-ZWCAn273ZN6yUEdyjxpJ5ynZ09sWqcBdg@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: renesas: Add audio clock
 inputs for RZ/V2H family
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, 
	John Madieu <john.madieu.xa@bp.renesas.com>, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Wed, 27 May 2026 at 16:54, Conor Dooley <conor@kernel.org> wrote:
> On Wed, May 27, 2026 at 02:44:51PM +0200, Geert Uytterhoeven wrote:
> > On Mon, 25 May 2026 at 18:57, Conor Dooley <conor@kernel.org> wrote:
> > > On Mon, May 25, 2026 at 11:19:19AM +0000, sashiko-bot@kernel.org wrote:
> > > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > > - [Medium] Strict array ordering prevents the independent use of newly added optional clocks.
> > > > --
> > > >
> > > > commit 3723d06ba80fe72a3e7492af52e5e54aa0f36b03
> > > > Author: John Madieu <john.madieu.xa@bp.renesas.com>
> > > >
> > > > dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
> > > >
> > > > This commit updates the clock bindings for the RZ/V2H family SoCs to include
> > > > the optional external audio clock inputs AUDIO_CLKB and AUDIO_CLKC. The
> > > > AUDIO_CLKA input is fed internally and thus does not require a binding entry.
> > > >
> > > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > > > --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > > > +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > > > @@ -26,16 +26,22 @@ properties:
> > > > >      maxItems: 1
> > > > >
> > > > >    clocks:
> > > > > +    minItems: 3
> > > > >      items:
> > > > >        - description: AUDIO_EXTAL clock input
> > > > >        - description: RTXIN clock input
> > > > >        - description: QEXTAL clock input
> > > > > +      - description: AUDIO_CLKB clock input
> > > > > +      - description: AUDIO_CLKC clock input
> > > > >
> > > > >    clock-names:
> > > > > +    minItems: 3
> > > > >      items:
> > > > >        - const: audio_extal
> > > > >        - const: rtxin
> > > > >        - const: qextal
> > > > > +      - const: audio_clkb
> > > > > +      - const: audio_clkc
> > > >
> > > > [Severity: Medium]
> > > > Will this strict array ordering prevent the independent use of the newly
> > > > added optional clocks?
> > > >
> > > > Because JSON schema validates arrays strictly by position based on the items
> > > > list, if a hardware board connects AUDIO_CLKC but does not connect AUDIO_CLKB,
> > > > the device tree node would provide an array of 4 clocks where the 4th name
> > > > is audio_clkc.
> > > >
> > > > When dt_binding_check evaluates this, won't it check the 4th element against
> > > > the schema's expectation of audio_clkb and fail, incorrectly rejecting a valid
> > > > hardware configuration?
> > > >
> > > > Should this use an anyOf block enumerating the valid permutations of optional
> > > > clocks to avoid forcing users to write incorrect device trees to pass
> > > > validation?
> > >
> > > Seems like a valid question to me. Can be solved by making the second
> > > last clock an enum.
> >
> > Calling them optional may be a misnomer: these pins are present.
> > Typically we provide zero rate fixed clocks for such clocks in the
> > SoC .dtsi, to be filled in or replaced by the board .dts.
>
> IOW, either both clocks will be provided or none will be?

Exactly, see the first hunk of "[PATCH v4 3/8] arm64: dts: renesas:
rzv2h: Add audio clock inputs" later in this series.
https://lore.kernel.org/20260525110603.4018170-4-john.madieu.xa@bp.renesas.com


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
