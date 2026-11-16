Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816303;
	b=USU5H9psOcYE5vBV4ml+KvsFA/gFERpXIptIqT93DRVV3zsI6xeBjaHTGuo1FmQk0Q2H
	 /b75sCz0b1Ikm37bXpO6jxLfOMw6NBG5sqbp++sFUxbH3SaLyWOvUCNxCHz4lzL6v9rf+
	 mBJsstnn1nBxJiQJlh44c3UT42Nj2bD7KP3Xgj9D/UtCO5EWN/yTs5leew3JCzm/6M05N
	 zdgcpj4IPJZtFutnqAthuZZ5LXmWT4uHNsh5Xt7+bHuN6QOATmFpCd+N+2FYxvLz80UhA
	 Xv8bAvrjGHco9QWbSnLgfJYUiATfjD4Qe9vPFogMtn0z5g++IxQ28tCvCZMs1X5c84w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=y1R2N6M3oJAu4skO9jjhh/J+EeOiDnr68oIITnSGPag=;
	b=HIjpOgELPDdfNbaBiGPbgVQL5owj068bCBQtcXQGqXarmNgw7dZj9VEc5DNKHUvuGDsa
	 YQvTmPy/ugag5dbL0l6m2fsPRSntV8CvCc1rFrBDCuY7MtRBNX703jhm7EzRjxXX5su8n
	 vYYnRzbOQb0326YaVXWQREgAbA+XKSDPC0uKcqZm0rwCRuz6haZl6mLdRf5M91tKAmVnt
	 Bpeheg+0hzA85pRjUSkpZebJkjQZUHbkiPqHPR4x6jSQIpCFkQMqPgvldIWgFsoAikWX0
	 lGvy7rJC3h9tDLtUGvokNn4gYx87EkDxhZff7kuuXhXfT4ojwTA8Kmc8rbByDK4gr6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IRy656cu;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF70606A32A
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 08:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF70606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IRy656cu
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4910b863b84so2270671f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 00:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794816302; x=1795421102; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y1R2N6M3oJAu4skO9jjhh/J+EeOiDnr68oIITnSGPag=;
        b=IRy656cuOtXh1K5U59RnkjMvJg5PdgNB5pYbibx4YmmkwKw8lUb2vLC5m19g+JoEiF
         P22oIwpXx4Hkyap9uqFJWxtGWk70hczFxH1CaKhdUMHoUPxSynF22GZdHjDAmSijsOdQ
         NkQs5hTEIIVCiovCoTbWmVUlE+m/O/eivLcX1+fkeFjqGIv0WUKWbCAQ4SBBYsRJ77vs
         aovY0MeKtANf8QNbFIN4IZ7ksnkoIdlc0DLdYvKQ9tbty4OXhSpOz6J7OnOIWeOuOwiI
         DObOwnqDauj9t2O8jl2YVo+x3xDN24NDr4/EZ/xzg8zyNhzs7J0R/eOfd1AiCwyGImJ7
         yLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816302; x=1795421102;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y1R2N6M3oJAu4skO9jjhh/J+EeOiDnr68oIITnSGPag=;
        b=d3azJgQLwyFOEG+AxsHxnAAMTGDmlWFrJEehaZnWi+9ScYmMz+zqWsOWVgh+JYpyyH
         /kGCQCj00T98XaRhJlq/tnzZavBlVSIsRJx68YjwI8gy4Kn/w8pE+NTEZ9sQOoQ0di2T
         93WgbFMlwWC8f0CPCx0d7dXW9/aDRHQCOenE9eUU4QyeJhvkn6XfTfMAUTFgqWaOhyLf
         F2LbKvDA93n/B6Mb/38CfMV/CtfJM9gCuiVWkIEkejLRWZtFT/M1yALTBpUhdNYAdDuZ
         yMqpm3pfCEhtqlrhg1sKS+8KNymGSPY2uc/AoYruJk3C4LZYqTCuwzIVdLrT22HbYt1h
         034A==
X-Gm-Message-State: APuU4Z+PdfgHZazrDJY1D14XWynX8r3rYeF96U3CBz1FBAO9REMEgR11
	GTRddCn/I6jeHm7MVxgpP9x060XCz+OfO8fVPHmRZq8txlIM0qcwnIMLvMxLAikKMQpDgZeGfCX
	TIvHeKRc=
