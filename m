Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043C923D7DF
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 11:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401556; cv=none; b=ESrLCHwCGGVwwMpCd+U/svY0i41LOYR541fbiZpUDGH3PFawMk1x8/5BmfmVotE/gLqFJK4VtMyqgraaIUiIMVa/ebFfGPWsI8EtwbRD9Et19kf1MoNVfn5PEzxgPbtINHug9DhYodXf+7tPzC/TT0+gnXCz+qU3Z5Sapf5Ib48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401556; c=relaxed/simple;
	bh=Q76fXMyOqMuL3t+b2D6DVWN1ADmmJoBvywVmU6HxiRQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MkDNuO8m5U1UAmJetyXBdnU+XVYGdEWpn4dW1o6a3C41dA8eXJP636v/RMblx/XiDjOMTpZKGxdtwcdrKriabR3LEtYVvAxj6DtVSSD5R+1t7bDxtppsSof2P53UfHERcjaxwSh2SF22kzBO1Qzz8K4ULoJQfISQs1Dqwxv4nj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oPBK+b6R; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oPBK+b6R"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-bec441e4052so234984566b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 04:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780401553; x=1781006353; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q76fXMyOqMuL3t+b2D6DVWN1ADmmJoBvywVmU6HxiRQ=;
        b=oPBK+b6RfDY+hTNh5ciOEYv7N/WA26OzFGcUxY8M97n8uNWgyi3k1628rC67HKkjyO
         ooF/DKv0nxwK9TEi0yj5M9Dnwc0UvOXxM6Jalv/+rd/49ZYTO8Bt3cR+k/Jg7Adhe7kY
         4LufgBrGO9v+P7BSHaTHTRwT6w32quXGVmiNL2XnonVZ8LnUSMFVOWHQn0GSrnkAw3Iv
         e/HNuvHy+rYCUyrqzHdhnFJfk6CN9WxlPk5tB3hVbmguoazuZTNJfOSJSKK0Q27vNaLq
         GymBZaTqDTMgByE28PCvVk4rFhFf/NlE8tl3/Mxep+0XQqNGcKJhJG1RCPe84Aryj/46
         JT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401553; x=1781006353;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q76fXMyOqMuL3t+b2D6DVWN1ADmmJoBvywVmU6HxiRQ=;
        b=haGndRNj15iCKqrwmN1qOGf/3SsAHwXODrvcDIqm89x4t4ybsZlOWOgxR4fe+4kDEQ
         RKh8g77gFt0EGowSlNPw3rGNIy42gCldml3dzC0It2phL54nD+SHlw4GmflaTf6ce+sa
         pxGPkY1RQjak9noyNKTDYfRufMJe/UrcG/gji+Bjt/1DANJaEka2Hg51dSq8BglAQEfg
         79/Ae3xJoiWmARbwYqN2knAqUbro0IJW8C5c1I994iEQDligV+pK9tSiUUGwDY8u6Wrq
         Ugc/ADHQtfw9u2haM+KQ4o0BpH83vd+EndBxl1hluY91+Ged7s3nRHJiM0lZc99g0GMf
         C3Kg==
X-Gm-Message-State: AOJu0Yy4fm3ZMWi1B8A0Zlt+gjBJuUgB8N/qE24o5vNDlb3mL8gR1And
	bu5H6uvGLvmdiwtr2/p+OCQGAdHv4IWYuA+dCYD8m1oBIxwa/hytFTcEPo+0KercAJvPWEVeAVr
	d+523ZBVaI+SQ7TOlLw==
