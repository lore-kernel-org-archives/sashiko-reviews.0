Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C173F33121E
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 16:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778777782; cv=none; b=izW9buSPpLrC0zZr5NSoedS6r9e9VZYeSk02Qw/qxptJEUNDVUNAbb4RXUspGJIgaeo+R7N+EC4vpKUb/68/SyxgZEBwoDeVA4tRhwxhuCs1LnTkgg8GWNIkUK3DIrnk84Cvcaw0VaprHEeLj/q8bF4hKgIIG2ENWAfm2zm0Cos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778777782; c=relaxed/simple;
	bh=5ULVOCgR+aIMYOuMkruHNrVw/rTZYAg8CEk8Xdm5pxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=br5IDYMK88eyobxR0Q7jvefCHw4HhzyV0OPuc198TEXppEaO41hCNIIcy9RK7pP6twbV3VQ8+VW7FbBQwyqWQhBboocL4nGTOu5GqUU2s6LzGGVMlnlyFYN6X/SN0IR/d2KaE35IeU+tQHrL1SCfoscAtGWX4MEQm0GvhLtSYNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=JDt02rvo; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="JDt02rvo"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15C1A3C392C;
	Thu, 14 May 2026 18:56:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778777777; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jrQZUENFZB71CdcUq7065FvlPBBJ+5mCQIWY7rRfEEY=;
	b=JDt02rvo6MmqK9SbHQ2R4ofLQ7KV6YumbjteB1dVmW4oiOi6dDjQgt2uPFhxQxXUuKa10/
	4UIqCqrK5ViTb9NlA2jJMtlie1g/pfdtU7yGJ1s3/EG4Wlbl6f2/XiwaAP8QdH6qEQHPwq
	S4iGECpx+UdVhdBiXm0GzQVt9FkPAbb+vXJOEUHi+wn+jYrTTsFOBfe/zhXA8t6bhhJ2lq
	Dbs0sLxAskk3C06qCT6nZnLbWdebI4PLo3vkv76J8vh0CYh1gIOIaaMYtYOr7CYMkEX+8f
	yxsHE7jRW9pbwndRX90jiPDruS5FH43qIsSzL9XtI3A29xIP6YZinsToWdJuWw==
Message-ID: <b11694d8-5f4f-4f24-bf53-bad3b5394a04@cjdns.fr>
Date: Thu, 14 May 2026 18:56:15 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 4/5] clocksource/timer-econet-en751221: Unmap io mem on
 probe error
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org
References: <20260514000601.3430262-5-cjd@cjdns.fr>
 <20260514125641.C94F2C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260514125641.C94F2C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 14/05/2026 14:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] Unmapping IO memory after a successful `clocksource_mmio_init()` registration introduces a fatal use-after-unmap vulnerability.
> --
>
> commit dd9c92736c75fb466e09313766fb39cf62c86394
> Author: Caleb James DeLisle <cjd@cjdns.fr>
> clocksource/timer-econet-en751221: Unmap io mem on probe error
>
> This commit updates the econet timer initialization to unmap the IO
> memory blocks if an error occurs during probe.
>
>> --- a/drivers/clocksource/timer-econet-en751221.c
>> +++ b/drivers/clocksource/timer-econet-en751221.c
> [ ... ]
>> @@ -198,12 +199,12 @@ static int __init timer_init(struct device_node *np)
>>   				    clocksource_mmio_readl_up);
>>   	if (ret) {
>>   		pr_err("%pOFn: clocksource_mmio_init failed: %d", np, ret);
>> -		return ret;
>> +		goto err_unmap;
>>   	}
>>   
>>   	ret = cevt_init(np);
>>   	if (ret < 0)
>> -		return ret;
>> +		goto err_unmap;
> If clocksource_mmio_init() succeeds, it registers the clocksource and saves
> the mapped IO pointer. If the subsequent cevt_init() fails, the code now
> jumps to err_unmap and unmaps the memory via iounmap().
Yeah I need to go back through this again.
>
> Since clocksource_mmio_init() does not provide a way to unregister the
> clocksource, the registered clocksource will remain active. When the kernel
> reads from this clocksource later, will it dereference the unmapped IO memory
> and cause a use-after-unmap regression?
>
> Looking at clocksource_mmio_init() in drivers/clocksource/mmio.c:
>
> clocksource_mmio_init() {
>          ...
>          cs->reg = base;
>          cs->clksrc.read = read;
>          ...
>          return clocksource_register_hz(&cs->clksrc, hz);
> }
>
> Before this patch, if cevt_init() failed, the driver returned an error
> without unmapping the memory, which allowed the already-registered
> clocksource to safely continue functioning.
>
> [ ... ]
>> +err_unmap:
>> +	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
>> +		if (econet_timer.membase[i])
>> +			iounmap(econet_timer.membase[i]);
>> +	}
>> +
>> +	return ret;
>>   }
