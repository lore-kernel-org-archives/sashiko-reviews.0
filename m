Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA8C44BC97;
	Thu,  3 Sep 2026 11:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434889; cv=none; b=u8MSOUyqgjO5Ms6awkcOzuktcSdvInj9b1fK6RMcBA2w5i2NRbzdNsFAIS99svUhBR1dTYu3ZJB/zzviLevFMLY3f6MGJEGCtXopnGfy2uQqfNIvs6ZaCKR34Ty5Gzuux+sIE8HnE+7FpqL/wTadT604yUmHQ463BkwDP2FS+Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434889; c=relaxed/simple;
	bh=KbSaPeMXXX4Uia9I0+TfP2BXFTbvvwTRHRknBlu/zCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qj28WHeTJ5CvibGP8wMwd66dJ04E3l4y/aq5pFmMDtwERDUl1etrv6uuWcNJvQB+X5RmgwGmNgVar5ruC2KYZ9og6xFqJ/1KUS87YPcAQ7P1YGoHL40ZDcWq8wjZnSK1ReHdZiXNIL71tDNrPSmuNTZlcCU74MkuvoDhf1fZeLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LedUFkMI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LedUFkMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791991F000E9;
	Thu,  3 Sep 2026 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788434882;
	bh=nb7zL9TfqVYws63I/kwq4FXslMppDw1O4K/oSfe/O0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LedUFkMIFET7MqRbT8hbOS9MSYwc6idP3JO/4ptHK3jnh2S4V8qDHdnA5qb+zkPDa
	 jcjFq1P7UappIWpcEtl5IEgKYJkxgMFFVLACQtoEYuE3RrC4c/jiwr1FXLG/bDfeYq
	 +nMzFeWhgRRsI6EeVSo411U0ay69Ryi++IPwieVy3Q8ZgHhJDQOhVLGs/M6T4hdHCD
	 fnxR5vA5N5Aeyu4FbtybN6sDwXVDmERCeKQURpVUCLfs3XDkZEQEbAYNoG9oJ1TaHo
	 JD34S6VkKgQGX6d0WS4MDGeb/wIx/xyu3o1jNb73b451PR86k79jffbrK+khn0mQJs
	 4zC1D7REx3ejQ==
Date: Thu, 3 Sep 2026 12:27:58 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: a0282524688@gmail.com, mfd@lists.linux.dev
Subject: Re: [PATCH v7 08/10] mfd: nct6694: Submit the interrupt URB after
 the core is registered
Message-ID: <20260903112758.GQ2133376@google.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-9-a0282524688@gmail.com>
 <20260821034807.D68F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821034807.D68F61F000E9@smtp.kernel.org>

On Fri, 21 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing validation of irq_find_mapping() return value leads to spurious system interrupts (e.g., IRQ 0).
> - [High] Missing urb->actual_length validation leads to processing stale memory and spurious interrupt storms.

Also yours.

> --
> 
> --- Patch [8]: [PATCH v7 08/10] mfd: nct6694: Submit the interrupt URB after the core is registered ---
> commit 8c344a9772877b334fe47602ee4be5e3e806ecab
> Author: Ming Yu <a0282524688@gmail.com>
> 
> mfd: nct6694: Submit the interrupt URB after the core is registered
> 
> The interrupt URB is submitted before nct6694_core_probe() creates the
> IRQ domain. A device completing the URB early makes the callback pass a
> NULL domain to irq_find_mapping(), which then falls back to the default
> domain and dispatches interrupts the device does not own.
> 
> Submit the URB once the core is registered, and kill it before the core
> is removed so the callback never runs without a domain.
> 
> > diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
> > index c8667984df5eb..cc3e7b7b3a0dc 100644
> > --- a/drivers/mfd/nct6694-usb.c
> > +++ b/drivers/mfd/nct6694-usb.c
> > @@ -312,20 +312,20 @@ static int nct6694_usb_probe(struct usb_interface *iface,
> >  			 udata->int_buffer, sizeof(*udata->int_buffer), nct6694_usb_int_callback,
> 
> [Severity: High]
> This is a pre-existing issue, but does this callback risk dispatching
> interrupts the device does not own if an unmapped IRQ is received?
> 
> Looking at the loop inside nct6694_usb_int_callback():
> 
> 	while (int_status) {
> 		int irq = __ffs(int_status);
> 
> 		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
> 		int_status &= ~BIT(irq);
> 	}
> 
> If a malfunctioning or malicious USB device sends an interrupt status for an
> IRQ bit that has not been mapped, irq_find_mapping() will return 0.
> 
> By passing 0 directly to generic_handle_irq_safe(), wouldn't this bypass
> validation and incorrectly invoke the system's handler for IRQ 0 (typically
> the x86 PIT)?
> 
> Would using generic_handle_domain_irq_safe() be a safer approach?
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but could this callback trigger
> an infinite loop of spurious interrupts if the USB device returns a short
> packet?
> 
> In nct6694_usb_int_callback(), we dereference the transfer buffer:
> 
> 	int_status = le32_to_cpu(*status_le);
> 
> If the USB device sends a 0-byte packet with a successful status,
> urb->actual_length would be 0, and the buffer retains its previous state.
> 
> Since the bits are only cleared in the local int_status variable and
> the URB is resubmitted, wouldn't the exact same interrupts be triggered
> again?
> 
> Should we verify urb->actual_length is at least 4 before processing?
> 
> >  			 nct6694, int_endpoint->bInterval);
> >  
> > -	ret = usb_submit_urb(udata->int_in_urb, GFP_KERNEL);
> > -	if (ret)
> > -		goto err_urb;
> > -
> >  	usb_set_intfdata(iface, nct6694);
> >  
> >  	ret = nct6694_core_probe(dev, nct6694, nct6694_usb_devs, ARRAY_SIZE(nct6694_usb_devs));
> >  	if (ret)
> > -		goto err_mfd;
> > +		goto err_urb;
> > +
> > +	ret = usb_submit_urb(udata->int_in_urb, GFP_KERNEL);
> > +	if (ret)
> > +		goto err_core;
> >  
> >  	return 0;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260821033505.4017901-1-a0282524688@gmail.com?part=8

-- 
Lee Jones
