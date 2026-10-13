Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473B83C3F71
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 09:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882250; cv=none; b=PD4lqkjB6i7WirkU8kfr+cHlyPJIMtGLfnsWyWfpiOn4QCbusZMgsVC0Iabg2XRRnDHhbpSXTLAxezj5/qnyka5pNfIdiSYL09RjH13b/yunXMxW+u/xXfHViIQkGYHoI0YMtA9C0S+M5R4b18PAw+j8cW/PLMme7gNsQm2mRLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882250; c=relaxed/simple;
	bh=g1p+zAy1iZ6RT9ZlpLSHr9kEl3rWZ14LW8FY8NILhg0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:
	 References:In-Reply-To; b=D2dH8xrroUnHiuYbAiFSXvahE4ZLAsCEhlt3u+yYR7uguUzgTyhdL3gdJdaw881aFpJ06ufsEbTM3hB4QRCcBaOjGkf4dSu9pCDPsLs61swfOnUIQDFohDCBVzFhLoMnN8ibKr2XksXE1QSVb66XOHnqkRX2jv4UWrqFv3qT8X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pynwquFF; arc=none smtp.client-ip=74.125.231.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pynwquFF"
Received: by mail-oo2-f7.google.com with SMTP id 006d021491bc7-6dcee5a2fa8so126407eaf.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791882248; x=1792487048; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjprIaDEn9HW0P0dRvXW2ikq7vmQoIq2YgOT0FGdOqs=;
        b=pynwquFFA5n1tn3jGXnRWf6nRHUSc72Z9b3bpXXplXhNqd17DkIsaso8rwdhE+X5a3
         98P0+MWB2n8sLb6cYmzT7vyItOWVNmRpGQcAI0KWeJ9MQ1aJcmsvmEu2TxF1ttdjaBqk
         2NpaRaghiMXTjNsiK110ElEYi72QIobN0HnxfBq2mJdgy+9/uJ7IRHvqv2mgl/S8N00c
         eQRQB9gqtr/jL+gHrTFdEh84LGHajw9F7zDjTZnGnCHFs0zbIBfBb12nTwO/mlsK54Mq
         tKFobgp1Q+na/7FQNs9lu9ZMlrMnmQCX5d2Few5Zro2bBXgFYCMQ0zesW6n/TsXfcqXg
         xzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882248; x=1792487048;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gjprIaDEn9HW0P0dRvXW2ikq7vmQoIq2YgOT0FGdOqs=;
        b=QOHjQ+xMIt9oGiPleF4VnN5L3SMVGC5vmpbZi1Ou+t4X+ry4L49TPT9iZKTEUs6dyK
         w/SRV7VLVc5OzWrQYa+uP9t1iqU9S7rhtnf016NOIFRrpB3+VLmuiucTb8hyOSEKm/ji
         ghwIyChxEV8nXDZWPLMaVl+bDUkbBXI3TeF4UFx/9qaOvwQ+fL8rr8mnrIfXEwRiu/ZQ
         E429wwd5s9/dhzDd0nyrwNqxDiD6HbtjmorXmEp7vTRwjfmceN0oMTwHKuiHfDMiSFg2
         UPN+eFkeFPNrtG7pg3Sh5dI+wO61DyiRr2dB1ubPbDzvTh4unlX5OkbwOXrR3dJpisSX
         HQ8A==
X-Gm-Message-State: AFq9FYIOazUm2NrzcSZg+qs3thYfV/ku4p/8ksXhDm12DIMC9GJIQ2q4
	mv8q67RRijpyiR1eZduh2UDqIxb6em37QwGFVWHyrFh3PJIqmLslqoufjjLiPS9WARw=
X-Gm-Gg: AYBFou0yycTmyv4/O10X3onL2qeSubtU2Q2Q32ciIxBzRjcqeZ3XqcbCOHCwfmAiRk3
	MiQ01Dj7wekbP4/Z0JIQKEtIx9Y+wc1BDtkkKZZ7nYzZvdyTdIA4jxqfncKj5/HqteeYWH3UDBo
	uxJBt40z7QZ6LtYKZx92/YtaMCK0IXh9NPUR3q1UQFtJ5jkEPQF/cYQBozipfJVh3W9upCbnAle
	LshpetdEUj0yT7niU2gM0QFuquhqZJOGR5atZzR2q81kfheGzHAz+2BpQo0PpcYNJ0mYe5FUysK
	Ut79qafHQPOPskPqSBic2s8uW6hDHf83XrwLZszaPhXjveVvzYfgzmMfLCoOEckeDz6Q4vH7R5N
	jZjcmrP1kUH+oqBgvQcxEx7QwKfAYhQeXRTCxEwRRYJNYKpC1ei9nEOE9+NK5t1QnTcW2ZlEazd
	nTg2LWjFUNg1dgjBhfXFOFPnYge0Dbv6iAD3drU2fdTmiyvzbQjffLIkF4epXpQXe0U/dSIOVEA
	gu4O6dal2SCF7pIMis1on42k0cpKPqgZkuxJ7JSZK0uFAo6NEjfxwUS82OLRJURGl5L7TEWolPH
	8u8iZA==
