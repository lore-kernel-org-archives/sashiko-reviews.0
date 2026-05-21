Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E339286334
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368743; cv=none; b=lSVhJq0ujfqEtoCrURSPGuvG08Kof2r75/sowpeqYPLkqYmaw3BEyAQKPVtEZNy7BiDecmcehX3uLzwwZOggL0YCWBp8TU/v3F/bj+zVL/6+DqGtlhR7bEiJh/tYtWbJXPXKhk35T/jXcIhgK2RA9wEayGdNdUmxtgRsy7842+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368743; c=relaxed/simple;
	bh=n0Pl8rbeUJyyitb7ikp5qjDLZNNPR61PHDkBbAhR76M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NO9dI3n+gjj2iju70clx90j9YboTKotOcWjLGiKld8bpW/x+XDA4HuN1aZJkMscs2mp/zMDS0X3NIFcVa9HwTiMVJHkvgHvoFLKjGtqwfG6LC+827PC/JqCi2NZJetTqCM2zFyXwcUMfDOutnRd4IIl/TlHko7kxz982Ac9wWx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R6S0OEMG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R6S0OEMG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49039a8851fso6450745e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 06:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779368740; x=1779973540; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xbf43KfAbMJSoLs0XSEz863R3Nc0TWzjoo1igeUK+E0=;
        b=R6S0OEMGH0RgfwiMm5Xw6kj2zBsoksKmWJeUR6WNCuI+eyuBNJufBbYnAM6poChq91
         Br7T0IzWmR2LDZoH3KIwYXRuAivh1J+zhj8uzRachJIb/Rwk38Pbq6KZxubg1RYkJaxQ
         +Xjk8r1y7vuBHRJiCOpWIO1btaLXre4d6C78W+Q0chOkL93cRhOUUNJFYiPINxy9uL02
         FobfdAdCGpBM1ObEJbmXH1muf0rwAqnk3QZx53s99eMdIAykyLaYyMe8OmZAh6xnDmjA
         ZC3jq2ENyxtNP5dJk8YB0t3NV+zOZL5L+5FVPywgrnlTnp9si/r4fblehYzI1HZmsEeU
         cY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368740; x=1779973540;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xbf43KfAbMJSoLs0XSEz863R3Nc0TWzjoo1igeUK+E0=;
        b=QEAJ7gzJB7s04kcOvquRdhziTbY/+NMLsRycYPnnaOJkQ9tMCquP6Gs+IlBIY4Vhcg
         QxzaKjHOBdSCfSzxgdr/cyUPVz88GMLJkgrfzjUtOoP3kbvafX7lY5ZWLM5Dnwzs+/bj
         rtRo5D7M8mmD4L790w1N4+0PuMM0X/tYv2Q7fAG10xZ447MOSzyTLlCLf7kPbI1TsG5h
         O53AJ3+Qff6ycmjj6wEdQGeiUhHOgSeP0xZ7U0iqo3v+LpJjcbYy0Ycl/a/hPefLzImI
         g2x8k6Z8MWkbhHXdnJgu4FwYTj5776W0uR6OyGG+bgKeoX7AwyKHY9qhY+x3K8UJG3Q1
         cxhw==
X-Gm-Message-State: AOJu0Yx9xmyIwm0yuPYjqzpU3GVWUSIhr245kTYqxqxVokOWg0q3dXx2
	gYLkbQpTZ+qNRMX7ODTxr6zmWgmqe0dR8PIiHN1Yxl0EGG3oDw49Y1h+o2ORdpUyqK6siS1R0Bc
	q3YMH
X-Gm-Gg: Acq92OHEi4UOTJSRF+PrzMyYTfo5VKUw9mpccLYJJ6Di3QtiLcubJk/51AlsKMbyqsr
	Eqbga8AkrGEq5O6VB4HQ8q63x/bCy/lXpzwIKVSyZAnopNT4sK2cdFAzp0dWQSaYINGL3DXzVeq
	Cl90GN7hIOt9xnX/DYizrmAlPdQX+4q+YB+iVB9/5y9aI356c3uiyzGF+JTXsuMfy6do7VDB9A+
	cqh4BOiSaxdtsCsV+UrW2+VzzlTcncWQiHJ1onvuPf77hrC3FSI3rJ/kS1iXltQ4YkJr+K+fERi
	LbffAuBR5gdkjRmJdQ/fcAlE5kT6EqGhJeIopOxHE4pl4CV8TuHY5qZKJcME933afUhjdWUtzbF
	I9nAyaAtCX4ddl5O0u8CU67rVJmIJZsMpvkD611+Us4J5XG3cRFLO5MfhCB0v1A+q7e7Jtqmjna
	vPLtHg61XDypdKSPrJBJihrvDBBPsYlSIL4TYKuVOL94WKSMSdkxRdDoYqGjjeCjBjdk7RxcC7T
	rD+X3I=
