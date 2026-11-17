Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925623;
	b=jm3e+6ECztYNWoVF87ZoN6EMh3qkuBxbGKjikWw1ucHzOcgFbdCnqSRAabHRS2ArWYN8
	 gtigkiA+enXPDcdh269oKJFOQBaw2d5DGKEbJ3zFUknBZ6DLJoZNad2AsBhPlTUnPRJLk
	 kLOW4vY2EuixD/eu2mijXGHTcf44yDie2TYpxGYL/GHUH3SP5E4GduyxnureR8xf5yDrd
	 OXQC1i4j9hCIsGseHLMt9MU3kl7TesYIl5ppmmfeMaSYcuRSdBY7LFhB7lgt1KEJ5db4d
	 x78eFk+bYMx1u7zwN7WyCeQfEdR1gKqJIi99TgLxjuoD7AtCTDHdn/P65ne4ca/FL0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=s7lF60lFOMK4KSB/YQRQPyley38K8GzvHoR/O0uSbB4=;
	b=qLGBxvQea3eywHn5ywrMLk/NT8UDUdv4+nZMJfoH25cKbBwWsvwh7T0oJLDEcFY4PiSR
	 c18lLzE8JcHfJqbwvRXdEjbnDx8vEfFVJZ+DUCMbkHJpx9F5ZdE9GYpH46BzFNKLNKCAl
	 ZfpZ+vMXSYL1RqYw/tXPhBR2NGsIct6GEfAxcpLgR74FxrXzW23mRij8ef8yXPi2aQGJB
	 YGr+P4sEA7B4xnxfHxfZfGi4QWe0BiILIVExxfcx2I2XLepG4iQF5ImrODHfCQEiyxGUf
	 iw+l107GANXHX2Rn3IKM/JiILo5ZJ8DIXnN9+eWmUloGLK9RjivtXwVEI+MoJIFfVyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BAZexqmf;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61A0606A323
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 14:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A61A0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BAZexqmf
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b7c7fd4c33so594203a12.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 06:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794925621; x=1795530421; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7lF60lFOMK4KSB/YQRQPyley38K8GzvHoR/O0uSbB4=;
        b=BAZexqmfDpzP3E4XE2fs++IayWcIVKGZM1t+0Jmc037x7NlOvioqahQdSZVcjFUyIP
         WYSqqyoAJGuAm2JuTM2EoJGkgsn4abzaMFQ9GASLNM8p/5cHTzRyR+y39gCC94IyxnF6
         qmCCSFGQswxBg8leIs43Z0RX3Ec8bgdo+9rcjrbB7E3R/XVCF7oazUe6AnXgG8C3Sx/J
         aWmEkGZDoYCy5VrsAtbVD7ISJyVILAXgCE+cRebuuRPmoYNwWwGdm3kWxLVl0rVo8eHh
         dyOiMgP5kBRnz6g6fNQyfSYGcD1NEfOp102SmwfaaATdtUOiV6WDUtEFBDnixi1wbMT1
         m1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925621; x=1795530421;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7lF60lFOMK4KSB/YQRQPyley38K8GzvHoR/O0uSbB4=;
        b=ztQyXh9ySVnnwk+N145SnAu7sbYOhjDLcCreI76NWZ5Eta6GprM8bSvS774K/aY7if
         bSSbt8YCgaPboM06b+jm34qp4xqOKr6QB0w91jiid9QcwIkCOnxlDc5ikqAZhqlILnWH
         i0e8v8yyEp6NHS3utE3kFklXeTFsVYA2pkk8d9ud7gqOwhztaKXPzwC+P7CInXyh9kBH
         stPYlf3nqOaJsD6KdUk4xFyVvz33WIxhrYLKHr8MtDL9SxaBGsVWX1FY+RzGzSs+TfSI
         nH1sfHkL7YEX75CsWTectDsMRHtolqx3iNc6LW8t3mhPYdC/Nx3rqtlFL5FN5Q1PXwK6
         FVVg==
X-Gm-Message-State: APuU4Z94+PoTR6BwS084ZoO4RdwsLFpMmhQ6XZJ84JK9kmao84jAfIFG
	kFC/zCXZPsW2O/Ex4yGW9k0zJ+01EkeSkztMzhncWlEmFBAzGoSLk/s7SAgASQz34sYvBzNWXvZ
	ZFy3/IeM=
