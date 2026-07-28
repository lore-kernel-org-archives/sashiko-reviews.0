Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A553FB077
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231258; cv=none; b=D5KXQr/HB0ExQzx/BIPMU+ZVZNtBH4T3Gao3izTjSdafGclZ/kM9VPf7IgF4SF39dE8rEZS+ezzazZicHXuPQI548yjYpt5vxBdIEsmZ5roYrR5T5ZXUGVNC0yx9DLzcD+Pv5aUZvivrP7PzQZdpx3cJrXJIkdoHN82fVej7Jeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231258; c=relaxed/simple;
	bh=tZ4Yg1HegaN2pq+z0IhzGrN7w3n/Zd/VQkqqVw3Pjxc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IfDzPFyjvd13fefPJjlHZdL3ZGkgDrR3kd6l5xqm9xTxx+7N4N4Li3RntN+fUswpsyqUd68orxYFTxZ71SsdYGjWzBacSOlTeSNoT9qh924NfKOTknmMjWmDGzP0vkVtjjizddBP9+OlyYId0GY+nogMVycw6BAV93lojqV5oi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mShsLDBN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mShsLDBN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso2158580f8f.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231256; x=1785836056; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffVq5ZMWzgMfNyQ+b9r3wPaLIUviL+QwJh6c6WWDLzk=;
        b=mShsLDBNvC3tJl3g2INRP30kjtB3xwQ9/uJD4dRJvqVV1nx/B8N4wC+A8FrXnLGsg9
         Bscvr1b3gP0Yc/tpq3P2loN65SoIwR2tfhpLhnD/JdcTugG1BPHQmf6rH2RCuP2716Iq
         eVNpBO9JiXQ7hNiJLGD8iBirMKi4HbSOwzJB34sCp+ZbkUwGwVeemL76TbPAQ1Ll6JWs
         R0CwgBocTZYCnmJi3tnMri8exCqmfRgQkZ/lDbxy/UcdSXqIQdLFu6ZVh0JjCcioQD/O
         TKMmbJvQG9/ZQ04FCKBCTj2JG4P/x+PSH758ExvYwmtnDmH1fDSV0J+wiaTJbunmSyVP
         /Zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231256; x=1785836056;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ffVq5ZMWzgMfNyQ+b9r3wPaLIUviL+QwJh6c6WWDLzk=;
        b=BuBQVGTNnyyw3CmqiDS7dkvqgfhReOTmqETM04rHOYYFEBXnJdIY6g9GugI8TFWopG
         6/UXcGWbgKSS3PiX4owC1CZPZzXWKkryAnZwfetlo3+SBx/9ayFNx+TYeqNvx6lN+Sq6
         Dwij7aSEh0E61ZWfFHOQF4Lsf0Prdjzi+Bwf9eTO8RXV7oAix2Y7P3C1KKgT8d57NvkI
         efPEnpbJQkzLldO3owgGJ5pEJeHEF+nRaTuSQbNoIx2rcPMUIp5vDkLbeV/ciRwDgJf/
         7Ik4/oyugk4nv18OEb4TL6Pd4q+fYfLSVJ9EP95srItWmwf5dyilyub6NYm07bAmoqYU
         sUhw==
X-Gm-Message-State: AOJu0YwZngyMHlwTGvZ7LSAsZd0nILsh27ZKn7IdyVB5tBYrFRqjlTXg
	Sugob1Cf8MJJTU7w1GmG0NFiMORao8PUEPORlPhVfG5MGfcnZPH6eRnNdR7Y3/xHrPG3lkZSdnR
	FdeIv
