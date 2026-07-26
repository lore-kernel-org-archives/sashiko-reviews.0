Received: from mail-wr2-f2.google.com (mail-wr2-f2.google.com [74.125.225.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7CA4908BF
	for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 02:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785031366; cv=none; b=STPXaI42rdVil8+0XxSg2/68+8+BTUlsyP8bxsTRf63OFVcG+Lv3tLx1WGI+o0fLAY3DCI6RvQJh39lm9v2/MG9wyiF5uCcvoNGjxDH8thcOy95EnpjocinTWH2hHFXQQo1DnYFaTXhL+bMLBUQgJBphofSjUcbGVrUyxar42Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785031366; c=relaxed/simple;
	bh=8MHiJgXiLwaflmldyw5XZaurOOQUdmH7Ahr8KRIRGhU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oidDJpvQVDS4e2RAb62UA0+xiAjexQ3UfVGKNN3xtGbY874RVNbvj+AJRrbB4A7KYVsDJKahPRxtizTAEJodvXsbLAT4kShR9msE6z48vIcRsL/LblLWAs4ETq+lCwTQH64pL0OLsyjvduQ+s+pUQsDKsOPd+m1KTgWruHz5uV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wx9ttkSJ; arc=none smtp.client-ip=74.125.225.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wx9ttkSJ"
Received: by mail-wr2-f2.google.com with SMTP id ffacd0b85a97d-47f7f93b3d4so420493f8f.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 19:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785031362; x=1785636162; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TDTuZ70qXufeETtiXikOewPxsFp3y1jcFjaKcCLz/9k=;
        b=Wx9ttkSJqGPUtrbBRGH0TjwpMgI4oG+l1kLhtEJpt9Qc0H+CZsOON5pOL5xgLqTmAf
         ZOkd4uvnKYk6GItwn0CTRLD2lvqOZcHSNYql1FfFgTv9RZ5bItCys293fiDwlkcUIt5i
         Bp56eZ7b0ctcuXH31e7exuOgMskiZ9jicRZwmFTv8YDTDemRgn/Ewc+8U11ohPY047BI
         Vi1lQNwW8G1VH0tn3OYlRLb1zb4WxF4xWX/McJXBq55Rwf8/aykRrL1r1YYYjRgfD+Lk
         jcPo9zHapjLjAHV+BG8fPFO17lJILbuskkZNFddOY+OBFMV05E0BiruWgMk1DdGJk5Yk
         3ckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785031362; x=1785636162;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDTuZ70qXufeETtiXikOewPxsFp3y1jcFjaKcCLz/9k=;
        b=AHUL+dvrYiGVJyyHiq9S2+8emABTA871ykuqk52pneFtgTxMrfyLtheQpk/19UWXtQ
         aL4iOq8nLcWEL/J1mv1ICHthn/wVXZroA6sx04DLFbTJIsRJwLkFeU4kHeYQS8/u02ed
         d0aqI5CpFyMcWOwkk6eSdLEZHzUgg7pGojcf/skgRvKfADY8pqtawjDKKkJBFfS39YIp
         Qj14l56ZG7nUkaDXQpsvQZsgUN4NxwASIOwbYkIClErD6certhNvEPk7+ApcOtPfKaPu
         ZqW3XP4cofr2Fl8XtoQp24Gv3Bw/4U1qjkBUH9ggm5xyNu5jh0cI3HA36EStGL48s300
         0Glg==
X-Gm-Message-State: AOJu0Yyyulmkt9nLTT2VYO4MNoygLXzcwgbSjLMbALhPp+h7h2QCYrgH
	TysAvYaJSttZKPaGQ0ReFQaS/o9P0voXiy4nS6Ivj+ZKivZ5LuhdQUdGcisaE8hk
X-Gm-Gg: AR+sD13cJD5nI39tFgyZ/xOdQM3OpXQ6z7+phwqZ1IzOkIvjnxHHMP6K0/MLMP7bxnX
	IC6xpq07G/ul1yUjSOgL3X3ZHDC53jtkhZatee0V7WY24gjnkoi8ZImfLMx6GeKo2vvTVOtl22n
	YC/iqKeYdY5K0gi/7G5HKyv4WnFCvTGEQ9+J1j/isGW9aPET/LdEKCAXTTms7NoOct850+Wx+cQ
	iUjaZPoT21bddo/0leJSILTZj3S7TSCakh4ol5y6clUKCvbG3G/66tjGldW7/jNyND6z6Uc5hbB
	av/0uImpjSyCEkr4GGbGu8swA4wQEa6wa5183nfZKlzh47BtUzhcezKkrX6BNqFnwQsaQ9HaAb5
	0JU2dwuLZSKBJKIMliyBfZJwIK+wpvfH6XrlWpt/vH4MafsTf+xULlvxIegGC8zCSVGv1A/Q4bp
	TumWyc2Heji9dHcpSKHQwbrUFtUQXIcBMYNgFUfG00Zc5P9Z2iI+3oEzfOFX4nKnqgQcxOGsyqG
	HUngN6+UuVRkIML9ep+4a4d7laX9xTjZv8+6gS9O9Ld
X-Received: by 2002:a5d:6f12:0:b0:47f:9171:bca2 with SMTP id ffacd0b85a97d-47f9fe9251dmr4624238f8f.27.1785031361520;
        Sat, 25 Jul 2026 19:02:41 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm35291767f8f.10.2026.07.25.19.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 19:02:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Jul 2026 04:02:40 +0200
Message-Id: <DK84T2IP24QC.2ZOOOKY4B7MWU@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 5/9] selftests/bpf: Add kfunc __arena and
 __arena_nullable argument tests
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260726013105.3689867-1-memxor@gmail.com>
 <20260726013105.3689867-6-memxor@gmail.com>
 <20260726014114.A795D1F000E9@smtp.kernel.org>
In-Reply-To: <20260726014114.A795D1F000E9@smtp.kernel.org>

On Sun Jul 26, 2026 at 3:41 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The `arena_arg_stack` failure test is conditionally compiled o=
ut on compilers missing `__BPF_FEATURE_ADDR_SPACE_CAST`, causing a false te=
st suite failure.
> --
>
> --- Patch [5]: [PATCH bpf-next v2 5/9] selftests/bpf: Add kfunc __arena a=
nd __arena_nullable argument tests ---
> commit b7abeb2e41481276f90bb3144448d08e3c6e2c96
> Author: Tejun Heo <tj@kernel.org>
>
> selftests/bpf: Add kfunc __arena and __arena_nullable argument tests
>
> This commit adds kfunc arena argument tests to bpf_testmod to exercise
> argument rebasing, various accepted argument forms, and verifier rejectio=
ns.
>
>> diff --git a/tools/testing/selftests/bpf/progs/arena_kfunc.c b/tools/tes=
ting/selftests/bpf/progs/arena_kfunc.c
>> new file mode 100644
>> index 0000000000000..e7250c5197ab4
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/progs/arena_kfunc.c
>
> [ ... ]
>
>> +SEC("syscall")
>> +__arch_x86_64
>> +__failure __msg("arena pointer cannot be a stack argument")
>> +int arena_arg_stack(void *ctx)
>> +{
>> +#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
>> +	bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
>> +	bpf_kfunc_arena_stack_arg_test(1, 2, 3, 4, 5, (u64 *)1);
>> +#endif
>> +	return 0;
>> +}
>
> [Severity: Medium]
> Does this conditional compilation cause the test suite to fail on older
> compilers missing __BPF_FEATURE_ADDR_SPACE_CAST?
>
> Because this test is marked with __failure, the test runner expects the
> verifier to reject it. If the macro is not defined, the program compiles
> to just return 0. The verifier will successfully load the empty program,
> causing the test runner to report a failure because the expected rejectio=
n
> did not occur.

I think the goal is to not fail compilation, this is fine as a tradeoff.
