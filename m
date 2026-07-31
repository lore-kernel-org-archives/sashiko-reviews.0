Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD8B3D5640
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488047; cv=none; b=ouhzXK8wHmUlGmMC+OEL4uLfFADsODrr+Bxwc74J1l0DrSPDUXPkcgJd3OoL6pBRdom0/QEeKOPIt3Jahn+mtYmAJrbVWdRzqlSN5Zh+HOoF0I0kBXQRRlGoeVABazNVvryaTQnV9W9QOpBORhdNAW0iwqEimAplijz7pbJ3hdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488047; c=relaxed/simple;
	bh=9hkG8hq7f3EoD94RjJhCYXhfWclpz33msdh4Jv9kHUQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cO/o0c46JJhbEbR9Z49m6VYkyFbGqyVYepR1VlvFX4wFiW0HNZieM4U7KpGBbKdLwtCxYLHG258vg3ykM3MbECqpFYCf7MFL/Og9qfSfE2zqJ47dSDeUumL2/bJWyhegNtmc5hHZA3eMDpqgxyU3u/kxzP0C8rcaAnf7DL/Ioks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lphkGdfy; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lphkGdfy"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4728c12ba97so424785f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 01:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785488043; x=1786092843; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJGQeaClS5HVPjwprrOHXs8CtxZCye4wlWhVPeRubIk=;
        b=lphkGdfyjkOXPByNxxXGxTlnGqApoixRChJ2sPO64JkAjQgSHSmDgxhiURP7F8X2ew
         ZJCA/wlYw22A6w3tK4HhKkkUYtdOycEBfFiTJ1PvU7rYLVh5hDNOIUnS9JTBY/k2loi6
         XipD472cz8PqGSS5otu0Nfak9CYUWF4St/s1zFXjduJWBRI7LMb8t3NDmJEnrPZ1Gcqv
         671gwddoyfXqEThSn1tQtIqrdCRQYMFe4F+xaf58yCiAsJtuimweuKR+GjMGqOU2wQDZ
         9DK8i1cq0bSUvUe4QqRH20GI7+EynNhOWD0KWmp1oOHG4yStF/tlxfktL+fL6+1sHzpp
         bWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785488043; x=1786092843;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJGQeaClS5HVPjwprrOHXs8CtxZCye4wlWhVPeRubIk=;
        b=iRyhn7lN0v144ZVD4PXHhRr8Lh3XpDAeOk34otvuxtiqLmsY9N2PVME5CwY0BOmHPU
         d4dam0BymuHWB2zyxGrXHdbjp4X/OGTpF4XZZ2uGBZzhnexaEbKYDSeK1wv/HlsmRtlw
         R8WZhTUXXIDkfP40BXRANUD79sPiB9e5cdn8K0KvIVIirTIqedwW2LMFF1J8YPdzDuz8
         ObiwbW4Pi/UPQPqekSBswg3XwcR9Kot7Y3KH1QHHwL6VLF7DL0d+eJ+DZKTsFnKecIud
         P/rkmiyr/GgOkSqNLR1zVMlPwnmwUtMCzYNRrVRflCxZZWRR9Ac6H+Go/cP5S0bcP8dB
         JQ4Q==
X-Gm-Message-State: AOJu0YzXCwQ2Xj7phBrwHYaMuAYsqtTry6m/VjTsFIbdUPZStZ8CeLN5
	OmFyCVhC5ots9AzF5l+SJAe6VUA3Z48slYj/uc2cpcTc7qGpxtH/zPMwMHekLvdzc1/BGT7DY9S
	DAIca
