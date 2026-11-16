Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815152;
	b=YmYHAqDKaxEmyWX3lS4F5JoqPYhhs8/BNoak+8RjRCFk77nW4igRlXOgvTgsvVeyjBig
	 cBwEQTnNMDbQPzvvHRu2S7eRwDwVPhjvR60YHaPH7l2tEnFvSueP3W/ZZjUwQeRmgoWPF
	 zd3k/fJXr1w/HjVdYN1hQbpbTunmdpLsiDjpJrLarT/fffVfhatklidE60sdxgVa/vzs2
	 /9fdZ0916vh6UsVy7EU2chVVfq/Q6/vd0X1g61i/zc+5xWkYsPU1z/fZ8h1tMw/w6NhhR
	 9Lo5GjjvP/DX923IMYQGnCAz+bibchfqDvqr1GAgffqGGo3PYAoxnS04a39CYN0aTgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UnB58VtwIqHbFAiwQpoPWYvPypnxq/uodwoMm6+SFKg=;
	b=BHxATySM+jxRoGNVBXKmeHCFNhLbSJUne6BtByZV5DRxbePvQ9FTrzun4l8af059ACNu
	 eTz0+OwKcbQts5CybZ6A+MW9cuOWNFPESkE2Gzjnp8r7Xx25Tj7jfar5fuT7g25WNVPRY
	 UHHMGuO6aI3MgwmHjEJn5WDLjcONSSmxyqkOO6el/mxyRZooFuJdhH/rteYQvYiGXZm4j
	 Pl5BT4BhDyH7vQ1UjWdyv7WY8757ZpLxjZklFqmBJ3K3y/1NAnjXU6hOLMvHS7aGN5Hfx
	 hwXAVYuJUZ0JgQgZhMzGIyT3HS7m2pvJIy9KUkSu0w/hg5xozQPKj7YsYAMWp4nYjSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TyFZb78C;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD5C606A8AF
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 07:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD5C606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TyFZb78C
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso16746785e9.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 23:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815150; x=1795419950; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnB58VtwIqHbFAiwQpoPWYvPypnxq/uodwoMm6+SFKg=;
        b=TyFZb78CuOKcmyhUFqC+WYA3CuZ3oK0SLMdpoijnUHV9sBZb3slNWB/ZXeSvGIXfZt
         678Mlf8hmYXGXuNsmZmnhUGMRgEmOlEsjMYUuVZoJCmlU60BWtsApisgkEjjRflV7BJ4
         DbNG8vlxODeGRYSXYPAjZMvsff8m939eNvzyO2uRDHacU6QnXHJbwvUdpWxi9XM4wHhW
         Ai/O6xR0+GnW2ys1AtohDgvMPYOWsUUO3O4VhNmt3dYIqYKRdc2JiKnZ6A8YcviDRNFm
         OwRAl3Gyj/w0yx5H/lVlGwrRkrUeLYwhVN7+hol6IxeGblX7ADV+CW9zgKicHvNE0aLl
         o8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815150; x=1795419950;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnB58VtwIqHbFAiwQpoPWYvPypnxq/uodwoMm6+SFKg=;
        b=REN5WLAfstMgN+ODqXB/Lg/lQBUYHJKsPEalXqGV2N0zSqAj8LRUUV06qaKAKjM9DJ
         waCbifNFJtjIw/1falkgObj0O9mENLyG/wp7ReuGx3lS8D3zXWOmwaBWPRq7jea0kxvy
         eYc5EL8eY8Qc7xMdaDCUv3qvEtiFZNJsDXFnyA3ObZHn6OP6s0y4z9aEdMCiSeBBvHb2
         YVMd2NhH3r0NuVc7ztzA9IQmbmKi85s/jzb1soucSfUjYHQsvo/jfsqz0uh14PxNRn9y
         2WQbIAOr7Iem/aWpAVOGoVLbp9O23LJSedV0gdI1hLHKAvGzColMhat+Uk86nyIhg+yq
         5FcA==
X-Gm-Message-State: APuU4Z+yiX5FWMzoeFIgj8f16AYJf/Q01QVUIJB7GNoFiyB7nToDNk61
	WdAa3JXTswjNwpUnQ2sHgz7lfPU+YQyf70Ax2SInpZqUmlMVjCtf2ywMi0gpMCBn5F428uiZ66M
	a3qLIZMs=
