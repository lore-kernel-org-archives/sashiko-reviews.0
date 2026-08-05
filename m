Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D149F385509
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 14:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941764; cv=none; b=G1E4SDC80o/eY7KWxmdS6B9eGEZY0lib5IDLaUZp5mgS1xPig3NX/g+SEdzhdNRm7MqfmI9Y+C4MorjrWckmP3zSbfAZG9OR/rbO+ujYzLfxH/9de6eNAGIq7okjqpodu0DXzkbRxlMhV84MtbnI0I3p0WOd/PH/5qWm3hTWCz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941764; c=relaxed/simple;
	bh=WONSZrEfTEQHhDLMWBsW7H4r4I/kwHAKWrWnmd+EM0I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o6idver0WjmOjnM0YSZ1qAKbqIepicYUxeD/M+RjoekoIg6HqQY6+uILw+Swt2A5FHCk3EMdAH2rpNSoh5IcfcsdcgOVc8PaXzqbOq5NaY1mkLkBb4+2RU6rW2Tie8+lmT9ahbLVDyLdw4m+BxJaBbUsJ1CMYCjHf0r5nm7MCQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fyuV0sEf; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fyuV0sEf"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb835525b13so1327274a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 07:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785941762; x=1786546562; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+u/ptws/w0ERMyPQldrsepzUvylkhuQnBIDzncP5Dw=;
        b=fyuV0sEfPyK/7kBDJxUB3SkS/TvzoDZCmX0XYbZJv3+46WIpT/cFVJPX47nN7dDmWs
         pdUbEOPvvgYEkIzGCWTfxXXVwz+zr/2f2po2nA3L+p0oMflLfvlOjedi3aEik0b5tol/
         304XxSmHgPBkbBeVU2TFcAO1iuK1XDM7UkSRSCz4axbo3N451TpTTgZlPrp0YT+SYhX1
         YWUWhZBt38dFptRn0zncz7Zac5hOYwBL55JpgoJFJHDvHLKHcZposNaH7phS4bNgtiML
         KRsqJCfCB00chpRfUqqLNivpSJetc+K042K4s5Cj2CDz3ePr7j1dZEI/ByhTQGjpIICb
         JWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785941762; x=1786546562;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+u/ptws/w0ERMyPQldrsepzUvylkhuQnBIDzncP5Dw=;
        b=PEzId+Iuj7VEHiLqy3qNPsAVbvO7x6KYJSj8PC36O34yJPlIHhX2wGaUg75taDYiio
         thzvv8lDBmDgXs0hxnYu1D9XKMoh9O8cgOfgFx2/6ybMAkX/WyncKMU5Geq+OaLTwczh
         ElWZXaCELk9/iBBrDqT9ElAOqfF1NJsLID53ZhbPsvH9PCJZ+5wXdXIddJW5jlYvBXWn
         5/N2DLlwuSkpaV0n9fLziOTj0kAftmzdcr8NnQ/fCj3Tvj7erLMro7XZZmw7OfyRAEzT
         8WMac9Qq97DvWKlNo7K47UoT10HvqNIkNsL2jmCN35huhcPU4oSx0f6EYDtQh7/ewAQa
         xf8Q==
X-Gm-Message-State: AOJu0YyTnSblqkmCDXT0xLqGdcRvqn4nTJkBBKUS7IPRbU6Z4Ha44fd7
	tJUGgZGzQmXKcSDcqMk0IoxlGfPlo+Te75YfYZDbNMReiZFys7/UA5oAbfqUpqMFndqc/WRqdnw
	3+fTh9w==
X-Received: from pfdf15.prod.google.com ([2002:aa7:8b0f:0:b0:847:9805:8254])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2295:b0:848:62ab:7b7
 with SMTP id d2e1a72fcca58-84f2e0402b9mr8103173b3a.16.1785941761779; Wed, 05
 Aug 2026 07:56:01 -0700 (PDT)
