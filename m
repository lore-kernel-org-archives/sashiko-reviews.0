Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D753D7A01
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 19:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780081900; cv=none; b=iw81nu3CkAPWHUJNCxJPvsqKgWHksJS+RJza3Fz1R9GqBAHr25Gu5bzyDV6l5AirHxErasYgwvX8R7l0kj82n1aVlKW2PR2qIlzLBcKq3OBW9vb0UXRhx8psxSCyD616eLIwLeODLOuy7wOObYlfVOo1c0/sd6BstxtMxbvSnt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780081900; c=relaxed/simple;
	bh=XCL6pT4c5JkNAYjAORu/J34rp3vl95jPcLX6SPbsxQE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z9D3SuCIg8J8hL5ZcYHZz26j1CM6GVNB8z+GhmerLaljH1GAmreFVFgkem6OFnjklZ0okr0j7UUABxnIK/abwiFdueq0a1XsfsjZ1AZH+2XKHJPxTWlNTl9BviyDbRTPH1HM3W4cee0nh1GkS7E7HY4HXMb1+X+3vSBLBT9nvvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BB/RQtiZ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BB/RQtiZ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so872636a91.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 12:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780081898; x=1780686698; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGf2b0zl7KNF02Ny2sf9L7d/ZekySQCYKyXImr4he1Y=;
        b=BB/RQtiZGXTHiSNIqcVzcbJLnHPGrsyN3YQ3zVXu4eemg/o9zpyR7XLH8tE9SS2ivY
         1qrf9eUoLctUSQmxNPSbiD6eZNfI3acBV1TPNlSVyAe23G1nPcW5lkuXu+kfnEJapJC5
         SOQDygbamAJkYx+JZ8C9i5N4MRmQeLrpv066g5LJy3aJl0ImPYF6MgmxnlnTvCQ+jCnJ
         hzT8QbuFfQcRhyqLmVEFXqAJHyTDWzfQKTOOssru0jXQftOFSAlz5bCSyUYH4uMpVgCC
         VYQeC6MnvqyXPVhR/WpdkjZM4QfqWyGi3drh5pkZWh2g+shzzvsO8B6yVf4y47NCT+UU
         EP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780081898; x=1780686698;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGf2b0zl7KNF02Ny2sf9L7d/ZekySQCYKyXImr4he1Y=;
        b=So5KwBvLqCJpYEBKbao0SSygWNzdRWwHnRLTnYhFES4leueJdguNIoaey86ukigUaa
         BXpgpweWd7CG43vLx1d7TwmztqOnbhCFa92ldNdUi1Z1CXlUO8DZP8T1WyG+xdkbejdn
         hoSahvjmE17raS2a2kerjmWKejdQiTR2xMlf5EFqeBrefCiF/FVWjLb6LAGslueZ+rQI
         p1WR/J8XEbjjJllZhGcthwRMLYthPdMOZtYy0Ymd/HvDTKA9JfyDRKS7tK4fGybYzOqZ
         r+j7OT/TxALT704VlObXTLuXrvjZAY+dP4xPMIY+9z6q8GYpts/pZi+jCVBVt0RYo9xI
         3DJA==
X-Gm-Message-State: AOJu0YxkLqr7H6FYZ5BVFUq5JlDDo47nKFQNvxKdrn4rUatZnoGacw4/
	8sLpkbO4Tc/wL1EsNZQkB3HVvHLrY2ENMqBzyL2gOlpPGTRuKWtV7LnmgAJXoXen+EjMheDE8/8
	l7kkrk0zonFypUZCqvdEIsZQb3BMTEW3cYAy9bwuM1VZwbNUl8e9f7+kRyyhhMwsmWkBqqT+cIM
	ihuKeyu6ijElaRmUsUt1kC/MDQYSXWDwq2smHgrsK5NDRARxRH
X-Received: from pjpo14.prod.google.com ([2002:a17:90a:9f8e:b0:36b:28fe:916f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c1:b0:36a:aeaf:ab2f
 with SMTP id 98e67ed59e1d1-36c501c6616mr410441a91.17.1780081897950; Fri, 29
 May 2026 12:11:37 -0700 (PDT)
Date: Fri, 29 May 2026 12:11:37 -0700
In-Reply-To: <20260529190158.D597A1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529165114.748639-16-seanjc@google.com> <20260529190158.D597A1F00898@smtp.kernel.org>
Message-ID: <ahnk6cBLuuPIAwmA@google.com>
Subject: Re: [PATCH v2 15/20] KVM: x86/xen: Convert kvm_xen_set_evtchn_fast()
 to gpc's CLASS() APIs
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 29, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> > index 8f822acb11a46..47750316f1322 100644
> > --- a/arch/x86/kvm/xen.c
> > +++ b/arch/x86/kvm/xen.c
> [ ... ]
> > @@ -1810,8 +1809,6 @@ static void __kvm_xen_set_evtchn_fast(struct kvm_vcpu *vcpu, int port_word_bit)
> >  		kick_vcpu = false;
> >  	}
> >  
> > -out_unlock:
> > -	read_unlock(&gpc->lock);
> >  out_kick:
> >  	if (kick_vcpu) {
> >  		kvm_make_request(KVM_REQ_UNBLOCK, vcpu);
> 
> [Severity: High]
> Does this unintentionally hold the gpc lock across the IPI kick?

No, it intentionally holds the gpc lock across _sending_ the IPI kick.

> By replacing the explicit unlock with a function-scoped CLASS() variable, the
> vcpu_info_map destructor won't run until the end of the function. This means
> the lock is now held while calling kvm_vcpu_kick(), whereas the original
> code explicitly dropped it first.
> 
> [ ... ]
> > @@ -1888,9 +1881,6 @@ int kvm_xen_set_evtchn_fast(struct kvm_xen_evtchn *xe, struct kvm *kvm)
> >  		rc = 1; /* Delivered to the bitmap in shared_info. */
> >  	}
> >  
> > -out_unlock:
> > -	read_unlock(&gpc->lock);
> > -
> >  	if (rc == 1)
> >  		__kvm_xen_set_evtchn_fast(vcpu, port_word_bit);
> >  	return rc;
> 
> [Severity: High]
> Does this now hold the VM-wide shinfo_cache lock while calling
> __kvm_xen_set_evtchn_fast() and kicking the vCPU?
> 
> Since shinfo_map is a function-scoped CLASS() variable, its destructor
> won't release the lock until after __kvm_xen_set_evtchn_fast() returns.
> This creates a nested locking dependency and holds locks over expensive
> cross-vCPU operations, potentially serializing event channel deliveries
> across the entire VM on the fast path.

__kvm_vcpu_kick() is neither expensive nor cross-vCPU.  In the wait=false case,
which is the behavior of kvm_vcpu_kick(), it sends IPIs via smp_send_reschedule(),
i.e. it's more or less just __apic_send_IPI(cpu, RESCHEDULE_VECTOR), which is a
single WRMSR on modern harware.

> Would it make sense to constrain the mapping to an explicit scope block
> to match the original release points and maintain the "No functional change
> intended" guarantee?

I'll just drop that claim.
