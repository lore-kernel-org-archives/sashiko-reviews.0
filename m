Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA86C4218A5
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 17:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818161; cv=none; b=fnqVC5OfLdCehZkaGPHia8Y00QVXAPklyf6UuSVNWxTlOeub/SqMcjyCCWvs1RogRo1i52E/RoqAWj4nPGUlolsCTCvacqStTyH5eQ8lQGnG+ataAkOnjNNWkLXWkSLoDixjCDhMQAYdWOGrudPx05xgRoVqtSiCxziCJl9mdbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818161; c=relaxed/simple;
	bh=wOOSXtPOss3KYJKiQJs413TY6NCN4U0S+PNwpjBi3x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dKEmfoeYCtO1zjmx9H5/2Ribpsco08ufJFvOwpTPvpuaizvrKNlmO9smpJNpqKS2RHVn1dga0L3qSIlOi0ksPSX+SuW8Kek3kYb2yCQPefoiT4uW7KwxjxF8EfDPredow5FPGwRPSyPg/waZUpVbeAuthMq79GQVnBEDgrPhZCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dwMC/4qM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dwMC/4qM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779818156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrUF6sV63Vt+zYpMatohraAaEIkqurFxuxajjINtfk8=;
	b=dwMC/4qMwh7LTs7Z+mJ0rvuCSgTC0QmWReLT+7OSZrUIt6dJ3vsVBoo4dOpIP3JeeOacRo
	lE1QvtzSMgBkmUh+RqOQngJZrN5rE2LrnnAhXeInQeWIdnXBS/6Jb7YbPJrGaPYQchYYBj
	g2YCJIs/g3EQGVtpE13Vm4SZNhsUbOI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-02GTWN6vNfq4A_CILS7Y5Q-1; Tue, 26 May 2026 13:55:55 -0400
X-MC-Unique: 02GTWN6vNfq4A_CILS7Y5Q-1
X-Mimecast-MFC-AGG-ID: 02GTWN6vNfq4A_CILS7Y5Q_1779818154
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8cc01da8fbeso51722186d6.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 10:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818154; x=1780422954;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xrUF6sV63Vt+zYpMatohraAaEIkqurFxuxajjINtfk8=;
        b=YjmhBbtSMlI+MqkBj5V91ADi+rbnag200tbukU7ZOV7j36CcB3tcNY0nWdaClEYVrv
         3re/4Obh/l8AdmX1Js+yWJuWszg5K9DgUCUU/FNl+DvWWAxwALe4rSqc8s6w2WpzVXFD
         ZqnV247XyBOll2s1yZxTIHfVbYJfMcaA/at5FINAH/iFPFag/wJmY+LC70PH76yFQcxQ
         zK2vACVW61j9cuiiQSh2KwxJ9RPFsvA7rsVvimxNSokZFxtu4m7NhfpV4IU8yMoO8L6G
         LFCADQGAx7sFCEsV7l+uozI73QgNiCUXYBbKyFVV89wgw7IXGY/u+XDByY1RyTg6eeKC
         Wh9w==
X-Gm-Message-State: AOJu0Yxd7/sWAEhgJXxlUJryOZ1Obg6cj5YbMOYg86umcufhwsKgm5MN
	C/+A0J4SEflEIC9RgX/zECuyN8jxvmtiXebdIq1icJ1/ikGgao7N0+GVtz3jf802CB1LTF0WFuW
	w2osC6i4oPo8KOPTgpKJ+GIj/Ge+l+mb5kXM6S0D8EiTlVz4kHtznxJO1F8MTEi86/VyJCZSPdV
	eNAZ4pqK6FvbO5nqFDq4GjQPKlGfzzOzU3yl+nfCBejiVU+BK20ttTzQ==
X-Gm-Gg: Acq92OEQ3xMP9wlF58Cjfr59gZ6nZVVYqPWpaPvK1X6cVXwaGZiKoG01qlN6Txq2TM9
	y+PP7FM/uCaPpswghkSzXaQkLq6JOirFHT3XX9T1wV1REUb2iB+8oZg3FHi2sTDMh5p35cRbRLR
	mgRVXLh6A516ECbgmIYbxD9C5MiFmgwvVJx1fZEm5T9Md3V6pJyvEmuUy9cirNjpNBBZ8r1KeQI
	IJydZY5D95ZVRvwuKmW6hiCg+K+OWyfPS5lA1Yu6HeFIkWOwQJCyaOcPrppFkEzqjfpj6vmFGiL
	c8nYlmG2ToyGhbVkE50NyscvqMhJWj73pTIykKpbTLIaulZKhqPOx3FKM8jcriC6iCr9DaOrSzn
	bvcofha9K3cc/y7Zyn0EsmgHtfBVCS6pAW6jaS1qMtvij293Ddp8mOW+N3GhGjxFZ7w==
X-Received: by 2002:a05:6214:5013:b0:8cc:611f:1977 with SMTP id 6a1803df08f44-8cc7b5b416amr187851816d6.33.1779818154458;
        Tue, 26 May 2026 10:55:54 -0700 (PDT)
X-Received: by 2002:a05:6214:5013:b0:8cc:611f:1977 with SMTP id 6a1803df08f44-8cc7b5b416amr187851106d6.33.1779818153777;
        Tue, 26 May 2026 10:55:53 -0700 (PDT)
