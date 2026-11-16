Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815453;
	b=XA8eHMTIMRNc5SExrKwuKe0dB0qL27aTeYUpAzy5OxXnFORd1bRFG6oh5n1vb7K91Gre
	 kLtAIFkEDqmj1XowdPF0p1sSPejqU3ABHbOmYnNI4/vOVAVQ8pIuSnR8QgctoJiWQqDxX
	 c2DHIelQRvNDMHYGZmeT810l1tIN4Sl2TtLQR4DJkB0o/L8ghRoSOi9aNgcjVgSHDELvr
	 IlAkpdAMI3Rzi7IMZxXbkd7kFDFHJkRzGkRYRcJJekD3Semq1FiGvpvo9ophOX0q2SwKc
	 gL78fkPhFFkhyTmck9YQeeN0qyY2la02k37UpJyZLwJrb18ZwQKyeRnAf5xb1bMrDGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gBevyYkB+KqpxLupXF92krJAbcbx52iOwb7rRaPzSaU=;
	b=pCfw7Us+tn2GNRE5+Cw9icyMcGt4VROMcyzjNj/fzwnIa9dJBOId27Dgm1+b/LYwViNM
	 1F5zgrQ9NyaLTCbLZXPIYFTEvBH1KYszW4Rld8xx/KzG000XqYU15se5DBYKi99fqxF8Z
	 j0LEIOAPwbXojJ3vP6ddgRWrX3lKZTH+8Wbc39GGI5QALuJJ99XoFEdd6cWJopd4nGBrc
	 kXldqNiZ4tFREO0i9wjASorX3QcVHf77Ef8n61QZtN1Ewg/+kOUHYe9QVspHhjZvO1czl
	 /jwAUjNQIpZu7AbiqPCT6CFGDJYmSsq/zIlfiLapQslyVVwNRSoEda30FSCmWnHZvhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XsuFGcEI;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1729606A329
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 07:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1729606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XsuFGcEI
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1645594f8f.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 23:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815451; x=1795420251; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gBevyYkB+KqpxLupXF92krJAbcbx52iOwb7rRaPzSaU=;
        b=XsuFGcEIV5B4MSXeOpB3mHAbVajJqtznkFTbyDDEskyGD3mLJvBBOjTbYWiw08g6BK
         AOcEBKOqdyh3J89qH0L5P8SWMkIurW01eTMSCSngMsWI8ivPmLq0eSQeWA6eGRhutZvT
         XzNdm4NEH++ZOT1kgtbD5P+6Ike1ZqkLJdgyMmfXfOGj092SXmSFKjXM1/oMhcRuFtBE
         pwv4w/Qs/INcFYXPyvb6XRRAzQu33g/p77C8DUDmqFz/m9QQPCe65NbTu+QfmQSFXpj5
         hgrOYMhaK0POueOpItrNnmmnm0XQt/eh3hurS4dl0ojwWKqZgS1aplzQ17K6quCizQb/
         Tx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815451; x=1795420251;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gBevyYkB+KqpxLupXF92krJAbcbx52iOwb7rRaPzSaU=;
        b=lEO8hWVhWmMeIhEa46myx3lc8o+HweHfoHDniYX5+99yx4H/ktKmOXrt4D+W+EJpDz
         YhsUVqC3byzVzXyC1QslK9CO5T2rss6qEJHbB06SlFNFAORdSYIEg+oRO2fLef90BW4v
         4Gdgq5FeKr9bJf78s22GsXuL/IWTnWeoqFSWcGFzoQO5uCdAUKLI9vGBe65ahjpYMSRT
         +CGymolaCEUVovq8khkKLpfo42NBBfK/60CU9C/8PiCLBltgXslOUglBsFLMbvJDCTpc
         MuuhAqoS4bRn0Pjs1jzX0jJrWZaTCr8dTOHQD7Jsda9HFkrYb6dcPUujofiqFHZ3xrXV
         cHLA==
X-Gm-Message-State: APuU4Z8zdHqHIrANgijzhgmI2XgHKO/JnLLvuqP59xjzC9AMIjYNwZ8Z
	GtCWIyIwCjzaSTo5kvyE9n2Gg1FUMmrAXaeQ8OPqt/ev0Qi0ft+OV9RvaBVVf7KgUYA+yI1sp2d
	Zzn2mkNY=
