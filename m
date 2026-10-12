Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D333F8707
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806659; cv=none; b=sWsYrOaW5ZYSdbeCCpDZaFOeuYKvABgY3mkD2/nMu0ypFK6drhUFLrDm16PP6Ht18v4vkih7B6s28R3LjGmIEUu0tMxa5wehvH4lANhm3EArUzxlpJX0KlLq3vi44aMOtU+qya5FUnCemVt4pMIbmwb9Vka7bQLjU8h1LXIPxmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806659; c=relaxed/simple;
	bh=Agg4QPystQPs2JjR4AaaDRI7V4S04XaGdJsO2+SBdZk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1hOEK7TD74L9M3JkfCWSpfnhIdYvnj9vKHo9EKso0YkLmaIkhs3wbujOWqpHTFE5W2mWllB18EZhg0DP3GPsQQdrJmbddiObyIB0DcVA3GhddtuMDbfdN+Cf1P8zSq1mEobR3T3E0E8BxwFj+KqXBmIdA8q+ZaqDTPrQ0FJLSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjd0FR5d; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjd0FR5d"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-486e8faff03so754891f8f.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806656; x=1792411456; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XyTvhmMauWVTWc68u+mhiwkWRE9BPuGcFcjBW1ldEgg=;
        b=pjd0FR5d0+slkAMVgDHCmU+6jUWwMQKQLD6RzQCYkA+G6MXlyVkDnu/SwvkIulh4l9
         AbP/m3uHb7g67xMm9FHpxyl83Xbvn54tM/NvXb87pn9tMN1Gnx6I/GiFKChZ+RmosCTo
         ox3lF96yjjz/4r2+YHqgUh/WZleLcXULv6J1CfI5p2KwOp0+8fkEWRYGeifhjSVEERyL
         Qi6tUwAhXnoDhLKjgVc+sgCyGX4pojP2y1OKzIm0Ys6ymnNrZHASZDL7aUcr3Z97Qj8R
         tdgoMOoXwzDjJkzYapI1q6M3n4O8pj6ZH/aRQLt37Tizc3vpz91H68lRbXY5UvuEHYuG
         Y5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806656; x=1792411456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XyTvhmMauWVTWc68u+mhiwkWRE9BPuGcFcjBW1ldEgg=;
        b=RwBv0+EGT9ESNqMRC3bbW4wjs5SEZgP4s3XvQI1PQZf8NPSyAukJn+aFQp19J8Jeng
         +wjtW5Hg+0C6SLoPyio0uuNTjB2Aya33kekZhowvnhI1cm0H4vhfu6cdLKSHAzcK5TTm
         h3sR+JpN82h60buxE1YBzsfuN1reUizcHuJM+K/g4CWBZpx0V+SbQAHut9D+AOJIP6cP
         iOWR5eFotgXB4Ahv42q96ytvQdasVdEv/QTb4qoeD/H3r1vH0uXYe3bgkDMDLjRH84Q2
         UyrvOl3HEdJ4KD2XcCarSzCaUe32w4KRHPEYjSPenIXwIvFONQIj4WYTSJEvmZwMPJcb
         aXNQ==
X-Gm-Message-State: AFq9FYJcT5xUT+909EJU6Lsjw/KD+QGa6v0mBKS4yCKDtI4BkbmutZ7b
	2O9tgnocs86mJdB29MVU9P3sryk/93Yw4vo1BT628hl3V+s8Jg7e+KkkHcvnFA==
