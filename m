Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B2741F34B
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232017; cv=none; b=K4EqwtSQAskld46kVoMdACkhs3vuOGiC3JuNNyEb7p0IKqnmUUQOG7JMpeLpGWTVMT5+zcaRf/iCOHnnLs1CajY8oz1up51Xq1zS/ZT2zTCz/6I6mahAr4ufd6k54+UVxaTl+jdqeqfSIX2XwWAs8hn2iADuPrpnILzHetUxWOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232017; c=relaxed/simple;
	bh=kwcjZyJIeB0p6AfBxqzzsJchLPKNWiD9kFR1gcEueoM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=n1wgZ36wXgz6UKFKkGwEvqLUjVdp0s/+F1sUr0XpknwhkieIRy4MCofBXbc2ZbgPoG6ZzjmqUwterzwaQcPRxAOEwBMYCPKUGiQf+4N384GRDQMhtp2fJ8n9SHnXdiLaFiaDV+ZwvPonqWh46nEG6Buh72uIq7F2NbT5Xou2S+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y7P+In2q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y7P+In2q"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495635a85d2so29968625e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 02:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785232013; x=1785836813; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKpYcUd0bLsWfXRy27XLggsB62Hy65MOJiITGQfMwYQ=;
        b=Y7P+In2q260l7bG/DTlSU0nEn5s0aQzmCncWAj7ETNzJ7XL3WSH/Xpx4ETkII0jqxc
         SEQEvu1i3BhmZSCvijVdw2B3n40c7HNxLcRRSYg/t4VX2n+U0jo3/0HP6qMDAqb4A4oC
         ODKXzW+0qa30DVXBPV8Eh2cUkBYHt1jta5Vt/pEakjb6V+DUyLl7Ial7AMhj8D1XhRH7
         3rpIH+4dRlBut5DkBWCERsaChWVbjil4iq7N1Faey25vfwCC+i/L9r8T2P8iqlZXw5XI
         xzBHZw+X3YL8TUCEFiNHzdC81o7sm7K2ueoDi7ZRrxfm4xOErvsKdTpbVm7tmUkbNN4r
         lL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232013; x=1785836813;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKpYcUd0bLsWfXRy27XLggsB62Hy65MOJiITGQfMwYQ=;
        b=B89/bpvNYkC59I5jVJyXtOvOIsQu2+qnk2fgpayb8VGGikOCpGqt69xyoBAm3RV5US
         on6l2wcjr35V3XjmbG1e+3KjOC3lncXmNICwA2enMftsr0dqTikrlDp3wdwUK2pR19m5
         /tWkvDaRSh8WCKln9qfskgJsVIyn//P+XJZjm9Z5zzXnPmMBOq7Z+SzF04SH8WRB0kal
         lD0UIGsM7dFz0vtO5LsXewinTmLap8vXRQDHtTYLxTG9PZpaXrunorYsC0amuUiYZ4A3
         E/bbBhUPCYA4hQa/uEZLzz8qR3+cIA15tpQ2qZyOjPXfNe+QysjRY+X+drPlOsKPtXuk
         mCYQ==
X-Gm-Message-State: AOJu0Yxp2WbSPM7j9DVMwlw+IKIBJWcgiTZ7ztEjbzjOfN3C7RUgHhsv
	YQk06pldzZ3s4DQWg6ldqcnxxdDDQ3pzdyh9Qjdv6KfWi0NKMQR2hIsPhhnVBGYDAmnkDSsOGM+
	6tULJ
X-Gm-Gg: AR+sD13hKynl7er2ppLDMOj5Z26QApmyBSpxg5Wb8w53b2Fu8zUidaY4pmkhrazDFq8
	PhWk/HjdOGnxqLMl6P3zOSdKDDGSlfg8Q27Kpsx1XPO3qYdRzn+UTfjnW4H1QTZgl6bwage4+B6
	fSKZq8mMuPJGCqdcsAHef7o0kn1/Ba9yZDOJDENkVgBq4AA5tHSWEmb4tnvccxVhJDrcIFtFQNP
	TqsCS1J44D726dQ7dvV6ZoMREMOupR3uOG0N56fac3fdOiHJwYbyVZtwQy5X4GO8rqIO0cmNR7/
	IyqJTredJ+NrGVlKgE+60oC35Cl9yHH1pbN3OURhFRMpyRqICGz6xCOMaC4cfuzROnqYCdzDCFn
	EGmG3ELBE5Fenn/Lcec90IimUZHuvkxJ4ihW18Qd6ReyQ3Zee33gsq93iiOBNxHkP6tGQJGp6hC
	L29rDkDBh/ON9uWd+aBSEwIIMu1G/Qf6FFyaKRAsezI1uvhYCHLIKrxEne7w==
