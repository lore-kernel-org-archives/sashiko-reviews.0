Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F95C8EB
	for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 23:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782257609; cv=none; b=K76wgdiBGfZuJ2+tMGhfl8m1+fqHOzMxxgT+C05yrT3hVHMv2x5VGYiX1cL9O7cLbPqmpgN1dype5T1oPIyne9HHZGBFm1Gb+mrMGJJNRmWkMjyqjhYzXxDFLyFMGvJmBaB9isKTaiPEcqsLAVcHT/h7dk6k7Zbf/kixwMVC55c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782257609; c=relaxed/simple;
	bh=60ZeMLqR1meAEfO9RRi8lX/tJE2bPwVhorIaZg2y838=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g4Tg+n5mkB2RLdKw+gBDC0HYmpQZyTP5LmtD++9k7kQDjb3vRK3I3TEijb9cWb4+/nv3dgnYihmTUbVSLzAJAmidZa3OUEiX6Dz0r7DbrhZA+gSGOrpCWcQcaoZm01nd3jiOc56suG1sFRrtSgKLyNzMkq1i2kKfJb1Io5ynbys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kB8uSEzI; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kB8uSEzI"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso233831a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 16:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782257607; x=1782862407; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XFKcrqLB4jp/lrEWHBH06nGLJwYcOrB0oXIswwGe6IE=;
        b=kB8uSEzIW+EoLY1Xmh1wLkHr9oJbf6E1Gdk5p1xby0XClH5SAdFZuNZbC8faoVtsAq
         oyilwTZx+gF97fIvMEpEb+hhSCDUqFgi+ht0jXPaV5CQ8P4CJaH9Qwih1UE3k7m87nRP
         DEQ9Wpc2t5hKhJKOxVyNjE35xFh2JiMrPDS/NL9rZ2a870xSh4erb4tq4vt5WHBqiHt6
         GboItLu8g8b8IobhEh4OjijQjGQ2XdU9HDTO8fxAKakCohuKopa6Njd3ZSb0UafJmrq8
         3F5DuY5QiAp1/8CwuHNhX3ZhGo8k3CMYOdjoPYG+wiQY/I5Y8zIAU7SzY7VlK6Mn07AW
         RmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782257607; x=1782862407;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFKcrqLB4jp/lrEWHBH06nGLJwYcOrB0oXIswwGe6IE=;
        b=p5sR3OWEppZw1SxKoulsLAZm0PVbDtUzNCdH6erZJzmun2aDG6RSkUTUgoVBck08Ea
         PqGkt2oOxxtC7h7ukLW85GS9r8qGbNNzqhi+PVdabkWAZZAWEennajr1/SffeatIx6nR
         jJzswbPi06sPTLv+vzAayrHbKQcjjzkid1jIh8trwASgCanIqtVE8ID3Yme8WbtMps5u
         ywKbhLtWoMrQniX6KazUc0Pkn6lxoMHdv8VUKWTrO7RvmUF4e5yT/J839ZeVwByl7wIX
         5DBIEKxOsfC8LvJRiXAJuk3A/EVB9xNWr2jrLJo8p4EVM37e4NQomujezgoe1hDmin8j
         I6Lw==
X-Gm-Message-State: AOJu0YwFahkkcb28vKLbhSlQ9VCk3oST0YfGlFY2DFcIirH+axwmRAVU
	D9X8FTk7KNA8OQtLQD3NQNmbqdwuMeZuWe5FKLq2h7Cju2p7m/ESjaE/16vjM3FfNvgeiHIhEm6
	UwAHauA==
X-Received: from pgmc22.prod.google.com ([2002:a63:1c56:0:b0:c88:dea2:d511])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:117:b0:39c:787:f197
 with SMTP id adf61e73a8af0-3bc53af1770mr18759206637.36.1782257606531; Tue, 23
 Jun 2026 16:33:26 -0700 (PDT)
Date: Tue, 23 Jun 2026 16:33:25 -0700
In-Reply-To: <bcbc4f64-60e9-46a8-bf63-19e7d9d30595@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260623041927.178256-1-zide.chen@intel.com> <20260623041927.178256-4-zide.chen@intel.com>
 <20260623044826.592FF1F000E9@smtp.kernel.org> <bcbc4f64-60e9-46a8-bf63-19e7d9d30595@intel.com>
Message-ID: <ajsXxXHz-oIcSXDE@google.com>
Subject: Re: [PATCH V4 3/4] KVM: x86/pmu: Support PERF_METRICS MSR in mediated vPMU
From: Sean Christopherson <seanjc@google.com>
To: Zide Chen <zide.chen@intel.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 23, 2026, Zide Chen wrote:
> On 6/22/2026 11:48 PM, sashiko-bot@kernel.org wrote:
> >> diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
> >> index 59b7a90c79e12..2c3367f5e2dfb 100644
> >> --- a/arch/x86/kvm/vmx/pmu_intel.c
> >> +++ b/arch/x86/kvm/vmx/pmu_intel.c
> > [ ... ]
> >> @@ -345,6 +347,11 @@ static int intel_pmu_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
> >>  	case MSR_CORE_PERF_FIXED_CTR_CTRL:
> >>  		msr_info->data = pmu->fixed_ctr_ctrl;
> >>  		break;
> >> +	case MSR_PERF_METRICS:
> >> +		if (!msr_info->host_initiated)
> >> +			return 1;
> > 
> > [Severity: High]
> > If KVM needs to emulate a guest RDMSR instruction targeting MSR_PERF_METRICS,
> > won't this unconditional return inject a #GP fault into the guest?
> 
> I can't think of a case that KVM needs to emulate RDMSR/WRMSR on
> MSR_PERF_METRICS.

If the literal emulator happens to emulate a RDMSR/WRMSR, KVM should behave
correctly.  Even if that weren't the case, KVM's implementation should adhere to
the architecture.  Assuming MSR_PERF_METRICS is read/write, KVM should emulate
it as such.
