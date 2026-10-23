Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792728589;
	b=guKMVX2oIvRiQ8U1XZFBNE1tZzTG4bdjr4oZs+WEsC7j7x/752K/Zh5szVtaAeTNVSPO
	 b4BjYRkHfYImijXr8UCtnxeoJv2kjLKMbGAxvc6Km3vbiYgcS6HV9bihYaSDYRaCZI9Eu
	 UHEtATGoemYPpCKA243KYgpU4nOlmcMkij/7DxAtcKwLJIu2Luq5WvaNQrAFkwC1h0NBJ
	 ju5gG/K6V7DstaxZ7VABFJZm3hZO89gIwPaqE4HOmSmby3IqhhxEAuasJiN0NrN7dRhA6
	 PrUOCiJTfMkNt9qqiisDWpBsQNBYYUEf50CUFybiNTJkZ2gGjKj79hEq7E93E+9D24Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792728589;
	h=DMARC-Filter:DKIM-Signature:Message-Id:Mime-Version:X-Original-From:
	 User-Agent:Cc:From:References:Date:Content-Type:In-Reply-To:
	 Content-Transfer-Encoding:Subject:X-Lms-Return-Path:To;
	bh=UL1xs+3wBpHHfuSwjpX6YqED9XSfjXDo9wVKeymLCdc=;
	b=A1l6Oisi27zRS3jB+OktJLxL/0+AZASjAfDqOnCG+wxPCy+2Wlm8vgseEFgNL+v5XwRa
	 xXnvEkYBhmV/zSMnyjmgGA+ZZVUnA8XX89Hov+QFCSYhbgS8uJQkdBVuNSYIUaNXuNjj2
	 vJIxo0DBD3yPjqbhmlm0u7DaWxXeRurnhkotOf4gNKblqskrf8gLt/lod4Svcnad4bugx
	 jl59DRC8gEPx4IbpBL9e2+o1K1Ene/mT5tSjuwn0XAnOTH2EVxgTiXe7oiXQ3Xru9rBfO
	 9CKNipz/Qi7Jr0RNJd5NPrvSUyE9viUaoSaJGQ/NIs/QjUwxCtpH7jOyUw1rjwD750g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=j6Y+CCDN;
	arc=none smtp.remote-ip=209.127.231.111
