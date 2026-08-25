Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BA83DE420
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 08:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646375; cv=none; b=haDKISr6GvUqe+U2WayVt0HbMSQZ0PzdB468tdF4GDmXysaxe9a8jLNdrYNENorGc0AFxbMx5RareOPVaCRD9n8qCZksm+ep9acQ0m8y+XW7KjrV6iKoxiDhWylJQ4C/MRutIhTdRcca36NsXMxduwM9maR/mtykyF0BoKu1UfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646375; c=relaxed/simple;
	bh=P8dDe9WGJaB5/v6G6RAFPTJUDTZnGgg0DTzE8KtbvoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6MACdaEZAwjCcMv/hX3B8RwghfNfk2jbMKLRVokh73VD5fFGxSVpqhwzCcm7Ws+nX361SyEFc/lWuxrM2IxBdHj/havbpZa336SJ1ca7mIORITVQfvTbfxIQmsQEcZTpyhd0SamjpBXhLb6dz4FO9iZdVkQuj/CUcZBY4+eJu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lkNf090b; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lkNf090b"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49800c6a846so36118305e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 01:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787646372; x=1788251172; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LX5TxyIQ51uP9mPCb4WWu473qdFXpXWJJ9AlVry9ycg=;
        b=lkNf090b8QFUHisH8XvNsIIAqgJfyo9Vb6NRhL1t1PgCybc3Dm0lExgr23p+G46UGt
         p2xXEupu6GaEWbng/Y/WfVAAdT0TMLrkmmqpH86yNZRMejAPDHhA5ehTTwh2vUC55Xgx
         W4t2RoQxQjYTcIGXjrs3liJVyB5YhpVALst54ADlUbq9KSCj7aWDPxpwh+z1HudKvJKv
         uCB+j/6u/k3H9toYQ7TOPVJ/jpTfVwqe7gRhPZXAz77oK7xUosYqM4p001lEwjmKtdAD
         tpGS0f57dRfJTOpBNFPxPnVOgVXEtnWG4CzBRb2YlX4L9iz7VSky3itGfFuiNqeuw0L5
         jSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646372; x=1788251172;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LX5TxyIQ51uP9mPCb4WWu473qdFXpXWJJ9AlVry9ycg=;
        b=nMfqp027cA1EOOqLsatzbG5M/H78OTIm9Y7BOTaSM+3TQQPH/fTvbCYDIwF37QyHPe
         UBDsGhwvVH70lkhwIY9VG3a/vWMQJXvtrqv3xomryllL6Jzax0pxLM10odMDNZR3AbAh
         4gJFYyV1CNiHZio190jXylONaEdNPIG3FVIiFXh3TKn7EdYSqfxJ33BJ8XUUXcu7il82
         etwbRVDwadY7wnqYAI02ISBqWwNA2AF53/IFE12Iy3HU+8l7PZVCUu2OquTUr+Wmy/5n
         /1zbNfjoOCmLQWGAQmQ8QzsAbwCme3OySsY7aHgQcHJ/0Xg2GlZthlVJwjHDY5Ix350O
         fscA==
X-Forwarded-Encrypted: i=1; AHgh+RrjSJmX2AWhDjZQ5GRiiDMDjc8OhOBt/BlYAaVyFssR3D4nJMIhKjn8zGe6IoGcR/3UYNsR1XyY8HmFIAuihdU=@lists.linux.dev
X-Gm-Message-State: AFuF++krp2GNCfFagL+JiLQeEG1O2ARGGvZP1Z0Xq298r8BQYEucn+CS
	/gzFokhVT6rrA4GvX0L3d3m3k7faQ8Qk5jrS85kobInb6ejG/OYA/fdEmBnPNwRad1Kr/YrNDEH
	zWe9GXfK/qw0=
