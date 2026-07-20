Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D681433024
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560007; cv=none; b=rcHcmrUFx2XBTK4ZqpOZUck7djgc8Wr/kj70/nLN7DsXJGzzx5bRSip1yeXA2dDFVnYOZGRBFw4bt469lnRnBBN3zTXiIUMUAEUvHfGSfAsFWx+X5jOBOa0no8rKHGX5Y9T84M6IkyHqD9T7cpTmJPwmcz7ahSZb4MU8lCxBlX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560007; c=relaxed/simple;
	bh=a175UQzqR86d6YYzqf8qOPOSkOvvssKXDA8KRWIDhyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJoldrSEMN3fer6ehqwQIIKetdqXMdD8AV6miA4w638DBzmJW7mhsz/cDX7eT/iFL3/OGu304AvnJTK6/uWFp1B1h8jS5pdYlFK2GstmmWEH2KbKoSKQ6Q18bkmwagApaVfPfC+R+yE7f3lPkfx/R5PlznwqIpMDnB2mQJ+kJRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UgVA8sC3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H7hFra83; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UgVA8sC3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H7hFra83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784560005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=raPd+j2sNnja6yObFkLuI3fBBY7t0sFpL6aJ3ppEwEQ=;
	b=UgVA8sC3bAHuUWH3XtUA5TxyXGFuoVXWQANJR7FBF+8/K7Qm82z9Wo9USpeYubfVt2eugY
	5pilK6JQOvMv7HT4B8UOlX4jQIWWqy4YjSl/GareuFO37VC2XgOS+8YTRJ3+WQkOzeDuOf
	i5PWeTEvDfdH3hgJ2vpBgohI4/2vVKA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-RGepsTB-NKSDP7VeL8JhGA-1; Mon, 20 Jul 2026 11:06:43 -0400
X-MC-Unique: RGepsTB-NKSDP7VeL8JhGA-1
X-Mimecast-MFC-AGG-ID: RGepsTB-NKSDP7VeL8JhGA_1784560002
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49545071724so42242665e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 08:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784560002; x=1785164802; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=raPd+j2sNnja6yObFkLuI3fBBY7t0sFpL6aJ3ppEwEQ=;
        b=H7hFra83PyHUtdm631POTRjUyypgZP0gZmLhF6bBl98PZCmhn37Wt/cafx53VDX0se
         hYHLOh/id2YLyEk4QYwMZ7h6vqVG3NFmTqwJkWI6KZnsVIAXOMK+FsXdZFOyTDvEVjvz
         80FCt8ai1x0Scwvg/Qp8upn18gW8tPiilvwpiJnQF7NNX3J/mdb9DarLIueFGbv8/SWZ
         nB+etPjUhW1fLxnUUrboqqjFSHab/wO2orM6vZn3YVVt3zlcMXm5WdYZyl0v0WLQ7fYq
         9tDDtEb5teUDOSi+v2lbr6AQkHw+yIysY19dqImR7sjwLy20jfaWjMqIAXRrUnT9dEtp
         l7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560002; x=1785164802;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=raPd+j2sNnja6yObFkLuI3fBBY7t0sFpL6aJ3ppEwEQ=;
        b=Xr+pamSeE2hCHdcKLJ49lUn0sedcXCy4VrPx9vN5IHRo8SCtIm7kN+Y6d3m7YxoU36
         6MWUjZ/vYGBdVQR7iBh9SKH4K2BVFIMo8w2B9PzKW45oSAEOHnXMhQ7omXOdvlAOoHni
         PjmRw4uCEfNuYwV6eggRKUCp5nHYmqczHya8FowQapgkHuRhurEC79Vs3AMfYNlItNs8
         I9grPKX2N0b8HYq0VAGZTUMAMomGihRR0uag96WZQYjtOemme9eWU09mEx3k1YpK1QJ7
         XH9wAg7aTEUm43cfAzX3VXe+oPFADk2dpYWvh2JhFbfx4Spbb8oGfqj4MjKJEtoYriKw
         oPlA==
