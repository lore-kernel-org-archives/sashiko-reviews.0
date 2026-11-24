Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795481371;
	b=AXg8qYo5Y90S/Ox3GXZ4/qZpwOPNpFzs7nVcYIJpKSx7CgG26gQtVHCU69o9A+KPifrA
	 uN/UOP/9gPYQmTpX63mUg8T+kjthcqjldUAlkGmgmYwafsGDPEfcJ300yuMMn0AxDujGs
	 qaMzY85uVI0tUpST5t4+64dYK8dYQnXgHPFUDG8mZDOb5P3vmWHiCgw7v/XVFhmWoTuLQ
	 qbQkq4Q4dv0rFLU4KGiTYflyvGoBbBFutTV37mfI1oKUAKp/5tyzEONT67R1KlNBYyM5e
	 NxzFrML65nMrNYXcA87LKTWVsX44K/k6hOfZbkROYpSeNnFIDTI2WU6IzmwzneH3Xhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NivxIeE6ko/7/7bbrM2Wgoo6cbh70dDuHD/TRVEjCjM=;
	b=t185JRtqyyON7XVggysG7rPl4Fy+zy1K5QzwoDMhE6Zmy0evrYNF2Z1eLPS1BXoVnQt8
	 JiwXvpR7f7TxjE+BI9LZS4AoCnOLP/2zJ47ZtTgQMRbWlqHZNG040T+3aLT3T4xibDAop
	 ksR/3o31rk9bDg5hkzODjMEDAXv0xcbIgnkCuibdXZc09p1yLyhO8AL/8ENhDVuCkbuTi
	 LE3+ZDqZVzuAnvFKzCG5p0zup6juALjuWT27pgDGr4ffdhrCdFmKcsZPmQBu4++NJgXsz
	 lyM3HzPWQE04Q2oEctjzB/7lYTaUoJk9pWDh6a3MBgURCHjyWO84kjD3HjWO9Qv80qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JPVG8teh;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33106606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 00:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33106606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JPVG8teh
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50692e6c0aso71874266b.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 16:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795481369; x=1796086169; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NivxIeE6ko/7/7bbrM2Wgoo6cbh70dDuHD/TRVEjCjM=;
        b=JPVG8teh3jNO1BaCbikTmzPm0Ef/MHb+PkFVIrEKPmcM6szPJAyRUvuzM/wIhGWEPs
         nrG0V7aSUsYZII1DFEwKeMasWe4gTGWm6uo9aIvYe3gR06hGqNQ7HDKVb9cJ4PZVSGl/
         Bd+yivVF6lei7FobK+qyclW/10+PIso1H7Q1wxUiedwoJe2JNWpH6zujY1Z4bn8b0eoi
         HsWZjC0UPoC2HTfpgEBI7J9tWe+tGiwzm5iOCu3mGgdtncl7+QwGd3V8TlWkjLckdI3P
         x3n1NiRD0LNXOEvNaH3X0MtxkHv63EZ42SevqC99tUQ2Df5JofK45O8Zo7ytD44dQVDq
         B+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795481369; x=1796086169;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NivxIeE6ko/7/7bbrM2Wgoo6cbh70dDuHD/TRVEjCjM=;
        b=S72fK9nrFNATyUB4W90XtdEEKo/+4Z/h3wd8jQ2jyz/a4r46EWItQKkUf/5HCsqz1p
         yaMwPYfHKoTqpR6urN2qbg1i8rY8EvAUFNW0/ys1WsOJYz7dS7WVHrwYlQfXoaMuSXbV
         AjLC0mMAH8lWEOH/v9JcNmrn/efnTN2HKqn+yZzlAHIQFzc65GN87iitoBmvHf6tMPIK
         BBN4ImXg0o62PhsBRqpCMza3O9mLncefZo/43QOM6Ode4pjgh8eeXa9EqyIDq2/gcM+T
         mv893GZQMrOB/P97JaV7Qy764b4xgqIErDVnsJGNfS2LlKFNLolBOxI/mulj053Wjz3K
         xH1g==
X-Gm-Message-State: APuU4Z9sa8pxlmomGPkdzRVDOj4KNzft+qvOhlC5mM/NHPOjcAvc07wX
	OvM60GqfDxxByDKp4MIsB+DBANg6+lJv6V3ZQATmlcBKK6tT0hRYNaw/2P1wMS5eyf+dXweBaqd
	3DDsExSk=
