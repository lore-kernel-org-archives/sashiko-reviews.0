Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F1437F01C
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318534; cv=pass; b=WfMy4EPgOTlP2d6FXXSoHFs7SiZcUfOLodiBWsjT7b+3dlMzhEefkzWbq8WlI6357Q2lOnAXIF2UrZB/8ps7Z5Q+CNm7YVOK9JQ8JmzlsWfyaOcvAB1evmfOEm0LhWrVk6+j5Dbrrnwnf8Hv5bpDpcaBdmrHgNAapYX4C8TWkps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318534; c=relaxed/simple;
	bh=Ujk44KgH2bVgDe92f5eRLoMsj9ATbd2139QiPmqQ0u8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7ANiULVnJ9Jx4gd1o0kkPEMzhkD1qk30o2YFqO5ohHcdd4ClnAnawBlcmCFvmPCQv11liXnC7qONaCH6y+HAzH2nUj6hh4qx4bHMGhDUbZatFIzB9KGLzw1WA1We39sFl3tgw2Bd+f8OTqN5lirhc/RGf5ZASCvGROzZlgsGyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tz4woFUg; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tz4woFUg"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-306f36df4feso762268eec.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 05:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780318532; cv=none;
        d=google.com; s=arc-20240605;
        b=dnlnRZGCXiRkhOb3vQwTGjh1JskVANtrZ40AFVgAerL/tPz+zfh+OIswI9T7ycqLRi
         JHFnLxInO+LkAB+RxoUxj8ybMToJp2UEFvp5X23fr4zHA32VAY8uysQvYLlV5+wDhUqV
         xUGXKL+53BGKfizbm+O9xm7DHLLmni0V6cIJS3vvCQ3nrQFZIjnmgcbIvHtMO2q8pECt
         A+McOGWR14HkDee2Rsdc81+3MKUu0ZJHOO/Yh1093bTdyQ+1+EAAi8Rw4T9HfLnho4Ov
         ei0JUYD1xPH/wxdf8SCtUBuIxvubiJq2zNafws3zEoRkdEQ2ygSQj/NAqINY8ZtTwf8s
         KD6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WNejM85KWAcefPz6v9xEkmaQJmPlaeAZyMFSHUG5YSM=;
        fh=EYiK3zQvtn35hRs6p5eTzXcfeqgtKg25Zc15fQsTiAA=;
        b=jTE7sGX9v+Am1fhtIN24iDcDxggDA54kOJfoc6WYlQ8S7ZNrMZ3I0pdCgX+qyQ+pJQ
         x56yQQFfXrYcfnhQhmWmJZlBWjmzFfovR7aU5MDRl9roFLcBiZ8H9AdORtPpCdMP6p9m
         6XhV7o7HdCtHskYzgMe5YcdfCoPmAw/dffIMMt7H+Ag8teEUxWhv9jBkDb8Cm8w9T0q/
         B/QVFMzV/n7M4+OyG9pRqbBUfHc+jmVZ8gb0QkbcetgDfw7PTFP7ji+40wqB77GeXxVu
         6Y65rQJbkSeld78i74leOirvVC7Nuj90ULGrgvQBeH/vjbtiSH0zoem9RKmuuFhR7Hxj
         78xA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780318532; x=1780923332; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNejM85KWAcefPz6v9xEkmaQJmPlaeAZyMFSHUG5YSM=;
        b=tz4woFUgt/9BHq5W+tbuIpz1q2BxCLlgxsP8gYnYeY633db90JDdH7BJuNM9Sb6O1c
         wW+i6I3Q7/ZHm6WTl8T4qodHwCwEIMG+JkPzSspCIFmpFT+E6OAen4T2p+1PgF1HGjt7
         eZ0I1BaVKkj+eBTXCu7HTsp3cYyns6FKpEFZzwx0+1H+PJZ0b0DzGfhrBZHWrmYeVp4k
         3EeP1rY7NZM/W9IW5tA/HFbWAV8G5eUZYPmQcEUN2Uf1Mk2mHw12y0r/DFD/x9DxeGqB
         jPc5oREXxgpdGOp2drHcWiEjfeLoKf4IXEAE7eoAFZ3Q4tdfS/WSRfco5hiY6Gvfxz4T
         LtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318532; x=1780923332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WNejM85KWAcefPz6v9xEkmaQJmPlaeAZyMFSHUG5YSM=;
        b=qo2w/z2PN3k7m2ECJIpRVJAvRfpA4CsWKXYt37V+n4lbk6m3eJFZyoqXfP9RVucrO0
         0BAhET7cJn4eThiGY1FdTCxLuojjhSYhbvpC8Fhw29ZA8ob9I55/tRYbtM4ZY6GEgh15
         rZmAnQZ/E4X7zmlFWApfsW6FItWJHiqrcBogeXDDiXiw3lEPxj9Ca8oZnck4l5HhZYkj
         w+LWS8RoT/CgF7lHTkH/8Lb51lIC9hW0M0hqZRhNUbU+Ek/GIMoP/i3m1JDUJPOmGIT3
         Tq+7MSQXpQ/HZvHXvWveVtI6OdBiTTLjxQGgrego8fZmWI0XXMXyrEL+qUvD5tZ4JnVB
         BOpg==
