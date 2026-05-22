Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CBF23A984
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 12:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453626; cv=none; b=K8gUgrYxPvUruCkz9EaQruz0mL7Bxk1V7dQ+FopNrO4bTNBVoSbb3pV7xVvAGEYYtdGV9AfaUA3R+yAshEyZq+z0nQBwfDvCMH3/pex4rPLRNWqy8F+zeEzixMzHcLkO80kKI1dfdD1t1Z30+FVHtxq4k6te6zQtbTCQKyUHSrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453626; c=relaxed/simple;
	bh=EaHdSbpoBfDFdvmLaM2RzlTrg0krsCYeXw6o8Kh8L6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBDTP8mcr89n3fQ9JMKKOAXBxETrKZWVdaSC8hWkVVpAzK8A+/8pty/NHXLBqwX5oQoGNXywFYaTkepoS1eAY6FirhZREr2bs/jC1iVhpuJ3tGahXHvtllIExHSHUWE78/6vTxotJupaKoEFBQr/eAsorAwKbDWuyxJ239/qdYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sWAtXFjx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sWAtXFjx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-449de065cb3so6894921f8f.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 05:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779453622; x=1780058422; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmGqTOyHvD72gyk+cwZRGMxBl5PRZzglr/HGbQODdno=;
        b=sWAtXFjxsOAvKdOpXs/O2gwdYi/b8qq5br6mwAR8p9cBtUEx8qLcurMp4WP+J9MRS0
         KFbkfGoITGlu04Oet1p6RbtzNUii0PhpgraclmYrvhxDPPRzlbygiXqChKtgWE5aLcKv
         goQi5OENCLxs/wLSXcxrzVG90Z9of5paft0FGa7FIPSJoFT2PWL2tz5wczA+r8GvC41c
         4VarZJnTJRSRHzJM2TOVK507dOnQChMSsbeOabDGay0nTEIQe/uUfMHBqWgz3aMEWykj
         6OIBxSdJ9Jm/XHMuGqsZO9SpRT+bYYNW9NQS+pykHIeMJQM/7IXkugADFXn0+ILVHqJQ
         28Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453622; x=1780058422;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmGqTOyHvD72gyk+cwZRGMxBl5PRZzglr/HGbQODdno=;
        b=VCs0i2uPAqAJF7ovzy7r0qbODBFF4LvjxlBbIcTEOC5YYHCDWz9XtZTWkggF5b6NBh
         KHMMm6nf8WZuX206vqgnSu0/HkbHyEoiIQ13fTDtCpNHOQNZHkZ/7Pfk/r3ODG9Ag8um
         JfXDFFAKC33RoGeqb2JtURx+ZqlPLgiQgoLK7X6wefmRbj0yVz8gUmymdUVICxvPtYH0
         8fW9kHeEgR3Dm7aTRREjyKWVL0y2UTvQA9bZ0ftnlyTshwB+AUxyQJLSrJm1CNPUFvLy
         PtNH0fgE5djq1CkOBI7wF1Yg7/OkWF4dhjYKuPHVWP+eLBxz8PYJWqyNNojgunWNcBKG
         ylSw==
X-Gm-Message-State: AOJu0YyXYbZB8ZloXEXy/BLYtv7g9IVy2AS2Ghil/hAZawE48mfs0PMA
	HJENQ0kg8M8PDph84FnNsmSH4kd8jG+/0SmH71JWbsxT61ML5fGZ95iHCXVV4otoPOI1d4vIEvC
	crmziHbs=
X-Gm-Gg: Acq92OHg1ekss+Gg5R21sYCfRfpA2efBIGGcATEMXA5K7kM3VFlCDJ0xloLCo2wU5we
	auP2EU8fZx7vB0i7XOpEOkrRE5Y+kw6JueQ1LHUuPa9NN2WqAstyqtlbt3qkBfW5Kni+x4vrl6Y
	UF38J0LVjSIWvNnh8vlTxw0C8oNeOGTrQLD/O5txmsACYEZU3qau3mD/DkN98Pop5bt8ZoXkGo8
	Mqt6PWTZ41GsR2UFtntKMe/tJbLj/CYuANGyHHfBYEpiAXNYIwdN2cajETS4LHZ+1zdWxdacFpD
	aJn8Y5z14kwU6kCkep8DaSpWI+7fFxoTu6DAH1NNnEbSlnu3fLsSKXcUA4yrZhd/O8S7GvKaUUR
	eOey/Ot58Hs2va3XHPTTzSQ5l/ccP2p2FlIcwSR2mfzbiuJAiKTbQ4QJqKQUAqxqKBOWmuhYLj2
	pjLnKdwLnYzYdw5GjO2FcZhZoKLCscDSlDhfVAJcmuYO7xzjltcfFhNpeGKwSn4UEbwuQFhiSSe
	egHiRb9ErSGjk8=
