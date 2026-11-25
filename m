Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596411;
	b=Yv0pJrnR6/i7Bw7PxnzIoMalAx0cJz/QXtwc8M2wT/zBD5/QX6zuSLlQhBtey8mCZI5/
	 J5NZP626mz2E6LjBcS5Vf8dUS77aFKbdILEUwysM8V7YTifBNI09NsrBsW47vdUidore8
	 t27fJxotWJ/8Fe6WMIN0lsL8+g34N+x9wEBjPeOFYGQr+lY9YDbrG147OgsSLRI2f5ssZ
	 VvNEJXCImj4ZzgwWENvDx2Isr0Qq6JK89Bmc0Ep2YvTTXLTCxV65dFjYjTDkcOIsMd86+
	 cSiAvpieYIhPmAioqMfqYfqjdBylBgAfbz/A+4ipJ8zDhj4RCbMPbHj0pEalHHCc1LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yxb7EQsbpqO3H4nS3rf4UMq78ALObXEsUz180cnLRB4=;
	b=nS4Wtx+4e4LHAL5oe/Rr6hNRtINrdbws/9w2o6ZuIVhUT9A+FA2UqXaOJc6snwWj0vUZ
	 hYZLupm+B66PHj85ARIIA1uMi5ieQ3OCTfwq1D6rZkVu+EREmnw3i63JYp9R82R7vXNKF
	 nHR3sryG4hh7UBIG9qxKyE8vRT4DV2Pb5GUCfjoFQx5KJQ8P+ha80v6yIbFpWUbPeH4L0
	 ddu6Cew/yPsGvHIpI6D07hlFM60EV8i0VsIbXVD+Ew5AobIbeB6wIykHiB4Pbgowxp4+Z
	 XPlqPhNxcl/BwENU3dfGgvtvEP40F1FgzuCeWxiBr61QqyCZVEKBCFIASzw8dWdXbIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QU3JZomh;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F838606A323
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 08:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F838606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QU3JZomh
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a358881793so2810260f8f.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 00:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795596409; x=1796201209; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxb7EQsbpqO3H4nS3rf4UMq78ALObXEsUz180cnLRB4=;
        b=QU3JZomhyUF1qSWJvujggq3SVX3rSji4ky5CchoSJ0N7cEUTaKojeJwCzFZgD30xoI
         lNQwGA1fO/Jd9L3MqDeO6J5omY8VBXma4CDZhbYi38Gnms5JSJfG7WLJnFyT8j89KUEn
         iR2N4GqC3+xvE1lUjDHBMkICWrNvV8o6Sga2jmE8Nc9T3RySIEZYWBRQyZ7m7fGXsbQM
         WIwbHVl7PQkgTPbWtcgV7vRQep2uqqW74PCtP1DYUScQw999WJHXrhGQqPRpXiD72YPh
         Om5TUfroWBPeLK5LX87S5eLFD8tmrlCdvQdvaeES3kXklvFHLblLziDdPYPQtATKh9QY
         7Hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596409; x=1796201209;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yxb7EQsbpqO3H4nS3rf4UMq78ALObXEsUz180cnLRB4=;
        b=gcbbNwRYpvOqQO7GbwaZ6lhEK5+OdMrlG8rk7q3MJ3vumiJ2rcFb90VsXO5z/467Xz
         tnpyLFtdE+aZTxgSbxkkAktjZ9XS11j+Hsi3xNpIDj1LSHEwJf07MScczjcpLc9O/8Sp
         Ce23/zwYAEXLm/OZr+mBlk9t6NnQI5W8kzFI1l8gU1Cp+AW5h094lw5n/ocS2udWY/up
         aHiyHJkGq3iFelTiVMFtiHIcNtRKti9JQ0v0lbhjudqs6yjOIildasbW/v2xPuXD3Mmv
         8DeZFsLGax9vRdgY+Q5WJl6cjBKply6n5ZfTorgvhBU+1Eo8ffxPCuOizJO/aSbMa+hB
         oiZA==
X-Gm-Message-State: APuU4Z/uwF8V2gSJASPs0/Rk2fu9D57AuEkw46CAw3shWf1UlLEEwUbv
	lFHArWDQJjR5WA8ImSxFzrhnu6TdVA6st06kTZ9OJVgTxJVLK17f7D3uLrpMjpyk3aqXp7JVQw4
	7puDilUTecw==
X-Gm-Gg: AZFdTZdgr40kdJhbDJAc0CBp2ZXEdP9SnOfM9B15vl+nCce1r980s95tXwbuijKvGVf
	OmjgVnXn84BGNaXIVh2mBQPtnmUzpOqYWeehdSLody54yhLEizUEdPEbLVOAWMFeZb2m4qkZ4gI
	NvicFvDqIbeHRN3aKj7kH6+/GytWPtI+GorlpkpApphbAg8iWLzXTAGwDktSvBVYHtfEyt9n3tD
	/VFGYk9EA4HSlZd4LB4dGpbplGRBU9PKHm6OAiyrSCcvUSxLnrNEs7hjn7DAq8EZklHHqEI2Gwn
	jY0j/2jrwRG2P1eJu5dp3n2AurPRLR2oC1iTf6uvinX9gxiyMHo8AQ9uyk5TOzVTHDDwhK8ySxX
	y53c31US+OcQiW2oCTOwxQq0ZtPuH6LrSj5Dg20X310lXahDEiqabFcQFjshlJR+my3bho87Y5k
	IIWtoWNYT/hf4v70N/Xut79q21ZTVe/XEvOFJoJ1TsiPMeZmpHPKdDvbCYG+H2TefPJS2ANZJcT
	nRxPIl8sLeBa8+AcMWwHztfWByus25DeEyeKGgMM6FzJJTtLZ66beOPv17bbQSmo7WmZ1rcadzT
	lwDLd5rhHwlpOx0A403P3cLpRE8ZoaPNlAYe+6VI38SFQ5dGS7nH4LXrTDbAyzTXssfgDC1smh+
	umor44QB8
