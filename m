Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF9B351C0B
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 16:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786553450; cv=none; b=FwvqYvCGqd5VudwYJrL4xhAfOFUEIQa0y0y6dVrmjcgSIwA6Nsrmkoh8Fis0fHYOprT/08vP9VUFzBjfK7eQx+dVfa/2WK1CRffuiofWh0uQEmcs6i20MuEaTyQuWSutfD7SYrp5xFKCgW8LKYbJqq54M/Z0iDCHM+pI8qmP5qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786553450; c=relaxed/simple;
	bh=KlXrkvfsx+fsFqEntXjghisNXktNGqdzItW0y0yes+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nq/1g4GaaCs5RSCTxhgaz22xLiWLznTdb5V9Qkg05E3xZo1FjIyMi91ZG7A+iewRmflRRcb6vpHP2Zy4FzvQ1mRcbCGK7MeccWMDVbT2lRw6hX03MR9OxbSp92mslxqS/XR0f82QIrASgKgGhP/FawFHhZ/+d5WvVU4iJPDqVK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LHYZCH+8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LHYZCH+8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49954b88fffso13354455e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 09:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786553447; x=1787158247; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ml9MV+Ciw47318h14mA9c1GSopf5fAIz9vzAzzaRzvU=;
        b=LHYZCH+86vZzZKxaoKAb+rlgUOSDmSyBALr4uq40m3JsuofI11mxqcF1jfCvOQP2pM
         ZSTGeKaISStp3fcUsfJ/ij2sV3bXKrT6QOzVIlN9F7MX9mJw6XhNObubvh1DfXQjPNdU
         HfsCUjwBbC4tCu8SGhdcJebySGSkCVWQRu0E8wbVSi0zVyBRsy3Juls9WGJJy/tXEQBq
         ARW1ylmzNyKTJi6T+rjsYYpcswVyCM/CMVt9sPOwJaZvSyczDi1w80t9kBDDkyryZdFE
         S4vAy/FAPLEIXPrvrqyG91KtQ+Gnhsv2lRqNxRX/4zVKK5BytAtCDsm8bfr74WW6vjyc
         tRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786553447; x=1787158247;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ml9MV+Ciw47318h14mA9c1GSopf5fAIz9vzAzzaRzvU=;
        b=GkL3u/4s8hiB/vQp+aKZS5M2wN4Lu9dfweoXxPCSCkkZAQVeAmZZP8gv9WpgjkMdxv
         id8NLyi4cirRNF5wySqa/+1zPtpcVzRTzPtIo+8QqDSC6RC71wpYvA0Yri078UBLZ08G
         uqQ7BeDBJDRC0CsvvJ0EzpygqUDi/Mjw8uNp0dqdSxTgT2M5QYWSDW3pIaWXI9BZq/qz
         VIgyUAavbd8nTCTadFOb/uZc6MwOIvDr9sFddO44RhNk94D1V9l3hG0Trvl+JZ2iFK1e
         a6Mh43SWuOWaRZGlHg2ihVcozytudLxclFGWioh9sV1YLM2tJ94YIuh07mLfAZtf92dD
         qRzw==
X-Gm-Message-State: AOJu0YyalfA/07T14hDSoCICkLKZwxPPFa3rzdEzoispiAiVyalJYu8m
	jicy57pX6hIJ1uTavQdu5bOTLHFuaaL16bucbEskQmiic+WSvFJ/xDjG4xCyNZ33Yo+h+XFC0rY
	IADBEBA==
X-Gm-Gg: AR+sD11DBgXrlLKdTdyLOvutBbEyQSiWlxVwtXhJREgPzAaXTSkEquYrF0d9Zpe6qea
	NdEkruIdOo0iBiJWh/Ln6g1mMOLHWGLH01c9hXo+V7dDDY3iGOxGrgeMK4CTgReRPWBpZpKGZ+R
	fPoQyMkWXu79T57bw4C26AnBNnd3RxizKIV4PJVnZlCaYYLI1Y91vh3tQvLGTkjYOlfgkXYU668
	5AmOHCElQ3BPOsIaRW+NpPJmgetEjsuiKyX4qHV9Hrp6R1SOomEBaPBCidudWymzzvj+2NbI4I8
	GbPVww7XAqR2FhLLBgDXY2McDEAUCz13Es4JF4+QTl+u4dbnM+q568hz2z0u0h9E5HTJM7X7VM8
	JcAGKdm1V+YRHFuWCAGea/jsqAg5bo7ZMnRWNe/jiw/NvDmX3io/cVkB4+gMJstmjaAZeJuJvlI
	umnApxfXQoiyaej2hlX7ThwM7v9f07JUfMFe/LhwgL6iRLcA8456MhmUs62ePSyEFBmJXNn19oU
	7ewaYjYMoOwGSFe3U9J3gxeVXeIVWMI/Melyg==
