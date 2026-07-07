Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D52334753B
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 21:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459538; cv=none; b=HALqBLxP+7LfN1CtPL7Y7af+6ea3Ju7otWzFUaw01jeK8gmaWY40jmT3Jj8Z2jcxT9Mnuld5TGWjub3a7xBFAlJaYIY3gz9bN1bJl9PXYU/KUTeAXu0c0Y7KSL4M+QrwjqCqmea8xnHGCH+NM2sltAm0qwTplW22YVX8UHpR8Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459538; c=relaxed/simple;
	bh=pOdXM2oymvr/smId1Omver3teKkaw9mprd4E/4+VOz0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=irslMH+289KeJSuYVLiHdXXd3D+m3LX9WJPzkefvVX4PTv/8nEzcGvEs4u0ze51+opc7rxe6kuz0dUl9G/5Z/bDikmbAIq8pzYyiNTSLR/fLjDIZIRDkTzSINV2KFXzfgo8+Hyr7I2GlYzGqvYqzNCSpK+kEs5r18mwZASg8HBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u+cNSfqq; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u+cNSfqq"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2caf4173b1cso776045ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 14:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783459537; x=1784064337; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZUVoSE8UgGc/A9+Kf+89pNsJjY/CmRXkhT+zbp2ozz0=;
        b=u+cNSfqqf3SPeixRrHLvanIoPnGnsDzCVU7rmoXy8TNaBX0yOkyNzOo5rvkQZvrojr
         MAiYzFL1Rhrm4ZKT49BLC04aw6pIkjgNKWiBVqDoon8xwBwOAt+KZfuKouXOvMk7KBmL
         LK4TS+u1fkfnjq1IwMPwuHmyD+pflkjg8d1zCPpljw/rrjpCjJzdM5zxgY8fRaXbvZ13
         bn0IwhZaqLu+GPwHeeOGuVfv2bsyCRdQnbuqH0NLcOY+Tt9p9omNNGa9nFLQh6rEGSbU
         tuqXI2MmPw+hrMGZTe5SjtWmmjZEbUbA7fmYKB1MkbO1KF1OexUKS7vmwS1klQ3BY8Mb
         Z2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783459537; x=1784064337;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZUVoSE8UgGc/A9+Kf+89pNsJjY/CmRXkhT+zbp2ozz0=;
        b=huH+iNU662Gv3Dc4CzTbYh7RYI79ATndR8eMp8hJwZyCzX1hn1KWHUVb7elwu0kIUr
         e4cFP+2KzPd60W7uq2680W5SI5sGT4ke4Q8ci7pKrihT9aKNKQaC1H4njsZlVaw5caQc
         h4Bn+dM/mgvKPAgJb7T7bbnGxwGaqeWAIMFzn480SkYiP6vX6Ve1lEiXBOoprVbL6aLR
         XRl1p712y4Uh1UH1x2VlxuesY7YGM2qJjyru4qxT9jyQ4u+f1SuIAOz2Bd+J/8R8iP+C
         kIAs9X6gttYeoarG64tZaxsba6zRCGdu19tK5vPld/1RNmPPy21DRwY0r2OHD/kx510x
         gHcg==
X-Gm-Message-State: AOJu0YzW5soHvYBtiS7EgTX0bQkj5tKOFFrjxj4IXp4BZhNjbx455TPB
	Ln26CxOLyYRtpHHQV2gVcMouZsrQfMOGY3LBAOXsB+cR6wnmg8QB2D15ANd1hIj2puf/f5vtZdu
	7diW+I/sgwiEVEqBTfVvk4XECFDq/yfoxBv9kt8rG8NDDGCBduDZdPfdw3liIpr20pcbSYK8oaI
	QkPZb78jvKy44VqoUBhZjrvuMN9BJSDYZOhJqGUHMbKxpThmKK
X-Received: from plpn4.prod.google.com ([2002:a17:902:9684:b0:2cc:8aff:d1e5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:248c:b0:2ca:11af:5ee9
 with SMTP id d9443c01a7336-2ccbf0515c7mr46279875ad.25.1783459536408; Tue, 07
 Jul 2026 14:25:36 -0700 (PDT)
Date: Tue, 7 Jul 2026 14:25:35 -0700
In-Reply-To: <20260625212001.3B6561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <86078441-92eb-4461-b823-7d3539ac5859@mail.kernel.org> <20260625212001.3B6561F000E9@smtp.kernel.org>
Message-ID: <ak1uzySYz-i1EImO@google.com>
Subject: Re: [PATCH v2] KVM: x86: Exempt in-kernel PIC from "disappearing"
 interrupt warning
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: syzbot <syzbot@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 25, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> [ ... ]
> > @@ -10857,7 +10857,9 @@ static int kvm_check_and_inject_events(struct kvm_vcpu *vcpu,
> >  		if (r) {
> >  			int irq = kvm_cpu_get_interrupt(vcpu);
> >  
> > -			if (!WARN_ON_ONCE(irq == -1)) {
> > +			WARN_ON_ONCE(irq == -1 && !pic_in_kernel(vcpu->kvm));
> 
> [Severity: Medium]
> Does this inadvertently suppress the warning for APIC bugs in the default
> full-irqchip mode?
> 
> Since pic_in_kernel() evaluates to true when the in-kernel PIC is present,
> checking !pic_in_kernel() disables the warning entirely for all interrupt
> sources in that configuration. This appears to contradict the commit message
> intent of preserving the warning for other sources like the APIC.
> 
> [Severity: High]
> This is a pre-existing issue, but can a malicious guest still trigger this
> warning when KVM is configured with a split irqchip and Xen emulation is
> enabled?

Argh, yes.  

> If a guest concurrently toggles its evtchn_upcall_pending flag in memory
> while the host executes the event injection loop, it seems this path is
> directly reachable. 

Even more coarsely, userspace could disable Xen event stuff entirely via
KVM_XEN_HVM_CONFIG.  The easiest fix would be to condition the WARN on
!IS_ENABLED(CONFIG_KVM_XEN).  We could track if the VM has ever used Xen
emulation, but I don't think that's worth doing given that many deployments can
and should disable Xen emulation.

The other annoying issue is that vmx_check_nested_events() has the same flaw.
And I definitely don't want to toss that WARN either, because it recently found
a real bug that actually matters.

I'll send a v2 in the near-ish future to weed out CONFIG_KVM_XEN, and fix the
nVMX case as well, hopefully without having to duplicate too much code.
