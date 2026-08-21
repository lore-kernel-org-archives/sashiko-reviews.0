Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6AF471D1F
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307007; cv=none; b=KPAviVNa4QokIbXu7rU3/ZY7t3h25QRXIREVZVVw9UiqakIfE9YQsx9dHxStCBebkjypVPU5IsSKyzzV9XDU8AZf4D3OwwK4//Paup4a/JnW7MSICxzbncE5N7Dwg0yi2AMqNWZzyRCXmx+OMNxRg8Ndwm2XsJuJkCKOpZOldVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307007; c=relaxed/simple;
	bh=/diK7OirqVzGd/G/FEBUZ+qnKXlHVXFm8FPazfE3GjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JULlSVvtltybFrDWbcb/BrwtOMjjW0F/G6H3SY4/MqUNCb3AqSW89rwvcYFy2hNM3WX/O1qHvn03B3nVjqaLeQgTdBChCW7yjeiKo7aRpQ2I2n7CtUXteqhszSjdGOZQUz1iyAq6QFwtHk4hwEr0Gk+aGy9hUMNnoO8Jtwu3mWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rjkIoGJn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rjkIoGJn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so4978925e9.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 03:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787306996; x=1787911796; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGCf17okpHY2PImvuIUXBHwDsbK/U/zUaqOXjffAmN8=;
        b=rjkIoGJnkV7Cb7tyKrSoKTa2Ba6ebJeTq6YUGsqHhUaEJoZhUPBA62A/ttdu7vakZE
         fVWd8Hz6RKrpAYE7qj0Z6BeoWZEW1pSwnhYlftJNUbF/aRSXWnfJrGzcDKA78hpX7Uda
         UVn5pkHPcj5OXehQ+BnlpgcObniSC9vvRhA0lmB8qcKkSEw2NoSOkyAEWlDpgAmEaRCw
         0rpCU5tfcQ9CHqqJZ8e0xXoQVo7ekd4ON8rVVdq0Os0FQ2RY2+tDjRrA941RjU98ZiOc
         93dUGbDi1K8iDQTxIi4STbHS6/pm/FR3LfDzcofjTWLjfCnqkHDwowDEwT1otyL92BNW
         Cp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787306996; x=1787911796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGCf17okpHY2PImvuIUXBHwDsbK/U/zUaqOXjffAmN8=;
        b=aiMuCRD89LtoJt2D0ct8I5KINhCfhgQAO3ubr6Bg3YTd1iDr/96f55q9Ua70+efh+l
         xQeqm5yhUM+SqJVeE1JGIdlDFB4jPJ0S8Asy71HU9FMe9Vi7axfJa9pagz6n3veU10k5
         VgPTiByAa0JVekCmxmgjhkaXCyEpVBdNpKnqo14YO/aa65eQZfGLdH5xl+mc/RV+sBJq
         gs6QoLR4ZKQodE6h94Dah9w+Fh2VrA8HjepBccRqcHXm8sK5FlGb5y9doVo8R3SG6Wr0
         iyqyxKd3sZMevzAb6w5+/jIux+n9rl57i4jhakn1Jzah/G/mCIHIR61kuLL6l0Xzbs/9
         iwfg==
X-Gm-Message-State: AOJu0Yz3GA2GiNNQsEitnU+JRsR1By794PQpItH1InpX7CDvWfMnL5yq
	W6EdDqaE7dUAGRbI3ZbtnV/ZFTj3+JSmqq/F8ZocQ+6gYKFrS3Cm+WI1MYnGB9cnlg8f61DduIh
	QZLJbMH8=
