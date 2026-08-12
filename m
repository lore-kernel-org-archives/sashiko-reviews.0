Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA338409285
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 21:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786571945; cv=none; b=OdiXbrcT9GnoBNnLXGREIJQN5RNWAhkIb5b5Ad1AyF85m9OvfvB7lrchEHap3bukaIn5gjILD91P0n3/Z3O6kNcSpA9pPFXxZBpIAy+OVvskzbaJb3pTR5BTIpuU4/TZKepKDUQFFBN52grYC3QivXEC0Po52noy/O64GGF2Fko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786571945; c=relaxed/simple;
	bh=ymZafs7g1MYV7KFwirGxlA1XH5+iRDPuHI9OtZIExJI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f3MDYj5MWbCq27BesIA3xM62vREM347/IDoWIq06Z7ALlXLrXP45d2cN+cBo578kAmLwKtUNW5moTfrm767QxNDYC74Xp2K4XsLxdQQvq3nbYbbtlT4ezwdascRZEHXI2OXYVyw+zLd7rj5PJTB+1NBx3pj13YEhWNPj1u06bNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d7gfXVHc; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d7gfXVHc"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbeeaabcadfso143352a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 14:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786571943; x=1787176743; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ai5CXOJ0yTxSabLVF9PiGbcqNEQLp6B7VruK8ZH87b4=;
        b=d7gfXVHcD5d9rFO9DGjOHBRBAhFAkdIZyHlDqm/s2zp5++jomgej9WMftl6Y+ciIh7
         OrmGasgfCGdUU5ZIOgdNOvfkW7klT3RQ3zOK/i6auLmDpSYJzF5wxtb0J2ogMV2ZcXw0
         nULoNCLqvICjBdo2e8kB+pDQD0mORyp/ytsxK+nBSVwuS0oShlohmR+3wE1u+l8qgT9f
         7akeXqCaxRT0kO0T+5xe+MFlUpd8vhPoRGYRffRnPZWpvdSS6zs4SJU2Y0JLrL2fdlyb
         YZeCqHZ6uwvjB5Rs1++RN4K1841l1U4bn2gNUO0cpfiYT2ahC1Q1YNyMjGRYh+Mi3qOq
         HCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786571943; x=1787176743;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ai5CXOJ0yTxSabLVF9PiGbcqNEQLp6B7VruK8ZH87b4=;
        b=PUxe5UaWgRc3iecTP2Wm4K/UENjfW+x0IKDTteQ0CMS4VCZNWo8ZN6iMlrsgXQaGfa
         MaT4Wpz3eKD8clFU1W8YmTaiBpCsO8wPNO42XiQU9QEctCTP/xEnwtyKi+G01+VyrV1P
         79yd4Bkh8n0Jek2QM5v7F74ypNI5TVL/cZXnh3BIhayi+TmrUCcBufVR1pXrT5RcWlJy
         WQ8blG2g7ttNEMYYGVo5tDgtTU6UCAQ9oIhdNXHqLFakIYPqWMx1OFeBeRYmQv79hT+N
         kcICA7TYamfgFwud0vqTL6DJlSFYd6bYxwVzBlvbaYdA6OAxboL7uTmKFN63gOawJnb9
         tTnQ==
X-Gm-Message-State: AOJu0YxQ8uIkBg//GY2rsli4wUEpmixAKuy+SlT+HzdMKtUTSd9DTHw3
	G2lFq3S4wCgbjW6S9MkFXat9NO4Y9FsKHjy1OqrfwKr0hGY1lrkB+5r4FECoV1duMYqChWwdIxO
	jd24TbA==
