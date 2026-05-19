Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB4435A3B1
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 18:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214955; cv=none; b=YYUvxcZOYZigVTQEyv2MsErqBDhXStCRhUEzUjI8eVHiUYk5pl4LtVfIVNW+tbQmlGVZnHPyh9so0I2VnCR70zJNdwVjtak4EBM0V6pTD1Nb9geDW3MCcLVDWtSXiTmGIdAJDeotFQGNIUmiuVMe6EXpBpkL4XhnLNwOyymzow0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214955; c=relaxed/simple;
	bh=/iZEIInf+h07QsZt9LdbOhTRLtwkJCA5Nww+jvwEjz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFEQ9NIuAYJQcAB4Nn2iHF83uPuUtNoi+X9EYv8kFfRBcwPyGGiZiGFF8DseuxfJnHkFAqdfQ3QYFgSRD+zda9p8pe6SQfzz4ciKDOn/wStAGcWQDNFiWDDTmDg6RyzLvb/r1dvfZepZJPRxsipPeYrigbiC8Vh7U0iULnKYq0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hn256KXH; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hn256KXH"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8354461da74so1716685b3a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 11:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779214953; x=1779819753; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=djwlqTMl8+NOKghG5Z1Hqhs/9/X6wY6hcEaIBs4ftFI=;
        b=Hn256KXHfDAVIoMoQAe0tQCmJxIgP4tfRXqMobpz9ZNgIJ/Ika3Ng4R4FeiMetii2h
         iAuHFhLJMd6EEMQBT4N9y9JdlrEncO8uoD15C76gx3Tb5DmNKprUBGpM4R4Dqm/FPpD2
         rOHcVsKVenYQRBp2qGXXIdSjxfWSgKJt535lfZjowhsrrIyNylWKCIPamH9oTgwJpbL7
         lhlj3xwR7yPZT109aKJVu22ynFQDXcJ3ns19RRcHNn/KOPUg4a+1R442/SJY/MFip647
         HUDHDjZRccHcOfBohcpF4K7zlE3LuFarZrD/Melo041pWZGehX4O0YnwXLShgSRM743W
         vY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779214953; x=1779819753;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djwlqTMl8+NOKghG5Z1Hqhs/9/X6wY6hcEaIBs4ftFI=;
        b=cA/68+e5AsF5NedGCpJo/wIg+sBvnpjPeNciXZjoCDTI2WEYtbohQ6ac0baJp0PiEM
         MFPF7VxkWjd4o0MWtbl2w+SIwLXF5h0T0Bvke2LRIMRBY2vHkTMDAgyqZ5D0YbuKUjTn
         zufMl8JbwwOUGiPS3ZhH0Xv6B+I/LBZOxHriNnw+sdLNqUWWAd3CJN33xqFqPddW6ZU3
         bQUHYcCMSjBjKXZ+F+5P2uKF0nGn9QjSh+tM03T4KJvzzb97f8DwialM0kSNO9g1v1kh
         KnH/AFEByJTx8XJ2E9YmKxkHHyucdsYyUDVjRvkCLfDfAqmaxRDoot7Jafi7Bdqv+0KS
         8yLw==
X-Gm-Message-State: AOJu0Yy2YR3YjWebHjzcslriALrLcZAg4LeHkq+voJPgq8SRR/NxCYeB
	3xTyEQ6TZ0H6tY+ZYqwk38sWZWAIZen2UNj0FyO95A5exKbbynYzd+afRIgm4Q==
X-Gm-Gg: Acq92OGNLC+D/duazR9ZK3Wl04+rRyYOGH8Hop+2Ee6ysK6VPi8MSl/ZaUJ+y1NKgac
	Aj9nrvYlOackathgLOk4dA6huQhw0Z7muJAhkYrdpkZIRIqicpT4/cweq6cLSVxAQRh/J4aXA5j
	bIwqIVbv0Y3XYmg8mXI43LmuyWEFgPiGINIiSI1h2GgWEVJnks9VQkQg8vn4imBrZ5JcMHm8IyT
	V/Y9pECN/IOc+ZfQ3yO12Jv0LO3BVQpnejLVflrLAj4l8U0M0/kiA7Q6QWXQ/jqIYqM5wycpmzd
	npFHJDKdhVGLs7UtWmPQDBf4sM9VrU7mdmpIbGXDBmVMtju/35KvVKmrYVSaaRBByneNV2S4aCD
	+8SpBdQU7XPpLKXgcJL0rLVM9hUh43cViQo9zqVQVUrfGhvTg1+pAt7ib+/hvLwWO1UcwaDa4um
	NJiHOrT8i/VxVVzAdp/3z3j2rXsgcl7E7JcD7mX/uI6EwqWGFnrWjHw4mAzVHWSEFMDEF4nluxb
	c8ICVLyogiB8nkp
