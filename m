Received: from mail-m127169.xmail.ntesmail.com (mail-m127169.xmail.ntesmail.com [115.236.127.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AF440D588
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965685; cv=none; b=LGudFZYtJMtww988fiYyACEzffg0eYMBb4y4Bc3/+5J2iFfbk7HyexZSRL/oZDKzfOizJvHjYPiOG0anbyOLbqk6BiwpW8Whl4b6bgmNZPCsSyN+r8a7PsDpnzF9lDun9Odtw7vkRVfoqeHey0q8jOa45IJQtubJI/VshUcTEkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965685; c=relaxed/simple;
	bh=5NxZ3jqPtSVvxlH3v7WZVAP9ycsJzX19jO5a6ZOv88A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwT3B1QBk36kPWcbuk4TUeeVETjEkD27g5utR/RZBGYwfPWUbsrbx2I3mUZKFuvp1SugFZ1PbBCaMMw/mWvg8DJEW83jZwyMo5bmeMu0+oiIkNWt7zXOE/bTwnf6bmv7Xq/fJo93PqNf+uIfw9XCGXiErFIpOEoW7FQquh+b3+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=115.236.127.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.0.59] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 200c960fd;
	Wed, 14 Oct 2026 15:39:15 +0800 (GMT+08:00)
Message-ID: <f3b6f574-197c-4c19-94dc-463eef134236@easystack.cn>
Date: Wed, 14 Oct 2026 15:39:15 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] mm/page_owner: record the NUMA node in the scan
 cursor
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20261013122125.843451-1-zhen.ni@easystack.cn>
 <20261013122125.843451-5-zhen.ni@easystack.cn>
 <sashiko-outbox-169722@kernel.org>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <sashiko-outbox-169722@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa13959e6a90229kunm9f52cc4343f02
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSUMYVhkfQ0MdSUNMHkIYQlYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG


在 2026/10/13 20:36, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] mm: incomplete fix leaves page_owner vulnerable to unmapped page dereference
> --
> 
> commit 7b174b26adeea5712aaa10bd465514b5ce7dbe36
> Author: Zhen Ni <zhen.ni@easystack.cn>
> Subject: mm/page_owner: record the NUMA node in the scan cursor
> 
> This commit computes the page's NUMA node in page_owner_next_eligible()
> and stores it in the scan cursor to avoid dereferencing a potentially
> unmapped page later. It updates the debugfs nid filter and BPF program
> to use this stored node value.
> 
>> diff --git a/mm/page_owner.c b/mm/page_owner.c
>> index 617346a4ab22a..113e4e7e0b3a1 100644
>> --- a/mm/page_owner.c
>> +++ b/mm/page_owner.c
> [ ... ]
>> @@ -810,18 +824,8 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>>   	/* Find an allocated page */
>>   	while (page_owner_next_eligible(&scan)) {
>>   		if (state->nid_filter_enabled) {
>> -			int nid;
>> -			memdesc_flags_t page_flags =
>> -				READ_ONCE(scan.page->flags);
>> -
>> -			/*
>> -			 * Bypass PF_POISONED_CHECK() in page_to_nid() to avoid
>> -			 * VM_BUG_ON when accessing poisoned pages.
>> -			 */
>> -			if (page_flags.f == PAGE_POISON_PATTERN)
>> -				goto skip_continue;
>> -			nid = memdesc_nid(&page_flags);
>> -			if (!node_isset(nid, state->nid_filter))
>> +			if (scan.nid < 0 ||
>> +			    !node_isset(scan.nid, state->nid_filter))
>>   				goto skip_continue;
>>   		}
>>   
> 
> [Severity: High]
> Does this fix leave scan.page vulnerable to an unmapped page dereference
> shortly after this block?
> 
> Although this patch successfully avoids dereferencing scan.page when checking
> the node filter, page_owner_next_eligible() drops the RCU lock via
> page_ext_put() before returning.
> 
> Just below the quoted block in read_page_owner(), scan.page is still
> passed directly to print_page_owner():
> 
> read_page_owner() {
>      ...
>      while (page_owner_next_eligible(&scan)) {
>          ...
>          return print_page_owner(buf, count, scan.pfn, scan.page,
>                                  &scan.po_snap, scan.po_snap.handle, state);
>      ...
> }
> 
> Inside print_page_owner(), the pointer is dereferenced by scnprintf using
> the %pGp formatter on &page->flags.f.
> 
> If a concurrent memory hot-remove operation frees the vmemmap backing this
> struct page after the RCU lock is dropped, will this %pGp format access
> trigger a kernel panic?
> 
> Additionally, a follow-up patch in this series (Patch 5) appears to introduce
> get_page_memcg_info() which also unconditionally dereferences scan.page
> outside the RCU lock from read_page_owner(). Does that face the same
> use-after-free risk?
> 

The page_ext RCU lock does not pin the underlying struct page. The 
dereference
in print_page_owner() predates this series and is not introduced by these
changes.



Thanks,
Zhen

