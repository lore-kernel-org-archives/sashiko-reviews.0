Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BCD3988EB;
	Wed,  3 Jun 2026 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498785; cv=none; b=hfuvqGgEIKYYRmpW4CwfLjANPDmBNqtaC7EH7+lkg008G0ipPprJloqPGqMNP4iqlHrtip1GzC3unOeYPC0bbnbOt0jmrnLYj18LCsrKEkfpbE2LdLZCnQHElwO+i37nCXwujmSEKknkKFlXUhpDz/K8FbK5+/4OfJbnHxbE1HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498785; c=relaxed/simple;
	bh=NoITtLJObXO3SaoD9MPdOkpbruied3hfVXYQFDcGqLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCBJra25WNs4Q2tlPc78hDZwM8gxoGLljyzcCQ5w/HoYZ4o8E+Q+00NbkG5i+KbKmlasyql/7BnxKvuFBfjSOLx+Wo1BNhqcqF/IQkOVTDwynDcE9Wz7Hm9Rn5eea0USnUTVNqMixujKH2VUOq7DIGNQoccgYgPq5AHHZV7PyAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PhWvsK+F; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/IpcKDci; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PhWvsK+F";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/IpcKDci"
Date: Wed, 3 Jun 2026 16:59:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780498782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HL/fHTQ361T/URAbyL2v9IB2WIwU5tb8cTTd3/bjY0E=;
	b=PhWvsK+FdSwpWFGJZ/4XVxdNULx//cErX1+XzatSHxA9ZBmVBiib8K+jTDIt3jNOcsAwFX
	aHGcEIVNA+YU2SkjLl3GOizeA91OKAQtru1yiVJki6AcIVw31NeRQtMf7m+ceF/FIJiuab
	w+hacM3sj1agdCcvQcFLsc8QXUgnfMDNMXYrexL9xx6zqemOoAwGDEX6EHcz9oRKLr5R2C
	yrBl5DL+POLA+bwbI2Wwuc2GvCxECNsxupwe5NCTpNzRRT8ypdUc5Ymm8a/iXgVfMdejoq
	A8DVGoNbhmukl5y5A99mpAD9vwPnGb8JHhyIvfFsAyfSZ3vEtnwr9zGFXTDd9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780498782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HL/fHTQ361T/URAbyL2v9IB2WIwU5tb8cTTd3/bjY0E=;
	b=/IpcKDciq2yW23wxKhcF0W0rRemOOBHfcGAq0pN7hSp9SNfbV/37qVj09XzHOrnfAcC6zd
	1M/+VGqNkSQhF3AA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/9] mailbox: imx: Add a channel shutdown field
Message-ID: <20260603145941.knP7ixQp@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-1-a0059dc3b69a@linutronix.de>
 <20260603132029.98A3D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603132029.98A3D1F00893@smtp.kernel.org>

On 2026-06-03 13:20:28 [+0000], sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Timeout in imx_mu_seco_rxdb() skips clearing the hardware interrupt status, causing an infinite IRQ storm.
> - [High] The patch addresses a race where an RX interrupt can be re-enabled during channel shutdown, but fails to fix the exact same race for TX channels. This can result in an unhandled interrupt and the kernel disabling the shared IRQ line.
> - [High] Error paths in imx_mu_specific_rx() permanently wedge the RX channel by leaving the receive interrupt disabled.
> - [High] The driver performs a multi-second busy-wait polling loop inside RT-priority threaded handlers, triggering softlockups.
> --
> 
> commit e0f87aaf04945c03d65f3581c6859712272ba596
> Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> mailbox: imx: Add a channel shutdown field
> 
> Introduce imx_mu_con_priv::shutdown to signal that the channel is shutting
> down. This prevents a race condition where an RX event could be disabled in
> shutdown() and then incorrectly re-enabled by the ISR.
> 
> > diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> > index 246a9a9e39520..34edc2f31dcb5 100644
> > --- a/drivers/mailbox/imx-mailbox.c
> > +++ b/drivers/mailbox/imx-mailbox.c
> [ ... ]
> > @@ -376,7 +407,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv, struct imx_mu_con_priv *
> >  		*data++ = imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
> >  	}
> >  
> > -	imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0), 0);
> > +	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0));
> >  	mbox_chan_received_data(cp->chan, (void *)priv->msg);
> >  
> >  	return 0;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but can error paths in
> imx_mu_specific_rx() permanently wedge the RX channel by leaving the receive
> interrupt disabled?

Yes, it is intended.

