Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E08143B3F9
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128617; cv=pass; b=QPwHF6fBlwLZXFogJZkwm0pMa4HjGGN5kRUzckozRFBAMBC+nYP/vbTp78fMwCsXeFyt62WPJdYqSsVx7Iu6T9Q5lO0lji9n1qasRdUzH3BY/is2JrVTyfK1nhDZDYT1V7QULs1RwzRJJknqQ0CDWmjE1FaxB5meq2GWyB2ne9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128617; c=relaxed/simple;
	bh=s2doigL40MavgJYYi+6feoNcgx2hlI7yC6v15ZMkMkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+zir7+MXVnA30rdvXckyN+VblS0+FrYTL+LSyYv29UKgo0Cet17YdkMVdJfSQF735VHcXtZa4+ZaUzDKCPWo7GwsoavUFoiDi0iaCKULsuWUSS9j/hpSp0yslfReOty+SID989TPRiqJpdeh4fuou196CMCaSFF1u21fSKmJF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqGao8aE; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqGao8aE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso12813245e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 05:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789128614; cv=none;
        d=google.com; s=arc-20260327;
        b=lX7qnviC8nsuMpQzm/l5PtpNTee+BqxQx/1Avfds5Yblu1LzUYF7F/PC19oZ1dgnqJ
         +GzeUY3IVG+pP633IVvg6tIpLc9L75h0KSVPkn7J85RvMJPebdrUm55OgqXFjAwf73vp
         PvozgIIF8iKYYu6f17LZO1JV5kUEYRiHjEvaw2NAC5LBRRFROyZHcnVuyuzQO9VryB6W
         GnL/VLfIGMKOeHH6bYhQwxpKN8n5mgOBLDuzH5QJzSnDIHVKimhUEGpun7nr60MSDTuW
         IpCHH46JxLIGVleb891tjcQKUIbhxzH/fec5LncP0cwRt8HSgS4/CULReLaHFD/6fVNF
         lKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3J8UlCAdANDfuXwyK75WO7Z8Tmd6ahY31LeseAlh3w=;
        fh=R5gzGYIrOYxTvCid8gviBay9KVHyvPxqmmWWwroQZw4=;
        b=R+VGXxh7UurFwf0/P+29UinrUShDL7gE8gri/MANKBO/y4XBqAbLS+Arc477vuJTkZ
         uvvoOyULQfe2Vv1BYDCpBFYYNDAT/Y9GT/HrxPlZyNPRESZacINEFMRXxan4dxPWGXfO
         ackyP2JqGMXsFzlr0x8iHP0ob5RNC5JX4bJjFGi1W5eoBKwyjH/K7GWyzkOdhfxKepaV
         6XcRbcKOldzv9nP0da+IVUiiJOGzZSDOuWCQrqLGNy2di/2RTU+q58qbqdcm+zwAi/bz
         5bu7RpTEegF9LUJXxCGGTRPjxe7FEk/1dKFT3QnBWE/OELHqXpi+zV5lyfzygXXcMcvC
         i8yw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789128614; x=1789733414; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3J8UlCAdANDfuXwyK75WO7Z8Tmd6ahY31LeseAlh3w=;
        b=BqGao8aEZGqGUmV8ah0/KgXJMPMQsU7PB1Y0W0q+6/l3m+/ZzAFSyw3+XyTazXuPka
         WjIz+YgPilMPg3dOJiCCSOtgYKqqyT/ECSk4ysLdK9AylOmO66hziwy0Rc7/mClsoHYx
         gWUH0qoHWxIt8u7zgzN6AG3PV6f4JQUSHYUjRojhvGj8z2x+YpqNLldgYn9aplkHkuSI
         hbZm9tha9sY94LbQVu4rd3/EAOxraXQRlROwBv9/GSLpqG1xSOimX/L/03+Fh7FA4DoN
         9e9Mfvkb/cFj+d9kbgaDqzMRhwhOhxDMys0Kahsk47s+DRYWltnzbKTAoiwYdHz5ZGYQ
         /JSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128614; x=1789733414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3J8UlCAdANDfuXwyK75WO7Z8Tmd6ahY31LeseAlh3w=;
        b=JcVIilI4aLy1q9qo4xhxfW5siVC1zxvwouwC/EjA6yh7JhcFPX8ukioh1UBQO7YUqW
         wYop02ZEfVF9AzkrsprsUAibZ87UCdq5C2+L2aJKfVv8YjCS7+CJiVTYtX9fV0+lQ3IU
         SGwK50ujDgnzG+3KmviiVfi2qeY2Gvn/7PnoRIcCpbk1H8LvKMjlgiI0Fybrry+wraWz
         quJVr7tRZ+qOQtHpY44sDKi6sCsL1jloJjJ+oTNqK91eJan3KNi0D2i0DGLz+uZaFPWN
         MPPisL5aLMJxt3HW5yl1dEZ74XTxSVX3apRl0foGoh72v+XuvyRRM77dVxpXGaZlORHS
         XW6w==
