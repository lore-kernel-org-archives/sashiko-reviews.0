Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9463B38F929
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 20:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779136118; cv=none; b=E/xTLQNK4RyJA6tbNeIbQxnLd/uDBrRm+wjc3A47XG4rcOd2NTXpMpMJ/5rCzhDPRCKPOIKrumnN6IJLbfaHb8ToqsMzomqunrTCCa2+L+7YcOf81SRkpxFMi0lGbGrpnHkculthbGOfvUNWKG48vfrOUfn0dJWvx1OwbXObad4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779136118; c=relaxed/simple;
	bh=hmHa3lERLAq0VNHm3jD5e+yPlQ3U2iPLROYP9DzeTNo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KnvBU/AqO9XuC1KKHJf1jOh6FVzCUC/ZkFUOnWhk5Dormw3U9FqO1WXt0VmWBNf/ZDUkUmUdZzjsKpRzSXGDmWDuR/+Q3rodrcLaeatD295rkImn0SIO+ojJnRXAn4wUuonWMxlspXzh4zQW6wRspsRHmgCehQq9mYEYM+LESjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ohF4nzK1; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ohF4nzK1"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso5674839a91.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 13:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779136116; x=1779740916; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1XaWuXLMM9xEhwF3D0/7qJrCIna4fGcfUBNTL97l5Y=;
        b=ohF4nzK17lQM9rOemVDjv4QjT1WRuwzObnyfph9tMu/XGJUTuNd1fPPy0PnPn4EiOu
         7lvy0BvN59soUISTd6vSFGYIQxpTPxiemDvoviXvulryY24hy/qJNFwtwKjClYM1FcjT
         OvroIyDhnLCFZU6o6+Ra/8uBJV2SR4zhRRljLjgW5/KYUCW6H8PhGWJHUkpGM9Wn54BB
         o1ml9128n6I6qj26EMwqlUYnUhCz8Thqi51TkqEyaedgZfH2JlEM8lmZig12iL4Rm32K
         udoPB7RzrJUatPFtFcrraEbYJfyAmtuUYLr0xbxVB50G/NqH8e1emgw7trR9KZNJw23h
         MFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779136116; x=1779740916;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j1XaWuXLMM9xEhwF3D0/7qJrCIna4fGcfUBNTL97l5Y=;
        b=dTqcfD9yqj+6ZCuwkO0Kj9QOCcg3dksUc5jviAMAFptMjo3HoRzZ74B/ZtVqBSxdYP
         zdVVpi9LDwq3fSt+Tti6QyKDQWTvt0OIxQJRR69m2AnAo5sJp2JFXJ5efInSPrDWWFuz
         dRMRlTikgTJVmD47O0VhY07yU3Jkols6pZQPuHkFLuqf+YyLkVb9v/L7IR7FZ3BmSvfm
         hJtkofCxbeSfMsi5rGKRcYPVndZ47u/kQZROgSVROJlfEJ6S+SLQhgzf8LWr2iL0DwTn
         Tt3K/pTbBSj1ljUMz0aHVq0zuqd0WkLtvGVudsP0br1tlYSqLAbOoWJptU7MJWF6LTtn
         yjFA==
X-Gm-Message-State: AOJu0YxrYcNw/SUMjN9Srr9ZMOrzgVD0JiWjdtyqgJVOSkSFOndhrWZy
	W4sQ79eWPsITa0L3av1ThhOT8U4KQhLwnfG0Z1rWMQaLKyJEkl8p7xwEIEYS/sI7UK/D3VxCRG8
	0hapEXlzf04FdcPt/C7Oh7afdZLV9MTG3V5pyY3KIKUqY1QvgagtUb/VQOZxl3zFOu9lHX+glat
	EjNZXEY+33wR07IMGiqAU3Anud8PnQ3w3Yw7/QHbZ0EGkOiiqR
