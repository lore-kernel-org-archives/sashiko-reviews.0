Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9FF38839D
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 10:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781259042; cv=none; b=g3LL36lthAfhhxt2vCPdO/JMsSdgCXV/0yKYCw2XcZwdc8/dh2eOfNjnUA1JKWBmdpGgj6iNhaLhNGFIbBxUZYMSBND4ibVj1Jjo56XEuaWy/3oFpKxTVb+DkHKYDLhvdu8JNluJSwlgZyiOgdOeDYEv9pY6RRVQgRIJRiDPqrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781259042; c=relaxed/simple;
	bh=VfOBVwW66cmgqEpPpdTVfIk63d6iMSbC90a3mU+fYhI=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PI2c6fvpiykcN+T+vtLclm26kOCr+95DCjZl6JLLVaKHuAJ3Xhn6dsYdu3DoGb9PIbEupBvr2kQ7RnqVokmIJ9iVe2P3PKRQ/SlLtOAiHYHAUJ/ZeQCkdOMxVz8s94c/C0k71qXaTnjFvF691BP1TPOO5S4JnuRMxMxXp+V/ai8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+wijumF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+wijumF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so1173165e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781259039; x=1781863839; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C9wZyoU1v8zpuY6BFJ/ACEsATO/OwOtgF75ffj8qI+Q=;
        b=d+wijumFKvv3EL1ddL4octJq9HerlcIbpBKuNdVc46P4uToEDSagCFRfnUnIaXtFf6
         AkV13gjn1CdPR1rRsh00obe1Rl+3XYFmurTEd43D2kPTzxnk0ATYg+k+raBnIN805jqK
         YVBMViiWPIbKZF48Q36MGfASHUgDTSUwUi0kjaj0FbwN5yOgyeHTZCg9ZRgaxZhnxpR5
         RN6OCaMqgKg+fN9ZWICyyknx4Mm8EGBk0d8b/sH+eueiJiB83GXb1Uzmxndm+jGS8zsO
         qEXxyKDVj8/+pw+Xe8DwA8F/0LT9Wukxn+HimJN2nnjUVd8fr9uliwss3z2B04/IeAFv
         gdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781259039; x=1781863839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C9wZyoU1v8zpuY6BFJ/ACEsATO/OwOtgF75ffj8qI+Q=;
        b=p8bhBL5Ov4JubDlETUkCjmLooZRF2NDkSiuA6fIQWgXblCXgjPDCnMbKZpxmpIF+3i
         E9B3ikdD0Lx5s8LAf8buFuN8eHsZirTfW08nk/RmDxbSQGGTRQ3c98H3PANSs5Wnj89e
         5GbFgMwuastBfl0AdXO6y23PcfOK0lGRVXQE7hJdhthoDYPhXKT3+gVvZwILrLtZ/BBt
         s2CIy+/Qu6ZQvXUrnjShqMQgFPykrGIvRV+99hF9/HH1SYGLVvxx64gLbHkJQ/HQzx9t
         Kyg5tl1a+PX+dx0eRFd15MTC9/r9YU33rmOh8M/A8SK7iNwHvnRQng/mHF8mB3Rzbtc6
         SYKQ==
X-Gm-Message-State: AOJu0Yxpb5b1jmby7FT1LeGg56gm6A375wM0mAgWHfniitp7FFsbVqNG
	30qlmbQqNaVUBH8uuJTVFNiUJMr30jkwt4nIGJMqTU/w5XXeJizGRlDNHN2dyw==