X-Received: by 2002:a5d:64c2:0:b0:43d:7868:21f0 with SMTP id ffacd0b85a97d-45eb3670591mr4903931f8f.9.1779453622099;
        Fri, 22 May 2026 05:40:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e40:8f70:d414:3f93? ([2a01:e0a:106d:1080:e40:8f70:d414:3f93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d71688sm4018786f8f.33.2026.05.22.05.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:40:21 -0700 (PDT)
Message-ID: <c40fd8f9-0e52-43a0-b806-d611db35603b@linaro.org>
Date: Fri, 22 May 2026 14:40:20 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/5] drm/panel: Add driver for Synaptics R63455 DSI
 panel
To: sashiko-reviews@lists.linux.dev, Jun Nie <jun.nie@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260521-sm8650-7-1-bonded-dsi-v4-5-a4dd5e0850f1@linaro.org>
 <20260521163039.30D3A1F000E9@smtp.kernel.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260521163039.30D3A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/26 18:30, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 10 potential issue(s) to consider:
> - [High] Incorrect order of error unwinding labels in `r63455_prepare` causes resource leaks and unbalanced regulator operations.
> - [High] The secondary DSI device registered during probe is never unregistered, causing a memory and device leak.
> - [High] Endianness extraction macros misuse host-endian functions, resulting in reversed byte order on Big Endian architectures.
> - [High] Unconditional access to `ctx->reset_gpios->desc[1]` leads to an out-of-bounds array read if only one reset GPIO is provided.
> - [High] Failure of `drm_dsc_setup_rc_params` is logged but ignored, leading to division by zero and uninitialized data usage.
> - [High] Backlight updates send DSI commands after the panel has entered sleep mode, risking hardware timeouts.
> - [High] Premature publication of backlight and panel interfaces leads to use-before-initialization races.
> - [High] Unprotected concurrent read-modify-write on `mode_flags` causes data races.
> - [High] Unaligned pointer cast causes unaligned memory access when packing DSC PPS payload.
> - [Low] Missing Kconfig dependencies for DRM DSC helpers causes build failures.
> --
> 
> commit b5b6e09241eeff17cb03a31aac27b70f4e5ca911
> Author: Jun Nie <jun.nie@linaro.org>
> Subject: drm/panel: Add driver for Synaptics R63455 DSI panel
> 
> This commit adds support for the DSI panels used in the virtual reality
> device. The device features two physical panels, each providing a MIPI DSI
> interface and a built-in LED backlight, and exposes a single logical panel
> to the DRM framework.
> 
>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>> --- a/drivers/gpu/drm/panel/Kconfig
>> +++ b/drivers/gpu/drm/panel/Kconfig
> [ ... ]
>> @@ -1185,6 +1185,15 @@ config DRM_PANEL_SYNAPTICS_TDDI
>>   	  namesake, with varying resolutions and data lanes. They also have a
>>   	  built-in LED backlight and a touch controller.
>>   
>> +config DRM_PANEL_SYNAPTICS_R63455
>> +	tristate "Synaptics R63455-based panels"
>> +	depends on OF
>> +	depends on DRM_MIPI_DSI
>> +	depends on BACKLIGHT_CLASS_DEVICE
>> +	help
>> +	  Say Y if you want to enable support for panels based on the
>> +	  Synaptics R63455 controller.
> 
> [Severity: Low]
> Does this need to select DRM_DISPLAY_DSC_HELPER or DRM_DISPLAY_HELPER?
> The driver calls drm_dsc_set_const_params and other DSC helpers, which
> might cause link-time failures if the helper infrastructure is not built.

Yes

> 
> [ ... ]
>> diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63455.c b/drivers/gpu/drm/panel/panel-synaptics-r63455.c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panel/panel-synaptics-r63455.c
> [ ... ]
>> +#define r63455_dsi_write_buffer(ctx, dsi_ctx, d)					\
>> +	do {										\
>> +		dsi_ctx.dsi = ctx->dsi[0];						\
>> +		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, d, ARRAY_SIZE(d));		\
>> +		dsi_ctx.dsi = ctx->dsi[1];						\
>> +		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, d, ARRAY_SIZE(d));		\
>> +	} while (0)
>> +
>> +#define LE16_BYTE0(val) (le16_to_cpu(val) & 0xff)
>> +#define LE16_BYTE1(val) ((le16_to_cpu(val) >> 8) & 0xff)
> 
> [Severity: High]
> Are these macros extracting the correct bytes on big endian architectures?
> Using le16_to_cpu() on a native integer constant swaps the bytes on big
> endian systems. Applying the bitwise operations afterward will extract the
> most significant byte instead of the least significant byte. Would standard
> bitwise shifts be safer here?

