Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D10D191F94
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 20:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779221130; cv=pass; b=nSFPbkCf6UpqUdHqSJvARlTEZjqBPvXQ54hfgqB5LlAXtroqlWY5GeXP3Bg0lwA7CZw2di2gE6GehIR6BTrNySg3NexoICLZeHKU3lp8si44rx7zZMgzgsZHDr2GLhdUresYQM8BxMD7uh4uMuRVt0RQ/NGfM0JMt2+zk7tnjrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779221130; c=relaxed/simple;
	bh=vMHyaQd3mfK40MNsuooAQ762LxgJPrshxZ7MJzn5ZqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GLF35edPibpWM/LIv2S5Nzi790dknZnhIzTDObO6usGkwJdkDUxYJNQnn/LsGzR1gnYWlD7MzM1UFS5VjhePXZr7yQqCv7520AsyVIzfuwrGBRZqEqNSzIagsFrFd2zbRdFSdYOVuyg+jxR21tZNIIDZDAKtzeFpM6QB6WnHR/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ad7HA6AS; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ad7HA6AS"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7bdc947aa88so30439277b3.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 13:05:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779221128; cv=none;
        d=google.com; s=arc-20240605;
        b=diM0OA85xVwlFqollol3gqSNcNBHkZCRdfHjBIfDkhHKigVPy77uydG2+PYv6k7oLm
         RK4KQZS67vzkEJt/nUBP/1fg04rl+BRT9ezfQ35yev7Px4R8uYNiqBhQIF4rH0wYGSvS
         wHiHGDlkwX+qVDDIjCxGAoQGaKGWW1y2K5kUbgS9kyisWQ1PDiFQywSsQTQ6n9btN9Mc
         0n1hYticvBzrVxQyNHovnXTD/Zny9TjjG156xS3PJu/JJp3mwrpzMuhu0U0CopEBz68E
         Rddw0+25MC45O5tp4aK1yZKltCZ/bzZK/PyxV1RbmnjEVSSijH9Lw/BqtJwOkx0xM/B6
         GtQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SC/K1ivFHTPQh2xDJ2Hb1L4zl8Ws5/LljHDje3fKKHI=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=Wu5NnkZB0owSU+cPIPSstUg+ndowLpkcFgQ3RA6davvl63dpAf5l1OYBXJeJD2Tzvq
         YOuP22RHDcwzHKmJ4LgTJD5WtnSpg6s9nu6cVtbOWFlt+iaI6E7W1Q+gwhWffCI4Iq7U
         6OYxgMLNFOJ2+6pddsZDiQy0L/TKCl3rPtWqUf5d/NrmH45i/KphZbmIELfRXxhojEK+
         fqq5KJu2eFLUSOPdttGdeY2eoXEWV0ujPWXs5wYOFrWc04ebiFmB8G9axe+4MjpyQKcJ
         SIW3zA2RWNKOnbvxmqczXAB9vL0hk9SysdZX3uMwH9swDwvh5VnqpKHZrFHi4bIagnNr
         bAWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779221128; x=1779825928; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SC/K1ivFHTPQh2xDJ2Hb1L4zl8Ws5/LljHDje3fKKHI=;
        b=Ad7HA6ASTn+CEqsygSBwEJuI1xzY8YqSI+Z/vZY48igVFdpFzXmrkERYasWye4vftQ
         McxL21idaFYcwvfmJ6KOpvZpogMZeY9tuz6y/nUVlVv8bDst8w1g31teyz5IiyyVsF+P
         N5uO1YRDsH3URXlZLc07iUmVWYTakbzjxLAsgtNK8SnXfUfocY2wk24qo7UswjdFFlTT
         OPfjn+5I0pBwSB1osvWOABeG2KmVNa0wtkhERZOAfswncQCS8Aw8dU1GbEbOrFcxI1CW
         EH27/SxOJEkqLgrY3c1BBWERb4LBuv1U9epkuwZ1iePtCVIhWi49ZiwxVH7QGmboJqhQ
         31bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779221128; x=1779825928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SC/K1ivFHTPQh2xDJ2Hb1L4zl8Ws5/LljHDje3fKKHI=;
        b=LFLG+91uqkPMT4RB0plyzG7qsQ5V8mLpUt72meGzJ2kAtPd8B673R/zcqo35S+ckLV
         dVNlP9nZgFxB560Uz60ZjT4Pu6Qf5tq10wRzpP8kWFEO/5TuGdOg/+T0kxBduIKWOo9H
         ll4cV7w/+6vHZYwv/HMu86hYwJwlrE1JiZC0D7ci5dKuFOcfB6pgiTr5SKxHaa6tPMbk
         JpQwcYyFvfRqhfY8Tyi2gC+nDJb5mkUl8SJ0KS+ILkzXos9Fsfk4AsuiqcqOrVnmcTYc
         bak0LYjLexYXTem3p4xEvM3uM6cYRwT3cCouxnBPiHtCrdbAYiRKXHPLbFHtCYrIlIYs
         vP1Q==
