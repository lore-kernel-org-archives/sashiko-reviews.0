Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595290;
	b=xAoEzzVIXRMllwj2gNbB0Ptua4bXc863tGfReX0tx+LcG4+NyqsR8XPkF+5g07A8tain
	 EgPDTO4SwYb4ICrTzzJpbXrK6SAgtAIb3E4oOPVQB0LpcOw4QXoHLD5cekq9EGiFTR8gr
	 kAvnCkIa8yY6+HXw5ufvO55pgFmNZK2azpzbi7R4+DtGE9h0QUTMVSYI2xN4n5vTgz0nr
	 CG6lOZ1x6G6j6ZopDYIocTF36Ca6J3sKhypPWC9SJsC1CKIF34T1fSPQXJrgkp8mlEouh
	 D4GPyp2ydUtKgjasDb4+KZyYRLvyFjTGDI8ddsk0lS/4yOntgQNJ21EsFDuGF1tJzUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595290;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=O1qqSd7P6LsE224LlEnYuLdDv6qfc2LEAQW7Kqr7xu4=;
	b=OSdqwWSKx9EdhiGnivI+OWUgNnDH522qCrXiO7PDp1/neXoofg1ZE4008lAuj0IynRF1
	 WgatYpClEhLZrOWe7afdV9UBrNpxMvgfG1Leurw5vrg21I19etZrFphnfjWYTyebn7rLX
	 2Qpc6sZGMZ+F6g+4z6+Thy6bcWv1Tb0jf7Q87qWN8UCSohf9elAeIIUsB/ALv3JC7mvAL
	 OLWS0A4qPj89AM7YdulNe5Xc18vpvrwQrj/llLF5e6rEcZ2P/ZzRpRh1Ze5xV+6aQC+Pb
	 uMoOgfijqFWhjlOea1n+VEtux+KS/7Mr4kEysBXeBFl9tgutAZynaifW0ZLFo0L7a+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="re/+bKpo";
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28336606A31E
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 08:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28336606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=re/+bKpo
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795595284; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=O1qqSd7P6LsE224LlEnYuLdDv6qfc2LEAQW7Kqr7xu4=;
	b=re/+bKpo0cMhs1Pid9bYuuB4ZlHNxMgk8B1TViTUXgGr24mIJPtW64wIelRQqSQz///K3AuYDqIOnzHmUsOPPHctdGiH+wqjrRvV3/x7GWl5nYFsJCcPwjEv8JWOgXDaaWzhR9ciln7/n5bI/rSCPfmGuF2Y7UIizuOjwwSO1cY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0XFQvStO_1795595283;
Received: from 30.74.144.130(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XFQvStO_1795595283 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Nov 2026 16:28:03 +0800
Message-ID: <f298cdb0-f328-4715-8b9f-e8e1c6ffc854@linux.alibaba.com>
Date: Wed, 25 Nov 2026 16:28:02 +0800
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
Subject: Re: [RFC PATCH] mm: shmem: fix discarded data left intact after
 truncation or hole punching
To: sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org,
 david@kernel.org, hughd@google.com
Cc: linux-mm@kvack.org
References: <6fcc15c466667f6943c34e130212b891b7471c83.1795436423.git.baolin.wang@linux.alibaba.com>
 <sashiko-outbox-231134@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-231134@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/24/26 8:26 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] mm: shmem: shmem_get_partial_folio() swaps in whole
