Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793923534;
	b=NuiMPKsRWq0HPZKchwS0IHFjYupUSnDolBxRKeLDk0+CE8lU+oVo0YCQNh+iI52Wanst
	 +pBBUheC4ycCB6nJ/HrvElJnVLbpptTJ6PS+8VibB9+QYLcnUdOm1tOwktb+oLPNktEao
	 7XPhTl8+24Nc4iK2t5R/Gj6B5gjY0xW0HGS4q+C0L68UkrRcyM8XgIHYSm2TPuSKgFmjj
	 YyRTgvl+zV+9K5B6sSfgAtL8G6RyohqZDYPfdgfFuMX97jhouwbFsORcqYMgygoPR5ABj
	 3dleMUX8B551Q2BQKEStF+57PfjTTjXY5f/2YautRH9fUG0DpgREeyt+Ne1UZyjTKeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=zGe6RH8jO1PkEqlKrUq+hUFFk2bxgmP97XnZ5LF8Xyk=;
	b=nF8I9bTcx8E5Lev314nJJhofg4ik1+4Ye7lKZRsQj+AgnLKbEaFLYcHr4VWX7hhQectj
	 Wiqcz3OxWDPlJhx/LacYV2Dz5yUEZs/d6bYUqMfwxv3UMGRcSSgR80s6yuXYL5FlG0qmc
	 Er6hjl4uiLyKjGMWRHj1VgCLSCmRxRW2AYKQnTwQX2YlirCDa1pNw2U603tXugb3aR3aU
	 PhiM+5BfXiArXI/SSOaxm/WjIFIFAfVdK2CatKVu2RScp9+LndHwsycPeH8gCYEvJDJiG
	 dujAGj1f0ovcPn785yvIyMw6xgUoaV1y1aetaRD3KgoKfGrXnCrx6ewyzOrEN/RHcgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0NrRtpke;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D246606A31B
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 00:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D246606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0NrRtpke
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso41489f8f.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 16:05:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793923533; cv=none;
        d=google.com; s=arc-20260327;
        b=s5/zGF9hSdA+4uYqZZfS4KHJSeQ74Lsz/9HAgdRjpGuDo1HD1CeWepfGuP0P6VgiXZ
         YLgPJBRiEr8j/0AkS9saQR315N7uh84Z84Pin+26KXkozqHUGkujRNgTeRkHVrHY8Zws
         d6oynH+qkhnI1Tg/kqCrL3cfNswy0sU5hygzTfkq2H+Z0rq6Af9jiiDDNw+G4ydROVWp
         4oGkgDQB0V5JzoamO68Eq1u7yr+E+FiM3lStlu+ySz6yiWOcsX298mdjJAWNDBSeGrnN
         UQqNmdlgzAMPIO3IJDahVGUXFJPOvMwlEIX5/Fw9/FE8MzyY31lGB1Hgp2y6D8H0Pqfl
         F63A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zGe6RH8jO1PkEqlKrUq+hUFFk2bxgmP97XnZ5LF8Xyk=;
        fh=57ntETqkzVNGTYOofHBcbIIolOLV28T5rW6LiQPOum8=;
        b=IN8KCiFwZlOjbrx/Oo8QbNgW1UM8MZJA5rEFG+gAUd0e2jT7ueIFLpM6iPtOeJmz6s
         dw3Wow5fqZSs6fhNMr3zBZhbqiFt5XhDDqrv2P2EahyeRPSQbiBxK+MjlRX2R3olBZm8
         ZAisYTKBg70/0xpHcOHC8j1CWL/XIhjohsxMXw3G8axP2l5CIRVyQg85m6Ney2OZIAcM
         KPC1jiRqQBWwStPr6GypPA01Ihp03V0FWpbfmVT+bTEODwjLqkFC3/Cfwfdn1n6eibke
         PQ7/Fy+Z0RsGk3D5D8wxV9TwOQ8enpwhHd5Ata9iVVkfyW8oc4reouvatTHDS541zsPi
         bRBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923533; x=1794528333; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zGe6RH8jO1PkEqlKrUq+hUFFk2bxgmP97XnZ5LF8Xyk=;
        b=0NrRtpkeumpKjqFuyQt40aza3WWwlifQL44iI0ieHyqyU3Md4twicFndUrSdnIKM8G
         aUUMJ/8gsHdbLafzd0OyMVbyi7qJ14yXK8n0K53yXi5DUC/z8pkzXcx1fQzTxDweHsuX
         ZqjOcdh/feqMQ68dhp0d3sGf4lySVkxK32s7xtkwsZZUtlZThFJVj54ywaBnu5CqAztt
         hYzB1KK0524QGYlzHIbibtkbIBslUFt51Mq0mpgoIYZtAbgN4q8VFDEqyNBdD2D8EzIY
         x/mFwNi1UL2BwOusnB6NDCNCqjXUEMzdruKZVg5B+fuUUKRSHtZzt2rX0h07eQ7lRdR8
         deDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923533; x=1794528333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGe6RH8jO1PkEqlKrUq+hUFFk2bxgmP97XnZ5LF8Xyk=;
        b=kxOuSMfi/uC2oAGI4IJ5pPBWswM37VqDGyboomLow2SDroQcvjbTGxiv+iOJS20Ec/
         OHwKu75UoTPnv8FrheMJ1OCiZ1iSkXy881zd/MrEHG9kfZyEr//epm3myZoLxkmAroc5
         e8hAIUUnqtUp31cjCe11RkrmmyOBBPj3VGeJ0m8EyTf0ZO0QU6THfV2Oj8LGZtlhXBeN
         PHK5yfwImv86yxcXipR+VWyyl3RFHALFro9MLoyUv78W9omWFYMqBNyMFOwiihBS2Gzv
         FXsKUOVBQEUU9mXEjNWNAqBPr6VqIrjV4+3FKHmNZaG7qun1xZapgQ2RZ1dnd7CavASX
         QR0Q==
