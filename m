Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD68F36F906
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 03:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614523; cv=none; b=Lipzz1ukHXFoOCSMRx+7oUMu6SHGP2Xl638MSARP01xgyOFb9yb/6sNC7oDlAXIp2TMbpdkPsqUmN4QhiZ2Gm6/ic3bm5HV7krTU55KpSHskJ4w450dvpZFc/6K9q/Nv2ku7Nmx/BiMAc0OCP8xntLQfH9qMO+gsdYUenfSLHLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614523; c=relaxed/simple;
	bh=+YkLXi5CNwh2+4MA7mEfLifg0o7nPiOxwn0GCTbXNHI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=A0UD+coTB+zBOn+VYB2iM1Q0QEByIi74SOw7hcUiNMcKqt7vKMDrwyEVlZ2uOgFsQN+MaIo5Yzweu3gJjGKX+L3BN0L3qYCkXc/lr1zSswwJrm5GTGi7U/ARLZyPZzJkREn1EvXEfMxlxk+1SMC0ofhicRke5lIHmeB6yIBLoYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ji027O2z; arc=none smtp.client-ip=91.218.175.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ji027O2z"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=+YkLXi5CNwh2+4MA7mEfLifg0o7nPiOxwn0GCTbXNHI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789614517; v=1; x=1790219317;
 b=Ji027O2z6twe6k3o5bPbVA+0zDxSOo/18JOvgUtcpm0q3SLBhFEyGg3Cv+/UQkm+dIzflyHI
 bhrEk08C2BsNHdsif4wPoRvGTxo28P5pO5nYeQHN33cZO9ufwi0x3DxmWXgLtW12mdfQDr3ynrX
 ca4IpWVl1HS1V4t8WSXTLn/g=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 1d9053be508d1d4c;
	Thu, 17 Sep 2026 03:08:27 +0000
X-Mizu-Trace-ID: 1d9053be508d1d4c
X-Migadu-Flow: FLOW_OUT
Message-ID: <267c9850-d346-4b4e-88d5-cc7939af864d@linux.dev>
Date: Thu, 17 Sep 2026 11:08:20 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/15] mm/memory-failure: convert process iterator to
 for_each_process_rculock
From: Ye Liu <ye.liu@linux.dev>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
References: <20260911075800.491472-1-ye.liu@linux.dev>
 <20260911075800.491472-5-ye.liu@linux.dev>
 <20260911081351.A8FE81F00893@smtp.kernel.org>
 <7ae944a6-df67-4a8a-8ece-c34701715c8a@linux.dev>
Content-Language: en-US
In-Reply-To: <7ae944a6-df67-4a8a-8ece-c34701715c8a@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/11 17:51, Ye Liu 写道:
> 
> 
> 在 2026/9/11 16:13, sashiko-bot@kernel.org 写道:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>
>> Pre-existing issues:
>> - [High] Potential NULL pointer dereference or Use-After-Free of `folio->mapping` in `collect_procs_file()` due to concurrent truncation.
>> --
>>
> Unrelated to this patch. I will fix it later.
> 
>> commit 788d1f422c3f19026d9e0d86b550c238607720ed
>> Author: Ye Liu <liuye@kylinos.cn>
>>
>> mm/memory-failure: convert process iterator to for_each_process_rculock
>>
>> This commit replaces the manual rcu_read_lock()/rcu_read_unlock() pairs
>> combined with for_each_process() loop in mm/memory-failure.c with
>> for_each_process_rculock(), which scopes the RCU read lock to the loop body
>> via scoped_guard(rcu).
>>
>>> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
>>> index a8b03e2920ba8..7d93deb1f7b3d 100644
>>> --- a/mm/memory-failure.c
>>> +++ b/mm/memory-failure.c
>> [ ... ]
>>> @@ -589,9 +587,8 @@ static void collect_procs_file(const struct folio *folio,
>>>  	pgoff_t pgoff;
>>>  
>>>  	i_mmap_lock_read(mapping);
>>
>> [Severity: High]
>> This is a pre-existing issue, but could this lead to a NULL pointer
>> dereference or a use-after-free of mapping due to a race with truncation?
>>
>> In memory_failure(), the folio lock is dropped in hwpoison_user_mappings()
>> before calling collect_procs(). collect_procs() performs an unlocked check of
>> !folio->mapping:

This appears to be a false positive.                                      
                                                                          
In the memory_failure() path, the folio lock is acquired at line 2597     
(folio_lock(folio)) and held through the call to hwpoison_user_mappings() 
at line 2635, which in turn calls collect_procs() at line 1694. There is  
no folio_unlock() between the lock acquisition and the collect_procs()    
call, so the lock is held throughout.（The line numbers might not match
exactly, but they shouldn't be far off.）                                     
                                                                          
Consequently, the check in collect_procs():                               
                                                                          
    if (!folio->mapping)                                                  
        return;                                                           
                                                                          
and the subsequent read in collect_procs_file():                          
                                                                          
    struct address_space *mapping = folio->mapping;                       
                                                                          
are both performed under the folio lock. Since all truncation paths       
that set folio->mapping = NULL require the folio lock (page_cache_delete()
and filemap_remove_folio() both assert folio_test_locked()), no concurrent
truncation can modify folio->mapping between these two reads.             
                                                                          
No fix is needed.                                                         


>>
>> static void collect_procs(...)
>> {
>> 	if (!folio->mapping)
>> 		return;
>> 	...
>> 	else
>> 		collect_procs_file(folio, page, tokill, force_early);
>> }
>>
>> If a concurrent truncation removes the folio from the page cache immediately
>> after this check, folio->mapping becomes NULL. collect_procs_file() then
>> initializes mapping = folio->mapping and calls i_mmap_lock_read(mapping).
>>
>> If the compiler performs a second read of folio->mapping, mapping will be
>> NULL, crashing the kernel on the semaphore acquisition. If the compiler
>> caches the first read, mapping will point to an address_space whose host
>> inode may have been concurrently freed, leading to a use-after-free since
>> the elevated page refcount does not pin the inode and no RCU read lock is
>> held during the blocking i_mmap_lock_read() call.
>>
>>> -	rcu_read_lock();
>>>  	pgoff = page_pgoff(folio, page);
>>> -	for_each_process(tsk) {
>>> +	for_each_process_rculock(tsk) {
>>>  		struct task_struct *t = task_early_kill(tsk, force_early);
>>>  		unsigned long addr;
>>
> 

-- 
Thanks,
Ye Liu

