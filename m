Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4B33B83FB
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051510; cv=none; b=Q8jxTkqCueSLvSCMPLq/c1Vom6PdLZgAFt8PcN8RYvwsIGNRaciqHQYyOmaraPgbKz3Fb0nPNv/DKD5/ErmJ++bpEuTIemhAAN6OOVdlAAyOAGQgzSUq4t+PQTMP5cqEaT0qY0SCSGXdpR12irKq43lrRtgV7TZleon7x8pzMPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051510; c=relaxed/simple;
	bh=q55Pjcfb2A1CxLtDZiG6QmMCJacAXgOldx4XPKN2Vm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEfXcigSDB2++xuy44tH2ZqBcXSxuZvnPLiDQK8GSuBrUtSgkysfWqhIkKTK4oSTWUlC7DHYtcX/+rpT4zUe/XijvHP/T293KYaIdDRP13QYGwzS/I/IjMvP3hPciNau7ItRHD0HQcv7Yits8nvE2dpMvQ7INqmRIlCfucN6i50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=EsKqCMVt; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="EsKqCMVt"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E75944C5406;
	Fri, 29 May 2026 12:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1780051504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=NShxFgkqhFlPX3eSj7GlXncQnVCS3gHIKneKdTli3fc=;
	b=EsKqCMVtNckAwU+RvMPeIaLTlCjD+rRXCqlK4B2ZA9f92jpK7U927vSRFCmE1XhifVuOGH
	dnDSCBppv2VLqR+8qnY+AyySLSgUfK80nm8zX5GT9LllO2a2Z2W9BKnn5J/mKPolWKRodq
	/gCeMTzT2jX/cnSrzAjJqGR7Xn/T+Ws9EAds+Dbl8L011E74OzoIXNB0nih6HblieFPDlt
	p6gLiFY0uql5B4dgoWa63dBnmSWU/2B74driHVT6by6dW7/BFwGVg7eLflB/ygJKYrRwaM
	jPvdUs2AFAa5IiCjHx4YU7nN9I5VrJuw1lkxbSccYdjy9B5rZD4WkQtGtNo0zw==
Message-ID: <cd226f30-88ea-4ddd-abb3-7ef3a24f363e@cjdns.fr>
Date: Fri, 29 May 2026 12:45:02 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v6 5/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260528140046.2897674-6-cjd@cjdns.fr>
 <20260528164158.CDE151F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260528164158.CDE151F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 28/05/2026 18:41, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The interrupt handler incorrectly relies on `this_cpu_ptr` for standard IRQs, causing an interrupt storm if the IRQ executes on a different CPU.
This should not be a real issue because cevt_init_cpu() calls 
irq_force_affinity() and on error the IRQ is never enabled. It could be 
nice to create a dev_id which is used for both percpu and 
IRQ-number-per-timer modes, but that's a more invasive changeset. Using 
the CPU number is how it worked previously.
> - [Medium] Missing CPU hotplug teardown callback causes an unbalanced `enable_irq()` kernel warning when a CPU is offlined and then onlined again.

These EcoNet devices don't support CPU hotplug and I don't see a 
realistic chance that they ever will. Vendor code does not support it so 
there's no clear path to how it would be done. So I think this is a 
theoretical issue and cluttering the code for it would be net-negative.


Thanks,

Caleb


> --
>
> commit 0de42286a034bc944e765e97434f913831bc2960
> Author: Caleb James DeLisle <cjd@cjdns.fr>
> Subject: clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ
>
> This commit adds support for the EN751627 timer, which uses a different
> interrupt number for each CPU timer instead of a single percpu interrupt.
>
>> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
>> index f2c4c1ee0a56b..040386ded132a 100644
>> --- a/drivers/clocksource/timer-econet-en751221.c
>> +++ b/drivers/clocksource/timer-econet-en751221.c
>> @@ -110,7 +131,10 @@ static int cevt_init_cpu(uint cpu)
>>   	clockevents_config_and_register(cd, econet_timer.freq_hz,
>>   					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
>>   
>> -	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
>> +	if (econet_timer.is_percpu)
>> +		enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
>> +	else
>> +		enable_irq(cd->irq);
> [Severity: Medium]
> Will this cause an unbalanced enable_irq() warning if a CPU is offlined
> and onlined again?
>
> The driver registers a dynamic CPU hotplug state via cpuhp_setup_state()
> with cevt_init_cpu() as the starting callback, but passes NULL for the
> teardown callback.
>
> Because there is no teardown callback to call disable_irq() when a CPU is
> offlined, the IRQ descriptor's enable depth remains 0. When the CPU is
> brought back online, cevt_init_cpu() will execute again and call
> enable_irq() a second time.
>
> While this missing teardown existed before this patch, it was hidden
> because enable_percpu_irq() does not track descriptor depth. The warning
> appears to be newly exposed by the introduction of enable_irq().
>
> [ ... ]
>
>> @@ -173,22 +230,32 @@ static int __init timer_init(struct device_node *np)
> [ ... ]
>
>> +	for (i = 0; i < num_irqs; i++) {
>> +		irq_set_status_flags(econet_timer.irqs[i], IRQ_NOAUTOEN);
>> +
>> +		if (econet_timer.is_percpu)
>> +			ret = request_percpu_irq(econet_timer.irqs[i],
>> +						 cevt_interrupt, np->name,
>> +						 &econet_timer_pcpu);
>> +		else
>> +			ret = request_irq(econet_timer.irqs[i], cevt_interrupt,
>> +					  IRQF_TIMER | IRQF_NOBALANCING,
>> +					  np->name, NULL);
> [Severity: High]
> Could passing NULL for dev_id lead to an interrupt storm if the IRQ
> executes on a different CPU?
>
> For standard (non-percpu) IRQs, cevt_interrupt() currently calculates the
> timer device using this_cpu_ptr(). If the interrupt fires on a different
> CPU (e.g., due to CPU hotplug migrating the IRQ, or a spurious interrupt),
> this_cpu_ptr() will return the timer for the currently executing CPU, not
> the CPU for which the interrupt was intended.
>
> The handler would then check the wrong CPU's status, find it not pending,
> and return IRQ_NONE. The actual pending interrupt would be left
> unacknowledged.
>
> Would it be better to pass the specific CPU's timer pointer as dev_id here
> and update cevt_interrupt() to use it instead of this_cpu_ptr()?
>
