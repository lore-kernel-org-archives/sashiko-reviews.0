Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E93025B2F4
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254445; cv=none; b=RLf9WdTjm/S3hxsReCWaGLN0iuCY97QQz/B9fZimWFPwRbis0E7xg8s5jZuHELA2830qZK2sVK9zftVNY1sYyl0FZwe1kSIa/4rsrsufGXSxZfvHnvd3x1IUCSFB5qlzoejZVLM82zIF5v6IwWWHCsLKm30zDaXRQcE1vdrVaKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254445; c=relaxed/simple;
	bh=60BGbmO6JnqJy1zcM4WcjNIxuBp/1/MBR0f5PNBn/ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+BtVppWQGFGHNPf7rKZVoPBaE66Wa6/J916UcjfvduJcxgM3MuCKpfEgiiVg+5U+HVorey72NcsfXsp2K7oHF68Qj82uOwnvZRCetCmSlQX94OjPkHHebUjNxVyqggLl0f9qsN49A8SBuERoSZo4rdpjvXJiVevjKJ7/4s7fnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A0gVcisV; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A0gVcisV"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so1371961f8f.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790254442; x=1790859242; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q/0D8UdTsfWb5fXahtezHfnKDdqvE6b7jnEG+b5uols=;
        b=A0gVcisVK7h1B4xWTRXwb5f1QlCWuCueoA8dSwCWTtzfliobHi6IYBgeJfsC5QY8Iq
         g0r0ZRImdPi1y/S0qQClVIwpD6snlOtbUb5NijRiE6ps+zC8NFQNtgD+bwfsfIL2t1A8
         bpKjxLlY6CgdiyGbA/eurq+vYSF1Yv2Ns+Qoifgx8axa68hJNAg3h908ccesIJdOgIlF
         C+kyt4sOQm3d3HVuprD7g8/dTYndzGb0JNWCk083GdKYyALFdcnBf2l5OtYVEa/zso3j
         F1Z0Hmih5j8ZITgOBc+BN/TTQVdx5JOEYn2zgg03GthPZl6S6P4gtA7jr7WlUO9ttnyK
         Y5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790254442; x=1790859242;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q/0D8UdTsfWb5fXahtezHfnKDdqvE6b7jnEG+b5uols=;
        b=E+cePblqcpl+hBaBU271YAAglHXMzyH0IEt5C73NEEXrJI32yxRkyZCLMz6hnrMfFH
         WaNff3tNB1uz9yeZr5q+q1eBALm/mVPrJ0+/gojtb7GnEqLkoHOXoeCMtJOJxbYarH1v
         3OPt8j+3lduDkI6PMY02Gce5bxhwhxblkAOJP+i+iaINU+UF3A4eXRwddVheLIgpIh6e
         nO+i5dpCHpcjvXDjYlsz4wfTGD6SOaxo/qiv3mSj8pKmdCHyXrQesdhvGkCwdLVIKu/k
         NOEHa7QsgYTIe/uQLRps9ku/mp3JF5t5e1F3QnolrmXB+4xHusB49fso7i3TNjvhbyr3
         f75A==
X-Gm-Message-State: AFuF++nlwX8xNFz6/kNUCkmGorRlF02Y4gdY8NG7pLDMw1uO8GC9D6Pj
	6PXo3uTXjOGEu+TtGzCkmS1LeiN3pbqfum3KIGropAQW2cOcQID4vhGjoAUpT2VBvcnY6VmmQ3B
	LUTWZXA==
