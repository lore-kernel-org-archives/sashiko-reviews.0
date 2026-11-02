Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660657;
	b=lR0b+R+gUI1NxasjO8kXWCmEuWEVzMUit6vz5pFce77dZuXM8ogcJ3C6NowDSwkN09OV
	 e/t0njZE6vB2Aj0wwBb5i2aAA6KowNVEqhV9pB9uNAJRksQL54LWC3uXHNDRXguOKJKK3
	 SJ5JDUQ8WesOURqx36lu7FVZE1h+Jxa6uAjR02T4YUJkA/Q6UNmxBA+BF+RGW+00eQ2AG
	 ngmRXnI2ULcehVjIFmxzyDu/xcQYIPAjUSXqWiwqTTkqhs1PgTJmAXM1oHOzvUfgaSpPU
	 fY7dCBwOTkzrwv/9J0TZOLIlnoDsd2ZyQ8doyPiUBVK4g0NS7/ZkHhuBpbKM095HOYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Content-Type;
	bh=Stvtmahd5i/3uuqc3lii8Wy4EZnXVDq1RllK7RSbpKw=;
	b=Pm740jzL+8YbeeyH0YM2sW5gtSFSBJp16VRXPdVQ9U66ibuk+Rt+GWSBxegJXTX44f05
	 opnIv8QMaakn7nHdWplLDqPfyzJRDg1KfNcSoF1Y3II2UZ7W8S7ECgDIcz+RscBpNzkju
	 qrPKEL346rRwfyNDXsXNhAOTny5eQZS1zDjhPYzpJ4M8qEJRRjOUXvBKhs8+mopJrz3QA
	 1fvlbVQYq3xqoKdtb8jIXVJRXEPNh8AsKTro0Ur3v4kJxanwGkwWEUyrZXWfDlLl5QeTM
	 L8fzND5TL8A3E9epRhAcrK4ZcCYPu3Z8/9bLPGI5xLFjGzQXAWrydS1pgwHcd0ayDeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XfWrfrov;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D36606A327
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 23:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D36606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XfWrfrov
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35c76e9614aso4979772eec.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 15:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793660656; x=1794265456; darn=lists.linux.dev;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Stvtmahd5i/3uuqc3lii8Wy4EZnXVDq1RllK7RSbpKw=;
        b=XfWrfrovDrz8c3qmYY8zLZarGhT1G/ey4VMbuwdjuyUlW+H0utoZP5AfnhSOkmAslU
         PT1n+0Td5/j9rLSxItrPJX3UUEOzn4Aht2dfg4/s/+dJ9/4Q5BZFCy2brJE9uivhcnk2
         Iv8i2UEsuHAw8UYJAhJDXAwcpuQtQpMqHq+dfRM7YeSqxBCz005N20VuXsHG1xYaaEtD
         oP8mn0yTAKSH/h48iN3dQMAN4kF6l8Nt0tzvIlczbZt3ruYGpjApdaW2zq6dwoo0H5VT
         5bAaZUBsufnWjZxWvIuO8q9y2bKDnzEa7eAeCAhtdKdOtkS4ZyzZGbShr+lQXhShG1xV
         C2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660656; x=1794265456;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Stvtmahd5i/3uuqc3lii8Wy4EZnXVDq1RllK7RSbpKw=;
        b=S6nhys/g14bRLta2ix0ksTwe1TeQ0Qr7nANKrV+e5yHgVCt+2UXuM82Rk1raeMnjt2
         f+hsVORhXXKYbpo1NYFJaxULvXrhEu/aWjWwlenh3Y5VxUKklOaTkjM7oNtO1qei8uog
         CxUWX/pDuTgu2rMaok9RqIQ0NfUJsYUIYhSiKPse6WKe+CfTafh9De2WDDFjYq+54bXD
         qKyR4xMkvHO835mSyhdOLWNm+YIeHmHqhhoCxDWkVBcKy0jpBM7N+fGlGC+/gDkaiUvk
         hIWjlHCt6j0LMUfWErprBfDl6QP/CLm36e0+qO5GuPe7w41KjfN5OK88JX80+ku8SWmY
         SRZA==
X-Gm-Message-State: APuU4Z8xmN7LMn2phmPGnJ0dTShgiln+87goy9oK/m9Vs4p+29DlPrHC
	HAiStvlMZBJv2subl3NimttKpYR/LH7oaogcSrJm64mRd3hPTonqihzI14/abJ21og==
X-Gm-Gg: AYBFou1avD/3GvhCMJJVq7wagx4/ZVfViftxcTz33QVTbEvJMOyjaqsOoT/TdC3Qx4+
	P3QtwiQKJqXuagb+4CuQGMC4PmQSrRn/DPtlmkWr3eUD0t6alCX0SDFHlow6zAnhg95v8rBBKal
	OKmlI09NuTenbyGbkNuOKSPtEQmuHUjTUEeb5vouM6pJpuzDbHTX4Kl0goxK/GFAF6qCml9EEb0
	UmqhePFois5P7bKn0rmXN78dXfAYganwmcg+h73AZB/lxl1OSkJFPc5xpqg23XG9Sz4PywcrV5a
	mSXLtgAFFr6JN2u+ZK774CX0TFDZpuprEiOz4v6TmhbUGE4Ng75geiJuwd97YIhJg8YkX5LyQpR
	wCS6NdY8YQ4zY9dAi5VHpNLTUuzQjfArupdK19OEOOxYxK6FJle6NtkFtsZgw/s4yNXNX0XeUMl
	+a9A6F+0gx1MHtuKyleW8aCp9GvLCupNQbpVvLiUGQcJVcqlSiMDsYQNIz2J98PQdQK5yiUZuJ6
	58rLUykDkwkb5XIngK9JvpyBO/NK4JrD3+mC69dFU8le61amEIdHIHZTDsJJ+Y0tvfxidOmBzVR
	0jaxzweR5dvr4JJM3K2NjNHrHe064p9iYmdnxQ==
