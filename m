Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0203F3290
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800982; cv=none; b=KHYeL1lBxvH6XNnwyn/Fp7iuHOBzj9jgulj+zrFwuNWin6qMNqSzeR50p9OU0Cb+r/9Z1cF8Q4pja8aeIFpRMqE88DpukEZL+8iVUtP2F7UJtugPscsdBZioM1pMsBha+g8gije+XVWE6ATh3Pp4VC/VehRGuPPBB8PVU+OJwXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800982; c=relaxed/simple;
	bh=QowNg1ICKmR00ZMLfP8DwQg+7z7WOn8M28TVgCrVnVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lAQHdGdFF9lqki7tW9WY/FSnhSrkAI+2Ixyi+S34m1QcHq5OhHeYFiXN1QRCC+qexZ06yyDbvJ0iwWxPGWeB/KknFv7XLQ8JlepcpFw8lohH+10pof/1iBoesHXoYk6nMSTmC4zfQthJeSFW0B86AGxSm8FilXPooVrGCQ9CbrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RDh7jmjL; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RDh7jmjL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B218F1A11A5;
	Thu, 23 Jul 2026 10:02:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 86151602B8;
	Thu, 23 Jul 2026 10:02:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5CFD11C10330;
	Thu, 23 Jul 2026 12:02:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784800970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=PUgVr3xoru84whxS4+qfYYSdvhcNRo2BGQ0ueQFurr4=;
	b=RDh7jmjLz//6vilz+TPdxwKpSpmULC1wyXsKIo8s58UDJRlBjial0BbpkcDcFZjXMYF/WJ
	SjnxCHxRcZ6G0F/9aRjdPm8dfq6TsxdOerzq3N/DZwGw/oDRBToKTx9yVsrZxpAntcHbn1
	yNAlpm+oK3w0sMi+BfwXzOMPLf9AafjqzRbxA8Vq+V2mEwcAKnczPIMBFl3j81M4YutB/w
	KoMilsauvm+tLwh9VxdpHFy9aYVqlQ1530MpSBQjT+utYRwQRvI78Y63UkDzlw+rGXD4GJ
	V0+MKYp0ESGff8pujDhqtPgAeJAksPphp2iAOUUpho9n3mtGfBSZo384Zib8dw==
From: Romain Gantois <romain.gantois@bootlin.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject:
 Re: [PATCH v3 1/2] drm/logicvc: Avoid use-after-free with devm_kzalloc()
Date: Thu, 23 Jul 2026 09:53:49 +0200
Message-ID: <cV8thpNMTuqGECHamaJsPw@bootlin.com>
In-Reply-To: <20260722100029.27C861F000E9@smtp.kernel.org>
References:
 <20260722-logicvc-uaf-v3-0-f3b2319d58a6@bootlin.com>
 <20260722-logicvc-uaf-v3-1-f3b2319d58a6@bootlin.com>
 <20260722100029.27C861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartL3BGsdYcRdmZW2Iw6n2zNw";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Last-TLS-Session-Version: TLSv1.3

--nextPartL3BGsdYcRdmZW2Iw6n2zNw
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Date: Thu, 23 Jul 2026 09:53:49 +0200
Message-ID: <cV8thpNMTuqGECHamaJsPw@bootlin.com>
In-Reply-To: <20260722100029.27C861F000E9@smtp.kernel.org>
MIME-Version: 1.0

