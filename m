Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E2B37F8CB
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163789; cv=pass; b=GaN159g2RW/cjPUAJDlgd/xO2nYFZ02biEi28wCV+8q4m2RvGGduhbL4oM1jKo2ft/EmkXn5sEYQrT7UhpCoW6QvUK/xqQAtnEzjPmeCktscoMOyHrNxmQyUHWqVRuLWbqMZAkeeRxFOYY5S23LMv3vkZHmv32Gu83vgXZpZr+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163789; c=relaxed/simple;
	bh=EZ6N7WwUNzDpEf8ny3J1wHBY1ffRCSNErHzD1BJrUp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/MsMiW6hlKavL7SmBHSHbckG5HhTYbdLFL45N5Wpi5gATaviC6qd/1QtL4/2nV//q36YZBr98fOAPFAw8ZQLE8T9vc2DkUnSQ3LvUcpu7nNRIuo1ia1mZsW3MCh60A7Zy7Imaz7Slcl3j/BI8SHxyXyNeJWZk/xJJDwWNkfMsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnJOnb0V; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnJOnb0V"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-667971437d6so3193654d50.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 07:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785163786; cv=none;
        d=google.com; s=arc-20260327;
        b=UwPpQMpbZa8CzNkn82p3F4qE/sImS1Lia40h1xUENqB1rmWo2ndeIWmR2VLuMATRxs
         ZYw+d46az6WP202BcG6/HcSDtbgWCcYBOJmGvCNlfYQTs8wTucJc3Ng3J/d2R/RQD0EM
         Viepg9DoSTPB0V1Yz1h75LCwxXm0P8HxFKA/91w375+FWideUsHtFqCZivDEbmPjLO8M
         WDDtAVgiLWbnXF2ZjE4s/850OBm3JfkBZ1vLAPLd4FI8zAq7dvptk4o4Jp+V8nf5Rxga
         kk2o5TH3igLdBgn0I28HLT6qySdg3gtFUNwIl7h44/lsMxlWYjiGKXo3u0VAxQDDg4tS
         X7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kYEa2s2zvLJSrqj5at2d+sAEkPq5+tUouTZICeurIS0=;
        fh=xPpY1eJncIbZYzB1EwAwSnJKmF4AWv783JvkNJMI/QQ=;
        b=qXLdh9FHAjiglL0CODJ5PxBn23zCHqm6uZSi+kzqTWhHT4DS1hdzSTg/zkGgxZNWQL
         oOLYkbZgxkCoZlKSS+Pz3LtRS/+ovJBOPwz4M4FgKxBsukGwaLOYJd4cnrYBqf3PGQYb
         kj0hrObBgy6FSZZPoexRSHfnrIqaIZIEx2tUTJgs1s1Q2SogbtmVw+d9VWtioT5av9HH
         io+hOca66nVManRHGMUYE/i6gSwXU2rosAWviFbYNtNZcQUF2sr0RUaX3UEzme7P961z
         iFV2AU97XrbeqLLs9sEPN9VL/zX/dtJgIgL5zskwGzFXuygZb8C6gaeWIfbUsMjLnELb
         +IaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163786; x=1785768586; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kYEa2s2zvLJSrqj5at2d+sAEkPq5+tUouTZICeurIS0=;
        b=UnJOnb0VOWRwpjZBlc5BXte0J0LuneTkM9+6sp0Kw1+89ghxBnH9oRcNXruME5QPqX
         5MAr77fJpkSR38KGY7svLDj8Tsna8LRlRIT1Yi1XbfGClfXDs2ljvNbQY3Gr5Ba09xOm
         h9is737tGWzYZttCx8MSuc4Ge0HHnq9whx9cyR3lOPaVzSRWWjP4SN9uAL4mTTUWa0hL
         3Ybdn4beJOeR0QDVLRtG6yIlHJA9SZIEx0MF9xpZ6U9qfgnE9+7LIEoQHsVveP9bKr4q
         tvpJWwXVSJlbxjdKAbuvd3nlKHYpR35JBw3Sds/O31r0wdpmI1vg264Q41uELZ7EfjNU
         y23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163786; x=1785768586;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYEa2s2zvLJSrqj5at2d+sAEkPq5+tUouTZICeurIS0=;
        b=Ksa5HDmGf3H/BDwYGHK6Mb9oiiP65BuuoUVmoK2i45T/NTqmsxOu+W1fVNbkCOhjeB
         tbuKnddbxLV9URkazhh5d40GfozNSXJq+dVxkBsbfdYAiAQlhZudjnw1vkPbFEnLAIrb
         KVOd1pc51pP0153I6jZXk5+IsJ0Ofx1o/RH8AGSbyJ4XbVpDol4xVGPvFckPYDjkx58I
         YBwJDhYw03Jk4eXDnVmMjWmPSq3MGWc51KOyM6/g9gT6lnEd30lrYWlWNufn/8lc2U9N
         QDlTpuCZdqAomn+QLWlVYPWou9aBOdAzC3DPDAQU2Bv/8VyPl9SrxYjkrAffGxVcNDzu
         W/Hw==
