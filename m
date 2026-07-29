Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C5328CF5D
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 08:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312810; cv=none; b=JwF/G1sn5/HXzAyK4kxMuqqJAAeQ1+V9jaXd6IuhWQCzJPbgYr0/MFct5UTanFfwjb8uaD4zr1Ihq8OFASsK6xed144zyFrYABHkETls8wRk05zh+Y9JA0LFvJGA6h83bbYxxgm9MbjMX0ZOEJsMCz0iovtgrhLOl0DG1RYTdNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312810; c=relaxed/simple;
	bh=OQDgoww7LY7VnpDoMZITZxxb4cm7CiRcV/xROjSIX5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUpkKnxkPLRmW10HVIoPHXB3spmWrxruXMN73RLFwmeTAnTL+bDlPkoTJ+DVfb9LuXhHCtrROh0u0hXuaNoRUb3WBshzPGfmCqZpaCR5b79zXLC/iZC2qkXN343osFsz2LF5+Q7qyhzOktjfoFxxgKc047gUAJUZTD1N8c2awRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=mZVEhmJF; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="mZVEhmJF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:From:Reply-To;
	bh=ehifnGP1xxe4G+Ord5mtlFwP15sja0qQDZhYLeGG87U=; b=mZVEhmJF94IDP1TWOGdm0aO/hR
	aQm+X+jfZ6PNnxLhfMi+KaUnVeUL8OJY1O6oCZf9at9Y6CQwJ1H38vBlOqW93G7G0U5zcqZOPqHEu
	Rqx3Rm/Ydv37kuD8ijNJDNyt9h/IRI5lVrnQCYZNlJ3P13W7kwRjJg8/9BqkB+j7pnqevUvtwfwjh
	YBsF/Mtcq3SatqPqmbavAVGnGsX/UH5qI5PgPumAYFmlmSpKJsThz3r2z2orLd0Hm+hyXdS+A5uPD
	Ac0xkyOz3QGnFrE76gY7cdewmvbOiBKI7rfFdD8u62NCX9oFu0RDknp2csSZiyW12CwlfXSqceL1o
	+c/8WhJQ==;
Received: from 179-125-64-236-dinamico.pombonet.net.br ([179.125.64.236] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wozPk-007OrN-VR; Wed, 29 Jul 2026 10:13:21 +0200
Date: Wed, 29 Jul 2026 05:13:17 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/atomic: remove bogus check for file_priv
Message-ID: <amm2HXpT4Hnqth3A@quatroqueijos.cascardo.eti.br>
References: <20260729-drm_atomic_bogus_check-v1-1-a4d5bd4ae4c8@igalia.com>
 <20260729080458.496221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729080458.496221F000E9@smtp.kernel.org>

On Wed, Jul 29, 2026 at 08:04:57AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Memory leak of `struct drm_pending_vblank_event` in `prepare_signaling()` error paths when `OUT_FENCE_PTR` is requested without `DRM_MODE_PAGE_FLIP_EVENT`.
> --
> 
> --- Patch [1]: [PATCH] drm/atomic: remove bogus check for file_priv ---
> commit 005f3f9bbee21ecd8f3b8b2687c9b0a8040286cc
> Author: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> 
> drm/atomic: remove bogus check for file_priv
> 
> This commit removes a file_priv check in prepare_signaling(), since
> drm_mode_atomic_ioctl() guarantees it is never NULL. Skipping the block
> here would cause a memory leak of drm_pending_vblank_event.
> 
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -1445,9 +1445,6 @@ static int prepare_signaling(struct drm_device *dev,
> >  		if (arg->flags & DRM_MODE_PAGE_FLIP_EVENT) {
> >  			struct drm_pending_vblank_event *e = crtc_state->event;
> >  
> > -			if (!file_priv)
> > -				continue;
> > -
> >  			ret = drm_event_reserve_init(dev, file_priv, &e->base,
> >  						     &e->event.base);
> >  			if (ret) {
> 
> [Severity: High]
> This is a pre-existing issue, but can this function leak the
> drm_pending_vblank_event if an OUT_FENCE_PTR is requested without a
> DRM_MODE_PAGE_FLIP_EVENT?
> 
> If a user submits an atomic commit that requests an out-fence but does not
> request a page flip event, prepare_signaling() allocates an event:
> 
>     if (arg->flags & DRM_MODE_PAGE_FLIP_EVENT || fence_ptr) {
>         ...
>         e = create_vblank_event(crtc, arg->user_data);
>         ...
>         crtc_state->event = e;
>     }
> 
> If the subsequent setup_out_fence() fails (e.g. from FD exhaustion), the
> function returns an error before setting event->base.fence:
> 
>     ret = setup_out_fence(&f[(*num_fences)++], fence);
>     if (ret) {
>         dma_fence_put(fence);
>         return ret;
>     }
>     
>     crtc_state->event->base.fence = fence;
> 
> In the cleanup path, complete_signaling() relies on event->base.fence or
> event->base.file_priv being set to free the event:
> 
>     if (event && (event->base.fence || event->base.file_priv)) {
>         drm_event_cancel_free(dev, &event->base);
>         crtc_state->event = NULL;
>     }
> 
> Since both fields are NULL, does the event get permanently leaked on this
> error path?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729-drm_atomic_bogus_check-v1-1-a4d5bd4ae4c8@igalia.com?part=1

Fixed by https://lore.kernel.org/all/20260729-drm_pending_vblank_event_leak-v2-1-a5074aae07df@igalia.com/.

Cascardo.
