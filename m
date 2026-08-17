Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9413D3F2116
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 23:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787009020; cv=pass; b=L/oAPRG/FUDUMZw2t0/e/Izq1/EWAB+tEO2xbF0ZwYlmYYvJYHQ2REe7TIoDNsw7y+Z9/ipUHTgGR0dYnq26vzfvcMS4Ooz4dkcrc6bhqofoLFe2IjhFSnGhGkWLXPyZGnWRxTMscKnQ21Ew7hl6f2ItasA6eQegbaHb9QZQQ3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787009020; c=relaxed/simple;
	bh=9eSFYOl7kYn4j8mvAT0Cf6LeVVnmKsPzCcAEXVf1qJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovfOUyLoDLNUmEoKSIpJzeB0dAr9Syio/a9vMJ/pNwzyQ7kVJ3DjPolY4TcT7oP6JfXNIyrd48HqFaEBTKIJMjGcZhSyTPhxdP/yGOiXYYXqU3w/oemdSGGlO2WlIWROf4vKzYShAMUsywTC5fMBM3HWCVABj0RR0/WsqvPU4IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KW/n+mJ5; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KW/n+mJ5"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a18b91fb1fso693905a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 16:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787009017; cv=none;
        d=google.com; s=arc-20260327;
        b=G28LavB2lQrNMsbT3XW9wydrxoTuqdrS/TqSn4oRb6n8V394n9g3pEtk5RhV1pVv1p
         mzUHqFaOpEtHWcK6+uXqVdgHixUF+5lpSG7Hw1ewvMzShs+8GqTtyEJmvbrJ2cOAnv0p
         qv47evJp1NGMyticBYXMTAwPBbXeICm6lfryyGguNySvq8yGqkMxB5WcjnQJ56TEuCm3
         pGUegqERqgAsQgHvthgJM+rBe4JRHoJ6iZGMxhbyQbYK5SZnwN4LZsyc7uxcDGeeeYsZ
         tSHzVion46OqBUvpURiViDzBmcfQ2JoGsn0RDuMcuOJP3d5TskbnEOD1rIQhy9ZSILVX
         ++5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mza8YFJw9Nex8v6b5Iq6o1h/WX62q5XrbPAuvjkscxg=;
        fh=/XpjGZn3y6K47Mvo2dSR9uLrxJmo0fukuO+2jit3bps=;
        b=rk8zq6yhw1xM7fF2yEjKqIU/RryLvXZjpfGYRuoLNYC4z+0+74wxMMO/ciZ/ADTNDb
         mrVjpok5MtVJIyYzqFghoOjUEOzZ3tF6H88TNMVv86RxjP470XiFIThxM2bLQZp1E5zr
         OxGnNsuu1uN7DKP8g97z9I+Dx6lgfRaXS/6+N4IIAIN1upQGI504QDQl5rN7y7L3aBye
         /W+EPF6w2wHQx+uQpby3QvqtONO7pT8hkKhcbKgSIR5wnvEoqM2Yjyvb64BeGhQRvzNd
         gZGVJE0Xh1NMAWv5P6fBTDriEC/ortTC3M/FoG+lvaF9tlkEkIHqGEN7gKZmUwAq+gMk
         JbMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787009017; x=1787613817; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mza8YFJw9Nex8v6b5Iq6o1h/WX62q5XrbPAuvjkscxg=;
        b=KW/n+mJ5W/y5R7a/qASCXSISB2aYA+Ht/OvbhkI7CsILvJcKpLeLKxnNjJGRc6ORrQ
         +MX3+Ozte8V7e8voGqhkrf814FG3ZFg9nKMM2tMZ4MiXFAl+cFyqnWDG7V/Zaju4gawS
         PSAN3LeY7cf7JRUoWLtkfQK/X0qebjik+hD8PFgnoUHSCOeLD7JvpMvP77H+EFAwcqqp
         PA8I+CH5HA+MLmur74uQPZb30srzCD+PNaxDMcZJ59bF479P/6VTygtZq+PnyfdVRBIc
         z+WfkN3TNwbWs/rRIrTtDyUkNOlJdS+UamEII4AqLumMQfZoOvOP4hPpsVvJiaAtHKS/
         Ziyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787009017; x=1787613817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mza8YFJw9Nex8v6b5Iq6o1h/WX62q5XrbPAuvjkscxg=;
        b=VE57Q79/rp0rVFnCR1YYfUA04LBKrvwDlR0VMtijeL2EXy49OULSLnO4eI9fCAstwh
         x39KDQ30/gqHoz1+Aqn13cRZZdmBcva4FRffGv2tbyY4osx1yslJ+q1u0fSi/gNdAZd7
         d6glb+e3GufATmXWHRHzmtPGZQ8Q1SkyH6xrCPtHKf2CueubZE6t8hQdrGBURcHB01WY
         9V2QMEShhjjX7oWJ8yPdriHmSFw0ujZJggiKZpIxWlrlH5Hd4WGIWnfSpC2m9g3BlHin
         J7384zUsVzRBf7P536qHTpD/+yBcgb7TnV7tmtvyoe9/j/T8oNQ6A7u8r0RgwuWF9/Sy
         OVNQ==
X-Gm-Message-State: AOJu0Yw+CEX4wfT4IbaVmKFy0RYHZUCzuexDbDFzs6vtYruWvPc74++v
	SLxas60yXdWokTPYs/giJ25ZTvvffhoRvqoCu/7Ibg3WLYTEpfQJ4bocOpYk9f9US33rlt3Prz/
	UcSbbpw8y41jSLzt/OFL/CSGo3SYkATJivA==
