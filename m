Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062A5493650
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 21:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787349394; cv=none; b=i7GfHCRbOg6O80PwUp2qumc42Ldqmp6d/8CMi93CggB5CpzLeZEIf1opJxQNp3TBJTY1xRC9aEEYvh3Tp/3pVESD+3u/IjYXgq3iiDiI+IFZjRJTfm3mn9lYiWojByShbAkhdhMsI8rMwXz4L1EgoBvkJUMbEmh8ki+XwXIIPUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787349394; c=relaxed/simple;
	bh=0hI8p30v9uZIBHSWh+cNU6cN1Eu/rmshYLiKb8Zkue4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cRehYV6xwYW5sSJBRAtEfJJpTW4atdPwuG+SLw1EkUp+4WwOfLMcXknhV5Iz9k3Mp+8lsDNFRX5zpBpqE3+1s0zD8obv3M5ahBYX6YncibuZ0Rg2OkGHhJ/QfvizXyR7rCekmz7WK/l5sGW5/gLqzVWwprza+LNhl9bp+zad7tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=byDiJOMj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="byDiJOMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787349391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9cvRNnnz6diZeXE/mz5qkWeRVCtiThgc7rreCUFwDFU=;
	b=byDiJOMjFingM+fdRYLEkPXk6ptzCC5qUSOmoLfbuC6U1K8C3Be0jjHnJC8js6ylVIc/hL
	XDJIUHkgBWg7JfrBVhq5o3asXsp4IoE2gWJmzhsQhZNoP26fT8+6zskGdo7cPBeAgPsQOe
	hsJ8rjkV52LHEP2NmpzMHejSPFFGd+Q=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-WIyy7ReTMxOnc9620joBgw-1; Fri, 21 Aug 2026 17:56:30 -0400
X-MC-Unique: WIyy7ReTMxOnc9620joBgw-1
X-Mimecast-MFC-AGG-ID: WIyy7ReTMxOnc9620joBgw_1787349390
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efad04d884so25187286d6.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 14:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787349390; x=1787954190;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9cvRNnnz6diZeXE/mz5qkWeRVCtiThgc7rreCUFwDFU=;
        b=F1OmwpUpGZxxsBuzGVR8a3MLiDwCx986yiA9k5MhqioPjdDFIwBlqYOKV04fi/WEBK
         WwOaKCpROMYkafZrQ5rGlqzZsn8ahofV6dsv1E05+N4r/h1ep2yG/nccjmLi+5QgQ/JS
         DYSkzS6IX0RM9OGUGcEu7wBynzxSGiQcywCWEXwr/HGdhYrhnlqnRvatUCD0uRGkeqJD
         6XAIwBKp6/JGskkILaaNrM6H1RZxxz8ogExoP0HgRD55NpRIO5iuE7PFeqNYmNdWyurI
         Ht5kT6H/XKlX6kW98/n5N/Atq1MdCSGFvYYR93QjlcScoPV9b1nKysedueUavRU/HTPH
         y6pQ==
X-Gm-Message-State: AFuF++ljnxGiMJDbZ8OJnqXNJDqVRRUvnhdksyrbrUVGrmzFw2xKR6jc
	cR2ODv9pHIzCiR0qxFcOtv4ag7W+dTXKNTzEdj6waOKCe+RYFYMtn7PWB+3zlDGdi6OrxpbNHTn
	oyY8siTAKWkVXsvQCA0P4EJsOb/Ze1g7dOGglqog/nT7LA5E3CWmRhiEAjHpXrpsj5Xbampskwh
	1D64BV703jxFf4/LF4AETK8Axtz9NfacYvPUJeZ4QCK1tShHfoN2bHFQ==
X-Gm-Gg: AR+sD12vxxLoAZo3vfv0LZAFp6NV0juel5uqVGO3djiesrJVZArPUUI1NB1npTBUH41
	QtOUnNMqOKW1u1/xprwjVUhqRxtTKehd+awXAYji5g0ERBl1zpyqDbL+kKSpZyfELSG+Qi2yOh/
	ff2wS9wPmasY1fqcIzxhwTtMa1/mAyWB78ibpiZzd86wfOCVt9wThe/0UCpgW52FCvefGYlBpwc
	041g6sSN+5dHYoTppOhR6dBDsWpce2bug9uP9CKFHYaRVl0TO+/rsLnSS7TRgYRw+YjnBixZIBl
	KbfFo0fQsy02oX5EFR3lnu8F0+7AIA10m83W1V4nkoFiC1UDZ7bAz6qGqKn1jCJmmLhSHedIxQW
	Gt9LdVtgIK5rk7aQr/sOPlzHMKuP03EmL3S//nO7w8AFf
X-Received: by 2002:a05:6214:3284:b0:8ec:cdb2:5e11 with SMTP id 6a1803df08f44-90c80944085mr100181546d6.2.1787349389728;
        Fri, 21 Aug 2026 14:56:29 -0700 (PDT)
X-Received: by 2002:a05:6214:3284:b0:8ec:cdb2:5e11 with SMTP id 6a1803df08f44-90c80944085mr100181106d6.2.1787349389232;
        Fri, 21 Aug 2026 14:56:29 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2a35basm72011986d6.35.2026.08.21.14.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:56:28 -0700 (PDT)
Date: Fri, 21 Aug 2026 17:56:27 -0400
From: Eric Chanudet <echanude@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org
Subject: Re: [PATCH 05/11] mm/cma: charge cma allocation to memcg per area
 counters
