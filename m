Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200119;
	b=JdRnx0b3z7McmDrBKVKbkUqNoWWXmKIssf4CTbCKKnhQUlBhb1/C+o0fuCBeTGDDb2L+
	 CJjzTMmXJPeSLIojckFSwKX1GkHG14VViYP/uwum9cAPQJgBJcDykIHlummq8ZkL4xo4w
	 xbQIkUF6fkEx0jmPC1HOIqt3QmLodLJEFBFCwvkqFFMKBN9b7V//TUamZh2m+NdSuYrnA
	 XQ7zQ3CUKFD5fEqWsdoDoXxEb6Md8torO9JWWmIehaGt/o4QJrFd9/JqNip5qKRgf2vxm
	 Cl3F0DehxIc7OW7fngcWLHb3HeJV4hNaT3C9UVn0hWGv1RRhykzv9yoOKPfsZJXH/cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer;
	bh=ZZVKFrUy8TyPqGvyWghVYdubKdFhARMdxJahZ4dEGHE=;
	b=bTv/0Lt5h1p1jQStgKWmsQU8abpnUZpTaFOqKTFMkE6jrkm92ZYMXMyJATzBsU2V3XiD
	 OwCwDNPGENttjfAuF0NhkoxrdzMpq78W0ok7hCSzkrUQmRK3QBmJw+M9t/lp7Wt/cGXEp
	 9uRHd6ZrvcY1CRof65XVVvAcnF6TRJxSN4+ibhTfzlvP7CAn1S6Znq6eKcAX3drs5yKvO
	 Ov+m/J2KxB+06PjtgAGbCmb4+1+WDNjw3TrkJv4wFP/eUcRFy7yZyxm/m6kLV5iHzicl2
	 RcWmDGe1s1KumLvAFBhTbDIyNoO2CpZFW8x9HRjozFow2e/ppDEYQBwD+cp0JBDG2Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=S85FuChe;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193D860A2629
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 18:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 193D860A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=S85FuChe
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91e7af9a67fso8491506d6.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 10:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795200117; x=1795804917; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZZVKFrUy8TyPqGvyWghVYdubKdFhARMdxJahZ4dEGHE=;
        b=S85FuChedWCSpx/4vvUIgmAvfPfZ9YCrPEfHA3jgJRHFW4tsKpklFtQZ/3k5lBLcD3
         Rwnod4+lZMuNQHGt49eKI6RZpRK2Abk6LQIJ1hOZqk8ZUj4ZBhX0ZwmIs/ZNd5dti70H
         tWf/qYyIgzHJ7zhlZYlRz8Xz3JlERKfjNIiKJhPKG8yTWNxP3U4ZTam+KbqbBJdisQc3
         RE3m/dizk/8uE4dXCfwJyouEVAHbrQIUII/OHTg8xKZUANYLGTdQFR8CQ39umhedHILK
         JwnmI65vRuX2MWZi//NR5w6s7ice7kSDh5dA9GfZxFIaGxtpMKu3MOVt+lLQBggHJMGG
         Oesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200117; x=1795804917;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZVKFrUy8TyPqGvyWghVYdubKdFhARMdxJahZ4dEGHE=;
        b=Rh7WB/L2N4SxGD3D5zJXBSB8I9uw6QblxcXD1/g7jalvgZo1x7vBdq2Jeg7Fr/4re9
         EUhwMvvsbQhAefNXTH+hNjOvLZa69vawxUUn3AIIEVjR9BUge4B0RPFl+q0RuXStPFZ8
         LUYcs3B/rr8TRRpShKdZhttLPZlnfsetyW0nngKfOQHYhOpojrR6OrCCGLo6exEO5WeP
         UQx3WzX3AANla7wlFGScH7eIeEPFlLGTdDJz/U1e5RND2j5T2rQloSXzpiiqyxkqiag8
         9Kuq4D92l4n1VE+/KfjhpVvC5WvSE8w8AspnyusRdpV7og62vJ0NHlqcaMnLsxrRmil8
         763Q==
X-Gm-Message-State: APuU4Z++b/gfBsDQMOGEiNghJLYI1VnpzGH1WVw1pGGTcCFPpXfoRiK8
	llRsjChTv+HaVetyn6UlrmrZAdCT5r04c/WAhvrJ9HSz8BO9bMT0N/SQbKemodP2ZM4=
