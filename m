Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD26E2BD00C;
	Wed,  3 Jun 2026 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498853; cv=none; b=SE6sYLoAr2umik78E8+/xsKFMZRllwk7GDhJi6Vhl5UqlHW5UYh2gu97ULlOR/fzi67n/wtvahxWuRI6R3IdUu0yfvnnqHpgxFmdQ7q2Gcvg6lZuQHbYcE5P1VU+VPvdxHPvK2Oc9SqgPcDKz2ErJXiSvjBA9p4NseRKi2a2cdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498853; c=relaxed/simple;
	bh=2RBPOzbS9koFQBKyYB7jA89Z88Bc7vV0S1C+CcjZAjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fljXHEYxejswxEEg4bMHKWNFfwj9FTrHuNTTB94chHSwrlW8x2Qx7H4SmXQmZMsng6VLaxEq7KV0JNupT4IgSARkIl+8n8Fu/EMfqgpmiD8HfLvS50kP6kOTQuGCMHVp0sErFEpjvrnWcXSEOSYkjaCG0iJcTp/mp4PUlwKNBOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jWdVvzPZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lY2D0V/+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jWdVvzPZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lY2D0V/+"
Date: Wed, 3 Jun 2026 17:00:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780498851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dkaV0rsi/vwdmoYLar6/1VFQLTpvJhNsCGdv07lgoqQ=;
	b=jWdVvzPZpzXH8K8rhzjm933kwzbyeful3WoxKobMkaPObHTv48GuP8AhH6D4QjUImXA6Sq
	gavxHx4GQvBCg/FUDn04VeFtgTX3pGWJ59iKjoxidCh+W0BGx2H9UsSN6bQfg3jIwSwNZ0
	x9SKjgl1lLQBn52Mf1A+R7mhyzFlTaZdC+0JuHyVUVo5I2vP8eXAFTyIQpO/jMF+hSLlUZ
	NQkUA0ezjvxZSu2jYtEKL7JScAnOS5ADfYZ60J8MYk7zO2idnps6kkr0eBruMu5ZWtADZd
	EGxohykfjRvK+jj6pIpvsoMkH2s2Y5rG5GaV8S4ITFpAk84PABSZ/NLZMV6Uhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780498851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dkaV0rsi/vwdmoYLar6/1VFQLTpvJhNsCGdv07lgoqQ=;
	b=lY2D0V/+CGxTkYTQ2/UnXp/KNP9Q7dEKHUTJqzFa/QmjuIvHvcJ2y4dPUKW0wShoWd/DwO
	QR8vPjsdi+sLgPBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 2/9] mailbox: imx: Use devm_pm_runtime_enable()
Message-ID: <20260603150050.o-hNVYFQ@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-2-a0059dc3b69a@linutronix.de>
 <20260603132756.69F4A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603132756.69F4A1F00893@smtp.kernel.org>

On 2026-06-03 13:27:55 [+0000], sashiko-bot@kernel.org wrote:
> > diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> > --- a/drivers/mailbox/imx-mailbox.c
> > +++ b/drivers/mailbox/imx-mailbox.c
> [ ... ]
> > @@ -965,28 +965,28 @@ static int imx_mu_probe(struct platform_device *pdev)
> [ ... ]
> >  	ret = pm_runtime_put_sync(dev);
> >  	if (ret < 0)
> > -		goto disable_runtime_pm;
> > +		goto disable_clk;
> >  
> >  	clk_disable_unprepare(priv->clk);
> >  
> > +	ret = devm_mbox_controller_register(dev, &priv->mbox);
> > +	if (ret)
> > +		goto disable_clk;
> 
> [Severity: High]
> Does this error path cause a double clock disable?
> 
> If devm_mbox_controller_register() fails here, the code jumps to the
> disable_clk label. However, clk_disable_unprepare(priv->clk) has already
> been called just above this registration attempt. This means the error path
> will disable the clock a second time, which could cause a reference count
> underflow and potentially disable shared clocks.

Indeed it does.

Sebastian
