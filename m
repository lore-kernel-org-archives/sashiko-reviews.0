Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B192041DEDF
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413074; cv=none; b=hqH6BZgIyyL9tH3KAi1noIHPho6DspZhyIfJjpeCApMuFE3HQ1DB8QxnbhLbVUWvYUcMEVYknhjKw62uM+beDSXBsrsyZ4+jHAwMU+3eXuHwSQUc0t4zPrwrLc3fxo8YhWWUDKgplDquPKyp8M6FxTJxMIBZGu6M/QVsnwORLWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413074; c=relaxed/simple;
	bh=cKmqzTqs0Jyzrl34OxYOUJ90MaOo1NVFVkpakKU9u1M=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzEtSLwWbQEA9gbxLXtHdMJb5Bw8PA/ltX7zajd0wNKryVfs8Lklr3MauhjRUUafdCwiVcv2rkGuN+zjjXJVtgYCHjTkJJReVLydFRWg2hDyW2uqoWGQ3BBJqPPYdxyaGPC8haCLCpSMxofZQtG5O6m5K4gxa0PMobp19l7+0eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrQekI3N; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrQekI3N"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1c24ec9525so348217066b.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785413071; x=1786017871; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gWFPRxQmEK90wNUczUJI1RL1AES35AvdzEJnsivbX3M=;
        b=qrQekI3NavK3DzF65Tmr+x1/FxwzIFgWCpRNIRj6QMA3C+EHMSNYc9JpeRW05cvuEG
         1VqlTvuM6Apl/fdtZY3ZAmrHIhDz/T8Ruu//pNPSiQ05Ke6ikEdZgDsCKFCAE13UFRZl
         UII5AtJzMtPBLhzkemEf+sXx/d+piMt9goezJntVdAloWKtudvcS3fYC4GdQkuqu5wsM
         4Bje2Z35ydsFRqq3W2xidnDk+t1ryluNN+e9ZoVp7ibgvr5Bjh1Cd2VVxslSyww7oJgs
         AS+xRPBPQddxX5KbZv9ypXXxlpamqhyRJG7UKhmmR1OiaGybADrScyAL4xN5U2+69Zp6
         iinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785413071; x=1786017871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWFPRxQmEK90wNUczUJI1RL1AES35AvdzEJnsivbX3M=;
        b=Lzmms0SuaYS0M/F7yw0vKiZ0KZKpbyTvt/q6gKL+g+NCV6x/Og4XP655ctbBKLpsp7
         1po9/hwTeOpz5z4d34sujQtuJYT0BrH29uV02+4NmTE8vqdXUjLGNH5Eo2FWitKJ6Dwp
         Wfc0V0Hsx/bfhxswAPiY8VuXOmD3Mq98Y0lsyQp1ZSRXgVrlNNLfy/FHD4jT10fcfVBu
         WVg3qD+mALlHzrIRqgCd2KaTGRH3LrfNrachzTVK3JF0FkRUnjo2eUN4a4gTowL+CxlB
         5JSROxiiqcJhax7nwbTA81ukLgNRBGE5v9qgeviyEGJfig9RYOEVo0S4C7vgI0NWGBO8
         b1WA==
X-Gm-Message-State: AOJu0YwJoFM8hGPcAXva6ctO4NhgXNisPf8CYe6/uvxH4eGdfbirHexU
	ka7fD/scYVP724L++1gtNlk7SNgDkSQMyT7VhAAKpABDRzhrKUVKzpZ07NOtI0NX
X-Gm-Gg: AR+sD12cQ7aHB2dXupYaZa3T7g7ryzQgGxFrc90xqOa2GMHqo5bkrR5ByS8p6IjtPc7
	ntuhxXHfZ8RONMP4pMiISJSujtJ9kUiKC/3UYHWS0uXthf0dy2BN7tYwjpMqKGzty3VLDyOY6ft
	ZHjssaaFMon/hBB+kw+XbjCbWxCsyWXjXu6sHEFFqdJ+MlALeCYd0ZeA/5dXnWud0hQi9JKbYQt
	bNGqBpcdKfLalpu+80Heo1bSAiE2tHQ+oBxcBPynW07keCurTNZunUGoDud1jihBu9kAqPYKCc6
	6vfQxe2v2LEJrkiIH9W7Qhyo1buL1znRAJfXtXgPEbDHeqGxU7V+/zBPvtq23lQyys7qW5tgQPc
	A7m5fa5Zp9Zu9G+11tFmVmUIuMtiaFYMjxKG9ei9RDw/co37rdYgzf62OVoYl8tapCc0AegmxS5
	yaGJHNFW9GOJKjHwZunyzr+ZCZ5MSE3GOjGq4DVVcxczo92zo=
