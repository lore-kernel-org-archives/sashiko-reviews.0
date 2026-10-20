Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508911;
	b=xwUAUU1/+KQx5bEwAH0sH87pD/+VaaL/mwvcua/Kj+DV0DETqlYe7PQY8lKWj5WHAPav
	 dckx1PGzmY5gJdGKxXyvIAot+/l8Er881LlCxMU8BdeuFkABMC1BrIcVtAtPkNxrZlXn6
	 6b/lq8ZdgDVbX2hevdvBd3IRZeTlbw3EZVhYKbXEGL6Aot09kFmCAcM22ESoai30BP0dX
	 w4JpzpjRk1vKlM9WHEwhOSwZLrcytkGA03QerN7Ene9d47w4/PK9S3Lf+SAW/K7R4e4q+
	 Y8bhYlQMgJ/GuCKFaYNSxraygiONk0yzOCDmRO1UJEiMb2q05XysVrfXeE8+xTsF0lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=upgNzdzMhaDzhZp7tv2TOFefTojD7y9vaRyKOnJQ9T4=;
	b=2yMAZv4Io4fDJwhrIamXMxTYaBACw4weRFJjAvDiBJVmxLcYvzB971S4rG3fjZM2evWj
	 TfAyb8RD4tDbAx7Cavga3UCSkRVDXsbJx9/Zs/qqbdaLQuS0gKiZxSjTdSjsWAzlUpIpb
	 eRlfXSTfENDZgmlIMzcdb1nIPn9gUQC+kyeT+ecNmaC+gFvh0wDdE3B4UoYLMoXvPQUCq
	 AsAn2FhgX9m/RB59nMcQb7vopKig70Zvi7YQQpqHQBzWNp/9PQBG2/G/Niv9KOw2ioYPM
	 MY32AW5DYSLI9Ez5rJLeir8eiM1cHF6duuIACaCqGqXnJ1mqg1MaxTLmhv8Gp5tvhMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="i5/+2l+V";
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F260A2606
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 15:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 983F260A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i5/+2l+V
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c40447e25e6so386439866b.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 08:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792508909; x=1793113709; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=upgNzdzMhaDzhZp7tv2TOFefTojD7y9vaRyKOnJQ9T4=;
        b=i5/+2l+VDKTePS572L3lIW21Hkq+8HpQf3sxZ72MFMmD0mnDGdGMxG774xyoInZgV/
         7ZGASrhLndoQIda8zlH0Oo4NmqiM12IYGWHsMNK9YWctY/8V3UzorEwG62PExwWVPwqb
         jOqLkDgqar1YnUZbxXoBboFhCskv4cKENuXg0jmepVJuVWt+lbTlTftbkzO8DzBRRAku
         T8w4iQ3/ewiNxj8Dh55i3eWfjI+NdM4tqgKaGloep4a46Mx4DEdYKuj5SE/wJSZdiQQe
         invvwQ30dy/bqhOCIgU7PmTpkPHOOPQ3pDJn2WY8MeP+vu8DUZBSQynvICsEqeG74yoh
         ThFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792508909; x=1793113709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=upgNzdzMhaDzhZp7tv2TOFefTojD7y9vaRyKOnJQ9T4=;
        b=UloEuw2muWLyUqBSJw+PUvokgihFnLcx5dQ0ly9Er/LRyfAhVujqWV/8kKvsl0rX5E
         PVaTkBwT/PDPQv5bHK55ox9bbbJSzmG5qsW6de6qSG7EVoFJq1kl8nPrrTNqKN0sHIhf
         BiAcEXvJ473N156u2ltzHxq89e4sOlT+9QFKviX9StK4WD3lfHHVL/aFy6GIGqKis9Oe
         FXqodJZd8W+wiZMUQAnfqALNSmoSf5Bs8NYVCwf5tyOT2xQB8LWhoxJoDx6966nGPxWb
         l9UpsmWy2vCbyIQWFTTsh6fqJSqTJ3gkmS3UtN5eLsuJlp8RLq7nidwHgdd/TUdwTM6M
         g3Fw==
