Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF26829D275
	for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 20:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778963235; cv=none; b=fxHjV/WuCTdQBHijAh2EalmVXjBNBmZHO07Xuc3tmEvfpOVSf7YnTXzDW+HwK/PNoYsmEGsbRqTtgpZDNQSVZw45StBavcLq1OASHbbK5dHkgT1ZCkiQd2VoXjFpIR35qos16YdOq2B6GA+aczDnfLwy6mrLVuXd1sNmL0Fo0/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778963235; c=relaxed/simple;
	bh=T0k7Wwrec0WvnAK+kdyipmL0NcZTus0+zz/Fkvx/LZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxHHJ+EMBUW3rLJ3H/8PsMb2dvFIU1ew8Dr9oXYvOpCqE5Qptdfzu4zmLzuptJAbVRkL+nTpm01WJ/a+eeS7jf2I4MWDLRBP3cv7qYxDBPEjkVKVjFjI7Gp90ELKuWSntKk2UHwpEd66lHZ5VpnEtdRaTyKSaLNm8YcEjfuKErM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=QKFNCsM7; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="QKFNCsM7"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 707633F9283;
	Sat, 16 May 2026 22:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778963230; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LqkOJ4cflb4R5gtL8qXDiRudP3BhK//fCfgK0ytXFlM=;
	b=QKFNCsM7oSUga9BYcN0ja8tpjx+D4GWiWRqr5S5gSkUOBEVhLnIuQbJVZcf14F8O/BYpz2
	zqHO9geSyeKth0sL2UYUyH7mCBNLaZvWOddSncj3SGGDyyfNxG74DaJJJSxbi98gS7id6l
	+csB/wAgSSOcFiqXyept6QF0/stdUKwmn2qFXaw5Nb9BI1VRPKW6gairuyHEL4pNh/7sgZ
	RxONe+POXgxBLdOrDPrssKYgtghJVSz1pvwQRX5o1AIidUvPyZVUDhEoZZiG/n5HY799EX
	k73Km1Tza4CRitzBAIPu7SF0OUVzRaTQuZhbObSRjHl8IkLIUyG1J+gLJu5J3A==
Message-ID: <3d36a919-dcb9-427f-9b9d-ca6dcbe67171@cjdns.fr>
Date: Sat, 16 May 2026 22:27:08 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 4/4] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260516182648.3987792-5-cjd@cjdns.fr>
 <20260516200638.0FF88C19425@smtp.kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260516200638.0FF88C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 16/05/2026 22:06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Missing bounds check on `num_blocks` leads to buffer overflow and memory corruption.
> - [High] Off-by-one error in `cpuhp_setup_state` failure path causes out-of-bounds array access and invalid IRQ free.
> - [High] Missing CPU hotplug teardown callback causes unbalanced `enable_irq` warnings and use-after-unmap crashes on initialization failure.
> --
>
> commit c9306a7aa40ae1fa4dc34819e52ba88137234f75
> Author: Caleb James DeLisle <cjd@cjdns.fr>
>
> clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ
>
> EN751627 is based on the 1004Kc which uses a different interrupt number
> for each CPU timer. Support both this and the EN751221 which uses a
> single percpu interrupt.
>
>> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
>> index ed750e39cc4fa..dea6dbafa16ea 100644
>> --- a/drivers/clocksource/timer-econet-en751221.c
>> +++ b/drivers/clocksource/timer-econet-en751221.c
>> @@ -107,7 +128,10 @@ static int cevt_init_cpu(uint cpu)
>>   	clockevents_config_and_register(cd, econet_timer.freq_hz,
>>   					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
>>   
>> -	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
>> +	if (econet_timer.is_percpu)
>> +		enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
>> +	else
>> +		enable_irq(cd->irq);
> Will this cause unbalanced enable_irq() warnings when a CPU is brought back
> online?
Doesn't happen on this SoC.
>
> Since cpuhp_setup_state() provides NULL for the teardown callback, taking a
> CPU offline leaves the IRQ depth at 0.
>
> When brought back online, cevt_init_cpu() calls enable_irq() again, which
> could trigger the IRQ subsystem's unbalanced enable warning.
>
> Also, if cpuhp_setup_state() fails midway, the hotplug core attempts to roll
> back CPUs but does nothing due to the NULL teardown callback. The driver then
> proceeds to unmap MMIO memory and free IRQs.
Per last patch note, cevt_init_cpu only either errors OR sets up a 
timer, not both.
>
> Could this leave active clockevent devices registered that will crash the
> system when their set_next_event callback accesses the unmapped memory?
>
> [ ... ]
>
>> @@ -148,9 +177,23 @@ static void __init cevt_init(struct device_node *np)
>>   
>>   static int __init timer_init(struct device_node *np)
>>   {
>> -	int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
>> +	int num_blocks = of_address_count(np);
> [ ... ]
>
>> @@ -160,7 +203,7 @@ static int __init timer_init(struct device_node *np)
>>   
>>   	econet_timer.freq_hz = clk_get_rate(clk);
>>   
>> -	for (int i = 0; i < num_blocks; i++) {
>> +	for (i = 0; i < num_blocks; i++) {
>>   		econet_timer.membase[i] = of_iomap(np, i);
> Could this overflow the econet_timer.membase array?
>
> The econet_timer.membase array is statically sized to ECONET_NUM_BLOCKS.
>
> If a device tree specifies more address resources than ECONET_NUM_BLOCKS, this
> loop will write out of bounds and corrupt adjacent memory like the irqs array.
>
> Also, if num_blocks is less than required for the number of CPUs, will
> cevt_dev_init() dereference unmapped NULL memory?
Indeed, invalid DT will cause a crash. I can fix this easy enough.
>
> [ ... ]
>
>> @@ -216,11 +270,20 @@ static int __init timer_init(struct device_node *np)
>>   	return 0;
>>   
>>   out_irq_free:
>> -	free_percpu_irq(econet_timer.irq, &econet_timer_pcpu);
>> +	for (; i >= 0; i--) {
>> +		if (econet_timer.is_percpu) {
>> +			free_percpu_irq(econet_timer.irqs[i], &econet_timer_pcpu);
>> +		} else {
>> +			free_irq(econet_timer.irqs[i], NULL);
>> +		}
>> +	}
> Could this perform an out-of-bounds access or free an uninitialized IRQ?
>
> After successfully requesting num_irqs interrupts in the loop above, the loop
> variable i is equal to num_irqs.
>
> If the subsequent cpuhp_setup_state() call fails, the code executes goto
> out_irq_free without decrementing i.
>
> If num_irqs equals ARRAY_SIZE(econet_timer.irqs), this will access
> econet_timer.irqs[num_irqs], which is past the end of the array. Even if
> within bounds, it calls free_irq() on an unrequested index.
Oops yes that needs fixing. Will send v4 for this and sweep in a few of 
the others as well.
>
