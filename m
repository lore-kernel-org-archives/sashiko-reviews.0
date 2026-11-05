Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839730;
	b=EFdu15S1qQVqOtt1CoMVNxIH8JFKzlYiuC9JcJIo6rDbSKu3UZTUEj0RX54e1SNlv5dc
	 LoAqwbYpndgNI3cTv3Qq1//0xpC0IwyvYsEFD2U5q/Z2p3Xn35+5h9S680CwpCK0qQ7Sd
	 S0HRXFMvXY+++7JE4wh0BH2rTTo0nGK+GIjz5tvzb2xex/+VlXAlH0whbSXKHlC/vmPP6
	 NMVQr4YhbRdFSaMNXXTQuGilcCLqzPkIFSzxOP8AvBnaGDWQPP1O4lOwRmIc7veH+4Mwf
	 nTJQCYuv2paC6ps0ig1FvqU8SMn1dB1pBh+F30Cmp/soZJvp80JQlbpKpEp8G/F4uqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9e2znKqrwsRrP5wZ1MB0KR8AQ3bDbX9FWww8wTrqfrQ=;
	b=MwHpoNg/zO408rbi74iy9h9WjlULbSDHUeo/c6vEvUw6JdsmRK4g34EKR9rYOBFACykj
	 Nb0E0Rbef7HVTGYHK+m6iArRUwQ8PiGWxOnPB+J//vErNuH3Hf3vI4TcPzOpV8nlPIrp7
	 s9KbFe+bvUAYou1L5mgySsn9FimCU6Ql8ki/yrTz4PKnUtkVSBaymxNWuq0XBMl/A7VNR
	 FbhwaJbIxMnebZ8tp9xNnXKiuBpvUZ/cn6JFo/ATIZp57h11eCVx/6dzGuv753UR1ZRH9
	 QPTaYpAkSmrZzn1T1IxwZXhSJPuHqh3o5llndzJJsfDT1RXeGkpVIg/mzdVM7U1Ngrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=J2p2SLeh;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AA2606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 00:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21AA2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=J2p2SLeh
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a73fdd2966so1591405e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 16:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793839728; x=1794444528; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9e2znKqrwsRrP5wZ1MB0KR8AQ3bDbX9FWww8wTrqfrQ=;
        b=J2p2SLehpuE9MF3RfdPcUM0C5Ow0uFK27s1Z8ynaWzVdFiaFftDJzsOz9NpNm6VHO6
         zWO1fTc8p+OrBw0wNAuRCrfFj10js4OFvHVEvMrfLOBk0H1PTzuqjJPYt28kFkzKNPA6
         RzKqlsSA6c17XtkeF8v7msnNYOdV2Bpq45eCnLyttH0rc5yiuf2a2Cb8iVrv/19sPWGH
         1IQBsUc45qotjWtxWcmkCAPoUTjPb6ESL9pFxXSAiGKB34upI+4x4mHLLxqL7Q8aH8hf
         5jVuV+SCFJ+VM3Cklc5w23p6OvZ5xmsc/r9fFxPm9Ige/UHQgF5thn/e7VX5W8fla+ou
         dlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839728; x=1794444528;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9e2znKqrwsRrP5wZ1MB0KR8AQ3bDbX9FWww8wTrqfrQ=;
        b=p2aqMnh1ciLrwPOusBnVf5JqWG7XHTYWP6MGji4fLPJi1wtCHVTtNVop5vCec6gB4G
         B1XnGlu+OHxGrJKT1/DKW3X+P5ZtemBkmjSqgJovIVzIQ85roAPq/PpQDVGwZ/55+OxF
         uquhPqe7AEZD68tCKScTjp1vJS7LXWXxDoK8bn0qBTWymngZv6zdJWummrO+RmNcV41l
         HZGd5g/Y1zMEzKCXnx4w2zxqioA91a6qjXrbiF8PZt13Bo198u6yrczZMMiXbpQqy2JT
         6rbpeuWI25zyBB2lfSUp38TzCRpFM1jBObBWNagxtTBo99lbQXFYcLckjZo7DqM53Yo8
         pJVw==
