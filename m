Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E7123BD02
	for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 05:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791696678; cv=pass; b=GEHwL4DCsYOG8nq3/1DobG15GDtxNdTyj1eP0y0HwrHqAvEyKBWY8jf6kgtMY8K+nTT3sHv/YBLr/UvxWmeBwD3u1niYKhzVPt9X76iXG/S+/o4VVgvo/q+3Uo/rArVaOEXfwE9t8glVTIlLXu+mhq3g7AJNuTwm8k8GcxeKqVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791696678; c=relaxed/simple;
	bh=BEkpy1I+Uu4YM+juOQWtWPJO2I3YUQaiwXu5Mr6K9os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHLsh5ONc0tWsyzPX0pNB+a/a6LRsCtMgzEdf4taG22MjADVEejbPyNQ9gGh13+U+3L998r0XRN6Mr/15POxOvisTEHZueRno989Ffm9j/J89Xw2mO9G8SCFIMvEz/g5xlg7P/e7IrCiG1NaowbOp4Pw7KnJp9083yH+Bn8dMdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxV0Mjga; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxV0Mjga"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6768a9fc0e8so730356d50.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 22:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791696676; cv=none;
        d=google.com; s=arc-20260327;
        b=OZe8QTslsYpZWd+7lUFChG8FyUyi0/ZZUcD88CsalCkKqkU7cZ8BsYFYyEqcqy1bzP
         tFScetalmslcraUTscyC8HhKo+9vK621u6RCSZWF8B75otOPQo3SOSGSSx8ilwCL3llR
         j855T0Oe/RVszNIbSlQKa4L02HgcwcKCKmINDiAwYfnl2mocJVPSzZR6L1O5jMRQowMZ
         DJoX9c73o7QfiYKARgh2Io7qQomM68dIDEFLScSd1oNe+duFtupAE7pgdfKJzIhPLPdb
         xpN0+8c5oGpeyI5QfiiXPZN89pd/rv/kpgAvLTw2JEIsSG6ua7pI+0Lv2ZgxpPC5tFKx
         7J2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d64AKkfex8ucpkLV8OFICHb4YHT2ZbkVzlb3XcqNv34=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=NrYKeUzS/RympundsEKb/uzuQN93VSPCSdEzXNTMhaelNCCdAK22nR3aE1m1K2/GIq
         5I33R6yv0zMAL9CYOO0bg3gfIrA5NBTexmOrELaH6Y7x1qfggoPEmj1ajSf/00fZ3dNx
         e6QSN9j51OANnWHqMle9mdLi/UnH+wAR3/FPYCiInrJKwpamOxCy2TjgHvgtIFM/6Fh2
         Gsc6gG8XikldHQ30Y0q2TmNt2odhsMG/4vRMJDKxVDKzGHX+DNcUFOGs1tv6L9JwhRPX
         7MG10OLEWAMkiH/yQnqw/MJRj9CwlG9XxrC38WCKkUmMoYhMoWYIYCDBxSvfB6FW+6ci
         6X0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791696676; x=1792301476; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d64AKkfex8ucpkLV8OFICHb4YHT2ZbkVzlb3XcqNv34=;
        b=OxV0MjgadCCT3fHl5Km0IaTb9g6FN405P4xGxF85APzOGz4p/FadQyV/s+PcKfC2aV
         d5AIpa+UjhazMXoPuJgC1x4Meu8JP6SncBc2ciifGwwFaT6ImaL9LuPjZsyxiu87P0UB
         a4uTSH5NuukGGzOMa4omo0wi5Ro+P3Obk8aHU3L3b+3XfCLunGXdKLLCnscvfxxHct/o
         nq2R+Mz6fkT0w370gy9rHq6E8a03mXQTV/wINhsR85KM6eRtT1uJX+j/5orXlTYf8u0y
         Nu/DvXj5rL3rTOxfFKcyxiSaLWYARs4dNG+ll8DYkSf8wn7EiL7CvLymyPRScoUyrUh8
         Addg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791696676; x=1792301476;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d64AKkfex8ucpkLV8OFICHb4YHT2ZbkVzlb3XcqNv34=;
        b=cyYUnPRnrSwaNToKUwBgojJx378o+duNTZM/+POOJlvQv9+LPf8D4oBmiTFkQngnUn
         MP8DzpAPDnBVtjdO/rBr+/FZenkIMjWDD6TmMSu8O4WXTwP0DtyevmnRsg8aHPokluLu
         uEhUPe1GQvyktbIQ4GsJrZezH1gweJQDnhnjgBJ2aPBPzC/fJdqK2llpyOmgLo0OqB+D
         /wRVIPEQl7tiWE6txhqr4SIIK8o2SBRBuL6BadEjAo/APcJhtYIIMzy6nwFBPp4QYip6
         dF9hT6P15yN1bRGnIkI70vfLhnvr8QViOUKqLj2eM2LjdwcGNi13dolyD+9V6e68CTVy
         FxfQ==
X-Gm-Message-State: AFq9FYLfpyoT+duvak7Y6SGj8bLlcclSWX021RJ7Mjj4n8ddaird0lOZ
	oNc7PbyTTHjuSWpg48LfiZkoP8FHOsrKqnQ/ibMXivOhAbJdfHLMBREixa2MqLwgT5/KgLtMHl2
	5aQbQUvsGv72PYhLASAeg2ARYmiVS0vmfo+5S