X-Received: by 2002:a05:600c:b85:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-4997c12caffmr94750085e9.18.1786553446129;
        Wed, 12 Aug 2026 09:50:46 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150bf5f27sm8499064f8f.1.2026.08.12.09.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:50:45 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:50:42 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/9] ring-buffer: Fix subbuf resize race in
 ring_buffer_alloc_read_page()
Message-ID: <anykYnbmCwMxwMw_@google.com>
References: <20260812153311.2328812-1-vdonnefort@google.com>
 <20260812153311.2328812-5-vdonnefort@google.com>
 <20260812154653.87BD11F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812154653.87BD11F00A3D@smtp.kernel.org>

On Wed, Aug 12, 2026 at 03:46:53PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The patch is an incomplete fix for a race condition in `ring_buffer_alloc_read_page()`. While it ensures newly allocated pages use `bpage->order`, it entirely misses the branch where `cpu_buffer->free_page` is reused. This allows an undersized cached page to be paired with a newer, larger `bpage->order`, leading to heap buffer overflows during reads and out-of-bounds frees when the page is released.
> --
> 
> --- Patch [4]: [PATCH v4 4/9] ring-buffer: Fix subbuf resize race in ring_buffer_alloc_read_page() ---
> commit 28754c82212e5979b25cf6fac815748ff021a277
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> ring-buffer: Fix subbuf resize race in ring_buffer_alloc_read_page()
> 
> ring_buffer_alloc_read_page() is racy with ring_buffer_subbuf_order_set,
> it can allocate a reader page with an outdated order. This isn't a big
> issue, the user can still re-allocate a new reader page and try again.
> 
> However, what is more problematic is if the value of subbuf_order
> changes in the middle of ring_buffer_alloc_read_page(). In that case,
> bpage->order might not match the actual allocated memory.
> 
> Use bpage->order for the allocation to prevent this race.
> 
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index 97449423d3a68..94552a433228d 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> > @@ -7018,7 +7018,7 @@ ring_buffer_alloc_read_page(struct trace_buffer *buffer, int cpu)
> >  	if (bpage->data) {
> >  		rb_init_data_page(bpage->data);
> 
> [Severity: High]
> This is a pre-existing issue, but does this path leave bpage->order
> mismatched with the actual allocation size of cpu_buffer->free_page?
> 
> If ring_buffer_subbuf_order_set() updates buffer->subbuf_order to a larger
> size before clearing cpu_buffer->free_page, ring_buffer_alloc_read_page()
> might read the new larger order into bpage->order, but then claim an older,
> smaller cpu_buffer->free_page:

Not sure I follow here. the whole point is to read subbuf_order only once and
then make sure we always refer to bpage->order and not subbuf_order. 

I believe this is just fixed in the following patch.

> 
> kernel/trace/ring_buffer.c:ring_buffer_alloc_read_page() {
>     ...
> 	bpage->order = order;
>     ...
> 	if (cpu_buffer->free_page) {
> 		bpage->data = cpu_buffer->free_page;
> 		cpu_buffer->free_page = NULL;
> 	}
>     ...
> }
> 
> Could this lead to an overflow of dpage->data when reading events?
> 
> kernel/trace/ring_buffer.c:ring_buffer_read_page() {
>     ...
> 			memcpy(dpage->data + pos, rpage->data + rpos, event_size);
>     ...
> }
> 
> It also appears this could cause an out-of-bounds free of bpage->data when
> the page is released, since it frees using the mismatched bpage->order
> instead of the page's actual allocation order.
> 
> Should we also verify the cached page's actual order matches bpage->order
> before claiming it?
> 
> >  	} else {
> > -		bpage->data = alloc_cpu_data(cpu, cpu_buffer->buffer->subbuf_order);
> > +		bpage->data = alloc_cpu_data(cpu, bpage->order);
> >  		if (!bpage->data) {
> >  			kfree(bpage);
> >  			return ERR_PTR(-ENOMEM);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260812153311.2328812-1-vdonnefort@google.com?part=4

-- 
Vincent
