Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C8C3E0243
	for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 06:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786777062; cv=none; b=NXhTskB5VDAR1AK+4HeHtgcacY1yIekKr3qeMR+yWlHSL4713R+UVagmNlTEJMr0YElRgbr3OV0fGhHzgoCqoucbUyXKRwIErHH02WZZ8gMtGO4Y9sOY8Dl0FLs0Y8iWnKP3qb5HPwbiw64bUhwInE7Q1dJ7BclyQZTISLAQkes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786777062; c=relaxed/simple;
	bh=FGfhaeq2xKFMjBFTHBJ/wj72N0xgrREq6zmCXL6Pm8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOhw1Bak5UJltsEK0dV83UYZDOfxgxiAJyz36uChaL35p2sqlZHQEk6pB7J7a7E8FAaMFX5nI5jE8BkVDmT9ldLeOFAN4ZAuLAk+GrcUf8V6L+O14johZpepjd6LZQuBPG+HIkKDs8fA2qv9y9cIMnpZOPvC7DqsxOXD4cfYT2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBgDduDz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBgDduDz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d0407aedd6so22175235ad.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 23:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786777058; x=1787381858; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+O+EXhLcJWT45f42scuWhe5FquZM52S8O6m5v2Jyxk=;
        b=sBgDduDz+695xOE1pSuNiC44XOlP1GhM2U1ZaQg8kHqnyScClXCd3HKaUlyBy/X242
         0MPMfIfziGNVf2ZDRmCPzDTSUSTApU9R3Du6zHlR/115YUGkjSZCYvktN6NeaAXanz96
         LlQv4Hlh+iIWuvJJ4HNViGz9nsOI5bvND33UxBSxhlbY0eaHzOssW/UcZ8eEQp4N8Add
         SmeKn2RWfasZaMOS4ijuqGYlQB5VYS2ZxjAQ0ieLmSDubOYB1UOC0mr3lk61zqVaU3Pu
         TJa4wxk9GIn/rfujtX2Jba5zKvpQGmcWgDeinm36uR4H5PC0VckmV21Dt8fhYCCLm6Kn
         +1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786777058; x=1787381858;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+O+EXhLcJWT45f42scuWhe5FquZM52S8O6m5v2Jyxk=;
        b=N/3e4tsjvFfDkxvzGNSS3YOjDebWq0xA5zD5qayTVr0d9kaob2Pyik+B6bFwfEzqeU
         tZQiN1nL7QO5rFPhwoPLSsdphXRU84Jt+rtrVFffPEOqrz3xTipuhieO3kIOmT0Fi+Ix
         LNys2WgYiR+tqXp3FEIkClLd7gXYYaoftt1PlosapHZ5ElMF3ywZNrsyhwM8Ijluk7Vv
         dHd7cfjcrVLdpqJ7kM11gNdv5gnOQtW/gRJditv9RBrnW2doFj8Q8t76+nrjGEIEABmO
         MjCFIiB3eJ0tnK7majwuZ51IkZSq5+3jCWVQzncc9Ag5ivutR3z7eQptLA8czgvphZ4o
         Qaeg==
X-Gm-Message-State: AOJu0YxOPMjPkuRVb6vcg0g+QlZmNia5L9jB3hYvbn9Tp+1TrFwITDlH
	wCZqnvEQNKErNKvQ4by+NktWshSA2hTzNVOZsztlZlpOoHZQhdVETd1RKKw3SJyMXY8=
X-Gm-Gg: AR+sD1069gjTojs4daa6IatKNBY6r8i7Hdw2fyDuZmMb5J5AydZOuR1M8+iP0Jy/jaI
	1FzqXXMwNhUDQNFg3hJRIMViKd7xU31QMcflBcfqEuGDTX3z0oz7uAJF5Xq0mZmACdDvejSSbnO
	vhny+17mGWtmlsF3tYeiIGgYJlLjAJpOf7T0wv2tg3CpOKyCCRX2pE3Q3/bycC6zUqWINMkNXGc
	2pTblMd6tR5sNEDGgGUCpMKEFPQSQOqBxvxB/99uYckI3F/hY22cn6WFFPW29q5peM8jpDSwuuF
	Quwbvhh1WvzP6K4Gax6MfRdfdR/t5urPSKqxr2/jOkW3RYJQXfOYEafc5dWBI2Jg4q3N7C9c3uM
	gNyJJisG+W2kAmpxF+ZQAP7oSzQ/cHd6LC1RdDaCMNSldbP0ybKUTEVvwKh2eph6xIT7YH0YZZ2
	iZb0Rrp0JUCXVdGzreGfNakcBTsOKz1bKRUwaUi/JhmtDkkWJfKuMsJ7QQhYXOGsuf0c3oNfMwB
	1RWnta7
