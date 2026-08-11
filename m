Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72455336EDA
	for <sashiko-reviews@lists.linux.dev>; Tue, 11 Aug 2026 17:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786468688; cv=pass; b=pjOP8zK2esYocqG7DazBDG+I9/mWDQ51rDyiDiRUHdwXCFmrv7dhWXN8lXb9c9MeWJ5QYbfhbiy70EO6oolUfszaEG1dMRZLEv5b6NMQrLUHNuDjjMBJi2pN6lMOau/LhatHZ6RRTR5NQqacz7OOlpcb7cOrevcAQCqMUQbw7aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786468688; c=relaxed/simple;
	bh=mCw4EcdCBFDHSFVDpulqFfKL6PaPg9wrcOVbtLUExCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQ9Jjjgx2Iz4ZNL3B6+pyKbppOch+Wz0E+VYeg2TFDwsHbs3iNOo+JTuF9EGZlAlQog0QVgYCFnp3zRiegzW1UcQYedybitwFCvBRIv5FED4R8e/1ztDheudR2+eWImh3FseCXsq1r2KqBG5LRkFrOD0T/MLYgfayIT3SzXR+Ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYc29qH6; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYc29qH6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49954b88fffso440955e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 11 Aug 2026 10:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786468685; cv=none;
        d=google.com; s=arc-20260327;
        b=OVapj6JnwfugTxaHLCuUlRSckOkfnaC2OxarBrJTJt6RhLx1iz+RJlOUPglrHpBiqM
         Z/V28v8G3KamofEfzEZCiCO6R6bL438P6xAI1IF5xUkUY06Anq9G9Z18IjQ63gVY/9T1
         wUQNrWT/bxJERcx06K5c4ZSLAW7xnr3WCvEY6OPYuFEhTLyqpUCzoKSgMjlQyQj5PisX
         e52LWKh8/KwolUKdBozm2kSaa4QdMANKZDQ9bvvFsphM4Zv2hu3FHcDlgNrmcaapS32i
         jtRrrKCRL7X1EpaR7FMnI/2hreTSVKG360+Aom6z9Yys/RO2Sx47IfgdOKkO5TJn7joW
         5seQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1lMjqfyM2pcqzkOWtKU+Em6fjGGxptW037mrJGCaz8=;
        fh=uFXdwVvru/3XbDUX38iaJ+K4lrQQfBP08hXRQ3LLtE4=;
        b=To3Ae8HCsZIFaeeFchgi8FPFmx/hr9geyEnXTgY5K9XXWFJTY6J/fJIlBWNaQ64GxG
         oqIBDDZ+GI9JD8ReBlLIPjuex3NbHgNgUHFoypPRL8M2aSEU2OLSnhxXCx6zYIaQEnM6
         GfASorzFK/rF0f5byte/ESHuDeRLZ40N3ad9uOwCaH9jCcfUJd82ufnkghu3n+5ysp7J
         Kr+6AO5GHmjV74Cco6Y3U7xgxWwVHXk8eZvhmIDBizDDGM91x+jw1rFpNcBdZqFlA59K
         IHbUfXcBAh8DCUuZIcbRqeobr2SLWwfobk78g4mwlv+tmWtpIW0d6aG7cbat4HAiWUO5
         dDdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786468685; x=1787073485; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1lMjqfyM2pcqzkOWtKU+Em6fjGGxptW037mrJGCaz8=;
        b=gYc29qH61KhR7hIocCWh8QbKob2wkOUAAY6IgoOX+zw9tvhCEHpKpho6kKnxSaLq2C
         YxSgdw11IYlj+WWQcAs6qSTxgo2+CA671TgWAAcS9XsR6e6cp0cueEld708FcCj0ZyVm
         /PK4gt311gHQzgNhW4Qlz0QoYslc3Jp58rf+1h7tYqLSHo9TWr09wlWL31nXHzk5qTCD
         iZJ5fHI8KmO+/59SkqBThZacoHTxLPFPVNYqm05wulMlUFc4wB+85kR+iaNQEEsfROVm
         2dHuuwGkshKqfQobA1VACWnGQnKYIY6a/lmCcaHtOb945jkWdeNWKZmhkWIcT8BCptPn
         JT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786468685; x=1787073485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1lMjqfyM2pcqzkOWtKU+Em6fjGGxptW037mrJGCaz8=;
        b=plE3fSYOfKozayQ8CgKCdPojPjbMWYoM4AwjSDwLP2AGXyX8qwMzs+OI5CCNi1K2pB
         tteYDr0LSJDza5VSifoD2lxxl5cHWr3hZkcNviSUy2r6kNKbrAJC9XM4H3LBFnxz7RH1
         Wksg3ud1XH806uerUsOof2sFANYsLC8VySgDpsc4EWBNFuBxQh2wKSSU+yHez5Jltydv
         y7wktHOANgP67ioIwJtaLceqb82dIvR46CPgmgzkFK4FmZIcBp53q9NDwgIDtv06hPxj
         48SLr+k0yk+8EKRXU7/1DLY0vUJxK9BIIaKXU2AafNQ6CLXAkeqvQkDGCUwAgew5ipp/
         QEPw==
