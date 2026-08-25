Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A0D23EAAA
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 00:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787617581; cv=none; b=XXRKFlVntaKWg9M0f1K6g5eP4rRUcRgQq1IKM7BFGJXfIoHA5PyMjQCUHrdNLGGet8sq03L3ju+ioIr8/3ZM4iT6iRTAjveTmFmI0cPqbPwBkOOW6MDiy/t4Y2vA48M1OnYGg6Rn85GzK0MDmIqx05ezQdaIDYmm+v8ymnciXtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787617581; c=relaxed/simple;
	bh=RcK/jm1DBXe3uZ1HDvtAM829lcU4p2dQo7ZxD/YAhFA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=OnVQP/A/wHkahXiajOxwblYAmh9WUw1nApAtSEagitsUNwox/Q8LE987aVSBiqz3pGQcOSN8OAS3XGvYoPTSOw+58LXg+atTJVutq2eFV2RtfGCnudMBPBGCMIOYrDT8K2sach+liFMWiFLEJEF16teu1t/KKkVGYRb08fkADQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKiVphwV; arc=none smtp.client-ip=74.125.228.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKiVphwV"
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c243d41dc07so214576866b.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 17:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787617577; x=1788222377; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1r5pGf7pB6Tz21mOnRGX4uuKNZKB56rhqyOYIJ+ZYnY=;
        b=aKiVphwVCQCLe9BeQ2TIO0VZc1fHYzYok4u7x2IIqqy+mfsKbDIBf4LbZZJ0FI3q/1
         eAWuyE32TFf5bU0veDkFtt5/pUXcpq7icwRfZrJbI3GYJc1XL5Kb4f052OYlbdygPsMp
         yH5Gvomy/gB4IGhbDAxqyq0PYfe9MK6Sh91gWKrp151I1VaFz1A23GGzra9/daP/lNTj
         XLmAOQTiWBSt8CQbNOVVqmPA00ZSKgKi7zl/AdH+y/yxn7gfTQrL85eut0ucOsEmiFrq
         L+23BTnyLiDf6o6BZbGHJPltAns4kbopnXcGqeFjuo32rz/dasDTaKOlVM81aodW+S3I
         SEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787617577; x=1788222377;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1r5pGf7pB6Tz21mOnRGX4uuKNZKB56rhqyOYIJ+ZYnY=;
        b=ZviXP5wyQkT6m3orNLx6YfsZ9tvs+BdvvGJYstcXNslngrxkRNJSMwtqjeuHjqsabZ
         acsoGcGdwzNStc3THcY99HMBE5aAgGkmRXsRHzONL0RFhzMWve6pTnE5KNK/jlzYwBJy
         hGV5DXbB/L1rMZifimO7VaBpzDWKQVuY953297EUJLUaDvV7n27J4VJkKC4YX2hWiDp8
         oCJXtFR5UD0r9f6ps0O+IElGWceROOOtTvvToCZsdf/YoG+j2MdkHlGi2ifz5ruNz/TO
         gB5VjIO9DeXuDC5BOlJNEF04Ce5VUjtHnWYtmx3Z1yW5DcZbV8NnGep2LIDBpiisqfXB
         1EPA==
X-Forwarded-Encrypted: i=1; AHgh+RrJsMpj4vD0I787pufJ5fgy6JIuyxjsKHmpDA9Oco+zpQbg1xJOnAm8w25q+rdT6bglqVZ0gKjhufidrDqKl6g=@lists.linux.dev
X-Gm-Message-State: AFuF++k9A+mWKF97byzDJ+FvvM5bY8XYvmRkemTht/veV0p8BSm0E5+r
	1hGHBNDXV/x2LZdoSbBX/EjjFjPD3sQngi5UqG87BppKxpeC3iL5Tjav
X-Gm-Gg: AR+sD10jbCIJKh5IcTSvE0FLobwicdFq320pFnTnadMu0TBLNzi/h1YSmM1dKLtg7e3
	CAa/UxjAc0k+5yaxT4KKcaa6VMucu65zmnqto1w+FyCS62oIIAWeV3t0eHfJGelrtFkLKYypvQK
	f44k25nTthu0NVPGqI1NcIF3SMXy2Q7Ek9PI66yb+pqlBuH8/gk9XIR3hVn8KNbxuzup3Lfd4Er
	TXSmXiPxhKC1f32X3AFf1NfcMlxp9RaxKXIzj7kTsFxydEAnRri+I3R3hEwJFKh2Arap8WvhMqf
	ubxPFx/GOwCozh6DKRpfttxilf0P3IOrytBMDtUzHLPzbqECMWAKlzshCYIoT7+QNba+zCp5tAk
	4Hzxu5VeVK0hv9wcpzAeGgHkFos+Fvi8R8OUyU8HaiSlKOzOi9pUDjxTnLHTqgBy0w3kOHiITwM
	6e+n+s7c1RFYNtOHgGjiEzYzQDMMS0l4IdsOMS5W1FoE+gsRvZl8yGmRRDDbstum/oit+UV6lZF
	WWeVqrt42YWeV97ZE/KpfBovefaNBtpUtXOPM5rV/A64GJO9acPFBxolT4mrQtL2aJcsoYAWLe2
	ej9DUGBLXf4DWD34u0WbZxMpoOE=
