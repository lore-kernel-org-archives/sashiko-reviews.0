Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CE93C553B
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 13:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097117; cv=none; b=hPKrILdMqwHVWjmFgT5SHpB94GcYokoB2MVZQli1OFioWM69DX0fI1BYwxQKdPdN2lMW6qoOBtEfZXhCieqySsE3rPtLmur3gVrkQciiPobYoWQzokMUb62wIhJEpgSf9QUHJN6LKRxLqeE3iKFOGNWsQvF7gzQALhD89DIs73g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097117; c=relaxed/simple;
	bh=2/eE0fazUYajYfJzaAkc4jsBSjU3Oo8lYalVnmNRxu0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FVfgQEHUgnq59z+Fmt1UxzQ7LjQagJUL6dQz6wU0fVIN8RVGqaPXCcS8mTbIWeMiTttNlDR733tmWxeYIsUR52rvmt+VIRRfCDA2ouz3SP27CLbDV6ILVl8Hl8dnR0C272k47rsBM9SaT1q82kkxnTdBkIko9/d+jVsAwPK+Zyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=n188snse; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="n188snse"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-46019b190b6so5066893f8f.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 06:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781097113; x=1781701913; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nWeLdZGLAbv8traSRmiJQZdTRZXFTjlEWYlcA7s+fFg=;
        b=n188snsemdpZ+MSKVbYU/J3efLT1RC3njHiX0JCsg40wuI5APgD4rln6IPx85Oo52X
         lrVYiWjwj+foGVdizDwYQ56bUXv6ogc/QTOArHTUNSzvxSjlhtzfi0jCm/3Qau8AXwm1
         QXlWTPrV+GxkbUp4yLz1Ewx0Uup7AqkXZKSdgmc0OqokFqKPlUjVbTfXDhveIM5ORojs
         cyhoehXwl1d3nbMkXsgkwi7PPC8q/7nu65+y2vJs5lifee+pqGNrbV/bkUgRwLO2l6hR
         7kPVO8FGXUPWJyNTDtj3I0YPJSAsYQUhuJsl+8dOjtm9DNzRStVlqdhrBRDiygp/S2K7
         3WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097113; x=1781701913;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nWeLdZGLAbv8traSRmiJQZdTRZXFTjlEWYlcA7s+fFg=;
        b=hxNncgYOzgKLKQGiNyhZTg0mIwJI8rUQAnJ05hB578AoiL/5q4uJk/cnU55UIAPMKF
         4q+3bcfXR42mr8YbTHf0+GC2bds77iqwXwVKflg7mDgdHbMDxNt6JGcZ3C28KHB+pOLH
         FX0MxL0wVUkOJ6H5NY2pj62dFXN8vcc8NOpEuJu7OitEytYDqm7nbnWocsgvV0Mp0iQU
         LqUd+l9WPH/Nm5Pl7Elbns8KMiU1zE1S6q4kT8rRGNvALkIVP4/e6di3p8mpWhqTb//a
         4+cDIr0ggt49S3lzPVvmIvrax1WfuHBS8G2XUJtfnpgDM4qd9MKal+PUUUPFo8BGzGaI
         ipmA==
X-Forwarded-Encrypted: i=1; AFNElJ+0HXV+7af83/Ah0On/CkQptdaxQPDWmS9+RufCtSxnyfNYrUospNxQ8BBaXiSgpRHZfQVvsOwIliD2YA+p9xw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1NvOiG0tcGUKLw+Z4tyojPamSc9ZPru0F2lX1RkGcbWbvdqDT
	dqg+I6URbL4a8sh2AzvZ069YwgJJR2iixUETdBfEV+RG2kz7HBK+4SfqWrAAdjahACE=
X-Gm-Gg: Acq92OF9BfiVwPfaEOJnSQ+Fgm2MkXL4A2CXn4qXC9307xgQ4FR0YSj56avkeaXv3NQ
	AdBYoLAq5MOLxv2jxqK0I7rmQNRzFPt1M3pRB4bnLFlfgDVffUlM/n5g/63oD+BlPa267opW2Es
	TYztN8AAVHtTftQmn32y/BAhkiqTQvjDE1i1dABoG502ksfTXZgnwX8I0qBwKn7YJv1lV43hJfW
	Lc0SwWiIFBB6crASSXvVJ99X2llYqn1jZBVCMZdTq9PBB0unZuz4S1YJrFd9SfSSAtwLdlJ8D6M
	IiCMEFVmpFzUHURudfxRy5e0KXkoRhHBAFs0VZehwfiwBU8KNpME+9S7tRAuxSNgxxJffa0fQta
	1WtawihTBpRaIwWcgbjGTb8UNfPynTTmgEFK/Of7sVm63/SqOjjJTvPU/lLjlQcnmipSVIRXUfd
	e34bpzL/YA71cXRsyRyIiuXdzkrWOGLbhl
X-Received: by 2002:a5d:604b:0:b0:43d:69ff:6898 with SMTP id ffacd0b85a97d-460302e6f06mr31561787f8f.9.1781097113561;
        Wed, 10 Jun 2026 06:11:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c371:18ed:9599:7f5f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f344558sm68667084f8f.18.2026.06.10.06.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:11:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: phucduc.bui@gmail.com,  sashiko-reviews@lists.linux.dev,
  neil.armstrong@linaro.org,  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex
 locks