X-Forwarded-Encrypted: i=1; AKwUvBx2FjTdGY+oEyITnExoKDAwzXlufbpVai9J2jErnpBoLS6DA5wkz46NGsWbSbrPUYWjyvberF7uq9IOz6515Xo=@lists.linux.dev
X-Gm-Message-State: AFq9FYIUDzDxKvocwIQUhXaxiFqY4/XLeq5ZFg/qwYNmGuYn5zgNQOWB
	SbJqCOishpD/DlhiuORHvkMVEtJFS4w/A3T58VpC6zu2UziVW7XqsXnz
X-Gm-Gg: AYBFou2qNFZdOZXWlinimMYzk4dAZ+OC4f685Q9ECoMgp2Nbd84TgzYMpfbaHGTX8QC
	LP4RY/U86S990tZ3F9SndHx1+JCpK/ziiWJA/VXZfzq20sa+DNIw1rwsguu2iKgISP0AlLhU8ZW
	NWreSDEQlXmcFIYe06cckWImVt4iCRPN8UpazAiGM27fOZQdklHFSPldDBSxBFk5CQnhdOJEmWV
	80zWM0kwcffeBcMnmkaGFClem9ZRykxRpELWgyqvVEud8f5lgsecVVdXpapNwrqMs7jvhAIIS6i
	XuPC0O3QUZrjJ5B+PbfjO/aQaQekyMRhscnPuDrTAPK5lSZW9Cby6ARsn/QbNPjnxGnRwqwJsvy
	wrI+iedVM70YF5og5bkf2brxOqLekkCGSQoDO9oGvc86XRY4LdIbtN7chXxLDV2PpvE/4VBVMuG
	EPSdahB2RtAN9+ZGnMcvr5
X-Received: by 2002:a17:907:d006:b0:c31:8c7c:391b with SMTP id a640c23a62f3a-c419df3e670mr791034266b.13.1792508908559;
        Tue, 20 Oct 2026 08:08:28 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ceffesm491058166b.47.2026.10.20.08.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:08:28 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 20 Oct 2026 17:08:25 +0200
To: Hao Ge <hao.ge@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>,
	Uladzislau Rezki <urezki@gmail.com>, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, sashiko-reviews@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Subject: Re: [PATCH v2 3/5] mm/vmalloc: undo partial mappings inside the
 mapping functions
Message-ID: <ateD6VVhyiUAtsER@milan>
References: <20261019054531.87652-1-hao.ge@linux.dev>
 <20261019054531.87652-4-hao.ge@linux.dev>
 <sashiko-outbox-178439@kernel.org>
 <2b83dfaa-424b-4464-830e-a7714a816d5c@linux.dev>
 <d1ed2d7f-3999-4e8a-a290-1f812a0439af@linux.dev>
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
In-Reply-To: <d1ed2d7f-3999-4e8a-a290-1f812a0439af@linux.dev>