X-Received: from plge17.prod.google.com ([2002:a17:902:cf51:b0:2bd:7970:b71f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3842:b0:368:147b:536c
 with SMTP id 98e67ed59e1d1-36951b75c26mr15658555a91.13.1779136115645; Mon, 18
 May 2026 13:28:35 -0700 (PDT)
Date: Mon, 18 May 2026 13:28:35 -0700
In-Reply-To: <20260515200929.19F2CC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-38-seanjc@google.com> <20260515200929.19F2CC2BCB3@smtp.kernel.org>
Message-ID: <agt2c3WXwLk23aeY@google.com>
Subject: Re: [PATCH v3 37/41] x86/kvmclock: Use TSC for sched_clock if it's
 constant and non-stop
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 15, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Bypassing `kvm_sched_clock_init()` when `CONSTANT_TSC` is present
> ignores KVM's `PVCLOCK_TSC_STABLE_BIT`, leading to unfiltered backward time
> jumps in the core scheduler.  --
> 
> commit 57cf68835ef70733c037ca9ffa04fd39e1d70027
> Author: Sean Christopherson <seanjc@google.com>
> 
> x86/kvmclock: Use TSC for sched_clock if it's constant and non-stop
> 
> This commit updates kvmclock_init to prefer the TSC over kvmclock for
> sched_clock when the TSC is constant, non-stop, and not marked unstable.
> It does this by bypassing kvm_sched_clock_init and instead modifying the
> TSC properties so that TSC becomes the preferred clocksource.
> 
> Link: https://lore.kernel.org/all/Z4hDK27OV7wK572A@google.com
> 
> > diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> > --- a/arch/x86/kernel/kvmclock.c
> > +++ b/arch/x86/kernel/kvmclock.c
> [ ... ]
> > @@ -416,22 +416,22 @@ void __init kvmclock_init(void)
> [ ... ]
> >  	if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
> >  	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
> >  	    !check_tsc_unstable()) {
> >  		kvm_clock.rating = 299;
> >  		tsc_properties = TSC_FREQ_KNOWN_AND_RELIABLE;
> > +	} else {
> > +		kvm_sched_clock_init(stable);
> >  	}
> >  
> > -	kvm_sched_clock_init(stable);
> 
> Does bypassing kvm_sched_clock_init() when CONSTANT_TSC is present
> accidentally ignore KVM's PVCLOCK_TSC_STABLE_BIT?
> 
> CONSTANT_TSC indicates the hardware TSC rate doesn't change with power
> states, but it doesn't guarantee cross-CPU synchronization, such as across
> multi-socket systems or differing vCPU offsets from hotplug and migration.
> KVM explicitly signals this cross-CPU stability via PVCLOCK_TSC_STABLE_BIT,
> which is mapped to the stable variable.
> 
> Prior to this patch, kvm_sched_clock_init() was always called, invoking
> __paravirt_set_sched_clock() with the stable flag. This allowed the system
> to call clear_sched_clock_stable() if the hypervisor could not guarantee
> synchronization, enabling crucial per-CPU monotonicity filters in
> sched_clock_cpu().
> 
> By skipping kvm_sched_clock_init() entirely and registering
> TSC_FREQ_KNOWN_AND_RELIABLE, the kernel's native cross-CPU TSC synchronization
> checks and the clocksource watchdog appear to be bypassed.

This is very much intented behavior.

> If KVM clears PVCLOCK_TSC_STABLE_BIT, could this result in the guest
> ignoring the condition and using raw, unfiltered rdtsc() values?

Yes, that's the entire point.
 
Note, PVCLOCK_TSC_STABLE_BIT is still set in pvclock_read_flags(&hv_clock_boot[0].pvti),
so anything else that directly consumes PVCLOCK_TSC_STABLE_BIT still does the
right thing.  E.g. kvm_setup_vsyscall_timeinfo() will still set kvm_clock's vDSO
mode to VDSO_CLOCKMODE_PVCLOCK, to communicate that kvm_lock can be used for the
vDSO page, *if* it's chose.

> When tasks migrate between vCPUs with differing TSC offsets, this regression
> might cause backward time jumps in sched_clock(), which breaks rq_clock
> monotonicity and corrupts CFS vruntime and min_vruntime calculations.

Only if the host messed up and incorrectly advertised CONSTANT+NONSTOP.
