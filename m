Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E7B202F70
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787845525; cv=none; b=KTHjZz+4tbN9H+6myrVmK1FWumdJ9xA+UD+R8JwyblmAn8eAVATaJUY4yB+u0TvLGAgxpK4UvXyjrsjem1PUnZeB1sm8UCeX54pGhuNJS4pwzAgFcT3hGeVRFI0CmU2ANLymZ79VQ+mv3JQ74v1tbCbT+o1LhSn2txeeYArrDeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787845525; c=relaxed/simple;
	bh=/fxAMBlf0kUAuzwPRUNe7r1h2X/Fn3SIGCrrk8cVO+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uW74a3b4lUz7LZr35ZAHGtqIKvIUlWFoOpXW2/z9bUGMnw5xdQMiGObUFhOui45gsRSni5JONYKqpjGNqhsGqdrXdl/9aL+4+BOzDKMAuj346XKbR8evoLkUsRxr0iKWL2IQ80P4ca4/DH/RpzO5P9Bf0g5q84GrXFqBMm2UHYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Biw1uhz4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Biw1uhz4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49954b88fffso19541435e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 08:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787845522; x=1788450322; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZHwo+xGhyHn5BFSs+/et2NTgWRMdJNfULKw3PzDr3AE=;
        b=Biw1uhz4YcnjdPws4y9OME/Pj55c7dmG19W3/jhSWjXx+k8OWJvCcrAChkeBZ2b6zg
         ot0xjFhU52AnbWm/ixEJwXRL3PLG8OIH2ZYjxmW4+z8savghdDJ2fENPUbEkNlu5QdZ5
         PEew1Ogok2T+NrFDHSAiqJ4mJZIYj9E9f/ICQPeo/04jInz0F2NcIamJn5p8QGgEWUOu
         9VODoedbrvMZjpWXdc1OKXq9ad7Rb0BD+4EiIkNFSHF7/pEwmYYZs7OPusLFnStljDM/
         e20mEYjoINnzn06dHw9X87h52v9fISAGGpE43yfvrQGukt/nkQ8AZEl8tHwOJy9/KcTF
         VsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787845522; x=1788450322;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZHwo+xGhyHn5BFSs+/et2NTgWRMdJNfULKw3PzDr3AE=;
        b=IaozNCEPqDL9NW/Vm3mAxkcRlUrNTF/j7IdT6I4AzGEKH7X4AECmCxeA9N2dBw4I6T
         VbbnwNIRImz3DW91nVqWHEDjRLMCbF+q8+yZsXV4EUKDLO0j7YcczsEpLY65U38gZATW
         KQCf7DDowN9vUdmftWPStLwSW4vKLkeTcxwFC2XT6XolAg3TN5erTBJ6jHSx94DZ8uDl
         7SfDDWE7SMbfC39bV2A7+Yz+tHQ4jVrQiXtu6M9y0Pp2QSA5P5ZF4BPgNgr/LIblxu8L
         iRh72o2RUc1rzd7JkogSuON+Npyyeizz1AS/8gvCosQGmeZjo7BxC5yOUOXcw/Jicu+g
         qbqQ==
X-Gm-Message-State: AFuF++m6bv+EWNRgXJ6fFasq6BVDzk0N7JIUJl0aR+Mu1ZHdeGvxYhjJ
	5hWf/dnY9p6i4mlRJJbV9TPIaKs1KT2X4dpW4e6e/LQTyNkF/48eDkrNKT9YFqlMSn5z3mTqpgk
	L9tBQd/Q=
X-Gm-Gg: AR+sD132lG1ZFcRPbniVg9OZZJ7KXUrAf4OsxfeRTOzpdZ7kbmrDs3y2UrkHbFQlVZE
	NCOm0R+BTvJYRIsGRZBssFyfsb/rbQNDUAZx4oALj26gOXD4R6vFd+3+iipKnYNpFmvcvynrcuO
	o8rpjBrFF3fb5oUHbuvoU56W84bX3Wfesb1g0raZQ3s8fQf1FlqTZiGaoXdsHH4U+B1boyKi+bc
	7WIrjEczEPne4o0hJ7bkQlPcAmqmYLVXJQq9aIzsmJ3pEkK9vqOeEDJRF6mEyGiAaIW5F/n5Bxf
	wUeVZOIiOONNKU/DumijZRoezG2i0fwcGzh5KmEOudgZUHaSZSiINo3I4ZXR8nhhKNS9Nswx0OZ
	ga/LA0siM6zz6DFnupqA9e0LHEqGhOy0rvrnfMj7MLkIVm1BAhdewrcGz2f0ssXZsdP+84z5t0a
	x9ELGuaz4vxeb3UOps17Da0bn/S3rZlkblXiJ4GU9cH9LUiw9h/lFQdnSJmwhpmA==