X-Gm-Message-State: AOJu0Yw6TkaLr8ZWg5nbMOcBzQ1Lz6KEnKSA6wobC5hL9gQOJhSQCNHj
	vdjoXFlsmEHlJrDluSjUQKOUx6EtPEOo5lAUe38ZDsP8r51UUQIcahvzMC70FPw38dW8EwJhIhQ
	qwc9mZLhz/FV9HcOjS/cbJita86ZwfX0jEQ==
X-Gm-Gg: Acq92OGYjJO6WkTzqCxrvnRW+bVRcco8rMmHFmIxq4yv6bUd4lhxNN/1FOiyfDzSkuv
	w7MRVDKoYqOE4DsRfxvdcSCJFgCHAueAR03fyA3Ox92N2JWXIyHq3fwBimJPZe06/di6XiUL+ng
	1OlXCRulinOenw/kx6V7aEw9CyluV4s35rKmDbIOUgUYddF3jAsnH+5ly8q9jL6ivoLwBFQm6/u
	w807flj4Hmv9C8sA2sh+y4sgx+KVaV7iCVUZ0F/8VpSPKTnXp1s0oi5aNdbJgHptY75AeTBvjko
	uwDGumetKjZ7IOavJiyN
X-Received: by 2002:a05:690c:6d84:b0:79a:d2ba:3c24 with SMTP id
 00721157ae682-7c95cbe8677mr237464337b3.41.1779221127771; Tue, 19 May 2026
 13:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260519181314.2731658-11-ameryhung@gmail.com> <20260519190330.207401F000E9@smtp.kernel.org>
In-Reply-To: <20260519190330.207401F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Tue, 19 May 2026 13:05:14 -0700
X-Gm-Features: AVHnY4JwyneWSluDEtuKcGNVmJPkvn_RkvdXyGAvQpH4-Hq_0A1isckPojyQxII
Message-ID: <CAMB2axMoGXL1bD7kCW2VC7gJ9Qsbg8rm84cmT-PHJLA97bE8vw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 10/14] bpf: Fix dynptr ref counting to scan
 all call frames
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 12:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] The macro `bpf_for_each_reg_in_vstate_mask` incorrectly comp=
utes the `stack` pointer when iterating over outgoing stack arguments. The =
new `dynptr_ref_cnt` function uses this macro and dereferences the invalid =
pointer, leading to a verifier crash or security bypass.
> --
>
> commit 2fbeda3e91d76b77c3a4fe5a3269d7a89c9d8588
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Fix dynptr ref counting to scan all call frames
>
> This commit extracts dynptr reference counting into a new dynptr_ref_cnt(=
)
> function to check whether a referenced dynptr can be overwritten. It uses
> bpf_for_each_reg_in_vstate_mask() to scan dynptr stack slots across all
> call frames instead of just the current frame.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index b7984c42ca145..97eb8033d732e 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -786,10 +786,29 @@ static void mark_reg_invalid(const struct bpf_ver=
ifier_env *env, struct bpf_reg_
> [ ... ]
> > +static int dynptr_ref_cnt(struct bpf_verifier_env *env, int v_parent_i=
d)
> > +{
> > +     struct bpf_stack_state *stack;
> > +     struct bpf_func_state *state;
> > +     struct bpf_reg_state *reg;
> > +     int ref_cnt =3D 0;
> > +
> > +     bpf_for_each_reg_in_vstate_mask(env->cur_state, state, reg, stack=
, 1 << STACK_DYNPTR, ({
> > +             if (!stack || stack->slot_type[0] !=3D STACK_DYNPTR)
> > +                     continue;
>
> [Severity: Critical]
> Does bpf_for_each_reg_in_vstate_mask() safely provide the stack pointer w=
hen
> iterating over outgoing stack arguments?
>
> Looking at the macro definition in include/linux/bpf_verifier.h:
>
>     bpf_for_each_spilled_stack_arg(___j, __state, __reg) { \
>         if (!__reg)                              \
>             continue;                        \
>         __stack =3D &__state->stack[___j];         \
>         (void)(__expr);                          \
>     }
>
> When iterating over outgoing stack arguments, it calculates __stack using=
 the
> local stack array (__state->stack). Since out_stack_arg_cnt is independen=
t
> of allocated_stack, __state->stack could be NULL.
>
> If ___j > 0 and __state->stack is NULL, __stack would evaluate to a non-N=
ULL
> offset. Would this bypass the !stack check above and result in an
> out-of-bounds read or page fault when evaluating stack->slot_type[0]?
>
> Additionally, if __state->stack is valid, could this evaluate the same lo=
cal
> stack slot twice, artificially inflating ref_cnt and potentially bypassin=
g
> the ref_cnt <=3D 1 check?

Sashiko already pointed out the issue in patch 5. The fix is to assign
NULL to __stack for stack args and then the existing !stack check will
be enough.

>
> > +             if (!stack->spilled_ptr.dynptr.first_slot)
> > +                     continue;
> > +             if (stack->spilled_ptr.parent_id =3D=3D v_parent_id)
> > +                     ref_cnt++;
> > +     }));
> > +
> > +     return ref_cnt;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519181314.27=
31658-1-ameryhung@gmail.com?part=3D10
