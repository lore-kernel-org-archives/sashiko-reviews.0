Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F423D3008
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171306; cv=none; b=nDKkf9zNbw73nfYvyHIr62EBFke7XTBXpm8szF9LxtkrNYvTwqaI7KMAplctO5B7mxQOqdn1KlizQ/O4sXg+iMdeIO5Ss9GsVNAW//OdTQ3GGzkEJyaEw/TBGlI7RGUBK3f2AQP+z1V2sJsN49Yu8YUIkQ1rHaTF0UICpLy2YRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171306; c=relaxed/simple;
	bh=YT9wUVhW0s51vPl9ozRJX5g/Ld0RunnUWVRJcAsZA0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mN31AC7EKgLd5a6m3Lvn/FGzPuxZ/o3Jfw5K55JvEPjO+ncC92GnY46S1HLgb+NteTL/cOIIXJc7QG5g6j4WsgoEdgXpVdXbQtZCwsQBFmZ+jiUYWjfl45aNxAa0FPx+6WEZhC+RCrsiZhy17R9abbapL1k2vhTk+OIkJ/wXL/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-745497ac8fcso591856137.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 03:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171303; x=1788776103;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZTsWwYa5UrzyhFWaJ4pYb5oOhsLOCuomvKfycjwVEMA=;
        b=H28WCMtsmjzAy/bM1CF8AmMOjwPygjaerKauKwh/tBEy17DJ2Y/QInxtqXlLKX/Fh5
         UgnFFT6FH+LvC1AoYbyiiAWHvMwAnetSM4wVJg3EDtnnEFSUj9c9rmaRPlMKbzMm33wq
         ZcoXaZ6aSilx7gxyymoZnD/HYhWUuy3Imelerkylpczzd6+MfqhgCLlgGWglj0VQpz3e
         qDShP+cz7p84nDh1zQnBLNB58DXXV5KkfhA7/uDMQqWsHSJ9aeRnlpUYgGy67wUeA9xW
         FNA6tf+YP9i0ec1Knz39fSsyehhral/Eoro8FsQZ8F7DKkSe07cBhuz0ggxZcj77klRd
         BrWQ==
X-Gm-Message-State: AFuF++kFZenhDEEQ79lVzvHGBE2HmsQmAuUq2dCi7VnCjBvYQGJ0i6qz
	P3iZBdurchkzw+04wOBRtxXpDZ7po7I3e5WELTXK3TN3DYOWgc+CCqaM8TUfY3JN
X-Gm-Gg: AR+sD12WHykhQ67gXupcuF0QqJN2iDOOekt+sgS1Hiy96jvjQsfQSUi2HuqIL+N/tIT
	K4cOzlCOQ70P2WeUDIVB2xXu1e9jE9XI8mouqJQBRiVgj8IwNXOsv4W5yDbyPOirYsMkBFdNjEK
	TgwnS/sFblauIHicODflfEp7sG71qkHLnip3BdzD71MkzGYJJBOXgHrtSTMoXBVlD6hdQxqNsGD
	SOIMfeAarQBSxse499Tw8ys1Ak2xDgidICdyReFDlsLliJsTFV9KJUpz/SXnNKByWUsrGngu9FC
	J10KUR+Hb5EskZFM+ZuH7I0Hxz6O9vrlPKWeoDM+/bz+6YxgxaDEqvGAQwrsyct9q6dxn52LF/O
	PCQ9dTaoZGAPQMPOjb2QlA1T+AZQzOAMz5qKCXjeQvnDvCsjDvHlNAi4Oh79h42JGRO0UmtHC8L
	dArmldaUL14svZGK4007Qk+4jKd/JPJNwpF0ps0b+DcPLvsJKZRKqWVy9O85AMRtYdsORioaY7B
	QHX0ssXczBoSXo6baXnf6tnPA==
X-Received: by 2002:a05:6102:a50:b0:77e:6f90:4aad with SMTP id ada2fe7eead31-785962b2f0fmr7477657137.2.1788171303339;
        Mon, 31 Aug 2026 03:15:03 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97e84c0e3e4sm7392273241.12.2026.08.31.03.15.02
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 03:15:02 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-96723c7151eso868282241.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 03:15:02 -0700 (PDT)
X-Received: by 2002:a05:6102:1589:b0:779:5049:87b2 with SMTP id
 ada2fe7eead31-78593425ac4mr7888488137.0.1788171302452; Mon, 31 Aug 2026
 03:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260824080816.2356E1F000E9@smtp.kernel.org>
In-Reply-To: <20260824080816.2356E1F000E9@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Aug 2026 12:14:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmRMT_cDoDryYyE-3dXZ=sVrP0a1Sad6H3uLfYgx-erg@mail.gmail.com>
X-Gm-Features: AcwNN1X9aQcdw_rxFA2HYxMXnMlsNtXNFy0xLoTIZO4PfOkLwNdTmP2WF8AsNEk
Message-ID: <CAMuHMdWmRMT_cDoDryYyE-3dXZ=sVrP0a1Sad6H3uLfYgx-erg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support
To: sashiko-reviews@lists.linux.dev
Cc: Prabhakar <prabhakar.csengg@gmail.com>, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Wed, 26 Aug 2026 at 06:05, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The `rtc0` alias is inserted out of alphabetical order.
> --
>
> --- Patch [3]: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support ---
> commit 4c031325b18a88190b2540d40329c1e40cc8033e
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support
>
> Enable RTC support on RZ/T2H and RZ/N2H EVKs.
>
> > diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > index e86e6d3aa8a34..add0718f98dcd 100644
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > @@ -21,6 +21,7 @@ aliases {
> >               mmc0 = &sdhi0;
> >               mmc1 = &sdhi1;
> >               serial0 = &sci0;
> > +             rtc0 = &rtc0;
>
> [Severity: Low]
> This isn't a bug, but should the rtc0 alias be placed before serial0 to
> maintain strict alphabetical ordering in the aliases node?

Thanks, fixing up while applying.

> >               spi0 = &xspi0;
> >               spi1 = &xspi1;
> >       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
