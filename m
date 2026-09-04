Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CC249DB89
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 13:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529782; cv=none; b=aRi/kxjP029DzwiTY4Nl2LZTAz8BdQVNcVSY5fmq6PxSIib378DuqBstP/ywt4FLRYB/yKZ8pYeWzanFgW73zbpBB8M5MylcqcC3TTCFd6DMLXSYjvHrgU0MMjsT64Z/uNGFLVKXQMLoEunXk6eS3kOfMNfLPfpk+bHGVxb5084=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529782; c=relaxed/simple;
	bh=aosYpUbqKZOBqzNixgi27z8JCDcxlJLDNLiZEDNN040=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYalu0Ga7KZYDooh4myBBSVE4T/aDOqVNBksnkII3C1log25cxashitBkiJs9IcdXJx8J/CIINPMh9orGVcBA5rFu7fLaO2r1A0UFBxK9ObklDtID/RJ34eqmsbm+sODJZiI/ed6L/vpDwVeL+BkB8Y6JUBlWjS3/sc8j4RaivI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D1/BStQH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D1/BStQH"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48586861639so723533f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 06:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788529778; x=1789134578; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wP3l+1LPFkAU6/L5AN9IB6fzLBnDEDQsr0kTH2ur/CI=;
        b=D1/BStQHkW81pvcCFS2dmqWVH4DmWtlBPej4DWVI9OKZ9qVM0rXuVCQvEe/0253jaE
         pcsI4CdiUTssDfp/SJ24rCfE5GhmGHGFZ/CXaNd1YMq5e4ivoFd0p237gGS+rWeAVA1K
         ddq21BPXqhCWNLiQPsKxPLvAIoeuJ0eFX0C8xu9m3AqPy5Y83MeLlWGM9UhyVFQXXwVV
         YbHDbeZ/XYSi35YV9FRhpj1F/yJyKFt8cbH1Wt2AwBUeMIdE2j+baXu9afVllni+3WhH
         PkbfhMW4Dcxlp3ubktsMKp2QC+OTK1QFcJzTGqRZgOG4gyDjK1E4IMNWT0erFcsalp4I
         5DJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529778; x=1789134578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wP3l+1LPFkAU6/L5AN9IB6fzLBnDEDQsr0kTH2ur/CI=;
        b=P/7mOW+VYR26utCVD5krsBrpyLbOtczPR0sys7HIFYgr7GoflNas0RP03SUmQVBBNz
         KsVMG+WeuTJ/pVyJtYQe6nGG1+Fp08/d5fguVYjBldDxzI3xo2sujJ5zMZlNf9lxJ6zp
         uRuZnN50tv/vfnoF/tXzdy7rZ9SSvoDK+Z694cGePxjb5KYcDoabRoa+4cgn7Qy7nD8y
         fLw6Jed9/awxbwCWqenNcKTB3cDEmxktlEyF5HvwxBnELH78w/jwpjnGna6FuD9x9BZ0
         FbHN0lnQnNKhl4lhKzsfYpsj8f2dAM+1dRqoAHKfEDv3I6RDsdTkrZvb+dwbmFTzMr+w
         ne2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwUmdlDnN1WHV/J40LzRl1SSfVNm8LfnNi0L5YMjZ8DYoPfhQvfe/s5DXKdSfx/La9Si4TW1oUSZu7i8KXQwE0=@lists.linux.dev
X-Gm-Message-State: AFuF++kTKdlr5GWUuyxWyjmCM4FVpoR1CJjpbsrtKI8SqYJRo9jk2++L
	TVCj6LDpAPZIschAfuUYI6jHb0dsP3qrgHhuVx01teUtNS8hRBGtjDZ/dl3FpuMrJPE=
X-Gm-Gg: AYBFou3QS5gdL/jgwFaunoxgNyOdy0pLWw4pPFNwj/6TJYZMgN+b0pZCqW6cG0nMqGf
	OWtL9c539pnA9Ql/QEa6UYziHsl/fvZgxqkod2LbHCCmjIsEFa4yc7PUBIxBMvr5tYJSjj+UwBY
	KJS/9I3S0j5Bp2TVpC9ojGWDBO81hb3vNZrduplzqGdLEf4iuzzebNcpN2hsdBcsbuc2FnJenuo
	msBxdB9rEZb+3dtg0d153l2yRc0CKqkOLV/h6yYqvjDmk43NawWMURI677dyABQdEABTteyYdl1
	906Qb7QLL9R8ZLnywTDUKCPeb4Q/RhTpZHx29IzFLrarBpic5C0grS0zcm8VqO+uRXYbZals13U
	xCSiSel/5OfLjyw6+SXVYY96Cf3JczUhtSH9Ehs0szM7+YEUud2mai/nY5tSCzJ5P17NOhYPmEn
	wtQ2OW6NyGlsmVQgFaxXT178eILxgU23yYVe7UXCtOVhk=