Date: Wed, 5 Aug 2026 07:56:01 -0700
In-Reply-To: <4fedcaa6-d710-48f8-84c4-de682350bb2f@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260805031257.1844914-1-xiaoyao.li@intel.com>
 <20260805031257.1844914-3-xiaoyao.li@intel.com> <20260805034602.5B2BB1F000E9@smtp.kernel.org>
 <4fedcaa6-d710-48f8-84c4-de682350bb2f@intel.com>
Message-ID: <anNPAXShf1gjDdeu@google.com>
Subject: Re: [PATCH 2/2] KVM: TDX: Enable Bus Lock VM exit
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 05, 2026, Xiaoyao Li wrote:
> On 8/5/2026 11:46 AM, sashiko-bot@kernel.org wrote:
> > This also appears to affect tdx_to_vmx_exit_reason(), where comparing the raw
> > exit reason directly against 16-bit constants like EXIT_REASON_TDCALL will
> > fail to match if the bus lock bit is set, leading to incorrect emulation.
> 
> This is valid. We need to adjust tdx_to_vmx_exit_reason().
> 
> However, there is a more important problem. Since Bus Lock VM exit makes bit
> 26 possible in EXIT REASON, the trick of "return -1" in
> tdx_to_vmx_exit_reason() will introduce false-positive in the following
> check of if(vmx_get_exit_reason(vcpu).bus_lock_detected) added by this
> patch.
> 
> how about something like below:

Way too subtle.  tdx_to_vmx_exit_reason() should return the actual union, not a
raw u32, otherwise it's going to be extremely difficult to avoid reintroducing
similar bugs.

And looking at this all again, we should change the handling of actual
EXIT_REASON_EPT_MISCONFIG exits.  Stuffing a bogus value into the exit_reason
is "fine", but as Sashiko points out, it's extremely brittle.  Rather than
stuff the exit reason, we should stuff the status to signal TDX_SW_ERROR.

And to do that without introducing more fragility, we should flag the raw
vp_enter_ret as "unsafe", and explicitly track vp_enter_status.  I.e. separate
the status from the exit_reason immediately after VP.ENTER, instead of mixing
and matching the two concepts.

The fastpath "handler" is also all kinds of messed up.  KVM fails to trace_kvm_exit()
EPT misconfigs and software errors; even though the exit reason is undefined, it
should still be captured in the trace, otherwise it's a huge blindspot.  And AFAICT,
OPERAND_BUSY should be mutually exclusive with actual VM-Entry failures, so manually
checking for VM-Entry failure is completely unnecessary, just handle OPERAND_BUSY.
If TDX ever gains fastpath handlers, then we can add a true fastpath handler at
that time.  But OPERAND_BUSY should be a "never do the fastpath", because AIUI,
VM-Enter wasn't attempted, i.e. there's nothing to handle.

Compile tested only, and it should be chunked over several patches, but this?

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 299c051d648e..19e8e3703ce1 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -921,12 +921,12 @@ static __always_inline u32 tdcall_to_vmx_exit_reason(struct kvm_vcpu *vcpu)
 	return EXIT_REASON_TDCALL;
 }
 
