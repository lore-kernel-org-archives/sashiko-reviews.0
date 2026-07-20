Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C320A3C3789
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 20:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579515; cv=none; b=iE69u7eALVk5OMjfJy2rdSLAXtZPTg7VCTce5omcfpLZfWWJYvWAbJ5YCbOllt/sgpZydHgdVYV6qLuFvfw/l0E6vok8cuG5CYHwsriua48YBTMmcMr9U/2SuRKRFACq1MKrT/sUIlPivX9ZPobvBaEnLH7u6xUY9Oxqw8/Q9TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579515; c=relaxed/simple;
	bh=f4K2JHkH7YesiWyruH0a3wB46th1Cd4Vvj3ogNzw8Xc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZOFgPuCVDPBI3AUr4YxsABukmDe4u3AXHG9uIJl4+CJWhGcEcBQSZnHXGy/ebrVTzx4G384goSRfwf+FH4Ir082b0QinC9i1KbwhJz92CZmOx5oqp1ZfaVE6Oi38MwE6QuMnzLh5U8Cy5JpxNI5VgVfznBTRqF1p98jxQS+Lr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HT47Hu1k; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HT47Hu1k"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f752b3423so1310542f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 13:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784579512; x=1785184312; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S1hckvG9d2gbl7dZ+d7litWhzw8X9kuM0+KwuQKju8Q=;
        b=HT47Hu1kbVhybdz5lrJLtLjWEtkV6jhpgBU2upVWJwNg5rr1+/805RM2o57NTpRey/
         IUn7K/7ty296FyYd4Uc/gVLwt7B5a7KUMixIWGHfVg1pLwND6WD1KXEhG7kpWPla7SDM
         AsL1xSKpdd/8voRkLjsIFLdmD5uAWdpqHF9CNjhTNpFvJonb9FxH8T/d2OoCZoUE7Zy8
         ArodVOoHRSBhGr584r/MxJWcuyUlJlS0uEtcqHRRF9o3Dz0lq94hc7bJ1urSAQKkpfnE
         N2oEoIOyhQKSpACUAhRGqxEXOg8wG/gfgDhxFJzjjchTB6PDwoUDyyuN9OlscmjugR2C
         IjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784579512; x=1785184312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1hckvG9d2gbl7dZ+d7litWhzw8X9kuM0+KwuQKju8Q=;
        b=CDmdGA1A55SfF6uUT5PwhaZk1Pab059A7DFka/gpG16GK5X3R/VqEyjNePCYzhILbW
         nI+xG7x6snUCV7WayRFAcReH28kyW1Z5gDunmRI7Lki+/12i/VC+dzq7rbtdfpCNZWfw
         q2abfNtK4zkGgeTKkOKu7MLR7qWzfEqG3/60Jk/OxqTmAbgjqjiJRBvH980W/96W2Att
         Q8/VhG4QqP51R8ebpAujW+1tVKEbR9N7TuyAUVMuHvud4bMqiG3cVTRqpNtR0BMlGbFx
         lg6fElMUojmTmtfMFbEzkW4Y0ewEnZmj24GDYcNAObFrjAVI702tMx5qKwS6ouUzg4O7
         PknQ==
X-Gm-Message-State: AOJu0YwT1vYxbcBL0R0vdTe6ot9rmRev1I4dPWPsQhrpez/2mpcu05sO
	LAJBCdzRHmHkcRm2IxWqxV4gDKevAxbO1vMINF1AmTQCjv06zsX99YMUfcIN+/mr
