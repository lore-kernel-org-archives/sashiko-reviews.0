Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780015;
	b=0U3GJAYAQEHo/VhvOAQT9nk6tjN8QKNiUtQWeC1EmMRy0pIeT5lh8YEAAPxn7LgWC5ER
	 k2jQYiH1aHjL2ZAOUhmIgaYze+P9qVwbntiGUoclyCbJ9mq7fS+e7Gv2/03Vcey9FCLLU
	 AUSUf3cc36eKbh8n78ER0/JHLKyoHI5hLOYvSvrA/O2S8UXye2SjV/P66iZ/G7dWgyTGl
	 eXykn2mVSwDuDYkmg2C4b/iEQw6VKw5KL8oXaBXDxU17fPxzNeiTYR95Z/PLqk50jLjXS
	 xOy48r2Z+PQbKDI4a5Nx1J6nbetZVjF6WkUJVBS6c8Hhk3LYSM/X+s2v90L3CTsjmHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780015;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=N1v6Y6a+QlyoXYhdz9QlUP5uoo0sVtE5XqN3Zaa8y00=;
	b=zDNdc7z7L3DyoZO+C9c+OMoqCc7rnXbR/qTIYdCGXleP3+wVifFD8/12p62LjknquWXN
	 n2IRUu7t9yOoP7WF8LhEfE87sxqks8lWwGOyhnz82E4dLS4C7y5e/tfXsCESeTDHHTQ0Q
	 89m1vFmxPsT456bINvxwLm2psZeNdAOU3Oh+Itl6Jwtg0zpmoBqlZzvbM5mc+0aiE6EvG
	 l4SdyaGnKib8Omz452u4zFIbWJBYGvKyhGcfeKTxcodDTBH5QlKcDbOWT8mkjms3D8ElM
	 XTA29QF/B8Iaa2QC/DslF74jIon1cJjbpOygnl8813GXDE9J7HCm92vAe9e3PRgqLdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGnhrybj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA16606A334
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 22:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGnhrybj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77041F000C4;
	Sun, 15 Nov 2026 22:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794780014;
	bh=N1v6Y6a+QlyoXYhdz9QlUP5uoo0sVtE5XqN3Zaa8y00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EGnhrybjez6dCIq7PmwFVVj3f+1GoC3tonXUCARBmjviEtBYHWwsm3F15CE/wQarN
	 lD0lOI7+Ki86tXCAYbv/3hWw5XkSu8o3ECm1/sWSO24wVBGS+d5R0BAw5lf2zAXJiP
	 rmem+mUkYBUYjX3KNdxxF2gSZibgzYlJYNgTjYTVv5nUxuyKZ/ZdR8/qR6QI6yu4Ii
	 Dw/PlyNwEbBIEt9VfhprU59omOT0OBWRTr9lCGlq46fPRLEi2H4TJz94lxi3+dSUV1
	 1kMavqdF+m+RPuv/rlLXmuAKv//RRMEZskkS2hHtmK9Es5ekTwynIvblhdSB7oRhpB
	 JVVuCupWVPTRg==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: ryncsn@gmail.com
Cc: akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	hannes@cmpxchg.org,
	hui.zhu@linux.dev,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-mm@kvack.org,
	liuxiang.277@bytedance.com,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	ridong.chen@linux.dev,
	rppt@kernel.org,
	sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	shakeel.butt@linux.dev,
	sidchintamaneni@gmail.com,
	surenb@google.com,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	zhuhui@kylinos.cn
Subject: Re: [PATCH v9 11/16] mm/mglru: Run aging when one type is drained
Date: Mon, 16 Nov 2026 06:00:07 +0800
Message-Id: <20261115220007.89063-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAMgjq7DiH1SJCR0DMwf=16cxXO2PZcjSuD41sO7_2hOcXuPUQQ@mail.gmail.com>
References: <CAMgjq7DiH1SJCR0DMwf=16cxXO2PZcjSuD41sO7_2hOcXuPUQQ@mail.gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Mon, Nov 16, 2026 at 2:07 AM Kairui Song <ryncsn@gmail.com> wrote:
>
> On Sun, Nov 15, 2026 at 5:44 AM Barry Song (Xiaomi) <baohua@kernel.org> wrote:
> >
> > On Sun, Nov 15, 2026 at 4:50 AM <sashiko-bot@kernel.org> wrote:
> > >
> > > Thank you for your contribution! Sashiko AI review found 2 potential
> > > issues to consider:
> > > - [Medium] mm/mglru: scan_folios() scans seq below min_seq at
> > >   DEF_PRIORITY
> >
> > I guess reparenting could be a corner case where it's difficult to
> > properly preserve the cold/hot ordering.
>
> I think we don't need to care about hotness for reparenting, MGLRU's
> reparent just forcefully squashes the old gen into the parent's gen,
> and most likely in the wrong window order, the hotness info is already
> severely skewed; there's no way to cover that until we run the aging.
> In fact I think we should patch reparent instead, maybe later,
> squashing everything into the oldest generation seems a more
> reasonable solution for reparenting?

Right. The current reparenting behavior is already quite odd,
given that generation numbers wrap around. A larger generation
number doesn't necessarily mean a younger or older generation,
so the ordering can already be completely disrupted.

