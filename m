Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC9A470433
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 16:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946257; cv=none; b=LNRyWNsiyZMDa1tJpCQ4hgvcUjBgOHi1ZiDFR4wKUSFXP6f70mppLkl/E440AoqQKqtp+reoIjtgGsPGll9ve2iPFgPlkLoK1+edmlnOHU49Z3e/DasFGeKgUDRHPQdgLia50vWI7JSMb0Nncijqa2rVYyGFb/N4jjHsPenzjuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946257; c=relaxed/simple;
	bh=IXEVwfzsahq6FUkJxYJhmc4SAHegCMiUul051MBbDv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MceMjKPpnf2cM+nWtv0iTREZoqNZ9D5XlDPGfhcJrw2C+ojSk2AW1gFGxWPCnSXwVZO1EMQp5EUPM8MLHXYdyhvXHHp74G9mPOQkBrSvOLjUI1cmokKAQgxoM9kbE1rhx3c7HHP7n+6CKUoVsISefWQCFD8fpJKIxU1QQhyTM/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gMJzfpIX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gMJzfpIX"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so36485e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 09:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785946254; x=1786551054; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRMc9ELRK9N2OjwBZeonQXM7QBgpvnvx9C7k5nluwVQ=;
        b=gMJzfpIXXbYm0xAn582IrJp2YXsyTvYmKqL/KXIRbCHvA0/8Zq0S91V5BRYKrQOsq0
         soHV4gGm8ZqcOZx+gXXK/725h4Yfz9GqYYB9a5Z5QBsmmSHRtzjV+46KEBRT8iwl+jy8
         J/0EQeRLO3vtcUfLEI8WdXht7txV3Qk2xtpw+Em8Sjx+ChqTzgZMUr+EqUxfzp2z75+J
         6yNVBD5BCLdvvJFKG/yStbAUQj+0p+wO8IrdQnFtgmUnOa8mM5Ux3jLnPvTUdwnosQFD
         5mQDb6xzhapGECyKDA1zQnCbfWJjBXpNkV0o6z/imxzv46Z/UnKUqOFubt/5eF1sIwv8
         Inqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946254; x=1786551054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRMc9ELRK9N2OjwBZeonQXM7QBgpvnvx9C7k5nluwVQ=;
        b=K5uvK1lX2rcw9GxAeEBkPqUQHMQDyUgTF9ZhmDsBoDPDxeZ83EvYAyxu3dUm+7HoS5
         +gpSrdSNXtP9hwXF0xits4dUiqAJoGYkTEeEAA4p1w59F58jWxdDur0aeKaKTC7Q0yk/
         Hj9aA1g8uawM7EzRPFcuDw1mQNeLyWEdM/maPI9C7W50GU7eX5D2dJcziv84ggj5SZSi
         8Ofepfz74L0SUSCZiyz2KK4mwhHFzVN5aJRD+eCiy1eVD+1FNlr7TMClR1bcPAX1lYde
         idFi+uzrnaDmVcNrxSz7Z9wIP1uvcUy+tPWyRcHAGq3ni42mHIorvZri9oouu8HKpfaq
         80lA==
X-Gm-Message-State: AOJu0YwKtM5lgXxd2jvTwBbCXcTat1yePts84lUWV1hx5X6sTCNb8HVw
	Kj3CUxyqmgUHIjfRnj78RsAVYSFSZC4yfgJQnZATqwlOLe5a8xjdMS72CXksiq7uJ6tj4981qht
	HlbnOVuz7+A==
X-Gm-Gg: AR+sD13YNNP5vva1kzb90woifAIGIdB4OHhVNAQ14Q5Fqxnq2I24PcxKP9hzhnZJ90D
	c9/R09nmA52vCFfXseAxwEo/VK0jwR9gk3h18l+cIGXvbk5Is9itclxWL3Qw+zjeMO41LHl6Pa1
	O3F5mK+hKfw1sIxHvS0Bjfm/mvNOXQhgZDUkTjh24XgesEkcP7CBKFNlJ/5eNvfcfUyFxNYwo5a
	cfXiGx/0Ll1B20RKU6VaPrkQKXYsfTepgGArpUn9rgXkWNKjFdc8TI/F3rTq9KE0lECeJ5bl8Wx
	hhSSVDx8CINnoLXSS3HlPlvEdgkvGN5DZNPWbvNQkSreC9sKjhpo0DUaEHq/IvcASGYjmE/pJ/H
	KVCHMgiUbzRdd8PlrV54ouWYdtRnV1gKJ3cB17dZWrni30zs1me6zzMALs/4SeBRZYwxAEErAeM
	Ee5ANpsTNS+R9fA3wbMqV4QFxehH3oeX8p6SXHcd9IfEMbuaZuPhyKbCPTyK3oJpCxnA==
