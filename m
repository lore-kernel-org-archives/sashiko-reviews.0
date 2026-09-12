Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D36535AC1E
	for <sashiko-reviews@lists.linux.dev>; Sat, 12 Sep 2026 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789201742; cv=none; b=mihtfcbJanMnIdxf++pwgnqNTgad39Sxob9GXScpWKjesQ/Oz+AOxcAavKqOsvO4FsiDGAGsbIdYwtVuJkaMVnAmG7NmLRtlSJYDaAGMFtNa5hEgvM8+yeqK9nWPN6Vlc90oSlzSlq49TuW4gzwuJv1XEV3h3PZd8qNdaADxEPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789201742; c=relaxed/simple;
	bh=Jr3Z5hnHY/gSm4sXIwIJ4qOe2MDnzFwkN9JANbpBKb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mvcqo95MpyMOH6Gfq3hXkzBvz9R2j4phy56lRt1bAHIEbxt607bQwpTdDv1eXZ6UGdaeG7N8C9XS8RWGSzDhtbpKELCn2ESDIO+U9yM6QBapcFC4oEQ9gg1G7ojpSMBbAogX3D1REV9j32nM+wvPmkMIE410D4o8Ya7+nYrMZQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPXAo8Al; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPXAo8Al"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so246523a91.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 12 Sep 2026 01:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789201740; x=1789806540; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8WyrkMGCFnrJHZlBLRQ3nbLnQoILyTDTc6d/TcvwDpo=;
        b=BPXAo8Al8l28jev7686gtuEHEsCoJZK+bqRccBsZ++VMgUtt2fY1fLqH+acqEVMCrn
         X9KzKukgZmJbsd82ZO6vZJtV8pTBhwUbc9BSpKPfVnWGENRb8xc6r8lJMVaOw6g+2Wa6
         TnCk8JEP7lyJqnyremGKvsKH7UczirJ8bfBPVYdn1j0OiOehHc0gq29XhOKqGZqIBVgC
         DtSnCFSBZ7YR37FV1BXinvVvQr5Sxhd/b/xrt1xpmv/+konjFjxP/cxUILSJ8zQQcwu1
         jvnWu7bLN/lYM8jHzNfrybS27JVJYuDPzCtUiLrv+tScf8QkgcmbKplKSySXsaeEdi6n
         4gbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789201740; x=1789806540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8WyrkMGCFnrJHZlBLRQ3nbLnQoILyTDTc6d/TcvwDpo=;
        b=tKUx3nQQQJIlvQ8zi9flwKLQeJmGEu1u2KmUWjuoBF+gxahz88/QZCxmBEwvpFPZpt
         B4NQfvCF7+fyczQZZM8fCrKYmQpAwAJALbQmDjkQtcnFmts0C6unoBTCpVm42NJJVlEC
         u+gsJXzYSf1C7Lp1R+qrLV3SZu8LPWYzXt/CIbWW84s1kDj9hXM02Q5YQzCGd7klQeS/
         ZPJGfkUZw8MViijdVwtWvx//GuGDK1t2fQRpG5ezgU7IcRbaDmnmzuSMgcFTKxOKM0Sc
         Goo9OUwUc4j7QMvzd+9oBG0EZXGEbGK65xVZ+AQQY8qwCQ4WNDVIXANPjaSTuJxBC/B5
         T3eA==
X-Gm-Message-State: AFuF++n2zNwTmSAr9uo6R7VNpBzD9LiKeoItv0aX9xDIb7tppVf8zfdc
	4sMZsf/tzl24xJ9pKOon24/IAXaK/aYnu3Mbu++BV41W21RtRBGVvX5KES9hcfT9+Ww=