X-Received: by 2002:a17:902:f610:b0:2d3:2b8a:5007 with SMTP id d9443c01a7336-2d3b0e4378emr139170855ad.15.1786777058358;
        Fri, 14 Aug 2026 23:57:38 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebf17absm17255635ad.80.2026.08.14.23.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 23:57:37 -0700 (PDT)
Message-ID: <6cc8eaee-9855-4e97-8cdc-b30257a79d18@gmail.com>
Date: Sat, 15 Aug 2026 14:57:31 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 04/32] ext4: skip ordered I/O wait when zeroing
 beyond i_disksize block
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: tytso@mit.edu, linux-ext4@vger.kernel.org
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814093331.1703882-5-yi.zhang@huaweicloud.com>
 <20260814101457.008C01F000E9@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814101457.008C01F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/14/2026 6:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Torn read of the 64-bit `i_disksize` on 32-bit architectures can cause the kernel to skip ordered I/O, leading to stale data exposure.
> --
> 
> --- Patch [4]: [PATCH -next v5 04/32] ext4: skip ordered I/O wait when zeroing beyond i_disksize block ---
> commit bb84de10d990ded9aab4107d18dd1616342efccd
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: skip ordered I/O wait when zeroing beyond i_disksize block
> 
> This commit optimizes ext4_block_zero_eof() by skipping the ordered I/O
> wait when the zeroed range is entirely beyond the block containing
> i_disksize. Since data beyond i_disksize hasn't been written to disk yet,
> the ordered I/O wait is unnecessary and can be bypassed.
> 
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
> [ ... ]
>> @@ -4241,9 +4241,16 @@ int ext4_block_zero_eof(struct inode *inode, loff_t from, loff_t end)
>>   	 * truncating up or performing an append write, because there might be
>>   	 * exposing stale on-disk data which may caused by concurrent post-EOF
>>   	 * mmap write during folio writeback.
>> +	 *
>> +	 * Ordered I/O is required only when zeroing the tail of a block that
>> +	 * overlaps with i_disksize. If the zeroed range falls outside that
>> +	 * block, the zeroed data lies beyond the existing on-disk data. It
>> +	 * will be written out before i_disksize is later extended past
>> +	 * i_size, so no stale data can be exposed.
>>   	 */
>>   	if (ext4_should_order_data(inode) &&
>> -	    did_zero && zero_written && !IS_DAX(inode)) {
>> +	    did_zero && zero_written && !IS_DAX(inode) &&
>> +	    from < round_up(READ_ONCE(EXT4_I(inode)->i_disksize), blocksize)) {
> 
> [Severity: High]
> Could this READ_ONCE() on the 64-bit i_disksize result in a torn read on
> 32-bit architectures?
> 
> If a background writeback thread concurrently updates i_disksize under
> i_data_sem but without holding i_rwsem, and the file size is extending
> across a 4GB boundary (for example, transitioning from 0x00000000FFFFFFFF
> to 0x0000000100000000), a torn read might fetch 0 if the lower 32 bits are
> zeroed first.
> 
> If 0 is returned here, round_up(0, blocksize) evaluates to 0, which makes
> the condition 'from < 0' false. Would this incorrectly bypass the critical
> ordered I/O guarantee and potentially expose stale data in the event of a
> crash?

I agree this concern is valid. The torn 64-bit read on 32-bit SMP is
mechanically possible, and the proposed condition could skip the
ordered I/O path when it shouldn't.

However, this pattern is not introduced by this commit. The existing
ext4 code already has multiple READ_ONCE(i_disksize) sites without
holding i_data_sem, such as the fast-path check in
mpage_map_and_submit_extent() and the size check in
ext4_dio_write_end_io(). i_disksize has no seqcount, unlike
inode->i_size which has i_size_seqcount.

I'm not sure whether all the unlocked sites are harmless, at least
the mpage_map_and_submit_extent() fast-path check looks a bit
problematic to me. If a torn read returns a value larger than the
writer's actual target (e.g. when another ioend worker is concurrently
advancing i_disksize from 0x00000000FFFFFFFF to 0x0000000100000000 —
high 4 bytes already updated to 0x00000001, low 4 bytes still
0xFFFFFFFF, so the reader observes 0x00000001FFFFFFFF), the fast-path
comparison skips the lock-protected recheck, and the i_disksize update
for this writeback batch is missed.

I think this deserves a separate patch series to properly fix it,
perhaps by introducing an i_size_read()-style helper for i_disksize
(seqcount or similar), and reviewing all access sites. What do people
think?

Thanks,
Yi.

> 
>>   		handle_t *handle;
>>   
>>   		handle = ext4_journal_start(inode, EXT4_HT_MISC, 1);
> 