X-Received: by 2002:a17:907:6090:b0:c12:695b:8876 with SMTP id a640c23a62f3a-c24e5c8b8ccmr220330666b.5.1787617576967;
        Mon, 24 Aug 2026 17:26:16 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b60asm1391447966b.9.2026.08.24.17.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 17:26:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 02:26:15 +0200
Message-Id: <DKXLJLAMA1KZ.14CXAXXD5S0WQ@gmail.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 <sashiko-reviews@lists.linux.dev>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>
Cc: <bpf@vger.kernel.org>, "Alexei Starovoitov" <ast@kernel.org>
Subject: Re: [PATCH bpf-next v7 4/9] bpf, x86: emit KASAN checks in x86
 JITed programs
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260822-kasan-v7-0-99afee6ef7fd@bootlin.com>
 <20260822-kasan-v7-4-99afee6ef7fd@bootlin.com>
 <20260821233332.1D2201F00A3A@smtp.kernel.org>
 <DKWOG6YKM2NY.1FJHLE7BKZW9Y@gmail.com>
 <fa7cc4ad-6b8d-4bdf-8e2c-66d98ddef7df@linux.dev>
In-Reply-To: <fa7cc4ad-6b8d-4bdf-8e2c-66d98ddef7df@linux.dev>

On Tue Aug 25, 2026 at 2:12 AM CEST, Ihor Solodrai wrote:
> On 8/23/26 3:30 PM, Kumar Kartikeya Dwivedi wrote:
>> On Sat Aug 22, 2026 at 1:33 AM CEST, sashiko-bot wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
>>> - [High] `emit_kasan_check` fails to save the caller-saved register %r1=
0 (BPF_REG_AX), which corrupts BPF_REG_0 and memory pointers during atomic =
fetch operations.
>>> --
>>>
>>> --- Patch [4]: [PATCH bpf-next v7 4/9] bpf, x86: emit KASAN checks in x=
86 JITed programs ---
>>> commit 6bca50db6e9af9416363fe2e60f4e42f924950c9
>>> Author: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@bootlin.c=
om>
>>>
>>> bpf, x86: emit KASAN checks in x86 JITed programs
>>>
>>> Insert KASAN shadow memory checks before memory load and store
>>> operations in JIT-compiled BPF programs. This helps detect memory safet=
y
>>> bugs such as use-after-free and out-of-bounds accesses at runtime.
>>>
>>>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
>>>> index 13ba3232993ac..8134d028a2f2c 100644
>>>> --- a/arch/x86/net/bpf_jit_comp.c
>>>> +++ b/arch/x86/net/bpf_jit_comp.c
>>>
>>> [ ... ]
>>>
>>>> @@ -1110,6 +1121,92 @@ static void maybe_emit_1mod(u8 **pprog, u32 reg=
, bool is64)
>>>>  	*pprog =3D prog;
>>>>  }
>>>>
>>>> +static int emit_kasan_check(struct bpf_verifier_env *env, u8 **pprog,
>>>> +			    u32 addr_reg, struct bpf_insn *insn, u8 *ip,
>>>> +			    bool is_write)
>>>> +{
>>>> +#ifdef CONFIG_BPF_JIT_KASAN
>>>> +	u32 bpf_size =3D BPF_SIZE(insn->code);
>>>> +	s32 off =3D insn->off;
>>>> +	u8 *prog =3D *pprog;
>>>> +	void *kasan_func;
>>>> +
>>>> +	if (!env)
>>>> +		return 0;
>>>> +
>>>> +	/* Derive KASAN check function from access type and size */
>>>> +	switch (bpf_size) {
>>>> +	case BPF_B:
>>>> +		kasan_func =3D is_write ? __asan_store1 : __asan_load1;
>>>> +		break;
>>>> +	case BPF_H:
>>>> +		kasan_func =3D is_write ? __asan_store2 : __asan_load2;
>>>> +		break;
>>>> +	case BPF_W:
>>>> +		kasan_func =3D is_write ? __asan_store4 : __asan_load4;
>>>> +		break;
>>>> +	case BPF_DW:
>>>> +		kasan_func =3D is_write ? __asan_store8 : __asan_load8;
>>>> +		break;
>>>> +	default:
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	/* Save rax */
>>>> +	EMIT1(0x50);
>>>> +	/* Save rcx */
>>>> +	EMIT1(0x51);
>>>> +	/* Save rdx */
>>>> +	EMIT1(0x52);
>>>> +	/* Save rsi */
>>>> +	EMIT1(0x56);
>>>> +	/* Save rdi */
>>>> +	EMIT1(0x57);
>>>> +	/* Save r8 */
>>>> +	EMIT2(0x41, 0x50);
>>>> +	/* Save r9 */
>>>> +	EMIT2(0x41, 0x51);
>>>> +	/*
>>>> +	 * SystemV ABI states that we should also save r10/r11, but in
>>>> +	 * practice those registers are _not_ used by the limited set of
>>>> +	 * kasan helpers we are calling here, so that's fine not to save tho=
se.
>>>> +	 */
>>>> +
>>>> +	/* mov rdi, addr_reg */
>>>
>>> [Severity: High]
>>> Is it safe to skip saving %r10 and %r11 here?
>>>
>>> In the x86 BPF JIT, %r10 is mapped to BPF_REG_AX. During atomic fetch
>>> operations, BPF_REG_0 is stashed into BPF_REG_AX before calling
>>> emit_kasan_check():
>>>
>>> arch/x86/net/bpf_jit_comp.c:do_jit() {
>>>     ...
>>>     /* Will need RAX as a CMPXCHG operand so save R0 */
>>>     emit_mov_reg(&prog, true, BPF_REG_AX, BPF_REG_0);
>>>     if (src_reg =3D=3D BPF_REG_0)
>>>         real_src_reg =3D BPF_REG_AX;
>>>     if (dst_reg =3D=3D BPF_REG_0)
>>>         real_dst_reg =3D BPF_REG_AX;
>>>
>>>     if (!bpf_atomic_is_load_store(insn)) {
>>>         if (!accesses_stack_only) {
>>>             err =3D emit_kasan_check(env, &prog, real_dst_reg, insn, ip=
, true);
>>>     ...
>>> }
>>>
>>> Since the KASAN helpers are standard C functions, they are permitted by=
 the
>>> System V AMD64 ABI to clobber caller-saved registers like %r10 (especia=
lly if
>>> kasan_report is called).
>>>
>>> If %r10 is clobbered, could this corrupt the stashed BPF_REG_0 and pote=
ntially
>>> cause a crash when real_dst_reg is used as a memory pointer in the subs=
equent
>>> emit_ldx() call?
>>>
>>> arch/x86/net/bpf_jit_comp.c:do_jit() {
>>>     ...
>>>     /* Load old value */
>>>     emit_ldx(&prog, BPF_SIZE(insn->code), BPF_REG_0, real_dst_reg, insn=
->off);
>>>     ...
>>>     /* Restore R0 after clobbering RAX */
>>>     emit_mov_reg(&prog, true, BPF_REG_0, BPF_REG_AX);
>>>     ...
>>> }
>>
>> This looks like a real bug, R10 is used for both atomics and constant bl=
inding.
>> We probably also should save R11.
>
>
> Hi Kumar, Alexis.
>
> This topic has a bit of history now [1][2].

From [1],

"I built the kernel with gcc 11.5, gcc 15.2 and clang 22 and
disassembled __asan_{load,store}{1,2,4,8}: none of them touch r10 or
r11. gcc goes up to r8, clang uses nothing above rdi."

Isn't this dependent on register pressure inside the function, i.e. dependi=
ng on
different code or whatever, it might begin using those registers?

> I don't quite like it, but IMO we should give in to the bots.
>
> Reasons to save r10 and r11:
> * SystemV ABI
> * bots wouldn't shut up about it (think of future llm bot reports!)
> * if our analysis of the kasan helpers is wrong about r10/r11 usage OR
>   if something changes (the helpers themselves, the compilers, build
>   flags, JIT's usage of r10/r11 etc.) - we'll get clobbered regs
>
> Reasons to *not* save r10 and r11:
> * we make the bpf prog a bit smaller and faster, the win is not very
>   clear but it's percentages, not a factor
>

Yeah, also, we're already saving a ton of other registers, I don't know whe=
ther
saving two would matter, even if it wasn't incorrect. I wouldn't worry too =
much
about KASAN performance, it's already orders of magnitude slower than norma=
l
kernel build.

> A counter-argument to clobbering is that a kasan bug here most likely
> means a bug in the verifier, so it doesn't matter if machine dies.
>
> A counter-argument to that would be: why deliberately increase the bug
> surface and let the machine die if we can easily prevent it?
>
> Pasting below a clobbering reproducer from my clanker.
>
> [1] https://lore.kernel.org/all/5f38c9a5-a8a3-4bed-bb8c-b7260a1c1a11@linu=
x.dev/
> [2] https://lore.kernel.org/all/CAADnVQ+c9h_wuNwj8pjx885oNErGY7bxxCwKi+Di=
J0XKSpyYfg@mail.gmail.com/
>
> [...]
