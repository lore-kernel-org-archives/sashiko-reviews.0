Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793644297;
	b=tQdTohHd0sahlGoukR2EqY8brb4aiaws1NB0vK6zx1bOKw5kEY4MnQSb2s3LRut9avD5
	 pev8Y5QkOiXenT9KlOXsJzyAMGNKHs5yld9bTvpoaC1RNWE59u0RSNS2G3itNtzfkpnXF
	 BvfseMurvkz3i/Dy9haymYsJmCqNVBKRmUkUB+KKAz75NWS3KfTrmOJCNaYuSKZuJuiYL
	 6hnXnQBP8eTyIXrx2LZwCXQ09FdVb6RgWABOfXcTJYPn5VF6v3gFhps8cM3GGn8HYBjdj
	 Yfk56bwx5C2igX79bYD1lMNJJq+OEIdxyd9cAtWxP0QpBHVzS5DWZR+GvivE8y8LPBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793644297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=anyoS9QmIPpZgoKNSKJhW834ul+casWny8wsvVbeD+E=;
	b=ypSsW3KG6+QMl+s4QRjNwVA7lM7kAM/N+qJ2Xmr2hm7bzxkgWT3I2+uqKW8A7qIF6/Ku
	 KsUv94jr1dEvCzgtF5Q1KrhBbrnJp2Bk6HYkvSVPhEvbqimx9JXCAHfETio2FhvALtTVR
	 DhXVjuN2BLUzZYh/WpkdGLkBLfeFLKdc31qBmhXThMZCAkEv6FPXEFOr1TXil/+B7NSRr
	 GeQee5MelHVWVHd69FRXet/c4TVAO2a8Gukx5Y+EV2taYv7NQhp4XJYIBf4CW4Nt9k8KF
	 49zE4w19ft5SxjHw1q9Z83hrHr/WEFkm1ayuWcHu6h9YzL3S1Ax448ViOQj1MhNb8eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SKVOYB5W;
	arc=none smtp.remote-ip=74.125.230.195
