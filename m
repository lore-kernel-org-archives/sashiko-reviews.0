Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0DA3B52F8
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167101; cv=pass; b=H1q5KH4MaMHC56bYoUjQrGzKdX9vlJkhS2iUHiOFAGGSYemOBjSaNC72JoR1ghEcz4jV+0JPn9Hn6n7pSbqygr4CVkY1BxIsFRu1r5AMMt2HkwP2nJB6riT/y53p+VyYu491K+2gnZFUXLxqYwMjHZY6Bn1uWnZy585U2jPe5O4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167101; c=relaxed/simple;
	bh=XwGKCkMGfv7aa1CEVWBr/2KfRR/iKHUhI4gP0MiejQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6SHVjCPxnFHtzCAXidrrjaWiktVTAydqOJ7ej5V6Q+q92D4KYWU+E+hrBVYPO1MjLF5sIHl53lbuPcvW6DIQf4IXeSKdpSKoFcJKvAFanmmFMkTgNy6PMd85+uAo3k2/zScZ1/2w3GS0+Z+fMz1W+kdzQTYY4gVgsR2VB1gJRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqdiSVJr; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqdiSVJr"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38ecc48b3deso201203a91.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 08:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785167099; cv=none;
        d=google.com; s=arc-20260327;
        b=E7cI62zWk+GkpnyNuwvyfomo6TM+WNtBm3hBGaI9ZJ8Om+t7YiuLyzWnTZaYMoi8gA
         Wk+ewufsFNn2QhwUQ4Tn253ztWxZPLDYJwtHGoE30wmSUySn5oMh2a2fDaAsn3KBzYIb
         kTnmSH9L07mx4JpJKbfGjz+tmiL1RFjBL+tYIy+j0eP0TSHBynHAnWQ8rh7DGLslY8km
         7Mb6NpF2IU93FPOKhEd6ao0s5YcEz9BB6TcHN9O00XRSZoldb463p9cS8kbGjRD3p/1h
         X3cJ5Cju8Lkou0KZIpM93YCoYGEBicy+eTidDHPTNC4kLg6jSnGDLpeI8XFvDp5I5snv
         WY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2E2+wNwOz3ocOPNdYPXNkPVFbk7ggoeG58MpWzTPseA=;
        fh=irEWhEPPaZyI575EDSCa4gndl/VptkBVpjYpQNw9a34=;
        b=c3KQGOQ6+yagC39l5pLKRvR7ndb2l81Xlamv7McA7aisHffwJb/Byzj2s2AmzMtzId
         rE2OdrOXC9bCzQI+ZsuUvkxete70xmyYMq8VuqJyxuBvq9fMC72OtEPxgum+S3MQ8Q2m
         XUm8Eo6GR1U5wtH0duwUgT+0YuM+ZjPXIZBaFU+STcWWboEKSz6rH49G4HWugE+a4D1o
         sPDlUqCADQiR0YzEzeWmJF9jPnpJbFBjxZUy0wJ7s+XU0Hz6X/BdAjFo+QN45EFBntCl
         TwQrurr2S8SVymYT7V79YEAqd8MXW++0p3SMoGBiDvfXiUE813uvhmCv9qYx3bD4/1EL
         Tf9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785167099; x=1785771899; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2E2+wNwOz3ocOPNdYPXNkPVFbk7ggoeG58MpWzTPseA=;
        b=dqdiSVJrIQeor0C0sp7f9Ivn4pCcY/40E8f7ubtA7nYa+h2fJo25He52g90K8J9xUp
         RU6lYSsp8JEaQW+bltVsoTpit7FCHcer0wzGXkqJI8fUqCEO5E0zehN6OXmSIKqurEcr
         G9moX9kp9Hp7l9wKt0Y3HophaKUCcNeamHI6pRpamwqjeuCGCElqD7JznuJLfuooSp/d
         9wGix51bfDT3Tdtn8gjb2ftuajO89nG+5IpQQksEz3CZY/GikBzBn4o+P+BKnWlY8HzM
         BFPt0OmabnH2MwoNFRMi1c2q9FLtIy3VSzh+e5ZALOxuEUWxCUEAiV3qAkYbQHwxmC5Q
         oN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167099; x=1785771899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2E2+wNwOz3ocOPNdYPXNkPVFbk7ggoeG58MpWzTPseA=;
        b=mdIti/0QIdYeRgGrtDkaD7FWaegKw86L5mGFFBoxFcTe9/qEn6UGJv8RSfNQOo6Lzg
         gN5uGZhDddsgbaFh/fHAf1Cm+5IAdK3D2iq2TyPtX15/f7RgP54Inkm4S5APL+UL8xje
         RoblnBpiTRdXRh6J5q5/31IVR+PD5/ldwQU9YWRWs00KklhCi/McmNsOJXtAQZTYPxvd
         akIFjJksYFCpenzXKyxoQdootX5ykmO3kPxpi5V3srex4Y2OG1LCMnQcs9Lga0Y/5EPr
         c895rlQFP9cA34oF1QET1l5OdzTaCgjVUxNTAjoJLjUf96uX5bmYhJYvynN127MErGOq
         1d9w==
