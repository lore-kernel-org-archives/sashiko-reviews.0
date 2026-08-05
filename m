Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2553E717A
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917062; cv=none; b=dtmjsTguVKZDF8FRCOGEGN4CY1sI8cdVf93fXgry8xp9BDtuHZYlc0aeqJXGwLF9O3mwUMT5LZ3PcsnxBPpoYqeaxwhKqlRven2hLzpJKT/elUI1DW0gaynw8kjcwhT/q7lrFsFQowUyXRE9wV/oMHil5MQ6J81+GcIhlMgjspA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917062; c=relaxed/simple;
	bh=Aa1JaFtz8MlSsKVnE0g16Mz6N9GzVfKUfZiLujMz4q4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qSHmkz460FqO1rCqjTsAaIA4/tKZkp7Wl0z6p7aGU0T3XK4X3L11U/ntBDV7DwxPue3QQJ1bT0kbhJ39ZlP7VFkHcQAncbtyPoofh6QUd41B2wXDbbc40uAkDn4dFqNILJKr4SKGGySJkqB085WMgPOvaoTrFOgR3au8QJmTqMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jLzOg3wm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jLzOg3wm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49548e01d02so3521315e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 01:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785917059; x=1786521859; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cRhrleIU3+1JG/NfXXlVvS5CznbPxrAOhcYmmtvzeY=;
        b=jLzOg3wm+Oj3U2QgrdAlgRi4ICRiDvZSNtMxuJ6qbOFBKAa+IW1hnN8GSZRRSoXwyW
         3ka7E87WlGX9yREBmtFAWmsInkTuJpdcsl6mDlo3rl+kbvPqG323CYFnrDP5Yh+FU0rw
         nm+RNq9KnceL57qV/Wb0KV3Gq2HNF2rf/m3xgolKTXoah9QV6G2hFTeOB+iAhuG/LjS9
         BVVWeMWVoXwWPgJcT/KeFIDKeeOU26giAlu79D+MbrOnKhCU2kBJwA5r049rFYbTWNOi
         QxXrAY/ZYk5PPxOyD7Us4mD81qREnHRgK5thIQm+eh7SyTg3+ZrLI8bPhEbI9cFu1tD6
         u6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785917059; x=1786521859;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3cRhrleIU3+1JG/NfXXlVvS5CznbPxrAOhcYmmtvzeY=;
        b=OdsO8LIzkJqQ7imQpfq+Ke9Ir6vr7xaDZS0dJRSDCoRZBJRdpcNMFnN0uO2SfDZ18k
         ZtGR94RbfK5zTGN5PHu0zGedc1hONzX5ft+lOYmZdM8ff5CZUypNGs3ORfrqOoxvWPgF
         HTHaOFTKax8HVG7CeCcqEli+sJ7VfJm9vR2W7wjJynMPi9Y6V7/GrQdgh2g8m60/oouP
         4gbkgsYnV7vpQAaqbybO6uzG0+LH7qGwZAuDOUfIgOe5TDVTyCbn+9rUw/rq+vkIW9dk
         2PdcBFyv6Lfko1cAOgM/epmaQFVWLbXTcqSu8WT1NyQuuB8AQfLrUZ4kZus92rTHb/CP
         8E/Q==
X-Gm-Message-State: AOJu0Yynm2rVVZE4sqZN1J461juhjZ8NVFtIbPdRsQgyWBv0+RbXHj7Z
	pAkZESGIVpeaz79oZ+BOo1alXe2b/D0NgFonSMBjXKd9CG3hHB1+lD9JQ0IYYPrOixBahNzdMD2
	vRC5jeag=
X-Gm-Gg: AR+sD11TTFbt+h1PeFM7rDrZdYSh+SQmk/xdPC8kfWsytUoos564Uj6e6Rva54b3hir
	NcRz520N5jyX/GQnwJkDEcXDfsT4GpsK8dpul4bad47mz1MBIWn5Zu1xT/oHYbm+56FeJdYW8k4
	FK+zRY26A6nSl6PZUEuo8g//rpsu1d/w+oev/4DJTFZ/baFvoAy5/jPI4Dx0IrKUHQNi5y+OuHZ
	Rm/OKSys140H1KRuvfxaAzxOoyCpZU9AZHY7M4YNwkwBwvs3wzp4HbJAGjJ/UwirLVPZBlUWxbq
	0lZ98j9fDGFa8NEO2KoWK5mT+GahnKRm2UaEq5MGYT33I57BYTQDGIbqzEh+jOLUM22qKOeDX/p
	nyshHFCAB8F7sFU06hrLz7X/HbMC4rSwOkf9P86oEmVRVcs8ycCNG7KZXUZslqkgdzkRqfTIYOa
	4DIxY+NwhPiaAs2NAMysD12ywIWE9TN8lvQ3XThTDJW2hEECbSHj9pJmSuLt8GvGoXqJpdNZZIY
	b8UkjqyNfIsrnXXSkzj9UQLQozQ/+rEMgVm48vFCivV
X-Received: by 2002:a05:600d:4448:20b0:495:5e3d:15e1 with SMTP id 5b1f17b1804b1-4994e7d21fdmr42969565e9.16.1785917058566;
        Wed, 05 Aug 2026 01:04:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b524:aa27:5120:b778? ([2a01:e0a:106d:1080:b524:aa27:5120:b778])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a101ac9sm147307405e9.15.2026.08.05.01.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 01:04:18 -0700 (PDT)
Message-ID: <800c66ff-4c91-4afd-8681-0d7d24376d18@linaro.org>
Date: Wed, 5 Aug 2026 10:04:17 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
 <20260805-topic-sm8x50-next-hdk-i2s-v3-1-07a6483c430f@linaro.org>
 <20260805075925.D09111F000E9@smtp.kernel.org>
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
In-Reply-To: <20260805075925.D09111F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/26 09:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Device Tree topological violation: SoC I2S and MCLK pinctrl states are incorrectly assigned to an external I2C codec node.
> --
> 
> --- Patch [1]: [PATCH v3 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI ---
> commit 1e06799a0230632b985134cd0731cc4a2e53b31d
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
> 
> This commit adds the necessary Device Tree nodes and configurations to enable
> I2S audio output via the DSI HDMI bridge on the SM8450 HDK. It defines the
> audio clock and pin configurations, links the DAI components, and assigns
> the pinctrl states to the HDMI bridge node.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> index b37998cd9a2c3..6bc2e8630dc37 100644
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
> [Severity: Low]
> Are the SoC's I2S and MCLK pinctrl states being assigned to the correct
> node here?
> 
> These pins belong to the host SoC and are driven by its audio controller,
> rather than the external LT9611 HDMI bridge. Assigning the SoC's pin
> configuration to the external bridge's node makes the codec driver
> responsible for configuring the host SoC's hardware, which seems to cross
> topological boundaries in the Device Tree.
> 
> Should these pins be assigned to the sound card node or the CPU DAI node
> instead?

No

> 
> [ ... ]
> 

