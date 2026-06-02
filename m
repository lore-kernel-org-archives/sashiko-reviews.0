Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0264B3F4DF2
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413963; cv=none; b=C90OgXE2CcYptYvKYtE1VmxP6zGQmcJvlmfOphZXs9wv70wpQqCk+QDJH9TO6OR733Ud/0iJPpIgGKJCYIP5UlqnFpdc8qLn3R/tNEK3YTpjaXtqSUBuVeOATcZUj+MlgbsfsT73mXgmVebUVtEaltrUtq3oI9fdBGs3D74J7ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413963; c=relaxed/simple;
	bh=y8rEaWZCBEKzanHwnNKGt1CKQ4dZPxVr2FzmU5HEgZc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NK4QPi41nrriJPwUbCff2LVYVBfSHuc5oRirIPLsgTDx8fOSTX8tD0YaCY4IZ9g6ETVhG9qKZx3oKWc0HWXDd0+gA3H4nYh7zq4GPoP4QIRe5OjXIosSrS9F//jeLmAhLIfr0Opc4JdzuXLU0onOnkgfm2H0zBLkOr1yUySQOKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FGfioJSy; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FGfioJSy"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490b37e1f47so4894005e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780413960; x=1781018760; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yObXopdfsMeNp3bqukMy+yTX5tM6g5h3WqxPPuNrZak=;
        b=FGfioJSyhq0pRnvfs13omibND1tiZb6Cm+gOaTDjUJjuJhj1EhZT8IX9pjuUmfTmlH
         9STx/zBKi8Y4ecMuNMPl/sOCX9ktdtzN2+jMgkCZ2AzXUrmu0H4eT71VHt5kz2H1mpJa
         jwuVYTiGS9Dc5745dehRi+W+7eVvkP3v8vWMWSgJHPJAKhDqBTKpNhKn775S6aApwJ/g
         hSuepEoMcuT4J1SEdNVbe/2biPA+X8C67HnRS7yW7+ny6EP0SlR8JdfiWLFoX9sTS5st
         pPMoltVLUGXztzMJXuZHq+e9zMl/eCzW0Y2nqNzRf4NJRpWYz+/qPyYBZb7u1DbtRgs8
         Ifmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413960; x=1781018760;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yObXopdfsMeNp3bqukMy+yTX5tM6g5h3WqxPPuNrZak=;
        b=k+5Y1HF4HnHpTtYmeJqPDvEWNnUEvJ9XPyI5cdhtFXYYUmrwXRxJvsbPMc4UYlEvAJ
         cWo7txIUmSfrONFALmN5ycei9CCgJGvHt0cIc4xduEDxnF+HSwQPG+xYvYYf/NhOGq41
         lD4/09GTUobOZewYkahYI0pPV+fra14znm4iQsZ7GWszm1vXwvFa4FZCL3BlumryLu+l
         eM7EMt/QQWfvSzZENu7IfXBQ5xqLdXv11+TnsZdD1AbRCfKEtS/+CKe42R9udL5Ji3Jx
         A3K2ybviuZwQFnt2V+pAAPoNzT7bT/CqX6RVJcXV+ZBnOYMaXy0UUBoiO025mYDXHmaX
         zZBA==
X-Gm-Message-State: AOJu0YyrLzdFKmedwFwHGiB/geL5dQX//VQvMTrMlZGfXorE5qIP8FLx
	IywmrTUsPm2iT7PNu2iFObW+nJmNUKxDuHQm7t6cnwQWwJ6rT/l5414+8X7K+FRQdLPj6aYf1sP
	tT9sNKelCcVJw7fldjA==
