Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A6D33C1B4
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589516; cv=none; b=Oo2koLqAuAJwfgY6Bd3FjFK9x679qc3AC94bHeNYxm5G20RmCXjQWRerqOCcDh6icn/s/TDUTwgK2mY2LIKApzjxa28MVsEvh3jyzIk5ZKcOg9mqSQCJJz+RA7yEj6WmYf8U8glyyKKZ0kgBKhvjCxWeEINWaz8VNGMIMLc7wNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589516; c=relaxed/simple;
	bh=mm4rYToWN8PDg2Taq6Ny5698HQBxA/e9Kov4gskqGDk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cpHoujlJvQKOsLTGghsuls6HvP4BnfNNvgYJMQ3kOyyn3lg92oyd+swopvwtIT8qLT+Gm1w2K1o3UAGgTJFKYDJIhgE6tyalBrAjz+rJPfn/vpppICUYGp+4ur5GP26u9cLYHqwxzmsNkTiorFY5gue2d6MTx6/U3xi43U1VD8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KV6B2H6m; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KV6B2H6m"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-36d98b74447so642550a91.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780589514; x=1781194314; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ma/DewyJFgYgz0xP+3/0017sOureUkpqAC/UR6g35xA=;
        b=KV6B2H6mUe+rgIsQTq6LvBHHzCYNrd89eb7Mu9gQKg4QqwnLr6QEsngW0Ug8B6JJcv
         CQQrSjTdIxh59u1BTM/Q7UL8obVCQZuNjMkNyXVw1txksRxIrzQfhjHWiKmOPfmgSpJI
         51wfVWaP7H9fLc8/4pKDql2kK7+xKij57g0rlqRBH3jr5nv98yTBa4hvlHlJSzKm310b
         5uV6mDtAS5JWB0AqWkhekkxZD8dkVrWFGc/Qu35brpImyuqIKZZ4Ovh4MhrTb+BDXIxg
         tcIj8rmx1mz1kKztBXkXwQc4OAf7YRho19rtGqC9FZF5TrSR8BU5owhSn3B/MIFyzWOp
         GfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589514; x=1781194314;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ma/DewyJFgYgz0xP+3/0017sOureUkpqAC/UR6g35xA=;
        b=kcNe7VYibj2onw9DZ3srYm0vaI4Y59MKu7GfuFW+sWpsjyA10BQG7u3qiGbp5vQvqg
         O63NL3qUpxWCFrVcFCjnrHhqu64iia1h8+8WtWKDoqw8g8TogH1fiYWhqa+2pTRVia1D
         wFmTOGRPgcBzxI2TPEE/TEiMsvjqZOxrEOC4Qgf1PHJnIt6Pr/YV8XyWM8Kxrt8OURu7
         3xNXwxL5Zc4ybt9njbA8o1ioolcPz5kiiDFE2jExqP3HHPJuICdzqT3OawhhAMmYsABc
         Z3ahT9Co6fKaNU/gxUUiFHiiIdQesjxzUQtF/gOZGb2Cs+GbNV2rPhDQSzYDW/fg/wfv
         oEig==
X-Gm-Message-State: AOJu0YzcA0IBM4T7UGzi7SCv0r9v8/81KDzzRL7JYArShofGR8I6ysRG
	oi1hi2UZp1qbAmoKNUNxwOPqgT6+ft+7SfPrWeUWbGR+016AI6tOTJZeRCjmYc2dGIx2FCFLq9b
	jbM8Oy9CPgPP3OYbDKtLmLHsHSyvKdwXibDihp2ofeCpFaa3IgK3z2E6L72/pyvSE0h9H28jBO1
	bZX/zoz0hQlrZQYg24aF/A8kXx6TOb3jv4tfDwuqVgUfULhw/E
X-Received: from pjboh6.prod.google.com ([2002:a17:90b:3a46:b0:36a:fcf5:b57f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4f47:b0:367:b8ad:f0e9
 with SMTP id 98e67ed59e1d1-36e30a286cdmr9217648a91.16.1780589513680; Thu, 04
 Jun 2026 09:11:53 -0700 (PDT)
Date: Thu, 4 Jun 2026 09:11:53 -0700
In-Reply-To: <20260604021538.BC1A91F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260604020143.748245-12-jrhilke@google.com> <20260604021538.BC1A91F0089B@smtp.kernel.org>
Message-ID: <aiGjyfSpkU8t4_W4@google.com>
Subject: Re: [PATCH v5 11/21] KVM: selftests: Verify IRQs wake up halted vCPUs
 in IRQ test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Josh Hilke <jrhilke@google.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 04, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The guest code introduces a missed wakeup (TOCTOU) race condition between checking the `done` flag and executing the `hlt` instruction. This can cause the guest vCPU to sleep indefinitely, leading to a test hang.
> --
> 
> commit 9a28612ad82c9a519d18da6d85e17ef536f35e8d
> Author: David Matlack <dmatlack@google.com>
> 
> KVM: selftests: Verify IRQs wake up halted vCPUs in IRQ test
>     
> This commit adds a '-b' flag to the KVM IRQ selftest to verify that
> interrupts correctly wake up vCPUs from a halted state.

s/halted/blocking, to connect '-b' to "blocking".

> If the flag is provided, the guest uses the HLT instruction instead of
> spinning.

Describe the *change* as a command, don't describe the effect of the code.  E.g.

  If blocking mode is enabled, execute HLT in the guest (for x86) instead of
  simply doing cpu_relax(), blah blah blah.

> > diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
> > index 90cff165c3512..671338f0e6122 100644
> > --- a/tools/testing/selftests/kvm/irq_test.c
> > +++ b/tools/testing/selftests/kvm/irq_test.c
> 
> [ ... ]
> 
> > @@ -43,8 +44,12 @@ static void guest_code(void)
> >  
> >  	WRITE_ONCE(guest_ready_for_irqs[guest_get_vcpu_id()], true);
> >  
> > -	while (!READ_ONCE(done))
> > -		cpu_relax();
> > +	while (!READ_ONCE(done)) {
> > +		if (block_vcpus)
> > +			hlt();
> 
> [Severity: Medium]
> Is there a missed wakeup (TOCTOU) race condition between checking the done
> flag and executing the hlt instruction?
> 
> If the host sets done to true and triggers the final wake-up interrupt
> after the guest evaluates !READ_ONCE(done) but before it executes hlt(),
> the interrupt handler will run immediately. Upon returning, the guest will
> blindly execute hlt() and go to sleep. 
> 
> Since the host only sends one final interrupt per vCPU, does the guest
> need to disable interrupts (e.g., using cli()) before checking the condition
> and use safe_halt() to atomically re-enable interrupts and halt?

Yeah, this is all kinds of broken.  Even if the test passes (I haven't actually
tried this version), there's zero chance it's actually providing the coverage I
want it to provide.

In the interest of landing this test sooner than later, as I *really* want this
coverage, I'll skip this patch and punt on getting a functionally correct version
to the future.
