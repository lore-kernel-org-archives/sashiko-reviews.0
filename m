Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8D648594B
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 14:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692250; cv=none; b=V19FcQ/Q8jdp9b1u4fPtEyFohPuuvV557RF8JJBb42PMhBLrnC0SBHOYL6F3kRrHqZ845KHA08CYPlRlDnvmA/Rbqg7DlsRX8SxfK0YgKUazKfobd8SBwwNBEljUARu6CaeO6v2pvAa/RNYYocmfiJMQPtnK9xwS9Z0b/vfpeUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692250; c=relaxed/simple;
	bh=G7QQkmIKC2lGrKZ5tfytjSH5NrVukmc2HJN3t1pyljA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALgg7kSH+6Mw8/cKqyZkL2mBIOcFKZ0V+4WWHTV4Zq7TPci91nuXcGStcXX7celnc5JSshjRT5QXY7giaA8OJeVBY3suQBqljacjS5fFWV0yUUNZN9TlosM/s7A9msaIIciebFG16fWt3aLLHph011a690GKupPYRMc9Oonames=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USIbTRt2; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USIbTRt2"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a856865so2063976b3a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 07:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790692248; x=1791297048; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T5fThRaAeC4PijpUZrzJoCsJvkJiyaRM31urT3RRI00=;
        b=USIbTRt2Qgu537KiTv7/fBM8S2OhnfC4c24WDUZlHceikHUBfXARB7CdTnQNZIqYFN
         pn7cXprgp7MMKhTyrUitmhXERQMcbzddriEje+jJOd+5Q4Hzn/zunbablbkmIe5XHPde
         cbG+L31wfHG4MLBWVfEdoiu7L1frGKeEUU5I31zo5xeGBTSB2EWtU6Py1Non5TMbh4RN
         G6vhV82q8IQjVYWPBwiMKy0in/rBQgPlUERMTpPdMhwkpJp/qq8G6D7S+9hCs5LHwYFx
         QEqHTba9ihYsmvg6H/f5nEkAnGeH9V3S3yjkys8CDnhANLGgVxObr9Q3j3oOVfprSKp6
         96uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790692248; x=1791297048;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T5fThRaAeC4PijpUZrzJoCsJvkJiyaRM31urT3RRI00=;
        b=VqRgwHf7azlL42+k19U06mQHPKSGgFrDta+y0veIBjn4v67xiSmW37kmjfMGOHu7Pc
         +h0q2YeQyCxgKJ/r6iPPWQ1XYwGWwqUnzra2DaulnpX9WnDbeiiHFDB6oIyzYuPT1AVz
         HY0oWPzjsFKXugzfna1u3u6YmKAKvEPQ5PL9MJmFVISlN1px/pZkLqF7uxgi7iNMe9Gc
         z9ky9RpVf8/4LnBEj2dU8TyVcNU3t6nmPMxsrMVYyqx9z+oZk2+spO3Psaoh/S6i6uqK
         K0xQpzP8aTh0tKCvQaCXPXyk+I8pOZeGONmMrb+IvHwrmL1Gf7P9M8eYsiTq04yFYtBo
         Vv7w==
X-Gm-Message-State: AFuF++nucSvDe4O4xwJOWew5vvlzncTcepQlxZbGWei5I60TJPkeFu7v
	1GHDpYmA3HD10RNPfcj3heRst88pSzg6Nf0NGv/bJLidNV/TactNWlrb
X-Gm-Gg: AYBFou12i2sN+yLsVWG8zH/NotanJAt0QSS6fjq9peDxGuCq1sL+7Bh+Tu9K3lbOOSk
	oPdMG95YWsHmNOOQyw2zW/JbMsmt7kDZlvetpmbx141g6uWRY+OLLWLjh0/MoIgLn2pF1SShYy3
	zbzZdaC29+ktYojTi6oFCz/EhRFUZkqYcKafgIoqJsj4F5FmL7VHnFuUl2B/vSBzNf9g3jipCOt
	4wxYLbGiBEa7oUTw1jA9EhPGImMhw7k8+MVNPiLdQTUQkjiHQlrbfyI3ayITWclFji9rdodbnzx
	TsxXJo+lt4uW+tbgdJptjM8lmFuqkDkOZkD0Axzr0+Dz7+AmZhmJzlEsOtfQZuRfZvz28jXzTwA
	wZXntIJA6usMe5xnx+N48AAlxMCR/GA/OFyqIfq3gSX+xa03sc0uxCFXfZ1V/kPsw8NkClZ1uh7
	0/kA7qvRUwDQ3k1kL/ClmUoxdiNG0Ya40lkFkZAcgXntGSvhtZjBoZtta5WNs/vkWmBJDzaW/Mw
	FVF4+cC/LWM
