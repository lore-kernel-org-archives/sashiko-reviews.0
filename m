Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA4247A0C4
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 12:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577176; cv=none; b=ZFOIaMmHmT+CmWWycbLm96mtZiRzIwXH0YMF0O1XXSe/ysWJC5dZ6SBaquSx47oAn0O0R6CFXALlMatOvCzy8PIZ+jX7frMrAPKiHXjB79lqOcJp9D101DwHJQG8j56V+sLhhklo9wFhsJC1BdrImWlUWSlsCE7DFXRNaSMjOJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577176; c=relaxed/simple;
	bh=LRtadUmB8iW5U3+lyUIKXngJGb8N4NhLMSSMPsBj5ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRXCTOhILibG/3SrcuzFQ51wX/mm8KAx4X6M2o6wHS6Ij5untfmwqKpAFvPNTVL8qB5JxB14I0slpzlACdWmi+kRHK9PwWrNgPVu0lINwd84goNk7vveATQKjJil0Zwk5wujzitRZb84lvZjMFlQxSeEjJNy4hHEIeCGLY/MSSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AwnLJKSw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AwnLJKSw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b3e03939so5772035e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 05:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780577174; x=1781181974; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y8L6wxZtCAQTGBF5p67+Z/vLXWJAdDinu+/qJ39j5po=;
        b=AwnLJKSwhGhkd0qbu++qUBFuwe+AQn0twgDlSGg2rKx3MSSDnIkE9095se5Fxeresu
         UK3r6TbqS2/zUbEiScYyHzJAD0JjDz5wHjglGNdo08P+sbBxYITkHKdKh5mGpVPxPOFk
         Sy7uHqbEyQ1QbBgFn+Dz7md2Q55NU3Z+pDm8Hgl4Kq+V20Ae74ccLlqtlcZiWdQUExEG
         i4EhKVPX0pr8DzNNE1xTZVvX8YQg5T9omz9Zc3I7wldf2mQPGRNSS98x0TYLUjVEqNv6
         q7udWI8kk8YnCEkkXiwvGo2oklq3KHAAKMGAyIvV9wlEKy15PqwP7nJFnR5WDUacl7BN
         A28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577174; x=1781181974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8L6wxZtCAQTGBF5p67+Z/vLXWJAdDinu+/qJ39j5po=;
        b=KWs2fE3pAb9AYbvcHhLDcbxjsmMqbO4EThVjK/gK7jijZJUhmKW3Z57taxqf5Yo+ey
         7NZ/cCeB2OV+mKSN6alzd+qjQKvSzHPRSobgwRSYoPSyjfk/HEKRZhXBdhPwz9IJfvFS
         PMDz3Gx0enKUqxBZlSEAWviEZXtZsZbU37UMDGoEVIItPLLksLG05s9a6zk5b5NfPYY3
         si6ppDurMa18aSVPnckkQlZwnc3WUBIvnvuWNhYra/7X475RZlFWigR/3dRPvEY8e5Xt
         OlQHLga2Dfpmm35Zlty5cuUWUDLlrw5iyp6xwl52fkI236XFlLFs9VQBgX3NzSiyN7W+
         /mhQ==
X-Gm-Message-State: AOJu0YwRvcGYQs/d43Ji6W3Yh01RIYpR9g+K1lO8C1Rj0pu6R7/Aza1g
	A6QBinS73PnuoxI2ws/yqClkDqIGPjnBqlVS7xsvA92YOgiWCOxS1jJdd+O6D512jGWvHyrfgfL
	N56Y4mkQ=
X-Gm-Gg: Acq92OH/Xuh4D0TdatMyxvjDAZVGa7mNhqC7CNtYnzR6WrMxkTRkXqHxnk9E0foVOl3
	HI69eOfBYewxbGCSwjqE1srXeg35ZwKzopkUowa+Va2IQCcxVIv2JW3svxF1fYdTRENNgbUTzJL
	px6rXyzyxjSW5BSoJeLxLIPQowR2R2iMxF1hDmT6/IeCxg85lGXuVyOvZO0bHi49pormRT3J3yt
	NtozjYTZf/uTR76i+9/EcYLUgnp4TMJwt6eoR7bbhKc8G+UmOcgeqpuC5L2WA4Qg79VASLzjY1W
	Ii0ek7ZmnEz24GqrOTJwYeDXd+EwNy8Ib1tvK44mrMSOv5XeADCAEd3t8U3aLk3G0L4mTpOZRHD
	4VZj6DflRz9JZ711GrdUka9uFvyjLMPUzzd/wRcpQEVaBDDQ2cS2mgyrBRg+oHAsKBMXgakqAEo
	GJi+MW9uol+er6Bl1Fjpz4b9u9I3ZUshxIdW9hSe8=
