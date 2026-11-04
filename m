Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773816;
	b=spXejfMk/KdZqMU4uUGDdwAKxz8TxZo0AT8CqJ1vq1JYh9jGe1Y19/OJoUCXCloCyo/2
	 TXWbewFYvdTmfK/XlkOWpbwavnJk7+8vfRhgdGz/7Xbh/yeAVa2ctern/osR7d5LkmdUT
	 fdt22+MeiegdXtmSu8PwE2POKKcbxM4m7v1tpDebFTYKyk1oqFRprKO+3SeTte5AFzdq+
	 nxg+PlVyRpJHh66fX0hXRVkWCjgVr8S5Q5P8IFOlwHVy/DwKcwPuPafNjDSHYkEQ309eI
	 edmXL66c3DtgkpymiWhfUjq/VM3SKJk9JMAxjpNd4oeOoUA3J2YNl2V7RaczyK3SwGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1Lp8FuQ7Qu1A/RPbAYJ1ABxZw63xpmHjFD1LxVQkX7I=;
	b=y8bWsjcGTdzrcq/xhAUSbajwiSoOVF4yUK2YqpGylU+7tHVimw+EM14elulh0Sx599C9
	 ccPBGHVk88aG/JrzLJdVa5jZ6O/2nsge0O1FZl/h5N9fYiPiwfKbESgbm4WBY1jZA6CNN
	 /0F0hlpsmLEq0cvPcvx/2sNS0SapszIrimhFcvEdX1X/r9zOqdECCkgiu19ykm0+WEd0g
	 spR6+7o6chStNf5Vug1xeKQKqeUIOcXrNe8K/SlJrNE7R42U130Ev0ofihcqVsLoKqORW
	 aWh+6eHqneJ5C2J2QXO/ySVwERszew45FbAWNSLOEPJJH+12RJJ7vGDl1aEHXcUIsgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RtVEzMrj;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716D5606A326
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 06:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 716D5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RtVEzMrj
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a7a3b29c11so515005e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 22:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793773814; x=1794378614; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Lp8FuQ7Qu1A/RPbAYJ1ABxZw63xpmHjFD1LxVQkX7I=;
        b=RtVEzMrjXV+W5WNkU8aKh8lgrPDf8S3ahvW35fyktFynvKtPzaIT820uD7Uu1Jh5wh
         /DPizIXkoKz7wgLGGnDqdwe9dgPzSLN0FtiSNWzayV0SfRRQTF4KmycuuTTxbU+kmdD4
         CpEeSqlFNSG3yRI7y7qpiWsxw+Y/1+uVALH46Z/txCBEr4z54uAa1wkSUv4njI1AwSl+
         pSiU951/jW9zVaUN4gqlZR07HXueJo6r23J+XNNk7IYay4kqpSuMeX8BdcP/OkKrK8gq
         hQLoA2eCvee3os/TGdMeniFQ6THaIyFRejXDbF/+Ns5jDBbY9HPC7Mwyq4gzUtkSL6vW
         FBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773814; x=1794378614;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Lp8FuQ7Qu1A/RPbAYJ1ABxZw63xpmHjFD1LxVQkX7I=;
        b=Gj6k6uKwvwujAraqIh5HSFClcVtgBlyrfrmcDHhZ6R0DoUci8GSKTfc4pU8ahVEn6C
         TliW9t1LkE1079CbOi4kenoG01GnOgM6XfKRhc31vg2rBT1sMXtPjg7qUWsQx/GDoBwQ
         +cwDsC79B0iKPxHZz9MuGkCx9yjCwuavqIoF6Imu3yD3/jtcIAEVDbTDuNP4B7JWaTJU
         OWDOzBb0uXCas8QSmO7sxQWfFDS3VJsqTSsgQmO5+WNGQ4GLvuMTaqHpcWH4uMFi8pzI
         Z0oMQzvdMR9qdBi6a4Ih+nqwWQSSNuj9Lmag5jB9nJIl21iUXNtT31znPTxGvfE+17os
         HXlA==
X-Gm-Message-State: APuU4Z+wP14Ax6QhfZ5ln+KZvYzvFdbPLZ488MJwavRAVHa/URRuNPq/
	uskNc5Altq6dlm1PP8ksSULo/AbF2kX9evaGSK9oJAkzKv23DD4/zT/t70jfxK7VgZTlx4HaeHS
	ur8DSmJs=
