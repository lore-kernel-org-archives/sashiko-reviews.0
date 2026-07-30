Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B36423782
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413083; cv=none; b=aV+d8cacwfA04B4QfRFvEfiVUmpkchmL182B2y+O9WU55/jEU2L3vQrWdUNMMMWpdH6cYj8OU3kAXS71h4xWFWL9inni+ZL+uZNP6AVE2ya8Ow4mFAzKlaNrxFShO2bOGXoeoB1CRjKYOiqSfqNDloQZCA59HGI5WZZki4QcPVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413083; c=relaxed/simple;
	bh=swNwDuiSlUIFh0rZIuggEAW2FHZ3l+1i3bs6O3kepFc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TITGdVTyOFaQJ7Mh9PlHM56fTwYPSLcPap745A880QUz4/hxkoQOt/YrxfTOr8/oiowta2MZe46vItLFlW7bydRkVkiwoE562e7mAOT+zaUR5auNbw609j/5plYxKIWMYm1Dm8WxsxoZfmdhFsIkbGJLlyyXZlMrSzWfDCT7zWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKs9ug68; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKs9ug68"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15e03c2763so140470666b.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 05:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785413079; x=1786017879; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CNZCm+GVCrWjZ/ClkG+Tb1xe1AofW8D8PhoCoqHKjH8=;
        b=QKs9ug68sRS10uftleZtHrLmqzDdvsMLEm81yYie8Rzj2y4+Uh5kx5/WK+ElwiT6ln
         FDX1eVGEjGquZon4suMiyxv7qTTYT5zNFn53E4EvI+DYwJ7y1hqKxWhEXmNSnWgo+TZZ
         n96PQxnPwCaQSYkYK/p8lF1D4MxdT7suGz8gkj+e86rnDTFireZK/wkPOjsasrJnhPfS
         apT4QLX97H1BaaydJEVTgHYPL+1qCLrBjncqvyJQkfbAQ+dDGFHHxsafx9CDWS3K9Yp/
         yT9acDeD67yWDVlwoh8yIMuDDEX2pcHkjjv6IbqU3E5xZ5un9UjQhETOZV7UGQji+vKn
         IjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785413079; x=1786017879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNZCm+GVCrWjZ/ClkG+Tb1xe1AofW8D8PhoCoqHKjH8=;
        b=eVtYQ83ds0kJsO3VNLUIwgrQid+z8SKd5HVpXbucQSBvd6mwSEDyatgutuAThorgZi
         0HkZvfhbof8R3RGG3ak59YwVHmBJ5T1oWSqy5HZt/3Bngwesy+7jI2/rJVtKiog43Knx
         jinVBBVnNhH0t6EAywQih3e6Q6qjrDmG4JlAztUx1meFzp55Rmg+8x8YKIoXmeX7L7N0
         hlS1lh37TDzkH91sBmGNz9MZuuuL0yZ9AC4QkGD7e0eiOF7pajLAFHQBuxGxJlw6W+2p
         DJuAlnd9+Vg2f/CPdG0agv2oGJamtzWcUx7+V1gWHdBFtYq0H0vDsQGc3O/L8k1r+Q1s
         fcSg==
X-Gm-Message-State: AOJu0YzRbCumR5oWErxP+JG0eQxuATwQvpr4GHX9T0QaMZ6o6AJPlOKU
	16GBrWLiQi/xsGCWdiKW/IVKc8iB0oMTPa5CvfO4Ae3tX9fdC6K+MB3NJln6nA/F
