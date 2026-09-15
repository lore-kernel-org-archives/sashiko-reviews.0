Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050064C4F55
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 18:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789497744; cv=none; b=ZHAUW412tV1Kpji7TY6ku6q6m/KNb3vb3i1hpbiVnRlvgODWKA7Wuo73VcvV1wn+tZ7xIajS2kOVo38Es5U02/Hxxvl5e9Ny1tpaCzV5oqbPIv81BHEbh7Y4OdhBK6I8N54AvhylIv0VoAxZFEx/0hl+VkyZYxTnME6ed8v+eaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789497744; c=relaxed/simple;
	bh=CnLgCa/Xd5S3wMdf/P9+9GT4r29J78Vb6SjfqEB8nTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJroWZcqwJ78dSs4mk08NpfrTUEfbK43zeGdh3Y/2gx5mZcZxhsv7opcC/wNhBcxPoo1Fs7GnDj6Bvn9bbzOadI+QlwnBeNAFwuSynzEI/xIC+CZK4ZIyNCIXhM00f3t/Rhb6gUJEXPSPZnVGZlf9Sa0vqePf0OAoAwPyLegwm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=pqiyT0Ck; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="pqiyT0Ck"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6eeso1087666d6.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 11:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789497741; x=1790102541; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EDC4r0VHOK5n3tc4+Odi0PfXGfsyQf0AidjB47fhMwU=;
        b=pqiyT0CkQt/877ouIdYZMrbE8siK0KBd2vOr961JCN2zr1VSYozCoSpbewTm/J7W5t
         CVD+aa4hV7GwORKM671oqLc1UtQzHZ8Np+9ZnjfH5ELsm5xQ15kbT4NyI+eo8J0AbjIf
         t9aoTgWSZQnN4KPpiSxfjxmFqspZMRknfwdAzN4BhPZzsUjFGYYmeXCnjN2BfSjvqMIC
         6Z0j9FDWoNL3Gw1GUzJCILJbo81VFw2T9h9OrFY2CCJa/qa43MhzyoFcnisfjBzvUcog
         dCFcmI0jRz1bIygGe2NUm+lF9HQgUlMgb9jAidEqzDX0gyHcKVb97oSNZGN+HtMBDrEs
         BthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789497741; x=1790102541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDC4r0VHOK5n3tc4+Odi0PfXGfsyQf0AidjB47fhMwU=;
        b=hPGjxnm8KmwPBolTUD3lxXyT89FZ4IosHXVF9wuI62dV6jiTvfFgNUn3zQCy/HMsWS
         MGCvp0lJroAoaCcfYzNv1hFiDemPwi/cjW5aOezbimHfPAiPqoz2loRj6OCBbs6sPjPC
         339OyCibMXZ0cu4gfv7PaxNl4wr3Coj4RxzEdfUrrIFV2NM7IhgXCDbR5BYac7PT47fM
         nbAVBSPhsT4L0y92S2radJUyW2afnfU4rBQgKQGGzeJeX5K2CrSyUj0p5RLGRXxdnM3u
         qz4lSoLuB6SZ+AlW9RnHg+CWwo/NcH21ICWViZNcA3UzZR1htddnyT3YsNW3DGDa+BpU
         wJDg==
X-Gm-Message-State: AFuF++mmhQv/2ClmqLt9aEwmQGVI9EmqzS0XkciCak/Z2aN6e+5XjK0P
	KM+zokwX3pk2z3kxsNJmdSTnv5MsYM0y25vpX75eOAdbAoH209mmGKb+mqWc0IcllQjS8GE1bHv
	Vjvymejg=
