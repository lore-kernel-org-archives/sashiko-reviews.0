Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1993E1CFD
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 09:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946078; cv=none; b=Zoh2xTOLaoSNR/AnWXU+UsVHKiqVEIGOvngeYAC/wD5UUL9Kb1XLZbt4w7siWUMMLxw1mN0KoPo5yzFIt6VW7TyKY12uuWJdFkWTqH3Xz4mvRuzd2yp43wqi7kVoyGZ0/CrDlRFNOku/4Z16BM5C8GfG1Qr8B6KD7i/ms2p0ZJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946078; c=relaxed/simple;
	bh=AYJGsZ8o7WlZaiF91/EzqEc+cyr0BaFZD9Xmzk9seYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3ibREONkCoPWH+xGANKi2gtw65HufQpWcBWQR9SVjaUBL26yW1hnRsiJ9NCxRbYYDPXX8Fegjpe6q8ieqM4pxUOMKyhdYGi8brSMzfBZQnkz4p2onjPqvt3nSb0ZG1h11RD3+DDJ9AwOc/QXdFpI0DJ5GKjFRkdl5VIstRkN9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M39gCSoo; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M39gCSoo"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-86927f9ba4dso166812b3a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 02:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946070; x=1789550870; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgNAyP9Im00dlDthcLYZPnLpvWkQDHZkuU3va3Gh0tM=;
        b=M39gCSoonZjTmAsTOA+kxADBGe/r4DEdnbl0Gp4AMiv219mhUyrwV5PuI9E+MtjEzq
         al7oT4LlDE+RbZm14tDRULGgCDljPUMBESskg/6dkCNQR+PQBT0ei9C/+NHmD4KZT399
         buwdU38jvTbHlsWH+jneGI15fgAl2JNIxr+tmKO5fA6NItQsUNhdK/r41aPoJ/UhE+p3
         5M0196onxLXKMQTi01YvhhzoC9cUeUPl/RmkSIooXLtmgOK0wMp+AORXtigcGtO9GgLk
         Goz3+zL1T+QjhzW3Esvz+i8lrg1T2nu+FkT7limI7AA9ncvXIuDRkfVPwUHgVMXEDK/f
         6YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946070; x=1789550870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgNAyP9Im00dlDthcLYZPnLpvWkQDHZkuU3va3Gh0tM=;
        b=foJ5LdZESQCYTZCgR4SwwJp3uQXRnBZvhTI/6OdphMIRDQXsCzkyF2KEUjzS5YvhkZ
         9XA6NKuNvsaz4opkVZAZjETgBdZ+9Mt1AmavQVQGL0WBu2bf2MAPK1HcSURxKtW7J60t
         4Hr4XmGMafreHdB/1w+0vogRgNlr6dn9WJZasNmMcRRg5c2x/ISYZdxLRtt3Dx4d/rkh
         6OG6zQ2CMNHWyVIgnq1Jn3S81/mBY19Mr25c+AggdDNPmAt+/0x0ricXSK7aQeSe/eK/
         LSrgnJM/ol+Xyv0oTcLQG2I0CTyP1vPOJVAkAucMlqQMVknJG9RYDpFjqN+RmOq2xFEX
         61EA==
X-Gm-Message-State: AFuF++laVVZj7wHX2sPt8j+aPXAtqTh+uRbEnlN0ooNBO12cLpzfG6RZ
	VpJELEWe0SJpmmHWe0nvpkv7ss1gSKIccNSpzRcc5BwKDVXrZfc5pI4etQ6+IsTnzuo=