X-Gm-Gg: AYBFou2/hqXiO5LTPDohOoYS1pjO1Og7ra3Yt7e9sF+w+LRCe/qFRjWyypXP6Rl2KlV
	0e9FISrA1egMhoQhJQ3QZodyBUPmKZYvjHV5KfAkJxaaBDif8xIoOf3QwyZEJQNnE+j7jQqoQMm
	GBTBmmqjhTD6FH8+DS+gc6YoxV5kuBmeSFNtUqjauSZzzNo45qS0afwvWlj3SacbZ2jsSGyFTtw
	jkiZmLP4v8KhGktCjiEkAeK5jxsIQfXFvRCX9BKMZfKtLmd9a0sGocvEEy9MtaZ7oxb6qjA12vl
	t8RBC9ORuKVGB3tm0L2U/Ps3Cy/ziUKPY3KorqWp3kmqgB31lMbTrvtwvAK+f91yI533HBfgXNL
	q/NlPdEvW1bOtTN3eicIubZyDkumGhu3q4WegYXiOhi3lfVgxG90Rgg2Eu+iuQ+XrThIWo9Cilj
	W/a5/CDuvcWUZWhokCv8qhQzFwRnszsRZ7Tmh5YYuyc5vZCCxtmoGLoWnH7UkdbkLMEaHe5bqs7
	t5Hz+6HbW5kQcoj7Rv5+btYYPb/PA4Tqw7Dn6Pg6f8j4x9oI+usXyK7Obe/RvOixTpfiKVNzPHR
	thIaDFMr+obth3FlGBgG0Kg1WAmVFqSRP3JWQtTt/6p5Zf0QaumxoNgrWNPhEUdKfchMTuKcRcO
	RgyOwEmefVA==
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr214478045e9.11.1794815149872;
        Sun, 15 Nov 2026 23:45:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6caae30csm89916945e9.2.2026.11.15.23.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:45:49 -0800 (PST)
Message-ID: <04b0fbb4-6083-4321-a907-f3b23a4c90f1@linaro.org>
Date: Mon, 16 Nov 2026 08:45:49 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 07/23] ASoC: dt-bindings: qcom,lpass-cpu: document the
 SM8650 LPASS
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-7-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213486@kernel.org>
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
In-Reply-To: <sashiko-outbox-213486@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 19:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] ASoC: dt-bindings: qcom,lpass-cpu: split unwieldy per-compatible
>    schema
> --
> 
> commit f17c7c8f20845c2d15f821f60a13b5f93656ae8d
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: dt-bindings: qcom,lpass-cpu: document the SM8650 LPASS
> 
> This commit adds the qcom,sm8650-lpass-cpu compatible string and its
> register, clock, and interrupt definitions to the qcom,lpass-cpu binding
> schema.
> 
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> index 3a559bd07a79b..f431173a0e880 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> @@ -23,32 +23,33 @@ properties:
>>         - qcom,apq8016-lpass-cpu
>>         - qcom,sc7180-lpass-cpu
>>         - qcom,sc7280-lpass-cpu
>> +      - qcom,sm8650-lpass-cpu
>>   
>>     reg:
>>       minItems: 1
>> -    maxItems: 6
>> +    maxItems: 8
>>       description: LPAIF core registers
>>   
>>     reg-names:
>>       minItems: 1
>> -    maxItems: 6
>> +    maxItems: 8
>>   
>>     clocks:
>>       minItems: 3
>> -    maxItems: 10
>> +    maxItems: 16
>>   
>>     clock-names:
>>       minItems: 1
>> -    maxItems: 10
>> +    maxItems: 16
>>   
>>     interrupts:
>>       minItems: 1
>> -    maxItems: 4
>> +    maxItems: 6
>>       description: LPAIF DMA buffer interrupt
>>   
>>     interrupt-names:
>>       minItems: 1
>> -    maxItems: 4
>> +    maxItems: 6
>>   
>>     qcom,adsp:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>> @@ -59,6 +60,8 @@ properties:
>>       maxItems: 3
>>       description: Phandle to apps_smmu node with sid mask
>>   
>> +  dma-coherent: true
>> +
>>     power-domains:
>>       maxItems: 1
>>   
>> @@ -241,6 +244,65 @@ allOf:
>>           - iommus
>>           - power-domains
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpass-cpu
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 16
>> +          maxItems: 16
> 
> [Severity: Low]
> Should this binding be split into separate schema files (sharing common DAI
> definitions via a common schema ref if needed) instead of adding another
> large per-compatible if-then block to qcom,lpass-cpu.yaml?
> 
> Each SoC variant here has substantially different reg, clock, and interrupt
> counts and names.  Fitting qcom,sm8650-lpass-cpu into the same schema also
> widens the top-level maxItems limits and enables dma-coherent at the top
> level, which relaxes validation for older compatibles like qcom,lpass-cpu
> and qcom,apq8016-lpass-cpu whose if-then blocks only constrain clocks and
> clock-names.
> 

Will follow maintainers preference here
