Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602E13B4EB3
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 21:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783720429; cv=pass; b=DUy5lbD7xXhrUdDvJV2qfuYUsE1ypGMrPnqA/gp8x9ycRgCVDcV2UG621MF1KNGHBAkUSlzW8epegtJ7qn/jTSOu0iP391Aed8c/j6fgQwISS7xvjHIEDYf/+WaNY3Tq7ry4l6nk5+159nY1Lhr4DfVGqnObJKtezs96pEgn6pI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783720429; c=relaxed/simple;
	bh=11MuPmJZKp7P6An3z5S/ki+AVc8RJ/2v3t7law0viKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WjKJIFIXO3UOgifoAylQTygvrEvxdtbPhhs39rmCZmj/b3nw5ZP3TkCykib5b70rRY1WMJTLQpfeRPpBYrfA7SIrLiRBt1I9jcwGsF1b1E0sHLF20U8bvrpSeJEJ9B5k8fmlchGm3uZqdo0cOjJtX0Qds+CcFKo6H4mMMb96cKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZeciEjy; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZeciEjy"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1182526a91.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 14:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783720428; cv=none;
        d=google.com; s=arc-20260327;
        b=G8+RLt6mr5fZpHcll9AcOS+/2TcRlXWnxrcrlOogXUSwKo+c9n94GXd+2eQU7lzjgL
         Yc4ZpjxAasiF3QzV7rzKNmGgundnYfhK/zCnibceOPKuGvxz4Yk792o8bpDCXS9EHYHC
         jB17V9yXeUHpjxUMb/SDTMKQdwAfZ1jzbTK+hKS8JECwnmjiXqUTIgKC4PdI3AeWXgWD
         +znHdk4JilJT4/YIZsnEDJzB8KkeYnBzUP9yvqG3OuPnSA3hsw5knVvVyiJwUNGszI5i
         0I+NUejlxrEDuvOYascYoj34JTK29N+7pZ2NNznXsre3hcd9b+EN69WK66JY1zv+SQf8
         R55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1lPM681/F0Zd9+Gz8WdUtiAkD19dEnXD5xoNuwGJ/pw=;
        fh=+Ki+OwhlPfVBHxJyTVO+M74S/Fgkc3VVg9QQq+9jVik=;
        b=Z2BIrboU0XbQI8j11y22XvwfOcM5WFSUL5HnrhLjza9kxgFZuHRaD0GxP5roFHYNbP
         /VOarXgrNiESP1VQ5L3xBQJN8VT5BmIaqY40yHH1wYmqiP3y6WsQSCA/i2F2vgMknJAW
         PzxqdcglRil+b6TZ/DoXIpkx4PakJff7zgEtHDghdqvaQmnSYzcJdsWBsJb0h+33rj6D
         mbbJSNSV1WZtmH/VG750SkXLoYe/6qtJt/epkom5Y7k+cW5h4Qyoqv2S3ppU9ud63NRg
         BXHBJ1twAkIRuTiMV9UvjXRvzEDTEbdOknp/ZMcFgvHLNMfWQh9jnA2uK9pt11uZjf/w
         uz2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783720428; x=1784325228; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1lPM681/F0Zd9+Gz8WdUtiAkD19dEnXD5xoNuwGJ/pw=;
        b=dZeciEjynJl9I84JpgpSbvV40mKOyEo5VB8SyEySNBjtBUBCR4QVFU6fc0xJAcNvK6
         FfqC9ohClJOZH8d1aCP//S3wvjl8xvpq21X22yCrV2J/2pkcgNw58Ha7xo7xx9wIbCux
         4QeNSKkRHnU6mA2xuyZ6NmApKyLGHHXwQ+QoRYtz57t9N8TvR5qpjhYYjVTZ7ig+PwY2
         bQ83kZsxECLhjXBgxzve/Sf5GtJ46gze6YYtSwlPrIa0ymtPENbJu4w0HJUIAUyuRCFj
         agCLtuhcihsW1bFzthW+H/rjlzjOWlnoZKJwNDmCQwz1AK6h135wfTyyKyZBPkSYLVeX
         QIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783720428; x=1784325228;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1lPM681/F0Zd9+Gz8WdUtiAkD19dEnXD5xoNuwGJ/pw=;
        b=tFthd+WpQrsO5Eq47dOGtwHH1jm+i7HYl5YXCvn96jkRi8G9xT0Xe812el3Qm5CIdu
         nLU5+QgRlz9e9lShE+ayURtcs+WmiedeG4a9ASkFFPBJOELBZWbKqdtbvXd8qU28JPL9
         z6x7exPwVO8QzBnC3rcmBcMowqE2F4K8wC0QGOk1+6wUzPb+eaJj2jVozp1H5d2ewP5O
         JO34P7OF0H8wXdym/Vug7bXkttVelI1XDvfayX7GBQiCTM2rzLjJyaDPTmeg+pi1PKBi
         pxeI0YNrDRuIHa/JfJCvAMUgell5YX01N9VX7YlMc/v7qOQTm7cv2bLHoEE2VZZKaT+j
         ZVIQ==
X-Gm-Message-State: AOJu0Yyw32HVwMUT1C/P9OHAxOFnpE24ap2b8+wnthCg0HGRcfy7i3mq
	KW+WvDgfMPXBYajfOltRMPzHwH1acR5g0JDzsWHPl7Bm07/dvLPVcmvPWwdiur+/b3Vltv7Ci/5
	indwanIxXt9g1SFthXZcudKTTktt9plBd8tZa
