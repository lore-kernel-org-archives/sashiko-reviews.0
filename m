Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E256030100E
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425561; cv=none; b=G4ioji18vrA/jQtyurw4+I1X7zSatGh+95fZ09GPhfgRZgo1oB/NFlDDgdz/7QC+60QGwGldOCQI7lsfu2R3ZxlkFcOhlto39gvUL9TPBEH7GKkx2qXAztLKLD3VwfksMzmQIlbHGkHDQWB1Xk4K4LCSgG8Nhzjizf5FY8T+wIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425561; c=relaxed/simple;
	bh=PWdlmJ96Ws5+1lzRRG0wq0bRcbZIhLEF68z4ZD7AisM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgC56PDuA19FdULzxmzwQ8XJZpS8tCcWWgAH7wO0pDoaVb80xG1uZjNbj0+qfqcq/U+HBQ/GGZwiqFuFzX1W/dAIlcwa+awqxCtuq1qR1JQViy0P1qFX2TdxbaBxkvJTRQECAFBZNJ6roOjhXnSr3uL35M644CV20csRQlc0X8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lgfEtItu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lgfEtItu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783425558;
	bh=PWdlmJ96Ws5+1lzRRG0wq0bRcbZIhLEF68z4ZD7AisM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lgfEtItuGXkiITBfLUUWoaJ66xkeEm9pNME5fiBfkbWGDEhJE0CajEupwPPCsv2YQ
	 IhFWDoSOPAYC/CT/qZShP2YgCdHayehceuN2hXHwylAK+kwWpjA3iLzEHVdkBU9kcU
	 Ood7Iy0Ot2vJAOtBzWgvOn/XZXgZJWkXGQ77V0BVrwOVWzJh3uDbTex+MrB/QZJ/UG
	 nsRUmW6GsTxEPGOrurqTmrjEdFucU6eEn82Q2ZgDZfH9AXrgbdmhCshdm+3DGT4Nmc
	 k1oN4r1xpL8g3O5uUKtcA7ONz6MiT1fC6RbXHJgzrBUTtzFyNjkd9ZJmbS9PA1hdMs
	 Q0s4cuPj5n0ow==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D2A0617E0713;
	Tue, 07 Jul 2026 13:59:17 +0200 (CEST)
Message-ID: <f1877e27-cc72-44ce-9ddc-bf3d89932655@collabora.com>
Date: Tue, 7 Jul 2026 13:59:17 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 05/12] spmi: Implement spmi_subdevice_alloc_and_add()
 and devm variant
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com,
 linux-phy@lists.infradead.org
References: <20260707111829.180158-1-angelogioacchino.delregno@collabora.com>
 <20260707111829.180158-6-angelogioacchino.delregno@collabora.com>
 <20260707113101.6CEB81F000E9@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260707113101.6CEB81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/26 13:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Combining device allocation and addition into a single `alloc_and_add` function breaks device model configuration semantics for `spmi_bus_type` devices.
> --
> 
> --- Patch [5]: [PATCH v12 05/12] spmi: Implement spmi_subdevice_alloc_and_add() and devm variant ---
> commit 07c884decc8feb83970dc7a2fe54a4fbf80be610
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> spmi: Implement spmi_subdevice_alloc_and_add() and devm variant
> 
> This patch adds new functions to manage sub-devices of an SPMI device,
> including spmi_subdevice_alloc_and_add() and spmi_subdevice_remove().
> These are intended to support complex PMICs that feature multiple
> sub-devices addressable via SPMI register ranges.
> 
>> diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
>> index 4050f3614dab8..e218c81405458 100644
>> --- a/drivers/spmi/spmi.c
>> +++ b/drivers/spmi/spmi.c
> 
> [ ... ]
> 
>> +struct spmi_subdevice *spmi_subdevice_alloc_and_add(struct spmi_device *sparent)
>> +{
>> +	struct spmi_subdevice *sub_sdev;
>> +	struct spmi_device *sdev;
>> +	int ret;
> 
> [ ... ]
> 
>> +	device_initialize(&sdev->dev);
>> +	sdev->dev.parent = &sparent->dev;
>> +	sdev->dev.bus = &spmi_bus_type;
>> +	sdev->dev.type = &spmi_subdev_type;
>> +
>> +	ret = dev_set_name(&sdev->dev, "%u-%02x.%u.auto",
>> +			   sdev->ctrl->nr, sdev->usid, sub_sdev->devid);
>> +	if (ret)
>> +		goto err_put_dev;
>> +
>> +	ret = device_add(&sdev->dev);
> 
> [Severity: High]
> Does combining allocation and registration into a single function prevent
> callers from properly configuring device properties?
> 
> Since device_add() is called immediately here, the driver core executes bus
> matching and broadcasts the KOBJ_ADD uevent before the caller receives the
> device pointer. This leaves no window to set properties like of_node or
> fwnode.

It's done for simplicity of API usage, and no properties need to be set during
registration of the SPMI subdevice.

> 
> Will this cause the uevent to be sent without a MODALIAS, breaking userspace
> module autoloading and automatic driver probing for these subdevices?
> 

No, and I'm not changing any more single bit of this series, because this series
now is completely fine.