In-Reply-To: <20260610103210.2ACAC1F00893@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Wed, 10 Jun 2026 10:32:09
	+0000")
References: <20260610102153.83367-1-phucduc.bui@gmail.com>
	<20260610103210.2ACAC1F00893@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 10 Jun 2026 15:11:51 +0200
Message-ID: <1j33yufsko.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 10 juin 2026 at 10:32, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] If `axg_tdm_formatter_attach()` fails to enable the formatter
> (e.g. when trying to catch up to an already running stream), it returns an
> error and skips `list_add_tail()`. However, the DAPM framework will log the
> error but still mark the widget as powered up. Later, during teardown or
> routing changes, DAPM will call `axg_tdm_formatter_dettach()`, which
> blindly executes `list_del(&formatter->list)`. Since the list head is
> zero-initialized by `devm_kzalloc` and was never added to the list,
> `list_del()` will dereference NULL pointers, causing a kernel crash.
> - [High] The return value of `axg_tdm_stream_start()` is completely ignored
> in `axg_tdm_iface_trigger()`. If the stream fails to start (for example,
> due to a failure in `axg_tdm_formatter_enable()`), `axg_tdm_stream_start()`
> correctly returns an error code. However, `axg_tdm_iface_trigger()` drops
> this error and unconditionally returns 0.
> --
>
> commit d9e23c7e7ade1061d83943c614a45fe952dec33d
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
> ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks
>
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
>
>> diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
>> --- a/sound/soc/meson/axg-tdm-formatter.c
>> +++ b/sound/soc/meson/axg-tdm-formatter.c
>> @@ -157,20 +157,19 @@ static int axg_tdm_formatter_attach(struct axg_tdm_formatter *formatter)
>>  	struct axg_tdm_stream *ts = formatter->stream;
>>  	int ret = 0;
>>  
>> -	mutex_lock(&ts->lock);
>> +	guard(mutex)(&ts->lock);
>>  
>>  	/* Catch up if the stream is already running when we attach */
>>  	if (ts->ready) {
>>  		ret = axg_tdm_formatter_enable(formatter);
>>  		if (ret) {
>>  			pr_err("failed to enable formatter\n");
>> -			goto out;
>> +			return ret;
>>  		}
>>  	}
>>  
>>  	list_add_tail(&formatter->list, &ts->formatter_list);
>> -out:
>> -	mutex_unlock(&ts->lock);
>> +
>>  	return ret;
>>  }
>
> [Severity: High]
> This is a pre-existing issue, but if axg_tdm_formatter_enable() fails,
> this error path returns early and skips list_add_tail().

This is path the very few have tested since it only happens when
someone is playing around the routing kcontrol on a running
stream. Still it is supposed to work.

>
> If the DAPM framework logs the error but still marks the widget as powered
> up, it might later call axg_tdm_formatter_dettach() during teardown or
> routing changes.

Ok but the IF is important here.

A widget that failed PRE_PMU event should not receive a PRE_PMD one.
so it makes to unwind anything on error.

>
> Since axg_tdm_formatter_dettach() blindly executes:
>
>     scoped_guard(mutex, &ts->lock)
>         list_del(&formatter->list);
>
> Does this result in a NULL pointer dereference because the list head is
> zero-initialized and was never actually added to the list?
>
> [ ... ]
>> @@ -330,7 +328,7 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
>>  	struct axg_tdm_formatter *formatter;
>>  	int ret = 0;
>>  
>> -	mutex_lock(&ts->lock);
>> +	guard(mutex)(&ts->lock);
>>  	ts->ready = true;
>>  
>>  	/* Start all the formatters attached to the stream */
>> @@ -338,12 +336,10 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
>>  		ret = axg_tdm_formatter_enable(formatter);
>>  		if (ret) {
>>  			pr_err("failed to start tdm stream\n");
>> -			goto out;
>> +			return ret;
>>  		}
>>  	}
>>  
>> -out:
>> -	mutex_unlock(&ts->lock);
>>  	return ret;
>>  }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but is it possible for the
> return value of axg_tdm_stream_start() to be lost?
>
> Looking at axg_tdm_iface_trigger() in sound/soc/meson/axg-tdm-interface.c:
>
>     switch (cmd) {
>     case SNDRV_PCM_TRIGGER_START:
>     case SNDRV_PCM_TRIGGER_RESUME:
>     case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>         axg_tdm_stream_start(ts);
>         break;
>
> If axg_tdm_stream_start() returns an error code here, the error isn't
> propagated back to ALSA. Does this mask the initialization failure and
> cause the framework to silently fail, leaving applications to hang while
> waiting for period elapsed events?

2 things here:

1) This is a DPCM backend so no "period elapsed events" here. This would
happen on the FIFO frontends

2) The return code is a grey area here. There could be multiple
formatters attached, this is mostly why the error code is ignored, so a
working backend would continue to operate if another fail. That's the
idea at least. 

-- 
Jerome