X-Gm-Gg: AYBFou2oMKLX6PsuFJPznGlNQLRNjefaGm3rsWjWkaSEqT/+ivIHiRGbgTyGT3YnApl
	0JEoOSSiS9EpkFnwED9d09aVFpPmfGPpOxw/g9VLqVrM7NQp7rfncjBiUfzKqmuao1UUYQxcl6r
	pLXqHpuomCEQcjbWyXqmOtnQfrW7g49QDX4zr4ElV1ifdcP32QH14Zhb+iDC27T20ePLQv6kMzf
	ZHhWNQxEoO2mT2H5cBKjpNzt8HmFaW/4fblkCu6lzC4a/pWAP14PB+2s5bDxTFPdd3MrqAOYl07
	y/N5a2LHDcwJJv2PKTV4ihB0PykHMc6Nrelxxu/U3bU/0UDaluABuah8Ig==
X-Received: by 2002:a05:690e:43cf:b0:671:631:785c with SMTP id
 956f58d0204a3-679360662eamr1175525d50.57.1791696671153; Sat, 10 Oct 2026
 22:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011-pvr-gpuvm-immediate-v1-0-5b298dfce4f8@gmail.com>
 <20261011-pvr-gpuvm-immediate-v1-1-5b298dfce4f8@gmail.com> <sashiko-outbox-166779@kernel.org>
In-Reply-To: <sashiko-outbox-166779@kernel.org>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 11 Oct 2026 14:31:00 +0900
X-Gm-Features: AclHuK9QQ8KesEV6lMvt0nL062BjAb2OUVABa0bqENkID0SS_98dJe0_iHpjEpY
Message-ID: <CAKbEznt5oahmTAuY4XOuRYOb3GWxe8iPd+jRcQL0gNZ3rT8R2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/imagination: Switch the GPUVM to immediate mode
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not an issue with the switch itself: map_init()'s error path misses
draining the deferred vm_bo. Will fix in v2.

On Sun, Oct 11, 2026 at 2:36=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] drm/imagination: memory leak of gpuvm_bo on pvr_vm_map error pat=
h
> --
>
> commit 191fc7b0dba1141708c7edc0b3aeac368ef8588f
> Author: Gyeyoung Baek <gye976@gmail.com>
>
> drm/imagination: Switch the GPUVM to immediate mode
>
> This commit switches the GPUVM to immediate mode so that each GEM's GPUVA=
 list
> is protected by its gpuva.lock. It introduces deferred operations such as
> drm_gpuvm_bo_put_deferred() and cleanup via drm_gpuvm_bo_deferred_cleanup=
().
>
> > diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/ima=
gination/pvr_vm.c
> > --- a/drivers/gpu/drm/imagination/pvr_vm.c
> > +++ b/drivers/gpu/drm/imagination/pvr_vm.c
> [ ... ]
> > @@ -214,7 +214,7 @@ static int pvr_vm_bind_op_exec(struct pvr_vm_bind_o=
p *bind_op)
> >
> >  static void pvr_vm_bind_op_fini(struct pvr_vm_bind_op *bind_op)
> >  {
> > -     drm_gpuvm_bo_put(bind_op->gpuvm_bo);
> > +     drm_gpuvm_bo_put_deferred(bind_op->gpuvm_bo);
> >
> >       kfree(bind_op->new_va);
> >       kfree(bind_op->prev_va);
> [ ... ]
> > @@ -758,7 +769,9 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pv=
r_gem_object *pvr_obj,
> >
> >  err_cleanup:
> >       mutex_unlock(&vm_ctx->lock);
> > +
> >       pvr_vm_bind_op_fini(&bind_op);
> > +     drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
> >
> >       return err;
> >  }
>
> [Severity: High]
> Does this code leak the gpuvm_bo and the referenced drm_gem_object on the
> early error path of pvr_vm_map()?
>
> If pvr_vm_bind_op_map_init() fails internally (for example, if memory is
> exhausted when calling pvr_gem_object_get_pages_sgt()), it takes its own
> error path:
>
> pvr_vm_bind_op_map_init() {
>         ...
> err_bind_op_fini:
>         pvr_vm_bind_op_fini(bind_op);
>
>         return err;
> }
>
> This calls the newly modified pvr_vm_bind_op_fini(), which places the BO =
onto
> the gpuvm_mgr bo_defer list via drm_gpuvm_bo_put_deferred().
>
> However, back in pvr_vm_map(), the early return bypasses the newly added
> cleanup call:
>
> pvr_vm_map() {
>         ...
>         int err =3D pvr_vm_bind_op_map_init(&bind_op, vm_ctx, pvr_obj,
>                                           pvr_obj_offset, device_addr,
>                                           size);
>
>         if (err)
>                 return err;
>         ...
> }
>
> Because drm_gpuvm_bo_deferred_cleanup() is bypassed here, would this caus=
e an
> unbounded accumulation of leaked BOs on the bo_defer list? Can this be fi=
xed
> by ensuring the cleanup function is also called on this early return path=
?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-pvr-gpuv=
m-immediate-v1-0-5b298dfce4f8@gmail.com?part=3D1



--=20
Thanks,
Gyeyoung
