Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C655026B2DA
	for <sashiko-reviews@lists.linux.dev>; Sun,  2 Aug 2026 21:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785706340; cv=pass; b=QK3NJ73/2UCulIqZue1BG6n279BH48AUh45UZP+GSA7g4GeHqSCP/rD9u4wYm9CD6b7+qP92OhTDtY6YALv4jsmVIeT+kmlXBHNvnlT9ptAmarxj6pjKMlPN13oPn2jujvGOhJYdGtN0U1p2AuSM5adpLNboZujaWbVgVTJjy3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785706340; c=relaxed/simple;
	bh=LSdofW40K1EnTz6Jum+TcVZgzGModR9w4wfzh8tJwkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDZ8gpSbtm7lPqDERcVllFjVH7d34ii79jc3snl4k3Y3arJi5Z+mVHrY8S8gmahmRcECOWEsROlw4rOdJ8mjh14adrlaf+tTu8WzXQpAzlpbOogwotGZAZHdo6ZFqW+ES8nD4yU9dbM7b+RytPpf1r0nHwxjLr1IcLhhX4IlVdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTiXr0SK; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTiXr0SK"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81eef95653fso23584297b3.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 14:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785706338; cv=none;
        d=google.com; s=arc-20260327;
        b=Tohjrhjp1gjAmgJYK9nQHnkFSA/7iYon/BzLyjlyGTwGVlL8+hkiVeQ20M1xvv6+sH
         +uhyBprHKoqN9bsDN8ff9sCAZw4HBwy21pHReYwpOnSoAnuvQVEvYN4ZnowsiZ/tpgbp
         0l0yn5fIzZGAUMLwAngcftT1G/9uFYRi/dS7m9JsEjKZvWECDR1pT98ZpYN5gHC/f6TV
         7/VaHiVTbGoPLc34eoI3cQa5xT3C5fz1RtGccEyRCbDrmpcNLmHbQ7LrBYzl8b2gOcYL
         /t70wzbzC1Zw7+nPx1pI3FqRJs5gtoQQ21kohR1z0wAJYwoVrkFQMnqga92N450k8Mga
         yODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jJx4JmOa+C9zdV1VuAKgN9Q8DVXUZ1IOUzDIkXM6rE8=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=fzDUg8XXq3B9Ua+F/zXw6bCCFaMZzjy76Xch/qy1cosa7BJdxG6uoL5XOVwq98zRmT
         UeQS4gSLjkRsDqDNtTCW2ZDTsZF4HweMwYtfxOZL03rYgBPai88TfuO827xCoiMdNnnW
         mm+UESqJv8bYJobfCgnGgvKs+uAFI5mTr6GNB45jo2GU5FZlUjA7NKltSe8RasYWrs+w
         p74aTJA3CPQ+tK2sOrqzkRDn7HvPxYDZspXxTTkAwXmC8PWIeiQ9iX8mrn7mxPgb+2cW
         0OpSq0YeTynH84SyyLm3b1rCoxqGuCy9oRZavuJT2yswA3vl9LJ82k8W95ECXu6QN2LO
         W/CQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785706338; x=1786311138; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jJx4JmOa+C9zdV1VuAKgN9Q8DVXUZ1IOUzDIkXM6rE8=;
        b=eTiXr0SKEWhlc9DRhV4+twUhG8+fjgot/ixbL4qh+mnP48PWt0JeHzUbodtC+ATp2/
         wb1L4wmEINVJR0rGnybUxJOzu69xK1xPN9hJdV6NkHUfsU2SYuMM2Jg+x2A2Cfu499qc
         yHP3aHKmzbi692fnciX8ziqGs1rMR+omBT56wZwWMGuHB4V0PhvPAatGlP3NKDuHWyQS
         jbn4Sh3Skzeyc0t5Tbtyj3SSJb8gmNnnUOKcT4RwyfYV7whNuaPKoSrgyEy+mQRmdCkd
         tFADPn14PcP7P+/dM1MMFxyQTrG3JRrbq+oxlFjP4xe8pSVHib9ygvK42W4JC6VkpMwi
         9cFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785706338; x=1786311138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJx4JmOa+C9zdV1VuAKgN9Q8DVXUZ1IOUzDIkXM6rE8=;
        b=bkNKCQE3X2ox9ePHmhj1mO/tblj3qY5tR9yfCqDN8AwJvPpPuwIyL9vrTplBRgBi79
         yHuyPRD1ITVgOqj88m6GrBl4REh/NSRhO5wTAA6IhUi9BBI2QC1wLZgAEqnuCwVaNOUQ
         mWvdpBXYYDeTu56NLQTkX6D+lrrC1ZAwmDhgHPP+goRRW+hp263lD3lHAqJBqqH427cG
         YKfDbLBLoxFug2BUZNHmK5Jb6cjv1Up1ch/W4q3EN2qLwpO9RrgHjp+9NRQ0BHGDWRpg
         A7T1fQE45PQTHjbGE27tRbMWFpH0/LJLFDYV3IP9rtvk6QdyT7QgFOh1eABBHE/xDmcQ
         G1JQ==