Message-ID: <aojA8A_BEOJi5-kl@echanude-thinkpadx1carbongen13.rmtusma.csb>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <20260821-cma-memcg-regions-v1-5-d21b165b8440@redhat.com>
 <20260821192815.319901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260821192815.319901F000E9@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EuQkgIHdX61AoRBVxnib722ctCh0eym7Rpj6x_FMa-c_1787349390
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Aug 21, 2026 at 07:28:14PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] Double memcg charging for HugeTLB CMA allocations causing `VM_BUG_ON_FOLIO` panics.
> - [High] Dynamic reconfiguration of `memory_cma_accounting` leaks charges and crashes the buddy allocator.
> - [Low] trace_cma_alloc_finish() logs a successful error code when the allocation fails due to memcg charging.
> --
> 
> --- Patch [5]: [PATCH 05/11] mm/cma: charge cma allocation to memcg per area counters ---
> commit 2d35f7be0d6e01fd43ca7628f3674cf1cec9ac0b
> Author: Eric Chanudet <echanude@redhat.com>
> 
> mm/cma: charge cma allocation to memcg per area counters
>     
> This commit hooks mem_cgroup_charge_cma() and mem_cgroup_uncharge_cma()
> into the CMA allocation and release paths. It charges pages to the
> current task's cgroup upon successful allocation, and handles uncharging
> and releasing pages if the allocation limit is reached.
> 
> > diff --git a/mm/cma.c b/mm/cma.c
> > index 03f98f6d45a54..03eb3acbd3c75 100644
> > --- a/mm/cma.c
> > +++ b/mm/cma.c
> > @@ -904,6 +904,12 @@ static struct page *__cma_alloc_frozen(struct cma *cma,
> >  		cma_debug_show_areas(cma);
> >  	}
> >  
> > +	if (page && mem_cgroup_charge_cma(page, count, cma)) {
> 
> [Severity: Critical]
> Will this cause a panic for HugeTLB pages backed by CMA?
> 
> HugeTLB utilizes CMA for its pool. When the pool is expanded,
> cma_alloc_frozen_compound() invokes this path, which blindly charges the
> pages and populates folio->memcg_data.
> 
> Later, when a user process faults on the HugeTLB page, alloc_hugetlb_folio()
> distributes the page to the user and charges it again by calling
> mem_cgroup_charge_hugetlb(). This eventually invokes commit_charge(), which
> has this check:
> 
> mm/memcontrol.c:commit_charge() {
>     ...
>     VM_BUG_ON_FOLIO(folio_memcg_charged(folio), folio);
>     folio->memcg_data = (unsigned long)objcg;
>     ...
> }
> 
> Since folio->memcg_data was already set during the CMA allocation, won't this
> trigger the VM_BUG_ON_FOLIO panic?
> 

Indeed, and charging at allocation just won't work for hugepages in CMA.
I'm not sure how to reconcile it. Maybe just leave it accounted by
hugetlb cgroup and memcg as it is until the regular CMA is figured out?

> > +		free_contig_frozen_range(page_to_pfn(page), count);
> > +		cma_clear_bitmap(cma, &cma->ranges[r], page_to_pfn(page), count);
> > +		page = NULL;
> > +	}
> > +
> >  	pr_debug("%s(): returned %p\n", __func__, page);
> >  	trace_cma_alloc_finish(name, page ? page_to_pfn(page) : 0,
> >  			       page, count, align, ret);
> 
> [Severity: Low]
> Does this tracepoint log a success status when charging fails?
> 
> If mem_cgroup_charge_cma() fails, page is set to NULL, but the local variable
> ret is not updated. Since ret was likely set to 0 by a successful
> cma_range_alloc() earlier, trace_cma_alloc_finish() will receive ret = 0.
> 
> Should ret be updated to an error code like -ENOMEM before the tracepoint
> executes?

Yes.

> 
> [ ... ]
> 
> > @@ -997,6 +1003,7 @@ static void __cma_release_frozen(struct cma *cma, struct cma_memrange *cmr,
> >  
> >  	pr_debug("%s(page %p, count %lu)\n", __func__, (void *)pages, count);
> >  
> > +	mem_cgroup_uncharge_cma(pages, count, cma);
> 
> [Severity: High]
> Can this leak charges and crash the buddy allocator if CMA accounting is
> dynamically reconfigured?
> 
> If the system is booted or mounted with memory_cma_accounting, CMA pages
> are charged and folio->memcg_data is set. If the cgroup v2 filesystem is
> later remounted without memory_cma_accounting, mem_cgroup_uncharge_cma()
> will skip the uncharge because of this check:
> 
> mm/memcontrol.c:mem_cgroup_uncharge_cma() {
>     if (mem_cgroup_disabled() || !memcg_accounts_cma())
>         return;
>     ...
> }
> 
> When these pages are returned to the buddy allocator, they will still have
> a populated memcg_data field. The buddy allocator detects this in
> free_pages_prepare() and throws a bad page state:
> 
> mm/page_alloc.c:check_free_page_bad() {
>     ...
>     if (unlikely(page->memcg_data))
>         bad_reason = "page still charged to cgroup";
>     ...
> }
> 
> Should the uncharge path rely on the object's state (checking if
> folio->memcg_data is non-NULL) rather than the global configuration flag?
> 

Same as in Patch 4.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com?part=5
> 

-- 
Eric Chanudet