No we extract the low byte and high byte of the 16bit number converted to the cpu endianness,
so it's the right code here.

> 
> [ ... ]
>> +static int r63455_dsi_populate_dsc_params(struct r63455_ctx *ctx)
>> +{
>> +	int ret;
>> +	struct drm_dsc_config *dsc = &ctx->dsc_cfg;
> [ ... ]
>> +	/* handle only bpp = bpc = 8, pre-SCR panels */
>> +	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
>> +	if (ret < 0)
>> +		DRM_DEV_ERROR(ctx->dev, "failed to setup dsc params\n");
>> +
>> +	dsc->initial_scale_value = drm_dsc_initial_scale_value(dsc);
> 
> [Severity: High]
> Should this return early if drm_dsc_setup_rc_params() fails? If execution
> continues, the driver will use uninitialized DSC configuration parameters.
> Because values like initial_xmit_delay might remain zero, it can result in
> a division by zero when calculating final_scale inside
> drm_dsc_compute_rc_parameters().

Good catch

> 
>> +	dsc->line_buf_depth = dsc->bits_per_component + 1;
>> +
>> +	return drm_dsc_compute_rc_parameters(dsc);
>> +}
> [ ... ]
>> +static int r63455_panel_on_sharp_ls026b3sa06(struct drm_panel *panel)
>> +{
>> +	struct r63455_ctx *ctx = panel_to_ctx(panel);
>> +	struct mipi_dsi_multi_context dsi_ctx = { 0 };
>> +
>> +	u8 pps_cmd[1 + sizeof(struct drm_dsc_picture_parameter_set)];
>> +
>> +	drm_dsc_pps_payload_pack((void *)&pps_cmd[1], &ctx->dsc_cfg);
> 
> [Severity: High]
> Can this unaligned pointer cause alignment faults? Passing &pps_cmd[1] forces
> the base address to be odd. Since drm_dsc_pps_payload_pack() treats the
> pointer as a struct and performs 16-bit stores to its fields, this might
> trigger alignment panics on architectures that strictly enforce memory
> alignment.

Yep, best would be to work on a struct drm_dsc_picture_parameter_set on the stack
and copy it to pps_cmd[1].

> 
> [ ... ]
>> +static int r63455_set_brightness(struct r63455_ctx *ctx, u16 brightness,
>> +				  u16 pulse_offset_rows)
>> +{
>> +	struct mipi_dsi_multi_context dsi_ctx = { 0 };
>> +	u16 gpo1_tew1;
>> +
>> +	gpo1_tew1 = brightness > BRIGHTNESS_MAX_120 ?
>> +		    BRIGHTNESS_MAX_120 : brightness;
>> +
>> +	ctx->dsi[0]->mode_flags &= ~MIPI_DSI_MODE_LPM;
> 
> [Severity: High]
> Can this read-modify-write of mode_flags race with the similar modifications
> in r63455_enable() and r63455_disable()? Because set_brightness() is called
> from sysfs context and enable/disable from DRM commit context, concurrent
> access might corrupt mode_flags and drop critical settings like
> MIPI_DSI_MODE_VIDEO.

It's very improbable this happens, panel cmds and backlight are called at very different times.

> 
>> +	ctx->dsi[1]->mode_flags &= ~MIPI_DSI_MODE_LPM;
> [ ... ]
>> +static int r63455_disable(struct drm_panel *panel)
>> +{
>> +	struct r63455_ctx *ctx = panel_to_ctx(panel);
>> +	struct mipi_dsi_multi_context dsi_ctx = { 0 };
>> +
>> +	ctx->dsi[0]->mode_flags &= ~MIPI_DSI_MODE_LPM;
>> +	ctx->dsi[1]->mode_flags &= ~MIPI_DSI_MODE_LPM;
>> +
>> +	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_SET_DISPLAY_OFF);
>> +	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_SET_TEAR_OFF);
>> +	r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_ENTER_SLEEP_MODE);
>> +
>> +	mipi_dsi_msleep(&dsi_ctx, 200);
>> +
>> +	if (dsi_ctx.accum_err)
>> +		return dsi_ctx.accum_err;
>> +
>> +	return backlight_disable(ctx->backlight);
> 
> [Severity: High]
> Is it safe to disable the backlight here? The backlight_disable() function
> calls r63455_set_brightness(), which will send DSI configuration commands to
> the panel. Doing so after sending MIPI_DCS_ENTER_SLEEP_MODE violates the DSI
> hardware contracts and might cause bus timeouts or hardware crashes.

