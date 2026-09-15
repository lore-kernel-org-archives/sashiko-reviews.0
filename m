Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B514A8A35
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 17:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493290; cv=none; b=jxkN5fHHhcqRFuxr6NHhkzABdOORD/mO/nvnN+MmnhISZt98rxEsYUUm341ZQEvaQVB50N7zUaEhaBcAGkEAPaJzHajZWXZO5GRbkowbJjkXCM6DhYlnWHbNwoc4C0mdxH0qYWrODrUUmRXp+EVXuFLk6eYrgpcibLgfRXCa5hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493290; c=relaxed/simple;
	bh=mQMV+C6BduxG5SehlC0gEQiE9IETMoxRHpnXV+4ZB0I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BW5Ftmgt2crchD5rTq4suXvPtLdqGypnK5IIM//iRrE0DpCPhij4Uiq+AyKYX5hoSclDNTgO3prCHvO+RqD68n3IfoEP6Ns2+fCPku7kgQuphmB3jz4R7hN1aOqZiZL2yEyNrotU7cqH+KHLfk2T+KH3+o/Xxi6M2VT7PebquKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JlXYOUz0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JlXYOUz0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789493286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mQMV+C6BduxG5SehlC0gEQiE9IETMoxRHpnXV+4ZB0I=;
	b=JlXYOUz0HhMTgd2QAa5sDscoT4P8ovgevU5USsZhRVOJ8pVjVxQo/GjhFS8UWwVVKoR4P2
	6RAnRMbASFg51zajZY18jqvsyv/32x+4qR5eLYGbj0u4bxPyUCngLhbgY3bcPbK0uEKtDI
	CNMMDbZHh9j12uXSwu+hz5F1bJFZvWI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-uiGagy8ANyaiJSlBR-aEZw-1; Tue, 15 Sep 2026 13:28:05 -0400
X-MC-Unique: uiGagy8ANyaiJSlBR-aEZw-1
X-Mimecast-MFC-AGG-ID: uiGagy8ANyaiJSlBR-aEZw_1789493285
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90ce8ad8002so107589996d6.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 10:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493285; x=1790098085;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VFBA8/Ye2T49r8xXFW9t78+x+y2UgQcI61D6BtQk4CU=;
        b=KWvB3Y0pyVDmwB+Eacj10b0lWbLbinEWZa6zaSECBE63pNlTMXLWKQspbQXC2yl4iH
         K7cE4NuzgMspTjmtt12HCkkHTsssYYmUxT46VMe7Kg/2CAuolcbmVpBFZxiNX61AqPFz
         vwXbqoV4CrVUCY9jfKXAN+N2uN3E2qWpUqKqy/n3lHbqbs4hUjN/l6iGFajPJs2PoR6y
         FjdYCONcYeIPaEiLthPbyHJKvYK7tJmeFnWk8/xAN6LiubQlqIx4bPLiw9dErgfvyBCI
         lI2Xev3ABsJpQ+H1JQmhlnjKmxejHeshQqwU15TZIvFppY1gRLbVguGnkHZqsL3zQRmk
         40MA==
X-Gm-Message-State: AFuF++k6BfxzDOgh9xmaZV2psMMB6ccc6EyrxV1zdIiuv39U8H4+4X5W
	YcWx4L6utBJrJeyXRCLCTyb1QFi6aWBFoSNOJIFA+Q+ngC2FfvS77VO7P2GOerA4LPAz6zD8T3q
	oTw5Amr4RhCKW1WTx5XYmveBxrIHvlOYjx38gJKv/f+Lgfm0dH3T6J9xPFE5d4mLnu2QmcuSgpt
	7CJmCjxUASihWyIfVMXZ3pTa3Du71O0gGDFIDoP921dpiKk/gIlQ==
X-Gm-Gg: AYBFou3VbEbHbqFE20tKy1474QRJ8nGMM+5R5Z7TyIfEctuz76OlY8x86PRV47+6k5k
	EoBgufW7lMiyVky5KPdVRjEE0OpyD2Uzz8/r+rLsJLL5pFejbYvXMnivz7AcVeCt3mIOwOBdKs3
	8zwUncQmozedQm/TqCI46OdSZCb22GApns0m/CdOv/p3lHahjTh7OV5U5+v1LjJQH0+juhPJ/uL
	u2Z3ACsg+gzGf4lK4ZHt4qA16xKsgOX8iu2i6NYM2yrCTdWxeYgc0/8RW+ZEa3psCbIU8sxMfQF
	EwFjLPbdIz8VHoOOmgcyVS/tnwusW0zt6E+6WO2ar4cSEgwRxgPLHdYcKpvz8FkXqNyt9Q+E
X-Received: by 2002:a05:6214:618a:10b0:912:33a0:5d7d with SMTP id 6a1803df08f44-91233a05ed0mr65594436d6.18.1789493284664;
        Tue, 15 Sep 2026 10:28:04 -0700 (PDT)
X-Received: by 2002:a05:6214:618a:10b0:912:33a0:5d7d with SMTP id 6a1803df08f44-91233a05ed0mr65593816d6.18.1789493283961;
        Tue, 15 Sep 2026 10:28:03 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123bddd5e1sm3872156d6.3.2026.09.15.10.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:28:03 -0700 (PDT)
