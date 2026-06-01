Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB09C2DA74C;
	Mon,  1 Jun 2026 16:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330029; cv=none; b=E4qCKZjHVH0IqmY99mXVCkU8wkmX2+DhV9IEx52QCsCMcRMAVVV6CmcpiXHufSUQruG6IIEw95AAnWPlIsGLa9G9weI+PiqPVjVdzKe1zpxG1AA3OaCk55ORJHytnWfb0iwwpbPOMyLIs1rCFu0h4ZW6etiWQr9hrLs9R2ONH20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330029; c=relaxed/simple;
	bh=oo/QYOnYLetuILEalDu1SKxNIdDA9CwVlLYOmmPoKgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUT+qa4xcT1+hup43JJVfYXtWsUc4Sixg+6rV1M2wnkcMKQHRAfAHbMCGLslZGm79roVloR75T3z32VEGV8Q11v1nTJRN6UJyxGWcXNTa/x93fRdr4PbHswUyc2vtKw0CxCtyiuesuXl1J8ja7cXMpspXX8IY2LIHeFAHV0Fmlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DwlBBR6M; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gCjOo6hd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DwlBBR6M";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gCjOo6hd"
Date: Mon, 1 Jun 2026 18:07:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780330024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fq7Kc8lQbI6eVkEnnUZrZ0365IjcRBi59m9wngY/bzU=;
	b=DwlBBR6Mn2JTLYRfmXwMh9/WVm6Dih12U66SI8Ntiiq9IO1ppLrUpl+hPvNduq5b5zS1zl
	bnayzbllePHlW1csTatS4PVs7W4aWsxGUhzhpVGzKP025Jav9UgZZuO65LP4kLD4W3AU7l
	Ko9Hbi3UaSOGPUg2vCSNMAIN4GD1J0FjjxGBfnqmrswj+UxnZtxHR9lSz39d9B5gGyM55w
	g/4I0MUbkhRDbpmrRdZk9IEfJve6VMumsTpPEAPWci6kpNR+u7zS0v5pmAQ7nk7D45ocG1
	lOeTqJR0PxbiBk3lr7z3S7CXXfVI+4FpngbeHzjXgTtSXDydtUT0T/fvhvtU9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780330024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fq7Kc8lQbI6eVkEnnUZrZ0365IjcRBi59m9wngY/bzU=;
	b=gCjOo6hdH4BpwwEebvz8HBa9y2OwnVTx39fVPH0bV62ER+w2ieXmsepuAyH+7qXTvAng7B
	8YIIN0yLD2HKNfBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/5] mailbox: imx: Move the RX part of the mailbox into
 the threaded handler
Message-ID: <20260601160702.eZoCBpfm@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-2-b8ffc36e11e5@linutronix.de>
 <20260529172635.A1EDB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529172635.A1EDB1F00893@smtp.kernel.org>

On 2026-05-29 17:26:35 [+0000], sashiko-bot@kernel.org wrote:
> commit 7ab3fb54b60e0decf23b64d1d78df0e2b4409f2a
> Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> mailbox: imx: Move the RX part of the mailbox into the threaded handler
> 
> This commit moves the RX mailbox callback handling into the threaded
> interrupt handler. It updates the driver to mask the RX interrupt in the
> primary handler and unmask it in the threaded handler upon success.
> 
> > diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> > --- a/drivers/mailbox/imx-mailbox.c
> > +++ b/drivers/mailbox/imx-mailbox.c
> 
> [ ... ]
> 
> > @@ -524,6 +522,12 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
> >  		mbox_chan_txdone(chan, 0);
> >  		return IRQ_HANDLED;
> >  
> > +	case IMX_MU_TYPE_RX:
> > +		cp->pending = 0;
> > +		if (!priv->dcfg->rx(priv, cp))
> > +			imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx), 0);
> 
> [Severity: High]
> This is a pre-existing issue, but does bypassing the unmasking step on
> error permanently disable the channel?

Yes, I think this is the intention. The RX callback does not unmask the
event on error.

> If imx_mu_specific_rx() encounters an error, such as a read timeout or
> receiving a message that exceeds the maximum size, it returns a negative
> error code. When this happens, the condition evaluates to false and the
> interrupt remains masked.
> 
> Since there does not seem to be a mechanism to automatically reset the
> channel after these errors, could a buggy remote processor trigger this
> to cause a permanent denial of service for the RX channel?
> 
> [Severity: High]
> Can this unmasking step also race with channel shutdown?
> 
> If mbox_free_channel() is called concurrently, imx_mu_shutdown() masks the
> interrupt and invokes free_irq(). The free_irq() function synchronizes
> with the threaded handler and will block until imx_mu_isr_th() finishes
> processing.
> 
> Because imx_mu_isr_th() proceeds to unmask the interrupt here after
> processing, the hardware interrupt will be left enabled after the kernel
> IRQ handler is fully unregistered. If a new message arrives afterward,
> won't this cause an interrupt storm and prompt the genirq core to disable
> the shared IRQ line entirely?

Yes, we had this.

> > +		return IRQ_HANDLED;
> > +
> >  	default:
> >  		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",

Sebastian
