Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC4029AB02
	for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786782654; cv=none; b=S5SyRsqAy5kTFHyEHm3aWJoa1DYjDBJZ0YuN9wvT4OA5WRxRKXEc5Da4yafb62iNOMCQG1vbAwZ71X3ya0lJtADjP3WTPXxzum3HiMk3eXBezX/3grk0zwFn15jqQNRsKoRhbqKJSNIRJxZo0om9rc5LH9DHjJqIMKateyr53kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786782654; c=relaxed/simple;
	bh=nQf+oRV2tsje4ZAAo4tpszk2WhvhadMFLZRKKhKbilE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UaniZW2hC+UKF6HAjU7biNywvqYMF7qRwQQZVTINxTqjYSJJ3EKJgdUEklUrhaV5ENJVXCCKgD6yUHAb9N9TCpL8oZE3XZrhG8JbTQaY9+904o+XFoCwiKefo00kDqGf4N2AqnbWstWoht8g+MTZhW9nIzE/aGrOA/Piy6oD2uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6NQWm3w; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6NQWm3w"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so2048675a91.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 01:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786782652; x=1787387452; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOcULi8LDrPr9znFK69f8PAs3Dh2L7dZMUzvNkwuPa4=;
        b=e6NQWm3wTA05WsjyHym5j575U4VXm3hYPWyld3xVwvyAJV/z6rMDkDYIDhh96SwRqD
         dEH3MeRcTON6xmruTqeLNiPUYs7FPIrx+jugt82oAxI/gHm3oeLLbRfI690Z68uucLca
         FBKerxYWN1x2qXPf7kvec28LzqAPviavK+O5gxKJYKem6pFzR1kY69yIwYAZrqWck6ON
         pALgtvJD2mP6E1ExiBSBajDau2++AU4jwEz2F/YghFWVCgWV9iSY4fOZB+BX2Eg4jr6b
         g4CVBsK8TNJ3FGINGkFalCJNnIKDvAc7C6TlZBPFyVJI4QXStp5uBjwMoKy5IdXXTId/
         OSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786782652; x=1787387452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOcULi8LDrPr9znFK69f8PAs3Dh2L7dZMUzvNkwuPa4=;
        b=LsmRJ1EPXcZvgPuL4Wj61VEgWHRG3r7K4OblFpjpdJxlzk/Ht7hgopOF5tgxHTczJj
         kqkZNav9PMtQx9KtG5Q7sogaUp4Z/FNbhid4EXEk1PYBRWlNmAt+08EDyRnw9zHG3XRk
         vj6WbWeQEI3Y5z5gx0JIN5qgZFCV3sPaqivNvFUQx5uy2BjXWoMw6OLutmO2mE50si3M
         Lqbxpf0xYZDrZsLCfgjH5LM1wygzzvgY96wM9vpPwIbIgUqY0LlVJYfRvg4gm0lkgSu0
         TDIT/0O+Ndzh14LmRvxYd0x1/3r2kawZfepwzEN/aJPYbiWSnMtejWDAJ3PpGzDyTa4z
         AJ3Q==
X-Gm-Message-State: AOJu0Yyll8XMzaOwvKD3V1LMlrQPUoCMCieI2LUm+KRr6Dymm/9ajUHO
	Q26ZxmF1QAzl9KNQnoCxu3lYmTahs9Gj/l/uCYwsd9XmSZSXo1VKkP96RdSxDJABxZ0=
