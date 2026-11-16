Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815886;
	b=NteZOACY/cYQp2y8Xzq6x02g4HS08R41B5PXYb76DfRIzNuNfunhnsE+z8osQHr2OZW7
	 NoCdbdCCEynvLPoTO5GNUodbEcZjR75nKv5SAICqX+Lhjrj8BAmHAUEVFhv/PweaWXKou
	 mErki7AupyzEkF36ZZMnfXWJHvch7k+AR5Ig0zwSC465MTSttPsAaW70Ss97dsv1imLWU
	 IjT6ViLyGVxyXGRz6OGKdTYKWaRW8RQ+bfOnfQpjO+HuVBsl9wBoLtMZDGbX4reCZzo78
	 ooWI7bysNgH/LIFOWomZCTAbOuCPhpeJhtRdOHf++Y2p6uqrEa/ksNGLWG7AAu0ZIPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=TDKWR0Bggbyju/TIs5Ee13LupgHgIQxhXl50fDo0WC4=;
	b=B5tQ9EYR9WH2gL+Q+xu7va3u4jvZks3899gyAtmvjDR+/RwJv47FsZ5gZ/aOGZjjqd9w
	 LJAzb5BNw0zxSd7ja5LBKvFi6VO2GttdmRVb3ymW1pEXcLNY1uL1/rOPROZpGbur+Ey4U
	 Wmak8v24kvu3hlmqEBEq0yfNomBl57yDPXFLN9sFSqLpLd5b9KG7wom8CJfYy7QlTfJWU
	 8mxmRKSvAGM37arE3Sc/9P1REoEmXZadDPlrAA8+8O2AH8fj0rbrPXHXXjBm09UXztxJ4
	 JyzLMwfEG7gMrc36Tqbs8djsL5uyiYRfyUSQxIZ2pftApdP/CEJ976Wy7LIpINVehsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z4oCzo+V;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55523606A32A
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 07:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55523606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z4oCzo+V
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so7903375e9.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 23:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815885; x=1795420685; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDKWR0Bggbyju/TIs5Ee13LupgHgIQxhXl50fDo0WC4=;
        b=z4oCzo+VKEbJEVxIgpKGWZChN2rgcuxadHKYMlu0V3Ws5jGjDmPyly5wbjwbZy6fzH
         dFApZ9/16Fa6zfqm3/7EdsROeRogNmIptv5gpGaf2geHP9bFwBWPOA5iSuoPZn4cs21E
         8p91jo1aA6KI4AR1WPvokB+OxyQo/AmY6WV/FHbt/9/x6vEu3mch2eQ8LaK7JJG2Njf+
         dGJ6SxEQEieB+jR72sSPADqLFANgK9WSwqFdjFBhNMoiUVkhCxjxllpVmf2bfUtD4Nzp
         Jq3yZUibTW2FP6oWq1RR+2GlTcwdXiqO7J7OcQVXXN10imRI18zo+I72T2xV7OiDt9wE
         THEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815885; x=1795420685;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TDKWR0Bggbyju/TIs5Ee13LupgHgIQxhXl50fDo0WC4=;
        b=Mwzg1Wb3Sgf49k3ZFSlU4yW+kLdv8fcx96ZEFqiXfK0GJEWmn9B+FxkW+Sz+k5MfPo
         LAifs5tp+NtpbXlitqSAcUyZzR7EfS0n37NJo2PwpAYl2LrWRv54NAAuTjBvw6qZvvt6
         4MNxN/M5u79Q6VMEa/Cva1XZN925MOqJzflNAFSQn0ZS2Da2EzBj2N8Y0WQxTuPmqVOM
         bf5P/nVIjNZ/r/eyOMgf0ZpgupW0CfSUmgzOsrUYtOHLopv57AkeDTPLRLc1HgA7j7gh
         aUCdUNF8mb3NaGumZp9xfMiqVWnrhdWFxgKKrxJkHvHcehEfJoqSmOw7DLTJgCDj9htx
         vp1Q==
X-Gm-Message-State: APuU4Z+aR/SZpddV24qnZFclurNhvzI+GF/7MhM4AJmt8TkmH4fC/sn+
	XJhDdwLBN3MqqoUirUL6TUktxQ2FZZM8EaLU9ISRJQ6ZXflondOMsJHvBvaMXaHDxV6fDViyHvx
	tgj6gnKA=
X-Gm-Gg: AYBFou1VASqpvDhJwIQ8DoIMUiYe0CpQ3iBs8cJ9C/9n7h1mDCQWXAiW05frQnm3EyQ
	WKZGXjZl9cY8jjejYXltwY6Osw3t8/hGmvzh3H8FMbQDzj7XiGS0eQt+k+ekbdaa7BYNqavlssy
	/zG1Lt7r1DkoFamjTy4hcl0VLhZFObZdx/fxTf+vxiiL6l7eo2NM6LjlO7GuirUohRA3Jmg48rF
	CTYGnuPYHrK0BUXvdCeQ0ll8MTIFku1e3A3Poeekde8W6UbRR71iT9osRzaAHow5nonBJCuMA5O
	FtYRlhbi+soOmsPV/1wSnthXYGSJdjHOTpTVSrXbbyTdyMulQBLgr9v9qZJjWZXSZVdUkWftpBr
	9+EIW33jJ2/+xe5vMZElqkgcz9hKGWEU7TOT1jh2fEn+6kEVbGp+7kvZLeVmctCiV7wKFhmW9SA
	BFMCcEPh0pru+L1LTStpfj1+RO/M6Z9XUfinmMPDBxEEcWR/fx5p50z0iybDI1ptdbVINVSe9ZH
	X9iAnIXjQtd+Y7b5TG7MJRl6dkNe0OyWpFI5hyfw7LkvQK/dDNCsZo+bjDNNlKcJ0OGnU+5RHl2
	bm/huCsfIU5TWQBEQVfUvt2ymEeePxb0CiLVIZJUtPddimLC5k9TXhQq4MB9HwJ+LALq+ivA9iV
	6x8LQ8a64