X-Gm-Gg: AYBFou2X8nyiH9S4jAVj3d4pKgudzKmHKUHv42Ytfx5vr10ElSx3/8vzQtVcIkqfCJa
	5rN1nKbsjMhllr8OH5umQ8nFoJIs32pcEZ8OZgBf19ge64vHV/TtqC0LpqLrkPL42dWfIUgWHUD
	dQ5Uu9sRQ4vKAN0fRpYElA0iIH9TbstmhbTQMMJQFsuqg3uyDZB4QbNUEfEm6exh1SFFd73zEdw
	lBVbJUx5YSTcuZnOTuMLA6QH0Ulu3/HXsmyR5WTi9flmmb1Swz0IcF/JWKKuIj8L6jlCh/RGQHD
	EM4Z4J3jBG8npuwl3OHaWb9LLJ65ENv42g8CN0Ry9vZT9WPvVIy8eGty/IzR1UcerwC3RExT4CU
	wtAToi472of979pDQ2x2Zz0ABCMqBaRn3riZBcRPHYiPZ7QQCo4MhcVKllbmjed+UJM2DXF+SuL
	rwrz5QDVQCrMZ3Ez3JzS/lt2ZQUHb5ogQBSEBVNMb6j/LUcNmVHt1B4RXQl/lEmvm/TgHATmoNV
	KnW4HEx2Sifa+insBsHFX7AAIQAdA==
X-Received: by 2002:a05:6a21:497:b0:3d3:ae0f:526a with SMTP id adf61e73a8af0-3da3a152bbamr55331470637.22.1788946070066;
        Wed, 09 Sep 2026 02:27:50 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc455488faesm6683552a12.27.2026.09.09.02.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:27:49 -0700 (PDT)
Message-ID: <a1a84ad5-d58a-4d15-a3ca-e78c5922f4ce@gmail.com>
Date: Wed, 9 Sep 2026 17:27:27 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/31] ext4: recheck extent status tree before block
 allocation
To: sashiko-reviews@lists.linux.dev
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 Zhang Yi <yi.zhang@huaweicloud.com>
References: <20260903123543.2302999-1-yi.zhang@huaweicloud.com>
 <20260903123543.2302999-6-yi.zhang@huaweicloud.com>
 <20260903130218.DA3BC1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260903130218.DA3BC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/2026 9:02 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unbounded retry loop in `ext4_map_blocks` can lead to livelock.
> --
> 
> commit 084efaf4a2100728f08798dc518e2664e9b89954
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: recheck extent status tree before block allocation
> 
> This commit adds a sequence number recheck of the extent status tree
> before block allocation in ext4_map_blocks(). The goal is to ensure a
> racing truncate does not trim the extent between lookup and write lock
> acquisition, which could lead to quota leaks. If the sequence number
> has changed, the lookup is retried.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index d703e95a6f62d..fb4834608fd89 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
>> @@ -734,6 +734,7 @@ int ext4_map_blocks(handle_t *handle, struct inode *inode,
>>   	else
>>   		ext4_check_map_extents_env(inode);
>>   
>> +create_retry:
>>   	/* Lookup extent status tree firstly */
>>   	if (ext4_es_lookup_extent(inode, map->m_lblk, NULL, &es, &map->m_seq)) {
>>   		if (ext4_es_is_written(&es) || ext4_es_is_unwritten(&es)) {
> 
> [ ... ]
> 
>> @@ -820,6 +823,19 @@ int ext4_map_blocks(handle_t *handle, struct inode *inode,
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
> 
> [Severity: High]
> Could this goto statement in ext4_map_blocks() lead to an unbounded retry
> loop causing a livelock?
> 
> If an unprivileged user triggers a file writeback concurrently with a
> tight loop of operations modifying the extent tree (such as truncate
> or fallocate), the i_es_seq sequence number will continuously update.
> 
> Since there is no retry counter or a pessimistic locking fallback
> (like performing the lookup entirely under the write lock after some
> attempts), it appears the writeback thread could be starved indefinitely
> here in fs/ext4/inode.c, spinning at 100% CPU.
> 
> Does this need an upper bound on retries or a fallback mechanism to
> prevent system stalls?

The retry here mirrors the existing write_ops->iomap_valid() +
IOMAP_F_STALE mechanism in iomap, which also rechecks the sequence
number and retries without any upper bound, and has not shown livelock
problems in practice.

A retry only happens when i_es_seq has actually changed, which requires
another thread to hold i_data_sem in write mode, so each retry implies
real lock contention, and the writer yields on the rwsem slowpath rather
than spinning.

So I don't think an explicit retry bound is needed here.

Thanks,
Yi.

> 
>> +	}
>>   	retval = ext4_map_create_blocks(handle, inode, map, flags);
>>   	up_write((&EXT4_I(inode)->i_data_sem));
> 

