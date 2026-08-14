Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE9148C8DC
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 16:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786726525; cv=none; b=G0nfpoxDGDD8Y34qjwEpJgLA+T+Gt9OM0J43UvP+kNjkqovfizL1TWluezkQ/vd3w6DQ1QDtJYgG8WQuwl8lQOaUyrSTeKIbsSG6939stlI2gYrnoeel0HB7ngy23spS5tC9ASIBBHfd6QqWeo2F7bDgF6YUAguHeRRYCbFhpwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786726525; c=relaxed/simple;
	bh=U2Fi0fUXcyr4ajuyQ+1SJVPQMJSslUm4IcWpXw2vM+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=odrB3+fVRJg77jK2hKT2lnBOc54j9YI1gmkoA/XCdeq3YaSQ/yq8kDYPYn15Y/pFH9HvJFXSC747GUql0W63Z6w7JmPYhub5C5wujwzlKZBj3tr1uKbtOUSh1yBACXqcHWAzb3geuELfjNeX+mefqg2h9Irh59n6u2fEjuSxk1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=B4Kegrnq; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="B4Kegrnq"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52b4e988c77so8906701cf.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 09:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786726520; x=1787331320; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fUO4WpkJvelzuWRr/Cxlr530ZgjlNYPQtPN5heFg2w=;
        b=B4KegrnqBk9VJZhuGHs6//ByaPQDw8ZH9pFV4LfvA7nBwM3e64oWdVa8B1/+QYzxc7
         jseTu8SbYAPv3yXXAyF8hVg5ldbgTtKpQu878zKUAmBTSZjDFdAanEBc2u+Ws5ezz8iQ
         G4xf/ed4vwqKKeqvZjX602oZs3kk6DunPEgrqhSgjUdJgTQuiiGtyIlkhlaiAVDfyuHJ
         q30JbvK4Zylh37AfqniK6NhpGBNBTdVAhOmH+ufTwbeI/RybSXsmH+wKiXefFHUK8ukb
         9rlyCBxAiLyjYeQInpkk4Ii+XKHmvORS9/P3v8waz1NOxNR74Ho6aDfKbIv/VGHR3y3V
         iBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726520; x=1787331320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2fUO4WpkJvelzuWRr/Cxlr530ZgjlNYPQtPN5heFg2w=;
        b=QCnv7zff/M7a+Lj/SbEsHDQnHmNR2w0VOeqFzCXQYlHUrbT+ilSYl023BzweLB8xlz
         Bog7kY46Ae/eayflaigrApwBzXdNMJK1NgeKWq8fb/PCaLyzvBqZRlqcN99yFGTcUTc5
         7/OrLG3Af6g22eZKLxixcT638FcVtWhUHcUivOzX/tD47HfCGO2re9wWz5mqNDryeXXr
         EH1QhogCt0Aeuh1QevYqHAnM/ZJBs88ygDXBCLwOw7+b4r6rJZ25dxVb0gUYnoZhxWGq
         et/kYTDGKoOXADjZ8t2H7/8cvX2PAAFUOoDXToqiSW7gG/PelGEoGhBMCNR4VBdV5o+6
         LAxQ==
X-Gm-Message-State: AOJu0Yws0XJyFhSwcS0JbeqU7Uhr4zZrJZ3urjk8tqXZSY227nKLbx8X
	p28s2DzSDPaThkyejxR6LBRWt7Eb6QbPLchJDd4is3U7g/XY/XrEImQJcrQ7Sfi1UD3F7lQ8PLV
	/ESl0CEU=
X-Gm-Gg: AR+sD10HBgtDKhArG9PRNYTTGTCI4atWt0eIRR+JfjrZNnF7mJr1HBOt3Y0AVsgKB8p
	4NOP3cyZHDW/XPUglCww9dYhM6213xc097o0zMhGfn5q6d3cuDvgs4enKM1btV59v171hlpZ2WD
	j+X/8VF3tiLCn/hO1Mk2Th9E54/s+sFzMwXouT6sOdfPovdowKVpoh8KnIyFO8aIiYVBtUfJKu/
	PooD5UDlnvNSMxYCgCh6vKlsPvn2ZxzTiVqxSDqXYFForYs7MzyIaldmt0C1xgalPA/ithTWHsN
	JqcrBDveF94H2c9DawMviW16Tsp24Nukp3D1Ui3s39tPXvXGr4/q9xnro8fiAVqhOC/sYObeCSg
	uVFab7Sm+NLdxgVOw73334v9HylcJ/YTXVGhN2jAnO59lIXGU3naxkAIR03fCmZlgyz089+kBiL
	4fb7DR/LSxKgVUb3RgSyzJG3UtGlr/GdOPhqWdsHjWTNQQ7E4099uKZ+0Ubcdt
X-Received: by 2002:a05:622a:15c5:b0:51c:2022:cef5 with SMTP id d75a77b69052e-52d855014bamr78999821cf.26.1786726519769;
        Fri, 14 Aug 2026 09:55:19 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d84071799sm24476161cf.20.2026.08.14.09.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 09:55:19 -0700 (PDT)
Message-ID: <000a3672-3b93-4d62-8193-04ca6bbbd6f0@riscstar.com>
Date: Fri, 14 Aug 2026 11:55:18 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] misc: tc9564: introduce base PCI driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-pci@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260813222943.1655453-1-elder@riscstar.com>
 <20260813222943.1655453-3-elder@riscstar.com>
 <20260814015923.8E7E21F000E9@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260814015923.8E7E21F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/26 8:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing PCI IRQ vector allocation prevents MSI/MSI-X usage for high-speed child devices.
> --
> 
> --- Patch [2]: [PATCH 2/2] misc: tc9564: introduce base PCI driver ---
> commit e66bfe4041c21f48829a22eb54cde73756806870
> Author: Alex Elder <elder@riscstar.com>
> misc: tc9564: introduce base PCI driver
> 
> This commit introduces a base PCI driver for the Toshiba TC9564 SoC which
> implements a PCIe switch and Ethernet AVB/TSN bridge. The driver binds to the
> embedded PCI endpoint functions, performs basic PCI initialization, and uses
> devicetree to populate any endpoint bus children.
> 
> [ ... ]
> 
>> diff --git a/drivers/misc/tc9564-pci.c b/drivers/misc/tc9564-pci.c
>> new file mode 100644
>> index 0000000000000..d3ffcac1c522f
>> --- /dev/null
>> +++ b/drivers/misc/tc9564-pci.c
> 
> [ ... ]
> 
>> +static int
>> +tc9564_function_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	/* Despite being a PCI device, we require devicetree */
>> +	np = dev_of_node(dev);
>> +	if (!np)
>> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
>> +
>> +	ret = pcim_enable_device(pdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pci_set_master(pdev);
>> +
>> +	/* Scan for pci-ep-bus nodes and probe their sub-devices */
> 
> [Severity: High]
> Does this setup sequence omit PCI IRQ vector allocation?
> 
> Without calling pci_alloc_irq_vectors() in tc9564_function_probe() before
> populating the child devices, the Linux PCI core won't configure the device's
> MSI/MSI-X capabilities with host addresses and data payloads.

I will investigate this.  I don't have a good answer at the moment.

					-Alex

> Since child platform drivers cannot safely allocate PCI IRQ vectors on behalf
> of their parent PCI device, will the high-speed child devices (like the 10Gbps
> Ethernet XGMACs) be forced to share a single legacy INTx interrupt, or fail
> entirely if the host platform does not support legacy PCI interrupts?
> 
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
> [ ... ]
> 

