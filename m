Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DAB47F2EB
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 17:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786554919; cv=none; b=a7rpmxYSHRu8ZM3nOF55+LFkTIUq30J5XuSGbEH2kYjKhzYyTgj4t3T+Dy6pqjt6/dR3N+GsgXZ41Lla73O4C7AgH7075rEhH3shzqmvObeM23W6XatjbvqG3anzw6uNTBTHx3VyubFYaCd5/K54MktMk6n+vhnGkALmN8UNskY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786554919; c=relaxed/simple;
	bh=2I7/RT+0aSe0m2OkCvjXvgILtrPojrAcU8m8Y6nvhvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxIQl0bNXkXTIxF2P60pqcCW5DHmaT3a8lFVYUyYy4kZp0gjyf90UDdG8KLNqhrbNDGTRr+EMIghRT0qyBWUkqGUJybpeid8IklCIoyAAeoH4LydOcdmc56SQh2O9F/OYSO69t0zxTCoFZE7s/oTXvyCjVu6Uk97KO1fqc9RoJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RG2dfOPO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RG2dfOPO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956242332dso11248805e9.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 10:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786554916; x=1787159716; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjqqgSClxaAJzslKdXPIOBgkFcej7/XVCPbk7KbHCKA=;
        b=RG2dfOPOqizDQCv4U9zvzMm+rSAP2cItAP4lUZWQ3ghQfJIzvOAgjPRWQ5J2OxDgVq
         Mk5Q1hOoaWQmGjk8TD6EG9kxaQ/+0g6objJkmmThZvJE36K6AeYVV4Y/z9ZckR9Wf2uC
         N5ixjEBZk0fMS+b1146vgzQc13JBk+Fwa/NrEM5cuqTVFfTDD1VreCj7MF/LkF29B8Zk
         byU/w0vlwSl45n5XZjhB1TzAswbvCET5SHviC319p2HL7OiTWU9KykmJClXngU82CeRx
         /G++jW6vvnaXXM29ftDHkkE26tAtu/nc1JAJyexSQiN4GYomXeVnlyEZd60/Pz5LqN9B
         8mRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786554916; x=1787159716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tjqqgSClxaAJzslKdXPIOBgkFcej7/XVCPbk7KbHCKA=;
        b=HojtCS4+FGYBwcr9smUruNK8Ikk6HZ91GFc2PRVNTO/Z+iI9c65YGRcMy90LXXKxH8
         dLOIYjE8q7E0lN0qLaRrSP6Q79WrZnLwV8HxnZ1P2gem0YLUssEvBnVIqNqqxwl0T203
         tMw8fa331F5e1XbPya/TDUYU8GdS9L6GB0J1UmojMtCt20tP76vB42Qz9VGGWa5O/miG
         Gror3RcVw9Hx5gSwdtseb2Eo1Nta7W1HVXWZrteOwX4G5geGAG62PlnYNuijakX98iJO
         41J9cN9uls5j2Cfq7jwmBdmWmjHjqyiHgG/+Um6MSuCNYeYNilTBQf5Do2RWFvj8UU9U
         dDjw==
X-Gm-Message-State: AOJu0YwK+8lzwdOboReC9vmJeYJ/UIFzPc3v9koUBF8G8DjvUnvTQqJy
	1KjHsC+GlHwqt4m7qYjD/KoId807J7wHtOuPeAH4U9qWYOByLtwsgwpUAYIoWmK7o9axyLyQ5lg
	/ogRRHw==
X-Gm-Gg: AR+sD13jn6AHBITuz1HRlcchBfye2Pww+UZSoZVVZKk3u6RKYyNtNv7+dqTKAWKF+n5
	5AJ0uLyZp5L0djfeEzxL2W26VPYqNOUzoo9BQWYQ7nUbQekW+Gn5kURUUSLgnyNIWcwjnhXPHP6
	56BrfseFPnt6EpSnsEXS4O2ySrcvqLI6QY865OiqlzPkHejsZrzNmORVP/e6ZVLXDlum5sA5e8q
	MPjq1EHpVv6QEq+FWlq6aQwGrvReH1U1o2/axHNZpVPM+Z8kFAZCkHuvT75VKcOrpdj0EJbJf5B
	GBMZOE+lNs2W0HeObNCNb9ekc+KNS0Z075JugX+WqemibH0Rhdo4A5XKqRZmy+GB8OiZc79WeP2
	JRU50ZhN+q7GZSA8ji9TtzNZzePhrqkfDHK5C20Z+8y8H8xodJMbFuE9kaydtDMDBbKI+dGwqRO
	9bH5Sgf1VDx/XQmIeQzjHjVnrXc/f48Mmqt7WQ5D46vw51yNfJWPwFc1htvvW3Td2JGVljuOPFT
	vwYNs6qtYgPix2rC/J3I9x1kOhRCsWq
