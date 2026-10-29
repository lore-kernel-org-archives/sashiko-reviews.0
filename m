Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.183.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309180;
	b=pAYOSj1pGzV3ebMe+8cZKyERNYV8U2sSPToUl1eg1wnnWWJ/ljIt+EkzNSLDn30nBPv9
	 K+QxrUyO9FyLLGFMsiM0T+6pBmqtwt3wgZzNpr/YSFSJam7ZCwjmnvtUzsj7a5s9XwXoR
	 2vv8/ezuLV2ZK8tfJ5SD9tB3vN+pi+hbT/xFjJhUrLuN8C1GQ8S1Bmq4xbQ29tFUsgbwy
	 YOCttQ+YBG+IgWlObrp4nwYKNlEUDoWygGCIPFQC5UhYOssjW+jZxSj44/Zt5eMlA4aCJ
	 IMFBWFD0m5FPWEXtkWMPdNaLFMc53DMKQqZexKRf2O+tgQotMsIBWWp41fz3X9vE2ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309180;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-GND-Sasl:X-GND-Score:
	 X-GND-Cause:X-GND-State;
	bh=K0VwcqeG18g2wUE9Qlyom2H6c5D2Tw1Z4++zxIpQLSM=;
	b=f6VDN8X3vnSGPDfI6GsHB2SCOWKsfSJsKBXXmWsBa+4AWsF3cGhrF/rXNKXXe016+RhL
	 tTBgfQqOWc65W87NylPuEAFuGgCmBLQoX38c+cdjuh7IkIW9lC7YIspmIkpZKxH5WxRvA
	 uX8AbyXKf0XxXWi1dsGEgA7WzjIVCy8A69wqtRuBtAWdqeOpUXlgr/Dvxxp1iYwls4+QM
	 l49LkSsa2cqweZMOCgVpXRNuUtdYgWr9CEsEyituAOqyK+7YBwgQTFUHIGq+2mJN9eKkE
	 4KUvJqMCr6ni5i7R5+ESeZIXJKFXzE9dx+kpJz650nxNe1tq8wx2e8IGa6A3apxdVaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=a-marquet.fr;
	spf=pass smtp.mailfrom=a-marquet.fr;
	dkim=pass header.d=a-marquet.fr header.i=@a-marquet.fr header.a=rsa-sha256 header.s=gm1 header.b=Z4vo+xcf;
	arc=none smtp.remote-ip=217.70.183.193
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2118B606A320
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 21:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2118B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a-marquet.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a-marquet.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=a-marquet.fr header.i=@a-marquet.fr header.a=rsa-sha256 header.s=gm1 header.b=Z4vo+xcf
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB3C83F191;
	Thu, 29 Oct 2026 21:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a-marquet.fr;
	s=gm1; t=1793309177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0VwcqeG18g2wUE9Qlyom2H6c5D2Tw1Z4++zxIpQLSM=;
	b=Z4vo+xcfR9/yQoRbL14jqjuS5Ec4Wmx4609Pwa40Vut4nx3da2R6XpZ4PYhUR6b39tFpBE
	dhzyoqrjnSn5RjQC1jv80r3flrS39zWdO8s3FwGtH5r3ng/dtQULIyzx1b0QllrD+GstOK
	Dr2BYZLulGhe8uWXgvquiLPwQ88B5BgHEakVf8LK4X1HhOT0KNKSkAX14hsu1bMwKaoQbP
	S1IvC8Jb07NU5uxDOiY9p8AMVr/j3X6ysw4xhK7XzmWqCMEbqdppEd4+UZGcpcMCl5RUjb
	37DPRt4K+YUpYcWXvRt/qhwPJoVr6x5oZwXdvLnk+e2vaCUfK3/LiiCynfcvOA==
Date: Thu, 29 Oct 2026 22:26:15 +0100
From: Alexandre Marquet <tb@a-marquet.fr>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/bridge: analogix_dp: deassert DP_PHY_PD on
 power-on for exynos
Message-ID: <auO595k2mEt3T0l8@laptop-218>
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
 <20261027-drm-misc-next-manta-auxbus-v1-1-3a45c3cf531d@a-marquet.fr>
 <sashiko-outbox-186515@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-186515@kernel.org>