X-Received: from wmbjt21.prod.google.com ([2002:a05:600c:5695:b0:490:4995:a7d3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5394:b0:490:af90:f9c2 with SMTP id 5b1f17b1804b1-490b5073c0emr3886495e9.12.1780413960230;
 Tue, 02 Jun 2026 08:26:00 -0700 (PDT)
Date: Tue, 2 Jun 2026 15:25:58 +0000
In-Reply-To: <4bf6e916efe54bab66defda6fffea8c41358b3cc.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <ah1c3NSU-4UkdUhb@google.com> <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
 <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
 <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
 <ah2M2a_4PneZpjTS@google.com> <16dff07d28fca94749f14e9c91e6f812f605d6e5.camel@mailbox.org>
 <ah7CGySkyE7mSM8a@google.com> <7a978596279eca99cd41ca46606c7e5a6a38e801.camel@mailbox.org>
 <ah7FjDdU6zt65qId@google.com> <4bf6e916efe54bab66defda6fffea8c41358b3cc.camel@mailbox.org>
Message-ID: <ah72Bi2Q5Wpgo2kE@google.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 02:06:43PM +0200, Philipp Stanner wrote:
> On Tue, 2026-06-02 at 11:59 +0000, Alice Ryhl wrote:
> > On=20
>=20
> [=E2=80=A6]
>=20
> > > >=20
> > > > If you don't implement Sync, then DriverFence cannot be stored in a=
n
> > > > Arc. I wouldn't take away that ability unless you have to, and I do=
n't
> > > > see anything in the DriverFence API that would mean you can't do th=
at.
> > >=20
> > > Nope. We explicitly agreed on this design.
> > >=20
> > > Just 1 DriverFence. Just 1 party that can signal it.
> > > Note that we also agreed upon the Driverfence disappearing with
> > > .signal(), which certainly prevents several from existing, unless you
> > > do an Option.take()
> >=20
> > I would like to clarify that I'm not suggesting any changes to the
> > design. Implementing Sync is not the same as having multiple driver
> > fences.
>=20
> I mean, I guess one can do that. But it's up to the driver then to see ho=
w it can signal its fence.

I don't believe Sync changes anything with that regard. The signal
method takes 'self', but the Sync trait only affects how '&self' methods
can be called.

> > > > > > > > =C2=A0so even though
> > > > > > > > the fence context may be valid for another grace period, th=
e *pointer*
> > > > > > > > to the fence context is not. The pointer could have been ze=
roed by the
> > > > > > > > destructor.
> > > > > > >=20
> > > > > > > That particular pointer to the DriverFenceData could have bee=
n zeroed.
> > > > > > > But potential other accessors have already crafted themselves=
 a new
> > > > > > > pointer to the, by the power of RCU, still valid data. That n=
ew pointer
> > > > > > > is container-of-ed from struct dma_fence *f.
> > > > > >=20
> > > > > > I'm not talking about the pointer to DriverFenceData, I'm talki=
ng about
> > > > > > the pointer to the FenceCtx, or the pointer to the data (if F i=
s
> > > > > > RcuBox).
> > > > >=20
> > > > > Yeah, but the backing memory is still alive. And new pointers to =
that
> > > > > memory get crafted by the accessors. If a callback accesses the d=
ata
> > > > > through `container_of(Fence)`, it gets a new pointer.
> > > > >=20
> > > > > So what's the problem?
> > > > >=20
> > > > > Where is the invalid pointer that someone is accessing?
> > > > >=20
> > > > > >=20
> > > > > > The Arc type is not a type that opts-out of &mut =3D=3D exclusi=
ve, so the
> > > > > > second drop_in_place() above is assumed exclusive access to the
> > > > > > Arc<FenceCtx<F,C>> field.
> > > > >=20
> > > > > OK, so I think I see the problem. So the invalid pointer is
> > > > > Arc<FenceCtx=E2=80=A6>? And potentially the <F> pointer (although=
 we don't have
> > > > > a picture yet as to how that would be accessed through other call=
backs.
> > > > >=20
> > > > > > =C2=A0If another thread obtains a pointer to the
> > > > > > FenceCtx via reading the fctx field of the DriverFence in paral=
lel with
> > > > > > this, then that's not allowed because the drop_in_place() call =
has
> > > > > > exclusive access to that field.
> > > > >=20
> > > > > I think I have been asking in several of our meetings in the past
> > > > > whether it is actually a problem to access data that has been dro=
pped()
> > > > > IF we know that drop does not cause UAF and the answer was kind o=
f like
> > > > > a "well if it does not actually get freed=E2=80=A6"
> > > >=20
> > > > Ok, well, IMO the simplest approach is to say you can't. There may =
be
> > > > roundabout ways to do it, but I would suggest that we just ... don'=
t.
> > >=20
> > > Ack.
> > >=20
> > > >=20
> > > > > Anyways.
> > > > >=20
> > > > > It would seem the way to get this right is then
> > > > >=20
> > > > > synchronize_rcu();
> > > > > drop_in_palace(data);
> > > > >=20
> > > > >=20
> > > > > Agreed?
> > > > >=20
> > > > > This would then mean, however, that every time a fence drops, you=
 have
> > > > > to wait a grace period.
> > > > >=20
> > > > > Or maybe stuff DriverFenceData into an RcuBox, too, and defer its
> > > > > dropping.
> > > >=20
> > > > That would work, but I think we can do better and avoid the
> > > > synchronize_rcu() along these lines:
> > > >=20
> > > > unsafe trait RcuRevocable {
> > > > =C2=A0=C2=A0=C2=A0 unsafe fn rcu_revoke_in_place(ptr: *mut Self);
> > > > }
> > > >=20
> > > > This trait provides a method that's like drop_in_place(), except th=
at
> > > > when you use this destructor, the value remains usable for one grac=
e
> > > > period. You could implement it for RcuBox, and for any Copy type, a=
nd
> > > > for ARef<T> when T is cleaned up with rcu, and probably also other
> > > > stuff.
> > >=20
> > > I mean, this cannot be magic. It also boils down to executing one RCU
> > > callback per DriverFence dropping.
> > >=20
> > > Is there a significant difference to stuffing DriverFenceData into an
> > > RcuBox?
> >=20
> > Do you mean hard-coding that the user-data of a driver fence is always
> > stored in an RcuBox?
>=20
>=20
> I'm talking about this:
>=20
>=20
>=20
> impl<F: Send + Sync + DriverFenceAllowedData, C: Send + Sync> DriverFence=
Allocation<F, C> {
>     /// Create a new allocation slot that can later be used to create a f=
ully
>     /// initialized [`DriverFence`] without the need to allocate.
>     pub fn new(fctx: Arc<FenceCtx<F, C>>, data: F) -> Result<Self> {
>         let fence_data =3D DriverFenceData {
>             // `inner` remains uninitialized until a [`DriverFence`] take=
s over.
>             inner: Fence {
>                 inner: Opaque::uninit(),
>             },
>             fctx,
>             data,
>         };
>=20
>         // In order to support the C dma_fence callbacks, it is necessary=
 for
>         // a `Fence` and a `DriverFence` to live in the same allocation,
>         // because the C backend passes a dma_fence, from which the drive=
r most
>         // likely wants to be able to access its `data` in `DriverFence`.
>         //
>         // Hence, we need the manage the memory manually. It will be free=
d by the
>         // C backend automatically once the refcount within `Fence` drops=
 to 0.
>         let data =3D RcuBox::new(fence_data, GFP_KERNEL | __GFP_ZERO)?;
>=20
>         Ok(Self { data })
>     }
>=20
>=20
> This way, the entire DriverFenceData will remain valid for an
> additional grace period. I suppose this would solve your pointer-
> invalid concern.
>=20
> However, it appears like overkill to me because the refcounting + C
> backend already ensure that nothing drops too soon, and the backend
> frees with kfree_rcu(), so=E2=80=A6

I agree that it doesn't sound like we want RcuBox here.

What kind of metadata are we actually planning to store in the
DriverFence in practice?

Alice
