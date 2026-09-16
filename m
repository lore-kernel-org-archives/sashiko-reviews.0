Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C5C4AA1F8
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 19:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789586050; cv=none; b=ESCmxDiAf6F+hhfDTMq7g7Bmgkax4HkTLbXjNjHOp2LI/ki0Ubkpgfxe5Za5xBtJhhuL85zJjqq8FJEaGV0k2GcupHEtOXkKjjcdge6TWJIELbIDcTSi3cLGlOx8QbrMkvBre5sSR5GoEKpfMQL81I9AuVrSgn/77RyFsbRV7rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789586050; c=relaxed/simple;
	bh=grwLO1oGGakIcjyeBqZgaIPwJ051uAvHakl+Xbh/guE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AAltd1r7p2yHp6RJX5LOPxUdypDrBhp+V6fcctd6LibDZ20PRJ1bgYY8pggDjKYcDuttSTLxhIkr5+9V4SncSN/uJN4kdInxN6r1jVVadV9DJ8eFdomwzvWjmmn5su2T7A97HiPGQbcwAWWdYHQYLECTjv8qUrm5TyZ6/AzWPc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ackJ3nZs; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ackJ3nZs"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so25098a91.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 12:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789586032; x=1790190832; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmeBzkTcsvJUd+BuTZhEbp8GE3iyf2+WK+kS+r8qWE4=;
        b=ackJ3nZs+z2wPRlq2QIZIecyvcMyIv2CJtam9xrnpkHdkzlGrokwhbRR0Z8+xPjusB
         /AwmAE1kwjYGiAh5xgQSm5diJCqO0VyX7xdivUgIwkwhXbu0O8g+1Te0wIBWeng7ZM81
         TsFIdJ6WVLx8jFDR2HgoeJyeRTAwmFsUiHSE8wqNJqqD2OihuW4hKLxb3i1g5nsZaTs8
         7U2CEgOkJ64AIdareatrtQpKkEKJxoY2syzZyAHJ1FIigSLqntYKp6Fq/fguHZavJpBr
         b0TCVvbWPe02Pmb1FTu7EabzSVuyoEfQZLzfcvcA/iKiWgk/Fh/rOrDtiwPeehX/kyt1
         rCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789586032; x=1790190832;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TmeBzkTcsvJUd+BuTZhEbp8GE3iyf2+WK+kS+r8qWE4=;
        b=RpAO7EuQAHy9IzDoLQfIiMpT/ChvtMfbGWYLzAsoy1uHgF2SVL69dVC+iUI/JzUE55
         0zlDjBYsJyJjKQlvgbLvvqB4Auj8TRKyizFUVLI4uz4QdJSuWcpBE0E0Mq+JYtVXO0rq
         ODLy11pSSdMw8Pt9qFKxr1U36scu2p+svBejbXeDRH1XdHwZxH8S4CpzitmugXv5wvST
         RQ9Iu76Q300gY3NuFzgYeRZxnI9F0LGRV0u88BPnnHaSifmJ0dTI1Pijry+VFwYPGVwO
         QLrQgL1r3I9LV9LkWVTLj7BuspSps7dXZQ14DTjms3qvW46FJ/O2QpHuQWULwvvdZdpL
         Qikg==
X-Gm-Message-State: AFuF++mM2LV+njlzeVq2y5r6iA2NwMttfpmJSkw+FEH8VjToqv8a+CGF
	UM0RORHnjSv3KEItCuIxXp4+Z8lr7B+pOdc1zjNmLF/FHK+QffzYoB/HVqWNZipNqbZepxScRv1
	UHvSxuw==