>    non-straddling entries
> - [High] mm: shmem: missing boundary zeroing when hole is faulted in
>    during truncate
> --
> 
> commit 44fc5f1a0ce8be88e4d2e1f2173306d27462ff3d
> Author: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> mm: shmem: fix discarded data left intact after truncation or hole punching
> 
> This commit swaps in and locks boundary folios before updating i_size or
> unmapping the range during truncation and hole punching, propagating swapin
> errors to the syscall callers and passing the locked boundary folios to
> shmem_undo_range().
> 
>> diff --git a/mm/shmem.c b/mm/shmem.c
>> index 2b2b78dd24975..1e1d741e50dc2 100644
>> --- a/mm/shmem.c
>> +++ b/mm/shmem.c
>> @@ -1306,6 +1306,7 @@ static struct folio *shmem_get_partial_folio(struct inode *inode, pgoff_t index)
>>   {
>>   	const gfp_t gfp = mapping_gfp_mask(inode->i_mapping);
>>   	struct folio *folio;
>> +	int error;
>>   
>>   retry:
>>   	folio = filemap_get_entry(inode->i_mapping, index);
>> @@ -1324,17 +1325,22 @@ static struct folio *shmem_get_partial_folio(struct inode *inode, pgoff_t index)
>>   	 * Truncation can look up a large swap entry at or beyond i_size.
>>   	 * Swap it in directly to bypass the size check in shmem_get_folio().
>>   	 */
>> -	if (shmem_swapin_folio(inode, index, &folio, SGP_READ, gfp, NULL, NULL) == -EEXIST)
>> +	error = shmem_swapin_folio(inode, index, &folio, SGP_READ, gfp, NULL, NULL);
>> +	if (error == -EEXIST)
>>   		goto retry;
>> +	if (error)
>> +		return ERR_PTR(error);
>>   	return folio;
>>   }
>>   
>>   /*
>>    * Remove range of pages and swap entries from page cache, and free them.
>>    * If !unfalloc, truncate or punch hole; if unfalloc, undo failed fallocate.
>> + * Boundary folios are locked and referenced. Zero them, split large ones,
>> + * then unlock and put them. NULL means there is no boundary folio.
>>    */
>>   static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
>> -								 bool unfalloc)
>> +		struct folio *start_folio, struct folio *end_folio, bool unfalloc)
>>   {
>>   	struct address_space *mapping = inode->i_mapping;
>>   	struct shmem_inode_info *info = SHMEM_I(inode);
>> @@ -1392,25 +1398,19 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
>>   	if (unfalloc)
>>   		goto whole_folios;
>>   
>> -	same_folio = (lstart >> PAGE_SHIFT) == (lend >> PAGE_SHIFT);
>> -	folio = shmem_get_partial_folio(inode, lstart >> PAGE_SHIFT);
>> -	if (folio) {
>> -		same_folio = lend < folio_next_pos(folio);
>> -		folio_mark_dirty(folio);
>> -		truncate_inode_partial_folio(folio, lstart, lend, &start,
>> +	if (start_folio) {
>> +		same_folio = lend < folio_next_pos(start_folio);
>> +		folio_mark_dirty(start_folio);
>> +		truncate_inode_partial_folio(start_folio, lstart, lend, &start,
>>   					     same_folio ? &end : NULL);
>> -		folio_unlock(folio);
>> -		folio_put(folio);
>> -		folio = NULL;
>> +		folio_unlock(start_folio);
>> +		folio_put(start_folio);
>>   	}
>> -
>> -	if (!same_folio)
>> -		folio = shmem_get_partial_folio(inode, lend >> PAGE_SHIFT);
>> -	if (folio) {
>> -		folio_mark_dirty(folio);
>> -		truncate_inode_partial_folio(folio, lstart, lend, NULL, &end);
>> -		folio_unlock(folio);
>> -		folio_put(folio);
>> +	if (end_folio && end_folio != start_folio) {
>> +		folio_mark_dirty(end_folio);
>> +		truncate_inode_partial_folio(end_folio, lstart, lend, NULL, &end);
>> +		folio_unlock(end_folio);
>> +		folio_put(end_folio);
>>   	}
>>   
>>   whole_folios:
>> @@ -1513,12 +1513,39 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
>>   	shmem_recalc_inode(inode, 0, -nr_swaps_freed);
>>   }
>>   
>> -void shmem_truncate_range(struct inode *inode, loff_t lstart, uoff_t lend)
>> +/* Check whether the end page of [lstart, lend] lies in the start folio. */
>> +static bool is_same_boundary_folio(struct folio *start_folio,
>> +		loff_t lstart, uoff_t lend)
>>   {
>> -	shmem_undo_range(inode, lstart, lend, false);
>> +	if (start_folio)
>> +		return folio_next_index(start_folio) > lend >> PAGE_SHIFT;
>> +	return (lstart >> PAGE_SHIFT) == (lend >> PAGE_SHIFT);
>> +}
>> +
>> +static void shmem_truncate_range_partial(struct inode *inode, loff_t lstart, loff_t lend,
>> +		struct folio *start_folio, struct folio *end_folio)
>> +{
>> +	shmem_undo_range(inode, lstart, lend, start_folio, end_folio, false);
>>   	inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
>>   	inode_inc_iversion(inode);
>>   }
>> +
>> +void shmem_truncate_range(struct inode *inode, loff_t lstart, uoff_t lend)
>> +{
>> +	struct folio *start_folio = NULL, *end_folio = NULL;
>> +
>> +	/* This void interface retains best-effort handling of boundary errors. */
>> +	start_folio = shmem_get_partial_folio(inode, lstart >> PAGE_SHIFT);
>> +	if (IS_ERR(start_folio))
>> +		start_folio = NULL;
>> +
>> +	if (lend != -1 && !is_same_boundary_folio(start_folio, lstart, lend)) {
>> +		end_folio = shmem_get_partial_folio(inode, lend >> PAGE_SHIFT);
>> +		if (IS_ERR(end_folio))
>> +			end_folio = NULL;
>> +	}
>> +	shmem_truncate_range_partial(inode, lstart, lend, start_folio, end_folio);
>> +}
>>   EXPORT_SYMBOL_GPL(shmem_truncate_range);
>>   
>>   static int shmem_getattr(const struct mnt_idmap *idmap,
>> @@ -1578,19 +1605,30 @@ static int shmem_setattr(const struct mnt_idmap *idmap,
>>   	if (S_ISREG(inode->i_mode) && (attr->ia_valid & ATTR_SIZE)) {
>>   		loff_t oldsize = inode->i_size;
>>   		loff_t newsize = attr->ia_size;
>> +		struct folio *folio = NULL;
>>   
>>   		/* protected by i_rwsem */
>>   		if ((newsize < oldsize && (info->seals & F_SEAL_SHRINK)) ||
>>   		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
>>   			return -EPERM;
>>   
>> +		if (newsize != oldsize && (info->flags & SHMEM_F_MAPPING_FROZEN))
>> +			return -EPERM;
>> +		if (newsize <= oldsize) {
>> +			folio = shmem_get_partial_folio(inode, newsize >> PAGE_SHIFT);
>> +			if (IS_ERR(folio))
>> +				return PTR_ERR(folio);
>> +		}
> 
> [Severity: High]
> Does calling shmem_get_partial_folio() before shmem_undo_range() swap in
> whole swap entries at lstart >> PAGE_SHIFT and lend >> PAGE_SHIFT even when
> they do not straddle the range boundaries?
> 
> Previously, shmem_get_partial_folio() ran after the first
> find_lock_entries() pass in shmem_undo_range(), which had already freed
> non-straddling swap entries in [start, end - 1] via shmem_free_swap().
> Looking up the boundary indices upfront means a page-aligned truncate (such
> as ftruncate(fd, 0)), page-aligned hole punch, or shmem_truncate_range()
> swaps in the entry at the boundary index only for
> truncate_inode_partial_folio() to immediately discard the entire folio.
> 
> As a result, page-aligned ftruncate() and fallocate(FALLOC_FL_PUNCH_HOLE)
> fail with -ENOMEM when a cgroup at its memory limit tries to free
> swapped-out pages, and fail with -EIO if the boundary index holds a
> swapin-error poison marker (regressing 59511d630a69 ("mm/shmem: fix
> truncation of files containing only swapin-error markers")).

Yes, this is intended. Even for a page-aligned truncate or hole punch, 
without swapping in and locking the boundary folio upfront, the 
page-aligned swap entry could be swapped-in/swap-out by a concurrent 
thread and turn into a large swap entry crossing the boundary, which 
would still leave discarded data intact.

For poison markers, though, there is no need to return an error to 
users, since no old data can be observed. I will fix this in the next 
version.

> [ ... ]
> 
>> @@ -3911,7 +3949,9 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
>>   		struct address_space *mapping = file->f_mapping;
>>   		loff_t unmap_start = round_up(offset, PAGE_SIZE);
>>   		loff_t unmap_end = round_down(offset + len, PAGE_SIZE);
>> +		loff_t lend = offset + len - 1;
>>   		DECLARE_WAIT_QUEUE_HEAD_ONSTACK(shmem_falloc_waitq);
>> +		struct folio *start_folio = NULL, *end_folio = NULL;
>>   
>>   		/* protected by i_rwsem */
>>   		if (info->seals & (F_SEAL_WRITE | F_SEAL_FUTURE_WRITE)) {
>> @@ -3919,6 +3959,23 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
>>   			goto out;
>>   		}
>>   
>> +		start_folio = shmem_get_partial_folio(inode, offset >> PAGE_SHIFT);
>> +		if (IS_ERR(start_folio)) {
>> +			error = PTR_ERR(start_folio);
>> +			goto out;
>> +		}
>> +		if (!is_same_boundary_folio(start_folio, offset, lend)) {
>> +			end_folio = shmem_get_partial_folio(inode, lend >> PAGE_SHIFT);
>> +			if (IS_ERR(end_folio)) {
>> +				error = PTR_ERR(end_folio);
>> +				if (start_folio) {
>> +					folio_unlock(start_folio);
>> +					folio_put(start_folio);
>> +				}
>> +				goto out;
>> +			}
>> +		}
>> +
>>   		shmem_falloc.waitq = &shmem_falloc_waitq;
>>   		shmem_falloc.start = (u64)unmap_start >> PAGE_SHIFT;
>>   		shmem_falloc.next = unmap_end >> PAGE_SHIFT;
>> @@ -3929,7 +3986,8 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
>>   		if ((u64)unmap_end > (u64)unmap_start)
>>   			unmap_mapping_range(mapping, unmap_start,
>>   					    unmap_end - unmap_start, 0);
>> -		shmem_truncate_range(inode, offset, offset + len - 1);
>> +		shmem_truncate_range_partial(inode, offset, lend,
>> +					     start_folio, end_folio);
> 
> [Severity: High]
> Can a concurrent page fault populate an initially empty boundary page after
> shmem_get_partial_folio() returns NULL, causing shmem_undo_range() to skip
> zeroing it?
> 
> CPU0                                    CPU1
> shmem_setattr() / shmem_fallocate()
>    start_folio = shmem_get_partial_folio()
>      -> NULL (hole)
>                                          shmem_fault()
>                                            allocates and maps folio at
>                                            boundary index, writes data
>    i_size_write() / unmap_mapping_range()
>    shmem_undo_range(..., NULL, ...)
>      find_lock_entries(mapping, start, ...)
>      if (start_folio) -> skipped         <-- unaligned boundary not zeroed
> 
> When the boundary index starts as a hole, start_folio (or end_folio) is
> NULL and no folio lock is held across the subsequent swapin of end_folio,
> i_size_write(), unmap_mapping_range(), or the first find_lock_entries()
> loop in shmem_undo_range().  Because both loops in shmem_undo_range() scan
> only [start, end - 1] (where start = (lstart + PAGE_SIZE - 1) >> PAGE_SHIFT
> and end = (lend + 1) >> PAGE_SHIFT) and shmem_undo_range() no longer
> re-checks the boundary indices when start_folio or end_folio is NULL, a
> folio faulted into an unaligned boundary page during that window is left
> with non-zero bytes in the truncated tail or punched hole.

No. This is invalid. The race itself is possible, but it also exists 
without the patch. Unsynchronized concurrent mmap writes are not 
guaranteed to be serialized with truncation or hole punching. So 
userspace must coordinate them for deterministic results.