X-Gm-Gg: AYBFou3eihL071FtslPhA6mu3cZV/OM6aI2+bz/io+Celo8LvmKbHdSPe/wENzogWkX
	+ssh7OheVv25XSkl1ZrHWWY/b7jN316xaQrv2hm87Osw2XHGvzHDvB39AeVOWgkLCuB6Xyd2wWt
	WQSxsdVIvHtWOjbkb5fKZd8+e1G4ii+sRyyp/dTY8eFPYO+cyDbjPboMcYCkMe4p8mp+XtkfCwA
	Rduw1bTrgy0vc+4JcyxKYinUWS1OGKJ0kk5Px3SBdWM4qj0A7UVbi4RpnZ+jasxiG3EuSLYJi+k
	2VNDMjZju2qN5k5ATtWkwCs1Gn5FkJQw+A3WDTeUUOi3dkKGaidxv0JuPsR5ckM6aI3ZxhzFaiD
	XsrYbI8H7qI54ik03sut3vd6lfPcsGVML/aPTU3tDIEwyxoSd6kM1cKbGWF3tK0fBkIoXrPY45r
	mR4z4pE+pNC+PSPFc+YiStfPdveAB+bc5LOQxPlwpvtOIfDJ/RsA1+hATzIFllp7Ayld7sBWLvG
	puea4t00/BrVwiHAe1+dqXl3TdkQFpaoB+grcSgoVyzwDg5qNjV6SVs/GcRaH+amVlpeexVAvdZ
	rXvFafT6C1Ju51QDVnn4pMx81DIYtCPd5Ck=
X-Received: by 2002:aa7:ccd7:0:b0:6b8:7c04:9bdf with SMTP id 4fb4d7f45d1cf-6b87c049d2bmr1002230a12.2.1794925620496;
        Tue, 17 Nov 2026 06:27:00 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm9236747fac.7.2026.11.17.06.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:26:57 -0800 (PST)
Message-ID: <295b6dc8-58cf-4aa1-946a-d48e670a7f37@suse.com>
Date: Tue, 17 Nov 2026 22:26:41 +0800
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
Subject: Re: [RFC PATCH v6 3/3] ocfs2: switch dio write path from buffer_head
 to iomap
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261115154013.9379-1-heming.zhao@suse.com>
 <20261115154013.9379-4-heming.zhao@suse.com>
 <sashiko-outbox-215653@kernel.org>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-215653@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 00:39, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 9 potential
