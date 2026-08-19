Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FBC3A901C
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 15:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154863; cv=none; b=u5n1Lm6YYrs4sFRFnnfasf7G6Ck1A8S5KP30hvnDum1GUAU1hXJZhN8/AolMfEJPppbWMnlDCiky6KptQBD71CfBQ300Da7UeNMl3Z8blNaEwceyyvsNDgdJ5FOHQo94K3A9VMPzmyrRuEsid5Z7OrQkM7RW0C2gOIAZEhj7cg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154863; c=relaxed/simple;
	bh=YMx6B6wQ0d9YA2ziv/pklHaoes3pKBFz90L+1nYEWOo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NO7Fin3KKwBHsWPib6LFI2ymZTP3hapE1+Y3e4Ch5qYRnUs0LY/pEkl+8tMXyMCxpe+zV2ozEPepw9Ag+0KGRMGJrBVdmCwXm3GoEeLAk6c5nwwO0ToGkDCqYglGgq+2rY7dvliyHvUuTIrwFn2urWYysyWA9L2WAKHL5T2I528=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E+1iBpOJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E+1iBpOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787154860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMx6B6wQ0d9YA2ziv/pklHaoes3pKBFz90L+1nYEWOo=;
	b=E+1iBpOJVzYVaoBdKgvso+242/qygiMGWYFJ6iXpAGkXa5uYBr4Yx5YmkKT7mMU89BaZ3k
	IqIgXgiOjCKRCZhSNZhk6So2tF9KUb6VbSxpKCclwGTa1zzHqJj0N4vPEYJGYWoUqu+aHp
	YZpPOvauz+4+h2sMzy/k50sbt1+zK40=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-r8NJBl0NPEWBWky-KnvXjw-1; Wed, 19 Aug 2026 11:54:17 -0400
X-MC-Unique: r8NJBl0NPEWBWky-KnvXjw-1
X-Mimecast-MFC-AGG-ID: r8NJBl0NPEWBWky-KnvXjw_1787154857
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f45dde7595so9578516d6.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 08:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787154857; x=1787759657;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+IOUaFC3Xsu+BadyrY5BgXGxb/Top6L0MSw96c1AhE=;
        b=l3E/ek3fycY5zvzHiTc423Qev/oGby5vPrNBEfmCocmLGWvOKLGXKq8NZlkBG+LkPa
         QEY7P+iTGjPRhGouykaH+klziEq2C7/hclgJ4bfpWSR6jiU2bCsm2l+LXQIBNo1dzyqB
         ys9X2RPjtB5zplhwoqxRAcJ7IYbV6bP0e2En57A7u9zQPD9b2CbTLVldsPwxl185rOTi
         ppz7oOpzvP8pP6FCIxXtudD4VZWGt1skO4Lj7JWP+grti/IObmfy9TZa5rE09Ox5trZz
         ZAdsuHagXAkDb4eQGqTO3/aCNitdg/ucMy95pEJeYkx5MNnxRXNgcF1JGluzjN6RSXVD
         xQiw==
X-Gm-Message-State: AFuF++mb9vhuLrS5KbQRMH+L3qgL7gkf8td534f++lbyIa5tIDOCCsER
	aQCAzm+Jygr1VHqUr3CWiLPUGWk6tsnGjrRGYB2HtNVTKpsaBkPA3RaT86P0IfgDr8fBHOohOag
	0oWDHtr6Rom+LQFv9TMpblpnmnnN9tk3m+EvDXUB08PHagTz/IiujDG2h0M8ZIpbRcreGtOqfiS
	N07jnd6YOBtdq6zZE9TwP0lF0km5HFJCTq/lxuXEcLLOyWfavjcQ==
