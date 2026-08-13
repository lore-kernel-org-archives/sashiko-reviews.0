Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47393BE16F
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629835; cv=none; b=i8KCnVKJobjffdyoZj91bQHITUxgxj0dsrgMkYcwhC7Su2IKnDsUdECAUArVwWFp/2C0BeyIj/OADNNO+GAzjx+xktOM2oZ3Z3Q6x3GRLZH+ebBabodNjLgnhQHVYNQAUXTQFDK1PP4iwxwRr9kYilJeIl3uty4EYpk9CrWhNgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629835; c=relaxed/simple;
	bh=+68qMPQULekWGDb3r8Qb9OlUJ2P4wfYl0uDP43j2nWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSmORJu6YzW7A5PjrhMqyecbwN6l9AqrBlbHFIPy9CywhrAMzC4Oe1Hi+839SAJPyn2m7bgAizgTo85NZk5Q1hK2JHrA1T1+gJZW/R7/FvGQ4w+7N9+K9Li7Vjx5Zh18tuAFPA1wmE8WA+hvuioya12xLS3iS/70K96JzVsWBQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vFjexRAE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vFjexRAE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so20919875e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786629832; x=1787234632; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KFG7QuhLneq7bZyDroPESrKS4TWugaFx6vINPlvCtq8=;
        b=vFjexRAEN2P2k9j6AdN42NpFDiudiJ8z0iTahSiSExQgQh6IHT2paNUB2ssiwiZXdE
         Evm3Il2+1Ayxhhhi56haYMk8tjVF5d/HTRsVQbzUU60RsYDZIvyoYhqtd3lQ+B5nnwtP
         na5+hnMKpk/9JRANWhOUEYSqdVKeE2lYbIM31xMOkhKM/4dXIQSuKj4wQEU/S6bx6149
         yC6bWXE8dSrkfBVU5b8XRMWWffXEg/WF1xH5sHmQ32GQ1GKKDw8sU7MOMq/n8Iv5rNLr
         nyVZdn4X30NTNwbM0NySnvKSoDMHAzrY3cgRGp0GQvQJPXNqLHAJ9gEU9xVoTzS+x2Iq
         rFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629832; x=1787234632;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KFG7QuhLneq7bZyDroPESrKS4TWugaFx6vINPlvCtq8=;
        b=YQVQnV+06SM5GOGpZ8ja7b9rKUUS9KnEGkfqWt/ZXmUHwvk7Yyt9hCaFZEL0IA5jnz
         0VAKRbAiRe88UBlL17b9D7KHz9+scH52eF7yXLrbpZ+VJXz3xZO6x9I8ZVMucyfomLss
         LEHT1cfyCJ2Ych2yhgpwnJ+7iQ06PnQgalwKgoiHg6jSF35d6n9NB3+Pi6EiTH5cit3J
         ucxJZ/p7kGsCTErEnql1KUpgAj+oKfirO+obnUVBtXh6DqPNOSsE/yMmjavCbLvYhlzJ
         +R9Yuz76bsbSOjrf/Gbdf4FRyJUFXmpxXbLbNPADMMn3gQYfcC6k/ruKTuXy3cJk0/zS
         UzxA==
X-Gm-Message-State: AOJu0Yx0k3YdGXkPUpAOnpCdxCa0pMZQ43Y11Jhe6flcyTaGzj5MuDJf
	YI7kjRPeTb651oThaUsfUezR1BkVXbqJlz1Ba4Mqzatf76llyLXiwsChws+yJz7b32GAmRHEoCd
	Qr/SxFA==
