Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9550242AF93
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 18:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784831119; cv=pass; b=e/fvsPygwrsV7C/b3FxOs2HBbFj+LUt4MBbgTZKKV+WSuMKUVaIIU5FlhM8xylbI6Q9YqPlBX0htCNlBKeuScrItFqSmRDavIcQYMqJSNvTGCQAsgtL7l6RPOagYxU4BYy2veYnzamfDh/2AFbIIgHlvaOmYPrWgOzEIO32b+AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784831119; c=relaxed/simple;
	bh=x5yeMEmRp8Gkz3QWIxoiqkoCMZopkCi9a/qaHiAVJ/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhtOKxXzucsNRhdc4s0nMD1HqHkRFyzpcSW8T5UICBQDBrc8CGrkK2pS+RTG43l3+aaH5MU8U1YMyRDOLcfmQq5z7PWADqxuL66ba964z73GTKT8bqx9YeMRKCEHSeZzpypKevGGFOtYG0SNugV2NLJ9X2pGSzmNtGSZSBgQOqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVtF+jwK; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVtF+jwK"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-80e24970f1dso6235397b3.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 11:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784831098; cv=none;
        d=google.com; s=arc-20260327;
        b=YGBw721jyaiU6Y32p4Kvwo5rvNb+JaX+Cd8KQLgyJx4OSvBeUscya1gDhXFCJyavjF
         F3NIMnJFgETVMoCivRi0mrmB4GFwNEHl0Py7Vo6TGEWfyyeyV5k/jiPm6zKFSM6suSXc
         xw3HTT0G0ABDGqTSGmy+IFzcbtjCDkRH9R6QoD/xcm7PgQNumjIwZGlc83o/bUlfBE8J
         N/D3kdoUorPQyb7IxSqcDiQ4oBha1Jc61OXfC9qKu2T6lrEudTy5+2TnT5umHN/I1wiR
         b8fKwinkqVNRk5S1EsrM3SAZoONXVKYY8pWW+3sR20Kqv1XzfqTUWq8dLnehHb7/wkV/
         LagA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0oJYMqyNkCHkL6Hpz5vc/KbsgIoJjAK4W7sArgGDP2s=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=d9NijNwk6l5yFER2KDWEl3G2RZLDFXA5rnupBibvpNU4YTumH6i/xYtx9RctDr0eGI
         QJ705ZqIJ3TSc4KqNwg8cV3gy8sAyKh3K+NhXWPBY7wrxd5Xf9fTtRaEwt98KWQdeyA9
         7fsn8WBggUyFHH58ialNx42TIj777/GfPf5ISSdrQJ9lmOrTuNsODInPrpwJZdkH0JEp
         sRBTQFR/zOPijPeSscXfDtu/UKITE7GQrh7RynvjVgwLUSNAd7KSdDir2oWjw8B3bXRZ
         N61qVyM3rSBaEajrjJOJZIltjBe016EMm/7UYaJoTwUbSL18ls2WAiGwooQk3LwTpleQ
         EXFg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784831098; x=1785435898; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0oJYMqyNkCHkL6Hpz5vc/KbsgIoJjAK4W7sArgGDP2s=;
        b=PVtF+jwKN3KLWBhB1OxAH2ENvUL6UpilKFk0KJ8GGqWyfzVuXwTbzd84qg0kMbODL3
         OXAwarmca1Jn2atd2hhpjcq+faGkFd4xcAmg0sOqbtFh3a/0AVG1YY+9BhRAiz026Fhb
         QjyupaDTFq6xIn4/388h0XxQYHGw04/olJW7/KJdQpiyWOE406kMvi5MhF2xGzTs6lik
         hfe4FbLHDjCLB0OvJkQ8mwVY+6H0qC04QgsEtnX7HqupHY6v4wNYy222zhkXZyb+Abj6
         slO3jxfZtJwAsOiOPkbheF4hYW9/+fe3vCiuek2tlYhmWS9QhgVdLMG19hOrKNKoqMWl
         PBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784831098; x=1785435898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oJYMqyNkCHkL6Hpz5vc/KbsgIoJjAK4W7sArgGDP2s=;
        b=Jp+XHJmhREMEqzWYywRQXrqFk0XTjXGqMVU1DGmPw4orCypvUvJDpPsltf+4BlAxyK
         uwytOBT+PAOGP4Qwp/RlE+zTgFvmQn56Z6qdqIwpuFDBfHy4Cql5GArRCPmqI9NWXZc4
         MXJ/MTCtUZnwS/pj8QKaahm+cgCxMJp9nS0AEa+wrMLWxvR/WHtHfgkPY/Q3SZsEJFty
         REkjc6jRLnGopdntcu9ZppNRXzX0zXtio8qdNuz9uqVwcPDUSZ4eRIv2fjCSuoWlcANQ
         uY2b2PK0eKxsVxRQi6mjPe4vJ+4UXNARdOmWpTY3vJ0IBNy3SGLV4xm5oszIai3s2mM8
         Lf8A==
