Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2561D7E41
	for <sashiko-reviews@lists.linux.dev>; Thu,  2 Jul 2026 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024498; cv=none; b=q04moHz+hI3chQG0mVSvbAPyFOZqbjccH6N5wIYe7DE75wS9tg9cGWb9Gs3uPZK5qPEPFbaOtnDmQEIf3iHoB783UD0CQwOAuG5vOfpcC65FQhUkUB4i6sqLXplkWOsbdQXFYjZFKnDc7hckG0ACylOnifn/sj1E0qSWDn6Zeio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024498; c=relaxed/simple;
	bh=bnpH7Afh4UF2st0DxyzyBhFPYH25UV/gzSOUwFGqpYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQTAmpTb12UedU6X2YJfNCypE8gJO2bNmCtaD+DaOd7ni4xh3a5buQ4+x4Ks4q8yUhNRpWJiYaPitiNTpeTHTbGOaOu8VmKJJsqswzrBPoQZ0rLmyqJ8QTjWa4MP6PIAVoFJdLQQ0hfsM/YiCmRPiCTlPkb7g5bksEdfiPEMxwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cxbpMwSt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cxbpMwSt"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c1950518so5355565e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 02 Jul 2026 13:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783024494; x=1783629294; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3eCE6CojkhPNhytF+tXa0zDs8MGJ/t+zhz44dKA5rs=;
        b=cxbpMwStHJkN0AagMUbMGTOL7ZejGOENcrwuEPKp1fU7wcZFnG09z7MxgxXljIBK22
         mbYOyuc/gF9KPnLNZoeDMrgBUvawbKNwXn6i0EpTj3rXzMbYJEaLAo3etznxAmDpVr+Z
         pyBoZeV4aeptp5BdDjM4S+qYuD3xm8bPi35EWxykdwVAA+VJYqIxrNLnQndhe/J3RZi2
         cLlgUX9PMiisPtVy9wjYtHxLV6rNTa7z0OdPcV/VyioCwN0Q96NCXj5fnTIG9MpSl/cy
         CzOq+jVqZd+muiyWbA45QUGLl2oIImNs1m9TNm195eFN2bvxNLudsGioG3MmUNofBV7F
         RgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024494; x=1783629294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3eCE6CojkhPNhytF+tXa0zDs8MGJ/t+zhz44dKA5rs=;
        b=pvrfsWgds2BPwSU5D22G2QbqsmL23urLb/dbsUGaLuCS2Bs8Id213RhtIi80DsQV/7
         pPejFc1HCSQtgbKUst6acuOSvukBsb2N8mZrwJRjvwpZ3Q48kguA3f2msctkTimBKDQI
         gY++mPBar/7aXyXDwiAB3L8+ZrFCV2QwqvL4EyVh7HM4qf9lFoexclkdK3vO17U3WeNn
         xS17hzDla2M06B3w7Qkbs2JbojgnGxZhDH95p18j1XmKL9WByFCapbFlSu1RpIGam8Yx
         J0KGTz64HLll74PrEGcNEIYA0BYYNJba/jJwjrElMiQ8lRWEbhTsNRs40qMqdKIXvOve
         7ApQ==
X-Gm-Message-State: AOJu0YztAJ3QyIUarJkfQnaye3LbqLJElj3wj1qN4vzUw/Cy2G/0PYim
	4DfhInHUTzSRyRduRhL/zKF4eCl1EpyH5vAJRUDtQoWXIf9VnwDdne+VsLGRtTWt0zx/RIEicqY
	UgxII
X-Gm-Gg: AfdE7cnB5vCbuaXD57+LPP8AK7VIgudNiVTOrFXiLGcp9PXYDdWynfTkLRnxqA2fypz
	FegCmwo1NXGgbGxRZ8FbSqCXNx0T+Ow3JOT3fl0+BDzHvXctQgogO5MRNv6OAzuL+RQdsIzDolJ
	e8jYMjChv/+Ah8pwWH2zP7n7gd6GKGcXZwbgTLNzaZNOUSN0NqYjpM0YqKfx2OmOC79nDAds+Rt
	CcEYFzFYArwn95dvqAMRlZJnhEq8v7bLg+ZvSd6tqqaRp+pJLmer3ZB+p9DIos8SCu6M6cN7ZLc
	VotXGEy6d0ao3jUMy7M2om53IQC9GtBsI/6fWq/3GeyVOIc/nfA48Z8lCyImVawkEOKHCaPTbIo
	ZFfsoDvfbpXc46uYoj6rOKPqmptPWbzwgOHm+noNqr8x2zXP+RZeN3SdbJtATwrbEYGoMKvl84t
	e6XbRTKnlAOxQAgnE=
X-Received: by 2002:a05:600c:4690:b0:493:bee0:4360 with SMTP id 5b1f17b1804b1-493c9b6c137mr22238735e9.17.1783024494057;
        Thu, 02 Jul 2026 13:34:54 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm77131325e9.4.2026.07.02.13.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 13:34:53 -0700 (PDT)
Message-ID: <b1a0a7de-c5b1-4325-8159-d5a0bad1668e@baylibre.com>
Date: Thu, 2 Jul 2026 22:34:52 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: meson: gx-formatter: prepare on attach
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
 <20260702-fix-24-bit-i2s-playback-v1-1-bcd3a43fe32a@baylibre.com>
 <20260702111021.2CCDC1F00A3A@smtp.kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260702111021.2CCDC1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/2/26 1:10 PM, sashiko-bot@kernel.org wrote:
>> diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
>> index 311e63affb239..c7333f624b155 100644
>> --- a/sound/soc/meson/gx-formatter.c
>> +++ b/sound/soc/meson/gx-formatter.c
> 
> [ ... ]
> 
>> -static int gx_formatter_enable(struct gx_formatter *formatter)
>> +static int gx_formatter_prepare(struct gx_formatter *formatter)
>>   {
>>   	int ret;
>>   
>> -	/* Do nothing if the formatter is already enabled */
>> -	if (formatter->enabled)
>> +	if (formatter->prepared)
>>   		return 0;
> 
> [Severity: High]
> Will this prevent hardware reconfiguration for back-to-back playbacks?
> 
> Because the ALSA core utilizes pmdown_time (delayed power down), the DAPM
> widget remains in the powered-on state for a short time after playback
> stops.
> 
> If a new stream with different parameters (e.g., changing from 16-bit to
> 24-bit) starts rapidly before the power-down occurs, dapm_power_widgets()
> will not detect a power state change and will not emit a new
> SND_SOC_DAPM_PRE_PMU event.
> 
> Since the widget wasn't powered down, gx_formatter_detach() hasn't cleared
> formatter->prepared. This check will return early and skip updating the
> hardware for the new sample format, causing the new stream to play through
> incorrectly configured hardware.
> 

Uh, this seems right, but with a caveat. When I tested this series I 
launched 'speaker-test' with 16-bits and 24-bits in sequence and it 
worked perfectly.
To generate the problem described here I had to create a custom binary 
that played the two sine tones, one at 16-bits and the one at 24-bits, 
without closing the PCM in the middle (as the 'speaker-test' case was 
doing instead). This way I was able to recreate the problem. I don't 
know how common it is for an application to switch sample width "on the 
fly", but it's worth fixing it.

For the records, I just tried removing this commit and both test 
scenarios work just fine so I'm inclined in sending a v2 with this 
commit dropped.

-- 
Valerio

