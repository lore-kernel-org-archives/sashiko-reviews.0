Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EB53B05B3
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 20:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467008; cv=none; b=tLtKlVSmxTXRc9hKy9DS7Og4pqQpkrTcDo2mMGPpB7hWBSCdyHYQE4zjbo9Iv8L6/4vdXL13WbcU3tcQY+ihf1wpEmT1M7D+3+nKfhPzzmIca1R7X15VxYwpYvBlO5eE17lP+fDcPm9FNxibkMEbt4ym31vjp58pkbdreg7hI0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467008; c=relaxed/simple;
	bh=L9bmO5bQ4eT0+UVGVtoRZQT0c4FOX0ShFjkk3MTXEjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HB6i7B/Eo0iwTdVk+QKxXtDb1Cr09dr37+VTcAEGGlgyfEvEv0/SaGdwDAXr5O6RGY9C+T6rhgVBwjtjYHlPjc0Ch03BkLXqOjblKxpS7NZHGnwOgXkpWNz1OAPnqkY+lVSHU41ql7iuGKfF93jVODjTG48Hqg46L/EMTuz9OJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2YVq9Zh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2YVq9Zh"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so2176935e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 13:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788466996; x=1789071796; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uiGpkvB7XXsZv/7nG5x9DWvEjoMSR6JMHV9KheYoJ+E=;
        b=E2YVq9Zhq+KL9vfdJ3pSKj8MhhRosseaBDLzGGwxxk0CXrykQ9NOlQdOoBY0+Ep5Ps
         z3mNhHxZuN/dUKCB4jjbmW4775Ta+7ZWFTPcXB+Wv7W8+hNm2h7Mk/vFN147hKi1peOq
         Td/lBPCuIByCSsDZth1Z+KQdNjUuS1WdRg3/i2dlfFY8fy+gFrW5AGQr/BGU9jDJzJyp
         U1Idli6Ha7QCRUkw+ei5iEWH2dOEPM+QiGC5zSr7nxBZx0mTfA7v5kKm57T/FcLmNao7
         YLrpqI7HfNRLe7PusqfZfCHd2GUAzcRnhV879gy67+QOnOH106g4BC7SepwtPefWu/fj
         +cWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466996; x=1789071796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uiGpkvB7XXsZv/7nG5x9DWvEjoMSR6JMHV9KheYoJ+E=;
        b=UsLnWnFo2avI1T6/t7HK+nSuVgWf33T1Nf/IRJIfIL1RUe3t/0h1SioC6SJOjzsa8r
         aG/sDkG1kLwMvccx0nXAQd654gX/kud2mW3Og0Dl2FA1V0rV+4EMX+JWPMDAMnR7aV3w
         drvAPmiBKWhE0vURCH1poG9+pXkpdJEBkmcm/kLwv/4BA8EAFf+JCV5XdKpsMWTjr8O+
         N/h1zLLth25VAMn47QoGPOnO1LkA5VBmsUInYay0HpSkym9POn58+6ia5A835S989Rnm
         bG6sJMWQI6YFcUQDyZ09SKHZOmcEnYOYtMFWSFY9X9krPdZP4F+db3bP84kDvRvG+iAe
         QIzA==
X-Gm-Message-State: AFuF++maz/hFE3wFZuhUJlVlpdT0zEicXR28wC82Yil7dYnYtpUKmVya
	J+IJGrg0SdzXa1zr8Ktak7jvqOdR7RvWj2mPkIV0vzTBlfcs3grraoZi2oX++PxQ
