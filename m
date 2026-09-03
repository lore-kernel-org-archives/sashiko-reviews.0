Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0778C45A2B0
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435315; cv=none; b=boS/GnOVMfKsxOZ6u5SQ6mx1T+Rpio9vUKvf7PCHNqUEzqTIuFkARtWgz8cugr0wtQzMwlrziFgsNgHwbQX52PffstXUGHAIlIRqOAmRBprwNIG6QliwSkNUmXuFdcQIemoUW8ukUN9B2dz3Xsq612cWh5OHJqkUDV6POj21z2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435315; c=relaxed/simple;
	bh=NGptUwcJ9YaoaaK1oVYiQFRPd89L8fb1l+TMWUzFkFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtNM+lRMPQ3SYOlq0Q8deKMI2wOj8wW17dAtf9Ep6kBfau7gNqqQrqkh88oRq0pykmeNGjOS4o5YSgceGDZ6Qn1SfB+M6OzC4WWyaPmg4K8d67E/zlW2eTFECMddsf4cJvD+gGENYdkYsQ5I91zodM+MV1e4nAa8PeTeTT34CYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XrgGrKZZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eaRqq12m; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XrgGrKZZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eaRqq12m"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 0D8E81D0005E;
	Thu,  3 Sep 2026 07:35:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 03 Sep 2026 07:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788435305;
	 x=1788521705; bh=u0mblghGQtHLWAPFrP9rKAzs8qdKPqtFUAlB+mIj8kM=; b=
	XrgGrKZZVwKqQwAMVPMSMcugZgBTkfooSz+vvsTB620GPQhiEocOlpUsfqjvosPE
	QF9uGhkiIi+/RtBm6EBxAqlDtYRumxXpt1pnwafdacVFBI4RDfxerAEXXceos1ot
	WEHEp+FPn6ULnuZw/zCXq7S34MgNXGUEsQ8b0YpWd5LCRTyw1g3ZeJsjG+SoHfP/
	mNAuZ03jXVFFVsi8BuQzWss5E6E2cYoiiDM6WTsFqJVCIeB+stwiuN9M09Wovay0
	9SN7r2KSY1rgrU/ax3VzB5jRzTQXHkmM16uW9yf+BiUjANA04i6dETIvPzLRCgTY
	shclRQA9VLYr8YXXGrXfvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788435305; x=
	1788521705; bh=u0mblghGQtHLWAPFrP9rKAzs8qdKPqtFUAlB+mIj8kM=; b=e
	aRqq12mkpWt42XeTzeOYdhUYLF50vZT/uHBmg51eeRtFG8/fcxxHVBEUslvf29s4
	tDsWomQkaVMyyi/2DSW/lWGV7TM22Z88/bFwFSNECjYci4wKk3owZR4mrJCexj7H
	bOcDuNbsMSAhSjVSYlQrKnQ0S45ho0qNLjXbDG6/7dRrghmSZaAL/+rEyZF58FK7
	XTuU1wmUGEQfu7kcbyafNSZv8ZJSBPmLgYgyqr9qCYwG5/4vWLecgzwEfcHQcBLD
	ilOCyhwJxYHwYibby+L9rj04Z3DQ0DAiElTzxoBMBo2clQ7sfbx8Dx/vJ/Huztix
	JfY7Wjgpofrddf16gyUvQ==
X-ME-Sender: <xms:aVuZapDhIbsQdHGBiDIg1Kdu2T6u6p4k2wqUq5SVYcDGfc2W6gNHBw>
    <xme:aVuZapCUdXSTHABQvR3kxgRcbrGNjWpnG4kgqli-fh7kr0y7VDnlscQbeFn0b5ekX
    N4bWuZ1stxZStHk61uz_wRICrkRr1bHALsDNTMH1Eh6_7Xl5CrFwg>
X-ME-Received: <xmr:aVuZakpeX0NxnGlybTNuJPMmInkJChG_yICYhsulse6Zay5htAtIJioon5x-v_kjjze-ARNdIGAEUYbJNPkGwRI-kDxbGy0>
X-ME-Proxy-Cause: dmFkZTEOt2dobKc6a+FPujfxNny6P/u2SzZlwD73nlUtle7hpaHDXyTL1A4EnxdKjszWZ3
    M2xYjj+mXdi+pU7zlfFHj7L9ZPUj0w+XX+GrwBoPqLq7duCGJUcVWD/Alh7ue24rNCWajO
    W11H7citPbhYh8T8JX6FICy+XksavtEMDB/p4B2YRjJPnVA81hAqO+Ri41gPWaXRoHm6Bg
    9A5RjCc/Tjf+824CznFaarMB48DYNGktIbK6p7z+gQPWq8BZ4hbXfj23AdKGj6dCol4zv9
    D0LpmM0PTiUfUiwm+0F7qqDZueOqAHKyaKmTPN91c9AoKQ4WBjZC9JYFpJH9UhGM9subkp
    x0KvZRpbXkrn84wGtRAxp19PwcTbcyjUAamo7vc4GMB3o5oXpXi0W0TNTjHS+famSGRM/w
    FzrHLgAwOCKQREngqjAk0YoPcXBAnnPl/Dn8xBQYqdkBB95YxKNCMTlIuFzIvWN8yyE8yn
    w1Uz6+C3p+OEUmYBumrrOMZoK0PwscX0n/hy7pZ63hgo9Gx/EN3El9kEhkDcrxgnZFf0cJ
    MKq9N7TxGii8cSGHwbZ4/D0CFvYShdISayIXvtbZzkuLmDc/cZspQ1p71/IDUYsHQXqamh
    RemnGoCn8XM5cWDOVjYASvj/2YY5zQvdsojLY/s7hxpTxGS4avBwpcn4tXyA
