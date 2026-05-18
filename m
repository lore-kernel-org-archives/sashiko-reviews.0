Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A81D3F6C5C;
	Mon, 18 May 2026 11:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105460; cv=none; b=SBtbpGvcuzY4GKIEA+Ux8Imorb/BfPYbVyrm3lBh50rYHP5nlCYLHjgQ0miqKLqCUeXdgjhRfcswicfUXJ61uGTwWebIgCKBV+NuhtfkwWB/GQNsNSo/i4EdV6WPdigsqxgnGZ9kLfuUUCSnjp0Ti/yhItCa35oXl7AdhCD9PAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105460; c=relaxed/simple;
	bh=cuoaNGrtUUzG8MQj4xVqHQBiUVtUk8RNqnEKpWnO9kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1GLC80AZ8tUJpysF++xYnGn3pHzl+LokTAfgJvNd9+SsypNDD4z6t2fjvqQEj7kU6UQMWaM9z3F9tbr7c4Lk0HqfrRKo+ezBL45IPAski0tIzuf7gObzQnEPF8ZVNMxWdl3J46wOS82H45yBc9OcZXS+Om+lES+uOZeh8wv9jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 757351F80041;
	Mon, 18 May 2026 11:57:37 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 8A214B407F3; Mon, 18 May 2026 11:57:36 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 223ADB407F2;
	Mon, 18 May 2026 11:57:36 +0000 (UTC)
Date: Mon, 18 May 2026 13:57:33 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 14/16] media: sun6i-isp: Use V4L2 subdev active state
Message-ID: <agr-rZexPlvBGkXI@collins>
References: <20260518102451.417971-15-paulk@sys-base.io>
 <20260518114455.5A2D1C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p1hHiy/8q1TMeLUB"
Content-Disposition: inline
In-Reply-To: <20260518114455.5A2D1C2BCB7@smtp.kernel.org>


--p1hHiy/8q1TMeLUB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le Mon 18 May 26, 11:44, sashiko-bot@kernel.org a =C3=A9crit :
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The format for SUN6I_ISP_PROC_PAD_SINK_PARAMS is left uninitia=
lized (zeroed) in sun6i_isp_proc_init_state, which will cause v4l2-complian=
ce failures.
> --
>=20
> commit a1aac013cb6f860e3fef00fefa14f9e439c4e03c
> Author: Paul Kocialkowski <paulk@sys-base.io>
>=20
> media: sun6i-isp: Use V4L2 subdev active state
>=20
> This commit converts the driver to store the active format using the comm=
on
> V4L2 subdev active state instead of maintaining a local copy.
>=20
> > diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> > index 46a334b602f19..9073a7f3f8c8c 100644
> > --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> > +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
>=20
> [ ... ]
>=20
> > @@ -259,21 +262,22 @@ sun6i_isp_proc_mbus_format_prepare(struct v4l2_mb=
us_framefmt *mbus_format)
> >  static int sun6i_isp_proc_init_state(struct v4l2_subdev *subdev,
> >  				     struct v4l2_subdev_state *state)
> >  {
> > -	struct sun6i_isp_device *isp_dev =3D v4l2_get_subdevdata(subdev);
> > -	unsigned int pad =3D SUN6I_ISP_PROC_PAD_SINK_CSI;
> > -	struct v4l2_mbus_framefmt *mbus_format =3D
> > -		v4l2_subdev_state_get_format(state, pad);
> > -	struct mutex *lock =3D &isp_dev->proc.lock;
> > +	unsigned int pad;
> > =20
> > -	mutex_lock(lock);
> > +	for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> > +		struct v4l2_mbus_framefmt *mbus_format;
> > =20
> > -	mbus_format->code =3D sun6i_isp_proc_formats[0].mbus_code;
> > -	mbus_format->width =3D 1280;
> > -	mbus_format->height =3D 720;
> > +		if (pad =3D=3D SUN6I_ISP_PROC_PAD_SINK_PARAMS)
> > +			continue;
>=20
> Does skipping the initialization for SUN6I_ISP_PROC_PAD_SINK_PARAMS here
> leave its format completely zeroed out?
>
> Because v4l2_subdev_init_finalize() allocates the active state memory usi=
ng
> kzalloc(), skipping this pad means its format will be left with a media b=
us
> code of 0, as well as 0 for width and height.
>=20
> With the get_fmt operation now pointing to the generic v4l2_subdev_get_fm=
t()
> helper, calling VIDIOC_SUBDEV_G_FMT on the parameters pad will return this
> zeroed format.

Yes, there is no mbus format definition here and everything zeroed out
is fine.

> Since a media bus code of 0 is invalid in V4L2, could this result in
> v4l2-compliance testing failures?

I think it's fine.

Paul

>=20
> > =20
> > -	sun6i_isp_proc_mbus_format_prepare(mbus_format);
> > +		mbus_format =3D v4l2_subdev_state_get_format(state, pad);
> > =20
> > -	mutex_unlock(lock);
> > +		mbus_format->code =3D sun6i_isp_proc_formats[0].mbus_code;
> > +		mbus_format->width =3D 1280;
> > +		mbus_format->height =3D 720;
> > +
> > +		sun6i_isp_proc_mbus_format_prepare(mbus_format);
> > +	}
> > =20
> >  	return 0;
> >  }
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518102451.41=
7971-1-paulk@sys-base.io?part=3D14

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--p1hHiy/8q1TMeLUB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoK/q0ACgkQhP3B6o/u
lQxs2Q//Y8ftpaHeDy6NIrIusBAgnh25sXyH9ne5zvZ/euStXdC/aOo3PdHz7aa3
dESrLGopC6ekGwJzlsAwTmfCuBmoefUBE9DU8TtdEbPHEzZCmjZmrdaOscSOEar7
TpQe+CIJtb7q5hWbK9lNPTGfs+9qHirZWxcOLAs/kCD5JlfJoI2eISVXsTkOM/mi
9/VnGI+kMDFQ5q00QSMCr09yf6dV734dKa7QjXG9TcT9WSluvo9q/HyZWLblgj4m
UWxV/kgW1TrNwDidA+Kx3o5Pnf+b0Vsd+oxHWBoZBYCfGaBj6qLO6aQaHt/4lE1U
3YPF6JINc/3NyQkSdS8hZr8BWAgKSHvX8E44NLUUkKC8Zi9/TO8fDeU6t2NTz8PV
4awvHesRk1blTJ33Sy94ImItmpIEr3tn2tmyk7ogZ5+FmA+nq1xeKbfTRn3VtTUh
bENBd0p6gASebZ0anCuq6uLfa0wPTBginXZZ4BVsOZoHwTLT3JfKwP2HwhAnNSeN
G/9C0iU9mxOvI2jqARgMbDO/iOoAsOxWDVMmIxRE6zpkeVOO4/+1TnFjZX6lTzcr
HqPcbEbjh1IFqfuJW16OnsrA2n7YC3BBQmpPbpxrdVeuUicN6CZgS2xoBBg5moGJ
Tf/UkTjqBTPSK0d3GAEzt2gXGT3yeYejqcmB4m0Zau9+fOsvFOs=
=PmzO
-----END PGP SIGNATURE-----

--p1hHiy/8q1TMeLUB--