X-Gm-Gg: Acq92OH2VB0jOwEwyABjYh+zDowm2kQSUCg46zbGBP7n3zZ9d+Dqxczn7IxRfUpMiRv
	lEYkGewcgldlLzIL5v8I/bLJ1yHSNpplsIAbxp3WFb16Gyil8x7w4rwYivdDjhoTrVZqzfRCw+9
	M3nmJndQI2WxvQZBCVPsAqW24Y8OECVZQbPr893DUvILf/5Ngw8BaOUVjS9GYKL7/p1gxCaDpvY
	3VQqXIO7dNh3Tk3U3AVx2iO4DcrNMhI0bKSPtPA/9R7qMth+FWVIr3TQqg6kdxe/9yK05vIOnrC
	uJys48nYvz+lGKQCZB3G4ro9ARf9nVu3zXRmtb6pRjkbugaKx7pp3qYgEoz1I19/pR8j1X2QD9u
	kmlBu986AS2zCNA6pMoN296ToRt3YXgEhMQZMemMJhwzPcxfjQ7EihUXgl+lc731t7HzeoSWPQQ
	kn8HYUon6CiItD+6jyly2d5w==
X-Received: by 2002:a05:600c:3b16:b0:491:e3be:1363 with SMTP id 5b1f17b1804b1-491e3be13b3mr3289185e9.0.1781259038325;
        Fri, 12 Jun 2026 03:10:38 -0700 (PDT)
Received: from Ansuel-XPS. ([176.200.123.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea83d8dasm70261225e9.11.2026.06.12.03.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:10:37 -0700 (PDT)
Message-ID: <6a2bdb1d.dc59d6a3.e1f11.8388@mx.google.com>
X-Google-Original-Message-ID: <aivbG2gNq60N68uc@Ansuel-XPS.>
Date: Fri, 12 Jun 2026 12:10:35 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next v6 01/12] net: phylink: keep and use MAC
 supported_interfaces in phylink struct
References: <20260609151212.29469-2-ansuelsmth@gmail.com>
 <20260610161620.99C121F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610161620.99C121F00893@smtp.kernel.org>

On Wed, Jun 10, 2026 at 04:16:20PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Late modification to `config->supported_interfaces` by drivers is silently ignored due to by-value copying in `phylink_create()`, breaking support for devices like MTK GMAC2.
> --
> 
> commit eaea53b185dbdc4c75406c542c97543c4c451c9d
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> net: phylink: keep and use MAC supported_interfaces in phylink struct
> 
> This patch copies supported_interfaces from phylink_config into the phylink
> structure to prepare for internal PCS handling. The internal copy is then
> used in place of the config structure's bitmap.
> 
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index 087ac63f9193d..4d59c0dd78dbf 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> [ ... ]
> > @@ -1868,6 +1873,9 @@ struct phylink *phylink_create(struct phylink_config *config,
> >  	mutex_init(&pl->state_mutex);
> >  	INIT_WORK(&pl->resolve, phylink_resolve);
> >  
> > +	phy_interface_copy(pl->supported_interfaces,
> > +			   config->supported_interfaces);
> > +
> 
> [Severity: High]
> Will this by-value copy break drivers that modify supported_interfaces after
> calling phylink_create()?
> 
> For example, looking at the mtk_eth_soc driver in mtk_add_mac(), the
> supported_interfaces bitmap is modified after phylink_create() returns:
> 
> drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_add_mac() {
>         ...
>         mac->phylink = phylink_create(&mac->phylink_config, ...);
>         ...
>         if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_2P5GPHY) &&
>             id == MTK_GMAC2_ID)
>                 __set_bit(PHY_INTERFACE_MODE_INTERNAL,
>                           mac->phylink_config.supported_interfaces);
>         ...
> }
> 
> Since phylink_create() has already taken a snapshot of the interfaces,
> this late addition of PHY_INTERFACE_MODE_INTERNAL will be dropped. 
> Could this cause phylink_validate() to incorrectly reject the internal PHY
> capability for the MTK GMAC2?
> 
> >  	pl->config = config;
> >  	if (config->type == PHYLINK_NETDEV) {
> >  		pl->netdev = to_net_dev(config->dev);
>

I was with the idea that value of phylink_config should be used only for
phylink_create and then in theory they should not be changed.

Isn't this a bug in MTK code to modify the phylink_config AFTER
phylink_create?

It was never a problem since it's it's INTERNAL interface mode and a PCS is
not needed for it but still I feel this should be fixed and this change
doesn't introduce some kind of regression.
 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260609151212.29469-1-ansuelsmth@gmail.com?part=1

-- 
	Ansuel
