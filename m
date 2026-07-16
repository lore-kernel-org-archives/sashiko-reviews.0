Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1D1273D8D
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 05:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784179550; cv=none; b=X2twtAzkrTTXJAo9ZkmKM8C38h0Md0CauPa06+urizeioGRGyS2Gq5kg2eZB2LnN0fvKWyuwOG2z6cCXFIgGMYEyPMdunu3QzGbRRvcoejaDGSOGA52iOVQhA5eqzcApUXYQnfqPEUpYRLdZ4spzDH2x91uVF6L4JnUJ5IRFYRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784179550; c=relaxed/simple;
	bh=HacPp76f7MbZ0l/33PEsTDhw3UqRMzXJscmUnDcINYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AW8S0lUYIV+zWGNSGWBtpMxanZmSgx0gmJmSxbgTWLA1FnGOy0nLQMudjWh7ZDA3ctu+1Mn9VibylADAsy6FKI7quqghX7/IlHG6jjRZzgjMdLxIDPv7Vda0r4CcboeD8J4JsrXgf8fIPj0bJlUT6+T6j/wB4Cvj1y2zaPI5MSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GE8bFbe5; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GE8bFbe5"
Message-ID: <7766c6e0-fa2c-4b54-b43c-c544b03c868d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784179546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LvGbqB4OvMJAxqsUksgkb/N4w0LeMQ21qEProLJfBEs=;
	b=GE8bFbe5Ue3vHlVRZbNNz4vDkikc5ETpLUC+CPLkwVZ8F3JAep7GxqcuJp4I5XZJXBONJP
	18Yt+v/kg8NPQkeAX/f8ZSxb+rYIwgw9E0kopYpfgcoGEGjMNRI9uP2U6lBU8SxbjEDW9C
	+kJx8haWzQBulAk/zyI4GCwDvdlrdd0=
Date: Thu, 16 Jul 2026 13:25:32 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v10 6/9] selftests/bpf: Add tests to verify
 global percpu data
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260715153254.92010-1-leon.hwang@linux.dev>
 <20260715153254.92010-7-leon.hwang@linux.dev>
 <20260715155501.C8C5F1F00A3D@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
Content-Language: en-US
In-Reply-To: <20260715155501.C8C5F1F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 15/7/26 23:55, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `test_global_percpu_data_subskel` selftest fails unconditionally because it asserts `var_cnt > 0` on a subskeleton that is generated with zero variables.
> --
> 
> --- Patch [6]: [PATCH bpf-next v10 6/9] selftests/bpf: Add tests to verify global percpu data ---
> commit c5a32c0630bc8d9b3aedfc264c75289a1f8e6d98
> Author: Leon Hwang <leon.hwang@linux.dev>
> 
> selftests/bpf: Add tests to verify global percpu data
> 
> This commit adds selftests to verify operations on global percpu data in BPF
> programs. It tests various libbpf APIs and skeleton behaviors for percpu
> maps. It also adds a test to ensure live variables of a subskeleton do not
> include global percpu data.
> 
>> diff --git a/tools/testing/selftests/bpf/prog_tests/global_percpu_subskel.c b/tools/testing/selftests/bpf/prog_tests/global_percpu_subskel.c
>> new file mode 100644
>> index 0000000000000..8aebd533d86b5
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/prog_tests/global_percpu_subskel.c
>> @@ -0,0 +1,37 @@
> 
> [ ... ]
> 
>> +	if (!ASSERT_OK_PTR(subskel->maps.percpu, "maps.percpu"))
>> +		goto out;
>> +	ASSERT_EQ(bpf_map__type(subskel->maps.percpu), BPF_MAP_TYPE_PERCPU_ARRAY,
>> +		  "percpu_map_type");
>> +	ASSERT_GT(subskel->subskel->var_cnt, 0, "var_cnt");
> 
> [Severity: Medium]
> Since test_global_percpu_data.c only contains variables in .percpu* sections,
> and the subskeleton generator skips percpu array variables, will var_cnt
> always be exactly 0 here, causing this test to unconditionally fail?
> 
> Would it make sense to either add a standard global variable to
> test_global_percpu_data.c (e.g. in .bss or .data), or adjust this assertion?

My bad to miss a new 'int data3 SEC(".data.percpu")' in
test_global_percpu_data.c in this revision, which would mute this review.

Thanks,
Leon

> [...]
