Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F37947DD4B
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 17:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245447; cv=pass; b=KHykGSULju2Vht/KjqepkILJmhL4utmWm0ea5/3cZCCCEIGXNveLkeMuSQb0ZgpvMMAhV5CROp7OWzlhrloemuie9CRZTO+aA/RD+4dItnyYfR/KxmIc+XaHhns6RU2F8cUVFV9yoM4BbeivLogrr/UjwfMB1fuX1FgSjpMM12I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245447; c=relaxed/simple;
	bh=1WKysWh+k9Nf6ZtBo/sSGuC4ZmwAqH3PAAVd6j9LEHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wmd+KvB37a7tKQzZh3ZgVUw/gyFnzXBM6CUd282SE5nAKr3xVlKrHvtD1J4Gd/tcTj6ADw6XahZuc9pNKAi6IdIAqUO480Z+F7kW53mFgAM9P2KUr5zkqtnE/Cvmp0SLOsXZbxF707Sp/tSuwVM8q+6tbfr+EW8IhWdHmmrEpMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKI0sO1h; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKI0sO1h"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so1774661e87.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 10:04:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787245444; cv=none;
        d=google.com; s=arc-20260327;
        b=oI2HxI3yCDctqCCnPSGrmfK+BXzF9Gcu6ibUPXLTZ9D51SVbsVI7IC5+W4p/frQAM+
         pb7NW4MliBqa65jk17EbfoM9XbZdSYQjnh76OG6MKb/C5xFJodB9O3JyKAs3lwn304fd
         aNNyRsfuItkvZ0jo8itJUly8TFYtE2wSPCZgbSwqTY8NG0Spy155lgRDNei+A6PfvI4R
         eYOKcmwNZuRSTRq2QVuvz/69owtZt215vgoT1ItbX8vhCliYn2t9iWsx5wyCCiWapSGd
         hYno8PjS7AoUdKqkCP5P7w1UmoM82NBcEZa+fDJ17Z//0l7s1imNvBo8BYZXe9TbOCI4
         /YGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IIkgwb1Qi9IIwPivKlXlZcMTAwsxzm2MJ22/33JPb8g=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=O/iIb+fEyCXiNTUVHDq5ObC1ucTMN5+eXPTLtDocCvaUG9+YISa8LDui44s0dP2+VI
         JS9nBmagSZUJHnfA02INXXshH44SpRZVJ4Gld4lXyGcbSM8DGTs5P4xlYA7rOeWESMjY
         cQMy9Bzj4mAwdjGAJ1c4IPKb4HkORJmMagR8/JVscWKIqcpiMTSuuxXUnaUpuMaXh+Rd
         j/trSL2ltScg/iPZfB0MGfbdVfYK+/08ZP2glnQ+6H2c+JFNpAeeyh2stRkkWuOqMyNK
         NAiuVORBlTiQJavT1Rn6yZl7xauVnDWg7TUA8yqJ1auh2JYjZE7REME7nnH5gCFC1Q4F
         EVBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787245444; x=1787850244; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IIkgwb1Qi9IIwPivKlXlZcMTAwsxzm2MJ22/33JPb8g=;
        b=dKI0sO1h+CGb2CT5poskfOHZ6TDMfCB5zbizymad3mq/NDMVU3JNgpzi+Y+/i4Nsh1
         6xxxN7XdC93lAow7rI+WSD3wibxV4gdTlPaOV2UjqjqxKRIxHENer6NEMqLOAoZ0iQVR
         d2t4eMgtwzMYqlHGcOPUTxRgrpSmLACu++l6cdOVT8lG4YPuO9fz13GDKWe6o5NAsgyq
         A1QTC4I7i7WMcycqoegs1Plep+gHvAgYsCRBfT/TPTzb/fOJs8o788C/JXMIEFA4VVmy
         V0kvv/O3tY/Cq+hD/ZsBwJJFE8IRb8z0KGr/tDCTbRMI6VTCdrNuS63w/Bpw0noDr246
         fIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245444; x=1787850244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIkgwb1Qi9IIwPivKlXlZcMTAwsxzm2MJ22/33JPb8g=;
        b=AOB6qJCoyE7RJp4DvF8R5dJ6DomIYp7vqC2OBbHyYC597SBQKuWwihBaAHuVMxtlUv
         mz3i1rkUZ+9Tih/jAp4QACluX00wq5Y3UAXCTM1zkVRxx2Il0zqBctc3/QgwNhxN4aQe
         OOcpDiy7b/Vb+OqPxlBQNP/b7ReJwe0dK6zN6jrtERYQ0u5pyy9cRph1XKlXZ/kUa01K
         krMqQ4ih0JSti5aFPf/5Yct4Kt7ZU+1lba9O6+RNA3MtsVmC3HdbM2gz3ZQYZhs6G7/P
         GUF7obKp6jUhkZcmUHoN6vDM85aVuIix0OgVOVF7AxhzeY6N6O6MsgD2ZITRQ5oslxXE
         X56Q==
X-Gm-Message-State: AFuF++kyPNL3UDSJwEroQ2PAFDB7aMwIgJxAQ23WQ898HSvzTjXhO1HC
	0cLA7B9VQqOJkGhJIEew2qhtNZTERUsVcioLWB3h4r0Yzpvz99hhE266kA+aOemMjcGk4DEZotL
	Pg3FEXmevinbVlR9vYzy+RaYBvu5zk4127dau