X-Gm-Gg: AYBFou1KRbNEWlGAx3CDZQ7brLNsFwsudgZsUwj9T/ZB+FuGYEuS2bIssMhQiZJRTqJ
	YMdPSa6IuqnrXLPdEGfQTm6S7ILnh2mjZZr8stDTk+NhzDI9/yyFfBTCsBFfyF0s1u2/2+3FVaL
	fiuY+TupRBxg/XZF98v4hfHssc19Padzeq3l2RRLF/oHfylsZB69JWJ/irR2NCuNH/ap6CpAmfc
	yoBnqXYk4pLUW/B1j4LQdoR/Taj0vjzwA3QBWF9r5Q1iX/B5mzuu3gA8paHyOYSQMpkK8tUu++3
	4Jx5zFEtW8V5DZYBUYFrivjx7thdkY3Gzfb6eBS4J06PwIGONWY1HdgqKghInskaICIfNfpSOZW
	BGjbWgdRA8Ci3wAgoKcQxDOg/x8MBvIo/mAwae7lC/WeVnLIlqGAw2BZ1pq/FsIIByic9Dfnt1P
	sMAjcbObcViHl7dWcTG7rQOtuUU4b/KPyjbO8L32bluDa1iN3/tyYhf8fx4wzfjkscANJsfQjA+
	bVi+370YuRN8gb3pZnzV9vUV2xBQWBPhSiUc7I2Fg1gnhX2XLH68xaTCjJZjI6XPqaf+xn5mbxU
	HFKAmebND0EwKOo/4gJk6wHcSePhbkHDhOrJ5uTWSnIYuJbdlQdGa4A=
X-Received: by 2002:a05:600c:2604:b0:4a1:b027:99ef with SMTP id 5b1f17b1804b1-4ac16acfa8emr257615305e9.2.1793773813670;
        Tue, 03 Nov 2026 22:30:13 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm5673463eec.27.2026.11.03.22.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 22:30:12 -0800 (PST)
Message-ID: <1683df2b-bb7d-452e-bddc-687824796318@suse.com>
Date: Wed, 4 Nov 2026 14:30:09 +0800
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
Subject: Re: [RFC PATCH v4 2/4] ocfs2: switch DIO read path from buffer_head
 to iomap
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261103135605.22943-1-heming.zhao@suse.com>
 <20261103135605.22943-3-heming.zhao@suse.com>
 <sashiko-outbox-195456@kernel.org>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-195456@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 22:32, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] ocfs2: incorrect 32-bit block limit in ocfs2_iomap_begin()
