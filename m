Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697F841A90B
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097162; cv=none; b=RL4CyqTcedT3MKMr0DqIxMv28WBfa6+m5Fovc5RjfnIjbd1h/bjJ8UVwgmTI1rdkhEVdiNffezX4MJIrGo/QwzRye5Uq3QBRNB3x89GutqbU4Dm5Ihy8I58u9EKEZxGhkJrThbtYnRiaETvkUj90AXvYuU85ntMYXHWQeNcdpbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097162; c=relaxed/simple;
	bh=sA5sKBqdjln4LVJdf4f3i0ubipaw/kZhUE3epTeGjs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r5OFjmCZ4Lj3NjcsMe2q774HAmddlmWyjDrpsderkbPCcz3+oL9xzC/SlQeW6wOOiHuNN70yVBpl89IVSRT3pJr+ZS3ot/YShBLTXh7rpSQFJHMM5DRHqzVEYvCD1PDJejvogwfuR7ahcNuvp27jDtTJVsEckp8F+/ns4FkHigo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RqhqCc6q; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RqhqCc6q"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954aff6088so31933935e9.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 03:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786097158; x=1786701958; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFR8Iq7ncoeZFQXhT5aZNy4pslkhJ7M0UmwQblvHi8k=;
        b=RqhqCc6q2Y0cYYTZ0xP6RWdh7gbiArZdc68k9EKRT24JZYPkUWtI1oa/ZzYsAgEkGi
         IQ+ePa8R+ebLqlQo0IGJjvHlVgb8v7kGZoRlnjSsGHMPlvHrL9cIRYij0DeEhA3k7Fub
         qX1fTeUkY1lZr4e91O7zcrTnmJXP8w3Y8czlHiBbIc9ARCldyTFzG+avTi5tREjPyQfc
         KFBtYsBc9dJWnQ/cYBzWUwUljBw9yRYny4UI4GnS6pF8SOemcvhVHuuDfylw5OnsokpY
         7N03MZT9w8JXNHbeqSBaXwKazqHDeterylyAxyQsW687j6wvV4bNoZe3gzlLiLXl/05B
         41+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097158; x=1786701958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFR8Iq7ncoeZFQXhT5aZNy4pslkhJ7M0UmwQblvHi8k=;
        b=tU9IGyZghFRJkmdc890ac+CQSKL4PX1eNXOSNqFb//XowuwFcR6M3BgCQObBun2cjb
         RccAkTG78mUa0feiXtXT8BHr/cKcEv+GAwUvuRZaTOoSrkLTOly6sQDqSL74eAnTK4BF
         BzrxPMh4yrWQ7RYmgnQTWqkTUh2nQ9QWompCbaLnMEQ490O7PY53/LYViTspPMajycPU
         yfTm3nhDIO58fVp6z1C8Arpjnqp2lvs8MYfQRwLvv5gYoKrgpIWVxS9nWLaxZumx8iOL
         /qG2XxyVfjnnUK3pn0jIOdRUckvtTF6UsLgspB0aiXmFCrLUZ6+WqwFtSSQTYsY/m5bt
         YkvA==
X-Gm-Message-State: AOJu0YxiYWTAHWFPglDd83bHniUvoE0slw4JtGH6tLsvuD8ischCnhyK
	fPhr66RRHPEOHtsblvQgIAV4MzBTGfJ8SdfdqXoN/B84LlirEQhLiS7T0n0PuZV1v2h92tcOPKq
	OgMginI0=
X-Gm-Gg: AR+sD13GsETvs5ULq7yoj21ahOJT9KCUdmqHPuuHmHmcu07BZ5DXW29NIG0U6caazgH
	ApGp4RoTQkoJqNm2MazeggwS407qcSDx9UVdZu1nW6Zk/kQ8HYY5yLsjMd8y6u+81tvWVclRdWp
	Qq2XQab8+zv7ZjfwO1EV/3VJEjgwK6vo8w1hvejhp3nEcqWl7rezC28/D/70An3zP5qk4FUU8Re
	VJe9JMSLvlhBLO5jWydPRlMLrncDg+yL6iAYjaAeUkLJfXpqH5ZilzUKZW5XsSfT3YKq4uq+KYz
	V/jKfNDAQab3MNgzxZAkk6uv3N9eLGhATcMWpyLxlsnSXg9DzxwRSRD9MNCluo6aRyX+3hUlo86
	LGLxM2uSuFfFjEurnB14jsrtsfYOMxw3dUYvK5TSGMYjGPb7Cm//5kuShdtsNoRJQnltrIZq3M6
	NXv8Nql3+L9P6cqd7c6qBJ/WKJznDWQdcmRp/S/EMv0ArnPzeekDajgXqNZH2HgH1GaQ==
