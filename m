Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815963;
	b=CrowE7rRWfHd/uUvciNvkw/+eh63JxUdRzFForT9bn0ezxRw5LxUbp8lJcdgBW7pQfLl
	 SOH/USEIBlcvDe2Xl9KLbPOaoo+3LrvoVqJTEctLsvjcJg02uy3G29wPNCirljnsJG8aT
	 f6BJ/2MVjb6OcuChHO2o9fmxGTkUnHWEir8LeGkFmhQe7/07/svgNoSxfUPKUgBFezwyx
	 QHOk2ck6MU73hSug+CZ2rD1iwL/aidBMVHhwYuctJ8uUi+noaS7z2Tl5p6aqNQJkDw85x
	 PwsZCIpsrq/UF0pFdgmTmBMsorPQUB10GOm/dPVKmCAmpY0GLCZmpk1GDBuZDFq8l3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EjvetyvqxLjaeSw2J4Je0FZ24N4W0eHwPcS5UoEpsG0=;
	b=WErI3hvzFXbh29jH/6yn0jTf3YXvMAov7VIWnvvoa0sE9h2PFmgrFU3HYFrMLp1WDEGp
	 zOWVGu8tkQ4Lyw42y/LtrMn84DQwQyMTWtyhvkugvoXFRh9WqrEFt+53/Nt7WU4/5r1F8
	 ImDaumc7cN+FjAeQ+Km3P7VT31lPzlKNOLdU7BMHrRnWXvCPGpTI70fkWIRd77byZxDtI
	 PsrZEFAtRyRzWKy5eQlDotNpLFsaerf4fHjiuIjUU/gg1IpiMP9xpWIkz2pX6yZoULDH+
	 0UY+OK60fy8CczJbHZqcTTQURX0Z8eb2kELT5ntfwG459hL5K1Pr8Dl9Lfr6nmmolZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GVoeGIze;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6729606A32C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 07:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6729606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GVoeGIze
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2204168f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 23:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815961; x=1795420761; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjvetyvqxLjaeSw2J4Je0FZ24N4W0eHwPcS5UoEpsG0=;
        b=GVoeGIzeCU41d1QkWi70rSc6M/Yzr7zfkj0bam5mhcXwVT30eJviHXFuICXS81Q7Ad
         lFrocm0N4NINVfTCsPAHA0/bQdDLDDy8kGnIjLBFFLIrVkr9mogciqc5yt8dhLrbBPEv
         Bp/yn42JGEd04SBtB0hfeOKBl26D2rw9NH4qefnBFItIKWG7tI8dvg3OHfVIU6ZIv61/
         5N8bgbGW6oNkA7tuGECZgQSe8+Pp3eg0HYzmU3cgcOuBbaXytmMwN9VeC2pgN5Tg9obX
         tj7/U/eh87IXT0GSu2DB083KGJntW+APeFYNl5sFdBd9bN3E6vjCwFd0MGDWXYcjloPB
         xU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815961; x=1795420761;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjvetyvqxLjaeSw2J4Je0FZ24N4W0eHwPcS5UoEpsG0=;
        b=hZmlKsvaECgIvaDCoG7bGqC3KU728uNfAjBvMJ99p/dxDVponkh134hRD8YPFP94+H
         4SEWfwJAuzr8F0sHFH8MpDF/TbMkW9Pi4WfXM5dXRNOBfHi/Cuu/uB2hsaaQmgz+twuh
         wBI9mA4Y1cMoL07SZCFEcZ+BFa/hyr8G78S4GJ1tnNCbJsC+qLxaD3FLNPIz3JK4DBx/
         TiKzzJWpnw8YyAznvpxO/76r5/MYQ3MfSAFW9/ea3RLXtMdo7VRQcmiu1n8Tb9+98Mwh
         NJ6kj75mU2vF6QyKOrQQcD2iynmzUVnPj4J/TaJoHMS1Vko1OMb1Xf2nIGYMxYXdOrAt
         gmEg==
