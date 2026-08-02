Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B172931E0
	for <sashiko-reviews@lists.linux.dev>; Sun,  2 Aug 2026 22:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785708629; cv=pass; b=LPnjj8O42GlG6WyLj7QpLi5lTHG93qYy7I9GjUzAVaVhsqDJGWdxWZlg2eDcbanJiZzFhbK8UDSjRAtJYKMz9WoELYNyRXXgL1oSLdbf4eNm2xpC7dTXULEricvFJxqZFZ+vaYdgPvklYoiXyDwBYWuUO4BiH1fae+VsxBCZPkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785708629; c=relaxed/simple;
	bh=eRFtgMKw1bXZ8HlsKfgvbOPiqlVoMRsIBxoFY7IYE2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iVfZxjD+YO0f7AOpvdOp7mvjsRu6zWjz8q2OBKVaJblo43W1NsVAoGNvKPfAjN1j99aIoRJrTS7OPLd8zuqMrvs5X9mnod5eSE8jVkP/r9g2C6eIMpnIcBShvqSal/oGg+/4VlDnRZ/XMokwonufKyyidfoJWW5YOEQuVGBvhaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FY3qbEuw; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FY3qbEuw"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81ed2a06b9eso22815347b3.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 15:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785708626; cv=none;
        d=google.com; s=arc-20260327;
        b=kIfjtJvnEkix1UTA/XobgLrIVAnK+CddtpsEHg9sGzwjpw7wS0734x0s7CmybdUaEj
         PeFcp5hnrL74t2Nwc6pj1Gdf3SHnpKdQsV1IRp62x6jjUIY9JddAniDYZBhiTG5idWj9
         UuJ418zye4yn5x1AkmQ+FdT1XAn3StE0eq7IcKgpAaWlT0n+1cTMhAbbIy5QBMg8jloG
         900hTDfgeRD9LWD8jZG4ZHacSQN5l143MjLyd/nJeF0WWNQTHNu52GGrJvkPS8Pc/Ja3
         Yo4cfOB8c80ufevjQ9sibmcp2tna6k4qdARS2goW+ZXg7oC3hCJsuWOWQTtkFd9eAMks
         h3lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HMbJsCNToR/i0i6p/qewgiU8kiE/Udu1Ph+qBECWycA=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=RdVYnLa9TmkO1AqrbG/q/PXZUNDua+Qu4kMkpnf3zWqP1GvaChx3vZExsw9K94OROj
         F7M49o/cmgcfNvO9meYnJ4SBDtt1hFimPV9zB9qaifA2hEUBF0l/nCShzh2L+rn3kuw1
         vexMukxjSYPnYaSbvUCeZnb5LlEk25gZKpeE/JF9s9lc3B9SVpATUiC42O4M4lif9WR3
         C453yVISwHzzRfArFCj0LCIocjWKFqd/MveHS8xRnPnRkvgfGkMza6s91MN8I6HP7Pg0
         5KRVtojBj7aV7hZAF+Cki4Saw8oOMpeOa8uGt5/zHLiFqeXslP7/22FkmeuBrd1ioLLI
         JSKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785708626; x=1786313426; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HMbJsCNToR/i0i6p/qewgiU8kiE/Udu1Ph+qBECWycA=;
        b=FY3qbEuwMzRKFczQ+zgbWVi4pPXd3tfkCChcHGuxnvgHOhAxTQZbflyCNS+O0zsYEh
         OAzfRXkXli7dJvkNBCA3IletuHZ79A6odD5wKkqdMeFHOYAmXF5TjIdNLnqz9E3do84e
         5XfzkhsBMQM/iK5T2vDMI09ySTOZ4LE1TZ4Yr+dn2vlJIGfUOUS1OAlBwDY9n8Vuxsup
         yJAQLtvM8atQwwawSURsn3rDXM6LP2CrYgC9QG8oKhXk5qeQlb3moa+BlwyUr5Mo87fj
         2u/tvyY40ZWpP3crzw23u1Gh91eqWxFzcHj6iLPHEGRwVn7eGTHz5lT3NMndIpUBpy4l
         O5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785708626; x=1786313426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMbJsCNToR/i0i6p/qewgiU8kiE/Udu1Ph+qBECWycA=;
        b=T+z41HXANyLHK5g+DAl70ga6Z4xlYyC80C3PgiHz6e181M3n7JqwSNAf8d2FTr26gc
         81WeP47QtiDsjgq4xfKIfOl8fYjtc1wmA9ZWNvsoSVC8u6FklVPQF+ENQXtfbUGrlIAv
         dNUrSVLTkpZVap7yk4nUSlp4cCOmgNElbvXV9Kd16ji7XM8vUSTjvhUsAoOuq/36HpIc
         ZL1KREzT4ohomaMDGF+s3+JO3V9VCH5C88JhHXzfT8vgPzlwqt4h6rSOIzctw+x56xxn
         WjF3pS+5TtmjMjZZmIjw1TU1SDNXmRlGGZuVks1sIS5V01yXDT1VUuPHW6PyzZ2tNOfC
         geLg==
