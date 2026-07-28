Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CA73546D6
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 06:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785220653; cv=pass; b=bXXLBnrXoF+LuBxE+4iPyz+qho0vIwSkqlmpYed68Q/9YusmtC+w0wcTGiGwMq5XPPrsleXQd7gkSXnL0a18Z9QkpI8yPURmOqw0Ki2XoA9hjjAVu9SNWW1HFKFsabZcGmsTPUfE9c67aVQL126yOtFAqj2Au624UsjP771d608=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785220653; c=relaxed/simple;
	bh=lCKDh8AP5fu9kSsr57zVH9DxBDmciOXIS6XuXzdyeoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oh9AAJxoM7QARxLIm3dOG1h7UDw3wluweLdIA/mh3ekTppBt0kodVILwN5xVtuvAqZMEqrIwfbcU2MxPIJ7fpFOcAoBY1oQ3+XLfrq7KhnYBf+BmKcVOVtqgSCxv6TqwT9BRvvyFDCOs8rQzv+QJWD41FTmp17hdD4deKIlKspA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aRfQPrGE; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aRfQPrGE"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6611669cd16so4593057d50.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 23:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785220650; cv=none;
        d=google.com; s=arc-20260327;
        b=Z43LXXInSMQlq8VSIm4grnpXGhRFOlfjpv55yXMxvSFGccJDVkT1ULR0/JxJJP+q1E
         WKiuc3hj8PZ3e47OYH9qrC7aNt+IxulMQnMzSVpyNeUBqYrF4kY9k/zdwLZ+5CQWPwwA
         xOehf/8p2tU7F8fIBRPYmehafvoTb1qsGzMLiFztiu5rh5yHlc1usRGr4goaXG5XPWQm
         3iQekIZQlw19ovuew0OucZNfLzidn72MlpMLsfiZ3tiXDue4vlj4yLKL7PLArXQWnqMX
         KWit70crBd+zqurFQn7DC9lwyjLiw6hlBIpumMYuhTtRsR4TgICKgkRt9rYO6ScSdkB0
         nxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mk5KhGYTlO9SDZQRF1URMyQmuKRxWDOHbudIP8iEbWc=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=ZjQfrSZ5xDV3xRZw4uJS7QhOuyxU/slygd44H0MiXEwqjVn9aINYs9WJ4Kq7UywhoK
         WI+6VhZHcitdzxczmlHpjjNL/TN1bAHYNQvusMI0S1lIHRyEW/yUD1TYm6bsAHoCo5i0
         WcAh9m927EyXLehw5dgVnDV43ELy0D9XJnnM0QYtvKaUEvAtXV2nJ9R4pt1/2E79qFIu
         14OnucbZ09Zd9Q/0u1Eve78JXsNNIZBSB6GTDUI58uudUenu9Cjof3nfLcZciZaaxMVw
         dsODUVqKVhNLL/b6vu9wX2wvuKr6Wbpd1cUZ9/sEqk+xPjnDR1DaIwhBWmz133vX2bDI
         gHWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785220650; x=1785825450; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mk5KhGYTlO9SDZQRF1URMyQmuKRxWDOHbudIP8iEbWc=;
        b=aRfQPrGEkhHyMXNVsBxNev/rfUBWe6r86tkXXUcEbcmoetn6GVCqis/D7ASRufDUhB
         bvEYn3mP17uNtE9oSf/HbPvI/vuckW0Imy56rh9k1nz3jXV0/F/zKiQ3veYROGiq3VNm
         2bCMQADW4JM4+EK+gJuOmyiy+ZiKHb+L8VydKrWTRIot7YVMjeBoqKtXnSvEpokBLqkP
         MltEiX3fRrJeBXGvot30EAEWWhWmzSJaUwdhziKel5bqDmy/83MjRepuO6kPXFHV1gqT
         8RZo3/cAeUe10zb/LyLTdo34zBklKPfWbWHsie38+SLqNJcfEGwV6ryePj0mE9X+Ym5x
         pYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785220650; x=1785825450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mk5KhGYTlO9SDZQRF1URMyQmuKRxWDOHbudIP8iEbWc=;
        b=s/8imiU+wa5r2+pKM4GMlk2St0FwxOMF6WrWmfQT2cXUil24/45BLaEC23taybsqwb
         +peYfNG6MvPICH9jV//8OgcNT/B/esnRjlzKl3DK+nakkMZi+WZVUwHq3HUhMkvoPN9E
         VJAaxMYhiGKrwuVgtVKHH4kzIUIf6vyyiuj/IWVQQgE9/EVtIZa4WPUlEjy1mIMHzmVK
         1d5mh2FrCgli2qu3JqxOs0XdBiPSNBMaFlDBlBDOTv8iPle2hG0lfE5xY3BPl8RIkLaM
         bJVbigst5IAA9/NSvFXLKa2jWRe6XV1pk9wYQkJzpBwiaH3kyMh//SchfH/c7GtG5AY6
         NcOw==
