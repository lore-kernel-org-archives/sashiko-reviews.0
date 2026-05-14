Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D623B840F
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 20:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778790770; cv=none; b=u8ACSjM6r1CaKV8nFxzQEQcnrWCOqf+kjH0YHYlocgGdGJqcL+FqLof4i3GMg8kCwDWVQEjgogWZg8VC0rOoZybCh4A3OGoi5tMH7UVa3NkKlPm/1ps67jUW8nntz/EgYPqUnTOEJVAFFR9nPGKekau87jG2IsfZOSdb7xTiNMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778790770; c=relaxed/simple;
	bh=BIS+z9ImuxkzSNdjiSLS9/iIpa5p+yZQT1eTWQobi64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mg/szXMQKkP9ArjN5JBAePdy5PqOieOPKXJ6jkswnR/qCjtP7mhymZGT+VhcNbYbEIhYJkn/Tc93fgZ7nxDjQQEngVnNIAsuzetBM8YlvKJvkgxhhn+gUmPQSIBcu/+uVFLM/U2pcFy8kqyOoft+0h0RXTDab5brhvjfa7JrqFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=f0Q3xFpC; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="f0Q3xFpC"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6A733C4F5E;
	Thu, 14 May 2026 22:32:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778790765; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=pULZ85QUZYUodhdsIKipH6Dxfe+iLBqcbN7tmCAqB3U=;
	b=f0Q3xFpC7v81j9mZjtMlHylOlmWYp451y8RT7ZoR0XTy/I+xRLx+W7MO7D/0vJguYcSbhz
	ewH24wo1oEkQTo46wCLvvQg4GnhHENsdj7oWTVuoydRxyzLXxGXAbd2TrAiQTqu/Zjjs11
	EDvgedtWLt/IT4cLzhAmhrCsZ8s7/jAe3yfPQ5ZyZeyqf5v8CaL2QoQNoHD+DJfWkFzuW/
	+VpWgxEkM93/oGWat5oLegan/vwh8nORwTIi1KGcDG7w0yXsg9dJp46d0NDmcQzKf0tBzU
	Tnh4P1ecl3MlWqqdxZZnYEgOmWwkj4Ys+0apJ+0zk27FLE5qUNRWTPpdPX28CA==
Message-ID: <1adcfbd4-c269-4b1f-9e03-a697732faac8@cjdns.fr>
Date: Thu, 14 May 2026 22:32:42 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 5/5] clocksource/timer-econet-en751221: Support irq
 number per timer
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robh@kernel.org
References: <20260514000601.3430262-6-cjd@cjdns.fr>
 <20260514161816.A2133C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260514161816.A2133C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 14/05/2026 18:18, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 9 potential issue(s) to consider:
