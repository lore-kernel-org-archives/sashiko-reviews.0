Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C7F2DB78B
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 01:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785202439; cv=none; b=HnZp2J0B81H2sGuEUnFhyV/e2dcjPJIO4wL8nx9pZ+aDph8NuIG1Of+mgNwbvp3i+FBe/0iTOhiH9uRS2x2xc4hS+Z5Hz9BswXsSoRUKeiuCnaIS22xjn+mf5t4a2W0PrEDMPM5dpcz0l4Y7cWV6FBQKV88hLQxBhYTytjPmdHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785202439; c=relaxed/simple;
	bh=AQ9TWGh1fqb6Ql7Fb1eNWMc0KI4p/ZClc4/hGwZ0Yfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGDLIeDNcnLUAj9BeSgM2MBWwoztlxQnUQaFrj1Th4qjlKEN9PX9iA+twoJjtcuiSmDQM89ikpbk7Feq36DzrZOrcE+CpWZAOwu2OwvVaOza1uaQpS4kIhIA+HiwxVqckjhHUjny8K+wj+aWu40DHWo/Sylm1CRm8CULEOFd0jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=arvVJfOz; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="arvVJfOz"
Message-ID: <82dea78e-7930-4380-bf57-4123f48d86b6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785202435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WD94w5wcckP1xGyG4NSw/YaiLcRaOIaQYBLlhFeTXrE=;
	b=arvVJfOzm9TtxYfTKVg4H6rHsZc7tsBknSgUdi9FxQAmMizDMTKkPV/03UN0k8blqf1lI9
	A9xejJVfs2vueMC7GV5NSvlcUMGFBpPoTMjQLtEol+jt7pDONH3TobKtYxyuFNh0gaGZ5X
	U9ZJO6bPkSCr3Gn8/oJ44AACko5cig4=
Date: Tue, 28 Jul 2026 09:33:43 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: Verify rejection of
 sleepable tracing prog
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260725132624.78373-1-leon.hwang@linux.dev>
 <20260725132624.78373-3-leon.hwang@linux.dev>
 <20260725133309.B66B31F00A3A@smtp.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260725133309.B66B31F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 25/7/26 21:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The test contains dead code after the expected failure of `fentry_sleepable__load()`. If this code executes on an unfixed kernel, it intentionally triggers a kernel BUG and crashes the test environment.
> --
> 
> --- Patch [2]: [PATCH bpf-next v2 2/2] selftests/bpf: Verify rejection of sleepable tracing prog ---
> commit 44292a230f0467503b72b0ecb8c6c25244de310b
> Author: Leon Hwang <leon.hwang@linux.dev>
> 
> selftests/bpf: Verify rejection of sleepable tracing prog
> 
> This commit adds a selftest to verify that a sleepable tracing program
> cannot attach to a '__x64_sys' prefix program target. The test attempts
> to load the program and expects the load to fail, avoiding a kernel BUG
> on unpatched kernels.
> 
>> diff --git a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c b/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
>> --- a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
> [ ... ]
>> @@ -576,6 +577,60 @@ static void test_func_replace_progmap(void)
> [ ... ]
>> +static void test_sleepable_fentry_to_xdp(void)
>> +{
> [ ... ]
>> +	err = fentry_sleepable__load(skel);
>> +	ASSERT_ERR(err, "fentry_sleepable__load");
>> +	if (err)
>> +		goto out;
>> +
>> +	skel->links.fentry_xdp = bpf_program__attach_trace(skel->progs.fentry_xdp);
>> +	if (!ASSERT_OK_PTR(skel->links.fentry_xdp, "bpf_program__attach_trace"))
>> +		goto out;
>> +
>> +	skel_xdp->links.__x64_sys_nop = bpf_program__attach_xdp(skel_xdp->progs.__x64_sys_nop,
>> +								ifindex);
>> +	if (!ASSERT_OK_PTR(skel_xdp->links.__x64_sys_nop, "bpf_program__attach_xdp"))
>> +		goto out;
>> +
>> +	err = system("ping -q -c 1 -W 1 127.0.0.1 > /dev/null");
>> +	ASSERT_OK(err, "ping");
>> +	ASSERT_ERR(skel->bss->retval, "retval");
>> +
>> +out:
>> +	fentry_sleepable__destroy(skel);
>> +	xdp_dummy__destroy(skel_xdp);
>> +}
> 
> [Severity: Medium]
> Since the test expects fentry_sleepable__load() to fail (meaning err < 0),
> won't the "if (err) goto out;" statement cause the test to immediately branch
> to out?

Correct.

When err, no need to create the links.

> 
> If this code behaves as expected, it appears all the subsequent logic for
> bpf_program__attach_trace(), bpf_program__attach_xdp(), and the ping command
> becomes unreachable dead code.
> 
> Conversely, if the test runs on an unpatched kernel where the load
> unexpectedly succeeds (err == 0), the test would fall through to the attach
> and ping logic. Could executing this sequence on an unpatched kernel trigger
> the exact kernel BUG mentioned in the commit message, potentially crashing
> the test environment instead of gracefully failing the test?
> 

Yes. But why do users run latest selftests on unpatched kernel? I guess
they are planning to patch the kernel.

Thanks,
Leon

