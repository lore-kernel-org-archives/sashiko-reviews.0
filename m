Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0E446830
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 12:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662340; cv=none; b=Av3iT3Ve7I8M1tGpGxSMMgBDlfoYkxOik6nWKhYlPbFGq+Q4OPNv1ZHsQkIGtkX1h7T5r91rF8LHbJOgdMJYvRdk2S3fRyqHm1ZV7cWDfoGHll3uncTRdkql6Jbd4n0EK16rD9MGoKxvFQmvqa6c0Udu49/jFP1iqaKQaiyEIFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662340; c=relaxed/simple;
	bh=AJOQz1WA8ph1ReEu9bpHwzXC3pVsd01wSnP1cQHvM0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cx2RxK4fSefD1YKHgwMhBnCAasLsUWMSMtuYawFGZpXj67apbC0LX4lsq13LuWafwBnvNoBBJjybeSmKrIiKRPvyErrFLmA9zGW3xY/D3b0MLtliA7zYHnoAecexdUnqmUGOEJo6kPCzJWA54B2WVEfv+awKRHlZ8lGBjyZ3hU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MfWXyncu; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MfWXyncu"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4815bce4652so2435968f8f.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787662336; x=1788267136; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XefrAv44KfW3PE7FNjIrUOwNn6ljxjVjZviYqzfKW+0=;
        b=MfWXyncuj1C7KIYAvQubewlXCdM84NZzrLa3DLseOI2iPADHs/KHPTi6Y52Hl5GbcK
         9F94SXY1C1jmSIB+l1xdux/XxJDM5Xgt+0XgNOKlcPDVJuXk4VJ7oZf46dWfSeoJAQpC
         DmDBjdoHU96ae+RCuQ39yBuHTxE6X3Q1ePQ/+BqtK17Ou7VbklMSJ6vHwQZobjpTAL4Z
         NcxfJvntpNTBWRzm9F0wRTRTK1hu4Y2u9J2CVIGimoM0tlGPTKB0lTafFDjxAKRgoWTe
         xd5hJpEbfagsOI6WQtSGpPK7ILVrcQRdJZ05n3hI+ypI04LcBj3vewbKquo5Th4156JL
         EjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787662336; x=1788267136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XefrAv44KfW3PE7FNjIrUOwNn6ljxjVjZviYqzfKW+0=;
        b=Fcxekr6n3ndQePEeAjN7k5ucOO/Pjk14YebhIHlI8GMl89ydnowZL/k3SC8dPehVZp
         REw3bNmIn1Y3G5U44siHYq7NXH9DYGARGNL1V2BPP3BmeYTMRdxhy7nQbJqH9cZlMreu
         Pq1t5b8hJPqODH7nYOjVxu7GV3xE1QeQt4+z08iORlIhXVXf1WqhhWpVv0ch8PMu9raB
         L3LM8mhTFIfirx7bu7Xm0epErgkA+VCOAeljjMZfNpXin8pQecIpbQjwcOlThPaBFIwO
         70n7y7t3TlxL1zi6IB3F4PWSDwnlq4X9mm8j5DfL1yBYdKKNAtmMskjDo5++CtLCUSbg
         /f0g==
X-Forwarded-Encrypted: i=1; AHgh+Rp+fO9tTkEIonmTtCq6by6d4c2IpqmKGYIzYtGS7fE8zAa5RaqqDNGO84sWXt8OPRRkqDBQSMrRCr1KWZDtibY=@lists.linux.dev
X-Gm-Message-State: AFuF++nc3y/B9v6fT8e/vd379eWdxYyZoralcTDu31Re7uapWpleH4yn
	OD64RZ02RCifQxs0rSvPvHVrnujMy4f0GY9S9WJaElce4nqcqi5hXNQPB89Pj1bF8lnC6RWpKzL
	x71dBHlSA8qE=
