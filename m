Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590264;
	b=ItCIgXDpmMWNVSsYoZ5YUeYLl3bdpG8bZdzWurpW+xieRmNUSK19hAmf1vcxSRnuFHeH
	 PfjGQYScbQnN8mmHDzbjm32Dj/IKFiZyVLCMIg5J4Mcq/XwT3zXlTTI3eveqkPKevVNV/
	 m9qDCJ83RFJTqpWWDOKYptjEsm+yIVpgXxEFHSiPxkV9UEv57JJMoS6X6FV9h2zzpOTbY
	 LLQsEbEokM5cqwSbz9kUJHg2LK9fSLqFKE0Y2Es1KRuzV1GmK5BnGynzUOdsikklbVNhE
	 cPf/SPPvivfaYyl+J7pXWMEnk89K1FYjJ6WAVWqU+N7NbqBJmu32Uusaw41G7rRh47Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=nvhnqNnm7EM5SLclAEUC92CRUKwUHl9E1jDz3+lLVx8=;
	b=wFTskNpo8ytic/kymUFT90dmS6hnMM9ah+tGgYGOiqQYCTqZaQuNIW+hl7h2xO/HhhoW
	 W4uJCSnYq9u2D+ZuAQzpBkjG6W/mZc68pINhZ4wSQXSyAfD6fzDXEH74E32aSvNf/Iq1n
	 iNy+wj2wPBXnE90tjmbQZhwBS1TIs07ajoGNmibu9u0JzRVV2ypSRcKZq0rgmtSWyCixG
	 UgnnBy+/QEr1i9efbbF+ORMlZmwzChUoew/RRITzcYQgS8pN3voeSmlefMegwuQxsmzAT
	 BpMIws1OQ0AL4hWXsSTWaHTMI/PDzx9xswrK2OBRkeGp6Lwmx0P2mEI7ZuqC2irlFqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GooE9cVO;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B595B60A3817
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 17:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B595B60A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GooE9cVO
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso1003820a91.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 09:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794590263; x=1795195063; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvhnqNnm7EM5SLclAEUC92CRUKwUHl9E1jDz3+lLVx8=;
        b=GooE9cVOxDkimkAEGuanrAYMyhTQNid9Ld3tbRhnm9b2zNzxgbteP53WjyoEHpyj3V
         ffNxYXfNtFlmpg9ZKVUMWnznJCiR13eKq2XWPIb6cTaeCS7y0VrJ3zLQoUDV2GcHIyC5
         vV8bVmD5k/Z6sAZWWkrfYvJtltW8zGPm+pD/UGJhIWE5P1RNzokxLF3NHUcus9viIiyR
         m0EXkCtrtY+R3D7mYVDvwO33j2Y4HzchQwH8NKFzqWcT+AmaCF5ajXsKcVHt+fAirLDu
         rbdLHV280JPtXF8z9arifneUgKkJl0fjRwoXQskpu7mCuc7aRgfMgvUMhQ782eOBD27z
         zi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590263; x=1795195063;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvhnqNnm7EM5SLclAEUC92CRUKwUHl9E1jDz3+lLVx8=;
        b=HW90oM7edhqgE8kRfpmsJM9OCOqSPU9iExbDt6DdGAL5ZGsvfecUuXiev2YY0OAujY
         dSpagXAZInWyYkC+0a3/f062p4SH2c0jOh1Fqb7EHgtKws0lRxSo9kZL8BYBeVwv93r9
         XNUIgvgmWYpCu7EVIp5FHaohqPweDBSpccWEE560EPA5uQHFxztaWWGrv45AmZrrw4rK
         K9vD4S8EexZyu8f9AUssH2H4eM1JfIdibwof33b1zwTJNs27igshaWEXqTadSijj88SS
         6Ij7HIWXq87WxgxMMJPxKS0rcLsadu4g3hVEHt2NcNRTuHeq+LbpGvS2ZctOcouBaiWa
         tcew==
