Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816252;
	b=U3B9j0X9OB3118C5WbWQF0f5Yai1luP5ALkuSAGCJ580w9AxNE6ZCaUGM2NBNh2xmjrr
	 FXBpVUriDL4a2KmbwF0pBpZn7gRqYyZvjDJDeWDyN0PoyjdoGpPSSSZoTiZJ+0q8sJPvd
	 asc5IAswKFC5f60L5+AU02jB/J3ivJgisvgut+DDIEbZMVMZtBBa+obg6kUSSCYHAZlpl
	 ok/z6Gm4B30P4C2No06iAjR0yxvFt1ztt0kkbyzBE8eU8j1K4k6mNtc1P9HFR2LU06pgt
	 dqyCIZD6uOEWtpXkzUOjWGjk0pgOKMZWBVb2CQrr65bwRPWcQl+ylClP47HoRZIKq/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6jY49psiB3PmDwv6JClsZ3y00dtoVgDtQ7FZWnd6meM=;
	b=ko/fxbD4C0SGHbbAviFM3/2r+l2TijPcfLTZuksX0Em7+7JhuRbrwacq4BA3xcQwTAI5
	 TACocyvA1xaen86+uLJxgv51x4DutE3GPF0ofkuoQmxatEq2kRL2hpRAm5U0S0rZu2kmg
	 V7xXD9nXI214aIoguZEPnZ8z7iPQ8JyWGP7M7gyT2FzhKT3w8f0i+L5NMjSOJhW/vsrmR
	 rqznJakVGyhyy3phtI6YtGOttp1NaotzbsrXWAYGpbHtYPrlVqG9fSVk4aI9MziV4oAHw
	 TVgk0Ae+klLLSNGbKDUv68qjEFue3VWevLfvyDNUfy+UveLq+Ps9rU8ihxyEEUrjhCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bZIx5pw3;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4133606A32A
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 08:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4133606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bZIx5pw3
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso19874325e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 00:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794816250; x=1795421050; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jY49psiB3PmDwv6JClsZ3y00dtoVgDtQ7FZWnd6meM=;
        b=bZIx5pw39gsPkqUIV1NrbGi3a2cNTirXZaxGOcUeapyYVg1LIbM2UuEWtVssf0wNOt
         x6NYYNH/LreDjbJ3Jjz/JfTACnmzsBV/53AvgZAvOfm2CtW2iihMr7HziZKJAdeId9Pz
         UoB3+utb7796793MssypE4SLrlgFboaGsrLXN3vLB7LItFzGPdFia/hDk74q+C4CTnL5
         eas4i/V0uXrqVs7w+PtfG2Eu6z8C90gpNQx57vZmtK3VyVpRIUgx1GlcuQRwjtd7DWdd
         3MiVvPJZnIY991esHutHFEoHQe5ypnx+pWmubv28NenBxzfmhMxS2YlBk+MdnFGQHktA
         y9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816250; x=1795421050;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jY49psiB3PmDwv6JClsZ3y00dtoVgDtQ7FZWnd6meM=;
        b=vZSU01eeEx4ILw42/Y17VJK6qwc+pwj8nYrXl+SqHfMGE+bXK59a1elbNFxpaQF4UO
         NLphHVuGLMX0r4pA7ryqtehQOroUTiM5ZKM2+85spymzJz2Xma5vgpIddUTq9sgAmedn
         xBj8yb8o4CKMEdZQa/RKa2ubsYghSyLtzU2xpvHYqJ/LiAohKlEtIF5G0hBsg3xODupY
         yqsQejIi1Hgh2uD1wV2P9t4nVget1ZhJHaJU6moQUaTKVenmp+S/26y2YpaNXDMiBjWO
         YTuEXf1Ja0owjAnpqN6O7u1BCAiBSfctKEYvvb96BG5BCeVZm1RhP6w1WjUvIBvGBbY9
         sOgQ==
X-Gm-Message-State: APuU4Z8ijgmpwa/QRvzOHHzKoYggLMgtaD2kyLMx3krZAOczgPyvBDg6
	uOenzEABL0xm+uFAbimts/NHlqxWKZKDUNxPu5RJJSYxpn/cLKJ4wDH57AFlOjPOfxcajWtTtOV
	745ii02o=
