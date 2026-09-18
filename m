Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E9C4B1D0B;
	Fri, 18 Sep 2026 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721681; cv=none; b=iyzPIGndSO/v+xWCjOk+u853ty/3t5KSAbaYAUM69xTXSGPNoL8lpBJ1R57vVQh10whbU8xSn8hQk0KguPpOLluCLuoRAIfNlq3pWVOxEnbv/ElUuX8E3iFKzXV9ihwt9OAmMUJZrjNQnP3mnlsDyyJd/41Zd8pQ1eWrMtyK6FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721681; c=relaxed/simple;
	bh=wootcnjICb9Pb80ss9CdhfZQ+wLHzPPOFwtZ9cXT/hM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ckM27gNLUAS+kEcdrUF6u5JvAqfykdz2L7AirPmMoqEG+FzCOhvOlcJcpWs3blNBESJ3ZijLvhNQ5/dICE7asy6ubx2YY6ld+1N4zmo51EE/D+/YtZL9ErJZyK/EYbO933Rz9XlD7n4BNdD/rzdVWY3YYPdUMqKlk9t7mvdnwbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=In82j0zv; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="In82j0zv"
Message-ID: <1a28af11-54b9-48c3-a31c-85d9edb74af6@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1789721675;
	bh=wootcnjICb9Pb80ss9CdhfZQ+wLHzPPOFwtZ9cXT/hM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=In82j0zvEK3hJimjjrv+sWhPH5Uwgst67ZnXmyNOvLFZyUMYAywbwQQfCDN8CqyEM
	 1S+ORVhzruWrMHbMyESVCSuRDtdR1SWIfaz3kHwoGcG/B7MeUFk0aHNTFdngobTFG+
	 9gD+vlf+4IBApqaTyruXJ56OjFFsMNzbq9h9mwIQ=
Date: Fri, 18 Sep 2026 10:54:24 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v12 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org,
 lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org,
 neil.armstrong@linaro.org
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
 <20260917081309.8FBD21F000FF@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260917081309.8FBD21F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 10:13 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] thermal: khadas-mcu-fan: OF node reference leak in probe
> --
> 
> commit c3a0644be46518f47124644a90235d26979c4299
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> thermal: khadas-mcu-fan: Add fan config from platform data Add regulator support
> 
> This commit introduces variant-specific platform data including control
> registers and duty-cycle levels, while also bumping the maximum level.
> It optionally acquires and enables a fan regulator supply at probe time
> to handle boards that gate fan power.
> 
>> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
>> index 21b3d0a71bd0d..1da639d054971 100644
>> --- a/drivers/thermal/khadas_mcu_fan.c
>> +++ b/drivers/thermal/khadas_mcu_fan.c
> [ ... ]
>> @@ -76,22 +82,71 @@ static const struct thermal_cooling_device_ops khadas_mcu_fan_cooling_ops = {
>>  static int khadas_mcu_fan_probe(struct platform_device *pdev)
>>  {
>> +	const struct platform_device_id *id = platform_get_device_id(pdev);
>>  	struct khadas_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
>>  	struct thermal_cooling_device *cdev;
>>  	struct device *dev = &pdev->dev;
>>  	struct khadas_mcu_fan_ctx *ctx;
>>  	int ret;
>>  
>> +
>> +	if (!dev->of_node)
>> +		dev->of_node = of_node_get(dev->parent->of_node);
> 
> [Severity: Medium]
> Does this leak the OF node reference? The probe function explicitly
> acquires the node with of_node_get() and assigns it to dev->of_node,
> but there is no corresponding cleanup mechanism.
> 
> Since there is no .remove callback or devm action registered to call
> of_node_put(), and the driver core does not automatically drop
> references assigned directly to dev->of_node in this manner, the
> reference count appears to leak every time the driver is unbound.
> 

The if statement make it safe to not be incremented when not needed. At
the end the `platform_device_release` will call the `of_node_put`.


-- 
Best regards,
Ronald