X-Gm-Gg: AYBFou0B3QbMAE1p2cMzMM877WoX63T8kr4MkQaegZPRh3vm8iZIqm/npsu8w02QQve
	ePodDrd/1UlVy84CezXFn0T6ISyLZtKMqn9a2nDEcRFF5wAZ1dr1w3jEoX5EeeDMn2NfxBrbfjS
	jISOAbV+0taOWoY9KTSceemVH8StU+gQp0C+Jais5kOO/F7HWEokM0YlxjNCPsi8C/saAw3Ck82
	Gkr8CHNMWtnvLh7mDh9vP75CVMWAwEQTmG2CXtfzxQLXolxhGXNXdUXpI9xPSibpXjGdHh8hvti
	WdaNva/+ucwf0J0F7t5iX4cuKlvn4z5n/GKsez0egdRpcOyIfJz3QxqBSkNJJ/xpJzePANSoUBx
	w8bzwHJK3YBFxQouAJyYIA7P2xDp3DO3sK7Gvvoo65Bq5PwughYbkHaJpLAVcERNZal1YNeIel+
	Js/omDbkdEHdV0qI/6HSaUNti4ffXFq5AhxPsfW+MlTXjAnwGJQdG2pOAAbZ9k6pEp6ulywfSye
	7qVvwBNTovL6TDX9Keh0yuwVL4ZGlumYOgekbgJ13g=
X-Received: by 2002:a05:600c:3107:b0:49f:cbad:eef7 with SMTP id 5b1f17b1804b1-49fe66fd4ddmr41363975e9.33.1790254441788;
        Thu, 24 Sep 2026 05:54:01 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cbd77bsm79019935e9.8.2026.09.24.05.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:54:01 -0700 (PDT)
Date: Thu, 24 Sep 2026 13:53:57 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/18] ring-buffer: Use panic-friendly locking in
 ring_buffer_iter interface
Message-ID: <arUdZfrYMlRVjYAD@google.com>
References: <20260817135517.3919534-1-vdonnefort@google.com>
 <20260817135517.3919534-11-vdonnefort@google.com>
 <20260817140454.231C71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817140454.231C71F00A3A@smtp.kernel.org>

On Mon, Aug 17, 2026 at 02:04:53PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Incomplete panic-friendly locking leaves the system vulnerable to deadlocks during non-NMI panics.
> --
> 
> --- Patch [10]: [PATCH v6 10/18] ring-buffer: Use panic-friendly locking in ring_buffer_iter interface ---
> commit ecd8a71adf986114125493b0d7821b40d48b7d2e
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> ring-buffer: Use panic-friendly locking in ring_buffer_iter interface
> 
> This commit replaces raw_spin_lock_irqsave with rb_reader_lock in the
> ring_buffer_iter functions. This prepares the iterator interface for dumping
> the buffer on panic without deadlocking on the reader_lock.
> 
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index a7d9936b4c835..a6f2293f409b8 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> [ ... ]
> > @@ -6302,11 +6308,14 @@ ring_buffer_iter_peek(struct ring_buffer_iter *iter, u64 *ts)
> >  	struct ring_buffer_per_cpu *cpu_buffer = iter->cpu_buffer;
> >  	struct ring_buffer_event *event;
> >  	unsigned long flags;
> > +	bool dolock;
> >  
> >   again:
> > -	raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
> > +	local_irq_save(flags);
> > +	dolock = rb_reader_lock(cpu_buffer);
> 
> [Severity: High]
> This is a pre-existing issue, but does rb_reader_lock() actually prevent
> deadlocks during non-NMI panics?
> 
> Looking at rb_reader_lock(), it only falls back to raw_spin_trylock() when
> in_nmi() is true:
> 
> static inline bool rb_reader_lock(struct ring_buffer_per_cpu *cpu_buffer)
> {
> 	if (likely(!in_nmi())) {
> 		raw_spin_lock(&cpu_buffer->reader_lock);
> 		return true;
> 	}
> ...
> 
> If a standard oops or sysrq-c triggers a panic in a normal process or softirq
> context where in_nmi() is false, won't this unconditionally call
> raw_spin_lock()?
> 
> If smp_send_stop() halted another CPU that was currently holding the
> reader_lock, or if the panicking CPU interrupted a context holding the lock,
> this would spin forever and prevent kdump or panic_timeout from working.
> 
> Should rb_reader_lock() also check oops_in_progress to fully realize the
> panic-friendly locking behavior intended by this patch?

I do not see how this can happen. All rb_reader_lock users are also disabling
with either local_irq_save() or raw_spin_lock_irqsave().

This is also what ftrace_dump_one relies on.


> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260817135517.3919534-1-vdonnefort@google.com?part=10
> 

-- 
Vincent
