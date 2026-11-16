Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816163;
	b=Ar04WKS79rTtWGwxE5Ww1Iz6Kb+2RIO6CSdvHCPGEWuT9pu4tphwu0oz83vqn2qhxfta
	 I1WRvt4TzTN25VJMgovcWcN3XUlXRzB8uxZgAXlJcWgQxJOZNRvwMn8jwORA8bCLqU0Kp
	 4+4ZcdOYQmKDTAAkgbC5gtaqa3q0vqketLOl33ZIFf7q9lTPP6jURRuWljWE4E5FruIVX
	 rtDverwkTWJ6PkNnDrbk9l6GvMj8KeUC7AdgT2fQxQDzF6chi4u2wNm/jxV+EVs4k/b9o
	 SP8QVYEtKTOGjSVSqz0YMevZvpDV93JB+hwsx5SRSPwifWGgRO1k6qFwZC5d4oVxFeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UHo9d6+UFVil9qEgoZ8u1ZstiqDWRXEwg7YdOGS5738=;
	b=x2onQ172pe6Z7c4zUUKyijq7nKeuRY6YGRASNXmLMa2u5L8COqbf/ikSjOy6I8jfcTfh
	 tqb69WLYPjZS6REIGJzCqcmnQ5lpG7478VBUVYyQGMFSc/nE0Pi2TbVmDQ2vj3NpT6mIL
	 Nc32rC4PcKwMEEIL7HJRjsZjr9HZ9T8lTqbdNpbDEcyhVHTjpu8yHnXe6JfkL/GwlbOoG
	 vC+NQXsb7pVO1fYF/Cnz+mY491eF8Bv7BrOK314ptQkRpxy02CZeYH5LU7LB24zgUObJU
	 8pFqT2lw+6hRIfkwO/GDEee9AFZGMDM6op9Rbj92fwWf1Ccy+uEBE3eAEMsuEHncOwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="AWCZUQ/w";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD802606A32A
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 08:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD802606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AWCZUQ/w
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so3331075e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 00:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794816161; x=1795420961; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHo9d6+UFVil9qEgoZ8u1ZstiqDWRXEwg7YdOGS5738=;
        b=AWCZUQ/wgCbJRwER6v83EYabKr5LNJLFI993gWhIpCd3WT5mt9Fj3PkpT6uCx85zDW
         aJKEt+U+ReqQrXPKeImT0wDDEwa7OOZTMs67fy1tVbsPCTz0VuhOyT4CKF5Mt49V9Z0d
         qdHEshV+srk7ulWE0vMkcSa3fIijz4Wc3IHqOd6cQ/punsBM953exKa5aSq7Sz3ZRepI
         P+piY+Gz4MKrdlMo9I+OO7aztYIEI9LiHmOIiMLrv7VlMS0TtsEud5pcpwSjDCHTVWFQ
         neNvH0YYxUW6C3CiSM8n90P4m8Dok7gkfSDGgBsBAo6OvtX38uqXJKl6kj8o4G4hxxqJ
         lF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816161; x=1795420961;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UHo9d6+UFVil9qEgoZ8u1ZstiqDWRXEwg7YdOGS5738=;
        b=K9niKHPX3hOhzxHZhitKBSKlfh0HIPZniYylnayg3GMpxRpAMnpYmOYNiHgi4Rcrtq
         PAVHlMM3uIBIUg+/O+iPa0BLhIoy8B5ZDIJYeClMuf2K6XXZf11JakqkZZvYMtwCnOFK
         FlsmHUSv0M0fNpWPOvpMaIpGkrUgb7RBRsTU9jybbeE/xqXj+vwrvc+VApzvZxqR1Vb0
         mTt/sANhXeOgrGCQyKj4i5CuII8pMHk80/Ctd8dRtmNC2W0tf574WV789bbrWqBiPJp6
         F+1KW/5mNJAJ6HukNo7pou3Y6xjuk8eVcN4b00N1+ptQMeTZL4KXNn65orXnkJwUxtY5
         VltQ==
X-Gm-Message-State: APuU4Z+khrnCLb5niLiesYMbLhpmP1gt/H8rS39pK3JuYDAeYIaesaPb
	J+yGZ2ugozJDCI1qr2rnPKTguoPcgDE1VFQPZEznqLQNbhmloCJTzWkyc4k9AveHWSsV5FV5Ro2
	gswRVNHw=