X-Gm-Gg: AYBFou2rPCoAO//gdGoaLGv2esTa47L1J90rq+RBKSDSVYqW7UPJ46ECMFK/ZEIBN61
	gONhOFnq89MPQKStmKtF+AxYxKaVbvl00VndZfLvV6uICX8NRyqMOhjp7sSxUluSVin/LP3cDW7
	vzH44gjTXCLqynvsgcwetNOemJdYel1pie7KeCy0pG4uwxZMU+yeBbHMLMbOKElkAy6NcY00Rqt
	hUfFzs0xjQ0ZUGYPCen2G8eOKnDPSEKuFUKnp125t6t4BzgyGlq1hSUOmkXiPEr0CJUgwHJ5rkb
	pzc7e2gi5Rfg4ndzUQ+D0w7+Y1LFA13Mcen0FHF2syxN1NHKZTpzYSqek8csgosLkI3Z19qMUNm
	mhlIjg+IWvWdS4DKdAev/qiO+6GgLkY0L0Sm4edlFceOdR7IXKyjTjUlgM2ndElPMpAusGLe+bv
	vXS96s0ZPn0V/Y4zgnq/Pc0VpWnt+6VbDgyi0huT/VOx9eroH1OV0vzFbbEnLs
X-Received: by 2002:a05:600d:8445:10b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49cf825d77amr6515435e9.11.1788466995662;
        Thu, 03 Sep 2026 13:23:15 -0700 (PDT)
Received: from antoniarch ([78.212.5.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm19661395e9.1.2026.09.03.13.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:23:14 -0700 (PDT)
Date: Thu, 3 Sep 2026 22:21:32 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 3/9] rtc: abx80x: add mutex protection for register
 writes
Message-ID: <apnV9eSqJtBUoyId@antoniarch>
References: <20260811194034.28937-1-apokusinski01@gmail.com>
 <20260811194034.28937-4-apokusinski01@gmail.com>
 <20260811195656.691DC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260811195656.691DC1F00A3A@smtp.kernel.org>

On Tue, Aug 11, 2026 at 07:56:55PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Medium] The patch adds a mutex (`priv->lock`) to protect multi-step write sequences (like configuration key writes followed by register writes) but fails to acquire it during I2C read operations. Because interleaved I2C access resets the hardware configuration key on this RTC chip, concurrent unprotected reads can silently abort active write sequences in other threads.
> --
> 
> --- Patch [3]: [PATCH v5 3/9] rtc: abx80x: add mutex protection for register writes ---
> commit 22bce01eb8bed117145738b82a585f1daa2c3fdc
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: add mutex protection for register writes
> 
> This patch introduces a mutex to serialize multi-step register writes 
> on the ABX80X RTC, such as NVMEM transfers and configuration key writes.
> It uses scoped guards to protect these sequences from race conditions.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index fdf9664ebb6f0..0c8d3416fd5a9 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> [ ... ]
> > @@ -234,6 +237,8 @@ static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
> >  	buf[ABX8XX_REG_YR] = bin2bcd(tm->tm_year - 100);
> >  	buf[ABX8XX_REG_WD] = tm->tm_wday;
> >  
> > +	guard(mutex)(&priv->lock);
> > +
> >  	err = i2c_smbus_write_i2c_block_data(client, ABX8XX_REG_HTH,
> >  					     sizeof(buf), buf);
> 
> [Severity: Medium]
> This is a pre-existing issue, but do read operations like
> abx80x_rtc_read_time() and abx80x_read_alarm() also need to take
> priv->lock?
> 
> If a process reads the time or alarm concurrently with a configuration key
> write sequence (like a sysfs store to the oscillator or autocalibration
> attributes), could the read operation interleave and silently reset the
> hardware unlock state?
> 
> This would cause the subsequent configuration write to fail, since interleaved
> I2C access resets the hardware configuration key on this chip.
> 
> [ ... ]
Not true, reading the registers does not cause a configuration key reset
> > @@ -539,16 +559,18 @@ static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
> >  		return put_user(tmp, (unsigned int __user *)arg);
> >  
> >  	case RTC_VL_CLR:
> > -		status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
> > -		if (status < 0)
> > -			return status;
> > +		scoped_guard(mutex, &priv->lock) {
> > +			status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
> > +			if (status < 0)
> > +				return status;
> 
> [Severity: Medium]
> This is a pre-existing issue, but does the RTC_VL_READ case just above
> this block in abx80x_ioctl() also need to acquire the mutex?
> 
> Since the read case performs an unprotected I2C read, it could bypass
> the lock and abort active locked write sequences in other threads.
>
As above, the read does cause configuration key reset.
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260811194034.28937-1-apokusinski01@gmail.com?part=3
