Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAA3378814
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 16:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785168294; cv=pass; b=Qv5L0GmSNq8IOfnjxvjRMhi52SZyd08PlekIenpNYabbSfpX//PrOmyHYi3b7FsJ9KHT5mjrqQtZvqa4ACZvlYJb77wjHvsqJBjZQ4iyJR4exThEqsNTT97SGMckilE6GGmwG0DjkBmd/StCnJYBNh9tmqjTv+x6kSpsHwxfBjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785168294; c=relaxed/simple;
	bh=K9z2bQhTAKXmL7LbS6RYjhwUKaYWqEkt5Msu4huz47k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJlbZ79HgfWwlOLED1Dzn+ko8doB3lk4gM0brDNvz3P7Bj1xgSVoD5UxcYSoAIFoyb80Qia6hnG7GSuwtF1/n++C5SOQsOD3ZQbxZ6NGltVZJRvSOht+/XlQEJan35suJpmjsmFnmtfqnYTy6wzPM4lmMItzV/yRbcBPhDuabOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqSBkaDC; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqSBkaDC"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-384422b05b5so367915a91.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 09:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785168293; cv=none;
        d=google.com; s=arc-20260327;
        b=YYnHLPW0heGOKRVz2K4zA9s8kxJ4s/CF4WTmxthtGs4JONnyOsnf4q6g5W5LTP5A8H
         YaJgWQoPAu6//nt0re5kuJg58LTdN7goSGjquzOATi2TAQp8OOTeUoUycdcrNYZEqKF3
         GQ1lNIASsSFAH7Fo8+cuY0fV0azDSmeUchnZHlr8Z0sW/h2fZuwAvB3T+oCQtISoqSqw
         ORG5ZNTh+5bZeS1XedhcTIkNNWtewH2IrW/hczKKEB7n2239XHImqgGzdG8sImgE095q
         Li3aKs4wNtCn+ex57PrTyu3TYsvmY+3mHVkTvXQwR1QMWicN33JFS2FGLpFVAajMhK0Z
         TLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mV132EboBiIC6aD49jRxyvOFo9SoecgWipLHtdHMdLE=;
        fh=irEWhEPPaZyI575EDSCa4gndl/VptkBVpjYpQNw9a34=;
        b=rAXFm65va4Xw231fYfevNXVl4JN7V6xbHv1dhxHOFE3T4ossMvMrwv6qvB7s6AJYmd
         4Rrmd7FJ15k3pbS0HkKGVtd2w15iCsMeZCbTy8f5gekUHsck9OsL12tSpdddlsT/SgoI
         U/y48K0CJDTPy4v4Bdl+8b6StBsfbBYXZZSeOOKnvYY2UJXWThbSgrl53RgqJ3tJjK1t
         7Hg0fQbGGGVz/3qSExnLPV/QK7u3Y1T0RG3DqHbyay8gYPGxyLdbIpAOgLvI2C3p/P37
         AvQzpvqHhnnuhF5KPnRArGr/B71bpWStp8Odua8MDCZIFJHMbZcqg/EN/as08eU3fmI4
         zstA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785168293; x=1785773093; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mV132EboBiIC6aD49jRxyvOFo9SoecgWipLHtdHMdLE=;
        b=UqSBkaDCaiX8prS+gaIAouPU4RXkwUAbnGKYjnhOZ1x8I7uAkYqACAo8WD8hR/SMcm
         mNwjy8u33a8OD4n6BPHNsND5LwuzRIopXI/Z3i4TgEiDKcISdzzBhN8azJTHbC1j3R0R
         wF64iuRmRjVOy2qbw2DvVA3Z8roFgK0oSo+Kr1rAqILi8ev+cSXyMNnn6h+1V8/F7PRP
         30EfJh2KbZ4bjGZpgX2pQ+S/x2v/3cYYqMtujhnU5x6N0jHgjRuyiVW9qq9S00X4KkuU
         aBopZcpajiAB1EpeQ784mXZEHRA4HUN6F9jKUiImFA8yVewKzWEQfDwFjZMV0/HCMJ8G
         fAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785168293; x=1785773093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mV132EboBiIC6aD49jRxyvOFo9SoecgWipLHtdHMdLE=;
        b=TmPBeRUYReRRTcsNbTBh0oLNzBEXQJjlaI5OKtCAIGelqARINyWw8CkPz4eJpyhqCA
         Bj7z6ee8rHEkiJ9uB9Wlbn0YvrSCejO1izZX1orcWQUJ+maGq9HTl5K4E+Nlg3UHDFOd
         ECPOFUG2kvIA0069Nso+GEnuD0ucHAd/VCU/RLnYuCP2Dp+uG54Fhdp+kbd1lRnMb/Q7
         SlJCHuTZ0OiE40ns1LVI5rdYi+OJUhpUEdJkqZOIWax0q/RujqzVgDl/FailTIJus3rs
         7eZD1Z41AF9bvwB6VuU8IcH6PQBie/HDhEnkW6nHzN2dFxnVkTDXjB/LqvS1O+f+lPWT
         YjHA==
X-Gm-Message-State: AOJu0YxFII8qRBO7tuJDlo2XVAxHHXMoA02Q9tojuglHxCSq0h1J0kA+
	JxrGgIzVOT93WIUaBzfCfDwbf3RIJJKNc+HElmH2JxF03+j6GTN6QT4m3/XwH+ZjTX7NZ1/S6dn
	T0fJNpwu871YWmPqTY39Efw8j2U5AerxCFQ==