X-Received: by 2002:a05:6a00:1f09:b0:835:41f3:f43e with SMTP id d2e1a72fcca58-83f33c45c8cmr21236031b3a.16.1779214952946;
        Tue, 19 May 2026 11:22:32 -0700 (PDT)
Received: from cchengyang.duckdns.org (36-225-116-93.dynamic-ip.hinet.net. [36.225.116.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5ce1fsm18712359b3a.35.2026.05.19.11.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 11:22:32 -0700 (PDT)
Date: Wed, 20 May 2026 02:22:29 +0800
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sched-ext@lists.linux.dev
Subject: Re: [PATCH 2/2] sched_ext, rcu: Upgrade RCU stall paths to report
 cpumask of stalled CPUs
Message-ID: <20260520020904.G8ffa@cchengyang.duckdns.org>
References: <20260519171745.1551340-3-yphbchou0911@gmail.com>
 <20260519175231.520A0C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519175231.520A0C2BCB3@smtp.kernel.org>

On Tue, May 19, 2026 at 05:52:29PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Dynamic memory allocation (`GFP_ATOMIC`) in the RCU stall detector path can cause a hard deadlock, masking the system hang instead of reporting it.
> --
> 
> commit ffd18e78b03bfaba9705c61803e8bd0bb6325d38
> Author: Cheng-Yang Chou <yphbchou0911@gmail.com>
> 
> sched_ext, rcu: Upgrade RCU stall paths to report cpumask of stalled CPUs
> 
> This commit updates the RCU stall paths to capture all stalled CPUs in a
> cpumask rather than just the detecting CPU. The cpumask is passed through
> the stall handlers and dumped first during a sched_ext state dump to avoid
> losing the stalled CPUs to truncation.
> 
> > diff --git a/kernel/rcu/tree_exp.h b/kernel/rcu/tree_exp.h
> > index 82cada459e5d0..b8f4ca984c1c9 100644
> > --- a/kernel/rcu/tree_exp.h
> > +++ b/kernel/rcu/tree_exp.h
> 
> [ ... ]
> 
> > @@ -659,23 +662,28 @@ static void synchronize_rcu_expedited_wait(void)
> >  
> >  	for (;;) {
> >  		unsigned long j;
> > +		cpumask_var_t stalled_mask;
> > +		bool have_mask;
> >  
> >  		if (synchronize_rcu_expedited_wait_once(jiffies_stall))
> >  			return;
> >  		if (rcu_stall_is_suppressed())
> >  			continue;
> >  
> > +		have_mask = zalloc_cpumask_var(&stalled_mask, GFP_ATOMIC | __GFP_NOWARN);
> > +
> 
> [Severity: High]
> Could this allocation cause a hard deadlock during an RCU stall?
> 
> If CONFIG_CPUMASK_OFFSTACK=y is set, zalloc_cpumask_var() performs a dynamic
> memory allocation via kmalloc(). If the stalled CPU is stuck holding a memory
> allocator lock (such as zone->lock or the SLUB list_lock), the detecting CPU
> will deadlock trying to acquire it.
> 
> Additionally, GFP_ATOMIC includes __GFP_KSWAPD_RECLAIM, which can wake up
> kswapd and acquire scheduler locks (pi_lock, rq->lock). If the stalled
> CPU holds one of these scheduler locks, it could also deadlock here.
> 
> This would completely prevent the RCU stall warning from being printed
> and mask the root cause of the hang. Would it be safer to use a
> statically preallocated cpumask for stall reporting?

I think the concern is valid, will fix this by pre-allocating static
cpumask in rcu_init() and clearing at the start of each stall report.

> 
> >  		nbcon_cpu_emergency_enter();
> >  
> >  		j = jiffies;
> 
> [ ... ]
> 
> > diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
> > index b67532cb87705..90d6eaf1b8415 100644
> > --- a/kernel/rcu/tree_stall.h
> > +++ b/kernel/rcu/tree_stall.h
> 
> [ ... ]
> 
> > @@ -645,6 +647,8 @@ static void print_other_cpu_stall(unsigned long gp_seq, unsigned long gps)
> >  	if (rcu_stall_is_suppressed())
> >  		return;
> >  
> > +	have_mask = zalloc_cpumask_var(&stalled_mask, GFP_ATOMIC | __GFP_NOWARN);
> > +
> 
> [Severity: High]
> Can this dynamic allocation also trigger a hard deadlock?
> 
> print_other_cpu_stall() executes in a critical diagnostic context with
> IRQs disabled (enforced by lockdep_assert_irqs_disabled()). Similar to
> the issue in synchronize_rcu_expedited_wait(), allocating memory here
> might deadlock if the stalled CPU holds a lock required by the memory
> allocator or scheduler.
> 

Ditto.


> >  	nbcon_cpu_emergency_enter();
> >  
> >  	/*
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260519171745.1551340-1-yphbchou0911@gmail.com?part=2

-- 
Cheers,
Cheng-Yang
