Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE1C30E84F
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 23:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782430123; cv=none; b=RRxhOnNWH7ZcsapGNyTHEIARxFEvDnVXIm3O5byYIjbIJ8mts4dt195UUZgrTJHI3JV1E9l05M14RiCty2bPSkj5KsawnydEf6NxCFPaVpiYT+AIJerrYRs+BdBOSiS/a/bfgW1J7+12aK77GMBlwx3la7dMC+EVMGBv4N6nhwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782430123; c=relaxed/simple;
	bh=ZCAkH+xedLC974s70lqPHKEO378XM8t31mniP99gyDE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QksKwiWg4g/wU7qN529I6QKcRwr7Eri01vOD+pvr3HWlsMmQoAmlO2VHERzhPnUs6TxIJZbNKPflGyp8L57BFIjXHkNrETTBAQYyAvznDcCiwSlr/J8LG4Iu+BsKHk7ghqQ9YD3y9U2MdISEonD/NgaTunBTOorCDHrTGQNYbB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lhEIrzyE; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lhEIrzyE"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c88fc985a65so173660a12.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 16:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782430121; x=1783034921; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Adu3youXk5jBWsdVYxNzHJOETlFD4QHsr+rzQpT1Zc=;
        b=lhEIrzyEUIdYVu/y2b+Bf50dC3NkRClSH2Y5pV5d701UkI4Z4e6yWMq739YcVQ+CW5
         SnZAPHCGw5A0iZ10ow3t9/JZJng7leJ36oOCUdt1rnsgD26d5EYhMMGj2LyKcivNlEH1
         jVmX71zupp/du0G2dDXkZK48FL9JG6m6ZIE04lWCd8COc4RGGzcKSgLsD79BFAh208Yf
         kuRMmdRv/fzy9rnxQXTKwABxR+1WWRp4Xket2s3emWvuBaNyCplR25TKCuDmRNAb7vn/
         AUWpXksrHd3sD4cN4ZQr8mCR9y1y7tbwMzhxr7grVcYr9jFVQD7OS2/oBVT6bDFh7YxL
         dKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782430121; x=1783034921;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Adu3youXk5jBWsdVYxNzHJOETlFD4QHsr+rzQpT1Zc=;
        b=boazgOUfMX9bnZ3T2VssVXHxbZMH+XMVRalOND5VECQOx2TqjebDANkFueWMMzzbUI
         OF6LVPXaRiC1eqCwFDq5fZb7y/iBniDOf8Av1SUUdnjGmOxUPFmeTpYlSCUlrYe2ph/Q
         aG9U7ELL39koPPS+f+f6o/9z9npqm0APNL0U/bDKhPQTap9koYK8vMg0y93PdVRbFXN9
         sDre/fHjcdHN1SxoqFNyD/9Dpe1/7kquJ/2p6fT2UhLasUlt78vSr/0NY8C7K7UGxm2n
         n/WsAkn6LXD5jrBqQD7yryiAAKF7/fAJBeGr6P0OxGwsAgk9qj9j9Hzl2HFjzQcHIu+H
         wT/g==
X-Gm-Message-State: AOJu0Yzv+NHpWvtInIWHXgF0LY5RJHcDgDs8izCsHADqlsGk5j07YPZQ
	e/jXqF2pGH91rBt4f4PD3mCJFzh6M5GrF7qlFLVy+Ci+bT+0tU056FOzb8zM3Jr2wQToD1Unzb7
	wmfXm+QoMK1W7dNuKbRaPxKGcFJ3gHWdQbQs8RmswDxJsIv67pR2TF21L9oXgeqE+fWpKXSwi26
	MQLPlN/xmPHbTiBDPZDIBVSg99ZHxr3Qgp/WzR8K3l+pUveD5K
X-Received: from pfblb23.prod.google.com ([2002:a05:6a00:4f17:b0:845:c97f:3274])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a80a:b0:835:6bdf:c87f
 with SMTP id d2e1a72fcca58-845b39c510amr5819480b3a.9.1782430121110; Thu, 25
 Jun 2026 16:28:41 -0700 (PDT)
