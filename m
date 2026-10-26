Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038143;
	b=AusLZ3sGcY6uOeuaVA9iYh/s/G0hncdoT/k8rUDPw3RdEniKEW30fKlsPPnlrJptM9uX
	 kmN+kGJf07eEGl7Z52WWwHPZP/yiAPXOf09kUPq1fzerp7rUAQNBo01i7SOGsYB9oKzH5
	 ib49ykMtG1566DksEgNQlq9NUUIRTKVh8PLEF8ycioGGu8NQEK7quPGncDviXIlYCwQWR
	 XfEaDTBXBYAQtigqRieoEpBZesQY6uPt8iMWEq7aG3DMnXZTsYn9pztbrS3mLYTKfmIIb
	 8CYoAQmOQLm1/Dl5QiB2u4oNPhoCrQyDt3uonetx/7TermTyomiiI4rW0jKpxhuE5cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Kv2U2+i5YrqjHvWntz1heOg13a9Ao3/MyitVnANiQ8U=;
	b=0zEJpaozpfqO2jkagh3Bf2A51W4OP0uQoa4wtauZYPpI4ZqwkX5JW76gJm6LRh+3QN8y
	 c+ffht8SRVGUdyq6utA2qDSHeiXFDZG8q6FXOjpDcO3zCCCPPoKwjpEcY4vCqRa5qKDIl
	 6WYIr6JsB84VuWo8ZsogNHfwzYIOLZyK/iAFAtaShidzsD2eEBJdlhCnfIXBgjy28wynd
	 HOmrXyLpQcO8M7lcpugThmEi6QMKhgvR/GdLoA3w75jksqU3dHsyuenmPrczgUZc60sE9
	 LMmmdmf72DeMbSa60PrIerDPSklfxZHxj5kjBw7khu5mFreJ1CEbAzsw+HyeN66WePw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NyxD3NAQ;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58900606A31D
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 18:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58900606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=NyxD3NAQ
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065e2933fso4680525b3a.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 11:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793038143; x=1793642943; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kv2U2+i5YrqjHvWntz1heOg13a9Ao3/MyitVnANiQ8U=;
        b=NyxD3NAQwnCtYvS8Ubykr7UugRqHPkHvOvyx/7HIL+pM39+FMlQtxmtYJKIwdqd3LV
         pTjKHreFG6HNBSHjGsMAj1PudgLGXCDYxkWcImHbj9ZG6S02GB2vOMqPtneh6JyPpVyb
         Uvwevq1lTzVdjpirJ5Rg2QPeIhwuKU1ODSs9Cgag7lNmlPosUaaK8IE5EeugowwaUpaY
         dfrnw4BcsNATVqs+3RM/DyLj1s3jFCEIm7IRxB0EPC7SZJGNlw39TiTcDOGMlPKVf8Oc
         iycO4fRZNCdlyjHxTJ6W0Oido8zGw4sq9ux187LL5QS7KxC54X/qrfMGlPh2zL2kSpYJ
         SNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038143; x=1793642943;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kv2U2+i5YrqjHvWntz1heOg13a9Ao3/MyitVnANiQ8U=;
        b=wGe5YhOlmVB2/bn4hyDyLQUg4krtnk02owVWa5GFZKrlCqirps+TOz2QVV8FbLjyri
         wIbF/94OfjEuBCwSxjiXY5rHrZPQv5vMkUeOwy5aY1zhixzAHE7pfSaPwvLtrPwOc7Dh
         VswDuRfMsRP5Qh2e2XAJ92NYK4XVp9xK6p6L3mh3Rd2+NG+e9yP8GFLy3kRf7V95TpFO
         O0wn+fBIf/vhjUHNI6eaiOm7EzNJpCGJsb418JbJNMZBi2WZi62vEnRPQELoJN/UAsa8
         5CL9+cMUQtAICtEJLKv4RXfjd/YdUJeuJPqOtxZ5ZEjSE2XJeMfeC8e7eLxi7kFVSwVZ
         dhZQ==
X-Gm-Message-State: AFq9FYIgrxwExkd825HONTjLH9IIMfZyLet69B2/H6rIXGxEQcQ2YAW6
	sgm0hXhPwJ7rRZu2vGEcSjKEzJeM62w8NdAF+MRaQqoTyyXd7IXthQJT/u8RFK74bS3SQgTzq7w
	VPURBiGChzGcRtItNa4LCN80mqw+BAd/EcqWlX89Cfkbr7MMDoXr8H9S5Dgs2ERoKpqw5oTJhYs
	uuyCYMZZkP2dezCKmlbiPMFOuRf6qcEotyiYLRlT63w09+k5cC
