Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B226630E0EC
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774276; cv=none; b=T/i+YTqI2RjCwb2uOWFQSXjFQmhCCpsm5IiJFEh2m0mwXzFQk0gXIGDC+MLAZ4ygjNOvqRsHWfmX5n/OkcgHE1JXsr9ObGxyCfBfFBs/XGtIalmxDSZUrM9uSzZ09GKlR7yGbMI+ZJKCBsy3Fao4LyhtaXdOi/6xLJ+gsaCLszE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774276; c=relaxed/simple;
	bh=sr5994fVj3LmcmuVa204F0DDxmYVzCdQUVfMWM/pfVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/yarUwHUCqRHunW4wYvrH6fCgu1wOVp5fbP15CHP7S9wwlfwYyB3MZYko6rfKC9X3PFCA0sS/yi5CRYt+7fUR3aoyIHlwwB25G5sobkgwGGvCRNG/hy//61zZLkNIiK/O+jFJHsJ+etv1sbh817R1XgRV5DUQnXnuzpktuc6H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=DOjPKktO; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="DOjPKktO"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2F473C0058;
	Thu, 14 May 2026 17:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778774270; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=luTc1jPbKrLAttaHtHRCQz5wlDOcEctOC7CeEbdfUck=;
	b=DOjPKktOef8EZm1ROTJ39+hX2NhGZmTW8/NP+V23utTOv0wi9kwICrwnbu8nQR4wdTJaYg
	qFTeF+Lm9JuMhoaaw2k7KvwRuYQjEtAJHV98XAYXTvBbvAfEDr6b0OnIl9lhyVBElZtRG7
	XSZXD7TOxgIqwlVDnS5JPDNI0Y8AqtOoRPSQFOI88TGbSW0Kb99z0TqmNbrtS39coOhZ1h
	sUkPqKkl7m9X+ALmsTuRRh5EMdxRFiV/CgX7GA/G3WwvPxm0OEou0AwTxtomQbPPz0RNeB
	8wNdcn1CTAhFcjSgokMiSP9ppMBlVNKMQSQb4oA0GrTvUTu8kbKiPHUBY0kF5g==
Message-ID: <836dd44a-01c0-4baa-ba8c-68c87e48f6c0@cjdns.fr>
Date: Thu, 14 May 2026 17:57:46 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 2/5] clocksource/timer-econet-en751221: Move generic
 logic out of cevt_init
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260514000601.3430262-3-cjd@cjdns.fr>
 <20260514120600.0492CC2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260514120600.0492CC2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 14/05/2026 14:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The return value of `cpuhp_setup_state()` is ignored, masking critical initialization failures.
> - [High] The hardware clock is retrieved but never enabled before accessing memory-mapped registers.
> - [High] Missing teardown callback for CPU hotplug leaves per-CPU IRQs enabled and the timer running when CPUs go offline.
> --
>
> commit c97af74688377fb3c996bd3eeeee07ce5a52eb15
> Author: Caleb James DeLisle <cjd@cjdns.fr>
>
> clocksource/timer-econet-en751221: Move generic logic out of cevt_init
>
> This commit simplifies cevt_init by moving common generic logic out
> into a new cevt_setup_clockevent function. This change prepares the driver
> to support either a percpu IRQ or multiple IRQ numbers.
>
>> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
>> --- a/drivers/clocksource/timer-econet-en751221.c
>> +++ b/drivers/clocksource/timer-econet-en751221.c
> [ ... ]
>
>> @@ -203,6 +206,10 @@ static int __init timer_init(struct device_node *np)
>>   	if (ret < 0)
>>   		return ret;
>>   
> This isn't a regression introduced by this patch, but does the hardware clock
> retrieved via of_clk_get() earlier in timer_init() need to be enabled with
> clk_prepare_enable() before memory-mapped registers are accessed?
This clocksource never requires any prep, we just need to know what 
speed it's running at.
>> +	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>> +			  "clockevents/econet/timer:starting",
>> +			  cevt_init_cpu, NULL);
>> +
> Since cpuhp_setup_state() can fail and return a negative error code, should
> the return value be checked here?
>
> Also, because there is no teardown callback provided, does this leave per-CPU
> IRQs enabled and the timer running when a CPU goes offline?


On these SoCs, this is THE clocksource, so any failure is a no-boot. 
That said, I don't like the idea of leaving bad code that's Technically 
Isn't A Problem, so I'm gonna rework this a little and either gracefully 
teardown, or if that proves too complex - intentionally not teardown and 
leave a comment.


>
>>   	sched_clock_register(sched_clock_read, ECONET_BITS,
>>   			     econet_timer.freq_hz);
>>
