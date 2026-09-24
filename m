Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D1B427A04
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 07:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234112; cv=none; b=BINuV8IRdZCQuy7t4ItKNE5v7UF875US3Rdalu6DamQVGi8AVj35EyBSfhLSHY7fT2bug8BYHhChtSP5q2w3l2x6keNTEy2vVXv2n8mXFCgSvzcZY9L7u2aRA5BIwsmr0MBw7YxBQGNz4LhTfB3Q3X7OhK/eNd00iNcGkkN4hv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234112; c=relaxed/simple;
	bh=9yPvdoXEA8d4TMm6YJ/Wz8gy+UtkwMYdbTYWnkbt14s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VBMHTqxbCbxXa4ZFMWQu4FX7MC35d3kIHYo+NepyAeXWfw/MgQ/BUn/boaNPpGecF5JQmVoT16n7+0iDHMWn4yOYrxvrbw5PjwSC+qlJXg0cmxS0dSrhUmy0csIPY6iMbTyr8Y9BMT8fuFvEQbgmB24UZahdWAIiPFjSjrTuoKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KB9eDH8n; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KB9eDH8n"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso15557365e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 00:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790234105; x=1790838905; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJMkGAtSYRWXtY00c+2nLuxR5+Tw99RM+wzkzXUoPjA=;
        b=KB9eDH8nhaAyBykGlMi25CaAQTckOZUoHOqryLQ1Y/nSedu8dQmpMSn9vYQ+zCDezz
         HoiACJnUkxlCU5APl9yOSUp/T6mkSD3UdP1Fm2vvRR8/kAh7SX7xQGRlUMLF0pOtjC0k
         hDW1tIaomotKiOM7817RvElB8A6Gk3ih0m5+sT4DfNs/DROR7bQQxtDZkfiTocwg8+ay
         JyOrbafjd5MnqBnL2gokKlJb6vTwHIEE7E7EgHREffcx12jKCVI/XcLdrvnZyvAEIKG4
         I6U0MQsq9kiJm0wU/362u/FVF3SxLDd2oZk2Mu+b773jIUU5g4sHZUVu0NGWE0F3eXNJ
         i0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234105; x=1790838905;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kJMkGAtSYRWXtY00c+2nLuxR5+Tw99RM+wzkzXUoPjA=;
        b=sSx1rm8S2mjYXCQPLhy/qtlH0s3/2ql2NfC5ZQydl5tV+Ge0admzRDcvIhNr1M1oTL
         Ybens5UmEF1YVcyT97wb5VqzLj7UNCxYj+yFKN1nFr3VZP5c2QGccjBr/SrrFGFWjTJh
         YFwfhq0SP+2frAX4XRR3Ap15yo6in86n/n+ZUOJOWdRBHSeM7UfcGBTVQkNsvpqt9mSp
         RoFsbUZq30AAxu7yCavSGF6vf45Q9sgYfnIBPZ+DMDO25VcqiLLZYcJOGsx27/jC87g+
         Aa09ZHE06B+kY0QgVzUNos26U9FLbOY8oeEh2gEEUSiOxKvowtkv7ueEY9h7q/rGved1
         cgWA==
X-Gm-Message-State: AFuF++lQORQvSd1nadfWcHQQWeNOyU2rFJ81nU2LB74av/0bmZHEXcSU
	O7YzCRe7IPwZGncQi4HHiRiiuIHnzZG+FunvdpsL/Ob+TLBZQh9GzI32RSL+/QooiQ3jY7aIwBI
	eK5PUGhE=
