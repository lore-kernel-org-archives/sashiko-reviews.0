Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D24024886E
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520271; cv=none; b=Odh1oLHKDLQxpE+SdyZlG0kOXU7NCnDMUWLcPj4GKoIvOWWibasnvPuEYxtgIzUU8ZpF/t7WmTHbum00v4S7J1+MtLd1cbEiBGOfc7c91NYcQj7bTxUx35nLZQUuH0tQLgDlfNE4fzXk605KcYm4OyiV0RC+pWMYjtqq+k+zwds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520271; c=relaxed/simple;
	bh=Z5lIjwfXyvI/AAARw2b8cgSv7SSdEPHER/esN0f2++I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DlNF4RXLj5Uy+yTP2RWG0XkePlwKbtPG6H0UQaeYh5tC+9dfceLewyWoU2b4/ek3oHL5tS8aBeURNV4eYkHPqFtlA4DD5ij/AdcvdY+F4+1olrwCsGtQNMZfJMZN/AjjcKSLTzDlIU/yIa/OSgfgqt4a53Ts01LDTC3DUk9pbss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHfAsUvt; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHfAsUvt"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49cfcf2548aso1503485e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520267; x=1789125067; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JqyYlzzJSLXn2Ht9uRHoB8nycGZ7qHQhQ0IIRMTHvS4=;
        b=jHfAsUvtOBJRaDmGPqfK1yEAVXQtY7ve4x/rFdtx2HTSd2rtEsD5+Ujpv84MkSXfqK
         vqC85tWmhhgP2zxtwJItQYZNXTJnMwG+yiPbot+rVG5YFa9X3R8p78WEAwBh/rgTDOgE
         Mz4mgzbrM5o4FnB79yPrgG08gK7K90vf2yeVlEPVY1Y0UaX5MPUStTKQeSMskoxteLap
         dU9pSF/dazQR6Dld4qPPNd2ucx0X1NUOl6qRCVeskAjtFkJc6vD0nKdGoLzpgG6Brq4E
         oee59q5UUxMuihUNY5M5kOvQ2In0GoNR3dphVG0JEe6n7Ht0LR7EA2S4FlZV/o2CGGLI
         XUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520267; x=1789125067;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqyYlzzJSLXn2Ht9uRHoB8nycGZ7qHQhQ0IIRMTHvS4=;
        b=hyYB7sqwTtVmi+gcc55LmQirkZtVCfEVynOHZb2F6W8nw3ssFW8iMu9Lb7KhFoOKUN
         OJFavz+bTTQD24mwRa1GTqk9CcDtpruihWnsd+ExMFsrqclsL/HlYI+tU4pqyGTNwD8N
         KWGniWpPvMs3Bh9Cy0bbAZq155KbaT4SFonGWtW9JBA/FyLND776GKggA2hLrg90SmEr
         IBuMDzgNIVLMUY++FhwHHxa4QVHYzcUrd/U6Gqp9CWHGwOjvyMRbLh2eoonibft7ByCw
         s60e3OKt9D/6l2BB2f4ZDTx6vX0dq3bQeR98DQc1dOllvLOc942qkfP0laUD6Cf7daDw
         DxSQ==
X-Gm-Message-State: AFuF++liXqHpKS5NLd3C6ANv6OSm8aMgPnaf4rf9cll3rvqa1Iy7r9XL
	ERwEj1dZU6JtLYOP6+lmvpMacTTxHtQ/E4xiCv5kU+eKqf1s1AdLVYxLqzw9YXOq
X-Gm-Gg: AYBFou19jmCDy10JWcHAW8pAUXBndtc1BKq9+d7i0X3q/wHq04pRQxia2zr6pm41YKL
	tZcsX/0WpFpQ04piv/TIn8esyXPTN2VEFtLPGiWpyoQft5+goD2UHoc6JOpoUlEZX123eqNCIQY
	rKEXzJNhlQg22VjQLbrV5M8gwqoFxZhwAz83sMcqko0ck/tbpBcSfm7RBaColCj2C1aY7etMsiX
	u7p+O8Vkp/zUme1Vc37KPPRU/nlDItI/AS00guga9XZszxwkGXC6bp6xBjb+YYgKml1Gi2Ea++3
	Cq76zTQ4t1y7d19leRiKLnbs2WZYQD3/kGQfpqdzh0Lo+XVmaFgcyw8MHSXvQFKHbwbgWokc7VV
	0kYflidQshxXXqmmkwYuGfrYKzjtnoyDx7pQE1KC5KXmY1F6y6eFkRnEhOqMADeInhSqSheoE9k
	2rSXfQ3GRh+GxWSOR0Qp1ph+gffZpMAh8kj6Bk4OTq+mwvS7XDE0HTiaYJ4iOz8ZmzOYRr83HlC
	MnT/MHl2fe/JExJxHwG85TVELVvWHsOr3KgrpbDb9vjlXk5tOUrPOXu5uTmXjHjEkKeKGFOD3AI
	MYO62NsR1pSmv6P5dNFsCL02avcKKVso6mv4dg==
