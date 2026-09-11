Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8493A7584
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128536; cv=pass; b=XNAUpTSvi34iW90cinpKVWfbLsfa/E5n8j6/5aKeYteD8jIpkTKPmpYY7KPGbZRY0Hj0TFdTZd6JxHmIl/VD0gT9AGkZz/a+mJ6yZz87sB6lgCMitvCFuwh+hbIytiNkLlZNTpxxa2zJ84qRvETTEDKZQmQQb5Gli/6mN0PyWj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128536; c=relaxed/simple;
	bh=Wmo70Z4UFocZYeFKwLQnXi18nLpqHlJJiS4uZANg4Tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+Uz37iruSuIILgK8UM34lXz1/tW0wP/mOt7FCIKyoRF3bKJX1dyqup7PujPyLF52c8Q3w59aCy+ZNLZ6QAF+KiM8PS1MazE8ljbQ9FTDI9JowEaQnonddwXqlUpTKyD7mNJhZp8qBpRpTahjj56+hyRuFuaOHx4WRDUBYVnng8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mw+29TCs; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mw+29TCs"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so500899f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 05:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789128532; cv=none;
        d=google.com; s=arc-20260327;
        b=gSXW3supcJuLys2LnjQGHxsefHpqk0/A35hOzHAsSNE9Ykk9aIEIjYquPmIAU8WcgS
         S9DWQE7u1SpBeuO9lIbATT5SmcPCMAzmx/ZDKO/q7cOv9P9wyCF9r+CFFv/njHDyS+L5
         ROFDgWZzYEPQNFnFfku7ySfjzmS/3+R+NYrW6RlpgTqyaeOQnOybodDXrOqhuKa/lwgp
         UaPqoc/QoNpVwstPmsaUJ2f/y2ywow9ZAnHUIaJeEVtDPY6IDoyRfcY3sbXqqj98B8jP
         sA6dJXsb5GYax3nNcBg3945osONxQPQYn/W1aAgMiIry2NYWh94JGqvVDjar3Dsts2Q1
         WQpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BPsynQVkg6+ImOI5Ts+zsO7EhceaQ1Rk9XjAnwab6s0=;
        fh=MEz31uze381REuNMS6q2UVxkiPcbsdTMJxIorZ5SI4Q=;
        b=nzuV353Hk6CPSfjrSDZiYYw+J0eyIysl7j3o9WBTcq8oEB0up3xlUPFuqR9/icD3WL
         DvMjbUrJSdrnNu+pDbmdcE82XoDnXKXL0DfJOQwGleaUF5wINsLCBYGT39n8W7/KUME5
         wcVgsjUwyYE1biYMSz9sxklXtgMA7pBfu6IVv/XKPizJiPvb1XLCFZPvv41RsIw3GqLQ
         E7Kp/gpwVI/guYwibkPKMCra/WKpy203jPOVkf98TybrlE7IcuTEqEvWRbZEZiHGPJl5
         0n/3t96nRq3UyJchSyVY4zqUi0mDlqlkigoj3cTnI3jzjZy9DLy7+ySdtC5QFsbcjeaT
         J7ZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789128532; x=1789733332; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BPsynQVkg6+ImOI5Ts+zsO7EhceaQ1Rk9XjAnwab6s0=;
        b=Mw+29TCsIC7QJ8NP0C4dkk+VlAN80md6ODtCFv9JcWoiLN9nfjTWSeIZMEhU6SmARV
         +2lh10AHU0FJarIdWiToFmyJV4q+559yRYYU7HsS5dDSMLNwOIxS5Fn61yVO/qM4XdbG
         YkKB/kBuP2QT22I8Qmv4LEd53bjytvDtRSGIbFSJ4PkUfJOcnHkpaPeYhZfdhRjXJ51C
         faCDE4DzbomPG7wElUYSAk7jIc6BRZcix7sYNye57wNO0IbgQdDQSQw+kxcWGY8upqgn
         dmj1C+LYiwb9269b0ZU9RY6CVsaCWv6xxbgtH+1bRoB1yptcVIxH2ZAb/6NnoiuRBcls
         CIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128532; x=1789733332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPsynQVkg6+ImOI5Ts+zsO7EhceaQ1Rk9XjAnwab6s0=;
        b=gE5QR/icRWeIFuDr0fa7SVk9bYnbMyv4U7saEJMpnRiV4d9Sbv+kaZMNIgocLApVnv
         gZupKMfEDU5dyTxGhZhAFurJ1R4lnUrzVCc7x9+QBxqhYeK5GFNhHkm9Lo8i6gGYwldp
         9wSNmHRuaW2NpLcGn+xLn1Q8bIrvmrQ6dcTZkZ/5u4jqrAlq8GZ5zWbugOWpu6cyiuCy
         XuzxPCPOIX2K47BKAl7yCXRB9hHnkhk/obMq4V/ip/O5M11EQ2vBo0rC6a+uXC5noWZV
         5/aV02wh2k2zAy8cvdv7tZPN17SgR3A1jQfj9mBXXnG8WTYe3ZHtQZpREcSOzAJqQTuF
         6VQg==
