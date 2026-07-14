Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BFF446856
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044182; cv=none; b=Upeqr4nQBw3FyNkLUPtC6f3EPeebki3hhvwf+m/G8xUHAMeTXBcZEtrejw3YZZQrK9Y1yY9bUdhuu7xKKcovzSqia7qmoiTe8pPljyK/fAg4ercON9Z8ugmJttEBiAn4uHXlgnw9Rf2Zc8DFB3qsA2XuRHCSxb6Q4a61Fg8kAFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044182; c=relaxed/simple;
	bh=y4A4B/6MB53D0FTs1YY8wyTfSg8Z3B4fABc9uvx/R3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDxHMiyCSODeeaFp9jfq/k2iUVTqaXAv3cAO+k/yxnr7o/iv5rIU85+QXU9/Kz+ZKRnBWcpdfy4wREqzKH2pV4kwyPsWUx5JlkIKxl5n3ssQ8GjViScUJOiSI4xTBxEWgwj0BxHm7UnOGbTOPernbTAjXywfUrXMAcm7OwVJSmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZ+NdrCs; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZ+NdrCs"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-381191ea2adso2871225a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 08:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784044180; x=1784648980; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZHg6oFBwAWkW2KyyNW/CKB7svJXrY+dklfdjqSj+/fQ=;
        b=bZ+NdrCs5/Hy5vSYHknkM7fO8lIQNrfB8Spv1ZxOlUPK8FuZy+suo1MDJLF2MkwUe+
         E6vcjJDUGrvcfnEi2wbZVwqkr5e6DyYXDCSHWiPuo03ts99U7Mbis2KJ+LGK9fTvsjWg
         RIx1uF+minNGSt3PvS6Dl6FPlmfsI/faSTDQDBCUuwhcFjlLcbC4COlubUEg8P+PpuPv
         AFcEcfEJd0WcJaiishDBRCTatMP4CxpcZmdIyVEqKeMej/n97OrUMmbwJPKFurcHdcZX
         kC/Ivnj1I1qa6A+sm7qsh3IscsiIX4jMapLVnCe956P/EN0Wa096BAjWrBQDL9Atbv+0
         VuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784044180; x=1784648980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZHg6oFBwAWkW2KyyNW/CKB7svJXrY+dklfdjqSj+/fQ=;
        b=MrHdXGfktulQHaNqnhGhUkl03r1RZpdU9iOCZBxIBVbuoJ+cFiYj88EaSQd4f0rml8
         duHs9pY8W8hlaEMA8YKgPxJ9j2NrOA5yWa7EKJoJLEkekrGnwm9WZ5qwrCohtG5GWQCi
         QlakdipVqD4FAgMyNFeTVhZMo5bkXh9/kbMDLdzuduuTHnv1V+deukcPNXaxhwnuKEK3
         urDGZhkAhue2wSjkfR8N2tCH60cj3kvJMNksMoss9YWQJgRqUpv59fwOPcGEzKlYCNAy
         U+5gp/H75IjJsDd1aMK2QQnoLo6OTCuUHlGc31DC1FibEaPwR8qs444OnJe5mJcFiD0D
         MVbw==
X-Gm-Message-State: AOJu0Yy8fiTfo0adE9RaqYw8NycYL7VYZ4+BLfYC+rVga8NwwiCtLcAO
	DevUic13rkCr/bBQ6eEiLkWnITXTe0/mGRlJsPD8Utpb1lzAtIqVdJNmTGfhe8x5
X-Gm-Gg: AfdE7ckY1Wq3ZTenVna+FPzKFpsw3/LYBJp23wtEE9qETmMiMM2XCq31+d/8c3LjOH1
	gfBrt1q/VTdiWS+2jkjqx1l/QZexaxWiFO4dn8dmPERuj5MPKAI31pXja198bMZuKxGMIV32Ik1
	GZlYfXD6hlMMLy8qIQ89qgDM16+ullMDJHmJrLCsPnjKWPX+rKSUSp9YJiSaiP52v4nrQkbUpqS
	gj1m4taX0gJs5YQgbMPmWcprfhYpINreQwafLSUsB9/9udvDMSeerwIsqCTPPocbROmp+Ww25d+
	nblBwYMnhSwUWTSks7gFPODdtq17bjPUk3gcpA3ogRoSqe6LHOFLbSTT1xoAsC4izQwQbifMrnJ
	y1835bBksekJxF/kFWVYqhSFoBA42fkpErgWt+rPIPpUgLuS+DcZgqaN8MzejGypw4PYm7UjPew
	obIC6t8JxD6vSky7lXZnXFe0Kx
