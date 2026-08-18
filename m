Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4FB358368
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 12:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054913; cv=none; b=C66X7wQdDqEJI0NrCYn11g7ItQ6GNHopFac71pJRmqoJNg7dDUZb+9j4bRlfKMn18HsPS1URK6fhSBLU6/dY8+x1qew1WjOfEM/AtKRMFwb1VBSWi/uPlevE9ZVjVwUU+DG//QkF+1x4EytyLgQqkVMMdQ7mNA3KWVkQ3yRb/44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054913; c=relaxed/simple;
	bh=fAUDPvxqaw+6pr5mc39n3eur2Tcogs78ZHJo5w0bH/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5pIA7jN5UrSqu14rPCPyaPDfijLGJr0h9iV0uH6kNqsOwe0WTq3pq844Se12QLep6bkITRIEHEQnv6as30ztKzyWT9i8SGk3uJ5U6nspVoVtK+er6Lsagn3ZfqXh93lC1U9/HlwKpPNjXkHQiClOrM6NN9nporGrFQroZ0hrI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLCQyHIk; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLCQyHIk"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so3775627a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 05:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787054910; x=1787659710; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLWRR6bd/B1YfeV+dpf0DikAPd8jlRuMRPf5YKC5xI0=;
        b=PLCQyHIkenyZ9FCfX9PieOpvSba+nlqcxi1Bh1II4rkAqoE5xlKOGVuMD+veLrQO7u
         jThFTR4jOcgzVU7gcrEZbKJ1JyNJYYfCruJeNivR/ssOKlO2CNGMseh57kb9ivMXNtsM
         vl+iROmF5JhJXziWuJKTD38HeKXBiBUK8YNVAbVPX/6vSEMNqD6djhDILVk8la/78P1t
         P29eQFXrQl7FHxu97fALdWRYLwK835xDCr9Xo7PYjenkhiBt6f4XNHC6ORzdsbw2St6Z
         ItFuVMBx1E2Ji5BfIxXhTyqTi0GJlczdB58qNjBVYEEreZGwFSIGXTH5pzWsUo3Z1cNY
         effQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787054910; x=1787659710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SLWRR6bd/B1YfeV+dpf0DikAPd8jlRuMRPf5YKC5xI0=;
        b=CeCCI18atDQc6tIHf0ktBm6GPJHDx6sjn8UK7yKpoD10h40Pb9ZGRNxIv7baAt3ssE
         sfdvg5+i5c2eqjglxDpLu1jUz4oZpy55Cs9wTKe7NWfuFKzELoENP23lDB3NHLeR8YII
         QI6krLReAYMiUuw0VTmA/UWRFapoCrosrUUkRl7+xxt9f+dl09NC+mX1BaSS8VU2K/ZK
         u9PqJ/PFXTEWVarvK6PCnY3PWFz3jCqRoCPNAv6cTRUFzMx/htue5pPbk4jPYN8V+ljD
         jfzcJVT58drFLn+vKK254kCxdt59q0+oRLLzYQ1noggLZu6hPLEP/m7HfnDzeZHrKMoa
         vCxg==
X-Gm-Message-State: AOJu0YzwlKyABPAau4NbYjHax+F9YezFE/8vm3yvd8JBbg3xci/ndFIm
	9gbtku0+BZ+IZIFiIbanpvIqXPkDfhAdqCdNy4P3ThnN44xalZ4bqTxMzequEg==
X-Gm-Gg: AR+sD13ydrGmXaYi/y89VUuBYxaXx9jcSGhAtQvJgmUNIgFuzllJQRpV4oo8QKAxM7v
	nzOllPeD2ZXuJHNBfhSZNKOFsOSbxBSPLlLivYETeX2HWbbNgScoJ0+4xmrJ7ZNyYOCXoPu6KDS
	lJn8mlkrnabZ/XfyY/xW780lYH5JIEtb4t0kEedKnljPuQC9O1+lXcUadglnaSaqyjceEkV+HsY
	zEnvvaVYLZ1rXwQ5j8qBVkSJ8SOFZ0JLDkDmJpEgScgbf+AH4YM3Rvd/IHhQkt1uHbZ2kHxtkOH
	Qdiz1Z/ncKz6S85RGj3QQyd2YF5bbqcv4t7k5vPLx4BkqtAOG7WzJ4amIbVBJUMxfV+c6tAjv4c
	pHoPW87+zhdwgEQLVYQOE5xBVIDShVtwLNmZCDj23VZ5+rBMXYcZG3tkBxojBtc1HNeotgP4Xt3
	6KFpYSVHT4l1GIml7Xk67dTfj3PJsxQ1T7F9b2rxbwB5/Bjq7fOHV5nQcbLTZMo9pfTxK5GSqHa
	R+gxNh/
