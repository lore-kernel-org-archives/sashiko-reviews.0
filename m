Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501380;
	b=LVTVqgBG/hDY4cEhaEtjHnWCDWXsPDuEgH5yzc4PEal65P+3oQ0HHA/nYMp3H1f2E/uq
	 lJZ18TDzdk92f/t4u+H/Vrx2PmzoKuTnAxn83R63aXGoMqssU5ViTNRDUg/rELoFtnbBC
	 +w7lbi+5p9SJLlaBh4O4pqykM8EO1CWrReaDSSPHkPs6JNwN+saS4E9ZWFmmyxmIpzZTc
	 oMOFbknumLc3SLNhDin8QvhcjyMdnkcbZ63UcU/0PXyy2HM1naY7BStMrB1pB5C25hahs
	 8/FUBJ/5jTh7BQuOi3s0TjI67mBvmVAFeXNSkE+7GN69oO0zG4h6zv0WzKH5CJ1J1Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=o0a4Pwd8R1+O9SK5iUfsvWfZnTNOS5ycC0m0fIp9lm0=;
	b=ttYjnWiUibKkNLq3uVm2mbCrJxHA5VmSZsqKH2MmMxsAUltlTsprUqvtGV1Y01ea5o2v
	 Bsh0/YLiotIV8qdQziyzcYcx9arha0O8e/uFod/LcF8MARBSmFtwmmUUPsBj8R/KyYjW7
	 2p9FvYJhlPNCJSkFB4w9pwC2+QJKnhgZfB8rSyV+Abch6uWJbxCZEqUwJ2LKd1DV0lAE4
	 39KsvafTRlVnna5Nr021VggX0jwGNpxg1XIpoQfsbmvyNdJE3mSCP32VaHdog8Dve1HtL
	 OWYbpxg/6Xklk4n7adM+0FnzxBZfwXDox8uckzNOur3sVNbRbK3d5k+0sS+m3i3vLNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nbne7IzO;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DE460A3828
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 13:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6DE460A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nbne7IzO
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so32765505e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 06:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792501378; x=1793106178; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0a4Pwd8R1+O9SK5iUfsvWfZnTNOS5ycC0m0fIp9lm0=;
        b=nbne7IzOWutqHmqkRSeLtu7g91BCGDTYYErOisKtYD1XpJ3PT3ozMjk6An88hyue6z
         P+Jf5/E7v16VsBrogwbsvV2BsjeJ5ojoslhLmMOqN0t4GlRz5R9taE/JInA0M7jy0+i3
         C3oOFlKpSrN3eyMJsUUU1+6t5pGcVQAKCFGLYim0/Tg70t+CmOaDaBhg04hJ50zMVxTP
         Qlhpm51eoPJOJ116SpsdWaEo6yerZY2OYKtAQHVmmaYdgRLDGL4/T+TBS3onEBVHyB7x
         srAn1yPbTPS8HjCu8IXGRhSv74MRZrI150qnP83cixRt43n3DgaAOotD3DBnDmMCKD2X
         3ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501378; x=1793106178;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0a4Pwd8R1+O9SK5iUfsvWfZnTNOS5ycC0m0fIp9lm0=;
        b=f/EwNmdIRcLRWSGjPUvwVmo1B8GN2lgKfFxQ86lor/1Llr25Ldnzigt1fFYIGyb56i
         1ITvJNed+uRosIWV3y6731KRKqFmsEnPOzPQA6z49RwsmAThvSf9oR9qv5+O7Ux36uYR
         D6JwHCKSzvM+vwlDqUYLhDRZYnVncYMIcjzkmJw5Gh/orxYqS2L2dAoWv32vHUqBbe8a
         36NkZJ2KLoSi+2tMbogKM+q7eMMjqxL/n7BPSU0LggCEWUbHMLgFbqJzbYXdTlrJY1pc
         P9ItArFXBPP+AqMz9kq5pOEa9glCTAbk8mZIafJ+naC++3FDLv4pZXMduAyPVK9sPMr+
         giEQ==
X-Gm-Message-State: AFq9FYIrIyX46cKzOt4gqFIGUycypXr/nT6XddZqXcmF8hYHNEy+0zrR
	fth5YYZwHFtojrAhHTYwd7FBlK2JjC0x64SssQZUymILUKURop0rSBuTGL20ic9GVWZ2oy/Ij3I
	7OJsOVOU=
