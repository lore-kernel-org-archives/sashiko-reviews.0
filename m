Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52B02E0413
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 12:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784636817; cv=none; b=Qp41LViUieAgkd+Lloo+doFOEMUEytiJk9MwUq3OrW9rcZeGygsYytxc+rLG544ut2D6xAy6HqT3sKGXDuJz02h8wtu6qW8Q6gfj5e5rhAF8DjNNfnyLKsCVOQMgVVxN0cLC1maneQ0de9DpBrRtsxijAmV1N8Uxjn2k0ZNJM+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784636817; c=relaxed/simple;
	bh=kF7OAzVHox5AkkDVkQNW+ArbgEhFNtdvjKEzlOqjA1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1317aJI7Br2gvIhd7AfDd1tad6usaKCBf+busP6naqavXREZL9Hu0Vu9bgcMvQWSkdJeSzjWnqrZRxLAh5nicwvQA/b/Yb8ztcl9UPTDeTq9tEwSnS/nUjfTuCalDDRKIP8A+Kda/ugLOHkd35JQa8Isu6UnidOjIAc5oLtIto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H3GK5H8g; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JdvCMSOT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H3GK5H8g";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JdvCMSOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784636814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WYiSTjiQJg3Dpk7/cgf2i739PzEJaW+kPWpHMN0AIl8=;
	b=H3GK5H8gjYMNfTtFO49RJ3dC8yDQbzrkaY9svwW+696e0jh7PFhfTUFsrBPaavczttcIDw
	PWT0+SWJ46El2QI/qCaKBLYoZk9G9+ZY5WVN6J6Yozxp61PHjBU0OqtLOiEJmjGGmj4gvi
	OdsKcUeDsS10FwbtsI30jHOlBg+5nYk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-_EXQE-fpMKSCYVac4LeQ3g-1; Tue, 21 Jul 2026 08:26:53 -0400
X-MC-Unique: _EXQE-fpMKSCYVac4LeQ3g-1
X-Mimecast-MFC-AGG-ID: _EXQE-fpMKSCYVac4LeQ3g_1784636812
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-495593376bdso17917025e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784636812; x=1785241612; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WYiSTjiQJg3Dpk7/cgf2i739PzEJaW+kPWpHMN0AIl8=;
        b=JdvCMSOTr7i02VccqbTQXAX9OeFfH8NK8wF5qxj0pgoELxOOjNijPfhZ/I2Ay96aLJ
         bZrvJw3ncC9MKRzxqv52stwPC0PdySvc4BDnaNcMgliwRDkG7mQWiUEWbxgRMTlaOZvA
         um9meOWFtvwizNQTpIf9aoMxOD6RX6EnpI1WjUJ+pZKRjL2NuWB066haAWyW8ymslpw0
         Zoy9BagLanODFQOpGb0UvZakCBs8jHktVbQuL1JEhuZsOcmpMmktnqjzljMx3+NRjiFk
         j2FWwXuDyWPLUyF5SNjxZvnn8XiWLTkGhjBPM2zd7ifHNnP5UNad42tEu+T+mvnnmy1x
         64Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784636812; x=1785241612;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYiSTjiQJg3Dpk7/cgf2i739PzEJaW+kPWpHMN0AIl8=;
        b=D4zGYNfEOp7WDAz74WqE0UBPmT/zggL1B5ZxLfQlBG+cNVZbfJkp3bqBI0I2+HDPdv
         H418P4SBZKHm38yAjYrO4jck2CuR852ULw2tK2WaxkSCWRryt7t2SgcyH0EbqKXCOgjd
         izQHu+JGR1HbcW02+uz0ym6aj2/Hcc68BPKLBY0Cocz4ccZ65escrOGBRZ1U3+2fjfeK
         KiXNLwE1WJzNwBUuUJGz6csJvrOtfhIsh/GFDXX7DJkdSD4J1rcOnWpSIQgbk4YwqShI
         oLYo+wfuEUsOL6Fy0kFS5V3ZY9M6I/K3M9yJZGTE8LlWcOgOguvTnyOSk5NIHT75Zm2+
         oBtg==
X-Forwarded-Encrypted: i=1; AHgh+RoLDtUB+FobdWRkx0YmxSgeroOHqe1Cr1A5l1QioCWw0fQ2TovX8YdHTAdPqkgXzmqWY0ZRCC1mkxpuKzYSnSU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1p8hCZRPyssohnOEOGGSboaTGQipP/UlzozF14HgcbGK0s/xp
	d6X7+LQesGH5yvmW7xCA2kqZI0zkarIZJe0zPuvW4XAj9hXCYzn+2QYBajmiQKZAZ8oUiZRhqgp
	1h3d5sBr8hVPxnCHD8oStHjsR/hDax0UhiSVwuT2CTPT2/eJLRlCH2VBPrcgoYLQNfuQ3cg==
