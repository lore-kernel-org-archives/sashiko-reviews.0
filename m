Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E583515C5
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 16:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786553876; cv=none; b=K0gU4r0tOiQnM6Kclv9en7mqWh8v8DdtA82xxVjk7ZB8q50RdKdC2hVLiTWA2gP1Z8SO06iA2Mwaj5iuVCLcSrUBYn+jt+xObk5ejUcq+Aw7lp4foHws03jn/Ph48hVFsRt6rPeZuDBGpLBf5FkomXhtFwss/n3dozpO4y8J+to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786553876; c=relaxed/simple;
	bh=/f6rHx1CGTNU7JGVtGJV0kDvGyd1L4uKEPb/eW21JZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+C8M3LTEP5JUJPMw57aIg4obz/eGLROulA5AyQO5M9Yn4cSmoXB9/4pqOIDUS5WZWdpK4YYBMiOBR6uJFgt7BQsnzFlCVgYhEHYvznaJUJ8W7l1IEqfzAdfzXhGVaKzseSx5ZYNanD0G9hccTX2xJhWGvJNJ5A5WiAZiV97MN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TzSPlq1n; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TzSPlq1n"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47de0093c42so1111963f8f.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 09:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786553873; x=1787158673; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uqa5uijQCgQBJxboOxrjC5tiDajJgn4zS4IgZwEs4uQ=;
        b=TzSPlq1n7nKcNz6Uv5Eba7xhI8m56rbjzObxETG4TMRilM8YknGFEKqtRQ0lcJuhUD
         Xgqlr8DAPrgE53ya5KdZHRlrIuPPJJFqCsddCTDXO0yEgiW5bJY1TEP3IKEVSvLGLais
         TsTV5vY7uRgknw2oYHrF/B0sJIjhq+CXFdm7kl0eAarfUtZ5kRoENBQtmmpvbCM/6mXd
         RxqfSd43hgDiR8ULfgIvPqq6xMnGu1ugZGoiMm1lb7tQxc+yeA+VOTd3myKzl8F6sD5q
         HuUkqWgnjIkTF5hlASL8IXW2f4UPoHjEGr6RWez1DESvUv+50gMtPrl9jMlu3qd3NdFT
         /k8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786553873; x=1787158673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uqa5uijQCgQBJxboOxrjC5tiDajJgn4zS4IgZwEs4uQ=;
        b=rqrNj1GPuwY9jetgmKbhr0xgZ6HmgDDoVHIr8g2cKdgX29ew3duow3HjJIQOuJ9hVk
         1YWqUNnWI5cnNvdmCQfjJ/+icZzJRouIFbs19DLTG9bsu26j4P/H7dRgGyfnBNOQoBzp
         WOkpScCQc6URW2s7Pm0RkwkjPQFlDfPg5zsjl5UzC2Iprw0Z44PskW4yX0M3drfc7niw
         oVCxUhRZEvQHnSh8Q/nRcza+F2PjUTvcWccGyKZr1ZEkqP4/R7SyEjsvnVfTjMej4a3h
         Y7FWkd+mSg5kHEIm0FlHugRs9Ws7EoZBRQU+VL9tx6aHndMkS2C6FBPqzeaf8sWcPIIG
         zU7A==
X-Gm-Message-State: AOJu0YzJrfurty6MWG3uBdnK/9f8mdwNO5XcL05L4yYWidyo98vMLxY3
	wOH4SjuZn8mbFnxMdkS3zkRrV/4tvE2R598hMlR7GLKwBYbiR2f9s2ZxSJccE6qDHDb5sDe52dU
	SDK/tXQ==
