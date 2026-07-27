Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EE8368D73
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 02:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785119774; cv=none; b=aSYxoNA1uz3bKaFJ1qncTOOC64YOyQIF1RQjXqaG93g46NsTZLnZKo6+eBnIHYp3TauSLtIKRGM6/MdtJ0TdqG5rgNOy77+jug/rcrUtB0qbNmGMfadb2fCftM7+rp/yr5rNZ9piYWMtrsDDqJBr0uehf167hMAUNYKhDecblEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785119774; c=relaxed/simple;
	bh=KeCK/GUvRH5kpKATe1OIWmAZvaKW3eXUBG+QARAx3b8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=k48Dxjm316iw5mGgkQ+snkEbrdwy+Txt+Wyfckxks5mhrgq4YAgBLGMLxnRlRviQNqR5ownBgEpW/h5KwvQHP3Eqn8d9pUwvk6XbbJRxH4Z6NmHtvGC6enrsIBBqNGkYhU3Y6muRe1YFXFFv9sW9uIQq4A0J7zW0XiGHBAhsLIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.174
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
Date: Mon, 27 Jul 2026 10:35:59 +0800
Message-Id: <DK9054GRYJFX.3CK3WS6BAB1M0@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <Frank.Li@kernel.org>,
 <imx@lists.linux.dev>
Subject: Re: [PATCH v3 6/8] drm/repaper: replace struct
 drm_simple_display_pipe with regular atomic helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-6-cd5dc89858c6@oss.qualcomm.com> <20260726200448.9C2FF1F000E9@smtp.kernel.org>
In-Reply-To: <20260726200448.9C2FF1F000E9@smtp.kernel.org>
X-Migadu-Flow: FLOW_OUT

On Mon Jul 27, 2026 at 4:04 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Sleeping functions and blocking memory allocations are called fr=
om within CRTC and plane atomic callbacks, violating atomic context constra=
ints.
> --
>
> --- Patch [6]: [PATCH v3 6/8] drm/repaper: replace struct drm_simple_disp=
lay_pipe with regular atomic helpers ---
> commit c95d4b930f0cb70a4eb89a2c19785d09216e66c1
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/repaper: replace struct drm_simple_display_pipe with regular atomic h=
elpers
>
> This commit converts the repaper driver to use explicit primary plane, CR=
TC,
> and encoder objects instead of the simple display pipe helpers. It retain=
s
> the shadow-plane helpers, framebuffer access handling, and no-scaling
> plane-state validation from the simple-KMS path.
>
>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repap=
er.c
>> index c8270591afc7f..f225e38fd4045 100644
>> --- a/drivers/gpu/drm/tiny/repaper.c
>> +++ b/drivers/gpu/drm/tiny/repaper.c
>
> [ ... ]
>
>> -static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
>> -				struct drm_crtc_state *crtc_state,
>> -				struct drm_plane_state *plane_state)
>> +static void repaper_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					      struct drm_atomic_commit *commit)
>>  {
>> -	struct repaper_epd *epd =3D drm_to_epd(pipe->crtc.dev);
>> +	struct repaper_epd *epd =3D drm_to_epd(crtc->dev);
>>  	struct spi_device *spi =3D epd->spi;
>>  	struct device *dev =3D &spi->dev;
>>  	bool dc_ok =3D false;
>>  	int i, ret, idx;
>> =20
>> -	if (!drm_dev_enter(pipe->crtc.dev, &idx))
>> +	if (!drm_dev_enter(crtc->dev, &idx))
>>  		return;
>
> [Severity: High]
> This is a pre-existing issue, but does this function sleep in atomic cont=
ext?
>
> CRTC atomic enable callbacks execute in atomic context where sleeping is
> forbidden. However, looking at the code, this function makes direct calls=
 to
> sleeping functions:
>
>     gpiod_set_value_cansleep(epd->reset, 0);
>     ...
>     usleep_range(5000, 10000);
>
> Could this cause system instability or kernel panics during display state
> updates?

False positive

>
> [ ... ]
>
>> -static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
>> +static void repaper_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +					       struct drm_atomic_commit *commit)
>>  {
>> -	struct repaper_epd *epd =3D drm_to_epd(pipe->crtc.dev);
>> +	struct repaper_epd *epd =3D drm_to_epd(crtc->dev);
>>  	struct spi_device *spi =3D epd->spi;
>>  	unsigned int line;
>
> [Severity: High]
> This is a pre-existing issue, but similar to the enable callback, is it s=
afe
> for this atomic disable callback to sleep?
>
> It calls functions that can sleep:
>
>     msleep(25);
>     gpiod_set_value_cansleep(epd->border, 0);
>     msleep(200);
>     ...
>     power_off(epd);
>
> [ ... ]

False positive

>
>> -static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
>> -				struct drm_plane_state *old_state)
>> +static void repaper_plane_helper_atomic_update(struct drm_plane *plane,
>> +					       struct drm_atomic_commit *commit)
>>  {
>> -	struct drm_plane_state *state =3D pipe->plane.state;
>> -	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_pl=
ane_state(state);
>> +	struct drm_plane_state *old_pstate =3D drm_atomic_get_old_plane_state(=
commit, plane);
>> +	struct drm_plane_state *pstate =3D drm_atomic_get_new_plane_state(comm=
it, plane);
>> +	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_pl=
ane_state(pstate);
>> +	struct drm_crtc_state *cstate =3D NULL;
>>  	struct drm_rect rect;
>> =20
>> -	if (!pipe->crtc.state->active)
>> +	if (pstate->crtc)
>> +		cstate =3D drm_atomic_get_new_crtc_state(commit, pstate->crtc);
>> +
>> +	if (!cstate || !cstate->active)
>>  		return;
>> =20
>> -	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
>> -		repaper_fb_dirty(state->fb, shadow_plane_state->data,
>> +	if (drm_atomic_helper_damage_merged(old_pstate, pstate, &rect))
>> +		repaper_fb_dirty(pstate->fb, shadow_plane_state->data,
>>  				 &shadow_plane_state->fmtcnv_state);
>>  }
>
> [Severity: High]
> This is a pre-existing issue, but does repaper_fb_dirty() perform blockin=
g
> memory allocations in atomic context?
>
> The plane atomic update callback must not sleep, but repaper_fb_dirty()
> uses GFP_KERNEL for memory allocation:
>
>     buf =3D kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>
> Should this allocation be moved outside of the atomic update path or use =
a
> non-blocking flag?

False positive
