Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729EE39D6C9
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179231; cv=none; b=je33Ic34+fzBdHRMY/S5V486Da8ZxEVwfaXdFIF0ZVuSZ5tpPIY+kD0X42mfGC8YEkbSK3QUc1+1Lmwlu95jyS3Qnqt4DFIIuIzN1IK/IgeuV7gsXJK8HgkJ6r+oSeX0lEs9UBAp6JtjBDLnfRX4Yu3euz9Qyq5tPecW2t7N8lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179231; c=relaxed/simple;
	bh=vHq/QwysCAgnNKiBTbbYeanowaRKF+5PysX/4OYh2GU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ASvO0Di1fT4y2wB4pohr71uirSTUmnV2cZ/U3UHkXdIrAkq/JW8kIZkR4egZzaBdjgid2Z9O4K40yOUJ1TNt9uilOhpjuIuv5qzgOsu1/FeDGI4fsFnyQPrCkxOZTUbKXnkDd/GldZuJh9/2d8mD8x6IkLyE9M77Kd5elQupw7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q3d8gALe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q3d8gALe"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so31993805e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 01:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779179228; x=1779784028; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li8pLXuBuaVtnggQNVW2WcAL7ywg8DDPWHRsGjdEDzE=;
        b=q3d8gALejGzOobABTkh/JI1X+0YE1BkmaMYa057akmuaE7C3FuoM5kEUWafLvk+BDJ
         v59McB3YdtRDhci0goCXZk+Xk6f2nztKQJLJ94G3el6YfuHnoDsm6g/Hm4rCmcAtC1uQ
         Y7Z4hndL/uyMQ5PTx5fkiDtfj9X/DSjRvKpBnTbvJRXx7huPTsCmn2X95Zp7zzz2nc6C
         a6kBF9YGz6/cqZyH2TrGHZz8K0ITQcgJnCo7UUql0Rs1W8p9tgcjhAbc0Je0G+clrSjo
         f/Dm9wTA3NKzWKMG5Vb6BNJmgbqP9b9Yk+n4eLrJZdoU926ntVxaCd0zGqkkiOVgm69H
         TBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179228; x=1779784028;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=li8pLXuBuaVtnggQNVW2WcAL7ywg8DDPWHRsGjdEDzE=;
        b=rOCDhfZxS+JWCyzvYfimrpMMFv6WlRwbEQ9a8XmAbnHgtXkrXA0f635APNbAga5y3U
         giENIit5VYwvdhyTaZylgvQtbkABlzI0+A3cS1A5I3KJRTn/TtePZYvow5vckUYlUm8+
         Y2M9gN3267OI2lhurcdn3mjhE+YlmyDapS79nQecui7QhyarHBa3rDlBfH/PmWEfm7om
         cUXn2KvATVsing1u6AKcO6gVa+8v9uK6WbJieFYc2/j7H1UZXyhHdGVm0urUQFMgNUZy
         Xv9aQTvZM8RIwgC6IAd1JqxSntEEVcmwRVhIGSVRW5Ssp5cZtRAj3HLcpXmht4nnkOsN
         0TeQ==
X-Gm-Message-State: AOJu0YxbLdZLlJSZcEXZb8v+J5H3sK5AL5pvvrYPnRsAbZx23/c8n5t/
	jZXZ+bzHkJnsRZ/NKTerQWQZJQiL/6ALZzg9EWO7aPsalSfMefDu7QAjn/8P7F7i/l4MMAdnpKq
	86AOZ
