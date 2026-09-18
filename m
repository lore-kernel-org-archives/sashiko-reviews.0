Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F52E503901
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747355; cv=none; b=GWq2RrwHNqbRspn9zl1ZQkCMvGL+6na5dI3ShQsEyr1rZuEkjlGhX1JeqMIlQLCiDSZ3K4KjrRsm5B1J8nrSve6oVJHoq+Ve5N1dpi4OGWfneTOw0f+YxH4FGVtIgdr93dV/QXjZ8jaZq2LsmYl24FHXuwEujv62gE9RrgzBizw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747355; c=relaxed/simple;
	bh=ku4iBMP7GjjCjtOQ2BCljXzZcT3llCc8TZkAx0mwSsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tur0BTJX9GA/5lyGnKFarK2luIXkxaXVP16gemgFv3qnDgHlkID6jCjL/yAFYY14OexFzKoSnWMb2QbUbO9Ypf7GiTtN32YzD/51LRijgFP0HF54etjLv66XdztZvV3u6KDyZOMubVSX4MITJzLi9DltSmvNCnEOA2Dd0zDsDAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=XsJrHD9r; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="XsJrHD9r"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910ad20d4so102393385a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789747352; x=1790352152; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7eVbXMCDUQbHUQM6+WwRJ+hjMCQbS6dliJooLhO6lxA=;
        b=XsJrHD9rP38/pyXw9f1fkPjRXC5XEl+1E3h635ns14NB8gBMfl3BUfK5Ne7J2UJ/3g
         SHBk05pU41xXiug1rS2buQdz3imO7W4skFBtbaW8PKdiieeQU5jdFxowL2CWdVn/pYQw
         Y3HMwnL0IYUHGxNWX9pMMFNOACipYSA6AE5zc7nRItEWez8+5K8Pyh+HKz5RuVx9HJig
         FnSNBCu/dx/pBKAknhuCkUP1PF5FEjbULYCYhJtVFhhR/J/BMBV0ZzZm9RaPDhlmnc74
         Ano5J8eLkB2Xd3IJDhlo58Z3frBMHdKt36pATAyRAlm50TylGdYe6KmwIyDQ24BwNRFg
         FshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747352; x=1790352152;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eVbXMCDUQbHUQM6+WwRJ+hjMCQbS6dliJooLhO6lxA=;
        b=pXEK54SXeqXDUZg2j2EUSIOZkt4p1wOk6uZv11dbuJdHT1U0pBq5xLidcNhfFZsrhJ
         AywClrCXA9lFtiNSTnlRtiJWuHj7sLDOf7fAew/HoQ8qMMGsG8HpsP6lq0j/lkVxdtC2
         s91E6Voyw4MDaheN1VAd8bJbgsVWr63HPqEdFy8S5FLf1yLMvil1WR68/Sm87bgA0Y+m
         vjBlNYhwGMrWmAVnLCVntrZn9z6tgfk84a9IcsbXx9onF4DhegzX1zEi/pLkIXXb0odG
         TjwmuKfTXvIxf00z5benoJQ9LUZ8JizrD6fA9A+mGyxApV18GRclJI04A9k3+k7+TZun
         i7mw==
X-Gm-Message-State: AFuF++k0/w83rINBxp60dcN25TLv+FLOXCuagIO7cnH1M/AtpiOTGyL4
	YeHgRcumqvYDzL2dk1O6bzY18fTEYF+vLahtlZtRaeWzxqyXL2iQum17oq8YGl2XQeQJDvIkr6h
	sXzA3e1U=
X-Gm-Gg: AYBFou0CDDqroLao8CEu+JezgMmyUzKeMr6y9sFThkzgZsUMeQGHVVTA1BnCrDwcYa/
	1R6PmgAIvMVWPXuKU4ACKShvbYFlGF8zK4nAMS/yx5BCyqBoiSZHp/qQd2WRkIylf+OZzMJy19Z
	lLqgofFI5bpUxKym2EMgCgbdD8mO4t0WdAie9pmBff5E54VTC2bPPbik8JmYLgukJJvV9FJ4PAg
	PbhfziGoUL4WRCO3EttrJZsU42LNhrcZkjCjL2CcWkxTr8UCwDncvzox0GDfK0faFyHOK7HZm75
	44c/WIbwtCBURcImJtXcqcrqLzrbusQH7jHFYwfPGUCjxNCTUmNS/tgQxtCJYgEG/BOnVno0qM1
	nFYeCpUrDMorb9TUsVuOHY5UhaioR1GTYhl4QNZyNBNr9AKUVJlswYJ8JM7usoS5rgv4Flwj3mQ
	VwfipRn6z/m5HfZ72EAIlVdKBcEKBrD/qrOyjPsrAAFqjoUQcKVdpZeTqEj3XXsZ0MUqKSrfA=
