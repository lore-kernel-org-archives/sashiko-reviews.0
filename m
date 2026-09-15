Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61CD3C9EDD
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476565; cv=none; b=SyTk/gmEtOyM0gA/LW5a/i15VIs9efyZm0zAsctM4MwqDrJEOVy38Rgoml7MlAX4xJ+1Dnzkrgvy9ALjgXuSVtJnGW1vXwZZYjOD4OR63OSX8Jt3D7liLGUi/U+4MepB3y47cFbbf4aAxpdN85yQqGld7HXGPape7UXVUTUa0so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476565; c=relaxed/simple;
	bh=oP8ZBzl+K7e7S5kXo+GJljW1HAPBrtpilh/wSXvwTUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6zSRvX6/0mzBSaZ2RqbytvBV6Q83wiVVslfIS/k8N6GDkiaw5S/95JynPyMRqtPDMXMAi6l00sP7ZEarnFGZepC+z/OVYFOIUHPMMuw5pJQefLLXYKZTAMbSIYwSCzYGl0h69QU2zc8l6EJSQ8Z+LroTK3xtPAXjn1ajubyuFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ex8z5Cx9; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ex8z5Cx9"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109fafd6so335969185a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 05:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789476563; x=1790081363; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/MVO12tLI/QkQzG/oUBp0JuONjh3E/nA2a8Kxx1dMI=;
        b=ex8z5Cx98jlz2Z0JoYv4SPq8KjyLrdpjdRgDUd/i9IA9Z0mLyU+luWMm4iI5WeZimy
         HVXgO0j6H4W8MU/PkikrPi26QU2lavH210BFjHLISACyZyLzFza7jGn/BWbPGUk/UP7n
         grCyZcluKNCH1I9Pz2ogdO9X1/aPiKvLIGHCGGg4xngvfIFFVRDWO7HxPB/yU2zQ7ztE
         uSbvgGeHi4hZfQgoqvUzADypwbmq00k0dbmDMiP7Fvkdd0aWF4+98f0OecFaWfKDr1jW
         Ik7/6se1w2LOdHpti4GKZPsCNNXYBB9V0+kHSClZk8cccLUAzfUafabequbR+mNS7vEW
         eBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476563; x=1790081363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/MVO12tLI/QkQzG/oUBp0JuONjh3E/nA2a8Kxx1dMI=;
        b=w4gqHSxcj/xqJt9D0af1vLWqYOq6MLiQbOqcAcVWUxu3YexvC80fJaA0CkzSQibyqJ
         7QAulpE3AxjIPcBf16wsd6v5iX5pq+Q2iVKKvMQGFNl3NdmJDLNZr9CSlqf+vRmrXO60
         ixiwFbE0L8MavYDGuKzsTodXjB33MtIEJRCD/IohNptHiu9k0YZm7Wu0/TUir3n0sHSm
         MNOZGKuQZ7OCIARy1DAHjlR9I9V3U84yRFcHb7RPmNNiEz+YbelUJst8rGhRtdj3uQW+
         tW/JZaNUL5XwauwqpIR728in8PTuEeX/ypBJqkcjcQc4YMf7xkZ0su+1Ycw72B+tdf3/
         /CTA==
X-Gm-Message-State: AFuF++nKB3vqgrN4rDs5TgS2I8JTZGRXSTCDISjgy3jVqpoQhM8DV9Hl
	8ZJy6NxtOxUvuwLsPNRS4W0h5gjHWhjkFhU9dV0s1DIC+GJR7phBLGHF8GTh58khyxzA98nDjue
	SM8cHsz4=
X-Gm-Gg: AYBFou25C0bJXC4y5T7zhnGs0ruhH4rRFXfuzhP7HTWtDJ24VcX8VLRfzYbFYnZDtsr
	zO8vbIb4yM6IubS896PTkNRPjyKWcuwurLoWWW258Hf/FcRZ30KRNTP7FHx8bcDar1/Mwgd00NM
	ebBjgxffeYollp3q/Fw1ozj/i5gx4UW6+ymE+AhcjHFOEiQ5FdeD0W6L0kKkJVeJ0hhrfdrz9tX
	jxiTWknqv489JZHyc7G3FgCWkrakdbiiXvcCJ3/ysuTDn2eOWLYq+zAZqwjAlMyuknikTv8ug+1
	c+HbwtTRs/EjdGepMrHWIuEqUY5ywHt52ISOxeBM8BalxsEn9gEUr7vnNkHP84PwaJ1tD4J7BGh
	R3iF6cbA+z+Dcx8PcdBWuYmlUCuid5eVKZCptnIjuRJe3Cetilrp3sQnr+UyNenr9+/jowDPIgG
	3SKRD+/Bibqt3rWKxNi34bjMZI1u1QSaXpymYecnRUiWnhV4Daz8cf/uQ0jCZUrWrAfkx/dwc=