X-Gm-Gg: AR+sD12CcRRhqTnW14pp9nx4MbqE4l0L+5xEjlGoh6oMNYYVlss3LUhRYfHKkww4VI6
	ecUmbMegnp4Kuc4QVhQzarY+sr+pQyfFtlfXetwaCXqKvGOh10zU/hqBWiUqNacxTmmt3ziFgLI
	CVYaUPp1ajwXA66K8xam2yGVG5uiKyU9B1WtWuo99NJ6ofEC7DMWruvaumV8/D0zYRV6aQkP7Xn
	HBcT9rxNjLcHgDA7XI1gEfTgZn6X8RZEMhrmPw7HBDXgu2/yv2/YZ1jrk6YINnVkOXO3ceckrkI
	1ehs2PlYA/6YIJpDwZTYJEB1aZvoWPDckbjb6gcLt41A6uF92goNskn4r54nwtt5pPMrNzcV2ds
	UT6uPPuzFCVFUUjydMvEebFgHnjcTNaWkaJOA3ADt75Gr8k5gmcmc75QQn34DBY63h7nQ+SwXl8
	INgwkh32HSEInOoKvz9NuKJ+1HJAwJ+VEjmK+KICmFM3mGYCvLmIOrgMYEWvStw0lig6kXHczwL
	SrQK/pC1gxN5iuZRBK9I5tcxvW5rBT4
X-Received: by 2002:a05:6000:25ca:b0:47f:d011:f644 with SMTP id ffacd0b85a97d-48152b40d40mr10039370f8f.4.1786553872737;
        Wed, 12 Aug 2026 09:57:52 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150bf7774sm9174021f8f.2.2026.08.12.09.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:57:52 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:57:49 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/9] tracing: Fix subbuf resize races in
 trace_pipe_raw readers
Message-ID: <anymDQcYJLuZE3Kd@google.com>
References: <20260812153311.2328812-1-vdonnefort@google.com>
 <20260812153311.2328812-6-vdonnefort@google.com>
 <20260812154706.486061F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812154706.486061F000E9@smtp.kernel.org>

