Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80D73914FF
	for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 23:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778972941; cv=none; b=CydGW+n+vkmkIvBmWVz0Qf7WzJgXMP7eugqcbyJutbk8/APfXuB4YK+em0VFf5D9ZhgaC/VCXFStVOVHHQgau8c65SaS1qol3TpHeTpq1WwNRrafLNkmpHKs6a+y+LoHB6rQ2UZWvJfitRgFZGm2Q55PqItdqgEH5aQttxS3u20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778972941; c=relaxed/simple;
	bh=4Tw1975QqPqCLa0sf7YUurAHi3Q3AX+denT2FA8bqcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqSr5KyVrQNtBpvK+P1Ns/bzw/yQ2sPNHe+F+KapCMtF0wFr4VtU0vTs8sjcPWasgl75kx9/aGJlLcyCt8lRPUr4IWXXXZYllUqlz9Vr3gVUjdwHx7WUoeJScmN4m2KZZJCmZSvtbnuihx2fTGqU1QHNqo53ETSaVEDRCpcJM3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=tiR6EYYV; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="tiR6EYYV"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D3343F8CE2;
	Sun, 17 May 2026 01:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778972931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=a76I6a49b3i2lbk8ykm4clFLPuo5ePSCCn97niUVBIc=;
	b=tiR6EYYVMI0DjJUiJCkQKBBT1Ok/bU305oxKbpYCF55VsfwXiYhDIErPqU+P+yuZpMu001
	Nd9SFiX4kk3FlQSzehk6j8+Jh2lUB5wJsqyWX+yD4w28QMwQg8wkUmWTg7qnAXMobKA16X
	W/llXHtGKIHi2m/bGMSQPNcGLYgdOK1y4K/2a0Z761mLwxJ7DkJpG7YUqURoksXLkcwLhB
	S5EnQw/TvBpXdsV9jjHhzCqnQdlIu1KhocPzW808CnsByA1+uckcbi15AKaVda1QbT6lcl
	ee77ZUsK18+s4QxjpZAxDXnrHB/MbEDqHA0T4Ov+eSSDU6t8id5awopnkK4Z0Q==
Message-ID: <3403906d-00cd-4b5d-b59e-6989ecf7b721@cjdns.fr>
Date: Sun, 17 May 2026 01:08:36 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 2/4] clocksource/timer-econet-en751221: Init teardown
 on error if possible
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260516215720.4160831-3-cjd@cjdns.fr>
 <20260516223331.3A843C19425@smtp.kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260516223331.3A843C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 17/05/2026 00:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Teardown path unmaps memory while clockevents remain registered (Use-After-Free)
> - [High] Missing CPU hotplug teardown callback leaves per-CPU IRQs enabled on offline CPUs
> - [High] Pre-existing out-of-bounds mapping access with sparse CPU possible mask
> - [Medium] Ignored error code from clocksource_mmio_init causes false success reporting
> --
>
> commit d0c6a451d26e5e0afd704c60615c1cfa9457c425
> Author: Caleb James DeLisle <cjd@cjdns.fr>
>
> clocksource/timer-econet-en751221: Init teardown on error if possible
>
> This commit reorganizes the driver initialization process into two
> distinct phases, providing a rollback path for errors that occur prior to
> the point of no return. It adds logic to unmap memory and release interrupts
> if the setup steps fail.
>
>> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
>> index 4008076b1a210..155471f68e6f8 100644
>> --- a/drivers/clocksource/timer-econet-en751221.c
>> +++ b/drivers/clocksource/timer-econet-en751221.c
>> @@ -186,22 +165,45 @@ static int __init timer_init(struct device_node *np)
>>   		econet_timer.membase[i] = of_iomap(np, i);
>>   		if (!econet_timer.membase[i]) {
>>   			pr_err("%pOFn: failed to map register [%d]\n", np, i);
>> -			return -ENXIO;
>> +			ret = -ENXIO;
>> +			goto out_membase;
>>   		}
>>   	}
> This is a pre-existing issue that is resolved later in this patch series
> by commit clocksource/timer-econet-en751221: Support EN751627 without
> percpu IRQ, but I am mentioning it here for completeness.
>
> Can this loop cause an out-of-bounds access with a sparse CPU mask?
>
> The loop iterates up to num_blocks, which is calculated based on
> num_possible_cpus(). If the system has a sparse CPU topology where
> CPUs 0 and 4 are possible, num_possible_cpus() is 2, so the loop only
> maps membase[0].
>
> However, cevt_init() iterates over for_each_possible_cpu(i). For CPU 4,
> cevt_dev_init(4) accesses membase[2], which remains null, potentially
> causing a kernel panic when dereferenced.
>
> [ ... ]
>
>> +	cevt_init(np);
>> +
>> +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>> +				"clockevents/econet/timer:starting",
>> +				cevt_init_cpu, NULL);
>> +	if (ret < 0) {
>> +		pr_err("%pOFn: cpuhp setup failed (%d)\n", np, ret);
>> +		goto out_irq_free;
>> +	}
> If cpuhp_setup_state() fails here, can the teardown path cause a
> use-after-free?
>
> Because the teardown callback in cpuhp_setup_state() is null, the CPU
> hotplug core's attempt to roll back the state on previously initialized
> CPUs acts as a no-op. This leaves the clock event devices and hardware
> timers fully active on those CPUs.
>
> The error path then proceeds to out_irq_free and subsequently unmaps the
> memory regions via iounmap(). When the clockevents core later tries to
> access the active timer on those CPUs, it will read from and write to
> unmapped memory.
>
> Additionally, while this is a pre-existing issue, does providing a null
> teardown callback leave per-CPU interrupts enabled on offline CPUs?
>
> When a CPU is dynamically offlined, the teardown callback should stop the
> hardware timer and call disable_percpu_irq(). Without it, the timer remains
> free-running and the interrupt unmasked for the offline CPU.
As said in previous version, I don't think this is an issue, but I need 
to fix that yaml so I'll move it below the point of no return to make 
the bot be quiet.
>
>> +
>> +	/* Point of no return, do not attempt to tear down after this. */
>>   
>>   	/* For clocksource purposes always read clock zero, whatever the CPU */
>>   	ret = clocksource_mmio_init(reg_count(0), np->name,
>>   				    econet_timer.freq_hz, 301, ECONET_BITS,
>>   				    clocksource_mmio_readl_up);
>> -	if (ret) {
>> -		pr_err("%pOFn: clocksource_mmio_init failed: %d", np, ret);
>> -		return ret;
>> -	}
>> -
>> -	ret = cevt_init(np);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (ret)
>> +		pr_err("%pOFn: clocksource_mmio_init failed: %d\n", np, ret);
> Does removing the return on error here cause the driver to report success
> when initialization fails?
>
> The failure code is captured in ret, but execution falls through and the
> function unconditionally returns 0 at the end. This allows the driver to
> print success messages and report a successful initialization even if the
> clocksource registration failed.
It's below the point of no return so the idea is to complain but muddle 
through no matter what.