> issues to consider:
> - [High] ocfs2: build failure from using removed struct iomap_ops in
>    __iomap_dio_rw()> - [High] ocfs2: unwritten cluster mapped as IOMAP_MAPPED in
>    ocfs2_unwritten_check()
> - [High] ocfs2: unaligned 16MB cap in ocfs2_dio_wr_map_blocks() dirties
>    DIO range
> - [High] ocfs2: missing IOMAP_DIO_FORCE_WAIT on sub-cluster extending
>    async DIO writes
> - [High] ocfs2: ocfs2_dio_del_orphan() leaks excess clusters and runs
>    after rw_unlock
> - [High] ocfs2: broken O_DIRECT alignment and buffered fallback in
>    ocfs2_file_write_iter()
> - [Medium] ocfs2: quota freed for allocated clusters in
>    ocfs2_write_begin_nolock()
> - [Medium] ocfs2: off-by-one cluster check on -ENOSPC in
>    ocfs2_dio_wr_map_blocks()
> - [Medium] ocfs2: blocking and on-disk changes before IOMAP_NOWAIT check
>    in DIO write
> --
> 
> commit 295acb4171def4f98acfe868a1d80047646a8e1a
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: switch dio write path from buffer_head to iomap
> 
> This commit converts the OCFS2 direct I/O write path from legacy
> buffer_head helpers to iomap, replacing ocfs2_dio_wr_get_block() with
> multi-cluster mapping in ocfs2_dio_wr_map_blocks() and moving EOF zeroing
> and orphan handling into ocfs2_file_write_iter().
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 6158ab6515ad2..1648509312179 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
> 
> [ ... ]
> 
>> @@ -1380,77 +1716,180 @@ static void ocfs2_set_target_boundaries(struct ocfs2_super *osb,
>>   static void ocfs2_unwritten_check(struct inode *inode,
>>   				  struct ocfs2_write_ctxt *wc,
>>   				  struct ocfs2_write_cluster_desc *desc)
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
>> +	} else if (wc->w_type == OCFS2_WRITE_DIRECT) {
>> +		/* This direct write will doing zero. */
>> +		desc->c_clear_unwritten = 0;
>>   	}
> 
> [Severity: High]
> Does ocfs2_unwritten_check() cause ocfs2_dio_wr_map_blocks() to report an
> unwritten cluster as IOMAP_MAPPED when another in-flight direct write owns
> the entry on oi->ip_unwritten_list?
> 
> CPU0 (write #1, iocb1)            CPU1 (write #2, iocb2)
> ocfs2_dio_wr_map_blocks()
>    ocfs2_write_begin_nolock()
>      ocfs2_dio_add_unwritten()
>        adds ue (ue_owner = iocb1)
>                                    ocfs2_dio_wr_map_blocks()
>                                      ocfs2_unwritten_check()
>                                        ue->ue_owner != iocb2
>                                        c_needs_zero = 0
>                                        c_dio_unwritten = 0
>                                      reports OCFS2_MAP_MAPPED
>                                      iomap_dio_complete() -> returns to user
>    bio fails or stops short
>    ocfs2_dio_end_io()
>      frees ue without converting   <-- write #2 data stays in unwritten extent
> 
> Because c_needs_zero and c_dio_unwritten are both 0 for write #2,
> ocfs2_desc_dio_unwritten() returns false and write #2 does not record its
> own unwritten entry.  If write #2 finishes first, reads see zeros until
> write #1 completes; if write #1 fails or completes short before that
> cluster, the extent is never marked written and write #2's data is lost
> (and sub-block writes in write #2 also skip iomap sub-block zeroing
> because IOMAP_F_NEW is not set).

agree. I have found a solution to fix it.
I will add retry logic in ocfs2_dio_wr_map_blocks() to wait for the
unwritten list to be cleared by the owner (#1 CPU)

> 
> [ ... ]
> 
>> @@ -1886,11 +2392,26 @@ int ocfs2_write_begin_nolock(struct address_space *mapping,
>>   
>>   	ret = ocfs2_write_cluster_by_desc(mapping, data_ac, meta_ac, wc, pos,
>>   					  len);
>> +	if (wc->w_clusters_unused) {
>> +		/* A direct write got a shorter chunk than reserved. */
>> +		dquot_free_space(inode,
>> +			ocfs2_clusters_to_bytes(osb->sb, wc->w_clusters_unused));
>> +		clusters_to_alloc -= wc->w_clusters_unused;
>> +		wc->w_clusters_unused = 0;
>> +	}
>>   	if (ret) {
>>   		mlog_errno(ret);
>>   		goto out_quota;
>>   	}
>>   
>> +	if (type == OCFS2_WRITE_DIRECT) {
>> +		ret = ocfs2_dio_add_unwritten(inode, wc);
>> +		if (ret) {
>> +			mlog_errno(ret);
>> +			goto out_quota;
>> +		}
>> +	}
> 
> [Severity: Medium]
> Does jumping to out_quota here free quota for clusters that were already
> allocated and attached to the inode?
> 
> Once ocfs2_dio_alloc_clusters() succeeds inside ocfs2_write_clusters_direct(),
> the allocated clusters have been added to the extent tree and i_clusters in
> wc->w_handle.  If ocfs2_prepare_cluster_folios() or ocfs2_dio_add_unwritten()
> then fails, out_quota calls dquot_free_space() for the remaining
> clusters_to_alloc and out_commit commits the transaction, underflowing the
> inode's quota reservation while keeping the allocated clusters on disk.

agree.

> 
> [ ... ]
> 
>> @@ -2156,132 +2677,134 @@ static int ocfs2_write_end(const struct kiocb *iocb,
>> +static int ocfs2_dio_wr_map_blocks(struct inode *inode,
>> +				   struct ocfs2_map_block *map,
>> +				   unsigned int flags, void *owner)
>>   {
>>   	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
>>   	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>>   	struct ocfs2_write_ctxt *wc;
>> -	struct ocfs2_write_cluster_desc *desc = NULL;
>> -	struct ocfs2_dio_write_ctxt *dwc = NULL;
>> +	struct ocfs2_write_cluster_desc *desc;
>> +	struct ocfs2_map_block probe;
>>   	struct buffer_head *di_bh = NULL;
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
>> +	unsigned int blkbits = inode->i_sb->s_blocksize_bits;
>> +	u64 bpc = ocfs2_clusters_to_blocks(inode->i_sb, 1);
>> +	u64 lblk = map->lblk;
>> +	u64 eof_blk = ocfs2_blocks_for_bytes(inode->i_sb, i_size_read(inode));
>> +	loff_t pos = lblk << blkbits;
>> +	loff_t len, end;
>> +	int ret = 0, unwritten;
>>   
>> -	if ((iblock <= endblk) &&
>> -	    ((iblock + ((len - 1) >> i_blkbits)) > endblk))
>> -		len = (endblk - iblock + 1) << i_blkbits;
>> +	/* Do not hand out a mapping which is over the end of the file. */
>> +	if (lblk < eof_blk && lblk + map->len > eof_blk)
>> +		map->len = eof_blk - lblk;
>>   
>> -	mlog(0, "get block of %llu at %llu:%u req %u\n",
>> -			inode->i_ino, pos, len, total_len);
>> +	map->len = min_t(u64, map->len,
>> +			 max_t(u64, OCFS2_DIO_MAX_MAP_BYTES >> blkbits, bpc));
> 
> [Severity: High]
> When lblk is not cluster-aligned and the write exceeds 16MB, can capping
> map->len at OCFS2_DIO_MAX_MAP_BYTES >> blkbits split the mapping in the
> middle of a cluster and corrupt the second half of that cluster?
> 
> If a direct write > 16MB starts at an unaligned block offset into a hole or
> unwritten extent below i_size (for example, pos = 4KB with 64KB clusters),
> the first mapping ends at 16MB + 4KB, mid-way through a cluster.
> ocfs2_grab_folios_direct() then treats 16MB + 4KB as the end of the user
> write and zeroes and dirties the page-cache folios for the tail of that
> cluster ([16MB + 4KB, 16MB + 64KB)).  Because __iomap_dio_rw() only
> invalidates the page cache before starting iomap_iter(), the next mapping
> writes directly to [16MB + 4KB, ...) on disk while dirty zero folios remain
> in the page cache and later overwrite the direct I/O data on writeback.
> 

agree, will modify the map->len logic.

>> @@ -2290,95 +2813,149 @@ static int ocfs2_dio_wr_get_block(struct inode *inode, sector_t iblock,
>> +again:
>>   	ret = ocfs2_write_begin_nolock(inode->i_mapping, pos, len,
>>   				       OCFS2_WRITE_DIRECT, NULL,
>> -				       (void **)&wc, di_bh, NULL);
>> +				       (void **)&wc, di_bh, NULL, owner);
>> +	if (ret == -ENOSPC &&
>> +	    ocfs2_clusters_for_bytes(inode->i_sb, pos + len) >
>> +	    ocfs2_clusters_for_bytes(inode->i_sb, pos) + 1) {
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
> Should the starting cluster in this -ENOSPC retry check use
> ocfs2_bytes_to_clusters(inode->i_sb, pos) instead of
> ocfs2_clusters_for_bytes(inode->i_sb, pos)?
> 
> ocfs2_clusters_for_bytes() rounds up to the next cluster boundary, so when
> pos is not cluster-aligned and [pos, pos + len) spans two clusters c and
> c + 1, ocfs2_clusters_for_bytes(inode->i_sb, pos) returns c + 1 and
> ocfs2_clusters_for_bytes(inode->i_sb, pos + len) returns c + 2.  The
> condition c + 2 > (c + 1) + 1 evaluates to false, skipping the single-cluster
> fallback and returning -ENOSPC prematurely.
> 

will follow the suggestion

> Also, ocfs2_dio_wr_map_blocks() still has a leftover "//zhm: remove??"
> comment on the IOMAP_NOWAIT check above, and the commit message refers to
> ocfs2_dio_write_end_io() and ocfs2_iomap_dio_end_io_write(), whereas the
> patch defines ocfs2_dio_end_io() and ocfs2_dio_end_io_write().

removed
> 
> [ ... ]
> 
>> @@ -2604,10 +3170,95 @@ static int ocfs2_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>>   	return 0;
>>   }
>>   
>> +static int ocfs2_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
>> +			    struct iomap *srcmap)
>> +{
>> +	int ret;
>> +
>> +	if (iomap->length) {
>> +		ret = iomap_iter_continue(iter, iomap, srcmap, 0);
>> +		if (ret <= 0)
>> +			return ret;
>> +	}
>> +
>> +	ret = ocfs2_iomap_begin(iter->inode, iter->pos, iter->len, iter->flags,
>> +				iomap, srcmap, iter->private);
>> +	return ret < 0 ? ret : 1;
>> +}
>> +
>>   const struct iomap_ops ocfs2_iomap_ops = {
>> -	.iomap_begin	= ocfs2_iomap_begin,
>> +	.iomap_next	= ocfs2_iomap_next,
>>   };
> 
> [Severity: High]
> Does this fail to build because struct iomap_ops no longer exists in
> include/linux/iomap.h?
> 
> __iomap_dio_rw() takes an iomap_iter_next_fn callback directly as its third
> parameter:
> 
> include/linux/iomap.h:
> struct iomap_dio *__iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> 		iomap_iter_next_fn next, const struct iomap_dio_ops *dops,
> 		unsigned int dio_flags, void *private, size_t done_before);
> 
> Defining const struct iomap_ops ocfs2_iomap_ops here (and declaring it in
> fs/ocfs2/aops.h) fails to compile on an incomplete type, and passing
> &ocfs2_iomap_ops to __iomap_dio_rw() in ocfs2_file_write_iter() passes the
> wrong type instead of ocfs2_iomap_next.

The iomap APIs have changed during the dev of this patch set. I will address
in the next version.

> 
>> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
>> index 1fca34e803df9..87951b2e1d340 100644
>> --- a/fs/ocfs2/file.c
>> +++ b/fs/ocfs2/file.c
> 
> [ ... ]
> 
>> @@ -2404,6 +2413,11 @@ static bool ocfs2_should_use_dio(struct kiocb *iocb, struct iov_iter *iter,
>>   				struct inode *inode)
>>   {
>>   	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
>> +	unsigned int dio_align = bdev_logical_block_size(inode->i_sb->s_bdev);
>> +
>> +	/* Fallback to buffered I/O if we do not alignment. */
>> +	if (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter), dio_align))
>> +		return false;
> 
> [Severity: High]
> Won't returning false here cause misaligned O_DIRECT reads and writes to
> silently fall back to buffered I/O instead of returning -EINVAL?
> 
> In addition, when ocfs2_file_write_iter() falls back to buffered I/O (either
> via ocfs2_should_use_dio() returning false or on -ENOTBLK):
> - In the !ocfs2_should_use_dio() branch, clearing IOCB_DIRECT before calling
>    __generic_file_write_iter() skips direct_write_fallback(), leaving dirty
>    pages in the page cache without writeback or invalidation.
> - On both fallback paths, local direct_io remains 1, so the post-write
>    ((file->f_flags & O_DSYNC) && !direct_io) check is skipped and O_DSYNC
>    writes return without committing the journal.
> - With coherency=buffered on a non-extending write, rw_level is 0 (PR), so
>    the buffered write fallback runs without the exclusive EX cluster rw_lock,
>    and if IOCB_NOWAIT was set, the fallback blocks on locks and transactions.
> 

will move the misaligned logic from ocfs2_should_use_dio() to
ocfs2_file_write_iter().

>> @@ -2527,26 +2574,90 @@ static ssize_t ocfs2_file_write_iter(struct kiocb *iocb,
>> -	/* communicate with ocfs2_dio_end_io */
>> -	ocfs2_iocb_set_rw_locked(iocb, rw_level);
>> +	if (direct_io && ocfs2_should_use_dio(iocb, from, inode)) {
>> +		if (iocb->ki_pos > i_size_read(inode) &&
>> +		    fault_in_iov_iter_readable(from, count)) {
>> +			ret = -EFAULT;
>> +			goto out;
>> +		}
>>   
>> -	written = __generic_file_write_iter(iocb, from);
>> -	/* buffered aio wouldn't have proper lock coverage today */
>> -	BUG_ON(written == -EIOCBQUEUED && !direct_io);
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
>> +
>> +		ret = ocfs2_dio_zero_eof(inode, iocb->ki_pos, count);
>> +		if (ret < 0)
>> +			goto out;
> 
> [Severity: High]
> Can an asynchronous direct write that extends i_size within an already
> allocated cluster complete asynchronously and have its data zeroed by the
> next write?
> 
> CPU0 (async write #1: 4KB..8KB)   CPU1 (write #2: 8KB..12KB)
> ocfs2_file_write_iter()
>    i_size is 4KB, cluster is 64KB
>    clusters_for_bytes(8KB) == 1
>    dio_flags = 0 (no FORCE_WAIT)
>    __iomap_dio_rw() -> -EIOCBQUEUED
>    inode_unlock(inode)
>                                    ocfs2_file_write_iter()
>                                      inode_lock(inode)
>                                      i_size is still 4KB
>                                      ocfs2_dio_zero_eof(pos = 8KB)
>                                        ocfs2_zero_tail()
>                                          zeroes 4KB..8KB  <-- clobbers write #1
>    s_dio_done_wq:
>      ocfs2_dio_end_io_write()
>        updates i_size to 8KB
> 
> In __iomap_dio_rw(), extending writes only set IOMAP_DIO_COMP_WORK, not
> wait_for_completion.  When cluster_size > block_size and a block-aligned
> async write extends i_size without crossing a cluster boundary,
> IOMAP_DIO_FORCE_WAIT is not set, so inode_lock(inode) is dropped before
> s_dio_done_wq updates i_size.

agree, will add condition check in ocfs2_file_write_iter().

> 
> [Severity: Medium]
> Does this block and modify on-disk metadata when IOCB_NOWAIT is set?
> 
> ocfs2_overwrite_io() in ocfs2_prepare_inode_for_write() allows writes past
> i_size into the tail of an allocated cluster or into preallocated unwritten
> extents.  ocfs2_file_write_iter() then runs fault_in_iov_iter_readable(),
> ocfs2_add_inode_to_orphan(), and ocfs2_dio_zero_eof() — sleeping on page
> faults, cluster locks, and journal transactions — before
> ocfs2_dio_wr_map_blocks() checks IOMAP_NOWAIT and fails with -EAGAIN.


agree, also requires new condition check in ocfs2_file_write_iter().

> 
> [ ... ]
> 
>> @@ -2571,6 +2682,13 @@ static ssize_t ocfs2_file_write_iter(struct kiocb *iocb,
>>   	}
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
> If an extending direct write fails or completes short after allocating
> clusters beyond i_size, does ocfs2_dio_del_orphan() leave those excess
> clusters allocated past i_size?
> 
> ocfs2_dio_zero_eof() and ocfs2_dio_wr_map_blocks() allocate and commit
> clusters before bio submission or when pinning user pages (for instance, if
> ki_pos == i_size and the user buffer faults in bio_iov_iter_get_pages(),
> since fault_in_iov_iter_readable() only runs when ki_pos > i_size).  When
> the write fails or stops short, i_size is not extended to cover the new
> clusters, but ocfs2_dio_del_orphan() removes the inode from the orphan
> directory and clears OCFS2_DIO_ORPHANED_FL without truncating the blocks
> beyond i_size, leaking the allocated clusters and quota.
> 
> Additionally, for synchronous DIO completions, ocfs2_dio_end_io() calls
> ocfs2_rw_unlock() inside iomap_dio_complete() before returning here, so
> ocfs2_dio_del_orphan() runs after the cluster-wide rw_lock has already been
> released.
> 

agree. in my view, should restore the ocfs2_del_inode_from_orphan() in
ocfs2_dio_end_io_write().

Thanks,
Heming