X-Gm-Gg: AZFdTZfSDlHkzv/ghA0S4E3dXkR1VZ5S8Bamn8L0ctu8V3M4NPWclODPjOvGO3iJ9+q
	uPUNX4dNc3G2Ufr6EqaYjU0ViZejlgaQkzmlXfE9IfROISWaiGGckFI8NHV4RRUXhcgmla+pWQA
	o/y5KPzlr8IRdhBHJNNt1kH15Rvcir8RjkpzKMyYxuuHEoBFRbn23czmiVG0ug6MKJrrLABUnDy
	4Q0aF+3D5hLFz0i/Gnea2oEnZFyIzFZCLnrIljAcNMHc2v85jACOy99WYOhyVAu+pv00a/teDcy
	YezWcDRUUjV3wSKJMva8EWb5stS1slBsQUTisFMMPfij1eyVM/Yux+gunBCERLZltRoyqYt+LR9
	72LGEV72KdGkCyZSZuevBMhYaE4yhB02xop/hs9JW0W4Uvjkhi/5h2YHsztH58k3oTvVbk6XLsS
	v0qIEbmpM9ScWFXIQW8DTLiuhjbuTWFOCXyLJOHYlyhkHK9IV/Ye+hI/RhxHTksg7q+Ju350hMg
	qlxc78Ip1+2hYejq29kfbO0AM3ozEo8vLjFGkFrX4entB1W0w5FNdTIoe5i3EuS4fAOQOuiMZGu
	Wy+qtVVCvhrSueKrngX3BuQL61N6TBqpQ0I=
X-Received: by 2002:a17:906:c311:b0:c51:45d1:eca6 with SMTP id a640c23a62f3a-c5145d1f0a6mr791498166b.2.1795481369399;
        Mon, 23 Nov 2026 16:49:29 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c14fsm6318964b3a.15.2026.11.23.16.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 16:49:28 -0800 (PST)
Message-ID: <dc40ec4a-0bff-4b66-bbb7-f9da7dc3156c@suse.com>
Date: Tue, 24 Nov 2026 08:49:20 +0800
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
Subject: Re: [RFC PATCH v9 3/3] ocfs2: switch dio write path from buffer_head
 to iomap
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261120060014.12087-1-heming.zhao@suse.com>
 <20261120060014.12087-4-heming.zhao@suse.com>
 <sashiko-outbox-224583@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-224583@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 14:47, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issues to consider:
