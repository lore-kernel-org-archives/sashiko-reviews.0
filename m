Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C153932E1
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 20:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791835711; cv=none; b=l0H88VUSjaRIxiqK3sswBraeojgMGBhMoPEYmpOq+VYfAi+wp99rrgCGpYlG7pae/JbCcuUNFl0YF8kUf41SF1aDiZiCPjmIdwvjJwFdak8Raa9gHk5rWdCYQG3RdvDLmB1Dqd256T/29S5xbuEToEJ6ryRLh6wsi4yeEXvTyl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791835711; c=relaxed/simple;
	bh=rPnMt2OvMjbauraFbA9rqSmKaNh2YMlNLEXqaXkVwYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrLdbpuLp27uiCebuV0DHJvp1VhTKl8tfYWT8mY+mzJ6UUr8GPM5R3ajqd7rLd3Pcw2WqQKN9FlUpeVgTH5MEWkG2I0TbkHP77Y/aTPPZubBO5rvtrWZKhVCRMqxMLsI0vDAjbHF3xbA7grHE4JdAUWauSyV28OUyE3NThDRc+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=kBMstOth; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="kBMstOth"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91b83459526so13054396d6.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791835705; x=1792440505; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVeb1DRT1/koUGF1YlAGpw2tWQcxrHh6cQ2sSq97qiU=;
        b=kBMstOthpNpU9j0HhWPzPOr0dWa0HDcDbXHJRqvJA4qiFQQAW0rJFWuizj7DOGWjh6
         ZyFsj5Nq6kHkr9rOB3ouSJNZHbmcq2Ki2YUhXwYXf7/bGBj0SBT7kVFPtFHMSvfODNtG
         ooTuIDDCrKOry1+yPSvC0TlrtJHUfnD91LpnzeJLZsXZCiMjBfwv8tVvxKoOVIujNqPF
         GmsAPHB97Jzc2TTeIb9mCtl+RFq5mE71zpwzhvpYArAsV9QnX2aXFjqqyT3o7IZ6RkjH
         oD7d64v+7VbOz8zCNyLQ1fOZS3YSTM9qY7RUN2oPGCT3IdatUbLknrzVvuEiC7vIN866
         j+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791835705; x=1792440505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVeb1DRT1/koUGF1YlAGpw2tWQcxrHh6cQ2sSq97qiU=;
        b=vVFvauNgCPcDFlMMolTBIjrUHpMTMbyzU0lKzFU/4AQCswvafXISsfXqxkQILzo2E+
         ViFa2WIegg9OxCR3r59k0dbQY8Ko+2vEd7XXQtAkbD1BvEFG/iWMs6jyr7rUdAOJmkRn
         0jB5uGKPd1pSnZHJUJMS3dCVaTsMVHCCWmoRjHOPU94vXL8MOEZbMTJf+4WqmyPvGn8I
         a3iBq86XhnnEIRuSvTrd/2SlQ7cI4o5pRFVa0a63oiqQGlkocLpDWJyltQAwRaEXQU7C
         4hBIVTcL1L8O1i/7tIMf2aacNzrtmAFJlXHc1WCmKf4LYlbhXD0Kc0a8y9/ZZN1WDqrT
         d/0g==
X-Gm-Message-State: AFq9FYJUZhT4TVuJQbjF0Md/XBkWYTgPaNezRWsTfY2dDBy+/42L5QTX
	2LgAzc/kLfqNeWLwt039bBw1uWLgFuZcySuJZJVc7skBgaHs9sNr1wfg1Ja+TxO1C2oLjRmwJ5I
	v+e3TAk8=
X-Gm-Gg: AYBFou2lNTmbmfI175jtHTEtQ5JlcruWuBiC5sa/bKYiMpy2u9r6fkI0CsAk3OWGQzZ
	XiLo7AMK0Ya2kjAudM0eAZ6ZIwHOR5iVtzNlsKg2Bm7Jxp/s3V7jMHArwtfaQVUd+iOum5B7AGq
	dh1CuS+etG8c7wqaoMSBXhBlXywJUaMr7LqEQ1cE2QiXcGwdhZrTVOIxoP16Itu5Gpom3AidTbm
	Cm/5N9kVdEWPhuWVcnuffqlH3GcyUFByaEod1dMB9BB4+fkfjhuTGGlX/JVk+jX40yQSFtZeTtz
	BOMkgY03+mreSdN+oEfSCTMKzHPwSQdwZiStVqTBAMQAAfZ49mkbeg7dYzh4JgFJ9TCZVc3OLV2
	k8ooIupPA4Dk39njAn1Z/E8jhlD6kEctMV7DTAj+5p+yeyvxva7qsUPQr6xx6B6eOxhD0C/ckeP
	rVJozM36EV1PZBbdP6pYDBLFT43uoJdIUDmxKGLflJJxowGqwJx9PkDCoh80/0l0h0wEqBLok=
X-Received: by 2002:a05:6214:5c01:b0:91b:5d3b:4abe with SMTP id 6a1803df08f44-91b5d3b4db1mr177681526d6.51.1791835704998;
        Mon, 12 Oct 2026 13:08:24 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c35bfcsm6216306d6.42.2026.10.12.13.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 13:08:23 -0700 (PDT)
