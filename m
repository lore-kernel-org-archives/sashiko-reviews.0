Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB27D35F5ED
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 07:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064360; cv=none; b=WaFQ/2efpGIOaKigr2pInXLfdE3k0DBob8hFS6jzReyPIGegnq1VzbhLh1k0NvF41ZoeUl6+1tSaW8Vp0FpKJL8UPEfZ/kWwiFiERdRme5Ata454M8cbqkcl3nOZrkBRvaJqjBHcQWyUdfk3HhyHuoBZyNKhuGJzcD/1f/2dsMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064360; c=relaxed/simple;
	bh=I2IHKwKaiSFySvragJ8MrSWWBZJqduGkGIIiaxdqnxQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PMsO7zvY7BpMY4EMehmllT0B6YsMvj9ivJZNhpq8uAmV88itWEWfToxm2z/KUTVFyrDbxYbOxUs7bg+8LUpDmDHVXJkwkV0z2MAiATpI3mSTI8iIXlhxNPEgR2e0Tl1NjcVKKPTQ3qJ53jG/qlKb9mztR7Mj28N9HhTQhp1g8hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QAlc9wmR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QAlc9wmR"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-476a130c138so274285f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 00:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783064357; x=1783669157; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HQ4m4li8i0Yt4qUsB4ghqhwVC3QDvJYWSIBsCGk0lM=;
        b=QAlc9wmRz1qCliHQZEp9Cn3FHIPf7Ck5qwvRUXEOYqvMRm6ApAB7IMv3cr+mQ0kZ16
         cmvIEbamoLMWyW5TcfGbqoi8urrOZoscJShhO5hULO48ZKc8zRK9qUEsO1l6pp69JnvL
         Kg9SIyEUiGqT/Nv/8OBLW8TNX5nQ261h1tO7NDzBKJdr6gM+zLfmG0AidX4wIFYwccTv
         yNPkhRNbIHBiBeBpj/VBHNMEUDdHlbcnPDA78f1Wj6zWvw9BKFRDSHF7jkYnGO+awIu2
         hlkvVl2bVd38NSDG5veYK/QLpWzIGDIzE+Ji7SgSnwozhA5Na4YCclFTBU85SCDldxdO
         TIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064357; x=1783669157;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HQ4m4li8i0Yt4qUsB4ghqhwVC3QDvJYWSIBsCGk0lM=;
        b=GPdW0soPQEfmI9+NqGAgDQEWbdkny4nM7S9CguUyF4PTgYQMVhvJQ5CXIiVRPq9/cG
         Dy0Oje4hzOqjHImkan3nWtUQxCGTqbwYnDL2WYkGZufKuUHStxxfUGRQroqFeR37RBO2
         migBdNVnrBn7ks7P5plZQuMIjk9vSisKlN7POLiivjq6iUh+UTgTkHpCwpffJVnV45JT
         lvC4C1cuLT7EhXcLsnmiwyv9ceJjLSmQOFZ4hntLFuLGCsz9Fb70MWEQKKdClKvq7o+0
         3Rre5mXAD8WTRgNLNwvkAHFbro63y9FTByzZ2G1DUuW0wusDqq3oUBKILLefuaX6mw9+
         VNvQ==
X-Gm-Message-State: AOJu0Yxehlnrt3manBeKJJX380Jk8dPn6KQqVgRUG8byEZhFpbYlnvKU
	6bwRgyV8xbTGfO839VQrE0x21zjiFryFtPdZQa8L6dqgjYtU9uJ87N1hWNEITuEHMwnrUcfGTAs
	cxPHM
