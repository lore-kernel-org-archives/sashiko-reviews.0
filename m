Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AA13A1D01
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780478783; cv=pass; b=EbAMdFEGa1z0fmhHnl50u5Nipppmz/+knz6hBcm0hjwEw0PYopLbQYDoLTxQL07T2L2QrylS4XlMWJpKdqFFNwErkkWYHyF0dMtMbwwyd47LdtptVmwsZvkX8ZYq4tR4uKsElOh3Pgo2BWQUnK9eXUVxG4IjRspbACFUeYfO9Tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780478783; c=relaxed/simple;
	bh=dfSn673qQB7jJNhd4xJX49aMB6ORz5G2ZB0pKW64GKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQ7/b2SbcIQ8RWff69QQqnaa2IPkrMNLznT9myo6rnp3uPaAkjEnQFQK9FxZaFWoNPlj5/Ju1sR+NOVsYSyaaKg0P/VvvztdbMwykJq19YbjNkFeMafBDaWfV5zNI3MF2N2+YMu7zAvZWLhIAy7I5Bpx91CqrFHytK6ZmlXeScs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YSuxzPaO; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YSuxzPaO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso1997683f8f.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 02:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780478779; cv=none;
        d=google.com; s=arc-20240605;
        b=gPkf8hoG3eJ4t4V+l4c2CaqI6yw0GU6zmHk4NSpS3DAbQ9cXkT92P3ixcngAuFoM1a
         dYRykfVYgaH3ncddGL6NoYV8WtHJYbbtgUF2+LwI5dnfOPgMlc0A7QhQ3Tgvk3lve5qW
         uEYSHKa2/MJD4QfQ9w4na6Q/aM8SYnW7sy3jha7dov4c9i99LkYcEhwlpKmhdIhx9lPC
         JZGtuBdQQn/oQ/mDNudShEfz/7cx9d9+OsACN/gveG0ihfBjUG0sFjuQqVfEnefZLfJF
         zOE1zswAUj18ri7Uc83EumkBG0YHg3L9/9tdZmhTSXL7+gAecyYu7kxH0fnpSl3ML5Jl
         btXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VeBLL0+L8AzP+ULmlcr05o7RC3ELSphutsevtW6tOF4=;
        fh=9Y73m5S7rV9J81zAq2dojGhHH5NJ3yzXzk7ws4D89PY=;
        b=FLEf2RYbZaZYcsEnPPOm5mcvbOjCfd+MA4zJtW1trhFLi2mxCPSfGqzYnadGPS2PpJ
         Gw/1FW4jIaBmFT4ZLhNtCeCh3RZimyfcZUDCqfxVe29Yc7+OcOPDGqyTRNrWxRK7fH2m
         3/pGswDmiVPrpR4vcKhCzc+Im4Ck384qlMU9vfK5LGD3PoUUaBZloMkqd+iagaHXaXck
         cjKCGOfyJYr7Nq2C2qCJnA6XfE62PIcv1qHkjU7JWAn7+QUqQXxLUXyiPmjLwcL+G5q0
         dJbsmPd+LSoXbN8T0nN1BpaFLc32uv4pgl/pSENCmatyhceYjqS+D+8zeMRB9LMz/jr3
         32DQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780478779; x=1781083579; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeBLL0+L8AzP+ULmlcr05o7RC3ELSphutsevtW6tOF4=;
        b=YSuxzPaOLWXr3HYJDucyI2CBdGc1+ZQvWoFN6ayFED5PGeZ1XpbG73PqEZpJhrLIET
         F08nQGwMlPY/d0u3YP82UCX6kimWnsaAciH35Y/QdRdX/crG7Xk+9vF8LSvSEdtqg9td
         +N6gesILyNa7kZC0rlZ/1Et7/lxG+tDTChPQuHyfZzRvqmBxARojoq2FP9A3E7oe8QXW
         WbvUQ1N7oyzpJLKzH2L9bhuZQLwqpRHEJyl7PpXAXgHiTVDb70UqU91UZxGAVBIs39z8
         nQVVwQd7ZkSxDhX2Xkv6eGebBMcHt6Pb1SC1KRlnnyLz65P51gZMhPnXE+j9c0Z+McoP
         AlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780478779; x=1781083579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VeBLL0+L8AzP+ULmlcr05o7RC3ELSphutsevtW6tOF4=;
        b=q8CjdlGzS77ug4TiWpmt+YGG6IvZE8whNQS1aeAY4UlGJo539qACaA0CCO57wg3DQJ
         TdisF3+xxH0gMKk3o/PnhwcF5OmOHeEkRCrq5aAPYO43uHpF/Vurps9RcYtYknda+NXm
         fbpVmJD5MYrPvewPOjcdu7z575P/BOp5my7RQu73ZetZsq1r+xNLpIuSS1H3jDO9vbL/
         K8zoKEmfmz0YkAvR5KBwRZjn2N46qhVplj7C70a49/3QaGFG04NoUldp3nld5g3pBhYs
         Z4x/JpUIX5vqMLOb1TSneVu0k971U5jPidvgwPG/+TrItp6I5+ztgQczYqagUWIzXL/2
         Ow3A==