X-Gm-Message-State: AOJu0YzhzhnIUAd8lk7HhclDzE3d/ErX6w7Z/JEfeDFccjkuisicn3nL
	lXB+zUxqbgaOzyjbVU0H0JXnPxjF2W4SLg0areSjRz1Y58VbTyXb4O8nNTVPDlwHwoDmEoviMFt
	dzUNuS2BplkOvElyv7KKLo5rzRc1lE45Hwp+l4Ari
X-Gm-Gg: Acq92OEOgCDP4njCxdBI90xqO+Z+OHyYl5sGGXa6ENMw9Ea2YLyi23d9NDxxMGaBiX9
	boo9+GGWdkPQrVjUsD5XurB/d8wZ8S2hzHRrvqrkOFuVqDCgK7Uz0fHbvrOq2Iuyt4KqQXOp7WJ
	9QqEqxgdaYvO2ZzEALpTG8uebzu9YFtdXHWHfg/P5VTOuzgi2hMHXU4SBio9Mwteogx7xu45wSB
	t3ykIHO86629Im1TqV1uK5oX6ZYuWBLJhDb6+DCZ+6BX9X3afHlBuHITdn7RGV49V4L3GOxiqjB
	9FCyLScVLefYL+3M7yh1jz4hDKSeQsSURNGm82THop1bc6o1fdABFSoQQ6lIo8LOq8PEnykFngJ
	4ykI=
X-Received: by 2002:a05:7300:6d05:b0:304:56fc:775 with SMTP id
 5a478bee46e88-304eb22df94mr5484000eec.21.1780318531224; Mon, 01 Jun 2026
 05:55:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530143541.229628-5-phasta@kernel.org> <20260530150622.393FC1F00893@smtp.kernel.org>
 <ah1c3NSU-4UkdUhb@google.com> <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
In-Reply-To: <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 1 Jun 2026 14:55:13 +0200
X-Gm-Features: AVHnY4J-ueyqGc_G8kHaNFpi7cKxrffiRlZb66bvjWAY4qKfjT8pJ87FnvEaeD4
Message-ID: <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
To: phasta@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 2:34=E2=80=AFPM Philipp Stanner <phasta@mailbox.org>=
 wrote:
>
> On Mon, 2026-06-01 at 10:20 +0000, Alice Ryhl wrote:
> > On Sat, May 30, 2026 at 03:06:21PM +0000, sashiko-bot@kernel.org wrote:
> > > > +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
> > > > +    fn as_raw(&self) -> *mut bindings::dma_fence {
> > > > +        // SAFETY: Valid because `self` is valid.
> > > > +        let fence_data =3D unsafe { &mut *self.data.as_ptr() };
> > >
> > > [Severity: High]
> > > Does this create an exclusive mutable reference to actively shared me=
mory?
> > >
> > > DriverFenceData can be accessed concurrently by other threads holding=
 Fence
> > > references (for instance, when checking if the fence is signaled). Cr=
eating
> > > a mutable reference (&mut) in Rust asserts exclusive access and viola=
tes
> > > aliasing rules, which allows the compiler to make invalid optimizatio=
n
> > > assumptions.
> > >
> > > Could this use an immutable reference &*self.data.as_ptr() instead?
> >
> > Yes, please use an immutable reference here.
> >
> > > > +
> > > > +        fence_data.inner.inner.get()
> > > > +    }
> > >
> > > [ ... ]
> > >
> > > > +impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow<F, C> {
> > > > +    fn as_raw(&self) -> *mut bindings::dma_fence {
> > > > +        // SAFETY: Valid because `self` is valid.
> > > > +        let fence_data =3D unsafe { &mut *self.data.as_ptr() };
> > >
> > > [Severity: High]
> > > Similar to DriverFence::as_raw(), does this also incorrectly create a
> > > mutable reference to shared data?
> >
> > Here as well.
>
> `data` is not shared. By design there is only ever one DriverFence, and
> the driver's data (`data.data`) is `Sync`.
>
> But I guess an immutable one should do the trick, too.

There's only one DriverFence, but I can perform shared access to that
one DriverFence from two threads in parallel. You made the type Sync,
and this is what you are allowing when you do so.

> > > > +                bindings::dma_fence_signal_locked(fence);
> > > > +            }
> > > > +            bindings::dma_fence_unlock_irqrestore(fence, flag_ptr)=
;
> > > > +        }
> > > > +
> > > > +        // SAFETY: `self.data` is owned by the DriverFence, but co=
uld be accessed
> > > > +        // through some dma_fence callbacks right now. Access is b=
eing revoked
> > > > +        // above by signalling the fence. The DriverFenceAllowedDa=
ta trait
> > > > +        // ensures that the data either does not need drop, or if =
it does it
> > > > +        // lives in a RcuBox which will delay dropping by one grac=
e period, hence
> > > > +        // ensuring that all readers have disappeared.
> > > > +        unsafe { drop_in_place(self.data.as_ptr()) };
> > >
> > > [Severity: Critical]
> > > Could this eagerly drop FenceCtx and user data before the C dma_fence
> > > refcount reaches 0?
> > >
> > > The C dma_fence object can remain alive as long as consumers (like sy=
nc_file
> > > or the GPU scheduler) hold references to it. If the backend later inv=
okes
> > > callbacks like ops->get_driver_name(), FenceCtx::get_driver_name() wo=
uld
> > > attempt to read fctx.driver_name from the already-dropped FenceCtx:
> > >
> > > FenceCtx::get_driver_name() {
> > >     ...
> > >     fctx.driver_name.as_char_ptr()
> > > }
> > >
> > > Can this result in a use-after-free?
> >
> > Hmm, I don't know about what sahisko said, but I don't think this is th=
e
> > right way to do rcu freeing. I think the type's destructor should be
> > reserved for cases where the value becomes immediately unusable.
>
> We could guard the strings with RcuBox, but we could not then guard the
> FenceCtx code against code UAF if we don't have the rcu_barrier().
>
> Or could we?
>
> If a rust module unloads, module::remove() should contain an
> rcu_barrier() (right??). Would that be enough to guard against the
> FenceCtx code being unloaded?
>
> >
> > For example, let's say I'm using RcuBox<_> here. Yes, the data you get
> > from dereferencing the RcuBox will stay alive for a grace period, but
> > IMO once you run the destructor of the box itself, the *pointer* become=
s
> > immediately unusable.
>
> I don't know why you're stressing the pointer?
>
> The trick above is simply that drop / dealloc *and* code unloading is
> delayed by a grace period.

Sorry let me try to rephrase. I'm not worried about the stuff behind
the pointer. After all, you're using RcuBox to protect that stuff.
What I'm worried about is the pointer itself. You invoked
drop_in_place() on the pointer to the fence context, so even though
the fence context may be valid for another grace period, the *pointer*
to the fence context is not. The pointer could have been zeroed by the
destructor.

Actually maybe I am worried about the strings too. Let's say that one
thread does:

rcu_read_lock()
get_driver_name()
// .. read the driver name
rcu_read_unlock()

and another thread signals the fence. If there are no queued
call_rcu() callbacks right now, then the rcu_barrier() could be a
no-op and the rcu reader will UAF on the driver name. It looks like
you need synchronize_rcu() rather than rcu_barrier() here?

Alice
