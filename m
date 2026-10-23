Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750646;
	b=N0QLJ+5WBWX5prN4FyOkhaRtMsN49kOCTgRp6EXo/o7lhML0Cu1xrICPNARlDeAgRZMS
	 Ohmj7fZJnwdjVd2j52FZdF6/1lHYegH9sIKUe814OuI7LlZxBV/SZH/+3np0a+vFNZh0N
	 j3eIwR5EcAhs7YZyF49eQsIfOpRjgDbxR4wqItI44RDAnZ3djfK/jnT3XuOzX1QEvpTtm
	 xK9bj8FPZhtHjjGRwwZOH2bAOSLHHQHXzG4zeAaXGkSGfPh6k0+gOZuNcj8PQr73VTDpf
	 ug/AvwVIDTjSXiZcxK634EI9mh0c3T/g2FnkoZ/eeM7rrIYod/G9kZD0Mipgg7QSxZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=mRvL7cCOwql5SCXnVx//aKAs5MwNxaXVUpZx/G3l3gY=;
	b=kqhnBJMtkpDQz2/V95Ei6CZqelN+Ih3GONPC5dJQUjRTcm6BthRCjexH4mvImrZ3n8K1
	 Q5NTwgaEqdlHP3vFM0eTwyzAV5ym/ZPHs4VV4fWbLWfwjnO7xF6UzxrF8C6F6uu5S2cbu
	 OYV1yMv61Ov7qsFx3Y5S6qes7mFMLe49b7BlTlghgi5MyBM8L6xwo1mdnyBEhFt+3Pjd0
	 DPxLRGzP/gsl4X3WBEQwNyZMcrJNdFWJWXRE2Zt4SwT8w6qCgdGLj8aXuRkUiNzKlc9YG
	 TlLJPP7t5Cqi1qsrMS8DIzRcTgF3xPz+PnHT+GAx4tzFI/SWaNOoUd6salI/HP1kGKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DeZBGZFR;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F1F606A31B
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 10:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33F1F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DeZBGZFR
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so1007216a12.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 03:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792750644; x=1793355444; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mRvL7cCOwql5SCXnVx//aKAs5MwNxaXVUpZx/G3l3gY=;
        b=DeZBGZFRkpg2Ta+io7toVRZu3wWj1TQ8ELOSV4H0GjE33VfDdsCHf6ZB9gTABEhoC7
         y9Pb1y4CTLaX87TLwrvYJzL/DRlsnEKiJW7t0HuTpSnwWw1URfoYnz+BBP57TtAkSOvb
         cGQur3bPPUNWddMm4ZZAPJilBMGsB3xp5ca/JEFnN8SDCa1U/W0Q3/P2nd+nTHiEy5ml
         B7x6fz9gxe+uQHSNjfQE4katCwGwl75uifHP8FzYeqzwktBW3bgh8P1BH+2/qS6Q3+eO
         9UFeJx/k28IGXVbUcQDr/zx3qRtV3GWZq4esNwwJVV2P/CXDk75IfYSoVTu12syznaBb
         CL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750644; x=1793355444;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mRvL7cCOwql5SCXnVx//aKAs5MwNxaXVUpZx/G3l3gY=;
        b=nXx/Z1xDwtvDQ+nEQwUGvJWia29LokX4Hu36Cb/De5CnMtupkIg3ZT8jLEgEMfW35T
         vNATk57kRnjdlmHJffamQ+jYM6Ymvx/FrXU+G7NxohNcX6r+7uV3UdqT8eJnjCm6roRZ
         5z+fGevwhmOe7uOQBs6ALYBW1kfV7Fjxf1aDKT3vYPE+29YHbgCnRjol4s0Jsqz/HA3S
         K78KwuWbMUFJSTRXCVqtC6iTFPsvSK5CUTk4hkmnPlwwP7lOTG5+ookBr7pcNZYDdJp9
         qCtVHFmMn1zppQOC3VWihI1OJsE+lAg6Red8V5Swmsi7BecsrPCG0UpkZH4NGATIKfCY
         w3jg==
