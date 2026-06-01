Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE397394474
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321502; cv=none; b=jJ8A+KjjLN0dvltPiEKmWkfRFfWubnSgXD/uYI1QQsPTEogVMQ9KtMNi6OKxNqhNlOFmIuQcd6lWRmF7RSII2Ksb4r9lVPCZpdN5sIR7WXyg0wf8mFbeHmPUYur0koTjAsztW4i/shpXMjEO0yUPv6P2GyZiaO9ti0JB52iNBE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321502; c=relaxed/simple;
	bh=Mhb3V4SZBIoGw4HaeEbkEEO6zOg+o75In8eZSjRjaws=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ODs+V6hqlnAPSZUt3dXSSzUFgrhRVBRGGqge9b4msO2E07vtikFEK5TXoZfXIKTsHdpHQtczAXzNbkcFcWEYs1luXNHTXuuhTHWQulfA9wq4xn6wLM4Ag2cfuG1X6b/6NqWszhQ1c8UzIvSvCMwE/vn1TfTFrw2Glhk3CGwyiWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FQHuIIaZ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FQHuIIaZ"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso11032535e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 06:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780321499; x=1780926299; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hX/IFOsdbALQFM8UDWl4s7L9iaJ+vDyTCJoOKgbumTw=;
        b=FQHuIIaZpnD6vXU6akl5sugQhngyDum5wupgqeaYCFpHg6H44g5un42QIXCHlk/vOu
         WmuPCW9tZ+bjuAtgO9eW86pf1dBr368zBpje3wCBIjh27X6BlONr3QLxkeBG7oBmkxRH
         bgpNhh2pENgZDhX8iUqWgcNWU7l5r8WbYxMK0tVBV2pHmnGcwFXw4j5uxtfBcFJqx7wM
         F5KTIim2qDAQeDGaen3P6IhzhPbnXkQpo4YiVsUMyXvRqTt1772fg5CRnN3v/G0tMvGJ
         U3kSbS93jD+FA1oEiTwUSHOx7PgKjMUZ3mnq/8Vx/jb0T4/edIeO8P/RzyQFHs1joulr
         kAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780321499; x=1780926299;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hX/IFOsdbALQFM8UDWl4s7L9iaJ+vDyTCJoOKgbumTw=;
        b=k2gWGZwFd9jpufdqhUtLCLBidrmPJZaUtWOW87z6SIn9NRdgB/q1RKynu1gWMqoFgR
         jY/4xRye5DCho7aNXvck9E10MeZ/LiB+eUtBFaA+o8Dv7N0nXS6vRbFVLiugYt3cWa0v
         fY5hRjMJsquXE63upbQIopHjcdQRbFlErvK5WCYHeA5g62AdMQ0Hv60PrvrS4er6EFAS
         S8+V5sXvQdnFCpplUC41lS+NQwSa1NLRV6dAKE4MAR/+DFLqebRHymTdlYcmBK1qb/by
         quqAnIA/UpsI2/h0ktPAQRTiBZQiOCyIW9RI4XJjkVNSiKKN3UaxuxyeigPu5pMosoQO
         UmDQ==
X-Gm-Message-State: AOJu0YxQKTIcISS5L/GV23ZaZ8SH9TYrSdtT+S32bgvDJHSggP02jVa1
	Csa3fcv4JzCYs4kh9SqW1Q1cvIm5zpWafdLkGKVmYBrsIKlCBdyJqYZnrOfR6+UCsHK8eEgDxMF
	zvxNvdiVMtXPJrJsawQ==
