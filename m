Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201010;
	b=417TVfiUSqyj1AClJcjnTkniOivFwNj25mZAJwy2Ch1uvLevm2GXmDayGPcp4rdFSAhC
	 oYGW0jpYrLDxV7yjOD5bGIvYXH8bu3m26ecGxwnL3pxSUmlLp4SaDEv4wk8nbnrYQwidQ
	 bzan4QQzrdOiZAZk0KuTXxrwV3V++C8MkVJKflKJMwYz6zjKHdgoKPH84DuIojQNSDSd9
	 dzg2y/bfyVlz+P9IQ9ZwNG6SNJxtM9ortHHeHv8SScsSMCkTXXIe+uj5JzFKV7AOFozxd
	 sowDLkSJ5QPDpiAgQxbAIiK9jEKQ+sheAmhT6ZkVVfM1CKHhQOW01gIBIcS+WWL3kAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer;
	bh=CO2FmI+t47mxhoA5B32c/6+xEdoEj1zDOKWg0tAGKfI=;
	b=oDY0Rv5eC1ANUCZbAGxMM/VOMXYwGll3MiSVQ5fpSH+RO5JyNJ1y6naqi2S/FHO2mkZS
	 YjQdaiW9Be3yKNpwkwJroOoBr8x1B85uwT/LEXyKEU/am5d5F8+lH8Kny+iJXaGhbkC2F
	 ro0TycB1P8+B8cJ/Udqppnosh81kLEExXTV21dipnEe3BwKpcXNqaL0K+wcHK7bNdRHOY
	 lgMtI5NxTFw1m4fm4TI0gcHc6r+HqbmrN6iw/Op2N509Roj1noaJfM7Is9HPbLUYEszLz
	 SiGhBNHhIVvNh/r++F/xE6huCbEuxyBkfSrywDGzxW3i/EkWjeA+x3zBw2GoRbypQzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=AGhJLU+t;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF59C60A2634
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 18:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF59C60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=AGhJLU+t
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91ccfb88e4dso13779196d6.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 10:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795201001; x=1795805801; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CO2FmI+t47mxhoA5B32c/6+xEdoEj1zDOKWg0tAGKfI=;
        b=AGhJLU+tNmaBotefAwAsP/4JhVGecbMpzeOCmKe1TyUr3nxYH8sgGzSTqekCalW0+F
         V9ELHmyXJSqLYJwz/O0ceEbCq2dsbth2v4PumuK8PEysxTghygmtBP1ClDUpzheUxr3s
         9kuMY1tr7tmafowBZ1xSVOLIyBiNKl8S+GsZ50wTuONd0S09/uKoCW0Sw3wKDtCZw9VD
         /7eUIqPscUDuC6hlZqdKzxUu6zsbBSt9eSmDE7gHsj80s0l/yZillsfJlf7xmWKrST/d
         iPLxUYHTlkBgtlieViNvWCJt2C+F7polVCN7pXr6ylG38hDyF1YiBngd8IWsRvUMcG3H
         ImAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201001; x=1795805801;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CO2FmI+t47mxhoA5B32c/6+xEdoEj1zDOKWg0tAGKfI=;
        b=LYlJdyYSCBEL42Bm8KPjZU8VIP0nWqr5ty7S0JAUbWnWwVCdhsbJLfjQUjSgSKGvKf
         HsPK6f0/ZDTzQ/idmJGutlQK0fhX2J3Xy1Tq9UfyTQLE7B5Sx9rDo8kSCAO/tFo4Lgt+
         qNicoaPqD+n/SpBuxf6x0q7rBukjUnkK5IpqlEXnJNR6y0RPKWHyIAGTUVnwJ7n7W7Po
         V9zEJdLE2rvNpyu7xw8Hx55skvpIj2E2o0nVtFS6eclNDmVLZ275LxL0G6IXwtYjlyAu
         5ipXUhOQ7i+UHtChe/phVgqEJ5RzUdQvH+neE1mZu92QfkEHHIMEljNQZCd20xA862wO
         SJWg==
X-Gm-Message-State: APuU4Z9dFNjfm5pTGhVBtRONdVhIiktwQW9rneJoUXrT0K5/yM1RZrkt
	Rz0rjJKKRcp6qX2O7K4et8NdQuXKpmxmzxfseXtk3xKSh+6yEQ1lo8tEVjwvQdlRd7Q=