X-Gm-Gg: AZFdTZffp+VvWYdgX3HMdgxqtKyhUAYHr4V/Ul9XTIeChZVTO9TqZgearX4V23iH2KC
	9ttlUoo0oAarcfwpdw5jmK0OhUOAPy2mJbgIL2DoiQ/jAc8O3RmSkDYJQf07cTMAyi5idTIxb7h
	NQzLFFOORFXHIYViIfqa3ptGYg8E8bIyhv7kme12oHtwJ5BCQLdsA/zSXTc0AKyhFjwytlWeFPD
	6MSmDlaWx79a7eAqtX/BkU+q01iaJbwUN5cwqPWvV5kmIO3D5tCUnrBpB3KSkSCRy5bmiuRkjub
	szETZddWL0LSC4u6LjMhYD+z0x/2uGaRYpfZNiSku/YFoXdUumywjDxvCSoa2d/58RAYJkm10w7
	dHn/2S9UC6QjL8rfsjZUZei1csNhOOzUu7ISNmiX5JOCYuKyPtpZsnJGVnO01hcowbNYh+SACuy
	0FkfWhjGCmoWmYzz5eefRhdB2sI5o9FCGXrvJKj949mODeCwnCwSz0J0bkp68D/5WzDpY51W/6M
	exJMuRFfXqKiC9rKPxjXMs0dykYGTDGwoLmPYOqW52GLONAVZbgKhDm+9b0HSNQ4EzfW3UbWBPF
	SJ8TuDssTNcsQ2dnqrVa3JDemnEu6R6tSMvp8rhA1WT6G5JHI1xaLwQSxSZwKmzuFCplB7f4t0Z
	kGeF6JYS5vi5O04isDyWOZZtwnXXB
X-Received: by 2002:a05:6214:8207:20b0:921:33f6:8a51 with SMTP id 6a1803df08f44-92134b3e14cmr55307796d6.49.1795200116964;
        Fri, 20 Nov 2026 10:41:56 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d14d1sm33275916d6.18.2026.11.20.10.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:41:56 -0800 (PST)
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
Subject: Re: [PATCH 47/60] mm/vmscan: restrict reclaim to N_MEMORY_RECLAIM
 instead of N_MEMORY_COMMON
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
In-Reply-To: <sashiko-outbox-225854@kernel.org>
References: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
 <20261120-private_nodes_v6-v1-47-74f5f9a115c2@gourry.net>
 <sashiko-outbox-225854@kernel.org>
Date: Fri, 20 Nov 2026 13:41:54 -0500
Message-Id: <179520011480.412063.14337787866519317378.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-20 18:38 +0000, sashiko-bot@kernel.org wrote:
> > @@ -7907,7 +7907,7 @@ static int __init kswapd_init(void)
> >  {
> >  	int nid;
> >  
> > -	for_each_node_state(nid, N_MEMORY_COMMON)
> > +	for_each_node_state(nid, N_MEMORY_RECLAIM)
> >   		kswapd_run(nid);
> >  	register_sysctl_init("vm", vmscan_sysctl_table);
> >  	return 0;
> 
> [Severity: High]
> Can starting kswapd on a private N_MEMORY_RECLAIM node trigger a global
> OOM kill when MGLRU min_ttl_ms is set?
> 
> When kswapd runs balance_pgdat() -> kswapd_age_node() ->
> lru_gen_age_node() and every generation on the private node is younger
> than lru_gen_min_ttl (or all lruvecs on the node are too small or below
> memory.min), lru_gen_age_node() invokes out_of_memory() with an
> unconstrained oom_control:
> 
> mm/vmscan.c:lru_gen_age_node() {
> 	...
> 	if (!reclaimable && mutex_trylock(&oom_lock)) {
> 		struct oom_control oc = {
> 			.gfp_mask = sc->gfp_mask,
> 		};
> 
> 		out_of_memory(&oc);
> 
> 		mutex_unlock(&oom_lock);
> 	}
> }
> 
> Because oc.zonelist and oc.nodemask are NULL, out_of_memory() selects the
> highest-scoring process across the entire system, even if that process
> only uses common memory and holds no pages on the private node.  Should
> the out_of_memory() block in lru_gen_age_node() be restricted to
> N_MEMORY_COMMON nodes?
>

I haven't been able to generate this condition, but I can adjust the oom
control here accordingly.  This should be trivial to adjust.

-- 
~Gregory

