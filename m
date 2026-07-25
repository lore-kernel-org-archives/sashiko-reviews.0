Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1128E258EF3
	for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 08:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784968101; cv=pass; b=DLSTHf0fw/DRKCeLI6P8qiXjmF92SgzDaefCbitN/s4Bq2i8Co/Imn5JKfnJl9Lp0MYgQwu3kA9h0BIRUgmZ4DXuTPpzNt9iOuQHDaIVDhLVKaosVHUNOQrvxbZ3Xy3iFFdEdA102cDExsybO9Vs1EkQLgzvviX4676y9SDDvoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784968101; c=relaxed/simple;
	bh=8h0g0m95UWMrdfOEm7SeeirxjnSOEFAGony6F3rR36w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=soy/Qr8ckOkXZlnNQlGRDIVPfCGcB9UOB9u8d35zJfbdY4TQaBU37Oi3lg0d6UUsYrR/Gvf5ZKxYPgiw7m655ZVXsXtHzROcd0Lm/Qty0ohd2lmYbVZ/Z9Zz+kdBVi99BrQZP//ogVknnqfQqIeYFtXc6OMePOwR7erOsoKk7rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Df2A0uxv; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Df2A0uxv"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-497e6956acfso815658b6e.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 01:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784968099; cv=none;
        d=google.com; s=arc-20260327;
        b=gRMYSaVJjuSl6dUvic+LQ06b/pR9m1Wv3p00oioaUukggWupWf8g6RnVK5z5/HfGDQ
         UMyhfHb1JkWzTKjz9Qwjuqds0JlF6BTydX/N5JvKGvnXFkR68tEk/V5550Ookk0t1MMc
         Ikho0qLy/PJeWwWWmQKgdvyPcFJXGob09+JWDbI4omlSU71/rbTK/JTcyGYAEBRBoYfX
         sCpXessZCd/5DUeuPuhHw4vEVpfm4x1VENPHkpEG+REwwYTyZ3V2UojVtWDGtKTFUxt+
         jTR1wvTopHr364XAvMr1Rw9KHMW3B6YgzseRYww6Ky8nygUNOF0loANgkI34ip2/33cz
         pLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tONE5Dm+YKr705QWohkzx3UlWr/5BV4hU/VR8deTz7k=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=X5Dnz/aGHJceX0Pu/lQ7pWHtvg0SQ6JPQvt3ddnzT0Tjp9V+WRvIKh2HTZodb51Vik
         ZMESvrdx8ZTIfnoLMwxjrh6YwJTNkI1lM71NcfF5va8H4JPjicV3v5P26a29+XaRr3VD
         mogTb2QE0o4xLtDuEpQJ7jeqPwE1y7WRJini9Gig6eI5xb1WZws/Y42a3VKTwDfpNw0o
         SvfW4pmk3obr9qLoFvX8e4jQ16g1YHjlCoV1DofHjB3U4D3CFQtnDafYxC3Kktbfn8rN
         9cHAlGbqtte5LIjwwBN99V8HxypWMfZIsgDe7jmP1y99bBOcBW2xoAkucwYAm2Bz9YhW
         ibnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784968099; x=1785572899; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tONE5Dm+YKr705QWohkzx3UlWr/5BV4hU/VR8deTz7k=;
        b=Df2A0uxvEWh+WQC9meEdaeJTyCFK/nJ7mlhB1vNycvax98IbFHQ7CnWWvojhbDCVFi
         oi3e8ATMR6QBEt6EIpa2ev0D5mdnTLmaq2JxkZ1A2OYmSqUkLblDBIiz+L7T5EUiQMst
         HbkWY/XsNc/cI2kAyAxzuaGgtBS+JwgfMyUWE/ismVXcHmhVgsWq2K0rDLYOMLiE9ZC3
         Ktv8ardNaw6NpMeUYgXlQoaHQB22QHt60tEKCf9MUbhs7nTzEu97GQaLfbJlp+mMivPi
         lx78dzZFBlAS7KpSaAjo/cqqgqhYskO4LxYAVoKoFXuv2+RAgRL3g2Np3HTaAKwTtFfO
         HrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784968099; x=1785572899;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tONE5Dm+YKr705QWohkzx3UlWr/5BV4hU/VR8deTz7k=;
        b=YA9xr4J0gi3M+egfNhmZEqebC0isKtw+mG6NOgZYbSSTEsi4BQ5tZk96kovpfgxYPp
         RQwCcNhPm94p52lpDA6sGpeBCni/B7uY5/KJ+07IFvpVLV0NF0BGmOPZqV2XANyOAVWa
         8D2UT4twBBZLl0oQYzu1O2iVXruAb0T/TExjvX1Ibc/FSS0F5XuWVKEszvq4+M5pz4aV
         qBWdJrqWHjN4BR/As/8iPDgQNJ3e1ydaRvGOzmmEVuhyDdHSXNXiVWbbJ27d91PKtB8d
         Ic9LWqSH+p/42n0e+nSgfe3T/bLL6NrnAFoMgFuUFBE1UBUE8Psj/innd+3NOOWwWbHh
         Hwsg==
X-Gm-Message-State: AOJu0Yy+xCECfNx2HX4IMtv9NHRYBng9yvgGPMnQcZOioiWscAQ8yeND
	ngg+liCoohbTexz0p1H8Lv2ms5CtDitD4/yU9N7ZqcKe89Qu0QuA2749yjzkpYE3Lr3gY/KArWy
	5ACk0EV8Sc6Ylq7yQMRGsToJD8R3rR4RNYQ==