X-Forwarded-Encrypted: i=1; AKwUvBxUc9x/NqtCif5HhPSA8OLCfUK9s1PC4w4WE14R7rCCBP4+ChP+Qc6PmBxkEEREjdCKR+LQmz5yLXQcHrcxmcw=@lists.linux.dev
X-Gm-Message-State: AFq9FYJKn0xMD52YK/wLJKLZQNYUdkDV6ogqjZ9/hHHstqX54+8L9F1I
	FKvL+7wTFQ6CpTQcmGAgV8Q8aaLkalUPI8UXjwe3/4zKhFOnFo17SRbR
X-Gm-Gg: AYBFou3XaXfeDRvC7cFTQGtmWrE5hVtp6/+pBAt2KOZ3mAV+hlVDH9W8MlVGPlX1iKW
	MTXWkhLbhUATrllkyB0k75XNB8KhPKYvFsZtpMFwH2S3/Xwb4o1Ofe+05rKaBbuiQl0LDnB1CFO
	YwBz0fgXAYZtcZc/m2IalcDcfE+XGEB1HqGiCKunt4nwldRGjiqHSJR9DVlF69EE3nX/Nq1MMVZ
	l8In2V5PwDkAp6R5/daGhr7ZytOp/mt/mcsSXkEPEKxGXSKyJfrOXMLrKmwNfmSH4RfdFvoUN8m
	q4tgA1p2jxKkPxU3tsXjVaUnlSnFVvikSTNmgUi4i0/1WDT7N46yycraWPKuYadmki11SGBYT9X
	f+QJEohjrHMjIgbun+JxNdvIFK4bEe8sL7A8/nDiArOEgQiRAvST18F78Mt4ktPsSxwbWR8+36x
	+FWGay8ql7k7/xkm0OZVKO37UUrNV52zoC4LBG3P/rwfurLZu1vJE7jET8uw07fGQ7qYKZdCKKe
	VeXtbUC7fhqT3qOQGlj
X-Received: by 2002:aa7:d503:0:b0:6b2:3b5:d078 with SMTP id 4fb4d7f45d1cf-6b432bd64bamr1847191a12.30.1792750644149;
        Fri, 23 Oct 2026 03:17:24 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432c00eaasm986570a12.5.2026.10.23.03.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:17:23 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Fri, 23 Oct 2026 12:17:21 +0200
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>, kasan-dev@googlegroups.com,
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
Message-ID: <ats0Me6ON2QDrS6L@milan>
References: <20261019054531.87652-1-hao.ge@linux.dev>
 <20261019054531.87652-4-hao.ge@linux.dev>
 <sashiko-outbox-178439@kernel.org>
 <2b83dfaa-424b-4464-830e-a7714a816d5c@linux.dev>
 <d1ed2d7f-3999-4e8a-a290-1f812a0439af@linux.dev>
 <ateD6VVhyiUAtsER@milan>
 <e58f1712-cfd1-4757-a47f-f8df53b8baf9@linux.dev>
 <atpHuSch1sbl9Cz3@milan>
 <b838b389-c4a4-47d9-b723-b3a89714c885@linux.dev>
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
In-Reply-To: <b838b389-c4a4-47d9-b723-b3a89714c885@linux.dev>

