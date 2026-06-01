Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62814258CD9
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 05:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780290584; cv=none; b=Je0b4vuHPac7wYrXc+v2l/DfBuiIGqXL16V2juDFxVe8VV07IwrZd6D7lsET8rbGS6AMrKbqCHybpUPxAjxr8IwlxtO8xulV1jcm8jEkL8aj0VGpA1EizbQlovkLNDK2fKWpMA3cvo42ljCWzQdZY1LGcsH1NPgD7AycXVIJAzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780290584; c=relaxed/simple;
	bh=UOuN7C3I0nXg/sEYnoZM2Ygm5D5hdxYITzQw65kOciQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=nVB+y0SNEjp+9GG6L1BJjfieKkOM+L8lmWWzIUHM2p1kjbDwaWJXFhyMejr8LnyIfUvMPJEh4XVKQPXdEjOWNY6mMOckEZr+8A67acLnSTJgwQc4AUY8KvBWl2XcfSZclED77lg5LFf4mGqEbw7gIaETPm1YO8S+PKXn/Z6G5M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=hHWsQgfs; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="hHWsQgfs"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36d9f91a336so461442a91.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 22:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1780290583; x=1780895383; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7BJkAVMyuacNJHQpoPyEmWeh4Ciu3EPaEWst7jSM98=;
        b=hHWsQgfsfdj3svjO9c1cqbBq6jQAUXb2c6AiJZHdzD3V9VoUMUQb0BLgEn/y4atQB4
         SvpUQR6rrz1SWuMpHAD+yk6DHTlIUL5dWbP7zwVSd4GrQFQcEyYiZpeEekuHGgv9PTjQ
         Raak512W0htd2RZMD0/h+csrj5XU2c3aj9miV7mTyuuXW7gr1vCc5Lvj6b4LsbJbw/Qf
         fbjAS4JMw5XOSpOYTY02sXzpFhkuMYmhCXcKTPQMOLqGfN6nq7UWRI5ccOiizni35X9y
         JK+j8KZzjNiXjd70G8VpSPuMxIREA9jgsoDBuhaErv8rgBgOKyDhKARRKhn1ttQq0N5Q
         GTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780290583; x=1780895383;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l7BJkAVMyuacNJHQpoPyEmWeh4Ciu3EPaEWst7jSM98=;
        b=j6DkL21TcqahDXDzFXA4Eo61WlOg+TR74icfMvHReLch0CHfBBrJa8tToW1lqiqpG6
         J4PO4pAOW9B/uN2DlOCkxZ9Y5gKPoJpNC9buptoquh5oD0j5b3goSNL2VKPrz4kgHy0r
         /AOen8/R2Y1lW60sAwewGTC4sa6g83JhKj4mdEn7yXFdja95MvCUHV2osPo2fJtx/D15
         x7eKW40QasFw8l+eGQJhKg60hsu9dCMA7FV7M1Zfo7gXqTRzBWZjxJBeKqiXTSOacYGM
         MG3CcWhqCLedCc7J44EvBEaahjygG1Su3ODrHkQ4mK2BHgFoMj9+PULxBNW+8uU03VG4
         F4hQ==
X-Gm-Message-State: AOJu0YyTRRpHrcIvmMawpa9o+MAHNuu7SIHjwFPqrVNApPsMoCt+fdcq
	9JtB+fFeo5lAeIINfpZK3EQlSP/ZPDVXLD1ap1GdoyxgxWYniYLJ7qEPQ1FhkntzY8KcaTrILeT
	lRZqCdsBI+Q==
X-Gm-Gg: Acq92OHcoJzwBy1uqZ+Hm4UQt1qllASh0C0AhRTr2VwekBdv/Oo6X+VY17y8juNYIQS
	XMvrxjyo7MfzrZiaQ+k3A9DaVBNonl3PQzbRFnxmOryrJ+DGi29A5fhgVe8QyeDDuaFAtFY5Y3S
	6b30AubpDse6fC6Ynl9yUcsVTh443njz6Ho6jxkFAF4m64DHdcdmh5I08NV6L0R1i35UwIPGcnH
	JgWdb2yubcbChyz8yRZT1k7SiH4eLLjxl6f1vMeRKtKws3ZbmTeS8OY1Ntjc81xfcEmzzGDABBP
	/pGdE+S3NJyENKibebZbbcT6aaHBLe8NoMgKT+keUymaLb3KHO75k63fFK4MsRHwoJambsqR6Vf
	G1l0sX6cPGg9Qx09gvJ6ngcRq6Wb1jt+bEWy5cVVtxzwj9iaSVZjFqdUVokgjIiCD4trmNFtHp2
	fi4aJ00Q7zr6R4pb9mqzLxZVjsVspzxvzX1w0=
X-Received: by 2002:a17:90b:57f0:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-36beb5adccdmr6927537a91.12.1780290582556;
        Sun, 31 May 2026 22:09:42 -0700 (PDT)
