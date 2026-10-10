Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198693BB672
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 03:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791601521; cv=none; b=Fx3NPBg2H1jk5CpKR9GBmU875B+QXq8V/2dzUz9+MqqkfEPsrizYxCXNwHNFMSJpOY1SgQq/f5Unp1CuUbBJOZfa2ftne/M5+NmDP6kCKhqSs28V2XsfmffWIyr3UsLd2YvrZOrzd622haNLpDtTT8W7w/JjA5cJQ8f4FeuCd0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791601521; c=relaxed/simple;
	bh=8cihdIgCaIFHEkgmVa83L+O1B6aYVDGqQ3rqAyOf8Lo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhAwfLtFSxq1iLOUaBbCuRD1e6yCgLZUi8sgJP1yieQ+1efpWiXOIfMT4UcxzNRyiCgRxHamFBZVzDBxnl8PVQ5noq7gVWZCN2Y73eRgqB6nfh9nz4f9W8RWeyk1u/xE9gRlO6NK1QIJWVuoxMkG6vzyDFyzOw2CtCh1B2bp+fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqfLaXQp; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqfLaXQp"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db80fcdf8bso1860315ad.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 20:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791601519; x=1792206319; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmqPFeMYs9Z+NKDlaYJ+n319ZI2tWY2/NF2LRFyiqno=;
        b=IqfLaXQpjI//neJGm4ts3QQ5KxtarCvSoDp7EAFBzm0rGM8VUiDhUKvlq01XLU7Epr
         vdPlknICA0/ASlxbFwlqv2gCR+Xmsae1zvnIHQCvMuEPv5U+p0NykdPi46nrGvwRbwyd
         9BBdbgcf8o6vdYm90XdiVS6X+L52tv6b7tUYUjbiMldWbA/dJf12W0ogJm738uFaXi50
         gOq/nybCifPBSbwX5a/u5mxYjDWjtIbRdn+1d4AloUHxrtfyRfuHcFDWEnFJ4IcsBlB6
         kkrkkUUkO4i3oLNCpqt7sju0mcTXXfaobyygyV9WR+kixtKoGpUmnWP5UFHsF3WAC0fV
         71jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791601519; x=1792206319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmqPFeMYs9Z+NKDlaYJ+n319ZI2tWY2/NF2LRFyiqno=;
        b=f+MZ9W+MMQ5oaQDGbjLYTqn5VWdkjpeUeediSNVT7jXhMJHsP2HPWmvRMtQI6x6mea
         Mz24czx+3D+4tatnKP1K+Sqqy1A3f6TFrEYfdz6ACzt6nnfQoK36c4ybtiQoWL+NMRlJ
         bK4EuCcoVn+/2FfWgiQBL5fvD00gFFn9lr9KAkOTtXh4yAebyRMR1wV13McrBVL+kVbD
         6RNLUMNZgvR/UKog2zvo30S5SGoYpTKr7DoQ1l8+pPn6YnGW4ftcszVxUuqptM+xTFzE
         aKl04+nqI6UuNP2VdfaZrWYHxK/c/4mrDA7YPoycifgw2GUuB1X1Z5DRCBjVFoyvbeXI
         aU7g==
X-Gm-Message-State: AFq9FYK4kYgCyMwLVb2D7fKMFm0gClSw0Rh7G/oTEhfGDba8o8QmqJkt
	hJABe9ZwIZ5SDJM41Pkfbv1a2zwJVYZ4RqEJXQog/88OrNfSKYH+7XEoOxJ4qnuT1v4=
