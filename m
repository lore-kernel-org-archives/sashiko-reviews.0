Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882267;
	b=pswfgvJxzlcGZhwxIIKjcgv4ACTlQLW1EuDDSBxftNHjZzfFRztuyrJthSVkinIsuPbi
	 YKUMvnuz+eOOf9/iIS+x93PQ0aY7RYdY88/bbFJM4PXNau3dGJuu6Aobs5MLAyhebzVhP
	 WYnrSm6aapEmcrkhpeAYdpyYLttQ0hkv2KEuo2nQbBRLvdabnUO8IKPJt8Z4hPX90oTu7
	 BvK0Y1Z0flLnIAlzbN5TmEcSqjRloQDNUpRwf+WqKDcV94S4QSSgzIm2sDnYtMnvAA1eY
	 BakoOueGlX0ya401iffZC9g0JchzsL+ROVE1Lg7BWG7H+lMSbwBPva4+lOk6I8b1R8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882267;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=6NWrhtkA+nf836kZhtN+FQ8fIUYc2L2nWz3fs/cJ8/M=;
	b=nxd7JfAnIw9L3JVx9JUMIzusG1Dk9MB8SVRRzj0J369IXsM0NpFLrdGVk66wKCBEQjcb
	 KM7OGQjJc5nkHiyPgub651QoKBzSV+oVG2T/ZIWmPxzZMTFPgHgIZKfDJxJ+Uz/W6SoR2
	 ZmLrfVkXKEpOLJMRudLEIwQ0F5AeAPnzgHlGUoJtW0J4I6AC24p8SBAgg2Izy2hb71FKY
	 IHJFNIOqguJ0n/XkWOxhJ3X4G9bwJitX9h+Ce50OsKw2y4obv+OQB60WpLUWmt7SzwFl/
	 nCy/joQ6h0JeMOCyzOtR+eIIywjyOsTb536UxZxo/0L4c5GFG/pcFISZLvRUgaPUsUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HWfFJWN9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C91A606A326
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 12:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HWfFJWN9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10B71F000C1;
	Thu,  5 Nov 2026 12:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793882267;
	bh=6NWrhtkA+nf836kZhtN+FQ8fIUYc2L2nWz3fs/cJ8/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HWfFJWN9i229bMd4UY7/BUsWWnpEJ75fa+tM0gHJmgK7tmL5sfGwkNSS3Sl17g8yS
	 dTVVl51P1o6sHZSeb4JPG8BqcuTysly3E2WQrxN61GyXo1lcIDNYxn0ZTgBZ/3Etdh
	 BotXqRe7M1CWKpul3g4h7BZUauGqvALcOxFyia3Gg5JagYed5SaGQSDQjw6Lj+BuUd
	 nTr0Nw683p41I/Nhim3bspIK5MOLUKf/3BR4hMcuNg0IFXux9S4tk/wxYNkF2DGDU9
	 oF53seRsSoQ04qgO/9/hsqknTN39pWqShlI1/h0u18NQb+NXX0Gmcv2vjzQSvSjfTl
	 ROOEdCYWv9a7g==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id F1A4D1980052;
	Thu,  5 Nov 2026 07:37:40 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 05 Nov 2026 07:37:44 -0500
X-ME-Sender: <xms:lHjsalvO8ZP8wgZjNh60XmuJQ40IAtZ5GOhqVObxvRMA7SXmJQajNQ>
    <xme:lHjsaqpK40X7pDFhoe9WbgRcG6oXPuYyd_DgH__-og5aV0izpIPYL1zK3fPeePPVh
    8L_1SnpgZduxsxqP50RXBf2o5CcwPJrYuI9QWEymIapR9taJEVuUABf>
X-ME-Received: <xmr:lHjsav7sYzyg-LfEFvsvgqHgC6gLFqDHslEsMC9jMpbvS5ylyb5KT6wYHr0>
X-ME-Proxy-Cause: dmFkZTFm9V5eJ+Rbf9jRmTYNKjzKU9cJBRCqvz8P1pvqtvpzSkaNDECvFL/BmhNntuB1Pq
    TcyC5G1gfJbucZjwqubwBtX4ao1ysLN7tdGdl8KXwAcNl0scpNLDBr2Xz3iZ5CS5TfZ7Fm
    P/scGp+wgBs4GjuuT10pms65wdnrFh7YIOrbwvuVOUU7+RS9TkFlrEuS217klAtEqRNoDf
    nCaxZv9yO0/oNxLEc7sd077SPYzdPIS1XVontV71Aw8tGJjDGwstaTLB22HKKusyI32zI5
    4Oe+7JzlkOZGGdi0aoM9dEG+8w5KSsumiOXRvnNc/9Dv+9cGH+jmA64vXXSn+73daPMkN+
    ZacUAEab5/jMk62gih6GTtTUR0qq35c4MeelDQhemrbuw1wqS1QpiBvr4CvW3szIMVwLnd
    9qZi5ZabFMkfk/O9BcJLjiiMAZ+bniYmErekVG9YBzdXwCz9bP3W64OugMiXh/yG7bHAL1
    gx1vf7Dn8hnyXFtsDfg6Op3csDWfS1fmn0HuOVaywdPzFRsrfBJ9u8kCV/3S5jDhGDvBaJ
    OSVTbwJxLPXwVpliz+/+rFmcoPTKmShlonuTx9stHEztJAFa9FU67CjRx0mwlg4j13SUiF
    KohkZr79wkgYOBXeX9e3ZbMGG9wrlPcRCySHQSqYsj6uXwbtA9M4nt9Yi3mg
