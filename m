Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068127;
	b=Jij1kebFUhrrZJ1WXlvezEuhLOpuMkVuC01ZIcMOWeuEjsW6WfWK4N6WaDDkFHNbzGdW
	 29FJBaDQ2EEATpyT8XKbv0NRNLWt9ZtEC1slus/eoE9zFvs3bmGjndOVAdBZdMdwQ1hZp
	 NyswQQCjkfUKnSTrMt3GrFDzQFVoSoN6dHivkbJfRsTEJmxVYLU6jRw7kT0wtD6ix2dA8
	 K+IPFLM2o3J6kRw15vpI01+/KOTklC3bGuzT+Qzq5aBY6VxuojUYcvk6Z/zJ42Ah8nCW3
	 Lv8Yx75gSjw50PBkhnnQXC0XssRy0zUJWrVI6lu6Nr2cf/Evvgc6CaG8KiksiPfnKtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=N1Hc0JwH0vYxA8jJXwO7Qpc075UXav6e2HJ8E40dFE0=;
	b=gf6ayWcMDa5Ebltr9Ow1zSmD4GqghC2OWo1vqEbw0LT9e7E8j9yu+XRcBucQsgWtlB7d
	 0uUJXi4useifH3s+3kf2nY9MYm61qi1tM3ZNzfOMQ/vExroghSy9Ti2e8HxqGJdArrb39
	 pjMF0I1UtVivhOFjBd9LaZmptPffb3hGMYD4ArYRZGWdmPYUNwPzfQ6Nu+iPT3pBxFhtE
	 olM9GSSPQ2oBV6wC8nW9abOyJJj5KC+kCxqGseB2rXHIGZk0jNaEIymr6QQAaI7nyR6zK
	 lmJLQdME7Fze4t/bDSPGlw6Azsg5kUlyGJTeuaPszz0PTOXqNciUZIdbAJdbPimyd7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QX8W6aBB;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE015606A320
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 06:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE015606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QX8W6aBB
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b87040a20bso188230a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 22:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795068125; x=1795672925; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N1Hc0JwH0vYxA8jJXwO7Qpc075UXav6e2HJ8E40dFE0=;
        b=QX8W6aBBk4RTA4VMlLXylisz7yvZtAQXVLGLuHLE5WYSfzEHsCSJUkm7SYeT0FSpal
         TlXpeC3JezUJVdmUC0h55qk+/xFfD29eIBf6DBDFnSWB4v1AnHbkcEolZAvgadjzjrr/
         PCPpg3ZBCI/teobNmLGE5c/CbsCBTJAIz21z2/KIs8GrbdaPV6GC/T5hngP+RuCeo5op
         jMLJSNK19FdCNqFKtPRnsnPjrsoNBHN4mlh9orGAuzPTiIdVMh6JG58EjOcK8nr3uNi9
         50lTrploD8GAC/ErTBPPwKBnItH8+YlABOwW65zFP8CAdAyZdppj3uTPKmM3w6/uLd7A
         /87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795068125; x=1795672925;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1Hc0JwH0vYxA8jJXwO7Qpc075UXav6e2HJ8E40dFE0=;
        b=oCcP245/cCE7SUI8b5JWFpiGacb4PQsi/CiRs91lYpMKYeHe91uKizr47VVD4Cadgm
         hFUzI7iv/mXkJT1p/M7dAEtDY16ZJ5cvd+CAYYehAYXgWq9JGMIL2wvVjnqlwsWPcIoR
         dbgIgNlPvkzoAozCTLXvahc24oM61bxE4lPMVMhnIQW4MTcxrlDnbPl8DRB1mVewQeOA
         KgD9T0WyVHiq382QRakN1SVPynokKJQT6zwj6lbbXCw121Q8DdiTuw6pFoLjVunRsFa4
         jXOl33RJ3uktpbsLIo6IFmf3qWnMrni1g5A7Xqxf+O4M6RvVHFOG8emRg/r8QQwCT4rY
         4eiw==
X-Gm-Message-State: APuU4Z8wJwzwa+8c2oxMKn2yTNToyLsfFrfTpeig3McEOkboPBNjGY2K
	Miv+fklrRJy3eAlF9IxNxDm6xKGCUaseIBU59/ly/IsV3LffsnE2B9J5Cn7pRQSL+/3WJdqS/m/
	Nbofls0w=