X-Gm-Gg: AYBFou2pJPqI5wO29MrmDBUo8cqQPfWfRvY8XLkpX4qD7L4nJoFn6c+x+HiL3gZihQu
	mVxSKrMXBRZpTbzwWoVKo5r/2MRHz9kzDgHD2aDWrN0v7DijjuUyqiZkcBrr07i9QFTiOZOzluq
	kbmdCtOxx7QG19J9w3D/jPRA5aMOroufdwV4Y84miCWMLRe1KUjYirnae6W/+lKVQWXlW1cC8ao
	c4ogFjOMNzjoVnfBl3Q7v51hU/tLEAqH9ooVGlVxPdz3suekt1mrYfBCEeh61b6oTGbexjSLYaE
	X7j6rM9UsxGs/taitEmUzMsUSwmsqHEObcFPVUtKFG7HEX73IzAwCVEiRpqEVONlzzyNskQCpu8
	ISQEx42JE3UtiBJ2NhJKYQ+2Q+CIab3J0vjcCxeTFKbxnEXqqv7UWzuVvvG3MK8fw62w5LVz7Vg
	R5YAh7gIkXKb2SGABvLv7In54kDGcTXg8L0Ubjjoi1O3PGWANTdRPRtxjbWn9jVaYK6+0Kwvbg8
	yRKVT/XSTvVpH+XPQcprxzXUW3DHA==
X-Received: by 2002:a17:902:e884:b0:2e5:d2af:8aa0 with SMTP id d9443c01a7336-2e842ab6bbbmr31426325ad.42.1791601519287;
        Fri, 09 Oct 2026 20:05:19 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm18315685ad.54.2026.10.09.20.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 20:05:18 -0700 (PDT)
Message-ID: <e1e56e82-9459-466b-ae15-0529ae3217fe@gmail.com>
Date: Sat, 10 Oct 2026 11:04:51 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 19/31] ext4: add block mapping tracepoints for iomap
 buffered I/O path
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu
References: <20261009103033.2920530-1-yi.zhang@huaweicloud.com>
 <20261009103033.2920530-20-yi.zhang@huaweicloud.com>
 <sashiko-outbox-165305@kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <sashiko-outbox-165305@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/2026 7:03 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] ext4: information leak of uninitialized map->m_pblk in trace_ext4_iomap_buffered_write_begin
> --
> 
> commit 63eb0e998a7a12aca902166168b720bc244eba71
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: add block mapping tracepoints for iomap buffered I/O path
> 
> This commit adds tracepoints for iomap buffered read, write, partial block
> zeroing, and writeback operations. This helps debug the iomap buffered I/O
> path.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index 35767c3a7ffff..1c7083a9293e9 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
> [ ... ]
>> @@ -4052,6 +4054,8 @@ static int ext4_iomap_buffered_do_write_begin(struct inode *inode,
>>   	if (ret < 0)
>>   		return ret;
>>   
>> +	trace_ext4_iomap_buffered_write_begin(inode, &map, offset, length,
>> +					      flags);
> 
> [Severity: Medium]
> Could this tracepoint leak uninitialized stack memory?
> 
> In ext4_iomap_buffered_do_write_begin(), the local variable
> struct ext4_map_blocks map is declared on the stack without
> zero-initialization.
> 
> When ext4_iomap_map_blocks() is called with EXT4_GET_BLOCKS_DELALLOC_RESERVE
> (when delalloc is true), the mapping resolution routes to ext4_da_map_blocks().
> If this hits a cached delayed extent or inserts a new one, it returns 0
> without initializing map.m_pblk.
> 

This is real, it looks like we should also initialize map->m_pblk
to 0 in ext4_da_map_blocks().

Thanks,
Yi.

>>   	ext4_set_iomap(inode, iomap, &map, offset, length, flags);
>>   	return 0;
>>   }
> 
>> diff --git a/include/trace/events/ext4.h b/include/trace/events/ext4.h
>> index 7028a28316fa3..bcf80f518e61d 100644
>> --- a/include/trace/events/ext4.h
>> +++ b/include/trace/events/ext4.h
> [ ... ]
>> +	TP_fast_assign(
>> +		__entry->dev		= inode->i_sb->s_dev;
>> +		__entry->ino		= inode->i_ino;
>> +		__entry->m_lblk		= map->m_lblk;
>> +		__entry->pblk		= map->m_pblk;
> 
> [Severity: Medium]
> Does this assignment unconditionally copy the potentially uninitialized
> map->m_pblk to the trace ring buffer?
> 
> Since ext4_fsblk_t is 8 bytes, this would leak 8 bytes of uninitialized
> kernel stack memory into the trace buffer on delayed allocation paths,
> which is accessible to users with tracing privileges.
> 

