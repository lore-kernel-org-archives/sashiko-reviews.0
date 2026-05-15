Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906AE346E46
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833377; cv=none; b=IUWCtNeQRQSuLe8aiVvKOm07fBxssAuZc/wxzRey/Lv5CPZbYcOrBNhA19ilRkeQNfMJXF3RoRaN97YYSE+OsTIvjp1F+FHgDLwVd7VBDNEqb+xFWlSswOxKaaIrvoUbQwDSHmswh93EBYQEFDEGFKvdHnrFRDC/wj7Iyn+YxGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833377; c=relaxed/simple;
	bh=uGH79Qe5Nxk+XQtAedptezHiJaC3AK/HimWsrPG0n8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lx2kNVYMgLIlUrNDeuUi+jAEB/IJS1ngUMC1AE/ArLZQu+P/ObJF9DS2GDtAECwrwKlqDE69XLkQTiGtgb2LagvgAz/xvuSct19gRPcKWvX/33q1j1ahEZXu4n9vKTZi7ppTBQB+dLShlkiVF9Lk7r6Q8fUMw8BpUjWi3S2wp5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gH0YK2FgSzYQthT
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 16:22:13 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id D5C884057D
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 16:22:48 +0800 (CST)
Received: from [10.174.176.179] (unknown [10.174.176.179])
	by APP4 (Coremail) with SMTP id gCh0CgAn71rX1wZqvAV8CQ--.4219S3;
	Fri, 15 May 2026 16:22:48 +0800 (CST)
Message-ID: <202055f8-d4a1-4524-a74c-4742562ef036@huaweicloud.com>
Date: Fri, 15 May 2026 16:22:47 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] blk-cgroup: Fix UAF in blkcg_activate_policy() by using
 blkg_tryget()
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, mkoutny@suse.com, hannes@cmpxchg.org
References: <20260515061516.3461291-1-wozizhi@huaweicloud.com>
 <20260515065057.B6856C2BCB0@smtp.kernel.org>
From: Zizhi Wo <wozizhi@huaweicloud.com>
In-Reply-To: <20260515065057.B6856C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAn71rX1wZqvAV8CQ--.4219S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGFyrKr43AryDJw1ktF4Utwb_yoWrGrWDp3
	y5W390k3yDXF9aqF4UZa48X34Fka1rJrWUtrWxK3s5CrWagr1Iga12kr4qvrWfJFs7JFyY
	qr10qw1qkF45u3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07UE-erUUUUU=
X-CM-SenderInfo: pzr2x6tkl6x35dzhxuhorxvhhfrp/



在 2026/5/15 14:50, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The patch's use of blkg_tryget() fails to prevent attaching a new policy data (pd) to a dying blkg, leading to missing pd_offline_fn() calls and Use-After-Free.
> - [High] A data race between the enomem error path in blkcg_activate_policy() and blkg_free_workfn() leads to a Double Free of policy data (pd).
> --
> 
> commit da91b1cb03d7c713258f7a3e519577dc77ff3991
> Author: Zizhi Wo <wozizhi@huaweicloud.com>
> 
> blk-cgroup: Fix UAF in blkcg_activate_policy() by using blkg_tryget()
> 
> This commit attempts to fix a use-after-free issue by replacing blkg_get()
> with blkg_tryget() to skip dying blkgs during policy activation, and hoists
> the ref acquisition to the top of the loop.
> 
>> diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
>> index 554c87bb4a865..03b6ce9348488 100644
>> --- a/block/blk-cgroup.c
>> +++ b/block/blk-cgroup.c
>> @@ -1621,6 +1621,10 @@ int blkcg_activate_policy(struct gendisk *disk, const struct blkcg_policy *pol)
>>   		if (blkg->pd[pol->plid])
>>   			continue;
>>   
>> +		/* a destroyed blkg may still be on q->blkg_list; skip it via tryget */
>> +		if (!blkg_tryget(blkg))
>> +			continue;
> 
> Does blkg_tryget() adequately filter out destroyed blkgs here?
> 
> Since blkg_tryget() wraps percpu_ref_tryget(), it succeeds as long as the
> refcount is non-zero, even if the percpu ref has been killed.
> 
> If a memory allocation fails below, the loop drops the queue_lock and holds a
> reference via pinned_blkg. If a concurrent cgroup removal calls
> blkg_destroy() while the lock is dropped, the blkg is killed but its
> refcount remains greater than zero.
> 
> When the loop retries, blkg_tryget() will succeed on this killed blkg. This
> allows the new policy data to be attached and onlined. Because
> blkg_destroy() has already run, pd_offline_fn() will never be called for
> this new policy data, which can lead to a use-after-free when the refcount
> finally drops to zero and blkg_free_workfn() cleans it up without unlinking
> it from scheduler lists.
> 
> [ ... ]

Indeed, the queue_lock is released midway, causing the blkg to be
killed, and the allocated pd still cannot go offline. :(

Is it necessary to introduce a function like this to avoid the issue?

static inline bool blkg_tryget_live(struct blkcg_gq *blkg)
{
     return blkg && percpu_ref_tryget_live(&blkg->refcnt);
}

>> @@ -1666,6 +1669,8 @@ int blkcg_activate_policy(struct gendisk *disk, const struct blkcg_policy *pol)
>>   		pd->online = true;
>>   
>>   		spin_unlock(&blkg->blkcg->lock);
>> +
>> +		blkg_put(blkg);
>>   	}
> 
> Can the addition of this blkg_put() inside the loop trigger a double-free
> race with the enomem error path?
> 
> If the refcount drops to zero here, blkg_free_workfn() is scheduled. If a

This situation seems unlikely to occur because:

   1) both blkg_tryget() and the final blkg_put() are executed within the
   queue_lock, preventing concurrency with blkg_destroy().

   2) the initial blkg_tryget() ensures that after the blkg_put() call
   here, the blkg still holds a reference count.

> subsequent allocation fails and the function jumps to the enomem path, that
> path iterates over q->blkg_list, locks the queue_lock and blkcg->lock,
> calls pol->pd_free_fn(pd), and then sets blkg->pd[pol->plid] = NULL.
> 
> Concurrently, blkg_free_workfn() only acquires q->blkcg_mutex. It delays
> removing the blkg from q->blkg_list until after freeing all policy data.
> 
> Since the two paths use different locks, they do not synchronize. Both paths
> could read the same non-null pd pointer and call pd_free_fn() on it,
> resulting in a double-free.
> 

Thanks,
Zizhi Wo

