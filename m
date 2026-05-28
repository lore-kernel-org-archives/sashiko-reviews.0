Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EB33655DA
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005475; cv=pass; b=UUVbPutMNZOc5/b0ustcEJF22KjrC0djih2Kw2LSFXAu7hjHFf48AmPzwKYBQnBkfCtSelJJsh+SqBPeICnEIqI/H8X/xo4dB6nKcMdyYVI+DfD1Rg9Azt5/1QKPd6mddC1a8Ojwdza667UPWo7cDtoyoVBHgRa0arUs2PboEgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005475; c=relaxed/simple;
	bh=55izBCS0ULu5X7EDhIAAQYMQNf5DpBvMNi50t2ZxSPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=odBGvT4l+n2oByDXUFxecBLeKeGEndzAQjYyNDXGhkwPPtc2Z01SaX4RjYRjqnurhbahlbK3JF1DRJaw9Ht2nTqhCyjLDiR0dXmLOb9xHrUUs0X8uGaAQxSwrSJ+3qRXZfOB2Kg+o8tu0+/Nc9tjBoaz8JsrqaCBQ2OSkAWCt2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ag8WrVTX; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ag8WrVTX"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c80203b9d7bso5415903a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 14:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780005473; cv=none;
        d=google.com; s=arc-20240605;
        b=DDfREuUjWmuX9Uw8tNq6iu8M2ObyXLuF5Be1gO0cUlNE3LCmt+uT3n9uA4bujKo1FF
         HXkP6L8POLJDNLkfan9zNUsn0Fo8HQ+6JZ9TAnGPebr35ZbckhMdhHdyJQxUPH/rPyP0
         QKBU5YwZroHzDrneuhsznym3I4LefPKojN0yh9eMLQchI1wb59AUJMjcgthPTtVRBpS3
         qa0rF1e0OIUTFSmrBMiHgae8s3mIUUOq8ahCkN2k3Nz34M3sd9LjKdrylNQuDl/mA7Ba
         ebAC+Mk/SY6nI/encgp8/gPPhtpeap36TNUW7dMUKxW3HSTG/j18bmKgai6NXnr+ynZH
         IAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uzFqyxh3L/iAvyLZ4yJ/GetZ86UQ07RZVWV8gwIxKf4=;
        fh=bqcWahV2VSUKOcsEUxnahuxzeI0I0s3v1r7h1ytOl68=;
        b=J7XGUIO2xavG5Asn//uRzC5rI7s5Irzv+4wqilrtrr6bkyk3jbPTYrbLx5dmfh693e
         uSlzx7dOUgt/FLGIv61bR6+nM+Pa7nPe+REioA/zpcB+iArx3o3dtJHTr4awvlqfyq6f
         CxUjRVjccX+++tLfgjAxxUxyYIvebazCITr9DvaKHGMBSCq2N/pJfcO78iPKKy7R6oaP
         KJBRf7yjLJj3TEepFNq1rGgyJfWthxRKSG14YXc7hTIIGVYBCsFhdE2fSReE0ozYT6Vz
         7HEJkyk4jBtS/IYqa8DC6UDNOPinch14U5uTud2DOQgyDqMScAeErZ8wYHLyrZjilfv+
         HTFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005473; x=1780610273; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzFqyxh3L/iAvyLZ4yJ/GetZ86UQ07RZVWV8gwIxKf4=;
        b=Ag8WrVTXM+f1LH/vHSHMlT0NeSx/u1aIc89UGrr8x5xYYKIyemN5sCsowSkVxBkpKk
         70mUp60ZmJkV4VCbDGDjCYEVvgNgqmCNedsyZcjA6pAe7vgDTDwCVlxgC+XvwSCihQeU
         fr1Kxp0Y6WMtO6EHlUthmQWJeNV//cynD1GtxWFv43Hv6HOrBTIWVE3tGz4jShF2AwIY
         2nS+OSYKUEqPIuBrHFJrjBhTZovCW09VunKKeD1EVdp6nd/STpdxwZchsTiPaLwE1Vyv
         dY4G5y6XuDT5AvbWAlzMgF83hIsAdoUpVN1D0QxGBzJHG3VVwX16ffuJme7uIDu7x3Ct
         oX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005473; x=1780610273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uzFqyxh3L/iAvyLZ4yJ/GetZ86UQ07RZVWV8gwIxKf4=;
        b=DzrC9+oX5pyeuPHU2lVOREvrmZ+nBXjwHCRUxoxvXNFC4UbejfgT6b+a4T5RovznZe
         7+u4qDjPNsRgo1MpAAy8mBA7o2PHW2Jv9RRHKYxEKIIG+6JvUmUbl35+3EhyzL7qiluz
         97T2IiOcNWocHaPnL5V+q1pvwYr56yl3FmqGoVvpvs5wFVkGV4AFnwywUmKZKCI99+nS
         Wnvb6DflaG+5I8O27shawVEAInNv1GKVnvGyEvTYk1TjwO+lLeMlC5vCi9ntPpSTWxpB
         0rdDF4tM28aaC3ulZTcLcIQJSksJPtSnjHAnI3btaXR9QehrmKQDW0hjdSNma9lwH7WZ
         8CpQ==
