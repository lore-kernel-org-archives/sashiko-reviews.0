Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9F62E764D
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 06:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786948574; cv=none; b=d0lcLYNzdXuf3RsUTkUuI3U83y+hniCyVh31rAYcDFgnvxD6JjoaCp9kU3WPKuSkf3dzjsbH+TiMiv1C3LqTYnsHADmT8s/rkZz9mkmK8YN7IrY/BDFKpttMpnG1piRr1nIGufE8n/eNChAKhReQr9t7aDpz6utEuWmHJyllqtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786948574; c=relaxed/simple;
	bh=9cIEDPksk2dYYfDrAzVGu/LozkxCt4A40/O84XU7qfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JE4GRSrSsWMryV+txH/WuBEOqwsUT0MnvcywM1a9nHck9l8GKlUkzwOwt6hC9+BsSiqPfz58PiuA8EA6OPH14uR9Z9BcQYX1ola9MkBF6VrsNQ9LedIrK8/mnEUsefq3Mt29TLwyX/bqbobFuSDBwQNVn7PdI/UYKMtvl8p+npA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQXXRfzE; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQXXRfzE"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso2306435b3a.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 16 Aug 2026 23:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786948572; x=1787553372; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBHG+Z6lBd9ZDVanNAt3LDpxCtVhyLDciOIlO1eiimU=;
        b=hQXXRfzERatlHdM6mtZVC6Fso3tqm7mSmegKTlDXihpKt3zKvc17GG4pXCZxBHxCxX
         Jp6yAH+3t6pphs+uWInWkQgisrfUTj875Rc8pWH2LvF/Eak7c4zDDbtc0MFefXMCu3f3
         IE1Nneo2vyp+0mU5LpwtrkG1YfdiLcVKoyGxiByrWcdegwB0QTd518+ajzwpJ/vF55OR
         whuqI7C5BmWUaUS8CJdGdEn3rhTw9Jt0QjSmuvYPe+2YgIkEJwUKzSroLVM9NUOWoI+l
         kpmFat1E44YaOmdyMmSbw0gjTZCxRPhaRfVIenbAEX4tHHf1iXUyiSITSmxtNZdMR8Am
         BOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786948572; x=1787553372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBHG+Z6lBd9ZDVanNAt3LDpxCtVhyLDciOIlO1eiimU=;
        b=ZWHHCWD8rucvs6YaJacF5GoNI3A3ADGEF5hRX5vmovRvApTkiHzY126YdIQqAcVML8
         mYK8nVnPYjEBsyQZb9pEsMIrgfytseeV9/Gq/DOdyFup+bVbPcmr0C9ch5S7fimXvJY6
         Ud89+qK9Si7YlAv5e7g55L1fEQE1A/IGGuB2iJnMdoxDWO+VUJaRV8gAVhS8OdE6lRMm
         2z8Co/wRSCRp4LAHAXs1RrpK+nDmKGC8VSaMWg2cPwRRhAj0bTS3MwOClXXy2lvWigLO
         w9TUK5vKTVSoMBjYKQGl5SpfMY917BYaX4nvPdI3v14eQRxMI9LAjekHfbYar15/5UNx
         UfYQ==
X-Gm-Message-State: AOJu0Ywa4XFqnkmFgTC9Z8NY6+1sw+g0w1cnjxAoR1Oyyz205zeDDPhK
	Q0ZF3+nN6NLRCgXDFKN1PYbe2eJHlwKcev+uhIeuprXLKIp5nt+ouy67AO/+OBnIkbQ=
X-Gm-Gg: AR+sD10tu2lm9cSH1aFIBCYfPUxjDbzaofeGq4qMsytQWXmuciU7WO82Re5dK19Hmzq
	z19xJvK7nWJ5kWAHzjewkPhkPJE4neTEA0Sl7JgJqa/B6M05rY2DRHaMA3DNIP5zLpbgHDdvejG
	xA2wqFKQICFwCQqMN7GvBLnk6WnAK3tyXm/ERI4tjHVNWzPErBS0B704PA7ZOEYOFHIfLNRCHEw
	n0VSTYJ9fyF5d/w4biGmpkGSdn94qgWeIr+p9hHy9XSC5tMeVHiNxmUNhIHuPfj5GAhaGBSgNRb
	REnbBrCpEA+TD2ekFfpyNTvnjbQze0v91JX8cQRFtdojeJLUf1Cl6SvEDjqtE8XCvTzOUrSZNFN
	XLCWa+V3FLYTGvA3uucU6VYjBV090XeBLm7ojfKDRE2406IjIET+xsVWQV3Bwcwee8qOzlMiVg3
	2Yv2S9/olM3VafwvavCejYnY0nO/m7+TCYZuYSVkQxwNZX4VE3RV4ep3P1/Z5kb0rarw64WXs2y
	M6B3EcWjse3VXGsvfE=