It's required by the hw spec.

> 
>> +}
>> +
>> +static int r63455_unprepare(struct drm_panel *panel)
>> +{
>> +	struct r63455_ctx *ctx = panel_to_ctx(panel);
>> +	int ret;
>> +
>> +	gpiod_set_value(ctx->reset_gpios->desc[0], 0);
>> +	gpiod_set_value(ctx->reset_gpios->desc[1], 0);
> 
> [Severity: High]
> What happens if the device tree only provides a single reset GPIO? If ndescs
> is 1, accessing desc[1] will read past the end of the flexible array,
> resulting in a garbage pointer dereference.

Won't happen, both are mandatory

> 
> [ ... ]
>> +static int r63455_prepare(struct drm_panel *panel)
>> +{
>> +	struct r63455_ctx *ctx = panel_to_ctx(panel);
>> +	int ret;
> [ ... ]
>> +	msleep(20);
>> +	gpiod_set_value(ctx->reset_gpios->desc[0], 1);
>> +	gpiod_set_value(ctx->reset_gpios->desc[1], 1);
>> +
>> +	return 0;
>> +
>> +bl_off:
>> +	regulator_bulk_disable(ARRAY_SIZE(ctx->reg_bl), ctx->reg_bl);
>> +vdda_off:
>> +	regulator_bulk_disable(ARRAY_SIZE(ctx->reg_vdda), ctx->reg_vdda);
>> +bias_off:
>> +	regulator_bulk_disable(ARRAY_SIZE(ctx->reg_lcd_bias_pos),
>> +			       ctx->reg_lcd_bias_pos);
>> +	return ret;
> 
> [Severity: High]
> Are these error labels in the correct order? They appear to fall through
> sequentially rather than unwinding in reverse. If reg_vdda fails to enable,
> the jump to bl_off will disable the backlight, but then incorrectly fall
> through to vdda_off and bias_off. This causes regulators that were never
> enabled to be disabled, and completely skips disabling regulators that were
> actually enabled.


Jun, please check the order

> 
>> +}
> [ ... ]
>> +static int r63455_probe(struct mipi_dsi_device *dsi)
>> +{
>> +	struct device *dev = &dsi->dev;
>> +	struct r63455_ctx *ctx;
>> +	struct mipi_dsi_device *dsi1_device;
> [ ... ]
>> +	dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
>> +	of_node_put(dsi1);
>> +	if (!dsi1_host) {
>> +		DRM_DEV_ERROR(dev, "failed to find secondary dsi host\n");
>> +		return -EPROBE_DEFER;
>> +	}
>> +
>> +	dsi1_device = mipi_dsi_device_register_full(dsi1_host, &info);
> 
> [Severity: High]
> Does this dynamically allocated dsi1_device need to be unregistered? There
> is no call to mipi_dsi_device_unregister() in the error paths below or in a
> remove callback for the driver, which could cause a permanent device and
> memory leak when the module is unloaded or fails to probe.

Good catchm, should be devm_mipi_dsi_device_register_full()

> 
>> +	if (IS_ERR(dsi1_device)) {
>> +		DRM_DEV_ERROR(dev, "failed to create dsi device\n");
>> +		return PTR_ERR(dsi1_device);
>> +	}
> [ ... ]
>> +	ret = r63455_panel_add(ctx);
>> +	if (ret) {
>> +		DRM_DEV_ERROR(dev, "failed to add panel %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	for (i = 0; i < 2; i++) {
>> +		dsi_dev = ctx->dsi[i];
>> +		dsi_dev->lanes = 3;
>> +		dsi_dev->format = MIPI_DSI_FMT_RGB888;
>> +		dsi_dev->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
>> +			MIPI_DSI_CLOCK_NON_CONTINUOUS;
>> +		ret = devm_mipi_dsi_attach(dev, dsi_dev);
> 
> [Severity: High]
> Does calling r63455_panel_add() before devm_mipi_dsi_attach() expose the
> backlight sysfs interface too early? If userspace writes to the brightness
> node before the DSI lanes and formats are configured and attached, it could
> trigger a DSI transfer on an unattached device and crash the system.

No

> 
>> +		if (ret < 0) {
>> +			DRM_DEV_ERROR(dev, "dsi attach failed i = %d\n", i);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 

