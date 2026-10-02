Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5339B298CAF
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 00:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790901954; cv=none; b=bij7nLzWhJq0+kCufpFGmcalDdnsrWSEbFRMxF4wkLpq++/Sr+mHwYN/cjQhRbiu/0rFCmX41V3455D9UDSZjfSPY65esjY3b1VjwZNnd2BWItUlphqWs1OF/O0R7c4eCA0wvOe5DvsioH72mOIp/8ZxdATXzLBnoygQtaVBZWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790901954; c=relaxed/simple;
	bh=/iwqoS+4JBREJtu0vFODIucYw38WpkRGJE5KP67yLnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QnParPFarE2kr5xTSHEjucw3iB7vgmvLk7bb29vzAn73hV03hnl7Tsp4QHnChN0SYKMHpa3oJnNOW8uoJGXYgjxxWnm+XiW4UCzWvowCpfu/HHQ4ioup8E9tarDAYbo8Ku5DPP7a+LK//CLOiQr7LRcsUSd8yY2b9lgpLsOisEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fICzYZwZ; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fICzYZwZ"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0eeda3e03so3086718a91.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 17:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790901953; x=1791506753; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLMqQrPjrg6i/NUynUbUXMZpVXP2BcgIqLfTW2Lyeoc=;
        b=fICzYZwZl5Aq64b15qfYpFuWRfwXZx1DhtxOZjQzwNHIcFPnXU3uOOp3wPL8tkTedp
         hkwsQ7666rGtZ1JnEfo6xbEyNW98yCTvlgdNjjQBmathYXvoO57dJ1EmSWVunmtwmqA1
         t4UMNShPXFUNN9xxi9UPyg71EaJZ1wi8g7mLEPXYsSH+lnXxs3nnc1ykiazJexIq0Lir
         z4JSAbiBladIZR4p5PXrIZshskorwscd1ev+/sNU9pgaPVX602K9myPpS4XscMYfhOrT
         AGt0lOncN2QFHY+3uGbxsdkWvRu/wy4heeIkwGgOdDkiA2/jeJ/uFZQ31tBjdpK8qXrt
         8IXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790901953; x=1791506753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZLMqQrPjrg6i/NUynUbUXMZpVXP2BcgIqLfTW2Lyeoc=;
        b=waulyUqUKMIFuUYYStRx7B/DP9M0ZDn83Wq9nRLGS6WF+jCY/2sWCcEchmGhsZXEw6
         7wzK6dDxEgbcF4J9qQuWhQwW4oqggbZJItJRavyP1IVm3MhPaQtbPJBYxUwDsTyXBZ5u
         O5Ql13UShARWwRephbdiACWqEildsI5ZuFAwWB3bJ/mzJRLh61ifJM6yc9HEUJb2Wt7Y
         kO/Xj6WiKb5Cs4hdYQAL+D1AKsdeZdk3NWKnpvNIm7GmgpmVM0P3MZAA++aQg99JS1hw
         N53h8RBdQIEgbM+CEUATnRYRPudR3zDPa2Dv3Aw/z0ifGOjMX1xE3NKbPWGxeq/hnxPK
         RDFA==
X-Gm-Message-State: AFq9FYItQvYGFHec6YVDSMKCXFFIIWM3xpz53FmfpBuVhnnZy8IWaUYV
	fG7+b31T0yDNnVM2NDeP8dayttfzu3UNdF6Vqu8V73nTX8j6jtPIAIvAUn+ApA==
X-Gm-Gg: AYBFou3pWXHm6vBnIaOp9auI52w1O1oI19rcwqeEojhALz+1FMAACvfs/OpAl+bqNuB
	uHzJLnJYK2IwJYYarmJAJF20r/8JnapQhCNP9bCnEdNinhbA8vZZr4qnEBRcqcq5uLWAPzDgfPq
	U7vWMZj+2L1ilmXK1O6CmleTM/aSpfNkW+n4cdGFNk7YxjtqQVsKsX1RZbZA2T2eJpbKCTMBLYZ
	VW8ItwwRJItsR8XdT/3Xdk72rFQwkJZpEQVeXa9ISVFSpQ7uTx7jzwbnOILZlHu/jvj6YNkDWSB
	CZnccbFklFziwfcWaiJdJzbz2Ye+R/YWNPLbzJ5mSOmW9juKEGMjYwkr/2IsY7AlPLanMqAVDh4
	zUGvbUMDp04fEi2o95+dcsmpPy2/poeOmdxDoCdOZBPusaUC2DuP1ieO7KJnpyjmdRnmMXs2vBL
	o3kXyFT1+zVzESs78tpO/h8z4qP4/msriqQEDaqjtIxEvuu8ko6o4uq+JQKaYsjVz/FN8L8A5kS
	eQYH06bgx29TOqTcj2Rmj5qVWi5KRCznj8klHRxwKIGce9dUQ==
