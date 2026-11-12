Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488032;
	b=hdibrYKakVKH6RC8DvQxNgMQuqsRIYplg41s+ESHL067jZHA/FXq2bUwDSjF/8owIdhR
	 ninWrQ+nOONLhzjSkxmIGlu35jWDAjy0H3dxGGCGBFLFs5BrhooOStrWeEYFT7fYBoEDr
	 RZPrJARx23XMoZhSQb7d0alg5R0VdIw/JnumNg+mfG62HMXopVSVKzz2X62fChIQGWwnR
	 iI4YhQYTJTLFUbGu74BXuEs8wEefyCqWJJRuy0OROKSJOFFv+UL03Anf+/gHs4rIW5y6o
	 f0Je8kKB6Bn4xP1ScHH3O7PWppGooEl4olV0xED+s/62LhOvoJ3VBe29stX27nBXaQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488032;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5ZrUjxQ1X/We7wtRHupxrDAx8TTm7+SwxqIT1sIDYs8=;
	b=IDTHcfXyJn4x3/ynhPdpT9Yrl8332QpVloIiwk96bsPg5/67NaugZ1jCqi/klQC7os+C
	 1HI3uEnfEJ5uKPAhn/JRj/mVm89EeRnbyQuhI00K/lRegTfj6aU7/p8eY7sjhH4/mGWVo
	 Wkuf4Qc/5Ipd5DAl7+k8bODTjVDs1D/pJPw4TQL29lrNcJXiqqL+dp822JIk53HOwgBml
	 BHmKfO+Jx12GN9K3cys2/UUxwpKphCCNf04NL3fgS7ZoSbzdjAqz4GsJvkomKBRheg/C4
	 3nj9loPwjEhCV6TxhEMmlcl6rz1Pdaa2w4UhEWuIJGeSLdETdESfwDoIcKdZ5T5FzkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KlsD5/fD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3300606A323
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KlsD5/fD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282D71F00A05;
	Thu, 12 Nov 2026 12:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794488032;
	bh=5ZrUjxQ1X/We7wtRHupxrDAx8TTm7+SwxqIT1sIDYs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KlsD5/fDIsqfPCfdiKHytK35h7uvYxYrUze6fdg/0xfS5GdIy3Qdzwoiqxsy6TQxk
	 PvSsHrdDooxG757ynturfT5Jp1GjoYPdtswhj5LJWDhkWNIJyzyTFWIdMG87sY5HbE
	 M4m0dLpdvTw7srV/Tj4KVPWwO3EAu8GLt0g38v0RjbNi/pzaQWmIkk57ti0M0ZRCX/
	 TJLMaw0UQDju14m48deW5o8bwmTU5r8cfHd+WTc6V9CxgzEqzEzAJCWscmUIcN4+TF
	 Li9oK0AJPGWj5sj9x84090j2rjFGMTn6PWIglFkoUaGPiFAcLxKgnhEOXmEu3KNsQo
	 PQsO02yU03ADg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id 5EEB51980047;
	Thu, 12 Nov 2026 07:53:41 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 12 Nov 2026 07:53:48 -0500
X-ME-Sender: <xms:1Lb1avbqYJ96LVa9G8j8KGDf6QPd8ThRC_rCA8Kwibzl1QJFLZE85g>
    <xme:1Lb1ap_mwaYWryEov-o_6hfF_RYnwb4_q81yG3axwY2TJCnk1ON-kRtNwY7E63Hoo
    Bp2Iui6JukMiOK9Pch-yNvVnk26NHqTV7CGCheWsFZzKKCtA0ThPw56>
X-ME-Received: <xmr:1Lb1ao-wZ-pDSr7UYUr1o5q-LriP5K8KoWoFL1Bfzt8jbYDA3nNg76TwH_k>
X-ME-Proxy-Cause: dmFkZTGpc2ngwwYoKY78wwM9oTdiUFMdbNknNo/bzCD9ox6CwBy3Bae6ac3Pn2KNSG69io
    DjjSRQA+ArMHIJlqqToeBv2DuKjHaexSBKpjRpEneCf/9m7ijFudy4tMLdJCDVAS88IZxT
    ljujfxRBPh/0Qww/nQXmrETum1Cv87lC/wq6AdyCL5zA21NYdJmNBPjvIaFGQYxP35tRSJ
    twxmmrXTtBDACJ+v/NMff8Ez7le0JwbqH0qPmrmF0AY2K5IAL9jbb5ji+sFi+IZvYTKKpx
    zx98PLZAbI70f9z8nSTz/ir5t8tP8METbjMjfP3rgKtV/F4AeqoyEA12VrelbA92HmNwOZ
    CN4WcOOMGdlBMYv+tIShCcVMbXgLI9FUUOcLxCfkG+VYluTwDKMLamFXmV6TVl4u1Qhbco
    +jMi2PoHmBpKwD7Jg5LQa9R3aT4xxrRvXo9PDh4HSvq/QKEJneRRCCN78AXBKQuQysNSMe
    uxj6c+RTR4+wEuvLnXrbXNAk7rxkIi8ORKAq4MDa5dfN5RsAUdLvr10rxV6IDFsWcyJPb7
    VfsIuBEsJ0Yljqod7sr1P9kFBYHd+sl+NzWhPsaMMTek1s5yD5hX0US8QTepnvYqzX3IWz
    ob3uAdU9lh/SDU/vM7t2Ngo2ShIZ0DHmL+ghORCbgdu3QNhRGsC5YdMsyFQg
X-ME-Proxy: <xmx:1Lb1anTK9w0SORBsrIHD59_zPH5qQSLYxXO5V6-EBHGKi9QCNPTNcQ>
    <xmx:1Lb1arEnxAIYkN5wbK3s5QBA-Vllj9jy5zLl0qwAcyCwSYPUMKTvsw>
    <xmx:1Lb1asYvDtdgz37mQGWjQOAjMXf7ffZSS22pO1qw5MXJfDAyH0rSIw>
    <xmx:1Lb1auQgx4SSpt8NmB8AZZe6ZV5XL-P0HWnOnjyEQKdoAnWn1hbFww>
    <xmx:1Lb1aic3bpvJ1B6a2XMTHFufFqpCG4HjwMk7D90AUjH1BVN7gqdmfiPE>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Nov 2026 07:53:40 -0500 (EST)
Date: Thu, 12 Nov 2026 12:53:39 +0000
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
Subject: Re: [RFC PATCH v2 06/18] mm: free the pages waiting for a grace
 period before OOM
Message-ID: <avW2llfFWagr5Cmi@thinkstation>
References: <20261104130118.2507513-1-kas@kernel.org>
 <20261104130118.2507513-7-kas@kernel.org>
 <sashiko-outbox-199099@kernel.org>
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
In-Reply-To: <sashiko-outbox-199099@kernel.org>

On Thu, Nov 05, 2026 at 01:03:34PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] mm: order-0 check in rcu_free_wait() starves high-order compaction
> - [High] mm: rcu_free_drain() misses rcu_free_workfn() and PCP-freed pages
> - [Medium] mm: rcu_free_wait() counts unreclaimable pages after retry limit

All three are valid.

In v3 the drain moves out of should_reclaim_retry().  It runs after the
compaction retries, before defrag_mode drops ALLOC_NOFRAGMENT and before
the OOM killer.  Reclaim has given up by then, so reclaimable pages are
no longer counted.  An allocation drains at most MAX_RECLAIM_RETRIES
times.

The drain also waits for rcu_free_workfn() and drains the per-cpu lists
the works free to.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
