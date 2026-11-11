Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426042;
	b=CjfyAkKhUApDOkY8YxKrydr7D0ziPEOck+B3kVNdwXPnySnsBu9NkI8wjACzhVA8nTVx
	 imXMlVeBTNrnqXap+uvNMIFySlssx+/gf4KxkDr+th6gUQdebCaUb8tzzztvOvUBcsEUN
	 C5fOzRKWloTnK+0CBNB6lGZw2iujanmq8Emo4KUKLG77OOncnZBXhnXn4Squ2eXZiS790
	 lVRq1DK8WFmX9PNyGSCIFOF6ILjqVmPGSXEMzkyYyu/37ilPk8ENm6xE4HIWoFjLvpcsO
	 uxZISSRWwZyXbVj/quyGEQVVRBMsyw+wSQZtdy9dnhQhHOPEBrvE34GVcz2LfS/F7CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426042;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=B9+U4iNiHz63kgEwzrgZfWzI7/jqnf7J3/4pv9aI/zc=;
	b=yw0la63qBEfJ8JIU0DhnUq11B/GfcY65Mh8udgieY2DZex9aq5luzWuamQbJzHHXMsig
	 J7GB8IHJeTUAYRpDT8NiBK9ukr4uxWrCimg7nXff4zOkKfWM9jmy6/xiSQleBX06YqMrN
	 /EclMoZk4s8N+jLDHgth/GxqB44p67/t8ibGwGRpRunEDjeDwgo6+ZosmeSE3EbRnkmrJ
	 gXCXYljgn/d2eISV/XVVwt83woVtT66hdAK3sHuU8Zv8n3sfg+gbMERY+YaOJPYnhBIMM
	 OUatOF5B+unAi01h76nVCPpsAh4XNHqa2uGLxVx/YXEIWHJzctBR8OfT0yoh+KN+4AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zx+nIfXZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9260960700A8
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 19:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zx+nIfXZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8279C1F00A0A;
	Wed, 11 Nov 2026 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426042;
	bh=B9+U4iNiHz63kgEwzrgZfWzI7/jqnf7J3/4pv9aI/zc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Zx+nIfXZJ5nduKwV4Kohuy6/wPdBQ4ZIaJJqYxE+zuPQGTjFy0XKAB/vd5Nul6mWS
	 dfbb8UYEW+trGtamk7bCAjRFBbU/f9x+NGE3/pvTn1LX17XvYSldT9RNfsRDtbg5ZF
	 yMx9oiUTY1wuYeAu49os930Inq/rwkyDpMpahOZV4+zQhdZc6ZrMe2sWjWkNp9CnMJ
	 5gwC/xRFPp8FsEMGuA0isPQ0XSW15BK4OQ2abwu82gu1KzNB6abF6XDM+IDpfsBueP
	 tE2J47l2c9YtzO73s6ESRKnkVBC+VbnnD+c+f74bsv7iVifmphXZ9IdlkaBHomBLvZ
	 RDQpI7pIY1AcQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: sashiko-reviews@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6r?=
 =?utf-8?Q?n?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon
 <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Mark Rutland
 <mark.rutland@arm.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>, Lyude Paul <lyude@redhat.com>
Cc: linux-mm@kvack.org
Subject: Re: [PATCH v5 1/4] rust: io: require freedom from plain accesses
 for `SysMem`
In-Reply-To: <sashiko-outbox-209186@kernel.org>
References: <20261110-page-volatile-io-v5-0-a91ef252c24b@kernel.org>
 <20261110-page-volatile-io-v5-1-a91ef252c24b@kernel.org>
 <lAtM0NMr_K13f2Z2C_qDZsigOTH50qf6QuQZFFVh8k5-v2pkTO25UdKBCrSXWiHNHqhYUtZjNkwa-xsZraO9Og==@protonmail.internalid>
 <sashiko-outbox-209186@kernel.org>
Date: Wed, 11 Nov 2026 20:40:24 +0100
Message-ID: <875wy3w40n.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] rust: io: SysMem::new() no-plain-access invariant violated by
>   callers
> --
>
> commit 2301a5fd31bd2665dfd4001d0e9beab25a81725b
> Author: Andreas Hindborg <a.hindborg@kernel.org>
>
> rust: io: require freedom from plain accesses for `SysMem`
>
> This commit adds a type invariant to SysMem and a safety requirement on
> SysMem::new() requiring that no plain accesses are performed to the memory
> region for the lifetime of the view.
>
>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>> index a877df11a03e0..3bc4be35e3554 100644
>> --- a/rust/kernel/io.rs
>> +++ b/rust/kernel/io.rs
> [ ... ]
>> @@ -1570,8 +1582,10 @@ impl<'a, T: ?Sized> SysMem<'a, T> {
>>      ///
>>      /// # Safety
>>      ///
>> -    /// `ptr.addr() .. ptr.addr() + KnownSize::size(ptr)` must be valid and aligned kernel
>> -    /// accessible memory region for the lifetime `'a`.
>> +    /// - `ptr.addr() .. ptr.addr() + KnownSize::size(ptr)` must be valid and aligned kernel
>> +    ///   accessible memory region for the lifetime `'a`.
>> +    /// - No plain access (see [`SysMem`]) to that memory region may be performed for the lifetime
>> +    ///   `'a`.
>>      #[inline]
>>      pub unsafe fn new(ptr: *mut T) -> Self {
>>          // INVARIANT: Per safety requirement.
>
> [Severity: Medium]
> Does this new SysMem<'a, T> invariant conflict with the existing
> SysMem::new() callers in Coherent and VMap?
>
> In rust/kernel/dma.rs, <&'a Coherent<'_, T> as IoBase<'a>>::as_view() is a
> safe method that wraps the buffer in SysMem<'a, T> inside CoherentView<'a, T>,
> while CoherentView::as_ref() and CoherentView::as_mut() hand out &'a T and
> &'a mut T references for plain accesses over the same lifetime 'a:
>
> rust/kernel/dma.rs:CoherentView::as_ref() {
>     pub unsafe fn as_ref(self) -> &'a T {
>         // SAFETY: pointer is aligned and valid per type invariant. Aliasing rule is satisfied per
>         // safety requirement.
>         unsafe { &*self.cpu_addr.as_ptr() }
>     }
> }
>
> rust/kernel/dma.rs:<&'a Coherent<'_, T> as IoBase<'a>>::as_view() {
>     fn as_view(self) -> CoherentView<'a, Self::Target> {
>         CoherentView {
>             // SAFETY: `cpu_addr` is valid and aligned kernel accessible memory.
>             cpu_addr: unsafe { SysMem::new(self.cpu_addr.as_ptr()) },
>             dma_addr: self.dma_addr,
>         }
>     }
> }
>
> Any plain read or write through those references during 'a violates the
> SysMem<'a, T> invariant even when no concurrent access occurs.  Similarly,
> <&'a VMap<D, R, SIZE> as IoBase<'a>>::as_view() in
> rust/kernel/drm/gem/shmem.rs calls SysMem::new() without VMap's invariants or
> its SAFETY comment guaranteeing that no plain accesses occur during 'a.

The last bullet of the safety requirement for `SysMem::new` is not
formulated correctly. It should state that no plain accesses may race
with accesses performed through the view, not that all accesses are
prohibited. I will fix this in the next version.

I will also update the safety comment on the call sites. The calls do
comply with the requirement, as far as I can tell.

Best regards,
Andreas Hindborg