X-Received: by 2002:a05:6a00:a112:b0:84e:1a34:2470 with SMTP id d2e1a72fcca58-84fde298c72mr21936954b3a.30.1786948571834;
        Sun, 16 Aug 2026 23:36:11 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13c036c50sm211885a12.26.2026.08.16.23.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 23:36:11 -0700 (PDT)
Message-ID: <4d03cf94-144a-4389-a5cb-0f4fe5438e46@gmail.com>
Date: Mon, 17 Aug 2026 14:35:39 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 16/32] ext4: implement writeback path using iomap
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: tytso@mit.edu, linux-ext4@vger.kernel.org
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814093331.1703882-17-yi.zhang@huaweicloud.com>
 <20260814101948.9AE051F000E9@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814101948.9AE051F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2026 6:19 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [Critical] The iomap writeback path queues `iomap_ioend` structures to the `i_rsv_conversion_list`, but the worker function is uninitialized and defaults to `ext4_end_io_rsv_work`, leading to type confusion and memory corruption.
> - [Critical] Failure to update `ext4_page_mkwrite()` to use the iomap framework for iomap-enabled inodes causes AB-BA deadlocks and type confusion on `folio->private`.
> - [High] The iomap writeback range mapping logic unconditionally expands the allocation length up to the end of the writeback range, incorrectly allocating up to 8MB of unwritten extents into sparse file holes.
> - [Medium] Missing WRITE_ONCE() for 64-bit ei->i_disksize allows torn reads on 32-bit systems.
> - [Medium] Improper use of min_t() truncates the 64-bit wbc->range_end before comparison, defeating the maximum block cap.
> --
> 
> --- Patch [16]: [PATCH -next v5 16/32] ext4: implement writeback path using iomap ---
> commit 5c1a016c9a25acdff3a66fb714afe96821e567b6
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: implement writeback path using iomap
> 
> This commit adds the iomap writeback path for ext4 buffered I/O, introducing
> ext4_iomap_writepages() and the corresponding iomap_writeback_ops. It also
> adds an end I/O work handler to convert unwritten extents and update file
> size upon I/O completion.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index d831d1911a6ff..0b3e54e12b78f 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
> [ ... ]
>> @@ -4134,10 +4135,154 @@ static void ext4_iomap_readahead(struct readahead_control *rac)
>> +static int ext4_iomap_map_writeback_range(struct iomap_writepage_ctx *wpc,
>> +					  loff_t offset, unsigned int dirty_len)
>> +{
> [ ... ]
>> +	blk_len = dirty_len >> blkbits;
>> +	blk_end = min_t(unsigned int, (wpc->wbc->range_end >> blkbits),
>> +				      (UINT_MAX - 1));
> 
> [Severity: Medium]
> Does this code truncate the 64-bit range_end before the comparison?
> 
> If wpc->wbc->range_end >> blkbits is evaluated as a 64-bit value but then
> cast to unsigned int by min_t(unsigned int, ...), could this truncate the
> value to 0 when the shifted value is a multiple of 2^32?
> 
> This might disable the writeback batching optimization for specific offsets
> in very large files (e.g., syncing around 16TB boundaries).
> 
>> +	if (blk_end > index + blk_len)
>> +		blk_len = blk_end - index + 1;

It's true that this can indeed happen when wbc->end is manually
specified. We use umin() instead.

> 
> [Severity: High]
> Will this logic unconditionally expand the block allocation length to the
> end of the writeback range?
> 
> It looks like blk_len is expanded up to blk_end (which typically represents
> the end of the VFS writeback range) without querying the delalloc
> reservation length.
> 
> If a dirty folio is followed by a hole, could this allocate up to 8MB of
> unwritten extents into sparse file holes? This seems like it could
> improperly consume disk space and quotas.
> 

This is a false positive. blk_len will be trimmed in
ext4_map_blocks().

>> +retry:
>> +	map.m_lblk = index;
>> +	map.m_len = min_t(unsigned int, MAX_WRITEPAGES_EXTENT_LEN, blk_len);
> [ ... ]
>> +static const struct iomap_writeback_ops ext4_writeback_ops = {
>> +	.writeback_range = ext4_iomap_writeback_range,
>> +	.writeback_submit = ext4_iomap_writeback_submit,
>> +};
>> +
>>   static int ext4_iomap_writepages(struct address_space *mapping,
>>   				 struct writeback_control *wbc)
>>   {
> 
> [Severity: Critical]
> Since this patch introduces the iomap writeback path, do we also need to
> update the mmap fault handler?
> 
> The ext4_file_vm_ops.page_mkwrite handler remains hardcoded to
> ext4_page_mkwrite(), which uses the legacy ext4_block_page_mkwrite()
> logic.
> 
> That legacy path attaches a buffer_head to folio->private and starts a
> transaction before taking the folio lock.
> 
> When ext4_iomap_writepages() later flushes the folio,
> iomap_writeback_init() will cast folio->private to struct
> iomap_folio_state.
> 
> Calling atomic_set() on this state could overwrite the b_this_page list
> pointer in the buffer_head, potentially leading to memory corruption and
> AB-BA deadlocks between page faulting and writeback.
> 

This is a false positive. The mmap fault handler changes are in
the next patch (patch 17).

>> -	return 0;
>> +	struct inode *inode = mapping->host;
> [ ... ]
>> diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
>> index 0236b6b9785a2..2888e00575615 100644
>> --- a/fs/ext4/page-io.c
>> +++ b/fs/ext4/page-io.c
> [ ... ]
>> @@ -547,3 +548,124 @@ void ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *folio,
>> +static int ext4_iomap_wb_update_disksize(handle_t *handle, struct inode *inode,
>> +					 loff_t end)
>> +{
> [ ... ]
>> +	down_write(&ei->i_data_sem);
>> +	new_disksize = min(new_disksize, i_size_read(inode));
>> +	if (new_disksize > ei->i_disksize)
>> +		ei->i_disksize = new_disksize;
> 
> [Severity: Medium]
> Does this 64-bit assignment need a WRITE_ONCE() wrapper?
> 
> On 32-bit platforms, a plain 64-bit store to ei->i_disksize can be split
> into two 32-bit stores.
> 
> A concurrent lockless reader calling READ_ONCE(ei->i_disksize) might
> observe a torn value, resulting in wildly incorrect disk size values
> during concurrent writeback and truncation.
> 
>> +	up_write(&ei->i_data_sem);
>> +	ret = ext4_mark_inode_dirty(handle, inode);
> [ ... ]
>> +void ext4_iomap_end_bio(struct bio *bio)
>> +{
>> +	struct iomap_ioend *ioend = iomap_ioend_from_bio(bio);
>> +	struct ext4_inode_info *ei = EXT4_I(ioend->io_inode);
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ei->i_completed_io_lock, flags);
>> +	if (list_empty(&ei->i_rsv_conversion_list))
>> +		queue_work(EXT4_SB(ioend->io_inode->i_sb)->rsv_conversion_wq,
>> +			   &ei->i_rsv_conversion_work);
> 
> [Severity: Critical]
> Is the worker function for ei->i_rsv_conversion_work properly initialized
> for iomap inodes?
> 
> It looks like ei->i_rsv_conversion_work is statically initialized to the
> legacy ext4_end_io_rsv_work() function in ext4_alloc_inode().
> 
> This new iomap writeback path queues iomap_ioend structs to the list, but
> it doesn't appear to call INIT_WORK() to reassign the worker function to
> the newly introduced ext4_iomap_end_io().
> 
> When the work queue executes, wouldn't the legacy ext4_end_io_rsv_work()
> iterate over this list and blindly cast iomap_ioend structs to
> incompatible ext4_io_end_t structs, resulting in type confusion?
> 

This is a false positive. ei->i_rsv_conversion_work is initialized
in patch 31, where the iomap path is formally enabled.

Thanks,
Yi.

>> +	list_add_tail(&ioend->io_list, &ei->i_rsv_conversion_list);
>> +	spin_unlock_irqrestore(&ei->i_completed_io_lock, flags);
>> +}
> 

