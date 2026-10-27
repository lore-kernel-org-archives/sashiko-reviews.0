Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793070517;
	b=j/oC9GgWYSL9ztyIQJVYkJv0GuUmvxOIXx4wlcY6zylA39f5BffT3oW1QSPEH0aJkbl8
	 Bm+4AWMkozpKIsYAh89jjg9Mr9Cobl3w2jM5zRp4RvSAaHeDxpn+omMMUC5DyZOkZHjl4
	 eH6PnpCDkRKY4xGPb4ivojg+LOTzo+wNZXJhfkEEiGxP9Vnf+fAeVLFugWryFRMJVnQ5q
	 aBwzSVBPBeLpJ7sizZzQRxcd+4+kyg3EF6ss/E3fMqJVGZxQARt2E4HT/tjr2VeI1haAx
	 zT/ti2Ih1WdH38ocGS8li+HydTfX5EdDVllKrPWlt+gswLApkLtsSDdzwPNuJH0bdBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793070517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Bt4WTACh8k1/ib0OAXCHLFdz/ZW6rXSy9mJRAbZoBZ4=;
	b=fkNsn6iM5N8yOFxfBISp18Mc+mC3c/cB4CB5IPk5oBefmyCuJTckcWZedKjb2arX4BIp
	 5o1DpSyVWJQ0CjOq7UjEnEZAaWRSMkGuHX4o+dC9BI0ebACiv01jDfcajW0UpR4EGHPY/
	 ON0IKI7sNHvu2uVGz8QBFjxFJn5qMoowp1nF9m0OvBKrcW5IdpH7QxNDxBYSpttT/A1it
	 M3a2cMp07TxeRitJWA9H1WNAS8+7S9AjlQaeBhh9LwrBYxZ72vqc87ghIEnjT8JP2nJPk
	 uKY3tVOFvUgxAo4XGf+excMT7NG88Z24z/iyOKLvCUlZtEFvgvVW2c8AwrZechDfhsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Du32+UoR;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AF2606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 03:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18AF2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Du32+UoR
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215344409so6490215e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 20:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793070514; x=1793675314; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bt4WTACh8k1/ib0OAXCHLFdz/ZW6rXSy9mJRAbZoBZ4=;
        b=Du32+UoRcMFnIDRVPmrWOA39A4oU06K+wyAZS2b4tlBJp28e+7sa2TtrrB2geJP4dK
         iNixgtc+eE1gCLWPXKtPJirNTANfA5M9lfR43rhJRkHrMEI3hyEP9hLTPXKnN8+g1dZt
         vWPCMpBupuM+GDftUkZ1u4S9hEaBbKgpvWwJ++lPzrHjWr8cl3sBLKT7Zw2btI+42sK1
         IsMcxD0FUw4ECwYKCnOWisgBrAthNCQTrdqJYrXz04+YIOcxFF5EYYXAFskwK0bo/jv5
         8j96fvBFja8YkIA+qfroCF3SlWR3RsZU8YpN1TK5B11knXei0uxbPY3tSyA9c19y6V33
         OfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793070514; x=1793675314;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bt4WTACh8k1/ib0OAXCHLFdz/ZW6rXSy9mJRAbZoBZ4=;
        b=vleunUiiICOjDb+DXsHWzvJUAgwM5V9LniItF+MUfyvrsZs2JplGhCYMWsStso3jJM
         RacsBA602wsSRoHwCjd4BdgIhDX3iRuqTWs/rueTzjkmdXxIP/Dk54Qy2LSFApj9AGdT
         LtjAJvudD9rcWLmTGpZIH+IxIWTa8cI/TFx34QDBc55m5YcdGi4Y8bZo+NWnX5kml/gf
         nyy3YjAntIzofL9OPSLFEJv/HRlQoPiqv+BGR7/4HtMYmuEri/EAwEu+o3NJ+2LK4vz2
         Y2RGFOZArpQZ68WZwIMcVYrYMDP02r4BeAxHElyM4Jqwj/8lReR8iVyxkBc6THpaQDqS
         0W2Q==
X-Gm-Message-State: AFq9FYJBowwh3sXEqclvE5DT3oVAZ0oqVXKb+a3ehOs06+uRLovKIZMg
	QQhptJJmKThFrU1BB9qC0yaQ8YaYWWewUgJlwGF3u5LH/fj4C/hLhwVy+xWzNJ2xGa9hMz2A/iG
	UF5oyKgc=
X-Gm-Gg: AYBFou3Nc/dKQLgNHadJQuzB/80RtKgC3z4fsP8urcwt0MwqR9q3u4YWIQ91dJyAuwA
	SXhJniSQCi7K5qeQK8RRcpnHLDcXAmCEHfJwElapAZuf3golapJ5DAzU3obi0g0nwuW3noix5ni
	VmnNLJ/PvVYMw32vWvo5kjJhAcXcWt4UueT6rNLavYpp/g34ZJWIcY0+dyj09cXzhjw6yXzI25s
	AfLjK5yhQRSt6vFT7UcOeVYduSR6VEj5WSsaA3VEecCSdUuXDgyOLrG5eAmQlgzrsfCMqGH4hG8
	CGg66rtkGvkE/9J7a7CQ5+mzMTbaqYmwTWKHOw9YUZdgV9HT2/MCLPF295leveZncqp49wxtCTT
	wcJHydtmydbScciF0wOcTYczvv0tSbKYfnUbAS+RhFhIp26FXCHCu2JCjcIqBieAGxk7F+wFqfb
	haTgqBDbMcVpf7vkQZJa61MlY8Y4uPZumpgdtBCM/oPmWhDIaW+uNQB0rmQT9RwoZA+I0KQDrOF
	2mDjOldgFXVKyOGRJ6ChOjx803ScFsieeo9nI8K4E4PHmDNqwBfjonHKEEI6A==
