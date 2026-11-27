Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768117;
	b=jz1hVcCxMYF+1DdCGQwwsF72D1+Qjib8bKyfCKWOymE1E+kkwSvFyzX5dAZY+SCAl9so
	 7Fbh6up7iAmC1rsdw/bzN6GzTCO2JeEgLW8oBuFE1njdmp4qqt1iCj3j9xVm15XDiFIXq
	 ZW5tk1kmZpQFiDlxa9qGsfBpQ2cRkqJTbNTIQzWIMAu8FSbfwHErxc7BlLaP0WK1q0RFf
	 zPR6HUpmO4I8MlhZRpCeBdjQT7B2ZlM4m9lHwfpKY+PCY7bmS6uApKB+M5mMroESzY48W
	 qwgEM5WEpCE1F1dV8wRBqwqAaYEZ3O64OzTO4W4Ow8LtwOhbI8Z9vn0lnvibEIahrMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768117;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:Sender:
	 X-CM-SenderInfo;
	bh=1sIJUe4O4CsWbtMbQNi4aeXjMyQYal1HiWg977wjesI=;
	b=vvzYz90i0ytA7Wdei44oXGOBSuAKCprmAtouG1G2YBbSuy12N7Y9IAXbeL4hMX0ivGq1
	 2lXc5DT43tz4HCAHrENB5weOj4DLOSktPvtjwJVajOu4S96oyzwy8dEddav4Kbv6Gm1oR
	 xODZ+heGq5PlHO/hjTZ9yNDYYq38jwYemr9zL7nVd0GLVBWJQ0Sn2g2nAdQFiZLXmeaQD
	 IIIJsfZEfc43RAsWNVs6ilHCz7a+JBaIEPKTAuSd4JaIaUY2rZtpqhIsgDvHfiHByc0+a
	 kbFNn80Va8qJVWOgXdRuawtaWYVxlf+zHX8QedTVcy2ydhTsARCnb47ASDxdQqXYPVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=xiaomi.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=AHFaJuEh;
	arc=none smtp.remote-ip=117.135.210.6
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D940D606A31E
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 08:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D940D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=AHFaJuEh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=1s
	IJUe4O4CsWbtMbQNi4aeXjMyQYal1HiWg977wjesI=; b=AHFaJuEh0EIkAkyo2c
	ZVBqUZ9yupduHxWzUtjdjRTae0SDHFnaZIZf1Cj8HuqZGfghrCYnrxiuplKwyjLP
	kJJ9i4K8NXTV3yo5ESq/c2u3G1GsZ1QOUjIoY6Wfh1KN2jHQ0jDCNjFtfWmRwUw5
	dOeKubTHbfksoYyH1iOaTPaQo=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgDnz+_cPglrqen2EA--.50878S2;
	Fri, 27 Nov 2026 16:27:09 +0800 (CST)
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
Date: Fri, 27 Nov 2026 16:27:06 +0800
Message-ID: <20261127082707.3624358-1-zhaonanzhe@xiaomi.com>
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
X-CM-TRANSID:PikvCgDnz+_cPglrqen2EA--.50878S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF1DAFWrCryxWry5KryUKFg_yoW5Xr4UpF
	y7Ga42yr4kJF1IqFsrCFZ7u3s2yr4S9ay8Gry8tr47Wa4rX34qqFWqgwnYka1UCrWfW39I
	gws5ArZ5J3WUZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UvksDUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsR3js2sJPt1GbgAA3V

> [Severity: High]
> Does passing bio as parent to zram_read_page_size() cause a use-after-free
> of page when ZRAM_WB is set?
>
> When test_slot_flag(zram, index, ZRAM_WB) is true, zram_read_page_size()
> calls read_from_bdev(zram, page, index, blk_idx, parent) with a non-NULL
> parent bio:
> ...
> read_from_bdev_async() submits an asynchronous child bio referencing page
> (inheriting REQ_OP_WRITE from the write bio) and returns 0 immediately,
> after which zram_bvec_write_multi_pages_partial() frees page via
> __free_pages() while the backing-device I/O and completion work are still
> using it.

Both writeback and recompression currently assume that each slot holds a
single PAGE_SIZE object, which conflicts with multi-page slots, so I plan
to temporarily make CONFIG_ZRAM_MULTI_PAGES mutually exclusive with
CONFIG_ZRAM_WRITEBACK and CONFIG_ZRAM_MULTI_COMP via Kconfig.

> [Severity: High]
> Can post-processing a multi-page slot overflow ctl->pp_buckets[] and
> req->page?
>
> Neither scan_slots_for_writeback() nor scan_slots_for_recompress() skips
> ZRAM_COMP_MULTI_PAGES slots, where get_slot_size() can be up to
> ZCOMP_MULTI_PAGES_SIZE.  In place_pp_slot(), NUM_PP_BUCKETS is sized for
> PAGE_SIZE:
> ...
> When a multi-page slot's compressed size exceeds PAGE_SIZE, bid exceeds
> NUM_PP_BUCKETS and corrupts memory past struct zram_pp_ctl.  In
> zram_writeback_slots(), req->page is a single PAGE_SIZE page, so
> read_from_zspool_raw() also overflows req->page and wraps PAGE_SIZE - size
> in memzero_page(), while uncompressed writeback and recompress_slot() pass
> PAGE_SIZE for a multi-page object.

Same here. With writeback and recompression disabled under
CONFIG_ZRAM_MULTI_PAGES, scan_slots_for_writeback(),
scan_slots_for_recompress(), and place_pp_slot() will not be built or
called on multi-page slots.

Also regarding the related zs_rebind_handle() issue from the patch 1 review:

> [Severity: High]
> Does zs_rebind_handle() also need to mask the object offset with
> page_size - 1 instead of offset_in_page()?
>
> When a non-huge multi-page object sits at an offset >= PAGE_SIZE within its
> zpdesc, zs_rebind_handle() overwrites 8 bytes in the first subpage and leaves
> the object's own header pointing to the old src handle, so later compaction
> updates src instead of dst.

This is tied to the same recompression issue: zs_rebind_handle() is only
called by zram's recompress_slot(). With CONFIG_ZRAM_MULTI_COMP and
CONFIG_ZRAM_MULTI_PAGES mutually exclusive via Kconfig, multi-page objects
will never reach zs_rebind_handle().