X-Received: by 2002:a05:6a00:1954:b0:880:fe7b:bc55 with SMTP id d2e1a72fcca58-880fe7c018emr8553594b3a.56.1790692248496;
        Tue, 29 Sep 2026 07:30:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8868c9d0c9fsm14045b3a.42.2026.09.29.07.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:30:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 29 Sep 2026 07:30:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RFC 08/11] watchdog: sbsa: Handle IRQ probe deferral
Message-ID: <232e1daa-e57c-454f-9029-03d2405bb4af@roeck-us.net>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-8-2c62125d0085@kernel.org>
 <20260925075726.B0A6B1F000FF@smtp.kernel.org>
 <d9102e7e-a69a-4ad5-aa38-c2cbd9d98496@roeck-us.net>
 <aruAQ0qOGU6W2NhS@red-moon>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aruAQ0qOGU6W2NhS@red-moon>

On Tue, Sep 29, 2026 at 11:09:23AM +0200, Lorenzo Pieralisi wrote:
> On Fri, Sep 25, 2026 at 06:46:31AM -0700, Guenter Roeck wrote:
> > On Fri, Sep 25, 2026 at 07:57:26AM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [High] watchdog: sbsa: system reset due to unserviced watchdog on probe defer
> > > --
> > > 
> > > commit 82d6b6d0cf8ddd44758931db5360cd8439795f6f
> > > Author: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > > 
> > > watchdog: sbsa: Handle IRQ probe deferral
> > > 
> > > This commit handles probe deferral when mapping the IRQ for the SBSA watchdog
> > > by returning -EPROBE_DEFER.
> > > 
> > > > diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> > > > index e04d42cc7774d..f4491409caf5d 100644
> > > > --- a/drivers/watchdog/sbsa_gwdt.c
> > > > +++ b/drivers/watchdog/sbsa_gwdt.c
> > > > @@ -352,6 +352,8 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
> > > >  
> > > >  	if (action) {
> > > >  		irq = platform_get_irq(pdev, 0);
> > > > +		if (irq == -EPROBE_DEFER)
> > > > +			return dev_err_probe(dev, irq, "failed to get ws0 interrupt\n");
> > > 
> > > [Severity: High]
> > > Does returning here during probe deferral risk an unintended system reset?
> > > 
> > > If the bootloader leaves the SBSA hardware watchdog running, the driver
> > > correctly detects this via status & SBSA_GWDT_WCS_EN and sets
> > > WDOG_HW_RUNNING.
> > > 
> > > Because we abort probe registration here, the core remains unaware of the
> > > device and will not ping it.  If the deferral period exceeds the hardware
> > > watchdog timeout, won't it expire and trigger a reset?
> > > 
> > > Previously, if platform_get_irq() returned -EPROBE_DEFER, the driver fell
> > > back to single-stage mode (action = 0), and successfully registered the
> > > watchdog, allowing the core to immediately start servicing it.
> > > 
> > Looks like a valid concern to me.
> 
> Right. Just to understand the issue (forgive me the stupid question), isn't
> there a time window where this can happen then even without IRQ probe deferral
> taken into account ?
> 
Sure, but the window is (potentially much) smaller.

> What's the best course of action then ? Ignore -EPROBE_DEFER and treat it
> as failure (basically, dropping this patch ?) ?
> 

"treat it as failure" is a bit misleading. The code will continue but
without interrupt support. We have two options: Either drop this patch and
accept that interrupt support may not be available, or find some means to
avoid the problem. Other than dropping interrupt support in that case, the
only other idea I have is to initiate a delayed worker and retry to get
the interrupt periodically after -EPROBE_DEFER.

Thanks,
Guenter
