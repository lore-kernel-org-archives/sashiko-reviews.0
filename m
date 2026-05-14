Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9922874F5
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 01:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721186; cv=none; b=AQRptVo0ixlHbOI7Whsn+w2DsSPAOTK9KrF6KZagKglBOXsmmIPAsc6i+9O3j5tQbslWyisnLzU5HuQrN3zBLw5Y3wTua8CU+n81g/El7Q6ODoEtnPi6WtY5cADoK4iCgs9N8mSbjEUJNVFXAmckQY/3LLUdoOr4O79Z6XXM5Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721186; c=relaxed/simple;
	bh=h5sRpSvv5ewpxrWmSf4c1Mm5BU2vq2QQAQuHblNbf8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pd2ewf0RwgW4AhibXrlBpsFPhM6mpC1YA/auJHuPIckFv1UQxDPmpp/6YuzfoviYwx36J/S4Y3mfgaHhCGqYSW1/dw/e0xGuZFo2lVJCkxP3nGjTvnoYj2CH7HNldNQkatEUrRsz8FWTzAcylhUCF7ETwjkd79dR3184naRiwS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5FNgksA; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5FNgksA"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-132830d8281so708198c88.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 18:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778721184; x=1779325984; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zLByGVIEiJruERfsAKZLAy9/W44wFfK1yKm81wN6g8Y=;
        b=E5FNgksAGtHkYzR52oxcu+PETGcbSmWsvsuhTicNZJSeYglIw0PxH0aCLXvCFfRUPO
         efE8SUat3/RS8HubYiqTjf+tsnX7NB1RIl2o0dS4XoR06//eoPr7XaNWQwGqPwjJHb1M
         00W4D+DOm5rxgf00oAyDPB9P8BWhbqUCSgHk2NDGD51XayJPzaBwSvpgyL6O2zYa2luH
         6Dm1XTk5rQXEorZ8H0OFcdJbLYHNqiBTuV6GNj+Xhma0lKg4D0YI/2bo7JOBqOMwk3HL
         zDW1IAsEAWIRPd91TQmYsj+PeKYvl+FLd4IaE1RnOWSco5hVtwI14ZVmhFRJWd0PziMG
         orGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778721184; x=1779325984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLByGVIEiJruERfsAKZLAy9/W44wFfK1yKm81wN6g8Y=;
        b=moPPTrDxllpF8CrqQB9Z30+8F2hqLDMmObJWSJWOHnEQuZeaRYb8SqLLWLhPOywyKv
         TIZBRAopZqey7vD1QY7GhbFD0uDf7AGgVIw1ZclhZh/SMdmA16G7Xm1V8nG7XXNzO6hv
         Yq1baRo1yCCOscZQaUTfR8bxLQPiOXmBl+UkCrjblbVamoVrHb7wIjaaZ335IPkvl5z5
         kVY2wbGmdEUf8MvBGJqDVLg6/FgE60Z8ql5gLwHc7NIPWPDH229/EfRtqNxm3W3ikQgs
         LEwIKlMhA170crABZY72w1lriZCTGuUSMAPtFWDSaeT8UtKixhWSeULpSrUN2sAY+Glx
         /0/Q==
X-Gm-Message-State: AOJu0Yw1+jhnUwnotMbJaf1llcrZz/x1e0AgI+nNcHM+vDidpfRoL3BX
	WUMNeLjHW2Biyg94KdJ/j+kQME7AjFEeGnXMQ7TcDNY7fdU4pSPLi5znkjZhVQ==
