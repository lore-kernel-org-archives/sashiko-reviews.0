Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22F2FFF8B
	for <sashiko-reviews@lists.linux.dev>; Sat, 22 Aug 2026 08:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787388851; cv=none; b=gHSiEAK1sNelc86Ubf4zvsUgbuYhgcgYc6YGzjydrDCBohCMpnh5ygUzTTFSoGWvR9ijPzWv0ZH77qWRXyb27xdbOR8soXz7gN435QuK/GAEaOXz86daFweMlbV1IduRSdHsKh4M2YE42GE3ned8RKV73IMW6P9lV26KJqkjLCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787388851; c=relaxed/simple;
	bh=rT7FSnMabJ8/iDVDkrJuRwIsJf0ezoAjXeYq5Qis9o8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJugu8vFd/8CqlM/t6/j2G/0h6Y/B+yU/cYUcEXsasGjk2vLR0d3+1DuwYrw5pH7yTMxja+yYKFYvp0ygVbSbhoERXYTozrI0bzwzv600I6kJ4QlFqZVxRpWg4pdZJW8ScU9GzBisvQbxMiAlAh9eo6yyseq7AGjadguhMTVJRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QeDSISRE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeDSISRE"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf50c6f235so21549355ad.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 22 Aug 2026 01:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787388848; x=1787993648; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuNPqLUUI1kgAwg6CqNmiO1Epc9l/1dsGmKvasDbRNU=;
        b=QeDSISREexWtDbYzkBSPKjLb5nGflSwAqbPIGGsBmwODpGBVpDWr90ooi/6ktUbXzl
         3wXKdd4ltfogdJnbrLgsfxBhHRgfs3SOHGJ3C1r/jC4d7ootG3g145jPcC5B5dIrr5XM
         00xSy5az1orhskqdZSEqBarv2gMzhiD43mUChsT66j6igV6xk5KLjsj4H3bjBTmrpkFk
         ABQXakJ/zat57guIfC4AtyrL008MlV/LDmaVi+Ga1QaRG7by6TFJ1hYwuWfoBGjAwrhn
         VSryooz2+yK/dxzk+zZXShA19yFu7x1GLV+/eeenfqAGR/oS7+wL4jD+X8wiaLcnyT7+
         oaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787388848; x=1787993648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LuNPqLUUI1kgAwg6CqNmiO1Epc9l/1dsGmKvasDbRNU=;
        b=rQjSsaqRa5WnzrWOjgzmwOCt3RuQQxaeFJz8szlFyM1ZZtSceKsU2MLVrtFY25IYnV
         01GHdnXDOs3R0y6eQ2KIixx/CgKiBMLgSog4KG58DrNeFVOOF8S+dkq2/Xt7EwC39MZ1
         aBEb6kEP8E4GykqfZmgLpL0bYawnuRK4OeguxCrVDAB2dDqziCrNyGAYOoFu8048rv8Q
         oSX/vVTIRaMPchpye3B3De65uSYh38nHNQLltsHn1fkXk6J5AM8GRQilfIz36RdOIDB6
         TaIToovvx/hMuckodAu2wH8lNM8fgVDJtarJkNhPo3UBz1McRAvzsv93XLFYbwk+kY+f
         r5jw==
X-Gm-Message-State: AFuF++nFfznmh9bMBMgCaDkdaJqazV7HhgiFSsBa0D2MZ/ZwXC++mmCv
	C6NXp5tti+Kbw2L0yDTCF0UMUxw7B77kofA9mmAqIW5ynEs4gj88ZnE9OIs/wcvEGfA=
X-Gm-Gg: AR+sD120hkoGRm9iNVwnOLMgNkTv1XdudM/ZO2GYyMKH5lLveXG6PSQnu1OjI5VOVKi
	Hw5OfPYKhScxr3nZilVHwOo0S/XmUrdhT6wy4uruu2mTnuywcLZeuq/vcq55Tbne0qIOyopwLIO
	7byMESSsayCEpFtzB7d7Lts/rn3nNd/r5GGBGfxG+mHAaQjqRxugijyjJNgVh93cFw5yuOtk57w
	pqvTHxGTK1/Rt39WC5TZEA0l7vBh1xTAcevflLVcZj5uqE+x9m5yUAc9h4tQy8UgNZDy3XDhJ7W
	nwIx46jw8CLqdV9LhX9gympGgenSxyknwUbqaJYj1U54K5YPKJy+KtrrmZLZ9ocBaHMmX7DEjXy
	oWqWFdRvLYzMi0Yc0kOTx/kcqsP+zar71Zf5iC+wvAEcg5K4e9WDxq8dTmHuVMZosJoclPc20Xq
	26RqW1KZmpg9J4nOsijqzv0AUzKSL3BpWUog50Bs1x1RltAQmv/YBXlGLvZFbzNl3+xHttOACbV
	RJ652Wn
X-Received: by 2002:a17:903:2c0c:b0:2cf:8131:75f4 with SMTP id d9443c01a7336-2d64b036898mr236644005ad.11.1787388848058;
        Sat, 22 Aug 2026 01:54:08 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676792e1fsm2950245ad.28.2026.08.22.01.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 01:54:07 -0700 (PDT)
Message-ID: <4de4de4c-73bf-485d-95e3-494c15b35e92@gmail.com>
Date: Sat, 22 Aug 2026 16:54:01 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 31/32] ext4: partially enable iomap for the
 buffered I/O path of regular files
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814094616.1710143-1-yi.zhang@huaweicloud.com>
 <20260814103904.437FD1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814103904.437FD1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2026 6:39 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] Encrypted and verity inodes on corrupted or downgraded filesystems bypass fscrypt and fsverity, leading to plaintext data writes and unverified reads.