X-Gm-Gg: AR+sD131P40fsF58AwmTQ1Be2dKfAaJWcFjLAIDb0hwSsuiy4uwFCaIe1SM6s8oiM8P
	JoQpKfgLcIq40lBjJ1bW4+U4spkS4rNqFJjcAJFuhLee3Xu66Wylu0DX71wII0qUPy0AFLQeHga
	9SGnX7wrk4hE05SpShvGwbFYo/RoGhj5mfpXlZZUhJbbezz0oulWSZUhz6BQQd87/deLwkMUFLl
	HN8QY70pxeDbTYxsO/DBZEZZtYwmdpTSuSmG/3UNUf2eTc/XCkGtNbrNXGUUFFXyLxIOMHXkpr5
	7ja1yH67MbxwnoFKloyXiIvGrbIpV2ffsU4I1sVU5mztpMSa7ZzUSttDz2cZdIyF5iofr26+A/c
	R4hsZ51bQ+5Iw4IZEW4GX7aHJp4c4XUkEK9yBQw6E9Gbpz0cQaWNBX7Ysfa+TgmITh0LSE/dj3p
	b7jrH7nl6cSkoFDTIX3d+zZ10caq3Uj2MPhtjN4bIRA0Km9kdisiKArJIA3w==
X-Received: by 2002:a5d:5847:0:b0:47f:81af:1a3b with SMTP id ffacd0b85a97d-47fb1e926b2mr1898134f8f.22.1785231255438;
        Tue, 28 Jul 2026 02:34:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211? ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm58636338f8f.20.2026.07.28.02.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:34:15 -0700 (PDT)
Message-ID: <c548b640-9ed0-4c18-a217-54905fa62022@linaro.org>
Date: Tue, 28 Jul 2026 11:34:14 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org>
 <20260728-topic-sm8x50-next-hdk-i2s-v1-2-2393a0fe4aa9@linaro.org>
 <20260728091012.419DA1F000E9@smtp.kernel.org>
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
In-Reply-To: <20260728091012.419DA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/26 11:10, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Device Tree Misconfiguration - Pinctrl for SoC I2S interface is incorrectly assigned to the external HDMI bridge node.
> - [Low] DT Schema Violation - Invalid clock-names order for dai@16.
> --
> 
> --- Patch [2]: [PATCH 2/4] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI ---
> commit bf4f513e744f0c756ca7054358cd98929fb84150
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
> 
> This commit adds the necessary device tree nodes and configurations to enable
> the I2S interface for HDMI audio output on the SM8450-HDK board. It configures
> the pinctrl for I2S, sets up the q6apmbedai DAI, and adds the primary MI2S DAI
> link.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> index b37998cd9a2c3..6a6d8346046bd 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> @@ -665,7 +665,12 @@ lt9611_codec: hdmi-bridge@2b {
>>   		vcc-supply = <&lt9611_3v3>;
>>   
>>   		pinctrl-names = "default";
>> -		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
>> +		pinctrl-0 = <&lt9611_irq_pin>,
>> +			    <&lt9611_rst_pin>,
>> +			    <&i2s0_default_state>,
>> +			    <&audio_mclk0_default_state>;
> 
> [Severity: Medium]
> Should the SoC I2S and MCLK pin states be assigned to the sound node or CPU
> DAI instead of the external HDMI bridge node?
> 
> By assigning these to the lt9611_codec node, the SoC's audio pin multiplexing
> is tied to the lifecycle of the external display bridge. If the HDMI bridge
> driver defers or unloads, the SoC I2S pins will revert to their unconfigured
> state, which breaks the hardware description paradigm and might cause runtime
> audio issues.

No since the HDMI bridge is the effective user of the pins.

> 
>> +
>> +		#sound-dai-cells = <1>;
>>   
>>   		ports {
>>   			#address-cells = <1>;
> 
> [ ... ]
> 
>> @@ -947,6 +952,19 @@ channel@44b {
>>   	};
>>   };
>>   
>> +&q6apmbedai {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	dai@16 {
>> +		reg = <PRIMARY_MI2S_RX>;
>> +		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +			 <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>> +		clock-names = "mclk",
>> +			      "bclk";
> 
> [Severity: Low]
> Is this clock-names order correct according to the schema?
> 
> The qcom,q6apm-lpass-dais.yaml schema requires that if two clocks are
> provided, they must be ordered such that index 1 is mclk. Here, bclk is at
> index 1, which will cause make dtbs_check validation to fail.

Good point, I'll fix this

> 
>> +	};
>> +};
>> +
> 

