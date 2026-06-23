Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C063932F0
	for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 22:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782254512; cv=pass; b=rLsRRbK6g4C0XuHmlIKhjlmVK7hgloCGP/jfH0qMb7/qicy5co7Np/OCC8uyO6VZY5h6or5iuPM7XcCinuPENzaQ1aHmNz25WPQMlw16MJeuJSSvymGYvaAWhYlletuc02fqln5Ip5hlg3T7iXGbemgvmQVhH9+4Zo+nyQH3uoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782254512; c=relaxed/simple;
	bh=soLQGPwr2c20lUfAI4ad57Az8Rz3HH/aJVeIfGJALkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YkgXiV6CPbk27qqb9XAe+SZkwbqiymnG3wNupWauH5rugJdrUTwMf01VKfvE2vgBril+juT3ieWOIwmf3S5lPneJXXfKd/CMXUGCK1cXzIr69QYxc6fnQI2RSWUIStjF5ST7DNz8Aff4YpebV2jTHAgUSZT3wv78ztKJsbQI0VE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIZvSaDz; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIZvSaDz"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7e0b3db3499so4456757b3.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 15:41:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782254509; cv=none;
        d=google.com; s=arc-20240605;
        b=XwenCkyKVTjbIi+SsKWC2QYWiIbi9TJxNmWv1doBSuy78fxqBt6i9mfAdlOjqConB6
         M18IGzCygTb+Q5zOSUPncBggvLauoXEhwHMD1Fvf3O57g8sTZKrXyif/asce9LvmegW1
         JPnufGuQNa+ykcAn+5kLYhs9snh0O24qzHd/9z4VYmMZlNlfk2NarhN8xmH9y7/p2cmR
         49v5JfdpKOL4wpAmHPLuYjFJpi3L8hICN20SgS2ioymAiqaR4Gxy7zDASaTnUGRddaF3
         aXEZ319pB/L6ilmhKV6zl7A/F8VpzEhgk5LN2taRCCKeibxl1+m+yvJBNsHbHBDSOAYH
         AkBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jAGeEZmnsjWX0hms7jmjKIy+6+2pgzHwJvr4zj2qgIk=;
        fh=LRRJN14sqK7nANkWLlaXQE7k0YZZvLI1LL0GeYXTWdU=;
        b=aKaOOmuCuvVzVX0b35j9BlZ3lPu5HuCocPBPG9xNCWzLJz5AhaA3/l2I03U7wqYkkt
         EQkEbqra8xc2T8Du3+Kmds9jvGXgB7WhkTWK+hz9QLFgOUhAAhmWF1PKurE8qTVR9Kod
         BglIsMv1UYWOOt+fUYezz+v1QvpC3tyI3ef5x/0tKDcS4xllAypSAn8miLk+CHn/EGRq
         arlkYDznYH7m2U6SLZnBLMi0NUkmBaeGjzH7YNuRisjWkF5RD0HDJrxgSZdbT3QvDBcp
         Rc9MivaRLWjVqBkzrEixu5cV1jrexUGCk0wWYe10tZSCQVNOXKu7xrbq19WAjPWwkSSD
         mVMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782254509; x=1782859309; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAGeEZmnsjWX0hms7jmjKIy+6+2pgzHwJvr4zj2qgIk=;
        b=VIZvSaDz9daggJeKkkG0o/L9uQDEp4SF00F8NHm+xuD8Q1RQM4g7ETeAmZf166oZNf
         7GzkDxonvLpXBjaJVJGIgrADoiLSKY6jXNE7YpRNi0p9vdGyiT3FzW0aMH1+8pHflq45
         8U+LSDFxLUjo5AwsDqwIwtQtiW8rzqx4+OrDV2OsKVoEWB80vOSHsSN56onBNTIkptIX
         EJZSD53U2TAQl08Jcn61Ssc+dEUIDHJf9JB1jRFiRGo1jncucbzukcmziZ18fo9gO72K
         1sEonr/z6/Zgrtjl9osFMGiJIRV6/qxtw0yD6ysfPPwmJ1haZOHtaG2jgSslKHf9rdSJ
         5RpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782254509; x=1782859309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jAGeEZmnsjWX0hms7jmjKIy+6+2pgzHwJvr4zj2qgIk=;
        b=fJQDpfY4ZZOL62JWHIKoVRu/6zbQDB6OCzGUsUT7lf6h5tNYITrl/l8D7LqTWGF8by
         AEmo5enO+rTMVa5mTy+0hpocUmt/ZDaWIHoZhNfOmjA+zTogwpNzswf2jF+1InvzTyqD
         +Kh8XqXFYJvv5sCedUOhiWkYmqLLmbT9qQ9nYY384338jLbI2hSmzMryIppdsXGEtWEO
         IZ+F2dqsZStrzT59Zkk0VoX5H0H3EtmPp+WVde5XmXKoKIoO5+n5n8dHt/vLRWXGZQt2
         4UDSxbQB7k02i8MbjhgCYxMliqQ1svHW1DiKnWnZ+TKPhusKmWsXt6HDiGtkHW5uCkF7
         Twzw==
