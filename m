Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F7254B1CA
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085446; cv=none; b=FubgvpePzSUad3XLjrVD9UakVFJKFpHjGGFmFhSl7NOhvuNtw7OK37UgPx90wQwMjhboYEei9M5ttdHenv4H6e815f/qyX4NjSIc5fLg/drDFX/zfK/x8vcbWck0LajlG05Yhrc/8pQyujdanFNId7ya+qKI6O9DJk4QQ1SX9mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085446; c=relaxed/simple;
	bh=Fu3Ddg5gltjwll26D0GeabvW9Z4l4liKG7V1O+2Mld8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aZU4c8qZ8sPR575CHF7pdd6Fw+eeau78hSgY+IiJaKWS654+olWQkGvlayC8BQLkUMagBSPDFXA8BsY3Yi0PWxw0uhgHj3JRcHYm3xK4tFUddtm20D/sGnyOGbfwKyeTucbkIMe5q31HjvEwiBZdabGrdkNJxApuDgoL2L6KnnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u2ryenut; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u2ryenut"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so76721585ad.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 06:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790085444; x=1790690244; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoR363Bok3mhAgop8XTST+t0fiNNL3cVY2T2m7iNRac=;
        b=u2ryenutYxqDai4EbMP7Q70BHLg7Yu02XbILp39bSj9jzQ048A1KQnKkUliSknnR5d
         d7Os1hMaVjsh+2OrZEmZnCYT8BtPzQK4Xh3XQnFZUJh2zLFdmFZ+Ho2poIjNtzhfx4kq
         2yUtsNMoftxW643SqVJ31RH+DAQo9AP2sYxpMM1WcsIfhktlY0Q9Uu/kv/qGp/hK+W18
         SiyqZ0yuuH0LPEqfCN8+JBp7LqwN9oLC8qS5Mx0PO3MUdYapjw3xkMSigEdKYQy1YI61
         3/mWgqpt/rB/6s+Sj3SrWzQlENoORJwE0cEm+pE2sXnbOk4Dl2plm+Ao++lnUlXJ6bMz
         QdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085444; x=1790690244;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LoR363Bok3mhAgop8XTST+t0fiNNL3cVY2T2m7iNRac=;
        b=BKD3vDDXIrB5kfVqIwqPWN5iQVYa1iHpJGddqpQ3b0+lWYBQsyMZbLUa4K7VsylGDG
         2ZfYeYTCC3cEVoLHLFXz4qCarlo18TvsKPP7ceiLCW0MyyQ8a8OqnZ7XKDd7w7+KpFP+
         ULsLtXnHW9XyEYSqN7/PtDN8jl2xiI4n8GzkBcJABmXRsKT8u3L6GBT1hDi50S7J5xO9
         zhc7VoUt4m7T+57GYEy3F37DKyO4wmNoWaFNamzXpFXTXZBlyA5PbtO89hVmU0WyrJC6
         +8GP4hbjW3X2bCqZs0kalpCqeJwk28HYPjIUjeV9q1HuDvWhhJRxbHJzsLd+bM6Ub9QO
         e71Q==
X-Gm-Message-State: AFuF++mjA9tcJpvxacFrScnkNmluaDsvxfG9al9322XVmwAgIrr24FiG
	1m9s8RPwZ/jQyjZM9KpvbTLZzjek0k4oU2o/o8AUcgmY0Vqcg8Qbhigc5DrANDWHjyNDLdh1DFR
	6hitDh8NOs109smbaAnU5wkv3YUZs1QKM0xkQm5PVknwdqo7TP22+Z6ySZ5yG0jND2iz08rCkDV
	mZ78i3HTAx3wN6lp7rJ3jdoCd4YyIzR0aimkJ9aTNi8dWqBIq3
X-Received: from plad11.prod.google.com ([2002:a17:902:e14b:b0:2df:42b8:5047])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf03:b0:2dd:c100:b2d0
 with SMTP id d9443c01a7336-2df60b7debfmr16320845ad.59.1790085443958; Tue, 22
 Sep 2026 06:57:23 -0700 (PDT)
Date: Tue, 22 Sep 2026 06:57:23 -0700
In-Reply-To: <20260918160109.E76B81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260918154530.4129698-1-jmattson@google.com> <20260918160109.E76B81F000FF@smtp.kernel.org>
Message-ID: <arKJQwAPvApkeESD@google.com>
Subject: Re: [PATCH] KVM: x86: Disallow EFER.LMSLE when EferLmsleUnsupported
 is set in guest CPUID
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jim Mattson <jmattson@google.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Sep 18, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] kvm: x86: EFER.LMSLE fix is ineffective due to dropped CPUID bit
> --
> 
> commit 0daddb3cb6cd07afcd9545a8e1643427a1542393
> Author: Jim Mattson <jmattson@google.com>
> 
> KVM: x86: Disallow EFER.LMSLE when EferLmsleUnsupported is set in guest CPUID
> 
> This commit updates KVM to reject guest writes to EFER that set EFER.LMSLE
> when the EferLmsleUnsupported bit is set in the guest's CPUID. It aims to fix
> an issue where a guest could enable EFER.LMSLE on hosts that support it, even
> if the VMM hid the feature for migration compatibility.
> 
> > diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
> > index 37d5bed3529f5..c8f894ccfb0f9 100644
> > --- a/arch/x86/kvm/msrs.c
> > +++ b/arch/x86/kvm/msrs.c
> > @@ -598,8 +598,11 @@ static bool __kvm_valid_efer(struct kvm_vcpu *vcpu, u64 efer)
> >  	if (efer & EFER_NX && !guest_cpu_cap_has(vcpu, X86_FEATURE_NX))
> >  		return false;
> >  
> > -	return true;
> > +	if (efer & EFER_LMSLE &&
> > +	    guest_cpu_cap_has(vcpu, X86_FEATURE_EFER_LMSLE_MBZ))
> 
> [Severity: High]
> Does this check actually work as intended on hosts that support LMSLE?
>
> Because X86_FEATURE_EFER_LMSLE_MBZ is defined as a PASSTHROUGH_F,
> kvm_cpu_cap_init() clears this bit in kvm_cpu_caps when the host hardware
> CPUID does not set it (which is the case when the host supports LMSLE).
> 
> Since the bit is missing from kvm_cpu_caps and is not an EMULATED_F,
> kvm_set_cpuid() ANDs the VMM-provided CPUID with 0 for this capability.
> Consequently, vcpu->arch.cpu_caps does not retain the bit, and
> guest_cpu_cap_has() here will unconditionally return false.
> 
> Does this mean the bug remains triggerable by a guest running on a host with
> LMSLE support when the VMM attempts to hide the feature?

Gah, I hate the negative "feature" bits, I've gotten completely turned around
multiple times trying to sort through this.

IIUC, you're trying to "fix" setups where host CPUID.EFER_LMSLE_MBZ=0, but userspace
configured guest CPUID.EFER_LMSLE_MBZ=1?  If so, then Sashiko is right, it needs to
be declared with EMULATED_F().  I would even argue that technically this isn't a KVM
bug, because KVM won't advertise EFER_LMSLE_MBZ in KVM_GET_SUPPORTED_CPUID on such
hosts.