X-Gm-Message-State: AOJu0YyDosSBEpaZes3Sz25VoZf6ukJsC8XazAbpOnaVVe4dje5xzeiW
	bw9f7FHT2UQhBQ9lUgeIvzZLwjXDBRXvXHFfUCt0l/mCpQiOnZcH7UBZsakJmlVEQgDvK3rEO2H
	ljD7QGm58LTooycQSJbENEWox6mwHr8K9HpOu0GgCXpgl478JeSiIbcFOeJ0L
X-Gm-Gg: AR+sD13yRyCuQ5w7lh7rT+s/Rp1aYNJnJjl9mTH8WtKdJwHBTJtTZ6NpqOaHVg0CUYf
	4wDGOTP6yXHK7buG7odV4CkMCtbyoRqypEeYelKVBlHXtbS6CGQAXoPha4EKnVi96cDwUlBRNME
	JHvYb/p+nuAHhwI+TE19mOaC35qkOYrXFZAi/gXX4UlRPXPq2E6GSjw39h+qko1IxL9L4MVmk0Z
	KgP2o1xjfQB1Pjy1mhyWbGGyVQqXtLGWQtKA1ldUC1kLfmq4e+On2EsxFVECDsbtzON9jpoaBWf
	boAz6/Dmgfh5ZjyMG9W76HqKE4U5HPlOqlFWnsTOwE6vgaNcdqSj9EOw0w==
X-Received: by 2002:a05:690e:4399:b0:667:bc49:373d with SMTP id
 956f58d0204a3-669056d0cf1mr334752d50.33.1785220650016; Mon, 27 Jul 2026
 23:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727-msm-next-quad-pipe-split-v21-1-965dfa5b669e@linaro.org> <20260727095508.AFE0B1F00A3A@smtp.kernel.org>
In-Reply-To: <20260727095508.AFE0B1F00A3A@smtp.kernel.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 28 Jul 2026 14:37:18 +0800
X-Gm-Features: AUfX_mxx-inJEI6IbUDD3Rqk6HOiXBBAdRSlUJRhQEKqDucg-a4vSYyIbI9dTFw
Message-ID: <CABymUCPWn8qz7pg8VOtA+N15yHG8id7L87fpkMMsTV=2SovM1g@mail.gmail.com>
Subject: Re: [PATCH v21] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B47=E6=9C=8827=E6=97=A5=E5=91=
=A8=E4=B8=80 17:55=E5=86=99=E9=81=93=EF=BC=9A