X-Gm-Message-State: AFuF++kVnMps6HZtBOErytTbtmXXyw5Emn1yEojdlsvNx7MaFc1mL5F8
	rTnxKFDBc/lGdnZ7yz7CUD103TPxrI+Tvg/4yc2o8Mvep4YdPoyRhelY/cuNHjkpp2jZFEHjz6U
	sNs8PzCATnH5+jnHnjLdGwTzPiJVrYESFWLXRQzPp3A==
X-Gm-Gg: AYBFou2Wi8OUdRPLuz9hmXLKov2lWkCnT6Nj3tHc5j20zgfqs/+sIf/rDjdBiX6eIII
	sOtWoxZ6hAcR3R9GdQjNGQfztDY96Zn9Ux90EV2tNa2OIFmGgjWBWjjhEbN/CZfZYODMqs6UtHx
	p8fVOI+u3F6sLp6qcUmQSPvkbPFE/Wf3vGeXiEpvQrh1hKL/sfbVCySOuBo5wEmAeMY1G/kzzjQ
	TYYBj1HdapYVge74XU3YoOc17jP5AzRo5F1oPz7OstyufqGja9QO+3aQbXSvhC7Sy9/2KeglSPV
	HQQ0cfS7uwLdjvUpmPIQ0HdZ3hr9mNJVL/oPSButXpBtHb2GzpAsPUkjTqeDCNBwqx+Cui3AAn5
	F9a4DgYABuBqq8gIzjZ73n9g6kv9rvHE26ocHDiEYdi35vY2qkGZol2nS6pfJOMVNsh0jDDqQCQ
	==
X-Received: by 2002:a5d:64ea:0:b0:486:e91d:9f99 with SMTP id
 ffacd0b85a97d-486eb2e40c3mr8765403f8f.10.1789128532269; Fri, 11 Sep 2026
 05:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260911111731.3404308-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260911113216.3810F1F00893@smtp.kernel.org>
In-Reply-To: <20260911113216.3810F1F00893@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Sep 2026 13:08:25 +0100
X-Gm-Features: AcwNN1WzhLhKvgeum0uiJ1v9nMlDLxD4oK7UJnbzkS0PJFF9qRryrARMqpujyiM
Message-ID: <CA+V-a8tHoShO+NXrsYaOvW3C68khLY=+S8xpyKRjOvo757LO2A@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] arm64: dts: renesas: r9a09g077: Use CPG/MSSR
 syscon for WDTDCR access
To: sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Fri, Sep 11, 2026 at 12:32=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The transition to using a syscon regmap for WDTDCR access is bro=
ken, preventing the watchdog from probing and containing an out-of-bounds r=
egmap access flaw.
> --
>
> commit 0e87a2089f722e3ac7bcab46cff76d445536d9fd
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR a=
ccess
>
> This patch replaces the direct mapping of individual WDTDCR registers for
> watchdogs wdt0-wdt5 with a new "renesas,sysc" phandle property pointing
> to the CPG/MSSR block. The watchdog driver is expected to use a unified
> syscon regmap interface for these accesses.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a09g077.dtsi
> > index 40494159831d8..ad5189d55cef2 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > @@ -327,61 +327,61 @@ channel1 {
> >
> >               wdt0: watchdog@80082000 {
> >                       compatible =3D "renesas,r9a09g077-wdt";
> > -                     reg =3D <0 0x80082000 0 0x400>,
> > -                           <0 0x81295100 0 0x04>;
> > +                     reg =3D <0 0x80082000 0 0x400>;
> >                       clocks =3D <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
> >                       clock-names =3D "pclk";
> >                       power-domains =3D <&cpg>;
> > +                     renesas,sysc =3D <&cpg 0>;
>
> [Severity: High]
> Does this node successfully acquire a syscon regmap from the cpg node?
>
> The cpg node lacks the "syscon" compatible string in its definition:
>
>                 cpg: clock-controller@80280000 {
>                         compatible =3D "renesas,r9a09g077-cpg-mssr";
>                         reg =3D <0 0x80280000 0 0x10000>,
>                               <0 0x81280000 0 0x10000>;
>                         ...
>                 };
>
> Without the "syscon" compatible string, syscon_node_to_regmap() will retu=
rn
> -EPROBE_DEFER indefinitely, preventing the watchdog driver from probing.
>
> Furthermore, will the generic syscon regmap allow access to the WDTDCR
> registers in the second memory region?
>
> The generic syscon framework only maps the first reg resource region, whi=
ch
> the cpg node defines as 0x10000 bytes. The watchdog driver calculates a
> WDTDCR offset of 0x15100 via:
>
> drivers/watchdog/rzv2h_wdt.c:RZT2H_SYS_BLOCK1()
> #define RZT2H_SYS_BLOCK1(n)     (BIT(16) | (0x5100 + (n) * 4))
>
> This offset exceeds the max_register limit (0xFFFC) of the generic syscon
> regmap. When rzt2h_wdt_wdtdcr_count_stop() passes this offset to
> regmap_set_bits(), the regmap core will reject the write with -EINVAL.
>
The syscon is registered in the CPG driver and the issue reported is a
false positive.

Cheers,
Prabhakar
