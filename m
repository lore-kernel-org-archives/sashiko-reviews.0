Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A53E7BAF
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 20:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783543734; cv=pass; b=UPFR8ngTkfQCQJdfwdjokQWXKJRhMsBdPkYn1qLpEcEGEyhqj8Vr8c9H1YXQSZZL7xOdr+FUgacoBYbdqdidnubQMlN2FeWz/HovwbkjbtrEf55fxkf0oWZxFZdLp8KxRkGE9iuWPedaH+PDvAw1Fe7ubIPAYzD/ZcQ7uGBOMDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783543734; c=relaxed/simple;
	bh=9BJdBJoh6bO5JgM9sko/x+9Pye2uwMOLk+dxbigAcs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K0WCj4EESTW2DeavHSl30Dx24CDeSjC02ZhqbuOqTMz4jxOiNrggWfLtZugDn5yj3xqLXyjLQgug73PTQR+oCAQzT+un5RVnDjMDdAKNS6JOJmsspUV18dyqjl/zbsSX2beyGpbel2ChKrab60XaTzgxLwWmPq2CZOwQFAFmagM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgRnFZps; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgRnFZps"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-664b05d408bso1046408d50.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 13:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783543732; cv=none;
        d=google.com; s=arc-20260327;
        b=Q7W7DEAYH8sSyN/XIw0X+i5LjVXyxKqA3XgOsEQdkAJaIEE3SinGiMCTVafwas+SbW
         dPWtz3cAz0uI+BvHlpiyZsEWKHqZpm7tSA0hafvhnyMEa3iuckZttlvA5MZ9vg6tVsqO
         209vW+EchGIbUiJ+rlTb3FfHijcHCOVvmlbB5OdvRNJEao8GNjYIXcozdLMvIoZSjym5
         xyTt5LUzT7WQ6oSt3NSO0OKIDxPbjlTNhVVfAqmRpfIT5OU7XTACO1VigcM4zzbGf8EV
         cy0VP8CG/ONp1gsdC5o6Lrjsob6hHYfJlAh3JSbaIlJNlQUqVs9N1eCjJIB0kebAWzrf
         Z4Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Su5iC7GyWFqasMSbo6foK0Ud8wXMN0xjdKWMhHqwlc=;
        fh=5cs6b6d7Xpq2ANmcE1sW6J73OLOoOdfaXy4E0BsYxz0=;
        b=Em2hWcx0QBkhjPuQmYMjg6rONadFyZ5x/tq5ftBrxmAHwv7378UmszuiBePR5j528c
         Y72N0NRXdjHzXFlRHVAFbyDd689EF3/9lTJli62iXpbM9uBbi8TMvdL7Mze8Nj+nBICw
         jx/3afZmIm29YKRbFS9LfMRkczOuwXihUBFq6C0mjOqoLizDiQPpICkTwtAwMRVJ3CQO
         zEJfzhfRmlwyOM088KvX1yJv6817Bz1SmAJRMl8jizwurZVyhPh0C1IR8tAgIVvyCbN8
         qxfGrz2zpAyC3jp86UgIsWR8fHjdgd/fCmKqmfZP47jhgAZPCrdNpjvShJGl/H6xpdPC
         rZng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783543732; x=1784148532; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Su5iC7GyWFqasMSbo6foK0Ud8wXMN0xjdKWMhHqwlc=;
        b=TgRnFZps7I1E+g6U7IEiT31F+sHEPkCD5BDApjBFsdVKsLxH9JpOJVbLNfmxIeh1pt
         fkKLR3ScdwBVzjPChaiSyuTglomi5KSPy5q8b7uk+5kpqX/RgXVpk9iRPBBxXrD25bQC
         OGNuRdOEba3c2fu5Ap43VE1D8swaQzpQACZN5O5d3NlRrgPWeU69wIsOMwb0zStvqJjb
         jynaK437ylO8AC+znDiN/lOio4cy1rzWrXj5PDTs23JXLVprHLd3Wtb/WxJB/ZHWp+rP
         2Hfoq6toiubhSs9qvWZF8r4HOO8El9NT0PzUazkyfp9XQWirKrQyTxJJqPfhDtQpjM5T
         Vptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783543732; x=1784148532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Su5iC7GyWFqasMSbo6foK0Ud8wXMN0xjdKWMhHqwlc=;
        b=oLknkD0uayjqnY/ftQm21EMqDtsAMtGrfbIGVkmiRx0M+PVC6Yz86B0fhIs1HYCs5e
         /cGHGR7IvJ9+6Dl8GGYYurVkJY3QdqwxjTi+VpdLl1/WWaW/LPsDrgj/5/PSzuvEJqiW
         DPli74KeN3pHS4vgglgaOw8BCyqfAgyS/Ch6kYjsbOxd0SIw/ZC72Aos5dr5p8G0scm/
         jAboe/+JWum/HFMK1k1qT5BIOePEabGpXSyShO9g8ATBRbe2U5VC7f2GKNsl32qf9XAC
         kY4BG7voMaRCm2SZvysJ8W+3I3xGEjyQSfGGTXVVgpO9vzPZFQZCtRk8YR2ONIn7WFr6
         OChQ==
