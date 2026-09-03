Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AA9443AB4
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 11:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433886; cv=none; b=aY6mudGf6niK2Dasa7R9YbABEAY3TL45ycJaZEALg0W8vQq5NAZMePL5cfM8pBlPatk8PRtxb7K/er15njgK4/8Wm7R0RKjNLM6E63wLMWfMdXjLZguq2gCmpMft6jC0Hm5NHEw/uy0zd/tZMIQIT6hpM8QI8bMwXQb3sI9SxcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433886; c=relaxed/simple;
	bh=pcM2PW3sEaySd35PnKO6K0MrOzG5iUGvi8JIi2M0RGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/6oRA8muIMMT/NbfGvwutqMn3ldbTe2MjhYG1G9IvGF+42WEMrpiMVA9vZk6Z0pnaXJP6s1OoJsUPv8wxO9NiO1IFyeXvpGkelLa6fJvQUryBW4aqS/FEmrQgh8B0GkZlpaab+iDyzzlnTrt6SLGPY6E5d514AJi7py35EaxQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Qqh+KkE1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OHf4spSO; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Qqh+KkE1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OHf4spSO"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BFA387A0038;
	Thu,  3 Sep 2026 07:11:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Thu, 03 Sep 2026 07:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788433883;
	 x=1788520283; bh=KMu2Cz6fbNMKBj4yzwYFgm18OJUOPNan0SdRrspDzNw=; b=
	Qqh+KkE1VM+NmEkoS6tYEoriatmpvEA8XbM5a8WQgobyXJW9sHo4Z1H+TaI4cnvh
	dCiP1IaQZ0/IN+PsHAVWi4z5jS7DQIW4oQdAIgSuIgtTD5QgZT0uL/HY63lNwRQl
	KMnLf9lynNadjbr3l7EHKvSgOLtxg2lDCn5JrmIBoK9l6vZWDBUTs8RWgzSC+MBg
	HBJfr3DJAfgZz+y6xK6ajhIVtl/892UQQnEl3t+HXGptoVwtiO1HI/a9RsEFd70U
	XLL7q0evHQ1OnvEp+PMIZUEqFHfzsEvOe+qTTd2IJXMzLyerk6L6aYK/JdNeNwbb
	6hbzM3aQ3jXxzvK6e/ZA+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788433883; x=
	1788520283; bh=KMu2Cz6fbNMKBj4yzwYFgm18OJUOPNan0SdRrspDzNw=; b=O
	Hf4spSO8sJH4t1mktT6jAT12F6+ELcR9VtbpEsAwEAxexih4mp0JWVgs62E2ECUX
	p8xyy3lbDyiO6YLKQRTVLyIoWh0clUmz4HR0mWByy2Whk69TzNYZaijcsHe7LLeC
	m3kpOXFPb7LRMeJ8dlGlp/vlQBzlJUUom+0tfUMCuFlwhAEPzBcjNm8919tYM17G
	q3qy2ARmXy3T/HdEDlYtBMXh/qR/O3rAoBLcJythWwt5S9A4G68fn1lN8lDDwLte
	cAskz4dmHdsftSUswcyoGTYLvhwvJWbOWEKxYBQy4XOAzKmtGoDjSvCjl3xNY8Js
	vxXd61CiPY7v+dope+MrQ==
X-ME-Sender: <xms:21WZalSJCeYB9QSDNw-QpRNHGpwXGPca5m15K6fQjZowlvIGvE_bdA>
    <xme:21WZar6t9im6hFw3Y3UYtdSqPPYidDDxAfqAhpik6fBc_bXojPCSLWAvtT4B6yYHA
    DbH-73gwB0HXk8xAG5vwOaT-Kxf1h4GtcLDqHcVc_mgnA0ZSR2AI4wj>
X-ME-Received: <xmr:21WZap0HRXHg-oPWQx3niZnEBzzOoK6OO7y3FGWSmoS0EI-3TGmFtci3x0_RwItDorzmRHhDkeQokadlunHcxC5pPV6ypjs>
X-ME-Proxy-Cause: dmFkZTFk1Ml/d9L1Z48Pp2GKA5ywPjiyyAIu/++q52mC/HDhV9zC8pF9HEAwgxFDOlkJGz
    Vs+WwzEiVLmk7mqgn60jwnVvxkvtzPzObEbX6GgerHb5ZoerTkL8ik9iMJQFErq0nUCPhE
    tzr35xb8Q9HPcuwBUeVALlTd4o4cQOwRXyQzi1UrG8Tk5bCccsJYPGzuEPJG4mNHgA5DKp
    a0MBYaX9p439biTTRmlGac6JFBHfAUptCuOwIHdj8n5JpNEBZ9uJrRhjehZlj1uqvBVFWR
    RtBbBcxuzgsCCBV7vF5ZiahFEu3LTrlzVLFORgxYvVfQ9UBrZ33JoDgdvicwAGHM58w2gO
    HxcnxPeWWHp8RgrA4UTmSptM8DRTLFSrwY1ZakfUY9GCPwNWQyVB6Vf8V9nhhtwFZl840M
    FJF1tnzEqXEAluJ2mEdZqR3nhE/Ap4qju2gCoLbS7INjwzizTFZ7xsuZX2m6pxuBeNnHyb
    sJgWJE1zYM4xGVW1UmeeyNqZNtpmQs11Ct8m9k5Sdjk4GWMm20FmlfYHUwlJs/q59IHNua
    kGRqLduRExVYKoOf5YI6hCN88FgjzbMbnYkdouxC9/bNCdAz8gx0E4DQ+HsejIzv5J2Cz9
    FYth2PrK8cR2HsHcdT4ptmLsifpboRVOLNPG5l0IJStnWkPJB6YJAtUP3mlw
