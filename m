Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8512A145B27
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 20:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791404276; cv=pass; b=FoP6RwMkrS/RSh+P3Hr+J1x0HJRzN+W9oEY3Gnngv/y0fLQAn5x8OOMdCsNnpANRXz+ionY5Th/qdZMcdnEAW9q2cN+CfMVZvqFQkPAmOzJWbR6b5/qZ4zux0PNnNbXFoW/CCrdwe/YwHs+sIuGfvf7AjsgeUapD4T8ZgVn2Sok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791404276; c=relaxed/simple;
	bh=ZpW5g8r9t5xJkjvPBNV+VsBm7xzRF3J03gqyN8PT7+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8sS0nATu04orgJ4huM9BP+pgw0doce4La3b9wyQSKo+vCkJEpbvqY5/79UoURGoQBMUvkR4sRGXHjGTVJGurM1bVFRGyAGTbMx1e02q5aXD1Ev8lQ0JDiUBW3U5AeLAZvaOzSKv4YI+MfKLx0upluOIXPzb8oCVea20apG0yH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaHcsNGU; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaHcsNGU"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1482144f8f.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 07 Oct 2026 13:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791404273; cv=none;
        d=google.com; s=arc-20260327;
        b=mIB5YkeLsPbUWFLeAU9HrD7PXgwen5RJd/TBFhSQ8isoEfqS4sC7lqfwqviVLnlZq/
         XCKMiVO7L39DpIBB/GPHOYg4xUePbcPL9C13zhgYlIJjfoO3uFc8pjbNgwofCdDqPKAK
         W4gFiTj4HVB1boOLvwW8n7MQpku8pzgqlJFxJtmrKZ6oxvC4f7OhdPaDrtMmdk6NgRL7
         auHm1PPMwYX5slnvAyoKgyJKmKrWHt+pyhUAkQKjQILQU1Ak+eH0rOWdEH6yYxDwJUAa
         nLel1IBHTz007BrxgWMR6K8/m1MyEUA3L1z1AcGwrLEm1nQg0PrxiTgIUDbajlJhgD5f
         XrEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GYcofiYrlKd3iFMYbYc9JyZNgDUHZ+Vq0ErILDfAy7Q=;
        fh=OPZT2YEd2rm3K/EaPE+F10PwLVDuYQrF8eTcruWimkQ=;
        b=ScewmuxJZQ/tHBwm0CbZkaTOeEdt/rPV1hTYLlicLs/jggk/+ysWHZ1wqJnhLXDjUn
         wSWFP9BejiTl1RqbdvBVTSwBJcbR4CrI9DxhZeLJaA9WW472s4g67xp0LKtaUb5Uspmd
         rSAA1bAzgc/zwbQK2Cn3fMjAvenGbwyqid9cllavQF29v50F5oolgoa6AlBhFc6xucD3
         XErj9572S+XO+zj5pB0DFlAFoE8B0eFrqHQLmU3S/eYn4Hevw/ot2TIIlSbCJ3v+Sxkh
         2wJKbHwX7pn2PjkOkmZBdelWaPO4R9uFFkIDKGrCW0OnP1tq1kuhGXJA/Qekv3PmholT
         ZzHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791404273; x=1792009073; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GYcofiYrlKd3iFMYbYc9JyZNgDUHZ+Vq0ErILDfAy7Q=;
        b=iaHcsNGUZvRH2q0ML461F6I+68+p1Ye2Rke19tf8e/LKKl2sd87sa8WI4wrCwfqOpi
         0fix/h50ZnOMF3CDVAxsckKFAyYp07ZneMzgjotHlfFNDd9skf+1/tUkxzT1TDZBN2J1
         5JPrfdjHOkKai2S5xupjAV83t46YrO4/ohQMpKyVMSXL5ANxfIc2sTbk/jigS/RFH/kT
         gPmQrmuNmjsG9Bm7rvhsZjOyrwGGHHXRd3exKT5+Ln/o7bE7Qn8aesLmB9QmkWKCNY7M
         /DZyMKxpe/rjKrt2/2MRliDfhQ0QbcIv+flh07YyeTatZmci/flCnOaAn4nluzYivShI
         p8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791404273; x=1792009073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYcofiYrlKd3iFMYbYc9JyZNgDUHZ+Vq0ErILDfAy7Q=;
        b=zq3SActeh9idzyIArMD8JdkoY4AsFxdtxk6qFmxdPdBvs5Hn9zq46H/MhxG1obwiw2
         8y/76qNikY9vmI/a2QCIGTkromSDtbJCoLBPPN+G3VQiFDMPgBuyoOu8p+T2QdTkR4PT
         FGlIkw5uRf9wjmUSKiiDYVcaV9trqmJti3BVQVpVBXM1nWITe79NIahx/XZPjzBv2AbF
         8T3Lu7PiM5BpL3YuW3ZWp93kkDwX7l1FIj1uyPOXs0AH76PdXkiPMQjuB7sIGps/ks4p
         TnS0ybs1Y4VlogRtOGHMqu3mm0M1xzBtphuPGX6z8g6sO9KxvVaePk0pbR43PQr75ie5
         6GPQ==
