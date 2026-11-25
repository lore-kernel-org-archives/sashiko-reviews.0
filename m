Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595927;
	b=uWQon0IwKRJz00EYEAOQi+wLfWS2wU/C0LfLsywkUKWVDH+RpOM4khJWwHKkGu2Rglsl
	 nGMqTRzEoY0nT67Y9VU8jfKaApSBjC959n6LoOKp3E2/mYSiF2PDVQRO2n7eb5jq4A5LF
	 oufbdu/qgj+HPw1S02stNKx3JZnyEx2mD6WH/24mvn4IAxL7oREyosbdNQFx79/M+HsTM
	 rGoaYyvhuoy8L8Y3dG7psuo+BgdvLphOPPpz/4PO9b8GlInc/y3U5O4eXQ8MoI28QAveu
	 J4jH3+jL8IOhvffI5iyXFFHE/45hbVs02xWOtvbE3GKM2P8R7vN2+SZBTPNPi8W8NYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=50VR4Bii4r0x40VxRkLIljzh8fTduZtxHSfKIR3mJdA=;
	b=u2vfxx8/mqRR8KYDpJEyTGgWd3E5ZXpF7EqwZzxKdOx6O4gfM9GkueRSKOCtlAK2YSjd
	 js7uiN5o009HR4+4QnHUBbEhc7o6sBloJARFDl3bIu3j+g8HkR0kvxgZiuBiFvGOZ+8m+
	 dMs/EzN18i7xxaG1nhDSz/dSlOnVfl03BN5683KbCV5GIgtiC7/rnuuB2K68bJsarEhqM
	 wtzK6ryZ4mAt+F46yRDxH4V6gyZC2NjqqkTHmpDvvRD6K2/9+t4hcmg/IxleqBvIeuj2q
	 LxIrmbPBSlmQoJDOQPQaUJZJSavDjlRh+/UD11zb3brIcQ7akJU7iUZheG3Ij2pf6Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pyjCruOj;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231E4606A33D
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 08:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 231E4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pyjCruOj
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a9be758734so3410916f8f.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 00:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795595925; x=1796200725; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50VR4Bii4r0x40VxRkLIljzh8fTduZtxHSfKIR3mJdA=;
        b=pyjCruOjp2aarNBNEqvCpgGCLvYNx4sB1Nf9z9OCQCSKrlexaslKATDLam9JrKVneb
         JsCErOMz5p4tipyMmDAfy+ZZrtvbynOOl3DFjDhJCEyIJ+5TFyRNOID1cRU1WnmY9osi
         Xosb2dapBfZ6Jkuv9tk2X/uKyMjkHMxxBP+AZYMepR/fzbRPT4aiLbcJb4ArV79srCd3
         OABKfOOsnN0H2ZEinAdtwlms49DD7EBDYvdaRL6nx2Atkm3fkAmHsM2YWGcbCXHrAb+j
         9tzA5vUqw/sTB6zMioLzQZ/h5olui+PG3swjeTrEfLKwjZ3+RDNeNMqat1p++L6VV6wF
         076Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595925; x=1796200725;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=50VR4Bii4r0x40VxRkLIljzh8fTduZtxHSfKIR3mJdA=;
        b=dFY0Ib+llDfnnavoiEbw7bXlRu58MzuaFHbb0cCmPMvWBSlWh7MeyWlKhAVuTRJivR
         6PiB5zCwZjrxXCKSZZdNhauksO/G/BZ8vqezvvJhwuaT0r3OpBtIMdq72bEC14e1WsrH
         n0uNaagmXpAR4HWRkd/CFeJ66XV08oo4I4+qLJlyGLmeNLPmmBJUQ7EZ+fuUjlb93bNC
         DfJeIK7aez3LHHAMrHFYv5QYD6cchf0MK9ILXj3l+CKFT0hOWzSZDSoqIC/04C4WBZUv
         wcuQ+TCZqt4f8IE+33Wb6H6ajUs03E92Jqfr77Sh3FWluxyi9F9Jyrkl+RkmuSclq9Zg
         JOng==
X-Gm-Message-State: APuU4Z/I+/YU7Nn1UfAtZA+jDQgUh+DU/2HZhRuf0SZo0y13nfGlc2pN
	5Uum9QH8GQcf+ylwPYt1YPcCusYZKJuoEHqtmLm+EdQzqGcGbLbky4Mjc+MZP8RKAqTZ2Pn56Rh
	65y4FoCkZAQ==
