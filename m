Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D580F43901C
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746858; cv=pass; b=VpMnQhJJQ1pYjycNnG56YR1Vrf3w9+d+t8disGXEO4+Pgj9HBGDkojdivniCZf6SlIo/fpYlehk5/tCA/o/vbrHkYIr4MjEDbFkb1D3R/ivx7UMgiFfHRCxw2ZCSz3LFSQlSzZ0zWfe6z6JPoVS9CkpnjpVQ88xlyL66GCxAh9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746858; c=relaxed/simple;
	bh=4qOR90tTRCkVBMGE2YOkqSvyYF1Pm1pU3Tovf2gPwL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lj4oXi7pB0ttRgjOq3XxQt9iOnEsD5snkzsCmg5QftjNXxBnxdbLy5GWf5z3zMltj5vm0KZZG0/98pCCOATATWRjmNtT4YSAqwez9cazvh1yi5By5VOo1IISmuRc9ssbzme7oDKOGXFrNIszGA2CPabD9is7pswURTO/k8y4ufk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UVw/dprT; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UVw/dprT"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aebbe750f8so4324e87.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 08:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782746855; cv=none;
        d=google.com; s=arc-20260327;
        b=GtJgB8dsMmAxnSk+vGJB02NgQadGaZDAX/0pV4yak0Sfk/RITnCIOIgoU44ovyeO8K
         KUxVk9aWXQq/DvuSSXeqZ/grs6adkXuZENVW2CXD3Nj/33+7hO3haDSpFugHyrtC8391
         DPLHC/RF8UoaVBH2GLueG3SqsB4zxAM/5lE4wSTAccxYW+i2u6e5i69oTfIN2HuvdZ/B
         wuIdJcNRaNyfYj+ZL/qOJ4rM3aoAcfRmGAL8jR51ljqM8yyVOnrMV3+r0JyV65UF5fy1
         8BZXUff+rfrt66NMTAgfrluy6q5vwLJMN7UiXw3uKiTEND6VMsY/QERjfBl5CI/dh3Il
         41xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nSMNBXqdu7f+jFfHmGj9KxEgcM0T/vdkEFz8bc4WpYw=;
        fh=xLMIvr/pz7G9CQ2ZglJuqJ3UVqzLRcz1lQUUc1vwAR4=;
        b=IqbbLkHmDY9BYbm6U4Su2ESPkAKuR0u9aQKQfkdDoxRFMzQ7xAQdTeuHog0Gk679xN
         LZm6mvP7+NIcDAg/gpnMeaojgQDlWueCXcH5i4bwqYsKuPeZ7aNrKgv8hqf3k4urnJcX
         cf+Wcqh9FxWdu2VZvBIE5MF2lJ3kqoL7HwVqLRuAmxLlINuyUrz2AVXIf3WvTKX+i9Dc
         qgu96/Xq1OqG210mWlaVq8B8e+B39/Xt4K1Jf5m8Kl57uFQpswg31eW5ENzeg5h100HT
         4M7vb5Md2bUMDd0YMINa4CkFRAza3xesqOad3uE8NGojoxhoR3jgZYMswi+wceidmAcP
         fDyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782746855; x=1783351655; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSMNBXqdu7f+jFfHmGj9KxEgcM0T/vdkEFz8bc4WpYw=;
        b=UVw/dprT9O+HO7oTXfzGp3SFfBdTxGgi97Nv7HNrCYf939umict1q5U+9h2LvCIn9O
         ANqHK89j5WJCoBOGgHNvPeicVW2JR9mDBm6CtJaG8+INK/+ocUC6HRE5ASg3kzHyLILT
         3utx5M0bevxlh3/muR8drQaWKji2YAN1akr5F3iogLtTnb4IdYJfrwvD2/0cbEdjAJlr
         qFRIIJw+GcFXat/2bX2bBZ1lC6zeGj9jKv5jX8DvcJnCmXsSo51lSBKpvZq7gJpZgKBX
         /348pt01tVVZ8dcD9rkSum4lGbbXFRDFkujbMwJWn5jhjBusjI0PLxbRRdoRXSoCKf8q
         oNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746855; x=1783351655;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nSMNBXqdu7f+jFfHmGj9KxEgcM0T/vdkEFz8bc4WpYw=;
        b=QXagJLEPuOciRa5A6UdaOUfMu0EBJCDDBVAbOtpLhFPH/8DWSb7VNu53vWziH+XsUy
         xdnUGqIIMu8ehR+h/mrzSABlEWoAG/eddCX6W4gcwi7dCDclEHh0VK//saiO6DWHzaMn
         BBP2HAVBT8XSJQPkS/CHAg401Fm/qji8pe2Jbet1G5dJr9OgWvX+fHZzZmDq4rVj5K0b
         FefVhhFjeJMak4F5qNTJ2ZtbS0Rd6kWFfNvPkaVryqyJhYg2jzxtm/KCjO6jZDfro1YU
         n3JV9dDbGB1/rrzSs5nvhtm7cCgbjYFn/UGNr9yv2NxSce9rdRLZuAsVy3R66eH00tiV
         YtcA==
