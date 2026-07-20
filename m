Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36928426EB3
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556535; cv=none; b=F3LhYNtG7S6b/vEsDdRV8q4a9zjcolweIjziA/cbOxK4uvFpg1wzzSw2DJ+Qbdp+upv0aGz0kiVnVU3FQB2o5zletCbES0PM6XjWfxWauLwXz9kNIH/F2ymdJ9Qj2kvlVUjYrYlgkZ5JTW0w2PEIgiDlbitJJj2Ayiq2053Qzo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556535; c=relaxed/simple;
	bh=4/QLGXVN3YtC8wbV86UX79GdVGNiO0IzNFsiHKzoyk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYcetkgBfkdbTjA1LHmXRswuYaxHH/AZIIntY2zjYMGayB+IJ/Wccs2Sfu/4xHrUsVuY/YcwkyzrDw4njURppKqQ5JNruj738x8AwTeZeg7OXl2m96Y6cV2Xz4g4BW/pC/7sO02XyJ3fdLE/zpgGwBbYdIRYBlA5e/vXIPT9VNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hH/7RxQm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cJg7K6kO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hH/7RxQm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cJg7K6kO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784556533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bYhdFOpmK669qfgd8VOdJ1wWxaKRFhsnw8y+lE3N65U=;
	b=hH/7RxQm3kH2XJ1pZvW7BWLDKNtPG9v0JG5aK5n9G63VjBCG+LoeRHRsV+YF+kQG8p0shM
	dUo4cBK6wNB3C4BaquzVSbEb/q48XkBHBlG8/mQ863ovSpYMKoTqcuUZls6sHsSCnE1YyW
	TXClDniocaka94T4TGnK68fAD+Zhwzw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-fIVclnBdNduRrX1THy5P-w-1; Mon, 20 Jul 2026 10:08:51 -0400
X-MC-Unique: fIVclnBdNduRrX1THy5P-w-1
X-Mimecast-MFC-AGG-ID: fIVclnBdNduRrX1THy5P-w_1784556530
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f726186c4so944374f8f.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 07:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784556529; x=1785161329; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bYhdFOpmK669qfgd8VOdJ1wWxaKRFhsnw8y+lE3N65U=;
        b=cJg7K6kOnRLWv4WMR5gWUV+wrsQE5yP8brBgtcv+rGD8JFQbS1/whRThW3rnjqYg7Z
         2AJvNto5smtqKEZN2WEvEc2m/3z1+RHbGuauWifC/DmuPIW/nJpHDDT/fzcD6A9QrUPR
         TPW7TQ1Qk+fmV3BUlbz88abdDF4DyEQXU2rkEF2UIG/W11HiJzwOm9vaybFQ4lDwVW4w
         M9Tg+r/SgdNLbKXftOwBBh8SQFaluDJzY+UalWiQ11S7MCDUqEbtD2a+Jof/2pbiQebQ
         IsxPG7Se6NOM218TvmkzEorceZvloSCReuk/Tc/lO/j2kugoAnXbe6GxivhKtnCqup6W
         bwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556529; x=1785161329;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYhdFOpmK669qfgd8VOdJ1wWxaKRFhsnw8y+lE3N65U=;
        b=jiRRph97xiHnOe5we1wBNaIPn4IR0bruv6ZJg8hG0HTzjG8mzb4sRcqJ3WKcGEwhQc
         z6arZJfKBWfzS+DALucu2Y9DqDdwkC3rhoLvv7RArrs4VMoXQZEtYjAJ0JPRE4icNrLW
         VilHETbbNQzPKTqVEgu8sGZl9Eu2FFEPgMOjxfuj3QigM7Te5ltWXGmIq2Y7uV4qJjWE
         SXwZTGMv+JJXGmsMvq1Gn10rGU053V0Y4M7NSVf+M4C2rcKUpNdA6I4PewMJUz+a2J6l
         TQjw7EN6cyNzxagZWZFlvJXjoOzqvNZWllZT1yvlsm2/s7v/EAIO/ul38hs4ZtkoeBfm
         lOmA==
