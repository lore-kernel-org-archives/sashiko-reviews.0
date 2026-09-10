Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B6C490C0D;
	Thu, 10 Sep 2026 14:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049795; cv=none; b=ZhaT64saHSRGOw25IgElx68eResKOtjS+uwTPcRav5Eda0CUuqtQLRuL7PDWVALTAB/Kkq0rUzLfZH8IzThhP9dHrhoBNUFLy/ORC2vbRZM19ph0Ba5+Rk2ADshEc96cGhXrYkLrE/Vmu38O0ILJDieHLHWd8lUkyf2zgP2MMBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049795; c=relaxed/simple;
	bh=3Y/m3Qkf6cKV7OHiIFv4YAVb+X/pEuLBsNCBEVxnM3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TM038LYmU4392NOaueQ9Os8OU1AbraJsLzkK1YU3mobvJ9Rzap8XVOGj1PvvbPTjiBkWjtyRg1fcJt1u2T8kT+xO+mO3y20wHzZGVx0hLOu8othZpRhjciSa5kCaDo/1kNAyux0W3M8T7tB4EqCypGmKPYquyt/NVYQOnCooCxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2yD8kF+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2yD8kF+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2465A1F000FF;
	Thu, 10 Sep 2026 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049794;
	bh=jlbkzOzLCW57AMblPScYBFvVgRLjuwLIep83xkYzrQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F2yD8kF+q9OYuYS0oX4fpiCDyPTHf34wqe/xEFgKzjT861IRj3xpatOHJjYoUXohx
	 SA/4rUPFoBcEWZKsLFcexsa1oqvAcuaNng49+jZBwaHDjPHrsW1pDbls7N96fHHYk5
	 06QlQI8DjrNbBl0GjnH11/5TEjdO9HmceN7KGU5Ag9Bzy3X5Mu8++5JliknWwea62R
	 2/lWRQX8zabsmGBe7g2hCZ0XVM1siSQ2QRLR8LV66xKxPP+an4xum1x+y/H+6sZd3l
	 voLv0fGJPaxVF7UP0u8w/HIbLUAqQqYpEEHlSNP0w0fHWW+25bH+Eyy+be0xfK9khz
	 8VybuPBina8Yw==
Date: Thu, 10 Sep 2026 15:16:29 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>, neil.armstrong@linaro.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v11 1/6] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
Message-ID: <20260910141629.GE1051768@google.com>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-1-5f1610d83bf0@aliel.fr>
 <20260902130216.55BC21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902130216.55BC21F00A3A@smtp.kernel.org>

On Wed, 02 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Parent MFD driver introduces child-specific private resources (fan configuration) via a platform data struct in a global MFD header, violating MFD separation and coupling principles.
> --
> 
> commit 85d716a1f91fa9e8e2f48479df8c7b07e0cf0279
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> mfd: khadas-mcu: Add per-variant configuration infrastructure and VIM4 support
> 
> This commit introduces per-variant configuration structures for the KHADAS MCU
> driver, adding support for VIM4 specific registers. It also introduces an enum
> for variant matching and a fan platform data struct to pass fan configuration
> to a sub-driver.
> 
> > diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
> > index a99ba2ed0e4e0..7a9980ea63e7e 100644
> > --- a/include/linux/mfd/khadas-mcu.h
> > +++ b/include/linux/mfd/khadas-mcu.h
> 
> [ ... ]
> 
> > @@ -88,4 +95,21 @@ struct khadas_mcu {
> >  	struct regmap *regmap;
> >  };
> >  
> > +/**
> > + * struct khadas_mcu_fan_pdata - fan sub-driver configuration
> > + * @fan_reg: register address to write the fan level
> > + * @levels: table mapping logical cooling-device states to raw fan levels
> > + * @nlevels: number of entries in @levels
> > + */
> > +struct khadas_mcu_fan_pdata {
> > +	unsigned int fan_reg;
> > +	const unsigned int *levels;
> > +	unsigned int nlevels;
> > +};
> 
> [Severity: Low]
> Does this struct introduce child-specific private configuration into the core
> MFD driver?
> 
> By defining khadas_mcu_fan_pdata to pass thermal cooling state levels, it
> appears the parent MFD driver will be forced to handle configurations specific
> to a single sub-driver. The MFD subsystem principles indicate that the core
> driver should only handle shared core resources, while child drivers should
> manage their own private configurations.
> 
> Could this approach create tight coupling where any new fan variant requires
> changes to the core MFD driver, rather than keeping those details contained
> within the thermal driver?

Agreed.  Why can this not live in the fan driver?

-- 
Lee Jones