X-Received: by 2002:a05:620a:1a29:b0:939:6ec8:6928 with SMTP id af79cd13be357-93a2985d5c8mr1045812685a.16.1789476562792;
        Tue, 15 Sep 2026 05:49:22 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a382ab7b3sm169560185a.19.2026.09.15.05.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:49:22 -0700 (PDT)
Message-ID: <7b85bdf3-d3d3-4e06-964a-3e5e969691da@riscstar.com>
Date: Tue, 15 Sep 2026 07:49:21 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: tc9564: introduce base PCI driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260915031038.1087264-1-elder@riscstar.com>
 <20260915031038.1087264-3-elder@riscstar.com>
 <20260915032059.60CC61F000FF@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260915032059.60CC61F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 10:20 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] misc: missing of_platform_depopulate() on probe error path
> - [Low] kconfig: unused REGMAP_MMIO selection in TC9564_PCI
> --
> 
> commit 526cbf40d582cb34a1f4613745e5ca7890f929d2
> Author: Alex Elder <elder@riscstar.com>
> 
> misc: tc9564: introduce base PCI driver
> 
> This commit introduces a base PCI driver for the Toshiba TC9564 SoC, which
> implements a PCIe switch and Ethernet AVB/TSN bridge. It performs basic PCI
> initialization and uses of_platform_default_populate() to scan and probe
> child devices defined in the devicetree.
> 
>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> index 7364931dad3a1..91950d2928f07 100644
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -568,6 +568,16 @@ config MCHP_LAN966X_PCI
>>   	    - lan966x-miim (MDIO_MSCC_MIIM)
>>   	    - lan966x-switch (LAN966X_SWITCH)
>>   
>> +config TC9564_PCI
>> +	tristate "Toshiba TC9564 PCI function support"
>> +	depends on PCI
>> +	select REGMAP_MMIO
> 
> [Severity: Low]
> Is the REGMAP_MMIO selection required for this driver?
> 
> Looking at drivers/misc/tc9564-pci.c, it does not seem to include
> linux/regmap.h or use any regmap APIs. Could this lead to unnecessary
> kernel bloat if the regmap infrastructure isn't selected by other
> configurations?

This was an oversight when making the conversion to the endpoint
bus.  This driver no longer uses regmap, so that dependency will
be removed when version 3 is posted.

> 
> [ ... ]
>> diff --git a/drivers/misc/tc9564-pci.c b/drivers/misc/tc9564-pci.c
>> new file mode 100644
>> index 0000000000000..d7ebbd90d1584
>> --- /dev/null
>> +++ b/drivers/misc/tc9564-pci.c
> [ ... ]
>> +static int
>> +tc9564_function_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>> +{
> [ ... ]
>> +	/* Scan for pci-ep-bus nodes and probe their sub-devices */
>> +	ret = of_platform_default_populate(np, NULL, dev);
>> +	if (ret)
>> +		goto err_clear_master;
>> +
>> +	return 0;
>> +
>> +err_clear_master:
>> +	pci_clear_master(pdev);
>> +
>> +	return dev_err_probe(dev, ret, "failed to populate platform bus\n");
>> +}
> 
> [Severity: High]
> Does this error path need to call of_platform_depopulate() before returning?

It looks like it does.  I now recognize that of_platform_populate()
(called by of_platform_default_populate()) does not unwind and clean
up its mess in the event of an error, so doing that is the caller's
responsibility.

I will fix this in version 3.

					-Alex

> 
> When of_platform_default_populate() fails midway, it leaves any successfully
> created child platform devices registered and sets the OF_POPULATED_BUS flag.
> If we only call pci_clear_master() and return an error here, devres will
> subsequently disable the PCI device completely via pcim_disable_device().
> 
> Since the orphaned child devices remain bound to their drivers, any later
> attempt by those drivers to perform MMIO accesses on the disabled PCI
> device could result in PCIe Unsupported Requests (UR), which can trigger a
> fatal SError/MCE on many architectures.
> 

