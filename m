Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502846;
	b=gw9my0wnrt5fVuFTw0pwH2YkcLqXdBUnq8ham6iTAspkBIIAADKP2jtoF8EP38Vzwt1S
	 N7BFeAGgiK+XjxBcSpbpgtqMhrg8JRGr5ZPG9vPh+Jhpboul1G96cU+ei9mxaJwq9RIG8
	 4WmrnK4JfW5Fn8UcW2TOkwJ/85/h4Ql/ubs/qBXtXaBGLJoxPoFydl+MHzQyT7PdrXoos
	 PJ+gbtJ8hygnPlhPLdJ+XROEkVUt61sboaIN4apOh9IUegPEzOaVWirwQmLXpJOz5ifZ+
	 ma0sM7H0iTTVoKB8XX6hdY3lefiGEgWScNmXG1I47LoXGgnbyz4P/Y9MPUxo/j4Rq+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502846;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9bNG+O9Mhp5lbrx3BoQ1xdHs39VYHKNeq+AtKI/tfWM=;
	b=pOoPVMqkgpv2Wo8OpYmMBgiCfGJm25Q6QJDkbDausoNM0LFFo3BjaOHwJoyleTE4P3SN
	 aJgbt5gGtLXHcA5pSlxo9KMgYYH+0TtV1xomLAoAv2hVsVP1S/cuw2I8mHX+hxSIVmuZa
	 8e4ZAX8TPilw5c50AYVdCE/XqP6Rv3FpCu7OrRZoc0SM8vZp5d19KwaSdYM2Fm5jQWZtZ
	 cmz0HWhX75hrAigTj5tyUld5woVN95Bo11Htcg5qgOgKvz3MDTaQ58UD35daGJQcW6xyt
	 wHKC/Qy8RtZ19VOybnj5exkwkzqDLAAyPkc7ZhNjXVd1MrkIUu6L10G/qCgRxReK+Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ohGJq1yY;
	arc=none smtp.remote-ip=91.218.175.95
Received: from mta0.migadu.com (out-95.mta0.migadu.com [91.218.175.95])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D63E606A31D
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 13:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D63E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ohGJq1yY
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=5Im6iM6caI5rF/Q5XPuIhrDe6ukl0oG+vIfDRIVnGjs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792502844; v=1; x=1793107644;
 b=ohGJq1yYXh3Edm35qT/oqoAHcoqkXYAMscQM2nZQZnO608FoRCGVnUr7WJfF9LnFJr2wrp2X
 EoAKPMc1n9cLoqfmdlnX5xsm4JrKDZ8FQkwbI09CgrZBm4OjUl+xNCULk7l+HfM3K1QmHkL4ZHf
 wwzX4Q28kFsfEXxCQL2ZwUBs=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id e3f5c746065a4e9d;
	Tue, 20 Oct 2026 13:27:23 +0000
X-Mizu-Trace-ID: e3f5c746065a4e9d
X-Migadu-Flow: FLOW_OUT
Message-ID: <d1ed2d7f-3999-4e8a-a290-1f812a0439af@linux.dev>
Date: Tue, 20 Oct 2026 21:27:14 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] mm/vmalloc: undo partial mappings inside the
 mapping functions
From: Hao Ge <hao.ge@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org,
 sashiko-reviews@lists.linux.dev, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>
References: <20261019054531.87652-1-hao.ge@linux.dev>
 <20261019054531.87652-4-hao.ge@linux.dev> <sashiko-outbox-178439@kernel.org>
 <2b83dfaa-424b-4464-830e-a7714a816d5c@linux.dev>
