Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F2A426ECD
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 16:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780505471; cv=none; b=ReZVUtsfjrJyVOjy+a/MhhU2iioxxXx5i5g4KtQtaWGSXI1xbuB772s3KTUgnV9yNLEdaQ9NoaQ50ncTZ5WN7wh1AvMxgESOcSAOai/1ApUjk8tOdjYmFMJB3jUh18jhe4kNYN3AGyMNOCzHymZXKR/NyTMv+yhDeFQTO4IrtDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780505471; c=relaxed/simple;
	bh=g4Oe7HqxRy7nwUxzAEFNX536ZMypBghmYqmFr8GAo/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=czrQd6HFsDWhoESR+1ZcCA8j89bQozbTKX0xpuQEVHcBsPk/nvKyAb1he96aBjrlPJFOhPnkcppVtxA7HO8eay0Wp0UJ/85xexHcJpyxZmnwaDBgJUTZsnirOFTTNNP6X597HfJyq62zVBXKyobKHvVY30hmKMgXNz933GHQUgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oGOjZX4e; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oGOjZX4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780505468;
	bh=g4Oe7HqxRy7nwUxzAEFNX536ZMypBghmYqmFr8GAo/Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oGOjZX4eQuLnowsrWVkfszYCksz8Imq4GDn8nZ39gm5mE3o9X4ciy5IsuH0lfIfeP
	 mxyjWglFGRxg/lc/nSM2p1V2iHCn5tDn58Pv1TOXa+Sr2dqx7kI1q3VVs0svlMoYYX
	 5VuteJBNxS1oFzrQfsP6zGyUyeBmuOSckMkzqIQvnkNoQhZAbqGMZxRzLdsCPq4JCS
	 rieQ1igOuCBojDsuScyPJm7nzm50b/JoIlIH39eSZ5YP43U5u9Lp0AZCkLUrghGNiA
	 q7i5r2FzmO7EXmn3Vk0YZ5P2zabyLmL9jXk0BZr8egV466C3yJCnWcrB/tf1f3MSTd
	 EPuIhhG2VWbZw==
Received: from fedora-2.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 097A417E05FC;
	Wed,  3 Jun 2026 18:51:08 +0200 (CEST)
Date: Wed, 3 Jun 2026 18:51:04 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Philipp Stanner" <phasta@mailbox.org>, <phasta@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, <sashiko-reviews@lists.linux.dev>,
 <linux-media@vger.kernel.org>, <ojeda@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Gary Guo"
 <gary@garyguo.net>, "Daniel Almeida" <daniel.almeida@collabora.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
Message-ID: <20260603185104.2c176b75@fedora-2.home>
In-Reply-To: <DIZJD7DXYF5L.2Z7JGH55EMNU2@kernel.org>
References: <ah1c3NSU-4UkdUhb@google.com>
	<a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
	<CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
	<24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
	<ah2M2a_4PneZpjTS@google.com>
	<16dff07d28fca94749f14e9c91e6f812f605d6e5.camel@mailbox.org>
	<ah7CGySkyE7mSM8a@google.com>
	<7a978596279eca99cd41ca46606c7e5a6a38e801.camel@mailbox.org>
	<ah7FjDdU6zt65qId@google.com>
	<4bf6e916efe54bab66defda6fffea8c41358b3cc.camel@mailbox.org>
	<ah72Bi2Q5Wpgo2kE@google.com>
	<3c7e4db139df7cea18bc683d6dd33da2d00f0358.camel@mailbox.org>
	<20260603084805.5e0e23ea@fedora-2.home>
	<aa11e74f419b02c0e4fe417face43e7d05e62783.camel@mailbox.org>
	<20260603115247.21ee5d1d@fedora-2.home>
	<20260603115804.29eb8f7d@fedora-2.home>
	<5e710e0bffd21eded77f060ae34e641449325c73.camel@mailbox.org>
	<20260603132259.42184da0@fedora-2.home>
	<DIZJD7DXYF5L.2Z7JGH55EMNU2@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 03 Jun 2026 17:57:16 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Wed Jun 3, 2026 at 1:22 PM CEST, Boris Brezillon wrote:
> > Honestly, the more I think about it, the more I believe we should defer the
> > drop unconditionally and call it a day.  
> 
> I think deferring is fine, a hard synchronization with synchronize_rcu() in
> DriverFence::drop() seems very undesirable though.
> 
> Another option would be to change dma_fence_is_signaled() to take the fence lock
> already for signaled(), which should be fine given that drivers should only ever
> check a sequence number.
> 
> It would account for the fact that the same race is possible on the C side.
> While the memory allocation is protected by RCU, the contents are not, and it
> seems realistic a driver could invalidate the contents of its private data after
> signaling the fence while signaled() callbacks are still in flight.

One more thing: I'd assume that C drivers doing such an invalidation or
returning resources that might be used after a signal or that could
race with signalling would implement dma_fence_ops::release() and do
this invalidation in their custom release() implementation. Otherwise,
yes, the whole thing is broken there as well. In practice though,
there's very little stored in the <driver>_dma_fence that's not directly
related to signalling, and everything signalling related should have
their callback called with the fence lock held. The only exceptions I
could spot are the set_deadline() and the get_xxx_name() callbacks
(::wait() and ::release() being deprecated).

