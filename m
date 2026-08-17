Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76113F4DE1
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961696; cv=none; b=YMPEgHCOgEsY1FVgt/O0K/5JaU3jYKeU7SQYnOgfOSXNo/gl9GLDgqNy/vjxUUNCkb+J6B2Cc+kHJKd3NDZXERbCdnWj6ad6kA6J+U9BaOLe42+r4lutENEztna7Qo3l1pVzr+tuSFclROs2h9V1TN8WaCH38RV9FPVaq1MrQ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961696; c=relaxed/simple;
	bh=jEtdv8cixT4yT8CUzlCKJ298vzSvS3wb33Tb68PE/XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzD+X30MIYKqkIb43KItUVl4iv32vHBSnIRvWzEIL+L2MdhR4gyFVT+k1Va0V4/IuQK5XI4adGq1nMkqkf+A+sqbGZJFAZVZ7I84MbYGIz9EKK0/wdbqnj4SrD/zGsTB8MiPo4mrZK4sOzChV4s33r8r3CiQ57dWOemGWdkqNEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jvr4UZsO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jvr4UZsO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4957eefd361so24408985e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 03:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786961691; x=1787566491; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WkV77Z8Ixwaqf7EeDyRNAP+C+NWCpS3WdahE3ARQznE=;
        b=jvr4UZsOKna/Mm7S2rQLLO43/hhKzv8HemOpGogeI9SdhTf4XvubfJxUqHsicYQMXv
         y3Ztxn8Tb+7kWeXPxjxBA3OTVCQkwUXckaevnwvstlCdb/tG4K4z2s9aY5GE6FyGWnSv
         DMkMFsfK0O9Lrso8cjgyTP5uz2Jgo1AKDYgUBDOvOyjXc6yA5oDvPunuvBeEoe2Ttbdh
         Ky9NxiAr9bUwa0wfX3kur3BnL6yY+0lh9NLYygOd2fw2du1t+lOlfKYR1i5CO/rQ3cuJ
         ZoaiMiZ4cfxP2JGnaTSxuAaYqVSQMq6HNEGzY84mOGvq38fnhFLGyM6OvWudf8hRRYim
         NDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961691; x=1787566491;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WkV77Z8Ixwaqf7EeDyRNAP+C+NWCpS3WdahE3ARQznE=;
        b=Nu3F+7AeJRqeTEBKAeKnmGCCTgaC25TmoOhUoOwaPyq+WGCjpN3suoF8x3kdMTsjGC
         xt/cooc0WlZq6obvJSyyE1VQCE82cKqo/dS9BVP53EWRaCr4GBVyYJ8HLrTcWGcWLBYw
         6Gfraoc4L4G1a0vhR1l8W+EwEHffXTnISpTiBv48GCsuetG9cbLi0DtSWaTSW6+N84AS
         BsRO3SVAD0ufdrG+BalgZq9XBvGZ9TXCa6UQjL4g2Irr+AN5Tueqigs92xlKezNJ4wjH
         wSuDMf51R5WuPWS9/raDPHWQjRwDU3OSgj1o++e07lOoyjQhF1M9bMCY3Sq9Zv1IRKCF
         QnBg==
X-Gm-Message-State: AOJu0YzLO+jnnbhLIZqHPmaG7fBknqRqLVLbuoGEoyM89Vs2/uYyXVsM
	Q/4QjA9rHhflND/s+pJ0wwp8pieyc5leBdYDsboom7luvIswJgfSoIYRKYgbSxYDcT9jmOnQgYe
	4z4GtcA==
