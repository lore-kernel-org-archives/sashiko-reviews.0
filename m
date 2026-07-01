Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E02024A047
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 13:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913593; cv=pass; b=D3qynUJlQpdACguIr9ymp1HOuqpl0Rkh6gECRwMoCZB7WCgR4PJxwef6Vu1nnO6VV65T2PYRDLFLn/P+/rCQ7TjeviCS15LnOqenqKYeEu5BaHJnRUKMz1GK8vK12ciiLewfCKWPLb/vtxNo7o4zu2LYt1Ho2z24DmxMPffGvGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913593; c=relaxed/simple;
	bh=Ygpn0hK1smQWcR0LYsrbFcRF2NaJlsQXSFnetNp/AFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCJahH0gIIOrJ/uDQm0bgU4CnYyUfcJASwEIXiX6K/OuZnB+zr84sc0TNGwVcz19DFWbuKiQlUGFwwHROIbIXEDTV+D8j3ObVKpzV56QVPjOh1PYY/9yKWbsvkaR46ObqBYFrqoZClr1PCKuo6D+pYOwOe5H/TKf3x6KEpnrpvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=j+lFp//4; arc=pass smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="j+lFp//4"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-495c49f8eccso514622b6e.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 06:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782913589; cv=none;
        d=google.com; s=arc-20260327;
        b=NZJvqwmFvu5S7/6kd3Og5PNmfhAUFt1KzQAsl1ZigYae6TmUoXVAACvoB0FUxZuBsd
         ZSsLRtcF6+cefYKuePWo7nt5xElD0Nyi/IVuFad/2PFyQuvR4NSN6yx58kBDBVVy/XxL
         0Pa2a0R5KIvD12QCIXBrcFAE03QkhpZ2nQhIjO+1hTkRLq/QLM6eS0SyDpnPrgFS0q+t
         0zd9/n/NBo/cqkh5SIOJuP8GMDJTk7l5ZuETxnzKXVhu0cFny2hAGzDt2DxtQTcEtnMV
         g104NbNOgcrfV3IBzzM0piM6MWZkeLlAWILso41tZJf9OSL60WwSPw9XxUQTs3HgI8hf
         bZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6n0sBFaOXUEf6Jh9qw+qogE2tc0XtPoPSK5HD/x03Dg=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=RFAWsRjuQxlYe5Gn+WVsgQg9rKk5Dt4BNgFjnxdancfiJnjQp+84cCbQ6mjACA1U/0
         JVHwRMxiOcCW+yLyLJdVUIeiT1Fd7/2PNn1lBkTp3iTfPyzVCXtHZbFJbHq44XZcGU/I
         gGY87NGUjXcxQwESzY6mtr0UrAtdmW6FY9FHeI8fTtnzMMAHhggtGRp22ggodpNR50Ye
         YzxNgqnVo2IWCqLhtgpDk9x9+ZakAbrJFFm8i7cIKogB/5RFGr6J6CnU5oI72/gnC0dz
         g+Cs27ajWec/mi8KVoxswJ1t5t1ujJZx/vILgMeFnjWjkS7ErW6Khy3LpgKKfDhk6Y5I
         auzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782913589; x=1783518389; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6n0sBFaOXUEf6Jh9qw+qogE2tc0XtPoPSK5HD/x03Dg=;
        b=j+lFp//49atX8lhBaif5fNdywOcDeG/e6XNJVALZtfqKq1ZHN23a/kHMqgjUfEj0Zf
         1ZrzdcWPpGdbMMq71LHJvFZX2TLlnl+YlHer/cjQCVJrK9xgTGl7lNWySsRobuiOwZEf
         +88bLOTzrbh9Xy6rX+2N/NTiUK+O/EpbCxLxS+GKhyMN8Z2X6rNmT1EBZeUFFDAhcPkH
         Y3j8yVTxD4QnSEO8BuJzq4TAFkcc82F7JMMFVxPSNvVsvq1CIhz9zzgyshH11Q54JZ9a
         aoCJgY4MXFDcqpLDMDeTjSWlH3PMlNhZmnOMaX9Fvqieo5nA66q9/VWHTGntYo+i1ycG
         Qkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782913589; x=1783518389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6n0sBFaOXUEf6Jh9qw+qogE2tc0XtPoPSK5HD/x03Dg=;
        b=i5YbLdt8EyDaE6Qcper8fy6OrJ/rUw3AFosIbtCWasnXud9wEaDaCCbBEoZKv9ynar
         kSv4hAGDUAtr4oncGuXOGsh5TW3CzleE3GrPMh90fkaYnxseGq4dWk/LgWmc/K7/vHUz
         mUOK7aktlho+ZOtxkckjuKfT6I++WgeZZiIFRbIpP0bRN2HwGok5LxmcxaxnO0PBRd6v
         OHaC0NLmrqYc6+llByKC56VgtreyXAED7Hx10sKvUZsbWRDm7sA0dhDUKF4coPWaATIf
         2IJFP1J09L5flbHtJ5ZfYNFDRZZLqLAkCisoxbTDmGMAzT9GHLn9sUaT3cYTxH7ZwMOJ
         uKEQ==
X-Gm-Message-State: AOJu0YxgMq5BC7VFc0YCzttNoBNhblivYzquE69FvIYaZ2RfP9VkbE4y
	o8zz4IXedMaWBpUBhYF1J1V1RKDUuXIsqRgaPlr7tHdPGAzxWFZl5tkg7l3z/OLJg/ckGGXltQz
	7a8drwCxSGNa3UgrtFb8Ico13avbAf2cR7YAyLD6qc/madsIQ8/snI2urIQ==