X-Gm-Message-State: AOJu0YzWZX6fmffdJZbDDTv1ybk7YDrFIhrpOO3JV5dJL1D/rgiG7I02
	SeIgaYRrXxWoHwupBkLY3s67QmW0BuYzMMVdpyxwmqCu1Pba7eBEq15AfBEs0wcP0XtZVeL7byW
	yBczOrAXR4OQVY3FoNorpbScEoOsLMld2VXIQFfdmrS9+bnkDs22zO4cufCc=
X-Gm-Gg: AfdE7cmfQkkIn4ioBvmERauRtzB5iaGlGtqGgUy3xIzw9MdJRzhO28HIOOhBz62pBA1
	92uFIdm1nudxMLLBA+qUKFijaJYOZQCf2mpg2ABMTck8NAiY0nWR/iMnVxEFRdtu3U+l7PBhzT1
	NvW4D/Gf+CqfF97yAS/fyFdE8IOAkCEgDFUWOdYczbS67dfVbFTCllO+F/8jBuSPMKc7pG+98Cy
	lRnq0N//VKvlOQqSqIU3wRvde2tmCpuil3CQ6eJUjXHsYoKqEytK7/j4Fqc599u4mp07wjk2g==
X-Received: by 2002:a05:6512:4289:b0:5ae:ba7d:e41e with SMTP id
 2adb3069b0e04-5aebd79ed0cmr6149e87.10.1782746854623; Mon, 29 Jun 2026
 08:27:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629-alloc-trylock-v3-0-57bef0eadbc2@google.com>
 <20260629-alloc-trylock-v3-5-57bef0eadbc2@google.com> <20260629142921.9A05A1F000E9@smtp.kernel.org>
In-Reply-To: <20260629142921.9A05A1F000E9@smtp.kernel.org>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 29 Jun 2026 17:27:22 +0200
X-Gm-Features: AVVi8Cez06atlBYDxc5qOHWHrzUA1EIkcGdk101W9a6vnlRoxyYgsDx2otTEPB8
Message-ID: <CA+i-1C1cBhQAmmUK3Ltezq-VLwQKdGD1TMrZ=AAzzNHQcwxQ0w@mail.gmail.com>
Subject: Re: [PATCH v3 05/16] mm/page_alloc: unify __alloc_frozen_pages[_nolock]_noprof()
To: sashiko-reviews@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jun 2026 at 16:29, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Spurious allocation failures for ALLOC_NOLOCK on fragmented systems
> --
>
> commit e9001ddaf8c952ebe08e5042f720b09e0b4a5da8
> Author: Brendan Jackman <jackmanb@google.com>
>
> mm/page_alloc: unify __alloc_frozen_pages[_nolock]_noprof()
>
> This commit unifies the core allocator entry points by pulling the ALLOC_NOLOCK
> control up into __alloc_frozen_pages_noprof(). It turns the nolock variant
> into a thin wrapper that just sets the ALLOC_NOLOCK flag and handles
> NUMA_NO_NODE.
>
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index a3ba63c7f9199..8d409d075e3e9 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
>
> [ ... ]
>
> > @@ -5310,9 +5384,9 @@ struct page *__alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order,
> >       fastpath_alloc_flags |= alloc_flags_nofragment(zonelist_zone(ac.preferred_zoneref), gfp);
> >       fastpath_alloc_flags |= alloc_flags_nonblocking(gfp, order) & ALLOC_HIGHATOMIC;
> >
> > -     /* First allocation attempt */
> > +     /* First allocation attempt (or, for nolock, only attempt) */
> >       page = get_page_from_freelist(alloc_gfp, order, fastpath_alloc_flags, &ac);
> > -     if (likely(page))
> > +     if (likely(page) || (alloc_flags & ALLOC_NOLOCK))
> >               goto out;
>
> [Severity: High]
> Could this lead to spurious allocation failures for ALLOC_NOLOCK requests
> on fragmented systems?
>
> In the pre-patch code, alloc_frozen_pages_nolock_noprof() bypassed
> alloc_flags_nofragment(), allowing it to successfully steal pages from
> other migratetypes when its preferred migratetype was empty.

Oh, yep. Given "no functional change intended" this should not set
ALLOC_NOFRAGMENT when ac.alloc_flags has ALLOC_NOLOCK.

(Is this intentional? Do we really want to allow "opportunistic"
allocations, which are very much allowed to fail, to fragment memory?
It doesn't look like this was discussed at when the nolock
functionality was added).
