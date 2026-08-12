Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E3A470E8F
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 17:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786554730; cv=none; b=KBCP1xpuJDXDWE8/eoOg/s9rqwW6wjuTKHj0vQFxL1ZjtEu7LqCEdujbDnsTLVOTA2Uh6HJX4tYDfYCuClWAyzRJl7DqFZGkwhrug68bKojS1u3ko1P3S1nHAGyGYlZW5fxuDu4awhnAcBfYH9x8XLkK+EMZQ21rO/EG7jfF5Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786554730; c=relaxed/simple;
	bh=rqwlOq92I7cuDiuf8w5pty+c2+C2G6VIPKgJG/DFOdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8saLF2UReq0ohWf0Ir2MVRNW6Fe0ygTAQdDkjys2yGlJC1zh0VE2FnQXi7onWnJVQyxITguUDngeh3jq3wssXRlZzZGtFhTS0Lu0Y9y9+an9rKgCSIZqodp8dnasQh2co+F500GiSX5GqLvPla+GWdvivrgGDNETMiZCtxISGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q6T3OmAq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q6T3OmAq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49558ce01afso9718885e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 10:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786554727; x=1787159527; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EsahJiz4yxbPgD3b0qmgAoU22rS/dqIIjVwmpwb6x7s=;
        b=Q6T3OmAqLd8ePZkbz76uCdmCTYrlKkvj1Qp8s0yJwWK2LxiAvmpuKtoALNXUKAAYW+
         paguhDGJhtAv2vI2h+YTVCKuBP4F0qe7W80nJWTQx/KepwjvBNPaIKcJd6U1KXKLgG5M
         CDfZM4tXow61IS/v3ubuhALfifY5K6Cyi1AaXkQTSJ6eZE/XqIODw8UBzm7kg5AE/a9+
         2A/bOEpZsm5EtJgaj5Kcu8lZ0LhEWXyMI861a2wm429YtjeSGGQgO0TE0dxa9rLqS9vI
         xKuxTmXYK7Ins3IxOYX+l7lFmbHAGsPelKIvru/TI0iZcSD6J7Id5IQb2i3nQcpv2S9N
         z5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786554727; x=1787159527;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EsahJiz4yxbPgD3b0qmgAoU22rS/dqIIjVwmpwb6x7s=;
        b=m9J5dgVG7+T6z8S1XpNnowu7gIt1ARvje7IKTNb1Qn/Dr6VjK+0GAZSivnbBq5hGjQ
         kO/x0S2ayOOEtEm5nHIeaNQZjkOgXknpx4LE68mzKBFv0Rm2Ke6AqScDlOSgIBL2ZKwc
         v6+qUhlSm44MPpSoztajebMOvkwjAA5XzJzB1jmY1iBP+mKD8kRPVNNX3W4DOPf3xxfT
         mW2Tn4l7zdvPtLEe2Fy+gwLdASYeOMbY2J9CkGW0ejwtOw0HslR0HCWsTW9V8lXOCD+C
         mhT6QSzfi5WODoRqRvNAqFM3ku9/eIHoCMgtT3TuKDctH6rNtNj2Zro394ngzhQjoTkK
         czwA==
X-Gm-Message-State: AOJu0YyrubgEGBFr4hZfT+bIkyhsetwbqjl6oROaW1aOXl6RxWuoRpFC
	IJ0hh2TDpcyq1tiP1gEL6b5LHZza1iPZLkaOCfOI7nbHwpnhbKenOYLdLIg/9MEfrnbYfhKeMB3
	lgl7ehw==
X-Gm-Gg: AR+sD12no+VgBh6Ixm2udQIWwmoexOvFjti0r1Us640Gw090vXf3rdFiF8u2TZQzLY5
	hRd/GXVHIAKdsYgJDRDt2jh9RLvK4Y1lEtQXbzSUEU+pAlWl0osBJ1XVf2K/KuBggbxb/xH/fD1
	4aZN5kMRY67/5Kr5o9VmH4XbY44yvEgNDXgab97FD6nCKvMwu6xV6NJFiU/IvRNsY8a6cxwKG0n
	OAkvNloH0wpaijmq4fJzjRYIwgN9f/LL3Ok1LnsvZ2NEVQwMqL3Q+IzxErpLi4XwN7mKJQUF4BO
	mnIP8geDxlynBm9z2+zWjtj8IKdyZpYx0hQV4qOBjUhadfem+YviA8L44FTfPhTec08HeEVUvgg
	oNPUOHd3A8mimZJhuy1UZMGpxYTj8ipekI51XaaVX69lL1hfPaTUAZYD6ikmxIkK5PzGcMJklmb
	pytdTlhYpjPL4mLdeyAz41aYad9r9kOowVanLVThB4vUxpcZDeQBPf3u9AJPwhgyyPaECoNx4sw
	Bfhe3ciIX59W7dR9jdxV6ulqS8i+9Kl
