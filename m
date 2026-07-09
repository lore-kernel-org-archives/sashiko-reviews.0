Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC86347DD
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 17:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616512; cv=none; b=urqA3Yi375Kin2Goc46qzYkfLdqPCgqxWdAdKy9yUc7wKyVhimiS8gaGb6J35qOVCWIMjPRH0xHEf2CLM9BlHS/vFGfJZZ9GwxX25pYWVBYUqx0bmyxDsx1Z+zMbD5aQKUBN7OsT19hA+2jnOLP1/tK+S/rOaVK0OBQ0GJJJq9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616512; c=relaxed/simple;
	bh=6Zs062YLjdIDYSIt85dGwPx7Wguj2rJtI2noO3I3+3E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fEqZ1m3PEpJOwxH62zi7E6W1/oq7ltA8jQbfd4Wor4zWgNj2W+ndKkXFecIdL9+F1RvGFdYmBV+xeZAAVmBnushhMmSUgKVa/DmA1oJ1Ci3ZuHBumIYHAg+BiqUCOowaTDg/wiNocaG24U6B3LoYoBhCkBG7yUxoiI/SNB2juns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rkvJ1Cuk; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rkvJ1Cuk"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-380a638fb5bso115534a91.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 10:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783616511; x=1784221311; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3gjAP/3eCSQHeg69MkcqiPZ51yScaerja/WG4n8SwM=;
        b=rkvJ1CuksU1pLeFazlhVyL7sgfG2/zpfI9sMF4S4h0hcBHo6CWyCh8skJ2XXHMQR1y
         4xegT0l4JOPHrwuXxC0229aYdmY8VR8jjW0imoFjRpvb9YMvpPTaCbtjmw7Tkp1QYgMs
         +yoCcpsH1zASN4VvzWG7hzSID+FqwfAj3aAkLpNU0jQNOuCmRW26HtZ1vEq0V+vs4uew
         ehrfuwJ1iXYDAJdp1aBw3CPv2xgdYgyWFHnmr/pWJFmBHsemYfBzEsAZWEld2vuHTtbB
         fM+2PQSRZjfuaKU/TLyMorXG3WnN/d13N1s7DMpN5k7HeGhOPCBh9X2SwKaf09p199vV
         L+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616511; x=1784221311;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3gjAP/3eCSQHeg69MkcqiPZ51yScaerja/WG4n8SwM=;
        b=etG+OyMJEtRQs7ExaOg9EoPNeYBEZNurm1vfqju+06NZdxKknW/M/X4Sc+a8xTxL82
         Xf/RhAwRPusRVeJTD8F27yxrIElu7tMzhKmH+4R9f5GHDWvXQTXZrbbw/zsl7wMcd/Vp
         qKavA+2xB2a7YYRAxKUUlvMc9nnC65pRM2l/EwaiVa5AMfKpTeSm38FrbDy8r6XvvR7K
         YzOFzgvCXueXyBIf0cRictgdwtPJJa91IpxNjt0pws/UQUCfYgd1G4aKJCFiklQdBh5J
         VT4btNjjn6r2BCiyLRvX6er/zBS/fG7btXOFxxr/r9ErSUU21gYeA0D6asXeKGEhGP9a
         /E0Q==
X-Gm-Message-State: AOJu0Yx2T0WBupQRGzWDkQ9zfy4PRiuEVIArawrcsBUa5keFp6P21DOC
	1GPIES1jXPdkv/nqBNjc5vQuh8MdyDAip3x+/B60xGiQ3JwLzq62D31uANonDK7o/+XWpS14VEk
	6qdXZAs2cne5uJWo3Nb9H/21Y6BPZx+KR381sg2z9KyNM5Tly8xPgRia6I4k+hrWUfI7+RCLENs
	b7VQ6xBRrg4geMbTs+yPrIiLD06TWqMrINHKTU0s/Tnt2sgCT4
X-Received: from pjbqo5.prod.google.com ([2002:a17:90b:3dc5:b0:381:ef4:4373])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a49:b0:387:e0db:bc2b
 with SMTP id 98e67ed59e1d1-389426933cdmr7799692a91.43.1783616510499; Thu, 09
 Jul 2026 10:01:50 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:01:49 -0700