X-Gm-Gg: AR+sD11dPdlW1d5t4r8d1hiN4WLh0kji7gvIqusJXNF7plORV5MsxHJAAqamVDvmZmv
	tbE8QrbKULNvZ6CZltwKus5z9v9bgNuGqUT3j8O5G5WGFzgjfnxYKlcFWchkV/zV5eYhLmXWDO9
	Wee+Ile85vr8C142zaz49UR3iaNWpAlU2ZJhNKlTNOQ750JZbvn8uCfuN55BszgkU1rvVPkSkBX
	uwchad9ThRnLrIdRkv6w9fivz3bp/4D727oRK6+rGSs9S4s8OHiyKey4EmYYLoxqALCogPllk2i
	4sRhQyGMN58O5ngY09yiR8yeXa3Oy0TwVcrGwatFDn//Z9yW
X-Received: by 2002:a17:90a:c796:b0:38f:57f0:1f51 with SMTP id
 98e67ed59e1d1-38f57f023e2mr2502724a91.0.1785168292617; Mon, 27 Jul 2026
 09:04:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722165925.15805-1-timur.kristof@gmail.com>
 <20260722165925.15805-5-timur.kristof@gmail.com> <20260722173453.CF3FA1F000E9@smtp.kernel.org>
 <CADnq5_P7-_RfV=MbbNw8w8CVEmE12t8ZgVSa5Pbz+ujjkB7Xcw@mail.gmail.com>
In-Reply-To: <CADnq5_P7-_RfV=MbbNw8w8CVEmE12t8ZgVSa5Pbz+ujjkB7Xcw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jul 2026 12:04:40 -0400
X-Gm-Features: AUfX_mwpq0JK-tagzmnnC3l8RlwAoLulYEgYgRhrWefqgs1LtECeYxmJjsirTog
Message-ID: <CADnq5_Og8M+0Xn3U1+SY48PEstC13RgxqoKsoixco6bJw8h2Bg@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/amd/display: Don't use tiling flags anymore
To: sashiko-reviews@lists.linux.dev
Cc: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied the series.  Thanks!

Alex

On Mon, Jul 27, 2026 at 11:44=E2=80=AFAM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> On Wed, Jul 22, 2026 at 2:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] Missing 2D tiling format modifier for 8 bpp formats on GFX6-8 =
breaks NV12/NV21 video playback.
> > --
> >
> > --- Patch [4]: [PATCH 4/4] drm/amd/display: Don't use tiling flags anym=
ore ---
> > commit 9ecc330329837cba2c5f2f431e911a3b7ec6c4df
> > Author: Timur Krist=C3=B3f <timur.kristof@gmail.com>
> > Subject: drm/amd/display: Don't use tiling flags anymore
> >
> > The commit removes the usage of legacy tiling flags from the amdgpu_dm
> > display code, transitioning all supported GPU generations to rely
> > completely on DRM format modifiers. It updates plane attribute filling,
> > surface updates, and cursor checks to reflect this change.
> >
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > > index a593a44ef97bc..87187c965d55c 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > [ ... ]
> > > @@ -1235,8 +1201,6 @@ int amdgpu_dm_plane_fill_plane_buffer_attribute=
s(struct amdgpu_device *adev,
> > >                                                                      =
         address);
> > >               if (ret)
> > >                       return ret;
> > > -     } else if (afb->base.modifier =3D=3D DRM_FORMAT_MOD_INVALID) {
> > > -             amdgpu_dm_plane_fill_gfx8_tiling_info_from_flags(tiling=
_info, tiling_flags);
> > >       } else {
> > >               ret =3D amdgpu_dm_plane_fill_gfx6_tiling_info_from_modi=
fier(tiling_info,
> > >                                                                      =
   afb->base.modifier);
> >
> > [Severity: High]
> > By removing the legacy tiling flags fallback here, does this break NV12=
/NV21
> > video playback on GFX6-8?
> >
> > Looking at amdgpu_dm_plane_add_gfx6_modifiers(), it appears to add 2D t=
iled
> > modifiers only for 16, 32, and 64 bpp:
> >
> >         amdgpu_dm_plane_add_modifier(mods, size, capacity,
> >                 amdgpu_dm_plane_calc_gfx6_mod(adev, 16, DC_ARRAY_2D_TIL=
ED_THIN1));
> >         amdgpu_dm_plane_add_modifier_dedup(mods, size, capacity,
> >                 amdgpu_dm_plane_calc_gfx6_mod(adev, 32, DC_ARRAY_2D_TIL=
ED_THIN1));
> >         amdgpu_dm_plane_add_modifier_dedup(mods, size, capacity,
> >                 amdgpu_dm_plane_calc_gfx6_mod(adev, 64, DC_ARRAY_2D_TIL=
ED_THIN1));
> >
> > Since the modifier calculation for 8 bpp (which is required for NV12/NV=
21
> > formats) is missing, when userspace allocates a 2D-tiled NV12 framebuff=
er,
> > won't drm_plane_check_pixel_format() reject the atomic commit since it
> > cannot find the 8bpp modifier in the plane's advertised list?
>
> Shouldn't be an issue as we don't expose any YUV planes on DCE hardware.
>
> Alex
>
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722165925.=
15805-1-timur.kristof@gmail.com?part=3D4
