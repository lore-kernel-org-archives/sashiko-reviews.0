Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421C849EC78
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141728; cv=none; b=Tfsw85mWDTQkNqMClpVEUyRKRb9P1scNu4i1plTe0GUqAgnYZK2J/l7K47YbAjMAtNxzvncWRfOh9wcBm0VlBjGrkQZt5ewcV/rOZpFvlfTzuioM1jYYcQuIUYUBnCKoK5D7OcYIc2MNlfWctM2+v2K49Vl4LcCwKcHiqDi+kQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141728; c=relaxed/simple;
	bh=HWLDosx9tKEhnC2IOciqOd6B3i5lfzYFrLHy2jKKZqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bdqyA3C/PJuVMB9iEzYmo2B9dDmsjQhEbYCeeJ3bVvbjWn/+H145WU16OptLY8rrvrcxOeVQaf8bA6BiW9cWoU3et8UuPn3xeGWnQ97rUiYclWyhHWpoVIdUpeYzYyvaikWScwAKIHxO8VWveyScwY5rdULF8YRBC8nvMceG9WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=q+/hXGEL; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=tKOl5tJv; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="q+/hXGEL";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="tKOl5tJv"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1789141714; bh=QMo9x+UVp6QFMjOyUeSIYDU
	RSjXGI7qKSJjYZZMw6bs=; b=q+/hXGELKbkCSjrWOmS2U9Qp9ieFNzBImzwmsbnpiAMKy0xD81
	VFXTg7NLhdERBCFAmTHhhee09f8eQUPQ4Y8o52ZZ8bCPa69WrUh9l3lJpOfhjeMyZmRnB9R3gK1
	piyui5wOfrg3L/cfL06otfsXBY198g4QakEyNSgzGpSUJJSlLcSx163FxzAXG+QoWuUaLIjiDt4
	fYKemAxRD6pSKtqRS5pgqOx9odD5emP7Hcl1DHJpeVuebepCN7KtRRHpLD6PlTOGbbCDLy9P3+W
	fCG+LRYCgRaZ63Gu8PkUnSqia2R5vis8cX9iKqhw12HhBFbsTakMObj28T6Fal131cQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1789141714; bh=QMo9x+UVp6QFMjOyUeSIYDU
	RSjXGI7qKSJjYZZMw6bs=; b=tKOl5tJvAyydy8E9nYGZWW3uHpyW0xzs+rQ6HqIJsbgtBkuOhi
	s90MeIJUu3CJSMNpA99A+FIEjS6nhg8bGlBA==;
Message-ID: <d7e15309-8069-45ec-92a6-24ea113a537a@mainlining.org>
Date: Fri, 11 Sep 2026 18:48:33 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drivers: gpu: drm: panel: Add BOE NT51021 driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
 <20260911-qcom-novatek-nt51021-panels-v2-2-135e3190a7fb@mainlining.org>
 <20260911154433.BD65B1F00893@smtp.kernel.org>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <20260911154433.BD65B1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


11.09.2026 18:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Ignored return values from `devm_drm_panel_add()` and `devm_mipi_dsi_attach()` leading to silent probe failures.
> --
>
> commit d977b7bfeacd8104619cc818002d70a48f32aad3
> Author: Nickolay Goppen <setotau@mainlining.org>
>
>      drivers: gpu: drm: panel: Add BOE NT51021 driver
>      
>      Add driver for BOE NT51021-based 8-inch and 10-inch DSI video mode
>      panels used in Xiaomi Mi Pad 4 and Mi Pad 4 Plus (xiaomi-clover)
>      tablets.
>
>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt51021.c b/drivers/gpu/drm/panel/panel-novatek-nt51021.c
>> new file mode 100644
>> index 0000000000000..61dd283769a75
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt51021.c
> [ ... ]
>
>> +static int nt51021_novatek_probe(struct mipi_dsi_device *dsi)
>> +{
>> +	struct device *dev = &dsi->dev;
>> +	struct novatek_nt51021_desc *ctx;
>> +	int ret;
> [ ... ]
>
>> +	ret = drm_panel_of_backlight(&ctx->panel);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
>> +
>> +	devm_drm_panel_add(dev, &ctx->panel);
>> +
>> +	ret = devm_mipi_dsi_attach(dev, dsi);
>> +
>> +	return 0;
>> +}
> [Severity: High]
> Does this code silently ignore initialization failures?
>
> In nt51021_novatek_probe(), the return value of devm_drm_panel_add() is
> discarded. Additionally, the return value of devm_mipi_dsi_attach() is saved
> to the ret variable, but then the function unconditionally returns 0.
>
> If either devm_drm_panel_add() or devm_mipi_dsi_attach() fails, the probe
> function will incorrectly report success. Should the code check these return
> values and propagate any errors?
Didn't notice that, thanks

-- 
Best regards,
Nickolay

