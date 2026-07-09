Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3426540B6F1
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592123; cv=none; b=JpSec/mLW7mWWNVKVNa8cuvpwgEYG0rUcdaQz/VCyb4oMxPy1/1f0QzNCzYiFOggaVHUAYhuszFilKm+07MjlANw/A+4LUq+KNyFFJC93cw3+vq2+93RnPHfC3+n+SpYcLB+nxETNXIJi08Ay3v7Gi3acmRQhTVNKwRhNfPqqeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592123; c=relaxed/simple;
	bh=+PFCG0w/MsJHNIa+KwCQFagbnO1XKLpWiSxrbAq4u0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGLkmpOSfM+IWowTANLVeuP2uWYipzbi9o+husE77ZECE2woKSEKWgoQBieV+gp7EbS7Q2Y5TBJjSO+yJnqMqg+2S2p/U1LZFTD83nD4qI4/DgkeuuPaHYXx5T01oUa+Q+2R+bkHRV4iW+v5MtlvvUjO2yr6tN5BMefe35AJ+l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-963f63fe025so521036241.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 03:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592119; x=1784196919;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=29Wr7PF0zfw9GDJijqoW4TX16ag4mbudBnzJuOzFV2o=;
        b=PNaSNrAOMvh7Wx6k1s3t+qEBd/Epm6Gl4LfBUOMJ2E1atT0wM4vIKVosoKnTfdH4Bi
         EMHjPFuwew+D8D1XEomKTFrgscfKP5Ncc3jj/EXDPn8ElitM/16ZAetZVpOhpvrVqPSA
         w6twFC8YdJ56D7QERh6jHfuGn/risF9+ExEtqsU4wNSwhbTm+SUFn06s6uZsthri5XrK
         /t3GC5QYiDD79s/R3bd2C6FVgw0oJhzwRrSt8NaYRZ78jO5kATpCzfefq1AEdUZrSmpK
         2VBnHsE0rjWYaiNWcWakOczNaGBnqqyU+Y5foDEtuyGKAYn8gbwnbQfQt0S9zaL4Y00k
         RC1w==
X-Gm-Message-State: AOJu0Yx2gAqfoBQOwmNwWN5vLeomvanO14FRyM76g7AtUIJ690+t9WOn
	2HEiMimC7ReiCTAB+LBC3fE7PqaeFZg0JCfx52MsdSek8Hj/4UEFjNfvwSmLmMOgDxs=
X-Gm-Gg: AfdE7cnD68IDXFRvQeLnbihIwbW+x4cLv8w3dV8KoZJaFyTzWj81vZjtwgtmItHjcuc
	KyImqPF2YIXRXV6S1KmZ5pIdE1SYPmUKmheuBhTiCiUvEAtPThhShPHLEcZwxUrByG2UULZnIwR
	EkFqKfcQ+7ezt/+eosVjX7v0qfSJyJcZ384JAcOg8Gtx2PHYIYRmCpc2p+PIS55O6SlaN3DtOWf
	cPfjSBMLWeqH1ZW/P20tPPI78LgCetc7e+T2mO6ZMy1m1D9Z90jpEUx9Os8e4L4IpwlvFpO3Ev7
	vZDX3IsH+RNGjrJS84Suvk1foFCrFdSlrP/I8oW20zVX6PQ1yK3HhI7YvFuQZbQ1sNxpiZsGIYM
	5UZ0j1ASrFOeWfpOdViQ3xKmLe7vEe7+2dC9OYHGqKy/Ln/F+oooSTbnShQOhBPh8JtBqiunzL1
	cqfhfbvRmjwQ+OlqpzmNLgeMqOZ+IoLZ+5dIkdlB0a5jUAAFnxVJXyuw==
X-Received: by 2002:a05:6102:5128:b0:728:f34d:f410 with SMTP id ada2fe7eead31-744dff69026mr3429093137.7.1783592118897;
        Thu, 09 Jul 2026 03:15:18 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6dea737sm3255031137.9.2026.07.09.03.15.16
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:15:18 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bddd789ae4so519345e0c.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 03:15:16 -0700 (PDT)
X-Received: by 2002:a05:6122:4fa2:b0:5bf:6d56:85e5 with SMTP id
 71dfb90a1353d-5bf75e9a99amr3435653e0c.12.1783592116295; Thu, 09 Jul 2026
 03:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <dca2c4940ba38b897f04b6fb67591de9835900e1.1783505142.git.geert+renesas@glider.be>
 <20260708104726.052F21F00A3A@smtp.kernel.org>
In-Reply-To: <20260708104726.052F21F00A3A@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 12:15:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUwsGfZ8QX+qDTTWE7r29qrM7+uRU9Ur0uNL28ONkACQ@mail.gmail.com>
X-Gm-Features: AUfX_mxmVKl5oIraABhC5nL6N7ouZpLugoAmbQe59QVRHQ1H670N0ohp9eewiP0
Message-ID: <CAMuHMdUUwsGfZ8QX+qDTTWE7r29qrM7+uRU9Ur0uNL28ONkACQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Wed, 8 Jul 2026 at 12:47, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Hardware mapping mismatch between MDLC driver and DT causes probe failure for hscif0.
> --
>
> --- Patch [6]: [PATCH v2 6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes ---
> commit f3c8aa0f294cd575595329194a9adf5e14b5f350
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> arm64: dts: renesas: r8a78000: Add MDLC nodes
>
> This patch adds device nodes for the Module Control (MDLC) blocks on the
> R-Car X5H (R8A78000) SoC. It also links all (H)SCIF serial ports to an MDLC
> for power domains and resets to complete their hardware description.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> > index e22e307ce31fb..6ca1b1e95aef2 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> [ ... ]
> > @@ -886,6 +895,8 @@ hscif0: serial@c0710000 {

You are hallucinating, as this line is not present in my patch.

> >                                <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
> >                                <&scif_clk>;
> >                       clock-names = "fck", "brg_int", "scif_clk";
> > +                     power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x41>;
>
> [Severity: Medium]
> Is this the correct ID for hscif0?
>
> The r8a78000-mdlc driver introduced earlier in this series restricts power
> domain attachment to module IDs in its allowlist.
>
> The driver specifically defines ID 0x54 as HSCIF0.
>
> Since 0x41 is not mapped to hscif0 in the driver's allowlist, will
> r8a78000_mdlc_attach_dev() return -ENOENT and permanently prevent hscif0 from
> successfully probing?
>
> > +                     resets = <&mdlc_perw 0x41>;
> >                       status = "disabled";
> >               };
> [ ... ]
> > @@ -922,6 +937,8 @@ hscif3: serial@c071c000 {
> >                                <&cpg R8A78000_CPG_SGASYNCD4_PERW_BUS>,
> >                                <&scif_clk>;
> >                       clock-names = "fck", "brg_int", "scif_clk";
> > +                     power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x54>;

You are hallucinating, as this line is not added in this hunk.

>
> [Severity: Medium]
> Will this conflict with the MDLC driver?
>
> The driver explicitly maps ID 0x54 to HSCIF0, but here it is being assigned to
> hscif3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