X-Received: by 2002:a05:600c:8b76:b0:490:9dc3:3483 with SMTP id 5b1f17b1804b1-490bc4b5734mr50395435e9.2.1780577173383;
        Thu, 04 Jun 2026 05:46:13 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm72731835e9.1.2026.06.04.05.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:46:12 -0700 (PDT)
Message-ID: <5889c018-8bbb-40e1-a0b4-5e9f024d27b6@linaro.org>
Date: Thu, 4 Jun 2026 13:46:12 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/19] perf test cs-etm: Remove unused Coresight
 workloads
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260603-james-cs-context-tracking-fix-v3-15-c392945d9ed5@linaro.org>
 <20260603104130.4C65A1F00893@smtp.kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603104130.4C65A1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2026 11:41 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The function `cs_etm__synth_instruction_sample` takes a `packet` argument but ignores it in favor of `tidq->packet` for critical fields, leading to incorrect instruction synthesis.
> - [Medium] Incorrect validation of the double pointer `thread` in `cs_etm__etmq_update_thread` breaks the fallback logic and creates a potential segmentation fault hazard.
> --
> 
> commit b1b29e2b51869a73781c3576698bb30e8e7b0cb9
> Author: James Clark <james.clark@linaro.org>
> 
> perf test cs-etm: Remove unused Coresight workloads
> 
> This commit removes unused CoreSight workloads from the perf tests. These
> workloads had issues with out-of-source builds and slow compilation times.
> 
>> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
>> index 40c6ddfa8c8d9..ce570913669c1 100644
>> --- a/tools/perf/util/cs-etm.c
>> +++ b/tools/perf/util/cs-etm.c
>> @@ -1490,34 +1508,51 @@ cs_etm__get_trace(struct cs_etm_queue *etmq)
> [ ... ]
>> +/*
>> + * Convert a raw thread number to a thread struct and assign it to **thread.
>> + */
>> +static int cs_etm__etmq_update_thread(struct cs_etm_queue *etmq,
>> +				      ocsd_ex_level el, pid_t tid,
>> +				      struct thread **thread)
>>   {
>>   	struct machine *machine = cs_etm__get_machine(etmq, el);
>>   
>> +	if (!machine || !*thread)
>> +		return -EINVAL;
> 
> [Severity: Medium]
> Will this early return prevent the fallback logic from executing?
> 
> If *thread is initially NULL (e.g. from an allocation failure), this check
> returns -EINVAL immediately instead of reaching the fallback assignment
> *thread = machine__idle_thread(machine) at the bottom of the function.
> Additionally, checking !*thread before checking if the pointer thread
> itself is valid could lead to a segmentation fault if thread is NULL. Should
> this verify !thread instead, or should the !*thread check be removed to
> allow the idle thread fallback?
> 

Thread can't ever be NULL. It starts as the idle thread and is only 
swapped to a real threads or the idle thread again.

>> +
>>   	if (tid != -1) {
>> -		thread__zput(tidq->thread);
>> -		tidq->thread = machine__find_thread(machine, -1, tid);
>> +		thread__zput(*thread);
>> +		*thread = machine__find_thread(machine, -1, tid);
>>   	}
>>   
>>   	/* Couldn't find a known thread */
>> -	if (!tidq->thread)
>> -		tidq->thread = machine__idle_thread(machine);
>> +	if (!*thread)
>> +		*thread = machine__idle_thread(machine);
>>   
>> -	tidq->el = el;
>> +	return 0;
>>   }
> [ ... ]
>> @@ -1579,6 +1614,7 @@ static inline u64 cs_etm__resolve_sample_time(struct cs_etm_queue *etmq,
>>   
>>   static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
>>   					    struct cs_etm_traceid_queue *tidq,
>> +					    struct cs_etm_packet *packet,
>>   					    u64 addr, u64 period)
>>   {
>>   	int ret = 0;
> [ ... ]
>>   	sample.flags = tidq->prev_packet->flags;
>>   	sample.cpumode = event->sample.header.misc;
>>   
>> -	cs_etm__copy_insn(etmq, tidq->trace_chan_id, tidq->packet, &sample);
>> +	cs_etm__copy_insn(etmq, tidq, tidq->packet, &sample);
> 
> [Severity: High]
> Is the correct packet being used for instruction synthesis here?
> 
> The function signature was updated to take a struct cs_etm_packet *packet
> argument, but this line explicitly references tidq->packet instead of the
> passed packet. Since callers like cs_etm__flush() and cs_etm__end_block()
> pass tidq->prev_packet as the argument, referencing tidq->packet here will
> use stale or incorrect packet data, potentially corrupting synthesized trace
> data.
> 

Will fix.

>>   
>>   	if (etm->synth_opts.last_branch)
>>   		sample.branch_stack = tidq->last_branch;
> 