X-Gm-Gg: AR+sD111jzA+7lBKJHxW+GY1UOwrS0GXIH1o73ynSDukWn1YNDMWdbgpu+0dagCeZEM
	Ei9eFkpbKpyIwXbXsCvMHUcVITLsucWJVD44AWLJiLlKsTdT1l9Cr+4aJyZjrsUfyZnR2YAHlPj
	fdklwkdk+ud/hpHICcJparIag2Hrwf38+xxHW0bCrR5udH9o2ZwKOgOgHO4XrMOwNXo3ik3Cg2K
	257OvvuasuoNblbS5aGR4ykNmBgkBQFZbOsKT2IkZR2a14Z68tPiIWr0Jxn8+M1n+bC7/KylmVR
	UpNoe/qNCflT3f5nU0f15PwOPXAro/8Oli+ik7d64A35Fud3tk/3xmgUfqiSjQjwsQTpc50G
X-Received: by 2002:a05:6214:f6e:b0:907:44ac:7d12 with SMTP id 6a1803df08f44-90c5e659cd0mr55100436d6.0.1787154857019;
        Wed, 19 Aug 2026 08:54:17 -0700 (PDT)
X-Received: by 2002:a05:6214:f6e:b0:907:44ac:7d12 with SMTP id 6a1803df08f44-90c5e659cd0mr55099656d6.0.1787154856327;
        Wed, 19 Aug 2026 08:54:16 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5eec934bsm17474696d6.15.2026.08.19.08.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:54:15 -0700 (PDT)
Message-ID: <bbda3e7e66afbeba1bf0d4bb1d7104e69a166e1e.camel@redhat.com>
Subject: Re: [PATCH 1/6] drm/nouveau/kms/nv50-: Move DPCD backlight disable
 into its own function
From: lyude@redhat.com
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Date: Wed, 19 Aug 2026 11:54:15 -0400
In-Reply-To: <20260819000720.D19471F000E9@smtp.kernel.org>
References: <20260818235637.1738055-1-lyude@redhat.com>
	 <20260818235637.1738055-2-lyude@redhat.com>
	 <20260819000720.D19471F000E9@smtp.kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zsqucXd3OT44DUuSOrXIaOevGyZVFiqvryOraetWBgw_1787154857
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

omg

On Wed, 2026-08-19 at 00:07 +0000, sashiko-bot@kernel.org wrote:
>=20
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> [ ... ]
> > +#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
> > +static inline void
> > +nv50_sor_atomic_disable_backlight(struct nouveau_drm *drm,
> > +=09=09=09=09=C2=A0 struct nouveau_encoder
> > *nv_encoder,
> > +=09=09=09=09=C2=A0 struct drm_atomic_commit *state)
> > +{
> [ ... ]
> > +=09if (!backlight || !backlight->uses_dpcd)
> > +=09=09return;
> > +
> > +=09ret =3D drm_edp_backlight_disable(&nv_connector->aux,
> > &backlight->edp_info);
>=20
> [Severity: High]
> This is a pre-existing issue, but moving the logic into
> nv50_sor_atomic_disable_backlight() preserves a potentially
> problematic
> sleeping call in an atomic context.
>=20
> Is it safe to call drm_edp_backlight_disable() from this path?
>=20
> Because nv50_sor_atomic_disable_backlight() is invoked by the encoder
> atomic
> disable callback nv50_sor_atomic_disable(), it executes in an atomic
> context
> where sleeping is forbidden.
>=20
> The drm_edp_backlight_disable() helper performs DPCD transactions
> over the
> AUX channel. These transactions require taking a hardware mutex and
> can
> sleep or block while waiting for hardware responses.
>=20
> Could this lead to scheduling while atomic kernel warnings or
> potential
> deadlocks during display disables or modesets?

This one gave me a good chuckle. This is a definite hallucination, it
is getting confused by the fact that nv50_sor_atomic_disable() has the
word atomic in it.

>=20
> > +=09if (ret < 0)
> > +=09=09NV_ERROR(drm, "Failed to disable backlight on
> > [CONNECTOR:%d:%s]: %d\n",
> > +=09=09=09 nv_connector->base.base.id, nv_connector-
> > >base.name, ret);
> > +}
> > +#endif

