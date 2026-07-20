Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B48386564
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 15:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562179; cv=none; b=kKLn73eGjwDDQqdGMsAqkNfNVci7lgI3vZ1ORLJtEybWP0ilR4SAYvb9zkHd3jZmR2DO6NBBjp7CltcbN9j7tnPrn+L2XE9gg5zm0LnRyYIG1yOIjcDMCvJdeDpt/SjPzVg7U2xrq3RUMoy3snatQQCEz1eVJd+1WLFpqOhJOkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562179; c=relaxed/simple;
	bh=bqptOEYTnMG0xH43KU83uKF6vN1s61/Q/KAVwC65HWo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOK6mDOBGMM3A4ymRBt6SN/6aD9LIYdBdZQL+PsXu8Km4jGaXHDcOx3UUgs0/wRC90eJGwGgpM7B79nuwcLcbd15PvIqpT9LzAdeb7MRQsFM+5Bc8vlJWJcNWNOPea39t/DEruLchKBqyfSGV1MIGpBke+zdwV533jiiPYleuCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jR/HLDHM; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jR/HLDHM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 66C311A10FA;
	Mon, 20 Jul 2026 15:42:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A70E60360;
	Mon, 20 Jul 2026 15:42:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A2DA11BD3002;
	Mon, 20 Jul 2026 17:42:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784562173; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p/tRl3um/s+K+6CX2a/QC8jrdiXLGaEGuLPuQIf0C3I=;
	b=jR/HLDHMjkI533cP8Ol7T0gp+dw2K75CNSHBhozkPhrPu9pbYEN91lE6hSXDa8L0Ph64lF
	+ZSpkxZbfVn5q5Ldz1e+K2z4yHB9yXgTzb8SdZqcvBw/9uffI6u7VcDAzMHniC+sO9fn+Z
	PKmPfskxihBufegCxsRqB03H6uLmADZHUO7os3JKMNPKuh9i9fgwX3O+F/YA398VV7NnCG
	PXZUzqGCdfc9OmNR8UuPgKCCESvRT1iVJcfBhUoBZtkf1JmefnPZlIKr86tYJhZaQAODUT
	QGLo0LmWUgLrq2EXRXAsP9efohdWS/7q+K1U8/A72UzRcGY0SyCip9bxV2RAWw==
Date: Mon, 20 Jul 2026 17:42:51 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, wsa+renesas@sang-engineering.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 2/4] clocksource/drivers: Add support for the Renesas
 RZ/N1 timers
Message-ID: <20260720174251.4b312f71@bootlin.com>
In-Reply-To: <20260717100827.592531F000E9@smtp.kernel.org>
References: <20260717095552.767475-1-herve.codina@bootlin.com>
	<20260717095552.767475-3-herve.codina@bootlin.com>
	<20260717100827.592531F000E9@smtp.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On Fri, 17 Jul 2026 10:08:26 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Off-by-one error in CPU bounds check allows out-of-bounds array access in the hotplug callback.
> - [High] A 16-bit high-frequency clocksource is incorrectly flagged with CLOCK_SOURCE_SUSPEND_NONSTOP, breaking system suspend timekeeping.
> - [High] Probe incorrectly returns a positive IRQ number on devm_request_irq failure.
> - [High] Missing teardown callback in cpuhp_setup_state causes a Use-After-Free of clockevent devices.
> - [Medium] Down-counting timer values are potentially returned directly, breaking the requirement for monotonic increasing counters.
> - [Medium] Failing CPU bringup by returning an error from a CPU hotplug starting callback.
> --
> 
> --- Patch [2]: [PATCH v3 2/4] clocksource/drivers: Add support for the Renesas RZ/N1 timers ---
> commit 67eeb3e62e1eb246f2738740b9b5319a484b8d50
> Author: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> 
> clocksource/drivers: Add support for the Renesas RZ/N1 timers
> 
> The Renesas RZ/N1 timer block controller is the controller in charge of
> timers available in the Renesas RZ/N1 SoCs family. This controller handles
> 8 timers: 6 16-bit timers and 2 32-bit timers.
> 
> > diff --git a/drivers/clocksource/timer-rzn1.c b/drivers/clocksource/timer-rzn1.c
> > new file mode 100644
> > index 0000000000000..024f01bb0227b
> > --- /dev/null
> > +++ b/drivers/clocksource/timer-rzn1.c  
> 
> [ ... ]
> 
> > +static u64 notrace rzn1_sched_read(void)
> > +{
> > +	return readl_relaxed(rzn1_sched_clock->base + RZN1_TIMER_CURRENT_COUNT_REG);
> > +}
> > +
> > +static u64 rzn1_clksrc_read(struct clocksource *cs)
> > +{
> > +	return readl_relaxed(rzn1_sched_clock->base + RZN1_TIMER_CURRENT_COUNT_REG);
> > +}  
> 
> [Severity: Medium]
> Since RZN1_TIMER_LOAD_COUNT_REG is used earlier to set the timer period,
> does this hardware act as a down-counter?
> 
> If the hardware counts downward, will returning the raw value here break the
> timekeeping requirement for monotonically increasing values?

