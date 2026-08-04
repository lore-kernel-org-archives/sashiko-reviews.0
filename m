Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E47538D41A
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 12:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844940; cv=none; b=M4xyKrTlwT25UI8wdLFgr5BrVTtnkH+VRQprVU/EWW9IR1DRmx5mjOeLYPnKFjSlJ4Ll2+aSNWluoiRojlhppJ+xNd/SzANxu/ViF7NFY49ylHkn2ANaJU6brJdKwDHZbAUcnrmmA9MeGHGjDUaPHVqxVSum4tna/3YuPYefG+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844940; c=relaxed/simple;
	bh=lSLc/k70UPCCdOzCh8NUIoUpWf75XpOu624nl05a5Wc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBVAdpH/RRgQ4uqj0y3r7TkaVo0rfX4BvWOdrqrthejeVpj7nxv2KfyQTL/txCSnKGKBnNwfeH1gQMtRPAqxvSmUt6hDkQUIyg8t7J+zxRwoBUeVLk57lbgBrHuD7hUH+CEdGA054r8/PsmL0NvsfAVJiCkgR91/z/KbQqWxwZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctj/SDST; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctj/SDST"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1f758014b8so392303366b.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 05:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785844938; x=1786449738; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SR8sWBi7icKINEBquF/kdhx+8pyyU169Pg6sxLELmQs=;
        b=ctj/SDST1W14C9UK/YjnH1bNMvNgebsjH78aTGFhR6Z9xEZt54C1LtrM4Pkg4kX7Yr
         vADaNXDVLLZ8hjYjoHQmNS83/JNKeF8XXv+c2GilGrH9AAwzPCfdWfNzdfu9g6j4hXzM
         ckA92ox7ipHejQOmvb4lF4wOPmDhda5BJ/66bF45ZOZWYsSw8CjOih7FejbDUyhndoMS
         PdsyymGANeTLGRC2C22kvElViAtjsu6Ggre/HZmpRy4dHH1sL8EG+zTgG9JlhH/AORZ2
         0HzRt0+z0OyjkNQIvcaPp9LECisF24nXKu+CY+MQzyMnzSvO+drzf67D+p0/HMdNe3le
         NgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785844938; x=1786449738;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SR8sWBi7icKINEBquF/kdhx+8pyyU169Pg6sxLELmQs=;
        b=oCTZP4QljgQ9SN8wMnYWtYlj3Dj+dPe5SMfWx4FFYjGZLYnCCBKDPcndSNNNNa29SU
         2Cu998F+DHXz3vw8luxiFIKHZ0qCbqv3YK9DdGvXi6YFUJs09A1MFryR3IS1ZjlHPVFV
         k+QcTDcEcuNIl7+AW0GqkAxLLtae284t18oAO2IZqJxESf6wdiGbmfshv513nPEwiDHn
         SLqu4nBCR4VNyr9C7qwcku3VLqie0SCcQW9bY5snqKoWbQ9ik0S1xMy000cvBqx/zWEx
         OFPbkbmZJbHmGs/0Z9SNzSCzM2H30ljghl9SH0OrvnpwwH/XxL+wENN5EE2XBFAvu8Om
         /A0Q==
X-Gm-Message-State: AOJu0YxkRRe/OtNH2eO7NAuMSZRKhfn/EV3mRlTDm7tHxSwgSfzoEsGw
	UpaVrAXifmKgoS82O7rODc5kEQqX4bKEcRObcmJ6VP7lpGKkdIp2OKy7QQzkGKPz
X-Gm-Gg: AR+sD11o7j+sjGHgvZbvy3ydeTNjOz9YPOHNtOTZme2+coP9bQFuNHgd/sK4mc5U7Zh
	5DVmm0uxyZf94sZukgDHQbWNlhEW/BYI51wPKi9IUdRCQAWMrwVavMsbn/rL2Hopj85nzoynWNY
	w4t98KpNUhUsFSSk1ZD41ygQa6y7unqijJeGQsCvTMYG6FjJkPlKePW119Qy1fG/0eVJXXz5lB7
	TJeZtKGC3VBnc1kevmrIdlWdLxelKflaXltgxNCgtN11/sFKsXEnwMCWumGZN090A36WfFxXK39
	GEbFbVHRU4vW1iSwU9rS2bYONeAMWizssCqgocPdM5OLy91HdS4Q/SGtc5EiqdM0OesqhT2IgQe
	AY20oQwKXefuaNM13D1wAvqTQwEJrRPLYXd4j6Lve+k0eta5BIdg5D/hP0K000VVUqwNp78mcm5
	TjxnQc7e+UcJY7ydyEzhnJU+uF5sdfIC4nf+WsliSr2axgwZU=
