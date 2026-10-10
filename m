Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2A2369D72
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 04:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791608368; cv=none; b=aV/ECua4huISHN7ycDoGU+/IfcqAkM6N4rNq4cbWSGrHI5LnZJAmSV1Df5Lllve/JgMF4OCxQJ4DbtFBmtTobhlUIKZ+LBTX98H+XcLIBvhwu01HXKMsS4n9qQY7ljS3BCq5rocvAdc5fT+7dVEo3VmOUKA8KzdUhXq7ZGswa8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791608368; c=relaxed/simple;
	bh=2rdp7m3bJ4T9PCD3Munhreg/l5VHoEdxQ/PPaJ4Fz3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ff9yYZcid77+svv6AcDk6ry0PSNpFklmi71msxugB9dmrdzAk6QrTl3DZhBotkBVImdEmWSEisAXWWrGd+xj73SwEoorMm83GwJGZjpdqrOyJUA5GbEmnaCmeM1Ph1jGAtHknudJx6IV4VE1pVUlqg+T2VIk9GvgogQEuWFR2p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAlaHh6A; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAlaHh6A"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2dd76b1361dso1892975ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 21:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791608367; x=1792213167; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vm+JPX0zlMDidpG2yBei0vOBYyCXOCTpBD+z4xlRLJk=;
        b=qAlaHh6AJvR1SYeNmWrk3ev2u2QegGQYlcFyqXxLuXlcNhgXaY4Kek6sKHRxSG0edU
         rvX2aNnfwHEGFHOOWfgeN2+JbKIZ/EznoA2gwwoElEvHk2hZGhAQCXcmNTZFa4Tt+zTQ
         2SkmClKA3Pak14IJcpeZTmI2s58FEnQBY7geLAo9mu8YvvY8drSxuKfFvlo2Q4PxhYbR
         76bSBTgawJC0U5sgNImEqAXciINAxz5PjGDnNWlvawA8g4g8T5oSmPZY+mUYm27umaVI
         36AjOqGxlVpj7j50sOhBthOD6FvBuciW76KK5wy/frRkHYgr7QsN5bYsU10iEloQJTDP
         wMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791608367; x=1792213167;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vm+JPX0zlMDidpG2yBei0vOBYyCXOCTpBD+z4xlRLJk=;
        b=rwCUX5kMLg5+LMhaKzl72l9//WWpbIl7FUDUZjYE/QRqADCluYn1ix2YDN11s1yChG
         sYKgejwZbqGM+W+VDsjek/jQE89C0ROzHiynztxz049rt4PimhJGezILjRyecn/mDkGd
         ++xY2jfM4EV1VsJZcjSYqdJQaFD2ts5BGe/UnQfsEDXD8Pob8sqJDuWd6TTGKKM9jGWR
         QzitALKRjb0fNSJsB0UETZrEMNrvIgkwo7GshHYxO3z/fbJ3dWZqlwV1Sen+Ow/D5Qyw
         OQH6XpdIFlUUfh3rbSleLYXOdNFC4h/KCog/RB1025m3V7u5iPwkfZhpJqtq5iJRhV/H
         SPFw==
X-Gm-Message-State: AFq9FYLKe4/SCu68JAe2ZtTRcbqAP70IuWx7nXg+Dzba3Pvxm1MPTPCO
	eADZHbo+qysG3/NaQknvNL2dL3ti9U1UyTJ6u5CKISUZAPZ20YtbjNL7SAy5NA==
X-Gm-Gg: AYBFou2oHT/DxA9BrTfZVvmE+9yVPEJOrXDOcRZlRYk5tnlRC58PqMFLJGQxNY0UzIp
	QMtsn4qCGCD6TssGggtCr53VLLPJZuTjZoMuiLIyI0cVy4psM5GNOwTy3QvNGwJdWpd1N7OSGcv
	8AYrqjz5Lu7wmmx/b92BK9OON/xGNNcjH+WFf5w1YpemIO3uZDFgb+Ily2F4VvM+qhpx6VKEFaM
	aX2niK9BQ7YEx9TjsR4g6t41URoEjZUKVMYF4NCbEE25WYvtVCm3oNMui19vBgtUkEkPgVXeE5z
	TNDdjg+eFniB1JqvXXPuDO/E5qakrZEPZSbMIb4Ph3tY2Va+/4zk+OWlD6pz9nWwZ8k/mKJv7Zw
	fEqOuQCq8xs+PS1VBPxv+G0ldO1Z/NuHYlrlFpJ9HVAhpRZ3elMkurGl1QAi+WW3h5Ewy1Ls0qX
	j5yOHuFggDI584vu0hhvkWthlmWsVG8BqJLApV9QM4MkUqmQGoOrYTg5q2t4X5PgMKtY93sJrgx
	H64Y+LG9qG96BRIMJw=