X-Gm-Gg: AYBFou2q1D4ashMiP+8doRlWzeRTx1EoRd4XZaZ71Dr57ha5OC/asosTWp8tmFS3bC3
	5ssQ8JzDqd2xCcBuAl+7+AUX/5Hiy9etv/4YPp/qE9hxkY+nBEvzM40nwAMiAwxT5HV4+m997vH
	5o3LUoMMMc1hgMQ0mmWfxP3WICsSkgrQqW8vtIVuqh6+MBDmaSpWdRSfzBy/yA+kt7e5oxQVXdB
	0v4CObDdZe5NkWlJRj8xmbaGMx8rgYToup2kvD9+YqiBldyzEdpQJHX76nuhNdMYee58qiqS2kp
	O7S9nJI/iOohWTLaP5FU3zPssvbhkvMWDrPscVxl1jd6PGvotB7dDcs6wBjOhifqZbpTEI29jNM
	v5Wm8eFXzfrlwLXl5zv0TPv5w5s1sk+X3FV+eEudc7nEHT4j4DPo7HedMtq9gNqCasR0tDiZJNF
	hlnHXKTVzZ0BsLo5scdCaYa3sDreBHjA3PGdvJEIK02c3jxxZ3gRCEBLQTRBx9TWAMrFtGNdV7W
	uhIICc2PtR6pM/ePvnSorOA6GewFV44Lw8p9HkJaka7m4CM0BXShi3gzJKWFoR+Hf3M+wk7t8OG
	VkI3El/8k4ROCJQnDQEDuVDLLwdJkqCMSzFodA/pc7uM/Phe7gCMNVN2EQsATGbEO9PYDBaf0be
	C/BlaY5EL
X-Received: by 2002:a05:600c:6085:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4bb55a8d7abmr199333895e9.20.1794816160849;
        Mon, 16 Nov 2026 00:02:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6fb45a32sm52654365e9.1.2026.11.16.00.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 00:02:40 -0800 (PST)
Message-ID: <1803bc6f-ef9a-4cac-910c-04a403429fdd@linaro.org>
Date: Mon, 16 Nov 2026 09:02:39 +0100
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
Subject: Re: [PATCH RFC 20/23] arm64: dts: qcom: sm8650: move EL1 Gunyah nodes
 to sm8650-el1.dtsi
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-20-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213519@kernel.org>
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
In-Reply-To: <sashiko-outbox-213519@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:11, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] arm64: dts: qcom: sm8650: lpass_vamacro left enabled with
>    zero clocks
> - [Low] arm64: dts: qcom: sm8650: leftover video_mem reference on iris
>    in sm8650.dtsi
> --
> 
> commit 6cf38f344aa0427c5afd87fe6828f76c27873b93
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8650: move EL1 Gunyah nodes to sm8650-el1.dtsi
> 
> This commit moves the Gunyah EL1-specific reserved memory, remoteproc,
> SMP2P, IPA, GPU zap shader, and q6prm LPASS clock nodes out of sm8650.dtsi
> into sm8650-el1.dtsi, and removes the corresponding node deletions from
> sm8650-valve-deckard.dts.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-el1.dtsi b/arch/arm64/boot/dts/qcom/sm8650-el1.dtsi
>> new file mode 100644
>> index 0000000000000..18b7c18ae3120
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-el1.dtsi
> 
> [ ... ]
> 
>> +&iris {
>> +	memory-region = <&video_mem>;
>> +};
> 
> [Severity: Low]
> Was memory-region = <&video_mem>; meant to be removed from the iris node in
> sm8650.dtsi?
> 
> Now that video_mem lives in sm8650-el1.dtsi, leaving memory-region =
> <&video_mem>; in sm8650.dtsi duplicates the property on EL1 boards and
> causes an unresolved phandle build error on any EL2 board that does not
> define its own video_mem label.

Yes since today there's no EL2 support for iris

> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 86fbb0fd6472d..d88acdb8c7759 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> 
> [ ... ]
> 
>> @@ -4854,12 +4302,9 @@ swr2: soundwire@6d30000 {
>>   		lpass_vamacro: codec@6d44000 {
>>   			compatible = "qcom,sm8650-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
>>   			reg = <0 0x06d44000 0 0x1000>;
>> -			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> -				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> -				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>> -			clock-names = "mclk",
>> -				      "macro",
>> -				      "dcodec";
>> +
>> +			clocks = <0>, <0>, <0>;
>> +			clock-names = "mclk", "macro", "dcodec";
>>   
>>   			#clock-cells = <0>;
>>   			clock-output-names = "fsgen";
> 
> [Severity: Medium]
> Should lpass_vamacro also have status = "disabled" here, like the other
> five LPASS macro and pinctrl nodes?
> 
> Because /delete-node/ &lpass_vamacro; is dropped from
> sm8650-valve-deckard.dts and sm8650-el1.dtsi explicitly sets status =
> "okay" on &lpass_vamacro, leaving it enabled in sm8650.dtsi with
> placeholder clocks = <0>, <0>, <0> causes va_macro_probe() ->
> devm_clk_get(dev, "mclk") to fail with -ENOENT at boot on EL2 boards that
> do not override the clocks, and breaks dtbs_check schema validation.
> 

Will fix
