Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D075D4302E7
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 22:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784585426; cv=none; b=VqCorReaTeb9pTUeUMafI7FRGCtttPnx9j0Q9SA+81slEYXO+nLkq2hA5P/RcBVcKzDM/cbYHCMBAE6DF5n9Wzi2E7M6rtHvbfJNWqaKfu/+G39AA0gJlJUj7FHBeB/59Gs3DOJ/PYOTgrBGKPUbHj0ZbGZRCQJS46Pqa6JtN/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784585426; c=relaxed/simple;
	bh=f43Tg6R34NEaIQ/FSdL+0yQV4MQEKKFGnTxvz0PSSI4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kh4jNxD2MpyXaxpdD5zoU+R18afXgo0ygHui515uJJdCpKUUeOJfuFToW9tNb3wOzbMTgESZjcmvU6iqjLkyaR4fRaf+o0Jjd9xsS8deHBkPM+bg2CzG11sfJetbxM2YDiooKCGU4IVWYqZVqclLkdpIKdwmEGVOD/OPkjN+GPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DeW804jo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DeW804jo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784585422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f43Tg6R34NEaIQ/FSdL+0yQV4MQEKKFGnTxvz0PSSI4=;
	b=DeW804joQ482wCCRZiGbHxAoWdUVBp8EintlfF8KsKZS98jQRcuJjDqE6SWQxBr+NVhiTB
	X/85mYsdAJj9bfGmijjaffTu3Zg54nesxpdlHZg42PUF14EmxsjUpWly8S6dEYKwiwf7Od
	F85c18ucrkuSCyna3EEWxUoORu1yeC4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-5E9eK45UOaWlG_ZCWB4E1w-1; Mon, 20 Jul 2026 18:10:21 -0400
X-MC-Unique: 5E9eK45UOaWlG_ZCWB4E1w-1
X-Mimecast-MFC-AGG-ID: 5E9eK45UOaWlG_ZCWB4E1w_1784585421
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9077b4c35c5so97258836d6.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 15:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784585421; x=1785190221;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ap8TB1t8MVKfU1KnGjOWiKZymcp8eb6PIIp5l59xk5Y=;
        b=i3nlUxLO9+vq3rTHwmszIWYSUetji5HOHrPJsb4vK6yK0XgqUpqGWI9ZfLL2jvAAIv
         /cg6k5gM03rlvpriIIe6Ly+FGKAWSnQnG5QJ47WDMj4EJ5vtVsUYRVw3Ixk0J6/jTJ/X
         VSzRP9leIJGDmSg5LfcgWhvXGWzlo/rvhc1BqlxWhEMpwiGARck8Md9O5bVaDAHQBXqR
         X9motK86ff+ZdgmFm6+fbZ7pcF6AgNqdMNg09XqX8e1UG2iX2UvrUxhlNDO58+sr0/fJ
         /WMGu0mmzWtKEXdRSiJU+U+3JPpQhjGDOr5n2F4njW81YOWCAIMiibuO9DXoZUDoGYu1
         eXxA==
X-Gm-Message-State: AOJu0YzQBFS6NjjcmS6NOmfNlOxfQ9XddtqsJad6G9aRVImhzA6y1du2
	eKMRsysJ+7s8tn1Ug8GWYhGt0qozVmDRbyJCoY5QXklgjcKFy55kOtu6dgB934wrdwFhz82GwN1
	idrI5hntQgJhyGo7kWIXHSUE/hBGe+yaTjELigjABqJ5UNkVyit0QzuVYgJROyfGXOMea3OWeO0
	8aBLyaKXCyrYz6zqdlJkN6L+lLVQy8kHWVUKFKYxY9wwJPjpMhtw==
X-Gm-Gg: AR+sD118Q9YyNyMK9rtMrwXFvyaHfhkncJeXC6AS/fsFwv77PYhd1OBipjuXkQbQ4zm
	tRjPUnMTM8usCrQhfYK4s5lfkAdAkxjSlAWaQf+4B1tXEt8U5nN7JgG3tdfvR2bKeL3ebJbaiuz
	JqcO9uJhwCVGBWsT3DsZgZ1SGRPSMMJO05MMeCEqU5JWErIVI4PIBBNnTxpfXy/dkR1+zkof47P
	MGmN9gZpemlLQOUFrwJ67ETNMRc1BNp39hK3j8b07dUHXfFATFIYjFT4DDki07wXwlqvSPAJkhk
	wUoFl1qRrdTl+X4fp45MCdD0X+YJSa0GNPHHCqHLabcs0EztTmdxnl4X4Khk3PUhq+BZOdZY
