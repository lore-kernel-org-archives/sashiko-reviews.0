Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3891643B
	for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 01:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782179238; cv=none; b=Z/cArJAvsfL698owMgyfgUDQq2IuH+Of9GnCW6bX9GZtO2id911vt626IwqoKVdGoRjsVhcp2SnlxvFyATAfH/e0nn8jW5N9s+GIBY7q2+PjvQ6dmRY1LT1Lg4RQ+GgpmIjLGEqe3LiSt9qtLHlAV+ancl9MiNMq7uTJSXBhFgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782179238; c=relaxed/simple;
	bh=P67FYLXAJXpU1JgIrkarwLwNT0d7c7oo7LGWh9f3zc4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ap/fxc1+/mApAh5mlJMCTmUaX0lzehfHxJuMI+heCsJFredahcMyj1BOLSxZ58SOxt93EOGs/g8ZQPND7x3wNLeRI+lZkQG1e+oNjQG1wlOFN3Zr9IaNG0wZ13tpx4LGSzrjEAbWbpkRpD6qfZ5BO4F/M7QBPvFS+h3ZGJ2wFpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wnl6AdT3; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wnl6AdT3"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c2c98c1be2so43015595ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 18:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782179237; x=1782784037; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xXrOsG0sOKwQxPybxGcKKGAUN4JOfTPB1ofkSmrXZc0=;
        b=Wnl6AdT3xatnJTS/csaerXWdyz+wt0ZRBBrI9WbdekXd1jZjZcun1/ya4WyfEJUEur
         zlGW2Tx5ODcF89GGQZhxXYh6SFSw/ELsIz7i2fDViTk9jsoeSjry1QqlMP//u+ffNpZ9
         3EXVkFWtFMFIQE+On/IQy5aMQq/NF6EwHCEM5HDGEz5r0qwDX3NCGLMQxEpHj5ZDKiku
         BjlzbTYpqGWJcxHcFOuBoLVxFUu5M72j6CWyNj7+V4R2oD7xm7q1G1sfV874XywLJ143
         bC7ZfgV6mcmqSKsrw5CCtqhL7wtnh2Tv+D0x3kFvVlt6s/9t12edE5V5ELqB0XfKF8w4
         +8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782179237; x=1782784037;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xXrOsG0sOKwQxPybxGcKKGAUN4JOfTPB1ofkSmrXZc0=;
        b=oNqd7dupXXuRXZLcsoYGv/uv3OQ5n9sEb/qA/WBIgyXtAffQZWwi8dJx9cD7NjckES
         2DI5RqQ1tVg3+EpB40Sk6nX0OVVh+fyCdTrNNq6+S1Tm68Hfr/3SRD3RklowNYyQmpbW
         x4H7pmXKkrz71wCzUbIrZllJOjshPVx2R1NeJeoB7Xxw6ZfIj+O9K6/3vvFI+rUHSIJO
         kQHVepdCukQK1Az9GTx4BiEjMFOmXX5mWYwst6+1WYm4RSqowaLHQNNDXf9VqsnNawdW
         Z3YbwHAmssiR5G2XoFxeBX2edxtFaoijC3eH88lWMQDj0awKix92Z/CcIFR4V+hE7A6A
         ERJw==
X-Gm-Message-State: AOJu0YyVogAGKj1HwCGfl8ElNBCVhT08rtTBVKSGhDvEBBWYk+yZ1mfi
	luaUBESTiEVkyPNmCLqDPeLaptLdfwCYjs7L9H4ZWqw6ueAxLH1oIMqfYjaEOZPlm8X9CEBh6/o
	wf30PA2AR2iMCdXgI6LPnFZytivxGnM6giVewqvVF+fpvLA9z403jRLNU5cGAaAgqmeyvq8N4kD
	RUQ0DIgTa/Dky4hSMQbRE6WoldRsZjXXOeQ0F4We3EKHZmYBej
X-Received: from pjzr16.prod.google.com ([2002:a17:90b:510:b0:37c:64eb:faf7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3809:b0:369:1dcf:4a46
 with SMTP id 98e67ed59e1d1-37d162c3d15mr16740820a91.25.1782179236220; Mon, 22
 Jun 2026 18:47:16 -0700 (PDT)
Date: Mon, 22 Jun 2026 18:47:15 -0700
In-Reply-To: <20260619204642.F1A691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260619203107.2752678-1-main.kalliope@gmail.com>
 <20260619203107.2752678-2-main.kalliope@gmail.com> <20260619204642.F1A691F000E9@smtp.kernel.org>
Message-ID: <ajnlo3vf-Qcai0jz@google.com>
Subject: Re: [PATCH v2 6.1.y 1/3] KVM: nVMX: Add a helper to get highest
 pending from Posted Interrupt vector
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Nicholas Dudar <main.kalliope@gmail.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 19, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > index bdc462944cb08..7d8e18dbe8531 100644
> > --- a/arch/x86/kvm/vmx/nested.c
> > +++ b/arch/x86/kvm/vmx/nested.c
> [ ... ]
> > @@ -3818,8 +3819,8 @@ static int vmx_complete_nested_posted_interrupt(struct kvm_vcpu *vcpu)
> >  	if (!pi_test_and_clear_on(vmx->nested.pi_desc))
> >  		return 0;
> >  
> > -	max_irr = find_last_bit((unsigned long *)vmx->nested.pi_desc->pir, 256);
> > -	if (max_irr != 256) {
> > +	max_irr = pi_find_highest_vector(vmx->nested.pi_desc);
> > +	if (max_irr > 0) {
> 
> [Severity: Medium]
> Does this condition inadvertently skip vector 0?

No, it deliberately skips vector 0.

> The commit message states that pi_find_highest_vector() returns -1 to indicate
> no interrupt pending, so max_irr can be -1 or 0-255. By checking max_irr > 0,
> the code skips processing if vector 0 is the highest pending interrupt.
> 
> While vector 0 is an invalid APIC interrupt that hardware typically ignores,
> skipping it here means KVM does not call __kvm_apic_update_irr(). As a result,
> vector 0 could remain stuck in the PIR array instead of being cleared, which
> diverges from the lockless PIR/ON protocol.
> 
> Should this condition check for max_irr >= 0 or max_irr != -1 instead?

Nah, because vmcs.GUEST_INTR_STATUS's RVI will never satisfy:

  RVI[7:4] > VPPR[7:4]

and so the interrupt (that shouldn't/can't exist) will never be delivered, even
if the KVM check were "fixed".  If anything KVM could do "max_irr > 15", probably
with a #define of some kind instead of an open coded literally.

Regardless, that's something to tweak in upstream, not in LTS backports.
