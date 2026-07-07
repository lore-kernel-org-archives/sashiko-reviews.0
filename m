Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677ED433BD0
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 16:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441368; cv=none; b=sAkQV0JXhDDX49IBZlq39m4XC2bcazQkyw5NoYlive2tNfzgm+U8avyL++0dsUsnWAdYTH/Btnn6xTq5G3qPSWXGHXuIu1PXquL7J/lBsVVl1dxc5qSd66H4J7Fgv8rEhPARzy6DYNJu31tt3rENyUx7dwp3LaXcggH/pH6hXus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441368; c=relaxed/simple;
	bh=5NAv1WC3hjw+KYQn9YTd9mOElGthU5SS9uZDqi57Alg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LXAglV6ktEyTFvqiawPKNuq43kAaNd1bDeZtQ1ut2qhQFNyHwHZwJdPezJp7AurspHc1XZE+Cs38OV6R4wtlnU4emqgdqIKjvF9ws7zTTZHpWc4UAGymjhLnGi72mRgaum5zlMJvyc3w5oB6KoCURV82jv4oB1yApfsyeIPoExo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JP+xEzTs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JP+xEzTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783441365;
	bh=5NAv1WC3hjw+KYQn9YTd9mOElGthU5SS9uZDqi57Alg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JP+xEzTsJMVppPChuN02TNKnQ3zOolRq6TsDLipoI64uLbvrsUf+L+hOzS5lYJaR2
	 al4TTdoCujiGINgjZ8/bg8bSz/2mKemuBIZy+I1zw9KxNkaNwICTKtPr1WvjDYnXef
	 G0RPDHLQsGyZzZ9L7pCfUj34JlJpQc6CeImglQU5KpD+RpFC7gxt13R876bcAZ+kJY
	 dQRIYJTYEy0lHlWJ6vW9+eUYNZblM4HlD54kuqm/xhH2yfmhHHYPR7lX/4EQqbuo5q
	 Z2LZikSK53GIlGdaOxrDz8Z7X8iGoAJJ85mHSYwQXCE3O+DPiMknrB7Q7ybFqJL5At
	 Fks9vazK1VYDw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8885E17E05E8;
	Tue, 07 Jul 2026 18:22:45 +0200 (CEST)
Message-ID: <d7fc4676-6aaf-4012-9a74-8861426cea2a@collabora.com>
Date: Tue, 7 Jul 2026 18:22:45 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] pmdomain: mediatek: Add support for Direct CTL
 simple power sequence
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260707155535.199383-1-angelogioacchino.delregno@collabora.com>
 <20260707155535.199383-4-angelogioacchino.delregno@collabora.com>
 <20260707160843.EBCF81F000E9@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260707160843.EBCF81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/26 18:08, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [Low] Ignoring the return value of `clk_bulk_prepare_enable` in the error recovery path of `scpsys_power_off` violates its `__must_check` attribute.
> 
> Pre-existing issues:
> - [High] If `scpsys_bus_protect_enable()` fails in `scpsys_power_off()`, it returns early without re-enabling `subsys_clks`, bypassing the newly added clock recovery block and breaking the clock refcount.
> - [High] Error paths in `scpsys_power_off()` leave the hardware in a corrupted state (SRAM disabled, bus protection active, and buck isolated) because they fail to revert these states before returning an error.
> - [High] Error paths in `scpsys_power_on()` disable clocks and regulators without reverting the power-on hardware sequence, leaving the domain hardware partially ON while genpd considers it OFF.
> --
> 
> --- Patch [3]: [PATCH v2 3/4] pmdomain: mediatek: Add support for Direct CTL simple power sequence ---
> commit a25fe6d3db6b42f564ecc5977f0a00e29a0cfd96
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> pmdomain: mediatek: Add support for Direct CTL simple power sequence
> 
> This commit adds a simplified power sequence for certain new MediaTek SoCs
> (like MT8196 and MT6991). The new sequence avoids using RTFF hardware and
> certain control bits, handling power domain enablement automatically after
> exiting reset.
> 
>> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
>> index db543d4b1813c..feba436279c54 100644
>> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
>> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> [ ... ]
>> @@ -682,7 +733,8 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>>   err_enable_bus_protect:
>>   	scpsys_bus_protect_enable(pd, 0);
>>   err_disable_sram:
>> -	scpsys_sram_disable(pd);
>> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
>> +		scpsys_sram_disable(pd);
>>   err_disable_subsys_clks:
>>   	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION))
>>   		clk_bulk_disable_unprepare(pd->num_subsys_clks,
> 
> [Severity: High]
> This is a pre-existing issue, but if a step fails during scpsys_power_on()
> after the initial MTCMOS power-on sequence, the function jumps to these
> error labels. It disables the clocks and regulators, but does this leave
> the domain's MTCMOS physically ON since it doesn't call a corresponding
> power-off sequence to revert it? Could this hardware inconsistency cause
> issues while the framework considers the domain OFF?
> 
>> @@ -698,16 +750,17 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>>   {
>>   	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
>>   	struct scpsys *scpsys = pd->scpsys;
>> -	bool tmp;
>>   	int ret;
>>   
>>   	ret = scpsys_bus_protect_enable(pd, 0);
>>   	if (ret < 0)
>>   		return ret;
>>   
>> -	ret = scpsys_sram_disable(pd);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
>> +		ret = scpsys_sram_disable(pd);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
> 
> [Severity: High]
> This is a pre-existing issue, but if scpsys_sram_disable() or
> scpsys_bus_protect_enable() fail here and return early, the framework will
> still treat the domain as ON. Does this early return leave the hardware
> physically isolated, potentially causing active consumer devices to hit an
> active bus protector or unpowered SRAM?
> 

The problem here is that if sram_disable() fails, sram_enable() is guaranteed to
also fail, there's nothing that can really be done to fix the disablement failure
if any happens.

I have never encountered a single failure here during disablement, but should it
happen, the only way to go here is to pray and hope that the next power_on() will
fix things up.

Can't do anything about it.

> [ ... ]
>> @@ -720,15 +773,17 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>>   		return ret;
>>   
>>   	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
>> -		scpsys_modem_pwrseq_off(pd);
>> +		ret = scpsys_modem_pwrseq_off(pd);
>> +	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
>> +		ret = scpsys_simple_pwrseq_off(pd);
>>   	else
>> -		scpsys_ctl_pwrseq_off(pd);
>> +		ret = scpsys_ctl_pwrseq_off(pd);
>>   
>> -	/* wait until PWR_ACK = 0 */
>> -	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, !tmp, MTK_POLL_DELAY_US,
>> -				 MTK_POLL_TIMEOUT);
>> -	if (ret < 0)
>> +	if (ret < 0) {
>> +		/* Re-enable clocks so that next power off doesn't break the refcount */
>> +		clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
> 
> [Severity: High]
> This is a pre-existing issue, but if scpsys_bus_protect_enable() fails
> earlier in scpsys_power_off() when called with BUS_PROT_IGNORE_SUBCLK, it
> returns early. Does that early return completely bypass this newly added
> clock recovery block, leaving the subsystem clocks disabled while the
> domain is logically considered ON?
> 

No that shouldn't happen, but to really resolve that we'd need a dual-stage probe
and/or enablement mechanism, like regulators. Can't do anything about that now,
but a talk for plumbers may be coming........

> [Severity: Low]
> Does this error recovery block ignore the return value of
> clk_bulk_prepare_enable()? Since the function is declared with
> __must_check in the clk API, could this cause a -Wunused-result compiler
> warning and break builds using -Werror?
> 

Nah. It's fine.

>>   		return ret;
>> +	}
> 