X-Received: by 2002:a17:90b:3951:b0:37e:b6a:6cdf with SMTP id 98e67ed59e1d1-38e17e44414mr3677898a91.20.1784044180273;
        Tue, 14 Jul 2026 08:49:40 -0700 (PDT)
Received: from [192.168.101.113] ([182.180.105.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e174440edsm1731165a91.12.2026.07.14.08.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 08:49:39 -0700 (PDT)
Message-ID: <4502b089-3625-445a-84a0-bee74735f7ac@gmail.com>
Date: Tue, 14 Jul 2026 20:49:34 +0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: starfive: Fix resource leaks on error paths in
 host_init()
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
References: <20260714113029.326207-1-alitariq45892@gmail.com>
 <20260714115343.4D49E1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <20260714115343.4D49E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

This is a separate, unrelated issue from the submitted patch. I will 
work on this and will submit a separate patch.

On 7/14/26 4:53 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Use-after-free of IRQ domains during driver unbind or when probe fails after interrupt initialization.
> --
> 
> --- Patch [1]: [PATCH] PCI: starfive: Fix resource leaks on error paths in host_init() ---
> commit 64603196409722c49e238cd53d9d6a6b7efd0b22
> Author: Ali Tariq <alitariq45892@gmail.com>
> 
> PCI: starfive: Fix resource leaks on error paths in host_init()
> 
> This commit unwinds previously acquired PHY and clock/reset resources in
> starfive_pcie_host_init() when subsequent initialization steps or regulator
> enablement fails.
> 
>> diff --git a/drivers/pci/controller/plda/pcie-starfive.c b/drivers/pci/controller/plda/pcie-starfive.c
>> index 298036c3e7f94..86b248a1ea758 100644
>> --- a/drivers/pci/controller/plda/pcie-starfive.c
>> +++ b/drivers/pci/controller/plda/pcie-starfive.c
> [ ... ]
>> @@ -303,13 +303,19 @@ static int starfive_pcie_host_init(struct plda_pcie_rp *plda)
>>   			   STG_SYSCON_CLKREQ, STG_SYSCON_CLKREQ);
>>   
>>   	ret = starfive_pcie_clk_rst_init(pcie);
>> -	if (ret)
>> +	if (ret) {
>> +		starfive_pcie_disable_phy(pcie);
>>   		return ret;
>> +	}
>>   
>>   	if (pcie->vpcie3v3) {
>>   		ret = regulator_enable(pcie->vpcie3v3);
>> -		if (ret)
>> +		if (ret) {
>>   			dev_err_probe(dev, ret, "failed to enable vpcie3v3 regulator\n");
>> +			starfive_pcie_clk_rst_deinit(pcie);
>> +			starfive_pcie_disable_phy(pcie);
>> +			return ret;
>> +		}
>>   	}
> 
> [Severity: High]
> This is a pre-existing issue, but since we are fixing error paths in the
> host initialization, I noticed a potential use-after-free in the related
> PLDA host initialization code.
> 
> In drivers/pci/controller/plda/pcie-plda-host.c, plda_init_interrupts()
> allocates the interrupt using devm_request_irq():
> 
> plda_init_interrupts() {
>      ...
>      ret = devm_request_irq(dev, event_irq,
>                             plda_event_handler,
>                             0, NULL, port);
>      ...
> }
> 
> However, on device removal or if probe fails, plda_pcie_host_init() calls
> plda_pcie_irq_domain_deinit(), which explicitly removes and frees the event
> domain:
> 
> plda_pcie_host_init() {
>      ...
> err_probe:
>      plda_pcie_irq_domain_deinit(port);
>      ...
> }
> 
> plda_pcie_irq_domain_deinit() {
>      ...
>      irq_domain_remove(pcie->event_domain);
>      ...
> }
> 
> Because the IRQs are devm-managed, their cleanup is deferred until after the
> driver's probe or remove function returns.
> 
> When devres eventually calls free_irq(), will the IRQ core attempt to
> deactivate the interrupt using the now-freed irq_data->domain pointer?
> 

