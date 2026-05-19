Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3183DB636
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 08:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180533; cv=none; b=tXsR1zcBoELYZgwTxdwr/X9ir+loJe4yUP61v1HPVabWe70wY1+PHfrbikBhD7m0ptPWDvFfmxeL9u1XwYi2+Wjgsx+PvstjJvVEOlvv/PN0g1clboMt+bnoCLKqNeKphtdlCO62+hCfoMvo4f6rEaB6b89U/YHN4Cst0VH3UXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180533; c=relaxed/simple;
	bh=UF7I3CX4d9g3O1rFS2mjaBJ4vc//5Lek40KwUaI9wLA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YStw4RxRCmqIDuXXWKMaglTONTgXALi17EA42xbbP3E4xk52iOFFniqqHSoXJFelOZgI4s09CRfsqbd0w1W7+hFsCnLythRbGzGPIJsL0KgleKmlNmjyuh8DjgzrFKcMK4MQWRPGPR2VyopevMJybt5CMHyEzvGtQRptkAYY2Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vTTECbvU; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vTTECbvU"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-448528f4e69so2127021f8f.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 01:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779180527; x=1779785327; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9A5oR9LfUq1C8nNCS43EEqyFoc4Cg2m4/oap+7EljRU=;
        b=vTTECbvUdQu3HWkg8mdIIrez2fX4UhFX8N8YbLr9LTtTzRKEsdpNlxW6ys7P+C0sSE
         WKZp9LAnC9B3HyiQg/msYRcgp/IH8yloacYER2N8YE+RV+p3t8RDMmAJLuDYht94YK7r
         p5NHD0IR/CWw5Qe/KQUKfSvRY4bKW1Mf5wp2IYeAa3zXH4Kp4KpwsYq/0yUnRc+prtXo
         88yjCLNjUS5KRAkZhGuIaQuyy8EQlpl9Rozzd4OCIA2b36KcThlWvCqJ6iWb2tFvIzG2
         d8JGX6IoRBZ5oJ5TKvZ1EiCAnKEmPaAcgJVInbjygs5MEd17AgZlgjLUgCHnJRBlArNa
         xvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180527; x=1779785327;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9A5oR9LfUq1C8nNCS43EEqyFoc4Cg2m4/oap+7EljRU=;
        b=eo6K8Kk8H688/JBmkf8/jP6zloTd8xxBmfQ8KcbVw++ae0Ns8ut9OfqiafsnBwQ9pP
         kzCDA0JB4tTolRV0nD2WmaAjMMOv2JqPnwATvnWaf3vDgsy6uZMT/blb4dtD0k0AP8d5
         /42WEXZ6DhIEgHEVtWFrKDdhAYLCt/hftfOlvCWgC/w5xSpvGfwiL7b5Lg9DLtnEPx1i
         090Ay04UZtRAA5FG2NCkTT5fOSKLtFRWNcWRvWSNIeTODH2HRXAg1N8Yrhrm6JfJrE9w
         IDFfofyIwMKHLDk+vGrgLHDtQwucVpAA7xOnXrb4DpIBuezvAYeXlGPwz7w5wbOnQdOd
         N5cQ==
X-Gm-Message-State: AOJu0YzdLF5weZZzA7NW8BcFTlh9jlsJ1qPmP4UHmWjHM1fBeBHsl+8/
	8Si5Rbc2pi1V0IlBzN0nd4dD5Zr89fmjpqYQ4//mRgadF9qRb0DjSmvSBlTLKVUa+QL3gcfGl//
	QL1UU
