Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16A94334DE
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 20:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790738; cv=none; b=R+BGK+yudKw17QL5fcBxA5VtVDhfhQyD+EsfKrA4PH5cdPIS4dyRIq5p9/f0y6Tdh1XH+Y36lQUV5UYuwOLwJxiqvssfndBpcINnJKY67Wbr2PNLmplAlvbB3u340YKH02oAk8scaJwX2dHYXSsmapZVFjgML/BHzbCxW5YSuW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790738; c=relaxed/simple;
	bh=WL+ga9AoN/j7RlE3rJ4Q6wn9IKo+XDS+L+c88fic/Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5ERaQVqWVceL1wBMPauOtUnF8X3Apcwh58LF/BTgjqLxMTjykb5/OYMeEESajkjICF5xjljPoFWZ9T3h0v3LWk+1tUOO/Sy2+bNfQzh9TrGxQak70sEqxAm0jX3S1ZO/TNHa5bbTjdOnVCBWXkuO+hb+6H5Le3kq6+uDIQ2LwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4R0ke+h; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4R0ke+h"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so12633455e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 13:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785790735; x=1786395535; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTNIwA5rIl7yheggGg5y8ZUCyvaskjkiO8o5tUu1AJc=;
        b=s4R0ke+hqwnoYlGM5lT/jJ4rhsAp84ZsSwcDbrz+wSlr/bGv3TccTWGIWu1roA0Tev
         0HJs0amhcGiZcf2POKdATTc0ZQ5lvLaufGIb4DIIfE8/PAxzGmQ5pmcTC1lct3hRIYhA
         pTxHGFFak6ZFMv2UlVkvPjTPG30S1TXE4lclhm7A/Plx+3nphccQkJ7KIszATqSvxwf9
         Z9E0ql3T35VPMVp/bVXKBUQeUaD1SS/bEdiOXWcdxXz82YOMta6Jp4ftY3Uw1oyDQpcH
         +3muui/9fa3IBQrq/rMNXTv07z3Br41sJNtqGi9ZWymbydHDdZ8u9G8UHfysDjqwpLpM
         Ct7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790735; x=1786395535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VTNIwA5rIl7yheggGg5y8ZUCyvaskjkiO8o5tUu1AJc=;
        b=Uzj90VyMsSuPi2YETpHSpQLDVkqwjoT5KFmx7Z8aNi5DyJVwOvRU94nT6ynEObeGfu
         6zVOo3SF2lS1kz4iJi9vBvzP+Gzz9XVHKgjsnY6VGkTffeEs577gEVl/aeB5mc76iXOS
         4cLysejZB8twhz5esXgK266ZAmRz3B8harZEQOiPZRmaFj714iS+89fbeXCVS0HeHHCp
         s8IjH/UjOjb41ducWpo+gFEis6mf/PVWQ6GwSsS9mbx0KXuL0pwLf8ljsSSbWtKl0nEf
         6jb1bPdreiIHmbuDKHR9Dke2HZMtuJ7YMz4NiUruFRFoHV6obuaCDt+BbWDCl2imNG1u
         8RFw==
X-Gm-Message-State: AOJu0YxNb7WdXAs8yaxDcNEXDVa87KU5q5th3xh74JflGoiqnkEbJ6PV
	kOf6WkQ91pr4SJ83mVW5ePX9uhlCTVMh3MNb2os1RlNapLNvfYgqz14rJEm/CA==
X-Gm-Gg: AR+sD12CtzDZ+D9idTYuN9NUYaxzVHeGejmLpw3kkfs+ekps7fIxXJe9s+jzAv+rUhl
	IcTpRVJkBQUxdrzbpWK0WSLfS5aUdwf79bhO/xW5/2O3jPQ48PDgVk+hq6a9T+MMH/FaA7p+/e/
	oFSaShbkG1WRUTtvLWIZpW35IwdO/3UHqQYa0SJUgpYXB2KmGsgVs0nbcAm8ymsqXSVO4679IsN
	IEwaXFDpni/V4J+WOaNA+HUOH9quJ8I0PaIW5AGJ2OLsTCgWnH7R9R0CiH0DWq14NqEm7lgVhsS
	4qL+JX8JYV8ao0ah+yJsNCvu0hDbgPASrbnJ8GJVBfZfqjHeI3o4Ou1dxZxl0jPsY/SZKD9Ign2
	lFVpPmrASBrG1cDME4OmxOSPfFL4DVO2bgsd3aoP+c8c4PdKEgG4Csl0K341v3GGepW4DVZHwJL
	3+k/ZSC7pj8VqsdbAuIvGOqO7sjJex4vsvoZMWvKL9DTJ3qGVpcs9HLybElE7xwADW