X-Gm-Message-State: AFq9FYJtPsOxBK4G/GzmXwaETk5dwO2nmiTodWPqnXqJ5fXavMLEqw//
	+2R4mWW8XyRLLV1W41ahNadnUJ9MS9wDo3dO4ZygYYvvy5h7Jwp8FW05fAHiXYpyKfRLhQNvQJa
	bvVsBlZRXnFhdhPx+vHegzH/E5YY9Ezp5SkEleuQ=
X-Gm-Gg: AYBFou0pFdjMebAzLYWjPpZBot451S2ZYvvj7yaDbplvPDLiAbOIGGmbxnQNL8evAh/
	HPxYc5LUJHOtgWAtTV5rH/Xy7FXfjvK+5szI1UYhYtKwFKNpaK479Lqy6qZRW9/TtObt0SI1kBB
	qbqAxQzAYZuM816Iq59MkZrLAZOrbup1erjRnGc1eSb0AAzp2xFS3oizDO/clHI5PKVgcAQbVut
	st7LgKOtyXJGU/YTYnMGSi8OvVcc9TEOwN8sxwrs3Os5pbrAaJoQaEjs2itwVpwRg1Dw/UA5tKC
	DM7sMfVfBrzM52uT+0PYMkYkiOr2Z0A4nttdDveqAVwS740lKziU39K466TiFbDxc4VGWp3R0L3
	1RytJVWI+X6bGTjY3HnbpVQi2lc1D/kg/yLs05n1JSJShApi3SooIZXy8LiUZ/JpWHF+su1jEow
	==
X-Received: by 2002:a5d:6f18:0:b0:48a:fcec:2a1e with SMTP id
 ffacd0b85a97d-48c727714d3mr6260131f8f.20.1791404272542; Wed, 07 Oct 2026
 13:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007190654.452376-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <sashiko-outbox-163308@kernel.org>
In-Reply-To: <sashiko-outbox-163308@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 7 Oct 2026 21:17:25 +0100
X-Gm-Features: AclHuK-7omXDfGhEXLWYnCdLZKCtqKAKNSUkEbMcNdvgyEuSNK7SrMKq2L59HWg
Message-ID: <CA+V-a8v5wOc=wMuGK=ztfU2bomcWgc1uBBzUXCZzfLQ71qEjYw@mail.gmail.com>
Subject: Re: [PATCH v2] phy: renesas: rcar-gen3-usb2: Keep OTG VBUS disabled
 until role is known
To: sashiko-reviews@lists.linux.dev
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, 
	neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 7, 2026 at 8:20=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] phy: renesas: Probe fails with -EOPNOTSUPP for generic VBUS regu=