X-Gm-Message-State: AFuF++n5pDZYpuB9vh+zfEDo35HLfQaBVOqoFaTYfDdyyX2M6ZRiLtC+
	s/XNEm2nWnU+d69lxnvNc1PZ7ygQe0pbHf6DpA/jIuBmSaAmbrhZjcWEcSEBtK6CQockTB9aNeE
	YXJDOv2MJBzike4Mcp9eEJa/8NjjsM30EX/QtfeRRDA==
X-Gm-Gg: AYBFou1xFuTNdVvPfx8wFQFqtXo7qwuy+jZin8fIuvhp9bW1FXJNToc8ZeJVmymA3Pf
	2Hp5Wtansrrk4G9yYbHQ/NeXilztmBU6W5Eq7P3vYe6kMSUmoED2KndECfQyTEUhgXCdCo6q/cA
	6sLz3Mo3hAuCl3sdB9BcrSAsvB6x+h0iR//je/Y3EkVHTx3lhb+shY675dX5NIpRsikN7pMSvBC
	PEyZvlCm0sRyrFuhjuaaqVEDh2F8Ub7WoAZ/Bn7UEXlhp00MwtldsL+BRJpScCvX55U8k/gfEzi
	fX9XarjL/AsovF4TEgo6R3x2tJS9m+XCAT9OMd4hEsPS1rKJXAMxmM9rQ+EAK4dy9mcmHKrrhou
	54KR30cBUuhiDrQWs0kD/I0RYkQKWVZlHhAi0rGkx8854D08tNqtCbV6YIcVWNV7AuchjPL5vgQ
	==
X-Received: by 2002:a05:600c:3ba2:b0:49d:99:1d98 with SMTP id
 5b1f17b1804b1-49e619881e3mr56892275e9.9.1789128614171; Fri, 11 Sep 2026
 05:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260911111731.3404308-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260911113322.F03531F000FF@smtp.kernel.org>
In-Reply-To: <20260911113322.F03531F000FF@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Sep 2026 13:09:47 +0100
X-Gm-Features: AcwNN1X3EMrEnABSXEIebhNF9fcbF1O099DZU69vOon2jNzLHf0JqRb5x3-yA24
Message-ID: <CA+V-a8uJLn1N5+ThxH4c67gO76ksuJeMFroDf-WHM_4QLuqt-A@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] arm64: dts: renesas: r9a09g087: Use CPG/MSSR
 syscon for WDTDCR access
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Fri, Sep 11, 2026 at 12:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Watchdog probe failure due to missing syscon compatible string i=
n CPG/MSSR node and invalid physical memory bounds for the disjoint second =
register region.
> --
>
> commit 026369134b14659a11e1791a537a1142aec5c877
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
>
> This commit replaces the direct mapping of WDTDCR registers for watchdogs=
 with
> a renesas,sysc phandle to the CPG/MSSR node. It updates wdt0-wdt5 to remo=
ve
> the second register region and use the syscon interface instead.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a09g087.dtsi
> > index e8d4f76949ccb..40ffe56a40353 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> > @@ -327,61 +327,61 @@ channel1 {
> >
> >               wdt0: watchdog@80082000 {
> >                       compatible =3D "renesas,r9a09g087-wdt", "renesas,=
r9a09g077-wdt";
> > -                     reg =3D <0 0x80082000 0 0x400>,
> > -                           <0 0x81295100 0 0x04>;
> > +                     reg =3D <0 0x80082000 0 0x400>;
>
> [Severity: High]
> Does this change cause a silent mismatch with the actual hardware topolog=
y?
>
> Generic syscons map only the first contiguous reg block. The driver compu=
tes
> the WDTDCR offset as 0x15100. Since the first CPG block mapped is typical=
ly
> 0x80280000 with size 0x10000, accessing 0x15100 either fails the regmap b=
ounds
> check or mistakenly accesses 0x80295100 instead of the previously configu=
red
> 0x81295100 located in the second CPG block.
>
The syscon is registered in the CPG driver and the reported issue is a
false positive.

> >                       clocks =3D <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
> >                       clock-names =3D "pclk";
> >                       power-domains =3D <&cpg>;
> > +                     renesas,sysc =3D <&cpg 0>;
>
> [Severity: High]
> Will the watchdog driver probe fail indefinitely here?
>
> When the rzv2h_wdt driver uses syscon_regmap_lookup_by_phandle_args() to =
parse
> this renesas,sysc phandle, it evaluates syscon_node_to_regmap() on the cp=
g
> node.
>
> Because the cpg node in r9a09g087.dtsi lacks the syscon compatible string=
,
> and the renesas-cpg-mssr driver doesn't register a custom regmap (e.g., v=
ia
> of_syscon_register_regmap()), the lookup fails and returns
> ERR_PTR(-EPROBE_DEFER). This prevents the watchdog hardware from function=
ing.
>
The syscon is registered in the CPG driver and the issue reported is a
false positive.

Cheers,
Prabhakar