X-Forwarded-Encrypted: i=1; AHgh+RoBd+8DPyjmZYCC8PRPqey3o9HFKl4aHMgvVVHayvqPtPpciS7iaEqB8D1v4a6bK5DwaG7Avy17B7EUACPHNLQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDP/fxMx0okJL2w7naVhUFa8au9Kup+j1MaKODzSg2zU6VF3zs
	S8+VuNvHEk+sbwTXY0sJgnURGxpxikZfeFWfpoubP2PoedCCyiId0HfJ8dyaNAO501tQXNYN9ll
	Yx/M3FvXb3HNDN0IsrgkSb9Lm3JiSgapDtlLKb0XuJ5QlRCDlXjSP2YUWQTYcoZf70jgh3Q==
X-Gm-Gg: AfdE7ckGtkyKHj0GBJVky/zQPZXLMGO+e+KiU05EUrmEyYNYeepBF5KDyVUHK+K9Gyv
	GnNKTP3teVpX4il3yxHlEnWO7SPlSb4OScLW0bvxGsaHNGh2+FwiPLtubjkOwOtl5Af4pdPQ4sY
	F6IaKwQltLfmDFs90Nc2f8JkH0uuvU9QCq8NZ8sY3YKmbgNDx85st+MqWzBTR7VDQg4klQauK2l
	DNeQ35yqK4OPSa685s+vVmsm/MnxB8x22bIKFrhwRQXmo5VVpL6NhwEJpPEXOtNsBpr7pcbqspZ
	wGs+mNl+FCW65fSdQ7zSYR6jdt2REp0+aFDKeKfV9x1heMgzLCmZydMrrj1v3rbRZo7STG2mMg=
	=
X-Received: by 2002:a05:600d:8486:20b0:495:6022:5a20 with SMTP id 5b1f17b1804b1-49560319fe9mr26968445e9.33.1784556529519;
        Mon, 20 Jul 2026 07:08:49 -0700 (PDT)
X-Received: by 2002:a05:600d:8486:20b0:495:6022:5a20 with SMTP id 5b1f17b1804b1-49560319fe9mr26967995e9.33.1784556528895;
        Mon, 20 Jul 2026 07:08:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:a99:9822:edbd:5894:eb1d:c2c7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e499c2sm28394845f8f.4.2026.07.20.07.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:08:48 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:08:47 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ze Huang <ze.huang@oss.qualcomm.com>, sashiko-reviews@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
Message-ID: <20260720-bold-jasmine-goldfish-d979e5@penduick>
References: <20260716-drm-simple-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com>
 <20260716091459.1D8101F000E9@smtp.kernel.org>
 <DK1XPK73QJHC.JWFUMTTLOD1D@oss.qualcomm.com>
 <63cca05a-ec83-430c-abcf-c2f0b508446f@suse.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="lkbwojfab5zeg2qh"
Content-Disposition: inline
In-Reply-To: <63cca05a-ec83-430c-abcf-c2f0b508446f@suse.de>


--lkbwojfab5zeg2qh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
MIME-Version: 1.0

