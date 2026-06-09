Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C41E47C5
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 00:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780965949; cv=none; b=eZF2uP5fId5QW7sZeci2eh9dS+WwZUC9hI0CFOyGR5toFVSVlT6IqOcR7TxmFyDquGH9D37Y6nB8yCjLj1zRvRlHocAK+vgfDjIFJVuuqHSjfwnzgFA8JmbygNC61JP+Cj3HFnAauEQe2B2+JbWnUmdyyONgLC+rGKkTO0l2WDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780965949; c=relaxed/simple;
	bh=I/tGt7KzcBETNAgm8Dtn6Epq7mEFNModkgfXeYn3IKc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=deDGFJ92XntwP9cEdT6cjz8U5f/i4vL3kPp5uZeFB8GG4n9gCNYJ5cBdBAfmTGRzikTTHbS5eDiTPFQAKh5Y3s63YYMJ2ATcIltuoJPyiv8LV7+msP+aF12HHdyJ2o6MP6mWQuwOBsPvp1xLsrZbbLzLxhaH6teK7X6KFjux7Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YUntBqiY; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YUntBqiY"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c85a366b61fso2836885a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 17:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780965946; x=1781570746; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/WefpHHOSV8JYGHScIIv9soq8IINRPl3fy/zAA/txa0=;
        b=YUntBqiYzoXzWbNczXnhbjy/54XDLfoGGMcM7wQ1c79RgNUTLONuEgSLQKc27apxza
         A3fvtv5500SQ/o6i8pY3KseyKmIhvf+rYncyIDyiyGFXiZUO7LUh572khnGnlbkTy85w
         mGvpBZODg+HQnahZBWzJLnPdroqmUUHXdc8PAvOeh8/F5xf45qKbiXRhv1hUK0ZCk4n+
         iYsNQ3anFWNJkERcS8Z3Wkx1M9OI95tDojF+RRyOtKb7RgFFwDt7tGbkpG9k0Shp9X/B
         qh97tVcq93+16Kqtdw4Qn8BX/rcS3yQS4BiZKBKbFJlyafFtys1hauio4m0fqa4H4m1P
         Gn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780965946; x=1781570746;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/WefpHHOSV8JYGHScIIv9soq8IINRPl3fy/zAA/txa0=;
        b=k8thcOpIghnHbu2nfeJ+ILTCXWB9NrZL/Tmf8PottUbSRodz+d6D3Y9lY64mRf+wtj
         CWxpl0NcaTggaPvWxrOW0Fa8P9dJ4vqndF7yGo9ODyCNUOqwo1b17U/2sDO3iiAOdWgW
         oJlL8z0URnTqnr6TaP0o6QBfL1MauSphX05MaXGLfP7Hf5UPvwc3mWLtnVO+coas3WO1
         4CNM4UUzjhh4sr7yVvIciNDgPtZKXGVkaHgZi+hAXbjdD/ZjsDRd1gERdkbYJRpMZFw4
         yK79G2RfKCyi9AA//HBSvbV5scrsk30J5xHBhNafr8ao6ysVc3wWMe8APDu2k7Ye4Z2M
         LnSA==
X-Forwarded-Encrypted: i=1; AFNElJ/fhxEa/T2CmYrTSMwo9e9SiVZULv23NCwM5NYT8IMzvr0dIqolgmLrRxupIjbI5F1jndtTpl+zEYXXy1XRBgk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQjgDMgv1NKHLX5oTEuglGp/kxNPJcwee5osHep+NUDMbXS0/0
	3AA21sQSjU+K2G6VsVbAygfHHF3+Ge19GfGHVGjBg0DgEyiLa48mg89lSLiDrIWD61trzMVGTY3
	TpO+pGg==
X-Received: from pgbl13.prod.google.com ([2002:a63:570d:0:b0:c82:295e:3b51])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:eec4:10b0:3b4:6265:3787
 with SMTP id adf61e73a8af0-3b4ccf49532mr11901169637.28.1780965946303; Mon, 08
 Jun 2026 17:45:46 -0700 (PDT)
