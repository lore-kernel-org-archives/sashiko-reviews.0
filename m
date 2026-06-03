Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045AE36F8FF
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 05:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780463410; cv=none; b=D/5wEQUtuRyW24ZnlsbZILeMD89uW0lHWSS6zva6QFH1m2SJ/EJ27K794q5jzA3uE7DkLBWPmVwa4vWVPjH8BIa04Ik/N7DVtOpcO0PErfYgdPXxh8zNWADFPjlZQN7ZenUmGx6XW7whiTW4B4SvXGSFkil+mqwN3JvB60cbtWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780463410; c=relaxed/simple;
	bh=8C8Kr1c5n4k9/G9k1O7ehVgZ0Lqnya4nKrjO6O0cnmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xo2iYytzbwcRk7CsPs+lcUwCqpT+9Td/jVKftQSVuv9UhRxqxuAunutL8ReWk8KDVGflo1uQwq05Ky+ucUZD4j9G7Y5lZcr1ZpMZZ4zTk8F0rrWtls0jLj5VQBOG30gzaPIr8a80Anp9BSlVek4PHJ4t2DtUybVVPChboI4NBec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=draxWtGR; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="draxWtGR"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8423f869421so2392201b3a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 22:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1780463407; x=1781068207; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9qoccg3WggHKPK13rB0vOib/4Yp0f9YAq4w6iNluRA=;
        b=draxWtGRQVzlSgdRu38bxdYDK1Tuuz2FCEYd5IEvokG/2gEdHwTUQunojpDb2BJqHj
         i+LIFnaScBJbBxnC548UuzCVJ2kCB/ZC6/FJC3yBoIBEFZYEoBBkQKLoSKl7qhfGrV06
         gR8BzbUtajr+/gKyeNfltLZ3RoJA/pMQ2oNL5ak3iebkYjR+bzDDE+IfuvVJQv5gk3jt
         RoWKcrtQOudE7LqViHPiGC/MybeM68mEATTUlKL+tMZlG4+OxI+T5yjt6isPDmOJfxOr
         CDQARFBNYNY4uv4ugjgmJ45FbHvllL/Bqw78ExM7A1cDRbTZxtluK9H4D9hGchXB4MoX
         /Smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780463407; x=1781068207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w9qoccg3WggHKPK13rB0vOib/4Yp0f9YAq4w6iNluRA=;
        b=evsXI3pDTYyqeAy6BavwVshd/Oks+DtdUKPt5/jjWTX6RUCwIC7jYLr+SN0ZnqnzCW
         fALcLX4yX1nGWxUS7Sf3tcEIm6lNOxqUbx6nHgltzYHo14D3O5KKZYfgToIYTuj9zxBi
         SnoyzObDefYA6BQX+s8fuPxXY7fF1na2Tq70cE5WVyyg5Y+BohELLY09pD960iO3PX7X
         kDRFWnwl5Qn78GwQtz1sCJCudkcKyhULw9I+mcywZL/pWZSYSEmmNg9Gz5wxNB2Gkd4S
         gZ4LZZSBxfRPIQCxw9A/9ocYRXUOhTwfpuRJqreJtE/Bcu6wqoI5zlZZdbYu8gcH8gQu
         eDgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WonllV77y7XWcl3FVYsMXXgT+yFyNI1+l9eubnx4rFC89Fwnl5t0xUcir8cqwB9DhsXINr3z1XuNhQdX/SIs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr/L0spnWtIfO2F3xh09vyKuYqtQtfMcNT262+7z2X76qAIYK+
	MRJwrJpZzf4iZSbtSyZw1Bqo1ihHg+u3j0yc7b8TQnLIjMEWxe7Bos7XFxgDaP6QHCD5y52VVO0
	Q4f22