X-Gm-Gg: AYBFou1Jcj3FgdH//GUk5S+uT/OnjmSHMhYYbq8joDeOuagoO7Ve4OoX88JT7SM2TGS
	iUbSE/quYd62yDZe44e0xP2GSR1YfjN0ioNhnk38Zn6NvACH/z/0vX5O8w9L1+O9XQDavpp9vCN
	3d5kv60RbY/oVWSh3yJedZoPsmbo7exDYQyX6ydwPv4KAhXORMIFWqfPC1cqfGLRIhGcM/m/6nT
	4K7U8zm/hs7mwpS15GAgOoU/7kskJglyRh5+nsWyGtIJ63gEBKlsA8o1LzxEpYGXqxGHpXf6j7l
	gz9xpDCyNRXJiVQlzu0Ggh97e9C8Ez7HI3cjpJ/yqpLsrKf2MKgytglEBgY87kJA+8iY8MHmkwW
	2UmJGTm/uo2whNcpvUYw6IyaxwFLFP8gqPMu075/85MhkE3HAacc/yvVFD/pwZvKED3CjF6+REG
	RWc/lzwqnwHhKkt0jKjvzBtkvMYg9q3i4wU2vPFH6tqPDGuSigvPy9yndPHrmB2wRTniC08Uoo1
	nquGVX/SEsdL+xWuQoQ9cJUTPxhgeKj4ma8HskutxEvwz3SmVtNrU2lU7fweYISoZRI9WKGU5K8
	xx5LKvxsgA3RnbzeyoaIJsBgVyGirBjZiugRokUyoyFH7ifkAk9I3Kt4G40LqjEfbw4RIQycw8p
	+Dif1pOXF
X-Received: by 2002:a05:6000:4582:b0:48e:44c7:bf0f with SMTP id ffacd0b85a97d-49c714a352fmr16250325f8f.25.1794815450969;
        Sun, 15 Nov 2026 23:50:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1797sm22775989f8f.11.2026.11.15.23.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:50:50 -0800 (PST)
Message-ID: <402595f8-0aec-405d-bcce-eb54981fcbb9@linaro.org>
Date: Mon, 16 Nov 2026 08:50:50 +0100
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
Subject: Re: [PATCH RFC 10/23] ASoC: qcom: lpass-cdc-dma: add support for WSA
 codec DMA
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-10-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213505@kernel.org>
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
In-Reply-To: <sashiko-outbox-213505@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] ASoC: qcom: missing WSA_TX4 case in
>    __lpass_get_codec_dma_intf_type()
> - [Medium] ASoC: qcom: unchecked clk_prepare_enable() in
>    lpass_cdc_dma_daiops_startup()
> --
> 
> commit fe9e37da583fba7a4cfa98118783d3ccffae7524
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: lpass-cdc-dma: add support for WSA codec DMA
> 
> This commit adds WSA codec DMA interface plumbing and clock handling to
> the LPASS codec DMA driver.
> 
>> diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
>> index 2dc8c75c4bf08..903055e3188d8 100644
>> --- a/sound/soc/qcom/lpass-cdc-dma.c
>> +++ b/sound/soc/qcom/lpass-cdc-dma.c
> 
> [ ... ]
> 
>> @@ -68,49 +76,67 @@ static int __lpass_get_codec_dma_intf_type(int dai_id)
>>   	case LPASS_CDC_DMA_RX0:
>>   	case LPASS_CDC_DMA_TX0:
>>   	case LPASS_CDC_DMA_VA_TX0:
>> +	case LPASS_CDC_DMA_WSA_TX0:
>> +	case LPASS_CDC_DMA_WSA_RX0:
>>   		ret = LPASS_CDC_DMA_INTERFACE1;
>>   		break;
>>   	case LPASS_CDC_DMA_RX1:
>>   	case LPASS_CDC_DMA_TX1:
>>   	case LPASS_CDC_DMA_VA_TX1:
>> +	case LPASS_CDC_DMA_WSA_RX1:
>> +	case LPASS_CDC_DMA_WSA_TX1:
>>   		ret = LPASS_CDC_DMA_INTERFACE2;
>>   		break;
>>   	case LPASS_CDC_DMA_RX2:
>>   	case LPASS_CDC_DMA_TX2:
>>   	case LPASS_CDC_DMA_VA_TX2:
>> +	case LPASS_CDC_DMA_WSA_RX2:
>> +	case LPASS_CDC_DMA_WSA_TX2:
>>   		ret = LPASS_CDC_DMA_INTERFACE3;
>>   		break;
>>   	case LPASS_CDC_DMA_RX3:
>>   	case LPASS_CDC_DMA_TX3:
>>   	case LPASS_CDC_DMA_VA_TX3:
>> +	case LPASS_CDC_DMA_WSA_RX3:
>> +	case LPASS_CDC_DMA_WSA_TX3:
>>   		ret = LPASS_CDC_DMA_INTERFACE4;
>>   		break;
>>   	case LPASS_CDC_DMA_RX4:
>>   	case LPASS_CDC_DMA_TX4:
>>   	case LPASS_CDC_DMA_VA_TX4:
>> +	case LPASS_CDC_DMA_WSA_RX4:
>>   		ret = LPASS_CDC_DMA_INTERFACE5;
>>   		break;
> 
> [Severity: Medium]
> Should LPASS_CDC_DMA_WSA_TX4 also be included in the
> LPASS_CDC_DMA_INTERFACE5 case?
> 
> __lpass_get_dmactl_handle(), lpass_cdc_dma_daiops_startup(), and
> lpass_cdc_dma_daiops_shutdown() all handle the full
> LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8 range, but omitting
> LPASS_CDC_DMA_WSA_TX4 here causes __lpass_get_codec_dma_intf_type() to
> return -EINVAL and __lpass_platform_codec_intf_init() to abort without
> configuring or enabling the DMA interface.

