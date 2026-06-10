Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827343AD509
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781085104; cv=none; b=Sy8Ki4/69ZMCNHFwy4TfOnbopC2ZSfXMyr727WuivJJpuo4tP7Pe1cGD++Ph2dJmQnB3pTiGJlwGWgXl72geQL4W6dE5jv3od+mAH3w+5u54EcDKnAUJgVp0W5vfdcCJZRNTkzmDqHgZ1yVu6cqZFcZi9TO6zvxtyWOD0iFgP6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781085104; c=relaxed/simple;
	bh=lh1Ikphh71kLsaqo+RB9uN5BRFBkU6LXv8hYNM0ga1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTJLPhnQbjJyZIU5LqBwsyiPhu4HmpIMIiEOgi3Jejz/9PrbZxyIutA2/aGni1rh8OFc9ja/tx5dDTbJIxz9yDEjo98WWkfh7KJuHJBrXO5yCq0s4mU7JD70IKDJ6rasRPZK0r5Xa6Ok54LhrbEzxrIhbn1C4LhmxvyLNoXEy0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KnpzFVtK; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KnpzFVtK"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68b482888c3so10235787a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 02:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781085102; x=1781689902; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHbnGh+BqiBnA9Mcc53GSrSwcIKZVMjyTcPSIk+kGpc=;
        b=KnpzFVtKSeiSCchzwXxUwmCBFVi124YIrn1pD4xJSAqmQCYRqux0Lm+iXLr/ygOjJ1
         T6uBeZjWPnAnio87Wu1sudwSPrcZx617B/CoXRy4Kr1Zujn3PnA27a4wfzCB+M3345WP
         F1YVinPojDABtlPefScWE9B8PGlKNK46rxM3Rhj3vHAe2nX7gP37QGbI8sCTf4gDFdWA
         nphhUePTtsq2dJxRGObH/LIqE5jByNBxMlv1mNhOZWblT8a5BXabgN1AULqGFGkkaySr
         X/pdTcI4oUEpwDTx3sCh3MQcNoeSMQxI82PcKO6RieN2boKO9uuue22tOflxE/Rus87N
         pzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781085102; x=1781689902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHbnGh+BqiBnA9Mcc53GSrSwcIKZVMjyTcPSIk+kGpc=;
        b=f912OoMbfk7KdNZppa1OKoU0iO9tHczhoe9JN+9npJOcJNYdunt1zI1EISNf7wCoc1
         kgKEJpOpYY7BrdLkN5gXRqRES2vdhIIG1PNL58JHI6STgEwy4UPP1TsgIKHa/f3hPItC
         +74QkoatVzXcbIhPDhm/N87firSml/TIcDSMITAzwoSub3lIvzzfTnnmoPrKaPZFwDau
         WPpuQLa5M7p4UsJ4uCgchwkenUiG3ZeMHhWungK6J9esW1gKQDfQxU8lqLf7TmpKUdBa
         ofOx29rLPCK/tXhSA7iaPR6Yt9neIT3aZ00iRIKKJjl06OlSqSp4d/BWkS02RHTTat0w
         juWw==
X-Gm-Message-State: AOJu0YzR5ePo4P6bbq+TWItbJV7VldUVvARs55vd9/h7k0km86oy1v+H
	0sFpith6JQWWlWNB5xSoyRJZ/+z1a1jV+I24wEla17OYzNgEiaARJuKqxzK0tnA3aZ4nfp8TVJF
	3D8d3Q9k=
X-Gm-Gg: Acq92OGGKVYGyJeDv1TmbXW1NYmB78AgHWAHR3YBj2vicsIMi7G3faAjoflzxXoR9GE
	A4VvDzM3+ObavPlMMxtxSVfsEPTV/2SBKyVVEz6yQsMuUdnNvdgOiiMj3+yOsTDfP6ATTtHa6hO
	89yKKwAk7KRBbbbBEYRZZMUGkMsdOLx+Oc1IF7rGPI4rgRmvUnuQjxzicbfk0zZbvM3Hq9ctn7T
	gjF5bK+s8FiwW7qvUxA59dSveIACb84QOaiP6bvmzAut6M9qkmaaeeNr9wUnK6UC5G2GKzIptll
	HOrFx+IGfYoz3OSI18QQUanoon54DdVS0Z37ayWq3F2+2IQCf+vDGCRYnVlDEaBwUqm+VLIeImt
	zyNVd7S55dJzXc5X1FUfUG6tPPGAMT5oHQwGTbZ8rUooQsDpZOFHUplqL/e4UmmO/eYM1ijrUYD
	8FiDvyoiP+R45VXAuMiprYhBatgqbWq62OCnmcnSY=
X-Received: by 2002:a17:907:8d8e:b0:bed:15ff:5fe2 with SMTP id a640c23a62f3a-bf3a8c05094mr1004109666b.17.1781085101938;
        Wed, 10 Jun 2026 02:51:41 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051d86f75sm1162420366b.21.2026.06.10.02.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:51:41 -0700 (PDT)
Message-ID: <321352cd-8c6b-4ada-b9e0-f58aaa7e0984@linaro.org>
Date: Wed, 10 Jun 2026 10:51:40 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/19] perf test cs-etm: Test process attribution
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260609-james-cs-context-tracking-fix-v4-4-44f9fb9e5c42@linaro.org>
 <20260609144127.210E31F00893@smtp.kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260609144127.210E31F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/06/2026 3:41 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The test script hardcodes CPU 0 for recording and pinning, causing false test failures on systems where CPU 0 is offlined or lacks a CoreSight ETM.
> --
> 
> commit c50b8d82ea4d5dd7b4d85c01619bc432a03ea379
> Author: James Clark <james.clark@linaro.org>
> 
> perf test cs-etm: Test process attribution
> 
> This commit adds a test to verify that CoreSight context switch workload
> traces attribute symbols to the correct process when traced on a single CPU.
> 
>> diff --git a/tools/perf/tests/shell/coresight/context_switch_thread.sh b/tools/perf/tests/shell/coresight/context_switch_thread.sh
>> new file mode 100755
>> index 0000000000000..2b9c44b86c591
>> --- /dev/null
>> +++ b/tools/perf/tests/shell/coresight/context_switch_thread.sh
> [ ... ]
>> +cf="$tmpdir/ctl"
>> +af="$tmpdir/ack"
>> +mkfifo "$cf" "$af"
>> +
>> +# Pin to one CPU so the two threads alternate running but record into the same
>> +# trace buffer. Start disabled and use the control FIFO to only record the
>> +# workload and not startup.
>> +perf record -o "$tmpdir/data" -e cs_etm/timestamp=0/u -C 0 -D -1 --control fifo:"$cf","$af" -- \
>> +	taskset --cpu-list 0 perf test --record-ctl fifo:"$cf","$af" \
>> +	-w context_switch_loop > /dev/null 2>&1
> 
> [Severity: Medium]
> Will this test fail on systems where CPU 0 lacks a CoreSight ETM or is
> currently offlined?
> 
> On some ARM architectures, ETMs are not guaranteed to be present on all CPUs.
> Could we dynamically discover a CPU with an ETM via the sysfs event_source
> devices instead of hardcoding CPU 0 for the record and taskset commands?
> 
> [ ... ]
> 

Not worth the complexity. If it becomes a problem we can add it.