X-Gm-Gg: Acq92OGfDdnx42mvm/qK1lPotsdQVROnlHTgko01jgMp8yH2ksWn0fwH8Uvh8pxB6my
	hpGcjZp41kK+Z9EhT4nua4l9Zx8OjzuDTu/rpH6pyAt/bL4ZOTVWlnZRtO/NM0UOqLXltQn1gnz
	+e6obhXToje9Xp+CVayKYYyndydbZr6RwCD1W2kr0CwYbdFZSMRf0HMOgm6IdjsJTUlCw2Ix493
	FB9U7BLGZHUJcdoe3auK87T1Yk2oPwioKge/81CpWM9ob2pvM7aKENMVTaRQ5ifV5E80iuKt2Av
	3PUl0Nt1XAxIMGOEngjf/hv4H0flVPyEI6rFe9BEqP5YznqnIUDbOhOC6V9GzodjVJYwpJyvO1/
	1crp7hzWrCBXIKHPKCc5Ch3X1LVEzLsL48q2sBIUhzviebgEUej9EQ2pADTk1HuDIZ3XcMJWlOr
	WCS6Mk8bN7IeYcN03H4TcCLbMOyNXK+JJZLfYhWO/OALtQKPivvzBVvOHhDrleV+iZ08womhweq
	nnK5BWruVLF1ZE=
X-Received: by 2002:a05:6000:1885:b0:45e:8978:f176 with SMTP id ffacd0b85a97d-45e8978f1aemr3150966f8f.0.1779180527287;
        Tue, 19 May 2026 01:48:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a178adsm46361312f8f.18.2026.05.19.01.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 01:48:46 -0700 (PDT)
Message-ID: <c269c248-dcee-4ba6-bcb5-0185bfceedbc@linaro.org>
Date: Tue, 19 May 2026 10:48:46 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-2-b8929af5e951@linaro.org>
 <20260519083204.445EAC2BCB3@smtp.kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260519083204.445EAC2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/26 10:32, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] DCS initialization sequence sends SET_DISPLAY_ON before EXIT_SLEEP_MODE.
> - [High] Incorrect hardware power sequencing during teardown risks hardware damage.
> - [High] Resource leak of `vdd_supplies` in the `renesas_r63419_prepare()` error path.
> - [High] Panel is registered to DRM before DSI devices are attached, causing a race condition.
> - [High] Secondary DSI device is registered with the primary's `of_node`, causing an unintended re-probe.
> - [Medium] Silent ignore of errors on the secondary DSI link in multi-context DCS sequences.
> --
> 
> commit 536a4ce2d0cffbeb00543674b725c12c37ef3272
> Author: KancyJoe <kancy2333@outlook.com>
> 
> drm: panel: add support for the Renesas R63419 based dual-DSI video mode Display Panels
>      
> Implement support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.
> 
>> diff --git a/drivers/gpu/drm/panel/panel-renesas-r63419.c b/drivers/gpu/drm/panel/panel-renesas-r63419.c
>> new file mode 100644
>> index 0000000000000..1643a9c78c3fd
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panel/panel-renesas-r63419.c
> [ ... ]
>> +static int renesas_r63419_on(struct renesas_r63419_panel *ctx)
>> +{
>> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi[0] };
>> +	struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = ctx->dsi[1] };
>> +
>> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx1);
>> +	mipi_dsi_msleep(&dsi_ctx, 150);
>> +
>> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx1);
>> +	mipi_dsi_msleep(&dsi_ctx, 50);
> 
> Are the DCS commands sent in the correct order? Standard MIPI DCS sequences
> require exiting sleep mode (0x11) and waiting for the hardware to wake up
> before setting the display on (0x29). Sending a Display On command while
> the panel is still in sleep mode can prevent the display from turning on.
> 
> Also, does this silently ignore errors on the secondary DSI link?
> If a command fails on dsi_ctx1, the error doesn't seem to be captured or
> checked here. Additionally, mipi_dsi_msleep() only checks the primary
> context, so if a failure occurs on the primary, the sleep is bypassed, and
> commands to the secondary are sent without the required delay.

Right indeed, we may need to use a shared dsi_ctx, I overlooked this

