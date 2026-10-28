Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199597;
	b=xIki68awzPf1F3oUJbug6XBJ7VthI4L8ueb03JHAbky6XommYMgZB98CLlYSn0u1KcUY
	 AtSqPiQoaVGzg0m1vsC0sZyshrKIbLzrqTAOrGQ+etdOIhFdJkVg8tGFq5tBFN+Ps1QTo
	 /goHI3C8BSo9sHo7byD7c3MUA53Lfbg5Prw3oVLyQUUPVVaPcIdGtKqndMJiC2bZmrpmh
	 Dv5yRsl+b9syKTKD1Ed9kE8IzWmQZdXB384d0vr2AVt2cfvNWjLNLidCdsENgGtIC4ooB
	 284gDjR/ZHrh7D2E5QR3nyd+qGknRAMlko66SEnn+TGKBlsoJsojQdtBLU+b09ILTTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199597;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=NSb6a/pDw1kg0BISDKF7FpWlMPPEDSnf/hJXicQJYVw=;
	b=nuhEo5+AXvHnlx3GoOFfPQQlo88/7xph/Y2fB+LMVtikGmj9zdlmu6hnP9ODrthdLznt
	 nmW6dFHv79kEYKjZpFMI03NBStpEsrkipq7rh1Zmv/Q+5zFMH58r8fpdl+igULgFOXXOD
	 k2KT+NTJDArMngE3D2mPAUJqyu1ZVjG7FpiwA4rUJdPdNWpNPxdDL0ufOZZnFURkFIpAh
	 SU+W79635AMX84e+sxbpl7ba51SqXmf+ICcf1MKH/+5QHZmd7diV/bjzD4GF42Rr9qxj0
	 YexAEcjd9nHIJ6lOormwHlEJw6wSwMyM9U379s67sEFQkQ3XdpGC2fiwGn9Ci63qOnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jgUOXVxE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510A1606A31A;
	Wed, 28 Oct 2026 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jgUOXVxE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FDD1F01828;
	Wed, 28 Oct 2026 14:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793199597;
	bh=NSb6a/pDw1kg0BISDKF7FpWlMPPEDSnf/hJXicQJYVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jgUOXVxES0RtRhBDD5vjPlJx8U4HEZ7aqAILOTNCPBEbA0FgKh+iooXbxMPg1Cq9R
	 f3hVu1uOGjh9Ofeeph6srH+EuC+y9sIsXaYCQwPZ5NC7VoEqiyQ0jdQlrogzHZ68X4
	 InAkxl/K94Aq+hAu+BKTAO5BsrnPfep3MJFBPxlildgaC/SzVfIaXRdpmyb6j2e6my
	 7EoCnJwd7BO9KW5SmD1EMpig8TjfY+FAI3BMMf3mMFLU6ISeDPR9iC5e6p0PkyUbNc
	 WUmJrXE+3GL2j/1feyPSiFNmUIAIV3+zy3dIx5FZn9EZ8Rj9AaezMHVZPa+Q+9HGRb
	 o1oAR7x1gmj1Q==
Date: Wed, 28 Oct 2026 14:59:53 +0000
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 1/8] backlight: qcom-wled: fix string detection
 brightness on WLED5
Message-ID: <20261028145953.GD3605912@google.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-1-86c05068efc5@oss.qualcomm.com>
 <sashiko-outbox-177041@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-177041@kernel.org>

On Mon, 19 Oct 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] backlight: qcom-wled: wled5_set_brightness() clamps 0 to low_limit on restore

This needs a response.

> --
> 
> commit 1866e6688066844d34f7f3f1d2a0c521bb917107
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> backlight: qcom-wled: fix string detection brightness on WLED5
> 
> This commit updates wled_auto_string_detection() to use the per-version
> wled_set_brightness() callback instead of hardcoding wled4_set_brightness(),
> and moves the WLED5 module sync toggle into wled5_set_brightness().
> 
> > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > index ca350f320e177..c5243a6d547e5 100644
> > --- a/drivers/video/backlight/qcom-wled.c
> > +++ b/drivers/video/backlight/qcom-wled.c
> 
> [ ... ]
> 
> > @@ -791,7 +783,7 @@ static void wled_auto_string_detection(struct wled *wled)
> >  	}
> >  
> >  	/* Restore brightness */
> > -	rc = wled4_set_brightness(wled, wled->brightness);
> > +	rc = wled->wled_set_brightness(wled, wled->brightness);
> >  	if (rc < 0) {
> >  		dev_err(wled->dev, "Failed to set brightness after auto detection rc=%d\n",
> >  			rc);
> 
> [Severity: Medium]
> When wled_auto_string_detection() runs during probe via
> wled_probe() -> wled5_setup() -> wled_auto_detection_at_init(),
> wled_read_brightness() has not run yet, so wled->brightness is still 0.
> 
> Previously, wled4_set_brightness() only clamped non-zero brightness values:
> 
> 	/* WLED4's lower limit of operation is 0.4% */
> 	if (brightness > 0 && brightness < low_limit)
> 		brightness = low_limit;
> 
> However, wled5_set_brightness() unconditionally clamps brightness == 0 up to
> low_limit (0.1% of max_brightness):
> 
> 	/* WLED5's lower limit is 0.1% */
> 	if (brightness < low_limit)
> 		brightness = low_limit;
> 
> With this change, restoring wled->brightness (0) at the end of
> wled_auto_string_detection() on WLED5 writes and latches low_limit into the
> modulator brightness register before enabling WLED3_CTRL_REG_MOD_EN.
> 
> When wled_probe() subsequently calls wled_read_brightness():
> 
> 	rc = wled_read_brightness(wled);
> 	if (rc < 0)
> 		return rc;
> 
> 	wled->brightness = rc;
> 	...
> 	props.brightness = wled->brightness ?: val;
> 
> will it read back low_limit instead of 0, leaving ovp_irq enabled in
> wled_configure_ovp_irq() and initializing props.brightness to low_limit
> instead of default-brightness?
> 
> Should wled5_set_brightness() check brightness > 0 && brightness < low_limit
> like wled4_set_brightness() does?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com?part=1

-- 
Lee Jones
