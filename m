Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7911E433E74
	for <sashiko-reviews@lists.linux.dev>; Thu,  2 Jul 2026 20:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783025096; cv=none; b=SGdE8UXuaqRHp0H4pdtI/9vAsyFWaLo6zrcS4jg8ddK39sq5GhEB8+EGXwxIiwMld8+oNbgkOQ6Bm0/4N4TQEDCt9L7cZd2B5CTEiWOf6dmsG8dPbcN5fv0TroWYZ0UZx4RGOPwc1i7+W97O/hOvOIWehJHn0LIEwrwRX4tFbmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783025096; c=relaxed/simple;
	bh=3VwnXAIaEe+4zXeBKEU043hXqkMQY2332S0XEhCwyac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AkaU6gPND/Vnw8CBlk2rUbXXJL3w0RGALYPzGLIoiwZZFqOW/Q0rez5LSJ9MAIjlYXAJGXexK5gjqnvIuC4GzLYh6hbF+LL5ok95a1GALMJUyW/ScXYsFMPfLw8FEGl7KDXwMkz9eIdERbSdW/15vEtaDLslmyNA72dpi/KIvWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Fsrrcjv3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Fsrrcjv3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-470174001a0so1598919f8f.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 02 Jul 2026 13:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783025093; x=1783629893; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYSEb1fRPNK7jUZ0mBNdZrE9oqYSNcb+vjaKrLF66Eo=;
        b=Fsrrcjv3yyk/zDfDRTU5DzaMDmJ+koltwETeFs2PMqkY1elmMz2yZ6xY9XoF79GnW3
         23IrP8MMTA20PdS2oFUI7QCQSAX5SAXgNusrzyU8kkOpJ9TdOkHNlUDvOGdwh8Cj4Z5C
         tuO5JIGVXCXt0sKEdmIZxFa90QIl7lMtUPlv4hWQwe75USBR6fB1AaV8/4Fbm5QORLkp
         NcmbSqdCiYHODOL6Cm4yI8pohoMYXFbj28gETbswugxrDYmb05uH7d0YU9A36KeR7L0c
         FmMzfXHSid75x7rXX9R3IL/QR1/zUivJYynw4Ix4EQXyCRvc6gqHxfh3aabbSLUX5djY
         4w4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783025093; x=1783629893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYSEb1fRPNK7jUZ0mBNdZrE9oqYSNcb+vjaKrLF66Eo=;
        b=fyXnVFj0WGcTTrky5O6a9jY7lMcA/xcTtfahzZ3hCKCu3OcRdQiaTLlx6at2N1mhl9
         8dO1s5iY8Q2tmTCMYItS4SsTl/hh9/bBoK1XGIkm6F92KsL1Sy3N1UJ0ql6DnW9mdvYM
         XAHuK16NWf8e9TH01nqiZbNEWSobada/dNyNIKnfuIBBeC7lIobP9bVI1KWsxFaEP8h3
         Q9IFPQjba5gmlYZMLMf9CKmNXs6FfQyiyWSID2hRkRhmh8ufyJ9BwgdbAJ/55U41cyp1
         XI+s5KMjMJ2cxtrp1wwOCO1SEhZgbErLX27PSLbaMC3TOcEVsldEpdig0d5/o2sHFN6x
         jW7w==
X-Gm-Message-State: AOJu0YzbEpPyMYeeb0N0cXLNaSrFus2reyOnAa//wUwUquV4axDWgKiA
	l+nlgso7tSbgRE78zw2piRTRZJLLhEWEaD+PtgjpNSKjHe0furSICCFA4hq1Ib4fSkRPuq22gpD
	n9sf1
