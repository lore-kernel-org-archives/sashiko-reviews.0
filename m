Received: from mail-ua2-f29.google.com (mail-ua2-f29.google.com [74.125.226.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390415427E6
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083926; cv=none; b=ClkZhbSadr7QyZnj7SM3UTC5ofXTWRd5kOMAPRXJ3XQ6BUaxOocKZKaumtz1a1LGE8lgRA8eHQsZSgBYAuCpmGfLamkZRu+tilhdaxZIECWAzuumxyYJpWU8A6ZR3FI/dpbhhC/U7ayndCc7yDAPdbjdxO3iRnSkSAv1DIlsEOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083926; c=relaxed/simple;
	bh=iS6Sbq7phRSuvgshKwGXzSbujQVRKwmv/HJLCWh9o6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTT7tgCRPPQYdHhxH1zr8hx2CxQaA9lICYaUN8KTmou/auRkEweAyk8lkpixUgOjouWmI6ulbKYKGq5DP2mZ4boPidQC6YZcaAtYH+ATD7vwDZlouAL7nKHsUQhzEruhtHCX7iR2Ze1RUz3QL/8w3mU7/rXK+MMJXtfiAUI2DtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f29.google.com with SMTP id a1e0cc1a2514c-97e80579b7dso1065469241.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 06:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083924; x=1790688724;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R4LKdQGgXfe+lTIR3Je35jxvfwNB9zyWtKPq1NgyaMA=;
        b=Wa895/KursW3T1yKTercX2dnS93ScXSsXcL0VAYh22mmkOGDL8YhFnB3FozbkXff1c
         GJZyScxBxoTwO72Rher82johjWPEYSQ1NooR0OwqqHYMJxoNA+AjTzTiznR4gdavl7f6
         4Um3WPTBMZFRGKo2DiTaJt/t+YriFpmsp6Npaqpzg5Kns44612l+Ee+BZVPTrfjIZLMz
         piqX2J6L6fjAGrkZqL3DSti655icZZ2bQQ6q/pHow/OVSZachNTfL/MqHyWNqrLRJhPx
         NBS8yqyW2fW32CSUhFqUfiR5b6/7Pmi6bf9h1zey0oTYnx5sH72D1CW85fdyfGHUZe4F
         1JIA==
X-Gm-Message-State: AFuF++ndGoKZVCnAb5d/23QjAYVqGDXDwUcKQomciWeIIC7swC3DrKpJ
	B22ffaPu8yCUz4ul43ukIvjXPQzYs6cJnGxb1t+9FXrbce15hD9pWyuWJPEKbwoG
X-Gm-Gg: AYBFou1832KWetI1C3PVmeMBd8BxV+YpUWrdSjQ8+V1/PVbkEQT38rVM9mJ+3aNY1/O
	cO125rQMDuqW0tb5lltLo+aK3T1SjzZyy6yy44MMMOpsrqFfXIxpoJeS3DEaBXaH1MIXyToVogu
	1lyY4dFwJcj/hY86MPT8dG3wcpVl1lfSqW10kkc7bbkjNTLNXYC1YggvAHh6sLrKyEAqYAB/H4R
	iAjIhwUpKhI2f0GuA38jLn2ZYT06uECYU9TR9kmaWs8vCGrcnPQmT35JfeE0xqPFhSn2RAHl2Kl
	faCN2GICHtYZ5f+jzCvxhN6tMd8N113etC6Jr38xs+B6dyUul7Wx43OYS8ay+rbSgc73OjtkNPO
	B/YgPI0WqcOJZwmE9VZjy6NcEcPMizXfjqpWqtGrNTl04o8W+N7IpB1WJJicYiQyhLNk4MUjhY/
	1USxLFkI4utFBVkFPmWLFcMwqmUyO44ikCgHMv3GNuio7r8HqGYArNsgJheUiwPcld7XaFsvAeX
	Z2rfeVIcOknNKk1GnGlwzpAcG2/6AXnCcFj7A==
X-Received: by 2002:a05:6102:6b0a:b0:7a8:10eb:96c4 with SMTP id ada2fe7eead31-7a810fb1f76mr4577698137.20.1790083923606;
        Tue, 22 Sep 2026 06:32:03 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ab18445382sm1664682137.11.2026.09.22.06.32.02
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:32:03 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bc5bfso1127735241.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 06:32:02 -0700 (PDT)
X-Received: by 2002:a05:6122:3a11:b0:5c0:fb8d:9993 with SMTP id
 71dfb90a1353d-5c9b57c2f3bmr7657142e0c.0.1790083922259; Tue, 22 Sep 2026
 06:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
 <d281677b5759f15ced1f59fdcb3eb7ca29c72dd5.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
 <20260921223719.AC3461F000FF@smtp.kernel.org>
In-Reply-To: <20260921223719.AC3461F000FF@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 15:31:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMyiAOoM0+yPcLSDfCK0Tmc0BPuFMRWtx6WksD-hOWzg@mail.gmail.com>
X-Gm-Features: AclHuK8wr23u5s6F_LimoHdaP0JgwEMD9d1LVjGabmZG0qWBewBESA1wm5F7tIc
Message-ID: <CAMuHMdWMyiAOoM0+yPcLSDfCK0Tmc0BPuFMRWtx6WksD-hOWzg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: renesas: r9a09g047: Add USB2.0 support
To: sashiko-reviews@lists.linux.dev
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, wsa+renesas@sang-engineering.com, 
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Tue, 22 Sept 2026 at 00:47, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dts: nodes not sorted by unit address
> --
>
> commit db8934356239e961e6360c8c46e87d977245ad6d
> Author: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>
> arm64: dts: renesas: r9a09g047: Add USB2.0 support
>
> The Renesas RZ/G3E (R9A09G047) SoC supports one channel with OTG/DRD and one
> channel with host interface. This commit adds the EHCI, OHCI, USB2.0 PHY,
> and reset control nodes for USB2.0 channels in the R9A09G047 SoC DTSI.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> > index 72120e2abf8b4..56ceedfb8ae88 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> > @@ -1773,6 +1773,130 @@ usb3_phy: usb-phy@15870000 {
> >                       status = "disabled";
> >               };
> >
> > +             ohci0: usb@15800000 {
>
> [Severity: Low]
> This isn't a bug, but should the newly added nodes be sorted by unit address?
> The ohci0 node at address 15800000 is being placed after the existing usb3_phy
> node at 15870000.

Yes, that is indeed the wrong location.

>
> > +                     compatible = "generic-ohci";
> > +                     reg = <0 0x15800000 0 0x100>;
>
> [ ... ]
>
> > +             ohci1: usb@15810000 {
> > +                     compatible = "generic-ohci";
> > +                     reg = <0 0x15810000 0 0x100>;
>
> [ ... ]
>
> > +                     power-domains = <&cpg>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             ehci0: usb@15800100 {
>
> [Severity: Low]
> Similarly, should ehci0 at address 15800100 be placed before ohci1 at 15810000
> to maintain unit address sorting among the newly added nodes?

No. Nodes should be sorted by unit address, but nodes of the same type
should be grouped together.

>
> > +                     compatible = "generic-ehci";
> > +                     reg = <0 0x15800100 0 0x100>;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
