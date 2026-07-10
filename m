Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB873358C4
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 21:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717525; cv=none; b=m4+fXl8FwSud72o7TGHu2ehDjpdNlFcyQadLxIVAmsQXsXOsDaJCUisHVBVF/i0yIZZhBP6/wsO/j5qCf5t8DJbc4SQ88ncz4QCnTeywOs3XBSSYK/YkBsEvyz2+lRWrMCbBdoKGCsyPvMRX3n7dZXPD6/N+BqPqg/lyVLhHGrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717525; c=relaxed/simple;
	bh=FTZWWjRhWDfYbUZdVlv5lAyKBGf81/olpriaG8gMRgA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a+QtSGe2ymWw0883oeUyERsJy/+O5BhwVh5bPVVr8u8EeID/Gn7EozybkVoJr/7p60nTzI7SWdnoaI8GTFfGiWlTJnwJnRCR1fTh12nfjN8XSbvUwTw/TBGWEWYVu4W9NGt+2fRA6WKAQMF6oJQ8huqDB/PDTiPTYJYSJ/mmjdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=Bn6f9cRT; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="Bn6f9cRT"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfaa014978so438680e0c.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 14:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1783717523; x=1784322323; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fzdRgw5D47A6vc4awRc8DLJJmN1O3Mb0gJhGI5I9fBI=;
        b=Bn6f9cRTWz2lBj1LGdons3aVPDc6k/1PQ7e+uHOzzhZn3k0v6uOFFFrpr6UH/QNfM8
         iJ+VDSaVx5kv/9n+lRR/6CTpkaW3nUy4xoubSxq2XCYRPIwK90nLkwF+lV2zMV9Z3yVc
         FAHY925C+/qpgYNusCiX4T2tJ3YsfP6C3CvBl01Kd5aaqm4kUkYaJamvG5uzdyjDfPeB
         E2/+PGQHLU1V4Hznf0Jb5QnP6fHF5jZ1Ge5sQYWX8qHQiJJxght1HaDRVSqYUJCGH6yP
         U4JhCAy9iC/PJTptuJ3vK9IcvAfwrxrmTHiqFDyPKp3DnFNRN/ry0xJqICd5Hvdw8Y0C
         QreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717523; x=1784322323;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzdRgw5D47A6vc4awRc8DLJJmN1O3Mb0gJhGI5I9fBI=;
        b=PF4xKGwi+L9MDl+pbEStTNM9uPEYwGh/vg0QEy2J9qwLZafZ2XA9TicQm+EXt8kowK
         bjSFsGS1V3UunJbsy+mSYucToqVM1kiU3rGvdmhTlksxGiSm4WzOwxeLZe8d08AXo/7B
         XiNxz2G5S3DECRbqDXvYu8unEdO/DGnShjz2pEuT68V2Ua1M8x1x4osqa+VI+ZN6uh0K
         eS4DENEN+ujLBWGs8KNZb/S4vHpL5p5Dd3rfhMV7zQuSM1tn85id4pS7Jk5kp8YRY86T
         2rSVcSmg5pFlva0QmbhywEo18yReEVYd++JjGR2r/UGym8ALY3wsrv55wLveZl1eROpV
         +12w==
X-Gm-Message-State: AOJu0Ywbhq3vcx5bfYkKMoWNMrmHb6HmbW4xke82b1EQgBi1xjl7zg3a
	REezNlwrLNO+5cmMUlyOwYD54r5G3R0DzIlJc4EFTtQ9cSbhtc9zyAFLDetzYTkq6fjbC0vWzQT
	5D/0Bh+c=