X-Received: by 2002:a05:620a:2a09:b0:932:df7e:b31d with SMTP id af79cd13be357-93bdc6d43femr428844085a.12.1789747351794;
        Fri, 18 Sep 2026 09:02:31 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0e9ead7sm169853585a.23.2026.09.18.09.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 09:02:31 -0700 (PDT)
Message-ID: <0762c249-ceed-4b06-8a39-990d92a97ebf@riscstar.com>
Date: Fri, 18 Sep 2026 11:02:30 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] misc: tc9564: introduce base PCI driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260918152659.413268-1-elder@riscstar.com>
 <20260918152659.413268-3-elder@riscstar.com>
 <20260918154230.E8C2B1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260918154230.E8C2B1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 10:42 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] pci: of_pci_make_dev_node quirk fails to update ranges of existing DT node

This series depends on another series that affects the
code that is the subject of the above report.
  
https://lore.kernel.org/sashiko-reviews/ed783639-05ed-4ad9-b881-d1689a8b2418@riscstar.com/

> - [Medium] kconfig: TC9564_PCI selects PCI_DYNAMIC_OF_NODES without inheriting OF_IRQ dependency
I attempted to include this but wound up with a report of a circular
dependency when configuring the kernel.

A bit more below.

> --
> 
> commit d693efad7a099f6326c4b836ade779f0f07366be
> Author: Alex Elder <elder@riscstar.com>
> 
> misc: tc9564: introduce base PCI driver
> 
> The Toshiba TC9564 is small and highly-specialized SoC that implements
> a PCIe switch as well as an Ethernet AVB/TSN bridge. Create a new PCI
> driver under drivers/misc that binds with the embedded PCI endpoint
> functions within the TC9564 SoC. Use the PCI quirks mechanism to update
> endpoint device nodes dynamically.
> 
>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> index 7364931dad3a1..9c5b1e9d672e8 100644
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
> 
> [ ... ]
> 
>> @@ -568,6 +568,21 @@ config MCHP_LAN966X_PCI
>>   	    - lan966x-miim (MDIO_MSCC_MIIM)
>>   	    - lan966x-switch (LAN966X_SWITCH)
>>   
>> +config TC9564_PCI
>> +	tristate "Toshiba TC9564 PCI function support"
>> +	depends on OF
>> +	depends on PCI
>> +	select PCI_DYNAMIC_OF_NODES
> 
> [Severity: Medium]
> Can this cause a Kconfig unmet direct dependency warning?
> 
> PCI_DYNAMIC_OF_NODES explicitly defines 'depends on OF_IRQ' in
> drivers/pci/Kconfig. Selecting it here without inheriting its dependencies
> could cause unmet direct dependency warnings and potential build failures on
> architectures lacking OF_IRQ support.

I attempted to include "depends on OF_IRQ", but that led to
a circular dependency, so I simply left it out.

> 
>> +	select PCI_QUIRKS
>> +	default m
>> +	help
> 
> [ ... ]
> 
>> diff --git a/drivers/misc/tc9564-pci.c b/drivers/misc/tc9564-pci.c
>> index 0000000000000..e4d00dfecfca9 100644
>> --- /dev/null
>> +++ b/drivers/misc/tc9564-pci.c
> 
> [ ... ]
> 
>> +	/* Scan for pci-ep-bus (simple-bus) nodes and probe their sub-devices */
>> +	ret = of_platform_default_populate(np, NULL, dev);
> 
> [ ... ]
> 
>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>> index de9bbccda21fd..54e310c4153df 100644
>> --- a/drivers/pci/quirks.c
>> +++ b/drivers/pci/quirks.c
>> @@ -6391,6 +6391,7 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5020, of_pci_make_dev_node);
>>   DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5021, of_pci_make_dev_node);
>>   DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_REDHAT, 0x0005, of_pci_make_dev_node);
>>   DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, 0x9660, of_pci_make_dev_node);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_TOSHIBA, 0x0220, of_pci_make_dev_node);
> 
> [Severity: High]
> Will this quirk successfully update the ranges property of the existing
> devicetree node?
> 
> Because the tc9564 device has a static device tree node, pci_set_of_node()
> attaches the static node to pdev->dev.of_node before this fixup runs.
> 
> Inside of_pci_make_dev_node(), the early check for an existing node:
> 
>      if (pci_device_to_OF_node(pdev))
>          return;
> 
> evaluates to true, causing it to return immediately. Consequently,
> of_pci_prop_ranges() is never executed.

The series mentioned above changes this exact code so that instead
of returning immediately, it first checks to see if a non-bridge node
has a pci-ep-bus sub-node.  If it does, it generates a new ranges
property for the endpoint and updates the devicetree to use it.

					-Alex

> 
> This means endpoint platform devices populated by of_platform_default_populate()
> in tc9564_function_probe() will fail to map their MMIO addresses correctly,
> translating addresses using the placeholder static 'ranges' property rather
> than dynamically assigned PCI BAR addresses.
> 