X-Gm-Gg: AYBFou1GMO9G933QG+KbVpushzzoolHNXVkP8eRClNvGXzx8HeEwvqiYCxVDraTV/D8
	eL/Gq0bc4RUGmLsUzAPivEA3Tw3vzQPW4h7WB0gcOo4JEL0SowpdCFcDc1c8GmWlTARtsG5ssvi
	ctx1YbpN1MVryuXRHT0MuD4Fr+d+kyoEdcyh/+9lMmOfMqClcJ0ONtvOxugRIOLykJqst9X6Qjz
	Am5u80uU/irFIb3HJvsBXlPfSgsan0MCxaqlCSgqlnNg82sX8q0ggiMa8OoR7RcMdGHgH6ss69F
	L/38K6cLrMAF4aCujpX2zWQ0Yfn0Dj8Z6ctbNuhccQ5yokQt1M00nmefFDCBEwKzC+4K0EeHZTl
	u43VoiF+9F96xFy7oAofzwd4/E7wVLI3rSYpmUw6/mVB1ZyhN0TLzq9U5CTQGEt2sWbi+n6YC37
	u60dVXfsmOL3dDgNJV2DFBW8uj/F04XlwOy9lGsbJj4gVBA2ftc5yYbrB8ZYCM24jXXCiGvHY06
	qRyb2NQ9/QadBtmL5a58W+y8gneOutwWuUIddBwEGJXBwsfZgMlBrhkpx0N/PQwi/KyTw31ffdH
	juZh828N+KWxIjYQGRFwIwse85NsL6sWiqI=
X-Received: by 2002:a17:906:2404:b0:c25:2ded:ad36 with SMTP id a640c23a62f3a-c510dc7fe49mr451368666b.0.1795068124758;
        Wed, 18 Nov 2026 22:02:04 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622711asm24277795ad.47.2026.11.18.22.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 22:02:03 -0800 (PST)
Message-ID: <68ca408c-5c5c-4957-aeab-45766ea88133@suse.com>
Date: Thu, 19 Nov 2026 14:01:58 +0800
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
From: Heming Zhao <heming.zhao@suse.com>
Subject: Re: [RESEND RFC PATCH v7 3/3] ocfs2: switch dio write path from
 buffer_head to iomap
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261118002050.9019-1-heming.zhao@suse.com>
 <20261118002050.9019-4-heming.zhao@suse.com>
 <sashiko-outbox-219900@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-219900@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 09:15, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential
> issues to consider:
> - [High] ocfs2: ocfs2_dio_del_orphan() runs after ocfs2_dio_end_io()
>    drops rw_lock
> - [High] ocfs2: ocfs2_dio_end_io_write() passes coalesced extent_map
>    length to split
> - [High] ocfs2: data corruption in ocfs2_unwritten_check() racing with
>    in-flight DIO
> - [High] ocfs2: broken DIO-to-buffered write fallback in
>    ocfs2_file_write_iter()
> - [High] ocfs2: ocfs2_dio_del_orphan() leaks post-EOF blocks and runs
>    after rw_unlock
> - [High] ocfs2: missing rw_level upgrade after reloading append_write in
>    ocfs2_file_write_iter()
> - [Medium] ocfs2: off-by-one cluster check on -ENOSPC in
>    ocfs2_dio_wr_map_blocks()
> --
> 
> commit 1082a6db1718b4d837aed6c96b2530e3289c1d22
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: switch dio write path from buffer_head to iomap
> 
> This commit converts the OCFS2 direct I/O write path from the legacy
> buffer_head infrastructure to the iomap framework.
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 21cdc5c29331d..8f8d8e26457bb 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
> 
> [ ... ]
> 
>> @@ -1376,76 +1717,212 @@ static void ocfs2_set_target_boundaries(struct ocfs2_super *osb,
> 
> [ ... ]
> 
>> +static void ocfs2_unwritten_check(struct inode *inode,
>> +				  struct ocfs2_write_ctxt *wc,
>> +				  struct ocfs2_write_cluster_desc *desc)
>>   {
>> +	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>> +	struct ocfs2_unwritten_extent *ue;
>>
>> +	if (!desc->c_needs_zero)
>> +		return;
>>
>> +	spin_lock(&oi->ip_lock);
>> +	ue = ocfs2_find_unwritten(oi, desc->c_cpos);
>> +	/* A hole (c_new is 1) can not be on the list, don't trust it if it is. */
>> +	if (ue && !WARN_ON_ONCE(desc->c_new)) {
>> +		/*
>> +		 * Needs not to zero no matter buffer or direct. The one who is
>> +		 * zero the cluster is doing zero. And he will clear unwritten
>> +		 * after all cluster io finished.
>> +		 */
>> +		desc->c_needs_zero = 0;
>> +		desc->c_clear_unwritten = 0;
> 
> [Severity: High]
> Can a buffered write or mmap page fault lose data or expose uninitialized
> disk blocks when it hits an in-flight direct write's unwritten entry here?
> 
> Unlike direct writes, which wait on oi->ip_unwritten_wq in
> ocfs2_dio_wr_map_blocks(), buffered and mmap writes clear c_needs_zero and
> c_clear_unwritten and proceed while the direct write is still in flight:
> 
> CPU0 (async DIO write)            CPU1 (mmap fault or buffered write)
> ocfs2_dio_wr_map_blocks()
>    ocfs2_write_begin_nolock()
>      ocfs2_dio_add_unwritten()
>    up_write(&oi->ip_alloc_sem)
>    ocfs2_inode_unlock()
>                                    __ocfs2_page_mkwrite()
>                                      ocfs2_write_begin_nolock()
>                                        ocfs2_unwritten_check()
>                                          c_needs_zero = 0
>                                          c_clear_unwritten = 0
>                                        ocfs2_write_cluster()
>                                          /* skips mark_extent_written */
>    bio_iov_iter_get_pages()
>      /* fails with -EFAULT */
>    ocfs2_dio_end_io()
>      ocfs2_free_unwritten_list()   <-- extent stays OCFS2_EXT_UNWRITTEN
> 
> Because ocfs2_dio_wr_map_blocks() maps up to 16MB at once and drops
> ip_alloc_sem and the inode lock before iomap pins user pages or submits
> bios, the direct write can fail or stop short before reaching desc->c_cpos.
> When that happens, neither writer converts the extent to written, so after
> the dirty folio is written back and evicted, reads return zeroes.  In
> addition, ocfs2_grab_folios_direct() only zeroes page cache folios in the
> first and last cluster of the direct write; a partial-page buffered write to
> a middle cluster with c_needs_zero == 0 passes new = 0 to
> ocfs2_map_folio_blocks(), which issues bh_read_nowait() on the unwritten
> extent and reads raw disk contents into the folio around the written bytes.
> 

This issue predates this patch set and is not a regression introduced by this
submission. We will leave it unaddressed for now.

PS: If we were to fix it, one approach would be to wait for unwritten extent
conversion to complete at the buffered/mmap entry points. I had an AI try
this approach, and it triggered more failures in xfstests.

> [ ... ]
> 
>> @@ -2285,95 +2909,149 @@ static int ocfs2_dio_wr_get_block(struct inode *inode, sector_t iblock,
> 
> [ ... ]
> 
>> +again:
>>   	ret = ocfs2_write_begin_nolock(inode->i_mapping, pos, len,
>>   				       OCFS2_WRITE_DIRECT, NULL,
>> -				       (void **)&wc, di_bh, NULL);
>> +				       (void **)&wc, di_bh, NULL, owner);
>> +	if (ret == -ENOSPC &&
>> +	    ocfs2_bytes_to_clusters(inode->i_sb, pos + len) >
>> +	    ocfs2_bytes_to_clusters(inode->i_sb, pos) + 1) {
>> +		/*
>> +		 * There is not room for all of it, but maybe there is for
>> +		 * some, take the first cluster.
>> +		 */
>> +		len = min_t(loff_t, len, osb->s_clustersize -
>> +				(pos & (osb->s_clustersize - 1)));
>> +		goto again;
>> +	}
> 
> [Severity: Medium]
> Does using ocfs2_bytes_to_clusters(inode->i_sb, pos + len) here skip the
> single-cluster fallback when a two-cluster write does not end on a cluster
> boundary?
> 
> ocfs2_alloc_write_ctxt() computes the end cluster as
> (pos + len - 1) >> osb->s_clustersize_bits, whereas ocfs2_bytes_to_clusters()
> shifts pos + len right without rounding up.  If a write spans clusters c and
> c + 1 with pos + len unaligned (for example, pos = 0 and
> len = s_clustersize + 4096), ocfs2_bytes_to_clusters(inode->i_sb, pos + len)
> is c + 1, so c + 1 > c + 1 is false and the write fails with -ENOSPC instead
> of retrying with the first cluster.  Using ocfs2_clusters_for_bytes(inode->i_sb,
> pos + len) (or checking ocfs2_bytes_to_clusters(inode->i_sb, pos + len - 1) >
> ocfs2_bytes_to_clusters(inode->i_sb, pos)) would match wc->w_clen > 1.
> 

will follow the suggestion logic.

> [ ... ]
> 
>> @@ -2386,54 +3064,102 @@ static int ocfs2_dio_end_io_write(struct inode *inode,
> 
> [ ... ]
> 
>> +	for (pass = 0; pass < 2; pass++) {
>> +		list_for_each_entry(ue, head, ue_node) {
>> +			u32 cpos = max(ue->ue_cpos, first_cpos);
>> +			u32 cend = min(ue->ue_cpos + ue->ue_clusters, last_cpos);
>> +
>> +			while (cpos < cend) {
>> +				unsigned int ext_flags;
>> +				u32 phys, num;
>> +
>> +				ret = ocfs2_get_clusters(inode, cpos, &phys,
>> +							 &num, &ext_flags);
>> +				if (ret < 0) {
>> +					mlog_errno(ret);
>> +					goto commit;
>> +				}
>> +				num = min(num, cend - cpos);
> 
> [ ... ]
> 
>> +				ret = ocfs2_mark_extent_written(inode, &et,
>> +						handle, cpos, num, phys,
>> +						meta_ac, &dealloc);
> 
> [Severity: High]
> Can ocfs2_mark_extent_written() fail with -EIO when two adjacent on-disk
> unwritten extent records are physically contiguous?
> 
> ocfs2_get_clusters() consults oi->ip_extent_map, where
> ocfs2_try_to_merge_extent_map() coalesces adjacent logically and physically
> contiguous records that have the same flags into a single cache entry even
> when they remain separate ocfs2_extent_rec entries on disk (for instance,
> across a leaf extent block boundary or after filling a hole between two
> unwritten extents).  Passing that coalesced num to
> ocfs2_mark_extent_written() -> ocfs2_change_extent_flag() ->
> ocfs2_split_extent() trips the check that the split range fits within a
> single on-disk extent record:
> 
> fs/ocfs2/alloc.c:ocfs2_split_extent() {
>      ...
> 	if ((le32_to_cpu(rec->e_cpos) + le16_to_cpu(rec->e_leaf_clusters)) <
> 	    (le32_to_cpu(split_rec->e_cpos) + le16_to_cpu(split_rec->e_leaf_clusters))) {
> 		ret = -EIO;
> 		mlog_errno(ret);
> 		goto out;
> 	}
>      ...
> }
> 
> This aborts unwritten conversion and the i_size update in
> ocfs2_dio_end_io_write(), leaving the written data marked unwritten on disk
> so subsequent reads return zeroes.  Calling ocfs2_get_clusters_nocache() in
> ocfs2_dio_end_io_write() avoids both the -EIO and undercounting
> extents_to_split in pass 0.
> 

agree, will follow above suggestion.

> [ ... ]
> 
>> @@ -2611,10 +3278,79 @@ int ocfs2_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> 
> [ ... ]
> 
>> +static int ocfs2_dio_end_io(struct kiocb *iocb, ssize_t size,
>> +			int error, unsigned int flags, int level)
>> +{
>> +	struct inode *inode = file_inode(iocb->ki_filp);
>> +	loff_t offset = iocb->ki_pos;
>> +	bool recorded = error || (flags & IOMAP_DIO_UNWRITTEN);
>> +	LIST_HEAD(unwritten);
>> +	int ret = 0;
>> +
>> +	if (recorded)
>> +		ocfs2_dio_collect_unwritten(inode, iocb, &unwritten);
>> +
>> +	if (error)
>> +		mlog_ratelimited(ML_ERROR, "Direct IO failed, bytes = %lld errno:%d",
>> +				 (long long)size, error);
>> +
>> +	/* bounced back to buffered I/O, leave the rw_lock held */
>> +	if (size == 0 && error == 0) {
>> +		ocfs2_free_unwritten_list(inode, &unwritten);
>> +		return 0;
>> +	}
>> +
>> +	if (size && error == 0 &&
>> +	    (!list_empty(&unwritten) ||
>> +	     (offset + size > i_size_read(inode)))) {
>> +		ret = ocfs2_dio_end_io_write(inode, offset, size, &unwritten);
>> +		if (ret < 0)
>> +			mlog_errno(ret);
>> +	}
>> +
>> +	ocfs2_free_unwritten_list(inode, &unwritten);
>> +	ocfs2_rw_unlock(inode, level);
>> +
>> +	return ret ? ret : error;
>> +}
> 
> [Severity: High]
> Does dropping ocfs2_rw_unlock() here before ocfs2_file_write_iter() calls
> ocfs2_dio_del_orphan() allow a writer on another node to race on the orphan
> entry?
> 
> inode_lock() only serializes writers on the local node; across the cluster,
> extending direct writes are serialized by the EX rw_lock.  Because
> iomap_dio_complete() runs ocfs2_dio_end_io() before returning to
> ocfs2_file_write_iter(), the cluster rw_lock is released while
> OCFS2_DIO_ORPHANED_FL is still set on disk:
> 
> Node 1                            Node 2
> ocfs2_file_write_iter()
>    ocfs2_rw_lock(inode, 1)
>    ocfs2_add_inode_to_orphan()
>    ...
>    iomap_dio_complete()
>      ocfs2_dio_end_io()
>        ocfs2_dio_end_io_write()
>        ocfs2_rw_unlock(inode, 1)
>                                    ocfs2_file_write_iter()
>                                      ocfs2_rw_lock(inode, 1)
>                                      ocfs2_add_inode_to_orphan()
>                                        /* sees OCFS2_DIO_ORPHANED_FL,
>                                         * cleans up and re-orphans for
>                                         * Node 2's write */
>    ocfs2_dio_del_orphan()
>      ocfs2_del_inode_from_orphan() <-- removes Node 2's active orphan
> 
> If Node 2 crashes during its extending write, the blocks allocated beyond
> i_size will not be truncated during orphan recovery.

I will move del_orphan operation in end_io API (restore the old logic).
btw, ocfs2 uses different node uses itself orphan:xxx to save orphan inode.

> 
>> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
>> index 3d717200d53a4..334ee74dfdea3 100644
>> --- a/fs/ocfs2/file.c
>> +++ b/fs/ocfs2/file.c
> 
> [ ... ]
> 
>> @@ -2420,6 +2429,35 @@ static bool ocfs2_should_use_dio(struct kiocb *iocb, struct iov_iter *iter,
>>   	return true;
>>   }
>>
>> +/*
>> + * Remove the inode from the orphan dir after an appending direct write.
>> + * Only the writer that added the inode (under i_rwsem) may remove it;
>> + */
>> +static int ocfs2_dio_del_orphan(struct inode *inode)
>> +{
>> +	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
>> +	struct buffer_head *di_bh = NULL;
>> +	struct ocfs2_dinode *di;
>> +	int ret;
>> +
>> +	ret = ocfs2_inode_lock(inode, &di_bh, 1);
>> +	if (ret < 0) {
>> +		mlog_errno(ret);
>> +		return ret;
>> +	}
>> +
>> +	di = (struct ocfs2_dinode *)di_bh->b_data;
>> +	if (di->i_flags & cpu_to_le32(OCFS2_DIO_ORPHANED_FL)) {
>> +		ret = ocfs2_del_inode_from_orphan(osb, inode, di_bh, 0, 0);
>> +		if (ret < 0)
>> +			mlog_errno(ret);
>> +	}
>> +
>> +	ocfs2_inode_unlock(inode, 1);
>> +	brelse(di_bh);
>> +	return ret;
>> +}
> 
> [Severity: High]
> Does ocfs2_dio_del_orphan() leak blocks allocated beyond EOF when an
> extending direct write fails or completes short?
> 
> In ocfs2_file_write_iter(), fault_in_iov_iter_readable() is only called when
> iocb->ki_pos > i_size_read(inode), so an append write starting at
> iocb->ki_pos == i_size_read(inode) with an unmapped user buffer allocates
> clusters in ocfs2_dio_wr_map_blocks() (and in ocfs2_dio_zero_eof() on
> non-sparse filesystems) before bio_iov_iter_get_pages() fails with -EFAULT.
> At the out: label, ocfs2_file_write_iter() unconditionally calls
> ocfs2_dio_del_orphan(), which deletes the orphan entry and clears
> OCFS2_DIO_ORPHANED_FL without calling ocfs2_truncate_file(inode, di_bh,
> i_size_read(inode)), leaving the blocks and quota allocated past i_size
> permanently attached to the inode.

I will fix this in next version.

> 
> [ ... ]
> 
>> @@ -2527,26 +2569,123 @@ static ssize_t ocfs2_file_write_iter(struct kiocb *iocb,
>>   		saved_ki_complete = xchg(&iocb->ki_complete, NULL);
>>   	}
>>
>> -	/* communicate with ocfs2_dio_end_io */
>> -	ocfs2_iocb_set_rw_locked(iocb, rw_level);
>> +	/* reload value after inode_lock() and cluster lock */
>> +	append_write = ((iocb->ki_pos + count) >=
>> +			i_size_read(inode) ? 1 : 0);
> 
> [Severity: High]
> If append_write changes from 0 to 1 when reloaded here under
> coherency=buffered, does the extending direct write run with only a shared
> PR rw_lock?
> 
> rw_level is computed and passed to ocfs2_rw_lock() before
> generic_write_checks() updates iocb->ki_pos for O_APPEND / RWF_APPEND and
> before ocfs2_prepare_inode_for_write() refreshes i_size under the cluster
> lock.  When direct_io == 1 and full_coherency == 0, if iocb->ki_pos + count
> was initially below the stale i_size (for example, an O_APPEND write with
> ki_pos == 0 and count < i_size), rw_level is 0 (PR).  Reloading append_write
> to 1 here does not upgrade rw_level to 1 (EX), so orphan manipulation, EOF
> zeroing, block allocation, and i_size updates proceed under a shared PR
> rw_lock and use ocfs2_iomap_dio_ops_w_pr.

In my view, this is existing issue. ignore it.

> 
> [ ... ]
> 
>> +		if (written == -ENOTBLK)
>> +			written = 0;
>> +		if (written == 0 && iov_iter_count(from)) {
>> +			written = direct_write_fallback(iocb, from, ret,
>> +					generic_perform_write(iocb, from));
>> +		}
>> +	} else {
>> +		iocb->ki_flags &= ~IOCB_DIRECT;
>> +		written = __generic_file_write_iter(iocb, from);
>>   	}
>>
>> +	/* buffered aio wouldn't have proper lock coverage today */
>> +	BUG_ON(written == -EIOCBQUEUED && !direct_io);
>> +
>>   	if (unlikely(written <= 0))
>>   		goto out;
>>
>>   	if (((file->f_flags & O_DSYNC) && !direct_io) ||
>>   	    IS_SYNC(inode)) {
> 
> [Severity: High]
> When an O_DIRECT write falls back to buffered I/O here, are O_DSYNC, page
> cache flushing/invalidation, exclusive rw_lock coverage, and IOCB_NOWAIT
> handled properly?
> 
> In the else branch (!ocfs2_should_use_dio()), clearing IOCB_DIRECT before
> calling __generic_file_write_iter() causes it to skip
> direct_write_fallback(), so dirty pages are neither written back nor
> invalidated from the page cache.  On both fallback paths, direct_io remains
> 1, which skips the ((file->f_flags & O_DSYNC) && !direct_io) block below and
> returns from an O_DSYNC write without forcing a journal commit or waiting on
> writeback.  Moreover, if coherency=buffered and append_write == 0, both
> fallback paths perform buffered writes while holding only a shared PR
> rw_lock (rw_level == 0), and if IOCB_NOWAIT is set, they block in
> generic_perform_write() -> ocfs2_write_begin() instead of returning -EAGAIN
> or -EOPNOTSUPP.  Also, in the -ENOTBLK fallback call to
> direct_write_fallback(), passing ret (the return value of
> ocfs2_dio_zero_eof(), which is 0) works only because written is 0; passing
> written would be clearer.
> 

partly agree: direct_write_fallback() should use 0 instead of 'ret'. the direct
fallback logic should be modified. Others are existing issues.

Thanks,
Heming
