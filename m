Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD983B0AC3
	for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785285; cv=pass; b=XIWMHuycl+S4Yue990EjcAGH056H61z6hnAIJtK68trDf8NU35Fq5O34QfjMoyvx+0QtiQn/3AktqinLYJy6GGBXcevXAXxgn6uUPN35waIbPR3c/u9LGANgjMcVwBBcUfJf5OnsCBKalz9Df9rc52cRFjGFxdybgzvdpnulfhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785285; c=relaxed/simple;
	bh=5fQncidyqju5XwIRjWaEWUVmeKeo8nb3CtmIXxuvC0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gar2N1C6wnnSWvW3c8lVamGbSf/z6RVwqMukiepdF0WPggoGBUQhZmedR3NDRX6oKTc6dbDyo0fTVkGqJygGyuv0Rm+TIP4LkVF9XwoP2LcBUSo1p4wWGHjHKaWkXupEsmHw9xvLxUBkDd6z7OsbmXp/t5je5vUhSjdnvwBIq1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7HHhc+5; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7HHhc+5"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso2387226a12.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 02:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786785281; cv=none;
        d=google.com; s=arc-20260327;
        b=fU6oW8F2PyOfTcV5WuasE8uce9t40sfH/GRnxB5sl/DCgwQ3WL8CqmVzoz0AKbRbEa
         rTK6QkAKyzXJWf8HOh6bPdnrIyiLYjhmS6VusbuaYbPW5A1pvPZKWRyr6unOS8kFelET
         aUZiIJ15nQeGXiKD5zIZErn5rXGZqddtayaBmr0qjB0wMqlYOGNzns3RKkOLhjAShugI
         Y0dCuZGiIqxewdOmKkNGEl4ctT0Ws/+M+iuKXZ3fc2XaIzdKY1OimAWNe09lmrVX6pjM
         pndHaCeuM3G5mXkOUSgLyda8+d8IEcVYRwamBWQUH8grhQm16d30kN8KESp3EREjp8Gs
         nhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l1AHP1yiadUPKvA53vmM4QSUOpatBxef1dyJnSggtJU=;
        fh=2W0Ap0j8ZPdraPmHNiuQ1VQrSV3frHwjk20YcE+aGgo=;
        b=fDnRnif4mBXzjJdh51yP+jgPPxc3rJPijom38HJ9O7zH9PXFrduyfUZne3aOCIzSKY
         Uj8Ol4rUWLvS2uwWNycE5mpylz33xVsb0Fca67jZ38Nm8d/frM12NeIJ/WiWx6RB22R6
         LX+xDYUpoxoGpH8YAtynz//xR86DxOd4jhL+c8XE4R+DQ38999RT5L5R1TTTyAv/BR7Z
         pBKFMbPuMwlNa/mofLcORP/1l955ZjWAtbYZlUMaIbYFV9ei/yrhLKtzQbbWStr8/SFk
         9JYxNUKKvwt+IvJBgkLJnOz7TRLEnsGA28SJrgLABbzXm6qmLzr7NyUyvVUxJxF1BHhL
         KU2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786785281; x=1787390081; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l1AHP1yiadUPKvA53vmM4QSUOpatBxef1dyJnSggtJU=;
        b=f7HHhc+5cFgQTGiKJiLds0CB62eq4ADk7JL/64O0uopQJ7LtGexbgqRK0o+fqPGSLo
         s09eKW17ggAQakPiEZ9MaytL/LzMda/YV5UDgpuNIMYsTv9SWCXrCV3JHaV+QCaC6Zkv
         sVgbOW2I2ZB1isz1vLkhEIVdI/IfxaXu8gCkIOnkX26rAVZNiztHINVbxf+XL09Z9H1r
         9evFqTrRdLmJ/WkCOOuHaMuur4DtLam+0FVpbz3gSXvLtcQjq4MdRRH/kerzchan92O1
         1OmmhWE6x9DfawdZVDC6QSpqp61fUOemh6uAPfnXJktt21ROx+CDRY3uFlWMRV53mOL3
         MPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786785281; x=1787390081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1AHP1yiadUPKvA53vmM4QSUOpatBxef1dyJnSggtJU=;
        b=a+zAwOiaj/6UMULwRUb9yWHOWKVjYwolqKmRTrjPU9U9s7+XooPPOp5C3tv01Rrfbv
         n0A11H9HP1SZDp8xrL+F+PHf5PC0NvnuSaC5J6+SaqASnB6BBJMjZ8nJlKPOiPfn/Sih
         nu31iNBpASCsRpc0h/uIuY3eY7szL8vxdEbo78eVadkQIb3N/oX9eDd6g56PuFAcCd0f
         T1tlMgwFT+aojrVd2dIQgCP41KO2LvRJ7BGWPUL0YQa3KPYSbMXhk3j7b3f8r77CEol7
         SMOhBkWVlWOD/14G0+yo9ObnoZG48cQIPxwiYzEu+prh6y7Gg1zcK0wxPLhjNqxOX5oa
         UEgQ==
