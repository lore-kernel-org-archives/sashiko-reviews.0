Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513DB3D301B
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400677; cv=none; b=JulBxZGgg3hwdecLvgJavx0iAXGo2edBkcsmyNQoDW0qXGcepRX1KPgmBomsSl7tCkSzD3wYlVOWj4zh3ShE+O4D6VZr+TtmSd7kaFR0AbGyMLj5//mvgenQyoVqJ2Nwo9+Rphi8Ywi4qW7BEBU7cwq6+8mASt3nCJX6zgyR0xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400677; c=relaxed/simple;
	bh=z6Gf5GYvxWIq2PBZUqMKDuPo7mrGmbhekrpSfrgylbs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=De0+FtNK90pSwDfHYHFC8I+bS2sAK5IZuUDAbYacDBJBN+K0KyucFyTfhCrH2ivo8Vea32M2PNcFlaJOX41eHtp0tgvpzk/2Mv8j5WLK1btq8EPftTBzXuu5Bkc8ofEGZ4Gdg48UueDtzUPSYyy0xLdCOlvpMRRWmzu8FX6qh/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F2LyQqe+; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F2LyQqe+"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4908af8d7f9so47286255e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 04:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780400669; x=1781005469; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yFe4nWz4pKtbukXwBfpQnkzUvWt2fKmqgH+Pcgse8s=;
        b=F2LyQqe++n4bylf9CPLQZPGirvTdvLiAzDyZ/wM6uTMS7qkdKjqF+td3lEUAeI+S02
         OY3d53YPczkj93aVBFP5I5gdBqsCbYuWW4U4oyDurCRzl+sfQJJ78TOOAApHtMmxOEL1
         BoOuuHLr7UTym+xeVreQ043ekQ8a3iPRfTtgFTBKxFZFZ10qqIIua85ruB2OG+NDrLpf
         lXx/ttcipGwWYyYeIRQcQ59Yszkn3tL5fcQe/A3J8IHIWUk1uGJ2fnV+raDUoC3FlEPh
         5uzCa7QV8yOk6BQ9Zhesvh4O2zYPBFH90Hu2gcB/WHvwVJusENLX5TJ+yXO9SC81nwTQ
         ypaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400669; x=1781005469;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2yFe4nWz4pKtbukXwBfpQnkzUvWt2fKmqgH+Pcgse8s=;
        b=SyEj1HX0tbJGdOuulcY1VgE+nH1z6Ievi+/qYv/XlxYHrzwSdaD0VV4vpca418sqXT
         LG+a4inbxE2Yw0MNlsLy+M5XXJIPoFKy9NCBq7oM1CoZGtxt5o11CHuRUBzL1GGzHz+k
         U7XUlmhCOncP+hQSKVUoBB4ou4b7MQD+UzkOBk2Kh4v2WdR2f5pqRh9/UgNEJLlispEf
         SQPr/B+XBWg85WiEs8dyzGlblZzSttF2F6QrlRAKI4jsNKbBqOiDlCEGpw/P/X+q9T97
         FU+LiAPhzzuDAhX+CCLLy4HdQJQUO55mm8Vuv9NjgTEyXKT3GiS0wWhQ+ykZ4V0MswYA
         H8Uw==
X-Gm-Message-State: AOJu0YwTCnW3j1TmV8cNMv6d+dd2VzRi6aVOEXZjgD8wKS+zdUmpRP44
	DhwgOd24YiWG8KnfTrRYd4ofsJhyCYHR8UPF2vcnI/L8JWTnEqINdu2bnGGupAYYPBHyK8GAeVS
	U3+J8gf5GITZBT+pjQQ==