X-Received: from ejcmy28.prod.google.com ([2002:a17:906:5a5c:b0:bef:4b4a:fd4c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7351:b0:bec:228e:26e5 with SMTP id a640c23a62f3a-bec228e2b75mr434657066b.7.1780401553189;
 Tue, 02 Jun 2026 04:59:13 -0700 (PDT)
Date: Tue, 2 Jun 2026 11:59:09 +0000
In-Reply-To: <7a978596279eca99cd41ca46606c7e5a6a38e801.camel@mailbox.org>
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
 <ah7CGySkyE7mSM8a@google.com> <7a978596279eca99cd41ca46606c7e5a6a38e801.camel@mailbox.org>
Message-ID: <ah7FjDdU6zt65qId@google.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 01:52:29PM +0200, Philipp Stanner wrote:
> On Tue, 2026-06-02 at 11:44 +0000, Alice Ryhl wrote:
> > On Tue, Jun 02, 2026 at 01:31:52PM +0200, Philipp Stanner wrote:
> > > On Mon, 2026-06-01 at 13:44 +0000, Alice Ryhl wrote:
> > > > On Mon, Jun 01, 2026 at 03:14:05PM +0200, Philipp Stanner wrote:
> > > > > +Cc Boris
> > > > >=20
> > > > > On Mon, 2026-06-01 at 14:55 +0200, Alice Ryhl wrote:
> > > > > > On Mon, Jun 1, 2026 at 2:34=E2=80=AFPM Philipp Stanner <phasta@=
mailbox.org> wrote:
> > > > > > >=20
> > > > > > > On Mon, 2026-06-01 at 10:20 +0000, Alice Ryhl wrote:
> > > > > > > > On Sat, May 30, 2026 at 03:06:21PM +0000, sashiko-bot@kerne=
l.org=C2=A0wrote:
> > > > > > > > > > +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C>=
 {
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::=
dma_fence {
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: =
Valid because `self` is valid.
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_d=
ata =3D unsafe { &mut *self.data.as_ptr() };
> > > > > > > > >=20
> > > > > > > > > [Severity: High]
> > > > > > > > > Does this create an exclusive mutable reference to active=
ly shared memory?
> > > > > > > > >=20
> > > > > > > > > DriverFenceData can be accessed concurrently by other thr=
eads holding Fence
> > > > > > > > > references (for instance, when checking if the fence is s=
ignaled). Creating
> > > > > > > > > a mutable reference (&mut) in Rust asserts exclusive acce=
ss and violates
> > > > > > > > > aliasing rules, which allows the compiler to make invalid=
 optimization
> > > > > > > > > assumptions.
> > > > > > > > >=20
> > > > > > > > > Could this use an immutable reference &*self.data.as_ptr(=
) instead?
> > > > > > > >=20
> > > > > > > > Yes, please use an immutable reference here.
> > > > > > > >=20
> > > > > > > > > > +
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence_data.=
inner.inner.get()
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > > > > >=20
> > > > > > > > > [ ... ]
> > > > > > > > >=20
> > > > > > > > > > +impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow=
<F, C> {
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::=
dma_fence {
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: =
Valid because `self` is valid.
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_d=
ata =3D unsafe { &mut *self.data.as_ptr() };
> > > > > > > > >=20
> > > > > > > > > [Severity: High]
> > > > > > > > > Similar to DriverFence::as_raw(), does this also incorrec=
tly create a
> > > > > > > > > mutable reference to shared data?
> > > > > > > >=20
> > > > > > > > Here as well.
> > > > > > >=20
> > > > > > > `data` is not shared. By design there is only ever one Driver=
Fence, and
> > > > > > > the driver's data (`data.data`) is `Sync`.
> > > > > > >=20
> > > > > > > But I guess an immutable one should do the trick, too.
> > > > > >=20
> > > > > > There's only one DriverFence, but I can perform shared access t=
o that
> > > > > > one DriverFence from two threads in parallel. You made the type=
 Sync,
> > > > > > and this is what you are allowing when you do so.
> > > > >=20
> > > > > Nope, DriverFence is just Send, not Sync.
> > > > >=20
> > > > > data.data is Sync, but `data` in the code above is not the actual=
 user
> > > > > data, but the memory backing it up.
> > > >=20
> > > > Ok, well, it probably should be Sync. I don't see any &self methods=
 that
> > > > can't be called from multiple threads in parallel.
> > >=20
> > > No. Why?
> > >=20
> > > There can only be one owner of DriverFence.
> >=20
> > Values normally have only one owner, and they are also normally Sync.
> >=20
> > > Regarding the backend_ops that might access DriverFence::data, we tak=
e
> > > care to guard that.
> > >=20
> > > And DriverFence itself can only be owned by one party. That can only =
be
> > > accessed by many threads if the driver stuffs that fence into somethi=
ng
> > > that implements Sync.
> >=20
> > If you don't implement Sync, then DriverFence cannot be stored in an
> > Arc. I wouldn't take away that ability unless you have to, and I don't
> > see anything in the DriverFence API that would mean you can't do that.
>=20
> Nope. We explicitly agreed on this design.
>=20
> Just 1 DriverFence. Just 1 party that can signal it.
> Note that we also agreed upon the Driverfence disappearing with
> .signal(), which certainly prevents several from existing, unless you
> do an Option.take()

I would like to clarify that I'm not suggesting any changes to the
design. Implementing Sync is not the same as having multiple driver
fences.

> > > > > > =C2=A0so even though
> > > > > > the fence context may be valid for another grace period, the *p=
ointer*
> > > > > > to the fence context is not. The pointer could have been zeroed=
 by the
> > > > > > destructor.
> > > > >=20
> > > > > That particular pointer to the DriverFenceData could have been ze=
roed.
> > > > > But potential other accessors have already crafted themselves a n=
ew
> > > > > pointer to the, by the power of RCU, still valid data. That new p=
ointer
> > > > > is container-of-ed from struct dma_fence *f.
> > > >=20
> > > > I'm not talking about the pointer to DriverFenceData, I'm talking a=
bout
> > > > the pointer to the FenceCtx, or the pointer to the data (if F is
> > > > RcuBox).
> > >=20
> > > Yeah, but the backing memory is still alive. And new pointers to that
> > > memory get crafted by the accessors. If a callback accesses the data
> > > through `container_of(Fence)`, it gets a new pointer.
> > >=20
> > > So what's the problem?
> > >=20
> > > Where is the invalid pointer that someone is accessing?
> > >=20
> > > >=20
> > > > The Arc type is not a type that opts-out of &mut =3D=3D exclusive, =
so the
> > > > second drop_in_place() above is assumed exclusive access to the
> > > > Arc<FenceCtx<F,C>> field.
> > >=20
> > > OK, so I think I see the problem. So the invalid pointer is
> > > Arc<FenceCtx=E2=80=A6>? And potentially the <F> pointer (although we =
don't have
> > > a picture yet as to how that would be accessed through other callback=
s.
> > >=20
> > > > =C2=A0If another thread obtains a pointer to the
> > > > FenceCtx via reading the fctx field of the DriverFence in parallel =
with
> > > > this, then that's not allowed because the drop_in_place() call has
> > > > exclusive access to that field.
> > >=20
> > > I think I have been asking in several of our meetings in the past
> > > whether it is actually a problem to access data that has been dropped=
()
> > > IF we know that drop does not cause UAF and the answer was kind of li=
ke
> > > a "well if it does not actually get freed=E2=80=A6"
> >=20
> > Ok, well, IMO the simplest approach is to say you can't. There may be
> > roundabout ways to do it, but I would suggest that we just ... don't.
>=20
> Ack.
>=20
> >=20
> > > Anyways.
> > >=20
> > > It would seem the way to get this right is then
> > >=20
> > > synchronize_rcu();
> > > drop_in_palace(data);
> > >=20
> > >=20
> > > Agreed?
> > >=20
> > > This would then mean, however, that every time a fence drops, you hav=
e
> > > to wait a grace period.
> > >=20
> > > Or maybe stuff DriverFenceData into an RcuBox, too, and defer its
> > > dropping.
> >=20
> > That would work, but I think we can do better and avoid the
> > synchronize_rcu() along these lines:
> >=20
> > unsafe trait RcuRevocable {
> > =C2=A0=C2=A0=C2=A0 unsafe fn rcu_revoke_in_place(ptr: *mut Self);
> > }
> >=20
> > This trait provides a method that's like drop_in_place(), except that
> > when you use this destructor, the value remains usable for one grace
> > period. You could implement it for RcuBox, and for any Copy type, and
> > for ARef<T> when T is cleaned up with rcu, and probably also other
> > stuff.
>=20
> I mean, this cannot be magic. It also boils down to executing one RCU
> callback per DriverFence dropping.
>=20
> Is there a significant difference to stuffing DriverFenceData into an
> RcuBox?

Do you mean hard-coding that the user-data of a driver fence is always
stored in an RcuBox?

Alice
