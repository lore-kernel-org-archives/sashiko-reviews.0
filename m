Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792526676;
	b=voX310BjgZcqRKF62TxozdnpDPg5wIbxj5UDvXOTUjdcPbRJSsoBl+aKHoe6cfQp/aoB
	 i6zfdUD6/OD1IdW1753F3Fq20MbtNNlGEbkySQI3x3I0T5PWUu7PTtNJFQMCUcB7rBY04
	 3uh/R70E3eCY4GkIiGQtXFfnpgGDcsPMO6YpMwpZ1U9q/7odfC9pe77q4IyBRHNAAf4+7
	 nieUpNkkopG6rbL/Xi8pTYPsnfVtNyPBQjTi+E+5DImwDYC5mSyLvvMB2lk/5nMIxo89e
	 l3eEjIKH7XKyHgHzkx2T+8QIVYZHzpK5U2D2ZK1DtZkBp5JE4Wt6Qai+mOAxzeZ2mWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792526676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:X-Mailer:
	 Content-Transfer-Encoding:MIME-Version;
	bh=m18DMiyB+7VTcut54fI0anXX4tAmR8j+EXZ+9qn1WDU=;
	b=qC/h0h7Om5SiMOcucVFovNwAoVpjmYfzEfU+muhqXIbq3dXdrhTkak0nTYcI0E6BkRDb
	 sEXK8RPmgd/O/zDzBpkVvjtC/RVh4GICLKhqd7+KQR6XNzT08f8erJUkzXzhOl7mhCkbK
	 RYALA+6PmYiBR6nQiwU4iiprv3MJ+Of7zus2kh6wlZ8bQfRTpD5cE0D5QQYwB+0GNcouf
	 3DMd/2h0OY6egM+JPEM4HQCMBESSjwj8nKFgNk2JscwetmPBOmAWsuESs+lVbkDVhYBB+
	 sBWOi9bWcPMFhrVorhgtKhms7rba5rVV3XmT43GllCRttYL6MelPYTxvma+PwjgH9vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dO+bnuFf;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBD0606A319
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 20:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DBD0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dO+bnuFf
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so62370a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 13:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792526676; x=1793131476; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m18DMiyB+7VTcut54fI0anXX4tAmR8j+EXZ+9qn1WDU=;
        b=dO+bnuFfMOSb+3vvAVEB3EbNmlpHxRH1jh9UsSP9ORxUcaDBRpAvomWMcGNPXU753d
         HLlF/LYfSldaism+JM51HAi+yrqPdZXBeJL0cJTkxI14E3TvR44GqZBkIWrjEwQRW517
         XrZyhoQ9zoNWWjk6pH4W6B/HLV0ASJ8famumlHHZ+wYyzlFPmFRhiMyTrQVddBEckBHR
         juoX6cgnk0zvdZB7ccBfw9B6/s1dePcHe1MC6zWnLqUykz8IANSp3oEexZtjM2hI0I2B
         l7zvfnb7ZxTwtoM4FNS/BIx3tkGq7b8IPPVKjWonKHH5wDqLGE1bO1CO01p+I54YIdWc
         sb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792526676; x=1793131476;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m18DMiyB+7VTcut54fI0anXX4tAmR8j+EXZ+9qn1WDU=;
        b=z7mI8CbvnyWUidYG6DBUbi274/FfW3j/3vYh3jiU0YZFGGc5PwWi5rSNFn0yRAU6wH
         Lkm2RJgPo4PY5rVzwl12lySyFaKaH5/Y7GoGxj0gg5Mhz86eHVuXkuW2Yb6tqeYdygBN
         NibltTsPHyJmAhx/ddYVZJzrAJH3/anvZLFAq2Z8Lgl6iWxu53nxv8+i+uuSX8xgBdxJ
         RZn2UKMoTtBHxf/1aFjwEvsBbNJuhIc3UeAwHf9MVm/1zNuskd8uaC1n/xycp61dDOTZ
         Q4oWg6u5Ky0AHTkBB1UvdiKnC6RcBjEgL5N0NaGPPu081JLgMVPK0is3dnNCSpiB3LPt
         UL3A==
X-Gm-Message-State: AFq9FYKUw1Y6afufjI69JCQLpHkStIACgWvyHusROjgYKY8jhD4hiw/T
	4jForRjXWd6NhnwHku61lEZq2d1dDTJWPz8n6osl871eSaltpJcx1DbvFEGW6g==
