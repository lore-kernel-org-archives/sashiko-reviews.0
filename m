Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FBC3D47DE
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 03:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785122985; cv=none; b=n47Yqb+lETkzCfkO1EQgyxE6DXOiuvKAYzxos5nf49k4Y3bvsLvvy43yITWmc7P66xBdLmvTVXEPzY5cMSSFPpOLkI7FXEt2F/Im6AH9t60mrhzTsUBPd4lTGj1kfxpOgwhP5aT/ZwnKF5DdVL5W1e+xLmbUt18P8UUcZKAOw2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785122985; c=relaxed/simple;
	bh=edfUi1XRL9EqFtGiXFQABcK5cWkr0J2U5UnhWTWcyDs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=r3nq8eiXZZdJl9yMhb+YUrVFgW1EWl+hahA6WgnNSpofKgDQCRAmz/FDJg3YDqYECNNCU9ENY6fWSu/TIw9jyNef9BodxzcyHaTPETMfxdR7CIzcjfnlE66ps+mORJMMfhAnTgYZSFqSdqmGz2Qoftn82Od2oy5epCR3wvjad8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.189
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
Date: Mon, 27 Jul 2026 11:29:21 +0800
Message-Id: <DK919ZEODP4R.1E7TNMAFUYD7M@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <Frank.Li@kernel.org>,
 <imx@lists.linux.dev>
Subject: Re: [PATCH v3 5/8] drm/gm12u320: replace struct
 drm_simple_display_pipe with regular atomic helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-5-cd5dc89858c6@oss.qualcomm.com> <20260726201340.DA5601F000E9@smtp.kernel.org>
In-Reply-To: <20260726201340.DA5601F000E9@smtp.kernel.org>
X-Migadu-Flow: FLOW_OUT

On Mon Jul 27, 2026 at 4:13 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The driver will crash in `gm12u320_stop_fb_update` due to a NULL=
 pointer dereference when dropping a framebuffer reference. The asynchronou=
s worker `gm12u320_fb_update_work` drops its reference to the framebuffer a=
nd sets `gm12u320->fb_update.fb =3D NULL` after copying the first frame. Wh=
en the CRTC is later disabled (e.g., via device unplug or KMS disable), `gm=
12u320_stop_fb_update` reads this NULL pointer into `old_fb` and unconditio=
nally calls `drm_framebuffer_put(old_fb)`. Because `drm_framebuffer_put` co=
mputes the address of `&fb->base` before passing it to `drm_mode_object_put=
()`, a NULL `fb` results in a non-NULL offset pointer, bypassing any potent=
ial NULL checks in the core and causing a fatal page fault when dereference=
d.
> - [High] The driver calls sleeping functions (`mutex_lock` and `cancel_de=
layed_work_sync`) from atomic context paths, violating DRM subsystem archit=
ectural guidelines. The patch converts the driver to use standard CRTC and =
plane atomic helpers (`gm12u320_crtc_helper_atomic_enable`, `gm12u320_crtc_=
helper_atomic_disable`, and `gm12u320_plane_helper_atomic_update`). These c=
allbacks are explicitly classified by DRM guidelines as atomic context wher=
e sleeping is forbidden, yet they call functions that block.
> --
>
> --- Patch [5]: [PATCH v3 5/8] drm/gm12u320: replace struct drm_simple_dis=
play_pipe with regular atomic helpers ---
> commit 0dd628ecb0a7395ec2d8faaa3a751862640afcb7
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/gm12u320: replace struct drm_simple_display_pipe with regular atomic =
helpers
>    =20
> Convert gm12u320 to direct primary plane, CRTC and encoder setup.
>    =20
> Keep shadow-plane helper state, framebuffer access helpers and
> no-scaling plane-state check from simple-KMS path.
>
>> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12=
u320.c
>> index 4ad074337af07..754617722a0db 100644
>> --- a/drivers/gpu/drm/tiny/gm12u320.c
>> +++ b/drivers/gpu/drm/tiny/gm12u320.c
>
> [ ... ]
>
>> @@ -555,43 +560,106 @@ static int gm12u320_conn_init(struct gm12u320_dev=
ice *gm12u320)
>>  }
>> =20
>>  /* ------------------------------------------------------------------ *=
/
>> -/* gm12u320 (simple) display pipe				      */
>> +/* gm12u320 display pipe					      */
>> =20
>> -static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
>> -				 struct drm_crtc_state *crtc_state,
>> -				 struct drm_plane_state *plane_state)
>> +static void gm12u320_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					       struct drm_atomic_commit *commit)
>>  {
>>  	struct drm_rect rect =3D { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT =
};
>> -	struct gm12u320_device *gm12u320 =3D to_gm12u320(pipe->crtc.dev);
>> -	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_pl=
ane_state(plane_state);
>> +	struct gm12u320_device *gm12u320 =3D to_gm12u320(crtc->dev);
>> +	struct drm_plane_state *pstate =3D drm_atomic_get_new_plane_state(comm=
it, &gm12u320->plane);
>> +	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_pl=
ane_state(pstate);
>> =20
>>  	gm12u320->fb_update.draw_status_timeout =3D FIRST_FRAME_TIMEOUT;
>> -	gm12u320_fb_mark_dirty(plane_state->fb, &shadow_plane_state->data[0], =
&rect);
>> +	gm12u320_fb_mark_dirty(pstate->fb, &shadow_plane_state->data[0], &rect=
);
>>  }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does calling
> gm12u320_fb_mark_dirty() here violate DRM subsystem architectural guideli=
nes by
> sleeping in an atomic context?
>
> gm12u320_crtc_helper_atomic_enable() runs in an atomic context during
> non-blocking commits where sleeping is forbidden. However,
> gm12u320_fb_mark_dirty() unconditionally acquires a mutex:
>
> 	mutex_lock(&gm12u320->fb_update.lock);
>
> Could this lead to kernel warnings like 'scheduling while atomic' or dead=
locks
> during display modesets? (The same applies to
> gm12u320_plane_helper_atomic_update below).

