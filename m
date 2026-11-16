Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844105;
	b=G8JY2KASVc812QB5Q7tx/GZYhciUkqQ5odpGlk4B9OUP7czQCw7GJF3jvbmthjMFixLg
	 Xy5dYzo46gkaPIkK2ylXjba2DPQHtug4394cqUHeLlE3ByyQ1LfI8AL6xVZNQlEe+intx
	 O/ZvZBwe7hDgFN0RazYReXLVpTsjLcErh2/aXxldACOlrk0lICelx6EVA2qThngG78olp
	 ZHU14RS9Ee4Q0P0cjgOteuXyxycbn3fvGqBKPGx3UhiDtlVTKy5ARuXRkX2vv7y7/q+EG
	 jTlqkbfZ+red/cn6hdllXsGoNekYazbcE+6sXXjaR1TEHSSKWOWLwBo4Vypq/eJ4kpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SzKDeGN/8UgfcEgIRtcVNj0qVJIlvtERU7Sei6kTiUE=;
	b=MKoyZ2pAiLJcHJtEa+QD8ay1+qCk2M3e0cHeS5nQt/Rm9A3RaNUlcMwFEtrqWqMf7F/2
	 iYFNNjXnwUf84dZAX4nNWOeHCOavG0uRzMArAHKf/JpVOWEy/StchG41o/ZitqTxuHIuo
	 984uENgIRSgu8zOBWRRUYnakNjktAK9bGKZ2qgOCcYC8fqYO1aYMJSNkAbilqYTiplyom
	 a2vKIjic18IN/heliAXWm/jENP/8H7nSsLogGzs4h9vV1ppk4NHhKd8nfZJZwOzQl1qtz
	 R8yXYReAcRxhiV6LM4VeNBCxKBqb9Fgt2Op7WXFNccSoS0xSuGYc4rq88kHhid4hEkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="JJdF/ggX";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3090606A322
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 15:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3090606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JJdF/ggX
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4919a880834so1829462f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 07:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794844103; x=1795448903; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SzKDeGN/8UgfcEgIRtcVNj0qVJIlvtERU7Sei6kTiUE=;
        b=JJdF/ggXDSdKQrFaiTb/dVvJtDB9CbucZkaqaA4p0Zv8UyGdBl4qKR5gnrbmxDojXS
         mUiqcnSrX+3WEvMCA7ImoQCBFJf2ec7j/yo14oQspEbPRvK36TZqoAjN4JkQk8Hd5Wwe
         ZejmR5+9f1XHXMHqKe7GT9prgZ98x/mDVhznZ6s0e3D0fhs4kEUKieV40P3C0ykMtaeK
         sk8dHcnBckMihu4/T0gPDB0IUVk2ezxOuYLnf881V6AW+HuiF7U/SpJUy9u9nEsDZW9D
         Fh5PPeWlvB8V9n7vAEZCluBBxcpM0b7418s+W1gkOoqaCFjq4smSmB8oMCO4YE8yW7F5
         clZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844103; x=1795448903;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzKDeGN/8UgfcEgIRtcVNj0qVJIlvtERU7Sei6kTiUE=;
        b=pvMIBOXXatPHfLTmlcQjbtjikebt1p9GFi5yRBAljAmfR4uQ+bPA5WU3daOCw8t5hP
         3NSL2MEXpnN3q0LD4UXJr1YzDT5w/iUQcwC5fQOPLAOUHMwUtavxcROIdCVm0st2IVu3
         d4tHxKMAg02KmM1k8t2O9Xe+yBSOOHKUcm3tURKEZQAaCHy6/VN+YYMAwuxh23jKMDMl
         HfRnUuN7PtnnCJjKR2ge8hx0b1iXYNxeUfbvCE00kTHoK0o0OaIoDA1QYdg/YxC6KQto
         yz6L6ANHDIi7qqU3VG/O8DstsdnViYDQNv4AuSQSz+WGXgjCah5RTht8ZaMkBhhUsyq0
         KSZA==
X-Gm-Message-State: APuU4Z8xGVh4ws947XEn68QbT2PRC3jzbSKlp697keVCaS3zjx4RIzQz
	FGx6ql8rAetu/lEjiCOa8mpCNPNCeS0elwDAybtWnamCMwOcKqJuFfs2WSxH4L+m0v8wyf1zmxm
	JKV37