-static __always_inline u32 tdx_to_vmx_exit_reason(struct kvm_vcpu *vcpu)
+static __always_inline union vmx_exit_reason tdx_to_vmx_exit_reason(struct kvm_vcpu *vcpu,
+								    u64 vp_enter_ret)
 {
-	struct vcpu_tdx *tdx = to_tdx(vcpu);
-	u32 exit_reason;
+	union vmx_exit_reason exit_reason;
 
-	switch (tdx->vp_enter_ret & TDX_SEAMCALL_STATUS_MASK) {
+	switch (vp_enter_ret & TDX_SEAMCALL_STATUS_MASK) {
 	case TDX_SUCCESS:
 	case TDX_NON_RECOVERABLE_VCPU:
 	case TDX_NON_RECOVERABLE_TD:
@@ -934,40 +934,38 @@ static __always_inline u32 tdx_to_vmx_exit_reason(struct kvm_vcpu *vcpu)
 	case TDX_NON_RECOVERABLE_TD_WRONG_APIC_MODE:
 		break;
 	default:
-		return -1u;
+		/*
+		 * Synthesize an invalid bogus Exit Reason, as the TDX-Module
+		 * never attempted to run the vCPU, i.e. the Exit Reason is
+		 * undefined, but this is NOT a failed VM-Enter.
+		 */
+		return (union vmx_exit_reason) {
+			.basic = -1,
+		};
 	}
 
-	exit_reason = tdx->vp_enter_ret;
+	exit_reason.full = (u32)vp_enter_ret;
 
-	switch (exit_reason) {
-	case EXIT_REASON_TDCALL:
+	if (exit_reason.basic == EXIT_REASON_TDCALL) {
 		if (tdvmcall_exit_type(vcpu))
-			return EXIT_REASON_VMCALL;
-
-		return tdcall_to_vmx_exit_reason(vcpu);
-	case EXIT_REASON_EPT_MISCONFIG:
-		/*
-		 * Defer KVM_BUG_ON() until tdx_handle_exit() because this is in
-		 * non-instrumentable code with interrupts disabled.
-		 */
-		return -1u;
-	default:
-		break;
+			exit_reason.basic = EXIT_REASON_VMCALL;
+		else
+			exit_reason.basic = tdcall_to_vmx_exit_reason(vcpu);
 	}
-
 	return exit_reason;
 }
 
-static noinstr void tdx_vcpu_enter_exit(struct kvm_vcpu *vcpu)
+static noinstr u64 tdx_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_tdx *tdx = to_tdx(vcpu);
 	struct vcpu_vt *vt = to_vt(vcpu);
+	u64 ret;
 
 	guest_state_enter_irqoff();
 
-	tdx->vp_enter_ret = tdh_vp_enter(&tdx->vp, &tdx->vp_enter_args);
+	ret = tdh_vp_enter(&tdx->vp, &tdx->vp_enter_args);
 
-	vt->exit_reason.full = tdx_to_vmx_exit_reason(vcpu);
+	vt->exit_reason = tdx_to_vmx_exit_reason(vcpu, ret);
 
 	vt->exit_qualification = tdx->vp_enter_args.rcx;
 	tdx->ext_exit_qualification = tdx->vp_enter_args.rdx;
@@ -977,33 +975,8 @@ static noinstr void tdx_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 	vmx_handle_nmi(vcpu);
 
 	guest_state_exit_irqoff();
-}
 
-static bool tdx_failed_vmentry(struct kvm_vcpu *vcpu)
-{
-	return vmx_get_exit_reason(vcpu).failed_vmentry &&
-	       vmx_get_exit_reason(vcpu).full != -1u;
-}
-
-static fastpath_t tdx_exit_handlers_fastpath(struct kvm_vcpu *vcpu)
-{
-	u64 vp_enter_ret = to_tdx(vcpu)->vp_enter_ret;
-
-	/*
-	 * TDX_OPERAND_BUSY could be returned for SEPT due to 0-step mitigation
-	 * or for TD EPOCH due to contention with TDH.MEM.TRACK on TDH.VP.ENTER.
-	 *
-	 * When KVM requests KVM_REQ_OUTSIDE_GUEST_MODE, which has both
-	 * KVM_REQUEST_WAIT and KVM_REQUEST_NO_ACTION set, it requires target
-	 * vCPUs leaving fastpath so that interrupt can be enabled to ensure the
-	 * IPIs can be delivered. Return EXIT_FASTPATH_EXIT_HANDLED instead of
-	 * EXIT_FASTPATH_REENTER_GUEST to exit fastpath, otherwise, the
-	 * requester may be blocked endlessly.
-	 */
-	if (unlikely(tdx_operand_busy(vp_enter_ret)))
-		return EXIT_FASTPATH_EXIT_HANDLED;
-
-	return EXIT_FASTPATH_NONE;
+	return ret;
 }
 
 #define TDX_REGS_AVAIL_SET	(BIT(VCPU_REG_EXIT_INFO_1) | \
@@ -1053,8 +1026,8 @@ static void tdx_load_host_xsave_state(struct kvm_vcpu *vcpu)
 
 fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 {
-	struct vcpu_tdx *tdx = to_tdx(vcpu);
 	struct vcpu_vt *vt = to_vt(vcpu);
+	u64 vp_enter_ret;
 
 	/*
 	 * WARN if KVM wants to force an immediate exit, as the TDX module does
@@ -1084,7 +1057,7 @@ fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 			kvm_wait_lapic_expire(vcpu);
 	}
 
-	tdx_vcpu_enter_exit(vcpu);
+	vp_enter_ret = tdx_vcpu_enter_exit(vcpu);
 
 	if (vcpu->arch.host_debugctl & ~TDX_DEBUGCTL_PRESERVED)
 		update_debugctlmsr(vcpu->arch.host_debugctl);
@@ -1093,18 +1066,23 @@ fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 
 	kvm_clear_available_registers(vcpu, ~TDX_REGS_AVAIL_SET);
 
-	if (unlikely(tdx->vp_enter_ret == EXIT_REASON_EPT_MISCONFIG))
-		return EXIT_FASTPATH_NONE;
-
-	if (unlikely((tdx->vp_enter_ret & TDX_SW_ERROR) == TDX_SW_ERROR))
-		return EXIT_FASTPATH_NONE;
-
 	trace_kvm_exit(vcpu, KVM_ISA_VMX);
 
-	if (unlikely(tdx_failed_vmentry(vcpu)))
-		return EXIT_FASTPATH_NONE;
+	/*
+	 * TDX_OPERAND_BUSY could be returned for SEPT due to 0-step mitigation
+	 * or for TD EPOCH due to contention with TDH.MEM.TRACK on TDH.VP.ENTER.
+	 *
+	 * When KVM requests KVM_REQ_OUTSIDE_GUEST_MODE, which has both
+	 * KVM_REQUEST_WAIT and KVM_REQUEST_NO_ACTION set, it requires target
+	 * vCPUs leaving fastpath so that interrupt can be enabled to ensure the
+	 * IPIs can be delivered. Return EXIT_FASTPATH_EXIT_HANDLED instead of
+	 * EXIT_FASTPATH_REENTER_GUEST to exit fastpath, otherwise, the
+	 * requester may be blocked endlessly.
+	 */
+	if (unlikely(tdx_operand_busy(vp_enter_ret)))
+		return EXIT_FASTPATH_EXIT_HANDLED;
 
-	return tdx_exit_handlers_fastpath(vcpu);
+	return EXIT_FASTPATH_NONE;
 }
 
 void tdx_inject_nmi(struct kvm_vcpu *vcpu)
@@ -1300,7 +1278,7 @@ static int tdx_report_fatal_error(struct kvm_vcpu *vcpu)
 	vcpu->run->system_event.ndata = 16;
 
 	/* Dump 16 general-purpose registers to userspace in ascending order. */
-	regs[index++] = tdx->vp_enter_ret;
+	regs[index++] = tdx->vp_enter_ret__unsafe;
 	regs[index++] = tdx->vp_enter_args.rcx;
 	regs[index++] = tdx->vp_enter_args.rdx;
 	regs[index++] = tdx->vp_enter_args.rbx;
@@ -2030,48 +2008,44 @@ int tdx_complete_emulated_msr(struct kvm_vcpu *vcpu, int err)
 
 static int __tdx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t fastpath)
 {
-	struct vcpu_tdx *tdx = to_tdx(vcpu);
-	u64 vp_enter_ret = tdx->vp_enter_ret;
 	union vmx_exit_reason exit_reason = vmx_get_exit_reason(vcpu);
+	struct vcpu_tdx *tdx = to_tdx(vcpu);
+	u64 status = tdx->vp_enter_ret__unsafe & TDX_SEAMCALL_STATUS_MASK;
 
 	if (fastpath != EXIT_FASTPATH_NONE)
 		return 1;
 
-	if (unlikely(vp_enter_ret == EXIT_REASON_EPT_MISCONFIG)) {
-		KVM_BUG_ON(1, vcpu->kvm);
+	if (KVM_BUG_ON(exit_reason.basic == EXIT_REASON_EPT_MISCONFIG, vcpu->kvm))
 		return -EIO;
-	}
 
 	/*
 	 * Handle TDX SW errors, including TDX_SEAMCALL_UD, TDX_SEAMCALL_GP and
 	 * TDX_SEAMCALL_VMFAILINVALID.
 	 */
-	if (unlikely((vp_enter_ret & TDX_SW_ERROR) == TDX_SW_ERROR)) {
+	if (unlikely(status == TDX_SW_ERROR)) {
 		KVM_BUG_ON(!virt_rebooting, vcpu->kvm);
 		goto unhandled_exit;
 	}
 
-	if (unlikely(tdx_failed_vmentry(vcpu))) {
+	if (unlikely(exit_reason.failed_vmentry)) {
 		/*
 		 * If the guest state is protected, that means off-TD debug is
 		 * not enabled, TDX_NON_RECOVERABLE must be set.
 		 */
 		WARN_ON_ONCE(vcpu->arch.guest_state_protected &&
-				!(vp_enter_ret & TDX_NON_RECOVERABLE));
+			     !(status & TDX_NON_RECOVERABLE));
 		vcpu->run->exit_reason = KVM_EXIT_FAIL_ENTRY;
 		vcpu->run->fail_entry.hardware_entry_failure_reason = exit_reason.full;
 		vcpu->run->fail_entry.cpu = vcpu->arch.last_vmentry_cpu;
 		return 0;
 	}
 
-	if (unlikely(vp_enter_ret & (TDX_ERROR | TDX_NON_RECOVERABLE)) &&
-		exit_reason.basic != EXIT_REASON_TRIPLE_FAULT) {
-		kvm_pr_unimpl("TD vp_enter_ret 0x%llx\n", vp_enter_ret);
+	if (unlikely(status & (TDX_ERROR | TDX_NON_RECOVERABLE)) &&
+	    exit_reason.basic != EXIT_REASON_TRIPLE_FAULT)
 		goto unhandled_exit;
-	}
 
-	WARN_ON_ONCE(exit_reason.basic != EXIT_REASON_TRIPLE_FAULT &&
-		     (vp_enter_ret & TDX_SEAMCALL_STATUS_MASK) != TDX_SUCCESS);
+	WARN_ON_ONCE(status != TDX_SUCCESS &&
+		     exit_reason.basic != EXIT_REASON_TRIPLE_FAULT);
 
 	switch (exit_reason.basic) {
 	case EXIT_REASON_TRIPLE_FAULT:
@@ -2136,7 +2110,8 @@ static int __tdx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t fastpath)
 	}
 
 unhandled_exit:
-	kvm_prepare_unexpected_reason_exit(vcpu, vp_enter_ret);
+	kvm_pr_unimpl("TD vp_enter_ret 0x%llx\n", tdx->vp_enter_ret__unsafe);
+	kvm_prepare_unexpected_reason_exit(vcpu, tdx->vp_enter_ret__unsafe);
 	return 0;
 }
 
diff --git a/arch/x86/kvm/vmx/tdx.h b/arch/x86/kvm/vmx/tdx.h
index ac8323a68b16..5564617fc12a 100644
--- a/arch/x86/kvm/vmx/tdx.h
+++ b/arch/x86/kvm/vmx/tdx.h
@@ -66,7 +66,12 @@ struct vcpu_tdx {
 
 	struct list_head cpu_list;
 
-	u64 vp_enter_ret;
+	/*
+	 * Discourage direct use of the raw VP.ENTER return value, as there are
+	 * several subtleties that need to be accounted for when working with
+	 * the raw value.
+	 */
+	u64 HINT_UNSAFE_IN_KVM(vp_enter_ret);
 
 	enum vcpu_tdx_state state;
