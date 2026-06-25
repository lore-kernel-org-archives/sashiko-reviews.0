Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AF43A6F1B
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 09:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380831; cv=pass; b=cLsym9fI++4BqVtrOqI3zCVgkJcAVmV0VC2sgdiPRvChKgsd+kUQ8l9lBNpqbeci9UP5Da0meV5UIQwd753fV7bbxz5F4Y/nQe+BWi13MyZhMoPGTppOD5nYqsq+VD926Fhdh5V76WzQ2wFvOX/QDW7KZ9j9K8B8/mbABfKbK1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380831; c=relaxed/simple;
	bh=OHfzDZiO+22xCUVSG9DhOlbcNAiA0c8REP0YT5bVzR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lp5tcDx7UFW0nQNDEiKHThHMqZpwn9vYXP4xy1LGaLIVbSwOs2zMwj+06D5G9NsakFcYmYQSw/BwnODtgAuHZpFkLyF9uyYEuXFnoPmisygiXW2KlACV4OIHoKL5tQ46yHfaxG1oovYIhJUbDTBKHIUt4ATT9RJinHUZLJ6ihek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsXcjxO+; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsXcjxO+"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c88d4606ec8so768598a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 02:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782380829; cv=none;
        d=google.com; s=arc-20260327;
        b=iSrrg/qp7e2Anrfg4S/5B+POUDukc+9L6mAwbqCsl750d7uCHgrKqiPmtBOGVx5JGY
         NG36x2ohaCmZKnLAGQI/7aS8ubsTmco363NpelJxyh4Y6cHZ6Cux91MbGPacZdh5C3Z6
         FX0ACngLTMkDPFOMeOA1ifBhAQJ6Os8GSpX7ZyB6h7TxBCVYWGpbpMZUSBt1UmLA63mR
         0w1MiEwvNca7RNsaLTiy/J+WGC6m3U0oKjRPCqx0bH7FT+INBRJeUeWrUxDs09tRoxu9
         ffulB19FwK0YQ5ecQ0QgMX3cNbuuii/aaQ1vumw0RnbpLrtUcwqozkE5jcjt28Xhnafl
         igUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NeTcUSKNh7vn3DPm8mPGV6I8X3SxE2IeoHKBOqLxT7s=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=IJxTSaLL0HmfafN9CAX0fb8b8osiC6fkV0H5Cg6EsUrTNgXuFkTdOmJHbfxWdYewqO
         LJtUYjhc9/NrViGo57h87L9SU2sGeXltCc04pc93qJFErhZRYr5Ma4n4Viqvu0cfSZCe
         tMk3TjQNq4yqI6PKVB4r5EagmUzw2P2kVUVs/YPD+EyQH5jsYf0L+9e2z6Vc0ZHoQT38
         2CCZ591MfyiqM4JvgCwKwwNgSs7MUXmEO16U23DvTspVUqL7YC6c6Nz7X8ZeIunSEBwV
         5D0XG+Z/b712GEwdLT79CLieiM37fupmbXNmsKjT5gaTbeF4eBMOCr7UXbwe+q3mXaH6
         V4kA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380829; x=1782985629; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeTcUSKNh7vn3DPm8mPGV6I8X3SxE2IeoHKBOqLxT7s=;
        b=DsXcjxO+sLTOWn7x4XQVAwDT2dRF1Frwvqpikyioavf1Ka2rsqz31VSuaHiIhkHeZw
         6mgBC3jWJDBg9SlEM49kiPnrMz0XUXwLJYmxk4i+Z4ERDsf62X/GrfBeDvT83qrcLR7G
         m4YIeSPqxHvBelHzzYF1dqjbi3lMzcmmQEIwqqOxh9g0h664H88TGjFQE8jiyFHidHWT
         G8cnvD/yp+qL8nI/lPd5nL/1X21wyz4QDpKOBwe5kbkHY/6tv3x1Mhw7AUu+wzT0/28v
         3srStKie3vJuqqvRzLrtxqqiIdixQe9w4IQIJQ3TTKEoArVBxdBDuAVa/AuLBxoz7hHq
         BGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380829; x=1782985629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NeTcUSKNh7vn3DPm8mPGV6I8X3SxE2IeoHKBOqLxT7s=;
        b=YZXrX9rYv3p3Uyt/pmPx1oXYiThMiWqUxdMKudozkPN3HASkhXDd45SZvmu8aGpf7p
         YFBrlIM4AaTsSoktoPeNkrmE2QekZcFHbBIkrGr6nPIKevW4pKa6VQJ8Ad4+GkujFTpv
         yTDVFsqyB+wgrtsz8wpZDUuU42tnuFC9dyU7Cp5V1FarioUq3avG/RlRyfFYQ6d5aPN4
         /0vc1lvLzcXJFfPtXaOWJW44Z3p7BGzXAF6F2olMhiVB0oU0txfgmHDe/w/bOy09cfCD
         s1ipWWK8VRNTZV+1qM/IA26shsKpCHQNxo58+X4RxEB0nmzj0Zee4dAnthd9T+oG51z+
         dh6Q==
X-Gm-Message-State: AOJu0YxIJIIm305yMmQ1jxJZdSUZ4JvnVxup0AovKWyir5uNQsiTufjy
	AlCNf5NeN/8rEUXldvguelDy0UN87SEHZt2IJjryPLJHKV6pKWIBqkYtEc3IkRH+CI8Zij/CcWM
	CimZyWQFVfC5+h9yXgwp+I9VYIEqP924mWV3/Ju0=
