Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8DA318EC4
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 21:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717406; cv=none; b=kWNYBVsZ3YkysLGuoLd9Z+HifzgeWNP7ZqW7RCD//J8y7WRoO1E0YfYeOC6HNkE375YEi1lLhk6jIgp0/scpLGy1em9kyuMOcbf5Fb5x2drL+EiiHuMqa1io3Yfw80B1T/3tInJiyOvJnJBhZQjQWbM+w7ZwK80u/+dsKaIRTZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717406; c=relaxed/simple;
	bh=UuINZYU2qBG2qOfy+aG2hiy+Y3ZKTtMJs8nI6LhsJZo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jnsCx0QrJm6anlR1bkg1LxQaRB3sYC/S7qbUq66gYHaqrwt3/K2CDPZZC1vgzoY28aPDn2lhvYTTsU9EJsK1VPpa4AzXioPTg0eOO1jn58SQOSidfqi6QTLS4/IZ4Bo4GamZxoR0BTmrZlGST2G6SssbCEHKqLjFiLj8Hu+9JjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=vihNd/Q5; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="vihNd/Q5"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-73720e58dafso693195137.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 14:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1783717403; x=1784322203; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3oAW2HPCqHJuPf3glJ9yHtHXppBEBUHxayiVr2N8Uxo=;
        b=vihNd/Q58FHxEWLtf31NKLIFYXw1EGLtTDSK0cewueomOCQrFVWC97bvujR9XydnC+
         8w3ekRyIVmJh52nPAU2i89geoOJaok1gtlGKnpAEAsp9K2lTI4fa4l/tpfcGJeiGKr4s
         2g5Ml4u35TuCYbCSneHa9nXqHKam6AaveriLROBbv8tVKdRI3bGSx8miUGJrWfrDnn2q
         1B0GIE4pGTkXfbl2nU+7xg2ShjH2+jQe02kBQNBPvQlOl3tTrzT5Mw6W8EbmknHvDroF
         QkmWCLpEN18Pe5lGMFftvz0Oa0j7icWhz/MXA0uUwdhVsDTeg3IuGQwgDzfPhC7W55r/
         VXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717403; x=1784322203;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oAW2HPCqHJuPf3glJ9yHtHXppBEBUHxayiVr2N8Uxo=;
        b=PtfuVaqAToCvCzVxgEHx+mwe4whsbza+yqFZ+zMXV+x0v0CxiVZCABDPQfmyzoBl6o
         dD+4A01k2Mg3VTGsoleB6gJs5enoZPADbnd8SdGX2cLfN7iD51v8g78MDo+w9oVhPE8Z
         W+i/TBnEHrM91uK9OnKy8e6HDha49DmGtTGQSE+pQBhMCAY+vCnjxLS95wFqO7mRKxdD
         2s9KBVNRvho67fe+/LjcNDZ3lUReCYnWEzktnc4DA+ANAiDlS8/wzMoWIxjgv5/udD5R
         m1YgBzrbuyjd37ZWzeNrHbtOzjGIJwyIwssHny6XnhaFPNTjCM8ZHw9N+K3jIVu3SdYQ
         wgZg==
X-Gm-Message-State: AOJu0YydcLZZIh3GIEkMdzzsUfpzq+oFmjWvtkB/LdyEDV7qeVaIr+u9
	9qu6fuMN+U/6XOrgvmkvZHA/p91GsYiSmObXGOOlGEohRetntL3mzHfGo0DuhtAlv+smCl9g4mb
	TM+Kjq6E=
X-Gm-Gg: AfdE7ckhfzcThHjX+4rAZtt4Y6e+x5zjMqLFwN45/yLoOsPc84s3Zaw9DMbMJaz9utU
	w1JaHNk2Rth4x1jI9p4WKV+rCDjr48dXKF+cu7RoAih61cEiut4VKwlod3Kq5tcjZbor1np0si2
	UhHkaiygCYxEQshdZA+E7S2U0B/0DN5E1LFcRt70Ckdsct+xZdjU1yHiCb8DbR8wcsoWQ3put73
	sEmZR/GckDJBz8KWZ2gW7oj/8yUx9/doPKES0M+YfLDqVwsK2vUqpUVyJrsBT/xVRbg71PbPT3W
	6P7V27lE9Wyc7Zi6DHqE2VF+C8jBVwkOkUaM7Luq5U+63L2aBIfbFc4w7QrPWAVwa7sBmey+M96
	EcIl+A2W3FXZqGJ6AJRiWJ45P27XHMYI5HqYoXmIyClleVIyajpvySnMtA8hRSdjun0WhDXT3k9
	HgCnOGvTrCs0NsM51QAA==