X-Gm-Message-State: AOJu0YxarVgGGr5AZCsxrF1u4PxSzRusOjO3D+EUWWwNMS0c6Oy74ato
	Xen1TD6eOzWVVeC9Vm2gV/SG4zMo3IMu51/nNGrljZIDSfFDfT5vtaB71arJc97NcGqAZoiNhbI
	n653o49EDkay6icTaBHixjLdXxO+9Of7SGA==
X-Gm-Gg: Acq92OHnrBShv76ri866QEvkgbzTvPvl5YP5voAVSiZb6azMZ2xcp7tcBFX7McpK0X+
	MHuqJHn8Ya7V5IsH2KRwOYfeJihwGJXy+Q+mRAboJQLLUe+32JrWJRv+7EM/ixie870JPmYs1pW
	XwFftnZeu9nPg2d0TL31WKGnTZeh20BJF0xtLR+ZzvKiv0rHhtv/hfPqJEeYaRhsrcONimHL+0y
	1duss5hXxAcwNTKWLgNcD309tAfszCBbg6OwQbXQK/A9XonJyVU0Pruxusyre0a+4+/j9al6dUR
	CE47HWxOAmgYQ3+KQM1sUuYOY/yx8VqZaQ==
X-Received: by 2002:a05:6a20:3d1f:b0:398:6ea8:21f7 with SMTP id
 adf61e73a8af0-3b40e2ba0d6mr598348637.15.1780005473443; Thu, 28 May 2026
 14:57:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525223948.1920986-2-ihor.solodrai@linux.dev> <20260525231131.895201F000E9@smtp.kernel.org>