X-Gm-Message-State: APuU4Z9zto97mvT+TvfYwtTD59cNMXK0ZvPNjfSwBuAU+NWvuaknhtyE
	8iwESW0M4HuUToChoVvKImM+4hcPNbCQCCoUFVU0mM0SuEYH4P2JePkapeWUxaNEIL1Aiw5y+jL
	GCgEFEk/8bO9WaIM2QhZRSgvL7wzKiBFv46EsaAUBoRmmlCaK5dDUQ3AcTL4hSLDCoKlQM1LkQe
	vDdukJzW27PYQDOZfP3ox2dw+aDnghftFX/ja/VhB/nNlSxkL0
X-Received: from pjbbs18.prod.google.com ([2002:a17:90a:f212:b0:3ae:49df:251a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:56cb:b0:3b0:a9de:9880
 with SMTP id 98e67ed59e1d1-3b1b0a3c5e9mr2904745a91.33.1794590262694; Fri, 13
 Nov 2026 09:17:42 -0800 (PST)
Date: Fri, 13 Nov 2026 09:17:41 -0800
In-Reply-To: <sashiko-outbox-213282@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261113164000.467175-1-seanjc@google.com> <sashiko-outbox-213282@kernel.org>
Message-ID: <avdGNbOO4562tk10@google.com>
Subject: Re: [PATCH v3] KVM: Skip gfn-based MMU notifier invalidations for
 guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 13, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index cf4cb586f1407..599dea22afb81 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -601,6 +601,10 @@ static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
> >  			unsigned long hva_start, hva_end;
> >  
> >  			slot = container_of(node, struct kvm_memory_slot, hva_node[slots->node_idx]);
> > +
> > +			if (kvm_slot_has_gmem(slot) && kvm_memslot_is_gmem_only(slot))
> > +				continue;
> 
> [Severity: Critical]
> Can skipping guest_memfd-only memslots here leave writable SPTEs installed by
> x86's kvm_mmu_prefetch_sptes() unzapped when the VMA at slot->userspace_addr
> is unmapped?
> 
> While __kvm_mmu_faultin_pfn() resolves the primary fault from guest_memfd for
> gmem-only memslots, the post-fault PTE prefetch paths (such as FNAME(fetch)()
> -> FNAME(pte_prefetch)() for nested EPT/NPT or shadow paging) call
> kvm_mmu_prefetch_sptes() for neighboring GFNs without checking
> kvm_memslot_is_gmem_only():
> 
> arch/x86/kvm/mmu/mmu.c:kvm_mmu_prefetch_sptes() {
> 	slot = gfn_to_memslot_dirty_bitmap(vcpu, gfn, access & ACC_WRITE_MASK);
> 	if (!slot)
> 		return false;
> 
> 	nr_pages = kvm_prefetch_pages(slot, gfn, pages, nr_pages);
> 	if (nr_pages <= 0)
> 		return false;
> 
> 	for (i = 0; i < nr_pages; i++, gfn++, sptep++) {
> 		mmu_set_spte(vcpu, slot, sptep, access, gfn,
> 			     page_to_pfn(pages[i]), NULL);
> 		...
> 		kvm_release_page_dirty(pages[i]);
> 	}
> }
> 
> kvm_prefetch_pages() resolves PFNs from slot->userspace_addr via
> get_user_pages_fast_only(), and kvm_mmu_prefetch_sptes() installs writable
> SPTEs and drops the page references.  With kvm_handle_hva_range() ignoring
> gmem-only memslots, unmapping or reclaiming the VMA at slot->userspace_addr
> will not zap those prefetched SPTEs, giving the guest a host page
> use-after-free.

Well fudge.  That's a bug that needs to be fixed irrespective of this patch,
though it obviously needs to land first.

The TDP MMU doesn't support automatic prefetching, yet[*], and I'm planning on
using the "normal" fault flow for that support, so I think we can just disable
prefetching for gmem-only slots without negatively impacting any real-world
workload, and punt on proper support until someone cares, e.g.

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f4b12d6aef55..a54196587235 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3245,6 +3245,9 @@ static bool kvm_mmu_prefetch_sptes(struct kvm_vcpu *vcpu, gfn_t gfn, u64 *sptep,
 	if (!slot)
 		return false;
 
+	if (kvm_memslot_is_gmem_only(slot))
+		return false;
+
 	nr_pages = kvm_prefetch_pages(slot, gfn, pages, nr_pages);
 	if (nr_pages <= 0)
 		return false;

[*] https://lore.kernel.org/all/20261028202607.1844883-4-seanjc@google.com
