Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948E93DB961;
	Mon,  1 Jun 2026 15:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327717; cv=none; b=KU97DtePZdDldpa837q+Cdk2HSf57UfVvWgHbIFM18kZ1shEexlyCBhjQrjkeYx4aA5UpIU7bs03hgaFkiJe7bxwJgjtA0vEldEM3LMPyWcUDqsmZseB77xx+GhO5R/GGoO0H/fSGnkTSEp1LMR5MbXRJS1Gy5loEig3yFs7Yok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327717; c=relaxed/simple;
	bh=iYOy2ktxYO51p96+fWq7rxcL/JrYMzF3TBpkM3pBJJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBufV5C8FU5bsPBS1JNqQCtYMXRb3Av9KyOtiG2MUjz6kxiTa/M2/LhW1VLx3dgMu6fjgAiDb5hGFDWHiHghLacu74ISBkZvi2VjEH/9xps77MCWj17A33yg4Ij/wULoWEHGqPrj3x2X1MV8/QT0Z6uEYGBU2+rFEPLFSV3Refw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mg8uQcMo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=54Kf0/RG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mg8uQcMo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="54Kf0/RG"
Date: Mon, 1 Jun 2026 17:28:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780327708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dtfoWhUnIneS/JLsKnuGHsXBwB598+gXYhEdjgH5d60=;
	b=mg8uQcMoGGegOnsKWlWcBb+5T/4a22++kvF6PrhRTTlCws+0ZwN4JU+C0zjNT8V5bBQTv9
	PRpI/X+pdNzs96kfKJgRYCQelt2iXSAzNn0PIBgJo/OoAPytGsv8k1sRI39Uq/FgIn+iE5
	wpSeZjkYOgZrTA5UsCDDwcT8vDDiZ9O1Ux1ZQu4py8cv0ba2uIFUvCYRZ3V1tHPbr9mEee
	5PhD7Zgo6p6UL+Vj2wvqpABW6u6sE0SOvTiPbhUs1kZ2Uz6cNoOwbKoYaNHB9yAEOGevwF
	Ir7+ZFQ+qguRoe/l1+q4JkKijUr9SZq62fYaewf5hE0ufUMkUruLonAtJdOWSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780327708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dtfoWhUnIneS/JLsKnuGHsXBwB598+gXYhEdjgH5d60=;
	b=54Kf0/RGlR81vKvp7MtmrrQaMtuF89miWM9Mw2dplJdkPWI9jMUSuB96JiaqZ+paYygQhu
	3XO+GKltg56ua/Cg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/5] mailbox: imx: Start splitting the IRQ handler in
 primary and threaded handler
Message-ID: <20260601152827.2l0Ly8o4@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-1-b8ffc36e11e5@linutronix.de>
 <20260529164343.6C3081F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529164343.6C3081F0089A@smtp.kernel.org>

On 2026-05-29 16:43:42 [+0000], sashiko-bot@kernel.org wrote:
> mailbox: imx: Start splitting the IRQ handler in primary and threaded handler
> 
> This commit splits the i.MX mailbox interrupt handling into a primary
> and a threaded handler. The primary handler acknowledges the interrupt
> and wakes the threaded handler to invoke the actual callback in
> preemptible context, starting with the TX path.
> 
> > Split the mailbox irq handling into a primary handler (imx_mu_isr()) and
> > a threaded handler (imx_mu_isr_th()). The primary handler unmasks the
> > interrupt so the threaded handler can run without raising the interrupt
> > again. The threaded handler can invoke the actuall callback in
> > preemtible context.
> 
> [Severity: Medium]
> Is this commit message description accurate regarding unmasking?
> 
> Looking at imx_mu_isr(), it calls imx_mu_xcr_rmw() passing the interrupt
> enable bit as the clr parameter:
> 
> imx_mu_xcr_rmw(priv, IMX_MU_TCR, 0, IMX_MU_xCR_TIEn(priv->dcfg->type, cp->idx));
> 
> Since this clears the enable bit, doesn't it actually mask the interrupt
> rather than unmask it? The code implementation seems structurally correct
> to prevent continuous firing until the threaded handler can process the
> completion, but the commit message appears reversed.

Yeah. It masks the event rather that the interrupt.

> > diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> > index 246a9a9e39520..2809965677bd7 100644
> > --- a/drivers/mailbox/imx-mailbox.c
> > +++ b/drivers/mailbox/imx-mailbox.c
> [ ... ]
> > @@ -508,11 +509,34 @@ static void imx_mu_txdb_work(struct work_struct *t)
> >  	mbox_chan_txdone(cp->chan, 0);
> >  }
> >  
> > +static irqreturn_t imx_mu_isr_th(int irq, void *p)
> > +{
> > +	struct mbox_chan *chan = p;
> > +	struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
> > +	struct imx_mu_con_priv *cp = chan->con_priv;
> > +
> > +	if (!cp->pending)
> > +		return IRQ_NONE;
> > +
> > +	switch (cp->type) {
> > +	case IMX_MU_TYPE_TX:
> > +		cp->pending = 0;
> > +		mbox_chan_txdone(chan, 0);
> 
> [Severity: High]
> This is a pre-existing issue, but can this lead to an interrupt storm
> during channel teardown?
> 
> When a client frees a mailbox channel, mbox_free_channel() first calls
> the driver's shutdown() callback before calling mbox_clean_and_put_channel()
> which aborts queued messages.
> 
> If imx_mu_shutdown() calls free_irq(), it synchronizes with the pending
> threaded handler. The threaded handler then runs to completion while
> shutdown() is blocked, calling mbox_chan_txdone():
> 
> imx_mu_isr_th()
>   mbox_chan_txdone()
>     tx_tick()
>       msg_submit()
>         imx_mu_send_data()
> 
> Because the queues haven't been aborted yet, the core will immediately
> submit the next queued message, and imx_mu_send_data() will re-enable
> the hardware interrupt.
> 
> After the threaded handler finishes, free_irq() completes and unregisters
> the IRQ action. Since the hardware interrupt was just re-enabled, won't
> the hardware assert the interrupt again, resulting in an unhandled
> interrupt storm that permanently disables the shared IRQ line?

Right. It should reverse the startup order and first free_irq() and then
unmask the event.

Sebastian