X-Received: by 2002:a05:6820:6ae2:b0:6df:d73a:1265 with SMTP id 006d021491bc7-6ef10b787efmr6358863eaf.44.1791882248016;
        Tue, 13 Oct 2026 02:04:08 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:44::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f4a1303572sm5938802eaf.12.2026.10.13.02.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 11:04:04 +0200
Message-Id: <DM3L8R7ZAIZ9.178PBQ9677C6C@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 05/13] bpf: Turn loads of __arena pointer
 members into arena pointers
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261013082012.1107446-1-memxor@gmail.com>
 <20261013082012.1107446-6-memxor@gmail.com>
 <sashiko-outbox-169266@kernel.org>
In-Reply-To: <sashiko-outbox-169266@kernel.org>

On Tue Oct 13, 2026 at 10:40 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf: PROBE_MEM fault bypass via non-nullable __arena pointers
> --
>
> commit fdb573c7b91be34110bf569fb46f6159ad42b9b8
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Turn loads of __arena pointer members into arena pointers
>
> This commit translates the loads of __arena tagged pointer members in
> kernel structs into arena pointers during verification. If the member
> is also tagged as __nullable, a NULL test is kept before subtracting
> the arena base address.
>
>> diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
>> index b2fa7e8bedf3a..3c95b6c8bbbc5 100644
>> --- a/kernel/bpf/fixups.c
>> +++ b/kernel/bpf/fixups.c
> [ ... ]
>> @@ -870,6 +870,36 @@ int bpf_opt_subreg_zext_lo32_rnd_hi32(struct bpf_ve=
rifier_env *env,
>>   *     struct __sk_buff    -> struct sk_buff
>>   *     struct bpf_sock_ops -> struct sock
>>   */
>> +/*
>> + * A load through an __arena pointer member of a kernel struct reads th=
e kernel
>> + * address of arena memory. Append the conversion to the arena pointer =
form,
> [ ... ]
>> +static int arena_member_fixup(struct bpf_verifier_env *env, int idx, st=
ruct bpf_insn *insn,
>> +			      struct bpf_insn *buf)
>> +{
>> +	struct bpf_insn_aux_data *aux =3D &env->insn_aux_data[idx];
>> +	int cnt =3D 0;
>> +	u32 base;
>> +
>> +	if (!aux->arena_member)
>> +		return 0;
>> +	if (aux->non_arena_load) {
>> +		verbose(env, "an insn loads an arena pointer member on one path and s=
omething else on another\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	base =3D bpf_arena_get_kern_vm_start(env->prog->aux->arena);
>> +	buf[cnt++] =3D *insn;
>> +	if (aux->arena_member_nullable)
>> +		buf[cnt++] =3D BPF_JMP_IMM(BPF_JEQ, insn->dst_reg, 0, 1);
>> +	buf[cnt++] =3D BPF_ALU32_IMM(BPF_SUB, insn->dst_reg, (s32)base);
>
> [Severity: High]
> Could this allow a bypass of the PROBE_MEM zeroing mechanism when a fault
> occurs on a non-nullable arena pointer?
>
> If a PROBE_MEM read of a non-nullable __arena pointer faults, the excepti=
on
> handler zeroes the destination register and resumes execution at the next
> instruction. Because the pointer lacks __nullable, the zero-check branch
> is omitted and the BPF_SUB instruction executes unconditionally.
>
> This executes on the zeroed register, changing its value to -(u32)base.
> Since base (kern_vm_start) is page-aligned but shifted by GUARD_SZ / 2 (3=
2KB),
> the truncated 32-bit offset calculates to 4GB - (base % 4GB). This
> consistently points to the next 4GB-aligned address in the kernel.
>
> Because base % 4GB is at least 32KB, this mathematically guarantees the
> address falls strictly within the 4GB valid, user-mapped bounds of the ar=
ena.
> Could an attacker map this arena offset, populate it with a malicious
> payload, and spoof the BPF program into using attacker-controlled data?
>

Valid, fixed and added a small test case.

>> +	return cnt;
>> +}
>> +