> - [High] NULL pointer dereference due to requesting IRQ before initializing clock_event_device.
> - [High] Interrupt storm and system lockup due to incorrect IRQ context handling.
> - [High] Unconditional MMIO mapping based on NR_CPUS causes initialization failure on older platforms.
> - [High] Use-After-Free of MMIO memory on initialization error path.
> - [High] Out-of-bounds per-CPU memory access if DT defines more IRQs than nr_cpu_ids.
> - [Medium] Returning `-EINVAL` from hotplug startup callback aborts CPU hotplug registration.
> - [Medium] Missing CPU hotplug teardown callback leaves hardware timer running.
> - [Medium] Heuristic hardware detection fails on uniprocessor configurations of multi-IRQ SoCs.
> - [Low] Missing `CLOCK_EVT_FEAT_PERCPU` flag for clock event devices in multi-IRQ mode.
> --
>
> commit 7bc20cbfbe69fc307b80fd4b2cd349dcdd20410b
> Author: Caleb James DeLisle <cjd@cjdns.fr>
> Subject: clocksource/timer-econet-en751221: Support irq number per timer
>
> This commit adds support for both percpu and individual IRQ per timer modes.
> It handles standard mti,gic compatible interrupt controllers found on MIPS
> 1004Kc based systems.
>
> Link: https://github.com/openwrt/openwrt/commit/fab098cb6121647ca9cc6e501d56ebe8a9ea550b#diff-a09ee5e4166e89df337d03c1455dce7b81eb89797b1d0f714476b188e6685334
>
>> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
>> index 4b712eb4db6f6..642af9fcda60e 100644
>> --- a/drivers/clocksource/timer-econet-en751221.c
>> +++ b/drivers/clocksource/timer-econet-en751221.c
> [ ... ]
>> @@ -21,14 +22,26 @@
>>   #define ECONET_MAX_DELTA		GENMASK(ECONET_BITS - 2, 0)
>>   /* 34Kc hardware has 1 block and 1004Kc has 2. */
>>   #define ECONET_NUM_BLOCKS		DIV_ROUND_UP(NR_CPUS, 2)
>> +#define ECONET_MAX_IRQS			NR_CPUS
>>   
>>   static struct {
>>   	void __iomem	*membase[ECONET_NUM_BLOCKS];
>>   	u32		freq_hz;
>> +	int		irqs[ECONET_MAX_IRQS];
>> +	int		num_irqs;
>>   } econet_timer __ro_after_init;
>>   
>>   static DEFINE_PER_CPU(struct clock_event_device, econet_timer_pcpu);
>>   
>> +/* This timer supports two interrupt controller models, either 1 IRQ which is in per-cpu
>> + * mode which is used on 34Kc CPUs, and separate IRQ number per CPU which is used on
>> + * 1004Kc CPUs with GIC intc.
>> + */
>> +static inline bool is_percpu_irq(void)
>> +{
>> +	return econet_timer.num_irqs == 1;
>> +}
> If an SoC using the standard GIC model is configured as a uniprocessor system,
> will the Device Tree only describe 1 interrupt?
Such a DT wouldn't pass validation, however perhaps there is too much 
code inferring whether we're a EN751221 or an EN751627. Will think on it.
>
> If so, does this heuristic mistakenly invoke request_percpu_irq() on a standard
> SPI interrupt, preventing timer initialization?
>
>> @@ -98,12 +111,21 @@ static int cevt_init_cpu(uint cpu)
>>   	struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, cpu);
>>   	u32 reg;
>>   
>> +	if (!is_percpu_irq() && cpu >= econet_timer.num_irqs)
>> +		return -EINVAL;
> Since this function is registered as a CPU hotplug startup callback via
> cpuhp_setup_state(), does returning an error here cause the hotplug core
> to abort and rollback the state?
>
> Should this return 0 instead when intentionally skipping a CPU?
A CPU without a timer is non-functional, so IMO this should fail as hard 
as possible.
>
>> @@ -171,6 +193,44 @@ static int __init cevt_init(struct device_node *np)
>>   	return ret;
>>   }
>>   
>> +static int __init cevt_init_multi_irq(struct device_node *np)
>> +{
>> +	int i, ret;
>> +
>> +	for (i = 0; i < econet_timer.num_irqs; i++) {
>> +		struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, i);
> If the system boots with restricted CPUs (e.g. nr_cpus=1) but the device tree
> provides multiple IRQs, will this loop access uninitialized __per_cpu_offset
> indices?
>
> Should the iteration be bounded by nr_cpu_ids?
Okay yes.
>
>> +
>> +		econet_timer.irqs[i] = irq_of_parse_and_map(np, i);
>> +		if (econet_timer.irqs[i] <= 0) {
>> +			pr_err("%pOFn: irq_of_parse_and_map failed", np);
>> +			ret = -EINVAL;
>> +			goto err_free_irqs;
>> +		}
>> +
>> +		ret = request_irq(econet_timer.irqs[i], cevt_interrupt,
>> +				  IRQF_TIMER | IRQF_NOBALANCING,
>> +				  np->name, NULL);
> Because standard IRQs can be routed to a default CPU before
> irq_force_affinity() is applied, can an interrupt for CPU 1's timer execute
> on CPU 0?
>
> If so, will CPU 0 check its own timer, find it not pending, and
> return IRQ_NONE without acknowledging CPU 1's timer, causing an IRQ storm?
>
> Should a dev_id be passed here and retrieved in the interrupt handler
> instead of relying on this_cpu_ptr()?
Think I'll use IRQ_NOAUTOEN and enable later, so if for some reason the 
CPU never starts it will failsafe.
>
> Also, since request_irq() immediately unmasks the interrupt, what happens if
> a timer interrupt is already pending from the bootloader?
I think with IRQ_NOAUTOEN this will be fine.
>
> Will cevt_interrupt() execute immediately, retrieve the statically
> zero-initialized clock_event_device, and dereference a NULL dev->cpumask
> because cevt_setup_clockevent() has not yet been called?
IRQ_NOAUTOEN fixes this.
>
>> +		if (ret < 0) {
>> +			pr_err("%pOFn: IRQ %d setup failed (%d)\n", np,
>> +			       econet_timer.irqs[i], ret);
>> +			irq_dispose_mapping(econet_timer.irqs[i]);
>> +			goto err_free_irqs;
>> +		}
>> +
>> +		cevt_setup_clockevent(cd, np, econet_timer.irqs[i], i);
>> +		cevt_dev_init(i);
> Should the CLOCK_EVT_FEAT_PERCPU flag be set on the clock_event_device
> here to inform the clockevents core about the hardware's strict CPU
> locality?
Whoops, that was a mistake.
>
>> @@ -184,6 +244,12 @@ static int __init timer_init(struct device_node *np)
>>   
>>   	econet_timer.freq_hz = clk_get_rate(clk);
>>   
>> +	econet_timer.num_irqs = of_irq_count(np);
>> +	if (econet_timer.num_irqs <= 0 || econet_timer.num_irqs > ECONET_MAX_IRQS) {
>> +		pr_err("%pOFn: invalid IRQ count %d\n", np, econet_timer.num_irqs);
>> +		return -EINVAL;
>> +	}
>> +
>>   	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
>>   		econet_timer.membase[i] = of_iomap(np, i);
> Since the 34Kc platform only has 1 timer block and provides a single reg
> region in its Device Tree, will of_iomap(np, 1) return NULL and cause
> initialization to fail if NR_CPUS makes ARRAY_SIZE(econet_timer.membase)
> evaluate to 2 or more?
Will address per note on previous patch.
>
>> @@ -202,7 +268,11 @@ static int __init timer_init(struct device_node *np)
>>   		goto err_unmap;
>>   	}
>>   
>> -	ret = cevt_init(np);
>> +	if (is_percpu_irq())
>> +		ret = cevt_init(np);
>> +	else
>> +		ret = cevt_init_multi_irq(np);
>> +
>>   	if (ret < 0)
>>   		goto err_unmap;
> If cevt_init_multi_irq() fails and the code jumps to err_unmap, the
> previously registered clocksource from clocksource_mmio_init() is not
> unregistered.
>
> Does this leave the timekeeping subsystem with a dangling pointer to the
> unmapped MMIO region, leading to a crash on the next time read?
Will re-work following notes on previous patch.
> Additionally, when a CPU goes offline, is the hardware timer ever disabled
> since there is no teardown callback provided to cpuhp_setup_state() in this
> function and no set_state_shutdown function?
>
> Will the online CPUs continuously receive timer interrupts from the offline
> CPU's running timer?
Reference code does not set CONFIG_HOTPLUG_CPU, and similar chips 
(MT7621) do not set it in OpenWrt so I'm not sure it it's known how to 
get it working. In any case I think if we ever get there, the timer will 
be just one of many concerns.
