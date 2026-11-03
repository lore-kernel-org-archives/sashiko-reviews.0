Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793678790;
	b=Xv+fLuoekD8QsK3e9q6w+A5Gmg1+Bj9Zjvfd/QegZIVhvNZAQws+bW57NA4EIArQ+Hnb
	 5xGpLZVZ7KKxk+keo1ihYff7BuIIbU4N73YxBVKnKQ/NRLF2vCz2EzSvA0THY3eDOoT/D
	 Fjf+J5ezo8Ivh3gJ2lRxoBNQdY3pESvwhAZhNExBy6utqswsWUO4Mi0kN7cGGgaTFemmr
	 hGtf+GYYKTb7FKgACB/Oe0LH42pS+YVdqGYsP1XDzsaJVTaDQVpcljHE6dtySsaDctXba
	 uQIrgOV8HWmwYgvK/LL0qUzrJ2O9HQq3XjNZ5tlbrJh0q823LG3xXRPGszvLMskdIZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793678790;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Language:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=AcFqDwtiV6rX/1kiFJP1UgoU1QYRoQe7e9iwLBlgccg=;
	b=Fg/SkwrY/7Ph6um2RRXy+Cjn7jegIIamteRNsEElwsIMWJFZWk7mhl6FaM3bhWP1OJ2f
	 Jas90BRxL1d7K6FNBOO/PhS+EqgYJ5mILnSbsUmeFQg2C19EWspXSxQaF60u1AW5zjmkS
	 0rshEE+kC60yvXE7YTKOR/zIxuRr1H1/sJqSYLiY1GqdPKivBAIbdVAxbBXSWRRoGYIBT
	 J9pB3gl9j4oGuzkGs0yOgmLNArvdbtfuqK5cZD+a2ehwPZIRgvuAvnF6/K0ePfW2lVHZ7
	 7+tk4JpwanVlnBb+OVsHGSJ/iaFWrhNN8Fx37ZN7fEBEBHXfB2YPlI45VBT92yxg+zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="AiCKDC/D";
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A75E606A324
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 04:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A75E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=AiCKDC/D
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AcFqDwtiV6rX/1kiFJP1UgoU1QYRoQe7e9iwLBlgccg=;
	b=AiCKDC/DGECtzH42U4ECstiLVnkgVLuQrpERgYTGnpzUsnegWgKUA6n88EA/TiKYbKrlhlM0j
	4nIlEr7UNR4uWhR11O529qeX4pfaxLI0TJDWlf/ZK1m/i1ghtEsgxpz4AWzl1U9IGBiFr0+fy6r
	iFxjbLV5OssO8j+iBcjgOtE=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jJZkZ2WFLzLlVb;
	Tue,  3 Nov 2026 12:06:14 +0800 (CST)
Received: from whupemk100004.china.huawei.com (unknown [7.152.185.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6AF8D40563;
	Tue,  3 Nov 2026 12:06:24 +0800 (CST)
Received: from [10.173.125.21] (10.173.125.21) by
 whupemk100004.china.huawei.com (7.152.185.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 3 Nov 2026 12:06:22 +0800
Subject: Re: [PATCH] mm/hugetlb: clear the hugetlb flag before leaking a
 hwpoisoned folio
To: Mani Tofigh <mt4022@columbia.edu>
CC: Naoya Horiguchi <nao.horiguchi@gmail.com>, Matthew Wilcox
	<willy@infradead.org>, Jane Chu <jane.chu@oracle.com>, <linux-mm@kvack.org>,
	<tz2294@columbia.edu>, Zi Yan <ziy@nvidia.com>, <kaitao.cheng@linux.dev>,
	<sashiko-reviews@lists.linux.dev>, Muchun Song <muchun.song@linux.dev>, Oscar
 Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>
References: <20261028-hugetlb-hwpoison-leak-v1-1-77ce56002523@columbia.edu>
 <sashiko-outbox-189633@kernel.org>
 <0043912c-4225-4d2a-a8aa-d160c832e7eb@columbia.edu>
 <ae6058ae-3703-a1d5-d82f-4102b46f227b@huawei.com>
 <5b5dbd0e-6f29-4573-bbc4-1d07fbcbf1fd@columbia.edu>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <add2352a-cf04-aea1-d253-e7279b18bcbd@huawei.com>
Date: Tue, 3 Nov 2026 12:06:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <5b5dbd0e-6f29-4573-bbc4-1d07fbcbf1fd@columbia.edu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemk100004.china.huawei.com (7.152.185.74)

On 2026/11/3 4:24, Mani Tofigh wrote:
> On 11/2/26 4:17 AM, Miaohe Lin wrote:
>> But it might still not be a good idea to add hwpoisoned hugetlb folio back to hugepage_freelists?
>>
> 
> Agreed, but that's already what happens to any hwpoisoned
> folio when the vmemmap restore fails, both here and in
> dissolve_free_hugetlb_folio(). dequeue_hugetlb_folio_node_exact() skips
> hwpoisoned folios so it never gets handed out, and a later dissolve tries again.
> This patch only lets unreliable folios take the same path.

I see.

> 
> 
>> Also, with this patch applied, these raw_hwp_unreliable hugetlb folios can be successfully
>> unpoisoned now? IIUC, after hugetlb flag is cleared, hugetlb specific information can not be seen
>> in unpoison_memory, so they are wrongly treated as normal pages.
>>
> 
> Good catch, you're right. I'll make unpoison_memory()
> avoid this in v2.
> 
>> One last thing, Can the problem described in the scenario below occur?
>> memory_failure -- VmemmapOptimized hugetlb folio but hugetlb flag is cleared
>>    try_memory_failure_hugetlb -- It's not considered as hugetlb now.
>>    TestSetPageHWPoison -- For subpages of VmemmapOptimized hugetlb folio, this could lead to problem?
>>
> 
> I don't think so.  The hugetlb flag is cleared only after
> hugetlb_vmemmap_restore_folio() succeeds, and if it fails the folio goes
> back on the freelist still as hugetlb.  So a leaked folio always has its
> full vmemmap, and TestSetPageHWPoison() on a subpage only touches that
> page's own struct page.

Makes sense to me.

Thanks.
.
