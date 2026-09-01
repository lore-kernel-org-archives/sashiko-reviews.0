Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93E830C617
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295273; cv=none; b=FLdUNYVBWtUUcu3iwJ4waVN3CYzUZo5cD1q8F0WAvi2jZjjh+pxurMwL9ciA8+OC/JnEhtOjc4voFVXTvNjx67BVN4MeTWCcK4s5qVa/Tn0f2jBtcCSyQlg8jqquz4gPQFG1wjcM9UkfGEmju/Yd2fjPGIvknUSQjZ/dSzxrVOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295273; c=relaxed/simple;
	bh=psMMOFJtF+kXmhZbIqCEwWB9ZeF9nIpvSaKhQSOCImE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M6Nqb7A8YEThsO1oumrp2fEF5G+uMHC+d285Vr3Xzr/tZ06JsLQhesOpO3swxB8JK46AhVH2soEvhYN/XulJok5zgSHDLLO4sRiFdm1dtFOYUeHwGXvx+Fr9mxaLXGLcI9VdNYTp2zyUEDdKLhmmb8LOVBio4cZGawpjrTkBdMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RcFhCdrU; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RcFhCdrU"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8485d853b08so392148b3a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 01 Sep 2026 13:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788295271; x=1788900071; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hejcjb1fztMCJ1CJSchSzKPJN30uncRZpwDIFNQIfN8=;
        b=RcFhCdrUMA0xCKES88jFZOc6qUxx5nsBPvhh4NhCdPNdZaXqNa24hk1B+PVAFa5k4C
         AbHySTisG5c7ad9Pj+b1ud575gc9T00otu4dIQzGkzSmE9fz7tyWxth7+rH1eqDOrys4
         7EjXaj4YztX5VUZurxs2rQq+qWgUijBiviVBAID4yKA7cc/0glC2Wb5SmDjZW2tOCwvY
         bRA8xF9ZQVRvssZ32kQJKvyQ/9HN2Jn5tEl9oxNfmHDVS5qjvBPqNMkkkInci8Q8QipS
         d1J5hFxl+Lp6uZkF4zOSmkGptNnwdQFaYOzkYTG1/xjyuulypiXVVY6JT8RE/NXUnyWE
         JLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295271; x=1788900071;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hejcjb1fztMCJ1CJSchSzKPJN30uncRZpwDIFNQIfN8=;
        b=AJx4KhrVCZ4zxuodxMo6yUjQOaYIlNoEPlAn+IpATpfxbux4R23yq4yc7aGJBCHahj
         38R0UvYEVSxWO+sWaLazjVEGhv4Lw5AtERRbZz8dHxE2teRo9fSx3j2BRveMsicyEueB
         ZJW23sjELtdj3g9pGdEHmcujJxWrJfcxJpfJEXfoNNLzA4BkkNX7C5QFJ8w1OLrHq7cg
         PFC9zhGdZZYIWou6AkQ2Ty9KvKzFaI6xIN541sA6/Qq02zwIEeMvtIQzBN3NI3SXqK7a
         v8A6x26s9h0ajtFdjvBkuThGUsCwwTp6laGYFEYDm+x80Lk/bOVkZld1CduwZStnyMj4
         fWqw==
X-Gm-Message-State: AFuF++lsveyEwAbIuupc5cNfIzoTKWo/FPAtrx6YkWjkk4YwpO2AVsC6
	JuC9RzpTgxPSn3RFdeGhWCljSI1cXrbAQ0uCpLr3dQ1UEXBJcz4x3ahs6lcRK4WQMoJGW+eCPua
	ygZxZbC2CPWrwyZGogxxNu98x4B8+gUmt/JCf1fYy894DCjnSkYlYhFHYWUI4eL1Boywu4Aqe1Z
	i7JMzGQ/Sq+8n35UYN5Eox2vsrIzzwYbiKInZzRPFsQ4kGw5h+