X-Received: by 2002:a05:6102:e14:b0:631:26f6:7022 with SMTP id ada2fe7eead31-74533e42448mr568766137.23.1783717403226;
        Fri, 10 Jul 2026 14:03:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6e38b3bsm5878777137.10.2026.07.10.14.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:03:22 -0700 (PDT)
Message-ID: <897e5af14729bfe3723af1797bc83c6edb677c8d.camel@ndufresne.ca>
Subject: Re: [PATCH 08/17] media: rockchip: rga: add rga_core structure
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: sashiko-reviews@lists.linux.dev, Sven =?ISO-8859-1?Q?P=FCschel?=
	 <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Date: Fri, 10 Jul 2026 17:03:20 -0400
In-Reply-To: <20260605222234.6930A1F00893@smtp.kernel.org>
References: <20260606-spu-rga3multicore-v1-8-3ec2b15675f7@pengutronix.de>
	 <20260605222234.6930A1F00893@smtp.kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-V33ouVo1ZNZ1mFo4d/hx"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-V33ouVo1ZNZ1mFo4d/hx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 05 juin 2026 =C3=A0 22:22 +0000, sashiko-bot@kernel.org a =C3=
=A9crit=C2=A0:
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
>=20
> New issues:
> - [High] Missing NULL pointer check for devm_kzalloc allocation

There is a lot of noise coming from Sashiko, but this one needs fixing.

cheers,
Nicolas

>=20
> Pre-existing issues:
> - [High] Shared IRQ handler accesses suspended hardware and dereferences =
NULL context
> - [High] Missing synchronize_irq() in runtime suspend with shared interru=
pts
> - [High] Race condition between pm_runtime_enable and platform_set_drvdat=
a
> - [High] Use-After-Free during module removal due to incorrect teardown o=
rdering
> --
>=20
> commit 1e1c3cc644587ad2255c5349765b3893e811a0e9
> Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> media: rockchip: rga: add rga_core structure
> =C2=A0=C2=A0=C2=A0=20
> Add a rga_core structure to separate the core specific data from the
> m2m device. This is done in preparation for multi-core support.
>=20
> > diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/med=
ia/platform/rockchip/rga/rga-hw.c
> > --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> > +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
>=20
> [ ... ]
>=20
> > @@ -447,36 +447,34 @@ static void rga_hw_setup_cmdbuf(struct rga_ctx *c=
tx)
> > -static bool rga_handle_irq(struct rockchip_rga *rga)
> > +static bool rga_handle_irq(struct rga_core *core)
> > =C2=A0{
> > =C2=A0	int intr;
> > =C2=A0
> > -	intr =3D rga_read(rga, RGA_INT) & 0xf;
> > +	intr =3D rga_read(core, RGA_INT) & 0xf;
> > =C2=A0
> > -	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
> > +	rga_mod(core, RGA_INT, intr << 4, 0xf << 4);
> > =C2=A0
> > =C2=A0	return intr & RGA_INT_COMMAND_FINISHED;
> > =C2=A0}
>=20
> [Severity: High]
> This is a pre-existing issue, but does this handle spurious interrupts
> correctly when the hardware is suspended?
>=20
> If an interrupt arrives on the shared IRQ line while the device is suspen=
ded,
> the clock-gated hardware typically returns 0xffffffff for rga_read(). The
> bitwise AND with RGA_INT_COMMAND_FINISHED will incorrectly evaluate to tr=
ue.
>=20
> The handler would then proceed in rga_isr():
>=20
> =C2=A0=C2=A0=C2=A0 struct rga_ctx *ctx =3D core->curr;
> =C2=A0=C2=A0=C2=A0 WARN_ON(!ctx);
> =C2=A0=C2=A0=C2=A0 core->curr =3D NULL;
> =C2=A0=C2=A0=C2=A0 src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>=20
> If no job is active, core->curr is NULL, and dereferencing ctx->fh.m2m_ct=
x
> will cause a kernel panic. Should we verify the PM state before hardware
> access in the ISR using pm_runtime_get_if_active()?
>=20
> > diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/=
platform/rockchip/rga/rga.c
> > --- a/drivers/media/platform/rockchip/rga/rga.c
> > +++ b/drivers/media/platform/rockchip/rga/rga.c
>=20
> [ ... ]
>=20
> > @@ -799,20 +803,25 @@ static int rga_probe(struct platform_device *pdev=
)
> > =C2=A0	if (!rga->hw)
> > =C2=A0		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match =
data\n");
> > =C2=A0
> > -	rga->dev =3D &pdev->dev;
> > =C2=A0	spin_lock_init(&rga->ctrl_lock);
> > =C2=A0	mutex_init(&rga->mutex);
> > =C2=A0
> > -	ret =3D rga_parse_dt(rga);
> > +	core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> > +	core->rga =3D rga;
> > +	core->dev =3D &pdev->dev;
>=20
> [Severity: High]
> Could this lead to a NULL pointer dereference? If devm_kzalloc() fails an=
d
> returns NULL, assigning core->rga =3D rga in the next line will immediate=
ly
> crash. A check like "if (!core) return -ENOMEM;" appears to be missing he=
re.
>=20
> > +
> > +	rga->cores[0] =3D core;
> > +
> > +	ret =3D rga_parse_dt(core);
> > =C2=A0	if (ret)
> > =C2=A0		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\=
n");
> > =C2=A0
> > -	pm_runtime_set_autosuspend_delay(rga->dev, 50);
> > -	pm_runtime_enable(rga->dev);
> > +	pm_runtime_set_autosuspend_delay(core->dev, 50);
> > +	pm_runtime_enable(core->dev);
> > =C2=A0
> > -	rga->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > -	if (IS_ERR(rga->regs)) {
> > -		ret =3D PTR_ERR(rga->regs);
> > +	core->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(core->regs)) {
> > +		ret =3D PTR_ERR(core->regs);
> > =C2=A0		goto err_put_clk;
> > =C2=A0	}
>=20
> [ ... ]
>=20
> > @@ -852,7 +861,7 @@ static int rga_probe(struct platform_device *pdev)
> > =C2=A0	video_set_drvdata(vfd, rga);
> > =C2=A0	rga->vfd =3D vfd;
> > =C2=A0
> > -	platform_set_drvdata(pdev, rga);
> > +	platform_set_drvdata(pdev, core);
>=20
> [Severity: High]
> This is a pre-existing issue, but does this create a race condition windo=
w
> between pm_runtime_enable() and platform_set_drvdata()?
>=20
> If a PM transition occurs right after pm_runtime_enable(core->dev), the
> runtime PM callbacks like rga_runtime_suspend() might execute before
> platform_set_drvdata(pdev, core) is called.
>=20
> In rga_runtime_suspend(), dev_get_drvdata() would return NULL, leading to=
 a
