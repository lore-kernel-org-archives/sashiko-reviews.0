Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B7D3DA7C0
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399929; cv=none; b=Y+YOY4wF0aPdxoxuaCZlTecCJycFHSffPxPqMY//EMIoavZxl8FwF8gx9e7C/KMQB1SgQSmDBi0dzT5VKNea30GbqAJgsfLw/GVunm7cok+2khmkhZ66XBTc1Qig+WGpeTQhHgAXe9KvZ3/TYmkW2j4vq5wF3WeosXGnowRfxgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399929; c=relaxed/simple;
	bh=XhHy/IWy6kTwNLmjNRHkIa4p7PtlLKE9owiDZxygnvc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P61rUG2BONkZ5HBgDEcgKKPw04Exrgi9iWRNa3QEX539dfmS4iNB15MNN5rSA0kjob2mQA7PbADCloGqhOpyhjbi2jNpOwEx2ah5213BC2Cxcg1LQNOQjidEPiLbJSVBO1YpMI1To1yMcon8+0px7bG+6XW5ZbcBRPxjgKh3dl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FLhE2XMP; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FLhE2XMP"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gV7vv0Mtvz9tdq;
	Tue,  2 Jun 2026 13:31:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780399915; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gh6B3U6dBt0aF/rQSRW2mVkz5IX/aevKD3VkLFcdUe8=;
	b=FLhE2XMP49yP7msh5QjQBGZtZIsa4e60laJ8dQAt55iUDVyNatjE+zlzBoKuN7VUFxNk0T
	clYn8D9gVfJCYIiB+BcKPf1OUQXkm5wf9UsAf4DhsXllr2hL22h4yC7z7E6djHXJghbXEb
	zqEqSAcmkWAEXktd0mQiZZ/I/zLsa4ShuqgMsUsfQ9QFigwJK4pDu0lV98ix4iD8LMZ3Dy
	FV5vX/BuXFOxDC/TgHqEjCzupQFntn2hitcm5knV+TkjLYPlmrUiciUhfIETScsF7DLRtz
	haiKQey8PPjn+amIBJQP9TGYxcycXBV0qtydIoTEfRPa5uAEHOfrsEg+uuOBtA==
Message-ID: <16dff07d28fca94749f14e9c91e6f812f605d6e5.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, phasta@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Date: Tue, 02 Jun 2026 13:31:52 +0200
In-Reply-To: <ah2M2a_4PneZpjTS@google.com>
References: <20260530143541.229628-5-phasta@kernel.org>
	 <20260530150622.393FC1F00893@smtp.kernel.org> <ah1c3NSU-4UkdUhb@google.com>
	 <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
	 <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
	 <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
	 <ah2M2a_4PneZpjTS@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MBO-RS-ID: 2315616bdee0d2aadcb
X-MBO-RS-META: m5fefcnef8xzpjy9xmfaiofyz4m8zbp8

