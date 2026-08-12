Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D432C448D02
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 16:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552656; cv=none; b=ExXHTAmo+V2BTTH3AbnZQ+eVVaLFWmXQXrt+hA0bQii9WOPaCi6LM6dHzXwePI1uchmIZUTeIKx+weCzUtqbEWU+z3HnD4Xj5dNOVuXKz1vf51xPQk5fkcpdxd0b1XgAZ0qAeyYAvrKLnnLRNJMh2P6vCmp/cv4Qn6fa7oR8Ukg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552656; c=relaxed/simple;
	bh=pj5O4LEs5W4iN3YPfoHEuQ24FsCcXPftRsRTMhlNqgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaBaT5CRpHR3qJ5gtMPFjxv7MIkdUSrlNMrVSsAGvEsVGWM1uLudxI5BtFzKR9NAJGGb3rwYPBkPYiphpe3wcTeS5eyziMEq/y7+pXZ+RmLcp7tWwBm/vtIyCxTGtqQBKT5z5gIcSYi5+q6qeG1UQit6PPuUNPMbvUzZ8eHJWZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rcFdAxG3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rcFdAxG3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4980dc26022so12446945e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786552649; x=1787157449; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4rPsIUEiOqHTIYgBrX4TJ7V/UTjBQeQ8ZzjczPhnr18=;
        b=rcFdAxG3hR1iMyubd2AkWcAlsbF+somlpJnK5x/yV3BhqDhdJv5EqKG2EFcDan2KTH
         G+aLue+onWSP51GemAcKxDTxVs/Di3BPloR15L9qpd2Mkbc6l4fH/gRuBSChg1micuGJ
         j/LFmp1i1ycFi1NAjIpuIR7w+OeKAogwltUJm3ipSw1U8S6iDldm6F1La2yH2RdpN0/+
         fwXGx5ESvRsg6WNyLxmHiddrBRgtg2Hs13PCaZ8QG5WiE3Oxp22CMypGrPzqKXoL9xtm
         YJzPBFt/4W8ap9lB9qYKUCA5vQ9EnhFwLOIZFxKpXzFArisOau8NyjKagAq2Z6ihBsxh
         wdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552649; x=1787157449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4rPsIUEiOqHTIYgBrX4TJ7V/UTjBQeQ8ZzjczPhnr18=;
        b=isN0jHOJnwqR1NT8AAB/VLALmF0sAoaLkefWJEvsfVVEhEmhto7eeQ3lDWRxgDTXLp
         U2IPT+7UwB7gjvjNyKy/4S4txcL8MZOc/kZXTgNdrl6bxtjE9FqTGIo2gDCd1JrzI1uY
         /EUfNzyqcaxmr6BCXKF0RjDpfXjeHVehZLaNPA+U7N7CbwMkFnrVV55XS5XcKcA4TPGj
         erUm7i2RLFmg76jdJ/8wVGLRVXO9G/yEDXB0uX/xOvLrCY2K5Y09PwshQ5kOqDJTaWtw
         pUxnuBR7SN/AMu9jtoK4EoWooF8Pbj6J/Bfk5LJ/RkaJSe8TQIIB4mgQXg0UqXt0HFLB
         xajg==
X-Gm-Message-State: AOJu0YzEXW6irtXiYTno9H9mP0i8N5rCrPjXyaidygoOAEH+9Yg1Dowj
	e3NzBZRmZQMEzooSYbPu6PMbYB0lun7JhdFUoGUKdegWFA5SuoXyqQVwuh2ndIybFr1Rl+7qcwX
	Kkuh+GA==
X-Gm-Gg: AR+sD107zGTwmTS75Tax4qnSMb6fUn9gi4y/j66PH4rADyRlr6mrVl0NxIexhKn71UG
	C0sOqde7DzbG8P7jzK4sU2xOmSIW+d7yNURumrG/2G30cTTdA+yDG5vc+EyyYjh9zHBTGNdSA0X
	ZIcg5SHOPO3ujwq40ze+0OPGLBvZvNUl7afL5Z2XixgToCSodpsYXmdFM0/BKGjNw/ekmzVXeoq
	9nPThfjuNSxuSht+1/nM0r+GvlDoIfdhCIBpWVZ24nARWzNx/pKH6B0/XNhTF/HKyoaMe6/oduD
	Mwh30Xn0kRek4Grxsy2JQpLitHeAjIlp8O4xp1/aJHBF7acffkdUQ+Z87RPy30sP7a+R/q7+r3c
	8u/yqZ19khQxSjzGbTdh6J+x2k54gx2SBp5r0J5ynnzLUydfg2BIFVz5QpxhXUBpGFH4HuB1Iv0
	TiLbdC9ogtPNRVWTstjs2zLV/HhZe7y+32kdmS+CkRzgt0KYgxikyzKmcXIlhevV/17ni4zPTU6
	proeiGMc384Hs2a9l0RbgvvX2MZmWoF