X-Gm-Gg: AfdE7cm0egbSz5ZjodYBX9sQvjBdZJB+unQhxH8rihbKG7bUSSf1o9TzexdDrjvyFnD
	OMVrjEEE6ZxkOzHyNS7RkQ0LoYhWYwGp1B0vU+mAYV54wmQhbFHxCoTloPU58P+FBnJUpnF5KEH
	HH28OrLVolya5HoxYHOFCSAArfMfExos6l+dUKMsee0wD0OK3yLlHF9I2nEWLaTfUquTOu/rZcL
	DTkD+vCY8xRUZPsIoZuwz1h2RsePuzH6P5iLbHIlIlS1NbVc5JlsCgv34ZSMg5iyuwVI0btl3s=
X-Received: by 2002:a05:6a21:48a:b0:3b3:1c7b:ff7 with SMTP id
 adf61e73a8af0-3bd4b013d3dmr2153617637.46.1782380829609; Thu, 25 Jun 2026
 02:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625092721.238366-1-suryasaimadhu369@gmail.com> <20260625094138.3703C1F000E9@smtp.kernel.org>
In-Reply-To: <20260625094138.3703C1F000E9@smtp.kernel.org>
From: Sai Madhu <suryasaimadhu369@gmail.com>
Date: Thu, 25 Jun 2026 15:16:58 +0530
X-Gm-Features: AVVi8CfsHYSnakeHovcTcaZI38pNmBO3X7k9j1ewhVQt7YnLD6s_rVgjH6ruqwA
Message-ID: <CAB0uMAe0V5GL0M4tVFYag+4TsYskfiSk=+HANgM6hRb31KB7xw@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: replace empty modifier argument with
 no-op macro
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review. These are pre-existing issues not
introduced by my patch. I will investigate and send fixes
for both the unaligned access and buffer size calculation.

Regards,
suryasaimadhu.

On Thu, 25 Jun 2026 at 15:11, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Incorrect buffer size calculation causes out-of-bounds read and =
information leak over SPI when `startbyte` is used.
> - [High] Pointer arithmetic creates an unaligned pointer for 16-bit regis=
ter writes when `startbyte` is used, causing an unaligned memory access.
> --
>
> commit 5efb24fc5a4ff6b0f2481a7887082d742684defc
> Author: suryasaimadhu <suryasaimadhu369@gmail.com>
>
> staging: fbtft: replace empty modifier argument with no-op macro
>
> This commit defines an identity function fbtft_write_reg_no_modifier() an=
d
> uses it to replace empty modifier arguments in define_fbtft_write_reg()
> macro calls to fix checkpatch errors.
>
> > diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/=
fbtft-bus.c
> > index 30e436ff19e4c..2169f8d1d1b83 100644
> > --- a/drivers/staging/fbtft/fbtft-bus.c
> > +++ b/drivers/staging/fbtft/fbtft-bus.c
> > @@ -11,6 +11,7 @@
> >   *
> >   *********************************************************************=
********/
> >
> > +#define fbtft_write_reg_no_modifier(x) (x)
> >  #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)=
        \
> >  void func(struct fbtft_par *par, int len, ...)                        =
        \
> >  {                                                                     =
        \
>
> [Severity: High]
> This is a pre-existing issue, but does this pointer arithmetic create an
> unaligned memory access on strict-alignment architectures?
>
> When par->startbyte is non-zero, buf is advanced by one byte in
> define_fbtft_write_reg():
>
>         if (par->startbyte) {
>                 *(u8 *)par->buf =3D par->startbyte;
>                 buf =3D (buffer_type *)(par->buf + 1);
>                 offset =3D 1;
>         }
>
> Since buffer_type can be a 16-bit type like u16 or __be16 (for example, i=
n
> fbtft_write_reg16_bus8 or fbtft_write_reg16_bus16), adding 1 byte to the
> aligned par->buf creates an odd address.
>
> The code then dereferences this unaligned pointer:
>
>         *buf =3D modifier((data_type)va_arg(args, unsigned int));
>
> Could this trigger an alignment fault resulting in a kernel panic on
> architectures that require strict alignment?
>
> [ ... ]
>
> > @@ -62,9 +63,9 @@ out:                                                 =
                             \
> >  }                                                                     =
        \
> >  EXPORT_SYMBOL(func);
> >
> > -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
> > +define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, fbtft_write_reg_=
no_modifier)
> >  define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be1=
6)
> > -define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
> > +define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, fbtft_write_=
reg_no_modifier)
>
> [Severity: High]
> This is a pre-existing issue, but is there an out-of-bounds read when
> calculating the length to send over SPI?
>
> When startbyte is configured, offset is set to 1. The macro
> define_fbtft_write_reg() uses the following size calculation for the fina=
l
> transfer:
>
>                 fbtft_write_buf_dc(par, par->buf,
>                                    len * (sizeof(data_type) + offset), 1)=
;
>
> Because the parenthesis includes both sizeof(data_type) and offset, the s=
ize
> grows too quickly. For example, with a len of 63, a 16-bit data_type, and=
 an
> offset of 1, the size evaluates to 63 * (2 + 1) =3D 189 bytes.
>
> Does this result in reading past the end of par->buf and sending
> uninitialized kernel heap memory to the display controller, potentially
> causing a kernel panic if it crosses an unmapped page boundary?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625092721.23=
8366-1-suryasaimadhu369@gmail.com?part=3D1