X-Received: by 2002:a17:90b:4a91:b0:39e:3554:4d0e with SMTP id 98e67ed59e1d1-3a6ce35748amr495330a91.1.1790901952575;
        Thu, 01 Oct 2026 17:45:52 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f471b16asm6642130a91.9.2026.10.01.17.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 17:45:52 -0700 (PDT)
Message-ID: <9987c7a0-efba-4f9d-a3fa-877cc9d189ed@gmail.com>
Date: Fri, 2 Oct 2026 08:45:50 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] spi: ma35d1: Add Nuvoton MA35D1 SPI controller
 support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20261001131818.110028-1-cwweng.linux@gmail.com>
 <20261001131818.110028-3-cwweng.linux@gmail.com>
 <20261001133705.7C5A71F000FF@smtp.kernel.org>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20261001133705.7C5A71F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



sashiko-bot@kernel.org 於 2026/10/1 下午 09:37 寫道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] spi: ma35d1: probe fails on valid DT with num-cs > 2 when using GPIO CS
> --
> 
> commit 297501e7117bfad68b786ba4098b2489480c1405
> Author: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> spi: ma35d1: Add Nuvoton MA35D1 SPI controller support
> 
> This commit adds a new driver for the SPI controller found in the Nuvoton
> MA35D1 SoC. The driver supports SPI host mode using polling-based PIO
> transfers, standard SPI modes, and natively controls up to two chip selects.
> 
>> diff --git a/drivers/spi/spi-ma35d1.c b/drivers/spi/spi-ma35d1.c
>> new file mode 100644
>> index 0000000000000..7560cb7e0b099
>> --- /dev/null
>> +++ b/drivers/spi/spi-ma35d1.c
> [ ... ]
>> +static int nuvoton_spi_probe(struct platform_device *pdev)
>> +{
> [ ... ]
>> +	ret = device_property_read_u32(dev, "num-cs", &num_cs);
>> +	if (ret && ret != -EINVAL)
>> +		return dev_err_probe(dev, ret, "failed to read num-cs\n");
>> +
>> +	if (!num_cs || num_cs > NUVOTON_SPI_MAX_NATIVE_CS)
>> +		return dev_err_probe(dev, -EINVAL, "invalid num-cs %u\n",
>> +				     num_cs);
> 
> [Severity: Medium]
> Will this check inadvertently reject valid device tree configurations that use
> GPIO chip selects for additional devices?
> 
> The SPI core correctly supports expanding the total number of chip selects
> beyond the native hardware limit when using GPIO descriptors. Since this
> driver sets ctlr->use_gpio_descriptors to true, a device tree could specify a
> num-cs value greater than NUVOTON_SPI_MAX_NATIVE_CS (which is 2) in order to
> attach a 3rd or 4th SPI target using GPIOs.
> 
> Because nuvoton_spi_probe() checks the total num-cs read from the device
> tree directly against NUVOTON_SPI_MAX_NATIVE_CS and returns -EINVAL, could
> this artificially limit the bus to 2 devices overall and prevent GPIO chip
> select expansion?
> 
>> +
>> +	ctlr->num_chipselect = num_cs;
>> +	ctlr->max_native_cs = NUVOTON_SPI_MAX_NATIVE_CS;
>> +	ctlr->use_gpio_descriptors = true;
> [ ... ]
> 

Hi,

Thanks for the review.

I don't think this check prevents additional GPIO chip selects.

For the MA35D1 binding, `num-cs` is limited to the two native hardware
chip selects:

     num-cs:
       minimum: 1
       maximum: 2
       default: 2

Additional chip selects are described by entries in `cs-gpios`, rather
than by increasing `num-cs` beyond two.

Since the driver sets:

     ctlr->max_native_cs = NUVOTON_SPI_MAX_NATIVE_CS;
     ctlr->use_gpio_descriptors = true;

the SPI core handles the GPIO chip-select expansion in
`spi_get_gpio_descs()`. In particular, it updates `num_chipselect` using
the number of `cs-gpios` entries:

     ctlr->num_chipselect = max_t(int, nb, ctlr->num_chipselect);

For example, with two native chip selects and two additional GPIO chip
selects, `num-cs` remains 2 while `cs-gpios` contains four entries. The
SPI core then expands `ctlr->num_chipselect` to 4.

`max_native_cs` only limits chip-select indices which do not have a GPIO
descriptor, so the additional GPIO-backed chip selects are not rejected.

Therefore a DT with `num-cs > 2` is not valid for this controller
binding, while valid configurations using additional GPIO chip selects
continue to work through the SPI core.

Thanks,
Chi-Wen


