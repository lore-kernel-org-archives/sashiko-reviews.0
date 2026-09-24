Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0D119AD90
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254738; cv=none; b=ZbZOyJyzvao5fK2yFLzVxVBd9StZL5aoYG/MJ1eH5s+h7KdemkWCqabONL1vwfSrVfuDOgLiouL8kqukLLiZPgzwP9UIUR1yYdnW6pYGLtxVwEU6gQNuFfyPZxDCh+jrHUAsGn4ph8LIJZ/MH47U/zztMNtdSG93ahwBiLATH4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254738; c=relaxed/simple;
	bh=BJgGU9Fj+0i4oL+e+TBIeROIT9oFpqq3C0WFl9D1HFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZf9eDKqove6FlwyOP6CF1Mgj2XRS5nzevfvZ/ZNJ4a1iZMdGi6RWbi4e5xuNpGY5pS0VD1eUQgDUEDEe2zVGJDHMMbgbwDMfbReYEfeTO2Z0vA1+U8lJKn4hSvXlvxPECbPiJfnpBI0tQEDjHAjMs9IiiMwrChYGqyrCtBYKXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BXUD0G1Q; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BXUD0G1Q"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ce364488dso6574415e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 05:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790254734; x=1790859534; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ykK/QkBykPoiJ79rpm7Iuac0S65e0jYz1HTpICpqNE=;
        b=BXUD0G1QsUKWwwP5B5Tw983/VgpixSwMocKwTczeaBx8qcV57cDAGMxoQhGLRBXLc8
         2Nh/6mmsF4nQRJ7BeComGWILT1J5J/5H8dkKZegAb6tCHZVju9Q4CqeXjcpBIbhpWKBz
         uuW+9GgZYLoCrLaqMEa3eyNcM+Se4ajh6BWf9zl2SwKasiqNuEzFa0GzrQYvZvug/DNI
         Z6EaxAPcm3njojRDjH8Hflg21bV5dQfKakIMecWeLS3tluIqZjEQVWVGGqzurqAhzz39
         Hk43HUeIVQB+0zQmfZY3pQmuV2QFXeVI/XC5JbG8OMlL3sdd6whmu29CdDwtycevnuBn
         /X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790254734; x=1790859534;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4ykK/QkBykPoiJ79rpm7Iuac0S65e0jYz1HTpICpqNE=;
        b=a8iIeArKo9FWFLu3jUlvafFKptDUPQrECGiKTRurUdPjzUwhXHbfcaxQ6Q3J0ZtH4c
         I0cDPK3iBTlROPrYJlXhgOW3yiPO5RGZeg3RPzIctiT/GKnnfV1PJPSrF1tgB1ErF2KW
         4/PkKUe5fSnoPyo2urkM8OxKHLpK9ryo3nJVUw/3WUdlox9nOSFldlg3TPsVKv9tn67/
         0G0bPkafzBBWpZxALoaGVuvduHlD9705MJIYSeYamVb9VTD6kM7NT/B9wmob4nzXUDE4
         UV+lQrEE6WgcsOaDU2Axy4b51tXBII3hsl9cBAIF/aZ8hZQNPAobPAeLG9sf2gfr5xXg
         jx/g==
X-Gm-Message-State: AFuF++mkEyVxLy3+jYZJ5/F1SVqa/WVseKkGq43fluh79Qg8ZZZeW6oK
	fv3Wc/EI70RiKxwvkSd1SbmQ3JbP5uFdqLAeIww5EPqgYFIO5guk5XVRiyFOwIeeKjTQa6GFJ8f
	J/qEqqA==
X-Gm-Gg: AYBFou0iJfS4Kr2yWwXbbHAirrO9zrPlEWHejeojjB6F3pdviuQ6B5xldnoRo2hILgp
	uJuuMUOfeXIXRjW2oR8tvAZapysCzw8LEYBjKP3nXBM0LM8iSyJHHISV5aoU+k0p364AcbPG+Q+
	AstxOLO07PjAlocRIRyFiZxmSm9qldkcfbfIrvY4wR/gLiNqNyvi6JolNIaDSr61MspelC48g4Q
	fK/K/JLkbuUjBUY9n/Zdg2QIpCrxK4BVcg2CO15OyvYcsL25knyHs6qgPTBn8EKLMJrA8BI7VMD
	ix5TFIgYXkU8T379l3tqAJ3f61RualdIj2jb3ux91RwS/FxB3CKo8Jxx1UMBxIzsyLyQyGPqpu/
	N/RNKV+aeBHM+xLPgt7jRTgEo/CSGi06Rd/Rzfrom6sI9AsHgKBcgYI6UCCs4Gh63ReKgY83gbI
	ZXMJOy9iL/vcLzUR/fWUzsajkhyZseHejSKq6+Ggw5zjF7zjMHQVy13++xbhIEySIw0Y1Zj12+5
	9rCZui9qLIle8ULvIkylnexPFeC06yLkeHz+p0QoB7q
X-Received: by 2002:a05:600c:468c:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49fe66f9fc1mr40944395e9.13.1790254733024;
        Thu, 24 Sep 2026 05:58:53 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de187asm64662205e9.7.2026.09.24.05.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:58:52 -0700 (PDT)
