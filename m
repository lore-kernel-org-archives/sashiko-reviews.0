Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548398;
	b=Lf8Lphtqvet0RW7IyavvI0F2bfF2CHS+q1lrAWEWBQ1WJKOMx/WbxHDGJVoMlU+YWJCJ
	 EAG/QJwyPIyZRe1cuNKtE7fjTmt7LeQ9UIxsdWs+ONfO90xwe6xJJWkYLha0sNMcgXP60
	 ko0A9qapVq5PqsWffTA51rIrUBtyzStjg1p7w3B3twLFG5a9pvdFW9aEvva1pqeiVIfIi
	 7y2loLXHdyEAN8dwRYIQXheYk8MsPQrbJrmW6XTFi/ssfatjq4T+7TSYt937E325A/D6o
	 Rb/OI00Gv7Q0puZlJtOt2Ll5SgdHjsZjRBWyRvomv6PkR3d5Ky9VE1sA3D0loHHPbAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548398;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0rfDGBAcafKezqinDyA203mmJPgTuUKXlIMMfgq4UE8=;
	b=3Ciaeuwzu+TkXIFd2HjkRmWObE3pUZrgPPU6qmJpKuTIVugRK9oumYW0ePiyTZhPY3fT
	 IZvnTe18vjpSNX84pWWt4OgN/lqCJzfQVNQhyGyg1SDrZviE7T0feQef1/g00mqBmsRN3
	 9ez/RAH1yoIbJztHaDZgc49xVWHdmEvt0wKUEudw+1qjAvqG/dRZmj7erAzT+9G2qO5zN
	 xV7sjN5D6rWcOb4Gw4k88kIC3eyOga5eVpka+jFHGBOgXWXDi+e8e2zkmhbJ2JkD/LqIE
	 k7YH3FFsweV1y790NL89erSibpvcu19+TTDtxSh0oXRE6Hrco2j7+F0U0E4K6Mt9jrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=G7cDiFdo;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773AB606A8A4
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 05:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 773AB606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=G7cDiFdo
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794548389; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=0rfDGBAcafKezqinDyA203mmJPgTuUKXlIMMfgq4UE8=;
	b=G7cDiFdoHzMBGw1ssqlxSV4U5tYNGxFyj2W/38dfvEeG3snf7NwTs3YQfwWaCidgvhI3v7+y2N+hfjF63HF9REenjIBdC+n14gEJgdZxappPDac2OqlUbAJKOlM/BJhWGaOPXpBthfN8y5HyzLgLO7WSbDtib6O7T9psaTQq3Y0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0XEe.jFP_1794548359;
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEe.jFP_1794548359 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 13:39:20 +0800
Message-ID: <8e342039-2e73-4657-9ff6-55a71b5cb678@linux.alibaba.com>
Date: Fri, 13 Nov 2026 13:39:18 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/shmem: drop the second folio batch from
 shmem_undo_range()
To: sashiko-reviews@lists.linux.dev, Qiliang Yuan <qiliang.yuan@linux.dev>,
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jan Kara <jack@suse.cz>, Qiliang Yuan <odys.yuan@gmail.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, kernel test robot <lkp@intel.com>
References: <20261111-bug-mm-shmem-undo-frame-v1-1-e50a95b8f9b2@linux.dev>
 <sashiko-outbox-212134@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-212134@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/13/26 11:39 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] mm/shmem: skipped boundary zeroing on swapin failure in
>    shmem_undo_range() [1]
> --
> 
> commit 785bd3384006f8bb06c3c8f9b1b5d455eba3d449
> Author: Qiliang Yuan <qiliang.yuan@linux.dev>
> 
> mm/shmem: drop the second folio batch from shmem_undo_range()
> 
> This commit removes the second folio_batch from shmem_undo_range() by
> passing fbatch directly to delete_from_page_cache_batch() after removing
> swap entries, and using truncate_inode_folio() when undoing a failed
> fallocate().
> 
>> diff --git a/mm/shmem.c b/mm/shmem.c
>> index 156469423a866..5bcbdd6078a73 100644
>> --- a/mm/shmem.c
>> +++ b/mm/shmem.c
>> @@ -1352,9 +1352,6 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
>>   	index = start;
>>   	while (index < end && find_lock_entries(mapping, &index, end - 1,
>>   			&fbatch, indices)) {
>> -		struct folio_batch remove;
>> -
>> -		folio_batch_init(&remove);
>>   		for (i = 0; i < folio_batch_count(&fbatch); i++) {
>>   			folio = fbatch.folios[i];
>>   
>> @@ -1366,13 +1363,14 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
>>   				continue;
>>   			}
>>   
>> -			if (!unfalloc || !folio_test_uptodate(folio)) {
>> +			if (!unfalloc)
>>   				truncate_cleanup_folio(folio);
>> -				folio_batch_add(&remove, folio);
>> -			}
>> +			else if (!folio_test_uptodate(folio))
>> +				truncate_inode_folio(mapping, folio);
>>   		}
>> -		delete_from_page_cache_batch(mapping, &remove);
>>   		folio_batch_remove_exceptionals(&fbatch);
>> +		if (!unfalloc)
>> +			delete_from_page_cache_batch(mapping, &fbatch);
>>   		for (i = 0; i < folio_batch_count(&fbatch); i++)
>>   			folio_unlock(fbatch.folios[i]);
>>   		folio_batch_release(&fbatch);
> 
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can shmem_undo_range()
> leave partial boundary ranges unzeroed when swapping in a boundary folio
> fails [1]?
> 
> Later in shmem_undo_range(), shmem_get_partial_folio() is called to fault
> in boundary folios at lstart >> PAGE_SHIFT and lend >> PAGE_SHIFT before
> passing them to truncate_inode_partial_folio():
> 
> mm/shmem.c:shmem_get_partial_folio() {
> 	...
> 	folio = NULL;
> 	shmem_get_folio(inode, index, 0, &folio, SGP_READ);
> 	return folio;
> }
> 
> mm/shmem.c:shmem_undo_range() {
> 	...
> 	folio = shmem_get_partial_folio(inode, lstart >> PAGE_SHIFT);
> 	if (folio) {
> 		same_folio = lend < folio_next_pos(folio);
> 		folio_mark_dirty(folio);
> 		truncate_inode_partial_folio(folio, lstart, lend, &start,
> 					     same_folio ? &end : NULL);
> 	...
> }
> 
> If the boundary falls inside a swapped-out entry and shmem_swapin_folio()
> fails with -ENOMEM under memory pressure, shmem_get_partial_folio() ignores
> the error from shmem_get_folio() and returns NULL.  shmem_undo_range() then
> skips truncate_inode_partial_folio() for that boundary while the subsequent
> whole_folios loop skips any swap entry crossing start or end, leaving stale
> non-zero data in the swap entry that becomes visible on later reads or file
> extensions.

This is unrelated to the current patch. David already raised this 
concern before [1], and I'll think about whether there's a reliable fix 
for such edge cases.

[1] 
https://lore.kernel.org/all/20261026-fixes_shmem-v1-0-703206d5fa0c@kernel.org/