X-Gm-Gg: AfdE7clkJLxtCMCTxPAowpR7UehMv/z7SWzLLDv3YDDIubVRxxQVq3LEpNRk23nTR7i
	envmCx2M74eFuPr5LuWVVcRUb1Qe4ILMLVWpOrN90cKpDOqcow7eSH0kkvOTaLaVuIw5ASQAwwR
	0nSAqp5xNRhWK9En12VlLdidzPzNf1KBDWUDkWdEViU400qg0fNPCXT3tib38+FFr+Qe6OPUJur
	8hXFHaXnCTG/n3YEW2ZoNfW7w7aV/N9OU0VT7MAm3oRek5cZ0R/Ad56rhFyrt9WmRGoxmkd7c+K
	ymGDUMgJPltqm+LDVOgF0wyyKGXTVeDEfg7BedhM8yxTSklTcVpaZZv/pc/FIwNITyvZIAA=
X-Received: by 2002:a05:600c:3512:b0:493:cfe8:5b36 with SMTP id 5b1f17b1804b1-4954a3eec4bmr208323845e9.8.1784636806479;
        Tue, 21 Jul 2026 05:26:46 -0700 (PDT)
X-Received: by 2002:a05:600c:3512:b0:493:cfe8:5b36 with SMTP id 5b1f17b1804b1-4954a3eec4bmr208323085e9.8.1784636805839;
        Tue, 21 Jul 2026 05:26:45 -0700 (PDT)
