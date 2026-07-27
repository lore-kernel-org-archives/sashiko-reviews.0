Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAA154654
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 00:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785112823; cv=pass; b=ObqVRbpJpg/+5tqgzpPyrlBCyJv/7+p1YzcVlbnLftkrFDF0azYIGCeHsyJKQQqVovo8abFf+6C2uuH8SI6TZQsUFv8hgyLZFpkVZ0DIRpMuAl3ntlSthk90vJfnkk4dLy9UQ1ViqkxvQ7W3JyW5zW1Tx+pPv2g925hE0+ULZQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785112823; c=relaxed/simple;
	bh=cu0kBaiNZ+6Ryt7/mxs19i1OzrGh+mdVEoCwxTMVL84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDsrjCJ+UO5Qn9FkZTwsCExdNgr5u9VUFhBnw8iZOMB2Jyv9rXqIGfhTv6XM+FR0DSfvSbzrNqGbltCOuLanezOhtOymflhlAkMeGEpYhyPYMAVs0JDsOTIBKWCSeyrR97NL1eWr6zJEpDe7Du7BI/DtOXKn2pAYRQ40PHf1IuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGSTS/MU; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGSTS/MU"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b01cb18515so1785524e87.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 17:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785112820; cv=none;
        d=google.com; s=arc-20260327;
        b=Pzz1usT94ou0lb2XpcvnFS61jsA3yEqY1Tk94xpQOgv2X3C1mPBcHp+3egQIvoxQbg
         KAHZYHXeLoeks15X7tZ+fW+1ApftfUVHzpmxyp0KsASTxL2+hs8KBM93QRJBcL9AnEX7
         Iv740rpo2QQ07l4wqE0sRAq9I5bPaO3Y38YjO9yzw072U+rVzq3E49wXJP+nupg1c7Jg
         WQL+maX67QkPsV17JKkP16Kqc10Dryw86mCWrWrJsoGT5Hz57bwyrZCYsIOOcNsD+lli
         xu0vB1ULJOhU9auVNmX/HvFYYNuOEYbmQxevN52q4DaSW1+xOXrBblaV0zVW7gzv71Tf
         4fdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6CyfvHzrX9WXAXlnVNWJsJhYmyyWrG3FuVrwtYk9PvQ=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=JYYStjP82clNBNazaH7jqoV4A/Km20iE/h2ZpjoyOwqXuV/212b2S71oafYCqRI0UP
         DK7B0wWvNtrX/rljs6xfwipPd5U5N4l0DF3v+hbggYvzmbruVxBFYP4PdtwYmiykitZ+
         xn1v+M9IKJFdxq1MgRBhkd8VBy2bxA1aR/InzlDDLtPzFobl/1R9MajSoyCEdLGHh/wI
         tEDpFds1MaEpBXILvAvAdUWpeMNty3IgI/INAlNDsBMTQIelHAEnpbMXgFhDFxgiSUss
         B1GeYpahjr+Sj1vlDqzuuA5mzSV6VUDrfwqZB0TPEklO2wPlT8mWo4OhqycLBWo0AzLw
         zbkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785112820; x=1785717620; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6CyfvHzrX9WXAXlnVNWJsJhYmyyWrG3FuVrwtYk9PvQ=;
        b=KGSTS/MUVmXWbPx7v++GcCpJ2zpKuh/qQ49wtfG42d7cTYq3B6QpstLggn+42WZA9Z
         aL2AP6bV0ryG7bo8myIVvZw6rqJ6L4oyzgBgsQmzkM7/kGC0nK/08vmNX8rhXjZmfahx
         AgCNlGs/LAJNKGuKMHsEId1VQdf0z1ZEpxOFX7+k5tFEw7quQo6PdlT/geMaoJfmzF8c
         Ogz/P49mouejpzQUL6JCxNyFzlSaYwqMr92ht5x1Io3mjROqpyvFVgQT4n7gY85vBSOQ
         x57lz/PvCARDehlrjvfM72nKXzwSu90V1OHaeTwsAZ7nL+tMKG1nrKBxJ6vKUwN/h2Wz
         syJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785112820; x=1785717620;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6CyfvHzrX9WXAXlnVNWJsJhYmyyWrG3FuVrwtYk9PvQ=;
        b=jWDgfPwJiS5YG5Jnx7ZWsBUVnjG2OANkbJkt2AiS1puiZ1QZS4V1f0gDCVWZspbSoq
         fPsT3L8nJ1+5L5sCDBUcdmappLl6PDSJ8CjDCh05G4qWjWKVIFksYuQNkvv4Eh3q26HD
         Vyn/OnalJmERDpaIcCZ0GrsfXlAeVncc3jRU1BuxnSapzFs37+q0GOYgc71TG37yIHpU
         DYfxKnWf/xItAPZlMsuFHY7xdaWEfyOpUMGJpNyI6G07fYeJhsnhAYKBg2UaQuz+LFRD
         7n10IOHcB3Ft95f4Mk/a8QyBIR0Z7403VeJZE5qki+kK0kp+lxVqqboejwC0bM7EngO2
         pxsQ==
