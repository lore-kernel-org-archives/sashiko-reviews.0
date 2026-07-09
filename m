Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97D6403AE6
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 10:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593915; cv=none; b=up54j+BpzsSwgUWKfbcKiatRoXFDklc8eOkPrDCzI1jQZRHY5ZedaYQwlsiiVHn0cprVTYPNABkMJYcF8JqQi3jsZGh+5QDPWmQKjP6HKHd6UqWOFOYaYsXbWnwAjxqhJjVXRaU54lM/WWBfybTGTTd8S8Ng3qG7dV/dkxWbIiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593915; c=relaxed/simple;
	bh=PTGc36+DKPbLKZpOvC5m3aQ5OX1au2eeFPkLDVrfiyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ES2MLvWPV3wZ3dBqwRMfeobg47WYNPto53BhvdvTuG+HpxK34xsRCJS45KuqLCdUjN4+gAmgZwIxpNlkMT3gozj0i5mHP7VjVsqKGOcPV+Et7YvIe3hVs0c2XybvykFvJVy6gClvA9lc9fmCEDcCRZK2ucCbpxDSB6eL8TUISPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pfx+2rE5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pfx+2rE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783593909;
	bh=PTGc36+DKPbLKZpOvC5m3aQ5OX1au2eeFPkLDVrfiyQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pfx+2rE5s9Wmc4A+0cXz84HhhGd/z9qzWYs5hbmrHSArgJEQnCjPKfWj/CsFPyVnU
	 0JdBVzgD1nBKHfnniwyx2iSnirMPE9fBd/GtSqN1ESa/GjEcaC0ZylGdLlHQ3Mix3m
	 EdXJAX5syH8s0bshqvR4I8RyEE1GVDNMou9fRRDk4RwBG8aDHcklf+UqFl1bqPkGQK
	 iOfHJA6MLM5NH8rJClz1ZM1Bd+b8Jt4PUB7IkuoHYFdHcXOx0BkIKfsnQGCpQXYOjt
	 om0DdMEBfdRkZwJECTlqwS4280mv0SqkPQ5uEGnlxhaultXL/xlfChW+0OhF15FQNd
	 zJZQDpw3umvQg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FFB317E0564;
	Thu, 09 Jul 2026 12:45:08 +0200 (CEST)
Message-ID: <45444530-5f69-4f98-b4b7-39f8531eacce@collabora.com>
Date: Thu, 9 Jul 2026 12:45:08 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] pmdomain: mediatek: Add support for MT8196 HFRP
 DirectCTL domains
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
 <20260709084635.24912-6-angelogioacchino.delregno@collabora.com>
 <20260709090006.32D701F000E9@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260709090006.32D701F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/26 11:00, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Unconditional power-off of SIMPLE_PWRSEQ domains in error cleanup, masking potentially incorrect status mask configurations.
> 

That's not an issue. It's done on purpose.

> Pre-existing issues:
> - [Critical] Missing error handling for pm_genpd_init() causes kernel panic via NULL pointer dereference during error cleanup.
> - [Critical] Missing subdomain unlinking during probe error cleanup leaves freed genpd objects in the global gpd_list, causing Use-After-Free.
> - [High] HW_VOTER domains invoke sleepable clock and regulator APIs while holding a spinlock with IRQs disabled.
> - [High] Missing GENPD_FLAG_NO_STAY_ON or sync_state callback causes regulator-supplied domains to stay on indefinitely, leading to hardware malfunction on regulator cleanup.
> - [High] Unbalanced resource cleanup on the error path for KEEP_DEFAULT_OFF domains left on by the bootloader.

I have already fixed whatever I could, can't do the rest in this cycle; maybe in
september I can.

Also, this shall not block this series from being picked (as it also contains
important fixes inside), because those are all pre-existing issues.

