Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E9C3769EA
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 05:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785130766; cv=none; b=ay9GY0Iq/IfQUm2JZZ5Amq0JIRAUeDa0unHulowi+cVCeA07pMaJMll5vh0NTTXN2ZNct+etfYkSPiCujaHO9pG50MQ4fWl4E5WRJAk0V5EHHs+L+VSf2YbVxjMS//jGgEPgMSa4Kq/dFKflJBcXPSzEzGrEcgyMYWdtQOjvtYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785130766; c=relaxed/simple;
	bh=THJbpLdpCtlMxS6tSaJy/cUGEJqtKPxSNpq0bYYSPzc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EmS6Oz2vexyjxPmHWGWSrWF7KxV9KBIKzcEYIo7Rlfpz6qz6a49uwPzMtdib7DUXEZqbk7clzx0u8xd7oNxQWmsoLv+Ztys+XOJ5LdTi+gRS9sHXn9N/yO7i8kLSvh74YV8wvRfjj/L4JyJY01fXVDaj6MROA/NOfJ/QsLdVJV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.179
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
Date: Mon, 27 Jul 2026 13:39:06 +0800
Message-Id: <DK941BNOQOI4.1Z9J0Z5O60MS0@oss.qualcomm.com>
Cc: <imx@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <Frank.Li@kernel.org>
Subject: Re: [PATCH v3 8/8] drm/xen: replace struct drm_simple_display_pipe
 with regular atomic helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-8-cd5dc89858c6@oss.qualcomm.com> <20260726195657.4C5221F000E9@smtp.kernel.org>
In-Reply-To: <20260726195657.4C5221F000E9@smtp.kernel.org>
X-Migadu-Flow: FLOW_OUT

On Mon Jul 27, 2026 at 3:56 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Incorrect coordinates passed to xen_drm_front_mode_set: uses des=
tination screen coordinates instead of source framebuffer offsets.
> --
>
> --- Patch [8]: [PATCH v3 8/8] drm/xen: replace struct drm_simple_display_=
pipe with regular atomic helpers ---
> commit c7c607527ef2df6f1f1c3266167b6754066820c2
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/xen: replace struct drm_simple_display_pipe with regular atomic helpe=
rs
>
> This commit replaces the Xen frontend simple display pipe with explicit
> plane, CRTC, and encoder objects. It retains generic plane-state validati=
on
> and uses commit-local plane state in the CRTC enable path.
>
>> diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/x=
en/xen_drm_front_kms.c
>> index 48772b5fe71cf..9896ea35b7439 100644
>> --- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
>> +++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
>
> [ ... ]
>
>> -static void display_enable(struct drm_simple_display_pipe *pipe,
>> -			   struct drm_crtc_state *crtc_state,
>> -			   struct drm_plane_state *plane_state)
>> +static void xen_drm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					      struct drm_atomic_commit *commit)
>>  {
>> -	struct xen_drm_front_drm_pipeline *pipeline =3D
>> -			to_xen_drm_pipeline(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_framebuffer *fb =3D plane_state->fb;
>> +	struct xen_drm_front_drm_pipeline *pipeline =3D xen_drm_pipeline_from_=
crtc(crtc);
>> +	struct drm_plane_state *pstate =3D drm_atomic_get_new_plane_state(comm=
it, &pipeline->plane);
>> +	struct drm_framebuffer *fb =3D pstate->fb;
>>  	int ret, idx;
>> =20
>> -	if (!drm_dev_enter(pipe->crtc.dev, &idx))
>> +	if (!drm_dev_enter(crtc->dev, &idx))
>>  		return;
>> =20
>> -	ret =3D xen_drm_front_mode_set(pipeline, crtc->x, crtc->y,
>> +	ret =3D xen_drm_front_mode_set(pipeline, pstate->crtc_x, pstate->crtc_=
y,
>>  				     fb->width, fb->height,
>>  				     fb->format->cpp[0] * 8,
>>  				     xen_drm_front_fb_to_cookie(fb));
>
> [Severity: High]
> The commit message mentions passing the new plane source position, but do=
es=20
> this pass the destination screen coordinates instead?=20
>
> It looks like pstate->crtc_x and pstate->crtc_y represent the destination
> coordinates on the CRTC. Should this use the source coordinates instead=
=20
> (e.g., from pstate->src) to prevent breaking viewport offsets or causing=
=20
> out-of-bounds framebuffer reads by the backend?

I think using pstate->crtc_x/y is the intended replacement here.

The old code used crtc->x/y. The drm_crtc documentation [1] says these
legacy fields should not be used by atomic drivers, and atomic drivers
should use the primary plane's drm_plane_state.crtc_x/y instead.

Xen has only one primary plane, so taking crtc_x/y from that plane keeps
the same semantics while avoiding direct legacy CRTC state access.

[1] https://elixir.bootlin.com/linux/v7.1.3/source/include/drm/drm_crtc.h#L=
1067