X-Gm-Gg: AZFdTZd8eKqyXbSNKmG6v40znp6tJSel2j/+N8QmspjxfYy7K95z0za3C18tOdgXomb
	a+dggWwF+RtOeBLZD2F84AG0Gi/Bkc/ROn6txXSNZhZ5xDxSQFQ6bgROaIFiNY4j/nNBgnlE++7
	DylBayroOxkwfdffvSfrZ2iF3DN/mzvkIKXWSBZyCZlBsAR6YuIS/fL3t5jg1UXo0K2pgg/QTCb
	gsMJCiTh0iuG8dbV7/axZgYqCrTe+NXwesv7rqxyk5hyOxbwi//zDoETfUs/iCi6Xk9oX1GyRsW
	vCeCjkMPEcgcXnuK07lGR32sRwRYSOW53Z18uLm4Fl2wNOGQNzrR7CvO485vZUxUHIB5PBPWWD/
	nwXlFhkQdu+9dNzJ6DbISBDwrsKTiAm18IXoTH7NqC+KrQhiI8VXaOT0t2fV9DNXwsjTLTTxz02
	9MUP2H3Mwlqz4mOtwPf8qYNjv0k3MpsRP3Okio/uXSbb4b9Fi27wzQPpA0ox/foRGonm4e8OHsc
	yKvTsKbUNWspU/128fvrEdksPrgDU7AVYB5T/ktbY/MQGwmmtM4p74WA+clEGYWg8mpBKZHUMgh
	AhW1CnZQlpl80bEWStG1OcKpiZmbxjNNGu8u2y7mFjej/NNPgXRQuS1nsF8hX85qcY3Qw8tTgkw
	xyi5u+vyKag==
X-Received: by 2002:a05:6000:200f:b0:4b7:6dcb:e906 with SMTP id ffacd0b85a97d-4b76dcbea3emr7646897f8f.43.1795595925303;
        Wed, 25 Nov 2026 00:38:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm31544013f8f.0.2026.11.25.00.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:38:45 -0800 (PST)
Message-ID: <0144c378-919d-4c44-a306-dfadea6a7617@linaro.org>
Date: Wed, 25 Nov 2026 09:38:44 +0100
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
Subject: Re: [PATCH v2 10/19] ASoC: qcom: lpass-cdc-dma: add support for WSA
 codec DMA
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-10-174e159f0f69@linaro.org>
 <sashiko-outbox-231736@kernel.org>
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
In-Reply-To: <sashiko-outbox-231736@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 18:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ASoC: qcom: unchecked clk_prepare_enable() in
>    lpass_cdc_dma_daiops_startup()
> --
> 
> commit b77682a3d9ba3fc802985eb7a7f2cb05c5db3350
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: lpass-cdc-dma: add support for WSA codec DMA
> 
> This commit adds WSA codec DMA interface handling to the LPASS codec DMA
> driver, wiring up the WSA DMA control handles, interface types, and
> codec_mem1 clock in DAI startup and shutdown.
> 
>> diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
>> index 2dc8c75c4bf08..d7f85a4f9d999 100644
>> --- a/sound/soc/qcom/lpass-cdc-dma.c
>> +++ b/sound/soc/qcom/lpass-cdc-dma.c
> 
> [ ... ]
> 
>> @@ -184,6 +211,11 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
>>   		clk_set_rate(drvdata->va_mem0, CODEC_MEM_HZ_NORMAL);
>>   		clk_prepare_enable(drvdata->va_mem0);
>>   		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
>> +		clk_set_rate(drvdata->codec_mem1, CODEC_MEM_HZ_NORMAL);
>> +		clk_prepare_enable(drvdata->codec_mem1);
>> +		break;
>>   	default:
>>   		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
>>   		break;
>> @@ -205,6 +237,10 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
>>   	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
>>   		clk_disable_unprepare(drvdata->va_mem0);
>>   		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
>> +		clk_disable_unprepare(drvdata->codec_mem1);
>> +		break;
>>   	default:
>>   		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
>>   		break;
> 
> [Severity: Medium]
> Should lpass_cdc_dma_daiops_startup() check and return errors from
> clk_set_rate() and clk_prepare_enable() on drvdata->codec_mem1?
> 
> If clk_prepare_enable() fails and startup returns 0, the substream opens
> with an unclocked LPM memory bank, and lpass_cdc_dma_daiops_shutdown() will
> later call clk_disable_unprepare(drvdata->codec_mem1) on close, either
> underflowing the clock refcounts or disabling the shared clock while
> another WSA stream is using it.
> 

Ultimately yes, but the actual code doesn't, so this will probably deserve a follow-up fix as it's not related to this serie.