X-Gm-Gg: AfdE7clrJQfLcbuvtzV7CO15iyewn4qo+buIE69yGg4d70xaTFtqQG6JTeXV9a7CQCQ
	1gWe2DJ3Plqs2UlCWsR6UuxvthdG4LIkUKLdG2q5a13zJvVM4unmZejRdHuTDcT75qpjs2yHIM3
	bCXoYTqz1bGMLjiZNtBu+hDB3APKSi0sa74U7Wwn4svvHX1CNgsel1eON3CFKcWZIcEHErXgTGm
	/5HxMzfRpwHCRfTMLB4Jd3o3FR5xZv7NFrKqV5aAnGKrQMaOCe+aVJ2kXR2ozguZL01xLzHHBmb
	kTVyfTEy5Q==
X-Received: by 2002:a05:6808:190c:b0:48c:4c00:596a with SMTP id
 5614622812f47-4962d70ee64mr384835b6e.5.1782913589182; Wed, 01 Jul 2026
 06:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701122948.57584-1-cuiyunhui@bytedance.com>
 <20260701122948.57584-3-cuiyunhui@bytedance.com> <20260701124631.32E671F000E9@smtp.kernel.org>
In-Reply-To: <20260701124631.32E671F000E9@smtp.kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 1 Jul 2026 21:46:17 +0800
X-Gm-Features: AVVi8CdQEJSpt-0JWy6AZwBd7PbD8qH7GvKvOCKZEUE_xOA1QCretpoH4h0GtzQ
Message-ID: <CAEEQ3w=OUGQg+-eXEWpY7-74Q9MN0Yd7aPXMwoa=Q6XF1K=P4Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v6 2/3] riscv: introduce percpu.h into include/asm
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Wed, Jul 1, 2026 at 8:46=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Inconsistent naming and semantics for 8/16-bit vs 32/64-bit 'andn=
ot' percpu operations.
> --
>
> commit 8c96e5a266e5953bcbbc15476c253fbdd307508b
> Author: Yunhui Cui <cuiyunhui@bytedance.com>
>
> riscv: introduce percpu.h into include/asm
>
> Add RISC-V specific this_cpu helpers so common percpu operations can use
> short architecture sequences instead of the generic implementation.
> Native-width operations use AMOs, while 8/16-bit operations use Zabha whe=
n
> available and a local 32-bit LR/SC fallback otherwise.
>
> > diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/p=
ercpu.h
> > new file mode 100644
> > index 0000000000000..34483253e946f
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/percpu.h
>
> [ ... ]
>
> > +#ifdef CONFIG_64BIT
> > +#define PERCPU_OP(name, amo_insn)                                    \
> > +     __PERCPU_AMO_OP_CASE(.w, name, 32, amo_insn)                    \
> > +     __PERCPU_AMO_OP_CASE(.d, name, 64, amo_insn)
> > +#else
> > +#define PERCPU_OP(name, amo_insn)                                    \
> > +     __PERCPU_AMO_OP_CASE(.w, name, 32, amo_insn)
> > +#endif
> > +
> > +PERCPU_OP(add, add)
> > +PERCPU_OP(andnot, and)
>
> [Severity: Low]
> This isn't a bug, but is the naming here intentional? This defines
> __percpu_andnot_amo_case_32 and __percpu_andnot_amo_case_64, but since it
> passes the 'and' instruction and operates on the value directly, it perfo=
rms
> a standard bitwise and rather than an and-not.
>
> > +PERCPU_OP(or, or)
>
> [ ... ]
>
> > +#define PERCPU_OP_8_16(op_name, op, expr, final_op)                  \
> > +     PERCPU_8_16_OP(op_name, op, 8, .b, u8, expr, final_op);         \
> > +     PERCPU_8_16_OP(op_name, op, 16, .h, u16, expr, final_op)
> > +
> > +PERCPU_OP_8_16(add, add, val, add)
> > +PERCPU_OP_8_16(andnot, and, ~(val), and)
>
> [Severity: Low]
> Conversely, for 8-bit and 16-bit operations, the andnot operation actuall=
y
> performs an and-not by passing ~(val).
>
> > +PERCPU_OP_8_16(or, or, val, or)
>
> [ ... ]
>
> > +#define this_cpu_and_1(pcp, val)     _pcp_protect(__percpu_andnot_amo_=
case_8, pcp, ~(val))
> > +#define this_cpu_and_2(pcp, val)     _pcp_protect(__percpu_andnot_amo_=
case_16, pcp, ~(val))
> > +#define this_cpu_and_4(pcp, val)     _pcp_protect(__percpu_andnot_amo_=
case_32, pcp, val)
> > +
> > +#ifdef CONFIG_64BIT
> > +#define this_cpu_and_8(pcp, val)     _pcp_protect(__percpu_andnot_amo_=
case_64, pcp, val)
> > +#endif
>
> [Severity: Low]
> Because of the semantic difference between the underlying helpers, the 1 =
and 2
> byte wrappers pass ~(val) while the 4 and 8 byte wrappers pass val.
>
> Would it be clearer to harmonize the semantics across all sizes so the
> wrappers do not have to compensate?

I will fix this in v7 by making all this_cpu_and_*() helpers
consistently adopt plain AND semantics.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701122948.57=
584-1-cuiyunhui@bytedance.com?part=3D2

Thanks,
Yunhui
