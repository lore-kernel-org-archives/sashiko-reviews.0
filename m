Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E792E7393
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720478; cv=none; b=lGLAJbQ/bwhlXxzKF9eLlOnWFEWoL/s80drwqNXE94wGVn99Y22ZZpkdvTDm+3jeRfJM+HfPnWJ+xHmEEkBWircrTU65R4pNx7IhUnrXMIFxM/I0+QnRLB5rk8pI/djApV4BHhL4mrok6Qlf92CpOPmtuYfMC1QIe8rS9cL7bRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720478; c=relaxed/simple;
	bh=WlbaNPhFsBQ9/3bd6k7lwTUlnM0GvGZBMc68fG5mxWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyAK/oY37SScF+zAmu7yVJWHmmGkiQ7KdlgkncJT+1TUbPgNVeIcNJ3J4oqkYPnczCy9ABRg0vTTLZheL4quREvfM2N9vz2haK3+bRIHVozNGMMvLhy21IPvlG9ZJp+CUx3Db0b70E+mJwc9ep2Gs8s48pn27W+m6V7ABOa7z08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XrPtqoiA; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XrPtqoiA"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d3b440b97aso100795ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786720476; x=1787325276; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HA+4QEjYv9wt2a3mtOtWyQyKnId+drDyoujVL1+/2N4=;
        b=XrPtqoiAEuIDp1evzTqe51B0dw0trqQYkUoaDWVIkMMPhibSZrHfXwXV/WJWsv1qux
         7f0xtth+0YDLYr4GHILcdVwMJoGKzcJ6G7G5K7SdEoWcCP3XW0Xv8m6w/2UB36jzwBS3
         z070zNcF+kdoLNWucDo4NdiMU4fYLH/VfPB/JSMd0DZFQU797quQtZvAKQ+HaBVf5jvD
         +vNvdyMuR/2FzD1AJopECuWk39KJQNmZBh9HusSLQqNItJ5zr7QhI5jJsUEw9INP5OrE
         XXAouwkOVu6Ne6BdaAhE73gZXu6H183g9PSc6CB83m9H1/8ROU2UNzv4cUJ1bDStr5NG
         3bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720476; x=1787325276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HA+4QEjYv9wt2a3mtOtWyQyKnId+drDyoujVL1+/2N4=;
        b=bvo6ZdrvrBSheAagnZGyVkpQ20e6dv1oNMh6hkU9A4hGdi3Rddoq3+df/CBnCpWn9k
         knzECUb0AM1hTmBu5vwelIOXCS6XPP5pvdpaPzeYBNwAsjLEAi99KCIRYqltWp6mXyDj
         rJ78PA1Ycerz0GbLGTOap+PmR9croFIC1vHKTmDPgfmP8lO0mNiHEmQAzCuGBA8eB5dZ
         IP5JRzf0KU+wkxcvHs6rB8LQ98XX+UiQUP4MCE8OdGxLAkzdDLfY/7jCOG2NqjlVIHH6
         q7qRHeckcZynKVgAmPDy/jqwEmB52VZUNirM9gnpBTOUF+tbPW/jiHh/XmaGu6CNlfKG
         UJZQ==
X-Gm-Message-State: AOJu0YzY7Pj4PU7dO+7Fqf/gq+IRoUsIhFrg7pdcqiglR7OZCSCnHCpv
	3uwekEvieFZtFMPjU9t5y0wBAB6Izdt7GD8j/iAfkUeDkgmY2PrEZBiEVT3KLUPeRajA4bp0D9v
	iPqU/Cw==
X-Gm-Gg: AR+sD12+y15D8zwm75NUwj1jWWr65mW1T+s8qRc4lY/zBPHA5riWGuWnvwWvF1Q4JVd
	qInvsSzBGRP7QYkpqQkssnosU9P+HevX7IDThy+keCYEEu8OA7F5LSBRmyZhB/gfoiFeBiwNLuD
	XkQWf6pLXFNFDNOe6DrBWOTKhuNS657dAfDzc4jODz1sfrrHZ7J+YvgpDe41u7H2SomAarRRzyN
	f5ImT8bmr5vRSqf3T3hxoAsABkmpDnB+9+HX4pSpB8hn+TTmAvC8ForCFDG9CECZ2Bzp8h6Im3j
	LLHrIfhUS34pUcCamvPQidIPEay7WkgndMkFz271ofN+7iDfqhAK/YNDquVzBX46XxaAmlqSZV/
	BtEdWprHcnNfKwti6sTMtvyc2MHRiz2mfUJY5LqXv5H0K9O184FskfmcDJilS34gSbikF2nJBq+
	fvVSDMWi2jtDuZAS/k041zL5VRiBczRynPjk2sSWCLVAIsucZkU41IDaI6k6w2BSQJMrAy8pq1Y
	P23denu4PZ3MvJTRjkYTLw=