X-Gm-Gg: AR+sD10DA2PsiTPbHx94FhMe7p0jng+FCJcVcr0NaKlmq7aCTubB++uxVxrPKEwQrBO
	oB8hr0YjMG3vD4eT8L0ojB8VFv2zFdppKvq/mACc4NNYWJbI4w13o6ha/Yi1qV6Eb0ad+UCVLds
	B0seSnhCY71WPQJyr/vQ/sAYlfQHVAcqjYW/8S3VTmaZOs9PRYeC1kSd9oGPK5Ntt8LAojr2aRs
	I/t2qma13PF3o1Q8yBmM01eany2Zqv4PZnBJBuETdpHf8FrMFvK/BRJv9dgtqi8JtM5SQxeSFxL
	clK5tgaLmXeVN9A37dUPJ6DqnKBuYNqmdu9lD65QhWH8pH93saod+unL7nCQAHgkkIorx9bJq3i
	L8T6kd9h2U6ptn8ejEIWnf72BwtI82OtRi0loeGteRJglctvnYTOVjtNkypmtKbUcCVe4aq6sic
	120ruebi134Vet9l4XPov7P1JeAhFB+OFEWhkPT6umphOSRjQ=
X-Received: by 2002:a17:906:478c:b0:c1f:ba1d:805c with SMTP id a640c23a62f3a-c1fbd30ae5fmr5937666b.19.1785413079317;
        Thu, 30 Jul 2026 05:04:39 -0700 (PDT)
Received: from krava ([173.38.220.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa857800asm61245466b.16.2026.07.30.05.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 05:04:38 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 30 Jul 2026 14:04:37 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv2 bpf-next 06/11] bpf: Factor callchain_store function
 from __bpf_get_stack
Message-ID: <ams91eMxUuXsJd7P@krava>
References: <20260729083807.1588544-1-jolsa@kernel.org>
 <20260729083807.1588544-7-jolsa@kernel.org>
 <20260729085751.96C341F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729085751.96C341F000E9@smtp.kernel.org>

On Wed, Jul 29, 2026 at 08:57:51AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Preemption can cause `trace->nr` to be modified concurrently, leading to an integer underflow in `trace_nr = trace->nr - skip` and a massive out-of-bounds `memcpy`.
> --
> 
> --- Patch [1]: [PATCHv2 bpf-next 06/11] bpf: Factor callchain_store function from __bpf_get_stack ---
> commit 41f5133836d848295ac407c006940d4f0641b50f
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Factor callchain_store function from __bpf_get_stack
> 
> This commit factors out the callchain storage logic from __bpf_get_stack
> into a new callchain_store function. The new function handles both IP and
> build ID data copying.
> 
> > diff --git a/kernel/bpf/stackmap.c b/kernel/bpf/stackmap.c
> > index 41fe87d7302f2..18d1a10bf76e5 100644
> > --- a/kernel/bpf/stackmap.c
> > +++ b/kernel/bpf/stackmap.c
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
> This is a pre-existing issue, but could this calculation underflow if
> trace->nr is modified concurrently?
> 
> Looking at __bpf_get_stack(), when called from a sleepable BPF program via
> bpf_get_stack_sleepable(), it calls get_perf_callchain(). This allocates
> a per-CPU recursion buffer but unpins it by calling put_callchain_entry()
> before returning.
> 
> __bpf_get_stack() then checks if trace->nr is less than skip:
> 
> 	if (unlikely(!trace) || trace->nr < skip) {
> 		if (may_fault)
> 			rcu_read_unlock();
> 		goto err_fault;
> 	}
> 
> If the task is preempted immediately after this check (which is possible for
> sleepable BPF programs under CONFIG_PREEMPT_RCU, as rcu_read_lock() does not
> prevent preemption), could a new task on the same CPU trigger a BPF program
> that reacquires the same level-0 recursion buffer and overwrites trace->nr
> to 0?
> 
> When the original task resumes and calls callchain_store(), it re-reads
> trace->nr. If it is now 0, wouldn't 0 - skip underflow to a massive unsigned
> value?
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
> 
> If the underflow occurs, would this result in a massive out-of-bounds memcpy
> that could overwrite the BPF stack buffer or map value and cause memory
> corruption?

the preemption fix comes later in the patchset

jirka