X-Gm-Message-State: AOJu0Yy1VWrUz1ZP/2bhliQCcIlwQxHHwA2wgqZnfo1EkrkmTzq0kQ+y
	Vr9gwKkvQgLdc/60tS9l2qgnd4XEmQe2xm6vp13syR2Vb1iDDVSWHSCvUDoTJcMH8l7x7VlRDjk
	/fSOnHplb7j467XqvJO+YCEqVp5tV7Y1gNXSKrrSfIQ==
X-Gm-Gg: AR+sD11lltv1LIv9d3J2wL1//dDZWA1W3D5HiaQ4wEib4rpyYYOrdpgZKND30nEJeu0
	270PoDSOFGGzW6QEkb2JLRvuWS7+59jPONfVwc5xQVjpiCHFoGPDtin69OEL7SH2ErQovvjR3FA
	UTaEdyyX/x6a2598qXj7U+jNqZgZwMgCRDk+1zXOI+VImuGFeDhksbUaFQar14nOP74/YX3Z60i
	dOXcJ1YpnzpKCzuPzs3YtSm+CRtTDA4hBL9TcnUDZHX9WiGaV2LqTtgepvK
X-Received: by 2002:a05:6512:3195:b0:5b1:1b50:7201 with SMTP id
 2adb3069b0e04-5b2c1b2ef9emr1184352e87.36.1785112819522; Sun, 26 Jul 2026
 17:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260726235030.1152542-1-dingning04@gmail.com>
 <20260726235030.1152542-3-dingning04@gmail.com> <20260727001354.B3F1E1F000E9@smtp.kernel.org>
In-Reply-To: <20260727001354.B3F1E1F000E9@smtp.kernel.org>
From: Ning Ding <dingning04@gmail.com>
Date: Sun, 26 Jul 2026 17:40:08 -0700
X-Gm-Features: AUfX_mw5jYf4gaWMG50gpM8nwUKursbmWq_aWool25MmJRYUjdUk2KP0LWD3iMo
Message-ID: <CAJP4ius__AtzaGNVAPbHn+JyfR6+E8=SHNhcZA-dKdGVfnbk0A@mail.gmail.com>
Subject: Re: [PATCH bpf v2 2/2] bpf: Reject untrusted pointers in refcount_acquire
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This seems to be a separate issue from the refcount_acquire argument
check... For a pointer without NON_OWN_REF, code inspection shows that
direct access can reach verifier_bug(). If that warning is emitted, a
system configured with panic_on_warn may panic. (haven't reproduced
that yet)

In my runtime experiment, the stale address was reused for another BPF
object before physical reclamation. A read through the stale pointer
returned a value belonging to the recycled object. And I did not
observe a WARN, panic, physical-kfree UAF, or a successful stale write
in my experiment configuration. So the current experimental evidence
shows only a stale read from a recycled object, while the panic only
remains possibilities in the source code, but haven't done any
experiments to prove that it is feasible.

Regards,
Ning Ding

