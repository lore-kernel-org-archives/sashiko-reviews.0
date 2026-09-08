Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC2341D635
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856165; cv=none; b=uNm8qMdIxc/Ys/zIjYGcKmjGNRKCuwDdG9sJ9ry2rFut3gN3TQCcbdcWgS10onlEeCx0a7QnxZxhih3in93oYLiqTCVhmTKPaWMaCyYIJO0waOeSStjTqji84Q+duX1V6fgckNVHJ1NqRToDrQcc+OmhGCvZYW6i+lOoKnaFWK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856165; c=relaxed/simple;
	bh=OAqA2ZfxFpy+f7fjYz+CZbojCY21kndBBA2Hxt2ih8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0bXwhLh5PBAXzR25OK7Zdp60qfAqTbInfGPmcNq++DfphRAxe/4shMB13ErV9AI4XcbFfrlAG3z28/DJHnJGZO4OmNp5zCIT9THK68/D1I9FDdI7l3vSoB1TRaVnR2zV86o3Ur/Sspd9WT2algKC4eNZcJ2VJHYwE13PrdIhPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLNqk7Ci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLNqk7Ci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA6B1F00A3A;
	Tue,  8 Sep 2026 08:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788856163;
	bh=0j6ObYypUO/cR69iFYBpiMBhA6lfX7kpt/5HoJAG4+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jLNqk7CirKu4YpcLM0chWa/1I6uoS4+ZK+f9R2b9jwwJTysDSes6cYPd9WNkrTr+E
	 8b5wrDvu1IldxIj5iVf8yCu5lJhbO+2kQj7+dxHOkE1geQuLbSdwuWOlnfkvXvwA0d
	 w7/FlJZTMMBdus3tLUZA3a4l9DbE0Yk744DZgMwOntKJPRlYAXhSMS4BMmUCQaRW6N
	 Z4VwcMtwh20jK44AvIyCtr9lMBf7k3w/XUh5n+GEXn1mvwvXVtqrbpefwMp7aVvoWL
	 vEhl5f/o9y8ccHMfP0SHZFmou+bJtEqMOLLPyNWgMm/aLvmaI6x4UVjb1DHEpMHR7o
	 Srxy6Ih1pqgUg==
Date: Tue, 8 Sep 2026 10:29:17 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, linux-phy@lists.infradead.org, 
	olteanv@gmail.com, vkoul@kernel.org, neil.armstrong@linaro.org
Subject: Re: [PATCH] phy: ti: twl4030-usb: unwind late probe failures
Message-ID: <ibju7oaxrobqgk77inpnj6nymok7mhdixr2du5iqsfuqiuwubq@6zzojhupkcbh>
References: <20260615070211.59144-1-pengpeng@iscas.ac.cn>
 <20260615071330.279C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260615071330.279C21F000E9@smtp.kernel.org>

On Mon, Jun 15, 2026 at 07:13:29AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> New issues:
> - [High] The newly added `err_runtime` cleanup path uses `pm_runtime_put_noidle()` before `pm_runtime_disable()`, violating PM guidelines and leaving hardware regulators permanently enabled.
> 
> Pre-existing issues:
> - [High] The delayed work `id_workaround_work` is not cancelled in the probe error path, leading to a potential use-after-free if the work executes after the driver state is freed.
> - [High] Re-initializing the PHY notifier head after the PHY has been published to the system drops concurrent registrations and corrupts the notifier list.
> - [High] Registering the USB PHY early in probe exposes it to concurrent lookups, leading to a use-after-free if probe subsequently fails.
> - [High] The PHY lookup created by `phy_create_lookup()` is never removed during driver unbind, leading to a memory leak and a dangling pointer in the global PHY list.
> --
> 
> commit 6c9da7a5a1fe8af7dbe4915303ad564e9cf8b693
> Author: Pengpeng Hou <pengpeng@iscas.ac.cn>
> 
> phy: ti: twl4030-usb: unwind late probe failures
> 
> This commit addresses missing unwinding in the late probe failure paths of
> the twl4030-usb driver. It remembers if the vbus sysfs file was created and
> adds an error path to properly undo PM, sysfs, and PHY registrations.
> 
> > --- a/drivers/phy/ti/phy-twl4030-usb.c
> > +++ b/drivers/phy/ti/phy-twl4030-usb.c
> [ ... ]
> > @@ -746,11 +747,15 @@ static int twl4030_usb_probe(struct platform_device *pdev)
> >  		dev_err(&pdev->dev, "ldo init failed\n");
> >  		return err;
> >  	}
> > -	usb_add_phy_dev(&twl->phy);
> > +	err = usb_add_phy_dev(&twl->phy);
> > +	if (err)
> > +		return err;
> 
> [Severity: High]
> This is a pre-existing issue, but does registering the USB PHY this early in
> probe expose it to concurrent lookups?
> 
> If a later probe step fails, we call usb_remove_phy() and free the twl
> structure via devres. If a concurrent thread called usb_get_phy() during the
> race window, could it lead to a use-after-free?
> 
> >  	platform_set_drvdata(pdev, twl);
> >  	if (device_create_file(&pdev->dev, &dev_attr_vbus))
> >  		dev_warn(&pdev->dev, "could not create sysfs file\n");
> > +	else
> > +		twl->vbus_file = true;
> >  
> >  	ATOMIC_INIT_NOTIFIER_HEAD(&twl->phy.notifier);
> 
> [Severity: High]
> This is a pre-existing issue, but does re-initializing the notifier head
> after usb_add_phy_dev() corrupt the notifier list?
> 
> Since usb_add_phy_dev() internally initializes this exact notifier head and
> exposes the PHY globally, could this drop concurrent registrations made by
> consumer drivers?
> 
> [ ... ]
> > @@ -773,18 +778,29 @@ static int twl4030_usb_probe(struct platform_device *pdev)
> >  	if (status < 0) {
> >  		dev_dbg(&pdev->dev, "can't get IRQ %d, err %d\n",
> >  			twl->irq, status);
> > -		return status;
> > +		err = status;
> > +		goto err_runtime;
> >  	}
> >  
> >  	if (pdata)
> >  		err = phy_create_lookup(phy, "usb", "musb-hdrc.0");
> >  	if (err)
> > -		return err;
> > +		goto err_runtime;
> >  
> >  	pm_runtime_mark_last_busy(&pdev->dev);
> >  	pm_runtime_put_autosuspend(twl->dev);
> >  
> >  	return 0;
> > +
> > +err_runtime:
> > +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> 
> [Severity: High]
> This is a pre-existing issue, but is it possible for the scheduled delayed
> work twl->id_workaround_work to run after the driver state is freed?
> 
> Since devm_request_threaded_irq() can schedule the work before we jump to
> err_runtime, shouldn't we call cancel_delayed_work_sync() here to prevent a
> potential use-after-free?
> 
> > +	pm_runtime_put_noidle(twl->dev);
> 
> [Severity: High]
> Does using pm_runtime_put_noidle() here bypass the suspend cycle?
> 
> Since pm_runtime_get_sync() resumed the device and enabled the regulators
> earlier, and pm_runtime_disable() prevents future state transitions, it seems
> the device will remain in RPM_ACTIVE. Should this use pm_runtime_put_sync()
> to ensure the hardware is properly suspended and regulators disabled?
> 

This is a valid point. pm_runtime_put_noidle() will not invoke runtime_suspend()
callback and hence the PHY will be in active state.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