X-Gm-Gg: AR+sD13+nPdgd1cM6hEnLJqMAKfeHVHbVYj1d6735f7rR2Pqf9S8m+gmQ/Fizj/y1hI
	AYxk5Q8ml1IELmVTdMZDmPAKeJX0gcSBOOVRW65/ZK5Zpx2wzwzIX0GdlpZQipZ0X66S4csp9qF
	KVYaYPRuoNEHree3iWxo+ylgb98D6KP0ImPJcxvWYnMjBizLoU+F+AkJ0jBCyY6FIz3mRm9vpFD
	CqhFWJuJPhHM3/pD+DA0yl/y+0qkFL57Q57c/VpNqiOqIghGjuQng4gLvdeIYyds9UrsFyK0b/R
	zRGQOlj7mIwUMisMtzWJUsleRPTP1jx2IxMCOhPU0cnCvXgQRKlLOxv/N9v3Swks9TU14G8Dp9O
	Tv2bkEyd3z+BisMetinHxyPdiaqk22KMNi+Tbd9N3sw20wlRdkYZ5f737cZVuHVq0BliFzZOn63
	c7/UO4UML+tW206QT+kVR9YpOBrDLSMjvm8Q1Y4Z5Y94Z1hmk3EWz0S4qnwk/mceSAs7Ob5Hn7Q
	E284nEo
X-Received: by 2002:a17:90b:53cf:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-3933bd204d0mr13591060a91.3.1786782652373;
        Sat, 15 Aug 2026 01:30:52 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea96c87bsm5480237a91.4.2026.08.15.01.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 01:30:51 -0700 (PDT)
Message-ID: <16bcbf6d-b950-4ea1-a516-ae9330b6335e@gmail.com>
Date: Sat, 15 Aug 2026 16:30:24 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 06/32] ext4: recheck extent status tree before
 block allocation
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814093331.1703882-7-yi.zhang@huaweicloud.com>
 <20260814101548.7E86E1F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814101548.7E86E1F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2026 6:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Reading uninitialized `map->m_seq` on error paths leads to an infinite retry loop in `ext4_map_blocks()`, causing a kernel hard lockup.
> --
> 
> --- Patch [6]: [PATCH -next v5 06/32] ext4: recheck extent status tree before block allocation ---
> commit 6ae9b515f2027351280fce82734e7e8361a281e7
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: recheck extent status tree before block allocation
> 
> After acquiring i_data_sem in write mode, recheck that the mapping
> found via the extent status tree or disk query has not changed. If
> we find a valid extent and the sequence number has changed, retry
> the entire lookup to obtain the correct trimmed mapping.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index 9dbece14ae569..548a3968c5a7d 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
> 
> [ ... ]
> 
>> @@ -820,6 +821,19 @@ int ext4_map_blocks(handle_t *handle, struct inode *inode,
>>   	 * with create == 1 flag.
>>   	 */
>>   	down_write(&EXT4_I(inode)->i_data_sem);
>> +
>> +	/*
>> +	 * Check the validity of the mapping found via the extent status
>> +	 * tree or the disk query. A racing truncate may have changed the
>> +	 * extent, since writeback does not hold i_rwsem or the folio locks
>> +	 * covering the full extent.
>> +	 */
>> +	if (map->m_seq != READ_ONCE(EXT4_I(inode)->i_es_seq)) {
>> +		up_write(&EXT4_I(inode)->i_data_sem);
>> +		map->m_flags = 0;
>> +		map->m_len = orig_mlen;
>> +		goto create_retry;
>> +	}
> 
> [Severity: High]
> Could this cause an infinite loop and hard lockup on disk error?
> 
> If ext4_map_query_blocks() encounters an error like -EIO or -EFSCORRUPTED,
> it returns < 0 without setting map->m_seq.
> 
> However, if EXT4_GET_BLOCKS_CREATE is set, the function does not return
> early on error and falls through to this TOCTOU check.
> 
> Since callers like _ext4_get_block() allocate struct ext4_map_blocks
> on the stack:
> 
> fs/ext4/inode.c:_ext4_get_block() {
>          struct ext4_map_blocks map;
>          ...
>          map.m_lblk = iblock;
>          map.m_len = bh->b_size >> inode->i_blkbits;
> 
>          ret = ext4_map_blocks(..., &map, flags);
> }
> 
> Will map->m_seq contain uninitialized stack garbage, causing the sequence
> check to mismatch and jump to create_retry, which then encounters the exact
> same disk error indefinitely?
> 

This is a valid report. I think ext4_map_query_blocks() should bail
out immediately on error, rather than trying to allocate blocks
afterwards.

Thanks,
Yi.

