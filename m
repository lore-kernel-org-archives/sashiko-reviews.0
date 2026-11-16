Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815362;
	b=lAOTjg67rV3T/pQs1mHCwM3AiimBuoTb9vDRgGcLaru6V6P1A0jOojcNNkNLN1g5AzBh
	 9Dn8UI7rhgq/1OPTWqc5HdkwsgbtzdgN2giPUIFPYJY77sFiDkS24xEBZYib15ATdWp+c
	 UZioN8etOIBgBosRvVEkB8O0jBua0Azs+1TTnnvLLIiHNh+byi6KSY1fGRY7vRexv4beb
	 fe+QTRrMlyBDqSr/1i4rw1Xr/1Q1FNiAj0Qqwb/AyBxD/jKYf1dHMGa1SFkSUyXvlMJZP
	 cq7d5Nqv22eCxC076R0asWyj1eWYHsr6rchQ5vg01Wy1OsUeDBUqDsmb9breNavG29g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KFYvdj4WEJof34obcWvEATV9E3Li/puxLmIdcgVZxEA=;
	b=PS1KUr7uLtt0s9nuRpj/6xi2wPLNktnZihgAlHbfBAn0PAvjbsObr9AkHiKVly2qu1kD
	 9h0veDuhK2RFUYEcKhG8crzq8G0nwRQg+XyaoXpXzd7nFXLsV0syoXYYbHnSTldjVUEzo
	 /iN67tnsBW2aNwsE65sYSwv6QGr8Ee+HXU6dL4FhuWuCA0CDE8Hlsf9EtcbhEyqQc08vh
	 8z5fV8KYRtgoSrpcu6RK9vB1GRxMCnfSVUY8A2oDsi8/zrQH4PhmeWw8DV0Wv6aIP+ivW
	 pcJStTXhrv18B3kk8L59NsRsuTphA8Z3pdEVuIcOEyk5vOaZQKR0hH/vi/kaRqnwX6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OmiP9pPk;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF90606A33F
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 07:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF90606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OmiP9pPk
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492f563d1c6so1195992f8f.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 23:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815361; x=1795420161; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFYvdj4WEJof34obcWvEATV9E3Li/puxLmIdcgVZxEA=;
        b=OmiP9pPkYomCUf0uoEXeMJ/tqv2YNLAYzVcqv0r4c3STmv5twr4sw7VgBpuTcBJkhg
         2sfMphZIuqhx4MSRqAvB3OjZL4psNayZ0lQnWsFLe76NMGMPxyLDKDkCoMu277lXtQxp
         SDBoM54E6YkzRUIb+RiwOwR+Ihf3ssl1JK7YHEKvQObw6wwsRC4ouYvTylffJXRWlTQf
         wAuaGHKPOhGqxLTp2KvuIZAyreNINkAZiw+fmqBlzlafRKg/mdMGVpbeDLkkFvI+QBFo
         bi6pv2moLdjDnwPY3bL79k3+miUNPcA1QJ2c2+lrMBVYxye7cOAgdQknOJogo+eeC+9x
         BSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815361; x=1795420161;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KFYvdj4WEJof34obcWvEATV9E3Li/puxLmIdcgVZxEA=;
        b=fmh+E+gqUUaNtCgvMiLMF23qCORLmHKyS+vii0yGR63MczRbf4SeFizNLqdM/CZDQR
         dx0ggOoqdj9p42PjZV7zN3lBDIE1vbjlGEE+atMWL2q8MDUcE8kHbd3JRBWMBsxjEPRD
         Qmfcj+4iQFYV1V+5NEvTHOc1SBwOTZkensPFsSwU0BmUpnqZX40E65bVMUkqTHIZwXyN
         SIVItwdYwQMJnrjks+8iWUXo3NUEwk2OJyFOxuQ0jF37s7DE9gy4V2DcOmlUK7z2Iw+K
         2GAyMtcYmGGNbawNTqoA8PbRBu/XUzf7KjEQaQ0NrsWy3fUEmONDrnamk1GSE1qLx/VQ
         TuUQ==