X-Gm-Message-State: APuU4Z/hyBSEmJdn73d29lmhU0RqPlvfFf8JUOrAFIsfM5rg/S0wm3yu
	P9/DouG4j9eiW/8E44DZEpofIYlJjcK80eYBdApJ3BZDLbaFaysdJZsMmOG8NvmfnBVZxg5GkkD
	EZzVWAWjM+voWpey6wBYc6HSDNh5RE2w=
X-Gm-Gg: AYBFou1nW64OnQv9AVlNzCZUkDzV/s7s5A8NaOG0Swfv3RZjiMYVkDbwPYX5jakkMAK
	vhdNFCEaU7HOswwDGAtFZ3GRbGNhhHXCW2XeLkCDtfarjwxCHavbanfo/2kj1V2sDeFtkPaxWcG
	tG49vDcNwKr3z41gvgKohXopQZGhOXABDOLlyrygIUi3uZgWCBvjFS7Qrp4fpx2iBth9clob28x
	evEjVrWLnLURh1zDlwvf29m9TttoD3yRZQZsRPQd73YG9e9ceo3WEeBdzKPxCzuAoVbh7rmdXjW
	o7VlSoDUDNVRqx7TBoY158Qe/YCdJZavvsU9HRJ4J8siz1dPzl4FejPq4e468a/sS2oSw5H+hRC
	9BDCps9tRIF0LK9+2fwgnEmW+DUmWJjsDNYS3lhJiS+sBME5jZK6G7l9uA5JHTcNd8UK8EMN27d
	t6iLXYbcmyXiqOoSfZoA==
X-Received: by 2002:a05:6000:4819:b0:48e:75a1:1e38 with SMTP id
 ffacd0b85a97d-492784555f4mr2086202f8f.56.1793923532544; Thu, 05 Nov 2026
 16:05:32 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103212004.1356327-1-joannelkoong@gmail.com>
 <20261103212004.1356327-5-joannelkoong@gmail.com> <sashiko-outbox-198104@kernel.org>
 <CAJnrk1auD1u1J0yQrXOeJrxvVsQfbxYf+nsMS-9qFQ0hfchG-w@mail.gmail.com> <aux4FcaEdTrJ60NR@thinkstation>