X-Gm-Message-State: AOJu0Ywcj0W96MuOR+TUKstxAF9z6mc/L1IcYifopHy9xWiCosS+tUSP
	kH898I012O5ZN9luAxZeZCpOnQWw5ryG4Mf4/G/bhC0T4Ca8YxqPMRGOBQFuYxq5HiJwdbzs4Fc
	1OnQoEede2qWNL0S5lopkRP62NYSkgkwP9+7a
X-Gm-Gg: AR+sD10fU7ryFNAbcV8HuRS9RyHb7ULZawL18Ql5U3qXlLS1DtiMglG92tGkaHRNnWs
	CQ9vyMeUyAyisP3+jGSZgir99k8SzJS7e/eGn4HJXg0o/Da+LfipJgsFGRgdebwqfQBo9BDSRDT
	O26oGTmkfLqsOrweNGRXW2OX/LOCg8ZPmsWlJJn+y/jmV/kQuoVy6n1aucf97dqaI1NYEDXtR7/
	ThFwrGv5mNNtyPjsGkHAFuPbopi9Hb8j9PA6YGuAagLKMHDiw8YBUzPXBpBAA==
X-Received: by 2002:a05:690c:670f:b0:814:5840:2f92 with SMTP id
 00721157ae682-81f4c2d2b76mr13363727b3.48.1784831097652; Thu, 23 Jul 2026
 11:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723050806.1158442-1-ameryhung@gmail.com> <20260723050806.1158442-6-ameryhung@gmail.com>
 <20260723055202.984761F000E9@smtp.kernel.org>
