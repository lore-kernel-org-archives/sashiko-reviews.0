Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768141;
	b=H9BP8TPdozESOefefr0CjBCJ++RQXLIHx1hwc0NmO8qveGacidKp9UxJyckd0rrtlMKW
	 pMNHis/3qHJPEcXMD5zlrDR/dV+YQHpxlJvTTcd2Kh4s0jGlIt1Nlr+UaMBeJV4R8dJJr
	 ORxT8ZM+9uPhRxr0+9N/Q5E5HcCXLeB/PJccayDpCDKJQpzhFYmLUmanMhuR/P+bR51sa
	 fpVHX2wAhW31DqaK5d1uoV9O6gGBaYjdZR/L5hPMLxhu+hUUJNbLo/1LweP71+GYextcl
	 DCF3kozRGfY7OojZ/q3wkY35pJ0vY+Sd86HcZmwHYoHkUEEcd2wiFLLacko+UF4R61g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768141;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:Sender:
	 X-CM-SenderInfo;
	bh=MNESWvGb/p8QvPX1KB368WqOrHE4U6ua3L78fMFioCY=;
	b=K3kGhkWSwSp5HvGgagog1qeF+gUlvYGcyf4PpETiBhTcO1ASspcO/Tp+hta5Xqr1vD2T
	 pJpMvMldJrHXQhpCPO4oBuRQEmKqsPjV1G3n1sA1wgsPdEr5FeMcV5g0LIHbzFUSukNdp
	 tyenVMEEgqPbtsPdf5v30f/Era7IHKmvGCYTJty0Li40FgV/b/fVOB9Wh1+sDxScsPdjo
	 sG/5XP91P1NgyzLokcwB04V4LGpr7s4hd6v2Ux32SU5Tm0IMVKUkH6ouIZZXJcByDy8ni
	 0F59+187A5au9oIFv2RcrEY1rh+OiP0BEvB7mGBmqC8QOupjQ/70KUupX4nmF+eoh/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=xiaomi.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Na11z4Rd;
	arc=none smtp.remote-ip=117.135.210.6
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C97D606A32F
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 08:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C97D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Na11z4Rd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=MN
	ESWvGb/p8QvPX1KB368WqOrHE4U6ua3L78fMFioCY=; b=Na11z4Rdnwl9QXmS8e
	1efoGbbFTVPBgBQqTT0lkwpM1iGTYD4q+1EhGH/sDKeWu/5lk65gh/cM/mTFTgzY
	ADuhw8PHciWuclvVQbMoHGPMju7QM0XeIWJpCsjyYtHJRZuuWZM806OTX0ZOnFRX
	IS54+HJgxDhLUUS23gFSrfJkY=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3F9_xPglrbhBtEA--.48132S2;
	Fri, 27 Nov 2026 16:27:30 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Tangquan Zheng <zhengtangquan@oppo.com>,
	linux-mm@kvack.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Minchan Kim <minchan@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Usama Arif <usama.arif@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chris Li <chrisl@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Ying Huang <ying.huang@intel.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kanchana P Sridhar <kanchana.p.sridhar@intel.com>,
	Wajdi K Feghali <wajdi.k.feghali@intel.com>,
	Bala Seshasayee <bala.seshasayee@linux.intel.com>,
	Nick Terrell <terrelln@fb.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	sashiko-reviews@lists.linux.dev
Subject: Re: [RFC PATCH v4 2/4] zram: support compression at the granularity of multi-pages
Date: Fri, 27 Nov 2026 16:27:27 +0800
Message-ID: <20261127082728.3624874-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-216089@kernel.org>
References: <20261115024455.1465726-1-zhaonanzhe@xiaomi.com> <20261115024455.1465726-3-zhaonanzhe@xiaomi.com> <sashiko-outbox-216089@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3F9_xPglrbhBtEA--.48132S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtFykAr1ftw4rtrW8KFWkCrg_yoWxJr4DpF
	48Cay2kr48XFyUZr4UZws3ur1Dta1fuFWjqryFkw1F9FWfAr93ZFyUtryfXay2gryxCa9a
	qrs0qrZ5JF1UZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UkGYLUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsRLouGsJPvJHQAAA3a

> [Severity: Medium]
> Can zstrm->excl_lock and zstrm->buf_lock be acquired in opposite orders?
>
> In zram_read_partial_from_zspool(), an exclusive decompression backend
> (ZCOMP_DSTRM_EXCLUSIVE) takes zstrm->excl_lock inside zcomp_dstrm_get()
> and then locks zstrm->buf_lock.  A shared decompression backend
> (ZCOMP_DSTRM_SHARED) locks zstrm->buf_lock first and then calls
> zcomp_decompress(), which locks zstrm->excl_lock when a two-page object
> falls back to zstrm->local_copy:
>
> CPU0                              CPU1
> ----                              ----
> lock(&zstrm->excl_lock)
>                                   lock(&zstrm->buf_lock)
> lock(&zstrm->buf_lock)
>                                   lock(&zstrm->excl_lock)
>
>  *** DEADLOCK ***

This is a valid issue. I think I can eliminate the lock inversion by
dropping buf_lock entirely and letting partial reads always acquire the
stream in ZCOMP_DSTRM_EXCLUSIVE mode, where decomp_buf is already
serialized under excl_lock.

With patch 4 (allowing direct reclaim for synchronous multi-page swapin
in do_swap_page()), I found partial reads are quite rare. So using
exclusive mode here will not cause heavy lock contention.

