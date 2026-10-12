Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EDF489FBD
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806815; cv=none; b=DcwC/IOnw/vc/YbUvzIdcnqGLJRQcEsscT0hHyfvXH7BI9YPnxHJWmz5Bz4comjV0vIeI06ZVxaCwuUvdm269wDQfGSSfvk2ar6Z0zoIQ+OnI8cPMTMy+oX0u3kEMdfSjQ6MNA114rgc/+8KP624e1vvFATsOwcgQ8DfXO80h8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806815; c=relaxed/simple;
	bh=fzvEhmTz+Ddb+QnUGyF3Qj1zyXPGB9qkQhLX+ZZL6Rk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNva/vO/z8RePnmYL6twiPLAQYGu0tkHOHvonwh1EUFyM9ZqB6kKVo9ZUQVRJll0WT9mrfnbuxCiKqUl72aBaMAEex4eFRFn6VSHIQPS4yZkpmyjtn7NmNHBnI/mG3WQhD8N/5niHbDhLTBK4rABOIpCryTb3jw3wb0O78AuL8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJ0ZNFsI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJ0ZNFsI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso12167485e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 05:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806808; x=1792411608; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MAsX1GK+o6Cv2vDUupjDjLycMwLJ2GJ82bbQpCaX0c=;
        b=MJ0ZNFsIGe1rE8wCnvZXD3RdGWelJ3O40px+Dgs/cp9d80xJb3XMkvfP2HBtHHYdKb
         chtgK7KVKftTS3o4Utud0HZILsfotMNC5KFv8QLGR8Me1UvQd2w2Lnca9kPtQQ1UTnAv
         MpyrtQP+ZCgnGRGn2mfDQDQBeu7pODwwaAccY4tQ7SSoD+FzP0jkSMROlyuqcO3nbqmS
         FML45qIhE4FuywH0obGAxQ0uzuYg6betjb50V2OCMApbEZqN++tXwdSlzUggayIjxMQA
         FfQvV0ekw1+gLfQ/AJpXawOvn3/zCzU4kb6ON3SLzC93MyUFqRVXwVXUs1T+tanMU/yf
         Crbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806808; x=1792411608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MAsX1GK+o6Cv2vDUupjDjLycMwLJ2GJ82bbQpCaX0c=;
        b=YxNvohz7Un+TuBKVVfjwbC1bZfdYiR8JMRPrIpfyF6ARVja32FrjSGIspur7uuyjwA
         WnMpfN6L6icXs+I46Opd7k2SrayTntTR4aakw9Z8jbiZfB8bkimLBll0MjVsCLKXvAQm
         UZnW49U7NgduP2HvDXCnG3oRtiKN3fU74tKX7nITQ4KHuOLBoAqpRI9sV4fEzKg/KabR
         MB+QNFm8CiAOEo1dAGIdMAUm32PM+ps9ljlKqBtY9XC8qdI7Az92bcoY7gPa8DzR1far
         Oco5QOBTfpuDCAB80r7Svpl1in174mW1s45XXKiTtJJWIKr9MmjSBpvrhCtdwsDtKesM
         baKw==
X-Gm-Message-State: AFq9FYK6zvQsk6hfiMZC91C2Xxu4+wy4D1HhqV+0UPEjWanC0MaE0RHx
	qyC48co3CZc6sMVvjyF9Cq+JmjVc4dNRMa6YWxzlPGM2TTQb126bNnfL0R5oAA==