X-Received: by 2002:a05:600c:6206:b0:4a2:6ef:d1dc with SMTP id 5b1f17b1804b1-4a35ac6fe89mr150081985e9.1.1793070513912;
        Mon, 26 Oct 2026 20:08:33 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9e51dsm2371835ad.64.2026.10.26.20.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 20:08:31 -0700 (PDT)
Message-ID: <26e4d6f9-fb24-4523-8b19-203787753af9@suse.com>
Date: Tue, 27 Oct 2026 11:08:27 +0800
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
Subject: Re: [RFC PATCH v3 3/4] ocfs2: switch dio write path from buffer_head
 to iomap
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261018143319.22329-1-heming.zhao@suse.com>
 <20261018143319.22329-4-heming.zhao@suse.com>
 <sashiko-outbox-176233@kernel.org>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-176233@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/26 23:16, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 11 potential issue(s) to consider:
> - [Critical] ocfs2: multi-cluster map_len in ocfs2_dio_wr_map_blocks() breaks write context
> - [Critical] ocfs2: premature ocfs2_free_unwritten_list() in ocfs2_dio_wr_map_blocks()
> - [Critical] ocfs2: broken error handling and bio failure check in ocfs2_dio_write_end_io()
> - [High] ocfs2: extents_to_split undercount in ocfs2_iomap_dio_end_io_write()
> - [High] ocfs2: orphan entry leak on DIO write error and fallback paths
> - [High] ocfs2: broken locking and sync on DIO fallback in ocfs2_file_write_iter()
> - [High] ocfs2: broken fast path and endblk underflow in ocfs2_dio_wr_map_blocks()
> - [High] ocfs2: accidental revert of buffer_head validation fix in ocfs2_read_blocks()
> - [High] ocfs2: ip_alloc_sem lock inversion in ocfs2_iomap_dio_end_io_write()
> - [High] ocfs2: missing IOMAP_DIO_FORCE_WAIT on intra-cluster extending AIO DIO writes
> - [Medium] ocfs2: missing file_remove_privs() and file_update_time() in iomap DIO write
> --
> 
> commit e9c307eccfa1367c7b156cd785a2734d2998abc3
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: switch dio write path from buffer_head to iomap
> 
> This commit converts the OCFS2 direct I/O write path from the legacy
> buffer_head infrastructure to the iomap framework, refactoring
> ocfs2_write_ctxt to use a flexible array for multi-cluster mappings and
> introducing iomap block mapping and completion handlers.
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 633d23dbbe098..6564b3251b28b 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
> 
> [ ... ]
> 
>> @@ -2347,6 +2356,183 @@ static int ocfs2_dio_wr_get_block(struct inode *inode, sector_t iblock,
> 
> [ ... ]
> 
>> +/* copy from ocfs2_dio_wr_get_block */
>> +static int ocfs2_dio_wr_map_blocks(struct inode *inode,
>> +			       struct ocfs2_map_block *map, int create)
>> +{
>> +	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>> +	struct ocfs2_write_ctxt *wc;
>> +	struct ocfs2_write_cluster_desc *desc = NULL;
>> +	struct buffer_head *di_bh = NULL;
>> +	u64 p_blkno, bpc = ocfs2_clusters_to_blocks(inode->i_sb, 1);
>> +	sector_t iblock = map->lblk;
>> +	unsigned int i_blkbits = inode->i_sb->s_blocksize_bits;
>> +	loff_t pos = iblock << i_blkbits;
>> +	sector_t endblk = (i_size_read(inode) - 1) >> i_blkbits;
>> +	unsigned int total_len = map->len << i_blkbits;
>> +	unsigned int map_len;
>> +	unsigned int cont_clusters = 1;
>> +	int ret = 0, idx;
>> +
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
>> +	    ((iblock + ((total_len - 1) >> i_blkbits)) > endblk))
>> +		total_len = (endblk - iblock + 1) << i_blkbits;
>> +
>> +	/*
>> +	 * Bound how much we allocate/prepare (and journal) per call. map->len
>> +	 * below still reports only the physically-contiguous prefix to iomap;
>> +	 * iomap calls us again for the remainder.
>> +	 */
>> +	map_len = min(total_len, OCFS2_DIO_WR_MAX_MAP_BYTES);
>> +
>> +	mlog(0, "get block of %llu at %llu:%u req %u\n",
>> +			inode->i_ino, pos, map_len, total_len);
>> +
>> +	/*
>> +	 * Because we need to change file size in ocfs2_iomap_dio_end_io_write(),
>> +	 * or we may need to add it to orphan dir. So can not fall to fast path
>> +	 * while file size will be changed.
>> +	 */
>> +	if (pos + total_len <= i_size_read(inode)) {
>> +		/* This is the fast path for re-write. */
>> +		ret = ocfs2_map_blocks(inode, map, OCFS2_GET_BLOCKS_CREATE);
>> +		if ((map->flags & OCFS2_MAP_MAPPED) &&
>> +		    !(map->flags & OCFS2_MAP_NEW) && ret == 0)
>> +			goto out;
>> +
>> +		/* Clear state set by ocfs2_map_blocks. */
>> +		map->flags = 0;
>> +	}
> 
> [Severity: High]
> Are there a few issues with the rewrite fast path and endblk calculation in
> ocfs2_dio_wr_map_blocks()?
> 
> First, ocfs2_map_blocks() is called here without holding oi->ip_alloc_sem
> (unlike ocfs2_dio_wr_get_block(), which called ocfs2_lock_get_block() to
> acquire down_read(&oi->ip_alloc_sem), and unlike ocfs2_iomap_begin()), even
> though ocfs2_map_blocks() -> ocfs2_extent_map_get_blocks() requires
> ip_alloc_sem to be held.

I agree, I overlooked the locking issue. I will add an ocfs2_lock_map_blocks()
(similar to ocfs2_lock_get_block()) in next version.

> 
> Second, ocfs2_map_blocks() returns map->len (> 0) on success rather than 0,
> so checking ret == 0 when OCFS2_MAP_MAPPED is set is never true. When it
> falls through to the slow path, map->len has also been mutated without being
> clamped to total_len >> i_blkbits or restored.

I will change the return value style of ocfs2_map_blocks() based on [1/4]
review comments. this issue will no longer exist.

> 
> Third, when i_size_read(inode) == 0, computing:
> 
> 	sector_t endblk = (i_size_read(inode) - 1) >> i_blkbits;
> 
> underflows the unsigned sector_t to ULLONG_MAX. As a result, the later check
> (iblock > endblk) is false for an empty file, and on a non-sparse filesystem
> where ocfs2_dio_zero_eof() pre-allocated written blocks via
> ocfs2_expand_nonsparse_inode() (leaving desc->c_needs_zero == 0),
> OCFS2_MAP_NEW (and thus IOMAP_F_NEW) will not be set for sub-block writes.

In my view, i_size can never be 0 here. inline inode won't enter the DIO iomap path.

> 
>> +
>> +	ret = ocfs2_inode_lock(inode, &di_bh, 1);
>> +	if (ret) {
>> +		mlog_errno(ret);
>> +		goto out;
>> +	}
>> +
>> +	down_write(&oi->ip_alloc_sem);
>> +
>> +	/*
>> +	 * Note, Zeroing the gap between i_size and the write is done
>> +	 * once per dio by ocfs2_dio_zero_eof() before the io is issued.
>> +	 */
>> +	ret = ocfs2_write_begin_nolock(inode->i_mapping, pos, map_len,
>> +				       OCFS2_WRITE_DIRECT, NULL,
>> +				       (void **)&wc, di_bh, NULL);
>> +	if (ret) {
>> +		mlog_errno(ret);
>> +		goto unlock;
>> +	}
> 
> [Severity: Critical]
> Can passing a multi-cluster map_len (up to OCFS2_DIO_WR_MAX_MAP_BYTES, 1 MiB)
> to ocfs2_write_begin_nolock() trigger a BUG_ON() or expose stale disk data
> when wc->w_clen > 1?
> 
> Previously, ocfs2_dio_wr_get_block() clamped each call to at most one cluster:
> 
> 	len = osb->s_clustersize - (pos & (osb->s_clustersize - 1));
> 	len = min(total_len, len);
> 
> With map_len up to 1 MiB, ocfs2_alloc_write_ctxt() sets wc->w_clen > 1, but
> the downstream helpers in ocfs2_write_begin_nolock() still assume a single
> cluster:
> 
> 1. When osb->s_clustersize > PAGE_SIZE, ocfs2_grab_folios_for_write() only
> grabs page-cache folios for one cluster starting at cpos = wc->w_cpos:
> 
> 	if (new) {
> 		wc->w_num_folios = ocfs2_pages_per_cluster(inode->i_sb);
> 		start = ocfs2_align_clusters_to_page_index(inode->i_sb, cpos);
> 
> If pos is not cluster-aligned and cluster_of_pages is set, wc->w_folios[] is
> populated with folios from the first cluster while wc->w_target_folio is NULL
> (for OCFS2_WRITE_DIRECT). Then ocfs2_write_cluster_by_desc() calls
> ocfs2_write_cluster() for every cluster 0 .. wc->w_clen - 1, re-iterating
> over the same wc->w_folios[] array. If any cluster in the range has
> c_needs_zero == 0 (e.g. a write crossing an unwritten cluster and an already
> written cluster), ocfs2_prepare_folio_for_write() is called with new == 0 and
> hits BUG_ON(!new):
> 
> 	} else {
> 		BUG_ON(!new);
> 
> 2. Also when osb->s_clustersize > PAGE_SIZE, if a multi-cluster allocating
> DIO write ends partway through the final cluster (wc->w_cpos + wc->w_clen - 1),
> ocfs2_grab_folios_for_write() never grabs or zeroes the trailing pages of
> that last cluster because it only indexes pages in wc->w_cpos. When
> ocfs2_iomap_dio_end_io_write() later marks the whole last cluster written,
> those unzeroed trailing pages expose stale on-disk data. In addition,
> cluster_of_pages in ocfs2_write_begin_nolock() only checks
> wc->w_desc[0].c_needs_zero || wc->w_desc[wc->w_clen - 1].c_needs_zero,
> missing intermediate clusters when wc->w_clen > 2.
> 
> 3. Even when osb->s_clustersize == PAGE_SIZE (4 KiB), wc->w_clen can be up to
> 256 clusters. ocfs2_write_begin_nolock() reserves metadata in meta_ac for
> only a single tree growth via ocfs2_lock_allocators(), and starts a
> transaction with credits for one extent operation, but
> ocfs2_write_cluster_by_desc() calls ocfs2_add_inode_data(..., 1, ...) in a
> loop up to 256 times. If fragmented allocations split/grow the extent tree
> more than once across that loop, ocfs2_add_clusters_in_btree() can exhaust
> meta_ac and return -EAGAIN, hitting mlog_bug_on_msg(ret == -EAGAIN, ...) in
> ocfs2_write_cluster().
> 

I agree. For the initial fix, I propose taking the simplest approach and
ignoring I/O performance overhead. We can just use one-cluster-size allocation
in the slow path. We can start a separate patch thread later to implement
the multi-cluster map_len feature.

>> +
>> +	desc = &wc->w_desc[0];
>> +
>> +	p_blkno = ocfs2_clusters_to_blocks(inode->i_sb, desc->c_phys);
>> +	if (p_blkno == 0) {
>> +		ret = -EIO;
>> +		mlog_errno(ret);
>> +		goto unlock;
>> +	}
>> +	p_blkno += iblock & (bpc - 1);
>> +
>> +	/*
>> +	 * Calculate physically contiguous clusters by checking descriptor arrays.
>> +	 * This strictly prevents map->len from expanding past non-contiguous physical bounds.
>> +	 */
>> +	for (idx = 1; idx < wc->w_clen; idx++) {
>> +		if (wc->w_desc[idx].c_phys == wc->w_desc[idx - 1].c_phys + 1 &&
>> +		    wc->w_desc[idx].c_needs_zero == wc->w_desc[idx - 1].c_needs_zero) {
>> +			cont_clusters++;
>> +		} else {
>> +			break;
>> +		}
>> +	}
>> +	map->pblk = p_blkno;
>> +	/*
>> +	 * Only report the mapping as UNWRITTEN when the cluster is newly
>> +	 * allocated or was already unwritten (desc->c_needs_zero). Reporting
>> +	 * an already-written cluster as UNWRITTEN makes the iomap direct-io
>> +	 * core zero the sub-block head/tail padding, which destroys existing
>> +	 * data when a sub-block write lands inside a written cluster.
>> +	 */
>> +	map->flags |= OCFS2_MAP_MAPPED;
>> +	if (desc->c_needs_zero)
>> +		map->flags |= OCFS2_MAP_UNWRITTEN;
>> +	/* subtract the offset */
>> +	map->len = cont_clusters * bpc - (iblock & (bpc - 1));
>> +	map->len = min_t(u64, map->len, map_len >> i_blkbits);
>> +
>> +	if (desc->c_needs_zero)
>> +		map->flags |= OCFS2_MAP_NEW;
>> +
>> +	if (iblock > endblk)
>> +		map->flags |= OCFS2_MAP_NEW;
>> +
>> +	map->flags |= OCFS2_MAP_DEFER_COMPLETION;
>> +
>> +	ocfs2_free_unwritten_list(inode, &wc->w_unwritten_list);
>> +	/* Here returns only two types: map_len (success), errno (failure). */
>> +	ret = ocfs2_write_end_nolock(inode->i_mapping, pos, map_len, map_len, wc);
> 
> [Severity: Critical]
> Does calling ocfs2_free_unwritten_list(inode, &wc->w_unwritten_list) here in
> ocfs2_dio_wr_map_blocks() before the DIO completes cause a subsequent mapping
> of the same cluster to zero out blocks from the first mapping when
> s_clustersize > PAGE_SIZE?
> 
> During ocfs2_write_begin_nolock(), ocfs2_populate_write_desc() ->
> ocfs2_unwritten_check() adds unwritten clusters to oi->ip_unwritten_list so
> that another mapping of the same cluster before DIO completion sees the entry
> on oi->ip_unwritten_list and clears desc->c_needs_zero:
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
> Because ocfs2_dio_wr_map_blocks() removes the cluster from
> oi->ip_unwritten_list immediately while the on-disk extent still has
> OCFS2_EXT_UNWRITTEN set, if ocfs2_dio_wr_map_blocks() is called a second time
> for the same cluster (for example when a write crosses endblk mid-cluster and
> total_len is split at endblk, when cont_clusters < wc->w_clen, when a > 1 MiB
> write is not cluster-aligned, or during concurrent DIO writes under
> coherency=buffered), ocfs2_unwritten_check() will not find the cluster on
> oi->ip_unwritten_list and will leave desc->c_needs_zero = 1.
> 
> ocfs2_grab_folios_for_write() will then grab page-cache folios for the prefix
> of the cluster ([start, target_index - 1]), zero them, and dirty their buffers
> in ocfs2_write_end_nolock(), which kiocb_invalidate_post_direct_write()
> flushes to disk on DIO completion, overwriting the first mapping's data with
> zeros.

I plan to use the .submit_io and .end_io methods in struct iomap_dio_ops.
This way, OCFS2 can pass a private structure to the end_io callback, just like
in the buffer_head path.

> 
>> +	if (ret < 0) {
>> +		mlog_errno(ret);
>> +		goto unlock;
>> +	}
>> +	WARN_ON_ONCE(ret != map_len);
>> +	ret = 0;
>> +
>> +unlock:
>> +	up_write(&oi->ip_alloc_sem);
>> +	ocfs2_inode_unlock(inode, 1);
>> +	brelse(di_bh);
>> +
>> +out:
>> +	return ret;
>> +}
> 
> [ ... ]
> 
>> @@ -2654,8 +2871,193 @@ static int ocfs2_dio_end_io_r_pr(struct kiocb *iocb, ssize_t size,
>>   }
>>   
>>   const struct iomap_dio_ops ocfs2_iomap_dio_ops_r_pr = {
>> -	.end_io = ocfs2_dio_end_io_r_pr,
>> +	.end_io = ocfs2_iomap_dio_end_io_r_pr,
>> +};
>> +
>> +/* copy from ocfs2_dio_end_io_write */
>> +static int ocfs2_iomap_dio_end_io_write(struct inode *inode,
>> +				  loff_t offset,
>> +				  ssize_t bytes)
>> +{
>> +	struct ocfs2_cached_dealloc_ctxt dealloc;
>> +	struct ocfs2_extent_tree et;
>> +	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
>> +	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>> +	struct buffer_head *di_bh = NULL;
>> +	struct ocfs2_dinode *di;
>> +	struct ocfs2_alloc_context *data_ac = NULL;
>> +	struct ocfs2_alloc_context *meta_ac = NULL;
>> +	handle_t *handle = NULL;
>> +	loff_t end = offset + bytes;
>> +	int ret = 0, credits = 0;
>> +	struct ocfs2_map_block map;
>> +	unsigned int blkbits = inode->i_blkbits;
>> +	unsigned int ue_cpos = 0, ue_phys = 0, ue_len = 0;
>> +	unsigned int curr_lblk, end_lblk;
>> +
>> +	map.lblk = offset >> blkbits;
>> +
>> +	ocfs2_init_dealloc_ctxt(&dealloc);
>> +
>> +	ret = ocfs2_inode_lock(inode, &di_bh, 1);
>> +	if (ret < 0) {
>> +		mlog_errno(ret);
>> +		goto out;
>> +	}
>> +
>> +	down_write(&oi->ip_alloc_sem);
>> +
>> +	di = (struct ocfs2_dinode *)di_bh->b_data;
>> +
>> +	ocfs2_init_dinode_extent_tree(&et, INODE_CACHE(inode), di_bh);
>> +
>> +	/* Attach dealloc with extent tree in case that we may reuse extents
>> +	 * which are already unlinked from current extent tree due to extent
>> +	 * rotation and merging.
>> +	 */
>> +	et.et_dealloc = &dealloc;
>> +
>> +	ret = ocfs2_lock_allocators(inode, &et, 0, (bytes >> osb->s_clustersize_bits)*2,
>> +				    &data_ac, &meta_ac);
> 
> [Severity: High]
> When bytes < osb->s_clustersize (for example, a 4 KiB DIO write on a
> filesystem with 8 KiB..1 MiB clusters, or a 512-byte write with 4 KiB
> clusters), doesn't (bytes >> osb->s_clustersize_bits) * 2 evaluate to 0
> (and similarly undercount when an unaligned write straddles a cluster
> boundary)?
> 
> In ocfs2_lock_allocators(), when extents_to_split is 0, max_recs_needed is 0.
> If the extent list currently has num_free_extents == 1, the check:
> 
> 	if (!num_free_extents ||
> 	    (ocfs2_sparse_alloc(osb) && num_free_extents < max_recs_needed)) {
> 		ret = ocfs2_reserve_new_metadata(osb, et->et_root_el, meta_ac);
> 
> skips reserving meta_ac. If ocfs2_mark_extent_written() then splits the
> middle of an unwritten extent into three records (requiring two free records),
> ocfs2_grow_tree() will hit:
> 
> 	BUG_ON(meta_ac == NULL && ocfs2_is_dealloc_empty(et));

As mentioned in my previous reply, if we implement the .submit_io and .end_io
methods, this issue can be resolved in the same way as ocfs2_dio_end_io_write()
in the buffer_head path

> 
> Also, should the extent conversion loop below batch transactions using
> OCFS2_DIO_MARK_EXTENT_BATCH like ocfs2_dio_end_io_write() does?

agree. will add in next version.

> 
>> +	if (ret) {
>> +		mlog_errno(ret);
>> +		goto unlock;
>> +	}
>> +
>> +	credits = ocfs2_calc_extend_credits(inode->i_sb, &di->id2.i_list);
>> +
>> +	handle = ocfs2_start_trans(osb, credits);
>> +	if (IS_ERR(handle)) {
>> +		ret = PTR_ERR(handle);
>> +		mlog_errno(ret);
>> +		goto unlock;
>> +	}
>> +	ret = ocfs2_journal_access_di(handle, INODE_CACHE(inode), di_bh,
>> +				      OCFS2_JOURNAL_ACCESS_WRITE);
>> +	if (ret) {
>> +		mlog_errno(ret);
>> +		goto commit;
>> +	}
>> +
>> +	curr_lblk = offset >> blkbits;
>> +	/*
>> +	 * Round the end up so the final partial block (sub-block direct I/O)
>> +	 * is included; otherwise the last, partially-written cluster is left
>> +	 * unwritten and reads back as zero.
>> +	 */
>> +	end_lblk = (offset + bytes + (1 << blkbits) - 1) >> blkbits;
>> +	while (ret >= 0 && curr_lblk < end_lblk) {
>> +		memset(&map, 0, sizeof(map));
>> +		map.lblk = curr_lblk;
>> +		map.len = end_lblk - curr_lblk;
>> +
>> +		ret = ocfs2_assure_trans_credits(handle, credits);
>> +		if (ret < 0) {
>> +			mlog_errno(ret);
>> +			break;
>> +		}
>> +
>> +		ret = ocfs2_map_blocks(inode, &map, 0);
>> +		if (ret < 0) {
>> +			mlog_errno(ret);
>> +			break;
>> +		}
>> +		if (ret == 0)
>> +			break;
>> +
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
>> +				break;
>> +			}
>> +		}
>> +		curr_lblk += map.len;
>> +	}
>> +
>> +	if (end > i_size_read(inode)) {
>> +		ret = ocfs2_set_inode_size(handle, inode, di_bh, end);
>> +		if (ret < 0)
>> +			mlog_errno(ret);
>> +	}
>> +
>> +commit:
>> +	ocfs2_commit_trans(osb, handle);
>> +
>> +unlock:
>> +	up_write(&oi->ip_alloc_sem);
>> +
>> +	if (data_ac)
>> +		ocfs2_free_alloc_context(data_ac);
>> +	if (meta_ac)
>> +		ocfs2_free_alloc_context(meta_ac);
>> +
>> +	down_write(&oi->ip_alloc_sem);
>> +	if (!ret && (di->i_flags & cpu_to_le32(OCFS2_DIO_ORPHANED_FL))) {
>> +		ret = ocfs2_del_inode_from_orphan(osb, inode, di_bh, 0, 0);
>> +		if (ret < 0)
>> +			mlog_errno(ret);
>> +	}
>> +	up_write(&oi->ip_alloc_sem);
> 
> [Severity: High]
> Doesn't re-acquiring down_write(&oi->ip_alloc_sem) around
> ocfs2_del_inode_from_orphan() invert the lock order and trigger a recursive
> lockdep splat?
> 
> In ocfs2_init_locked_inode(), all non-quota inodes (including regular files
> and ORPHAN_DIR_SYSTEM_INODE) share the lockdep class
> &ocfs2_file_ip_alloc_sem_key for ip_alloc_sem.
> 
> Inside ocfs2_del_inode_from_orphan(), the code takes
> inode_lock_nested(orphan_dir_inode, I_MUTEX_NONDIR2) and then
> ocfs2_orphan_del() -> ocfs2_find_entry() -> ocfs2_read_virt_blocks() ->
> ocfs2_extent_map_get_blocks() acquires OCFS2_I(orphan_dir_inode)->ip_alloc_sem.
> Normally orphan directory operations acquire orphan_dir_inode->i_rwsem before
> ip_alloc_sem, whereas holding oi->ip_alloc_sem here acquires ip_alloc_sem
> before orphan_dir_inode->i_rwsem (and then nests a second ip_alloc_sem of the
> same lockdep class). Notice that ocfs2_dio_end_io_write() called
> ocfs2_del_inode_from_orphan() after up_write(&oi->ip_alloc_sem) without
> re-taking ip_alloc_sem.
> 

I will follow commit d647c5b2fbf81.

>> +	ocfs2_inode_unlock(inode, 1);
>> +	brelse(di_bh);
>> +
>> +out:
>> +	ocfs2_run_deallocs(osb, &dealloc);
>> +	return ret;
>> +}
>> +
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
>> +	if (size && ((flags & IOMAP_DIO_UNWRITTEN) ||
>> +		    (offset + size > i_size_read(inode)))) {
>> +		ret = ocfs2_iomap_dio_end_io_write(inode, offset, size);
>> +		if (ret < 0)
>> +			mlog_errno(ret);
>> +	}
>> +
>> +	error = ocfs2_iomap_dio_end_io(iocb, size, error, level);
>> +
>> +	return error;
>> +}
> 
> [Severity: Critical]
> What happens in ocfs2_dio_write_end_io() when a write bio fails or when
> ocfs2_iomap_dio_end_io_write() returns an error?
> 
> In iomap_dio_bio_iter(), dio->size is incremented as bios are submitted, so
> when a bio fails on completion, iomap_dio_complete() calls end_io with
> size > 0 and error < 0. Because ocfs2_dio_write_end_io() does not check
> !error before calling ocfs2_iomap_dio_end_io_write(), a failed write will
> still mark OCFS2_EXT_UNWRITTEN extents as written and extend i_size, exposing
> stale uninitialized disk blocks to userspace.
> 
> Conversely, when error == 0 and ocfs2_iomap_dio_end_io_write() fails with
> ret < 0, ret is logged with mlog_errno(ret) but never propagated to error, so
> ocfs2_dio_write_end_io() returns 0 and the write syscall reports success.

