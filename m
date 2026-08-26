Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064103FB05A
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 17:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764133; cv=none; b=maNVmHDx/lFdpQpFeBFZxMNoDR+X8Hf5G1XOMLg1oyMvSx2G1R6sPU7ex2387ejnRwqQyihZoaDWUliuq9eg3rkt4KElvrWyDhF+HovrJUet/TLRMvtth5HIDpaMj1qtAAQdEblRTC3jeh6GcaFMku4/ik4ps7J7QPGqfPPjVaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764133; c=relaxed/simple;
	bh=5gcZCxVaLoGbFtuUTVs9uf2JJcAHrT7H1feMiJ8kezI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GPTIqhIYt1Qd1aBJQrT41l7mWVPKdnecCZdTCdGlzmp+duwXmlrG/GCHXi7egXL2q+KjhqB9NhTXEfPsSVyzu6SxienCZ2v1OD8Qg2fcECqFDaTXoKCXruGun87LwWL01i3Lz/GCbZCagztTT4yngO8XAd1MCO6Tq3DA67Ae6DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S+76cJRJ; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S+76cJRJ"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d5d00fd19bso23952605ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 10:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787764115; x=1788368915; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dR4gFAPNlwUIZIAyQcENnxSzx6A0fm/I/dCW7TyYhXo=;
        b=S+76cJRJDHbvam2xIMGdTM/tX32qPl8HwBewX0fN4N/ddB32KrwPhyz2GQMpzBbbYp
         mVux985VIAEI9YMv4cYf6BpzlljlJtBYQGJCog6HWaEek3DcbwJ7diAnnv/qSYyksCba
         YW35YYZb7467FwwyIvYuU5zyHtYi4TqZ04F2P4tn1n/g/rvcTfJtElwluUoduEbfngmY
         qvpjTOb45L72rB7595Cijchn8c2gEYoB/MbKA4XOmaiLBeB5P6L8681CgClrCRkcEagd
         WWw8fTmKCS8iWnTy2u8pxMNOlv2rGv8DM/waetks8Qa6bJWfqR91izV+7SVTw/o5W/mC
         VTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764115; x=1788368915;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dR4gFAPNlwUIZIAyQcENnxSzx6A0fm/I/dCW7TyYhXo=;
        b=RAvvHubaqy1J9BiyUQxgzuVCiB8cnd2pfKMKsBdHMLQtKTj+DeyvXRltYXPFm6C39y
         lw8x1sYtO4juKqgyaGismIyHFbTYwjxXrG4ycr6ZtOCYOiNUvLg5Q1mTpQBY6JxkygVh
         0Fc3S6S7N1KELVY8UYzzx1xk9uuJmN7sq1YCCL2qMdno6OvqiPBXXateNE7yuNuw0Bpi
         LPPSeJzlha4q51Ty4+K23Hx71YvZL0derK5g9RVXhf9RE8JWsBUJS8JiECVb/r+8FDUj
         KnMmEjFCnkKNl3XOiMTai2cBvh/VIUlt0ECa+W3PTfJgyayHHf4wbAI41gS0Mhei9EZV
         22dQ==
X-Gm-Message-State: AFuF++k6v6zGpMRYs+CWemn4XffZNjxSEmenjCk55g6XToirZTCo34h5
	cI9YglKeXwOl6DkqTPpB50RWGyHSmOb72LYSI1jO79mZThoemDgzmt2bPP6fO4Tc49yH4a7Glvm
	K52vg16aJr91nNXQ09kU5dUOL5+LGsNIdn2EqH3D3dK8XL6QV1O6RDMy3PY19BJnREi22asNUSW
	mkFX4GA0IDsGiVRO3FmTmNtnoCRg9n1ZN0Ji7dN7Rn0seq1oTs
X-Received: from pluq15.prod.google.com ([2002:a17:903:4b4f:b0:2d5:d335:6d96])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf08:b0:2d3:104b:1acf
 with SMTP id d9443c01a7336-2d707a8c210mr170794815ad.8.1787764114874; Wed, 26
 Aug 2026 10:08:34 -0700 (PDT)
Date: Wed, 26 Aug 2026 10:08:34 -0700
In-Reply-To: <20260826165948.31EBA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826164214.756512-1-seanjc@google.com> <20260826164214.756512-3-seanjc@google.com>
 <20260826165948.31EBA1F000E9@smtp.kernel.org>
Message-ID: <ao8dkl_JLNLpzSEf@google.com>
Subject: Re: [PATCH v2 2/4] KVM: x86/mmu: Harden "map private PFN" against
 unexpected root invalidation
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 26, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 3220f05387b58..1969c26861e5a 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> [ ... ]
> > @@ -5224,10 +5220,22 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> >  		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu))
> >  			return -EIO;
> >  
> > +		r = kvm_mmu_reload(vcpu);
> > +		if (r)
> > +			return r;
> > +
> >  		cond_resched();
> >  
> >  		guard(read_lock)(&kvm->mmu_lock);
> >  
> > +		/*
> > +		 * Because slots_lock is held, it should be impossible for *any*
> > +		 * roots to be invalidated after the initial MMU reload.  WARN,
> > +		 * but continue on; the above MMU reload will do the right thing
> > +		 * if the current root is actually invalid.
> > +		 */
> > +		WARN_ON_ONCE(kvm_test_request(KVM_REQ_MMU_FREE_OBSOLETE_ROOTS, vcpu));
> 
> [Severity: Medium]
> Will this WARN_ON_ONCE ever trigger?
> 
> Looking at kvm_mmu_reload(), it calls kvm_check_request() which consumes and
> clears the request bit:
> 
> static inline int kvm_mmu_reload(struct kvm_vcpu *vcpu)
> {
>         if (kvm_check_request(KVM_REQ_MMU_FREE_OBSOLETE_ROOTS, vcpu))
>                 kvm_mmu_free_obsolete_roots(vcpu);
> ...
> 
> Since kvm_mmu_reload() is called unconditionally just above in the same loop,
> won't the KVM_REQ_MMU_FREE_OBSOLETE_ROOTS bit always be cleared by the time
> execution reaches this check in kvm_tdp_mmu_map_private_pfn()?

More than likely, but not always since it's a cross-vCPU request.  As stated in
v1, the goal is more about documentation than about finding bugs.
