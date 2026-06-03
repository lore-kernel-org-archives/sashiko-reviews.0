Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8EA3D565F;
	Wed,  3 Jun 2026 15:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780502241; cv=none; b=p0jWyVvACLARCcxC/4Xkf5TDXgSMCyUMnv7rAx7QeJ46Lz1iCk5Oss7ytFd0MDlRhZK3l1WSJcewHPRFH1wD3fipZx9/IDetbPYaD8NxgUfkhTxripifEO7XdQqEAWYOUkCce9ps+EAhAax4MqvfBQq2ir9gy2bIZhksGnC9nZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780502241; c=relaxed/simple;
	bh=6tKSeD5wWCD6Q/4otXWMo2QWxpMP8ugSFjW9vNwvBeA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=BUMQhebuNCo6aCVm/KbvXfZa96HnruNGHZrkoFXm/KFDUQ9XkAKs1Y5ZpaDCsYE3OsYNWtgVdameKfQXF/pYWTAT/1he5497fSLJSoND44+KOMUvHKd2lkswGYNcBxKry1kPMKGU0QfEKlDxy8Tga6e14314vkrxtci+ezkYQJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCjlJ0r6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCjlJ0r6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B3E1F00893;
	Wed,  3 Jun 2026 15:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780502239;
	bh=6tKSeD5wWCD6Q/4otXWMo2QWxpMP8ugSFjW9vNwvBeA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=JCjlJ0r6SN8uEawdWjWo0Ju0zPAJ4+hCAkU+W71WPg/9FfPDrSUYPXGCrW3Re+KSw
	 ZsKYCrn4fDu83bHOazKyMS+a5gBZ/30A9TmfGSTcy55TDSefSaRUUSTmGis1fkMaWM
	 y6TFjsInVYeB+GpIhvfsZM8FN17g1OjMHfLq9CdgxFR/o5/QiufyMNerLTvMz4w/by
	 1YdtAOIWP1yTUUM7bYkdhOZwpYdkj/5IvSGspxtgg68bXkIeTlN9MLw0E3UjGUyYEE
	 D8BvDCwzxzUUs8/YKO4bj0wIqVRyKsJ4RtsZaqNeOVL1r4FnVZDloiCVwK43gvA451
	 dfW/ErTqp1n/A==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 17:57:16 +0200
Message-Id: <DIZJD7DXYF5L.2Z7JGH55EMNU2@kernel.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
Cc: "Philipp Stanner" <phasta@mailbox.org>, <phasta@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, <sashiko-reviews@lists.linux.dev>,
 <linux-media@vger.kernel.org>, <ojeda@kernel.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Gary Guo"
 <gary@garyguo.net>, "Daniel Almeida" <daniel.almeida@collabora.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
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
In-Reply-To: <20260603132259.42184da0@fedora-2.home>

On Wed Jun 3, 2026 at 1:22 PM CEST, Boris Brezillon wrote:
> Honestly, the more I think about it, the more I believe we should defer t=
he
> drop unconditionally and call it a day.

I think deferring is fine, a hard synchronization with synchronize_rcu() in
DriverFence::drop() seems very undesirable though.

Another option would be to change dma_fence_is_signaled() to take the fence=
 lock
already for signaled(), which should be fine given that drivers should only=
 ever
check a sequence number.

It would account for the fact that the same race is possible on the C side.
While the memory allocation is protected by RCU, the contents are not, and =
it
seems realistic a driver could invalidate the contents of its private data =
after
signaling the fence while signaled() callbacks are still in flight.

Note that there are no new constraints, signaled() is already called with R=
CU
read lock held, plus there's also dma_fence_is_signaled_locked() which also
calls signaled() with the fence lock held.

With this, the problem goes away, as it would guarantee that once we reach
drop_in_place() in DriverFence::drop() it is impossible that there are stil=
l
callback in flight.
