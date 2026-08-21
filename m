Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3093515DB
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 21:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787347189; cv=none; b=cFXtO6gZLSSMJh/FOLE7b9ZVCm1jauh4ejpFTAABi6KjOZEVidQit35FoEWoZ/Dn1S830a9RTisOJ1oGjjn4yV3LE5azVCMB/N/BnA1WOvj0V3gnX2rmirQFN+JkOcB4hgpvV6JjsgM7WmVPJJBWTJLN8IwrNEzpBEiUqZ8T5Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787347189; c=relaxed/simple;
	bh=KyKjPDR8qlscNUvvyR6exInxhXg7aQCj7EFZsVsf5wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=C1S5M8/s0Pbn4+IcrCafYu7+2wGPrmQOwF0LPBLAkpcqjRDw7lW8uWTCDCnRKPimpYUiDBN2tYiNNDcYBh6GcAnK2QxWDE9d5B5X3FuuP9VwfX5Z3dC9q7Si3InRBLA2FkxYCtEFFwYZxj+fR/w1zMiV/XgUTAk91Lnhd2fEopM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WhN62u2X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WhN62u2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787347187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+NYC2YRw3/+nDOqa34mJMdS2uK4INQDWYOdXkRVQqI4=;
	b=WhN62u2XZf1lqZUB5eaRyARPvOSUo4F+tOJPATHisuOezbUZDqAPKUQxIaTv8ho4Ol/xEm
	QxbiHu7TxnhbSL3lGGXgBjEiHt9tYCKRuw5bfw4ExA8RWq47L9Ip3aAIPIcauujGgDAa0r
	JJscu5pAcB7s9RdyoRXlQSek0d03ECs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-9Mw9JbotMze5WJ91dGtDUw-1; Fri, 21 Aug 2026 17:19:41 -0400
X-MC-Unique: 9Mw9JbotMze5WJ91dGtDUw-1
X-Mimecast-MFC-AGG-ID: 9Mw9JbotMze5WJ91dGtDUw_1787347181
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so11417296d6.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 14:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787347180; x=1787951980;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+NYC2YRw3/+nDOqa34mJMdS2uK4INQDWYOdXkRVQqI4=;
        b=QAdAs2iLfF6PgxGVdTmQI0ZVM75bEaO6+rfiIEsP+BciQ580CBoDu9ADfuForWASpp
         bYvgKScfe1k65W+RQqFY87fPOjGa1RB1Bax7ovYgmP329aJ0vHWFF4gahq38FhP/T42p
         8i1/+yMjMZYG13NXO2kfWWARmy08ttqu75KijhNZ35qsNy0lT9/I+GP0JXpxzljcRCoa
         y6/D/ugPRhLrlz2Rrds6LNcYrF4KqHM/MJFCy9iN6c3fX4mpgykbpgDsr+CBH6IfvaWw
         GtLC+o0cYT8tcz6q8sIVMaQdLHokAuP+dSSxharRJnAaKvT5njuK8CD15HFdZW5pzPUk
         RK9w==
X-Gm-Message-State: AFuF++ktZQmthbkXuZX5AD384Fxy8/pUNcbfri4t2wbgZ01WBrDFHKUH
	l3gpQRFVnpaK4AjRfNrriv1hj7LsEUvUa2bW/X6RC8/cNOAO5To3v8wU4rqArXlFKSnEgy+nUTg
	TFnVWVTbp68EifAZ5EVP4Qzn8suBVgzfo795XHiAmuaQ0IFGv8BRsYJJ2T+BaOr/WgnHcfcpdCr
	n7v7/xuJjAyfH8GPu6pLC3IEWqQ8V1oHzUa0QiQWoCPqkm36Ym/p6hHw==
X-Gm-Gg: AR+sD125Ji7Yy4SscqOC7/YNsSETF+4dpOxaI7yHiviEiwdEG0LinUd8n1EB2u9L+1T
	sLasubaUXXAsW80rFTumqNyVlgtLTfnH7B/HFsMLkQMwRqbiaBd/pedPBX/k7Q39IkCM6ovQ17X
	ypoQy1c/CCPMj7zCfQemKPBj0iwe5tZAr3ypdbTiI5unk75lNovcePQe9UamchV1A93uLHJNSbJ
	Mo287EF4/HizUI/MNVYZoSH3vSuT20OoxtygjXbVV0tC0CHpKCd6fk8jfRItshZ5HQM9mFt7vkb
	186XDlHUXZm5Np6DwmD5u7MI2s4FQHiTu+ObZvCl2wJcbgoFT1Z+P+bkiSUa9qg+Av5+1fkpqZt
	viKRLr9sOGHCv9cs6sKvEo3bS8q+N+2YYP6Jtk+Upf3ds
X-Received: by 2002:a05:6214:3992:b0:90a:8cb1:bb5f with SMTP id 6a1803df08f44-90c80db116emr96126016d6.24.1787347180575;
        Fri, 21 Aug 2026 14:19:40 -0700 (PDT)
X-Received: by 2002:a05:6214:3992:b0:90a:8cb1:bb5f with SMTP id 6a1803df08f44-90c80db116emr96125386d6.24.1787347180065;
        Fri, 21 Aug 2026 14:19:40 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5edb3bf8sm73894116d6.4.2026.08.21.14.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:19:39 -0700 (PDT)
Date: Fri, 21 Aug 2026 17:19:38 -0400
From: Eric Chanudet <echanude@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com
Subject: Re: [PATCH 04/11] memcg: add cma charge/uncharge functions for area
 counters
