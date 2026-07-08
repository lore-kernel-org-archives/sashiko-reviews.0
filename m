Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F27E315D40
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 03:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783480353; cv=pass; b=YSmEldnpv+TlSpcka9ATYt9Bd567CG/WhONL2wzmtInesUEAWpNSnYJv2q+JMLyHTiO553xHZXofagmb73d/GsORactagCQVd5RLDuXAGv16PBG5bRutKS7PMmdTw8sRBf2ordw6bpbEWifA/aV1NlDFJVDRTC2t0a43pBj4Upo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783480353; c=relaxed/simple;
	bh=ILN8IqWlVii5tDTgoYcy1DZfpKUeUqRq4ICO9cvv4Sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RGGJR/qO7eSjlrTXxz0HUwNssj24JuAkKqFz0gHPhEj2NNLHFSsi5IvoCRzh7MR15H6iSP8/3QLpG2zImOm8BYSmp/F7IigTjuIu+fJFIeoR5WwnEh5J2s9ecH7YeFxCh+E3EroOaXYFljF7RUyLRAnm7LyGq1LC+0kCErunY40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJTKj1CF; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJTKj1CF"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6679d88abdcso267245d50.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 20:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783480350; cv=none;
        d=google.com; s=arc-20260327;
        b=RLV/Eae2DapmdUjzkVI/zskmqXVZC0ySnienDeyPDsMNDR6R68AYY28qDaD6hx5aTS
         adPFEEr2/1hZ6MwH/RG3EBuUsesry81GcfIMAtOrVfpooTibOHv2BF0vTztXRkCXU/tl
         h+d1aGxh7bayUMkJokrE0s4jP68agCLH8Jkjpygq8ak5yuuqtBBfFhbVEsPAmpsrqYGz
         rf08p3peiyNsLWqFDAIrxLpUZ6f1PAIrHHc0f3B6YXN/MpXZoOfSwdi5oRLE0hwdOf9V
         h8/cBj6iQZrngqof9UYNLzIOC7I2ZclOXTbqoJ/JI7k3H2066MrynQyhyb5OYIZJcuYx
         9mcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oknk3tQlPfde8xc17K9qMsBqym5928PvQ8Kp/qRXs20=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=hygLblEuzS8F1WiyvGLYTUOP5dTrJTz0GzRbXWXtfaK9NNPSBiBFw3s44fjGq+eUTc
         wcAdHdtSPr3rjErCgV+gn9Dn53lMO9Fg5ORCVdq1YgvK/u3mEfZ7JGmmICSjG0RiRvXv
         X9h5kA5YBuSu/gEY+REPpydAaWZBRqKUonQ+zLp59YCi1RzVbQPlPvWb0vhzZm992fnN
         cfGLNj4QFt2L2J+yJ1UQtT86C2+lObNMBY1VWQ/BE3h9ja/oaNWRo7Z4Wylkb27pd1GR
         H+t8tYANNcSd8vD6IrgZi/zihMZ/AimoscqRovjGYl2337+lDHW6ywSx/D5+0u4di+7K
         A9tQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783480350; x=1784085150; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oknk3tQlPfde8xc17K9qMsBqym5928PvQ8Kp/qRXs20=;
        b=sJTKj1CFVuCRE7/RxtfLpycmJNDsDDuzlSGlU3vr/g9zrKUygVnyaIdVTsRUralZm3
         t4hInupK0JIth5161wA9WkBU+cUcSXsosNK2CQo8J1eAuHAnEP33taEVwHS3iv17ETpm
         TBbS10xiqSlGdhf13cN2MRO7c4k4MK5ppWWPs1erybyDTYEE7P3NOZUEKtIpEWyN1xNG
         PLG/9ftf1LxRSNBLIGI0fJQXWc9uhXp8rYgxUU5+a2c0O7Cyhg4zfc8LgIhZ2qxG4/Vo
         Xl1Tqn3p1FGJpl+9kKAbhvGZsM+vzIjt9Bzadi9de1OuIyfECNj7X/mB/y2ngGc9A5xV
         lM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480350; x=1784085150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oknk3tQlPfde8xc17K9qMsBqym5928PvQ8Kp/qRXs20=;
        b=gheZENfz+QcPlX2DI3SWN+TIgAkz//IUsUlrEagrANT1+GVSmvqkvaDaFYBDSnxcsV
         jlRJCK9OGqBnBXJOdaWltQlCFHAHNKNM/ZLbh+ZxCKpPJFuhQqlXlVDNEk67wHNMFUn+
         SCc+fqSsmbt6TGo9tpZ+kkRRZOfDtLVHxyVm8Px6vEvRkTUDTeoDYyz7iEk1HiSPMDDN
         1P57eAVjHuhsXEC6uhdsRvawGwsFZZkf4fGj3F8cxtyD/mybQvd8pXyoYvzs98wdtdL6
         rBwCnBBTZilyuCvtjWhxE9NJ9KYM4VpgHB6MMuNYj3al5zpo7mmS82LAStYBuVUhsEeh
         VCdg==