X-Received: by 2002:a7b:c399:0:b0:495:58fe:88e5 with SMTP id 5b1f17b1804b1-49952d92cefmr4071305e9.2.1785946254097;
        Wed, 05 Aug 2026 09:10:54 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfe6b26sm10354973f8f.16.2026.08.05.09.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 09:10:53 -0700 (PDT)
Message-ID: <9dbac460-7f94-43ad-b90c-3fadecefd797@linaro.org>
Date: Wed, 5 Aug 2026 17:10:52 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] perf: arm_spe: Factor HW discard mode out of
 arm_spe_perf_aux_output_begin()
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260805-james-spe-software-discard-v1-0-0ff0e44c4c92@linaro.org>
 <20260805-james-spe-software-discard-v1-2-0ff0e44c4c92@linaro.org>
 <20260805153750.86FFE1F000E9@smtp.kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260805153750.86FFE1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/08/2026 16:37, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Unhandled Interrupt Storm / Unreachable Code due to uninitialized perf_output_handle in discard mode
> 
> Pre-existing issues:
> - [High] Missing Context Synchronization Event (ISB) after writing to SYS_PMBLIMITR_EL1
> --
> 
> --- Patch [2]: [PATCH 2/3] perf: arm_spe: Factor HW discard mode out of arm_spe_perf_aux_output_begin() ---
> commit 61201ea6d6b4e69de62f9788efe1db4fd64b4fd9
> Author: James Clark <james.clark@linaro.org>
> 
> perf: arm_spe: Factor HW discard mode out of arm_spe_perf_aux_output_begin()
> 
> Discard mode doesn't call perf_aux_output_begin() or emit aux records,
> and enabling it never fails. We'll add a second discard mode in the
> next commit so it will be cleaner if there is a separate begin function
> just for discard mode.
> 
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
> [ ... ]
>> @@ -609,18 +614,23 @@ static u64 arm_spe_pmu_next_off(struct perf_output_handle *handle)
>>   	return limit;
>>   }
>>   
>> +static void arm_spe_pmu_begin_discard(struct perf_output_handle *handle,
>> +				      struct perf_event *event)
>> +{
>> +	u64 limit;
>> +
>> +	limit = FIELD_PREP(PMBLIMITR_EL1_FM, PMBLIMITR_EL1_FM_DISCARD);
>> +	limit |= PMBLIMITR_EL1_E;
>> +
>> +	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
>> +}
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but writing to a control-plane
> system register like SYS_PMBLIMITR_EL1 requires an immediate isb() to avoid
> leaving the CPU pipeline in an architecturally undefined state.
> 
> Looking at the caller in arm_spe_pmu_irq_handler(), the isb() is issued after
> this function returns, which means the CPU executes the function return
> instructions before the barrier. In arm_spe_pmu_start(), execution proceeds to
> even more instructions before an isb() is eventually issued.
> 
> Should the isb() be placed immediately after the write_sysreg_s() directly
> inside arm_spe_pmu_begin_discard() to guarantee architectural compliance?
> 
> [ ... ]
>> @@ -884,7 +900,9 @@ static void arm_spe_pmu_start(struct perf_event *event, int flags)
>>   	struct perf_output_handle *handle = this_cpu_ptr(spe_pmu->handle);
>>   
>>   	hwc->state = 0;
>> -	if (arm_spe_perf_aux_output_begin(handle, event)) {
>> +	if (arm_spe_discard_mode(event)) {
>> +		arm_spe_pmu_begin_discard(handle, event);
>> +	} else if (arm_spe_perf_aux_output_begin(handle, event)) {
>>   		arm_spe_pmu_stop(event, 0);
>>   		return;
>>   	}
> 
> [Severity: High]
> Because discard mode explicitly bypasses perf_aux_output_begin() here, the
> per-CPU perf_output_handle is never initialized with the ring buffer or event.
> 

If this is an issue then it's an existing one because this patch is just 
a refactor.

> If the PMU hardware asserts an interrupt during this mode, wouldn't
> arm_spe_pmu_irq_handler() see an uninitialized (or previously NULLed) handle?
> 
> It looks like early checks in the IRQ handler, such as checking if the event
> is present or if perf_get_aux(handle) is valid, would evaluate to true and
> return IRQ_NONE immediately without clearing the hardware interrupt syndrome.
> Could this lead to an unhandled interrupt storm that locks up the CPU?
> 

HW discard mode doesn't trigger interrupts. If it does then a separate 
fixes commit is required unrelated to these patches.