X-Gm-Gg: AZFdTZfRtNF0iaXuB4Z/ORbdNVsKWs2pRx+S8f0re2Nls/h0mYKAAX/qGx2vd0dRKyA
	1MPOVzHI/jacuykqoOOw16mbJuvs/7AKyCXOTxdmvSxs4fbZaG04Fxl/v27h/mYY5njj7NcI7jj
	ua3KsL68khtDf03g6zYZW5qLZpDJUd2wRQYLheWTPV8P1NNMQUnrT45YWINbUzvqVT/pcUQ6F96
	yEVcdJZ+XzjCjd6xpJFZZgBNWARg6bdesFOKNOMNNd+xiqTGaeawwnXoBqohnDLkt6LXicK2rfy
	Q4pT70TY0mBkYDza3EIayaJHXeF8nUk0eA1+VEk8Lp7rsybJ7zaAx7f+/kfqf+cuDO5XOM/lDk5
	Bu4cRgwPyTNytK9/l8kj4aC7jlmlfnDkX3PgDaCWXJhjhIGnHCqz+Lat7mJy3RiosDfjdcDgSdn
	K16J4q4tCU0cyb9stOP90obRAKjl4TgwU+CnwIx+qA4x8Nmw8rDCjLwRvIeXyT3DQDQrx45mFIp
	FO30bn4LjFRZ1/CrWLRxdcwYzFOhKli16i3qBCdWtYDHDPT6FD5VF7V7CTYscFEPIt7bO34MQLe
	wFrTVSpDkOhhS3/AlsiZd9Z5/Jzi/EEF1IhppOCfcIhdOtErXGWITnizLuo4mShwSGnJlRPAnhO
	jvVtUj9RxF5h8SVyd
X-Received: by 2002:a05:6000:1ac5:b0:490:71a7:6f3c with SMTP id ffacd0b85a97d-49c7325b963mr26375601f8f.55.1794844103096;
        Mon, 16 Nov 2026 07:48:23 -0800 (PST)
Received: from localhost (p200300f65f19a90439293c698a65b414.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3929:3c69:8a65:b414])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c609c602dsm22424904f8f.46.2026.11.16.07.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:48:22 -0800 (PST)
Date: Mon, 16 Nov 2026 16:48:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: Disable driver overriding by default
Message-ID: <avse90uItAVxWnQL@monoceros>
References: <20261116110853.3418077-2-u.kleine-koenig@baylibre.com>
 <sashiko-outbox-216950@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5lfgoea2xr35qvsp"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-216950@kernel.org>


--5lfgoea2xr35qvsp
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] driver core: Disable driver overriding by default
MIME-Version: 1.0

Hello,

On Mon, Nov 16, 2026 at 11:36:25AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] driver core: device_match_driver_override() returns -1 instead
>   of 0
> - [High] driver core: disabling driver_override by default breaks
>   in-tree drivers
> - [Low] driver core: allow_driver_override_setup() enables override on
>   parse error
> --
>=20
> commit 06f24686a63b0776fbdf7d5d7bb34b7905ceba41
> Author: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>=20
> driver core: Disable driver overriding by default
>=20
> This commit disables driver_override matching unless a driver sets
> support_driver_override or the allow_driver_override=3D1 boot parameter is
> used, and adds TAINT_DRIVER_OVERRIDE when an unsupported override match is
> allowed.
>=20
> > diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> > index 396097fdb3162..5344b20488fde 100644
> > --- a/drivers/base/bus.c
> > +++ b/drivers/base/bus.c
> > @@ -603,6 +603,56 @@ int bus_add_device(struct device *dev)
> >  	return error;
> >  }
> > =20
> > +static bool __read_mostly allow_driver_override;
> > +
> > +static int __init allow_driver_override_setup(char *str)
> > +{
> > +	if (!str || kstrtobool(str, &allow_driver_override) < 0)
> > +		allow_driver_override =3D true;
> > +
> > +	return 1;
> > +}
> > +__setup("allow_driver_override=3D", allow_driver_override_setup);
>=20
> [Severity: Low]
> Does allow_driver_override_setup() enable allow_driver_override when
> kstrtobool() fails?  Passing an unrecognized argument such as
> allow_driver_override=3Ddisabled or allow_driver_override=3D causes kstrt=
obool()
> to return -EINVAL, setting allow_driver_override to true instead of keepi=
ng
> it disabled.

I think that's fine. The expected thing happens for

	allow_driver_override=3D1
	allow_driver_override=3Dy
	allow_driver_override=3DY
	allow_driver_override=3DoN

	allow_driver_override=3D0
	allow_driver_override=3Dn
	allow_driver_override=3DN
	allow_driver_override=3DoFf

and that

	allow_driver_override=3Ddisabled

and also

	allow_driver_override=3DThursday

