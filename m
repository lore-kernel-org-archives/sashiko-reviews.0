Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18553C09E9
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 10:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530914; cv=none; b=XFaslZ4afZuPQGL1fQWvQFBZvQpiMUrsGG9OZhJ/5xrZpye4qmzGHHQl9kasL3duF9Q8C3CEpWDvIjReljEuR4D6A3pzVNziwYZf6TJ3bpAmstzVYuiVaT0qUclM99mA0bwh2Zl31UlQ0Q/BZ0TxBZ6rcVOYLBpaAV5xglOdVf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530914; c=relaxed/simple;
	bh=F8DUy8234kAgoD9DGMyKqrWBOur2Vit+0eofYS+10W4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMmLRZxf9wjZNeqSS3p3WEDhENdskgtxgqnKqfk2wrAp9MNs9mmuBOd8xwTO5gk+wGe015h3a3mZhL8ZrF8+o38EvJkF7IyvFOeATsusQ4WyUeuEat7s0AuOM5cyfJjMbCpT5MNmfPhIKV6I1Rl0IuoCGcd+cokOsQXcpDSJHcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHiDkWkA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHiDkWkA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47ffaa8ebbdso640569f8f.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 03:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786530911; x=1787135711; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3+xm+C1lqkauiE9SqCgUxPet+r2BY3i5/9ftLHHYjI=;
        b=gHiDkWkAumKFlLqh4oar7KyTWn2l3rCHiPEx7Tb31e45KL3F5X9qI12/Ku6ju/2kC5
         J1iTTNsnuAJCFfSKJwbNgG3ZwVWT14qj8UhNR6lBVHw+l5em1tM9y3liuBXp4WV1XJtJ
         VXc0bxfLQCo3Kows0NqCS0D6NCKUDJyea1wKc7GgjulqI6o5kjO/kVSBcSom2lQStZ9R
         o8zdh1YoIfdoLUqiwBc2uNTXKt8VJqZ3L//ew8cekyW2wKFsibpSvd8WaweJ+79M2B6r
         0fYu2YGiP465+8i+TrlQoMxSD1tQLWiVrfEeRHJu908bX305EhfesNB3JbUk7b1wNN7E
         gZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530911; x=1787135711;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o3+xm+C1lqkauiE9SqCgUxPet+r2BY3i5/9ftLHHYjI=;
        b=qU/iWBoXbI4b7ZzKGWt8sT0Zf1UAM0BqZTG/Bx/Iqz0h033/C0QzkzsLdy3Q8llW2g
         NwyvFtRpOvzHWpEJ/Sau8ipbuqwhPnMWOQALOYNvt81Ml5vkq9GVwet1GpvT1yjp/zad
         ku/tQEJijG6zwzhutKgQMaLVLZ23hgqFtytcYT7Sa4TVI0dz82v4ZUwhFJiG2YkVLArV
         hJPQ77bs0/rWXGXg1DPplMVAbZcvrcqmHZPC8tmC5zRabbeBWKspCB9/9Dbqq60/m3r0
         2hwGU12tGAcDaXjIgDlgkX876iIJj4tIJovvcoWrfK86EFOrd4s9eUGezLL+POkOLuzJ
         4dTg==
X-Gm-Message-State: AOJu0YypCSqPZAqJzt2o9gL6x1wifJLURWhk+5Vyb3sQXWJxgOVAH1sT
	BWVwfhIETmUwZVa3JfvidlcgpmDDL7Fk0cSw8vDcega/UpSauqAKLTMWDk+Lp2NZ
X-Gm-Gg: AR+sD13F9reeZGoyFl9bywiy7TGX6Jh9YGujCZJwcs/F+T7l+G7bnia0Q39Q7Q/3UK6
	3g21D6CX6pUUs6Fk/rPw/3OHW27UM82aR83LrpkuxI/RV5r62kZR9V0BlVx3C0gS0x4iAXzZnTP
	VkDFFLnRwdpjf1yjdWCrsZJSii7BDH833oKKsWiRRNjOax5jr/8wED7sCkUfhZ1NkqdTQzlXfrW
	1sjS5HLRdxXhKaxjINS3Em6giicKAZeCI4DxBtWVA2RjlgH4NMq6EsX45jNqp4zSjF3MHknWaOt
	lmGeqktGA6dkHxE+e0CJD/5WhYXApH6B4fWQssWtMR/us+XLy0MltxNugD2zFHMM3K2k6PuDoLn
	JT3WAcTNS4l+SLSJXfmO4huZai1rdTIeSLXyThR32dZAMtsYIkSvM9GRzTe0eMQegzvqGFwt1t8
	1xV7SmU2gKo+L/SSuYOUWHvhPWy28ad7yYsjb4cnpWHjCk/kIU
X-Received: by 2002:a05:6000:2405:b0:47f:f3fe:1ebf with SMTP id ffacd0b85a97d-481529012f0mr4963683f8f.20.1786530910808;
        Wed, 12 Aug 2026 03:35:10 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150bf5f0esm6004421f8f.4.2026.08.12.03.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:35:10 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 12 Aug 2026 12:35:08 +0200
