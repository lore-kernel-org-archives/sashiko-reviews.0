Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124AD3546D1
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 08:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352392; cv=none; b=aSRJaEUQ8cMjAZPmm8VkiELqLeoWkwmToRFDEzBbUO0zj5BY8hXzgHFbw2BSNDbg96D7wFi8kRQDvvighL7L5WedXcxiD3k/2S/+lZCAaFfi8KRZ99MBbGxvSwUQkdvAlb+AjYBg+JEH5S2dq5Zkpf/MecYcYBMcbGRUmUrhgxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352392; c=relaxed/simple;
	bh=mDE7F8wVJgJEjEAHG5WtX3KpID23UHmJfbHZfqft+TI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fxufWSukvSH2ysqXPP/etIcVAiwU5VQpn2bWYsZ6w29UZ2Fi4ZbKBYopWsTwbHcm6ObAlHpyZZyfQS87dIvuKZRK+qkf/1BnHnb/XctR5uNvEd1tqCUfEPZKZZ4nRFltZQAa0qA/PVR4NFrZ65qaOeUHnBnpyGYLZDXml6hxNSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQ27riGY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQ27riGY"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso29969095e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 01:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779352389; x=1779957189; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmRWXyLwLE+NX7L+OQHNM2shVkMAyplWBHtM1KeJMvA=;
        b=YQ27riGYa8frvm+xZcFlEFgMe0plBmcAoj7gETI5yyc794MSPgJez/iRZ4OgQzt1SF
         FB0JwRtsgX6QUN4Hk33tFj9NErggcjYyqUHeFYOEwpSj03ZY0iR0ApD7LNy/705OwNgT
         FAHX8D349/zB35V7fHKQEco8SxIajtoYQc2V03OAWdm+joO4siOqv4r4uRnBMfu8NjX9
         X7SdZjjeoYCOMQwQ2oXU134u5GH/j55uzHeZ51o1YIz5KhYmd5Pkb/Rw6WBNdNEBWRIc
         9AmtLYJt8DRaivd3m4iB6Ob8kp4xQlB86DUDjwnVks1BPTkMzh2wvy4QWdYnh/a2Y5zU
         6R8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352389; x=1779957189;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmRWXyLwLE+NX7L+OQHNM2shVkMAyplWBHtM1KeJMvA=;
        b=a+0W2H2v83Q9IVFbOlki5ZzsymxhHF5hvd29d70A04hW+ibQUvr/mstdnDDxU/3mF0
         QSLjmz0wbnwc65OyduWt0SjaIzyKWIh0MhqI60RddNNw59Bujct65yZS979Di8uEp0vA
         UfyxWOsBN0KRffH4O7AkpiNoHg9zflnGeEemI8PyRkzKCcLkQgbx0Ynlm5jP9prEPS6U
         YVoiePrpFKWISuJDu6294FGgIf/eD5W1SCFG1fC7Twuk1VFWLgPq8ArBmkk94bCeJ8TC
         /osrh4rpscq4lidKWnbnBMC5tqYBEKJu644mvHSwOUC0lA1lnhWSaBOTOo6WzD9dlKVi
         Wtxw==
X-Gm-Message-State: AOJu0YwxLm6e+VJ2tm1xA8OcvulasP5kdYmjacfn2ZL1vMI3PFiBoZP3
	TiSDzhumVXQ3qJmbVB6t66aA9Q/VUbUvrrM1rW+7Jdzrdnw0uFpW7tkorSmuehl0iQ2MPdTxWD9
	pW/op
X-Gm-Gg: Acq92OHLeNERAQWdgFWn9OP3aTXl227GPq3Sbr06FLh8ZRNJR/KfUePFOIVAsP8V3Ol
	UmMmlzt+VJHC2SfwfymkKhBIm+12ztYi62kV6khHSNpH76U0JlfEiE/Gt2/NWgSKxRxfcPlqjtz
	DIQRU7SVP5kAr72VjK+qkq2vNfWHwTQr5Le742rdH3uX6nUiecxMeuJiJY9+oWQUZpXkZJajtig
	fNv65NUcYeCxAbvAif+IZwIJHLfN1spd0kwD1i7D0h0U+7EEGE1DNtYFZlYYZuyItBTzw1oHgtj
	sCuL0jVRaZfjXVVJRVJB15wQBegaukzXnlgpJGfVJLaj0czTg2UCo0mbo/fOfgGa/9AguwXuN0I
	lYkjbGe5/eNS4UnqXkgaIMvhL9D5IRQbrJSK8Ew2BXihFmltNI5hKCTHrj30p27wTXbXuSSpv5G
	P1QJxCnhRLey7kfV4G/9BiDfXAm95+AajUpEr2rYYtwDzqyztwBO8beEa900mSagf42GRWAsB/N
	Aao9OzAzCNaEqPBvg==
X-Received: by 2002:a05:600c:450c:b0:490:320:949 with SMTP id 5b1f17b1804b1-490360e3332mr22610385e9.27.1779352389353;
        Thu, 21 May 2026 01:33:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e038:7e8a:7467:8c6c? ([2a01:e0a:106d:1080:e038:7e8a:7467:8c6c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035ed7ea3sm10645555e9.26.2026.05.21.01.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:33:08 -0700 (PDT)
Message-ID: <19925582-2e79-4226-815d-0b062312431f@linaro.org>
Date: Thu, 21 May 2026 10:33:08 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: backlight: document the SY7758
 6-channel High Efficiency LED Driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org>
 <20260521081943.4CDAC1F000E9@smtp.kernel.org>
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
In-Reply-To: <20260521081943.4CDAC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/26 10:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing main power supply property (e.g., `vin-supply` or `vsys-supply`) for the LED boost converter.
> --
> 
> commit f0b2513f96c13c59660da8495c808919bb4b44ab
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: leds: backlight: document the SY7758 6-channel High Efficiency LED Driver
> 
> Document the Silergy SY7758 6-channel High Efficiency LED Driver
> used for backlight brightness control.
> 
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
>> new file mode 100644
>> index 0000000000000..80e978d691c29
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
> 
> [ ... ]
> 
>> +properties:
>> +  compatible:
>> +    const: silergy,sy7758
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  vddio-supply: true
> 
> [Severity: Low]
> Should there be a vin-supply or vsys-supply property included here for the
> main power input?

No, the vin is provided by the panel, it's not under Linux control

> 
> Looking at the driver implementation, it references VBST (V-Boost) registers,
> confirming it operates as a boost converter to drive multiple LED channels.
> A logic I/O supply like vddio-supply typically cannot provide the high
> current required to drive a boost coil for a backlight.
> 
> Omitting the primary power supply could prevent the kernel from actively
> managing the main power rail on boards where it is switchable.
> 
>> +
>> +  enable-gpios:
>> +    maxItems: 1
>> +
>> +required:
> 
> [ ... ]
> 

