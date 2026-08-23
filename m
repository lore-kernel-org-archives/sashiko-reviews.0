Received: from mail-ej2-f0.google.com (mail-ej2-f0.google.com [74.125.228.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130E430DD1B
	for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 22:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787524217; cv=none; b=pHrruEa+O8bWVhKQyoQHD1J8/gx7MFwgEJg7i/vxTBMv9jVaDi+z5fQJnvm2K7nUehiksGUzyZcUJ87vLrEbFDzdWT7T2JVqO03b+bUIQTdedz/vdxfk83/EG1kO3f3LC/w9FWIfarV3dAR4yNlI8JDfMYyQYZ5JOtMiTP/keXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787524217; c=relaxed/simple;
	bh=HzNHAp/+TJfUjXXWEnogjJGqkrJ3ii1AYw6lhaubKoc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LPCsj5+54Dwnu3856c2NCdzdMb3W+jRuBDLbc3tQiopgehuamTXoVfgnt9qWqU2qC9n7aZWFDat/80aSFjsbwECZFxhchpEwhyZoEfnEYr2a7l/8E5NMBXLMj+wipMeaQPtqtpdHtAZanJG6XEc+d6qn5h4xgXUcU2SV2VvTQ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+Liy8a/; arc=none smtp.client-ip=74.125.228.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+Liy8a/"
Received: by mail-ej2-f0.google.com with SMTP id a640c23a62f3a-c166aef4f02so193202166b.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 15:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787524214; x=1788129014; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Dy5Yv3xbtQhVQZHI+P6ldc3t/46mRsEhINgaHLDtjM=;
        b=W+Liy8a/0gKNpwDBp7qVevCKDmn2IgiMNRWIfpSdapJ77bmZ545RcpDs6ms9E/pPHS
         ePa1IJJt0zM0gwteRNiXSiwC+Wa7+NK9yX3RpDx9c1tDcwY3Rw68pCJWEI09MVDYrgMP
         sjHJGnTXAY9DC4rI/9z2N7FIYaEIr/PN6jYycLCSigrHL6HpuK7q2M7LJE1AhamuS01M
         zRs06wM1tEFDHtjB2tY2mwez3v8yD2ZqQKUuzBTrw8O7fzsZGOEcfginc4xcrEKL85Mh
         iKtAG4n5qeNiHehRFUPZH0OC+Y/KAViRx/zdpr/YZRaJtePngjUJ9v+dBeMa9yH5VoVh
         SSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787524214; x=1788129014;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Dy5Yv3xbtQhVQZHI+P6ldc3t/46mRsEhINgaHLDtjM=;
        b=SRTwOXcuvJWAqanLmpVAQQy5wYdh3TqLLaS14428GATg1HrcfNmaFjdleOjWwrzvZV
         GQ8G57xz7RKa2Wd/J4iwBBgDYkddDDysecKgM5Vab0hwd/Po+LsvBWHPV2h2Ndo5DPUS
         tS9m6oG7NXaiDsLRPdhQBFoomCRL3wB/d5IpGW0CYxpCpS0HJLpgodsM9htejy8/xLaE
         LcxbWODayxnHEi+lv5cR+NfIDmMJKzAAS2NI+BsnK08+Y8njLp0PGH0ifF1QUhk1CO23
         7/ChRS/BqzRT0W3/3hAFRUcyvr5LSeUWrm6J+wVQgiJ2NbpCGGD3334tSkUpB0L2eJh+
         dDiw==
X-Gm-Message-State: AFuF++ksl64TK3q59HL3UmeWox9apc3+EpNsjKAphpGz44xfVadRRx16
	vLZAgVWBNYEIXM2QfX1uSL0v2jchaQR1ZelTx112FUPYkyYM5NLWCs75ATZZNp4J
X-Gm-Gg: AR+sD11jMfdDHvxVIe540kdHfSSM2NmPSHcwLdggsBSgn83/C6LJNx4GmgA5vwIo92Q
	aYSnGQjqmmv7p02phgB6R4aIGVEcPl+rVj1TPvCq/AXueWd3rtL68bj5NCgSQW2Dj9z1plkH5KP
	m9VJWl43W+og51YLSQTmu+RK3HtKuPYXbqMjnXI2BPHRuiH/R1/oFhFvrd7dBV0iOpbSn19LfUX
	dhKhVyNmm4VtlcawO2LOhcc4/J/U4g8Q66txuBp90e48ZkfD1TICdppKmnqu8fVCstyGd186bjf
	MGXGXeT1MUV5BfOstGj5gJDEKb2KnwUjZSs2fifngNnR2mgIKI4yWMfshMcjEI1oQdWHe2Jt5C6
	WXixeqr6O2YIY4p7264pmXPq5UMRFPFXwNH9Tm+Y5HeiZllZXi2Gn4wBpsEL8n4kjgBfEwJGIgS
	TW/jXyUP6hAkoeDO2vOHH53S3Ek4anhXIK405bJlF38A6rNJlBy2ZMbYCA1eCfyLNqZTXWXg77F
	HzjD2Mmx+sPgLqiwk0UAow5F0sbviqEKzBvuX28D4C2vmBFHnuXJocdCnXi46IV94/kJNPeUfYN
	E5fhumuXWX1SjWb2R5Weuo78cm8grxf1XjuMNQ==
X-Received: by 2002:a17:907:6094:b0:c1f:9c3b:96a7 with SMTP id a640c23a62f3a-c246a6269d2mr2341625266b.17.1787524213841;
        Sun, 23 Aug 2026 15:30:13 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496296cafsm958999366b.14.2026.08.23.15.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 15:30:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 00:30:12 +0200
Message-Id: <DKWOG6YKM2NY.1FJHLE7BKZW9Y@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v7 4/9] bpf, x86: emit KASAN checks in x86
 JITed programs
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260822-kasan-v7-0-99afee6ef7fd@bootlin.com>
 <20260822-kasan-v7-4-99afee6ef7fd@bootlin.com>
 <20260821233332.1D2201F00A3A@smtp.kernel.org>
In-Reply-To: <20260821233332.1D2201F00A3A@smtp.kernel.org>

On Sat Aug 22, 2026 at 1:33 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] `emit_kasan_check` fails to save the caller-saved register %r10 =
(BPF_REG_AX), which corrupts BPF_REG_0 and memory pointers during atomic fe=
tch operations.
> --
>
> --- Patch [4]: [PATCH bpf-next v7 4/9] bpf, x86: emit KASAN checks in x86=
 JITed programs ---
