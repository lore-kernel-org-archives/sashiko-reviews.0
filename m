Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1155366067
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 15:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779378766; cv=none; b=SZz3qbTcqrFlyVLfdQUmblkBxSka935gXln7sDwHg9O8FBVgPa0HCHP51rxOPPuakoY9W3hmkmhnKU7mQgAAhZAirnFxp46HMqkNC+khO/8KzufFv6krpt59z/Y/uEFR7THtfLPFGSWXSg1rdYyRq6keYRYBP0EkLe0NgjkbQnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779378766; c=relaxed/simple;
	bh=IAHbP6eW63FYnPMlo/beAXyk3SY1/tCIJIPwYDUTOf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=df5ayBMA0ja7Fl4BHT7ANAsGcqnakfibvga0dECshkgIwjJYirbnfUthlkeMl0gr4uC8aImh2Ml2KDnwEjVElmwo/WDICgD2XseGAEsfJTelm0FF9BWYOS5yEPjbGUm3XUlRWja81f4YldeINR85SFoKyNn3PJvmerYmdOsAIAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=f6poZJcn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="f6poZJcn"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso56911195e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 08:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779378763; x=1779983563; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkuwrL+8sdByToUa06iwqboK6E1NO0C0KpcSpGWRRog=;
        b=f6poZJcnVhVfZUmkWbuqEIIVXXEwF34GUm0OKjmBE60fN8iQu+ApIUfDyQd1Aq6Smz
         TveY/rXTexPR4dPrJjQbjtfpZM4kveShoSVh6dxYvIhpEmQCl4lomA82PsRNaXeNJX1W
         pcjVmssZLU367UcAmpdPoSgK73X08FU6V9KBOePWkUKjlQGFf9AxkzRvyAAIiD/9jJWd
         Zmp0ZYWXYfdsYUe/c7C4cEXDo0xW9WXpPoa6m1ACJwQSLbyuJst0XiuVipITclQCnTCX
         2HDD8e3PU5MIt9e8jqDPpEyL1Od5HuQsqvwyFguo4xKvSkD265aGNoMzXJt5uNNoOTeO
         9xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779378763; x=1779983563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkuwrL+8sdByToUa06iwqboK6E1NO0C0KpcSpGWRRog=;
        b=PMeMfxSvFFwKA+k0eFxqjmeuOBq0h1JJMxHuOARSVNCLnTba2ia7q8+DzMaXPyJJ76
         xwHANkofmKxd0ne0Abk2Exa56SfiTL1DaiDGIvws6n5YFwfID1Gd9yvokT9kPYcDd9Ue
         zhmpBbsdC4X7kroIO1UEhYvFDyu4HsAiCEdb10oznCXo7MberhhBrcOpMNNcsIhts4Fu
         HZPAcSKw2Mv9V6Wj3378M+yMlpvNHvlvJxATfp7HbYtHfBRO0TvUt3qSccW8epSyzB73
         9xohYtayilxKm/cfjZhDLNeJSvQ6NI5CoT/5y8PvlBR5LsXI5XEUAK8wkQNQcbzAKJ5P
         lrhA==
X-Gm-Message-State: AOJu0YwKAti3+JeL0YmYB+d2GL6JaMqhV1BfL+3o2XrPoAryb1WKKkrE
	BROiPav3HNIhNSo3kE8S5UfMhKkgiUz/a7MybRCiphb4LqidxexVgHlOLGw2EKsRQ6y4b1Iieda
	kZsVD