> - [High] ocfs2: orphan entry and block leak on failed or short DIO write
> - [High] ocfs2: premature DIO check and rw_level in
>    ocfs2_file_write_iter()
> - [High] ocfs2: unwritten extent data corruption in
>    ocfs2_unwritten_check()
> - [Medium] ocfs2: wrong cluster count check in
>    ocfs2_dio_clear_orphan_locked()
> - [Medium] ocfs2: preallocated extents truncated in
>    ocfs2_dio_clear_orphan_locked()
> --
> 
> commit 3b2172b84eea7db7460d8820186e4b0c444ba7e1
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: switch dio write path from buffer_head to iomap
> 
> This commit converts the OCFS2 direct I/O write path from buffer_head to
> iomap, replacing ocfs2_dio_wr_get_block() with ocfs2_dio_wr_map_blocks()
> and updating unwritten extent conversion and orphan handling.
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 21cdc5c29331d..a6a2a1d11cd03 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
> [ ... ]
>> @@ -1376,76 +1717,212 @@ static void ocfs2_set_target_boundaries(struct ocfs2_super *osb,
> [ ... ]
>> +static void ocfs2_unwritten_check(struct inode *inode,
>> +				  struct ocfs2_write_ctxt *wc,
>> +				  struct ocfs2_write_cluster_desc *desc)
>>   {
>>   	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>> -	struct ocfs2_unwritten_extent *ue = NULL, *new = NULL;
>> -	int ret = 0;
>> +	struct ocfs2_unwritten_extent *ue;
>>
>>   	if (!desc->c_needs_zero)
>> -		return 0;
>> +		return;
>>
>> -retry:
>>   	spin_lock(&oi->ip_lock);
>> -	/* Needs not to zero no metter buffer or direct. The one who is zero
>> -	 * the cluster is doing zero. And he will clear unwritten after all
>> -	 * cluster io finished. */
>> -	list_for_each_entry(ue, &oi->ip_unwritten_list, ue_ip_node) {
>> -		if (desc->c_cpos == ue->ue_cpos) {
>> -			BUG_ON(desc->c_new);
>> -			desc->c_needs_zero = 0;
>> -			desc->c_clear_unwritten = 0;
>> -			goto unlock;
>> -		}
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
>> +		/* match its own entry */
>> +		if (wc->w_type == OCFS2_WRITE_DIRECT && wc->w_owner &&
>> +		    ue->ue_owner == wc->w_owner)
>> +			desc->c_dio_unwritten = 1;
>> +		else
>> +			/*
>> +			 * Not ours. A direct write never gets here, it waits
>> +			 * for the entries of the other dios before it maps,
>> +			 * see ocfs2_dio_wr_map_blocks().
>> +			 */
>> +			WARN_ON_ONCE(wc->w_type == OCFS2_WRITE_DIRECT);
>> +	} else if (wc->w_type == OCFS2_WRITE_DIRECT) {
>> +		/* This direct write will doing zero. */
>> +		desc->c_clear_unwritten = 0;
>>   	}
>> +	spin_unlock(&oi->ip_lock);
>> +}
> 
> [Severity: High]
> Can a buffered write or mmap write fault lose data or expose stale on-disk
> blocks when it hits an unwritten cluster recorded on ip_unwritten_list by
> an in-flight direct write?
> 
> ocfs2_dio_wr_map_blocks() maps up to 16MB of unwritten clusters, adds them
> to ip_unwritten_list, and drops ip_alloc_sem and the inode lock before
> iomap pins user pages or submits bios; for an async non-extending direct
> write i_rwsem is also dropped while the I/O is in flight, and
> __ocfs2_page_mkwrite() does not take i_rwsem or rw_lock.  Direct writes
> wait on ip_unwritten_wq for foreign entries because the in-flight direct
> write may fail or end short without converting all of its recorded
> clusters, and because ocfs2_grab_folios_direct() does not zero folios
> inside the direct write's target range.
> 
> Buffered and mmap writes do not wait on ip_unwritten_wq and instead clear
> c_needs_zero and c_clear_unwritten here.  If the in-flight direct write
> then fails (for example with -EFAULT on a later page) or completes short
> before this cluster, neither write converts the extent from
> OCFS2_EXT_UNWRITTEN, so the buffered or mmap data reads back as zeroes
> once evicted from the page cache.  In addition, with c_needs_zero cleared
> on a cluster that ocfs2_grab_folios_direct() did not zero in the page
> cache, a partial-page buffered write calls ocfs2_map_folio_blocks() with
> new = 0 and reads raw uninitialized blocks from the unwritten extent on
> disk.
> 

will ignore above issue.
This issue predates this patch and is left unfixed. Additionally, triggering
it would require concurrent DIO and buffered I/O or mmap writes on the same
inode, which is not a realistic scenario in production env.

> [ ... ]
> 
>> @@ -2375,11 +2998,87 @@ static int ocfs2_dio_end_io_write(struct inode *inode,
> [ ... ]
>> +static void ocfs2_dio_clear_orphan_locked(struct inode *inode,
>> +				   struct buffer_head *di_bh)
>> +{
>> +	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
>> +	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>> +	struct ocfs2_dinode *di = (struct ocfs2_dinode *)di_bh->b_data;
>> +	loff_t end = READ_ONCE(oi->ip_dio_orphan_end);
>> +	int ret = 0;
>> +
>> +	/*
>> +	 * The write has not reached the end it asked for, the clusters it did
>> +	 * manage to allocate beyond i_size are of no use, free them before the
>> +	 * orphan entry, the only thing which would recover them, is gone.  A
>> +	 * write which did reach its end has nothing of its own beyond i_size.
>> +	 */
>> +	if (i_size_read(inode) < end &&
>> +	    oi->ip_clusters > ocfs2_clusters_for_bytes(inode->i_sb,
>> +						       i_size_read(inode)))
>> +		ret = ocfs2_truncate_file(inode, di_bh, i_size_read(inode));
> 
> [Severity: Medium]
> Does comparing oi->ip_clusters against ocfs2_clusters_for_bytes(...,
> i_size_read(inode)) skip truncating blocks allocated past i_size on sparse
> files?
> 
> oi->ip_clusters is the total count of physical clusters allocated to the
> inode, not the highest allocated logical cluster offset.  On a sparse file
> with holes below i_size, oi->ip_clusters can remain smaller than or equal
> to ocfs2_clusters_for_bytes(inode->i_sb, i_size_read(inode)) even after an
> incomplete extending direct write has allocated clusters past i_size.
> ocfs2_truncate_file() is then skipped while ocfs2_del_inode_from_orphan()
> still removes the orphan entry and clears OCFS2_DIO_ORPHANED_FL, leaking
> the excess clusters past EOF.
> 

I will remove the comparing line:
"oi->ip_clusters > ocfs2_clusters_for_bytes(inode->i_sb, i_size_read(inode))"

>> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
>> index 3d717200d53a4..327997a7061ee 100644
>> --- a/fs/ocfs2/file.c
>> +++ b/fs/ocfs2/file.c
> [ ... ]
>> @@ -2462,25 +2514,37 @@ static ssize_t ocfs2_file_write_iter(struct kiocb *iocb,
>>   	} else
>>   		inode_lock(inode);
>>
>> -	ocfs2_iocb_init_rw_locked(iocb);
>> -
>>   	/*
>> -	 * Concurrent O_DIRECT writes are allowed with
>> -	 * mount_option "coherency=buffered".
>> -	 * For append write, we must take rw EX.
>> +	 * Concurrent O_DIRECT writes are allowed with mount_option
>> +	 * "coherency=buffered". For append write, we must take rw EX.
>> +	 *
>> +	 * A direct write which cannot use O_DIRECT for this range, or which
>> +	 * bounces back to buffered I/O, does a buffered write in the end,
>> +	 * and that needs EX just like a plain buffered write. Decide here,
>> +	 * so that the common case does not have to upgrade the lock later.
>>   	 */
>> -	rw_level = (!direct_io || full_coherency || append_write);
>> +	use_dio = direct_io && ocfs2_should_use_dio(iocb, from, inode);
>> +	rw_level = (!use_dio || full_coherency || append_write);
> 
> [Severity: High]
> Can evaluating ocfs2_should_use_dio() and append_write before
> generic_write_checks() and ocfs2_prepare_inode_for_write() use a stale
> offset, length, or i_size?
> 
> generic_write_checks() later updates iocb->ki_pos to i_size_read(inode)
> for IOCB_APPEND and clamps the write length, and
> ocfs2_prepare_inode_for_write() refreshes i_size and ip_dyn_features under
> the cluster inode lock.  Because use_dio and rw_level are not re-evaluated
> afterward:
> 
> 1. On a filesystem with i_blocksize(inode) < PAGE_SIZE and a block-aligned
>     but non-page-aligned i_size, an O_DIRECT | O_APPEND write starting with
>     ki_pos == 0 and a page-aligned count passes the PAGE_SIZE alignment
>     check in ocfs2_should_use_dio().  After generic_write_checks() moves
>     ki_pos to i_size, the unaligned direct write proceeds through
>     __iomap_dio_rw(): ocfs2_grab_folios_direct() skips the target page,
>     iomap only zeroes sub-block padding, and ocfs2_dio_end_io_write() marks
>     the cluster written, exposing stale on-disk blocks in the rest of the
>     page.
> 
> 2. Under coherency=buffered, an O_APPEND write (or a write racing with a
>     remote truncate before ocfs2_prepare_inode_for_write() refreshes
>     i_size) where the initial ki_pos + count < i_size_read(inode) takes
>     rw_lock in PR mode (rw_level == 0) and then runs the extending direct
>     write path without upgrading rw_lock to EX.
> 
> 3. Under the same condition on a filesystem without append-DIO support,
>     ocfs2_should_use_dio() checks the pre-append ki_pos and fails to fall
>     back to buffered I/O.
> 

I will add re-accessing code.

PS: The old logic also has the same issue. The i_size can be changed after
generic_write_checks() and ocfs2_prepare_inode_for_write().

> [ ... ]
> 
>> @@ -2527,31 +2595,142 @@ static ssize_t ocfs2_file_write_iter(struct kiocb *iocb,
> [ ... ]
>> +		if ((iocb->ki_pos + count) > i_size_read(inode)) {
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
>> +				 * when we are going to alloc extents beyond file
>> +				 * size, add the inode to orphan dir, so we can
>> +				 * recall those spaces when system crashed during
>> +				 * write.
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
> 
> [Severity: Medium]
> If a file has unwritten extents preallocated beyond i_size with
> fallocate(FALLOC_FL_KEEP_SIZE), will an extending direct write that ends
> short or bails out before completion free the preallocated space?
> 
> Because this check orphans the inode whenever iocb->ki_pos + count extends
> past the cluster containing i_size_read(inode), any short write or early
> abort triggers ocfs2_dio_clear_orphan_locked() -> ocfs2_truncate_file(...,
> i_size_read(inode)), which truncates all clusters beyond i_size including
> pre-existing FALLOC_FL_KEEP_SIZE extents.
> 

This issue is also present in the legacy code. I consider this patch to have
introduced a regression. Previously, when an error occurred, the space
allocated via fallocate(FALLOC_FL_KEEP_SIZE) was not freed immediately;
instead, it was cleaned up upon the next invocation of
ocfs2_add_inode_to_orphan() or during the recovery process. With this patch,
ocfs2_dio_clear_orphan() is added to ocfs2_file_write_iter(), which leads to
the immediate deallocation of the FALLOC_FL_KEEP_SIZE space in the error path.

Note that it's a little bit hard to fix this issue. An ideal fix has not been
worked out so far.

I suggest add a TODO comments like:
```
TODO:
If a file has unwritten extents preallocated beyond i_size with
fallocate(FALLOC_FL_KEEP_SIZE), an extending direct write that ends short or
bails out before completion, the preallocated space is freed. The reason is
that "ocfs2_dio_clear_orphan_locked() -> ocfs2_truncate_file(...,
i_size_read(inode))", which truncates all clusters beyond i_size including
pre-existing FALLOC_FL_KEEP_SIZE extents.
```

>> +
>> +		ret = ocfs2_dio_zero_eof(inode, iocb->ki_pos, count);
>> +		if (ret < 0)
>> +			goto out;
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
> [ ... ]
>> @@ -2571,11 +2750,30 @@ static ssize_t ocfs2_file_write_iter(struct kiocb *iocb,
>>   	}
>>
>>   out:
>> +	/*
>> +	 * IOMAP_DIO_FORCE_WAIT made an extending dio complete synchronously,
>> +	 * so its end_io has already updated i_size.
>> +	 */
>>   	if (saved_ki_complete)
>>   		xchg(&iocb->ki_complete, saved_ki_complete);
>>
>> -	if (rw_level != -1)
>> +	if (rw_level != -1) {
>> +		/*
>> +		 * The orphan entry this write added is still there when no io
>> +		 * was issued at all, or when the write bailed out before
>> +		 * submitting it. The conversion in ocfs2_dio_end_io_write()
>> +		 * has removed it on the success path; a failed io is left to
>> +		 * the recovery. Remove it here for the former, while the
>> +		 * rw_lock is still held
>> +		 */
>> +		ocfs2_dio_clear_orphan(inode);
>>   		ocfs2_rw_unlock(inode, rw_level);
>> +	}
>> +
>> +	/* The marker must not outlive this write. */
>> +	if (READ_ONCE(OCFS2_I(inode)->ip_dio_orphan_pid) ==
>> +	    task_pid_nr(current))
>> +		WRITE_ONCE(OCFS2_I(inode)->ip_dio_orphan_pid, 0);
> 
> [Severity: High]
> Does an extending direct write that fails inside __iomap_dio_rw() after
> inode_dio_begin() leave the inode permanently orphaned on disk and leak
> any clusters allocated beyond i_size?
> 
> For an extending write, IOMAP_DIO_FORCE_WAIT is set, so if mapping or bio
> setup fails after inode_dio_begin() (for example, an unmapped user buffer
> returning -EFAULT when appending at ki_pos == i_size, where
> fault_in_iov_iter_readable() was skipped, or -ENOSPC after allocating part
> of the range), __iomap_dio_rw() returns a valid dio pointer and
> iomap_dio_complete(dio) runs ocfs2_dio_end_io() with error < 0.
> ocfs2_dio_end_io() skips ocfs2_dio_end_io_write() when error != 0 (and on
> a short write that neither exceeds i_size nor records unwritten extents)
> and unlocks rw_lock, and iomap_dio_complete() returns a non-zero value so
> rw_level is set to -1.
> 
> At the out label, ocfs2_dio_clear_orphan() is skipped because rw_level is
> -1, while ip_dio_orphan_pid is cleared to 0.  The clusters allocated
> beyond i_size are never truncated, and OCFS2_DIO_ORPHANED_FL and the
> orphan directory entry remain on disk; because ocfs2_delete_inode() refuses
> to wipe an inode with OCFS2_DIO_ORPHANED_FL set, unlinking the file cannot
> reclaim the inode or its blocks until unmount or crash recovery.
> 

Don't agree. For above scenario, the patch keeps old logic.
There are two additional places where the orphaned inode is removed:
- On the next write to the inode, ocfs2_add_inode_to_orphan() will check
   OCFS2_DIO_ORPHANED_FL and remove the orphaned entry.
- The recovery path will call ocfs2_recover_orphans() to do the removal.

Thanks,
Heming
