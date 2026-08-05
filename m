Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F963E1D16
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 07:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914818; cv=none; b=V2PIDtsS0NcIo1bwIl0BIMrwhNwfx54JZZ6kM+uDwENaybEosXTlVhEXVErfKFwZ/Dvd5zVHn6Ig4AxahvS6U4LhQ0yrNXdws2WPhvxa9Rhi0qZfB7BYMoCjE+wkHvJ1n4oB1AYG8sccYG3hz2aAfpF5sj0hK2jxPq6NRiYXiUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914818; c=relaxed/simple;
	bh=asK73d7GfDyhVd78GqzGQPrvU1ODMVZuA2la3QyxruQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJZm4yfGbLvbnqqTKNG+bihycgZ+afNa+o6LuqSiwxWUy7dJs4C22Cuvs+CaMd0jSeuHCUG53HCRtfveex3b1Slk0UwSV+izJshNJc5QXvjmSpKnMUAnODKBDOPZmt2YvOe+0jekPZasbqTYQXWNvMIEzXtarRaDCLWW47TJTDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=fB2X6HY8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="fB2X6HY8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49553515a8bso8769725e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 00:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1785914813; x=1786519613; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twTeQfheFVdLzfrMuJjB8uMdt+x4381kwqcX7wxLE60=;
        b=fB2X6HY8wrqrdGt02ZYLckDgTmiwDcelpJ0iIyXtExOicBSWBRiR46c/YIGCDLABtX
         KraggrLsZ3xFBB4nnLJyOdeC8ZCgP12RBDnWZjFkfMoGd3EsGDGHxEN4QHhpVhUlM0Ks
         ILBcKwh/qZjLU2SISx1LwQxHyr+cSb+9n76JEOSKtDr7NtS/LhuUwDaa0i0KRjZCS9o1
         weyJymp/pWApOCUUDPYcSYUV/4/l4qT+An408/5Tjodcx+gmJkHMOWGXNfrQJh3tFXkD
         iabTrvKQiVFEGUqQndhdZT+7DRI+MXfsAp1wP6gGU1W/PpXL1X8ZaMMa62zT+OCrSYwg
         FRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785914813; x=1786519613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twTeQfheFVdLzfrMuJjB8uMdt+x4381kwqcX7wxLE60=;
        b=XY2diohC1sUDC88R3cu0l8MLI42YPNNpuHB207R4L4lwYB06NJe4QRxElwSYi+WsZm
         sD5DQGbZ4AjeX+WSgc+JXTXbJqsItigb00qSUC0HX2j/q2M8jfLq5EqJBQITFZqVMhLL
         0U7umm/ZasgI6NdaWRe4mrrqDtqlRAvHjwo4Hk4M3vckozarAQCrpQ3d1wNGD1cgjibg
         bQMX5mFu5jWaSHG0++g5nqUjDYLqXFhx94Ba2ZXKLSJnWFcUB2jef/DhuJKPQJze8BeL
         NPVBats9ghE09fQQbKbu0QwMnp7ZXEhqMDH7dCOyR3eJtG5pXuI3nd+MZalxP7svNxkT
         PDgA==
X-Gm-Message-State: AOJu0YwXVxd45bo1/BjAi/SAI0PCoZqwLbWNldDkbDzs36M6rhPn7c/z
	5LMLnsXPXLm/ERiXYz97EDTKAxE0Obmdk0k7E2cjBnlU0V4ad9XeAZlOfa/tNZxPOkcE1+4qNvR
	TnI4WtBHVWw==
X-Gm-Gg: AR+sD137M50mvgg1Kpd0WF+nKh5qXuZAzvP1iLi2wabI3X0DCGPckHuQGpC0jvl4e6S
	0q7JQSY2LHqxslw7LhNVE7Nocj/Z0maVVNFeyTKhiiLR7CjT0wlPfHrOcNI0BzQiJhO78lBK9xu
	AJBkjpHEDf2xgnnGsuRLvsbiUTGrzFa2qpgK7O8UAkFKGh1IMxzwn08VP/hFuGhZv8yVdX8pLYd
	w7xRDmClsv4Ch23kQ0y1ELfcCZ8bKhxnUKLFmPvdqWCA6jIrVvbnZ284aRMdb+hu3Jy4/uwJRgE
	1XSJP78bB2DkaDghTMqyLVUtPhG7/5fdUoH+Po5GviqRApvCbePNOZTLCNTJ+ppy5x8IUaBiD4a
	l8cKipBsd2I1m9wHmMLkyXVfr1R82tNA3Y0NACdM4h84g/zD9NLTM3jclsJmDRvdfxB7+ztHNv6
	gQVc1ZM7/fyieKCWxAc1Zw13SNsUdwCfAe/ezU0iV8ARtRGn/J3RzzN8teDIHaKXPf8AS4ITBrt
	A11zpBay6c=
X-Received: by 2002:a05:600c:3589:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-4994e79ab0emr51987475e9.4.1785914813464;
        Wed, 05 Aug 2026 00:26:53 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb345sm153939695e9.6.2026.08.05.00.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 00:26:53 -0700 (PDT)
Message-ID: <a88bbbb3-2a6b-4b2b-85ec-479d3ba5299a@sigma-star.at>
Date: Wed, 5 Aug 2026 09:26:52 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX
 mode
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20260804111849.92046-1-david.oberhollenzer@sigma-star.at>
 <20260804111849.92046-2-david.oberhollenzer@sigma-star.at>
 <20260804112702.497CF1F000E9@smtp.kernel.org>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20260804112702.497CF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/4/26 1:27 PM, sashiko-bot@kernel.org wrote:
>> +
>> +	regmap = syscon_regmap_lookup_by_phandle_args(np,
>> +						      "syscon-acspcie-tx-rx",
>> +						      2, args);
>> +	if (IS_ERR(regmap)) {
>> +		dev_warn(phy->dev, "can't get syscon-acspcie-tx-rx\n");
>> +		return -EINVAL;
> 
> [Severity: High]
> Does this code inadvertently break probe deferral?
> 
> If the syscon provider is not yet ready, syscon_regmap_lookup_by_phandle_args()
> will return -EPROBE_DEFER.

It will not. syscon_regmap_lookup_by_phandle_args() internally wraps
of_parse_phandle_with_fixed_args(), the implementation of which can
either return -EINVAL or -ENODEV.

The only additional error path in syscon_regmap_lookup_by_phandle_args()
also returns -ENODEV. At worst, this will mask -ENODEV as -EINVAL.

> 
>> +	if (phy->mode == PIPE3_MODE_PCIE) {
>> +		ret = ti_pipe3_acspcie_tx_rx_mode(phy);
>> +		if (ret)
>> +			dev_warn(dev, "failed to set ACSPCIe TX/RX mode\n");
>> +	}
>> +
>>   	ret = ti_pipe3_get_pll_base(phy);
> > Is it intentional that the error returned from ti_pipe3_acspcie_tx_rx_mode()
> is ignored?

Yes, I tried to following established convention by modeling the implementation
after other drivers that need to set syscon register bits during probe.

For instance, the dra7 pcie driver. See: dra7xx_pcie_unaligned_memaccess() or
dra7xx_pcie_configure_two_lane(). Those follow the same structure,
returning -EINVAL on lookup failure or the result from regmap_update_bits().

Where the setting is optional, a warning is issued on failure, but the probe
then simply continues.

Thanks,

David