X-Gm-Gg: Acq92OF7d2oxNauUuuJfK5eCdufEV01eF8Od4s7ONf2lKnRGxgvB/OgJq5qa/4Oln+/
	poikyqF0gJiy04K9sDYmS6PwN7sWfQfIyNS8fBdLbLq9bTvdovJoP18qVtBnKHlkMXsL4haR9MB
	QTbU1FNvlVIRCud26yOVGPpHXdyclVeUUkD49qkhmH740yIIiMNXL2xr+OgL5iDw80b50Bd0pGX
	tU2aUxtdkTAmqB6olKYX24Z2NpEvWOONXBRGTj5L3SjKer+eo5CXV16RQtLAniQN7mitzZasWyi
	N5MnpBfkrUrWroOAGwf8V/42k8Q1ppSxPtFze0CXQnkVUP5YImN+Ds5K3qQaH3b9NdoEQK7njgl
	Zp6+B0c5fOC2ZBgGGd2jOntRefZXB9FZE324VSE6egjwyMg8mQ+9HYj+qMDc+d/77k94lCCWjIN
	O2R48ZNS8SWW1kkO7nbWEoXhSHGQ==
X-Received: by 2002:a05:600c:621a:b0:48d:50a:6ef4 with SMTP id 5b1f17b1804b1-490360ae7e3mr40140425e9.11.1779378763182;
        Thu, 21 May 2026 08:52:43 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903c99cb43sm34383775e9.4.2026.05.21.08.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 08:52:42 -0700 (PDT)
Message-ID: <b274a43d-de3a-420d-911d-6b233b4294ed@baylibre.com>
Date: Thu, 21 May 2026 16:59:12 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: meson: aiu-encoder-i2s: use gx_iface and
 gx_stream structures
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
References: <20260515-reshape-aiu-as-axg-v1-2-53b457784ff3@baylibre.com>
 <20260515161047.C0701C2BCF7@smtp.kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260515161047.C0701C2BCF7@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>   static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
>>   				     struct snd_soc_dai *dai)
>>   {
>>   	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
>> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
>> +	struct gx_iface *iface = ts->iface;
>> +
>> +	if (!snd_soc_dai_active(dai))
>> +		iface->rate = 0;
> 
> The ASoC core invokes the shutdown callback before decrementing the stream's
> active count.
> 
> Because of this, does snd_soc_dai_active(dai) always evaluate to at least 1
> during the shutdown of the final stream?
> 
> If so, iface->rate will never be reset to 0, which would cause subsequent
> streams with different sample rates to permanently fail with -EINVAL until
> the driver is reloaded.
> 

I might be missing something also here, but I don't think this is 
correct. It seems to me that when 'aiu_encoder_i2s_shutdown' is called 
the number of active streams have already been decreased so everything 
works as expected.
In support of my hypothesis I have tried this patch series together with 
the upcoming one adding also capture stream and I didn't experience 
problems, so I think that 'iface->date' is correctly reset when expected.

>> +static int aiu_encoder_i2s_trigger(struct snd_pcm_substream *substream,
>> +				   int cmd,
>> +				   struct snd_soc_dai *dai)
>> +{
>> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
>> +	int ret;
>> +
>> +	switch (cmd) {
>> +	case SNDRV_PCM_TRIGGER_START:
>> +	case SNDRV_PCM_TRIGGER_RESUME:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +		ret = gx_stream_start(ts);
>> +		break;
>> +	case SNDRV_PCM_TRIGGER_SUSPEND:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +	case SNDRV_PCM_TRIGGER_STOP:
>> +		gx_stream_stop(ts);
>> +		ret = 0;
>> +		break;
> 
> The PCM trigger callback typically executes in an atomic context with the
> PCM stream spinlock held and hardware interrupts disabled, unless the DAI
> is explicitly marked with nonatomic = 1.
> 
> Looking at gx_stream_start() and gx_stream_stop(), they both unconditionally
> acquire a sleeping lock via mutex_lock(&ts->lock).
> 
> Does acquiring a mutex in this atomic context trigger a scheduling while
> atomic kernel panic?
> 

This is one of the parts that has been copied from AXG. I would say that 
the problem highlighted here would only appear in case two formatters 
are started/stopped on same stream concurrently. If that's the case then 
this is not a problem for GX because we're going to have 1 single 
formatter per stream.

-- 
Valerio

