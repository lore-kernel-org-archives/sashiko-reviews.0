Received: from mail-m15588.qiye.163.com (mail-m15588.qiye.163.com [101.71.155.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8610481647
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 08:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965233; cv=none; b=iesqOI2ELrT/Y6t5E6xnvjQr9XPC/RoxtGFAj7RFyfjpqMcscs/oIc9yqf3quHFKbQPTtDQD0zBEwBjwZxi0WTuuupeDv9lMmu2UjXzN1bkPDYN8UvWOFMiCrZYOlNRTILal/WBBesA0MeaMH6QJ7pzPErsybbPV3RUslrLcVC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965233; c=relaxed/simple;
	bh=lJzSM9czJg36Fs4R0WZGAyaoiEZwceSQcFqLEu20Z6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAdR3zZJMvkj8LSYI7BeXP2sc2//RZfniX0tD8yO0/RAFTtYZx8Yo5nBGD18faS40Y4ufNqUkJn9aszHRvXmiCrcg5obZZ2Y+XFow79SKQW1iJJA7c4NxUIw40MKGUR2/bPsonZwj7+7RND/WTLp/WDrs249POIQo1yDGvWl2NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=101.71.155.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.0.59] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 200ce1596;
	Wed, 14 Oct 2026 16:01:52 +0800 (GMT+08:00)
Message-ID: <2a605a34-0e0e-4377-9062-6b511e0be503@easystack.cn>
Date: Wed, 14 Oct 2026 16:01:51 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] mm/page_owner: add open-coded page_owner iterator
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20261013122125.843451-1-zhen.ni@easystack.cn>
 <20261013122125.843451-4-zhen.ni@easystack.cn>
 <sashiko-outbox-169742@kernel.org>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <sashiko-outbox-169742@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1396e9a740229kunm4a37894b45d1e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ01MVkwYT0weSxpDSklLGFYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG



在 2026/10/13 20:49, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] mm: soft lockup in page_owner_next_eligible via BPF iter
> --
> 
> commit b7f01516d35223b7a6800ce695c29a9203809699
> Author: Zhen Ni <zhen.ni@easystack.cn>
> 
> mm/page_owner: add open-coded page_owner iterator
> 
> This patch adds an open-coded bpf_iter over the pages eligible for
> page_owner output, reusing page_owner_next_eligible(). It also provides a
> sleepable BPF program to drive the iterator and retrieve stack traces.
> 
>> diff --git a/mm/page_owner_iter.c b/mm/page_owner_iter.c
>> index 938cb42ab7d79..ac7e69ba0cef3 100644
>> --- a/mm/page_owner_iter.c
>> +++ b/mm/page_owner_iter.c
> [ ... ]
>> @@ -122,3 +123,55 @@ int page_owner_iter_register(void)
>>   
>>   	return bpf_iter_reg_target(&page_owner_iter_reg_info);
>>   }
>> +
>> +/* opaque to BPF programs */
>> +struct bpf_iter_page_owner {
>> +	__u64 __opaque[16];
>> +} __attribute__((aligned(8)));
>> +
>> +struct bpf_iter_page_owner_kern {
>> +	struct page_owner_scan scan;
>> +} __attribute__((aligned(8)));
>> +
>> +__bpf_kfunc_start_defs();
> [ ... ]
>> +__bpf_kfunc struct page_owner_scan *
>> +bpf_iter_page_owner_next(struct bpf_iter_page_owner *it)
>> +{
>> +	struct bpf_iter_page_owner_kern *kit = (void *)it;
>> +
>> +	cond_resched();
>> +
>> +	if (kit->scan.page)
>> +		kit->scan.pfn++;
>> +
>> +	if (!page_owner_next_eligible(&kit->scan))
>> +		return NULL;
> 
> [Severity: High]
> Can this iterator cause a soft lockup or RCU stall?
> 
> If page_owner is disabled, page_ext_get() inside page_owner_next_eligible()
> constantly returns NULL, triggering a continue on every single page up to
> max_pfn:
> 
> mm/page_owner.c:page_owner_next_eligible() {
> 	...
> 	for (; pfn < max_pfn; pfn++) {
> 		...
> 		page_ext = page_ext_get(page);
> 		if (unlikely(!page_ext))
> 			continue;
> 		...
> ext_put_continue:
> 		page_ext_put(page_ext);
> 		cond_resched();
> 	}
> 	...
> }
> 
> Because the continue statement skips the ext_put_continue block, the loop
> never calls cond_resched(). When called from this new sleepable BPF
> iterator, won't it spin over the entire physical memory space in a tight
> loop without yielding?
> 
>> +
>> +	return &kit->scan;
>> +}
> 

The soft lockup / RCU stall doesn't seem critical, since the debugfs
path behaves the same way, but I think it's worth disabling these kfuncs
when page_owner is not enabled. I'll guard them with
static_branch_unlikely(&page_owner_inited).


Thanks,
Zhen