X-Gm-Gg: AfdE7cmm1f8E3CNEhzSNevjrn1qXMa/jc10byDVSQiPMwqsIZvS9kUQzRRnwnIZpK/R
	d0tRzv2lP0uGMwJ8s4Y0ard/gK0AoG9zqhjzGTllv1cbmDmXbF8W9qEcHo/chaOYg56bA51/roY
	wpKDbONNOUj/PwiQkI/+ZK7M4vP7LlGukibW8pOvA0ECK5JeiZPv1Zh050wROo2S2ks4XfmazHB
	es58BXgqExRj3WGlhkE+VF/2jcLXlosY/ikMVVpEMWMTbUPWKbELwED/xeUp3g/7SwdFCHVmfp8
	k5YFgGHe/ehw3bxUbKf/TJIFO4iXVIL+0GqyVBPzBHVZkWE0f7bpIz1McHOrRsDQs9mnvCNKTkl
	GAjnLdnq+u+oYBWqczlriX+zkI99VYMnN1f0q2z3W/si5KEBj250cHIusycv8xQRgIiMUdnPZkf
	TZEl5cl6jrD4Wipy8JAw==
X-Received: by 2002:a05:6122:83f2:b0:5bf:bb2c:1325 with SMTP id 71dfb90a1353d-5bfbf2b3c14mr551931e0c.11.1783717522463;
        Fri, 10 Jul 2026 14:05:22 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f66bdfesm6547770e0c.6.2026.07.10.14.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:05:21 -0700 (PDT)
Message-ID: <54627c5dcc9d0f8318163dfa63ddca9f3c3a0845.camel@ndufresne.ca>
Subject: Re: [PATCH 12/17] media: rockchip: rga: move core initialization
 from bind to probe
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: sashiko-reviews@lists.linux.dev, Sven =?ISO-8859-1?Q?P=FCschel?=
	 <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Date: Fri, 10 Jul 2026 17:05:20 -0400
In-Reply-To: <20260605222016.84C581F00893@smtp.kernel.org>
References: <20260606-spu-rga3multicore-v1-12-3ec2b15675f7@pengutronix.de>
	 <20260605222016.84C581F00893@smtp.kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-1IFg3XQG4ab9EwEqwNVw"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-1IFg3XQG4ab9EwEqwNVw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 05 juin 2026 =C3=A0 22:20 +0000, sashiko-bot@kernel.org a =C3=
=A9crit=C2=A0:
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
>=20
> New issues:
> - [High] NULL pointer dereference in `rga_isr()` due to early shared IRQ =
registration.

Not really applicable to this type of HW.

> - [Medium] Missing `pm_runtime_disable()` on `component_add()` error path=
.

relevant.

Nicolas

