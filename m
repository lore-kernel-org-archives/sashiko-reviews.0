Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136B138E8BF
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309218; cv=none; b=ZhiQwh5VuCRFZ3voHXGLFfHy2/2LZwNB9Ew33bYYp38+Kg383PkgC2CaatHtOp0f4FOZs3rnIUgpuhQq2B/IPGV3fwz0i+Q+mgpeaynwXR5SyuuoV+/M6b098spqaF4qw6g4GULWxUduN4qvTWDdc0PnPjU4OyzpjLt7jiIh5yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309218; c=relaxed/simple;
	bh=VkHk4No+sn/hTRAoCJ6c2rKomSzgYN5lIjBaYnFIVOE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TVmpUG+jgAzrmWigbund/dUGzLtPO1bddIA5P+hpmFHyg0ZaIwP1JvITdBhU3FfNJPgtvLOJvhIJ9KoKMwgDL11hI3UWd8vQUmazHzbkH8Nc5SY7U1yK1tN8C8aQtDRYHb+Ypl1Nzx3OUmJiaHuQgTBxDGiKoI/BtY6IPWpHIWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vfQs6xV9; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vfQs6xV9"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-46010bc0f1eso410145f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780309214; x=1780914014; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TPi/JDyDp1v6pzp0p/cJ1JGw5JpKb6KywybUTo910mg=;
        b=vfQs6xV92KYipon39R6sRBnw+8AJQylLRjbTRcbVLkoKBA/DaUXZvksbILoOahBmdx
         f6u+2orx/dCS3PF4+l+UiT1ZrUFfFIFpcnHT5CIzG1BHWUB3pWtZJrVzAzrT6HHz4MIo
         QFEDxLy2/YJtMISioHnNGMdCg8b4xwie2oxnV3zQliZDJr0qVdlEoYtdHYLkIS5gNPpR
         tjwoGHRwJ8sqwkr0npsQBIN6yo4HxDV0EkF0aN41/JkeHfPXnlRj0VL0G+tGIu9ks1Zv
         GChuSlsbDSCjp0kEegnnAVB44WjAYQwA/hVj97QnrXcQJKBN3UMQ0U2xM/U+MhClqmWf
         8xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309214; x=1780914014;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPi/JDyDp1v6pzp0p/cJ1JGw5JpKb6KywybUTo910mg=;
        b=itkMDBXNkcHlBxGA2dl0pXPJLwrgkXNXqN1Ao2QtoLUbA7fc4I37d3LbJITVqqza2Z
         rVJ2Y2r1bzCR9UH/C9/WauwcnHsyj1gN4bL2u6ai55laF4mJnHQGj1vmvNSekVEkKGnC
         s9dDohVgr0qfPMKdIImcsCNGfL8chrg2E/bBvj5EQs2NGcoVKbaWHWYkWlEH0GOeCuLs
         N0WQ+i4H7V/bsy/0wFIGD8Q/0qQnp7r476TKr+jyQ943H250z4F+dpDYDypF1SSNIaK7
         Pvstz6wQkWWGcLmC1J31ga09/YbXJkH0aANCwNlyq8D3vbeCKAnNHj8NgZD9ttInQG4R
         zq6w==
X-Gm-Message-State: AOJu0YznOrqP8HFZiZnxSHMn2w0JYFs++W5CRFfIFw55O/vNQtGiXx/v
	wFTLIuVgEY13IjzP6UMWGjnHxURRzOO/27RTPBCVxFrs2bIcNHxuO0O7PI0FiMpsg26LSa2Ox1I
	+auKArsb6LLPnTsliAn9bmB35IH0uS5rq9TdY9QRhQMlYohUL3t10RGrUwJC5dGdpnKCYfm9NKi
	ho5iiSGIJBp7hGbtHI7jhisqer83iWUAOAf8k8iFZ+c1docgoXRiEfennA9BvHXKe9
X-Received: from wrmg6.prod.google.com ([2002:adf:e406:0:b0:45e:f121:4e17])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:45d0:0:b0:45e:ea9b:edfb with SMTP id ffacd0b85a97d-45ef6b8b5f5mr15231355f8f.39.1780309213836;
 Mon, 01 Jun 2026 03:20:13 -0700 (PDT)
