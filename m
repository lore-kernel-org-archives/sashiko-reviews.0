Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5522690EC
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 01:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200465; cv=none; b=P/sHJwP4SuYfYCs3mCYV+QPv40Zy5s11ZFX2YLPE1RY1sEZdoYL8WMbGI3GB7VNx0vB/esq+b12QE2FWF/UI3ocSifGI2z8qFXc5EoaHFPwsrutbItz0I/enjOFpnLSUyM6UI7AC4wWXCZle4WCrsCjv4OOeLBLX6iiWsfgC4ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200465; c=relaxed/simple;
	bh=PimpcPnu/HCiRsRLYqpWDsqSbgXlOYJZFEqNFHLBIfY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tq7DZ/IkjJ/DGAihaUWEu+gq8Dat3B79iwszb93gcZZ5uxthOue2du152ann7DETh7XgFkRwTFJQL2H7MI7iCgiAekp9fB8lJSIeKpdI2AX6EgNtY1ijwBr6S1MDC2RYqPN9FY+vHKRCs5YRqA/SV8f9+B1adYc3gqjE6U5QnBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HoucnuNM; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HoucnuNM"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso2104198a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 18:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785200463; x=1785805263; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MQ2ppBxGdOC/Mg9PkZYye2SrWSAeiiRLHe45A5wceI=;
        b=HoucnuNMEBnzps9B908wdNbFeo9zk+qJoXUG2b84J0dFxdi0lP/kpZltLgPPP6YvGK
         AjmEMymZEyXJH3snBA2pZ//TJpHVmhgyrLZKseXLVgfaEWPkBMVlCNSIyJbHObd7H5sZ
         Ou8FTpZ4BaPt3lV3Bpx1AIXwT6A+6rCaPOWZNULXIFzDT0pnlidDNmVrb1KIzskAM0NQ
         rOtczp46vN6yw0aI/xgX2X1YeSlHFLTxRqBMEU7bmJ6axPnstgMhb3zYy+e1BH15vWoB
         7ULqmasK3hqwo4suSlROwNPSGMp3608QtjNQGPqmPKwBhR447+vYThe7V/P1ewaqKxP7
         +rBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785200463; x=1785805263;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MQ2ppBxGdOC/Mg9PkZYye2SrWSAeiiRLHe45A5wceI=;
        b=ljLhr71jh46w4Q3ChJqBky1PtTCl6R3cyY56PbHOfCDioSXuNXQtXRqLMKA77H5WxA
         7sdHmQ+ELyqXQcvd4im+NJYBcvaxE71B1vf5qrXSPdYJpOxpw/p2OV/2RGFs7zL/OyvS
         ItFOeiiAFmnSYfBKXfeZOxMnNcP9UeLe553KFMnR5zqfh3b6x0gB+5umyY2n/asc6A88
         +qc75TyJRQB9WRwU5K0qrZx8k7zn68OByM1DCgVOrPdjBmS07qynmwXRsEMXeXwHL/pz
         cRlO2Jac8sRU+AUKRtiMatO7V9xIBM7WgK32c1r/FgHUpcv0Pl8YqiiZNZ6wUpR37hX5
         OmpQ==
X-Gm-Message-State: AOJu0YxJPb1jPElkJbSATSDyKXsJKw0txg3vxKUcTKRbJTD55As+bio7
	/VId6s24NQIS5m8MY7eTHB2ibY7qvI7eIrkZ9D0uPrHHlIBSdzTecU3h7VjFJT2h/5w2wtNQGyy
	Q9WFJwK9FNCEqzd6HUKxu6aDjauzs/lyOAK33s5CsmrCYmkX4WiogV0SrIAydUlpOQpFfNmA1gQ
	z2OYADiORRTaDJfU/oQBYcqUfGqusRrtxdmw9MEerzc2jG9g71
X-Received: from plnl15.prod.google.com ([2002:a17:902:fd8f:b0:2cc:2c68:b71b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec8a:b0:2ca:bf68:2a54
 with SMTP id d9443c01a7336-2d015d238a7mr1997475ad.22.1785200463091; Mon, 27
 Jul 2026 18:01:03 -0700 (PDT)
Date: Mon, 27 Jul 2026 18:01:02 -0700
In-Reply-To: <20260728005847.6EF2F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260728004351.887076-1-seanjc@google.com> <20260728004351.887076-2-seanjc@google.com>
 <20260728005847.6EF2F1F000E9@smtp.kernel.org>
Message-ID: <amf_TkUA-etGt_CX@google.com>
Subject: Re: [PATCH v4 1/6] KVM: x86: Extract VMX's unhandleable emulation
 check to common x86
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 28, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
> > index 04f986e3d439a..924a629c21e2f 100644
> > --- a/arch/x86/kvm/vmx/main.c
> > +++ b/arch/x86/kvm/vmx/main.c
> [ ... ]
> > @@ -939,11 +949,12 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
> >  	.flush_tlb_gva = vt_op(flush_tlb_gva),
> >  	.flush_tlb_guest = vt_op(flush_tlb_guest),
> >  
> > -	.vcpu_pre_run = vt_op(vcpu_pre_run),
> > +	.vcpu_pre_run = vt_op_tdx_only(vcpu_pre_run),
> 
> [Severity: High]
> Does this conditionally assigned NULL pointer cause a module load warning on
> systems without CONFIG_KVM_INTEL_TDX enabled?
> 
> Since vcpu_pre_run is declared as a mandatory hook (KVM_X86_OP(vcpu_pre_run))
> in arch/x86/include/asm/kvm-x86-ops.h, setting it to NULL when TDX is
> disabled will trigger a WARN in kvm_ops_update().
> 
> [ ... ]
> 
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 960ff7fcd8dba..8c3efc1be1fa4 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -8867,6 +8867,11 @@ static int kvm_x86_vcpu_pre_run(struct kvm_vcpu *vcpu)
> >  	    !kvm_apic_init_sipi_allowed(vcpu))
> >  		return -EINVAL;
> >  
> > +	if (kvm_x86_call(unhandleable_emulation_required)(vcpu)) {
> > +		kvm_prepare_emulation_failure_exit(vcpu);
> > +		return 0;
> > +	}
> > +
> >  	return kvm_x86_call(vcpu_pre_run)(vcpu);
> 
> [Severity: High]
> Could this break KVM_RUN by returning an uninitialized register value when TDX
> is disabled?
> 
> When kvm_x86_vcpu_pre_run() calls this static call with a NULL target, the
> static call machinery will patch the call site with a NOP or RET. The CPU will
> execute the NOP and fall through, leaving the return value in the RAX register
> unmodified.
> 
> Since the preceding call to unhandleable_emulation_required() is a boolean
> function that typically returns false (setting AL=0), the uninitialized RAX
> will evaluate as <= 0. This would cause kvm_arch_vcpu_ioctl_run() to
> immediately exit to userspace instead of entering the guest.

Gah, that's what I get for splitting the diff just before posting.  I'll fix
both of these in v2, and make sure to test patch 1 in isolation.
