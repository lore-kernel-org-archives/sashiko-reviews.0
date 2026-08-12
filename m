Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E243E41A51D
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552919; cv=none; b=DmGl/RFMQn5zkHGdwN6k15ms6l2ytMBoQ8SG10I5KfGeY4YBt8BYnXGn0ZWB0PT6ER5ViVGWkChyrtiWptoV73s3NdodkOYcPTd9KYIPnzFN71kkx0f1Iygqc3B8ZdFZut5yqwpjPgUl+fo00C1ksuohE8UxnlW+62dmXy8QA+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552919; c=relaxed/simple;
	bh=PjVol4Tb65djtG82OoMJft4ncg82OzrKc1EnjHQJyOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwB7ZioQyeJP4WO9Wpz91xjAdFzT6SYx3kxHDCPrEL2OjS2J6fpXs1o2v+0cDGQyyrfWZ/pHm9uQXdCWyS3nmJZjUlSMR89rACRY4Pv4pBtZSPI+85VlqD7yQgQyCZ2uMpKP0tbZpNF3yWAyp/NXMwVcpIWT0GWwsi1Ms0tgU/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DxGVctXQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DxGVctXQ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47ffaa8ebbdso978611f8f.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 09:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786552916; x=1787157716; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVgq/pUAW2YVRGzzvc+9i8P+jYOJxwDdDeiAi7vwOC8=;
        b=DxGVctXQzvjr9F5eIkTA+pDUHbuunR4dXWc1AgOXsd+pH1McY6LlFlR6c+1N9TWXah
         0bTP2dxWQvv2xjUZjwl84dpA1JIWWbgQ0Wq0BDanRV9gDokow91OFGw8/a4VzFDxl+Te
         5viFWiCu8ZgGUGhI8cU+cR6M95MIaoXjc/VdvfwXS5gGtmJgSd15DBbzOZDGZ54aMpBj
         1+UxZ8Wg/8pMwyxfwgU6YRrsEH28ZTqc4Fj4pZP+JPsUK5rWGYcj7MC3DcqbvusJjh9J
         G4tJ+foBm7VT42ObDyxD/KRFpq9jwE9R2dQtPuwACyPqo9lN+VUptiQN29t+WpQfhSVK
         lGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552916; x=1787157716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wVgq/pUAW2YVRGzzvc+9i8P+jYOJxwDdDeiAi7vwOC8=;
        b=I61bDnzpGtnAmZhIl8K3UbGsE2gVbFY7c1BVm8awvq5J+DKkHlOfhh/GZkQhMZyvZs
         WjNHZ7M9JvVx4+8hsw7dEj2NP/oWspg7rn92oRx0xgT5ThTHDytIaP07FXZ6aZnBiD0N
         ENXfAtego+2ulF5irhZuvLO0ijMPvdTl25BezIxbIekK1rgS5Q/z4RLYI/E8vy9FXJMP
         mUnH8PG2XBgkb3kQsmGO8xoWwm0l15HIK23A+hlKFqfsquTT/m1Qe4A4iWDxTOd4BK2o
         cVrJ8WKKGb+JWJwIBJOvfuNunfNpOc02idoYxcLSY/FbxoAorukr2bbMitzprUbZRRt1
         t86A==
X-Gm-Message-State: AOJu0YziJU4oSJO1Sia2QP1euRgbHAhjGtS8wo6MkaLXT10bevhTKTer
	F5oFU8uch0Pd5V71nTCfXQH5Clu5EsRoyS/BDsL5V4lrM5eAOVs5lwd2J0IwEzzThLR0Nj9fRBn
	961LpDQ==
X-Gm-Gg: AR+sD12emK1dz9gS4k3793C8C9wSw/j6ItO8Sz3xaRVtMqVbZKK0Ren4XcV8UnXDGCS
	teCDEW5ClJJXXWQgWpJyiWt1bDH8Ag20CBdo+vok1z4jw1wmEGTATgVRwKF13+aki05re9vGz/a
	0edOOm8yLPfyrKO2FRT+3A9rDPWA8+KWTgOZ5ZEuuj3c/49EAaYDy14qLcslGMBYbxwsdo4WlUl
	2u4Wcx1Bhsx4OikGfosRqFLIdwaMWRap+ZUHR4rKouZgy2QFfFDoEosznET6rxtDTDAIPjVbstq
	iYFU1mvgb08bSsnwzuoBl9E7cRMsJU+hSNZblHAnyzVhs8N7vfFhHdCHyAxPYERpqM65lN+KylW
	dFdNMC3TLQARzC455e4xu6LDwrkhpWK52VyBn8DS0OhsQaydkWLXVZe/26SR2ESI+lXZ+wsINTl
	PDUv4DTWjuyM8X2Eib8wNu/AKpJVsFzax5aLY9rRNqa2DmDBX9Pqc7X070oD68yO+8f9+7HoajK
	x8j+5AllV8BsPEczQ0ahoTnw46jyhVA
X-Received: by 2002:a05:6000:250e:b0:480:2fd:96a6 with SMTP id ffacd0b85a97d-481528b9df6mr9204800f8f.7.1786552915607;
        Wed, 12 Aug 2026 09:41:55 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d4e675sm9197192f8f.23.2026.08.12.09.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:41:55 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:41:51 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/9] ring-buffer: Hold cpu_buffer::lock when resizing
 a subbuf
