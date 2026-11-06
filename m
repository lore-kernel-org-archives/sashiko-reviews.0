Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976772;
	b=hYRtmPWk/256JJ63h8zH//Tdo72s6xkXv9h8/QjmkzrkNVrucG9XqNAM40d6hcLxu4lG
	 eg307HPdl0/+2Q4R56bunDPRPO+DE7Ya+Fk9z80ojkNFA15VAoFj5pemKrTrQYZpvY4bo
	 9pTBVET9V3YjSSlh71I79K0CbrZZQbG3q8KHgCxy15kJDZpPHhQPmal9fUkJGGgebx6Aq
	 G4Sd8/4b4wSYJd/bqY7vueun5uI5NuT/73Lq4Pf3nxCW9+gDxal8D25jdSEuFlDNHUBrF
	 r170RdrKASufCNTK01EZ1HAyTXf9SNYhKa+pN/fNB7k++1/AaCyh6CgE8WvVfqIEkig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=mTZoZl82Wnsn4g/swOfuMpM27YOTs61qdqkI+/vOOPI=;
	b=PZSmgeTvyZ78ZzEqjMddjroGIT5FD23DU084/NrUGOrLc3dJuR3o/GYwq+Peyk/9n+kK
	 RF/yXc4BQtIKoYTUHMyvfUHGEmOBDd8/Kz7rQlJALBsWByS8XTMnkYRW+AFc7qS71hnMO
	 cWhWfXbmNzu/cz/UW3e9hiff0K+QLTAAKIiidGU0T/jrrcZ5Swa4DhsHViX/KQNf3bE8+
	 0/7LkwaV4FHbFmjSWPhcf419aRBB79wFd+BstSINq37KmG9EO0BE4ojmPNWWDKYpeL/TD
	 yixwCj9k65H6lvJWCNErnZWy2k2HKPhm8rBXiUGQlYE6y2evIH3CaGw4TRKKneXGzng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gS1cJu35;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F275A606A32E
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 14:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F275A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gS1cJu35
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so1450996a91.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 06 Nov 2026 06:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793976771; x=1794581571; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTZoZl82Wnsn4g/swOfuMpM27YOTs61qdqkI+/vOOPI=;
        b=gS1cJu35xDM88kmgD8A3P+8Pfp5cqZ8O9E599jOLTWwuoZPDpDpTyJFLxOO5H4MB2o
         RKVT4tZVnOrlE13701t33sRDzoE/mw9Hi4DqVZDdHdR9kSytZCYWToBN6S+R2ESpXP1q
         Luxv90ynyefL85HiLM2p/3XZJLq70aptfqdlSmZBq0y+hB3UdMnulXFHBjOu82ViJg1b
         2HOP+lrvD+E6SGFXyFwYspi6yTLNfxCyk4xLNq3Nl6S6m+WOtiLdXEUXjaXhe1EpiIa4
         E1PatXWUC/mzu1ujZIyDY6TU+YKWhKE7CwXTCbQcFCLXQVi9B8vD+BuMAFAJK+Oyy05b
         U+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976771; x=1794581571;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mTZoZl82Wnsn4g/swOfuMpM27YOTs61qdqkI+/vOOPI=;
        b=ewHfl8aYBKNZ2m8LAl0iAcdr3BfW9Z9eVZiApIkOTKjs2viS/ovOE8gp1iiu+fsL31
         lLbmZDdhs/mA5IlwZXYuhrxW9iqej09mnuozyGZTUk+PxM5u+jrEsMnefYQIv8Wbbins
         vILWkYEBn7575s7Je4LXUUa/7zkpw6FHt40OCAmyyf+RPGWs6ulvEtzaTTJSpKiYLtGE
         eKv8oDehv3ZLzUdGufq8opJTc7GJqrwhHPY2Qb38FH9KIPZxN8oMdqD3Hmn+1o+OHmCs
         xfpc9KXDzDUfOUFp454RNDE/Bjm6lIW9kYcqJhrDy+VFTBxACs1XFQfgrDqdKN6F3SDj
         ukPw==
X-Gm-Message-State: APuU4Z+4Q38pThL836y/RmEOcHVQi0n1XkO5BQ+cDAuRQ9b+a4ojiOBv
	l5oSk9JADP43PrzFiY0AvIzKasXbHDajxwqleypAcEc5ql4u2NNo4URvN5CKLzYQAqKUKIEnWKV
	scBFVta6Scxp2klBFTCQ3NPkNEo3fmFdXe/fQRbk+0/AtLk/H5ycTQHPcv5htB/U2YQ0odJOo2k
	iNV00XeBmTcJRJqoaWn2eA4xA6ShXuI7Hw6+7WURn2u/hGVx+k