X-Gm-Gg: AfdE7ckebk5bMwiBjUK77udI+oy0QZoF1dtNMXQeZI/kAjSgWD7wDEj3g2E15kkfx2J
	L5EXL5q40sc6RvpqAYGlV8djCneRgHywguIuDLxLPma6B4soMcyu6dVgAb69r+IiklVyxAtCpnQ
	E2/OfAnbKANv2ET14NBtAOnSeS1V3QQNPFXwXOx0/gzo2+vf3VgLd5u3TZGQjA6Mht3UlkjnoYF
	9YfuTDliLQNca+Rn9SVmPas6jS8fXdqOMx+pqLjN4ti+u55jC5n0mSxUuQFCpE1JV7g8lIe9e2n
	q4URjd5yV9wYYAuoIKFfeHLoW2FLq8Ip/MQ56CMKES7g6lWB2wzr3u15FqVltyQj
X-Received: by 2002:a17:90b:4b01:b0:37f:9ce0:af32 with SMTP id
 98e67ed59e1d1-38dc7b7bf56mr540855a91.29.1783720427703; Fri, 10 Jul 2026
 14:53:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <178345549172.94179.7948304165383170781@digiscrypt.com> <20260707203352.97EDE1F000E9@smtp.kernel.org>
In-Reply-To: <20260707203352.97EDE1F000E9@smtp.kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 10 Jul 2026 14:53:34 -0700
X-Gm-Features: AVVi8Cd52ZVu6AqJOCRcj6EDOi1eaBLzp91fUWkkr2lJrwGsornZjA1xUYv5e3c
Message-ID: <CAEf4BzbBqysGiHFuEW0b+tg6uA-gv4s8gGCeF_QZ-L3nhDc8yA@mail.gmail.com>
Subject: Re: [PATCH] libbpf: fix double-free of distilled base BTF on .BTF.ext
 parse error
To: sashiko-reviews@lists.linux.dev
Cc: Naveed Khan <naveed@digiscrypt.com>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 1:38=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] btf_parse_elf() incorrectly uses IS_ERR() to check the return va=
lue of the public API btf_ext__new(), rendering the error path and the patc=
hed double-free fix unreachable.
> - [High] In `btf_parse_elf`, the out-parameter `btf_ext` is not initializ=
ed to `NULL` at the beginning of the function. If the function fails early,=
 the error path reads the uninitialized pointer from the caller and passes =
it to `btf_ext__free()`, causing a crash.
> --
>
> --- Patch [1]: [PATCH] libbpf: fix double-free of distilled base BTF on .=
BTF.ext parse error ---
> commit 343ec621fb0622b822c4fef99c23ee0947343232
> Author: Naveed Khan <naveed@digiscrypt.com>
> Subject: libbpf: fix double-free of distilled base BTF on .BTF.ext parse =
error
>
> This patch fixes a double-free in the error path of btf_parse_elf(). By
> deferring the ownership transfer of the distilled base BTF until after
> .BTF.ext is parsed successfully, it ensures the base BTF is freed exactly
> once on failure.
>
> > diff --git a/tools/lib/bpf/btf.c b/tools/lib/bpf/btf.c
> > index 823bce895178d..35695f33c6942 100644
> > --- a/tools/lib/bpf/btf.c
> > +++ b/tools/lib/bpf/btf.c
> [ ... ]
> > @@ -1530,6 +1527,9 @@ static struct btf *btf_parse_elf(const char *path=
, struct btf *base_btf,
> >       } else if (btf_ext) {
>
> [Severity: High]
> This isn't a bug introduced by this patch, but immediately before this
> else-if block, btf_ext__new() is called and checked using IS_ERR():
>
>         *btf_ext =3D btf_ext__new(secs.btf_ext_data->d_buf, secs.btf_ext_=
data->d_size);
>         if (IS_ERR(*btf_ext)) {
>                 err =3D PTR_ERR(*btf_ext);
>                 goto done;
>         }
>
> Since btf_ext__new() is a public libbpf API, doesn't it return NULL on
> error rather than an ERR_PTR?
>
> If IS_ERR(NULL) is false, the error path is never taken for malformed
> .BTF.ext sections. Does this effectively make the double-free issue
> that this patch fixes structurally unreachable?

this is a bug in existing code, IS_ERR() shouldn't be used, I fixed
this up while applying as well.

>
> >               *btf_ext =3D NULL;
> >       }
> > +
> > +     if (dist_base_btf)
> > +             btf->owns_base =3D true;
> >  done:
> >       if (elf)
> >               elf_end(elf);
>
> [Severity: High]
> This is a pre-existing issue, but I have a question about the cleanup
> path below this done label:
>
>         if (btf_ext)
>                 btf_ext__free(*btf_ext);
>
> If a caller provides an uninitialized pointer (e.g., struct btf_ext *ext;
> btf__parse_elf(path, &ext);) and btf_parse_elf() fails early,
> isn't the out-parameter *btf_ext left uninitialized?
>
> Could this cause btf_ext__free() to read uninitialized memory from the
> caller's stack and crash? Should *btf_ext be initialized to NULL at the
> beginning of btf_parse_elf()?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/178345549172.9417=
9.7948304165383170781@digiscrypt.com?part=3D1
>
