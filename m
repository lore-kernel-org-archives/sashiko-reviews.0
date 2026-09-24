Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FF53EB0E3
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256230; cv=none; b=RfhrB7VA91o+1hIoUdiUnqtF9SApDTXv2QVWVYwV90PUlbSbVgVtQLRWAxI//xLPLHpb4OrPsgmssP6CmmxY26lzwNvfWsmPD/Hv1wRNSD/IKbmdP6qmACevLRmmkeGd1ZRl2Ix9Y4KPRcp0O/Xod652rc9+wXqicioHvqevTgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256230; c=relaxed/simple;
	bh=0Lo8Fc4RrHTz2i0pVyyvUOWs9Q7J+HdB9eO5ehxCpZg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rXhkVbNvmEAhILh53PTsLBBtoSJTISgfltM2SVQsEpEnT/mkVObbxw1792hwlRuaAN25RM457RtGwMDYmbP9IIWXz8R5T0xpVPk5nY1GJqJJ3uNX9WSHvw43IyEqSRz2GU3NnYN4UG7WAgTeVKxfZN3ExL/ECwx7CaKZt4YSxdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lEP5zZpD; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lEP5zZpD"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso1297852f8f.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 06:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790256216; x=1790861016; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLz2UJ7WZAfDvJwz6oWzjaHjslHfX+WvIHzGXDGM04s=;
        b=lEP5zZpD5o0y5RECozVM2VhO6+tBa+8mXIpuFktws/ZW7dJN7gkqZWXrHAVN0dXMuk
         5tSQzlTSMCH+Y3zBaRc6Lt0ciUgZlzsG8cOCjeLZ5e5Y+y73mWO2FqD01pAX/G1ZQIY5
         4w418NmNGNylt6C7pR9AmmK6hK2QykA683jh2WTnW/S/tbmMrEdyjSnGeyCfwL/faKPi
         isPuwXG77xhqpkEe8F9dg3gKw8I7O0oNC+/tBoU6Op4UKKtrdzHQVd6ND9PvCiHRgREI
         ta3HF4lSXjzTpWFxl0NHySNT2eDJ9fsBbAKeL9JaPYdMM3RN2p7e+cVtvTkBql1BYS16
         VPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256216; x=1790861016;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HLz2UJ7WZAfDvJwz6oWzjaHjslHfX+WvIHzGXDGM04s=;
        b=t9dnGLGIb1Fk2SvMfRfap/x0dsOoX0zKdj1gZeqH0TEayK1TQhNiuXwOjeQm/ErGrp
         H6ElvHmXLoulu2AahH7MRjVbxty4GO/tWpepzvdp105uQ7xYuS4VAiFQ9mZEltp8Z4j1
         yRLJROlq5ubzKtERmsPA4A/2I8PcarVQota/Nry5mjX5QWls6BiuBepRv/VxnY7a0qT1
         SpVUVf3Fd6Q074cNCzwctsip3NPN+Gdg5eYjEwkKXOWyAy9kn4oq9RJpFGqtnuyi1WNi
         Sd3Jhg4PbQDcJQQ05s6i6Ffjes4tzARPdfSvhQ1KfIeDsRS04LSVHzHXbvnZdITUNnS/
         T8IQ==
X-Gm-Message-State: AFuF++mgpltjx0odyDfYJ3gIdDb6JTfAKlpsQ6zxFOYF2OYYsyBadrbQ
	wJ0AUffdGosCxITCfFr66JanCOs02ngBAX+HdrtWOvRYvrAfZ/vQCAG2gzHbrchPzIvLhcD0EDi
	nAtG4fAo=
X-Gm-Gg: AYBFou0ayU5bwkA2CFr0RYBaVzkFbGb21Fx1WNkELqU+isn4vGIukiDeQ0+qsHyYocg
	C972tUHUppI5uTS1yCI338zFuMX6CJRNZXfiYqaUTeAR7AWuKrPFN1e7dU/NP1RUQ37IlEbV8i2
	VLPwi9ySsFHvDF4MjgLgpt5G+ZcTM4F9xXLxzavVQvU3/hzl/yf4lu4REaatPPFbzS75KVrsBNp
	PhOOk37oF/ekWt4IZlsKvupR3wxKPjCZUBJT4bHJgfXyZaWBNca6IwcgapCArF70FLl9+85R53q
	kPV7gPE836NcC8UVzkISvEpCHSxnGzqaq9b1tGOnkTStxQBlwt5Eba1C/w286kn0oGB+U7WwZeE
	XChXWOmVebaWoV9J7yLkqJhprgsqO2ut9ttvk7BLF5Wfr+XvWunLCivguCeVhaMWi7tyTLa41sa
	ccdpwPKIBZNDH6M8echbcbKgFe47s5Yz4qMUXNU0TZ0GqEjLroAw5mjLNs3KgJCL+rfmevaNqaH
	gqpG0ZSJfLi7gbvhPBC2Lm6Dbs5TBiarikksGPaPr2ZXHwkTJSxa+Y=
X-Received: by 2002:a05:600c:4689:b0:49f:bc8a:b103 with SMTP id 5b1f17b1804b1-49fe66841f8mr42901125e9.0.1790256216193;
        Thu, 24 Sep 2026 06:23:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684863d9sm14891752f8f.12.2026.09.24.06.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:23:35 -0700 (PDT)
Message-ID: <1d014f4d-1c05-45d8-b559-6ed03293db24@linaro.org>
Date: Thu, 24 Sep 2026 15:23:34 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260924-topic-sm8x50-iio-max34417-adc-v2-0-9a0609e72f5c@linaro.org>
 <20260924-topic-sm8x50-iio-max34417-adc-v2-1-9a0609e72f5c@linaro.org>
 <20260924132022.D479F1F000FF@smtp.kernel.org>
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
In-Reply-To: <20260924132022.D479F1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 15:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: max34417: arbitrarily restrictive minimum on shunt resistor
> --
> 
> commit 3650a83bfbfc37f2001988362d1f90e712127acc
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: iio: add: document the MAX34417 Four-Channel High Dynamic Range Power Accumulator
> 
> Document the Maxim MAX34417 Four-Channel High Dynamic Range Power
> Accumulator used to monitor power consumption of portable systems.
> 
>> diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
>> new file mode 100644
>> index 0000000000000..058af61cc04e2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
> 
> [ ... ]
> 
>> +patternProperties:
>> +  "^channel@[0-3]$":
>> +    $ref: adc.yaml
>> +    type: object
>> +    description:
>> +      Represents the internal channels of the sensor.
>> +
>> +    properties:
>> +      reg:
>> +        items:
>> +          - minimum: 0
>> +            maximum: 3
>> +
>> +      label: true
>> +
>> +      shunt-resistor-micro-ohms:
>> +        description:
>> +          Value in micro Ohms of the shunt resistor connected between the RS+ and RS- inputs.
>> +        minimum: 1000
> 
> [Severity: Medium]
> Does this minimum set an artificially restrictive lower bound for the
> shunt-resistor-micro-ohms property?
> 
> Valid hardware configurations could utilize sub-milliohm shunt resistors
> (e.g., 250 or 500 micro-ohms), which would fail device tree validation and
> prevent the driver from probing.

The min/max values MAX34417 are taken from the datasheet page 18 Table 14 (Table 14. Correction Factors for Various Current-Sense Resistor Values).

Max 100 mOhm, min 1 mOhm,

Neil

> 
>> +        maximum: 100000
>> +        default: 1000
>> +
>> +    required:
>> +      - reg
> 