> - [Medium] Race condition in background writeback causing spurious WARN_ON_ONCE in ext4_iomap_writepages().
> --
> 
> --- Patch [31]: [PATCH -next v5 31/32] ext4: partially enable iomap for the buffered I/O path of regular files ---
> commit 385d0947c4a6c1e02718f1b42a8ef1dc35bdbf03
> Author: Zhang Yi <yi.zhang@huawei.com>
> Subject: ext4: partially enable iomap for the buffered I/O path of regular files
> 
> This commit introduces ext4_enable_buffered_iomap() to determine whether a
> regular file inode should use the iomap buffered I/O path. Inodes silently
> fall back to the traditional buffer_head path if unsupported features like
> encryption, verity, inline data, or data=journal mode are met.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index ee15366422a1e..c9ee78fba4d0c 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
> 
> [ ... ]
> 
>> @@ -4467,6 +4479,10 @@ static int ext4_iomap_writepages(struct address_space *mapping,
>>   		.ops = &ext4_writeback_ops,
>>   	};
>>   
>> +	/* inode using the buffer_head buffered I/O path should not go here. */
>> +	if (WARN_ON_ONCE(!ext4_inode_buffered_iomap(inode)))
>> +		return -EINVAL;
>> +
> 
> [Severity: Medium]
> Can this WARN_ON_ONCE trigger spuriously due to a race with
> ext4_change_inode_journal_flag()?
> 
> If background writeback via do_writepages() resolves
> mapping->a_ops->writepages to ext4_iomap_writepages locklessly, the thread
> might be preempted right before this check.
> 
> Meanwhile, another thread running ext4_change_inode_journal_flag() could
> flush writeback, acquire s_writepages_rwsem exclusively, and clear the
> EXT4_STATE_BUFFERED_IOMAP flag.
> 
> When the writeback thread resumes, it would evaluate this condition before
> acquiring the s_writepages_rwsem read lock, which would trip the warning.
> Should this check be moved after acquiring the read lock?
> 

This is right, and the issue is worse than a spurious WARN, proceeding
with mismatched a_ops in that window can corrupt buffer_head-backed
folios. Sequence:

writeback         change journal flag      new write
---------         -------------------      ---------
do_writepages()
   a_ops->writepages resolved
   = ext4_iomap_writepages
   WARN check passes
   (BUFFERED_IOMAP still set)
   <preempted>
                   filemap_invalidate_lock()
                   filemap_write_and_wait()
                   truncate_pagecache(inode, 0)
                   ext4_writepages_down_write()
                   ext4_disable_buffered_iomap()
                     -> clear BUFFERED_IOMAP
                   ext4_set_aops()
                     -> a_ops = ext4_journalled_aops
                   release write lock + invalidate
                                            write() syscall
                                            ext4_journalled_aops
                                            create_empty_buffers()
                                            folio->private = buffer_head
resumed
ext4_writepages_down_read()
iomap_writepages()
   ifs_alloc(folio) sees folio->private != NULL
   -> returns it as iomap_folio_state
   -> actually a buffer_head pointer
   ifs->state, ifs->state_lock accessed
   -> memory/data corruption

So we should move the BUFFERED_IOMAP flag check under the
s_writepages_rwsem in ext4_iomap_writepages() and drop both
WARN_ON_ONCE() during writeback.

>>   	ret = ext4_emergency_state(sb);
>>   	if (unlikely(ret)) {
> 
> [ ... ]
> 
>> @@ -6037,6 +6053,81 @@ static int check_igot_inode(struct inode *inode, ext4_iget_flags flags,
>>   	return -EFSCORRUPTED;
>>   }
>>   
>> +/*
>> + * Determine whether an inode should use the iomap buffered I/O path.
>> + * EXT4_STATE_BUFFERED_IOMAP is generally set at inode initialization
> 
> [ ... ]
> 
>> +void ext4_enable_buffered_iomap(struct inode *inode)
>> +{
>> +	struct super_block *sb = inode->i_sb;
>> +
>> +	if (!S_ISREG(inode->i_mode))
>> +		return;
>> +	if (ext4_test_inode_flag(inode, EXT4_INODE_EA_INODE))
>> +		return;
>> +
>> +	/* Unsupported Features */
>> +	if (ext4_has_feature_inline_data(sb))
>> +		return;
>> +	if (ext4_has_feature_verity(sb))
>> +		return;
>> +	if (ext4_has_feature_encrypt(sb))
>> +		return;
> 
> [Severity: Critical]
> Could checking the superblock features instead of the inode flags here lead
> to a security bypass if the filesystem is manipulated offline?
> 
> If an attacker clears the encryption or verity superblock features offline,
> the kernel still sets S_ENCRYPTED or S_VERITY on individual inodes that have
> the flags set.
> 
> However, these superblock checks would fall through, allowing the encrypted
> or verity inodes to be assigned to the iomap buffered I/O path. Since the
> ext4 iomap path currently lacks fscrypt and fsverity integration, would this
> cause writes to submit plaintext bios and reads to skip cryptographic
> verification?
> 
> Would it be safer to check IS_ENCRYPTED(inode) and
> ext4_test_inode_flag(inode, EXT4_INODE_VERITY) directly?
> 

This is a false positive. I don't think we need to consider
offline filesystem corruption here.

Thanks,
Yi.

>> +	if (test_opt(sb, DATA_FLAGS) == EXT4_MOUNT_JOURNAL_DATA ||
>> +	    ext4_test_inode_flag(inode, EXT4_INODE_JOURNAL_DATA))
>> +		return;
>> +	if (!(ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS)))
>> +		return;
>> +
>> +	ext4_set_inode_state(inode, EXT4_STATE_BUFFERED_IOMAP);
> 