X-Received: by 2002:a17:906:7955:b0:c1c:6e35:aca6 with SMTP id a640c23a62f3a-c1fa5789eabmr130923566b.51.1785413070647;
        Thu, 30 Jul 2026 05:04:30 -0700 (PDT)
Received: from krava ([173.38.220.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bf211fsm60035866b.57.2026.07.30.05.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 05:04:30 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 30 Jul 2026 14:04:28 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv2 bpf-next 01/11] bpf: Factor stackid_init function from
 __bpf_get_stackid
Message-ID: <ams9zOlhHI72-Kfs@krava>
References: <20260729083807.1588544-1-jolsa@kernel.org>
 <20260729083807.1588544-2-jolsa@kernel.org>
 <20260729085136.9E9B71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729085136.9E9B71F000E9@smtp.kernel.org>

On Wed, Jul 29, 2026 at 08:51:36AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] A TOCTOU race with `sysctl_perf_event_max_stack` causes an integer underflow in the `max_depth - skip` calculation, leading to a massive heap buffer overflow when copying stack traces.
> --
> 
> --- Patch [1]: [PATCHv2 bpf-next 01/11] bpf: Factor stackid_init function from __bpf_get_stackid ---
> commit 94626e7c900d701c2d2326e06f48ebc28e1f6e93
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Factor stackid_init function from __bpf_get_stackid
> 
> The new stackid_init function stores all the necessary bits for stackid
> trace and it will be used by other functions in following changes.
> 
> > diff --git a/kernel/bpf/stackmap.c b/kernel/bpf/stackmap.c
> > index 41fe87d7302f2..0eafe55b18289 100644
> > --- a/kernel/bpf/stackmap.c
> > +++ b/kernel/bpf/stackmap.c
> > @@ -504,33 +504,54 @@ get_callchain_entry_for_task(struct task_struct *task, u32 max_depth)
> [ ... ]
> > +static int stackid_init(struct stackid *stackid, struct bpf_map *map,
> > +			struct perf_callchain_entry *trace, u64 flags)
> >  {
> >  	struct bpf_stack_map *smap = container_of(map, struct bpf_stack_map, map);
> > -	struct stack_map_bucket *bucket, *new_bucket, *old_bucket;
> > -	u32 hash, id, trace_nr, trace_len, i, max_depth;
> >  	u32 skip = flags & BPF_F_SKIP_FIELD_MASK;
> > -	bool user = flags & BPF_F_USER_STACK;
> > -	u64 *ips;
> > -	bool hash_matches;
> > +	u32 max_depth;
> >  
> >  	if (trace->nr <= skip)
> >  		/* skipping more than usable stack trace */
> >  		return -EFAULT;
> >  
> >  	max_depth = stack_map_calculate_max_depth(map->value_size, stack_map_data_size(map), flags);
> > -	trace_nr = min_t(u32, trace->nr - skip, max_depth - skip);
> > -	trace_len = trace_nr * sizeof(u64);
> > -	ips = trace->ip + skip;
> > -	hash = jhash2((u32 *)ips, trace_len / sizeof(u32), 0);
> > -	id = hash & (smap->n_buckets - 1);
> > -	bucket = READ_ONCE(smap->buckets[id]);
> > +	stackid->nr = min_t(u32, trace->nr - skip, max_depth - skip);
> 
> [Severity: High]
> This is a pre-existing issue, but can this max_depth - skip calculation
> underflow?
> 
> If a BPF program is attached to a perf event using bpf_get_stackid_pe(),
> the callchain is generated using the current sysctl_perf_event_max_stack
> limit. If an administrator concurrently reduces sysctl_perf_event_max_stack to
> a value smaller than the skip parameter, stack_map_calculate_max_depth()
> clamps max_depth to this new smaller sysctl value:
> 
> kernel/bpf/stackmap.c:stack_map_calculate_max_depth() {
>     ...
>     u32 curr_sysctl_max_stack = READ_ONCE(sysctl_perf_event_max_stack);
>     ...
>     if (max_depth > curr_sysctl_max_stack)
>         return curr_sysctl_max_stack;
>     return max_depth;
> }
> 
> This would cause max_depth - skip to underflow into a huge u32 value. Since
> min_t() is used with u32, a large trace->nr - skip could be selected, which
> might exceed the stackmap bucket capacity and lead to a heap buffer overflow
> when copying the stack trace later in __bpf_get_stackid():
> 
>     memcpy(new_bucket->data, stackid->ips, stackid->len);
> 
> Does this sequence need to be protected against sysctl changes between trace
> gathering and max_depth calculation?

not possible, replied in previous version

jirka