Message-ID: <5d035beb-b5da-48f4-be03-01500110ba89@riscstar.com>
Date: Mon, 12 Oct 2026 15:08:22 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] irqchip: introduce TC9564 SoC MSIGEN support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-3-elder@riscstar.com>
 <sashiko-outbox-168574@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-168574@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 2:16 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] irqchip/tc9564: uninitialized stack variables info and dgc_info
> - [High] irqchip/tc9564-msigen: Use-After-Free in handler during module removal
> - [Low] kconfig: TC9564_MSIGEN depends on hidden symbol GENERIC_IRQ_CHIP

I think all three of these are legitimate issues, and I describe
below how they'll be fixed in the next version of the series.

> --
> 
> commit 3dfc2bc2208f270b240c50f9b867c34c54af58e0
> Author: Daniel Thompson <daniel@riscstar.com>
> 
> irqchip: introduce TC9564 SoC MSIGEN support
>      
> Define a new irqchip platform driver that represents the MSIGEN
> functionality present in the TC9564 SoC.
> 
>> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>> index a8f8c423b7957..205b5a167c805 100644
>> --- a/drivers/irqchip/Kconfig
>> +++ b/drivers/irqchip/Kconfig
> [ ... ]
>> +config TC9564_MSIGEN
>> +	tristate "Toshiba TC9564 MSI distributor"
>> +	depends on TC9564_PCI
>> +	depends on GENERIC_IRQ_CHIP
> 
> [Severity: Low]
> Is it intentional to use "depends on" instead of "select" for this hidden
> symbol?
> 
> Since GENERIC_IRQ_CHIP is a hidden boolean symbol (without a prompt), using
> "depends on" makes TC9564_MSIGEN impossible to enable on architectures or
> platforms that do not already natively select GENERIC_IRQ_CHIP.

When I used "select" for GENERIC_IRQ_CHIP, there is a recursive
Kconfig dependency.

error: recursive dependency detected!
         symbol GENERIC_IRQ_CHIP is selected by TC9564_MSIGEN
         symbol TC9564_MSIGEN depends on TC9564_PCI
         symbol TC9564_PCI depends on PCI_DYNAMIC_OF_NODES
         symbol PCI_DYNAMIC_OF_NODES depends on OF_IRQ
         symbol OF_IRQ depends on IRQ_DOMAIN
         symbol IRQ_DOMAIN is selected by GENERIC_IRQ_CHIP

If I instead simply omit "depends on GENERIC_IRQ_CHIP" this
circular dependency goes away.  I can rely on TC9564_PCI
to (eventually) cause GENERIC_IRQ_CHIP to get selected
instead, so that's what I'll do in the next version.

>> +	default TC9564_PCI
>> +	help
>> +	  This enables support for the "MSIGEN" MSI distributor embedded
>> +	  in the Toshiba TC9564.  This device receives wired interrupts
>> +	  within the TC9564 and raises them to the host using MSI.
>> +
>>   endmenu
>> diff --git a/drivers/irqchip/irq-tc9564-msigen.c b/drivers/irqchip/irq-tc9564-msigen.c
>> new file mode 100644
>> index 0000000000000..a27edd5859e43
>> --- /dev/null
>> +++ b/drivers/irqchip/irq-tc9564-msigen.c
> [ ... ]
>> +static void tc9564_msigen_irq_domain_exit(struct irq_domain *irq_domain)
>> +{
>> +	struct tc9564_msigen *msigen = irq_domain->host_data;
>> +
>> +	irq_set_chained_handler_and_data(msigen->irq, NULL, NULL);
> 
> [Severity: High]
> Does this missing synchronization lead to a use-after-free?
> 
> When the chained handler is set to NULL during module removal, it doesn't wait
> for currently executing handlers to finish. If tc9564_msigen_irq_handler() is
> running concurrently on another CPU, it might access the irq_domain, generic
> chip, and unmapped register memory after they are freed by the removal path.
> 
> Should this call synchronize_irq() to ensure the concurrent handler has
> finished?

Sounds like it should.  I will investigate further, but presumably
this suggestion will be included in the next version.

> 
>> +}
> [ ... ]
>> +static int tc9564_msigen_probe(struct platform_device *pdev)
>> +{
>> +	struct irq_domain_chip_generic_info dgc_info;
>> +	struct device *dev = &pdev->dev;
>> +	struct irq_domain *irq_domain;
>> +	struct tc9564_msigen *msigen;
>> +	struct irq_domain_info info;
> 
> [Severity: High]
> Could these uninitialized stack variables cause a crash?

I missed this.  Yes, the info structure is (further) initialized
in the code below, so it should be initially zeroed.  This will
be fixed in the next version.
	
					-Alex

> If info is not zero-initialized (e.g., using = {}), fields like info.parent
> will contain stack garbage. When passed to devm_irq_domain_instantiate(),
> could this result in dereferencing a wild pointer in __irq_domain_instantiate()
> if CONFIG_IRQ_DOMAIN_HIERARCHY is enabled?
> 
>> +	struct reset_control *reset;
>> +	struct pci_dev *pci_dev;
>> +	struct clk *clk;
>> +	int ret;
> 

