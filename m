Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBDE37DAA8
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780479479; cv=none; b=Z5sCpETViA0FAsQDToeTv53Bmk/L+5YkWd78PHn+7F7PJSN8x3jceV5I2XPJgFSkgGWiK8bwskyANJyXqVDakEP2LUGj8UItwpwKuC0ruFENzP9fH0KeUSu0GuHuoe7rgiv/IiYX/SgE8mMk4go3HDJYMn3A0nhn3rWf4cwSQxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780479479; c=relaxed/simple;
	bh=Np8CcBZEhxg2O4ydf7MKMA0wb/gJykr9B13bJRf7pck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBPa/0jtA4lJKUGEP2apEHTrSiYjAg9OmKmuCIhCrjBhpFghcXHDIJImZGgxqS/Bmd9JQ9BrNd/i699A5PQz1AGhw9TZg+gM3RCvEdMxBAJvkY/qS5tpH460DKiGwzIGSDaw8OsRgMcRzcnA+5EOBQy0TbNO4medR2RFeOjLGMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UTlXkGpA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UTlXkGpA"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso15905245e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 02:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780479476; x=1781084276; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OPpoGYNnw0et0ze4rIG/H+2lI0/pnXo68Q/0mJto/k4=;
        b=UTlXkGpAIhgxy8T+P/24tjKAXMOyZusaLl9mUXIAZXw7DL3VdN1ExLJzMXM8ZGilGX
         lwrS/Ps73kjhw6Q0aYwt+UIsfp70zjJor6/oIKdPNn+Jp6I5P9GB2Ee/t2uESVaImVM3
         D10ZnsblEHz6Mt7Kifq46xUL3Frrj/eb/pM7YoXQRxLgjrbnC+zlqYCf1bf9UPB+8rI4
         WlhMLskXO8y0NhNiVCbpKD99goJ7x7zy63LNNJa/xm7qdUozAzt+pEgEdKDfVURhoiuZ
         GtY+ccqqz2Lj5wCAWGdGhSYTfNBP7ziIXVvV5Z4YwMaoUnqU2YXjk89L/BWEUnBo+Cqt
         EbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780479476; x=1781084276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPpoGYNnw0et0ze4rIG/H+2lI0/pnXo68Q/0mJto/k4=;
        b=ghbTV1cKVV/AA5MJe9Q8jDrdqEZwbKlVa4TZNHqE6wZ6qnUfJe6ERyyEueJUuOkCVZ
         eZknR6AGqqEBtP7h8cIm9nUwy39RfhtsW2hxkgho4KVLMTLjlqYTC2tJg4nUlnElJMqx
         P1Sg8Ek4G066FCJeWWY+POUYoB0vCc+ky90uD68mBzirjZe8HFCdgtreDqG3cwEbnCmU
         VFFjJ1l+DQZTmWj5mTYVvak1nbeJXQ35e7D7ueFETrq88ZZATbG9k7Ty+pUGDpFBFJ2g
         K70xoYpst53WUzNIRxx7Us7fK5o2XRrQxBmW4T641XgnLJcqMRVmC3wbEtFiy+TCIgaO
         wKsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8POKSXNp1pISr8B1a0cT5M5YlXFh/COTmR7kNgaewm1HzTNpkDdPXBYvF7loiegEum4xtGaSiWtN3X0MuqOrM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfivzRllGu3lGo1WCQGPJfiTSrqfrON/fuNatqLkJCMX1Dgf2I
	HQ4Fg47yPTg/F7OvyP2Trmg4dHnlBplefCyNZKJ8c24g0HSgAldyINVj0sVa8huwnfI=
X-Gm-Gg: Acq92OECu1ABgPNEYWcNkyIVzHo2GbBXtvf1Ds6+95sfWX2sQe++9pZrbP0QU/Uha0m
	W/jLqq30sF8kBNscF1jsl2sgRPfvqL82KfjhJfG1f7GESz8yg1d153jzawQ3dy42dOA45kkebn3
	IICSEknyNdENrO1hndExVJwLzT7sAq3pbUrwGoHSSspuxRsNbbOEBaCt7NANk5p7wSwKr/pM66r
	G5EGjp3hkfIHiNuO1lRgvuXGUXaZeEENO+xgHVYakO2+i09/jWkT48xW9aBd751d+t7UC6WfIW9
	wQyoxUkvJXnTaoy36T5fyDxgy5JnFibjvhSH8HW83CmKKQi7gqDgg0ZhkpVnmOVU8We/EjCAHoc
	TnHbI+ue0SQR3LzoISwfoMi7QCWMYspfCPDEz7ap7RUD7lPx9Z89wse1ur5EwtDIml/HKM9Qg1n
	yIi5ESaP6uBr4bjtmf0DIZdu4fPEy3CGXKgm8KaAI=
