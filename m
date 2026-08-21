Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DD6493650
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 21:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787349520; cv=none; b=Ic9IpQK2ul7EMroKLuI0+zctVgFXhgVk/OiINqgJx6dK31Or2itgWVZxvVfYIxKM5pbZ1DB4LL+i/ZNSG3mQM7G214TNYVItuUQIHDKJLXrqjB9e0DsR5MtGmMPtbEV77R8rDVeTrsQ13AZHeEv1IAlriiqTBzBD5VSOrzCXSNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787349520; c=relaxed/simple;
	bh=bWAs7O+b95mQ2iU1fvI4SpkPXJ7HBqi8EqgAfuFGTSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NqRBFvYlQl70kNkDaHhR7zweUJjeV6dAUWAxMOKFf5PGaqfSQBzsAMNaf9vy+G72T+uMHQv5x/r70G0u/qx6Lbk8zrrSR8AqvLenZtij84lgRvPC3SS0z4EG+Co9oJDh3fC18guliziiz8lVJIWTkQ5RHhe4xNNT0q7T8RRkH98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eraJLTrV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eraJLTrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787349518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x5oCvJjHG+KHWQpbW0YfBmACK+/TCpr7/YzvSYcluQY=;
	b=eraJLTrVwDZZaIXNs46T4q0dkEyiPfupNGq85kcZhkvF+zJaxJMezqS2mfFkgrhFJC6xu0
	LXqmi+U0bQJNpyJM2OwvfqSN7NUeOMXmIlB56rJwiIYn2N2gOaALhDzUyQGUZTUEeHI+V5
	1IPYclyanF4JRxpT4boiuI6It3d+GPo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-_QjOjjMCOpW1Xc07DdMKZA-1; Fri, 21 Aug 2026 17:58:12 -0400
X-MC-Unique: _QjOjjMCOpW1Xc07DdMKZA-1
X-Mimecast-MFC-AGG-ID: _QjOjjMCOpW1Xc07DdMKZA_1787349492
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e8004d60eso254514485a.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 14:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787349492; x=1787954292;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x5oCvJjHG+KHWQpbW0YfBmACK+/TCpr7/YzvSYcluQY=;
        b=pCd1yca1rRH3ur9BQlV/3IMyLi5BTWTDmkVSE+zYejfSBpsrY3LcKe5f2/dw98+MG5
         YJvQRUAoyzXx2FLb95+DoJUHTR1U1gLYYvEhYXek16rRwMZUJjC/0XQehx6/i2Gr+0gA
         0M+1I5AgELMK0aqEiq15YFyWeWM0/BWqXbUUYjo0beHtyh2Sbq2qWq/ZMJvl1KjiOWAN
         FSmXG5EXOVFx7bbj+57RmtrvWX6U5PDuLGlXhVdqhUZe5Sdn7ja2trPtcMtIT0TuMEGo
         xOaFAVNAq7mIQDSh3ae6207mrX8lV9iEHGzFMdi2X3abQHavKf0s3f0w3GYZidiE3x7U
         5KWw==
X-Gm-Message-State: AFuF++m1YfV//QN6JG2gW39AcepC9FVb4SHof6B/Ta/60uIFCeXhiBes
	9Avx+u416RfoBq17Ssx/h27gDcYHEAAbmSuaFQv2JOhTZ9XD0JDqlhDedWNao4RrgMZFo/yNurV
	hnekiX7oR1SR36AfuUrbDnLxBbcymKCgU8zkw5eO8xc3ZeuPGGrja5LjqgvzFpDCyqH+dQBtFtb
	24ybhUZT3qmXnY2Tjf5JJsqaWkysKd3YQ/Yb1Qw1SYbIQgR+nc6Bx+ng==
X-Gm-Gg: AR+sD12ve8awOw3Rm3ZHuwnL6Um049QFJ5F8euwgkeJ5IpyBzuYjuiOdrYRS2dZOqMv
	168OFjkL2+zrMbfH3xwD0TKR0QLYeUQNpLz8xZGn48DtYfO2nZdfGZEp5Fh3nE8nt+T/R9WsF0p
	ZSv8TD2EV7hDl7YbZLfHYvPokL79stOtfquR8bq2/iIfIo2KLCQAaw6v/GTwKSw8JlzPx4Vp4yx
	fWg3Y3pX95rps998RcyjiapeDwIMEXIBYxkCcJWDyuA8/cnv234VTu0xqnYb6tWqzpTCDvxsMxx
	4apY+vJCPR8x8oGqpOW5/KrGInRKImUTC9cTtZtoQ2tzlwJd8rfMx65hllOsxzBXbW/j1WggxaQ
	nT2/xuARHkdJScShVrMBbmmCvkKNkn3qcaGBtnAZTU0v+
