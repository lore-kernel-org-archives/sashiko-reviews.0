Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9373AB460
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 07:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371442; cv=none; b=QhhPe3f/Aln6BC0YuuhNxMEvXH/vqONWQ4WOL+XxM0g8aNeSYETBFcCcSYtdhD2sPuGGeHxR5U3BS1DvbgbG+HhI8ZFAhN5goBP7p8qshBxhKmT36r/OUiXGVbHNWJZK2f0E7gKSydU1fJC/QPysKZMKYRQMHRbLXGhUHL9CvKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371442; c=relaxed/simple;
	bh=ifQoUXfDhEN9Hbx4OtQtqKuyCIB0Y4QUuEnZdmQXg+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5ET4gESItRTc6243ieNRIlqhid1eT/FPxpcF90IBaMqFbcP5FTB+qoQY7tYQ597aPVT1zVk066FAiwoJZwd/NhsQbz6XgMZ98zgYaHgURnlCmVl4Yz21lvYroFccVNIg0qkpYPNQsW7YFtXilWGlZalXBE25O7BYeElSa+76mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcBX2e2p; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcBX2e2p"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so1158615a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 00:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789371441; x=1789976241; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RmG95Jxcp6oKIbN3bymacdthRMLAC7NiJK7kO0jzFJM=;
        b=jcBX2e2pQjuowrSpdYBUTYnnPku/l/qtIs6VkTr90BZGcAmJhFWhjFkhjhCEsj2bH0
         wV6QgXLgynfgve/AaR5kOvKZWMWEFiwiW2ZTFyrbnU/wDv7Zg6Esa5xRPGCwU5baJZlW
         SqwVTZfAshAVlxBtDlKUSjoW1uT9So1dB5jeJj8Yr881TsQ79EzgjYo9DjhAumOhaq0H
         BzIvIqEB0pa0IbqFB58fPTAgblssw/YWkeA6I/g4hvwJESk4TPb/Anyv8u48EiDHyPnR
         8jiCCbcD8HQ3hIGdMCAUyOTVUdaVxa2r+PS5unRgKGr4ciiyJwODbynKARzvEiTYbnhS
         KeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371441; x=1789976241;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmG95Jxcp6oKIbN3bymacdthRMLAC7NiJK7kO0jzFJM=;
        b=G+mMNk7YYVz0S6T3MBPV0gY9SOaE0Qai0b73uaE3gWL+shKDHlu/8gx8puJ/2WC9f8
         iT+PToFfomnQqPw52QpMpkhyIs1gK+JkA3iekAQ+15y5gBJrFX8X+3SXJbH0V70Jxmzb
         gBq1HK4W5dDZ+a6R3tpSjpB1AbSFCbBax1qeLjWjCSdLrush3QKBJSvRwzx2PH6dw4bS
         lasrKPinX18YtAw25MijUsvCu3Ng0nFUtWdaQkMxaOx1Yc7uHAr9U4nBhJo4SIuvjuSP
         hpTLnSQ5Flvx+VTF2NOMmueic9eghVBiChatorgTrXvMwUakcShgQIYNWPJb/FFZ7QVI
         k8MQ==
X-Gm-Message-State: AFuF++mIa8N9RYK93MQbhqoP6l1syRrrT5/8Hq4L+MvaMyrJ47Zq5mp9
	DcJ1sHVqw2KDQAnyJn4fI4ZstyrPhFW19stumBr2PpT/9ndZH/dmcUTVVCqkhdHNs9U=
X-Gm-Gg: AYBFou2azpMsvggPWKXgrapC9tszq1xY85Wm/RDnEbRmpe1HJbvQhhlZpUYv6Q5in32
	A97vBoloxVV6EF5v5J6hFLUv41Kh2iWHEV5JqkPnm98WtqVcKDGJHfcv0jsU6NaMwHcBB1W4+W7
	gwhx8JKIsxKxBwP7RLHE4PP5jpPmpUkw1Lppi/fJ5cA6Z3vjD/O4bgnsHHrE+UvG/vQKMRO2o/8
	aXs+yh0C9JwQIT6AaKSczWsWYvnw3+Ht5R8Xkm/+2w2SMDexHcNXMzGUDdepB+Zucnd4CCGj1OQ
	pqmp4IYZyjFla0QN1qJvPNbh3nQl9J+yyvrbSwObnFmXeK73eOfjQQxa7rcP9mrEeCQWIwLbO2y
	7wJI1jFBoiiq0tFNUbHKBfbINRs1YNBPmJ1k7C6j487MIn8TEK7omy47OUuBEbFqF7ZcIt7F1ob
	jgjE+M1W6Y5LDL4ucbYp7UwaBSpxDSUo+HzkwzGE6vamvvK7XYC9+CqzSHjYc5RdK6aMqSNL/0b
	i3uSw1ApGjQ9fGeFN5g
X-Received: by 2002:a05:6a21:3384:b0:3d8:1f68:59ac with SMTP id adf61e73a8af0-3db406d01fcmr3254399637.23.1789371440614;
        Mon, 14 Sep 2026 00:37:20 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c615a65bsm4620132a12.3.2026.09.14.00.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 00:37:20 -0700 (PDT)