X-Gm-Message-State: AOJu0YzA2fx9G4qSsCBHzBM8k4J7cLS1AuTlyJjLHaP1Galx0VWjM649
	zIyQHoYo4sFowAlLsQaZlHj9xZnnseevluld36soX8Ljk+7fMIMskkLyhXnYDRlRTVlCX8x24Cy
	eYLfw6kRpUAV40RaOr6EP1HtCYc2WWSgh6JO/
X-Gm-Gg: AR+sD11v2UPXLSiWUHB0xQQxwXb5UciRgyp4I6F3lYTHE5ozHoHUddU57lOSNlAChTi
	XKS8/qm8kZFpU3wFJUYRyR4r+XehgHjFr0TcGbLVFiTQICKOzRJqUZECrGWEf7QWVI7RB1Rwykp
	ZjHZ+7Updzb0l64ckIsFuCMMvDtHWCRsJeA3ybpnuXL72AdAR47f4NWzsp30mKzO/qEWzNZBYhu
	7lTZouc7GFoB7v5zOUEJg0CJ0Ca/GfDhUyLHcWiXuWgNTc0sAPd02fiN5AeVJmBqJ7bCTzAHtu+
	39RQLL+6r1zyrmnIYP1orYw9NtaRHCRm6uLKRrHnr/UMNxsJn8FsIUY12cU+oquFKSakHzcNB3J
	3
X-Received: by 2002:a05:600c:4593:b0:495:5858:8101 with SMTP id
 5b1f17b1804b1-4997846ac04mr68274895e9.15.1786468684401; Tue, 11 Aug 2026
 10:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806184254.3790858-1-nphamcs@gmail.com> <20260806184254.3790858-11-nphamcs@gmail.com>
 <20260806191958.44F881F000E9@smtp.kernel.org>
In-Reply-To: <20260806191958.44F881F000E9@smtp.kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 11 Aug 2026 10:17:51 -0700
X-Gm-Features: AUfX_myfSmM-We7RZK14vgJtCA25PP9imNWJ2f-4bhH6ulFBjzqzSD-QM8ww2hc
Message-ID: <CAKEwX=NB9LiX6t=MrkB7TgB31XK3FpLxFEb2_mSsY2mD-+NpFA@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] mm, swap: defer memcg_table allocation for
 physical swap clusters
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, hannes@cmpxchg.org, tj@kernel.org, 
	Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Meta kernel team <kernel-team@meta.com>, Nhat Pham <nphamcs@gmail.com>, 
	linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 12:19=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

Hmm seems like this is not sent to the list. I'll just cc the response
to my original sent list...

>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] Deferring `memcg_table` allocation to `alloc_swap_scan_clust=
er` under `local_lock` using `GFP_ATOMIC` causes an infinite loop under mem=
ory pressure and violates allocation constraints.
> --
>
> > +#ifdef CONFIG_MEMCG
> > +             /*
> > +              * Lazy-allocate memcg_table on the first direct-use slot=
 of a
> > +              * physical cluster.
> > +              */
> > +             if (IS_ENABLED(CONFIG_VSWAP) && folio &&
> > +                 !folio_test_swapcache(folio) && !mem_cgroup_disabled(=
) &&
> > +                 !ci->memcg_table) {
> > +                     ci->memcg_table =3D kzalloc_obj(*ci->memcg_table,
> > +                                                   GFP_ATOMIC | __GFP_=
NOWARN);
> > +                     if (!ci->memcg_table)
> > +                             goto out;
> > +             }
> > +#endif
>
> [Severity: Critical]
> Does this error path create an infinite loop under memory pressure?
>
> If the GFP_ATOMIC allocation fails, we jump to the out label, which calls
> relocate_cluster() and puts the unmodified cluster back on the list,
> returning 0.
>
> When called via this path:
>
> cluster_alloc_swap_entry()
>   alloc_swap_scan_list(..., scan_all =3D true)
>     do {
>         ci =3D isolate_lock_cluster(si, list);
>         found =3D alloc_swap_scan_cluster(si, ci, ...);
>         if (found)
>             break;
>     } while (scan_all);
>
> Won't alloc_swap_scan_list() continuously dequeue the exact same cluster
> and fail the allocation indefinitely, since the cluster is never consumed
> or discarded?

Oh nice catch! It's a a bit of a rare construction. You need:

1. Vswap enabled.

2. The physical swap clusters start out backing vswap entries.

3. Then we use these same cluster to directly map to PTEs, bypassing
vswap. This usually means vswap allocation fails (rare), or is disabled
during runtime (rare).

4. The deferred memcg_table (1KB per cluster IIRC) allocation must fail.

Technically possible, but does not seem very likely, so I'll just do
the minimum to not infinite-loop here: i.e if memcg_table allocation
fails, just propagate that information up the call stack and
short-circuit the list scan.

We can add complexity (dropping the lock and retry allocation)
if the rate of allocation failure is high enough in this case (which I
doubt).

>
> Additionally, alloc_swap_scan_cluster() runs with preemption disabled und=
er
> a local_lock. Does using GFP_ATOMIC here risk lock recursion? GFP_ATOMIC
> includes __GFP_KSWAPD_RECLAIM, which wakes kswapd and can take scheduler
> locks while preemption is disabled.

I don't think this is correct.