X-Gm-Gg: AR+sD13dwNN8JjOaDJsw/KwPBq5bRWHtA2vGsWdpZ6UkPgrSMJUF+I7H5B9jkpT7MrS
	fTnq/yWnVCczoYyiq5s4XB+ys0UrfkqpzY1scFHbc02TeMVfmrt8AGNLLpNB2Yv8mdRXv+9wyKV
	dklO1CQROptEgzSjzrzLG3wqGWC+fHnRztk7dRIfmXqcmr6xEOKkkdv+y1lEvTLEQqBWuhOIvx2
	kg5kycTuIg7oFXm3dYO2quChA6TlFmz3XF+BPVRwZ0zCF8ys6cQAPH/SJHVVD1UWQN/uaG/Nr6C
	VGFqi2/k4X6aVWYdAFEdD3gyrFaXopdl6FKcX6bMKW0Tq+ANR/emTDfLdWwq7kiSD3qH6jDK0QC
	QDwG/pVGrR6odd26d/7rajZlqVf/45A7E52t1tzXxNCrVIzeKOuyiAgTitzYUyU1J9aBHFBOfuS
	MYn/ZUDU7lc+WB4nLJzo/FitzR7Hm7qknLbCm6u4fU6hDX8bT7UUCuR5+EpkY3GfV1tTJ5YO52d
	IH406Ut6ZUpbCWAwnShONYse8nFZlIx
X-Received: by 2002:a05:600c:1c1a:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-499821ba2e6mr66608875e9.11.1786629831520;
        Thu, 13 Aug 2026 07:03:51 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981e31c41sm30768675e9.2.2026.08.13.07.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:03:50 -0700 (PDT)
Date: Thu, 13 Aug 2026 15:02:20 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v5 06/18] tracing/remotes: Add dmesg tracefs file
Message-ID: <an3ObE0FFGHK07EO@google.com>
References: <20260812161340.2417322-1-vdonnefort@google.com>
 <20260812161340.2417322-7-vdonnefort@google.com>
 <20260812164257.AD3A31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812164257.AD3A31F000E9@smtp.kernel.org>

On Wed, Aug 12, 2026 at 04:42:57PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] When CONFIG_PRINTK is disabled, dmesg redirection stalls the event iterator perpetually because `pr_info` returns 0.
> --
> 
> --- Patch [6]: [PATCH v5 06/18] tracing/remotes: Add dmesg tracefs file ---
> commit b41c280df86084ff7600dad9b61a6fa3dbbdf1dd
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> tracing/remotes: Add dmesg tracefs file
> 
> When enabled, the dmesg tracefs file enables the redirection of all
> events to dmesg. This is similar to tp_printk.
> 
> > diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
> > index 1fbe2f3f20e99..3a5e0d84c1722 100644
> > --- a/kernel/trace/trace_remote.c
> > +++ b/kernel/trace/trace_remote.c
> 
> [ ... ]
> 
> > @@ -882,6 +908,87 @@ static const struct file_operations trace_fops = {
> >  	.release	= trace_release,
> >  };
> >  
> > +static bool trace_remote_do_dmesg(struct trace_remote *remote)
> > +{
> > +	struct trace_remote_iterator *iter = smp_load_acquire(&remote->dmesg);
> > +	unsigned int max_events = 1000;
> > +
> > +	if (!iter)
> > +		return false;
> > +
> > +	trace_remote_iter_read_start(iter);
> > +
> > +	while (trace_remote_iter_read_event(iter)) {
> > +		trace_seq_init(&iter->seq);
> > +
> > +		trace_remote_iter_print_event(iter);
> > +		trace_seq_putc(&iter->seq, 0);
> > +		if (!pr_info("%s", seq_buf_str(&iter->seq.seq)))
> > +			break;
> 
> [Severity: Medium]
> When CONFIG_PRINTK is disabled, pr_info() is defined as no_printk, which
> unconditionally returns 0. Does this cause the loop to always break early
> and skip the call to trace_remote_iter_move() below?
> 
> If so, it appears the background polling work would continually fail to drain
> the trace remote buffer and run periodically without doing any work, as the
> iterator never advances.
> 
> > +
> > +		trace_remote_iter_move(iter);
> > +
> > +		if (!(--max_events))
> > +			break;
> > +	}
> > +
> > +	trace_remote_iter_read_finished(iter);
> > +
> > +	return !max_events;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260812161340.2417322-1-vdonnefort@google.com?part=6

Do we really want to support !CONFIG_PRINTK? 

In that case dmesg/dump_on_panic should just fail to enable... but is it really
worth it?

-- 
Vincent
