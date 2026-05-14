Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BF733F58A
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778777566; cv=none; b=qtVQJMmd+n8eUyc4l0Z/8aHpTVO8sZsQU+C+sRM1Ype71tDEEt7bWe+QTUxSh7n1PM8/TL6gxE0zZjXUlAg26w7blIBw5ol4ISW8fNYWCFDIQqobut6iti7AnCpc8nz+HGBOYSoiVWTgnmQjH/UEgHfs6775lw1vX1s6JioAGeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778777566; c=relaxed/simple;
	bh=T7MiKuNKPSjYpbT2yVTb8OJ15sQpp/3LQD/kqrBHGM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFr3+Az7GeHHyQSbs3ddiEvFHH+2JEajwcJANgOcHy6ccMuTcnADtN8rfMVK7WlvGR042z/t6wpb5o4YKwyVLyAQBsb06UEOAcRLYPbp9rCmzVt/rFTSMdZ3DfTkDDw3aNVPL3yLRNwnDSKg5eHp0RTb7Mlh0BIOTkYj36q1FQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=NsfP5vPu; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="NsfP5vPu"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3252A3C1EA3;
	Thu, 14 May 2026 18:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778777562; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=s9cMvDXYkfw5lrJ7QeUOGkm4umH3v9JSvja3rLol0zg=;
	b=NsfP5vPu93J3dr4t75yrYa9UE7PXfQE9XITzTzaV9j1SEBM9CLyCwPHPyzgQs+kyzzREDE
	H+OwL9suZbKqqlPP9YcRehV/3XYknl8ZMQIbwGE515KWsUfNC91ZDbOnyP71X+Blgd6NZe
	3IvSvz3FbgXRpdIjIDCQfpgg8fRVxKM2l1Zu4X0c/F3olFMsIAJAicovSpom6wKdwCY9VR
	X/+wG8mdv9zauY8ivw/9dlv5UsOrtpkFf0ZJNh/GUP1GtCaF/srxz0HrVTP8GhWBZfLkyV
	ypLPMuzT0UhW8Xb61EdfOcVhhSnekxjksWAoMaM+rkYVsk1B7rLMopQydG4urA==
Message-ID: <e08d8cb8-5096-4421-a3f0-cba31eb39f7f@cjdns.fr>
Date: Thu, 14 May 2026 18:52:38 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 3/5] clocksource/timer-econet-en751221: Always map all
 membase blocks
To: sashiko-reviews@lists.linux.dev
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org
References: <20260514000601.3430262-4-cjd@cjdns.fr>
 <20260514123004.10908C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260514123004.10908C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 14/05/2026 14:30, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Unconditional iteration up to a compile-time constant array size causes timer initialization to fail on hardware with fewer timer blocks, breaking boot.
> - [High] The per-CPU timer interrupt is unmasked before the clockevent device is registered, creating a race window that can lead to a NULL pointer dereference.
> --
>
> commit 1a3827645212808ad5c364c42807919047db1da2
> Author: Caleb James DeLisle <cjd@cjdns.fr>
>
> clocksource/timer-econet-en751221: Always map all membase blocks
>
> This commit simplifies the logic by unconditionally mapping all timer memory
> blocks up to ARRAY_SIZE(econet_timer.membase), instead of computing the
> number of blocks dynamically based on the number of possible CPUs.
>
>> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
>> index 5def3e536b21c..e79069d9a826d 100644
>> --- a/drivers/clocksource/timer-econet-en751221.c
>> +++ b/drivers/clocksource/timer-econet-en751221.c
>> @@ -173,7 +173,6 @@ static int __init cevt_init(struct device_node *np)
>>   
>>   static int __init timer_init(struct device_node *np)
>>   {
>> -	int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
>>   	struct clk *clk;
>>   	int ret;
> [ ... ]
>
>> @@ -185,7 +184,7 @@ static int __init timer_init(struct device_node *np)
>>   
>>   	econet_timer.freq_hz = clk_get_rate(clk);
>>   
>> -	for (int i = 0; i < num_blocks; i++) {
>> +	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
>>   		econet_timer.membase[i] = of_iomap(np, i);
>>   		if (!econet_timer.membase[i]) {
>>   			pr_err("%pOFn: failed to map register [%d]\n", np, i);
> Could this cause a regression on systems with fewer timer blocks, like the
> EN751221 (34Kc) which only has 1 block?
>
> Since ARRAY_SIZE(econet_timer.membase) is based on CONFIG_NR_CPUS, it
> expands to a compile-time constant that can exceed the actual number of
> hardware blocks.
>
> If a kernel is built with CONFIG_NR_CPUS=4 or higher, this loop will attempt
> to map 2 or more blocks. On a system with only 1 timer block and 1 reg entry
> in its device tree, of_iomap(np, 1) will fail and return NULL.
>
> Because the error path unconditionally returns -ENXIO and aborts timer
> initialization, could this completely break booting on these platforms?
Okay I'm convinced. I think num_possible_cpus() wasn't right either. 
What I think I'll do is fail if I'm not able to map half the num_irqs. 
I'll also tighten up num_irqs to only allow 1 or 4 since those are the 
only valid configurations.
>
> This isn't a regression introduced by this commit, but looking at
> cevt_init_cpu():
>
> drivers/clocksource/timer-econet-en751221.c:cevt_init_cpu() {
> 	...
> 	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
>
> 	/* Do this last because it synchronously configures the timer */
> 	clockevents_config_and_register(cd, econet_timer.freq_hz,
> 					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
> 	...
> }
>
> Is it possible for a timer interrupt to fire immediately after
> enable_percpu_irq() is called?
>
> If an interrupt fires before clockevents_config_and_register() completes,
> could the interrupt handler dereference a NULL dev->event_handler(dev)?
>
> Calling clockevents_config_and_register() before unmasking the interrupt
> might close this potential race window.

Both percpu and multi-irq have this issue.

Probably easiest to just do: if (dev->event_handler) 
dev->event_handler(dev);