X-Gm-Gg: AR+sD11Fv7aVDQw1miNcZzX6DCL0N44pmpp3efg0p4IfYCPKPHsxzf09IvlrIKPloEV
	jUse9OY4RvnPa5UWowbxW1KsqkV3q2d9/74RHLxncz3k4l61EZ0zYwWh1dqX0x/eZIAEQH5Az/N
	tE0u8UQVKjv9AOzrVIz/evKOMuDfa80ZtyujC0qMBvI18O08SY5hgROO1MQW+1N+AeJ+U9Yw3Y7
	tzxE7NYKr0VCP+H7RdBkl1W/4HMmZx/QlHPnfketWmKtpdN9DqskkcT0nWvPFDHe2Ljv9gNmO8W
	Cj/VvJUKIBfuyewsbsgPO7Huc4uf6oCCXc82/4zE6IXXrjFBCvJud9cxqXvV6nzSs2PZei5Ds96
	9UcUHdKbDcYMYCn0AXCeiD7911ZwNe1nQ5+Tlesyjs0QS5PiTBb/kbYoZMQrdYiW83LclaXIOVe
	VZJPzjmABcs82b2GfCOQvqQh+0zEGqfbk9TNcgtsJ7wo09YJZ/L8mYMIUq5SjBEdDpE88=
X-Received: by 2002:a05:600c:4f09:b0:496:bffb:fb7b with SMTP id 5b1f17b1804b1-499b8457b10mr73001775e9.10.1787306995641;
        Fri, 21 Aug 2026 03:09:55 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b90e7fdbsm22078175e9.6.2026.08.21.03.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 03:09:55 -0700 (PDT)
Message-ID: <6f2ed85c-cbda-4014-827c-272ea2206830@linaro.org>
Date: Fri, 21 Aug 2026 11:09:54 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] perf cs-etm: Turn on context packet timestamps
 in per-thread mode
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@arm.com>,
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-3-00c4fd0701b4@linaro.org>
 <20260821100151.6E3241F000E9@smtp.kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260821100151.6E3241F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/08/2026 11:01, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unconditionally enabling timestamps in per-thread mode breaks recording out-of-the-box on hardware without timestamp support (e.g., ETMv3 or ETMv4 without TRCIDR0.TSSIZE).
> --
> 
> --- Patch [3]: [PATCH v2 03/14] perf cs-etm: Turn on context packet timestamps in per-thread mode ---
> commit 23dc37429523715cdb26c5647b22b1a9dc0c89ab
> Author: James Clark <james.clark@linaro.org>
> 
> perf cs-etm: Turn on context packet timestamps in per-thread mode
> 
> This enables context packet timestamps in per-thread mode, replacing the
> previous unset default. It helps keep samples in order when supporting
> multiple per-thread mode threads.
> 
>> diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
>> index acfdb3f53821e..d0486a164a700 100644
>> --- a/tools/perf/arch/arm/util/cs-etm.c
>> +++ b/tools/perf/arch/arm/util/cs-etm.c
>> @@ -453,13 +453,22 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
> [ ... ]
>>   	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
>> +		/*
>> +		 * Timestamps are required to interleave samples from different
>> +		 * CPUs.
>> +		 */
>>   		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
>> +		/* Context IDs are required to associate trace to a process */
>>   		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
>> +	} else {
>> +		/*
>> +		 * Enable context packet timestamps only (no periodic
>> +		 * timestamps). Even in per-thread mode with a single process we
>> +		 * still need to correlate trace to a specific mmap around
>> +		 * execs, which can be done with just context packet timestamps.
>> +		 */
>> +		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", UINT64_MAX);
> 
> [Severity: Medium]
> Will unconditionally setting this timestamp break recording out-of-the-box on
> hardware without timestamp support, like ETMv3?
> 
> Looking at cs_etm_validate_timestamp(), if the timestamp config is set but
> unsupported, it aborts the trace:
> 
> tools/perf/arch/arm/util/cs-etm.c:cs_etm_validate_timestamp() {
>      if (!val)
>          return 0;
> 
>      if (cs_etm_get_version(cs_etm_pmu, cpu) == CS_ETMV3) {
>          pr_err("%s: timestamp not supported in ETMv3...\n");
>          return -EINVAL;
>      }
> }
> 
> Does this mean users running perf record --per-thread on such hardware will
> now get an error by default unless they explicitly pass timestamp=0?
> 

Yes but the behavior is the same in per-CPU mode so this isn't a new 
issue. It's easily worked around and nobody has ever complained.

>>   	}
>>   
>>   	/*
> 

