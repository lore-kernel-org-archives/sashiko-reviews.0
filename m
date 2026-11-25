Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596324;
	b=w9VM4Vqx+/fhIa6cS7kIKMCbHxtO2EhHug2eV1i2WkBdfIjFSqTCXCItHwGyeoiDIGjJ
	 jrO+QQsBMMsPl6CvXFwid0f/6T964KGjtxGI9ywjW5F2ZdGmyXQih4cIrA6L0V3PpLA9x
	 xK/li9yxZDz8R9bosx1/5SXVMillStsEcsoKuSDzXWVogx9e21FGcQ5P74X3zCSjLTvo1
	 lWPQjbih4J1IVZQuwB5+mnsck/SZsbvIXVVdjffUg5QLVmKgOS5xm3E/kYW2DzaNqukXZ
	 HF+KIlAXBiQgmulp2kN7Xy8zd22byDBkRhKRmIgpof86I9eFsiFApNTRuP7hUZvFQNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8hnA+onLUda1A0zp7SeLbz5gSaOIOH6AU5jguSzKjPk=;
	b=CCZBBV6bffy6tSWHx/uvfCVpxwOcw74GCoDJSytzJttIhvKEakWgKHdkgDUbM04k7KrE
	 dztaj/LDXZUOiS8OC8F6VMC+pqpNeu9Z4IjatWhkJRhB1GvdKTbGI5r7NasJm4unT0gl5
	 U5hXJz5x99T/Ysw2sIDTm8jGa7jFlSeL2VC9Nukh29fJZ+Lcgv1Cujp8Nuc0eAQ/vGUfJ
	 5XJOzG49mRaCAZtT13MxsUmoeeP28vm73er4s3hCCKpOhLzgNEG3OSUJosAuxKHKHkljb
	 ZWazyCIN7CdSzN3QTwjB9xKeNRTZLMoVHpyq4dQOFJlUvJsT0SqwUG7FixSsbb7g72g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n+RDgTWf;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900D7606A323
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 08:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 900D7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n+RDgTWf
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so47029745e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 00:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795596323; x=1796201123; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hnA+onLUda1A0zp7SeLbz5gSaOIOH6AU5jguSzKjPk=;
        b=n+RDgTWfgn7Nmm67nZvVdNWQ+/xIwF1Weo/JRbNlA/P7tco3y5W6Y7MqEuS7zKZQto
         vESvW8VwrW7NJywUNKfYLTud47id8QfS1ZszpdXYofojpXT2kTbIqgYXmDolGl+MFwy5
         hhzk4bGZfZakQOys3rIcMjq+vK3i18h2G3Lw8E/5fTm2Vkt0pwqRW2Yu+1E7TQdvaep1
         7vqQgiQRJ49E3XlJFZV6c+WHx8AXWmfTxpiq6rRpKi7ae/HhpHLa2Bl87Je9y7yJne8y
         6MB4ZNCBSjv/mEIkOAvT/EJRjRLW0E+g6J/VPEcmgIeO3GBReb69T/kNcKSyDBkQUMLx
         PPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596323; x=1796201123;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8hnA+onLUda1A0zp7SeLbz5gSaOIOH6AU5jguSzKjPk=;
        b=H89qT8Adimbh4CsKwdgc7XAGNYHMn7WzoZJuChfKsBU7sfgsozM9W2jRV/cDB4QId2
         54qUK9qU483UXZSW3SpFSj6IvFTluL60dv1OqFKUbpbeI6SZiyfRkIK90SqNp8Z67n1Z
         SHrRIBGxqHXuN3qkPHRtWlpGONGEC6mMO7vV9X3xZIu/Gb6AMueG/Pe+6B1g8zq2cukk
         kY2Zho+U4+OMNI5+8E214PFVHeJxXB/aNBu3xjAxxYUTlxsmUVK51/LVEDYYkZwgCy2h
         GJWR13UPsJzzrYUHp8uO6Yv5HxQgJy6ZZIOq6HmP/3WUrwtLAwb+kzw6/1JB3RZnqlVr
         LUEg==
X-Gm-Message-State: APuU4Z+xHvxt07et6H0qVnaiV4+4CYVSZpDXjGmfwZuEIkMdqgb1iHxb
	PbRhaXp+isC1RHg5aemKgpmlQWUL8FDi3wN91segNrCIw0G/A3Grh2W85myr2AwU6uRxSMFUeXo
	DXm1vqJqxyA==
