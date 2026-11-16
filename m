Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814913;
	b=T1UZIxaZM/bP4ButmPyqfRkuNxxSaLaoxmuVIcllXx8sprP9ihElvHdC+E5yX/X/B+dO
	 r/vKLSOOJ5uoeQ9jivL97fTUlxyP1XkiMxT4YBI6WJ7yotG8fofaNcSeOZwunYb7HJJlU
	 NgNJ3jJyMT2Q2kpXS8w0wGGkcD6YvQMyStZXnlZwpuD8FzCHZuRrKmGgavrgvF/6b0Sy2
	 ufN/ruWBh7wHan6YHBoTsWAQb4dE8PPNG/rJLs68+7dw0OMYtdaXJ7HH+qbB3bAnDWUlm
	 9R/Rp+qoeMKFH33KRoQDWrzRJUSmO5aCvsau5e3o2u1zfpS70c/3GkXb35kATJ7J/aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SQ3RFqnPd9mQAA3jgNlgrAZqkBDxvjolcqnYLHrt9V0=;
	b=fv2R2pox2ujHpsdlI9MmeQSTSdt7okK2WDNScKZGcUO8c2f3RJOo2VxMep8l6kqzPQ1l
	 ZkOv2M/a/mteOyFVM9yV0fYyU5jX+vw5mfz2x6IL4DH57tst0Hjgpc7LT1emciwcw6WYr
	 5BvZylMQr5CJLYUrhv23ZSrNU0dbC0sZnpQA46SuB35XGrHRLmu4tCLkH5JUdvWDGo2sU
	 NFJRRJs9D2Pqbgh9b37zOf9cBLteL4+55yFIrl+Yd8Xg890ny4/zW67U0LCTlu+TTarOk
	 Ktj2LvRLfaN0KH8Dx0lLBEUTkdFY9j/ARqxT4RDhZHj1xevQmZV1Uz2P3M9bSpZT2wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yOV2s8+a;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06650606A882
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 07:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06650606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yOV2s8+a
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49a92144733so1159146f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 23:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794814911; x=1795419711; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQ3RFqnPd9mQAA3jgNlgrAZqkBDxvjolcqnYLHrt9V0=;
        b=yOV2s8+a7ef4BpK1Nry1J7+tdKWNeNFg0V/xGPiDsH4a7LDB3fX33nw3vaa3fccbn/
         hhh5btEKgO0mM9gUia17oMcgFnUOeoJ35D0tpEwapLtj1Kpbhc78L76p+OJNxh5n/oGO
         0irmu3OaJgVOTNcRo38lh2AROc81WU0dI+JAZ5wgbZYg9+SNCO0BKabgvlWp357icK2V
         LoYk1GYXx//rWayTKDxqlTQI4u2nY944+H4ENYsHFgqV+ClQeCJL3Q5O9HN19bAxYaMu
         zJhQ6RPHa1Bx7Lo6NQ/OOY2PMVdeo2iKCURNcAOZ36qv1hwWlEDtN/CQxzAvjuwXJ+jZ
         Rliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814911; x=1795419711;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SQ3RFqnPd9mQAA3jgNlgrAZqkBDxvjolcqnYLHrt9V0=;
        b=PNr3+wYhrlxYMBbs5dRbMqnUfAttLNm+lm+/YdACTQ6ksgZ33YRmf+3OzCGk/1+KLT
         vNRvt0CPGQRf/se/Saspfggk4quuEJF4glRdkmcjYPsRQE72oGF9U89d9elFJBgKKoHd
         lKk+oDQ0LOQKWv0oEujqN1sGy4U0CU6IhRe9Qk3cNGqq7TMOajtkpExXbT5tPH+YFWcp
         /o+nvnWfn/6nmRlTFR8VbCDuiSBIN10b3GrL5dc3ZsjqB+QTYqaUKDollfMN1VET71QA
         HrXBE7eOoewwKX1tgKT42yKDHDApApjbqR6iX3NkTwT6F2XgIyE6PZemrZqcsG10yiGG
         AVcA==