Date: Mon, 1 Jun 2026 10:20:12 +0000
In-Reply-To: <20260530150622.393FC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260530143541.229628-5-phasta@kernel.org> <20260530150622.393FC1F00893@smtp.kernel.org>
Message-ID: <ah1c3NSU-4UkdUhb@google.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, May 30, 2026 at 03:06:21PM +0000, sashiko-bot@kernel.org wrote:
> > +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
> > +    fn as_raw(&self) -> *mut bindings::dma_fence {
> > +        // SAFETY: Valid because `self` is valid.
> > +        let fence_data = unsafe { &mut *self.data.as_ptr() };
> 
> [Severity: High]
> Does this create an exclusive mutable reference to actively shared memory?
> 
> DriverFenceData can be accessed concurrently by other threads holding Fence
> references (for instance, when checking if the fence is signaled). Creating
> a mutable reference (&mut) in Rust asserts exclusive access and violates
> aliasing rules, which allows the compiler to make invalid optimization
> assumptions.
> 
> Could this use an immutable reference &*self.data.as_ptr() instead?

Yes, please use an immutable reference here.

> > +
> > +        fence_data.inner.inner.get()
> > +    }
> 
> [ ... ]
> 
> > +impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow<F, C> {
> > +    fn as_raw(&self) -> *mut bindings::dma_fence {
> > +        // SAFETY: Valid because `self` is valid.
> > +        let fence_data = unsafe { &mut *self.data.as_ptr() };
> 
> [Severity: High]
> Similar to DriverFence::as_raw(), does this also incorrectly create a
> mutable reference to shared data?

Here as well.

> > +
> > +        fence_data.inner.inner.get()
> > +    }
> 
> [ ... ]
> 
> > +impl<F: Send + Sync, C: Send + Sync> Drop for DriverFence<F, C> {
> > +    fn drop(&mut self) {
> > +        let fence = self.as_raw();
> > +        let mut fence_flags: usize = 0;
> > +        let flag_ptr = &raw mut fence_flags;
> > +
> > +        // SAFETY: Once a `DriverFence` is initialized, the inner `fence` is
> > +        // valid and initialized. It is valid until the refcount drops
> > +        // to 0, which can earliest happen once the `DriverFence` has been dropped.
> > +        unsafe {
> > +            bindings::dma_fence_lock_irqsave(fence, flag_ptr);
> > +            #[allow(unused_unsafe)]
> > +            if warn_on!(!bindings::dma_fence_is_signaled_locked(fence)) {
> > +                bindings::dma_fence_set_error(fence, ECANCELED as i32);
> 
> [Severity: High]
> Is it intentional to pass a positive error code here?
> 
> bindings::ECANCELED evaluates to a positive integer, but
> dma_fence_set_error() expects a negative error code (and triggers a WARN_ON
> for positive values). A positive value might also be interpreted as success
> by callers checking for values < 0.
> 
> Should this be - (bindings::ECANCELED as i32)?

Please use ECANCELED.to_errno(). Do not import these from bindings.

> > +                bindings::dma_fence_signal_locked(fence);
> > +            }
> > +            bindings::dma_fence_unlock_irqrestore(fence, flag_ptr);
> > +        }
> > +
> > +        // SAFETY: `self.data` is owned by the DriverFence, but could be accessed
> > +        // through some dma_fence callbacks right now. Access is being revoked
> > +        // above by signalling the fence. The DriverFenceAllowedData trait
> > +        // ensures that the data either does not need drop, or if it does it
> > +        // lives in a RcuBox which will delay dropping by one grace period, hence
> > +        // ensuring that all readers have disappeared.
> > +        unsafe { drop_in_place(self.data.as_ptr()) };
> 
> [Severity: Critical]
> Could this eagerly drop FenceCtx and user data before the C dma_fence
> refcount reaches 0?
> 
> The C dma_fence object can remain alive as long as consumers (like sync_file
> or the GPU scheduler) hold references to it. If the backend later invokes
> callbacks like ops->get_driver_name(), FenceCtx::get_driver_name() would
> attempt to read fctx.driver_name from the already-dropped FenceCtx:
> 
> FenceCtx::get_driver_name() {
>     ...
>     fctx.driver_name.as_char_ptr()
> }
> 
> Can this result in a use-after-free?

Hmm, I don't know about what sahisko said, but I don't think this is the
right way to do rcu freeing. I think the type's destructor should be
reserved for cases where the value becomes immediately unusable.

For example, let's say I'm using RcuBox<_> here. Yes, the data you get
from dereferencing the RcuBox will stay alive for a grace period, but
IMO once you run the destructor of the box itself, the *pointer* becomes
immediately unusable.

Alice