Message-ID: <aoi_OHVZjsY9a9VV@echanude-thinkpadx1carbongen13.rmtusma.csb>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <20260821-cma-memcg-regions-v1-4-d21b165b8440@redhat.com>
 <20260821192116.B6DEC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260821192116.B6DEC1F000E9@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: irAfAOPyO-N_xWcS4xzz2Uq84QV4ddKSxXh3KSJkd0Q_1787347181
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Aug 21, 2026 at 07:21:16PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Dynamically disabling memory_cma_accounting via cgroupfs remount prevents previously charged CMA pages from being uncharged, leading to permanent resource leaks and buddy allocator corruption.
> - [High] Hardcoded GFP_KERNEL strips caller allocation constraints, causing unwanted memcg OOM kills and warnings.
> --
> 
> --- Patch [4]: [PATCH 04/11] memcg: add cma charge/uncharge functions for area counters ---
> commit 637000e435d7ad7a20a55418ada4d77115a47082
> Author: Eric Chanudet <echanude@redhat.com>
> 
> memcg: add cma charge/uncharge functions for area counters
> 
> Introduce mem_cgroup_charge_cma() and mem_cgroup_uncharge_cma() to
> account CMA allocations under memcg when memory_cma_accounting is
> enabled in cgroupfs. memcg counters to account for allocation in each
> CMA area are kcalloc'd in mem_cgroup_alloc() and added to the
> page-counter hierarchy in mem_cgroup_css_alloc().
> 
> [ ... ]
> 
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 6dc4888a90f3f..8eca00d30fc50 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> 
> [ ... ]
> 
> > @@ -5213,6 +5233,102 @@ int mem_cgroup_swapin_charge_folio(struct folio *folio, unsigned short id,
> >  	return ret;
> >  }
> >  
> > +#ifdef CONFIG_CMA
> > +static bool memcg_accounts_cma(void)
> > +{
> > +	return cgrp_dfl_root.flags & CGRP_ROOT_MEMORY_CMA_ACCOUNTING;
> > +}
> > +
> > +int mem_cgroup_charge_cma(struct page *page, unsigned long count,
> > +			  struct cma *cma)
> > +{
> > +	struct page_counter *counter, *fail;
> > +	struct obj_cgroup *objcg;
> > +	struct mem_cgroup *memcg;
> > +	unsigned int i;
> > +	int rc = 0;
> > +
> > +	if (mem_cgroup_disabled() || !memcg_accounts_cma())
> > +		return 0;
> > +
> > +	memcg = get_mem_cgroup_from_current();
> > +	if (!memcg)
> > +		return 0;
> > +
> > +	if (mem_cgroup_is_root(memcg))
> > +		goto cgroup_put;
> > +
> > +	rc = try_charge_memcg(memcg, GFP_KERNEL, count);
> 
> [Severity: High]
> Can this hardcoded GFP_KERNEL cause unwanted memcg OOM kills and warnings? By
> stripping the caller's allocation constraints, if the memcg is at its limit and
> the caller requested no warnings or retry constraints, try_charge_memcg() could
> invoke the memcg OOM killer and print allocation failure warnings.
> 
> Is it possible to pass the caller's gfp_t mask to this routine instead of
> hardcoding GFP_KERNEL?
> 

Yes, charge_cma should pass gfp. I don't think CMA allocs will have
other flags that affect try_charge_memcg for now, but still.

> > +	if (rc)
> > +		goto cgroup_put;
> > +
> > +	counter = &memcg->cma_counters[cma_area_index(cma)];
> > +	if (!page_counter_try_charge(counter, count, &fail)) {
> > +		refill_stock(memcg, count);
> > +		rc = -ENOMEM;
> > +		goto cgroup_put;
> > +	}
> > +
> > +	objcg = get_obj_cgroup_from_memcg(memcg);
> > +	if (folio_test_large(page_folio(page))) {
> > +		commit_charge(page_folio(page), objcg);
> > +	} else {
> > +		obj_cgroup_get_many(objcg, count - 1);
> > +		for (i = 0; i < count; i++)
> > +			commit_charge(page_folio(page + i), objcg);
> > +	}
> > +
> > +cgroup_put:
> > +	mem_cgroup_put(memcg);
> > +	return rc;
> > +}
> > +
> > +void mem_cgroup_uncharge_cma(struct page *page, unsigned long count,
> > +			     struct cma *cma)
> > +{
> > +	struct page_counter *counter;
> > +	struct obj_cgroup *objcg;
> > +	struct mem_cgroup *memcg;
> > +	struct folio *folio;
> > +	unsigned int i;
> > +
> > +	if (mem_cgroup_disabled() || !memcg_accounts_cma())
> > +		return;
> 
> [Severity: High]
> Can dynamically disabling memory_cma_accounting via cgroupfs remount cause
> permanent resource leaks and buddy allocator corruption here? 
> 

It does. folio->memcg_data/objcg should be checked instead.

> If a CMA allocation is charged while memory_cma_accounting is enabled, and a
> privileged user later remounts cgroup2 without specifying the
> memory_cma_accounting option, memcg_accounts_cma() will evaluate to false. 
> 
> This early return would skip the uncharge and leave folio->memcg_data
> populated. When the pages are returned to the buddy allocator, wouldn't
> __free_pages_prepare() detect the non-zero memcg_data and fire a bad_page()
> warning, permanently leaking the cgroup and cma_counters?
> 
> > +
> > +	/*
> > +	 * Get the objcg from the first page.
> > +	 * page_objcg() expects MEMCG_DATA_KMEM, but for CMA we used
> > +	 * commit_charge() which sets folio->memcg_data = objcg
> > +	 * without flags, so we cannot use it.
> > +	 */
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com?part=4
> 

-- 
Eric Chanudet

