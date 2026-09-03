Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ED2DF76
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 00:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788393821; cv=none; b=h7P+I0QCb7HzKDg4psmEyatoIB6MrZJXted1rTcF1GZxUNhfjvndv9CzpDfvAEN0JaF05jg0L6gQzEyHBneL4+6de08VrZNKzBy/3mB6bgyTWct4khFZMbO1q8xIVFXd9EwFsH+FmCbiPTwJZbUg9AZsPPFP/MeeZ5Hjmd8avEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788393821; c=relaxed/simple;
	bh=4bOUM9SqneLmuOGjaCbKT2K3+I7j68NoiUuvTB0+iYg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lxZlRBGkiMOXmzT/peMmrICByIXd6LKV8lsyLFRhYg05iQYc5btHi2HkWIjk32ewr7KDEKqXFdzbwh8Qz+KteZrZQLtnVYzEu5zJx2x1M5QNcxKk0CxWB9TSmg0V01qxoouG5ppok6hdbdQ+1JbnugWhgEJyiAOwmZCzoL5hyJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y7mxekfZ; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y7mxekfZ"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacd6d37edso22010315ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 02 Sep 2026 17:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788393820; x=1788998620; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtrGZ8c2EjX4OS+R2zOI0XlmpBoBwI0YX1JBim1uXc4=;
        b=Y7mxekfZQ/gmE7Nn0TsmfY7X2uTN/ENaDcx1oOlCW11ciR322NK3/WF2f3BbK0ZPz+
         s9eiWE0gNqHmjtFHLX3CFOGkkqaZJfGT6zwdAcHTnuAcHVou5S4RNeToauSI9x/7t5j6
         Doln0oCgPZL0C9YfrXvs8Plkq4eEUH3/YS5wOcVeU4k1vMnYXoYnFKLKEupNGB/yWDSB
         IxyHTByS88ai3EV8VC4qcE/U7givzV4hN3Chime4BdAuWtktxIpKbAkKBSFnIwsN/WZT
         g0LaAusg3UJv2D0iwepHw1i4FrAypPk3mEnxveBjnc/3a/YWagpvll3QaLLLIChb+sQ2
         1i8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788393820; x=1788998620;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PtrGZ8c2EjX4OS+R2zOI0XlmpBoBwI0YX1JBim1uXc4=;
        b=kNkAPY88qp7hAbq9M4QJFBHUX6vIwCoJLArZYr+Pk+ALGxk3KvSAM9bigJEbPDoa46
         2gwBKjvcCcQ3ZLy9XzvlK+4bztYbdcQ2F3n2icQeZ59ju+KPBrfAXGfjh3RYJLnI3sq8
         t8WbNvg//yVR1hYRMjz26amG2OKWZvefiTSJiIUjnPETaYFAw6DZDSNY+bSDIxmfs6VO
         dzaivSvjzmZIwASpAG3iyrM46VZSk6R1u5VVKd8PEbtNCF6gf93LIrd7xZUeLSyds4/M
         nWJpE+FiAluL0vdEtWXNMTtDZB01pJ3zS1zLU0J61bLhFZ/rrUuHmR2SGijdn0EscoPL
         rvBQ==
X-Gm-Message-State: AFuF++laE6tnwltcecABr0kxyTM8PsWVI8GbdphFBvb+sIgXltJY11Nu
	mBb11i03WlS6/9HOWJTXMjwGCroFMwpws71r3a5J/ns9eF4qVR/HEAQYKsWH113JwEuelG+DDV/
	sPICvzryxh5qiPHbstUlGhq+AUXZgil6QLCSs5+4yjuEV27J3WUiFVciLLoYjpfufP2k/Y4J/UQ
	f0Q8FVdsB7zXE6cet8xJt3v1tPOJ4AL9hBcJQBbo9VCsylo1aP
X-Received: from plll21.prod.google.com ([2002:a17:902:d055:b0:2da:efa4:6509])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3884:b0:2da:fa6a:b04f
 with SMTP id d9443c01a7336-2dafa6ab21cmr45722325ad.2.1788393819396; Wed, 02
 Sep 2026 17:03:39 -0700 (PDT)
Date: Wed, 2 Sep 2026 17:03:38 -0700
In-Reply-To: <20260902234003.B3A561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260902232028.2767071-1-seanjc@google.com> <20260902232028.2767071-3-seanjc@google.com>
 <20260902234003.B3A561F000E9@smtp.kernel.org>
Message-ID: <api5WjBiSpJW656d@google.com>
Subject: Re: [PATCH v2 2/5] KVM: nSVM: Ignore EFER.LMA if EFER.LME=0 when
 preparing L2 state
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 02, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > index 49fb10ad1f9f6..23d29597d6bf2 100644
> > --- a/arch/x86/kvm/svm/nested.c
> > +++ b/arch/x86/kvm/svm/nested.c
> > @@ -789,6 +789,10 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm)
> >  
> >  	kvm_set_rflags(vcpu, save->rflags | X86_EFLAGS_FIXED);
> >  
> > +	/* SVM ignores EFER.LMA if EFER.LME=0 (instead of failing VMRUN). */
> > +	if (!(svm->nested.save.efer & EFER_LME))
> > +		svm->nested.save.efer &= ~EFER_LMA;
> > +
> >  	svm_set_efer(vcpu, svm->nested.save.efer);
> >  
> >  	svm_set_cr0(vcpu, svm->nested.save.cr0);
> 
> [Severity: High]
> This is a pre-existing issue, but does this logic only implement half of the
> hardware VMRUN rule? 
> 
> While this correctly fixes the invariant for EFER.LME=0, could a malicious
> guest desynchronize KVM's MMU state from the physical CPU when EFER.LME=1?
> 
> If an L1 guest creates a VMCB12 with EFER.LME=1, CR0.PG=1, but EFER.LMA=0,
> and executes VMRUN, nested_vmcb02_prepare_save() skips the LMA update
> because LME=1, passing LMA=0 to svm_set_efer().
> 
> Then, when we reach svm_set_cr0(), it fails to correct EFER.LMA because it
> expects an edge transition (!is_paging(vcpu)), which is always false since
> L1 must already be paging to execute VMRUN:
> 
> arch/x86/kvm/svm/svm.c:svm_set_cr0() {
>     ...
>     if (vcpu->arch.efer & EFER_LME) {
>         if (!is_paging(vcpu) && (cr0 & X86_CR0_PG)) {
>             vcpu->arch.efer |= EFER_LMA;
>     ...
> }
> 
> Would this allow the guest to trick KVM's instruction emulator into fetching
> arbitrary instructions from a different physical page than what the guest
> actually executed?

Maybe?  But unless it negatively affects the host, I don't think we care?
