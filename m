Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263043EE1F8;
	Thu,  3 Sep 2026 11:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434855; cv=none; b=lJnRdZvgzWwqDIkXbv1RVnBjGJvLumAGhYOOLApB0LBUzpv5hx6EQK2RVANMD3b58gjFkZ7RITKWHeU1DnX6sTdC1gO7/evKO8QT3qZ/PwwOyTF3OHCL/7iLKsizOxAKb6IAIEOj4COX2/bzUcTB4nRUmRsOPYXPvO5Wqdcb5HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434855; c=relaxed/simple;
	bh=T/kkSGpMbWQtgjjaObTskTAonbeVIiJOLsWGw0kXrc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOKSLtHIVZoVAEUPY1xAR4ECjPunW+ehRPlCoTHTXusFwaYiNMKx4i3kY7m7LEL/teBK5BmLhaCFopd+RK0c+wyOZTJlJBP5lxi6IHLme1dRJ0W6X3h89GLKrNLSLzYE7Uh3GDDxfGHEjL4JSd7YCqYvNLTmgKovcZrnZ5SAb/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4jxYAOb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4jxYAOb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2841F000E9;
	Thu,  3 Sep 2026 11:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788434853;
	bh=Hi1v2WtenzXBiQKe6jmV5A4pt0AJojwq3c+tuewSzaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c4jxYAObRQac4hzXYQhuCzAT+VTmPlgRZSRVbKfA27oTCeR3eqWP7wIN7FWUs0Z0I
	 ZMcjwYvzkRRHhjqTaIZ3csewRmskE85YnAHqyohXe1s5H6qfcpFCR0R0Nzs172O9Rz
	 VUEAB7QmJGoWv0sQA4i7wXP4njQH3LaYtTV95XthHAQxDx+/voRIrVaJhYNujIK9S+
	 Euj1k32kkyMV0xjZLT/6d4a/8ySLpIWN8PGKOUq1qpmpBen0+rkYcJ13fahVRl3LKV
	 /0bVL7E2A+fYncggVqZj8pNXXCKXojTSq3WTj0lOaMxjCQpBRGGhiIIQGiJtf5doBq
	 UZl2JGm+V5ihg==
Date: Thu, 3 Sep 2026 12:27:30 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: a0282524688@gmail.com, mfd@lists.linux.dev
Subject: Re: [PATCH v7 07/10] mfd: nct6694: Validate the interrupt IN endpoint
Message-ID: <20260903112730.GP2133376@google.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-8-a0282524688@gmail.com>
 <20260821034854.619B41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821034854.619B41F00A3A@smtp.kernel.org>

On Fri, 21 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Unchecked transfer lengths lead to stale data reads.
> - [Medium] Mismatched endpoint address used for interrupt pipe creation.
> - [Medium] Missing endpoint existence and type validation for required bulk endpoints.

Since this is a new driver, these are all your issues too, right?

I'm going to stop my review here until Sashiko is clean for this driver.

> --
> 
> --- Patch [7]: [PATCH v7 07/10] mfd: nct6694: Validate the interrupt IN endpoint ---
> commit 403c0781b839695d774ed394e3d21842e56bd309
> Author: Ming Yu <a0282524688@gmail.com>
> 
> mfd: nct6694: Validate the interrupt IN endpoint
> 
> The probe reads endpoint[0] of the current altsetting without checking
> that the interface actually describes any endpoint. A device reporting
> zero endpoints makes the driver read past the endpoint array.
> 
> > diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
> > index 793ce54c02aad..c8667984df5eb 100644
> > --- a/drivers/mfd/nct6694-usb.c
> > +++ b/drivers/mfd/nct6694-usb.c
> > @@ -305,13 +304,9 @@ static int nct6694_usb_probe(struct usb_interface *iface,
> >  	if (ret)
> >  		goto err_urb;
> >  
> > -	interface = iface->cur_altsetting;
> > -
> > -	int_endpoint = &interface->endpoint[0].desc;
> > -	if (!usb_endpoint_is_int_in(int_endpoint)) {
> > -		ret = -ENODEV;
> > +	ret = usb_find_int_in_endpoint(iface->cur_altsetting, &int_endpoint);
> > +	if (ret)
> >  		goto err_urb;
> 
> [Severity: Medium]
> This is a pre-existing issue, but does this probe function also need to
> validate the bulk endpoints?
> 
> It appears that nct6694_usb_read_msg() uses usb_bulk_msg() with a hardcoded
> NCT6694_BULK_IN_EP. If a malformed device lacks these bulk endpoints or
> configures them with the wrong type, could it trigger a 'BOGUS urb xfer'
> warning in the USB core?
> 
> > -	}
> >  
> >  	usb_fill_int_urb(udata->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_INT_IN_EP),
> >  			 udata->int_buffer, sizeof(*udata->int_buffer), nct6694_usb_int_callback,
> >  			 nct6694, int_endpoint->bInterval);
> 
> [Severity: Medium]
> This is a pre-existing issue, but does this mismatch the found endpoint
> address?
> 
> We dynamically find the interrupt endpoint above and use its bInterval here,
> but we still hardcode NCT6694_INT_IN_EP for the pipe creation. If a malformed
> device has its first interrupt IN endpoint at a different address, and 0x81 is
> used for a different type, could this result in a type mismatch and a kernel
> warning?
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does the driver handle short or
> zero-length packets correctly?
> 
> Looking at nct6694_usb_int_callback(), it seems to read the transfer buffer
> without checking urb->actual_length:
> 
> drivers/mfd/nct6694-usb.c:nct6694_usb_int_callback() {
>     ...
> 	int_status = le32_to_cpu(*status_le);
> 
> 	while (int_status) {
> 		int irq = __ffs(int_status);
>     ...
> }
> 
> Similarly, in nct6694_usb_read_msg(), it appears rx_len is not checked before
> evaluating msg->response_header.sts. If a device returns short or zero-length
> packets, could this cause the driver to read uninitialized memory and
> potentially trigger spurious IRQs?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260821033505.4017901-1-a0282524688@gmail.com?part=7

-- 
Lee Jones
