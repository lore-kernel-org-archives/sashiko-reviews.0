Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC6A470448
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 13:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332741; cv=pass; b=BYNodnn0/8bRJG7XQg5ey6QTT8ck6GDtIe9GdukNV3xsKzijlKmTfJ9tT8o/hHeiGpkDbtCaD+mZSgbs5UVyCPwrnh1+uAZw9EOhx24BQqn3SxFwWfiHMyGs9XUjW8s2FWo5eeHRMpeick+ZNX2ZuqmBvpC7WFYwS+9cjxo0cOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332741; c=relaxed/simple;
	bh=UZAhy5157NkSAMSWJcdNZefOEQdqg3ZnXPVybrWCqrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aj0gOsgUUeuOC6K8FEpwrzbFqssBN4vs1KMhe/H4g+iN9Q1FVuhXWSoMATh8Cm7cjUx4U8GW7IsHm6KylihVnLOMdrEv9/5X+yBotLfX+r32qav6Anr9wg0P3JP9oHwmr4f0kSagt+XipLj7QeZ4sY32ad8Jgu1urLIRRD3Pekg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+Dp3koE; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+Dp3koE"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81ed000b507so10449317b3.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 06:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785332739; cv=none;
        d=google.com; s=arc-20260327;
        b=RUglJi2pjUL5D2N1K2v/1yrfmAyjGdJjYyxRNNVE5OMGeQ7cVOiTF9ZHbnNejyHVEu
         aVBpCZp1+FS81Ox1rCs6vZxS9MpvNbAhlArcC2WRp+qIFH6KQCoWJg7FyvK5ySJ+ahIN
         FSrzKqslUpYTvNv+dbQScvoYVnOWK/gX8bs5o3H5nsjgfwvIPGRlODqobL0Ot98OHBJo
         kdQNx9/VOW2vwju5rPwqYaYQmZzwq0MezVaQwhYFvdFZEtdhIRgKHIq/ilNdOq1EA6F7
         NvNFagEmORO27rYtcY5heik3cUPZQPxF7WLWt/CcjjEJxUvdFtOkD4zDib8SOYoi2sOL
         q+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SHtZAPYn3Wc91D71uLVL563MpKOhtIJrqDFEQxe1/jE=;
        fh=l7ViLnppvkkSQ+LRUx3Qov8iJmCPcv0PVZg4trlzbMc=;
        b=k4ssJthbC0dkWikjMOHnhRzbJDlE/shomAT/u4TK9cdiWJ/Ym6eCYd/XpM2Ops/fqM
         X/rr+7t5M5enOeyBdv4GzlYZrElkISRTuLK27Ym0UvjrWdad3GTe5biR/kf3N3GTaKDW
         5DWEv6t9c1Mq2N6cCR03ZL3UrT4BStna1ECQnkRvAIYExlqK7334cgXxi+VdAFmTujek
         im7UNkjAzvZzfoJRmg4JyYlh3rg0ACXDFWsA7tHcxJDF3MxRCQ3EQqS+S7D25QBQ5ZRN
         B5PeVchH53LNxO5vYMd3/tArOVPnI47nMFfMm/wX5ScR/QxETvtWBu7CSRGsQFruiybm
         BSCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785332739; x=1785937539; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SHtZAPYn3Wc91D71uLVL563MpKOhtIJrqDFEQxe1/jE=;
        b=o+Dp3koEx+L6Hbg0cOEOAi9mGNTyBMN3kegb+bXtAlaE7MfczWm+x5c7mxkIJgT/3t
         swwuIvNx9zD0QNSue0vg/DzHXGoBng9WP40X06j/EiFWuqyyg3zBFvpZlOuAxwJZvEys
         sK4Yuor50qGl9dOYfx298VcWdhB7svGGu+9lGM5URr57tKX9WZxPQ2TTq4a96Igrnc93
         /Oq4zj0dD3ND/xE29iKGepbW0jySUJGpV4BdFSOVg1+Q1wh2vUxpO2PswEbSk0/PAvNS
         65SKN3iaRYbsR0zcAkocso6Hc/DRIh17Gen/qt+Sj4BlqlAhWtlTvd9tD/Nh2iw/tIWO
         AOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332739; x=1785937539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHtZAPYn3Wc91D71uLVL563MpKOhtIJrqDFEQxe1/jE=;
        b=k3SSjze71o1MJQxtFp0VDZTuLJHQQLTS9OR5hy08uMCHuveDB54iTAZVa/cckX6jJg
         qX7+sozhtvKC25GcXLCfF+LJMYjuiJrrgOAkOdobT+XpcuMtfjMryP9Bp/6r5K5QMnTO
         QFBQuuCEJ6nig6wgh3XNDU6o2SwRdM54FXp23TniXHwGnq562GPToFouqy87RrBiQI3K
         SSpCqqy1pM8jDvR/pmfgGpPpTPggvf0j8hsmqzC4E+SzXrJ/VJ2l/BvUCf2U8WixM/pj
         LCYoamhZOLgVkL6J5qDEDgH7a1RvX3Ur+yaiIVePkgLMu17TWZif0/8n8raPA0WVfyPq
         4/kQ==