X-Received: from pjqt13.prod.google.com ([2002:a17:90a:ae0d:b0:398:9c5e:d8f2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3ccb:b0:39e:433:23b5
 with SMTP id 98e67ed59e1d1-39e1e24f9f4mr8606870a91.5.1789586032240; Wed, 16
 Sep 2026 12:13:52 -0700 (PDT)
Date: Wed, 16 Sep 2026 12:13:51 -0700
In-Reply-To: <aqnNAsGF_iUQsVX1@com-75606>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260915222625.99965-1-kylebot@openai.com> <20260915224104.4EB441F000FF@smtp.kernel.org>
 <aqnNAsGF_iUQsVX1@com-75606>
Message-ID: <aqrqb-lz2f0gCwuF@google.com>
Subject: Re: [PATCH v3] KVM: x86: Restrict saved GPA writes to hardware write faults
From: Sean Christopherson <seanjc@google.com>
To: Kyle Zeng <kylebot@openai.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 15, 2026, Kyle Zeng wrote:
> On Tue, Sep 15, 2026 at 10:41:03PM +0000, sashiko-bot@kernel.org wrote:
> > > @@ -6454,7 +6456,18 @@ int x86_emulate_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
> > >  
> > >  		/* With shadow page tables, cr2 contains a GVA or nGPA. */
> > >  		if (vcpu->arch.mmu->root_role.direct) {
> > > -			ctxt->gpa_available = true;
> > > +			ctxt->gpa_access = ACC_READ_MASK;
> > > +			/*
> > > +			 * Always allow writes for SEV guests, as the guest's
> > > +			 * page tables are encrypted, i.e. KVM can't walk the
> > > +			 * guest's page tables and so must always use the GPA
> > > +			 * from the initial fault.  Restricting use of the GPA
> > > +			 * to the access type that faulted would prevent KVM
> > > +			 * from emulating RMW operations for SEV guests.
> > > +			 */
> > > +			if ((emulation_type & EMULTYPE_PF_WRITE) ||
> > > +			    (cpu_feature_enabled(X86_FEATURE_SVM) && is_sev_guest(vcpu)))
> > 
> > [Severity: High]
> > Could this lead to an out-of-bounds read and type confusion?
 
...

> Is there a configuration that gets past the initialization checks and
> demonstrates an incorrect access? I'd like to establish that before
> treating this as a functional issue.

Eh, doesn't matter, my suggestion was terrible.  I forgot that is_sev_guest()
needs to check embedded data; I was thinking of TDX and SNP VMs, which have
dedicated VM types.

I think the right way to handle this is to track if a VM has protected page
tables.  That'd also help communicate/document why KVM has this weird behavior.

Untested...

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 30ffaa65f589..90c950c12900 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1166,6 +1166,7 @@ struct kvm_arch {
 	u8 mmu_valid_gen;
 	u8 vm_type;
 	bool has_private_mem;
+	bool has_protected_page_tables;
 	bool has_protected_state;
 	bool has_protected_eoi;
 	bool has_protected_pmu;
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index b56c39c53c98..7f544658b1cc 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2955,6 +2955,7 @@ void sev_vm_init(struct kvm *kvm)
 		kvm->arch.has_protected_state = true;
 		fallthrough;
 	case KVM_X86_SEV_VM:
+		kvm->arch.has_protected_page_tables = true;
 		kvm->arch.pre_fault_allowed = !kvm->arch.has_private_mem;
 		to_kvm_sev_info(kvm)->need_init = true;
 		break;
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 014545c1839b..35022f308e06 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -616,6 +616,7 @@ int tdx_vm_init(struct kvm *kvm)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 
+	kvm->arch.has_protected_page_tables = true;
 	kvm->arch.has_protected_state = true;
 	/*
 	 * TDX Module doesn't allow the hypervisor to modify the EOI-bitmap,
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f36b952624c8..7e5e2e587086 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -33,7 +33,6 @@
 #include "lapic.h"
 #include "xen.h"
 #include "smm.h"
-#include "svm/svm.h"
 
 #include <linux/clocksource.h>
 #include <linux/timekeeping.h>
@@ -6412,15 +6411,14 @@ int x86_emulate_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 		if (vcpu->arch.mmu->root_role.direct) {
 			ctxt->gpa_access = ACC_READ_MASK;
 			/*
-			 * Always allow writes for SEV guests, as the guest's
-			 * page tables are encrypted, i.e. KVM can't walk the
-			 * guest's page tables and so must always use the GPA
-			 * from the initial fault.  Restricting use of the GPA
-			 * to the access type that faulted would prevent KVM
-			 * from emulating RMW operations for SEV guests.
+			 * Always allow writes for guests with protected page
+			 * tables, as KVM can't walk the guest's page tables,
+			 * i.e. KVM can't get the RMW protections for a given
+			 * GVA to see if the write side of a RMW operation
+			 * should be allowed.
 			 */
 			if ((emulation_type & EMULTYPE_PF_WRITE) ||
-			    (cpu_feature_enabled(X86_FEATURE_SVM) && is_sev_guest(vcpu)))
+			    vcpu->kvm->arch.has_protected_page_tables)
 				ctxt->gpa_access |= ACC_WRITE_MASK;
 			ctxt->gpa_val = cr2_or_gpa;
 		}

