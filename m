Received: from mail-wr2-f2.google.com (mail-wr2-f2.google.com [74.125.225.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A3143C078
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832840; cv=none; b=VSCWJ4cJwXat0bOE7BC0gnY/fkftsn1RydAX7gZsOdMVF/VlSE0XQKEW9N7fl0Sw9z9sqVtUq92GDhiKCyDEGu93jS4QTsDdLRBZLl3ysxCBwRQOOP9DlxOHq0xfVSePx4oEa5sADEKbDfFG5ErbBCQs+AQbkRd0HwWVx9ni7k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832840; c=relaxed/simple;
	bh=lUmRcKbwiL68tST9eIRY4IRwFDYQz0zVb7Gebl7IbsQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=b3d7ym0KcHteUN+bHdsIZ6AJx3RiAwsloPQDAXi8wQRjZg9K1cfdgl//qxQjG9qSZQRUtCdK9mBxJyWVL+vydCaZYYWQMfKZdqYUd7rt9T/zrZWBOFL0Je9P3V4ckqlaDXTAcvujYzXy6KXQcly6mBrJB+BZAn1m0Gr/XlPDCHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HngTClyC; arc=none smtp.client-ip=74.125.225.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HngTClyC"
Received: by mail-wr2-f2.google.com with SMTP id ffacd0b85a97d-473ba029526so355163f8f.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 01:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785832837; x=1786437637; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4y0dIqSdwJVySpRGuatuWHSEv+RXGkSanEMCC/wozOE=;
        b=HngTClyCNa+l+u5E5LbKszcvqj24+qqSZNcduWZGDmJi2Xyy7vpejjllpRqnFOBSgT
         z4GhPBAzDAjgaImH6F/a6dqguxcBnzhgO2TapaQRdARv8Uu1Be7x4JdwaUyHbaizDA5T
         FaiM7fYEjWcpCEeGB3PpLF06w3hnn1ZDPS3NVkEDb7k900QOTidlwY3BTDeYE0khlGik
         JtZIGMTORPXJoxrNU2Umm4Dw/piLNPZgZa17TVb7W4fJfp4U8EFU2sFshhYoyql59SFl
         MNLbefGxt1t4Q7lcAuodKZLQfnILhpfS0R8NJiqGJjV6Zku+IaMSOotg9P0VffQUkTZA
         qDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785832837; x=1786437637;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4y0dIqSdwJVySpRGuatuWHSEv+RXGkSanEMCC/wozOE=;
        b=hSltp9bHrl+nZSgeaXdKJkSUfywEdVM+VK6bLSvs8tdlh5eDRbRj5NQgqtB3fFbl5V
         T4eqR3ZSVw1F8lnl3psplb//6O1YKu7b8ATRgNYStSiW+vA9WevaMs835HhmgqwQeqMe
         on54aCDAt4SIfS5zmlr7AmeCf8JWrPWzaHocBM6N/w9luJI8s/38LT8AD9wFisBqSW/Y
         dA3TGSOzgQEO5FvBAw5BVVC7VUvpKub+bFTohTr7HiXVQUxBheC7llqroqqYrMIWLvPb
         x6kUcxnp5VH1t+oD5txOYR2scwTdzZlrVAyHlINNJSe4HAxGk4glfHPyjnLn44ImRC1w
         f6Jg==
X-Gm-Message-State: AOJu0YwRxMjzOcmO0IC0LFomcZ00FQbVeVYVp54PRQugSYdXNv6XAYC0
	tRzDVD8frcyUntFJZiNHJxOEHgpSFWvcR/SfUb0Y736o3uJwajmjL5K4k5WPRGvk
X-Gm-Gg: AR+sD125y0Pd8aveiP+t/xasTITU4gZm8eqUiNHh9txpAjLFHSTK0F46FgjTLdaQVGE
	4ez+YH9woJ7nIn6aMh0rNgj6MhKQvTxQLQN9DK3TJZUmk8kq0ouz8FMR8BkbkuR6gBm/jDgk9Sa
	0bYuVMzVzwi4s8XQCbdrocUo4Hs97RuJIkQobSi8ugUjm/0Jeq7oeXvqwH2SbvzjmKt0jk+mYPH
	JQrUZ5q+11wLqCUpy1cbiknBWrRj3pWMyTiYEdTRpmkMjfZujtP7dakP4ElbYt2tqWWDzYJleyw
	mAtEdoV2BhPlqfp8sEtlpuJ0RSoskNB3SrVTKwQO9okqInCrff0X8ZWHuDoZZxNLc7f4avph2r1
	54pC1EajkIUWLUzBoG7XerygCusWUyZqWda2j1zXydYyCI5/OBd4MOBQ/XUNxXijoiiAcnW+PgF
	cEtYIlhVLRJR52Ety7UAaTuv4hWiKV/RChQNR2VJgkX+6KLIEWWFwMMKaujc283SV35MhuCg56n
	zWXYS2isYQw6cnRvNuC04leuWfyQ2bdvOjmu5wM4DwfHr4VDKKE1by7FwLixIKZO1ZkEft/t600
	2M3MehN81FECtwipY3zd4kQq+iw=
X-Received: by 2002:a05:600c:4f86:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-4994a0fc5f1mr51199905e9.6.1785832836912;
        Tue, 04 Aug 2026 01:40:36 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc6d82sm70065755e9.1.2026.08.04.01.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:40:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Aug 2026 10:40:36 +0200
Message-Id: <DKG0WN6Q1SLC.7TTOWOG4C59J@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v5 1/3] bpf: Show more useful info in stack
 depth stats
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Andrii Nakryiko" <andrii@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260804081114.3871564-1-memxor@gmail.com>
 <20260804081114.3871564-2-memxor@gmail.com>
 <20260804082241.8951C1F000E9@smtp.kernel.org>
In-Reply-To: <20260804082241.8951C1F000E9@smtp.kernel.org>

On Tue Aug 4, 2026 at 10:22 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Unconditionally printing the instruction count for all subprog=
rams outputs `insns 0` for all static (non-global) subprograms, defeating t=
he stated goal of showing "where verifier work is spent".
> - [Medium] The new verifier stack depth log format silently breaks the `v=
eristat` tool, causing it to fail to parse both `MAX_STACK` and `STACK` sta=
tistics.
> --
>
> --- Patch [1]: [PATCH bpf-next v5 1/3] bpf: Show more useful info in stac=
k depth stats ---
> commit a5f11407b8ca52d1698171e4ae37a0d5f859eb2f
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Show more useful info in stack depth stats
>
> This commit updates the verifier log to print stack depth statistics
> in a new format, listing the main program and each subprogram on
> separate lines with their name, instruction count, and stack depth.
> It also updates the BPF selftests to match the new output format.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -18777,15 +18777,21 @@ static void print_verification_stats(struct bp=
f_verifier_env *env)
>>  	if (env->log.level & BPF_LOG_STATS) {
>>  		verbose(env, "verification time %lld usec\n",
>>  			div_u64(env->verification_time, 1000));
>> -		verbose(env, "stack depth %d", env->subprog_info[0].stack_depth);
>> -		for (i =3D 1; i < subprog_cnt; i++)
>> -			verbose(env, "+%d", env->subprog_info[i].stack_depth);
>> -		verbose(env, " max %d\n", env->max_stack_depth);
>> -		verbose(env, "insns processed %d", env->subprog_info[0].insn_processe=
d);
>> -		for (i =3D 1; i < subprog_cnt; i++)
>> -			if (bpf_subprog_is_global(env, i))
>> -				verbose(env, "+%d", env->subprog_info[i].insn_processed);
>> -		verbose(env, "\n");
>> +		verbose(env, "stack depth max %d\n", env->max_stack_depth);
>
> [Severity: Medium]
> Does this new output format break the veristat tool?
>
> In tools/testing/selftests/bpf/veristat.c:parse_verif_log(), the tool use=
s
> sscanf to parse the legacy format:
>
>     if (2 =3D=3D sscanf(cur, "stack depth %511s max %ld", stack,
>                     &s->stats[MAX_STACK]))
>
> When presented with the new format "stack depth max %d", the %511s token
> greedily matches the string "max", causing the literal " max " check to f=
ail.
> This would cause sscanf to return 1, silently leaving the MAX_STACK and S=
TACK
> counters unpopulated (reporting 0) for all analyzed programs.
>
>> +		for (i =3D 0; i < subprog_cnt; i++) {
>> +			const char *name =3D env->subprog_info[i].name;
>> +
>> +			if (!name || !name[0])
>> +				name =3D "<unknown>";
>> +			if (i =3D=3D 0)
>> +				verbose(env, "prog (%s) insns %d stack %d\n", name,
>> +					env->subprog_info[i].insn_processed,
>> +					env->subprog_info[i].stack_depth);
>> +			else
>> +				verbose(env, "subprog %d (%s) insns %d stack %d\n", i, name,
>> +					env->subprog_info[i].insn_processed,
>> +					env->subprog_info[i].stack_depth);
>
> [Severity: Medium]
> Since the bpf_subprog_is_global(env, i) check was removed here, does this
> print misleading instruction counts for static subprograms?
>
> The verifier only calculates insn_processed for global subprograms and th=
e
> main program, as static subprograms are verified inline and their cost is
> attributed to their callers. By removing the bpf_subprog_is_global() chec=
k,
> are we now unconditionally outputting "insns 0" for all static (non-globa=
l)
> subprograms?
>

This is legit, but it is based on how we account insns processed. It is don=
e for
main subprogs and global subprogs. It might not even make sense to do per s=
tatic
subprog accounting, given it can be called in various ways that affect the =
insns
processed of the CFG rooted at it throughout the program.

So we can leave it as insns 0, or do something different, but I don't have
better ideas on what that would be.

>> +		}
>>  	}
>>  	verbose(env, "processed %d insns (limit %d) max_states_per_insn %d "