>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Unused pipe configurations are not cleared when transitioning fr=
om quad-pipe to fewer pipes, leading to underflows, stale pointer dereferen=
ces, and hardware corruption.
> - [High] Missing VSYNC source configuration for the second physical encod=
er in quad-pipe configurations.
>
> Pre-existing issues:
> - [High] `dpu_crtc_get_lm_crc` and `dpu_crtc_get_encoder_crc` leak uninit=
ialized kernel stack memory to userspace.
> --
>
> --- Patch [1]: [PATCH v21] drm/msm/dpu: Enable quad-pipe for DSC and dual=
-DSI case ---
> commit f34d7a5a3191bc6943da26710d69eaffa718ab5d
> Author: Jun Nie <jun.nie@linaro.org>
> Subject: drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
>
> This commit expands the pipe array size to 4 to support quad-pipe topolog=
ies.
> It requests 4 mixers and 4 DSCs for high-resolution scenarios where dual
> interfaces are enabled for virtual planes. Additional pipes enable parall=
el
> data processing to stay within width constraints and MDP clock rates.
>
> Link: https://lore.kernel.org/r/20250918-v6-16-rc2-quad-pipe-upstream-4-v=
16-10-ff6232e3472f@linaro.org
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 42d0a529b4d51..1c6d65ca561fd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crt=
c,
> >               struct dpu_crtc_state *crtc_state)
> >  {
> >       struct dpu_crtc_mixer *m;
> > -     u32 crcs[CRTC_DUAL_MIXERS];
> > +     u32 crcs[CRTC_QUAD_MIXERS];
>
> [Severity: High]
> This is a pre-existing issue, but does expanding this array to 4 increase=
 the
> amount of uninitialized kernel stack memory leaked to userspace?
>
> When populating the array in dpu_crtc_get_lm_crc(), if a layer mixer is
> unassigned or lacks the collect_misr operation, the loop skips initializa=
tion
> for that element. Also, if num_mixers dynamically decreases after CRC
> generation is enabled, drm_crtc_add_crc_entry() still copies values_cnt
> elements, which can read past the initialized elements.
>
> Can this same uninitialized stack memory leak occur in
> dpu_crtc_get_encoder_crc() with crcs[INTF_MAX]?

Increasing the array size here does not mean leaking stack to user space. T=
he
crc data is copied to user space with necessary length that's from the
calculation
of  dpu_encoder_get_crc_values_cnt().
>
> [ ... ]
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 778e231d49677..90d44c4777fd0 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -55,7 +55,7 @@
> >  #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
> >       (MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
> >
> > -#define MAX_CHANNELS_PER_ENC 2
> > +#define MAX_CHANNELS_PER_ENC 4
>
> [Severity: High]
> Does this quad-pipe configuration leave the second interface without a va=
lid
> VSYNC source?
>
> In a quad-pipe dual-interface configuration, the mapping between physical
> encoders and pingpong blocks uses a stride of 2 (the first uses hw_pp[0] =
and
> the second uses hw_pp[2]).
>
> However, _dpu_encoder_update_vsync_source() appears to assign VSYNC sourc=
es
> using sequential indices:
>
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:_dpu_encoder_update_vsync_sou=
rce() {
>     ...
>     for (i =3D 0; i < dpu_enc->num_phys_encs; i++)
>         vsync_cfg.ppnumber[i] =3D dpu_enc->hw_pp[i]->idx;
>     ...
> }
>
> Will this configure hw_pp[0] and hw_pp[1] instead of the intended hw_pp[0=
]
> and hw_pp[2], potentially causing TE timeouts and visual tearing?

_dpu_encoder_update_vsync_source is used only for cmd mode DSI panel. While=
 only
video mode panel is supported for dual panel currently. And the VSYNC
source should
be aligned in timing, due to the 2 panel are modeled as single logic
panel in CRTC level.
So there is only 1 VSYNC source in high level DRM framework.
>
> [ ... ]
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_mdss.h
> > index 0e65bf5ddc4a6..fd1f3e7982062 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > @@ -34,7 +34,7 @@
> >  #define DPU_MAX_PLANES                       4
> >  #endif
> >
> > -#define STAGES_PER_PLANE             1
> > +#define STAGES_PER_PLANE             2
>
> [Severity: High]
> Can increasing STAGES_PER_PLANE to 2 lead to a stale pointer dereference =
or
> hardware corruption when transitioning to fewer pipes?
>
> When transitioning from a quad-pipe topology (4 mixers, 2 stages) to a si=
ngle
> or dual-pipe topology (1 stage), the duplicated pipe_cfg array retains st=
ale
> rectangle configurations because dpu_plane_split() only clears up to the =
new
> num_stages:
>
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:dpu_plane_split() {
>     ...
>     for (stage_id =3D 0; stage_id < num_stages; stage_id++) {
>     ...
> }
>
> Later, dpu_plane_virtual_assign_resources() iterates up to STAGES_PER_PLA=
NE
> and allocates an SSPP for the stale configuration.
>
> During the atomic commit, if cstate->num_mixers shrinks to 1, the calcula=
tion
> in _dpu_crtc_blend_setup_mixer() underflows:
>
> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:_dpu_crtc_blend_setup_mixer() {
>     ...
>     lms_in_pair =3D min(cstate->num_mixers - (stage * PIPES_PER_STAGE),
>                       PIPES_PER_STAGE);
>     ...
> }
>
> This causes min(4294967295U, 2U) to evaluate to 2.
>
> Will _dpu_crtc_blend_setup_pipe() then attempt to program lms_in_pair =3D=
 2
> mixers using a pointer starting at mixer[2]? Since num_mixers =3D=3D 1, c=
ould
> accessing mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(...) cause =
a
> NULL pointer dereference?

No. It will not happen, because pipe and pipe_cfg is allocated and zeroed f=
or
every plane preparation in dpu_crtc_assign_planes. If num_mixers is reset, =
the
pipe_cfg is reconfigured, sspp will not be allocated for unused pipe_cfg. T=
hus
below check in _dpu_crtc_blend_setup_mixer() will avoid accessing to unused
 mixer[lm_idx]

if (!pstate->pipe[pipe_idx].sspp)
   continue;

+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -883,6 +883,8 @@ static int dpu_plane_split(struct drm_plane *plane,
        u32 num_lm;
        int stage_id, num_stages;

+       memset(&pstate->pipe[0], PIPES_PER_PLANE * sizeof(struct dpu_sw_pip=
e));
+       memset(&pstate->pipe_cfg[0], PIPES_PER_PLANE * sizeof(struct
dpu_sw_pipe_cfg));
        max_linewidth =3D pdpu->catalog->caps->max_linewidth;

        /* In non-virtual plane case, one mixer pair is always needed. */
@@ -936,11 +938,8 @@ static int dpu_plane_split(struct drm_plane *plane,
                 */
                if (!drm_rect_clip_scaled(&pipe_cfg->src_rect,
                                          &pipe_cfg->dst_rect,
-                                         &mixer_rect)) {
-                       memset(pipe_cfg, 0, 2 * sizeof(struct dpu_sw_pipe_c=
fg));
-
+                                         &mixer_rect))
                        continue;
-               }

                pipe_cfg->dst_rect.x1 -=3D mixer_rect.x1;
                pipe_cfg->dst_rect.x2 -=3D mixer_rect.x1;
@@ -967,8 +966,6 @@ static int dpu_plane_split(struct drm_plane *plane,
                                        DRM_RECT_FMT " and " DRM_RECT_FMT "=
\n",
                                        DRM_RECT_ARG(&pipe_cfg->src_rect),
                                        DRM_RECT_ARG(&r_pipe_cfg->src_rect)=
);
-               } else {
-                       memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_cfg=
));
                }


>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-msm-next=
-quad-pipe-split-v21-1-965dfa5b669e@linaro.org?part=3D1
