Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539320;
	b=qfT7XGDJzSESMONyUakUKcMvsy5cKC35+L6xVPENlatWPuGNDx0c7jcecgYUjeUFPgxW
	 FsL2+Pnqjyk4+8DEVq3RjQow9r0wiKPzJFHNwqWgxzHIvON6z7L92SHh3ZF+pIj1BDWZC
	 2i6oLNNI6f533lyVHxRxat7m9tIMijULdO1EIFp33Tt0+/k1IZBhMw2Yf0EFKf7G069/D
	 iy6kJtbXqBbAwC4NqB+J7cc4FdsUtixLC1gqeSqtFkcOJ0L/yU+ZkJ8TygbIh+C2PbzSD
	 CZnEOn1oGA+BRgXY8w6DKGPi/iaNwQaSmjR129WNUYNR1C0ewkMq6kD4rFeJCzWwZig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=xZloecugQSPG+AdwTqsdlH4NBljJ9G+FtiQW0vi3A98=;
	b=Pxc3saKLvT3V6f3abwiGbHhPaYBwADr62kXg0C0gpvitE014A9zponadTP4uS1ootNCV
	 o28Fy9zl8a4JfdtxBfmhTdpSlLp0EiKxSzww1cNDApXM29BGzd17TLYlQGCP91YDyHKoz
	 wTZ8+DfR6rz1NnhX2gN9peskTVThyeXOJ4HHh9/Jk7jlVoxbGLl5E1rZ/FqY2tZbHlcKB
	 qUrP535kZVerNIsmbccYegjx62dueHivN7FXCpzRwBDkv/XoDuXPpxrsPFnBpK5lHdqG1
	 ZTxFBFOhc33V1c2zDGWjvaR2gAB0YQHmhkdb/pnoOCJXzfgzaNgEwl7b7qqZ+ljBKjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k08hG38n;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9E9606A33F
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 16:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D9E9606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k08hG38n
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f040056fd0so26275235ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 08:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795539318; x=1796144118; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xZloecugQSPG+AdwTqsdlH4NBljJ9G+FtiQW0vi3A98=;
        b=k08hG38nvWlw8rY0vpI+m+v5Maq5tuAk0k1Ijht3wRYUxygDJ5y1yvhr8tDBg9YXme
         HTyVXbxgXg7erCv3KPSIwpuSxYl+niCZDOgrvNHp85SYinOzO/0d+XIMPJ49hCGU7r8K
         EyRHLtiLXg25ggjSLC8uq8ZXZ4O9SAznCxQ8CFmio67RWyPYALiHTVHrVEqWD7MRb54F
         OgePu0BR4pcAQqbnZLO6p1VIu6Pg7kWDl4TeU/wDwugrGXMisDyMzVEY2/Qcw64jB2w5
         Gj4TpLIDxYCqbu75W8mXPGowC/54asAK56Bn27II87pGiPZCiz0WngQhUj/EjgeA4kR5
         cgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539318; x=1796144118;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZloecugQSPG+AdwTqsdlH4NBljJ9G+FtiQW0vi3A98=;
        b=hzM/+xbKUXVKpTNEvX8Gfy21oO5Lmgq2/82SMhgQfrCmrqJgiwMLlmN6Y3v9ldpnc6
         VeTGtDpLL4JLsQsop5Eyeb17SKhI/lWJEqUxAxfzFT/c6u1CKpcTtIlU2jnChE4Zrt4t
         qdeRjYoA5xKs9eGrLAj68PfH/tSR3ErA96lr9tN5sVrFhxnJj5jnrh/luv9IQP6wNn+E
         vmAqvN9nCaG56Qe1hJyFjSeV7JccKJCHvRRxm+E+R5ELVtH54iD8p0h8TxUa10ttk4Io
         POjll/JOFgQGL/u2SrCHXpVL0S7rGgB1bQQLJDG3DMFbC8ldHt4YNv5Z9MSBCqemnA4+
         jT3g==
X-Forwarded-Encrypted: i=1; AL+hErEIyklDzVlXqb4h8c2h5tJ+kEFn5atQXj6bE0MtoxCOLss8vEu3MhxS+PkIZT9maop1LveDBXGDx4kWss2ICsg=@lists.linux.dev
X-Gm-Message-State: APuU4Z90TD5wfop+d4vTNNBBJzEWuqga56xIILOWNga/xBj7t/PXxpNq
	CABPpWPmBPQThu2O76spddMUUIAoVTbEM5Rtqn6kdglng9njPL/QqAxfCevSZ3dujW4LwDd0xTX
	Y0mOnvDR7s+5Y62Uqj1Dxfw==
X-Received: from plri16.prod.google.com ([2002:a17:903:32d0:b0:2ed:de1d:fc13])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ec8b:b0:2ed:662:e485 with SMTP id d9443c01a7336-2f03efa420fmr100600525ad.2.1795539317356;
 Tue, 24 Nov 2026 08:55:17 -0800 (PST)
