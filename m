Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493696;
	b=tvSSFg6VeJHHpn31HMf3UfjIVk9jjCeAQGGWJT3oDPr01aafC8/LR7YlA876IPhJgN1r
	 pN9ywIVMnkfmeWFf00Sy0LmXI/Oti17HUMBisHyDl78NGi3MIoObtlI7ktldIPoxCwrz4
	 yrrFTQAu/O9zS6nzH09f8Y0JCBvFRPAjTGFIBP97SN8VHBgh2BVGquBxGGBmo6vdSQn4k
	 XfN5kQVJFSc2W69q9goJ0eKSYrBr8/iGVo1uMU/S+pRUGk1YQh5w2ECjMxYawxPsBAesA
	 n6zokU/GwS0eWoICeGh1oKBBjm8V8fGvnFgvW8lI4sYkg6M2U5c4fsPG2kyZIFqbyoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493696;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JGHAVjE9egfx0TL5yO8Wnc3z2E6MAvDLE5lotamLz9Y=;
	b=3VOSvUHlrJgXef7gR4UyMk8xikbSQSPF73Vuj9ILlgVrCPmlcklj0P67Yke9+e2tK/sb
	 8cArY603JMw15GLPZF9c4Vv+aqTdVwiRG4x3FK7TB2g++DsCzhpftj3Wvrf60wjLt0YRq
	 46ZRZznN8xUVC+oNeFaWF3HNUv3WKoPC3F5+vyGudBKqOF12ToAh9qh33fJEYOdmzGXhz
	 q1U/PIOx92q2n/f75Icx2gMazGsEuLvj1N4E3Pv+El2p7XuLeInwIRaVxKQp39KsA0D0/
	 pMytoZb2ktbp6tSnxUowV6ITM6TswDQ/HZ1Pg6ZKtvNjYJ1rsepfus2RO/teHEd4g6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ejuTkYDA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF17606D54C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ejuTkYDA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F431F00A07;
	Thu, 12 Nov 2026 14:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794493696;
	bh=JGHAVjE9egfx0TL5yO8Wnc3z2E6MAvDLE5lotamLz9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ejuTkYDAuxlddYFCBL9BkEFpRcy8oWfjdYzMbHVPR4/aEGTyTGwLhh8dqsUFK4ZOd
	 0O95S/EgTBmW0CS93Qqd/QhttL6y89c+zd+DFsIG5KO/UfoS+Ql0RXR1PVCMN9aw/v
	 t22iRl7bfHL2rkTqFZ1iZ0sUpXnrn+aEKS+RufmNJk/lRwHoGdxayaKUVo0/VaRCgN
	 XbvT/NMikv3xSj9YmM/q9NhtjBtkBnJ0vIY1aXFaUpjUVhmfnkJpWMEcmP8ialBNXS
	 dM71BGOvqMpK4dhe2JwQEfMObIxTzDdBtnf7/mgQlQ83NPCtxI3trq2wxI+pzw2CW4
	 AnnA7WEHroVCw==
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.ams.internal (Postfix) with ESMTP id D3782198003A;
	Thu, 12 Nov 2026 09:28:04 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Thu, 12 Nov 2026 09:28:11 -0500
X-ME-Sender: <xms:9Mz1aow8wOBRRrvcBTNdEbXatcZVGj3_VkmONVfV9u7cF28_kRJWCA>
    <xme:9Mz1an1n7GllvM6tFpr0U77bzzoZeZzQ5jFS4Vgl2E9ZPpBnosrwQvhmhfUNYbkJc
    ehuI-mtzsc9ZOSZZMSqYmC9vQqOdr0OE0ZmZzJKkbMznmZ45kqjkRxU>