X-Received: from pgdf1.prod.google.com ([2002:a05:6a02:5141:b0:c9a:ffcc:19c8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:cc0e:b0:3cc:faf3:331a
 with SMTP id adf61e73a8af0-3d7ae5e7fbfmr18016806637.10.1788295270941; Tue, 01
 Sep 2026 13:41:10 -0700 (PDT)
Date: Tue, 1 Sep 2026 13:41:10 -0700
In-Reply-To: <20260829000926.176E51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260828235840.63227-1-kylebot@openai.com> <20260829000926.176E51F000E9@smtp.kernel.org>
Message-ID: <apc4Zn1wZtqfwv0h@google.com>
Subject: Re: [PATCH v2] KVM: x86: Restrict saved GPA writes to hardware write faults
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Kyle Zeng <kylebot@openai.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Aug 29, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 79468ddfe4736..aa5deb7c73aa2 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -5088,8 +5088,13 @@ static int emulator_read_write_onepage(unsigned long addr, void *val,
> >  	 * Note, this cannot be used on string operations since string
> >  	 * operation using rep will only have the initial GPA from the NPF
> >  	 * occurred.
> > +	 *
> > +	 * The guest may have changed the instruction since the fault.  Reuse
> > +	 * the GPA for writes only if hardware reported a write access;
> > +	 * otherwise, recheck permissions for the decoded access.

Eh, I would just omit this comment, because a RMW operation is far more likely
than the guest playing TLB games.

> >  	 */
> > -	if (ctxt->gpa_available && emulator_can_use_gpa(ctxt) &&
> > +	if ((ctxt->gpa_access & (write ? ACC_WRITE_MASK : ACC_READ_MASK)) &&
> > +	    emulator_can_use_gpa(ctxt) &&
> 
> [Severity: High]
> Will this break the write phase of read-modify-write (RMW) instructions for
> SEV guests?
> 
> If a SEV guest executes an RMW instruction (like OR [mem], reg) on an
> unmapped MMIO page, the hardware triggers a Nested Page Fault (NPF) on the
> initial read access. KVM will set gpa_access to ACC_READ_MASK.
> 
> When the emulator attempts the write phase, it appears this check will fail
> because ACC_WRITE_MASK is not set. This causes emulator_read_write_onepage()
> to fall back to vcpu_mmio_gva_to_gpa().
> 
> Does this fallback attempt a software page table walk that will fail on
> encrypted guest page tables, resulting in a spurious #PF and crashing the
> SEV guest?

Ugh, SEV.  Part of me wants to take an erratum for the whole mess, but that would
be quite gross since the behavior would be conditional for non-SEV guests.  And
it should be easy enough to make this work for just SEV guests.

> 
> >  	    (addr & ~PAGE_MASK) == (ctxt->gpa_val & ~PAGE_MASK)) {
> >  		gpa = ctxt->gpa_val;
> >  		ret = vcpu_is_mmio_gpa(vcpu, addr, gpa, write);
> 
> [ ... ]
> 
> > @@ -6454,7 +6459,10 @@ int x86_emulate_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
> >  
> >  		/* With shadow page tables, cr2 contains a GVA or nGPA. */
> >  		if (vcpu->arch.mmu->root_role.direct) {
> > -			ctxt->gpa_available = true;
> > +			/* A write fault can require a read for RMW emulation. */

Heh, my brain fart notwithstanding, just drop this comment.  Because while RMW
operations are why KVM needs to get this correct, it's doesn't explain why it's
correct to allow reads on write faults.  We could write a comment for that, but
I think anyone that cares enough will be able to quickly deduce that reads are
allowed because x86 paging doesn't support write-only mappings.

> > +			ctxt->gpa_access = ACC_READ_MASK;
> > +			if (emulation_type & EMULTYPE_PF_WRITE)
> > +				ctxt->gpa_access |= ACC_WRITE_MASK;
> 
> [Severity: High]
> Does this limit gpa_access too strictly for read faults on RMW instructions?
> 
> As mentioned above, if an instruction naturally faults on its first (read)
> access, it will only get ACC_READ_MASK here. This seems to be the root cause
> that later prevents the write phase from reusing the GPA during MMIO
> emulation.

For !SEV, that's fine.  In practice, I highly doubt RMW operations are used in
fast paths, e.g. Linux-as-a-guest straight up supports only MOV instructions.

For SEV, this as fixup?  And then if someone cares enough (I don't think I care?),
we could add an entry in Documentation/virt/kvm/x86/errata.rst for SEV.

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 3db88742ea9a..4f6659aa72ec 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6459,9 +6459,17 @@ int x86_emulate_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 
 		/* With shadow page tables, cr2 contains a GVA or nGPA. */
 		if (vcpu->arch.mmu->root_role.direct) {
-			/* A write fault can require a read for RMW emulation. */
 			ctxt->gpa_access = ACC_READ_MASK;
-			if (emulation_type & EMULTYPE_PF_WRITE)
+			/*
+			 * Always allow writes for SEV guests, as the guest's
+			 * page tables are encrypted, i.e. KVM can't walk the
+			 * guest's page tables and so must always use the GPA
+			 * from the initial fault.  Restricting use of the GPA
+			 * to the access type that faulted would prevent KVM
+			 * from emulating RMW operations for SEV guests.
+			 */
+			if ((emulation_type & EMULTYPE_PF_WRITE) ||
+			    is_sev_guest(vcpu))
 				ctxt->gpa_access |= ACC_WRITE_MASK;
 			ctxt->gpa_val = cr2_or_gpa;
 		}