X-Received: by 2002:a17:90b:3c8c:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3933b91661emr37890092a91.11.1787054909608;
        Tue, 18 Aug 2026 05:08:29 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb3c5sm8561385a91.9.2026.08.18.05.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:08:28 -0700 (PDT)
Message-ID: <4706b63c-a74f-43ec-9b25-773192d7b55a@gmail.com>
Date: Tue, 18 Aug 2026 20:07:58 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 25/32] ext4: defer i_disksize update while
 DISKSIZE_GROW_PENDING is set
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: tytso@mit.edu, linux-ext4@vger.kernel.org
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814093331.1703882-26-yi.zhang@huaweicloud.com>
 <20260814103123.E1A601F000E9@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814103123.E1A601F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2026 6:31 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Missing State Initialization / Dead Code: EXT4_STATE_DISKSIZE_GROW_PENDING is never set.
> - [High] State Leak / Data Loss: Discarding the zeroed EOF folio without writeback permanently leaks the pending bit.

These are false positive. EXT4_STATE_DISKSIZE_GROW_PENDING is set
in patch 28. This patch is just preparing for that functionality.

> - [High] Durability Loss: O_SYNC extensions via fallocate/zero_range silently persist a stale i_disksize.

This is a false positive. O_SYNC in fallocate operations is handled
in patch 26.

Thanks,
Yi.

> --
> 
> --- Patch [25]: [PATCH -next v5 25/32] ext4: defer i_disksize update while DISKSIZE_GROW_PENDING is set ---
> commit 5fa612fe6ec599be935a3aa55b36845e34d3180e
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: defer i_disksize update while DISKSIZE_GROW_PENDING is set
> 
> Operations like append allocate, zero range, and truncate update
> i_disksize directly. If the new i_disksize exceeds the original value
> while the zeroed EOF block is still awaiting writeback, metadata may be
> persisted before the zeroed data, exposing stale data on crash.
> 
>> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
>> --- a/fs/ext4/ext4.h
>> +++ b/fs/ext4/ext4.h
>> @@ -3605,30 +3605,67 @@ do {								\
> 
> [ ... ]
> 
>> +static inline void __ext4_set_i_disksize(struct inode *inode, loff_t newsize)
>> +{
>> +	WARN_ON_ONCE(!rwsem_is_locked(&EXT4_I(inode)->i_data_sem));
>> +
>> +	if (newsize < EXT4_I(inode)->i_disksize ||
>> +	    !ext4_test_inode_state(inode, EXT4_STATE_DISKSIZE_GROW_PENDING))
> 
> [Severity: High]
> Could O_SYNC extensions via ext4_do_fallocate() or ext4_zero_range() silently
> persist a stale i_disksize here?
> 
> If the size is extended with an unaligned old EOF, the i_disksize update is
> deferred. Since O_SYNC immediately commits the journal without waiting for
> the pending zeroing writeback to complete, it seems it will commit the old,
> deferred i_disksize to disk.
> 
> Would this cause the file size to revert on crash despite a successful fsync,
> discarding the size extension?
> 
>> +		WRITE_ONCE(EXT4_I(inode)->i_disksize, newsize);
>> +}
> 
> [ ... ]
> 
>>   static inline int ext4_update_inode_size(struct inode *inode, loff_t newsize)
>>   {
>>   	int changed = 0;
>>   
>> +	if (newsize <= inode->i_size && newsize <= EXT4_I(inode)->i_disksize)
>> +		return 0;
>> +
>> +	down_write(&EXT4_I(inode)->i_data_sem);
>>   	if (newsize > inode->i_size) {
>>   		i_size_write(inode, newsize);
>>   		changed = 1;
>>   	}
>> -	if (newsize > EXT4_I(inode)->i_disksize) {
>> -		ext4_update_i_disksize(inode, newsize);
>> +	if (newsize > EXT4_I(inode)->i_disksize &&
>> +	    !ext4_test_inode_state(inode, EXT4_STATE_DISKSIZE_GROW_PENDING)) {
> 
> [Severity: High]
> Are we setting EXT4_STATE_DISKSIZE_GROW_PENDING anywhere in the codebase?
> 
> Looking at this patch series, it appears the bit is checked here but never
> actually initialized or set. Does this mean the deferral condition is always
> bypassed and i_disksize is always updated immediately?
> 
> [Severity: High]
> If the EXT4_STATE_DISKSIZE_GROW_PENDING bit is properly set, could it leak
> if the dirty folio is discarded before writeback?
> 
> For example, if a file is truncated down before writeback completes, it
> seems the bit might never be cleared since the writeback completion function
> wouldn't be called for that folio.
> 
> Would this leak cause all subsequent appends to skip updating i_disksize,
> leading to silent data loss on crash for future writes to the file?
> 
>> +		WRITE_ONCE(EXT4_I(inode)->i_disksize, newsize);
>>   		changed |= 2;
>>   	}
>> +	up_write(&EXT4_I(inode)->i_data_sem);
>>   	return changed;
>>   }
> 

