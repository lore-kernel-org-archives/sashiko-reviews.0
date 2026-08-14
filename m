Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380333AAF5F
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 15:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786719897; cv=none; b=Mm0dOkOQcpyfSLDg02uYG+hTvRXyPBggaey1A+Y2VAU8ehCz3NjJLuyDO3wZijQWcJuVGKR3HPOiTnTyV7NiOVXNxzwI5aU7Jk6vR52oj2MOPCJsUG+8i0/ZoAyXnrR76n760DfzlPqQ8CEM84Ab9FiO8eJkOKEfMVJvr25m0XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786719897; c=relaxed/simple;
	bh=NvVAbYBU185WneoSgMcFUr9kFVrv1d7BGQxpqdAy0OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYnCxQ/uoQbS/HKWVbrQUpXQLdV+gaf9JqiOG7KhwSp/ZPT1I+O2hiTbDXvHAi4ypCIbMNfOvvnLvR1y56lt0m9E8rDnp5e3THpFaPnx0mzWKgcej6KAQbqWr2VDcXIrNgjEYWwmk/uJnboCWmC4xyqL3c9LzuQ2uEuj5HysczQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bB5ed6Tm; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bB5ed6Tm"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d3b445a84fso90845ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786719895; x=1787324695; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kayzQZfqtmmp1eC2tR/rKF1wFKlx2J92sDaRBHhidao=;
        b=bB5ed6TmuXisUG2omCR/At+CDePZK58gAMkBAxG9dTB4OMD5DWW0Q8k+WQOu6aIChN
         AmZL8oXSas4/eCUgsXinQZmxS1WSZdFnlnR25D6owGBrMtoaR0uhM4IdwKvEVo+he262
         OIMVLPEPQMbcylSg8RFYPgSmO8ZObZao62jHAY5WK5Qo5zBqClsBUWkQSAk9ZWaUXeOW
         8hSE3nEd8na8paYJQ+d79t1sL9VcPhTP8LkSLx6Nkb7IWwBJbdMLAQddHUOZ8j5/rdGH
         ufmMJP3SF8HkKkeDAcHtxORY9bbMCBpqpapb6jYUktoC7heP3+qgc+szWjqHDo4+Wdpk
         mHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786719895; x=1787324695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kayzQZfqtmmp1eC2tR/rKF1wFKlx2J92sDaRBHhidao=;
        b=oprTiJqa5mTeMGDHsOWKZijrJxbIhE2UWCo6bD4sG+utbGAlTjkTm3cb2H+xffX18N
         J5C/qPnUPCjNG26+FcTI45HUXNgpblDo5vleQjhNfq8MMyZKImurSlqDoDLfMrzPhKlx
         ANf5E3CUitkDhJb4nmDbShcn1QxcFd6o9nb2m3cMLaB4HOUMpp8kEcvvhOaJ77buXfsl
         hO+dYJig4SZMaS5gaZxjx2aHKhJrUSrujgK+LJH3n0jD5cUzFKcrYDlInQYX3gbFzzD3
         cTYQUHa59E9sGURPOGNUK6vxck+rKo+7hfbUUg2SvszY89YZD55G8NgUNew8GJmxs4y3
         aBFQ==
X-Gm-Message-State: AOJu0YypDVmGh3qBy3cuRSAx2QA9Q0Igb+0t7OswsvdqeZYwFaVptNJT
	l/11zTRxvKoNOjwcnjV5rQ+nt+Uqw3BCwUyrn5ITMMk9Uw/P7YA4AtrKKc3dlBNNxU2nScHoMmH
	f8PNXGQ==
X-Gm-Gg: AR+sD11r/QwGtd6BfOj5J4PPWFoQiJV847VSI3I1B6wZLb92xwmJmwrCMJjhitFtfE7
	IrOGx6sFnxUsWXVO8m8CiLopW5DkHyfBkp+PxwQpVMZipaTPQyBBjVZ8X1w8KEAt/JXMlLMutyx
	dvPMizC+luG30b1XtmA/v5FruqOsO3COXb8AfzEUr6GKg6nwHl1bE36iJ79TQWTkOOAkTiaWAH1
	pliVJgSMQ6QRHX2aECcieqJnRfC20EBtwiJygThS6cUAqoML8uIkbjQ+XXEv1hPlAM5dWDLn7rt
	m6omMspbSsI/WQe/YWMzox3OVgzG8YGGOhIY4hHBKKgRysO3ikhtEg0YigllTYI+GK36Wi0JnQQ
	bZkrLIcX9qFaK5j+ffeytWF/0GxLu71AIHrFwayp1UeIV91gCl0+led+le92AFIqkbkddREmxLO
	mYSqrstDQaIC+mlllWxy6VCpwnjZv+OpISCEN+n0X6jCQUgEsBK2Ka6MQoLIOeHQbVGm+S+Yfj+
	G3WsawNJVQk3wjIfkbHQgE=
