Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611087;
	b=p0OTThZkmd0WxFeuVTdVWhIJ4v2/olaapsZ5cRWkmVTHHdUnYeaepd8/AWRAhgRJDKlG
	 T4ooHyKCOY6Qd9hnNHMzd/rH2pZ6EQc5HjAKj9ZstLcVmw+ztjdJ1lVUKbtldytO5npki
	 3tTtHTA0YNTM4TSkWboMZSSeaCQEyeC/rRuiNEVjU+v5jdNd48x9AKoOuwZCj5s7LFOW7
	 POKbtfavwRWmi4F7mWn36MvSrAra3lUbZvRG0PGET07M9KN0bYzLqCHva5VHNMfnLm2p9
	 Xgp3qyBYVliD1TJzdufVVAxn8jhgCO4Je1yOBlvWeAqGZ3e4nzRdRitVcq8HeNIss8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611087;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Language:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=3cY2UudyvcyVZyFhsHmGpx4qCCcBQj/0zwP0XEW/fCA=;
	b=U+BSdRVvSwqpGq5tjWcKFnuNmATdEgwlWxVOgxTANFIdVQ/d6Bwny2Cm4XE/3/FAgPtd
	 mojlQTbmkB6Sck/FDP9W/SXvGHrOBBBd+oHDMW5yVeb5xnQ0E3NUKvwXvwPUuS51qochw
	 roMlJydrhDHDZj0n0pY9be+KnHjowjvxEyh+a08+5EOu9pbTatH2ZC5cMZ9IVeh8jLxF4
	 wQK+YXMwxI5owGiXVAxhZ3zuQwMXBntZmV560bfYvxMNPLRfLuWl+Jyrs/XLNypF8K5/S
	 tTbnxod4WJ9TEuyTLosOz7onAsOJaj4/SbT9K24ArZu52scpY/P0vaho+FWyOplSpXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ClPd2EYT;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635AA606A324
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 09:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635AA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ClPd2EYT
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3cY2UudyvcyVZyFhsHmGpx4qCCcBQj/0zwP0XEW/fCA=;
	b=ClPd2EYTruqDrFTIBXxg/SxZq0NfcKldWhARt3Kkf55FBkuk01TQ1hobDJ76BSvLhuF/XNLZI
	xmXfDPPmr0gsTaH0wUbz9XT1809qZ2ssd1mKYfdQqf4Mr/KM1iwzGdZA0lRmAP974K+A9ges6qe
	rsw7uo9T/HKBPirD6hjSrdM=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jJ5hW4QkdzKm8l;
	Mon,  2 Nov 2026 17:17:47 +0800 (CST)
Received: from whupemk100004.china.huawei.com (unknown [7.152.185.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 01CBE40561;
	Mon,  2 Nov 2026 17:17:52 +0800 (CST)
Received: from [10.173.125.21] (10.173.125.21) by
 whupemk100004.china.huawei.com (7.152.185.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 2 Nov 2026 17:17:50 +0800
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
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <ae6058ae-3703-a1d5-d82f-4102b46f227b@huawei.com>
Date: Mon, 2 Nov 2026 17:17:49 +0800
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
In-Reply-To: <0043912c-4225-4d2a-a8aa-d160c832e7eb@columbia.edu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemk100004.china.huawei.com (7.152.185.74)

On 2026/10/30 1:56, Mani Tofigh wrote:
> +Cc Zi, Kaitao
> 
> On 10/29/26 11:43 AM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Critical] mm/hugetlb: add_hugetlb_folio() clears HPG_raw_hwp_unreliable on error
>> -- 
>>
>> commit cae6d1104a254ddb073fab05f2a9308005af88fa
>> Author: Mani Tofigh <mt4022@columbia.edu>
>>
>> mm/hugetlb: clear the hugetlb flag before leaking a hwpoisoned folio
>>
>> This commit moves the folio_test_hugetlb_raw_hwp_unreliable() check in
>> __update_and_free_hugetlb_folio() to after the hugetlb flag is cleared, so
>> that vmemmap-optimized folios with unreliable hwpoison tracking are leaked as
>> non-hugetlb folios instead of causing dissolve paths to loop indefinitely.
>>
>> [Severity: Critical]
>> Can moving folio_test_hugetlb_raw_hwp_unreliable() below
>> hugetlb_vmemmap_restore_folio() cause hardware-poisoned subpages to be freed
>> back to the buddy allocator as healthy pages if vmemmap restoration fails?
>>
>> When hugetlb_update_hwpoison() fails to allocate a raw_hwp_page struct, it
>> marks the folio with HPG_raw_hwp_unreliable and frees the raw_hwp_page list
>> without transferring PG_hwpoison to the subpages:
>>
>> If the folio is later freed or dissolved and hugetlb_vmemmap_restore_folio()
>> succeeds, folio_test_hugetlb_raw_hwp_unreliable(folio) will now return false.
>> Wouldn't __update_and_free_hugetlb_folio() then call
>> folio_clear_hugetlb_hwpoison(), clearing PG_hwpoison on the head page against
>> an empty raw_hwp_page list, and release the poisoned subpages to
>> free_frozen_pages() as clean pages?
>>
> 
> This isn't something new with this patch. dissolve_free_hugetlb_folio()
> already drops raw_hwp_unreliable the same way when the vmemmap restore
> fails. Zi's change [1] to stop clearing folio->private in
> add_hugetlb_folio() would address this so I think this patch can rely
> on it too.
> 
> [1] https://lore.kernel.org/linux-mm/A1A14368-7A43-40ED-B2AB-C2EC2C5FFB1D@linux.dev/

But it might still not be a good idea to add hwpoisoned hugetlb folio back to hugepage_freelists?

Also, with this patch applied, these raw_hwp_unreliable hugetlb folios can be successfully
unpoisoned now? IIUC, after hugetlb flag is cleared, hugetlb specific information can not be seen
in unpoison_memory, so they are wrongly treated as normal pages.

One last thing, Can the problem described in the scenario below occur?
memory_failure -- VmemmapOptimized hugetlb folio but hugetlb flag is cleared
  try_memory_failure_hugetlb -- It's not considered as hugetlb now.
  TestSetPageHWPoison -- For subpages of VmemmapOptimized hugetlb folio, this could lead to problem?

Thanks.
.

> 
> Mani
> 
> .