X-ME-Proxy: <xmx:21WZauCTMMCVsaisk1h7jffW-dp2Y_kd0IvedLl0du4B4IM4tHgj2g>
    <xmx:21WZasN3ewM7VnVViKO4pkOW9IoVnN1aZeIuHwaL8ZSOca-PpNdsig>
    <xmx:21WZaraKsjObUzzA3yRVnQBI2PsK8ZenZs9s_89pg2KEzVt4MwRvCA>
    <xmx:21WZajsDWgNo15DVqqr0-LvPSx9SkKOm95uwjpGyaiIQTQNRkQOuGw>
    <xmx:21WZaqdzY84JZj2j4xRKYsD38TWDtScvS5YKgQi7SxP5LwRBzaAUai0v>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Sep 2026 07:11:22 -0400 (EDT)
Date: Thu, 3 Sep 2026 13:11:20 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH net-next v3 01/10] net: ethernet: ravb: Remove gPTP
 control from WoL setup and restore
Message-ID: <20260903111120.GE1116206@ragnatech.se>
References: <20260902084703.3228504-1-niklas.soderlund+renesas@ragnatech.se>
 <20260902084703.3228504-2-niklas.soderlund+renesas@ragnatech.se>
 <20260903084755.F15D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903084755.F15D91F000E9@smtp.kernel.org>

On 2026-09-03 08:47:55 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The patch erroneously removes `ravb_ptp_stop()` from `ravb_wol_setup()`, leaving the gPTP hardware active during a WoL-enabled suspend.

This is a non-issue as the module clock is the same, ignore.

> --
> 
> commit bbd624fcad5eb4869638d985be16666aae0f0ca2
> Author: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> net: ethernet: ravb: Remove gPTP control from WoL setup and restore
> 
> This commit removes explicit gPTP stop/init calls from the Wake-on-LAN setup
> and restore paths. The commit message states this is redundant as the device
> is always closed and re-opened during suspend and resume.
> 
> > net: ethernet: ravb: Remove gPTP control from WoL setup and restore
> > 
> > Since commit a6a85ba36fd0 ("net: ravb: Move PTP initialization in the
> > driver's ndo_open API for ccc_gac platorms") the gPTP clock (if
> > supported) is stopped and started by opening and closing the ndev.
> > 
> > This makes the special case to stop and start it when resuming from WoL
> > redundant. As the ndev will always be closed and re-opened when
> > suspending and resuming the system.
> 
> [Severity: High]
> Is this description accurate when Wake-on-LAN is enabled?
> 
> Looking at ravb_suspend() in drivers/net/ethernet/renesas/ravb_main.c,
> ravb_close() is explicitly bypassed when wol_enabled is true:
> 
> 	if (priv->wol_enabled) {
> 		ret = ravb_wol_setup(ndev);
> 		rtnl_unlock();
> 		return ret;
> 	}
> 
> 	ret = ravb_close(ndev);
> 
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>
> >
> > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> > index ea1c7e536791e..36173a09e2fdb 100644
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -3182,9 +3182,6 @@ static int ravb_wol_setup(struct net_device *ndev)
> >  	/* Enable MagicPacket */
> >  	ravb_modify(ndev, ECMR, ECMR_MPDE, ECMR_MPDE);
> >  
> > -	if (priv->info->ccc_gac)
> > -		ravb_ptp_stop(ndev);
> > -
> >  	return enable_irq_wake(priv->emac_irq);
> >  }
> 
> [Severity: High]
> Since ravb_close() is not called during a WoL-enabled suspend, doesn't removing
> ravb_ptp_stop() here leave the gPTP hardware active during suspend?
> 
> >  
> > @@ -3204,9 +3201,6 @@ static int ravb_wol_restore(struct net_device *ndev)
> >  	if (error)
> >  		return error;
> >  
> > -	if (priv->info->ccc_gac)
> > -		ravb_ptp_init(ndev, priv->pdev);
> > -
> >  	if (info->nc_queues)
> >  		napi_enable(&priv->napi[RAVB_NC]);
> >  	napi_enable(&priv->napi[RAVB_BE]);
> 
> [Severity: High]
> If the PTP clock remains active during suspend, won't it be abruptly torn down
> by the ravb_close(ndev) call that occurs later in this ravb_wol_restore()
> function?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260902084703.3228504-1-niklas.soderlund+renesas@ragnatech.se?part=1

-- 
Kind Regards,
Niklas Söderlund