> [Severity: High]
> This isn't a bug introduced by this patch, but is it safe to perform a
> multi-second busy-wait polling loop inside RT-priority threaded handlers, or
> could this trigger softlockups?
> 
> The driver uses multi-second busy-wait polling in functions called from the
> threaded interrupt handler. imx_mu_specific_rx() uses readl_poll_timeout()
> with a 5-second timeout:
> 
>     ret = readl_poll_timeout(..., 0, 5 * USEC_PER_SEC);
> 
> Similarly, imx_mu_rx_waiting_read() loops for 3 seconds without sleeping:
> 
>     } while (!can_read && time_is_after_jiffies64(timeout_time));
> 
> Because threaded IRQ handlers run as Real-Time tasks (SCHED_FIFO,
> priority 50), spinning for up to 5 seconds will entirely stall the CPU
> core, starve normal priority tasks, delay RCU grace periods, and
> trigger softlockup and RCU stall panics.

Well, yes. But it improves since the threaded handler is preemptible by
task with higher priority :)

> [ ... ]
> > @@ -638,13 +670,13 @@ static void imx_mu_shutdown(struct mbox_chan *chan)
> >  
> >  	switch (cp->type) {
> >  	case IMX_MU_TYPE_TX:
> > -		imx_mu_xcr_rmw(priv, IMX_MU_TCR, 0, IMX_MU_xCR_TIEn(priv->dcfg->type, cp->idx));
> > +		imx_mu_xcr_clr_shut(priv, cp, IMX_MU_TCR, IMX_MU_xCR_TIEn(priv->dcfg->type, cp->idx));
> >  		break;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but would the same race condition
> exist for TX channels, potentially resulting in unhandled interrupts?
> 
> When shutting down a TX channel, imx_mu_shutdown() calls
> imx_mu_xcr_clr_shut() to clear the TX interrupt enable bit (TIEn) and set
> cp->shutdown = true. It then calls free_irq(), which waits for any running
> threaded ISR to finish.
> 
> If the threaded ISR (imx_mu_isr_th) is running concurrently, it acknowledges
> the interrupt and calls mbox_chan_txdone(). This can push the next queued
> message via send_data(), invoking imx_mu_generic_tx() or
> imx_mu_specific_tx().
> 
> Both of these TX functions unconditionally re-enable the TX interrupt using
> imx_mu_xcr_rmw(), completely ignoring the cp->shutdown flag:
> 
>     imx_mu_xcr_rmw(priv, IMX_MU_TCR,
>                    IMX_MU_xCR_TIEn(priv->dcfg->type, cp->idx), 0);
> 
> After the handler finishes, free_irq() unregisters the interrupt handler.
> The hardware will eventually assert the TX interrupt because TIEn was
> re-enabled. Since the IRQ is shared, other handlers will return IRQ_NONE,
> leading to an interrupt storm and the kernel disabling the shared IRQ line.
> Should the fix have used imx_mu_xcr_set_act() in the TX paths, just as it did
> for RX?

The TX part should have been disabled by the upper layer before
invoking/ allowing send. It should for the pending TX to complete before
removing the channel I think.

> >  	case IMX_MU_TYPE_RX:
> > -		imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx));
> > +		imx_mu_xcr_clr_shut(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx));
> >  		break;
> >  	case IMX_MU_TYPE_RXDB:
> > -		imx_mu_xcr_rmw(priv, IMX_MU_GIER, 0, IMX_MU_xCR_GIEn(priv->dcfg->type, cp->idx));
> > +		imx_mu_xcr_clr_shut(priv, cp, IMX_MU_GIER, IMX_MU_xCR_GIEn(priv->dcfg->type, cp->idx));
> 
> [Severity: Critical]
> This isn't a bug introduced by this patch, but does a timeout in
> imx_mu_seco_rxdb() skip clearing the hardware interrupt status, causing an
> infinite IRQ storm?
> 
> In imx_mu_seco_rxdb(), if imx_mu_rx_waiting_read() times out, the function
> jumps to the error label:
> 
>     if (err) {
>         dev_err(priv->dev, "Timeout rx %d\n", i);
>         goto error;
>     }
> 
> This bypasses the hardware write that clears the General Purpose Interrupt
> Pending (GIPn) bit. The threaded handler (imx_mu_isr_th) ignores the error
> return value from rxdb() and unconditionally unmasks the interrupt:
> 
>     priv->dcfg->rxdb(priv, cp);
>     imx_mu_xcr_set_act(priv, cp, IMX_MU_GIER,
>                        IMX_MU_xCR_GIEn(priv->dcfg->type, cp->idx));
> 
> Because the hardware interrupt is never acknowledged or disabled, the
> interrupt controller will immediately re-trigger the ISR. This cycle repeats
> infinitely: trigger, thread busy-waits 3 seconds, timeout, unmask, trigger
> again, completely locking up the CPU.

I see. So I guess I could add the same check I have in IMX_MU_TYPE_RX to
not unmask the interrupt again.

Sebastian