On Mon, Jul 20, 2026 at 02:36:19PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 18.07.26 um 21:12 schrieb Ze Huang:
> [...]
> > > > -	if (event) {
> > > > -		crtc->state->event =3D NULL;
> > > > +static int imx_lcdc_plane_helper_atomic_check(struct drm_plane *pl=
ane,
> > > > +					      struct drm_atomic_commit *commit)
> > > > +{
> > > > +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_=
state(commit, plane);
> > > > +	struct drm_crtc *crtc =3D plane_state->crtc;
> > > > +	struct drm_crtc_state *crtc_state =3D NULL;
> > > > -		spin_lock_irq(&crtc->dev->event_lock);
> > > > +	if (crtc)
> > > > +		crtc_state =3D drm_atomic_get_new_crtc_state(commit, crtc);
> > > > -		if (crtc->state->active && drm_crtc_vblank_get(crtc) =3D=3D 0)
> > > > -			drm_crtc_arm_vblank_event(crtc, event);
> > > > -		else
> > > > -			drm_crtc_send_vblank_event(crtc, event);
> > > > +	return drm_atomic_helper_check_plane_state(plane_state, crtc_stat=
e,
> > > [Severity: High]
> > > Can fetching the CRTC state this way cause a kernel panic in the core=
 atomic
> > > helpers?
> > >=20
> > > If userspace submits a commit that modifies only plane properties wit=
hout
> > > affecting the CRTC, the CRTC is not implicitly added to the atomic co=
mmit
> > > state.
> > >=20
> > > In this scenario, drm_atomic_get_new_crtc_state() returns NULL. Passi=
ng this
> > > NULL pointer directly to drm_atomic_helper_check_plane_state() causes=
 a crash
> > > when it dereferences crtc_state->enable.
> > >=20
> > > Could this use drm_atomic_get_crtc_state() instead to ensure the stat=
e is
> > > brought into the commit if it is missing?
> > I think it is fine here; I'll just copy the pattern from [1].
> >=20
> > [1] https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/drm/mgag=
200/mgag200_mode.c#L487
>=20
> It could be that there's a long standing problem in the overall logic. Not
> having a CRTC (and hence crtc_state) should also mean !fb, so we'd return=
 at
> [1]. If we have a CRTC on the plane but pass a crtc_state of NULL, we cou=
ld
> get a panic at [2], where it does crtc_state->crtc.=A0 I'm not aware of a=
ny
> bug reports about this problem, but it's still an issue.
>=20
> A number of drivers get this wrong by using
> drm_atomic_helper_get_new_crtc_state(). The bot suggests to use
> drm_atomic_helper_get_crtc_state() instead.=A0 This helper also returns t=
he
> new state. But=A0 if there's no new state, it duplicates the CRTC's exist=
ing
> state. That's a bit of an overhead, but probably not an issue.=A0 Several
> drivers use this helper, but also get it wrong. They tend to return early=
 in
> the case of !crtc or !fb without calling _check_plane_state(). See [3] and
> [4] for examples.
>=20
> I think, going with the bot's suggestion to use
> drm_atomic_helper_get_crtc_state() might be the best resolution for now. =
It
> still needs a crtc pointer, so the pattern is
>=20
> crtc_state =3D NULL
> if (plane_state->crtc)
> =A0 =A0 crtc_state =3D drm_atomic_helper_get_crtc_state(plane_state->crtc)
>=20
> _check_plane_state(plane_state, crtc_state);
>=20
> And in this case, _check_plane_state() should work correctly. But you can
> only use _get_crtc_state() in the atomic_check helpers! In the
> atomic_update, atomic_enable, etc helpers, it's too late for the helper to
> copy the CRTC state.
>=20
> I think some other DRM dev should look over this as well. It's one of the
> trickier things in DRM to get right.

drm_atomic_helper_get_crtc_state is safe in atomic_check. It's
everything after that must use either get_new_crtc_state or
get_old_crtc_state, as the global state cannot be modified anymore.

Maxime

--lkbwojfab5zeg2qh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCal4r6QAKCRAnX84Zoj2+
djhGAYCtixMssCdv8dqBLhL8AGCbqHVEcB24miO1/lrC21m8xRJjw/XtwiTe9uk3
u4LZbpABgJqkOJIhKLmzGuvYfOvGsyd49cCHHxPbfZ61/iBr5yCbvhnk0bm7yW/6
PWaUe1AQtQ==
=Kjek
-----END PGP SIGNATURE-----

--lkbwojfab5zeg2qh--