In-Reply-To: <20260525231131.895201F000E9@smtp.kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 28 May 2026 14:57:37 -0700
X-Gm-Features: AVHnY4K_aSygySixQkU72_cESDqzjmlN--ZwQHl-ns6g3Krx5XdVGyj4R5PUexE
Message-ID: <CAEf4Bza2fRDGhLQoPE-EzM7F34xaEJfi5Exmxb-iWVUN3F06=g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 1/3] bpf: Factor out stack_map build ID helpers
To: sashiko-reviews@lists.linux.dev
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 4:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The refactored VMA caching logic bypasses the cache for fallba=
ck cases and evicts valid VMAs, directly contradicting the patch's stated g=
oal.
> --
>
> commit e38559ed451d61a994765f3bfb260cc14edd3569
> Author: Ihor Solodrai <ihor.solodrai@linux.dev>
>
> bpf: Factor out stack_map build ID helpers
>
> This patch refactors stack_map_get_build_id_offset() to use helpers and
> continue-driven control flow. It also attempts to optimize VMA caching
> by updating the cached VMA on the fallback-to-IP branch to prevent
> redundant parsing attempts for anonymous or failing VMAs.
>
> Link: https://lore.kernel.org/bpf/CAEf4Bzac9uWWqBvzH0iFzKvJcq3vxscZ3pKm0s=
UHmN-F-z9wVQ@mail.gmail.com/
> Link: https://lore.kernel.org/bpf/226398c1ff3f2b686c0aeb010408d85fb15df13=
f9ff60a045bee31e79b9e41e9@mail.kernel.org/
>
> > diff --git a/kernel/bpf/stackmap.c b/kernel/bpf/stackmap.c
> > index da3d328f5c15a..e23be7d445038 100644
> > --- a/kernel/bpf/stackmap.c
> > +++ b/kernel/bpf/stackmap.c
>
> [ ... ]
>
> > @@ -165,44 +187,45 @@ static int fetch_build_id(struct vm_area_struct *=
vma, unsigned char *build_id, b
> >  static void stack_map_get_build_id_offset(struct bpf_stack_build_id *i=
d_offs,
> >                                         u32 trace_nr, bool user, bool m=
ay_fault)
> >  {
>
> [ ... ]
>
> >       for (i =3D 0; i < trace_nr; i++) {
> >               u64 ip =3D READ_ONCE(id_offs[i].ip);
> > +             u64 offset;
> >
> > -             if (range_in_vma(prev_vma, ip, ip)) {
> > +             if (prev_build_id && range_in_vma(prev_vma, ip, ip)) {
> >                       vma =3D prev_vma;
> > -                     memcpy(id_offs[i].build_id, prev_build_id, BUILD_=
ID_SIZE_MAX);
> > -                     goto build_id_valid;
> > +                     offset =3D stack_map_build_id_offset(vma->vm_pgof=
f, vma->vm_start, ip);
> > +                     stack_map_build_id_set_valid(&id_offs[i], offset,=
 prev_build_id);
> > +                     continue;
> >               }
> >               vma =3D find_vma(current->mm, ip);
> > -             if (!vma || fetch_build_id(vma, id_offs[i].build_id, may_=
fault)) {
> > +             if (!vma || vma_is_anonymous(vma) ||
> > +                 fetch_build_id(vma, id_offs[i].build_id, may_fault)) =
{
> >                       /* per entry fall back to ips */
> > -                     id_offs[i].status =3D BPF_STACK_BUILD_ID_IP;
> > -                     memset(id_offs[i].build_id, 0, BUILD_ID_SIZE_MAX)=
;
> > +                     stack_map_build_id_set_ip(&id_offs[i]);
> > +                     prev_vma =3D vma;
> > +                     prev_build_id =3D NULL;
>
> [Severity: Medium]
> Does setting prev_build_id to NULL here inadvertently defeat the VMA cach=
ing
> optimization mentioned in the commit message?
>
> The commit message states the intent is to update prev_vma and prev_build=
_id
> on this fallback branch so the cache reflects the actual VMA seen. Howeve=
r,
> the cache check at the top of the loop now requires prev_build_id to be
> non-NULL:
>
>     if (prev_build_id && range_in_vma(prev_vma, ip, ip)) {
>
> Since prev_build_id is set to NULL on failure, won't consecutive IPs fall=
ing
> into the same anonymous or failing VMA bypass the cache completely and tr=
igger
> redundant find_vma() lookups?

yeah, it seems so to me... we have prev_build_id and prev_vma, we
should set prev_build_id to NULL if build ID fetching failed, but we
should preserve prev_vma always to avoid unnecessary find_vma() calls.
And if it so happens that we have matching prev_vma, then depending of
prev_build_id being NULL or not we either set absolute ip or
build_id+offset, respectively

Let's do a follow up to improve this, nothing is really broken, I
think, so applying.


>
> Also, does overwriting prev_vma with the failing VMA while disabling the
> cache hit (via NULL prev_build_id) evict the last successful VMA from the
> cache, potentially degrading performance if stack frames interleave?
>
> > +                     continue;
> >               }
> > -build_id_valid:
> > -             id_offs[i].offset =3D (vma->vm_pgoff << PAGE_SHIFT) + ip =
- vma->vm_start;
> > -             id_offs[i].status =3D BPF_STACK_BUILD_ID_VALID;
> > +             offset =3D stack_map_build_id_offset(vma->vm_pgoff, vma->=
vm_start, ip);
> > +             stack_map_build_id_set_valid(&id_offs[i], offset, id_offs=
[i].build_id);
> >               prev_vma =3D vma;
> >               prev_build_id =3D id_offs[i].build_id;
> >       }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525223948.19=
20986-1-ihor.solodrai@linux.dev?part=3D1
>
