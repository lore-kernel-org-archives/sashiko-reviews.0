Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5954733C502
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 20:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780604833; cv=none; b=ITHVZT4v8+sl3D7Bfnsm0u+qH6fmjd+BPo5Bv9RGWgGDc9VZ5Afsd6NXoHlJNVwIIikU55FAmrPLRmOfYxGvutMB2AYbHfEh6CxvveVgeU7m4rzuYZbJYD8F3qGLBMgn7btoKE+fmasL54PLZnh2jSTNhXistvceYiPgefLq11k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780604833; c=relaxed/simple;
	bh=u/9XFgxEqWqW8YORBUOsZFIzG20Gb9VdlUOATrBEO6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRlIUgqunyUtK3UKZjY5DYVrPGwZjn1Wf5TZrtdobxAJQXsij+QWIQNrg73E2xPAriy8J8cQ2w62A0MLsWRQdgfRia2nqqzM/hHatYkB3R72hpCU/aaURbOdDq8fdZFkspIBQa/J+DyZH/xxqs6ufpfHKgY1aVDM9JDfrYrTon4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Hd4cy5nv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Hd4cy5nv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4908b92904fso13723095e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 13:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1780604831; x=1781209631; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VeXxm1DQAZQwoMjTwYC+F1mwDMpIzyGSUpqxCZ4AH3E=;
        b=Hd4cy5nvrfKIVwPtRUOXu2u93DUD91ECFTgSymNEazTDNUIKorPS6bS/4adTnpG9UD
         RtK3FdSsUptNfPVflQFkCv6ucek3u8ecKJQEbKrt0Jzn2Grqxrp11MrJc4pIZrb9+Dzy
         ++iLNQEBPoFK6HHyCJTK0WmAdMk+7Lbra2oR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780604831; x=1781209631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VeXxm1DQAZQwoMjTwYC+F1mwDMpIzyGSUpqxCZ4AH3E=;
        b=e2rT+c7Lp8SQb6IwwtXxwIZrxsrNaGFK6bdwEW5kDVcq53y32/0RBS12/Y7gP6fu91
         5Ypl22Sk+T0nmDYVspPKRX4fFQBjFyaKs36JPXSxelNAOPtc57LNdK55N46LLIkipJ5p
         59rvm2zj3HAGffVTAY2knS6U4ilZjNtDigOc60QTyjOLG1HAFcyuRNPnp+05iU+ESxuo
         3/OAwuWAzoR4h7i2lJQa1mc7aVCqsMKZkUD4Xd4N3ISFMPZyUbpLWdgrThQyRDULpLuq
         V3ew3B39VsT+LfvTJPOiON9JkhzHZOMFB2lcBe8vDwz+zCm8MzslYTRx/q7ISr8Eo5EQ
         NkOA==
X-Gm-Message-State: AOJu0YxXAJ60Rf9obkt/OejO9DBXyXEiRL0Za/ES3kMWua8qu1iPW7Nw
	bkLTr9mY+NCBgEXDxPsKuzDXb+HiiRAfw4KDunq3eY2jcmqrxg4mhzKls8DT9Rtmlui1gv39D4w
	85tlAYnc=
X-Gm-Gg: Acq92OFwuVqzJvfs18grVo0+D8EBAy53TOD82TlFgHXCsNVjG+QBhE6OhtTJHpDeDLP
	6VGeSUdiY5BeDCUiLXb2DtdmJnEPWCTpoWe7kTwJMsyqVzY4UeenZf1x28x18joA6XgqB2arH0o
	O+nU7q4q/MLQPrxIymkoveEiJjurTDBS0ahpZRK+S3RcNYJeewfrCRYR5bf4Nmc2PE/aeosjXle
	fwzku0Di8l6IzydyO8O2MEb53SZ8xXDn2iey3cLXGIR3efpvWGjUaKm9AyL+sRWPH0c5n6fblXs
	aEDckaE4WkytevtoriAhjW//Ei618e2+NjEhqhqMaXSSLJpVid0DTLKTIqQINguG6M3X5WL5iec
	WitzqbxySdvhFpWzFRuj1u86QrJaNtxBxeENX2t+l3DjW/yD3JuMqXMIev3BScA5qZKwGUu6VrV
	8fY38uL9d5QgS5xsGfUAMdwb9W85Lp/1mi+vX13UPQFM6ocg==
X-Received: by 2002:a05:600c:1554:b0:490:7dfd:f7c2 with SMTP id 5b1f17b1804b1-490c25eaca1mr2350615e9.11.1780604830695;
        Thu, 04 Jun 2026 13:27:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm109657775e9.9.2026.06.04.13.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:27:10 -0700 (PDT)
Date: Thu, 4 Jun 2026 22:27:08 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: sashiko-reviews@lists.linux.dev
Cc: Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/gem: Try to fix change_handle ioctl, attempt 4
Message-ID: <aiHfnHlUboW8upkf@phenom.ffwll.local>
References: <20260604194437.1725314-1-simona.vetter@ffwll.ch>
 <20260604195848.546B31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604195848.546B31F00893@smtp.kernel.org>
X-Operating-System: Linux phenom 6.19.10+deb14-amd64 

On Thu, Jun 04, 2026 at 07:58:47PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The ioctl returns 0 on `args->handle == args->new_handle` without validating if the handle actually exists in the IDR.
> --
> 
> commit c59eb6aaceabfd08a4835d7c2c0133017afcb072
> Author: Simona Vetter <simona.vetter@ffwll.ch>
> 
> drm/gem: Try to fix change_handle ioctl, attempt 4
> 
> This commit attempts to fix a race condition in the change_handle ioctl by
> reworking the two-stage idr replacement logic and renaming variables for
> clarity. It also unifies the object lookup and idr_replace steps and disables
> the ioctl pending testing.
> 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index ac751a42db281..55caad80a3503 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> [ ... ]
> > @@ -1028,52 +1028,36 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
> >  	/* idr_alloc() limitation. */
> >  	if (args->new_handle > INT_MAX)
> >  		return -EINVAL;
> > -	handle = args->new_handle;
> > -
> > -	obj = drm_gem_object_lookup(file_priv, args->handle);
> > -	if (!obj)
> > -		return -ENOENT;
> > +	new_handle = args->new_handle;
> >  
> > -	if (args->handle == handle) {
> > -		ret = 0;
> > -		goto out;
> > -	}
> > +	if (args->handle == new_handle)
> > +		return 0;
> 
> [Severity: High]
> Does this new early return skip handle validation?
> 
> Previously, drm_gem_object_lookup() was called before this check, returning
> -ENOENT if the given handle was invalid. In the new code, if a user passes
> a non-existent handle but sets new_handle to the exact same value, the ioctl
> will return 0 (success) instead of -ENOENT. 
> 
> Should the handle existence still be verified before returning success here?

Since the igt for this ioctl still hasn't landed I don't know, either
kinda makes some or little sense really since why exactly is userspace
asking for this. We could also reject this case as a userspace bug with
-EALREADY or something like that.

Either way this needs to be nailed down with an igt, which really, really,
really needs to land this time before we re-enable this all me thinks.
-Sima
-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