X-ME-Received: <xmr:9Mz1ahUD8IO9wm4Hx1pNkUKSlEi8MakBOzQ8eTsi9tE0Qa3an6CHg7cin58>
X-ME-Proxy-Cause: dmFkZTFTIeiygbRCBA1nU4GEH05qhStamhmNSoX0vHPTYZdYgAMI+CMH3M3m9jAOJmtlqx
    4CxZn2goV6sPlbh99O7NOAxJ082JAqSwWcexA+j2sCeoqqSCMWizR4n1VLKNjNnjVLK8z4
    FjyJbbS1lT+ccXhQhAOQ6e+pGzIY5WNJqZA/1/7tODdBCIL8FBdgka1io5Mnhan5LYD+uE
    IPip02MQ+Ux0ZDerQGeC0PcqiZpBPD317wk7pWyq3SMCU7w5oTRFis8+whrQbxVTXetaHA
    A4dynw5FjykDkomkb4d9RmZNDszj76xdTTB0vm2rGWEreC9ICrVcQ9IbeLBVw+LV7Q7nT6
    O0ECVWoP3Jb06bLRKhhGN/jTAwjd+4ax3nV0kC19Cr8N73m0yC7QMcEWorcQKcAEKBtSES
    VoHcAVKgZjLeLpbCJhzS0to/BMGFk9x7IhCReJWSoFbx/iRUD/KypKv1iJJbOz1lsSlKmq
    EDvlWlD/Hs7sX8NJ8/9F5msOAYBCwQ6QBXuDT0aTcaI+4NqPR5Gs6WgyB31fRCDp6ZFgJw
    Mp1YOoQDNX9Gtg6M8/ydAp6t5cRtIE76QMGBdQvmL3Ony5AnW+954zST4t5TUE9R0b+CY3
    xLsSompzBNs3kwgEp5MSu84k6BIefMNejtFogqv9QGMLkiet3f3ruQ8whz/Q
X-ME-Proxy: <xmx:9Mz1aoJRry5AJkZ2MMVegsOn4HORQAooppu7YhbjeEZm6HMAXD_67w>
    <xmx:9Mz1aqc8J3nMWPYX6MUv9jZJ85XR2Er911GLJsaaVySsdOkK2I4ReA>
    <xmx:9Mz1aoQg2-rFOKOjAQEB52tL1uK7s6qpZScuVwYbLi3akUwed6rNOQ>
    <xmx:9Mz1aspVfMaa5kgLYS33tyPN9gJG0YTo4FRhEgoCoLV5zJuJdqLZCQ>
    <xmx:9Mz1ahVhJJuv7wJcZRyyDnz7nbZ8VT7_UegZKk9UfI6OYC_FgQZuanre>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Nov 2026 09:28:03 -0500 (EST)
Date: Thu, 12 Nov 2026 14:28:02 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jan Kara <jack@suse.cz>, Hugh Dickins <hughd@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Harry Yoo <harry@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, "Liam R. Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Pedro Falcato <pfalcato@suse.de>, 
	Luis Chamberlain <mcgrof@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, linux-mm@kvack.org, kernel-team@meta.com
Subject: Re: [RFC PATCH v2 07/18] mm: free the pages waiting for a grace
 period before isolation fails
Message-ID: <avW-RbkC78FkS7_n@thinkstation>
References: <20261104130118.2507513-1-kas@kernel.org>
 <20261104130118.2507513-8-kas@kernel.org>
 <sashiko-outbox-199100@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-199100@kernel.org>

On Thu, Nov 05, 2026 at 01:03:37PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] mm: premature NR_FREE_RCU_PAGES decrement in rcu_free_pages() skips sync

Only the zone's last batch can make zone_rcu_free_waiting() read 0
while a work is still freeing it, and the pages reach the buddy lists
right after.  alloc_contig_range() fails as it does on a transient
page reference, and offline_pages() takes one more pass.  I don't
think the window is worth closing.

> - [Medium] mm: stale outer_start in alloc_contig_frozen_range_noprof() after RCU free merge

The first case is real.

In v3 alloc_contig_range() finds outer_start again and re-checks
whenever the check fails, not only when pages are waiting.

The second case is a free racing with isolate_freepages_range(), which
can happen without this series too.

> - [Medium] mm: page_is_unmovable() treats freed compound PG_rcu_free folios as unmovable

Valid.

In v3 the flag stays set until the grace period ends, and
page_is_unmovable() counts a large folio with PG_rcu_free and no
references as movable.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
