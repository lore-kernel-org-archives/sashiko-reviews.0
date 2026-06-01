Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D693288C96;
	Mon,  1 Jun 2026 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330554; cv=none; b=IAaCWGwncjBYc3rlpL9otjAVUkvS5vSMCSrw6KhNEEskq+5zjhwZ1XbN10EJ1HlayevOyxcl3BwVOuDmIYTnVQdeAF1crlM+7ys2lByTwSGlI4aXq8q9Rdv9DwL1ByvS+nNssyDYcKne/k19q7t2RhJwzcmWdQMA8KVfGrA2wLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330554; c=relaxed/simple;
	bh=CurCNhMP2+Be1PmyrIRM1kHfcKcNU/zNi1olFRTaW9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqkwI26CmiAIMk4ud/3w83zR/luAhA0yDbNamcY/GeSwxU+gYvZR7WAk94jpZ/fAkHaN+93gs5xKEEpO7E74Pgxj3wrN7FJS1KzYF2EpV2xokerrkyem9M/Ap0aQSObPpkBgt8WlqS7kJ0xRwKL6ZxZkRcaBUR3X85wbhpGCKDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hEyszt/8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Rlp9rWb2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hEyszt/8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Rlp9rWb2"
Date: Mon, 1 Jun 2026 18:15:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780330551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t8W1QthrgiVD4J5KZZLJullxOc1cEJwfGFPq41ttDmA=;
	b=hEyszt/83AHxU7KHGzhW4wO4RvHi3gEVydddA0WostMnIbsoHEVHVFV5wQ0cQjr3i8nyv6
	xfdhj6G7n11cG7VSpgfnukqBDyvXbkBTbr7fdfS9vs0PCa+ZkWfTEhtXkc2/bpsxgVRk14
	lQ6qsrmfJpUQYwv59eEBepKIEeDZO7tA64g36tWIv0Kyv6rlNrI73yXsBzO8VYwRY7S4cH
	JAOTEtdTAoEzF9F5oKvsxnWcLECGMvoTJ5lgisLhBguNNHMq+zOrqNZj+TGym2Ia1iLmlW
	dJNOIlwqX8ocNBpykcrRGzzFHiGTed9pud5yWMEomOdNQbjITSDzXPSVECBnOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780330551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t8W1QthrgiVD4J5KZZLJullxOc1cEJwfGFPq41ttDmA=;
	b=Rlp9rWb2nKHyiE9XtMuqiNpbRvQTgCNupjmZlMgz+c1OFynoUVdi3jZdifRINRo0+dyiTu
	Jn8ZcxRNqu3frBBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH 3/5] mailbox: imx: Move the RXDB part of the mailbox into
 the threaded handler
Message-ID: <20260601161550.IQ76N8-X@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-3-b8ffc36e11e5@linutronix.de>
 <20260529173402.B8DE11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529173402.B8DE11F00893@smtp.kernel.org>

On 2026-05-29 17:34:02 [+0000], sashiko-bot@kernel.org wrote:
> > diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> > --- a/drivers/mailbox/imx-mailbox.c
> > +++ b/drivers/mailbox/imx-mailbox.c
> [ ... ]
> > @@ -528,6 +528,12 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
> >  			imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx), 0);
> >  		return IRQ_HANDLED;
> >  
> > +	case IMX_MU_TYPE_RXDB:
> > +		cp->pending = 0;
> > +		priv->dcfg->rxdb(priv, cp);
> > +		imx_mu_xcr_rmw(priv, IMX_MU_GIER, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx), 0);
> 
> [Severity: High]
> Does this code use the correct bitmask macro for unmasking the RXDB interrupt?
> 
> The IMX_MU_TYPE_RXDB case appears to be using IMX_MU_xCR_RIEn (Receive
> Interrupt Enable) instead of IMX_MU_xCR_GIEn (General Purpose Interrupt
> Enable) to generate the bitmask.
> 
> On non-V2 hardware, these macros target different bit ranges (bits 24-27 for
> RIEn vs bits 28-31 for GIEn). Could this leave the RXDB interrupt permanently
> masked after it fires once, and inadvertently set incorrect bits in the
> control register?

So I copy&pasted the wrong register and the bot noticed it? I am
impressed.

Sebastian