X-Gm-Message-State: AOJu0YxsYd+gWA17onvKWjxjK9S/2sOzR0njGPfPmEbwOvCtEgchL+ms
	A39P2RIS7b8rxH+GM2WVXsisuqNY0Cm41iYG1McebRYr+dLif1O296SvFGwog9SwhVIjOwwO9AI
	0UoaJ72ClBMBKlWCH2IQsbcLOr5kZfg25G6suYVU=
X-Gm-Gg: AR+sD12fdn9hXCZiziTNoIrbSYHYOkGiUrrePL8ybA2369fpuTvZz3vhjzgWP2+QiDK
	TkNHB0MQzeoXwY6AzupO1bZo42u7kM/D4iykxY9rSYMN6W/NzROE/etO8bfZ8nSQfEFLX8PmfR/
	g4AEQ0hOYOJiKIrIV49rZhj6rhkxiPg5qd+msQsKnIuCBmkS0T8VlMFxPHBlkPwI8tzad7l08hx
	oBQUSDhx4yClUbcQ++XPQjTFAeKQH57/FPhZOUFfyP4oEX3OyKrkJahhOFJaN+AmNLXbZUAkfHh
	AyBn/b8cpatoSXDkvAwXJTrKPObo5b06YfXfTLxoPvvHIpG9algMv8jeEqumFR72+ixQNHIc66Q
	hZ+aYy3IwaYT8
X-Received: by 2002:a05:6402:249c:b0:6a3:8586:9b73 with SMTP id
 4fb4d7f45d1cf-6a38a926287mr5303643a12.6.1786785281054; Sat, 15 Aug 2026
 02:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260815083451.2147129-1-egbostina@gmail.com> <20260815084635.BECD91F000E9@smtp.kernel.org>
In-Reply-To: <20260815084635.BECD91F000E9@smtp.kernel.org>
From: Eduard Bostina <egbostina@gmail.com>
Date: Sat, 15 Aug 2026 12:14:30 +0300
X-Gm-Features: AcwNN1XLq_7Rvilq510EdyjugR4FFUzRoIg_f3AqTgOwGlF-ckiD4eTzrM4zuSY
Message-ID: <CAEFOc61s9761y+7zcuWmNUeRuOWika=uhAhOay8ufL7vVhNk8w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: Convert TI TWL6040 to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, 
	robh@kernel.org, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2026 at 11:46=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The YAML schema defines incorrect property names for the vibra=
 default voltages, mismatching the driver's requirements and breaking schem=
a validation.
> --
>
> --- Patch [1]: [PATCH] dt-bindings: mfd: Convert TI TWL6040 to DT schema =
---
> commit c57af8c690b680b78b9119a5988e020149e24c1e
> Author: Eduard Bostina <egbostina@gmail.com>
>
> dt-bindings: mfd: Convert TI TWL6040 to DT schema
>
> Convert the Texas Instruments TWL6040 audio codecs family bindings to DT
> schema.
>
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Do=
cumentation/devicetree/bindings/mfd/ti,twl6040.yaml
> > new file mode 100644
> > index 0000000000000..a93835aa91535
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
>
> [ ... ]
>
> > +      ti,vibrmotor-res:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Resistance parameter for right motor
> > +      vddvibl_uV:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: vddvibl default voltage if it needs to be changed
> > +      vddvibr_uV:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: vddvibr default voltage if it needs to be changed
>
> [Severity: Medium]
> Does this incorrectly define the property names for the vibra default vol=
tages?
>
> The twl6040-vibra driver actually expects these properties to be hyphenat=
ed
> and have a "ti," prefix. For example, in drivers/input/misc/twl6040-vibra=
.c:
>
> twl6040_vibra_probe() {
>     ...
>     of_property_read_u32(twl6040_core_node, "ti,vddvibl-uV", &vddvibl_uV)=
;
>     of_property_read_u32(twl6040_core_node, "ti,vddvibr-uV", &vddvibr_uV)=
;
>     ...
> }
>
> Since the vibra object sets "additionalProperties: false", won't valid de=
vice
> trees using "ti,vddvibl-uV" fail schema validation?
>
> Conversely, if a device tree uses "vddvibl_uV" to satisfy this schema, wo=
n't
> it be silently ignored by the driver at runtime?
>
> > +
> > +    required:
> > +      - ti,vibldrv-res
> > +      - ti,vibrdrv-res
> > +      - ti,viblmotor-res
> > +      - ti,vibrmotor-res
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815083451.21=
47129-1-egbostina@gmail.com?part=3D1

No in-tree device tree uses these two optional properties, so
dtbs_check never caught them, and I carried the names over from the
old txt binding.
I'll fix them in v2.