In-Reply-To: <aux4FcaEdTrJ60NR@thinkstation>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 5 Nov 2026 16:05:19 -0800
X-Gm-Features: AclHuK_favFgX046LpM4Y2ghwoXnBoevU1JO2s_bhvQczk_tdcYOmudpHFcbITU
Message-ID: <CAJnrk1Za6=B=Y3HOaJjhU7orq_P27QFe92_n9F2y2+108xDSOA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] mm: add anonymous mTHP folios to the deferred
 split list
To: Kiryl Shutsemau <kas@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org, 
	david@kernel.org, ljs@kernel.org, baohua@kernel.org, usama.arif@linux.dev, 
	hannes@cmpxchg.org, alex@ghiti.fr, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	willy@infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:37=E2=80=AFAM Kiryl Shutsemau <kas@kernel.org> wro=
te:
>
> On Wed, Nov 04, 2026 at 03:50:58PM -0800, Joanne Koong wrote:
> > On Wed, Nov 4, 2026 at 1:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> > >
> > > Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> > > - [High] mm: try_to_migrate_one() triggers deferred_split_folio() on =
underused mTHP
> > > --
> >
> > Hi Sashiko,
> >
> > I'll try to address these points below.
> >
> > >
> > > commit 82b7b7063b986d802fe52e75e17211e58f3f420c
> > > Author: Joanne Koong <joannelkoong@gmail.com>
> > >
> > > mm: add anonymous mTHP folios to the deferred split list
> > >
> > > This commit queues newly mapped anonymous mTHP folios of at least 2M =
onto the
> > > deferred split list in map_anon_folio_pte_nopf() so that underused mT=
HP folios
> > > can be split by the deferred split shrinker under memory pressure.
> > >
> > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > index 0c9ed04528d88..44376321180b5 100644
> > > > --- a/mm/memory.c
> > > > +++ b/mm/memory.c
> > > > @@ -5477,6 +5477,8 @@ void map_anon_folio_pte_nopf(struct folio *fo=
lio, pte_t *pte,
> > > >       folio_add_lru_vma(folio, vma);
> > > >       set_ptes(vma->vm_mm, addr, pte, entry, nr_pages);
> > > >       update_mmu_cache_range(NULL, vma, addr, pte, nr_pages);
> > > > +     if (folio_test_large(folio))
> > > > +             deferred_split_folio(folio, false);
> > > >  }
> > >
> > > [Severity: High]
> > > When deferred_split_scan() splits an underused PTE-mapped mTHP folio =
queued
> > > here with PG_partially_mapped left clear, doesn't unmap_folio() trigg=
er a
> > > false-positive deferred_split_folio(folio, true) transition during th=
e split?
> >
> > Yes, but I don't think this is specific to this series. Splitting any
> > PTE-mapped anon large folio that isn't already marked partially mapped
> > goes through the try_to_migrate_one() -> folio_remove_rmap_pte() path
> > you describe below, where __folio_remove_rmap() requeues it as
> > partially mapped mid-split. That already happens today (eg underused
> > splits of PMD THPs whose PMD has been split). This series makes it
> > more frequent since underused mTHP splits now take that path too, but
> > this issue is pre-existing.
>
> I think it is a bit of understatement.
>
> For mTHP it is every underused split: the folio is always PTE-mapped and
> try_to_migrate_one() drops one PTE at a time. Each underused split bumps
> split_deferred for that size next to the new split_underused, and a split
> that fails at folio_ref_freeze() leaves a fully mapped folio flagged
> partially mapped on the queue, which the next scan splits without
> calling thp_underused().
>
> Can the fix go in before this series? I think it is hard requirement.
> Let's not brush if off as pre-existing.
>

Sounds good, I am looking into this and will submit a fix separately.

Thanks,
Joanne
