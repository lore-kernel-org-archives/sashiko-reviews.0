Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745441;
	b=mVVXzk3ic5jT7wY1j8ea2KqcptqxTIvFO/DqLHVd3Y3tCvR5aRlD6wgwWcoOxZ3N1/VA
	 EW9arc737D3uLq2zS4Gze7nrFUe+SyKMaNH1hbbU7ObDtbE+tVnh8vyUH2EAIlGEKLP/D
	 EAVsBYucrPytDRweGtldaS0A+NZuJDEb3uzfbgTChdE9DPoNSZLDZ0gJen6qku1ZGeSir
	 yjrS8+/NzKM1asJAidk226hjNpEk1CNmD9LF1GME4AtgWhufds8Mx0al0CYu3OF0xRLLE
	 xz+xjSmJW6WDhaxXJ+ISQ97wc+spEF6/xXAFZMPT6yinbjuHS9f5sK2sWZbBX3Q1pGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745441;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=NJ71py6i4waAq8tFr24Jq5kGVUA8O+SGz5SBTC+E7w8=;
	b=PMyl40rAoUUQzIjmDPibGJdPOFOmw5AAAq+JGaYUzzFJnawnpJQ8PQqGAstzQZU6AQt0
	 srCK4yCcMLFoH/azmT2hQ1Foj3YRZLMcUBUh83fcl3pFte5CzhAa0nQS0LOl2pH6rTd/W
	 DBy8EhkZIODg4JuiFSXz6Nq3uYFf4dHVNBIf7VGnqz/S6ou8S8XLDWHAPl9BzhPmVk/A9
	 D0L8pBprBWXF4v3KK0dCp2bAhvDZLMJ6f7K5qNNkGISJZqoFExp1XuakD/wWYEFrKznLE
	 do7s06hXHsdAOHHRtZdweGpuQoF9T4gj/1Eb5fng4ls00k0iCPwGmLdop43fdsqiL1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8A4nVmI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7C0606A323
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 12:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8A4nVmI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA941F000C4;
	Sun, 15 Nov 2026 12:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794745441;
	bh=NJ71py6i4waAq8tFr24Jq5kGVUA8O+SGz5SBTC+E7w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k8A4nVmIqoi/NWmPd2U6byTM0cbL4NjprWGfkLWfObyXrqMlOPrnyd9MN2qnIZi7T
	 +UR+9z4YpesMhoi76B4Yr2u5UZqePcDOgCCU2BFXmYWmQ4Zr4fZk2b1UqzAv03KgTE
	 sdM/rAAym81NYGbfIqts+y85jlUJyAXXE+CNNPkEEpPP8MzmNkKLY+5+SZzyzJfo/B
	 DPndMAI9VsTgO7l1SRzjp7m0mf/BFQvpmD6dKoELyl5iIxQFdycv5GYGeMLjWISK6S
	 V/n7GouF6Y2sotIGr62b9yJ73VWHApvR5rL/Bfuv4G1ut+M8y3uo3zi/dspZTlUrLu
	 e58HmdJdqOPjQ==
Date: Sun, 15 Nov 2026 12:23:56 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, Tal Zussman <tz2294@columbia.edu>
Subject: Re: [PATCH v2] mm/madvise: zap markers from guard regions
Message-ID: <avmkGrQbxiu2_XYm@lucifer>
References: <20261113-disallow-uffd-guard-install-v2-1-9d0063c70542@kernel.org>
 <sashiko-outbox-215027@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-215027@kernel.org>

On Sat, Nov 14, 2026 at 09:05:04PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/madvise: zap_range() reclaims PTE tables needed by
>   madvise_guard_install()
> --
>
> commit b93124c4df6f4f255fb9c4d2510c6ff4b474ec35
> Author: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> mm/madvise: zap markers from guard regions
>
> This commit introduces a zap_range() helper and uses it in
> madvise_guard_install() with ZAP_FLAG_DROP_MARKER so that existing PTE
> markers are dropped when zapping a range prior to installing guard markers.
>
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 0214efd2a014f..4f77285832079 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -850,6 +850,19 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior)
> >  	return 0;
> >  }
> >
> > +static void zap_range(struct madvise_behavior *madv_behavior,
> > +		      zap_flags_t flags)
> > +{
> > +	const struct madvise_behavior_range *range = &madv_behavior->range;
> > +	struct zap_details details = {
> > +		.reclaim_pt = true,
> > +		.zap_flags = flags,
> > +	};
> > +
> > +	zap_vma_range_batched(madv_behavior->tlb, madv_behavior->vma,
> > +			      range->start, range->end - range->start, &details);
> > +}
>
> [ ... ]
>
> > @@ -1217,9 +1224,11 @@ static long madvise_guard_install(struct madvise_behavior *madv_behavior)
> >
> >  		/*
> >  		 * OK some of the range have non-guard pages mapped, zap
> > -		 * them. This leaves existing guard pages in place.
> > +		 * them. This also drops any PTE markers in the range,
> > +		 * including existing guard markers, which we reinstall on
> > +		 * the next attempt.
> >  		 */
> > -		zap_vma_range(vma, range->start, range->end - range->start);
> > +		zap_range(madv_behavior, ZAP_FLAG_DROP_MARKER);
> >  	}
>
> [Severity: Medium]
> Should zap_range() avoid setting details.reclaim_pt = true when called from
> madvise_guard_install()?
>
> When a guard installation range spans at least a full PMD and contains any
> mapped page, swap entry, or non-guard marker, zap_range() with
> ZAP_FLAG_DROP_MARKER clears every PTE in the PMD and reclaims the empty PTE
> page table via pte_free_tlb().  On the very next iteration of the loop,
> madvise_guard_install() walks the same range to install PTE_MARKER_GUARD
> entries and walk_pmd_range() has to allocate a replacement PTE page table via
> __pte_alloc() while the old table is still queued in madv_behavior->tlb.
>
> Besides the unnecessary page table teardown and reallocation, __pte_alloc()
> on the retry pass can fail with -ENOMEM under tight memory or memcg limits
> even when the PTE page tables were already allocated before the zap, leaving
> any pre-existing guard markers in the zapped range removed.

This is an edge case and doesn't matter. And fine, reallocate the PTE :) It
allows sensible sharing with the MADV_DONTNEED bits.

The ENOMEM stuff is silly, if you're going to fail there you need unreal memory
pressure + fatal signal, so failing early is right.

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261113-disallow-uffd-guard-install-v2-1-9d0063c70542@kernel.org?part=1

--
Cheers, Lorenzo