X-Gm-Gg: AR+sD10OWMXOoNmJd/s/NHkdQsxUAMma43a7sYhnd0seOclRVEYNOsX1+lndxkrQO0j
	xaKL+bBBYPMxuaISKuj3fzOzHlqW+SA+4Dxw1a+pqsSsRIZ+6Q0u5Axapj36nQHWuWAXc9qbRRn
	hu55lKrZ5pXFvVdOHZVvFPbhtqWrpMlNhbODtv1bbWXcr7VKTAjDOZ/uji3dqnM+ECVHb/koHvj
	P8hubiaVz8HVscXvfMm4+O+8uVQFpJHOPLr047KOXFGJNVQWGc5swqOSeyoIRTMGvj714G8cg4e
	OAMnsWIZIkHeodyXqqzSon7LG+GYbmWWFMvZHTnJEt8=
X-Received: by 2002:a05:6512:3988:b0:5b2:aa5d:9ce7 with SMTP id
 2adb3069b0e04-5b47d4f55ddmr2350758e87.10.1787245443748; Thu, 20 Aug 2026
 10:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
 <20260820164929.17117-4-mohamedahmedegypt2001@gmail.com> <20260820170147.C0EFD1F000E9@smtp.kernel.org>
In-Reply-To: <20260820170147.C0EFD1F000E9@smtp.kernel.org>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Thu, 20 Aug 2026 21:03:50 +0400
X-Gm-Features: AcwNN1V9FlMJ-LWtJ9Pc65CSZG9MLJjpQy86MYExt0qd7F4yhYJlqhBo3X8SD7M
Message-ID: <CAA+WOBtXtzhDn+KrwBJNHMg+F5jw874j6qmGj0nH9upd6f_-9g@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] drm/nouveau/disp: route GSP-RM display MMIO
 through nvkm_disp_func hooks
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 9:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Pre-existing Use-After-Free and Double Free in `r535_disp_ne=
w` error path when `nvkm_disp_new_` fails after subdev registration.
> - [High] Pre-existing NULL pointer dereference in the error path of `r535=
_disp_new` due to unconditional lock initialization on a potentially NULL p=
ointer.
> --
I saw those and can confirm they are very much real. However, fixing
them is out of scope here (I was actually going to roll them in at
first), because there are 5 (that I have seen, might be more)
r535_disp_ functions that have the exact same issues.

>
> --- Patch [3]: [PATCH v2 03/10] drm/nouveau/disp: route GSP-RM display MM=
IO through nvkm_disp_func hooks ---
> commit eaafa1eb740ad36427480951cde140701ddc6d3a
> Author: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
>
> drm/nouveau/disp: route GSP-RM display MMIO through nvkm_disp_func hooks
>
> The GSP-RM display code in rm/r535/disp.c borrows a few
> register-programming routines from engine/disp (the head-timing
> interrupt handler, vblank enables, armed head state and scanout position
> readback, the AVI/VSI infoframe writers and the GCP AVMute write) and so
> far picked them by name, which means it has to know which chip it runs
> on the moment a generation changes any of them.
>
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/d=
rivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> > index cd4451e625122..f3e55253bcbca 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> [ ... ]
> > @@ -1688,6 +1729,7 @@ r535_disp_new(const struct nvkm_disp_func *hw, st=
ruct nvkm_device *device,
> >       rm->uevent =3D hw->uevent;
> >       rm->sor.cnt =3D r535_sor_cnt;
> >       rm->sor.new =3D r535_sor_new;
> > +     rm->gsp =3D hw->gsp;
> >       rm->ramht_size =3D hw->ramht_size;
> >
> >       rm->root.oclass =3D gpu->disp.class.root;
>
> [Severity: Critical]
> This is a pre-existing issue, but can the error path in r535_disp_new() l=
ead
> to a use-after-free and double-free?
>
> If nvkm_disp_new_() fails after subdev registration, the subdevice is alr=
eady
> attached to the device's subdev list. r535_disp_new() handles the error b=
y
> freeing the dynamically allocated rm struct:
>
>         ret =3D nvkm_disp_new_(rm, device, type, inst, pdisp);
>         if (ret)
>                 kfree(rm);
>
> However, disp->func still points to this freed memory. Later, during devi=
ce
> teardown on the error path, nvkm_subdev_del() invokes nvkm_disp_dtor() wh=
ich
> evaluates the pointer:
>
>         if (disp->func && disp->func->dtor)
>                 disp->func->dtor(disp);
>
> This dereferences the freed rm struct and calls r535_disp_dtor(), which
> subsequently executes kfree(disp->func), causing a double-free.
>
> [Severity: High]
> This is another pre-existing issue, but can the same error path cause a N=
ULL
> pointer dereference?
>
> If nvkm_disp_new_() fails early before allocating the struct, *pdisp is s=
et
> to NULL. r535_disp_new() then unconditionally attempts to initialize a mu=
tex
> on it:
>
>         ret =3D nvkm_disp_new_(rm, device, type, inst, pdisp);
>         if (ret)
>                 kfree(rm);
>
>         mutex_init(&(*pdisp)->super.mutex);
>         return ret;
>
> Passing an offset from NULL to mutex_init() will cause a panic when it tr=
ies
> to write to the mutex fields.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820164929.17=
117-1-mohamedahmedegypt2001@gmail.com?part=3D3