X-Received: by 2002:a05:600c:19ca:b0:495:67b8:d97e with SMTP id 5b1f17b1804b1-496c6575b9fmr16541375e9.30.1785232013466;
        Tue, 28 Jul 2026 02:46:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211? ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfd1a60sm291066435e9.2.2026.07.28.02.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:46:53 -0700 (PDT)
Message-ID: <94110280-c818-4bce-9856-f1e7ec8da055@linaro.org>
Date: Tue, 28 Jul 2026 11:46:52 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/3] ASoC: qcom: audioreach: compute active channel
 maps from channel_map
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-0-b29f44720178@linaro.org>
 <20260728-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v3-1-b29f44720178@linaro.org>
 <20260728090325.518421F000E9@smtp.kernel.org>
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
In-Reply-To: <20260728090325.518421F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/26 11:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] The new `active_channels_mask` computation in `audioreach_codec_dma_set_media_format` introduces regressions by unconditionally iterating over all `AR_PCM_MAX_NUM_CHANNEL` elements.
> 
> Pre-existing issues:
> - [High] Kernel stack memory is leaked to the DSP and evaluated in control logic because `cfg.channel_map` is not zero-initialized.
> --
> 
> --- Patch [1]: [PATCH v3 1/3] ASoC: qcom: audioreach: compute active channel maps from channel_map ---
> commit 893598480a0705f69c55eefe5bf4e2b969edc6d8
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> Subject: ASoC: qcom: audioreach: compute active channel maps from channel_map
> 
> This patch updates the Audioreach DSP code to compute the active channel
> mask and logical channel mappings using the physical channel mapping array
> (channel_map) rather than a simple bitmask derived from the channel count.
> This enables WSA2 speaker usage on specific hardware by correctly setting
> only the upper bits of the channel mask.
> 
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
>> index e6e9eb2e85aa1..0cc840aca69dd 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>> @@ -741,7 +742,12 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
>>   
>>   	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
>>   	intf_cfg->cfg.intf_index = module->hw_interface_idx;
>> -	intf_cfg->cfg.active_channels_mask = (1 << cfg->num_channels) - 1;
>> +	intf_cfg->cfg.active_channels_mask = 0;
>> +	/* Convert the physical channel mapping into a bit field */
>> +	for (i = 0; i < AR_PCM_MAX_NUM_CHANNEL; i++)
>> +		if (cfg->channel_map[i])
>> +			intf_cfg->cfg.active_channels_mask |= BIT(i);
>> +
> 
> [Severity: High]
> If a stream is configured with 4 channels and later reconfigured to 2
> channels, audioreach_set_default_channel_mapping() in q6dma_hw_params() only
> overwrites the first 2 entries, leaving the remaining entries intact.

This is a valid issue, will fix.

> 
> Since this loop iterates unconditionally up to AR_PCM_MAX_NUM_CHANNEL, could
> it pick up those stale entries and activate unintended channels in the DSP?
> 
> Additionally, for channel counts greater than 4 (like 6 or 8),
> audioreach_set_default_channel_mapping() can leave the map as all zeros. Could
> this result in an active_channels_mask of 0 and break the DMA configuration?

Yes, the old shift should be kept if the result mask is 0

> 
> [Severity: High]
> This is a pre-existing issue, but struct audioreach_module_config cfg is
> allocated on the stack in q6apm_dai_prepare() without being initialized:
> 
> q6apm_dai_prepare() {
>      ...
>      struct audioreach_module_config cfg;
>      ...
> }
> 
> When an unsupported channel count is used,
> audioreach_set_default_channel_mapping() leaves the array untouched,
> containing stack garbage.
> 
> While the previous code copied this memory blindly, the new loop here branches
> on this uninitialized stack memory to construct the channel mask. Could this
> result in unpredictable DSP configurations and leak stack contents in the IPC
> payload?

Yep the mapping array should be set to 0 in audioreach_set_default_channel_mapping() whatever the channel count

> 
>>   	p += ic_sz;
>>   
>>   	pm_cfg = p;
> 
> [ ... ]
> 
>> @@ -1113,7 +1124,12 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>>   	media_cfg->num_channels = mcfg->num_channels;
>>   	media_cfg->q_factor = mcfg->bit_width - 1;
>>   	media_cfg->bits_per_sample = mcfg->bit_width;
>> -	memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
>> +	/* Convert the physical mapping to a logical mapping of the channels */
>> +	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg->num_channels; i++) {
>> +		if (!mcfg->channel_map[i])
>> +			continue;
>> +		media_cfg->channel_mapping[j++] = mcfg->channel_map[i];
>> +	}
> 
> [Severity: High]
> This is a pre-existing issue, but similar to the above concern, could this
> loop branch on uninitialized stack memory if mcfg->channel_map was left
> uninitialized in q6apm_dai_prepare()?
> 
> This would cause the code to evaluate stack garbage in its control flow and
> copy it into the DSP IPC payload.
> 
>>   
>>   	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>>   }
> 