X-Forwarded-Encrypted: i=1; AHgh+RpM583qLqHMm/xstILTg2Q7xWyICUO2g2k43cGjGJzfFT+i5gFz+skkzMbvSSh4PMOK23pQ0Ca8AGsTq7ET45o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxavOMd8r9i+vD0lbEfknL3fomEKbaM6qBJT3k7htMrartvQjOD
	hRgkVx1FSCHUFaUdSdEj+TtKTE20CWHxYe7ojIQ423nAUHuCPmPAAsAtuSCWGCKvPisGONjpmAv
	2NvdDJ+kmAYtv3cntCW5ALzDyXvuijIsp+vhrfYQb+iIqMNfR4uQ7ZLB123Pk+ey9ltlouA==
X-Gm-Gg: AfdE7cm48kaCTPBu5vxflz0xuiW/4YHICe2mECA3wTv0t0nLp4LSlUxk1HqGrrG+Vib
	u/mUf12jbPHMzPfM92Bvena081mFvcjrWuzde2pK0JJGJCqG4SlcsEaIeIZ6W624Iv2ltjqAMKo
	qUv7A7vo1IJL/7OfPRd8MXLKa5KpjVP82qpaPZym60z4z6mQTgFcXcFC/JL51OgE2eZ/hhC3coY
	nFMl4h35FhcAoqoB+8Q83wDmb4e7gb96zN1GobWjDVJCwor9r+6GA9e/x3cOCjOiJSivcFkAipN
	+aEqZjVJ1XPDQNL2RntpAixe6zYF9qWVlL5t90PemFrYTp2wqbe/tRc6Hsrv9VZ6lcX7iB8Oow=
	=
X-Received: by 2002:a05:600c:4685:b0:495:4a77:1327 with SMTP id 5b1f17b1804b1-4954a771521mr171385235e9.33.1784560001975;
        Mon, 20 Jul 2026 08:06:41 -0700 (PDT)
X-Received: by 2002:a05:600c:4685:b0:495:4a77:1327 with SMTP id 5b1f17b1804b1-4954a771521mr171384685e9.33.1784560001343;
        Mon, 20 Jul 2026 08:06:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:a99:9822:edbd:5894:eb1d:c2c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49562709500sm57729825e9.14.2026.07.20.08.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:06:39 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:06:38 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ze Huang <ze.huang@oss.qualcomm.com>, sashiko-reviews@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
Message-ID: <20260720-sly-tricky-elephant-c8afa1@penduick>
References: <20260716-drm-simple-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com>
 <20260716091459.1D8101F000E9@smtp.kernel.org>
 <DK1XPK73QJHC.JWFUMTTLOD1D@oss.qualcomm.com>
 <63cca05a-ec83-430c-abcf-c2f0b508446f@suse.de>
 <20260720-bold-jasmine-goldfish-d979e5@penduick>
 <3749a60a-a8bb-45a0-a06e-a21017990c10@suse.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7vkstdocennjbk5t"
Content-Disposition: inline
In-Reply-To: <3749a60a-a8bb-45a0-a06e-a21017990c10@suse.de>


--7vkstdocennjbk5t
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
MIME-Version: 1.0