X-Received: from pgkd1.prod.google.com ([2002:a63:f241:0:b0:cbe:e700:726f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3293:b0:3c3:b628:6d17
 with SMTP id adf61e73a8af0-3cc553cab60mr1433299637.25.1786571942938; Wed, 12
 Aug 2026 14:59:02 -0700 (PDT)
Date: Wed, 12 Aug 2026 14:59:02 -0700
In-Reply-To: <5149127b-32ce-4409-a443-02b5a9600e14@amd.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260713105033.15405-1-sarunkod@amd.com> <20260713105033.15405-6-sarunkod@amd.com>
 <20260713111119.EC35E1F000E9@smtp.kernel.org> <b50b3535-eaa1-4944-914d-0eea8dac0e06@amd.com>
 <anpwS3C2UIHFz_Uf@google.com> <5149127b-32ce-4409-a443-02b5a9600e14@amd.com>
Message-ID: <anzsptZlkU4VOKGi@google.com>
Subject: Re: [RFC PATCH v3 5/6] KVM: SVM: Add support for AMD IOMMU Guest APIC
 Physical Processor Interrupt (GAPPI)
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, 
	Vasant Hegde <vasant.hegde@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 12, 2026, Sairaj Kodilkar wrote:
> 
> 
> On 8/11/2026 6:13 AM, Sean Christopherson wrote:
> > On Mon, Aug 10, 2026, Sairaj Kodilkar wrote:
> >> On 7/13/2026 4:41 PM, sashiko-bot@kernel.org wrote:
> >>> [Severity: High]
> >>> Can an unprivileged user-space process trigger this WARN_ON?
> >>>
> >>> When a vCPU is created, svm->gappi_cpu is initialized to -1 in
> >>> avic_init_vcpu(). It is only set to a valid CPU ID later during
> >>> __avic_vcpu_load().
> >>>
> >>> If host user-space configures device interrupt routing via the KVM_IRQFD ioctl
> >>> before the vCPU runs, avic_pi_update_irte() is invoked. This will pass the
> >>> uninitialized svm->gappi_cpu (-1) down to this function, hitting the WARN_ON.
> >>> If the host has panic_on_warn enabled, this allows host userspace to trigger
> >>> a kernel panic.
> >>
> >> This is a valid concern.
> >>
> >> If host userspace attaches a bypass IRQ targeting a vCPU that has never
> >> been loaded. Functionally, there is nothing to do in that window. A vCPU
> >> that has never been loaded cannot be blocking, so no GAPPI wakeup is
> >> required. The IOMMU still posts the interrupt into the vAPIC backing
> >> page, and the pending IRR is evaluated at the first VMRUN after
> >> avic_vcpu_load(), which is also where the IRTE gets a valid Destination
> >> and IsRun = 1.
> >>
> >> This can be resolved by assigning a arbitrary gappi destination, without
> >> actually updating the gappi wakeup list of that CPU.
> > 
> > With the disclaimer that I haven't look super closely at this series, and haven't
> > thought too deeply about the feature itself either...
> > 
> > Why are we doing anything different than what VMX does?  vCPUs on the wakeup
> > list when they block, and come off the list when they wakeup.  It's literally
> > one flow that's guarantee to pair put()+load(), and the logic for manipulating
> > the list is quite simple as a result.
> 
> I was trying to manipulate the vCPU list after is_empty(ir_list) check
> in put() and load() path. Which complicated the things, since
> pi_update_irte() will have to add the vCPU to the list if it was a first
> interrupt assigned to given vCPU.

No, there are other options.  Specifically, the solution VMX uses is to put the
vCPU on the wakeup list if it *might* get a posted IRQ.  Again, why reinvent the
wheel?
 
> I think its better to keep the list operations before is_empty(ir_list)
> check in order to simplify things a little bit.Note that it may increase
> the list size and potentially increasing time for gappi_wakeup_handler.
>
> > Going a step further, why is GAPPI not sharing code with VMX Posted Interupts?
> > At a glance, the only meaningful difference in the wakeup flow is the "should
> > this particular vCPU be awakened".
> 
> On Intel there is a level of indirection: KVM hands the IOMMU the
> physical address of the PI descriptor once, at IRQ affinity setup time
> (vmx_pi_update_irte()). After that the descriptor is the only thing that
> needs updating, so vcpu_load()/vcpu_put() just write NDST/NV/SN in
> memory and never call into the IOMMU driver again.
> 
> AMD has no such indirection. The destination APIC ID, IsRun and GATag
> live directly in the IRTE, and there is no per-vCPU structure that the
> IOMMU dereferences. So every vcpu_load()/vcpu_put() has to call into the
> AMD IOMMU driver to update each IRTE targeting the vCPU, via
> avic_update_iommu_vcpu_affinity() -> amd_iommu_update_ga().
> 
> That difference leaks into the wakeup list handling. On Intel, putting a
> vCPU on the per-pCPU list is self-contained. On AMD it has to happen in
> the same ir_list_lock critical section as the IRTE update, and it is
> conditional on the vCPU actually having posted IRQs (ir_list being non
> empty), because the pCPU that the vCPU is enqueued on is also what gets
> programmed into IRTE[Destination].

And?  That's literally calling one function from a slightly difference location
on Intel vs. AMD.  E.g. unless I'm missing something, the handling should be
something like this, sans actual code movement:

diff --git arch/x86/kvm/svm/avic.c arch/x86/kvm/svm/avic.c
index c5b1d294b15a..c9a6da646c8e 100644
--- arch/x86/kvm/svm/avic.c
+++ arch/x86/kvm/svm/avic.c
@@ -1020,6 +1020,9 @@ static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu,
 
        lockdep_assert_held(&svm->ir_list_lock);
 
+       if (ga_log_intr && gappi && kvm_can_use_device_posted_irqs(vcpu->kvm))
+               kvm_pi_enable_wakeup_handler(vcpu);
+
        /*
         * Here, we go through the per-vcpu ir_list to update all existing
         * interrupt remapping table entry targeting this vcpu.
diff --git arch/x86/kvm/vmx/posted_intr.c arch/x86/kvm/vmx/posted_intr.c
index 4a6d9a17da23..f6e3fea11baa 100644
--- arch/x86/kvm/vmx/posted_intr.c
+++ arch/x86/kvm/vmx/posted_intr.c
@@ -144,7 +144,7 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
                pi_set_on(pi_desc);
 }
 
-static bool vmx_can_use_vtd_pi(struct kvm *kvm)
+static bool kvm_can_use_device_posted_irqs(struct kvm *kvm)
 {
        /*
         * Note, reading the number of possible bypass IRQs can race with a
@@ -217,7 +217,7 @@ static bool vmx_needs_pi_wakeup(struct kvm_vcpu *vcpu)
         * back to the pi_wakeup_handler() function.
         */
        return (vmx_can_use_ipiv(vcpu) && !is_td_vcpu(vcpu)) ||
-               vmx_can_use_vtd_pi(vcpu->kvm);
+               kvm_can_use_device_posted_irqs(vcpu->kvm);
 }
 
 void vmx_vcpu_pi_put(struct kvm_vcpu *vcpu)
@@ -242,7 +242,7 @@ void vmx_vcpu_pi_put(struct kvm_vcpu *vcpu)
        if (!vcpu->preempted && kvm_vcpu_is_blocking(vcpu) &&
            ((is_td_vcpu(vcpu) && tdx_interrupt_allowed(vcpu)) ||
             (!is_td_vcpu(vcpu) && !vmx_interrupt_blocked(vcpu))))
-               pi_enable_wakeup_handler(vcpu);
+               kvm_pi_enable_wakeup_handler(vcpu);
        else
                pi_set_sn(pi_desc);
 }