Message-ID: <9f221a5b-281c-45d4-8cc7-e63b66a2c6cf@gmail.com>
Date: Mon, 14 Sep 2026 15:37:13 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 26/31] ext4: clear DISKSIZE_GROW_PENDING on truncate or
 error
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu
References: <20260903123543.2302999-1-yi.zhang@huaweicloud.com>
 <20260903123543.2302999-27-yi.zhang@huaweicloud.com>
 <20260903134656.C9FDE1F00ACA@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260903134656.C9FDE1F00ACA@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/2026 9:46 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Unconditional advancement of i_disksize in ext4_truncate_down exposes unwritten data and corrupts the disksize pending state.
> - [Medium] EXT4_STATE_DISKSIZE_GROW_PENDING is not cleared when evicting an inode with i_nlink > 0 or a bad inode, leading to a spurious WARN_ON_ONCE in ext4_destroy_inode().
> --
> 
> commit ce48fe2572983c4095fed45d85327a228bcb48f0
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: clear DISKSIZE_GROW_PENDING on truncate or error
> 
> This commit clears the DISKSIZE_GROW_PENDING state on error paths, such
> as folio discard and unlinked inode eviction, as well as during truncation.
> It aims to prevent writeback from blocking indefinitely when a zeroed EOF
> block is discarded, and adds a warning if an inode is destroyed with the
> bit still set.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index 173ac69e9b953..f38437fa91064 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
> 
> [ ... ]
> 
>> @@ -273,6 +273,8 @@ void ext4_evict_inode(struct inode *inode)
>>   
>>   	if (ext4_should_order_data(inode))
>>   		ext4_begin_ordered_truncate(inode, 0);
>> +	if (ext4_inode_buffered_iomap(inode))
>> +		ext4_iomap_clear_disksize_pending(inode);
>>   	truncate_inode_pages_final(&inode->i_data);
>>   
> 
> [Severity: Medium]
> Does this miss clearing the pending bit for linked inodes (i_nlink > 0)
> or bad inodes?
> 
> If writeback fails for an inode with a pending zeroed EOF block, and the
> filesystem is unmounted, evict_inodes() unconditionally evicts all inodes.
> Earlier in ext4_evict_inode(), the code truncates pages for linked inodes
> and then jumps to the no_delete label:
> 
> 	if (inode->i_nlink) {
> 		...
> 		truncate_inode_pages_final(&inode->i_data);
> 		...
> 		goto no_delete;
> 	}
> 
> This jump bypasses the new ext4_iomap_clear_disksize_pending() cleanup here.
> 
> Could this result in the pending bit remaining set and triggering the new
> WARN_ON_ONCE in ext4_destroy_inode() when the inode is finally destroyed?
> 

This is false positive, the pending bit is always cleared before an
inode can be destroyed:

- ext4_iomap_end_bio() clears it when the pending I/O completes,
   regardless of whether that I/O succeeded, and a failure before
   submission goes through ext4_iomap_discard_folio(), which clears it
   as well.
- An inode with i_nlink > 0 is only evicted after its dirty pages have
   been written out.
- The only case where the pending block is not written back is an I/O
   error or a forced shutdown, and both set EXT4_ERROR_FS / the
   emergency state, which the WARN_ON_ONCE() already skips.

A bad inode can never have the bit set since the bit is set only from
ext4_block_zero_eof() on the buffered I/O path, while make_bad_inode()
is only reached from __ext4_iget() and from the mount-time journal
inode load, both before the inode can be used for any I/O.

> [ ... ]
> 
>> @@ -6765,7 +6776,18 @@ static int ext4_truncate_down(struct inode *inode, loff_t oldsize,
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
>> +
>> +	i_size_write(inode, newsize);
>> +	__ext4_set_i_disksize(inode, newsize);
>> +	up_write(&EXT4_I(inode)->i_data_sem);
>>   
>>   	ret = ext4_mark_inode_dirty(handle, inode);
>>   	ext4_journal_stop(handle);
> 
> [Severity: High]
> Could unconditionally advancing i_disksize here expose unwritten data or leak
> the pending bit?
> 
> If ftruncate() is called with a newsize that is smaller than i_size but
> strictly greater than i_disksize, the condition
> (newsize <= EXT4_I(inode)->i_disksize) evaluates to false. The pending bit is
> not cleared.
> 
> However, __ext4_set_i_disksize(inode, newsize) then unconditionally advances
> i_disksize past the safely written data.
> 
> If a crash occurs before the dirty pages up to newsize are written back, will
> this expose stale or uninitialized data on disk since data ordering is not
> guaranteed for the iomap path?
> 
> Additionally, if newsize is block-aligned, would the writeback thread later
> hitting ext4_iomap_get_disksize_pending_range() encounter a WARN_ON_ONCE
> because i_disksize was updated to a block-aligned value, preventing the ioend
> from ever clearing the pending bit?
> 

This is also false positive, __ext4_set_i_disksize() does not advance
i_disksize while the GROW_PENDING bit is set. So with
newsize > i_disksize, i_disksize is left untouched and stays unaligned,
and the WARN_ON_ONCE() in ext4_iomap_get_disksize_pending_range()
cannot trigger.

Keeping the bit in that case is intentional. The new EOF is still inside
the pending zeroed block, so the zeroed data must reach the disk before
i_disksize may be advanced past it.

Thanks,
Yi.