Date: Thu, 25 Jun 2026 16:28:40 -0700
In-Reply-To: <20260625224517.6BB7D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260625222229.3367197-1-seanjc@google.com> <20260625222229.3367197-6-seanjc@google.com>
 <20260625224517.6BB7D1F000E9@smtp.kernel.org>
Message-ID: <aj25qE6KRPcaEnxs@google.com>
Subject: Re: [PATCH 5/7] KVM: SEV: Forcefully invalidate SNP VMSA if its
 backing gmem page is zapped
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 25, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index 1618acc3ca647..8ec5041934dbc 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -185,6 +185,10 @@ static void __kvm_gmem_invalidate_start(struct gmem_file *f, pgoff_t start,
> >  		}
> >  
> >  		flush |= kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
> > +
> > +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
> > +		kvm_arch_gmem_invalidate_range(kvm, &gfn_range);
> > +#endif
> >  	}
> >  
> >  	if (flush)
> 
> [Severity: Critical]

*sigh*  If it's so critical, why couldn't you have found this in one of the
several times I had you review this off-list?

> Does this invalidation path cover the case where the memslot is unbound before
> the guest_memfd pages are freed?

Yes.  I think this would fix things?  I'll try to verify the bug and the fix...

diff --git arch/x86/kvm/mmu/mmu.c arch/x86/kvm/mmu/mmu.c
index 6c13da942bfc..2beb95394282 100644
--- arch/x86/kvm/mmu/mmu.c
+++ arch/x86/kvm/mmu/mmu.c
@@ -7560,8 +7560,14 @@ static void kvm_mmu_zap_memslot_pages_and_flush(struct kvm *kvm,
        kvm_mmu_remote_flush_or_zap(kvm, &invalid_list, flush);
 }
 
-static void kvm_mmu_zap_memslot(struct kvm *kvm,
-                               struct kvm_memory_slot *slot)
+static inline bool kvm_memslot_flush_zap_all(struct kvm *kvm)
+{
+       return kvm->arch.vm_type == KVM_X86_DEFAULT_VM &&
+              kvm_check_has_quirk(kvm, KVM_X86_QUIRK_SLOT_ZAP_ALL);
+}
+
+void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
+                                  struct kvm_memory_slot *slot)
 {
        struct kvm_gfn_range range = {
                .slot = slot,
@@ -7572,25 +7578,18 @@ static void kvm_mmu_zap_memslot(struct kvm *kvm,
        };
        bool flush;
 
-       write_lock(&kvm->mmu_lock);
-       flush = kvm_unmap_gfn_range(kvm, &range);
-       kvm_mmu_zap_memslot_pages_and_flush(kvm, slot, flush);
-       write_unlock(&kvm->mmu_lock);
-}
-
-static inline bool kvm_memslot_flush_zap_all(struct kvm *kvm)
-{
-       return kvm->arch.vm_type == KVM_X86_DEFAULT_VM &&
-              kvm_check_has_quirk(kvm, KVM_X86_QUIRK_SLOT_ZAP_ALL);
-}
-
-void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
-                                  struct kvm_memory_slot *slot)
-{
-       if (kvm_memslot_flush_zap_all(kvm))
+#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
+       if (slot->gmem.file)
+               kvm_arch_gmem_invalidate_range(kvm, &range);
+#endif
+       if (kvm_memslot_flush_zap_all(kvm)) {
                kvm_mmu_zap_all_fast(kvm);
-       else
-               kvm_mmu_zap_memslot(kvm, slot);
+       } else {
+               write_lock(&kvm->mmu_lock);
+               flush = kvm_unmap_gfn_range(kvm, &range);
+               kvm_mmu_zap_memslot_pages_and_flush(kvm, slot, flush);
+               write_unlock(&kvm->mmu_lock);
+       }
 }
 
 void kvm_mmu_invalidate_mmio_sptes(struct kvm *kvm, u64 gen)