X-Gm-Gg: AfdE7cnNTAl2WDbFPjeYlvki0uJxpP+vreTjecQzNKRffmDqAnCzKJx6848boAQLXcY
	8kOQWHYya1loikDB+LRimVoIeelNzr81GhNShH31S7uWq68GpbzDap6dUYTPz5e3Cn866e/1YUL
	Vf534HYh3YFQ4s4MzzK5HicKV2lGRzbY59JFtwuU25303b1E7OjIt7ipM/yWKpi0P26bH6HI9Qu
	LNxRatarBHuJ7rlORCrC1r8kXUuRW17h/Z5qKOGNR7Vq2iE6sDsXE5d42nfskv7DJiaRvjKVpWd
	eQlibEZmCDA/5ES6c3KEaAMSY8NKFzN252/MBI3mk9rndMQAybYKECyDeqUr2DPjvtx8OoEPoAW
	DimZ7t/yJTPMjTyfYcvgg0HGmXzsmglohFdHxlDsG7+zqUtPzrqgSybjkkhoGElBAoH861CUEMX
	PJdz5S/ftcA1b+7Q0=
X-Received: by 2002:a5d:5588:0:b0:473:1ccc:15bf with SMTP id ffacd0b85a97d-477b5488071mr8406342f8f.42.1783025092703;
        Thu, 02 Jul 2026 13:44:52 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm11660249f8f.24.2026.07.02.13.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 13:44:52 -0700 (PDT)
Message-ID: <787586e0-f11a-48ec-8a07-8e56043b7da8@baylibre.com>
Date: Thu, 2 Jul 2026 22:44:51 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: meson: aiu-formatter: remove pipeline reset
 from prepare
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
 <20260702-fix-24-bit-i2s-playback-v1-2-bcd3a43fe32a@baylibre.com>
 <20260702111422.42BA01F000E9@smtp.kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260702111422.42BA01F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/2/26 1:14 PM, sashiko-bot@kernel.org wrote:

>> diff --git a/sound/soc/meson/aiu-formatter-i2s.c b/sound/soc/meson/aiu-formatter-i2s.c
>> index b4604734fe88d..cb554c2e7ce4a 100644
>> --- a/sound/soc/meson/aiu-formatter-i2s.c
>> +++ b/sound/soc/meson/aiu-formatter-i2s.c
> [ ... ]
>> @@ -55,11 +54,11 @@ static int aiu_formatter_i2s_prepare(struct regmap *map,
>>   {
>>   	/* Always operate in split (classic interleaved) mode */
>>   	unsigned int desc = 0;
>> -	unsigned int tmp;
>>   
>> -	/* Reset required to update the pipeline */
>> -	regmap_write(map, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
>> -	regmap_read(map, AIU_I2S_SYNC, &tmp);
>> +	/*
>> +	 * Pipeline reset is already implemented in aiu_fifo_i2s_trigger() at
>> +	 * trigger time.
>> +	 */
> 
> [Severity: High]
> Does removing this reset break dynamic DAPM routing (DPCM)?
> 
> When a backend is dynamically connected to an already-running frontend via
> DPCM, the frontend's trigger() callback is not invoked again.
> 
> For example, if the I2S FIFO frontend is started (e.g., routed to the SPDIF
> backend) and then the I2S backend is dynamically connected while the stream is
> running, the "I2S Formatter" DAPM widget powers up and calls
> aiu_formatter_i2s_prepare().
> 
> Without the reset pulse here, will the hardware fail to latch new
> configurations (like AIU_I2S_SOURCE_DESC), potentially resulting in corrupted
> or no audio output from the I2S backend?
> 

I'm not sure about this. The reason I removed the pipeline reset was 
that having it happening after the one on the FIFO side caused the 
stream at 24-bits to be corrupted.
In the scenario described by Sashiko we would have had the pipeline 
reset again after the one from the FIFO (which is continuouly running). 
Moreover I think that this would have happened also before my series 
that was recently merged, i.e. c7852d2dcf66
("ASoC: meson: aiu: align I2S design to the AXG one"), so I have some 
doubt that this could have worked seamlessly also before recent changes.

-- 
Valerio