X-Gm-Gg: AYBFou2cmOahiyU1oAyGYI3vgxzZ6CnOhwNQ/vEkOicr9xTXefxDDZTyY823h6579HO
	cteha7++2NGYo7d5wUztEvNNDVpQej7l6G+AoKnBCaVOFuitC5wQBzytk05WiN1v8ZAXrpEgF/3
	EC5yAz2Y01dHPbtJPTT6LLPXZbv6BkhUYz9yjcUvgTZ5kEEhDBzTZJySKDVg+2+M0H7wwvYIXq6
	WrBydidCK3Z7w1mMhVkq8T1kJUnZecnwUV7XQfXDwybL/KFLqPjRRLLIYVlhKRjGmsw/8tTEmHn
	8vetwBS1NtH+6YxUThxtmTsNkNIGlKKt+vrvHJKZbSMpzAWAi4EfALiKp13I3t1Q5MD94WXcP9T
	bvI19PY5ZFcqEjP2SkraxBil9TEad72yRSfXOzwCWa2/Q9bzfr9/t80ZM+x2TddZyzWNt4up1YN
	hez1v1LUdZL+Uw3Lc3erMxkGjrBUdgcZ+lEQzgzE1xKzB5xuRIJCUCjQzNB1IIDJ09joe4tAL+e
	A==
X-Received: by 2002:a05:600c:3b22:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a1d7615cb9mr232401775e9.17.1792501377669;
        Tue, 20 Oct 2026 06:02:57 -0700 (PDT)
Received: from [192.168.3.100] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d1e8ebsm65821575e9.3.2026.10.20.06.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:02:56 -0700 (PDT)
Message-ID: <257ab6d8-4990-4e58-9eaf-9cac3cb29b01@baylibre.com>
Date: Tue, 20 Oct 2026 15:02:56 +0200
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
Subject: Re: [PATCH v5 4/7] ASoC: meson: add AUDIN driver
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 Jerome Brunet <jbrunet@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
 <sashiko-outbox-176054@kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <sashiko-outbox-176054@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> +static enum hrtimer_restart audin_fifo_timer_cb(struct hrtimer *timer)
