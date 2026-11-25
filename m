Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596283;
	b=G98MkquMseg6GQK+NSefH9eqxH3ykBEsIWT2hYEoqzCx5p3GMLOVbiCehczCtjhuIGLi
	 vIFgABXfaPlHdVHRjUhsLX6MkMbkHIu/jT8XJXOANPiAwzUVTZS+9dMY/AKtNo/yFvfIT
	 Ejdh9mVPpncOfp7gYrXvyz+tHFGYkbnND1u0aIzcg7oTHMiaw7MEvccVKAedGPls80zPJ
	 D6x7+gcBu3tHJ/0iFvvZrfGahRiunW0XpDRD8sQJpoosXWIUbqbQlpzhitY9zNI/kEv5W
	 4pnJAX0InXtR/aXAi9hrUQB2NWjD8t3fpz/nFh5u4F27TvHYfnsII3r1oUZLQi1yHPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MbRhh51PuVGNX5wjFYK/oLTg7cjuPf/owXDadBTQZjc=;
	b=lsVuRZaHDSo7coPVJvd5krH61uh1AJ8I6QGO2iZgfDyUtbTOG7/V46LbmJwjaOc2bJx+
	 7rpWQZMJw/ShGixoW8gZ/rzU2y6dZ+Dta/5izZ/vSGyxHTqpe8gU/uPMJHqvARQEJh+A3
	 GMazyoUMS6++QhfrRebjOtcZxv3YsUzk7f9kiBjtCKBjxdBC/vVUk4du8eEPDh5ElmJrs
	 tW/M+T98NSEZfyElGQx0igl/m/TqcrXIMydk8HL134k5r5A/8dLYTv0IFsxBTNyMdKpKU
	 MgNqjUDEVfyAqme50LJY0v1ohwCZDVOlh+E73JGpLwWytlntGgDX8Y2iqfTiJH2hs2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tQh2tB3u;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE75606A323
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 08:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE75606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tQh2tB3u
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so52828275e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 00:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795596281; x=1796201081; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MbRhh51PuVGNX5wjFYK/oLTg7cjuPf/owXDadBTQZjc=;
        b=tQh2tB3udVA5x1jP0d1D1qblwBbJzGeAcLNJToXrWRiK1vnTQSYNn9jUq6O3K6ilHG
         MhMd2jR8Aw3+FBogCWO5ETK5ISXw+JK7/2O26a3aC7F6cl4J34f6vUbmKA/AhF4eAJv6
         F1G9aYv74b7fdjolE5ZjUMMWHg9Px39AjvmchMOwMohEKi3fmkUCSlxltzD1ZReeZca9
         P/YhQIksZq8AsAtGt/Hb9D898q06hF1dls0vkucYK9EDe2eMeRqDpnWzyVaDG8kUm9zF
         6/d+Pc1qEZnN0oZsAc4NTY5ECp7Xc/xx8T0G6mwJMuD/YBcrvCmCimrr/mIDjTvVGyJz
         PATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596281; x=1796201081;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MbRhh51PuVGNX5wjFYK/oLTg7cjuPf/owXDadBTQZjc=;
        b=FywlCRICsvaT/nlBJ3otUp2r90wSEVaFrNcwykqbtsCneQdh3gGMVQu2LasuJ8DZeo
         zazVZG5Z5l2iK6rlenZouGyrgKrgo2mJoxYK0FG+7TqB1IdIjyCUihKGx+XyTjDYRarP
         5/y+E6FlM3pT4WpGwbfcHLTaRJdyL1IwBcXoVjOngK540PHuvOd6NTmvRt+4PX2Vaq69
         LSwmbDDDw6t7W3SxHAJZGi/6kh2Qr9deBUeQs0XSMjIME4svOivBhj+vsXYF1hKaxMH5
         SbYIDp+R2fYAj8W9gQpH1V1daNonsQcwOSI2nj6vb1oWGqfrBii27k3h/fKynCWk7U0b
         g5rw==
X-Gm-Message-State: APuU4Z+jkYqpJPXGYnOT3VdghP0i5fsASc680SObw3CwlIoIa++mm8l0
	lBO9A78jyU9gS+wB0eCdyHI/mFIQUZ4A9FmCvMfjkklGqoLP9Xlci5RiEOh9by+r3EVbvjydtrR
	UTavwa0ysXg==
