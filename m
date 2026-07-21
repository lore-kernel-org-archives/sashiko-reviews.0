Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C4B443308
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784626146; cv=none; b=kpPstZZgf1+0VXzhV/xBxEhf2G81WbbXoueaHhbVoqn2Ef/lMTAbSQlo5x13oe+Qqx6vk/TxNOEGEhdtg1+WrEaWIhXcVhv2IeVVo5Xu83xL5lXaCi/TNWSszTUUqD4zBWXrok7wmUdrlwalJYZbLqN0lApMCRkTBS/N6BZa6bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784626146; c=relaxed/simple;
	bh=f+tAOEFe/ZozGHopzGMvkF4QvWQSOwN+hn+D23vyFKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7MuFyOzbdJowlp17a8Iy4lou+kZTjjXiaS7VYOZ02XhItOMlQZbfdhYsPPfLhRsiYoxYmiF+jesb5Xne3OD5SS0DWH58yOLpDJKeDGaZEcFHOR/0KRpDXBNZhUUioN+wFN4NWuvBRNaCOdQN9GhFA0F2VXER4W54hHdO6gb7lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fj9w6tHm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TkjQyC5g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fj9w6tHm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TkjQyC5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784626143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L3nIrtb3ZIx5YQo/Azj3k+CrJf5VH+rRdrIKrJmE4Ec=;
	b=Fj9w6tHmNgNez+WlisL0DfOMcnJEEDcWtXgHkA4lZd8lc5ebBACNzGjSsMXE6hn35zpyzm
	Ia8/4VMybh+whR8JtUlEBLuPKhg7HaqOMgv+DOm47hMAy29qmtgHzGDgt4QMY3Xv5Pecv3
	EZZAFL+Cmjp7C97tXVo8TaXpRKoET00=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-Mw0TlllGPHGxXTKeig9oyQ-1; Tue, 21 Jul 2026 05:29:01 -0400
X-MC-Unique: Mw0TlllGPHGxXTKeig9oyQ-1
X-Mimecast-MFC-AGG-ID: Mw0TlllGPHGxXTKeig9oyQ_1784626140
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47bbe3b9705so10252666f8f.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 02:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784626140; x=1785230940; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3nIrtb3ZIx5YQo/Azj3k+CrJf5VH+rRdrIKrJmE4Ec=;
        b=TkjQyC5gXb8vte0N3Qd75deeziUVjGnsZEdfQeB9IHYPp9IVUMem38yYrkDMUiIyrm
         Daxkk8le38OftGdWDVovntK4wjdQiJfmDhTOzfvdBr9J4DPCOQyw6fiB1NpNTo5JofIv
         vCDjQnXKwqfPkXl0AD4dbrcUUUxiKRnb6GYP1VUj2W7vz5LG4ssARoMnB5AKCl5ti6m1
         Ja5SvY3lEUBOkqHirxw4ZtFvyXcgIhV5nP4Ame5Ev0fTIfmOlV9m9FQG45mxNYmQOebV
         cjmqvSQUz7GJYBwE2x9/Jnjykcx0NatmDJ5on08Bkl/WgeTCa7OrOW3Cr9mDVLmahP39
         DUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626140; x=1785230940;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3nIrtb3ZIx5YQo/Azj3k+CrJf5VH+rRdrIKrJmE4Ec=;
        b=qXo+OR6WsANP93VBsUxofBwaE6sjjeRq2bDdg+zVPIDQFWTS139WeOn66KEtsf1tLA
         38clKK0T4+pEDHAomIvbcRGTIDN9rZ2tM6stOZi0c/RdmXBNDhRy3w0TExSKFpD7DZy0
         mWmi8T2rcc/zBcUkXlE6hhJMkvPo1rJkSkeigZkydCGEfj3hOsOSamcD2+/yKFk+Lxa3
         gcrpqCGv5HQ3xssP/wOZtA1MmRHfN4RPD/k+uNh/OSJYh9WQag/UoJLxuuAuiQmOJ+DH
         hiBcapHCkpH/OHxPU8BZp5Ae8EPSWjEISgI/tek6455Z+tTHr1nUhPwkmLu5LB1RnHMr
         8DSg==
