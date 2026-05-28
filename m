Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A9948124A
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983193; cv=none; b=TX6bVPFYdOSCmTq7yeXt7mjZqCVMlh1cB814stvkevu7WEZaW6+n1YZzL/AdnBWAVyx7+qcQ4FW8kzE16ppyqmv2kbfJkN3JUXfRKjTcE9uNe1fl/FL/9OumYfXebGjIRC0Kc+EPufYSU8zZ+OO/LwzQOFEY0ib/S4QRbmDWgbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983193; c=relaxed/simple;
	bh=ZcxEwXE1OB6A4lNBsg0j+Ck+Wn3pDWCw2b/gZ2ylMXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JG+5BLToUeWAIkuPJH8vZrEEnfrzuD2zlDgflkKFiM7TcTXSHRyasWHwQMcDAOTEutP841fjG9nqoaA8DcsV/HtCZi8d3xMJsTKFgrAmxBarm4TurEVFB5s5XEfIp+/ykDsxHfs27gTIuwBxd8w7NP/R1atLjT91I0YTLkvpUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=t8m3C54g; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="t8m3C54g"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E7174B9409;
	Thu, 28 May 2026 17:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779983187; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Lig/Y3jjno2s3ssT2q87EUHF7rWx9/04UKQMvVpIUBw=;
	b=t8m3C54gKW9W7JpxCSv30JiXzivv60u8SoMRRMCicGUYQkedL7v7+1m9FVelyXL3E7WCTo
	XnfMpht0eFKrB1WzHaZTe6WDbcDl3/mGmaHrHt/l9Thr5QBtScMAoucGLxKiIKvmYlEjAA
	KP9LFmAg4rTLk74yLNjXsRAxVwzz4JE62GFCFIpoUENdEnTwy1NT9+KnyNIZaizLjxDKp8
	aoplKkmrJ0RENTc/SlStN70si/BlDPUzIM5MJ1iEiF7joWwLXQgwo79/c7UtOS8EL28rRD
	tHGuSPMWaRkFPjkgG6sc4n8zGapnpRXfwaPli0MeTLZTs5OIOIamow8JyZ5Tfw==
Message-ID: <8542ce1e-4e6b-4393-87f7-b4270f43be65@cjdns.fr>
Date: Thu, 28 May 2026 17:46:25 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v6 3/5] clocksource/timer-econet-en751221: Init teardown
 on error if possible
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260528140046.2897674-4-cjd@cjdns.fr>
 <20260528152337.DD6D41F000E9@smtp.kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260528152337.DD6D41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 28/05/2026 17:23, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] The newly added error path for `cpuhp_setup_state()` failure creates a fatal use-after-unmap vulnerability by freeing IRQs and unmapping I/O memory without unregistering the active clockevent devices.

I'm considering this not-a-bug because at the time the timer comes 
online, there is only one CPU, and if cevt_init_cpu errors out it 
requires no tear-down. I can silence this warning by not erroring on 
failed cpuhp_setup_state call, but I didn't consider "make Sashiko 
happy" a good enough reason to do it.

Thanks,

Caleb

> --
>
> commit e1e0b36b8164978eb079f38d9547d743cebd0a97
> Author: Caleb James DeLisle <cjd@cjdns.fr>
>
> clocksource/timer-econet-en751221: Init teardown on error if possible
>
> This commit reorganizes the initialization process of the econet timer by
> separating it into two phases. It adds teardown logic to safely roll back
> resource allocations like memory mappings and IRQ requests if an error occurs
> before the point of no return.
>
>> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
>> --- a/drivers/clocksource/timer-econet-en751221.c
>> +++ b/drivers/clocksource/timer-econet-en751221.c
> [ ... ]
>> @@ -187,22 +166,45 @@ static int __init timer_init(struct device_node *np)
> [ ... ]
>> +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>> +				"clockevents/econet/timer:starting",
>> +				cevt_init_cpu, NULL);
>> +	if (ret < 0) {
>> +		pr_err("%pOFn: cpuhp setup failed (%d)\n", np, ret);
>> +		goto out_irq_free;
>> +	}
> [Severity: Critical]
> When cpuhp_setup_state() executes the startup callback across online CPUs,
> it registers the clockevent devices. If this fails on a subsequent CPU,
> cpuhp_setup_state() aborts. Because a NULL teardown callback was provided,
> the CPU hotplug core skips rollback and leaves the successfully registered
> clockevent devices active on the earlier CPUs.
>
> The error path here then frees the IRQs and unmaps the I/O memory. If the
> timekeeping core attempts to handle a timer interrupt or program the next
> event on the still-registered clockevent devices, will it dereference the
> unmapped memory?
>
> Should the active clockevent devices be unregistered, or a teardown callback
> provided to cpuhp_setup_state(), before freeing these resources?
>
>> +
>> +	/* Point of no return, do not attempt to tear down after this. */
> [ ... ]
>> +out_irq_free:
>> +	free_percpu_irq(econet_timer.irq, &econet_timer_pcpu);
>> +out_irq_mapping:
>> +	irq_dispose_mapping(econet_timer.irq);
>> +out_membase:
>> +	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
>> +		if (econet_timer.membase[i]) {
>> +			iounmap(econet_timer.membase[i]);
>> +			econet_timer.membase[i] = NULL;
>> +		}
>> +	}
>> +
>> +	return ret;
>>   }