X-Gm-Gg: AR+sD10EpCP1QbjjRjHAFGNtBlXSHbPVqPikYLs6dkPQSKQLovIb/pblVajmuhZcczc
	OgNDCQ1af56UKBURpTZlwpXxzjFPvx38njnbtwfDcaiUarOBR87ABTn/G8MLPzLKo/eJDgBqtxL
	35UmbD3paYrFZDGJq3tozrn2XiaAHhoOUko8B1xzExEJzFFoRc1lBzWW4grn4+y2Agg9/ZPFyAI
	E1SXlQ5253h4fktJJnQIeakrWA94Hg8BbE6SL/jw3teDoP3rFGnRvGwYoZuzcBbcm/0GqFVLa2S
	aQXr/KdAHfO54B3DumIelZT8R5KSBUCV+Jh3jgOnxQKNAY1XQ4nL/ME4mLCEUKWV795OCAryNzp
	WJ4RO7kA7SYHvWhJq26xq25VvkBxDXWHf2qpw2EZXKpxRoeUDuMvkspmHzisyvW1lPjtErqhx1t
	goT7qLcb/AHIeBdb9JHhGVxdvfG2UrZehgD8GOMsuFlgMrdkHzX/ZeMnhTbPE5njMVNAr6NWRpq
	IJTjRGECydKnNimzOIO+Miy5uMuacsmbc5QEg==
X-Received: by 2002:a05:600c:3b9f:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-499d652362amr52626925e9.12.1787646371723;
        Tue, 25 Aug 2026 01:26:11 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d633506bsm21294465e9.3.2026.08.25.01.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:26:11 -0700 (PDT)
Date: Tue, 25 Aug 2026 09:26:07 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] tracing: Fix subbuf resize races with
 trace_pipe_raw readers
Message-ID: <ao1Rn8ZKr5XafWRZ@google.com>
References: <20260817134750.3909384-1-vdonnefort@google.com>
 <20260817134750.3909384-2-vdonnefort@google.com>
 <20260817140812.2C7D41F00A3A@smtp.kernel.org>
 <20260822110424.346fa3c8@fedora>
 <aotTYT0zE5LNik06@google.com>
 <20260824105315.27377f30@gandalf.local.home>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824105315.27377f30@gandalf.local.home>

On Mon, Aug 24, 2026 at 10:53:15AM -0400, Steven Rostedt wrote:
> On Sun, 23 Aug 2026 21:09:05 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > > > [Severity: High]
> > > > If ring_buffer_read_page() returns -EAGAIN because the subbuffer order was
> > > > updated but cpu_buffer->reader_page->order hasn't been updated yet, this
> > > > branches back to the again label.
> > > > 
> > > > Since the loop does not yield the CPU or call cond_resched(), could this cause
> > > > a hard lockup if the reader and the resize thread are on the same CPU?  
> > > 
> > > Hmm, this looks legit. We should at least have a way to break out if it
> > > loops too many times.  
> > 
> > Can this happen only on !CONFIG_PREEMPT systems?
> 
> It can happen with RT tasks as they don't yield. If this task is of higher
> priority than the one resizing, then it will loop forever even with a
> cond_resched().

Ha yes of course!

> 
> > 
> > I can add a cond_resched() here though, I believe that would make sense: if an
> > order modification is pending, writing is disabled anyway and we are about to
> > loose the stored events.
> 
> For RT tasks, cond_resched() wouldn't be enough.
> 
> > 
> > Additionally I can reduce the window where buffer::subbuf_order differs from the
> > reader page order by adding an "order" argument to __rb_allocate_pages() and
> > only set buffer::subbuf_order later in ring_buffer_subbuf_order_set().
> 
> I'm wondering if we even care if data_page->order != cpu_buffer->reader_page->order
> and should change it to being a force copy instead.
> 
> If the reader_page is bigger than the dpage, and only copy what the dpage
> can hold. It would also update the read value of the reader_page which
> would allow another copy to get the rest. If the data page is bigger, then
> just copy everything.
> 
> It's not like this will happen often.
> 
> -- Steve


That sounds interesting... that would get rid of the -EAGAIN. Let me try.

Do you think it is still worth to reduce the window of discrepency between
buffer->subbuf_order and buffer_page->order?

-- 
Vincent