>=20
> Pre-existing issues:
> - [High] Unprotected hardware access in shared interrupt handler.
> - [High] Missing `synchronize_irq()` in runtime suspend for shared IRQs.
> - [High] Use-After-Free when the master device is unbound.
> - [High] Missing NULL check for `devm_kzalloc` allocation.
> --
>=20
> commit 8a3476b206ac8426da5cf08410222d4a74238c92
> Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> media: rockchip: rga: move core initialization from bind to probe
>=20
> This commit moves the core initialization from the core binding function =
to
> the core probing function to better match the actual initialization seque=
nce.
>=20
> > diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/=
platform/rockchip/rga/rga.c
> > index 952377ae467f5..0413b8518dfc8 100644
> > --- a/drivers/media/platform/rockchip/rga/rga.c
> > +++ b/drivers/media/platform/rockchip/rga/rga.c
>=20
> [ ... ]
>=20
> > @@ -740,21 +740,49 @@ static int rga_parse_dt(struct rga_core *core)
> > =C2=A0
> > =C2=A0static int rga_core_probe(struct platform_device *pdev)
> > =C2=A0{
> > =C2=A0	struct rga_core *core;
> > =C2=A0	const struct rga_hw *hw;
> > =C2=A0	int ret =3D 0;
> > =C2=A0	int irq;
> > =C2=A0
> > =C2=A0	if (!pdev->dev.of_node)
> > =C2=A0		return -ENODEV;
> > =C2=A0
> > +	hw =3D of_device_get_match_data(&pdev->dev);
> > +	if (!hw)
> > +		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\=
n");
> > +
> > =C2=A0	core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> > -	core->rga =3D rga;
> > =C2=A0	core->dev =3D &pdev->dev;
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but does this devm_kzalloc()
> allocation need a null pointer check?
>=20
> If the allocation fails under memory pressure, the immediate assignment t=
o
> core->dev =3D &pdev->dev will cause a null pointer dereference.
>=20
> [ ... ]
>=20
> > @@ -775,7 +803,7 @@ static int rga_core_bind(struct device *dev, struct=
 device *master, void *data)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	ret =3D devm_request_irq(core->dev, irq, rga_isr,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga_has_internal_iommu(rga) ? =
0 : IRQF_SHARED,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->has_internal_iommu ? 0 : I=
RQF_SHARED,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(core->dev), core=
);
>=20
> [Severity: High]
> Since devm_request_irq() is now called here in rga_core_probe(), could th=
is
> trigger an early null pointer dereference in rga_isr()?
>=20
> When hw->has_internal_iommu is false, the interrupt is registered as
> IRQF_SHARED. For shared interrupts, the handler can be invoked immediatel=
y by
> another device sharing the line. However, core->rga is not initialized un=
til
> rga_core_bind() runs later.
>=20
> If the interrupt service routine fires early, it will evaluate
> rga->hw->handle_irq(core) and unconditionally dereference the null core->=
rga
> pointer.
>=20
> [Severity: High]
> This is a pre-existing issue, but does the shared interrupt handler safel=
y
> access hardware registers?
>=20
> Because rga_isr() is registered as IRQF_SHARED, it can be invoked by anot=
her
> device while this device is runtime-suspended and unclocked. The handler
> unconditionally calls rga->hw->handle_irq(core), which accesses registers=
.
> Reading powered-off registers typically causes a synchronous external abo=
rt.
>=20
> Should the interrupt service routine use pm_runtime_get_if_active() befor=
e
> accessing registers?
>=20
> [Severity: High]
> This is another pre-existing issue related to the shared interrupt, but i=
s
> there a missing synchronize_irq() in the runtime suspend path?
>=20
> In rga_runtime_suspend(), clocks are disabled without synchronizing the
> interrupt. If an interrupt fires on another CPU just before clocks are
> disabled, the handler could actively read registers exactly when the hard=
ware
> is powered down.
>=20
> [Severity: High]
> This is a pre-existing issue, but could tying the shared interrupt to the
> core device lifetime cause a use-after-free when the master device is
> unbound?
>=20
> The shared interrupt is requested via devm_request_irq(core->dev, ...). W=
hen
> the master device is unbound, its rga structure is freed. Since the core
> device is not removed during unbind, the devm-managed interrupt is not fr=
eed,
> leaving the shared handler active.
>=20
> A subsequent interrupt will execute rga_isr(), which dereferences the
> freed core->rga pointer.
>=20
> [ ... ]
>=20
> > @@ -833,11 +825,20 @@ static int rga_core_probe(struct platform_device =
*pdev)
> > =C2=A0
> > =C2=A0	ret =3D component_add(&pdev->dev, &rga_core_ops);
> > =C2=A0	if (ret < 0) {
> > =C2=A0		dev_err(&pdev->dev, "failed to register component: %d", ret);
> > =C2=A0		return ret;
> > =C2=A0	}
>=20
> [Severity: Medium]
> If component_add() fails, does this bypass the pm_runtime_disable() clean=
up
> at the err_put_clk label?
>=20
> Returning directly instead of using a goto would leak the device's Runtim=
e
> PM usage counter.
>=20
> > =C2=A0	return 0;
> > +
> > +err_put_clk:
> > +	pm_runtime_disable(core->dev);
> > +
> > +	return ret;
> > =C2=A0}

--=-1IFg3XQG4ab9EwEqwNVw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalFekAAKCRDZQZRRKWBy
9EJxAQCerJAHaLRN7FFNTY3YyPH0fqeo6LEF7j3+G+gOa6SqPAEAkqdjquJ6+79k
yKGWesuohb6hpxdNV7L0h2dJMmp88gU=
=YL8F
-----END PGP SIGNATURE-----

--=-1IFg3XQG4ab9EwEqwNVw--