X-Received: by 2002:a05:620a:2414:10b0:934:b6ba:15d5 with SMTP id af79cd13be357-937395a788emr693040185a.39.1787349492283;
        Fri, 21 Aug 2026 14:58:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2414:10b0:934:b6ba:15d5 with SMTP id af79cd13be357-937395a788emr693037485a.39.1787349491650;
        Fri, 21 Aug 2026 14:58:11 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749abeaffsm7948385a.9.2026.08.21.14.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:58:10 -0700 (PDT)
Date: Fri, 21 Aug 2026 17:58:10 -0400
From: Eric Chanudet <echanude@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org
Subject: Re: [PATCH 06/11] memcg: register per-area usage counters in cgroupfs
Message-ID: <aojJo0Lft4IhoEwz@echanude-thinkpadx1carbongen13.rmtusma.csb>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <20260821-cma-memcg-regions-v1-6-d21b165b8440@redhat.com>
 <20260821191710.1C3711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260821191710.1C3711F000E9@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bWZiN4yJbhX6RMDe3tNEn83hsza4kQZ_skfkYy8FBdA_1787349492
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Aug 21, 2026 at 07:17:09PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] CMA pages and memcg charges will leak and trigger a `bad_page()` BUG if `memory_cma_accounting` is disabled at runtime via remount.
> - [Medium] Potential 32-bit integer overflow when calculating CMA memory usage in `memory_cma_current_show`.
> --
> 
> --- Patch [6]: [PATCH 06/11] memcg: register per-area usage counters in cgroupfs ---
> commit 7a745023362168cdad80f7d03d5d5225a5b34c22
> Author: Eric Chanudet <echanude@redhat.com>
> 
> memcg: register per-area usage counters in cgroupfs
> 
> Expose memory.cma.<area>.{current,max} files under each non-root cgroup
> when cgroupfs memory_cma_accounting option is enabled.
> memory.cma.<area>.current reports the cgroup's CMA usage for that area.
> memory.cma.<area>.max is a read-write limit (default: max).
> 
> > diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> > index 3dfc13f31a0c0..39871a7a08a8d 100644
> > --- a/Documentation/admin-guide/cgroup-v2.rst
> > +++ b/Documentation/admin-guide/cgroup-v2.rst
> 
> [ ... ]
> 
> > @@ -1928,6 +1928,21 @@ The following nested keys are defined.
> >  	This setting has no effect if zswap is disabled, and swapping
> >  	is allowed unless memory.swap.max is set to 0.
> >  
> > +  memory.cma.<area>.current
> > +        A read-only single value file which exists on non-root cgroups. <area>
> > +        is the CMA area name (e.g. "reserved" for the default DMA CMA area).
> > +
> > +        The total amount of CMA memory currently charged to the cgroup for the
> > +        given CMA area. Only accounted when memory_cma_accounting is enabled.
> 
> [Severity: High]
> What happens if memory_cma_accounting is disabled at runtime via remount?
> 
> If an administrator mounts cgroupv2 with memory_cma_accounting enabled,
> workloads allocate CMA memory, and then the administrator remounts without
> the option, CGRP_ROOT_MEMORY_CMA_ACCOUNTING is cleared dynamically in
> kernel/cgroup/cgroup.c:apply_cgroup_root_flags().
> 
> When workloads later free their CMA memory, will mem_cgroup_uncharge_cma()
> return early because memcg_accounts_cma() is false? This would bypass the
> memcg uncharge while folio->memcg_data is still set.
> 
> Could this cause the pages to leak and trigger a bad_page BUG trace when
> they hit the buddy allocator?
> 

Same as Patch 4.

> > +
> > +  memory.cma.<area>.max
> > +        A read-write single value file which exists on non-root cgroups. The
> > +        default is "max".
> 
> [ ... ]
> 
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 8eca00d30fc50..f28d610a59ce7 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> 
> [ ... ]
> 
> > @@ -6182,3 +6182,92 @@ void mem_cgroup_show_protected_memory(struct mem_cgroup *memcg)
> >  		K(atomic_long_read(&memcg->memory.children_min_usage)),
> >  		K(atomic_long_read(&memcg->memory.children_low_usage)));
> >  }
> > +
> > +#ifdef CONFIG_CMA
> > +static int memory_cma_current_show(struct seq_file *m, void *v)
> > +{
> > +	struct mem_cgroup *memcg = mem_cgroup_from_seq(m);
> > +	int idx = seq_cft(m)->private;
> > +	unsigned long cur = page_counter_read(&memcg->cma_counters[idx]);
> > +
> > +	seq_printf(m, "%lu\n", cur * PAGE_SIZE);
> 
> [Severity: Medium]
> Could this calculation overflow on 32-bit architectures?
> 
> Both cur and PAGE_SIZE are 32-bit unsigned longs on 32-bit systems. If the
> CMA area usage exceeds 4GB, the multiplication will wrap around before being
> passed to seq_printf().
> 
> Should this value be cast to u64 before multiplying, similar to how it is
> handled in seq_puts_memcg_tunable()?
> 

Yes, it be u64.

> > +
> > +	return 0;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com?part=6
> 

-- 
Eric Chanudet