Message-ID: <0ae3091eaddd1e7fe97f8e3f410ae22cdd59d173.camel@redhat.com>
Subject: Re: [PATCH 3/5] drm/nouveau/gsp/r570: Add comp mode workaround from
 issue #3172217
From: lyude@redhat.com
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Date: Tue, 15 Sep 2026 13:28:02 -0400
In-Reply-To: <20260911223727.1B6D11F000FF@smtp.kernel.org>
References: <20260911222428.752641-1-lyude@redhat.com>
	 <20260911222428.752641-4-lyude@redhat.com>
	 <20260911223727.1B6D11F000FF@smtp.kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 97RKKCeZyvZF4cYWLDI6wfySoG4YeKrzuZXrqLg-1DE_1789493285
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-09-11 at 22:37 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>=20
> New issues:
> - [High] API Misuse causing command rejection:
> `r570_memsys_enable_raw_comp_mode()` allocates the RPC with the
> device object instead of the subdevice object.

Wrong piece of feedback, but there was an issue here.

>=20
> Pre-existing issues:
> - [High] Missing state cleanup on error paths in the suspend callback
> causes the GPU to hang permanently after a failed suspend.

> --
>=20
> commit 9926d57d576468c9d718471d17ce97302fb87674
> Author: Lyude Paul <lyude@redhat.com>
>=20
> drm/nouveau/gsp/r570: Add comp mode workaround from issue #3172217
>=20
> This commit temporarily disables raw compression mode on the GPU
> right
> before initiating fbsr during suspend, and re-enables it upon resume.
> This workaround resolves an issue on Ampere and Ada GPUs.
>=20
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> [ ... ]
> > +static int
> > +r570_memsys_enable_raw_comp_mode(struct nvkm_gsp *gsp, bool
> > enable)
> > +{
> > +=09NV2080_CTRL_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE_P
> > ARAMS *ctrl;
> > +=09int ret;
> > +
> > +=09ctrl =3D nvkm_gsp_rm_ctrl_get(&gsp->internal.device.object,
> > +=09=09=09=09=C2=A0=C2=A0=C2=A0
> > NV2080_CTRL_CMD_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE,
> > +=09=09=09=09=C2=A0=C2=A0=C2=A0 sizeof(*ctrl));
>=20
> [Severity: High]
> Does this code allocate the RPC with the device object instead of the
> subdevice object?
>=20
> By passing &gsp->internal.device.object, the header receives the
> NV0080
> device handle, but the command (NV2080_CTRL_CMD_INTERNAL_MEMSYS_...)
> is an
> NV2080 subdevice command. This mismatch between the command class and
> the
> target object typically causes the GSP firmware to reject the
> command,
> causing the workaround to fail and suspend to abort.
>=20
> > +=09if (IS_ERR(ctrl))
> > +=09=09return PTR_ERR(ctrl);
> > +
> > +=09ctrl->bRawMode =3D enable;
> > +
> > +=09ret =3D nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice,
> > ctrl);
>=20
> The write operation here correctly uses &gsp-
> >internal.device.subdevice,
> which seems to confirm the intended target object is the subdevice.
> Should
> the nvkm_gsp_rm_ctrl_get() call above also use the subdevice?
>=20
> [ ... ]
> > @@ -104,6 +140,17 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
> > =C2=A0=09/* Stop channel scheduling. */
> > =C2=A0=09r570_fbsr_suspend_channels(gsp, true);
> > =C2=A0
> > +=09/* Temporarily disable raw mode to prevent FBSR restore
> > operations from corrupting
> > +=09 * compressed surfaces. Required for ampere and ada.
> > +=09 *
> > +=09 * Nvidia bug #3172217
> > +=09 */
> > +=09if (r570_need_raw_comp_war(gsp, device)) {
> > +=09=09ret =3D r570_memsys_enable_raw_comp_mode(gsp,
> > false);
> > +=09=09if (ret)
> > +=09=09=09return ret;
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but does this error path
> leave
> the GPU channels permanently disabled?
>=20
> If this function returns an error, the Linux PM framework does not
> invoke
> the device's resume callback. This means
> r570_fbsr_suspend_channels(gsp,
> false) is never called, potentially causing a hard hang of the GPU
> session.
>=20
> While not introduced by this patch, adding a new command that might
> fail
> (especially given the object mismatch noted above) heavily
> exacerbates the
> missing cleanup on this error path.
>=20
> > +=09}
> > +
> > =C2=A0=09/* Save BAR2 allocations to system memory. */
> > =C2=A0=09list_for_each_entry(iobj, &imem->list, head) {
> > =C2=A0=09=09if (iobj->preserve) {
> > =C2=A0=09=09=09ret =3D nvkm_instobj_save(iobj);
> > =C2=A0=09=09=09if (ret)
> > =C2=A0=09=09=09=09return ret;
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but this error path now
> also skips
> re-enabling raw compression mode in addition to leaving channels
> disabled.
> Could we use a goto label to ensure proper state cleanup before
> returning
> suspend errors?

