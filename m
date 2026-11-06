Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949847;
	b=dJCQJ5HeCH611aclz90pIqqYY+XRdD1y9L/BTiC8OfIKh7+ASGw0uljP5bFcZgGVqavy
	 rvWzCWgDX2zZuY/x7MCm+Guht9ScLCIoYUHt4q0ES9gytWy5uLTXFKMRSVyiyh3vXNmBH
	 YnxoUm/I5+yZ4aCb5qwGP0vM3O6IVzyXaarCXMuVLo/qo/pGGipr6BmgZqx42sGjEzSKq
	 k/5SvhzuvXdp2oJ5Hbi/ylObw1YoDmCzCikbnnQhDCvtHrET3az0thT/BKo1z+LRFgPyU
	 kWJKmCMrd/RsovneYp9KMmNgiJhqH7GKSyd9GUx6BLKVOLOIX7QTBZPPQac425tYe/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4ZGH/3pkwNlbXy2fnNLRFUTyONfu2o8eXmKWYg+Glmo=;
	b=xq06EDlq8g5NXEdu5FxVvoOZxhMSx34WFweLrtJ66TtNC3/xjHIeDyFcdT6CBVweHJPm
	 +bINkpsDKE1whhiQyM6dUwZH3b4jzmmO874RQ47DVsfls7eJqcJuG3DXNhevz8+K65JSC
	 pQmqlzJEREudUf/KUujdq+uvqCy+tdEai3GPMlTlx2vnYy9BGcK7ACVo0IUTTtYYPl0id
	 8Qu3LdxipU6h7YPW+qfMf0Pp9L78zdX7FvLS/Lidl6z/fTHawLf6zVeIGfBPwLE1dMpto
	 a4cVlojlz8AAvoW5lju3czNBfngYP+IQ+9v4lNN+BDCbiTZ7Bdk5AadI7gjNdm0mbIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZuHRpqrX;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E089606A328
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 07:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E089606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZuHRpqrX
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so313325e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 23:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793949845; x=1794554645; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZGH/3pkwNlbXy2fnNLRFUTyONfu2o8eXmKWYg+Glmo=;
        b=ZuHRpqrXdjYsZwZeLnLHFZpmM/5qBSse5RLWbeMe5cpxtskthtkQ7WB8SJvZ0Pi7F9
         5rANbI7NyKRKwtzofaD1Q4Ie4IPX2twiSB5fjKtgYC7eqTccb0oUAdiw0/IWafHjJRXp
         0Jwqy3DF/9LZ4DpiXuJD8uV5AdUyKB0JRXFrGhm5E/b6zQfROjzXFxi5bJv/IZ7pJvrt
         QNq1WDIvRVzzCN8vsnyICVv0QRIEcbUJbQ6GG+irvsknAt8Q8X6Lh7XO4EZ3GB/fq/qB
         h6rLSqlslNjAZCvpXlemMjz5GtAs713oY/tFaFDFtc1nIpoOZRmaK9wglThUuDQfIlRU
         sJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793949845; x=1794554645;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZGH/3pkwNlbXy2fnNLRFUTyONfu2o8eXmKWYg+Glmo=;
        b=o9cJvdaWX1Cd8lGvONerGOZYZ3cxNv9mbRBhuFAvBFyYkLIW0VoqGDsmphS44HzeHa
         HitFXR1eyP7TBQvFi/8y7t8GHYOAd7kRMJKCCBemPE3G1Xc8XVJb4CIrCzv99wAgZrTs
         gkYuS9HdPFiIElsal4P2RNGjMqz89N00bY7iAZ0cQljlTWT9/wtryK0bYwnTbDz8Ao5b
         Sc1g7+P9uA9rqQ0Md1xPNn7o9RmPNEySNSiDohHfw/sZwMCCwkMazzSr0Oc+D53Kw4ms
         GA6FXKucO7p/8rT5z/z3fANtOkPd5Q2hJi1eAQ2R5JDgRMRO8Pzan7gCfRfhp3dsNJVw
         CofQ==
X-Gm-Message-State: APuU4Z81KtkB1w4YFBl+2hZrNL3IQA/RnvEMXX8ghCeF8YO+xbl4MXGn
	RXh/II7Q2ZRl0qZ4FXAI2UdRGk8KqgCKKd96yer8o/HUnLwUlJUYgbmNlcIHZdsAvHRZD1duDgI
	Uc6XTVjg=