> commit 6bca50db6e9af9416363fe2e60f4e42f924950c9
> Author: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@bootlin.com=
>
>
> bpf, x86: emit KASAN checks in x86 JITed programs
>
> Insert KASAN shadow memory checks before memory load and store
> operations in JIT-compiled BPF programs. This helps detect memory safety
> bugs such as use-after-free and out-of-bounds accesses at runtime.
>
>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
>> index 13ba3232993ac..8134d028a2f2c 100644
>> --- a/arch/x86/net/bpf_jit_comp.c
>> +++ b/arch/x86/net/bpf_jit_comp.c
>
> [ ... ]
>
>> @@ -1110,6 +1121,92 @@ static void maybe_emit_1mod(u8 **pprog, u32 reg, =
bool is64)
>>  	*pprog =3D prog;
>>  }
>>
>> +static int emit_kasan_check(struct bpf_verifier_env *env, u8 **pprog,
>> +			    u32 addr_reg, struct bpf_insn *insn, u8 *ip,
>> +			    bool is_write)
>> +{
>> +#ifdef CONFIG_BPF_JIT_KASAN
>> +	u32 bpf_size =3D BPF_SIZE(insn->code);
>> +	s32 off =3D insn->off;
>> +	u8 *prog =3D *pprog;
>> +	void *kasan_func;
>> +
>> +	if (!env)
>> +		return 0;
>> +
>> +	/* Derive KASAN check function from access type and size */
>> +	switch (bpf_size) {
>> +	case BPF_B:
>> +		kasan_func =3D is_write ? __asan_store1 : __asan_load1;
>> +		break;
>> +	case BPF_H:
>> +		kasan_func =3D is_write ? __asan_store2 : __asan_load2;
>> +		break;
>> +	case BPF_W:
>> +		kasan_func =3D is_write ? __asan_store4 : __asan_load4;
>> +		break;
>> +	case BPF_DW:
>> +		kasan_func =3D is_write ? __asan_store8 : __asan_load8;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Save rax */
>> +	EMIT1(0x50);
>> +	/* Save rcx */
>> +	EMIT1(0x51);
>> +	/* Save rdx */
>> +	EMIT1(0x52);
>> +	/* Save rsi */
>> +	EMIT1(0x56);
>> +	/* Save rdi */
>> +	EMIT1(0x57);
>> +	/* Save r8 */
>> +	EMIT2(0x41, 0x50);
>> +	/* Save r9 */
>> +	EMIT2(0x41, 0x51);
>> +	/*
>> +	 * SystemV ABI states that we should also save r10/r11, but in
>> +	 * practice those registers are _not_ used by the limited set of
>> +	 * kasan helpers we are calling here, so that's fine not to save those=
.
>> +	 */
>> +
>> +	/* mov rdi, addr_reg */
>
> [Severity: High]
> Is it safe to skip saving %r10 and %r11 here?
>
> In the x86 BPF JIT, %r10 is mapped to BPF_REG_AX. During atomic fetch
> operations, BPF_REG_0 is stashed into BPF_REG_AX before calling
> emit_kasan_check():
>
> arch/x86/net/bpf_jit_comp.c:do_jit() {
>     ...
>     /* Will need RAX as a CMPXCHG operand so save R0 */
>     emit_mov_reg(&prog, true, BPF_REG_AX, BPF_REG_0);
>     if (src_reg =3D=3D BPF_REG_0)
>         real_src_reg =3D BPF_REG_AX;
>     if (dst_reg =3D=3D BPF_REG_0)
>         real_dst_reg =3D BPF_REG_AX;
>
>     if (!bpf_atomic_is_load_store(insn)) {
>         if (!accesses_stack_only) {
>             err =3D emit_kasan_check(env, &prog, real_dst_reg, insn, ip, =
true);
>     ...
> }
>
> Since the KASAN helpers are standard C functions, they are permitted by t=
he
> System V AMD64 ABI to clobber caller-saved registers like %r10 (especiall=
y if
> kasan_report is called).
>
> If %r10 is clobbered, could this corrupt the stashed BPF_REG_0 and potent=
ially
> cause a crash when real_dst_reg is used as a memory pointer in the subseq=
uent
> emit_ldx() call?
>
> arch/x86/net/bpf_jit_comp.c:do_jit() {
>     ...
>     /* Load old value */
>     emit_ldx(&prog, BPF_SIZE(insn->code), BPF_REG_0, real_dst_reg, insn->=
off);
>     ...
>     /* Restore R0 after clobbering RAX */
>     emit_mov_reg(&prog, true, BPF_REG_0, BPF_REG_AX);
>     ...
> }

This looks like a real bug, R10 is used for both atomics and constant blind=
ing.
We probably also should save R11.
