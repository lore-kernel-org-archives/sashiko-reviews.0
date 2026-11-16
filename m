Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815121;
	b=RqDsLY5gufEBC0pcW3efR9d82SnDtgzuTR9uv3c0RWHwW+ikGlIOuPzcR6mm1WeBx8HD
	 qrBmGasv4NeU6GCCQcgKUE3Zfl1Rv3UDaCcxp107eScCFQ7KAvN1z8D0/gwacgE5sxasn
	 nyZnmglZF2KiZPhBzrSiTuNjQQi9K6D0SEmmRWKXQmqxWkq1yBFiI1AwsAb6xdHunqOEQ
	 VkA5KA3rZyrBOVq7k0BzmVMwc621W35NLG1hwGHqDjZUwdPEbMGWkzxp4z8rmWWw3THwx
	 ls+5nGk2f4/nQu59Gh2QTBOShrwbIFbtkEYb+5rF43tG+9Tw/QwejamnEykaerUB3HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Hmm2pR6aFCenUcCKosKBbhm7/p1v3WTAnxJNhw15gtQ=;
	b=IDm7gbEcJtL1ZGOSl0lCTODN2LLE2Xm19LETrfkIoWkaPE0iiBO/QUIbTRZxl1Axv4S8
	 B1KS2UJ7Ahn3lTrRWCzJQNI4E/La7HYoW8Xlp5yTizUnpImdA/NEddUsgl9UbCGQnmxYT
	 t9TsKrYB5J+Hjlhrt3n0RJvFdRiH80QaUuuydbYpgAGzap4Q7qu8tfl6iqMreywO7ffmC
	 A1rvLk9Gc7kHqO31v5pY1KgqP8+VbMEcednNL0EeR3CVfqoq73QIyX1lQq4xz8UoLlMnO
	 LryZ2DQm3lTF1ePq+at3wEVORmTlkMJqRDTNtDVsP54qIQYuxhV75fCzdIl+ytzKcZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M9scUzWG;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D058606A887
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 07:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D058606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M9scUzWG
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491846221ffso2778235f8f.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 23:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815120; x=1795419920; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hmm2pR6aFCenUcCKosKBbhm7/p1v3WTAnxJNhw15gtQ=;
        b=M9scUzWG1lyuH2c8a1p5nem4PbBNX0SQp6zcPLCG/zWAiCO6riUXigC+VaFPEt6+Zp
         uilR/+1HBV5QVaB1BV2So7BnwzeTchy42H78o7cVzmG7NKmy30aWB1Gms3LufYw5Wj37
         yWJuVsoiloSdgV/mJMso7OCnxgvNDqeRYVpoHi8agTuIw4wj0iNUtjNnuRaCUnnpPVVi
         kHTWn0bWcNCqZ3sb2v/wTN0dGHG2DwmuoMEYqx535dmZfcW3+j9KOzItutiOrxjume8D
         RSg2zkhbaZLvmkYMoyyYijwQVGvc1FjnFikS+9851QPWkuKv+GVDg57+sLEpA2MVX+Bx
         SO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815120; x=1795419920;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hmm2pR6aFCenUcCKosKBbhm7/p1v3WTAnxJNhw15gtQ=;
        b=Tf6yQfK45JiJ0ytose/XZ8WPLniyX2ngmax4jc8AtZlTuQ59x/qCGyOWptwU+bXyZY
         C6h22/jxHCUeWTKNgwsYVYl0yvOhdobZsoKfvYBukVwxLVOFRQaGt4AobNaI0PyuVUMu
         M6aNF+HLG28LFPXYNHIF8qa6AlK5mbjFQBo2CjGQ0QV4sL+QL8pOPVPnDQtGCm0CmHcU
         q5NCA7Qexby0q1BhiIHQ+gwTTpOdMFCI/go6WTiIIpQ6weCcCZ9+L92qrag+8g9/4b6q
         pvTR6a2jktuPeTKRD/xE+k5y34dWtDvUsDdpk9LwnUyAYhh1ALxHAIi/l+9xafhscgtH
         QkuA==
