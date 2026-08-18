Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF133BAD89
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068380; cv=pass; b=LFgQw/Z6oMUA8EfF7o1OGgwACDzIKFy9C8+jbQYnezO9x00reXnJeOwc06NE+jPQONgzMq/EB3Ag9ysOMRGMYb9CjZtV7Pe7odlIAn1ujIC+R9WhulSSQH/tu7hXqRmozYGXflsp6TUmEa1V4JeRH22HFMgAff0kTFZnK9j7zY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068380; c=relaxed/simple;
	bh=1kTbTunB2J8BD1DE9HFuQ1A9DIRO2S4o24khG0LrwfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZDWLnsQfMUSon65gknaxBot/lwr6vAwbSgCMwg03siPSc3nZl2+q09g9YBoSqaLxKZpyqPC2lXyGrzkvxg7DLtsTOIHI+ymeRRamb0kJmBd1AwBA59LNEF03heDWaVWhXsI0ux4Z25RofnakpB5bNR1XD9fzsQAVA2DSD9Dzmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VA+pxHKv; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VA+pxHKv"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66c67a73eb7so1632481d50.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 08:52:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787068378; cv=none;
        d=google.com; s=arc-20260327;
        b=R4Bzp54NL9Xxhx2hPV0CyJkKMlCB7DwkEThZdk6PngMBSK2IPIn+5jtj5DrCeA6VKE
         H9TPrH62JJiiF9LIc3GcnLhDFdYeEd38kje8bWzHWUCvVaGpaxLzPGDZWOEhLKeURZhl
         vA3NsVxTSfmKddUTKA8rjQqGa/cOc2PfjDQwEvfCjIP/xwg9IBBHHD1/MvcFBQBrvE7G
         ZjEI4qwvNwKq3iAGoQ8AsFnD3n7bhttktwHhm16zibhusy9E5pnDlE8f0sRPUoucRVDA
         3lZfYbF0UD2tDifLTahKOcMxUXwI6ZV4qc3C3t7+iE8HEOjxI9F5/KRtU2rBv1syAb4F
         TkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O87k030fj+c1l8ObQoZQTDikjP/1edGoaP5zsebcvzM=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=rZJvbhwC5rHb0u7NpTu7wQ/CPrKkNwGAIZOodw8UER/j1Fvjj05SMfmo+c9IkDudl2
         oJfL9pMPvTgkg++VeLmruHCdXrhVzF1hH4lg7xNoL9WTIYSPkgXJSviwo51Krln/N7NY
         0dy4agZqFap+fYmMyU4SYBwYzU5UgAUBpHUTNuFJiq8WKTSjslrqhpofkmTOP672czl6
         svG/LzrFZYnblDbA8suWaq+UAlgYPMAyxYEY/Lr8ID6g50ZL7rMKnDtTYbuZ4XY5vEhZ
         hRujolwGHL7sC2XC2TC+d/+3/fiSWpRz6Zd/oe5ErFuhd+SOfIqjz9H0b/Kkcos3B1YT
         wy/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787068378; x=1787673178; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O87k030fj+c1l8ObQoZQTDikjP/1edGoaP5zsebcvzM=;
        b=VA+pxHKv63Y6qi9iCU60eHhExvYSYRrdSSb6vcr4daXs6sEiGe9sj3FVj3lSqiSVM+
         fNA13LpgVIxGPBe3vMqJXvOVp9i45NbdK9840wKThzGxCQxSUCMOgARAX613+7oVodfj
         4p8ymlQBAcmo7tJ7LBlAx8e7G+TXTKFDB77wfAF3ZHRywViSsG8TCNh02mF+Fb7aB5zj
         sdz3fRavv6KBdGE3hJMmr7keNjrm7aFJ7Ppjk7kPXgohYLDw+Vo76XML4YpUcrZUsiM+
         5O+//FqX+yVZz3HVITb2ErTkDgHKIc28siRfKNmNnQ+lKEvwzUdjJyJIiJ/jBvwvSVil
         5LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068378; x=1787673178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O87k030fj+c1l8ObQoZQTDikjP/1edGoaP5zsebcvzM=;
        b=f44lHlXk8rUfe83bdcztjKKp8YuLdITgGzaQvrA7AL6LtIJWb14bIUgri40w+iXNu3
         ohclLkJr7e+Kwmwi5WSgNa2fO1HBKHGbhREpq/KmDx6EyFMnNkzbLXxaQwfZBKBZifYh
         eJzAtpONEjudteDBIG0x5Y83WPmAKpPZ1Sfap8tF5+BJYCtbYTmZ01CISEB4rDBrcIBF
         kifwhMVoM7eCjgMkKJlE+BXJmliZ+IDJ+kecZyN3rTd3OvVfLMK4eoSmdmmqbmPUo83C
         eJTSeDA/KT/T0LXTzDFqBjd0IsRvtmSUTtfgR+pQmbuZ9Ho5DT1ao2hbIyrDlW113Qu/
         TZKQ==
