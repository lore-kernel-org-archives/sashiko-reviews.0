Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17B013B58C
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 00:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783643322; cv=none; b=sC9ysgud2cmtu3RIfAXlGPvayOhJaOqVoX/LWJNhiULcKO6+jfiS+ZTkWX+9LW3eZGWMyXWUUBAjCAiYvM8GHqoNKUnbfisygAjY/SfPEIuhDsu3NhfWM9pLZbLOpehrmoeynRT6+2ZHgLGDIUn/bT46BMwV6ztVDJEfdejDxMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783643322; c=relaxed/simple;
	bh=oudXyYGsAIqzBpHjdzCL38npN627lf3g6I+42msjg/g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K6QqMlc678KwsCEUimOGuiQLHMfR8ey5gAI3nl5LSJLsDXpedW2knnpmgDCNVdXor27fADTmYm6Gl4J1eTTP195I0cFqCwRRv+FpQVznK4k+0oIdWRrvL5gVrCuYmsBPTeyCL4zpAbcEMA53a/9TNo5pMhKoeTc7hSjeDTGPr9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ud1w1ceH; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ud1w1ceH"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2cc6dd43737so7331435ad.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 17:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783643320; x=1784248120; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vu6YzA2G9RSK45wx0bMoFgL65zeMC9NfowhXiVy+sE=;
        b=ud1w1ceHKHcM01H3VxQMODE9EBMy7Knn0yo4pPBTJPoRHoKB18uPIFsFZ2HyIMW/DI
         qsjUgLE754Kf7gyKqTTPkD4IUeQJNp2oC0t1ejpdZTy+LrOETOjoh3f8LDB90BbV8wGl
         2T6ohDtQ/H/nswYpfT9+Epud1rDYfZASYOCmzT4xprht1g9DRi+oRYv/lKh+fzhVTxQ8
         gb/G+1HVdWeXib4BCSif/Ds3WR+tSO3hHhdZDiX1mjXjl+uUz+zaCAKZMgfz4m7k08nY
         PcA3CsS+t2imQLtSYARKed+WBbDDCY2Yh8SJKlD0Nr7wzFwaElMRmWHht4Wb6eK0GvjJ
         8wUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783643320; x=1784248120;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vu6YzA2G9RSK45wx0bMoFgL65zeMC9NfowhXiVy+sE=;
        b=qPtFz7h0KMTgjlwnFwvZyMhGhcD/bTqSgRE5BcdIz1PAUOqpJgUuo5a+gnlbB/Svzo
         93jQIJj1qKUg1+2RXMNCQbWq+tCSMtzNiQ2PL8+ZtbU/gkPlWqEFcPuS0Xw4igL0E9fH
         aiVfuteWUHhTwCoKY8KJtPZMMRBAT7cZwugJdRgaJ88lqR4eqtzyK9DzkcQV/uicf1r8
         ZJKrZf5jFk7BZqs+DMJICARxrmdvl1m33Vuu2lQhjOIfhmvWGGw6KZ6CW30zkxGatkf+
         QM15HOJ3oJFMxm7bvaMy4/h4K7WbZLvDnzI9lOzgCRWWzsNwQqQOGi1fKjiMd60PmArx
         o4Og==
X-Gm-Message-State: AOJu0YxB4z1y194QvZvR+1yS/r6tg/A/YYtjDkksBx1onO85bkMgDs3q
	T+2qWaltaOEd7YsCql4L0BrvDjxT6OLidl7430LOhwsTnf0TJoFpAGNgltUsyD5FnOI7sY5sbny
	TT6wfNHzk1BnZQr3mR76YpUWF4p5Gn1tdS9he7MiCdDPqcox0HfmhaebfRz+3g0lttXNCOh59py
	qKU57c7UKAGoBUoc07TNfhW6ECZ/xYO7+TEtKrcTKadMlxq7vb
X-Received: from pllg6.prod.google.com ([2002:a17:902:7406:b0:2cc:6fb4:ce5a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf0f:b0:2cc:670d:9b1f
 with SMTP id d9443c01a7336-2ccea4290f0mr92923155ad.28.1783643320075; Thu, 09
 Jul 2026 17:28:40 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:28:39 -0700
In-Reply-To: <20260709210728.1205A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260709204948.1988414-1-seanjc@google.com> <20260709204948.1988414-2-seanjc@google.com>
 <20260709210728.1205A1F000E9@smtp.kernel.org>
Message-ID: <alA8t6uSyUw8oF5k@google.com>
Subject: Re: [PATCH v4 01/18] KVM: SEV: Track the GPA of the guest-controlled
 VMSA used for SNP guests
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 09, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > index 74fb15551e83f..827f5dc061023 100644
> > --- a/arch/x86/kvm/svm/sev.c
> > +++ b/arch/x86/kvm/svm/sev.c
> [ ... ]
> > @@ -4039,6 +4040,7 @@ static void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu)
> >  	svm->sev_es.snp_has_guest_vmsa = true;
> >  
> >  	/* Use the new VMSA */
> > +	svm->sev_es.snp_guest_vmsa_gpa = gfn_to_gpa(gfn);
> >  	svm->vmcb->control.vmsa_pa = pfn_to_hpa(pfn);
> 
> [Severity: Critical]
> This is a pre-existing issue, but does this bypass the MMU invalidation retry
> protocol?
> 
> Looking at sev_snp_init_protected_guest_state(), KVM resolves the PFN via
> kvm_gmem_get_pfn(), directly installs it into the hardware VMCB, and drops
> the page reference:
> 
> 	if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, &page, NULL))
> 		return;
> 	...
> 	svm->vmcb->control.vmsa_pa = pfn_to_hpa(pfn);
> 	...
> 	kvm_release_page_clean(page);
> 
> Can this race with a concurrent guest_memfd hole punch if kvm->mmu_lock isn't
> held and the invalidation sequence counter isn't verified?
> 
> If the page is freed back to the host allocator, could the hardware continue
> to use a freed host physical page for the VMSA, leading to a physical
> use-after-free?

Read the cover letter?