On Tue, Oct 20, 2026 at 09:27:14PM +0800, Hao Ge wrote:
> 
> On 10/20/26 18:03, Hao Ge wrote:
> > Hi Suren and Ulad
> > 
> > Sashiko reported several issues, and they all look real.
> > I have some ideas for fixing the first few;
> > of course, please correct me if I get anything wrong.
> > 
> > I'd like to discuss the last issue with you all.
> > 
> > 
> > On 2026/10/20 13:45, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > > - [High] mm/vmalloc: infinite loop in vunmap_pte_range() on unaligned error rollback
> > > - [High] mm/vmalloc: __vmap_pages_range_noflush() calls cond_resched() in atomic context
> > > - [Medium] mm/vmalloc: vmap_page_range() calls flush_cache_vmap() before error rollback
> > > --
> > > 
> > > commit 043026437ba63b051df5d14470fe69ce8fa8825c
> > > Author: Hao Ge <hao.ge@linux.dev>
> > > 
> > > mm/vmalloc: undo partial mappings inside the mapping functions
> > > 
> > > This commit adds rollback logic using __vunmap_range_noflush() and
> > > kmsan_vunmap_range_noflush() into vmap_page_range(),
> > > __vmap_pages_range_noflush(), and vmap_pages_range_noflush() when page
> > > table installation or KMSAN metadata setup fails. It also adds range and
> > > page_shift validation in __vmap_pages_range_noflush().
> > > 
> > > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > > index 44e0eb32708f1..75aa5acf55660 100644
> > > > --- a/mm/vmalloc.c
> > > > +++ b/mm/vmalloc.c
> > > > @@ -363,6 +363,9 @@ int vmap_page_range(unsigned long addr, unsigned long end,
> > > >   	if (!err)
> > > >   		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
> > > >   					       ioremap_max_page_shift);
> > > > +	if (err)
> > > > +		__vunmap_range_noflush(addr, end);
> > > > +
> > > >   	return err;
> > > >   }
> > > [Severity: High]
> > > What happens here when vmap_range_noflush() returns -EINVAL for a range
> > > where end - addr is not PAGE_SIZE-aligned?
> > > 
> > > In vmap_pte_range(), commit a739e6b557af09 added a check to bail out on
> > > unaligned ranges specifically to avoid an infinite loop:
> > > 
> > > mm/vmalloc.c:vmap_pte_range() {
> > > 	...
> > > 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> > > 		return -EINVAL;
> > > }
> > > 
> > > This can be reached on 64KB page kernels via pci_remap_iospace() ->
> > > vmap_page_range() with 16KB/32KB/48KB PCI I/O ranges (for example via
> > > loongson_pci_probe() or acpi_pci_root_remap_iospace()).
> > > 
> > > When vmap_pte_range() returns -EINVAL, vmap_page_range() now calls
> > > __vunmap_range_noflush(addr, end) with the unaligned range. Whenever a PMD
> > > in [addr, end) is already populated with a PTE table (such as the
> > > PCI_IOBASE PMD populated during early boot by reserve_pio_range(), or an
> > > earlier PMD mapped in the same call), __vunmap_range_noflush() descends
> > > into vunmap_pte_range(), which has no alignment check:
> > > 
> > > mm/vmalloc.c:vunmap_pte_range() {
> > > 	...
> > > 	do {
> > > 		...
> > > 			ptent = ptep_get_and_clear(&init_mm, addr, pte);
> > > 		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
> > > 	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
> > > }
> > > 
> > > Because end - addr is not a multiple of PAGE_SIZE, won't addr step past end
> > > and loop infinitely, clearing unrelated kernel PTEs and corrupting memory
> > > past the PTE table?
> > > 
> > That sounds reasonable. I will add a separate patch in the next version to fix
> > this problem.
> > 
> > > [Severity: Medium]
> > > Also in vmap_page_range(), flush_cache_vmap(addr, end) is called
> > > unconditionally before checking err and before rolling back with
> > > __vunmap_range_noflush(addr, end):
> > > 
> > > mm/vmalloc.c:vmap_page_range() {
> > > 	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
> > > 				 ioremap_max_page_shift);
> > > 	flush_cache_vmap(addr, end);
> > > 	if (!err)
> > > 		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
> > > 					       ioremap_max_page_shift);
> > > 	if (err)
> > > 		__vunmap_range_noflush(addr, end);
> > > 
> > > 	return err;
> > > }
> > > 
> > > On UML, flush_cache_vmap is defined as flush_tlb_kernel_range:
> > > 
> > > arch/um/include/asm/cacheflush.h:
> > > #define flush_cache_vmap flush_tlb_kernel_range
> > > 
> > > When vmap_range_noflush() fails partway through or
> > > kmsan_ioremap_page_range() fails, flush_cache_vmap() runs while the
> > > partially installed PTEs are still pte_present(), causing
> > > update_pte_range() in arch/um/kernel/tlb.c to map them into the host OS via
> > > ops->mmap() and clear _PAGE_NEEDSYNC:
> > > 
> > > arch/um/kernel/tlb.c:update_pte_range() {
> > > 	...
> > > 		if (pte_present(*pte)) {
> > > 			...
> > > 			ret = ops->mmap(ops->mm_idp, addr, PAGE_SIZE,
> > > 					prot, fd, offset);
> > > 		} else
> > > 			ret = ops->unmap(ops->mm_idp, addr, PAGE_SIZE);
> > > 
> > > 		*pte = pte_mkuptodate(*pte);
> > > }
> > > 
> > > When __vunmap_range_noflush(addr, end) then clears the software PTEs
> > > without a subsequent TLB flush or unmap notification, won't those host OS
> > > mmap mappings be left behind? Should flush_cache_vmap(addr, end) only be
> > > called after both vmap_range_noflush() and kmsan_ioremap_page_range()
> > > succeed?
> > > 
> > That sounds reasonable. I will add this logic in the next version.
> > 
> > > > @@ -683,27 +686,35 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> > > >   		pgprot_t prot, struct page **pages, unsigned int page_shift)
> > > >   {
> > > >   	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> > > > +	unsigned long start = addr;
> > > > +	int err = 0;
> > > > +
> > > > +	if (WARN_ON_ONCE(addr >= end))
> > > > +		return -EINVAL;
> > > >   	if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
> > > >   		return -EINVAL;
> > > >   	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > > > -			page_shift == PAGE_SHIFT)
> > > > -		return vmap_small_pages_range_noflush(addr, end, prot, pages);
> > > > -
> > > > -	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> > > > -		int err;
> > > > -
> > > > -		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> > > > +			page_shift == PAGE_SHIFT) {
> > > > +		err = vmap_small_pages_range_noflush(addr, end, prot, pages);
> > > > +	} else {
> > > > +		for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> > > > +			err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> > > >   					page_to_phys(pages[i]), prot,
> > > >   					page_shift);
> > > > -		if (err)
> > > > -			return err;
> > > > +			if (err)
> > > > +				break;
> > > > -		addr += 1UL << page_shift;
> > > > +			addr += 1UL << page_shift;
> > > > +		}
> > > >   	}
> > > > -	return 0;
> > > > +	/* Undo the PTEs installed before the failure. */
> > > > +	if (err)
> > > > +		__vunmap_range_noflush(start, end);
> > > > +
> > > > +	return err;
> > > >   }
> > > [Severity: High]
> > > Similarly here, __vmap_pages_range_noflush() checks addr >= end, but does
> > > not check PAGE_ALIGNED(addr) or PAGE_ALIGNED(end).
> > > 
> > > If a caller passes a sub-page or unaligned range (for example, 0 < end -
> > > addr < PAGE_SIZE), nr = (end - addr) >> PAGE_SHIFT evaluates to 0, so the
> > > huge-page path still maps nothing and returns 0, while the small-page path
> > > loops infinitely in vmap_pages_pte_range(). And if the huge-page path fails
> > > on an unaligned range, __vunmap_range_noflush(start, end) will hit the same
> > > infinite loop in vunmap_pte_range().
> > > 
> > > Should both vmap_page_range() and __vmap_pages_range_noflush() validate
> > > PAGE_ALIGNED(addr) && PAGE_ALIGNED(end) upfront before attempting to map or
> > > unmap?
> > > 
> > I think We need to check both PAGE_ALIGNED(addr) and PAGE_ALIGNED(end).
> > As an example: if addr is PAGE-aligned, end is not, and end - addr < PAGE_SIZE,
> > then nr becomes zero. On the huge page path, we simply return 0 with no work performed.
> > 
> > At the same time, vmap_pages_pte_range() needs the same guard as commit
> > a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not PAGE_SIZE aligned"),
> > to protect against unaligned ranges.
> > 
> > So will do next version.
> > 
> > > >   int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> > > > @@ -715,7 +726,16 @@ int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> > > >   	if (ret)
> > > >   		return ret;
> > > > -	return __vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
> > > > +
> > > > +	ret = __vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
> > > > +	/*
> > > > +	 * The page tables undo themselves on failure. Tear down the
> > > > +	 * metadata that was fully set up before the mapping failed.
> > > > +	 */
> > > > +	if (ret)
> > > > +		kmsan_vunmap_range_noflush(addr, end);
> > > > +
> > > > +	return ret;
> > > >   }
> > > [Severity: High]
> > > Can calling __vunmap_range_noflush() and kmsan_vunmap_range_noflush() here
> > > trigger a sleeping-in-atomic-context bug when __vmalloc() or kvmalloc() is
> > > called with GFP_ATOMIC or GFP_NOWAIT?
> > > 
> > > __vmalloc_area_node() supports non-blocking allocations by wrapping
> > > __vmap_pages_range() in memalloc_apply_gfp_scope(gfp_mask):
> > > 
> > > mm/vmalloc.c:__vmalloc_area_node() {
> > > 	...
> > > 	flags = memalloc_apply_gfp_scope(gfp_mask);
> > > 	do {
> > > 		ret = __vmap_pages_range(addr, addr + size, prot, area->pages,
> > > 				page_shift, nested_gfp);
> > > 	} while ((gfp_mask & __GFP_NOFAIL) && (ret < 0));
> > > 	memalloc_restore_gfp_scope(flags);
> > > }
> > > 
> > > When a GFP_ATOMIC or GFP_NOWAIT allocation runs in atomic context (such as
> > > under a spinlock, preempt_disable(), or rcu_read_lock()) and page table
> > > allocation fails in vmap_small_pages_range_noflush() after at least one PMD
> > > in [start, end) is populated (or after kmsan_vmap_pages_range_noflush()
> > > populated the KMSAN shadow/origin ranges), __vmap_pages_range_noflush() and
> > > kmsan_vunmap_range_noflush() synchronously call __vunmap_range_noflush().
> > > 
> > > __vunmap_range_noflush() walks the populated PMDs via vunmap_pmd_range(),
> > > which unconditionally calls cond_resched():
> > > 
> > > mm/vmalloc.c:vunmap_pmd_range() {
> > > 	...
> > > 	do {
> > > 		next = pmd_addr_end(addr, end);
> > > 		if (pmd_none_or_clear_bad(pmd))
> > > 			continue;
> > > 		vunmap_pte_range(pmd, addr, next, mask);
> > > 
> > > 		cond_resched();
> > > 	} while (pmd++, addr = next, addr != end);
> > > }
> > > 
> > > Commit 9c47753167a6 ("mm/vmalloc: defer freeing partly initialized
> > > vm_struct") deferred error-path cleanup in __vmalloc_area_node() to a
> > > workqueue specifically because unmapping on failure can sleep. Doesn't
> > > calling __vunmap_range_noflush() synchronously inside
> > > __vmap_pages_range_noflush() and vmap_pages_range_noflush() reintroduce
> > > cond_resched() in atomic context?
> > > 
> > This issue also appears real. One possible approach is to plumb the caller's gfp_mask into vunmap_pmd_range()
> > to conditionally skip cond_resched().
> > Suren, Ulad, do you have any preferred or cleaner way to handle this?
> 
> 
> Alternatively, we can follow the approach from commit 9c47753167a6
> ("mm/vmalloc: defer freeing partly initialized vm_struct"):
> 
> defer the cleanup to a workqueue when |gfp_mask| has GFP_ATOMIC or
> GFP_NOWAIT，and perform cleanup synchronously
> 
> if we are already in process context. Anyway, I will look into this further
> tomorrow.
> 
I will check the AI concern.

--
Uladzislau Rezki
