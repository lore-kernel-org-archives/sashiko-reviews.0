Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B9A48094E
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584156; cv=none; b=UOb2VLE5+CB99o4PL3EGtz68zA6v8yFOW7vWKrYILN6CGQrx00L13WQnJQ+VuoSn1xNrG5AdFx7ZHjYqFeMimOYtSn21HxxpMz+BKAEz8jj/20AXJDW1a+owJmoQ08m/b9Ay1qeaoNrwg09dRuIvBiTiavEdMxGqXAgUP8F4SlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584156; c=relaxed/simple;
	bh=WhcVfvjiU5OOZnzJyfjaqNDG3/Fn+ujsPPuGRfolw5g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MxNC5e4HcJ3lp1oopk9Zis596P4mnDcFtTHF0hdD9RA3bXoRsuo1iWnKjaJsWLfIkGCXw57InsmO56gJVpYJazS/Xrb/BJU+zcjlYvXvO3zf8P829nrKM7gA1mBPyQL4THH2preLs0/jpR4KbC+3DnWSJx21qKMnmqImyc1vZY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FujdRgn/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FujdRgn/"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45fe59255beso409673f8f.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 07:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780584153; x=1781188953; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edXeUisUOZStFE68DISSeh9JLM/7psQJBNg/h6ooJj0=;
        b=FujdRgn/pbcMa2NmkNhZz+aHLZg0QXmq8iRkT23o/yD8B/Aj7fWI4oSBMj9EgBgCpQ
         w0cJ4UjdXTopPMVzBTfJU2wQbJ58G+e5+nawIwkikLBb5MZB9WW0Z5rok0rqdhD8c3Zt
         ZTeQycT24j7IddGqHoPzrWMfiCkxBw6UPbxOOzsLhT2DxTb6P7FLmlMG2dMhG8sxS4gu
         RP+xJ61mFN3wjdaQbY865VopmZD1wfSMXZe+rAEgQiAXGJjtcedE+3C50HIRYzlQcb9Y
         NN+cGt2SWyVNa99LHZ8oT/TxrEw/zZ2cQabRn4i9phR9cjAmiGz8fqGaJoEJ50YACygk
         KELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584153; x=1781188953;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edXeUisUOZStFE68DISSeh9JLM/7psQJBNg/h6ooJj0=;
        b=gZi5H4Qyg7QOKGf0xd3ZF/rI3WMHy8BaeZ6bxMNYSVekMSacHlFQCN/MjO4yalBDkE
         RezSjjF2y4VlK+yJ/Tp7iLQu8j2ZKtZk4l/y6DjZ3lklUrKpP98IwAFk8K7f2S548wJA
         Wg64R9jd8kxWkwzZhTkYdLbg0cdYtpbhlQ8MIhzaW1URLkqvYDpQOHUlUNBSb4d6leJ5
         lyxnyOceGQBUCq0l9EP4M8TpoOsfZ3lJacKBNVx20RguweT5sv3tLdWzjv2DfkYtQz7K
         dMiCcNGldgYCjYob0vmtMBtamR8ZDgAiaOAwc0U9iBgWyNpfbfG6F1j1+On7Kw7Odg+L
         Fv/A==
X-Gm-Message-State: AOJu0YxMO5MzIldRrU263rfrV8LWeMPaHcLrdBSW3eKOyk0bgyShubyG
	YI0s1P29UwAE7tsZs3owRRbAKivasSxnZxVa0Odgklm6LBpP1jw9NrMoaB5FLxxaOo76+7Gm2Jv
	+7UDN
X-Gm-Gg: Acq92OFbBDeP+meWww3WSrE5k+dLpwdGaeiHL8/75uPHGq6KgSuyM/7YY//ZBigA3fg
	78rXS65u7JLnbXc9Cj1LdFjzBjeskZ1TAJdLDBAGVPI0EdX9lTdCP4XG0b1EoGIU/sOyiBZ4q+r
	mqa98Al+hzxDPNOrT7AOTod+rBZtAIxhx3VtE5Mwt4k3syMeCmr5R/zmBE+unkGGvhH/5FCk7CK
	/J6EHDS2tjUisca3wCSmYNgvv3RqGceI7FY84wBGQt3r4CIgLAYtI9XSx/Y7AcsAwJEs1Zx3my/
	pQeXkkEzFOcTpr2HOawLhG3EXyfpNvSoluOY13wSXcEVtfHW9B2hPQsI+DBHpCxFpT+VHnr8e3k
	UMdweridIV7eGtcA1gGuD9Hl+NjyCGxkqwcEE4D/c/iDXmELJPuWSvdDbWxSEP7Au/8PXt8/oXy
	IGPpz8omtJXvE5RBDtsIJzGjkeKb1T1gWYeX4pGAI0M4RYpJF7/xm+OqMS/pyhRQxRR0A0806dN
	t4PJjEViUN7EyA=
X-Received: by 2002:a5d:6941:0:b0:43d:68ad:3b7f with SMTP id ffacd0b85a97d-46021829aefmr9569274f8f.21.1780584152786;
        Thu, 04 Jun 2026 07:42:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:dbd:100f:afd5:9221? ([2a01:e0a:106d:1080:dbd:100f:afd5:9221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm17426979f8f.4.2026.06.04.07.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 07:42:32 -0700 (PDT)
Message-ID: <18d06d5f-7bf3-4e8d-bc8e-b0c632864190@linaro.org>
Date: Thu, 4 Jun 2026 16:42:30 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel: Enable DSC for Visionox VTDR6130 panel
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260604-topic-sm8x50-vtdr6130-dsc-v1-1-09bcd1dff1fb@linaro.org>
 <20260604130349.2BE0F1F00893@smtp.kernel.org>
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
In-Reply-To: <20260604130349.2BE0F1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/4/26 15:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The panel driver DRM_PANEL_VISIONOX_VTDR6130 lacks Kconfig dependencies for DSC helpers, causing a linker error when compiled without them.
> --
> 
> commit 2b76aa2af63143268815713af0dc4f51234d7f43
> Author: Jun Nie <jun.nie@linaro.org>
> 
> drm/panel: Enable DSC for Visionox VTDR6130 panel
> 
> This commit enables display compression (DSC v1.2) for the 1080x2400 Visionox
> VTDR6130 AMOLED DSI panel. It sets up the DSC configuration parameters and
> sends the picture parameter set during panel initialization.
> 
>> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>> index 97a79411e1ecd..0cdcdbbc766da 100644
>> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> [ ... ]
>> @@ -123,6 +128,9 @@ static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
>>   	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>>   	mipi_dsi_msleep(&dsi_ctx, 20);
>>   
>> +	drm_dsc_pps_payload_pack(&pps, dsi->dsc);
> 
> [Severity: Low]
> Will this cause a linker error if CONFIG_DRM_DISPLAY_DSC_HELPER is not enabled?

Good catch

> 
> This adds a call to drm_dsc_pps_payload_pack(), but it doesn't appear to
> update the Kconfig entry for DRM_PANEL_VISIONOX_VTDR6130 to select
> DRM_DISPLAY_DSC_HELPER and DRM_DISPLAY_HELPER.
> 
> Could this lead to undefined reference errors during the build for
> configurations where the panel is enabled but the helpers are not?
> 
>> +	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
>> +
>>   	return dsi_ctx.accum_err;
>>   }
> 

