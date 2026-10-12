Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2010D49EC46
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818773; cv=none; b=XuthbZFBGh9pf58HKMvgpjRwPCTeZXvWe1A59dClrAkEaRGABB5vvtJt0bygf1IFR0prVMidv3khPg8HzPiUschvfwIhSOcxEZnIE3uz7UTjQ1IuWzfrmK0T4gyzP5OMAJGephbKeWSiBA7C9wc30WVhOTxv7e+6DrjmeVD1TIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818773; c=relaxed/simple;
	bh=1atmjcdYPcsHwLZJ1A2LHdRDNwoXYR/rrGWn8qUITe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdCUBkYrKTee8LDVF/CSODi0jomDPKB/ejTbGH+/yxxmZmtJ4RBe0D3aboF0X/kCEphRw2bQs4yPWntrFy68w1hyfEMQ1F9sjAuTROGRdq1lk/lJhaBJndGAcv56Zz5TB9tu3Spb/ayRWsG8cK9yMjGVBv7gWcruPEjdPLWGkgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iyjkE1Kh; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iyjkE1Kh"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1133050f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 08:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791818767; x=1792423567; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1MniahAvg/Rvn/u502QsbwvNOCgBbmXAK/xR/xwvXg=;
        b=iyjkE1KhINdoORBhXojX9epY7VtZ7n4nlT7mafnk2sat6NcpjcwIPuw3UpTsb54Y3f
         ziT956htbUwe1H+wXYtULqdMzpowQ4bCw+8FhoVFJCab2Bp/YmfgFV+EAJvmcs6oQ+lW
         /0X044BNHCYmp6QlAKiMgXliDz1/Moi2ykY9JXbw0DrDJn7Lyy366UlAnJx4jXjkQ/4X
         3qoQNRGDyj5R+OHge7LwO3Dt9Pmyrq391cmptOHEae+OWWjuAHFFL+5dgIwdBxF07i7f
         dL1a/MPoLnlUQnNYKIoK4ug0QrKcXCK5kIoDAuvXZebGMbzD6y3fn0+7sn1fGYCTqqJx
         4gNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818767; x=1792423567;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1MniahAvg/Rvn/u502QsbwvNOCgBbmXAK/xR/xwvXg=;
        b=mPDUaUVqRnep93Ld1FS6NcaD8dmDKZrKFQEoNdyqBj9YCLybyNHQqjvQMBP68JuvhP
         Q+8XJazl/b2fA1utIjuBw1/jOtgI/+k5bInU2nECjCha/qmwxlt4w3KYp0y1i6+2ntdv
         IDtXu41d2CD20byHEGNipeOXU0vYGpo0c1p/VX9sQ1B5wQORE4stvU4nwHnVZRdkokRX
         AOOwzzby171QdvBNERYqnq84dUE/6tEmAEswqWU3e8C+nmNDvpaupueQmUk3uFCNysOH
         MBF2juHAFKdsBTUFXm8euT6LkFW11aJo4xfOPzAp5dPE5OgWFONlnrqPHoV/hOFQC5aL
         4f1A==
X-Gm-Message-State: AFq9FYLKEimxkoHp0nYgBqMQMAT/3j9p7J9zNQK/hTGuuCRiK9+xmcWa
	Ry7gfZh92JpJ8kgWgW9k0iUxl+ldQSMFHXwW7bq1pLzITCRlqdcKJ/GMV06twtkZMBARH0zBA+h
	0Xo7W
X-Gm-Gg: AYBFou2ZtJLCjwcDevtDGukotr1oa1pG+0sf9RBhkgxLDesbriOM+bZ1N1gVg49ZYAl
	H5Di4GzUXUI9mMUtf82NKV5Ufr1sPuS5NFxTN6io3Q6lxOu6/wjtdaDTwE4ZP29eHfWOTP2bgvt
	qyEbp7bWEqKrVqY3juioxcbnntzfG7mvG8AFnlzBKuyP90YTiJWks3yatw5T8we63ozM6nKfPI3
	8eUQRKeP+pCmVzf1DTGXTn0QMds2ra/++da7Svs6m3Fy7Q/WBDHusKi24e1L8SSKjsuj1pfFWIL
	9vK6qtgBDUxvDZam2n7fFctcutTdi8F5CYA2/4i8gRj0JV65Mn15mQ7c9bo+hLhJgUBkmeGSErI
	BTQ6pJ3GagJUPjN8P86efDZPDwjO4ddZiFuVhjI81x7+V0xdU0Fh9F7eBvY+ZcHjVmn2w0By+kR
	FUO3jwd3xB3fn79oigf+ZEVLazasP61bzQ/LFCPw7kQf4NWQrTb9whlj5GG86FbIq9WaOb5vJiK
	nLyzK6N260l