Date: Thu, 24 Sep 2026 13:58:49 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v6 13/18] tracing/remotes: Add dump_on_panic tracefs file
Message-ID: <arUeid6jHB-mK__7@google.com>
References: <20260817135517.3919534-1-vdonnefort@google.com>
 <20260817135517.3919534-14-vdonnefort@google.com>
 <20260817141020.330011F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817141020.330011F00A3D@smtp.kernel.org>

On Mon, Aug 17, 2026 at 02:10:19PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] The panic handler unconditionally attempts to acquire a per-CPU reader spinlock that may be held by a CPU halted by smp_send_stop(), leading to a permanent deadlock during kernel panic.
> - [High] Missing touch_nmi_watchdog() in the panic dump loop can cause a secondary panic or hard reset.
> - [Medium] Mixing goto-based error handling with __free() scope-based cleanup in trace_remote_iter().
> - [Low] Missing READ_ONCE() when reading remote->panic_on in dump_on_panic_show().
> --
> 
> --- Patch [13]: [PATCH v6 13/18] tracing/remotes: Add dump_on_panic tracefs file ---
> commit 33a5774bde5e05c9ff209cc5026a9b962c22df16
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> tracing/remotes: Add dump_on_panic tracefs file
> 
> This commit adds a dump_on_panic tracefs file. When enabled, it dumps the
> content of the trace remote buffer to the console if the system panics.
> 
> > diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
> > index 9e78267d71f8b..5536e0df43795 100644
> > --- a/kernel/trace/trace_remote.c
> > +++ b/kernel/trace/trace_remote.c
> 
> [ ... ]
> 
> > @@ -434,58 +455,68 @@ static void trace_remote_dec_poll(struct trace_remote *remote)
> >  static struct trace_remote_iterator
> >  *trace_remote_iter(struct trace_remote *remote, int cpu, enum tri_type type)
> >  {
> > -	struct trace_remote_iterator *iter = NULL;
> > +	struct trace_remote_iterator *iter __free(kfree) = kzalloc_obj(*iter);
> 
> [Severity: Medium]
> This isn't a bug, but this function mixes scope-based cleanup (__free) with
> a goto-based error handling pattern. According to the cleanup subsystem
> guidelines, mixing goto-based cleanup labels and __free() declarations in
> the same function is forbidden because it creates confusing ownership
> semantics.
> 
> Should this function either use goto-based cleanup exclusively, or be
> fully converted to scope-based cleanup?
> 
> [ ... ]
> 
> > @@ -989,6 +1024,117 @@ static int dmesg_show(struct seq_file *s, void *unused)
> >  }
> >  DEFINE_TRACE_REMOTE_ATTRIBUTE(dmesg);
> >  
> > +static int trace_remote_panic_handler(struct notifier_block *self, unsigned long ev, void *v)
> > +{
> > +	struct trace_remote *remote = container_of(self, struct trace_remote, panic_notifier);
> > +	struct trace_remote_iterator *iter = smp_load_acquire(&remote->panic_iter);
> > +	int cpu;
> > +
> > +	if (!iter) {
> > +		pr_warn("Unexpected error: no panic iterator for the trace remote\n");
> > +		return NOTIFY_DONE;
> > +	}
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		if (iter->rb_iters[cpu]) {
> > +			/* No RING_BUFFER_ALL_CPUS to avoid taking cpu_read_lock() */
> > +			ring_buffer_read_remote_meta_page(remote->trace_buffer, cpu);
> > +			ring_buffer_iter_reset(iter->rb_iters[cpu]);
> > +		}
> > +	}
> 
> [Severity: High]
> Can this loop deadlock indefinitely during a panic?
> 
> If another CPU is actively reading the remote trace buffer and holds its
> reader_lock, the panic() function will stop that CPU via smp_send_stop().
> 
> When the panicking CPU executes this loop,
> ring_buffer_read_remote_meta_page() calls rb_reader_lock(). If in_nmi() is
> false (which happens on a normal oops or SysRq-C), rb_reader_lock() will
> unconditionally attempt to acquire the lock held by the stopped CPU rather
> than using a trylock.
> 
> Will this cause the panic recovery process to hang forever?
> 
> > +
> > +	while (trace_remote_iter_read_event(iter)) {
> > +		trace_seq_init(&iter->seq);
> > +
> > +		trace_remote_iter_print_event(iter);
> > +		trace_seq_putc(&iter->seq, 0);
> > +		pr_emerg("%s", seq_buf_str(&iter->seq.seq));
> > +
> > +		trace_remote_iter_move(iter);
> > +	}
> 
> [Severity: High]
> Since serial consoles can be slow and remote trace buffers can contain
> many events, could the time spent in this printing loop trigger the NMI
> watchdog and cause a hard reset before the panic dump completes?
> 
> Does this loop need a call to touch_nmi_watchdog()?

Makes sense. And actually ftrace_dump_one does that too!

> 
> > +
> > +	return NOTIFY_DONE;
> > +}
> 
> [ ... ]
> 
> > +static int dump_on_panic_show(struct seq_file *s, void *unused)
> > +{
> > +	struct trace_remote *remote = s->private;
> > +
> > +	seq_printf(s, "%d\n", remote->panic_on);
> 
> [Severity: Low]
> Does this unprotected read of remote->panic_on need a READ_ONCE()?
> 
> Since dump_on_panic_write() modifies this flag concurrently under
> remote->lock, this is formally a data race under the Linux kernel memory
> model and might be flagged by KCSAN.
> 
> > +
> > +	return 0;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260817135517.3919534-1-vdonnefort@google.com?part=13

-- 
Vincent