X-Gm-Gg: Acq92OFf0oT3A99QUVP4JVZDh7oTYbLXbCTOyqju0mVVsq64RsZUgyoEiNjfoU2PI9+
	5jv3V3RPw+94p2Ds9P9okJyrWd6rBb5DKZ36RcdDFBPhD3dPWFtU/JaXiZInCKPFCqFRzQMBW9/
	f59/it3ShoPeubGWZWKUtcvjIFPlriFzAOmz3O4s0ahGivTeDw4iJhpXJ8D3LX66H7PW0ix5PxU
	VsE+sOUpIUad9OfnaiQFnJZll7Um19rVhdJQpPANk/C2FH+6PzmGxU0xBXGGi6v8CFqDX89oCA2
	ThyRVXqOq3bI7WLna5fRcb+mLHaneIfYNi95OQjlTSfk6vnCdh7VTNv8eOCmQ9hYiAuUrnnJAra
	0SJ0SbbaeQCtoae1AfG5kYI8ehKqal+ZStBbz1rpcQUkE9mjuKGbFIVXdiPvNyequoBoqgrQSb0
	gXwxO9QPu57rMQpFksN5BiyY3Y+fjzUYryBPcpLUR275wATDHc1BE+Z8ZR06LN7DY1ZpmYl8LFr
	yaJtsV57pH9xe0=
X-Received: by 2002:a05:600c:a406:b0:48e:82cc:4d4c with SMTP id 5b1f17b1804b1-48fe6514939mr226969685e9.23.1779179227682;
        Tue, 19 May 2026 01:27:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1d4b:274c:94d:a69f? ([2a01:e0a:106d:1080:1d4b:274c:94d:a69f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab7c5sm328708975e9.12.2026.05.19.01.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 01:27:07 -0700 (PDT)
Message-ID: <cfc5814b-fcee-4d61-83bd-6a977b792cc2@linaro.org>
Date: Tue, 19 May 2026 10:27:06 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260519-topic-sm8650-ayaneo-pocket-s2-r63419-v4-1-b8929af5e951@linaro.org>
 <20260519081829.6B1B7C2BCB3@smtp.kernel.org>
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
In-Reply-To: <20260519081829.6B1B7C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/26 10:18, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] The `reg` property is omitted from the `required` list.
> - [Medium] Schema validation bypass for dual-DSI ports structure.
> - [Medium] Flipped positive/negative voltage regulator assignments in the dt-binding example.
> --
> 
> commit b7585613be27a07063e2837b4b237f47e298a1f5
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: display: panel: document the Renesas R63419 based dual-DSI video mode Display Panels
> 
> This commit documents the Renesas R63419 generic DDIC used to control
> dual-DSI LCD panels, specifically for the Ayaneo gaming handheld devices.
> 
>> diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
>> new file mode 100644
>> index 0000000000000..e4db01f88302c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
> 
> [ ... ]
> 
>> +description:
>> +  The Renesas R63419 is a generic DDIC used to control dual-DSI LCD panels.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
> 
> Since this documents a dual-DSI panel, should this reference
> panel-common-dual.yaml# instead?
> 
> Referencing panel-common-dual.yaml# would correctly enforce the dual-DSI
> topology constraints and validate the ports structure for dual-link DSI
> panels.

Good point

> 
> [ ... ]
> 
>> +required:
>> +  - compatible
>> +  - vdd-supply
>> +  - vddio-supply
>> +  - vsp-supply
>> +  - vsn-supply
>> +  - vci-supply
>> +  - backlight
>> +  - reset-gpios
>> +  - ports
> 
> Should reg be included in this required list?
> 
> The Renesas R63419 is a DSI peripheral and must be instantiated as a child
> node under a DSI controller bus, which inherently requires a reg property for
> its virtual channel. Omitting it from the required list allows incomplete
> nodes to pass validation.

Good point

> 
> [ ... ]
> 
>> +            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
>> +
>> +            vdd-supply = <&vdd_3v0_lcd>;
>> +            vddio-supply = <&vdd_1v8_io>;
>> +            vsn-supply = <&vdd_5v0_pos>;
>> +            vsp-supply = <&vdd_5v0_neg>;
> 
> Are the voltage regulator assignments flipped in this example?
> 
> It looks like vsn-supply (Voltage Supply Negative) is mapped to the positive
> regulator, while vsp-supply (Voltage Supply Positive) is mapped to the
> negative one.

Good finding even if it's only an example, will fix

> 
> [ ... ]
> 

