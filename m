Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B432135F18A
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 08:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352430; cv=none; b=e5dwSnYXjlrQV4UIo6SavHDSycVWz4WJpKr8v51aeTEy87IVW+823/VGFZarXeo+qVkbCHra0scjZcBKKaVtmTf7LBNTDMA8XEH1liR+P5gkmArhYeOq3ealzLFd4QPdXABBIWgiStsv9AEqg4uUpoHOhDgJB0lwPTHbNmSmVgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352430; c=relaxed/simple;
	bh=7imtNeGlM0Ij74pQULbNoqDY1bGqPc+5D3+CclMU59M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GNsZiDZ65ZuUvSee7GUGULIkARMAYEAgwsNQ8swdxxl0vl8yXmCYG/6lOWP1ok7BPQNH3dhwlGblSpqSDb4xbsZOqV35w9xAIoE/1Xo7Vm1WPKuRu1Nx6KL5IVCF5lmPyUBuodDVvOeBh1FeQPw/Rw1MQ09kz8HZIA2FbeWgpfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tM4g5dBD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tM4g5dBD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so28268985e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 01:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779352427; x=1779957227; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+lhtBKg/we78saKSTSBcOB5Y21fRXHQiMOJZNkYcss=;
        b=tM4g5dBDXgxT1f+qtY1zTSxxYAeKsdTl5F5iJ4FXmLsCJS7jlhMVA9jjGDy04m+8NR
         x56TqMsgsIFbweOJBRV7/68mf0PJKgrC1hBkA4uLTZcrMHpr52tNiNdaLy3nnk3KtYzH
         BQanBpmTJhPcVQ+BVpkJItF4PdqTyig9Cq/Zu5BQImsO4fjD9reSYL526p5lTKTsNVG0
         bKEFlHv2OwXSdrYOahJQsUPjHK6c2RFDbGswtcoH6k/BLRUksXObwnGYsjLf/KLLCHta
         l5C4EyxgWOF5BbPKsQJ7vlkUxbGmqdwVASEDu8PulZKeyaJlHZKH0zuYdSU0bnzkip18
         dCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352427; x=1779957227;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+lhtBKg/we78saKSTSBcOB5Y21fRXHQiMOJZNkYcss=;
        b=JRFvEb7fJjHdla8B4BZ7wBZ43s2SEEZxI90WOJh1R8xWFvRTdEpnLa/XtpM1CDfdxB
         kwP292cAsQoz2aL7c08hi2oQixzI0IjxnPlzgSwIu6kAFDXaHiQ+1DA9+xPliNoLrI6X
         rviFW68l8PrZFRwma0Wu9P/CccoYo8rj7oWZcJHvDtQBmmj1nV2l3hNYVkD+Jb7KJ2rQ
         pHpTuKsduMECuj81XAFF/xCE+876FJZxeLotUqFFr8kBnSmFuBXSi6XJz9Z5Td1W6IDJ
         14QO2WRAWQKr3SFQFQVp5t0eFGZ9EPT1wcKMFiGH64DNOcUkUwkRZ8Rk5cZXefMHpWz4
         bgFw==
X-Gm-Message-State: AOJu0YwoEbVRQ+DqGwQaJ939RYZe5rqSlDgsZehhEs4Shy67bqw5XXKL
	gp7j/NMaZQMExSgNKH7lui7KRPjbZJ4V2YT8F84h6pv9asQ0CL2HXnia8M4Vgi0WsR44FtZItLF
	MVfm0
X-Gm-Gg: Acq92OGIdw4sYz0pl5lh1EHwZf8dbWFX3JfYtra+vb+SoI4xKyal1j0ghjHCtKHov3a
	SSpcBTtu+qWxZGJjdcTkX0EOzqHwLGgYQDc88qbQxqM/oiT04+n44sqEt6x9I0w2Ma9Jjrhek38
	weaCO6ubzXDiZWF0REOEBLc9ilk6iArSs4URIfROczS2U+3EkX6LurivPmCs3aInS41lSfRVANE
	V/4gkMYuexlq8usvnoOoHrcoiH4qPdPtcoP17D4M6uqxV0kEk6RX2+ixboUzViAPC3Rbn9Y8ioK
	7/Q45o5A89cimK6kg3Dsg845bcSbxTxHTlQxyhWEoDe1tONCQEdqmX58dPzyDQ+VQ/1ziyhXzBh
	6bF3ROdj+uJiwwLObx7lScvDpebDNY2336h0yK/XwwwiMbdmYyv1PkgZB4WDSytio72E/uQ5LIP
	v7meQs3ivQUhwqJGcIXvCQHu2wsKwz8pZqqosGvaA9vp1tqFb0ZGQfAu7YGgVU3ywVfABasocIH
	xfKLQE=
X-Received: by 2002:a05:600c:4513:b0:490:3cd6:db37 with SMTP id 5b1f17b1804b1-4903cd6de06mr6682875e9.12.1779352427082;
        Thu, 21 May 2026 01:33:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e038:7e8a:7467:8c6c? ([2a01:e0a:106d:1080:e038:7e8a:7467:8c6c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d9eca8sm48056395e9.12.2026.05.21.01.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:33:46 -0700 (PDT)
Message-ID: <55466105-03df-4968-87c3-38b5f45b83ac@linaro.org>
Date: Thu, 21 May 2026 10:33:46 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org,
 wsa+renesas@sang-engineering.com, conor+dt@kernel.org
References: <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-1-dd5700299390@linaro.org>
 <20260521082230.6BD161F000E9@smtp.kernel.org>
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
In-Reply-To: <20260521082230.6BD161F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/26 10:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The schema incorrectly uses `additionalProperties: false` instead of `unevaluatedProperties: false` when inheriting from a common schema.
> --
> 
> commit 06ab207971a6f54327d9bb05b5e8355cbba81b0c
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: display: panel: document the Renesas R63419 based dual-DSI video mode Display Panels
> 
> This commit adds a new device tree binding document for the Renesas
> R63419 generic DDIC. The DDIC is used to control dual-DSI LCD panels,
> such as those found in Ayaneo gaming handheld devices.
> 
>> diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
>> new file mode 100644
>> index 0000000000000..adfdd2c300a35
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
> [ ... ]
>> +allOf:
>> +  - $ref: panel-common-dual.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - ayaneo,wt0600-2k
>> +          - ayaneo,wt0630-2k
>> +      - const: renesas,r63419
> [ ... ]
>> +  backlight: true
>> +  reset-gpios: true
>> +  rotation: true
>> +  ports: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
> [ ... ]
>> +  - reset-gpios
>> +  - ports
>> +
>> +additionalProperties: false
> 
> [Severity: Low]
> Since this schema inherits from panel-common-dual.yaml in the allOf block
> above, should this be unevaluatedProperties: false instead?

No, it's deliberate to control the properties we allow

> 
> In JSON schema, additionalProperties: false only considers the properties
> explicitly listed in the local properties block. This means any standard
> panel properties (like width-mm, height-mm, or enable-gpios) not explicitly
> listed here will be incorrectly rejected during validation.
> 
> Using unevaluatedProperties: false would allow properties defined in the
> inherited schemas. It would also eliminate the need to redundantly define
> properties like backlight or ports in the local properties block.
> 
>> +
>> +examples:
>> +  - |
> [ ... ]
> 

