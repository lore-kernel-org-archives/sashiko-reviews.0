Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804417;
	b=iP56rXVUpYnIuDnayiBLWRjYZjG4cBYzvUrp01HzGhtDElha6ynceTsPBK+fUotavP5c
	 sjp4cqF0OtwX5/JLCMq/un2fRnqBJ7aUknMBtoxMBoSTb3EmQJxtQuHq101g6Qnwux83s
	 bFKxJI87wGEuBdGtYv/FN1hIwboG+LEY/LQsIP3YmSX5aBYhgqROcm2lJKqAcZF2Mlfw2
	 gI2/U0BKdwSv8f2u2pyGFyu2uKtfZJwVSipvyCTKoxbTuFekUDNFH3Gljo/JcK3z+l8+k
	 XBp5pAKfhp51f7+1X/sQdhwWu16U26QjTz2zv8X8QQ0YjbEAsJzED8FnqczrfaEaLgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zClXYY3ezcuPoGJy8e664BKKjOAyesZAVuecVDWXgx4=;
	b=pKjdofOnTfW4NcUU5CcxDSy0Nly0NPNuV0E2N8nmBwa/GcxGzZmt0wjQgzbgCieS2P8O
	 G8mgYy4Kf+ml1nAK+eqxiAfweXVRRdDjfd2C41B0FKnRuQNOb02HQm49XcWkWOHxTIxPu
	 BJvoMbIoEq8/HkBVaU8e3Vqru+xIpkW8B+96L5HaYAlU8jE9pVAWd72YwypzPepHH2Qg5
	 CcEqS9PlHYqyagkeyP1ZBMXIcA0ibh6dgefkxwbblJUqpUoN1H8uSop7zrEWFCDrmBOYZ
	 U9EbeXHFN8jJmwPlUgcGzsBxaiXG57IiWVXe6QgaBfAr5rVhCgDBPYubefLjMsQ8EFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HF2bhAxq;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584E9606A32C
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 15:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 584E9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HF2bhAxq
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso2866425e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 07:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793804415; x=1794409215; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zClXYY3ezcuPoGJy8e664BKKjOAyesZAVuecVDWXgx4=;
        b=HF2bhAxqNIEBD7cXiNdAF6/9mIkvmMA8ZL00w6V24lNRwirgYkYlvsm09Jj/ekqJz+
         sVEvQXa1aQq8mtqaN2a+tpsBEZuUTcUKc9Q8Ln7eBcNiOoUuXx8EZ6u9qN7Ts9FYQc66
         a0Gkon72C+/5XT4YFyDzasfTdYU7IeJhf1Csin9+OL6T4UiLAobkBMvBahRbDoEARofu
         rGFiKBa5MhaTv4fbpqgLEff5qp4TWIuCWURDPBuZ7cuCW4fPXAhnXC/Mqv835Iz5E/gk
         Chss83sgcmETj489k0CZ+Va8g35HEsm1kxDIz62A+IEKN/D7emi0B1pZnYbm43sCj5qf
         Og3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804415; x=1794409215;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zClXYY3ezcuPoGJy8e664BKKjOAyesZAVuecVDWXgx4=;
        b=Q8wkMhMQr3WIpaXR9gEsbArab5FF6YucYX/voxcQ42EIdnI8mPNzzhukIU1Fno5Wqn
         lkKD5qWjdwp5CpmAKzLfwNcCwym/ok8Knb5QqeK76kE7I0Rf9gtL5/dwi+HyC9N2xI4B
         vq+Md4HC9m0tHXMhZBfNES1mwYO1aOr21IxfLHSkKTxr5pUBornN2fqz0AR4CR2oZ/Ka
         rOyBkPvjpIF5rITyPvQ4o6bTG5yvYPg2Yg2EQCM56/EyE8P1A9M0rxg4hRa/RuC393IU
         P4YZKWZJiVuGVIr4qt0QUrBPU8o7S6xJWaYcKb/EwOSCybZ2zMgBjkNx9/84fgpi8N0U
         wuwA==
X-Gm-Message-State: APuU4Z8b/ruWyjJfrneHPLuWuPSU49jL8QlVH6Pl/TZM9UOJ24qNWuGi
	4KEAAiNiMfJ/x9k4swDNadiZ779uY+sp94BB3HNv0QYc5BH9Xd7rYAZyZHxYvdbtX76XA1kjcJy
	o4S9xx+U=