X-Gm-Message-State: AOJu0Yw6mmbc7uQmH2+9FH0A4pgYgr+6SpAlGlDXT/pwQK1Kj4po6mgD
	GuMsTMYp3GY6WjCGqBC+tBI8p5MFd4wbKOa1hzWT0m37LDi+V7Ki3CGU7kbpQrlFVT4goYdZQJw
	hgd6bV0L/WWfReyIH6S8I1grAkY2T7ESNX34z
X-Gm-Gg: AfdE7cmWW6MwRNvwaj7mZlIum3St62MdbEeRPUsFLIlQ1DJOGHTdQIc8qGf1o1vxu+P
	8kHJvjfXWFaTkn2K0sAQg8ANuPGmN45Nu7uAvHdsdHrCnvrUncCvp7y0NPLCWpemKncfZ0y1JTj
	gkjF9IqJDM87QssPiUhciSJvRTm4Acr4VJr0iiAZGsv223NegKhkKyrdOVnYq+H0Lou1xVkX1gK
	WxKBHuFWke0qOxnZgnRXVexG9u80ahq/j4e2xlDelEmZVVRGPFRz45FC5h569eIpvM8iT6D3xB/
	p/WY
X-Received: by 2002:a05:690e:1348:b0:667:b08e:2a2 with SMTP id
 956f58d0204a3-667b08e0ae6mr1729856d50.27.1783543732085; Wed, 08 Jul 2026
 13:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
 <20260707-dd-maint-2-v6-19-381f3edb0045@gmail.com> <20260708023725.52B9E1F000E9@smtp.kernel.org>