X-Gm-Gg: AR+sD13XzCRSb/PJbG6s24gcOhkTKsynDC7k7R+qgV7jYnE6GgA806m9L9kFfLWU8tI
	SLs8g1fqlJF4CAY1bSF5JHfW4OnxSUhC3ogbLLwXRQW7AbkW0odQkxqW0OTeeWhcHHz+1OjWYD8
	2boj1GK21ffqrVppspLp9JkpA7Xw4jIwd2wMhrWiw94iI4N0BHLzpRoD7rNkpvqEeDeH5lvxrf5
	rthEIg/ttq+IRZL0ziTghjaBl6kFSYOAA0w4/h+/ss0HvPdc6IejtnJLVhwnBGs7WrYwwSN53KQ
	yeCB/03tUiJ6rVhVJaWv2lgwpZ7usdDawIhDQ7sj1lmnIawuWrKTxIY=
X-Received: by 2002:a05:6402:3888:b0:6a1:8d3e:ee77 with SMTP id
 4fb4d7f45d1cf-6a38a8b7c62mr7184435a12.1.1787009016712; Mon, 17 Aug 2026
 16:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
 <20260818-ti-am33-usb-v1-6-69ac5f92df45@gmail.com> <20260817215405.5BC3F1F000E9@smtp.kernel.org>
In-Reply-To: <20260817215405.5BC3F1F000E9@smtp.kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 04:53:25 +0530
X-Gm-Features: AcwNN1XYCdHEoxp8zYAqowoGvQcsnsweOral1dWBweqLMbdSD1YhkaBkE_HN9aY
Message-ID: <CAOWyW_6Tgc8oPY+TOaU5zTGx3i_YPSDBoW_8RLixyzj_cWTyGQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: usb: ti,am33xx-usb: Convert to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, 
	neil.armstrong@linaro.org, olteanv@gmail.com, Frank.Li@kernel.org, 
	conor+dt@kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 3:24=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The schema explicitly marks `ti,hwmods` as deprecated but simu=
ltaneously mandates it in the `required` array, creating an inescapable val=
idation conflict.
yes, will fix this in v2
> - [Medium] Unresolved phandle references (`&ctrl_mod` and `&usb0_phy`) in=
 the binding example will cause a fatal dtc compilation error.
no in examples this doesn't cause any error or warning.
> --
>
> --- Patch [6]: [PATCH 6/7] dt-bindings: usb: ti,am33xx-usb: Convert to DT=
 schema ---
> commit e8e58c2d48bc9c752ca62d3c7e0ea6fd5cff0b12
> Author: Bhargav Joshi <j.bhargav.u@gmail.com>
>
> dt-bindings: usb: ti,am33xx-usb: Convert to DT schema
>
> Convert the TI AM33xx USB Wrapper text binding to DT schema.
> Changes during conversion:
> - Drop the USB control module from child nodes, as it physically resides
>   within the System Control Module address space, not the USB wrapper.
> - Allow standard phy@[0-9a-f]+$ child node names alongside the legacy
>   usb-phy@[0-9a-f]+$.
> - Mark the legacy ti,hwmods property as deprecated.
> - Document required #address-cells, #size-cells, and ranges property
>   missing from text binding.
>
> > diff --git a/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml b=
/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml
> > new file mode 100644
> > index 0000000000000..889190431c9a0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml
> > @@ -0,0 +1,104 @@
>
> [ ... ]
>
> > +  ti,hwmods:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: Name of the hwmod associated with the USB module.
> > +    const: usb_otg_hs
> > +    deprecated: true
>
> [ ... ]
>
> > +required:
> > +  - compatible
> > +  - reg
> > +  - ranges
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - ti,hwmods
>
> [Severity: Medium]
> Will this cause a validation conflict? The schema explicitly marks ti,hwm=
ods
> as deprecated but simultaneously mandates it in the required array.
>
> Any device tree validating against this schema will emit warnings or erro=
rs:
> omitting the property violates the required list, while including it trig=
gers
> the deprecated warning. This prevents the creation of cleanly validating
> device trees.
>
> [ ... ]
>
> > +examples:
> > +  - |
> > +    usb@47400000 {
> > +        compatible =3D "ti,am33xx-usb";
>
> [ ... ]
>
> > +        usb-phy@47401300 {
> > +            compatible =3D "ti,am335x-usb-phy";
> > +            reg =3D <0x47401300 0x100>;
> > +            reg-names =3D "phy";
> > +            ti,ctrl_mod =3D <&ctrl_mod>;
>
> [Severity: Medium]
> Does this reference an undefined label? The ctrl_mod label was dropped du=
ring
> the conversion. Referencing it here will cause dtc to fail with a Referen=
ce
> to non-existent node or label error during make dt_binding_check.
>
> > +            #phy-cells =3D <0>;
> > +        };
> > +
> > +        usb@47401000 {
> > +            compatible =3D "ti,musb-am33xx";
> > +            reg =3D <0x47401400 0x400>,
> > +                  <0x47401000 0x200>;
> > +            reg-names =3D "mc", "control";
> > +            interrupts =3D <18>;
> > +            interrupt-names =3D "mc";
> > +            dr_mode =3D "otg";
> > +            mentor,multipoint =3D <1>;
> > +            mentor,num-eps =3D <16>;
> > +            mentor,ram-bits =3D <12>;
> > +            mentor,power =3D <500>;
> > +            phys =3D <&usb0_phy>;
>
> [Severity: Medium]
> Similarly, does this reference the undefined label usb0_phy? The label wa=
s
> removed from the example, which will also result in a dtc compilation err=
or
> when building the example.
>
> > +        };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-ti-am33-=
usb-v1-0-69ac5f92df45@gmail.com?part=3D6
