Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4304F2D97B9
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 01:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785117280; cv=none; b=Ze1ReJBu2JAwayOKkhdoEVqWnoAc7CV2TeZyw1ystypKJEhehcuENZ19uCTK5J7U2neaUBl84Lkg6CY/Xp7G8G5CFVhDaMJyjmVQErYFmvwFBEIhPgGDHnJ2Lym56fNJfnvfF56Dvjs/pUR4eYcwpjZr7Ebk9ERmielsd38yCp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785117280; c=relaxed/simple;
	bh=1ffPUiYpIPDDgQJs0WpGdBTtfIrrCstVSHGNad8eaxs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=coGAjyT4Cfm7YECEpxCTnMp/M3M6R6h9nUSHh0i9H+EbMTEaIEG9kD985yiYT0o4u6b7ekcebUO0AYP1GSSivw1GIio6ySOKEzm87itl4gZCV8H3RPHD1ixg5QeRAVqbLqWTRqqp82KtbGKUom/n6Q8t42L9Fj1kEuI7ArmY31k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 09:53:59 +0800
Message-Id: <DK8Z8YNNRDM9.14DU5Q5M0J0CL@oss.qualcomm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
Cc: <Frank.Li@kernel.org>, <imx@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com> <20260726195505.7A7B21F000E9@smtp.kernel.org>
In-Reply-To: <20260726195505.7A7B21F000E9@smtp.kernel.org>
X-Migadu-Flow: FLOW_OUT

On Mon Jul 27, 2026 at 3:55 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Critical] NULL pointer dereference in `imx_lcdc_crtc_helper_atomic_ena=
ble` and `imx_lcdc_update_hw_registers` when the primary plane has no frame=
buffer.
>
> Pre-existing issues:
> - [High] Sleeping in atomic context by calling clock manipulation functio=
ns from the plane `atomic_update` callback.
> --
>
> --- Patch [2]: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_=
pipe with regular atomic helpers ---
> commit e5bb94188c05e612166e809c2f562025fecbb70c
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/imx: replace struct drm_simple_display_pipe with regular atomic helpe=
rs
>
> Convert i.MX LCDC to explicit primary plane, CRTC and encoder objects. Ke=
ep
> no-scaling plane check and GEM framebuffer prepare callback from simple-K=
MS
> path.
>
>> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/l=
cdc/imx-lcdc.c
>> index e00e52c1c46ec..e0784ce0125b7 100644
>> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
>> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> [ ... ]
>> @@ -206,7 +211,7 @@ static void imx_lcdc_pipe_enable(struct drm_simple_d=
isplay_pipe *pipe,
>> =20
>>  	clk_div =3D DIV_ROUND_CLOSEST_ULL(clk_get_rate(lcdc->clk_per),
>>  					mode->clock * 1000);
>> -	bpp =3D imx_lcdc_get_format(plane_state->fb->format->format);
>> +	bpp =3D imx_lcdc_get_format(pstate->fb->format->format);
>
> [Severity: Critical]
> Can this dereference a NULL pointer if the primary plane has no framebuff=
er?

It could not be possible.

If the plane was attached to crtc, the fb would be checked [1] in the
atomic check phase (before crtc atomic enable):

    /* either *both* CRTC and FB must be set, or neither */
    if (crtc && !fb) {
        drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
                       plane->base.id, plane->name);
        return -EINVAL;

[1] https://elixir.bootlin.com/linux/v7.1.3/source/drivers/gpu/drm/drm_atom=
ic.c#L715

>
> If a userspace process issues an atomic modeset commit that enables the C=
RTC
> but leaves the primary plane with no framebuffer, pstate->fb would be NUL=
L.
> The drm_atomic_helper_check_crtc_primary_plane() helper checks if the
> primary plane is attached, but doesn't guarantee a visible framebuffer.
>
> Could this lead to a crash when querying the format here, or when passing
> the fb to drm_fb_dma_get_gem_addr() inside imx_lcdc_update_hw_registers()
> just below?
>
> [ ... ]
>> @@ -272,66 +283,151 @@ static void imx_lcdc_pipe_disable(struct drm_simp=
le_display_pipe *pipe)
> [ ... ]
>> +	if (old_fb && old_fb->format !=3D fb->format)
>> +		mode_changed =3D true;
>> +	else if (old_crtc !=3D crtc)
>> +		mode_changed =3D true;
>> +
>> -	if (!drm_atomic_crtc_needs_modeset(crtc->state))
>> -		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
>> +	if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
>> +		imx_lcdc_update_hw_registers(crtc, old_crtc_state, new_crtc_state,
>> +					     new_state, mode_changed);
>
> [Severity: High]
> This is a pre-existing issue, but does this sleep in an atomic context?
>
> When userspace requests a plane update that changes the pixel format but
> does not alter the display resolution, drm_atomic_crtc_needs_modeset()
> evaluates to false, but mode_changed is set to true.=20
>
> This causes imx_lcdc_update_hw_registers() to be called with mode_set=3Dt=
rue:
>
> imx_lcdc_plane_helper_atomic_update()
>   imx_lcdc_update_hw_registers(..., mode_changed);
>     clk_disable_unprepare(lcdc->clk_per);
>
> Since clk_disable_unprepare() acquires a mutex and sleeps, is it safe to
> call this from the plane's atomic_update callback, which executes in
> atomic context where sleeping is forbidden?

False positive