X-Gm-Gg: AR+sD12eecpcLbJgCU/BuUafV4HPA46RIb9PkSyqx5hoBq3RPtnTAY4MW5EPVqo7llu
	iOUyAoqkl8vfjI++Ut+OgMTh0k4RfmusWJ/6fMtwQGZxnojkuLPgX0ZgjduGftcMtSA1Lgb5Lh6
	ykDEh9/OFnT36hfYIls9phwSxOXt3D0vduY6loH6V5hivWpuZCdHD2LuMdnDXUqNoabj0z9RKM6
	1BnpHqNywnrKpoP/+8neEHFmoYWr77tvfYrAqrysL+xCX1/hP0vzV/ciNJf8LIpsEuOi7GHmhTc
	YJ0U2/1Y0OsS+9bwuJyW/unnU94X25Cim3cxa5RsS952NiE8MTQzCUQLu6rt0FN6pyTqODilncX
	PLPMJRx8AfzJ6lkou9sabBofLMhUgi/KbAlvUi5hF8UdZ901B+4hw50vf2Vr4MjyLbwZxU5jaOh
	n+bleglvVDtYrKhCBfmgHW3s634ttbsIJ9/w7WCkTPrlcT33gyX2MTY9r6SMzWD7+3okoraAVKd
	MZwcRA8XGVTTgwj9UOdyizSb0pJPp3+apydPiZd3g==
X-Received: by 2002:a05:6000:26ce:b0:46e:c978:7ddc with SMTP id ffacd0b85a97d-47fd2adbd3emr2706225f8f.24.1785488043145;
        Fri, 31 Jul 2026 01:54:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2? ([2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458bf7csm2457413f8f.32.2026.07.31.01.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:54:02 -0700 (PDT)
Message-ID: <8c8d977b-6a88-4d7d-ab58-985b915f82be@linaro.org>
Date: Fri, 31 Jul 2026 10:54:01 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org>
 <20260731-topic-sm8x50-next-hdk-i2s-v2-3-42c1acee5a2d@linaro.org>
 <20260731082207.A3BBD1F000E9@smtp.kernel.org>
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
In-Reply-To: <20260731082207.A3BBD1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/26 10:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The SoC's native I2S and MCLK pinctrl configurations (`i2s0_default_state`, `audio_mclk0_default_state`) are incorrectly placed in the `pinctrl-0` property of the external `lt9611_codec` I2C bridge node, instead of being managed by the sound card or CPU DAI.
> - [Low] The `dai@16` node uses an incorrect hexadecimal unit address of `16` (22 in decimal), which does not match the decimal value of its `reg` property `PRIMARY_MI2S_RX` (16, which is 0x10). The node should be named `dai@10`.
> --
> 
> --- Patch [3]: [PATCH v2 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI ---
> commit b95de62e9eeaef3502a18beec3e036edf4b8259f
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
> 
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> index eabc828c05b4c..b62d387b9afa3 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> 
> [ ... ]
> 
>> @@ -861,7 +878,10 @@ lt9611_codec: hdmi-bridge@2b {
>>   		vdd-supply = <&lt9611_1v2>;
>>   		vcc-supply = <&lt9611_3v3>;
>>   
>> -		pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;
>> +		pinctrl-0 = <&lt9611_irq_pin>,
>> +			    <&lt9611_rst_pin>,
>> +			    <&i2s0_default_state>,
>> +			    <&audio_mclk0_default_state>;
> 
> [Severity: Medium]
> Does this place the SoC's native I2S and MCLK pinctrl configurations in the
> external I2C bridge node?
> 
> By placing the SoC I2S pin states in the default property of the external I2C
> codec node, the pins might be unconditionally driven from the moment the I2C
> bridge driver probes. This could prevent the ALSA/DAPM subsystem from toggling
> the pins based on active audio streams.
> 
> Should these be managed by the sound card or CPU DAI instead?


No

> 
>>   		pinctrl-names = "default";
>>   
>>   		ports {
> 
> [ ... ]
> 
>> @@ -1072,6 +1092,19 @@ &pon_resin {
>>   	status = "okay";
>>   };
>>   
>> +&q6apmbedai {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	dai@16 {
> 
> [Severity: Low]
> Does this trigger a unit_address_vs_reg Device Tree Compiler warning?
> 
> Since PRIMARY_MI2S_RX is 16 in decimal (0x10), should the node be named
> dai@10 to match the hex-formatted first address of the reg property?

Damn !

> 
>> +		reg = <PRIMARY_MI2S_RX>;
>> +		clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +			 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>> +		clock-names = "bclk",
>> +			      "mclk";
>> +	};
>> +};
> 