X-Received: from pgli22.prod.google.com ([2002:a63:1316:0:b0:cd7:f985:396d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3c8e:b0:3e1:1db7:7608
 with SMTP id adf61e73a8af0-3e7cd5ee414mr6775984637.54.1793038142494; Mon, 26
 Oct 2026 11:09:02 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:09:01 -0700
In-Reply-To: <at-TP7Il6rWcd5Xh@google.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261022223052.646891-1-seanjc@google.com> <20261022223052.646891-4-seanjc@google.com>
 <sashiko-outbox-182134@kernel.org> <at-TP7Il6rWcd5Xh@google.com>
Message-ID: <at-XPai1zCM_Zr2z@google.com>
Subject: Re: [PATCH 3/4] KVM: x86: Recompute EFER.LMA instead of inheriting
 the current value on EFER writes
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 26, 2026, Sean Christopherson wrote:
> On Thu, Oct 22, 2026, sashiko-bot@kernel.org wrote:
> > Because svm_set_cr0() sets EFER_LMA without checking is_pae(vcpu) (for
> > example on an SEV-SNP AP created via SVM_VMGEXIT_AP_CREATE where
> > sev_snp_init_protected_guest_state() calls kvm_vcpu_reset() and clears
> > vcpu->arch.cr4 while the VMSA has CR4.PAE=1), 

Wait, no, kvm_vcpu_reset() also immediately clears EFER:

	kvm_x86_call(set_cr4)(vcpu, 0);
	kvm_x86_call(set_efer)(vcpu, 0);  <===

and svm_set_efer() sets vcpu->arch.efer verbatim.

> > or if a guest clears CR4.PAE observed via cr_trap() while EFER_LMA=1,

And I'm pretty sure Sashiko is wrong on this one too, as this can't happen.
Clearing CR4.PAE while long mode is active results in a #GP, and hardware should
enforcee that when MOV CR4 intercepts are trap-like.

So I don't think the vcpu->kvm->arch.has_protected_state waiver is needed (though
I do think it makes sense to WARN and continute, not WARN and reject).

> a subsequent efer_trap() ->
> > set_efer() sees EFER_LMA=1 with !is_pae(vcpu) and triggers the WARN_ON_ONCE()
> > and #GP.
> 
> Ugh.  I _want_ this to be a KVM bug, e.g. as is already pointed out by the comment:
> 
> 	 * Clear EFER_LMSLE for a related reason: EFER writes are *trapped*,
> 	 * not intercepted, i.e. hardware has already committed the write by
> 	 * the time KVM gains control, and the trap is enabled if and only if
> 	 * the guest is SEV-ES, whose EFER lives in the encrypted VMSA and so
> 	 * can't be fixed up by KVM.  Rejecting EFER.LMSLE=1 would inject a #GP
> 	 * *and* leave EFER.LMSLE set in the guest, which is strictly worse
> 	 * than honoring a write that hardware itself allowed.
> 
> "rejecting" a value and injecting a #GP is completely pointless.  The guest already
> has the "bad" value in EFER, and a misbehaving guest can simply eat the #GP.
> 
> But the issue is really just that KVM simply doesn't have visibility into EFER.LMA
> being set.  Heh, which technically makes this a bug fix, since IIUC, the current
> code will never set EFER.LMA in this case?
> 
> I can't think of any way to do the right thing other than to rely on hardware to
> not screw up?  E.g.
> 
> diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
> index 41f3ec6eb286..3a6a0ebf1932 100644
> --- a/arch/x86/kvm/msrs.c
> +++ b/arch/x86/kvm/msrs.c
> @@ -648,7 +648,8 @@ static int set_efer(struct kvm_vcpu *vcpu, u64 efer)
>  	 * it means KVM allowed architecturally invalid state at some point in
>  	 * the past, i.e. allowed EFER.LMA=1 && (!CR0.PG || !CR4.PAE).
>  	 */
> -	if (WARN_ON_ONCE((efer & EFER_LMA) != (vcpu->arch.efer & EFER_LMA)))
> +	if (WARN_ON_ONCE((efer & EFER_LMA) != (vcpu->arch.efer & EFER_LMA) &&
> +			 !vcpu->kvm->arch.has_protected_state))
>  		return 1;
>  
>  	r = kvm_x86_call(set_efer)(vcpu, efer);
> 
> 
> Hmm, though all of these cases make me wonder if we'd better off with just a WARN,
> i.e. no #GP, since the goal is to enforce a consistent model, which is what the
> new code does.
> 
> 	/*
> 	 * Toggling EFER.LMA on a bare write to EFER should be impossible, as
> 	 * it means KVM allowed architecturally invalid state at some point in
> 	 * the past, i.e. allowed EFER.LMA=1 && (!CR0.PG || !CR4.PAE).
> 	 */
> 	WARN_ON_ONCE((efer & EFER_LMA) != (vcpu->arch.efer & EFER_LMA) &&
> 		     !vcpu->kvm->arch.has_protected_state);
> 