X-Received: by 2002:a17:903:3246:b0:2ca:bf8e:360b with SMTP id d9443c01a7336-2d3b49010f5mr6967125ad.9.1786720475688;
        Fri, 14 Aug 2026 08:14:35 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea9961e8sm3005040a91.5.2026.08.14.08.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:14:34 -0700 (PDT)
Date: Fri, 14 Aug 2026 15:14:29 +0000
From: Pranjal Shrivastava <praan@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Chuck Lever <cel@kernel.org>, Anna Schumaker <anna@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v6 2/5] nfs: track number of pinned pages in nfs_page
Message-ID: <an8w1Zp7YkvkY7S-@google.com>
References: <20260814143255.861084-1-praan@google.com>
 <20260814143255.861084-3-praan@google.com>
 <20260814144713.DF1A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260814144713.DF1A21F000E9@smtp.kernel.org>

On Fri, Aug 14, 2026 at 02:47:13PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Latent stack out-of-bounds read by passing a single local stack variable to unpin_user_pages() with a dynamically loaded length.
> --
> 
> --- Patch [2]: [PATCH v6 2/5] nfs: track number of pinned pages in nfs_page ---
> commit 1fad80f498aa716421accabc5c2572235b589709
> Author: Pranjal Shrivastava <praan@google.com>
> 
> nfs: track number of pinned pages in nfs_page
> 
> This commit adds wb_nr_pinned to struct nfs_page to track the number
> of pinned pages. It updates request creation and cleanup helpers to
> ensure that only primary requests perform the final unpinning operation.
> 
> > diff --git a/fs/nfs/pagelist.c b/fs/nfs/pagelist.c
> > index a562cfe2a126d..b9ccf2a87e3c9 100644
> > --- a/fs/nfs/pagelist.c
> > +++ b/fs/nfs/pagelist.c
> 
> [ ... ]
> 
> > @@ -567,8 +572,8 @@ static void nfs_clear_request(struct nfs_page *req)
> >  
> >  	if (folio != NULL) {
> >  		if (test_and_clear_bit(PG_PINNED, &req->wb_flags)) {
> > -			if (req == req->wb_head)
> > -				unpin_user_folio(folio, 1);
> > +			if (req->wb_nr_pinned > 0)
> > +				unpin_user_folio(folio, req->wb_nr_pinned);
> >  		} else {
> >  			folio_put(folio);
> >  		}
> > @@ -576,8 +581,8 @@ static void nfs_clear_request(struct nfs_page *req)
> >  		clear_bit(PG_FOLIO, &req->wb_flags);
> >  	} else if (page != NULL) {
> >  		if (test_and_clear_bit(PG_PINNED, &req->wb_flags)) {
> > -			if (req == req->wb_head)
> > -				unpin_user_page(page);
> > +			if (req->wb_nr_pinned > 0)
> > +				unpin_user_pages(&page, req->wb_nr_pinned);
> 
> [Severity: Medium]
> Could this lead to an out-of-bounds stack read if wb_nr_pinned is ever
> greater than 1?
> 
> Looking at nfs_clear_request(), page is declared as a single local pointer
> on the stack:
> 
> static void nfs_clear_request(struct nfs_page *req)
> {
> 	...
> 	struct page *page = req->wb_page;
> 
> If req->wb_nr_pinned exceeds 1, unpin_user_pages() will read adjacent stack
> memory to interpret as struct page pointers. While wb_nr_pinned is currently
> hardcoded to 1 when a request is created from a page, passing a dynamically
> loaded length alongside a pointer to a single local stack variable seems
> prone to future regressions.
> 

In this (non-folio) path wb_nr_pinned would always ever be 1. Although,
I think we could use unpin_user_page (singular) here.

Thanks,
Praan

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260814143255.861084-1-praan@google.com?part=2
