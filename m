Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4023C3C09
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 17:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357207; cv=none; b=ka0xOL3Bcq4gAL/o6j5GedGMFkRHSXnEYNO21au2CAESFuN8NLv7kiQ1VIqss09ylT2i/SJ95UekR0tm1ISDWORHc7WSnrVVG6ff4e9DGHCYH9EwOXOBc6wk845pqWq7pnlfa/F/HcpEJc9+cgUzeOm891ambron4jltcR45qts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357207; c=relaxed/simple;
	bh=Kb67YwfyWNoL2sF/ZNj2o27z2jN9tmL0em0j4RETEDk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tGvT2ETHcUHxTp8HvYa59gEUjyQ+2s074A60jzeNa10VHFEY8AfFu/wFtcGwkWOn7dLaV6sElW+85uQQ4wxIrPfPThqq0wpi6N66SETk2lctpwJ18HghmWA46Ak/tH/jHJb7BM6SQfqzqiYvROOi8eCIwCa+Q1Y4NThJo176Zd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MQ3ahVsc; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MQ3ahVsc"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396901263b6so1217026a91.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 10:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790357205; x=1790962005; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i5iqQY2eF2987byf6Cg4qriCDFMQPLoSo76CmmN4ILw=;
        b=MQ3ahVsczAIAFRXzXdnyUTU/D0l9fTzC/PxGq6dZito+F+qdqcMTlvu54KDmXPtckw
         NCAhbmFnrYkOBW9OqIJsT4ccaXa3qCcQtoNskXRdRSbwa5y1Mmz9eKoWILksr9M2upHs
         yfT+1nCuld0bh/1eYk+zOHD9AwfZ5iizqbnMyconsuGUB/dLSTXFdBjWUUm6KLJreOjn
         gjUQOjkDNy0HCZw56a04XwFuk7Fu6dsPrQuZpCvfxFu+4uO3kOv9chYJhI+KhLjiB6C7
         BkJlKBjflAt5Sd/Wbh2kHDeic5UN1zJumoHGObyGD2VO+J3iVhJjGX629VLZq2fcLYFm
         GrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790357205; x=1790962005;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i5iqQY2eF2987byf6Cg4qriCDFMQPLoSo76CmmN4ILw=;
        b=jkb+PYuH7diNLs+ZUdoscZyUE9F8SIrZBivdoZk4rCCT+p0uKEAFaE5jRlOTLaWdXC
         rXDYC7XBs85vsFFgrLTMk3rfiS8xi//I/LoFECc9sDDWgH/Vw/D0XPx6R19j6UhSfeGz
         vANy91NAVc+XRp+vHDSHxHNmnf+keLU5LvoO0j7rqG4bTVzxZUOyWSMW6ZSSBHaqU+d0
         IF5zjbEP1vNRtBaWIlOGoA3E4Xo3J4E0kCsrkzuuzV2+CuMKpSuVZoSTy8CmUjl6RptF
         eJkizQhHtN0PvnbU3EtjQpRlKwwjxXKi696tESC6u+8qC7+9xfimzvRgYMV8I1gLFDXD
         fuwg==
X-Gm-Message-State: AFuF++necMvC65gqvkdxtVtDoKphlSsUGmEs61mhRV5NLRwLxb0eYytF
	c/lk2ICiRn5EtEvpsKZjoye4ACnEZJCMOB7Q+geEJX/8+vENBZBEWCwGlxZP0RXo7i/G5SjNkyw
	RDpMjGBni2dYy7oLzmuj29+OTOo9ngONiFDlQ+wrJaHQmrWFPw1bnS6PUxVLuVCKwzCNYa9crgk
	ww1p5XWMmaPvaGwoqs/bFuBVkIAzc49c/8gbB7bbl2oLZNnQfi
X-Received: from pjbmj17.prod.google.com ([2002:a17:90b:3691:b0:3a0:a5f0:a52f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:384b:b0:3a0:c360:a562
 with SMTP id 98e67ed59e1d1-3a0c360bd58mr1579039a91.14.1790357204638; Fri, 25
 Sep 2026 10:26:44 -0700 (PDT)
Date: Fri, 25 Sep 2026 10:26:43 -0700
In-Reply-To: <20260721052113.18B251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260721050600.87268-1-shivansh.dhiman@amd.com>
 <20260721050600.87268-4-shivansh.dhiman@amd.com> <20260721052113.18B251F000E9@smtp.kernel.org>
Message-ID: <arau02kKKLWDOFcE@google.com>
Subject: Re: [PATCH v4 3/5] KVM: nSVM: Sanitize nested DR6 using kvm_dr6_fixed()
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Shivansh Dhiman <shivansh.dhiman@amd.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 21, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > index 8d1967f5c099f..9b1afa47c54c9 100644
> > --- a/arch/x86/kvm/svm/nested.c
> > +++ b/arch/x86/kvm/svm/nested.c
> > @@ -810,7 +810,7 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm)
> >  
> >  	if (unlikely(new_vmcb12 || vmcb12_is_dirty(control, VMCB_DR))) {
> >  		vmcb02->save.dr7 = svm->nested.save.dr7 | DR7_FIXED_1;
> > -		svm->vcpu.arch.dr6  = svm->nested.save.dr6 | DR6_ACTIVE_LOW;
> > +		svm->vcpu.arch.dr6  = svm->nested.save.dr6 | kvm_dr6_fixed(vcpu);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but kvm_deliver_exception_payload()
> in arch/x86/kvm/x86.c has the exact same flaw with DR6_ACTIVE_LOW.
> 
> Could it be fixed using the newly exported kvm_dr6_fixed() helper?
> 
> Currently, kvm_deliver_exception_payload() executes:
> 
>     case DB_VECTOR:
>         ...
>         vcpu->arch.dr6 |= DR6_ACTIVE_LOW;
>         vcpu->arch.dr6 |= ex->payload;
>         vcpu->arch.dr6 ^= ex->payload & DR6_ACTIVE_LOW;
> 
> This unconditionally forces all active-low bits to 1 before applying the
> current exception payload, destroying any previously accumulated 0 bits.
> 
> If a guest OS relies on the Bus Lock Detect #DB to mitigate DoS attacks,
> and another #DB event (like a Single Step) occurs before the guest clears
> DR6, kvm_deliver_exception_payload() will force DR6 bit 11 back to 1.
> 
> Because the new #DB payload does not have the bus lock bit set, the
> subsequent XOR leaves bit 11 as 1.
> 
> Does this destroy the accumulated event and allow a malicious task to evade
> detection?
> 
> Could this be updated to use kvm_dr6_fixed(vcpu) instead of DR6_ACTIVE_LOW
> to avoid clearing previously accumulated active-low DR6 events?

No, the whole thing needs to be rewritten.  The issue isn't active-low vs. fixed-1,
it's that the semantics of each bit are feature specific, i.e. don't correlate with
active-high vs. active-low.