X-Gm-Gg: AR+sD13sutwqBeyEMs5LWco5rpdqIOfjo4FnMQHgm6YAhXNNW/64tsIIQpXfTDJHcyV
	MBeejHKQEDRGFqxYKCVJWrhtmvrZkPREq1HK7nCerk6egJ3b+VXcKh8CUNmOgtE0yi5gInpdZHk
	DsSxlBAm+e9G+rmTD1XeBg7DXVRXCirMTlDxRA29KXNljbD8hKUI1cX9y6WcgusxpuCpC6tv9Ei
	Ok4b8aOV6R304ucf63j5sYZM47gw2bbJ6gAGCC5FlRX9aTvM610gQvf4taTOUf1xpQqnOSPZ46A
	BsViulSsAMOI065tBQ==
X-Received: by 2002:a05:6808:c3ec:b0:4a4:933:dc11 with SMTP id
 5614622812f47-4ab5e50e4d1mr2951836b6e.20.1784968098575; Sat, 25 Jul 2026
 01:28:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723164612.3146-1-arun07172003@gmail.com> <20260723165651.8E6501F00A3A@smtp.kernel.org>
In-Reply-To: <20260723165651.8E6501F00A3A@smtp.kernel.org>
From: Arunachalam T <arun07172003@gmail.com>
Date: Sat, 25 Jul 2026 13:58:06 +0530
X-Gm-Features: AUfX_mwIedfCh5RwppGaQE7cxxF1bdosGLyXndWq8tZpyP6oMNxIL0Otxvgo2LU
Message-ID: <CAB72pr2mQXigAzpNiPj6YQAREGnmcu-qBo1++3OnJJOfZfiwXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] leds: cobalt-raq: add missing MODULE_DESCRIPTION
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

I'll fix the capitalization in v3.

On the global default_led_config issue =E2=80=94 agreed this looks like a r=
eal
problem: default_led_config is a static file-scope struct, so cfg is
a pointer to the same shared memory across every call/device, meaning
values written for one device would persist and leak into a later
device that has no pdata of its own.

I'd like to fix this properly rather than guess, but I'm not sure of
the intended behavior in the multi-instance case. Is it safe to assume
each probe should always start from the original hardcoded defaults
(scale=3D100mA, num=3DISINK_3, iout=3D0) unless its own pdata overrides the=
m,
regardless of what a previous call did? If so, I can send a follow-up
patch that makes cfg a local copy instead of a pointer to the shared
global. Let me know if there's other context I should be aware of
(e.g. whether multiple LP8788 LED instances are realistic on real
hardware).

I'll leave this pre-existing issue out of the current series and send
it as a separate patch once confirmed, to keep this series focused on
the dev_err_probe() conversion.


On Thu, Jul 23, 2026 at 10:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [Low] The commit message claims MODULE_DESCRIPTION is required by modpo=
st for this driver, but the driver is unconditionally built-in.
> - [Low] The commit message description is not capitalized, violating subs=
ystem guidelines.
>
> Pre-existing issues:
> - [High] Unmanaged LED registration combined with managed memory mapping =
without a `.remove` callback leads to a use-after-free on device unbind.
> --
>
> --- Patch [1]: [PATCH v2 1/4] leds: cobalt-raq: add missing MODULE_DESCRI=
PTION ---
> commit f1b0026d062cbcf0e980882e66d901b8eb8e018f
> Author: Arunachalam <arun07172003@gmail.com>
>
> leds: cobalt-raq: add missing MODULE_DESCRIPTION
>
> Add the missing MODULE_DESCRIPTION() macro, which is required by
> modpost and was missing from this driver.
>
> > leds: cobalt-raq: add missing MODULE_DESCRIPTION
>
> [Severity: Low]
> This isn't a bug, but the subsystem guidelines request capitalizing the
> description after the prefix. Should this be "Add missing MODULE_DESCRIPT=
ION"?
>
> > Add the missing MODULE_DESCRIPTION() macro, which is required by
> > modpost and was missing from this driver.
>
> [Severity: Low]
> Is this description accurate? This driver is defined as a bool in Kconfig=
,
> meaning it can only be built-in. Modpost only checks for MODULE_DESCRIPTI=
ON
> in loadable modules, so is this macro actually required here?
>
> > diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-=
raq.c
> > index 045c239c7328e..5b5acaa8c3215 100644
> > --- a/drivers/leds/leds-cobalt-raq.c
> > +++ b/drivers/leds/leds-cobalt-raq.c
> > @@ -101,5 +101,5 @@ static struct platform_driver cobalt_raq_led_driver=
 =3D {
> >               .name   =3D "cobalt-raq-leds",
> >       },
> >  };
>
> [Severity: High]
> This is a pre-existing issue, but does the lack of a .remove callback her=
e
> leave a use-after-free window?
>
> If a privileged user unbinds the driver via sysfs, the driver core will
> automatically release devm resources, unmapping led_port. Since the LEDs =
were
> registered with led_classdev_register() in cobalt_raq_led_probe() without
> using the managed API, they remain registered.
>
> Would a subsequent write to the LED's brightness file trigger
> raq_web_led_set() and write to the now-unmapped led_port?
>
> > -
> > +MODULE_DESCRIPTION("LEDs driver for the Cobalt Raq series");
> >  builtin_platform_driver(cobalt_raq_led_driver);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723164612.31=
46-1-arun07172003@gmail.com?part=3D1