X-Received: by 2002:a05:600d:8499:10b0:49c:ff3c:973f with SMTP id 5b1f17b1804b1-49cff3c977fmr4086005e9.24.1788520267220;
        Fri, 04 Sep 2026 04:11:07 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885cb03asm5483852f8f.37.2026.09.04.04.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 04:11:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 13:11:05 +0200
Message-Id: <DL6HIRCS6H45.1323PCUH1EB9T@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf 7/8] bpf: mark the zero register precise for a
 register-form NULL check
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260904083325.2083493-1-eddyz87@gmail.com>
 <20260904083325.2083493-7-eddyz87@gmail.com>
 <20260904085722.7BF111F00A3D@smtp.kernel.org>
In-Reply-To: <20260904085722.7BF111F00A3D@smtp.kernel.org>

On Fri Sep 4, 2026 at 10:57 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] The verifier fails to mark scalar registers precise when `bp=
f_register_is_null()` is used to satisfy a nullable pointer argument or kpt=
r store.
> --
>
> commit c721af04f2965a6636b3260c058c2531da5526e0
> Author: Eduard Zingerman <eddyz87@gmail.com>
>
> bpf: mark the zero register precise for a register-form NULL check
>
> This patch fixes a bug in check_cond_jmp_op() where comparing a nullable
> pointer to a scalar known to be zero fails to mark the scalar register
> precise. This prevents malicious state pruning where an imprecise scalar
> could bypass safety checks and lead to a forged pointer dereference.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 303368460ec10..fde5d046b6e32 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -17052,6 +17052,15 @@ static int check_cond_jmp_op(struct bpf_verifie=
r_env *env,
>>  	    type_may_be_null(dst_reg->type) &&
>>  	    ((BPF_SRC(insn->code) =3D=3D BPF_K && insn->imm =3D=3D 0) ||
>>  	     (BPF_SRC(insn->code) =3D=3D BPF_X && bpf_register_is_null(src_reg=
)))) {
>> +		/*
>> +		 * For BPF_X the zero is a property of this execution path,
>> +		 * hence src_reg has to be precise.
>> +		 */
>> +		if (BPF_SRC(insn->code) =3D=3D BPF_X) {
>> +			err =3D mark_chain_precision(env, insn->src_reg);
>> +			if (err)
>> +				return err;
>> +		}
>
> [Severity: Critical]
> This is a pre-existing issue and not a bug introduced by this patch, but
> since this change addresses missing precision tracking for zero-valued
> scalar registers, do we need similar mark_chain_precision() calls in
> other places that use bpf_register_is_null() to satisfy pointer checks?
>
> For example, in check_map_kptr_access(), we bypass type checking when the
> register is a scalar zero:
>
> kernel/bpf/verifier.c:check_map_kptr_access() {
>     ...
>     if (!bpf_register_is_null(val_reg) &&
>         map_kptr_match_type(env, kptr_field, val_reg, value_regno))
>     ...
> }

This should be addressed by the following fix:
https://lore.kernel.org/bpf/20260904104203.345917-6-memxor@gmail.com.

>
> Similar bypasses without precision marking appear in several other argume=
nt
> checkers:
>
> kernel/bpf/verifier.c:check_func_arg() {
>     ...
>     if (bpf_register_is_null(reg) && type_may_be_null(arg_type))
>         /* A NULL register has a SCALAR_VALUE type, so skip
>          * type checking.
>          */
>         goto skip_type_check;
>     ...
>     if (type_may_be_null(arg_type) && bpf_register_is_null(reg))
>         return 0;
>     ...
> }
>
> kernel/bpf/verifier.c:check_kfunc_args() {
>     ...
>     if (bpf_register_is_null(reg) && type_may_be_null(kf_arg_type))
>         continue;
>     ...
> }
>
> kernel/bpf/verifier.c:check_mem_reg() {
>     ...
>     if (bpf_register_is_null(reg))
>         return 0;
>     ...
> }
>

The rest need investigation...

> Could an attacker use these paths in a similar way to the vulnerability
> described in your commit message?
>
> If a branch assigns a scalar 0, passes it to one of these functions
> (leaving it imprecise), and another branch merges with an arbitrary kerne=
l
> address, wouldn't states_equal() incorrectly prune the malicious branch
> because regsafe() returns true for imprecise scalars?
>
>>  		/* Mark all identical registers in each branch as either
>>  		 * safe or unknown depending R =3D=3D 0 or R !=3D 0 conditional.
>>  		 */

