Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF65E470440
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 20:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665297; cv=none; b=VFfssj8y0Y0f4rcJJbb2jW/e4HtCza5OP1PfXTPtQHemfai+53sgd3x/wUwIVbvJQx7F7mj3mu7fnA2o7fKEJF3Zx9uHwYwSIXZDEcIhdcZZmMhcwL79FhjlOzHFxH7ERBF1PJuJJJvNg5qPftOzUmLyrystncBfG7lRBhH9f6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665297; c=relaxed/simple;
	bh=mlnFQ99aa8t0Pw6apvxh40TvR2813sTRYaAICMkMrLE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RSt6Ns6kOxeY0hireq69dbn6XmgdvWI44aVf4j42kp+OpipjFNlIt9jDKKhStEX7TP8bd1Vj4IicWoOYFqkGM2Ww0ev+gK6a/TEhya+NiLEqlM2SKaTQLcM1wByXN52MyQKdhVWZTDIkaUxzYo31N3xZSJR6Gj3kQiXNeC6ApR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MtRYTBAZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MtRYTBAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784665294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mlnFQ99aa8t0Pw6apvxh40TvR2813sTRYaAICMkMrLE=;
	b=MtRYTBAZUyXSVK4xVy/uqKNYo6FJHtBnc9xTI5q6Y+uU13GCLbm3NyD8ihDK2SPr5PJzAT
	bdpU1OsUZegoK2PyMTiyb2FV4nYxprzLPvQoJsm5Wn7JAZ3pDmZkvvkD0fdoLfXMfKBBQO
	peQ+H26iTqZcPoCBs4kk0sQpl+XuFX8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-wG0YvpZ5PqKJoh11RYHJyw-1; Tue, 21 Jul 2026 16:21:33 -0400
X-MC-Unique: wG0YvpZ5PqKJoh11RYHJyw-1
X-Mimecast-MFC-AGG-ID: wG0YvpZ5PqKJoh11RYHJyw_1784665293
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5276aa86d00so9695511cf.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 13:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784665293; x=1785270093;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+i9xLnOHuwiwHa9K/+d5RIhTcAexDbG5V5/jyv0DPH4=;
        b=JHuRCo0T5hA3TH1C/sazNTXxny+aRmDoQR1sADEs7ulGGCT14tebeKZoEqOX6BAL9c
         20gRT/Os9kJdpciUMu/bGcNfd7+oLZJJNHhNdEvKNIXH3dE2CLt/SdxjF3BUJFbY8Vom
         06u472cndkI6l6zdAsToSv7TRyXonZLEszAajAXR22B3QoFjcx4KRCjq3TpmbmlaDlSW
         SXmO5CkHA+Bs3VD6pddwvzfE86YeM4aQXyC2GT0tKlrisStkr3II9Zo8/kDFVyG1gqUV
         4QmZH8JY2LIksUm4t0TuynclC9JuI+doCZCF7/lAN1yKQiU39jlqJcTAKJ5hkHd0QUMV
         0Uvg==
X-Gm-Message-State: AOJu0Yy1kQN712ZlU4ACedqJquQBb1JHYWzj54a7a4eZl1Gd67uG1f6V
	F6sz8lVrSwiFwczEbF7yJwVvgrJpHMnzA9mUc3tVScxYanbZesOZOyif+XlgnH+Ofa3t4FEG7Vk
	WvQNHHzuNkipts46Jk9JR/Pet4Rek7Z84htOxULI8lCHdD3x9eC9WhfT5svJKP3QPkm9hfhHTWl
	gWHxpOrBu/OdCLNjYqvDeVPEBiFm2mBPMlncuqrJdEwKPD97faDg==
X-Gm-Gg: AfdE7cnkio/hVxuxqcsH3qCwwNkku/8n0PcUsxoktmujJFWUKoBlYHDpQNuM5fRMksz
	mio+3zOG3wT9yXn7gAisk6mwNEUNnekHvWJMmkP6zQL9MFhey0KJHDIoJpyEm2+/8jUNKmQ+Lj4
	5YOcqVXGwN/hLbAGzCqgYIpxxWSMshIN6A45Wja+smbO9v7QXNOUgnL9WX7YzFog/zgvDh4SEhE
	rKJy3J5XlDe8om9mDWn9UQneRdlj9C/iquwaKRtUWzEnYjQBzXc1fjtL5kMReIs8U3uCokZgjcj
	QB6f6TTAYHPsgPJVD0ogteKKYog0xr/hUAzVgBSHdS9yiGy6cd5+PJKc4ywJ3xmpYzh+rzr2