X-Gm-Gg: Acq92OGPHeHStB7osZXooDOp/IZicoNhq1bWQBVBCyy9AHCZZq9tbdKi/DQWp69Da02
	nvyWkOW0XpkaMrukjx/Cz53c6sx/yFB7MVzG4yshvjCEays5V4FSYxXyRCNzjejh0SaLwc3oKsE
	3FbH8xao4XNXsBs5H7GlugvicZA2NFjyj5ICyEcbElqwjxmNTCGVQlT7DF7pWEpusrsmWr65pKA
	RxUZpR/+ZeMIVxmCtxdX9bcOR+EWNkFLX1i4+OTSG4ay1nByR4mT+kfbt2CaYrHrwdTY3Mke0mO
	N6LSrIbL8aIlC+VZu74vHDUL1YO1IVEij8sKEVuUYNasuO3oe7DKljHPMvx1ANsJ4jgLbTahC7d
	gb9gkscCSlyvxiQPPmzDQlZDpr0Wp78M17RsB1+le7WGpTncDr6vyQBXHSquq8g7Dl9s8bf2nH3
	ausv7FA8zDeMSn9RWwngQM3lQK3SsOTkMIlPRzEBA6hiMGbpvGYMNZY08ZXeWZi5kqQAdNsNlJ
X-Received: by 2002:a05:7300:e430:b0:2e7:c701:aa85 with SMTP id 5a478bee46e88-30118e9ffb4mr3730892eec.17.1778721184397;
        Wed, 13 May 2026 18:13:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm1338240eec.15.2026.05.13.18.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 18:13:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <831850c4-af36-4323-87f0-3add11da9583@roeck-us.net>
Date: Wed, 13 May 2026 18:13:02 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] hwmon: add AMD Promontory 21 xHCI temperature
 sensor support
To: sashiko-reviews@lists.linux.dev, Jihong Min <hurryman2212@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20260512213910.871859-3-hurryman2212@gmail.com>
 <20260514010045.D9B52C19425@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260514010045.D9B52C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 18:00, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Using readb() on a 32-bit PCIe MMIO vendor data register may cause unsupported request faults.
> --
> 
> commit 9f079250f98377be1d241f6f3c08a14ae44d8785
> Author: Jihong Min <hurryman2212@gmail.com>
> 
> hwmon: add AMD Promontory 21 xHCI temperature sensor support
> 
> Add an auxiliary-bus hwmon driver for the temperature sensor exposed by
> AMD Promontory 21 (PROM21) xHCI PCI functions.
> 
>> diff --git a/drivers/hwmon/prom21-xhci.c b/drivers/hwmon/prom21-xhci.c
>> new file mode 100644
>> index 0000000000000..7124824a1f5ed
>> --- /dev/null
>> +++ b/drivers/hwmon/prom21-xhci.c
> 
> [ ... ]
> 
>> +static int prom21_xhci_read_temp_raw_restore_index(struct prom21_xhci *hwmon,
>> +						   u8 *raw)
>> +{
>> +	struct device *dev = &hwmon->pdev->dev;
>> +	u32 index;
>> +	u8 data;
>> +	int ret;
>> +
>> +	ret = prom21_xhci_pm_get(hwmon);
>> +	if (ret)
>> +		return ret;
>> +
>> +	index = readl(hwmon->regs + PROM21_XHCI_INDEX_OFFSET);
>> +	/* Select the PROM21 temperature register through the vendor index. */
>> +	writel(PROM21_XHCI_TEMP_SELECTOR,
>> +	       hwmon->regs + PROM21_XHCI_INDEX_OFFSET);
>> +	data = readb(hwmon->regs + PROM21_XHCI_DATA_OFFSET);
> 
> Is it safe to use readb() on this 32-bit PCIe MMIO vendor data register?
> 
> Many PCIe controllers and peripheral MMIO implementations strictly require
> 32-bit transactions. Issuing an 8-bit read can result in a PCIe unsupported
> request, which may return 0xff or trigger a fatal PCIe error.
> 
> Could this instead use readl() and mask out the lowest 8 bits?
> 

Good question. Any reason for using readb() instead of readl() ?

Thanks,
Guenter

>> +	/* Restore the previous vendor index register value. */
>> +	writel(index, hwmon->regs + PROM21_XHCI_INDEX_OFFSET);
>> +	readl(hwmon->regs + PROM21_XHCI_INDEX_OFFSET);
> 

