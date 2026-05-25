Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8F02F0C62;
	Mon, 25 May 2026 03:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779681322; cv=none; b=QEa4Qd3eJJave7G/gD7czdPQAUhWMpW2CYm68xyewhsLK42lW5RuDxIrqXS+PSgo1nnEKiEmD4GsVeldu9m0b7sjHmxSOEDXR6AxYaT9A+vcWifDxCpiKaYEwA7ZHAqc9xyjZ5XmtFnOP0ZFbgUfZla0GyC4XcvyYAOr4QZK4Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779681322; c=relaxed/simple;
	bh=EKVi+4caqIDgoJF/dgxRiZWYVQclO9I/Mzq73De+qzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxe1WRx/lRbXU45XJgl7OuN7mUYz3KEbprniI3+HLsGS3gm/twh2w9VzsQ0v3peiM90ytRKKSc4mI9jqJIMEl4wSn9f/DRsCVVEABk0J9GBuJyOobWj6Ybw+ZZ8asAPocIMoqAaEdPtQkpOY3PBwcv6vWCVuztEnq4TbdZ4J93M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkzlP1wA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkzlP1wA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588F31F000E9;
	Mon, 25 May 2026 03:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779681321;
	bh=GJGPDy2NqAuD+HaEzHYKQ9IbD3gml8yfz1uOPa87iGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UkzlP1wAQ3j3yN1xzMErOO4AZrfTmCgwJSuJOzFqykZrbRP21EiYAg9giiW+/q683
	 sgvo/XbXJF1kWyRhKRn3L1xDMNlvmpmxwJGBPEoALPAoh2IhJLUaRGHWGt7SwRS1ta
	 mcDxCnDK27dsnG0Fc2bnb5UsFajQ1ssqSJXebswiteu8h//+Im9uUdMXKtY5TFikHj
	 NjTT78FEo/Th3e6zQwURv4faq+Oz7gbtbnDro+m3whSGLB7glzZ11gkAJ/y3p53iZG
	 Be6QpB0uxzrXk3toSiVNj2LoVplCTx+mz1yNwr8KcyshxvToptnrzgv7pYxCvApwjX
	 AUoGM9shspIkw==
Date: Sun, 24 May 2026 20:55:20 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v5 03/18] riscv: add support for srmcfg CSR from
 Ssqosid extension
Message-ID: <ahPIKDdzr4SDSaGD@gen8>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-3-78d3a7ba9dbe@kernel.org>
 <20260525003007.7D4E91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525003007.7D4E91F000E9@smtp.kernel.org>

On Mon, May 25, 2026 at 12:30:07AM +0000, sashiko-bot@kernel.org wrote:
> > +static int riscv_srmcfg_pm_notify(struct notifier_block *nb,
> > +				  unsigned long action, void *unused)
> > +{
> > +	switch (action) {
> > +	case CPU_PM_EXIT:
> > +	case CPU_PM_ENTER_FAILED:
> > +		__this_cpu_write(cpu_srmcfg, U32_MAX);
> > +		break;
> > +	}
> > +	return NOTIFY_OK;
> > +}
> 
> [Severity: High]
> Does this leave the currently executing task with an incorrect hardware CSR
> state?
> 
> While the software cache is invalidated by setting cpu_srmcfg to U32_MAX,
> the hardware CSR_SRMCFG register is not explicitly reprogrammed during
> CPU_PM_EXIT.
> 
> Since the hardware state may be lost or reset to an implementation-defined
> value upon resume, wouldn't the task running at resume time continue executing
> with the wrong QoS tag until it is eventually preempted?

This is not a problem. cache invalidation is sufficient. CSR write here
would be setting a value that __switch_to_srmcfg() will re-write moments
later.

> > +static int __init riscv_srmcfg_init(void)
> > +{
> > +	int err;
> > +
> > +	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SSQOSID))
> > +		return 0;
> > +
> > +	/*
> > +	 * cpuhp_setup_state() invokes the startup callback locally on every
> > +	 * already-online CPU, so no separate seed loop is needed here.
> > +	 */
> > +	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/srmcfg:online",
> > +				riscv_srmcfg_online, NULL);
> 
> [Severity: High]
> Should a teardown callback be provided to cpuhp_setup_state() to invalidate
> the cpu_srmcfg cache when a CPU goes offline?

The startup callback riscv_srmcfg_online() is the one that invalidates
the cache. A teardown callback that did the same thing on offline would be
redundant with the online seed. 

> Without a teardown callback, a CPU going offline retains its previous
> cpu_srmcfg value. When brought back online, its hardware CSR is reset.
> 
> Tasks scheduling before the CPU reaches the CPUHP_AP_ONLINE_DYN state might
> skip the CSR write if their thread srmcfg tag matches the stale cache. Could
> this allow those early context switches to bypass resource constraints by
> running with the hardware-reset CSR?

I will move the seed earlier to CPUHP_AP_STARTING so the cache is
invalidated before the CPU is scheduleable.

-Drew