X-Received: by 2002:a05:7301:7e14:b0:367:363f:6fe4 with SMTP id 5a478bee46e88-36a423f6947mr15717078eec.32.1793660655437;
        Mon, 02 Nov 2026 15:04:15 -0800 (PST)
Received: from bsegall27.localhost ([98.45.141.147])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm48932559eec.26.2026.11.02.15.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:04:14 -0800 (PST)
From: Benjamin Segall <bsegall@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf: skew perf_mux_hrtimer_handler firing across cpus
In-Reply-To: <sashiko-outbox-190118@kernel.org> (sashiko-bot@kernel.org's
	message of "Thu, 29 Oct 2026 23:42:33 +0000")
References: <xm265wykhyrv.fsf@google.com> <sashiko-outbox-190118@kernel.org>
Date: Mon, 02 Nov 2026 15:04:13 -0800
Message-ID: <xm26wlquhm36.fsf@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] perf: data race on cpc->hrtimer_interval in perf_mux_hrtimer_handler()
> --
>
> commit 21db2df032d9ff638545ff8ead07c480ea100710
> Author: Benjamin Segall <bsegall@google.com>
>
> perf: skew perf_mux_hrtimer_handler firing across cpus
>
> This commit adds a per-CPU skew offset to perf_mux_hrtimer_handler() when
> the mux hrtimer interval changes so that timers across CPUs do not fire at
> the same time and contend on jiffies_lock in nohz_full configurations.
>
>> diff --git a/kernel/events/core.c b/kernel/events/core.c
>> index a6c8e38a31104..80d142986eba7 100644
>> --- a/kernel/events/core.c
>> +++ b/kernel/events/core.c
>> @@ -1279,6 +1279,7 @@ static enum hrtimer_restart perf_mux_hrtimer_handler(struct hrtimer *hr)
>>  {
>>  	struct perf_cpu_pmu_context *cpc;
>>  	bool rotations;
>> +	u64 offset;
>>  
>>  	lockdep_assert_irqs_disabled();
>>  
>> @@ -1286,6 +1287,17 @@ static enum hrtimer_restart perf_mux_hrtimer_handler(struct hrtimer *hr)
>>  	rotations = perf_rotate_context(cpc);
>>  
>>  	raw_spin_lock(&cpc->hrtimer_lock);
>> +	if (cpc->hrtimer_old_interval != cpc->hrtimer_interval) {
>> +		/*
>> +		 * Skew the timer to avoid contention on jiffies_lock in
>> +		 * nohz_full, whenever we change interval
>> +		 */
>> +		offset = cpc->hrtimer_interval;
>> +		do_div(offset, num_possible_cpus());
>> +		offset *= smp_processor_id(); /* we are PINNED_HARD */
>> +		hrtimer_set_expires(hr, offset);
>> +		cpc->hrtimer_old_interval = cpc->hrtimer_interval;
>> +	}
>>  	if (rotations)
>>  		hrtimer_forward_now(hr, cpc->hrtimer_interval);
>
> [Severity: Medium]
> Can a concurrent update to cpc->hrtimer_interval from
> perf_event_mux_interval_ms_store() race with perf_mux_hrtimer_handler() and
> leave the timer with a mismatched skew offset?
>
> In kernel/events/core.c, perf_event_mux_interval_ms_store() updates
> cpc->hrtimer_interval across all online CPUs from the sysfs writer CPU
> without holding cpc->hrtimer_lock or using WRITE_ONCE():
>
> 	for_each_online_cpu(cpu) {
> 		struct perf_cpu_pmu_context *cpc;
> 		cpc = *per_cpu_ptr(pmu->cpu_pmu_context, cpu);
> 		cpc->hrtimer_interval = ns_to_ktime(NSEC_PER_MSEC * timer);
>
> 		cpu_function_call(cpu, perf_mux_hrtimer_restart_ipi, cpc);
> 	}
>
> Meanwhile, perf_mux_hrtimer_handler() reads cpc->hrtimer_interval multiple
> times without READ_ONCE() or caching it in a local variable. Between reading
> cpc->hrtimer_interval into offset and storing cpc->hrtimer_interval into
> cpc->hrtimer_old_interval, calls such as do_div() and smp_processor_id()
> (which calls debug_smp_processor_id() out-of-line when preemption debugging
> is enabled) allow the compiler to reload cpc->hrtimer_interval from memory.
>
> If perf_event_mux_interval_ms_store() modifies cpc->hrtimer_interval in that
> window, offset can be computed from the previous interval while
> cpc->hrtimer_old_interval records the newly written interval, preventing
> subsequent timer callbacks from recomputing the skew for the new interval
> (and potentially tearing the 64-bit ktime_t load on 32-bit architectures).
>
> Should cpc->hrtimer_interval be accessed with WRITE_ONCE() and read once
> into a local variable via READ_ONCE() (or updated under cpc->hrtimer_lock)?

This is correct but a pre-existing race between updates and all the
readers. I don't know how much we care since as I understand it, it's
root config changes hitting a race with the readers, but it's easy
enough so I'll send a separate patch for it.