X-Gm-Message-State: AOJu0Yzzvx6W9kIYS/WhAyslawOpMkaTQ3NFli9vbBKaa1zITYejqmYg
	K8ceBt7Q1tgpLIuXrALwsCaeKsyOKHsZ/eHdn5Io6O9XO/qyLeWOwJSt16vXB4zltkeqVI4OPUT
	OT+8KfQv3GiFA89EAX8T2P6610SiUPaf6hg==
X-Gm-Gg: AR+sD124bgkAVk78VgYXN8vS+PyhxTX1ELB/H3OA8b+/MFGu8t1ttvD7Ofa6nxpuWTz
	sLeUrtmBIeU/w2S5Ru7uFsgvXkFscbTagLk8aLUutQd+AnlTQ3lkeP3LAIlJzNQUVYYA6Ra7blR
	ukpqV8yfPkGZow/UngyLxNiDr4VSfRLXpBR0mYsmy88qupVgAOeHInHT5Z7lwVgs8vEZoBTMvSS
	j/3D3PpP6IY44Gn1HxjWCJxjOvAaXBAmn3bQuLjMiWS99QrM08rFcSA8GPv9OM=
X-Received: by 2002:a05:690e:140b:b0:666:2274:f9f5 with SMTP id
 956f58d0204a3-668c78dce2bmr2427658d50.37.1785163785046; Mon, 27 Jul 2026
 07:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708165929.2233934-1-tmaimon77@gmail.com> <20260708165929.2233934-4-tmaimon77@gmail.com>
 <20260708171530.F04951F000E9@smtp.kernel.org>
In-Reply-To: <20260708171530.F04951F000E9@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 27 Jul 2026 17:49:34 +0300
X-Gm-Features: AUfX_mximjZZDLW93j8ibsSrwKTowh1hhbqibaBu2LPs1RvNrBb_F3SNPEJGJJ8
Message-ID: <CAP6Zq1hFxLD_ajVs0oaWi0Qg_G9O7yi1d_2kV0LqFbS9wm1L7g@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: nuvoton: npcm845: Add peripheral nodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jul 2026 at 20:15, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Missing required DT aliases for the FIU nodes, which will cause =
the FIU SPI driver to fail to probe.
> - [Medium] The `fiu0`, `fiu1`, and `fiu3` SPI controller nodes are missin=
g the required `memory` register region.
> --
>
> --- Patch [3]: [PATCH v8 3/4] arm64: dts: nuvoton: npcm845: Add periphera=
l nodes ---
> commit 206c681ed8ed3430aac99224e79975aed3d5da1b
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> arm64: dts: nuvoton: npcm845: Add peripheral nodes
>
> Extend the NPCM845 SoC DTSI with the peripheral controller nodes needed
> by the evaluation board and downstream platforms.
>
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/=
arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
>
> [ ... ]
>
> > +             fiu0: spi@fb000000 {
>
> [Severity: High]
> Will the FIU SPI driver fail to probe due to missing device tree aliases?
>
> During driver initialization, spi-npcm-fiu.c calls
> of_alias_get_id(dev->of_node, "fiu") to determine the controller index.
> Since the fiu0, fiu1, fiu3, and fiux nodes do not have corresponding alia=
ses
> defined, this lookup will return a negative error code.
>
> This causes the driver to return -EINVAL and fail to probe. The
> nuvoton,npcm-fiu binding also mandates that all FIU controllers be
> represented in the aliases node.
>
> > +                     compatible =3D "nuvoton,npcm845-fiu";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0x0 0xfb000000 0x0 0x1000>;
> > +                     reg-names =3D "control";
>
Yes, and it is defined in the DTS file and explained in dt-binding.
> [Severity: Medium]
> Will this cause a fallback to slower indirect PIO reads?
Without setting the memory reg, the driver will use UMA commands to do
the read operation instead of direct reads.
>
> The fiu0, fiu1, and fiu3 SPI controller nodes omit the second 'memory'
> register region and its corresponding 'memory' reg-name.
>
> When the SPI controller probes, it looks up the memory region using:
> platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory")
>
> If it fails to find the memory resource, the driver sets desc->nodirmap =
=3D true
> which disables direct memory-mapped reads. The dt binding for nuvoton,npc=
m-fiu
> requires both 'control' and 'memory' regions to be specified.
>
> > +                     clocks =3D  <&clk NPCM8XX_CLK_SPI0>;
> > +                     status =3D "disabled";
> > +             };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708165929.22=
33934-1-tmaimon77@gmail.com?part=3D3

Thansk,

Tomer
