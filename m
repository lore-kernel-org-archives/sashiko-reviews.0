Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494813;
	b=qptaH4cUcIzLUTj4ZPcWoZ0bgESn3RHGV/21PFJmiiTvArU9MSJR931M/Vumtw14VFqy
	 ykNud0XBRaayo9nMcCceq0THT83maitr/BEO6JH7A6Pji4iZYuxgQ4mY3aKE8DewdfkC7
	 DQawvehxqt6tV/MxDVnRZk+HP8QzgTjDw5qb8+nQtw8Z1CVHX3MPxIqa6TV3wEX/lmpYV
	 oAd8yd/JwyN3JLtlFqABwFyAo56ifFxf/UMfnHN7wv03iarheJOhRS+WRKQC+0/sTW/Ak
	 mLJxSYDz3e+HSiiD5SyQygT40ZRQ5MCxBN+DNtDdisynB9W9tDl58NdSp1xVNbPSExw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494813;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6YweJ4ATSwAQpdC3B4Lj/lC1Mz6y+Skt6vUq+MxWglk=;
	b=Z7JRBja6TMv8NTqqHWiGtvVMZXFPGM/wPpsT7A6v6pSawj5bRyNzTDOD9UV8FwujPbF/
	 3FJ53SfaAt47MHgLdWWAbmUVhZAOAPplBrHYSkmpd833Aw049ZK3EzZkmWaN0ZA3t08cR
	 RKJv07A2AW/WvkHTn/9k6UJw+nYzigmkXcynn7mUnKIdFhw7fO1SrbDY2pNuLpdk8AdcW
	 JrjxG3pS6WFCNZc2HLOS7HD3VaOidR5yOo2v7nP1bvPZoDLn9hjXapqEZ8rGJkw/LOdug
	 MYQ8C35x7j14dTzAvhr8k3hQtpu6EOwAl4V9fXH2kec8sXRkOu0PGeSOqmgAv9y5wFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTQamDpG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF21606A33B
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTQamDpG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FE11F00A08;
	Thu, 12 Nov 2026 14:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794494812;
	bh=6YweJ4ATSwAQpdC3B4Lj/lC1Mz6y+Skt6vUq+MxWglk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bTQamDpGyMVV2YlIgDlfQjG/7pUPOU4QeYaMTeXznWGJXoiS7thfxwzGVRpGzm9iE
	 8Uwirs5X9SIBjpT7kPq3KwVzKRZ8wfKiCZlPDd3U0Iu40ai166PKHxgS+jVshYnOhb
	 fNawnjkGUvZzp9vZaSG1SM9CxqySvd6ii5g5klVF7XuMt4pRXuXA9FxosJ7uFsco+V
	 l2KzibLUym83vzjNnU2UwvPnCRu6H7q38NOjWr3L0TEeL+u0xCgGuz0O8IsX/hZiBC
	 GfwGytMoxz4TL4A9oQvMs33xr9oLcTx/CJQk4x3wWrDC3z9JrbuHOrsz6RrRF0XBEp
	 KLJPI4JyuYGsQ==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 8F361198003A;
	Thu, 12 Nov 2026 09:46:41 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 12 Nov 2026 09:46:48 -0500
X-ME-Sender: <xms:UdH1ahpGL7jUPQjkAJRl2JhIaeaGv8tVQ9u6odzUqHPBriRGKQGDJQ>
    <xme:UdH1ahM7OXB0snsMeUK5nrOtiIHoVLQbZBwXBuMbhrqbmw3f71-kFPxpQtHLEZvu6
    oUin6n0C6URjJMIF2bPybPHEczYghBtQigBW_DzRFJhl6a6h5UXfII>
X-ME-Received: <xmr:UdH1avgQkuuFdq9uQ9SCs9qSpEBoDeprsnjzqhAR-9vUxe64so3jh43n8hk>
X-ME-Proxy-Cause: dmFkZTFZXCPOdpgoG7Sn06VYsFtSSOVX4LvRR+IZONGtpob6pMpAAKO/67brjXXiKC/yqt
    PCnhbCbvHUOoVYCNT4kVjuveGw+dXvIprFD/YACgqbtnel/TmFMV6qGskDYUa0P8h3Od75
    wrI/nnPxoscSdAEJx1gJYLeSoSvZIyEQFlDGL5x+GpMb1jaNZHzRlgCV+E3Cu8RgWJK+9e
    BsDvN+pM4I2WWFu/gxlAAso9/LyfSk55MURq7DRxPKfBR2AVy6mcitcvb8EC1zSjecqXVf
    g8U8l32ogRWuJQCndXaeCOZwVCIK7+RsqRc8uDYNYEtot18m3Tu+IX07SgfKp5VRUjIyKq
    j4kRNug8fCs72e2RK9boHuMIh2JZ2XGBklGuD+2DcGj8tYzVQHHJKtbfASFUEPwIHpjkku
    ddqC/C4SI0gyTEpk8FijU2gaINJFeT694ExXq6/ngFUlw3HIIY6+v7r73xIaxSms06tpPO
    nGsI30IFUeVVAVDvEK5+uPDFKoT3d9REgtvDz81UtDvHituV7gsg+SWaOEuojwNplJ7/Tm
    ZJ0jfo/LKbuo4HKiPIt5GP+SpqH9xe5udyuOJJ05B1Zk28PZ5NEzrTNwbYVTLi1kDLBMg7
    FPj3L2omtFfHnSqwIyGqJobSo5ulLYr3DB3ZddEHBuAgoVg1iuVmNWmOxWhw
X-ME-Proxy: <xmx:UdH1anSuIXUCB0mZYpoiTtzk9D5vNJQY2WyL_6xOVXXY_1_7K2tQYQ>
    <xmx:UdH1avWiYN6nhjeXMunCKXAjjz_PgW4CnuGRIdT_7Rp3DAyZucq8Ng>
    <xmx:UdH1ap482GbXSt_Cej7PhQkdzn9CopUhK6PaZyDjBgviMlsGbv7GXQ>
    <xmx:UdH1aq8G5E7g7yv1IM7uzeTJkytrcfZkJmB6vvtNuEzUug0B1zLedg>
    <xmx:UdH1ahn4tNaiOyi6IckarLgDd3PwKQQdiZ2nevXMjGI65FM5QHh4nrOR>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Nov 2026 09:46:40 -0500 (EST)
Date: Thu, 12 Nov 2026 14:46:39 +0000
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
Subject: Re: [RFC PATCH v2 08/18] mm/compaction: free the migrated folios
 that wait for a grace period
Message-ID: <avXQtaMRRsSNAJcT@thinkstation>
References: <20261104130118.2507513-1-kas@kernel.org>
 <20261104130118.2507513-9-kas@kernel.org>
 <sashiko-outbox-199101@kernel.org>
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
In-Reply-To: <sashiko-outbox-199101@kernel.org>

On Thu, Nov 05, 2026 at 01:03:39PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mm/compaction: compact_zone() misses pages captured in rcu_free_drain()

The capture check misses the same spot without this series:
lru_add_drain_cpu_zone() frees the migrated-from pages from the per-cpu
lists there and can capture the block just the same.

If it is worth fixing, it is a separate compaction patch.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
