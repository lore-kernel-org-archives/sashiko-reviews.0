Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098321;
	b=gxSQEcyDxN8gEk3tjNlox8fazE5vDD+jPt9Z0RW2QPoH5WygNh5X5JLsfrqmlm50dkoI
	 AtsIqUSJW7VZcnB8/+ySIPVaWXUzJGCImSYPJ5FAGKcRA2RdW3mbzixJQkm4ztUrEauxH
	 mL1OfPnM4tmX42uc8OIdQ349oaFxiTA9r97DkzQMndR2+JniyCkeiUhIJvgPquIp/RRMJ
	 jDY2mFH8p/wZLz5olkaEzDE+oGRdDY7rWv8GU3SLiwZvOMWIrC+QnvnKFlaakOKTL02AA
	 5eHKaOq78vm8yHEYClc+pc7M2F0Jhs+9p8S3XhKS7FFqVM/AZpZb8vDl/0HaxIcRpKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098321;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=cLynK9rI6KVHHV5vynGMOLFNSB/FofZaEE0s+Moc/io=;
	b=bJV+CPH0Zd6vygJ9FvJ3D/WM92ePOzmKTR1SzxuTfz4Q5//Ru/7tBr9Jio/Jg1NHPWfa
	 cQ3/XvNcBqs+m4YpoKs/O4LUNRQIwq6zKNPyMQzuI1bix+wTvtGn1FG3VT76C/e6myWiM
	 xPiwMd62U52OdLicCWacT3RJ+k54iiIJX2LFtv6hlBvjjnXyvJagl46M7swnZ0tZRRGak
	 rUTDQZl8jm+bxSlz0qMGmalHuanvKn8qdZTE1grrq96YLtwkj5WcBaImpNuLKgMlBP6jR
	 LEK/V8uE0OfsUed40GrpRe1mUA7/aJIipTg+OHOI4u3n/BC57MVgPKjWfB5qT9trDRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IDrod4P1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F351606A320
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IDrod4P1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4C41F000C5;
	Thu, 19 Nov 2026 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795098321;
	bh=cLynK9rI6KVHHV5vynGMOLFNSB/FofZaEE0s+Moc/io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IDrod4P1ieJbAGPWjmPQPtOTc9X1Ng8ZRAlrI8ClM8Gu8XqsbLrPci061hx8PZF7R
	 l7vXNnqkeF4ezcP5d/OuMPyeoKGkAacbMNCuFJFerQtPERM8637diU5JpmH+DzmNs8
	 DkqGasvSyJFzrIQDXq4oNBHjcFtmNODTSQLzwDLDNHt8rvEehLz1rDFZK9TGG9nvPW
	 bwudyikFhWGeBgp0AkdeCnUZRDB8ogTi+nLBPRzGto/T9s0hsKpHYGJ4P1ShYjusb/
	 04Em6iGUTMCzVKveykBsA57kMgzV3h2SbeAC62fDK1tZ71ty2uDX7COEJYxQn+7h5z
	 AY1vGWyN92adw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.ams.internal (Postfix) with ESMTP id 1D32B198003A;
	Thu, 19 Nov 2026 09:25:13 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 19 Nov 2026 09:25:17 -0500
X-ME-Sender: <xms:yAb_ajYwa0xGmjjyiPwmlNXbfb6SCtKLEb-oiecfFag32tPac4cABA>
    <xme:yAb_ag0cLW9DbNh-N-f-DLBd08eVUHCSXj7Vbvfz5GAkUBEq4srWndqBl8WC3V7MG
    LyTucEVB2IHHZJgeX-aoZG55sg089zLao6hyxPzAw-7lIdcqGvwY8I0>
X-ME-Received: <xmr:yAb_atEm0f78LD64EwOqi6_WMpQ9JC-RMsM3szUyFuYE6PsdZ8N-brSUPxg>
X-ME-Proxy-Cause: dmFkZTEyNuBZcyS6whiZmxC1lPTPh98c0PDODIZIONg4xEZnvcdNcvLLf0dpDMgukyinEM
    s374CaO9qOQkbKT5ul4KybIbKSCs4mSlOU2vpAuqjlJBQqRr5msdLH18Cvdak2ci5SUpEM
    ojUwjagj/QtGma40bPhTC8X+i0VdnV2PGzd4p9seDzIRTajT7DvS1CV24k3z8W/9jXsf8b
    9ocM6fiphebBwyYCSQ+tdPFlsVkRvGUdu6NL8Vdm7bf4hRLKDvILvELQxCrbr4l2kLv5Yu
    MmQOPtr+/zORv/Wt1Z8vw1a+trobbn2CnVOsOWZc38cVITj2uZDA79nLjieJ1jy8HTqYZm
    iRB52e+MxokyasTTed6RpxBUR8HxCpXw5hwVJoGsIY7tgX1LRnXmQb3W9tupmY/oUrOS75
    1IzXG6PGE1nGzZ8r9xCNLd/myv1AvBjfqoWguiyAQzwky9Bgakg0En3QDuhPkcLCjBuTFk
    AMygcvDTL2p/pD1ZB0YVG99xIZPJVvs4yCZRJiHUOpGbyIEcK7oqbjzeqJX3ACWvrilpvw
    cmJ18yCygTmR8Au9BiEruO5qZHGGbPyh+yvmyaNESX0cDmXoeE5DMZCB2VhNvsBQS9aOZ2
    iDExYGMi/xXicMSC37rfNA/pIM4xIYwCPJ5w4/Q76cdg3cFrbgg4PD0nYXCA
X-ME-Proxy: <xmx:yAb_atMB1CACTuD4wZI6yL3uPxsszht7Fysx6ApWKlr_flkZs1FpTg>
    <xmx:yAb_aiB1UD5eVFRTOEYV-ml2SpEf2HrFAyQyZwMnpK7ExEa6cWkomA>
    <xmx:yAb_asxTnlX8gppwV5xutOLak29N1oZCEGV-DQGQOGP4Ic8PU3zVhw>
    <xmx:yAb_aueo8VXHYGqGILL2A2II1O4BgK_eRPfMsibsWq9ZLNbM-hgG4g>
    <xmx:yAb_akpZBu_B3tRIscAQuqOOnAtl9C25ApLOLoLngvvtG1X3gA8ASRVq>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 09:25:11 -0500 (EST)
Date: Thu, 19 Nov 2026 14:25:10 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Dev Jain <dev.jain@arm.com>, Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v3 2/3] mm: page_alloc: make the high-order watermark
 check honour ALLOC_NOFRAGMENT
Message-ID: <av8GvDahjRIKXUIa@shutemov.name>
References: <20261116125103.2894162-1-kas@kernel.org>
 <20261116125103.2894162-3-kas@kernel.org>
 <sashiko-outbox-218808@kernel.org>
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
In-Reply-To: <sashiko-outbox-218808@kernel.org>

On Tue, Nov 17, 2026 at 12:51:34PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm: page_alloc: should_reclaim_retry() counts unusable
>   migratetype pages

Not a regression. should_reclaim_retry() never filtered by migratetype.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