X-Gm-Gg: AR+sD10BN7BYuw9OwUyvwJ7AkUUIjfdwKzE9ag3Tcj/yO9kEKHlQWH/BdcKJmSguZtj
	iMJAZirE6YwOak8GMTg38VEq8ezRwCcH2WpAYCkF0ORFnG3paFvTFVnHHeAApLISJGfHY6WRqMR
	6eyeMejMzEFdDDYPsHdmcbktxX2r1YRFWaMZ+moWA6MoGWX8SYsm9dEHSj+6fwVW/3grz23bH2T
	BtmtgYG19w/5Pr/SDLGn7PZwmOXq0Rx5DkTi1UrUc/2Ym6H9Tq9Pffs/CGOT9NVJGz6ARAxGW3g
	exnAOrqEa7+N+9P8tp2kMiHoOdeXWDshgzDVuYGX0rt/3YswamAjC6MSuvg2mBQKIJiSZizxT4S
	5CgX78B/4ldblV/+LRgOtHwedH8zyTdG5Tpc49idreYuXdL4OrlVslkwuyu0nlwBBbVOLBw4HW+
	GqpWIskyOJplWnMaVinzCRNnYKvaqgEP9aY//f+Ftt3cfeibIP4hpAV7oT6VQsB6x5gWsqpd1fA
	zuXnjH5YBDMLPkbQT3R2ZskHunjQL+D
X-Received: by 2002:a5d:5f8b:0:b0:482:a9c4:bfd6 with SMTP id ffacd0b85a97d-482d9efe45fmr8958222f8f.7.1787662335425;
        Tue, 25 Aug 2026 05:52:15 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c146f1sm11512374f8f.33.2026.08.25.05.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:52:14 -0700 (PDT)
Date: Tue, 25 Aug 2026 13:52:11 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] tracing: Fix subbuf resize races with
 trace_pipe_raw readers
Message-ID: <ao2P-4a2aJFYVT6k@google.com>
References: <20260817134750.3909384-1-vdonnefort@google.com>
 <20260817134750.3909384-2-vdonnefort@google.com>
 <20260817140812.2C7D41F00A3A@smtp.kernel.org>
 <20260822110424.346fa3c8@fedora>
 <aotTYT0zE5LNik06@google.com>
 <20260824105315.27377f30@gandalf.local.home>
 <ao1Rn8ZKr5XafWRZ@google.com>
 <20260825084707.4c9cf9f5@gandalf.local.home>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825084707.4c9cf9f5@gandalf.local.home>

On Tue, Aug 25, 2026 at 08:47:07AM -0400, Steven Rostedt wrote:
> On Tue, 25 Aug 2026 09:26:07 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > 
> > Do you think it is still worth to reduce the window of discrepency between
> > buffer->subbuf_order and buffer_page->order?
> 
> Can you elaborate more on what you mean?
> 
> -- Steve

Something like this.

@@ -7469,8 +7473,6 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
        /* Make sure all commits have finished */
        synchronize_rcu();
 
-       buffer->subbuf_order = order;
-
        /* Make sure all new buffers are allocated, before deleting the old ones */
        for_each_buffer_cpu(buffer, cpu) {
 
@@ -7500,6 +7502,7 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
                /* Allocate the new size buffer */
                INIT_LIST_HEAD(&cpu_buffer->new_pages);
                if (__rb_allocate_pages(cpu_buffer, nr_pages,
+                                       order,
                                        &cpu_buffer->new_pages)) {
                        /* not enough memory for new pages */
                        err = -ENOMEM;
@@ -7507,6 +7510,8 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
                }
        }
 
+       buffer->subbuf_order = order;
+
        for_each_buffer_cpu(buffer, cpu) {
                struct buffer_data_read_page old_free_data_page;
                struct list_head old_pages;


But now with the idea of copying the data when data_page->order !=
reader_page->order, I am less convinced there's any gain.

-- 
Vincent