X-Gm-Gg: AYBFou3eM2gUbXXdPEx+IOaLCYlrS/lOknPazqsIuXgH/DFTleQTOMnxuBy51dpHKFs
	6FJNL11n31WdAlV6s39J6I5hyvCCJdUOomYRF4E+l7P6gYr59w6bev9r3xYpXsfqKfNYpgFqUJH
	t1X5GCeItyaheFXhyfvqK4yRx303kvRNJO5qsltDjJZfZIzsv7QDLtmC1BAZqDSDR8FFVvMXDGO
	RvTXdU4ge0c062YQZ+jZZo0xThS/dZ4tsN6Aj1o/4KNQbCdUiPuUWlLIVVaYpwU5ntGMKHrz8ed
	wolfBoZdCaR+b4LMQCItJA0KRRbL6AH0KBdhp/DavHGUEiIaJy0XOmlKTjHF/vbnNPZzDOUjYBN
	f2fBvlm5M7Oxl7OYnzzxymNDeUGJwf7zD81t+AOwE91Oe9grdR81WNjRXWcTCaLjtRZR6z/oV/9
	qyz2GOAkFNSej7K8k0FDbdx8SXOFdnJpIrdMzc766ukXT8gZG+jqO2CVJor2fC57tstDljCmNYQ
	ixO273eatqaEX1gnLk8ymbZGOW9ZwfJlVFwnzVLcY8TRbrb984vJJdLre1AJ5nZeTWfEDJyCSgV
	upmTFEhOMiq06o+CGdDozn/BdtnHXZk+ebA2EcWU5YzM+j3k9PORKPkZxzAVv8jJyaAuuvMDUyP
	Lyb1JoIYZ
X-Received: by 2002:a05:600c:1f96:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4bb55a4d990mr217913585e9.12.1794816249974;
        Mon, 16 Nov 2026 00:04:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm19919314f8f.59.2026.11.16.00.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 00:04:09 -0800 (PST)
Message-ID: <8a4f5390-951e-4718-9aa4-91dba93958b3@linaro.org>
Date: Mon, 16 Nov 2026 09:04:09 +0100
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
Subject: Re: [PATCH RFC 21/23] arm64: dts: qcom: add SM8650 LPASS CPU dtsi
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-21-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213539@kernel.org>
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
In-Reply-To: <sashiko-outbox-213539@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:18, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [Medium] arm64: dts: qcom: unsupported power-domains on WSA macros in
>    sm8650-lpass-cpu
> - [Medium] arm64: dts: qcom: unattached multiple power-domains on
>    lpass_tlmm
> - [Medium] arm64: dts: qcom: lpass_core clock count mismatches
>    lpasscorecc-sm8650 driver
> - [Low] arm64: dts: qcom: node and property ordering in
>    sm8650-lpass-cpu.dtsi
> --
> 
> commit 1f3d7332ea1210e666215d104062d22d42ebae2c
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: add SM8650 LPASS CPU dtsi
> 
> This commit adds sm8650-lpass-cpu.dtsi with the LPASS clock controllers,
> lpass-cpu node, LPASS macro clocks, and I2S2 pinctrl state for SM8650
> boards booting at EL2 without ADSP audio firmware.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi b/arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi
>> new file mode 100644
>> index 0000000000000..43d0d8daa4fe2
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi
> 
> [ ... ]
> 
>> +&lpass_tlmm {
>> +	clocks = <&lpass_core LPASS_CORE_CC_CORE_CLK>;
>> +	clock-names = "core";
>> +
>> +	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
>> +			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
>> +	power-domain-names = "core",
>> +			     "audio";
>> +
>> +	status = "okay";
>> +};
> 
> [Severity: Medium]
> Does specifying two entries in power-domains leave both GDSCs unattached on
> lpass_tlmm?
> 
> genpd_dev_pm_attach() returns early without attaching any domain when a node
> lists more than one power domain, and lpi_pinctrl_probe() only sets up PM
> clocks without calling devm_pm_domain_attach_list() or
> dev_pm_domain_attach_by_name().  As a result, runtime PM resume of
> lpass_tlmm will not power on LPASS_AON_CC_LPASS_AUDIO_HM_GDSC before
> accessing LPI TLMM registers.

Good catch will investigate