> --
> 
> --- Patch [5]: [PATCH v3 5/5] pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains ---
> commit 5fec9c9afff1947a88f0033701c6c01f031caa0d
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains
> 
> Add support for the power domains provided by the HFRPSYS Power Controller of
> the MT8196 SoC. Those control power to the eDP and DP Transmitter IPs.
> 
>> --- a/drivers/pmdomain/mediatek/mt8196-pm-domains.h
>> +++ b/drivers/pmdomain/mediatek/mt8196-pm-domains.h
>> @@ -602,6 +602,27 @@ static const struct scpsys_hwv_domain_data hfrpsys_hwv_domain_data_mt8196[] = {
>>   	},
>>   };
>>   
>> +static const struct scpsys_domain_data hfrpsys_domain_data_mt8196[] = {
>> +	[MT8196_POWER_DOMAIN_EDPTX] = {
>> +		.name = "edp-tx",
>> +		.sta_mask = MT8196_PWR_ACK,
>> +		.sta2nd_mask = MT8196_PWR_ACK_2ND,
>> +		.ctl_offs = 0x74,
>> +		.pwr_sta_offs = 0x74,
>> +		.pwr_sta2nd_offs = 0x74,
>> +		.caps = MTK_SCPD_SIMPLE_PWRSEQ,
>> +	},
> 
> [ ... ]
> 
>> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
>> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
>> @@ -1071,7 +1071,7 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
>>   		if (scpsys_hwv_domain_is_enable_done(pd))
>>   			scpsys_hwv_power_off_internal(pd);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but do HW_VOTER domains invoke
> sleepable clock and regulator APIs while holding a spinlock with IRQs
> disabled?
> 
> Since HW_VOTER domains are registered with GENPD_FLAG_IRQ_SAFE, the genpd core
> guarantees their power_on and power_off callbacks run with interrupts
> disabled. However, scpsys_hwv_power_on() and scpsys_hwv_power_off()
> unconditionally call clk_bulk_prepare_enable() and scpsys_regulator_enable(),
> which take sleepable mutexes.
> 
> Can this result in a scheduling while atomic BUG or kernel panic?
> 
>>   	} else {
>> -		if (scpsys_domain_is_on(pd))
>> +		if (scpsys_domain_is_on(pd) || MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
>>   			scpsys_power_off_internal(pd);
>>   	}
> 
> [Severity: Medium]
> Will this unconditionally force power off for SIMPLE_PWRSEQ domains on the
> error path?
> 
> If a SIMPLE_PWRSEQ domain is ever configured with MTK_SCPD_KEEP_DEFAULT_OFF
> and probe fails, it appears the cleanup path unconditionally powers it off
> regardless of whether it was active. Could this lead to disabling clocks that
> were never enabled, resulting in a clock underflow WARN_ON?
> 
> Is it possible this acts as a workaround that masks the fact that
> scpsys_domain_is_on() fails to report the true state for these domains due
> to their status mask configurations (like MT8196_PWR_ACK for edp-tx)?
> 
> [Severity: Critical]
> This is a pre-existing issue, but does scpsys_add_one_domain() ignore the
> return value of pm_genpd_init()?
> 
> If pm_genpd_init() fails, it seems genpd->gpd_list_node remains 0-initialized.
> On a subsequent probe failure, the error cleanup loop calls pm_genpd_remove()
> which executes list_del(&genpd->gpd_list_node).
> 
> Could this dereference a NULL pointer and cause a kernel panic since the node
> was never initialized?
> 
> [Severity: Critical]
> This is a pre-existing issue, but does scpsys_domain_cleanup() iterate
> backwards calling scpsys_remove_one_domain() without breaking parent-child
> links first?
> 
> When this happens, pm_genpd_remove() returns -EBUSY and aborts without
> unlinking the domain from gpd_list. Since the driver ignores this error, devm
> may free the still-linked genpd objects.
> 
> Could background processes like genpd_power_off_unused later iterate gpd_list
> and trigger a use-after-free when accessing the freed memory?
> 
> [Severity: High]
> This is a pre-existing issue, but is there unbalanced resource cleanup on
> the error path for KEEP_DEFAULT_OFF domains left on by the bootloader?
> 
> If such a domain is left physically ON, the driver warns but skips OS resource
> preparation, leaving the enable_count at 0. If probe fails later, this path in
> scpsys_remove_one_domain() evaluates scpsys_domain_is_on() as true and calls
> scpsys_power_off_internal().
> 
> Could this unconditionally disable resources the OS never enabled, triggering
> a clock/regulator underflow WARN_ON?
> 
> [ ... ]
> 
>> @@ -1288,6 +1288,10 @@ static const struct of_device_id scpsys_of_match[] = {
>>   		.compatible = "mediatek,mt8196-power-controller",
>>   		.data = &mt8196_scpsys_data,
>>   	},
>> +	{
>> +		.compatible = "mediatek,mt8196-hfrp-power-controller",
>> +		.data = &mt8196_hfrpsys_data,
>> +	},
> 
> [Severity: High]
> This is a pre-existing issue, but is the platform driver missing the
> .sync_state callback required to clear the stay_on flag for default-ON
> domains?
> 
> Since the driver initializes default-on domains with is_off = false, the genpd
> core sets genpd->stay_on = true. Without a .sync_state callback or
> GENPD_FLAG_NO_STAY_ON, stay_on is never cleared, and the framework will refuse
> to power off unused domains.
> 
> When regulator_late_cleanup() later forces unused regulators off, could this
> silently cut physical power to domains the kernel still considers logically
> active and cause a hardware malfunction?
> 

