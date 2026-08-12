Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC273905EA
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 04:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786507710; cv=none; b=krE/3TWuIWZ1ghjXflDsyrG9gekb7DO6qGBEnMSmHX466yTNkAGvWFYTAgmd+MNOEs2tV03fzMyAoY82HS/SrFWIdZGoXuv9+lk3Cz4l/RY5pT0zuShFKbphqKe+TAaiQ+DTrRxiBw9FU0fqydL6fhDhIeYdGDx+webPKWjB//A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786507710; c=relaxed/simple;
	bh=92gUTVy22BeEl0CvB8dls2Kwhhh0PydMH/XXF7ZHjjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pozYX26YluZAFMAAjSzpSj9H0dHBowfoOL2Ak14lemurNo9n973h/iM3Sl6fAgz6i/cHyT83xg1oKvYPck44peH9JOBBny96952ctCZRC+/N5Qb4Wn7/lvxtnNsH7fsPv8F7X3BD6BCjossXD0GqP9YXqHbhuznu3t7UrroheVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R9luNLib; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R9luNLib"
Message-ID: <f7aa97e6-7e8e-4770-9797-f41250e68c9d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786507696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S4Ztl9JVwHddAPEBtt7EaHw3RtsZZVz0dG6fWWM0F64=;
	b=R9luNLibpReJQ0+zovKK3bTeKOzh36VYrM6jUbjQcnqsM1Delx8l2Ef6CM+EA33O2U19GX
	hQwPRg4wmR9zyehFuO9Sw5JAHalgSc1K1eB3gpDuJRovJv6Wfu73IvfK2TSfrAON8mAIpV
	go/BUKsr3Dp+TNK0eq731FPJBvG+ybA=
Date: Wed, 12 Aug 2026 12:07:51 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 11/13] selftests/bpf: Add tracing_multi bpf prog
 rollback test
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260809150111.45000-1-leon.hwang@linux.dev>
 <20260809150111.45000-12-leon.hwang@linux.dev>
 <20260809152102.5AB1D1F000E9@smtp.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260809152102.5AB1D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/8/26 23:21, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `test_rollback_bpf_prog` test hardcodes executing `target_1` to verify rollback behavior, leading to spurious test failures if `target_2` happens to have a lower file descriptor.
> --
> 
> --- Patch [11]: [PATCH bpf-next 11/13] selftests/bpf: Add tracing_multi bpf prog rollback test ---
> commit b065372f3722241a5632ef72df356c018b778825
> Author: Leon Hwang <leon.hwang@linux.dev>
> 
> selftests/bpf: Add tracing_multi bpf prog rollback test
> 
> This commit adds a test to verify that prepared trampolines are correctly
> reverted when a BPF program multi-attach fails and triggers a rollback.
> 
>> diff --git a/tools/testing/selftests/bpf/prog_tests/tracing_multi.c b/tools/testing/selftests/bpf/prog_tests/tracing_multi.c
>> index 070266a864d4f..a4d9934ad1dc3 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/tracing_multi.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/tracing_multi.c
> [ ... ]
>> @@ -377,6 +377,65 @@ static void test_cookies_bpf_prog(void)
> [ ... ]
>> +static void test_rollback_bpf_prog(void)
>> +{
>> +	int token_fd, prog_fd, fd = -1, pre_fd = -1;
> [ ... ]
>> +	first = target_fds[0] < target_fds[1] ? 0 : 1;
> [ ... ]
>> +	fd = bpf_link_create(prog_fd, 0, BPF_TRACE_FENTRY_MULTI, &lopts);
>> +	if (!ASSERT_EQ(fd, -EBUSY, "bpf_link_create"))
>> +		goto cleanup;
>> +
>> +	if (run_bpf_target(skel->progs.target_1, first + 1, "rollback_target"))
> 
> [Severity: Medium]
> Does this test accidentally hardcode the execution of target_1 while expecting
> a dynamic return value based on file descriptor ordering?
> 
> If the file descriptors are assigned such that target_fds[1] < target_fds[0],
> the variable first becomes 1. The test then executes target_1 but expects a
> return value of first + 1 (which is 2).
> 
> Since target_1 always returns 1, will this cause a spurious test failure?
> 
> Additionally, if first == 1, target_1 would still have a trampoline attached
> via pre_fd. This would cause test_result_fentry to increment and fail the
> subsequent ASSERT_EQ() check.
> 

Will select the target prog according to 'first' value.

Thanks,
Leon

>> +		goto cleanup;
>> +	ASSERT_EQ(skel->bss->test_result_fentry, 0, "test_result_fentry");
>> +
>> +cleanup:
> [ ... ]
> 

