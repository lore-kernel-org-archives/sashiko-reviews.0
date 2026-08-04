Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE130444717
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 21:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785878480; cv=none; b=gC4+DdQ7mGLhyLJl5URdFbPyRPLVYoAm8eklo9UdKUqxe5c6akKJIDFxOTfLkg1dOngZcH0PcWY1pAbPS2AkySxDQozvqqn1UFeoPXOBXAgWfGGmASsIJD7zcy6692PA/O7bmdooJWlqoX2rbm4e6FpMkXCE2IvlxFMsD7spZx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785878480; c=relaxed/simple;
	bh=xzRPCs/rv1FhtkiR8oU1AWkWRGI+B37AVWNvL9stlSo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fa1/++UopCh3EWJaoFupqaQYCAczJ1QFJRjYu8WCeq0aJd4jhQI01xFQOAFWQ/S1UEmEsz5OkF3W3BLjwtAkvliUmOAyptOQwtp/Nx6NQIIsrrTv1p3zWwQDbi8bGRUDQGosQHWFG3iSUT5X8EnZaoVNh6rjXf5d/qRStWsWf/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GYXrEpxy; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GYXrEpxy"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e04598adeso192131b3a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 14:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785878477; x=1786483277; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFgMw4fiBgrQ1xsL5NWX1WqzYPj0vpROk8XmbnyUdOw=;
        b=GYXrEpxyi1gu3w0Njxkrak97sk8i7CxQsXEPduJmpsxWZE6Y2tYEz0ZL4C1wWc+fvk
         R/VPAnZJD9FEK95fr4JRCclALuZWvuBTm9PFdf4EXVa+bX+VUYtdULxo0Tf+GqdYYEli
         HvjatxvjkJAx4ucfxyXLO1RY29gRYwFu1DOhjBvYYVVxQCEWNAq3HdVaXzKGvgAn0Tbd
         JmjEC/YCDdvyGpbtHF3Z8Vycq15Ju8dNb4Wu1tXkX9O5N8ZQWgrh8R8+bIAJUUukiCKQ
         GgAT4wmsQJToGKIvYpdZ3aMglb6fOZ5OYF+CgA0RxZMzsya3uz4dnaLWgD8cS9xsaiRy
         w5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785878477; x=1786483277;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFgMw4fiBgrQ1xsL5NWX1WqzYPj0vpROk8XmbnyUdOw=;
        b=hF9bDpnUanPrAlUKKQdgiw+4qkhKS7WnBMnIeG2v69INvwDkSbMRl6LigRxKghgyw+
         /lRxRSFbihWqdEgmrrD0kkSpVDHZiyEqlB7Y/GA5rgZ1AMmj1v3YULp7QpHvvmZY8X2P
         4ZCyTrR18hsBBmac2RfOj0+s9xxUIUALHHrOY5Io934/cUdj9YAef/JUHXgqgRKcuJZs
         +2tdmCc4UveEI3sUcSQzuMaIXUvp6PyU7WmyIwSBCXrfk8KXpwq89PD8rsKJa1Etd3Kk
         qez5+u+GLUVOV1ZSiFRg/KZnPcXy1Jd8v4g6vUbFOdtdDXHwGeKOebb99SEcYpKnfOcI
         2xvg==
X-Gm-Message-State: AOJu0YzdWs2WfmcIfHxBV5Iee4IjOv2F6rwCTNEUxv04iaA6u9uC/o/j
	7z2sAmm8jtpTkTw7hrTPor+5hhunq/j5waCmM2uqRiXwMt1f6WKYm/DePBFXQA1PwHbJLMHv2uT
	LSkb7LfLxOmDBiKBf07TsjY43U/fSlzzviGIPa64qae/TWMy+Q9UuMzyswSB9frQWvCpQrC4huK
	JXY3MDTYS4Tv48AHhRMTKxO2UdyHXWYZpk83S+vXP6HqWVet86
X-Received: from pfw16.prod.google.com ([2002:a05:6a00:a270:b0:847:840c:ba17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a20:b0:84e:f90e:492f
 with SMTP id d2e1a72fcca58-84f2dfc338fmr1489489b3a.7.1785878476592; Tue, 04
 Aug 2026 14:21:16 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:21:16 -0700
In-Reply-To: <20260804211300.668C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260804210046.3413149-1-seanjc@google.com> <20260804210046.3413149-3-seanjc@google.com>
 <20260804211300.668C01F000E9@smtp.kernel.org>
Message-ID: <anJXzBxq6fbPuoQC@google.com>
Subject: Re: [PATCH v3 2/2] KVM: selftests: Create one VM with many vCPUs for
 each major PMU counters test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 04, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > +	pr_info("Testing arch events, PMU version %u, perf_caps = %lx\n",
> > +		pmu_version, perf_capabilities);
> > +
> > +	/* Testing arch events requires a vPMU (there are no negative tests). */
> > +	if (!pmu_version)
> > +		return;
> > +
> > +	vm = pmu_vm_create_with_vcpus((NR_INTEL_ARCH_EVENTS + 2) * (ARRAY_SIZE(unavailable_masks) - 1),
> > +				      guest_test_arch_events, pmu_version,
> > +				      perf_capabilities, &vcpus);
> 
> [Severity: Medium]
> Could this cause the test to assert on hosts with lower vCPU limits?
> 
> This calculation requests up to 144 vCPUs per VM ((14 + 2) * (10 - 1)). If the 
> host has a KVM_CAP_MAX_VCPUS limit lower than 144 (which is common in nested
> virtualization or lightweight VMs), 

No, it's not.  Unless userspace overwrites the VM's max vCPUs, KVM x86's *minimum*
value for KVM_CAP_MAX_VCPUS is 1024.

	case KVM_CAP_MAX_VCPUS:
		r = KVM_MAX_VCPUS;
		if (kvm)
			r = kvm->max_vcpus;
		break;

  #ifdef CONFIG_KVM_MAX_NR_VCPUS
  #define KVM_MAX_VCPUS CONFIG_KVM_MAX_NR_VCPUS
  #else
  #define KVM_MAX_VCPUS 1024
  #endif


  config KVM_MAX_NR_VCPUS
	int "Maximum number of vCPUs per KVM guest"
	depends on KVM_X86
	range 1024 4096
	default 4096 if MAXSMP
	default 1024


KVM_CAP_NR_VCPUS incorporates the number of CPUs in the system, but that's purely
a "suggestion" for userspace.

	case KVM_CAP_NR_VCPUS:
		r = min_t(unsigned int, num_online_cpus(), KVM_MAX_VCPUS);
		break;

> vm_create_with_vcpus() might fail with a hard assertion.
> 
> Should this check against the host limit and either skip via TEST_REQUIRE()
> or batch the creations into smaller groups of vCPUs?