In-Reply-To: <20260709055321.EED4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260709053949.211165-1-SaiMadhu.KoyyalaHariVenkata@amd.com> <20260709055321.EED4B1F000E9@smtp.kernel.org>
Message-ID: <ak_T_YM7Oc0Ne--m@google.com>
Subject: Re: [PATCH] KVM: x86: Preserve KVM_EXIT_DEBUG on emulated HLT with single-step
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: suryasaimadhu <SaiMadhu.KoyyalaHariVenkata@amd.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 09, 2026, sashiko-bot@kernel.org wrote:
> KVM: x86: Preserve KVM_EXIT_DEBUG on emulated HLT with single-step
>     
> kvm_emulate_halt() calls kvm_skip_emulated_instruction() before
> kvm_emulate_halt_noskip(). When single-step debugging is active,
> the skip path can trigger a debug exception and set exit_reason to
> KVM_EXIT_DEBUG, but halt emulation then overwrites it with
> KVM_EXIT_HLT on the userspace LAPIC path. Return immediately when
> a debug exit is already pending so userspace debuggers receive the
> correct event.
> 
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index ff8812f3a1293..473a03f58e263 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -11701,10 +11701,16 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_halt_noskip);
> >  int kvm_emulate_halt(struct kvm_vcpu *vcpu)
> >  {
> >  	int ret = kvm_skip_emulated_instruction(vcpu);
> > +
> >  	/*
> > -	 * TODO: we might be squashing a GUESTDBG_SINGLESTEP-triggered
> > -	 * KVM_EXIT_DEBUG here.
> > +	 * If kvm_skip_emulated_instruction() triggered a singlestep
> > +	 * debug exception, return to userspace immediately so the
> > +	 * debugger can process the event. Do not let halt emulation
> > +	 * overwrite the KVM_EXIT_DEBUG exit reason.
> >  	 */
> > +	if (vcpu->run->exit_reason == KVM_EXIT_DEBUG)
> > +		return ret;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does restricting this early
> return exclusively to KVM_EXIT_DEBUG overwrite other critical exit reasons?
> 
> If kvm_skip_emulated_instruction() fails (e.g., executing HLT inside an
> SGX enclave), it queues KVM_EXIT_INTERNAL_ERROR and returns 0.
> 
> Because this check only handles KVM_EXIT_DEBUG, emulation failures fall
> through to kvm_emulate_halt_noskip(), which then overwrites the exit reason
> with KVM_EXIT_HLT for the userspace LAPIC path.
> 
> > +
> >  	return kvm_emulate_halt_noskip(vcpu) && ret;
> >  }
> >  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_halt);
> 
> [Severity: High]
> This is a pre-existing issue, but it looks like the same issue is present in
> kvm_emulate_ap_reset_hold().
> 
> arch/x86/kvm/x86.c:kvm_emulate_ap_reset_hold() {
> 	...
> 	int ret = kvm_skip_emulated_instruction(vcpu);
> 
> 	return __kvm_emulate_halt(vcpu, KVM_MP_STATE_AP_RESET_HOLD,
> 				  KVM_EXIT_AP_RESET_HOLD) && ret;
> }
> 
> Because && evaluates left-to-right, __kvm_emulate_halt() executes
> unconditionally and overwrites the exit reason with KVM_EXIT_AP_RESET_HOLD,
> even if kvm_skip_emulated_instruction() already returned 0 to exit to
> userspace with a debug exception or emulation failure.
> 
> Does kvm_emulate_ap_reset_hold() need a similar fix?

I think we should simply delete the TODO.  Architecturally, the HLT side effects
effectively have priority over the single-step #DB because the such #DBs are in
the "Traps on the Previous Instruction" class of exceptions, i.e. by definition,
the previous instruction has to have retired to take the single-step #DB.

And in practice, running without an in-kernel local APIC is all but deprecated
these days, so I don't see any value in going out of our way to split hairs over
which userspace exit is the "best" in this case.