X-Gm-Message-State: AOJu0YzF1u8N77Y0VwHjqg5zzqQ/GeqJ5D5Z4FRMGCy0XqtnkE/d35WF
	cKEkR67Ufv8yY5y6WS1zdU6pHRubug//oNUxbW4vNj7b7wwqf9DEhs3Vz5uKiRE00ZmJ2tZ2pk4
	4dB9tKlSzTlyxatF3c31GJY4Q1kPnzv+Fgu+S
X-Gm-Gg: AR+sD124s8OqbiNY/l4YPwSM8x+AffKsu8Or6JOhSLMz41NCTv/17VeNipw0fr5o9Ic
	5iguTekHMogk12vVn0jihs4F2LrUschvBPvOS3uiF0Pne6AzNQFzvAsLGNLYXJ285djSdYYuBRW
	TL3LgltcZH7lrYdWx3svxWUIKIiAXOBf9flZl5d5XvEuSKy74MD+KRK+M3SFXkWmbCAmKSL9rkl
	W92EqLatrkAuONFRrerOWLVRB0ehx6XBJoFTD7Xaw6ok//5dCgNdt8hwlL5+9MvZUIO+y+7eyhH
	kGy+JyqqEao0xJDSr65oi3qi6XaxEIf+E4/LXBh4dYfp
X-Received: by 2002:a05:690c:2789:b0:81f:653a:fb41 with SMTP id
 00721157ae682-81fd4a21645mr111501377b3.10.1785708625995; Sun, 02 Aug 2026
 15:10:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260801074633.1595644-1-ameryhung@gmail.com> <20260801074633.1595644-9-ameryhung@gmail.com>
 <20260801081721.132401F00AC4@smtp.kernel.org>
In-Reply-To: <20260801081721.132401F00AC4@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Sun, 2 Aug 2026 15:10:13 -0700
X-Gm-Features: AUfX_mzVImaE8JC5A3oWIPJkUofdwX7NRxxR6LIPEWhmJ9KnoyJHqX6SEXaktl4
Message-ID: <CAMB2axNktmWPs80p9Xw72Rr-Mexdbd6O5HfMXhgByVwscNW6sA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 08/18] bpf: Check fixed-size mem args of
 helpers and kfuncs the same way
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 1:17=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Kfuncs taking uninitialized memory arguments via the `__uninit` =
annotation are falsely rejected when passed uninitialized stack slots.
>
> Pre-existing issues:
> - [Critical] The verifier fails to check if the size argument for `KF_ARG=
_PTR_TO_MEM_SIZE` kfuncs is a scalar, allowing BPF programs to pass kernel =
pointers as size arguments, leading to an out-of-bounds access.
> --
>
> --- Patch [8]: [PATCH bpf-next v3 08/18] bpf: Check fixed-size mem args o=
f helpers and kfuncs the same way ---
> commit bcee13ba62b78a9328164e2486f3c31a7fddb8a0
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Check fixed-size mem args of helpers and kfuncs the same way
>
> Fixed-size memory arguments went through two paths: helpers called
> check_helper_mem_access() directly, while kfuncs and global subprogs
> used check_mem_reg(). Route the helper MEM_FIXED_SIZE case through
> check_mem_reg() too so all three share the same check.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index f61771e2a8b27..9e0c7f0a15c15 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
>
> [ ... ]
>
> > @@ -12379,7 +12385,7 @@ static int check_kfunc_args(struct bpf_verifier=
_env *env, struct bpf_call_arg_me
> >                                       ref_tname, PTR_ERR(resolve_ret));
> >                               return -EINVAL;
> >                       }
> > -                     ret =3D check_mem_reg(env, reg, argno, type_size,=
 meta);