X-Gm-Gg: AR+sD11Yt5+9y66zP8Uka18tQveL3KPxJ6WVJ9iNaaG/lE0gz0nlMSKisXL+L3+FcjJ
	ecLh23+op6lAtYCP1Ipr0zFwFQmd8N5viDBl1eylRyzyVqhZkMJOKZ+4dduDh2ygYo0l2EHaWig
	aehRdBGNY/uTdDUf6bg4xthikTNwP0wQgaOG6qlgSCd51KWhEodVYPxH/hUK/xL2mUJjmGGOeWo
	oQNE52l6pv48vXLVU+q7TFcF4qUWbns/4SCfxc3Ojvo/pwQLZrDR8+PQLdzl4GdnT5uCodVfaBM
	281ht7Q6uFPAxxzN1Tr2VHRyEVQtXwuVsOzQyvizr1hrIJmiFEWGZHvefUY6CnECWXG3dfDWemX
	wchjQVZYW49YT2WQgQx76f5MtZnFXrUnvIVbQbNzvwwmRDMdeqU9pYYxZvXgLaof83g==
X-Received: by 2002:a5d:5d03:0:b0:47f:72b9:77fa with SMTP id ffacd0b85a97d-47f72b97ae4mr9747923f8f.7.1784579511907;
        Mon, 20 Jul 2026 13:31:51 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7f55sm29329407f8f.18.2026.07.20.13.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:31:51 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 20 Jul 2026 22:31:49 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 7/9] bpf: Factor callchain_finalize function
 from __bpf_get_stack
Message-ID: <al6FtZ69J-129Ytz@krava>
References: <20260720085351.655075-1-jolsa@kernel.org>
 <20260720085351.655075-8-jolsa@kernel.org>
 <20260720090811.1651B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720090811.1651B1F000E9@smtp.kernel.org>

On Mon, Jul 20, 2026 at 09:08:10AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Sleepable BPF programs calling bpf_get_stack() or bpf_get_task_stack() can corrupt per-CPU perf callchain buffers and trigger preemption warnings.
> --
> 
> --- Patch [7]: [PATCH bpf-next 7/9] bpf: Factor callchain_finalize function from __bpf_get_stack ---
> commit a181c39a42a0e8c840b9a2a09b02e1efa512170b
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Factor callchain_finalize function from __bpf_get_stack
>     
> The new callchain_finalize function calls the build-id retrieval
> (if needed) and zeroes the buffer.
> 
> > diff --git a/kernel/bpf/stackmap.c b/kernel/bpf/stackmap.c
> > index b990643f25cd8..eea7b781300ca 100644
> > --- a/kernel/bpf/stackmap.c
> > +++ b/kernel/bpf/stackmap.c
> [ ... ]
> > @@ -827,18 +840,12 @@ static long __bpf_get_stack(struct pt_regs *regs, struct task_struct *task,
> >  	}
> >  
> >  	trace_nr = callchain_store(trace, buf, size, elem_size, flags);
> > -	copy_len = trace_nr * elem_size;
> >  
> >  	/* trace should not be dereferenced after this point */
> >  	if (may_fault)
> >  		rcu_read_unlock();
> 
> [Severity: High]
> This is a pre-existing issue, but can sleepable BPF programs calling this
> function corrupt per-CPU perf callchain buffers and trigger preemption
> warnings?
> 
> When may_fault is true (such as from bpf_get_stack_sleepable or
> bpf_get_task_stack_sleepable), this code relies on rcu_read_lock() earlier
> in the function. However, on PREEMPT_RCU kernels, rcu_read_lock() does not
> disable preemption.
> 
> The earlier call to get_perf_callchain() eventually reaches
> get_callchain_entry(), which relies on smp_processor_id() and requires
> preemption to be explicitly disabled:
> 
> kernel/events/callchain.c:get_callchain_entry() {
>     ...
>     cpu = smp_processor_id();
>     return (((void *)entries->cpu_entries[cpu]) +
>             (*rctx * perf_callchain_entry__sizeof()));
> }
> 
> Since preemption is not disabled during this sequence, can the task be
> preempted during or after fetching the per-CPU buffer, allowing another BPF
> program on the same CPU to overwrite the buffer before it is copied by
> callchain_store()?

we disable the preemption in patxh # 9

jirka