X-Gm-Gg: AYBFou0khpejDTpPUdLQ0im89TZOqbdgPGC7hhVPhpIwQOAiNY9bk/b2nzeV3hakBUc
	BqBuGREm0QNQBot7uequatqUD76tGJeo/Ufb5T9Ti25UE2TbvSS4kgFJIMitiWWYi6eLlyPTSwc
	xdc/pbRMP1siXBr9VtakWSGpvTdUxOZDhGh2HDuQo59CwY7Vl7Yo/8O8eJ/GMIQIVXqHZawVaki
	QcDPfsjhY00yIFF+fk5mUDVPJ+FHnEKu0B2y9NG7XYUkmkpTsoSGiqi3x3bZZrW5JdNAjrKfW/I
	O+XKe0F2jyWrfO1WctZxhRoujrsClNKLbAtXyvaGeWfCgQwlHa5jYo+Bm3Bcu07ToKCD4tKIzFI
	UOpw1JbXaVeJm9C+ArtH4KeG+FU2lko5y+3JYgQgjX62iX6LwPcKbJgYs0trcwKXcDJDmmnHriL
	bmC4QJQd+qs4DD1Qs+1RTGpLIYOB4NeSAtLJMtYJXabJgOtdLvMtZ7hNFTEPSUAyqXg6eeBVgWR
	VD8Ng16x5rC222PSgQUwTquO6qrKWwQwEkd7MeRNs9dSxFF0m0m3zq1
X-Received: by 2002:a05:600c:6091:b0:49e:6c9b:4e94 with SMTP id 5b1f17b1804b1-49fe7bc4d6cmr16270115e9.28.1790234099948;
        Thu, 24 Sep 2026 00:14:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5e86:d153:fdb4:61c0? ([2a01:e0a:106d:1080:5e86:d153:fdb4:61c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf9691e2sm117990005e9.1.2026.09.24.00.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 00:14:59 -0700 (PDT)
Message-ID: <d879b1ca-3f64-4c3f-bb3a-0b80b0bdc582@linaro.org>
Date: Thu, 24 Sep 2026 09:14:58 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260923-topic-sm8x50-iio-max34417-adc-v1-0-41d4ba1bfc41@linaro.org>
 <20260923-topic-sm8x50-iio-max34417-adc-v1-1-41d4ba1bfc41@linaro.org>
 <20260923191810.34AF81F000FF@smtp.kernel.org>
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
In-Reply-To: <20260923191810.34AF81F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 21:18, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Low] dt-bindings: iio: use of vendor-specific rsense property instead of standard
> - [Low] dt-bindings: iio: unnecessary gpio.h header include in example
> - [Low] dt-bindings: iio: contradictory default and required constraints
> --
> 
> commit 83b0b12b383dfd05c3631355160ac1fe40dc6802
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: iio: add: document the MAX34417 Four-Channel High Dynamic Range Power Accumulator
> 
> This commit documents the MAX34417 power accumulator device tree bindings.
> The device uses an I2C interface to monitor power consumption in portable
> systems.
> 
>> diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
>> new file mode 100644
>> index 0000000000000..6f2339a927710
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/maxim,max34417.yaml
> [ ... ]
>> +    properties:
>> +      reg:
>> +        items:
>> +          - minimum: 0
>> +            maximum: 3
>> +
>> +      label: true
>> +
>> +      maxim,rsense-val-micro-ohms:
>> +        description:
>> +          Adjust the Rsense value to the resistor value
>> +        enum: [1000, 2000, 4000, 5000, 10000, 15000, 20000, 25000, 40000, 50000, 100000]
> 
> [Severity: Low]
> Does this binding need the vendor-specific maxim,rsense-val-micro-ohms
> property for the shunt resistor? The standard shunt-resistor-micro-ohms
> property is well-established across multiple kernel subsystems for this
> exact purpose and might be a better fit.
> 
> Additionally, is the hardcoded enum constraint necessary? It artificially
> limits the possible resistor values, whereas physical shunt resistors can be
> of any resistance.

Good points

> 
>> +        default: 1000
>> +
>> +    required:
>> +      - reg
>> +      - maxim,rsense-val-micro-ohms
> 
> [Severity: Low]
> Can the default fallback ever be utilized for maxim,rsense-val-micro-ohms?
> The property is defined with a default of 1000, but is simultaneously listed
> in the required array for the subnode. Because it is required, schema
> validation will fail if the property is missing in a device tree, making the
> default logically dead.

Good point

> 
> [ ... ]
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
> 
> [Severity: Low]
> Is the dt-bindings/gpio/gpio.h include needed for the examples block?
> Neither the device tree node nor its child nodes appear to declare or use
> any GPIO properties or constants, so this might just be a copy-paste
> artifact.


Good point

> 
>> +
>> +    i2c {
>> +        #address-cells = <1>;
> 