Received: from va-2-111.ptr.blmpb.com (va-2-111.ptr.blmpb.com [209.127.231.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA36F606A319
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 04:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA36F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=j6Y+CCDN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792728581; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=UL1xs+3wBpHHfuSwjpX6YqED9XSfjXDo9wVKeymLCdc=;
 b=j6Y+CCDNyyR6H+i0gPIsCHJgUwltUiIsHmtRtM6smI0Ax48nLvW6TcmKtlVv8VrzlTruaM
 3in7r7HisapKhJLh7947sf2mCjlQxsmhjP/EST7EAGjwdqNwxCPtV3zb5kETx2Y3Xb9k5m
 x49qr+w1AWbJYWk+gMeBq84X6z+tzfGfbHzpOzfaXosI7iDx2vhDA4uIVlwqiOrehVkLey
 IRYM+XvY6OiOrTftjPqRDs8YK8dSdfKHYVnzw5B56z0yxXfo2CZxkvHs3oHwQpuZP4DW7N
 sCNXu2ueDjkgEkmFhpSfXOfB3cCVKY4/jc6mF/ToU6HQUC+5oOzeXQEIW7I3yg==
Message-Id: <7818e0c8-e20b-4dfb-a192-4d0c9fc8209f@bytedance.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
User-Agent: Mozilla Thunderbird
Cc: <linux-mm@kvack.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
References: <20261022034543.51226-1-lizhe.67@bytedance.com> <20261022034543.51226-3-lizhe.67@bytedance.com> <sashiko-outbox-181816@kernel.org>
Date: Fri, 23 Oct 2026 12:09:25 +0800
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <sashiko-outbox-181816@kernel.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/3] mm/hugetlb: disable PMD sharing for UFFD missing mode
X-Lms-Return-Path: <lba+26adade04+5786f1+lists.linux.dev+lizhe.67@bytedance.com>
To: <sashiko-reviews@lists.linux.dev>, <akpm@linux-foundation.org>, 
	<david@kernel.org>, <muchun.song@linux.dev>, <osalvador@suse.de>, 
	<peterx@redhat.com>, <rppt@kernel.org>, <azpijr@gmail.com>

On 10/23/26 12:36 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] mm/hugetlb: uffd_disable_huge_pmd_share() leaks poison markers on unregister
> --
>
> commit 5da87cbb6b8f2271fb75acc59e14e2d5860cb54c
> Author: David Hildenbrand (Arm) <david@kernel.org>
>
> mm/hugetlb: disable PMD sharing for UFFD missing mode
>
> This commit disables hugetlb pmd page table sharing for all userfaultfd
> registered vmas by checking vma->vm_userfaultfd_ctx.ctx in
> uffd_disable_huge_pmd_share(), preventing poison markers installed under
> missing mode from affecting shared pmd tables. It also adds a debug check
> in hugetlb_mfill_atomic_pte() when installing a poison marker.
>
>> diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
>> index a14b8a9ffb7b1..ebd86677b052d 100644
>> --- a/include/linux/userfaultfd_k.h
>> +++ b/include/linux/userfaultfd_k.h
>> @@ -168,22 +168,12 @@ static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
>>   }
>>   
>>   /*
>> - * Never enable huge pmd sharing on some uffd registered vmas:
>> - *
>> - * - VM_UFFD_WP and VM_UFFD_RWP VMAs, because the write protect / access
>> - *   tracking information is per pgtable entry.
>> - *
>> - * - VM_UFFD_MINOR VMAs, because otherwise we would never get minor faults for
>> - *   VMAs which share huge pmds. (If you have two mappings to the same
>> - *   underlying pages, and fault in the non-UFFD-registered one with a write,
>> - *   with huge pmd sharing this would *also* setup the second UFFD-registered
>> - *   mapping, and we'd not get minor faults.)
>> + * Never enable huge pmd sharing on userfaultfd registered VMAs, because
>> + * userfaultfd state can be tracked per VMA or per page table entry.
>>    */
>>   static inline bool uffd_disable_huge_pmd_share(struct vm_area_struct *vma)
>>   {
>> -	return vma_test_any_mask(vma,
>> -		mk_vma_flags_from_masks(VMA_UFFD_WP, VMA_UFFD_RWP,
>> -					VMA_UFFD_MINOR));
>> +	return vma->vm_userfaultfd_ctx.ctx;
>>   }
>>   
>>   /*
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 966d249469454..7566f2eed50b0 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -6399,6 +6399,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
>>   			return -EEXIST;
>>   		}
>>   
>> +		VM_WARN_ON_ONCE(size == PMD_SIZE && hugetlb_pmd_shared(dst_pte));
>>   		_dst_pte = make_pte_marker(PTE_MARKER_POISONED);
>>   		set_huge_pte_at(dst_mm, dst_addr, dst_pte, _dst_pte, size);
>>   
> [Severity: High]
> Can a pmd table containing a poison marker still become shared across
> processes after the vma is unregistered from userfaultfd?
>
> When a process registers a shared hugetlbfs vma in missing mode and installs
> a poison marker via hugetlb_mfill_atomic_pte(), the marker is written into the
> process's private pmd table.
>
> If the process later unregisters the vma or closes the userfaultfd descriptor
> (via userfaultfd_unregister() -> userfaultfd_clear_vma() or
> userfaultfd_release_all() -> userfaultfd_clear_vma(), or remaps via
> mremap_userfaultfd_prep()), the userfaultfd flags and context are cleared
> while the poison marker remains in the page table:
>
> mm/userfaultfd.c:userfaultfd_clear_vma() {
> 	...
> 	ret = vma_modify_flags_uffd(vmi, prev, vma, start, end,
> 				    &new_vma_flags, NULL_VM_UFFD_CTX,
> 				    give_up_on_oom);
>
> 	if (!IS_ERR(ret))
> 		userfaultfd_reset_ctx(ret);
> 	...
> }
>
> Unlike write-protect markers, which are resolved by change_protection() on
> unregistration, poison markers intentionally persist after the userfaultfd
> context is reset.
>
> Once vma->vm_userfaultfd_ctx.ctx is cleared and the userfaultfd flags are
> removed from vma->vm_flags, uffd_disable_huge_pmd_share() returns false and
> page_table_shareable() in mm/hugetlb.c considers the vma eligible for sharing
> again:
>
> mm/hugetlb.c:huge_pmd_share() {
> 	...
> 	mapping_rmap_tree_foreach(svma, mapping, idx, idx) {
> 		if (svma == vma)
> 			continue;
>
> 		saddr = page_table_shareable(svma, vma, addr, idx);
> 		if (saddr) {
> 			spte = hugetlb_walk(svma, saddr,
> 					    vma_mmu_pagesize(svma));
> 			if (spte) {
> 				ptdesc_pmd_pts_inc(virt_to_ptdesc(spte));
> 				break;
> 			}
> 		}
> 	}
> 	...
> }
>
> When another process mapping the same shared hugetlbfs file faults in that
> range (hugetlb_fault() -> huge_pte_alloc() -> want_pmd_share() ->
> huge_pmd_share()), huge_pmd_share() walks the first process's vma, finds its
> populated pmd table containing the poison marker, and shares it into the
> second process.
>
> That exposes the second process to the first process's poison marker. In
> addition, if the first process subsequently unshares the pmd table (for
> example via mprotect(), hugetlb_split(), or re-registering userfaultfd),
> __huge_pmd_unshare() clears the pud entry in the first process, causing the
> originating process to lose its own poison marker while leaving it installed
> in the second process.
>
> Should the vma or ptdesc record that a poison marker was installed so pmd
> sharing remains disabled for it even after userfaultfd unregistration?

Thanks for the report.

This looks like a valid concern, but I think it is not introduced by
this patch. Before this patch, VM_UFFD_MISSING did not prevent hugetlb
PMD sharing, so UFFDIO_POISON could already install poison markers into
page tables that could later become shared.

This patch addresses the registered-VMA side of that problem by making
hugetlb PMD sharing disabled for userfaultfd-registered VMAs. So new
poison markers should no longer be installed into shared PMD page tables
while the VMA is registered.

The unregister case seems to be a remaining pre-existing lifecycle issue
around PTE_MARKER_POISONED and hugetlb PMD sharing. David previously
mentioned broader poison-marker issues and prototype fixes here:

https://lore.kernel.org/all/bb72cc2c-a46a-44f8-99a2-b036abfdbd26@kernel.org/

So I think we should wait for David's thoughts on how to handle that
remaining case.

Thanks,
Zhe
