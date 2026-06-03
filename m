Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E4F3A961E;
	Wed,  3 Jun 2026 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499226; cv=none; b=fReZSGgjbHk0sEHDRmUJk7Cf8j67QNf6E0Y8S/eBfn/PtJr6Sdl+YwK0nTDC4U/W/1+xCaB54CLCUvgNloVCUQbJZal2Wm49EQx3az5jp6rtLxh6ncL9EW3z3JqpgSrRePVLeMIp8sBCa7SpLzk653/j4hhnzI66aW7jI9i4XRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499226; c=relaxed/simple;
	bh=x7bKmivEX8oA3kEU64Z/f61X2knJ1G42+V6xLwDeaQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vat72E56RoctjErFfy98V1D2FmiA1IR3paBLaRz22kwTN9Z+A95yoe0nRBjSCxRckzIXEbrkys1jgSVNEHD2lYEjLaiqFDSaub2yHMI4OeJ8P4pqkeOfCBe6PJivvwQZ5uF+RQou+7lcUDG80D+9PWKhHMtppFLrVFY+SwxeuCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UbZ+Bt6/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P4lkiKDe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UbZ+Bt6/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P4lkiKDe"
Date: Wed, 3 Jun 2026 17:07:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780499223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GXQF/dFcPxumU0fV8ISBYaljDmK6bOpyXMC+vPn+0uQ=;
	b=UbZ+Bt6/AyZuRYVeYl8zENmmUWFxKiamKKhXoRc1inXRfBlnru9bHlxFfJZ7v43VgF8f57
	SRMCkS/uacdYpnKI1ZaEZCMY4wsaGv+brSMhtqNznMu301n5jk9o//Tv3y/QpgwuYmLuQk
	0Ftld5HYV02HLZ70v8pqU3qWqYOnPJoPpfMg7FXyYfz3h+i5FfVGyUwi3YZECBxFNeC8ex
	R+BlkLYJlXkop3JRoWat2lL3XWnZl/HXdgxsaJd8V55H8//3K09VmS8RmuJv3J9L1D1wiI
	47dk5xoVZsPC2XYb7V0io5dw4FUiv95X0llqfCR0UFo/AYvUMhD299zGb3WHDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780499223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GXQF/dFcPxumU0fV8ISBYaljDmK6bOpyXMC+vPn+0uQ=;
	b=P4lkiKDerQNcN7yaR+z6vv3FQoo9OB+6vOU/fmuzT9sTX09NMyWzsnjD0h/6ollDFmoVKH
	9Z3SjayN5Gx4iUBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 5/9] mailbox: imx: Start splitting the IRQ handler in
 primary and threaded handler
Message-ID: <20260603150702.m9EFLCZb@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-5-a0059dc3b69a@linutronix.de>
 <20260603135823.1094E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603135823.1094E1F00893@smtp.kernel.org>

On 2026-06-03 13:58:22 [+0000], sashiko-bot@kernel.org wrote:
> > diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> > index d1de07cc0ed62..006aa76b74b62 100644
> > --- a/drivers/mailbox/imx-mailbox.c
> > +++ b/drivers/mailbox/imx-mailbox.c
> 
> [ ... ]
> 
> > @@ -629,7 +655,8 @@ static int imx_mu_startup(struct mbox_chan *chan)
> >  	if (!(priv->dcfg->type & IMX_MU_V2_IRQ))
> >  		irq_flag |= IRQF_SHARED;
> >  
> > -	ret = request_irq(priv->irq[cp->type], imx_mu_isr, irq_flag, cp->irq_desc, chan);
> > +	ret = request_threaded_irq(priv->irq[cp->type], imx_mu_isr, imx_mu_isr_th,
> > +				   irq_flag, cp->irq_desc, chan);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but looking at imx_mu_startup()
> in drivers/mailbox/imx-mailbox.c, the return value of pm_runtime_get_sync()
> is ignored:
> 
> 	pm_runtime_get_sync(priv->dev);
> 	if (cp->type == IMX_MU_TYPE_TXDB_V2)
> 		return 0;
> 
> If the PM domain fails to resume (for example, returning -ENOMEM or
> -ETIMEDOUT), will the function proceed to interact with hardware registers?
> On i.MX platforms, accessing unclocked or unpowered hardware registers
> typically results in a synchronous external abort and a kernel panic.

Yeah, not sure what to do here. If it fails, and we return with an error
the upper layer invokes the shutdown callback wich will free_irq, put pm
and write registers anyway.

Sebastian