X-Gm-Message-State: AOJu0Yz83lS4bz9MUhnLjexB5De0YBIfwFeZwswhqsIgICyYe1hj+0VH
	wDtpVDXkBw5k3Yurnwq/mRFDBkA/DS6qSWWRjb0gANvcYolvmJ2IHUnfsSiBKcwgGZrkmtPNk3c
	IOEo1YeDTr4mdgSgm7sIuPqVMVSOXBRSXPA==
X-Gm-Gg: AR+sD13VAXzqm3oTee+vnqpamTW9NuI7E2qAow/9WdLCKbceI7uIf7wo8aDtDQKGfYb
	6olS8ZNLP8XLAutKsSqAVFzfzzRfT/VgLrHatJk3qOJzk62NWQlqLPVRVZAY3H/Mm23zF6nj4E3
	Db2g65NnGudGpndYvIkR29NhPBdl3zG2T51WI3jMemamxwG16mBt1U/cSyb64YasMd1T3ycw/7+
	jak748fumQP3Dc2yHUEgFSuyIvBPOOs7pmX33ivS/bnxQhbvu8hLjGdaCLIWcsbu83QND5F0Rl4
	Kcel5HeW74awoWiRx+UUjVjmAWAq+YjF0cZ6uWTEUciG1uAT
X-Received: by 2002:a17:90b:5410:b0:381:2788:a437 with SMTP id
 98e67ed59e1d1-38f624d077emr524367a91.1.1785167099129; Mon, 27 Jul 2026
 08:44:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722165925.15805-1-timur.kristof@gmail.com>
 <20260722165925.15805-5-timur.kristof@gmail.com> <20260722173453.CF3FA1F000E9@smtp.kernel.org>
In-Reply-To: <20260722173453.CF3FA1F000E9@smtp.kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jul 2026 11:44:46 -0400
X-Gm-Features: AUfX_mwETSo9kiss-1GnIwKajUUdXFUtUnyAL3OvYEYQzv50TeWz9ODlfFe6OLc
Message-ID: <CADnq5_P7-_RfV=MbbNw8w8CVEmE12t8ZgVSa5Pbz+ujjkB7Xcw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/amd/display: Don't use tiling flags anymore
To: sashiko-reviews@lists.linux.dev
Cc: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 2:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Missing 2D tiling format modifier for 8 bpp formats on GFX6-8 br=
eaks NV12/NV21 video playback.
> --
>
> --- Patch [4]: [PATCH 4/4] drm/amd/display: Don't use tiling flags anymor=
e ---
> commit 9ecc330329837cba2c5f2f431e911a3b7ec6c4df
> Author: Timur Krist=C3=B3f <timur.kristof@gmail.com>
> Subject: drm/amd/display: Don't use tiling flags anymore
>
> The commit removes the usage of legacy tiling flags from the amdgpu_dm
> display code, transitioning all supported GPU generations to rely
> completely on DRM format modifiers. It updates plane attribute filling,
> surface updates, and cursor checks to reflect this change.
>
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > index a593a44ef97bc..87187c965d55c 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> [ ... ]
> > @@ -1235,8 +1201,6 @@ int amdgpu_dm_plane_fill_plane_buffer_attributes(=
struct amdgpu_device *adev,
> >                                                                        =
       address);
> >               if (ret)
> >                       return ret;
> > -     } else if (afb->base.modifier =3D=3D DRM_FORMAT_MOD_INVALID) {
> > -             amdgpu_dm_plane_fill_gfx8_tiling_info_from_flags(tiling_i=
nfo, tiling_flags);
> >       } else {
> >               ret =3D amdgpu_dm_plane_fill_gfx6_tiling_info_from_modifi=
er(tiling_info,
> >                                                                        =
 afb->base.modifier);
>
> [Severity: High]
> By removing the legacy tiling flags fallback here, does this break NV12/N=
V21
> video playback on GFX6-8?
>
> Looking at amdgpu_dm_plane_add_gfx6_modifiers(), it appears to add 2D til=
ed
> modifiers only for 16, 32, and 64 bpp:
>
>         amdgpu_dm_plane_add_modifier(mods, size, capacity,
>                 amdgpu_dm_plane_calc_gfx6_mod(adev, 16, DC_ARRAY_2D_TILED=
_THIN1));
>         amdgpu_dm_plane_add_modifier_dedup(mods, size, capacity,
>                 amdgpu_dm_plane_calc_gfx6_mod(adev, 32, DC_ARRAY_2D_TILED=
_THIN1));
>         amdgpu_dm_plane_add_modifier_dedup(mods, size, capacity,
>                 amdgpu_dm_plane_calc_gfx6_mod(adev, 64, DC_ARRAY_2D_TILED=
_THIN1));
>
> Since the modifier calculation for 8 bpp (which is required for NV12/NV21
> formats) is missing, when userspace allocates a 2D-tiled NV12 framebuffer=
,
> won't drm_plane_check_pixel_format() reject the atomic commit since it
> cannot find the 8bpp modifier in the plane's advertised list?

Shouldn't be an issue as we don't expose any YUV planes on DCE hardware.

Alex

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722165925.15=
805-1-timur.kristof@gmail.com?part=3D4