> 
>> +
>> +	return dsi_ctx.accum_err;
> 
> Should this return a combination of both dsi_ctx.accum_err and
> dsi_ctx1.accum_err?
> 
>> +}
> [ ... ]
>> +static int renesas_r63419_prepare(struct drm_panel *panel)
>> +{
>> +	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
>> +	int ret;
>> +
>> +	ret = regulator_bulk_enable(ARRAY_SIZE(renesas_r63419_vdd_supplies),
>> +				    ctx->vdd_supplies);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	usleep_range(1000, 2000);
>> +
>> +	ret = regulator_bulk_enable(ARRAY_SIZE(renesas_r63419_vcc_supplies),
>> +				    ctx->vcc_supplies);
>> +	if (ret < 0)
>> +		return ret;
> 
> If regulator_bulk_enable() for vcc_supplies fails here, does this leak the
> regulator reference for the already-enabled vdd_supplies?

Hmm, indeed

> 
>> +
>> +	usleep_range(1000, 2000);
>> +
>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>> +
>> +	usleep_range(3000, 4000);
>> +
>> +	ret = renesas_r63419_on(ctx);
>> +	if (ret < 0) {
>> +		dev_err(panel->dev, "Failed to initialize panel: %d\n", ret);
>> +		regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vcc_supplies),
>> +				       ctx->vcc_supplies);
>> +		regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supplies),
>> +				       ctx->vdd_supplies);
>> +
>> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> 
> Could this hardware power sequencing risk hardware damage? The power
> regulators are disabled before the reset GPIO is asserted. Leaving a logic
> high voltage driven on an IO pin of an unpowered IC can back-power the
> chip through its ESD protection diodes. The reset GPIO should likely be
> asserted before disabling the regulators.
> 

This is asked by the spec

>> +
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int renesas_r63419_unprepare(struct drm_panel *panel)
>> +{
>> +	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
>> +
>> +	regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vcc_supplies), ctx->vcc_supplies);
>> +	regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supplies), ctx->vdd_supplies);
>> +
>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> 
> The same power sequencing issue seems to exist here during teardown.

This is asked by the spec

> 
>> +
>> +	return 0;
>> +}
> [ ... ]
>> +static int renesas_r63419_probe(struct mipi_dsi_device *dsi)
>> +{
> [ ... ]
>> +	/* Copy current DSI info */
>> +	strscpy(info.type, dsi->name, sizeof(info.type));
>> +	info.channel = dsi->channel;
>> +	info.node = dev_of_node(dev);
>> +
>> +	/* Register the second DSI device */
>> +	ctx->dsi[1] = devm_mipi_dsi_device_register_full(dev, dsi1_host, &info);
> 
> Could setting info.node to dev_of_node(dev) for the secondary DSI device
> cause an unintended re-probe loop? Because the secondary device shares the
> same of_node as the primary device, the MIPI DSI bus driver matching logic
> will match it against the same renesas_r63419_driver and invoke probe()
> again for the secondary device.

Hmm, good question

> 
>> +	if (IS_ERR(ctx->dsi[1]))
>> +		return dev_err_probe(dev, PTR_ERR(ctx->dsi[1]),
>> +				     "Failed to register second DSI device\n");
>> +
>> +	ctx->dsi[0] = dsi;
>> +	mipi_dsi_set_drvdata(dsi, ctx);
>> +
>> +	/* Get panel orientation */
>> +	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
>> +	if (ret < 0 && ret != -ENODEV)
>> +		return dev_err_probe(dev, ret,
>> +				     "Failed to get panel orientation\n");
>> +
>> +	ctx->panel.prepare_prev_first = true;
>> +
>> +	ret = drm_panel_of_backlight(&ctx->panel);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
>> +
>> +	ret = devm_drm_panel_add(dev, &ctx->panel);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to add panel\n");
>> +
>> +	/* Configure and attach both DSI devices */
>> +	for (i = 0; i < ARRAY_SIZE(ctx->dsi); i++) {
>> +		ctx->dsi[i]->lanes = ctx->desc->lanes;
>> +		ctx->dsi[i]->format = ctx->desc->format;
>> +		ctx->dsi[i]->mode_flags = ctx->desc->mode_flags;
>> +
>> +		ret = devm_mipi_dsi_attach(dev, ctx->dsi[i]);
> 
> Does registering the panel to DRM before attaching the DSI devices
> introduce a race condition? Calling devm_drm_panel_add() makes the panel
> immediately visible to consumers. If a consumer prepares the panel right
> away, it will attempt to send DCS commands over unattached DSI links.
> 