X-Gm-Message-State: APuU4Z/ylUaVOOnZuvgWL3DVEg+52pAoWTSelb7462XldkLsBdB1bE72
	JorQ1BYTa/PtMK86cxFrB7vVWCzNLjjPY0YwrGVUJrZn/xqDidTzONJWnXsjIacALieTIQKiWDS
	jRtXa60A=
X-Gm-Gg: AYBFou1PhY+UszQLlB7Gh/4oX//LwByn7QmR8s8YIuZhp5Ncv4WrwHQEbUIF36vuvWJ
	QhsMPQNoFnfzYcwv5fvZVv1ucI4/VhYy1/s6Y8mFM5+Z2tF9swPdw4to1zq9k2B/gvYuRe3wEcf
	UQMBP2k/x7T7Mu8/RgP4n6k2tToSeUyfuF/K/VABKeCwHMaq+WzUaNiWYOImPsZzh9aV55hxVb+
	Y8KIY+/CDdsEtSdatUq7+WGbDmWk1o6JJhyyhXG4NTqGdprJE+i8Y0PnQ6tL55mEGF5K6AiDmr+
	+D+D27PUQ4ateJ6Zx5wBY61DO5f4X8NjKQQ3sLkf2WM35GxOSf89pPZGsUg6azgMYyNa6ZxTGy6
	KHG7MRenwCLlFVbWjgnWd5tPLDg5a1KOloHQksn5bZnD14qTHVsUA7ZI9vQjzNGZt/NeS+h5nzs
	TkEiXN1FW+0P5oYqMBm8NXKAjijIGKujagc1lh8KuGjeNTsDl4Qpjek004g8UhewYsq8UfgBd85
	ngLgaIPeFWX8+N3NmzzdheZJ2Hr5DZhV/kraOEZr6lJHN5a7YT9+MLg0lYeE9aPvSYNpQ0LY0TJ
	bWvq+wf7NNpsmBPZ1T2pnYnTRVADlo2diwesx4rVmSWsElzegosIlcIVjUT0vfXCk89schCY3fn
	GxuguUWdAAg==
X-Received: by 2002:a5d:588d:0:b0:493:e0db:b507 with SMTP id ffacd0b85a97d-49c6d4538damr22238404f8f.7.1794815360622;
        Sun, 15 Nov 2026 23:49:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d7150529dsm15273761f8f.51.2026.11.15.23.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:49:20 -0800 (PST)
