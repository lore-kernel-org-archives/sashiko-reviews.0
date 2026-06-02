Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4291338737E;
	Tue,  2 Jun 2026 12:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402270; cv=none; b=R1JrTh8acwdWEIWM8Ap9BCc2DZ0/mti/kGFKCRBpV3xpQKoo9auNtHKd32wq0KrvjzTQ9sM7xuKT6WEroJa+cRdCNGGfyxmNlz18sJy5IwM8uQtYGJ31RsDii0tDlrHpiW6EWct8G+5KhW9wBGSbMUqxsKkkBMT1KABCv3C0rwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402270; c=relaxed/simple;
	bh=8YnBNZ5lo0jJ/8ZzDTRH3eTyQTuv4V7o7qhEGF+7xNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnBv2eW23dBK54qO/fSKGKqkWG2dSQQjPYHXS98Uk2n7oFarZDD9Kij4MoK6Z+LNJE7pEd1R8FU23AiHLUHW22VlBdj2W69BrbzqrrMVQ+Nw8AsKQTXRYA/1u6+ULabQ9xfK2ZH5rgRd60tK+UqNh6A0RVayQ6f1gcAwIWIUhSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UU9lMTk1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZZz9NigC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UU9lMTk1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZZz9NigC"
Date: Tue, 2 Jun 2026 14:11:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780402267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cyUX5nSI1JO53ZcwcF1oCIU9U+h6EIF90UE97RnD5UA=;
	b=UU9lMTk1hfzECeGpiB/Sl3GMzU02+/5/R88b9bz2fBzW6BphMmbcAx+Edblnn4jVMrzN8N
	rf/YK88EMRF8XaJhKn52zMtWQrfTZPxyGYXtznfeUxNRCKjfotHzfBlasWfKv6+D/Lg0oo
	4/FzXGbk62iorZWSsbwCbp1NmXScDG76O6ucJ96VxPsUZ7SVM8or4hqxUimTdBTxF32bRW
	9Awy8ia36Hhknz0ygYuORezoRlnVUL/oUAK/fHZIo8jtXF7csHWk2VQ9G3uYJr+ZLNCs4t
	LhsVaXj/u69LzHGKcvzZKt+rE2wnVTGl+mdV6P1awK1g6WOgbJlWbmXNsmleYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780402267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cyUX5nSI1JO53ZcwcF1oCIU9U+h6EIF90UE97RnD5UA=;
	b=ZZz9NigCq/ZCxxFRKuZX0FURoZBs1O4awKgldlzDOweN9aeLbwOoqYJqszKeo1bg204eX2
	AChFCu/C9wLXdWAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 5/5] remoteproc: imx_rproc: Invoke the callback directly
Message-ID: <20260602121105.e6hqhBJz@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-5-b8ffc36e11e5@linutronix.de>
 <20260529190854.1680E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529190854.1680E1F00893@smtp.kernel.org>

On 2026-05-29 19:08:53 [+0000], sashiko-bot@kernel.org wrote:
> >  static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
> >  {
> >  	struct rproc *rproc = dev_get_drvdata(cl->dev);
> > -	struct imx_rproc *priv = rproc->priv;
> >  
> > -	queue_work(priv->workqueue, &priv->rproc_work);
> > +	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
> 
> [Severity: High]
> This is a pre-existing issue, but does this idr_for_each() call require
> rcu_read_lock() protection?
> 
> Looking at the call chain, it also performs an idr_find() in
> rproc_vq_interrupt() without rcu_read_lock():
> 
> imx_rproc_rx_callback()
>   -> idr_for_each()
>      -> imx_rproc_notified_idr_cb()
>         -> rproc_vq_interrupt()
>            -> idr_find()
> 
> If a user unbinds the rproc-virtio driver via sysfs concurrently,
> rproc_virtio_remove() calls rproc_free_vring() which executes idr_remove().
> 
> Since idr_for_each() and idr_find() rely on RCU internally to protect radix
> tree nodes, could running this in a preemptible context without
> rcu_read_lock() race with idr_remove() and lead to a use-after-free of the
> IDR nodes or the rvring structure?

If I see this right there is no RCU involved. First the interrupt gets
removed (via free_irq()) which ensures that it is no longer active and
then the channel is removed.

Sebastian