X-Received: by 2002:a05:6000:4553:b0:487:106f:ee31 with SMTP id ffacd0b85a97d-48dbaae8703mr13003907f8f.27.1791818766936;
        Mon, 12 Oct 2026 08:26:06 -0700 (PDT)
Received: from [192.168.3.100] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4f34sm45018f8f.28.2026.10.12.08.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:26:06 -0700 (PDT)
Message-ID: <37f751f6-1bf6-4e31-9439-1145d930b746@baylibre.com>
Date: Mon, 12 Oct 2026 17:26:05 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] ASoC: meson: add AUDIN driver
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, neil.armstrong@linaro.org,
 linux-amlogic@lists.infradead.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-4-2476646118b5@baylibre.com>
 <20261001162313.4333D1F000FF@smtp.kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20261001162313.4333D1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> +static int audin_fifo_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>> +				  struct snd_soc_dai *dai)
>> +{
>> +	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
>> +	struct snd_soc_component *component = dai->component;
>> +
>> +	switch (cmd) {
>> +	case SNDRV_PCM_TRIGGER_START:
>> +	case SNDRV_PCM_TRIGGER_RESUME:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +		snd_soc_component_update_bits(component, dai->driver->base + AUDIN_FIFO_CTRL,
>> +					      AUDIN_FIFO_CTRL_EN,
>> +					      AUDIN_FIFO_CTRL_EN);
>> +		WRITE_ONCE(data->running, true);
>> +		hrtimer_start(&data->polling_timer,
>> +			      audin_fifo_bytes_to_ns(data, data->period_bytes),
>> +			      HRTIMER_MODE_REL_SOFT);
> 
> [Severity: High]
> Does this blindly re-enqueue the timer without synchronizing with a potentially
> running callback?
> 
> If a user rapidly toggles SNDRV_PCM_IOCTL_PAUSE, PAUSE_PUSH uses a
> non-blocking hrtimer_try_to_cancel(). If the timer is running and skips
> snd_pcm_period_elapsed() (e.g. because delta < period_bytes), it won't take
> the PCM stream lock and will execute hrtimer_forward_now() concurrently with
> PAUSE_RELEASE.
> 
> PAUSE_RELEASE then blindly calls hrtimer_start(), which enqueues the timer.
> When the running callback in audin_fifo_timer_cb() reads running=true, it
> returns HRTIMER_RESTART, resulting in a double enqueue of the same timer
> which can corrupt the hrtimer rbtree.

This looks correct. I will send an update for this.

>> +static int audin_fifo_dai_remove(struct snd_soc_dai *dai)
>> +{
>> +	kfree(snd_soc_dai_dma_data_get_capture(dai));
>> +
>> +	return 0;
>> +}
> 
> [Severity: High]
> Does this free the DAI data without waiting for the polling timer to finish?
> 
> If the driver is unbound while an audio stream is open, the ALSA core triggers
> a stream stop which uses a non-blocking hrtimer_try_to_cancel(). If the timer
> callback is running concurrently, it will write to this freed memory.
> 

This and the following issue look a bit of corner case to me (i.e. 
unbouding a driver while record is ongoing), but I agree that's a weak 
point so I will fix it.

>> +int audin_fifo_sync_stop(struct snd_soc_component *component, struct snd_pcm_substream *substream)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>> +	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
>> +
>> +	hrtimer_cancel(&data->polling_timer);
> 
> [Severity: High]
> Could this deferred callback access the freed data pointer?
> 
> If the driver was unbound and audin_fifo_dai_remove() freed the DAI data,
> when the file descriptor is eventually closed this deferred sync_stop callback
> will access the freed data pointer to cancel the timer.
> 
>> +	WRITE_ONCE(data->running, false);
>> +
>> +	return 0;
>> +}
>> diff --git a/sound/soc/meson/audin.c b/sound/soc/meson/audin.c
>> new file mode 100644
>> index 0000000000000..808e7d4fd31a2
>> --- /dev/null
>> +++ b/sound/soc/meson/audin.c
> [ ... ]
>> +static const struct regmap_config audin_regmap_cfg = {
>> +	.reg_bits	= 32,
>> +	.val_bits	= 32,
>> +	.reg_stride	= 4,
>> +	.max_register	= 0x148,
>> +};
> 
> [Severity: Medium]
> Will hardware state like the channel mask and endianness be lost across
> system suspend and resume cycles?
> 
> ALSA calls the driver's prepare() callback to recover a suspended stream,
> but not hw_params(). Because this regmap lacks a cache configuration, it
> cannot automatically restore the register state configured during hw_params()
> when the system resumes.

This was already answered by Jerome [1] (thanks!) so that's out of scope 
for this series.

[1]: 
https://lore.kernel.org/all/1jbj95zz8o.fsf@starbuckisacylon.baylibre.com/

-- 
Valerio