X-Gm-Message-State: AOJu0YyAH7/bjgfL5iyb520uJ+k9ES8YUmQwyy2aNYvLM8EsV4jPpGON
	Nv29oL1YphYdJSlEMbolvxrsAnzpOcsANwY09RlAGJuz1IWP/bXkm6Ami7nqGHur6U3PERq/Flf
	AkLUtFSlSoYW+CK28EtJJpMnIWg6kaJ3NoPvmQSg=
X-Gm-Gg: AfdE7cm+zeo7S5L5aDlE8Q5dke0uvIGZAkhUoPym6JRKxTsK7j/6n77ylBd7Qjv5k8f
	mE0rIbbiGZCt1wWec1WVaOONcRocsetTlv3EcQVJbUfWjZpKFwrhoR1dsY7qeMf7ea3EPWtbEKH
	Ku6hxdPkGUrc4q4TMOQ8v1Jdq3QnpQpGunAtjPCZ+7paOpAN6VcFpAxecZdkDYYSdLC+rdtz3yH
	WZBqmTB4jJxD+fFjdi+ftomJyfm0OQpQzJvLtIBXvGwXtTqKnjb+amcvj8UMQ79mKLANdHeiGc=
X-Received: by 2002:a05:690e:419a:b0:667:9d88:97d9 with SMTP id
 956f58d0204a3-6679f2b8499mr482158d50.92.1783480350407; Tue, 07 Jul 2026
 20:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708025807.702010-1-lgs201920130244@gmail.com> <20260708031033.9A4841F000E9@smtp.kernel.org>
In-Reply-To: <20260708031033.9A4841F000E9@smtp.kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 8 Jul 2026 11:12:18 +0800
X-Gm-Features: AVVi8CfMvikuhwz5NNgv52z_PV_C2pN5QQQp8tt_xNQqx5A8YCzihoOQ41MZ4sw
Message-ID: <CANUHTR9R23PRS0peRy5H=p9=HVi=CBoL+X8MDVe_C6EcG24Byw@mail.gmail.com>
Subject: Re: [PATCH] libbpf: Limit bitfield dump reads to checked bytes
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Sorry, this email was sent by mistake. Please ignore it.

On Wed, 8 Jul 2026 at 11:10, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The patch introduces data corruption and undefined behavior wh=
en reading unaligned enums on Little Endian architectures by shifting a 64-=
bit integer by 64 bits.
> --
>
> --- Patch [1]: [PATCH] libbpf: Limit bitfield dump reads to checked bytes=
 ---
> commit 128a41a5de9f0bf022f4b652bb58245609c3162a
> Author: Guangshuo Li <lgs201920130244@gmail.com>
> libbpf: Limit bitfield dump reads to checked bytes
>
> This commit updates btf_dump_get_bitfield_value() to limit the bitfield
> value-building loops to the same checked byte range instead of the full
> backing type size. It aims to prevent reading past the checked range for
> narrow bitfields.
>
> > diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
> > --- a/tools/lib/bpf/btf_dump.c
> > +++ b/tools/lib/bpf/btf_dump.c
>
> [ ... ]
>
> > @@ -1784,13 +1788,13 @@ static int btf_dump_get_bitfield_value(struct b=
tf_dump *d,
> >        * stored in num, then we left/right shift num to eliminate irrel=
evant bits.
> >        */
> >  #if __BYTE_ORDER__ =3D=3D __ORDER_LITTLE_ENDIAN__
> > -     for (i =3D t->size - 1; i >=3D 0; i--)
> > +     for (i =3D nr_bytes - 1; i >=3D 0; i--)
> >               num =3D num * 256 + bytes[i];
> > -     nr_copy_bits =3D bit_sz + bits_offset;
> > +     nr_copy_bits =3D bit_sz ? bit_sz + bits_offset : nr_bytes * 8;
> >  #elif __BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__
> > -     for (i =3D 0; i < t->size; i++)
> > +     for (i =3D 0; i < nr_bytes; i++)
> >               num =3D num * 256 + bytes[i];
> > -     nr_copy_bits =3D t->size * 8 - bits_offset;
> > +     nr_copy_bits =3D nr_bytes * 8 - bits_offset;
> >  #else
> >  # error "Unrecognized __BYTE_ORDER__"
> >  #endif
>
> [Severity: Medium]
> Does this change introduce data corruption for unaligned enums on Little
> Endian architectures?
>
> When bit_sz is 0 (for unaligned enums), nr_copy_bits now becomes
> nr_bytes * 8 (e.g., 32 for a 4-byte enum).
>
> The code immediately following this block in btf_dump_get_bitfield_value(=
)
> calculates:
>
>         left_shift_bits =3D 64 - nr_copy_bits;
>         right_shift_bits =3D 64 - bit_sz;
>
> This results in left_shift_bits =3D 32, and right_shift_bits =3D 64.
> The final shift evaluates to:
>
>         *value =3D (num << 32) >> 64;
>
> Shifting a 64-bit integer by 64 bits is undefined behavior. On architectu=
res
> like x86 and ARM64, the shift amount is masked (modulo 64), meaning >> 64
> executes as >> 0.
>
> This results in (num << 32) >> 0, returning a corrupted value instead
> of the expected unaligned enum value.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708025807.70=
2010-1-lgs201920130244@gmail.com?part=3D1

Best,
Guangshuo