X-Received: by 2002:a05:600c:c046:b0:499:491e:4b0d with SMTP id 5b1f17b1804b1-4994e7d1ccdmr238405765e9.19.1786097158525;
        Fri, 07 Aug 2026 03:05:58 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f8f33sm4885059f8f.27.2026.08.07.03.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 03:05:58 -0700 (PDT)
Message-ID: <c925f9ef-b9e7-41cd-8809-d330283fed3a@linaro.org>
Date: Fri, 7 Aug 2026 11:05:57 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm_pmuv3: Zero initialize hw_id branch stack field
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260807-james-brbe-init-hw-idx-v1-1-009d1843960a@linaro.org>
 <20260807092755.CDF991F000E9@smtp.kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260807092755.CDF991F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/08/2026 10:27, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing initialization of `new_type` and `priv` fields in `perf_clear_branch_entry_bitfields()` allows cross-sample metadata leakage and KASLR bypass.
> --
> 
> --- Patch [1]: [PATCH] perf: arm_pmuv3: Zero initialize hw_id branch stack field ---
> commit 9362aa7ec453c50e757449959540fd185a720850
> Author: James Clark <james.clark@linaro.org>
> 
> perf: arm_pmuv3: Zero initialize hw_id branch stack field
> 
> This patch modifies the allocation of the BRBE branch_stack to use kzalloc
> instead of kmalloc. This ensures that the hw_id field, and any future fields,
> are safely zero-initialized upon allocation to comply with documentation.
> 
>> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
>> --- a/drivers/perf/arm_pmuv3.c
>> +++ b/drivers/perf/arm_pmuv3.c
>> @@ -1361,7 +1361,7 @@ static int branch_records_alloc(struct arm_pmu *armpmu)
>>   		struct pmu_hw_events *events_cpu;
>>   
>>   		events_cpu = per_cpu_ptr(armpmu->hw_events, cpu);
>> -		events_cpu->branch_stack = kmalloc(size, GFP_KERNEL);
>> +		events_cpu->branch_stack = kzalloc(size, GFP_KERNEL);
> 
> [Severity: High]
> This is a pre-existing issue, but since we are fixing uninitialized branch
> stack fields on allocation, does the per-sample reuse of these entries later
> leak previous metadata?
> 
> The perf_clear_branch_entry_bitfields() helper zeroes most bitfields, but
> misses the new_type and priv fields:
> 
> include/linux/perf_event.h:perf_clear_branch_entry_bitfields() {
>      br->mispred = 0;
>      br->predicted = 0;
>      ...
>      br->reserved = 0;
>      // new_type and priv are not cleared
> }
> 
> In the ARM BRBE driver, the per-CPU branch_stack buffer entries are reused
> and cleared using this helper. If a hardware branch record is source-only,
> entry->priv is not explicitly set:
> 
> drivers/perf/arm_brbe.c:perf_entry_from_brbe_regset() {
>      perf_clear_branch_entry_bitfields(entry);
>      ...
>      if (!brbe_record_is_source_only(brbinf))
>          entry->priv = brbinf_get_perf_priv(brbinf);
> }
> 
> If the previous sample in that slot was a user-space branch, entry->priv
> retains PERF_BR_PRIV_USER. When filter_branch_privilege() later checks
> entry->priv, could this allow kernel source addresses to be exposed to
> unprivileged users and bypass KASLR?
> 
>>   		if (!events_cpu->branch_stack)
>>   			return -ENOMEM;
>>   	}
> 

Fixed by "[PATCH v6 3/3] perf/core: Clear the whole branch entry in 
perf_clear_branch_entry()" on the list.