Received: from localhost ([45.134.79.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955a9e5f26sm156358265e9.0.2026.07.21.05.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 05:26:45 -0700 (PDT)
Date: Tue, 21 Jul 2026 14:26:43 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ze Huang <ze.huang@oss.qualcomm.com>, sashiko-reviews@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
Message-ID: <20260721-curious-pelican-of-performance-89bd76@houat>
References: <20260716-drm-simple-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com>
 <20260716091459.1D8101F000E9@smtp.kernel.org>
 <DK1XPK73QJHC.JWFUMTTLOD1D@oss.qualcomm.com>
 <63cca05a-ec83-430c-abcf-c2f0b508446f@suse.de>
 <20260720-bold-jasmine-goldfish-d979e5@penduick>
 <3749a60a-a8bb-45a0-a06e-a21017990c10@suse.de>
 <20260720-sly-tricky-elephant-c8afa1@penduick>
 <20260721-vagabond-lovely-loon-d126e7@penduick>
 <b2896811-a784-41d9-a717-59e86d04b629@suse.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="qaxdp2o4alh4kctf"
Content-Disposition: inline
In-Reply-To: <b2896811-a784-41d9-a717-59e86d04b629@suse.de>


--qaxdp2o4alh4kctf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
MIME-Version: 1.0

On Tue, Jul 21, 2026 at 11:37:32AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 21.07.26 um 11:28 schrieb Maxime Ripard:
> > On Mon, Jul 20, 2026 at 05:06:41PM +0200, Maxime Ripard wrote:
> > > On Mon, Jul 20, 2026 at 04:38:26PM +0200, Thomas Zimmermann wrote:
> > > > Am 20.07.26 um 16:08 schrieb Maxime Ripard:
> > > > > On Mon, Jul 20, 2026 at 02:36:19PM +0200, Thomas Zimmermann wrote:
> > > > > > Hi
> > > > > >=20
> > > > > > Am 18.07.26 um 21:12 schrieb Ze Huang:
> > > > > > [...]
> > > > > > > > > -	if (event) {
> > > > > > > > > -		crtc->state->event =3D NULL;
> > > > > > > > > +static int imx_lcdc_plane_helper_atomic_check(struct drm=
_plane *plane,
> > > > > > > > > +					      struct drm_atomic_commit *commit)
> > > > > > > > > +{
> > > > > > > > > +	struct drm_plane_state *plane_state =3D drm_atomic_get_=
new_plane_state(commit, plane);
> > > > > > > > > +	struct drm_crtc *crtc =3D plane_state->crtc;
> > > > > > > > > +	struct drm_crtc_state *crtc_state =3D NULL;
> > > > > > > > > -		spin_lock_irq(&crtc->dev->event_lock);
> > > > > > > > > +	if (crtc)
> > > > > > > > > +		crtc_state =3D drm_atomic_get_new_crtc_state(commit, c=
rtc);
> > > > > > > > > -		if (crtc->state->active && drm_crtc_vblank_get(crtc) =
=3D=3D 0)
> > > > > > > > > -			drm_crtc_arm_vblank_event(crtc, event);
> > > > > > > > > -		else
> > > > > > > > > -			drm_crtc_send_vblank_event(crtc, event);
> > > > > > > > > +	return drm_atomic_helper_check_plane_state(plane_state,=
 crtc_state,
> > > > > > > > [Severity: High]
> > > > > > > > Can fetching the CRTC state this way cause a kernel panic i=
n the core atomic
> > > > > > > > helpers?
> > > > > > > >=20
> > > > > > > > If userspace submits a commit that modifies only plane prop=
erties without
> > > > > > > > affecting the CRTC, the CRTC is not implicitly added to the=
 atomic commit
> > > > > > > > state.
> > > > > > > >=20
> > > > > > > > In this scenario, drm_atomic_get_new_crtc_state() returns N=
ULL. Passing this
> > > > > > > > NULL pointer directly to drm_atomic_helper_check_plane_stat=
e() causes a crash
> > > > > > > > when it dereferences crtc_state->enable.
> > > > > > > >=20
> > > > > > > > Could this use drm_atomic_get_crtc_state() instead to ensur=
e the state is
> > > > > > > > brought into the commit if it is missing?
> > > > > > > I think it is fine here; I'll just copy the pattern from [1].
> > > > > > >=20
> > > > > > > [1] https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gp=
u/drm/mgag200/mgag200_mode.c#L487
> > > > > > It could be that there's a long standing problem in the overall=
 logic. Not
> > > > > > having a CRTC (and hence crtc_state) should also mean !fb, so w=
e'd return at
> > > > > > [1]. If we have a CRTC on the plane but pass a crtc_state of NU=
LL, we could
> > > > > > get a panic at [2], where it does crtc_state->crtc.=A0 I'm not =
aware of any
> > > > > > bug reports about this problem, but it's still an issue.
> > > > > >=20
> > > > > > A number of drivers get this wrong by using
> > > > > > drm_atomic_helper_get_new_crtc_state(). The bot suggests to use
> > > > > > drm_atomic_helper_get_crtc_state() instead.=A0 This helper also=
 returns the
> > > > > > new state. But=A0 if there's no new state, it duplicates the CR=
TC's existing
> > > > > > state. That's a bit of an overhead, but probably not an issue.=
=A0 Several
> > > > > > drivers use this helper, but also get it wrong. They tend to re=
turn early in
> > > > > > the case of !crtc or !fb without calling _check_plane_state(). =
See [3] and
> > > > > > [4] for examples.
> > > > > >=20
> > > > > > I think, going with the bot's suggestion to use
> > > > > > drm_atomic_helper_get_crtc_state() might be the best resolution=
 for now. It
> > > > > > still needs a crtc pointer, so the pattern is
> > > > > >=20
> > > > > > crtc_state =3D NULL
> > > > > > if (plane_state->crtc)
> > > > > >   =A0 =A0 crtc_state =3D drm_atomic_helper_get_crtc_state(plane=
_state->crtc)
> > > > > >=20
> > > > > > _check_plane_state(plane_state, crtc_state);
> > > > > >=20
> > > > > > And in this case, _check_plane_state() should work correctly. B=
ut you can
> > > > > > only use _get_crtc_state() in the atomic_check helpers! In the
> > > > > > atomic_update, atomic_enable, etc helpers, it's too late for th=
e helper to
> > > > > > copy the CRTC state.
> > > > > >=20
> > > > > > I think some other DRM dev should look over this as well. It's =
one of the
> > > > > > trickier things in DRM to get right.
> > > > > drm_atomic_helper_get_crtc_state is safe in atomic_check. It's
> > > > > everything after that must use either get_new_crtc_state or
> > > > > get_old_crtc_state, as the global state cannot be modified anymor=
e.
> > > > Thanks a lot for confirming.
> > > >=20
> > > > Wrt. the logic in plane atomic_check, we might have to fix a number=
 of
> > > > drivers. As I outlined above, some use _get_new_crtc_state(), some =
use
> > > > _get_crtc_state() incorrectly. But that's for another series.
> > > Sigh... I removed all of them a couple of years ago, I guess some cre=
pt
> > > back in. Maybe we should warn loudly if it happens?
> > I started to look into it for drm_atomic_helper_get_crtc_state and I
> > cannot find an occurence of this in drm-misc-next. Do you have a
> > specific example in mind?
>=20
> It's called drm_atomic_get_crtc_state(). [1] :)

Yeah, sorry :)

> I've not evaluated all calls, but there are cases like [2], which
> returns early from !fb before running the whole
> drm_atomic_helper_check_plane_state() machinery. It should have at
> least set plane_state->visible to false.=A0 Better would be to call
> drm_atomic_helper_check_plane_state() in any case.

Oh right, I misunderstood what you were saying then. I thought you were
saying that there's drm_atomic_get_crtc_state() calls in !atomic_check,
which doesn't seem to be the case.

Maxime

--qaxdp2o4alh4kctf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCal9lfAAKCRAnX84Zoj2+
dskTAX463ABUm4ItZ2NMWH8AWvpT2+kPnn5f2giRv1bvymTXF6T6nwLsM2bi2ASx
Ojh8lPYBgMqfkU2yTtq1Yp+sy/i3y6r39pzsu7sRWHn6jkUSWtTDNQHYmUf9zZ80
LixJ8a/h3g==
=KMEv
-----END PGP SIGNATURE-----

--qaxdp2o4alh4kctf--

