Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495599;
	b=Ik92cPTDm9pmKNtuJXWsDFYjbw0dmMtFZboivznZwnyOu7CV55mnWs/6jnfGzOMU1Xhi
	 CdRv7ggPQ/BYYpQV40PXvYA8awXlF1zW7W04BhTGqJD5motYMXnigi57nQ8EyjljMlumd
	 epEDDNujTdTPQbZG3tOlP3kiLL2eHxQLyzL3NJ2QPhDSDW4U4qmKNcWfalbcSeyJZ8FhK
	 2BGKcOchhtixVlWWNbpth1Gnfc0I4TSPQCK24kSgTznG5CCxn1+cgbcoAevy69riqHIHL
	 4Stm4joIy4zPtMraJdnHSbeucZqxcl152qq2Ikjh3LvPk5Rqo8SGiDov34E+tZsrVWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495599;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=92f73/9CRUvx1XycGVQ0WiOmwZv9qXnh6P99S8eFYaw=;
	b=mPDBtO2AxGZR/0MLl/wSfgpu0MZZkKl5Q5oSGOLtisJ8vDx7HIV7IxnqC1rNOzzr0PVO
	 4rAWkbxPYWbt9I3kjFZs3RLEjLGAS/RLDJ9cqdBdRsfTXnOz8tUXIFwouq9C35sZ9Tnjz
	 Gy0o05lltVGJwVTEnyIpSJe6sPmW5N/z4fBcpfKx8sM3jjZm+28THst2DSIN5D/OQX9Ta
	 WjdQn0a+PaZSHhP7dypR7/0z9cbDTUWOGQ9fIOnmqk5OQjR/A694nW4Puuh8qCTm37LoB
	 7VVNs25J4g6UMOj9wl7tEcpP64A4WE5L4ZORxlkFo5h1/u/w1GvEDUMi0swtV5+XJJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lN0NhBYF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19448606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 14:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lN0NhBYF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2F01F00A09;
	Thu, 12 Nov 2026 14:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794495598;
	bh=92f73/9CRUvx1XycGVQ0WiOmwZv9qXnh6P99S8eFYaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lN0NhBYF6MSKjwH4qYrBxBtqWs0Srd63fM+L/w2MB8LbaCOatU+NrC7u46gDPBkeg
	 pnlQhsC0EhtKTFXG2APIyZ8Rx9dSVCz+PudoDUDo2d3D0EZV5nk1C0umAptzosneHe
	 +tMYIslnzpPAUpz3+myupN1WYH5W/mm2+W8nzBy4tyTyYbaziFBJFr3VIpgb1IitdX
	 hASwn853Zb6lDdRl11B6IQGOcajCwcxixVDlsa2Zn6FMDj1+/dNr6KbduVQ1gsPxke
	 zudTNMlTNCdNmWO9R6vGZot73PY0mVnrbobchYXKN5/kcwppN2tmE+t1EiT64Gb5C+
	 zToVuovfuptdA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 6E27C198003A;
	Thu, 12 Nov 2026 09:59:47 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 12 Nov 2026 09:59:54 -0500
X-ME-Sender: <xms:YtT1an4cxLHamg5sYIcUVoA0XrEkaAEGbO6Ar5TZXRLLHdST1ac3hw>
    <xme:YtT1aoL6UqLIiqvXjyDEvc1EkEq8-L3J1rBlN8paZ18P2DDsllZQGtA-3z4XcwXep
    wspR9RrWKz9zfJGNooamnjEKjy7G4ng2Y9KY_KLDFWt4KvgsHvGmQ>