> - [High] ocfs2: unallocated blocks past EOF treated as -EIO in ocfs2_iomap_begin()
> - [Medium] ocfs2: ocfs2_file_read_iter() treats DIO EOF return as buffered fallback
> --
> 
> commit 92ddac462b74a2afb48b468bc3394e087a5099af
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: switch DIO read path from buffer_head to iomap
> 
> This commit migrates the ocfs2 direct I/O read path from the legacy
> buffer_head infrastructure to iomap. It introduces ocfs2_iomap_begin() and
> ocfs2_iomap_dio_ops_r_pr, and updates ocfs2_file_read_iter() to use
> __iomap_dio_rw() and iomap_dio_complete().
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index c612244690a10..da53abe59ea0f 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
> [ ... ]
>> @@ -2541,6 +2542,116 @@ static ssize_t ocfs2_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
>>   				    ocfs2_dio_end_io, 0);
>>   }
>>   
>> +static int ocfs2_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>> +		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
>> +{
>> +	int ret;
>> +	struct ocfs2_map_block map;
>> +	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>> +	u8 blkbits = inode->i_blkbits;
>> +
>> +	if ((offset >> blkbits) > OCFS2_MAX_LOGICAL_BLOCK)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Calculate the first and last logical blocks respectively.
>> +	 */
>> +	map.lblk = offset >> blkbits;
>> +	map.len = min_t(loff_t, (offset + length - 1) >> blkbits,
>> +			OCFS2_MAX_LOGICAL_BLOCK) - map.lblk + 1;
>> +	map.flags = 0;
> 
> [Severity: High]
> As reported by Sashiko on RFC v3 [1], does limiting map.lblk and map.len to
> OCFS2_MAX_LOGICAL_BLOCK (0xFFFFFFFF) break direct I/O reads on large files?
> 
> In ocfs2, cluster indices (e_cpos and ip_clusters) are 32-bit, whereas
> logical block offsets (map.lblk and v_blkno) are 64-bit. As shown in
> ocfs2_max_file_offset(), sb->s_maxbytes is bounded by the 32-bit cluster
> limit (UINT_MAX - 1 clusters):
> 
> fs/ocfs2/super.c:ocfs2_max_file_offset() {
> 	/*
> 	 * i_size and all block offsets in ocfs2 are always 64 bits
> 	 * wide. i_clusters is 32 bits, in cluster-sized units. So on
> 	 * 64 bit platforms, cluster size will be the limiting factor.
> 	 */
> 	...
> 	return (((unsigned long long)bytes) << bitshift) - trim;
> }
> 
> When s_clustersize_bits > s_blocksize_bits, valid file offsets below
> sb->s_maxbytes have 64-bit logical block numbers exceeding 0xFFFFFFFF (for
> example, offsets at or above 16 TiB with 4 KiB blocks and 8 KiB or larger
> clusters). Checking (offset >> blkbits) > OCFS2_MAX_LOGICAL_BLOCK rejects
> direct I/O reads at those offsets with -EINVAL.
> 
> Conversely, when s_clustersize_bits == s_blocksize_bits, a direct I/O read
> starting below sb->s_maxbytes that spans into logical block 0xFFFFFFFF passes
> this check and reaches ocfs2_map_blocks() -> ocfs2_extent_map_get_blocks() ->
> ocfs2_get_clusters() -> ocfs2_figure_hole_clusters() with v_cluster ==
> UINT_MAX:
> 
> fs/ocfs2/extent_map.c:ocfs2_figure_hole_clusters() {
> 	if (i == le16_to_cpu(el->l_next_free_rec)) {
> 		*num_clusters = UINT_MAX - v_cluster;
> 	}
> }
> 
> That sets *num_clusters = 0 and produces a zero-length mapping (iomap->length
> == 0), triggering WARN_ON_ONCE() in iomap_iter_done() and failing the read
> with -EFAULT.
> 

The max file size is sb->s_maxbytes (about 4PB), the block number is 0x3FFFFFFF800.
In this patch, OCFS2_MAX_LOGICAL_BLOCK is derived from EXT4_MAX_LOGICAL_BLOCK
(0xFFFFFFFE)
If anyone doesn't object this value, I will keep the current definition.

>> +
>> +	if (flags & IOMAP_WRITE) {
>> +		return -EOPNOTSUPP;
>> +	} else {
>> +		down_read(&oi->ip_alloc_sem);
>> +		ret = ocfs2_map_blocks(inode, &map, 0);
>> +		up_read(&oi->ip_alloc_sem);
>> +	}
> 
> [Severity: High]
> What happens here on a non-sparse ocfs2 filesystem (!ocfs2_sparse_alloc(osb))
> when a direct I/O read starts before i_size and its buffer extends past the
> allocated clusters (ip_clusters)?
> 
> In __iomap_dio_rw(), iomi.len is initialized to iov_iter_count(iter) without
> clamping to dio->i_size. After iomap_iter() maps the allocated blocks up to
> i_size, it invokes ocfs2_iomap_begin() for the remaining requested range past
> i_size, expecting an IOMAP_HOLE mapping so iomap can zero the tail and revert
> the iterator.
> 
> However, ocfs2_should_use_dio() in this commit only checks
> OCFS2_INLINE_DATA_FL (the !ocfs2_supports_append_dio(osb) check for I/O
> extending past i_size from ocfs2_direct_IO() is dropped here and only
> re-added in the next commit in the series, and even then remains bypassed
> whenever ocfs2_supports_append_dio(osb) is set).
> 
> When ocfs2_iomap_begin() calls ocfs2_map_blocks() for a logical block beyond
> ip_clusters, ocfs2_extent_map_get_blocks() returns p_blkno = 0, and
> ocfs2_map_blocks() treats the unallocated post-i_size block as an error:
> 
> fs/ocfs2/aops.c:ocfs2_map_blocks() {
> 	if (!ocfs2_sparse_alloc(osb)) {
> 		if (map->pblk == 0) {
> 			err = -EIO;
> 			mlog(ML_ERROR, ...);
> 			...
> 			dump_stack();
> 			goto bail;
> 		}
> 	}
> }
> 
> Wouldn't any short direct I/O read crossing i_size into unallocated blocks on
> a non-sparse filesystem log ML_ERROR, call dump_stack(), and fail with -EIO?
> 

ignore this, it's the same as the buffer_head handling logic.

>> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
>> index 8307c4bdc1a9f..cb465223a8b43 100644
>> --- a/fs/ocfs2/file.c
>> +++ b/fs/ocfs2/file.c
> [ ... ]
>> @@ -2628,17 +2641,48 @@ static ssize_t ocfs2_file_read_iter(struct kiocb *iocb,
>>   	}
>>   	ocfs2_inode_unlock(inode, lock_level);
>>   
>> -	ret = generic_file_read_iter(iocb, to);
>> +	if (direct_io && ocfs2_should_use_dio(iocb, to, inode)) {
>> +		/*
>> +		 * Use the split iomap DIO API so we can tell who owns the
>> +		 * rw_lock on return; reads always hold it at PR level, dropped
>> +		 * by ocfs2_iomap_dio_end_io_pr(). Call it directly rather than
>> +		 * through generic_file_read_iter(): iomap advances iocb->ki_pos
>> +		 * itself, so the generic helper would advance ki_pos twice.
>> +		 */
>> +		struct iomap_dio *dio;
>> +
>> +		dio = __iomap_dio_rw(iocb, to, &ocfs2_iomap_ops,
>> +				&ocfs2_iomap_dio_ops_r_pr, 0, NULL, 0);
>> +		if (dio == NULL) {
>> +			/* No I/O issued; rw_lock still held. */
>> +			ret = 0;
>> +		} else if (IS_ERR(dio)) {
>> +			ret = PTR_ERR(dio);
>> +			if (ret == -EIOCBQUEUED)
>> +				rw_level = -1;
>> +		} else {
>> +			ret = iomap_dio_complete(dio);
>> +			if (ret != 0)
>> +				rw_level = -1;
>> +		}
>> +		/*
>> +		 * A 0 result means the mapping bounced us back to buffered I/O
>> +		 * (e.g. inline data); the rw_lock is still held. Go to the
>> +		 * buffered path rather than re-entering direct I/O.
>> +		 */
>> +		if (ret == 0) {
>> +			iocb->ki_flags &= ~IOCB_DIRECT;
>> +			ret = generic_file_read_iter(iocb, to);
>> +		}
> 
> [Severity: Medium]
> As reported by Sashiko on RFC v3 [2], doesn't setting ret = 0 when dio ==
> NULL cause every direct I/O read at or past i_size to fall back to a buffered
> read?
> 
> In __iomap_dio_rw(), a read with iomi.pos >= dio->i_size jumps to
> out_free_dio with ret = 0 and returns NULL:
> 
> fs/iomap/direct-io.c:__iomap_dio_rw() {
> 	if (iov_iter_rw(iter) == READ) {
> 		if (iomi.pos >= dio->i_size)
> 			goto out_free_dio;
> }
> 
> Since inline data inodes are already filtered out by ocfs2_should_use_dio()
> and ocfs2_iomap_begin() never returns -ENOTBLK on reads, ret == 0 here occurs
> when __iomap_dio_rw() returns NULL at or beyond i_size. Clearing IOCB_DIRECT
> and calling generic_file_read_iter() will then enter filemap_read(). If a
> concurrent writer extends i_size after __iomap_dio_rw() sampled dio->i_size,
> filemap_read() will perform a buffered read on the direct I/O descriptor
> (populating the page cache, serving unaligned buffers, and bypassing the
> !direct_io && nowait check at the top of ocfs2_file_read_iter() when
> IOCB_NOWAIT is set).
> 
> [1] https://lore.kernel.org/r/20261018143319.22329-3-heming.zhao@suse.com
> [2] https://lore.kernel.org/r/20261018143319.22329-3-heming.zhao@suse.com
> 

will change to: if (ret == 0 && iocb->ki_pos < i_size_read(inode))

Thanks,
Heming