X-Received: by 2002:a05:600c:6989:b0:495:4811:7998 with SMTP id 5b1f17b1804b1-4980c664d83mr310149265e9.17.1785790734612;
        Mon, 03 Aug 2026 13:58:54 -0700 (PDT)
Received: from antoniarch ([78.209.183.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fd4bbcsm23236215e9.7.2026.08.03.13.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 13:58:54 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:57:26 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, conor+dt@kernel.org
Subject: Re: [PATCH v3 6/8] rtc: abx80x: replace read-modify-write pattern
 with regmap helpers
Message-ID: <anEAX5qGZzIGH02T@antoniarch>
References: <20260731184831.44037-1-apokusinski01@gmail.com>
 <20260731184831.44037-7-apokusinski01@gmail.com>
 <20260731190137.E8A701F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731190137.E8A701F00AC4@smtp.kernel.org>

On Fri, Jul 31, 2026 at 07:01:37PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Using `guard(mutex)` inside a `switch` statement case without an enclosing block causes a compilation failure (or uninitialized cleanup execution).
> - [High] Configuration Key unlock sequence is broken by unprotected concurrent reads and newly introduced read-modify-write regmap helpers.
> --
> 
> --- Patch [6]: [PATCH v3 6/8] rtc: abx80x: replace read-modify-write pattern with regmap helpers ---
> commit 68e1add63890d6b130ad7ce142d172f06e590b90
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: replace read-modify-write pattern with regmap helpers
> 
> This commit replaces manual read-modify-write register operations in the 
> rtc-abx80x driver with regmap_update_bits() and regmap_write_bits() 
> functions to simplify the code.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index 23823fc2f5458..52f958e2aecd2 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> [ ... ]
> > @@ -371,7 +364,7 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
> >  					  int autocalibration)
> >  {
> [ ... ]
> >  	/* Unlock write access to Oscillator Control Register */
> >  	if (abx80x_write_config_key(dev, ABX8XX_CFG_KEY_OSC) < 0)
> >  		return -EIO;
> >  
> > -	retval = regmap_write(priv->regmap, ABX8XX_REG_OSC, flags);
> > -
> > -	return retval;
> > +	return regmap_write_bits(priv->regmap, ABX8XX_REG_OSC,
> > +				 ABX8XX_OSC_ACAL_1024 | ABX8XX_OSC_ACAL_512,
> > +				 flags);
> >  }
> 
> [Severity: High]
> Does switching to regmap_write_bits() break the configuration key unlock
> sequence here?
> 
> The hardware requires writing the configuration key immediately before 
> writing a protected register. If any other register is accessed in between, 
> the unlock state is cleared. 
> 
> Because regmap_write_bits() performs a read operation internally before 
> writing, does that read happen after the configuration key is written,
> causing the hardware to relock itself before the write can execute?
> 
> Additionally, can an unlocked concurrent read sequence interleave here and
> clear the unlock state? Looking at abx80x_rtc_read_time(), it performs I2C 
> reads without taking priv->lock:
> 
> abx80x_rtc_read_time() {
>     ...
>     err = regmap_bulk_read(priv->regmap, ABX8XX_REG_HTH, buf, sizeof(buf));
>     ...
> }
Same answer as in patch 2 ("rtc: abx80x: add mutex protection for register writes"):
register reads do not cause a reset of the configuration key, so no
issue here.
> 
> [ ... ]
> > @@ -566,17 +545,8 @@ static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
> >  	case RTC_VL_CLR:
> >  		guard(mutex)(&priv->lock);
> >  
> > -		err = regmap_read(priv->regmap, ABX8XX_REG_STATUS, &status);
> > -		if (err < 0)
> > -			return err;
> > -
> > -		status &= ~ABX8XX_STATUS_BLF;
> > -
> > -		err = regmap_write(priv->regmap, ABX8XX_REG_STATUS, status);
> > -		if (err < 0)
> > -			return err;
> > -
> > -		return 0;
> > +		return regmap_update_bits(priv->regmap, ABX8XX_REG_STATUS,
> > +					  ABX8XX_STATUS_BLF, 0);
> >  
> >  	default:
> >  		return -ENOIOCTLCMD;
> >  	}
> 
> [Severity: High]
> Will this cause a compiler error or undefined behavior?
> 
> The guard(mutex) is declared inside the case block, but without an 
> enclosing scope. If cmd is an unhandled ioctl, the switch statement jumps 
> to the default label, bypassing the initialization of the guard(mutex) 
> variable. 
> 
> Does this require adding braces around the RTC_VL_CLR case to restrict the 
> lifetime of the guard?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260731184831.44037-1-apokusinski01@gmail.com?part=6