also enables that override mode is IMHO ok. The documentation only
mentions =3D1, so I think that's good enough.
=09
> > +
> > +/**
> > + * device_match_driver_override() - Match a driver against the device'=
s driver_override.
> > + * @dev: device to check
> > + * @drv: driver to match against
> > + *
> > + * Returns > 0 if a driver override is set and matches the given drive=
r, 0 if a
> > + * driver override is set but does not match, or < 0 if a driver overr=
ide is not
> > + * set at all.
> > + */
> > +int device_match_driver_override(struct device *dev,
> > +				 const struct device_driver *drv)
> > +{
> > +	guard(spinlock)(&dev->driver_override.lock);
> > +	if (dev->driver_override.name) {
> > +		int ret =3D !strcmp(dev->driver_override.name, drv->name);
> > +
> > +		if (ret > 0 && !drv->support_driver_override) {
>=20
> [Severity: High]
> Does rejecting driver_override by default before any in-tree driver sets
> support_driver_override break in-kernel callers of
> device_set_driver_override() and git bisectability?

It breaks some intended use, yes, and I mentioned in the comment area
after the commit log that a followup is needed for some drivers. IMHO
it's not a big desaster if we miss one or the other, because there is
the kernel cmdline parameter that allows to restore the old behaviour
and catching up is easy.

> Several subsystems call device_set_driver_override() internally to bind
> kernel-created devices whose names or ID tables do not match via normal b=
us
> matching.  For example, i2s_create_secondary_device() creates a "%s-sec"
> platform device, sets its override to "samsung-i2s", and calls
> device_attach():
>=20
> sound/soc/samsung/i2s.c:i2s_create_secondary_device() {
> 	...
> 	ret =3D device_set_driver_override(&pdev_sec->dev, "samsung-i2s");
> 	...
> 	ret =3D device_attach(&pdev_sec->dev);
> 	if (ret <=3D 0) {
> 		platform_device_unregister(priv->pdev_sec);
> 		dev_info(&pdev_sec->dev, "device_attach() failed\n");
> 		return ret;
> 	}
> 	...

OK, so samsung_i2s_driver in sound/soc/samsung/i2s.c needs this flag
set, too. Similar:

	imx_clk_scu_driver in drivers/clk/imx/clk-scu.c
	rpmsg_ctrldev_driver in drivers/rpmsg/rpmsg_ctrl.c
	rpmsg_ns_driver in drivers/rpmsg/rpmsg_ns.c
	qcom_slim_ngd_driver in drivers/slimbus/qcom-ngd-ctrl.c
	vfio_fsl_mc_driver in drivers/vfio/fsl-mc/vfio_fsl_mc.c

> }
>=20
> Because samsung_i2s_driver does not set support_driver_override,
> platform_match() fails, device_attach() returns 0 while priv->pdev_sec is
> still NULL (leaking pdev_sec), and samsung_i2s_probe() then dereferences
> priv->pdev_sec.  Other internal users such as imx_clk_scu_alloc_dev() and
> rpmsg_ns_register_device() also fail to bind their drivers at boot, and a=
ll
> VFIO, UIO, and stub driver_override workflows are broken at this commit.
>=20
> In addition, PCI and CDX drivers that use PCI_DRIVER_OVERRIDE_DEVICE_VFIO=
()
> or CDX_DEVICE_DRIVER_OVERRIDE() rely on device_match_driver_override()
> returning > 0 so do_pci_match_id() and cdx_bus_match() match override_only
> ID table entries, whereas setting support_driver_override on those drivers
> would also allow pci_match_device() to bind arbitrary non-matching devices
> via pci_device_id_any without tainting.

I didn't completely understood that. I think this is remedied by
changing the return -1 that is criticised in the severity high issue
below to 0.

> > +			if (allow_driver_override) {
> > +				add_taint_module(drv->owner,
> > +						 TAINT_DRIVER_OVERRIDE, LOCKDEP_STILL_OK);
> > +			} else {
> > +				/*
> > +				 * If you hit this warning and you need to
> > +				 * quickly workaround this check, boot with
> > +				 * allow_driver_override=3D1 on the kernel
> > +				 * commandline. The right fix is to set the
> > +				 * driver's .support_driver_override property.
> > +				 */
> > +				dev_warn(dev, "Suppressed driver override binding to %s.\n", drv->=
name);
> > +				return -1;
>=20
> [Severity: High]
> Should device_match_driver_override() return 0 rather than -1 when
> suppressing a match?
>=20
> Per the function comment, < 0 means no driver_override is set at all, whi=
le
> 0 means an override is set but does not match drv.  Returning -1 for the
> matching driver while returning 0 for all other drivers causes callers to
> fall through to normal bus matching for the overridden driver:
>=20
> drivers/vdpa/vdpa.c:vdpa_dev_match() {
> 	int ret;
>=20
> 	/* Check override first, and if set, only use the named driver */
> 	ret =3D device_match_driver_override(dev, drv);
> 	if (ret >=3D 0)
> 		return ret;
>=20
> 	/* Currently devices must be supported by all vDPA bus drivers */
> 	return 1;
> }

indeed, returning 0 is more sensible.

Best regards
Uwe

--5lfgoea2xr35qvsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr7JcIACgkQj4D7WH0S
/k4/Xgf/VgmqWJpcnfhD7IuIvadDjqAIC6/hu/Tg4fd/6a0fOcHsKv30bepj3S1Q
dof888FiVwNZhGX7Sss/1zGtXNlZyzDN0MbJfuqYWkg/SGUDLi9dR/vBn//eb2bt
98YZEKj9rGGyaZQr9nTXUdtAc3fdNdW+GBQNadsqC9b0U5tMFechIYNm9t0+WLWs
isRxlEhoXTpMwtlik3LMp3ldkATH7Ramj/2j0wZweShvl9JEfWQVam/1y4iQgXYs
WeK9KQAtZlF44bHCJ2CW7hBlCqWXjXmq58VJZJppea2EQLhSpsfCL6BKzT9VyYBn
gDTjqG8aQiX8iB2Yza7R3TZgWObXyg==
=VtFA
-----END PGP SIGNATURE-----

--5lfgoea2xr35qvsp--