> 
> [ ... ]
> 
>> +&lpass_wsa2macro {
>> +	clocks = <&lpass_audiocc LPASS_AUDIO_CC_WSA2_MCLK_CLK>,
>> +		 <&lpass_audiocc LPASS_AUDIO_CC_TX_MCLK_WSA2_CLK>,
>> +		 <&lpass_vamacro>;
>> +	clock-names = "mclk",
>> +		      "macro",
>> +		      "fsgen";
>> +
>> +	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
>> +			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
>> +	power-domain-names = "macro",
>> +			     "dcodec";
>> +};
>> +
>> +&lpass_wsamacro {
>> +	clocks = <&lpass_audiocc LPASS_AUDIO_CC_WSA_MCLK_CLK>,
>> +		 <&lpass_audiocc LPASS_AUDIO_CC_TX_MCLK_WSA_CLK>,
>> +		 <&lpass_vamacro>;
>> +	clock-names = "mclk",
>> +		      "macro",
>> +		      "fsgen";
>> +
>> +	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
>> +			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
>> +	power-domain-names = "macro",
>> +			     "dcodec";
>> +};
> 
> [Severity: Medium]
> Are power-domains and power-domain-names supported on lpass_wsa2macro and
> lpass_wsamacro?
> 
> Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml does not
> define power-domains or power-domain-names and sets unevaluatedProperties:
> false, so dtbs_check fails when sm8650-lpass-cpu.dtsi is included.  In
> addition, unlike the rx, tx, and va macro drivers, wsa_macro_probe() never
> calls lpass_macro_pds_init(), while genpd_dev_pm_attach() skips automatic
> attachment when more than one domain is listed, leaving both GDSCs
> unattached during register access.

Good catch, will add

> 
>> +
>> +&soc {
>> +	lpass_audiocc: clock-controller@6bc0000 {
>> +		reg = <0 0x06bc0000 0 0x38000>;
>> +		compatible = "qcom,sm8650-lpassaudiocc";
>> +
>> +		clocks = <&bi_tcxo_div2>,
>> +			 <&lpass_aon LPASS_AON_CC_MAIN_RCG_CLK_SRC>;
>> +		clock-names = "bi_tcxo",
>> +			      "iface";
>> +
>> +		power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
>> +
>> +		#clock-cells = <1>;
>> +	};
>> +
>> +	lpass_aon: clock-controller@6e00000 {
>> +		reg = <0 0x06e00000 0 0x30000>;
>> +		compatible = "qcom,sm8650-lpassaoncc";
>> +
>> +		clocks = <&bi_tcxo_div2>,
>> +			 <&lpass_core LPASS_CORE_CC_CORE_CLK>;
>> +		clock-names = "bi_tcxo",
>> +			      "iface";
>> +
>> +		#clock-cells = <1>;
>> +		#power-domain-cells = <1>;
>> +	};
>> +
>> +	lpass_core: clock-controller@7b00000 {
>> +		compatible = "qcom,sm8650-lpasscorecc";
>> +		reg = <0 0x07b00000 0 0x58000>;
>> +
>> +		clocks = <&bi_tcxo_div2>;
>> +		clock-names = "bi_tcxo";
>> +
>> +		power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>;
>> +
>> +		#clock-cells = <1>;
>> +	};
> 
> [Severity: Medium]
> Does providing only a single clock at index 0 on lpass_core leave the
> P_BI_TCXO parent of lpass_core_cc_core_clk_src unresolved?
> 
> In drivers/clk/qcom/lpasscorecc-sm8650.c, lpass_core_cc_parent_data_ao_2
> looks up DT clock index 1 for P_BI_TCXO:
> 
> drivers/clk/qcom/lpasscorecc-sm8650.c:
> static const struct clk_parent_data lpass_core_cc_parent_data_ao_2[] = {
> 	{ .index = 1 },
> 	{ .hw = &lpass_core_cc_dig_pll.clkr.hw },
> 	{ .hw = &lpass_core_cc_dig_pll_out_main_div_clk_src.clkr.hw },
> };
> 
> Because lpass_core only provides index 0, of_parse_clkspec() fails with
> -ENOENT for index 1, leaving lpass_core_cc_core_clk_src and its child
> branch clocks (such as LPASS_CORE_CC_CORE_CLK and
> LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK) without their safe XO parent when
> clk_rcg2_shared_init() parks the RCG.

Will fix the clk driver

> 
>> +
>> +	lpass_hm: clock-controller@7e00000 {
>> +		compatible = "qcom,sm8650-lpasshm";
>> +		reg = <0 0x07e00000 0 0xa000>;
>> +
>> +		clocks = <&bi_tcxo_div2>;
>> +		clock-names = "bi_tcxo";
>> +
>> +		power-domains = <&rpmhpd RPMHPD_LCX>;
>> +
>> +		required-opps = <&rpmhpd_opp_nom>;
>> +
>> +		#clock-cells = <1>;
>> +		#power-domain-cells = <1>;
>> +	};
>> +
>> +	lpass_cpu: audio@7b87000 {
>> +		compatible = "qcom,sm8650-lpass-cpu";
> 
> [Severity: Low]
> This isn't a bug, but audio@7b87000 is placed after
> clock-controller@7e00000 instead of in unit-address order, and compatible
> is placed after reg in clock-controller@6bc0000 and
> clock-controller@6e00000 above.
> 

Will reorder
