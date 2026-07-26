Received: from mail-wr2-f2.google.com (mail-wr2-f2.google.com [74.125.225.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591971EF39E
	for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 02:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785031563; cv=none; b=g5s2M7G9Dw1AR6jLUyTgOZ5YH6Mhbuu+ZLLPGjCffd6AU5UIsh4g/ax8Cl2YZ2rrV3kO0AVqXhALPOEuXrrwNu5j/Cgrr3DaCE0T10W3m3BViqyHgebWMI651MGNLOt3lEtwr1MbezarrocXREdyrBi0/1PyfbQ8JGFAA6N75Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785031563; c=relaxed/simple;
	bh=sN4RbrModujGLKTBVjG0end3RnEdzfJOGujmwjCeq5g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ffV0UDRhZkOwmRvp0Ngv+XJ3qU9Lk2/w3DnITyK+8+64ba2RItJ9QvOvyEVh28iWHRqRq6dCuXQQp5V/TWGpEHoCvtidWfXtSD1xQwD4RPwZHaJWxdoL/YZPUxGXgDKpQD++rH/tM4eFQYt0a4ZTM827Y31iPlOrwY7ElI7KPf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLIrkoba; arc=none smtp.client-ip=74.125.225.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLIrkoba"
Received: by mail-wr2-f2.google.com with SMTP id ffacd0b85a97d-47f8e9b1c37so327213f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 19:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785031559; x=1785636359; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+2CWXHagWnojowIm/br50AnM1vZRtkEZ6hP9eHXWtFg=;
        b=CLIrkobaADOfJ+MoZEPmvQwq1WphfIPew5maCerEEsKDVxjwVd90U6Pa8px2s4TH2G
         3tBiNXqyGnixJbU4IvQ5VaoR7fjXZ7NPO2KSXSnMYjF6ej0gSnRmlZhLNQ6wFDxrb7EC
         nJzXJAV3t2Yl5oyOlJx4a2o0MCTnzy+tM7HynbRV2q1BMaR8UpP1EXPoHSg2NQJi+OZs
         SmLpiccK5mIsonC9zyYFoHZy/Zi8ROgBdj+elu+z6o0O5E8gSEWmDrRcAciSquRt8qy3
         Zh2GTs6aTlYeQF6QlnfdV0qu161Snbl5b3QgMOlTAZ+8/CaE3G6ZMXC+pmAUw5cfpVd3
         6mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785031559; x=1785636359;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2CWXHagWnojowIm/br50AnM1vZRtkEZ6hP9eHXWtFg=;
        b=BM7QLEX/D3aKoDpq+2XYztXFIRLIWp5+Ni3NJmVu6+3X1JyBWsRpCEkoMkORTCX8xN
         EnA2yhy16EQiH/ZyfsGdZoLj56zbvJMMo7sXk2y+wywtpkK4sjuQjFoeu5vFy2LSNJO+
         zfNyoH+ZfZMs4idXcNoABBNQEiqXzF3C4E7S1QBwojJ83w0P+sZYfjvg7Eedi8B2dQuV
         mcyO1ulsUHN4RucHRsu14i6QFULPhb6ImuCR/mgQFKIgpUNGqezQK7+DU+JrjIum+hez
         QLnlTrFay8E0RE2jrTyCOGWwD/IOjnPciNU0coie1ugSuaeZSAXPULjYRRz+Ut9iCbMY
         L9gw==
X-Gm-Message-State: AOJu0Yx204F/e5NzUM1saZhoFLXvL/G8DlUE2LXF6gXAJ5xye+kXDJuv
	PNQioBhJ9KNNhfO+q9Ukv/7MXAyR1bfypOBEkB+eWLyzy5p0XFSQ+o/g6EyqPTXN
X-Gm-Gg: AR+sD11OY8341iM62sUUaG/pysR03kyg1CjtixN73CVHr2X7e41nevOZnIbdj2AvdCE
	iCIxZ4+txnMKPmlqfZCKpSUxqpAPkt3lqjfUQmRtmxlJPwcmtoWVIzkGqaNspbcrV7Uj4/r7o2h
	PbXEMNeyvdkdrY/xmNJz1fPsZYptF/IgrctgcBYZDHIXMBY7FWCkjFgbnoiPSp7Xyy+NQTkQf1d
	5mUx7lkpwT8D0VTzbym8bUlGhEdwPCOsKewE9Jr6QbG9YplaRdlhQ3ZywkOSwa4rC7mYJunyOmk
	XRNwfFPL7rUBGF1HVQusLPBj/MrE+LSiI4XpaHeTFtKtQlsTr+LT99/DGomCmOYQMdvxTUZBmG2
	0Nfa+JyUrWB9TMqIdYAdYT+SPXFIPKgrFVut4M1P6vxFkTXsD2JWe1hVHneKFEqbWMtL5i89wBi
	RaD46zk5/9unW925mnc5sKRnKTQRNpZRsgOyYsX3fbkuiYQQYYayVOiMloLQ3I5UPKD6mqalNaU
	U7QSW9PgRuUC0rd50y29tx+HQmNkNZJpMvR+vVYKr9l
X-Received: by 2002:a05:6000:40cf:b0:47f:77dc:b072 with SMTP id ffacd0b85a97d-47f9fc8fc9fmr5707559f8f.18.1785031559439;
        Sat, 25 Jul 2026 19:05:59 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm35234534f8f.22.2026.07.25.19.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 19:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Jul 2026 04:05:58 +0200
Message-Id: <DK84VLH9CPHS.1824I69UOMUTQ@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 8/9] bpf, x86: Fix stack-passed arguments
 for indirect trampolines
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260726013105.3689867-1-memxor@gmail.com>
 <20260726013105.3689867-9-memxor@gmail.com>
 <20260726015112.7CACC1F000E9@smtp.kernel.org>
In-Reply-To: <20260726015112.7CACC1F000E9@smtp.kernel.org>

On Sun Jul 26, 2026 at 3:51 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The patch fixes the stack-passed argument offset for indirect st=
ruct_ops trampolines on x86, but leaves the exact same logical bug unfixed =
in the ARM64, RISC-V, and LoongArch BPF JIT compilers.
> --
>
> --- Patch [8]: [PATCH bpf-next v2 8/9] bpf, x86: Fix stack-passed argumen=
ts for indirect trampolines ---
> commit 1625042935fc87b38acf83c8304433545d672f35
> Author: Tejun Heo <tj@kernel.org>
>
> bpf, x86: Fix stack-passed arguments for indirect trampolines
>
> This patch fixes the calculation of stack-passed arguments for indirect
> trampolines in the x86 BPF JIT compiler. It introduces stack_args_off
> to properly handle the number of return addresses on the stack depending
> on how the trampoline was called.
>
>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
>> index dfb5335ad8374..4b349ae35ebf9 100644
>> --- a/arch/x86/net/bpf_jit_comp.c
>> +++ b/arch/x86/net/bpf_jit_comp.c
>> @@ -3075,6 +3075,7 @@ static void save_args(const struct btf_func_model =
*m, u8 **prog,
>>  {
>>  	int arg_regs, first_off =3D 0, nr_regs =3D 0, nr_stack_slots =3D 0;
>>  	bool use_jmp =3D bpf_trampoline_use_jmp(flags);
>> +	int stack_args_off =3D (use_jmp || (flags & BPF_TRAMP_F_INDIRECT)) ? 1=
6 : 24;
>
> [Severity: High]
> This is a pre-existing issue, but does this same logical bug need to be f=
ixed
> for ARM64, RISC-V, and LoongArch?
>
> Looking at arch/arm64/net/bpf_jit_comp.c:save_args(), there is a hardcode=
d
> offset that unconditionally assumes two frames were pushed:
>
>     soff =3D 32; /* on stack arguments start from FP + 32 */
>
> Similarly, in arch/riscv/net/bpf_jit_comp64.c:store_args(), there is a
> hardcoded offset of 16 which skips the first 16 bytes of caller arguments=
 for
> struct_ops:
>
>     emit_ld(RV_REG_T1, 16 + (i - RV_MAX_REG_ARGS) * 8, RV_REG_FP, ctx);
>
> And arch/loongarch/net/bpf_jit.c:store_args() shares the same hardcoded o=
ffset:
>
>     emit_insn(ctx, ldd, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP,
>                   16 + (i - LOONGARCH_MAX_REG_ARGS) * 8);
>
> If a struct_ops callback with more than 8 arguments (or 6 on some
> architectures) is executed on these platforms, could it receive out-of-bo=
unds
> stack memory instead of the actual arguments?
>

Will be followed up on separately for each arch.

>>  	int i, j, slot =3D 0;
>>
>>  	/* Store function arguments to stack.
> [ ... ]