static void __lru_gen_reparent_memcg(struct lruvec *child_lruvec, struct lruvec *parent_lruvec,
                                     int zone, int type)
{
        child_lrugen = &child_lruvec->lrugen;
        parent_lrugen = &parent_lruvec->lrugen;

        for (gen = 0; gen < MAX_NR_GENS; gen++) {
                long nr_pages = child_lrugen->nr_pages[gen][type][zone];
                int child_lru_active = lru_gen_is_active(child_lruvec, gen) ? LRU_ACTIVE : 0;
                int parent_lru_active = lru_gen_is_active(parent_lruvec, gen) ? LRU_ACTIVE : 0;

                /* Assuming that child pages are colder than parent pages */
                list_splice_tail_init(&child_lrugen->folios[gen][type][zone],
                                      &parent_lrugen->folios[gen][type][zone]);
                ... 
        }   
}

I think it makes perfect sense to simplify the code by moving
all child folios to the parent's min_seq, especially since
there's already a comment saying:

"Assuming that child pages are colder than parent pages"

And I think the current active/inactive counting is absolutely
wrong for reparenting:

static inline bool lru_gen_is_active(const struct lruvec *lruvec, int gen)
{
        unsigned long max_seq = lruvec->lrugen.max_seq;

        VM_WARN_ON_ONCE(gen >= MAX_NR_GENS);

        /* see the comment on MIN_NR_GENS */
        return gen == lru_gen_from_seq(max_seq) || gen == lru_gen_from_seq(max_seq - 1); 
}

Considering that the parent memcg has only two generations,
some child folios may end up in lru_gen_from_seq(max_seq + 1),
which is also lru_gen_from_seq(min_seq - 2), while others may
end up in lru_gen_from_seq(max_seq + 2), which is also
lru_gen_from_seq(min_seq - 1), due to the wraparound.

In that case, wouldn't max_seq and max_seq - 1 effectively
represent "inactive", while lru_gen_from_seq(max_seq + 1)
and lru_gen_from_seq(max_seq + 2) represent "active"?

This makes your idea of moving all child folios to the
parent memcg's oldest generation even more compelling!

I drafted the following code based on your idea. It's unrelated
to this series and would be a separate change:
(also I found another bug, __update_lru_size() is only called
while parent/child active status is different -  this will
make both parent/child lru statistics wrong, so i dropped
it)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index a5b8244d4768..582bce575cec 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4620,28 +4620,27 @@ static void __lru_gen_reparent_memcg(struct lruvec *child_lruvec, struct lruvec
 {
        struct lru_gen_folio *child_lrugen, *parent_lrugen;
        enum lru_list lru = type * LRU_INACTIVE_FILE;
-       int gen;
+       int gen, parent_gen;
 
        child_lrugen = &child_lruvec->lrugen;
        parent_lrugen = &parent_lruvec->lrugen;
+       parent_gen = lru_gen_from_seq(READ_ONCE(parent_lrugen->min_seq[type]));
+       int parent_lru_active = lru_gen_is_active(parent_lruvec, parent_gen) ? LRU_ACTIVE : 0;
 
        for (gen = 0; gen < MAX_NR_GENS; gen++) {
                long nr_pages = child_lrugen->nr_pages[gen][type][zone];
                int child_lru_active = lru_gen_is_active(child_lruvec, gen) ? LRU_ACTIVE : 0;
-               int parent_lru_active = lru_gen_is_active(parent_lruvec, gen) ? LRU_ACTIVE : 0;
 
                /* Assuming that child pages are colder than parent pages */
                list_splice_tail_init(&child_lrugen->folios[gen][type][zone],
-                                     &parent_lrugen->folios[gen][type][zone]);
+                                     &parent_lrugen->folios[parent_gen][type][zone]);
 
                WRITE_ONCE(child_lrugen->nr_pages[gen][type][zone], 0);
                WRITE_ONCE(parent_lrugen->nr_pages[gen][type][zone],
-                          parent_lrugen->nr_pages[gen][type][zone] + nr_pages);
+                          parent_lrugen->nr_pages[parent_gen][type][zone] + nr_pages);
 
-               if (lru_gen_is_active(child_lruvec, gen) != lru_gen_is_active(parent_lruvec, gen)) {
-                       __update_lru_size(child_lruvec, lru + child_lru_active, zone, -nr_pages);
-                       __update_lru_size(parent_lruvec, lru + parent_lru_active, zone, nr_pages);
-               }
+               __update_lru_size(child_lruvec, lru + child_lru_active, zone, -nr_pages);
+               __update_lru_size(parent_lruvec, lru + parent_lru_active, zone, nr_pages);
        }
 }


>
> And if the child's old generation was squashed into an out-of-window
> generation, these out-of-window cold folios will get evicted much
> later than the hot folios. In that case we even somehow "fixed" that
> by this patch :P, as long there is no leak, I think it's hard to
> define what is the right behavior.

Yes, agreed.

Another thing we could do is add the change I mentioned in my
reply to Sashiko [1], which Andrew has already picked up.

@@ -4788,6 +4788,9 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
  seq = lrugen->max_seq;

  seq = lruvec_populated_min_seq(lruvec, type, sc->reclaim_idx + 1, seq);
+ if (seq < lrugen->min_seq[type])
+            return 0;
+

This would avoid iterating over each zone's list just to check
whether it is empty. That's the case most of the time, except
for corner cases involving reparenting.

[1] https://lore.kernel.org/linux-mm/20261114214438.70148-1-baohua@kernel.org/

Thanks
Barry