X-ME-Proxy: <xmx:lHjsanx-Kyr3x-d0v022zvdwnIAWLMJAQa48j-Kr4StgVj5GrKc7VQ>
    <xmx:lHjsanTi6wvZxUcRkGXcXL8vAXu2-2A8lEMHN7TzjuGiHL_ObvsQCw>
    <xmx:lHjsah95kI1TGJC2L4Da3s3KnWibK5Uprn-mpquLghT8g6Yik31u5Q>
    <xmx:lHjsahGf1jpmzFexAN9kVECV0IHa7nHZ1rUSsPa8JwBq8U4m8jnZIQ>
    <xmx:lHjsaswCX1HeVow4OW3tB3HqaCi003akD_TxPxOyBEkHo9lBXO3kCjZ2>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 07:37:39 -0500 (EST)
Date: Thu, 5 Nov 2026 12:37:39 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org, 
	david@kernel.org, ljs@kernel.org, baohua@kernel.org, usama.arif@linux.dev, 
	hannes@cmpxchg.org, alex@ghiti.fr, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	lance.yang@linux.dev, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, willy@infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 4/4] mm: add anonymous mTHP folios to the deferred
 split list
Message-ID: <aux4FcaEdTrJ60NR@thinkstation>
References: <20261103212004.1356327-1-joannelkoong@gmail.com>
 <20261103212004.1356327-5-joannelkoong@gmail.com>
 <sashiko-outbox-198104@kernel.org>
 <CAJnrk1auD1u1J0yQrXOeJrxvVsQfbxYf+nsMS-9qFQ0hfchG-w@mail.gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJnrk1auD1u1J0yQrXOeJrxvVsQfbxYf+nsMS-9qFQ0hfchG-w@mail.gmail.com>

On Wed, Nov 04, 2026 at 03:50:58PM -0800, Joanne Koong wrote:
> On Wed, Nov 4, 2026 at 1:21 PM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] mm: try_to_migrate_one() triggers deferred_split_folio() on underused mTHP
> > --
> 
> Hi Sashiko,
> 
> I'll try to address these points below.
> 
> >
> > commit 82b7b7063b986d802fe52e75e17211e58f3f420c
> > Author: Joanne Koong <joannelkoong@gmail.com>
> >
> > mm: add anonymous mTHP folios to the deferred split list
> >
> > This commit queues newly mapped anonymous mTHP folios of at least 2M onto the
> > deferred split list in map_anon_folio_pte_nopf() so that underused mTHP folios
> > can be split by the deferred split shrinker under memory pressure.
> >
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 0c9ed04528d88..44376321180b5 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -5477,6 +5477,8 @@ void map_anon_folio_pte_nopf(struct folio *folio, pte_t *pte,
> > >       folio_add_lru_vma(folio, vma);
> > >       set_ptes(vma->vm_mm, addr, pte, entry, nr_pages);
> > >       update_mmu_cache_range(NULL, vma, addr, pte, nr_pages);
> > > +     if (folio_test_large(folio))
> > > +             deferred_split_folio(folio, false);
> > >  }
> >
> > [Severity: High]
> > When deferred_split_scan() splits an underused PTE-mapped mTHP folio queued
> > here with PG_partially_mapped left clear, doesn't unmap_folio() trigger a
> > false-positive deferred_split_folio(folio, true) transition during the split?
> 
> Yes, but I don't think this is specific to this series. Splitting any
> PTE-mapped anon large folio that isn't already marked partially mapped
> goes through the try_to_migrate_one() -> folio_remove_rmap_pte() path
> you describe below, where __folio_remove_rmap() requeues it as
> partially mapped mid-split. That already happens today (eg underused
> splits of PMD THPs whose PMD has been split). This series makes it
> more frequent since underused mTHP splits now take that path too, but
> this issue is pre-existing.

I think it is a bit of understatement.

For mTHP it is every underused split: the folio is always PTE-mapped and
try_to_migrate_one() drops one PTE at a time. Each underused split bumps
split_deferred for that size next to the new split_underused, and a split
that fails at folio_ref_freeze() leaves a fully mapped folio flagged
partially mapped on the queue, which the next scan splits without
calling thp_underused().

Can the fix go in before this series? I think it is hard requirement.
Let's not brush if off as pre-existing.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
