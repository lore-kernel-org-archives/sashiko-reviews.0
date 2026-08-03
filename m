Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092B63537F8
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 20:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790198; cv=none; b=RG2OwWOMrDHrWuh2Wpi2WGNkLq9ZBRxW1h1I8Glz1DICH+20oiJqJpd73tnL9cdG+cfN5zG3iq10E5CQt/kjynIgvZ++ZQHJvzTVYPog19RSHuBoZEklzRtK53HNRZ1vHuvQzAgKIYZF4c8z6oBWh8wR0tQsb2E7BW3UrbdGesk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790198; c=relaxed/simple;
	bh=/1OaECMujIFSJE7t+DVTrABpYZ5BfId7y7cIHEcKVeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHgWZ4lyGJpMJEqOxmfGcuaCILgMkeQVrApCtyQN8EQeXaP76EUkxIq3KbLPHDKMR9Ze/M20jM2Zxq8en1d7UOLnM3i1qS13NZ2zGUww6a8cEReZVHjRRXX0QT8XTCkFDAN0o4/loaKJbcguqE/YcwRiwtFlqzuhxIn6tyN7MSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNxGesP8; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNxGesP8"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fd4531020so2281159f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 13:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785790195; x=1786394995; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vhuGZy0V/iO4wh9VJe2g8/AuD286lKexbEG58gGTA9A=;
        b=jNxGesP8BuA6GhBOYTSKX/SNjBxoeUywvNHQ3Ic/8F4dhomg4/219W+Cqs7Wm8op2D
         YvJut7yoxRnY+GX86btC9o+aua+MfHe8dGirs9IRgiLnH9fNbTkh53V6ShCKi4vhwJ31
         7FqZSfWXge5TIUDEDKZJZhgu3flhB+RhwX9i4Cn+7xteLVgvRf9t9+S2jRTii2fWR8yO
         0dWBYcGKIf7YYVJg+vM8VoB1g2x5avw64/jZp0hrHbi0FRIdl5SLreByPtzkTazH04HO
         /rT9nAeH/aKspjXKTauGrw7n/iCKzO1Pnr6gIHpizQC17pruS+7XAFRqxo45tbZlD3ro
         JUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790195; x=1786394995;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vhuGZy0V/iO4wh9VJe2g8/AuD286lKexbEG58gGTA9A=;
        b=J5Zq8gwioLpHUqTJ1lws2zPojnuNOgBYGarjkqwrICdPpm1QACleQlvbZNBhHUamH4
         CVzUIMdVa8uAUQeWjdBak7qvfMH/H04Yp0Oi8ZuaUlSRazv83XXwrcYGgkyAbkbo2CaF
         NQp/X8UOyH5i5pWPmmzC4aJ0WN0mzcjuiq/Njpj8sByhN+ZYz6MwuMkkW1y71eyjFz52
         o8uWx1gbDf/M4zp2jSGYhRHW4BAaWp6sJumyBmF1vvcUf2GL0W5XlENw1rtk+D+JNQf0
         oK8T6D7KqWl3qb7atDFcU8x4pV8lSVdHwdOVy2RskdYHVCj+Adgr4W0+pHue8XwcBRcD
         G9VA==
X-Gm-Message-State: AOJu0YxvJph0GV4IVKFLjwlxP/qJswCfQ09LSrBPWYAu9W4jCIwrbmQ4
	w6GL2VboWfLr9sQde/kksy2CILIweyGY4isDCfFVvUvHwrz33X50lUHu+v3j6Q==
X-Gm-Gg: AR+sD11e4YJCQMSX1mg7XF0JBKP9ZH1tc1VaNIrzQot0RMvcxIHLZ/uEcDKpr07NWnu
	Gh2b0DZUdCYulMkK7nAiu74YN3HGcDszElgWhO3wX5YOFN9n4VSBsw7AozCPTHdLJ3n0A1GFwYP
	Xm6FhCxPX2adfYnGv1qjhjzIDY/AImlKLRwuOZmM1BB2KfW5N4stCeKbEpfA9B+1JNIFZ7//L4X
	Zg5k5HusF5vK98Tcv9TtVOuUNa3zvl4iFCsDOEKS8h7jvdWikaFUJDDGyBB3ATff2Dr5N5fLEu0
	m7bj8m7a7Pjt5vka56lkSEk2VOCgVucwQo4zZWkgGr+8LmthULZnzwlkmR7HVDu/oURWDVt3znx
	zqi7vxVlXADtYIEY43sb2MQewSsg3f7jrkh0AWt+dPx2UP/chbQ7cq8mFS4spICwMaVBaeQAsM9
	Q8hvSGn7Y596Qkyx/zrIT+fKmf+9+mz6H1uL+6biTKY5h37DZtt7mRTH4zdwLapMXv
