Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5F83F329A
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 19:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624873; cv=none; b=a8+DUbiMa+Y3IyhtVQ2xcEoLTf8F4fCMh2TkqHlcddlLqQRWIKH6l9/gWZS+NFS9QDPT6gZn9SCed8rGQFvReZVxXUPGJ3He2KkEE8VlviwTgdNYpFAPbQ8prJdTefx7eucv7qgy1Plq5CldyiMuYoplB/g1OOqIJubMl8oplzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624873; c=relaxed/simple;
	bh=oa0ATEHdDrPBHnBwtYdTsdCDqSjSClVf4hvLC15s1G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Opwq4nNIjHlHX2Mra6HUnQiOt334PYJ3iJe3AYVZkefZI+sWyceY2ajR0PtYINWR8YMrFQrKwQZs6hyU1FJ0gUzllhMBpmsx35MkaUZbyxD+1wubRxOJ8t2Wfhpcb3X8WsUqHdvsJfLaMnQJU3BrI6r2IAKE86dFmrKMq6qWOao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=INPqZN6e; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="INPqZN6e"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so21469555e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 12:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790624869; x=1791229669; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XDjGN6T4DEeN+hVmhBYLcGwoTGCn8dVW/lQSls4C50E=;
        b=INPqZN6eToN1bxhmTS3zpQlHC707IQustuit5pu2IgvZEsqC2x/8SJCbfrRR8BqJF0
         CmKZ4BQB8OScyKJKoRJ7vuetLVuGcQ80bWyrKBEnYBfObq3UYF4StpE2TWg7Hun0I1F2
         HKiUQBIaU8eTrgy9COm243M/aDYlS6JXDXp6n4MvT7QUXA22MRsLxyWqVPysSnKLNwQj
         7OT4q0JtDHWEBVYRV6MVo7E06bg9AXMrhAz7StKY45BlT0JaNpmFFKYu9yPikK5G3mdn
         Coq1+SSwR/kMw8AB+dwHV8cVkZe/Hl2hqk+ySlzxN0ek/5agt6eEY4waO5Wi93kkuWga
         FtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624869; x=1791229669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDjGN6T4DEeN+hVmhBYLcGwoTGCn8dVW/lQSls4C50E=;
        b=llhBX42DgmjiSTUc/hzHbiLe/4Cv1VuOwVRfezxa90vv7Wil9BCszkVZiK2ec1Kj/x
         RFlP1hTxF5BJ1JKVO+zTpbr8GM4mW1l697QoVbI1DDO+lFuViBla5mfWaJxw9DqIaaEW
         9KDiPForI18nwIdRg3KyOhKBHfzhdYPujpl7U0OybjH6K7SkOFkzCsJW+iGrVepFertO
         9nw65m1nG+Geyld00lfdLqKngObH+ngbiwpuuNhdqU1y0ay9kLTNHyAJ3b06UtVZAiz/
         FYs+5zlSbJ8GM8tkJ7i2TzxUA4ulBW1+P0ctNelo8az6NhIfpA0fn8QUkllvDmFORdV0
         KzvA==
X-Gm-Message-State: AFuF++n7Dxuw3MOwuegiQuo6U5XbFLjkxOP4nG3zH4O4O1mQQ8fc1SOA
	60UWlzbH1mU2SA6LhXIFyQ05EJGEh+6wIbglD9ktqN9BNqMCmbeWzLvExUpgJPg71U9tFf3AHrw
	79TvS
X-Gm-Gg: AYBFou0W1x9BMkyN/I08oSejXwT/P0SuWhOE2tv/5+UiMFWJMtEQD8gbGBX7ye3AELn
	pv3+sq1656AsNa/NRrbOS9naEcB2rj7fYR3nksxl5uRdo3jdLRnzGLPOLRoccYFfXh/4GNGIove
	0Qot6l6HwrYXtc1ITHIxbZ3gN1h0MPHS/P8wwUsaDcjznLMvL4uqEU+xFSE0YUuIT6Nmu4pytq8
	+6TUkktzfF0Z13lApMOddl1YkdusyRK7bJVdxfcJr1M4+rtDzn6Yeb4WHmJKjQK2HRiye+ynMY5
	Az80XcmSrYGkxhMlfCzf+rh+3De4gYDSRiXx5e2mWjzEVhGkSaYeZ/hfvVgSIplXLAGuwWr/NlL
	5iCZVx7EC7eSrjzNKx7pkpbuMvLmvY3qdHVXKw52IBg9nkqkzXw8bDe/dElc2ZnpgEjpPjqt2FZ
	iq7iLw/xtEsiRTdzhfi5l+IqcQDbMynd3kbsP1fBET8qd443vx1S+dc5KW0kFx3gjQe45aUPZV8
	LI80Sr7a4yjxn0=
