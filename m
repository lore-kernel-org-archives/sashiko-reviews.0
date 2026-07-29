Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838453BB122
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 07:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785308587; cv=none; b=SqSABTm5ZkzgqYbwTfX9eJzVDmbekl6HLmRUQvumPHEq0Jo3yjs0vK9XNR6fT2d+6lk+I66oVgdIkLPnebQLObqC5vXWhdUmqF5xD1FLHr0txSjuOZwPENdfMNPF0EPuf1vJzmcYd+3DOjWf0vt7q7MAQLWyhkTwodhgMGe6dZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785308587; c=relaxed/simple;
	bh=m+Op77YEKvI3wHpV3WvQB9l9ZhrPGJ43SJNNa2897kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcL5KZ3prdE0+VHL81JtP2rfMNoQCnmPlOuhGpT/lbW87KpR/quwmZjYMTJovwcK/j1vJcwz2SL+zRlFp1pp4tC7bOnDJFpi9V270CcDpw9qakm/rp9q13bpvxiNGcyqlXpxXiqLBIzpYDxoad5zZPTZeKk0HEhC790KSAOLuZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=plpf8FMk; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="plpf8FMk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:From:Reply-To;
	bh=gvjHHJ/cdGYoYlkkCwDIsHSmQaqCyqzXpRK4eerB6+s=; b=plpf8FMkpcgr34jqe7uzvn8Clo
	I0e6L4sjMxnVo8R5FAy/9A9quSJhDkUH6SUrgTDHs7eV/COKNlV/oyWYp8iRESNyYUN8lQFnOp15X
	jjPnxLdwtmTr7DNniGvPqqytswT2UenHqPARrIvN7H3LyEoH1vAXBuwDhNDR97S4Dg2I37I5Haucz
	yDRbpFxhMPGWnaDQUnFlfKV7GYNyq1q5QPUx2nb+ylOv5MnJPWEquyOLW95n05nkU+Ka0LZZkQvvf
	5sFTWOYam1FaKDhqSmIvGQUPs3DrTXWwV7zyaip5Lu+H80P6/Z9bOZAcpPicrcWsV52nFqM+Jz+aF
	ghOWjWGg==;
Received: from 179-125-64-236-dinamico.pombonet.net.br ([179.125.64.236] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1woyJf-007N2s-S3; Wed, 29 Jul 2026 09:03:00 +0200
Date: Wed, 29 Jul 2026 04:02:57 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm: Fix drm_pending_vblank_event leak in error path
 for out_fence_ptr
Message-ID: <ammlofcycoqMLlgk@quatroqueijos.cascardo.eti.br>
References: <20260729-drm_pending_vblank_event_leak-v2-1-a5074aae07df@igalia.com>
 <20260729062342.E449A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729062342.E449A1F000E9@smtp.kernel.org>

On Wed, Jul 29, 2026 at 06:23:42AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Medium] API Contract Violation: out_fence_ptr is not set to -1 on certain error paths
> --
> 
> --- Patch [1]: [PATCH v2] drm: Fix drm_pending_vblank_event leak in error path for out_fence_ptr ---
> commit ee648481e8c7946df39aedd0d40de2f6f6522bf2
> Author: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> 
> drm: Fix drm_pending_vblank_event leak in error path for out_fence_ptr
> 
> This commit fixes a memory leak in the error path of prepare_signaling when
> DRM_MODE_PAGE_FLIP_EVENT is not set but an out_fence_ptr is provided. It
> ensures the pending vblank event is properly released and the crtc state
> event pointer is cleared on allocation or fence creation failures.
> 
> Link: https://patch.msgid.link/20260728-drm_pending_vblank_event_leak-v1-1-08429b920b16@igalia.com
> 
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > index 1050dddadb17e..aed6040182eb6 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -1464,11 +1464,15 @@ static int prepare_signaling(struct drm_device *dev,
> >  		if (fence_ptr) {
> >  			struct dma_fence *fence;
> >  			struct drm_out_fence_state *f;
> > +			struct drm_pending_vblank_event *e = crtc_state->event;
> >  
> >  			f = krealloc(*fence_state, sizeof(**fence_state) *
> >  				     (*num_fences + 1), GFP_KERNEL);
> > -			if (!f)
> > +			if (!f) {
> > +				drm_event_cancel_free(dev, &e->base);
> > +				crtc_state->event = NULL;
> >  				return -ENOMEM;
> > +			}
> 
> [Severity: Medium]
> This is a pre-existing issue, but I noticed a potential UAPI contract
> violation here.
> 
> If krealloc fails, we return -ENOMEM before out_fence_ptr is added
> to the fence_state array or num_fences is incremented.
> 
> Does this mean complete_signaling() will skip this element and fail to write
> -1 back to the userspace out_fence_ptr, leaving userspace with an
> uninitialized or stale fd value?
> 

This is set to -1 at drm_atomic_crtc_set_property().

> >  
> >  			memset(&f[*num_fences], 0, sizeof(*f));
> >  
> > @@ -1476,12 +1480,17 @@ static int prepare_signaling(struct drm_device *dev,
> >  			*fence_state = f;
> >  
> >  			fence = drm_crtc_create_fence(crtc);
> > -			if (!fence)
> > +			if (!fence) {
> > +				drm_event_cancel_free(dev, &e->base);
> > +				crtc_state->event = NULL;
> >  				return -ENOMEM;
> > +			}
> 
> [Severity: Medium]
> This is also a pre-existing issue, but similarly, if drm_crtc_create_fence
> fails, out_fence_ptr is written to the array but num_fences is not
> incremented.
> 
> Will the cleanup routine skip this pointer and fail to write -1 to userspace?
> 

Same as above.

> It looks like this same pattern also exists in the connector loop later in
> prepare_signaling() when drm_writeback_get_out_fence() fails.
> 

Same for set_out_fence_for_connector(). As for the connector loop, I don't
see such potential leaks there.

Regards.
Cascardo.

> >  
> >  			ret = setup_out_fence(&f[(*num_fences)++], fence);
> >  			if (ret) {
> >  				dma_fence_put(fence);
> > +				drm_event_cancel_free(dev, &e->base);
> > +				crtc_state->event = NULL;
> >  				return ret;
> >  			}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729-drm_pending_vblank_event_leak-v2-1-a5074aae07df@igalia.com?part=1