X-Received: by 2002:a17:902:ea03:b0:2c9:bd54:cf with SMTP id d9443c01a7336-2d3aef5eff0mr9451345ad.4.1786719893479;
        Fri, 14 Aug 2026 08:04:53 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae800480sm11350755ad.33.2026.08.14.08.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:04:52 -0700 (PDT)
Date: Fri, 14 Aug 2026 15:04:47 +0000
From: Pranjal Shrivastava <praan@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>,
	linux-pci@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v6 1/5] nfs: make nfs_page pin-aware
Message-ID: <an8uj2qmwuHeSCL1@google.com>
References: <20260814143255.861084-1-praan@google.com>
 <20260814143255.861084-2-praan@google.com>
 <20260814144658.129DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814144658.129DB1F000E9@smtp.kernel.org>

On Fri, Aug 14, 2026 at 02:46:57PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Subrequests incorrectly drop GUP pins multiple times because `req == req->wb_head` evaluates to true for all requests during teardown, causing pin count underflow and Use-After-Free.
> - [Medium] Hardcoded unpin count of 1 in `unpin_user_folio()` leaks GUP pins for large folios spanning multiple pages.
> --
> 
> --- Patch [1]: [PATCH v6 1/5] nfs: make nfs_page pin-aware ---
> commit 21b0f62730c29dca3085e0b77d441b62786919e8
> Author: Pranjal Shrivastava <praan@google.com>
> 
> nfs: make nfs_page pin-aware
> 
> Modernizing the NFS Direct I/O path to use iov_iter_extract_pages()
> introduces page pinning (GUP) instead of standard page referencing.
> To handle this correctly, nfs_page must track whether it holds a
> pin or a standard reference.
> 
> > diff --git a/fs/nfs/pagelist.c b/fs/nfs/pagelist.c
> > index 7dd478ffc2fab..a562cfe2a126d 100644
> > --- a/fs/nfs/pagelist.c
> > +++ b/fs/nfs/pagelist.c
> [ ... ]
> > @@ -552,11 +566,21 @@ static void nfs_clear_request(struct nfs_page *req)
> >  	struct nfs_open_context *ctx;
> >  
> >  	if (folio != NULL) {
> > -		folio_put(folio);
> > +		if (test_and_clear_bit(PG_PINNED, &req->wb_flags)) {
> > +			if (req == req->wb_head)
> > +				unpin_user_folio(folio, 1);
> 
> [Severity: Medium]
> Will this leak GUP pins for large folios spanning multiple pages?
> 
> If a caller uses nfs_page_create_from_folio() with pinned=true for a folio
> spanning multiple pages, hardcoding 1 releases only one pin and leaks the rest.
> 
> Also, does this check for the head request evaluate to true for all
> subrequests?
> 
> During teardown, nfs_page_group_destroy() breaks the page group linkage by
> setting tmp->wb_head = tmp before freeing the request:
> 
> nfs_page_group_destroy()
>     tmp->wb_head = tmp;
>     nfs_free_request(tmp);
> 
> Because of this, when nfs_clear_request() is called, req == req->wb_head will
> evaluate to true for all subrequests, causing each subrequest to unconditionally
> invoke unpin_user_folio() and potentially resulting in a pin count underflow
> and Use-After-Free.
> 
> > +		} else {
> > +			folio_put(folio);
> > +		}
> >  		req->wb_folio = NULL;
> >  		clear_bit(PG_FOLIO, &req->wb_flags);
> >  	} else if (page != NULL) {
> > -		put_page(page);
> > +		if (test_and_clear_bit(PG_PINNED, &req->wb_flags)) {
> > +			if (req == req->wb_head)
> > +				unpin_user_page(page);
> 
> [Severity: Medium]
> Similar to the issue above, because nfs_page_group_destroy() severs the
> linkage and sets tmp->wb_head = tmp, will this unconditionally call
> unpin_user_page() for all subrequests and cause a pin count underflow?
> 

These are fixed by patch 2 with the introduction of wb_nr_pinned.

Thanks,
Praan
