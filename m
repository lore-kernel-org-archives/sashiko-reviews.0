Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C0F41E6D8
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876913; cv=none; b=bbquMYgaOGOKqbOsZRyajDMEuE4kOyB8RWHOJypyWuUyUZkSP7XbHbEd64D/4Fl2zSntOA0u2zYrFNT0zmqNGeQsPgDuh6kFuv5hrPQa32+BCKQoX9IhnuMj6RO6oiZhklW9jvBrTo+Kd/4pUhx6l9mWBSPHPSGY0C7V25fZmW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876913; c=relaxed/simple;
	bh=g+o8gB7pMI21jaPeXrS5CXSa4aCqgg+hPP/Bv4AMgBw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=knLtsWWuOqwr+GpQkfxlRZTs9APzXRsmrj+n6UyQSKHL6n6NigewxrcxYZZ3LHDB5sU886prTBPwQrnwCUNVIpJndPOMJGABMpzhrIfykj50UgEXsr+LrQhIg4VTBKJzmmVEYMpG2Hg+1RmKpdkimk7dnryGP3SXjredlm+yKzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rob4e84H; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rob4e84H"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso221021a91.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 13:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785876909; x=1786481709; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMa1RhwjCziAD/afQGYLdZAGyHsDiMpWCqqVOHipENs=;
        b=rob4e84HxlElRfUTr17JDF4a941QVFFARuRXQ2BGdgrO5obU0MZ5x+BsMQyRhIIL8L
         9ARimvxHK8cA7dMTUP7NLMjc2n8wFxVjOl4qCsemaCJzLgRb2W5ehGNdd4Pup3FKXRip
         +OTmtcEU5qt8dYez9FRLEnEgQirqJfbT+M+nRIBEAFV851Mx1Xhh4r0STcersXXaIa/c
         IaDPyQDdJYkssZQf7axDu0bZLAgww9g3xFAckYAl69Ine3+32m0KOwjGkTUrn3PEB367
         QvgIokA+C1x46Gw0fe9D8lW3MtV7x8pG8MKaoEa3hNcc4EKaOjkz93UlVstKZ+3zAsov
         h4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785876909; x=1786481709;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dMa1RhwjCziAD/afQGYLdZAGyHsDiMpWCqqVOHipENs=;
        b=d8yc8C6a4wSQfyP/PmtqnAOhBbGGInP20eMYT38jm8aAOFnvMUJO9D9jeeTkh4n7OA
         R6pX6f74aDsCFXHiaoLahdNTZet/60JFscBks7E4VEOxSdX+oEa9nrGoezC49L/GFIuU
         pkKbgjO1JRIc+nCdjRgW7nlchk5p5Q7t5hbGEga+hweojPjcwqfy4m2K0JW/nRhlROFJ
         2+fRi3Y//n9W0egCyyHao2kiTzapxIkynnag1yD5V/hY+MadcFXGLTmYm05DdRvGY6s+
         hnw7PabdhM8FOM159QSuCcpuZm5X0MWUrlfjcksQ+MfMTPNi+qMe+ZC/Q4zebtA50LJt
         rFjA==
X-Gm-Message-State: AOJu0YyoSg5jiqMx7MMQtBh1CwtXCkh7nEfabUGEOpapxqefnxCXymvD
	8aioZ9Av2kcrkIHs+BCEcDTOapwGrq0iYUabj6EfipMGFdd01WAaFCPiJsZ2f43rR8awlNyeaGj
	44zipjkE4k+pM3QI+vgNNBlA5/rw82FWd8gr774s4iGt7CYBKa2ekvJjcA0C8KwjaSjxNbZicju
	Vnb3AB0OPPXpzAU8jAA6ZL6EyxSqqeuLrmYh846iWjO0X6H7hG
X-Received: from pjboe8.prod.google.com ([2002:a17:90b:3948:b0:36b:7f07:6fcd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1e53:b0:37f:a915:1c29
 with SMTP id 98e67ed59e1d1-3903c5f34c9mr1155260a91.19.1785876908942; Tue, 04
 Aug 2026 13:55:08 -0700 (PDT)
Date: Tue, 4 Aug 2026 13:55:08 -0700
In-Reply-To: <20260804205304.550701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260804204048.3401810-1-seanjc@google.com> <20260804204048.3401810-3-seanjc@google.com>
 <20260804205304.550701F000E9@smtp.kernel.org>
Message-ID: <anJRrDb-gCfoNh_e@google.com>
Subject: Re: [PATCH v2 2/2] KVM: selftests: Create one VM with many vCPUs for
 each major PMU counters test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 04, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > +static struct kvm_vm *pmu_vm_create_with_vcpus(u32 nr_vcpus, void *guest_code,
> > +					       u8 pmu_version,
> > +					       u64 perf_capabilities,
> > +					       struct kvm_vcpu **__vcpus[])
> >  {
> > +	struct kvm_vcpu **vcpus = calloc(nr_vcpus, sizeof(struct kvm_vcpu));
> 
> [Severity: Low]
> Does this calloc() call allocate too much memory?

And I managed to send the v1 patches again, *sigh*.  At least Sashiko is consitent?