X-Gm-Message-State: AOJu0Ywo6V0H+SgjaXDNNPK645+2ZTDY0C/vUw6AKU4RlDtrXVHoSJyr
	rD3cJ308j+2LS0gKdK9hltB6mm1TFOd/9IEE27Zew+Qgwlu2A+PjHkNYwRxzjx3nr9MXTRZ6xkh
	8gExJJt1BsMR7It4KSIfH051M0fc+5lVpzQt0
X-Gm-Gg: AfdE7cmhf9FP/3X/9MG7+F9oH60BrfLQwBEdzau8Z45wXnpuzjZvPaf7BS2azl/Ms0I
	3cddBoi7h4bT6tEHd2IIFRQqNQYwbVSxyi0c81OEQoB3F2z1ZPeX+kBPY5zncbUOqySIQ7Czf8m
	gpOpJXRnNgLzO3WafalSB1qAJ/9a0OC2Q4hCq0xLivIgNTmbp6ht8UcZb7ifx5Z5/F8rJBqwYBo
	PC68gK9udjB3AZi2m9t7oKlFCLVOZNU0Vkfbl9N/EtDfRSAcMCiAoAjbHVpP5/9xPQm64UjQ91W
	NFrvlbEdVOsj
X-Received: by 2002:a05:690c:3705:b0:7c7:5111:5ee1 with SMTP id
 00721157ae682-807ef05acf7mr9868217b3.26.1782254509418; Tue, 23 Jun 2026
 15:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1782197377.git.chenyy23@mails.tsinghua.edu.cn>
 <703a2cbfeb17ae707fa4a003b795c5326cc0abb8.1782197377.git.chenyy23@mails.tsinghua.edu.cn>
 <20260623175111.60F761F000E9@smtp.kernel.org>
In-Reply-To: <20260623175111.60F761F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Tue, 23 Jun 2026 15:41:36 -0700
X-Gm-Features: AVVi8Cec7cFVv1FF8R5GRl1xYjWOl9PIIv4i0xy-Ury4tbYTOhCK-P6LigvfSzE
Message-ID: <CAMB2axMN6UWE8G_GEQ6S2RE0ajiti+uTa+6OZY=HCMZUp-mrKA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Reject MEM_ALLOC BTF accesses past
 object bounds
To: sashiko-reviews@lists.linux.dev
Cc: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 10:58=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] btf_struct_ids_match() hardcodes `is_alloc=3Dfalse`, bypassing t=
he MEM_ALLOC bounds protection and allowing out-of-bounds kfunc accesses.
> --
>
> commit ea4066197ea8dc72df56252849c8752b81c506d6
> Author: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
>
> bpf: Reject MEM_ALLOC BTF accesses past object bounds
>
> This patch modifies the BTF struct walk logic to reject memory accesses p=
ast
> the object bounds when dealing with MEM_ALLOC objects. It disables the
> trailing flexible array relaxation for these allocated objects, keeping
> verifier-approved BTF accesses strictly within the bytes provided by the
> allocation kfunc.
>
> > diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> > index 15ae7c43f594b..3e68af9c1a5eb 100644
> > --- a/kernel/bpf/btf.c
> > +++ b/kernel/bpf/btf.c
>
> [ ... ]
>
> > @@ -7441,7 +7445,7 @@ bool btf_struct_ids_match(struct bpf_verifier_log=
 *log,
> >       type =3D btf_type_by_id(btf, id);
> >       if (!type)
> >               return false;
> > -     err =3D btf_struct_walk(log, btf, type, off, 1, &id, &flag, NULL)=
;
> > +     err =3D btf_struct_walk(log, btf, type, off, 1, &id, &flag, NULL,=
 false);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but hardcoding false for the
> is_alloc parameter here completely bypasses the newly introduced strict
> bounds check for MEM_ALLOC types during struct matching.
>
> Can this allow a BPF program to obtain a pointer to unallocated slab memo=
ry
> and pass it to a kernel kfunc or store it in a map kptr?
>
> For example, in kernel/bpf/verifier.c:check_kfunc_args(), it calls
> btf_struct_ids_match() with reg->var_off.value without conveying that
> the register possesses the MEM_ALLOC flag:
>
> kernel/bpf/verifier.c:check_kfunc_args() {
>         ...
>         struct_same =3D btf_struct_ids_match(&env->log, reg_btf, reg_ref_=
id,
>                                            reg->var_off.value, meta->btf,
>                                            ref_id, strict_type_match);
>         ...
> }
>
> A similar path exists in map_kptr_match_type() when storing into
> unreferenced kptrs (where strict is false).
>
> Does btf_struct_ids_match() need a way to know if the register type is
> MEM_ALLOC so it can properly apply the bounds protection here as well?
>
> >       if (err !=3D WALK_STRUCT)
> >               return false;
> >
>

Sashiko has a valid point. While hardcoding is_alloc=3Dfalse in
btf_struct_ids_match() will likely not introduce triggerable bugs, it
is logically incorrect and fragile. I think it will need to come from
btf_struct_ids_match() callers.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782197377.=
git.chenyy23@mails.tsinghua.edu.cn?part=3D1
>
