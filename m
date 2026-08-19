Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00063806B0
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 14:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149934; cv=none; b=uLwMgIUWptzrPWRUzhIsYvUO9NvnPKIPpg/51T/PmqQQoetGlgMFVwMsMuZfBIFCL71VbLcs8pVHMMILGxjH3e8tKB2gaz40NDvbnlEQYityFSMFMcZL+Rg8JNSFjzTZEEphSsa0JJ8dtNLllpzwX/E13Bk6WZegCYi8mu7sz+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149934; c=relaxed/simple;
	bh=a9VL/BUPvfhuslXy/b3aIMnPWBDXHgBoZTNcfHd3uX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wf4CYcgra4ngVQX6AC59cuS9exDqpBx5k1VgmUAWGgWBA92NiWB9dLCtLVfQqkTQHgK8h/ecqMw1fJjYjt1arfJt9+44yoLfUp3FJBStM9bqzqCBATPXcrRYa9/yznzOJ3ppXhcxmO3mTivTHeXVekum+Uzg/73/mxZE7ZQiDpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQ6XXAU9; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQ6XXAU9"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c999f162c9aso676829a12.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 07:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787149932; x=1787754732; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YFX/t4P2LSAhuskixBzY696FzFpYptXep8gVtvQJXY8=;
        b=PQ6XXAU9OR8ddDrka3Cq5Agi1ojihYuDfgbPtTPQIX5QEDtAa5OjIs+z4+sPCQfni5
         8kbyJzi+zeRIIpcwTB9MszVsSaD61efB+DNG1wJ5Tf1EJJGBHvyXyKcLccoaYfpks03P
         856oS/yYaNhEmTtwfDDJtyLeubiUWSJndZEEaIUNwSN97ljOjL330ne1s+CafSb4IkpC
         GKQ01wRVDLH0BunZhBC0T9huJPnj9ZDoSLNkJnK85wHA1bigRpZTslobEiaL6w9Y0M2G
         ktxhr89mFgvs18U08FFuKdB+V+TR2j0In4yMyrWQuKGIc3jNrBk7ntUv+k4kJWG2EakH
         DCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787149932; x=1787754732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YFX/t4P2LSAhuskixBzY696FzFpYptXep8gVtvQJXY8=;
        b=iD7ht64ULFd0wcBECIG36KMVpZ+MhAZLO9/bsKC6+k+lN0/2vMGElLNY/4OML6Ymdz
         w1RyFeVO+mABLMf+5QFikI7683P65BLGIIktfmB/6LN3raMrUOpMiNV39ZSYVTZLyDE+
         vAfOhOdwK/haOkhyjOsUSHbeMuLwny30cA8CI4MRnPB2X079QFuCwSe2z18Xu3YdUSpv
         0JB3eaggAPsw+6Vu2JEZS6Mhy1xdYIAZ3srbGE5BEn2oKiwULnHWFi+RLi4EtByJ0ZR1
         refOQzdg19oZqO0hUDW41LAF+qlfsbCyQNx1qedJ0QAJt/6qlc6HYOU8cUtukfVBOXjL
         nCqg==
X-Gm-Message-State: AOJu0Yz7rTWrNl5Ad0D9dc0+od78G5oC67M9BJd6ipg2skF0oat1wB6i
	XAd+zroRuRiLkLN6oNXp9aS9LlJFNlKllU3/M1dlcfCZWkMIywwhSVgJSL2GnS5Ls9A=
X-Gm-Gg: AR+sD112gBnFpIf/3bNXFiGpBrmxdcxyZ+JydI1SMW+4STctkTsWMAirt2UVfJzqALf
	ApLlCmTR/wX3Iaw/cuaI4RfYWz3UDNwaWWRtS4TbtrGRSSuKWABs8jML44q8BeYanKrF98j0Xn6
	KX6XxuUCiu2XVOvfMBAGjbKx4bOoDdOqmSE/JuFw8Jpzfp7cp8Cds3m9s/SEP792bTsp1n+Udck
	Os+CxpDnE6CoIEZInHNV8t2mMUPIDC/QEPZ/XmAaEHeuwk5CjEfYx5DaG7ddQ5P0I3M8pAiZWmH
	hDFJCNbdtmusetCyDGQBFJXLoVubVYs+iytIuw8iUfzixyYw679L5rLUl18KVM2dGI3End6Ohvd
	w6mZ5IGG9gWWCirwMU2kWMoEbapiPvHYoLuAQuJWOpjqe83V4icP7OXa5cKwbZO3YbIrBtuEtBR
	JJKjEOhBO8rBEUMJ5fg0XP9aHp+5zgFf5FrWxsmABzZkyE6B8dINC7GYrd3/AnHwk4gZq7bFLkn
	Lgop+ab
X-Received: by 2002:a05:6a20:430c:b0:3c4:3112:33 with SMTP id adf61e73a8af0-3cd0107606amr9576018637.6.1787149932182;
        Wed, 19 Aug 2026 07:32:12 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15567537esm682505a12.19.2026.08.19.07.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:32:11 -0700 (PDT)