X-Received: by 2002:a05:600c:16ca:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-4997c0f207emr63429955e9.5.1786554915703;
        Wed, 12 Aug 2026 10:15:15 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981d9dfe1sm70595e9.0.2026.08.12.10.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:15:14 -0700 (PDT)
Date: Wed, 12 Aug 2026 18:15:11 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 9/9] ring-buffer: Make nr_pages unsigned int
Message-ID: <anyqHwaEwIxapzTV@google.com>
References: <20260812153311.2328812-1-vdonnefort@google.com>
 <20260812153311.2328812-10-vdonnefort@google.com>
 <20260812154712.1B1751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812154712.1B1751F000E9@smtp.kernel.org>

On Wed, Aug 12, 2026 at 03:47:11PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] Integer truncation of `nr_pages_to_update` allows a massive buffer resize to bypass memory allocation checks, directly triggering an out-of-bounds page removal loop causing a critical kernel Use-After-Free (UAF).
> - [High] Multiplication overflow in `subbuf_size * nr_pages` evaluates as an `unsigned int` when allocating huge persistent ring buffers, destroying trace data isolation.
> --
> 
> --- Patch [9]: [PATCH v4 9/9] ring-buffer: Make nr_pages unsigned int ---
> commit cb1365ebdbbed7daa3a685ae1d6be7a4167052dd
> Author: Vincent Donnefort <vdonnefort@google.com>
> Date:   Wed Aug 12 15:33:10 2026 +0000
> 
>     ring-buffer: Make nr_pages unsigned int
>     
>     nr_pages is an int or unsigned int almost everywhere already. Also, all
>     the meta-data ring_buffer_desc, ring_buffer_cpu_meta and
>     trace_buffer_meta allowing to share information about the ring buffer
>     are already capping this value to 32-bits.
>     
>     Make ring_buffer_per_cpu::nr_pages unsigned and align all the users to
>     it. As a side effect, this makes ring_buffer_per_cpu slightly smaller.
> 
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index 990a904cefe85..2fccb950e593c 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> [ ... ]
> > @@ -561,7 +561,7 @@ struct ring_buffer_per_cpu {
> >  	struct ring_buffer_remote	*remote;
> >  
> >  	/* ring buffer pages to update, > 0 to add, < 0 to remove */
> > -	long				nr_pages_to_update;
> > +	int				nr_pages_to_update;
> >  	struct list_head		new_pages; /* new pages to add */
> >  	struct work_struct		update_pages_work;
> >  	struct completion		update_done;
> 
> [Severity: Critical]
> Could this type change lead to an out-of-bounds page removal regression?
> 
> In ring_buffer_resize(), size is an unsigned long and can be quite large,
> resulting in an unsigned int nr_pages near the maximum 32-bit value. When
> calculating nr_pages_to_update:
> 
> ring_buffer_resize() {
>     ...
>     cpu_buffer->nr_pages_to_update = nr_pages - cpu_buffer->nr_pages;
>     if (cpu_buffer->nr_pages_to_update <= 0)
>         continue;
>     ...
> }
> 
> If nr_pages is very large (e.g. 4294967286), subtracting the current nr_pages
> (e.g. 10) results in an unsigned value that wraps into a small negative number
> when stored in the 32-bit int nr_pages_to_update (e.g. -20).
> 
> This would bypass the allocation checks and trigger rb_remove_pages() to
> remove more pages than exist in the buffer, causing it to loop past the end
> of the list and free pages that are still in use.

That would mean 15 TiB for a single CPU right?

> 
> [ ... ]
> > @@ -2773,7 +2773,7 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
> >  					 struct ring_buffer_remote *remote)
> >  {
> >  	struct trace_buffer *buffer __free(kfree) = NULL;
> > -	long nr_pages;
> > +	unsigned int nr_pages;
> >  	int subbuf_size;
> >  	int bsize;
> >  	int cpu;
> 
> [Severity: High]
> Will this type change cause a multiplication overflow when allocating large
> persistent ring buffers?
> 
> Later in alloc_buffer(), the pointer is advanced for the next CPU's buffer:
> 
> alloc_buffer() {
>     ...
>     ptr += subbuf_size * nr_pages;
>     ...
> }
> 
> Because subbuf_size is an int and nr_pages is now an unsigned int, the
> multiplication is evaluated as a 32-bit unsigned integer. 
> 
> If the buffer is larger than 4GB per CPU, this will overflow before being
> added to ptr, placing the next CPU's buffer inside the previous CPU's buffer.
> 
> Previously, when nr_pages was a long, this math was safely performed as 64-bit
> on 64-bit systems.

This one is worth improving though!

-- 
Vincent

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260812153311.2328812-1-vdonnefort@google.com?part=9