X-Gm-Message-State: AOJu0YxW9XAolq2PQ3Uura8pYvPOTGE42+uf3xUi13CNLFmwSEgGM0vR
	jI+TUlOTgzZdre+XraE7lBUZ0DFotSGZWpEL4dHjzxAaRxu8cfxOeGame4A5+py1pBJZmiVwXKD
	caUlDKr6T5g7eCxMYSuXYQOXwh1KBLrTs9w==
X-Gm-Gg: AR+sD1303Nx2325hozm1VSB0+WXlGW+FWGdi/CYnsfsxhwAkQEyWfdAFnxFbDyG+aXm
	hDZhb0KtMkGxsQkroMgbZAP4rcw0ix2Z8morwiiwIKKLCnNWeN3bZ0QxQ25G/om94cGaKBesAep
	nBaGs+hMcpmqFg6eCvGaQ8f/baI0dg5hCY8fl0+5z5sWLl8n/qzvY6AbmgvDsEPAxdfKUqH/W0r
	r6Gw4dCiCi0cQeDthV+WaJ+shGZtQ4jpXEw1EjzNWN7ZRRX5z8PwByuf2dBEb07xYtKoekxsMY5
	I3z83yhfjk8QfKG3t5w3YrqDCRz/s3luzs8vpKUe2l8=
X-Received: by 2002:a05:690c:6c01:b0:81e:1437:5763 with SMTP id
 00721157ae682-81f99247c84mr32859177b3.62.1785332739192; Wed, 29 Jul 2026
 06:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716230411.2767394-1-tarunsahu@google.com>
 <20260716230411.2767394-4-tarunsahu@google.com> <20260717024938.128D91F000E9@smtp.kernel.org>
In-Reply-To: <20260717024938.128D91F000E9@smtp.kernel.org>
From: David Jeffery <dhjeffery@gmail.com>
Date: Wed, 29 Jul 2026 09:45:27 -0400
X-Gm-Features: AUfX_myRPaVDt58yJr6A2eZEJEygxGVewYG3ucJaoFeFR_lLDJKTrjk92Ni0vOU
Message-ID: <CANghDUVJNULztJ+-8G=PD9eXjdBF=QuHyXhYszzZO5rtzyj5ag@mail.gmail.com>
Subject: Re: [PATCH v19 3/7] driver core: separate function to shutdown one device
To: sashiko-reviews@lists.linux.dev
Cc: Tarun Sahu <tarunsahu@google.com>, linux-pci@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 10:50=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The refactored `device_shutdown` discards the parent device poin=
ter returned by `get_device(dev->parent)` and re-reads `dev->parent` inside=
 `shutdown_one_device()`, creating a TOCTOU race condition that can lead to=
 reference leaks and use-after-free.

This gets cleaned up in the next patch, but I'll rework it so that
this patch has no functional code changes and is only a code move into
a separate function.

> --
>
> --- Patch [3]: [PATCH v19 3/7] driver core: separate function to shutdown=
 one device ---
> commit c3cdb15ac9b6efba6077cade25c652c124eaa9c7
> Author: David Jeffery <djeffery@redhat.com>
>
> driver core: separate function to shutdown one device
>
> This commit refactors device_shutdown() by extracting the shutdown logic =
for a
> single device into a new separate function, shutdown_one_device(). This c=
hange
> is intended as a preparatory step for supporting asynchronous device shut=
down.
>
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 78b90326addb6..82a7af1f3ba2e 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -4898,12 +4898,48 @@ int device_change_owner(struct device *dev, kui=
d_t kuid, kgid_t kgid)
> >       return error;
> >  }
> >
> > +static void shutdown_one_device(struct device *dev)
> > +{
> > +     struct device *parent =3D dev->parent;
>
> [Severity: High]
> Does this lockless read of dev->parent introduce a race condition?
>
> In the old code, the parent device pointer was captured and pinned in
> device_shutdown() using parent =3D get_device(dev->parent).
>
> With this refactoring, dev->parent is re-read here. If the parent changes
> concurrently (for example, via device_move()), could we end up operating =
on a
> parent device that we do not hold a reference to?
>
> > +
> > +     /* hold lock to avoid race with probe/release */
> > +     if (parent)
> > +             device_lock(parent);
>
> [ ... ]
>
> > @@ -4925,7 +4961,7 @@ void device_shutdown(void)
> >                * prevent it from being freed because parent's
> >                * lock is to be held
> >                */
> > -             parent =3D get_device(dev->parent);
> > +             get_device(dev->parent);
>
> [Severity: High]
> Is there a reference leak here since the return value of get_device() is =
now
> discarded?
>
> If dev->parent changes right after this call, the original parent's refer=
ence
> will be leaked. Later, shutdown_one_device() will lock and drop a referen=
ce
> to the new parent instead, potentially leading to unbalanced reference co=
unts
> and use-after-free.
>
> Should we pass the pinned parent device pointer into shutdown_one_device(=
)
> as an argument to ensure we lock and release the exact same device we too=
k a
> reference to?
>
> >               get_device(dev);
> >               /*
> >                * Make sure the device is off the kset list, in the
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716230411.27=
67394-1-tarunsahu@google.com?part=3D3
>