On Wednesday, 22 July 2026 12:00:28 CEST sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider: - [High] The local variable `bridge` is passed to
> `drm_of_find_panel_or_bridge()` without initialization, leading to a crash
> when the function returns an error without setting it. --
> 
> --- Patch [1]: [PATCH v3 1/2] drm/logicvc: Avoid use-after-free with
> devm_kzalloc() --- commit 95ef468f51e9bfed648e230bd616663ec7bac106
> Author: Romain Gantois <romain.gantois@bootlin.com>
> 
> drm/logicvc: Avoid use-after-free with devm_kzalloc()
> 
> This commit transitions the panel, CRTC, and encoder objects to DRM-managed
> allocations. It removes devm_kzalloc usages in order to fix a use-after-free
> bug.
> 
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.c
> > b/drivers/gpu/drm/logicvc/logicvc_interface.c ---
> > a/drivers/gpu/drm/logicvc/logicvc_interface.c
> > +++ b/drivers/gpu/drm/logicvc/logicvc_interface.c
> > @@ -147,36 +143,35 @@ int logicvc_interface_init(struct logicvc_drm
> > *logicvc)>
> > 
> >  	int encoder_type = logicvc_interface_encoder_type(logicvc);
> >  	int connector_type = logicvc_interface_connector_type(logicvc);
> >  	bool native_connector = logicvc_interface_native_connector(logicvc);
> > 
> > +	struct drm_bridge *bridge;
> > +	struct drm_panel *panel;
> > 
> >  	int ret;
> > 
> > -	interface = devm_kzalloc(dev, sizeof(*interface), GFP_KERNEL);
> > -	if (!interface) {
> > -		ret = -ENOMEM;
> > -		goto error_early;
> > -	}
> > -
> > -	ret = drm_of_find_panel_or_bridge(of_node, 0, 0, &interface-
>drm_panel,
> > -					  &interface->drm_bridge);
> > +	ret = drm_of_find_panel_or_bridge(of_node, 0, 0, &panel,
> > +					  &bridge);
> > 
> >  	if (ret == -EPROBE_DEFER)
> > 
> > -		goto error_early;
> 
> [Severity: High]
> Are panel and bridge guaranteed to be initialized if this call fails?
> 
> When drm_of_find_panel_or_bridge() returns an error like -ENODEV (which
> is valid for native DVI connectors without an OF graph), it might not
> initialize these variables. Previously, interface was allocated with
> devm_kzalloc(), so they were safely initialized to NULL. Now, they are
> uninitialized stack variables.
> 
> > -	ret = drm_encoder_init(drm_dev, &interface->drm_encoder,
> > -			       &logicvc_encoder_funcs, encoder_type, NULL);
> > -	if (ret) {
> > +	interface = drmm_encoder_alloc(drm_dev, struct logicvc_interface,
> > drm_encoder, +				       NULL, encoder_type, 
NULL);
> > +	if (IS_ERR(interface)) {
> > 
> >  		drm_err(drm_dev, "Failed to initialize encoder\n");
> > 
> > -		goto error_early;
> > +		return PTR_ERR(interface);
> > 
> >  	}
> > 
> > +	interface->drm_panel = panel;
> > +	interface->drm_bridge = bridge;
> 
> [Severity: High]
> Could this assignment cause a crash later during driver initialization?
> 
> If drm_of_find_panel_or_bridge() returned -ENODEV, bridge will contain
> stack garbage. Later in logicvc_interface_init(), the code evaluates
> if (interface->drm_bridge) and calls drm_bridge_attach(), which would
> dereference this uninitialized pointer and trigger a kernel panic.

Indeed, these two stack variables need to be initialized to NULL.

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPartL3BGsdYcRdmZW2Iw6n2zNw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETFOGm0tqZfYwVxBymGofZEoxB4MFAmphyI0ACgkQmGofZEox
B4O0hQ/9GIq1yFYGDRWcAHes/JCkM4TcBm0noQYQkwd9CUQaPMGNJPjYfbmbTquY
da3Ab3Cq9E7VPJK9m+M5mXJT1OmDoTuzge38h6lxzoDT00qtlqWxxDKG51C96YPO
m9K67qKwQvPFFkC6Zo7ZoAlNM087HFLhS6bg8hx0ls2OyayLtJnenm+Twv9te3aG
sz3iqI85z2ff77wPVzSYBPhvAPIC0djjbTvQ6n5uG6cGS0P+lhGWf+1aGc0JMN4e
5X30+b1AS8vTISswmEOafAyDFxNaxg2v//lQHPDporpzFsHuNpOvz6ZYhbudGgKE
rLk0pucfspcLeHalfghacWK9UAh2n6H1X0M1ggmbsuVnJK2nBxYw+SvLWmF73G+T
WX+UA9NRAES2wMpM19HOlr3FKSQutKAksnGlhVg7lFWBFmEm9pqQntyh4S+rjx1O
UQWus4SYkSPBQNVaEPfYWInL5pNvOZMsPEDvvsIOa0CtA+xv7XD0q9Fyw51jXCso
SokFPx0h3YDobfnOCpt6TcYtu81VT8h2lC5qOu8Z6z5652Ji59whkfNw3glZCqqD
vqKFMSvlvMqRtOeNZLERcrzjjGFJSKu6STnt3lgG3RT9rdbrPmiA7CKph9FMb5oN
5jCy2h9RjSEtrGj+Cx93fzpDgZBTKyapxHIPAw6KQs/P/OIQ2Po=
=t1LC
-----END PGP SIGNATURE-----

--nextPartL3BGsdYcRdmZW2Iw6n2zNw--