X-Received: by 2002:a05:600c:5395:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4bb55a95d09mr197195635e9.15.1794815884566;
        Sun, 15 Nov 2026 23:58:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm19888971f8f.59.2026.11.15.23.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:58:04 -0800 (PST)
Message-ID: <2cda0533-111f-41dc-aed4-7e2b72b0b927@linaro.org>
Date: Mon, 16 Nov 2026 08:58:03 +0100
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
Subject: Re: [PATCH RFC 16/23] ASoC: qcom: lpass: enable the right codec_mem
 clock when usin LPM memory
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-16-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213502@kernel.org>
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
In-Reply-To: <sashiko-outbox-213502@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] ASoC: qcom: lpass: LPM clocks not parsed when only
>    mi2s_lpm_enable is set
> - [Medium] ASoC: qcom: lpass: unchecked mem_clk enable and leak in
>    startup()
> --
> 
> commit 6968d3f5a8288f5418d4e48725abed1263de22d5
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: lpass: enable the right codec_mem clock when usin LPM memory
> 
> This commit adds a helper to select the codec_mem clock matching a given LPM
> buffer offset and enables the corresponding LPM memory clock during DAI
> startup and shutdown for Codec DMA and LPM-backed MI2S ports.
> 
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index 4bbcd59ebd602..302c31b23090f 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -89,6 +89,17 @@ static int lpass_cpu_daiops_startup(struct snd_pcm_substream *substream,
>>   	unsigned int port_id = mi2s_port_id(dai->driver->id);
>>   	int ret;
>>   
>> +	if (is_lpm_mi2s_port(drvdata, dai->driver->id)) {
>> +		struct clk *mem_clk = drvdata->va_mem0;
>> +
>> +		if (drvdata->mi2s_lpm[port_id] == LPASS_RXTX_CDC_LPM)
>> +			mem_clk = lpass_cdc_dma_mem_clk(drvdata,
>> +							drvdata->mi2s_lpm_offset[port_id]);
> 
> [Severity: Medium]
> Can mem_clk be NULL here when a board enables LPM-backed MI2S ports without
> any Codec DMA DAIs?
> 
> In asoc_qcom_lpass_cpu_platform_probe(), of_lpass_cdc_dma_clks_parse() is only
> called when drvdata->codec_dma_enable is set, whereas the LPM memory resources
> are fetched when either codec_dma_enable or mi2s_lpm_enable is set:
> 
> sound/soc/qcom/lpass-cpu.c:asoc_qcom_lpass_cpu_platform_probe() {
>      ...
> 		ret = of_lpass_cdc_dma_clks_parse(dev, drvdata);
> 		if (ret) {
> 			dev_err(dev, "failed to get cdc dma clocks %d\n", ret);
> 			return ret;
> 		}
> 	}
>      ...
> 	if (drvdata->codec_dma_enable || drvdata->mi2s_lpm_enable) {
> 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx-cdc-dma-lpm");
>      ...
> }
> 
> When only drvdata->mi2s_lpm_enable is set, drvdata->va_mem0 and
> drvdata->codec_mem0..3 are never populated and remain NULL.  Passing NULL to
> clk_set_rate() and clk_prepare_enable() is a no-op, leaving the LPM SRAM
> unclocked when the stream accesses the LPM buffer.  Calling
> of_lpass_cdc_dma_clks_parse() under the codec_dma_enable || mi2s_lpm_enable
> check would ensure the clocks are acquired.

Yes since it's a no-op, it's fine getting NULL

> 
>> +
>> +		clk_set_rate(mem_clk, LPASS_CODEC_MEM_HZ_NORMAL);
>> +		clk_prepare_enable(mem_clk);
>> +	}
>> +
>>   	ret = clk_prepare_enable(drvdata->mi2s_osr_clk[port_id]);
>>   	if (ret) {
>>   		dev_err(dai->dev, "error in enabling mi2s osr clk: %d\n", ret);
> 
> [Severity: Medium]
> Does this leak the prepare and enable references on mem_clk if enabling
> mi2s_osr_clk or preparing mi2s_bit_clk fails?
> 
> Whendai->driver->ops->startup() returns an error, snd_soc_dai_startup() does
> not mark the DAI as active, so snd_soc_dai_shutdown() will not call
> lpass_cpu_daiops_shutdown() to release mem_clk.  In addition, neither
> lpass_cpu_daiops_startup() nor lpass_cdc_dma_daiops_startup() checks the
> return values of clk_set_rate() and clk_prepare_enable() on mem_clk, which can
> leave LPM memory unclocked and cause an unbalanced clk_disable_unprepare() on
> shutdown.
> 

It _could_ happen, I copied the cdc-dma scheme, but since it's ina new file
I'll add the checks to avoid that

