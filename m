Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9E447989C
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671409; cv=none; b=jgX+7DMiFCr073sUWVyhtmRidIdxscl1GAzlRtGJ2cYouUkTWA6BJVCyWLljjPfY/CSvjVlk9/WxbMOgzw1JFMCB9itkg4u34vo9x8iWIqm20Cob75H2TQqWrwBlupwS3ESaC6XVGi9gT5IW9Tbh9Xmc7gCEcySzCeKqb6+0MLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671409; c=relaxed/simple;
	bh=tqigy/RPPNbZFnODG/49qM6N3MCyj/CtBjinXZTerNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgAX23+Efgb/cjPmbdwKREDNVAvqyjHpJryBKSSgz0iBBt7dB7qwCSbSD+fGUvYAweaVY9H/i0eH1SOEtODqm95PZpF+6V80Ilg1mJJy4oPaiifJpIXO0kWf6bfdJSMupxmkGVTtKZb8h3GuNSdIp6c1EuzKlLlxbEoaiQDO3nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FwJSdlhP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FwJSdlhP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2079F4E410BA;
	Tue, 29 Sep 2026 08:43:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8296601BD;
	Tue, 29 Sep 2026 08:43:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A436710329732;
	Tue, 29 Sep 2026 10:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790671403; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XUukpv0RaIWaTqnSN1VNGyI5f7tSEwPscxKOXLtVRsE=;
	b=FwJSdlhP6pe7/Kd5jKpAUiVPxH2cAT/tFLWQW31u5oY9KXpioM2fM2lBXBrN7EaCOR0lZQ
	GPCSN35ECSA+IZ+FQyzKB1y2aFYqfRUYn67yBrENCT40V+/B+DvGrwl9jsujzDrQELI7rS
	y4z3dS64LUrkOKMA8yyZFtPyRaNfT2uAHxTSZGbDaVVpgQsfBJdI/Qv7gu8esxJwz3fMMI
	Bat5YHlY7cnxHFwptYGBTRSwWlRj4cVw+9s9kqzJGfS7Y5rO8gsE5Yl8DI8NYZ509wOqJw
	x+eQT0aAxcwlQc4bzoXipCGebj/W4DTDoADbMLN4bZ3aHyTbho6Wvme9ggh/hg==
Date: Tue, 29 Sep 2026 10:43:20 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
 wsa+renesas@sang-engineering.com, robh@kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] clocksource/drivers: Add support for the Renesas
 RZ/N1 timers
Message-ID: <20260929104320.0e6eeadc@bootlin.com>
In-Reply-To: <20260911151837.709F41F000FF@smtp.kernel.org>
References: <20260911150456.893761-1-herve.codina@bootlin.com>
	<20260911150456.893761-3-herve.codina@bootlin.com>
	<20260911151837.709F41F000FF@smtp.kernel.org>
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

On Fri, 11 Sep 2026 15:18:37 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The 16-bit per-CPU timers will never be chosen over the arch timer due to their low rating, resulting in asymmetrical per-CPU tick devices.
> - [Medium] Clocksource and sched_clock return raw decreasing values if the timer is a down-counter.
> --
> 
> commit 0389aacef8150cde2d480116d05b7b23c573015b
> Author: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> 
> clocksource/drivers: Add support for the Renesas RZ/N1 timers
> 
> The Renesas RZ/N1 timer block controller is the controller in charge of
> timers available in the Renesas RZ/N1 SoCs family. This controller handles
> 8 timers (6 16-bit, 2 32-bit). Each timer has its own interrupt and prescaler.
> 
> > diff --git a/drivers/clocksource/timer-rzn1.c b/drivers/clocksource/timer-rzn1.c
> > new file mode 100644
> > index 0000000000000..a66a045309f63
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
> If the timer is a down-counter, will these functions return a decreasing value?
> 
> The clocksource and sched_clock cores require monotonically increasing values.
> If the timer counts down, returning the raw value could cause the
> (now - last) & mask calculation to yield large forward time jumps, breaking
> system timekeeping and scheduling.

Timers available in the hardware increases their counter.

These functions return increasing values.

> 
> [ ... ]
> 
> > +static int rzn1_local_timer_starting_cpu(unsigned int cpu)
> > +{
> > +	struct rzn1_timer *timer;
> > +
> > +	/* We assign the first and second 16-bit timer as per-cpu timers. */
> > +	if (cpu >= 2)
> > +		return 0;
> > +
> > +	timer = &rzn1_tab_timers[cpu + RZN1_TIMER_BASE_INDEX_16BIT_TIMERS];  
> 
> [ ... ]
> 
> > +static void rzn1_timer_clkevt_init_ced(struct rzn1_timer *timer, const char *name,
> > +				       int irq)
> > +{  
> 
> [ ... ]
> 
> > +	/*
> > +	 * 32-bit timers are fed with a 25 MHz clock directly derived from the
> > +	 * main PLL (1 GHz). The arch timer, ARMv7 CP15 in RZ/N1 SoCs, is fed
> > +	 * with to a 6.25 MHz clock.
> > +	 *
> > +	 * The clock of the RZ/N1 timers block is a stable one and the RZ/N1
> > +	 * timers have a higher resolution than the ARM CP15 one.
> > +	 *
> > +	 * Also those 32-bit RZ/N1 timers are assigned per-cpu.
> > +	 *
> > +	 * Use a high rating for the 32-bit RZ/N1 timers in order to have them
> > +	 * chosen by the system.
> > +	 */
> > +	timer->ced.rating = timer->width == 16 ? 200 : 460;  
> 
> [Severity: High]
> Is it intentional that the 16-bit per-CPU timers are assigned a rating of 200?
> 
> In rzn1_local_timer_starting_cpu(), the 16-bit timers are explicitly assigned
> as the per-CPU tick devices. However, because the ARM arch timer typically has
> a higher rating (400-450), won't the 16-bit timers always be outranked and
> ignored by the clockevents core?
> 
> This appears to contradict the comment stating that 32-bit timers are assigned
> per-cpu, and could leave CPU 1 falling back to the arch timer while CPU 0
> might use the global 32-bit timer, resulting in asymmetrical per-CPU tick
> devices.
> 

First the comment is not fully correct. Only 16-bit timers are registered
per-cpu. I will update the comment in the next series iteration.

We have one 32-bit timer shared between cpu (cpumask set to cpu_possible_mask),
two 16-bit timers per-cpu with cpumask set to the cpu registering the timer in
rzn1_local_timer_starting_cpu().

When timers are registered (calls to clockevents_config_and_register() function),
tick_check_preferred() [1] is called.

This function prefers a local cpu timer even if the local cpu timer has a rating
lower than a shared cpu timer.

With that pointed out, we cannot have asymmetrical per-CPU tick devices.

[1] https://elixir.bootlin.com/linux/v7.3-rc5/source/kernel/time/tick-common.c#L289

Best regards,
Hervé
