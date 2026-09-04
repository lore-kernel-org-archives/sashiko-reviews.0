Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A48F3B961B
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539937; cv=none; b=Mis/TTkvoiGzWcnDjUoeH3vk16OFZPPHAffQwWnCAyOF8G3Wm6iiciad6ynWry74qNkAdreCVFdR3YWTF11JnPnVb9OUMTLl12oBcgL4lWrEsvwGvr28Gv1PmjihKqMHXro1pgB1fRN7/6ulQ0y/ANXpXVWIof+6juglLr0BIko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539937; c=relaxed/simple;
	bh=l5p0foO0joFsdooF4jDHYxnUobNi9JE+S8To9zyPeI0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTq1Qcl6XD/HSc8TuvrMBWYHsD/Z9GzrSvIkiQ7AgRs2/UiZ2tcPjjtUGjpGsZDgF/D1ncwNBNCoPMV4bhKd+L2MXZF6NXf8pY0+PhdvHPyQSLZ/kyyj4aO4795uNYknmjwZ0GIULL6qYLYpjQBjDvwoXP57tRDJ88p38RWkx5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=a3Zzlauu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="a3Zzlauu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso8295865e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 09:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788539933; x=1789144733; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+KFYUAqa0PvanI3jMMnXFbsfpe1VgmcYuOXHAvwEfXk=;
        b=a3ZzlauuITAHjvZ/JiESGy6Tpk18bpRSzlcVmo60watALbaqIzyg/yHuAoIecFK5oK
         d2E0daJZzewObCY70NRYsU0e7pZkBYOVCGOGrW2ErAt6l2E6Ghf+obbtC30W2Hu1UAIn
         OaDRjYJTIBQTIYJdGPfBj4wLYVs5jp2lYLlhoUXz6/k322RrXP8UpMDlxj6P56yjqU6d
         tT40493yJkDnv74O/TsTOsVXrrfhoa8NVlQ/PEn3ST/hd2aEGl0grh6k/lc/BE9UIncN
         9Lkas3L0CeUhoqiwVN1dAKc6ghv+cssGhr+VztifnGiiHMcZwMLDGPHN3eOPnr5y6Utg
         8GDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539933; x=1789144733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KFYUAqa0PvanI3jMMnXFbsfpe1VgmcYuOXHAvwEfXk=;
        b=pxyFDwemMTQN4Wc1oCFSbfLRLRYjf73b+99a75WhZPwvZMdQofO08y5VRNlEgryD4Q
         TWqEFL8Tcp9iY2v29wWoyt94bNAY9QhOSYc1hlhDKFWyIfWUpcVmlegBpFFPtHGj2XNn
         Cg+FbJe3H9pNamyCeNu9FwwzUHFUg+WhCfONwezqw3L6g+GhXqGqx/yapq1zfa1DtVTl
         xbwqKlPqMwIq6vXXjwVS4noTeRvzmX3fxdO3HUjL0FtzrzMmJ272E44lytQ3ED/kfK97
         iJ4/9s0HwF4UM6pLVTXepdI76bs0W8LMN5g4X5tEkdXXTTOisJzIn+w7tYd6gvDqgMFu
         /e5g==
X-Forwarded-Encrypted: i=1; AKwUvBweB6Z69OzM+Z4/FZYA3f7J3JCmbriORZsVziDnkk8pXYeXKVU2RgytoUi/Dk5D6gW7oGU9aFb5UC2Kix5KRuw=@lists.linux.dev
X-Gm-Message-State: AFuF++kERaJo/rA20wGMAOMVyM8sSbM8/od2UuSOWCkueHmWI3G5UQPt
	Eapbj0KolBsPvvUZSkcN6arT3W9Dh7GzdNZcjsubt1UL24rwJvYuHjf/H5zGx98GFoU=
X-Gm-Gg: AYBFou3WpQVgv1SSujGVDIQMoeZ+erqeGG86k81BBr000AUhyaj4H304br5NhUdsIwx
	4qD+fnL8B6LGp343S1xUgXbjiGjxiRMlH0Mq3SyRZzZ/6DDFpdUuYZDsFSlww8VNHbn1OEJcsVs
	Q4Wkmx1V2hW+g+IqzccaANmujFWfxN9wYBRa8o1CUEzYUtRMiA+c5h6sIV/H4Kv1a1urvmp2SHo
	6usjavCN0BZRqa4PZU5WVPuwGDYOKv9/szmH+Bx5lIwWiMxMZG+V1VZ/OOVOBCWw32T3JLnLed7
	v1DVtVebqqJFO5uSbKfexH3qx2R2psrRn6iX9t6M7yoso7BhLdDpiE6z3NOx/I98YuekovJuHDZ
	XJZyY18pD7pCsaJHWk14AzW2R3pW1afie4S7zo84ahqkwmerLg2O2a6H7wLsdOTVHTBrskkLnRY
	jreZAj3GzZ1PmhckvSMYqELypFPns0BYgpk778/hjZGXoB4y2s4yevE7CXWQ==
X-Received: by 2002:a05:600d:6451:10b0:49c:fa21:1c8c with SMTP id 5b1f17b1804b1-49cfa211d1amr40178055e9.33.1788539933403;
        Fri, 04 Sep 2026 09:38:53 -0700 (PDT)
