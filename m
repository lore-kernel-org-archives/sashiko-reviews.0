Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B4B2D3A7B
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 01:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779932601; cv=none; b=ZvOlzeqXzp504KlGhJBK5f3WNZZEvESZFyN87USiamc3vb3kljnSxzdBatLuC6o6SKk+hrH5nPreJV/KrrImZ6tYVcenHK/q3sg2Gj+X7Bovx+1embh7CMPPtjXv6aggdG6hnAatZR/K+/8q3x/XZhhMBM87nA69zhpyjPPi+WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779932601; c=relaxed/simple;
	bh=JfSktUJOyWdwH7TyFs2Ee/NbtmwJ8qaa3GUTw+NIG0c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Txf6CezOvUzdcWVi2cBv5Ty5J+39KYKFN9Vl/hV262YO3rjROZYO/+09jVYLfbsNSUBSlInoKcBmzG1FZRk9tynevNEZkjrc+IZYM6eAmO/WqhO0JTJQdN8ZNyU6d585KisRWhIP8BEP0J7MV4RUXtRT7mkHTR0NVVb7Yvjpla4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hbZqvAGG; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hbZqvAGG"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bf0453031aso4196175ad.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 18:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779932599; x=1780537399; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7/k0yWKOrPshF9jv7c3p2roI5HQdZlFHQmxVPy6DDis=;
        b=hbZqvAGGvI8lvq+2m6ajV1hCDUFfTDV4YrEr7UI4DCPrTI24pxCFtYq67Ft98Vvfj0
         UDhN9srRwyW1OP6hbHrZSimyAuTVg+pt77A+CQuvMPeBRYTu6RnvCYMJEgXhqIqljHPm
         +ktXuWgizBxk9C1qhfzPdcuigCr/DubuvPzqF6nDHr2+H4pZiFub1XXQqSMKpoe8q7Ng
         gWzRwsrMHYWyGZsOKyjsWxpxHJmyPBjqErVJvamKiZXP7EZI1ymGhNEtsdeqDRw8qr4I
         vTLfEK1Bupzi/3ByTGsM5k5JleZGC4iebvPYck7f1qgi5LZT71Bu5ivpEFv2H3/BluDD
         wxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779932599; x=1780537399;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/k0yWKOrPshF9jv7c3p2roI5HQdZlFHQmxVPy6DDis=;
        b=pVJyF6x/xMqcwwcFnaT38SGCG2OsHCWteIjZgMH2HIf/WB6mWlPhbwSg/H2DYVGE0g
         xODcaEB4Bmp/k66onvY/kU6rtQoaOBNjno8h/QubVTnq0HDK/xcAa5mZ8u5a1GVFY5Vp
         gePp/4P5nDn6PiSSfv7UzQOIpBoTf3zvWrwijjqJTItHJvuK94pNH38PJrlphU+vKCZP
         M2VMz4Ye9lyQ6+raGelT1/21P6p2ZlKKG9Ucmmh0a9nX3kCY+Wi+5gLUNRUHyrSZpx19
         qh1jq5Gu8t0AEmKbvL3GODL/vdRRxSAZxxLU0lU3X0Xb1sYzXWlVVBp9KOBSU+8IQKbc
         INSQ==
X-Gm-Message-State: AOJu0YzqIFQ/NGnJekMITn8KG8w4cyKH8Xw9qBV6+HgMmY3YUp4TuLnb
	cqV9won1bZ48lrU+IrI3zd0HZHb1+UeFS/TWZRV1VwHrv3SPXIB8jnyujj8CbneCkRPjJ8KwEbX
	UzsSHhRp5s1SYj5a9/tBXkNLxS4i7F4DzdS6mrW/wMAf1zSbwBY7IZXVNV0c/pcJ8EsHF+yeM61
	n0qaGG9G5k0wHFn5ynDMrImDUaIfUAHx9c+gRrysneL9h9HFQ1
X-Received: from plry21.prod.google.com ([2002:a17:902:b495:b0:2bf:ce7:ae06])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a0f:b0:2bf:82c:6322
 with SMTP id d9443c01a7336-2bf082c66dcmr10968485ad.3.1779932598848; Wed, 27
 May 2026 18:43:18 -0700 (PDT)
Date: Wed, 27 May 2026 18:43:18 -0700
In-Reply-To: <20260528003452.7577E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260527234711.4175166-11-yosry@kernel.org> <20260528003452.7577E1F000E9@smtp.kernel.org>
Message-ID: <ahedtk6TyzgmgNOa@google.com>
Subject: Re: [PATCH v7 10/17] KVM: x86/pmu: Disable counters based on
 Host-Only/Guest-Only bits in SVM
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Yosry Ahmed <yosry@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, May 28, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
> > index 7aa298eeb0721..41ee6532290e9 100644
> > --- a/arch/x86/kvm/svm/pmu.c
> > +++ b/arch/x86/kvm/svm/pmu.c
> [ ... ]
> > +static bool amd_pmc_is_disabled_in_current_mode(struct kvm_pmc *pmc)
> > +{
> > +	struct kvm_vcpu *vcpu = pmc->vcpu;
> > +	u64 host_guest_bits;
> > +
> > +	if (!kvm_vcpu_has_mediated_pmu(vcpu))
> > +		return false;
> > +
> > +	/* Common code is supposed to check the common enable bit */
> > +	if (WARN_ON_ONCE(!(pmc->eventsel & ARCH_PERFMON_EVENTSEL_ENABLE)))
> > +		return false;
> > +
> > +	/* If both bits are cleared, the counter is always enabled */
> > +	host_guest_bits = pmc->eventsel & AMD64_EVENTSEL_HOST_GUEST_MASK;
> > +	if (!host_guest_bits)
> > +		return false;
> > +
> > +	/* If EFER.SVME=0 and either bit is set, the counter is disabled */
> > +	if (!(vcpu->arch.efer & EFER_SVME))
> 
> [Severity: High]
> Does this correctly evaluate the L1 guest's EFER.SVME bit, or does it evaluate
> the L2 guest's EFER.SVME bit during nested execution?
> 
> When L1 programs a Guest-Only PMU counter to profile the L2 guest, KVM
> evaluates L1's PMU configuration. However, during nested execution,
> vcpu->arch.efer reflects the L2 guest's EFER.
> 
> Since most L2 guests do not enable nested SVM (meaning L2's EFER.SVME is 0),
> could this cause the counter to be incorrectly disabled, preventing L1 from
> profiling L2?

VMRUN fails if EFER.SVME isn't set in the VMCB save area, i.e. in vmcb12, and
clearing EFER.SVME while in guest mode is architecturally undefined (KVM triple
faults the entire VM).  I.e. this can't happen.