False positive

>
>> -static void gm12u320_pipe_disable(struct drm_simple_display_pipe *pipe)
>> +static void gm12u320_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +						struct drm_atomic_commit *commit)
>>  {
>> -	struct gm12u320_device *gm12u320 =3D to_gm12u320(pipe->crtc.dev);
>> +	struct gm12u320_device *gm12u320 =3D to_gm12u320(crtc->dev);
>> =20
>>  	gm12u320_stop_fb_update(gm12u320);
>>  }
>
> [Severity: High]
> This is also a pre-existing issue, but does gm12u320_stop_fb_update() sle=
ep in
> an atomic context, and could it cause a NULL pointer dereference?
>
> First, like the enable path above, gm12u320_crtc_helper_atomic_disable() =
runs
> in an atomic context where sleeping is forbidden. But gm12u320_stop_fb_up=
date()
> calls cancel_delayed_work_sync() and acquires a mutex.

False positive

>
> Second, can old_fb be NULL when passed to drm_framebuffer_put() inside
> gm12u320_stop_fb_update()?
>
> The asynchronous worker gm12u320_fb_update_work() drops its reference to =
the
> framebuffer and sets gm12u320->fb_update.fb =3D NULL after copying the fi=
rst
> frame. If the CRTC is later disabled (e.g., via device unplug or KMS disa=
ble),
> gm12u320_stop_fb_update() reads this NULL pointer into old_fb and passes =
it to
> drm_framebuffer_put(old_fb):

Good catch. If the CRTC is disabled after gm12u320_fb_update_work()
has consumed the pending framebuffer, old_fb will be NULL. The current
disable path then calls drm_framebuffer_put(old_fb) with a NULL pointer.

We can guard it the same way as gm12u320_fb_mark_dirty() [1]:

	if (old_fb)
		drm_framebuffer_put(old_fb);

Maybe we can fix this in a following patch.

[1] https://elixir.bootlin.com/linux/v7.1.3/source/drivers/gpu/drm/tiny/gm1=
2u320.c#L432

>
> static void gm12u320_stop_fb_update(struct gm12u320_device *gm12u320)
> {
> 	struct drm_framebuffer *old_fb;
> 	...
> 	old_fb =3D gm12u320->fb_update.fb;
> 	...
> 	drm_framebuffer_put(old_fb);
> }
>
> Because drm_framebuffer_put() computes the address of &fb->base before pa=
ssing
> it to drm_mode_object_put(), passing a NULL fb results in a non-NULL offs=
et
> pointer. This bypasses any NULL checks in the core and causes a fatal pag=
e
> fault when dereferenced.