X-Gm-Gg: AfdE7cl1ydgnU47Qz7Wizfk3L6F5eWmN/dTYk5H46vQNef5Csyfmefpb/4G9rVhXNWQ
	QlltIx0wGJ2B7DGZyLD4qJ8GzR1cvoXLahLANgtkvdKX2c+1Su8WVTrwWKJ0cJ/eyqMke1/AOB/
	oQuEbPtDLxMYGkqpLOMk+pTglTtOLU8fPAHbyClpYrot4+N8Bb4jxXaCpr7yrFFeSeAsbWGdgBv
	8H7sX3OBg7xLKslUO12JJAzIIEWC1Wa3392twt+CfTuKZ6XbNn9cVQRhMIAlagBBlIy/C5ZiQGX
	sSDQQDMp2DgGab1GrHpJEfBIUo9ra9CkXBtkSJAHzukYcFLWOfYUAb1oebmsR4AOL5bmY/RR6rE
	l5rjmzdTiFWxmHH47dEvKpOoKG8uPbzXnMuBjGoiPWGs+aFo1cff3ZoCVz7L9kDWoEpaMpPqFPa
	nUlL80SdwE47SjZiuIFvAD64KyxV3ZqOfkVcsetoLz+V096e+ddRzt/RyDKkX7RdNTwtTj
X-Received: by 2002:a5d:4e48:0:b0:46d:8169:bb39 with SMTP id ffacd0b85a97d-477b52968cemr8198754f8f.37.1783064357093;
        Fri, 03 Jul 2026 00:39:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e9e1:7bf9:472f:c4d8? ([2a01:e0a:106d:1080:e9e1:7bf9:472f:c4d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15346261f8f.2.2026.07.03.00.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:39:16 -0700 (PDT)
Message-ID: <95cb51ee-3261-4595-ac75-6f1e0e4dc7ea@linaro.org>
Date: Fri, 3 Jul 2026 09:39:16 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8650: fix soundwire ports
 properties
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260615-topic-sm8650-upstream-cpu-props-v3-3-eeb6e9fa7581@linaro.org>
 <20260615170553.4953E1F000E9@smtp.kernel.org>
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
In-Reply-To: <20260615170553.4953E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 19:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Prepending an element to the `qcom,ports-*` arrays for `swr2` shifts the configuration indices, corrupting the SoundWire Master Port configurations for the TX codec.
> --
> 
> commit a1c9b1d54073d838cfb9e5474d5c6e26f81803b9
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8650: fix soundwire ports properties
> 
> This commit updates the soundwire port counts and properties to match the
> actual hardware configuration, addressing deprecation warnings for din/out
> ports.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 090a4739ebc1d..b1293fdb1481c 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> 
> [ ... ]
> 
>> @@ -4831,17 +4831,17 @@ swr2: soundwire@6d30000 {
>>   			pinctrl-names = "default";
>>   
>>   			qcom,din-ports = <4>;
>> -			qcom,dout-ports = <0>;
>> -
>> -			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
>> -			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
>> -			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
>> -			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
>> -			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
>> -			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
>> -			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
>> -			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
>> -			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
>> +			qcom,dout-ports = <1>;
>> +
>> +			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x01 0x03 0x03>;
> 
> [Severity: High]
> Does prepending an element to the qcom,ports-* arrays in swr2 shift the
> absolute index mapping expected by the TX codec's qcom,tx-port-mapping?
> 
> The soundwire driver maps these array elements sequentially to pconfig[1]
> through pconfig[nports]. Slave devices, such as the WCD9395 TX codec, rely
> on absolute Master Port indices defined in their board-level tx-port-mapping
> properties to directly index pconfig and program fixed hardware registers.
> 
> By prepending a new element to account for dout-ports = 1, it appears all
> subsequent configurations are shifted. As a result, pconfig[2] might now
> receive data from array index 0 instead of index 1 (for example, lane_control
> would change from 0x02 to 0x01).
> 
> Will this misconfigure the active TX SoundWire ports and break capture audio
> functionality on SM8650 boards?

No

> 
>> +			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x00 0x01 0x01>;
>> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0x00>;
>> +			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-lane-control =	/bits/ 8 <0xff 0x01 0x02 0x00 0x00>;
>>   
>>   			#address-cells = <2>;
>>   			#size-cells = <0>;
> 

