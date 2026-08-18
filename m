Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49753E833E
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053179; cv=none; b=qqKUNKjJ0NDkhL47J36ryUb2JWZkUxQ9zKDedkhPn+dR5c4ZkIWbeNYKEiyMnlr04J2iCZayWhRy5jSyf8k/CMkVDU56KNOEeRKrovlruW19bGKf45bixzfJVDJKKFG+GPlLuycXfhGyN+3/QJrqryCoETfyMdFbEGLATt8ww+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053179; c=relaxed/simple;
	bh=kxQEGVQzFSOolwr41q7uGDJ9zXiCwgsMAmxez0mZfUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d71ovt4cTgAjwo6/bdk25mMdn39tgK1pUexkAHNeD8u7hyPbuKNpYBA7fQ6hxLCEsrtC07Xn23jrv3z63SU5mtWUqLvDQgWSOgTysghFA8qcu6NGG6fBIJfbcV19ykmCW9ZPDMw8QK0t53JlJzcPi/WGw3WvZc42NtUqGBkAXI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvcaz4xo; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvcaz4xo"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-382ef647e20so4322778a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 04:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787053177; x=1787657977; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVf9GOkX+pXDpfjYNXlrp1CLeegn8YbwJpyTMnccME8=;
        b=hvcaz4xoh9vaJNofH+lUKcIOCmtv0vaLjHmH6umvWk0edH8jLP2WXcjWiwQgDO7cx9
         fXfAROOfhyfDNv9BMdkjTDBpmNuSYFzTFJKL6Bsl80eF1+NwERGVZ8fYuUUYjBT4RlV1
         t4nare3tX/7wRddCWovZL/YoMvNeC1DhL+UbEGjLMgBf0xFhum1761iwpuKSVMdGRjye
         b+Tc7XnhQqyZ+UZ0RHGaGIVtXPwr1UQQbrTkVs+RjHMpYadB81Px+vockBVRZCgddWK1
         AHxMAQNgOa9sXDu7H4Si9zLRiPCWzJPQ3msnWk4JuRwHSmDPm/H/lCnDRb5Ww/xYD6y3
         cGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053177; x=1787657977;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVf9GOkX+pXDpfjYNXlrp1CLeegn8YbwJpyTMnccME8=;
        b=o6951UvtnL7017MV76DyJtM+TeDSLMHYJoQDTmoAMWNv+9TYRTuJU/cu53vqu70mK8
         D0lBLjl3izB0cj0ZzDuE0ThRMZVuOWOLmTO2KTgVVF/2+79Oz+lXqijhRwl6Eo+zqw3X
         9/bbJEy/d/YewnJZJ2nEPRuCYqrX8ogGnPYpm1EUqm8kLASKOB1eCdqdV6oYWbHR9zK/
         zNWcI85r46fqPB9alxGm6eBfrxjDIcWPdFvVVRIlpPLsar+QhrRBneKqNtzvPew/WHZc
         ZAW4Mf6ooWL3yFNj7BxmDAXNObN3RdbA4slIzNA5Fpn1VNuvGUlUqHFZbqyX/1/W7pvg
         DcSw==
X-Gm-Message-State: AOJu0Yx2dI0VENIC+uBZ/mnUbaqTOUhT4eCg7Qg9ylkkYsLT5EdaTxIF
	sIz5cwiBNrvjxVJW8cgyVRbKMkppdieAY/OQDwsM2/qaJohBryE8bgXbbAvFl2fKhRo=