X-Gm-Gg: AYBFou13996GzGqcW5UpV2NFq9E/Xxi9BaBI85Aqu9fcQ7EOg0UzueNwwuUydlutArB
	h2jQA0iH+OkXNRHrf25CeLI/jGQp4xwEDkpJuU3FC0phDmYMoMHlAC6G9Y3tvc/9olCf9d9Q0F4
	Gxky+hMml2ZusvClmQQxuBSIPdI8i5qm23/xBy+ciNGp+VbnnJiSDi9qMWXPf79K6eSiVXmdRIQ
	lb9rvBfNfWLiNPZYo5iaB4PorkFuNJW5QD9V88R/SffXIjIJvfi8Sr9DcLuIY1Qu7BtqXV7zpj5
	PX3YMgDG96pj9uR6XVQWdA2wqFMWl/p+uLdFXBksC7TA7ACTBGEegDl4VVNX1Uj22o2EIWK0iEW
	TjOxht+WZQ8W0RJTCgUIt7ih/co0FMVKJrfg6i9lUUsHOQ30nytE4BG5Wto/9Tqb9fK9h7tnCLE
	l7NpCaY8QSJ7N+qoLhB/FLqGrdycjXhMEFC7EIfgsoz/kKegSL2XaS8iK9Sx+MZItP0lyXGnwnN
	8SE0+e0ImgzvsoKQYGfd0MMUGLMDMqG9cLMOsne7uqf1Nn25TqdeCqmwD+15UiFMcTVd8QncJr3
	Oelw
X-Received: by 2002:a05:600c:83c9:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a18e4ce9cfmr172319655e9.24.1791806807816;
        Mon, 12 Oct 2026 05:06:47 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm155838215e9.3.2026.10.12.05.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:06:47 -0700 (PDT)
Message-ID: <6acccd57.bac20f7a.1310da.9a58@mx.google.com>
X-Google-Original-Message-ID: <aszNVJ0JRbWH7Kf5@Ansuel-XPS.>
Date: Mon, 12 Oct 2026 14:06:44 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
	mfd@lists.linux.dev, lee@kernel.org
Subject: Re: [PATCH net-next v25 09/10] net: dsa: mt7530: generalize and move
 common function to lib module
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-10-ansuelsmth@gmail.com>
 <sashiko-outbox-166724@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-166724@kernel.org>