Received: from localhost ([2001:569:58a0:da00:a5c8:c4ce:f7c1:40c1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbe18dda3sm4326840a91.9.2026.05.31.22.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:09:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 01:09:41 -0400
Message-Id: <DIXGCACGWUVB.15OD5ER214U3S@etsalapatis.com>
To: <sashiko-reviews@lists.linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 3/5] bpf: Allow subprogs to return arena
 pointers
From: "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530002259.4505-4-emil@etsalapatis.com>
 <20260530045438.5CD9F1F00893@smtp.kernel.org>
In-Reply-To: <20260530045438.5CD9F1F00893@smtp.kernel.org>

On Sat May 30, 2026 at 12:54 AM EDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Global subprograms returning arena pointers have their return va=
lue unconditionally marked as a scalar at the call site.
> - [Medium] The verifier bypasses BTF type enforcement for global subprogr=
am return values.
> - [Low] The error message logged when a global function has an invalid re=
turn type is outdated and confusing.
> --
>
> commit 0192bc82392a7d1bde4b6ab66bef8ece2f90c7cf
> Author: Emil Tsalapatis <emil@etsalapatis.com>
>
> bpf: Allow subprogs to return arena pointers
>
> This patch expands the verifier to permit returning an arena pointer to t=
he
> caller from a subprogram. The main subprog is still not allowed to return
> an arena pointer.
>
>> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
>> index c6a930aca67ec..7a8101879f84d 100644
>> --- a/kernel/bpf/btf.c
>> +++ b/kernel/bpf/btf.c
>
> [ ... ]
>
>> @@ -7963,17 +7993,15 @@ int btf_prepare_func_args(struct bpf_verifier_en=
v *env, int subprog)
> [ ... ]
>> -	if (!btf_type_is_void(t) && !btf_type_is_int(t) && !btf_is_any_enum(t)=
) {
>> -		if (!is_global)
>> -			return -EINVAL;
>> -		bpf_log(log,
>> -			"Global function %s() return value not void or scalar. "
>> -			"Only those are supported.\n",
>> -			tname);
>> +
>> +	err =3D btf_validate_return_type(env, btf, t, subprog);
>> +	if (err) {
>> +		if (is_global) {
>> +			bpf_log(log,
>> +				"Global function %s() return value not void or scalar. "
>> +				"Only those are supported.\n",
>> +				tname);
>> +		}
>>  		return -EINVAL;
>>  	}
>
> [Severity: Low]
> Since arena pointers are now supported, should this error message be
> updated to avoid confusing users? It still states that only void or
> scalars are supported.
>

Not necessary imo, the error is there for when things go wrong. Nobody's
going to read it and go "I should change my program to not return arena
pointers." If they're inspecting the verifier source, they have the
logic for allowing __arena tagged pointers in front of them.

>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index c8d980fdd7099..64d7954e93ea7 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -9375,7 +9375,7 @@ static int check_func_call(struct bpf_verifier_env=
 *env, struct bpf_insn *insn,
>>  		clear_caller_saved_regs(env, caller->regs);
>>  		invalidate_outgoing_stack_args(env, cur_func(env));
>> =20
>> -		/* All non-void global functions return a 64-bit SCALAR_VALUE. */
>> +		/* All non-void global functions return a 64-bit SCALAR_VALUE or PTR_=
TO_ARENA. */
>>  		if (!subprog_returns_void(env, subprog)) {
>>  			mark_reg_unknown(env, caller->regs, BPF_REG_0);
>>  			caller->regs[BPF_REG_0].subreg_def =3D DEF_NOT_SUBREG;
>>  		}
>
> [Severity: High]
> Does this unconditionally mark the caller's R0 register as a SCALAR_VALUE=
?
>
> When returning from a global subprogram, mark_reg_unknown() clears the
> register state. If the subprogram actually returned an arena pointer,
> it seems the caller will receive an untracked scalar instead. Any attempt
> by the caller to dereference it would then fail verification.
>
> Should we inspect the subprogram's BTF return type here to dynamically
> set caller->regs[BPF_REG_0].type =3D PTR_TO_ARENA when appropriate?

I will change the comment back because it's actually inaccurate.
(Somewhat confusingly) we're returning arena pointers but not
PTR_TO_ARENA - the pointer returned is a SCALAR_VALUE. THe bytecode will
turn this into a PTR_TO_ARENA with an address space cast just fine.

>
>> @@ -16645,6 +16645,10 @@ static int check_global_subprog_return_code(str=
uct bpf_verifier_env *env)
>>  	if (err)
>>  		return err;
>> =20
>> +	/* Pointers to arena are safe to pass between subprograms. */
>> +	if (is_arena_reg(env, BPF_REG_0))
>> +		return 0;
>> +
>>  	if (is_pointer_value(env, BPF_REG_0)) {
>>  		verbose(env, "R%d leaks addr as return value\n", BPF_REG_0);
>>  		return -EACCES;
>
> [Severity: Medium]
> Does this bypass BTF type enforcement for the return value?
>
> By just checking if R0 is an arena register and returning 0, a global
> subprogram declared in BTF as returning an int could successfully return
> a PTR_TO_ARENA. Conversely, a subprogram declared as returning an arena
> pointer could successfully return a SCALAR_VALUE, since the fallback scal=
ar
> check later in the function would allow it.
>
> Should we verify that the actual register type matches the subprogram's
> BTF return type signature?

Same thing, fixing the comment should make this clear that this is a
non-concern.