Message-ID: <b7b4f781-9bea-4658-8eca-d7fc4cb5569f@gmail.com>
Date: Wed, 19 Aug 2026 22:32:03 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 27/32] ext4: clear DISKSIZE_GROW_PENDING on
 truncate or error
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814093331.1703882-28-yi.zhang@huaweicloud.com>
 <20260814103129.98BD71F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814103129.98BD71F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2026 6:31 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The EXT4_STATE_DISKSIZE_GROW_PENDING inode state bit is never set anywhere in the codebase. As a result, the entire deferred disksize update mechanism introduced in this patch series is non-functional.
> - [Medium] The DISKSIZE_GROW_PENDING state is not cleared for linked inodes (i_nlink > 0) during eviction, leading to a WARN_ON_ONCE in ext4_destroy_inode() on forced shutdown.
> --
> 
> --- Patch [27]: [PATCH -next v5 27/32] ext4: clear DISKSIZE_GROW_PENDING on truncate or error ---
> commit a9d36fc1a5b406105120b9e8fd8d91b4a9fe12f0
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: clear DISKSIZE_GROW_PENDING on truncate or error
> 
> The disksize-grow-pending state is set when a zeroed EOF block is queued
> for writeback and cleared by the ioend completion path once writeback
> finishes. This patch clears the disksize-grow-pending state on discard,
> inode eviction, filesystem emergency state, or truncate to avoid blocking
> writebacks and preventing warnings in ext4_destroy_inode().
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index 056937e278594..a1dfb70127ca8 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
>> @@ -273,6 +273,8 @@ void ext4_evict_inode(struct inode *inode)
>>   
>>   	if (ext4_should_order_data(inode))
>>   		ext4_begin_ordered_truncate(inode, 0);
>> +	if (ext4_inode_buffered_iomap(inode))
>> +		ext4_iomap_clear_disksize_pending(inode);
> 
> [Severity: Medium]
> If a filesystem is forcibly shut down (e.g., via EXT4_IOC_SHUTDOWN without
> logging an error that sets EXT4_ERROR_FS) and then unmounted, dirty linked
> inodes will be evicted.
> 
> Looking earlier in ext4_evict_inode(), if inode->i_nlink is > 0, the code
> jumps to the no_delete label, completely bypassing this cleanup:
> 
> 	if (inode->i_nlink) {
> 		...
> 		goto no_delete;
> 	}
> 
> Will this cause the newly added WARN_ON_ONCE in ext4_destroy_inode() to
> trigger for linked inodes since they bypass this state clearing?
> 

Yes, this is right. A linked inode evicted after a forced shutdown
bypasses it and would hit the WARN_ON_ONCE in ext4_destroy_inode(). So
I'd tightened the WARN_ON_ONCE guard in ext4_destroy_inode() to skip the
check when the filesystem is in an error or emergency state, since the
pending block may not have been written back in those cases. Besides,
drop the emergency-state cleanup added to ext4_iomap_writepages()
because it becomes unnecessary.

Thanks,
Yi.


>>   	truncate_inode_pages_final(&inode->i_data);
>>   
>>   	/*
> 
> [ ... ]
> 
>> @@ -6741,7 +6759,18 @@ static int ext4_truncate_down(struct inode *inode, loff_t oldsize,
>>   	start_lblk = newsize > 0 ? (newsize - 1) >> inode->i_blkbits : 0;
>>   	ext4_fc_track_range(handle, inode, start_lblk, EXT_MAX_BLOCKS - 1);
>>   
>> -	ext4_set_inode_size(inode, newsize);
>> +	down_write(&EXT4_I(inode)->i_data_sem);
>> +	/*
>> +	 * Truncate the zeroed EOF block invalidates the pending disksize
>> +	 * update, so clear the disksize-grow-pending state.
>> +	 */
>> +	if (ext4_test_inode_state(inode, EXT4_STATE_DISKSIZE_GROW_PENDING) &&
>> +	    (newsize <= EXT4_I(inode)->i_disksize))
>> +		ext4_iomap_clear_disksize_pending(inode);
> 
> [Severity: High]
> Is the EXT4_STATE_DISKSIZE_GROW_PENDING bit ever set anywhere in the
> codebase?
> 
> A search of the tree indicates the literal EXT4_STATE_DISKSIZE_GROW_PENDING
> is only ever read or cleared, never set via ext4_set_inode_state() or
> similar.
> 
> There is a TODO comment in ext4_block_zero_eof() indicating that this state
> should be set:
> 
> 	/*
> 	 * TODO: In the iomap path, handle this by tracking the ordered
> 	 * range and updating i_disksize to i_size after the zeroed data
> 	 * has been written back.
> 	 */
> 
> If the bit is never actually set, won't this entire deferred disksize update
> mechanism be non-functional, leaving the filesystem vulnerable to the stale
> data exposure this patchset was intended to fix?
> 
>> +
>> +	i_size_write(inode, newsize);
>> +	__ext4_set_i_disksize(inode, newsize);
>> +	up_write(&EXT4_I(inode)->i_data_sem);
>>   
>>   	ret = ext4_mark_inode_dirty(handle, inode);
>>   	ext4_journal_stop(handle);
> 