X-Gm-Message-State: APuU4Z9gAYcy3KBT3HcWg+k9BEHsSGeFIAL42hq2WNMt9QVGx/4hqpg3
	QpMXom2IfO47oGXY3Ap9p+QSNMNZD3/qH9uMkcnxsJfsiu2aCTLUm2dYZUPHmyj/TjVml1DNhTf
	YkwbcpKE=
X-Gm-Gg: AYBFou3eGgO6LwsTU0KpGD4Ks/rAejVhUekU+PmPaHXDpp1GIFMH8B1ciJjl2UPL2gX
	B6fQ/nseu3Q+MhtFInqMjRqvNYLqUYDHM4w5LiNhFkKJYtsMo3zMtBchbZ9fJL3AVJjsIPEV42i
	0aVY186g6kz8QJ/gj+O5jCBRYjg3m9eUOrkjR6/UAXVzLRFyGqrDATs5EpGyn4Zzc+2H/fJX5dl
	lqf9k5ood3GE44nP4hoQYy3nvheCJQvZ4I8BlnKaZgRSzTcCVAow8Dn8wWqy4856W5NCDB7Zs3s
	6W34wU5xRtDCELBrRquoqwGxj+3aVj10EDMEvTRlD+0T8637G42jrKc/Nqcun3dvQdEBk+5KnO7
	N//k9XT0CJXYljG7s/BCyp7hmuYvgQuLKfPZZLC75i4vMqpujbUoiufDjdMk2wqsFoRiBrukrI8
	ds7lEaNoa6xBro4HE6MovScDgG72wEqXNrl1ZzI4/zH5TQ702xXm3H/9S/1f7ubfiPhh0U1p9Pw
	WmV5Wt/SKE+cIBO5Z8adSysDy5uJU8ZTJPU6ywFQM0f3tM62HsUg0lynGsi4UZt8nNpCew9KRux
	SuXAYA2grDF2EX33MF3hoCZvk4Kaaam9S07d59M5kGNvqv4nYTTfLf4qUqEyMCHFUBtQRCR2tkz
	oDig/vP9Abg==
X-Received: by 2002:a05:6000:4714:b0:48d:f0e4:27a4 with SMTP id ffacd0b85a97d-49c71785315mr20347442f8f.24.1794814911273;
        Sun, 15 Nov 2026 23:41:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm20939365f8f.5.2026.11.15.23.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:41:50 -0800 (PST)
Message-ID: <81f79143-7b30-4b65-8d57-84444aa8a111@linaro.org>
Date: Mon, 16 Nov 2026 08:41:50 +0100
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
Subject: Re: [PATCH RFC 01/23] dt-bindings: clock: qcom: add SM8650 LPASS core
 & audio clock controllers
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-1-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213487@kernel.org>
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
In-Reply-To: <sashiko-outbox-213487@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 19:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] dt-bindings: clock: qcom: broken examples in
>    qcom,sm8650-lpasscorecc.yaml
> - [Low] dt-bindings: clock: qcom: unwieldy per-compatible conditionals
>    in schema
> --
> 
> commit 822c52dcc683f4949600245b7d9f62d13802e752
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: clock: qcom: add SM8650 LPASS core & audio clock controllers
> 
> This commit adds the Device Tree binding schema and header definitions for
> the SM8650 LPASS HM, core, audio, and AON clock controllers.
> 
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml
>> new file mode 100644
>> index 0000000000000..9c5207ee02f15
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml
> 
> [ ... ]
> 
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpasshm
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Board XO source
>> +        clock-names:
>> +          items:
>> +            - const: bi_tcxo
>> +      required:
>> +        - power-domains
>> +        - '#power-domain-cells'
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpasscorecc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Board XO source
>> +        clock-names:
>> +          items:
>> +            - const: bi_tcxo
>> +        required-opps: false
>> +      required:
>> +        - power-domains
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpassaoncc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Board XO source
>> +            - description: LPASS_CORE_CC_CORE_CLK
>> +        clock-names:
>> +          items:
>> +            - const: bi_tcxo
>> +            - const: iface
>> +        power-domains: false
>> +        required-opps: false
>> +      required:
>> +        - '#power-domain-cells'
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpassaudiocc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Board XO source
>> +            - description: LPASS_AON_CC_MAIN_RCG_CLK_SRC
>> +        clock-names:
>> +          items:
>> +            - const: bi_tcxo
>> +            - const: iface
>> +        required-opps: false
>> +      required:
>> +        - power-domains
> 
> [Severity: Low]
> Each of the four compatibles requires its own if-then block to override
> clocks, clock-names, power-domains, required-opps, and
> #power-domain-cells (which also leaves #power-domain-cells unconstrained
> on qcom,sm8650-lpasscorecc and qcom,sm8650-lpassaudiocc).  Would it be
> cleaner to split these variants into separate binding schema files instead
> of using per-compatible conditionals for every entry?

