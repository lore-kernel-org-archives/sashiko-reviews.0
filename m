Received: from mail-ej2-f24.google.com (mail-ej2-f24.google.com [74.125.228.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9064EC670
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558520; cv=none; b=tEvPHa1nuzq2ZmtSg1W8vkCB2TXPmFnSU3D9sLbB64bDGEcOTTEA/MRWTd/DvdoYXH3DHIsJEh/TPttD7ljmKsdh3NTKtGtNO98TG4heltGVh2tZ8phdEQqPeiortPua7eA7b9luy2ObgDBGh9TcpASx36Mg6LnaMtiZsl6AqgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558520; c=relaxed/simple;
	bh=JxFaW/WYqlOtA984BXiqHodpwCvgbe1pUjpcetQOGtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XekV4lrt8E3tjkfGPl6q7GL0nXBNPE65WFU0pqsXRBxWexG7Ec8HJubSTNvDdglwVnbXci6rRqE7FNETyWcHL77hdVANHUSPMBDcTScHpRkcBmVjmSNCGqn8jbx7hSe2W1kp2SoZiyhrl/dsjiTMffP0shCNimUUK1BPQtV893I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wsljzSJV; arc=none smtp.client-ip=74.125.228.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wsljzSJV"
Received: by mail-ej2-f24.google.com with SMTP id a640c23a62f3a-c29d33431c8so116417466b.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789558506; x=1790163306; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+ON5LylyLSRvB3Oy5FN+PptZ1PxOVJXbkytbHhMasY=;
        b=wsljzSJV1AiJZjPCMMgQzIlCKrLnh8x3JIY/EY6Y9h+opaMAm6O+sxv9ahDkv53LxO
         X3QRhZKDPcx9mN2pw1yNvGSvJKXHHxCIrDw09TFMVJwNg2RJZcXEo0vz3W1jV+1+BoH5
         ZqTskLTltpwVemO1ad0p0NwcxDtMOXeirt2DqnYt7Q/G8VYNve0Mkh7dTdFm42/3ouUb
         xpqOKVFflE2C6xn5QSEWp6hWWkVViA/pN5wr8r57j4jDkLqsW4L/841h92xa8vw/I9R4
         hbfqFLgZwGEdv70ll1pF1N8IHqn9wQpaSwNX1T8VeRqRrLZ5Y6vXZD3TyN+xFDeVtbJj
         fd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558506; x=1790163306;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+ON5LylyLSRvB3Oy5FN+PptZ1PxOVJXbkytbHhMasY=;
        b=wwvJ+O0bRx7jIZeMK6RhtkgC6D56Mq2UucDBiWEwltrCsxptvO5fEAW58QHKfVJNMK
         SmUbzkAeLTYBBaND7vJi4R5wkptl/tnBdp9mc5oYjY0ymFXgoxmshzM5d94eosb0orul
         QJen8PjAQ6HLU32V6TjhIKzfRVcgJpEM3d07ZxK3gTrGgSd6YERW6427QHMJCqb1nio3
         +bmgAMHJyVPtbkZy8NLXmZT4vZ2gDCfQODnisjLH4CNjFUvcLtsy2EbmPWEfpkddWRDA
         Jd1RECYy0Bi2ayKlusyDoAXhiyrsg20xqAYKBTKkMz3CUVIGKnTmVqSHLt4BjcB4efNM
         kE8w==
X-Gm-Message-State: AFuF++mGtc1mN2CctQ2N0dlBbFHC/Psg09DGHcTfqaki0kN+3jIUyCVO
	49Uq7yG/+QZb7jA9SrTJW+EaL2hZx9pSmeFnT2juP5PYr9SGtaPspu7nYCmSOqYbkUMowLxT5qM
	ejNCw8mg=
X-Gm-Gg: AYBFou3itf+YPfZk+hznfCrYxf2l03l7mR+PWQXXl8Jls9P21YR3a7M41zvZUhmCWsN
	/Fgxe6rBxYexWZQkqT2+4fgDg1bnGZ61Nom1LNU55+a3iZjN/uKMo2JcGUhMZVfYMA4bSY3RNzC
	AvdO6xxiAC5rRU8jBlOoj48aEQqAdaNdA744ZARuVUa5+1rbU8GoiOOpZA0GotPD7Up3cqD64g6
	rEVBEkLwSHRVvE1XEuwPCTXXQM8vcZITjez2OurPiatIQqnAhrfO5sP9VRPrRZ3j1IIio6nyEgj
	qL6pwBGRK/kIoGT5hZ7u6vX7snoJuVXNIV1pHGQcifacIGDkp5ak0qKB5m3g+hY8sVQzdJKbdwl
	pVokZAJGcN5lzgB2Ae9XVt1Mepr+mKo1Zj20GfWvB+UOfZuCzHeomuGmYZHlJMgL2hDLrIdcHD7
	fpf5VIeJASQRqN/FXDxXlk+xGDPKfeaoiYUshbAt09dagDK6+hYdtvt65k9e82LH8W9Y/zQX5fO
	6RNBIj/SbgKwKQyENTYWHI=
X-Received: by 2002:a17:907:d0b:b0:c25:c54d:d1a2 with SMTP id a640c23a62f3a-c29e5236f43mr142950366b.18.1789558506076;
        Wed, 16 Sep 2026 04:35:06 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.116.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de0850ccsm117462366b.8.2026.09.16.04.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:35:05 -0700 (PDT)
Message-ID: <92a4b3dd-4661-4a4e-90fd-83249acf0dbe@linaro.org>
Date: Wed, 16 Sep 2026 12:35:04 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 2/5] phy: core: Add phy_get_by_of_node()
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 media-ci@linuxtv.org, robh@kernel.org, linux-clk@vger.kernel.org,
 olteanv@gmail.com
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-2-e2197a3e2551@linaro.org>
 <20260906143127.2B5691F00A3A@smtp.kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260906143127.2B5691F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2026 15:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] phy_get_by_of_node() misses the legacy usb-nop-xceiv workaround, causing infinite -EPROBE_DEFER loops.