lators
> - [Medium] phy: renesas: dangling regulator enable reference on regulator=
_is_enabled failure
> --
>
> commit a95e43cc86d79f16f418ebb877687c2d3024260e
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> phy: renesas: rcar-gen3-usb2: Keep OTG VBUS disabled until role is known
>
> This commit addresses an issue on SoCs without ADP control where the VBUS
> regulator was unconditionally enabled at probe, potentially back-powering=
 an
> external host. It reuses the reference handed over by an exclusive get if=
 the
> regulator is already enabled, registers a devm cleanup action, and uses
> regulator_hardware_enable() to turn off the physical VBUS output until th=
e
> port role is known.
>
> > diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/ren=
esas/phy-rcar-gen3-usb2.c
> > index b5ba751805aae..3481505dea2e8 100644
> > --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> [ ... ]
> > @@ -1133,17 +1132,35 @@ static int rcar_gen3_phy_usb2_vbus_regulator_ge=
t_exclusive_enable(struct rcar_ge
> >               return 0;
> >       }
> >
> > -     if (enable) {
> > +     ret =3D regulator_is_enabled(channel->vbus);
> > +     if (ret < 0)
> > +             return ret;
>
> [Severity: Medium]
> If devm_regulator_get_exclusive() acquired a regulator that was already
> enabled (e.g. by the bootloader), the regulator core implicitly sets the
> enable_count to 1.
>
> If regulator_is_enabled() then fails due to an intermittent I2C communica=
tion
> error and we return early here, does this leak the enable reference since=
 we
> bypassed the registration of the devm_add_action_or_reset() disable actio=
n
> below?
>
If there is intermittent I2C communication that would mean the system
is already in a bad state. Handling such a case will just add more
dead code!

> This unbalanced count could trigger a WARN_ON() in the regulator core dur=
ing
> regulator_put() when devres tears down the probe state.
>
> > +
> > +     if (!ret) {
> >               ret =3D regulator_enable(channel->vbus);
> >               if (ret)
> >                       return ret;
> >       }
> >
> > -     if (regulator_is_enabled(channel->vbus))
> > -             return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_v=
bus_disable_action,
> > -                                             channel->vbus);
> > +     /*
> > +      * An exclusive get of an enabled regulator already holds a refer=
ence, so
> > +      * add a cleanup action to disable it when the device is released=
.
> > +      */
> > +     ret =3D devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_dis=
able_action,
> > +                                    channel->vbus);
> > +     if (ret)
> > +             return ret;
> >
> > -     return 0;
> > +     /*
> > +      * The regulator is enabled only so that the regulator core holds=
 a
> > +      * reference to it. Do not drive VBUS until the port's role is kn=
own;
> > +      * rcar_gen3_enable_vbus_ctrl() switches it from then on.
> > +      *
> > +      * The VBUS regulator used on these SoCs implement the .enable/.d=
isable
> > +      * ops, so regulator_hardware_enable() cannot fail with -EOPNOTSU=
PP here
> > +      * and no special handling for it is needed.
> > +      */
> > +     return regulator_hardware_enable(channel->vbus, false);
>
> [Severity: High]
> Does this actually fail probe unconditionally with -EOPNOTSUPP for generi=
c
> VBUS regulators?
>
As mentioned in the comment above the regulators currently used in the
SoCs implement enable/disable callbacks; adding these checks would
mean adding more dead code.

Cheers,
Prabhakar

> Upstream device trees like r9a07g044c2-hummingboard-ripple.dts use
> renesas,rzg2l-usb2-phy (which sets no_adp_ctrl =3D true) and map vbus-sup=
ply to
> a generic GPIO regulator-fixed (vbus1).
>
> For these generic regulators, fixed_voltage_ops does not provide explicit
> .enable/.disable callbacks since GPIOs are handled internally by the regu=
lator
> core. In this case, regulator_hardware_enable() returns -EOPNOTSUPP and w=
ould
> cause rcar_gen3_phy_usb2_probe() to unconditionally fail.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007190654.45=
2376-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