X-Gm-Gg: AR+sD13o4MO2samk9pvScyROt7UxGbn/oFYQ9OrQ0X/HnnXW37odEO8lqpSnnKGibMZ
	PuzLH0eiaMwietB6A32XnX5OgUjQ9NkTy21hXBywP8ccvRJtwXM0/GQeq03uKchRW/u4APYXepx
	hNW79rpYxxlELrqjuLoB/EkB8xFrkK4KtJ/CuxdO+X3kdrMewWNozKZZtRzMO5hrbWaAI0y68Rp
	RJA/5ID6lF5BmgMDi/1r1g5nWT+3qeOMVmj2L+3ZdSMgwvweGOSXSpH5OdUzxpM91mt3XXKzuA8
	hpnzdVDkWqLHVSusDoUq85zfFhT+ZsAzBYeGXJ9ZgIJ9Z6VcaiEE3c53KaSFag3Gv/loS3jB6UT
	VLbwtcXHo9lNuDpUP2x9Y5MMB1116iz1CaHMqDCCHMpw63mfdx9b5lL/4gAtNRzC/sl1Wz1BEOB
	YUoUHctmN8Gl3plH5sglJvBnKHKj7Pg6EVgC76Utc3zt8nN7saMfH6Hk5ey3Jnry00QM3vtVlqU
	EIjxA8zGg==
X-Received: by 2002:a17:90b:2c8d:b0:38f:caa2:5721 with SMTP id 98e67ed59e1d1-3933e62f4f8mr35302167a91.17.1787053172726;
        Tue, 18 Aug 2026 04:39:32 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d2e63desm5637256a91.6.2026.08.18.04.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:39:32 -0700 (PDT)
Message-ID: <d137a3f4-2cf2-42da-b4ef-f6224fc3d4bc@gmail.com>
Date: Tue, 18 Aug 2026 19:39:25 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 23/32] ext4: submit and wait for pending
 disksize-grow I/O on writeback
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: tytso@mit.edu, linux-ext4@vger.kernel.org
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814093331.1703882-24-yi.zhang@huaweicloud.com>
 <20260814102556.AB31B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814102556.AB31B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2026 6:25 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [Critical] Unconditional clearing of the disksize-grow-pending state on I/O error exposes stale data.
> - [Critical] The iomap writeback path queues `struct iomap_ioend` to `ei->i_rsv_conversion_list`, but the work item executes `ext4_end_io_rsv_work` expecting `ext4_io_end_t`, causing memory corruption.
> - [High] Proactive submission of the EOF block issues a WB_SYNC_ALL writeback pass, violating WB_SYNC_NONE non-blocking guarantees.
> - [High] The EXT4_STATE_DISKSIZE_GROW_PENDING bit is never cleared when a file is truncated down or punched, leading to a permanent deadlock in ext4_iomap_wb_disksize_pending_wait on subsequent writes.
> - [Medium] The EXT4_STATE_DISKSIZE_GROW_PENDING flag is never set anywhere in the codebase.
> --
> 
> --- Patch [23]: [PATCH -next v5 23/32] ext4: submit and wait for pending disksize-grow I/O on writeback ---
> commit 8550774845865922b3c12e81e62fba6b64136065
> Author: Zhang Yi <yi.zhang@huawei.com>
> Subject: ext4: submit and wait for pending disksize-grow I/O on writeback
> 
> This patch introduces logic to submit and wait for pending zeroed EOF blocks
> that straddle i_disksize during writeback to prevent exposing stale data.
> It tags ioends with EXT4_IOMAP_IOEND_DISKSIZE_GROW_IO and proactively submits
> the pending ranges.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index e4a4396eaf879..a0707310b464c 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
>> @@ -4379,6 +4382,21 @@ static int ext4_iomap_writeback_submit(struct iomap_writepage_ctx *wpc,
>>   	    test_opt(ioend->io_inode->i_sb, DATA_ERR_ABORT))
>>   		ioend->io_bio.bi_end_io = ext4_iomap_end_bio;
>>   
>> +	/*
>> +	 * Mark the I/O as DISKSIZE_GROW_IO by setting io_private to
>> +	 * EXT4_IOMAP_IOEND_DISKSIZE_GROW_IO if it covers the pending range.
>> +	 * Such I/O will allow or trigger i_disksize advancement in the
>> +	 * ioend worker.
>> +	 */
>> +	plen = ext4_iomap_get_disksize_pending_range(inode, &pstart);
> 
> [Severity: Medium]
> Does this actually get triggered? A codebase search shows that the flag
> EXT4_STATE_DISKSIZE_GROW_PENDING is never actually set anywhere (for example,
> when zeroing the tail of the EOF block). Because the flag is never set,
> ext4_iomap_get_disksize_pending_range() will always return 0, which seems to
> completely bypass the newly added logic.