On Sat, Oct 10, 2026 at 04:11:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] net: severe MDIO bus performance regression via sequential regmap_field accesses
> - [Medium] net: dsa: mt7530: stale hardware bits preserved during VLAN setup due to RMW
> --
> 
> commit 9f9905cb3bdc569b54ef5ded23eb827e6ba6ffc2
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> net: dsa: mt7530: generalize and move common function to lib module
> 
> This commit creates a mt7530 library module to share common functions in
> preparation for Airoha switch support. The functions are refactored to use
> the reg_field regmap API for register access while aiming to preserve the
> same logic. Minimum modifications are made to header files to permit reuse
> of common macros and enums.
> 
> > diff --git a/drivers/net/dsa/mediatek/mt7530-lib.c b/drivers/net/dsa/mediatek/mt7530-lib.c
> > new file mode 100644
> > index 0000000000000..098dd45d3ee9f
> > --- /dev/null
> > +++ b/drivers/net/dsa/mediatek/mt7530-lib.c
> 
> [ ... ]
> 
> > +static void mt7530_lib_fdb_write(struct mt7530_lib_priv *priv, u16 vid,
> > +				 u8 port_mask, const u8 *mac,
> > +				 u8 aging, u8 type)
> > +{
> > +	/* Clear ATWD registers from previous access */
> > +	regmap_field_write(priv->fields[__MT7530_ATWD1], 0);
> > +	regmap_field_write(priv->fields[__MT7530_ATWD2], 0);
> > +	regmap_field_write(priv->fields[__MT7530_ATWD3], 0);
> > +
> > +	regmap_field_write(priv->fields[MT7530_ATWD_CVID], vid);
> > +	regmap_field_write(priv->fields[MT7530_ATWD_IVL], 1);
> 
> [Severity: High]
> Does this sequence of regmap_field_write() calls cause a severe performance
> regression on the MDIO bus?
> 
> Since the MDIO bus is inherently slow, taking around 20 to 30 microseconds
> per transaction, replacing a bulk 32-bit regmap_write() with individual
> regmap_field_write() operations expands a single register update into
> multiple Read-Modify-Write cycles. 
> 
> It looks like this single FDB entry write will now execute up to 15 RMW
> operations instead of a single bulk update.
>

I think it's acceptable for the good generalization done here and also it's
not exactly an hot path updating the FDB entry.
 
> > +	regmap_field_write(priv->fields[MT7530_ATWD_FID], FID_BRIDGED);
> > +	regmap_field_write(priv->fields[MT7530_ATWD_AGE_TIMER], aging);
> > +	regmap_field_write(priv->fields[MT7530_ATWD_PORT_MAP], port_mask);
> 
> [ ... ]
> 
> > +void mt7530_lib_fdb_read(struct mt7530_lib_priv *priv, struct mt7530_fdb *fdb)
> > +{
> > +	u32 val = 0;
> > +
> > +	regmap_field_read(priv->fields[MT7530_ATRD_CVID], &val);
> > +	fdb->vid = val;
> > +	regmap_field_read(priv->fields[MT7530_ATRD_AGE_TIMER], &val);
> > +	fdb->aging = val;
> 
> [Severity: High]
> Similarly, does this sequence expand a single 3-register access into 10
> separate MDIO read transactions?
> 
> If a full FDB dump of 2048 entries is requested, or continuous stat polling
> occurs, this could multiply the bus traffic and cause severe latency and
> MDIO bus congestion.
> 
> > +	regmap_field_read(priv->fields[MT7530_ATRD_PORT_MAP], &val);
> > +	fdb->port_mask = val;
> > +	regmap_field_read(priv->fields[MT7530_ATRD_MAC_BYTE_5], &val);
> > +	fdb->mac[5] = val;
> 
> [ ... ]
> 

Same reason, it's acceptable.

> > +static void mt7530_hw_vlan_add(struct mt7530_lib_priv *priv,
> > +			       struct mt7530_hw_vlan_entry *entry)
> > +{
> > +	struct dsa_port *dp = dsa_to_port(priv->ds, entry->port);
> > +	u8 new_members;
> > +	u32 val;
> > +
> > +	new_members = entry->old_members | BIT(entry->port);
> > +
> > +	/* Validate the entry with independent learning, create egress tag per
> > +	 * VLAN and joining the port as one of the port members.
> > +	 */
> > +	regmap_field_write(priv->fields[MT7530_VAWD_IVL_MAC], 1);
> > +	regmap_field_write(priv->fields[MT7530_VAWD_VTAG_EN], 1);
> > +	regmap_field_write(priv->fields[MT7530_VAWD_PORT_MEM],
> > +			   new_members);
> > +	regmap_field_write(priv->fields[MT7530_VAWD_FID],
> > +			   FID_BRIDGED);
> > +	regmap_field_write(priv->fields[MT7530_VAWD_VLAN_VALID], 1);
> 
> [Severity: Medium]
> Can this sequence of regmap_field_write() calls preserve stale hardware bits
> and leak them into new VLAN entries?
> 
> By using individual regmap_field_write() operations, this performs
> Read-Modify-Write cycles on the previously populated hardware register via
> RD_VID. The old implementation used a full 32-bit regmap_write() which
> safely cleared unspecified bits.
> 
> It appears that any leftover hardware bits in MT7530_VAWD1, such as EG_CON
> or PORT_STAG from prior usages or bootloader states, will be preserved.
> 
> Could this lead to corrupted egress tagging behaviors or STAG attributes on
> standard VLANs?
> 

From what I can see the vlan entry gets read first for existance. This zero
all these values addressing this concern.

> > +
> > +	/* Decide whether adding tag or not for those outgoing packets from the
> > +	 * port inside the VLAN.
> > +	 * CPU port is always taken as a tagged port for serving more than one
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261009161102.38961-1-ansuelsmth@gmail.com?part=9

-- 
	Ansuel
