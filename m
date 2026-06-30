Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7D02F6918
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 21:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854856; cv=none; b=ZX191Txk51TAiqWFSmkoDKOjMJKsel8J0RghxtUy8H+pJLWBKN6lCW3B6niVwFNx6WCLvLP5bd4/LUP1mMT3H4PSHR7PyPGb4DKFMHlRD3viWZBP+WP5zkf6Yg7L/VToQaq7+I+vhZAb9Svs8YIobr/Zxgc5Q6QNxAD+QYPnSgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854856; c=relaxed/simple;
	bh=vLjNoL+SKTKzAFgZ/zHzNmMEtP1L0SW73bb+C8wvkj8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HRTJIKMnJsYxwLVwlSar0skVsfUBnx71xZdIJedzxVDXFfxFXltx6umfsOnEoMFZfKjKQCKC43/G5Hek+PLd6o1sa2zh0+5is74xzFjRMTrZVp1x9b4KquWs4MGiyShADb/Ak8yb+92HIXZknTm4ZlErGrFeZeED0tqFv2UJ8dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ku6Sa47L; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ku6Sa47L"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c9b71388fbso52646915ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 14:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782854855; x=1783459655; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rVDe7KS7mIi3eI2da6sI/3OeXJKsaxKL11W5ZtPqYz0=;
        b=ku6Sa47LCDkASOEICgVui2d11hEOOlbqwR0iiPMSGOuk5ckMKoNTRs7I2C/RmNvLdE
         bdi+TplxZoEMWULs6vfrgkIXYoET+fBnP8o3KU0t2X08gwLUkbL5zg+xSQF+TvX0/K8O
         5eFHTaPnoAV14NjdPg3KGElz347RPa4wke7NIq6bV+f7j7jN1Z6CHh+7yuiPjxAYUb4W
         QHBJPrqc84le0ntgF26BN49Nlv/wGr/jCBUUiYnFxl/kOfFg9ZbVWpH17twO1X4J3hXW
         s1FRKT9vOkmqzywNAKPKvBTRkK4xCM9woxdYtEkO9N8Hgn+hA+50kgJ9LuwkBJ8RTJRJ
         s8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854855; x=1783459655;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVDe7KS7mIi3eI2da6sI/3OeXJKsaxKL11W5ZtPqYz0=;
        b=lSPbwyj0tIX5h2d/gfYTw9oTvZWZCUOocnd2kRhSR3rKdAumK55QJKGeeLFEZHCzUv
         lHLROVZijZBvvjoX29C5KZhan0u4kBnOmqTW8GPBCgPrHP5fsD0O+ou0unWa0QFS68j1
         4hqKNa+4t3aBWLen4Ejvn+xqZyAk59gT4t6r1t7M8wI24AdFYP5BGEVZmZT3eqlgZZtn
         kSKMEFGv2Iax/6987Aoteduw7v847aLrEhElKcqNBE5arD2YfLCnalmUwYQVELb6hCtX
         51S7O5gf7iiVjq2etpXp+k3ft/kTk9dC4DtSXY1bZ9E3BVhraZVlo86oriNZm7zLk2YQ
         PVPg==
X-Gm-Message-State: AOJu0YzXRfGis5/LLOxQg6nGjIg2CWLmG46mgj16lAbPlbXf7mT8SxOw
	1XxvremqpTVI7Mvse0HJaMtY9gZ2ZBDLUpNBO0UNZDu38DL6SuYAimfp8oRsBw9hrN6hOc2lGYB
	q/A6OfWacfgCzd4uVeR+ovp1iW1NKjDNIX6DrwprHUbXukozgpjeuDathXyiGI05SuuqxSJzF0l
	KsNHv7YeGgIMNACqpXETyh+9LfuxMsaEfhU7MLyyVoLy7lE2LT
X-Received: from plbkw14.prod.google.com ([2002:a17:902:f90e:b0:2c7:37d5:c0cc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e546:b0:2c9:d298:6c06
 with SMTP id d9443c01a7336-2ca2e714345mr42643205ad.25.1782854854363; Tue, 30
 Jun 2026 14:27:34 -0700 (PDT)
Date: Tue, 30 Jun 2026 14:27:33 -0700
In-Reply-To: <20260630211556.05EA91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260630210156.457151-1-seanjc@google.com> <20260630210156.457151-4-seanjc@google.com>
 <20260630211556.05EA91F000E9@smtp.kernel.org>
Message-ID: <akQ0xSvDXSVoLC6e@google.com>
Subject: Re: [PATCH v2 3/3] KVM: SVM: Remove VM from the GA Log notifier list
 before VM destruction
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 30, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> > index d71a2fed1a08b..c5b1d294b15a2 100644
> > --- a/arch/x86/kvm/svm/avic.c
> > +++ b/arch/x86/kvm/svm/avic.c
> > @@ -374,9 +374,20 @@ int avic_vcpu_precreate(struct kvm *kvm)
> >  	return 0;
> >  }
> >  
> > +void avic_vm_pre_destroy(struct kvm *kvm)
> > +{
> > +	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
> > +
> > +	if (WARN_ON_ONCE(!enable_apicv) || !kvm_svm->avic_vm_id)
> > +		return;
> > +
> > +	guard(spinlock_irqsave)(&svm_vm_data_hash_lock);
> > +
> > +	hash_del(&kvm_svm->hnode);
> > +}
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but could there still be a
> Time-Of-Check to Time-Of-Use race in avic_ga_log_notifier()?
> 
> If a notification arrives and avic_ga_log_notifier() finds the VM and its
> vCPU pointer under svm_vm_data_hash_lock, it drops the lock before calling
> kvm_vcpu_wake_up():
> 
> arch/x86/kvm/svm/avic.c:avic_ga_log_notifier() {
>     ...
>     spin_unlock_irqrestore(&svm_vm_data_hash_lock, flags);
> 
>     if (vcpu)
>         kvm_vcpu_wake_up(vcpu);
> }
> 
> If avic_ga_log_notifier() is preempted right after releasing the lock,
> couldn't avic_vm_pre_destroy() still run concurrently, remove the VM from
> the hash table here, and allow the remaining teardown process to free the
> vCPUs?
> 
> Would this result in avic_ga_log_notifier() calling kvm_vcpu_wake_up()
> on a freed vCPU pointer once it resumes execution?

Ugh, yes, that's theoretically possible.  I *think* we can simply move the call
to kvm_vcpu_wake_up() inside the spinlock.  There is a potential deadlock that's
near this code[*], but I don't think svm_vm_data_hash_lock will have the same
problem as ir_list_lock?  Regardless, I'll tackle this one in a separate patch,
unless it looks like we'll have to completely redo the entire scheme.

[*] https://lore.kernel.org/all/aUmdSb3d7Z5REMLk@google.com