X-Forwarded-Encrypted: i=1; AFNElJ/t5gw23AUotcvXg88ptsSibBOgN9vYQ/NBj9bphmrf8M7R9YTphYEkcA+jxnN6OLlb2HlXFN4j+dW4iIqA7Ow=@lists.linux.dev
X-Gm-Message-State: AOJu0YzP/2CBWT0GXrwRUGTnCmRPQt3SSu3hfCAap67Xkp0dvdSb/Aih
	gTONkQsFfvgy97aI3rM21wanvW1rVKnLGQfH046km+tg1RYzQnaA4PFwe6gJooSZg6qPhLHTQ4n
	MJ8DManoh3nCpg1FSqvk5w4HSKtYwFxB3gpMDizne
X-Gm-Gg: Acq92OFGAt/y3KSXhT+YS0rwflprr3HJ0thCBxpJ9916tNG9MJbvQ+DEUS29nGl5H/+
	CD2X6O6E1nji18TyfFxm92cZGzpb0+pqlcGFd7rpeb59loYhq84M1Mt23r0T0K82VnVj5VaVkFu
	LLWWbJyAvyGWR4wuz5HgGWg+6eqiQfYbmCkSUfOML9SoKEUX4x4AIirkwYVCAueFPr/XOJL083E
	OI+P+T/D4vMof5beC8excoGm/lWnXkVJFTlIwHWoOJ4PtWFBpHk2lTFKsYUgt1SGQv29V0tJ+SE
	0P7DBhkcA18wNwaYVh0Pkl2AgHRXMbH033EZCrLSuvzmRSNDSLufRsQGeurwhCGXRQii1xbKshA
	ws56z
X-Received: by 2002:adf:fe50:0:b0:45e:f302:94e with SMTP id
 ffacd0b85a97d-46021869a0bmr2600318f8f.37.1780478778931; Wed, 03 Jun 2026
 02:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ah1c3NSU-4UkdUhb@google.com> <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
 <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
 <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
 <ah2M2a_4PneZpjTS@google.com> <16dff07d28fca94749f14e9c91e6f812f605d6e5.camel@mailbox.org>
 <ah7CGySkyE7mSM8a@google.com> <7a978596279eca99cd41ca46606c7e5a6a38e801.camel@mailbox.org>
 <ah7FjDdU6zt65qId@google.com> <4bf6e916efe54bab66defda6fffea8c41358b3cc.camel@mailbox.org>
 <ah72Bi2Q5Wpgo2kE@google.com> <3c7e4db139df7cea18bc683d6dd33da2d00f0358.camel@mailbox.org>
 <20260603084805.5e0e23ea@fedora-2.home> <aa11e74f419b02c0e4fe417face43e7d05e62783.camel@mailbox.org>
 <13dd6698fc812508abe40164b14d16efe2ed53d2.camel@mailbox.org>
In-Reply-To: <13dd6698fc812508abe40164b14d16efe2ed53d2.camel@mailbox.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 3 Jun 2026 11:26:06 +0200
X-Gm-Features: AVHnY4Ik25hqR3ahogckC30iAJmd8vAIyAyk8G91e0Vy4GXxVVLxKQTKhOBFy3s
Message-ID: <CAH5fLgjHwJtxBN=RJazkPWEMEp0P_S2f6YMByTi1CAmvGA4jOQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
To: phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, sashiko-reviews@lists.linux.dev, 
	linux-media@vger.kernel.org, ojeda@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Gary Guo <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 11:07=E2=80=AFAM Philipp Stanner <phasta@mailbox.org=