X-Gm-Gg: AYBFou09rH+tDen9v19cSkeUfIaRWj9ukS2ay59+8W0rxshEldGsYdKVU8kiVIpl8BI
	uuCNOUvNxivDqvepJoxSiDGh/VOwQzwu41es8tRjC5rbsdyv+K9NGSh+8jgy8WEeg+s99oPzo0z
	ubiR5kJzjBxhSv1nokwjs9/7EzR0OFDj17UJV62W/ysDDhYEzo9hsRMcaTaBVcc/uJ4Pgh+S3rG
	NAe+/J3V0Pwb9AZMzwgo94v+9wtTLT0ibzkISNjAr6uabENpTiT0vMgPKFlelgM+iwi0Tvi4e2T
	sRb9s+ie+gMKCCuSq1DU7v/wfaHu3Ue5Gkzosw8WszftVL+mCY+eise/zLvkyDp1hf8P+7FacjU
	dYi3pNCLzU+x1ZoWoxgL05FgN6hMj0a0KZiA1xGRLPHtwddeQ0P8/UqfOa2qgXDlHl8AmAa/60E
	GjPbotscixRl3Yw5wuUOi6PZx6Cjh9Jgy9yQMFhmmw4ksCz8xB0PjvCEdl1avYS9jlyLh+3wVyF
	JahHCLTHuNGoV4bjUT04D1aM9pPWvmpjFff6B/lIPwKDeCpd9nxof6+fuMbgtYEXIi5G2SrccRL
	yMCIjgEOSVyalTDntx/ZaWsPtA28082Uyl5DxLHmpFfIG+zJhPkIpRcNw49nG4TA2E95AlQWpEd
	isloE934FC3762jbKSywRybn5oJZO+SQ=
X-Received: by 2002:a05:600c:4703:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb55a755b2mr211614395e9.9.1794816301471;
        Mon, 16 Nov 2026 00:05:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55acdfebsm249389925e9.7.2026.11.16.00.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 00:05:01 -0800 (PST)
Message-ID: <931bd5ff-2bae-4835-9788-563835e6c4e7@linaro.org>
Date: Mon, 16 Nov 2026 09:05:00 +0100
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
Subject: Re: [PATCH RFC 22/23] arm64: dts: qcom: sm8650-valve-deckard: enable
 audio
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-22-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213545@kernel.org>
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
In-Reply-To: <sashiko-outbox-213545@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:23, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] arm64: dts: qcom: sm8650-valve-deckard: missing VA DMIC1
>    route in audio-routing
> - [Low] arm64: dts: qcom: sm8650-valve-deckard: unused lpass_rxmacro and
>    lpass_txmacro enabled
> --
> 
> commit 159b85c8d3e0dd02d73b32823f4b0aaab92103dd
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8650-valve-deckard: enable audio
> 
> This commit includes sm8650-lpass-cpu.dtsi and configures the SM8650 sound
> card, lpass_cpu, and macro nodes to drive the speakers on Senary MI2S and
> the DMICs on the VA macro.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
>> index a365caa28cee4..723f7911fc547 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
> 
> [ ... ]
> 
>> @@ -160,6 +161,37 @@ framebuffer_mem: framebuffer-region@af400000 {
>>   		};
>>   	};
>>   
>> +	sound: sound {
>> +		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
>> +		model = "VALVE-DECKARD";
>> +
>> +		audio-routing = "VA DMIC0", "vdd-micb";
> 
> [Severity: Medium]
> Should audio-routing also include "VA DMIC1", "vdd-micb"?
> 
> lpass_vamacro uses dmic01_default and the LPASS_CDC_DMA_VA_TX0 DAI in
> sound/soc/qcom/lpass-sm8650.c sets channels_min = 2.  In
> sound/soc/codecs/lpass-va-macro.c, "VA DMIC0" and "VA DMIC1" are separate
> DAPM ADC widgets, so without routing "VA DMIC1" to "vdd-micb", enabling VA
> DMIC1 without VA DMIC0 will not power the vdd-micb regulator supply.

Will investigate

> 
>> +
>> +		speaker-dai-link {
>> +			link-name = "SPKR Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&lpass_cpu MI2S_SENARY>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&left_spkr_i2s>, <&right_spkr_i2s>;
>> +			};
>> +		};
>> +
>> +		va-dai-link {
>> +			link-name = "VA Capture";
>> +
>> +			cpu {
>> +				sound-dai = <&lpass_cpu LPASS_CDC_DMA_VA_TX0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&lpass_vamacro 0>;
>> +			};
>> +		};
>> +	};
> 
> [ ... ]
> 
>> +&lpass_rxmacro {
>> +	status = "okay";
>> +};
>> +
>> +&lpass_txmacro {
>> +	status = "okay";
>> +};
>> +
>> +&lpass_vamacro {
>> +	pinctrl-0 = <&dmic01_default>;
>> +	pinctrl-names = "default";
>> +	vdd-micb-supply = <&vreg_l10b_1p8>;
>> +	qcom,dmic-sample-rate = <2400000>;
>> +};
> 
> [Severity: Low]
> Are lpass_rxmacro and lpass_txmacro intentionally enabled here?
> 
> The sound card only uses MI2S_SENARY and lpass_vamacro, and nothing on this
> board consumes DAIs or clocks from lpass_rxmacro or lpass_txmacro.  Probing
> them registers unused ASoC components and calls lpass_macro_pds_init(),
> which holds active runtime PM references on the macro and dcodec power
> domains for the lifetime of the drivers.
> 

Good catch will remove them

