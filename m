Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31064369D70
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 11:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918363; cv=none; b=Wvnz0vYZCAwXzBS+3+7nEsLehK4bFDPiOs/oSNPSn9cDWYwtBgxcyxd8t/eg/UjfMfbEiBJyHjnGJcS0Ff3o3RfEw+dwK6g2ZTuJwlpC+TyabKmaBtJH9Hy2Hxc4WuuazbBCoM1ekFEQTb15wyhhlWd5R5FkdaswsgFc26N0ulo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918363; c=relaxed/simple;
	bh=IZdghrqhFdxnYA5CPzg29LgX4lUnk55Tdl8rkFADR94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hmBqwNm4vWFIlQRP4N2zE752+2oIF0T9XWPDaNwZ3JwlJOB0vOOtORT8wlVtwS87OzGk4PKQbjQnkdZ7DdODqI0RufY5yTCQ1O/t9uT03t0zBgLQjBzcvHDA0XiKzDKM47nUt79Krh4z/P0TlJhl1ZVmCvQVfmHxrE8W0yfhqKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ELcQZVEj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ELcQZVEj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780918359;
	bh=IZdghrqhFdxnYA5CPzg29LgX4lUnk55Tdl8rkFADR94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ELcQZVEjc94EsnlcUvSCD6unSf6IjKfI4QQwYJX1lmPn1U1ENNXVmpmOKmpuwwNsH
	 8ckBBazVvxESf+1f3BL3eUlEux/gPwo/3/VdbUCgjs6DG4ZjH+2H5yfwUDLOntfy72
	 k3jw2hlKUX0eormt814ZyVutqDnErx5zXTaUfOcijI3vozzMS9mW5djrX1xgUm2djV
	 2mfjX4qQ0Dk6yPj7/2dBtaUZyEsmJQnwxQ5gKWU9Rbtc0UhpHa3/9RV1GcMbB4WLSN
	 40AutIAoYUedLxeV0hv2PlI4z8rAaEeGG6r+u0c1vwf9e9y9CAM7KAZEt4QGusvdfo
	 l3sDhPwqtt+XA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2BA8517E0416;
	Mon,  8 Jun 2026 13:32:39 +0200 (CEST)
Message-ID: <321dab9d-26fa-4ea8-97b9-9941f0c9fc3d@collabora.com>
Date: Mon, 8 Jun 2026 13:32:38 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/10] misc: qcom-coincell: Migrate to
 devm_spmi_subdevice_alloc_and_add()
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com,
 linux-phy@lists.infradead.org
References: <20260608100949.36309-9-angelogioacchino.delregno@collabora.com>
 <20260608110945.608BD1F00893@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260608110945.608BD1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 13:09, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unsafe downcast of `dev->parent` to `struct spmi_device` causing out-of-bounds read and kernel panic
> --
> 
> commit eb0fe105cd38bff6269804925b90232e1c422522
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> misc: qcom-coincell: Migrate to devm_spmi_subdevice_alloc_and_add()
> 
> This commit updates the qcom-coincell driver to use a dedicated SPMI
> sub-device instead of fetching the regmap from its parent. It creates the
> sub-device using the parent device and initializes a specific regmap to
> handle the base address offsets automatically.
> 
>> diff --git a/drivers/misc/qcom-coincell.c b/drivers/misc/qcom-coincell.c
>> index 3c57f74291476..b0904f441300c 100644
>> --- a/drivers/misc/qcom-coincell.c
>> +++ b/drivers/misc/qcom-coincell.c
>> @@ -71,37 +71,55 @@ static int qcom_coincell_probe(struct platform_device *pdev)
> [ ... ]
>> -	rc = of_property_read_u32(node, "reg", &chgr.base_addr);
>> +	rc = device_property_read_u32(dev, "reg", &qcom_coincell_regmap_config.reg_base);
>>   	if (rc)
>>   		return rc;
>>   
>> +	sparent = to_spmi_device(dev->parent);
>> +	sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
> 
> [Severity: High]
> Could this lead to a panic if the parent device is not actually an SPMI
> device?
> 
> If this driver is bound to a device whose parent is a regular platform
> device (for example, via a malformed device tree or a manual sysfs bind),
> dev->parent will not point to a valid spmi_device.
> 

This device cannot exist outside of SPMI and will never be registered on its
own without a SPMI parent.

Overcautious coding bloats drivers for no reason, so this is fine.

> Because to_spmi_device() is a container_of cast, it will blindly cast the
> parent device. When passed to devm_spmi_subdevice_alloc_and_add(), the
> underlying spmi_subdevice_alloc_and_add() function reads sparent->ctrl:
> 
> drivers/spmi/spmi.c:spmi_subdevice_alloc_and_add() {
>      ...
>      sdev->ctrl = sparent->ctrl;
>      ...
> }
> 
> Since the parent is actually a platform_device, this ends up reading the
> memory offset corresponding to platform_dma_mask instead of a valid ctrl
> pointer. Later regmap initialization will dereference this invalid pointer,
> causing an out-of-bounds read.
> 
> The previous dev_get_regmap() approach avoided this by safely searching the
> parent's devres list without relying on a structural cast. Is there a way to
> verify the parent device type before casting?
> 
>> +	if (IS_ERR(sub_sdev))
>> +		return PTR_ERR(sub_sdev);
> 