X-Gm-Gg: AR+sD13ME9tR4OhOwEA+O+CCrOvt5GlCnE8JIZcfmuORwD82zjFpweBCvCAZNStuMU7
	5R/H/CegEN3UyytRcbzPCdd2Rr/NVZ3WlHmuRMC5eIMeJOTP2xwyV70RHIULM5orbcV+XmQ7kTI
	mjRCkxS7FrrlUIZ745bRs3hxeIVKT9qhjRMMFpeQU1qMh+pysWBHDXaphpaJ1MmknhHQ2VfIaIe
	yvV33hy9CoPSMU8VVydJJlhDB4uU0uvwpXNmtTqR/XyYRxSaPkSYbeA9/eqdkbq6LxgaQzPUcHZ
	H0+yU8bqeepkmIGQXxmD3TFqiDo5JZwcix7MYJAJKP4nh6fAfyw+QhScvzMEZrbvbSJboava1ue
	X60YUMM5n9TkLJXb6d0Cn9NNEv7VClP96JzeDMNApeW4xlUek5tyqfQAy/hLUel27MifsEjgxni
	8US2Olbm+lORdQwxRjA/S9TxXUuZbpVks7HtYqF9MVkutKjt9UYl7yYPrtz7m9XzRb9JAOV/ers
	AY+RTQd0JePvG5zAFhhvihCuJ7VWr6O
X-Received: by 2002:a05:600c:3796:b0:495:4811:7998 with SMTP id 5b1f17b1804b1-49987993e08mr307088115e9.17.1786961690475;
        Mon, 17 Aug 2026 03:14:50 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996109652sm169231445e9.4.2026.08.17.03.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:14:49 -0700 (PDT)
Date: Mon, 17 Aug 2026 11:14:46 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] ring-buffer: Improve nr_pages type
Message-ID: <aoLfFtBTvvyvI_Wu@google.com>
References: <20260814154823.755406-1-vdonnefort@google.com>
 <20260814154823.755406-3-vdonnefort@google.com>
 <20260814155944.F017E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260814155944.F017E1F000E9@smtp.kernel.org>

