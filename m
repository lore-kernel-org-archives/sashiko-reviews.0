Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1829C3ACEFE
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786978049; cv=none; b=KVzfzpo4+EyKMUwlm3wPmWIy1YeGDeGSUXxwjI6GaZENp88cPDb8PqKI4+JMZ62Xc2EIZA7VZXaQIX8XjFllvknfu9Vtk/VwXGd/dmnCqBnUHAC7YRwS1GCc+240eAMR1jcyoRkQELLZcid87pAg5bkQJTDVBZHcV0UhoBAdZ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786978049; c=relaxed/simple;
	bh=VjRBWIZ7jCjzGwCy3qWaHGfSyVkw9yLe6o95oB78wvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GfpjTjT6noxNBbBA8PjEWWqUyD45ty4HmHigP60YIIu3co9uUZoYv04hn8PWAh2N3M5zOK3uGr5cLznie2ha+pgdZC+xpLoizBKnCCDmcSoqwStdMCtcr8lKzEzZ1f7NaRGkXZzlxoJnPePehAoQCyIfM4mlHsRPSV1LS8pg7m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ii40MIoG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ii40MIoG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d049069377so36493965ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 07:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786978047; x=1787582847; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRO8UGMW+tNmWJMMz7cDo17X2CmKWu2MLoaJw7nqMk0=;
        b=Ii40MIoG3/5PN9S5pJhcHnwwuRnUBkfAD8Y+iY6pQtYwOSWDFFp+dGn61fmFen3YDG
         kJb2ixkHeeoUPe0gY5bCVvTOufAX6JM/PsksRiy02HZLNJK1qMJXRbP4fhujT6d1bCV+
         Lc4zkxjEei69obvck7yw1nb/TGGcIpyhUN/4KQqhWFlcZ35bkh6esOvJwGX1aAqg5AiT
         v6ag/QNVJniBklSuiWVkVQsw2KRbOOnn7zdvBrdfuNXS2FChNZAdmwgU0429xAH7toT3
         P0NX3YzsgjiBUnbkxKcxw+MF+uMrz5qHgMTy6dauXQYyYF/XuFbpc8lV57N46suvLBpG
         M6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786978047; x=1787582847;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aRO8UGMW+tNmWJMMz7cDo17X2CmKWu2MLoaJw7nqMk0=;
        b=mSiCFoAxhuM2rIzo0goiH6kMy7xLhEw9pWFp3cFHQq2s2TDbeLld8+wnjhKjJzbwgi
         BAfacxkPvHJ0Fywg7qc92y4MH8sLt+nbjzahtBYzS1O+P4eJ1R8mEkOFnsouRL+rz2K3
         NcxeQOj5YXLoAR/b9e6JgSFXyzvq4+BqxzDkac1yZcMjBMr9zxmJZCMiRFnw15a3HUz1
         WnRJI7w2QUXg45CJkKSspuxQcKRNVeCkYdMhxVjPOCzBqFdL3gMQBV1Tsa/cQHxwRV3X
         r9sm9Lk+mYP3ymoXoy+RDVMh8vKhxg0rPoC3QYHJDpHamObgTDZL0nE+gs6RGIodmcLy
         5HVw==
X-Gm-Message-State: AOJu0YwT41b2gGO6mwdsQsAldPJzT1RClopSY8sbkJHBEqosO4dfhnoD
	a8QWqwrIkyeDTBRXL01Y4fUKjWS7qI9CZw2okNIQ096N0tKgcYFfJ/Bw7cLLqKoDNCU=
X-Gm-Gg: AR+sD10QmuvrS88HgSQ2zz3GWvPMrbKDRG2YxCIGusOp7yE3XgB1KPObaDa72+a3X65
	eU4nw30/LwzCQ/g5lIJezteXEv4B+ZAkHpSGND+eV38DcicUm8hRo9opC6A7qt9W4S43M8voxa+
	BQtasjm3KLjmkfbXeg724qbQSoxcfpq5ZitnJN7nkGX38YQoiKhd7QMXLuXCW+z6YPe7mhau39V
	BH8XFpkNPGYpxJk2UVt53XvY1y3udNNUc7q40L3OdA/BLqewVPSxD/esPxW2nDhF9gZI4HZ6vM6
	uMhDROgDmRdUPv8ILzgc/LcHcuQQueczVimm8BA69Xi3S0Eki86slx/VmQTWJdxpqBOZS/0XUs6
	LPlAlS/JfU7EzcMkJ4hCorxPSlAhjk7NwRDwwAzwefFRhMvdValEX9GOOr6+e5VEnxgWhxsXdui
	bp/0kSHl90GkGNdSTGTfs9wX+8qzjkkHQIpM8PbCyovIloBMqxn6EsqO05HOs8tin53t7KKN1DY
	6mtCBI0