> > +                     ret =3D check_mem_reg(env, reg, argno, type_size,=
 BPF_READ | BPF_WRITE, meta);
>
> [Severity: High]
> Does this change break BPF programs that pass uninitialized stack slots t=
o
> kfuncs using the __uninit annotation?
>
> Because check_mem_reg() is now unconditionally called with
> BPF_READ | BPF_WRITE here, it seems to mandate initialization for __unini=
t
> kfunc arguments as well, which should only require BPF_WRITE.

First of all, this is not a change introduced by this patch. kfunc
already calls check_helper_mem_access() with BPF_READ and then
BPF_WRITE.

This is also not an issue unless a a new unpreviledged kfunc that
takes __uninit arg is introduced. There are two kinds of existing
kfuncs with __uninit arg: bpf_dynptr_from_xxx() and
scx_bpf_cid_topo(). The former, while being unpreviledged kfuncs,
checks their __uninit dynptr argument through process_dynptr_func(),
which directly calls check_mem_access() to simulate byte-by-byte
write. The later is a previledged kfunc, which means
check_stack_range_initialized() will see env->allow_uninit_stack =3D
true and allow reading uninit stack slot on BPF_READ and then mark the
stack slot as STACK_MISC on BPF_WRITE.


>
> >                       if (ret < 0)
> >                               return ret;
> >                       break;
> >               case KF_ARG_PTR_TO_MEM_SIZE:
> >               {
> >                       struct bpf_reg_state *buff_reg =3D reg;
> >                       const struct btf_param *buff_arg =3D &args[i];
> >                       struct bpf_reg_state *size_reg =3D get_func_arg_r=
eg(caller, regs, i + 1);
> >                       const struct btf_param *size_arg =3D &args[i + 1]=
;
> >                       argno_t next_argno =3D argno_from_arg(i + 2);
> >
> >                       if (!bpf_register_is_null(buff_reg) || !is_kfunc_=
arg_nullable(meta->btf, buff_arg)) {
> >                               ret =3D check_mem_size_reg(env, buff_reg,=
 size_reg, argno, next_argno,
> >                                                        BPF_READ | BPF_W=
RITE, true, meta);
> >                               if (ret < 0) {
> [ ... ]
> >                       }
> >
> >                       /* Skip next '__sz' or '__szk' argument */
> >                       i++;
> >                       break;
>
> [Severity: Critical]
> This isn't a bug introduced by this patch, but does the verifier fail to
> enforce that the size argument is a scalar for KF_ARG_PTR_TO_MEM_SIZE?

Not a pre-existing bug. Currently get_kfunc_ptr_arg_type() does
mandate the register passed to __sz or __szk args to be scalar.

>
> The loop uses i++ to skip the next iteration, which completely bypasses t=
he
> btf_type_is_scalar validation for the size argument. check_mem_size_reg()
> also assumes the register is a SCALAR_VALUE without verifying it.
>
> If a BPF program passes a pointer register (like PTR_TO_STACK with a zero
> offset) as the size argument, reg_umax evaluates to 0, which passes the
> verifier's size checks. At runtime, the full kernel pointer address could=
 be
> used as the size, potentially allowing an out-of-bounds memory access.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801074633.15=
95644-1-ameryhung@gmail.com?part=3D8
