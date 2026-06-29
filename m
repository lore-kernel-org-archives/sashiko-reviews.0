Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA6D44E055
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751737; cv=none; b=bQm1lkJNphojfoKmgsbQ4fNz/1H6aKH1QidDHV7TsuUq91UwONctUjfndiC6h3Togt5wUcs7jjAvZ2RLR6FmEDmlolCZ11dC7BVoo8nq51af4sHHsq14f4oyRLhcnCS9QAY2c7S0qwIEKg2zv+WOyZrsdNAq3u2hzc5JlRr5k3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751737; c=relaxed/simple;
	bh=tIJyBGZ2q4FwbauSh0ZfalSr9/cdSQ6gyYT+s3/WKEg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tOklKT61CmNAhxsxlBP9G80XB+XiSo8MYG/+Bopde/xiigpZYF8GrY341XUjByZsD6/BgLC3/4d4RPk0txzH3Wah2Is8czdBtZwM3sH7hrhg2W+KqRJq5QU+rFVc+mHa79/RYSPZCIRgE3yDJoHxfQMPCQanPyVI2B7KdwzHfKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=8Xume4yW; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="8Xume4yW"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1weFAD-0000000FdO3-3HVC
	for sashiko-reviews@lists.linux.dev;
	Mon, 29 Jun 2026 18:48:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=7htlJ/iqKAhb3sxtbY07IJU41mzqAd4NW5lkYsgilx4=; t=1782751733; x=1783961333; 
	b=8Xume4yWgo1ajPoJfBgaynNKy5fcBZGLGK48GHC7K87+FA5aTRNKFL7jYgimWeLt1rOwzwY1j3s
	4jRxsFFh6ZcI45JnpZgEUTQo3Ugc+kWuYlp9JWILPyGDu9K7ArNjHLKUd+Kmm2YQ1wXM0YfyR/9ES
	eWDu1IErDBDHm3TP6k9Cu5+MHGM2PvScyfbPDkRGp6WchIVC0J1T4BicJ5O/QAeQQv5H4p/r/Rvxa
	FyqmUMs/VppY5T+r9K8z6NDWOPKKpJ6PHn4gnIH5xEnOxnE4PrMlUKURsHuKI3ifTM1JiNDbZg3t8
	auVXNJ33b5O0mD6unxGSXT8Q8RCl2uT8wwug==;
Date: Mon, 29 Jun 2026 18:48:37 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4] drm/omap: dsi: avoid sending bta sync all the time
 in writes
Message-ID: <20260629184837.7ffdec12@kemnade.info>
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

> > @@ -3268,13 +3263,13 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
> >  	DSSDBG("dsi_update_channel: %d", vc);
> >  
> >  	/*
> > -	 * Send NOP between the frames. If we don't send something here, the
> > +	 * Transition to LP here. If we don't send something here, the
> >  	 * updates stop working. This is probably related to DSI spec stating
> >  	 * that the DSI host should transition to LP at least once per frame.
> >  	 */
> > -	r = _dsi_send_nop(dsi, VC_CMD, dsi->dsidev->channel);
> > +	r = dsi_vc_send_bta_sync(dssdev, vc);  
> 
> [Severity: Medium]
> Will this break command-mode panels?
> 
this was introduced to fix command mode panels in v2 and confirmed to do that.

> The original code explicitly sent a DCS NOP on VC_CMD (which is typically
> configured for Low Power/CPU). This replaces it with a BTA sync on the vc
> passed to the function, which is usually VC_VIDEO (configured as High
> Speed/Video Port).
>
original code indirectly also has sent a bta sync.
 
> Is a BTA sync on a Video Port channel valid hardware behavior here? Also,
> will panels that depend on receiving the DCS NOP payload to transition to
> LP mode stop updating?

The NOP packet (with the bta sync) was solely introduced to transition
to LP mode. It was confirmed that updating works with just the BTA sync.

Regards,
Andreas