X-Gm-Gg: AYBFou2YhcHIJ/WelF9OiSc3U2j+JpmuY7zvImJplObM5UxbXE/5ghueQ0FTg959PU8
	NB3bqXv27YHnXOepT0F+F4WFHXmEJ9zhHW1xARlCpuWIkS8o/HZz7uAqBeLDkvYh8PXsJBKku/y
	j5rSteoEpdqFKD/KNIMmn8/SPuuS+2+wgBXannjTaAi7GlVGryg/F+iZUvreTrTMdCLLbi/7zHQ
	1PQyoU9WvZRBkWZW+useFGI9TRzy7XFZp2Bi54UZuJLIZ74PI0hyzt/bTPJPUb50/V3x8uNrVKX
	3Hci4DbvbvuKUekochPqPvymBvXs0KIB5+PkhDYcCTsTNhC7dgN1OvoDo5mICAVaN/7q8GAI8GU
	prwOf6VpmsegvS0hP+YyTBOH6IQjP+TIVrh9GrpCA2j8k80Ltv8HHsTX6VGcaQMSxZoYnVpBJyV
	Z48yM0JYlGoZYXqTaQCTBLXFwwlbkuwK1jSUENBzm2orVpo15GqKw7BEiJb3aznNrYuPxURfdM6
	s5aZcEk1mPW2ebuJyLP5sEby3+OGNhcm9IBIKOd8HUpN8FnWw3+i6UjGoF6e5M9cAzYkR8ww1Lx
	9zmL3TAw3Nxdni/RJ1KsOjoaGcc+jt9lVxWI5K7/MEOLQVD3oIENRk4=
X-Received: by 2002:a05:600c:e547:10b0:4b6:2242:d0d5 with SMTP id 5b1f17b1804b1-4b6d82b2be4mr13683645e9.0.1793949845347;
        Thu, 05 Nov 2026 23:24:05 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm3847777eec.23.2026.11.05.23.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 23:24:04 -0800 (PST)
Message-ID: <128d6ee9-4969-4595-8b60-ace1231d6b13@suse.com>
Date: Fri, 6 Nov 2026 15:23:59 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 2/4] ocfs2: switch DIO read path from buffer_head
 to iomap
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261105071930.16399-1-heming.zhao@suse.com>
 <20261105071930.16399-3-heming.zhao@suse.com>
 <sashiko-outbox-198698@kernel.org>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-198698@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 15:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] ocfs2: incorrect 32-bit block limit in ocfs2_iomap_begin()