This is a false positive. EXT4_STATE_DISKSIZE_GROW_PENDING is set
in patch 28. This patch is just preparing for that functionality.

> 
>> +	if (plen &&
>> +	    round_down(ioend->io_offset, blocksize) <= pstart &&
>> +	    round_up(ioend->io_offset + ioend->io_size, blocksize) >=
>> +			pstart + plen) {
>> +		ioend->io_bio.bi_end_io = ext4_iomap_end_bio;
>> +		ioend->io_private = (void *)EXT4_IOMAP_IOEND_DISKSIZE_GROW_IO;
>> +	}
>> +
> 
> [ ... ]
> 
>> @@ -4398,6 +4416,29 @@ static const struct iomap_writeback_ops ext4_writeback_ops = {
>>   	.writeback_submit = ext4_iomap_writeback_submit,
>>   };
>>   
>> +/*
>> + * If the current writeback range begins after the pending zeroed EOF
>> + * block range which straddles i_disksize, issue a separate writeback to
>> + * flush it first, so as to avoid prolonged waiting.
>> + */
>> +static void ext4_iomap_wb_submit_zeroed_eof(struct inode *inode,
>> +					    struct writeback_control *wbc)
>> +{
>> +	struct address_space *mapping = inode->i_mapping;
>> +	loff_t pstart, plen, range_start;
>> +
>> +	if (wbc->range_cyclic)
>> +		range_start = (loff_t)mapping->writeback_index << PAGE_SHIFT;
>> +	else
>> +		range_start = wbc->range_start;
>> +
>> +	plen = ext4_iomap_get_disksize_pending_range(inode, &pstart);
>> +	if (!plen || range_start < pstart + plen)
>> +		return;
>> +
>> +	filemap_fdatawrite_range(mapping, pstart, pstart + plen - 1);
> 
> [Severity: High]
> Does this violate the WB_SYNC_NONE guarantees when called by the background
> flusher?
> 
> filemap_fdatawrite_range() initiates a WB_SYNC_ALL writeback pass. If
> ext4_iomap_writepages() is invoked with wbc->sync_mode == WB_SYNC_NONE,
> this nested WB_SYNC_ALL call will synchronously block waiting on page locks
> and in-flight I/O. This could stall the background flusher and potentially
> cause deadlocks if the thread holding the lock is blocked in memory reclaim
> waiting for the flusher to free pages.
> 

You're right. Although I don't quite see how the deadlock would
happen, keeping the original writeback mode is definitely safer.
I'll change it as follows:

/* Keep the caller's sync mode to avoid stalling the background flusher. */
if (wbc->sync_mode == WB_SYNC_ALL)
         filemap_fdatawrite_range(mapping, pstart, pstart + plen - 1);
else
         filemap_flush_range(mapping, pstart, pstart + plen - 1);


>> +}
>> +
> 
> [ ... ]
> 
>> diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
>> index 2888e00575615..955ff88045db6 100644
>> --- a/fs/ext4/page-io.c
>> +++ b/fs/ext4/page-io.c
>> @@ -549,6 +549,34 @@ void ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *folio,
>>   	} while ((bh = bh->b_this_page) != head);
>>   }
>>   
>> +/*
>> + * If the current writeback range starts beyond the zeroed EOF pending
>> + * range that straddles i_disksize, wait for the zeroed data from
>> + * ext4_block_zero_eof() to be written out first. Otherwise, extending
>> + * i_disksize may expose stale data in the old EOF block.
>> + */
>> +static void ext4_iomap_wb_disksize_pending_wait(struct inode *inode,
>> +						loff_t pos, size_t size)
>> +{
>> +	loff_t disksize = READ_ONCE(EXT4_I(inode)->i_disksize);
>> +	loff_t pstart, plen;
>> +
>> +	/*
>> +	 * Overwrite I/Os and I/Os covering the EOF block do not need to
>> +	 * wait: the former do not advance i_disksize past the pending
>> +	 * boundary, and the latter are the pending I/O itself (cleared in
>> +	 * the bio completion path).
>> +	 */
>> +	if (pos < round_up(disksize, i_blocksize(inode)))
>> +		return;
>> +
>> +	plen = ext4_iomap_get_disksize_pending_range(inode, &pstart);
>> +	if (!plen || pos < pstart + plen)
>> +		return;
>> +
>> +	ext4_iomap_wait_disksize_pending(inode);
> 
> [Severity: High]
> Could this wait indefinitely if the file is truncated down or punched?
> 
> If EXT4_STATE_DISKSIZE_GROW_PENDING is set, but no code clears it during
> ext4_truncate() or ext4_punch_hole(), the zeroed EOF page will be removed
> from the page cache while the bit remains set. If new data is subsequently
> written past the stale pending range, the writeback completion might call
> ext4_iomap_wb_disksize_pending_wait().
> 
> Since the original page was dropped, no I/O will ever complete to clear the
> bit, causing the worker thread to hang forever in the wait_on_bit call and
> permanently blocking the rsv_conversion_wq.
> 

This is a false positive. This case will be handled in patch 27.


>> +}
>> +
> 
> [ ... ]
> 
>> @@ -660,8 +691,17 @@ void ext4_iomap_end_bio(struct bio *bio)
>>   {
>>   	struct iomap_ioend *ioend = iomap_ioend_from_bio(bio);
>>   	struct ext4_inode_info *ei = EXT4_I(ioend->io_inode);
>> +	unsigned long io_mode = (unsigned long)ioend->io_private;
>>   	unsigned long flags;
>>   
>> +	/*
>> +	 * This is a disksize-pending I/O: clear the disksize-pending
>> +	 * state set in ext4_block_zero_eof() and wake up all waiters
>> +	 * that will update the inode i_disksize.
>> +	 */
>> +	if (io_mode == EXT4_IOMAP_IOEND_DISKSIZE_GROW_IO)
>> +		ext4_iomap_clear_disksize_pending(ioend->io_inode);
> 
> [Severity: Critical]
> Does clearing the pending state here expose stale data on I/O errors?
> 
> If the writeback fails, the pending state is unconditionally cleared here,
> waking up waiters in ext4_iomap_wb_disksize_pending_wait(). Because those
> waiters only check their own bio status, they could proceed to advance
> i_disksize past the failed EOF block in ext4_iomap_finish_ioend(). Advancing
> i_disksize over the failed zeroing operation exposes the stale data previously
> present in the block's tail on disk.

This is expected. Even in the original data=ordered mode, a data
writeback failure does not prevent i_disksize from being updated.
The ability to detect data write failures relies on data_err=abort,
which is consistent with the previous behavior.

> 
>> +
>>   	spin_lock_irqsave(&ei->i_completed_io_lock, flags);
>>   	if (list_empty(&ei->i_rsv_conversion_list))
>>   		queue_work(EXT4_SB(ioend->io_inode->i_sb)->rsv_conversion_wq,
>>   			   &ei->i_rsv_conversion_work);
>>   	list_add_tail(&ioend->io_list, &ei->i_rsv_conversion_list);
> 
> [Severity: Critical]
> Can this queueing lead to memory corruption due to type confusion?
> 
> A struct iomap_ioend is added to ei->i_rsv_conversion_list here and
> ei->i_rsv_conversion_work is scheduled. However, this work item is
> permanently bound in ext4_alloc_inode() to execute ext4_end_io_rsv_work().
> 
> When the workqueue executes ext4_end_io_rsv_work(), it iterates over the
> list and improperly casts the struct iomap_ioend entries to ext4_io_end_t.
> Accessing fields from this miscast pointer will retrieve garbage data,
> leading to a panic or use-after-free.
> 

This is a false positive. i_rsv_conversion_work is initialized
in patch 31, where the iomap path is formally enabled.

Thanks,
Yi.