On Mon, Jul 20, 2026 at 04:38:26PM +0200, Thomas Zimmermann wrote:
> Am 20.07.26 um 16:08 schrieb Maxime Ripard:
> > On Mon, Jul 20, 2026 at 02:36:19PM +0200, Thomas Zimmermann wrote:
> > > Hi
> > >=20
> > > Am 18.07.26 um 21:12 schrieb Ze Huang:
> > > [...]
> > > > > > -	if (event) {
> > > > > > -		crtc->state->event =3D NULL;
> > > > > > +static int imx_lcdc_plane_helper_atomic_check(struct drm_plane=
 *plane,
> > > > > > +					      struct drm_atomic_commit *commit)
> > > > > > +{
> > > > > > +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_pl=
ane_state(commit, plane);
> > > > > > +	struct drm_crtc *crtc =3D plane_state->crtc;
> > > > > > +	struct drm_crtc_state *crtc_state =3D NULL;
> > > > > > -		spin_lock_irq(&crtc->dev->event_lock);
> > > > > > +	if (crtc)
> > > > > > +		crtc_state =3D drm_atomic_get_new_crtc_state(commit, crtc);
> > > > > > -		if (crtc->state->active && drm_crtc_vblank_get(crtc) =3D=3D =
0)
> > > > > > -			drm_crtc_arm_vblank_event(crtc, event);
> > > > > > -		else
> > > > > > -			drm_crtc_send_vblank_event(crtc, event);
> > > > > > +	return drm_atomic_helper_check_plane_state(plane_state, crtc_=
state,
> > > > > [Severity: High]
> > > > > Can fetching the CRTC state this way cause a kernel panic in the =
core atomic
> > > > > helpers?
> > > > >=20
> > > > > If userspace submits a commit that modifies only plane properties=
 without
> > > > > affecting the CRTC, the CRTC is not implicitly added to the atomi=
c commit
> > > > > state.
> > > > >=20
> > > > > In this scenario, drm_atomic_get_new_crtc_state() returns NULL. P=
assing this
> > > > > NULL pointer directly to drm_atomic_helper_check_plane_state() ca=
uses a crash
> > > > > when it dereferences crtc_state->enable.
> > > > >=20
> > > > > Could this use drm_atomic_get_crtc_state() instead to ensure the =
state is
> > > > > brought into the commit if it is missing?
> > > > I think it is fine here; I'll just copy the pattern from [1].
> > > >=20
> > > > [1] https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/drm/=
mgag200/mgag200_mode.c#L487
> > > It could be that there's a long standing problem in the overall logic=
=2E Not
> > > having a CRTC (and hence crtc_state) should also mean !fb, so we'd re=
turn at
> > > [1]. If we have a CRTC on the plane but pass a crtc_state of NULL, we=
 could
> > > get a panic at [2], where it does crtc_state->crtc.=A0 I'm not aware =
of any
> > > bug reports about this problem, but it's still an issue.
> > >=20
> > > A number of drivers get this wrong by using
> > > drm_atomic_helper_get_new_crtc_state(). The bot suggests to use
> > > drm_atomic_helper_get_crtc_state() instead.=A0 This helper also retur=
ns the
> > > new state. But=A0 if there's no new state, it duplicates the CRTC's e=
xisting
> > > state. That's a bit of an overhead, but probably not an issue.=A0 Sev=
eral
> > > drivers use this helper, but also get it wrong. They tend to return e=
arly in
> > > the case of !crtc or !fb without calling _check_plane_state(). See [3=
] and
> > > [4] for examples.
> > >=20
> > > I think, going with the bot's suggestion to use
> > > drm_atomic_helper_get_crtc_state() might be the best resolution for n=
ow. It
> > > still needs a crtc pointer, so the pattern is
> > >=20
> > > crtc_state =3D NULL
> > > if (plane_state->crtc)
> > >  =A0 =A0 crtc_state =3D drm_atomic_helper_get_crtc_state(plane_state-=
>crtc)
> > >=20
> > > _check_plane_state(plane_state, crtc_state);
> > >=20
> > > And in this case, _check_plane_state() should work correctly. But you=
 can
> > > only use _get_crtc_state() in the atomic_check helpers! In the
> > > atomic_update, atomic_enable, etc helpers, it's too late for the help=
er to
> > > copy the CRTC state.
> > >=20
> > > I think some other DRM dev should look over this as well. It's one of=
 the
> > > trickier things in DRM to get right.
> > drm_atomic_helper_get_crtc_state is safe in atomic_check. It's
> > everything after that must use either get_new_crtc_state or
> > get_old_crtc_state, as the global state cannot be modified anymore.
>=20
> Thanks a lot for confirming.
>=20
> Wrt. the logic in plane atomic_check, we might have to fix a number of
> drivers. As I outlined above, some use _get_new_crtc_state(), some use
> _get_crtc_state() incorrectly. But that's for another series.

Sigh... I removed all of them a couple of years ago, I guess some crept
back in. Maybe we should warn loudly if it happens?

Maxime

--7vkstdocennjbk5t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCal45eQAKCRAnX84Zoj2+
dg/AAYDTsrf3Fkgk1ZRklRK6roAOsuZiFoREp5NdX6u03Jpi4+thGFxdq0lEKyS0
6K/TZMcBgL6ZYUXFbXvt4bZJ6BknrGbVMlzCNEfV2lYGsQdJWBLqDAfrlypdfYay
4ZjNz+WlxA==
=nM5m
-----END PGP SIGNATURE-----

--7vkstdocennjbk5t--