X-Received: by 2002:a17:90b:2784:b0:3a8:1cc5:c1be with SMTP id 98e67ed59e1d1-3ab3a7a0ef0mr3424805a91.28.1791608366640;
        Fri, 09 Oct 2026 21:59:26 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab8a393666sm1203907a91.15.2026.10.09.21.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 21:59:26 -0700 (PDT)
Message-ID: <b1a31381-e71f-4826-9857-a369117c8094@gmail.com>
Date: Sat, 10 Oct 2026 12:59:20 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 26/31] ext4: clear DISKSIZE_GROW_PENDING on truncate or
 error
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: tytso@mit.edu, linux-ext4@vger.kernel.org
References: <20261009103033.2920530-1-yi.zhang@huaweicloud.com>
 <20261009103033.2920530-27-yi.zhang@huaweicloud.com>
 <sashiko-outbox-165341@kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <sashiko-outbox-165341@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/2026 7:16 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] fs: missing DISKSIZE_GROW_PENDING clear during nlink > 0 eviction
> --
> 
> commit b90813716147a7864ab2f3a3c46c2814d0084c2b
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: clear DISKSIZE_GROW_PENDING on truncate or error
> 
> This commit clears the disksize-grow-pending state on various paths where a
> zeroed EOF block is discarded before writeback completes. It also adds a
> warning in destroy_inode to catch any inodes that missed clearing the state.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
> [ ... ]
>> @@ -266,6 +266,8 @@ void ext4_evict_inode(struct inode *inode)
>>   
>>   	if (ext4_should_order_data(inode))
>>   		ext4_begin_ordered_truncate(inode, 0);
>> +	if (ext4_inode_buffered_iomap(inode))
>> +		ext4_iomap_clear_disksize_pending(inode);
>>   	truncate_inode_pages_final(&inode->i_data);
> 
> [Severity: Medium]
> When an inode with nlink > 0 is evicted and still has dirty pages (such as
> during a forced unmount or after a failed sync_filesystem), ext4_evict_inode()
> logs a data loss warning and forcefully truncates the page cache using
> truncate_inode_pages_final() before jumping to the no_delete label.
> 
> Because the pages are discarded immediately without initiating writeback, the
> writeback error path is never invoked, meaning the
> EXT4_STATE_DISKSIZE_GROW_PENDING bit is never cleared.
> 
> Since the added state clearing logic is placed after the nlink > 0 block, does
> this bypass clearing the bit for those inodes entirely?

Under normal circumstances, it is already an unexpected state for an
inode with nlink > 0 to still have dirty folios left when it is evicted,
and in that case the "data will be lost" warning is already triggered,
so I think the later warning about the bit not being cleared is also
expected behavior. That said, if we feel the WARN_ON_ONCE() in
ext4_destroy_inode() is too heavy, it could indeed be considered for
removal, but for now I'd suggest keeping things as it is.

Thanks,
Yi.

> 
> [ ... ]
>> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
>> --- a/fs/ext4/super.c
>> +++ b/fs/ext4/super.c
>> @@ -1497,6 +1497,14 @@ static void ext4_destroy_inode(struct inode *inode)
>>   			 "Inode %llu (%p): i_reserved_data_blocks (%u) not cleared!",
>>   			 inode->i_ino, EXT4_I(inode),
>>   			 EXT4_I(inode)->i_reserved_data_blocks);
>> +
>> +	if (!(EXT4_SB(inode->i_sb)->s_mount_state & EXT4_ERROR_FS) &&
>> +	    !ext4_emergency_state(inode->i_sb) &&
>> +	    WARN_ON_ONCE(ext4_test_inode_state(inode,
>> +				EXT4_STATE_DISKSIZE_GROW_PENDING)))
> 
> [Severity: Medium]
> Can this assertion be reliably triggered when unmounting a filesystem while
> writeback is blocked or fails, since the pending bit is not cleared during
> nlink > 0 eviction? This might potentially crash systems with panic_on_warn
> enabled.
> 
>> +		ext4_msg(inode->i_sb, KERN_ERR,
>> +			 "Inode %llu (%p): EXT4_STATE_DISKSIZE_GROW_PENDING not cleared!",
>> +			 inode->i_ino, EXT4_I(inode));
>>   }
>>   
>>   static void ext4_shutdown(struct super_block *sb)
> 