X-Gm-Gg: AZFdTZdhcaddWPFAw8U2R3BfNQx/ZC/TojqPBcT9SGp6XjcotF5K78EmfhHTnWCI2T4
	PwfERRS2qw6hPeITuN22zjXfi/eNkOzVYya1RA7bmcqAJmBxtAdZhlBwqnlY8//lU5dbspfC7s4
	tnE48SehRczkvwnRFg+9HJlqJVc4vpOO3LXzTS5Ju7PVeDT6GS30ifWwr07FVDG9twcvYSARQDJ
	Ub20JmfCMP+cw0hY5TG3hYzy7jc+XsU7YTuh+PF5OsrfVv+S6qeWeogZk0qRJ+wjpKPvbhVcSsj
	vBAbB/CKXcf+7xRjsnc9tzLqY2S5x7vIi8XKMp5yadd/GXv9NOBXuGf9DQUmz3hjtBiNKBTSUle
	EP8vRuDJYFMCQDIin8nEkZDkrMBF3wTd1DhiFQgXEEA/9gUwjcnvFZQpAtO8XF+pqH+LeWicaNH
	jQXT50wTRV6p9bTJqO4wbpwrusqT6Zho64DR63nl7G7P3GE45jHzVX+lFi6DUs+fyNMAyCTykR/
	B57QPqsbpaEikWOv2hScc/Nz7p6ki9m0wPm8Kwftvv1uw2l3nyy8n6EhIj+te+K/HtUt+l/jI1u
	tTk8fSuhI3h30Lhuy71mIJeTdwhcSIfe0NDa37G6CJI+yvDI8OBfuTYpKt93dSRUV3vJ5blp8Ho
	aAB6dsd2RIw==
X-Received: by 2002:a05:600c:820d:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb887e21c6mr307761695e9.3.1795596280722;
        Wed, 25 Nov 2026 00:44:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm604901685e9.6.2026.11.25.00.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:44:40 -0800 (PST)
