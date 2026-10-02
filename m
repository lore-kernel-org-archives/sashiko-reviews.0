Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA7B49552B
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948189; cv=none; b=UWByX5Kp+jQ3o0WPIKPn+fQASEAVxZKLSYWCKq2XXvrexGQ80JbbyZz5gK0I7JM234bdmJ7nx19iNh+Z57peAeKrl/x+ZaCmHzBNaZlEATiZblsrbvhOnThZg08713xtmLgWF8Qz8XqBMwHNegYzJSl0265Q+sI6kfxEJUtaVoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948189; c=relaxed/simple;
	bh=QF+V7wNqKGgV7XYoB6glXEczeqS/jN2SsUOlgbKk4Gc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ClsA+Ur7Md9l6rHXHp4JojTrkXCtO1oiaI/EKGfdolG7mT2mqNThZug4t84PTjGqSYUWZdgBu++p3R2qjTOX8NK+cvnlGvvr8kzKZm5M1kYi3AiyoWy/110wOb2Hz887epuaZ+d88n5+znQpEzg4TS+lInc5e+kdN+OibaKy/gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BM3NbAEG; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BM3NbAEG"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a470ead068so5204744a91.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 06:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790948187; x=1791552987; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HH7Yz/iMGy273Km5ybMiRdHkxei7Nci6prC81C4z3FM=;
        b=BM3NbAEGqPIIX1iDCZmdFPM3a4XV6Sx7miKWxgp0dEIYwZOSTzGiWVz0rAEhdtFAOZ
         uMOFcaJuz1bkAi7ojPBmEEnN/yMmLWZhCDS2pSHZx1frH4lLxvSveN2NfsfjVXCGzYCA
         BgbSM7E85wl9qQHS4KMJzNHp/ddtYNLq4mB4CGo310FJ4PQX2/C1txxihRgYqSVmQ6fe
         jutVFRDE9cqjiY7Q/I/nUwg+hGQM74oJhvdWKQltPZO/gVcBU2NSiVo7vGiLEBstlWeW
         u3aoy4sk3SuuKb7rdsyZ2AXAxy/H5LejofPm7LULO91VcSLrDEFVlS/Vv9y4TDSo4yL6
         Q+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790948187; x=1791552987;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HH7Yz/iMGy273Km5ybMiRdHkxei7Nci6prC81C4z3FM=;
        b=MytcfrUYyQEQLeZCe4q0yCtC8APDkX+IIXY1PamIS9TR+kZgO8fxVW/8pYYorfq6fM
         lkQ1yjx3ocTxA3H9fbDyAPfH1ULWddQ/yvS6+8qgHuKufXZhwp28VV3oSIquBcxSEFrP
         6hTIndqZo88PJ0whwmNK84KDiCvBDz7RQ0Y9Nw6gjroqt/3d4gKGVX5rKCtJqOLJGq7B
         QoDT2rfprjAF3cnxtGQS+Sdv7NbdggdnKt5bXb2HUFujwXikLpqfGo3X4/+qVr1hEp8N
         ecg+ed8CEEX7MpVDlJNRGEVY58lIv90t4wrL3ZBhl1grgu7QFvgYroGYCfIXscFwiIlS
         8BuA==
X-Gm-Message-State: AFq9FYLW0Wq40b0XWiceWoT2VbYf8UiUSyfFcThRz1IO6p6jba72zfJs
	OS4lz8fNaViF9tStU+FaS0Tm+7u3gguahXwvt+VIU3nJzJUX8UEIuFa89QKM07u+Gli5urY41Tj
	ytkeUDlqIDB/VppPC0z1QjJ5pVgWYp3oFdERLnWn1q+vtbVBnnc+6Y4t7CWLxPgQiNf+dY2ej3M
	DKKl7E1GMOAczJEJfM4jSJLO06ngP4aDxZ9mICM3TgIjzHgABz
