Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED8A47AF5C
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154995; cv=none; b=cVW+creaplpDZXfngSSVXSI/+w1k3J3673AuBfQorA2FLLaF52vST7KN6+xsx0vJd3z7WVPs/fYE4yTpgjiy9I/6wNVrRymGbWJPCEBlALqI9Gr7EpTkXLNKoRU68lwL6fScXb3zBIACnEsGlZbB1x2GrhqwrSQS1RmkKRZUwzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154995; c=relaxed/simple;
	bh=/+ZNOWjMTgJ3M827GFuxVRkM7lP467KrCdNhcMzDs4U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tMg+KYFtepBdHUZ14GPA0Ks1SgRapE4lWuHab4SJhk+YTyOv/Pqv6+5oUzLAltyMIirRKPaAtKTsE1N1M1413tCznStRvOmv5iI74iXM3HQRZxyuRLWu0bEjE6e1CYxypmHj6vH4aPmBQfRED/4dcM7n/Zpcs0qZWYK4+5vUN+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=asyx3n3l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="asyx3n3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787154992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/+ZNOWjMTgJ3M827GFuxVRkM7lP467KrCdNhcMzDs4U=;
	b=asyx3n3laWMuvDWfrrSBph1oOR4u+Gfe3a5nTeHk70z6KUth77geMm/1sljqgcKwiWsOTD
	hovLB8Rpi7ye6uCdGXK+rFH3gQxcigNS8/VFKbScPtWnf8N398Q7AiYiMIsSkO3blolhRy
	4tMPec3CR9tgb3uwYEYovJtFcJiEyFo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-Lut-eM0wMoSshEbvHfBXbQ-1; Wed, 19 Aug 2026 11:56:29 -0400
X-MC-Unique: Lut-eM0wMoSshEbvHfBXbQ-1
X-Mimecast-MFC-AGG-ID: Lut-eM0wMoSshEbvHfBXbQ_1787154989
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so161447785a.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 08:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787154989; x=1787759789;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F5vUKJd+Fx6qdwgKK5H/zWSFLopJUSNyg1KMkU6sF0w=;
        b=r3WxuKEPRY06+XzHBWJsLjzGXc3PyfL7pwrHBPuCprL6oF5luhUz+o0uwTpBXqUEjl
         Eep5p7efnWyd/qSD59mVriN9GYkNS9DtwKU8dHgPK+vU3+2AP0JcUs2ik2HvaVlU5QfI
         +HavG9FpWHaVIi3P2sY82wU6O1e3i32llinenqxFYCwXcNx6ydC98lNDbhlCrBxzvm6Z
         nnC73Vd5/eAoyMUp8Y0EcgSdaMG2DvWeONNddyTKfnM78uLp5f+VH8862epTE64NcXYM
         Br3l8MCxAxKl34FJUFL9rfYfajAmaNGVWQsPsYqxIHntFfI1pq/1olMqj/3rEP12dzuc
         8u0Q==
X-Gm-Message-State: AOJu0YyrSlaDP4SR1uZoXLhawBphow7GYkdY1sUKBzlW+wFnJB5ZYF9s
	4UxNWv8iNvG7yzl9lEIGq2dTiO7TLxEyn1N+rb05gElHha3whZ3xGkPDJ/bJoEaBTITwP7DFMRR
	FDys/srbGeT44mEFALCwFSatSV0eIOLezU8qNASlXEYFtBn46i97YDos3mGdIBRN1k93f7q91By
	tuqLHFLkfD0moSe10ZGuFoujcnf7K2bGmUccs4Gg735h+bgIIbnQ==
X-Gm-Gg: AR+sD113SBJnOoY5ZqhjJC9O55j9TooJngV0fM3aiHSjwJqjs3SHpGZjQRqp8KFKtFp
	bER4LSmQn0VSr75pkxyVIHORzqHfolSWGWuUX15GGDN71hbn/x9NE0VWA0ghJrPlqQ/Um+xlvsO
	YuoqD8fHLlcPbFdqT+q18na/XeGjpjVclkHKzVjgomGgPlFI/C1Lqhgmw5Ayrk6KimPSWIkIiV+
	H9BeIMptsEsYNv9nEnuIM/GLz+60WJMQ3kdsMpSKV5XAG1rKnTwVZ9tGZjGaFxpjZDaZ5zEfooJ
	JkPVoDo4I0NkVBaSD2upGdyVEZ8gNTWHBPzfdhJ9ERrUlorPzWZXHWgUz+ACPB362IeeN0od