X-Received: by 2002:a05:6214:2589:b0:8ef:295c:3acc with SMTP id 6a1803df08f44-907783ddec8mr173179856d6.56.1784585420787;
        Mon, 20 Jul 2026 15:10:20 -0700 (PDT)
X-Received: by 2002:a05:6214:2589:b0:8ef:295c:3acc with SMTP id 6a1803df08f44-907783ddec8mr173179296d6.56.1784585420125;
        Mon, 20 Jul 2026 15:10:20 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907786f9de0sm101030296d6.40.2026.07.20.15.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 15:10:19 -0700 (PDT)
Message-ID: <50172752298fe6881b747a21a07a9ab1a1742ecf.camel@redhat.com>
Subject: Re: [PATCH v3 2/3] drm/nouveau/kms/nv50-: Introduce
 nv50_wndw_default_state()
From: lyude@redhat.com
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Date: Mon, 20 Jul 2026 18:10:18 -0400
In-Reply-To: <20260720220633.0A6851F000E9@smtp.kernel.org>
References: <20260720215058.398210-1-lyude@redhat.com>
	 <20260720215058.398210-3-lyude@redhat.com>
	 <20260720220633.0A6851F000E9@smtp.kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DoIFrhIVTgiN3xGzm4DCAQHtr23BaSvBFfxatB1NvJE_1784585421
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-07-20 at 22:06 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [High] Unconditional dereference of `wndw->plane.state` which may
> be NULL if the initial state allocation fails.
> --
>=20
> --- Patch [2]: [PATCH v3 2/3] drm/nouveau/kms/nv50-: Introduce
> nv50_wndw_default_state() ---
> commit 2d2dcbda94d37e6b985a1775b04d636840fd94c1
> Author: Lyude Paul <lyude@redhat.com>
>=20
> drm/nouveau/kms/nv50-: Introduce nv50_wndw_default_state()
>=20
> This commit introduces nv50_wndw_default_state() to ensure the
> initial
> atomic state for a window always starts with a supported value in
> pixel_blend_mode. It hooks this function into
> nv50_display_read_hw_state()
> to enforce a valid blend mode value during driver startup.
>=20
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> > b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> > index 2635458d52acc..dfa1ba45acd99 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>=20
> [ ... ]
>=20
> > +/*
> > + * Setup defaults for the atomic wndw state
> > + */
> > +void
> > +nv50_wndw_default_state(struct nv50_wndw *wndw)
> > +{
> > +=09struct nv50_wndw_atom *armw =3D nv50_wndw_atom(wndw-
> > >plane.state);
> > +=09const unsigned int blend_modes =3D wndw->func->blend_modes;
> > +
> > +=09drm_modeset_lock_assert_held(&wndw->plane.mutex);
> > +
> > +=09/* Ensure the plane's atomic state didn't default to a
> > pixel_blend_mode we don't support */
> > +=09if (blend_modes && (!(BIT(armw->state.pixel_blend_mode) &
> > blend_modes))) {
>=20
> [Severity: High]
> Could this dereference a NULL pointer if memory allocation fails
> during
> drm_mode_config_reset()?
>=20
> If plane state allocation fails in the plane's reset hook, wndw-
> >plane.state
> is left as NULL. When nv50_display_read_hw_state() subsequently calls
> this
> function, armw will evaluate to NULL, leading to a fault when
> accessing
> armw->state.pixel_blend_mode.

there we go. I got worried when it had been a while since sashiko last
hallucinated :).

(there is absolutely no way we could be in the function described if
that allocation failed, and additionally this function has nothing to
do with drm_mode_config_reset())

>=20
> > +=09=09if (blend_modes & BIT(DRM_MODE_BLEND_COVERAGE))
> > +=09=09=09armw->state.pixel_blend_mode =3D
> > DRM_MODE_BLEND_COVERAGE;
> > +=09=09else if (blend_modes &
> > BIT(DRM_MODE_BLEND_PREMULTI))
> > +=09=09=09armw->state.pixel_blend_mode =3D
> > DRM_MODE_BLEND_PREMULTI;
> > +=09=09else if (blend_modes &
> > BIT(DRM_MODE_BLEND_PIXEL_NONE))
> > +=09=09=09armw->state.pixel_blend_mode =3D
> > DRM_MODE_BLEND_PIXEL_NONE;
> > +=09}
> > +}