Message-ID: <2682b580-5611-4624-b5cb-b3b93847e95b@linaro.org>
Date: Mon, 16 Nov 2026 08:49:19 +0100
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
Subject: Re: [PATCH RFC 09/23] ASoC: qcom: lpass: add support for optional WSA
 interface
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-9-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213518@kernel.org>
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
In-Reply-To: <sashiko-outbox-213518@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:11, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [Medium] ASoC: qcom: lpass: lpass_wsa_regmap_config uses RXTX
>    callbacks and macros
> - [Medium] ASoC: qcom: lpass: lpass_platform_pcmops_trigger() enables
>    WSA IRQs on stop
> - [Medium] ASoC: qcom: lpass: unchecked regmap_read() in
>    lpass_platform_wsaif_irq()
> - [Medium] ASoC: qcom: lpass: missing wsa_lpaif_map handling in suspend
>    and resume
> --
> 
> commit ee7ef8a5c6b3d75b7ea08d4564f71cd7fbf7abeb
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: lpass: add support for optional WSA interface
> 
> This commit adds LPASS CPU, regmap, and platform DMA support for the
> optional WSA LPAIF Codec DMA interface used for speaker SoundWire buses.
> 
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index ea8b6083529c1..d46b72c926b2b 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -983,6 +983,16 @@ static struct regmap_config lpass_va_regmap_config = {
>>   	.cache_type = REGCACHE_FLAT,
>>   };
>>   
>> +static struct regmap_config lpass_wsa_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.writeable_reg = lpass_rxtx_regmap_writeable,
>> +	.readable_reg = lpass_rxtx_regmap_readable,
>> +	.volatile_reg = lpass_rxtx_regmap_volatile,
>> +	.cache_type = REGCACHE_FLAT,
>> +};
>> +
>>   static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
>>   						struct device_node *node,
>>   						const char *name)
> 
> [ ... ]
> 
>> @@ -1142,6 +1161,18 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>>   		if (IS_ERR(drvdata->va_lpaif_map))
>>   			return PTR_ERR(drvdata->va_lpaif_map);
>>   
>> +		if (drvdata->wsa_enable) {
>> +			lpass_wsa_regmap_config.max_register = LPAIF_CDC_RXTX_WRDMAPER_REG(variant,
>> +						variant->wsa_wrdma_channels +
>> +						variant->wsa_wrdma_channel_start,
>> +						LPASS_CDC_DMA_WSA_TX0);
>> +
>> +			drvdata->wsa_lpaif_map = devm_regmap_init_mmio(dev, drvdata->wsa_lpaif,
>> +								       &lpass_wsa_regmap_config);
>> +			if (IS_ERR(drvdata->wsa_lpaif_map))
>> +				return PTR_ERR(drvdata->wsa_lpaif_map);
>> +		}
>> +
>>   		ret = of_lpass_cdc_dma_clks_parse(dev, drvdata);
>>   		if (ret) {
>>   			dev_err(dev, "failed to get cdc dma clocks %d\n", ret);
> 
> [Severity: Medium]
> Should lpass_wsa_regmap_config use dedicated WSA regmap callbacks instead
> of the RXTX ones, and should max_register use LPAIF_CDC_WSA_WRDMAPER_REG()?
> 
> __lpass_rxtx_regmap_accessible() and lpass_rxtx_regmap_volatile() check
> v->rxtx_* parameters and pass LPASS_CDC_DMA_RX0 / LPASS_CDC_DMA_TX3 to
> LPAIF_CDC_RXTX_*_REG(), leaving the newly added v->wsa_irq_ports,
> LPAIF_CDC_WSA_RDMA_INTF_REG(), and LPAIF_CDC_WSA_WRDMA_INTF_REG() unused.
> Any difference between WSA and RXTX register geometry or channel counts
> causes accesses on wsa_lpaif_map to fail with -EIO or return stale
> REGCACHE_FLAT entries.  In addition, __lpass_rxtx_regmap_accessible()
> omits adding wrdma_channel_start to i when checking
> LPAIF_CDC_RXTX_WRDMACURR_REG(), so lpass_platform_pcmops_pointer() reads
> of LPAIF_DMACURR_REG on WRDMA capture channels >= rxtx_wrdma_channels also
> fail with -EIO:
> 
> sound/soc/qcom/lpass-cpu.c:__lpass_rxtx_regmap_accessible() {
>      ...
> 	for (i = 0; i < v->rxtx_wrdma_channels; ++i) {
> 		if (reg == LPAIF_CDC_RXTX_WRDMACTL_REG(v, i + v->rxtx_wrdma_channel_start,
> 							LPASS_CDC_DMA_TX3))
> 			return true;
>      ...
> 		if (rw == LPASS_REG_READ) {
> 			if (reg == LPAIF_CDC_RXTX_WRDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
> 				return true;
> 		}
>      ...
> }


Will add wsa specific callbacks
> 
>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>> index e162627d6f86e..9c879a8090bbf 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
> 
> [ ... ]
> 
>> @@ -838,6 +937,22 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>>   			val_mask = LPAIF_IRQ_ALL(ch);
>>   			val_irqen = LPAIF_IRQ_ALL(ch);
>>   			break;
>> +		case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +		case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
>> +			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_OFF);
>> +			if (ret) {
>> +				dev_err(soc_runtime->dev,
>> +					"error writing to rdmactl reg field: %d\n", ret);
>> +				return ret;
>> +			}
>> +
>> +			reg_irqclr = LPAIF_WSA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>> +			val_irqclr = LPAIF_IRQ_ALL(ch);
>> +
>> +			reg_irqen = LPAIF_WSA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
>> +			val_mask = LPAIF_IRQ_ALL(ch);
>> +			val_irqen = LPAIF_IRQ_ALL(ch);
>> +			break;
>>   		default:
>>   			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);
>>   			return -EINVAL;
> 
> [Severity: Medium]
> In the SNDRV_PCM_TRIGGER_STOP branch of lpass_platform_pcmops_trigger(),
> doesn't setting val_irqen = LPAIF_IRQ_ALL(ch) keep WSA channel interrupts
> enabled in LPAIF_WSA_IRQEN_REG instead of disabling them?
> 
> reg_irqclr and val_irqclr are also never written in the stop branch.  Once
> lpass_platform_pcmops_close() clears drvdata->wsa_substream[data->dma_ch],
> lpass_platform_wsaif_irq() ignores any pending interrupt on that channel
> without clearing LPAIF_WSA_IRQCLEAR_REG while returning IRQ_HANDLED, which
> can cause an interrupt storm.


Wil investigate

> 
> [ ... ]
> 
>> @@ -1124,6 +1245,31 @@ static irqreturn_t lpass_platform_vaif_irq(int irq, void *data)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> +static irqreturn_t lpass_platform_wsaif_irq(int irq, void *data)
>> +{
>> +	struct lpass_data *drvdata = data;
>> +	const struct lpass_variant *v = drvdata->variant;
>> +	unsigned int irqs;
>> +	irqreturn_t rv;
>> +	int chan;
>> +
>> +	rv = regmap_read(drvdata->wsa_lpaif_map,
>> +			 LPAIF_WSA_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST), &irqs);
>> +
>> +	/* Handle per channel interrupts */
>> +	for (chan = 0; chan < LPASS_MAX_CDC_DMA_CHANNELS; chan++) {
>> +		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->wsa_substream[chan]) {
>> +			rv = lpass_dma_interrupt_handler(
>> +						drvdata->wsa_substream[chan],
>> +						drvdata, chan, irqs);
>> +			if (rv != IRQ_HANDLED)
>> +				return rv;
>> +		}
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
> 
> [Severity: Medium]
> What happens in lpass_platform_wsaif_irq() if regmap_read() fails?
> 
> Unlike lpass_platform_lpaif_irq() and lpass_platform_hdmiif_irq(), rv is
> not checked before reading the uninitialized stack variable irqs, which
> can dispatch spurious period, xrun, or bus-error events on active streams

Will check ret

> 
> [ ... ]
> 
>> @@ -1359,6 +1513,34 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
>>   				"error initializing va dmactl fields: %d\n", ret);
>>   			return ret;
>>   		}
>> +
>> +		if (drvdata->wsa_enable) {
>> +			ret = regmap_write(drvdata->wsa_lpaif_map,
>> +				LPAIF_WSA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
>> +			if (ret) {
>> +				dev_err(&pdev->dev, "error writing to wsa irqen reg: %d\n", ret);
>> +				return ret;
>> +			}
>> +			drvdata->wsaif_irq = platform_get_irq_byname(pdev, "lpass-irq-wsaif");
>> +			if (drvdata->wsaif_irq < 0)
>> +				return -ENODEV;
>> +
>> +			ret = devm_request_irq(&pdev->dev, drvdata->wsaif_irq,
>> +					       lpass_platform_wsaif_irq, 0,
>> +					       "lpass-irq-wsaif", drvdata);
>> +			if (ret) {
>> +				dev_err(&pdev->dev, "wsa irq request failed: %d\n", ret);
>> +				return ret;
>> +			}
>> +
>> +			ret = lpass_platform_alloc_wsa_dmactl_fields(&pdev->dev,
>> +								     drvdata->wsa_lpaif_map);
>> +			if (ret) {
>> +				dev_err(&pdev->dev,
>> +					"error initializing wsa dmactl fields: %d\n", ret);
>> +				return ret;
>> +			}
>> +		}
>>   	}
> 
> [Severity: Medium]
> Should lpass_platform_pcmops_suspend() and lpass_platform_pcmops_resume()
> also handle drvdata->wsa_lpaif_map when drvdata->wsa_enable is set?
> 
> lpass_wsa_regmap_config uses REGCACHE_FLAT, but suspend and resume only
> manage hdmiif_map and lpaif_map.  If LPASS loses hardware state across
> system suspend, cached WSA DMA registers are not synced on resume, and
> subsequent regmap_update_bits() or regmap_fields_write() calls see the
> pre-suspend values in the flat cache and skip writing to hardware.
> 

Will investigate but WSA uses the same handling as RTXT and VA