> wrote:
>
> On Wed, 2026-06-03 at 09:43 +0200, Philipp Stanner wrote:
> > On Wed, 2026-06-03 at 08:48 +0200, Boris Brezillon wrote:
> > > On Wed, 03 Jun 2026 08:10:51 +0200
> > > Philipp Stanner <phasta@mailbox.org> wrote:
> > >
> > > > +Cc Danilo, Gary, Daniel, Christian
> > > > (who seem to have been lost because Sashiko dropped them and this t=
hread is a reply to that tool)
> > > >
> > > >
> > > > On Tue, 2026-06-02 at 15:25 +0000, Alice Ryhl wrote:
> > > > > On Tue, Jun 02, 2026 at 02:06:43PM +0200, Philipp Stanner wrote:
> > > > > > On Tue, 2026-06-02 at 11:59 +0000, Alice Ryhl wrote:
> > > > > > > On
> > > > > >
> > > > > > [=E2=80=A6]
> > > > > >
> > > > > > > > >
> > > > > > > > > If you don't implement Sync, then DriverFence cannot be s=
tored in an
> > > > > > > > > Arc. I wouldn't take away that ability unless you have to=
, and I don't
> > > > > > > > > see anything in the DriverFence API that would mean you c=
an't do that.
> > > > > > > >
> > > > > > > > Nope. We explicitly agreed on this design.
> > > > > > > >
> > > > > > > > Just 1 DriverFence. Just 1 party that can signal it.
> > > > > > > > Note that we also agreed upon the Driverfence disappearing =
with
> > > > > > > > .signal(), which certainly prevents several from existing, =
unless you
> > > > > > > > do an Option.take()
> > > > > > >
> > > > > > > I would like to clarify that I'm not suggesting any changes t=
o the
> > > > > > > design. Implementing Sync is not the same as having multiple =
driver
> > > > > > > fences.
> > > > > >
> > > > > > I mean, I guess one can do that. But it's up to the driver then=
 to see how it can signal its fence.
> > > > >
> > > > > I don't believe Sync changes anything with that regard. The signa=
l
> > > > > method takes 'self', but the Sync trait only affects how '&self' =
methods
> > > > > can be called.
> > > > >
> > > > > > > > > > > > >  so even though
> > > > > > > > > > > > > the fence context may be valid for another grace =
period, the *pointer*
> > > > > > > > > > > > > to the fence context is not. The pointer could ha=
ve been zeroed by the
> > > > > > > > > > > > > destructor.
> > > > > > > > > > > >
> > > > > > > > > > > > That particular pointer to the DriverFenceData coul=
d have been zeroed.
> > > > > > > > > > > > But potential other accessors have already crafted =
themselves a new
> > > > > > > > > > > > pointer to the, by the power of RCU, still valid da=
ta. That new pointer
> > > > > > > > > > > > is container-of-ed from struct dma_fence *f.
> > > > > > > > > > >
> > > > > > > > > > > I'm not talking about the pointer to DriverFenceData,=
 I'm talking about
