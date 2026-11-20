Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148550;
	b=lhJojRaOJXrXZCgDue05dP1NhsY8S2HRZi72jbDC0bVN0kvWbCs1qROcr3c6uYCih+Bt
	 jq9e2u/2dWvPf+lYtr/59LQPpM8DPZboKQXYciWfifstgdX12ug3EuO1yi6H+AXgaioYM
	 U01y0g+5eJ2XJquX+2GjKDEyOJysahNP6INAx9sFicWLFagx0B72l4Nut4UMoh94MEWEA
	 jwzP+ipgncc0aJVy0WjhT3+uXAJOGKivXKZslAwQcfrKlrAhYHSAh3QSYZ45QwJHRH0UF
	 LTmC0kLKfqbp/QVNFg8WikDihQ2PnWQIlvMVNDehI5SFPed3HW/JcxRW6uhtKwfpooQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BloJTicOFqTZDUXhsxLOkL6B/pLMohBq/mPCP2PDvsw=;
	b=A0fr2jDsS7qr4FsMOU0AzaWEOxLyeGY4745D6TIRvN7jKcM0IX3Q5S0JyV4Gg2v2aG2V
	 cBkgTTdc/bt6jZYUU54vGOjEqqfQtAD+swmXUlX06xXX/ykVBn9IAGD5291T0T96d/UsJ
	 lU3mDO5lSkwm3IKmQrvdnqUyX8b/7p2Oqi3OmmOMBbS5jv1f2qfDWxE3uRKNLOdVfKcC8
	 9DRHMzNLVjaStCQuVi7aD2DFeFCnj/i4c/CkStc4Tx4QEtzrqNk6iVpzzKJyQFKsvono4
	 aLb431i2rpOEZ5iNLOf+TjtPuavna7chIjTkW9FzkghUMO2sL1lXmLuJDhjiVsZXSrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=a0sjlxxb;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9CE606A320
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 04:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B9CE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=a0sjlxxb
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c504707acfeso6750466b.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 20:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795148547; x=1795753347; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BloJTicOFqTZDUXhsxLOkL6B/pLMohBq/mPCP2PDvsw=;
        b=a0sjlxxbY2iKIthakP6TNlbtA4vGGT4n5FHBfK8s6NzGUCqPTE8vQA4JlpLDyKtKPN
         dwHPebk/egKvNH2JSNe3KRScrMfqP2Em4N35M6S1x9vqbbWuuVUylzicwZ8FyivRxQr6
         wpKKaX0wMAJRMozx/JpriepkvtsaK7qeNOaMDReo0auhdkRnoi0ovygssSwxzryMIQ0c
         i6aqNdsCKhZsZg53Bc2ONd1cZmgMdhS7C2B8vcw7U3FYzNUWdpn5Czal2LRBEkFxvLcT
         4fqtgFj57JQDplVEj0kSBVZa6YfyeqSmFIuJ5cnnHgIeieoy8UxvEIWHGi04BIiPq4z4
         q+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795148547; x=1795753347;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BloJTicOFqTZDUXhsxLOkL6B/pLMohBq/mPCP2PDvsw=;
        b=nokhxHLmeVoLURDOOxsQJeKpXURbdAle60ohlo9g2J8VkEsVrfv3Wzh9eBoMFQPsY5
         4SOnCSfrG9ax4LTDPrcOYK8zAkfNEnmVClfVcfoyyYtxtpnA13ibOMnJnN46YUFLvxlg
         YdiD49aSavMXdKDrroNXJDbVucELoRawjiPodMm/hOUqfOXwhXl3MJAb7lrnZN81m8WJ
         0tIiihD6zt+6R3juBY31Md1f8lIkFAswdN980w8ptQNPoAqdV3a5ODeMxXevQQch89fv
         YuaL5xKVLUJe8sO1vzf/ihjkXiWIl1OyzEqCc7wAFMJl8LaAOwjfHOYHa1f7GEq29UZK
         GUng==
