Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768139;
	b=AeH/bBpwWH6DUontaQ4k+CSh9BLTT5sN7Qa2GVmpKlecdPNshHWwTOa92TZuDyv3ysie
	 vkhEzJl7btKQaz9Qn4GUiQUjnAiaIO2ymUy/sbkarYsQ26bd+yULE/JUFL2fcA6MXht/u
	 aTkwQllNpKRjGLrokbVo4+vakMut2XoELuIiMNBBB8kr7f1r+tAR87u00cscgFn4IxllD
	 JzcIcVX6b5qcDJ00DfrUEqDDbesifZWKMOPFEy9DnUuiALtEqQ7jcbBTvkWMLGxEo6rMI
	 EJGfLacwOseidQc4H7HsrLTGV6z/Z2iSK+ovEwep5u6tP28a3qVN+2y2PHOIdqL9BVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768139;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:Sender:
	 X-CM-SenderInfo;
	bh=FelsLGm3OIsJMRghgdPAN/WSMG0jTZ6UF/BA+N/J5Dw=;
	b=w3VxEXFS9ADXMbZdPQi7jiHyov7iyY0NoicWK51DIF3JQY+KGGT0jU87xUBQsmt84aaT
	 jiKn+NhOHk8Wkz9X4qExLMbI7C8xpwktYH6h/dG3jEjxx3YYVsErp4fo1DXsDeHbw0DsA
	 9wqArSj12h+W6dMjXTqihA0ZMXAxQQpYrwvePTA+tzso8uUFw97CMeTbSXM1SnwmGWs17
	 8UwgQ8XoA77xzQTNrIwVuj8r2VgD+7WFF7lD5otBXZX3zdb7QJlo15nHCDi2801Vm4e5X
	 HDT9w44TwKu2Vp9WbB+k5M+5hxMm/IyrSO/N/qVWS4/7gS8EeEfL0GDUOS8H8CUl78Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=xiaomi.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=MH3wMfsr;
	arc=none smtp.remote-ip=117.135.210.9
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40553606A32D
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 08:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40553606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=MH3wMfsr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Fe
	lsLGm3OIsJMRghgdPAN/WSMG0jTZ6UF/BA+N/J5Dw=; b=MH3wMfsr+91tP98ioa
	WxBSin2xEDbztiQxdRz/prROR1Dw4i8vM7x1NWXqssBG+jWcgbtAp5MFkkBGw5Nx
	KCRFeSdcA9i3apbeBtoofVHU+OH/i9JcmQwWWL4hNrpKyEvRBDM0XvGUnag2c6TP
	R8WSLPQjsndIKo3PDLI3JcyW4=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3V+v5Pglr3S9kEA--.12822S2;
	Fri, 27 Nov 2026 16:27:38 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
	Tangquan Zheng <zhengtangquan@oppo.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	sashiko-reviews@lists.linux.dev
Subject: Re: [RFC PATCH v4 4/4] mm: swap: allow direct reclaim for synchronous multi-page swapin
Date: Fri, 27 Nov 2026 16:27:36 +0800
Message-ID: <20261127082737.3625032-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-216091@kernel.org>
References: <20261115024455.1465726-1-zhaonanzhe@xiaomi.com> <20261115024455.1465726-5-zhaonanzhe@xiaomi.com> <sashiko-outbox-216091@kernel.org>
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
X-CM-TRANSID:_____wD3V+v5Pglr3S9kEA--.12822S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrW5WF48Aw4DtFy7trW5Jrb_yoW8GF4rpF
	yxWFW3KFs5Xr10yFZ7ua1kGFZ8Ca93XayfGry3Wry8u345Za48ZFZ0kr1Uu3WDCwn3tanY
	qrsIkFW7X3WqvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UkfHUUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBoxvqumsJPvvtvwAA3d

> [Severity: High]
> Can setting __GFP_RECLAIM without __GFP_NORETRY or __GFP_RETRY_MAYFAIL
> trigger premature OOM kills on order-2 swapin faults instead of falling
> back to order 0?

Agreed.

> [Severity: Medium]
> Should __swap_cache_alloc() unconditionally override the GFP mask for
> order 2 here?
>
> __swap_cache_alloc() is shared by all swap devices even when zram or
> CONFIG_ZRAM_MULTI_PAGES is not used, and when multi-page compression is
> enabled its order is configured via CONFIG_ZSMALLOC_MULTI_PAGES_ORDER
> (1..9) rather than hardcoded to 2.  Or'ing __GFP_RECLAIM after
> thp_shmem_limit_gfp_mask(vma_thp_gfp_mask(vma), gfp) also overrides
> defrag=never/defer and caller GFP restrictions, and placing it only in the
> else branch leaves out the mpol path while causing shmem_fault() swapins
> to behave differently between CONFIG_NUMA=y (where
> shmem_get_pgoff_policy() returns a non-NULL policy) and CONFIG_NUMA=n
> (where it returns NULL).

This patch was an RFC-stage exploration specifically targeting synchronous
in-memory swap devices (zram) at order 2 (16 KiB mTHP, the primary
compression granularity), to evaluate whether allowing direct reclaim could
avoid the partial read caused by order-0 fallback.

I wanted to raise this point for discussion first in the RFC, and will explore
more generic approaches going forward.

