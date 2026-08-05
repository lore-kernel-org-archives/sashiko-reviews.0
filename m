Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1EB481FA1
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 16:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946964; cv=none; b=jZzg+wvlRRrje1X/6+h8So+4urFlhQu3XInpf0nYWvXakQn1hE3WWu+rzE0lewFEVgk0M3aqMZ93jwVDCPvvwI/sCkI/UkkQS8VCZiQFdDRqLJ+fIpdqL4WeNovYxTRwKJgWqNk7dkOffknVBu0gugsh1aUkfpzumy8MexPmG1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946964; c=relaxed/simple;
	bh=8Ige4WHC7piJGwboPsF49M+zi/fuLLqMwqZuMEtEzBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSw5c837sq9DiIShqcZnM+bAn1VJ5hGouyaaRkO6Q0niNjk27AVOfycip9nqLtGFjHSj/HRPBXCi/RWfQlsQCrYCYZ3wvoqwP1SpenD996hY/9J5xjEbnn4gXKqP9AOsNqx1giLcxBoSYDnolQLrbmqq+FbN8JN7/onAURT6bJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bJpLc+qg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bJpLc+qg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so10659315e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 09:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785946960; x=1786551760; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OycghlLmRiKTDv3n0cc0hGkzggQdc2xkQpJfY9zernY=;
        b=bJpLc+qgt1ipuPdmXaSwQHj8pB4DAVUDcR+Wqn5Za8qni0ohrXjQ2xw06J7OR1jjXL
         eWLv1nP6xn8WXc3ZyevhpKo3IGJaAiGJFLqZ5+XQ8m4upx3fLcrTNuCPGJfBSQuS2Z9v
         rEtdebJEwbj/jp4ASvrkJGjGei662JVO2gRZOI8YWvQr2ky+pyrM3OSH5t4TUZIa6i/b
         eMv0VRwcrH3w3GnC27vUFVZAt9k+qT12wxR/miT0Cuidp08QDisWyzRqDoYCieNZCzC/
         Ztzoqt/kQC1yPLeG6KQ8FMoRrLnfKoxZP35P1ZsP+l4t8dvdaPMOvqjxc+JbfcWsFurd
         EXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946960; x=1786551760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OycghlLmRiKTDv3n0cc0hGkzggQdc2xkQpJfY9zernY=;
        b=aB1hD0Mr0PWjCt7eOPjoiZfjqViHtiXoWTiviUwUitfE9ZtCS+yBf/JtAGXnsSnD6L
         dHqX3MBkIG453Zdy4gvzf0tCf7XGuYimswmxld9YhFHw/fPEJp/99RYWe1WLs6/Y2/cM
         gYUzmKNIy1p98r7haaerBrxc9XzexQS3phDRD26XswwttoJRyHDODbSlUDEWZA6IxC8P
         5V15XFWrISDdbIgWlUz6mGkD6S01TU4SmWnAkg91xJZVwDGatlG/rWNO6N6nJMopnZ7z
         zKYfQq+6BvOU6dvvbXvQtwUX3Cn91sFxHHTZWT81cyaBbLITNy5ehOPNARr1qa9fZ3ST
         qIKw==
X-Gm-Message-State: AOJu0YwZvIwkqcuXMsXmfalncwJwDw39qqN+5LZARrTsTrx0hgG149z6
	wO3zPczP5UmWLuDHHff7lafyGE9o2cRaElJXoukRcGTOxOG/dW8NiGmxD15i5EuYeEO9nQFpJgp
	xRVjEJcD4bg==
X-Gm-Gg: AR+sD13ZYiV06NE5V4xop4/yCltVOiFvFnJtGk86o1/X/dYcYHcXfmlvKhMtz+mRP7w
	KsteMaufWHNQoYLeZx4nNhx1Zunq8ISs4m3RW9o65dA8MtcFjrSRMFY4o2CEXNOPa2f8MY3DY5P
	i7we/+c0Wvs/GkA3xMB9G22/6bVyuS+KcuDLWsdkIoLYtU6z5YAX4VdRZ5hgDxC+FziLVMEXnG6
	UmF11y7Us6zB+VbTJZj9hUvISr/AHsvggBiql97cqVhKtJpwdLgqfJxS8oIlyGpkFCPI4FegWjq
	8PgHNczlJCJELAFzZw09P+GMamOpcFpa+zBaNMXdDQ8Zax5DiRayEpktRGqSTy3CUFd9SY96DkY
	mB2mg9YNwY+oKYM1pTCQlrOWjI4V6LUweqWGxRM2nMgbrB23sqD0807bxkXiusEMSqmSKwlKzU7
	Cr3GKhQ+z7aRW78yUlSa58eaIitTOCwSVXuoBEf/slNbouF0XbJQBkWf93L5fa6ZfORw==
X-Received: by 2002:a05:600c:198f:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-4994e7cc5a4mr101401865e9.15.1785946959866;
        Wed, 05 Aug 2026 09:22:39 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fd4bbcsm193952535e9.7.2026.08.05.09.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 09:22:39 -0700 (PDT)