X-Gm-Message-State: APuU4Z/9GjGsopoV3vQKYoNCcwcL7TyOoQY8JCoYMZVTpq1WrVej+UKK
	7qKl5vtoMgDia4kQYzg1s5T8ncVFnhxxFqw4q9WA6sdp1H58jTdvb4qpRGJ+vCf1quHwTWZTa4q
	gwtlmEzA=
X-Gm-Gg: AYBFou302hzWE8GqvEkWuubOKJ0IO2ipXWvZ+eBBK2Ld9CKnvqUSKLlyU0Q6iGa9KMR
	JxEMq08x/AX7kOxbHei99LTp7fZ2MjdPyckLwxnIVu/ih84YPsLYbFoNV6EGLbLAX4iVzg1O4Tr
	N2y4qqrngpal61VLxQMJ87DRPwK5DW3jOIPW+n3TZXzGl0ElwdZyqCrQ7FQw8vmXCr+gMyXZ/au
	PiC72CnBhXHG5M8sV9AJFhXRDAoQJ10LMrzyMWYgdQXgWPdZID2aOwHe5c3Xu82TQlrlSSBeS6a
	3TodtdjBvz6kR76d6EWH2Ns72dK1W2DUm9r77C/Q0YvMKaY7bq4wXbDBCF99FgzByGgR7n31kOg
	lR2pKSsHcjsZ7ebZC8SOxeiz5QNi30EVco/l+QJBylWvzTfrc/nVPTkMS4ULxCj7/a9rjTdqy+e
	kProNiTURXlDwxqfMSPD9ebGgMkL45ATndphcASOn3UZK3W3v0p/CUGdWtCsHuIXSgXZZZorGHB
	8Rl1w4BY5PYn8ir0FXmnPoFx0UOzBDcfP9C8PU6LUmbhHWUPJeBPPjVhqqRc6v1rhGQ2i2dsH/G
	zYNpDA+1GqQBvdv4Pp6p2NBz62qRbNsW90sC53Y+R9YJMvqU2DzOgT6Yw9GQtFEbtP/vm6dk009
	m806H8NiW
X-Received: by 2002:a05:6000:992:b0:48d:c29e:40c3 with SMTP id ffacd0b85a97d-49c71e3db14mr19030193f8f.33.1794815960914;
        Sun, 15 Nov 2026 23:59:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c602dsm20167439f8f.46.2026.11.15.23.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:59:20 -0800 (PST)