In-Reply-To: <20260723055202.984761F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 23 Jul 2026 11:24:46 -0700
X-Gm-Features: AUfX_mwR4iMhFVRnwBs9R_fx3dAX9M0ehCQCWJcc8X_OOBFEauYOdSe_7ov9qTA
Message-ID: <CAMB2axMnAV=Dkt28YwHsGm15myYWdG0L+D7EoaOmjhT3bydWkA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 05/18] bpf: Check helper and kfunc mem+size
 arguments identically
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 10:52=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Unchecked nullable pointers passed to helpers with `size > 0` ca=
n cause a kernel panic, as the verifier does not enforce a strict correlati=
on between the pointer's runtime NULL state and a zero-size constraint.
> --
>
> --- Patch [5]: [PATCH bpf-next v1 05/18] bpf: Check helper and kfunc mem+=
size arguments identically ---
> commit 209f89ec76658f4c319cb2f0b37557c6e39026aa
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Check helper and kfunc mem+size arguments identically
>
> This patch unifies the memory and size argument checking between helpers
> and kfuncs. By moving the may_be_null handling into check_mem_size_reg(),
> it prevents an issue where an un-narrowed map-of-maps value could be
> passed to a nullable helper memory argument and leak kernel pointers.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 29d45636c28b8..6520742d51b58 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -6873,7 +6873,14 @@ static int check_mem_size_reg(struct bpf_verifie=
r_env *env,
> >                             bool zero_size_allowed,
> >                             struct bpf_call_arg_meta *meta)
> >  {
> > -     int err;
> > +     bool may_be_null =3D type_may_be_null(mem_reg->type);
> > +     struct bpf_reg_state saved_reg;
> > +     int err =3D 0;
> > +
> > +     if (may_be_null) {
> > +             saved_reg =3D *mem_reg;
> > +             mark_ptr_not_null_reg(mem_reg);
> > +     }
>
> [ ... ]
>
> > -     err =3D check_helper_mem_access(env, mem_reg, mem_argno, reg_umax=
(size_reg),
> > -                                   access_type, zero_size_allowed, met=
a);
> > +
> > +     if (access_type & BPF_READ)
> > +             err =3D check_helper_mem_access(env, mem_reg, mem_argno, =
reg_umax(size_reg),
> > +                                           BPF_READ, zero_size_allowed=
, meta);
> > +     if (!err && access_type & BPF_WRITE)
> > +             err =3D check_helper_mem_access(env, mem_reg, mem_argno, =
reg_umax(size_reg),
> > +                                           BPF_WRITE, zero_size_allowe=
d, meta);
> > +
> >       if (!err) {
> >               int regno =3D reg_from_argno(size_argno);
> >
> > @@ -6920,6 +6933,10 @@ static int check_mem_size_reg(struct bpf_verifie=
r_env *env,
> >               else
> >                       err =3D mark_stack_arg_precision(env, arg_idx_fro=
m_argno(size_argno));
> >       }
> > +
> > +     if (may_be_null)
> > +             *mem_reg =3D saved_reg;
> > +
> >       return err;
> >  }
>
> [Severity: High]
> This is a pre-existing issue, but by clearing the PTR_MAYBE_NULL flag
> temporarily, does this bypass the verifier's check to ensure the size
> evaluates to 0 when the pointer is NULL at runtime?

The mark_ptr_not_null_reg() here doesn't bypass any NULL/size check.

The "size must be 0 when NULL" rule applies to a known-NULL register.
It is enforced in check_helper_mem_access()'s default case via
bpf_register_is_null(). mark_ptr_not_null_reg() runs only when
type_may_be_null(mem_reg->type) and never touches a known-NULL scalar
so that check is intact.

>
> If a BPF program obtains a nullable pointer (for instance, from
> bpf_map_lookup_elem) and passes it to a helper with a size greater than 0
> without a NULL check, the verifier permits this because it verifies the
> bounds as if the pointer is valid.
>
> At runtime, if the pointer is NULL, wouldn't the helper execute and
> dereference the NULL pointer? For example, in net/core/filter.c:bpf_csum_=
diff(),
> if from_size or to_size > 0, the pointer is dereferenced by csum_partial(=
):
>
>     if (from_size && to_size)
>         ret =3D csum_sub(csum_partial(to, to_size, ret),
>                        csum_partial(from, from_size, 0));
>     else if (to_size)
>         ret =3D csum_partial(to, to_size, ret);
>     else if (from_size)
>         ret =3D ~csum_partial(from, from_size, ~ret);
>
> Similarly, in kernel/bpf/helpers.c:bpf_snprintf(), bstr_printf() could be
> called without checking if str is NULL when str_size > 0:
>
>     err =3D bstr_printf(str, str_size, fmt, data.bin_args);

I'm not following. The two helpers in the example are taking nullable mem a=
rg.

>
> Should the verifier emit a runtime check or enforce a constraint to ensur=
e
> the size is 0 if a nullable pointer is passed to prevent a kernel panic?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723050806.11=
58442-1-ameryhung@gmail.com?part=3D5