X-Gm-Message-State: APuU4Z/zF8o8++RzXQk0IDvD0mNnq+oEp43hqDa8KldHvOhEhPiKecsi
	Csh8bwXF2PZy7DtuUKYC/bNhMWLurVrivzVNUvjJK/ttUn/rXXEx0EzpMcy7tNE2KovuaXTwNja
	8NlnfjQY=
X-Gm-Gg: AYBFou0yBvh8U1Z4o2o5G095fty+XPpy8x36dh97LiY59XuvIQzv76yyDB2of0m7D2s
	2vAJAH5WJlxM9Vim+tRbopHhnMW3IWisWcCMmES+ncB98oGLdx1sn668iYXo+yWr+WGg66kl1aZ
	Av6U1N0jiMSuJNLmjt/4q0tcqNPRxzdPvShPihRrXMTSFn8KS+Yj+FfHajBnGgqmuLQzklyl/ap
	lRIZeSAU+JeFUF0T0Crom6lbBPYWixundn+QepYWQYZ0EhE5pcHsRLPRFQvEKrsV66VkKiabd2a
	2zpyjunykR7j0O0t9F3Yv4/cltDc0rwhh+Ogj90Q1YVpL4KTrYXp9d8gRJ+gb+RpSdh3u41cXFf
	rc8PuHU/qTYrgjN5NoUtPA+ZJWMtCoBDRBvwOPa0Cmv9BQNe15BiF13duksoBrSmC/jPNbVr35w
	/wSTpEnUmHWhItL+0Ku373Qq0zIV/1/6ID/lc7ToY0r51e+0TJzcFXP7ah8zlV+o7A5xjQfPIWF
	8+WI/JnHx/Lp3p9+AlTRb50XXEgfPKlGtS1nT0VeITJP/7oHSPldUyRM+7IW53EI39yyWvW8Aj4
	t5a+0eUzCztlF4WGr/LyLOUNqbaqSK3E8LLAtD1JQXezE3fyhtq//+k=
X-Received: by 2002:a05:600c:a010:b0:4a1:7dcf:be1f with SMTP id 5b1f17b1804b1-4ac166ee4d6mr387137595e9.1.1793839728285;
        Wed, 04 Nov 2026 16:48:48 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36d34d5960esm10068580eec.5.2026.11.04.16.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:48:47 -0800 (PST)
Message-ID: <b38876b1-61ad-4262-9c77-f5304a27dd11@suse.com>
Date: Thu, 5 Nov 2026 08:48:43 +0800
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
Subject: Re: [RFC PATCH v4 4/4] ocfs2: remove legacy blockdev direct-IO path
 APIs
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261103135605.22943-1-heming.zhao@suse.com>
 <20261103135605.22943-5-heming.zhao@suse.com>
 <sashiko-outbox-195656@kernel.org>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-195656@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Let's ignore the review comments on this mail. This patch's main job is
removing useless code. All the Sashiko comments on this patch just repeat
the issues found in the previous three patch reviews.

Thanks,
Heming

