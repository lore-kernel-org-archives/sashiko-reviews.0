Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792996970;
	b=3D7nZYnxvURsT1qdd2mcbAM99L3xYim5TJ3+DyyuvmkC4CA1B31toPgInBfJRlm8DtL4
	 gXdNygC0prjxX/fKs5mrqx1fbl0wxiW7tuUzSOPwMxLcQVy+Qbvk50eUQ5jupQyUFBzFH
	 HxgpRIYpUtulH0/ZoDQ+4bV8KjW+SmsSkcmzX75Ygc1jar0UbGCJcyuYmjnIpF8yWzNlh
	 zN4YuCFKgw5DZ0lZ9c3N+m4Y7LWzDdMMps1aWnNAxUMkdkD6E7S4V+xMU9lqcnmAJub8V
	 B7lrIZfeowDklrnsUsf0w+9za53i5wstonw6zy046xgKnNIL9sTFxz9dyXxEwOXlPcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792996970;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=n5Vk1C6Gb4AlFXKC7EAJi6d5JIRefGvea6Uz6EyXsKA=;
	b=U8jHpePzZiGDUFXktpJQBMYWW81bV/6QeBVl2z7xZ2p6/mqkd0J8dFl7kxgV7+icXG7J
	 vNMiv2kC03bnnpjggf8O/skFzOGnaY9m9L3isMiostIBko8Fpo0M2ISKZRhgcEU7Jp7On
	 pqSrqeQbQlwNcUy4r58rYAWEjjadOzHIO6ag0pl0QlbxJpkwz/+HGLhlH6fhcXgFGOP4E
	 eYHSuCejDOi0J7WIHFbMCizyyLAZDNwNEnuIRL39ykAbD2lUi2WfBWU+mFQ9NKjANw5dv
	 2WiGlHKhGKNLvdlRVGYzI4GyNtiFZt2UjsP08Lhc1uj3Ie7itQeDrrpb+RaYmIHpccg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U3vfl+0U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B88606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 06:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U3vfl+0U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366FC1F01825;
	Mon, 26 Oct 2026 06:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792996969;
	bh=n5Vk1C6Gb4AlFXKC7EAJi6d5JIRefGvea6Uz6EyXsKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U3vfl+0Ufgj5Eylaf+izJI/NCOCXf1RAVfxUNxZMCO0XtbSTeXllCooJOfS3a4LkS
	 3tHuJxvhJSMSXvdydTrXXKK5E3u607J1NUnlV3SF5+KVzoIxr9jR+avWhDZVgcOQot
	 Y/2Ub/n5idcTyiwO0X3MvaY2tL078Miw7XCTEnBwVqVPt3H5rFGFtmZeUUuOhOQJoY
	 KqJiBd7l3Aaa8647V6HxKE0+VrjycPaPERRKcaqgr/zcZTZhhzHgoY/fcccLFZG9Rs
	 +T5WoEE3kp0j02152ZzQJpBQ9xqa5QZVFXue5fjwyG5JuP0HQJQRau/qdrn4ggccJW
	 XxBL1dx5C4KRA==
Date: Mon, 26 Oct 2026 02:42:44 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: sashiko-reviews@lists.linux.dev, Matthew Wilcox <willy@infradead.org>,
	linux-mm@kvack.org
Cc: Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>, Anna Schumaker <anna@kernel.org>
Subject: Re: [PATCH v9 3/6] mm: add folio_mark_dropbehind() to mark a folio
 dropbehind and account it
Message-ID: <at72ZLeWWQyptVq0@kernel.org>
References: <20261024221152.6965-1-snitzer@kernel.org>
 <20261024221152.6965-4-snitzer@kernel.org>
 <sashiko-outbox-184464@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-184464@kernel.org>

On Sun, Oct 25, 2026 at 10:12:09PM +0000, sashiko-bot@kernel.org wrote:
> Can WB_DONTCACHE_DIRTY still be double-counted here if a stale
> PAGECACHE_TAG_DIRTY coincides with an unlocked dirtier that has just set
> PG_dirty?

Yes, in that window.  The folio must be clean with a stale dirty tag.
On XFS that happens when iomap_writeback_handle_eof() skips a folio that
a truncate put beyond EOF.  Then an unlocked dirtier sets PG_dirty, and
folio_mark_dropbehind() or filemap_clear_dropbehind() runs on that folio
before the dirtier takes the i_pages lock.  In that gap, a counted folio
and an uncounted one look the same: PG_dirty and the dirty tag are both
set.  Closing it needs a new page flag, or a tag clear in the paths that
uncount a folio.  Both are core mm changes.

Only the counter changes.  WB_DONTCACHE_DIRTY tells
wb_check_start_dontcache() how many pages the DONTCACHE writeback kick
writes.  A count that is too high makes the kick write more dirty pages.
A count below zero makes it write none.  Data and page state do not
change.  Before 1/6, the clear in __filemap_get_folio_mpol() decided by
PG_dirty alone, so this window and a wider one were already there.

I do not plan to change this in this series.  If linux-mm wants it
closed, I can follow up with whichever of the two changes linux-mm
prefers.