On Fri, Oct 23, 2026 at 10:18:57AM +0800, Hao Ge wrote:
> 
> 
> On 2026/10/23 01:28, Uladzislau Rezki wrote:
> > On Thu, Oct 22, 2026 at 09:33:19PM +0800, Hao Ge wrote:
> >> Hi Uladzislau and Suren
> >>
> >> On 2026/10/20 23:08, Uladzislau Rezki wrote:
> >>> On Tue, Oct 20, 2026 at 09:27:14PM +0800, Hao Ge wrote:
> >>>>
> >>>> On 10/20/26 18:03, Hao Ge wrote:
> >>>>> Hi Suren and Ulad
> >>>>>
> >>>>> Sashiko reported several issues, and they all look real.
> >>>>> I have some ideas for fixing the first few;
> >>>>> of course, please correct me if I get anything wrong.
> >>>>>
> >>>>> I'd like to discuss the last issue with you all.
> >>>>>
> >>>>>
> >>>>> On 2026/10/20 13:45, sashiko-bot@kernel.org wrote:
> >>>>>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> >>>>>> - [High] mm/vmalloc: infinite loop in vunmap_pte_range() on unaligned error rollback
> >>>>>> - [High] mm/vmalloc: __vmap_pages_range_noflush() calls cond_resched() in atomic context
> >>>>>> - [Medium] mm/vmalloc: vmap_page_range() calls flush_cache_vmap() before error rollback
> >>>>>> --
> >>>>>>
> >>>>>> commit 043026437ba63b051df5d14470fe69ce8fa8825c
> >>>>>> Author: Hao Ge <hao.ge@linux.dev>
> >>>>>>
> >>>>>> mm/vmalloc: undo partial mappings inside the mapping functions
> >>>>>>
> >>>>>> This commit adds rollback logic using __vunmap_range_noflush() and
> >>>>>> kmsan_vunmap_range_noflush() into vmap_page_range(),
> >>>>>> __vmap_pages_range_noflush(), and vmap_pages_range_noflush() when page
> >>>>>> table installation or KMSAN metadata setup fails. It also adds range and
> >>>>>> page_shift validation in __vmap_pages_range_noflush().
> >>>>>>
> >>>>>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> >>>>>>> index 44e0eb32708f1..75aa5acf55660 100644
> >>>>>>> --- a/mm/vmalloc.c
> >>>>>>> +++ b/mm/vmalloc.c
> >>>>>>> @@ -363,6 +363,9 @@ int vmap_page_range(unsigned long addr, unsigned long end,
> >>>>>>>   	if (!err)
> >>>>>>>   		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
> >>>>>>>   					       ioremap_max_page_shift);
> >>>>>>> +	if (err)
> >>>>>>> +		__vunmap_range_noflush(addr, end);
> >>>>>>> +
> >>>>>>>   	return err;
> >>>>>>>   }
> >>>>>> [Severity: High]
> >>>>>> What happens here when vmap_range_noflush() returns -EINVAL for a range
> >>>>>> where end - addr is not PAGE_SIZE-aligned?
> >>>>>>
> >>>>>> In vmap_pte_range(), commit a739e6b557af09 added a check to bail out on
> >>>>>> unaligned ranges specifically to avoid an infinite loop:
> >>>>>>
> >>>>>> mm/vmalloc.c:vmap_pte_range() {
> >>>>>> 	...
> >>>>>> 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> >>>>>> 		return -EINVAL;
> >>>>>> }
> >>>>>>
> >>>>>> This can be reached on 64KB page kernels via pci_remap_iospace() ->
> >>>>>> vmap_page_range() with 16KB/32KB/48KB PCI I/O ranges (for example via
> >>>>>> loongson_pci_probe() or acpi_pci_root_remap_iospace()).
> >>>>>>
> >>>>>> When vmap_pte_range() returns -EINVAL, vmap_page_range() now calls
> >>>>>> __vunmap_range_noflush(addr, end) with the unaligned range. Whenever a PMD
> >>>>>> in [addr, end) is already populated with a PTE table (such as the
> >>>>>> PCI_IOBASE PMD populated during early boot by reserve_pio_range(), or an
> >>>>>> earlier PMD mapped in the same call), __vunmap_range_noflush() descends
> >>>>>> into vunmap_pte_range(), which has no alignment check:
> >>>>>>
> >>>>>> mm/vmalloc.c:vunmap_pte_range() {
> >>>>>> 	...
> >>>>>> 	do {
> >>>>>> 		...
> >>>>>> 			ptent = ptep_get_and_clear(&init_mm, addr, pte);
> >>>>>> 		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
> >>>>>> 	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
> >>>>>> }
> >>>>>>
> >>>>>> Because end - addr is not a multiple of PAGE_SIZE, won't addr step past end
> >>>>>> and loop infinitely, clearing unrelated kernel PTEs and corrupting memory
> >>>>>> past the PTE table?
> >>>>>>
> >>>>> That sounds reasonable. I will add a separate patch in the next version to fix
> >>>>> this problem.
> >>>>>
> >>>>>> [Severity: Medium]
> >>>>>> Also in vmap_page_range(), flush_cache_vmap(addr, end) is called
> >>>>>> unconditionally before checking err and before rolling back with
> >>>>>> __vunmap_range_noflush(addr, end):
> >>>>>>
> >>>>>> mm/vmalloc.c:vmap_page_range() {
> >>>>>> 	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
> >>>>>> 				 ioremap_max_page_shift);
> >>>>>> 	flush_cache_vmap(addr, end);
> >>>>>> 	if (!err)
> >>>>>> 		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
> >>>>>> 					       ioremap_max_page_shift);
> >>>>>> 	if (err)
> >>>>>> 		__vunmap_range_noflush(addr, end);
> >>>>>>
> >>>>>> 	return err;
> >>>>>> }
> >>>>>>
> >>>>>> On UML, flush_cache_vmap is defined as flush_tlb_kernel_range:
> >>>>>>
> >>>>>> arch/um/include/asm/cacheflush.h:
> >>>>>> #define flush_cache_vmap flush_tlb_kernel_range
> >>>>>>
> >>>>>> When vmap_range_noflush() fails partway through or
> >>>>>> kmsan_ioremap_page_range() fails, flush_cache_vmap() runs while the
> >>>>>> partially installed PTEs are still pte_present(), causing
> >>>>>> update_pte_range() in arch/um/kernel/tlb.c to map them into the host OS via
> >>>>>> ops->mmap() and clear _PAGE_NEEDSYNC:
> >>>>>>
> >>>>>> arch/um/kernel/tlb.c:update_pte_range() {
> >>>>>> 	...
> >>>>>> 		if (pte_present(*pte)) {
> >>>>>> 			...
> >>>>>> 			ret = ops->mmap(ops->mm_idp, addr, PAGE_SIZE,
> >>>>>> 					prot, fd, offset);
> >>>>>> 		} else
> >>>>>> 			ret = ops->unmap(ops->mm_idp, addr, PAGE_SIZE);
> >>>>>>
> >>>>>> 		*pte = pte_mkuptodate(*pte);
> >>>>>> }
> >>>>>>
> >>>>>> When __vunmap_range_noflush(addr, end) then clears the software PTEs
> >>>>>> without a subsequent TLB flush or unmap notification, won't those host OS
> >>>>>> mmap mappings be left behind? Should flush_cache_vmap(addr, end) only be
> >>>>>> called after both vmap_range_noflush() and kmsan_ioremap_page_range()
> >>>>>> succeed?
> >>>>>>
> >>>>> That sounds reasonable. I will add this logic in the next version.
> >>>>>
> >>>>>>> @@ -683,27 +686,35 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> >>>>>>>   		pgprot_t prot, struct page **pages, unsigned int page_shift)
> >>>>>>>   {
> >>>>>>>   	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> >>>>>>> +	unsigned long start = addr;
> >>>>>>> +	int err = 0;
> >>>>>>> +
> >>>>>>> +	if (WARN_ON_ONCE(addr >= end))
> >>>>>>> +		return -EINVAL;
> >>>>>>>   	if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
> >>>>>>>   		return -EINVAL;
> >>>>>>>   	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> >>>>>>> -			page_shift == PAGE_SHIFT)
> >>>>>>> -		return vmap_small_pages_range_noflush(addr, end, prot, pages);
> >>>>>>> -
> >>>>>>> -	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> >>>>>>> -		int err;
> >>>>>>> -
> >>>>>>> -		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> >>>>>>> +			page_shift == PAGE_SHIFT) {
> >>>>>>> +		err = vmap_small_pages_range_noflush(addr, end, prot, pages);
> >>>>>>> +	} else {
> >>>>>>> +		for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> >>>>>>> +			err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> >>>>>>>   					page_to_phys(pages[i]), prot,
> >>>>>>>   					page_shift);
> >>>>>>> -		if (err)
> >>>>>>> -			return err;
> >>>>>>> +			if (err)
> >>>>>>> +				break;
> >>>>>>> -		addr += 1UL << page_shift;
> >>>>>>> +			addr += 1UL << page_shift;
> >>>>>>> +		}
> >>>>>>>   	}
> >>>>>>> -	return 0;
> >>>>>>> +	/* Undo the PTEs installed before the failure. */
> >>>>>>> +	if (err)
> >>>>>>> +		__vunmap_range_noflush(start, end);
> >>>>>>> +
> >>>>>>> +	return err;
> >>>>>>>   }
> >>>>>> [Severity: High]
> >>>>>> Similarly here, __vmap_pages_range_noflush() checks addr >= end, but does
> >>>>>> not check PAGE_ALIGNED(addr) or PAGE_ALIGNED(end).
> >>>>>>
> >>>>>> If a caller passes a sub-page or unaligned range (for example, 0 < end -
> >>>>>> addr < PAGE_SIZE), nr = (end - addr) >> PAGE_SHIFT evaluates to 0, so the
> >>>>>> huge-page path still maps nothing and returns 0, while the small-page path
> >>>>>> loops infinitely in vmap_pages_pte_range(). And if the huge-page path fails
> >>>>>> on an unaligned range, __vunmap_range_noflush(start, end) will hit the same
> >>>>>> infinite loop in vunmap_pte_range().
> >>>>>>
> >>>>>> Should both vmap_page_range() and __vmap_pages_range_noflush() validate
> >>>>>> PAGE_ALIGNED(addr) && PAGE_ALIGNED(end) upfront before attempting to map or
> >>>>>> unmap?
> >>>>>>
> >>>>> I think We need to check both PAGE_ALIGNED(addr) and PAGE_ALIGNED(end).
> >>>>> As an example: if addr is PAGE-aligned, end is not, and end - addr < PAGE_SIZE,
> >>>>> then nr becomes zero. On the huge page path, we simply return 0 with no work performed.
> >>>>>
> >>>>> At the same time, vmap_pages_pte_range() needs the same guard as commit
> >>>>> a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not PAGE_SIZE aligned"),
> >>>>> to protect against unaligned ranges.
> >>>>>
> >>>>> So will do next version.
> >>>>>
> >>>>>>>   int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> >>>>>>> @@ -715,7 +726,16 @@ int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> >>>>>>>   	if (ret)
> >>>>>>>   		return ret;
> >>>>>>> -	return __vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
> >>>>>>> +
> >>>>>>> +	ret = __vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
> >>>>>>> +	/*
> >>>>>>> +	 * The page tables undo themselves on failure. Tear down the
> >>>>>>> +	 * metadata that was fully set up before the mapping failed.
> >>>>>>> +	 */
> >>>>>>> +	if (ret)
> >>>>>>> +		kmsan_vunmap_range_noflush(addr, end);
> >>>>>>> +
> >>>>>>> +	return ret;
> >>>>>>>   }
> >>>>>> [Severity: High]
> >>>>>> Can calling __vunmap_range_noflush() and kmsan_vunmap_range_noflush() here
> >>>>>> trigger a sleeping-in-atomic-context bug when __vmalloc() or kvmalloc() is
> >>>>>> called with GFP_ATOMIC or GFP_NOWAIT?
> >>>>>>
> >>>>>> __vmalloc_area_node() supports non-blocking allocations by wrapping
> >>>>>> __vmap_pages_range() in memalloc_apply_gfp_scope(gfp_mask):
> >>>>>>
> >>>>>> mm/vmalloc.c:__vmalloc_area_node() {
> >>>>>> 	...
> >>>>>> 	flags = memalloc_apply_gfp_scope(gfp_mask);
> >>>>>> 	do {
> >>>>>> 		ret = __vmap_pages_range(addr, addr + size, prot, area->pages,
> >>>>>> 				page_shift, nested_gfp);
> >>>>>> 	} while ((gfp_mask & __GFP_NOFAIL) && (ret < 0));
> >>>>>> 	memalloc_restore_gfp_scope(flags);
> >>>>>> }
> >>>>>>
> >>>>>> When a GFP_ATOMIC or GFP_NOWAIT allocation runs in atomic context (such as
> >>>>>> under a spinlock, preempt_disable(), or rcu_read_lock()) and page table
> >>>>>> allocation fails in vmap_small_pages_range_noflush() after at least one PMD
> >>>>>> in [start, end) is populated (or after kmsan_vmap_pages_range_noflush()
> >>>>>> populated the KMSAN shadow/origin ranges), __vmap_pages_range_noflush() and
> >>>>>> kmsan_vunmap_range_noflush() synchronously call __vunmap_range_noflush().
> >>>>>>
> >>>>>> __vunmap_range_noflush() walks the populated PMDs via vunmap_pmd_range(),
> >>>>>> which unconditionally calls cond_resched():
> >>>>>>
> >>>>>> mm/vmalloc.c:vunmap_pmd_range() {
> >>>>>> 	...
> >>>>>> 	do {
> >>>>>> 		next = pmd_addr_end(addr, end);
> >>>>>> 		if (pmd_none_or_clear_bad(pmd))
> >>>>>> 			continue;
> >>>>>> 		vunmap_pte_range(pmd, addr, next, mask);
> >>>>>>
> >>>>>> 		cond_resched();
> >>>>>> 	} while (pmd++, addr = next, addr != end);
> >>>>>> }
> >>>>>>
> >>>>>> Commit 9c47753167a6 ("mm/vmalloc: defer freeing partly initialized
> >>>>>> vm_struct") deferred error-path cleanup in __vmalloc_area_node() to a
> >>>>>> workqueue specifically because unmapping on failure can sleep. Doesn't
> >>>>>> calling __vunmap_range_noflush() synchronously inside
> >>>>>> __vmap_pages_range_noflush() and vmap_pages_range_noflush() reintroduce
> >>>>>> cond_resched() in atomic context?
> >>>>>>
> >>>>> This issue also appears real. One possible approach is to plumb the caller's gfp_mask into vunmap_pmd_range()
> >>>>> to conditionally skip cond_resched().
> >>>>> Suren, Ulad, do you have any preferred or cleaner way to handle this?
> >>>>
> >>>>
> >>>> Alternatively, we can follow the approach from commit 9c47753167a6
> >>>> ("mm/vmalloc: defer freeing partly initialized vm_struct"):
> >>>>
> >>>> defer the cleanup to a workqueue when |gfp_mask| has GFP_ATOMIC or
> >>>> GFP_NOWAIT，and perform cleanup synchronously
> >>>>
> >>>> if we are already in process context. Anyway, I will look into this further
> >>>> tomorrow.
> >>>>
> >>> I will check the AI concern.
> >>>
> >>
> >> Thank you very much for the quick reply and for offering to check
> >> the AI concern. Much appreciated!
> >>
> >> Here is a summary of what I have found over the last few days.
> >> I went through the history first. The cond_resched() in vunmap_pmd_range()
> >> was added by commit e47110e90584 ("mm/vunmap: add cond_resched() in vunmap_pmd_range"),
> >> modeled after zap_pte_range(). It fixed a real soft lockup: on a non-preemptible
> >> kernel, unmapping a large persistent-memory namespace (hence a large I/O map region)
> >> kept a CPU busy for 23 seconds inside the walk:
> >>
> >> 	watchdog: BUG: soft lockup - CPU#49 stuck for 23s! [ndctl:50777]
> >>
> >> Then I looked at how vfree() handles atomic contexts: it defers the
> >> whole free to a workqueue from interrupt context (vfree_atomic()),
> >> and 9c47753167a6 does the same for a partly initialized vm_struct.
> >>
> >> Unfortunately I do not think deferral works for this rollback case.
> >> A deferred rollback returns with the PTEs still installed, and if
> >> that range is mapped again before the workqueue runs, the mapping
> >> hits the leftovers: a warning and -EBUSY on the small-page path, a
> >> BUG() on the huge path.
> >>
> >> So I kept it simple: plumb the caller's gfp_mask down to the unmap
> >> walk and call cond_resched() conditionally, like
> >> commit 660654f90e7f ("mm/vmalloc.c: add a schedule point to vmalloc()")
> >> did:
> >> 	if (gfp_mask & __GFP_WAIT)
> >> 		cond_resched();
> >>
> > Sounds good to me. But we have the helper: gfpflags_allow_blocking(gfp_mask))
> 
> Right.
> 
> > Another option is probably we can remove cond_resched(); from unmap path?
> 
> I'm wondering if removing cond_resched() from the unmap path would reintroduce
> the softlockup issue fixed by below commit:
> 
> commit e47110e90584a22e9980510b00d0dfad3a83354e
> Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Date:   Thu Aug 20 17:42:05 2020 -0700
> 
>     mm/vunmap: add cond_resched() in vunmap_pmd_range
>     
>     Like zap_pte_range add cond_resched so that we can avoid softlockups as
>     reported below.  On non-preemptible kernel with large I/O map region (like
>     the one we get when using persistent memory with sector mode), an unmap of
>     the namespace can report below softlockups.
>     
>     22724.027334] watchdog: BUG: soft lockup - CPU#49 stuck for 23s! [ndctl:50777]
>      NIP [c0000000000dc224] plpar_hcall+0x38/0x58
>      LR [c0000000000d8898] pSeries_lpar_hpte_invalidate+0x68/0xb0
>      Call Trace:
>         flush_hash_page+0x114/0x200
>         hpte_need_flush+0x2dc/0x540
>         vunmap_page_range+0x538/0x6f0
>         free_unmap_vmap_area+0x30/0x70
>         remove_vm_area+0xfc/0x140
>         __vunmap+0x68/0x270
>         __iounmap.part.0+0x34/0x60
>         memunmap+0x54/0x70
>         release_nodes+0x28c/0x300
>         device_release_driver_internal+0x16c/0x280
>         unbind_store+0x124/0x170
>         drv_attr_store+0x44/0x60
>         sysfs_kf_write+0x64/0x90
>         kernfs_fop_write+0x1b0/0x290
>         __vfs_write+0x3c/0x70
>         vfs_write+0xd8/0x260
>         ksys_write+0xdc/0x130
>         system_call+0x5c/0x70
> 
> Even though we gained lazy MMU mode after that issue was fixed, I suspect I
> may be missing some technical details. Could you walk me through the reasoning
> for removing this cond_resched()?
> 
This is a good point. And you showed the good example why it is
a bad idea to remove it. I was thinking about this as preventing
CPU hogging by unmap path and you proved it.

Checking gfp sounds like is a correct away to address AI concern
which is correct.

--
Uladzislau Rezki
