Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8255C3F7899
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 16:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782752384; cv=none; b=GSD8wNplm9jYSW3FCUT5WtLPYUYo1+3eerMsEy6opUghVNgysDn9JBJ8xh4ZbOlyxgIjWxxeEzxveMnJBSGCTiQblVaBIKHoJl5QtKeE+x0PWNahH4XIYbtTWf9Mt1a0w1s0Xz7HFpx87/BeMbaqrJZrFnJRGNyoDytT6V89Qs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782752384; c=relaxed/simple;
	bh=VxU/JmcOoSuyWrxPs/w+JWyEysO8s82Hp+PgAfGNA20=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LxTi/AZHQLcxw6E6nbimu2hCeubabTUxyryrAFVjNNvyL/sV0PNp8mdxEHgXfJYGrdQpUzK7aUh85CRDEvUTRHLTrFsSFftziyMA1YfwstaynvqS36uRZGrhtzEVYYMUAhPH9H0mKo0js7jYUKu+X5WcU3CbyTYxRSjERd7NlTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Ka5bkiF7; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Ka5bkiF7"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1weFKf-0000000FdQK-24gV
	for sashiko-reviews@lists.linux.dev;
	Mon, 29 Jun 2026 18:59:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=Wl6VBPyNkT9JR6XDXNkycx4Te2988DvHWTjdeEBLZvA=; t=1782752381; x=1783961981; 
	b=Ka5bkiF7A7BiSshhnw9+ZgbKoEB7N0UWGeYx4I/v4u0MlAOPqs1OGTYRLOIYztxPTCL3NIs+wT6
	PdDWq0iZSRMerxxeRIfC2Gm+IrLExwB4CxLkIZtFrT+r7UipdgG8NiUMjQvxBlh4zyAxKDZ4FVxga
	XceLOmmsfKju7Ya2xvqmNUKHFuHS0QhStNFNlvWmt/daPckH+ky/ddW5bj4nr7zFwrBqBX3CzCehk
	UFv6qnBlj1tJWdJh5OyjuTSgu5YJXV6vNjr6eTXRXcVMvxxJqatyihl1D9nw00p2sv3KvyDlstqAC
	Hr6Ema5wSTVp1GfmqFG8v/IYfnwuOyEZVtXQ==;
Date: Mon, 29 Jun 2026 18:59:40 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4] drm/omap: dsi: avoid sending bta sync all the time
 in writes
Message-ID: <20260629185940.283b101d@kemnade.info>
In-Reply-To: <20260629160448.13D001F000E9@smtp.kernel.org>
References: <20260629-vm-upstr-v4-1-9f0c62d8808e@kemnade.info>
	<20260629160448.13D001F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Jun 2026 16:04:47 +0000
sashiko-bot@kernel.org wrote:

> > -	if (r < 0)
> > +	if ((!r) && wait_for_completion_timeout(&completion,
> > +				msecs_to_jiffies(500)) == 0)
> > +		r = -EIO;
> > +
> > +	dsi_unregister_isr_vc(dsi, vc, dsi_completion_handler,
> > +			      &completion, DSI_VC_IRQ_PACKET_SENT);
> > +	if (r)
> >  		return r;  
> 
> [Severity: High]
> Could this lead to a stack use-after-free if the timeout is reached?
> 
> The wait_for_completion_timeout() can return 0 (timeout), after which
> dsi_unregister_isr_vc() unregisters the ISR and the function returns,
> destroying the on-stack completion. 
> 
> However, dsi_unregister_isr_vc() doesn't appear to synchronize with the IRQ
> handler. If the hardware IRQ fires right after the timeout and the handler
> executes from its lockless copy of the ISR table, could it call
> dsi_completion_handler() with a dangling pointer to the destroyed stack
> frame?

There are several places in this file having that problem. So it is not new.
I have sent a fix here:

https://lore.kernel.org/lkml/20260629-dsi-uaf-v1-1-a5e894f4e4d1@kemnade.info/T/#u

Regards,
Andreas