X-Received: by 2002:a05:6000:2613:b0:485:8224:1a41 with SMTP id ffacd0b85a97d-48589228c23mr5316855f8f.18.1788529778351;
        Fri, 04 Sep 2026 06:49:38 -0700 (PDT)
Received: from localhost ([82.145.119.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm5656179f8f.17.2026.09.04.06.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:49:37 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 4 Sep 2026 15:53:16 +0200
To: Gary Guo <gary@garyguo.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	conor+dt@kernel.org, robh@kernel.org, ukleinek@kernel.org
Subject: Re: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aprNTF0278NuH55k@apocalypse>
References: <cover.1784539788.git.andrea.porta@suse.com>
 <a83d65b2d91865eb722337c547c94dce175e6086.1784539788.git.andrea.porta@suse.com>
 <20260720100212.BEF1D1F000E9@smtp.kernel.org>
 <amN-5B5POX3rNb29@apocalypse>
 <DKY8USKYJJVM.17HQ78YIYZMFV@garyguo.net>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKY8USKYJJVM.17HQ78YIYZMFV@garyguo.net>

Hi Gary,

On 19:42 Tue 25 Aug     , Gary Guo wrote:
> On Fri Jul 24, 2026 at 4:04 PM BST, Andrea della Porta wrote:
> > Hi,
> >
> > On 10:02 Mon 20 Jul     , sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> >> - [High] Missing `.remove` callback leads to Use-After-Free in the PWM and Syscon cores and leaks clock resources on driver unbind.
> >> - [High] Register context loss on suspend/resume silently breaks PWM output.
> >> - [High] Unclamped hardware duty ticks lead to integer underflow in the PWM core for normal polarity.
> >> --
> >> 
> >> --- Patch [2]: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver ---
> >> commit 0c98703d857577902e57d25b42a3d46dfbde5795
> >> Author: Naushir Patuck <naush@raspberrypi.com>
> >> 
> >> pwm: rp1: Add RP1 PWM controller driver
> >> 
> >> The Raspberry Pi RP1 southbridge features an embedded PWM controller with
> >> 4 output channels, alongside an RPM interface to read the fan speed on the
> >> Raspberry Pi 5. Add the supporting driver.
> > 
> >> > +static struct platform_driver rp1_pwm_driver = {
> >> > +	.probe = rp1_pwm_probe,
> >> > +	/*
> >> > +	 * .remove is not needed because this driver cannot be removed/unbound
> >> > +	 * cause it relies on syscon which cannot be removed
> >> > +	 */
> >> > +	.driver = {
> >> > +		.name = "rp1-pwm",
> >> 
> >> [Severity: High]
> >> Is it safe to omit the remove callback here?
> >> 
> >> Even with suppress_bind_attrs set on the driver, if the parent RP1 PCIe
> >> device is removed, reset, or unbound via sysfs, it will forcibly unbind all
> >> child devices.
> >> 
> >> Without a remove callback to run cleanup, pwmchip_remove() is never called
> >> and the clock is left enabled. Because the backing memory is devm-managed,
> >> the devres subsystem will eventually free the pwm_chip and regmap memory.
> >> This can leave dangling pointers in the core pwm_chips IDR and the global
> >> syscon_list, which could result in a use-after-free.
> >
> > This is true. Uwe, I guess I should reintroduce the .remove callback,
> > what do you think?
> >
> 
> How is remove going to work with syscon? The previous version seems to just
> ignore it completely.

True, unfortunately we have not much choice with syscon because it does not
contemplate a corresponding remove function. The best well-behaved code could
just deal with clocks and resources that can be released, while syscon is
unfortunately not among them.

On the other hand, I'd like to emphasize the following:

- the driver could not be unbinded nor unloaded (directly) by the user, and...
- ...PWM driver removal as a consequence of the pci bus device being forcibly
  removed will almost surely leave the system unusable.

As a matter of fact, even though it's not impossible for the remove callback
to be called, it seems highly unlikely. So maybe it's not that big deal.

> 
> Also, do you actually need syscon here? Given that the pwm fan device is going
> to depend on the PWM fan device anyway, you could just EXPORT_SYMBOL_NS an API
> from the rp1 driver that returns the tachometer reading when supplied with a rp1
> pwm device pointer?

I'm not devoted to syscon so if everyone agrees on the EXPORT_SYMBOL_NS solution
I'm perfectly fine. It seems to be used throughout several drivers and as long as
it's not considered to couple the consumer and the PWM producer too much, I think
it's an easy alternative. Uwe, are you fine with that?

Many thanks,
Andrea

> 
> Best,
> Gary
> 