X-GND-Sasl: tb@a-marquet.fr
X-GND-Score: 0
X-GND-Cause: dmFkZTGiO1LLnRe1dTsuWCd5J0FyIpnRXCPB8NU3m6KhSt/ZMmukzHHGc5XI3HEvcIIU1qk1FDjvAZFhv79mN+LsiFZzCbPinkxFOx+Ii3JBsyBdMBTbI25mAXDi3nbsAWiGhqIMIDQzQRxDp80eFxhunaqiGBfjER/HEhznfPRwXlkU8o6LJ/PwZHsDBcgKrCY3DCSXgQP6q9E4pJ61jdb0RpOF8mIQh5YjBP7b0RzrxOB/wwmtBn6GDbSSvOMSPmmWZ5fQuFjHmXZotMc+KguEiwIP9l/qI0aC031RP0++V50Xc+3UkC0NJONJYCmMzXC1siiVg6S50do4z22zkZqkRah+YJusi4VRzc+2Z2+NysadYprnjMkyg5Z696eYjqE7vlxoj6IRoDEH9u4qjcdsGDbWu+0tOQuFl0MeE/IDkWKifKODizEPRzj3ZR8eknXronGp01utioGFq8WFmUx5qmJ1itR801lxI6lvaO1aY53TvlKqUGNY5QXw2qvjpd3L/gWGGMIjYSS+yjbJjt3OGfQXziC1XfTHAVzF5T77werj/saD7ygjfd9siT43Ree4xVxewIET+U02R4EO7QilD8YzmSm2yQM7kx0RmRyL+GlPDpnccmOLoMfRpIy29RoVI9c6pdN7taQBxIrKpvyt/KyN2JiI85wHn/y2TMiyCq5IcA
X-GND-State: clean

Hi,

Le Tue, Oct 27, 2026 at 12:10:51PM +0000, sashiko-bot@kernel.org a écrit :
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/bridge: analogix_dp_set_analog_power_down() breaks ANALOG_TOTAL
> --
> 
> commit 91a05dce5d444dd4add713f60a3388d24c0834b4
> Author: Alexandre Marquet <tb@a-marquet.fr>
> 
> drm/bridge: analogix_dp: deassert DP_PHY_PD on power-on for exynos
> 
> This commit modifies analogix_dp_set_analog_power_down() on Exynos platforms
> to deassert DP_PHY_PD and assert individual block power-down bits before
> powering on requested analog blocks.
> 
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> > index c1344a3f013ab..9f634d4e47933 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> > @@ -256,6 +256,19 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
> >  	if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
> >  		phy_pd_addr = ANALOGIX_DP_PD;
> >  
> > +	reg = readl(dp->reg_base + phy_pd_addr);
> > +
> > +	if (dp->plat_data && (dp->plat_data->dev_type == EXYNOS_DP)) {
> > +		/* On exynos, register AUX_PD and CH[0-3]_PD have no effect if
> > +		 * DP_PHY_PD is asserted. So, when powering any of them up, we
> > +		 * need to deassert DP_PHY_PD first.
> > +		 */
> > +		if (!enable && (reg & DP_PHY_PD)) {
> > +			reg &= ~DP_PHY_PD;
> > +			reg |= AUX_PD | CH0_PD | CH1_PD | CH2_PD | CH3_PD;
> > +		}
> > +	}
> 
> [Severity: Medium]
> What happens when analogix_dp_set_analog_power_down() is called on EXYNOS_DP
> with block set to ANALOG_TOTAL and enable set to false while DP_PHY_PD is
> asserted in ANALOGIX_DP_PHY_PD?
> 
> Because this check runs before switch (block) for all block values, it clears
> DP_PHY_PD and sets AUX_PD | CH0_PD | CH1_PD | CH2_PD | CH3_PD in reg. When
> execution then reaches the ANALOG_TOTAL case:
> 
> drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c:analogix_dp_set_analog_power_down() {
> 	...
> 	case ANALOG_TOTAL:
> 		if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_type))
> 			mask = DP_INC_BG;
> 		else
> 			mask = DP_PHY_PD;
> 
> 		if (enable)
> 			reg |= mask;
> 		else
> 			reg &= ~mask;
> 
> 		writel(reg, dp->reg_base + phy_pd_addr);
> 	...
> }
> 
> reg &= ~DP_PHY_PD leaves AUX_PD and CH0_PD through CH3_PD set, so writel()
> powers down AUX and all four channels instead of powering on everything as
> described in the commit message.

Good point. Not sure if disabling ANALOG_TOTAL should power on
everything, or power on the blocks that were on before asserting
DP_PHY_PD. The current behaviour is the latter (noting that ANALOG_TOTAL
is currently unused).

> 
> Should the ANALOG_TOTAL case also clear AUX_PD | CH0_PD | CH1_PD | CH2_PD |
> CH3_PD when enable is false, or should the pre-switch check exclude
> ANALOG_TOTAL and POWER_ALL?

I would favour retaining the current behaviour, by excluding
ANALOG_TOTAL from the pre-switch check. There is no such need for
POWER_ALL, that ends up writing 0xFF or 0x00 to the whole register,
hence asserting/deasserting DP_PHY_PD together with the rest.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr?part=1

Best regards,
Alex.