X-Gm-Gg: AYBFou1hzNPzcAkdk+Im3ZJZPeCg4Jb9OiU7/sO3M9diNi8tenPXWhcxDf+Cy3O8rTh
	sZTqhTg/7WIFkS87tr9cZ1UNqiMF+PQKJ1HwHzq9zQX0qxBQZA54nR1xvzD6Hxa5tIy6dBK85OT
	dyaaQddtzo/60ADqgh1Mq7975dKr+YL0zhNS1lP2O98016lybEhnuC1CN5gq6oYe8hcXE6Ajo2v
	SK5w0K780LcO++9WuJEfTJCxB/n5Q+DvX/JwlX+RRs0eaVkzBBumytfpIyRF9Xk+eu66Yu15TZ9
	VuaH9WyHMa8UaAt0XF9l8u48iag65c3Wb1zcOM3HNrSd6FAsQ+XsNiqgMZrXcxD9c/4ia7/ApOj
	Vt4lIwW7DFcMFwAL5hCTRYEaUHpKv74eAtUve+MwtZJpBFeWkxYJdkCG2gncpodIBDQiB5Nbxut
	sfBaoCMh1tDAskfJnw/JIGgk0cnGYggVoGgMDQnBdhj/K7nhKrMgipjYIPryk4U4PWINW6FuosX
	dR1W65FNOZY2jKJq6jEBJum2RrYju7k4qHUOCiF6jlSrQm2k46UeTvRt+zq6HJxiKlYAFVQQXaJ
	cDsrsFvvIlLRsPr86buI7NLuls7wy8HzDlI=
X-Received: by 2002:a05:600c:a293:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4ac17d19a54mr241235445e9.2.1793804414006;
        Wed, 04 Nov 2026 07:00:14 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46440cc7sm1298640a12.3.2026.11.04.07.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:00:12 -0800 (PST)
Message-ID: <e4858b30-b7ef-4b45-839b-238dc2f1d2be@suse.com>
Date: Wed, 4 Nov 2026 23:00:09 +0800
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
Subject: Re: [RFC PATCH v4 3/4] ocfs2: switch dio write path from buffer_head
 to iomap
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261103135605.22943-1-heming.zhao@suse.com>
 <20261103135605.22943-4-heming.zhao@suse.com>
 <sashiko-outbox-195604@kernel.org>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-195604@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 23:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 12 potential issue(s) to consider:
> - [Critical] ocfs2: premature ocfs2_free_unwritten_list() in ocfs2_dio_wr_map_blocks()
> - [Critical] ocfs2: missing error check in ocfs2_dio_write_end_io() converts failed writes
> - [High] ocfs2: missing ocfs2_update_inode_fsync_trans() in ocfs2_iomap_dio_end_io_write()
> - [High] ocfs2: extent split undercount and 32-bit lblk in ocfs2_iomap_dio_end_io_write()
> - [High] ocfs2: endblk underflow when i_size is 0 in ocfs2_dio_wr_map_blocks()
> - [High] ocfs2: blocks beyond i_size leaked by ocfs2_dio_del_orphan() on DIO failure
> - [High] ocfs2: broken locking and sync on DIO fallback in ocfs2_file_write_iter()
> - [High] ocfs2: missing IOMAP_DIO_FORCE_WAIT on intra-cluster extending DIO writes
> - [Medium] ocfs2: ignored NOWAIT and ocfs2_map_blocks() error in DIO write path
> - [Medium] ocfs2: duplicate overwrite fast path in ocfs2_dio_wr_map_blocks()
> - [Medium] ocfs2: premature i_size update and page dirtying in ocfs2_dio_zero_eof()
> - [Medium] ocfs2: kiocb_modified() called before ocfs2_prepare_inode_for_write()
> --
> 
> commit bebf2309ecf761d69d9629169e68684e11a1f3ea
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: switch dio write path from buffer_head to iomap
> 
> This commit converts the OCFS2 direct I/O write path from buffer_head to the
> iomap framework, introducing ocfs2_dio_wr_map_blocks(), ocfs2_dio_zero_eof(),
> ocfs2_iomap_dio_end_io_write(), and ocfs2_dio_del_orphan().
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index da53abe59ea0f..6f8890873b86c 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
> [ ... ]
>> +/* copy from ocfs2_dio_wr_get_block */
>> +static int ocfs2_dio_wr_map_blocks(struct inode *inode,
>> +				   struct ocfs2_map_block *map, int create)
>> +{
>> +	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
>> +	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>> +	struct ocfs2_write_ctxt *wc;
>> +	struct ocfs2_write_cluster_desc *desc = NULL;
>> +	struct buffer_head *di_bh = NULL;
>> +	u64 p_blkno;
>> +	sector_t iblock = map->lblk;
>> +	unsigned int i_blkbits = inode->i_sb->s_blocksize_bits;
>> +	loff_t pos = iblock << i_blkbits;
>> +	sector_t endblk = (i_size_read(inode) - 1) >> i_blkbits;
> 
> [Severity: High]
> As reported by Sashiko on RFC v3 [1], when i_size_read(inode) is 0, does
> (i_size_read(inode) - 1) >> i_blkbits evaluate to -1LL and underflow the
> unsigned sector_t endblk to ULLONG_MAX?
> 
> With endblk set to ULLONG_MAX, the later check in ocfs2_dio_wr_map_blocks():
> 
> 	if (iblock > endblk)
> 		map->flags |= OCFS2_MAP_NEW;
> 
> is always false when i_size is 0. On a non-sparse filesystem where
> ocfs2_dio_zero_eof() calls ocfs2_expand_nonsparse_inode() before
> __iomap_dio_rw(), clusters are pre-allocated as written extents while i_size
> remains 0, so desc->c_needs_zero is also 0. Similarly, on a sparse filesystem
> where ocfs2_dio_zero_eof() -> ocfs2_zero_tail() -> ocfs2_zero_extend() ->
> ocfs2_write_zero_page() advances i_size to pos before __iomap_dio_rw() runs,
> endblk becomes (pos - 1) >> i_blkbits == iblock for an unaligned write inside
> an already-allocated written cluster.
> 
> If neither OCFS2_MAP_UNWRITTEN nor OCFS2_MAP_NEW (IOMAP_F_NEW) is set, will
> iomap_dio_bio_iter() skip sub-block zeroing and expose stale disk data?

This is impossible. Only non-inline inodes can enter the iomap DIO write path,
and i_size is protected by i_rwsem.

> 
>> +	unsigned int len, total_len = map->len << i_blkbits;
>> +	int ret = 0;
>> +
>> +	len = osb->s_clustersize - (pos & (osb->s_clustersize - 1));
>> +	len = min(total_len, len);
>> +	/*
>> +	 * map->len is count in ocfs2_iomap_begin according to write
>> +	 * "pos" and "end", we need map twice to return different buffer state:
>> +	 * 1. area in file size, not set NEW;
>> +	 * 2. area out file size, set  NEW.
>> +	 *
>> +	 *		   iblock    endblk
>> +	 * |--------|---------|---------|---------
>> +	 * |<-------area in file------->|
>> +	 */
>> +	if ((iblock <= endblk) &&
>> +	    ((iblock + ((len - 1) >> i_blkbits)) > endblk))
>> +		len = (endblk - iblock + 1) << i_blkbits;
>> +
>> +	mlog(0, "get block of %llu at %llu:%u req %u\n",
>> +			inode->i_ino, pos, len, total_len);
>> +
>> +	/*
>> +	 * Because we need to change file size in ocfs2_iomap_dio_end_io_write(),
>> +	 * or we may need to add it to orphan dir. So can not fall to fast path
>> +	 * while file size will be changed.
>> +	 */
>> +	if (pos + total_len <= i_size_read(inode)) {
>> +		/* This is the fast path for re-write. */
>> +		ret = ocfs2_lock_map_blocks(inode, map, OCFS2_GET_BLOCKS_CREATE);
>> +		if ((map->flags & OCFS2_MAP_MAPPED) &&
>> +		    !(map->flags & OCFS2_MAP_NEW) &&
>> +		    ret == 0)
>> +			goto out;
>> +
>> +		/* Clear state set by ocfs2_map_blocks. */
>> +		map->flags = 0;
>> +	}
> 
> [Severity: Medium]
> Why does ocfs2_dio_wr_map_blocks() repeat the overwrite lookup via
> ocfs2_lock_map_blocks() when its sole caller, ocfs2_iomap_begin(), already
> checked ocfs2_map_blocks() under ip_alloc_sem for offset + length <=
> i_size_read(inode)?
> 
> In addition to duplicating the lock acquisition and extent lookup, if
> IOMAP_ATOMIC is set and the first mapped extent is shorter than orig_mlen,
> ocfs2_iomap_begin() falls through to ocfs2_dio_wr_map_blocks() to handle the
> full range, but this second fast path does not check IOMAP_ATOMIC and returns
> the short mapping, triggering the WARN_ON_ONCE(1) in ocfs2_iomap_begin().
> 

This code was copied from ext4_iomap_begin(), but it is redundant in ocfs2.
I will remove the map_blocks from ocfs2_iomap_begin(). Another reason for
removing it is that ocfs2 does not currently support IOMAP_ATOMIC.

> [ ... ]
>> +	if (desc->c_needs_zero)
>> +		map->flags |= OCFS2_MAP_NEW;
>> +
>> +	if (iblock > endblk)
>> +		map->flags |= OCFS2_MAP_NEW;
>> +
>> +	map->flags |= OCFS2_MAP_DEFER_COMPLETION;
>> +
>> +	ocfs2_free_unwritten_list(inode, &wc->w_unwritten_list);
>> +	/* Here returns only two types: len (success), errno (failure). */
>> +	ret = ocfs2_write_end_nolock(inode->i_mapping, pos, len, len, wc);
> 
> [Severity: Critical]
> As reported by Sashiko on RFC v3 [2], won't calling
> ocfs2_free_unwritten_list(inode, &wc->w_unwritten_list) here in
> ocfs2_dio_wr_map_blocks() before any BIO is submitted corrupt earlier blocks
> of the same cluster when ocfs2_dio_wr_map_blocks() is called a second time
> for that cluster before I/O completion clears OCFS2_EXT_UNWRITTEN?
> 
> In ocfs2_write_begin_nolock() -> ocfs2_populate_write_desc() ->
> ocfs2_unwritten_check(), oi->ip_unwritten_list tracks clusters that are being
> written by in-flight direct I/O while their on-disk extent record still has
> OCFS2_EXT_UNWRITTEN set:
> 
> 	list_for_each_entry(ue, &oi->ip_unwritten_list, ue_ip_node) {
> 		if (desc->c_cpos == ue->ue_cpos) {
> 			BUG_ON(desc->c_new);
> 			desc->c_needs_zero = 0;
> 			desc->c_clear_unwritten = 0;
> 			goto unlock;
> 		}
> 	}
> 
> When s_clustersize > s_blocksize (or s_clustersize > PAGE_SIZE), a single
> direct write can call ocfs2_dio_wr_map_blocks() twice for the same cluster
> (for example, when the write straddles endblk mid-cluster and the clamping
> above splits the mapping into two calls, or under concurrent DIO writes to
> different blocks of the same cluster).
> 
> Because the first call removes the cluster from oi->ip_unwritten_list right
> away, the second call sees OCFS2_EXT_UNWRITTEN still set on disk and nothing
> on oi->ip_unwritten_list, leaving desc->c_needs_zero == 1. That causes
> ocfs2_grab_folios_for_write() and ocfs2_prepare_folio_for_write() to grab,
> zero, and dirty page-cache folios for the surrounding blocks in the cluster
> (including blocks covered by the first mapping), which
> kiocb_invalidate_post_direct_write() then flushes to disk on completion,
> overwriting the direct write data with zeros.
> 

no, this is on purpose.
Here, unwritten_list is retained solely to reuse the buffer_head API;
its lifecycle is confined to the ocfs2_dio_wr_map_blocks() function.

> [ ... ]
>> @@ -2560,9 +2728,32 @@ static int ocfs2_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>>   	map.len = min_t(loff_t, (offset + length - 1) >> blkbits,
>>   			OCFS2_MAX_LOGICAL_BLOCK) - map.lblk + 1;
>>   	map.flags = 0;
>> +	orig_mlen = map.len;
>>   
>>   	if (flags & IOMAP_WRITE) {
>> -		return -EOPNOTSUPP;
>> +		/*
>> +		 * We check here if the blocks are already allocated, then we
>> +		 * don't need to start a journal txn and we can directly return
>> +		 * the mapping information. This could boost performance
>> +		 * especially in multi-threaded overwrite requests.
>> +		 */
>> +		if (offset + length <= i_size_read(inode)) {
>> +			down_read(&oi->ip_alloc_sem);
>> +			ret = ocfs2_map_blocks(inode, &map, 0);
>> +			up_read(&oi->ip_alloc_sem);
>> +			/*
>> +			 * For atomic writes the entire requested length should
>> +			 * be mapped.
>> +			 */
>> +			if (map.flags & OCFS2_MAP_MAPPED) {
>> +				if ((!(flags & IOMAP_ATOMIC) && map.len > 0) ||
>> +				   ((flags & IOMAP_ATOMIC) && map.len >= orig_mlen)) {
>> +					goto out;
>> +				}
>> +			}
>> +			map.len = orig_mlen;
>> +		}
>> +		ret = ocfs2_dio_wr_map_blocks(inode, &map, 1);
> 
> [Severity: Medium]
> What happens in ocfs2_iomap_begin() if ocfs2_map_blocks() returns a negative
> error here, or if flags has IOMAP_NOWAIT set?
> 
> If ocfs2_map_blocks() fails (ret < 0), map.flags is 0, so the error is ignored
> and execution falls through to ocfs2_dio_wr_map_blocks().
> 
> Also, when IOCB_NOWAIT / IOMAP_NOWAIT is used, ocfs2_overwrite_io() in
> ocfs2_prepare_inode_for_write() does not reject OCFS2_EXT_UNWRITTEN extents or
> preallocated clusters beyond i_size. Neither ocfs2_iomap_begin() nor the DIO
> setup in ocfs2_file_write_iter() checks for NOWAIT before calling blocking
> down_read(&oi->ip_alloc_sem), ocfs2_dio_wr_map_blocks(),
> ocfs2_add_inode_to_orphan(), ocfs2_dio_zero_eof(), or setting
> IOMAP_DIO_FORCE_WAIT. Should IOMAP_NOWAIT / IOCB_NOWAIT return -EAGAIN instead
> of blocking on locks, transactions, or synchronous I/O waits?
> 

see previous comment, this area code will be removed.

> [ ... ]
>> +/* copy from ocfs2_dio_end_io_write */
>> +static int ocfs2_iomap_dio_end_io_write(struct inode *inode,
>> +				  loff_t offset,
>> +				  ssize_t bytes)
>> +{
> [ ... ]
>> +	unsigned int blkbits = inode->i_blkbits;
>> +	unsigned int ue_cpos = 0, ue_phys = 0, ue_len = 0;
>> +	unsigned int curr_lblk, end_lblk;
>> +	u32 extents_to_split;
> [ ... ]
>> +	extents_to_split = DIV_ROUND_UP(bytes, 1 << osb->s_clustersize_bits);
>> +	ret = ocfs2_lock_allocators(inode, &et, 0, extents_to_split * 2,
>> +				    &data_ac, &meta_ac);
>> +	if (ret) {
>> +		mlog_errno(ret);
>> +		goto unlock;
>> +	}
>> +
>> +	credits = ocfs2_calc_extend_credits(inode->i_sb, &di->id2.i_list);
>> +
>> +
>> +	curr_lblk = offset >> blkbits;
>> +	/*
>> +	 * Round the end up so the final partial block (sub-block direct I/O)
>> +	 * is included; otherwise the last, partially-written cluster is left
>> +	 * unwritten and reads back as zero.
>> +	 */
>> +	end_lblk = (offset + bytes + (1 << blkbits) - 1) >> blkbits;
>> +	while (ret >= 0 && curr_lblk < end_lblk) {
> 
> [Severity: High]
> As reported by Sashiko on RFC v3 [3], can extents_to_split and end_lblk in
> ocfs2_iomap_dio_end_io_write() miscalculate the range of extents to convert?
> 
> 1. DIV_ROUND_UP(bytes, 1 << osb->s_clustersize_bits) does not account for the
> starting offset alignment: a write with bytes <= s_clustersize that crosses a
> cluster boundary spans 2 clusters (and up to 2 unwritten extents), but
> DIV_ROUND_UP returns 1 instead of
> ocfs2_clusters_for_bytes(inode->i_sb, offset + bytes) -
> (offset >> osb->s_clustersize_bits).
> 
> 2. curr_lblk and end_lblk are 32-bit unsigned int, whereas
> OCFS2_MAX_LOGICAL_BLOCK is 0xFFFFFFFF and struct ocfs2_map_block uses u64 for
> lblk and len. A write reaching block 0xFFFFFFFF causes end_lblk to overflow to
> 0 in 32-bit arithmetic, skipping the loop.
> 
> 3. When ocfs2_dio_write_end_io() calls ocfs2_iomap_dio_end_io_write() only to
> update i_size (where !(flags & IOMAP_DIO_UNWRITTEN)), this function still
> calls ocfs2_lock_allocators() and walks all extents in transactions, which can
> fail with -ENOSPC on a full filesystem even though no unwritten extents need
> splitting.
> 

This is by design; see the code comments for details. The logic here
originates from the buffer_head path, I only add a var extents_to_split.

> [ ... ]
>> +		if (map.flags & OCFS2_MAP_UNWRITTEN) {
>> +			ue_cpos = ocfs2_blocks_to_clusters(inode->i_sb, map.lblk);
>> +			ue_phys = ocfs2_blocks_to_clusters(inode->i_sb, map.pblk);
>> +			ue_len = ocfs2_clusters_for_blocks(inode->i_sb,
>> +						map.lblk + map.len) - ue_cpos;
>> +
>> +			ret = ocfs2_mark_extent_written(inode, &et, handle,
>> +					ue_cpos, ue_len,
>> +					ue_phys,
>> +					meta_ac, &dealloc);
>> +			if (ret < 0) {
>> +				mlog_errno(ret);
>> +				goto commit;
>> +			}
>> +		}
> 
> [Severity: High]
> When ocfs2_iomap_dio_end_io_write() converts unwritten extents for a
> non-extending write (end <= i_size_read(inode)), does anything update
> oi->i_sync_tid and oi->i_datasync_tid via ocfs2_update_inode_fsync_trans()?
> 
> During block mapping in ocfs2_dio_wr_map_blocks(), ocfs2_write_end_nolock()
> skips ocfs2_update_inode_fsync_trans() when wc->w_type == OCFS2_WRITE_DIRECT.
> In ocfs2_iomap_dio_end_io_write(), only the end > i_size_read(inode) branch
> calls ocfs2_set_inode_size() -> ocfs2_mark_inode_dirty() ->
> ocfs2_update_inode_fsync_trans().
> 
> If end <= i_size_read(inode), oi->i_datasync_tid and oi->i_sync_tid are never
> updated for the transaction that cleared OCFS2_EXT_UNWRITTEN, so
> generic_write_sync() -> ocfs2_sync_file() (on O_DSYNC/O_SYNC writes or a
> subsequent fsync()/fdatasync()) will not commit that transaction to the
> journal.
> 

The AI is hallucinating. This assumption does not hold. see
ocfs2_dio_wr_map_blocks, if (end <= i_size_read(inode)), the extent won't
have OCFS2_MAP_UNWRITTEN set.

> [ ... ]
>> +/* See the comments from ocfs2_iomap_dio_end_io_r_pr(). */
>> +static int ocfs2_dio_write_end_io(struct kiocb *iocb, ssize_t size,
>> +			int error, unsigned int flags, int level)
>> +{
>> +	struct inode *inode = file_inode(iocb->ki_filp);
>> +	loff_t offset = iocb->ki_pos;
>> +	int ret = 0;
>> +
>> +	if (error)
>> +		mlog_ratelimited(ML_ERROR, "Direct IO failed, bytes = %lld errno:%d",
>> +				 (long long)size, error);
>> +
>> +	/* bounced back to buffered I/O, leave the rw_lock held */
>> +	if (size == 0 && error == 0)
>> +		return 0;
>> +
>> +	if (size && ((flags & IOMAP_DIO_UNWRITTEN) ||
>> +		    (offset + size > i_size_read(inode)))) {
>> +		ret = ocfs2_iomap_dio_end_io_write(inode, offset, size);
>> +		if (ret < 0)
>> +			mlog_errno(ret);
>> +	}
> 
> [Severity: Critical]
> As reported by Sashiko on RFC v3 [4], shouldn't ocfs2_dio_write_end_io() check
> !error before calling ocfs2_iomap_dio_end_io_write(inode, offset, size)?
> 
> In __iomap_dio_rw(), iomap_dio_bio_iter() adds to dio->size as each BIO is
> submitted. If a submitted BIO fails with an I/O error or a multi-BIO write
> fails on a subsequent segment (e.g., -EFAULT or -ENOSPC), iomap_dio_complete()
> invokes ->end_io() with size > 0 and error < 0. Without an !error check here,
> ocfs2_iomap_dio_end_io_write() marks the unwritten extents as written and
> extends i_size over the failed write range, exposing uninitialized on-disk
> blocks to readers.

will add "!error" condition

> 
>> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
>> index cb465223a8b43..ff333845b339e 100644
>> --- a/fs/ocfs2/file.c
>> +++ b/fs/ocfs2/file.c
> [ ... ]
>> @@ -2505,6 +2542,10 @@ static ssize_t ocfs2_file_write_iter(struct kiocb *iocb,
>>   	}
>>   	count = ret;
>>   
>> +	ret = kiocb_modified(iocb);
>> +	if (ret < 0)
>> +		goto out;
>> +
>>   	ret = ocfs2_prepare_inode_for_write(file, iocb->ki_pos, count, !nowait);
> 
> [Severity: Medium]
> Is it safe to call kiocb_modified(iocb) before ocfs2_prepare_inode_for_write()
> in ocfs2_file_write_iter()?
> 
> For buffered writes and coherency=buffered O_DIRECT writes, the cluster lock
> has not been acquired yet when kiocb_modified() runs. When
> ocfs2_prepare_inode_for_write() subsequently acquires the cluster lock via
> ocfs2_inode_lock_for_extent_tree(), ocfs2_refresh_inode_from_lvb() or
> ocfs2_refresh_inode() overwrites inode->i_mtime and inode->i_ctime from the
> LVB or disk dinode, losing the timestamp update performed by kiocb_modified().
> 
> Furthermore, as noted in ocfs2_prepare_inode_for_write(), OCFS2 drops SUID/SGID
> via ocfs2_write_remove_suid() after refreshing the inode under the cluster
> lock so that file_remove_privs() does not call into ocfs2_setattr() without
> cluster locking context; calling kiocb_modified() first triggers
> file_remove_privs_flags() -> ocfs2_setattr() before
> ocfs2_prepare_inode_for_write() and before IOCB_NOWAIT checks verify that the
> write will not return -EAGAIN.

following the suggestion, call kiocb_modified() after ocfs2_prepare_inode_for_write().

> 
> [ ... ]
>> -	/* communicate with ocfs2_dio_end_io */
>> -	ocfs2_iocb_set_rw_locked(iocb, rw_level);
>> +	if (direct_io && ocfs2_should_use_dio(iocb, from, inode)) {
>> +		if (ocfs2_clusters_for_bytes(inode->i_sb, iocb->ki_pos + count) >
>> +		    ocfs2_clusters_for_bytes(inode->i_sb, i_size_read(inode))) {
>> +			/*
>> +			 * when we are going to alloc extents beyond file size, add the
>> +			 * inode to orphan dir, so we can recall those spaces when
>> +			 * system crashed during write.
>> +			 */
>> +			ret = ocfs2_add_inode_to_orphan(osb, inode);
>> +			if (ret < 0) {
>> +				mlog_errno(ret);
>> +				goto out;
>> +			}
>> +			orphaned = 1;
>> +			dio_flags = IOMAP_DIO_FORCE_WAIT;
>> +		}
> 
> [Severity: High]
> As reported by Sashiko on RFC v3 [5], what happens when an async O_DIRECT
> write extends i_size within the same cluster, so iocb->ki_pos + count >
> i_size_read(inode) but ocfs2_clusters_for_bytes(inode->i_sb, iocb->ki_pos +
> count) == ocfs2_clusters_for_bytes(inode->i_sb, i_size_read(inode))?
> 
> Because dio_flags = IOMAP_DIO_FORCE_WAIT is only set when the cluster count
> increases, an intra-cluster extending AIO write (for example, extending i_size
> from 4 KiB to 8 KiB on a filesystem with 64 KiB clusters) is submitted
> asynchronously without IOMAP_DIO_FORCE_WAIT. __iomap_dio_rw() returns
> -EIOCBQUEUED and ocfs2_file_write_iter() drops inode_unlock(inode) before
> ocfs2_iomap_dio_end_io_write() updates i_size on the completion workqueue.
> 
> Since ocfs2_rw_lock() does not serialize writers on the same node, a subsequent
> write on the same node can acquire inode_lock(inode) while i_size is still at
> its old value: an O_APPEND write will set ki_pos to the stale i_size and
> overwrite the in-flight DIO, or a subsequent extending write will call
> ocfs2_dio_zero_eof() and zero the range of the in-flight DIO via the page
> cache. In addition, if the file was previously extended into a sparse hole via
> ftruncate(), allocating a cluster for that intra-cluster write will allocate
> blocks beyond i_size without adding the inode to the orphan directory.
> 

I chose to ignore this issue for now. The code here is copied directly from
the buffer_head path, so if there is a bug, the existing buffer_head code
shares the exact same problem. If it needs to be addressed, it can be handled
in another patch set.

>> +
>> +		ret = ocfs2_dio_zero_eof(inode, iocb->ki_pos, count);
>> +		if (ret < 0)
>> +			goto out;
> 
> [Severity: Medium]
> If ocfs2_dio_zero_eof() is called here before __iomap_dio_rw(), won't a
> subsequent failure in __iomap_dio_rw() leave i_size permanently increased and
> dirty folios in the page cache?
> 
> When pos > i_size_read(inode) and there are allocated blocks beyond i_size (or
> on a non-sparse filesystem where ocfs2_expand_nonsparse_inode() allocates
> up to pos + count), ocfs2_dio_zero_eof() calls ocfs2_zero_extend() ->
> ocfs2_write_zero_page(), which dirties page-cache folios and commits a
> transaction advancing inode->i_size and di->i_size to pos.
> 
> If __iomap_dio_rw() then fails in kiocb_invalidate_pages() (for instance, with
> -EAGAIN under IOCB_NOWAIT because ocfs2_write_zero_page() just dirtied the
> folio containing pos), or fails alignment validation (-EINVAL) or user page
> pinning (-EFAULT) in iomap_dio_bio_iter(), ocfs2_file_write_iter() returns the
> error to userspace after having already modified i_size and on-disk blocks.
> 

Sorry, I don't quite follow what this comment means. Looking at the code,
if any error occurs, the ocfs2 iomap DIO path never updates i_size.

> [ ... ]
>> +		/*
>> +		 * __iomap_dio_rw() returns -ENOTBLK when it could not invalidate
>> +		 * the page cache for the DIO range (e.g. racing buffered/mmap
>> +		 * I/O on the same file, as exercised by generic/095). Fall back
>> +		 * to a buffered write for the remaining data, the same way
>> +		 * ext4/xfs do, instead of leaking -ENOTBLK to userspace.
>> +		 */
>> +		if (written == -ENOTBLK)
>> +			written = 0;
>> +		if (written == 0 && iov_iter_count(from)) {
>> +			iocb->ki_flags &= ~IOCB_DIRECT;
>> +			written = __generic_file_write_iter(iocb, from);
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
>> @@ -2564,6 +2658,13 @@ static ssize_t ocfs2_file_write_iter(struct kiocb *iocb,
>>   	}
> 
> [Severity: High]
> As reported by Sashiko on RFC v3 [6], when an O_DIRECT write falls back to
> __generic_file_write_iter() in either of the branches above, doesn't this
> violate OCFS2 locking and O_DIRECT / O_DSYNC writeback semantics?
> 
> 1. Under mount option coherency=buffered (!full_coherency), a non-appending
> O_DIRECT write acquires ocfs2_rw_lock() with rw_level == 0 (PRMODE), and skips
> the EX cluster inode_lock flush. Falling back to buffered
> __generic_file_write_iter() without upgrading rw_level to EXMODE runs a
> buffered write under a shared PR rw_lock.
> 
> 2. Clearing iocb->ki_flags &= ~IOCB_DIRECT before calling
> __generic_file_write_iter() causes __generic_file_write_iter() to call
> generic_perform_write() directly instead of direct_write_fallback(), leaving
> the buffered fallback data dirty in the page cache without flushing and
> invalidating it.
> 
> 3. Because the local variable direct_io remains 1 after IOCB_DIRECT is cleared,
> the sync check after the write:
> 
> 	if (((file->f_flags & O_DSYNC) && !direct_io) ||
> 	    IS_SYNC(inode)) {
> 
> is skipped for O_DSYNC writes that fell back to buffered I/O, returning to
> userspace without flushing the dirty pages or committing the journal.
> 

will use "direct_write_fallback(iocb, from, ret, generic_perform_write(iocb, from));"
to replace the fall back buffered write area.

>>   
>>   out:
>> +	/*
>> +	 * IOMAP_DIO_FORCE_WAIT made the dio complete synchronously, so its
>> +	 * end_io has already updated i_size.
>> +	 */
>> +	if (orphaned)
>> +		ocfs2_dio_del_orphan(inode);
> 
> [Severity: High]
> As reported by Sashiko on RFC v3 [7], if an extending direct write fails or
> completes a short write after allocating clusters beyond i_size, won't
> unconditionally calling ocfs2_dio_del_orphan(inode) leak the excess allocated
> blocks beyond i_size?
> 
> Both ocfs2_dio_zero_eof() and ocfs2_dio_wr_map_blocks() allocate and commit
> clusters beyond i_size_read(inode) before user pages are pinned in
> iomap_dio_bio_iter() or BIOs complete. If __iomap_dio_rw() or
> iomap_dio_complete() fails (e.g. -EFAULT, -EINVAL, -ENOSPC, or -EIO) or writes
> fewer bytes than allocated, i_size is not extended to cover those allocated
> clusters.
> 
> Calling ocfs2_dio_del_orphan() removes the inode from the orphan directory and
> clears OCFS2_DIO_ORPHANED_FL without calling ocfs2_truncate_file(inode, di_bh,
> i_size_read(inode)), leaving those clusters permanently allocated past EOF.

The del_orphan action here pairs with the add_orphan operation at the
beginning of this function. If we don't delete it here, the orphaned inode
will remain until the next extending DIO write on this inode, or until
recovery clears it. Because ocfs2_dio_zero_eof() was already called earlier
to zero out the range, a failure will not leak any stale data. As for the
space leak on failure, if this assumption holds true, the existing
buffer_head path has the exact same issue. That should be addressed in a
separate patch set.

Thanks,
Heming

> 
> [1] https://lore.kernel.org/r/20261018143319.22329-4-heming.zhao@suse.com
> [2] https://lore.kernel.org/r/20261018143319.22329-4-heming.zhao@suse.com
> [3] https://lore.kernel.org/r/20261018143319.22329-4-heming.zhao@suse.com
> [4] https://lore.kernel.org/r/20261018143319.22329-4-heming.zhao@suse.com
> [5] https://lore.kernel.org/r/20261018143319.22329-4-heming.zhao@suse.com
> [6] https://lore.kernel.org/r/20261018143319.22329-4-heming.zhao@suse.com
> [7] https://lore.kernel.org/r/20261018143319.22329-4-heming.zhao@suse.com
> 

