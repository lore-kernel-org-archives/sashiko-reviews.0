Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9492396D36
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 21:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779138879; cv=none; b=Fp330ctRwJPHx0pkXl/OgwMhSl3WYSN9oAc2OfRiADrfDisVorjNM90nxagMt0+5dDt19MVi900O4JYo/Gc0YzMxlGMv+nbbc7nNDlawBCBoffDYIcd/sRSmGyIPCmNtW8rzB/jbL+qhdZYngzqjBs7tFKy1bbDZZH5S4yk7QNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779138879; c=relaxed/simple;
	bh=6FgsMK20z2ieU5Def3pMwxUzvlyh5j56ZnCu7u+YAtg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wq9HcFBu86yeGK5PTCV7SdB/VNL5cjaR78As+trmlntWOVRIB246lhPj0iSU9XQjT0DM1MwOvHnKfgG5ZRz+dhTizvbSpC+wP6GV3JvoLNBB4knoF5U/gnWm1i+xv0FogWFYuKuFzVhFQmRIqvItTQSwcFHBqPeIUfu8K39nOXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iS7r9OOb; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iS7r9OOb"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c82c4772950so1211799a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 14:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779138877; x=1779743677; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Zo21oM2VaVJk1wHkstVYW2kwV5RKdIS60liRPY2giE=;
        b=iS7r9OObcqNYJZbTUwVSxx9xDQtJIcwAa5hBD6zke3fbbeKkR0OfGmNwfpWPFj27So
         ol+u+Vm+jYFQxLaTtVW8a/ksypY9BLU3WUMVXAWR+C9Wshrt9piCJGZToqcDtUzMKvZx
         Uajlj+30VMP9oQ0NisuXY59Qz92jTl0VgGseZ/yitQOcUI+FyXYfYkJMzU30JW+ihlyi
         cCy9vpRf+iHhIshgMohiETy4avD1kpMPQsl5WkyOynV0q5Z0Jjse5vKv4gcMieI1rjyI
         QNsFNag9PJ3lQ21SvKSIR9FEUDhRWBDYgsO7Hd+RN9UfQ0JwUKQeNmMNecthMHPkgKQD
         YJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779138877; x=1779743677;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Zo21oM2VaVJk1wHkstVYW2kwV5RKdIS60liRPY2giE=;
        b=cHLcxazzYPwmv3L1BNgUg0g9qIdGUCEghgtlCZ7kFeMX/G1N18WjW4G5gXLugxydFt
         +LM06ehuQNDKrJKmTkaBLcqbB/yd252T3hMoztDXXYYVkXElKkYl5yILAZUrtLH0cuwO
         +mh6FaVBtsDM8H99YFpxMsGrJgLBOSwrgADJTPiAf+VVLdGP+UR1hbg8TqRE4Wctxoo/
         qc6n4cKNfEwdj7avKcK4BUv45Shwcl8bB8g2V25v8RtkgieuMUH8++eGY9umvzuSfpIS
         R0tRd3IYW1NFLnJS0dFvdqz/vxvoXCgXqVNo10HeWbdX2VJNHRkNGM+d+cTeUGm8Uiq3
         298g==
X-Gm-Message-State: AOJu0YzJRADr92k4MPJL38vIOtYIy1eXWGGAliqaJHC/kY6kowFrqkWR
	7jGIlTJUsqNCHjS3ZVNvfApFulERQTGYJZx1MO0l9TeNLWbBKP0SQLozyOjFy04tuZeOdAParOv
	WfE8EIuuJYE62URkAxFuKPRzPhoOPPcJCcUWsZV1itk/RJ6dGSfA2x8Y/KCsfzkLKBef54ZSKPP
	4TwchfPyrvoRr/uSIbI6fDon/+EFhCxge7+24mDodxrchG2h/U
X-Received: from pfuj2.prod.google.com ([2002:a05:6a00:1302:b0:837:7965:c70c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a907:b0:837:f111:b70
 with SMTP id d2e1a72fcca58-83f18d5b89cmr17688828b3a.4.1779138876899; Mon, 18
 May 2026 14:14:36 -0700 (PDT)
Date: Mon, 18 May 2026 14:14:36 -0700
In-Reply-To: <20260515194804.AE30FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-30-seanjc@google.com> <20260515194804.AE30FC2BCB0@smtp.kernel.org>
Message-ID: <aguBPFuPX0ih_ybf@google.com>
Subject: Re: [PATCH v3 29/41] x86/paravirt: Plumb a return code into __paravirt_set_sched_clock()
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 15, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] kvm_sched_clock_read is registered as the system sched_clock before its required offset (kvm_sched_clock_offset) is initialized.
> --
> 
> commit b6e429e4990c00d845488d46e8dc4132f3a2fd8b
> Author: Sean Christopherson <seanjc@google.com>
> x86/paravirt: Plumb a return code into __paravirt_set_sched_clock()
> 
> This commit adds a return code to __paravirt_set_sched_clock() to allow the
> kernel to reject attempts to use a PV sched_clock. It updates the caller
> in kvmclock to check the return value and abort initialization if needed.
> 
> > diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> > index d3bb281c0805d..9b3d1ed1a96dc 100644
> > --- a/arch/x86/kernel/kvmclock.c
> > +++ b/arch/x86/kernel/kvmclock.c
> [ ... ]
> > @@ -338,10 +338,12 @@ static int kvmclock_setup_percpu(unsigned int cpu)
> >  
> >  static __init void kvm_sched_clock_init(bool stable)
> >  {
> > +	if (__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
> > +				       kvm_save_sched_clock_state,
> > +				       kvm_restore_sched_clock_state))
> > +		return;
> > +
> >  	kvm_sched_clock_offset = kvm_clock_read();
> 
> Could this cause a massive backward jump in system time if an NMI or early
> exception calls sched_clock() right after registration?
> 
> __paravirt_set_sched_clock() uses static_call_update() to globally publish
> kvm_sched_clock_read() as the live system sched_clock. Since the
> initialization of kvm_sched_clock_offset is now delayed until after this
> registration completes, any early caller will execute kvm_sched_clock_read()
> with a zero offset, returning a huge absolute raw clock value.
> 
> When the code resumes, it sets the offset to the current raw clock value.
> Subsequent sched_clock() calls will abruptly subtract this large offset,
> causing time to jump backwards and violating monotonic clock guarantees.
> 
> Would it be safer to initialize kvm_sched_clock_offset before calling
> __paravirt_set_sched_clock(), since calculating the offset early has no
> side effects even if the registration is subsequently rejected?

Hmm, yes.  I'll also add a comment explaining exactly that.