Received: from localhost ([82.145.119.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff8195ffsm21499955e9.14.2026.09.04.09.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:38:52 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 4 Sep 2026 18:42:32 +0200
To: Gary Guo <gary@garyguo.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	conor+dt@kernel.org, robh@kernel.org, ukleinek@kernel.org
Subject: Re: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <apr0-PHk2S2ny988@apocalypse>
References: <cover.1784539788.git.andrea.porta@suse.com>
 <a83d65b2d91865eb722337c547c94dce175e6086.1784539788.git.andrea.porta@suse.com>
 <20260720100212.BEF1D1F000E9@smtp.kernel.org>
 <amN-5B5POX3rNb29@apocalypse>
 <DKY8USKYJJVM.17HQ78YIYZMFV@garyguo.net>
 <aprNTF0278NuH55k@apocalypse>
 <DL6L8B6QAU01.1VCZAOPAUH4LP@garyguo.net>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DL6L8B6QAU01.1VCZAOPAUH4LP@garyguo.net>

Hi Gary,

On 15:05 Fri 04 Sep     , Gary Guo wrote:
> On Fri Sep 4, 2026 at 2:53 PM BST, Andrea della Porta wrote:
> > Hi Gary,
> >
> > On 19:42 Tue 25 Aug     , Gary Guo wrote:
> >> On Fri Jul 24, 2026 at 4:04 PM BST, Andrea della Porta wrote:
> >> > Hi,
> >> >
> >> > On 10:02 Mon 20 Jul     , sashiko-bot@kernel.org wrote:
> >> >> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> >> >> - [High] Missing `.remove` callback leads to Use-After-Free in the PWM and Syscon cores and leaks clock resources on driver unbind.
> >> >> - [High] Register context loss on suspend/resume silently breaks PWM output.
> >> >> - [High] Unclamped hardware duty ticks lead to integer underflow in the PWM core for normal polarity.
> >> >> --
> >> >> 
> >> >> --- Patch [2]: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver ---
> >> >> commit 0c98703d857577902e57d25b42a3d46dfbde5795
> >> >> Author: Naushir Patuck <naush@raspberrypi.com>
> >> >> 
> >> >> pwm: rp1: Add RP1 PWM controller driver
> >> >> 
> >> >> The Raspberry Pi RP1 southbridge features an embedded PWM controller with
> >> >> 4 output channels, alongside an RPM interface to read the fan speed on the
> >> >> Raspberry Pi 5. Add the supporting driver.
> >> > 
> >> >> > +static struct platform_driver rp1_pwm_driver = {
> >> >> > +	.probe = rp1_pwm_probe,
> >> >> > +	/*
> >> >> > +	 * .remove is not needed because this driver cannot be removed/unbound
> >> >> > +	 * cause it relies on syscon which cannot be removed
> >> >> > +	 */
> >> >> > +	.driver = {
> >> >> > +		.name = "rp1-pwm",
> >> >> 
> >> >> [Severity: High]
> >> >> Is it safe to omit the remove callback here?
> >> >> 
> >> >> Even with suppress_bind_attrs set on the driver, if the parent RP1 PCIe
> >> >> device is removed, reset, or unbound via sysfs, it will forcibly unbind all
> >> >> child devices.
> >> >> 
> >> >> Without a remove callback to run cleanup, pwmchip_remove() is never called
> >> >> and the clock is left enabled. Because the backing memory is devm-managed,
> >> >> the devres subsystem will eventually free the pwm_chip and regmap memory.
> >> >> This can leave dangling pointers in the core pwm_chips IDR and the global
> >> >> syscon_list, which could result in a use-after-free.
> >> >
> >> > This is true. Uwe, I guess I should reintroduce the .remove callback,
> >> > what do you think?
> >> >
> >> 
> >> How is remove going to work with syscon? The previous version seems to just
> >> ignore it completely.
> >
> > True, unfortunately we have not much choice with syscon because it does not
> > contemplate a corresponding remove function. The best well-behaved code could
> > just deal with clocks and resources that can be released, while syscon is
> > unfortunately not among them.
> >
> > On the other hand, I'd like to emphasize the following:
> >
> > - the driver could not be unbinded nor unloaded (directly) by the user, and...
> > - ...PWM driver removal as a consequence of the pci bus device being forcibly
> >   removed will almost surely leave the system unusable.
> >
> > As a matter of fact, even though it's not impossible for the remove callback
> > to be called, it seems highly unlikely. So maybe it's not that big deal.
> >
> >> 
> >> Also, do you actually need syscon here? Given that the pwm fan device is going
> >> to depend on the PWM fan device anyway,
> 
> Oops, it should have been "PWM fan device depend on PWM device". But you got it.
> 
> >> you could just EXPORT_SYMBOL_NS an API
> >> from the rp1 driver that returns the tachometer reading when supplied with a rp1
> >> pwm device pointer?
> >
> > I'm not devoted to syscon so if everyone agrees on the EXPORT_SYMBOL_NS solution
> > I'm perfectly fine. It seems to be used throughout several drivers and as long as
> > it's not considered to couple the consumer and the PWM producer too much, I think
> > it's an easy alternative. Uwe, are you fine with that?
> 
> I think that's pretty typical for platform devices, provided that the consumer
> and the producer are closely related.
> 
> I checked the RPi vendor kernel code and it looks like they're modifying the PWM
> fan driver code directly -- in which case the coupling would definitely be
> problematic. But I think that modification is problematic itself and not
> upstreamable. I suppose you'll add a separate, dedicated RP1 fan driver?

You nailed it. I've changed downstream driver approach because it was too invasive
to the pwm-fan driver and, as you mentioned, not upstreamable.
A separate RP1-custom fan driver was in plan from teh beginning.

> 
> In which case I don't see the coupling being an issue.

Perfect!

Many thanks,
Andrea

> 
> Best,
> Gary
> 
> >
> > Many thanks,
> > Andrea
> >
> >> 
> >> Best,
> >> Gary
> >> 
> 
> 