X-Received: by 2002:a05:600c:c4b8:b0:490:b189:212d with SMTP id 5b1f17b1804b1-490b60e41dbmr40643465e9.33.1780479475988;
        Wed, 03 Jun 2026 02:37:55 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm87868605e9.3.2026.06.03.02.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 02:37:55 -0700 (PDT)
Message-ID: <d0f5c130-91a3-4785-8509-81aa54b6ca87@linaro.org>
Date: Wed, 3 Jun 2026 10:37:54 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/18] perf cs-etm: Queue context packets for frontend
To: Leo Yan <leo.yan@arm.com>
Cc: linux-perf-users@vger.kernel.org, sashiko-reviews@lists.linux.dev
References: <20260602-james-cs-context-tracking-fix-v2-1-85b5ce6f55c6@linaro.org>
 <20260602144329.A5DFA1F00898@smtp.kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260602144329.A5DFA1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/06/2026 3:43 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incorrect CPU mode attribution in `cs_etm__synth_instruction_sample()` during flush due to relying on `tidq->packet->el` instead of the exception level belonging to the instructions being sampled.
> --
> 
> commit b9c32b9ed06ee8adb88b0b63943c694b4108e629
> Author: James Clark <james.clark@linaro.org>
> 
> perf cs-etm: Queue context packets for frontend
> 
> This commit adds a CS_ETM_CONTEXT packet to carry thread ID and exception
> level to the frontend. It separates memory access functions between frontend
> and decoder, and removes prev_packet_thread tracking.
> 
> Closes: https://lore.kernel.org/linux-perf-users/20260515021135.1729028-1-aaupov@meta.com/
> 
>> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
>> index 40c6ddfa8c8d9..524e2a6feba8e 100644
>> --- a/tools/perf/util/cs-etm.c
>> +++ b/tools/perf/util/cs-etm.c
> 
> [ ... ]
> 
>> @@ -1588,15 +1632,15 @@ static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
>>   
>>   	perf_sample__init(&sample, /*all=*/true);
>>   	event->sample.header.type = PERF_RECORD_SAMPLE;
>> -	event->sample.header.misc = cs_etm__cpu_mode(etmq, addr, tidq->el);
>> +	event->sample.header.misc = cs_etm__cpu_mode(etmq, addr, tidq->packet->el);
> 
> [Severity: Medium]
> Does this misattribute guest traces to the host when synthesizing samples
> during a flush?
> 
> When cs_etm__flush() or cs_etm__end_block() calls
> cs_etm__synth_instruction_sample(), it generates samples for the execution
> range of tidq->prev_packet. In these scenarios, tidq->packet holds a
> CS_ETM_DISCONTINUITY packet (or a stale packet) where the exception level
> is ocsd_EL_unknown.
> 
> Passing this unknown EL into cs_etm__cpu_mode() causes guest trace execution
> from before the discontinuity to be misattributed to the host machine
> (PERF_RECORD_MISC_KERNEL or PERF_RECORD_MISC_USER) in the profile statistics.
> 

Will add a packet argument to cs_etm__synth_instruction_sample() as it's 
used with both previous and current packets. Similar to the memory 
access callback.

The only strange thing this leaves is flags always uses the previous packet:

   sample.flags = tidq->prev_packet->flags;

This makes sense for cs_etm__synth_branch_sample() but maybe not for 
cs_etm__synth_instruction_sample() but it's a bit hard to tell.
cs_etm__set_sample_flags() seems to assign to both prev and current for 
different reasons and it's impossible to understand.

This isn't a new issue introduced by these changes, so I'll leave it for 
the full re-write to fix or clarify.


>>   	event->sample.header.size = sizeof(struct perf_event_header);
>>   
>>   	/* Set time field based on etm auxtrace config. */
>>   	sample.time = cs_etm__resolve_sample_time(etmq, tidq);
>>   
>>   	sample.ip = addr;
>> -	sample.pid = thread__pid(tidq->thread);
>> -	sample.tid = thread__tid(tidq->thread);
> 
> [ ... ]
> 