X-Gm-Gg: AYBFou3fKJHqRGsZmWXVjNftWljzpp943nUiK6MHyaKAdwdbZHt1/VkilBJeWU4e231
	VWPpm8j33zHanRrbNV22pNK671B0pCKTi9LqGkFqmLCUqo5gdxllr7V+VD4JVuSngbeCYzmzH95
	xKx4IPEXPdKoxfLY+TsGB8E623Pf10W1SQElMD3VXxzGBof72iY4zRA1/9AYmeqRIeGy4WfqmgQ
	aNt9GbA/G00ids7RkRgqYQX7A5qziIDG5swKvs+2AzN1a3frlxwWkrz7ANgNTw6mD91jb4Baad7
	6q8F8lw5kWrDVsSyiNvfVoHgaExzIAf8vf3ytFUkwZLbcLUUC/LixHkEgnx83CiA96ou7H8zcsI
	L/Rw3LM0/U6lx9I1QqXc9/EX/srEkkxUoWMpLvs9NJlrkeQ/gYui5MlULmCQrdZeqXNruG9hHnl
	UcsVNREYp7a+DO7pk3rhYS8tniI8sMSo76T4wTdA4vX3BWQAOp6M43IzYAn3OcGjdBJg24q2WjZ
	u4nDgnVK+sHmjsbAmA2mbwVgc6kxKzgJgEZOsPsdXN8FJDOsux3+VmoMFNNFt3WhLAvCO6dKfLc
	W4ITTXM3jycRM7WYTCxlfa9DJUR78/qYRVNTP/zaB2+Kaxt15fdFIo69XcFIKTAmKTJcBmJunFk
	QDoWvOA==
X-Received: by 2002:a17:90b:574d:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3ad86f05a40mr1417a91.26.1792526675585;
        Tue, 20 Oct 2026 13:04:35 -0700 (PDT)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813de463sm808246a91.13.2026.10.20.13.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 13:04:33 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 20:04:32 +0000
Message-Id: <DM9XO98ZA7UV.2V9PDC4868WI9@gmail.com>
Subject: Re: [PATCH v4 bpf-next 1/6] bpf: Add unwind_goto and unwind_exit
 insns
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-179499@kernel.org>
References: <20261020181320.1284798-1-alexei.starovoitov@gmail.com> <20261020181320.1284798-2-alexei.starovoitov@gmail.com> <sashiko-outbox-179499@kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Tue, Oct 20, 2026 at 11:57 AM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +			if (!aux_data[i + 1].seen) {
>> +				memcpy(insn + 1, &trap, sizeof(trap));
>> +				aux_data[i + 1].seen = env->pass_cnt;
>> +			}
>
> [Severity: High]
> When bpf_opt_hard_wire_dead_code_branches() overwrites insn + 1 with trap and
> marks aux_data[i + 1].seen = env->pass_cnt, could stale flags in
> aux_data[i + 1] corrupt the trap instruction or trigger a verifier bug?

No. That verifier_bug_if() needs bpf_jit_needs_zext(), and it's false
on x86-64 and arm64, the only JITs with bpf_jit_supports_unwind().
needs_zext and arena_scalar need an arena, and arena needs CAP_PERFMON.
Then bypass_spec_v1 is true, there is no speculative walk of i + 1,
and they cannot be set on an insn that wasn't seen.

> Also, what happens if the call and unwind_goto at insn i are themselves in
> dead code (!aux_data[i].seen), but jump to a shared landing pad that was
> reached from another call (aux_data[i + 1 + insn->off].seen)? Because
> aux_data[i].seen is not checked here, insn + 1 is overwritten with trap and
> marked seen, so bpf_opt_remove_dead_code() removes the dead call and
> unwind_goto while leaving an orphaned goto pc-1 in the program (and any
> later live conditional jump with untaken target i + 1 can no longer see
> !aux_data[i + 1].seen).
>
> Should this check aux_data[i].seen before handling unwind_goto, and clear
> zext_dst, needs_zext, and arena_scalar on aux_data[i + 1] when writing trap?

Not a bug. It's one extra 'goto pc-1' that nothing can reach. A live
cond jump to it is never taken, otherwise i + 1 would have been seen.

>> +	if (!bpf_jit_supports_unwind()) {
>> +		verbose(env, "JIT does not support unwinding\n");
>> +		return -ENOTSUPP;
>> +	}
>
> [Severity: Medium]
> Should check_unwind_insns() also reject programs when
> !env->prog->jit_requested or bpf_prog_is_offloaded(env->prog->aux)?

yeah. Only netdevsim gets there, nfp rejects the opcode in
nfp_verify_insn(), and nothing runs such a prog, so it's just a wrong
xlated dump. Will reject offloaded progs in check_unwind_insns() in v5.

> Similarly, when CONFIG_BPF_JIT_ALWAYS_ON is disabled and bpf_jit_enable is 0,
> checking !env->prog->jit_requested in check_unwind_insns() (like
> require_callx_jit() does) would reject unwinding before passes such as
> bpf_compute_subprog_ret_regs() that gate on env->prog->jit_requested.

Not a bug. jit_required is set, so bpf_fixup_call_args() rejects the
prog at the end of verification. It's only a matter of when.