X-Received: from pjbic4.prod.google.com ([2002:a17:90b:4144:b0:3a4:e23e:7b0c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:f17:b0:3a6:e159:a22b
 with SMTP id 98e67ed59e1d1-3a6e159b4demr648478a91.34.1790948186809; Fri, 02
 Oct 2026 06:36:26 -0700 (PDT)
Date: Fri, 2 Oct 2026 06:36:25 -0700
In-Reply-To: <20261002091342.50ADA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261001202234.3794060-1-seanjc@google.com> <20261001202234.3794060-4-seanjc@google.com>
 <20261002091342.50ADA1F000FF@smtp.kernel.org>
Message-ID: <ar-y8vCZt84a_xm7@google.com>
Subject: Re: [PATCH v2 03/10] KVM: x86: Unmap VMAs for KVM-internal memslots
 when the memslot is freed
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 02, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] kvm: double unmap of internal memslot VMA causes host UAF
> --
> 
> commit 120ca6d762cdf95d09e394aff4bb4af6d01288d6
> Author: Sean Christopherson <seanjc@google.com>
> KVM: x86: Unmap VMAs for KVM-internal memslots when the memslot is freed
> 
> This commit unmaps KVM-created VMAs for KVM-internal memslots when the
> associated memslot is freed directly, instead of using x86's internal API,
> to prevent VMA leaks on teardown.
> 
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 79468ddfe4736..e91bd79dd3cc6 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> 
> [ ... ]
> 
> > @@ -10066,6 +10048,16 @@ void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
> >  	}
> >  
> >  	kvm_page_track_free_memslot(slot);
> > +
> > +	/*
> > +	 * Free memory regions allocated on behalf of userspace, unless the
> > +	 * memory map has changed due to process exit or fd copying.  Leak the
> > +	 * mapping on failure, e.g. if the task is killed, worst case scenario,
> > +	 * the page(s) will be reclaimed when the process exits.
> > +	 */
> > +	if (current->mm == kvm->mm && slot->id >= KVM_USER_MEM_SLOTS &&
> > +	    !WARN_ON_ONCE(!slot->npages))
> > +		vm_munmap(slot->userspace_addr, slot->npages * PAGE_SIZE);
> >  }
> 
> [Severity: High]
> Does this unconditionally unmap the VMA for every freed internal memslot object,
> potentially leading to a double unmap?
> 
> In __x86_set_memory_region(), the twin memslot objects are created with the

Ugh, SMM, which is the "twin" aspect Sashiko is referring to.

> exact same userspace_addr for each address space:
> 
> 	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
> 		struct kvm_userspace_memory_region2 m;
> 
> 		m.slot = id | (i << 16);
> 		m.flags = 0;
> 		m.guest_phys_addr = gpa;
> 		m.userspace_addr = hva;
> ...
> 
> When the VM is destroyed or the memslot is deleted, KVM iterates over all
> address spaces and calls kvm_arch_free_memslot() for each memslot object.
> 
> Because vm_munmap() is called here without checking if slot->as_id is 0, could
> it unmap the same HVA range multiple times?

Heh, I arrived at the same conclusion before reading this.

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e91bd79dd3cc..e55aa26e26cc 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10050,13 +10050,15 @@ void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 	kvm_page_track_free_memslot(slot);
 
 	/*
-	 * Free memory regions allocated on behalf of userspace, unless the
-	 * memory map has changed due to process exit or fd copying.  Leak the
-	 * mapping on failure, e.g. if the task is killed, worst case scenario,
-	 * the page(s) will be reclaimed when the process exits.
+	 * Unmap VMAs allocated on behalf of userspace for internal memslots,
+	 * unless the memory map has changed due to process exit or fd copying.
+	 * Do the unmap only for the non-SMM slot, as the same VMA is used for
+	 * both non-SMM and SMM memslots.  Leak the mapping on failure, e.g.
+	 * if the task is killed.  Worst case scenario, the page(s) will be
+	 * reclaimed when the process exits.
 	 */
 	if (current->mm == kvm->mm && slot->id >= KVM_USER_MEM_SLOTS &&
-	    !WARN_ON_ONCE(!slot->npages))
+	    !slot->as_id && !WARN_ON_ONCE(!slot->npages))
 		vm_munmap(slot->userspace_addr, slot->npages * PAGE_SIZE);
 }