> - [High] ocfs2: post-EOF blocks treated as -EIO in ocfs2_iomap_begin()
> - [Low] ocfs2: bogus buffered I/O fallback on EOF in ocfs2_file_read_iter()
> --
> 
> commit ffb8137ad877004ee37eafa42d64ca9d92dbc940
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: switch DIO read path from buffer_head to iomap
> 
> This commit migrates the OCFS2 direct I/O read path from the legacy
> buffer_head infrastructure to the iomap framework, introducing
> ocfs2_iomap_begin() and ocfs2_iomap_dio_end_io().
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 0f7502de9b8d1..8e4d31cb85db5 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
> 
> [ ... ]
> 
>> @@ -2534,6 +2535,116 @@ static ssize_t ocfs2_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
>>   				    ocfs2_dio_end_io, 0);
>>   }
>>   
>> +static int ocfs2_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>> +		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
>> +{
>> +	int ret;
>> +	struct ocfs2_map_block map;
>> +	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>> +	u8 blkbits = inode->i_blkbits;
>> +
>> +	if ((offset >> blkbits) > OCFS2_MAX_LOGICAL_BLOCK)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Calculate the first and last logical blocks respectively.
>> +	 */
>> +	map.lblk = offset >> blkbits;
>> +	map.len = min_t(loff_t, (offset + length - 1) >> blkbits,
>> +			OCFS2_MAX_LOGICAL_BLOCK) - map.lblk + 1;
> 
> [Severity: High]
> As reported by Sashiko on RFC v4 [1], does bounding map.lblk and map.len by
> OCFS2_MAX_LOGICAL_BLOCK (0xFFFFFFFF) break O_DIRECT reads on large files when
> cluster size exceeds block size, and allow a zero-length iomap when cluster
> size equals block size?
> 
> In ocfs2_max_file_offset(), block offsets are 64 bits wide while cluster
> counts are 32 bits (capped at UINT_MAX - 1 clusters):
> 
> fs/ocfs2/super.c:ocfs2_max_file_offset() {
> 	/*
> 	 * i_size and all block offsets in ocfs2 are always 64 bits
> 	 * wide. i_clusters is 32 bits, in cluster-sized units. So on
> 	 * 64 bit platforms, cluster size will be the limiting factor.
> 	 */
> 	...
> 	return (((unsigned long long)bytes) << bitshift) - trim;
> }
> 
> When s_clustersize_bits > s_blocksize_bits, valid file offsets below
> s_maxbytes have 64-bit logical block numbers above 0xFFFFFFFF (for example,
> above 16 TiB with 4 KiB blocks and 8 KiB..1 MiB clusters), so checking
> (offset >> blkbits) > OCFS2_MAX_LOGICAL_BLOCK rejects valid O_DIRECT reads
> with -EINVAL.
> 
> Conversely, when s_clustersize_bits == s_blocksize_bits, if an O_DIRECT read
> starts below s_maxbytes (such as at cluster 0xFFFFFFFE) with a buffer
> extending into block 0xFFFFFFFF, __iomap_dio_rw() calls ocfs2_iomap_begin()
> for map.lblk == 0xFFFFFFFF. That passes the <= OCFS2_MAX_LOGICAL_BLOCK check
> and reaches ocfs2_figure_hole_clusters() with v_cluster == UINT_MAX:
> 
> fs/ocfs2/extent_map.c:ocfs2_figure_hole_clusters() {
> 	if (i == le16_to_cpu(el->l_next_free_rec)) {
> 		*num_clusters = UINT_MAX - v_cluster;
> 	}
> }
> 
> Wouldn't that compute *num_clusters = 0 and return iomap->length == 0,
> triggering the WARN_ON_ONCE() in iomap_iter_done() and failing the read with
> -EFAULT?

will follow the comments and change the code.

> 
>> +	map.flags = 0;
>> +
>> +	if (flags & IOMAP_WRITE) {
>> +		return -EOPNOTSUPP;
>> +	} else {
>> +		down_read(&oi->ip_alloc_sem);
>> +		ret = ocfs2_map_blocks(inode, &map, 0);
>> +		up_read(&oi->ip_alloc_sem);
>> +	}
> 
> [Severity: High]
> As reported by Sashiko on RFC v4 [2], what happens when an O_DIRECT read on a
> non-sparse OCFS2 filesystem starts before i_size and extends past the file's
> allocated clusters?
> 
> In __iomap_dio_rw(), iomi.len is initialized to iov_iter_count(iter) without
> clamping to dio->i_size. After mapping the allocated blocks up to EOF,
> iomap_iter() calls ocfs2_iomap_begin() -> ocfs2_map_blocks() for the
> remaining requested range past ip_clusters.
> 
> Because ocfs2_extent_map_get_blocks() sets p_blkno = 0 for blocks beyond
> the allocated extents, ocfs2_map_blocks() hits the non-sparse check:
> 
> fs/ocfs2/aops.c:ocfs2_map_blocks() {
> 	if (!ocfs2_sparse_alloc(osb)) {
> 		if (map->pblk == 0) {
> 			err = -EIO;
> 			mlog(ML_ERROR, ...);
> 			...
> 			dump_stack();
> 			goto bail;
> 		}
> 	}
> }
> 
> In this commit, ocfs2_should_use_dio() also drops the
> !ocfs2_supports_append_dio(osb) fallback for reads extending past i_size
> (which is later restored in 2896188b9850 ("ocfs2: switch dio write path from
> buffer_head to iomap"), though the issue still occurs whenever
> ocfs2_supports_append_dio(osb) is true). Won't short O_DIRECT reads spanning
> EOF on non-sparse filesystems log an error, call dump_stack(), and fail with
> -EIO instead of returning IOMAP_HOLE for the post-EOF tail?

will follow the comments and change the code.
> 
>> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
>> index 8307c4bdc1a9f..94a91c267f2ad 100644
>> --- a/fs/ocfs2/file.c
>> +++ b/fs/ocfs2/file.c
> 
> [ ... ]
> 
>> @@ -2628,17 +2641,48 @@ static ssize_t ocfs2_file_read_iter(struct kiocb *iocb,
>>   	}
>>   	ocfs2_inode_unlock(inode, lock_level);
>>   
>> -	ret = generic_file_read_iter(iocb, to);
>> +	if (direct_io && ocfs2_should_use_dio(iocb, to, inode)) {
>> +		/*
>> +		 * Use the split iomap DIO API so we can tell who owns the
>> +		 * rw_lock on return; reads always hold it at PR level, dropped
>> +		 * by ocfs2_iomap_dio_end_io_pr(). Call it directly rather than
>> +		 * through generic_file_read_iter(): iomap advances iocb->ki_pos
>> +		 * itself, so the generic helper would advance ki_pos twice.
>> +		 */
>> +		struct iomap_dio *dio;
>> +
>> +		dio = __iomap_dio_rw(iocb, to, &ocfs2_iomap_ops,
>> +				&ocfs2_iomap_dio_ops_r_pr, 0, NULL, 0);
>> +		if (dio == NULL) {
>> +			/* No I/O issued; rw_lock still held. */
>> +			ret = 0;
>> +		} else if (IS_ERR(dio)) {
>> +			ret = PTR_ERR(dio);
>> +			if (ret == -EIOCBQUEUED)
>> +				rw_level = -1;
>> +		} else {
>> +			ret = iomap_dio_complete(dio);
>> +			if (ret != 0)
>> +				rw_level = -1;
>> +		}
>> +		/*
>> +		 * A 0 result means the mapping bounced us back to buffered I/O
>> +		 * (e.g. inline data); the rw_lock is still held. Go to the
>> +		 * buffered path rather than re-entering direct I/O.
>> +		 */
>> +		if (ret == 0 && iocb->ki_pos < i_size_read(inode)) {
>> +			iocb->ki_flags &= ~IOCB_DIRECT;
>> +			ret = generic_file_read_iter(iocb, to);
>> +		}
> 
> [Severity: Low]
> As reported by Sashiko on RFC v4 [3], can an O_DIRECT read actually bounce
> back to buffered I/O with ret == 0 here, or does this conflate an EOF read
> with a buffered fallback?
> 
> Inline data is already filtered out by ocfs2_should_use_dio() before calling
> __iomap_dio_rw(), and neither ocfs2_iomap_begin() nor the READ path in
> __iomap_dio_rw() returns -ENOTBLK. As a result, ret == 0 here only happens
> when __iomap_dio_rw() returns NULL because iomi.pos >= dio->i_size at the
> start of the read (and the size == 0 && error == 0 check in
> ocfs2_iomap_dio_end_io() is similarly unreachable for reads).
> 
> If i_size grows concurrently after __iomap_dio_rw() samples dio->i_size,
> won't this check see ret == 0 && iocb->ki_pos < i_size_read(inode), clear
> IOCB_DIRECT, and unexpectedly fall back to buffered I/O via
> generic_file_read_iter()?
> 
> [1] https://lore.kernel.org/r/20261103135605.22943-3-heming.zhao@suse.com
> [2] https://lore.kernel.org/r/20261103135605.22943-3-heming.zhao@suse.com
> [3] https://lore.kernel.org/r/20261103135605.22943-3-heming.zhao@suse.com
> 

```code
                 dio = __iomap_dio_rw(iocb, to, &ocfs2_iomap_ops,
                                 &ocfs2_iomap_dio_ops_r_pr, 0, NULL, 0);
                 if (dio == NULL) {
                         /* No I/O issued; rw_lock still held. */
                         ret = 0;
                 } else if (IS_ERR(dio)) {
                         ret = PTR_ERR(dio);
                         if (ret == -EIOCBQUEUED)
                                 rw_level = -1;
                 } else {
                         ret = iomap_dio_complete(dio);
                         if (ret != 0)
                                 rw_level = -1;
                 }
```

reason:
1. this fallback conflates an EOF read with a buffered fallback.
when the read IO reaches or extends beyand EOF, __iomap_dio_rw() returns
"dio==NULL", this case shouldn't fall back to the buffered path.

2. the other cases for returning "dio==NULL" is when __iomap_dio_rw() jumps to
out_free_dio. As comment says, "no I/O issued, rw_lock still held."
this case also does not need to fall back to the buffered path.

3. If the "else if(IS_ERR(dio)" is true, the this branch makes "ret != 0", so
the buffered read fallback is not taken.

4. the else branch
in ocfs2_iomap_dio_ops_r_pr(), the (size == 0 && error == 0) returns 0, then
iomap_dio_complete() returns 0. whether to allow a fallback to buffered path
in this case is a design decision. the legacy ocfs2_file_read_iter =>
generic_file_read_iter() allows such a fallback, but ext4_dio_read_iter()
doesn't.

To avoid potential races, as above writing, follow the ext4 style and never
fall back to buffered read.

at last, This change has been tested with xfstests. The results are the same
as with the unpatched code.

Thanks,
Heming