X-Received: by 2002:a05:600c:4504:b0:495:737a:7afe with SMTP id 5b1f17b1804b1-4997c12592cmr91297785e9.15.1786552648825;
        Wed, 12 Aug 2026 09:37:28 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997809c720sm58638035e9.4.2026.08.12.09.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:37:28 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:37:23 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] ring-buffer: Free cpu_buffer->free_page with
 subbuf_order
Message-ID: <anyhQ_3EsG-RrAqS@google.com>
References: <20260812153311.2328812-1-vdonnefort@google.com>
 <20260812153311.2328812-2-vdonnefort@google.com>
 <20260812155038.516A31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812155038.516A31F000E9@smtp.kernel.org>

On Wed, Aug 12, 2026 at 03:50:37PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Concurrent execution of sub-buffer order resizing (`ring_buffer_subbuf_order_set`) and read operations (`ring_buffer_alloc_read_page`, `ring_buffer_read_page`) can lead to out-of-bounds writes, use-after-free, and page allocator corruption due to mismatched synchronization.
> --
> 
> --- Patch [1]: [PATCH v4 1/9] ring-buffer: Free cpu_buffer->free_page with subbuf_order ---
> commit 4100674474d6bd293fb872fecb17fc781ca58502
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> ring-buffer: Free cpu_buffer->free_page with subbuf_order
>     
> When sub-buffers use an order greater than 0, cpu_buffer->free_page is
> allocated with subbuf_order. Use the correct order for
> cpu_buffer->free_page.
> 
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index 2667992f0aa29..a3d28b2e2c94a 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> > @@ -2631,7 +2631,7 @@ static void rb_free_cpu_buffer(struct ring_buffer_per_cpu *cpu_buffer)
> >  		free_buffer_page(bpage);
> >  	}
> >  
> > -	free_page((unsigned long)cpu_buffer->free_page);
> > +	free_pages((unsigned long)cpu_buffer->free_page, cpu_buffer->buffer->subbuf_order);
> 
> [Severity: Critical]
> This isn't a bug introduced by this patch, but is it possible for a race
> condition between resizing and reading to lead to memory corruption?
> 
> If thread A changes the sub-buffer size via
> /sys/kernel/tracing/buffer_subbuf_size_kb, ring_buffer_subbuf_order_set()
> updates buffer->subbuf_order locklessly globally before tearing down the CPU
> buffers and clearing their free_page.
> 
> If thread B concurrently reads /sys/kernel/tracing/per_cpu/cpu0/trace_pipe_raw
> via tracing_buffers_read(), it observes the new order and calls
> ring_buffer_alloc_read_page().
> 
> Because ring_buffer_subbuf_order_set() hasn't yet cleared
> cpu_buffer->free_page for this CPU (they use distinct locks), thread B pops
> the old page from free_page but tags it with the new order:
> 
> kernel/trace/ring_buffer.c:ring_buffer_alloc_read_page() {
>     ...
>     bpage->order = buffer->subbuf_order;
>     ...
>     if (cpu_buffer->free_page) {
>         bpage->data = cpu_buffer->free_page;
>         cpu_buffer->free_page = NULL;
>     }
>     ...
> }
> 
> Thread B then calls ring_buffer_read_page(). The lockless check passes
> because both match the new order:
> 
> kernel/trace/ring_buffer.c:ring_buffer_read_page() {
>     ...
>     if (data_page->order != buffer->subbuf_order)
>         return -1;
>     ...
>     reader->page = data_page->data;
> }
> 
> Could this allow the undersized old page to be swapped into the ring buffer
> as the reader_page, leading to an out-of-bounds write when a writer attempts
> to write large events? 
> 
> It seems it could also cause page allocator corruption when a smaller page
> is later passed to free_pages() with a larger order.
> 
> >  	kfree(cpu_buffer);
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260812153311.2328812-1-vdonnefort@google.com?part=1

All that is hopefully fixed in one of the later patch of the series

-- 
Vincent