X-Received: by 2002:a05:600c:8707:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a0008968a1mr95353755e9.16.1790624869320;
        Mon, 28 Sep 2026 12:47:49 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a00c0d538fsm26948145e9.1.2026.09.28.12.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:47:48 -0700 (PDT)
Date: Mon, 28 Sep 2026 21:47:47 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] driver core: Disable driver overriding by default
Message-ID: <arrDbfOnXHxgVjdi@monoceros>
References: <cover.1790612298.git.u.kleine-koenig@baylibre.com>
 <0f7446324f6a0c8f0153d6532d92a6eeecd6a308.1790612298.git.u.kleine-koenig@baylibre.com>
 <20260928165751.2006D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s4esvmsh5o4odqif"
Content-Disposition: inline
In-Reply-To: <20260928165751.2006D1F00893@smtp.kernel.org>


--s4esvmsh5o4odqif
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/3] driver core: Disable driver overriding by default
MIME-Version: 1.0

Hello,

On Mon, Sep 28, 2026 at 04:57:50PM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> > index c51ad96d4de4b..d294c198ab0c3 100644
> > --- a/drivers/base/bus.c
> > +++ b/drivers/base/bus.c
> > @@ -606,6 +606,49 @@ int bus_add_device(struct device *dev)
> >  	return error;
> >  }
> > =20
> > +static int __read_mostly allow_driver_override;
> > +
> > +static int __init allow_driver_override_setup(char *str)
> > +{
> > +	allow_driver_override =3D 1;
>=20
> [Severity: Medium]
> Does this setup function ignore the user-provided string value? If an
> administrator passes allow_driver_override=3D0 or allow_driver_override=
=3Doff
> on the kernel command line, it appears this will still unconditionally set
> allow_driver_override =3D 1. Should standard boolean parsing such as
> kstrtobool(str, &allow_driver_override) be used here instead to honor the
> user intent?

I copied from sysrq_always_enabled_setup(), I guess both could indeed
benefit from kstrtobool().

> > +	return 1;
> > +}
>=20
> [ ... ]
>=20
> > +int device_match_driver_override(struct device *dev,
> > +				 const struct device_driver *drv)
> > +{
> > +	guard(spinlock)(&dev->driver_override.lock);
> > +	if (dev->driver_override.name) {
> > +		int ret =3D !strcmp(dev->driver_override.name, drv->name);
> > +
> > +		if (ret > 0) {
> > +			if (!allow_driver_override && !drv->support_driver_override) {
>=20
> [Severity: Critical]
> Could this unconditionally suppress the override match for drivers that
> haven't been updated, and break existing userspace ABIs? Userspace
> frameworks like libvirt, QEMU, or DPDK that rely on this feature for PCI
> passthrough via vfio-pci or uio_pci_generic might silently fail to bind
> devices if they lack the kernel command-line parameter.

The idea is to mark the relevant drivers with .support_driver_override =3D
1 before this patch is applied to minimize the fallout. I added the two
drivers pointed out to my list to check.
=20
> > +				pr_info("Suppress driver override binding. Allow %ps to do overrid=
ing or boot with allow_driver_override on cmdline\n",
> > +					drv);
>=20
> [Severity: High]
> Does applying the %ps specifier to a data pointer (drv) instead of a stri=
ng
> (drv->name) leak a raw kernel address? If the kernel is built without
> CONFIG_KALLSYMS_ALL, kallsyms will fail to resolve the data symbol, and t=
he
> print routine falls back to printing the unhashed hexadecimal pointer,
> which could bypass KASLR when exposed in dmesg.

I wasn't aware of that leak. Is that a real thing?
=20
Best regards
Uwe

--s4esvmsh5o4odqif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq6xGAACgkQj4D7WH0S
/k6aIAf/cgx3W92bl5m4i7KV0NkpwBwolFmeAummQEMnPiWtQ6w6nZVSWCzDo4QS
eLn3uGa8HOlp8Uyghbm9EmeWOugzoXCKiAaprH823YXjdOIj70W4Bc0FFToNsPX8
32SLNzUgu0K0PB3AkYg2OuecA4wP5KI4Brqo6KvHukBlTGGoL9uMyv4g1xu+g2nP
Lt6mnYFXnDxfh/2a+UDVFKIq3+2ynrX+uDtnfCiFlG6TA6/4PaZyw+uBX9MgwiYN
56VyUolywxnfemV6msMuPc3hISBoQXnXyuognRuPki1T0FhSS6l1L/EG4LbE2adW
A+bzGA+GwHJ/l4dTr76iGg2x5oMM4Q==
=UiR7
-----END PGP SIGNATURE-----

--s4esvmsh5o4odqif--