X-Received: by 2002:a05:600c:8109:b0:49b:910c:7703 with SMTP id 5b1f17b1804b1-49b910c77a6mr21605835e9.9.1787845521714;
        Thu, 27 Aug 2026 08:45:21 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56acedsm90464825e9.3.2026.08.27.08.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:45:20 -0700 (PDT)
Date: Thu, 27 Aug 2026 17:45:18 +0200
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: Harry Hsu <x90613@gmail.com>, live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org, jikos@kernel.org, jpoimboe@kernel.org,
	mbenes@suse.cz, joe.lawrence@redhat.com
Subject: Re: [PATCH v2] livepatch: Reject livepatches with aliased old_func
Message-ID: <apBbjoEHJ98DWN_W@pathway.suse.cz>
References: <20260823060734.58443-1-x90613@gmail.com>
 <20260823062313.1321B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823062313.1321B1F000E9@smtp.kernel.org>

On Sun 2026-08-23 06:23:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Initialization failures in klp_init_object_loaded() leave livepatch module relocations uncleared, leading to state corruption and permanently preventing target module loading.
> --
> 
> --- Patch [1]: [PATCH v2] livepatch: Reject livepatches with aliased old_func ---
> commit 230a471112d181b2e9810c9877ffebb05a42d61c
> Author: Harry Hsu <x90613@gmail.com>
> 
> livepatch: Reject livepatches with aliased old_func
> 
> This patch adds a check during livepatch initialization to reject
> configurations where multiple functions resolve to the same alias address.
> It prevents ambiguity when the redirection logic evaluates the func_stack
> in the ftrace handler.
> 
> Link: https://lore.kernel.org/all/20260812140232.48079-1-x90613@gmail.com/
> 
> > diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> > index 28d15ba58a26d..c35cf08c27c86 100644
> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
> > @@ -866,7 +866,7 @@ static void klp_clear_object_relocs(struct klp_patch *patch,
> >  static int klp_init_object_loaded(struct klp_patch *patch,
> >  				  struct klp_object *obj)
> >  {
> > -	struct klp_func *func;
> > +	struct klp_func *func, *prev_func;
> >  	int ret;
> >  
> >  	if (klp_is_module(obj)) {
> [ ... ]
> > @@ -888,6 +888,21 @@ static int klp_init_object_loaded(struct klp_patch *patch,
> >  		if (ret)
> >  			return ret;
> >  
> > +		/*
> > +		 * Aliased symbols share one address, so they would resolve to
> > +		 * the same klp_ops and stack up on a single ops->func_stack,
> > +		 * leaving the redirection ambiguous.  Reject the livepatch.
> > +		 */
> > +		klp_for_each_func(obj, prev_func) {
> > +			if (prev_func == func)
> > +				break;
> > +			if (prev_func->old_func == func->old_func) {
> > +				pr_err("'%s' and '%s' resolve to the same address, aliased symbols are not supported\n",
> > +				       prev_func->old_name, func->old_name);
> > +				return -EINVAL;
> 
> [Severity: High]
> This is a pre-existing issue, but returning an error here leaves the
> module relocations applied earlier in this function uncleared.
> 
> When a module is loaded, klp_module_coming() iterates over patches and
> calls klp_init_object_loaded(). If initialization fails, it delegates
> cleanup to the error path:
> 
> kernel/livepatch/core.c:klp_module_coming() {
> 	...
> 	ret = klp_init_object_loaded(patch, obj);
> 	if (ret) {
> 		...
> 		goto err;
> 	}
> 	...
> err:
> 	...
> 	klp_cleanup_module_patches_limited(mod, patch);
> 	...
> }
> 
> However, the cleanup loop skips the failing patch entirely:
> 
> kernel/livepatch/core.c:klp_cleanup_module_patches_limited() {
> 	...
> 	klp_for_each_patch(patch) {
> 		if (patch == limit)
> 			break;
> 		...
> 		klp_clear_object_relocs(patch, obj);
> 	}
> }
> 
> Because it breaks when reaching the limit patch, klp_clear_object_relocs()
> is never called for the relocations that were successfully applied at the
> start of klp_init_object_loaded() via klp_apply_object_relocs().
> 
> Could this permanently corrupt the livepatch module's state and prevent
> the target module from safely loading again, since the relocations are
> never reverted?

This is a good catch. Functions called in klp_module_coming() are
supposed to revert their own changes on failure. Or
klp_module_coming() is supposed to call the counter-part
(pre/post scripts).

It seems to work, except for the changes done by
klp_init_object_loaded().

I think that it was not important in the original design.
The only important revert is the clearing of relocations
which was added later.

I am working on a patch which would fix it. I want to do it
the right way and call also klp_free_object_loaded() and
clearing obj->mod separately...

It is getting late here. I hope that I'll send it tomorrow...

Best Regards,
Petr