On 11/3/26 23:49, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
> - [Critical] ocfs2: premature free of w_unwritten_list in ocfs2_dio_wr_map_blocks()
> - [Critical] ocfs2: missing error check in ocfs2_dio_write_end_io() on write failure
> - [High] ocfs2: missing truncate on failed extending DIO in ocfs2_file_write_iter()
> - [High] ocfs2: extents_to_split undercounted in ocfs2_iomap_dio_end_io_write()
> - [High] ocfs2: endblk underflow and missing zeroing in ocfs2_dio_wr_map_blocks()
> - [High] ocfs2: broken O_DIRECT and O_DSYNC semantics on write fallback
> - [Medium] ocfs2: 32-bit block truncation in ocfs2_iomap_dio_end_io_write() and iomap
> --
> 
> commit 306ce990195728733f6629bee217c4cafaf65350
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: remove legacy blockdev direct-IO path APIs
> 
> This commit removes the legacy buffer_head direct I/O helpers from
> fs/ocfs2/aops.c and fs/ocfs2/aops.h, drops LEGACY_DIRECT_IO from Kconfig,
> and sets FMODE_CAN_ODIRECT in ocfs2_file_open().
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 6f8890873b86c..834fd401a8836 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
> 
> [ ... ]
> 
>> @@ -2159,203 +2146,6 @@ static int ocfs2_write_end(const struct kiocb *iocb,
>>   	return ret;
>>   }
>>   
>> -struct ocfs2_dio_write_ctxt {
>> -	struct list_head	dw_zero_list;
>> -	unsigned		dw_zero_count;
>> -	int			dw_orphaned;
>> -	pid_t			dw_writer_pid;
>> -};
> 
> [ ... ]
> 
>> -static void ocfs2_dio_free_write_ctx(struct inode *inode,
>> -				     struct ocfs2_dio_write_ctxt *dwc)
>> -{
>> -	ocfs2_free_unwritten_list(inode, &dwc->dw_zero_list);
>> -	kfree(dwc);
>> -}
>> -
>> -/*
>> - * TODO: Make this into a generic get_blocks function.
>> - *
>> - * From do_direct_io in direct-io.c:
>> - *  "So what we do is to permit the ->get_blocks function to populate
>> - *   bh.b_size with the size of IO which is permitted at this offset and
>> - *   this i_blkbits."
>> - *
>> - * This function is called directly from get_more_blocks in direct-io.c.
>> - *
>> - * called like this: dio->get_blocks(dio->inode, fs_startblk,
>> - * 					fs_count, map_bh, dio->rw == WRITE);
>> - */
>> -static int ocfs2_dio_wr_get_block(struct inode *inode, sector_t iblock,
>> -			       struct buffer_head *bh_result, int create)
>> -{
>> -	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
>> -	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>> -	struct ocfs2_write_ctxt *wc;
>> -	struct ocfs2_write_cluster_desc *desc = NULL;
>> -	struct ocfs2_dio_write_ctxt *dwc = NULL;
>> -	struct buffer_head *di_bh = NULL;
>> -	u64 p_blkno;
>> -	unsigned int i_blkbits = inode->i_sb->s_blocksize_bits;
>> -	loff_t pos = iblock << i_blkbits;
>> -	sector_t endblk = (i_size_read(inode) - 1) >> i_blkbits;
>> -	unsigned len, total_len = bh_result->b_size;
>> -	int ret = 0, first_get_block = 0;
>> -
>> -	len = osb->s_clustersize - (pos & (osb->s_clustersize - 1));
>> -	len = min(total_len, len);
>> -
>> -	/*
>> -	 * bh_result->b_size is count in get_more_blocks according to write
>> -	 * "pos" and "end", we need map twice to return different buffer state:
>> -	 * 1. area in file size, not set NEW;
>> -	 * 2. area out file size, set  NEW.
>> -	 *
>> -	 *		   iblock    endblk
>> -	 * |--------|---------|---------|---------
>> -	 * |<-------area in file------->|
>> -	 */
>> -
>> -	if ((iblock <= endblk) &&
>> -	    ((iblock + ((len - 1) >> i_blkbits)) > endblk))
>> -		len = (endblk - iblock + 1) << i_blkbits;
> 
> [ ... ]
> 
>> -	if (desc->c_needs_zero)
>> -		set_buffer_new(bh_result);
>> -
>> -	if (iblock > endblk)
>> -		set_buffer_new(bh_result);
> 
> [Severity: High]
> In the replacement ocfs2_dio_wr_map_blocks() in fs/ocfs2/aops.c, endblk is
> computed the same way:
> 
> 	sector_t endblk = (i_size_read(inode) - 1) >> i_blkbits;
> 	...
> 	if (iblock > endblk)
> 		map->flags |= OCFS2_MAP_NEW;
> 
> When i_size_read(inode) == 0, (i_size_read(inode) - 1) >> i_blkbits
> underflows to ULLONG_MAX in unsigned sector_t endblk, so iblock > endblk is
> always false and OCFS2_MAP_NEW (IOMAP_F_NEW) is not set from that check.
> 
> On non-sparse filesystems (!ocfs2_sparse_alloc(osb)), ocfs2_dio_zero_eof()
> calls ocfs2_expand_nonsparse_inode(inode, di_bh, pos, count, NULL) before
> __iomap_dio_rw(). That preallocates clusters up to pos + count as regular
> mapped (non-unwritten) extents via ocfs2_extend_no_holes() and only zeroes up
> to pos, with wc == NULL so w_first_new_cpos is not recorded.
> 
> When ocfs2_dio_wr_map_blocks() subsequently runs ocfs2_write_begin_nolock(),
> ocfs2_populate_write_desc() sees a mapped extent with wc->w_first_new_cpos ==
> UINT_MAX and leaves desc->c_needs_zero = 0. If i_size == 0 (or on the block
> containing pos after ocfs2_zero_extend() updates i_size to pos), both
> desc->c_needs_zero and iblock > endblk are false, so neither
> ocfs2_write_begin_nolock() nor iomap_dio_bio_iter() zeroes the unwritten
> portions of the newly allocated block or cluster. Can this expose stale
> on-disk data on sub-block or sub-cluster O_DIRECT writes?
> 
>> -
>> -	/* May sleep in end_io. It should not happen in a irq context. So defer
>> -	 * it to dio work queue. */
>> -	set_buffer_defer_completion(bh_result);
>> -
>> -	if (!list_empty(&wc->w_unwritten_list)) {
>> -		struct ocfs2_unwritten_extent *ue = NULL;
>> -
>> -		ue = list_first_entry(&wc->w_unwritten_list,
>> -				      struct ocfs2_unwritten_extent,
>> -				      ue_node);
>> -		BUG_ON(ue->ue_cpos != desc->c_cpos);
>> -		/* The physical address may be 0, fill it. */
>> -		ue->ue_phys = desc->c_phys;
>> -
>> -		list_splice_tail_init(&wc->w_unwritten_list, &dwc->dw_zero_list);
>> -		dwc->dw_zero_count += wc->w_unwritten_count;
>> -	}
>> -
>> -	ret = ocfs2_write_end_nolock(inode->i_mapping, pos, len, len, wc);
> 
> [Severity: Critical]
> In the removed ocfs2_dio_wr_get_block(), wc->w_unwritten_list was spliced
> onto dwc->dw_zero_list so that the ocfs2_unwritten_extent entries stayed on
> oi->ip_unwritten_list until ocfs2_dio_end_io() called
> ocfs2_dio_free_write_ctx() after the direct I/O completed.
> 
> In the replacement ocfs2_dio_wr_map_blocks() in fs/ocfs2/aops.c,
> ocfs2_free_unwritten_list() is called immediately before
> ocfs2_write_end_nolock() while still holding ip_alloc_sem:
> 
> 	ocfs2_free_unwritten_list(inode, &wc->w_unwritten_list);
> 	/* Here returns only two types: len (success), errno (failure). */
> 	ret = ocfs2_write_end_nolock(inode->i_mapping, pos, len, len, wc);
> 
> Because all callers of ocfs2_write_begin_nolock() hold ip_alloc_sem in write
> mode, freeing wc->w_unwritten_list inside ocfs2_dio_wr_map_blocks() means
> oi->ip_unwritten_list is always empty whenever ocfs2_unwritten_check() runs:
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
> When s_clustersize > PAGE_SIZE and a single O_DIRECT write crosses endblk
> within an unwritten or newly allocated cluster (which ocfs2_dio_wr_map_blocks()
> splits at endblk across two ocfs2_iomap_begin() calls before end_io runs), or
> when two concurrent sub-cluster O_DIRECT writes target different blocks in
> the same unwritten cluster before ocfs2_iomap_dio_end_io_write() marks the
> extent written, won't the second ocfs2_dio_wr_map_blocks() call see
> OCFS2_EXT_UNWRITTEN on disk and an empty oi->ip_unwritten_list, leave
> desc->c_needs_zero = 1, and zero the first write's blocks through page-cache
> folios in ocfs2_write_cluster()?
> 
> [ ... ]
> 
>> @@ -2510,205 +2299,6 @@ static int ocfs2_dio_wr_map_blocks(struct inode *inode,
>>   	return ret;
>>   }
>>   
>> -static int ocfs2_dio_end_io_write(struct inode *inode,
>> -				  struct ocfs2_dio_write_ctxt *dwc,
>> -				  loff_t offset,
>> -				  ssize_t bytes)
>> -{
> 
> [ ... ]
> 
>> -	/* everything looks good, let's start the cleanup */
>> -	if (!ret && dwc->dw_orphaned) {
>> -		BUG_ON(dwc->dw_writer_pid != task_pid_nr(current));
>> -
>> -		ret = ocfs2_del_inode_from_orphan(osb, inode, di_bh, 0, 0);
>> -		if (ret < 0)
>> -			mlog_errno(ret);
>> -	}
>> -	ocfs2_inode_unlock(inode, 1);
>> -	brelse(di_bh);
>> -out:
>> -	ocfs2_run_deallocs(osb, &dealloc);
>> -	ocfs2_dio_free_write_ctx(inode, dwc);
>> -
>> -	return ret;
>> -}
> 
> [Severity: High]
> In the removed ocfs2_dio_end_io() and ocfs2_dio_end_io_write(),
> ocfs2_del_inode_from_orphan() was only called when bytes > 0 and !ret. If an
> extending direct write failed after allocating clusters beyond i_size, the
> inode remained in the orphan directory with OCFS2_DIO_ORPHANED_FL set so
> orphan recovery would truncate the excess clusters back to i_size.
> 
> In fs/ocfs2/file.c, ocfs2_file_write_iter() now unconditionally calls
> ocfs2_dio_del_orphan() on the out: path whenever orphaned is set:
> 
> out:
> 	if (orphaned)
> 		ocfs2_dio_del_orphan(inode);
> 
> And ocfs2_dio_del_orphan() removes the inode from the orphan directory
> without truncating clusters allocated past i_size_read(inode):
> 
> 	di = (struct ocfs2_dinode *)di_bh->b_data;
> 	if (di->i_flags & cpu_to_le32(OCFS2_DIO_ORPHANED_FL)) {
> 		ret = ocfs2_del_inode_from_orphan(osb, inode, di_bh, 0, 0);
> 		if (ret < 0)
> 			mlog_errno(ret);
> 	}
> 
> If ocfs2_dio_zero_eof() or __iomap_dio_rw() -> ocfs2_iomap_begin() ->
> ocfs2_dio_wr_map_blocks() allocates clusters beyond i_size and the write then
> fails or completes short (for example, due to -EINVAL on an unaligned user
> buffer or -EFAULT in bio_iov_iter_get_pages() after ocfs2_iomap_begin() has
> committed the allocation), won't ocfs2_dio_del_orphan() remove the orphan
> entry and leave those excess clusters allocated beyond i_size?
> 
>> -
>> -/*
>> - * ocfs2_dio_end_io is called by the dio core when a dio is finished.  We're
>> - * particularly interested in the aio/dio case.  We use the rw_lock DLM lock
>> - * to protect io on one node from truncation on another.
>> - */
>> -static int ocfs2_dio_end_io(struct kiocb *iocb,
>> -			    loff_t offset,
>> -			    ssize_t bytes,
>> -			    void *private)
>> -{
>> -	struct inode *inode = file_inode(iocb->ki_filp);
>> -	int level;
>> -	int ret = 0;
>> -
>> -	/* this io's submitter should not have unlocked this before we could */
>> -	BUG_ON(!ocfs2_iocb_is_rw_locked(iocb));
>> -
>> -	if (bytes <= 0)
>> -		mlog_ratelimited(ML_ERROR, "Direct IO failed, bytes = %lld",
>> -				 (long long)bytes);
>> -	if (private) {
>> -		if (bytes > 0)
>> -			ret = ocfs2_dio_end_io_write(inode, private, offset,
>> -						     bytes);
>> -		else
>> -			ocfs2_dio_free_write_ctx(inode, private);
>> -	}
> 
> [Severity: Critical]
> In the removed ocfs2_dio_end_io(), fs/direct-io.c passed a negative errno in
> bytes on I/O failure, so the check if (bytes > 0) avoided calling
> ocfs2_dio_end_io_write() when a write BIO failed.
> 
> In iomap, iomap_dio_bio_iter() increments dio->size as BIOs are submitted, and
> iomap_dio_complete() invokes dops->end_io(iocb, dio->size, ret, dio->flags)
> with size > 0 and error < 0 when a submitted BIO fails. However,
> ocfs2_dio_write_end_io() in fs/ocfs2/aops.c only checks size and does not
> check !error before calling ocfs2_iomap_dio_end_io_write():
> 
> 	if (size && ((flags & IOMAP_DIO_UNWRITTEN) ||
> 		    (offset + size > i_size_read(inode)))) {
> 		ret = ocfs2_iomap_dio_end_io_write(inode, offset, size);
> 		if (ret < 0)
> 			mlog_errno(ret);
> 	}
> 
> If a direct write BIO fails with an I/O error, won't ocfs2_dio_write_end_io()
> still call ocfs2_iomap_dio_end_io_write(), converting unwritten extents to
> written via ocfs2_mark_extent_written() and extending i_size via
> ocfs2_set_inode_size(), exposing uninitialized on-disk blocks?
> 
>> -
>> -	ocfs2_iocb_clear_rw_locked(iocb);
>> -
>> -	level = ocfs2_iocb_rw_locked_level(iocb);
>> -	ocfs2_rw_unlock(inode, level);
>> -	return ret;
>> -}
>> -
>> -static ssize_t ocfs2_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
>> -{
>> -	struct file *file = iocb->ki_filp;
>> -	struct inode *inode = file->f_mapping->host;
>> -	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
>> -	get_block_t *get_block;
>> -
>> -	/*
>> -	 * Fallback to buffered I/O if we see an inode without
>> -	 * extents.
>> -	 */
>> -	if (OCFS2_I(inode)->ip_dyn_features & OCFS2_INLINE_DATA_FL)
>> -		return 0;
>> -
>> -	/* Fallback to buffered I/O if we do not support append dio. */
>> -	if (iocb->ki_pos + iter->count > i_size_read(inode) &&
>> -	    !ocfs2_supports_append_dio(osb))
>> -		return 0;
>> -
>> -	if (iov_iter_rw(iter) == READ)
>> -		get_block = ocfs2_lock_get_block;
>> -	else
>> -		get_block = ocfs2_dio_wr_get_block;
>> -
>> -	return __blockdev_direct_IO(iocb, inode, inode->i_sb->s_bdev,
>> -				    iter, get_block,
>> -				    ocfs2_dio_end_io, 0);
>> -}
> 
> [Severity: High]
> Previously, when ocfs2_direct_IO() returned 0 to fall back to buffered I/O,
> __generic_file_write_iter() saw IOCB_DIRECT still set on iocb->ki_flags and
> ran direct_write_fallback(), which flushed and invalidated the page cache
> range.
> 
> In ocfs2_file_write_iter() in fs/ocfs2/file.c, the fallback paths now clear
> IOCB_DIRECT before calling __generic_file_write_iter() while leaving the
> local variable direct_io set to 1:
> 
> 		if (written == -ENOTBLK)
> 			written = 0;
> 		if (written == 0 && iov_iter_count(from)) {
> 			iocb->ki_flags &= ~IOCB_DIRECT;
> 			written = __generic_file_write_iter(iocb, from);
> 		}
> 	} else {
> 		iocb->ki_flags &= ~IOCB_DIRECT;
> 		written = __generic_file_write_iter(iocb, from);
> 	}
> 	...
> 	if (((file->f_flags & O_DSYNC) && !direct_io) ||
> 	    IS_SYNC(inode)) {
> 		ret = filemap_fdatawrite_range(file->f_mapping,
> 					       iocb->ki_pos - written,
> 					       iocb->ki_pos - 1);
> 
> Because IOCB_DIRECT is cleared before __generic_file_write_iter(),
> __generic_file_write_iter() only calls generic_perform_write() and skips
> direct_write_fallback() (so dirty pages are neither flushed nor invalidated).
> At the same time, because direct_io remains 1, the O_DSYNC check evaluates
> !direct_io as false and skips filemap_fdatawrite_range() and
> jbd2_journal_force_commit().
> 
> In addition, if IOCB_NOWAIT is set when falling back to buffered I/O,
> __generic_file_write_iter() will block in ocfs2_write_begin(); and if a
> multi-extent DIO write completes partially before hitting -ENOTBLK, written
> is already folded into the return value by iomap_dio_complete() (or if
> -ENOTBLK is returned, written is reset to 0), so remaining bytes are not
> handled like direct_write_fallback(). Should the fallback preserve
> O_DIRECT/O_DSYNC flushing and reject IOCB_NOWAIT?
> 
> [ ... ]
> 
>> @@ -2852,8 +2441,8 @@ static int ocfs2_iomap_dio_end_io_write(struct inode *inode,
>>   	 * single-cluster cases. Because kiocb->private is cleared before the
>>   	 * iomap_dio_ops end_io callback is invoked, this function cannot
>>   	 * obtain the exact number of unwritten extents via dwc, unlike the
>> -	 * buffered path function ocfs2_dio_end_io_write(). Consequently, the
>> -	 * algorithm here may overestimate the actual number of unwritten
>> +	 * legacy buffered path function ocfs2_dio_end_io_write(). Consequently,
>> +	 * the algorithm here may overestimate the actual number of unwritten
>>   	 * extents; however, this only incurs additional allocator overhead and
>>   	 * does not compromise the correctness of the results.
>>   	 */
> 
> [Severity: High]
> Right below this comment in ocfs2_iomap_dio_end_io_write() in
> fs/ocfs2/aops.c, extents_to_split is computed from bytes alone without
> accounting for the starting offset within a cluster:
> 
> 	extents_to_split = DIV_ROUND_UP(bytes, 1 << osb->s_clustersize_bits);
> 	ret = ocfs2_lock_allocators(inode, &et, 0, extents_to_split * 2,
> 				    &data_ac, &meta_ac);
> 
> When s_clustersize > s_blocksize and a block-aligned O_DIRECT write starts at
> a non-cluster-aligned offset and crosses a cluster boundary (for example, an
> 8 KB write at offset 12 KB with 16 KB clusters), DIV_ROUND_UP(bytes,
> 1 << osb->s_clustersize_bits) evaluates to 1 even though the write spans 2
> clusters and the loop below can call ocfs2_mark_extent_written() on both
> clusters. Can this under-reserve metadata allocator credits in meta_ac when
> splitting unwritten extents across a cluster boundary?
> 
> [Severity: Medium]
> Also in ocfs2_iomap_dio_end_io_write() in fs/ocfs2/aops.c, curr_lblk and
> end_lblk are declared as 32-bit unsigned int:
> 
> 	unsigned int curr_lblk, end_lblk;
> 	...
> 	curr_lblk = offset >> blkbits;
> 	end_lblk = (offset + bytes + (1 << blkbits) - 1) >> blkbits;
> 	while (ret >= 0 && curr_lblk < end_lblk) {
> 
> And in ocfs2_iomap_begin():
> 
> 	if ((offset >> blkbits) > OCFS2_MAX_LOGICAL_BLOCK)
> 		return -EINVAL;
> 
> In OCFS2, the 32-bit on-disk limit applies to clusters rather than blocks, so
> when s_clustersize > s_blocksize, ocfs2_max_file_offset() permits logical
> blocks beyond OCFS2_MAX_LOGICAL_BLOCK (0xFFFFFFFF). Even at block 0xFFFFFFFF
> (which passes the check in ocfs2_iomap_begin()), a write covering block
> 0xFFFFFFFF causes end_lblk to wrap to 0 in 32-bit unsigned int, making
> curr_lblk < end_lblk false so unwritten extents are not marked written.
> Should curr_lblk and end_lblk be u64/sector_t, and should ocfs2_iomap_begin()
> check the cluster limit instead of OCFS2_MAX_LOGICAL_BLOCK?
> 