On Sun, Jul 26, 2026 at 5:13=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] check_ptr_to_btf_access() incorrectly allows writes to PTR_U=
NTRUSTED allocated objects or triggers a verifier_bug WARN_ONCE when readin=
g from them.
> --
>
> --- Patch [2]: [PATCH bpf v2 2/2] bpf: Reject untrusted pointers in refco=
unt_acquire ---
> commit 80e6c61503b2eee2d4804b0a7ec8927827ed7d92
> Author: Ning Ding <dingning04@gmail.com>
>
> bpf: Reject untrusted pointers in refcount_acquire
>
> This commit fixes an issue where a refcounted map kptr could still be pas=
sed
> to bpf_refcount_acquire() after being marked PTR_UNTRUSTED due to
> bpf_rcu_read_unlock(). It updates check_kfunc_args() to reject PTR_UNTRUS=
TED
> arguments for KF_ARG_PTR_TO_REFCOUNTED_KPTR.
>
> Link: https://lore.kernel.org/r/20260726021304.97ED91F000E9@smtp.kernel.o=
rg
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 1e7343b625de5..63b1d997fe804 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -12414,6 +12414,11 @@ static int check_kfunc_args(struct bpf_verifie=
r_env *env, struct bpf_kfunc_call_
> >                       meta->subprogno =3D reg->subprogno;
> >                       break;
> >               case KF_ARG_PTR_TO_REFCOUNTED_KPTR:
> > +                     if (reg->type & PTR_UNTRUSTED) {
> > +                             verbose(env, "%s is an untrusted refcount=
ed kptr\n",
> > +                                     reg_arg_name(env, argno));
> > +                             return -EACCES;
> > +                     }
>
> [Severity: Critical]
> This is a pre-existing issue, but I noticed a similar problem with
> PTR_UNTRUSTED handling in check_ptr_to_btf_access() for allocated objects=
:
>
> kernel/bpf/verifier.c:check_ptr_to_btf_access() {
> ...
>                 if (atype !=3D BPF_READ && !type_is_ptr_alloc_obj(reg->ty=
pe)) {
>                         verbose(env, "only read is supported\n");
>                         return -EACCES;
>                 }
>
>                 if (type_is_alloc(reg->type) && !type_is_non_owning_ref(r=
eg->type) &&
>                     !(reg->type & MEM_RCU) && !reg_is_referenced(env, reg=
)) {
>                         verifier_bug(env, "allocated object must have a r=
eferenced id");
>                         return -EFAULT;
>                 }
> ...
> }
>
> Does this logic incorrectly allow writes to PTR_UNTRUSTED allocated objec=
ts
> or trigger a verifier_bug WARN_ONCE when reading from them?
>
> If a program loads a program-allocated kptr containing an RCU-protected f=
ield
> inside bpf_rcu_read_lock(), the verifier marks it MEM_ALLOC | MEM_RCU (an=
d
> NON_OWN_REF if it contains a bpf_rb_node or bpf_list_node). When the prog=
ram
> calls bpf_rcu_read_unlock(), it strips MEM_RCU and adds PTR_UNTRUSTED.
>
> If the program subsequently tries to read or write this pointer,
> type_is_ptr_alloc_obj(reg->type) evaluates to true because it ignores
> PTR_UNTRUSTED, bypassing the read-only check for writes.
>
> Then, if the pointer lacks NON_OWN_REF, it hits the type_is_alloc() condi=
tion
> and triggers a verifier_bug(), leading to a BPF_WARN_ONCE. If it has
> NON_OWN_REF, it bypasses the verifier_bug() check entirely, and proceeds =
to
> allow a memory write to the untrusted pointer.
>
> Could a malicious BPF program exploit this to achieve a local denial of
> service via panic_on_warn or a use-after-free memory write?
>
> >                       if (!type_is_ptr_alloc_obj(reg->type)) {
> >                               verbose(env, "%s is neither owning or non=
-owning ref\n",
> >                                       reg_arg_name(env, argno));
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726235030.11=
52542-1-dingning04@gmail.com?part=3D2