X-Gm-Message-State: APuU4Z8jAGKzHOOrbzvaV78y7vhFslcj7vf7rM6ObDvCvb1kNwmFyYXh
	vEUMTYWV/l3Z2QBdz5LGdzCWXgU+O2KZi5DSwRJY8c9JIPjD6OLw39RvOWHkvMlMeOIrzVgySOR
	Gcvu7q6M=
X-Gm-Gg: AYBFou2tZXmv8b3RthDOt0XV8d2lBT4zN58iGKz03h8UN2o2/s4YeFgr6LL1y+3aRh1
	J7p5w9fa2ZHLlKh7XsT6UWD+uvZVmuOO5ZnURdK61/QppXTseb/tNboCqSjUWkDPBDWZSXaMUx7
	xBsDXt3JanRY7KIVV07UljKgCTz2U000Wf5cemPlU5X+DNq9Ud7sdrK/B3i2Z0mg/+ukuD32m40
	hil6uPBkRKXTQd6YvpPyW2b2ovAO9v8DriT2vVitDkVuWtsq1RhrkwUHY/g7/4plG8fanuSpfwY
	LJnIMJJhGeOQuH35NHInhb9DtPQ3ojvD0N78UAqkrw+SuuAlxjClY0x2J2uJuZhOOabcWVMkxpZ
	bSblW3DWkNiLs+9kRVrbXF+yy70B2Ltw3hSUhWtDciReUcs9OGsXdFyd1+6HNw/nfHjxYuwR8/d
	+mbCV5k3rst/lM2uO1bnquAom7Be0lQBIrrTvXzdSR/N5JjluGh67MAm+Uv2EnL338Qm88FLYKt
	lKdsyqPMQaVkYyu9WHJBZHgT/aJjSoNKEdzbt3OepAY9CdPHQrtZVzVsJtiMka3Wwsbs6AYv5nA
	K41ahvdJ06hCtiMRPxPNKXq1Eecruw8/7kw=
X-Received: by 2002:a17:906:ad93:b0:c41:8e21:4d62 with SMTP id a640c23a62f3a-c513a4391ffmr156771066b.1.1795148547433;
        Thu, 19 Nov 2026 20:22:27 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402bfcf06sm2749003a91.4.2026.11.19.20.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 20:22:26 -0800 (PST)
Message-ID: <9888621e-0511-4ed3-813e-e3a198cf9e7b@suse.com>
Date: Fri, 20 Nov 2026 12:22:22 +0800
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
Subject: Re: [RFC PATCH v8 3/3] ocfs2: switch dio write path from buffer_head
 to iomap
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261119064029.11910-1-heming.zhao@suse.com>
 <20261119064029.11910-4-heming.zhao@suse.com>
 <sashiko-outbox-222560@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-222560@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 15:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential
> issues to consider:
> - [High] ocfs2: data corruption in ocfs2_unwritten_check() racing with
>    in-flight DIO
> - [High] ocfs2: unzeroed sub-page blocks in ocfs2_grab_folios_direct()
>    on unwritten DIO
> - [High] ocfs2: leak of orphan state and post-EOF clusters on DIO write
>    failure
> - [High] ocfs2: skipped O_DSYNC commit and bad lock mode on DIO write
>    fallback
> - [High] ocfs2: missing rw_lock upgrade after reloading append_write
> - [Medium] ocfs2: u32 cluster truncation in ocfs2_dio_wr_map_blocks()
>    cap_end near s_maxbytes
> - [Medium] ocfs2: uninitialized ip_dio_orphan_pid in
>    ocfs2_inode_init_once()
> - [Medium] ocfs2: off-by-one append_write check rejects RWF_NOWAIT at
>    EOF
> --
> 
> commit 8112d6f9133d337b4bfbd643ba1711c27d614d85
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: switch dio write path from buffer_head to iomap
> 
> This commit converts the OCFS2 direct I/O write path from the legacy
> buffer_head infrastructure to the iomap framework, mapping multi-cluster
> extents in ocfs2_dio_wr_map_blocks() and converting unwritten extents upon I/O
> completion in ocfs2_dio_end_io_write().
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 21cdc5c29331d..984d6d6fdca33 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
> [ ... ]
>> @@ -1084,7 +1167,85 @@ static int ocfs2_prepare_folio_for_write(struct inode *inode, u64 *p_blkno,
>>   }
>>   
>>   /*
>> - * This function will only grab one clusters worth of pages.
>> + * Grab the folios a direct write has to take care of, w_folios is laid out as
>> + * two windows of one cluster's worth of pages each:
>> + *
>> + *   [0, ppc)    the pages of the first cluster of the write
>> + *   [ppc, 2ppc) the pages of the last cluster of the write
>> + *
>> + * A direct write goes to the disk directly, so the pages inside of the user
>> + * range are not touched and stay NULL.  The clusters in the middle of the
>> + * write are covered by the user range entirely and need nothing at all.  Only
>> + * the head cluster before the user range and the tail cluster after it can have
>> + * pages which are not going to be overwritten, those must be zeroed through the
>> + * page cache if the cluster is new or unwritten (c_needs_zero).
>> + *
>> + * If the write is made of just one cluster, there is only the first window.
>> + *
>> + * Like for the buffered write, nothing past the end of the file is needed, the
>> + * tail is then cut at max(user range end, i_size).
>> + */
>> +static int ocfs2_grab_folios_direct(struct address_space *mapping,
>> +		struct ocfs2_write_ctxt *wc, loff_t user_pos, unsigned user_len)
>> +{
>> +	struct inode *inode = mapping->host;
>> +	unsigned int ppc = ocfs2_pages_per_cluster(inode->i_sb);
>> +	unsigned long target_index = user_pos >> PAGE_SHIFT;
>> +	unsigned long end_index = (user_pos + user_len - 1) >> PAGE_SHIFT;
>> +	loff_t last_byte = max_t(loff_t, user_pos + user_len,
>> +				 i_size_read(inode));
>> +	unsigned long last_index = ((last_byte - 1) >> PAGE_SHIFT) + 1;
>> +	unsigned int nr_win = wc->w_clen > 1 ? 2 : 1;
>> +	int ret = 0, win, i;
>> +
>> +	wc->w_num_folios = 0;
>> +
>> +	for (win = 0; win < nr_win; win++) {
>> +		struct ocfs2_write_cluster_desc *desc =
>> +			win ? &wc->w_desc[wc->w_clen - 1] : &wc->w_desc[0];
>> +		unsigned long start;
>> +
>> +		if (!desc->c_needs_zero)
>> +			continue;
>> +
>> +		start = ocfs2_align_clusters_to_page_index(inode->i_sb,
>> +							    desc->c_cpos);
>> +
>> +		for (i = 0; i < ppc; i++) {
>> +			unsigned long index = start + i;
>> +			struct folio *folio;
>> +
>> +			if (index >= last_index)
>> +				break;
>> +
>> +			/* Track the slots in use, for the unlock/commit loops. */
>> +			wc->w_num_folios = max_t(unsigned int, wc->w_num_folios,
>> +						 win * ppc + i + 1);
>> +
>> +			/* The direct io target has no page cache page here. */
>> +			if (index >= target_index && index <= end_index)
>> +				continue;
> 
> [Severity: High]
> Does skipping every folio in [target_index, end_index] leave unwritten
> sub-page blocks unzeroed when s_blocksize < PAGE_SIZE?
> 
> iomap_dio_zero() only zeroes sub-block padding up to the filesystem block
> size, not up to PAGE_SIZE.  When a direct write to a newly allocated or
> unwritten cluster is block-aligned but does not cover an entire page (for
> example, writing a 1KB block into a 4KB cluster/page), both
> ocfs2_dio_need_zero_folios() and ocfs2_grab_folios_direct() skip the page
> at target_index/end_index, and ocfs2_dio_end_io_write() then marks the whole
> cluster written, exposing stale on-disk data in the unwritten blocks of that
> page.

will switch buffered IO for above case.
> 
> [ ... ]
>> @@ -1376,76 +1717,212 @@ static void ocfs2_set_target_boundaries(struct ocfs2_super *osb,
> [ ... ]
>> +static void ocfs2_unwritten_check(struct inode *inode,
>> +				  struct ocfs2_write_ctxt *wc,
>> +				  struct ocfs2_write_cluster_desc *desc)
>> +{
>> +	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>> +	struct ocfs2_unwritten_extent *ue;
>> +
>> +	if (!desc->c_needs_zero)
>> +		return;
>> +
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
> Can a buffered write or mmap page fault lose data when it hits a cluster on
> ip_unwritten_list owned by an in-flight direct write?
> 
> CPU0 (async DIO write)            CPU1 (mmap fault / buffered write)
> ocfs2_file_write_iter()
>    __iomap_dio_rw()
>      ocfs2_dio_wr_map_blocks()
>        ocfs2_write_begin_nolock()
>          ocfs2_dio_add_unwritten()
>        up_write(&oi->ip_alloc_sem)
>        ocfs2_inode_unlock()
>                                    __ocfs2_page_mkwrite()
>                                      ocfs2_write_begin_nolock()
>                                        ocfs2_unwritten_check()
>                                          desc->c_needs_zero = 0
>                                          desc->c_clear_unwritten = 0
>      /* bio fails or ends short */
>      ocfs2_dio_end_io()
>        /* skips conversion */      /* extent stays OCFS2_EXT_UNWRITTEN */
> 
> ocfs2_dio_wr_map_blocks() now maps up to 16MB of unwritten clusters at once
> and only converts the clusters covered by the completed I/O in
> ocfs2_dio_end_io_write() if the DIO succeeds, which is why direct writes
> wait on ip_unwritten_wq via ocfs2_dio_foreign_unwritten().  Buffered and
> mmap writes do not wait: they clear c_clear_unwritten and c_needs_zero, so
> if the in-flight DIO fails (for example, -EFAULT on a later user page) or
> completes short, the extent is never marked written on disk and reads back
> as zeroes once the folio is evicted; in addition, a partial-page buffered
> write to a folio inside the DIO range that ocfs2_grab_folios_direct() did
> not zero will read raw uninitialized blocks from the unwritten extent.
> 

I have answered in previous sashiko review comments.
This is an existing issue, won't be fixed in this patch set.

> [ ... ]
>> @@ -2151,130 +2727,178 @@ static int ocfs2_write_end(const struct kiocb *iocb,
> [ ... ]
>> +static int ocfs2_dio_wr_map_blocks(struct inode *inode,
>> +				   struct ocfs2_map_block *map,
>> +				   unsigned int flags, void *owner)
>> +{
>> +	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
>> +	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>> +	struct ocfs2_write_ctxt *wc;
>> +	struct ocfs2_write_cluster_desc *desc;
>> +	struct ocfs2_map_block probe;
>> +	struct buffer_head *di_bh = NULL;
>> +	unsigned int blkbits = inode->i_sb->s_blocksize_bits;
>> +	u64 bpc = ocfs2_clusters_to_blocks(inode->i_sb, 1);
>> +	u64 lblk = map->lblk;
>> +	u64 req_len = map->len;
>> +	u64 eof_blk, cap_end;
>> +	loff_t pos = lblk << blkbits;
>> +	loff_t len, end;
>> +	u32 cstart, cend;
>> +	int ret = 0, unwritten;
>> +
>> +retry:
>> +	map->len = req_len;
>> +	map->flags = 0;
>> +	eof_blk = ocfs2_blocks_for_bytes(inode->i_sb, i_size_read(inode));
>>   
>> -	len = osb->s_clustersize - (pos & (osb->s_clustersize - 1));
>> -	len = min(total_len, len);
>> +	/* Do not hand out a mapping which is over the end of the file. */
>> +	if (lblk < eof_blk && lblk + map->len > eof_blk)
>> +		map->len = eof_blk - lblk;
>>   
>> +	map->len = min_t(u64, map->len,
>> +			 max_t(u64, OCFS2_DIO_MAX_MAP_BYTES >> blkbits, bpc));
>>   	/*
>> -	 * bh_result->b_size is count in get_more_blocks according to write
>> -	 * "pos" and "end", we need map twice to return different buffer state:
>> -	 * 1. area in file size, not set NEW;
>> -	 * 2. area out file size, set  NEW.
>> -	 *
>> -	 *		   iblock    endblk
>> -	 * |--------|---------|---------|---------
>> -	 * |<-------area in file------->|
>> +	 * Cap the size of a mapping, but not in the middle of a cluster. The
>> +	 * rest of that cluster, if it is a hole or unwritten, is left to the
>> +	 * next mapping to write. The folios this one would zero there are the
>> +	 * very ones the next one writes directly to the disk, and they would
>> +	 * overwrite that data when they are written back.
>>   	 */
>> -
>> -	if ((iblock <= endblk) &&
>> -	    ((iblock + ((len - 1) >> i_blkbits)) > endblk))
>> -		len = (endblk - iblock + 1) << i_blkbits;
>> -
>> -	mlog(0, "get block of %llu at %llu:%u req %u\n",
>> -			inode->i_ino, pos, len, total_len);
>> +	cap_end = ocfs2_clusters_to_blocks(inode->i_sb,
>> +			(pos + OCFS2_DIO_MAX_MAP_BYTES) >> osb->s_clustersize_bits);
>> +	map->len = min_t(u64, map->len, cap_end - lblk);
> 
> [Severity: Medium]
> Can the cluster number passed to ocfs2_clusters_to_blocks() overflow u32
> when pos is within OCFS2_DIO_MAX_MAP_BYTES of s_maxbytes?
> 
> On 64-bit systems s_maxbytes is UINT_MAX clusters, so when pos is within the
> last 16MB of the maximum file offset, (pos + OCFS2_DIO_MAX_MAP_BYTES) >>
> osb->s_clustersize_bits reaches 0x100000000ULL and truncates in the u32
> parameter of ocfs2_clusters_to_blocks().  cap_end - lblk then underflows
> u64, bypassing the cluster-boundary cap and allowing a non-cluster-aligned
> 16MB mapping to end mid-cluster.
> 

agree, will fix in the next version.

>> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
>> index 3d717200d53a4..87867f65a5156 100644
>> --- a/fs/ocfs2/file.c
>> +++ b/fs/ocfs2/file.c
> [ ... ]
>> @@ -2527,31 +2541,133 @@ static ssize_t ocfs2_file_write_iter(struct kiocb *iocb,
>>   		saved_ki_complete = xchg(&iocb->ki_complete, NULL);
>>   	}
>>   
>> -	/* communicate with ocfs2_dio_end_io */
>> -	ocfs2_iocb_set_rw_locked(iocb, rw_level);
>> +	if (direct_io && ocfs2_should_use_dio(iocb, from, inode)) {
>> +		use_dio = true;
>> +		/* if we do not alignment. */
>> +		if (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(from),
>> +				dio_align)) {
>> +			ret = -EINVAL;
>> +			goto out;
>> +		}
>>   
>> -	written = __generic_file_write_iter(iocb, from);
>> -	/* buffered aio wouldn't have proper lock coverage today */
>> -	BUG_ON(written == -EIOCBQUEUED && !direct_io);
>> +		/* reload value after inode_lock() and cluster lock */
>> +		append_write = ((iocb->ki_pos + count) >=
>> +				i_size_read(inode) ? 1 : 0);
> 
> [Severity: High]
> If append_write changes from 0 to 1 when reloaded here, does rw_level remain
> 0 (PR mode) instead of upgrading the cluster rw_lock to EX?
> 
> On a coherency=buffered mount, rw_level is computed and locked before
> generic_write_checks() updates iocb->ki_pos for O_APPEND/RWF_APPEND and
> before ocfs2_prepare_inode_for_write() refreshes i_size under the cluster
> lock.  An O_APPEND write starting at offset 0 with count < i_size therefore
> acquires ip_rw_lockres in PR mode, reloads append_write = 1 here, and
> proceeds to modify the orphan directory, zero EOF, allocate blocks, update
> i_size, and unlock via ocfs2_iomap_dio_ops_w_pr under a shared PR lock.
> 

no idea about the above suggestion. this is an existing issue.

>> +
>> +		/*
>> +		 * Extending the file means the gap between i_size and the
>> +		 * write is zeroed below, against the i_size we have now, and
>> +		 * that the next writer has to see the new size.  That takes
>> +		 * cluster locks and a transaction, which IOCB_NOWAIT forbids.
>> +		 */
>> +		if (nowait && append_write) {
>> +			ret = -EAGAIN;
>> +			goto out;
>> +		}
> 
> [Severity: Medium]
> Should append_write test > i_size_read(inode) rather than >=?
> 
> When iocb->ki_pos + count == i_size_read(inode), the write is a
> non-extending overwrite up to EOF, but append_write is 1.  That causes
> RWF_NOWAIT overwrites ending at EOF to fail with -EAGAIN and forces
> asynchronous overwrites ending at EOF into synchronous completion via
> IOMAP_DIO_FORCE_WAIT.
> 

agree. will fix in the next version.

>> +
>> +		if (iocb->ki_pos > i_size_read(inode) &&
>> +		    fault_in_iov_iter_readable(from, count)) {
>> +			ret = -EFAULT;
>> +			goto out;
>> +		}
>> +
>> +		if (append_write) {
>> +			/*
>> +			 * Complete before i_rwsem is dropped: i_size is only
>> +			 * updated by ->end_io(), and the next writer would
>> +			 * zero the gap between the size it still sees and its
>> +			 * own write, over the data this one has just written.
>> +			 */
>> +			dio_flags |= IOMAP_DIO_FORCE_WAIT;
>> +
>> +			if (ocfs2_clusters_for_bytes(inode->i_sb,
>> +						     iocb->ki_pos + count) >
>> +			    ocfs2_clusters_for_bytes(inode->i_sb,
>> +						     i_size_read(inode))) {
>> +				/*
>> +				 * when we are going to alloc extents beyond file size, add the
>> +				 * inode to orphan dir, so we can recall those spaces when
>> +				 * system crashed during write.
>> +				 */
>> +				ret = ocfs2_add_inode_to_orphan(osb, inode);
>> +				if (ret < 0) {
>> +					mlog_errno(ret);
>> +					goto out;
>> +				}
>> +				WRITE_ONCE(OCFS2_I(inode)->ip_dio_orphan_pid,
>> +					   task_pid_nr(current));
>> +				WRITE_ONCE(OCFS2_I(inode)->ip_dio_orphan_end,
>> +					   iocb->ki_pos + count);
>> +			}
>> +		}
>> +
>> +		ret = ocfs2_dio_zero_eof(inode, iocb->ki_pos, count);
>> +		if (ret < 0)
>> +			goto out;
> 
> [Severity: High]
> Does an extending direct write that fails or falls back to buffered I/O
> after ocfs2_add_inode_to_orphan() leak the orphan directory entry and any
> clusters allocated beyond i_size?
> 
> ocfs2_dio_clear_orphan_locked() is only called from ocfs2_dio_end_io_write(),
> and ocfs2_dio_end_io() only calls ocfs2_dio_end_io_write() when size != 0 &&
> error == 0 && (!list_empty(&unwritten) || offset + size >
> i_size_read(inode)).  If ocfs2_dio_zero_eof() fails, if __iomap_dio_rw()
> returns -ENOTBLK before starting I/O, or if __iomap_dio_rw() fails after
> ocfs2_dio_wr_map_blocks() has allocated clusters beyond i_size (for example,
> with -EFAULT when pinning an unmapped user buffer on an append write at
> ki_pos == i_size), ocfs2_dio_clear_orphan_locked() never runs.  The excess
> post-EOF clusters are not truncated, ip_dio_orphan_pid and ip_dio_orphan_end
> remain set on the inode, and OCFS2_DIO_ORPHANED_FL stays set on disk so
> unlinking the file skips wiping the inode in ocfs2_delete_inode().
> 

I will do a partly fix: add orphan inode clearing in the rw_lock release path.
Other cases still follow the old logic, which removes the orphan inode in the
next call to ocfs2_add_inode_to_orphan().

>> +
>> +		const struct iomap_dio_ops *dops = rw_level ?
>> +			&ocfs2_iomap_dio_ops_w_ex : &ocfs2_iomap_dio_ops_w_pr;
>> +		struct iomap_dio *dio;
>> +
>> +		/*
>> +		 * The kiocb is the owner of the unwritten clusters which
>> +		 * ->iomap_begin() records for ->end_io() to convert, see
>> +		 * ocfs2_iomap_next().
>> +		 */
>> +		dio = __iomap_dio_rw(iocb, from, ocfs2_iomap_next,
>> +				     dops, dio_flags, iocb, 0);
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
>> +
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
>> +			written = direct_write_fallback(iocb, from, 0,
>> +					generic_perform_write(iocb, from));
>> +		}
>> +	} else if (direct_io) {
>> +		written = direct_write_fallback(iocb, from, 0,
>> +				generic_perform_write(iocb, from));
>> +	} else {
>> +		written = __generic_file_write_iter(iocb, from);
>>   	}
>>   
>> +	/* buffered aio wouldn't have proper lock coverage today */
>> +	BUG_ON(written == -EIOCBQUEUED && !direct_io);
>> +
>>   	if (unlikely(written <= 0))
>>   		goto out;
>>   
>> -	if (((file->f_flags & O_DSYNC) && !direct_io) ||
>> -	    IS_SYNC(inode)) {
>> +	if (((file->f_flags & O_DSYNC) && !use_dio) || IS_SYNC(inode)) {
> 
> [Severity: High]
> Does falling back to generic_perform_write() after __iomap_dio_rw() returns
> -ENOTBLK leave use_dio set to true and skip the O_DSYNC journal commit?
> 
> direct_write_fallback() writes and invalidates the page cache range, but it
> does not commit the JBD2 journal.  Because use_dio is still true after the
> -ENOTBLK fallback, the O_DSYNC block here is skipped and
> jbd2_journal_force_commit() is never called before returning to userspace.
> In addition, both direct_write_fallback() branches run
> generic_perform_write() while holding only a PR cluster rw_lock (rw_level ==
> 0) on coherency=buffered non-extending writes, and without rejecting
> IOCB_NOWAIT before entering blocking buffered write paths.

agree, will change in the next version.
btw, this is an existing issue. The old code also doesn't upgrade PR=>EX when
switching from DIO to buffered IO.

> 
>> diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
>> index 899138f86cda2..9d69ae437f775 100644
>> --- a/fs/ocfs2/super.c
>> +++ b/fs/ocfs2/super.c
>> @@ -1645,6 +1645,7 @@ static void ocfs2_inode_init_once(void *data)
>>   	ocfs2_extent_map_init(&oi->vfs_inode);
>>   	INIT_LIST_HEAD(&oi->ip_io_markers);
>>   	INIT_LIST_HEAD(&oi->ip_unwritten_list);
>> +	init_waitqueue_head(&oi->ip_unwritten_wq);
>>   	oi->ip_dir_start_lookup = 0;
>>   	init_rwsem(&oi->ip_alloc_sem);
>>   	init_rwsem(&oi->ip_xattr_sem);
> 
> [Severity: Medium]
> Are oi->ip_dio_orphan_pid and oi->ip_dio_orphan_end left uninitialized when
> an inode is allocated from ocfs2_inode_cachep?
> 
> Neither ocfs2_inode_init_once() nor ocfs2_alloc_inode() initializes them,
> and ocfs2_dio_end_io_write() unconditionally checks
> READ_ONCE(oi->ip_dio_orphan_pid) == task_pid_nr(current).  On a non-orphaned
> direct write that converts an unwritten extent, an uninitialized slab value
> matching current's PID will invoke ocfs2_dio_clear_orphan_locked() with a
> garbage ip_dio_orphan_end and truncate preallocated blocks beyond i_size.
> 

will follow above suggestion.

Thanks,
Heming