X-Gm-Gg: AZFdTZfQsr0coqgHDBcm1J8gV/NzUGgS832Je8o69yugMO+lSdA0YvXCha3TaWqjrLt
	FzAoADqyYxg3hDLNxZ4mgg1FUrqPsPe0c0t6g0xPSrQWSrWPjDQU9ymDPBd4B5aS/iYPgmz2azr
	mDXAgVe9mdu4SgPWCQdg8wrAtUdnVYbsNaQwvjnAtQYF2U/ucRaVl8LlThj4krSgqAJpGrCGUZU
	S5pKUcaEdu1QlV2yE61XCEOgUdC2AXvWmCduWBhoNMpuH/tgxeYKhqDWeJRsUgv5/HErgu9Vjwb
	Bc2mt47LUMT996bZnncEJME9mK7euJlVy+2HwkLC6KnUA1g+DNgOd6FnvyWxHgoUgPz+WWMOAa8
	eb84L8K7YLlEh/0c4XA2L0UbmBJWtsFp6eOQYrDsOY3oVE2VC/R6v4jrRB1ccBGjbqZR78QFQyf
	6VW3USlP2KA8U0j66stM7laedlcphc5HX9f51SJFwfQgRULa0+G6aJXB3zBGpQuWRIvAm/tZrK7
	2fVS0kiIzJFHUWBF5X01e8Yy9iFV57GDMEQQudDVdoTq2N45ktUFmseFksmnRLqPySPW4U88tEp
	PcuIlwx23EFnrhGue2TNTuTbywocXWJDmiNi6Cw8i45dx+pzk/4JMWskIxt5++R5SO6001TyNYn
	xQWM/74jy
X-Received: by 2002:a05:600c:3b1d:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb8881a890mr351422185e9.22.1795596322739;
        Wed, 25 Nov 2026 00:45:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680355sm27677872f8f.27.2026.11.25.00.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:45:22 -0800 (PST)
Message-ID: <5d181d25-53ac-479b-8966-82096c53cb5f@linaro.org>
Date: Wed, 25 Nov 2026 09:45:21 +0100
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
Subject: Re: [PATCH v2 18/19] ASoC: qcom: sdw: allow LPASS_CDC_DMA_WSA_RX0 as
 soundwire dai
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-18-174e159f0f69@linaro.org>
 <sashiko-outbox-231744@kernel.org>
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
In-Reply-To: <sashiko-outbox-231744@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 18:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] ASoC: qcom: use-after-free in qcom_snd_sdw_startup() [1]
> --
> 
> commit 7f273de8112390d0dc0ac3f44c88e5ff3276352c
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: sdw: allow LPASS_CDC_DMA_WSA_RX0 as soundwire dai
> 
> This commit allows LPASS_CDC_DMA_WSA_RX0 to be initialized as a SoundWire
> DAI and restricts LPASS CPU DAI ID matching to DSP bypass links so that
> overlapping DSP DAI IDs are not matched.
> 
>> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
>> index 6576b47a4c8c3..669fb63207c91 100644
>> --- a/sound/soc/qcom/sdw.c
>> +++ b/sound/soc/qcom/sdw.c
> [ ... ]
>> @@ -71,7 +74,7 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
>>   	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
>>   	int ret, i, j;
>>   
>> -	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
>> +	if (!qcom_snd_is_sdw_dai(rtd))
>>   		return 0;
>>   
>>   	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
> 
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can [1]
> qcom_snd_sdw_startup() leave dangling sruntime pointers in already
> configured codec DAIs on error?
> 
> The loop below calls snd_soc_dai_set_stream() on each codec_dai, and if
> snd_soc_dai_get_channel_map(), a later codec_dai, or
> snd_soc_dai_set_channel_map() fails, the err_set_stream path releases
> sruntime without clearing the stream pointers on the codecs that were
> already set up:
> 
> sound/soc/qcom/sdw.c:qcom_snd_sdw_startup() {
> 	...
> 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> 		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
> 					     substream->stream);
> 		if (ret < 0 && ret != -ENOTSUPP) {
> 			...
> 			goto err_set_stream;
> 		} else if (ret == -ENOTSUPP) {
> 			continue;
> 		}
> 
> 		ret = snd_soc_dai_get_channel_map(codec_dai, &tx_ch_cnt, tx_ch,
> 						  &rx_ch_cnt, rx_ch);
> 		if (ret != 0 && ret != -ENOTSUPP) {
> 			...
> 			goto err_set_stream;
> 		}
> 		...
> 	}
> 	...
> err_set_stream:
> 	sdw_release_stream(sruntime);
> 
> 	return ret;
> }
> 
> Subsequent stream accesses or teardown on those codecs will then trigger a
> use-after-free on the freed sruntime.

It's not related to this serie, it deserves a separate fix.

> 
> [1] https://sashiko.dev/#/bug/linux-3eb5665f-b54d-4f37-aa26-a95e56e5e77e
> 