> --
> 
> commit a021b561c8a9bfb36addca720d49ea935b34a131
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> phy: core: Add phy_get_by_of_node()
> 
> This commit introduces phy_get_by_of_node() to allow looking up a phy
> directly by its device node. It refactors the existing lookup logic in
> _of_phy_get() into a new shared helper function called
> _of_phy_get_with_args().
> 
>> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
>> index 89addd732bff3..490a7cde6d40a 100644
>> --- a/drivers/phy/phy-core.c
>> +++ b/drivers/phy/phy-core.c
> [ ... ]
>> @@ -1001,6 +1015,41 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>>   }
>>   EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>>   
>> +/**
>> + * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
>> + * @np: node containing the phy
>> + *
>> + * Returns the phy associated with the device node or ERR_PTR.
>> + */
>> +struct phy *phy_get_by_of_node(struct device_node *np)
>> +{
>> +	struct of_phandle_args args = { .np = np, .args_count = 0 };
>> +	struct phy *phy;
>> +
>> +	if (!np)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	mutex_lock(&phy_provider_mutex);
>> +
>> +	phy = _of_phy_get_with_args(&args);
> 
> [Severity: Medium]
> Does this new API miss the legacy compatibility check for usb-nop-xceiv?
> 
> In _of_phy_get(), there is a workaround that returns -ENODEV if the
> device is compatible with "usb-nop-xceiv". Because this workaround was
> left in _of_phy_get() rather than being relocated into the shared
> _of_phy_get_with_args() helper, phy_get_by_of_node() bypasses it
> completely.
> 
> Could this cause drivers looking up a "usb-nop-xceiv" node via this new
> API to receive -EPROBE_DEFER instead of -ENODEV, leading to infinite
> probe deferrals and breaking fallback to the usb-phy subsystem?

I don't agree with this.

The compat string workaround should live where it is used, not be pushed 
down into generic layers where it is not.

No media-graph lookup needs this hack.
> 
>> +
>> +	if (IS_ERR(phy))
>> +		goto out_unlock;
>> +
>> +	if (!try_module_get(phy->ops->owner)) {
>> +		phy = ERR_PTR(-EPROBE_DEFER);
>> +		goto out_unlock;
>> +	}
>> +
>> +	get_device(&phy->dev);
>> +
>> +out_unlock:
>> +	mutex_unlock(&phy_provider_mutex);
>> +
>> +	return phy;
>> +}
>> +EXPORT_SYMBOL_GPL(phy_get_by_of_node);
> 