Both are feasible, I'll follow the maintainers preference here.

> 
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,lpassaudiocc-sm8650.h>
>> +    #include <dt-bindings/clock/qcom,lpasscorecc-sm8650.h>
>> +    #include <dt-bindings/clock/qcom,sm8650-gcc.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    clock-controller@6bc0000 {
>> +        compatible = "qcom,sm8650-lpassaudiocc";
>> +        reg = <0x06bc0000 0x38000>;
>> +        clocks = <&bi_tcxo_div2>;
>> +        clock-names = "bi_tcxo";
>> +        power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
>> +        #clock-cells = <1>;
>> +    };
>> +
>> +    lpass_aon: clock-controller@6e00000 {
>> +        compatible = "qcom,sm8650-lpassaoncc";
>> +        reg = <0x06e00000 0x30000>;
>> +        clocks = <&bi_tcxo_div2>, <&lpass_core LPASS_CORE_CC_CORE_CLK>;
>> +        clock-names = "bi_tcxo", "iface";
>> +        #clock-cells = <1>;
>> +        #power-domain-cells = <1>;
>> +    };
>> +
>> +    lpass_core: clock-controller@7b00000 {
>> +        compatible = "qcom,sm8650-lpasscorecc";
>> +        reg = <0x07b00000 0x58000>;
>> +        clocks = <&bi_tcxo_div2>;
>> +        clock-names = "bi_tcxo";
>> +        power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>;
>> +        #clock-cells = <1>;
>> +    };
>> +
>> +    lpass_hm: clock-controller@7e00000 {
>> +        compatible = "qcom,sm8650-lpasshm";
>> +        reg = <0x07e00000 0xa000>;
>> +        clocks = <&bi_tcxo_div2>, <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
>> +        clock-names = "bi_tcxo", "iface";
>> +        power-domains = <&rpmhpd RPMHPD_LCX>;
>> +        required-opps = <&rpmhpd_opp_nom>;
>> +        #clock-cells = <1>;
>> +        #power-domain-cells = <1>;
>> +    };
> 
> [Severity: Medium]
> Does this example pass make dt_binding_check?
> 
> In lpass_hm, GCC_LPASS_CFG_NOC_SWAY_CLK is not defined in
> include/dt-bindings/clock/qcom,sm8650-gcc.h, causing dtc to fail with a
> syntax error.  In addition, lpass_hm specifies two clocks ("bi_tcxo" and
> "iface") while the qcom,sm8650-lpasshm conditional schema only allows
> "bi_tcxo", and clock-controller@6bc0000 (qcom,sm8650-lpassaudiocc) only
> provides "bi_tcxo" while its conditional schema requires both "bi_tcxo"
> and "iface".
> 

Last-time edit mistake, will fix.

Neil