X-Gm-Gg: AYBFou3QYzYiXhuCDYkceKvn6L8elhkF8IcWPhVEuUd8GhMYPMTu/CzD7esleVSjT7I
	gz2PaLggtkdffsUNEHUr+rhiPMpWl9N7ptGJ3xE/LYLTqc0UZHaPp3OcObIUdJUEihntMEj6jrl
	xW5NE+EhhTUdG/JyPMmdD/Xm5IQq9HB/kH+Wh8U/GaGCtiYvjoh51NV7OjRwI8ujODIefoCEv2r
	K+V/Uq+IUDNaqMLgEqycv8hYpdbiWT51DY24MY7w9MqpnvSNXet+z30bUEXSZ6lYLJhTTjfPzlC
	hOHD/xOPWWr69wrrNafnuqt3spvyg7prFEmyxdtCI9Bqaj54wW4Us9K2EUcyfdWVe11i3ijr5Lu
	e1O1NVHpiX68DaOLndYeHl4iiqtpP3YLrx0X3Ol146bnxYeWmreSU5DeEDUjlFFxOu/i+QFQT4e
	2dkAzqRbmLeAGZj08KFRZL8tskTh7flJHlZ7SCFq1EpXqgTquhuaa3i4L3/G90K0JeDnna9db80
	vhkyFlN/9+0kZTolhR4jn+928LdUqrtkbJidij09eBGlRlOWEakPwUGJjaFynqKUyriGKdbwGLz
	saXLhgrgoXCosKM=
X-Received: by 2002:a05:600c:3146:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-4a18e4af3a8mr186999115e9.19.1791806655972;
        Mon, 12 Oct 2026 05:04:15 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd574sm19738733f8f.34.2026.10.12.05.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:04:15 -0700 (PDT)
Message-ID: <6accccbf.a6a2e554.42efe.05b4@mx.google.com>
X-Google-Original-Message-ID: <aszMvJmPGCC5LVLW@Ansuel-XPS.>
Date: Mon, 12 Oct 2026 14:04:12 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, lee@kernel.org
Subject: Re: [PATCH net-next v25 06/10] net: dsa: tag_mtk: add Airoha variant
 usage of this TAG
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-7-ansuelsmth@gmail.com>
 <sashiko-outbox-166718@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-166718@kernel.org>

On Sat, Oct 10, 2026 at 04:11:37PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] net: dsa: airoha/mtk eth: hardware offload broken for AIROHA tag protocol
> --
> 
> commit feed6f0245d293aabba2178225f4097258a1d66c
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> net: dsa: tag_mtk: add Airoha variant usage of this TAG
> 
> This commit adds a new DSA tag protocol variant for Airoha switches,
> updating the Mediatek tag driver, Kconfig, and Makefile. It also adds
> comments explaining the differences between Airoha AN8855 and the Mediatek
> tag bitmap.
> 
> > diff --git a/include/net/dsa.h b/include/net/dsa.h
> > index 5d12191b6f6f5..9824c63ad50b3 100644
> > --- a/include/net/dsa.h
> > +++ b/include/net/dsa.h
> [ ... ]
> > @@ -76,6 +77,7 @@ enum dsa_tag_protocol {
> >  	DSA_TAG_PROTO_KSZ9893		= DSA_TAG_PROTO_KSZ9893_VALUE,
> >  	DSA_TAG_PROTO_LAN9303		= DSA_TAG_PROTO_LAN9303_VALUE,
> >  	DSA_TAG_PROTO_MTK		= DSA_TAG_PROTO_MTK_VALUE,
> > +	DSA_TAG_PROTO_AIROHA		= DSA_TAG_PROTO_AIROHA_VALUE,
> 
> [Severity: High]
> Does adding this new protocol ID require updating the ethernet MAC and PPE
> drivers to recognize it as well?
> 
> For example, looking at airoha_get_dsa_tag() in
> drivers/net/ethernet/airoha/airoha_eth.c:
> 
> 	if (dev->dsa_ptr->tag_ops->proto != DSA_TAG_PROTO_MTK)
> 		return 0;
> 
> And mtk_uses_dsa() in drivers/net/ethernet/mediatek/mtk_eth_soc.c:
> 
> 	return netdev_uses_dsa(dev) &&
> 	       dev->dsa_ptr->tag_ops->proto == DSA_TAG_PROTO_MTK;
> 
> If these are not updated to also accept DSA_TAG_PROTO_AIROHA, will hardware
> tag extraction and PPE hardware flow offloading (like in __mtk_ppe_check_skb()
> and mtk_flow_get_dsa_port()) fail because the strict protocol checks against
> DSA_TAG_PROTO_MTK no longer match?
>

This is irrelevant for this series and can be handled later. I'm not sure
offload can work with the AN8855 external switch.
 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261009161102.38961-1-ansuelsmth@gmail.com?part=6

-- 
	Ansuel
