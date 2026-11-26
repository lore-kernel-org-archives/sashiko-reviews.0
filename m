Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720491;
	b=iHoQ/TH/ZVkrrlP/hcB6CfQlXsh13IUjzDWhSz8UJX0xcP5ZEEYGXgHdRrswU0JvAIuu
	 3SUk/pbYm/BwPjDvIiqAlXA9esGOFPaPjK8VYIkUyMFaVE5QEXvPoSkqT0N6CA7bDxWYH
	 XqDfUtCoe/6cLgHLufHw3+pklJHePfXEpvst0WDqVwc/UMEjEacv0cMSiezC2Gvhv5KQa
	 IMRs6JbNsmrWjC7UVh+HNiGVbjFIEL9uVPk4JnGe28zNgZ5ZskxmHhNMOpoNx6PwciWKG
	 0IK+maXALakmpGYU9YI4DzXzlH8T2NKrm5jilEBt+chxmLdjEGne402WlRgTC8aPmnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720491;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=CuVLv2i2GOptfnACX7l3LiPUxZvYfKOmSODmwPhhkPw=;
	b=OecRL0cVZRUfuhnZemxW5/pjpg0fG7ZHB4t1WW58H/iUhehMOUeD/xEfJrTnSxSc5hBH
	 9pMD52dILynNciccXRu59GNbp/ODibGrE8NIZ+e+d+82Ap6YbI1rvPwO+NEdBQ/NE9Iru
	 ZmJsBvrTExOFi1PUn3vMsy3JaNmpKjiTllCzDhCzfe8JAfa7lwuur9HPy39wSIePRCiqB
	 8JLSDjwMeHmU9lds2SH+hB3nVWR4z7RG1RcAfdSbKK7gJFxJG6r7tpjZM4nlvvEDSJARX
	 L9BjK/NUxnxn0Q5vUEvMiN6aL+x1pdQPbKkBnFW7+6Vs32B4lN8mGgIxcVerpf+pSsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mC7UtwFI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1AB606A326
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 19:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mC7UtwFI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B11D1F000C4;
	Thu, 26 Nov 2026 19:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720491;
	bh=CuVLv2i2GOptfnACX7l3LiPUxZvYfKOmSODmwPhhkPw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mC7UtwFIZfgl362g4XVFFQa/G8viDzYK9zciLeNK4vN3HA19avPzi/zfmTg9BbGIU
	 dgelNbTa7s4yMuoGmp8foEhEPgNckZ0kOOxjjZzmt6CBra5rShY0LwesOtWrGrviCT
	 BXQwqJfB3mNv/WrPnyop1ygoMYYseBWl1YAbDtlasemS/PkApEcvJLQwZ6e3eGygqI
	 Z3OXnQlvYs/Yo8WSSjFWvSEvKBPp5MXU4m+OUQkmI7PKHw5pZhjyTruSefXYjiNpzB
	 VjRtOH2rC9Q8ru9ADi02DdfamuJWXQkm/qynGSBxdwbpRo+RVi6rEgIwh1Zb8voVhL
	 ocZCZs24Dg2eQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: sashiko-bot@kernel.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Pasha Tatashin"
 <pasha.tatashin@soleen.com>,  "Mike Rapoport" <rppt@kernel.org>,  "Andrew
 Morton" <akpm@linux-foundation.org>,  sashiko-reviews@lists.linux.dev,
  kexec@lists.infradead.org,  linux-mm@kvack.org
Subject: Re: [PATCH v4] mm/memfd_luo: don't use memfd_pin_folios()
In-Reply-To: <sashiko-outbox-234004@kernel.org> (sashiko-bot@kernel.org's
	message of "Wed, 25 Nov 2026 18:40:57 +0000")
References: <20261124184042.1823277-1-pratyush@kernel.org>
	<sashiko-outbox-234004@kernel.org>
Date: Thu, 26 Nov 2026 19:14:47 +0000
Message-ID: <2vxzzeuvv1zs.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
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

On Wed, Nov 25 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/memfd_luo: unbatched migration and LRU drain in
>   memfd_luo_migrate_folio()
> --
>
> commit 36bee618bf022031606488c041334f6b85cc82a9
> Author: Pratyush Yadav (Google) <pratyush@kernel.org>
>
> mm/memfd_luo: don't use memfd_pin_folios()
>
> This commit replaces memfd_pin_folios() with a direct page cache walk
> using shmem_get_folio() and migrates folios out of movable or CMA
> pageblocks individually via memfd_luo_migrate_folio().
>
>> diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
>> index 6b68220275ebe..38584ecfa70be 100644
>> --- a/mm/memfd_luo.c
>> +++ b/mm/memfd_luo.c
>> @@ -77,26 +77,168 @@
>
> [ ... ]
>
>> +static int memfd_luo_migrate_folio(struct folio *folio)
>> +{
>> +	struct migration_target_control mtc = {
>> +		.nid = NUMA_NO_NODE,
>> +		/* Not movable, so the target is neither in ZONE_MOVABLE nor CMA. */
>> +		.gfp_mask = GFP_USER | __GFP_NOWARN,
>> +		.reason = MR_LONGTERM_PIN,
>> +	};
>> +	LIST_HEAD(source);
>> +	bool isolated;
>> +
>> +	/* Flush per-CPU LRU batches holding the folio so isolation works. */
>> +	lru_cache_drain_for_folio(folio, 1, NULL);
>> +	isolated = isolate_folio_to_list(folio, &source);
>> +	/* Isolation holds its own reference. */
>> +	folio_put(folio);
>> +	if (!isolated)
>> +		return -EBUSY;
>> +
>> +	if (migrate_pages(&source, alloc_migration_target, NULL,
>> +			  (unsigned long)&mtc, MIGRATE_SYNC, MR_LONGTERM_PIN,
>> +			  NULL)) {
>> +		putback_movable_pages(&source);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	return 0;
>> +}
>
> [Severity: Medium]
> Does migrating one folio at a time here regress preservation latency when
> folios in the memfd already reside in ZONE_MOVABLE or MIGRATE_CMA
> pageblocks?
>
> Previously, memfd_pin_folios() called check_and_migrate_movable_folios(),
> which shared a single enum lru_cache_drained state across the scan so
> lru_add_drain() and lru_add_drain_all() ran at most once, and passed all
> movable folios to a single migrate_pages() call so migrate_pages_batch()
> could batch TLB shootdowns across up to NR_MAX_BATCHED_MIGRATION (512)
> unmapped pages.
>
> Calling memfd_luo_migrate_folio() per folio passes NULL for the drained
> state to lru_cache_drain_for_folio(), which can trigger repeated local and
> all-CPU LRU cache drains, and invokes migrate_pages() on a single-folio
> list, forcing a cross-CPU TLB shootdown IPI for every mapped folio that
> needs migration.

I measured the performance before and after this patch with
movablecore=75%, and it found that with 4k pages, performance does
indeed drop, but the difference is quite small. Only 5-8% slower. THPs
stay about the same.

So I think the slowdown is small enough to not matter.

-- 
Regards,
Pratyush Yadav
