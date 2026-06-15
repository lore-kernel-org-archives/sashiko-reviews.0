Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6EF3033DE
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 18:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781546964; cv=none; b=DxuCYOyHuk61oG7rDpE9KFpzvJEH4e0DOBDCDfEu10x/2lJioRo2m/nCnIoToDAtq80kTTlHpprHU0jF3NzC6Te1ZXbvTinI12x1XvUzygmaMy0ihpE4NwiWk5qxQBx09maPPivVM321dUUysSbbPErv353SezoqBEBC8BaIX1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781546964; c=relaxed/simple;
	bh=cIcn2xttQ5klb0NyKZZ5C7CekwHC9plrngiBWprQ1W8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mMe+w+qQ81lQOzkR2XSN7PwIESA7gdsO2JW+17RNNLT0NOWIQBBiX39J/HTd3FIrW0PPe2Lnml3+0EhM8ebQss8DvnWk19Bna3Loz6/nLQxKodHL7g7TtfsGjIreX4BaVTVLldfQqqKcEnRUmzx32rcjljM8B1R/fquXe6cp+V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CqHfns0e; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CqHfns0e"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c85dc345ac8so2040329a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 11:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781546963; x=1782151763; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nnv7BB4g0plBk06nDCaqvSeCAkEy9nM4C7RFf19+vk4=;
        b=CqHfns0eq6c7H+I4gCo8nlulrscICGNsKnroG5MSvXoctq1UIw6NKFW9F/0C+Qgmpi
         jfGKSaYaNwXHwp6L3dBud8prxFZKa0YCiAfuD2lnq55wtavf6i2mvFZ2pBWQmBMc66yO
         zXQ4nZ3MmzaZqbWTLBgleKJQo9QR/3q+PRcrv/gs/wA8KJKreU5xNZqUzoVitOWxF3qA
         ZXS88RH2/vu0bomnkN0dMxneAfnbWVS4ny5aYLqozV30Kj/USwr35+X50eb6/MDIEvI4
         i5xATeYuj76OUUxVyjbROVDMmzbr5S3v/Y4bTydbvdCZf2OawbQ/aYc+yUHKlKMp8fbZ
         PoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781546963; x=1782151763;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nnv7BB4g0plBk06nDCaqvSeCAkEy9nM4C7RFf19+vk4=;
        b=Dr9y+kKQlFt+7Bj9MW/un3pHjGFC4yl/+jUy3ahRs8kFnhVRp8qvip4QwdrNURT4gi
         n8tEvs9aO64vpQ/Wa1Wer8lnyNtIEXjVkzUb1X3InDokgcV7zdd98pcgSTrqObE7v3aa
         4z+MAReCdod9X9ZK6ZBF8hLCgbMAbnLJkOUq8pkJrlRMEapT9xf9FbXFgmeclX4Jvvvz
         MXEEN7RPoXjhMxLYDT+CR0Jvgwf6+l7YBESO2JKa3EIMnM2saoObTEr/V959ie9/UYvc
         DM9+z/fDDOGHJvQvXhlW3SQh9sLOz+XBZzW5ail/wz4rD9bZPJP7PnLKOknJA94/8eLX
         Xn2g==
X-Gm-Message-State: AOJu0YzE5tInm5ZCmQ1gFc9Z/5pBBt1igRKedsBEWDD8YzbmHCvZ2lUH
	pMpEVm9t/dPsE019nnaETeKldH9whgi62aIlW2ndMkZ3rABQiAfpPPd3mx6HhXqmrw3WhOSZpse
	HFK+I56Zu49IAsy2NDrkeXiSI98xvF71Mt+12UNofF9moPSNNCnSi7Y/y9kXZDbRRebzUdqlyo7
	Ef29FdvuVTH7aW11mvT/PWXe0zi9hTLrqoVDc05CwKQ/ZbCnwl
X-Received: from pgy34.prod.google.com ([2002:a63:1862:0:b0:c85:88eb:3619])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2986:b0:3b4:b276:c5dc
 with SMTP id adf61e73a8af0-3b79624ea92mr13440922637.3.1781546962414; Mon, 15
 Jun 2026 11:09:22 -0700 (PDT)
