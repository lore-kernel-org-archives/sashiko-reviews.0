Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323F83939BD
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 18:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788977008; cv=none; b=hBh93jMxmz+f45jFj3nm9/b9c1y+zjQ2/lnTQkFlgm1Zw4f8kg0jLoEkBJHQEP4ih0wOZnH46rjxwIcpLnqN0hcaDmqtaMu71JEk/BkhjViL8Zbuh4xg6dJx6F2YlH6r/O6dsnl1kUlYbfMIKHGQ8YsPm22Q2a7Uz1NIrZW+HD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788977008; c=relaxed/simple;
	bh=h0+O/uLPWOX80ES9M0XKdB5md+a2oSQUnkWr/gWIyaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/N/Z4+moUwCACh44SsAtyVPnMZAHV4uy2bB6ywPQbYdbCzS2M/HwITxMFWpvFI7uInxRuvynnX0Oa4PAh7dQcURJc+gr9MKelygzXJo41BCHDxufrjN0I0Z1EANvWPWMQbM0AM1KvnR0vANVBCw01cy9+XlMhDut6zs57g3dZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwmZrb8B; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwmZrb8B"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so9136885e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 11:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788977004; x=1789581804; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bjvBiyvh/g8+fag4d0kfWnymDoayXnCGlAJvwIriZP8=;
        b=VwmZrb8BLC7pWlxMbTCqy/NRVwOMkdKjsXIMAOwYdOvF106fk8B26oYDkjr+m6iQZ6
         m/zWAu0DepOYyzQ2N8PCGy2vqTGz6jZx4D8VyBmh5OKlqC25kHOjczajC/kpT4GmuZi5
         HnnJLG1GJOn3rWZwawNXY3rInHvQmrKJtOVcHigedbtdT9Mgcvm7UQU1YK37qEWM7KY/
         znsNjvCO3NYZcFI+s7qonsua+4V0QaaPBouaWL9oxwxrdbGbJ9dAAO4wFxibHMVbAves
         Lh25miOwAYVgbyryxshmvMyJ3V+OtcQj0i4b1kL9dWbjJBqVPCCQN0ut/YkTi+LXNYH+
         rsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788977004; x=1789581804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bjvBiyvh/g8+fag4d0kfWnymDoayXnCGlAJvwIriZP8=;
        b=C2RgMXsNds3XB1lK/hxS/NgAOMNc4nzxycM4QyM7zVk0PZUb7zoetL6uN5eW3J7gX8
         2A2uhxPxnuLHU1w72+rthNZmWlCxOaLRrkM8PQrC9mVZKM59LV/RV8zse1cU+W8nhrW3
         TB8maNOTBODiqyMNMETaVPVOa3cWT7KV1RHiUb3KHNEuCJLio3/qSxa70yYaaXIrxnN5
         RJIn6dF3AdIrBmAOYjDA2ltZsVBV5eTFiAqsYCGXvt94c8GNiWxH49KKL9CeD8oJ2boI
         W8ZK4jIBRX04fpBLolXejlwaZiqnNL/Vchc8CboMvj3FACdHxxle+Ie4tm9vKGRmrWhx
         oOOQ==
X-Gm-Message-State: AFuF++lfmn2OOvKEeqJ0p/28NBV2Qi79uclCGJsmQlyRSOd2tArHH1Ph
	qAc5Adz9/nSfc7OhnfqiWVk8zAGZGefY0xhk2Kx89NdS1QanX3/Ode6F2ViPlw==
X-Gm-Gg: AYBFou1j0arDb3zUzHlxlHOXxomkknqqV+I4clQpD+JC4RCr70SKnEzSivm7l+hMao7
	ceOE0niPKL6NbAv8K+A3JfKghhFIFU/QOl5Zhr4UTJrkmiSPPODTW6oIiTA6ph9sXjcFHSDUxoL
	oMQnmbdrSDFz9E5ZuSXtp8Gg+CnbsLeN+9euggpYgFd20bwKh1LBeCQ0IkosQFe14C9OZh9/Y7f
	WZkr4BoYzbmx50WxxMoKHGLVilIwsCDxO7WY8143G0EiRB2hobd/vBJx40xFxqaqT4qcSSEZ4m9
	UkTcBH7mIhIJr4a7vAfyTVDvn6ndkUqHF3xnfVqpWnZKGtfLQ4YQxowHU5QYzfkqrQZs/fvqlpF
	AJWMKN53ytUhdzub2+Xt3SCn/nnJz7/hQXUxToOzfz284yKKU9ca6AlQzCAYWpikqN5CbYEhCGE
	LGpgMjAuTSxgS0X788Aov3GvKqYTCGALWBOyyB5fgn7+2KgUFx2udnCgYo6DZ9nUKZZnh4Ud+A
X-Received: by 2002:a05:600d:8647:10b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49d26d863famr4558255e9.1.1788977004041;
        Wed, 09 Sep 2026 11:03:24 -0700 (PDT)
Received: from antoniarch ([37.163.183.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm76460505e9.3.2026.09.09.11.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:03:23 -0700 (PDT)
Date: Wed, 9 Sep 2026 20:01:39 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rtc@vger.kernel.org, robh@kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/9] rtc: abx80x: add mutex protection for register
 writes
Message-ID: <aqGeyGaUriVsueZ2@antoniarch>
References: <20260907203216.53192-1-apokusinski01@gmail.com>
 <20260907203216.53192-4-apokusinski01@gmail.com>
 <20260907204634.2A7C11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907204634.2A7C11F00A3A@smtp.kernel.org>

On Mon, Sep 07, 2026 at 08:46:33PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Incomplete mutex protection allows concurrent I2C reads to break configuration key sequences.
> --
> 
> commit c33d071aef97a2d9a731cf3e557a1cf0fbf7c50c
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
> > index e4fd7b5d4b110..44de234efecf7 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> [ ... ]
> > @@ -445,6 +458,7 @@ static ssize_t oscillator_store(struct device *dev,
> >  				const char *buf, size_t count)
> >  {
> >  	struct i2c_client *client = to_i2c_client(dev->parent);
> > +	struct abx80x_priv *priv = i2c_get_clientdata(client);
> >  	int retval, flags, rc_mode = 0;
> >  
> >  	if (strncmp(buf, "rc", 2) == 0) {
> > @@ -456,6 +470,8 @@ static ssize_t oscillator_store(struct device *dev,
> >  		return -EINVAL;
> >  	}
> >  
> > +	guard(mutex)(&priv->lock);
> > +
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but since this commit aims to
> protect configuration key sequences from race conditions, does this leave a
> similar race open for concurrent I2C reads?
>
> If Thread A executes a protected write sequence (like oscillator_store), and
> Thread B executes an RTC read operation, can Thread B's I2C read interleave
> and reset the configuration key?
>
No, becasue reads do not cause configuration key reset
> For example, abx80x_rtc_read_time() does not take priv->lock while reading
> the ABX8XX_REG_HTH registers.
> 
> Similarly, abx80x_is_rc_mode() (called from sysfs and read_time) performs an
> unlocked read of the ABX8XX_REG_OSS register.
> 
> The ABX8XX chip specification dictates that any intervening I2C read resets
> the configuration key. This would leave the register locked, causing Thread
> A's subsequent protected register write to silently fail without returning
> an error to userspace.
> 
> Should priv->lock be taken during these read paths as well to fully prevent
> I2C interleaving from aborting configuration key writes?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260907203216.53192-1-apokusinski01@gmail.com?part=3