To: sashiko-reviews@lists.linux.dev
Cc: Deepanshu Kartikey <kartikey406@gmail.com>, bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf/bpf: Fix data race in __perf_event_overflow
Message-ID: <anxMXBwCX0HCYgxr@krava>
References: <20260811235331.10044-1-kartikey406@gmail.com>
 <20260812000859.654FC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812000859.654FC1F00A3A@smtp.kernel.org>

On Wed, Aug 12, 2026 at 12:08:58AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Lockless TOCTOU race in perf_event_alloc() causes NULL pointer dereference or Use-After-Free during BPF program inheritance.
> - [Medium] Incomplete fix for data races and missing memory barriers in BPF attach/detach paths.
> - [Medium] Time-of-Check to Time-of-Use (TOCTOU) race drops valid perf events during concurrent BPF detach.
> --
> 
> --- Patch [1]: [PATCH] perf/bpf: Fix data race in __perf_event_overflow ---
> commit f63a2be5ceb79a2a8bb0263ba6723f7bf4ae763d
> Author: Deepanshu Kartikey <kartikey406@gmail.com>
> 
> perf/bpf: Fix data race in __perf_event_overflow
> 
> This patch addresses a data race where __perf_event_overflow() concurrently
> reads event->prog without lock protection while perf_event_detach_bpf_prog()
> writes it to NULL. It fixes the race by introducing READ_ONCE() and
> WRITE_ONCE() in the respective read and write paths.
> 
> Reported-by: syzbot+651d2774bd1d8395595f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=651d2774bd1d8395595f
> Fixes: f11f10bfa1ca ("perf/bpf: Call BPF handler directly, not through overflow machinery")
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> 
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> 
> [ ... ]
> 
> > @@ -10766,7 +10767,8 @@ static int __perf_event_overflow(struct perf_event *event,
> >  	if (event->attr.aux_pause)
> >  		perf_event_aux_pause(event->aux_event, true);
> >  
> > -	if (event->prog && event->prog->type == BPF_PROG_TYPE_PERF_EVENT &&
> > +	prog = READ_ONCE(event->prog);
> > +	if (prog && prog->type == BPF_PROG_TYPE_PERF_EVENT &&
> >  	    !bpf_overflow_handler(event, data, regs))
> >  		goto out;
> 
> [Severity: Medium]
> This isn't a bug introduced by this patch, but does the independent second
> read in bpf_overflow_handler() create a time-of-check to time-of-use race?
> 
> If a concurrent detach sets event->prog to NULL between the READ_ONCE() here
> in __perf_event_overflow() and the second READ_ONCE() inside
> bpf_overflow_handler():
> 
> bpf_overflow_handler() {
>     prog = READ_ONCE(event->prog);
>     if (prog) {
>         ...
>     }
>     return 0;
> }
> 
> Wouldn't bpf_overflow_handler() evaluate prog as NULL and return 0? The
> caller __perf_event_overflow() evaluates !0 as true and executes goto out,
> which unconditionally drops the perf sample.
> 
> Should the already-validated prog pointer be passed directly to
> bpf_overflow_handler()?

seems legit

> 
> 
> > diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> > --- a/kernel/trace/bpf_trace.c
> > +++ b/kernel/trace/bpf_trace.c
> > @@ -2018,7 +2018,7 @@ void perf_event_detach_bpf_prog(struct perf_event *event)
> >  
> >  put:
> >  	prog = event->prog;
> > -	event->prog = NULL;
> > +	WRITE_ONCE(event->prog, NULL);
> >  
> >  unlock:
> 
> [Severity: Medium]
> This is a pre-existing issue, but does this incomplete fix leave other data
> races in the attach and detach paths?
> 
> Other functions like perf_event_set_bpf_handler(),
> perf_event_free_bpf_handler(), and perf_event_attach_bpf_prog() still
> perform plain writes to event->prog without WRITE_ONCE().

was wondering the same, the perf_event_detach_bpf_prog is called for
tracing events (tracepoint/kprobe/uprobe) the perf event release goes
through perf_event_free_bpf_handler, check perf_event_free_bpf_prog

jirka

> 
> Additionally, does this need release and acquire semantics? If the writes to
> event->prog and event->bpf_cookie in the attach paths are reordered by the
> CPU, could the NMI handler read a valid event->prog but a stale or
> uninitialized event->bpf_cookie?
> 
> [Severity: High]
> This is also a pre-existing issue, but does the lockless access in
> perf_event_alloc() create a use-after-free or NULL pointer dereference
> during BPF program inheritance?
> 
> During fork, perf_event_alloc() inherits the BPF program:
> 
> perf_event_alloc() {
>     ...
>     if (parent_event->prog) {
>         struct bpf_prog *prog = parent_event->prog;
>         bpf_prog_inc(prog);
>         ...
>     }
> }
> 
> Since this accesses parent_event->prog locklessly, can a concurrent
> bpf_perf_link_release() clear the pointer? If the compiler reloads the
> pointer after the check, bpf_prog_inc() would dereference NULL.
> 
> Even if it is optimized to a single read, perf_event_alloc() is not inside
> an RCU read-side critical section. Could a concurrent detach finish its RCU
> grace period and free the BPF program, causing bpf_prog_inc() to write to
> freed memory?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260811235331.10044-1-kartikey406@gmail.com?part=1
> 