X-Received: by 2002:a17:903:37c4:b0:2d2:da8e:9017 with SMTP id d9443c01a7336-2d3b0c5437dmr278133935ad.8.1786978047185;
        Mon, 17 Aug 2026 07:47:27 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e91356sm4055195ad.59.2026.08.17.07.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:47:26 -0700 (PDT)
Message-ID: <333dc30d-a348-4164-aa5d-e96b6e3ffe1e@gmail.com>
Date: Mon, 17 Aug 2026 22:47:19 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 19/32] ext4: tolerate unexpected holes in
 ext4_convert_unwritten_extents()
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814093331.1703882-20-yi.zhang@huaweicloud.com>
 <20260814100917.CB2301F000E9@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814100917.CB2301F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2026 6:09 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] The patch masks a severe physical block Use-After-Free that causes silent data corruption by suppressing the warning when IO completion observes a hole.
> --
> 
> --- Patch [19]: [PATCH -next v5 19/32] ext4: tolerate unexpected holes in ext4_convert_unwritten_extents() ---
> commit 024b041d5cfa7f6f30a260ff0a2a3cd17336e881
> Author: Zhang Yi <yi.zhang@huawei.com>
> Subject: ext4: tolerate unexpected holes in ext4_convert_unwritten_extents()
> 
> This patch suppresses the warning in ext4_convert_unwritten_extents() when
> ext4_map_blocks() returns 0 (indicating a hole). It aims to handle the case
> where a punch hole operation races with writeback when folio sizes are larger
> than the block size.
> 
> Link: https://lore.kernel.org/linux-ext4/a638a8fb-c184-4069-ae33-379ec12cd514@huaweicloud.com/
> 
>> diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
>> --- a/fs/ext4/extents.c
>> +++ b/fs/ext4/extents.c
> 
> [ ... ]
> 
>> @@ -5166,19 +5166,21 @@ int ext4_convert_unwritten_extents(handle_t *handle, struct inode *inode,
>>   		ret = ext4_map_blocks(handle, inode, &map,
>>   				      EXT4_GET_BLOCKS_IO_CONVERT_EXT |
>>   				      EXT4_EX_NOCACHE);
>> -		if (ret <= 0) {
>> -			/*
>> -			 * If the ret is zero, an unexpected hole may cause
>> -			 * conversion to fail.  To avoid data loss during I/O
>> -			 * end conversion, skip the hole and continue
>> -			 * converting subsequent blocks.
>> -			 */
>> +		/*
>> +		 * A return value of zero means an unexpected hole was found.
>> +		 * This can happen when writeback races with a concurrent
>> +		 * punch hole in the iomap path. Because iomap may not create
>> +		 * ifs for folios larger than block size, the dirty bit can
>> +		 * be set again after punching. If writeback happens between
>> +		 * partial folio invalidation and extent removal, a hole is
>> +		 * observed at I/O completion.
>> +		 */
>> +		if (ret < 0)
>>   			ext4_warning(inode->i_sb,
>>   				     "inode #%llu: block %u: len %u: ext4_map_blocks returned %d",
>>   				     inode->i_ino, map.m_lblk, map.m_len, ret);
>> -		} else {
>> +		else if (ret > 0)
>>   			conv_blocks += map.m_len;
> 
> [Severity: Critical]
> Does masking the ret == 0 case here hide a physical block use-after-free?
> 
> If background writeback via ext4_iomap_writepages() submits a write bio for
> the dirty folio, and a concurrent ext4_punch_hole() removes the extent, the
> physical blocks are freed.
> 
> Since JBD2 does not wait for this in-flight bio during transaction commit
> (due to data=ordered mode being disabled for iomap inodes), those blocks
> return to the free pool and can be reallocated to another file.
> 
> When the in-flight write bio finally completes, will it silently overwrite
> the newly reallocated blocks and cause data corruption?
> 
> Instead of silencing the warning during IO completion in
> ext4_convert_unwritten_extents(), could the underlying race be prevented by
> ensuring sub-folio dirty state is properly tracked so that punched blocks
> are not submitted for writeback in the first place?
> 

Yes, I think you're right. So it seems the best solution is for the
iomap infrastructure to always support ifs when block size is smaller
than folio size.

Otherwise, ext4 would have to fall back to sync writeback to avoid
this issue, e.g. calling filemap_write_and_wait_range() after
ext4_truncate_page_cache_block_range(). The performance impact should
be acceptable because ext4_truncate_page_cache_block_range() already
ensures the folio is clean in most cases, only the partial zeroed
blocks at the boundary would need to be written back. So we wouldn't be
triggering a large amount of writeback. Any thoughts?

Thanks,
Yi.