X-Gm-Gg: Acq92OGK/K/mxoEXlUTBsjJzhjQukJU2dUGe1eoMATXGjUa91PwdYlBXxAoIM4cEyEz
	P7F+3qOAU2B/UwPf75km1ilGm7H3UOPS7RZ0rihtmfV8iwpXnsgAGUkk4+aYAAKDiNGubSLKqlB
	6UqJopkYv4nXi9mwW2b+Vwn7N4+MlX9abBYURww6WUyrnh4aNsH/bNVm39p9ZoifZyhivxqusfY
	UIDCYM+aWQghWhqgJlZI67Cqis/k7ycVSpDRkxMTLcsqrz8w4l6rz9dEgY1ICqieAjHnREygwbX
	WubNT4sjt8Vir2XXT4SmvlwbqGVHiiuuHkSWMTlHo1Pk7TjmBJi8JiEahUYSa5Moxu7JFTRXWZS
	lO2Te9PbfukIi6L3iuztnN8BwC6EbHWGEJWB6lyx44bL2vOXZvMz0XyiFtDC7OZ9kiDy8wdNwke
	araZvJyYo5hUN2zLNRlZY4Iw7BjQ==
X-Received: by 2002:a05:6a00:1488:b0:842:6a97:52fb with SMTP id d2e1a72fcca58-84284dc0488mr1957197b3a.18.1780463406843;
        Tue, 02 Jun 2026 22:10:06 -0700 (PDT)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372502sm1685430b3a.16.2026.06.02.22.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 22:10:06 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v5 2/2] drm/panel: Add Ilitek ILI9488 controller driver
Date: Tue,  2 Jun 2026 22:10:05 -0700
Message-ID: <20260603051005.233094-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529065909.A01291F00893@smtp.kernel.org>
References: <20260529065909.A01291F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> +static int ili9488_dsi_probe(struct mipi_dsi_device *dsi)
>> +{
>> +	struct device *dev = &dsi->dev;
>> +	struct ili9488 *ili;
>> +	int i, ret;
>> +
>> +	ili = devm_drm_panel_alloc(dev, struct ili9488, panel, &ili9488_funcs,
>> +				   DRM_MODE_CONNECTOR_DSI);
>> +	if (IS_ERR(ili))
>> +		return PTR_ERR(ili);
>> +
>> +	ili->desc = device_get_match_data(dev);
>> +	ili->dsi = dsi;
>> +
>> +	dsi->mode_flags = ili->desc->mode_flags;
>
>[Severity: High]
>Is it possible for device_get_match_data() to return NULL here?
>
>If the device is instantiated without matching device tree data (for example,
>via a manual sysfs driver bind to a DSI device created without an OF node),
>device_get_match_data() will return NULL because the driver lacks an id_table
>and only provides an of_match_table. 
>
>Dereferencing ili->desc immediately after might lead to a NULL pointer 
>dereference in these cases.

This driver is DT-only in normal use and gets here through the OF compatible match. 
sysfs bind still goes through the DSI bus match path, 
so this is not an arbitrary bind-to-any-device case. 
The only NULL path I see is a non-DT DSI device whose DSI device name matches 
this driver, which is not a supported instantiation path for this panel.

That said, I can add a small check and return -ENODEV if reviewers prefer it, 
but I do not think this is a kernel-panic issue for the supported DT path.

>> +	ret = drm_panel_of_backlight(&ili->panel);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to get backlight\n");
>> +
>> +	ili->panel.prepare_prev_first = true;
>> +
>> +	ret = devm_drm_panel_add(dev, &ili->panel);
>
>[Severity: Low]
>Does devm_drm_panel_add() exist in the DRM subsystem?
>
>Looking at the DRM panel API, while there is devm_drm_panel_alloc() and
>drm_panel_add(), there does not appear to be a devm-managed version of
>drm_panel_add(). Will this cause a build failure when compiling the driver?

This looks like a false positive for this series. v5 is based on drm-misc-next, 
where e43a8e3ad8fa3 ("drm/panel: add devm_drm_panel_add() helper") 
adds and exports that helper.