> > > > > > > > > > > the pointer to the FenceCtx, or the pointer to the da=
ta (if F is
> > > > > > > > > > > RcuBox).
> > > > > > > > > >
> > > > > > > > > > Yeah, but the backing memory is still alive. And new po=
inters to that
> > > > > > > > > > memory get crafted by the accessors. If a callback acce=
sses the data
> > > > > > > > > > through `container_of(Fence)`, it gets a new pointer.
> > > > > > > > > >
> > > > > > > > > > So what's the problem?
> > > > > > > > > >
> > > > > > > > > > Where is the invalid pointer that someone is accessing?
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > The Arc type is not a type that opts-out of &mut =3D=
=3D exclusive, so the
> > > > > > > > > > > second drop_in_place() above is assumed exclusive acc=
ess to the
> > > > > > > > > > > Arc<FenceCtx<F,C>> field.
> > > > > > > > > >
> > > > > > > > > > OK, so I think I see the problem. So the invalid pointe=
r is
> > > > > > > > > > Arc<FenceCtx=E2=80=A6>? And potentially the <F> pointer=
 (although we don't have
> > > > > > > > > > a picture yet as to how that would be accessed through =
other callbacks.
> > > > > > > > > >
> > > > > > > > > > >  If another thread obtains a pointer to the
> > > > > > > > > > > FenceCtx via reading the fctx field of the DriverFenc=
e in parallel with
> > > > > > > > > > > this, then that's not allowed because the drop_in_pla=
ce() call has
> > > > > > > > > > > exclusive access to that field.
> > > > > > > > > >
> > > > > > > > > > I think I have been asking in several of our meetings i=
n the past
> > > > > > > > > > whether it is actually a problem to access data that ha=
s been dropped()
> > > > > > > > > > IF we know that drop does not cause UAF and the answer =
was kind of like
> > > > > > > > > > a "well if it does not actually get freed=E2=80=A6"
> > > > > > > > >
> > > > > > > > > Ok, well, IMO the simplest approach is to say you can't. =
There may be
> > > > > > > > > roundabout ways to do it, but I would suggest that we jus=
t ... don't.
> > > > > > > >
> > > > > > > > Ack.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > Anyways.
> > > > > > > > > >
> > > > > > > > > > It would seem the way to get this right is then
> > > > > > > > > >
> > > > > > > > > > synchronize_rcu();
> > > > > > > > > > drop_in_palace(data);
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Agreed?
> > > > > > > > > >
> > > > > > > > > > This would then mean, however, that every time a fence =
drops, you have
> > > > > > > > > > to wait a grace period.
> > > > > > > > > >
> > > > > > > > > > Or maybe stuff DriverFenceData into an RcuBox, too, and=
 defer its
> > > > > > > > > > dropping.
> > > > > > > > >
> > > > > > > > > That would work, but I think we can do better and avoid t=
he
> > > > > > > > > synchronize_rcu() along these lines:
> > > > > > > > >
> > > > > > > > > unsafe trait RcuRevocable {
> > > > > > > > >     unsafe fn rcu_revoke_in_place(ptr: *mut Self);
> > > > > > > > > }
> > > > > > > > >
> > > > > > > > > This trait provides a method that's like drop_in_place(),=
 except that
> > > > > > > > > when you use this destructor, the value remains usable fo=
r one grace
> > > > > > > > > period. You could implement it for RcuBox, and for any Co=
py type, and
> > > > > > > > > for ARef<T> when T is cleaned up with rcu, and probably a=
lso other
> > > > > > > > > stuff.
> > > > > > > >
> > > > > > > > I mean, this cannot be magic. It also boils down to executi=
ng one RCU
> > > > > > > > callback per DriverFence dropping.
> > > > > > > >
> > > > > > > > Is there a significant difference to stuffing DriverFenceDa=
ta into an
> > > > > > > > RcuBox?
> > > > > > >
> > > > > > > Do you mean hard-coding that the user-data of a driver fence =
is always
> > > > > > > stored in an RcuBox?
> > > > > >
> > > > > >
> > > > > > I'm talking about this:
> > > > > >
> > > > > >
> > > > > >
> > > > > > impl<F: Send + Sync + DriverFenceAllowedData, C: Send + Sync> D=
riverFenceAllocation<F, C> {
> > > > > >     /// Create a new allocation slot that can later be used to =
create a fully
> > > > > >     /// initialized [`DriverFence`] without the need to allocat=
e.
> > > > > >     pub fn new(fctx: Arc<FenceCtx<F, C>>, data: F) -> Result<Se=
lf> {
> > > > > >         let fence_data =3D DriverFenceData {
> > > > > >             // `inner` remains uninitialized until a [`DriverFe=
nce`] takes over.
> > > > > >             inner: Fence {
> > > > > >                 inner: Opaque::uninit(),
> > > > > >             },
> > > > > >             fctx,
> > > > > >             data,
> > > > > >         };
> > > > > >
> > > > > >         // In order to support the C dma_fence callbacks, it is=
 necessary for
> > > > > >         // a `Fence` and a `DriverFence` to live in the same al=
location,
> > > > > >         // because the C backend passes a dma_fence, from which=
 the driver most
> > > > > >         // likely wants to be able to access its `data` in `Dri=
verFence`.
> > > > > >         //
> > > > > >         // Hence, we need the manage the memory manually. It wi=
ll be freed by the
> > > > > >         // C backend automatically once the refcount within `Fe=
nce` drops to 0.
> > > > > >         let data =3D RcuBox::new(fence_data, GFP_KERNEL | __GFP=
_ZERO)?;
> > > > > >
> > > > > >         Ok(Self { data })
> > > > > >     }
> > > > > >
> > > > > >
> > > > > > This way, the entire DriverFenceData will remain valid for an
> > > > > > additional grace period. I suppose this would solve your pointe=
r-
> > > > > > invalid concern.
> > > > > >
> > > > > > However, it appears like overkill to me because the refcounting=
 + C
> > > > > > backend already ensure that nothing drops too soon, and the bac=
kend
> > > > > > frees with kfree_rcu(), so=E2=80=A6
> > > > >
> > > > > I agree that it doesn't sound like we want RcuBox here.
> > > > >
> > > > > What kind of metadata are we actually planning to store in the
> > > > > DriverFence in practice?
> > > >
> > > > I suppose it might be GPUVM payloads. IIRC in Tyr it's currently ju=
st
> > > > empty structs as some sort of identifier. I guess copies of the act=
ual
> > > > command buffers will also reside in their associated fences.
> > > >
> > > > But Boris, Daniel and Danilo probably have something smart to say a=
bout
> > > > that.
> > >
> > > In Tyr we don't need any, because we're using SW signalling: we get a=
n
> > > interrupt, look at our HW fence seqno, and walk the set of pending
> > > fences to signal them with the ::signal() method (that's an
> > > over-simplified view of it, but functionally that's how it works).
> > >
> > > Now, the question is more, what drivers planning to support HW
> > > signaling want attached to the DriverFence. My gut feeling is that no=
w
> > > that we have a way to get back to the FenceCtx, and given that FenceC=
tx
> > > also has driver-specific data attached to it, most common use cases
> > > where the fence contains a backpointer to its timeline/creator are
> > > covered. If I look at nouveau_fence [1] (I intentionally looked at th=
e
> > > most likely next user of this) for instance:
> > >
> > > struct nouveau_fence {
> > >     struct dma_fence base;
> > >
> > >     struct list_head head;
> > >
> > >     struct nouveau_channel __rcu *channel;
> > >     unsigned long timeout;
> > > };
> >
> > Thx for the explanation
> >
> > >
> > > - channel is basically the FenceCtx in your new design
> > > - head is used to insert the fence in the fence context list. Not too
> > >   sure how it translates in rust (insertion in an XArray instead?).
> > >   Anyway, that's just stuff you need to make your fence part of the
> > >   context timeline, so it's again related to how you link a fence to
> > >   its context and let the context walk back pending fences when it
> > >   needs to. Feels like my original FenceTimeline abstract proposal [2=
]
> > >   could help make this thing generic, but let's reconsider this once
> > >   we've got the basics sorted out, please
> > > - timeout is probably the only thing of interest here, assuming thing=
s
> > >   can be signaled out of order (if they are signaled in order, like i=
s
> > >   the case in Tyr, the timeout can just be on the FenceCtxData and
> > >   represent the timeout of the first fence in the set). Anyway, that'=
s a
> > >   scalar, so no fancy ::drop() needed if that's what you're worried
> > >   about
> >
> > What we / Alice are worried about is multiple things.
> >
> > One issue is that Alice believes that
> >
> >         // SAFETY: `self.data` is owned by the DriverFence, but could b=
e accessed
> >         // through some dma_fence callbacks right now. Access is being =
revoked
> >         // above by signalling the fence. The DriverFenceSafeToDrop tra=
it
> >         // ensures that the data either does not need drop, or if it do=
es it
> >         // lives in a RcuBox which will delay dropping by one grace per=
iod, hence
> >         // ensuring that all readers have disappeared.
> >         unsafe { drop_in_place(self.data.as_ptr()) };
> >
> >
> > from DriverFence::drop() invalidates the pointers that thread A
> > accesses, even if DriverFence::data.data's drop is delayed with RCU.
> >
> > Now if thread B drops DriverFence, thread A could use invalid pointers,
> > but while still operating on non-deallocated memory (because our
> > refcounting guards against that).
> >
> > The only way I can see to make that bullet proof would be to do
> > synchronize_rcu() before the drop_in_place() above =E2=80=93 but that w=
ould
> > mean that we delay each fence drop by one grace period.
> >
> > I'm still not sure how real the problem really is, though. Because
> > refcounting guards, and drop() doesn't actually *do* something to the
> > pointers, or does it?
>
>
> Re: this, brainstorming a bit:
>
> An idea that has been floating in my head for a while is whether
> Revocable might be a good choice for a job like this.
>
> The reason against it is that we already *have* a Revocable: the
> dma_fence. It guards with an atomic boolean (signaled bit) + RCU, just
> like Revocable.
>
> I think it might give the formal protection that Alice desires, but
> then we'd have the same mechanism twice.

We could also just start with only supporting types that are Copy.
That'd be really simple because no drop is required.

Alice