X-Gm-Gg: AYBFou1zCeDDyVZoKMwbtuv2lPJRLVOqZsLhRUm11Itno8njf/BG9JLGm9xvrt024zu
	qwe3vaD5/c/d+tTItXp4HvidujO2fwK3bfHNrHsyrNmwvDtFYiLt+2s9GcCIHV6rf656MfO9kMv
	xTJoMj7TWkaS5v66ITiFqgp4CiheqJ+nLuF7QKXlcWVcAoOExxgpy4mXT/jKaIiW2SboIlW9mpD
	vAzwWuYS7Yvbs13gD/maTadKhT2dgawU0c8PEqmNh0SF5rao31FQqnv5Li/rfy0xZ1skDqwkhIY
	GN05Hv7gbTh7KMOx3W9aPu4mCF04vs9qFzheykU6AU2p4oTAO613Mr8aaut3TRYYsAOJwBvtRTv
	VOUB0qI6zBYx1LWCHDl/tGWCfADJPMo8JwWsZ1cemuobr1XQBmYBh04CxxMQFgDMzPSFm8BT+3s
	TzZTSX7KnuBzlwGLKLLxPodrIzKlhXuSE2+0F18ChXfbZDg89X7X9XnxqFDD2hiLpnHnfp8+jeI
	fRp3oDc30XAM9ECriw=
X-Received: by 2002:a17:90a:c2c6:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39dbbe85d7bmr3204586a91.4.1789201740359;
        Sat, 12 Sep 2026 01:29:00 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm9840725a91.14.2026.09.12.01.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 01:28:59 -0700 (PDT)
Message-ID: <bda020e4-2145-4c30-9330-ff8f9a6ff517@gmail.com>
Date: Sat, 12 Sep 2026 16:28:52 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/31] ext4: implement writeback path using iomap
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu
References: <20260903123543.2302999-1-yi.zhang@huaweicloud.com>
 <20260903123543.2302999-16-yi.zhang@huaweicloud.com>
 <20260903133650.EDC101F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260903133650.EDC101F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/2026 9:36 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] Journal Credits Exhaustion / Panic in `ext4_iomap_finish_ioend()` due to arbitrarily large merged ioends.