On Mon, 2026-06-01 at 13:44 +0000, Alice Ryhl wrote:
> On Mon, Jun 01, 2026 at 03:14:05PM +0200, Philipp Stanner wrote:
> > +Cc Boris
> >=20
> > On Mon, 2026-06-01 at 14:55 +0200, Alice Ryhl wrote:
> > > On Mon, Jun 1, 2026 at 2:34=E2=80=AFPM Philipp Stanner <phasta@mailbo=
x.org> wrote:
> > > >=20
> > > > On Mon, 2026-06-01 at 10:20 +0000, Alice Ryhl wrote:
> > > > > On Sat, May 30, 2026 at 03:06:21PM +0000, sashiko-bot@kernel.org=
=C2=A0wrote:
> > > > > > > +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
> > > > > > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fe=
nce {
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid =
because `self` is valid.
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =
=3D unsafe { &mut *self.data.as_ptr() };
> > > > > >=20
> > > > > > [Severity: High]
> > > > > > Does this create an exclusive mutable reference to actively sha=
red memory?
> > > > > >=20
> > > > > > DriverFenceData can be accessed concurrently by other threads h=
olding Fence
> > > > > > references (for instance, when checking if the fence is signale=
d). Creating
> > > > > > a mutable reference (&mut) in Rust asserts exclusive access and=
 violates
> > > > > > aliasing rules, which allows the compiler to make invalid optim=
ization
> > > > > > assumptions.
> > > > > >=20
> > > > > > Could this use an immutable reference &*self.data.as_ptr() inst=
ead?
> > > > >=20
> > > > > Yes, please use an immutable reference here.
> > > > >=20
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence_data.inner.=
inner.get()
> > > > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > >=20
> > > > > > [ ... ]
> > > > > >=20
> > > > > > > +impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow<F, C>=
 {
> > > > > > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fe=
nce {
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid =
because `self` is valid.
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =
=3D unsafe { &mut *self.data.as_ptr() };
> > > > > >=20
> > > > > > [Severity: High]
> > > > > > Similar to DriverFence::as_raw(), does this also incorrectly cr=
eate a
> > > > > > mutable reference to shared data?
> > > > >=20
> > > > > Here as well.
> > > >=20
> > > > `data` is not shared. By design there is only ever one DriverFence,=
 and
> > > > the driver's data (`data.data`) is `Sync`.
> > > >=20
> > > > But I guess an immutable one should do the trick, too.
> > >=20
> > > There's only one DriverFence, but I can perform shared access to that
> > > one DriverFence from two threads in parallel. You made the type Sync,
> > > and this is what you are allowing when you do so.
> >=20
> > Nope, DriverFence is just Send, not Sync.
> >=20
> > data.data is Sync, but `data` in the code above is not the actual user
> > data, but the memory backing it up.
>=20
> Ok, well, it probably should be Sync. I don't see any &self methods that
> can't be called from multiple threads in parallel.

No. Why?

There can only be one owner of DriverFence.

Regarding the backend_ops that might access DriverFence::data, we take
care to guard that.

And DriverFence itself can only be owned by one party. That can only be
accessed by many threads if the driver stuffs that fence into something
that implements Sync.

>=20
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bindings::dma_fence_signal_locked(fence);
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 bindings::dma_fence_unlock_irqrestore(fence, flag_ptr);
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.=
data` is owned by the DriverFence, but could be accessed
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // through some d=
ma_fence callbacks right now. Access is being revoked
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // above by signa=
lling the fence. The DriverFenceAllowedData trait
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensures that t=
he data either does not need drop, or if it does it
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // lives in a Rcu=
Box which will delay dropping by one grace period, hence
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensuring that =
all readers have disappeared.
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { drop_in_=
place(self.data.as_ptr()) };
> > > > > >=20
> > > > > > [Severity: Critical]
> > > > > > Could this eagerly drop FenceCtx and user data before the C dma=
_fence
> > > > > > refcount reaches 0?
> > > > > >=20
> > > > > > The C dma_fence object can remain alive as long as consumers (l=
ike sync_file
> > > > > > or the GPU scheduler) hold references to it. If the backend lat=
er invokes
> > > > > > callbacks like ops->get_driver_name(), FenceCtx::get_driver_nam=
e() would
> > > > > > attempt to read fctx.driver_name from the already-dropped Fence=
Ctx:
> > > > > >=20
> > > > > > FenceCtx::get_driver_name() {
> > > > > > =C2=A0=C2=A0=C2=A0 ...
> > > > > > =C2=A0=C2=A0=C2=A0 fctx.driver_name.as_char_ptr()
> > > > > > }
> > > > > >=20
> > > > > > Can this result in a use-after-free?
> > > > >=20
> > > > > Hmm, I don't know about what sahisko said, but I don't think this=
 is the
> > > > > right way to do rcu freeing. I think the type's destructor should=
 be
> > > > > reserved for cases where the value becomes immediately unusable.
> > > >=20
> > > > We could guard the strings with RcuBox, but we could not then guard=
 the
> > > > FenceCtx code against code UAF if we don't have the rcu_barrier().
> > > >=20
> > > > Or could we?
> > > >=20
> > > > If a rust module unloads, module::remove() should contain an
> > > > rcu_barrier() (right??). Would that be enough to guard against the
> > > > FenceCtx code being unloaded?
> > > >=20
> > > > >=20
> > > > > For example, let's say I'm using RcuBox<_> here. Yes, the data yo=
u get
> > > > > from dereferencing the RcuBox will stay alive for a grace period,=
 but
> > > > > IMO once you run the destructor of the box itself, the *pointer* =
becomes
> > > > > immediately unusable.
> > > >=20
> > > > I don't know why you're stressing the pointer?
> > > >=20
> > > > The trick above is simply that drop / dealloc *and* code unloading =
is
> > > > delayed by a grace period.
> > >=20
> > > Sorry let me try to rephrase. I'm not worried about the stuff behind
> > > the pointer. After all, you're using RcuBox to protect that stuff.
> > > What I'm worried about is the pointer itself. You invoked
> > > drop_in_place() on the pointer to the fence context,
> > >=20
> >=20
> > on the pointer to DriverFenceData, which contains a refcount to the
> > FenceCtx, which might then want to drop.
>=20
> Let me clarify.
>=20
> You invoked drop_in_place on DriverFenceData which is effectively this
> method:
>=20
> fn drop_in_place::<DriverFenceData<F,C>>(self: *mut DriverFenceData) {
> =C2=A0=C2=A0=C2=A0 drop_in_place::<Fence>(&raw mut (*self).fence);
> =C2=A0=C2=A0=C2=A0 drop_in_place::<Arc<FenceCtx<F,C>>>(&raw mut (*self).f=
ctx);
> =C2=A0=C2=A0=C2=A0 drop_in_place::<F>(&raw mut (*self).data);
> }
>=20
> So yes you did indirectly invoke `drop_in_place` on Arc<FenceCtx<F,C>>.

Yes.

>=20
> > > =C2=A0so even though
> > > the fence context may be valid for another grace period, the *pointer=
*
> > > to the fence context is not. The pointer could have been zeroed by th=
e
> > > destructor.
> >=20
> > That particular pointer to the DriverFenceData could have been zeroed.
> > But potential other accessors have already crafted themselves a new
> > pointer to the, by the power of RCU, still valid data. That new pointer
> > is container-of-ed from struct dma_fence *f.
>=20
> I'm not talking about the pointer to DriverFenceData, I'm talking about
> the pointer to the FenceCtx, or the pointer to the data (if F is
> RcuBox).

Yeah, but the backing memory is still alive. And new pointers to that
memory get crafted by the accessors. If a callback accesses the data
through `container_of(Fence)`, it gets a new pointer.

So what's the problem?

Where is the invalid pointer that someone is accessing?

>=20
> The Arc type is not a type that opts-out of &mut =3D=3D exclusive, so the
> second drop_in_place() above is assumed exclusive access to the
> Arc<FenceCtx<F,C>> field.

OK, so I think I see the problem. So the invalid pointer is
Arc<FenceCtx=E2=80=A6>? And potentially the <F> pointer (although we don't =
have
a picture yet as to how that would be accessed through other callbacks.

>  If another thread obtains a pointer to the
> FenceCtx via reading the fctx field of the DriverFence in parallel with
> this, then that's not allowed because the drop_in_place() call has
> exclusive access to that field.

I think I have been asking in several of our meetings in the past
whether it is actually a problem to access data that has been dropped()
IF we know that drop does not cause UAF and the answer was kind of like
a "well if it does not actually get freed=E2=80=A6"

Anyways.

It would seem the way to get this right is then

synchronize_rcu();
drop_in_palace(data);


Agreed?

This would then mean, however, that every time a fence drops, you have
to wait a grace period.

Or maybe stuff DriverFenceData into an RcuBox, too, and defer its
dropping.

P.

>=20
> This is why Boqun's RcuFreeSafe has a drop_in_place_before_gp() method
> that can be used instead of drop_in_place() for this kind of use-case.
> You must leave the fctx and data fields in a state where they contain
> data that's safe to use for at least one grace period, and drop_in_place(=
)
> fundamentally does not leave the value in a usable state.
>=20
> Alice
