Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B399376BF2
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 16:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022535; cv=pass; b=NP/N20o+GigpBhMrW4drOjNvmUHW6DZ5FCfkwVmoBUd3VkTYk4Eyte5r2xZetnK03JjsVruqyXoOFrocOplTapkSguMl/Ua51IR+K8W7Z5RevgxbuXkgxRBjJ7KeyiXoCJXHN7nZp9lbTelBrT2w6/agbV58AHvs/1lmbk88tfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022535; c=relaxed/simple;
	bh=H83i8Cb+cpZkV/IEBmS/QlZKHgw/PIb9DZ6YI97XEFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5CYC++vKLavMdsuCQWndALe9YcRMV3mfrCfY4nSpx90Ok67LUS+Ffu29EpozARun4FJvIetVrg9id5Re6x/9IWXNXdvGAXfrBJe5+SZiwT1yVL16sVO9U8f2ifswpWPxCVTqeIN4MpDMAyZ4TyfT3KFCLgxCriviOsSjuy+490=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+SgPqcx; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+SgPqcx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-46013161068so2906567f8f.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 09 Jun 2026 09:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781022533; cv=none;
        d=google.com; s=arc-20240605;
        b=G8UubVia5B+HpBdmOPjXH+q5yFtyoKb+SQEDcJiqETeFj3Xih7X2HXUlolSC462L5H
         xSyZ6TGuOaXaZsgO27w+VhumBfNQKO8ox+LGHptA51Gyn6O7OVXxz/J/MsL7zNO2Eki6
         VzdefqRUDJAoxyJcbPVxMHEyCCb56vaxHsz8MjOxXcfng+zgjqOMbOJj82CFXd1HVe3R
         R1rF2Wx2T8t4fPFQvlbNG8GIPkNN1tcB77VaJjXXdLMFx1dc0JcW2LvOawq5c1XLQsYl
         A9Ql31HSs/gfJL+9ARl950mTGntedYf12Ni9caKmR2G2B5nVrOmywqegD6ryzTRI93cP
         WoNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vSUF15Jri5gWyOV5bUtSHVarxchoXkeLTNdzi8zMmFM=;
        fh=grLA/PineYnGdLbvtgSHW/ajGVvjX7Y6CitcYyhYkzk=;
        b=WyKrJ2M6B+PM9bqvlGd8Ye7bG7XTI/2tKJRmFg7vqWD3UM18UD2WFBo3riS7O1zjzs
         2VdROLP54BFGx/QA/9oLy3U50O9ckyLmvsSaBliNY24SmaHUQdKlfqACRqfrVRlgOUeQ
         j1ODusv41sKuddGeSPKgLoCaaDEXTVrVeQJa1pi6VnDBgdg/GVDfp6elEhSzAHXtOzHq
         SlgYYCf4aZGJ3AI+E9uCNbFPjKddPL3fz2ZC0RpGY/k6t95xjTRzPDVCRD4bbBkqluIG
         POUkc1MaqVgFGHBXJ+mK532yvq1AfNrE6q6vl6D7Lk03V5Zc9i/dVhJUf5x/nxTUNrnF
         iZHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022533; x=1781627333; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSUF15Jri5gWyOV5bUtSHVarxchoXkeLTNdzi8zMmFM=;
        b=o+SgPqcxsQty/B7Vf7aCwiWbjSu9jDhUMPqVsoIZsl2y3sq9jAJRtq6zaeTWlopLdl
         5KbG8OIx6ryQq6E2uvB+ZYaiyMmys70sC+5mPHfG/Un7nMDNwnlP/QjC3XSp/HkKaeIJ
         e2SjNJKuMC0rutZzC9biDyzM34sGDUPVuldt+8ps9T+rKmo0q3K9t3KXQPfok2Z8SQ35
         KYPiSaSXLpxg0dxO8aeovfP9swZ9fqVwtAgYw/79sSdHT2+N7a3j5MibHzySY9XI04tj
         66MXQdlzwFN00Hi5ccV1pooiZQfMFqlbWybWNIYozIPwTvjfKrd91cjky/HerRe+pwOZ
         nlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022533; x=1781627333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vSUF15Jri5gWyOV5bUtSHVarxchoXkeLTNdzi8zMmFM=;
        b=Qx0z4g/6Xu3ySu/BCqbIgh2Osoeb3sITy+r56xMv/ktSoMRdSSktLFM2S7cJNsGb58
         jgH3vYV5YZj6wtkUZZO7zFBnObMgUo9A8dljH/CTwreLeiybn+8ESW59FcGRT2Cq87E1
         zCvB2H4Lz2ch4R2mCtKT+oV8DQUBZBpihCXTeuEINwKaY9BBxTWU43lUWq9h6ARAiGU0
         EGhUiH1S329lcIuYf/UlfzUlUacpr6Z8UNb39W79wYrZtZ9z8I7uK7yXBFDz5WMRF94P
         YsqYsO+NVarVGvvaOpRjDAASy7rO5A8nWaTsPsqnu7etWM0cJewNWq7wGWyyVfNXRGqu
         Yguw==
X-Gm-Message-State: AOJu0Yw6pw/uRL7cVPqmEoMaj71WtwFEa2gZZvlStMDCuIEZH4QFJKNM
	jk/b8dqbCcN+P17YDr4ZJ/AkEiCmac1rFslDNpV5g6mau0R0ecoS/6E7EDZzTVVMcjZP3iokDx8
	G5iYykSHLXqn0LovTpGpv4CPn0uzy8KNJgtYohOYhsg==