Message-ID: <240515b0-a711-46d0-b09e-65103b2e0118@linaro.org>
Date: Wed, 5 Aug 2026 17:22:38 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] perf: arm_spe: Add support for a 'software' discard
 mode
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@arm.com>,
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, Al Grant <Al.Grant@arm.com>
References: <20260805-james-spe-software-discard-v1-0-0ff0e44c4c92@linaro.org>
 <20260805-james-spe-software-discard-v1-3-0ff0e44c4c92@linaro.org>
 <20260805155810.7E2A11F000E9@smtp.kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260805155810.7E2A11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/08/2026 16:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Writes to control-plane system registers (`SYS_PMBPTR_EL1` and `SYS_PMBLIMITR_EL1`) lack an immediate `isb()` synchronization barrier, violating ARM64 architectural invariants.
> - [Medium] User-triggerable allocations for the software discard buffer lack `__GFP_ACCOUNT`, allowing a user to bypass memory cgroup limits.
> --
> 
> --- Patch [3]: [PATCH 3/3] perf: arm_spe: Add support for a 'software' discard mode ---
> commit af3311701234ae1a3b87d9c00cb9f6f3748862b7
> Author: James Clark <james.clark@linaro.org>
> 
> perf: arm_spe: Add support for a 'software' discard mode
> 
> This patch implements a software discard mode for ARM SPE. It falls back
> to writing to a single driver-allocated page and not emitting aux records
> when hardware discard support is unavailable.
> 
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
> 
> [ ... ]
> 
>> +static int arm_spe_pmu_alloc_discard_buf(struct perf_event *event)
>> +{
>> +	int node = (event->cpu == -1) ? -1 : cpu_to_node(event->cpu);
>> +	int nr_pages = ARM_SPE_DISCARD_BUF_SIZE / PAGE_SIZE;
>> +	struct arm_spe_pmu_sw_discard_buf *buf;
>> +	struct page **pglist;
>> +	int i;
>> +
>> +	if (event->parent) {
> 
> [ ... ]
> 
>> +		return 0;
>> +	}
>> +
>> +	buf = kzalloc_node(sizeof(*buf), GFP_KERNEL, node);
>> +	if (!buf)
>> +		return -ENOMEM;
>> +
>> +	buf->page = alloc_pages_node(node, GFP_KERNEL, 0);
>> +	if (!buf->page)
>> +		goto out_free_buf;
>> +
>> +	pglist = kvmalloc_array(nr_pages, sizeof(*pglist), GFP_KERNEL);
> 
> [Severity: Medium]
> Should these GFP_KERNEL allocations include __GFP_ACCOUNT?
> 
> Since this memory is allocated on behalf of a user process creating an
> SPE event, omitting __GFP_ACCOUNT could allow a container to allocate
> kernel memory without being charged, potentially bypassing memory limits.
> 

I can't find any examples of __GFP_ACCOUNT being used in a similar way. 
Even the existing arm_spe_pmu_setup_aux() doesn't use it. So I'm not 
sure what the precedent is.

>> +	if (!pglist)
>> +		goto out_free_page;
> 
> [ ... ]
> 
>> @@ -617,10 +698,26 @@ static u64 arm_spe_pmu_next_off(struct perf_output_handle *handle)
>> -static void arm_spe_pmu_begin_discard(struct perf_output_handle *handle,
>> -				      struct perf_event *event)
>> +static void arm_spe_pmu_begin_discard(struct perf_output_handle *handle,
>> +				      struct perf_event *event)
>>   {
>> -	u64 limit;
>> +	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
>> +	struct arm_spe_pmu_sw_discard_buf *discard_buf = event->pmu_private;
>> +	u64 base, limit;
>> +
>> +	if (spe_pmu->features & SPE_PMU_FEAT_HW_DISCARD) {
>> +		limit = FIELD_PREP(PMBLIMITR_EL1_FM, PMBLIMITR_EL1_FM_DISCARD);
>> +		limit |= PMBLIMITR_EL1_E;
>> +	} else {
>> +		base = (u64) discard_buf->base;
>> +		limit = base + ARM_SPE_DISCARD_BUF_SIZE;
>> +		limit |= PMBLIMITR_EL1_E;
>> +		write_sysreg_s(base, SYS_PMBPTR_EL1);
>> +
>> +		/*
>> +		 * Track the event so we can access the discard buffer through
>> +		 * event->pmu_private. perf_aux_output_begin() normally handles
>> +		 * this, but we can do it manually if that's not being used.
>> +		 */
>> +		handle->event = event;
> 
> [Severity: High]
> Does this write to SYS_PMBPTR_EL1 require an immediate isb() synchronization
> barrier?
> 
> Without it, the subsequent memory store (handle->event = event) might execute
> while the CPU pipeline is operating under an architecturally undefined state.
> 
>> +	}
>>   
>> -	limit = FIELD_PREP(PMBLIMITR_EL1_FM, PMBLIMITR_EL1_FM_DISCARD);
>> -	limit |= PMBLIMITR_EL1_E;
>> +	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
>> +}
> 
> [Severity: High]
> Is an isb() barrier also missing after this write to SYS_PMBLIMITR_EL1?
> 
> Because it is at the very end of arm_spe_pmu_begin_discard(), the function
> return and any subsequent conditional branches in the caller will execute
> before the pipeline state is synchronized.
> 

The register write orderings are identical to the old 
arm_spe_perf_aux_output_begin(). So this would be an existing issue if 
it even was an issue.