X-Received: from wruv14.prod.google.com ([2002:a5d:678e:0:b0:45e:8fa3:14f7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:e48a:b0:490:9804:afdc with SMTP id 5b1f17b1804b1-490a2939daamr141170055e9.23.1780321499173;
 Mon, 01 Jun 2026 06:44:59 -0700 (PDT)
Date: Mon, 1 Jun 2026 13:44:57 +0000
In-Reply-To: <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260530143541.229628-5-phasta@kernel.org> <20260530150622.393FC1F00893@smtp.kernel.org>
 <ah1c3NSU-4UkdUhb@google.com> <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
 <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com> <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
Message-ID: <ah2M2a_4PneZpjTS@google.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2026 at 03:14:05PM +0200, Philipp Stanner wrote:
> +Cc Boris
>=20
> On Mon, 2026-06-01 at 14:55 +0200, Alice Ryhl wrote:
> > On Mon, Jun 1, 2026 at 2:34=E2=80=AFPM Philipp Stanner <phasta@mailbox.=
org> wrote:
> > >=20
> > > On Mon, 2026-06-01 at 10:20 +0000, Alice Ryhl wrote:
> > > > On Sat, May 30, 2026 at 03:06:21PM +0000, sashiko-bot@kernel.org=C2=
=A0wrote:
> > > > > > +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
> > > > > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fenc=
e {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid be=
cause `self` is valid.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D =
unsafe { &mut *self.data.as_ptr() };
> > > > >=20
> > > > > [Severity: High]
> > > > > Does this create an exclusive mutable reference to actively share=
d memory?
> > > > >=20
> > > > > DriverFenceData can be accessed concurrently by other threads hol=
ding Fence
> > > > > references (for instance, when checking if the fence is signaled)=
. Creating
> > > > > a mutable reference (&mut) in Rust asserts exclusive access and v=
iolates
> > > > > aliasing rules, which allows the compiler to make invalid optimiz=
ation
> > > > > assumptions.
> > > > >=20
> > > > > Could this use an immutable reference &*self.data.as_ptr() instea=
d?
> > > >=20
> > > > Yes, please use an immutable reference here.
> > > >=20
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence_data.inner.in=
ner.get()
> > > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > >=20
> > > > > [ ... ]
> > > > >=20
> > > > > > +impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow<F, C> {
> > > > > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fenc=
e {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid be=
cause `self` is valid.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D =
unsafe { &mut *self.data.as_ptr() };
> > > > >=20
> > > > > [Severity: High]
> > > > > Similar to DriverFence::as_raw(), does this also incorrectly crea=
te a
> > > > > mutable reference to shared data?
> > > >=20
> > > > Here as well.
> > >=20
> > > `data` is not shared. By design there is only ever one DriverFence, a=
nd
> > > the driver's data (`data.data`) is `Sync`.
> > >=20
> > > But I guess an immutable one should do the trick, too.
> >=20
> > There's only one DriverFence, but I can perform shared access to that
> > one DriverFence from two threads in parallel. You made the type Sync,
> > and this is what you are allowing when you do so.
>=20
> Nope, DriverFence is just Send, not Sync.
>=20
> data.data is Sync, but `data` in the code above is not the actual user
> data, but the memory backing it up.

Ok, well, it probably should be Sync. I don't see any &self methods that
can't be called from multiple threads in parallel.

> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bindings::dma_fence_signal_locked(fence);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 bindings::dma_fence_unlock_irqrestore(fence, flag_ptr);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.da=
ta` is owned by the DriverFence, but could be accessed
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // through some dma=
_fence callbacks right now. Access is being revoked
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // above by signall=
ing the fence. The DriverFenceAllowedData trait
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensures that the=
 data either does not need drop, or if it does it
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // lives in a RcuBo=
x which will delay dropping by one grace period, hence
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensuring that al=
l readers have disappeared.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { drop_in_pl=
ace(self.data.as_ptr()) };
> > > > >=20
> > > > > [Severity: Critical]
> > > > > Could this eagerly drop FenceCtx and user data before the C dma_f=
ence
> > > > > refcount reaches 0?
> > > > >=20
> > > > > The C dma_fence object can remain alive as long as consumers (lik=
e sync_file
> > > > > or the GPU scheduler) hold references to it. If the backend later=
 invokes
> > > > > callbacks like ops->get_driver_name(), FenceCtx::get_driver_name(=
) would
> > > > > attempt to read fctx.driver_name from the already-dropped FenceCt=
x:
> > > > >=20
> > > > > FenceCtx::get_driver_name() {
> > > > > =C2=A0=C2=A0=C2=A0 ...
> > > > > =C2=A0=C2=A0=C2=A0 fctx.driver_name.as_char_ptr()
> > > > > }
> > > > >=20
> > > > > Can this result in a use-after-free?
> > > >=20
> > > > Hmm, I don't know about what sahisko said, but I don't think this i=
s the
> > > > right way to do rcu freeing. I think the type's destructor should b=
e
> > > > reserved for cases where the value becomes immediately unusable.
> > >=20
> > > We could guard the strings with RcuBox, but we could not then guard t=
he
> > > FenceCtx code against code UAF if we don't have the rcu_barrier().
> > >=20
> > > Or could we?
> > >=20
> > > If a rust module unloads, module::remove() should contain an
> > > rcu_barrier() (right??). Would that be enough to guard against the
> > > FenceCtx code being unloaded?
> > >=20
> > > >=20
> > > > For example, let's say I'm using RcuBox<_> here. Yes, the data you =
get
> > > > from dereferencing the RcuBox will stay alive for a grace period, b=
ut
> > > > IMO once you run the destructor of the box itself, the *pointer* be=
comes
> > > > immediately unusable.
> > >=20
> > > I don't know why you're stressing the pointer?
> > >=20
> > > The trick above is simply that drop / dealloc *and* code unloading is
> > > delayed by a grace period.
> >=20
> > Sorry let me try to rephrase. I'm not worried about the stuff behind
> > the pointer. After all, you're using RcuBox to protect that stuff.
> > What I'm worried about is the pointer itself. You invoked
> > drop_in_place() on the pointer to the fence context,
> >=20
>=20
> on the pointer to DriverFenceData, which contains a refcount to the
> FenceCtx, which might then want to drop.

Let me clarify.

You invoked drop_in_place on DriverFenceData which is effectively this
method:

fn drop_in_place::<DriverFenceData<F,C>>(self: *mut DriverFenceData) {
    drop_in_place::<Fence>(&raw mut (*self).fence);
    drop_in_place::<Arc<FenceCtx<F,C>>>(&raw mut (*self).fctx);
    drop_in_place::<F>(&raw mut (*self).data);
}

So yes you did indirectly invoke `drop_in_place` on Arc<FenceCtx<F,C>>.

> >  so even though
> > the fence context may be valid for another grace period, the *pointer*
> > to the fence context is not. The pointer could have been zeroed by the
> > destructor.
>=20
> That particular pointer to the DriverFenceData could have been zeroed.
> But potential other accessors have already crafted themselves a new
> pointer to the, by the power of RCU, still valid data. That new pointer
> is container-of-ed from struct dma_fence *f.

I'm not talking about the pointer to DriverFenceData, I'm talking about
the pointer to the FenceCtx, or the pointer to the data (if F is
RcuBox).

The Arc type is not a type that opts-out of &mut =3D=3D exclusive, so the
second drop_in_place() above is assumed exclusive access to the
Arc<FenceCtx<F,C>> field. If another thread obtains a pointer to the
FenceCtx via reading the fctx field of the DriverFence in parallel with
this, then that's not allowed because the drop_in_place() call has
exclusive access to that field.

This is why Boqun's RcuFreeSafe has a drop_in_place_before_gp() method
that can be used instead of drop_in_place() for this kind of use-case.
You must leave the fctx and data fields in a state where they contain
data that's safe to use for at least one grace period, and drop_in_place()
fundamentally does not leave the value in a usable state.

Alice