X-Received: by 2002:a05:600c:474c:b0:499:7f38:d77 with SMTP id 5b1f17b1804b1-4997f380e1bmr38827795e9.6.1786554726938;
        Wed, 12 Aug 2026 10:12:06 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b34afe3sm72654905e9.2.2026.08.12.10.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:12:06 -0700 (PDT)
Date: Wed, 12 Aug 2026 18:12:02 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/9] ring-buffer: Dynamically calculate max_data_size
Message-ID: <anypYj3B7ASbtoCQ@google.com>
References: <20260812153311.2328812-1-vdonnefort@google.com>
 <20260812153311.2328812-7-vdonnefort@google.com>
 <20260812155643.1A6D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812155643.1A6D71F000E9@smtp.kernel.org>

On Wed, Aug 12, 2026 at 03:56:42PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Concurrent execution of ring_buffer_alloc_read_page() and ring_buffer_subbuf_order_set() leads to buddy allocator corruption and potential OOB memory access due to a mismatched page order when taking cpu_buffer->free_page.
> --
> 
> --- Patch [6]: [PATCH v4 6/9] ring-buffer: Dynamically calculate max_data_size ---
> commit a7794ac711440e6d89d8e099e4a88707ad083ed7
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> ring-buffer: Dynamically calculate max_data_size
> 
> The ring buffer order can be dynamically modified and temporarily
> disables writing to do so. It is therefore safe to use the updated value
> to calculate the maximum event size which can be written onto the ring
> buffer.
> 
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index f62d6853ee5c0..64bf4ac853f57 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> > @@ -598,7 +598,6 @@ struct trace_buffer {
> >  	struct ring_buffer_meta		*meta;
> >  
> >  	unsigned int			subbuf_order;
> > -	unsigned int			max_data_size;
> >  };
> >  
> >  static __always_inline unsigned int rb_subbuf_size(struct trace_buffer *buffer)
> 
> [ ... ]
> 
> [Severity: Critical]
> This is a pre-existing issue, but can concurrent execution of
> ring_buffer_alloc_read_page() and ring_buffer_subbuf_order_set() lead to buddy
> allocator corruption and potential out-of-bounds memory access?
> 
> When a user reads /sys/kernel/tracing/per_cpu/cpuX/trace_pipe_raw, it calls
> ring_buffer_alloc_read_page(). If another thread concurrently resizes the ring
> buffer via /sys/kernel/tracing/buffer_subbuf_order, it calls
> ring_buffer_subbuf_order_set().
> 
> In ring_buffer_subbuf_order_set(), buffer->subbuf_order is updated locklessly
> with respect to the reader:
> 
> kernel/trace/ring_buffer.c:ring_buffer_subbuf_order_set() {
>     ...
> 	buffer->subbuf_order = order;
> 
> 	/* Make sure all new buffers are allocated, before deleting the old ones */
> 	for_each_buffer_cpu(buffer, cpu) {
>     ...
> }
> 
> Before ring_buffer_subbuf_order_set() reaches its second loop to clear
> cpu_buffer->free_page, ring_buffer_alloc_read_page() can fetch the new
> order, grab the old page from cpu_buffer->free_page, and assign the new
> order to bpage->order:
> 
> kernel/trace/ring_buffer.c:ring_buffer_alloc_read_page() {
>     ...
> 	if (cpu_buffer->free_page) {
> 		bpage->data = cpu_buffer->free_page;
> 		cpu_buffer->free_page = NULL;
> 	}
>     ...
> }
> 
> When this page is later freed or swapped into the ring buffer, could this
> cause memory corruption because writers believe the subbuffer size is the
> new order, leading them to overwrite past the old order page?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260812153311.2328812-1-vdonnefort@google.com?part=6

Ha this is something I was meant to fix as well... we can't just blindly take
cpu_buffer::free_page! 

I think the best is to make cpu_buffer->free_page a buffer_data_read_page so we
have an order associated to it!

-- 
Vincent