The timer counter is an incrementing counter.
It is compared to the LOAD_COUNT register value to trig an interrupt. 

> 
> > +static struct clocksource rzn1_clocksource = {
> > +	.name = "rzn1_timer_clocksource",
> > +	.rating = 200,
> > +	.flags = CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,  
> 
> [Severity: High]
> Is it safe to flag a 16-bit clocksource with CLOCK_SOURCE_SUSPEND_NONSTOP?
> 
> Since a 16-bit counter fed by a high-frequency clock will wrap around very
> quickly, will this cause massive wall time jumps if the system suspends for
> longer than the wrap interval?

This flag shouldn't be present. Will be removed in the next iteration.

> 
> > +	.read = rzn1_clksrc_read,
> > +};
> > +
> > +/* Timers table where 32-bit timers will be assigned per-cpu */
> > +static struct rzn1_timer *rzn1_tab_timers;
> > +
> > +static int rzn1_local_timer_starting_cpu(unsigned int cpu)
> > +{
> > +	struct rzn1_timer *timer;
> > +
> > +	if (cpu > RZN1_TIMER_NB_32BIT_TIMERS)
> > +		return -EINVAL;  
> 
> [Severity: Medium]
> Will returning an error like -EINVAL completely abort the hotplug process
> for any CPU beyond the first two?
> 
> Should this return 0 instead, allowing additional CPUs to still boot online
> and rely on a global broadcast timer?

Indeed, returning 0 is better even if we should reach this case on RZ/N1 SoCs.
Will update in the next iteration.

> 
> [Severity: High]
> Also, does the greater-than condition here have an off-by-one error?
> 
> If RZN1_TIMER_NB_32BIT_TIMERS is 2, a cpu value of 2 bypasses this check.

Will update in the next iteration.

> 
> > +
> > +	timer = &rzn1_tab_timers[cpu + RZN1_TIMER_BASE_INDEX_32BIT_TIMERS];  
> 
> [Severity: High]
> If a cpu value of 2 bypassed the check above, will this access out of bounds?
> 
> The array is only sized for 8 elements total. Adding a cpu value of 2 to
> RZN1_TIMER_BASE_INDEX_32BIT_TIMERS (which is 6) computes an index of 8.

The cpu value check against RZN1_TIMER_NB_32BIT_TIMERS will be update in the
next iteration. This possible out of bound access will not exist anymore.

> 
> [ ... ]
> 
> > +static int rzn1_timer_setup_timers(struct platform_device *pdev,
> > +				   struct rzn1_timer *tab_timers,
> > +				   unsigned int first_timer_index,
> > +				   unsigned int last_timer_index,
> > +				   void __iomem *base, unsigned long clock_rate)
> > +{  
> 
> [ ... ]
> 
> > +		ret = devm_request_irq(dev, timer->ced.irq, rzn1_timer_interrupt,
> > +				       IRQF_TIMER, timer->ced.name, timer);
> > +		if (ret < 0)
> > +			return dev_err_probe(dev, irq, "timer%u: Failed to request IRQ\n", i);  
> 
> [Severity: High]
> Will calling dev_err_probe() with irq return the positive IRQ number back to
> the caller instead of the negative ret code?
> 
> If the driver probe returns a positive integer, won't the driver core assume
> the probe succeeded despite the failure?

Indeed, will be update in the next iteration.

> 
> [ ... ]
> 
> > +static int rzn1_timer_probe_first(struct platform_device *pdev,
> > +				  struct rzn1_timer *tab_timers,
> > +				  void __iomem *base, unsigned long clock_rate)
> > +{  
> 
> [ ... ]
> 
> > +	/*
> > +	 * Second step, almost all operations that can fail have been called.
> > +	 * Timers are ready to work. Start with the last operation that can fail,
> > +	 * installing and invoking hotplug callbacks
> > +	 */
> > +	rzn1_tab_timers = tab_timers;
> > +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> > +				"clockevents/rzn1/global_timer:starting",
> > +				rzn1_local_timer_starting_cpu, NULL);  
> 
> [Severity: High]
> Does passing a NULL teardown callback here leave registered clockevent
> devices dangling if a subsequent step fails during probe?
> 
> If the driver fails and frees its timer structures via devres, or if a CPU
> is dynamically offlined later, will this lack of teardown cause a
> use-after-free in the clockevents core?

The probe cannot fail after the call to cpuhp_setup_state(). This has been taken
into account. The only case to handle is offlining a CPU (which I am not sure
it could happen in embedded system using a RZ/N1 SoC).

Anyway, will add the teardown function and:
  - Adapt the probe to set IRQ_NOAUTOEN flag on interrupt related to timers
    handled by hotplug.
  - Enable irq hotplug startup function.
  - Disable irq in teardown function.

Best regards,
Hervé
