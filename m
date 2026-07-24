Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8914749D6
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 22:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784933566; cv=pass; b=q/MmTmixK0UtTUOnvMqgRvvWcyWN1VZyyqVyvSfo1I2FrjhFeLPLDA5AuYSksdwVJugIJx53hbRTaE2INct9r96Za4JjNnZ4Au8aEaRRttIBG7awzdVJnb/dI7+dQ2azTC6aPbbb3wzewUS1cOGhsmru8gQyDr5BMjULIj20gK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784933566; c=relaxed/simple;
	bh=5r+wcWCSnXEVCw26bG0hPi5Ia1f/Hd5c7gS0uuMc8f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nt27IcGfQVOC1+62LgP5WmABcweXnfoJcNeGq55Nu6/OCh86tj+/YMRd+ITxS+Lf0LnlzHYk59tbpEyKmjmS+kt24lnsOFDWoXThAoKhQxpMWm+wFxhsgpxa3LpQRSQQUI3Tym7ALjWiI+fFZJ9C/KT7lCjBBA7rJNTh7u5/y4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkWsUARJ; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkWsUARJ"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81e9d8f3289so9720297b3.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 15:52:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784933557; cv=none;
        d=google.com; s=arc-20260327;
        b=YQeZoTMe2XVYr+a5rIiG1wn84ao/LsP70MDtvhKkSSAy+FTAae1xKaqF3vWBDavXKK
         yLAwgaPZBO6Racya1cbBv+G+OTPV8vjqqAizQossYyTD6l8ciWzFq/KhO/RyZZ7l9AIF
         19BZ80gXO22i0eW4AFIxkC6+iO1cRxjIh6jz36U8dI15+ibuvCECLDgPlVXbyLj4smvC
         I5AGfrAeD1oBs8VeI3HLnCFUZbylpGZ+tTCeXjmFcoLOrWgypJbRwlRRLbXg8M58EOcs
         bUdSvRzexL0nXrz7u5eJLkwAynGYK7em41asjq46Ny4qhRCC4ba6n86R+hh4yGRPKlQC
         ZGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Je9RQL7yzHK1azs4JTGhkDhHGg3bmFqi0w/4Q5JGZZM=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=BVdWnnAnNizDCMWL/mwLdlJh4dMuIFvv1KSd1XjnPoe+t+DExjpHwM/5X0ctgB/7xl
         7KKvAY1NaAmGfJ6L66Pp+ac6Lg5ckOnoitzaEZEs0infNRC2zx3cJFqiYCnKXCK72e/f
         5wXIwRTI3iJ5q34FwH2hXoHlGoBLBTFwfkwwOgwtKmYF/UAJpX3dYtJ4BmMsO4zpwHPN
         wNc0Fbe9jQtiSXejxlL0oqlErYuxbZQ66RTHhmAfPqfRkm9xLKiggeW0N5+AVm61zo6X
         6t8KtiDOeRyEv8ZnvZyNcCxCx1apBzSX9lkRLJhNtmHVDlyc+/aXOQYEr/x6xZdiMsJc
         u/tw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784933557; x=1785538357; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Je9RQL7yzHK1azs4JTGhkDhHGg3bmFqi0w/4Q5JGZZM=;
        b=RkWsUARJk8JaieL1d3QirgB0KQYjdKzyI48QXcLYekjsN8axjht1037tOpFUoaeDEu
         TKRB1ZLU+3E+gyQtReMeghoILnwLy4nXMbNdrU5wwvVeHCXuhgEuiHKej7gjS583nxTy
         zhE2Jff2XM2WqV7niD0JlYYRSen1YrhF5reEdV2zuqE+jMXyywY8/vURLGc4md18xic1
         sW7cb9AE1Fh1UdoslAWmxhpcP7LnejvI6ZfOw8PGWV6TXU6W4ISJJTnOmTMKYxsJpnT/
         erWHGz6mw0J48+xsVJGyKJ9prg8mmWYJtdpR3kso+v2sijZgnipm+LHoJJeewmuPceP9
         rpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784933557; x=1785538357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Je9RQL7yzHK1azs4JTGhkDhHGg3bmFqi0w/4Q5JGZZM=;
        b=Nx0Ir7m4KJUVcZHuhN0SzyMeIkNHu9UZhs0yrF8OkrxivlCWH+hNd+5L9dtg/U/8J2
         jnX7ArWw/jSeRT4UBV1aaZjJ9bkWYYM6En79MyZ+kvaBne+Hoy9woUT8Y4j8KdeAugxJ
         1y+KnyDNF2FnhSyOpzhGqcr0oXMP2hcl6TAPw8oWkaCjtKRw/20NFW2zlkxmPyXalPTG
         BlA3JX4NT75oletqjLSCx2DwHfA+17qTcwNCOUI7piF4OSJ/kQCp/bKc6pxpIoYuKGsA
         At4fKOxAg9Jtla2Z11rCXQWAl5su+fMKYBdr67XlmivKxJjzWBsMYjedv832jPZSpZ8F
         sg9Q==