I will follow ocfs2_dio_end_io() code logic to change the error handling of
ocfs2_dio_write_end_io() , return 'ret' not input parameter 'error' to caller.

> 
> Also, inside ocfs2_iomap_dio_end_io_write(), if the while loop breaks out
> with ret < 0, execution falls through to:
> 
> 	if (end > i_size_read(inode)) {
> 		ret = ocfs2_set_inode_size(handle, inode, di_bh, end);
> 		if (ret < 0)
> 			mlog_errno(ret);
> 	}
> 
> which extends i_size over unconverted extents, overwrites the negative ret
> with 0, and removes the inode from the orphan directory.

will change the code base on commit d647c5b2fbf81

> 
>> diff --git a/fs/ocfs2/buffer_head_io.c b/fs/ocfs2/buffer_head_io.c
>> index 1e2e4fe90abcb..41103e4603263 100644
>> --- a/fs/ocfs2/buffer_head_io.c
>> +++ b/fs/ocfs2/buffer_head_io.c
>> @@ -334,6 +334,8 @@ int ocfs2_read_blocks(struct ocfs2_caching_info *ci, u64 block, int nr,
>>   						wait_on_buffer(bh);
>>   					put_bh(bh);
>>   					bhs[i] = NULL;
>> +				} else if (bh && buffer_uptodate(bh)) {
>> +					clear_buffer_uptodate(bh);
>>   				}
>>   				continue;
>>   			}
>> @@ -362,11 +364,8 @@ int ocfs2_read_blocks(struct ocfs2_caching_info *ci, u64 block, int nr,
>>   				BUG_ON(buffer_jbd(bh));
>>   				clear_buffer_needs_validate(bh);
>>   				status = validate(sb, bh);
>> -				if (status) {
>> -					if (buffer_uptodate(bh))
>> -						clear_buffer_uptodate(bh);
>> +				if (status)
>>   					goto read_failure;
>> -				}
>>   			}
>>   		}
>>   
> 
> [Severity: High]
> Was this change to ocfs2_read_blocks() in fs/ocfs2/buffer_head_io.c included
> by mistake?
> 
> It appears to revert commit 6371a07148ee ("ocfs2: fix buffer head management
> in ocfs2_read_blocks()"). When new_bh is true and validate(sb, bh) fails,
> jumping to read_failure without clearing BH_Uptodate enters the
> if (new_bh && bh) branch and skips the else-if branch, leaving the failed
> buffer head marked BH_Uptodate with BH_NeedsValidate cleared in the block
> device cache.

This is accident revert operation. I will restore the commit 6371a07148ee code.

> 
>> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
>> index 519d4fb213db3..04d676ff7aa59 100644
>> --- a/fs/ocfs2/file.c
>> +++ b/fs/ocfs2/file.c
> 
> [ ... ]
> 
>> @@ -2489,26 +2497,78 @@ static ssize_t ocfs2_file_write_iter(struct kiocb *iocb,
>>   		saved_ki_complete = xchg(&iocb->ki_complete, NULL);
>>   	}
>>   
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
>> +			dio_flags = IOMAP_DIO_FORCE_WAIT;
>> +		}
> 
> [Severity: High]
> Should IOMAP_DIO_FORCE_WAIT also be set when an AIO DIO write extends i_size
> within an already-allocated cluster (where iocb->ki_pos + count >
> i_size_read(inode), even if ocfs2_clusters_for_bytes() does not increase)?
> 
> When s_clustersize > s_blocksize, a block-aligned extending AIO DIO write that
> stays within the last allocated cluster leaves dio_flags as 0, so
> __iomap_dio_rw() submits the bio asynchronously and returns -EIOCBQUEUED.
> ocfs2_file_write_iter() then drops inode_unlock(inode) while i_size has not
> yet been updated on this node (and ocfs2_rw_lock() does not serialize
> same-node writers once the node holds EX). A subsequent write on the same
> node can then observe the stale i_size in generic_write_checks() or
> ocfs2_dio_zero_eof() and overwrite or zero the in-flight AIO DIO range.