X-Forwarded-Encrypted: i=1; AHgh+Rrl5J8NwEOfDgVqsmpgIgGffiIbBD0Qe9daObGPO9LvCWGBYUpX18ZZ6YoS1LQUlBN1weG7Q3snfYbE3wEa0G0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6m66rbasM/ATeKb/A/dEeo5ORyeI31RFk7p9K6kcJmDYuPO2q
	8Dk1FHbFfFB/bAMu/TmUIsDdhFgRtGrGo0PHtjI7SBmVYLLyBlwjqA8a2UigKd/xNwkqHl7B4Hx
	iB5i4Fge7ptHL/ScE6RR/rAKH56M4nolXtnkXZM0MNsGCVrIKNvOIGiiFtnIqEIoCrjeZJQ==
X-Gm-Gg: AR+sD11LqLDTms2YUtalvv2H0L1jE9LkQiAC3YOlIVBAabI/zAlIdIdPpc/cY0mqpe9
	r0F/+1KpzE0Zw7mk+vN9OLWwxpPWSzMshurA95ABV72e3lFSq4tbLQ0T6rdsJ9i+HipRY3lCjWQ
	ruFPp7RBpEFX+nlUy5jtKrv9KjNjierscFIkBIwd5lKCZ7/rKNWNKctmKCZWj2Z/WN5CcSyqXy9
	8dePmzrhQLjF6oIWqygl8UZC0Ncq5UObooHRp4FFCB/wKy9544DwpOZjXwls+rbZ3aAgUd2u9To
	Wj/AkgAez1Mx2WvlvXfshxOVqCjlXkqxXFYpshQm9AqpiXBr+xOSNDdGuNsmtA2DrtMf54dJNw=
	=
X-Received: by 2002:a5d:5d0e:0:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f6230389fmr22149589f8f.14.1784626140322;
        Tue, 21 Jul 2026 02:29:00 -0700 (PDT)
X-Received: by 2002:a5d:5d0e:0:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f6230389fmr22149546f8f.14.1784626139778;
        Tue, 21 Jul 2026 02:28:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:a99:9822:edbd:5894:eb1d:c2c7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e496afsm39272808f8f.1.2026.07.21.02.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:28:58 -0700 (PDT)
Date: Tue, 21 Jul 2026 11:28:57 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ze Huang <ze.huang@oss.qualcomm.com>, sashiko-reviews@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
Message-ID: <20260721-vagabond-lovely-loon-d126e7@penduick>
References: <20260716-drm-simple-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com>
 <20260716091459.1D8101F000E9@smtp.kernel.org>
 <DK1XPK73QJHC.JWFUMTTLOD1D@oss.qualcomm.com>
 <63cca05a-ec83-430c-abcf-c2f0b508446f@suse.de>
 <20260720-bold-jasmine-goldfish-d979e5@penduick>
 <3749a60a-a8bb-45a0-a06e-a21017990c10@suse.de>
 <20260720-sly-tricky-elephant-c8afa1@penduick>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="svtaodo43k2a7zkz"
Content-Disposition: inline
In-Reply-To: <20260720-sly-tricky-elephant-c8afa1@penduick>


--svtaodo43k2a7zkz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
MIME-Version: 1.0

