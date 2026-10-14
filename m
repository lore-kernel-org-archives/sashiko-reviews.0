Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51C0366060
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 22:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792018389; cv=none; b=WzBWGbFmkDoFZoS+wj1bxaz4oGRyWNAetf0sEUz1NHZMKq26E2U2HKUGUJFkpi8+A0FYwzfoBd5X5RSysVIFnx+KaiKTePEi+Y+60eCyecZNgds+Q4JpY/5mz/54LaM/iTRdjGWtUI4BbipF/4K45aD9dyGLecwvqBwrnE7wC3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792018389; c=relaxed/simple;
	bh=ljhhs058Uu8LR3r/dfzfqv6gMke2mpfg/ekEjmSu3fI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Xt4msd6v5F/0KQw6g8MuGT0dXf5JEjJc2WkZ/YUcdsLlOgigMsFo3isyJTFI4L9UGdiegoX4liHV8fnqoBI5l1mj4o91Wah6rbWF6WA2zMThzdyFBVSwO/0jd/P889caXL32XcqM8oZxbs4Na3V+mJVh8Y0PZ5Y5RXQdwwWYNyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es; spf=pass smtp.mailfrom=hsal.es; dkim=pass (2048-bit key) header.d=hsal.es header.i=@hsal.es header.b=rjhgCuoO; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hsal.es header.i=@hsal.es header.b="rjhgCuoO"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4j4mgr1QdzzKp51;
	Thu, 15 Oct 2026 00:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1792018376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S9L2yqehEk5J/KJaDjn0UlKtBv2ZJIvg0h4mE1QYUvg=;
	b=rjhgCuoO0VHM1hfQ3SvNkdgsBrdaoREphAEyYO56y/MhDpYMztRnLPzs+qazk8oR3cazFu
	Xf80CYrvzVF75ixQ9oOEb5OoNBpOiWu3yxcS6WkZ4mhLhGJfKxIQg46xe7LUi69lYyL05h
	qW5pPrwueBx2A2xPvWG43Teqn/XoNmpFg2cUZ2fhpoUmNiX3v0xU7cXzOe9GQgkXNQ9B+s
	Wy34HBGFFoZDtH8H3+eUhHIpcFQwy2exvGtaBvmfCgnS4EdtNM51TRsaAsYbxBhdSVcelb
	cxZO7JD8mzg31lIrjOYH0n70WSqJYKQd7D+m4EvOqPrNUDUdAQD9tVoB/G1K/Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=hugo@hsal.es
Date: Wed, 14 Oct 2026 23:52:55 +0100 (WEST)
From: Hugo Sales <hugo@hsal.es>
To: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <1615886072.1467681.1792018375427@app.mailbox.org>
In-Reply-To: <sashiko-outbox-171985@kernel.org>
References: <20261014223041.171317-1-hugo@hsal.es>
 <20261014223041.171317-2-hugo@hsal.es> <sashiko-outbox-171985@kernel.org>
Subject: Re: [PATCH 1/2] drm/amd/display: Fall back to the native mode, not
 the first, on eDP/LVDS
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.52.252
X-Originating-Client: open-xchange-appsuite
X-Rspamd-Queue-Id: 4j4mgr1QdzzKp51

> Should native_mode be zero-initialized or initialized using drm_mode_init=
()
> first?

Thanks for the catch. I'll switch to drm_mode_init(), like the mode copy
a few lines above, in v2

> On 10/14/2026 11:39 PM WEST sashiko-bot@kernel.org wrote:
>=20
> =20
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] drm: uninitialized stack memory read in create_stream_for_sink=
()
> --
>=20
> commit c9acc168fa3f685b9a0bbaf87f6642a89b782aef
> Author: Hugo Sales <hugo@hsal.es>
> drm/amd/display: Fall back to the native mode, not the first, on eDP/LVDS
>=20
> This commit updates create_stream_for_sink() to fall back to the native
> mode stored in the encoder when the preferred mode is no longer present
> in the connector's mode list. This is limited to eDP and LVDS panels wher=
e
> amdgpu handles scaling automatically.
>=20
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/5983
>=20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.=
c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
> > index 428a5f9377c62..a1dc3e28764cf 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
> > @@ -1470,6 +1472,7 @@ create_stream_for_sink(struct drm_connector *conn=
ector,
> >  =09struct dc_stream_state *stream =3D NULL;
> >  =09struct drm_display_mode mode;
> >  =09struct drm_display_mode saved_mode;
> > +=09struct drm_display_mode native_mode;
> >  =09struct drm_display_mode *freesync_mode =3D NULL;
> >  =09bool native_mode_found =3D false;
> >  =09bool recalculate_timing =3D false;
>=20
> [ ... ]
>=20
> > @@ -1529,6 +1532,31 @@ create_stream_for_sink(struct drm_connector *con=
nector,
> >  =09=09=09break;
> >  =09=09}
> >  =09}
> > +
> > +=09/*
> > +=09 * After a probe with size limits smaller than the preferred mode,
> > +=09 * connector->modes no longer has that mode, and the first mode lef=
t
> > +=09 * would become the stream timing. fbdev emulation probes with limi=
ts
> > +=09 * that video=3D can set below the native size. The encoder has a c=
opy of
> > +=09 * the preferred mode from amdgpu_dm_get_native_mode(), made on eve=
ry
> > +=09 * probe before the limits apply, so use that copy. Only do this fo=
r eDP
> > +=09 * and LVDS panels, which take only their native timing. On other
> > +=09 * connectors mode_valid can also reject the preferred mode, and th=
en
> > +=09 * the first valid mode is the right one
> > +=09 */
> > +=09if (!native_mode_found && aconnector && !aconnector->mst_root && ac=
onnector->drm_edid &&
> > +=09    (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP ||
> > +=09     connector->connector_type =3D=3D DRM_MODE_CONNECTOR_LVDS)) {
> > +=09=09struct drm_encoder *encoder =3D amdgpu_dm_connector_to_encoder(c=
onnector);
> > +
> > +=09=09if (encoder && to_amdgpu_encoder(encoder)->native_mode.clock) {
> > +=09=09=09drm_mode_copy(&native_mode, &to_amdgpu_encoder(encoder)->nati=
ve_mode);
>=20
> [Severity: Medium]
> Does this result in an uninitialized stack memory read?
>=20
> The native_mode variable is declared on the stack without initialization.
> When passed to drm_mode_copy(), that function starts by attempting to
> preserve the existing list node pointers of the destination:
>=20
> void drm_mode_copy(struct drm_display_mode *dst,=20
>                    const struct drm_display_mode *src)
> {
>         struct list_head head =3D dst->head;
>=20
>         *dst =3D *src;
>         dst->head =3D head;
> }
>=20
> Because native_mode is uninitialized, reading dst->head accesses garbage
> data. While this won't corrupt an active list (since the garbage is writt=
en
> back to a local variable that is never linked), it still triggers undefin=
ed
> behavior and can cause Kernel Memory Sanitizer (KMSAN) warnings.
>=20
> Could we initialize native_mode when it is declared to avoid this?
> For example: struct drm_display_mode native_mode =3D { 0 };
>=20
> > +=09=09=09drm_mode_set_crtcinfo(&native_mode, CRTC_INTERLACE_HALVE_V);
> > +=09=09=09preferred_mode =3D &native_mode;
> > +=09=09=09native_mode_found =3D true;
> > +=09=09}
> > +=09}
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014223041.17=
1317-1-hugo@hsal.es?part=3D1