Received: from localhost (pool-100-17-21-205.bstnma.fios.verizon.net. [100.17.21.205])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc8131fc67sm150513136d6.45.2026.05.26.10.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:55:53 -0700 (PDT)
Date: Tue, 26 May 2026 13:55:52 -0400
From: Eric Chanudet <echanude@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, hannes@cmpxchg.org, tj@kernel.org
Subject: Re: [PATCH v2 1/2] mm/memcontrol: add dmem charge/uncharge functions
Message-ID: <ahXa4047SdZDQYre@x1nano>
References: <20260519-cgroup-dmem-memcg-double-charge-v2-1-db4d1407062b@redhat.com>
 <20260519162815.299F3C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260519162815.299F3C2BCB8@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3_TzTiZPdjFroSR69ZwgtV3nR6_NA9GpKvsKcPNXSsg_1779818154
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, May 19, 2026 at 04:28:14PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Dmem allocations do not record the charged memcg and drop the css reference immediately, causing accounting leaks and counter underflows if the cgroup hierarchy changes before uncharge.
> - [High] `mem_cgroup_dmem_charge()` incorrectly returns `false` (failure) for the root cgroup, breaking all dmem pool allocations in the root cgroup.
> --
> 
> commit a0227a830265ace1f22738cf307c5a7400c32ba4
> Author: Eric Chanudet <echanude@redhat.com>
> 
> mm/memcontrol: add dmem charge/uncharge functions
> 
> This commit introduces mem_cgroup_dmem_charge() and mem_cgroup_dmem_uncharge() 
> to allow dmem pool allocations to optionally be double-charged against the 
> memory controller. It dynamically resolves the effective memory css from the 
> provided cgroup for the charge and adds a MEMCG_DMEM stat counter.
> 
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index c03d4787d4668..91a7ac16b6eac 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> 
> [ ... ]
> 
> > @@ -5909,6 +5913,67 @@ static struct cftype zswap_files[] = {
> >  };
> >  #endif /* CONFIG_ZSWAP */
> >  
> > +#ifdef CONFIG_CGROUP_DMEM
> > +/**
> > + * mem_cgroup_dmem_charge - charge memcg for a dmem pool allocation
> > + * @cgrp: cgroup of the dmem pool
> > + * @nr_pages: number of pages to charge
> > + * @gfp_mask: reclaim mode
> > + *
> > + * Charges @nr_pages to @memcg. Returns %true if the charge fit within
> > + * @memcg's configured limit, %false if it doesn't.
> > + */
> > +bool mem_cgroup_dmem_charge(struct cgroup *cgrp, unsigned int nr_pages,
> > +			    gfp_t gfp_mask)
> > +{
> > +	struct cgroup_subsys_state *mem_css;
> > +	struct mem_cgroup *memcg;
> > +
> > +	/* CGROUP_DMEM and MEMCG guarantees this cannot be NULL. */
> > +	mem_css = cgroup_get_e_css(cgrp, &memory_cgrp_subsys);
> > +
> > +	/* Use the memcg, if any, of the dmem cgroup. */
> > +	memcg = mem_cgroup_from_css(mem_css);
> > +	if (!memcg || mem_cgroup_is_root(memcg)) {
> > +		css_put(mem_css);
> > +		return false;
> 
> [Severity: High]
> Should this return true instead of false?
> 
> The root cgroup doesn't have memory limits, and the documentation states 
> the function returns true if the charge fits within the configured limit. 
> Returning false here appears to signal an allocation failure to the caller, 
> which might break all dmem pool allocations for processes running in the 
> root cgroup or on systems where the memory controller is disabled.
> 

Will attend in v3.
memcg cannot be NULL in this case, the test can be dropped.
mem_cgroup_is_root() needs to return true since the root cgroup has no
limit.

> > +	}
> > +
> > +	if (try_charge_memcg(memcg, gfp_mask, nr_pages)) {
> > +		css_put(mem_css);
> > +		return false;
> > +	}
> > +
> > +	mod_memcg_state(memcg, MEMCG_DMEM, nr_pages);
> > +	css_put(mem_css);
> > +	return true;
> > +}
> > +
> > +/**
> > + * mem_cgroup_dmem_uncharge - uncharge memcg from a dmem pool allocation
> > + * @cgrp: cgroup of the dmem pool
> > + * @nr_pages: number of pages to uncharge
> > + */
> > +void mem_cgroup_dmem_uncharge(struct cgroup *cgrp, unsigned int nr_pages)
> > +{
> > +	struct cgroup_subsys_state *mem_css;
> > +	struct mem_cgroup *memcg;
> > +
> > +	/* CGROUP_DMEM and MEMCG guarantees this cannot be NULL. */
> > +	mem_css = cgroup_get_e_css(cgrp, &memory_cgrp_subsys);
> > +
> > +	memcg = mem_cgroup_from_css(mem_css);
> 
> [Severity: High]
> Is it safe to re-resolve the memcg dynamically during uncharge without 
> holding a reference to the originally charged css?
> 
> If the cgroup hierarchy's memory controller state changes between charge 
> and uncharge (for instance, if it is disabled via cgroup.subtree_control), 
> the original memory css could be offlined. 
> 
> The cgroup_get_e_css() lookup here would then traverse the hierarchy and 
> resolve to a different, still-online ancestor cgroup. Could this cause the 
> new ancestor's counters to underflow while the originally charged memcg 
> permanently leaks the charge?
> 
> Would it be safer for the caller to store a pointer to the charged memcg 
> and pass it directly to the uncharge function?

That doesn't seem right. Since depends_on is set for cgrp_memory and the
pool holds a ref to the dmem css until uncharge, cgroup_get_e_css() will
always resolve to the same memory css.

> 
> > +	if (!memcg || mem_cgroup_is_root(memcg)) {
> > +		css_put(mem_css);
> > +		return;
> > +	}
> > +
> > +	mod_memcg_state(memcg, MEMCG_DMEM, -nr_pages);
> > +	refill_stock(memcg, nr_pages);
> > +	css_put(mem_css);
> > +}
> > +#endif /* CONFIG_CGROUP_DMEM */
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com?part=1
> 

-- 
Eric Chanudet