Typo, will fix

> 
> [ ... ]
> 
>> @@ -184,6 +210,17 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
>>   		clk_set_rate(drvdata->va_mem0, CODEC_MEM_HZ_NORMAL);
>>   		clk_prepare_enable(drvdata->va_mem0);
>>   		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
>> +		clk_set_rate(drvdata->codec_mem0, CODEC_MEM_HZ_NORMAL);	//??
>> +		clk_set_rate(drvdata->codec_mem1, CODEC_MEM_HZ_NORMAL);	//??
>> +		clk_set_rate(drvdata->codec_mem2, CODEC_MEM_HZ_NORMAL);	//??
>> +		clk_set_rate(drvdata->codec_mem3, CODEC_MEM_HZ_NORMAL);	//??
>> +		clk_prepare_enable(drvdata->codec_mem0);		//??
>> +		clk_prepare_enable(drvdata->codec_mem1);		//??
>> +		clk_prepare_enable(drvdata->codec_mem2);		//??
>> +		clk_prepare_enable(drvdata->codec_mem3);		//??
>> +		break;
>>   	default:
>>   		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
>>   		break;
>> @@ -205,6 +242,13 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
>>   	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
>>   		clk_disable_unprepare(drvdata->va_mem0);
>>   		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
>> +		clk_disable_unprepare(drvdata->codec_mem3);
>> +		clk_disable_unprepare(drvdata->codec_mem2);
>> +		clk_disable_unprepare(drvdata->codec_mem1);
>> +		clk_disable_unprepare(drvdata->codec_mem0);
>> +		break;
> 
> [Severity: Medium]
> What happens if clk_set_rate() or clk_prepare_enable() fails in
> lpass_cdc_dma_daiops_startup()?
> 
> Ignoring errors here lets the stream proceed with unclocked LPM memory,
> leaves any earlier codec_mem clocks enabled on partial failure, and
> causes lpass_cdc_dma_daiops_shutdown() to call clk_disable_unprepare()
> on clocks whose enable failed.  Later commit "ASoC: qcom: lpass: enable
> the right codec_mem clock when usin LPM memory" removes the "//??"
> comments and selects a single clock via lpass_cdc_dma_mem_clk(), but
> still leaves clk_set_rate() and clk_prepare_enable() unchecked.
> 

Will fix the comments, the code uses the same schema as RXTX and VA, not checking
the ret. If the clcok set fail, audio won't output but it wont cause any crashes.

Neil