Date: Tue, 24 Nov 2026 16:55:15 +0000
In-Reply-To: <sashiko-outbox-228635@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <sashiko-outbox-228635@kernel.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124165516.1182390-1-jthoughton@google.com>
Subject: Re: [PATCH v3 06/19] hugetlb: Optimize bootmem folios that were not pre-HVOed
From: James Houghton <jthoughton@google.com>
To: sashiko-bot@kernel.org
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, david@kernel.org, 
	fvdl@google.com, jthoughton@google.com, linu.cherian@arm.com, 
	linux-mm@kvack.org, mark.rutland@arm.com, muchun.song@linux.dev, 
	nikos.nikoleris@arm.com, osalvador@suse.de, rientjes@google.com, 
	ryan.roberts@arm.com, sashiko-reviews@lists.linux.dev, sunnanyong@huawei.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/hugetlb: avoidable TLB flushes in
>   hugetlb_vmemmap_optimize_folios()
> --
>
> commit 5763c0ece0fd843280e0e8e1b6561cb66598d64b
> Author: James Houghton <jthoughton@google.com>
>
> hugetlb: Optimize bootmem folios that were not pre-HVOed
>
> This commit restores calling hugetlb_vmemmap_optimize_folios() in
> prep_and_add_bootmem_folios() so that architectures disabling
> section-based vmemmap optimization can still optimize bootmem folios
> once HVO support is determined.
>
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 72839e98f998e..8756c0206922a 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -3325,6 +3325,17 @@ static void __init prep_and_add_bootmem_folios(s=
truct hstate *h,
> >       unsigned long flags;
> >       struct folio *folio, *tmp_f;
> >
> > +     /*
> > +      * Bootmem folios are normally pre-HVOed through the section-base=
d
> > +      * vmemmap optimization. However, an architecture that can only
> > +      * determine whether it supports HVO after bootmem allocation dis=
ables
> > +      * the section-based optimization (see
> > +      * section_vmemmap_optimization_disable()), in which case the fol=
ios
> > +      * were not pre-HVOed and must be optimized now. Pre-HVOed folios=
 are
> > +      * skipped.
> > +      */
> > +     hugetlb_vmemmap_optimize_folios(h, folio_list);
> > +
> >       list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
> >               /* Subdivide locks to achieve better parallel performance=
 */
> >               spin_lock_irqsave(&hugetlb_lock, flags);
>
> [Severity: Medium]
> Does calling hugetlb_vmemmap_optimize_folios() here cause avoidable
> vmemmap_remap_rwsem contention and two global flush_tlb_all() broadcasts
> per NUMA node when all folios on folio_list were already pre-HVOed (or
> when HVO is disabled)?
>
> When 629d87ed65ef ("mm/hugetlb: drop boot-time HVO handling for gigantic
> folios") removed the call from prep_and_add_bootmem_folios(), it also
> removed the nr_to_optimize tracking and early return from
> hugetlb_vmemmap_optimize_folios().  On architectures where
> gather_bootmem_prealloc_node() already marks every bootmem folio with
> folio_set_hugetlb_vmemmap_optimized(), each node worker in
> hugetlb_bootmem_struct_page_init() now serializes on
> down_write(&vmemmap_remap_rwsem), walks folio_list twice, and runs two
> unconditional flush_tlb_all() shootdowns without modifying any page
> tables.
>
> Restoring the early return in hugetlb_vmemmap_optimize_folios() when no
> folios on folio_list satisfy vmemmap_should_optimize_folio() would avoid
> the extra walk and TLB flushes.

It is questionable if this needs fixing, but ok, I've applied the following=
 diff
to v4. It essentially puts back the early return path that was removed from
[1].

[1] https://lore.kernel.org/linux-mm/20261120100856.16929-6-songmuchun@byte=
dance.com/

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 8ec80f450123..df145776aa6b 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -610,6 +610,7 @@ static int hugetlb_vmemmap_pteify_folio(const struct hs=
tate *h, struct folio *fo
 void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *f=
olio_list)
 {
 	struct folio *folio;
+	unsigned long nr_to_optimize =3D 0;
 	LIST_HEAD(vmemmap_pages);
 	unsigned long flags =3D VMEMMAP_DEFER_TLB_FLUSH;
=20
@@ -618,7 +619,14 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h,=
 struct list_head *folio_l
=20
 	down_write(&vmemmap_remap_rwsem);
 	list_for_each_entry(folio, folio_list, lru) {
-		int ret =3D hugetlb_vmemmap_pteify_folio(h, folio, flags);
+		int ret;
+
+		if (!vmemmap_should_optimize_folio(h, folio))
+			continue;
+
+		nr_to_optimize++;
+
+		ret =3D hugetlb_vmemmap_pteify_folio(h, folio, flags);
=20
 		/*
 		 * Splitting the PMD requires allocating a page, thus let's fail
@@ -630,6 +638,11 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h,=
 struct list_head *folio_l
 			break;
 	}
=20
+	if (!nr_to_optimize) {
+		up_write(&vmemmap_remap_rwsem);
+		return;
+	}
+
 	flush_tlb_all();
 	downgrade_write(&vmemmap_remap_rwsem);
