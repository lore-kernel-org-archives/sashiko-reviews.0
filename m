Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB614078DF;
	Thu, 27 Aug 2026 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787838914; cv=none; b=M0SRWzUOeiG1Q+XnypDLFRTYoMPi0e2ZoX1OYBkQQttqmoEV+BMAJ9NhLJECIJy1GNettOLJeZPcC03NB3+I25MdOem/gElxZX8GF+YO+EBRRaDa7VlTpKeWEEdEnJcBD8j2yrSHFHsuC9LqjrvAFUlheFAdqwg9gyz0ZRsNfL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787838914; c=relaxed/simple;
	bh=kHkHBGyN6C5h6jgQmgDmF3SNdruCmZV2VInskDgVqm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXZ55umCWE6hn2VccDCvD9zv+lYgRyr7+LtyNRKK5fMTy87txn/7is8sZ4+0KDAWwMvgWQG/XQtQW9VIe+Hmord14wd0jyDyPTInODPyQYGD8XgIRDgnuEOWoA3fPamclwbEwN1E2KpsULzuQJ61PIPX0IhLI1Zk3joLlAzVpzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSSfpIDa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSSfpIDa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86EA1F000E9;
	Thu, 27 Aug 2026 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787838912;
	bh=bIgMtvlLDLyBw7x8n/MOXltBUhzpMCzAYUEiOe5UenU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SSSfpIDaTePAiap4C1Sk5PoGGpG6nstmgB/jXDpNG4VLLTNynwaz8CYG9rcGUdf1f
	 fsZl39vo+X4l0UUeyyhBZFCaePRQg3lf+fK1DMv0Hl1gMGnBKNUsB0ieb3YFNdnerQ
	 5oWSwLANirkyKTh8TjUBTjdSAvl8VIi3koAPTgh6nrz/Ys7GpZoK0l5lg4u9KRU5tj
	 z4pEfqGouc21Qq0odekwvpENDPX9SbQxnA1vK4A2lf7skTUCysI3ffErxP8wW9avo8
	 xvURZNZgMhdmOo/wwHuqgnVGYpUWdHKrB0rQtfmuSkU1O7F9zqPbqe734rYt2HXR5Q
	 2V2w3V21lxuJw==
Date: Thu, 27 Aug 2026 14:55:09 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Triet Hoang <triet.hoang.dev@gmail.com>, mfd@lists.linux.dev
Subject: Re: [PATCH] drivers/mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <20260827135509.GP770273@google.com>
References: <20260821092508.324787-1-triet.hoang.dev@gmail.com>
 <20260821093516.2248C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821093516.2248C1F00A3A@smtp.kernel.org>

On Fri, 21 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Low] The commit message prefix uses 'drivers/mfd:' instead of the required 'mfd: ' format.

This needs addressing.

> Pre-existing issues:
> - [High] Device teardown sequence disables PM runtime and clocks before unregistering MFD child devices, leading to an external abort kernel panic.
> --
> 
> --- Patch [1]: [PATCH] drivers/mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS() ---
> commit f2c525c2ee807012f8f33d16a4bcbea747e75dcf
> Author: Triet Hoang <triet.hoang.dev@gmail.com>
> 
>     drivers/mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
>     
>     Convert the deprecated SIMPLE_DEV_PM_OPS
>     to DEFINE_SIMPLE_DEV_PM_OPS
>     and pm_sleep_ptr().

The commit message needs reformatting to avoid the needless early
line feeds.

> >     drivers/mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
> 
> [Severity: Low]
> This isn't a bug, but does this commit title violate the MFD subsystem naming
> conventions? The standard format requires using mfd: <Driver>: for the
> commit message prefix instead of drivers/mfd:.
> 
> > diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
> > index 068c25401c6cd..81f07a1d780c5 100644
> > --- a/drivers/mfd/ti_am335x_tscadc.c
> > +++ b/drivers/mfd/ti_am335x_tscadc.c
> [ ... ]
> > @@ -373,7 +373,7 @@ MODULE_DEVICE_TABLE(of, ti_tscadc_dt_ids);
> >  static struct platform_driver ti_tscadc_driver = {
> >  	.driver = {
> >  		.name   = "ti_am3359-tscadc",
> > -		.pm	= &tscadc_pm_ops,
> > +		.pm	= pm_sleep_ptr(&tscadc_pm_ops),
> >  		.of_match_table = ti_tscadc_dt_ids,
> >  	},
> >  	.probe	= ti_tscadc_probe,
> 
> [Severity: High]
> This is a pre-existing issue, but does ti_tscadc_remove() cause a kernel panic
> by disabling PM runtime before unregistering child devices?
> 
> When the module is unloaded, ti_tscadc_remove() drops the clock reference and
> disables PM runtime:
> 
>     pm_runtime_put_sync(&pdev->dev);
>     pm_runtime_disable(&pdev->dev);
>     mfd_remove_devices(tscadc->dev);
> 
> When mfd_remove_devices() unbinds the ti_am335x_adc child driver, the child's
> tiadc_remove() calls am335x_tsc_se_clr(). This issues a regmap_write() to the
> REG_SE MMIO register while the parent device's clock is already powered down,
> which triggers an L3 interconnect error and kernel panic.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260821092508.324787-1-triet.hoang.dev@gmail.com?part=1

-- 
Lee Jones