X-ME-Received: <xmr:YtT1auuYmqeLlOqp9qgg-q4x4paBIcUo1VV2zHMrTGvVlv4cOMbqGLCGI7s>
X-ME-Proxy-Cause: dmFkZTFFtf/isF8asN8syO9R8D7ImZyw9S7EENZhVbdmJZv7Bj/fwggTGDjuxjfSxGmHz9
    SfzDwNAGDgi5AT/uPeOC8SB5U2EOL8l1kHKnEd4mgcL3Y0LUEnmx1xI+31otE1VjQpc08O
    FE5QBUYl1ongapLPYt0Fyv6XJ5nPUh0jZOR3rZXkzxWk25xwnsuP92sP5+bzwUJrFWnK5a
    vyUeFTvyf9WPujspMEYtJYg4pzMCdGbEWNmGUUkEVezxbNQyIVxy17II162e3fpBiYxt/p
    aSyjFkkjDsIlLoMD2f90shIQsscdG37PL4qpVypIvNMnV9nUF80ntJOfAasqedfc/atFtc
    VphcJ14tpA1Bfd9IBgIorTFzlAeQWy+5cRtH1MrIQkPOigKp2ziYFQOtNHZumpNwe5nWEy
    zx77jPFCTMhuc4rng8RA0LX2ED6xHo7kuPmu9eVqppgr82LYaJk5mbMu9pthsb7OZ3eA/q
    Wv1RrAPmaa617bdA7Dmayy19Md2uvj7iVZSS6l60n9kDnzN+FYOj4DJuPSiAAVz+O0zHRT
    FWf/IdLf6ih9P36lTu9IcQfCUTdCR0UG8vpq+tqDLGSWFRuTflDT4+KVVIhpo3U5kZI71J
    0SJ8SrW1kAKhJlZD1+5tj1z1rUWRxHsq2I2DE9bEqKs8XGjMB+5Uxfyl0nQQ
X-ME-Proxy: <xmx:YtT1alz6SDp3LuNY3ZUeZk0KVT4aOTM3ZWDhVtbiqqxnwkFuuxvKOQ>
    <xmx:YtT1apWEhU8LI9rRlHDUgds2yXnk1DtbwdXaMlJZUbzFmujZUimcbw>
    <xmx:YtT1agc3nLYmgY9ypCkK8kPPjwZHbPaEEGj-E-MWdfFSKBUYKw3cVg>
    <xmx:YtT1ag4WUAc0Nbno7wpewdcw-F7dQW3zajg5kIhM_qS4mpYbDFIQwQ>
    <xmx:YtT1ak3ahUq9KmPoSl3PHStBCmLcEAsi9l3NOy1sOQv17Lp7MvqOp0gc>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Nov 2026 09:59:46 -0500 (EST)
Date: Thu, 12 Nov 2026 14:59:45 +0000
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
Subject: Re: [RFC PATCH v2 09/18] mm/memory-failure: handle folios with
 PG_rcu_free
Message-ID: <avXURJ6gUjDC6861@thinkstation>
References: <20261104130118.2507513-1-kas@kernel.org>
 <20261104130118.2507513-10-kas@kernel.org>
 <sashiko-outbox-199102@kernel.org>
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
In-Reply-To: <sashiko-outbox-199102@kernel.org>

On Thu, Nov 05, 2026 at 01:03:41PM +0000, sashiko-bot@kernel.org wrote:
> - [High] mm/memory-failure: unsafe RCU wait in memory_failure() already-poisoned path

In v3 PG_rcu_free stays set until the grace period ends, so the first
case does not happen.  v3 waits there unconditionally anyway: the path
already sleeps, and the test looked at a folio it held no reference to.
The second case is real for shmem; v3 checks PageHWPoison() on each
page in the lockless copy.

> - [High] mm/memory-failure: mf_free_rcu_pages() skips sync while rcu_free_pages() runs

The window between the last put and the deferral is the put_page() race
memory_failure() has without this series.  For the counter, v3 drains
without checking it: the drain waits for the works in flight and starts
no grace period when nothing waits.  The per-cpu half does not happen:
get_hwpoison_page() drains the per-cpu lists before get_any_page().

> - [Medium] mm/memory-failure: order-0 PG_rcu_free page dropped after setting PG_hwpoison

By design: the free drops a poisoned order-0 page, as it does when the
last put races with memory_failure() without this series.  The page is
never reused.
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