The code logic here matches the buffer_head path. If there's a real bug,
we can fix it in a separate patch.

> 
> [Severity: Medium]
> Also, in this new iomap DIO write branch in ocfs2_file_write_iter(),
> __generic_file_write_iter() is no longer called, so neither
> file_remove_privs() nor file_update_time() (or kiocb_modified()) is invoked.
> Since ocfs2_iomap_dio_end_io_write() only calls ocfs2_set_inode_size() when
> end > i_size_read(inode), won't non-extending O_DIRECT writes skip clearing
> SUID/SGID/file capabilities (when not already handled by
> ocfs2_prepare_inode_for_write()) and never update mtime/ctime?

will add kiocb_modified() in ocfs2_file_write_iter() on next verion.

> 
>> +
>> +		ret = ocfs2_dio_zero_eof(inode, iocb->ki_pos, count);
>> +		if (ret < 0)
>> +			goto out;
>>   
>> -	written = __generic_file_write_iter(iocb, from);
>> -	/* buffered aio wouldn't have proper lock coverage today */
>> -	BUG_ON(written == -EIOCBQUEUED && !direct_io);
>> +		const struct iomap_dio_ops *dops = rw_level ?
>> +			&ocfs2_iomap_dio_ops_w_ex : &ocfs2_iomap_dio_ops_w_pr;
>> +		struct iomap_dio *dio;
>>   
>> -	/*
>> -	 * deep in g_f_a_w_n()->ocfs2_direct_IO we pass in a ocfs2_dio_end_io
>> -	 * function pointer which is called when o_direct io completes so that
>> -	 * it can unlock our rw lock.
>> -	 * Unfortunately there are error cases which call end_io and others
>> -	 * that don't.  so we don't have to unlock the rw_lock if either an
>> -	 * async dio is going to do it in the future or an end_io after an
>> -	 * error has already done it.
>> -	 */
>> -	if ((written == -EIOCBQUEUED) || (!ocfs2_iocb_is_rw_locked(iocb))) {
>> -		rw_level = -1;
>> +		dio = __iomap_dio_rw(iocb, from, &ocfs2_iomap_ops,
>> +				     dops, dio_flags, NULL, 0);
>> +		if (dio == NULL) {
>> +			/* No I/O issued; rw_lock still held. */
>> +			written = 0;
>> +		} else if (IS_ERR(dio)) {
>> +			written = PTR_ERR(dio);
>> +			/*
>> +			 * -EIOCBQUEUED: async I/O; end_io will drop the lock on
>> +			 * completion. Any other error means no I/O started and
>> +			 * end_io was not called, so the cleanup path below drops
>> +			 * the lock.
>> +			 */
>> +			if (written == -EIOCBQUEUED)
>> +				rw_level = -1;
>> +		} else {
>> +			/*
>> +			 * Synchronous completion. iomap_dio_complete() runs
>> +			 * end_io, which drops the lock unless the mapping
>> +			 * bounced us back to buffered I/O (returns 0, lock
>> +			 * retained).
>> +			 */
>> +			written = iomap_dio_complete(dio);
>> +			if (written != 0)
>> +				rw_level = -1;
>> +		}
>> +		/*
>> +		 * iomap_dio_rw() returns -ENOTBLK when it could not invalidate
>> +		 * the page cache for the DIO range (e.g. racing buffered/mmap
>> +		 * I/O on the same file, as exercised by generic/095). Fall back
>> +		 * to a buffered write for the remaining data, the same way
>> +		 * ext4/xfs do, instead of leaking -ENOTBLK to userspace.
>> +		 */
>> +		if (written == -ENOTBLK)
>> +			written = 0;
>> +		if (written >= 0 && iov_iter_count(from)) {
>> +			iocb->ki_flags &= ~IOCB_DIRECT;
>> +			buffered = __generic_file_write_iter(iocb, from);
>> +			written = direct_write_fallback(iocb, from, written, buffered);
>> +		}
>> +	} else {
>> +		iocb->ki_flags &= ~IOCB_DIRECT;
>> +		written = __generic_file_write_iter(iocb, from);
>>   	}
> 
> [Severity: High]
> Does this orphan handling in ocfs2_file_write_iter() leak the orphan directory
> entry (and any blocks allocated beyond i_size) on error or fallback paths?
> 
> ocfs2_add_inode_to_orphan() sets OCFS2_DIO_ORPHANED_FL on disk before
> ocfs2_dio_zero_eof() and __iomap_dio_rw(), but ocfs2_del_inode_from_orphan()
> is only called from ocfs2_iomap_dio_end_io_write() when:
> 
> 	if (size && ((flags & IOMAP_DIO_UNWRITTEN) ||
> 		    (offset + size > i_size_read(inode))))
> 
> If ocfs2_dio_zero_eof() fails, if __iomap_dio_rw() fails before running
> end_io (such as -ENOTBLK falling back to buffered I/O, -EAGAIN, or -ENOMEM),
> if end_io runs with size == 0 (such as -EINVAL or -EFAULT after
> ocfs2_dio_wr_map_blocks() already allocated blocks beyond i_size), or if a
> short DIO write completes without exceeding i_size or setting
> IOMAP_DIO_UNWRITTEN, ocfs2_del_inode_from_orphan() is never called. Leaving
> OCFS2_DIO_ORPHANED_FL set on disk also causes ocfs2_delete_inode() to skip
> wiping the inode when the file is later unlinked.