Message-ID: <23f7de38-a5be-4de4-b026-e97deab9535c@linaro.org>
Date: Mon, 16 Nov 2026 08:59:19 +0100
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
Subject: Re: [PATCH RFC 17/23] ASoC: qcom: add SM8650 LPASS CPU driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-17-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213544@kernel.org>
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
In-Reply-To: <sashiko-outbox-213544@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] ASoC: qcom: wrong lpm_type for lpass-rxtx-lpaif in
>    sm8650_lpaif_mi2s_desc[]
> - [Medium] ASoC: qcom: missing set_bit() for RX channels in
>    sm8650_lpass_alloc_dma_channel()
> --
> 
> commit ee9ae911e7b58d190ad971326ccfe23116c1a06b
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: add SM8650 LPASS CPU driver
> 
> This commit adds the SM8650 LPASS CPU DAI driver variant supporting MI2S,
> DisplayPort, and codec DMA audio interfaces when driven directly by the
> application processor.
> 
>> diff --git a/sound/soc/qcom/lpass-sm8650.c b/sound/soc/qcom/lpass-sm8650.c
>> new file mode 100644
>> index 0000000000000..42050f56a4847
>> --- /dev/null
>> +++ b/sound/soc/qcom/lpass-sm8650.c
>> @@ -0,0 +1,651 @@
> 
> [ ... ]
> 
>> +static int sm8650_lpass_alloc_dma_channel(struct lpass_data *drvdata,
>> +					  int direction, unsigned int dai_id)
>> +{
> 
> [ ... ]
> 
>> +	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +		chan = find_first_zero_bit(&drvdata->rxtx_dma_ch_bit_map,
>> +					   v->rxtx_rdma_channels);
>> +		if (chan >= v->rxtx_rdma_channels)
>> +			return -EBUSY;
>> +		break;
>> +	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +		chan = find_next_zero_bit(&drvdata->rxtx_dma_ch_bit_map,
>> +					  v->rxtx_wrdma_channel_start +
>> +					  v->rxtx_wrdma_channels,
>> +					  v->rxtx_wrdma_channel_start);
>> +		if (chan >= v->rxtx_wrdma_channel_start + v->rxtx_wrdma_channels)
>> +			return -EBUSY;
>> +		set_bit(chan, &drvdata->rxtx_dma_ch_bit_map);
>> +		break;
>> +	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +		chan = find_next_zero_bit(&drvdata->va_dma_ch_bit_map,
>> +					  v->va_wrdma_channel_start +
>> +					  v->va_wrdma_channels,
>> +					  v->va_wrdma_channel_start);
>> +		if (chan >= v->va_wrdma_channel_start + v->va_wrdma_channels)
>> +			return -EBUSY;
>> +		set_bit(chan, &drvdata->va_dma_ch_bit_map);
>> +		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +		chan = find_first_zero_bit(&drvdata->wsa_dma_ch_bit_map,
>> +					   v->wsa_rdma_channels);
>> +		if (chan >= v->wsa_rdma_channels)
>> +			return -EBUSY;
>> +		break;
> 
> [Severity: Medium]
> Should the LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9 and
> LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9 cases call set_bit() on
> drvdata->rxtx_dma_ch_bit_map and drvdata->wsa_dma_ch_bit_map before
> breaking?
> 
> Without set_bit(), channel 0 is never marked as allocated (even though
> sm8650_lpass_free_dma_channel() clears the bit on close), so subsequent
> allocations from those bitmaps will hand out channel 0 again and overwrite
> drvdata->rxtx_substream[0] or drvdata->wsa_substream[0] in
> lpass_platform_pcmops_open().


Good catch, will fix

> 
> [ ... ]
> 
>> +/* MI2S mapping over LPAIF instances */
>> +static const struct lpaif_mi2s_desc sm8650_lpaif_mi2s_desc[] = {
>> +	{
>> +		.reg_name = "lpass-lpaif",
>> +		.irq_name = "lpass-irq-lpaif",
>> +		.lpm_type = LPASS_LPM_NONE,
>> +		.port_desc = (const struct mi2s_port_desc[]) {
>> +			{ .intf = 0, .id = MI2S_PRIMARY, },
>> +			{ .intf = 1, .id = MI2S_SECONDARY, },
>> +		},
>> +		.port_desc_count = 2,
>> +	},
>> +	{
>> +		.reg_name = "lpass-rxtx-lpaif",
>> +		.irq_name = "lpass-irq-rxtxif",
>> +		.lpm_type = LPASS_VA_CDC_LPM,
>> +		.port_desc = (const struct mi2s_port_desc[]) {
>> +			{ .intf = 0, .id = MI2S_QUATERNARY, },
>> +		},
>> +		.port_desc_count = 1,
>> +	},
> 
> [Severity: High]
> Should the lpass-rxtx-lpaif descriptor use LPASS_RXTX_CDC_LPM instead of
> LPASS_VA_CDC_LPM?
> 
> lpass-rxtx-lpaif is in the Audio CC / RXTX domain (clocked by
> audio_cc_ext_if1_ibit), so setting LPASS_VA_CDC_LPM maps MI2S_QUATERNARY
> DMA buffers from the 12 KiB VA LPM region (va_cdc_dma_lpm_buf) and enables
> va_mem0 in lpass_cpu_daiops_startup() instead of using the 64 KiB RXTX LPM
> region and audio_cc_codec_mem0..3.  If MI2S_QUATERNARY is enabled
> alongside LPASS_CDC_DMA_VA_TX0, lpass_platform_allocate_lpm() also fails
> probe with -EINVAL because VA Codec DMA already consumes all 12 KiB of VA
> LPM, and if MI2S_QUATERNARY is enabled alongside MI2S_QUINARY without VA
> Codec DMA, va_cdc_dma_lpm_remain underflows and assigns an offset past the
> end of the 12 KiB VA LPM buffer.
> 

Good catch, will fix