> crash when attempting to access core->num_clks.
>=20
> [ ... ]
>=20
> > @@ -904,23 +914,23 @@ static void rga_remove(struct platform_device *pd=
ev)
> > =C2=A0	video_unregister_device(rga->vfd);
> > =C2=A0	v4l2_device_unregister(&rga->v4l2_dev);
> > =C2=A0
> > -	pm_runtime_disable(rga->dev);
> > +	pm_runtime_disable(core->dev);
> > =C2=A0}
>=20
> [Severity: High]
> This is a pre-existing issue, but could this teardown sequence result in =
a
> use-after-free vulnerability?
>=20
> Calling v4l2_m2m_release(rga->m2m_dev) (which occurs just before the quot=
ed
> lines) before video_unregister_device() leaves the video node accessible =
to
> userspace after the m2m_dev structure has been freed. Concurrent V4L2 ioc=
tls
> from userspace might then interact with freed memory.
>=20
> > =C2=A0static int __maybe_unused rga_runtime_suspend(struct device *dev)
> > =C2=A0{
> > -	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> > +	struct rga_core *core =3D dev_get_drvdata(dev);
> > =C2=A0
> > -	clk_bulk_disable_unprepare(rga->num_clks, rga->clks);
> > +	clk_bulk_disable_unprepare(core->num_clks, core->clks);
> > =C2=A0
> > =C2=A0	return 0;
> > =C2=A0}
>=20
> [Severity: High]
> This is a pre-existing issue, but are we missing a call to synchronize_ir=
q()
> before powering down the hardware?
>=20
> Since the driver can request a shared interrupt line (IRQF_SHARED), disab=
ling
> the clocks without waiting for mid-flight IRQ handlers to finish might re=
sult
> in bus errors or crashes if another device triggers the shared IRQ while
> suspending.

--=-V33ouVo1ZNZ1mFo4d/hx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalFeGQAKCRDZQZRRKWBy
9MhqAQCROVYKKOk47bRr3kw9ylc9GXlY/LfDmnIfsYtUzcmv4QEAjvKH0y9f5muL
HGNmwOyigTAhQOLXl6fe+Fm/IuzA5A0=
=ndJF
-----END PGP SIGNATURE-----

--=-V33ouVo1ZNZ1mFo4d/hx--