If we implement the .submit_io and .end_io methods, orphan handling would
effectively mirror the buffer_head path, which might make this issue go away
entirely.

> 
> [Severity: High]
> Are there also locking and sync issues when falling back to buffered I/O in
> ocfs2_file_write_iter()?
> 
> 1. If iomap_dio_complete(dio) returns a partial write (written > 0) with
> iov_iter_count(from) > 0, ocfs2_dio_write_end_io() has already dropped
> ocfs2_rw_unlock() and rw_level is set to -1, so the subsequent
> __generic_file_write_iter(iocb, from) runs without holding ocfs2_rw_lock at
> all. And on a -ENOTBLK fallback (written == 0) for an overwrite under
> coherency=buffered, rw_level is 0 (PR), so the buffered write runs under a
> shared rw_lock instead of EX.
> 
> 2. In the else branch (when ocfs2_should_use_dio() returns false), clearing
> iocb->ki_flags &= ~IOCB_DIRECT before calling __generic_file_write_iter()
> prevents __generic_file_write_iter() from calling direct_write_fallback() to
> write back and invalidate the page cache.
> 
> 3. In both fallback paths, IOCB_DIRECT is cleared on iocb->ki_flags while the
> local variable direct_io remains 1, so the subsequent sync check:
> 
> 	if (((file->f_flags & O_DSYNC) && !direct_io) ||
> 	    IS_SYNC(inode)) {
> 
> skips jbd2_journal_force_commit() (and filemap_fdatawrite_range() /
> filemap_fdatawait_range() on the !ocfs2_should_use_dio() path) for O_DSYNC
> writes that fell back to buffered I/O.

will use generic_perform_write() to replace __generic_file_write_iter(),
and don't clear IOCB_DIRECT in iocb->ki_flags.

Implementing the .submit_io and .end_io methods will take some time,
but I hope to finish it this week.

Thanks,
Heming
> 
>>   
>> +	/* buffered aio wouldn't have proper lock coverage today */
>> +	BUG_ON(written == -EIOCBQUEUED && !direct_io);
>> +
>>   	if (unlikely(written <= 0))
>>   		goto out;
> 
> [ ... ]
> 