X-Received: by 2002:a05:620a:4892:b0:936:e938:b07a with SMTP id af79cd13be357-9371e2034camr505740085a.8.1787154988782;
        Wed, 19 Aug 2026 08:56:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4892:b0:936:e938:b07a with SMTP id af79cd13be357-9371e2034camr505734685a.8.1787154988067;
        Wed, 19 Aug 2026 08:56:28 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937204a8a12sm163619685a.14.2026.08.19.08.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:56:27 -0700 (PDT)
Message-ID: <0a92094178471f577c76f497ed9e42913f74bf57.camel@redhat.com>
Subject: Re: [PATCH 5/6] drm/nouveau/kms/nv50-: Add
 nouveau_encoder->audio.crtc
From: lyude@redhat.com
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Date: Wed, 19 Aug 2026 11:56:27 -0400
In-Reply-To: <20260819001052.A7B0E1F000E9@smtp.kernel.org>
References: <20260818235637.1738055-1-lyude@redhat.com>
	 <20260818235637.1738055-6-lyude@redhat.com>
	 <20260819001052.A7B0E1F000E9@smtp.kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e6aAMiyEF2tSjC6m6kDw_kM1aVJBoWg3FSme3MGvFNQ_1787154989
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is also a hallucination. We don't have any kind of audio support
for PIOR.

On Wed, 2026-08-19 at 00:10 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] PIOR encoders do not clear `audio.crtc` on disable,
> leading to stale audio state being reported.
> --
>=20
> --- Patch [5]: [PATCH 5/6] drm/nouveau/kms/nv50-: Add
> nouveau_encoder->audio.crtc ---
> commit d00b281328e092a25d08552356c0a7fc11880073
> Author: Lyude Paul <lyude@redhat.com>
>=20
> drm/nouveau/kms/nv50-: Add nouveau_encoder->audio.crtc
>=20
> This commit adds an audio.crtc pointer to track the assigned CRTC for
> an
> encoder outside of modesetting locks. It replaces the usage of
> nouveau_encoder->crtc in the audio ELD retrieval path.
>=20
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > index 63d554e97fb62..3bfc04f7ef602 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > @@ -636,7 +636,7 @@ nv50_audio_component_get_eld(struct device
> > *kdev, int port, int dev_id,
> > =C2=A0
> > =C2=A0=09=09nv_encoder =3D nouveau_encoder(encoder);
> > =C2=A0=09=09nv_connector =3D nv_encoder->conn;
> > -=09=09nv_crtc =3D nouveau_crtc(nv_encoder->crtc);
> > +=09=09nv_crtc =3D nv_encoder->audio.crtc;
> > =C2=A0
> > =C2=A0=09=09if (!nv_crtc || nv_encoder->outp.or.id !=3D port ||
> > nv_crtc->index !=3D dev_id)
> > =C2=A0=09=09=09continue;
>=20
> [Severity: Medium]
> Will this cause stale audio state to be reported when PIOR encoders
> are
> disabled?
>=20
> Before this patch, checking the cleared crtc pointer successfully
> skipped
> the disabled encoder. However, it looks like
> nv50_pior_atomic_disable()
> only clears the old crtc pointer, but not the new audio.crtc pointer:
>=20
> nv50_pior_atomic_disable()
> {
> =09...
> =09core->func->pior->ctrl(core, nv_encoder->outp.or.id, ctrl,
> NULL);
> =09nv_encoder->crtc =3D NULL;
> }
>=20
> Does nv_encoder->audio.crtc also need to be cleared here, or does
> nv50_audio_disable() need to be called in nv50_pior_atomic_disable()
> to
> prevent userspace from receiving stale ELD data for a deactivated
> display?
>=20
> [ ... ]