X-Gm-Gg: AYBFou2JemS5rhoqLhvYAFQpCAMz4Dm+Rcu8z6z0rXBLZWdi57KTviuxanKqICaR/0f
	6G8exc9p/yWkE2mXX3e2x9gswWID0UzxbEXEBhv7nzeNmik8V4hTjWYRSOmVYTSzCQnxqX1U/ZQ
	7wwlSWHPHMYHv0kNmuACM8ggDvUXRn5l++mJ8zFiQs2xp0z3SHF5KLEcj8KX37GsAFH109S9wDj
	Dm/nyww+vSz8ghHHJFHdAEIs8wkwDGDHdAem6twhx+j3qGjTPFq0IMhpOBNkPw+PNY6T2Rzmwer
	x+SFCc/mNQnJeRLrZph6WjgXajhuDZY5xxb4a6EjJEANrO6/1TnnjNU7zNuMwpTdEevI0AIOQhl
	Bh2xi8m/yHFH9LsoOEQWx7KhgxPcCL62i/vGZVnbi1kGBMg6v85UvJhVekjm5YiC96lexE5Hegw
	fWFRwdO/pCesBOaMcAq5Tory7tsnsxF1wInn0NukCT7Kk3ecfcSOsBCGSPiW1YzCpQddRUNiw=
X-Received: by 2002:a05:6214:29ca:b0:912:1a8a:31cf with SMTP id 6a1803df08f44-9122e55ceb9mr136951946d6.22.1789497740684;
        Tue, 15 Sep 2026 11:42:20 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be7c43bsm5457256d6.23.2026.09.15.11.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 11:42:20 -0700 (PDT)
Message-ID: <54d53803-507d-42a5-a680-36cc0f0f062d@riscstar.com>
Date: Tue, 15 Sep 2026 13:42:19 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] misc: tc9564: introduce base PCI driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20260915181003.1633543-1-elder@riscstar.com>
 <20260915181003.1633543-3-elder@riscstar.com>
 <20260915182227.A53281F000FF@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260915182227.A53281F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 1:22 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] tc9564: missing Kconfig dependencies on OF and PCI_DYNAMIC_OF_NODES
> --
> 
> commit e821d4f3b3a6f26cf2df684fa3788ceb3794a058
> Author: Alex Elder <elder@riscstar.com>
> Subject: misc: tc9564: introduce base PCI driver
> 
> This commit introduces a base PCI driver for the Toshiba TC9564 SoC. It binds
> with embedded PCIe endpoint functions within the chip to perform basic PCI
> initialization. The driver then uses Open Firmware APIs to populate and probe
> endpoint bus children.
> 
>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -568,6 +568,15 @@ config MCHP_LAN966X_PCI
>>   	    - lan966x-miim (MDIO_MSCC_MIIM)
>>   	    - lan966x-switch (LAN966X_SWITCH)
>>   
>> +config TC9564_PCI
>> +	tristate "Toshiba TC9564 PCI function support"
>> +	depends on PCI
> 
> [Severity: Medium]
> Should this configuration also depend on OF and PCI_DYNAMIC_OF_NODES?

I thought about this but intentionally omitted it, because
*this* driver doesn't depend on PCI_DYNAMIC_OF_NODES (at
least, not at compile time).
> Because the driver relies entirely on Open Firmware to function, compiling
> it without CONFIG_OF or CONFIG_PCI_DYNAMIC_OF_NODES will result in a
> successful build but an unconditional runtime probe failure.

I don't mind adding the dependency.  Even if not having
it is technically OK, for the driver to actually function
as desired those things must be defined.

If anyone feels strongly that adding "depends on OF" and
"depends on PCI_DYNAMIC_OF_NODES" to the TC9564_PCI Kconfig
option should *not* be there, please say so.

I'm not going to post a new version of this series for
at least a few days, but without objection I'll add
these changes when I do.

					-Alex

> [ ... ]
> 
>> diff --git a/drivers/misc/tc9564-pci.c b/drivers/misc/tc9564-pci.c
>> --- /dev/null
>> +++ b/drivers/misc/tc9564-pci.c
>> @@ -0,0 +1,84 @@
> [ ... ]
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
> 
> [Severity: Medium]
> Will this probe fail unconditionally if the required dependencies are missing?
> 
> If CONFIG_OF is disabled, dev_of_node() will always return NULL, causing
> dev_err_probe() to trigger here.>
> Similarly, this commit relies on of_pci_make_dev_node() via a PCI quirk to
> dynamically create the devicetree node for the PCIe function. If
> CONFIG_PCI_DYNAMIC_OF_NODES is disabled, of_pci_make_dev_node() compiles
> to an empty stub, meaning the node is never created.
> 