Date: Mon, 15 Jun 2026 11:09:21 -0700
In-Reply-To: <ajA6ogaNiI3KDv5i@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260615155244.183044-1-alexandru.elisei@arm.com>
 <20260615160901.9A1A61F000E9@smtp.kernel.org> <ajA6ogaNiI3KDv5i@google.com>
Message-ID: <ajA_0TQCQLSz7qcU@google.com>
Subject: Re: [RFC PATCH] KVM: Ignore MMU notifiers for guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, Jun 15, 2026, Sean Christopherson wrote:
> On Mon, Jun 15, 2026, sashiko-bot@kernel.org wrote:
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > [ ... ]
> > > @@ -592,6 +592,10 @@ static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
> > >  			unsigned long hva_start, hva_end;
> > >  
> > >  			slot = container_of(node, struct kvm_memory_slot, hva_node[slots->node_idx]);
> > > +
> > > +			if (kvm_slot_has_gmem(slot) && kvm_memslot_is_gmem_only(slot))
> > > +				continue;
> > > +
> > 
> > [Severity: Critical]
> > Does this change inadvertently introduce a regression in the pfncache retry
> > protocol?
> > 
> > Looking at the pfncache framework, it maps guest memory into kernel space and
> > explicitly drops the page reference after mapping it:
> > 
> > virt/kvm/pfncache.c:hva_to_pfn_retry() {
> >     ...
> >     kvm_release_page_clean(page);
> >     ...
> > }
> > 
> > It appears to rely entirely on KVM's MMU notifiers (kvm->mmu_invalidate_seq)
> > to invalidate the cache when the page is unmapped by the host.
> > 
> > If a VMM defines a guest_memfd-backed memslot with KVM_MEMSLOT_GMEM_ONLY
> > but still provides a valid anonymous user mapping as its userspace_addr,
> > could this regression lead to a use-after-free?
> 
> Sadly, yes.  To land this, we would need to first teach the gfn_to_pfn_cache code
> to be able to pull directly from guest_memfd.  I forget if anyone is working on
> that.

Actually, we just need to ensure the invalidation tracking is updated, the MMU
itself can be left as-is.

Compile tested only, but this?

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 27498e990dff..690ab707816b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -260,6 +260,7 @@ union kvm_mmu_notifier_arg {
 enum kvm_gfn_range_filter {
        KVM_FILTER_SHARED               = BIT(0),
        KVM_FILTER_PRIVATE              = BIT(1),
+       KVM_FILTER_USERSPACE_MAPPINGS   = BIT(2),
 };
 
 struct kvm_gfn_range {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e44c20c04961..84b693de7e35 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -608,7 +608,8 @@ static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
                         * HVA-based notifications aren't relevant to private
                         * mappings as they don't have a userspace mapping.
                         */
-                       gfn_range.attr_filter = KVM_FILTER_SHARED;
+                       gfn_range.attr_filter = KVM_FILTER_SHARED |
+                                               KVM_FILTER_USERSPACE_MAPPINGS;
 
                        /*
                         * {gfn(page) | page intersects with [hva_start, hva_end)} =
@@ -715,6 +716,21 @@ void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
 bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
        kvm_mmu_invalidate_range_add(kvm, range->start, range->end);
+
+       /*
+        * When reacting to changes in userspace mappings, don't unmap memslots
+        * that are guest_memfd-only, in which case KVM's MMU mappings are
+        * pulled directly from guest_memfd, i.e. don't depend on the userspace
+        * mappings.
+        *
+        * TODO: Skip gmem-only memslots on mmu_notifier events entirely, once
+        * gfn_to_pfn_cache is also wired up to directly pull from guest_memfd.
+        */
+       if (range->attr_filter & KVM_FILTER_USERSPACE_MAPPINGS &&
+           kvm_slot_has_gmem(range->slot) &&
+           kvm_memslot_is_gmem_only(range->slot))
+               return false;
+
        return kvm_unmap_gfn_range(kvm, range);
 }