X-Gm-Gg: AZFdTZcrxZqIakL4Abo89DZUNWm9lhan9fP8BMPDeH0Dxp8Mp0z+XYxiLD3RtC53w1n
	HZQUw4B4QtMZmDN7Mb7AF7vp/9YBgT64w/soN1Qfu4n5R3aqsqnr1kDmDXBc21iOZeadITCC6Oc
	yiXkPeHblFmErbcWPcWz2n/wJf5XL+nw341Dwnki+kJNhzQe6o/ajEgpg2jVK/eOmt513gWr0Cx
	622efB9N3blJP4QVaynLwE/3ADLEvWp5XNAsQKKYPZ0no6QgFSV7DsIMJMC9boogfTYWrVJ4SKV
	dqWlUoc578i2ojHisAKqFCybEnFuIIE/kILt2DUcEYscwDlZX171OVwXGgQxbYuhge/H3FSYe0q
	00b/ixPxueirqzfehmj81MV1SI6IBOgvcL77DdUW8IQzajfS+FhzOQQKt4kD7Ibil/kstRJcE+i
	vLmoPOotj+fsCqnsbv09X13Xh+ILQiMm3FeLKbsC7/oz0F3o+CyLcO5XYyFXTBNbW13pQal+tpj
	rH45BwB5ioqcaMTK21CfabG7ECFDTtUEbKnGyq5Z3T1dZTkMKubobEU75kfNGks/vCnhahNjwhX
	rUZnB3Ws9X0wlUbXF2yvA83JhDgTZ4IiV/fhc4JW5VY1LKBcq5ZxYl/8cAQnJ8H7WK+ijSKVihM
	jAQzRtNw=
X-Received: by 2002:a05:6214:320f:b0:921:3541:ed1a with SMTP id 6a1803df08f44-9213541f3eemr56576466d6.32.1795201000560;
        Fri, 20 Nov 2026 10:56:40 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921366d853esm26687146d6.27.2026.11.20.10.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:56:40 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 54/60] mm/migrate: route explicit NUMA migration to
 private nodes
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: sashiko-reviews@lists.linux.dev
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Oscar Salvador <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Matthew Brost <matthew.brost@intel.com>, Byungchul Park <byungchul@sk.com>, 
 Alistair Popple <apopple@nvidia.com>, SJ Park <sj@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, Kees Cook <kees@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Michal Hocko <mhocko@kernel.org>, David Rientjes <rientjes@google.com>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Pedro Falcato <pfalcato@suse.de>, 
 Jann Horn <jannh@google.com>, Chris Li <chrisl@kernel.org>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
 Youngjun Park <youngjun.park@lge.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>, 
 Tejun Heo <tj@kernel.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
 linux-cxl@vger.kernel.org, damon@lists.linux.dev, nvdimm@lists.linux.dev
In-Reply-To: <sashiko-outbox-225861@kernel.org>
References: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
 <20261120-private_nodes_v6-v1-54-74f5f9a115c2@gourry.net>
 <sashiko-outbox-225861@kernel.org>
Date: Fri, 20 Nov 2026 13:56:34 -0500
Message-Id: <179520099481.412063.3035407964761903218.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-20 18:42 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] mm/migrate: call to undeclared __folio_alloc_flags() in
>   alloc_migration_target()
> --
> 
> commit ca3cf1708bab40e7c2c443ad00cbc882e2163cee
> Author: Gregory Price (Meta) <gourry@gourry.net>
> 
> mm/migrate: route explicit NUMA migration to private nodes
> 
> This commit routes move_pages(2) and migrate_pages(2) allocations for
> N_MEMORY_MEMPOLICY private destination nodes through the node's private
> zonelist by passing ALLOC_ZONELIST_PRIVATE via migration_target_control.
> 
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index 6791834f14fe1..eda961d43df0e 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -2250,6 +2250,9 @@ struct folio *alloc_migration_target(struct folio *src, unsigned long private)
> >  	if (is_highmem_idx(zidx) || zidx == ZONE_MOVABLE)
> >  		gfp_mask |= __GFP_HIGHMEM;
> >  
> > +	if (mtc->alloc_flags)
> > +		return __folio_alloc_flags(gfp_mask, order, nid, mtc->nmask,
> > +					   mtc->alloc_flags);
> >  	return __folio_alloc(gfp_mask, order, nid, mtc->nmask);
> >  }
> 
> [Severity: High]
> Where is __folio_alloc_flags() declared?  Neither include/linux/gfp.h nor
> mm/page_alloc.c defines __folio_alloc_flags() or
> __folio_alloc_flags_noprof(), so building mm/migrate.c with
> CONFIG_MIGRATION=y fails with an implicit function declaration error.
>

b4 dropped a commit on me when i made the prep branch because it
it was tagged Author: Brendan Jackman and I filtered on myself.

this commit should have immediately preceded this one:

https://lore.kernel.org/linux-mm/20260923211041.3127588-4-gourry@gourry.net/

the branch in the cover letter has everything

I will respin this again, but i'll address the sashiko reports and
let this sit for a bit.  The first 2 chunks are still largely
reviewable.

-- 
~Gregory