Received: from mail-qk2-f3.google.com (mail-qk2-f3.google.com [74.125.230.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5A1606A324
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 18:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE5A1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SKVOYB5W
Received: by mail-qk2-f3.google.com with SMTP id af79cd13be357-93f25d896bbso16217685a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 10:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793644295; x=1794249095; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=anyoS9QmIPpZgoKNSKJhW834ul+casWny8wsvVbeD+E=;
        b=SKVOYB5WWiKRd50JFXHir/tI7Wu/U3HYx9ArQlwOG7Eng/61yaCzUg4S8BFry/uW7K
         V7GALU47ybGpK6Sxa1yeOaq4fud7/uvuhXe6ZPosjE4d0q7RmbuJIFYilNgggYeHtyOp
         cbgNah4E7cAboA58H3GaM3zDETpWwuNeIH4VA8ASsyDtFUEBLal9ehjOvLei84RPuqhx
         eMt4JlWfA9KbYCyb7dRpDkmIqyI9DgmCZubXVgoTYmCMcekznyWYi0ioQ7kxnZbFclyu
         1A9ZdTXQy2UsD+4QzP4qhBGw7V4yu59xu2x10ep12Y63SOfLB64gA5T7vUZvSnMqb83y
         g3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793644295; x=1794249095;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anyoS9QmIPpZgoKNSKJhW834ul+casWny8wsvVbeD+E=;
        b=m3dMVJWU3bINwJfbCMi/p1kmG1fs2pr+/uv4+WrSo0S565yxp4mrfDw2IDb/pyjAGa
         qe3dHRHoIqiBHpzxnZA1dYRlGKDbGJcGvgFntOkaSx7eA7RxXLqOJvoKC8ETcs5d4lcR
         Y5qzFac266GRyb1tf/Gmcyt4Ik5oGXhmAGv/opjg4P9vIWD1G1PzkvgbnugwwAro8qZK
         IS8AyIhNyKuFrHGzPlOi1Bc+6dsjirLoBlIce54Is195JpfrparF/umJ8lFNH+0+UjYe
         hcM3YvzA5oXl4JleC0aLhNuchKDE93jdICbMloitgaUGMOu5lWS/LOWqms/tm18sFL3N
         bMfQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0PKsHKAWAOnxX6T/yvWNFGtGzuJ05HRgW38CJxrgESBiEn51dQsVgCKyl79zQiDhD/+tFAviuSXLwd6Ezc+U=@lists.linux.dev
X-Gm-Message-State: AFq9FYKJc1B1dSxHU+n4IQOHjRQEStb2tTUOwupBJnLlWYd5hf2VGnQ4
	ZTxa0O+8DthCXDpWDTp+HjHITk/s44HOtScyiTyKGTJk6eTb/QFpJ1OL5uwL4BH6wiI=
X-Gm-Gg: AYBFou3p3zU0krztnwibZ1qZeFluOwd2UdrugOgC5g9l07pJ+9cVUjNLf0uQ+5lL+IP
	yS/OH3TgjBrWqtE6DnClCDumPwwQ9EHcUjng0jSDPzSZQK1Y2k2YqjFIqTE+a4avoQ5ey5suYrn
	PoATs/DquRXCh/N84IJA0u7xDaeLh4djpfIeCq3BTY81p88GcLCXkU53bsAMhmBB8+DlmzLZydT
	S1BVcw9TkJubkejex+pRmipAPTDZZnm3PxSPlMs2gk/u+4FXTrLXXBQ4yHi4yr020fvP8eRaq4K
	zMSVw2Yi8eZ6upaffFL9v7yGC6W61HsVbzWX5OJavpWR+81mIsKVDVBz8kXDLFxtZJheLhIpdR0
	efymRI9HKmLjXWU4PDscqbr8uEyn8aNSDiph11BdldOeA3jNDx9jEUQpDhGcOEDwbSnrkMQm+/i
	Ot1cYZQDiB/aDu90LXhfCxkdslke9sWDAQdvrUB6fK+AboaB6SJ+4xAUm+G3mZWKdnxSLrBF4Bb
	8fbC0TOp3z9jOJF12azQXSlGzJpJolZ1TDv7a3A/EH4+65JmQLzzI4oMf3n7vbRJzT2fCeHrlVO
	XFSVAMCxfjxeyhlSsR771+81YixwgdP2wqAbWodQU9uODwlVHSEqc/E=
X-Received: by 2002:a05:620a:1d06:b0:93f:16d4:3c0a with SMTP id af79cd13be357-944214cfe6emr1648027785a.4.1793644295303;
        Mon, 02 Nov 2026 10:31:35 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:34bd::c41? ([2606:6d00:11:34bd::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425aa8fc9sm886726285a.33.2026.11.02.10.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:31:34 -0800 (PST)
Message-ID: <ece80650634cec3c63f05651ab326de1d60d23c7.camel@ndufresne.ca>
Subject: Re: [media-ci] Re: [PATCH v2] media: rkvdec: Handle interrupts
 without a current context
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: linux-media@vger.kernel.org, sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org
Date: Mon, 02 Nov 2026 13:31:32 -0500
In-Reply-To: <sashiko-outbox-185268@kernel.org>
References: <20261026124808.642373-1-a.kazinsky@ideco.ru>
	 <sashiko-outbox-185268@kernel.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7/8y/MxC0rZQblNeEr6G"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0


--=-7/8y/MxC0rZQblNeEr6G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 26 octobre 2026 =C3=A0 13:07 +0000, sashiko-bot@kernel.org a =C3=
=A9crit=C2=A0:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] media: rkvdec: early !ctx return in IRQ handlers skips rkvdec_io=
mmu_restore()
> --
>=20
> commit 76a8e6d477d878ff7b196f0bd2f1dea7df5256ee
> Author: Alex Kazinsky <a.kazinsky@ideco.ru>
>=20
> media: rkvdec: Handle interrupts without a current context
>=20
> This commit passes the rkvdec_dev pointer directly to the variant interru=
pt
> handlers and returns early after clearing the interrupt status if the cur=
rent
> v4l2_m2m context is NULL. This prevents a NULL pointer dereference if the
> watchdog finishes the current job before the threaded interrupt handler r=
uns.
>=20
> > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/=
media/platform/rockchip/rkvdec/rkvdec.c
> > index fbcd0f175ad3f..fac7b49a41864 100644
> > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > @@ -1434,15 +1434,18 @@ static void rkvdec_iommu_restore(struct rkvdec_=
dev *rkvdec)
> >  	}
> >  }
> > =20
> > -static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
> > +static irqreturn_t rk3399_irq_handler(struct rkvdec_dev *rkvdec,
> > +				      struct rkvdec_ctx *ctx)
> >  {
> > -	struct rkvdec_dev *rkvdec =3D ctx->dev;
> >  	enum vb2_buffer_state state;
> >  	u32 status;
> > =20
> >  	status =3D readl(rkvdec->regs + RKVDEC_REG_INTERRUPT);
> >  	writel(0, rkvdec->regs + RKVDEC_REG_INTERRUPT);
> > =20
> > +	if (!ctx)
> > +		return IRQ_HANDLED;
> > +
> >  	if (status & RKVDEC_RDY_STA) {
> >  		state =3D VB2_BUF_STATE_DONE;
> >  	} else {
> > @@ -1457,9 +1460,9 @@ static irqreturn_t rk3399_irq_handler(struct rkvd=
ec_ctx *ctx)
> >  	return IRQ_HANDLED;
> >  }
> > =20
> > -static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
> > +static irqreturn_t vdpu381_irq_handler(struct rkvdec_dev *rkvdec,
> > +				       struct rkvdec_ctx *ctx)
> >  {
> > -	struct rkvdec_dev *rkvdec =3D ctx->dev;
> >  	enum vb2_buffer_state state;
> >  	bool need_reset =3D 0;
> >  	u32 status;
> > @@ -1467,6 +1470,9 @@ static irqreturn_t vdpu381_irq_handler(struct rkv=
dec_ctx *ctx)
> >  	status =3D readl(rkvdec->regs + VDPU381_REG_STA_INT);
> >  	writel(0, rkvdec->regs + VDPU381_REG_STA_INT);
> > =20
> > +	if (!ctx)
> > +		return IRQ_HANDLED;
> > +
> >  	if (status & VDPU381_STA_INT_DEC_RDY_STA) {
> >  		state =3D VB2_BUF_STATE_DONE;
> >  	} else {
> > @@ -1486,9 +1492,9 @@ static irqreturn_t vdpu381_irq_handler(struct rkv=
dec_ctx *ctx)
> >  	return IRQ_HANDLED;
> >  }
> > =20
> > -static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
> > +static irqreturn_t vdpu383_irq_handler(struct rkvdec_dev *rkvdec,
> > +				       struct rkvdec_ctx *ctx)
> >  {
> > -	struct rkvdec_dev *rkvdec =3D ctx->dev;
> >  	enum vb2_buffer_state state;
> >  	bool need_reset =3D 0;
> >  	u32 status;
> > @@ -1499,6 +1505,9 @@ static irqreturn_t vdpu383_irq_handler(struct rkv=
dec_ctx *ctx)
> >  	writel(FIELD_PREP_WM16(VDPU383_INT_EN_IRQ | VDPU383_INT_EN_LINE_IRQ, =
0),
> >  	       rkvdec->link + VDPU383_LINK_INT_EN);
> > =20
> > +	if (!ctx)
> > +		return IRQ_HANDLED;
>=20
> [Severity: High]
> Does returning early on !ctx in rk3399_irq_handler(), vdpu381_irq_handler=
(),
> and vdpu383_irq_handler() in drivers/media/platform/rockchip/rkvdec/rkvde=
c.c
> skip a required rkvdec_iommu_restore(rkvdec) call when a hardware error o=
r
> timeout races with rkvdec_watchdog_func()?
>=20
> When a decoding error or hardware timeout triggers a self-reset (setting
> RKVDEC_SOFTRESET_RDY in RKVDEC_REG_INTERRUPT on RK3399,
> VDPU381_STA_INT_SOFTRESET_RDY | VDPU381_STA_INT_TIMEOUT |
> VDPU381_STA_INT_ERROR in VDPU381_REG_STA_INT on VDPU381, or leaving
> VDPU383_STA_INT_DEC_RDY_STA clear in VDPU383_LINK_STA_INT on VDPU383) and
> rkvdec_watchdog_func() finishes the job before rkvdec_irq_handler() calls
> v4l2_m2m_get_curr_priv(), ctx is NULL:
>=20
> drivers/media/platform/rockchip/rkvdec/rkvdec.c:rk3399_irq_handler() {
> 	status =3D readl(rkvdec->regs + RKVDEC_REG_INTERRUPT);
> 	writel(0, rkvdec->regs + RKVDEC_REG_INTERRUPT);
>=20
> 	if (!ctx)
> 		return IRQ_HANDLED;
>=20
> 	if (status & RKVDEC_RDY_STA) {
> 		state =3D VB2_BUF_STATE_DONE;
> 	} else {
> 		state =3D VB2_BUF_STATE_ERROR;
> 		if (status & RKVDEC_SOFTRESET_RDY)
> 			rkvdec_iommu_restore(rkvdec);
> 	}
>=20
> 	if (cancel_delayed_work(&rkvdec->watchdog_work))
> 		rkvdec_job_finish(ctx, state);
>=20
> 	return IRQ_HANDLED;
> }
>=20
> Because rkvdec_watchdog_func() does not restore the IOMMU and the interru=
pt
> handlers clear the status register before returning on !ctx, the IOMMU do=
main
> mappings are never restored, breaking subsequent decoding jobs.
>=20
> Since rkvdec_iommu_restore() only needs rkvdec, and ctx is only used by
> rkvdec_job_finish() when cancel_delayed_work(&rkvdec->watchdog_work) retu=
rns
> true, should the status check and rkvdec_iommu_restore(rkvdec) still run =
even
> when ctx is NULL?

This is plausible, but I don't think the following action in place in the
software watchdog is enough to cancel a stalled decoding:

	writel(RKVDEC_IRQ_DIS, rkvdec->regs + RKVDEC_REG_INTERRUPT);

It only prevents some late IRQ (but not all) from triggering. But next time=
 you
try and program the IP, it sill running in the background, and the request =
will
likely fail and timeout again. It will only recover once the IP have gone
through a power cycle. Its even a bit more worrying, since with
sw_dec_clkgate_e, some mmio may hit some gated portion of the IP, causing a=
 CPU
hang. Intuitively, sw_softrst_en_p should be used somehow, otherwise a hard
reset.

Bottom line, I think fixing what sashiko reports here should be handled
separately. The provided patch cleanly fix the ciritical aspect of the issu=
es,
which is a kernel oops. The fact that software watchdog recovery is weakly
implement seems like a separate issue.

Nicolas

>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026124808.64=
2373-1-a.kazinsky@ideco.ru?part=3D1
> _______________________________________________
> media-ci mailing list -- media-ci@linuxtv.org
> To unsubscribe send an email to media-ci-leave@linuxtv.org

--=-7/8y/MxC0rZQblNeEr6G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujXBAAKCRDZQZRRKWBy
9MskAQD3b7gS95y43eTYkWaXgC41xSrlUpJg5C8FGUwOKgM3JQD8Dp3EDO4MM3Ur
30iTd40oHKcGEJFmSsnCcYdEqWZwsAI=
=R8vE
-----END PGP SIGNATURE-----

--=-7/8y/MxC0rZQblNeEr6G--