X-ME-Proxy: <xmx:aVuZajn7hXoNFh-4dm4cl26MExUaoN91skAvn12O4v0KU-fnDcodyg>
    <xmx:aVuZakx1hucIIdz1VAXJsbCU5XEtwRbPfeV1hPOD8WqIMeedUKphFg>
    <xmx:aVuZar96I2OqPK2RnEXmW8NGYfG4xMLtjExZN_nz3zSzadnSPhrmsQ>
    <xmx:aVuZagI4OimgltvZW7l1CJfGMKrQCfFG50viHuhW7ouX71rWMTNwYg>
    <xmx:aVuZanzFYvT2-x0rzQQPIP-k4tD9zFWkcMuGhJB7hJg8mJKfIg7tlGwG>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Sep 2026 07:35:05 -0400 (EDT)
Date: Thu, 3 Sep 2026 13:35:03 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com,
	conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next v3 05/10] net: ethernet: ravb: Propagate error
 from ptp_clock_register()
Message-ID: <20260903113503.GF1116206@ragnatech.se>
References: <20260902084703.3228504-1-niklas.soderlund+renesas@ragnatech.se>
 <20260902084703.3228504-6-niklas.soderlund+renesas@ragnatech.se>
 <20260903084755.2791D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903084755.2791D1F00A3A@smtp.kernel.org>

On 2026-09-03 08:47:54 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] Calling `ptp_clock_index()` with a NULL pointer causes a deterministic kernel panic when querying ethtool timestamp info.
> - [Critical] Failing to clear `priv->ptp.clock` in `ravb_ptp_stop()` leaves a dangling pointer, leading to a Use-After-Free during ethtool queries.
> --
> 
> commit 8ab377468104948ff315e1ab381238bac1a1783e
> Author: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> net: ethernet: ravb: Propagate error from ptp_clock_register()
> 
> If the PTP clock registration failed the error is silently ignored.
> Before reworking all callers of ravb_ptp_init() handle and propagate the
> error so it can be used.
> 
> Link: https://sashiko.dev/#/patchset/20260610102432.3538432-2-niklas.soderlund+renesas@ragnatech.se?part=1
> 
> > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> > index e44d065f77cc8..7c7b3ac81e5d6 100644
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -1785,7 +1785,7 @@ static int ravb_get_ts_info(struct net_device *ndev,
> >  			(1 << HWTSTAMP_FILTER_NONE) |
> >  			(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
> >  			(1 << HWTSTAMP_FILTER_ALL);
> > -		info->phc_index = READ_ONCE(priv->ptp.phc_index);
> > +		info->phc_index = ptp_clock_index(priv->ptp.clock);
> 
> [Severity: Critical]
> Can this code trigger a NULL pointer dereference if priv->ptp.clock is NULL?
> 
> If the interface is not brought up yet, or if PTP registration failed during
> initialization, priv->ptp.clock will be NULL. When querying ethtool for
> timestamping information, ravb_get_ts_info() invokes
> ptp_clock_index(priv->ptp.clock).
> 
> Since ptp_clock_index() unconditionally dereferences the pointer, it seems
> this could result in a crash.

Please check patch 9 in this series. The change is an effect of the LLM 
driven fix merged a head of this series with tried to correct this issue 
in a way to complicated way by using the READ_ONCE and caching the 
value...

> 
> >  	}
> >  
> >  	return 0;
> 
> [ ... ]
> 
> > diff --git a/drivers/net/ethernet/renesas/ravb_ptp.c b/drivers/net/ethernet/renesas/ravb_ptp.c
> > index f70b616ac847c..19d039b9d24a5 100644
> > --- a/drivers/net/ethernet/renesas/ravb_ptp.c
> > +++ b/drivers/net/ethernet/renesas/ravb_ptp.c
> [ ... ]
> > @@ -369,14 +368,10 @@ static void ravb_ptp_sync_irqs(struct net_device *ndev)
> >  void ravb_ptp_stop(struct net_device *ndev)
> >  {
> >  	struct ravb_private *priv = netdev_priv(ndev);
> > -	struct ptp_clock *clock;
> > -
> > -	WRITE_ONCE(priv->ptp.phc_index, -1);
> > -	clock = xchg(&priv->ptp.clock, NULL);
> >  
> >  	ravb_ptp_disable(ndev);
> >  	ravb_ptp_sync_irqs(ndev);
> >  
> > -	if (clock)
> > -		ptp_clock_unregister(clock);
> > +	if (priv->ptp.clock)
> > +		ptp_clock_unregister(priv->ptp.clock);
> 
> [Severity: Critical]
> Does this leave priv->ptp.clock as a dangling pointer?
> 
> The original code used xchg() to set priv->ptp.clock to NULL before
> unregistering it. With this change, when the interface is brought down,
> ravb_ptp_stop() unregisters and frees the PTP clock but leaves the pointer
> pointing to freed memory.
> 
> If an unprivileged user or system daemon queries ethtool while the interface
> is down, ravb_get_ts_info() will pass this dangling pointer to
> ptp_clock_index(), potentially causing a use-after-free read. Should
> priv->ptp.clock be explicitly set to NULL here?
> 
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260902084703.3228504-1-niklas.soderlund+renesas@ragnatech.se?part=5

-- 
Kind Regards,
Niklas Söderlund
