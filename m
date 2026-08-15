Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0FB189B84
	for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 18:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786819781; cv=none; b=b9IpYh7KG9eeugdjwTe9BlaPEYgvTQ5S+il/CAGjkTSQ9thWbz2CdIiI4RuNVdyQJpYiqfSrk1OHBydSoIjJa8FeN6i+A6OWwyI8VclSf/XxdN7g75xzO/rQ6fadB2z6pSqcY6AMfjoahQNBX/KCpGMg3iBsUBjtz/d/0+pJGiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786819781; c=relaxed/simple;
	bh=PttXHyLo2Ca8uSgwgo9FDS084O6lH/w869izAOuRLwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCa2bdfVgjlgMuyH0NI0fcWJt+aeh7f4VJmvz4Al/T8+lE0OThFmhqJTwBpoi/cCP2VjqOCdt1cR9jb4vzXRNC9nDRD5oPNxCdPxbDgsSXNzF0Ac97UYmPY+/wqjIjrdCZZ5FnmpR5QdpUjW8vwkV5aG+JJfGA/PSjlT38vdxXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Pd6x59u8; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Pd6x59u8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=6WuypneQn3cTHhX0dwJvE+PWf9laq6MT/r6uqMRRYko=; b=Pd6x59u8xZNcIbia
	8YI98wuNpUOrPFLzovlpKqVkqBfljTvNdfQdhzuxpb3He/gOEA4vffxZWNygHgXtzkjh/IY2ZhbtC
	NBUPzS6nrjo7FNtIlj6BqBKgSRG9pN7FIlbZ9U9+W0x8P05wgYxAHW7lZvK8o4QCGYYymfASQ6P5r
	6rDbGLdoiCOvbrLnDm66v+apvqhck1IgBAOovzWgms+zqLRymvWJAzYr6iV1UBaz5mcMMs99xW3xZ
	Dmnbb6ctigLeNmhSwSgM8vtG7DJcLFotootLVQMVdR9cdhDKcK2xdQK7eX0p/y041A+R/YqD1O/rY
	OMIrFL18in+n+BW+1A==;
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
	(envelope-from <dg@treblig.org>)
	id 1wvJRp-00000002HnN-3eX2;
	Sat, 15 Aug 2026 18:49:37 +0000
Date: Sat, 15 Aug 2026 18:49:37 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/amdgpu: Remove is_idle (non trivial functions)
Message-ID: <aoC0wVsRCZ74YlOL@gallifrey>
References: <20260815180033.8958-1-linux@treblig.org>
 <20260815180033.8958-4-linux@treblig.org>
 <20260815183749.21F7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260815183749.21F7F1F000E9@smtp.kernel.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.101+deb13-amd64 (x86_64)
X-Uptime: 18:49:20 up 8 days, 22:27,  2 users,  load average: 0.06, 0.02, 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)

* sashiko-bot@kernel.org (sashiko-bot@kernel.org) wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Incomplete API cleanup: The `is_idle` function pointer remains defined in `struct amd_ip_funcs`.
> --
> 
> --- Patch [3]: [PATCH 3/4] drm/amdgpu: Remove is_idle (non trivial functions) ---
> commit cf17e80a1ef9c0d7e6925465357af056c949e840
> Author: Dr. David Alan Gilbert <linux@treblig.org>
> 
> drm/amdgpu: Remove is_idle (non trivial functions)
> 
> This commit removes the various is_idle implementations across the amdgpu
> driver since the method is never called. The same logic is mostly duplicated
> in the wait_for_idle method which remains in use.
> 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> > --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> [ ... ]
> > @@ -435,7 +424,6 @@ static const struct amd_ip_funcs cik_ih_ip_funcs = {
> >  	.hw_fini = cik_ih_hw_fini,
> >  	.suspend = cik_ih_suspend,
> >  	.resume = cik_ih_resume,
> > -	.is_idle = cik_ih_is_idle,
> >  	.wait_for_idle = cik_ih_wait_for_idle,
> 
> [Severity: Low]
> Since we are removing the .is_idle assignments across the tree, is it also
> worth removing the is_idle function pointer from the struct amd_ip_funcs
> definition in drivers/gpu/drm/amd/include/amd_shared.h to complete the
> API cleanup?

That's what I do in the next patch!

Dave

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260815180033.8958-1-linux@treblig.org?part=3
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