>> +{
>> +	struct audin_fifo_dai_data *data =
>> +		container_of(timer, struct audin_fifo_dai_data, polling_timer);
>> +	struct snd_pcm_substream *substream = data->substream;
>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	unsigned int curr_pos;
>> +	unsigned int delta, elapsed_periods_bytes, extra_bytes, sleep_bytes;
>> +
>> +	/*
>> +	 * Take the stream lock to prevent userspace from issuing a quick
>> +	 * PAUSE_PUSH -> PAUSE_RELEASE transition while we're running this
>> +	 * callback. Doing so would cause "hrtimer_forward_now()" to be called
>> +	 * (see below) while the timer is already enqueued.
>> +	 */
>> +	guard(pcm_stream_lock_irqsave)(substream);
>> +
>> +	/* Stopped, or a trigger already re-armed the timer while we waited. */
>> +	if (!READ_ONCE(data->running) || hrtimer_is_queued(timer))
>> +		return HRTIMER_NORESTART;
>> +
>> +	curr_pos = audin_fifo_pos(data->dai, runtime);
>> +	delta = (curr_pos >= data->last_pos) ?
>> +		curr_pos - data->last_pos :
>> +		(runtime->dma_bytes - data->last_pos) + curr_pos;
>> +	extra_bytes = delta % data->period_bytes;
>> +	elapsed_periods_bytes = delta - extra_bytes;
>> +
>> +	/* Report only when the period is completed. */
>> +	if (delta >= data->period_bytes) {
>> +		data->last_pos = data->last_pos + elapsed_periods_bytes;
>> +		if (data->last_pos >= runtime->dma_bytes)
>> +			data->last_pos %= runtime->dma_bytes;
>> +		snd_pcm_period_elapsed_under_stream_lock(substream);
>> +	}
> [ ... ]
>> diff --git a/sound/soc/meson/audin-formatter-i2s.c b/sound/soc/meson/audin-formatter-i2s.c
>> new file mode 100644
>> index 0000000000000..8bbb5cdb52dc8
>> --- /dev/null
>> +++ b/sound/soc/meson/audin-formatter-i2s.c
> [ ... ]
>> +static struct gx_stream *
>> +audin_formatter_i2s_get_stream(struct snd_soc_dapm_widget *w)
>> +{
>> +	struct snd_soc_dai *be = audin_formatter_i2s_get_be(w);
>> +
>> +	if (!be)
>> +		return NULL;
>> +
>> +	return snd_soc_dai_dma_data_get_capture(be);
>> +}
> 
> [Severity: High]
> Does binding the AUDIN formatter to gx_stream lead to sleeping in atomic and
> softirq contexts during PCM trigger operations?
> 
> In audin_fifo_dai_probe(), polling_timer is set up with HRTIMER_MODE_REL_SOFT,
> so audin_fifo_timer_cb() runs in softirq context and acquires
> guard(pcm_stream_lock_irqsave)(substream). This requires substream->pcm->nonatomic
> to be false, otherwise _snd_pcm_stream_lock_irqsave() would attempt to acquire
> substream->self_group.mutex from softirq context.
> 
> However, with nonatomic set to false on the FE and BE substreams, PCM trigger
> operations hold spin_lock_irqsave on the PCM stream locks (for example via
> dpcm_be_dai_trigger()). This also occurs in softirq context when an XRUN is
> detected:
> 
> audin_fifo_timer_cb()
>    -> snd_pcm_period_elapsed_under_stream_lock()
>      -> snd_pcm_update_hw_ptr0()
>        -> snd_pcm_stop()
>          -> dpcm_fe_dai_trigger()
>            -> dpcm_be_dai_trigger()
>              -> aiu_encoder_i2s_trigger()
>                -> gx_stream_stop()
> 
> Because audin_formatter_i2s_get_stream() attaches the AUDIN formatter to the
> backend DAI's struct gx_stream, starting or stopping the capture stream calls
> aiu_encoder_i2s_trigger() -> gx_stream_start() or gx_stream_stop(), both of
> which acquire the sleeping mutex ts->lock:
> 
> sound/soc/meson/gx-formatter.c:gx_stream_start() {
> 	mutex_lock(&ts->lock);
> 
> 	/* Start all the formatters attached to the stream */
> 	list_for_each_entry(formatter, &ts->formatter_list, list) {
> 		ret = gx_formatter_enable(formatter);
> ...
> }
> 
> sound/soc/meson/gx-formatter.c:gx_stream_stop() {
> 	mutex_lock(&ts->lock);
> 	ts->ready = false;
> 
> 	/* Stop all the formatters attached to the stream */
> 	list_for_each_entry(formatter, &ts->formatter_list, list) {
> 		gx_formatter_disable(formatter);
> 	}
> 
> 	mutex_unlock(&ts->lock);
> }
> 
> Won't calling mutex_lock(&ts->lock) while holding the PCM stream spinlocks with
> interrupts disabled (and from softirq context on XRUN) trigger a sleeping in
> atomic context bug?
> 

The analysis is technically correct, but let me share my analysis first
and then gather some feedback.

The issue is not introduced by this series. gx_stream_start() and
gx_stream_stop() have been called from aiu_encoder_i2s_trigger() since
commit 9335117a221a ("ASoC: meson: aiu-encoder-i2s: prepare for
multiple streams"), which is already upstream. GX links are atomic, so
the playback path already takes the 'gx_stream->lock' mutex with the PCM
stream spinlock held. This patch only extends the same pattern to the
capture path.

Now back to the issue. Taking 'gx_stream->lock' mutex in trigger means
taking a sleeping lock in atomic context which, of course, cannot sleep.
For the sleep to happen it requires the mutex to be contended:
- trigger vs. trigger cannot contend, since dpcm_be_dai_trigger() holds
   the BE substream lock around the BE trigger, which serializes all
   calls on the same gx_stream (even with multiple AUDIN FIFOs sharing
   the BE);
- the formatter attach/detach from the DAPM widget events also takes
   the mutex. This normally happens in prepare/hw_free, when the stream
   is not running, but a mixer change (e.g. "FIFOx Input Source" moved
   away from I2S) powers the formatter down under the DAPM mutex only,
   while the BE is still running. A trigger on another CPU at that
   moment (userspace or XRUN) would find the mutex held.
   However since AUDIN FIFO only supports I2S for now, I don't see a real
   reason for this switch to happen in practice.

Now the solution. Moving the gx-card links to be nonatomic seems a bit too
much intrusive to me. I think the best solution is to change
'gx_stream->lock' to be a spinlock. This is fine for GX formatter because
all ops are pure MMIO regmap accesses, so they shouldn't sleep.

Finally the question. As I said, since the issue described by Sashiko
seems a bit hard to hit, I think the fix can be postponed to a quick
follow-up series. However if reviewers deem that it's absolutely mandatory
to fix the issue before this series lands, I will either prepare a small
pre-requisite series or add a new commit to this one (I would like to
know what's the reviewers preference on this case).

Thanks in advance for the replies! :)

-- 
Valerio