X-Received: from wmbeq12.prod.google.com ([2002:a05:600c:848c:b0:487:3739:c5c4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:c854:0:b0:490:9699:4428 with SMTP id 5b1f17b1804b1-490a2964057mr199576265e9.26.1780400669405;
 Tue, 02 Jun 2026 04:44:29 -0700 (PDT)
Date: Tue, 2 Jun 2026 11:44:27 +0000
In-Reply-To: <16dff07d28fca94749f14e9c91e6f812f605d6e5.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260530143541.229628-5-phasta@kernel.org> <20260530150622.393FC1F00893@smtp.kernel.org>
 <ah1c3NSU-4UkdUhb@google.com> <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
 <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
 <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
 <ah2M2a_4PneZpjTS@google.com> <16dff07d28fca94749f14e9c91e6f812f605d6e5.camel@mailbox.org>
Message-ID: <ah7CGySkyE7mSM8a@google.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 01:31:52PM +0200, Philipp Stanner wrote:
> On Mon, 2026-06-01 at 13:44 +0000, Alice Ryhl wrote:
> > On Mon, Jun 01, 2026 at 03:14:05PM +0200, Philipp Stanner wrote:
> > > +Cc Boris
> > >=20
> > > On Mon, 2026-06-01 at 14:55 +0200, Alice Ryhl wrote:
> > > > On Mon, Jun 1, 2026 at 2:34=E2=80=AFPM Philipp Stanner <phasta@mail=
box.org> wrote:
> > > > >=20
> > > > > On Mon, 2026-06-01 at 10:20 +0000, Alice Ryhl wrote:
> > > > > > On Sat, May 30, 2026 at 03:06:21PM +0000, sashiko-bot@kernel.or=
g=C2=A0wrote:
> > > > > > > > +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
> > > > > > > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_=
fence {
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Vali=
d because `self` is valid.
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =
=3D unsafe { &mut *self.data.as_ptr() };
> > > > > > >=20
> > > > > > > [Severity: High]
> > > > > > > Does this create an exclusive mutable reference to actively s=
hared memory?
> > > > > > >=20
> > > > > > > DriverFenceData can be accessed concurrently by other threads=
 holding Fence
> > > > > > > references (for instance, when checking if the fence is signa=
led). Creating
> > > > > > > a mutable reference (&mut) in Rust asserts exclusive access a=
nd violates
> > > > > > > aliasing rules, which allows the compiler to make invalid opt=
imization
> > > > > > > assumptions.
> > > > > > >=20
> > > > > > > Could this use an immutable reference &*self.data.as_ptr() in=
stead?
> > > > > >=20
> > > > > > Yes, please use an immutable reference here.
> > > > > >=20
> > > > > > > > +
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence_data.inne=
r.inner.get()
> > > > > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > > >=20
> > > > > > > [ ... ]
> > > > > > >=20
> > > > > > > > +impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow<F, =
C> {
> > > > > > > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_=
fence {
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Vali=
d because `self` is valid.
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =
=3D unsafe { &mut *self.data.as_ptr() };
> > > > > > >=20
> > > > > > > [Severity: High]
> > > > > > > Similar to DriverFence::as_raw(), does this also incorrectly =
create a
> > > > > > > mutable reference to shared data?
> > > > > >=20
> > > > > > Here as well.
> > > > >=20
> > > > > `data` is not shared. By design there is only ever one DriverFenc=
e, and
> > > > > the driver's data (`data.data`) is `Sync`.
> > > > >=20
> > > > > But I guess an immutable one should do the trick, too.
> > > >=20
> > > > There's only one DriverFence, but I can perform shared access to th=
at
> > > > one DriverFence from two threads in parallel. You made the type Syn=
c,
> > > > and this is what you are allowing when you do so.
> > >=20
> > > Nope, DriverFence is just Send, not Sync.
> > >=20
> > > data.data is Sync, but `data` in the code above is not the actual use=
r
> > > data, but the memory backing it up.
> >=20
> > Ok, well, it probably should be Sync. I don't see any &self methods tha=
t
> > can't be called from multiple threads in parallel.
>=20
> No. Why?
>=20
> There can only be one owner of DriverFence.

Values normally have only one owner, and they are also normally Sync.

> Regarding the backend_ops that might access DriverFence::data, we take
> care to guard that.
>=20
> And DriverFence itself can only be owned by one party. That can only be
> accessed by many threads if the driver stuffs that fence into something
> that implements Sync.

If you don't implement Sync, then DriverFence cannot be stored in an
Arc. I wouldn't take away that ability unless you have to, and I don't
see anything in the DriverFence API that would mean you can't do that.

> > > > =C2=A0so even though
> > > > the fence context may be valid for another grace period, the *point=
er*
> > > > to the fence context is not. The pointer could have been zeroed by =
the
> > > > destructor.
> > >=20
> > > That particular pointer to the DriverFenceData could have been zeroed=
.
> > > But potential other accessors have already crafted themselves a new
> > > pointer to the, by the power of RCU, still valid data. That new point=
er
> > > is container-of-ed from struct dma_fence *f.
> >=20
> > I'm not talking about the pointer to DriverFenceData, I'm talking about
> > the pointer to the FenceCtx, or the pointer to the data (if F is
> > RcuBox).
>=20
> Yeah, but the backing memory is still alive. And new pointers to that
> memory get crafted by the accessors. If a callback accesses the data
> through `container_of(Fence)`, it gets a new pointer.
>=20
> So what's the problem?
>=20
> Where is the invalid pointer that someone is accessing?
>=20
> >=20
> > The Arc type is not a type that opts-out of &mut =3D=3D exclusive, so t=
he
> > second drop_in_place() above is assumed exclusive access to the
> > Arc<FenceCtx<F,C>> field.
>=20
> OK, so I think I see the problem. So the invalid pointer is
> Arc<FenceCtx=E2=80=A6>? And potentially the <F> pointer (although we don'=
t have
> a picture yet as to how that would be accessed through other callbacks.
>=20
> >  If another thread obtains a pointer to the
> > FenceCtx via reading the fctx field of the DriverFence in parallel with
> > this, then that's not allowed because the drop_in_place() call has
> > exclusive access to that field.
>=20
> I think I have been asking in several of our meetings in the past
> whether it is actually a problem to access data that has been dropped()
> IF we know that drop does not cause UAF and the answer was kind of like
> a "well if it does not actually get freed=E2=80=A6"

Ok, well, IMO the simplest approach is to say you can't. There may be
roundabout ways to do it, but I would suggest that we just ... don't.

> Anyways.
>=20
> It would seem the way to get this right is then
>=20
> synchronize_rcu();
> drop_in_palace(data);
>=20
>=20
> Agreed?
>=20
> This would then mean, however, that every time a fence drops, you have
> to wait a grace period.
>=20
> Or maybe stuff DriverFenceData into an RcuBox, too, and defer its
> dropping.

That would work, but I think we can do better and avoid the
synchronize_rcu() along these lines:

unsafe trait RcuRevocable {
    unsafe fn rcu_revoke_in_place(ptr: *mut Self);
}

This trait provides a method that's like drop_in_place(), except that
when you use this destructor, the value remains usable for one grace
period. You could implement it for RcuBox, and for any Copy type, and
for ARef<T> when T is cleaned up with rcu, and probably also other
stuff.

Alice