Content-Language: en-US
In-Reply-To: <2b83dfaa-424b-4464-830e-a7714a816d5c@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/20/26 18:03, Hao Ge wrote:
> Hi Suren and Ulad
>
> Sashiko reported several issues, and they all look real.
> I have some ideas for fixing the first few;
> of course, please correct me if I get anything wrong.
>
> I'd like to discuss the last issue with you all.
>
>
> On 2026/10/20 13:45, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>> - [High] mm/vmalloc: infinite loop in vunmap_pte_range() on unaligned error rollback
>> - [High] mm/vmalloc: __vmap_pages_range_noflush() calls cond_resched() in atomic context
>> - [Medium] mm/vmalloc: vmap_page_range() calls flush_cache_vmap() before error rollback
>> --
>>
>> commit 043026437ba63b051df5d14470fe69ce8fa8825c
>> Author: Hao Ge <hao.ge@linux.dev>
>>
>> mm/vmalloc: undo partial mappings inside the mapping functions
>>
>> This commit adds rollback logic using __vunmap_range_noflush() and
>> kmsan_vunmap_range_noflush() into vmap_page_range(),
>> __vmap_pages_range_noflush(), and vmap_pages_range_noflush() when page
>> table installation or KMSAN metadata setup fails. It also adds range and
>> page_shift validation in __vmap_pages_range_noflush().
>>
>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>>> index 44e0eb32708f1..75aa5acf55660 100644
>>> --- a/mm/vmalloc.c
>>> +++ b/mm/vmalloc.c
>>> @@ -363,6 +363,9 @@ int vmap_page_range(unsigned long addr, unsigned long end,
>>>   	if (!err)
>>>   		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
>>>   					       ioremap_max_page_shift);
>>> +	if (err)
>>> +		__vunmap_range_noflush(addr, end);
>>> +
>>>   	return err;
>>>   }
>> [Severity: High]
>> What happens here when vmap_range_noflush() returns -EINVAL for a range
>> where end - addr is not PAGE_SIZE-aligned?
>>
>> In vmap_pte_range(), commit a739e6b557af09 added a check to bail out on
>> unaligned ranges specifically to avoid an infinite loop:
>>
>> mm/vmalloc.c:vmap_pte_range() {
>> 	...
>> 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
>> 		return -EINVAL;
>> }
>>
>> This can be reached on 64KB page kernels via pci_remap_iospace() ->
>> vmap_page_range() with 16KB/32KB/48KB PCI I/O ranges (for example via
>> loongson_pci_probe() or acpi_pci_root_remap_iospace()).
>>
>> When vmap_pte_range() returns -EINVAL, vmap_page_range() now calls
>> __vunmap_range_noflush(addr, end) with the unaligned range. Whenever a PMD
>> in [addr, end) is already populated with a PTE table (such as the
>> PCI_IOBASE PMD populated during early boot by reserve_pio_range(), or an
>> earlier PMD mapped in the same call), __vunmap_range_noflush() descends
>> into vunmap_pte_range(), which has no alignment check:
>>
>> mm/vmalloc.c:vunmap_pte_range() {
>> 	...
>> 	do {
>> 		...
>> 			ptent = ptep_get_and_clear(&init_mm, addr, pte);
>> 		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
>> 	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
>> }
>>
>> Because end - addr is not a multiple of PAGE_SIZE, won't addr step past end
>> and loop infinitely, clearing unrelated kernel PTEs and corrupting memory
>> past the PTE table?
>>
> That sounds reasonable. I will add a separate patch in the next version to fix
> this problem.
>
>> [Severity: Medium]
>> Also in vmap_page_range(), flush_cache_vmap(addr, end) is called
>> unconditionally before checking err and before rolling back with
>> __vunmap_range_noflush(addr, end):
>>
>> mm/vmalloc.c:vmap_page_range() {
>> 	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
>> 				 ioremap_max_page_shift);
>> 	flush_cache_vmap(addr, end);
>> 	if (!err)
>> 		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
>> 					       ioremap_max_page_shift);
>> 	if (err)
>> 		__vunmap_range_noflush(addr, end);
>>
>> 	return err;
>> }
>>
>> On UML, flush_cache_vmap is defined as flush_tlb_kernel_range:
>>
>> arch/um/include/asm/cacheflush.h:
>> #define flush_cache_vmap flush_tlb_kernel_range
>>
>> When vmap_range_noflush() fails partway through or
>> kmsan_ioremap_page_range() fails, flush_cache_vmap() runs while the
>> partially installed PTEs are still pte_present(), causing
>> update_pte_range() in arch/um/kernel/tlb.c to map them into the host OS via
>> ops->mmap() and clear _PAGE_NEEDSYNC:
>>
>> arch/um/kernel/tlb.c:update_pte_range() {
>> 	...
>> 		if (pte_present(*pte)) {
>> 			...
>> 			ret = ops->mmap(ops->mm_idp, addr, PAGE_SIZE,
>> 					prot, fd, offset);
>> 		} else
>> 			ret = ops->unmap(ops->mm_idp, addr, PAGE_SIZE);
>>
>> 		*pte = pte_mkuptodate(*pte);
>> }
>>
>> When __vunmap_range_noflush(addr, end) then clears the software PTEs
>> without a subsequent TLB flush or unmap notification, won't those host OS
>> mmap mappings be left behind? Should flush_cache_vmap(addr, end) only be
>> called after both vmap_range_noflush() and kmsan_ioremap_page_range()
>> succeed?
>>
> That sounds reasonable. I will add this logic in the next version.
>
>>> @@ -683,27 +686,35 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>>   		pgprot_t prot, struct page **pages, unsigned int page_shift)
>>>   {
>>>   	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
>>> +	unsigned long start = addr;
>>> +	int err = 0;
>>> +
>>> +	if (WARN_ON_ONCE(addr >= end))
>>> +		return -EINVAL;
>>>   
>>>   	if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
>>>   		return -EINVAL;
>>>   
>>>   	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
>>> -			page_shift == PAGE_SHIFT)
>>> -		return vmap_small_pages_range_noflush(addr, end, prot, pages);
>>> -
>>> -	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
>>> -		int err;
>>> -
>>> -		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
>>> +			page_shift == PAGE_SHIFT) {
>>> +		err = vmap_small_pages_range_noflush(addr, end, prot, pages);
>>> +	} else {
>>> +		for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
>>> +			err = vmap_range_noflush(addr, addr + (1UL << page_shift),
>>>   					page_to_phys(pages[i]), prot,
>>>   					page_shift);
>>> -		if (err)
>>> -			return err;
>>> +			if (err)
>>> +				break;
>>>   
>>> -		addr += 1UL << page_shift;
>>> +			addr += 1UL << page_shift;
>>> +		}
>>>   	}
>>>   
>>> -	return 0;
>>> +	/* Undo the PTEs installed before the failure. */
>>> +	if (err)
>>> +		__vunmap_range_noflush(start, end);
>>> +
>>> +	return err;
>>>   }
>> [Severity: High]
>> Similarly here, __vmap_pages_range_noflush() checks addr >= end, but does
>> not check PAGE_ALIGNED(addr) or PAGE_ALIGNED(end).
>>
>> If a caller passes a sub-page or unaligned range (for example, 0 < end -
>> addr < PAGE_SIZE), nr = (end - addr) >> PAGE_SHIFT evaluates to 0, so the
>> huge-page path still maps nothing and returns 0, while the small-page path
>> loops infinitely in vmap_pages_pte_range(). And if the huge-page path fails
>> on an unaligned range, __vunmap_range_noflush(start, end) will hit the same
>> infinite loop in vunmap_pte_range().
>>
>> Should both vmap_page_range() and __vmap_pages_range_noflush() validate
>> PAGE_ALIGNED(addr) && PAGE_ALIGNED(end) upfront before attempting to map or
>> unmap?
>>
> I think We need to check both PAGE_ALIGNED(addr) and PAGE_ALIGNED(end).
> As an example: if addr is PAGE-aligned, end is not, and end - addr < PAGE_SIZE,
> then nr becomes zero. On the huge page path, we simply return 0 with no work performed.
>
> At the same time, vmap_pages_pte_range() needs the same guard as commit
> a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not PAGE_SIZE aligned"),
> to protect against unaligned ranges.
>
> So will do next version.
>
>>>   
>>>   int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>> @@ -715,7 +726,16 @@ int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>>   
>>>   	if (ret)
>>>   		return ret;
>>> -	return __vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
>>> +
>>> +	ret = __vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
>>> +	/*
>>> +	 * The page tables undo themselves on failure. Tear down the
>>> +	 * metadata that was fully set up before the mapping failed.
>>> +	 */
>>> +	if (ret)
>>> +		kmsan_vunmap_range_noflush(addr, end);
>>> +
>>> +	return ret;
>>>   }
>> [Severity: High]
>> Can calling __vunmap_range_noflush() and kmsan_vunmap_range_noflush() here
>> trigger a sleeping-in-atomic-context bug when __vmalloc() or kvmalloc() is
>> called with GFP_ATOMIC or GFP_NOWAIT?
>>
>> __vmalloc_area_node() supports non-blocking allocations by wrapping
>> __vmap_pages_range() in memalloc_apply_gfp_scope(gfp_mask):
>>
>> mm/vmalloc.c:__vmalloc_area_node() {
>> 	...
>> 	flags = memalloc_apply_gfp_scope(gfp_mask);
>> 	do {
>> 		ret = __vmap_pages_range(addr, addr + size, prot, area->pages,
>> 				page_shift, nested_gfp);
>> 	} while ((gfp_mask & __GFP_NOFAIL) && (ret < 0));
>> 	memalloc_restore_gfp_scope(flags);
>> }
>>
>> When a GFP_ATOMIC or GFP_NOWAIT allocation runs in atomic context (such as
>> under a spinlock, preempt_disable(), or rcu_read_lock()) and page table
>> allocation fails in vmap_small_pages_range_noflush() after at least one PMD
>> in [start, end) is populated (or after kmsan_vmap_pages_range_noflush()
>> populated the KMSAN shadow/origin ranges), __vmap_pages_range_noflush() and
>> kmsan_vunmap_range_noflush() synchronously call __vunmap_range_noflush().
>>
>> __vunmap_range_noflush() walks the populated PMDs via vunmap_pmd_range(),
>> which unconditionally calls cond_resched():
>>
>> mm/vmalloc.c:vunmap_pmd_range() {
>> 	...
>> 	do {
>> 		next = pmd_addr_end(addr, end);
>> 		if (pmd_none_or_clear_bad(pmd))
>> 			continue;
>> 		vunmap_pte_range(pmd, addr, next, mask);
>>
>> 		cond_resched();
>> 	} while (pmd++, addr = next, addr != end);
>> }
>>
>> Commit 9c47753167a6 ("mm/vmalloc: defer freeing partly initialized
>> vm_struct") deferred error-path cleanup in __vmalloc_area_node() to a
>> workqueue specifically because unmapping on failure can sleep. Doesn't
>> calling __vunmap_range_noflush() synchronously inside
>> __vmap_pages_range_noflush() and vmap_pages_range_noflush() reintroduce
>> cond_resched() in atomic context?
>>
> This issue also appears real. One possible approach is to plumb the caller's gfp_mask into vunmap_pmd_range()
> to conditionally skip cond_resched().
> Suren, Ulad, do you have any preferred or cleaner way to handle this?


Alternatively, we can follow the approach from commit 9c47753167a6 
("mm/vmalloc: defer freeing partly initialized vm_struct"):

defer the cleanup to a workqueue when |gfp_mask| has GFP_ATOMIC or 
GFP_NOWAIT，and perform cleanup synchronously

if we are already in process context. Anyway, I will look into this 
further tomorrow.


>
> Thanks
> Best Regards
> Hao
>