Message-ID: <anyiT3KzVIm-4ZeD@google.com>
References: <20260812153311.2328812-1-vdonnefort@google.com>
 <20260812153311.2328812-3-vdonnefort@google.com>
 <20260812154659.3E3081F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812154659.3E3081F00A3F@smtp.kernel.org>

On Wed, Aug 12, 2026 at 03:46:58PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] The patch attempts to fix a race with `cpu_buffer->free_page` by adding an `arch_spin_lock(&cpu_buffer->lock)`, but it leaves a severe Time-Of-Check to Time-Of-Use (TOCTOU) race unaddressed. `buffer->subbuf_order` and `buffer->subbuf_size` are updated globally outside of any per-CPU lock. If a reader (like `tracing_buffers_splice_read`) calls `ring_buffer_alloc_read_page()` concurrently, it locklessly reads the NEW `buffer->subbuf_order` but then retrieves the OLD, incorrectly-sized `free_page` from the locked cache. When `ring_buffer_read_page()` uses this page, it copies data up to the NEW `buffer->subbuf_size`, leading to a heap buffer overflow if the new order is larger. Similarly, `ring_buffer_free_read_page()` validates `data_page->order` locklessly; if the global order changes just after the check, it inserts a new-order page into `free_page`, which `ring_buffer_subbuf_order_set()` will later free using the `old_order`, corrupting the page allocator.
> - [High] The patch adds an unconditional `arch_spin_lock(&cpu_buffer->lock)` to `ring_buffer_subbuf_order_set()`. This creates an NMI deadlock window. If an NMI (e.g., from a watchdog or an Oops triggering `ftrace_dump_on_oops`) fires on the same CPU while this lock is held, the NMI handler may attempt to read the ring buffer. The read path (via `ring_buffer_peek()` -> `rb_buffer_peek()` -> `__rb_get_reader_page()`) unconditionally acquires the same `cpu_buffer->lock` using `arch_spin_lock()` without an NMI-safe trylock fallback. Because the interrupted context holds the lock, the NMI handler will spin forever, causing a hard lockup.
> --
> 
> --- Patch [2]: [PATCH v4 2/9] ring-buffer: Hold cpu_buffer::lock when resizing a subbuf ---
> commit 1db68f92346fd21f55d54529fb97b920f02a0136
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> ring-buffer: Hold cpu_buffer::lock when resizing a subbuf
> 
> This commit adds an arch_spin_lock() around the clearing of
> cpu_buffer->free_page in ring_buffer_subbuf_order_set(). This aims to
> prevent races with ring_buffer_alloc_read_page() and
> ring_buffer_free_read_page() during sub-buffer resizing.
> 
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index a3d28b2e2c94a..ec4f5a0c93e85 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> > @@ -7431,8 +7431,10 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
> >  		cpu_buffer->nr_pages = cpu_buffer->nr_pages_to_update;
> >  		cpu_buffer->nr_pages_to_update = 0;
> >  
> > +		arch_spin_lock(&cpu_buffer->lock);
> 
> [Severity: Critical]
> This is a pre-existing issue, but is there a Time-Of-Check to Time-Of-Use
> (TOCTOU) race between the global order updates and this per-CPU lock?
> 
> Earlier in ring_buffer_subbuf_order_set(), buffer->subbuf_order and
> buffer->subbuf_size are updated globally outside of any per-CPU lock.
> 
> If a reader like tracing_buffers_splice_read() calls
> ring_buffer_alloc_read_page() concurrently, can it locklessly read the new
> buffer->subbuf_order, but then retrieve the old, incorrectly-sized
> free_page from the locked cache?
> 
> When ring_buffer_read_page() uses this page, wouldn't it copy data up to
> the new buffer->subbuf_size, leading to a heap buffer overflow if the new
> order is larger?
> 
> Similarly, ring_buffer_free_read_page() validates data_page->order against
> buffer->subbuf_order locklessly. If the global order changes right after
> the check, could it insert a new-order page into free_page, which
> ring_buffer_subbuf_order_set() will later free using the old order,
> corrupting the page allocator?

This is hopefully fixed in one of the following patch of this series.

> 
> [Severity: High]
> This is also a pre-existing issue, but does adding this unconditional
> arch_spin_lock() widen an NMI deadlock window?
> 
> If an NMI (such as a watchdog or an Oops triggering ftrace_dump_on_oops)
> fires on the same CPU while this lock is held, the NMI handler may attempt
> to read the ring buffer.
> 
> The read path via __rb_get_reader_page() unconditionally acquires the same
> cpu_buffer->lock using arch_spin_lock() without an NMI-safe trylock
> fallback.

This is under raw_spin_lock_irqsave(). I believe the panic path will first try
to issue normal IPIs.

-- 
Vincent

> 
> Because the interrupted context holds the lock, will the NMI handler spin
> forever, causing a hard lockup?
> 
> >  		old_free_data_page = cpu_buffer->free_page;
> >  		cpu_buffer->free_page = NULL;
> > +		arch_spin_unlock(&cpu_buffer->lock);
> >  
> >  		rb_head_page_activate(cpu_buffer);
> >
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260812153311.2328812-1-vdonnefort@google.com?part=2