X-Received: by 2002:a05:6000:29db:b0:477:3986:9b54 with SMTP id ffacd0b85a97d-47fd72b0820mr19601084f8f.20.1785790195099;
        Mon, 03 Aug 2026 13:49:55 -0700 (PDT)
Received: from antoniarch ([78.209.183.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2961sm40075934f8f.13.2026.08.03.13.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 13:49:54 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:48:26 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 2/8] rtc: abx80x: add mutex protection for register
 writes
Message-ID: <anD96GGy16VCzpCL@antoniarch>
References: <20260731184831.44037-1-apokusinski01@gmail.com>
 <20260731184831.44037-3-apokusinski01@gmail.com>
 <20260731190257.45F771F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731190257.45F771F00AC4@smtp.kernel.org>

On Fri, Jul 31, 2026 at 07:02:55PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [Low] Build failure due to jumping over a `__cleanup__` variable declaration in a switch statement.
> 
> Pre-existing issues:
> - [High] Shared IRQ handler unconditionally returns IRQ_HANDLED and clears the status register, risking interrupt storms and breaking battery low detection.
> - [High] Missing mutex protection on I2C reads allows them to interleave with and silently break multi-step configuration key write sequences.
> --
> 
> --- Patch [2]: [PATCH v3 2/8] rtc: abx80x: add mutex protection for register writes ---
> commit d3bc95e6c97e9f4f1dbb461f4986e984a4ccd25a
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: add mutex protection for register writes
> 
> The ABX80X RTC driver performs multi-step register operations such as
> NVMEM transfers or register writes preceded by a configuration key
> write. Add a mutex to serialize all the register writes to protect
> these sequences against race conditions.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index 5486d9d0b1e5d..8d791b9ec7d21 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> [ ... ]
> > @@ -219,6 +221,7 @@ static int abx80x_rtc_read_time(struct device *dev, struct rtc_time *tm)
> 
> [Severity: High]
> This is a pre-existing issue, but should I2C reads like those performed in
> abx80x_rtc_read_time() also be protected by the new mutex?
> 
> If an unprotected I2C read interleaves with a protected multi-step write
> (such as abx80x_rtc_set_autocalibration()), it can reset the configuration
> key on the hardware. This would cause the target register write to be
> silently ignored.
>
Not true. The reset of the configuration key happens on any register write
but on on read.
> >  static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
> >  {
> >  	struct i2c_client *client = to_i2c_client(dev);
> [ ... ]
> > @@ -263,6 +268,8 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
> >  	struct rtc_device *rtc = priv->rtc;
> >  	int status;
> >  
> > +	guard(mutex)(&priv->lock);
> > +
> >  	status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
> >  	if (status < 0)
> >  		return IRQ_NONE;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does this interrupt handler
> unconditionally clear the status register and return IRQ_HANDLED later in
> the function?
> 
> If a shared device or spurious interrupt triggers abx80x_handle_irq(),
> returning IRQ_HANDLED for unrelated interrupts prevents the core IRQ
> subsystem from disabling a stuck shared line.
> 
> Additionally, writing 0 unconditionally clears all flags, including
> ABX8XX_STATUS_BLF, which prevents userspace from detecting a low battery.
>
> [ ... ]
> > @@ -539,6 +559,8 @@ static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
> >  		return put_user(tmp, (unsigned int __user *)arg);
> >  
> >  	case RTC_VL_CLR:
> > +		guard(mutex)(&priv->lock);
> > +
> 
> [Severity: Low]
> Does this cause a build failure?
> 
> The guard macro declares a cleanup variable inside the switch statement
> without a surrounding compound block. Any other ioctl command jumping to the
> default label will bypass the variable's initialization, which GCC usually
> flags as a hard error.
> 
Even though I didn't experience any issue, this review seems valid to
me. I'd change the guard() here to mutex_lock/unlock in v4
> >  		status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
> >  		if (status < 0)
> >  			return status;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260731184831.44037-1-apokusinski01@gmail.com?part=2
