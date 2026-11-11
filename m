Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794440482;
	b=L/CUsE/7qG02EKZoTrNP0fuLOOjSHemL2741H3LqmNLusRSwxtw4KWNUJtASEUrZ1BGJ
	 S4UbvdWKeFd5mcl6zTxasyr9iI5OWSGThljs5/fUK8Jxks2WOJFs1iumpNoRyuTkv6Or4
	 zSOGKm2h60MFYHoUZTMARnxb+aKwdPHWNlzngwxrUirohyLKxzL2TWg/7xZvWJug+0u+/
	 +g0d+H4xUJ+QFGZqRnYCSYqk9ScNaLGjYQzoVenHC50KIVaU4w/SgOjM1WLdJzD40MFI6
	 P+aG8V83BUi37LDkdQVvEDCSyaKb8VHmRfRDSUzFTRXfCh09VEN0bGA+u1W0JHA2jww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=pml0Ifcyf2zFkGzj/O0Yn7vWfi12XQ9C+na+kCfnPqs=;
	b=lBhWP8Crw3iH0DMV7iBKFTg2OnAnECyVMqN5WEgYBXx3vUnbbJz2rl2dqmycyS89FFUg
	 HrB7ThmeZlAxO8jxyoeLYijFsgXkcNBe6XuUNsLQWY6+bTZrHhAmXNikhfJjknhrDa6mD
	 H/siggVqZwJW0IFZXI1oWi0fzlimpBW795kwYgjBUBfD6oUq4lCSjTvFYqQqHxP9tczmT
	 +zLpNpU0ZEzJVVpCNIECv5iAYKetuejd4/5QRjemLU+skiL+1stubYLVzHXUy1H/vwqDA
	 0Xz8E5SJOCYE5/iJPOxiLaBAloOvm9y2Up7ILRK85s03tYmuO1FLmPQfhIjs0AKhWXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=T16LXloI;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127D6606A324
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 23:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 127D6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=T16LXloI
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a68f888a41so957625e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 15:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794440480; x=1795045280; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pml0Ifcyf2zFkGzj/O0Yn7vWfi12XQ9C+na+kCfnPqs=;
        b=T16LXloILGyvQeFyFglNAfAqJLN+uBwcyt2LkX5v/QEU+DNCFi4uMAx1xstH5qKK4v
         kTCu1gqWB94AFZLrBjHFEPBzkATNJmiRnEpqIcb1Qt3v6s5555rO8nBqq9eWnYrW8cpl
         D5V5JJP5NVgIDKJDXrRgdJab1cYGwEfhal4bQWb9MXi/7HQsrEoXnkIRB/g5NYsKX0ze
         /xqJQGyQmlzqc4SRbIzcB1S3gx2dHB65E+jaybum5/fXirkTsac6KGY22sURnKBWzBAP
         WPRZfyoYVS5T8MLWBaB59fEyT1p4omF8DZ0a/BY7sia1s/aiZF9PBfljdn/o2gQrs5PE
         76Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794440480; x=1795045280;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pml0Ifcyf2zFkGzj/O0Yn7vWfi12XQ9C+na+kCfnPqs=;
        b=dI163VcSkWyIz1MkgAo8tMVtsNfY4v9qicf6uOrc8akQmQfXACIJrHJl56QWKi5Yc6
         4JY2dJwZayn4atu31I4jCl4nvn9lA+7SmAPHTbk9dpyqtBYsup8MVbHCnQPC2BJcG/BX
         tw8xYaGSxBYDAZqxCrYXkfbUEPXtb1RHiLnAKPFI6Spa+1d2iS+pGsSYROuQ002HlcSv
         zahQOmu7caksetyFiCrQ9bQ/zoBaYA0/uYRP7OFNsjbqfBQw2ViqWvKYYUHVicfhJKJI
         uwZufA8M38Y4RhayHBi3hoI2GjudzSCapTIwASD24X2nvQMZ0scnhsBBa8salv18G/Wn
         6i6w==
X-Gm-Message-State: APuU4Z9uG+kGvhwGA500Yn3geCNrTdXcxNLuGCSzpDq2z16GRORzExBD
	c4/rThFHsmC6EE9+4zui2eFKtVYNPB6lbabbA2n/DxvfpHyFzzsdpg8exXQZVzmMFcAWJkRxvz9
	cEXuxzFo=
X-Gm-Gg: AYBFou368gfLOQbpLVHMZqpVFS1/8cj0XGZhn6OsJGY5KYPTS0vLlHu1CLb6TTjFlpl
	LpG1NVc4dNT4E9a1UzCVpcvFDQ5NsN26uDpAjA8oZc3HIhg7HGOWJvher6g15iIMRPaVsh/iZsb
	WE6kY48B5D//gWdD4aES059gWf9W9Gw10AE2clJPwB6iaevB16uSJFjxnkGGrNN9VFaSFgLTJQ1
	f5qSKAHzJ2D8wvT07iOsIhyofEXG18mM3FNENIAfmqRnxd1s2+y3R5rO9nDri5S94CYGvVFDU6W
	0xL1pg0IH3ffpbXasFlqsDY5eP1EbJ932jjfAR6crnBHTtthFVgUs+JxBzMyyEm/4OX9YUjINV1
	4VpQMsrRgC0JBaTzTKjyzZiyyH+YfGRJWs/dZIBf+u73EWcRjN60vEHuFSaW+DwP7rSkQumfj9/
	bIpHmU+qUUbwFPX042a5g2VMMxbi8UiUZZW8oK9pq/KdWDBviEb6tiPMiihoJ+IuvgXszQkwGgN
	tEQZ8bDF+H8VC4k8YSHClwXIfqGxErZILWgGnShZIH3xbmqBUoCc1W+2PPCWyNmKNlk/i7xnMGI
	oXpcYPGpsKVk6fbdFyo/q5+kNwDyp3XiTxI=
X-Received: by 2002:a05:600d:8448:b0:4b6:2242:d0be with SMTP id 5b1f17b1804b1-4ba091a5d00mr50596525e9.0.1794440480307;
        Wed, 11 Nov 2026 15:41:20 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm21901238eec.17.2026.11.11.15.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 15:41:19 -0800 (PST)
Message-ID: <e44ee3c3-7d94-44e3-a0a2-fa8e95265cb2@suse.com>
Date: Thu, 12 Nov 2026 07:41:15 +0800
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

I agree.
This critical issue is exactly where I am sticking now.
I current thinking is to switch ocfs2 to ext4-style multi-cluster
blocks allocation (it currently allocates only one cluster at a time).
Everything else in this patch set are easy to fix; this is the only real
blocker. I'll give it a try, though I am not 100% confident.

Thanks,
Heming