X-Received: by 2002:a05:600c:6c8:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-490360c52e4mr24227455e9.29.1779368739997;
        Thu, 21 May 2026 06:05:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:7e6c:bb76:ade5:7e8b? ([2a01:e0a:106d:1080:7e6c:bb76:ade5:7e8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035eeac95sm17825635e9.31.2026.05.21.06.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:05:39 -0700 (PDT)
Message-ID: <9bee9b2f-c05e-4c62-8df0-d6dea053a46a@linaro.org>
Date: Thu, 21 May 2026 15:05:38 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-2-dd5700299390@linaro.org>
 <20260521083821.998661F000E9@smtp.kernel.org>
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
In-Reply-To: <20260521083821.998661F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/26 10:38, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Uninitialized stack variable `dsi_ctx` causes undefined behavior in DSI initialization
> - [High] Incorrect MIPI DCS initialization sequence (Set Display On before Exit Sleep Mode)
> - [High] Race condition due to panel registration before DSI hardware is attached
> --
> 
> commit 1aa27fde3d1fe4c1d08cfa9a63d3e7e28912831f
> Author: KancyJoe <kancy2333@outlook.com>
> 
> drm: panel: add support for the Renesas R63419 based dual-DSI video mode Display Panels
> 
> Implement support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.
> 
>> diff --git a/drivers/gpu/drm/panel/panel-renesas-r63419.c b/drivers/gpu/drm/panel/panel-renesas-r63419.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panel/panel-renesas-r63419.c
> 
> [ ... ]
> 
>> +static int renesas_r63419_on(struct renesas_r63419_panel *ctx)
>> +{
>> +	struct mipi_dsi_multi_context dsi_ctx;
> 
> [Severity: High]
> Does leaving dsi_ctx uninitialized here leave dsi_ctx.accum_err with
> random stack garbage?
> 
> The helper dsi_link_switch() only assigns the dsi pointer, so subsequent
> multi-context calls like mipi_dsi_dcs_set_display_on_multi() might immediately
> return if accum_err is non-zero, silently skipping the initialization.

Good point

> 
>> +
>> +	dsi_link_switch(ctx, &dsi_ctx, 0);
>> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>> +	dsi_link_switch(ctx, &dsi_ctx, 1);
>> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>> +	mipi_dsi_msleep(&dsi_ctx, 150);
>> +
>> +	dsi_link_switch(ctx, &dsi_ctx, 0);
>> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>> +	dsi_link_switch(ctx, &dsi_ctx, 1);
>> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>> +	mipi_dsi_msleep(&dsi_ctx, 50);
> 
> [Severity: High]
> Is it intentional to send the Set Display On command before Exit Sleep Mode?
> 
> According to the MIPI DCS specification, the display must exit sleep mode and
> stabilize before it can process the Set Display On command. Sending these
> commands in this order will likely result in the panel ignoring Set Display On,
> causing it to remain blank.

It's required by the panel spec

>> +
>> +	return dsi_ctx.accum_err;
>> +}
>> +
>> +static int renesas_r63419_disable(struct drm_panel *panel)
>> +{
>> +	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
>> +	struct mipi_dsi_multi_context dsi_ctx;
> 
> [Severity: High]
> Like in renesas_r63419_on(), can this uninitialized struct leave
> dsi_ctx.accum_err with stack garbage? This might cause the panel disable
> commands to be silently skipped.

Good point

> 
>> +
>> +	dsi_link_switch(ctx, &dsi_ctx, 0);
>> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> 
> [ ... ]
> 
>> +static int renesas_r63419_probe(struct mipi_dsi_device *dsi)
>> +{
> 
> [ ... ]
> 
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
> [Severity: High]
> Could registering the panel before the DSI hardware is attached cause a race
> condition?
> 
> If a bridge driver concurrently finds the panel and triggers a display enable
> sequence, it might invoke the panel's callbacks before the DSI endpoints are
> actually attached, leading to DCS command timeouts or crashes.
> 
> Additionally, because devm actions are executed in reverse order on cleanup,
> the DSI devices would be detached before the panel is unregistered, exposing
> an unattached panel during driver unload. Should devm_drm_panel_add() be
> called only after all hardware setup and DSI attachments are complete?

No

> 
>> +		if (ret < 0)
>> +			return dev_err_probe(dev, ret,
>> +					     "Failed to attach DSI device %d\n", i);
>> +	}
>> +
>> +	return 0;
>> +}
> 