X-Gm-Gg: Acq92OFnjuYXtiJjP7OUDQYh0xWeCo0S+X+9jqjKtSHFGwhdJe8W3U9BWXF5QX1Fwk8
	W6HJN66qqyV+1jAQU4X7JJEeMUPWpUbOPePBPyPkPnbNhiWSoWAFXxUz8MR5Ll3a05hUNov1Imf
	JUbRGFiqSU2UAjVhDh1GocwcTYSOIwEPonhitWjY7VtWxfNxijhox3FC2t5t3c+5p4Nn88Pq7oT
	UTAzyOFkfPqHXk31ERmuqMFIvgBD83R6k1M1DW86Y/0qX1tv3IgCVRuHL/GwDmwiX7O8ty3bIYj
	85T0sW2hMRXxP3PxKUFKRS5iR56Y+qxqavDDb94v3Dp+qIxGD5uQh3htI/6qnwXTOuQ9AVQC5AX
	fK6ERvAmYVtYIig==
X-Received: by 2002:adf:f250:0:b0:45e:f271:5019 with SMTP id
 ffacd0b85a97d-46030506f41mr23775351f8f.14.1781022532357; Tue, 09 Jun 2026
 09:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609125353.401124-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260609143048.8B0DE1F00898@smtp.kernel.org>
In-Reply-To: <20260609143048.8B0DE1F00898@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 9 Jun 2026 17:28:26 +0100
X-Gm-Features: AVVi8CfbvHgFCCNC6XekzrLzABrskwBcGCTqQD_mJN6zpisSCK3G7k2nfPZ4W5E
Message-ID: <CA+V-a8vxP6vPx2T+3s7ObVwifx9FqnLfLdq9OpYGFWNu=8oxOQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H and
 RZ/N2H EVKs with ADV7513
To: sashiko-reviews@lists.linux.dev
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 3:30=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The RZ/N2H overlay fails to disable conflicting devices (`led-=
7`, `key-1`, and `sdhi1`), causing pinctrl and physical hardware collisions=
.
> - [Low] Typo in the Makefile causes the composite DTB for the RZ/N2H EVK =
to be incorrectly named with 'rzt2h' instead of 'rzn2h'.
> --
>
> commit efe0a5ca8f3fdb36ded9b05e9b5a45260bb5135a
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with AD=
V7513
>
> This commit adds device tree overlay support to enable the DU/LCDC pipeli=
ne
> on the RZ/T2H and RZ/N2H evaluation kits. It configures the overlays for =
use
> with a CN15/CN20 ADV7513 HDMI transmitter.
>
> > diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts=
/renesas/Makefile
> > index ca45d2857ea7f..0f64a8820e374 100644
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> [ ... ]
> > @@ -215,8 +215,14 @@ r9a09g057h48-kakip-pixpaper-dtbs :=3D r9a09g057h48=
-kakip.dtb r9a09g057h48-kakip-pi
> >  dtb-$(CONFIG_ARCH_R9A09G057) +=3D r9a09g057h48-kakip-pixpaper.dtb
> >
> >  dtb-$(CONFIG_ARCH_R9A09G077) +=3D r9a09g077m44-rzt2h-evk.dtb
> > +dtb-$(CONFIG_ARCH_R9A09G077) +=3D r9a09g077m44-evk-cn15-lcdc.dtbo
> > +r9a09g077m44-rzt2h-evk-cn15-lcdc-dtbs :=3D r9a09g077m44-rzt2h-evk.dtb =
r9a09g077m44-evk-cn15-lcdc.dtbo
> > +dtb-$(CONFIG_ARCH_R9A09G077) +=3D r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb
> >
> >  dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-rzn2h-evk.dtb
> > +dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-evk-cn20-lcdc.dtbo
> > +r9a09g087m44-rzt2h-evk-cn20-lcdc-dtbs :=3D r9a09g087m44-rzn2h-evk.dtb =
r9a09g087m44-evk-cn20-lcdc.dtbo
> > +dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-rzt2h-evk-cn20-lcdc.dtb
>
> [Severity: Low]
> Does this code contain a copy-paste typo? The target is the RZ/N2H EVK, b=
ut
> the variables use rzt2h instead of rzn2h for the composite DTB names.
>
Yes you are right, this hunk should be like this:
dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-rzn2h-evk.dtb
dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-evk-cn20-lcdc.dtbo
r9a09g087m44-rzn2h-evk-cn20-lcdc-dtbs :=3D r9a09g087m44-rzn2h-evk.dtb
r9a09g087m44-evk-cn20-lcdc.dtbo
dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb


> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dts=
o b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
> > new file mode 100644
> > index 0000000000000..bc8a91278920e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
> [ ... ]
> > +&{/leds/led-4} {
> > +     /* P18_1 is used for DU function LCDC_DATB2. */
> > +     status =3D "disabled";
> > +};
> > +
> > +&i2c0 {
> > +     status =3D "disabled";
> > +};
>
> [Severity: Medium]
> Does this overlay omit disabling conflicting devices like led-7, key-1, a=
nd
> sdhi1?
>
Agreed, led-7 and key-1 need to be explicitly disabled. Regarding
SDHI1 the manual had a typo so just dropping the comment should be OK.

Cheers,
Prabhakar