X-Gm-Message-State: AOJu0YzU0+0Ik6507FLPR+lx3y4fpT9O9/g8TgSxxQeg5il+wuddV5A/
	fzhGm25WE6tivdfuIq7JirGSlYad63h1YEP8fpllq8uhhDpHVgb/bkQXtVlkuhh3FXRa2Pcg3Om
	18ffz/Rn6Fkus9F/2IJrF9aVRDif3h4NYBEyH
X-Gm-Gg: AR+sD1389Hm0CyA5KbwZ4VJdKmMQxeeIubtNYMsdj/9YR1/o0WKxCFt9LO5k19XfQjk
	e85g2OjRdXgbwUE5EDRL7TUKpJdZQXOAK51SvTxZ+fG26X2bwioWaxAfOYuxXAGiOB2o5W5Vr6b
	pZQf1bdKTs56A5Pof3lTRcpnAgJNzxFZ7ytzBcbIWz9VPMG/xoHty8aebmk/0h3CM2FVLpKRb/N
	hMDmZgxs6dcjrv4c2nB38eELNLFbarTRv2nBkDQKyrBJAeW1kEHxrgH0dN4NvXTKeqV/MYN5Dka
	Dky6GIMsZfGxIGOI2Tp8s414uqXh02NX3jhe8v4puS+w
X-Received: by 2002:a05:690c:6e12:b0:80d:66b2:82c with SMTP id
 00721157ae682-81fd4a95542mr106658587b3.16.1785706337663; Sun, 02 Aug 2026
 14:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260801074633.1595644-1-ameryhung@gmail.com> <20260801074633.1595644-13-ameryhung@gmail.com>
 <20260801080940.55E721F00AC4@smtp.kernel.org>
In-Reply-To: <20260801080940.55E721F00AC4@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Sun, 2 Aug 2026 14:32:06 -0700
X-Gm-Features: AUfX_mx9aBcMfMpdFxjzBrFWO3FK-gseHqnYyXY08NFWybw3UAkapxJ-BhWDtZ8
Message-ID: <CAMB2axP6CHeFRbBFxqnM9Ficnp-KgT+sYKVFVbdLX1b6jraXhA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 12/18] bpf: Classify kfunc mem_size args from
 BTF without register state
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 1:09=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Removing the register type check from `is_kfunc_arg_mem_size()` =
allows a BPF program to pass a pointer register as a memory size parameter =
(`__sz`), which triggers a `verifier_bug` and a kernel warning.
> --
>
> --- Patch [12]: [PATCH bpf-next v3 12/18] bpf: Classify kfunc mem_size ar=
gs from BTF without register state ---
> commit e7666ea9e561228e1708d772f8e42d33c514cde8
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Classify kfunc mem_size args from BTF without register state
>
> This commit removes register state checks from is_kfunc_arg_mem_size() an=
d
> is_kfunc_arg_const_mem_size(). It relies solely on BTF to classify kfunc
> memory size arguments to further decouple argument type classification fr=
om
> register state.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 6fc22a4e38b26..d65da54f9c0f8 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -10785,26 +10785,24 @@ static bool is_kfunc_rcu_protected(struct bpf=
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
>
> [Severity: High]
> Does removing this SCALAR_VALUE check allow a BPF program to pass a point=
er
> register instead of a scalar to a kfunc's size argument, potentially
> triggering a verifier_bug()?

The issue is only temporary. It is not bisect safe but simplifies the
patches. The issue will go away after patch 17 once
check_mem_size_reg() is dispatched on KF_ARG_MEM_SIZE.

>
> If get_kfunc_ptr_arg_type() sets arg_mem_size purely based on BTF,
> check_kfunc_args() will process the memory pointer argument, peek ahead a=
t
> the size argument, and call check_mem_size_reg():

A later patch will also defer mem+size checking to KF_ARG_MEM_SIZE
similar to helper (look back) so check_mem_size_reg() will only be
called after size if validated.

>
> kernel/bpf/verifier.c:check_kfunc_args() {
>     ...
>     ret =3D check_mem_size_reg(env, buff_reg, size_reg, argno, next_argno=
,
>                              BPF_READ | BPF_WRITE, true, meta);
>     ...
> }
>
> This happens before the main loop reaches the size argument and ensures i=
t is
> a SCALAR_VALUE.
>
> If a pointer register with a fixed zero offset is passed,
> check_mem_size_reg() might assume it is a valid scalar value of 0, pass t=
he
> boundary checks, and call mark_chain_precision(). This explicitly trigger=
s
> verifier_bug(env, "backtracking misuse") if the register is not a
> SCALAR_VALUE.
>
> Could this lead to a kernel panic on systems with panic_on_warn=3D1?
>
> >               return false;
> >
> >       return btf_param_match_suffix(btf, arg, "__sz");
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801074633.15=
95644-1-ameryhung@gmail.com?part=3D12