X-Received: by 2002:ac8:59d2:0:b0:51c:7b12:5ff2 with SMTP id d75a77b69052e-5213d7a6561mr180315191cf.78.1784665292637;
        Tue, 21 Jul 2026 13:21:32 -0700 (PDT)
X-Received: by 2002:ac8:59d2:0:b0:51c:7b12:5ff2 with SMTP id d75a77b69052e-5213d7a6561mr180314731cf.78.1784665292053;
        Tue, 21 Jul 2026 13:21:32 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d3b4149bsm2060001cf.28.2026.07.21.13.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:21:31 -0700 (PDT)
Message-ID: <f0d8c411b2f58a15ac01b5e638f4c871a6c0b110.camel@redhat.com>
Subject: Re: [PATCH v2 3/3] drm/nouveau/kms/nv50-: Unconditionally create
 blend_mode prop for wndws
From: lyude@redhat.com
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Date: Tue, 21 Jul 2026 16:21:30 -0400
In-Reply-To: <20260720211503.4BA811F000E9@smtp.kernel.org>
References: <20260720205541.257781-1-lyude@redhat.com>
	 <20260720205541.257781-4-lyude@redhat.com>
	 <20260720211503.4BA811F000E9@smtp.kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5_uiD948SwLqgL6Z5VE6sY_EwhWIebDMGzMLpZoX8E4_1784665293
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-07-20 at 21:15 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] The patch introduces a conditional check that contradicts
> its commit message and results in an incomplete fix for a DRM core
> WARN_ON. While claiming to 'unconditionally create blend_mode prop
> for wndws', the code limits this to planes where `func->blend_modes`
> is non-zero. Older primary planes (e.g., `base507c`) expose alpha
> formats but lack `.blend_modes` initialization, meaning they will
> still trigger the warning.
> --
>=20
> --- Patch [3]: [PATCH v2 3/3] drm/nouveau/kms/nv50-: Unconditionally
> create blend_mode prop for wndws ---
> commit d890a1a203754ff1359f8cdacfa01e033bb7b8f3
> Author: Lyude Paul <lyude@redhat.com>
> drm/nouveau/kms/nv50-: Unconditionally create blend_mode prop for
> wndws
>=20
> This patch attempts to resolve a DRM core validation warning by
> ensuring the
> blend_mode property is created for all window types that expose color
> formats
> with an alpha channel, even if they lack a blend_set function.
>=20
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> > b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> > index 0f331f47bded8..84b9a16bdb8ab 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>=20
> [ ... ]
>=20
> > @@ -944,6 +937,17 @@ nv50_wndw_new_(const struct nv50_wndw_func
> > *func, struct drm_device *dev,
> > =C2=A0=09=09=09return ret;
> > =C2=A0=09}
> > =C2=A0
> > +=09/*
> > +=09 * DRM requires that we have a blend mode property for any
> > type of plane that exposes color
> > +=09 * formats with an alpha channel. So do this, even if we
> > don't actually have control for the
> > +=09 * blend property hooked up with blend_set.
> > +=09 */
> > +=09if (func->blend_modes) {
>=20
> [Severity: Medium]
> Does this conditional check contradict the commit message? The commit
> states
> the blend_mode property is created unconditionally for all types of
> wndws.
>=20
> However, for older primary planes like base507c, the nv50_wndw_func
> definition
> does not initialize .blend_modes:
>=20
> static const struct nv50_wndw_func
> base507c =3D {
> =09.acquire =3D base507c_acquire,
> =09.release =3D base507c_release,
> =09.sema_set =3D base507c_sema_set,
> =09...
>=20
> Since func->blend_modes evaluates to 0 here, the property creation is
> skipped.
>=20
> Because base507c_format exposes formats with an alpha channel (such
> as
> DRM_FORMAT_ARGB8888), won't skipping the property creation here leave
> the issue
> unfixed and cause the DRM core validation WARN_ON to still trigger?

this is kind of fascinating, it's referencing an issue that was on the
last version of this patch series but is most certainly fixed on this
patch series.

Weird.
>=20
> > +=09=09ret =3D drm_plane_create_blend_mode_property(&wndw-
> > >plane, func->blend_modes);
> > +=09=09if (ret)
> > +=09=09=09return ret;
> > +=09}
> > +
> > =C2=A0=09return 0;
> > =C2=A0}