X-Gm-Message-State: APuU4Z/vRKv6v9Xd9ORXqC3p+nnManWK6Btg/J+N0bGw7twSKArAybnb
	C+OsU9wpPOihOdHNXVh4bgxMsOELAxNWSpwH3AVyMuagCcM2euxxy3GRsSGVro5E51ufVAGXKG6
	TLdVGcNc=
X-Gm-Gg: AYBFou1eCrn0GcY2knez1vAmGvRvzg/5R30fDyWEIg/wZo4kCGvTtVkqZjnFGyyh7ZU
	n61oNWTKLpMQJHmkv548YblShHmVCX0Kr0RqXWzr0L6kij5BQ9MKPBMtzeHc+X2dpIOaufGJIQ2
	07mm60TxqUWTRh4JuVV/o4bv3P5SifJ4uUB11XDFiGlcCcNjQlqFMWVDBRXW5kuzDamXzmcrly2
	s3lWvrFUufxlLTMV30f9XOuR4sICoYU8pnIMS9y+EeEoqN9G7/RrvRvZ1UQEg0zvqQHmoTh1rNl
	fjMmLQc62TukWS9vft8MoF5gezbnLkD9OkfDdWTlB2sE50Lz+ssKzXlYXckee6NhTQZjqz0t0Mv
	qCZ6uraQIEyPcjZaw1GA0hgdqLfNMUZg/mrNIG22dQgHj6dbgp32p8edvg/oX/d4uYG25FrO0in
	eZYPlnWD1N3GvCac8Pf4D0R+SiGtbIBd80q0/e1EbcWx0jTMWOGSTo6NaGcNxu/EKgmSga7Twua
	thtgQuj6OzM9ER0u8kEdcbp4gIe/ht1EmeJO2ZN6l7OFPw1wffw1hoTyxKHAptcks9qGdbGgPMd
	EDScr3628WaT2h2fQrMBWv5Ed+/7uU3FrEee0bOIMAorEhEARtCDkpVoj/got/xJIvoYCR9viHU
	z/b/oLMxR
X-Received: by 2002:a05:6000:2407:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-49c73351512mr19406434f8f.56.1794815119670;
        Sun, 15 Nov 2026 23:45:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm21048578f8f.56.2026.11.15.23.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:45:19 -0800 (PST)
Message-ID: <d27f1aa7-9765-4a22-ac78-e6dfc0c97556@linaro.org>
Date: Mon, 16 Nov 2026 08:45:18 +0100
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
Subject: Re: [PATCH RFC 03/23] dt-bindings: pinctrl:
 qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when ADSP
 is not used
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-3-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213493@kernel.org>
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
In-Reply-To: <sashiko-outbox-213493@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: redundant
>    oneOf in clocks
> --
> 
> commit d8422bb265d6e088cce5d6024805eb9ced00d38a
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when ADSP is not used
> 
> This commit updates the SM8650 LPASS LPI pinctrl DT binding schema to
> allow a single core clock and add power-domains properties for platforms
> where the ADSP is bypassed.
> 
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
>> index 1bf08860a4baf..4c54f873199cc 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
>> @@ -29,11 +29,25 @@ properties:
>>         - description: LPASS LPI TLMM Control and Status registers
>>   
>>     clocks:
>> -    items:
>> -      - description: LPASS Core voting clock
>> -      - description: LPASS Audio voting clock
>> +    oneOf:
>> +      - items:   # for ADSP based platforms
>> +          - description: LPASS Core voting clock
>> +          - description: LPASS Audio voting clock
>> +      - items:   # for ADSP bypass based platforms
>> +          - description: LPASS Core voting clock
>>   
>>     clock-names:
>> +    oneOf:
>> +      - items:   # for ADSP based platforms
>> +          - const: core
>> +          - const: audio
>> +      - items:   # for ADSP bypass based platforms
>> +          - const: core
> 
> [Severity: Low]
> Could clocks and clock-names set minItems: 1 alongside the two-entry
> items list instead of using oneOf?  Because the single-entry ADSP bypass
> list is a strict prefix of the two-entry list, minItems: 1 avoids
> duplicating the first item in both properties.
> 

Will switch to that