> - [High] Infinite loop in `ext4_iomap_map_writeback_range` due to open-coded ENOSPC retry logic without limits.
> --
> 
> commit e7cc5164579a940550c93afb2dfec1f186e079ed
> Author: Zhang Yi <yi.zhang@huawei.com>
> ext4: implement writeback path using iomap
> 
> This commit adds the iomap writeback path for ext4 buffered I/O, introducing
> new writeback operations and end I/O handlers. It maps and allocates blocks
> as unwritten extents during writeback to prevent stale data exposure.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index 1f18854b9cdd3..f7d7610197a1c 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
> 
> [ ... ]
> 
>> +static int ext4_iomap_map_writeback_range(struct iomap_writepage_ctx *wpc,
>> +					  loff_t offset, unsigned int dirty_len)
>> +{
> 
> [ ... ]
> 
>> +retry:
>> +	map.m_lblk = index;
>> +	map.m_len = min_t(unsigned int, MAX_WRITEPAGES_EXTENT_LEN, blk_len);
>> +	ret = ext4_map_blocks(NULL, inode, &map,
>> +			      EXT4_GET_BLOCKS_CREATE_UNWRIT_EXT |
>> +			      EXT4_GET_BLOCKS_METADATA_NOFAIL |
>> +			      EXT4_GET_BLOCKS_IO_SUBMIT |
>> +			      EXT4_EX_NOCACHE);
>> +	if (ret < 0) {
>> +		if (ext4_emergency_state(sb))
>> +			return ret;
>> +
>> +		/*
>> +		 * Retry transient ENOSPC errors, if
>> +		 * ext4_count_free_blocks() is non-zero, a commit
>> +		 * should free up blocks.
>> +		 */
>> +		if (ret == -ENOSPC && journal && ext4_count_free_clusters(sb)) {
>> +			jbd2_journal_force_commit_nested(journal);
>> +			goto retry;
>> +		}
> 
> [Severity: High]
> Could this open-coded retry loop result in an infinite hang under certain
> conditions?
> 
> If a non-root user fills the disk up to the threshold of root-reserved
> blocks, ext4_map_blocks() will return -ENOSPC because the block allocator
> denies access to reserved blocks for non-root users.
> 
> However, ext4_count_free_clusters() returns the total free space including
> those root-reserved blocks. Because the count evaluates as non-zero, the code
> will force a journal commit and goto retry indefinitely, without any loop
> limits.
> 
> Should this retry logic use a limit like ext4_should_retry_alloc(), or
> specifically account for root-reserved blocks to prevent a soft lockup in
> the writeback worker thread?
> 

This logic is inherited from the existing buffer_head writeback path
(the -ENOSPC handling in ext4_do_writepages()), which also retries after
a forced commit without any limit, so it does not introduce a new class
of problem.  That said, I agree that bounding the number of retries is
better, and I will add a limit in the next version.


>> diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
>> index 0236b6b9785a2..9b0e12b5463cf 100644
>> --- a/fs/ext4/page-io.c
>> +++ b/fs/ext4/page-io.c
> 
> [ ... ]
> 
>> +static void ext4_iomap_finish_ioend(struct iomap_ioend *ioend)
>> +{
> 
> [ ... ]
> 
>> +	/*
>> +	 * We may need to convert one extent, update the i_disksize and
>> +	 * dirty the inode.
>> +	 */
>> +	credits = ext4_chunk_trans_blocks(inode,
>> +			EXT4_MAX_BLOCKS(size, pos, inode->i_blkbits));
>> +	handle = ext4_journal_start(inode, EXT4_HT_EXT_CONVERT, credits);
>> +	if (IS_ERR(handle)) {
>> +		ret = PTR_ERR(handle);
>> +		goto out_err;
>> +	}
> 
> [ ... ]
> 
>> +void ext4_iomap_end_io(struct work_struct *work)
>> +{
>> +	struct ext4_inode_info *ei = container_of(work, struct ext4_inode_info,
>> +						  i_rsv_conversion_work);
>> +	struct iomap_ioend *ioend;
>> +	struct list_head ioend_list;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ei->i_completed_io_lock, flags);
>> +	list_replace_init(&ei->i_rsv_conversion_list, &ioend_list);
>> +	spin_unlock_irqrestore(&ei->i_completed_io_lock, flags);
>> +
>> +	iomap_sort_ioends(&ioend_list);
>> +	while (!list_empty(&ioend_list)) {
>> +		ioend = list_entry(ioend_list.next, struct iomap_ioend, io_list);
>> +		list_del_init(&ioend->io_list);
>> +		iomap_ioend_try_merge(ioend, &ioend_list);
>> +		ext4_iomap_finish_ioend(ioend);
>> +	}
>> +}
> 
> [Severity: Critical]
> Is there a risk of exhausting journal credits and panicking JBD2 when ioends
> are merged?
> 
> In ext4_iomap_end_io(), iomap_ioend_try_merge() merges contiguous completions
> into an arbitrarily large ioend. When this merged ioend is later passed to
> ext4_iomap_finish_ioend(), it requests credits using ext4_chunk_trans_blocks().
> 
> However, ext4_chunk_trans_blocks() internally hardcodes the extent count to 1,
> allocating credits sufficient for modifying only a single extent on disk.
> 
> If a user writes a very large contiguous file (e.g., larger than 128MB), the
> merged ioend will exceed the maximum size of a single unwritten extent in ext4
> (which is 32,768 blocks). This will cause ext4_convert_unwritten_extents() to
> loop over multiple extents using the same transaction handle.
> 
> Could this exhaust the single-extent credits provided by the transaction
> handle, resulting in a JBD2 panic during writeback?
> 

This is right.  ext4_convert_unwritten_extents() converts every extent
covered by the ioend using a single transaction handle, but that handle
was sized by ext4_chunk_trans_blocks() for one extent only, so a large
enough merged ioend can run out of credits.  This is hard to hit in
practice, since the end I/O worker normally runs promptly and not many
completed ioends accumulate before the merge, but to be safe I will
still fix it: call ext4_journal_ensure_credits() before each extent in
the conversion loop, so that the transaction is extended, or restarted
once it is full, as needed, and correct the estimation to
ext4_meta_trans_blocks(inode, max_blocks, 1, 0) at the same time, as no
data blocks are allocated there.

Thanks,
Yi.