X-Received: by 2002:a17:907:9615:b0:c12:b225:bd0e with SMTP id a640c23a62f3a-c202d90adbamr165621966b.9.1785844936918;
        Tue, 04 Aug 2026 05:02:16 -0700 (PDT)
Received: from krava ([173.38.220.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd450d71bsm639710966b.46.2026.08.04.05.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:02:16 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 4 Aug 2026 14:02:14 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv3 bpf-next 06/12] bpf: Factor callchain_store function
 from __bpf_get_stack
Message-ID: <anHUxiuMInjr6Zuj@krava>
References: <20260803210149.296496-1-jolsa@kernel.org>
 <20260803210149.296496-7-jolsa@kernel.org>
 <20260803213050.8EF301F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803213050.8EF301F00A3A@smtp.kernel.org>

On Mon, Aug 03, 2026 at 09:30:50PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] A Time-of-Check to Time-of-Use (TOCTOU) data race exists in `__bpf_get_stack` when used from a sleepable BPF program, allowing concurrent modification of `trace->nr` that leads to a massive Out-of-Bounds (OOB) memory read and write.
> --
> 
> --- Patch [1]: [PATCHv3 bpf-next 06/12] bpf: Factor callchain_store function from __bpf_get_stack ---
> commit 1569be7d337e247b4d7eb8620dff965cc57a3fc6
> Author: Jiri Olsa <jolsa@kernel.org>
> bpf: Factor callchain_store function from __bpf_get_stack
> 
> This commit factors out the callchain storage logic into a new
> callchain_store() function. It handles extracting both just-ip and buildid
> data into a user-supplied buffer.
> 
> > diff --git a/kernel/bpf/stackmap.c b/kernel/bpf/stackmap.c
> > index 463f94ba1cc47..e51e03c4b60ed 100644
> > --- a/kernel/bpf/stackmap.c
> > +++ b/kernel/bpf/stackmap.c
> [ ... ]
> > @@ -680,6 +680,29 @@ const struct bpf_func_proto bpf_get_stackid_proto_pe = {
> >  	.arg3_type	= ARG_ANYTHING,
> >  };
> >  
> > +static u32 callchain_store(struct perf_callchain_entry *trace, void *buf,
> > +			   u32 elem_size, u64 flags)
> > +{
> > +	bool user_build_id = flags & BPF_F_USER_BUILD_ID;
> > +	u32 skip = flags & BPF_F_SKIP_FIELD_MASK;
> > +	u32 trace_nr, copy_len;
> > +	u64 *ips;
> > +
> > +	trace_nr = trace->nr - skip;
> 
> [Severity: Critical]
> This is a pre-existing issue, but could this unprotected re-read of
> trace->nr lead to an integer underflow and out-of-bounds memory access?
> 
> If __bpf_get_stack() is called from a sleepable BPF program, preemption
> is enabled. Between the bounds check in __bpf_get_stack() and this read,
> the task could be preempted. If a preempting task running on the same CPU
> executes a BPF program and reallocates the identical per-CPU buffer, it
> might overwrite trace->nr with a smaller value.
> 
> When the sleepable task resumes, this re-read of trace->nr could result in
> a value smaller than skip, causing trace_nr to underflow and resulting in
> a massive copy_len during the memcpy() below.
> 
> > +	copy_len = trace_nr * elem_size;
> > +
> > +	ips = trace->ip + skip;
> > +	if (user_build_id) {
> > +		struct bpf_stack_build_id *id_offs = buf;
> > +
> > +		for (u32 i = 0; i < trace_nr; i++)
> > +			id_offs[i].ip = ips[i];
> > +	} else {
> > +		memcpy(buf, ips, copy_len);
> > +	}
> > +	return trace_nr;
> > +}
> > +
> >  static long __bpf_get_stack(struct pt_regs *regs, struct task_struct *task,
> [ ... ]
> > @@ -737,21 +759,10 @@ static long __bpf_get_stack(struct pt_regs *regs, struct task_struct *task,
> >  		goto err_fault;
> >  	}
> >  
> > -	trace_nr = trace->nr - skip;
> > +	trace_nr = callchain_store(trace, buf, elem_size, flags);
> 
> [Severity: Critical]
> This isn't a bug introduced by this patch, but this is the preemption
> window mentioned above.
> 
> The check if (unlikely(!trace) || trace->nr < skip) happens right before
> this call. For sleepable BPF programs, preemption can occur between the
> bounds check and the re-reading of trace->nr inside callchain_store().
> 
> Could we cache the validated trace->nr value (e.g., using READ_ONCE())
> and pass it to callchain_store() to avoid this Time-of-Check to
> Time-of-Use race?

there's preemption fix for this later in the patchset

jirka