On Wed, Aug 12, 2026 at 03:47:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] A logic error in the retry loop of `tracing_buffers_read()` bypasses `ring_buffer_read_page()` on retry, leaking uninitialized or stale kernel memory to userspace.
> 
> Pre-existing issues:
> - [Critical] A race condition during subbuffer resize causes `cpu_buffer->free_page` to retain an old allocation size while `buffer->subbuf_order` reflects the new order, leading to a kernel buffer overflow.
> --
> 
> --- Patch [5]: [PATCH v4 5/9] tracing: Fix subbuf resize races in trace_pipe_raw readers ---
> commit c5c1a16fabb91c8f580283f14e5e76cc1ccb99b0
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> tracing: Fix subbuf resize races in trace_pipe_raw readers
> 
> Concurrent subbuffer resizes may crash trace_pipe_raw readers or leak
> uninitialized memory to userspace due to stale size values.
> 
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index 94552a433228d..f62d6853ee5c0 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> 
> [ ... ]
> 
> > @@ -6988,22 +6988,34 @@ EXPORT_SYMBOL_GPL(ring_buffer_swap_cpu);
> >   * Returns:
> >   *  The page allocated, or ERR_PTR
> >   */
> > -struct buffer_data_read_page *
> > -ring_buffer_alloc_read_page(struct trace_buffer *buffer, int cpu)
> > +struct buffer_data_read_page *ring_buffer_alloc_read_page(struct trace_buffer *buffer, int cpu,
> > +							  struct buffer_data_read_page *prev)
> >  {
> > +	struct buffer_data_read_page *bpage = prev;
> >  	struct ring_buffer_per_cpu *cpu_buffer;
> > -	struct buffer_data_read_page *bpage = NULL;
> >  	unsigned long flags;
> > +	unsigned int order;
> >  
> >  	if (!cpumask_test_cpu(cpu, buffer->cpumask))
> >  		return ERR_PTR(-ENODEV);
> >  
> > -	bpage = kzalloc_obj(*bpage);
> > -	if (!bpage)
> > -		return ERR_PTR(-ENOMEM);
> > -
> > -	bpage->order = buffer->subbuf_order;
> > +	order = buffer->subbuf_order;
> >  	cpu_buffer = buffer->buffers[cpu];
> > +
> > +	if (!bpage) {
> > +		bpage = kzalloc_obj(*bpage);
> > +		if (!bpage)
> > +			return ERR_PTR(-ENOMEM);
> > +	} else {
> > +		if (bpage->order == order)
> > +			return bpage;
> > +
> > +		free_pages((unsigned long)bpage->data, bpage->order);
> > +		bpage->data = NULL;
> > +	}
> > +
> > +	bpage->order = order;
> > +
> >  	local_irq_save(flags);
> >  	arch_spin_lock(&cpu_buffer->lock);
> >  
> >  	if (cpu_buffer->free_page) {
> >  		bpage->data = cpu_buffer->free_page;
> >  		cpu_buffer->free_page = NULL;
> >  	}
> 
> [Severity: Critical]
> This is a pre-existing issue, but can this lead to an out-of-bounds write
> during a subbuffer resize?
> 
> In ring_buffer_alloc_read_page(), the newly read buffer->subbuf_order is
> assigned to a page stolen from cpu_buffer->free_page without checking if
> their size orders match.
> 
> If a concurrent call to ring_buffer_subbuf_order_set() updates
> buffer->subbuf_order locklessly, and this function is called before
> cpu_buffer->free_page is cleared, it will steal the old free_page but assign
> it the new size order.
> 
> Will this malformed page be swapped into the ring buffer, allowing writers
> to write past its actual bounds?
> 
> [ ... ]
> 
> > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > index 395238b2b715c..0409d20a168bb 100644
> > --- a/kernel/trace/trace.c
> > +++ b/kernel/trace/trace.c
> 
> [ ... ]
> 
> > @@ -7080,8 +7080,8 @@ ssize_t tracing_buffers_read(struct file *filp, char __user *ubuf,
> >  {
> >  	struct ftrace_buffer_info *info = filp->private_data;
> >  	struct trace_iterator *iter = &info->iter;
> > -	void *trace_data;
> > -	int page_size;
> > +	void *trace_data, *prev_spare;
> > +	unsigned int spare_size;
> >  	ssize_t ret = 0;
> >  	ssize_t size;
> >  
> > @@ -7091,36 +7091,31 @@ ssize_t tracing_buffers_read(struct file *filp, char __user *ubuf,
> >  	if (iter->snapshot && tracer_uses_snapshot(iter->tr->current_trace))
> >  		return -EBUSY;
> >  
> > -	page_size = ring_buffer_subbuf_size_get(iter->array_buffer->buffer);
> > +again:
> > +	prev_spare = info->spare;
> > +	if (prev_spare) {
> > +		spare_size = ring_buffer_read_page_size(info->spare);
> >  
> > -	/* Make sure the spare matches the current sub buffer size */
> > -	if (info->spare) {
> > -		if (page_size != info->spare_size) {
> > -			ring_buffer_free_read_page(iter->array_buffer->buffer,
> > -						   info->spare_cpu, info->spare);
> > -			info->spare = NULL;
> > -		}
> > +		/* Do we have previous read data to read? */
> > +		if (info->read < spare_size)
> > +			goto read;
> >  	}
> 
> [Severity: High]
> Can the retry path bypass the actual read function and copy stale data
> to userspace?
> 
> When reading from an empty trace_pipe_raw file, ring_buffer_read_page()
> returns < 0. The code then blocks in wait_on_pipe(). Once woken up, it
> executes a goto again.
> 
> At the again label, info->read is 0 and info->spare is already allocated,
> so the condition info->read < spare_size will evaluate to true.
> 
> Does this cause execution to jump directly to the read label, bypassing
> ring_buffer_read_page(), and copy the uninitialized or stale info->spare
> page to userspace?

Arg, this one is real!

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260812153311.2328812-1-vdonnefort@google.com?part=5

-- 
Vincent