On Mon, Jul 20, 2026 at 05:06:41PM +0200, Maxime Ripard wrote:
> On Mon, Jul 20, 2026 at 04:38:26PM +0200, Thomas Zimmermann wrote:
> > Am 20.07.26 um 16:08 schrieb Maxime Ripard:
> > > On Mon, Jul 20, 2026 at 02:36:19PM +0200, Thomas Zimmermann wrote:
> > > > Hi
> > > >=20
> > > > Am 18.07.26 um 21:12 schrieb Ze Huang:
> > > > [...]
> > > > > > > -	if (event) {
> > > > > > > -		crtc->state->event =3D NULL;
> > > > > > > +static int imx_lcdc_plane_helper_atomic_check(struct drm_pla=
ne *plane,
> > > > > > > +					      struct drm_atomic_commit *commit)
> > > > > > > +{
> > > > > > > +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_=
plane_state(commit, plane);
> > > > > > > +	struct drm_crtc *crtc =3D plane_state->crtc;
> > > > > > > +	struct drm_crtc_state *crtc_state =3D NULL;
> > > > > > > -		spin_lock_irq(&crtc->dev->event_lock);
> > > > > > > +	if (crtc)
> > > > > > > +		crtc_state =3D drm_atomic_get_new_crtc_state(commit, crtc);
> > > > > > > -		if (crtc->state->active && drm_crtc_vblank_get(crtc) =3D=
=3D 0)
> > > > > > > -			drm_crtc_arm_vblank_event(crtc, event);
> > > > > > > -		else
> > > > > > > -			drm_crtc_send_vblank_event(crtc, event);
> > > > > > > +	return drm_atomic_helper_check_plane_state(plane_state, crt=
c_state,
> > > > > > [Severity: High]
> > > > > > Can fetching the CRTC state this way cause a kernel panic in th=
e core atomic
> > > > > > helpers?
> > > > > >=20
> > > > > > If userspace submits a commit that modifies only plane properti=
es without
> > > > > > affecting the CRTC, the CRTC is not implicitly added to the ato=
mic commit
> > > > > > state.
> > > > > >=20
> > > > > > In this scenario, drm_atomic_get_new_crtc_state() returns NULL.=
 Passing this
> > > > > > NULL pointer directly to drm_atomic_helper_check_plane_state() =
causes a crash
> > > > > > when it dereferences crtc_state->enable.
> > > > > >=20
> > > > > > Could this use drm_atomic_get_crtc_state() instead to ensure th=
e state is
> > > > > > brought into the commit if it is missing?
> > > > > I think it is fine here; I'll just copy the pattern from [1].
> > > > >=20
> > > > > [1] https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/dr=
m/mgag200/mgag200_mode.c#L487
> > > > It could be that there's a long standing problem in the overall log=
ic. Not
> > > > having a CRTC (and hence crtc_state) should also mean !fb, so we'd =
return at
> > > > [1]. If we have a CRTC on the plane but pass a crtc_state of NULL, =
we could
> > > > get a panic at [2], where it does crtc_state->crtc.=A0 I'm not awar=
e of any
> > > > bug reports about this problem, but it's still an issue.
> > > >=20
> > > > A number of drivers get this wrong by using
> > > > drm_atomic_helper_get_new_crtc_state(). The bot suggests to use
> > > > drm_atomic_helper_get_crtc_state() instead.=A0 This helper also ret=
urns the
> > > > new state. But=A0 if there's no new state, it duplicates the CRTC's=
 existing
> > > > state. That's a bit of an overhead, but probably not an issue.=A0 S=
everal
> > > > drivers use this helper, but also get it wrong. They tend to return=
 early in
> > > > the case of !crtc or !fb without calling _check_plane_state(). See =
[3] and
> > > > [4] for examples.
> > > >=20
> > > > I think, going with the bot's suggestion to use
> > > > drm_atomic_helper_get_crtc_state() might be the best resolution for=
 now. It
> > > > still needs a crtc pointer, so the pattern is
> > > >=20
> > > > crtc_state =3D NULL
> > > > if (plane_state->crtc)
> > > >  =A0 =A0 crtc_state =3D drm_atomic_helper_get_crtc_state(plane_stat=
e->crtc)
> > > >=20
> > > > _check_plane_state(plane_state, crtc_state);
> > > >=20
> > > > And in this case, _check_plane_state() should work correctly. But y=
ou can
> > > > only use _get_crtc_state() in the atomic_check helpers! In the
> > > > atomic_update, atomic_enable, etc helpers, it's too late for the he=
lper to
> > > > copy the CRTC state.
> > > >=20
> > > > I think some other DRM dev should look over this as well. It's one =
of the
> > > > trickier things in DRM to get right.
> > > drm_atomic_helper_get_crtc_state is safe in atomic_check. It's
> > > everything after that must use either get_new_crtc_state or
> > > get_old_crtc_state, as the global state cannot be modified anymore.
> >=20
> > Thanks a lot for confirming.
> >=20
> > Wrt. the logic in plane atomic_check, we might have to fix a number of
> > drivers. As I outlined above, some use _get_new_crtc_state(), some use
> > _get_crtc_state() incorrectly. But that's for another series.
>=20
> Sigh... I removed all of them a couple of years ago, I guess some crept
> back in. Maybe we should warn loudly if it happens?

I started to look into it for drm_atomic_helper_get_crtc_state and I
cannot find an occurence of this in drm-misc-next. Do you have a
specific example in mind?

Maxime

--svtaodo43k2a7zkz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCal87zwAKCRAnX84Zoj2+
dpD4AX9mZR8Tsica/YCVr+szvbzpc2I1L6zbnMp7qBJPP5suVRXai0/c6lQELN2s
/orBPSYBfRNMFmYBwJUkOABk0ocUxGax7KlpNoG7ktNzSEMH72f9U3G/1A/5b/ay
jQHqVqGSZQ==
=QgDA
-----END PGP SIGNATURE-----

--svtaodo43k2a7zkz--