X-Gm-Message-State: AOJu0Yx9rUSV+U3/TuCQk5MKc1sYDLM4S0vhxKH+B43uzv6I4h5Q9ohw
	/+xm5w6K3v4OFnlP9Vvka7cU8d2EY+Kll6kPYBr8932BDJEagqa6c/MBOtRcngwoiVLA0jcM+9o
	1uqs/ALW6S7rdUskzQW6pVJlGKM8SeNu58r0/
X-Gm-Gg: AR+sD117i8XTc+j8wsSvcylT4bzO6Uic3buqO9zSvKu0Ust2TSvhdmyuRu//Ri5Ik4H
	NnXjyv5LYN4yN1myczeSTYNh2xaLQ/MQdroIs4AP7wz6sMfCCDpRcJ7MwzfTRhvsnNPoZduD8eI
	k0K+L1YfNV7alGUhcU0UvcqmjfL2E3sO3px/nHRgfYzFfpqQvv+FtCFjGXxUDY1qFBIqdoy3V1R
	rJiMdDa+cRVPmdpKW64mK2QuPcCXxQtLclaF0eM+3RX/s4fCxMaP7Ol5iD5lPmWWoc9Sr7pc0Vt
	n5im9efoH5rXMaQo/baLXH1fPzZGQcdLKFh8K2ezcTIViUsFaUDTQGWXXrIrcB7OChDhxVFQMav
	dQfBfw+Vj7wRHA1vJblaSe4A=
X-Received: by 2002:a53:ed85:0:b0:66c:46f8:2f0 with SMTP id
 956f58d0204a3-66cbc40e5a1mr1868124d50.26.1787068377601; Tue, 18 Aug 2026
 08:52:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260815-null-fixes-v1-0-0df9dda951fb@gmail.com>
 <20260815-null-fixes-v1-1-0df9dda951fb@gmail.com> <20260815174056.B0ED91F000E9@smtp.kernel.org>
In-Reply-To: <20260815174056.B0ED91F000E9@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Tue, 18 Aug 2026 09:52:30 -0600
X-Gm-Features: AcwNN1WVDiy8KQ3o0wrfgqofVOccezwHUz5anToCGuW1uzXm3eLmSP5eGt7Z-Wk
Message-ID: <CAJfuBxyGobBD_=p8Lmv6F2mPJNe-SJ9+fHxW3jMS3CtRXM30oA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: Fix NULL pointer dereferences in
 GETPARAM ioctl
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2026 at 11:40=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] The patch fixes a NULL pointer dereference in the `GETPARAM`=
 ioctl when the graphics engine (`gr`) fails to initialize but misses an id=
entical issue in `nouveau_abi16_ioctl_get_zcull_info`.
> --
>
> --- Patch [1]: [PATCH 1/2] drm/nouveau: Fix NULL pointer dereferences in =
GETPARAM ioctl ---
> commit 6569813c05cdc1cf39cfd469b6745e81e7cad86d
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> drm/nouveau: Fix NULL pointer dereferences in GETPARAM ioctl
>
> This patch adds safety checks for the graphics engine and device function=
s
> in the GETPARAM ioctl handler. It returns -ENODEV to signal missing
> hardware state to userspace, preventing a kernel NULL pointer dereference
> when initialization fails.
>
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/=
nouveau/nouveau_abi16.c
> > index 291203121f0c2..c9270c5b0fac8 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > @@ -306,7 +306,12 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> >               getparam->value =3D 1;
> >               break;
> >       case NOUVEAU_GETPARAM_GRAPH_UNITS:
> > -             getparam->value =3D nvkm_gr_units(gr);
> > +             if (gr && gr->func) {
> > +                     getparam->value =3D nvkm_gr_units(gr);
> > +             } else {
> > +                     NV_ERROR_ONCE(drm, "GETPARAM_GRAPH_UNITS: no gr e=
ngine or func\n");
> > +                     return -ENODEV;
> > +             }
> >               break;
>
> [Severity: Critical]
> This is a pre-existing issue, but while you are fixing the NULL pointer
> dereference of the gr pointer here, is there a similar vulnerability
> in the adjacent nouveau_abi16_ioctl_get_zcull_info() function?
>
> If the graphics engine fails to initialize and gr is NULL, as addressed b=
y
> this patch, it looks like an unprivileged userspace process could still
> trigger an Oops by calling the DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO ioctl,
> which only requires DRM_RENDER_ALLOW.
>
> Looking at the nouveau_abi16_ioctl_get_zcull_info() function in
> drivers/gpu/drm/nouveau/nouveau_abi16.c, the gr pointer is unconditionall=
y
> dereferenced:
>
> int
> nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
> {
>         struct nouveau_drm *drm =3D nouveau_drm(dev);
>         struct nvkm_gr *gr =3D nvxx_gr(drm);
>         struct drm_nouveau_get_zcull_info *out =3D data;
>
>         if (gr->has_zcull_info) {
>                 const struct nvkm_gr_zcull_info *i =3D &gr->zcull_info;
>                 ...
>
> Would it make sense to add a similar check for gr being NULL before
> dereferencing gr->has_zcull_info?

yes indeed, the next patch does so.
I hit them both, separately, but theyre mergable if you like.


>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815-null-fix=
es-v1-0-0df9dda951fb@gmail.com?part=3D1