X-Received: by 2002:a05:6000:2586:b0:4b7:760c:70db with SMTP id ffacd0b85a97d-4b7760c713cmr8367241f8f.4.1795596409091;
        Wed, 25 Nov 2026 00:46:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm12637052f8f.9.2026.11.25.00.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:46:48 -0800 (PST)
Message-ID: <59b8701a-22b5-42e9-b94a-4ed3af6f346f@linaro.org>
Date: Wed, 25 Nov 2026 09:46:48 +0100
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
Subject: Re: [PATCH v2 19/19] ASoC: qcom: sc8280xp: allow using the sc8280xp
 card with lpass-cpu
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-19-174e159f0f69@linaro.org>
 <sashiko-outbox-231759@kernel.org>
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
In-Reply-To: <sashiko-outbox-231759@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 18:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ASoC: qcom: sc8280xp: missing jack cleanup and link exit on
>    DSP Bypass links
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [High] ASoC: qcom: sc8280xp: missing WCD jack cleanup in
>    sc8280xp_snd_exit() [1]
> --
> 
> commit 30357a271c5bc6a19f163b41e5ab561af21084a8
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: sc8280xp: allow using the sc8280xp card with lpass-cpu
> 
> This commit adds init and ops callbacks for DSP Bypass DAI links in the
> sc8280xp machine driver and attaches the WCD jack to LPASS CPU TX codec DMA
> DAIs in qcom_snd_wcd_jack_setup().
> 
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index ac4dfb2c2182c..4fcccf7ec4965 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
> 
> [ ... ]
> 
>> @@ -377,6 +378,37 @@ static int nord_snd_init(struct snd_soc_pcm_runtime *rtd)
>>   	return 0;
>>   }
>>   
>> +static int sc8280xp_lpass_snd_init(struct snd_soc_pcm_runtime *rtd)
>> +{
>> +	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	struct snd_soc_card *card = rtd->card;
>> +
>> +	switch (cpu_dai->id) {
>> +	case LPASS_CDC_DMA_WSA_RX0:
>> +	case LPASS_CDC_DMA_WSA_RX1:
>> +		/*
>> +		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
>> +		 * to reduce the risk of speaker damage until we have active
>> +		 * speaker protection in place.
>> +		 */
>> +		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81);
>> +		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81);
>> +		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 17);
>> +		snd_soc_limit_volume(card, "SpkrRight PA Volume", 17);
>> +		break;
>> +	case LPASS_DP_RX:
>> +		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack[0], 0);
>> +	default:
>> +		break;
>> +	}
>> +
>> +	if (data->priv->wcd_jack)
>> +		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
>> +
>> +	return 0;
>> +}
> 
> [Severity: High]
> This problem wasn't introduced by this patch, but sc8280xp_snd_exit() skips
> headset jack cleanup for WCD jack configurations [1].
> 
> Both sc8280xp_snd_init() and sc8280xp_lpass_snd_init() initialize data->jack
> and set data->jack_setup = true for WCD jack configurations, whereas
> sc8280xp_snd_exit() only calls qcom_snd_headset_jack_cleanup() and clears
> data->jack_setup when dai_data->jack_setup is SC8280XP_JACK_SETUP_CODEC:
> 
> sound/soc/qcom/sc8280xp.c:sc8280xp_snd_exit() {
> 	...
> 	dai_data = sc8280xp_get_dai_data(data->priv, cpu_dai->id);
> 	if (dai_data && dai_data->jack_setup == SC8280XP_JACK_SETUP_CODEC) {
> 		qcom_snd_headset_jack_cleanup(rtd);
> 		data->jack_setup = false;
> 	}
> }
> 
> When a card with a WCD jack unbinds, snd_card_free() frees data->jack.jack
> while codec components retain &data->jack and data->jack_setup remains true.
> On rebind, qcom_snd_headset_jack_init() skips creating a new jack and
> re-registers the dangling data->jack with the codec components, causing a
> use-after-free on the next headset jack event.

This will deserve a fix in a separate serie.

> 
> [ ... ]
> 
>> @@ -549,6 +633,10 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>>   			link->exit = sc8280xp_snd_exit;
>>   			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
>>   			link->ops = &sc8280xp_be_ops;
>> +		} else if (!link->dynamic) {
>> +			/* DSP Bypass link, neither a DPCM frontend nor a backend */
>> +			link->init = sc8280xp_lpass_snd_init;
>> +			link->ops = &sc8280xp_lpass_ops;
>>   		}
>>   	}
>>   }
> 
> [Severity: Medium]
> Should DSP Bypass links also wire a link->exit callback to call
> qcom_snd_headset_jack_cleanup() and reset data->jack_setup = false?
> 
> Without an exit callback to pair with sc8280xp_lpass_snd_init(), unbinding and
> rebinding a component on a DSP Bypass card with data->priv->wcd_jack set leaves
> data->jack_setup true after snd_card_free() frees data->jack.jack, leading to
> a use-after-free in snd_soc_jack_report() when a jack event is reported.

The current code doesn't clean the jack on exit, this should be fixed globally
in a separate serie.

> 
> [1] https://sashiko.dev/#/bug/linux-70cecd60-74fd-40f1-95c8-8dc260e646ac
> 