X-Gm-Message-State: AOJu0YwNJFamkndUtSvqSPIsG62FKMT21Gns4BpUXAeboxfGiZuLdvQQ
	YWFOSB7vKAuli3bWdZvUTYxNvqo3yxhJJ1BzvLfvK5rLyoy3oCnaElLiATdrBXlYjrnH7XJx4r/
	UwsZ7UxspFfPoepsPIG7aR3s9BsiQOWDi76/N
X-Gm-Gg: AR+sD105JOy6wkx7S6OJYr31D3TAdN/LPFhPeW6TSkideW/o6KZtdKZU3CpYINuFZKx
	U8coSB8GinSuJpEV+4+80ewC/RLZ/gzzU4QYP83U9W7Gh+lGgg2kOZFfSjbL9AwYU39p0isMp3U
	p2KlGSf+m8n1Oo7H4S0uZulyEh0VeIcp6ihTTcA22yAhu7y7lF+M69KYt84sCtSe5KqE8msLVhr
	Vj+XJLgz7vXFhwCOOHuGFYaeqZWr4StqN4S9kcxKW9F/T3elVdJbTcV0M+WVw==
X-Received: by 2002:a05:690c:9688:b0:81e:45a6:bd52 with SMTP id
 00721157ae682-81f69e3c4b3mr1520747b3.34.1784933557256; Fri, 24 Jul 2026
 15:52:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724190813.1458271-1-ameryhung@gmail.com> <20260724190813.1458271-12-ameryhung@gmail.com>
 <20260724193854.57F981F000E9@smtp.kernel.org>
In-Reply-To: <20260724193854.57F981F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Fri, 24 Jul 2026 15:52:26 -0700
X-Gm-Features: AUfX_mxAgvUZDDSV_y1FYtX7GTSISkmzcoT504FkjU2DbC63Dg_OFMVyiqiMF2w
Message-ID: <CAMB2axPqGZhVmkGbpijqmdmkY65aojPJemV-ot0ATZ6DEANf2w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 11/18] bpf: Classify kfunc mem_size args from
 BTF without register state
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 12:38=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Removing the `SCALAR_VALUE` check from `is_kfunc_arg_mem_size()`=
 and `is_kfunc_arg_const_mem_size()` allows unvalidated pointer registers t=
o be passed as memory size arguments during kfunc lookahead validation, tri=
ggering a `verifier_bug` kernel warning splat and local DoS.
> --
>
> --- Patch [11]: [PATCH bpf-next v2 11/18] bpf: Classify kfunc mem_size ar=
gs from BTF without register state ---
> commit 55013229ec44003dda12328783652d410aa4f75e
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Classify kfunc mem_size args from BTF without register state
>
> This commit drops the scalar register type check in is_kfunc_arg_mem_size=
()
> and is_kfunc_arg_const_mem_size() to decouple get_kfunc_ptr_arg_type()
> from register state.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 0f8d403083177..f6b373630ca95 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -10795,26 +10795,24 @@ static bool is_kfunc_rcu_protected(struct bpf=
_call_arg_meta *meta)
> >  }
> >
> >  static bool is_kfunc_arg_mem_size(const struct btf *btf,
> > -                               const struct btf_param *arg,
> > -                               const struct bpf_reg_state *reg)
> > +                               const struct btf_param *arg)
> >  {
> >       const struct btf_type *t;
> >
> >       t =3D btf_type_skip_modifiers(btf, arg->type, NULL);
> > -     if (!btf_type_is_scalar(t) || reg->type !=3D SCALAR_VALUE)
> > +     if (!btf_type_is_scalar(t))
> >               return false;
> >
> >       return btf_param_match_suffix(btf, arg, "__sz");
> >  }
>
> [Severity: High]
> Could this removal allow a pointer register to be incorrectly classified =
as a
> memory size parameter during kfunc lookahead validation?
>
> If a BPF program passes a pointer register (such as PTR_TO_STACK with a f=
ixed
> offset of 0) instead of a scalar to a size argument suffixed with __sz,
> get_kfunc_ptr_arg_type() will now look ahead and classify it solely based=
 on
> the BTF signature.
>
> Because of this classification, check_kfunc_args() eagerly processes the
> unverified register as a size parameter before the generic scalar validat=
ion
> loop catches it:
>
> check_kfunc_args()
>     ...
>     check_mem_size_reg(env, buff_reg, size_reg, argno, next_argno, ...)
>
> Inside check_mem_size_reg(), the pointer with a fixed offset of 0 yields =
a
> size of 0. Since zero-size is allowed, it passes the bounds check and cal=
ls
> mark_chain_precision() on the pointer register.
>
> Because mark_chain_precision() expects a SCALAR_VALUE, it triggers a
> verifier_bug splat for backtracking misuse when given a pointer. On syste=
ms
> configured with panic_on_warn, this creates a local denial of service
> regression.
>
> Should the register type check be retained here, or is there another way =
to
> prevent pointer registers from bypassing validation during the lookahead?

I will change check_mem_size_reg() to be lookback by calling it in the
KF_ARG_MEM_SIZE case in patch 13 ("bpf: Distinguish fixed- and
variable-size kfunc mem args with MEM_FIXED_SIZE").

It is not bisect safe, but it will be free of this issue after patch
13 in the next respin.


>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724190813.14=
58271-1-ameryhung@gmail.com?part=3D11
