Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E90F47C0F8;
	Wed,  9 Sep 2026 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959305; cv=none; b=YbwvvoPTDqIRTdWTozhPe0PSP9O0C5mcAjRiyl0VmJh4RxdtU87KQf+qXzfflz7N51hGo5hElRI5CwhcTl6yK6ycAkCA2K6dsTCiAk8KpdbGWSvYJqwlrBhh2nbO0urhBnnR8w2x9xJY6dYHwRlCdvcNZ7OhLdurc76P1nP7nIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959305; c=relaxed/simple;
	bh=+Wlg+C3veub2EH6U0MxpM4qgR9F69+JN//3GgVNVRcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPlU4OrJ8idWOcoYrgSaXHOiLJBHxZR+ZrCh1LCELbtoFtYoFv93IKVyqQ8Ic5+ZWURM3S3ToOwVDB+DGHYriSsWbWRQC8yWZg2MdiosFIgCEyTE1AQAD0+ZfDnnx792VxTvgn3aFWNocZ+hkd4lQ2xj5wF+aQWgBO36EMOsV9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoId+rP4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoId+rP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738BD1F00A3A;
	Wed,  9 Sep 2026 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788959303;
	bh=NetedbQH2vYJuIvkaFtSCPCWXa0qu/b4cU0QKveRWf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aoId+rP4irzvevU79kULgMxxj1qNwJ5zgBdIr/11UXO96pWMAgcjD3Lljun6aHzW2
	 c0LKliCsOxdUcibWfXVkclkYvKhRK/BqR+7RwaX+quvCBEaODNKacGQbrKH8HhfWH3
	 VZ77FcgI8mqsrovNE/h+FBEVYt9d6DXa7NoaFu7YWI7E88HuDGlXwXDwr56C+MYOjQ
	 Qt5P4W99xCELtwnMAgE8b1pqrJCBGqOoxjR4w4pZOZJ9QamymUppUnZW6rlh26jB0l
	 KGE6kR3xl1NPr+kaTT4Ipl5FxZ0kuodfgSLLmRncz3noRnVCJe8x+/6N0si28Q1N9O
	 7KSjJ273vQf4w==
Date: Wed, 9 Sep 2026 14:08:19 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Yaozhong Li <yaozhonguwl@gmail.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org
Subject: Re: [RFC PATCH 2/3] mfd: rk8xx: release the power hold GPIOs before
 powering off
Message-ID: <20260909130819.GZ2133376@google.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
 <20260909092728.1859-3-yaozhonguwl@gmail.com>
 <20260909093542.5956F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909093542.5956F1F00A3D@smtp.kernel.org>

On Wed, 09 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Acquiring 'power-hold' GPIOs after registering MFD child devices can cause probe deferral thrashing.
> - [Low] The commit message description violates the MFD subsystem formatting rules by using a lowercase letter.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> commit 99f9b4ec1bb40a89a22b218c05cb3242225a6bc9
> Author: Yaozhong Li <yaozhonguwl@gmail.com>
> 
> mfd: rk8xx: release the power hold GPIOs before powering off
> 
> This commit adds support for "power hold" GPIO lines to the rk8xx driver. It
> acquires these lines during probe and releases them with a delay before the
> PMIC shutdown request is written.
> 
> > mfd: rk8xx: release the power hold GPIOs before powering off
> 
> [Severity: Low]
> This isn't a functional bug, but the commit message subject violates the MFD
> subsystem formatting rules. The MFD guidelines require capitalizing the
> description after the subsystem prefix. Should "release" be updated to
> "Release"?
> 
> > diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
> > index 3dcf6abfda74f..fd1efbb94008d 100644
> > --- a/drivers/mfd/rk8xx-core.c
> > +++ b/drivers/mfd/rk8xx-core.c
> [ ... ]
> > @@ -874,6 +894,15 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
> >  
> >  	if (device_property_read_bool(dev, "system-power-controller") ||
> >  	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
> > +		rk808->power_hold_gpios = devm_gpiod_get_array_optional(dev,
> > +							"power-hold", GPIOD_OUT_HIGH);
> > +		if (IS_ERR(rk808->power_hold_gpios))
> > +			return dev_err_probe(dev, PTR_ERR(rk808->power_hold_gpios),
> > +					     "failed to get power hold GPIOs\n");
> > +
> 
> [Severity: Medium]
> If the GPIO provider is not yet ready, devm_gpiod_get_array_optional() will
> return -EPROBE_DEFER. Because this acquisition occurs after
> devm_mfd_add_devices() has already run earlier in rk8xx_probe(), won't the
> resulting devres cleanup unregister all newly registered child devices (such
> as regulators, RTC, and clocks) while we wait for the GPIOs?
> 
> Could the GPIO acquisition be moved earlier in the probe function, before the
> child devices are registered, to avoid probe deferral thrashing?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260909092728.1859-1-yaozhonguwl@gmail.com?part=2

-- 
Lee Jones