--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -79,7 +79,6 @@ struct zcomp_dstrm {
 	void *local_copy;
 #ifdef CONFIG_ZRAM_MULTI_PAGES
 	void *decomp_buf;
-	struct mutex buf_lock;
 #endif
 };

--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -120,7 +120,6 @@ static int zcomp_dstrm_init(struct zcomp *comp, struct zcomp_dstrm *zstrm)
 		zcomp_dstrm_free(comp, zstrm);
 		return -ENOMEM;
 	}
-	mutex_init(&zstrm->buf_lock);
 #endif
 	return 0;
 }

--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2907,17 +2907,13 @@ static int zram_read_partial_from_zspool(struct zram *zram, struct page *page,
 		prio = get_slot_comp_priority(zram, index);
-		mode = ZCOMP_DSTRM_EXCLUSIVE;
-		if (zcomp_shared_decomp(zram->comps[prio]))
-			mode = ZCOMP_DSTRM_SHARED;
-
-		zstrm = zcomp_dstrm_get(zram->comps[prio], mode);
-		mutex_lock(&zstrm->buf_lock);
+		zstrm = zcomp_dstrm_get(zram->comps[prio], ZCOMP_DSTRM_EXCLUSIVE);
 		ret = zcomp_decompress(zram->comps[prio], zstrm, sg, size,
 				       zstrm->decomp_buf, page_size);
 		if (!ret) {
 			dst = kmap_local_page(page);
 			memcpy(dst, zstrm->decomp_buf + offset, PAGE_SIZE);
 			kunmap_local(dst);
 		}
-		mutex_unlock(&zstrm->buf_lock);
-		zcomp_dstrm_put(zram->comps[prio], zstrm, mode);
+		zcomp_dstrm_put(zram->comps[prio], zstrm, ZCOMP_DSTRM_EXCLUSIVE);
 	}

> [Severity: Medium]
> Can __test_multi_pages_comp() access past the end of zram->table when
> disksize is not a multiple of ZCOMP_MULTI_PAGES_SIZE?
>
> disksize_store() only aligns disksize with PAGE_ALIGN(disksize).  When
> num_pages is not a multiple of ZCOMP_MULTI_PAGES_NR, an access to the
> final slots has head + i >= num_pages, so __test_multi_pages_comp() and
> the set_slot_flag() loops in the multi-page write path read and write past
> the end of zram->table.

This is a valid issue (and was also caught by syzbot KASAN). I will align
disksize to ZCOMP_MULTI_PAGES_SIZE in disksize_store() so that multi-page
groups never cross the end of zram->table.

--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -3298,7 +3298,7 @@ static ssize_t disksize_store(struct device *dev, struct device_attribute *attr,
 	if (init_done(zram)) {
 		pr_info("Cannot change disksize for initialized device\n");
 		return -EBUSY;
 	}

-	disksize = PAGE_ALIGN(disksize);
+	disksize = ALIGN(disksize, ZCOMP_MULTI_PAGES_SIZE);
 	num_pages = disksize >> PAGE_SHIFT;

> [Severity: Medium]
> Does ZRAM_FLAG_SHIFT overflow the 32-bit attr.flags field when
> PAGE_SHIFT + CONFIG_ZSMALLOC_MULTI_PAGES_ORDER > 21?
>
> CONFIG_ZSMALLOC_MULTI_PAGES_ORDER allows values up to 9, and enum
> zram_pageflags defines 10 flag bits above ZRAM_FLAG_SHIFT.  On 16K or 64K
> page configurations with larger orders (for example, PAGE_SHIFT == 16 with
> order >= 6), __NR_ZRAM_PAGEFLAGS exceeds 32 and triggers
> BUILD_BUG_ON(__NR_ZRAM_PAGEFLAGS > sizeof(zram_te.attr.flags) * 8) in
> zram_init().

This is valid. While configurations exceeding the 32-bit limit are already
rejected at build time, I will replace BUILD_BUG_ON() with an informative
static_assert() and add comments documenting the bit budget (PAGE_SHIFT +
ZSMALLOC_MULTI_PAGES_ORDER <= 21).

--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -3680,2 +3680,3 @@ static int __init zram_init(void)
-	BUILD_BUG_ON(__NR_ZRAM_PAGEFLAGS > sizeof(zram_te.attr.flags) * 8);
+	static_assert(__NR_ZRAM_PAGEFLAGS <= sizeof(zram_te.attr.flags) * 8,
+		      "zram pageflags overflow: PAGE_SHIFT + ZSMALLOC_MULTI_PAGES_ORDER must be <= 21");

> [Severity: Low]
> Should this find_alloced_obj() change be folded into the preceding commit
> "mm: zsmalloc: support objects compressed based on multiple pages" so the
> series stays bisectable?
>
> Also, the commit message ends with "The following data illustrates the
> time and compressed data for typical anonymous pages gathered from Android
> phones." without including the data table, and multi_pages_debug_stat_show()
> is missing a colon or space before "%8llu" on the failed and partial count
> lines.

Agreed. I will fold the find_alloced_obj() change into patch 1, drop the
sentence that promises a data table which is not included, and fix the
missing delimiter in multi_pages_debug_stat_show:

--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2011,3 +2011,3 @@ static ssize_t multi_pages_debug_stat_show(struct device *dev,
-			"multi_pages_failed_writes%8llu\n"
-			"zram_bio_write_multi_pages_partial_count%8llu\n"
-			"zram_bio_read_multi_pages_partial_count%8llu\n"
+			"multi_pages_failed_writes: %8llu\n"
+			"zram_bio_write_multi_pages_partial_count: %8llu\n"
+			"zram_bio_read_multi_pages_partial_count: %8llu\n"