Date: Mon, 8 Jun 2026 17:45:45 -0700
In-Reply-To: <3291d47ea5fdd6ee2f284cadb518473130954cfc.camel@infradead.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260530061932.7849D1F00893@smtp.kernel.org> <3291d47ea5fdd6ee2f284cadb518473130954cfc.camel@infradead.org>
Message-ID: <aidiOemcna1Un9wG@google.com>
Subject: Re: [PATCH v2 20/20] KVM: x86: Use gfn_to_pfn_cache for record_steal_time
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: sashiko-bot@kernel.org, pbonzini@redhat.com, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev, stollmc@amazon.com, dwmw@amazon.co.uk
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 02, 2026, David Woodhouse wrote:
> On Sat, 30 May 2026 06:19:32 +0000, sashiko-bot@kernel.org wrote:
> > [Severity: High]
> > Does this introduce a scheduling while atomic bug on non-PREEMPT_RT kernels?
> >
> > The CLASS(gpc_map_local, st_map) macro acquires a read_lock on gpc->lock,
> > which disables preemption. While this lock is held, if the guest supports
> > PV TLB flush, the code calls kvm_vcpu_flush_tlb_guest().
> >
> > If TDP is disabled (shadow paging), kvm_vcpu_flush_tlb_guest() calls
> > kvm_mmu_sync_roots() and eventually mmu_sync_children(). This path can yield
> > via cond_resched_rwlock_write(). Yielding while preemption is disabled by
> > the gpc read lock will trigger a BUG.
> 
> Ah, that issue exists in the previous versions too, but it's simple
> enough to fix. There's no particular timing constraint for flushing the
> TLB; it just have to be done before this vCPU ever runs again. It can
> just be moved to the end of the function after the lock is dropped.
> 
> That does mean record_steal_time() should use the explicit
> gpc_map_local_lock()/gpc_map_local_unlock() instead of the CLASS()
> macro, but that's easy enough.

Actually, we use KVM_REQ_TLB_FLUSH_GUEST and "optimize" the code for the rare
case where KVM already have a TLB flushed queued for the vCPU.  E.g. over two
patches (so that changing the order of the request processing is isolated):

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1b27dd9ba0aa..48234eeb246b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3764,7 +3764,7 @@ static void record_steal_time(struct kvm_vcpu *vcpu)
                trace_kvm_pv_tlb_flush(vcpu->vcpu_id,
                                       st_preempted & KVM_VCPU_FLUSH_TLB);
                if (st_preempted & KVM_VCPU_FLUSH_TLB)
-                       kvm_vcpu_flush_tlb_guest(vcpu);
+                       kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
        } else {
                WRITE_ONCE(st->preempted, 0);
                vcpu->arch.st.preempted = 0;
@@ -11165,6 +11165,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
                        if (unlikely(r))
                                goto out;
                }
+               if (kvm_check_request(KVM_REQ_STEAL_UPDATE, vcpu))
+                       record_steal_time(vcpu);
                if (kvm_check_request(KVM_REQ_MMU_SYNC, vcpu))
                        kvm_mmu_sync_roots(vcpu);
                if (kvm_check_request(KVM_REQ_LOAD_MMU_PGD, vcpu))
@@ -11214,8 +11216,6 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
                        r = 1;
                        goto out;
                }
-               if (kvm_check_request(KVM_REQ_STEAL_UPDATE, vcpu))
-                       record_steal_time(vcpu);
                if (kvm_check_request(KVM_REQ_PMU, vcpu))
                        kvm_pmu_handle_event(vcpu);
                if (kvm_check_request(KVM_REQ_PMI, vcpu))


KVM needs to ensure the RMW on st->preempted is atomic, to avoid re-introducing
the bug fixed by commit b043138246a4 ("x86/KVM: Make sure KVM_VCPU_FLUSH_TLB flag
is not missed"), but AFAICT there's nothing that requires to complete the TLB
flush before bumping the version, KVM just needs to service the flush before
entering the guest on that vCPU.