X-Received: from pjbch23.prod.google.com ([2002:a17:90a:f417:b0:3b0:98dd:7ee1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:164e:b0:3a0:e568:ed63
 with SMTP id 98e67ed59e1d1-3b0db6b6e58mr1611679a91.8.1793976770968; Fri, 06
 Nov 2026 06:52:50 -0800 (PST)
Date: Fri, 6 Nov 2026 06:52:50 -0800
In-Reply-To: <sashiko-outbox-200423@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
 <20261105-tdx-selftests-v16-18-2024e8fa517a@google.com> <sashiko-outbox-200423@kernel.org>
Message-ID: <au3pwtxF9Qs97mfu@google.com>
Subject: Re: [PATCH v16 18/20] KVM: selftests: Add support for per-VM ucall
 ops on x86
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lisa Wang <wyihan@google.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 06, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] KVM: selftests: ucall_x86_ops is a host global instead of per-VM state
> --
> 
> commit 220d73be4cec0aafb094f8711c312a5a8ae361c9
> Author: Sean Christopherson <seanjc@google.com>
> 
> KVM: selftests: Add support for per-VM ucall ops on x86
> 
> This commit introduces an ops structure for x86 ucall handling so that
> different VM types, such as TDX VMs, can wire up their own do_ucall and
> get_ucall callbacks.
> 
> > diff --git a/tools/testing/selftests/kvm/lib/x86/ucall.c b/tools/testing/selftests/kvm/lib/x86/ucall.c
> > index 38050c60a0670..3aec4dd46d1b2 100644
> > --- a/tools/testing/selftests/kvm/lib/x86/ucall.c
> > +++ b/tools/testing/selftests/kvm/lib/x86/ucall.c
> [ ... ]
> > @@ -26,3 +26,26 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
> >  	}
> >  	return NULL;
> >  }
> > +
> > +static struct {
> > +	void (*do_ucall)(gva_t uc);
> > +	void *(*get_ucall)(struct kvm_vcpu *vcpu);
> > +} ucall_x86_ops = {
> > +	.do_ucall = ucall_x86_do_ucall,
> > +	.get_ucall = ucall_x86_get_ucall,
> > +};
> > +
> > +void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
> > +{
> > +	sync_global_to_guest(vm, ucall_x86_ops);
> > +}
> > +
> > +void ucall_arch_do_ucall(gva_t uc)
> > +{
> > +	ucall_x86_ops.do_ucall(uc);
> > +}
> > +
> > +void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
> > +{
> > +	return ucall_x86_ops.get_ucall(vcpu);
> > +}
> 
> [Severity: Medium]
> As reported by Sashiko on v15 [1], ucall_x86_ops in
> tools/testing/selftests/kvm/lib/x86/ucall.c is defined as a single
> process-wide static variable on the host rather than per-VM state.
> 
> While ucall_arch_init() uses sync_global_to_guest(vm, ucall_x86_ops) to copy
> the structure into each guest VM's private address space for guest-side
> ucall_arch_do_ucall() execution, ucall_arch_get_ucall() executes on the host
> and dispatches through the single host-side ucall_x86_ops.get_ucall pointer
> instead of per-VM state associated with vcpu->vm.
> 
> In the following patch ("KVM: selftests: Add support for TDX ucalls, via
> TDVMCALL_REPORT_FATAL_ERROR"), ucall_arch_init() mutates the host
> ucall_x86_ops in place when is_tdx_vm(vm) is true without restoring the
> default x86 callbacks when is_tdx_vm(vm) is false. If a selftest process
> creates a TDX VM via __vm_create() -> ucall_init() -> ucall_arch_init() and
> concurrently or subsequently creates and runs a non-TDX VM, won't the
> non-TDX VM inherit the TDX ucall callbacks both in guest memory and on the
> host in get_ucall() -> ucall_arch_get_ucall()?

/facepalm

I over-engineered this.  OMG, and I complete forgot about write_guest_global(),
which I added specifically to make ucalls multi-VM friendly, i.e. we can even
make the initialization thread safe.  Hilarious.

We can either do:

  void (*x86_do_ucall)(gva_t uc);
  
  void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
  {
    	write_guest_global(vm, x86_do_ucall, is_tdx_vm(vm) ? ucall_tdx_do_ucall :
  							     ucall_x86_do_ucall);
  }
  
  void ucall_arch_do_ucall(gva_t uc)
  {
  	x86_do_ucall(uc);
  }
  
  void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
  {
  	if (is_tdx_vm(vcpu->vm))
  		return ucall_tdx_get_ucall(vcpu);
  
  	return ucall_x86_get_ucall(vcpu);
  }
  
or:

  static bool ucall_is_tdx_vm;
  
  void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
  {
  	write_guest_global(vm, ucall_is_tdx_vm, is_tdx_vm(vm));
  }
  
  void ucall_arch_do_ucall(gva_t uc)
  {
  	if (ucall_is_tdx_vm)
  		ucall_tdx_do_ucall(uc);
  	else
  		ucall_x86_do_ucall(uc);
  }
  
  void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
  {
  	if (is_tdx_vm(vcpu->vm))
  		return ucall_tdx_get_ucall(vcpu);
  
  	return ucall_x86_get_ucall(vcpu);
  }

or a very slight variant on option #2 to make the paths visually similar:

  static bool ucall_is_tdx_vm;
  
  void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
  {
  	write_guest_global(vm, ucall_is_tdx_vm, is_tdx_vm(vm));
  }
  
  void ucall_arch_do_ucall(gva_t uc)
  {
  	if (ucall_is_tdx_vm)
  		return ucall_tdx_do_ucall(uc);
  
  	return ucall_x86_do_ucall(uc);
  }
  
  void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
  {
  	if (is_tdx_vm(vcpu->vm))
  		return ucall_tdx_get_ucall(vcpu);
  
  	return ucall_x86_get_ucall(vcpu);
  }

I strongly vote for the simple flag, with a preference for the double-return
variant.  I'm going to violate my own "don't do in-reply-to patches" rule and
post a v16.1 patch in response, to see if that's trigger another round of Sashiko
review.

P.S. I'VE GOT THE POWER:

# ./tdx_vm_test
Random seed: 0x26085169
TAP version 13
1..1
# Starting 1 tests from 1 test cases.
#  RUN           global.verify_td_lifecycle ...
#            OK  global.verify_td_lifecycle
ok 1 global.verify_td_lifecycle
# PASSED: 1 / 1 tests passed.
# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