On Fri, Aug 14, 2026 at 03:59:44PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] When `nr_pages` is exactly `U32_MAX - 1`, the expression `meta->nr_subbufs + 1` overflows to 0, silently skipping persistent ring buffer validation and wiping data.
> 
> Pre-existing issues:
> - [Critical] Loop counters iterating over `meta->nr_subbufs` are typed as `signed int`, which wrap to negative values for extremely large buffers, leading to out-of-bounds memory accesses.
> - [Critical] The `meta->nr_subbufs` field is read from potentially corrupted persistent memory and used without validation against `nr_pages`, causing a heap out-of-bounds write in `bitmap_clear()`.
> - [High] Multiplication of `subbuf_size` and `idx` overflows 32 bits for ring buffers > 4GB, causing severe memory aliasing.
> --
> 
> --- Patch [2]: [PATCH v6 2/2] ring-buffer: Improve nr_pages type ---
> commit 030ec6a7ceec6e71123077bd1fc64e0cf5c27cc8
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> ring-buffer: Improve nr_pages type
> 
> If ring_buffer_per_cpu::nr_pages is defined as unsigned long, it is
> capped to 32-bits in a few places, limiting the operations possible on a
> very large buffer.
> 
> [ ... ]
> 
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index ec13779922ffb..ec127e2ad0527 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> 
> [ ... ]
> 
> > @@ -1746,8 +1745,8 @@ static void *rb_subbufs_from_meta(struct ring_buffer_cpu_meta *meta)
> >  static void *rb_range_buffer(struct ring_buffer_per_cpu *cpu_buffer, int idx)
> >  {
> >  	struct ring_buffer_cpu_meta *meta;
> > +	unsigned int subbuf_size;
> >  	unsigned long ptr;
> > -	int subbuf_size;
> >  
> >  	meta = rb_range_meta(cpu_buffer->buffer, 0, cpu_buffer->cpu);
> >  	if (!meta)
> 
> [Severity: High]
> This is a pre-existing issue, but does the multiplication of subbuf_size and
> idx overflow 32 bits for ring buffers larger than 4GB?
> 
> In rb_range_buffer(), we have:
> 
>     subbuf_size = meta->subbuf_size;
>     idx = meta->buffers[idx];
>     ptr = (unsigned long)rb_subbufs_from_meta(meta);
>     ptr += subbuf_size * idx;
> 
> Since subbuf_size is an unsigned int and idx is an int, the multiplication
> evaluates as a 32-bit unsigned integer. For ring buffers over 4GB, this can
> overflow and wrap around before being zero-extended and added to the 64-bit
> ptr, causing memory aliasing by overwriting earlier subbuffers.

I can add this to this patch/

> 
> [ ... ]
> 
> > @@ -1840,10 +1839,10 @@ static bool rb_meta_init(struct trace_buffer *buffer, int scratch_size)
> >   * must be the same.
> >   */
> >  static bool rb_cpu_meta_valid(struct ring_buffer_cpu_meta *meta, int cpu,
> > -			      struct trace_buffer *buffer, int nr_pages,
> > +			      struct trace_buffer *buffer, unsigned long nr_pages,
> >  			      unsigned long *subbuf_mask)
> >  {
> > -	int subbuf_size = PAGE_SIZE;
> > +	unsigned int subbuf_size = PAGE_SIZE;
> >  	unsigned long buffers_start;
> >  	unsigned long buffers_end;
> >  	int i;
> 
> [Severity: Critical]
> This is a pre-existing issue, but will loop counters iterating over
> meta->nr_subbufs wrap to negative values for extremely large buffers?
> 
> In rb_cpu_meta_valid():
> 
>     for (i = 0; i < meta->nr_subbufs; i++) {
>         if (meta->buffers[i] < 0 || ...
> 
> And in rb_range_meta_init():
> 
>     for (i = 0; i < meta->nr_subbufs; i++) {
>         meta->buffers[i] = i;
> 
> The loop counter i is a signed int. Since nr_pages can now go up to
> U32_MAX - 1, if the buffer size pushes meta->nr_subbufs past INT_MAX, i
> will wrap to negative. i < meta->nr_subbufs will promote i to unsigned,
> evaluating to true, and the negative index will be sign-extended on 64-bit
> architectures, causing out-of-bounds reads and writes.

Yeah sure, I'll make it unsigned int... doesn't sound too critical though!

> 
> [Severity: Critical]
> This is a pre-existing issue, but could meta->nr_subbufs cause a heap
> out-of-bounds write if it doesn't match nr_pages?
> 
> In rb_cpu_meta_valid():
> 
>     bitmap_clear(subbuf_mask, 0, meta->nr_subbufs);
> 
>     for (i = 0; i < meta->nr_subbufs; i++) {
>         ...
>         set_bit(meta->buffers[i], subbuf_mask);
> 
> meta->nr_subbufs is read directly from persistent memory and used without
> being validated against the dynamically allocated subbuf_mask size, which is
> based on nr_pages + 1. If meta->nr_subbufs is maliciously or accidentally set
> larger than nr_pages + 1, bitmap_clear() and set_bit() will write zeroes and
> ones past the end of the bitmap allocation.

Sure, but that'll be another patch.

> 
> [ ... ]
> 
> > @@ -2837,6 +2837,10 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
> >  		 */
> >  		nr_pages = (size - sizeof(struct ring_buffer_cpu_meta)) /
> >  			(subbuf_size + sizeof(int));
> > +
> > +		/* limited by ring_buffer_cpu_meta::nr_subbufs */
> > +		if (nr_pages > U32_MAX - 1)
> > +			goto fail_free_buffers;
> >  		/* Need at least two pages plus the reader page */
> >  		if (nr_pages < 3)
> >  			goto fail_free_buffers;
> 
> [Severity: High]
> Does meta->nr_subbufs + 1 overflow when nr_pages is exactly U32_MAX - 1?
> 
> If nr_pages is exactly U32_MAX - 1, meta->nr_subbufs becomes U32_MAX.
> In rb_meta_validate_events(), there are loops with this condition:
> 
>     for (i = 0; i < meta->nr_subbufs + 1; i++, rb_dec_page(&head_page)) {
> 
> U32_MAX + 1 overflows to 0 in 32-bit unsigned arithmetic. This makes the loop
> condition i < 0, causing the loops to terminate immediately without rewinding
> and validating the persistent ring buffer from a previous boot.

Sure, this can be  unsigned it as well...

And there are plenty of other functions that need fixing then.
rb_meta_subbuf_idx, rb_cpu_meta_valid, __rb_get_reader_page, rb_iter_peek... 

I need a bit more time to audit what must be modified.

-- 
Vincent

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260814154823.755406-1-vdonnefort@google.com?part=2