In-Reply-To: <20260708023725.52B9E1F000E9@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Wed, 8 Jul 2026 14:48:24 -0600
X-Gm-Features: AVVi8Cef1o43P0BcIrbKibkv5LgOWcV8WhWKRwgZJ3xzNcwlJwrD7Ugwb6QN5b0
Message-ID: <CAJfuBxx+5i4z77hC5BEDkyegE0FWjGRfBfWM6M_nkk94btfO0w@mail.gmail.com>
Subject: Re: [PATCH v6 19/24] dyndbg: pin class param storage to u32
To: sashiko-reviews@lists.linux.dev
Cc: linux-modules@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 8:37=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Support for classmaps with more than 32 classes is broken, cau=
sing undefined behavior on 32-bit architectures and silent truncation on 64=
-bit architectures.
> --
>
> --- Patch [19]: [PATCH v6 19/24] dyndbg: pin class param storage to u32 -=
--
> commit df6ebc9b56fab43581ec7860d30aab6f33272ee2
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg: pin class param storage to u32
>
> This commit changes the storage of dyndbg class parameters from unsigned =
long
> to u32 for consistency across architectures. It also shrinks __drm_debug =
back
> to u32.
>
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index d99c69b9ad12f..af05f4ae3b55e 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> [ ... ]
> > @@ -643,24 +643,27 @@ static int ddebug_apply_class_bitmap(const struct=
 ddebug_class_param *dcp,
> >       int bi, ct;
> >
> >       if (*new_bits !=3D old_bits)
> > -             v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_=
bits,
> > +             v2pr_info("apply bitmap: 0x%x to: 0x%x for %s\n", *new_bi=
ts,
> >                         old_bits, query_modname ?: "'*'");
> >
> >       for (bi =3D 0; bi < map->length; bi++) {
> > -             if (test_bit(bi, new_bits) =3D=3D test_bit(bi, &old_bits)=
)
> > +             bool new_b =3D !!(*new_bits & BIT(bi));
> > +             bool old_b =3D !!(old_bits & BIT(bi));
>
> [Severity: Medium]
> Since classmaps can theoretically contain up to 63 classes (as mentioned =
in
> the commit message), is there a risk of an out-of-bounds shift on 32-bit
> architectures?
>

A macro in a later patch (not in this series) limits a classmap to 32 class=
es,
which is a practical limit for usability of classmap params.
As a case in point, drm.debug has only ~10 DRM_UT_* values.

64 is a per-module class-id space, allowing modules to have several classma=
ps.
a classmap's base/offset lets it map its 0..31 range into upper class-ids,
which is how a module can have multiple, non-overlapping mappings.


#define __DYNAMIC_DEBUG_CLASSMAP_CHECK(_clnames, _base, _mapty)         \
        static_assert(((_base) >=3D 0 && (_base) < _DPRINTK_CLASS_DFLT),  \
                      "_base must be in 0..62");                        \
        static_assert(__DDEBUG_ARRAY_SIZE(_clnames) > 0,
                 \
                      "classnames array size must be > 0");             \
        static_assert(__DDEBUG_ARRAY_SIZE(_clnames) <=3D 32,
         \
                      "classnames array size must be <=3D 32");           \
        static_assert((__DDEBUG_ARRAY_SIZE(_clnames) + (_base)) <
_DPRINTK_CLASS_DFLT, \
                      "_base + classnames.length must be <=3D 62");       \
        static_assert(((_mapty) >=3D DD_CLASS_TYPE_DISJOINT_BITS) &&      \
                      ((_mapty) <=3D DD_CLASS_TYPE_LEVEL_NUM),            \
                      "unknown class_map_type")

So while its currently possible to define a problematic classmap,
that will not be possible soon.


> BIT(bi) expands to 1UL << bi, so if map->length is greater than 32, this
> shift would exceed the capacity of an unsigned long on 32-bit systems.
>
> On 64-bit systems, *new_bits is now a u32. When it is combined with BIT(b=
i)
> using a bitwise AND, the u32 is zero-extended. Will this cause new_b and
> old_b to always evaluate to 0 for classes >=3D 32, silently ignoring the
> requested state?
>
> [ ... ]
> > @@ -704,24 +707,24 @@ static int param_set_dyndbg_module_classes(const =
char *instr,
> [ ... ]
> >       case DD_CLASS_TYPE_LEVEL_NUM:
> >               /* input is bitpos, of highest verbosity to be enabled */
> >               if (inrep > map->length) {
> > -                     pr_warn("%s: level:%ld exceeds max:%d, clamping\n=
",
> > +                     pr_warn("%s: level:%u exceeds max:%d, clamping\n"=
,
> >                               KP_NAME(kp), inrep, map->length);
> >                       inrep =3D map->length;
> >               }
> >               old_bits =3D CLASSMAP_BITMASK(*dcp->lvl);
> >               new_bits =3D CLASSMAP_BITMASK(inrep);
>
> [Severity: Medium]
> Will this silently prevent enablement of classes >=3D 32?
>
> CLASSMAP_BITMASK was changed to limit the generated mask to 32 bits, but
> map->length is not restricted to 32.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-dd-maint=
-2-v6-0-381f3edb0045@gmail.com?part=3D19