Message-ID: <c3b5f4ec-5535-4a55-9774-f166d2ea6e7a@linaro.org>
Date: Wed, 25 Nov 2026 09:44:39 +0100
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
Subject: Re: [PATCH v2 15/19] ASoC: qcom: lpass: allocate LPM buffer memory to
 DAIs
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-15-174e159f0f69@linaro.org>
 <sashiko-outbox-231761@kernel.org>
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
In-Reply-To: <sashiko-outbox-231761@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 19:01, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issues to consider:
> - [High] ASoC: qcom: lpass: unchecked memremap() and invalid free of LPM
>    MI2S buffer
> - [High] ASoC: qcom: lpass: VA and RXTX LPAIF resources not gated when
>    used for MI2S
> - [High] ASoC: qcom: lpass: unchecked memremap() and missing pcm_free
>    memunmap()
> - [Medium] ASoC: qcom: lpass: mi2s_lpm_enable set for disabled LPM
>    LPAIFs in probe
> - [Medium] ASoC: qcom: lpass: LPM buffer offset 0 collision in
>    lpass_platform_allocate_lpm()
> --
> 
> commit 4c2b83ff038eba299bfce68560d0b64cb7efc8a7
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: lpass: allocate LPM buffer memory to DAIs
> 
> This commit dynamically assigns LPM SRAM buffer offsets for Codec DMA and
> LPM-backed MI2S DAIs and preallocates LPM DMA buffers for MI2S ports that
> cannot access DDR.
> 
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index a83507c2cd557..8b005a87d4088 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -1169,6 +1169,8 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>>   			data->codec_dma_enable = 1;
>>   			if (is_wsa_cdc_dma_port(id))
>>   				data->wsa_enable = 1;
>> +			else if (!is_rxtx_cdc_dma_port(id))
>> +				data->va_enable = 1;
>>   		} else if (is_mi2s_port_id(id)) {
>>   			unsigned int port_id = mi2s_port_id(id);
> 
> [Severity: High]
> Should drvdata->va_enable (and an equivalent rxtx_enable flag) also gate
> claiming the VA and RXTX LPAIF MMIO and IRQ resources when Codec DMA is
> enabled?
> 
> When a board uses RXTX or WSA Codec DMA alongside an MI2S port on
> lpass-va-lpaif (with va_enable == 0), asoc_qcom_lpass_cpu_platform_probe()
> still unconditionally claims "lpass-va-lpaif" via
> devm_platform_ioremap_resource_byname() under if (drvdata->codec_dma_enable),
> causing lpass_cpu_init_lpaif() for that MI2S LPAIF to fail with -EBUSY
> (and asoc_qcom_lpass_platform_register() similarly requests
> "lpass-irq-vaif" unconditionally).  Conversely, without an rxtx_enable
> flag, enabling only VA or WSA Codec DMA unconditionally claims
> "lpass-rxtx-lpaif" and reserves 2 * LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE of
> rxtx_cdc_dma_lpm in lpass_platform_allocate_lpm().
> 

The registers are expected to be present ber bindings, so it's a possible
optimization to not claim the registers but not a bug.

> [ ... ]
> 
>> @@ -1380,6 +1366,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>>   						   variant->mi2s_desc[i].reg_name);
>>   			if (ret)
>>   				return ret;
>> +
>> +			if (variant->mi2s_desc[i].lpm_type != LPASS_LPM_NONE)
>> +				drvdata->mi2s_lpm_enable = true;
>>   		}
>>   	} else {
> 
> [Severity: Medium]
> Does this set drvdata->mi2s_lpm_enable even when the LPM-backed LPAIF has
> no ports enabled in DT?
> 
> When no port on variant->mi2s_desc[i] is set in drvdata->lpaif_port_enable,
> lpass_cpu_init_lpaif() returns 0 early with drvdata->lpaif[i].drvdata left
> NULL.  Checking variant->mi2s_desc[i].lpm_type without checking
> drvdata->lpaif[i].drvdata sets mi2s_lpm_enable to true on every variant
> whose static mi2s_desc table contains an LPM LPAIF, forcing probe to
> require the Codec DMA LPM clocks and LPM memory resources even when only
> core-LPAIF MI2S or HDMI/DP DAIs are used.

The mi2s_desc is suposed to be correct, and this doesn't cause any fatal
errors.

> 
>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>> index 16a964e1aec1f..855f1ee193946 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
> 
> [ ... ]
> 
>> @@ -1288,6 +1321,41 @@ static irqreturn_t lpass_platform_wsaif_irq(int irq, void *data)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> +static int lpass_platform_prealloc_lpm_mi2s_buffer(struct snd_soc_component *component,
>> +						    struct snd_pcm *pcm, int dai_id)
>> +{
>> +	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
>> +	unsigned int port_id = mi2s_port_id(dai_id);
>> +	struct snd_pcm_substream *substream;
>> +	struct snd_dma_buffer *buf;
>> +	u32 addr;
>> +	int dir;
>> +
>> +	if (drvdata->mi2s_lpm[port_id] == LPASS_VA_CDC_LPM)
>> +		addr = drvdata->va_cdc_dma_lpm_buf;
>> +	else
>> +		addr = drvdata->rxtx_cdc_dma_lpm_buf;
>> +	addr += drvdata->mi2s_lpm_offset[port_id];
>> +
>> +	/* Playback and capture buffers are allocated one after the other */
>> +	for (dir = SNDRV_PCM_STREAM_PLAYBACK; dir <= SNDRV_PCM_STREAM_CAPTURE; dir++) {
>> +		substream = pcm->streams[dir].substream;
>> +		if (!substream)
>> +			continue;
>> +
>> +		buf = &substream->dma_buffer;
>> +		buf->dev.dev = pcm->card->dev;
>> +		buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
>> +		buf->private_data = NULL;
>> +		buf->bytes = lpass_platform_lpm_mi2s_hardware.buffer_bytes_max;
>> +		buf->addr = addr + dir * LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
>> +		buf->area = (unsigned char * __force)memremap(buf->addr, buf->bytes,
>> +							      MEMREMAP_WC);
>> +	}
>> +
>> +	return 0;
>> +}
> 
> [Severity: High]
> What happens on PCM teardown or if memremap() returns NULL here?
> 
> Because buf->dev.type is set to SNDRV_DMA_TYPE_CONTINUOUS and
> lpass_component_driver has no .pcm_free callback to memunmap(buf->area) and
> clear buf->area, PCM teardown in snd_pcm_free() ->
> snd_pcm_lib_preallocate_free_for_all() -> do_free_pages() passes the
> memremap() I/O virtual address to snd_dma_continuous_free() ->
> free_pages_exact() and leaks the mapping.  In addition, if memremap()
> returns NULL, lpass_platform_prealloc_lpm_mi2s_buffer() still returns 0
> (leaking the playback mapping if capture fails), and a subsequent transfer
> in lpass_platform_copy() dereferences a NULL runtime->dma_area.

The code is copied from actual implementation, it deserves a proper fix in a separate
serie for the whole implementation.

> 
>> @@ -1412,6 +1482,7 @@ static int lpass_platform_copy(struct snd_soc_component *component,
>>   			       unsigned long pos, struct iov_iter *buf,
>>   			       unsigned long bytes)
>>   {
>> +	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
>>   	struct snd_pcm_runtime *rt = substream->runtime;
>>   	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
>>   	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
>> @@ -1422,7 +1493,7 @@ static int lpass_platform_copy(struct snd_soc_component *component,
>>   				channel * (rt->dma_bytes / rt->channels));
>>   
>>   	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> -		if (is_cdc_dma_port(dai_id)) {
>> +		if (is_cdc_dma_port(dai_id) || is_lpm_mi2s_port(drvdata, dai_id)) {
>>   			if (copy_from_iter_toio(dma_buf, bytes, buf) != bytes)
>>   				ret = -EFAULT;
>>   		} else {
>> @@ -1430,7 +1501,7 @@ static int lpass_platform_copy(struct snd_soc_component *component,
>>   				ret = -EFAULT;
>>   		}
>>   	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
>> -		if (is_cdc_dma_port(dai_id)) {
>> +		if (is_cdc_dma_port(dai_id) || is_lpm_mi2s_port(drvdata, dai_id)) {
>>   			if (copy_to_iter_fromio(dma_buf, bytes, buf) != bytes)
>>   				ret = -EFAULT;
>>   		} else {
> 
> [Severity: High]
> Should both lpass_platform_prealloc_lpm_mi2s_buffer() and
> lpass_platform_prealloc_cdc_dma_buffer() return -ENOMEM if memremap()
> fails, and should lpass_component_driver provide a .pcm_free callback to
> memunmap() and zero substream->dma_buffer.area so that lpass_platform_copy()
> cannot hit a NULL rt->dma_area and snd_pcm_free() does not call
> free_pages_exact() on the remapped LPM pointer?

The code is copied from actual implementation, it deserves a proper fix in a separate
serie for the whole implementation.

> 
>> @@ -1459,6 +1530,66 @@ static const struct snd_soc_component_driver lpass_component_driver = {
>>   
>>   };
>>   
>> +static int lpass_platform_allocate_lpm(struct lpass_data *drvdata)
>> +{
>> +	u32 rxtx_cdc_dma_lpm_remain = drvdata->rxtx_cdc_dma_lpm_size;
>> +	u32 va_cdc_dma_lpm_remain = drvdata->va_cdc_dma_lpm_size;
>> +	u32 rxtx_cdc_dma_lpm_offset = 0;
>> +	u32 va_cdc_dma_lpm_offset = 0;
>> +	int port_id;
>> +
>> +	if (drvdata->codec_dma_enable) {
>> +		drvdata->rxtx_lpm_offset = rxtx_cdc_dma_lpm_offset;
>> +		rxtx_cdc_dma_lpm_offset += LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
>> +		rxtx_cdc_dma_lpm_remain -= LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
>> +
>> +		if (drvdata->va_enable) {
>> +			drvdata->va_lpm_offset = va_cdc_dma_lpm_offset;
>> +			va_cdc_dma_lpm_offset += LPASS_VA_CDC_DMA_LPM_BUFF_SIZE;
>> +			va_cdc_dma_lpm_remain -= LPASS_VA_CDC_DMA_LPM_BUFF_SIZE;
>> +		}
>> +
>> +		if (drvdata->wsa_enable) {
>> +			drvdata->wsa_lpm_offset = rxtx_cdc_dma_lpm_offset;
>> +			rxtx_cdc_dma_lpm_offset += LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
>> +			rxtx_cdc_dma_lpm_remain -= LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
>> +		}
>> +	}
>> +
>> +	if (!drvdata->mi2s_lpm_enable)
>> +		return 0;
>> +
>> +	for (port_id = 0; port_id < LPASS_MAX_MI2S_PORTS; port_id++) {
>> +		if (!test_bit(port_id, &drvdata->lpaif_port_enable))
>> +			continue;
>> +
>> +		switch (drvdata->mi2s_lpm[port_id]) {
> 
> [Severity: Medium]
> Can an MI2S port on an enabled multi-port LPM LPAIF collide at LPM offset 0
> if that port has no child node in DT?
> 
> of_lpass_cpu_parse_dai_data() sets a default 8-channel SD-line mode for all
> MI2S ports and only sets drvdata->lpaif_port_enable for ports with an
> explicit child node, while asoc_qcom_lpass_cpu_platform_probe() populates
> drvdata->mi2s_lpaif[port_id] and drvdata->mi2s_lpm[port_id] for all MI2S
> DAIs and lpass_cpu_daiops_probe() only checks that the port's LPAIF was
> initialized:
> 
> sound/soc/qcom/lpass-cpu.c:lpass_cpu_daiops_probe() {
>      ...
> 	/* The LPAIF is only initialized if one of its ports is described in DT */
> 	if (!lpaif || !lpaif->drvdata) {
> 		dev_err(dai->dev, "LPAIF of this port is not enabled\n");
> 		return -ENODEV;
> 	}
>      ...
> }
> 
> If one port on a multi-port LPM LPAIF (such as lpass-aud-lpaif) is listed
> in DT and a sibling port on the same LPAIF relies on the default SD-line
> configuration without a child node, the sibling port still probes and
> is_lpm_mi2s_port() returns true, but lpass_platform_allocate_lpm() skips it
> and leaves drvdata->mi2s_lpm_offset[port_id] at 0, aliasing the buffer of
> whichever DAI was allocated at offset 0.
> 

This will never happen since to have the SD line configuration you need
to have an MI2S subnode, which will enable the LPAIF and the MI2S.
